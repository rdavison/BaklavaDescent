#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
BUILD_DIR="$ROOT_DIR/build-ox-oracle"

cmake -S "$ROOT_DIR/ox/oracle" -B "$BUILD_DIR"
cmake --build "$BUILD_DIR" -j

cat <<MSG
Built C oracle library:
  $BUILD_DIR/libc_oracle.a
MSG
