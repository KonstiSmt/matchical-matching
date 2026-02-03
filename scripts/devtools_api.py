#!/usr/bin/env python3
"""Super simple DevTools API script.

Usage:
  python3 scripts/devtools_api.py categories
  python3 scripts/devtools_api.py active <category_id>
  python3 scripts/devtools_api.py post <category_id> "comment" <prompt_file> <openai_schema_file> <gemini_schema_file>

Requires .env with:
  MATCHICAL_DEVTOOLS_USERNAME=...
  MATCHICAL_DEVTOOLS_API_KEY=...
Optional:
  MATCHICAL_DEVTOOLS_BASE_URL=...
"""

import json
import os
import sys
from urllib import parse, request
from urllib.error import HTTPError, URLError

ENV_FILE = ".env"

BASE_URL = "MATCHICAL_DEVTOOLS_BASE_URL"
USERNAME = "MATCHICAL_DEVTOOLS_USERNAME"
API_KEY = "MATCHICAL_DEVTOOLS_API_KEY"

DEFAULT_BASE = "https://matchical-dev.outsystems.app/ConsultingAdmin/rest/DevTools"

CATEGORIES_PATH = "/SystemPromtCategories"
ACTIVE_PROMPT_PATH = "/ActiveSystemPrompt"
POST_PROMPT_PATH = "/SystemPrompt"
QUERY_PARAM_CATEGORY_ID = "SystemPromptCategoryId"

# NOTE: The API field is misspelled in the backend: GeminiJsonSchma (missing 'e').
# We send both keys for safety; backend will read the misspelled one.
GEMINI_KEY_PRIMARY = "GeminiJsonSchma"
GEMINI_KEY_FALLBACK = "GeminiJsonSchema"


def load_env_file(path: str) -> None:
    if not os.path.exists(path):
        return
    with open(path, "r", encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith("#") or "=" not in line:
                continue
            key, val = line.split("=", 1)
            if key and key not in os.environ:
                os.environ[key] = val


def env(name: str, default: str | None = None, required: bool = False) -> str:
    value = os.environ.get(name, default)
    if required and not value:
        print(f"Missing required env: {name}", file=sys.stderr)
        sys.exit(2)
    return value or ""


def build_url(path: str, params: dict | None = None) -> str:
    base = env(BASE_URL, DEFAULT_BASE, required=True).rstrip("/")
    url = f"{base}/{path.lstrip('/')}"
    if params:
        url = f"{url}?{parse.urlencode(params)}"
    return url


def opener_with_basic_auth():
    username = env(USERNAME, required=True)
    api_key = env(API_KEY, required=True)

    mgr = request.HTTPPasswordMgrWithDefaultRealm()
    mgr.add_password(None, env(BASE_URL, DEFAULT_BASE, required=True), username, api_key)
    auth_handler = request.HTTPBasicAuthHandler(mgr)
    return request.build_opener(auth_handler)


def http_json(method: str, path: str, params: dict | None = None, payload: dict | None = None):
    url = build_url(path, params=params)
    headers = {"Accept": "application/json"}

    data = None
    if payload is not None:
        data = json.dumps(payload, ensure_ascii=False).encode("utf-8")
        headers["Content-Type"] = "application/json"

    req = request.Request(url, method=method, headers=headers, data=data)

    try:
        with opener_with_basic_auth().open(req, timeout=30) as resp:
            body = resp.read().decode("utf-8", errors="replace")
            if "application/json" in (resp.headers.get("content-type", "").lower()):
                return json.loads(body)
            return body
    except HTTPError as e:
        body = e.read().decode("utf-8", errors="replace")
        raise RuntimeError(f"HTTP {e.code}: {body}") from e
    except URLError as e:
        raise RuntimeError(f"Request failed: {e}") from e


def read_file(path: str) -> str:
    with open(path, "r", encoding="utf-8") as f:
        return f.read()


def usage() -> None:
    print(__doc__.strip())


def main() -> None:
    load_env_file(ENV_FILE)

    if len(sys.argv) < 2:
        usage()
        sys.exit(2)

    action = sys.argv[1].lower()

    if action == "categories":
        data = http_json("GET", CATEGORIES_PATH)
        print(json.dumps(data, ensure_ascii=False, indent=2))
        return

    if action == "active":
        if len(sys.argv) < 3:
            usage()
            sys.exit(2)
        category_id = sys.argv[2]
        data = http_json("GET", ACTIVE_PROMPT_PATH, params={QUERY_PARAM_CATEGORY_ID: category_id})
        print(json.dumps(data, ensure_ascii=False, indent=2))
        return

    if action == "post":
        if len(sys.argv) < 7:
            usage()
            sys.exit(2)
        category_id = sys.argv[2]
        comment = sys.argv[3]
        prompt_file = sys.argv[4]
        openai_schema_file = sys.argv[5]
        gemini_schema_file = sys.argv[6]

        if len(comment) > 500:
            print("Comment exceeds 500 characters.", file=sys.stderr)
            sys.exit(2)

        gemini_payload = read_file(gemini_schema_file)
        payload = {
            "Value": read_file(prompt_file),
            "OpenAIJsonSchema": read_file(openai_schema_file),
            GEMINI_KEY_PRIMARY: gemini_payload,
            GEMINI_KEY_FALLBACK: gemini_payload,
            "Comment": comment,
        }

        data = http_json(
            "POST",
            POST_PROMPT_PATH,
            params={QUERY_PARAM_CATEGORY_ID: category_id},
            payload=payload,
        )
        print(json.dumps(data, ensure_ascii=False, indent=2))
        return

    usage()
    sys.exit(2)


if __name__ == "__main__":
    main()
