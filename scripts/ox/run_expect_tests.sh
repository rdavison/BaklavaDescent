#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/../.." && pwd)"

"$ROOT_DIR/scripts/ox/build_c_oracle.sh"

cd "$ROOT_DIR"
dune runtest ox/tests
