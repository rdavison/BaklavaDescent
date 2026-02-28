(* Bridge wrappers for AI functions *)

(* D1: set_next_fire_time
   3 scalar args → 2-int tuple *)
let cd_set_next_fire_time_d1 rapidfire_count rapidfire_count_limit firing_wait =
  let (new_rfc, new_next_fire) =
    Ox_ai.set_next_fire_time_d1
      ~rapidfire_count ~rapidfire_count_limit ~firing_wait
  in
  (new_rfc, new_next_fire)

(* D2: set_next_fire_time
   8 scalar args → 4-int tuple *)
let cd_set_next_fire_time_d2
    rapidfire_count rapidfire_count_limit
    firing_wait firing_wait2
    gun_num weapon_type2 behavior p_rand_val =
  let (new_rfc, new_next_fire, nf2_valid, new_next_fire2) =
    Ox_ai.set_next_fire_time_d2
      ~rapidfire_count ~rapidfire_count_limit
      ~firing_wait ~firing_wait2
      ~gun_num ~weapon_type2 ~behavior ~p_rand_val
  in
  (new_rfc, new_next_fire, nf2_valid, new_next_fire2)

(* ai_behavior_to_mode: single int → single int *)
let cd_ai_behavior_to_mode_d1 behavior =
  Ox_ai.ai_behavior_to_mode_d1 ~behavior

let cd_ai_behavior_to_mode_d2 behavior =
  Ox_ai.ai_behavior_to_mode_d2 ~behavior

(* ai_turn_randomly: 3 scalars → 3-int tuple *)
let cd_ai_turn_randomly rvx rvy rvz =
  Ox_ai.ai_turn_randomly ~rvx ~rvy ~rvz

let () =
  Callback.register "cd_set_next_fire_time_d1"
    cd_set_next_fire_time_d1;
  Callback.register "cd_set_next_fire_time_d2"
    cd_set_next_fire_time_d2;
  Callback.register "cd_ai_behavior_to_mode_d1"
    cd_ai_behavior_to_mode_d1;
  Callback.register "cd_ai_behavior_to_mode_d2"
    cd_ai_behavior_to_mode_d2;
  Callback.register "cd_ai_turn_randomly"
    cd_ai_turn_randomly
