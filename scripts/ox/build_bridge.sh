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
  "$OX_DIR/ox_3d.ml" \
  "$OX_DIR/g3d_bridge.ml" \
  "$OX_DIR/ox_gameseg.ml" \
  "$OX_DIR/gameseg_bridge.ml" \
  "$OX_DIR/ox_collide.ml" \
  "$OX_DIR/collide_bridge.ml" \
  "$OX_DIR/ox_fvi.ml" \
  "$OX_DIR/fvi_bridge.ml" \
  "$OX_DIR/ox_physics.ml" \
  "$OX_DIR/physics_bridge.ml" \
  "$OX_DIR/ox_ai.ml" \
  "$OX_DIR/ai_bridge.ml" \
  "$OX_DIR/ox_robot.ml" \
  "$OX_DIR/robot_bridge.ml" \
  "$OX_DIR/ox_lighting.ml" \
  "$OX_DIR/lighting_bridge.ml" \
  "$OX_DIR/ox_weapon.ml" \
  "$OX_DIR/weapon_bridge.ml" \
  "$OX_DIR/ox_controlcen.ml" \
  "$OX_DIR/controlcen_bridge.ml" \
  "$OX_DIR/ox_ai_frame.ml" \
  "$OX_DIR/ai_frame_bridge.ml" \
  "$OX_DIR/ox_physics_sim.ml" \
  "$OX_DIR/physics_sim_bridge.ml" \
  "$OX_DIR/math_bridge.ml"

cat <<MSG
Built OxCaml link object:
  $BUILD_DIR/math_bridge_complete.o
MSG
