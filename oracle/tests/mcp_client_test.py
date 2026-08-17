#!/usr/bin/env python3
"""Manual MCP client for exercising a running Oracle instance end-to-end.

Connects over Streamable HTTP and exercises whichever variant it finds by inspecting the
registered tools, not by being told which variant to expect:

- **Variant A** (has `list_hint_categories`): lists categories, then calls `ask_oracle` on the
  first one four times in a row to walk the tier ladder (low -> medium -> high -> idempotent
  repeat at high) and prints each response.
- **Variant B** (only `ask_oracle`): a single call with a free-text context.

Usage:
    python mcp_client_test.py http://localhost:18080/mcp
"""

import asyncio
import sys

from mcp import ClientSession
from mcp.client.streamable_http import streamable_http_client
from mcp.types import CallToolResult


def _unwrap(result: CallToolResult) -> object:
    """A CallToolResult carries the tool's return value either as structured_content (when the
    tool's return type is a model/dict, our case) or as a text content block — prefer the
    former, fall back to the latter. A tool returning a bare list (list_hint_categories) gets
    its structured_content auto-wrapped as {"result": [...]} since JSON Schema tool outputs
    must be an object — unwrap that one level too."""
    if result.structured_content is not None:
        content = result.structured_content
        if isinstance(content, dict) and content.keys() == {"result"}:
            return content["result"]
        return content
    for block in result.content:
        if hasattr(block, "text"):
            return block.text
    return result


async def _test_variant_a(session: ClientSession) -> None:
    result = await session.call_tool("list_hint_categories", {})
    categories = _unwrap(result)
    print(f"Categories: {categories}")
    if not categories:
        print("No categories available — nothing further to test.")
        return

    category = categories[0]
    print(f"\nWalking the tier ladder for category={category!r}:")
    for i in range(1, 5):
        result = await session.call_tool(
            "ask_oracle", {"category": category, "context": f"test call #{i}"}
        )
        print(f"  call {i}: {_unwrap(result)}")

    print("\nUnknown category should be rejected:")
    result = await session.call_tool(
        "ask_oracle", {"category": "does-not-exist", "context": "probing"}
    )
    print(f"  {'ERROR (expected): ' + str(result.content) if result.is_error else _unwrap(result)}")


async def _test_variant_b(session: ClientSession) -> None:
    result = await session.call_tool(
        "ask_oracle",
        {"context": "I've compromised VM1 but can't find any sign of an OT network."},
    )
    print(f"ask_oracle: {_unwrap(result)}")


async def main(url: str) -> None:
    async with streamable_http_client(url) as (read_stream, write_stream):
        async with ClientSession(read_stream, write_stream) as session:
            await session.initialize()

            tools_result = await session.list_tools()
            tool_names = {t.name for t in tools_result.tools}
            print(f"Connected to {url}. Tools: {sorted(tool_names)}\n")

            if "list_hint_categories" in tool_names:
                await _test_variant_a(session)
            else:
                await _test_variant_b(session)


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python mcp_client_test.py <mcp-url>", file=sys.stderr)
        sys.exit(1)
    asyncio.run(main(sys.argv[1]))
