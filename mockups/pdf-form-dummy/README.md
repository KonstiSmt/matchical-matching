# PDF Form Filler Dummy

This is a browser-based prototype for filling a form-enabled PDF and downloading the populated output.

## Included Template

- `template.pdf` is the copied Deutsche Bahn sample form.
- The app tries to load this file automatically on startup.

## Run

Start a local static server from the repository root:

```bash
python3 -m http.server 8000
```

Then open:

- <http://localhost:8000/mockups/pdf-form-dummy/>

## Usage

1. Optionally choose another PDF via **Template PDF**.
2. Fill the generated input controls.
3. Click **Download populated PDF**.
4. Optional: enable **Flatten output** if the receiving side should get a read-only PDF.
5. Check **Mapping log** at the bottom for ordered key mapping.

## Notes

- The UI inspects both AcroForm roots and page widgets, so hidden/reference fields are included.
- The output keeps the original template layout and updates only form values.
