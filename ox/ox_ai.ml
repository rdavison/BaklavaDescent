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

(* do_firing_stuff: decide whether to upgrade GOAL_STATE based on player visibility and facing.
   C original: main_d1/ai.cpp + main_d2/ai2.cpp do_firing_stuff
   D1 checks player_visibility >= 1. D2 also checks dist_to_last_fired_upon_player_pos.
   Identical inner logic in D1 and D2.

   Packed input (12 ints):
     [0-2]  fvec (x, y, z)
     [3-5]  vec_to_player (x, y, z)
     [6]    player_visibility
     [7]    player_cloaked (0 or 1)
     [8]    GOAL_STATE
     [9]    player_awareness_type
     [10]   player_awareness_time
     [11]   is_d2_nearby (D2: 1 if dist < FIRE_AT_NEARBY_PLAYER_THRESHOLD, else 0)

   Returns array (3 ints):
     [0]  new GOAL_STATE
     [1]  new player_awareness_type
     [2]  new player_awareness_time *)
let do_firing_stuff (packed : int array) =
  let fvec = packed.(0), packed.(1), packed.(2) in
  let vec_to_player = packed.(3), packed.(4), packed.(5) in
  let player_visibility = packed.(6) in
  let player_cloaked = packed.(7) <> 0 in
  let goal_state = ref packed.(8) in
  let awareness_type = ref packed.(9) in
  let awareness_time = ref packed.(10) in
  let is_d2_nearby = packed.(11) <> 0 in
  let ais_none = 0 in
  let ais_rest = 1 in
  let ais_srch = 2 in
  let ais_lock = 3 in
  let ais_fire = 5 in
  let pa_nearby_robot_fired = 1 in
  let player_awareness_initial_time = 3 * f1_0 in
  if is_d2_nearby || player_visibility >= 1
  then (
    let dot = Ox_math.vm_vec_dotprod ~a:fvec ~b:vec_to_player in
    if dot >= 7 * f1_0 / 8 || player_cloaked
    then (
      match !goal_state with
      | gs when gs = ais_none || gs = ais_rest || gs = ais_srch || gs = ais_lock ->
        goal_state := ais_fire;
        if !awareness_type <= pa_nearby_robot_fired
        then (
          awareness_type := pa_nearby_robot_fired;
          awareness_time := player_awareness_initial_time)
      | _ -> ())
    else if dot >= f1_0 / 2
    then (
      match !goal_state with
      | gs when gs = ais_none || gs = ais_rest || gs = ais_srch -> goal_state := ais_lock
      | _ -> ()));
  let result = Array.create ~len:3 0 in
  result.(0) <- !goal_state;
  result.(1) <- !awareness_type;
  result.(2) <- !awareness_time;
  result
;;

(* ── init_ai_object ────────────────────────────────────── *)

(* Constants *)
let ais_srch = 2
let ais_rest = 1
let ri_cloaked_always = 1
let pf_bounce = 0x04
let pf_turnroll = 0x01

(* D1: init_ai_object
   Packed input [6]:
     [0] behavior       [1] hide_segment    [2] cloak_type
     [3] cur_aip_behavior [4] game_time     [5] phys_flags
   D1 MIN_BEHAVIOR=0x80, MAX_BEHAVIOR=0x85

   Returns array [18]:
     [0] aip_behavior   [1] ailp_mode       [2] ailp_previous_visibility
     [3] aip_goal_state  [4] aip_current_state
     [5] ailp_player_awareness_time [6] ailp_player_awareness_type
     [7] ailp_time_player_seen [8] ailp_next_misc_sound_time
     [9] ailp_time_player_sound_attacked
     [10] aip_hide_segment [11] ailp_goal_segment
     [12] aip_hide_index   [13] aip_cur_path_index
     [14] aip_skip_ai_count [15] aip_cloaked
     [16] new_phys_flags   [17] aip_remote_owner
   Values of -2 in [10]-[13] mean "don't write back" *)
let init_ai_object_d1 (packed : int array) =
  let behavior = ref packed.(0) in
  let hide_segment = packed.(1) in
  let cloak_type = packed.(2) in
  let cur_aip_behavior = ref packed.(3) in
  let game_time = packed.(4) in
  let phys_flags = packed.(5) in
  (* if behavior == 0, bash to AIB_NORMAL *)
  if !behavior = 0 then begin
    behavior := aib_normal_d1;
    cur_aip_behavior := aib_normal_d1
  end;
  (* mode is now set from the Robot dialog, so this should get overwritten *)
  let mode = ref aim_still in
  let previous_visibility = 0 in
  if !behavior <> -1 then begin
    cur_aip_behavior := !behavior;
    mode := ai_behavior_to_mode_d1 ~behavior:!cur_aip_behavior
  end else if not (!cur_aip_behavior >= 0x80 && !cur_aip_behavior <= 0x85) then
    cur_aip_behavior := aib_normal_d1;
  (* vm_vec_zero velocity — handled by writing 0s back *)
  let goal_state = ais_srch in
  let current_state = ais_rest in
  (* hide_segment path setup *)
  let out_hide_segment = ref (-2) in
  let out_goal_segment = ref (-2) in
  let out_hide_index = ref (-2) in
  let out_cur_path_index = ref (-2) in
  if !behavior = aib_hide_d1 || !behavior = aib_follow_path_d1
     || !behavior = aib_station_d1 || !behavior = aib_run_from_d1
  then begin
    out_hide_segment := hide_segment;
    out_goal_segment := hide_segment;
    out_hide_index := -1;
    out_cur_path_index := 0
  end;
  let cloaked = if cloak_type = ri_cloaked_always then 1 else 0 in
  let new_phys_flags = phys_flags lor pf_bounce lor pf_turnroll in
  [| !cur_aip_behavior; !mode; previous_visibility;
     goal_state; current_state;
     0; 0;  (* player_awareness_time, player_awareness_type *)
     game_time; game_time; game_time;  (* time_player_seen, next_misc_sound_time, time_player_sound_attacked *)
     !out_hide_segment; !out_goal_segment; !out_hide_index; !out_cur_path_index;
     0; cloaked;  (* skip_ai_count, cloaked *)
     new_phys_flags; -1 |]  (* phys_flags, remote_owner *)
;;

(* D2: init_ai_object
   Packed input [9]:
     [0] behavior       [1] hide_segment    [2] cloak_type
     [3] cur_aip_behavior [4] game_time     [5] phys_flags
     [6] is_companion    [7] is_thief       [8] attack_type
   D2 MIN_BEHAVIOR=0x80, MAX_BEHAVIOR=0x86

   Returns array [21]:
     [0]-[17] same as D1
     [18] escort_kill_object (-2 = don't write)
     [19] aip_dying_sound_playing
     [20] aip_dying_start_time *)
let init_ai_object_d2 (packed : int array) =
  let behavior = ref packed.(0) in
  let hide_segment = packed.(1) in
  let cloak_type = packed.(2) in
  let cur_aip_behavior = ref packed.(3) in
  let game_time = packed.(4) in
  let phys_flags = packed.(5) in
  let is_companion = packed.(6) <> 0 in
  let is_thief = packed.(7) <> 0 in
  let attack_type = packed.(8) in
  (* if behavior == 0, bash to AIB_NORMAL *)
  if !behavior = 0 then begin
    behavior := aib_normal_d2;
    cur_aip_behavior := aib_normal_d2
  end;
  let mode = ref aim_still in
  let previous_visibility = 0 in
  let escort_kill_object = ref (-2) in  (* -2 = don't write *)
  if !behavior <> -1 then begin
    cur_aip_behavior := !behavior;
    mode := ai_behavior_to_mode_d2 ~behavior:!cur_aip_behavior
  end else if not (!cur_aip_behavior >= 0x80 && !cur_aip_behavior <= 0x86) then
    cur_aip_behavior := aib_normal_d2;
  if is_companion then begin
    mode := aim_goto_player;
    escort_kill_object := -1
  end;
  if is_thief then begin
    cur_aip_behavior := aib_snipe_d2;
    mode := 17  (* AIM_THIEF_WAIT *)
  end;
  if attack_type <> 0 then begin
    cur_aip_behavior := aib_normal_d2;
    mode := ai_behavior_to_mode_d2 ~behavior:!cur_aip_behavior
  end;
  let goal_state = ais_srch in
  let current_state = ais_rest in
  let out_hide_segment = ref (-2) in
  let out_goal_segment = ref (-2) in
  let out_hide_index = ref (-2) in
  let out_cur_path_index = ref (-2) in
  if !behavior = aib_snipe_d2 || !behavior = aib_station_d2
     || !behavior = aib_run_from_d2 || !behavior = aib_follow_d2
  then begin
    out_hide_segment := hide_segment;
    out_goal_segment := hide_segment;
    out_hide_index := -1;
    out_cur_path_index := 0
  end;
  let cloaked = if cloak_type = ri_cloaked_always then 1 else 0 in
  let new_phys_flags = phys_flags lor pf_bounce lor pf_turnroll in
  [| !cur_aip_behavior; !mode; previous_visibility;
     goal_state; current_state;
     0; 0;
     game_time; game_time; game_time;
     !out_hide_segment; !out_goal_segment; !out_hide_index; !out_cur_path_index;
     0; cloaked;
     new_phys_flags; -1;
     !escort_kill_object; 0; 0 |]  (* escort_kill_object, dying_sound_playing, dying_start_time *)
;;

(* ── init_robots_for_level ─────────────────────────────── *)

(* D1: just sets Overall_agitation = 0
   Returns: [| overall_agitation |] *)
let init_robots_for_level_d1 () =
  [| 0 |]
;;

(* D2: sets several globals for new level.
   Input: difficulty_level (0-4)
   Returns: [| overall_agitation; final_boss_is_dead; buddy_objnum;
               buddy_allowed_to_talk; boss_invulnerable_dot; boss_dying_start_time |] *)
let init_robots_for_level_d2 ~difficulty_level =
  let boss_invulnerable_dot = f1_0 / 4 - (difficulty_level * f1_0) / 8 in
  [| 0; 0; 0; 0; boss_invulnerable_dot; 0 |]
;;

(* ── add_awareness_event ─────────────────────────────── *)

(* PA_* constants *)
let pa_weapon_wall_collision = 2
let pa_player_collision = 3
let pa_weapon_robot_collision = 4

(* VULCAN_ID = 11 in both D1 and D2 *)
let vulcan_id = 11

(* MAX_AWARENESS_EVENTS = 64 *)
let max_awareness_events = 64

type _ Effect.t += Ai_do_cloak_stuff : unit Effect.t

(* add_awareness_event: returns packed int array.
   result[0] = return value (0 = filtered, 1 = not filtered)
   result[1] = 1 if event should be stored, 0 otherwise
   result[2..6] = event data (segnum, pos_x, pos_y, pos_z, type) if result[1]=1
   Inputs: atype, obj_id, obj_segnum, obj_pos_x/y/z, num_awareness_events, is_d2 *)
let add_awareness_event ~atype ~obj_id ~obj_segnum ~obj_pos_x ~obj_pos_y ~obj_pos_z
    ~num_awareness_events ~is_d2 =
  (* If player cloaked and hit a robot, then increase awareness *)
  if atype = pa_weapon_robot_collision
     || atype = pa_weapon_wall_collision
     || atype = pa_player_collision
  then
    Effect.perform Ai_do_cloak_stuff;

  if num_awareness_events < max_awareness_events then begin
    (* For vulcan cannon, only about 1/10 actually cause awareness *)
    if (atype = pa_weapon_wall_collision || atype = pa_weapon_robot_collision)
       && obj_id = vulcan_id
       && Ox_misc.p_rand () > 3276
    then
      [| 0; 0; 0; 0; 0; 0; 0 |]
    else
      [| 1; 1; obj_segnum; obj_pos_x; obj_pos_y; obj_pos_z; atype |]
  end else begin
    if not is_d2 then
      (* D1: Assert(0) — overflow warning *)
      Ox_misc.int3 ();
    (* D2: commented-out Int3(), just ignore overflow *)
    [| 1; 0; 0; 0; 0; 0; 0 |]
  end
;;

(* ── create_awareness_event ─────────────────────────────── *)
(* GM_MULTI = 38, GM_MULTI_ROBOTS = 8 *)
let gm_multi = 38
let gm_multi_robots = 8
let overall_agitation_max = 100

(* create_awareness_event: wraps add_awareness_event with multiplayer check
   and Overall_agitation update.
   Input (10 ints):
     [0] atype, [1] obj_id, [2] obj_segnum,
     [3] obj_pos_x, [4] obj_pos_y, [5] obj_pos_z,
     [6] num_awareness_events, [7] is_d2, [8] game_mode, [9] overall_agitation
   Output (8 ints):
     [0] new_overall_agitation,
     [1] should_store, [2] event_segnum, [3] event_pos_x, [4] event_pos_y,
     [5] event_pos_z, [6] event_type *)
let create_awareness_event (packed : int array) =
  let atype = packed.(0) in
  let obj_id = packed.(1) in
  let obj_segnum = packed.(2) in
  let obj_pos_x = packed.(3) in
  let obj_pos_y = packed.(4) in
  let obj_pos_z = packed.(5) in
  let num_awareness_events = packed.(6) in
  let is_d2 = packed.(7) <> 0 in
  let game_mode = packed.(8) in
  let overall_agitation = ref packed.(9) in
  (* D2: if not in multiplayer, or in multiplayer with robots *)
  (* D1: no multiplayer check *)
  let dominated_by_mp =
    if is_d2 then
      game_mode land gm_multi <> 0 && game_mode land gm_multi_robots = 0
    else
      false
  in
  if not dominated_by_mp then begin
    let aae_result = add_awareness_event ~atype ~obj_id ~obj_segnum
        ~obj_pos_x ~obj_pos_y ~obj_pos_z
        ~num_awareness_events ~is_d2 in
    let returned = aae_result.(0) in
    if returned <> 0 then begin
      if (Ox_misc.p_rand () * (atype + 4)) asr 15 > 4 then
        overall_agitation := !overall_agitation + 1;
      if !overall_agitation > overall_agitation_max then
        overall_agitation := overall_agitation_max
    end;
    [| !overall_agitation; aae_result.(1); aae_result.(2); aae_result.(3);
       aae_result.(4); aae_result.(5); aae_result.(6) |]
  end else
    [| !overall_agitation; 0; 0; 0; 0; 0; 0 |]
;;

(* init_ai_frame: called once per game frame to set up AI globals.
   Input packed array (14 ints):
     [0..2] = Last_fired_upon_player_pos (x, y, z)
     [3..5] = Believed_player_pos (x, y, z)
     [6]    = is_shareware
     [7]    = player_flags
     [8..10] = ConsoleObject->pos (x, y, z)
     [11]   = ConsoleObject->segnum
     [12]   = Afterburner_charge
     [13]   = afterburner_state
   Output packed array (6 ints):
     [0] = Dist_to_last_fired_upon_player_pos
     [1] = should_update_believed (1 if shareware && cloaked)
     [2] = new Believed_player_seg
     [3..5] = new Believed_player_pos (x, y, z) *)
let player_flags_cloaked = 2048
let player_flags_afterburner = 4096
let player_flags_headlight_on = 16384

let init_ai_frame (packed : int array) =
  let lfup_x = packed.(0) and lfup_y = packed.(1) and lfup_z = packed.(2) in
  let bp_x = packed.(3) and bp_y = packed.(4) and bp_z = packed.(5) in
  let is_shareware = packed.(6) in
  let player_flags = packed.(7) in
  let console_x = packed.(8) and console_y = packed.(9) and console_z = packed.(10) in
  let console_segnum = packed.(11) in
  let afterburner_charge = packed.(12) in
  let afterburner_state = packed.(13) in
  let dist = Ox_math.vm_vec_dist_quick
    ~a:(lfup_x, lfup_y, lfup_z)
    ~b:(bp_x, bp_y, bp_z)
  in
  if is_shareware <> 0 then begin
    if player_flags land player_flags_cloaked <> 0 then
      [| dist; 1; console_segnum; console_x; console_y; console_z |]
    else
      [| dist; 0; 0; 0; 0; 0 |]
  end else begin
    let ab_state =
      afterburner_charge <> 0
      && afterburner_state <> 0
      && (player_flags land player_flags_afterburner <> 0)
    in
    if (player_flags land player_flags_cloaked = 0)
       || (player_flags land player_flags_headlight_on <> 0)
       || ab_state
    then
      Effect.perform Ai_do_cloak_stuff;
    [| dist; 0; 0; 0; 0; 0 |]
  end
;;

(* ── teleport_boss ─────────────────────────────────────────── *)
(* Ported from main_d2/ai2.cpp: teleport_boss
   Picks a random boss-teleportable segment, computes new position/orientation.
   Returns [| rand_segnum; pos_x; pos_y; pos_z;
              orient_rvx; orient_rvy; orient_rvz;
              orient_uvx; orient_uvy; orient_uvz;
              orient_fvx; orient_fvy; orient_fvz |]
   C caller handles side effects: obj_relink, Last_teleport_time, sounds,
   multi_send_boss_actions, Ai_local_info fire timers. *)

let teleport_boss ~num_boss_teleport_segs ~highest_segment_index
    ~player_pos_x ~player_pos_y ~player_pos_z
    ~boss_teleport_segs =
  assert (num_boss_teleport_segs > 0);
  (* Pick a random segment from the list of boss-teleportable-to segments *)
  let rand_index = (Ox_misc.p_rand () * num_boss_teleport_segs) asr 15 in
  let rand_segnum = boss_teleport_segs.(rand_index) in
  assert (rand_segnum >= 0 && rand_segnum <= highest_segment_index);
  (* Set position to segment center *)
  let pos_x, pos_y, pos_z =
    Effect.perform (Ox_physics_sim.Compute_segment_center rand_segnum)
  in
  (* Make boss point right at player: boss_dir = player_pos - boss_pos *)
  let boss_dir_x = player_pos_x - pos_x in
  let boss_dir_y = player_pos_y - pos_y in
  let boss_dir_z = player_pos_z - pos_z in
  (* vm_vector_2_matrix with fwd=boss_dir, up=NULL(0,0,0), right=NULL *)
  let o_rx, o_ry, o_rz, o_ux, o_uy, o_uz, o_fx, o_fy, o_fz =
    Effect.perform
      (Ox_physics_sim.Vm_vector_2_matrix_orient
         (boss_dir_x, boss_dir_y, boss_dir_z, 0, 0, 0))
  in
  [| rand_segnum; pos_x; pos_y; pos_z;
     o_rx; o_ry; o_rz; o_ux; o_uy; o_uz; o_fx; o_fy; o_fz |]
;;
