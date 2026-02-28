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
