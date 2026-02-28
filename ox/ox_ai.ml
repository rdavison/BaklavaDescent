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
