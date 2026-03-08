(* Lighting computation functions.
   Ported from main_d1/lighting.cpp and main_d2/lighting.cpp. *)

let f1_0 = 0x10000

(* D1: MAX_DIST = 0x400000, MAX_DIST_LOG = 5
   D2: MAX_DIST = f1_0<<6 = 0x400000, MAX_DIST_LOG = 6 *)
let max_dist = 0x400000
let max_dist_log_d1 = 5
let max_dist_log_d2 = 6
let headlight_boost_scale = 8 (* D2 HEADLIGHT_BOOST_SCALE *)

(* D1: compute_headlight_light
   Pure computation: takes point (x,y,z), face_light, beam_brightness, use_beam.
   Returns light intensity as fix. *)
let compute_headlight_light_d1
      ~point_x
      ~point_y
      ~point_z
      ~face_light
      ~beam_brightness
      ~use_beam
  =
  let light = beam_brightness in
  if light = 0
  then 0
  else (
    let face_light = max face_light 0 in
    let point_dist = Ox_math.vm_vec_mag_quick ~v:(point_x, point_y, point_z) in
    if point_dist >= max_dist
    then 0
    else (
      let dist_scale = (max_dist - point_dist) asr max_dist_log_d1 in
      let temp_lightval = (f1_0 / 4) + (face_light / 2) in
      let light = beam_brightness in
      let light =
        if use_beam <> 0
        then (
          let beam_scale = Ox_math.fixdiv ~a:point_z ~b:point_dist in
          let beam_scale = Ox_math.fixmul ~a:beam_scale ~b:beam_scale in
          Ox_math.fixmul ~a:light ~b:beam_scale)
        else light
      in
      Ox_math.fixmul ~a:light ~b:(Ox_math.fixmul ~a:dist_scale ~b:temp_lightval)))
;;

(* D2: compute_headlight_light
   Pure computation: takes point (x,y,z), face_light, beam_brightness,
   player_flags, player_energy, is_viewer.
   Returns light intensity as fix.
   PLAYER_FLAGS_HEADLIGHT = 0x08000000 (bit 27)
   PLAYER_FLAGS_HEADLIGHT_ON = 0x10000000 (bit 28) *)
let player_flags_headlight = 0x08000000
let player_flags_headlight_on = 0x10000000

let compute_headlight_light_d2
      ~point_x
      ~point_y
      ~point_z
      ~face_light
      ~beam_brightness
      ~player_flags
      ~player_energy
      ~is_viewer
  =
  let has_headlight = player_flags land player_flags_headlight <> 0 in
  let headlight_on = player_flags land player_flags_headlight_on <> 0 in
  let use_beam = has_headlight && headlight_on && is_viewer <> 0 && player_energy > 0 in
  let light =
    if use_beam then beam_brightness * headlight_boost_scale else beam_brightness
  in
  if light = 0
  then 0
  else (
    let point_dist = Ox_math.vm_vec_mag_quick ~v:(point_x, point_y, point_z) in
    if point_dist >= max_dist
    then 0
    else (
      let dist_scale = (max_dist - point_dist) asr max_dist_log_d2 in
      let light = Ox_math.fixmul ~a:light ~b:dist_scale in
      let face_light = max face_light 0 in
      let face_scale = (f1_0 / 4) + (face_light / 2) in
      let light = Ox_math.fixmul ~a:light ~b:face_scale in
      if use_beam
      then
        if face_light > f1_0 * 3 / 4 && point_z > Ox_math.i2f ~a:12
        then (
          let beam_scale = Ox_math.fixdiv ~a:point_z ~b:point_dist in
          let beam_scale = Ox_math.fixmul ~a:beam_scale ~b:beam_scale in
          Ox_math.fixmul ~a:light ~b:beam_scale)
        else light
      else light))
;;

(* compute_object_light — smooths lighting transitions for rendered objects.
   Shared between D1 and D2 (differences handled by C pre-computing headlight/dynamic).
   LIGHT_RATE = i2f(4) = 0x40000.
   Packed input (8 ints):
     0: static_light      — Segments[segnum].static_light
     1: object_light_cur   — cached object_light[objnum]
     2: id_or_sig_cur      — cached object_id[objnum] (D1) or object_sig[objnum] (D2)
     3: obj_id_or_sig      — obj->id (D1) or obj->signature (D2)
     4: frame_time         — FrameTime
     5: is_stale           — 1 if viewer changed (D1) or reset_lighting_hack (D2)
     6: headlight_contrib  — pre-computed headlight light
     7: dynamic_light      — pre-computed compute_seg_dynamic_light result
   Returns array (2 ints):
     0: final_light
     1: new_object_light   — updated cache value *)
(* lighting_cache_visible — D2 only.
   Determines if a vertex is visible from a light source, using a frame-based cache.
   Packed input (13 ints):
     0: vertnum         — vertex index
     1: segnum          — segment containing the vertex
     2: objnum          — object (light source) number
     3: obj_pos_x       — light source position x
     4: obj_pos_y       — light source position y
     5: obj_pos_z       — light source position z
     6: obj_seg         — segment containing the light source
     7: vertpos_x       — vertex position x
     8: vertpos_y       — vertex position y
     9: vertpos_z       — vertex position z
    10: frame_count     — current FrameCount
    11: lighting_frame_delta — recompute interval
    12: cache_val       — current Lighting_cache entry for this (segnum,vertnum)
   Returns array (3 ints):
     0: apply_light     — 1 if visible, 0 if not
     1: new_cache_val   — new cache value to write back (-1 if cache hit, no write needed)
     2: cache_hit       — 1 if cache hit (for Cache_hits counter) *)

let lighting_cache_size = 4096
let lighting_cache_shift = 8
let fq_transwall = 2
let hit_none = 0
let hit_wall = 1
let hit_object = 2

let lighting_cache_visible (packed : int array) =
  let vertnum = packed.(0) in
  let segnum = packed.(1) in
  let objnum = packed.(2) in
  let obj_pos_x = packed.(3) in
  let obj_pos_y = packed.(4) in
  let obj_pos_z = packed.(5) in
  let obj_seg = packed.(6) in
  let vertpos_x = packed.(7) in
  let vertpos_y = packed.(8) in
  let vertpos_z = packed.(9) in
  let frame_count = packed.(10) in
  let lighting_frame_delta = packed.(11) in
  let cache_val = packed.(12) in
  let cache_frame = cache_val asr 1 in
  let cache_vis = cache_val land 1 in
  (* Cache_lookups++ done on C side *)
  if cache_frame <> 0 && cache_frame + lighting_frame_delta > frame_count
  then (* Cache hit *)
    [| cache_vis; -1; 1 |]
  else (
    (* Cache miss — perform FVI ray cast *)
    let fate, _hit_px, _hit_py, _hit_pz, _hit_seg, _hit_side, _hit_side_seg,
        _hit_object, _wn_x, _wn_y, _wn_z, _n_segs, _seglist =
      Effect.perform
        (Ox_physics_sim.Find_vector_intersection
           ( obj_pos_x, obj_pos_y, obj_pos_z
           , vertpos_x, vertpos_y, vertpos_z
           , 0 (* rad *)
           , objnum (* thisobjnum *)
           , [| -1 |] (* ignore_obj_list: NULL → terminated list *)
           , fq_transwall (* flags *)
           , obj_seg (* startseg *) ))
    in
    let apply_light =
      if fate = hit_none then 1
      else if fate = hit_wall then (
        let dist_dist =
          Ox_math.vm_vec_dist_quick
            ~a:(_hit_px, _hit_py, _hit_pz)
            ~b:(obj_pos_x, obj_pos_y, obj_pos_z)
        in
        if dist_dist < f1_0 / 4 then 1 else 0)
      else (
        (* hit_object: Int3() in C — shouldn't happen *)
        if fate = hit_object then ignore (fate : int);
        0)
    in
    let new_cache_val = apply_light + (frame_count lsl 1) in
    (* Use segnum for cache index (matches C parameter, not the shadowed local) *)
    ignore (segnum : int);
    ignore (vertnum : int);
    ignore (lighting_cache_size : int);
    ignore (lighting_cache_shift : int);
    [| apply_light; new_cache_val; 0 |])
;;

let compute_object_light (packed : int array) =
  let light_rate = 0x40000 in
  (* i2f(4) = 4 << 16 *)
  let static_light = packed.(0) in
  let object_light_cur = packed.(1) in
  let id_or_sig_cur = packed.(2) in
  let obj_id_or_sig = packed.(3) in
  let frame_time = packed.(4) in
  let is_stale = packed.(5) <> 0 in
  let headlight_contrib = packed.(6) in
  let dynamic_light = packed.(7) in
  let light, new_object_light =
    if (not is_stale) && id_or_sig_cur = obj_id_or_sig
    then (
      (* Smooth transition toward static_light *)
      let delta_light = static_light - object_light_cur in
      let frame_delta = Ox_math.fixmul ~a:light_rate ~b:frame_time in
      if Int.abs delta_light <= frame_delta
      then static_light, static_light
      else if delta_light < 0
      then (
        let new_ol = object_light_cur - frame_delta in
        new_ol, new_ol)
      else (
        let new_ol = object_light_cur + frame_delta in
        new_ol, new_ol))
    else (* New object or stale — initialize cache *)
      static_light, static_light
  in
  let light = light + headlight_contrib + dynamic_light in
  [| light; new_object_light |]
;;
