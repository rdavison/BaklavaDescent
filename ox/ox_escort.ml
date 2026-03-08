(* Pure OCaml game logic for escort/thief functions.
   Ported from main_d2/escort.cpp *)

let max_stolen_items = 10
let pow_energy = 1
let pow_shield_boost = 2
let gm_multi = 38

(* init_thief_for_level: Initialize stolen items array for a new level.
   D2 only. Returns [| stolen_items[0..9]; stolen_item_index |] *)
let max_segments = 900
let max_sides_per_segment = 6

(* segment_is_reachable: Check if a segment side is passable for BFS reachability.
   Ported from main_d2/escort.cpp segment_is_reachable().
   Called with objp=NULL context, so uses buddy ailp_mode and player_flags. *)
let segment_is_reachable ~curseg ~sidenum ~buddy_ailp_mode ~player_flags =
  let seg_data = Effect.perform (Ox_gameseg.Fetch_segment_data curseg) in
  let child = seg_data.(sidenum) in
  if child <= -1 then 0
  else
    let wall_data = Effect.perform (Ox_aipath.Fetch_wall_data (curseg, sidenum)) in
    let wall_num = wall_data.(0) in
    if wall_num = -1 then 1
    else
      Ox_ai.ai_door_is_openable_d2
        ~is_child:true
        ~is_console_object:false
        ~wall_num
        ~wall_type:wall_data.(1)
        ~wall_keys:wall_data.(2)
        ~wall_flags:wall_data.(3)
        ~wall_state:wall_data.(4)
        ~wall_clip_num:wall_data.(5)
        ~wall_controlling_trigger:wall_data.(6)
        ~wallanim_flags:wall_data.(7)
        ~objp_is_null:true
        ~is_companion:false
        ~robot_id:(-1)
        ~ai_behavior:0
        ~player_flags
        ~ailp_mode:buddy_ailp_mode
;;

(* create_bfs_list: Create a breadth-first list of reachable segments.
   Ported from main_d2/escort.cpp create_bfs_list().
   Returns int array: element 0 = length, elements 1..length = segment numbers. *)
let create_bfs_list ~start_seg ~max_segs ~buddy_ailp_mode ~player_flags =
  let visited = Array.create ~len:max_segments 0 in
  let bfs_list = Array.create ~len:max_segs 0 in
  let head = ref 0 in
  let tail = ref 0 in
  bfs_list.(!head) <- start_seg;
  head := !head + 1;
  visited.(start_seg) <- 1;
  let break_outer = ref false in
  while !head <> !tail && !head < max_segs && not !break_outer do
    let curseg = bfs_list.(!tail) in
    tail := !tail + 1;
    let i = ref 0 in
    while !i < max_sides_per_segment && not !break_outer do
      let seg_data = Effect.perform (Ox_gameseg.Fetch_segment_data curseg) in
      let connected_seg = seg_data.(!i) in
      if connected_seg > -1 && connected_seg < max_segments && visited.(connected_seg) = 0 then begin
        if segment_is_reachable ~curseg ~sidenum:!i ~buddy_ailp_mode ~player_flags <> 0 then begin
          bfs_list.(!head) <- connected_seg;
          head := !head + 1;
          if !head >= max_segs then
            break_outer := true
          else
            visited.(connected_seg) <- 1
        end
      end;
      i := !i + 1
    done
  done;
  let result = Array.create ~len:(!head + 1) 0 in
  result.(0) <- !head;
  Array.blit ~src:bfs_list ~src_pos:0 ~dst:result ~dst_pos:1 ~len:!head;
  result
;;

let init_thief_for_level ~game_mode =
  let items = Array.create ~len:max_stolen_items 255 in
  (* Assert MAX_STOLEN_ITEMS >= 3*2 — always true since 10 >= 6 *)
  if game_mode land gm_multi = 0 then
    for i = 0 to 2 do
      items.(2 * i) <- pow_shield_boost;
      items.((2 * i) + 1) <- pow_energy
    done;
  let result = Array.create ~len:(max_stolen_items + 1) 0 in
  Array.blit ~src:items ~src_pos:0 ~dst:result ~dst_pos:0 ~len:max_stolen_items;
  result.(max_stolen_items) <- 0;  (* Stolen_item_index = 0 *)
  result
;;
