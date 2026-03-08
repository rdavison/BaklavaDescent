#!/usr/bin/env python3
"""
Generate LLVM call graphs for Descent game logic files.

Uses compile_commands.json to get exact flags, compiles to LLVM IR,
runs opt -dot-callgraph, pipes through llvm-cxxfilt to demangle,
then merges into a unified graph with porting status annotations.

Usage:
    python3 scripts/gen_callgraph.py [--render]

Output:
    callgraph/                     - per-file IR and DOT files
    callgraph/unified.dot          - merged call graph with porting annotations
    callgraph/unified.svg          - rendered SVG (if --render and graphviz installed)
    callgraph/porting.json         - machine-readable porting status + graph data
"""

import json
import os
import re
import subprocess
import sys
from collections import defaultdict
from pathlib import Path

PROJECT = Path(__file__).resolve().parent.parent
BUILD_DIR = PROJECT / "build-c-ref"
COMPILE_DB = BUILD_DIR / "compile_commands.json"
LLVM_PREFIX = subprocess.check_output(
    ["brew", "--prefix", "llvm@20"], text=True
).strip()
CLANG = f"{LLVM_PREFIX}/bin/clang++"
OPT = f"{LLVM_PREFIX}/bin/opt"
CXXFILT = f"{LLVM_PREFIX}/bin/llvm-cxxfilt"
OUT_DIR = PROJECT / "callgraph"

# Core game logic files we care about for the port
GAME_LOGIC_FILES = [
    "main_d2/ai.cpp",
    "main_d2/ai2.cpp",
    "main_d2/aipath.cpp",
    "main_d2/physics.cpp",
    "main_d2/collide.cpp",
    "main_d2/fvi.cpp",
    "main_d2/laser.cpp",
    "main_d2/weapon.cpp",
    "main_d2/object.cpp",
    "main_d2/gameseg.cpp",
    "main_d2/cntrlcen.cpp",
    "main_d2/fireball.cpp",
    "main_d2/wall.cpp",
    "main_d2/lighting.cpp",
    "main_d2/powerup.cpp",
    "main_d2/fuelcen.cpp",
    "main_d2/escort.cpp",
    "main_d2/robot.cpp",
    "main_d2/morph.cpp",
    "main_d2/switch.cpp",
    "main_d2/gameseq.cpp",
    "main_d2/multi.cpp",
    "main_d2/multibot.cpp",
]

# Functions known to be ported to OCaml.
# "authoritative" = OCaml drives the game, C path skipped
# "ported" = fully implemented in OCaml, called via bridge
# Source of truth: grep for cd_ox_ calls in main_d2/*.cpp
PORTED_FUNCTIONS = {
    # Authoritative (OCaml drives the game)
    "do_ai_frame": "authoritative",
    "do_physics_sim": "authoritative",
    "find_vector_intersection": "authoritative",
    # AI core
    "ai_follow_path": "ported",
    "ai_turn_towards_vector": "ported",
    "ai_create_path_points": "ported",
    "create_path_points": "ported",
    "move_towards_segment_center": "ported",
    "move_towards_player": "ported",
    "move_away_from_player": "ported",
    "move_towards_vector": "ported",
    "ai_move_relative_to_player": "ported",
    "compute_vis_and_vec": "ported",
    "player_is_visible_from_object": "ported",
    "create_n_segment_path": "ported",
    "create_path_to_player": "ported",
    "create_path_to_segment": "ported",
    "ai_path_set_orient_and_vel": "ported",
    "ai_behavior_to_mode": "ported",
    "init_ai_object": "ported",
    "ai_door_is_openable": "ported",
    "ai_frame_animation": "ported",
    "do_firing_stuff": "ported",
    "do_silly_animation": "ported",
    "move_around_player": "ported",
    "openable_doors_in_segment": "ported",
    "lead_player": "ported",
    "teleport_boss": "ported",
    "calc_best_gun": "ported",
    "calc_gun_point": "ported",
    "set_next_fire_time": "ported",
    "init_ai_for_ship": "ported",
    "init_robots_for_level": "ported",
    "init_ai_frame": "ported",
    # Collision handlers
    "bump_one_object": "ported",
    "collide_robot_and_robot": "ported",
    "collide_player_and_player": "ported",
    "collide_player_and_nasty_robot": "ported",
    "collide_player_and_materialization_center": "ported",
    "apply_damage_to_clutter": "ported",
    "collide_player_and_clutter": "ported",
    "collide_player_and_controlcen": "ported",
    "collide_robot_and_controlcen": "ported",
    "apply_damage_to_player": "ported",
    "apply_damage_to_robot": "ported",
    "apply_damage_to_controlcen": "ported",
    "phys_apply_force": "ported",
    "phys_apply_rot": "ported",
    "maybe_kill_weapon": "ported",
    # Physics sub-functions
    "do_physics_sim_rot": "ported",
    "check_hit_wall": "ported",
    "do_physics_align_object": "ported",
    "set_object_turnroll": "ported",
    "physics_turn_towards_vector": "ported",
    "set_thrust_from_velocity": "ported",
    # FVI sub-functions
    "fvi_sub": "ported",
    "check_line_to_face": "ported",
    "sphere_intersects_wall": "ported",
    "check_vector_to_sphere_1": "ported",
    "check_vector_to_objects": "ported",
    "laser_are_related": "ported",
    "object_intersects_wall": "ported",
    "get_seg_masks": "ported",
    "get_side_dists": "ported",
    # Gameseg
    "find_point_seg": "ported",
    "find_new_seg": "ported",
    "find_connect_side": "ported",
    "compute_segment_center": "ported",
    "pick_random_point_in_seg": "ported",
    "compute_center_point_on_side": "ported",
    "explode_wall": "ported",
    "create_abs_vertex_lists": "ported",
    "create_all_vertnum_lists": "ported",
    "create_walls_on_side": "ported",
    "validate_removable_wall": "ported",
    "validate_segment_side": "ported",
    "validate_segment": "ported",
    "get_verts_for_normal": "ported",
    "check_norms": "ported",
    "extract_orient_from_segment": "ported",
    "extract_vector_from_segment": "ported",
    "create_shortpos": "ported",
    "extract_shortpos": "ported",
    "find_connected_distance": "ported",
    "find_connected_distance_segments": "ported",
    "check_segment_connections": "ported",
    # Lighting
    "apply_light": "ported",
    "cast_light": "ported",
    "compute_headlight_light": "ported",
    "compute_object_light": "ported",
    # Robot state
    "robot_get_anim_state": "ported",
    "robot_set_angles": "ported",
    "set_robot_state": "ported",
    # Control center
    "do_controlcen_frame": "ported",
    "calc_controlcen_gun_point": "ported",
    "init_controlcen_for_level": "ported",
    # Weapons / homing
    "find_homing_object": "ported",
    "find_homing_object_complete": "ported",
    "homing_missile_turn_towards_velocity": "ported",
    "track_track_goal": "ported",
    "player_has_weapon": "ported",
    "get_explosion_vclip": "ported",
    "ok_to_do_omega_damage": "ported",
    "create_homing_missile": "ported",
    "create_weapon_object": "ported",
    # Inlined into pure OCaml (no longer escapes to C)
    "make_random_vector": "ported",
    "convert_to_byte": "ported",
    "ready_to_fire": "ported",
    "create_random_xlate": "ported",
    "physics_set_rotvel_and_saturate": "ported",
    "set_rotvel_and_saturate": "ported",  # ai2.cpp version, identical to physics_set_rotvel_and_saturate
    "maybe_ai_do_actual_firing_stuff": "ported",
    "check_vector_to_object": "ported",
    # Inlined in OCaml under different names / as part of larger functions
    "get_num_faces": "ported",
    "obj_in_list": "ported",
    "sign": "ported",
    "compute_lead_component": "ported",
    "check_and_fix_matrix": "ported",
    "add_side_as_quad": "ported",
    "add_side_as_2_triangles": "ported",
    "compute_seg_dynamic_light": "ported",
    "g3_rotate_point": "ported",
    # FVI sub-functions already inlined in ox_fvi.ml
    "check_sphere_to_face": "ported",
    "find_plane_line_intersection": "ported",
    "special_check_line_to_face": "ported",
    # Aipath sub-functions already in ox_aipath.ml
    "insert_center_points": "ported",
    "attempt_to_resume_path": "ported",
    # More FVI sub-functions inlined in ox_fvi.ml
    "check_point_to_face": "ported",
    "oflow_check": "ported",
    "check_line_to_line": "ported",
    "trace_segs": "ported",
    "check_trans_wall": "ported",
    "calc_det_value": "ported",
    # AI firing (ported as D1/D2 variants in ox_ai_frame.ml)
    "ai_do_actual_firing_stuff": "ported",
    # AI path functions in ox_aipath.ml
    "create_path_to_station": "ported",
    "create_n_segment_path_to_door": "ported",
    "polish_path": "ported",
    "move_towards_outside": "ported",
    # Homing/tracking in ox_fvi.ml
    "object_is_trackable": "ported",
    "call_find_homing_object_complete": "ported",
    # Wall doorway logic in ox_physics_sim.ml
    "wall_is_doorway": "ported",
    # AI utility functions in ox_ai_frame.ml
    "check_object_object_intersection": "ported",
    # Escort/thief
    "init_thief_for_level": "ported",
    "create_bfs_list": "ported",
    "segment_is_reachable": "ported",
    # Gameseq
    "InitPlayerObject": "ported",
    "verify_console_object": "ported",
    "bash_to_shield": "ported",
    "clear_stuck_objects": "ported",
    "init_ammo_and_energy": "ported",
    "update_player_stats": "ported",
    # Switch
    "do_lock_doors": "ported",
    "do_unlock_doors": "ported",
    "door_is_wall_switched": "ported",
    "flag_wall_switched_doors": "ported",
    "do_il_on": "ported",
    "do_il_off": "ported",
    "wall_illusion_off": "ported",
    "start_wall_cloak": "ported",
    "start_wall_decloak": "ported",
    # Gameseq (robot defaults)
    "copy_defaults_to_robot": "ported",
    "copy_defaults_to_robot_all": "ported",
    # Wall
    "reset_walls": "ported",
    "kill_stuck_objects": "ported",
    "wall_illusion_on": "ported",
    # Object
    "special_reset_objects": "ported",
    "free_object_slots": "ported",
    "filter_objects_from_level": "ported",
    # AI awareness
    "add_awareness_event": "ported",
    "create_awareness_event": "ported",
    # Object management
    "obj_detach_all": "ported",
    "search_all_segments_for_object": "ported",
    "set_robot_location_info": "ported",
    "wake_up_rendered_objects": "ported",
    # Weapon ordering
    "POrderList": "ported",
    "SOrderList": "ported",
    # Morph
    "find_min_max": "ported",
    "init_points": "ported",
    "update_points": "ported",
    "morph_start": "ported",
    # Object allocation
    "obj_allocate": "ported",
    "compress_objects": "ported",
    # Fuelcen
    "fuelcen_create": "ported",
    "matcen_create": "ported",
    "fuelcen_activate": "ported",
    # Collide - volatile wall
    "check_volatile_wall": "ported",
    # Object movement
    "spin_object": "ported",
    # Object linked-list maintenance
    "check_duplicate_objects": "ported",
    "remove_all_objects_but": "ported",
    "remove_incorrect_objects": "ported",
    "drop_marker_object": "ported",
    # Wall - door blocking
    "check_poke": "ported",
    "is_door_free": "ported",
}

# Functions that intentionally remain as C effects.
# These touch global state (scores, walls, multiplayer, UI) and are
# correctly handled as algebraic effects escaping to C.
EFFECT_FUNCTIONS = {
    "add_stuck_object", "ai_do_cloak_stuff", "flush_fcd_cache",
    "add_to_fcd_cache", "add_points_to_score", "mprintf_animation_info",
    "ai_multiplayer_awareness", "ai_multi_send_robot_position",
    "start_boss_death_sequence", "start_robot_death_sequence",
    "special_reactor_stuff", "compute_headlight_light_on_object",
    # Laser/weapon creation
    "Laser_create_new", "Laser_create_new_easy",
    # Multiplayer sends
    "multi_send_fire", "multi_send_robot_position",
    # Object state mutations handled via effects
    "obj_create", "obj_delete",
    # Path/object operations handled via effects
    "find_object_seg", "obj_relink", "update_object_seg", "fix_object_segs",
    # Explosion/death handled via effects
    "object_create_explosion", "explode_object",
    "do_final_boss_hacks", "do_controlcen_destroyed_stuff",
    # AI mode handlers handled via effects
    "do_boss_stuff", "do_snipe_frame", "do_thief_frame",
    "do_escort_frame", "do_any_robot_dying_frame",
    "make_nearby_robot_snipe", "object_to_object_visibility",
    # Collision dispatchers handled via effects
    "collide_two_objects", "collide_object_with_wall",
    "bump_two_objects", "scrape_object_on_wall",
    # Rendering/texture (stay in C, not game logic)
    "piggy_bitmap_page_in", "rle_expand_texture",
    "find_hitpoint_uv", "texmerge_get_cached_bitmap",
    # AI combat effects
    "do_ai_robot_hit_attack", "ai_fire_laser_at_player",
    # AI path global state management
    "ai_path_garbage_collect", "ai_reset_all_paths",
    "maybe_ai_path_garbage_collect",
    # Object movement fallbacks touching global state
    "move_object_to_legal_spot", "move_object_to_goal",
    # Texture transparency check (reads GameBitmaps/Textures globals)
    "check_transparency",
    # Escort goal management (D2 only, mutates Escort_goal_object global)
    "invalidate_escort_goal",
    # Escort segment reachability (reads Segments[] globals, calls ai_door_is_openable with NULL obj)
    "segment_is_reachable",
    # Object list management (linked list mutations on global Objects[]/Segments[])
    "obj_link", "obj_unlink", "obj_free", "obj_attach", "obj_detach_one",
    "johns_obj_unlink", "reset_objects",
    # Fuel center / matcen init and multiplayer goal checks (global state mutations)
    "fuelcen_check_for_goal", "fuelcen_check_for_hoard_goal", "init_all_matcens",
    # Gameseq initialization
    "maybe_set_first_secret_visit",
}

# Functions that should not count as "unported deps" in frontier analysis.
# These are intrinsics, math helpers, debug functions, and C library calls
# that are already implemented in OCaml or are trivial/irrelevant.
INTRINSICS = {
    # LLVM intrinsics
    "llvm.memcpy.p0.p0.i64", "llvm.memset.p0.i64", "llvm.abs.i32",
    "llvm.abs.i64",
    # Debug / assertions / viewer
    "_Assert", "Int3", "Error", "_mprintf", "fprintf", "printf", "sprintf",
    "force_dump_ai_objects_all", "list_seg_objects",
    "object_goto_next_viewer", "object_goto_prev_viewer",
    "is_object_in_seg",
    # Fixed-point math (already in OCaml)
    "fixmul", "fixdiv", "fix_sqrt", "fixmuldiv", "fix_fastsincos",
    "fix_asin", "fix_acos", "f2fl", "fl2f", "i2f", "f2i",
    # Vector math (already in OCaml)
    "vm_vec_sub", "vm_vec_add", "vm_vec_add2", "vm_vec_scale",
    "vm_vec_scale_add", "vm_vec_scale_add2", "vm_vec_copy_scale",
    "vm_vec_normalize_quick", "vm_vec_normalized_dir_quick",
    "vm_vec_dotprod", "vm_vec_mag", "vm_vec_mag_quick",
    "vm_vec_dist", "vm_vec_dist_quick", "vm_vector_2_matrix",
    "vm_angles_2_matrix", "vm_matrix_x_matrix", "vm_dist_to_plane",
    "vm_extract_angles_vector",
    "vm_vec_rotate", "vm_vec_normalize", "vm_vec_copy_normalize",
    "vm_vec_normalized_dir", "vm_vec_normal",
    "vm_copy_transpose_matrix", "vm_transpose_matrix",
    "vm_vec_delta_ang", "vm_vec_scale2", "vm_vec_crossprod",
    # Random (already in OCaml)
    "P_Rand",
    # Sound effects (handled via effects, not game logic)
    "digi_link_sound_to_pos", "digi_play_sample", "digi_kill_sound_linked_to_object",
    "digi_link_sound_to_object", "digi_link_sound_to_object2",
    "digi_link_sound_to_object3",
    # Multiplayer (handled via effects)
    "multi_send_robot_position", "multi_send_fire",
    # C++ stdlib
    "bool std::__1::__less<void, void>::operator",
    "int const& std::__1::min[abi:ne200100]<int, std::__1::__less<void, void>>",
    "int const& std::__1::min[abi:ne200100]<int>",
    "int const& std::__1::max[abi:ne200100]<int, std::__1::__less<void, void>>",
    "int const& std::__1::max[abi:ne200100]<int>",
    "unsigned short const& std::__1::min[abi:ne200100]<unsigned short, std::__1::__less<void, void>>",
    "unsigned short const& std::__1::min[abi:ne200100]<unsigned short>",
    # Palette / HUD (side effects, not game logic)
    "PALETTE_FLASH_ADD",
}


def clean_name(name):
    """Strip LLVM \\x01 prefix and C++ parameter list: '\\x01_fopen(...)' -> '_fopen'"""
    name = name.lstrip("\x01")
    paren = name.find("(")
    return name[:paren] if paren >= 0 else name


def parse_compile_commands():
    with open(COMPILE_DB) as f:
        entries = json.load(f)
    commands = {}
    for entry in entries:
        rel = os.path.relpath(entry["file"], PROJECT)
        if rel in GAME_LOGIC_FILES:
            commands[rel] = entry
    return commands


def extract_flags(command_str):
    parts = command_str.split()
    flags = []
    skip_next = False
    for i, p in enumerate(parts):
        if skip_next:
            skip_next = False
            continue
        if p in ("-o", "-c"):
            skip_next = True
            continue
        if i == 0:
            continue
        if p.startswith("/") and p.endswith(".cpp"):
            continue
        flags.append(p)
    return flags


def compile_to_ir(commands):
    ir_files = []
    for rel_path, entry in commands.items():
        src = PROJECT / rel_path
        ir_file = OUT_DIR / (rel_path.replace("/", "_").replace(".cpp", ".ll"))

        flags = extract_flags(entry["command"])
        cmd = [CLANG] + flags + [
            "-emit-llvm", "-S", "-Xclang", "-disable-O0-optnone",
            "-o", str(ir_file), "-c", str(src),
        ]

        print(f"  {rel_path} -> {ir_file.name}")
        result = subprocess.run(
            cmd, capture_output=True, text=True,
            cwd=entry.get("directory", str(PROJECT)),
        )
        if result.returncode != 0:
            print(f"    WARNING: failed: {result.stderr[:500]}")
            continue
        ir_files.append(ir_file)
    return ir_files


def generate_demangled_dots(ir_files):
    """Run opt -dot-callgraph on each IR file, demangle with llvm-cxxfilt."""
    dot_files = []
    for ir_file in ir_files:
        cmd = [OPT, "-passes=dot-callgraph", "-disable-output", str(ir_file)]
        subprocess.run(cmd, capture_output=True, text=True, cwd=str(OUT_DIR))

        raw_dot = ir_file.parent / f"{ir_file.name}.callgraph.dot"
        if not raw_dot.exists():
            print(f"    WARNING: no dot for {ir_file.stem}")
            continue

        # Demangle in-place by piping through llvm-cxxfilt
        demangled_dot = OUT_DIR / f"{ir_file.stem}.callgraph.dot"
        with open(raw_dot) as inp:
            result = subprocess.run(
                [CXXFILT], stdin=inp, capture_output=True, text=True,
            )
        demangled_dot.write_text(result.stdout)
        if raw_dot != demangled_dot:
            raw_dot.unlink()

        dot_files.append((ir_file.stem, demangled_dot))
        print(f"  {ir_file.stem}")
    return dot_files


def parse_dot_file(dot_path):
    content = dot_path.read_text()
    labels = {}
    edges = []

    for m in re.finditer(
        r'(Node0x[0-9a-fA-F]+)\s*\[.*?label\s*=\s*"\{([^}]*)\}"', content
    ):
        node_id, label = m.groups()
        labels[node_id] = clean_name(label.strip())

    for m in re.finditer(
        r'(Node0x[0-9a-fA-F]+)\s*->\s*(Node0x[0-9a-fA-F]+)', content
    ):
        edges.append(m.groups())

    return labels, edges


def build_unified_graph(dot_files):
    all_edges = set()
    all_functions = set()
    function_to_file = {}

    for file_stem, dot_path in dot_files:
        labels, edges = parse_dot_file(dot_path)
        for src, dst in edges:
            src_name = labels.get(src)
            dst_name = labels.get(dst)
            if src_name and dst_name:
                all_edges.add((src_name, dst_name))
                all_functions.add(src_name)
                all_functions.add(dst_name)
                if src_name not in function_to_file:
                    function_to_file[src_name] = file_stem
                if dst_name not in function_to_file:
                    function_to_file[dst_name] = file_stem

    return all_functions, all_edges, function_to_file


def compute_porting_frontier(functions, edges):
    """Unported, non-intrinsic, non-effect functions called directly by ported functions."""
    frontier = set()
    for caller, callee in edges:
        if (caller in PORTED_FUNCTIONS
                and callee not in PORTED_FUNCTIONS
                and callee not in INTRINSICS
                and callee not in EFFECT_FUNCTIONS):
            frontier.add(callee)
    return frontier


def compute_transitive_deps(edges):
    adj = defaultdict(set)
    for caller, callee in edges:
        adj[caller].add(callee)

    cache = {}

    def transitive(fn, visited=None):
        if fn in cache:
            return cache[fn]
        if visited is None:
            visited = set()
        if fn in visited:
            return set()
        visited.add(fn)
        deps = set(adj[fn])
        for callee in list(adj[fn]):
            deps |= transitive(callee, visited)
        cache[fn] = deps
        return deps

    for fn in list(adj.keys()):
        transitive(fn)
    return cache


def write_unified_dot(functions, edges, function_to_file, out_path):
    frontier = compute_porting_frontier(functions, edges)

    with open(out_path, "w") as f:
        f.write("digraph callgraph {\n")
        f.write("  rankdir=LR;\n")
        f.write("  node [shape=box, fontname=monospace, fontsize=10];\n")
        f.write("  edge [color=gray40];\n\n")

        for fn in sorted(functions):
            status = PORTED_FUNCTIONS.get(fn)
            if status == "authoritative":
                color, style, fillcolor = "darkgreen", "filled", "palegreen"
            elif status == "ported":
                color, style, fillcolor = "green", "filled", "honeydew"
            elif fn in INTRINSICS:
                color, style, fillcolor = "dodgerblue", "filled", "aliceblue"
            elif fn in EFFECT_FUNCTIONS:
                color, style, fillcolor = "orange", "filled", "lightyellow"
            elif fn in frontier:
                color, style, fillcolor = "red", "filled", "mistyrose"
            else:
                color, style, fillcolor = "gray50", "solid", "white"

            file_info = function_to_file.get(fn, "")
            if file_info:
                file_info = file_info.replace("main_d2_", "")
            label = f"{fn}\\n({file_info})" if file_info else fn

            f.write(f'  "{fn}" [label="{label}", color={color}, '
                    f'style={style}, fillcolor="{fillcolor}"];\n')

        f.write("\n")
        for caller, callee in sorted(edges):
            f.write(f'  "{caller}" -> "{callee}";\n')
        f.write("}\n")


def write_porting_json(functions, edges, function_to_file):
    frontier = compute_porting_frontier(functions, edges)
    trans_deps = compute_transitive_deps(edges)

    callers_map = defaultdict(set)
    callees_map = defaultdict(set)
    for caller, callee in edges:
        callers_map[callee].add(caller)
        callees_map[caller].add(callee)

    n_ported = len([f for f in functions if f in PORTED_FUNCTIONS])
    n_intrinsic = len([f for f in functions if f in INTRINSICS])
    n_effect = len([f for f in functions if f in EFFECT_FUNCTIONS])
    data = {
        "summary": {
            "total_functions": len(functions),
            "ported": n_ported,
            "intrinsic": n_intrinsic,
            "effect": n_effect,
            "frontier": len(frontier),
            "unported": len(functions) - n_ported - n_intrinsic - n_effect - len(frontier),
        },
        "functions": {},
        "frontier_priority": [],
        "next_to_port": [],
    }

    def is_handled(fn):
        """Check if a function is ported, an intrinsic, an effect, or otherwise handled."""
        return fn in PORTED_FUNCTIONS or fn in INTRINSICS or fn in EFFECT_FUNCTIONS

    for fn in sorted(functions):
        if fn in PORTED_FUNCTIONS:
            status = PORTED_FUNCTIONS[fn]
        elif fn in INTRINSICS:
            status = "intrinsic"
        elif fn in EFFECT_FUNCTIONS:
            status = "effect"
        elif fn in frontier:
            status = "frontier"
        else:
            status = "unported"
        data["functions"][fn] = {
            "status": status,
            "file": function_to_file.get(fn, "external"),
            "callers": sorted(callers_map.get(fn, set())),
            "callees": sorted(callees_map.get(fn, set())),
            "transitive_dep_count": len(trans_deps.get(fn, set())),
        }

    # Frontier priority: sort by fewest unported transitive deps (easiest first)
    # Exclude intrinsics from unported dep count — they're already in OCaml
    for fn in frontier:
        fn_deps = trans_deps.get(fn, set())
        real_unported = [d for d in fn_deps if not is_handled(d)]
        ported_callers = [c for c in callers_map.get(fn, set()) if c in PORTED_FUNCTIONS]
        data["frontier_priority"].append({
            "function": fn,
            "file": function_to_file.get(fn, "external").replace("main_d2_", ""),
            "unported_dep_count": len(real_unported),
            "unported_deps": sorted(real_unported)[:10],
            "total_dep_count": len(fn_deps),
            "ported_callers": sorted(ported_callers),
            "all_callers": sorted(callers_map.get(fn, set())),
        })

    data["frontier_priority"].sort(
        key=lambda x: (x["unported_dep_count"], -len(x["ported_callers"]))
    )

    # Next-to-port: unported functions sorted by fewest unported transitive deps
    # These are candidates to port when the frontier is empty
    # Filter: must have at least 1 callee (excludes external stubs/leaf nodes)
    for fn in sorted(functions):
        if fn in PORTED_FUNCTIONS or fn in INTRINSICS or fn in EFFECT_FUNCTIONS or fn in frontier:
            continue
        fn_callees = callees_map.get(fn, set())
        if not fn_callees:
            continue  # skip leaf/external stubs
        fn_deps = trans_deps.get(fn, set())
        real_unported = [d for d in fn_deps if not is_handled(d)]
        data["next_to_port"].append({
            "function": fn,
            "file": function_to_file.get(fn, "external").replace("main_d2_", ""),
            "unported_dep_count": len(real_unported),
            "total_dep_count": len(fn_deps),
            "callers": sorted(callers_map.get(fn, set()))[:5],
            "callees": sorted(fn_callees)[:10],
        })

    data["next_to_port"].sort(
        key=lambda x: (x["unported_dep_count"], x["total_dep_count"])
    )

    out_path = OUT_DIR / "porting.json"
    with open(out_path, "w") as f:
        json.dump(data, f, indent=2)
    print(f"\nWrote {out_path}")
    return data


def print_summary(data):
    s = data["summary"]
    print(f"\n{'='*60}")
    print(f"PORTING STATUS")
    print(f"{'='*60}")
    print(f"  Total: {s['total_functions']}  Ported: {s['ported']}  "
          f"Intrinsic: {s['intrinsic']}  Effect: {s['effect']}  "
          f"Frontier: {s['frontier']}  Other: {s['unported']}")

    print(f"\n{'='*60}")
    print(f"PORTING FRONTIER (easiest first)")
    print(f"{'='*60}")
    for item in data["frontier_priority"][:30]:
        fn = item["function"]
        deps = item["unported_dep_count"]
        total = item["total_dep_count"]
        callers = ", ".join(item["ported_callers"][:3])
        print(f"  {fn}  [{item['file']}]")
        print(f"    {deps} unported deps / {total} total"
              + (f"  <- {callers}" if callers else ""))

    print(f"\n{'='*60}")
    print(f"NEXT TO PORT (simplest first)")
    print(f"{'='*60}")
    for item in data["next_to_port"][:20]:
        fn = item["function"]
        deps = item["unported_dep_count"]
        total = item["total_dep_count"]
        callees = ", ".join(item["callees"][:5])
        print(f"  {fn}  [{item['file']}]")
        print(f"    {deps} unported deps / {total} total"
              + (f"  -> {callees}" if callees else ""))


def main():
    render = "--render" in sys.argv
    OUT_DIR.mkdir(exist_ok=True)

    print("[1/5] Parsing compile_commands.json...")
    commands = parse_compile_commands()
    print(f"  {len(commands)}/{len(GAME_LOGIC_FILES)} files")

    print("\n[2/5] Compiling to LLVM IR...")
    ir_files = compile_to_ir(commands)

    print(f"\n[3/5] Generating call graphs (opt + llvm-cxxfilt)...")
    dot_files = generate_demangled_dots(ir_files)

    print(f"\n[4/5] Building unified graph...")
    functions, edges, function_to_file = build_unified_graph(dot_files)
    print(f"  {len(functions)} functions, {len(edges)} edges")

    write_unified_dot(functions, edges, function_to_file, OUT_DIR / "unified.dot")
    data = write_porting_json(functions, edges, function_to_file)

    if render:
        print("\n[5/5] Rendering SVG...")
        svg = OUT_DIR / "unified.svg"
        r = subprocess.run(
            ["dot", "-Tsvg", str(OUT_DIR / "unified.dot"), "-o", str(svg)],
            capture_output=True, text=True,
        )
        if r.returncode == 0:
            print(f"  Wrote {svg}")
        else:
            print(f"  Failed (install graphviz?): {r.stderr[:200]}")

    print_summary(data)


if __name__ == "__main__":
    main()
