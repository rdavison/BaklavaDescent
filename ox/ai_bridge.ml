(* Bridge wrappers for AI functions *)

(* D1: set_next_fire_time
   3 scalar args → 2-int tuple *)
let cd_set_next_fire_time_d1 rapidfire_count rapidfire_count_limit firing_wait =
  let new_rfc, new_next_fire =
    Ox_ai.set_next_fire_time_d1 ~rapidfire_count ~rapidfire_count_limit ~firing_wait
  in
  new_rfc, new_next_fire
;;

(* D2: set_next_fire_time
   8 scalar args → 4-int tuple *)
let cd_set_next_fire_time_d2
      rapidfire_count
      rapidfire_count_limit
      firing_wait
      firing_wait2
      gun_num
      weapon_type2
      behavior
      p_rand_val
  =
  let new_rfc, new_next_fire, nf2_valid, new_next_fire2 =
    Ox_ai.set_next_fire_time_d2
      ~rapidfire_count
      ~rapidfire_count_limit
      ~firing_wait
      ~firing_wait2
      ~gun_num
      ~weapon_type2
      ~behavior
      ~p_rand_val
  in
  new_rfc, new_next_fire, nf2_valid, new_next_fire2
;;

(* ai_behavior_to_mode: single int → single int *)
let cd_ai_behavior_to_mode_d1 behavior = Ox_ai.ai_behavior_to_mode_d1 ~behavior
let cd_ai_behavior_to_mode_d2 behavior = Ox_ai.ai_behavior_to_mode_d2 ~behavior

(* ai_turn_randomly: 3 scalars → 3-int tuple *)
let cd_ai_turn_randomly rvx rvy rvz = Ox_ai.ai_turn_randomly ~rvx ~rvy ~rvz

(* ai_door_is_openable D1: 7 scalar args → int *)
let cd_ai_door_is_openable_d1
      is_console_object
      robot_id
      ai_behavior
      wall_num
      wall_type
      wall_keys
      wall_flags
  =
  Ox_ai.ai_door_is_openable_d1
    ~is_console_object:(is_console_object <> 0)
    ~robot_id
    ~ai_behavior
    ~wall_num
    ~wall_type
    ~wall_keys
    ~wall_flags
;;

(* ai_door_is_openable D2: 16 scalar args → int *)
let cd_ai_door_is_openable_d2
      is_child
      is_console_object
      wall_num
      wall_type
      wall_keys
      wall_flags
      wall_state
      wall_clip_num
      wall_controlling_trigger
      wallanim_flags
      objp_is_null
      is_companion
      robot_id
      ai_behavior
      player_flags
      ailp_mode
  =
  Ox_ai.ai_door_is_openable_d2
    ~is_child:(is_child <> 0)
    ~is_console_object:(is_console_object <> 0)
    ~wall_num
    ~wall_type
    ~wall_keys
    ~wall_flags
    ~wall_state
    ~wall_clip_num
    ~wall_controlling_trigger
    ~wallanim_flags
    ~objp_is_null:(objp_is_null <> 0)
    ~is_companion:(is_companion <> 0)
    ~robot_id
    ~ai_behavior
    ~player_flags
    ~ailp_mode
;;

(* openable_doors_in_segment D1: packed 30-int array → int *)
let cd_openable_doors_in_segment_d1 (packed : int array) =
  Ox_ai.openable_doors_in_segment_d1 ~sides:packed
;;

(* openable_doors_in_segment D2: packed 36-int array → int *)
let cd_openable_doors_in_segment_d2 (packed : int array) =
  Ox_ai.openable_doors_in_segment_d2 ~sides:packed
;;

(* do_firing_stuff: packed 12-int array → 3-int array *)
let cd_do_firing_stuff (packed : int array) = Ox_ai.do_firing_stuff packed

let () =
  Callback.register "cd_set_next_fire_time_d1" cd_set_next_fire_time_d1;
  Callback.register "cd_set_next_fire_time_d2" cd_set_next_fire_time_d2;
  Callback.register "cd_ai_behavior_to_mode_d1" cd_ai_behavior_to_mode_d1;
  Callback.register "cd_ai_behavior_to_mode_d2" cd_ai_behavior_to_mode_d2;
  Callback.register "cd_ai_turn_randomly" cd_ai_turn_randomly;
  Callback.register "cd_ai_door_is_openable_d1" cd_ai_door_is_openable_d1;
  Callback.register "cd_ai_door_is_openable_d2" cd_ai_door_is_openable_d2;
  Callback.register "cd_openable_doors_in_segment_d1" cd_openable_doors_in_segment_d1;
  Callback.register "cd_openable_doors_in_segment_d2" cd_openable_doors_in_segment_d2;
  Callback.register "cd_do_firing_stuff" cd_do_firing_stuff
;;
