#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
OX_DIR="$ROOT_DIR/ox"
BUILD_DIR="$OX_DIR/build"

mkdir -p "$BUILD_DIR"

ocamlfind ocamlopt \
  -open Core \
  -I "$OX_DIR" \
  -package core \
  -linkpkg \
  -output-complete-obj \
  -o "$BUILD_DIR/math_bridge_complete.o" \
  "$OX_DIR/ox_math.ml" \
  "$OX_DIR/math_bridge.ml"

cat <<MSG
Built OxCaml link object:
  $BUILD_DIR/math_bridge_complete.o
MSG
