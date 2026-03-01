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
let cd_num_fields         = 48

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
      ~obj_segnum:_ ~objnum:_
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
          ~obj_type ~obj_id ~obj_flags ~shields ~mass
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
            ~obj_type ~obj_id ~obj_flags ~shields ~mass
            ~robot_attack ~robot_boss
            ~force:force_mag
            ~other_type ~other_laser_pnum ~other_laser_psig ~other_objnum
        in
        new_vel, new_rotvel, new_shields, new_flags, skip_ai)
      else new_vel, new_rotvel, shields, obj_flags, skip_ai))
  else vel, rotvel, shields, obj_flags, false

and apply_force_damage_d1
      ~obj_type ~obj_id ~obj_flags ~shields ~mass
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
          ~obj_id ~killer_objnum:killer
      in
      if killed <> 0 && other_laser_psig = -999
      then () (* score handled below *)
      else ();
      new_shields, obj_flags
    | t when t = obj_player ->
      (* apply_damage_to_player needs more context than we have here;
         for bump damage, we skip the full player damage path.
         In the C code, apply_damage_to_player is called with the full
         object pointers. We'll handle this via the existing effect path. *)
      shields, obj_flags
    | t when t = obj_clutter ->
      let new_shields, _destroyed = apply_damage_to_clutter ~flags:obj_flags ~shields ~damage ~obj_id in
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
      ~frame_time ~obj_segnum:_ ~objnum:_
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
          ~obj_id ~killer_objnum:killer
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
      let _damage = damage in  (* trainee reduction would go here *)
      shields, obj_flags  (* player damage handled via existing path *)
    | t when t = obj_clutter ->
      let new_shields, _destroyed = apply_damage_to_clutter ~flags:obj_flags ~shields ~damage ~obj_id in
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

(* -- collide_two_objects dispatchers -------------------------------------- *)

(* COLLISION_OF macro: (type_a << 8) + type_b *)
let collision_of a b = (a lsl 8) lor b

(* D1 dispatcher. Returns (flags, vel_x, vel_y, vel_z) or None for C fallback.
   All object data comes from the collision data array (cd). *)
let collide_two_objects_d1
      ~cd  (* collision data array from C *)
      ~hit_px ~hit_py ~hit_pz
  =
  let a_type = cd.(cd_this_type) in
  let b_type = cd.(cd_hit_type) in
  let ct = collision_of a_type b_type in
  (* Simple handlers we've ported *)
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
  else None  (* Fall back to C for unported handlers *)

let collide_two_objects_d2
      ~cd
      ~hit_px ~hit_py ~hit_pz
  =
  let a_type = cd.(cd_this_type) in
  let b_type = cd.(cd_hit_type) in
  let ct = collision_of a_type b_type in
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
  else None
;;
