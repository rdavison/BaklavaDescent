(* FVI bridge — v2 on-demand effects entry points.
   All FVI functions use algebraic effects (Fetch_segment_data, Fetch_object_data,
   Fetch_collision_table) to fetch data on demand from C, avoiding O(world) copying. *)

(* check_trans_wall callback: OCaml calls back into C for per-pixel
   transparency check on FQ_TRANSPOINT walls.
   Args: segnum, sidenum, facenum, hit_x, hit_y, hit_z → 1 if passable *)
external check_trans_wall_c
  :  int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  = "cd_ox_check_trans_wall_bytecode" "cd_ox_check_trans_wall"

let () = Ox_fvi.check_trans_wall_callback := check_trans_wall_c

(* C externals for on-demand data fetching *)
external fetch_segment_data_c : int -> int array = "cd_ox_fetch_segment_data"
external fetch_object_data_c : int -> int array = "cd_ox_fetch_object_data"
external fetch_collision_table_c : unit -> int array = "cd_ox_fetch_collision_table"

(* Run an OCaml function under effect handlers for FVI data fetching.
   Handles: Fetch_segment_data, Fetch_object_data, Fetch_collision_table *)
let run_with_fvi_effects : 'a. (unit -> 'a) -> 'a =
  fun f ->
  Effect.Deep.match_with f ()
    { retc = (fun x -> x)
    ; exnc = (fun e -> raise e)
    ; effc = (fun (type a) (eff : a Effect.t) ->
        match eff with
        | Ox_gameseg.Fetch_segment_data segnum ->
          Some (fun (k : (a, _) Effect.Deep.continuation) ->
            let data = fetch_segment_data_c segnum in
            Effect.Deep.continue k data)
        | Ox_fvi.Fetch_object_data objnum ->
          Some (fun (k : (a, _) Effect.Deep.continuation) ->
            let data = fetch_object_data_c objnum in
            Effect.Deep.continue k data)
        | Ox_fvi.Fetch_collision_table ->
          Some (fun (k : (a, _) Effect.Deep.continuation) ->
            let data = fetch_collision_table_c () in
            Effect.Deep.continue k data)
        | _ -> None)
    }
;;

let cd_find_vector_intersection_v2 (arr : int array) =
  try
    run_with_fvi_effects (fun () -> Ox_fvi.find_vector_intersection_v2 arr)
  with exn ->
    Printf.eprintf "OX_SHADOW: cd_find_vector_intersection_v2 exception: %s\n"
      (Exn.to_string exn);
    Out_channel.flush stderr;
    let p0x = arr.(0) in
    let p0y = arr.(1) in
    let p0z = arr.(2) in
    [| 3; p0x; p0y; p0z; arr.(3); 0; -1; 0; 0; 0; 0; 0 |]
;;

let cd_object_intersects_wall_v2 (arr : int array) =
  try
    run_with_fvi_effects (fun () -> Ox_fvi.sphere_intersects_wall_v2 arr)
  with _ -> 0
;;

let cd_find_homing_object_complete_v2 (arr : int array) =
  try
    run_with_fvi_effects (fun () -> Ox_fvi.find_homing_object_complete_v2 arr)
  with exn ->
    Printf.eprintf "OX_SHADOW: cd_find_homing_object_complete_v2 exception: %s\n"
      (Exn.to_string exn);
    Out_channel.flush stderr;
    -1
;;

let cd_find_homing_object_v2 (arr : int array) =
  try
    run_with_fvi_effects (fun () -> Ox_fvi.find_homing_object_v2 arr)
  with exn ->
    Printf.eprintf "OX_SHADOW: cd_find_homing_object_v2 exception: %s\n"
      (Exn.to_string exn);
    Out_channel.flush stderr;
    -1
;;

let cd_track_track_goal_v2 (arr : int array) =
  try
    run_with_fvi_effects (fun () -> Ox_fvi.track_track_goal_v2 arr)
  with exn ->
    Printf.eprintf "OX_SHADOW: cd_track_track_goal_v2 exception: %s\n"
      (Exn.to_string exn);
    Out_channel.flush stderr;
    [| 0; 0 |]
;;

let cd_player_is_visible_from_object_v2 (arr : int array) =
  try
    run_with_fvi_effects (fun () -> Ox_fvi.player_is_visible_from_object_v2 arr)
  with exn ->
    Printf.eprintf "OX_SHADOW: cd_player_is_visible_from_object_v2 exception: %s\n"
      (Exn.to_string exn);
    Out_channel.flush stderr;
    Array.create ~len:11 0
;;

let cd_compute_vis_and_vec_v2 (arr : int array) =
  try
    run_with_fvi_effects (fun () -> Ox_fvi.compute_vis_and_vec_v2 arr)
  with exn ->
    Printf.eprintf "OX_SHADOW: cd_compute_vis_and_vec_v2 exception: %s\n"
      (Exn.to_string exn);
    Out_channel.flush stderr;
    Array.create ~len:28 0
;;

let () =
  Callback.register "cd_find_vector_intersection_v2" cd_find_vector_intersection_v2;
  Callback.register "cd_object_intersects_wall_v2" cd_object_intersects_wall_v2;
  Callback.register "cd_find_homing_object_complete_v2" cd_find_homing_object_complete_v2;
  Callback.register "cd_find_homing_object_v2" cd_find_homing_object_v2;
  Callback.register "cd_track_track_goal_v2" cd_track_track_goal_v2;
  Callback.register "cd_player_is_visible_from_object_v2" cd_player_is_visible_from_object_v2;
  Callback.register "cd_compute_vis_and_vec_v2" cd_compute_vis_and_vec_v2
;;
