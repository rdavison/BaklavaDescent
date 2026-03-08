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

(* init_ai_object D1: packed 6-int array → 18-int array *)
let cd_init_ai_object_d1 (packed : int array) = Ox_ai.init_ai_object_d1 packed

(* init_ai_object D2: packed 9-int array → 21-int array *)
let cd_init_ai_object_d2 (packed : int array) = Ox_ai.init_ai_object_d2 packed

(* add_awareness_event: needs Ai_do_cloak_stuff and P_Rand effects *)
external effect_aae_ai_do_cloak_stuff : unit -> unit = "cd_ox_effect_aae_ai_do_cloak_stuff"

let cd_add_awareness_event atype obj_id obj_segnum obj_pos_x obj_pos_y obj_pos_z
    num_awareness_events is_d2 =
  Effect.Deep.match_with
    (fun () ->
       Ox_ai.add_awareness_event ~atype ~obj_id ~obj_segnum ~obj_pos_x ~obj_pos_y ~obj_pos_z
         ~num_awareness_events ~is_d2:(is_d2 <> 0))
    ()
    { retc = (fun x -> x)
    ; exnc = (fun exn ->
        Printf.eprintf "OX: add_awareness_event exception: %s\n" (Core.Exn.to_string exn);
        Out_channel.flush stderr;
        [| 1; 0; 0; 0; 0; 0; 0 |])
    ; effc = (fun (type a) (eff : a Effect.t) : ((a, _) Effect.Deep.continuation -> _) option ->
        match eff with
        | Ox_ai.Ai_do_cloak_stuff ->
          Some (fun k -> effect_aae_ai_do_cloak_stuff (); Effect.Deep.continue k ())
        | (eff : a Effect.t) -> (
          match Misc.effc eff with
          | Some h -> Some h
          | None -> None))
    }
;;

(* create_awareness_event: packed 10-int array → 8-int array,
   needs Ai_do_cloak_stuff and P_Rand effects *)
let cd_create_awareness_event (packed : int array) =
  Effect.Deep.match_with
    (fun () -> Ox_ai.create_awareness_event packed)
    ()
    { retc = (fun x -> x)
    ; exnc = (fun exn ->
        Printf.eprintf "OX: create_awareness_event exception: %s\n" (Core.Exn.to_string exn);
        Out_channel.flush stderr;
        [| packed.(9); 0; 0; 0; 0; 0; 0 |])
    ; effc = (fun (type a) (eff : a Effect.t) : ((a, _) Effect.Deep.continuation -> _) option ->
        match eff with
        | Ox_ai.Ai_do_cloak_stuff ->
          Some (fun k -> effect_aae_ai_do_cloak_stuff (); Effect.Deep.continue k ())
        | (eff : a Effect.t) -> (
          match Misc.effc eff with
          | Some h -> Some h
          | None -> None))
    }
;;

(* init_ai_frame: packed 14-int array → 6-int array, needs Ai_do_cloak_stuff effect *)
external effect_iaf_ai_do_cloak_stuff : unit -> unit = "cd_ox_effect_aae_ai_do_cloak_stuff"

let cd_init_ai_frame (packed : int array) =
  Effect.Deep.match_with
    (fun () -> Ox_ai.init_ai_frame packed)
    ()
    { retc = (fun x -> x)
    ; exnc = (fun exn ->
        Printf.eprintf "OX: init_ai_frame exception: %s\n" (Core.Exn.to_string exn);
        Out_channel.flush stderr;
        [| 0; 0; 0; 0; 0; 0 |])
    ; effc = (fun (type a) (eff : a Effect.t) : ((a, _) Effect.Deep.continuation -> _) option ->
        match eff with
        | Ox_ai.Ai_do_cloak_stuff ->
          Some (fun k -> effect_iaf_ai_do_cloak_stuff (); Effect.Deep.continue k ())
        | (eff : a Effect.t) -> (
          match Misc.effc eff with
          | Some h -> Some h
          | None -> None))
    }
;;

(* process_awareness_events: packed array → int array (New_awareness),
   needs Fetch_segment_data effect for segment children *)
external fetch_segment_data_c
  :  int
  -> int array
  = "cd_ox_fetch_segment_data"

let cd_process_awareness_events (packed : int array) =
  let highest_seg = packed.(1) in
  Effect.Deep.match_with
    (fun () -> Ox_ai.process_awareness_events packed)
    ()
    { retc = (fun x -> x)
    ; exnc = (fun exn ->
        Printf.eprintf "OX: process_awareness_events exception: %s\n" (Core.Exn.to_string exn);
        Out_channel.flush stderr;
        Array.create ~len:(highest_seg + 1) 0)
    ; effc = (fun (type a) (eff : a Effect.t) : ((a, _) Effect.Deep.continuation -> _) option ->
        match eff with
        | Ox_gameseg.Fetch_segment_data segnum ->
          Some (fun k -> Effect.Deep.continue k (fetch_segment_data_c segnum))
        | (eff : a Effect.t) -> (
          match Misc.effc eff with
          | Some h -> Some h
          | None -> None))
    }
;;

let register_callbacks () =
  Callback.register "cd_set_next_fire_time_d1" cd_set_next_fire_time_d1;
  Callback.register "cd_set_next_fire_time_d2" cd_set_next_fire_time_d2;
  Callback.register "cd_ai_behavior_to_mode_d1" cd_ai_behavior_to_mode_d1;
  Callback.register "cd_ai_behavior_to_mode_d2" cd_ai_behavior_to_mode_d2;
  Callback.register "cd_ai_turn_randomly" cd_ai_turn_randomly;
  Callback.register "cd_ai_door_is_openable_d1" cd_ai_door_is_openable_d1;
  Callback.register "cd_ai_door_is_openable_d2" cd_ai_door_is_openable_d2;
  Callback.register "cd_openable_doors_in_segment_d1" cd_openable_doors_in_segment_d1;
  Callback.register "cd_openable_doors_in_segment_d2" cd_openable_doors_in_segment_d2;
  Callback.register "cd_do_firing_stuff" cd_do_firing_stuff;
  Callback.register "cd_init_ai_object_d1" cd_init_ai_object_d1;
  Callback.register "cd_init_ai_object_d2" cd_init_ai_object_d2;
  Callback.register "cd_add_awareness_event" cd_add_awareness_event;
  Callback.register "cd_create_awareness_event" cd_create_awareness_event;
  Callback.register "cd_init_ai_frame" cd_init_ai_frame;
  Callback.register "cd_process_awareness_events" cd_process_awareness_events
;;
