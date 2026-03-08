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
