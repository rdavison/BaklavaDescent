#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT_DIR"
dune build ox-bridge/bridge.exe.o
echo "Built OxCaml link object:"
echo "  _build/default/ox-bridge/bridge.exe.o"
