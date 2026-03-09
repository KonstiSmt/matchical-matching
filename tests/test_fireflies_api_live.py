from __future__ import annotations

import os
import sys
import unittest
from datetime import datetime, timezone
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))

from scripts.fireflies_sync import FirefliesClient, load_main_checkout_env


class FirefliesLiveApiTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        load_main_checkout_env()
        api_key = os.environ.get("FIREFLIES_API_KEY", "").strip()
        if not api_key:
            raise unittest.SkipTest("FIREFLIES_API_KEY is not configured.")
        cls.client = FirefliesClient(api_key)
        cls.from_date_iso = "2024-01-01T00:00:00Z"
        cls.to_date_iso = datetime.now(timezone.utc).isoformat(timespec="seconds").replace("+00:00", "Z")

    def test_list_query_returns_expected_shape(self) -> None:
        transcripts = self.client.list_transcripts_page(
            from_date_iso=self.from_date_iso,
            to_date_iso=self.to_date_iso,
            limit=2,
            skip=0,
            mine=True,
        )
        self.assertIsInstance(transcripts, list)
        self.assertGreater(len(transcripts), 0)
        first = transcripts[0]
        self.assertIn("id", first)
        self.assertIn("title", first)
        self.assertIn("date", first)

    def test_pagination_parameters_work(self) -> None:
        first_page = self.client.list_transcripts_page(
            from_date_iso=self.from_date_iso,
            to_date_iso=self.to_date_iso,
            limit=1,
            skip=0,
            mine=True,
        )
        second_page = self.client.list_transcripts_page(
            from_date_iso=self.from_date_iso,
            to_date_iso=self.to_date_iso,
            limit=1,
            skip=1,
            mine=True,
        )
        self.assertLessEqual(len(first_page), 1)
        self.assertLessEqual(len(second_page), 1)
        if first_page and second_page:
            self.assertNotEqual(first_page[0]["id"], second_page[0]["id"])

    def test_transcript_detail_query_succeeds_for_listed_id(self) -> None:
        transcripts = self.client.list_transcripts_page(
            from_date_iso=self.from_date_iso,
            to_date_iso=self.to_date_iso,
            limit=1,
            skip=0,
            mine=True,
        )
        self.assertGreater(len(transcripts), 0)
        transcript = self.client.get_transcript(transcripts[0]["id"])
        self.assertEqual(transcript["id"], transcripts[0]["id"])
        self.assertIn("sentences", transcript)


if __name__ == "__main__":
    unittest.main()
