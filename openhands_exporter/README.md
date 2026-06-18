# openhands-exporter

Converts OpenHands conversation export ZIPs into readable Markdown files.

## Usage

Place ZIP exports into `input/`, then run from this directory:

```bash
python3 export_to_markdown.py
```

Output is written to `output/` as `<conversation-id>.md`.

### Options

```
python3 export_to_markdown.py [ZIP_OR_DIR ...] [-o OUTPUT_DIR]
```

- **positional** — one or more ZIP files or directories containing ZIPs (default: `input/`)
- **`-o`** — output directory (default: `output/`)
