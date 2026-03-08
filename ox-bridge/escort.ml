(* Bridge adapter for escort/thief functions.
   Ported from main_d2/escort.cpp *)

(* C externals for segment/wall data effects *)
external fetch_segment_data_c : int -> int array = "cd_ox_fetch_segment_data"
external fetch_wall_data_c : int -> int -> int array = "cd_ox_fetch_wall_data"

(* Effect handler for create_bfs_list — needs Fetch_segment_data and Fetch_wall_data *)
let effc (type a) (eff : a Effect.t) : ((a, 'b) Effect.Deep.continuation -> 'b) option =
  match eff with
  | Ox_gameseg.Fetch_segment_data segnum ->
    Some (fun k -> Effect.Deep.continue k (fetch_segment_data_c segnum))
  | Ox_aipath.Fetch_wall_data (segnum, sidenum) ->
    Some (fun k -> Effect.Deep.continue k (fetch_wall_data_c segnum sidenum))
  | _ -> None
;;

let cd_init_thief_for_level game_mode =
  Ox_escort.init_thief_for_level ~game_mode
;;

let cd_create_bfs_list start_seg max_segs buddy_ailp_mode player_flags =
  Effect.Deep.match_with
    (fun () ->
      Ox_escort.create_bfs_list ~start_seg ~max_segs ~buddy_ailp_mode ~player_flags)
    ()
    { retc = (fun r -> r)
    ; exnc = (fun e ->
        Printf.eprintf "[OX] create_bfs_list exception: %s\n" (Exn.to_string e);
        Out_channel.flush stderr;
        [| 0 |])
    ; effc = (fun (type a) (eff : a Effect.t) -> effc eff)
    }
;;

let register_callbacks () =
  Callback.register "cd_init_thief_for_level" cd_init_thief_for_level;
  Callback.register "cd_create_bfs_list" cd_create_bfs_list
;;
