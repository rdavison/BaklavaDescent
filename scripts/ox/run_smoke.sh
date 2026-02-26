#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
OX_DIR="$ROOT_DIR/ox"
BUILD_DIR="$OX_DIR/build"

"$ROOT_DIR/scripts/ox/build_bridge.sh"

cc -std=c11 \
  -I"$ROOT_DIR" \
  -I"$OX_DIR" \
  -I"$(ocamlc -where)" \
  -c "$OX_DIR/bridge.c" \
  -o "$BUILD_DIR/bridge.o"

c++ -std=c++17 \
  -I"$ROOT_DIR" \
  -I"$OX_DIR" \
  -I"$(ocamlc -where)" \
  "$OX_DIR/smoke_test.cpp" \
  "$BUILD_DIR/bridge.o" \
  "$BUILD_DIR/math_bridge_complete.o" \
  -o "$BUILD_DIR/smoke_test" \
  -lpthread -lm -ldl

"$BUILD_DIR/smoke_test"
