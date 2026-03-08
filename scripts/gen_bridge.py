#!/usr/bin/env python3
import sys
import os

def gen_bridge(spec_path, ml_out, h_out, func_name):
    fields = []
    with open(spec_path, 'r') as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith('#'): continue
            # Only split on the first two colons to allow colons in the C++ expression
            parts = [p.strip() for p in line.split(':', 2)]
            if len(parts) == 3:
                fields.append({'idx': int(parts[0]), 'name': parts[1], 'cpp': parts[2]})

    fields.sort(key=lambda x: x['idx'])
    max_idx = fields[-1]['idx'] if fields else 0
    size = max_idx + 1

    # Generate OCaml
    with open(ml_out, 'w') as f:
        f.write("(* GENERATED FILE - DO NOT EDIT *)\n\n")
        f.write("type t = {\n")
        for field in fields:
            f.write(f"  {field['name']} : int;\n")
        f.write("}\n\n")
        
        f.write(f"let of_array (arr : int array) : t =\n  {{\n")
        for field in fields:
            f.write(f"    {field['name']} = arr.({field['idx']});\n")
        f.write("  }\n\n")

        f.write(f"let to_array (state : t) (arr : int array) : unit =\n")
        for field in fields:
            f.write(f"  arr.({field['idx']}) <- state.{field['name']};\n")
        f.write("  ()\n")

    # Generate C
    with open(h_out, 'w') as f:
        f.write("/* GENERATED FILE - DO NOT EDIT */\n\n")
        f.write("#pragma once\n\n")
        f.write("#include <stdint.h>\n")
        f.write(f"#define {func_name.upper()}_STATE_SIZE {size}\n\n")
        
        f.write(f"static inline void pack_{func_name}(int32_t* buf, object* obj, ai_static* aip, ai_local* ailp) {{\n")
        for field in fields:
            f.write(f"    buf[{field['idx']}] = (int32_t)({field['cpp']});\n")
        f.write("}\n\n")

        f.write(f"static inline void unpack_{func_name}(int32_t* buf, object* obj, ai_static* aip, ai_local* ailp) {{\n")
        for field in fields:
            cpp = field['cpp']
            # Unpack if it's a pointer member OR an explicitly known global we want to sync
            settable_globals = ["Buddy_allowed_to_talk", "Stolen_item_index", "Boss_dying_start_time"]
            is_settable_global = any(g in cpp for g in settable_globals)
            
            if ("->" in cpp and "(" not in cpp) or is_settable_global:
                f.write(f"    {cpp} = buf[{field['idx']}];\n")
        f.write("}\n")

if __name__ == "__main__":
    if len(sys.argv) < 5:
        print("Usage: gen_bridge.py <spec> <ml_out> <h_out> <func_name>")
        sys.exit(1)
    gen_bridge(sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4])
