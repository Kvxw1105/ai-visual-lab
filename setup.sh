#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

MODE=install
if [[ "$#" -gt 0 ]]; then MODE="$1"; fi
if [[ "$MODE" != install && "$MODE" != --check ]]; then
  echo "Usage: bash setup.sh [--check]" >&2
  exit 2
fi

PYTHON_BIN="$(printenv PYTHON || true)"
if [[ -z "$PYTHON_BIN" ]]; then
  if command -v python3 >/dev/null 2>&1; then
    PYTHON_BIN=python3
  elif command -v python >/dev/null 2>&1; then
    PYTHON_BIN=python
  else
    echo "ERROR: Python 3.11+ is required." >&2
    exit 1
  fi
fi

if ! "$PYTHON_BIN" -c 'import sys; sys.exit(0 if sys.version_info >= (3, 11) else 1)'; then
  echo "ERROR: Python 3.11+ is required; found $("$PYTHON_BIN" --version 2>&1)." >&2
  exit 1
fi
printf 'FOUND Python: '
"$PYTHON_BIN" --version

if [[ "$MODE" == install ]]; then
  "$PYTHON_BIN" -m venv .venv
  if [[ -x .venv/bin/python ]]; then
    VENV_PY=.venv/bin/python
  elif [[ -x .venv/Scripts/python.exe ]]; then
    VENV_PY=.venv/Scripts/python.exe
  else
    echo "ERROR: Could not locate the Python executable in .venv." >&2
    exit 1
  fi
  "$VENV_PY" -m pip install -r requirements.txt
  "$VENV_PY" -c 'import cv2, matplotlib, numpy, PIL, scipy; print("Python visual dependencies: OK")'
else
  echo "CHECK_ONLY: no environment or dependencies were changed."
fi

for tool in ffmpeg ffprobe blender node npm pnpm; do
  if command -v "$tool" >/dev/null 2>&1; then
    if output="$("$tool" --version 2>&1)"; then
      first_line="$(printf '%s\n' "$output" | head -n 1)"
      printf 'FOUND %s: %s\n' "$tool" "$first_line"
    else
      status=$?
      first_line="$(printf '%s\n' "$output" | head -n 1)"
      printf 'UNUSABLE %s (exit %s): %s\n' "$tool" "$status" "$first_line"
    fi
  else
    printf 'OPTIONAL_NOT_FOUND %s\n' "$tool"
  fi
done

if [[ "$MODE" == install ]]; then
  echo "Python base environment ready. Install other engines only when a project needs them."
fi