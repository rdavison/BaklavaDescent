(* Pure game logic for AI frame processing.
   ai_do_actual_firing_stuff + do_ai_frame (D1 + D2).
   All side effects are performed via algebraic effects. *)

let f1_0 = 0x10000

(* -- Constants ------------------------------------------------------------ *)

(* AI animation states *)
let ais_none = 0
let ais_rest = 1
let ais_srch = 2
let ais_lock = 3
let ais_flin = 4
let ais_fire = 5
let ais_reco = 6
let ais_err_ = 7

(* AI modes *)
let aim_still = 0
let aim_wander = 1
let aim_follow_path = 2
let aim_chase_object = 3
let aim_run_from_object = 4
let aim_behind = 5            (* D2: replaces D1's AIM_HIDE *)
let aim_follow_path_2 = 6
let aim_open_door = 7
let aim_goto_player = 8
let aim_goto_object = 9
let aim_snipe_attack = 10
let aim_snipe_fire = 11
let aim_snipe_retreat = 12
let aim_snipe_retreat_backwards = 13
let aim_snipe_wait = 14
let aim_thief_attack = 15
let aim_thief_retreat = 16
let aim_thief_wait = 17

(* AI behaviors *)
let aib_still = 0x80
let aib_normal = 0x81
let aib_behind = 0x82
let aib_run_from = 0x83
let aib_snipe = 0x84
let aib_station = 0x85
let aib_follow = 0x86

let min_behavior = aib_still
let max_behavior_d1 = aib_station
let max_behavior_d2 = aib_follow

(* Player awareness types *)
let pa_nearby_robot_fired = 1
let pa_weapon_wall_collision = 2
let pa_player_collision = 3
let pa_weapon_robot_collision = 4
let robot_brain = 7
let ndl = 5
let robot_fire_agitation = 94
let gm_multi = 38
let segment_is_robotmaker = 2
let chase_time_length = f1_0 * 8
let ri_cloaked_except_firing = 1
let player_flags_cloaked = 0x800
let player_flags_headlight_on = 0x4000
let pf_uses_thrust = 0x40

(* D2-only constants *)
let snipe_retreat_time = f1_0 * 5
let snipe_abort_retreat_time = snipe_retreat_time / 2
let snipe_attack_time = f1_0 * 10
let snipe_wait_time = f1_0 * 5
let snipe_fire_time = f1_0 * 2
let sub_flags_camera_awake = 4
let proximity_id = 47 (* D1 *)
let proximity_id_d2 = 47 (* D2 *)
let superprox_id_d2 = 53

(* AI transition table (from ai.h / ai.cpp):
   [awareness_type-1][current_state][goal_state] -> new_goal_state
   Matches Ai_transition_table in main_d2/ai.cpp exactly.
   C table is [4][7][7]; OCaml extends to [4][8][8] for AIS_ERR_ entries. *)
let ai_transition_table =
  [| (* AIE_FIRE: PA_NEARBY_ROBOT_FIRED - 1 = 0 *)
     [| (* current = AIS_NONE *)
        [| ais_err_; ais_lock; ais_lock; ais_lock; ais_flin; ais_fire; ais_reco; ais_err_ |]
      ; (* current = AIS_REST *)
        [| ais_err_; ais_lock; ais_lock; ais_lock; ais_flin; ais_fire; ais_reco; ais_err_ |]
      ; (* current = AIS_SRCH *)
        [| ais_err_; ais_lock; ais_lock; ais_lock; ais_flin; ais_fire; ais_reco; ais_err_ |]
      ; (* current = AIS_LOCK *)
        [| ais_err_; ais_lock; ais_lock; ais_lock; ais_flin; ais_fire; ais_reco; ais_err_ |]
      ; (* current = AIS_FLIN *)
        [| ais_err_; ais_rest; ais_lock; ais_lock; ais_lock; ais_fire; ais_reco; ais_err_ |]
      ; (* current = AIS_FIRE *)
        [| ais_err_; ais_fire; ais_fire; ais_fire; ais_flin; ais_fire; ais_reco; ais_err_ |]
      ; (* current = AIS_RECO *)
        [| ais_err_; ais_lock; ais_lock; ais_lock; ais_flin; ais_fire; ais_fire; ais_err_ |]
      ; (* current = AIS_ERR_ *)
        [| ais_rest; ais_rest; ais_rest; ais_rest; ais_rest; ais_rest; ais_rest; ais_err_ |]
     |]
   ; (* AIE_HITT: PA_WEAPON_WALL_COLLISION - 1 = 1 *)
     [| [| ais_err_; ais_lock; ais_lock; ais_lock; ais_flin; ais_fire; ais_reco; ais_err_ |]
      ; [| ais_err_; ais_lock; ais_lock; ais_lock; ais_flin; ais_fire; ais_reco; ais_err_ |]
      ; [| ais_err_; ais_lock; ais_lock; ais_lock; ais_flin; ais_fire; ais_reco; ais_err_ |]
      ; [| ais_err_; ais_lock; ais_lock; ais_lock; ais_flin; ais_fire; ais_reco; ais_err_ |]
      ; [| ais_err_; ais_lock; ais_lock; ais_lock; ais_lock; ais_flin; ais_flin; ais_err_ |]
      ; [| ais_err_; ais_rest; ais_lock; ais_lock; ais_lock; ais_fire; ais_reco; ais_err_ |]
      ; [| ais_err_; ais_lock; ais_lock; ais_lock; ais_flin; ais_fire; ais_fire; ais_err_ |]
      ; [| ais_rest; ais_rest; ais_rest; ais_rest; ais_rest; ais_rest; ais_rest; ais_err_ |]
     |]
   ; (* AIE_COLL: PA_PLAYER_COLLISION - 1 = 2 *)
     [| [| ais_err_; ais_lock; ais_lock; ais_lock; ais_flin; ais_fire; ais_reco; ais_err_ |]
      ; [| ais_err_; ais_lock; ais_lock; ais_lock; ais_flin; ais_fire; ais_reco; ais_err_ |]
      ; [| ais_err_; ais_lock; ais_lock; ais_lock; ais_flin; ais_fire; ais_reco; ais_err_ |]
      ; [| ais_err_; ais_lock; ais_lock; ais_lock; ais_flin; ais_fire; ais_reco; ais_err_ |]
      ; [| ais_err_; ais_flin; ais_flin; ais_flin; ais_lock; ais_flin; ais_flin; ais_err_ |]
      ; [| ais_err_; ais_rest; ais_lock; ais_lock; ais_lock; ais_fire; ais_reco; ais_err_ |]
      ; [| ais_err_; ais_lock; ais_lock; ais_lock; ais_flin; ais_fire; ais_fire; ais_err_ |]
      ; [| ais_rest; ais_rest; ais_rest; ais_rest; ais_rest; ais_rest; ais_rest; ais_err_ |]
     |]
   ; (* AIE_HURT: PA_WEAPON_ROBOT_COLLISION - 1 = 3 *)
     [| [| ais_err_; ais_flin; ais_flin; ais_flin; ais_flin; ais_flin; ais_flin; ais_err_ |]
      ; [| ais_err_; ais_flin; ais_flin; ais_flin; ais_flin; ais_flin; ais_flin; ais_err_ |]
      ; [| ais_err_; ais_flin; ais_flin; ais_flin; ais_flin; ais_flin; ais_flin; ais_err_ |]
      ; [| ais_err_; ais_flin; ais_flin; ais_flin; ais_flin; ais_flin; ais_flin; ais_err_ |]
      ; [| ais_err_; ais_flin; ais_flin; ais_flin; ais_flin; ais_flin; ais_flin; ais_err_ |]
      ; [| ais_err_; ais_flin; ais_flin; ais_flin; ais_flin; ais_flin; ais_flin; ais_err_ |]
      ; [| ais_err_; ais_flin; ais_flin; ais_flin; ais_flin; ais_flin; ais_flin; ais_err_ |]
      ; [| ais_rest; ais_rest; ais_rest; ais_rest; ais_rest; ais_rest; ais_rest; ais_err_ |]
     |]
  |]
;;

(* -- Algebraic effects ---------------------------------------------------- *)

type _ Effect.t +=
  | Ai_multiplayer_awareness : int -> bool Effect.t
  | Do_ai_robot_hit_attack : unit Effect.t
  | Ai_fire_laser_at_player : (int * int * int * int * int * int * int * int * int) -> (int * int * int) Effect.t
  | Calc_gun_point : int -> (int * int * int) Effect.t
  | Create_path_to_player : (int * int) -> int array Effect.t
  | Create_path_to_station : int -> int array Effect.t
  | Create_n_segment_path : (int * int) -> int array Effect.t
  | Create_n_segment_path_to_door : (int * int) -> int array Effect.t
  | Attempt_to_resume_path : int array Effect.t
  | Ai_follow_path : (int * int * int * int * int) -> int array Effect.t
  | Move_towards_segment_center : unit Effect.t
  | Compute_vis_and_vec : (int * int * int) -> (int * int * int * int * int) Effect.t
  | Ai_multi_send_robot_position : int -> unit Effect.t
  | Do_boss_stuff : int -> unit Effect.t
  | P_Rand : int Effect.t
  | Make_random_vector : (int * int * int) Effect.t
  | Object_to_object_visibility : int Effect.t
  | Do_snipe_frame : (int * int * int * int * int * int) -> int array Effect.t  (* returns path state *)
  | Do_escort_frame : (int * int) -> int array Effect.t  (* returns path state *)
  | Do_thief_frame : (int * int * int * int * int * int * int) -> int array Effect.t  (* returns path state *)
  | Do_any_robot_dying_frame : bool Effect.t
  | Make_nearby_robot_snipe : unit Effect.t
  | Move_away_from_player : unit Effect.t
  | Openable_doors_in_segment : int Effect.t  (* returns side index or -1 *)
  | Invalidate_escort_goal : unit Effect.t
  | Laser_create_new_easy :
      (int * int * int * int * int * int * int * int)
      -> unit Effect.t
  (* Do_companion_extras: danger laser evasion + flare firing for companion robot.
     Args: (dist_to_player, player_visibility, vtpx, vtpy, vtpz, mode, next_fire, next_fire2)
     Returns: updated next_fire *)
  | Do_companion_extras : (int * int * int * int * int * int * int * int) -> int Effect.t
  (* Do_thief_extras: flare firing for thief robot.
     Args: (dist_to_player, player_visibility, vtpx, vtpy, vtpz, next_fire, next_fire2)
     Returns: updated next_fire *)
  | Do_thief_extras : (int * int * int * int * int * int * int) -> int Effect.t

(* Ai_fire_laser_at_player args: gpx, gpy, gpz, gun_num, fire_px, fire_py, fire_pz
   D1: gun_num=0, fire_pos=(0,0,0) ignored on C side
   D2: gun_num=actual, fire_pos=Believed_player_pos or Last_fired_upon_player_pos *)

(* Compute_vis_and_vec args: vis_vec_pos(3)
   Returns: (player_visibility, vtpx, vtpy, vtpz, sound_flag) *)

(* Ai_follow_path args: (player_vis, prev_vis, vtpx, vtpy, vtpz)
   D1: only uses first 2 args; D2: all 5 *)

(* Laser_create_new_easy args: (fvx, fvy, fvz, fpx, fpy, fpz, objnum, weapon_id) *)

(* -- AI state packed array layout ----------------------------------------- *)
(* Input indices for ai_state packed array *)
let idx_skip_ai_count = 0
let idx_goal_state = 1
let idx_current_state = 2
let idx_cloaked = 3
let idx_current_gun = 4
let idx_cur_path_index = 5
let idx_behavior = 6
let idx_hide_index = 7
let idx_path_length = 8
let idx_sub_flags = 9
let idx_danger_laser_num = 10
let idx_danger_laser_sig = 11
let idx_goalside = 12
let idx_hide_segment = 13

(* ailp fields *)
let idx_next_fire = 14
let idx_next_fire2 = 15
let idx_player_awareness_type = 16
let idx_player_awareness_time = 17
let idx_mode = 18
let idx_time_since_processed = 19
let idx_consecutive_retries = 20
let idx_retry_count = 21

(* goal_state[8] *)
let idx_goal_state_arr = 22

(* time_player_seen *)
let idx_time_player_seen = 30

(* goal_segment *)
let idx_goal_segment = 31

(* rapidfire_count *)
let idx_rapidfire_count = 32

(* achieved_state[8] *)
let idx_achieved_state = 33

(* previous_visibility *)
let idx_previous_visibility = 41

(* D2: next_action_time *)
let idx_next_action_time = 42

(* Total AI state packed array size *)
let ai_state_size = 43

(* Robot info packed array layout *)
let ri_attack_type = 0
let ri_weapon_type = 1
let ri_weapon_type2 = 2
let ri_n_guns = 3
let ri_boss_flag = 4
let ri_companion = 5
let ri_thief = 6
let ri_kamikaze = 7
let ri_field_of_view = 8
let ri_max_speed = 9
let ri_firing_wait = 10
let ri_firing_wait2 = 11
let ri_see_sound = 12
let ri_attack_sound = 13
let ri_cloak_type = 14
let ri_energy_drain = 15
let ri_aim_ = 16
let ri_homing_flag = 17
let ri_homing_flag2 = 18
let ri_circle_distance = 19 (* array of NDL=5 *)
let ri_turn_time = 24 (* array of NDL=5 *)
let ri_pursuit = 29

(* -- maybe_ai_do_actual_firing_stuff -------------------------------------- *)

let maybe_ai_do_actual_firing_stuff ~game_mode ~goal_state ~obj_id ~current_state =
  if
    game_mode land gm_multi <> 0
    && goal_state <> ais_flin
    && obj_id <> robot_brain
    && current_state = ais_fire
  then true
  else false
;;

(* -- ai_do_actual_firing_stuff D1 ----------------------------------------- *)

let ai_do_actual_firing_stuff_d1
      ~goal_state
      ~(goal_state_arr : int array)
      ~current_gun
      ~mode
      ~behavior
      ~next_fire
      ~(achieved_state : int array)
      ~player_visibility
      ~object_animates
      ~attack_type
      ~n_guns
      ~homing_flag
      ~player_exploded
      ~dist_to_player
      ~obj_size
      ~console_size
      ~fvec_x
      ~fvec_y
      ~fvec_z
      ~vtpx
      ~vtpy
      ~vtpz
      ~gpx
      ~gpy
      ~gpz
  =
  let goal_state = ref goal_state in
  let goal_state_arr = Array.copy goal_state_arr in
  let current_gun = ref current_gun in
  let mode = ref mode in
  let next_fire = ref next_fire in
  let advance_gun () =
    current_gun := !current_gun + 1;
    if !current_gun >= n_guns then current_gun := 0
  in
  let fire_laser (gpx, gpy, gpz, gun_num, fpx, fpy, fpz) =
    let nf, _nf2, _rfc = Effect.perform (Ai_fire_laser_at_player (gpx, gpy, gpz, gun_num, fpx, fpy, fpz, !next_fire, 0)) in
    next_fire := nf
  in
  if player_visibility = 2
  then (
    if (not (object_animates <> 0)) || !next_fire <= 0
    then (
      let dot =
        Ox_math.vm_vec_dotprod ~a:(fvec_x, fvec_y, fvec_z) ~b:(vtpx, vtpy, vtpz)
      in
      if dot >= 7 * f1_0 / 8
      then (
        if !current_gun < n_guns
        then (
          if attack_type = 1
          then
            if player_exploded = 0 && dist_to_player < obj_size + console_size + (f1_0 * 2)
            then (
              let ok =
                Effect.perform (Ai_multiplayer_awareness (robot_fire_agitation - 2))
              in
              if not ok then ();
              if ok then Effect.perform Do_ai_robot_hit_attack)
            else ()
          else if gpx = 0 && gpy = 0 && gpz = 0
          then ()
          else (
            let ok = Effect.perform (Ai_multiplayer_awareness robot_fire_agitation) in
            if not ok then ();
            if ok
            then fire_laser (gpx, gpy, gpz, 0, 0, 0, 0));
          if
            behavior <> aib_run_from
            && behavior <> aib_still
            && behavior <> aib_snipe
            && (!mode = aim_follow_path || !mode = aim_still)
          then mode := aim_chase_object);
        goal_state := ais_reco;
        goal_state_arr.(!current_gun) <- ais_reco;
        advance_gun ())))
  else if homing_flag = 1
  then
    if
      ((not (object_animates <> 0)) || achieved_state.(!current_gun) = ais_fire)
      && !next_fire <= 0
    then (
      let hit_dist = Effect.perform (Compute_vis_and_vec (0, 0, 0)) in
      let _, _, _, _, hit_far_enough = hit_dist in
      if hit_far_enough <> 0
      then (
        let ok = Effect.perform (Ai_multiplayer_awareness robot_fire_agitation) in
        if ok
        then (
          fire_laser (gpx, gpy, gpz, 0, 0, 0, 0);
          goal_state := ais_reco;
          goal_state_arr.(!current_gun) <- ais_reco;
          advance_gun ())
        else advance_gun ())
      else advance_gun ())
    else advance_gun ();
  [| !goal_state
   ; goal_state_arr.(0)
   ; goal_state_arr.(1)
   ; goal_state_arr.(2)
   ; goal_state_arr.(3)
   ; goal_state_arr.(4)
   ; goal_state_arr.(5)
   ; goal_state_arr.(6)
   ; goal_state_arr.(7)
   ; !current_gun
   ; !mode
   ; !next_fire
  |]
;;

(* -- ai_do_actual_firing_stuff D2 ----------------------------------------- *)

let ai_do_actual_firing_stuff_d2
      ~goal_state
      ~(goal_state_arr : int array)
      ~current_gun
      ~mode
      ~behavior
      ~next_fire
      ~next_fire2
      ~(achieved_state : int array)
      ~player_visibility
      ~object_animates
      ~attack_type
      ~n_guns
      ~weapon_type2
      ~homing_flag
      ~homing_flag2
      ~boss_flag
      ~player_exploded
      ~dist_to_player
      ~obj_size
      ~console_size
      ~fvec_x
      ~fvec_y
      ~fvec_z
      ~vtpx
      ~vtpy
      ~vtpz
      ~gpx
      ~gpy
      ~gpz
      ~gun_num
      ~dist_to_last_fired_upon
      ~fire_at_nearby_threshold
      ~difficulty_level
      ~frame_time
      ~believed_px
      ~believed_py
      ~believed_pz
  =
  let goal_state = ref goal_state in
  let goal_state_arr = Array.copy goal_state_arr in
  let current_gun = ref current_gun in
  let mode = ref mode in
  let last_fired_updated = ref 0 in
  let next_fire = ref next_fire in
  let next_fire2 = ref next_fire2 in
  let advance_gun () =
    current_gun := !current_gun + 1;
    if !current_gun >= n_guns
    then if n_guns = 1 || weapon_type2 = -1 then current_gun := 0 else current_gun := 1
  in
  let fire_laser (gpx, gpy, gpz, gun_num, fpx, fpy, fpz) =
    let nf, nf2, _rfc = Effect.perform (Ai_fire_laser_at_player (gpx, gpy, gpz, gun_num, fpx, fpy, fpz, !next_fire, !next_fire2)) in
    next_fire := nf;
    next_fire2 := nf2;
    last_fired_updated := 1
  in
  let do_ranged_fire ~fire_px ~fire_py ~fire_pz =
    if gpx = 0 && gpy = 0 && gpz = 0
    then ()
    else (
      let ok = Effect.perform (Ai_multiplayer_awareness robot_fire_agitation) in
      if ok
      then
        if gun_num <> 0
        then (
          if !next_fire <= 0
          then
            fire_laser (gpx, gpy, gpz, gun_num, fire_px, fire_py, fire_pz);
          if !next_fire2 <= 0 && weapon_type2 <> -1
          then (
            let gp2x, gp2y, gp2z = Effect.perform (Calc_gun_point 0) in
            fire_laser (gp2x, gp2y, gp2z, 0, fire_px, fire_py, fire_pz)))
        else if !next_fire <= 0
        then
          fire_laser (gpx, gpy, gpz, gun_num, fire_px, fire_py, fire_pz))
  in
  if player_visibility = 2 || dist_to_last_fired_upon < fire_at_nearby_threshold
  then (
    (* Path 1: visible or recently fired upon *)
    (* fire_pos = Believed_player_pos by default;
       if not melee and player not directly visible, use Last_fired_upon_player_pos.
       We approximate Last_fired_upon_player_pos with believed_player_pos since they
       are usually very close (Last is set to believed after each fire). *)
    let fire_px = ref believed_px in
    let fire_py = ref believed_py in
    let fire_pz = ref believed_pz in
    if
      (not (object_animates <> 0))
      || !next_fire <= 0
      || (!next_fire2 <= 0 && weapon_type2 <> -1)
    then (
      let dot =
        Ox_math.vm_vec_dotprod ~a:(fvec_x, fvec_y, fvec_z) ~b:(vtpx, vtpy, vtpz)
      in
      if dot >= 7 * f1_0 / 8 || (dot > f1_0 / 4 && boss_flag <> 0)
      then (
        if gun_num < n_guns
        then (
          if attack_type = 1
          then (
            if player_exploded = 0 && dist_to_player < obj_size + console_size + (f1_0 * 2)
            then (
              let ok =
                Effect.perform (Ai_multiplayer_awareness (robot_fire_agitation - 2))
              in
              if ok then Effect.perform Do_ai_robot_hit_attack))
          else do_ranged_fire ~fire_px:!fire_px ~fire_py:!fire_py ~fire_pz:!fire_pz;
          if
            behavior <> aib_run_from
            && behavior <> aib_still
            && behavior <> aib_snipe
            && behavior <> aib_follow
            && attack_type = 0
            && (!mode = aim_follow_path || !mode = aim_still)
          then mode := aim_chase_object);
        goal_state := ais_reco;
        goal_state_arr.(!current_gun) <- ais_reco;
        advance_gun ())))
  else if attack_type = 0 && (homing_flag = 1 || (weapon_type2 <> -1 && homing_flag2 = 1))
  then
    if
      (* Path 2: homing weapons *)
      ((not (object_animates <> 0)) || achieved_state.(!current_gun) = ais_fire)
      && ((!next_fire <= 0 && !current_gun <> 0) || (!next_fire2 <= 0 && !current_gun = 0))
    then (
      (* Check Hit_pos distance > 40*F1_0 via effect *)
      let _, _, _, _, hit_far_enough = Effect.perform (Compute_vis_and_vec (0, 0, 0)) in
      if hit_far_enough <> 0
      then (
        let ok = Effect.perform (Ai_multiplayer_awareness robot_fire_agitation) in
        if ok
        then (
          fire_laser (gpx, gpy, gpz, gun_num, believed_px, believed_py, believed_pz);
          goal_state := ais_reco;
          goal_state_arr.(!current_gun) <- ais_reco;
          advance_gun ())
        else advance_gun ())
      else advance_gun ())
    else advance_gun ()
  else (
    (* Path 3: blind fire at recently-seen position *)
    let prand = Effect.perform P_Rand in
    if prand / 2 < Ox_math.fixmul ~a:frame_time ~b:((difficulty_level lsl 12) + 0x4000)
    then
      if dist_to_last_fired_upon < fire_at_nearby_threshold
      then
        if
          (not (object_animates <> 0))
          || !next_fire <= 0
          || (!next_fire2 <= 0 && weapon_type2 <> -1)
        then (
          (* Direction computed on C side as vec to Last_fired_upon_player_pos *)
          let dot =
            Ox_math.vm_vec_dotprod ~a:(fvec_x, fvec_y, fvec_z) ~b:(vtpx, vtpy, vtpz)
          in
          if dot >= 7 * f1_0 / 8
          then (
            if !current_gun < n_guns
            then (
              if attack_type = 1
              then (
                if
                  player_exploded = 0
                  && dist_to_player < obj_size + console_size + (f1_0 * 2)
                then (
                  let ok =
                    Effect.perform (Ai_multiplayer_awareness (robot_fire_agitation - 2))
                  in
                  if ok then Effect.perform Do_ai_robot_hit_attack))
              else if gpx = 0 && gpy = 0 && gpz = 0
              then ()
              else (
                let ok = Effect.perform (Ai_multiplayer_awareness robot_fire_agitation) in
                if ok
                then
                  if gun_num <> 0
                  then (
                    if !next_fire <= 0
                    then
                      fire_laser
                        (gpx, gpy, gpz, gun_num, believed_px, believed_py, believed_pz);
                    if !next_fire2 <= 0 && weapon_type2 <> -1
                    then (
                      let gp2x, gp2y, gp2z = Effect.perform (Calc_gun_point 0) in
                      fire_laser
                        (gp2x, gp2y, gp2z, 0, believed_px, believed_py, believed_pz)))
                  else if !next_fire <= 0
                  then
                    fire_laser
                      (gpx, gpy, gpz, gun_num, believed_px, believed_py, believed_pz));
              if
                behavior <> aib_run_from
                && behavior <> aib_still
                && behavior <> aib_snipe
                && behavior <> aib_follow
                && (!mode = aim_follow_path || !mode = aim_still)
              then mode := aim_chase_object);
            goal_state := ais_reco;
            goal_state_arr.(!current_gun) <- ais_reco;
            let () =
              current_gun := !current_gun + 1;
              if !current_gun >= n_guns
              then if n_guns = 1 then current_gun := 0 else current_gun := 1
            in
            ())
          else advance_gun ())
        else advance_gun ());
  [| !goal_state
   ; goal_state_arr.(0)
   ; goal_state_arr.(1)
   ; goal_state_arr.(2)
   ; goal_state_arr.(3)
   ; goal_state_arr.(4)
   ; goal_state_arr.(5)
   ; goal_state_arr.(6)
   ; goal_state_arr.(7)
   ; !current_gun
   ; !mode
   ; !last_fired_updated
   ; !next_fire
   ; !next_fire2
  |]
;;

(* -- do_ai_frame D1 ------------------------------------------------------- *)

let do_ai_frame_d1
      ~(ai_state : int array)
      ~(rinfo : int array)
      ~frame_time
      ~frame_count
      ~game_time
      ~game_mode
      ~difficulty_level
      ~overall_agitation
      ~player_is_dead
      ~player_exploded
      ~player_flags
      ~obj_x
      ~obj_y
      ~obj_z
      ~obj_segnum
      ~obj_size
      ~obj_id
      ~objnum
      ~console_x
      ~console_y
      ~console_z
      ~console_size
      ~believed_x
      ~believed_y
      ~believed_z
      ~believed_seg
      ~(orient : int array)
      ~(gun_point_in : int array)
      ~seg_special
      ~(cloak_last_pos : int array)
      ~cloak_last_time
      ~ai_evaded_in
  =
  (* Unpack AI state into refs *)
  let skip_ai_count = ref ai_state.(idx_skip_ai_count) in
  let goal_state = ref ai_state.(idx_goal_state) in
  let current_state = ref ai_state.(idx_current_state) in
  let cloaked = ref ai_state.(idx_cloaked) in
  let current_gun = ref ai_state.(idx_current_gun) in
  let cur_path_index = ref ai_state.(idx_cur_path_index) in
  let behavior = ref ai_state.(idx_behavior) in
  let hide_index = ref ai_state.(idx_hide_index) in
  let path_length = ref ai_state.(idx_path_length) in
  let _sub_flags = ai_state.(idx_sub_flags) in
  let goalside = ref ai_state.(idx_goalside) in
  let hide_segment = ref ai_state.(idx_hide_segment) in
  let next_fire = ref ai_state.(idx_next_fire) in
  let _next_fire2 = ref ai_state.(idx_next_fire2) in
  let player_awareness_type = ref ai_state.(idx_player_awareness_type) in
  let player_awareness_time = ref ai_state.(idx_player_awareness_time) in
  let mode = ref ai_state.(idx_mode) in
  let time_since_processed = ref ai_state.(idx_time_since_processed) in
  let consecutive_retries = ref ai_state.(idx_consecutive_retries) in
  let retry_count = ref ai_state.(idx_retry_count) in
  let goal_state_arr = Array.init 8 ~f:(fun i -> ai_state.(idx_goal_state_arr + i)) in
  let time_player_seen = ref ai_state.(idx_time_player_seen) in
  let goal_segment = ref ai_state.(idx_goal_segment) in
  let _rapidfire_count = ai_state.(idx_rapidfire_count) in
  let achieved_state = Array.init 8 ~f:(fun i -> ai_state.(idx_achieved_state + i)) in
  let previous_visibility = ref ai_state.(idx_previous_visibility) in
  (* Unpack robot info *)
  let attack_type = rinfo.(ri_attack_type) in
  let _weapon_type = rinfo.(ri_weapon_type) in
  let _weapon_type2 = rinfo.(ri_weapon_type2) in
  let n_guns = rinfo.(ri_n_guns) in
  let boss_flag = rinfo.(ri_boss_flag) in
  let homing_flag = rinfo.(ri_homing_flag) in
  let cloak_type = rinfo.(ri_cloak_type) in
  let circle_distance_diff = rinfo.(ri_circle_distance + difficulty_level) in
  let turn_time_diff = rinfo.(ri_turn_time + difficulty_level) in
  (* Mutable locals *)
  let player_visibility = ref (-1) in
  let object_animates = ref 0 in
  let visibility_and_vec_computed = ref 0 in
  let vec_to_player = ref (0, 0, 0) in
  let dist_to_player = ref 0 in
  let gun_point = ref (gun_point_in.(0), gun_point_in.(1), gun_point_in.(2)) in
  let vis_vec_pos = ref (obj_x, obj_y, obj_z) in
  let ai_evaded = ref ai_evaded_in in
  let believed_player_pos = ref (believed_x, believed_y, believed_z) in
  ignore believed_seg;
  let obj_ref = objnum lxor frame_count in
  (* Helper: compute visibility *)
  let compute_vis () =
    if !visibility_and_vec_computed = 0
    then (
      let vpx, vpy, vpz = !vis_vec_pos in
      let pv, vtx, vty, vtz, _snd =
        Effect.perform (Compute_vis_and_vec (vpx, vpy, vpz))
      in
      player_visibility := pv;
      vec_to_player := vtx, vty, vtz;
      (* C's compute_vis_and_vec updates ailp->previous_visibility = player_visibility.
         Mirror that here so the time-slice check uses the current frame's value. *)
      previous_visibility := pv;
      visibility_and_vec_computed := 1)
  in
  (* Helper: unpack path state returned by path effects.
     Array: [0]hide_index [1]path_length [2]cur_path_index [3]path_dir
            [4]mode [5]goal_segment [6]time_player_seen [7]player_awareness_type
            [8]behavior [9]hide_segment [10]skip_ai_count *)
  let unpack_path_state ps =
    hide_index := ps.(0);
    path_length := ps.(1);
    cur_path_index := ps.(2);
    (* ps.(3) = path_dir: not tracked as ref in D1, ignored *)
    mode := ps.(4);
    goal_segment := ps.(5);
    time_player_seen := ps.(6);
    player_awareness_type := ps.(7);
    behavior := ps.(8);
    hide_segment := ps.(9);
    skip_ai_count := ps.(10)
  in
  (* Helper: pack result *)
  let pack_result () =
    let r = Array.create ~len:ai_state_size 0 in
    r.(idx_skip_ai_count) <- !skip_ai_count;
    r.(idx_goal_state) <- !goal_state;
    r.(idx_current_state) <- !current_state;
    r.(idx_cloaked) <- !cloaked;
    r.(idx_current_gun) <- !current_gun;
    r.(idx_cur_path_index) <- !cur_path_index;
    r.(idx_behavior) <- !behavior;
    r.(idx_hide_index) <- !hide_index;
    r.(idx_path_length) <- !path_length;
    r.(idx_sub_flags) <- _sub_flags;
    r.(idx_goalside) <- !goalside;
    r.(idx_hide_segment) <- !hide_segment;
    r.(idx_next_fire) <- !next_fire;
    r.(idx_next_fire2) <- !_next_fire2;
    r.(idx_player_awareness_type) <- !player_awareness_type;
    r.(idx_player_awareness_time) <- !player_awareness_time;
    r.(idx_mode) <- !mode;
    r.(idx_time_since_processed) <- !time_since_processed;
    r.(idx_consecutive_retries) <- !consecutive_retries;
    r.(idx_retry_count) <- !retry_count;
    for i = 0 to 7 do
      r.(idx_goal_state_arr + i) <- goal_state_arr.(i)
    done;
    r.(idx_time_player_seen) <- !time_player_seen;
    r.(idx_goal_segment) <- !goal_segment;
    r.(idx_rapidfire_count) <- _rapidfire_count;
    for i = 0 to 7 do
      r.(idx_achieved_state + i) <- achieved_state.(i)
    done;
    r.(idx_previous_visibility) <- !previous_visibility;
    r
  in
  (* Helper: fire actual *)
  let do_actual_firing () =
    let vtpx, vtpy, vtpz = !vec_to_player in
    let gpx, gpy, gpz = !gun_point in
    let result =
      ai_do_actual_firing_stuff_d1
        ~goal_state:!goal_state
        ~goal_state_arr
        ~current_gun:!current_gun
        ~mode:!mode
        ~behavior:!behavior
        ~next_fire:!next_fire
        ~achieved_state
        ~player_visibility:!player_visibility
        ~object_animates:!object_animates
        ~attack_type
        ~n_guns
        ~homing_flag
        ~player_exploded
        ~dist_to_player:!dist_to_player
        ~obj_size
        ~console_size
        ~fvec_x:orient.(6)
        ~fvec_y:orient.(7)
        ~fvec_z:orient.(8)
        ~vtpx
        ~vtpy
        ~vtpz
        ~gpx
        ~gpy
        ~gpz
    in
    goal_state := result.(0);
    for i = 0 to 7 do
      goal_state_arr.(i) <- result.(1 + i)
    done;
    current_gun := result.(9);
    mode := result.(10);
    (* Read back fire timer updated by set_next_fire_time in C *)
    next_fire := result.(11)
  in
  (* -- Phase 1: Skip count ------------------------------------------------ *)
  let exception Early_return in
  let maybe_fire_mp_and_return () =
    if
      maybe_ai_do_actual_firing_stuff
        ~game_mode
        ~goal_state:!goal_state
        ~obj_id
        ~current_state:!current_state
    then do_actual_firing ();
    raise Early_return
  in
  (* Helper: do_firing_stuff — upgrade GOAL_STATE based on visibility+facing *)
  let do_firing_stuff () =
    if !player_visibility >= 1
    then (
      let fvec = orient.(6), orient.(7), orient.(8) in
      let dot = Ox_math.vm_vec_dotprod ~a:fvec ~b:!vec_to_player in
      if dot >= 7 * f1_0 / 8
         || player_flags land player_flags_cloaked <> 0
      then (
        match !goal_state with
        | gs when gs = ais_none || gs = ais_rest || gs = ais_srch || gs = ais_lock ->
          goal_state := ais_fire;
          if !player_awareness_type <= pa_nearby_robot_fired
          then (
            player_awareness_type := pa_nearby_robot_fired;
            player_awareness_time := 3 * f1_0)
        | _ -> ())
      else if dot >= f1_0 / 2
      then (
        match !goal_state with
        | gs when gs = ais_none || gs = ais_rest || gs = ais_srch ->
          goal_state := ais_lock
        | _ -> ()))
  in
  if !skip_ai_count > 0
  then (
    skip_ai_count := !skip_ai_count - 1;
    pack_result ())
  else (
    (try
    (* Phase: unflinch *)
    if !goal_state = ais_flin && !next_fire < 0 then goal_state := ais_fire;
    (* Phase: behavior validation *)
    if not (!behavior >= min_behavior && !behavior <= max_behavior_d1)
    then behavior := aib_normal;
    (* Phase: timer decrements *)
    if !next_fire > -(f1_0 * 8) then next_fire := !next_fire - frame_time;
    if !time_since_processed < f1_0 * 256
    then time_since_processed := !time_since_processed + frame_time;
    previous_visibility := ai_state.(idx_previous_visibility);
    (* Phase: cloaking *)
    if cloak_type = ri_cloaked_except_firing
    then if !next_fire < f1_0 / 2 then cloaked := 1 else cloaked := 0;
    (* Phase: believed player pos *)
    if player_flags land player_flags_cloaked = 0
    then believed_player_pos := console_x, console_y, console_z
    else believed_player_pos := cloak_last_pos.(0), cloak_last_pos.(1), cloak_last_pos.(2);
    ignore cloak_last_time;
    let bpx, bpy, bpz = !believed_player_pos in
    dist_to_player := Ox_math.vm_vec_dist_quick ~a:(bpx, bpy, bpz) ~b:(obj_x, obj_y, obj_z);
    (* Phase: gun point computation *)
    if !next_fire <= 0 && !dist_to_player < f1_0 * 200 && n_guns > 0 && attack_type = 0
    then (
      let gpx, gpy, gpz = Effect.perform (Calc_gun_point !current_gun) in
      gun_point := gpx, gpy, gpz;
      vis_vec_pos := gpx, gpy, gpz)
    else (
      vis_vec_pos := obj_x, obj_y, obj_z;
      gun_point := 0, 0, 0);
    (* Phase: agitation path creation *)
    if !behavior <> aib_run_from && !behavior <> aib_still && game_mode land gm_multi = 0
    then
      if overall_agitation > 70
      then
        if !dist_to_player < f1_0 * 200
        then (
          let pr = Effect.perform P_Rand in
          if pr < frame_time / 4
          then (
            let pr2 = Effect.perform P_Rand in
            if pr2 * (overall_agitation - 40) > f1_0 * 5
            then (
              unpack_path_state (Effect.perform
                (Create_path_to_player (4 + (overall_agitation / 8) + difficulty_level, 1)));
              raise Early_return)));
    (* Phase: retry count *)
    if !retry_count > 0 && game_mode land gm_multi = 0
    then (
      consecutive_retries := !consecutive_retries + !retry_count;
      retry_count := 0;
      if !consecutive_retries > 3
      then (
        (match !mode with
         | m when m = aim_chase_object ->
           unpack_path_state (Effect.perform
             (Create_path_to_player (4 + (overall_agitation / 8) + difficulty_level, 1)))
         | m when m = aim_still ->
           if not (!behavior = aib_still || !behavior = aib_station)
           then unpack_path_state (Effect.perform Attempt_to_resume_path)
         | m when m = aim_follow_path ->
           if game_mode land gm_multi <> 0
           then mode := aim_still
           else unpack_path_state (Effect.perform Attempt_to_resume_path)
         | m when m = aim_run_from_object ->
           Effect.perform Move_towards_segment_center;
           unpack_path_state (Effect.perform (Create_n_segment_path (5, -1)));
           mode := aim_run_from_object
         | m when m = aim_behind ->
           Effect.perform Move_towards_segment_center;
           if overall_agitation > 50 - (difficulty_level * 4)
           then unpack_path_state (Effect.perform (Create_path_to_player (4 + (overall_agitation / 8), 1)))
           else unpack_path_state (Effect.perform (Create_n_segment_path (5, -1)))
         | m when m = aim_open_door ->
           unpack_path_state (Effect.perform (Create_n_segment_path_to_door (5, -1)))
         | _ -> ());
        consecutive_retries := 0))
    else consecutive_retries := !consecutive_retries / 2;
    (* Phase: robotmaker exit *)
    if game_mode land gm_multi = 0 && seg_special = segment_is_robotmaker
    then (
      unpack_path_state (Effect.perform (Ai_follow_path (1, !previous_visibility, 0, 0, 0)));
      raise Early_return);
    (* Phase: awareness decay *)
    if !player_awareness_type > 0
    then
      if !player_awareness_time > 0
      then (
        player_awareness_time := !player_awareness_time - frame_time;
        if !player_awareness_time <= 0
        then (
          player_awareness_time := f1_0 * 2;
          player_awareness_type := !player_awareness_type - 1))
      else (
        player_awareness_type := !player_awareness_type - 1;
        player_awareness_time := f1_0 * 2)
    else goal_state := ais_rest;
    (* Phase: dead player *)
    if player_is_dead <> 0 && !player_awareness_type = 0
    then
      if !dist_to_player < f1_0 * 200
      then (
        let pr = Effect.perform P_Rand in
        if pr < frame_time / 8
        then
          if !behavior <> aib_still && !behavior <> aib_run_from
          then (
            let ok = Effect.perform (Ai_multiplayer_awareness 30) in
            if not ok then raise Early_return;
            if ok
            then (
              Effect.perform (Ai_multi_send_robot_position (-1));
              if not (!mode = aim_follow_path && !cur_path_index < !path_length - 1)
              then
                if !dist_to_player < f1_0 * 30
                then unpack_path_state (Effect.perform (Create_n_segment_path (5, 1)))
                else unpack_path_state (Effect.perform (Create_path_to_player (20, 1))))));
    (* Phase: collision awareness + visibility agitation *)
    if
      !player_awareness_type = pa_weapon_robot_collision
      || !player_awareness_type >= pa_player_collision
    then (
      compute_vis ();
      if !player_visibility = 1 then player_visibility := 2;
      if
        !behavior <> aib_still
        && !behavior <> aib_snipe
        && !behavior <> aib_run_from
        && obj_id <> robot_brain
      then mode := aim_chase_object)
    else if
      obj_ref land 3 = 0
      && !previous_visibility = 0
      && !dist_to_player < f1_0 * 100
    then (
      let rval = Effect.perform P_Rand in
      let sval = !dist_to_player * (difficulty_level + 1) / 64 in
      if Ox_math.fixmul ~a:rval ~b:sval < frame_time
         || player_flags land player_flags_headlight_on <> 0
      then (
        player_awareness_type := pa_player_collision;
        player_awareness_time := f1_0 * 3;
        compute_vis ();
        if !player_visibility = 1 then player_visibility := 2));
    (* Phase: flinch→lock *)
    if !goal_state = ais_flin && !current_state = ais_flin then goal_state := ais_lock;
    (* Phase: animation *)
    if !dist_to_player < f1_0 * 100
    then
      (* do_silly_animation + ai_frame_animation done on C side *)
      object_animates := 1
    else (
      current_state := !goal_state;
      object_animates := 0);
    (* Phase: boss handling *)
    (match boss_flag with
     | 0 -> ()
     | 1 ->
       if !goal_state = ais_flin then goal_state := ais_fire;
       if !current_state = ais_flin then current_state := ais_fire;
       dist_to_player := !dist_to_player / 4;
       Effect.perform (Do_boss_stuff !player_visibility);
       dist_to_player := !dist_to_player * 4
     | 2 ->
       if !goal_state = ais_flin then goal_state := ais_fire;
       if !current_state = ais_flin then current_state := ais_fire;
       compute_vis ();
       let pv = ref !player_visibility in
       let dtp = ref (!dist_to_player / 4) in
       if player_flags land player_flags_cloaked <> 0
       then (
         pv := 0;
         dtp
         := Ox_math.vm_vec_dist_quick
              ~a:(console_x, console_y, console_z)
              ~b:(obj_x, obj_y, obj_z)
            / 4);
       ignore (!pv, !dtp);
       (* do_super_boss_stuff called on C side with pv, dtp *)
       Effect.perform (Do_boss_stuff !pv)
     | _ -> ());
    (* Phase: time slicing — C returns early here *)
    if !player_awareness_type < pa_weapon_robot_collision - 1
       && rinfo.(ri_companion) = 0 && rinfo.(ri_thief) = 0
    then
      if !behavior = aib_station && !mode = aim_follow_path
         && !hide_segment <> obj_segnum
      then (if !dist_to_player > f1_0 * 250 then raise Early_return)
      else if !previous_visibility = 0
              && !dist_to_player asr 7 > !time_since_processed
      then raise Early_return;
    time_since_processed := -(((objnum land 0x03) * frame_time) / 2);
    (* Phase: brain robot *)
    if obj_id = robot_brain
    then
      if
        console_x = obj_x && console_y = obj_y && console_z = obj_z
        (* same segment check approximated *)
      then (
        let ok = Effect.perform (Ai_multiplayer_awareness 97) in
        if not ok then raise Early_return;
        compute_vis ();
        Effect.perform Move_away_from_player;
        Effect.perform (Ai_multi_send_robot_position (-1)))
      else if !mode <> aim_still
      then (
        (* openable_doors_in_segment done on C side *)
        let r = -1 in
        (* placeholder: actual door check done via C side effect *)
        if r <> -1
        then (
          mode := aim_open_door;
          goalside := r)
        else if !mode <> aim_follow_path
        then (
          let ok = Effect.perform (Ai_multiplayer_awareness 50) in
          if not ok then raise Early_return;
          unpack_path_state (Effect.perform (Create_n_segment_path_to_door (8 + difficulty_level, -1)));
          Effect.perform (Ai_multi_send_robot_position (-1))))
      else (
        compute_vis ();
        if !player_visibility > 0
        then (
          let ok = Effect.perform (Ai_multiplayer_awareness 50) in
          if not ok then raise Early_return;
          unpack_path_state (Effect.perform (Create_n_segment_path_to_door (8 + difficulty_level, -1)));
          Effect.perform (Ai_multi_send_robot_position (-1))));
    (* Phase: mode dispatch *)
    (match !mode with
     | m when m = aim_chase_object ->
       let circle_distance = circle_distance_diff + console_size in
       let circle_distance =
         if attack_type <> 1
         then circle_distance + (objnum land 0xf * f1_0 / 2)
         else circle_distance
       in
       compute_vis ();
       if !player_visibility < 2 && !previous_visibility = 2
       then (
         let ok = Effect.perform (Ai_multiplayer_awareness 53) in
         if not ok
         then maybe_fire_mp_and_return ()
         else (
           unpack_path_state (Effect.perform (Create_path_to_player (8, 1)));
           Effect.perform (Ai_multi_send_robot_position (-1))))
       else if
         !player_visibility = 0
         && !dist_to_player > f1_0 * 80
         && game_mode land gm_multi = 0
       then
         if !behavior = aib_station
         then (
           goal_segment := !hide_segment;
           unpack_path_state (Effect.perform (Create_path_to_station 15)))
         else unpack_path_state (Effect.perform (Create_n_segment_path (5, -1)));
       if !current_state = ais_rest && !goal_state = ais_rest
       then
         if !player_visibility > 0
         then (
           let pr = Effect.perform P_Rand in
           if pr < frame_time * !player_visibility
           then (
             let pr2 = Effect.perform P_Rand in
             if !dist_to_player / 256 < pr2 * !player_visibility
             then (
               goal_state := ais_srch;
               current_state := ais_srch)));
       if game_time - !time_player_seen > chase_time_length
       then (
         if game_mode land gm_multi <> 0
         then
           if !player_visibility = 0 && !dist_to_player > f1_0 * 70
           then (
             mode := aim_still;
             raise Early_return);
         let ok = Effect.perform (Ai_multiplayer_awareness 64) in
         if not ok
         then maybe_fire_mp_and_return ()
         else (
           unpack_path_state (Effect.perform (Create_path_to_player (10, 1)));
           Effect.perform (Ai_multi_send_robot_position (-1))))
       else if !current_state <> ais_rest && !goal_state <> ais_rest
       then (
         let ok = Effect.perform (Ai_multiplayer_awareness 70) in
         if not ok
         then maybe_fire_mp_and_return ()
         else (
           ignore circle_distance;
           (* ai_move_relative_to_player done on C side *)
           if obj_ref land 1 <> 0 && (!goal_state = ais_srch || !goal_state = ais_lock)
           then
             if !player_visibility > 0
             then (
               let vtpx, vtpy, vtpz = !vec_to_player in
               ignore (vtpx, vtpy, vtpz, turn_time_diff))
             else ();
           if !ai_evaded <> 0
           then (
             Effect.perform (Ai_multi_send_robot_position 1);
             ai_evaded := 0)
           else
             Effect.perform (Ai_multi_send_robot_position (-1));
           do_firing_stuff ()))
     | m when m = aim_run_from_object ->
       compute_vis ();
       if !player_visibility > 0
       then
         if !player_awareness_type = 0
         then player_awareness_type := pa_weapon_robot_collision;
       if game_mode land gm_multi = 0 || !player_visibility > 0
       then (
         let ok = Effect.perform (Ai_multiplayer_awareness 75) in
         if ok
         then (
           unpack_path_state (Effect.perform
             (Ai_follow_path (!player_visibility, !previous_visibility, 0, 0, 0)));
           Effect.perform (Ai_multi_send_robot_position (-1))));
       if !goal_state <> ais_flin
       then goal_state := ais_lock
       else if !current_state = ais_flin
       then goal_state := ais_lock;
       (* Drop proximity bombs *)
       if !next_fire <= 0 && !player_visibility > 0
       then (
         let ok = Effect.perform (Ai_multiplayer_awareness 75) in
         if not ok then raise Early_return;
         if ok
         then (
           let fvx = -orient.(6) in
           let fvy = -orient.(7) in
           let fvz = -orient.(8) in
           let fpx, fpy, fpz =
             Ox_math.vm_vec_add ~a:(obj_x, obj_y, obj_z) ~b:(fvx, fvy, fvz)
           in
           Effect.perform
             (Laser_create_new_easy (fvx, fvy, fvz, fpx, fpy, fpz, objnum, proximity_id));
           next_fire := f1_0 * 5))
     | m when m = aim_follow_path ->
       let anger_level = ref 65 in
       if !behavior = aib_station
       then
         (* Check if last point segment = hide_segment *)
         anger_level := 64;
       compute_vis ();
       let ok = Effect.perform (Ai_multiplayer_awareness !anger_level) in
       if not ok
       then (
         if
           maybe_ai_do_actual_firing_stuff
             ~game_mode
             ~goal_state:!goal_state
             ~obj_id
             ~current_state:!current_state
         then (
           compute_vis ();
           do_actual_firing ());
         raise Early_return)
       else (
         unpack_path_state (Effect.perform
           (Ai_follow_path (!player_visibility, !previous_visibility, 0, 0, 0)));
         if !goal_state <> ais_flin
         then goal_state := ais_lock
         else if !current_state = ais_flin
         then goal_state := ais_lock;
         if !behavior <> aib_snipe && !behavior <> aib_run_from
         then do_firing_stuff ();
         if
           !player_visibility = 2
           && !behavior <> aib_snipe
           && !behavior <> aib_run_from
           && obj_id <> robot_brain
         then (if attack_type = 0 then mode := aim_chase_object)
         else if
           !player_visibility = 0
           && !behavior = aib_normal
           && !mode = aim_follow_path
           && !behavior <> aib_run_from
         then (
           mode := aim_still;
           hide_index := -1;
           path_length := 0);
         Effect.perform (Ai_multi_send_robot_position (-1)))
     | m when m = aim_behind ->
       let ok = Effect.perform (Ai_multiplayer_awareness 71) in
       if not ok
       then (
         if
           maybe_ai_do_actual_firing_stuff
             ~game_mode
             ~goal_state:!goal_state
             ~obj_id
             ~current_state:!current_state
         then (
           compute_vis ();
           do_actual_firing ());
         raise Early_return)
       else (
         compute_vis ();
         unpack_path_state (Effect.perform
           (Ai_follow_path (!player_visibility, !previous_visibility, 0, 0, 0)));
         if !goal_state <> ais_flin
         then goal_state := ais_lock
         else if !current_state = ais_flin
         then goal_state := ais_lock;
         Effect.perform (Ai_multi_send_robot_position (-1)))
     | m when m = aim_still ->
       if
         !dist_to_player < (f1_0 * 120) + (difficulty_level * f1_0 * 20)
         || !player_awareness_type >= pa_weapon_robot_collision - 1
       then (
         compute_vis ();
         if
           !player_visibility = 2
           || !previous_visibility = 2
         then (
           let ok = Effect.perform (Ai_multiplayer_awareness 71) in
           if not ok
           then maybe_fire_mp_and_return ()
           else
             (* ai_turn_towards_vector on C side *)
             Effect.perform (Ai_multi_send_robot_position (-1)));
         do_firing_stuff ();
         if !player_visibility = 2
         then
           if attack_type = 1
           then (
             behavior := aib_normal;
             let ok = Effect.perform (Ai_multiplayer_awareness 80) in
             if not ok
             then maybe_fire_mp_and_return ()
             else if
               (* ai_move_relative_to_player on C side *)
               !ai_evaded <> 0
             then (
               Effect.perform (Ai_multi_send_robot_position 1);
               ai_evaded := 0)
             else Effect.perform (Ai_multi_send_robot_position (-1)))
           else (
             let ok = Effect.perform (Ai_multiplayer_awareness 81) in
             if not ok
             then maybe_fire_mp_and_return ()
             else if
               (* ai_move_relative_to_player on C side *)
               !ai_evaded <> 0
             then (
               Effect.perform (Ai_multi_send_robot_position (-1));
               ai_evaded := 0)
             else Effect.perform (Ai_multi_send_robot_position (-1)))
         else if
           obj_segnum <> !hide_segment
           && !dist_to_player > f1_0 * 80
           && game_mode land gm_multi = 0
         then
           if !behavior = aib_station
           then (
             goal_segment := !hide_segment;
             unpack_path_state (Effect.perform (Create_path_to_station 15))))
     | m when m = aim_open_door ->
       let ok = Effect.perform (Ai_multiplayer_awareness 62) in
       if not ok then raise Early_return;
       if ok
       then
         (* compute_center_point_on_side, turn towards, move towards on C side *)
         Effect.perform (Ai_multi_send_robot_position (-1))
     | _ -> mode := aim_chase_object);
    (* Phase: final visibility *)
    compute_vis ();
    if !player_visibility = 2
    then if !player_awareness_type = 0 then player_awareness_type := pa_player_collision;
    (* Phase: non-animating state sync *)
    if !object_animates = 0 then current_state := !goal_state;
    (* Phase: state transition *)
    if !player_awareness_type > 0
    then (
      let awareness_idx = !player_awareness_type - 1 in
      let cur_idx = !current_state in
      let goal_idx = !goal_state in
      if
        awareness_idx >= 0
        && awareness_idx < 4
        && cur_idx >= 0
        && cur_idx < 8
        && goal_idx >= 0
        && goal_idx < 8
      then (
        let new_gs = ai_transition_table.(awareness_idx).(cur_idx).(goal_idx) in
        let new_gs = if new_gs = ais_err_ then ais_rest else new_gs in
        if !current_state = ais_none then current_state := ais_rest;
        goal_state := new_gs);
      if !player_awareness_type = pa_weapon_robot_collision
      then (
        player_awareness_type := !player_awareness_type - 1;
        player_awareness_time := f1_0 * 3));
    (* Phase: fire state propagation *)
    if !goal_state = ais_fire
    then
      for i = 0 to n_guns - 1 do
        goal_state_arr.(i) <- ais_fire
      done;
    (* Phase: bash to fire *)
    if !next_fire < 0 && !goal_state = ais_fire then current_state := ais_fire;
    (* Phase: state machine *)
    if !goal_state <> ais_flin && obj_id <> robot_brain
    then (
      match !current_state with
      | s when s = ais_none ->
        compute_vis ();
        let vtpx, vtpy, vtpz = !vec_to_player in
        let dot =
          Ox_math.vm_vec_dotprod
            ~a:(orient.(6), orient.(7), orient.(8))
            ~b:(vtpx, vtpy, vtpz)
        in
        if dot >= f1_0 / 2 then if !goal_state = ais_rest then goal_state := ais_srch
      | s when s = ais_rest ->
        if !goal_state = ais_rest
        then (
          compute_vis ();
          if !next_fire <= 0 && !player_visibility > 0 then goal_state := ais_fire)
      | s when s = ais_srch ->
        let ok = Effect.perform (Ai_multiplayer_awareness 60) in
        if not ok
        then raise Early_return
        else (
          compute_vis ();
          if !player_visibility > 0
          then
            Effect.perform (Ai_multi_send_robot_position (-1))
            (* ai_turn_towards_vector / ai_turn_randomly on C side *))
      | s when s = ais_lock ->
        compute_vis ();
        if game_mode land gm_multi = 0 || !player_visibility > 0
        then (
          let ok = Effect.perform (Ai_multiplayer_awareness 68) in
          if not ok
          then raise Early_return
          else if !player_visibility > 0
          then Effect.perform (Ai_multi_send_robot_position (-1)))
      | s when s = ais_fire ->
        compute_vis ();
        if !player_visibility > 0
        then (
          let ok = Effect.perform (Ai_multiplayer_awareness (robot_fire_agitation - 1)) in
          if not ok
          then (
            if game_mode land gm_multi <> 0
            then (
              do_actual_firing ();
              raise Early_return))
          else Effect.perform (Ai_multi_send_robot_position (-1)));
        do_actual_firing ()
      | s when s = ais_reco ->
        if obj_ref land 3 = 0
        then (
          compute_vis ();
          if !player_visibility > 0
          then (
            let ok = Effect.perform (Ai_multiplayer_awareness 69) in
            if not ok
            then raise Early_return
            else Effect.perform (Ai_multi_send_robot_position (-1))))
      | s when s = ais_flin -> ()
      | _ ->
        goal_state := ais_rest;
        current_state := ais_rest);
    (* Phase: gun rotation on lost sight *)
    if !player_visibility = 0
    then (
      current_gun := !current_gun + 1;
      if !current_gun >= n_guns then current_gun := 0)
    with Early_return -> ());
    pack_result ())
;;

(* -- do_ai_frame D2 ------------------------------------------------------- *)
(* D2 is significantly larger. For now, follow the same structure with D2 additions. *)

let do_ai_frame_d2
      ~(ai_state : int array)
      ~(rinfo : int array)
      ~frame_time
      ~frame_count
      ~game_time
      ~game_mode
      ~difficulty_level
      ~overall_agitation
      ~player_is_dead
      ~player_exploded
      ~player_flags
      ~obj_x
      ~obj_y
      ~obj_z
      ~obj_segnum
      ~obj_size
      ~obj_id
      ~objnum
      ~console_x
      ~console_y
      ~console_z
      ~console_size
      ~believed_x
      ~believed_y
      ~believed_z
      ~believed_seg
      ~(orient : int array)
      ~(gun_point_in : int array)
      ~seg_special
      ~(cloak_last_pos : int array)
      ~cloak_last_time
      ~ai_evaded_in
      ~animation_enabled
      ~current_level_num
      ~last_missile_camera
      ~robots_kill_robots_cheat
      ~boss_dying_start_time
      ~phys_flags_in
      ~(rotthrust_in : int array)
      ~dist_to_last_fired_upon
      ~fire_at_nearby_threshold
      ~seg_station_enabled
      ~console_segnum
  =
  (* Unpack AI state into refs *)
  let skip_ai_count = ref ai_state.(idx_skip_ai_count) in
  let goal_state = ref ai_state.(idx_goal_state) in
  let current_state = ref ai_state.(idx_current_state) in
  let cloaked = ref ai_state.(idx_cloaked) in
  let current_gun = ref ai_state.(idx_current_gun) in
  let cur_path_index = ref ai_state.(idx_cur_path_index) in
  let behavior = ref ai_state.(idx_behavior) in
  let hide_index = ref ai_state.(idx_hide_index) in
  let path_length = ref ai_state.(idx_path_length) in
  let sub_flags = ref ai_state.(idx_sub_flags) in
  let goalside = ref ai_state.(idx_goalside) in
  let hide_segment = ref ai_state.(idx_hide_segment) in
  let next_fire = ref ai_state.(idx_next_fire) in
  let next_fire2 = ref ai_state.(idx_next_fire2) in
  let player_awareness_type = ref ai_state.(idx_player_awareness_type) in
  let player_awareness_time = ref ai_state.(idx_player_awareness_time) in
  let mode = ref ai_state.(idx_mode) in
  let time_since_processed = ref ai_state.(idx_time_since_processed) in
  let consecutive_retries = ref ai_state.(idx_consecutive_retries) in
  let retry_count = ref ai_state.(idx_retry_count) in
  let goal_state_arr = Array.init 8 ~f:(fun i -> ai_state.(idx_goal_state_arr + i)) in
  let time_player_seen = ref ai_state.(idx_time_player_seen) in
  let goal_segment = ref ai_state.(idx_goal_segment) in
  let _rapidfire_count = ai_state.(idx_rapidfire_count) in
  let achieved_state = Array.init 8 ~f:(fun i -> ai_state.(idx_achieved_state + i)) in
  let previous_visibility = ref ai_state.(idx_previous_visibility) in
  let next_action_time = ref ai_state.(idx_next_action_time) in
  let phys_flags = ref phys_flags_in in
  let rotthrust = Array.copy rotthrust_in in
  (* Unpack robot info *)
  let attack_type = rinfo.(ri_attack_type) in
  let weapon_type = rinfo.(ri_weapon_type) in
  let weapon_type2 = rinfo.(ri_weapon_type2) in
  let n_guns = rinfo.(ri_n_guns) in
  let boss_flag = rinfo.(ri_boss_flag) in
  let companion = rinfo.(ri_companion) in
  let thief = rinfo.(ri_thief) in
  let _kamikaze = rinfo.(ri_kamikaze) in
  let homing_flag = rinfo.(ri_homing_flag) in
  let homing_flag2 = rinfo.(ri_homing_flag2) in
  let cloak_type = rinfo.(ri_cloak_type) in
  let circle_distance_diff = rinfo.(ri_circle_distance + difficulty_level) in
  let turn_time_diff = rinfo.(ri_turn_time + difficulty_level) in
  let pursuit = rinfo.(ri_pursuit) in
  ignore (weapon_type, turn_time_diff, current_level_num);
  ignore (last_missile_camera, robots_kill_robots_cheat, boss_dying_start_time);
  ignore (believed_seg, cloak_last_time);
  (* Mutable locals *)
  let player_visibility = ref (-1) in
  (* animation_enabled carries the pre-computed object_animates from the bridge's
     pre-animation phase (actual do_silly_animation result), so we use it directly
     instead of the simplified dist<100 approximation *)
  let object_animates = ref animation_enabled in
  let visibility_and_vec_computed = ref 0 in
  let vec_to_player = ref (0, 0, 0) in
  let dist_to_player = ref 0 in
  let gun_point = ref (gun_point_in.(0), gun_point_in.(1), gun_point_in.(2)) in
  let vis_vec_pos = ref (obj_x, obj_y, obj_z) in
  let ai_evaded = ref ai_evaded_in in
  let believed_player_pos = ref (believed_x, believed_y, believed_z) in
  let obj_ref = objnum lxor frame_count in
  let early_return_flag = ref 0 in
  let mode_case_vis = ref (-1) in
  (* Helper: compute visibility *)
  let compute_vis () =
    if !visibility_and_vec_computed = 0
    then (
      let vpx, vpy, vpz = !vis_vec_pos in
      let pv, vtx, vty, vtz, _snd =
        Effect.perform (Compute_vis_and_vec (vpx, vpy, vpz))
      in
      player_visibility := pv;
      vec_to_player := vtx, vty, vtz;
      (* C's compute_vis_and_vec updates ailp->previous_visibility = player_visibility.
         Mirror that here so the time-slice check uses the current frame's value. *)
      previous_visibility := pv;
      visibility_and_vec_computed := 1)
  in
  (* Helper: unpack path state returned by path effects.
     Array: [0]hide_index [1]path_length [2]cur_path_index [3]path_dir
            [4]mode [5]goal_segment [6]time_player_seen [7]player_awareness_type
            [8]behavior [9]hide_segment *)
  let unpack_path_state ps =
    hide_index := ps.(0);
    path_length := ps.(1);
    cur_path_index := ps.(2);
    (* ps.(3) = path_dir: not tracked as ref in OCaml, ignored *)
    mode := ps.(4);
    goal_segment := ps.(5);
    time_player_seen := ps.(6);
    player_awareness_type := ps.(7);
    behavior := ps.(8);
    hide_segment := ps.(9);
    skip_ai_count := ps.(10)
    (* ps.(11) = next_action_time: NOT read back because C's do_snipe_frame/do_thief_frame
       operate on stale next_action_time (OCaml decremented it but didn't write to C).
       OCaml manages next_action_time directly (decrement + snipe_attack reset). *)
  in
  (* Helper: pack result *)
  let pack_result () =
    let r = Array.create ~len:(ai_state_size + 7) 0 in
    r.(idx_skip_ai_count) <- !skip_ai_count;
    r.(idx_goal_state) <- !goal_state;
    r.(idx_current_state) <- !current_state;
    r.(idx_cloaked) <- !cloaked;
    r.(idx_current_gun) <- !current_gun;
    r.(idx_cur_path_index) <- !cur_path_index;
    r.(idx_behavior) <- !behavior;
    r.(idx_hide_index) <- !hide_index;
    r.(idx_path_length) <- !path_length;
    r.(idx_sub_flags) <- !sub_flags;
    r.(idx_goalside) <- !goalside;
    r.(idx_hide_segment) <- !hide_segment;
    r.(idx_next_fire) <- !next_fire;
    r.(idx_next_fire2) <- !next_fire2;
    r.(idx_player_awareness_type) <- !player_awareness_type;
    r.(idx_player_awareness_time) <- !player_awareness_time;
    r.(idx_mode) <- !mode;
    r.(idx_time_since_processed) <- !time_since_processed;
    r.(idx_consecutive_retries) <- !consecutive_retries;
    r.(idx_retry_count) <- !retry_count;
    for i = 0 to 7 do
      r.(idx_goal_state_arr + i) <- goal_state_arr.(i)
    done;
    r.(idx_time_player_seen) <- !time_player_seen;
    r.(idx_goal_segment) <- !goal_segment;
    r.(idx_rapidfire_count) <- _rapidfire_count;
    for i = 0 to 7 do
      r.(idx_achieved_state + i) <- achieved_state.(i)
    done;
    r.(idx_previous_visibility) <- !previous_visibility;
    r.(idx_next_action_time) <- !next_action_time;
    (* Extra D2 fields at end *)
    r.(ai_state_size) <- !phys_flags;
    r.(ai_state_size + 1) <- rotthrust.(0);
    r.(ai_state_size + 2) <- rotthrust.(1);
    r.(ai_state_size + 3) <- rotthrust.(2);
    r.(ai_state_size + 4) <- !object_animates;
    r.(ai_state_size + 5) <- !early_return_flag;
    r.(ai_state_size + 6) <- !mode_case_vis;
    r
  in
  (* Helper: fire actual D2 *)
  let do_actual_firing () =
    let vtpx, vtpy, vtpz = !vec_to_player in
    let gpx, gpy, gpz = !gun_point in
    let result =
      ai_do_actual_firing_stuff_d2
        ~goal_state:!goal_state
        ~goal_state_arr
        ~current_gun:!current_gun
        ~mode:!mode
        ~behavior:!behavior
        ~next_fire:!next_fire
        ~next_fire2:!next_fire2
        ~achieved_state
        ~player_visibility:!player_visibility
        ~object_animates:!object_animates
        ~attack_type
        ~n_guns
        ~weapon_type2
        ~homing_flag
        ~homing_flag2
        ~boss_flag
        ~player_exploded
        ~dist_to_player:!dist_to_player
        ~obj_size
        ~console_size
        ~fvec_x:orient.(6)
        ~fvec_y:orient.(7)
        ~fvec_z:orient.(8)
        ~vtpx
        ~vtpy
        ~vtpz
        ~gpx
        ~gpy
        ~gpz
        ~gun_num:!current_gun
        ~dist_to_last_fired_upon
        ~fire_at_nearby_threshold
        ~difficulty_level
        ~frame_time
        ~believed_px:(let bx, _, _ = !believed_player_pos in bx)
        ~believed_py:(let _, by, _ = !believed_player_pos in by)
        ~believed_pz:(let _, _, bz = !believed_player_pos in bz)
    in
    goal_state := result.(0);
    for i = 0 to 7 do
      goal_state_arr.(i) <- result.(1 + i)
    done;
    current_gun := result.(9);
    mode := result.(10);
    (* Read back fire timers updated by set_next_fire_time in C *)
    next_fire := result.(12);
    next_fire2 := result.(13)
  in
  let maybe_fire_mp () =
    if
      maybe_ai_do_actual_firing_stuff
        ~game_mode
        ~goal_state:!goal_state
        ~obj_id
        ~current_state:!current_state
    then do_actual_firing ()
  in
  (* Helper: do_firing_stuff — upgrade GOAL_STATE based on visibility+facing (D2) *)
  let do_firing_stuff () =
    let is_d2_nearby = dist_to_last_fired_upon < fire_at_nearby_threshold in
    if is_d2_nearby || !player_visibility >= 1
    then (
      let fvec = orient.(6), orient.(7), orient.(8) in
      let dot = Ox_math.vm_vec_dotprod ~a:fvec ~b:!vec_to_player in
      if dot >= 7 * f1_0 / 8
         || player_flags land player_flags_cloaked <> 0
      then (
        match !goal_state with
        | gs when gs = ais_none || gs = ais_rest || gs = ais_srch || gs = ais_lock ->
          goal_state := ais_fire;
          if !player_awareness_type <= pa_nearby_robot_fired
          then (
            player_awareness_type := pa_nearby_robot_fired;
            player_awareness_time := 3 * f1_0)
        | _ -> ())
      else if dot >= f1_0 / 2
      then (
        match !goal_state with
        | gs when gs = ais_none || gs = ais_rest || gs = ais_srch ->
          goal_state := ais_lock
        | _ -> ()))
  in
  (* -- Phase 1: next_action_time decrement -------------------------------- *)
  next_action_time := !next_action_time - frame_time;
  (* Phase: skip count with D2 rotthrust decay *)
  if !skip_ai_count > 0
  then (
    skip_ai_count := !skip_ai_count - 1;
    if !phys_flags land pf_uses_thrust <> 0
    then (
      rotthrust.(0) <- rotthrust.(0) * 15 / 16;
      rotthrust.(1) <- rotthrust.(1) * 15 / 16;
      rotthrust.(2) <- rotthrust.(2) * 15 / 16;
      if !skip_ai_count = 0 then phys_flags := !phys_flags land lnot pf_uses_thrust);
    pack_result ())
  else (
    (* Phase: dying frame check (D2) *)
    let dying = Effect.perform Do_any_robot_dying_frame in
    if dying
    then pack_result ()
    else (
      let exception Early_return in
      (try
      if objnum = 28 && game_time > 274000 && game_time < 278000 then (
        Printf.eprintf "OX28_D2_ENTRY gt=%d pat=%d mode=%d\n"
          game_time !player_awareness_type !mode;
        flush stderr);
      (* Phase: unflinch (D2 uses ready_to_fire) *)
      if
        !goal_state = ais_flin
        && (!next_fire <= 0 || (!next_fire2 <= 0 && weapon_type2 <> -1))
      then goal_state := ais_fire;
      (* Phase: behavior validation *)
      if not (!behavior >= min_behavior && !behavior <= max_behavior_d2)
      then behavior := aib_normal;
      (* Phase: timer decrements *)
      if !next_fire > -(f1_0 * 8) then next_fire := !next_fire - frame_time;
      if weapon_type2 <> -1
      then (if !next_fire2 > -(f1_0 * 8) then next_fire2 := !next_fire2 - frame_time)
      else next_fire2 := f1_0 * 8;
      if !time_since_processed < f1_0 * 256
      then time_since_processed := !time_since_processed + frame_time;
      previous_visibility := ai_state.(idx_previous_visibility);
      (* Phase: cloaking *)
      if cloak_type = ri_cloaked_except_firing
      then if !next_fire < f1_0 / 2 then cloaked := 1 else cloaked := 0;
      (* Phase: believed player pos + camera awareness *)
      if player_flags land player_flags_cloaked = 0
      then believed_player_pos := console_x, console_y, console_z
      else
        believed_player_pos := cloak_last_pos.(0), cloak_last_pos.(1), cloak_last_pos.(2);
      let bpx, bpy, bpz = !believed_player_pos in
      dist_to_player
      := Ox_math.vm_vec_dist_quick ~a:(bpx, bpy, bpz) ~b:(obj_x, obj_y, obj_z);
      (* Phase: gun point computation *)
      (* D2: gate on previous_visibility or obj_ref timing, and use ready_to_fire
         which checks both next_fire and next_fire2 (for dual-weapon robots).
         When next_fire > 0 but next_fire2 <= 0, calc gun point for gun 0. *)
      let ready_to_fire =
        !next_fire <= 0 || (weapon_type2 <> -1 && !next_fire2 <= 0)
      in
      if (!previous_visibility <> 0 || obj_ref land 3 = 0)
         && ready_to_fire
         && !dist_to_player < f1_0 * 200
         && n_guns > 0
         && attack_type = 0
      then (
          (* Always use pre-animation gun_point passed from C. The bridge selects
           the correct gun before calling us: CURRENT_GUN if next_fire <= 0
           (primary ready), else gun 0 (secondary ready). This matches C-only lines
           937-940 where gun selection depends on which weapon is ready to fire. *)
        let gpx, gpy, gpz =
          gun_point_in.(0), gun_point_in.(1), gun_point_in.(2)
        in
        gun_point := gpx, gpy, gpz;
        vis_vec_pos := gpx, gpy, gpz)
      else (
        vis_vec_pos := obj_x, obj_y, obj_z;
        gun_point := 0, 0, 0);
      (* Phase: agitation path creation *)
      if
        !behavior <> aib_run_from
        && !behavior <> aib_still
        && !behavior <> aib_snipe
        && companion = 0
        && thief = 0
        && game_mode land gm_multi = 0
      then
        if overall_agitation > 70
        then
          if !dist_to_player < f1_0 * 200
          then (
            let pr = Effect.perform P_Rand in
            if pr < frame_time / 4
            then (
              let pr2 = Effect.perform P_Rand in
              if pr2 * (overall_agitation - 40) > f1_0 * 5
              then (
                unpack_path_state (Effect.perform
                  (Create_path_to_player
                     (4 + (overall_agitation / 8) + difficulty_level, 1)));
                early_return_flag := 1;
                raise Early_return)));
      (* Phase: retry count *)
      if !retry_count > 0 && game_mode land gm_multi = 0
      then (
        consecutive_retries := !consecutive_retries + !retry_count;
        retry_count := 0;
        if !consecutive_retries > 3
        then (
          (match !mode with
           | m when m = aim_goto_player ->
             Effect.perform Move_towards_segment_center;
             unpack_path_state (Effect.perform (Create_path_to_player (100, 1)))
           | m when m = aim_goto_object ->
             Effect.perform Invalidate_escort_goal
           | m when m = aim_chase_object ->
             unpack_path_state (Effect.perform
               (Create_path_to_player (4 + (overall_agitation / 8) + difficulty_level, 1)))
           | m when m = aim_still ->
             if not (!behavior = aib_still || !behavior = aib_station || !behavior = aib_follow)
             then unpack_path_state (Effect.perform Attempt_to_resume_path)
           | m when m = aim_follow_path ->
             if game_mode land gm_multi <> 0
             then mode := aim_still
             else unpack_path_state (Effect.perform Attempt_to_resume_path)
           | m when m = aim_run_from_object ->
             Effect.perform Move_towards_segment_center;
             unpack_path_state (Effect.perform (Create_n_segment_path (5, -1)));
             mode := aim_run_from_object
           | m when m = aim_behind ->
             Effect.perform Move_towards_segment_center
           | m when m = aim_open_door ->
             unpack_path_state (Effect.perform (Create_n_segment_path_to_door (5, -1)))
           | _ -> ());
          consecutive_retries := 0))
      else consecutive_retries := !consecutive_retries / 2;
      (* Phase: robotmaker exit — C-only line 1066-1071: if in robotmaker segment
         AND station is enabled, follow path to exit (vis=1, prev=1) and return. *)
      if game_mode land gm_multi = 0 && seg_special = segment_is_robotmaker
         && seg_station_enabled <> 0
      then (
        if objnum = 28 && game_time > 270000 && game_time < 280000 then (
          Printf.eprintf "OX28_ROBOTMAKER_EXIT gt=%d\n" game_time; flush stderr);
        unpack_path_state (Effect.perform (Ai_follow_path (1, 1, 0, 0, 0)));
        raise Early_return);
      (* Phase: awareness decay *)
      if !player_awareness_type > 0
      then
        if !player_awareness_time > 0
        then (
          player_awareness_time := !player_awareness_time - frame_time;
          if !player_awareness_time <= 0
          then (
            player_awareness_time := f1_0 * 2;
            player_awareness_type := !player_awareness_type - 1))
        else (
          player_awareness_type := !player_awareness_type - 1;
          player_awareness_time := f1_0 * 2)
      else goal_state := ais_rest;
      (* Phase: dead player *)
      if player_is_dead <> 0 && !player_awareness_type = 0
      then
        if !dist_to_player < f1_0 * 200
        then (
          let pr = Effect.perform P_Rand in
          if pr < frame_time / 8
          then
            if !behavior <> aib_still && !behavior <> aib_run_from
            then (
              let ok = Effect.perform (Ai_multiplayer_awareness 30) in
              if ok
              then (
                Effect.perform (Ai_multi_send_robot_position (-1));
                if not (!mode = aim_follow_path && !cur_path_index < !path_length - 1)
                then
                  if !behavior <> aib_snipe && !behavior <> aib_run_from
                  then
                    if !dist_to_player < f1_0 * 30
                    then unpack_path_state (Effect.perform (Create_n_segment_path (5, 1)))
                    else unpack_path_state (Effect.perform (Create_path_to_player (20, 1))))));
      (* Phase: collision awareness + visibility agitation *)
      if objnum = 28 && game_time > 270000 && game_time < 280000 then (
        Printf.eprintf "OX28_VISAGIT pat=%d prev_vis=%d obj_ref=%d dist=%d gt=%d\n"
          !player_awareness_type !previous_visibility obj_ref !dist_to_player game_time;
        flush stderr);
      if
        !player_awareness_type = pa_weapon_robot_collision
        || !player_awareness_type >= pa_player_collision
      then (
        compute_vis ();
        if !player_visibility = 1 then player_visibility := 2)
      else if
        obj_ref land 3 = 0
        && !previous_visibility = 0
        && !dist_to_player < f1_0 * 100
      then (
        let rval = Effect.perform P_Rand in
        let sval = !dist_to_player * (difficulty_level + 1) / 64 in
        if objnum = 28 && game_time > 270000 && game_time < 280000 then (
          Printf.eprintf "OX28_RAND rval=%d sval=%d fm=%d dist=%d prev=%d result=%d headlight=%d gt=%d\n"
            rval sval frame_time !dist_to_player !previous_visibility
            (Ox_math.fixmul ~a:rval ~b:sval) (player_flags land player_flags_headlight_on) game_time;
          flush stderr);
        if Ox_math.fixmul ~a:rval ~b:sval < frame_time
           || player_flags land player_flags_headlight_on <> 0
        then (
          player_awareness_type := pa_player_collision;
          player_awareness_time := f1_0 * 3;
          compute_vis ();
          if !player_visibility = 1 then player_visibility := 2));
      (* Phase: flinch→lock *)
      if !goal_state = ais_flin && !current_state = ais_flin then goal_state := ais_lock;
      (* Phase: animation — skipped in bridge path.
         The bridge pre-animation already called do_silly_animation and set
         object_animates + CS=GS for the far-away case. The packed ai_state
         already has the correct CURRENT_STATE, and animation_enabled carries
         the real object_animates value. Nothing to do here. *)
      (* Phase: boss handling *)
      if boss_flag <> 0
      then (
        if !goal_state = ais_flin then goal_state := ais_fire;
        if !current_state = ais_flin then current_state := ais_fire;
        dist_to_player := !dist_to_player / 4;
        Effect.perform (Do_boss_stuff !player_visibility);
        dist_to_player := !dist_to_player * 4);
      (* Phase: time slicing *)
      if not (!behavior = aib_snipe && !mode <> aim_snipe_wait)
         && companion = 0 && thief = 0
         && !player_awareness_type < pa_weapon_robot_collision - 1
      then
        if !behavior = aib_station && !mode = aim_follow_path
           && !hide_segment <> obj_segnum
        then (if !dist_to_player > f1_0 * 250 then (early_return_flag := 1; raise Early_return))
        else if !previous_visibility = 0
                && !dist_to_player asr 7 > !time_since_processed
        then (early_return_flag := 1; raise Early_return);
      time_since_processed := -(((objnum land 0x03) * frame_time) / 2);
      (* Phase: brain robot (D2) *)
      if obj_id = robot_brain
      then
        if console_segnum = obj_segnum
        then (
          let ok = Effect.perform (Ai_multiplayer_awareness 97) in
          if not ok then raise Early_return;
          compute_vis ();
          Effect.perform Move_away_from_player;
          Effect.perform (Ai_multi_send_robot_position (-1)))
        else if !mode <> aim_still
        then (
          let r = Effect.perform Openable_doors_in_segment in
          if r <> -1
          then (
            mode := aim_open_door;
            goalside := r)
          else if !mode <> aim_follow_path
          then (
            let ok = Effect.perform (Ai_multiplayer_awareness 50) in
            if not ok then raise Early_return;
            unpack_path_state (Effect.perform (Create_n_segment_path_to_door (8 + difficulty_level, -1)));
            Effect.perform (Ai_multi_send_robot_position (-1)));
          if !next_action_time < 0
          then (
            compute_vis ();
            if !player_visibility > 0
            then (
              Effect.perform Make_nearby_robot_snipe;
              next_action_time := (ndl - difficulty_level) * 2 * f1_0)))
        else (
          compute_vis ();
          if !player_visibility > 0
          then (
            let ok = Effect.perform (Ai_multiplayer_awareness 50) in
            if not ok then raise Early_return;
            unpack_path_state (Effect.perform (Create_n_segment_path_to_door (8 + difficulty_level, -1)));
            Effect.perform (Ai_multi_send_robot_position (-1))));
      (* Phase: D2 specials: snipe, escort, thief *)
      if !behavior = aib_snipe
      then (
        if obj_ref land 3 = 0 || !previous_visibility <> 0
        then (
          compute_vis ();
          (* If sniper is in still mode, switch to snipe mode if visible or hit *)
          if !mode = aim_still then
            (if !player_visibility <> 0
                || !player_awareness_type = pa_weapon_robot_collision
             then mode := aim_snipe_attack);
          if thief = 0 && !mode <> aim_still then (
            (* Ported do_snipe_frame: handle snipe mode transitions and timing *)
            if !dist_to_player <= f1_0 * 500 then (
              let vtpx, vtpy, vtpz = !vec_to_player in
              (match !mode with
               | m when m = aim_snipe_wait ->
                 if not (!dist_to_player > f1_0 * 50 && !next_action_time > 0) then (
                   next_action_time := snipe_wait_time;
                   (* NOTE: find_connected_distance not available as effect;
                      always attempt path creation. Divergence expected until
                      find_connected_distance is available in ai_frame context. *)
                   unpack_path_state (Effect.perform (Create_path_to_player (30, 1)));
                   mode := aim_snipe_attack;
                   next_action_time := snipe_attack_time)
               | m when m = aim_snipe_retreat || m = aim_snipe_retreat_backwards ->
                 if !next_action_time < 0 then (
                   mode := aim_snipe_wait;
                   next_action_time := snipe_wait_time)
                 else if !player_visibility = 0 || !next_action_time > snipe_abort_retreat_time then (
                   unpack_path_state (Effect.perform
                     (Ai_follow_path (!player_visibility, !player_visibility, vtpx, vtpy, vtpz)));
                   mode := aim_snipe_retreat_backwards)
                 else (
                   mode := aim_snipe_fire;
                   next_action_time := snipe_fire_time / 2)
               | m when m = aim_snipe_attack ->
                 if !next_action_time < 0 then (
                   mode := aim_snipe_retreat;
                   next_action_time := snipe_wait_time)
                 else (
                   unpack_path_state (Effect.perform
                     (Ai_follow_path (!player_visibility, !player_visibility, vtpx, vtpy, vtpz)));
                   if !player_visibility <> 0 then (
                     mode := aim_snipe_fire;
                     next_action_time := snipe_fire_time)
                   else
                     mode := aim_snipe_attack)
               | m when m = aim_snipe_fire ->
                 if !next_action_time < 0 then (
                   let pr = Effect.perform P_Rand in
                   unpack_path_state (Effect.perform
                     (Create_n_segment_path (10 + pr / 2048, console_segnum)));
                   (* NOTE: polish_path not available as effect; path used unpolished.
                      Divergence expected until polish_path is ported. *)
                   let pr2 = Effect.perform P_Rand in
                   if pr2 < 8192
                   then mode := aim_snipe_retreat_backwards
                   else mode := aim_snipe_retreat;
                   next_action_time := snipe_retreat_time)
               | _ ->
                 mode := aim_snipe_attack;
                 next_action_time := f1_0))))
        else if thief = 0 && companion = 0
        then (early_return_flag := 1; raise Early_return))
      else if companion <> 0
      then (
        compute_vis ();
        unpack_path_state (Effect.perform (Do_escort_frame (!dist_to_player, !player_visibility)));
        (* Companion extras: danger laser evasion + flare firing (C lines 1433-1466) *)
        let vtpx, vtpy, vtpz = !vec_to_player in
        let new_nf = Effect.perform
          (Do_companion_extras (!dist_to_player, !player_visibility, vtpx, vtpy, vtpz, !mode, !next_fire, !next_fire2)) in
        next_fire := new_nf);
      (* Thief section: runs independently of snipe (thief has AIB_SNIPE behavior) *)
      if thief <> 0
      then (
        compute_vis ();
        let vtpx, vtpy, vtpz = !vec_to_player in
        unpack_path_state (Effect.perform
          (Do_thief_frame (!dist_to_player, !player_visibility, vtpx, vtpy, vtpz,
                           !player_awareness_type, !player_awareness_time)));
        (* Thief extras: flare firing (C lines 1478-1494) *)
        let new_nf = Effect.perform
          (Do_thief_extras (!dist_to_player, !player_visibility, vtpx, vtpy, vtpz, !next_fire, !next_fire2)) in
        next_fire := new_nf);
      (* Phase: mode dispatch (D2) *)
      (match !mode with
       | m when m = aim_chase_object ->
         let circle_distance = circle_distance_diff + console_size in
         let circle_distance =
           if attack_type <> 1
           then circle_distance + (objnum land 0xf * f1_0 / 2)
           else circle_distance
         in
         compute_vis ();
         let chase_break = ref false in
         if !player_visibility < 2 && !previous_visibility = 2
         then (
           let ok = Effect.perform (Ai_multiplayer_awareness 53) in
           if not ok
           then maybe_fire_mp ()
           else (
             unpack_path_state (Effect.perform (Create_path_to_player (8, 1)));
             Effect.perform (Ai_multi_send_robot_position (-1))))
         else if
           !player_visibility = 0
           && !dist_to_player > f1_0 * 80
           && game_mode land gm_multi = 0
         then (
           if !behavior = aib_station
           then (
             goal_segment := !hide_segment;
             unpack_path_state (Effect.perform (Create_path_to_station 15)));
           (* C break: skip rest of AIM_CHASE_OBJECT case *)
           chase_break := true);
         if not !chase_break then (
           if !current_state = ais_rest && !goal_state = ais_rest
           then
             if !player_visibility > 0
             then (
               let pr = Effect.perform P_Rand in
               if pr < frame_time * !player_visibility
               then (
                 let pr2 = Effect.perform P_Rand in
                 if !dist_to_player / 256 < pr2 * !player_visibility
                 then (
                   goal_state := ais_srch;
                   current_state := ais_srch)));
           if game_time - !time_player_seen > chase_time_length
           then (
             if game_mode land gm_multi <> 0
             then
               if !player_visibility = 0 && !dist_to_player > f1_0 * 70
               then mode := aim_still;
             let ok = Effect.perform (Ai_multiplayer_awareness 64) in
             if not ok
             then maybe_fire_mp ()
             (* C has create_path_to_player commented out here *))
           else if !current_state <> ais_rest && !goal_state <> ais_rest
           then (
             let ok = Effect.perform (Ai_multiplayer_awareness 70) in
             if not ok
             then maybe_fire_mp ()
             else (
               ignore circle_distance;
               (* ai_move_relative_to_player on C side *)
               if obj_ref land 1 <> 0 && (!goal_state = ais_srch || !goal_state = ais_lock)
               then ();
               if !ai_evaded <> 0
               then (
                 Effect.perform (Ai_multi_send_robot_position 1);
                 ai_evaded := 0)
               else Effect.perform (Ai_multi_send_robot_position (-1));
               do_firing_stuff ())))
       | m when m = aim_run_from_object ->
         compute_vis ();
         if !player_visibility > 0
         then
           if !player_awareness_type = 0
           then player_awareness_type := pa_weapon_robot_collision;
         if game_mode land gm_multi = 0 || !player_visibility > 0
         then (
           let ok = Effect.perform (Ai_multiplayer_awareness 75) in
           if ok
           then (
             let vtpx, vtpy, vtpz = !vec_to_player in
             unpack_path_state (Effect.perform
               (Ai_follow_path (!player_visibility, !previous_visibility, vtpx, vtpy, vtpz)));
             Effect.perform (Ai_multi_send_robot_position (-1))));
         if !goal_state <> ais_flin
         then goal_state := ais_lock
         else if !current_state = ais_flin
         then goal_state := ais_lock;
         if !next_fire <= 0 && !player_visibility > 0
         then (
           let ok = Effect.perform (Ai_multiplayer_awareness 75) in
           if ok
           then (
             let fvx = -orient.(6) in
             let fvy = -orient.(7) in
             let fvz = -orient.(8) in
             let fpx, fpy, fpz =
               Ox_math.vm_vec_add ~a:(obj_x, obj_y, obj_z) ~b:(fvx, fvy, fvz)
             in
             Effect.perform
               (Laser_create_new_easy
                  (fvx, fvy, fvz, fpx, fpy, fpz, objnum, proximity_id_d2));
             next_fire := f1_0 * 5))
       | m when m = aim_goto_player || m = aim_goto_object ->
         (* C-only passes player_visibility=2 (hardcoded) for goto modes *)
         let vtpx, vtpy, vtpz = !vec_to_player in
         unpack_path_state (Effect.perform
           (Ai_follow_path (2, !previous_visibility, vtpx, vtpy, vtpz)))
       | m when m = aim_follow_path ->
         let anger_level = ref 65 in
         if !behavior = aib_station then anger_level := 64;
         compute_vis ();
         let ok = Effect.perform (Ai_multiplayer_awareness !anger_level) in
         if not ok
         then (
           if
             maybe_ai_do_actual_firing_stuff
               ~game_mode
               ~goal_state:!goal_state
               ~obj_id
               ~current_state:!current_state
           then (
             compute_vis ();
             do_actual_firing ()))
         else (
           let vtpx, vtpy, vtpz = !vec_to_player in
           unpack_path_state (Effect.perform
             (Ai_follow_path (!player_visibility, !previous_visibility, vtpx, vtpy, vtpz)));
           if !goal_state <> ais_flin
           then goal_state := ais_lock
           else if !current_state = ais_flin
           then goal_state := ais_lock;
           if !behavior <> aib_run_from
           then do_firing_stuff ();
           if
             !player_visibility = 2
             && !behavior <> aib_snipe
             && !behavior <> aib_follow
             && !behavior <> aib_run_from
             && obj_id <> robot_brain
             && companion = 0
             && thief = 0
           then (if attack_type = 0 then mode := aim_chase_object)
           else if
             !player_visibility = 0
             && !behavior = aib_normal
             && !mode = aim_follow_path
             && !dist_to_player > f1_0 * (20 * (2 * difficulty_level + pursuit))
             && game_time - !time_player_seen > f1_0 / 2 * (difficulty_level + pursuit)
           then (
             mode := aim_still;
             hide_index := -1;
             path_length := 0);
           Effect.perform (Ai_multi_send_robot_position (-1)))
       | m when m = aim_behind ->
         let ok = Effect.perform (Ai_multiplayer_awareness 71) in
         if not ok
         then (
           if
             maybe_ai_do_actual_firing_stuff
               ~game_mode
               ~goal_state:!goal_state
               ~obj_id
               ~current_state:!current_state
           then (
             compute_vis ();
             do_actual_firing ()))
         else (
           compute_vis ();
           (* Movement (move_towards_vector, ai_turn_towards_vector, ai_do_actual_firing_stuff)
              is handled by the bridge post-OCaml section when player_visibility=2 *)
           if !goal_state <> ais_flin
           then goal_state := ais_lock
           else if !current_state = ais_flin
           then goal_state := ais_lock;
           Effect.perform (Ai_multi_send_robot_position (-1)))
       | m when m = aim_still ->
         if
           !dist_to_player < (f1_0 * 120) + (difficulty_level * f1_0 * 20)
           || !player_awareness_type >= pa_weapon_robot_collision - 1
         then (
           compute_vis ();
           if
             !player_visibility = 2
             || !previous_visibility = 2
           then (
             let ok = Effect.perform (Ai_multiplayer_awareness 71) in
             if not ok
             then maybe_fire_mp ()
             else Effect.perform (Ai_multi_send_robot_position (-1)));
           do_firing_stuff ();
           if !player_visibility = 2
           then
             if attack_type = 1
             then (
               behavior := aib_normal;
               let ok = Effect.perform (Ai_multiplayer_awareness 80) in
               if not ok
               then maybe_fire_mp ()
               else if !ai_evaded <> 0
               then (
                 Effect.perform (Ai_multi_send_robot_position 1);
                 ai_evaded := 0)
               else Effect.perform (Ai_multi_send_robot_position (-1)))
             else (
               let ok = Effect.perform (Ai_multiplayer_awareness 81) in
               if not ok
               then maybe_fire_mp ()
               else if !ai_evaded <> 0
               then (
                 Effect.perform (Ai_multi_send_robot_position (-1));
                 ai_evaded := 0)
               else Effect.perform (Ai_multi_send_robot_position (-1)))
           else if
             obj_segnum <> !hide_segment
             && !dist_to_player > f1_0 * 80
             && game_mode land gm_multi = 0
           then
             if !behavior = aib_station
             then (
               goal_segment := !hide_segment;
               unpack_path_state (Effect.perform (Create_path_to_station 15))))
       | m when m = aim_open_door ->
         let ok = Effect.perform (Ai_multiplayer_awareness 62) in
         if ok then Effect.perform (Ai_multi_send_robot_position (-1))
       | m
         when m = aim_snipe_attack
              || m = aim_snipe_fire
              || m = aim_snipe_retreat
              || m = aim_snipe_retreat_backwards
              || m = aim_snipe_wait ->
         (* Snipe modes handled by Do_snipe_frame effect above *)
         ()
       | m when m = aim_thief_attack || m = aim_thief_retreat || m = aim_thief_wait ->
         (* Thief modes handled by Do_thief_frame effect above *)
         ()
       | _ -> mode := aim_chase_object);
      (* Save mode-case visibility before catch-all compute_vis.
         C-only's movement code runs within the mode case, using player_visibility
         as set by compute_vis_and_vec in that mode case (or -1 if not called).
         The bridge needs this value for movement dispatch, not the catch-all result. *)
      mode_case_vis := !player_visibility;
      (* Phase: final visibility *)
      compute_vis ();
      if !player_visibility = 2 && !behavior <> aib_follow && thief = 0
      then (
        if !player_awareness_type = 0 && !sub_flags land sub_flags_camera_awake <> 0
        then sub_flags := !sub_flags land lnot sub_flags_camera_awake
        else if !player_awareness_type = 0
        then player_awareness_type := pa_player_collision);
      (* Phase: non-animating state sync *)
      if !object_animates = 0 then current_state := !goal_state;
      (* Phase: state transition *)
      if !player_awareness_type > 0
      then (
        let awareness_idx = !player_awareness_type - 1 in
        let cur_idx = !current_state in
        let goal_idx = !goal_state in
        if
          awareness_idx >= 0
          && awareness_idx < 4
          && cur_idx >= 0
          && cur_idx < 8
          && goal_idx >= 0
          && goal_idx < 8
        then (
          let new_gs = ai_transition_table.(awareness_idx).(cur_idx).(goal_idx) in
          let new_gs = if new_gs = ais_err_ then ais_rest else new_gs in
          if !current_state = ais_none then current_state := ais_rest;
          goal_state := new_gs);
        if !player_awareness_type = pa_weapon_robot_collision
        then (
          player_awareness_type := !player_awareness_type - 1;
          player_awareness_time := f1_0 * 3));
      (* Phase: fire state propagation *)
      if !goal_state = ais_fire
      then
        for i = 0 to n_guns - 1 do
          goal_state_arr.(i) <- ais_fire
        done;
      (* Phase: bash to fire *)
      if !next_fire < 0 && !goal_state = ais_fire then current_state := ais_fire;
      (* Phase: state machine *)
      if !goal_state <> ais_flin && obj_id <> robot_brain
      then (
        match !current_state with
        | s when s = ais_none ->
          compute_vis ();
          let vtpx, vtpy, vtpz = !vec_to_player in
          let dot =
            Ox_math.vm_vec_dotprod
              ~a:(orient.(6), orient.(7), orient.(8))
              ~b:(vtpx, vtpy, vtpz)
          in
          if dot >= f1_0 / 2 then if !goal_state = ais_rest then goal_state := ais_srch
        | s when s = ais_rest ->
          if !goal_state = ais_rest
          then (
            compute_vis ();
            if !next_fire <= 0 && !player_visibility > 0 then goal_state := ais_fire)
        | s when s = ais_srch ->
          let ok = Effect.perform (Ai_multiplayer_awareness 60) in
          if ok
          then (
            compute_vis ();
            if !player_visibility > 0
            then Effect.perform (Ai_multi_send_robot_position (-1)))
        | s when s = ais_lock ->
          compute_vis ();
          if game_mode land gm_multi = 0 || !player_visibility > 0
          then (
            let ok = Effect.perform (Ai_multiplayer_awareness 68) in
            if ok
            then
              if !player_visibility > 0
              then Effect.perform (Ai_multi_send_robot_position (-1)))
        | s when s = ais_fire ->
          compute_vis ();
          if !player_visibility > 0
          then (
            let ok =
              Effect.perform (Ai_multiplayer_awareness (robot_fire_agitation - 1))
            in
            if not ok
            then (if game_mode land gm_multi <> 0 then do_actual_firing ())
            else Effect.perform (Ai_multi_send_robot_position (-1)));
          do_actual_firing ()
        | s when s = ais_reco ->
          if obj_ref land 3 = 0
          then (
            compute_vis ();
            if !player_visibility > 0
            then (
              let ok = Effect.perform (Ai_multiplayer_awareness 69) in
              if ok then Effect.perform (Ai_multi_send_robot_position (-1))))
        | s when s = ais_flin -> ()
        | _ ->
          goal_state := ais_rest;
          current_state := ais_rest);
      (* Phase: gun rotation on lost sight *)
      if !player_visibility = 0
      then (
        current_gun := !current_gun + 1;
        if !current_gun >= n_guns
        then
          (* D2 two-weapon-type hack: wrap to 1 for dual-weapon robots, else 0 *)
          if n_guns = 1 || weapon_type2 = -1
          then current_gun := 0
          else current_gun := 1);
      with Early_return -> ());
      pack_result ()))
;;
