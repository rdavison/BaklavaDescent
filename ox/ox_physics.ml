(* Pure physics helper functions ported from main_d1/physics.cpp *)

let f1_0 = 0x10000

(* Saturating rotational velocity assignment.
   If delta and dest have opposite signs and delta is small,
   damp by dividing delta by 4. Otherwise just assign delta.
   C original: physics.cpp physics_set_rotvel_and_saturate *)
let physics_set_rotvel_and_saturate ~dest ~delta =
  if delta lxor dest < 0
  then if Int.abs delta < f1_0 / 8 then delta / 4 else delta
  else delta
;;

(* Compute new rotational velocity to steer towards goal_vector.
   C original: physics.cpp physics_turn_towards_vector

   Inputs:
     goal       - target direction vector (x, y, z)
     fvec       - object's current forward vector (x, y, z)
     rate       - turning rate (higher = slower turn)
     is_morph   - if true, double the rate (morph objects turn slower)
     cur_rotvel - current rotational velocity (rx, ry, rz)

   Returns: new rotational velocity (rx, ry, rz).
   If goal is the zero vector, returns cur_rotvel unchanged. *)
let physics_turn_towards_vector ~goal ~fvec ~rate ~is_morph ~cur_rotvel =
  let gx, gy, gz = goal in
  if gx = 0 && gy = 0 && gz = 0
  then cur_rotvel
  else (
    let rate = if is_morph then rate * 2 else rate in
    let dest_p, _dest_b, dest_h =
      Ox_math.vm_extract_angles_vector ~angles:(0, 0, 0) ~v:goal
    in
    let cur_p, _cur_b, cur_h =
      Ox_math.vm_extract_angles_vector ~angles:(0, 0, 0) ~v:fvec
    in
    let delta_p = dest_p - cur_p in
    let delta_h = dest_h - cur_h in
    (* Wrap angles to [-F1_0/2, F1_0/2] *)
    let delta_p =
      if delta_p > f1_0 / 2
      then dest_p - cur_p - f1_0
      else if delta_p < -(f1_0 / 2)
      then dest_p - cur_p + f1_0
      else delta_p
    in
    let delta_h =
      if delta_h > f1_0 / 2
      then dest_h - cur_h - f1_0
      else if delta_h < -(f1_0 / 2)
      then dest_h - cur_h + f1_0
      else delta_h
    in
    let delta_p = Ox_math.fixdiv ~a:delta_p ~b:rate in
    let delta_h = Ox_math.fixdiv ~a:delta_h ~b:rate in
    (* Amplify small deltas *)
    let delta_p = if Int.abs delta_p < f1_0 / 16 then delta_p * 4 else delta_p in
    let delta_h = if Int.abs delta_h < f1_0 / 16 then delta_h * 4 else delta_h in
    let cur_rx, cur_ry, _cur_rz = cur_rotvel in
    let new_rx = physics_set_rotvel_and_saturate ~dest:cur_rx ~delta:delta_p in
    let new_ry = physics_set_rotvel_and_saturate ~dest:cur_ry ~delta:delta_h in
    new_rx, new_ry, 0)
;;

(* Constants from physics.cpp *)
let turnroll_scale = 0x4ec4 / 2
let roll_rate = 0x2000
let ft = f1_0 / 64

(* Physics flags *)
let pf_turnroll = 0x01
let pf_uses_thrust = 0x40
let pf_free_spinning = 0x100

(* Rebuild orthogonal matrix from forward+up vectors.
   C original: physics.cpp check_and_fix_matrix *)
let check_and_fix_matrix ~orient =
  let (_rx, _ry, _rz), (ux, uy, uz), (fx, fy, fz) = orient in
  Ox_math.vm_vector_2_matrix ~fvec:(fx, fy, fz) ~uvec:(Some (ux, uy, uz)) ~rvec:None
;;

(* Compute new turnroll based on rotational velocity.
   C original: physics.cpp set_object_turnroll

   Inputs:
     turnroll   - current turnroll angle (fixang)
     rotvel_y   - y component of rotational velocity
     frame_time - FrameTime global

   Returns: new turnroll value *)
let set_object_turnroll ~turnroll ~rotvel_y ~frame_time =
  (* C casts to fixang (int16_t) *)
  let fixang v = Ox_math.wrap_i64_to_fixang (Int64.of_int v) in
  let desired_bank = fixang (-Ox_math.fixmul ~a:rotvel_y ~b:turnroll_scale) in
  if turnroll = desired_bank
  then turnroll
  else (
    let max_roll = fixang (Ox_math.fixmul ~a:roll_rate ~b:frame_time) in
    let delta_ang = desired_bank - turnroll in
    let max_roll =
      if Int.abs delta_ang < max_roll
      then delta_ang
      else if delta_ang < 0
      then -max_roll
      else max_roll
    in
    turnroll + max_roll)
;;

(* Wrap to int32 range — C int32 arithmetic wraps on overflow *)
let w32 v = Ox_math.wrap_i64_to_fix (Int64.of_int v)

(* Helper: scale vector by fixpoint scalar — fixmul already wraps *)
let vec_scale ~v:(x, y, z) ~s =
  Ox_math.fixmul ~a:x ~b:s, Ox_math.fixmul ~a:y ~b:s, Ox_math.fixmul ~a:z ~b:s
;;

(* Helper: add two vectors with int32 wrapping *)
let vec_add ~a:(ax, ay, az) ~b:(bx, by, bz) = w32 (ax + bx), w32 (ay + by), w32 (az + bz)

(* Helper: scale_add2: v += other * s, with int32 wrapping *)
let vec_scale_add2 ~v ~other ~s =
  let scaled = vec_scale ~v:other ~s in
  vec_add ~a:v ~b:scaled
;;

(* Simulate rotational physics for one frame.
   C original: physics.cpp do_physics_sim_rot

   Inputs:
     rotvel     - current rotational velocity (rx, ry, rz)
     rotthrust  - rotational thrust (tx, ty, tz)
     orient     - object orientation matrix ((rx,ry,rz),(ux,uy,uz),(fx,fy,fz))
     drag       - drag coefficient
     mass       - object mass
     flags      - physics flags (PF_USES_THRUST, PF_TURNROLL, PF_FREE_SPINNING)
     turnroll   - current turnroll angle
     frame_time - FrameTime global

   Returns: (new_orient, new_rotvel, new_turnroll)
   Returns None if no rotation needed (all rotvel and rotthrust zero) *)
let do_physics_sim_rot ~rotvel ~rotthrust ~orient ~drag ~mass ~flags ~turnroll ~frame_time
  =
  let rvx, rvy, rvz = rotvel in
  let rtx, rty, rtz = rotthrust in
  (* Early exit if nothing to do *)
  if rvx = 0 && rvy = 0 && rvz = 0 && rtx = 0 && rty = 0 && rtz = 0
  then None
  else (
    (* Apply drag to rotational velocity *)
    let rotvel =
      if drag <> 0
      then (
        let count = frame_time / ft in
        let r = frame_time mod ft in
        let k = Ox_math.fixdiv ~a:r ~b:ft in
        let drag_scaled = drag * 5 / 2 in
        if flags land pf_uses_thrust <> 0
        then (
          let accel = vec_scale ~v:rotthrust ~s:(Ox_math.fixdiv ~a:f1_0 ~b:mass) in
          (* Iterate count times: rotvel += accel; rotvel *= (1 - drag) *)
          let rv = ref rotvel in
          for _ = 1 to count do
            rv := vec_scale ~v:(vec_add ~a:!rv ~b:accel) ~s:(f1_0 - drag_scaled)
          done;
          (* Linear scale on remaining bit *)
          let rv = vec_scale_add2 ~v:!rv ~other:accel ~s:k in
          vec_scale ~v:rv ~s:(f1_0 - Ox_math.fixmul ~a:k ~b:drag_scaled))
        else if flags land pf_free_spinning = 0
        then (
          (* No thrust, not free spinning: just apply drag *)
          let total_drag = ref f1_0 in
          for _ = 1 to count do
            total_drag := Ox_math.fixmul ~a:!total_drag ~b:(f1_0 - drag_scaled)
          done;
          let total_drag =
            Ox_math.fixmul ~a:!total_drag ~b:(f1_0 - Ox_math.fixmul ~a:k ~b:drag_scaled)
          in
          vec_scale ~v:rotvel ~s:total_drag)
        else
          (* Free spinning: no drag applied *)
          rotvel)
      else rotvel
    in
    (* Unrotate for bank caused by turnroll *)
    let orient =
      if turnroll <> 0
      then (
        let rotmat = Ox_math.vm_angles_2_matrix ~v:(0, -turnroll, 0) in
        Ox_math.vm_matrix_x_matrix ~a:orient ~b:rotmat)
      else orient
    in
    (* Apply rotation: tangles = rotvel * FrameTime *)
    let tp =
      Ox_math.fixmul
        ~a:
          (let x, _, _ = rotvel in
           x)
        ~b:frame_time
    in
    let th =
      Ox_math.fixmul
        ~a:
          (let _, y, _ = rotvel in
           y)
        ~b:frame_time
    in
    let tb =
      Ox_math.fixmul
        ~a:
          (let _, _, z = rotvel in
           z)
        ~b:frame_time
    in
    let rotmat = Ox_math.vm_angles_2_matrix ~v:(tp, tb, th) in
    let orient = Ox_math.vm_matrix_x_matrix ~a:orient ~b:rotmat in
    (* Apply turnroll update *)
    let turnroll =
      if flags land pf_turnroll <> 0
      then
        set_object_turnroll
          ~turnroll
          ~rotvel_y:
            (let _, y, _ = rotvel in
             y)
          ~frame_time
      else turnroll
    in
    (* Re-rotate for bank caused by turnroll *)
    let orient =
      if turnroll <> 0
      then (
        let rotmat = Ox_math.vm_angles_2_matrix ~v:(0, turnroll, 0) in
        Ox_math.vm_matrix_x_matrix ~a:orient ~b:rotmat)
      else orient
    in
    (* Fix matrix orthogonality *)
    let orient = check_and_fix_matrix ~orient in
    Some (orient, rotvel, turnroll))
;;

(* Compute world-space gun position by walking bone hierarchy.
   C original: robot.cpp calc_gun_point

   Inputs:
     gun_point    - initial gun position in submodel-local space (vec3)
     start_mn     - starting submodel number for this gun
     anim_angles  - array of (p, b, h) per submodel (MAX_SUBMODELS = 10)
     offsets       - array of vec3 per submodel (submodel_offsets)
     parents       - array of int per submodel (submodel_parents)
     orient        - object orientation matrix
     pos           - object world position

   Returns: world-space gun position (vec3) *)
let calc_gun_point ~gun_point ~start_mn ~anim_angles ~offsets ~parents ~orient ~pos =
  (* Walk up bone hierarchy from gun submodel to root *)
  let pnt = ref gun_point in
  let mn = ref start_mn in
  let n = Array.length anim_angles in
  while !mn <> 0 && !mn > 0 && !mn < n do
    let ap, ab, ah = anim_angles.(!mn) in
    let m = Ox_math.vm_angles_2_matrix ~v:(ap, ab, ah) in
    let m = Ox_math.vm_transpose_matrix ~m in
    let tpnt = Ox_math.vm_vec_rotate ~src:!pnt ~m in
    pnt := Ox_math.vm_vec_add ~a:tpnt ~b:offsets.(!mn);
    mn := parents.(!mn)
  done;
  (* Instance for the entire object *)
  let m = Ox_math.vm_transpose_matrix ~m:orient in
  let rotated = Ox_math.vm_vec_rotate ~src:!pnt ~m in
  Ox_math.vm_vec_add ~a:rotated ~b:pos
;;

(* Apply instantaneous force to object velocity.
   C original: physics.cpp phys_apply_force
   velocity += force_vec * (F1_0 / mass)
   D2 adds mass==0 guard (Omega blobs with 0 mass). *)
let phys_apply_force ~velocity ~force_vec ~mass =
  if mass = 0
  then velocity
  else (
    let scale = Ox_math.fixdiv ~a:f1_0 ~b:mass in
    Ox_math.vm_vec_scale_add2 ~dest:velocity ~src:force_vec ~k:scale)
;;

(* Compute turning rate for rotational whack and apply turn.
   C original: physics.cpp phys_apply_rot (D1 version)

   Inputs:
     force_vec - whack direction (vec3)
     mass      - object mass
     is_robot  - true if obj->type == OBJ_ROBOT
     fvec      - object's forward vector (vec3)
     is_morph  - true if control_type == CT_MORPH
     cur_rotvel - current rotational velocity (vec3)

   Returns: (new_rotvel, set_skip_ai) where set_skip_ai indicates
   that SKIP_AI_COUNT should be set to 2 on the C side. *)
let phys_apply_rot ~force_vec ~mass ~is_robot ~fvec ~is_morph ~cur_rotvel =
  let vecmag = Ox_math.vm_vec_mag ~v:force_vec / 8 in
  if vecmag < f1_0 / 256
  then (
    let rate = 4 * f1_0 in
    let new_rv =
      physics_turn_towards_vector ~goal:force_vec ~fvec ~rate ~is_morph ~cur_rotvel
    in
    new_rv, false)
  else if vecmag < mass asr 14
  then (
    let rate = 4 * f1_0 in
    let new_rv =
      physics_turn_towards_vector ~goal:force_vec ~fvec ~rate ~is_morph ~cur_rotvel
    in
    new_rv, false)
  else (
    let rate = Ox_math.fixdiv ~a:mass ~b:vecmag in
    let rate = if is_robot then max rate (f1_0 / 4) else max rate (f1_0 / 2) in
    let new_rv =
      physics_turn_towards_vector ~goal:force_vec ~fvec ~rate ~is_morph ~cur_rotvel
    in
    new_rv, is_robot)
;;

(* AI turn towards vector — smooth orientation interpolation.
   C original: ai.cpp ai_turn_towards_vector (non-baby-spider path)

   Inputs:
     goal       - target direction vector (vec3)
     fvec       - object's current forward vector (vec3)
     rvec       - object's current right vector (vec3)
     rate       - turning rate (higher = slower turn)
     frame_time - FrameTime global
     seismic_mag - Seismic_tremor_magnitude (D2 only, 0 for D1)
     robot_mass  - Robot_info[id].mass (D2 only, 0 for D1)
     rand_vec    - pre-generated random vector for seismic (D2 only, (0,0,0) for D1)

   Returns: new orientation matrix (rvec, uvec, fvec) as 9 fix values.
   Baby spider check is handled at the C callsite, not here. *)
let ai_turn_towards_vector
      ~goal
      ~fvec
      ~rvec
      ~rate
      ~frame_time
      ~seismic_mag
      ~robot_mass
      ~rand_vec
  =
  let new_fvec =
    let dot = Ox_math.vm_vec_dotprod ~a:goal ~b:fvec in
    if dot < f1_0 - (frame_time / 2)
    then (
      let new_scale = Ox_math.fixdiv ~a:(frame_time * 1) ~b:rate in
      let scaled = Ox_math.vm_vec_scale ~v:goal ~k:new_scale in
      let combined = Ox_math.vm_vec_add ~a:scaled ~b:fvec in
      let mag, normalized = Ox_math.vm_vec_normalize_quick ~v:combined in
      if mag < f1_0 / 256 then goal else normalized)
    else goal
  in
  (* D2 seismic tremor perturbation *)
  let new_fvec =
    if seismic_mag <> 0
    then (
      let scale = Ox_math.fixdiv ~a:(2 * seismic_mag) ~b:robot_mass in
      Ox_math.vm_vec_scale_add2 ~dest:new_fvec ~src:rand_vec ~k:scale)
    else new_fvec
  in
  Ox_math.vm_vector_2_matrix ~fvec:new_fvec ~uvec:None ~rvec:(Some rvec)
;;

(* Compute thrust to maintain current velocity under drag.
   C original: physics.cpp set_thrust_from_velocity

   Inputs:
     mass     - object mass (fix)
     drag     - object drag coefficient (fix)
     velocity - current velocity (vec3)

   Returns: thrust vector (vec3)
   Formula: k = mass * drag / (F1_0 - drag); thrust = velocity * k *)
let set_thrust_from_velocity ~mass ~drag ~velocity =
  let k = Ox_math.fixmuldiv ~a:mass ~b:drag ~c:(f1_0 - drag) in
  Ox_math.vm_vec_copy_scale ~v:velocity ~k
;;

(* AI movement: move robot velocity towards a goal vector.
   C original: ai.cpp move_towards_vector

   D1: always dot-based, no thief/kamikaze
   D2: adds dot_based flag, thief dot adjustment, kamikaze max_speed doubling

   Inputs:
     velocity     - current velocity (vec3)
     vec_goal     - normalized direction to move toward (vec3)
     fvec         - object's forward vector (vec3)
     frame_time   - FrameTime
     difficulty   - Difficulty_level (0-4)
     max_speed    - Robot_info[id].max_speed[Difficulty_level]
     attack_type  - Robot_info[id].attack_type
     dot_based    - D2 flag (D1 always 1)
     is_thief     - D2 robptr->thief flag
     is_kamikaze  - D2 robptr->kamikaze flag

   Returns: new velocity (vec3) *)
let move_towards_vector
      ~velocity
      ~vec_goal
      ~fvec
      ~frame_time
      ~difficulty
      ~max_speed
      ~attack_type
      ~dot_based
      ~is_thief
      ~is_kamikaze
  =
  let vx, vy, vz = velocity in
  let gx, gy, gz = vec_goal in
  (* Normalize velocity and compute dot with fvec *)
  let _mag, vel_norm = Ox_math.vm_vec_normalize_quick ~v:velocity in
  let dot = Ox_math.vm_vec_dotprod ~a:vel_norm ~b:fvec in
  (* D2 thief: bias dot toward 1 *)
  let dot = if is_thief then (f1_0 + dot) / 2 else dot in
  let nvx, nvy, nvz =
    if dot_based && dot < 3 * f1_0 / 4
    then
      (* Bash: halve velocity, add goal * FrameTime * 32 *)
      ( (vx / 2) + Ox_math.fixmul ~a:gx ~b:(frame_time * 32)
      , (vy / 2) + Ox_math.fixmul ~a:gy ~b:(frame_time * 32)
      , (vz / 2) + Ox_math.fixmul ~a:gz ~b:(frame_time * 32) )
    else (
      (* Nudge: add goal * FrameTime * 64 * (difficulty+5)/4 *)
      let scale = frame_time * 64 in
      ( vx + (Ox_math.fixmul ~a:gx ~b:scale * (difficulty + 5) / 4)
      , vy + (Ox_math.fixmul ~a:gy ~b:scale * (difficulty + 5) / 4)
      , vz + (Ox_math.fixmul ~a:gz ~b:scale * (difficulty + 5) / 4) ))
  in
  (* Cap speed *)
  let max_speed =
    if attack_type = 1 || is_thief || is_kamikaze then max_speed * 2 else max_speed
  in
  let speed = Ox_math.vm_vec_mag_quick ~v:(nvx, nvy, nvz) in
  if speed > max_speed then nvx * 3 / 4, nvy * 3 / 4, nvz * 3 / 4 else nvx, nvy, nvz
;;

(* AI movement: move robot velocity around (circling) the player.
   C original: ai.cpp move_around_player

   Inputs:
     velocity       - current velocity (vec3)
     vec_to_player  - direction to player (vec3)
     fvec           - object's forward vector (vec3)
     frame_time     - FrameTime
     frame_count    - FrameCount
     objnum         - object index
     fast_flag      - -1 = normal circle, 0 = no evasion, >0 = fast evasion
     shields        - object shields
     strength       - Robot_info[id].strength (0 guard for D2)
     field_of_view  - Robot_info[id].field_of_view[Difficulty]
     max_speed      - Robot_info[id].max_speed[Difficulty]
     player_cloaked - ConsoleObject->flags & PLAYER_FLAGS_CLOAKED
     skip_objnum1   - D2 flag: skip speed cap if objnum==1

   Returns: new velocity (vec3), or velocity unchanged if fast_flag==0 *)
let move_around_player
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
  =
  if fast_flag = 0
  then velocity
  else (
    let vx, vy, vz = velocity in
    let px, py, pz = vec_to_player in
    (* Compute direction change frequency based on frame_time *)
    let dir_change = ref 48 in
    let ft = ref frame_time in
    let count = ref 0 in
    if !ft < f1_0 / 32
    then (
      dir_change := !dir_change * 8;
      count := !count + 3)
    else
      while !ft < f1_0 / 4 do
        dir_change := !dir_change * 2;
        ft := !ft * 2;
        incr count
      done;
    let dir =
      (frame_count + ((!count + 1) * ((objnum * 8) + (objnum * 4) + objnum)))
      land !dir_change
    in
    let dir = dir asr (4 + !count) in
    let scale = frame_time * 32 in
    let ex, ey, ez =
      match dir with
      | 0 ->
        ( Ox_math.fixmul ~a:pz ~b:scale
        , Ox_math.fixmul ~a:py ~b:scale
        , Ox_math.fixmul ~a:(-px) ~b:scale )
      | 1 ->
        ( Ox_math.fixmul ~a:(-pz) ~b:scale
        , Ox_math.fixmul ~a:py ~b:scale
        , Ox_math.fixmul ~a:px ~b:scale )
      | 2 ->
        ( Ox_math.fixmul ~a:(-py) ~b:scale
        , Ox_math.fixmul ~a:px ~b:scale
        , Ox_math.fixmul ~a:pz ~b:scale )
      | _ ->
        ( Ox_math.fixmul ~a:py ~b:scale
        , Ox_math.fixmul ~a:(-px) ~b:scale
        , Ox_math.fixmul ~a:pz ~b:scale )
    in
    (* Fast evasion scaling *)
    let ex, ey, ez =
      if fast_flag > 0
      then (
        let dot = Ox_math.vm_vec_dotprod ~a:vec_to_player ~b:fvec in
        if dot > field_of_view && not player_cloaked
        then (
          let damage_scale =
            if strength <> 0
            then (
              let ds = Ox_math.fixdiv ~a:shields ~b:strength in
              min ds f1_0 |> max 0)
            else f1_0
          in
          let s = Ox_math.i2f ~a:fast_flag + damage_scale in
          Ox_math.fixmul ~a:ex ~b:s, Ox_math.fixmul ~a:ey ~b:s, Ox_math.fixmul ~a:ez ~b:s)
        else ex, ey, ez)
      else ex, ey, ez
    in
    let nvx = vx + ex
    and nvy = vy + ey
    and nvz = vz + ez in
    let speed = Ox_math.vm_vec_mag_quick ~v:(nvx, nvy, nvz) in
    if ((not skip_objnum1) || objnum <> 1) && speed > max_speed
    then nvx * 3 / 4, nvy * 3 / 4, nvz * 3 / 4
    else nvx, nvy, nvz)
;;

(* AI movement: move robot velocity away from the player.
   C original: ai.cpp move_away_from_player

   Inputs:
     velocity       - current velocity (vec3)
     vec_to_player  - direction to player (vec3)
     uvec           - object's up vector (vec3) (for attack_type juke)
     rvec           - object's right vector (vec3) (for attack_type juke)
     frame_time     - FrameTime
     frame_count    - FrameCount
     objnum         - object index
     attack_type    - Robot_info[id].attack_type
     max_speed      - Robot_info[id].max_speed[Difficulty]

   Returns: new velocity (vec3) *)
let move_away_from_player
      ~velocity
      ~vec_to_player
      ~uvec
      ~rvec
      ~frame_time
      ~frame_count
      ~objnum
      ~attack_type
      ~max_speed
  =
  let vx, vy, vz = velocity in
  let px, py, pz = vec_to_player in
  let nvx = vx - Ox_math.fixmul ~a:px ~b:(frame_time * 16) in
  let nvy = vy - Ox_math.fixmul ~a:py ~b:(frame_time * 16) in
  let nvz = vz - Ox_math.fixmul ~a:pz ~b:(frame_time * 16) in
  let nvx, nvy, nvz =
    if attack_type <> 0
    then (
      let objref = objnum lxor ((frame_count + (3 * objnum)) asr 5) land 3 in
      let scale = frame_time lsl 5 in
      match objref with
      | 0 -> Ox_math.vm_vec_scale_add2 ~dest:(nvx, nvy, nvz) ~src:uvec ~k:scale
      | 1 -> Ox_math.vm_vec_scale_add2 ~dest:(nvx, nvy, nvz) ~src:uvec ~k:(-scale)
      | 2 -> Ox_math.vm_vec_scale_add2 ~dest:(nvx, nvy, nvz) ~src:rvec ~k:scale
      | _ -> Ox_math.vm_vec_scale_add2 ~dest:(nvx, nvy, nvz) ~src:rvec ~k:(-scale))
    else nvx, nvy, nvz
  in
  let speed = Ox_math.vm_vec_mag_quick ~v:(nvx, nvy, nvz) in
  if speed > max_speed then nvx * 3 / 4, nvy * 3 / 4, nvz * 3 / 4 else nvx, nvy, nvz
;;

(* p_rand_step: advance a P_Rand LCG state and return (value, new_state).
   Same LCG as in ox_fvi.ml — duplicated here to avoid circular dependency.
   C original: misc/rand.cpp P_Rand *)
let p_rand_step state =
  let s = Int64.of_int (state land 0xFFFFFFFF) in
  let s = if state < 0 then Int64.(s + 0x100000000L) else s in
  let next = Int64.(to_int_exn (bit_and ((s * 1103515245L) + 12345L) 0xFFFFFFFFL)) in
  let value = (next lsr 16) land 0x7FFF in
  value, next
;;

(* ai_move_relative_to_player: decide and apply AI movement relative to the player.
   C original: main_d1/ai.cpp + main_d2/ai2.cpp ai_move_relative_to_player

   Packed input array layout (56 ints):
     [0-2]    velocity (vx, vy, vz)
     [3-5]    vec_to_player (px, py, pz)
     [6]      dist_to_player
     [7]      circle_distance
     [8]      evade_only
     [9-11]   orient fvec
     [12-14]  orient uvec
     [15-17]  orient rvec
     [18-20]  objp pos
     [21]     objp shields
     [22]     danger_laser_num (-1 if none)
     [23]     danger_laser_signature (ai_info)
     [24]     danger_laser_obj_type
     [25]     danger_laser_obj_signature
     [26-28]  danger_laser_obj_pos
     [29]     danger_laser_obj_render_type (RT_POLYOBJ=1)
     [30-32]  danger_laser_obj_orient_fvec
     [33-35]  danger_laser_obj_velocity
     [36]     robot attack_type
     [37]     robot field_of_view[Diff]
     [38]     robot evade_speed[Diff]
     [39]     robot firing_wait[Diff]
     [40]     robot max_speed[Diff]
     [41]     robot strength
     [42]     ailp next_fire
     [43]     Difficulty_level
     [44]     FrameTime
     [45]     FrameCount
     [46]     objnum
     [47]     Player_is_dead
     [48]     player_cloaked
     [49]     prand_state
     [50]     is_d2
     [51]     player_visibility (D2)
     [52]     game_time_shr18_masked (D2: (GameTime >> 18) & 0x0f)
     [53]     companion (D2)
     [54]     thief (D2)
     [55]     kamikaze (D2)

   Returns array (6 ints):
     [0-2]  new velocity
     [3]    ai_evaded (0 or 1)
     [4]    new_danger_laser_num
     [5]    new_prand_state *)
let ai_move_relative_to_player (packed : int array) =
  let velocity = ref (packed.(0), packed.(1), packed.(2)) in
  let vec_to_player = packed.(3), packed.(4), packed.(5) in
  let dist_to_player = packed.(6) in
  let circle_distance = packed.(7) in
  let evade_only = packed.(8) in
  let fvec = packed.(9), packed.(10), packed.(11) in
  let uvec = packed.(12), packed.(13), packed.(14) in
  let rvec = packed.(15), packed.(16), packed.(17) in
  let objp_pos = packed.(18), packed.(19), packed.(20) in
  let shields = packed.(21) in
  let danger_laser_num = ref packed.(22) in
  let danger_laser_sig = packed.(23) in
  let dl_type = packed.(24) in
  let dl_sig = packed.(25) in
  let dl_pos = packed.(26), packed.(27), packed.(28) in
  let dl_render_type = packed.(29) in
  let dl_fvec = packed.(30), packed.(31), packed.(32) in
  let dl_velocity = packed.(33), packed.(34), packed.(35) in
  let attack_type = packed.(36) in
  let field_of_view = packed.(37) in
  let evade_speed = packed.(38) in
  let firing_wait = packed.(39) in
  let max_speed = packed.(40) in
  let strength = packed.(41) in
  let next_fire = packed.(42) in
  let _difficulty = packed.(43) in
  let frame_time = packed.(44) in
  let frame_count = packed.(45) in
  let objnum = packed.(46) in
  let player_is_dead = packed.(47) <> 0 in
  let player_cloaked = packed.(48) <> 0 in
  let prand_state = ref packed.(49) in
  let is_d2 = packed.(50) <> 0 in
  let player_visibility = packed.(51) in
  let game_time_shr18_masked = packed.(52) in
  let companion = packed.(53) <> 0 in
  let thief = packed.(54) <> 0 in
  let kamikaze = packed.(55) <> 0 in
  let ai_evaded = ref 0 in
  let obj_weapon = 5 in
  let rt_polyobj = 1 in
  (* Helper: call move_around_player with current state *)
  let do_move_around fast_flag =
    velocity
    := move_around_player
         ~velocity:!velocity
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
         ~skip_objnum1:is_d2
  in
  let do_move_away at =
    velocity
    := move_away_from_player
         ~velocity:!velocity
         ~vec_to_player
         ~uvec
         ~rvec
         ~frame_time
         ~frame_count
         ~objnum
         ~attack_type:at
         ~max_speed
  in
  let do_move_towards () =
    velocity
    := move_towards_vector
         ~velocity:!velocity
         ~vec_goal:vec_to_player
         ~fvec
         ~frame_time
         ~difficulty:_difficulty
         ~max_speed
         ~attack_type
         ~dot_based:is_d2
         ~is_thief:thief
         ~is_kamikaze:kamikaze
  in
  let early_return = ref false in
  (* Laser avoidance *)
  if !danger_laser_num <> -1
  then
    if dl_type = obj_weapon && dl_sig = danger_laser_sig
    then (
      let vec_to_laser = Ox_math.vm_vec_sub ~a:dl_pos ~b:objp_pos in
      let dist_to_laser, vec_to_laser_n =
        Ox_math.vm_vec_normalize_quick ~v:vec_to_laser
      in
      let dot = Ox_math.vm_vec_dotprod ~a:vec_to_laser_n ~b:fvec in
      let check = if is_d2 && companion then true else dot > field_of_view in
      if check
      then (
        (* Get laser's direction *)
        let laser_fvec =
          if dl_render_type = rt_polyobj
          then dl_fvec
          else (
            let _mag, nv = Ox_math.vm_vec_normalize_quick ~v:dl_velocity in
            nv)
        in
        let laser_vec_to_robot = Ox_math.vm_vec_sub ~a:objp_pos ~b:dl_pos in
        let _mag, laser_vec_to_robot_n =
          Ox_math.vm_vec_normalize_quick ~v:laser_vec_to_robot
        in
        let laser_robot_dot =
          Ox_math.vm_vec_dotprod ~a:laser_fvec ~b:laser_vec_to_robot_n
        in
        if laser_robot_dot > f1_0 * 7 / 8 && dist_to_laser < f1_0 * 80
        then (
          ai_evaded := 1;
          do_move_around evade_speed));
      early_return := true
      (* else: type/sig mismatch, fall through *));
  if not !early_return
  then (
    (* Evade-only check *)
    let evade_only_return =
      if attack_type = 0 && (not (is_d2 && thief)) && evade_only <> 0 then true else false
    in
    if not evade_only_return
    then (
      (* Clear danger laser *)
      danger_laser_num := -1;
      (* Movement selection *)
      if attack_type = 1
      then
        if
          (* Green guy *)
          (next_fire > firing_wait / 4 && dist_to_player < f1_0 * 30) || player_is_dead
        then (
          let rval, new_state = p_rand_step !prand_state in
          prand_state := new_state;
          if rval < 8192 then do_move_around (-1) else do_move_away 1)
        else do_move_towards ()
      else if is_d2 && thief
      then do_move_towards ()
      else if is_d2 && kamikaze
      then do_move_towards ()
      else if dist_to_player < circle_distance
      then do_move_away 0
      else if is_d2
      then (
        let objval = objnum land 0x0f lxor 0x0a in
        if dist_to_player < (3 + objval) * circle_distance / 2 && next_fire > -f1_0
        then do_move_around (-1)
        else if -next_fire > f1_0 + (objval lsl 12) && player_visibility <> 0
        then
          if game_time_shr18_masked lxor objval > 4
          then do_move_away 0
          else do_move_around (-1)
        else do_move_towards ())
      else if dist_to_player < circle_distance * 2
      then do_move_around (-1)
      else do_move_towards ())
    else danger_laser_num := -1);
  let vx, vy, vz = !velocity in
  let result = Array.create ~len:6 0 in
  result.(0) <- vx;
  result.(1) <- vy;
  result.(2) <- vz;
  result.(3) <- !ai_evaded;
  result.(4) <- !danger_laser_num;
  result.(5) <- !prand_state;
  result
;;

(* ai_frame_animation: interpolate robot joint angles toward goal angles.
   C original: main_d1/ai.cpp + main_d2/ai2.cpp ai_frame_animation
   Identical in D1 and D2. DELTA_ANG_SCALE = 16.

   Packed input array (2 + 9*N ints, where N = num_joints - 1):
     [0]   num_joints (from Polygon_models[model_num].n_models)
     [1]   FrameTime
     [2 + i*9 .. 2 + i*9 + 8] per joint i (0-indexed, representing joint i+1):
       cur_p, cur_b, cur_h, goal_p, goal_b, goal_h, delta_p, delta_b, delta_h

   Returns array (3*N ints):
     per joint i: new_cur_p, new_cur_b, new_cur_h *)
let ai_frame_animation (packed : int array) =
  let num_joints = packed.(0) in
  let frame_time = packed.(1) in
  let delta_ang_scale = 16 in
  let n = num_joints - 1 in
  let result = Array.create ~len:(n * 3) 0 in
  for i = 0 to n - 1 do
    let base = 2 + (i * 9) in
    let cur_p = ref packed.(base) in
    let cur_b = ref packed.(base + 1) in
    let cur_h = ref packed.(base + 2) in
    let goal_p = packed.(base + 3) in
    let goal_b = packed.(base + 4) in
    let goal_h = packed.(base + 5) in
    let delta_p = packed.(base + 6) in
    let delta_b = packed.(base + 7) in
    let delta_h = packed.(base + 8) in
    (* Interpolate pitch *)
    let dtg = goal_p - !cur_p in
    let dtg =
      if dtg > 32767 then dtg - 65536 else if dtg < -32767 then 65536 + dtg else dtg
    in
    if dtg <> 0
    then (
      let sda = Ox_math.fixmul ~a:delta_p ~b:frame_time * delta_ang_scale in
      cur_p := !cur_p + sda;
      if Int.abs dtg < Int.abs sda then cur_p := goal_p);
    (* Interpolate bank *)
    let dtg = goal_b - !cur_b in
    let dtg =
      if dtg > 32767 then dtg - 65536 else if dtg < -32767 then 65536 + dtg else dtg
    in
    if dtg <> 0
    then (
      let sda = Ox_math.fixmul ~a:delta_b ~b:frame_time * delta_ang_scale in
      cur_b := !cur_b + sda;
      if Int.abs dtg < Int.abs sda then cur_b := goal_b);
    (* Interpolate heading *)
    let dtg = goal_h - !cur_h in
    let dtg =
      if dtg > 32767 then dtg - 65536 else if dtg < -32767 then 65536 + dtg else dtg
    in
    if dtg <> 0
    then (
      let sda = Ox_math.fixmul ~a:delta_h ~b:frame_time * delta_ang_scale in
      cur_h := !cur_h + sda;
      if Int.abs dtg < Int.abs sda then cur_h := goal_h);
    result.(i * 3) <- !cur_p;
    result.((i * 3) + 1) <- !cur_b;
    result.((i * 3) + 2) <- !cur_h
  done;
  result
;;

(* ai_path_set_orient_and_vel: compute velocity and orientation for path-following robots.
   C original: main_d1/aipath.cpp + main_d2/aipath.cpp ai_path_set_orient_and_vel

   Packed input array (27 ints):
     [0-2]    velocity (vx, vy, vz)
     [3-5]    objp pos (x, y, z)
     [6-8]    orient fvec (x, y, z)
     [9-11]   orient rvec (x, y, z)
     [12-14]  goal_point (x, y, z)
     [15]     max_speed (Robot_info[id].max_speed[Difficulty])
     [16]     turn_time_difficulty (Robot_info[id].turn_time[Difficulty])
     [17]     turn_time_max (Robot_info[id].turn_time[NDL-1])
     [18]     ailp_mode
     [19]     FrameTime
     [20]     is_d2
     [21]     behavior (aip->behavior, D2 only)
     [22]     companion (D2 only)
     [23]     player_visibility (D2 only)
     [24-26]  vec_to_player (D2 only, for snipe retreat)

   Returns array (12 ints):
     [0-2]    new velocity
     [3-11]   new orient (rvec, uvec, fvec) *)
let ai_path_set_orient_and_vel (packed : int array) =
  let velocity = packed.(0), packed.(1), packed.(2) in
  let cur_pos = packed.(3), packed.(4), packed.(5) in
  let fvec = packed.(6), packed.(7), packed.(8) in
  let rvec = packed.(9), packed.(10), packed.(11) in
  let goal_point = packed.(12), packed.(13), packed.(14) in
  let max_speed_base = packed.(15) in
  let turn_time_diff = packed.(16) in
  let turn_time_max = packed.(17) in
  let ailp_mode = packed.(18) in
  let frame_time = packed.(19) in
  let is_d2 = packed.(20) <> 0 in
  let behavior = packed.(21) in
  let companion = packed.(22) <> 0 in
  let player_visibility = packed.(23) in
  let vec_to_player = packed.(24), packed.(25), packed.(26) in
  let aim_run_from_object = 4 in
  let aim_snipe_retreat_backwards = 13 in
  let aib_snipe = 4 in
  (* If evading or sniping, use higher speed *)
  let max_speed =
    if ailp_mode = aim_run_from_object || (is_d2 && behavior = aib_snipe)
    then max_speed_base * 3 / 2
    else max_speed_base
  in
  (* Compute normalized direction to goal *)
  let vec_to_goal = Ox_math.vm_vec_sub ~a:goal_point ~b:cur_pos in
  let _mag, norm_vec_to_goal = Ox_math.vm_vec_normalize_quick ~v:vec_to_goal in
  (* Normalize current velocity *)
  let _mag, norm_cur_vel = Ox_math.vm_vec_normalize_quick ~v:velocity in
  (* Normalize fvec *)
  let _mag, norm_fvec = Ox_math.vm_vec_normalize_quick ~v:fvec in
  (* Dot product of goal direction vs facing *)
  let dot = Ox_math.vm_vec_dotprod ~a:norm_vec_to_goal ~b:norm_fvec in
  (* If nearly facing opposite direction, snap velocity to goal *)
  let ncvx, ncvy, ncvz =
    if dot < -15 * f1_0 / 16
    then norm_vec_to_goal
    else (
      let nvx, nvy, nvz = norm_cur_vel in
      let gx, gy, gz = norm_vec_to_goal in
      nvx + (gx / 2), nvy + (gy / 2), nvz + (gz / 2))
  in
  let _mag, norm_cur_vel_final = Ox_math.vm_vec_normalize_quick ~v:(ncvx, ncvy, ncvz) in
  (* Speed scaling based on dot *)
  let dot = if dot < 0 then dot / -4 else dot in
  (* D2 snipe mode: bias dot toward F1_0 *)
  let dot =
    if is_d2 && behavior = aib_snipe && dot < f1_0 / 2 then (dot + f1_0) / 2 else dot
  in
  let speed_scale = Ox_math.fixmul ~a:max_speed ~b:dot in
  let new_vel = Ox_math.vm_vec_scale ~v:norm_cur_vel_final ~k:speed_scale in
  (* Determine turn rate and goal for ai_turn_towards_vector *)
  let turn_goal, turn_rate =
    if
      ailp_mode = aim_run_from_object
      || (is_d2 && companion)
      || (is_d2 && behavior = aib_snipe)
    then (
      let goal =
        if is_d2 && ailp_mode = aim_snipe_retreat_backwards
        then
          if player_visibility <> 0
          then vec_to_player
          else (
            let gx, gy, gz = norm_vec_to_goal in
            -gx, -gy, -gz)
        else norm_vec_to_goal
      in
      goal, turn_time_max / 2)
    else norm_vec_to_goal, turn_time_diff
  in
  (* Call ai_turn_towards_vector to compute new orientation *)
  let new_orient =
    ai_turn_towards_vector
      ~goal:turn_goal
      ~fvec
      ~rvec
      ~rate:turn_rate
      ~frame_time
      ~seismic_mag:0
      ~robot_mass:0
      ~rand_vec:(0, 0, 0)
  in
  let nvx, nvy, nvz = new_vel in
  let (nrx, nry, nrz), (nux, nuy, nuz), (nfx, nfy, nfz) = new_orient in
  let result = Array.create ~len:12 0 in
  result.(0) <- nvx;
  result.(1) <- nvy;
  result.(2) <- nvz;
  result.(3) <- nrx;
  result.(4) <- nry;
  result.(5) <- nrz;
  result.(6) <- nux;
  result.(7) <- nuy;
  result.(8) <- nuz;
  result.(9) <- nfx;
  result.(10) <- nfy;
  result.(11) <- nfz;
  result
;;

(* set_object_turnroll: compute new turnroll (banking angle) based on rotvel.y.
   C original: physics.cpp set_object_turnroll
   Constants: TURNROLL_SCALE = 0x4ec4/2, ROLL_RATE = 0x2000.
   Inputs:
     rotvel_y   - y component of rotational velocity
     turnroll   - current turnroll angle (fixang, wraps at 16 bits)
     frame_time - FrameTime
   Returns: new turnroll value *)
let set_object_turnroll ~rotvel_y ~turnroll ~frame_time =
  let turnroll_scale = 0x4ec4 / 2 in
  let roll_rate = 0x2000 in
  let desired_bank = -Ox_math.fixmul ~a:rotvel_y ~b:turnroll_scale in
  if turnroll <> desired_bank
  then (
    let max_roll = Ox_math.fixmul ~a:roll_rate ~b:frame_time in
    let delta_ang = desired_bank - turnroll in
    let max_roll =
      if Int.abs delta_ang < max_roll
      then delta_ang
      else if delta_ang < 0
      then -max_roll
      else max_roll
    in
    turnroll + max_roll)
  else turnroll
;;

(* compute_lead_component: compute one axis of lead firing vector.
   C original: ai2.cpp compute_lead_component (D2 only)
   Returns: fixdiv(player_pos - robot_pos, elapsed_time) + player_vel *)
let compute_lead_component ~player_pos ~robot_pos ~player_vel ~elapsed_time =
  Ox_math.fixdiv ~a:(player_pos - robot_pos) ~b:elapsed_time + player_vel
;;

(* lead_player: compute lead firing solution for AI robot targeting.
   C original: ai2.cpp lead_player (D2 only)
   All globals/struct data extracted at callsite.
   Inputs:
     fire_point        - robot's gun position (vec3)
     believed_player_pos - where robot thinks player is (vec3)
     player_velocity   - player's velocity (vec3)
     fvec              - robot's forward vector (vec3)
     player_cloaked    - is player cloaked?
     max_weapon_speed  - weapon speed at difficulty level
     is_matter         - is it a matter weapon?
     difficulty_level  - current difficulty (0..4)
   Returns: None if can't lead, Some fire_vec if successful *)
let lead_player
      ~fire_point
      ~believed_player_pos
      ~player_velocity
      ~fvec
      ~player_cloaked
      ~max_weapon_speed
      ~is_matter
      ~difficulty_level
  =
  let ndl = 5 in
  let min_lead_speed = f1_0 * 4 in
  let max_lead_distance = f1_0 * 200 in
  let lead_range = f1_0 / 2 in
  if player_cloaked
  then None
  else (
    let pvx, pvy, pvz = player_velocity in
    let _mag, player_movement_dir = Ox_math.vm_vec_normalize_quick ~v:(pvx, pvy, pvz) in
    let player_speed = Ox_math.vm_vec_mag_quick ~v:(pvx, pvy, pvz) in
    if player_speed < min_lead_speed
    then None
    else (
      let vec_to_player = Ox_math.vm_vec_sub ~a:believed_player_pos ~b:fire_point in
      let _mag, vec_to_player_norm = Ox_math.vm_vec_normalize_quick ~v:vec_to_player in
      let dist_to_player = Ox_math.vm_vec_mag_quick ~v:vec_to_player in
      if dist_to_player > max_lead_distance
      then None
      else (
        let dot = Ox_math.vm_vec_dotprod ~a:vec_to_player_norm ~b:player_movement_dir in
        if dot < -lead_range || dot > lead_range
        then None
        else if max_weapon_speed < f1_0
        then None
        else (
          let max_weapon_speed =
            if is_matter
            then
              if difficulty_level <= 1
              then 0
              else max_weapon_speed * (ndl - difficulty_level)
            else max_weapon_speed
          in
          if max_weapon_speed = 0
          then None
          else (
            let fpx, fpy, fpz = fire_point in
            let bpx, bpy, bpz = believed_player_pos in
            let projected_time = Ox_math.fixdiv ~a:dist_to_player ~b:max_weapon_speed in
            let fvx =
              compute_lead_component
                ~player_pos:bpx
                ~robot_pos:fpx
                ~player_vel:pvx
                ~elapsed_time:projected_time
            in
            let fvy =
              compute_lead_component
                ~player_pos:bpy
                ~robot_pos:fpy
                ~player_vel:pvy
                ~elapsed_time:projected_time
            in
            let fvz =
              compute_lead_component
                ~player_pos:bpz
                ~robot_pos:fpz
                ~player_vel:pvz
                ~elapsed_time:projected_time
            in
            let _mag, fire_vec = Ox_math.vm_vec_normalize_quick ~v:(fvx, fvy, fvz) in
            let fvx, fvy, fvz = fire_vec in
            let dot_fvec = Ox_math.vm_vec_dotprod ~a:fire_vec ~b:fvec in
            if dot_fvec < f1_0 / 2
            then (
              let ax, ay, az = Ox_math.vm_vec_add ~a:fire_vec ~b:vec_to_player_norm in
              let adjusted = ax / 2, ay / 2, az / 2 in
              let dot2 = Ox_math.vm_vec_dotprod ~a:adjusted ~b:fvec in
              if dot2 < f1_0 / 2 then None else Some adjusted)
            else Some (fvx, fvy, fvz))))))
;;

(* homing_missile_turn_towards_velocity:
   Blend normalized velocity into forward vector and re-derive orientation.
   C original: laser.cpp homing_missile_turn_towards_velocity
   HOMING_MISSILE_SCALE = 8, identical in D1 and D2 *)
let homing_missile_turn_towards_velocity ~norm_vel ~fvec ~frame_time =
  let homing_missile_scale = 8 in
  let nvx, nvy, nvz = norm_vel in
  let s = frame_time * homing_missile_scale in
  let new_fvec =
    Ox_math.vm_vec_add
      ~a:
        ( Ox_math.fixmul ~a:nvx ~b:s
        , Ox_math.fixmul ~a:nvy ~b:s
        , Ox_math.fixmul ~a:nvz ~b:s )
      ~b:fvec
  in
  let _mag, new_fvec_n = Ox_math.vm_vec_normalize_quick ~v:new_fvec in
  Ox_math.vm_vector_2_matrix ~fvec:new_fvec_n ~uvec:None ~rvec:None
;;

(* Align object orientation to the segment it's in.
   C original: physics.cpp do_physics_align_object

   Banks the player according to segment orientation by finding
   the side most aligned with the up vector, computing the roll
   angle needed, and applying a damped roll.

   Inputs (packed array of 54 ints):
     [0..17]   6 side normals[0] (6 × 3 fix values)
     [18..35]  6 side normals[1] (6 × 3 fix values)
     [36..41]  num_faces per side (6 ints)
     [42..50]  orient (rx,ry,rz, ux,uy,uz, fx,fy,fz)
     [51]      turnroll
     [52]      floor_levelling (0 or 1)
     [53]      FrameTime

   Returns: (orient_changed, new_orient, new_floor_levelling)
     orient_changed = true if orientation was modified
     new_floor_levelling = false if levelling completed *)
let do_physics_align_object (packed : int array) =
  let damp_ang = 0x400 in
  (* Unpack side normals *)
  let side_normal0 i =
    let base = i * 3 in
    packed.(base), packed.(base + 1), packed.(base + 2)
  in
  let side_normal1 i =
    let base = 18 + (i * 3) in
    packed.(base), packed.(base + 1), packed.(base + 2)
  in
  let num_faces i = packed.(36 + i) in
  let orient =
    ( (packed.(42), packed.(43), packed.(44))
    , (packed.(45), packed.(46), packed.(47))
    , (packed.(48), packed.(49), packed.(50)) )
  in
  let turnroll = packed.(51) in
  let floor_levelling = packed.(52) <> 0 in
  let frame_time = packed.(53) in
  let _rvec, uvec, fvec = orient in
  (* Find side most aligned with up vector *)
  let best_side = ref 0 in
  let largest_d = ref (-f1_0) in
  for i = 0 to 5 do
    let d = Ox_math.vm_vec_dotprod ~a:(side_normal0 i) ~b:uvec in
    if d > !largest_d
    then (
      largest_d := d;
      best_side := i)
  done;
  (* Determine desired up vector *)
  let desired_upvec =
    if floor_levelling
    then
      (* Old way: use floor's normal (side 3) *)
      side_normal0 3
    else if num_faces !best_side = 2
    then (
      (* Average the two normals *)
      let n0x, n0y, n0z = side_normal0 !best_side in
      let n1x, n1y, n1z = side_normal1 !best_side in
      let avg = (n0x + n1x) / 2, (n0y + n1y) / 2, (n0z + n1z) / 2 in
      let _mag, normalized = Ox_math.vm_vec_copy_normalize ~v:avg in
      normalized)
    else side_normal0 !best_side
  in
  (* Check if desired_upvec is not too parallel to fvec *)
  let fixang v = Ox_math.wrap_i32_to_fixang v in
  if Int.abs (Ox_math.vm_vec_dotprod ~a:desired_upvec ~b:fvec) < f1_0 / 2
  then (
    let temp_matrix =
      Ox_math.vm_vector_2_matrix ~fvec ~uvec:(Some desired_upvec) ~rvec:None
    in
    let _temp_rvec, temp_uvec, _temp_fvec = temp_matrix in
    (* C uses fixang (int16_t) for delta_ang and roll_ang *)
    let delta_ang = Ox_math.vm_vec_delta_ang ~v0:uvec ~v1:temp_uvec ~fvec:(Some fvec) in
    let delta_ang = fixang (delta_ang + turnroll) in
    if Int.abs delta_ang > damp_ang
    then (
      let roll_ang = fixang (Ox_math.fixmul ~a:frame_time ~b:roll_rate) in
      let roll_ang =
        if Int.abs delta_ang < roll_ang
        then delta_ang
        else if delta_ang < 0
        then -roll_ang
        else roll_ang
      in
      let rotmat = Ox_math.vm_angles_2_matrix ~v:(0, roll_ang, 0) in
      let new_orient = Ox_math.vm_matrix_x_matrix ~a:orient ~b:rotmat in
      true, new_orient, floor_levelling)
    else
      (* Delta is small enough: stop levelling *)
      false, orient, false)
  else
    (* desired_upvec too parallel to fvec: no change *)
    false, orient, floor_levelling
;;

(* do_silly_animation: compute goal and delta angles for robot animation joints.
   C original: main_d1/ai.cpp + main_d2/ai2.cpp do_silly_animation
   D1 and D2 are identical.

   Packed input array layout:
     [0]   num_guns
     [1]   flinch_attack_scale (pre-computed: 1, Attack_scale=24, or Flinch_scale=4)
     [2]   model_n_models (for jointnum bounds check)
     [3..3+num_guns]  n_joints_per_gun[g] for g = 0..num_guns  (num_guns+1 entries)

     Then joint entries, grouped by gun, each 4 ints:
       jointnum, target_p, target_b, target_h

     Then current anim_angles for joints 0..model_n_models-1:
       model_n_models * 3 ints (p, b, h)

     Then current goal_angles for joints 0..model_n_models-1:
       model_n_models * 3 ints (p, b, h)

     Then current delta_angles for joints 0..model_n_models-1:
       model_n_models * 3 ints (p, b, h)

     Then current achieved_state[0..num_guns]: (num_guns+1) ints
     Then current goal_state[0..num_guns]: (num_guns+1) ints

   Returns packed array:
     [0]  at_goal (0 or 1, if 1 caller sets CURRENT_STATE = GOAL_STATE)
     Then goal_angles for joints 0..model_n_models-1: model_n_models * 3 ints
     Then delta_angles for joints 0..model_n_models-1: model_n_models * 3 ints
     Then achieved_state[0..num_guns]: (num_guns+1) ints
     Then goal_state[0..num_guns]: (num_guns+1) ints *)
let do_silly_animation (packed : int array) =
  let anim_rate = f1_0 / 16 in
  let delta_ang_scale = 16 in
  let ais_reco = 6 in
  let ais_fire = 5 in
  let ais_flin = 4 in
  let ais_lock = 3 in
  let num_guns = packed.(0) in
  let flinch_attack_scale = packed.(1) in
  let model_n_models = packed.(2) in
  let n_guns_plus_1 = num_guns + 1 in
  (* Read n_joints per gun *)
  let n_joints_per_gun = Array.init n_guns_plus_1 ~f:(fun g -> packed.(3 + g)) in
  (* Joint entries start after n_joints_per_gun *)
  let joints_base = 3 + n_guns_plus_1 in
  let total_joints =
    let sum = ref 0 in
    Array.iter n_joints_per_gun ~f:(fun n -> sum := !sum + n);
    !sum
  in
  (* Current anim/goal/delta angles base offsets *)
  let anim_base = joints_base + (total_joints * 4) in
  let goal_base = anim_base + (model_n_models * 3) in
  let delta_base = goal_base + (model_n_models * 3) in
  let achieved_base = delta_base + (model_n_models * 3) in
  let gstate_base = achieved_base + n_guns_plus_1 in
  (* Mutable copies of goal_angles, delta_angles, achieved_state, goal_state *)
  let goal_angles =
    Array.init (model_n_models * 3) ~f:(fun i -> packed.(goal_base + i))
  in
  let delta_angles =
    Array.init (model_n_models * 3) ~f:(fun i -> packed.(delta_base + i))
  in
  let achieved_state =
    Array.init n_guns_plus_1 ~f:(fun i -> packed.(achieved_base + i))
  in
  let goal_state = Array.init n_guns_plus_1 ~f:(fun i -> packed.(gstate_base + i)) in
  let at_goal = ref 1 in
  let joint_offset = ref 0 in
  for gun_num = 0 to num_guns do
    let n_joints = n_joints_per_gun.(gun_num) in
    for j = 0 to n_joints - 1 do
      let base = joints_base + ((!joint_offset + j) * 4) in
      let jointnum = packed.(base) in
      let target_p = packed.(base + 1) in
      let target_b = packed.(base + 2) in
      let target_h = packed.(base + 3) in
      if jointnum < model_n_models
      then (
        let cur_p = packed.(anim_base + (jointnum * 3)) in
        let cur_b = packed.(anim_base + (jointnum * 3) + 1) in
        let cur_h = packed.(anim_base + (jointnum * 3) + 2) in
        (* Process pitch *)
        if target_p <> cur_p
        then (
          if gun_num = 0 then at_goal := 0;
          goal_angles.(jointnum * 3) <- target_p;
          let delta_angle = target_p - cur_p in
          let delta_2 =
            if delta_angle >= f1_0 / 2
            then -anim_rate
            else if delta_angle >= 0
            then anim_rate
            else if delta_angle >= -(f1_0 / 2)
            then -anim_rate
            else anim_rate
          in
          let delta_2 =
            if flinch_attack_scale <> 1 then delta_2 * flinch_attack_scale else delta_2
          in
          delta_angles.(jointnum * 3) <- delta_2 / delta_ang_scale);
        (* Process bank *)
        if target_b <> cur_b
        then (
          if gun_num = 0 then at_goal := 0;
          goal_angles.((jointnum * 3) + 1) <- target_b;
          let delta_angle = target_b - cur_b in
          let delta_2 =
            if delta_angle >= f1_0 / 2
            then -anim_rate
            else if delta_angle >= 0
            then anim_rate
            else if delta_angle >= -(f1_0 / 2)
            then -anim_rate
            else anim_rate
          in
          let delta_2 =
            if flinch_attack_scale <> 1 then delta_2 * flinch_attack_scale else delta_2
          in
          delta_angles.((jointnum * 3) + 1) <- delta_2 / delta_ang_scale);
        (* Process heading *)
        if target_h <> cur_h
        then (
          if gun_num = 0 then at_goal := 0;
          goal_angles.((jointnum * 3) + 2) <- target_h;
          let delta_angle = target_h - cur_h in
          let delta_2 =
            if delta_angle >= f1_0 / 2
            then -anim_rate
            else if delta_angle >= 0
            then anim_rate
            else if delta_angle >= -(f1_0 / 2)
            then -anim_rate
            else anim_rate
          in
          let delta_2 =
            if flinch_attack_scale <> 1 then delta_2 * flinch_attack_scale else delta_2
          in
          delta_angles.((jointnum * 3) + 2) <- delta_2 / delta_ang_scale))
    done;
    if !at_goal <> 0
    then (
      achieved_state.(gun_num) <- goal_state.(gun_num);
      if achieved_state.(gun_num) = ais_reco then goal_state.(gun_num) <- ais_fire;
      if achieved_state.(gun_num) = ais_flin then goal_state.(gun_num) <- ais_lock);
    joint_offset := !joint_offset + n_joints
  done;
  (* Build output *)
  let out_len = 1 + (model_n_models * 6) + (n_guns_plus_1 * 2) in
  let result = Array.create ~len:out_len 0 in
  result.(0) <- !at_goal;
  Array.blit ~src:goal_angles ~src_pos:0 ~dst:result ~dst_pos:1 ~len:(model_n_models * 3);
  Array.blit
    ~src:delta_angles
    ~src_pos:0
    ~dst:result
    ~dst_pos:(1 + (model_n_models * 3))
    ~len:(model_n_models * 3);
  Array.blit
    ~src:achieved_state
    ~src_pos:0
    ~dst:result
    ~dst_pos:(1 + (model_n_models * 6))
    ~len:n_guns_plus_1;
  Array.blit
    ~src:goal_state
    ~src_pos:0
    ~dst:result
    ~dst_pos:(1 + (model_n_models * 6) + n_guns_plus_1)
    ~len:n_guns_plus_1;
  result
;;

(* do_physics_drag — velocity integration with thrust and drag.
   Extracted from do_physics_sim (physics.cpp). Identical in D1 and D2.
   Called once per physics object per frame (50-100+ calls/frame).

   FT = f1_0/64 = 1024
   PF_USES_THRUST = 0x40

   Packed input (11 ints):
     0-2: velocity (vx, vy, vz)
     3-5: thrust (tx, ty, tz)
     6:   drag
     7:   mass
     8:   phys_flags
     9:   sim_time (FrameTime)
   Returns array (3 ints): new velocity (vx, vy, vz) *)
let do_physics_drag (packed : int array) =
  let ft = f1_0 / 64 in
  let pf_uses_thrust = 0x40 in
  let vx = ref packed.(0) in
  let vy = ref packed.(1) in
  let vz = ref packed.(2) in
  let tx = packed.(3) in
  let ty = packed.(4) in
  let tz = packed.(5) in
  let drag = packed.(6) in
  let mass = packed.(7) in
  let phys_flags = packed.(8) in
  let sim_time = packed.(9) in
  let count = ref (sim_time / ft) in
  let r = sim_time mod ft in
  let k = Ox_math.fixdiv ~a:r ~b:ft in
  if phys_flags land pf_uses_thrust <> 0
  then (
    (* accel = thrust / mass *)
    let inv_mass = Ox_math.fixdiv ~a:f1_0 ~b:mass in
    let ax = Ox_math.fixmul ~a:tx ~b:inv_mass in
    let ay = Ox_math.fixmul ~a:ty ~b:inv_mass in
    let az = Ox_math.fixmul ~a:tz ~b:inv_mass in
    let one_minus_drag = f1_0 - drag in
    while !count > 0 do
      (* vel += accel; vel *= (1 - drag) — wrap addition to 32-bit like C *)
      vx := Ox_math.fixmul ~a:(w32 (!vx + ax)) ~b:one_minus_drag;
      vy := Ox_math.fixmul ~a:(w32 (!vy + ay)) ~b:one_minus_drag;
      vz := Ox_math.fixmul ~a:(w32 (!vz + az)) ~b:one_minus_drag;
      count := !count - 1
    done;
    (* Linear remainder: vel += accel*k; vel *= (1 - k*drag) *)
    let k_accel_x = Ox_math.fixmul ~a:ax ~b:k in
    let k_accel_y = Ox_math.fixmul ~a:ay ~b:k in
    let k_accel_z = Ox_math.fixmul ~a:az ~b:k in
    let one_minus_k_drag = f1_0 - Ox_math.fixmul ~a:k ~b:drag in
    vx := Ox_math.fixmul ~a:(w32 (!vx + k_accel_x)) ~b:one_minus_k_drag;
    vy := Ox_math.fixmul ~a:(w32 (!vy + k_accel_y)) ~b:one_minus_k_drag;
    vz := Ox_math.fixmul ~a:(w32 (!vz + k_accel_z)) ~b:one_minus_k_drag)
  else (
    (* No thrust: just accumulate drag *)
    let total_drag = ref f1_0 in
    let one_minus_drag = f1_0 - drag in
    while !count > 0 do
      total_drag := Ox_math.fixmul ~a:!total_drag ~b:one_minus_drag;
      count := !count - 1
    done;
    let one_minus_k_drag = f1_0 - Ox_math.fixmul ~a:k ~b:drag in
    total_drag := Ox_math.fixmul ~a:!total_drag ~b:one_minus_k_drag;
    vx := Ox_math.fixmul ~a:!vx ~b:!total_drag;
    vy := Ox_math.fixmul ~a:!vy ~b:!total_drag;
    vz := Ox_math.fixmul ~a:!vz ~b:!total_drag);
  [| !vx; !vy; !vz |]
;;

(* do_homing_weapon_frame:
   Pure velocity/orientation computation for homing missiles.
   Extracted from Laser_do_weapon_sequence (laser.cpp).
   Called each frame for each homing missile with a valid track_goal.

   Packed input (15 ints):
     0-2: obj velocity (x,y,z)
     3-5: vector_to_object (target_pos - obj_pos, pre-computed on C side)
     6:   max_speed (Weapon_info[id].speed[Difficulty_level])
     7:   FrameTime
     8:   is_polymodel (render_type == WEAPON_RENDER_POLYMODEL ? 1 : 0)
     9:   is_d2 (0=D1, 1=D2)
     10:  dot (D2: from track_track_goal; D1: ignored, computed inline)
     11-13: orient fvec (for homing_missile_turn_towards_velocity)

   Output (14 ints):
     0-2: new velocity (x,y,z)
     3:   lifeleft_delta (negative, subtract from lifeleft)
     4:   orient_updated (1 if orientation changed, 0 otherwise)
     5-13: new orient matrix (rx,ry,rz, ux,uy,uz, fx,fy,fz) — valid only if orient_updated=1 *)
let do_homing_weapon_frame (packed : int array) =
  let vx = packed.(0) in
  let vy = packed.(1) in
  let vz = packed.(2) in
  let vto_x = packed.(3) in
  let vto_y = packed.(4) in
  let vto_z = packed.(5) in
  let max_speed = packed.(6) in
  let frame_time = packed.(7) in
  let is_polymodel = packed.(8) <> 0 in
  let is_d2 = packed.(9) <> 0 in
  let dot_in = packed.(10) in
  let fvec_x = packed.(11) in
  let fvec_y = packed.(12) in
  let fvec_z = packed.(13) in
  (* Normalize vector_to_object *)
  let _mag_vto, vto_n = Ox_math.vm_vec_normalize_quick ~v:(vto_x, vto_y, vto_z) in
  let vto_nx, vto_ny, vto_nz = vto_n in
  (* Normalize velocity to get temp_vec and speed *)
  let speed, temp_vec = Ox_math.vm_vec_normalize_quick ~v:(vx, vy, vz) in
  let tx, ty, tz = temp_vec in
  (* Speed up if below max *)
  let speed =
    if speed + f1_0 < max_speed
    then (
      let s = speed + Ox_math.fixmul ~a:max_speed ~b:(frame_time / 2) in
      if s > max_speed then max_speed else s)
    else speed
  in
  (* D1: compute dot inline; D2: use dot from track_track_goal *)
  let dot = if is_d2 then dot_in else Ox_math.vm_vec_dotprod ~a:(tx, ty, tz) ~b:vto_n in
  (* Blend: temp_vec += vector_to_object (once for polymodel, twice for non-polymodel) *)
  let tx = tx + vto_nx in
  let ty = ty + vto_ny in
  let tz = tz + vto_nz in
  let tx, ty, tz =
    if not is_polymodel then tx + vto_nx, ty + vto_ny, tz + vto_nz else tx, ty, tz
  in
  (* Normalize and scale by speed *)
  let _mag, norm_vel = Ox_math.vm_vec_normalize_quick ~v:(tx, ty, tz) in
  let nvx, nvy, nvz = norm_vel in
  let new_vx = Ox_math.fixmul ~a:nvx ~b:speed in
  let new_vy = Ox_math.fixmul ~a:nvy ~b:speed in
  let new_vz = Ox_math.fixmul ~a:nvz ~b:speed in
  (* Life loss computation *)
  let absdot = Int.abs (f1_0 - dot) in
  let lifeleft_delta =
    if is_d2
    then
      (* D2: always apply, multiplier 32 *)
      ~-(Ox_math.fixmul ~a:(absdot * 32) ~b:frame_time)
    else if
      (* D1: threshold F1_0/8, clamp to F1_0/4, multiplier 16 *)
      absdot > f1_0 / 8
    then (
      let absdot = min absdot (f1_0 / 4) in
      ~-(Ox_math.fixmul ~a:(absdot * 16) ~b:frame_time))
    else 0
  in
  (* Orientation update (only for polymodel weapons) *)
  let result = Array.create ~len:14 0 in
  result.(0) <- new_vx;
  result.(1) <- new_vy;
  result.(2) <- new_vz;
  result.(3) <- lifeleft_delta;
  if is_polymodel
  then (
    let (rx, ry, rz), (ux, uy, uz), (fx, fy, fz) =
      homing_missile_turn_towards_velocity
        ~norm_vel
        ~fvec:(fvec_x, fvec_y, fvec_z)
        ~frame_time
    in
    result.(4) <- 1;
    result.(5) <- rx;
    result.(6) <- ry;
    result.(7) <- rz;
    result.(8) <- ux;
    result.(9) <- uy;
    result.(10) <- uz;
    result.(11) <- fx;
    result.(12) <- fy;
    result.(13) <- fz);
  result
;;
