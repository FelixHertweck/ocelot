#!/usr/bin/env python3
"""OCELOT Eval-Harness — LLM-based evaluation of collected run artifacts."""
import argparse
import json
import os
import sys
from pathlib import Path

try:
    from openai import OpenAI
except ImportError:
    print("ERROR: openai not installed. Run: pip install openai", file=sys.stderr)
    sys.exit(1)

SCRIPT_DIR = Path(__file__).parent
sys.path.insert(0, str(SCRIPT_DIR))

from lib.config import load as load_config

DEFAULT_EXTRACTION_PROMPT = SCRIPT_DIR / "prompts" / "extraction.md"
DEFAULT_SYNTHESIS_PROMPT = SCRIPT_DIR / "prompts" / "synthesis.md"
DEFAULT_TEMPLATE = SCRIPT_DIR / "prompts" / "template.md"


def _read(path: Path, default: str = "(not available)") -> str:
    try:
        return path.read_text(encoding="utf-8")
    except (FileNotFoundError, IsADirectoryError):
        return default


def _get_prompt_dirs(run_dir: Path) -> list[Path]:
    dirs = sorted(
        (d for d in run_dir.iterdir() if d.is_dir() and d.name.startswith("prompt-")),
        key=lambda p: int(p.name.split("-")[1]),
    )
    return dirs


def _extract_per_prompt(
    client: OpenAI,
    model: str,
    extraction_prompt: str,
    prompt_dir: Path,
) -> dict:
    """LLM call for one prompt run → structured JSON block. Cached in eval_block.json."""
    cache = prompt_dir / "eval_block.json"
    if cache.exists():
        print(f"    (cached)")
        return json.loads(cache.read_text())

    name = _read(prompt_dir / "prompt_name.txt", prompt_dir.name)
    prompt_text = _read(prompt_dir / "prompt.txt")
    conversation = _read(prompt_dir / "conversation.md")
    metrics = json.loads(_read(prompt_dir / "metrics.json", "{}"))
    context = _read(prompt_dir / "context.txt")

    user_msg = f"""# Prompt Configuration: {name}

## Prompt Sent to Agent
{prompt_text}

## Agent Conversation
{conversation}

## Token Metrics
```json
{json.dumps(metrics, indent=2)}
```

## Device Context (eval.sh output)
```
{context}
```"""

    response = client.chat.completions.create(
        model=model,
        messages=[
            {"role": "system", "content": extraction_prompt},
            {"role": "user", "content": user_msg},
        ],
        response_format={"type": "json_object"},
    )

    result = json.loads(response.choices[0].message.content)
    # Merge in metrics from metrics.json so summary step has reliable numbers
    result.setdefault("_prompt_name", name)
    result.setdefault("_prompt_tokens", metrics.get("prompt_tokens", 0))
    result.setdefault("_completion_tokens", metrics.get("completion_tokens", 0))
    result.setdefault("_total_tokens", metrics.get("total_tokens", 0))
    result.setdefault("_model", metrics.get("model"))

    cache.write_text(json.dumps(result, indent=2, ensure_ascii=False))
    return result


def _generate_document(
    client: OpenAI,
    model: str,
    synthesis_prompt: str,
    template: str,
    blocks: list[dict],
    meta: dict,
) -> str:
    """Final LLM call: fill the complete evaluation template using all extracted blocks."""
    system = synthesis_prompt.replace("[TEMPLATE_WILL_BE_INSERTED_HERE]", template)

    user = f"""# Per-Configuration Evaluation Blocks
```json
{json.dumps(blocks, indent=2, ensure_ascii=False)}
```

# Run Metadata
```json
{json.dumps(meta, indent=2)}
```"""

    response = client.chat.completions.create(
        model=model,
        messages=[
            {"role": "system", "content": system},
            {"role": "user", "content": user},
        ],
    )
    return response.choices[0].message.content


def main() -> None:
    parser = argparse.ArgumentParser(description="OCELOT Eval-Harness — evaluation step")
    parser.add_argument("--config", required=True, help="Path to run config YAML")
    parser.add_argument("--run-dir", required=True, help="Run directory (contains prompt-N/ subdirs)")
    parser.add_argument("--extraction-prompt", help="Override extraction prompt file")
    parser.add_argument("--synthesis-prompt", help="Override synthesis prompt file")
    parser.add_argument("--template", help="Override evaluation template file")
    args = parser.parse_args()

    cfg = load_config(args.config)
    eval_cfg = cfg.get("evaluation", {})
    llm_cfg = eval_cfg.get("llm", {})

    model = llm_cfg.get("model", "gpt-4o")
    api_key_env = llm_cfg.get("api_key_env", "EVAL_LLM_API_KEY")
    base_url_env = llm_cfg.get("base_url_env", "EVAL_LLM_BASE_URL")

    api_key = llm_cfg.get("api_key") or os.environ.get(api_key_env)
    if not api_key:
        print(f"ERROR: No API key configured. Set 'evaluation.llm.api_key' in config.yml or set env var '{api_key_env}'.", file=sys.stderr)
        sys.exit(1)

    base_url = llm_cfg.get("base_url") or os.environ.get(base_url_env) or None
    client = OpenAI(api_key=api_key, base_url=base_url)

    extraction_prompt_path = (
        args.extraction_prompt
        or eval_cfg.get("extraction_prompt")
        or str(DEFAULT_EXTRACTION_PROMPT)
    )
    synthesis_prompt_path = (
        args.synthesis_prompt
        or eval_cfg.get("synthesis_prompt")
        or str(DEFAULT_SYNTHESIS_PROMPT)
    )
    template_path = (
        args.template
        or eval_cfg.get("template")
        or str(DEFAULT_TEMPLATE)
    )

    extraction_prompt = Path(extraction_prompt_path).read_text(encoding="utf-8")
    synthesis_prompt = Path(synthesis_prompt_path).read_text(encoding="utf-8")
    template = Path(template_path).read_text(encoding="utf-8")

    run_dir = Path(args.run_dir)
    meta = json.loads(_read(run_dir / "meta.json", "{}"))

    prompt_dirs = _get_prompt_dirs(run_dir)
    if not prompt_dirs:
        print(f"ERROR: No prompt-N directories found in {run_dir}", file=sys.stderr)
        sys.exit(1)

    print(f"Extracting evaluation blocks for {len(prompt_dirs)} prompt configuration(s)...")
    blocks: list[dict] = []
    for pdir in prompt_dirs:
        name = _read(pdir / "prompt_name.txt", pdir.name)
        print(f"  [{pdir.name}] {name}...", end=" ", flush=True)
        block = _extract_per_prompt(client, model, extraction_prompt, pdir)
        blocks.append(block)
        print("done")

    print("Generating final evaluation document...")
    document = _generate_document(client, model, synthesis_prompt, template, blocks, meta)

    output_path = run_dir / "evaluation.md"
    output_path.write_text(document, encoding="utf-8")
    print(f"Evaluation saved: {output_path}")


if __name__ == "__main__":
    main()
