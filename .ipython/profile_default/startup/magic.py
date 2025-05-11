"""Collection of custom magic commands."""

from __future__ import annotations

import sys
from functools import wraps
from contextlib import suppress
from pathlib import Path

from IPython.core.magic import register_line_magic

__all__ = ("read", "write", "verbose")


@register_line_magic
def D(line):
    """Exit REPL."""
    del line

    sys.exit()


def _get_path(filepath):
    with suppress(ModuleNotFoundError):
        from s3pathlib import S3Path

        if str(filepath).startswith("s3://"):
            return S3Path(str(filepath))
    return Path(filepath)


@register_line_magic
def read(line: str) -> str:
    """Get content of either pathlib.Path or s3pathlib.S3Path."""
    return _get_path(line).read_text()


def write(content: str, filepath: str | Path) -> None:
    """Write content to either pathlib.Path or s3pathlib.S3Path."""
    _get_path(filepath).write_text(content)
