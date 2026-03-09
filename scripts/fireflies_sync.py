#!/usr/bin/env python3
"""Sync Fireflies meeting transcripts into the repository."""

from __future__ import annotations

import argparse
import json
import os
import re
import subprocess
import sys
from collections import Counter
from dataclasses import dataclass
from datetime import date, datetime, time, timedelta, timezone
from pathlib import Path
from typing import Any, Iterable
from urllib.parse import urlparse

import requests

API_URL = "https://api.fireflies.ai/graphql"
DEFAULT_PAGE_LIMIT = 50
DEFAULT_DELTA_OVERLAP_DAYS = 7
DEFAULT_INTERNAL_DOMAINS = {"matchical.com"}
PERSONAL_EMAIL_DOMAINS = {
    "aol.com",
    "gmx.com",
    "gmx.de",
    "googlemail.com",
    "hey.com",
    "hotmail.com",
    "icloud.com",
    "live.com",
    "me.com",
    "outlook.com",
    "proton.me",
    "protonmail.com",
    "web.de",
    "yahoo.com",
}
SECOND_LEVEL_PUBLIC_SUFFIXES = {"ac", "co", "com", "gov", "net", "org"}
CATEGORY_KEYWORDS: dict[str, tuple[str, ...]] = {
    "planning": (
        "plan",
        "planning",
        "roadmap",
        "kickoff",
        "kick-off",
        "retro",
        "retrospective",
        "brainstorm",
        "strategy",
    ),
    "sales": (
        "sales",
        "discovery",
        "demo",
        "pipeline",
        "pricing",
        "proposal",
        "prospect",
        "intro",
        "pitch",
    ),
    "delivery": (
        "delivery",
        "project",
        "implementation",
        "sprint",
        "standup",
        "stand-up",
        "status",
        "review",
        "backlog",
    ),
    "operations": (
        "operations",
        "ops",
        "admin",
        "finance",
        "legal",
        "compliance",
        "invoice",
        "hiring",
        "recruit",
        "process",
    ),
}
EMPTY_STATE = {
    "imported_transcript_ids": [],
    "latest_imported_meeting_at": None,
    "delta_cursor_at": None,
}
TRANSCRIPTS_PAGE_QUERY = """
query Transcripts($fromDate: DateTime, $toDate: DateTime, $limit: Int!, $skip: Int!, $mine: Boolean) {
  transcripts(fromDate: $fromDate, toDate: $toDate, limit: $limit, skip: $skip, mine: $mine) {
    id
    title
    date
    dateString
    duration
    host_email
    organizer_email
    participants
    transcript_url
    meeting_link
    meeting_attendees {
      displayName
      email
      name
      location
    }
  }
}
"""
TRANSCRIPT_DETAIL_QUERY = """
query Transcript($transcriptId: String!) {
  transcript(id: $transcriptId) {
    id
    title
    date
    dateString
    duration
    host_email
    organizer_email
    participants
    transcript_url
    meeting_link
    audio_url
    video_url
    fireflies_users
    workspace_users
    meeting_attendees {
      displayName
      email
      name
      location
    }
    meeting_attendance {
      name
      join_time
      leave_time
    }
    sentences {
      index
      speaker_name
      speaker_id
      text
      raw_text
      start_time
      end_time
    }
  }
}
"""


@dataclass
class AccountRecord:
    slug: str
    path: Path
    display_name: str
    account_name: str
    aliases: set[str]
    contact_names: set[str]
    domain: str | None


@dataclass
class RoutingDecision:
    meeting_kind: str
    destination_dir: Path
    account_slug: str | None
    dominant_domain: str | None


class FirefliesError(RuntimeError):
    """Raised for Fireflies API failures."""


class FirefliesClient:
    def __init__(self, api_key: str, *, timeout_seconds: int = 60) -> None:
        self.api_key = api_key
        self.timeout_seconds = timeout_seconds

    def graphql(self, query: str, variables: dict[str, Any]) -> dict[str, Any]:
        response = requests.post(
            API_URL,
            headers={
                "Authorization": f"Bearer {self.api_key}",
                "Content-Type": "application/json",
            },
            json={"query": query, "variables": variables},
            timeout=self.timeout_seconds,
        )
        response.raise_for_status()
        payload = response.json()

        if payload.get("errors"):
            raise FirefliesError(json.dumps(payload["errors"], ensure_ascii=False))
        if "data" not in payload:
            raise FirefliesError("Missing data field in Fireflies response.")
        return payload["data"]

    def list_transcripts_page(
        self,
        *,
        from_date_iso: str | None,
        to_date_iso: str | None,
        limit: int = DEFAULT_PAGE_LIMIT,
        skip: int = 0,
        mine: bool = True,
    ) -> list[dict[str, Any]]:
        variables = {
            "fromDate": from_date_iso,
            "toDate": to_date_iso,
            "limit": limit,
            "skip": skip,
            "mine": mine,
        }
        data = self.graphql(TRANSCRIPTS_PAGE_QUERY, variables)
        transcripts = data.get("transcripts") or []
        if not isinstance(transcripts, list):
            raise FirefliesError("Unexpected transcripts response shape.")
        return transcripts

    def list_transcripts(
        self,
        *,
        from_date_iso: str | None,
        to_date_iso: str | None,
        limit: int = DEFAULT_PAGE_LIMIT,
        mine: bool = True,
    ) -> list[dict[str, Any]]:
        results: list[dict[str, Any]] = []
        skip = 0
        while True:
            page = self.list_transcripts_page(
                from_date_iso=from_date_iso,
                to_date_iso=to_date_iso,
                limit=limit,
                skip=skip,
                mine=mine,
            )
            if not page:
                break
            results.extend(page)
            if len(page) < limit:
                break
            skip += limit
        return results

    def get_transcript(self, transcript_id: str) -> dict[str, Any]:
        data = self.graphql(TRANSCRIPT_DETAIL_QUERY, {"transcriptId": transcript_id})
        transcript = data.get("transcript")
        if not isinstance(transcript, dict):
            raise FirefliesError(f"Unexpected transcript response shape for {transcript_id}.")
        return transcript


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Sync Fireflies transcripts into the repo")
    subparsers = parser.add_subparsers(dest="command", required=True)

    backfill_parser = subparsers.add_parser("backfill", help="Import a bounded historical window")
    backfill_parser.add_argument("--from", dest="from_date", required=True, help="Inclusive start date (YYYY-MM-DD)")
    backfill_parser.add_argument("--to", dest="to_date", required=True, help="Inclusive end date (YYYY-MM-DD)")
    backfill_parser.add_argument(
        "--page-limit",
        type=int,
        default=DEFAULT_PAGE_LIMIT,
        help="Fireflies page size (max 50)",
    )

    delta_parser = subparsers.add_parser("delta", help="Import meetings newer than the saved cursor")
    delta_parser.add_argument(
        "--page-limit",
        type=int,
        default=DEFAULT_PAGE_LIMIT,
        help="Fireflies page size (max 50)",
    )
    delta_parser.add_argument(
        "--overlap-days",
        type=int,
        default=DEFAULT_DELTA_OVERLAP_DAYS,
        help="Overlap window used when querying the delta cursor",
    )

    return parser.parse_args()


def run_git_command(args: list[str]) -> str:
    return subprocess.check_output(args, text=True).strip()


def repo_root() -> Path:
    return Path(run_git_command(["git", "rev-parse", "--show-toplevel"]))


def main_checkout_root() -> Path:
    common_dir = Path(run_git_command(["git", "rev-parse", "--git-common-dir"]))
    if common_dir.name == ".git":
        return common_dir.parent
    return repo_root()


def load_env_file(path: Path) -> None:
    if not path.exists():
        return
    for raw_line in path.read_text(encoding="utf-8").splitlines():
        line = raw_line.strip()
        if not line or line.startswith("#") or "=" not in line:
            continue
        key, value = line.split("=", 1)
        key = key.strip()
        value = value.strip()
        if value.startswith(("'", '"')) and value.endswith(("'", '"')) and len(value) >= 2:
            value = value[1:-1]
        if key and key not in os.environ:
            os.environ[key] = value


def load_main_checkout_env() -> Path:
    env_path = main_checkout_root() / ".env"
    load_env_file(env_path)
    return env_path


def env(name: str, *, required: bool = False) -> str:
    value = os.environ.get(name, "").strip()
    if required and not value:
        raise SystemExit(f"Missing required environment variable: {name}")
    return value


def state_file_path() -> Path:
    return repo_root() / "tmp" / "fireflies-sync-state.json"


def load_state(path: Path) -> dict[str, Any]:
    if not path.exists():
        return dict(EMPTY_STATE)
    data = json.loads(path.read_text(encoding="utf-8"))
    state = dict(EMPTY_STATE)
    state.update(data)
    imported_ids = state.get("imported_transcript_ids") or []
    state["imported_transcript_ids"] = list(dict.fromkeys(str(item) for item in imported_ids))
    return state


def save_state(path: Path, state: dict[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temp_path = path.with_suffix(".tmp")
    temp_path.write_text(json.dumps(state, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    temp_path.replace(path)


def parse_iso_date(value: str) -> date:
    try:
        return date.fromisoformat(value)
    except ValueError as exc:
        raise SystemExit(f"Invalid date: {value}. Expected YYYY-MM-DD.") from exc


def parse_datetime_value(value: Any) -> datetime | None:
    if value is None:
        return None
    if isinstance(value, (int, float)):
        return datetime.fromtimestamp(float(value) / 1000.0, tz=timezone.utc)
    if isinstance(value, str) and value:
        try:
            return datetime.fromisoformat(value.replace("Z", "+00:00"))
        except ValueError:
            return None
    return None


def to_utc_iso(value: datetime) -> str:
    return value.astimezone(timezone.utc).isoformat(timespec="seconds").replace("+00:00", "Z")


def start_of_day_utc(value: date) -> datetime:
    return datetime.combine(value, time.min, tzinfo=timezone.utc)


def end_of_day_exclusive_utc(value: date) -> datetime:
    return datetime.combine(value + timedelta(days=1), time.min, tzinfo=timezone.utc)


def normalize_host(value: str | None) -> str | None:
    if not value:
        return None
    raw = value.strip().lower()
    if not raw:
        return None
    parsed = urlparse(raw if "://" in raw else f"https://{raw}")
    host = parsed.netloc or parsed.path
    host = host.split("@")[-1].split(":")[0].strip(".")
    return host or None


def apex_domain(host: str | None) -> str | None:
    if not host:
        return None
    parts = [part for part in host.lower().split(".") if part]
    if len(parts) <= 2:
        return ".".join(parts)
    if len(parts[-1]) == 2 and parts[-2] in SECOND_LEVEL_PUBLIC_SUFFIXES and len(parts) >= 3:
        return ".".join(parts[-3:])
    return ".".join(parts[-2:])


def slugify(value: str) -> str:
    normalized = re.sub(r"[^a-z0-9]+", "-", value.lower())
    normalized = normalized.strip("-")
    return normalized or "meeting"


def account_name_from_domain(domain: str) -> str:
    label = apex_domain(domain) or domain
    root_label = label.split(".")[0]
    words = [part for part in root_label.replace("-", " ").split() if part]
    if not words:
        return label.upper()
    return " ".join(word.upper() if word.isupper() else word.capitalize() for word in words)


def account_slug_from_domain(domain: str) -> str:
    label = apex_domain(domain) or domain
    root_label = label.split(".")[0]
    return slugify(root_label)


def normalize_email_domain(email: str | None) -> str | None:
    if not email or "@" not in email:
        return None
    return apex_domain(email.rsplit("@", 1)[1].strip().lower())


def internal_domains() -> set[str]:
    configured = os.environ.get("FIREFLIES_INTERNAL_DOMAINS", "")
    values = {item.strip().lower() for item in configured.split(",") if item.strip()}
    return values or set(DEFAULT_INTERNAL_DOMAINS)


def is_personal_email_domain(domain: str | None) -> bool:
    return bool(domain and domain in PERSONAL_EMAIL_DOMAINS)


def normalize_match_text(value: str) -> str:
    return re.sub(r"\s+", " ", re.sub(r"[^a-z0-9]+", " ", value.lower())).strip()


def contains_normalized_phrase(haystack: str, needle: str) -> bool:
    return bool(needle) and f" {needle} " in f" {haystack} "


def read_account_domain(account_md_path: Path) -> str | None:
    for raw_line in account_md_path.read_text(encoding="utf-8").splitlines():
        line = raw_line.strip()
        if line.startswith("- domain:"):
            return normalize_host(line.split(":", 1)[1].strip())
    return None


def read_markdown_field(path: Path, field_name: str) -> str | None:
    prefix = f"- {field_name}:"
    for raw_line in path.read_text(encoding="utf-8").splitlines():
        line = raw_line.strip()
        if line.startswith(prefix):
            return line.split(":", 1)[1].strip()
    return None


def load_account_index(root: Path) -> dict[str, AccountRecord]:
    accounts: dict[str, AccountRecord] = {}
    accounts_root = root / "crm" / "accounts"
    if not accounts_root.exists():
        return accounts

    for account_md in sorted(accounts_root.glob("*/account.md")):
        slug = account_md.parent.name
        domain = read_account_domain(account_md)
        account_name = read_markdown_field(account_md, "account_name") or slug.replace("-", " ").title()
        aliases: set[str] = set()
        normalized = normalize_host(domain)
        if normalized:
            aliases.add(normalized)
            base = apex_domain(normalized)
            if base:
                aliases.add(base)
        contact_names = {
            contact_name
            for contact_md in sorted((account_md.parent / "contacts").glob("*.md"))
            for contact_name in [read_markdown_field(contact_md, "full_name")]
            if contact_name
        }
        accounts[slug] = AccountRecord(
            slug=slug,
            path=account_md.parent,
            display_name=slug.replace("-", " ").title(),
            account_name=account_name,
            aliases=aliases,
            contact_names=contact_names,
            domain=normalized,
        )
    return accounts


def index_accounts_by_alias(accounts: dict[str, AccountRecord]) -> dict[str, AccountRecord]:
    alias_index: dict[str, AccountRecord] = {}
    for record in accounts.values():
        for alias in record.aliases:
            alias_index.setdefault(alias, record)
    return alias_index


def pick_meeting_datetime(transcript: dict[str, Any]) -> datetime | None:
    return parse_datetime_value(transcript.get("date")) or parse_datetime_value(transcript.get("dateString"))


def meeting_date_slug(transcript: dict[str, Any]) -> str:
    meeting_at = transcript_started_at(transcript) or pick_meeting_datetime(transcript)
    if meeting_at is None:
        return "unknown-date"
    return meeting_at.astimezone(timezone.utc).date().isoformat()


def transcript_title(transcript: dict[str, Any]) -> str:
    raw_title = (transcript.get("title") or "").strip()
    return raw_title or f"fireflies-transcript-{transcript['id']}"


def topic_slug(transcript: dict[str, Any]) -> str:
    title_slug = slugify(transcript_title(transcript))
    return title_slug[:80].strip("-") or transcript["id"][:12].lower()


def extract_attendees(transcript: dict[str, Any]) -> list[dict[str, str]]:
    attendees: list[dict[str, str]] = []
    seen_keys: set[tuple[str, str]] = set()

    for attendee in transcript.get("meeting_attendees") or []:
        if not isinstance(attendee, dict):
            continue
        name = str(attendee.get("displayName") or attendee.get("name") or "").strip()
        email = str(attendee.get("email") or "").strip().lower()
        key = (name, email)
        if key not in seen_keys:
            attendees.append({"name": name, "email": email})
            seen_keys.add(key)

    for field in ("host_email", "organizer_email"):
        email = str(transcript.get(field) or "").strip().lower()
        if not email:
            continue
        key = ("", email)
        if key not in seen_keys:
            attendees.append({"name": "", "email": email})
            seen_keys.add(key)

    participant_emails = transcript.get("participants") or []
    for participant_email in participant_emails:
        email = str(participant_email or "").strip().lower()
        if not email:
            continue
        key = ("", email)
        if key not in seen_keys:
            attendees.append({"name": "", "email": email})
            seen_keys.add(key)

    return attendees


def attendee_email_domains(attendees: Iterable[dict[str, str]]) -> list[str]:
    return [
        domain
        for attendee in attendees
        for domain in [normalize_email_domain(attendee.get("email"))]
        if domain
    ]


def detected_domains_from_attendees(attendees: Iterable[dict[str, str]]) -> list[str]:
    return sorted(set(attendee_email_domains(attendees)))


def dominant_external_domain(domains: Iterable[str], *, internal_domain_set: set[str]) -> str | None:
    counts = Counter(
        domain
        for domain in domains
        if domain not in internal_domain_set and not is_personal_email_domain(domain)
    )
    if not counts:
        return None
    top_two = counts.most_common(2)
    if len(top_two) > 1 and top_two[0][1] == top_two[1][1]:
        return None
    return top_two[0][0]


def categorize_meeting(transcript: dict[str, Any]) -> tuple[str, str]:
    text_parts = [transcript_title(transcript).lower()]
    sentences = transcript.get("sentences") or []
    for sentence in sentences[:12]:
        if not isinstance(sentence, dict):
            continue
        text = str(sentence.get("text") or sentence.get("raw_text") or "").lower()
        if text:
            text_parts.append(text)
    haystack = " ".join(text_parts)

    matches = Counter()
    for category, keywords in CATEGORY_KEYWORDS.items():
        for keyword in keywords:
            if keyword in haystack:
                matches[category] += 1

    if not matches:
        return "general", "default"
    category = matches.most_common(1)[0][0]
    return category, "keyword"


def match_account_from_transcript_text(
    transcript: dict[str, Any],
    accounts_by_slug: dict[str, AccountRecord],
) -> AccountRecord | None:
    evidence_parts = [transcript_title(transcript)]
    for attendance in transcript.get("meeting_attendance") or []:
        if not isinstance(attendance, dict):
            continue
        name = str(attendance.get("name") or "").strip()
        if name:
            evidence_parts.append(name)
    for sentence in (transcript.get("sentences") or [])[:20]:
        if not isinstance(sentence, dict):
            continue
        text = str(sentence.get("text") or sentence.get("raw_text") or "").strip()
        if text:
            evidence_parts.append(text)

    haystack = normalize_match_text(" ".join(evidence_parts))
    best_record: AccountRecord | None = None
    best_score = 0
    has_tie = False

    for record in accounts_by_slug.values():
        score = 0
        if contains_normalized_phrase(haystack, normalize_match_text(record.account_name)):
            score += 2
        for contact_name in record.contact_names:
            if contains_normalized_phrase(haystack, normalize_match_text(contact_name)):
                score += 3
        if score > best_score:
            best_record = record
            best_score = score
            has_tie = False
        elif score and score == best_score:
            has_tie = True

    if best_score and not has_tie:
        return best_record
    return None


def render_transcript_markdown(transcript: dict[str, Any]) -> str:
    sentences = transcript.get("sentences") or []
    rendered_lines = [f"# {transcript_title(transcript)}", ""]

    for sentence in sentences:
        if not isinstance(sentence, dict):
            continue
        speaker = str(sentence.get("speaker_name") or "Unknown speaker").strip() or "Unknown speaker"
        raw_text = str(sentence.get("raw_text") or sentence.get("text") or "").strip()
        text = re.sub(r"\s+", " ", raw_text)
        if not text:
            continue
        start_time = format_seconds(sentence.get("start_time"))
        end_time = format_seconds(sentence.get("end_time"))
        if start_time and end_time:
            rendered_lines.append(f"**{speaker}** [{start_time} - {end_time}]: {text}")
        elif start_time:
            rendered_lines.append(f"**{speaker}** [{start_time}]: {text}")
        else:
            rendered_lines.append(f"**{speaker}**: {text}")

    if len(rendered_lines) == 2:
        raise FirefliesError(f"Transcript {transcript['id']} returned no sentence data.")

    rendered_lines.append("")
    return "\n".join(rendered_lines)


def format_seconds(value: Any) -> str | None:
    if value is None:
        return None
    try:
        total_seconds = int(float(value))
    except (TypeError, ValueError):
        return None
    hours, remainder = divmod(total_seconds, 3600)
    minutes, seconds = divmod(remainder, 60)
    if hours:
        return f"{hours:02d}:{minutes:02d}:{seconds:02d}"
    return f"{minutes:02d}:{seconds:02d}"


def build_metadata(
    transcript: dict[str, Any],
    *,
    attendees: list[dict[str, str]],
    decision: RoutingDecision,
    category: str,
    category_source: str,
) -> dict[str, Any]:
    meeting_at = transcript_started_at(transcript) or pick_meeting_datetime(transcript)
    transcript_created_at = pick_meeting_datetime(transcript)
    return {
        "transcript_id": transcript["id"],
        "meeting_id": transcript.get("id"),
        "title": transcript_title(transcript),
        "meeting_at": to_utc_iso(meeting_at) if meeting_at else None,
        "transcript_created_at": to_utc_iso(transcript_created_at) if transcript_created_at else None,
        "duration_minutes": transcript.get("duration"),
        "participants": attendees,
        "detected_domains": detected_domains_from_attendees(attendees),
        "transcript_url": transcript.get("transcript_url"),
        "meeting_link": transcript.get("meeting_link"),
        "audio_url": transcript.get("audio_url"),
        "video_url": transcript.get("video_url"),
        "local_imported_at": to_utc_iso(datetime.now(timezone.utc)),
        "meeting_kind": decision.meeting_kind,
        "category": category,
        "category_source": category_source,
        "account_slug": decision.account_slug,
        "dominant_domain": decision.dominant_domain,
    }


def transcript_started_at(transcript: dict[str, Any]) -> datetime | None:
    join_times = []
    for attendance in transcript.get("meeting_attendance") or []:
        if not isinstance(attendance, dict):
            continue
        parsed = parse_datetime_value(attendance.get("join_time"))
        if parsed is not None:
            join_times.append(parsed)
    return min(join_times) if join_times else None


def unique_account_slug(domain: str, accounts_by_slug: dict[str, AccountRecord]) -> str:
    base_slug = account_slug_from_domain(domain)
    if base_slug not in accounts_by_slug:
        return base_slug

    full_domain_slug = slugify((apex_domain(domain) or domain).replace(".", "-"))
    if full_domain_slug not in accounts_by_slug:
        return full_domain_slug

    suffix = 2
    while f"{base_slug}-{suffix}" in accounts_by_slug:
        suffix += 1
    return f"{base_slug}-{suffix}"


def ensure_minimal_account(
    root: Path,
    *,
    slug: str,
    domain: str,
    now: datetime,
) -> AccountRecord:
    account_root = root / "crm" / "accounts" / slug
    account_root.mkdir(parents=True, exist_ok=True)
    account_md = account_root / "account.md"
    if not account_md.exists():
        account_md.write_text(
            "\n".join(
                [
                    f"# {account_name_from_domain(domain)} account",
                    "",
                    "## Metadata",
                    "",
                    f"- account_name: {account_name_from_domain(domain)}",
                    f"- domain: https://{apex_domain(domain) or domain}",
                    "- status: auto-created from Fireflies import",
                    f"- last_updated: {now.date().isoformat()}",
                    "",
                    "## Notes",
                    "",
                    "- This account folder was auto-created from Fireflies meeting import and should be refined manually later.",
                    "",
                ]
            ),
            encoding="utf-8",
        )
    return AccountRecord(
        slug=slug,
        path=account_root,
        display_name=account_name_from_domain(domain),
        account_name=account_name_from_domain(domain),
        aliases={alias for alias in {normalize_host(domain), apex_domain(domain)} if alias},
        contact_names=set(),
        domain=apex_domain(domain) or normalize_host(domain),
    )


def route_transcript(
    transcript: dict[str, Any],
    *,
    root: Path,
    accounts_by_alias: dict[str, AccountRecord],
    accounts_by_slug: dict[str, AccountRecord],
) -> RoutingDecision:
    attendees = extract_attendees(transcript)
    domains = detected_domains_from_attendees(attendees)
    attendee_domains = attendee_email_domains(attendees)
    internal_domain_set = internal_domains()
    internal_email_count = len(
        {
            attendee.get("email", "").strip().lower()
            for attendee in attendees
            if normalize_email_domain(attendee.get("email")) in internal_domain_set
        }
    )
    dominant_domain = dominant_external_domain(attendee_domains, internal_domain_set=internal_domain_set)
    transcript_id = transcript["id"]
    date_part = meeting_date_slug(transcript)
    topic_part = topic_slug(transcript)

    if dominant_domain and dominant_domain in accounts_by_alias:
        record = accounts_by_alias[dominant_domain]
        return RoutingDecision(
            meeting_kind="client",
            destination_dir=root / "crm" / "accounts" / record.slug / "meetings" / f"{date_part}-{topic_part}",
            account_slug=record.slug,
            dominant_domain=dominant_domain,
        )

    if dominant_domain:
        record = ensure_minimal_account(
            root,
            slug=unique_account_slug(dominant_domain, accounts_by_slug),
            domain=dominant_domain,
            now=datetime.now(timezone.utc),
        )
        accounts_by_slug[record.slug] = record
        for alias in record.aliases:
            accounts_by_alias.setdefault(alias, record)
        return RoutingDecision(
            meeting_kind="client",
            destination_dir=root / "crm" / "accounts" / record.slug / "meetings" / f"{date_part}-{topic_part}",
            account_slug=record.slug,
            dominant_domain=dominant_domain,
        )

    matched_record = match_account_from_transcript_text(transcript, accounts_by_slug)
    if matched_record is not None:
        return RoutingDecision(
            meeting_kind="client",
            destination_dir=root / "crm" / "accounts" / matched_record.slug / "meetings" / f"{date_part}-{topic_part}",
            account_slug=matched_record.slug,
            dominant_domain=None,
        )

    if domains and all(domain in internal_domain_set for domain in domains) and internal_email_count >= 2:
        return RoutingDecision(
            meeting_kind="internal",
            destination_dir=root
            / "docs"
            / "internal-meetings"
            / f"{date_part}-{topic_part}-{transcript_id[:8].lower()}",
            account_slug=None,
            dominant_domain=None,
        )

    return RoutingDecision(
        meeting_kind="unresolved",
        destination_dir=root / "crm" / "inbox" / "meetings" / f"{date_part}-{topic_part}-{transcript_id[:8].lower()}",
        account_slug=None,
        dominant_domain=dominant_domain,
    )


def resolve_destination(destination_dir: Path, transcript_id: str) -> Path:
    if not destination_dir.exists():
        return destination_dir

    metadata_path = destination_dir / "metadata.json"
    if metadata_path.exists():
        try:
            existing = json.loads(metadata_path.read_text(encoding="utf-8"))
        except json.JSONDecodeError:
            existing = {}
        if existing.get("transcript_id") == transcript_id:
            return destination_dir

    return destination_dir.with_name(f"{destination_dir.name}-{transcript_id[:8].lower()}")


def update_state_after_import(state: dict[str, Any], transcript: dict[str, Any]) -> None:
    transcript_id = transcript["id"]
    imported_ids = set(state.get("imported_transcript_ids") or [])
    imported_ids.add(transcript_id)
    state["imported_transcript_ids"] = sorted(imported_ids)

    meeting_at = pick_meeting_datetime(transcript)
    if meeting_at is not None:
        existing = parse_datetime_value(state.get("latest_imported_meeting_at"))
        if existing is None or meeting_at > existing:
            state["latest_imported_meeting_at"] = to_utc_iso(meeting_at)


def import_transcript(
    transcript: dict[str, Any],
    *,
    root: Path,
    state: dict[str, Any],
    state_path: Path,
    accounts_by_alias: dict[str, AccountRecord],
    accounts_by_slug: dict[str, AccountRecord],
) -> Path:
    decision = route_transcript(
        transcript,
        root=root,
        accounts_by_alias=accounts_by_alias,
        accounts_by_slug=accounts_by_slug,
    )
    category, category_source = categorize_meeting(transcript)
    attendees = extract_attendees(transcript)
    metadata = build_metadata(
        transcript,
        attendees=attendees,
        decision=decision,
        category=category,
        category_source=category_source,
    )
    destination_dir = resolve_destination(decision.destination_dir, transcript["id"])
    destination_dir.mkdir(parents=True, exist_ok=True)
    (destination_dir / "transcript.md").write_text(render_transcript_markdown(transcript), encoding="utf-8")
    (destination_dir / "metadata.json").write_text(
        json.dumps(metadata, ensure_ascii=False, indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
    )
    update_state_after_import(state, transcript)
    save_state(state_path, state)
    return destination_dir


def import_window(
    client: FirefliesClient,
    *,
    root: Path,
    state: dict[str, Any],
    state_path: Path,
    from_date_iso: str | None,
    to_date_iso: str | None,
    page_limit: int,
    update_delta_cursor_at_end: bool,
) -> int:
    accounts_by_slug = load_account_index(root)
    accounts_by_alias = index_accounts_by_alias(accounts_by_slug)
    imported_ids = set(state.get("imported_transcript_ids") or [])
    transcripts = client.list_transcripts(
        from_date_iso=from_date_iso,
        to_date_iso=to_date_iso,
        limit=page_limit,
        mine=True,
    )
    successes = 0
    failures: list[str] = []

    for summary in transcripts:
        transcript_id = str(summary.get("id") or "").strip()
        if not transcript_id or transcript_id in imported_ids:
            continue

        print(f"Importing {transcript_id} - {summary.get('title') or 'untitled'}")
        try:
            detail = client.get_transcript(transcript_id)
            destination = import_transcript(
                detail,
                root=root,
                state=state,
                state_path=state_path,
                accounts_by_alias=accounts_by_alias,
                accounts_by_slug=accounts_by_slug,
            )
            imported_ids.add(transcript_id)
            successes += 1
            print(f"  wrote {destination.relative_to(root)}")
        except Exception as exc:  # noqa: BLE001
            failures.append(f"{transcript_id}: {exc}")
            print(f"  failed: {exc}", file=sys.stderr)

    if update_delta_cursor_at_end and not failures:
        state["delta_cursor_at"] = to_utc_iso(datetime.now(timezone.utc))
        save_state(state_path, state)

    if failures:
        raise SystemExit("One or more transcript imports failed:\n" + "\n".join(failures))

    return successes


def backfill_command(args: argparse.Namespace) -> int:
    from_date = parse_iso_date(args.from_date)
    to_date = parse_iso_date(args.to_date)
    if from_date > to_date:
        raise SystemExit("--from must be on or before --to.")
    if not 1 <= args.page_limit <= DEFAULT_PAGE_LIMIT:
        raise SystemExit("--page-limit must be between 1 and 50.")

    load_main_checkout_env()
    client = FirefliesClient(env("FIREFLIES_API_KEY", required=True))
    state_path = state_file_path()
    state = load_state(state_path)

    successes = import_window(
        client,
        root=repo_root(),
        state=state,
        state_path=state_path,
        from_date_iso=to_utc_iso(start_of_day_utc(from_date)),
        to_date_iso=to_utc_iso(end_of_day_exclusive_utc(to_date)),
        page_limit=args.page_limit,
        update_delta_cursor_at_end=False,
    )
    print(f"Imported {successes} transcripts.")
    return 0


def delta_command(args: argparse.Namespace) -> int:
    if not 1 <= args.page_limit <= DEFAULT_PAGE_LIMIT:
        raise SystemExit("--page-limit must be between 1 and 50.")
    if args.overlap_days < 0:
        raise SystemExit("--overlap-days must be zero or positive.")

    load_main_checkout_env()
    client = FirefliesClient(env("FIREFLIES_API_KEY", required=True))
    state_path = state_file_path()
    state = load_state(state_path)

    cursor = parse_datetime_value(state.get("delta_cursor_at")) or parse_datetime_value(state.get("latest_imported_meeting_at"))
    if cursor is None:
        raise SystemExit("No sync cursor found. Run backfill first.")

    from_date = cursor - timedelta(days=args.overlap_days)
    successes = import_window(
        client,
        root=repo_root(),
        state=state,
        state_path=state_path,
        from_date_iso=to_utc_iso(from_date),
        to_date_iso=None,
        page_limit=args.page_limit,
        update_delta_cursor_at_end=True,
    )
    print(f"Imported {successes} transcripts.")
    return 0


def main() -> int:
    args = parse_args()
    if args.command == "backfill":
        return backfill_command(args)
    if args.command == "delta":
        return delta_command(args)
    raise SystemExit(f"Unsupported command: {args.command}")


if __name__ == "__main__":
    raise SystemExit(main())
