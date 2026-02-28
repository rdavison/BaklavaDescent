(* Physics bridge callbacks for C bridge.

   physics_turn_towards_vector: 10 scalar args → 3 ints
     goal(3) + fvec(3) + rate(1) + is_morph(1) + cur_rotvel(3) = 11 in
     Returns (new_rx, new_ry, new_rz) *)

let cd_physics_turn_towards_vector gx gy gz fx fy fz rate is_morph crx cry crz =
  let rx, ry, rz =
    Ox_physics.physics_turn_towards_vector
      ~goal:(gx, gy, gz)
      ~fvec:(fx, fy, fz)
      ~rate
      ~is_morph:(is_morph <> 0)
      ~cur_rotvel:(crx, cry, crz)
  in
  rx, ry, rz
;;

(* do_physics_sim_rot: 20 scalar args → 13 ints (or 1 int if no-op)
   rotvel(3) + rotthrust(3) + orient(9) + drag(1) + mass(1) + flags(1) +
   turnroll(1) + frame_time(1) = 20 in
   Returns: tag(1) + orient(9) + rotvel(3) + turnroll(1) = 14 values
   tag=0 means no rotation needed (all zeros) *)
let cd_do_physics_sim_rot
      rvx
      rvy
      rvz
      rtx
      rty
      rtz
      o_rx
      o_ry
      o_rz
      o_ux
      o_uy
      o_uz
      o_fx
      o_fy
      o_fz
      drag
      mass
      flags
      turnroll
      frame_time
  =
  let orient = (o_rx, o_ry, o_rz), (o_ux, o_uy, o_uz), (o_fx, o_fy, o_fz) in
  match
    Ox_physics.do_physics_sim_rot
      ~rotvel:(rvx, rvy, rvz)
      ~rotthrust:(rtx, rty, rtz)
      ~orient
      ~drag
      ~mass
      ~flags
      ~turnroll
      ~frame_time
  with
  | None -> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  | Some
      ( ((nrx, nry, nrz), (nux, nuy, nuz), (nfx, nfy, nfz))
      , (new_rvx, new_rvy, new_rvz)
      , new_turnroll ) ->
    ( 1
    , nrx
    , nry
    , nrz
    , nux
    , nuy
    , nuz
    , nfx
    , nfy
    , nfz
    , new_rvx
    , new_rvy
    , new_rvz
    , new_turnroll )
;;

(* calc_gun_point: flat int array → vec3
   Array layout (MAX_SUBMODELS=10):
     [0..2]     gun_point (x,y,z)
     [3]        start_mn
     [4..33]    anim_angles (10 * (p,b,h))
     [34..63]   submodel_offsets (10 * (x,y,z))
     [64..73]   submodel_parents (10 ints)
     [74..82]   orient (9 values: rx,ry,rz,ux,uy,uz,fx,fy,fz)
     [83..85]   pos (x,y,z)
   Total: 86 ints *)
let cd_calc_gun_point (packed : int array) =
  let gun_point = packed.(0), packed.(1), packed.(2) in
  let start_mn = packed.(3) in
  let n = 10 in
  let anim_angles =
    Array.init n ~f:(fun i ->
      let base = 4 + (i * 3) in
      packed.(base), packed.(base + 1), packed.(base + 2))
  in
  let offsets =
    Array.init n ~f:(fun i ->
      let base = 34 + (i * 3) in
      packed.(base), packed.(base + 1), packed.(base + 2))
  in
  let parents = Array.init n ~f:(fun i -> packed.(64 + i)) in
  let orient =
    ( (packed.(74), packed.(75), packed.(76))
    , (packed.(77), packed.(78), packed.(79))
    , (packed.(80), packed.(81), packed.(82)) )
  in
  let pos = packed.(83), packed.(84), packed.(85) in
  let gx, gy, gz =
    Ox_physics.calc_gun_point
      ~gun_point
      ~start_mn
      ~anim_angles
      ~offsets
      ~parents
      ~orient
      ~pos
  in
  gx, gy, gz
;;

(* phys_apply_force: 7 scalar args → 3 ints
   velocity(3) + force_vec(3) + mass(1) = 7 in
   Returns: (new_vx, new_vy, new_vz) *)
let cd_phys_apply_force vx vy vz fx fy fz mass =
  let nx, ny, nz =
    Ox_physics.phys_apply_force ~velocity:(vx, vy, vz) ~force_vec:(fx, fy, fz) ~mass
  in
  nx, ny, nz
;;

(* phys_apply_rot: 10 scalar args → 4 ints
   force_vec(3) + mass(1) + is_robot(1) + fvec(3) + is_morph(1) + cur_rotvel(3) = 12 in
   Returns: (new_rx, new_ry, new_rz, set_skip_ai) *)
let cd_phys_apply_rot fx fy fz mass is_robot fvx fvy fvz is_morph crx cry crz =
  let (nx, ny, nz), set_skip_ai =
    Ox_physics.phys_apply_rot
      ~force_vec:(fx, fy, fz)
      ~mass
      ~is_robot:(is_robot <> 0)
      ~fvec:(fvx, fvy, fvz)
      ~is_morph:(is_morph <> 0)
      ~cur_rotvel:(crx, cry, crz)
  in
  nx, ny, nz, if set_skip_ai then 1 else 0
;;

(* ai_turn_towards_vector: 16 scalar args → 9 ints
   goal(3) + fvec(3) + rvec(3) + rate(1) + frame_time(1) +
   seismic_mag(1) + robot_mass(1) + rand_vec(3) = 16 in
   Returns: orient (rvec(3), uvec(3), fvec(3)) = 9 values *)
let cd_ai_turn_towards_vector
      gx
      gy
      gz
      fx
      fy
      fz
      rx
      ry
      rz
      rate
      frame_time
      seismic_mag
      robot_mass
      rvx
      rvy
      rvz
  =
  let (nrx, nry, nrz), (nux, nuy, nuz), (nfx, nfy, nfz) =
    Ox_physics.ai_turn_towards_vector
      ~goal:(gx, gy, gz)
      ~fvec:(fx, fy, fz)
      ~rvec:(rx, ry, rz)
      ~rate
      ~frame_time
      ~seismic_mag
      ~robot_mass
      ~rand_vec:(rvx, rvy, rvz)
  in
  nrx, nry, nrz, nux, nuy, nuz, nfx, nfy, nfz
;;

(* set_thrust_from_velocity: 5 scalar args → 3 ints
   mass(1) + drag(1) + velocity(3) = 5 in
   Returns: thrust (tx, ty, tz) *)
let cd_set_thrust_from_velocity mass drag vx vy vz =
  let tx, ty, tz =
    Ox_physics.set_thrust_from_velocity ~mass ~drag ~velocity:(vx, vy, vz)
  in
  tx, ty, tz
;;

(* move_towards_vector: 16 scalar args → 3 ints *)
let cd_move_towards_vector
      vx
      vy
      vz
      gx
      gy
      gz
      fx
      fy
      fz
      frame_time
      difficulty
      max_speed
      attack_type
      dot_based
      is_thief
      is_kamikaze
  =
  Ox_physics.move_towards_vector
    ~velocity:(vx, vy, vz)
    ~vec_goal:(gx, gy, gz)
    ~fvec:(fx, fy, fz)
    ~frame_time
    ~difficulty
    ~max_speed
    ~attack_type
    ~dot_based:(dot_based <> 0)
    ~is_thief:(is_thief <> 0)
    ~is_kamikaze:(is_kamikaze <> 0)
;;

(* move_around_player: 16 scalar args → 3 ints (packed as flat int array) *)
let cd_move_around_player (packed : int array) =
  let velocity = packed.(0), packed.(1), packed.(2) in
  let vec_to_player = packed.(3), packed.(4), packed.(5) in
  let fvec = packed.(6), packed.(7), packed.(8) in
  let frame_time = packed.(9) in
  let frame_count = packed.(10) in
  let objnum = packed.(11) in
  let fast_flag = packed.(12) in
  let shields = packed.(13) in
  let strength = packed.(14) in
  let field_of_view = packed.(15) in
  let max_speed = packed.(16) in
  let player_cloaked = packed.(17) <> 0 in
  let skip_objnum1 = packed.(18) <> 0 in
  Ox_physics.move_around_player
    ~velocity
    ~vec_to_player
    ~fvec
    ~frame_time
    ~frame_count
    ~objnum
    ~fast_flag
    ~shields
    ~strength
    ~field_of_view
    ~max_speed
    ~player_cloaked
    ~skip_objnum1
;;

(* move_away_from_player: 17 scalar args → 3 ints *)
let cd_move_away_from_player
      vx
      vy
      vz
      px
      py
      pz
      ux
      uy
      uz
      rx
      ry
      rz
      frame_time
      frame_count
      objnum
      attack_type
      max_speed
  =
  Ox_physics.move_away_from_player
    ~velocity:(vx, vy, vz)
    ~vec_to_player:(px, py, pz)
    ~uvec:(ux, uy, uz)
    ~rvec:(rx, ry, rz)
    ~frame_time
    ~frame_count
    ~objnum
    ~attack_type
    ~max_speed
;;

(* set_object_turnroll: 3 scalar args → 1 int *)
let cd_set_object_turnroll rotvel_y turnroll frame_time =
  Ox_physics.set_object_turnroll ~rotvel_y ~turnroll ~frame_time
;;

(* lead_player: 17 scalar args → 4 ints (success, fx, fy, fz) *)
let cd_lead_player
      fpx
      fpy
      fpz
      bpx
      bpy
      bpz
      pvx
      pvy
      pvz
      fvx
      fvy
      fvz
      player_cloaked
      max_weapon_speed
      is_matter
      difficulty_level
  =
  match
    Ox_physics.lead_player
      ~fire_point:(fpx, fpy, fpz)
      ~believed_player_pos:(bpx, bpy, bpz)
      ~player_velocity:(pvx, pvy, pvz)
      ~fvec:(fvx, fvy, fvz)
      ~player_cloaked:(player_cloaked <> 0)
      ~max_weapon_speed
      ~is_matter:(is_matter <> 0)
      ~difficulty_level
  with
  | None -> 0, 0, 0, 0
  | Some (rx, ry, rz) -> 1, rx, ry, rz
;;

(* homing_missile_turn_towards_velocity: 7 scalar args → 9 ints
   norm_vel(3) + fvec(3) + frame_time(1) = 7 in
   Returns: orient (rvec(3), uvec(3), fvec(3)) = 9 values *)
let cd_homing_missile_turn_towards_velocity nvx nvy nvz fx fy fz frame_time =
  let (nrx, nry, nrz), (nux, nuy, nuz), (nfx, nfy, nfz) =
    Ox_physics.homing_missile_turn_towards_velocity
      ~norm_vel:(nvx, nvy, nvz)
      ~fvec:(fx, fy, fz)
      ~frame_time
  in
  nrx, nry, nrz, nux, nuy, nuz, nfx, nfy, nfz
;;

(* ai_frame_animation: packed int array (2 + 9*N) → flat int array (3*N) *)
let cd_ai_frame_animation (packed : int array) = Ox_physics.ai_frame_animation packed

(* ai_move_relative_to_player: packed int array (56) → flat int array (6) *)
let cd_ai_move_relative_to_player (packed : int array) =
  Ox_physics.ai_move_relative_to_player packed
;;

(* ai_path_set_orient_and_vel: packed int array (27) → flat int array (12) *)
let cd_ai_path_set_orient_and_vel (packed : int array) =
  Ox_physics.ai_path_set_orient_and_vel packed
;;

(* do_silly_animation: packed int array → flat int array *)
let cd_do_silly_animation (packed : int array) = Ox_physics.do_silly_animation packed

(* do_physics_align_object: packed int array (54) → flat int array (11)
   Output: [tag, rvec(3), uvec(3), fvec(3), floor_levelling]
   tag=0: orient unchanged, tag=1: orient was modified *)
let cd_do_physics_align_object (packed : int array) =
  let ( orient_changed
      , ((nrx, nry, nrz), (nux, nuy, nuz), (nfx, nfy, nfz))
      , new_floor_levelling )
    =
    Ox_physics.do_physics_align_object packed
  in
  let buf = Array.create ~len:11 0 in
  buf.(0) <- (if orient_changed then 1 else 0);
  buf.(1) <- nrx;
  buf.(2) <- nry;
  buf.(3) <- nrz;
  buf.(4) <- nux;
  buf.(5) <- nuy;
  buf.(6) <- nuz;
  buf.(7) <- nfx;
  buf.(8) <- nfy;
  buf.(9) <- nfz;
  buf.(10) <- (if new_floor_levelling then 1 else 0);
  buf
;;

let () =
  Callback.register "cd_physics_turn_towards_vector" cd_physics_turn_towards_vector;
  Callback.register "cd_do_physics_sim_rot" cd_do_physics_sim_rot;
  Callback.register "cd_calc_gun_point" cd_calc_gun_point;
  Callback.register "cd_phys_apply_force" cd_phys_apply_force;
  Callback.register "cd_phys_apply_rot" cd_phys_apply_rot;
  Callback.register "cd_ai_turn_towards_vector" cd_ai_turn_towards_vector;
  Callback.register "cd_set_thrust_from_velocity" cd_set_thrust_from_velocity;
  Callback.register "cd_move_towards_vector" cd_move_towards_vector;
  Callback.register "cd_move_around_player" cd_move_around_player;
  Callback.register "cd_move_away_from_player" cd_move_away_from_player;
  Callback.register "cd_set_object_turnroll" cd_set_object_turnroll;
  Callback.register "cd_lead_player" cd_lead_player;
  Callback.register
    "cd_homing_missile_turn_towards_velocity"
    cd_homing_missile_turn_towards_velocity;
  Callback.register "cd_do_physics_align_object" cd_do_physics_align_object;
  Callback.register "cd_ai_frame_animation" cd_ai_frame_animation;
  Callback.register "cd_ai_move_relative_to_player" cd_ai_move_relative_to_player;
  Callback.register "cd_ai_path_set_orient_and_vel" cd_ai_path_set_orient_and_vel;
  Callback.register "cd_do_silly_animation" cd_do_silly_animation
;;

let cd_do_physics_drag (packed : int array) = Ox_physics.do_physics_drag packed
let () = Callback.register "cd_do_physics_drag" cd_do_physics_drag

let cd_do_homing_weapon_frame (packed : int array) =
  Ox_physics.do_homing_weapon_frame packed
;;

let () = Callback.register "cd_do_homing_weapon_frame" cd_do_homing_weapon_frame
