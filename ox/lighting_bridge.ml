(* Bridge wrappers for lighting functions *)

(* D1: compute_headlight_light — 6 scalar args → fix *)
let cd_compute_headlight_light_d1
      point_x
      point_y
      point_z
      face_light
      beam_brightness
      use_beam
  =
  Ox_lighting.compute_headlight_light_d1
    ~point_x
    ~point_y
    ~point_z
    ~face_light
    ~beam_brightness
    ~use_beam
;;

(* D2: compute_headlight_light — 8 scalar args → fix *)
let cd_compute_headlight_light_d2
      point_x
      point_y
      point_z
      face_light
      beam_brightness
      player_flags
      player_energy
      is_viewer
  =
  Ox_lighting.compute_headlight_light_d2
    ~point_x
    ~point_y
    ~point_z
    ~face_light
    ~beam_brightness
    ~player_flags
    ~player_energy
    ~is_viewer
;;

let () =
  Callback.register "cd_compute_headlight_light_d1" cd_compute_headlight_light_d1;
  Callback.register "cd_compute_headlight_light_d2" cd_compute_headlight_light_d2
;;
