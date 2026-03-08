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

let cd_compute_object_light (packed : int array) = Ox_lighting.compute_object_light packed

(* FVI effect external — same C symbol as physics_sim bridge *)
external effect_find_vector_intersection
  :  int array
  -> int array
  = "cd_ox_effect_ps_find_vector_intersection"

(* lighting_cache_visible — runs with FVI effect handler *)
let cd_lighting_cache_visible (packed : int array) =
  Effect.Deep.match_with
    (fun () -> Ox_lighting.lighting_cache_visible packed)
    ()
    { retc = (fun x -> x)
    ; exnc =
        (fun _exn ->
          Printf.eprintf "OX: lighting_cache_visible exception\n";
          Out_channel.flush stderr;
          [| 0; -1; 0 |])
    ; effc =
        (fun (type a) (eff : a Effect.t) ->
          match eff with
          | Ox_physics_sim.Find_vector_intersection
              (p0x, p0y, p0z, p1x, p1y, p1z, rad, thisobjnum, ignore_list, flags, startseg)
            ->
            Some
              (fun (k : (a, _) Effect.Deep.continuation) ->
                try
                  let query =
                    [| p0x; p0y; p0z; p1x; p1y; p1z; rad; thisobjnum; flags; startseg
                     ; Array.length ignore_list
                    |]
                  in
                  let fpacked = Array.append query ignore_list in
                  let result = effect_find_vector_intersection fpacked in
                  let fate = result.(0) in
                  let hit_px = result.(1) in
                  let hit_py = result.(2) in
                  let hit_pz = result.(3) in
                  let hit_seg = result.(4) in
                  let hit_side = result.(5) in
                  let hit_side_seg = result.(6) in
                  let hit_object = result.(7) in
                  let wn_x = result.(8) in
                  let wn_y = result.(9) in
                  let wn_z = result.(10) in
                  let n_segs = result.(11) in
                  let seglist = Array.sub result ~pos:12 ~len:n_segs in
                  Effect.Deep.continue
                    k
                    ( fate, hit_px, hit_py, hit_pz, hit_seg, hit_side, hit_side_seg
                    , hit_object, wn_x, wn_y, wn_z, n_segs, seglist )
                with Invalid_argument _ ->
                  Effect.Deep.continue k (0, p0x, p0y, p0z, startseg, 0, -1, -1, 0, 0, 0, 0, [||]))
          | _ -> None)
    }

let register_callbacks () =
  Callback.register "cd_compute_headlight_light_d1" cd_compute_headlight_light_d1;
  Callback.register "cd_compute_headlight_light_d2" cd_compute_headlight_light_d2;
  Callback.register "cd_compute_object_light" cd_compute_object_light;
  Callback.register "cd_lighting_cache_visible" cd_lighting_cache_visible
;;
