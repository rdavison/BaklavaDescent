(* Pure OCaml game logic for switch/trigger functions.
   Ported from main_d2/switch.cpp *)

(* Wall flag constants *)
let wall_door_locked = 8
let key_none = 1

(* -- Algebraic effects -------------------------------------------------- *)

type _ Effect.t +=
  | Fetch_trigger_links : int -> int array Effect.t
      (* trigger_num -> [num_links, wallnum0, wallnum1, ...] *)
  | Lock_wall_door : int -> unit Effect.t
      (* wall_num -> sets WALL_DOOR_LOCKED flag *)
  | Unlock_wall_door : int -> unit Effect.t
      (* wall_num -> clears WALL_DOOR_LOCKED, sets keys=KEY_NONE *)
  | Get_num_triggers : unit -> int Effect.t
  | Get_num_walls : unit -> int Effect.t
  | Set_wall_flag_wall_switch : int -> unit Effect.t
  | Fetch_trigger_seg_sides : int -> int array Effect.t
      (* trigger_num -> [num_links, seg0, side0, seg1, side1, ...] *)

(* do_lock_doors: Locks all doors linked to the switch.
   Ported from main_d2/switch.cpp *)
let do_lock_doors ~trigger_num =
  if trigger_num <> -1 then begin
    let links = Effect.perform (Fetch_trigger_links trigger_num) in
    let num_links = links.(0) in
    for i = 0 to num_links - 1 do
      let wall_num = links.(1 + i) in
      Effect.perform (Lock_wall_door wall_num)
    done
  end

(* do_unlock_doors: Unlocks all doors linked to the switch.
   Ported from main_d2/switch.cpp *)
let do_unlock_doors ~trigger_num =
  if trigger_num <> -1 then begin
    let links = Effect.perform (Fetch_trigger_links trigger_num) in
    let num_links = links.(0) in
    for i = 0 to num_links - 1 do
      let wall_num = links.(1 + i) in
      Effect.perform (Unlock_wall_door wall_num)
    done
  end

(* door_is_wall_switched: Return trigger number if door is controlled by
   a wall switch, else return -1.
   Ported from main_d2/switch.cpp *)
let door_is_wall_switched ~wall_num =
  let num_triggers = Effect.perform (Get_num_triggers ()) in
  let result = ref (-1) in
  let found = ref false in
  let t = ref 0 in
  while !t < num_triggers && not !found do
    let links = Effect.perform (Fetch_trigger_links !t) in
    let num_links = links.(0) in
    let i = ref 0 in
    while !i < num_links && not !found do
      if links.(1 + !i) = wall_num then begin
        result := !t;
        found := true
      end;
      incr i
    done;
    incr t
  done;
  !result

(* flag_wall_switched_doors: Mark all wall-switched doors with WALL_WALL_SWITCH flag.
   Ported from main_d2/switch.cpp *)
let flag_wall_switched_doors () =
  let num_walls = Effect.perform (Get_num_walls ()) in
  for i = 0 to num_walls - 1 do
    if door_is_wall_switched ~wall_num:i <> 0 then
      Effect.perform (Set_wall_flag_wall_switch i)
  done

(* do_il_on: Turn on illusion walls for all links of a trigger.
   Ported from switch.cpp (identical in D1 and D2). *)
let do_il_on ~trigger_num =
  if trigger_num <> -1 then begin
    let data = Effect.perform (Fetch_trigger_seg_sides trigger_num) in
    let num_links = data.(0) in
    for i = 0 to num_links - 1 do
      let segnum = data.(1 + i * 2) in
      let side = data.(1 + i * 2 + 1) in
      Ox_wall.wall_illusion_on ~segnum ~side
    done
  end
