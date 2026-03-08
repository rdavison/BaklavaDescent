(* Pure OCaml game logic for wall functions.
   Ported from main_d1/wall.cpp and main_d2/wall.cpp *)

(* Constants *)
let max_walls_d1 = 175
let max_walls_d2 = 254
let wall_normal = 0

(* -- Algebraic effects -------------------------------------------------- *)

type _ Effect.t +=
  | Fetch_reset_walls_info : unit -> int array Effect.t
  | Write_reset_walls : int array -> unit Effect.t
  | Fetch_kill_stuck_data : int -> int array Effect.t
      (* wallnum -> [is_d2, num_stuck, wallnum_0, objnum_0, obj_type_0, ...] = 98 ints *)
  | Write_kill_stuck_objects : int array -> unit Effect.t
      (* [new_num_stuck, n_matches, (slot_i, objnum_i, is_weapon_i) x n_matches] *)
  | Flush_fcd_cache : unit -> unit Effect.t
  | Fetch_seg_children_and_wall_nums : int -> int array Effect.t
      (* segnum -> [children[0..5]; side_wall_nums[0..5]] = 12 ints *)
  | Wall_set_flags : int * int -> unit Effect.t
      (* (wall_num, flags_to_set) -> Walls[wall_num].flags |= flags *)
  | Wall_clear_flags : int * int -> unit Effect.t
      (* (wall_num, flags_to_clear) -> Walls[wall_num].flags &= ~flags *)
  | Fetch_wall_cloak_data : (int * int) -> int array Effect.t
      (* (segnum, side) -> packed array:
         [0] newdemo_state
         [1] wall_num  [2] wall_type  [3] wall_state  [4] wall_linked_wall
         [5] child_segnum  [6] connect_side  [7] connect_wall_num
         [8] num_cloaking_walls
         For i=0..9: [9+i*3] front_wallnum [10+i*3] back_wallnum [11+i*3] time
         [39..42] front_ls[0..3]  [43..46] back_ls[0..3]
         Total: 47 ints *)
  | Write_wall_cloak_result : int array -> unit Effect.t
      (* packed mutation array:
         [0] wall_num  [1] new_wall_type (-1=skip)  [2] new_wall_state (-1=skip)
         [3] connect_wall_num  [4] new_connect_wall_type (-1=skip)
         [5] new_connect_wall_state (-1=skip)
         [6] cloaking_wall_idx  [7] cw_front_wallnum  [8] cw_back_wallnum
         [9] cw_time  [10] new_num_cloaking_walls (-1=skip)
         [11] sound_id (-1=no sound)  [12] segnum  [13] side
         [14] sound_px  [15] sound_py  [16] sound_pz
         [17..20] cw_front_ls[0..3]  [21..24] cw_back_ls[0..3]
         Total: 25 ints *)

(* reset_walls: Tidy up Walls array for load/save purposes.
   Resets all wall entries from Num_walls to MAX_WALLS-1 to defaults.
   Ported from wall.cpp (identical in D1 and D2). *)
let reset_walls () =
  (* Fetch [num_walls; is_d2] from C *)
  let info = Effect.perform (Fetch_reset_walls_info ()) in
  let num_walls = info.(0) in
  let is_d2 = info.(1) in
  if num_walls < 0 then
    Printf.eprintf "Illegal Num_walls\n"
  else begin
    let max_walls = if is_d2 <> 0 then max_walls_d2 else max_walls_d1 in
    (* Tell C to reset walls[num_walls .. max_walls-1] to defaults:
       type=WALL_NORMAL(0), flags=0, hps=0, trigger=-1, clip_num=-1 *)
    Effect.perform (Write_reset_walls [| num_walls; max_walls |])
  end
;;

(* Constants for kill_stuck_objects *)
let max_stuck_objects = 32
let obj_weapon = 5
let f1_0 = 0x10000

(* kill_stuck_objects: Door with wall index wallnum is opening, kill all objects stuck in it.
   Ported from main_d1/wall.cpp and main_d2/wall.cpp.
   D1: lifeleft = F1_0/4, no flush_fcd_cache
   D2: lifeleft = F1_0/8, flush_fcd_cache at end *)
let kill_stuck_objects ~wallnum =
  (* Fetch stuck objects data:
     [is_d2, num_stuck, wallnum_0, objnum_0, obj_type_0, ...] *)
  let data = Effect.perform (Fetch_kill_stuck_data wallnum) in
  let is_d2 = data.(0) <> 0 in
  let num_stuck = data.(1) in
  if num_stuck = 0 then ()
  else begin
  (* Num_stuck_objects = 0 at start, then recount *)
  let new_num_stuck = ref 0 in
  let matches = Array.create ~len:(max_stuck_objects * 3) 0 in
  let n_matches = ref 0 in
  for i = 0 to max_stuck_objects - 1 do
    let base = 2 + i * 3 in
    let wn = data.(base) in
    let objnum = data.(base + 1) in
    let obj_type = data.(base + 2) in
    if wn = wallnum then begin
      let is_weapon = if obj_type = obj_weapon then 1 else 0 in
      if obj_type <> obj_weapon then
        Printf.eprintf "Warning: Stuck object of type %d, expected to be of type %d, see wall.c\n"
          obj_type obj_weapon;
      matches.(!n_matches * 3) <- i;
      matches.(!n_matches * 3 + 1) <- objnum;
      matches.(!n_matches * 3 + 2) <- is_weapon;
      n_matches := !n_matches + 1
    end else if wn <> -1 then
      new_num_stuck := !new_num_stuck + 1
  done;
  (* Write back: [new_num_stuck, n_matches, (slot_i, objnum_i, is_weapon_i) x n_matches] *)
  let result = Array.create ~len:(2 + !n_matches * 3) 0 in
  result.(0) <- !new_num_stuck;
  result.(1) <- !n_matches;
  for j = 0 to !n_matches - 1 do
    result.(2 + j * 3) <- matches.(j * 3);
    result.(2 + j * 3 + 1) <- matches.(j * 3 + 1);
    result.(2 + j * 3 + 2) <- matches.(j * 3 + 2)
  done;
  Effect.perform (Write_kill_stuck_objects result);
  (* D2 calls flush_fcd_cache; D1 does not *)
  if is_d2 then
    Effect.perform (Flush_fcd_cache ())
  end
;;

(* WALL_ILLUSION_OFF = 32 *)
(* check_poke: check if an object pokes through a given side of a segment.
   Returns true if object pokes through, false otherwise.
   Objects with zero size never block doors.
   Ported from wall.cpp check_poke (identical in D1 and D2). *)
let check_poke ~objnum ~segnum ~side =
  (* Fetch object data: index 3,4,5 = pos xyz, index 6 = size *)
  let obj_data = Effect.perform (Ox_fvi.Fetch_object_data objnum) in
  let obj_size = obj_data.(6) in
  if obj_size = 0 then false
  else begin
    let obj_pos = (obj_data.(3), obj_data.(4), obj_data.(5)) in
    (* Fetch segment geometry for get_seg_masks *)
    let seg_data = Effect.perform (Ox_gameseg.Fetch_segment_data segnum) in
    let _children, side_types, seg_verts, normals, seg_vert_positions =
      Ox_gameseg.unpack_seg_from_fetch seg_data
    in
    let _facemask, sidemask, _centermask =
      Ox_gameseg.get_seg_masks
        ~checkp:obj_pos
        ~rad:obj_size
        ~seg_verts
        ~side_types
        ~normals
        ~seg_vert_positions
    in
    sidemask land (1 lsl side) <> 0
  end
;;

let obj_fireball = 1
let obj_weapon = 5

(* is_door_free: check if a doorway is unobstructed (no objects poking through).
   Returns true if door is free to close, false if blocked.
   Ported from wall.cpp is_door_free (identical in D1 and D2). *)
let is_door_free ~segnum ~side =
  (* Get segment children to find child segment *)
  let seg_data = Effect.perform (Fetch_seg_children_and_wall_nums segnum) in
  let child_segnum = seg_data.(side) in
  (* Get cseg children for find_connect_side *)
  let cseg_data = Effect.perform (Fetch_seg_children_and_wall_nums child_segnum) in
  let cseg_children = Array.init 6 ~f:(fun i -> cseg_data.(i)) in
  let connect_side = Ox_gameseg.find_connect_side ~children:cseg_children ~base_seg_num:segnum in
  assert (connect_side <> -1);
  (* Get objects head for both segments via Fetch_segment_data (index 86) *)
  let seg_full = Effect.perform (Ox_gameseg.Fetch_segment_data segnum) in
  let cseg_full = Effect.perform (Ox_gameseg.Fetch_segment_data child_segnum) in
  let seg_objects_head = seg_full.(86) in
  let cseg_objects_head = cseg_full.(86) in
  (* Check objects in first segment *)
  let blocked = ref false in
  let objnum = ref seg_objects_head in
  while !objnum <> -1 && not !blocked do
    let obj_data = Effect.perform (Ox_fvi.Fetch_object_data !objnum) in
    let obj_type = obj_data.(0) in
    let obj_next = obj_data.(7) in
    if obj_type <> obj_weapon && obj_type <> obj_fireball
       && check_poke ~objnum:!objnum ~segnum ~side
    then blocked := true;
    objnum := obj_next
  done;
  if !blocked then false
  else begin
    (* Check objects in connected segment *)
    let objnum2 = ref cseg_objects_head in
    while !objnum2 <> -1 && not !blocked do
      let obj_data = Effect.perform (Ox_fvi.Fetch_object_data !objnum2) in
      let obj_type = obj_data.(0) in
      let obj_next = obj_data.(7) in
      if obj_type <> obj_weapon && obj_type <> obj_fireball
         && check_poke ~objnum:!objnum2 ~segnum:child_segnum ~side:connect_side
      then blocked := true;
      objnum2 := obj_next
    done;
    not !blocked
  end
;;

let wall_illusion_off_flag = 32

(* wall_illusion_off: Turn off an illusionary wall.
   Ported from wall.cpp (identical in D1 and D2). *)
let wall_illusion_off ~segnum ~side =
  let seg_data = Effect.perform (Fetch_seg_children_and_wall_nums segnum) in
  let child_seg = seg_data.(side) in
  let child_data = Effect.perform (Fetch_seg_children_and_wall_nums child_seg) in
  let child_children = Array.init 6 ~f:(fun i -> child_data.(i)) in
  let cside = Ox_gameseg.find_connect_side ~children:child_children ~base_seg_num:segnum in
  assert (cside <> -1);
  let wall_num = seg_data.(6 + side) in
  if wall_num = -1 then ()
  else begin
    let cwall_num = child_data.(6 + cside) in
    Effect.perform (Wall_set_flags (wall_num, wall_illusion_off_flag));
    Effect.perform (Wall_set_flags (cwall_num, wall_illusion_off_flag))
  end
;;

(* wall_illusion_on: Turn on an illusionary wall.
   Ported from wall.cpp (identical in D1 and D2). *)
let wall_illusion_on ~segnum ~side =
  let seg_data = Effect.perform (Fetch_seg_children_and_wall_nums segnum) in
  let child_seg = seg_data.(side) in
  let child_data = Effect.perform (Fetch_seg_children_and_wall_nums child_seg) in
  let child_children = Array.init 6 ~f:(fun i -> child_data.(i)) in
  let cside = Ox_gameseg.find_connect_side ~children:child_children ~base_seg_num:segnum in
  assert (cside <> -1);
  let wall_num = seg_data.(6 + side) in
  if wall_num = -1 then ()
  else begin
    let cwall_num = child_data.(6 + cside) in
    Effect.perform (Wall_clear_flags (wall_num, wall_illusion_off_flag));
    Effect.perform (Wall_clear_flags (cwall_num, wall_illusion_off_flag))
  end
;;

(* Wall cloaking constants *)
let wall_open = 4
let wall_closed = 5
let wall_door_closed = 0
let wall_door_cloaking = 5
let wall_door_decloaking = 6
let nd_state_playback = 2
let max_cloaking_walls = 10
let cloaking_wall_time = 0x10000  (* f1_0 *)
let sound_wall_cloak_on = 160
let sound_wall_cloak_off = 161

(* start_wall_cloak: Start the transition from closed -> open wall.
   Ported from main_d2/wall.cpp *)
let start_wall_cloak ~segnum ~side =
  let data = Effect.perform (Fetch_wall_cloak_data (segnum, side)) in
  let newdemo_state = data.(0) in
  if newdemo_state = nd_state_playback then ()
  else begin
    let wall_num = data.(1) in
    assert (wall_num <> -1);
    let wall_type = data.(2) in
    let wall_state = data.(3) in
    let wall_linked_wall = data.(4) in
    let child_segnum = data.(5) in
    let connect_side = data.(6) in
    let connect_wall_num = data.(7) in
    let num_cloaking_walls = data.(8) in
    if wall_type = wall_open || wall_state = wall_door_cloaking then
      ()  (* already open or cloaking *)
    else begin
      assert (connect_side <> -1);
      if wall_state = wall_door_decloaking then begin
        (* decloaking, so reuse door — find matching cloaking wall *)
        let found_idx = ref (-1) in
        for i = 0 to num_cloaking_walls - 1 do
          let cw_front = data.(9 + i * 3) in
          let cw_back = data.(9 + i * 3 + 1) in
          if cw_front = wall_num || cw_back = wall_num then
            found_idx := i
        done;
        assert (!found_idx >= 0);
        let old_time = data.(9 + !found_idx * 3 + 2) in
        let new_time = cloaking_wall_time - old_time in
        (* Compute sound position *)
        let seg_data = Effect.perform (Ox_gameseg.Fetch_segment_data segnum) in
        let sv = Ox_gameseg.side_to_verts.(side) in
        let v i =
          seg_data.(56 + i * 3), seg_data.(56 + i * 3 + 1), seg_data.(56 + i * 3 + 2)
        in
        let px, py, pz =
          Ox_gameseg.compute_center_point_on_side
            ~v0:(v sv.(0)) ~v1:(v sv.(1)) ~v2:(v sv.(2)) ~v3:(v sv.(3))
        in
        let result = Array.create ~len:25 (-1) in
        result.(0) <- wall_num;
        result.(1) <- -1;  (* don't change wall type *)
        result.(2) <- wall_door_cloaking;
        result.(3) <- connect_wall_num;
        result.(4) <- -1;
        result.(5) <- wall_door_cloaking;
        result.(6) <- !found_idx;
        result.(7) <- wall_num;  (* front_wallnum = seg wall *)
        result.(8) <- connect_wall_num;  (* back_wallnum = cseg wall *)
        result.(9) <- new_time;
        result.(10) <- -1;  (* don't change num_cloaking_walls *)
        result.(11) <- sound_wall_cloak_on;
        result.(12) <- segnum;
        result.(13) <- side;
        result.(14) <- px;
        result.(15) <- py;
        result.(16) <- pz;
        (* Copy light values from fetch data *)
        for i = 0 to 3 do
          result.(17 + i) <- data.(39 + i);
          result.(21 + i) <- data.(43 + i)
        done;
        Effect.perform (Write_wall_cloak_result result)
      end
      else if wall_state = wall_door_closed then begin
        (* create new door *)
        if num_cloaking_walls >= max_cloaking_walls then begin
          (* no more! — just force open *)
          let result = Array.create ~len:25 (-1) in
          result.(0) <- wall_num;
          result.(1) <- wall_open;
          result.(2) <- -1;
          result.(3) <- connect_wall_num;
          result.(4) <- wall_open;
          result.(5) <- -1;
          (* no cloaking wall to write *)
          result.(6) <- -1;
          result.(10) <- -1;
          result.(11) <- -1;  (* no sound *)
          Effect.perform (Write_wall_cloak_result result)
        end
        else begin
          assert (wall_linked_wall = -1);
          (* Compute sound position *)
          let seg_data = Effect.perform (Ox_gameseg.Fetch_segment_data segnum) in
          let sv = Ox_gameseg.side_to_verts.(side) in
          let v i =
            seg_data.(56 + i * 3), seg_data.(56 + i * 3 + 1), seg_data.(56 + i * 3 + 2)
          in
          let px, py, pz =
            Ox_gameseg.compute_center_point_on_side
              ~v0:(v sv.(0)) ~v1:(v sv.(1)) ~v2:(v sv.(2)) ~v3:(v sv.(3))
          in
          (* Compute sound position for cseg side *)
          let cseg_data = Effect.perform (Ox_gameseg.Fetch_segment_data child_segnum) in
          let _ = cseg_data in  (* back_ls comes from fetch data *)
          let result = Array.create ~len:25 (-1) in
          result.(0) <- wall_num;
          result.(1) <- -1;
          result.(2) <- wall_door_cloaking;
          result.(3) <- connect_wall_num;
          result.(4) <- -1;
          result.(5) <- wall_door_cloaking;
          result.(6) <- num_cloaking_walls;  (* new slot *)
          result.(7) <- wall_num;
          result.(8) <- connect_wall_num;
          result.(9) <- 0;  (* time = 0 for new door *)
          result.(10) <- num_cloaking_walls + 1;  (* new num_cloaking_walls *)
          result.(11) <- sound_wall_cloak_on;
          result.(12) <- segnum;
          result.(13) <- side;
          result.(14) <- px;
          result.(15) <- py;
          result.(16) <- pz;
          for i = 0 to 3 do
            result.(17 + i) <- data.(39 + i);
            result.(21 + i) <- data.(43 + i)
          done;
          Effect.perform (Write_wall_cloak_result result)
        end
      end
      (* else: unexpected wall state — C does Int3() + return *)
    end
  end
;;

(* start_wall_decloak: Start the transition from open -> closed wall.
   Ported from main_d2/wall.cpp *)
let start_wall_decloak ~segnum ~side =
  let data = Effect.perform (Fetch_wall_cloak_data (segnum, side)) in
  let newdemo_state = data.(0) in
  if newdemo_state = nd_state_playback then ()
  else begin
    let wall_num = data.(1) in
    assert (wall_num <> -1);
    let wall_type = data.(2) in
    let wall_state = data.(3) in
    let wall_linked_wall = data.(4) in
    let child_segnum = data.(5) in
    let connect_side = data.(6) in
    let connect_wall_num = data.(7) in
    let num_cloaking_walls = data.(8) in
    if wall_type = wall_closed || wall_state = wall_door_decloaking then
      ()  (* already closed or decloaking *)
    else begin
      if wall_state = wall_door_cloaking then begin
        (* cloaking, so reuse door — find matching cloaking wall *)
        let found_idx = ref (-1) in
        for i = 0 to num_cloaking_walls - 1 do
          let cw_front = data.(9 + i * 3) in
          let cw_back = data.(9 + i * 3 + 1) in
          if cw_front = wall_num || cw_back = wall_num then
            found_idx := i
        done;
        assert (!found_idx >= 0);
        let old_time = data.(9 + !found_idx * 3 + 2) in
        let new_time = cloaking_wall_time - old_time in
        (* Note: in decloak, csegp/Connectside are computed AFTER state change *)
        assert (connect_side <> -1);
        (* Compute sound position *)
        let seg_data = Effect.perform (Ox_gameseg.Fetch_segment_data segnum) in
        let sv = Ox_gameseg.side_to_verts.(side) in
        let v i =
          seg_data.(56 + i * 3), seg_data.(56 + i * 3 + 1), seg_data.(56 + i * 3 + 2)
        in
        let px, py, pz =
          Ox_gameseg.compute_center_point_on_side
            ~v0:(v sv.(0)) ~v1:(v sv.(1)) ~v2:(v sv.(2)) ~v3:(v sv.(3))
        in
        let result = Array.create ~len:25 (-1) in
        result.(0) <- wall_num;
        result.(1) <- -1;
        result.(2) <- wall_door_decloaking;
        result.(3) <- connect_wall_num;
        result.(4) <- -1;
        result.(5) <- wall_door_decloaking;
        result.(6) <- !found_idx;
        result.(7) <- wall_num;
        result.(8) <- connect_wall_num;
        result.(9) <- new_time;
        result.(10) <- -1;
        result.(11) <- sound_wall_cloak_off;
        result.(12) <- segnum;
        result.(13) <- side;
        result.(14) <- px;
        result.(15) <- py;
        result.(16) <- pz;
        for i = 0 to 3 do
          result.(17 + i) <- data.(39 + i);
          result.(21 + i) <- data.(43 + i)
        done;
        Effect.perform (Write_wall_cloak_result result)
      end
      else if wall_state = wall_door_closed then begin
        (* Note: in decloak's closed branch, csegp is NOT yet computed
           but the C code accesses csegp->sides[Connectside].wall_num
           which would be uninitialized — this is likely a C bug.
           We use the data from our fetch which pre-computes connect_side. *)
        if num_cloaking_walls >= max_cloaking_walls then begin
          let result = Array.create ~len:25 (-1) in
          result.(0) <- wall_num;
          result.(1) <- wall_closed;
          result.(2) <- -1;
          result.(3) <- connect_wall_num;
          result.(4) <- wall_closed;
          result.(5) <- -1;
          result.(6) <- -1;
          result.(10) <- -1;
          result.(11) <- -1;
          Effect.perform (Write_wall_cloak_result result)
        end
        else begin
          assert (connect_side <> -1);
          assert (wall_linked_wall = -1);
          let seg_data = Effect.perform (Ox_gameseg.Fetch_segment_data segnum) in
          let sv = Ox_gameseg.side_to_verts.(side) in
          let v i =
            seg_data.(56 + i * 3), seg_data.(56 + i * 3 + 1), seg_data.(56 + i * 3 + 2)
          in
          let px, py, pz =
            Ox_gameseg.compute_center_point_on_side
              ~v0:(v sv.(0)) ~v1:(v sv.(1)) ~v2:(v sv.(2)) ~v3:(v sv.(3))
          in
          let _ = Effect.perform (Ox_gameseg.Fetch_segment_data child_segnum) in
          let result = Array.create ~len:25 (-1) in
          result.(0) <- wall_num;
          result.(1) <- -1;
          result.(2) <- wall_door_decloaking;
          result.(3) <- connect_wall_num;
          result.(4) <- -1;
          result.(5) <- wall_door_decloaking;
          result.(6) <- num_cloaking_walls;
          result.(7) <- wall_num;
          result.(8) <- connect_wall_num;
          result.(9) <- 0;
          result.(10) <- num_cloaking_walls + 1;
          result.(11) <- sound_wall_cloak_off;
          result.(12) <- segnum;
          result.(13) <- side;
          result.(14) <- px;
          result.(15) <- py;
          result.(16) <- pz;
          for i = 0 to 3 do
            result.(17 + i) <- data.(39 + i);
            result.(21 + i) <- data.(43 + i)
          done;
          Effect.perform (Write_wall_cloak_result result)
        end
      end
    end
  end
;;
