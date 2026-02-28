(* AI logic functions.
   Ported from main_d1/ai.cpp and main_d2/ai2.cpp. *)

let f1_0 = 0x10000

(* D1: set_next_fire_time
   Inputs: rapidfire_count, rapidfire_count_limit, firing_wait
   Returns: (new_rapidfire_count, new_next_fire) *)
let set_next_fire_time_d1 ~rapidfire_count ~rapidfire_count_limit ~firing_wait =
  let rfc = rapidfire_count + 1 in
  if rfc < rapidfire_count_limit
  then rfc, min (f1_0 / 8) (firing_wait / 2)
  else 0, firing_wait
;;

(* D2: set_next_fire_time
   Inputs: rapidfire_count, rapidfire_count_limit, firing_wait, firing_wait2,
           gun_num, weapon_type2, behavior, p_rand_val
   AIB_SNIPE = 4
   Returns: (new_rapidfire_count, new_next_fire, new_next_fire2_valid, new_next_fire2)
   new_next_fire2_valid: 1 if next_fire2 should be updated, 0 otherwise *)
let aib_snipe = 4

let set_next_fire_time_d2
      ~rapidfire_count
      ~rapidfire_count_limit
      ~firing_wait
      ~firing_wait2
      ~gun_num
      ~weapon_type2
      ~behavior
      ~p_rand_val
  =
  (* Conditionally increment rapidfire_count *)
  let rfc =
    if gun_num <> 0 || weapon_type2 = -1
    then
      if behavior <> aib_snipe || p_rand_val > 16384
      then rapidfire_count + 1
      else rapidfire_count
    else rapidfire_count
  in
  if (gun_num <> 0 || weapon_type2 = -1) && rfc < rapidfire_count_limit
  then
    (* Rapid fire: short wait on primary *)
    rfc, min (f1_0 / 8) (firing_wait / 2), 0, 0
  else if weapon_type2 = -1 || gun_num <> 0
  then (
    (* Primary weapon fire *)
    let new_rfc = if rfc >= rapidfire_count_limit then 0 else rfc in
    new_rfc, firing_wait, 0, 0)
  else
    (* Secondary weapon fire *)
    rfc, 0, 1, firing_wait2
;;

(* ── ai_behavior_to_mode ─────────────────────────────────── *)

(* D1 AIB constants *)
let aib_still_d1 = 0x80
let aib_normal_d1 = 0x81
let aib_hide_d1 = 0x82
let aib_run_from_d1 = 0x83
let aib_follow_path_d1 = 0x84
let aib_station_d1 = 0x85

(* D1 AIM constants *)
let aim_still = 0
let aim_chase_object = 3
let aim_hide = 5
let aim_run_from_object = 4
let aim_follow_path = 2

let ai_behavior_to_mode_d1 ~behavior =
  if behavior = aib_still_d1
  then aim_still
  else if behavior = aib_normal_d1
  then aim_chase_object
  else if behavior = aib_hide_d1
  then aim_hide
  else if behavior = aib_run_from_d1
  then aim_run_from_object
  else if behavior = aib_follow_path_d1
  then aim_follow_path
  else if behavior = aib_station_d1
  then aim_still
  else aim_still (* default / Int3 case *)
;;

(* D2 AIB constants *)
let aib_still_d2 = 0x80
let aib_normal_d2 = 0x81
let aib_behind_d2 = 0x82
let aib_run_from_d2 = 0x83

(* aib_snipe = 0x84, already defined above *)
let aib_snipe_d2 = 0x84
let aib_station_d2 = 0x85
let aib_follow_d2 = 0x86

(* D2 AIM constants *)
let aim_behind = 5

let ai_behavior_to_mode_d2 ~behavior =
  if behavior = aib_still_d2
  then aim_still
  else if behavior = aib_normal_d2
  then aim_chase_object
  else if behavior = aib_behind_d2
  then aim_behind
  else if behavior = aib_run_from_d2
  then aim_run_from_object
  else if behavior = aib_snipe_d2
  then aim_still
  else if behavior = aib_station_d2
  then aim_still
  else if behavior = aib_follow_d2
  then aim_follow_path
  else aim_still (* default / Int3 case *)
;;

(* ── ai_turn_randomly (D1 only) ─────────────────────────── *)

(* Pure computation: given current rotvel, computes new rotvel.
   The P_Rand/turn-towards-vector shortcut is handled at callsite.
   Returns new (rx, ry, rz). *)
let ai_turn_randomly ~rvx ~rvy ~rvz =
  let y = rvy + (f1_0 / 64) in
  let x = rvx + (y / 6) in
  let y = y + (rvz / 4) in
  let z = rvz + (x / 10) in
  let x = if abs x > f1_0 / 8 then x / 4 else x in
  let y = if abs y > f1_0 / 8 then y / 4 else y in
  let z = if abs z > f1_0 / 8 then z / 4 else z in
  x, y, z
;;

(* ── ai_door_is_openable ───────────────────────────────── *)

(* Wall/door constants (same in D1 and D2) *)
let wall_blastable = 1
let wall_door = 2
let wall_illusion = 3
let wall_closed = 5
let key_none = 1
let wall_door_locked = 8
let wall_illusion_off = 32
let wall_buddy_proof = 128
let wall_door_closed = 0
let _wall_blasted = 1
let wcf_hidden = 8
let robot_brain = 7
let aim_goto_player = 8

(* D1: ai_door_is_openable
   Inputs: is_console_object, robot_id, ai_behavior, wall_num, wall_type, wall_keys, wall_flags
   Returns: 0 or 1
   Logic: Console object can open all doors. Brain robots and run-from robots can open
   unlocked keyless doors. *)
let ai_door_is_openable_d1
      ~is_console_object
      ~robot_id
      ~ai_behavior
      ~wall_num
      ~wall_type
      ~wall_keys
      ~wall_flags
  =
  if is_console_object
  then if wall_type = wall_door then 1 else 0
  else if robot_id = robot_brain || ai_behavior = aib_run_from_d1
  then
    if
      wall_num <> -1
      && wall_type = wall_door
      && wall_keys = key_none
      && wall_flags land wall_door_locked = 0
    then 1
    else 0
  else 0
;;

(* D2: ai_door_is_openable
   More complex version with companion/buddy logic, key checks, triggered doors.
   Faithfully follows the C control flow with early returns.
   The caller extracts all wall/object fields as scalar parameters. *)
let ai_door_is_openable_d2
      ~is_child
      ~is_console_object
      ~wall_num
      ~wall_type
      ~wall_keys
      ~wall_flags
      ~wall_state
      ~wall_clip_num
      ~wall_controlling_trigger
      ~wallanim_flags
      ~objp_is_null
      ~is_companion
      ~robot_id
      ~ai_behavior
      ~player_flags
      ~ailp_mode
  =
  (* Helper: check triggered/hidden door — appears twice in C code *)
  let check_triggered_or_door () =
    if ailp_mode <> aim_goto_player && wall_controlling_trigger <> -1
    then
      if wall_clip_num = -1
      then 1
      else if wallanim_flags land wcf_hidden <> 0
      then if wall_state = wall_door_closed then 0 else 1
      else 1
    else if wall_type = wall_door
    then
      (* Note: C has "if (type == WALL_BLASTABLE) return 1" here but type is already
         WALL_DOOR(2), so WALL_BLASTABLE(1) can never match — dead code in original *)
      if wall_clip_num = -1
      then 1
      else if ailp_mode <> aim_goto_player && wallanim_flags land wcf_hidden <> 0
      then if wall_state = wall_door_closed then 0 else 1
      else 1
    else 0
  in
  if not is_child
  then 0
  else if wall_num = -1
  then 0
  else if is_console_object && wall_type = wall_door
  then 1
  else if objp_is_null || is_companion
  then (
    (* Buddy/companion path *)
    let buddy_proof_blocked =
      wall_flags land wall_buddy_proof <> 0
      && ((wall_type = wall_door && wall_state = wall_door_closed)
          || wall_type = wall_closed
          || (wall_type = wall_illusion && wall_flags land wall_illusion_off = 0))
    in
    if buddy_proof_blocked
    then 0
    else if wall_keys <> key_none
    then player_flags land wall_keys
    else if wall_type <> wall_door && wall_type <> wall_closed
    then 1
    else (
      (* AIM_GOTO_PLAYER restrictions *)
      let goto_blocked =
        ailp_mode = aim_goto_player
        && ((wall_type = wall_blastable && wall_state <> 1)
            || wall_type = wall_closed
            || (wall_type = wall_door
                && wall_flags land wall_door_locked <> 0
                && wall_state = wall_door_closed))
      in
      if goto_blocked then 0 else check_triggered_or_door ()))
  else if
    robot_id = robot_brain || ai_behavior = aib_run_from_d2 || ai_behavior = aib_snipe_d2
  then
    if
      wall_type = wall_door
      && wall_keys = key_none
      && wall_flags land wall_door_locked = 0
    then 1
    else if wall_keys <> key_none
    then player_flags land wall_keys
    else 0
  else 0
;;

(* ── openable_doors_in_segment ──────────────────────────── *)

(* D1: openable_doors_in_segment
   Packed: 6 sides × 4 fields = 24 ints
   Fields per side: wall_num, wall_type, wall_keys, wall_state, wall_flags
   Actually 5 fields × 6 = 30. But we can pack as:
   [wall_num0, type0, keys0, state0, flags0, wall_num1, type1, ...] = 30 ints
   Returns: side index (0-5) or -1 *)
let openable_doors_in_segment_d1 ~(sides : int array) =
  let rec check i =
    if i >= 6
    then -1
    else (
      let base = i * 5 in
      let wn = sides.(base) in
      if wn <> -1
      then (
        let wt = sides.(base + 1) in
        let wk = sides.(base + 2) in
        let ws = sides.(base + 3) in
        let wf = sides.(base + 4) in
        if
          wt = wall_door
          && wk = key_none
          && ws = wall_door_closed
          && wf land wall_door_locked = 0
        then i
        else check (i + 1))
      else check (i + 1))
  in
  check 0
;;

(* D2: openable_doors_in_segment
   Same as D1 but adds WCF_HIDDEN check on wall animation.
   Packed: 6 sides × 6 fields = 36 ints
   Fields per side: wall_num, wall_type, wall_keys, wall_state, wall_flags, wallanim_flags *)
let openable_doors_in_segment_d2 ~(sides : int array) =
  let rec check i =
    if i >= 6
    then -1
    else (
      let base = i * 6 in
      let wn = sides.(base) in
      if wn <> -1
      then (
        let wt = sides.(base + 1) in
        let wk = sides.(base + 2) in
        let ws = sides.(base + 3) in
        let wf = sides.(base + 4) in
        let waf = sides.(base + 5) in
        if
          wt = wall_door
          && wk = key_none
          && ws = wall_door_closed
          && wf land wall_door_locked = 0
          && waf land wcf_hidden = 0
        then i
        else check (i + 1))
      else check (i + 1))
  in
  check 0
;;
