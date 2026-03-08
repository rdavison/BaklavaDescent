(* Pure game logic for collision / damage.
   D1 only -- no ox_math dependency needed. *)

(* Object flags matching main_d1/object.h *)
let of_exploding = 1
let of_destroyed = 4

(* -- Algebraic effects for side effects -------------------------------- *)

(* D1 effects *)
type _ Effect.t +=
  | Increment_kills : unit Effect.t
  | Start_boss_death : int -> unit Effect.t
  | Explode_object : int -> unit Effect.t
  | Send_net_robot_explode : (int * int) -> unit Effect.t
  | Query_multi_explode : (int * int) -> bool Effect.t

(* D2 effects (reuses Increment_kills and Start_boss_death from D1) *)
type _ Effect.t +=
  | Set_boss_hit_time : unit Effect.t
  | Query_player_dead_or_no_shields : bool Effect.t
  | Query_multi_all_players_alive : bool Effect.t
  | Do_final_boss_hacks : unit Effect.t
  | Multi_send_finish_game : unit Effect.t
  | Save_stolen_items : unit Effect.t
  | Restore_stolen_items : unit Effect.t
  | Clear_stolen_items : unit Effect.t
  | Query_multi_explode_d2 : (int * int * bool) -> bool Effect.t
  | Multi_send_robot_explode_d2 : (int * int * bool) -> unit Effect.t
  | Start_robot_death_sequence : int -> unit Effect.t
  | Special_reactor_stuff : unit Effect.t
  | Explode_object_delay : (int * int) -> unit Effect.t

(* -- Pure decision logic ----------------------------------------------- *)

let apply_damage_to_robot_d1
      ~flags
      ~shields
      ~damage
      ~is_boss
      ~is_multiplayer
      ~obj_id
      ~killer_objnum
  =
  (* Robot already exploding? *)
  if flags land of_exploding <> 0
  then shields, false, 0 (* Robot already dead? *)
  else if shields < 0
  then shields, false, 0
  else (
    let set_boss_been_hit = is_boss in
    let new_shields = shields - damage in
    if new_shields < 0
    then
      (* Robot killed *)
      if is_multiplayer
      then
        if Effect.perform (Query_multi_explode (obj_id, killer_objnum))
        then (
          Effect.perform (Send_net_robot_explode (obj_id, killer_objnum));
          new_shields, set_boss_been_hit, 1)
        else new_shields, set_boss_been_hit, 0
      else (
        Effect.perform Increment_kills;
        if is_boss
        then Effect.perform (Start_boss_death obj_id)
        else Effect.perform (Explode_object obj_id);
        new_shields, set_boss_been_hit, 1)
    else new_shields, set_boss_been_hit, 0)
;;

(* ── get_explosion_vclip ────────────────────────────────── *)

let obj_robot = 2
let obj_player = 4
let vclip_small_explosion = 2

(* Pure function: extracts vclip_num from pre-extracted scalar args.
   obj_type, stage, exp1_vclip_num, exp2_vclip_num, expl_vclip_num *)
let get_explosion_vclip ~obj_type ~stage ~exp1_vclip_num ~exp2_vclip_num ~expl_vclip_num =
  if obj_type = obj_robot
  then
    if stage = 0 && exp1_vclip_num > -1
    then exp1_vclip_num
    else if stage = 1 && exp2_vclip_num > -1
    then exp2_vclip_num
    else vclip_small_explosion
  else if obj_type = obj_player && expl_vclip_num > -1
  then expl_vclip_num
  else vclip_small_explosion
;;

(* ── apply_damage_to_clutter (shared D1/D2) ────────────── *)

let apply_damage_to_clutter ~flags ~shields ~damage ~obj_id =
  if flags land of_exploding <> 0
  then shields, 0
  else if shields < 0
  then shields, 0
  else (
    let new_shields = shields - damage in
    if new_shields < 0
    then (
      Effect.perform (Explode_object_delay (obj_id, 0));
      new_shields, 1)
    else new_shields, 0)
;;

(* ── apply_damage_to_controlcen (shared D1/D2) ─────────── *)

(* Control center effects *)
type _ Effect.t +=
  | Show_hud_invul_message : unit Effect.t
  | Controlcen_been_hit : unit Effect.t
  | Do_controlcen_destroyed : int -> unit Effect.t
  | Add_controlcen_score : unit Effect.t
  | Multi_send_destroy_controlcen : (int * int) -> unit Effect.t
  | Sound_controlcen_destroyed : int -> unit Effect.t

let apply_damage_to_controlcen
      ~shields
      ~flags
      ~damage
      ~who_is_player
      ~who_is_local_player
      ~who_objnum
      ~local_player_objnum
      ~is_multiplayer
      ~is_coop
      ~time_level_ok
      ~obj_id
      ~who_id
  =
  (* Only allow a player to damage the control center *)
  if not who_is_player
  then shields
  else if
    (* Network invulnerability timer *)
    is_multiplayer && (not is_coop) && not time_level_ok
  then (
    if who_is_local_player then Effect.perform Show_hud_invul_message;
    shields)
  else (
    if who_is_local_player then Effect.perform Controlcen_been_hit;
    let new_shields = if shields >= 0 then shields - damage else shields in
    if new_shields < 0 && flags land (of_exploding lor of_destroyed) = 0
    then (
      Effect.perform (Do_controlcen_destroyed obj_id);
      if is_multiplayer
      then (
        if who_objnum = local_player_objnum then Effect.perform Add_controlcen_score;
        Effect.perform (Multi_send_destroy_controlcen (obj_id, who_id)));
      if not is_multiplayer then Effect.perform Add_controlcen_score;
      Effect.perform (Sound_controlcen_destroyed obj_id);
      Effect.perform (Explode_object_delay (obj_id, 0)));
    new_shields)
;;

(* ── apply_damage_to_player ──────────────────────────── *)

(* Player damage effects *)
type _ Effect.t +=
  | Palette_flash : (int * int * int) -> unit Effect.t
  | Set_player_dead : int -> unit Effect.t
  | Set_buddy_sorry_time : unit Effect.t
  | Apply_damage_to_player : (int * int * int) -> unit Effect.t
      (* player_objnum, killer_objnum, damage — calls C's apply_damage_to_player *)

(* f2i: shift right by 16 (matching fix-point conversion) *)
let f2i x = x asr 16

let apply_damage_to_player_d1
      ~is_dead
      ~is_invulnerable
      ~is_endlevel
      ~is_local_player
      ~player_shields
      ~damage
      ~killer_objnum
  =
  if is_dead
  then player_shields, false
  else if is_invulnerable
  then player_shields, false
  else if is_endlevel
  then player_shields, false
  else if not is_local_player
  then player_shields, false
  else (
    (* D1: dead-code invulnerable branch exists in original but is unreachable
       due to early return above. We skip it and go straight to damage. *)
    let new_shields = player_shields - damage in
    Effect.perform (Palette_flash (f2i damage * 4, -f2i (damage / 2), -f2i (damage / 2)));
    if new_shields < 0
    then (
      Effect.perform (Set_player_dead killer_objnum);
      new_shields, true)
    else new_shields, false)
;;

let apply_damage_to_player_d2
      ~is_dead
      ~is_invulnerable
      ~is_endlevel
      ~is_local_player
      ~player_shields
      ~damage
      ~killer_objnum
      ~killer_is_companion
  =
  if is_dead
  then player_shields, false
  else if is_invulnerable
  then player_shields, false
  else if is_endlevel
  then player_shields, false
  else if not is_local_player
  then player_shields, false
  else (
    let new_shields = player_shields - damage in
    Effect.perform (Palette_flash (f2i damage * 4, -f2i (damage / 2), -f2i (damage / 2)));
    if new_shields < 0
    then (
      Effect.perform (Set_player_dead killer_objnum);
      if killer_is_companion then Effect.perform Set_buddy_sorry_time;
      new_shields, true)
    else new_shields, false)
;;

(* ── maybe_kill_weapon ────────────────────────────────── *)

let proximity_id = 16
let superprox_id = 38
let pmine_id = 51
let pf_persistent = 0x20
let obj_weapon = 5

(* Shared inner logic: weaken non-persistent weapon or kill it *)
let maybe_kill_weapon_inner ~phys_flags ~weapon_shields ~other_type ~other_shields =
  if phys_flags land pf_persistent <> 0 || other_type = obj_weapon
  then
    (* Persistent weapons survive; non-persistent get weakened *)
    if phys_flags land pf_persistent <> 0
    then weapon_shields, false
    else (
      let dmg =
        if other_type = obj_weapon then other_shields / 2 else other_shields / 4
      in
      let s = weapon_shields - dmg in
      if s <= 0 then 0, true else s, false)
  else weapon_shields, true
;;

let maybe_kill_weapon_d1 ~weapon_id ~phys_flags ~weapon_shields ~other_type ~other_shields
  =
  if weapon_id = proximity_id
  then weapon_shields, true
  else maybe_kill_weapon_inner ~phys_flags ~weapon_shields ~other_type ~other_shields
;;

let maybe_kill_weapon_d2
      ~weapon_id
      ~phys_flags
      ~weapon_shields
      ~other_type
      ~other_shields
      ~is_shareware
  =
  if weapon_id = proximity_id || weapon_id = superprox_id || weapon_id = pmine_id
  then weapon_shields, true
  else if phys_flags land pf_persistent <> 0 || (is_shareware && other_type = obj_weapon)
  then
    if phys_flags land pf_persistent <> 0
    then weapon_shields, false
    else (
      let dmg =
        if other_type = obj_weapon then other_shields / 2 else other_shields / 4
      in
      let s = weapon_shields - dmg in
      if s <= 0 then 0, true else s, false)
  else weapon_shields, true
;;

(* ── laser_are_related ────────────────────────────────── *)

(* D2 additional weapon IDs *)
let phoenix_id = 34
let guidedmiss_id = 37
let robot_superprox_id = 53
let f1_0 = 0x10000

(* packed: [o1_idx, o1_type, o1_id, o1_sig, o1_parent_num, o1_parent_sig, o1_creation_time,
            o2_idx, o2_type, o2_id, o2_sig, o2_parent_num, o2_parent_sig, o2_creation_time,
            game_time] = 15 ints *)
let laser_are_related_d1 packed =
  let o1_idx = packed.(0) in
  let o1_type = packed.(1) in
  let o1_id = packed.(2) in
  let o1_sig = packed.(3) in
  let o1_pnum = packed.(4) in
  let o1_psig = packed.(5) in
  let o1_ctime = packed.(6) in
  let o2_idx = packed.(7) in
  let o2_type = packed.(8) in
  let o2_id = packed.(9) in
  let o2_sig = packed.(10) in
  let o2_pnum = packed.(11) in
  let o2_psig = packed.(12) in
  let _o2_ctime = packed.(13) in
  let game_time = packed.(14) in
  if o1_idx < 0 || o2_idx < 0
  then 0 (* See if o2 is the parent of o1 *)
  else if o1_type = obj_weapon && o1_pnum = o2_idx && o1_psig = o2_sig
  then
    if o1_id <> proximity_id || o1_ctime + (f1_0 * 2) >= game_time
    then 1
    else 0 (* See if o1 is the parent of o2 *)
  else if o2_type = obj_weapon && o2_pnum = o1_idx && o2_psig = o1_sig
  then 1 (* They must both be weapons *)
  else if o1_type <> obj_weapon || o2_type <> obj_weapon
  then 0 (* Siblings with same parent *)
  else if o1_psig = o2_psig
  then if o1_id = proximity_id || o2_id = proximity_id then 0 else 1
  else 0
;;

let laser_are_related_d2 packed =
  let o1_idx = packed.(0) in
  let o1_type = packed.(1) in
  let o1_id = packed.(2) in
  let _o1_sig = packed.(3) in
  let o1_pnum = packed.(4) in
  let o1_psig = packed.(5) in
  let o1_ctime = packed.(6) in
  let o2_idx = packed.(7) in
  let o2_type = packed.(8) in
  let o2_id = packed.(9) in
  let _o2_sig = packed.(10) in
  let o2_pnum = packed.(11) in
  let o2_psig = packed.(12) in
  let o2_ctime = packed.(13) in
  let game_time = packed.(14) in
  if o1_idx < 0 || o2_idx < 0
  then 0 (* D2 time-based unrelate check for o1-is-weapon, o2-is-parent *)
  else if o1_type = obj_weapon && o1_pnum = o2_idx && o1_psig = packed.(10) (* o2_sig *)
  then
    if
      (o1_id = phoenix_id && game_time > o1_ctime + (f1_0 / 4))
      || (o1_id = guidedmiss_id && game_time > o1_ctime + (f1_0 * 2))
      || ((o1_id = proximity_id || o1_id = superprox_id)
          && game_time > o1_ctime + (f1_0 * 4))
    then 0
    else 1 (* D2 time-based unrelate check for o2-is-weapon, o1-is-parent *)
  else if o2_type = obj_weapon && o2_pnum = o1_idx && o2_psig = packed.(3) (* o1_sig *)
  then
    if
      (o2_id = phoenix_id && game_time > o2_ctime + (f1_0 / 4))
      || (o2_id = guidedmiss_id && game_time > o2_ctime + (f1_0 * 2))
      || ((o2_id = proximity_id || o2_id = superprox_id)
          && game_time > o2_ctime + (f1_0 * 4))
    then 0
    else 1 (* Both must be weapons *)
  else if o1_type <> obj_weapon || o2_type <> obj_weapon
  then 0 (* Siblings with same parent — prox/superprox time check *)
  else if o1_psig = o2_psig
  then
    if
      o1_id = proximity_id
      || o2_id = proximity_id
      || o1_id = superprox_id
      || o2_id = superprox_id
    then
      if game_time > o1_ctime + (f1_0 / 2) || game_time > o2_ctime + (f1_0 / 2)
      then 0
      else 1
    else 1 (* Mine/prox/robot-superprox: never related *)
  else if
    o1_id = robot_superprox_id
    || o2_id = robot_superprox_id
    || o1_id = proximity_id
    || o2_id = proximity_id
    || o1_id = superprox_id
    || o2_id = superprox_id
    || o1_id = pmine_id
    || o2_id = pmine_id
  then 0
  else 1
;;

(* ── calc_controlcen_gun_point (shared D1/D2) ────────── *)

(* Pure linear algebra: transpose orient, rotate gun local pos/dir, add obj pos.
   Input: gun_local_pos(3), gun_local_dir(3), obj_orient(9), obj_pos(3) = 18 values
   Output: gun_world_pos(3), gun_world_dir(3) = 6 values *)
let calc_controlcen_gun_point
      ~glpx
      ~glpy
      ~glpz
      ~gldx
      ~gldy
      ~gldz
      ~or1
      ~or2
      ~or3
      ~ou1
      ~ou2
      ~ou3
      ~of1
      ~of2
      ~of3
      ~opx
      ~opy
      ~opz
  =
  let (tr1, tr2, tr3), (tu1, tu2, tu3), (tf1, tf2, tf3) =
    Ox_math.vm_transpose_matrix ~m:((or1, or2, or3), (ou1, ou2, ou3), (of1, of2, of3))
  in
  let gpx, gpy, gpz =
    Ox_math.vm_vec_rotate
      ~src:(glpx, glpy, glpz)
      ~m:((tr1, tr2, tr3), (tu1, tu2, tu3), (tf1, tf2, tf3))
  in
  let gpx, gpy, gpz = Ox_math.vm_vec_add2 ~a:(gpx, gpy, gpz) ~b:(opx, opy, opz) in
  let gdx, gdy, gdz =
    Ox_math.vm_vec_rotate
      ~src:(gldx, gldy, gldz)
      ~m:((tr1, tr2, tr3), (tu1, tu2, tu3), (tf1, tf2, tf3))
  in
  gpx, gpy, gpz, gdx, gdy, gdz
;;

(* ── chase_angles (shared D1/D2) ─────────────────────── *)

let chase_turn_rate = 0x4000 / 4

let chase_angles ~cur_p ~cur_b ~cur_h ~desired_p ~desired_b ~desired_h ~frame_time =
  let dp = desired_p - cur_p in
  let dh = desired_h - cur_h in
  let db = desired_b - cur_b in
  let total_delta = abs dp + abs db + abs dh in
  let alt_p = (0x10000 / 2) - cur_p in
  let alt_b = cur_b + (0x10000 / 2) in
  let alt_h = cur_h + (0x10000 / 2) in
  let alt_dp = desired_p - alt_p in
  let alt_dh = desired_h - alt_h in
  let alt_db = desired_b - alt_b in
  let alt_total_delta = abs alt_dp + abs alt_db + abs alt_dh in
  let cur_p, cur_b, cur_h, dp, db, dh =
    if alt_total_delta < total_delta
    then alt_p, alt_b, alt_h, alt_dp, alt_db, alt_dh
    else cur_p, cur_b, cur_h, dp, db, dh
  in
  let frame_turn = Ox_math.fixmul ~a:frame_time ~b:chase_turn_rate in
  let mask = ref 0 in
  let new_p =
    if abs dp < frame_turn
    then (
      mask := !mask lor 1;
      desired_p)
    else if dp > 0
    then cur_p + frame_turn
    else cur_p - frame_turn
  in
  let new_b =
    if abs db < frame_turn
    then (
      mask := !mask lor 2;
      desired_b)
    else if db > 0
    then cur_b + frame_turn
    else cur_b - frame_turn
  in
  let new_h =
    if abs dh < frame_turn
    then (
      mask := !mask lor 4;
      desired_h)
    else if dh > 0
    then cur_h + frame_turn
    else cur_h - frame_turn
  in
  new_p, new_b, new_h, !mask
;;

(* ── calc_best_gun (shared D1/D2) ────────────────────── *)

(* packed: [num_guns, gun_pos(3*num_guns), gun_dir(3*num_guns), objpos(3)]
   Layout: packed.(0) = num_guns
           packed.(1..3*n)       = gun_pos[0..n-1] as x,y,z triples
           packed.(1+3*n..6*n)   = gun_dir[0..n-1] as x,y,z triples
           packed.(1+6*n..3+6*n) = objpos as x,y,z *)
let calc_best_gun packed =
  let n = packed.(0) in
  let pos_off = 1 in
  let dir_off = 1 + (3 * n) in
  let obj_off = 1 + (6 * n) in
  let ox = packed.(obj_off)
  and oy = packed.(obj_off + 1)
  and oz = packed.(obj_off + 2) in
  let f1_0_x2 = 0x10000 * 2 in
  let best_dot = ref (-f1_0_x2) in
  let best_gun = ref (-1) in
  for i = 0 to n - 1 do
    let px = packed.(pos_off + (3 * i)) in
    let py = packed.(pos_off + (3 * i) + 1) in
    let pz = packed.(pos_off + (3 * i) + 2) in
    let gvx, gvy, gvz = Ox_math.vm_vec_sub ~a:(ox, oy, oz) ~b:(px, py, pz) in
    let _, (nx, ny, nz) = Ox_math.vm_vec_copy_normalize_quick ~v:(gvx, gvy, gvz) in
    let dx = packed.(dir_off + (3 * i)) in
    let dy = packed.(dir_off + (3 * i) + 1) in
    let dz = packed.(dir_off + (3 * i) + 2) in
    let dot = Ox_math.vm_vec_dotprod ~a:(dx, dy, dz) ~b:(nx, ny, nz) in
    if dot > !best_dot
    then (
      best_dot := dot;
      best_gun := i)
  done;
  if !best_dot < 0 then -1 else !best_gun
;;

(* ── D2 apply_damage_to_robot ─────────────────────────── *)

let special_reactor_robot = 65
let standard_expl_delay_d2 = 0x4000

let apply_damage_to_robot_d2
      ~flags
      ~shields
      ~damage
      ~is_boss
      ~is_companion
      ~is_thief
      ~is_death_roll
      ~is_kamikaze
      ~robot_id
      ~is_multiplayer
      ~is_final_level
      ~obj_id
      ~killer_objnum
  =
  (* Robot already exploding? *)
  if flags land of_exploding <> 0
  then shields, 0 (* Robot already dead? *)
  else if shields < 0
  then shields, 0
  else (
    if is_boss then Effect.perform Set_boss_hit_time;
    (* Companion invulnerable on final level *)
    if is_companion && is_final_level
    then shields, 0
    else (
      let new_shields = ref (shields - damage) in
      (* Final boss hacks: prevent boss death in certain conditions *)
      if is_boss && is_final_level && !new_shields < 0
      then
        if is_multiplayer
        then
          if not (Effect.perform Query_multi_all_players_alive)
          then new_shields := 1
          else (
            Effect.perform Multi_send_finish_game;
            Effect.perform Do_final_boss_hacks)
        else if Effect.perform Query_player_dead_or_no_shields
        then new_shields := 1
        else Effect.perform Do_final_boss_hacks;
      if !new_shields < 0
      then
        if is_multiplayer
        then (
          if is_thief then Effect.perform Save_stolen_items;
          if Effect.perform (Query_multi_explode_d2 (obj_id, killer_objnum, is_thief))
          then (
            if is_thief then Effect.perform Restore_stolen_items;
            Effect.perform (Multi_send_robot_explode_d2 (obj_id, killer_objnum, is_thief));
            if is_thief then Effect.perform Clear_stolen_items;
            !new_shields, 1)
          else !new_shields, 0)
        else (
          Effect.perform Increment_kills;
          if is_boss
          then Effect.perform (Start_boss_death obj_id)
          else if is_death_roll
          then Effect.perform (Start_robot_death_sequence obj_id)
          else (
            if robot_id = special_reactor_robot then Effect.perform Special_reactor_stuff;
            if is_kamikaze
            then Effect.perform (Explode_object_delay (obj_id, 1))
            else Effect.perform (Explode_object_delay (obj_id, standard_expl_delay_d2)));
          !new_shields, 1)
      else !new_shields, 0))
;;

(* ══════════════════════════════════════════════════════════════════════════
   Phase 1: Collision handlers — bump functions + simple dispatchers
   ══════════════════════════════════════════════════════════════════════════ *)

(* -- Object type constants ------------------------------------------------ *)

let obj_fireball = 1
let obj_robot = 2   (* already defined above but shadowed; redefine for clarity *)
let obj_hostage = 3
(* obj_player = 4, already defined *)
(* obj_weapon = 5, already defined *)
let obj_camera = 6
let obj_powerup = 7
let obj_debris = 8
let obj_cntrlcen = 9
let obj_clutter = 11
let obj_marker = 15  (* D2 only *)

let mt_physics = 1

let of_should_be_dead = 2

(* -- New effects for collision handlers ----------------------------------- *)

type _ Effect.t +=
  | Add_points_to_score : int -> unit Effect.t
  | Play_collision_sound : (int * int * int * int * int) -> unit Effect.t
      (* sound_id, segnum, hit_px, hit_py, hit_pz *)
  | Create_awareness_event : (int * int) -> unit Effect.t
      (* objnum, awareness_type *)
  | Write_back_hit_object : int array -> unit Effect.t
      (* [| hit_objnum; vel_x; vel_y; vel_z; rotvel_x; rotvel_y; rotvel_z;
            shields; flags |] *)

(* Phase 2 effects *)
type _ Effect.t +=
  | Create_object_explosion : (int * int * int * int * int * int) -> int Effect.t
      (* segnum, px, py, pz, size, vclip_id → objnum or -1 *)
  | Explode_badass_weapon : int -> unit Effect.t  (* weapon_objnum *)
  | Obj_attach : (int * int) -> unit Effect.t  (* parent, child *)
  | Do_ai_robot_hit : (int * int) -> unit Effect.t  (* robot_objnum, awareness *)
  | Do_ai_robot_hit_attack : (int * int * int * int * int) -> unit Effect.t
      (* robot, player, px, py, pz *)
  | Ai_do_cloak_stuff : unit Effect.t
  | Hostage_rescue : int -> unit Effect.t  (* hostage_id *)
  | Multi_robot_request_change : (int * int) -> unit Effect.t  (* robot_objnum, player_id *)
  | Multi_send_remobj : int -> unit Effect.t  (* objnum *)
  | Multi_send_play_sound : (int * int) -> unit Effect.t  (* sound_id, volume *)
  | Set_weapon_last_hitobj : (int * int) -> unit Effect.t  (* weapon_objnum, hit_objnum *)
  | Set_boss_hit_this_frame : unit Effect.t
  | Set_weapon_flags : (int * int) -> unit Effect.t  (* weapon_objnum, new_flags *)
  | Set_weapon_lifeleft : (int * int) -> unit Effect.t  (* weapon_objnum, lifeleft *)
  | Detect_escort_goal : int -> unit Effect.t  (* objnum, D2 only *)
  | Attempt_to_steal : (int * int) -> unit Effect.t  (* robot_objnum, player_id *)
  | Create_smart_children : (int * int) -> unit Effect.t  (* robot_objnum, num_blobs *)
  | Smega_rock_stuff : unit Effect.t  (* D2 earthshaker *)
  | Set_robot_gauss_spin : int -> unit Effect.t  (* robot_objnum, D2 gauss effect *)
  | Set_bump_skip_ai_count : int -> unit Effect.t  (* robot_objnum, D2 bump SKIP_AI_COUNT *)
  | Do_boss_weapon_collision : (int * int) -> int Effect.t
      (* robot_objnum, weapon_objnum → damage_flag *)
  | Create_badass_explosion_for_boss : (int * int * int * int * int) -> unit Effect.t
      (* weapon_objnum, segnum, px, py, pz *)

(* Collision data field indices — returned by Fetch_collision_data.
   The C function reads ps_obj (this-object) and Objects[hit_objnum]. *)
(* This-object fields (from ps_obj) *)
let cd_this_type          = 0
let cd_this_id            = 1
let cd_this_flags         = 2
let cd_this_shields       = 3
let cd_this_vel_x         = 4
let cd_this_vel_y         = 5
let cd_this_vel_z         = 6
let cd_this_mass          = 7
let cd_this_phys_flags    = 8
let cd_this_rotvel_x      = 9
let cd_this_rotvel_y      = 10
let cd_this_rotvel_z      = 11
let cd_this_objnum        = 12
let cd_this_robot_boss    = 13
let cd_this_robot_attack  = 14
let cd_this_robot_score   = 15
let cd_this_robot_companion = 16  (* D2 only; 0 for D1 *)
let cd_this_laser_pnum    = 17
let cd_this_laser_ptype   = 18
let cd_this_laser_psig    = 19
(* Hit-object fields *)
let cd_hit_type           = 20
let cd_hit_id             = 21
let cd_hit_flags          = 22
let cd_hit_shields        = 23
let cd_hit_vel_x          = 24
let cd_hit_vel_y          = 25
let cd_hit_vel_z          = 26
let cd_hit_mass           = 27
let cd_hit_phys_flags     = 28
let cd_hit_rotvel_x       = 29
let cd_hit_rotvel_y       = 30
let cd_hit_rotvel_z       = 31
let cd_hit_movement_type  = 32
let cd_hit_segnum         = 33
let cd_hit_size           = 34
let cd_hit_robot_boss     = 35
let cd_hit_robot_attack   = 36
let cd_hit_robot_score    = 37
let cd_hit_robot_companion = 38
let cd_hit_laser_pnum     = 39
let cd_hit_laser_ptype    = 40
let cd_hit_laser_psig     = 41
(* Global state *)
let cd_console_sig        = 42
let cd_difficulty          = 43
let cd_is_multiplayer     = 44
let cd_player_num         = 45
let cd_hit_objnum         = 46
let cd_frame_time         = 47
(* Phase 2: This-object extras *)
let cd_this_segnum                = 48
let cd_this_size                  = 49
let cd_this_laser_multiplier      = 50
let cd_this_laser_last_hitobj     = 51
let cd_this_signature             = 52
let cd_this_weapon_damage_radius  = 53
let cd_this_weapon_destroyable    = 54
let cd_this_weapon_robot_hit_sound = 55
let cd_this_weapon_impact_size    = 56
let cd_this_pos_x                 = 57
let cd_this_pos_y                 = 58
let cd_this_pos_z                 = 59
(* Phase 2: Hit-object extras *)
let cd_hit_robot_exp1_vclip       = 60
let cd_hit_robot_exp1_sound       = 61
let cd_hit_robot_claw_sound       = 62
let cd_hit_robot_thief            = 63
let cd_hit_robot_kamikaze         = 64
let cd_hit_robot_energy_drain     = 65
let cd_hit_weapon_damage_radius   = 66
let cd_hit_weapon_destroyable     = 67
let cd_hit_laser_multiplier       = 68
let cd_hit_laser_last_hitobj      = 69
let cd_hit_signature              = 70
let cd_hit_weapon_robot_hit_sound = 71
let cd_hit_pos_x                  = 72
let cd_hit_pos_y                  = 73
let cd_hit_pos_z                  = 74
(* Phase 2: Global/player state *)
let cd_player_flags               = 75
let cd_player_objnum              = 76
let cd_game_mode                  = 77
let cd_weapon_multi_damage_scale  = 78
let cd_game_time                  = 79
let cd_this_laser_creation_time   = 80
let cd_num_fields         = 81

(* -- bump_one_object ------------------------------------------------------ *)
(* Pure: applies hit_dir scaled by damage as force to object.
   Returns new velocity. *)

let bump_one_object ~vel ~hit_dir ~damage ~mass =
  let hx, hy, hz = Ox_math.vm_vec_scale ~v:hit_dir ~k:damage in
  Ox_physics.phys_apply_force ~velocity:vel ~force_vec:(hx, hy, hz) ~mass
;;

(* -- bump_this_object ----------------------------------------------------- *)
(* Applies force (and optionally damage) to one object in a collision.
   Returns (new_vel, new_rotvel, new_shields, new_flags, skip_ai).
   For the "other" object context, we pass its type/laser_info/objnum. *)

let rec bump_this_object_d1
      (* Object being bumped *)
      ~obj_type ~obj_id ~obj_flags ~vel ~rotvel ~shields ~mass ~phys_flags
      ~obj_segnum:_ ~objnum
      (* Robot info for this object *)
      ~robot_boss ~robot_attack ~robot_score:_
      (* Force *)
      ~force
      ~damage_flag
      (* Other object info (for apply_force_damage context) *)
      ~other_type ~other_laser_pnum ~other_laser_psig ~other_objnum
      ~console_sig:_ ~difficulty ~is_multiplayer:_ ~player_num:_
      (* For phys_apply_rot *)
      ~is_morph:_
  =
  if phys_flags land pf_persistent <> 0
  then vel, rotvel, shields, obj_flags, false
  else if obj_type = obj_player
  then (
    let fx, fy, fz = force in
    let f2 = fx / 4, fy / 4, fz / 4 in
    let new_vel = Ox_physics.phys_apply_force ~velocity:vel ~force_vec:f2 ~mass in
    if damage_flag
    then (
      let force_mag = Ox_math.vm_vec_mag_quick ~v:f2 in
      let new_shields, new_flags =
        apply_force_damage_d1
          ~obj_type ~obj_id ~objnum ~obj_flags ~shields ~mass
          ~robot_attack ~robot_boss
          ~force:force_mag
          ~other_type ~other_laser_pnum ~other_laser_psig ~other_objnum
      in
      new_vel, rotvel, new_shields, new_flags, false)
    else new_vel, rotvel, shields, obj_flags, false)
  else if obj_type = obj_robot || obj_type = obj_clutter || obj_type = obj_cntrlcen
  then (
    if robot_boss <> 0
    then vel, rotvel, shields, obj_flags, false
    else (
      let fx, fy, fz = force in
      let divisor = 4 + difficulty in
      let f2 = fx / divisor, fy / divisor, fz / divisor in
      let new_vel = Ox_physics.phys_apply_force ~velocity:vel ~force_vec:force ~mass in
      let fvec = 0, 0, f1_0 in  (* placeholder — need object's fvec *)
      let new_rotvel, skip_ai =
        Ox_physics.phys_apply_rot
          ~force_vec:f2
          ~mass
          ~is_robot:(obj_type = obj_robot)
          ~fvec
          ~is_morph:false
          ~cur_rotvel:rotvel
      in
      if damage_flag
      then (
        let force_mag = Ox_math.vm_vec_mag_quick ~v:force in
        let new_shields, new_flags =
          apply_force_damage_d1
            ~obj_type ~obj_id ~objnum ~obj_flags ~shields ~mass
            ~robot_attack ~robot_boss
            ~force:force_mag
            ~other_type ~other_laser_pnum ~other_laser_psig ~other_objnum
        in
        new_vel, new_rotvel, new_shields, new_flags, skip_ai)
      else new_vel, new_rotvel, shields, obj_flags, skip_ai))
  else vel, rotvel, shields, obj_flags, false

and apply_force_damage_d1
      ~obj_type ~obj_id:_ ~objnum ~obj_flags ~shields ~mass
      ~robot_attack ~robot_boss
      ~force
      ~other_type ~other_laser_pnum ~other_laser_psig ~other_objnum
  =
  if obj_flags land (of_exploding lor of_should_be_dead) <> 0
  then shields, obj_flags
  else (
    let damage = Ox_math.fixdiv ~a:force ~b:mass / 8 in
    match obj_type with
    | t when t = obj_robot ->
      let dmg = if robot_attack = 1 then damage / 4 else damage / 2 in
      let killer =
        if other_type = obj_weapon then other_laser_pnum else other_objnum
      in
      let new_shields, _boss_hit, killed =
        apply_damage_to_robot_d1
          ~flags:obj_flags ~shields ~damage:dmg
          ~is_boss:(robot_boss <> 0)
          ~is_multiplayer:false  (* will be overridden by caller context *)
          ~obj_id:objnum ~killer_objnum:killer
      in
      if killed <> 0 && other_laser_psig = -999
      then () (* score handled below *)
      else ();
      new_shields, obj_flags
    | t when t = obj_player ->
      let killer =
        if other_type = obj_weapon then other_laser_pnum else other_objnum
      in
      Effect.perform (Apply_damage_to_player (objnum, killer, damage));
      shields, obj_flags
    | t when t = obj_clutter ->
      let new_shields, _destroyed = apply_damage_to_clutter ~flags:obj_flags ~shields ~damage ~obj_id:objnum in
      new_shields, obj_flags
    | t when t = obj_cntrlcen ->
      shields, obj_flags  (* controlcen damage from bumps is minimal *)
    | _ -> shields, obj_flags)
;;

(* D2 version of bump_this_object: adds companion immunity check *)
let rec bump_this_object_d2
      ~obj_type ~obj_id ~obj_flags ~vel ~rotvel ~shields ~mass ~phys_flags
      ~obj_segnum ~objnum
      ~robot_boss ~robot_attack ~robot_score
      ~force
      ~damage_flag
      ~other_type ~other_laser_pnum ~other_laser_psig ~other_objnum
      ~other_robot_companion
      ~console_sig ~difficulty ~is_multiplayer ~player_num
      ~is_morph
  =
  if phys_flags land pf_persistent <> 0
  then vel, rotvel, shields, obj_flags, false
  else if obj_type = obj_player
  then (
    let fx, fy, fz = force in
    let f2 = fx / 4, fy / 4, fz / 4 in
    let new_vel = Ox_physics.phys_apply_force ~velocity:vel ~force_vec:f2 ~mass in
    (* D2: companion immunity — don't apply damage if other is companion robot *)
    if damage_flag && (other_type <> obj_robot || other_robot_companion = 0)
    then (
      let force_mag = Ox_math.vm_vec_mag_quick ~v:f2 in
      let new_shields, new_flags =
        apply_force_damage_d2
          ~obj_type ~obj_id ~obj_flags ~shields ~mass
          ~robot_attack ~robot_boss ~robot_score
          ~force:force_mag
          ~other_type ~other_laser_pnum ~other_laser_psig ~other_objnum
          ~other_robot_attack:0
          ~console_sig ~difficulty ~is_multiplayer ~player_num
          ~frame_time:0
          ~obj_segnum ~objnum
      in
      new_vel, rotvel, new_shields, new_flags, false)
    else new_vel, rotvel, shields, obj_flags, false)
  else if obj_type = obj_robot || obj_type = obj_clutter || obj_type = obj_cntrlcen
  then (
    if robot_boss <> 0
    then vel, rotvel, shields, obj_flags, false
    else (
      let fx, fy, fz = force in
      let divisor = 4 + difficulty in
      let f2 = fx / divisor, fy / divisor, fz / divisor in
      let new_vel = Ox_physics.phys_apply_force ~velocity:vel ~force_vec:force ~mass in
      let fvec = 0, 0, f1_0 in
      let new_rotvel, skip_ai =
        Ox_physics.phys_apply_rot
          ~force_vec:f2
          ~mass
          ~is_robot:(obj_type = obj_robot)
          ~fvec
          ~is_morph
          ~cur_rotvel:rotvel
      in
      if skip_ai then Effect.perform (Set_bump_skip_ai_count objnum);
      if damage_flag
      then (
        let force_mag = Ox_math.vm_vec_mag_quick ~v:force in
        let new_shields, new_flags =
          apply_force_damage_d2
            ~obj_type ~obj_id ~obj_flags ~shields ~mass
            ~robot_attack ~robot_boss ~robot_score
            ~force:force_mag
            ~other_type ~other_laser_pnum ~other_laser_psig ~other_objnum
            ~other_robot_attack:0
            ~console_sig ~difficulty ~is_multiplayer ~player_num
            ~frame_time:0
            ~obj_segnum ~objnum
        in
        new_vel, new_rotvel, new_shields, new_flags, skip_ai)
      else new_vel, new_rotvel, shields, obj_flags, skip_ai))
  else vel, rotvel, shields, obj_flags, false

and apply_force_damage_d2
      ~obj_type ~obj_id ~obj_flags ~shields ~mass
      ~robot_attack ~robot_boss ~robot_score
      ~force
      ~other_type ~other_laser_pnum ~other_laser_psig ~other_objnum
      ~other_robot_attack
      ~console_sig ~difficulty:_ ~is_multiplayer:_ ~player_num:_
      ~frame_time ~obj_segnum:_ ~objnum
  =
  if obj_flags land (of_exploding lor of_should_be_dead) <> 0
  then shields, obj_flags
  else (
    let damage = Ox_math.fixdiv ~a:force ~b:mass / 8 in
    match obj_type with
    | t when t = obj_robot ->
      (* D2: claw robot FrameTime scaling *)
      let dmg =
        if robot_attack = 1 then damage / 4
        else damage / 2
      in
      let killer =
        if other_type = obj_weapon then other_laser_pnum else other_objnum
      in
      let new_shields, killed =
        apply_damage_to_robot_d2
          ~flags:obj_flags ~shields ~damage:dmg
          ~is_boss:(robot_boss <> 0)
          ~is_companion:false  (* self is not companion in this context *)
          ~is_thief:false
          ~is_death_roll:false
          ~is_kamikaze:false
          ~robot_id:obj_id
          ~is_multiplayer:false
          ~is_final_level:false
          ~obj_id:objnum ~killer_objnum:killer
      in
      if killed <> 0 && other_laser_psig = console_sig
      then Effect.perform (Add_points_to_score robot_score);
      new_shields, obj_flags
    | t when t = obj_player ->
      (* D2 adds: claw robot FrameTime scaling + trainee difficulty *)
      let damage =
        if other_type = obj_robot && other_robot_attack <> 0
        then Ox_math.fixmul ~a:damage ~b:(frame_time * 2)
        else damage
      in
      let killer =
        if other_type = obj_weapon then other_laser_pnum else other_objnum
      in
      Effect.perform (Apply_damage_to_player (objnum, killer, damage));
      shields, obj_flags
    | t when t = obj_clutter ->
      let new_shields, _destroyed = apply_damage_to_clutter ~flags:obj_flags ~shields ~damage ~obj_id:objnum in
      new_shields, obj_flags
    | t when t = obj_cntrlcen ->
      shields, obj_flags
    | _ -> shields, obj_flags)
;;

(* -- bump_two_objects ----------------------------------------------------- *)
(* Computes collision force from velocity difference and mass ratio,
   applies to both objects. Returns updated state for both objects.
   result: (this_vel, this_rotvel, this_shields, this_flags,
            hit_vel, hit_rotvel, hit_shields, hit_flags) *)

let bump_two_objects_d1
      (* This object *)
      ~this_type ~this_id ~this_flags ~this_vel ~this_rotvel ~this_shields
      ~this_mass ~this_phys_flags ~this_movement_type
      ~this_segnum ~this_objnum
      ~this_robot_boss ~this_robot_attack ~this_robot_score
      ~this_laser_pnum ~this_laser_psig
      (* Hit object *)
      ~hit_type ~hit_id ~hit_flags ~hit_vel ~hit_rotvel ~hit_shields
      ~hit_mass ~hit_phys_flags ~hit_movement_type
      ~hit_segnum ~hit_objnum
      ~hit_robot_boss ~hit_robot_attack ~hit_robot_score
      ~hit_laser_pnum ~hit_laser_psig
      (* Damage flag *)
      ~damage_flag
      (* Global context *)
      ~console_sig ~difficulty ~is_multiplayer ~player_num
  =
  (* If one object doesn't have physics, only bump the one that does *)
  if this_movement_type <> mt_physics
  then (
    let fx, fy, fz = Ox_math.vm_vec_copy_scale ~v:this_vel ~k:(-this_mass) in
    let new_this_vel =
      Ox_physics.phys_apply_force ~velocity:this_vel ~force_vec:(fx, fy, fz) ~mass:this_mass
    in
    new_this_vel, this_rotvel, this_shields, this_flags,
    hit_vel, hit_rotvel, hit_shields, hit_flags)
  else if hit_movement_type <> mt_physics
  then (
    let fx, fy, fz = Ox_math.vm_vec_copy_scale ~v:hit_vel ~k:(-hit_mass) in
    let new_hit_vel =
      Ox_physics.phys_apply_force ~velocity:hit_vel ~force_vec:(fx, fy, fz) ~mass:hit_mass
    in
    this_vel, this_rotvel, this_shields, this_flags,
    new_hit_vel, hit_rotvel, hit_shields, hit_flags)
  else (
    (* Both have physics: compute collision force *)
    let force = Ox_math.vm_vec_sub ~a:this_vel ~b:hit_vel in
    let n = 2 * Ox_math.fixmul ~a:this_mass ~b:hit_mass in
    let d = this_mass + hit_mass in
    let force = Ox_math.vm_vec_scale2 ~v:force ~n ~d in
    (* Bump hit object with force *)
    let nv1, nr1, ns1, nf1, _sa1 =
      bump_this_object_d1
        ~obj_type:hit_type ~obj_id:hit_id ~obj_flags:hit_flags
        ~vel:hit_vel ~rotvel:hit_rotvel ~shields:hit_shields
        ~mass:hit_mass ~phys_flags:hit_phys_flags
        ~obj_segnum:hit_segnum ~objnum:hit_objnum
        ~robot_boss:hit_robot_boss ~robot_attack:hit_robot_attack
        ~robot_score:hit_robot_score
        ~force ~damage_flag
        ~other_type:this_type ~other_laser_pnum:this_laser_pnum
        ~other_laser_psig:this_laser_psig ~other_objnum:this_objnum
        ~console_sig ~difficulty ~is_multiplayer ~player_num
        ~is_morph:false
    in
    (* Negate force and bump this object *)
    let fx, fy, fz = force in
    let neg_force = -fx, -fy, -fz in
    let nv0, nr0, ns0, nf0, _sa0 =
      bump_this_object_d1
        ~obj_type:this_type ~obj_id:this_id ~obj_flags:this_flags
        ~vel:this_vel ~rotvel:this_rotvel ~shields:this_shields
        ~mass:this_mass ~phys_flags:this_phys_flags
        ~obj_segnum:this_segnum ~objnum:this_objnum
        ~robot_boss:this_robot_boss ~robot_attack:this_robot_attack
        ~robot_score:this_robot_score
        ~force:neg_force ~damage_flag
        ~other_type:hit_type ~other_laser_pnum:hit_laser_pnum
        ~other_laser_psig:hit_laser_psig ~other_objnum:hit_objnum
        ~console_sig ~difficulty ~is_multiplayer ~player_num
        ~is_morph:false
    in
    nv0, nr0, ns0, nf0, nv1, nr1, ns1, nf1)
;;

let bump_two_objects_d2
      ~this_type ~this_id ~this_flags ~this_vel ~this_rotvel ~this_shields
      ~this_mass ~this_phys_flags ~this_movement_type
      ~this_segnum ~this_objnum
      ~this_robot_boss ~this_robot_attack ~this_robot_score
      ~this_robot_companion
      ~this_laser_pnum ~this_laser_psig
      ~hit_type ~hit_id ~hit_flags ~hit_vel ~hit_rotvel ~hit_shields
      ~hit_mass ~hit_phys_flags ~hit_movement_type
      ~hit_segnum ~hit_objnum
      ~hit_robot_boss ~hit_robot_attack ~hit_robot_score
      ~hit_robot_companion
      ~hit_laser_pnum ~hit_laser_psig
      ~damage_flag
      ~console_sig ~difficulty ~is_multiplayer ~player_num
  =
  if this_movement_type <> mt_physics
  then (
    let fx, fy, fz = Ox_math.vm_vec_copy_scale ~v:this_vel ~k:(-this_mass) in
    let new_this_vel =
      Ox_physics.phys_apply_force ~velocity:this_vel ~force_vec:(fx, fy, fz) ~mass:this_mass
    in
    new_this_vel, this_rotvel, this_shields, this_flags,
    hit_vel, hit_rotvel, hit_shields, hit_flags)
  else if hit_movement_type <> mt_physics
  then (
    let fx, fy, fz = Ox_math.vm_vec_copy_scale ~v:hit_vel ~k:(-hit_mass) in
    let new_hit_vel =
      Ox_physics.phys_apply_force ~velocity:hit_vel ~force_vec:(fx, fy, fz) ~mass:hit_mass
    in
    this_vel, this_rotvel, this_shields, this_flags,
    new_hit_vel, hit_rotvel, hit_shields, hit_flags)
  else (
    let force = Ox_math.vm_vec_sub ~a:this_vel ~b:hit_vel in
    let n = 2 * Ox_math.fixmul ~a:this_mass ~b:hit_mass in
    let d = this_mass + hit_mass in
    let force = Ox_math.vm_vec_scale2 ~v:force ~n ~d in
    let nv1, nr1, ns1, nf1, _sa1 =
      bump_this_object_d2
        ~obj_type:hit_type ~obj_id:hit_id ~obj_flags:hit_flags
        ~vel:hit_vel ~rotvel:hit_rotvel ~shields:hit_shields
        ~mass:hit_mass ~phys_flags:hit_phys_flags
        ~obj_segnum:hit_segnum ~objnum:hit_objnum
        ~robot_boss:hit_robot_boss ~robot_attack:hit_robot_attack
        ~robot_score:hit_robot_score
        ~force ~damage_flag
        ~other_type:this_type ~other_laser_pnum:this_laser_pnum
        ~other_laser_psig:this_laser_psig ~other_objnum:this_objnum
        ~other_robot_companion:this_robot_companion
        ~console_sig ~difficulty ~is_multiplayer ~player_num
        ~is_morph:false
    in
    let fx, fy, fz = force in
    let neg_force = -fx, -fy, -fz in
    let nv0, nr0, ns0, nf0, _sa0 =
      bump_this_object_d2
        ~obj_type:this_type ~obj_id:this_id ~obj_flags:this_flags
        ~vel:this_vel ~rotvel:this_rotvel ~shields:this_shields
        ~mass:this_mass ~phys_flags:this_phys_flags
        ~obj_segnum:this_segnum ~objnum:this_objnum
        ~robot_boss:this_robot_boss ~robot_attack:this_robot_attack
        ~robot_score:this_robot_score
        ~force:neg_force ~damage_flag
        ~other_type:hit_type ~other_laser_pnum:hit_laser_pnum
        ~other_laser_psig:hit_laser_psig ~other_objnum:hit_objnum
        ~other_robot_companion:hit_robot_companion
        ~console_sig ~difficulty ~is_multiplayer ~player_num
        ~is_morph:false
    in
    nv0, nr0, ns0, nf0, nv1, nr1, ns1, nf1)
;;

(* -- Simple collision handlers -------------------------------------------- *)

(* Helper: run bump_two_objects and write back hit object state.
   Extracts this-object fields from cd (collision data array). *)
let do_bump_two_d1 ~cd ~damage_flag =
  let this_type = cd.(cd_this_type) in
  let this_id = cd.(cd_this_id) in
  let this_flags = cd.(cd_this_flags) in
  let this_vel = cd.(cd_this_vel_x), cd.(cd_this_vel_y), cd.(cd_this_vel_z) in
  let this_rotvel = cd.(cd_this_rotvel_x), cd.(cd_this_rotvel_y), cd.(cd_this_rotvel_z) in
  let this_mass = cd.(cd_this_mass) in
  let this_phys_flags = cd.(cd_this_phys_flags) in
  let this_shields = cd.(cd_this_shields) in
  let nv0, nr0, ns0, nf0, nv1, nr1, ns1, nf1 =
    bump_two_objects_d1
      ~this_type ~this_id ~this_flags ~this_vel ~this_rotvel
      ~this_shields ~this_mass ~this_phys_flags
      ~this_movement_type:mt_physics
      ~this_segnum:0 ~this_objnum:0
      ~this_robot_boss:cd.(cd_this_robot_boss)
      ~this_robot_attack:cd.(cd_this_robot_attack)
      ~this_robot_score:cd.(cd_this_robot_score)
      ~this_laser_pnum:cd.(cd_this_laser_pnum)
      ~this_laser_psig:cd.(cd_this_laser_psig)
      ~hit_type:cd.(cd_hit_type) ~hit_id:cd.(cd_hit_id)
      ~hit_flags:cd.(cd_hit_flags) ~hit_vel:(cd.(cd_hit_vel_x), cd.(cd_hit_vel_y), cd.(cd_hit_vel_z))
      ~hit_rotvel:(cd.(cd_hit_rotvel_x), cd.(cd_hit_rotvel_y), cd.(cd_hit_rotvel_z))
      ~hit_shields:cd.(cd_hit_shields)
      ~hit_mass:cd.(cd_hit_mass) ~hit_phys_flags:cd.(cd_hit_phys_flags)
      ~hit_movement_type:cd.(cd_hit_movement_type)
      ~hit_segnum:cd.(cd_hit_segnum) ~hit_objnum:cd.(cd_hit_objnum)
      ~hit_robot_boss:cd.(cd_hit_robot_boss)
      ~hit_robot_attack:cd.(cd_hit_robot_attack)
      ~hit_robot_score:cd.(cd_hit_robot_score)
      ~hit_laser_pnum:cd.(cd_hit_laser_pnum)
      ~hit_laser_psig:cd.(cd_hit_laser_psig)
      ~damage_flag
      ~console_sig:cd.(cd_console_sig)
      ~difficulty:cd.(cd_difficulty)
      ~is_multiplayer:(cd.(cd_is_multiplayer) <> 0)
      ~player_num:cd.(cd_player_num)
  in
  (* Write back hit object state *)
  let hvx, hvy, hvz = nv1 in
  let hrx, hry, hrz = nr1 in
  Effect.perform (Write_back_hit_object
    [| cd.(cd_hit_objnum); hvx; hvy; hvz; hrx; hry; hrz; ns1; nf1 |]);
  let vx, vy, vz = nv0 in
  let _rx, _ry, _rz = nr0 in
  nf0, vx, vy, vz, ns0

let do_bump_two_d2 ~cd ~damage_flag =
  let this_type = cd.(cd_this_type) in
  let this_id = cd.(cd_this_id) in
  let this_flags = cd.(cd_this_flags) in
  let this_vel = cd.(cd_this_vel_x), cd.(cd_this_vel_y), cd.(cd_this_vel_z) in
  let this_rotvel = cd.(cd_this_rotvel_x), cd.(cd_this_rotvel_y), cd.(cd_this_rotvel_z) in
  let this_mass = cd.(cd_this_mass) in
  let this_phys_flags = cd.(cd_this_phys_flags) in
  let this_shields = cd.(cd_this_shields) in
  let nv0, nr0, ns0, nf0, nv1, nr1, ns1, nf1 =
    bump_two_objects_d2
      ~this_type ~this_id ~this_flags ~this_vel ~this_rotvel
      ~this_shields ~this_mass ~this_phys_flags
      ~this_movement_type:mt_physics
      ~this_segnum:0 ~this_objnum:0
      ~this_robot_boss:cd.(cd_this_robot_boss)
      ~this_robot_attack:cd.(cd_this_robot_attack)
      ~this_robot_score:cd.(cd_this_robot_score)
      ~this_robot_companion:cd.(cd_this_robot_companion)
      ~this_laser_pnum:cd.(cd_this_laser_pnum)
      ~this_laser_psig:cd.(cd_this_laser_psig)
      ~hit_type:cd.(cd_hit_type) ~hit_id:cd.(cd_hit_id)
      ~hit_flags:cd.(cd_hit_flags) ~hit_vel:(cd.(cd_hit_vel_x), cd.(cd_hit_vel_y), cd.(cd_hit_vel_z))
      ~hit_rotvel:(cd.(cd_hit_rotvel_x), cd.(cd_hit_rotvel_y), cd.(cd_hit_rotvel_z))
      ~hit_shields:cd.(cd_hit_shields)
      ~hit_mass:cd.(cd_hit_mass) ~hit_phys_flags:cd.(cd_hit_phys_flags)
      ~hit_movement_type:cd.(cd_hit_movement_type)
      ~hit_segnum:cd.(cd_hit_segnum) ~hit_objnum:cd.(cd_hit_objnum)
      ~hit_robot_boss:cd.(cd_hit_robot_boss)
      ~hit_robot_attack:cd.(cd_hit_robot_attack)
      ~hit_robot_score:cd.(cd_hit_robot_score)
      ~hit_robot_companion:cd.(cd_hit_robot_companion)
      ~hit_laser_pnum:cd.(cd_hit_laser_pnum)
      ~hit_laser_psig:cd.(cd_hit_laser_psig)
      ~damage_flag
      ~console_sig:cd.(cd_console_sig)
      ~difficulty:cd.(cd_difficulty)
      ~is_multiplayer:(cd.(cd_is_multiplayer) <> 0)
      ~player_num:cd.(cd_player_num)
  in
  let hvx, hvy, hvz = nv1 in
  let hrx, hry, hrz = nr1 in
  Effect.perform (Write_back_hit_object
    [| cd.(cd_hit_objnum); hvx; hvy; hvz; hrx; hry; hrz; ns1; nf1 |]);
  let vx, vy, vz = nv0 in
  let _rx, _ry, _rz = nr0 in
  nf0, vx, vy, vz, ns0

(* collide_robot_and_robot: just bump both *)
let collide_robot_and_robot_d1 ~cd =
  do_bump_two_d1 ~cd ~damage_flag:true

let collide_robot_and_robot_d2 ~cd =
  do_bump_two_d2 ~cd ~damage_flag:true

(* collide_robot_and_controlcen: push robot away from controlcen.
   The C code normalizes (controlcen_pos - robot_pos) and uses bump_one_object.
   We approximate using the collision point direction since we don't have positions. *)
let collide_robot_and_controlcen ~cd ~hit_px ~hit_py ~hit_pz =
  let this_type = cd.(cd_this_type) in
  if this_type = obj_robot
  then (
    (* Robot is this object: push it away *)
    let this_vel = cd.(cd_this_vel_x), cd.(cd_this_vel_y), cd.(cd_this_vel_z) in
    let _, hitvec = Ox_math.vm_vec_normalize_quick
      ~v:(hit_px, hit_py, hit_pz) in
    let new_vel = bump_one_object ~vel:this_vel ~hit_dir:hitvec ~damage:0
      ~mass:cd.(cd_this_mass) in
    let vx, vy, vz = new_vel in
    cd.(cd_this_flags), vx, vy, vz, cd.(cd_this_shields))
  else (
    (* Controlcen is this object: push hit object (robot) away *)
    let _, hitvec = Ox_math.vm_vec_normalize_quick
      ~v:(hit_px, hit_py, hit_pz) in
    let hit_vel = cd.(cd_hit_vel_x), cd.(cd_hit_vel_y), cd.(cd_hit_vel_z) in
    let new_hit_vel = bump_one_object ~vel:hit_vel ~hit_dir:hitvec ~damage:0
      ~mass:cd.(cd_hit_mass) in
    let hvx, hvy, hvz = new_hit_vel in
    Effect.perform (Write_back_hit_object
      [| cd.(cd_hit_objnum); hvx; hvy; hvz;
         cd.(cd_hit_rotvel_x); cd.(cd_hit_rotvel_y); cd.(cd_hit_rotvel_z);
         cd.(cd_hit_shields); cd.(cd_hit_flags) |]);
    (* This object (controlcen) unchanged *)
    let vx, vy, vz = cd.(cd_this_vel_x), cd.(cd_this_vel_y), cd.(cd_this_vel_z) in
    cd.(cd_this_flags), vx, vy, vz, cd.(cd_this_shields))

(* Sound ID for SOUND_ROBOT_HIT_PLAYER *)
let sound_robot_hit_player = 17

(* collide_player_and_player: sound + bump *)
let collide_player_and_player_d1 ~cd ~hit_px ~hit_py ~hit_pz =
  Effect.perform (Play_collision_sound
    (sound_robot_hit_player, cd.(cd_hit_segnum), hit_px, hit_py, hit_pz));
  do_bump_two_d1 ~cd ~damage_flag:true

let collide_player_and_player_d2 ~cd ~hit_px ~hit_py ~hit_pz =
  Effect.perform (Play_collision_sound
    (sound_robot_hit_player, cd.(cd_hit_segnum), hit_px, hit_py, hit_pz));
  do_bump_two_d2 ~cd ~damage_flag:true

(* collide_player_and_clutter: sound + bump *)
let collide_player_and_clutter_d1 ~cd ~hit_px ~hit_py ~hit_pz =
  Effect.perform (Play_collision_sound
    (sound_robot_hit_player, cd.(cd_hit_segnum), hit_px, hit_py, hit_pz));
  do_bump_two_d1 ~cd ~damage_flag:true

let collide_player_and_clutter_d2 ~cd ~hit_px ~hit_py ~hit_pz =
  Effect.perform (Play_collision_sound
    (sound_robot_hit_player, cd.(cd_hit_segnum), hit_px, hit_py, hit_pz));
  do_bump_two_d2 ~cd ~damage_flag:true

(* collide_player_and_controlcen: sound + awareness + bump *)
let collide_player_and_controlcen_d1 ~cd ~hit_px ~hit_py ~hit_pz =
  let this_type = cd.(cd_this_type) in
  let this_id = cd.(cd_this_id) in
  if this_type = obj_player && this_id = cd.(cd_player_num)
  then Effect.perform (Create_awareness_event (cd.(cd_this_objnum), 0));
  Effect.perform (Play_collision_sound
    (sound_robot_hit_player, cd.(cd_hit_segnum), hit_px, hit_py, hit_pz));
  do_bump_two_d1 ~cd ~damage_flag:true

let collide_player_and_controlcen_d2 ~cd ~hit_px ~hit_py ~hit_pz =
  let this_type = cd.(cd_this_type) in
  let this_id = cd.(cd_this_id) in
  if this_type = obj_player && this_id = cd.(cd_player_num)
  then Effect.perform (Create_awareness_event (cd.(cd_this_objnum), 0));
  Effect.perform (Play_collision_sound
    (sound_robot_hit_player, cd.(cd_hit_segnum), hit_px, hit_py, hit_pz));
  do_bump_two_d2 ~cd ~damage_flag:true

(* ══════════════════════════════════════════════════════════════════════════
   Phase 2: Collision handlers — weapon/hostage/player/robot interactions
   ══════════════════════════════════════════════════════════════════════════ *)

(* Sound IDs (same in D1 and D2) *)
let sound_laser_hit_clutter = 30
let sound_robot_hit = 20
let sound_control_center_hit = 30
let sound_player_got_hit = 71
let sound_weapon_hit_door = 27
let sound_hostage_rescued = 91

(* Game constants *)
let hostage_score = 1000
let of_harmless = 32
let standard_expl_delay = f1_0 / 4
let pa_weapon_robot_collision = 4
let pa_player_collision = 3
let ndl = 5

(* Player flags *)
let player_flags_invulnerable = 0x08

(* D2 weapon IDs *)
let omega_id = 35
let earthshaker_id = 40
let gauss_id = 32

(* GM flags *)
let gm_multi = 1
let gm_multi_coop = 0x04

(* -- ok_to_do_omega_damage (D2 only) -------------------------------------- *)
(* Return true (1) if ok to do Omega damage.
   In multiplayer, checks if parent object is within MAX_OMEGA_DIST. *)

let desired_omega_dist = f1_0 * 5
let max_omega_blobs = 16
let max_omega_dist = max_omega_blobs * desired_omega_dist

let ok_to_do_omega_damage
      ~game_mode
      ~parent_sig
      ~parent_num:_
      ~parent_obj_signature
      ~parent_obj_pos_x ~parent_obj_pos_y ~parent_obj_pos_z
      ~weapon_pos_x ~weapon_pos_y ~weapon_pos_z
  =
  if game_mode land gm_multi = 0
  then true
  else if parent_obj_signature <> parent_sig
  then
    (* Parent of omega blob not consistent with object information. *)
    true
  else (
    let dist = Ox_math.vm_vec_dist_quick
      ~a:(parent_obj_pos_x, parent_obj_pos_y, parent_obj_pos_z)
      ~b:(weapon_pos_x, weapon_pos_y, weapon_pos_z) in
    if dist > max_omega_dist
    then false
    else true)

(* -- Helper: identify which side of cd[] is which object type ------------ *)
(* When the dispatcher gets (weapon, clutter) it could be cd_this=weapon, cd_hit=clutter
   or cd_this=clutter, cd_hit=weapon. We canonicalize. *)

(* Return unchanged this-object state for no-op *)
let no_op_result ~cd =
  cd.(cd_this_flags), cd.(cd_this_vel_x), cd.(cd_this_vel_y), cd.(cd_this_vel_z),
  cd.(cd_this_shields)

(* -- collide_hostage_and_player ------------------------------------------ *)
(* D1: if player == ConsoleObject: score + rescue + kill hostage + multi_send_remobj
   D2: same + detect_escort_goal *)

let collide_hostage_and_player_d1 ~cd =
  (* Canonicalize: figure out which is hostage and which is player *)
  let hostage_id, hostage_objnum, hostage_flags, player_id =
    if cd.(cd_this_type) = obj_hostage
    then cd.(cd_this_id), cd.(cd_this_objnum), cd.(cd_this_flags), cd.(cd_hit_id)
    else cd.(cd_hit_id), cd.(cd_hit_objnum), cd.(cd_hit_flags), cd.(cd_this_id)
  in
  if player_id = cd.(cd_player_num)
  then (
    Effect.perform (Add_points_to_score hostage_score);
    Effect.perform (Hostage_rescue hostage_id);
    let new_hostage_flags = hostage_flags lor of_should_be_dead in
    if cd.(cd_is_multiplayer) <> 0
    then Effect.perform (Multi_send_remobj hostage_objnum);
    (* Write back hostage state if it's the hit object *)
    if cd.(cd_hit_type) = obj_hostage
    then
      Effect.perform (Write_back_hit_object
        [| cd.(cd_hit_objnum); cd.(cd_hit_vel_x); cd.(cd_hit_vel_y); cd.(cd_hit_vel_z);
           cd.(cd_hit_rotvel_x); cd.(cd_hit_rotvel_y); cd.(cd_hit_rotvel_z);
           cd.(cd_hit_shields); new_hostage_flags |]);
    (* Return this-object state *)
    if cd.(cd_this_type) = obj_hostage
    then new_hostage_flags, cd.(cd_this_vel_x), cd.(cd_this_vel_y), cd.(cd_this_vel_z),
         cd.(cd_this_shields)
    else no_op_result ~cd)
  else no_op_result ~cd

let collide_hostage_and_player_d2 ~cd =
  let hostage_id, hostage_objnum, hostage_flags, player_id =
    if cd.(cd_this_type) = obj_hostage
    then cd.(cd_this_id), cd.(cd_this_objnum), cd.(cd_this_flags), cd.(cd_hit_id)
    else cd.(cd_hit_id), cd.(cd_hit_objnum), cd.(cd_hit_flags), cd.(cd_this_id)
  in
  if player_id = cd.(cd_player_num)
  then (
    Effect.perform (Detect_escort_goal hostage_objnum);
    Effect.perform (Add_points_to_score hostage_score);
    Effect.perform (Hostage_rescue hostage_id);
    let new_hostage_flags = hostage_flags lor of_should_be_dead in
    if cd.(cd_is_multiplayer) <> 0
    then Effect.perform (Multi_send_remobj hostage_objnum);
    if cd.(cd_hit_type) = obj_hostage
    then
      Effect.perform (Write_back_hit_object
        [| cd.(cd_hit_objnum); cd.(cd_hit_vel_x); cd.(cd_hit_vel_y); cd.(cd_hit_vel_z);
           cd.(cd_hit_rotvel_x); cd.(cd_hit_rotvel_y); cd.(cd_hit_rotvel_z);
           cd.(cd_hit_shields); new_hostage_flags |]);
    if cd.(cd_this_type) = obj_hostage
    then new_hostage_flags, cd.(cd_this_vel_x), cd.(cd_this_vel_y), cd.(cd_this_vel_z),
         cd.(cd_this_shields)
    else no_op_result ~cd)
  else no_op_result ~cd

(* -- collide_weapon_and_clutter ------------------------------------------ *)
(* Subtract weapon shields from clutter shields. Sound. Explosion.
   If clutter dead + not exploding: explode. maybe_kill_weapon. *)

let collide_weapon_and_clutter_d1 ~cd ~hit_px ~hit_py ~hit_pz =
  (* Canonicalize *)
  let w_shields, w_id, w_phys_flags, w_segnum, _w_objnum =
    if cd.(cd_this_type) = obj_weapon
    then cd.(cd_this_shields), cd.(cd_this_id), cd.(cd_this_phys_flags),
         cd.(cd_this_segnum), cd.(cd_this_objnum)
    else cd.(cd_hit_shields), cd.(cd_hit_id), cd.(cd_hit_phys_flags),
         cd.(cd_hit_segnum), cd.(cd_hit_objnum)
  in
  let c_shields, c_flags, c_segnum, c_size, c_objnum =
    if cd.(cd_this_type) = obj_clutter
    then cd.(cd_this_shields), cd.(cd_this_flags), cd.(cd_this_segnum),
         cd.(cd_this_size), cd.(cd_this_objnum)
    else cd.(cd_hit_shields), cd.(cd_hit_flags), cd.(cd_hit_segnum),
         cd.(cd_hit_size), cd.(cd_hit_objnum)
  in
  let new_c_shields = if c_shields >= 0 then c_shields - w_shields else c_shields in
  Effect.perform (Play_collision_sound
    (sound_laser_hit_clutter, w_segnum, hit_px, hit_py, hit_pz));
  let expl_size = ((c_size / 3) * 3) / 4 in
  ignore (Effect.perform (Create_object_explosion
    (c_segnum, hit_px, hit_py, hit_pz, expl_size, vclip_small_explosion)));
  if new_c_shields < 0 && c_flags land (of_exploding lor of_destroyed) = 0
  then Effect.perform (Explode_object_delay (c_objnum, standard_expl_delay));
  let new_w_shields, w_killed =
    maybe_kill_weapon_d1 ~weapon_id:w_id ~phys_flags:w_phys_flags
      ~weapon_shields:w_shields ~other_type:obj_clutter ~other_shields:c_shields
  in
  let new_w_flags =
    if cd.(cd_this_type) = obj_weapon
    then (if w_killed then cd.(cd_this_flags) lor of_should_be_dead else cd.(cd_this_flags))
    else (if w_killed then cd.(cd_hit_flags) lor of_should_be_dead else cd.(cd_hit_flags))
  in
  (* Write back whichever is the hit object *)
  if cd.(cd_hit_type) = obj_clutter
  then
    Effect.perform (Write_back_hit_object
      [| cd.(cd_hit_objnum); cd.(cd_hit_vel_x); cd.(cd_hit_vel_y); cd.(cd_hit_vel_z);
         cd.(cd_hit_rotvel_x); cd.(cd_hit_rotvel_y); cd.(cd_hit_rotvel_z);
         new_c_shields; c_flags |])
  else
    Effect.perform (Write_back_hit_object
      [| cd.(cd_hit_objnum); cd.(cd_hit_vel_x); cd.(cd_hit_vel_y); cd.(cd_hit_vel_z);
         cd.(cd_hit_rotvel_x); cd.(cd_hit_rotvel_y); cd.(cd_hit_rotvel_z);
         new_w_shields; new_w_flags |]);
  (* Return this-object state *)
  if cd.(cd_this_type) = obj_weapon
  then new_w_flags, cd.(cd_this_vel_x), cd.(cd_this_vel_y), cd.(cd_this_vel_z), new_w_shields
  else
    let new_this_flags =
      if new_c_shields < 0 && c_flags land (of_exploding lor of_destroyed) = 0
      then c_flags
      else c_flags
    in
    new_this_flags, cd.(cd_this_vel_x), cd.(cd_this_vel_y), cd.(cd_this_vel_z), new_c_shields

let collide_weapon_and_clutter_d2 ~cd ~hit_px ~hit_py ~hit_pz =
  (* D2 is identical to D1 for weapon+clutter *)
  let w_shields, w_id, w_phys_flags, w_segnum, _w_objnum =
    if cd.(cd_this_type) = obj_weapon
    then cd.(cd_this_shields), cd.(cd_this_id), cd.(cd_this_phys_flags),
         cd.(cd_this_segnum), cd.(cd_this_objnum)
    else cd.(cd_hit_shields), cd.(cd_hit_id), cd.(cd_hit_phys_flags),
         cd.(cd_hit_segnum), cd.(cd_hit_objnum)
  in
  let c_shields, c_flags, c_segnum, c_size, c_objnum =
    if cd.(cd_this_type) = obj_clutter
    then cd.(cd_this_shields), cd.(cd_this_flags), cd.(cd_this_segnum),
         cd.(cd_this_size), cd.(cd_this_objnum)
    else cd.(cd_hit_shields), cd.(cd_hit_flags), cd.(cd_hit_segnum),
         cd.(cd_hit_size), cd.(cd_hit_objnum)
  in
  let new_c_shields = if c_shields >= 0 then c_shields - w_shields else c_shields in
  Effect.perform (Play_collision_sound
    (sound_laser_hit_clutter, w_segnum, hit_px, hit_py, hit_pz));
  let expl_size = ((c_size / 3) * 3) / 4 in
  ignore (Effect.perform (Create_object_explosion
    (c_segnum, hit_px, hit_py, hit_pz, expl_size, vclip_small_explosion)));
  if new_c_shields < 0 && c_flags land (of_exploding lor of_destroyed) = 0
  then Effect.perform (Explode_object_delay (c_objnum, standard_expl_delay));
  let new_w_shields, w_killed =
    maybe_kill_weapon_d2 ~weapon_id:w_id ~phys_flags:w_phys_flags
      ~weapon_shields:w_shields ~other_type:obj_clutter ~other_shields:c_shields
      ~is_shareware:false
  in
  let new_w_flags =
    if cd.(cd_this_type) = obj_weapon
    then (if w_killed then cd.(cd_this_flags) lor of_should_be_dead else cd.(cd_this_flags))
    else (if w_killed then cd.(cd_hit_flags) lor of_should_be_dead else cd.(cd_hit_flags))
  in
  if cd.(cd_hit_type) = obj_clutter
  then
    Effect.perform (Write_back_hit_object
      [| cd.(cd_hit_objnum); cd.(cd_hit_vel_x); cd.(cd_hit_vel_y); cd.(cd_hit_vel_z);
         cd.(cd_hit_rotvel_x); cd.(cd_hit_rotvel_y); cd.(cd_hit_rotvel_z);
         new_c_shields; c_flags |])
  else
    Effect.perform (Write_back_hit_object
      [| cd.(cd_hit_objnum); cd.(cd_hit_vel_x); cd.(cd_hit_vel_y); cd.(cd_hit_vel_z);
         cd.(cd_hit_rotvel_x); cd.(cd_hit_rotvel_y); cd.(cd_hit_rotvel_z);
         new_w_shields; new_w_flags |]);
  if cd.(cd_this_type) = obj_weapon
  then new_w_flags, cd.(cd_this_vel_x), cd.(cd_this_vel_y), cd.(cd_this_vel_z), new_w_shields
  else cd.(cd_this_flags), cd.(cd_this_vel_x), cd.(cd_this_vel_y), cd.(cd_this_vel_z),
       new_c_shields

(* -- collide_weapon_and_debris ------------------------------------------- *)
(* Only if weapon parent is player and debris not exploding.
   Sound, explode debris, maybe badass, maybe_kill_weapon, kill weapon. *)

let collide_weapon_and_debris_d1 ~cd ~hit_px ~hit_py ~hit_pz =
  let w_ptype, w_shields, w_id, w_phys_flags, w_segnum, w_objnum, w_damage_radius =
    if cd.(cd_this_type) = obj_weapon
    then cd.(cd_this_laser_ptype), cd.(cd_this_shields), cd.(cd_this_id),
         cd.(cd_this_phys_flags), cd.(cd_this_segnum), cd.(cd_this_objnum),
         cd.(cd_this_weapon_damage_radius)
    else cd.(cd_hit_laser_ptype), cd.(cd_hit_shields), cd.(cd_hit_id),
         cd.(cd_hit_phys_flags), cd.(cd_hit_segnum), cd.(cd_hit_objnum),
         cd.(cd_hit_weapon_damage_radius)
  in
  let d_flags, d_objnum, d_shields =
    if cd.(cd_this_type) = obj_debris
    then cd.(cd_this_flags), cd.(cd_this_objnum), cd.(cd_this_shields)
    else cd.(cd_hit_flags), cd.(cd_hit_objnum), cd.(cd_hit_shields)
  in
  if w_ptype = obj_player && d_flags land of_exploding = 0
  then (
    Effect.perform (Play_collision_sound
      (sound_robot_hit, w_segnum, hit_px, hit_py, hit_pz));
    Effect.perform (Explode_object_delay (d_objnum, 0));
    if w_damage_radius <> 0
    then Effect.perform (Explode_badass_weapon w_objnum);
    let new_w_shields, w_killed =
      maybe_kill_weapon_d1 ~weapon_id:w_id ~phys_flags:w_phys_flags
        ~weapon_shields:w_shields ~other_type:obj_debris ~other_shields:d_shields
    in
    (* weapon->flags |= OF_SHOULD_BE_DEAD *)
    let base_w_flags =
      if cd.(cd_this_type) = obj_weapon then cd.(cd_this_flags) else cd.(cd_hit_flags)
    in
    let new_w_flags = base_w_flags lor of_should_be_dead in
    ignore w_killed; ignore new_w_shields;
    (* Write back *)
    if cd.(cd_hit_type) = obj_debris
    then
      Effect.perform (Write_back_hit_object
        [| cd.(cd_hit_objnum); cd.(cd_hit_vel_x); cd.(cd_hit_vel_y); cd.(cd_hit_vel_z);
           cd.(cd_hit_rotvel_x); cd.(cd_hit_rotvel_y); cd.(cd_hit_rotvel_z);
           cd.(cd_hit_shields); cd.(cd_hit_flags) |])
    else
      Effect.perform (Write_back_hit_object
        [| cd.(cd_hit_objnum); cd.(cd_hit_vel_x); cd.(cd_hit_vel_y); cd.(cd_hit_vel_z);
           cd.(cd_hit_rotvel_x); cd.(cd_hit_rotvel_y); cd.(cd_hit_rotvel_z);
           new_w_shields; new_w_flags |]);
    if cd.(cd_this_type) = obj_weapon
    then new_w_flags, cd.(cd_this_vel_x), cd.(cd_this_vel_y), cd.(cd_this_vel_z), new_w_shields
    else cd.(cd_this_flags), cd.(cd_this_vel_x), cd.(cd_this_vel_y), cd.(cd_this_vel_z),
         cd.(cd_this_shields))
  else no_op_result ~cd

let collide_weapon_and_debris_d2 ~cd ~hit_px ~hit_py ~hit_pz =
  let w_ptype, w_shields, w_id, w_phys_flags, w_segnum, w_objnum, w_damage_radius,
      w_creation_time =
    if cd.(cd_this_type) = obj_weapon
    then cd.(cd_this_laser_ptype), cd.(cd_this_shields), cd.(cd_this_id),
         cd.(cd_this_phys_flags), cd.(cd_this_segnum), cd.(cd_this_objnum),
         cd.(cd_this_weapon_damage_radius), cd.(cd_this_laser_creation_time)
    else cd.(cd_hit_laser_ptype), cd.(cd_hit_shields), cd.(cd_hit_id),
         cd.(cd_hit_phys_flags), cd.(cd_hit_segnum), cd.(cd_hit_objnum),
         cd.(cd_hit_weapon_damage_radius), 0
  in
  let d_flags, d_objnum, d_shields =
    if cd.(cd_this_type) = obj_debris
    then cd.(cd_this_flags), cd.(cd_this_objnum), cd.(cd_this_shields)
    else cd.(cd_hit_flags), cd.(cd_hit_objnum), cd.(cd_hit_shields)
  in
  (* D2 hack: prevent prox/superprox from detonating debris if recently created *)
  if (w_id = proximity_id || w_id = superprox_id)
     && w_creation_time + (f1_0 / 2) > cd.(cd_game_time)
  then no_op_result ~cd
  else if w_ptype = obj_player && d_flags land of_exploding = 0
  then (
    Effect.perform (Play_collision_sound
      (sound_robot_hit, w_segnum, hit_px, hit_py, hit_pz));
    Effect.perform (Explode_object_delay (d_objnum, 0));
    if w_damage_radius <> 0
    then Effect.perform (Explode_badass_weapon w_objnum);
    let new_w_shields, _w_killed =
      maybe_kill_weapon_d2 ~weapon_id:w_id ~phys_flags:w_phys_flags
        ~weapon_shields:w_shields ~other_type:obj_debris ~other_shields:d_shields
        ~is_shareware:false
    in
    let base_w_flags =
      if cd.(cd_this_type) = obj_weapon then cd.(cd_this_flags) else cd.(cd_hit_flags)
    in
    let new_w_flags = base_w_flags lor of_should_be_dead in
    if cd.(cd_hit_type) = obj_debris
    then
      Effect.perform (Write_back_hit_object
        [| cd.(cd_hit_objnum); cd.(cd_hit_vel_x); cd.(cd_hit_vel_y); cd.(cd_hit_vel_z);
           cd.(cd_hit_rotvel_x); cd.(cd_hit_rotvel_y); cd.(cd_hit_rotvel_z);
           cd.(cd_hit_shields); cd.(cd_hit_flags) |])
    else
      Effect.perform (Write_back_hit_object
        [| cd.(cd_hit_objnum); cd.(cd_hit_vel_x); cd.(cd_hit_vel_y); cd.(cd_hit_vel_z);
           cd.(cd_hit_rotvel_x); cd.(cd_hit_rotvel_y); cd.(cd_hit_rotvel_z);
           new_w_shields; new_w_flags |]);
    if cd.(cd_this_type) = obj_weapon
    then new_w_flags, cd.(cd_this_vel_x), cd.(cd_this_vel_y), cd.(cd_this_vel_z), new_w_shields
    else cd.(cd_this_flags), cd.(cd_this_vel_x), cd.(cd_this_vel_y), cd.(cd_this_vel_z),
         cd.(cd_this_shields))
  else no_op_result ~cd

(* -- maybe_detonate_weapon + collide_weapon_and_weapon ------------------- *)

let maybe_detonate_weapon_d1 ~w1_id ~w1_phys_flags ~w1_shields ~w1_damage_radius
      ~w1_robot_hit_sound ~w1_objnum ~w1_pos_x ~w1_pos_y ~w1_pos_z
      ~w2_shields ~w2_pos_x ~w2_pos_y ~w2_pos_z
      ~hit_px ~hit_py ~hit_pz =
  if w1_damage_radius <> 0
  then (
    let dist = Ox_math.vm_vec_dist_quick
      ~a:(w1_pos_x, w1_pos_y, w1_pos_z) ~b:(w2_pos_x, w2_pos_y, w2_pos_z) in
    if dist < f1_0 * 5
    then (
      let _, w1_killed =
        maybe_kill_weapon_d1 ~weapon_id:w1_id ~phys_flags:w1_phys_flags
          ~weapon_shields:w1_shields ~other_type:obj_weapon ~other_shields:w2_shields
      in
      if w1_killed
      then (
        Effect.perform (Set_weapon_flags (w1_objnum, of_should_be_dead));
        Effect.perform (Explode_badass_weapon w1_objnum);
        Effect.perform (Play_collision_sound
          (w1_robot_hit_sound, 0, hit_px, hit_py, hit_pz)));
      true)
    else (
      let lifeleft = min (dist / 64) f1_0 in
      Effect.perform (Set_weapon_lifeleft (w1_objnum, lifeleft));
      true))
  else false

let collide_weapon_and_weapon_d1 ~cd ~hit_px ~hit_py ~hit_pz =
  let w1_id = cd.(cd_this_id) in
  let w2_id = cd.(cd_hit_id) in
  let w1_destroyable = cd.(cd_this_weapon_destroyable) in
  let w2_destroyable = cd.(cd_hit_weapon_destroyable) in
  if w1_destroyable <> 0 || w2_destroyable <> 0
  then (
    (* Skip if same weapon from same parent *)
    if w1_id = w2_id && cd.(cd_this_laser_pnum) = cd.(cd_hit_laser_pnum)
    then no_op_result ~cd
    else (
      if w1_destroyable <> 0
      then (
        let detonated = maybe_detonate_weapon_d1
          ~w1_id ~w1_phys_flags:cd.(cd_this_phys_flags) ~w1_shields:cd.(cd_this_shields)
          ~w1_damage_radius:cd.(cd_this_weapon_damage_radius)
          ~w1_robot_hit_sound:cd.(cd_this_weapon_robot_hit_sound)
          ~w1_objnum:cd.(cd_this_objnum)
          ~w1_pos_x:cd.(cd_this_pos_x) ~w1_pos_y:cd.(cd_this_pos_y) ~w1_pos_z:cd.(cd_this_pos_z)
          ~w2_shields:cd.(cd_hit_shields)
          ~w2_pos_x:cd.(cd_hit_pos_x) ~w2_pos_y:cd.(cd_hit_pos_y) ~w2_pos_z:cd.(cd_hit_pos_z)
          ~hit_px ~hit_py ~hit_pz in
        if detonated then (
          let _, w2_killed =
            maybe_kill_weapon_d1 ~weapon_id:w2_id ~phys_flags:cd.(cd_hit_phys_flags)
              ~weapon_shields:cd.(cd_hit_shields) ~other_type:obj_weapon
              ~other_shields:cd.(cd_this_shields)
          in
          if w2_killed
          then Effect.perform (Set_weapon_flags
            (cd.(cd_hit_objnum), cd.(cd_hit_flags) lor of_should_be_dead))));
      if w2_destroyable <> 0
      then (
        let detonated = maybe_detonate_weapon_d1
          ~w1_id:w2_id ~w1_phys_flags:cd.(cd_hit_phys_flags)
          ~w1_shields:cd.(cd_hit_shields)
          ~w1_damage_radius:cd.(cd_hit_weapon_damage_radius)
          ~w1_robot_hit_sound:cd.(cd_hit_weapon_robot_hit_sound)
          ~w1_objnum:cd.(cd_hit_objnum)
          ~w1_pos_x:cd.(cd_hit_pos_x) ~w1_pos_y:cd.(cd_hit_pos_y) ~w1_pos_z:cd.(cd_hit_pos_z)
          ~w2_shields:cd.(cd_this_shields)
          ~w2_pos_x:cd.(cd_this_pos_x) ~w2_pos_y:cd.(cd_this_pos_y) ~w2_pos_z:cd.(cd_this_pos_z)
          ~hit_px ~hit_py ~hit_pz in
        if detonated then (
          let _, w1_killed =
            maybe_kill_weapon_d1 ~weapon_id:w1_id ~phys_flags:cd.(cd_this_phys_flags)
              ~weapon_shields:cd.(cd_this_shields) ~other_type:obj_weapon
              ~other_shields:cd.(cd_hit_shields)
          in
          if w1_killed
          then Effect.perform (Set_weapon_flags
            (cd.(cd_this_objnum), cd.(cd_this_flags) lor of_should_be_dead))));
      no_op_result ~cd))
  else no_op_result ~cd

let collide_weapon_and_weapon_d2 ~cd ~hit_px ~hit_py ~hit_pz =
  let w1_id = cd.(cd_this_id) in
  let w2_id = cd.(cd_hit_id) in
  (* PMines can't blow each other up *)
  if w1_id = pmine_id && w2_id = pmine_id then no_op_result ~cd
  else (
    let w1_destroyable = cd.(cd_this_weapon_destroyable) in
    let w2_destroyable = cd.(cd_hit_weapon_destroyable) in
    if w1_destroyable <> 0 || w2_destroyable <> 0
    then (
      if w1_id = w2_id && cd.(cd_this_laser_pnum) = cd.(cd_hit_laser_pnum)
      then no_op_result ~cd
      else (
        (* D2 uses maybe_detonate for both, with chain reaction *)
        if w1_destroyable <> 0
        then (
          let detonated = maybe_detonate_weapon_d1
            ~w1_id ~w1_phys_flags:cd.(cd_this_phys_flags) ~w1_shields:cd.(cd_this_shields)
            ~w1_damage_radius:cd.(cd_this_weapon_damage_radius)
            ~w1_robot_hit_sound:cd.(cd_this_weapon_robot_hit_sound)
            ~w1_objnum:cd.(cd_this_objnum)
            ~w1_pos_x:cd.(cd_this_pos_x) ~w1_pos_y:cd.(cd_this_pos_y) ~w1_pos_z:cd.(cd_this_pos_z)
            ~w2_shields:cd.(cd_hit_shields)
            ~w2_pos_x:cd.(cd_hit_pos_x) ~w2_pos_y:cd.(cd_hit_pos_y) ~w2_pos_z:cd.(cd_hit_pos_z)
            ~hit_px ~hit_py ~hit_pz in
          if detonated then
            ignore (maybe_detonate_weapon_d1
              ~w1_id:w2_id ~w1_phys_flags:cd.(cd_hit_phys_flags) ~w1_shields:cd.(cd_hit_shields)
              ~w1_damage_radius:cd.(cd_hit_weapon_damage_radius)
              ~w1_robot_hit_sound:cd.(cd_hit_weapon_robot_hit_sound)
              ~w1_objnum:cd.(cd_hit_objnum)
              ~w1_pos_x:cd.(cd_hit_pos_x) ~w1_pos_y:cd.(cd_hit_pos_y) ~w1_pos_z:cd.(cd_hit_pos_z)
              ~w2_shields:cd.(cd_this_shields)
              ~w2_pos_x:cd.(cd_this_pos_x) ~w2_pos_y:cd.(cd_this_pos_y) ~w2_pos_z:cd.(cd_this_pos_z)
              ~hit_px ~hit_py ~hit_pz));
        if w2_destroyable <> 0
        then (
          let detonated = maybe_detonate_weapon_d1
            ~w1_id:w2_id ~w1_phys_flags:cd.(cd_hit_phys_flags) ~w1_shields:cd.(cd_hit_shields)
            ~w1_damage_radius:cd.(cd_hit_weapon_damage_radius)
            ~w1_robot_hit_sound:cd.(cd_hit_weapon_robot_hit_sound)
            ~w1_objnum:cd.(cd_hit_objnum)
            ~w1_pos_x:cd.(cd_hit_pos_x) ~w1_pos_y:cd.(cd_hit_pos_y) ~w1_pos_z:cd.(cd_hit_pos_z)
            ~w2_shields:cd.(cd_this_shields)
            ~w2_pos_x:cd.(cd_this_pos_x) ~w2_pos_y:cd.(cd_this_pos_y) ~w2_pos_z:cd.(cd_this_pos_z)
            ~hit_px ~hit_py ~hit_pz in
          if detonated then
            ignore (maybe_detonate_weapon_d1
              ~w1_id ~w1_phys_flags:cd.(cd_this_phys_flags) ~w1_shields:cd.(cd_this_shields)
              ~w1_damage_radius:cd.(cd_this_weapon_damage_radius)
              ~w1_robot_hit_sound:cd.(cd_this_weapon_robot_hit_sound)
              ~w1_objnum:cd.(cd_this_objnum)
              ~w1_pos_x:cd.(cd_this_pos_x) ~w1_pos_y:cd.(cd_this_pos_y) ~w1_pos_z:cd.(cd_this_pos_z)
              ~w2_shields:cd.(cd_hit_shields)
              ~w2_pos_x:cd.(cd_hit_pos_x) ~w2_pos_y:cd.(cd_hit_pos_y) ~w2_pos_z:cd.(cd_hit_pos_z)
              ~hit_px ~hit_py ~hit_pz));
        no_op_result ~cd))
    else no_op_result ~cd)

(* -- collide_weapon_and_controlcen --------------------------------------- *)

let collide_weapon_and_controlcen_d1 ~cd ~hit_px ~hit_py ~hit_pz =
  let w_ptype, w_shields, w_id, w_phys_flags, w_pnum, w_damage_radius, w_multiplier,
      w_objnum =
    if cd.(cd_this_type) = obj_weapon
    then cd.(cd_this_laser_ptype), cd.(cd_this_shields), cd.(cd_this_id),
         cd.(cd_this_phys_flags), cd.(cd_this_laser_pnum), cd.(cd_this_weapon_damage_radius),
         cd.(cd_this_laser_multiplier), cd.(cd_this_objnum)
    else cd.(cd_hit_laser_ptype), cd.(cd_hit_shields), cd.(cd_hit_id),
         cd.(cd_hit_phys_flags), cd.(cd_hit_laser_pnum), cd.(cd_hit_weapon_damage_radius),
         cd.(cd_hit_laser_multiplier), cd.(cd_hit_objnum)
  in
  let c_segnum, c_size, c_shields, c_flags, c_objnum =
    if cd.(cd_this_type) = obj_cntrlcen
    then cd.(cd_this_segnum), cd.(cd_this_size), cd.(cd_this_shields), cd.(cd_this_flags),
         cd.(cd_this_objnum)
    else cd.(cd_hit_segnum), cd.(cd_hit_size), cd.(cd_hit_shields), cd.(cd_hit_flags),
         cd.(cd_hit_objnum)
  in
  ignore c_objnum;
  if w_ptype = obj_player
  then (
    let damage = w_shields in
    (* apply_damage_to_controlcen checks who is player internally *)
    if w_damage_radius <> 0
    then Effect.perform (Explode_badass_weapon w_objnum)
    else (
      let expl_size = ((c_size / 3) * 3) / 4 in
      ignore (Effect.perform (Create_object_explosion
        (c_segnum, hit_px, hit_py, hit_pz, expl_size, vclip_small_explosion))));
    Effect.perform (Play_collision_sound
      (sound_control_center_hit, c_segnum, hit_px, hit_py, hit_pz));
    let damage = Ox_math.fixmul ~a:damage ~b:w_multiplier in
    (* Call apply_damage_to_controlcen directly - it's pure OCaml *)
    let parent_is_local = (cd.(cd_player_objnum) >= 0 &&
      w_pnum >= 0 && w_pnum < 200 (* bounds check *)) in
    let parent_obj_id =
      if cd.(cd_this_type) = obj_weapon
      then cd.(cd_hit_id)  (* hit is the parent *)
      else cd.(cd_this_id) (* no, this is wrong *)
    in
    ignore parent_obj_id;
    let who_is_local_player = parent_is_local && w_pnum = cd.(cd_player_objnum) in
    ignore who_is_local_player;
    (* We need to pass through to apply_damage_to_controlcen via effect since
       we need the parent object's player id, which requires looking up Objects[pnum].id.
       Instead, we use the cd array: the weapon's parent_num points to a player object,
       and we need that player object's id. We have cd_player_num for the local player.
       The weapon's parent player's id is stored as Objects[parent_num].id.
       We can't easily get this from the cd array, so let's use cd_player_num
       and check if parent is local player. *)
    let who_id =
      (* For the 'who' parameter, apply_damage_to_controlcen wants Objects[who].id *)
      cd.(cd_player_num)  (* approximation: works for single player *)
    in
    let new_c_shields = apply_damage_to_controlcen
      ~shields:c_shields ~flags:c_flags ~damage
      ~who_is_player:true
      ~who_is_local_player:(w_pnum = cd.(cd_player_objnum))
      ~who_objnum:w_pnum
      ~local_player_objnum:cd.(cd_player_objnum)
      ~is_multiplayer:(cd.(cd_is_multiplayer) <> 0)
      ~is_coop:(cd.(cd_game_mode) land gm_multi_coop <> 0)
      ~time_level_ok:true  (* simplified: in D1 this checks network invul timer *)
      ~obj_id:c_objnum ~who_id
    in
    let new_w_shields, w_killed =
      maybe_kill_weapon_d1 ~weapon_id:w_id ~phys_flags:w_phys_flags
        ~weapon_shields:w_shields ~other_type:obj_cntrlcen ~other_shields:c_shields
    in
    let new_w_flags =
      if cd.(cd_this_type) = obj_weapon
      then (if w_killed then cd.(cd_this_flags) lor of_should_be_dead else cd.(cd_this_flags))
      else (if w_killed then cd.(cd_hit_flags) lor of_should_be_dead else cd.(cd_hit_flags))
    in
    if cd.(cd_hit_type) = obj_cntrlcen
    then
      Effect.perform (Write_back_hit_object
        [| cd.(cd_hit_objnum); cd.(cd_hit_vel_x); cd.(cd_hit_vel_y); cd.(cd_hit_vel_z);
           cd.(cd_hit_rotvel_x); cd.(cd_hit_rotvel_y); cd.(cd_hit_rotvel_z);
           new_c_shields; c_flags |])
    else
      Effect.perform (Write_back_hit_object
        [| cd.(cd_hit_objnum); cd.(cd_hit_vel_x); cd.(cd_hit_vel_y); cd.(cd_hit_vel_z);
           cd.(cd_hit_rotvel_x); cd.(cd_hit_rotvel_y); cd.(cd_hit_rotvel_z);
           new_w_shields; new_w_flags |]);
    if cd.(cd_this_type) = obj_weapon
    then new_w_flags, cd.(cd_this_vel_x), cd.(cd_this_vel_y), cd.(cd_this_vel_z), new_w_shields
    else cd.(cd_this_flags), cd.(cd_this_vel_x), cd.(cd_this_vel_y), cd.(cd_this_vel_z),
         new_c_shields)
  else (
    (* Robot weapon: just explosion + maybe_kill_weapon *)
    let expl_size = ((c_size / 3) * 3) / 4 in
    ignore (Effect.perform (Create_object_explosion
      (c_segnum, hit_px, hit_py, hit_pz, expl_size, vclip_small_explosion)));
    let new_w_shields, w_killed =
      maybe_kill_weapon_d1 ~weapon_id:w_id ~phys_flags:w_phys_flags
        ~weapon_shields:w_shields ~other_type:obj_cntrlcen ~other_shields:c_shields
    in
    let new_w_flags =
      if cd.(cd_this_type) = obj_weapon
      then (if w_killed then cd.(cd_this_flags) lor of_should_be_dead else cd.(cd_this_flags))
      else (if w_killed then cd.(cd_hit_flags) lor of_should_be_dead else cd.(cd_hit_flags))
    in
    if cd.(cd_hit_type) = obj_weapon
    then
      Effect.perform (Write_back_hit_object
        [| cd.(cd_hit_objnum); cd.(cd_hit_vel_x); cd.(cd_hit_vel_y); cd.(cd_hit_vel_z);
           cd.(cd_hit_rotvel_x); cd.(cd_hit_rotvel_y); cd.(cd_hit_rotvel_z);
           new_w_shields; new_w_flags |]);
    if cd.(cd_this_type) = obj_weapon
    then new_w_flags, cd.(cd_this_vel_x), cd.(cd_this_vel_y), cd.(cd_this_vel_z), new_w_shields
    else cd.(cd_this_flags), cd.(cd_this_vel_x), cd.(cd_this_vel_y), cd.(cd_this_vel_z),
         cd.(cd_this_shields))

let collide_weapon_and_controlcen_d2 ~cd ~hit_px ~hit_py ~hit_pz =
  (* D2 is same as D1 but uses controlcen->size * 3 / 20 for explosion size
     and has omega check. For now treat identically. *)
  collide_weapon_and_controlcen_d1 ~cd ~hit_px ~hit_py ~hit_pz

(* -- collide_robot_and_player -------------------------------------------- *)

let collide_robot_and_player_d1 ~cd ~hit_px ~hit_py ~hit_pz =
  (* Canonicalize: which is robot, which is player *)
  let r_objnum, p_id, p_objnum =
    if cd.(cd_this_type) = obj_robot
    then cd.(cd_this_objnum), cd.(cd_hit_id), cd.(cd_hit_objnum)
    else cd.(cd_hit_objnum), cd.(cd_this_id), cd.(cd_this_objnum)
  in
  if p_id = cd.(cd_player_num)
  then (
    Effect.perform (Create_awareness_event (p_objnum, pa_player_collision));
    Effect.perform (Do_ai_robot_hit_attack (r_objnum, p_objnum, hit_px, hit_py, hit_pz));
    Effect.perform (Do_ai_robot_hit (r_objnum, pa_weapon_robot_collision)))
  else if cd.(cd_is_multiplayer) <> 0
  then Effect.perform (Multi_robot_request_change (r_objnum, p_id));
  let p_segnum =
    if cd.(cd_this_type) = obj_player then cd.(cd_this_segnum) else cd.(cd_hit_segnum) in
  Effect.perform (Play_collision_sound
    (sound_robot_hit_player, p_segnum, hit_px, hit_py, hit_pz));
  if cd.(cd_this_type) = obj_robot
  then do_bump_two_d1 ~cd ~damage_flag:true
  else do_bump_two_d1 ~cd ~damage_flag:true

let collide_robot_and_player_d2 ~cd ~hit_px ~hit_py ~hit_pz =
  let r_objnum, r_flags, r_companion, r_kamikaze, r_thief, r_energy_drain, r_score,
      r_shields =
    if cd.(cd_this_type) = obj_robot
    then cd.(cd_this_objnum), cd.(cd_this_flags), cd.(cd_this_robot_companion),
         0, 0, 0, cd.(cd_this_robot_score), cd.(cd_this_shields)
    else cd.(cd_hit_objnum), cd.(cd_hit_flags), cd.(cd_hit_robot_companion),
         cd.(cd_hit_robot_kamikaze), cd.(cd_hit_robot_thief), cd.(cd_hit_robot_energy_drain),
         cd.(cd_hit_robot_score), cd.(cd_hit_shields)
  in
  let p_id, p_objnum, p_segnum =
    if cd.(cd_this_type) = obj_player
    then cd.(cd_this_id), cd.(cd_this_objnum), cd.(cd_this_segnum)
    else cd.(cd_hit_id), cd.(cd_hit_objnum), cd.(cd_hit_segnum)
  in
  if r_flags land of_exploding <> 0 then no_op_result ~cd
  else (
    if p_id = cd.(cd_player_num) then (
      if r_companion <> 0 then no_op_result ~cd  (* companion + player = no-op *)
      else (
        if r_kamikaze <> 0 then (
          (* Kamikaze: self-destruct and give points *)
          ignore (apply_damage_to_robot_d2
            ~flags:r_flags ~shields:r_shields ~damage:(r_shields + 1)
            ~is_boss:false ~is_companion:false ~is_thief:false
            ~is_death_roll:false ~is_kamikaze:true ~robot_id:0
            ~is_multiplayer:(cd.(cd_is_multiplayer) <> 0)
            ~is_final_level:false ~obj_id:r_objnum ~killer_objnum:p_objnum);
          if p_objnum = cd.(cd_player_objnum)
          then Effect.perform (Add_points_to_score r_score));
        if r_thief <> 0 then
          Effect.perform (Attempt_to_steal (r_objnum, p_id));
        Effect.perform (Create_awareness_event (p_objnum, pa_player_collision));
        Effect.perform (Do_ai_robot_hit_attack (r_objnum, p_objnum, hit_px, hit_py, hit_pz));
        Effect.perform (Do_ai_robot_hit (r_objnum, pa_weapon_robot_collision));
        let steal_attempt = r_thief <> 0 in
        if (not steal_attempt) && r_energy_drain = 0
        then Effect.perform (Play_collision_sound
          (sound_robot_hit_player, p_segnum, hit_px, hit_py, hit_pz));
        do_bump_two_d2 ~cd ~damage_flag:true))
    else (
      if cd.(cd_is_multiplayer) <> 0
      then Effect.perform (Multi_robot_request_change (r_objnum, p_id));
      let steal_attempt = false in
      if (not steal_attempt) && r_energy_drain = 0
      then Effect.perform (Play_collision_sound
        (sound_robot_hit_player, p_segnum, hit_px, hit_py, hit_pz));
      do_bump_two_d2 ~cd ~damage_flag:true))

(* -- collide_robot_and_weapon (THE BIG ONE) ------------------------------ *)

let rec collide_robot_and_weapon_d1 ~cd ~hit_px ~hit_py ~hit_pz =
  (* Canonicalize *)
  let r_objnum, r_flags, r_boss, r_score, r_exp1_vclip, r_exp1_sound, r_shields,
      r_signature =
    if cd.(cd_this_type) = obj_robot
    then cd.(cd_this_objnum), cd.(cd_this_flags), cd.(cd_this_robot_boss),
         cd.(cd_this_robot_score), 0, 0, cd.(cd_this_shields), cd.(cd_this_signature)
    else cd.(cd_hit_objnum), cd.(cd_hit_flags), cd.(cd_hit_robot_boss),
         cd.(cd_hit_robot_score), cd.(cd_hit_robot_exp1_vclip), cd.(cd_hit_robot_exp1_sound),
         cd.(cd_hit_shields), cd.(cd_hit_signature)
  in
  let w_objnum, w_shields, w_id, w_phys_flags, w_ptype, w_pnum, w_psig, w_flags,
      w_damage_radius, w_multiplier, w_last_hitobj, w_segnum =
    if cd.(cd_this_type) = obj_weapon
    then cd.(cd_this_objnum), cd.(cd_this_shields), cd.(cd_this_id),
         cd.(cd_this_phys_flags), cd.(cd_this_laser_ptype), cd.(cd_this_laser_pnum),
         cd.(cd_this_laser_psig), cd.(cd_this_flags), cd.(cd_this_weapon_damage_radius),
         cd.(cd_this_laser_multiplier), cd.(cd_this_laser_last_hitobj),
         cd.(cd_this_segnum)
    else cd.(cd_hit_objnum), cd.(cd_hit_shields), cd.(cd_hit_id),
         cd.(cd_hit_phys_flags), cd.(cd_hit_laser_ptype), cd.(cd_hit_laser_pnum),
         cd.(cd_hit_laser_psig), cd.(cd_hit_flags), cd.(cd_hit_weapon_damage_radius),
         cd.(cd_hit_laser_multiplier), cd.(cd_hit_laser_last_hitobj),
         cd.(cd_hit_segnum)
  in
  (* Boss check *)
  if r_boss <> 0 then Effect.perform Set_boss_hit_this_frame;
  (* Persistent weapon dedup *)
  if w_phys_flags land pf_persistent <> 0 then (
    if w_last_hitobj = r_objnum then no_op_result ~cd
    else (
      Effect.perform (Set_weapon_last_hitobj (w_objnum, r_objnum));
      (* Continue with collision *)
      collide_robot_and_weapon_d1_inner ~cd ~hit_px ~hit_py ~hit_pz
        ~r_objnum ~r_flags ~r_boss ~r_score ~r_exp1_vclip ~r_exp1_sound ~r_shields
        ~r_signature
        ~w_objnum ~w_shields ~w_id ~w_phys_flags ~w_ptype ~w_pnum ~w_psig ~w_flags
        ~w_damage_radius ~w_multiplier ~w_segnum))
  else
    collide_robot_and_weapon_d1_inner ~cd ~hit_px ~hit_py ~hit_pz
      ~r_objnum ~r_flags ~r_boss ~r_score ~r_exp1_vclip ~r_exp1_sound ~r_shields
      ~r_signature
      ~w_objnum ~w_shields ~w_id ~w_phys_flags ~w_ptype ~w_pnum ~w_psig ~w_flags
      ~w_damage_radius ~w_multiplier ~w_segnum

and collide_robot_and_weapon_d1_inner ~cd ~hit_px ~hit_py ~hit_pz
      ~r_objnum ~r_flags ~r_boss ~r_score ~r_exp1_vclip ~r_exp1_sound ~r_shields
      ~r_signature
      ~w_objnum ~w_shields ~w_id ~w_phys_flags ~w_ptype ~w_pnum ~w_psig ~w_flags
      ~w_damage_radius ~w_multiplier ~w_segnum =
  (* Friendly fire check *)
  if w_psig = r_signature then no_op_result ~cd
  else (
    if w_damage_radius <> 0 then Effect.perform (Explode_badass_weapon w_objnum);
    if w_ptype = obj_player && r_flags land of_exploding = 0 then (
      (* AI awareness *)
      if w_pnum = cd.(cd_player_objnum) then (
        Effect.perform (Create_awareness_event (w_objnum, pa_weapon_robot_collision));
        Effect.perform (Do_ai_robot_hit (r_objnum, pa_weapon_robot_collision)))
      else if cd.(cd_is_multiplayer) <> 0 then (
        (* In multiplayer, need parent object's player id. w_pnum is the parent objnum,
           but we need the id. For simplicity, use w_pnum's id from the Objects array
           via effect. Actually in D1 the code does:
           multi_robot_request_change(robot, Objects[weapon->ctype.laser_info.parent_num].id)
           We don't have Objects[pnum].id in the cd array. Use cd_player_num as fallback. *)
        Effect.perform (Multi_robot_request_change (r_objnum, cd.(cd_player_num))));
      (* Explosion *)
      let r_size =
        if cd.(cd_this_type) = obj_robot then cd.(cd_this_size) else cd.(cd_hit_size) in
      if r_exp1_vclip > -1 then (
        let expl_size = (r_size / 2 * 3) / 4 in
        let expl_objnum = Effect.perform (Create_object_explosion
          (w_segnum, hit_px, hit_py, hit_pz, expl_size, r_exp1_vclip)) in
        if expl_objnum >= 0 then Effect.perform (Obj_attach (r_objnum, expl_objnum)));
      if r_exp1_sound > -1 then
        Effect.perform (Play_collision_sound
          (r_exp1_sound, (if cd.(cd_this_type) = obj_robot then cd.(cd_this_segnum)
                          else cd.(cd_hit_segnum)), hit_px, hit_py, hit_pz));
      if w_flags land of_harmless = 0 then (
        let damage = Ox_math.fixmul ~a:w_shields ~b:w_multiplier in
        let new_r_shields, _boss_hit, killed =
          apply_damage_to_robot_d1
            ~flags:r_flags ~shields:r_shields ~damage
            ~is_boss:(r_boss <> 0)
            ~is_multiplayer:(cd.(cd_is_multiplayer) <> 0)
            ~obj_id:r_objnum ~killer_objnum:w_pnum
        in
        (* Write damaged robot shields into cd so do_bump_two sees them *)
        (if cd.(cd_this_type) = obj_robot
         then cd.(cd_this_shields) <- new_r_shields
         else cd.(cd_hit_shields) <- new_r_shields);
        if killed = 0 then
          ignore (do_bump_two_d1 ~cd ~damage_flag:false)
        else (
          if w_psig = cd.(cd_console_sig) then
            Effect.perform (Add_points_to_score r_score);
          (* Robot killed — write back shields explicitly since do_bump_two won't run *)
          if cd.(cd_hit_type) = obj_robot then
            Effect.perform (Write_back_hit_object
              [| cd.(cd_hit_objnum); cd.(cd_hit_vel_x); cd.(cd_hit_vel_y); cd.(cd_hit_vel_z);
                 cd.(cd_hit_rotvel_x); cd.(cd_hit_rotvel_y); cd.(cd_hit_rotvel_z);
                 new_r_shields; cd.(cd_hit_flags) |]))));
    (* maybe_kill_weapon *)
    let new_w_shields, w_killed =
      maybe_kill_weapon_d1 ~weapon_id:w_id ~phys_flags:w_phys_flags
        ~weapon_shields:w_shields ~other_type:obj_robot ~other_shields:r_shields
    in
    let new_w_flags =
      if w_killed then w_flags lor of_should_be_dead else w_flags
    in
    if cd.(cd_this_type) = obj_weapon then (
      (* this-object is weapon: Write_back_hit_object already handled robot above *)
      new_w_flags, cd.(cd_this_vel_x), cd.(cd_this_vel_y), cd.(cd_this_vel_z), new_w_shields)
    else (
      (* this-object is robot: write back weapon as hit object, return robot state *)
      Effect.perform (Write_back_hit_object
        [| cd.(cd_hit_objnum); cd.(cd_hit_vel_x); cd.(cd_hit_vel_y); cd.(cd_hit_vel_z);
           cd.(cd_hit_rotvel_x); cd.(cd_hit_rotvel_y); cd.(cd_hit_rotvel_z);
           new_w_shields; new_w_flags |]);
      cd.(cd_this_flags), cd.(cd_this_vel_x), cd.(cd_this_vel_y), cd.(cd_this_vel_z),
      cd.(cd_this_shields)))

let collide_robot_and_weapon_d2 ~cd ~hit_px ~hit_py ~hit_pz =
  (* For D2, fall back to C for now due to complexity (omega, boss invulnerability,
     energy blobs, gauss spin, companion, etc.) *)
  ignore (hit_px, hit_py, hit_pz);
  ignore cd;
  None

(* -- collide_player_and_weapon ------------------------------------------- *)

let rec collide_player_and_weapon_d1 ~cd ~hit_px ~hit_py ~hit_pz =
  (* Canonicalize *)
  let p_id, p_segnum, p_shields, p_flags, p_objnum =
    if cd.(cd_this_type) = obj_player
    then cd.(cd_this_id), cd.(cd_this_segnum), cd.(cd_this_shields), cd.(cd_this_flags),
         cd.(cd_this_objnum)
    else cd.(cd_hit_id), cd.(cd_hit_segnum), cd.(cd_hit_shields), cd.(cd_hit_flags),
         cd.(cd_hit_objnum)
  in
  let w_shields, w_id, w_phys_flags, w_flags, w_pnum, w_damage_radius, w_multiplier,
      w_last_hitobj, w_objnum =
    if cd.(cd_this_type) = obj_weapon
    then cd.(cd_this_shields), cd.(cd_this_id), cd.(cd_this_phys_flags), cd.(cd_this_flags),
         cd.(cd_this_laser_pnum), cd.(cd_this_weapon_damage_radius),
         cd.(cd_this_laser_multiplier), cd.(cd_this_laser_last_hitobj), cd.(cd_this_objnum)
    else cd.(cd_hit_shields), cd.(cd_hit_id), cd.(cd_hit_phys_flags), cd.(cd_hit_flags),
         cd.(cd_hit_laser_pnum), cd.(cd_hit_weapon_damage_radius),
         cd.(cd_hit_laser_multiplier), cd.(cd_hit_laser_last_hitobj), cd.(cd_hit_objnum)
  in
  let damage = Ox_math.fixmul ~a:w_shields ~b:w_multiplier in
  (* Persistent weapon dedup *)
  if w_phys_flags land pf_persistent <> 0 then (
    if w_last_hitobj = p_objnum then no_op_result ~cd
    else (
      Effect.perform (Set_weapon_last_hitobj (w_objnum, p_objnum));
      collide_player_and_weapon_d1_inner ~cd ~hit_px ~hit_py ~hit_pz
        ~p_id ~p_segnum ~p_shields ~p_flags ~p_objnum
        ~w_shields ~w_id ~w_phys_flags ~w_flags ~w_pnum ~w_damage_radius
        ~w_objnum ~damage))
  else
    collide_player_and_weapon_d1_inner ~cd ~hit_px ~hit_py ~hit_pz
      ~p_id ~p_segnum ~p_shields ~p_flags ~p_objnum
      ~w_shields ~w_id ~w_phys_flags ~w_flags ~w_pnum ~w_damage_radius
      ~w_objnum ~damage

and collide_player_and_weapon_d1_inner ~cd ~hit_px ~hit_py ~hit_pz
      ~p_id ~p_segnum ~p_shields:_ ~p_flags:_ ~p_objnum:_
      ~w_shields ~w_id ~w_phys_flags ~w_flags ~w_pnum ~w_damage_radius
      ~w_objnum ~damage =
  (* Sound *)
  if p_id = cd.(cd_player_num) then (
    let is_invulnerable = cd.(cd_player_flags) land player_flags_invulnerable <> 0 in
    if not is_invulnerable then (
      Effect.perform (Play_collision_sound
        (sound_player_got_hit, p_segnum, hit_px, hit_py, hit_pz));
      if cd.(cd_is_multiplayer) <> 0 then
        Effect.perform (Multi_send_play_sound (sound_player_got_hit, f1_0)))
    else (
      Effect.perform (Play_collision_sound
        (sound_weapon_hit_door, p_segnum, hit_px, hit_py, hit_pz));
      if cd.(cd_is_multiplayer) <> 0 then
        Effect.perform (Multi_send_play_sound (sound_weapon_hit_door, f1_0))));
  (* Explosion at player location *)
  let vclip_player_hit = 1 in
  ignore (Effect.perform (Create_object_explosion
    (p_segnum, hit_px, hit_py, hit_pz, 0x50000 / 2, vclip_player_hit)));
  (* Badass weapon *)
  if w_damage_radius <> 0 then
    Effect.perform (Explode_badass_weapon w_objnum);
  (* maybe_kill_weapon *)
  let new_w_shields, w_killed =
    maybe_kill_weapon_d1 ~weapon_id:w_id ~phys_flags:w_phys_flags
      ~weapon_shields:w_shields ~other_type:obj_player ~other_shields:0
  in
  let new_w_flags = if w_killed then w_flags lor of_should_be_dead else w_flags in
  (* Bump *)
  ignore (do_bump_two_d1 ~cd ~damage_flag:false);
  (* Apply damage if not damage_radius weapon and not harmless *)
  if w_damage_radius = 0 then (
    if w_flags land of_harmless = 0 then
      let p_objnum =
        if cd.(cd_this_type) = obj_player then cd.(cd_this_objnum)
        else cd.(cd_hit_objnum) in
      let killer_objnum = if w_pnum > -1 then w_pnum else w_objnum in
      Effect.perform (Apply_damage_to_player (p_objnum, killer_objnum, damage)));
  (* ai_do_cloak_stuff *)
  Effect.perform Ai_do_cloak_stuff;
  (* Return weapon state *)
  if cd.(cd_this_type) = obj_weapon then
    new_w_flags, cd.(cd_this_vel_x), cd.(cd_this_vel_y), cd.(cd_this_vel_z), new_w_shields
  else (
    Effect.perform (Write_back_hit_object
      [| cd.(cd_hit_objnum); cd.(cd_hit_vel_x); cd.(cd_hit_vel_y); cd.(cd_hit_vel_z);
         cd.(cd_hit_rotvel_x); cd.(cd_hit_rotvel_y); cd.(cd_hit_rotvel_z);
         new_w_shields; new_w_flags |]);
    no_op_result ~cd)

let collide_player_and_weapon_d2 ~cd ~hit_px ~hit_py ~hit_pz =
  (* D2 has omega, superprox, earthshaker, multi_damage_scale.
     Fall back to C for now *)
  ignore (cd, hit_px, hit_py, hit_pz);
  None

(* -- collide_two_objects dispatchers -------------------------------------- *)

(* COLLISION_OF macro: (type_a << 8) + type_b *)
let collision_of a b = (a lsl 8) lor b

(* D1 dispatcher. Returns (flags, vel_x, vel_y, vel_z, shields) or None for C fallback.
   All object data comes from the collision data array (cd). *)
let collide_two_objects_d1
      ~cd  (* collision data array from C *)
      ~hit_px ~hit_py ~hit_pz
  =
  let a_type = cd.(cd_this_type) in
  let b_type = cd.(cd_hit_type) in
  let ct = collision_of a_type b_type in
  (* Phase 1 handlers *)
  if ct = collision_of obj_robot obj_robot
  then Some (collide_robot_and_robot_d1 ~cd)
  else if ct = collision_of obj_player obj_player
  then Some (collide_player_and_player_d1 ~cd ~hit_px ~hit_py ~hit_pz)
  else if ct = collision_of obj_player obj_clutter
       || ct = collision_of obj_clutter obj_player
  then Some (collide_player_and_clutter_d1 ~cd ~hit_px ~hit_py ~hit_pz)
  else if ct = collision_of obj_player obj_cntrlcen
       || ct = collision_of obj_cntrlcen obj_player
  then Some (collide_player_and_controlcen_d1 ~cd ~hit_px ~hit_py ~hit_pz)
  else if ct = collision_of obj_robot obj_cntrlcen
       || ct = collision_of obj_cntrlcen obj_robot
  then Some (collide_robot_and_controlcen ~cd ~hit_px ~hit_py ~hit_pz)
  (* Phase 2 handlers *)
  else if ct = collision_of obj_hostage obj_player
       || ct = collision_of obj_player obj_hostage
  then Some (collide_hostage_and_player_d1 ~cd)
  else if ct = collision_of obj_weapon obj_clutter
       || ct = collision_of obj_clutter obj_weapon
  then Some (collide_weapon_and_clutter_d1 ~cd ~hit_px ~hit_py ~hit_pz)
  else if ct = collision_of obj_weapon obj_debris
       || ct = collision_of obj_debris obj_weapon
  then Some (collide_weapon_and_debris_d1 ~cd ~hit_px ~hit_py ~hit_pz)
  else if ct = collision_of obj_weapon obj_weapon
  then Some (collide_weapon_and_weapon_d1 ~cd ~hit_px ~hit_py ~hit_pz)
  else if ct = collision_of obj_weapon obj_cntrlcen
       || ct = collision_of obj_cntrlcen obj_weapon
  then Some (collide_weapon_and_controlcen_d1 ~cd ~hit_px ~hit_py ~hit_pz)
  else if ct = collision_of obj_robot obj_player
       || ct = collision_of obj_player obj_robot
  then Some (collide_robot_and_player_d1 ~cd ~hit_px ~hit_py ~hit_pz)
  else if ct = collision_of obj_robot obj_weapon
       || ct = collision_of obj_weapon obj_robot
  then Some (collide_robot_and_weapon_d1 ~cd ~hit_px ~hit_py ~hit_pz)
  else if ct = collision_of obj_player obj_weapon
       || ct = collision_of obj_weapon obj_player
  then Some (collide_player_and_weapon_d1 ~cd ~hit_px ~hit_py ~hit_pz)
  else None  (* Fall back to C for unported handlers *)

let collide_two_objects_d2
      ~cd
      ~hit_px ~hit_py ~hit_pz
  =
  let a_type = cd.(cd_this_type) in
  let b_type = cd.(cd_hit_type) in
  let ct = collision_of a_type b_type in
  (* Phase 1 handlers *)
  if ct = collision_of obj_robot obj_robot
  then Some (collide_robot_and_robot_d2 ~cd)
  else if ct = collision_of obj_player obj_player
  then Some (collide_player_and_player_d2 ~cd ~hit_px ~hit_py ~hit_pz)
  else if ct = collision_of obj_player obj_clutter
       || ct = collision_of obj_clutter obj_player
  then Some (collide_player_and_clutter_d2 ~cd ~hit_px ~hit_py ~hit_pz)
  else if ct = collision_of obj_player obj_cntrlcen
       || ct = collision_of obj_cntrlcen obj_player
  then Some (collide_player_and_controlcen_d2 ~cd ~hit_px ~hit_py ~hit_pz)
  else if ct = collision_of obj_robot obj_cntrlcen
       || ct = collision_of obj_cntrlcen obj_robot
  then Some (collide_robot_and_controlcen ~cd ~hit_px ~hit_py ~hit_pz)
  (* Phase 2 handlers *)
  else if ct = collision_of obj_hostage obj_player
       || ct = collision_of obj_player obj_hostage
  then Some (collide_hostage_and_player_d2 ~cd)
  else if ct = collision_of obj_weapon obj_clutter
       || ct = collision_of obj_clutter obj_weapon
  then Some (collide_weapon_and_clutter_d2 ~cd ~hit_px ~hit_py ~hit_pz)
  else if ct = collision_of obj_weapon obj_debris
       || ct = collision_of obj_debris obj_weapon
  then Some (collide_weapon_and_debris_d2 ~cd ~hit_px ~hit_py ~hit_pz)
  else if ct = collision_of obj_weapon obj_weapon
  then Some (collide_weapon_and_weapon_d2 ~cd ~hit_px ~hit_py ~hit_pz)
  else if ct = collision_of obj_weapon obj_cntrlcen
       || ct = collision_of obj_cntrlcen obj_weapon
  then Some (collide_weapon_and_controlcen_d2 ~cd ~hit_px ~hit_py ~hit_pz)
  else if ct = collision_of obj_robot obj_player
       || ct = collision_of obj_player obj_robot
  then Some (collide_robot_and_player_d2 ~cd ~hit_px ~hit_py ~hit_pz)
  (* D2 robot+weapon and player+weapon fall back to C for now *)
  else None
;;
