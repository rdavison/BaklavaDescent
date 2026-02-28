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
