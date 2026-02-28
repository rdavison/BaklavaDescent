(* AI logic functions.
   Ported from main_d1/ai.cpp and main_d2/ai2.cpp. *)

let f1_0 = 0x10000

(* D1: set_next_fire_time
   Inputs: rapidfire_count, rapidfire_count_limit, firing_wait
   Returns: (new_rapidfire_count, new_next_fire) *)
let set_next_fire_time_d1 ~rapidfire_count ~rapidfire_count_limit ~firing_wait =
  let rfc = rapidfire_count + 1 in
  if rfc < rapidfire_count_limit then
    (rfc, min (f1_0 / 8) (firing_wait / 2))
  else
    (0, firing_wait)

(* D2: set_next_fire_time
   Inputs: rapidfire_count, rapidfire_count_limit, firing_wait, firing_wait2,
           gun_num, weapon_type2, behavior, p_rand_val
   AIB_SNIPE = 4
   Returns: (new_rapidfire_count, new_next_fire, new_next_fire2_valid, new_next_fire2)
   new_next_fire2_valid: 1 if next_fire2 should be updated, 0 otherwise *)
let aib_snipe = 4

let set_next_fire_time_d2 ~rapidfire_count ~rapidfire_count_limit
    ~firing_wait ~firing_wait2
    ~gun_num ~weapon_type2 ~behavior ~p_rand_val =
  (* Conditionally increment rapidfire_count *)
  let rfc =
    if (gun_num <> 0) || (weapon_type2 = -1) then
      if (behavior <> aib_snipe) || (p_rand_val > 16384) then
        rapidfire_count + 1
      else
        rapidfire_count
    else
      rapidfire_count
  in
  if ((gun_num <> 0) || (weapon_type2 = -1)) && (rfc < rapidfire_count_limit) then
    (* Rapid fire: short wait on primary *)
    (rfc, min (f1_0 / 8) (firing_wait / 2), 0, 0)
  else
    if (weapon_type2 = -1) || (gun_num <> 0) then
      (* Primary weapon fire *)
      let new_rfc = if rfc >= rapidfire_count_limit then 0 else rfc in
      (new_rfc, firing_wait, 0, 0)
    else
      (* Secondary weapon fire *)
      (rfc, 0, 1, firing_wait2)

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

let ai_behavior_to_mode_d1 behavior =
  if behavior = aib_still_d1 then aim_still
  else if behavior = aib_normal_d1 then aim_chase_object
  else if behavior = aib_hide_d1 then aim_hide
  else if behavior = aib_run_from_d1 then aim_run_from_object
  else if behavior = aib_follow_path_d1 then aim_follow_path
  else if behavior = aib_station_d1 then aim_still
  else aim_still  (* default / Int3 case *)

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

let ai_behavior_to_mode_d2 behavior =
  if behavior = aib_still_d2 then aim_still
  else if behavior = aib_normal_d2 then aim_chase_object
  else if behavior = aib_behind_d2 then aim_behind
  else if behavior = aib_run_from_d2 then aim_run_from_object
  else if behavior = aib_snipe_d2 then aim_still
  else if behavior = aib_station_d2 then aim_still
  else if behavior = aib_follow_d2 then aim_follow_path
  else aim_still  (* default / Int3 case *)

(* ── ai_turn_randomly (D1 only) ─────────────────────────── *)

(* Pure computation: given current rotvel, computes new rotvel.
   The P_Rand/turn-towards-vector shortcut is handled at callsite.
   Returns new (rx, ry, rz). *)
let ai_turn_randomly ~rvx ~rvy ~rvz =
  let y = rvy + f1_0 / 64 in
  let x = rvx + y / 6 in
  let y = y + rvz / 4 in
  let z = rvz + x / 10 in
  let x = if abs x > f1_0 / 8 then x / 4 else x in
  let y = if abs y > f1_0 / 8 then y / 4 else y in
  let z = if abs z > f1_0 / 8 then z / 4 else z in
  (x, y, z)
