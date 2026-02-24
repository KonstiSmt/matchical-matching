# Data Quality Dashboard Output

Build the Excel MVP dashboard from the tenant raw export:

```bash
./.venv/bin/python scripts/build_data_quality_excel_dashboard.py \
  --input output/data-quality/BIT-raw-updated.xlsx \
  --output output/data-quality/BIT-DataQuality-Dashboard.xlsx
```

Notes:
- The script targets Microsoft 365 / Excel 2021+ functions.
- `Weighted` is the default metric view on the dashboard.
- Filter controls are on the `Dashboard` sheet.
