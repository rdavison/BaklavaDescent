(* Pure physics helper functions ported from main_d1/physics.cpp *)

let f1_0 = 0x10000

(* Saturating rotational velocity assignment.
   If delta and dest have opposite signs and delta is small,
   damp by dividing delta by 4. Otherwise just assign delta.
   C original: physics.cpp physics_set_rotvel_and_saturate *)
let physics_set_rotvel_and_saturate ~dest ~delta =
  if (delta lxor dest) < 0 then
    if Int.abs delta < f1_0 / 8 then delta / 4
    else delta
  else delta

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
  let (gx, gy, gz) = goal in
  if gx = 0 && gy = 0 && gz = 0 then cur_rotvel
  else
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
      if delta_p > f1_0 / 2 then dest_p - cur_p - f1_0
      else if delta_p < -(f1_0 / 2) then dest_p - cur_p + f1_0
      else delta_p
    in
    let delta_h =
      if delta_h > f1_0 / 2 then dest_h - cur_h - f1_0
      else if delta_h < -(f1_0 / 2) then dest_h - cur_h + f1_0
      else delta_h
    in
    let delta_p = Ox_math.fixdiv ~a:delta_p ~b:rate in
    let delta_h = Ox_math.fixdiv ~a:delta_h ~b:rate in
    (* Amplify small deltas *)
    let delta_p = if Int.abs delta_p < f1_0 / 16 then delta_p * 4 else delta_p in
    let delta_h = if Int.abs delta_h < f1_0 / 16 then delta_h * 4 else delta_h in
    let (cur_rx, cur_ry, _cur_rz) = cur_rotvel in
    let new_rx = physics_set_rotvel_and_saturate ~dest:cur_rx ~delta:delta_p in
    let new_ry = physics_set_rotvel_and_saturate ~dest:cur_ry ~delta:delta_h in
    (new_rx, new_ry, 0)

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
  let ((_rx, _ry, _rz), (ux, uy, uz), (fx, fy, fz)) = orient in
  Ox_math.vm_vector_2_matrix ~fvec:(fx, fy, fz) ~uvec:(Some (ux, uy, uz)) ~rvec:None

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
  let desired_bank = fixang (- Ox_math.fixmul ~a:rotvel_y ~b:turnroll_scale) in
  if turnroll = desired_bank then turnroll
  else
    let max_roll = fixang (Ox_math.fixmul ~a:roll_rate ~b:frame_time) in
    let delta_ang = desired_bank - turnroll in
    let max_roll =
      if Int.abs delta_ang < max_roll then delta_ang
      else if delta_ang < 0 then - max_roll
      else max_roll
    in
    turnroll + max_roll

(* Wrap to int32 range — C int32 arithmetic wraps on overflow *)
let w32 v = Ox_math.wrap_i64_to_fix (Int64.of_int v)

(* Helper: scale vector by fixpoint scalar — fixmul already wraps *)
let vec_scale (x, y, z) s =
  (Ox_math.fixmul ~a:x ~b:s, Ox_math.fixmul ~a:y ~b:s, Ox_math.fixmul ~a:z ~b:s)

(* Helper: add two vectors with int32 wrapping *)
let vec_add (ax, ay, az) (bx, by, bz) =
  (w32 (ax + bx), w32 (ay + by), w32 (az + bz))

(* Helper: scale_add2: v += other * s, with int32 wrapping *)
let vec_scale_add2 v other s =
  let scaled = vec_scale other s in
  vec_add v scaled

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
let do_physics_sim_rot ~rotvel ~rotthrust ~orient ~drag ~mass ~flags
    ~turnroll ~frame_time =
  let (rvx, rvy, rvz) = rotvel in
  let (rtx, rty, rtz) = rotthrust in
  (* Early exit if nothing to do *)
  if rvx = 0 && rvy = 0 && rvz = 0 && rtx = 0 && rty = 0 && rtz = 0 then
    None
  else
    (* Apply drag to rotational velocity *)
    let rotvel =
      if drag <> 0 then begin
        let count = frame_time / ft in
        let r = frame_time mod ft in
        let k = Ox_math.fixdiv ~a:r ~b:ft in
        let drag_scaled = (drag * 5) / 2 in
        if flags land pf_uses_thrust <> 0 then begin
          let accel = vec_scale rotthrust (Ox_math.fixdiv ~a:f1_0 ~b:mass) in
          (* Iterate count times: rotvel += accel; rotvel *= (1 - drag) *)
          let rv = ref rotvel in
          for _ = 1 to count do
            rv := vec_scale (vec_add !rv accel) (f1_0 - drag_scaled)
          done;
          (* Linear scale on remaining bit *)
          let rv = vec_scale_add2 !rv accel k in
          vec_scale rv (f1_0 - Ox_math.fixmul ~a:k ~b:drag_scaled)
        end
        else if flags land pf_free_spinning = 0 then begin
          (* No thrust, not free spinning: just apply drag *)
          let total_drag = ref f1_0 in
          for _ = 1 to count do
            total_drag := Ox_math.fixmul ~a:!total_drag ~b:(f1_0 - drag_scaled)
          done;
          let total_drag = Ox_math.fixmul ~a:!total_drag
              ~b:(f1_0 - Ox_math.fixmul ~a:k ~b:drag_scaled) in
          vec_scale rotvel total_drag
        end
        else
          (* Free spinning: no drag applied *)
          rotvel
      end
      else rotvel
    in
    (* Unrotate for bank caused by turnroll *)
    let orient =
      if turnroll <> 0 then
        let rotmat = Ox_math.vm_angles_2_matrix ~v:(0, -turnroll, 0) in
        Ox_math.vm_matrix_x_matrix ~a:orient ~b:rotmat
      else orient
    in
    (* Apply rotation: tangles = rotvel * FrameTime *)
    let tp = Ox_math.fixmul ~a:(let (x, _, _) = rotvel in x) ~b:frame_time in
    let th = Ox_math.fixmul ~a:(let (_, y, _) = rotvel in y) ~b:frame_time in
    let tb = Ox_math.fixmul ~a:(let (_, _, z) = rotvel in z) ~b:frame_time in
    let rotmat = Ox_math.vm_angles_2_matrix ~v:(tp, tb, th) in
    let orient = Ox_math.vm_matrix_x_matrix ~a:orient ~b:rotmat in
    (* Apply turnroll update *)
    let turnroll =
      if flags land pf_turnroll <> 0 then
        set_object_turnroll ~turnroll
          ~rotvel_y:(let (_, y, _) = rotvel in y) ~frame_time
      else turnroll
    in
    (* Re-rotate for bank caused by turnroll *)
    let orient =
      if turnroll <> 0 then
        let rotmat = Ox_math.vm_angles_2_matrix ~v:(0, turnroll, 0) in
        Ox_math.vm_matrix_x_matrix ~a:orient ~b:rotmat
      else orient
    in
    (* Fix matrix orthogonality *)
    let orient = check_and_fix_matrix ~orient in
    Some (orient, rotvel, turnroll)

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
let calc_gun_point ~gun_point ~start_mn ~anim_angles ~offsets ~parents
    ~orient ~pos =
  (* Walk up bone hierarchy from gun submodel to root *)
  let pnt = ref gun_point in
  let mn = ref start_mn in
  while !mn <> 0 do
    let (ap, ab, ah) = anim_angles.(!mn) in
    let m = Ox_math.vm_angles_2_matrix ~v:(ap, ab, ah) in
    let m = Ox_math.vm_transpose_matrix ~m in
    let tpnt = Ox_math.vm_vec_rotate ~src:!pnt ~m in
    pnt := Ox_math.vm_vec_add ~a:tpnt ~b:(offsets.(!mn));
    mn := parents.(!mn)
  done;
  (* Instance for the entire object *)
  let m = Ox_math.vm_transpose_matrix ~m:orient in
  let rotated = Ox_math.vm_vec_rotate ~src:!pnt ~m in
  Ox_math.vm_vec_add ~a:rotated ~b:pos

(* Apply instantaneous force to object velocity.
   C original: physics.cpp phys_apply_force
   velocity += force_vec * (F1_0 / mass)
   D2 adds mass==0 guard (Omega blobs with 0 mass). *)
let phys_apply_force ~velocity ~force_vec ~mass =
  if mass = 0 then velocity
  else
    let scale = Ox_math.fixdiv ~a:f1_0 ~b:mass in
    Ox_math.vm_vec_scale_add2 ~dest:velocity ~src:force_vec ~k:scale

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
  if vecmag < f1_0 / 256 then
    let rate = 4 * f1_0 in
    let new_rv = physics_turn_towards_vector
        ~goal:force_vec ~fvec ~rate ~is_morph ~cur_rotvel in
    (new_rv, false)
  else if vecmag < mass asr 14 then
    let rate = 4 * f1_0 in
    let new_rv = physics_turn_towards_vector
        ~goal:force_vec ~fvec ~rate ~is_morph ~cur_rotvel in
    (new_rv, false)
  else
    let rate = Ox_math.fixdiv ~a:mass ~b:vecmag in
    let rate =
      if is_robot then max rate (f1_0 / 4)
      else max rate (f1_0 / 2)
    in
    let new_rv = physics_turn_towards_vector
        ~goal:force_vec ~fvec ~rate ~is_morph ~cur_rotvel in
    (new_rv, is_robot)

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
let ai_turn_towards_vector ~goal ~fvec ~rvec ~rate ~frame_time
    ~seismic_mag ~robot_mass ~rand_vec =
  let new_fvec =
    let dot = Ox_math.vm_vec_dotprod ~a:goal ~b:fvec in
    if dot < (f1_0 - frame_time / 2) then
      let new_scale = Ox_math.fixdiv ~a:(frame_time * 1) ~b:rate in
      let scaled = Ox_math.vm_vec_scale ~v:goal ~k:new_scale in
      let combined = Ox_math.vm_vec_add ~a:scaled ~b:fvec in
      let (mag, normalized) = Ox_math.vm_vec_normalize_quick ~v:combined in
      if mag < f1_0 / 256 then goal
      else normalized
    else goal
  in
  (* D2 seismic tremor perturbation *)
  let new_fvec =
    if seismic_mag <> 0 then
      let scale = Ox_math.fixdiv ~a:(2 * seismic_mag) ~b:robot_mass in
      Ox_math.vm_vec_scale_add2 ~dest:new_fvec ~src:rand_vec ~k:scale
    else new_fvec
  in
  Ox_math.vm_vector_2_matrix ~fvec:new_fvec ~uvec:None ~rvec:(Some rvec)

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
let move_towards_vector ~velocity ~vec_goal ~fvec ~frame_time ~difficulty
    ~max_speed ~attack_type ~dot_based ~is_thief ~is_kamikaze =
  let (vx, vy, vz) = velocity in
  let (gx, gy, gz) = vec_goal in
  (* Normalize velocity and compute dot with fvec *)
  let (_mag, vel_norm) = Ox_math.vm_vec_normalize_quick ~v:velocity in
  let dot = Ox_math.vm_vec_dotprod ~a:vel_norm ~b:fvec in
  (* D2 thief: bias dot toward 1 *)
  let dot = if is_thief then (f1_0 + dot) / 2 else dot in
  let (nvx, nvy, nvz) =
    if dot_based && dot < 3 * f1_0 / 4 then
      (* Bash: halve velocity, add goal * FrameTime * 32 *)
      (vx / 2 + Ox_math.fixmul ~a:gx ~b:(frame_time * 32),
       vy / 2 + Ox_math.fixmul ~a:gy ~b:(frame_time * 32),
       vz / 2 + Ox_math.fixmul ~a:gz ~b:(frame_time * 32))
    else
      (* Nudge: add goal * FrameTime * 64 * (difficulty+5)/4 *)
      let scale = frame_time * 64 in
      (vx + Ox_math.fixmul ~a:gx ~b:scale * (difficulty + 5) / 4,
       vy + Ox_math.fixmul ~a:gy ~b:scale * (difficulty + 5) / 4,
       vz + Ox_math.fixmul ~a:gz ~b:scale * (difficulty + 5) / 4)
  in
  (* Cap speed *)
  let max_speed =
    if attack_type = 1 || is_thief || is_kamikaze then max_speed * 2
    else max_speed
  in
  let speed = Ox_math.vm_vec_mag_quick ~v:(nvx, nvy, nvz) in
  if speed > max_speed then
    (nvx * 3 / 4, nvy * 3 / 4, nvz * 3 / 4)
  else
    (nvx, nvy, nvz)

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
let move_around_player ~velocity ~vec_to_player ~fvec ~frame_time ~frame_count
    ~objnum ~fast_flag ~shields ~strength ~field_of_view ~max_speed
    ~player_cloaked ~skip_objnum1 =
  if fast_flag = 0 then velocity
  else
    let (vx, vy, vz) = velocity in
    let (px, py, pz) = vec_to_player in
    (* Compute direction change frequency based on frame_time *)
    let dir_change = ref 48 in
    let ft = ref frame_time in
    let count = ref 0 in
    if !ft < f1_0 / 32 then begin
      dir_change := !dir_change * 8;
      count := !count + 3
    end else
      while !ft < f1_0 / 4 do
        dir_change := !dir_change * 2;
        ft := !ft * 2;
        incr count
      done;
    let dir = (frame_count + (!count + 1) * (objnum * 8 + objnum * 4 + objnum))
              land !dir_change in
    let dir = dir asr (4 + !count) in
    let scale = frame_time * 32 in
    let (ex, ey, ez) = match dir with
      | 0 -> (Ox_math.fixmul ~a:pz ~b:scale, Ox_math.fixmul ~a:py ~b:scale,
              Ox_math.fixmul ~a:(- px) ~b:scale)
      | 1 -> (Ox_math.fixmul ~a:(- pz) ~b:scale, Ox_math.fixmul ~a:py ~b:scale,
              Ox_math.fixmul ~a:px ~b:scale)
      | 2 -> (Ox_math.fixmul ~a:(- py) ~b:scale, Ox_math.fixmul ~a:px ~b:scale,
              Ox_math.fixmul ~a:pz ~b:scale)
      | _ -> (Ox_math.fixmul ~a:py ~b:scale, Ox_math.fixmul ~a:(- px) ~b:scale,
              Ox_math.fixmul ~a:pz ~b:scale)
    in
    (* Fast evasion scaling *)
    let (ex, ey, ez) =
      if fast_flag > 0 then
        let dot = Ox_math.vm_vec_dotprod ~a:vec_to_player ~b:fvec in
        if dot > field_of_view && not player_cloaked then
          let damage_scale =
            if strength <> 0 then
              let ds = Ox_math.fixdiv ~a:shields ~b:strength in
              min ds f1_0 |> max 0
            else f1_0
          in
          let s = Ox_math.i2f ~a:fast_flag + damage_scale in
          (Ox_math.fixmul ~a:ex ~b:s, Ox_math.fixmul ~a:ey ~b:s, Ox_math.fixmul ~a:ez ~b:s)
        else (ex, ey, ez)
      else (ex, ey, ez)
    in
    let nvx = vx + ex and nvy = vy + ey and nvz = vz + ez in
    let speed = Ox_math.vm_vec_mag_quick ~v:(nvx, nvy, nvz) in
    if (not skip_objnum1 || objnum <> 1) && speed > max_speed then
      (nvx * 3 / 4, nvy * 3 / 4, nvz * 3 / 4)
    else
      (nvx, nvy, nvz)

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
let move_away_from_player ~velocity ~vec_to_player ~uvec ~rvec
    ~frame_time ~frame_count ~objnum ~attack_type ~max_speed =
  let (vx, vy, vz) = velocity in
  let (px, py, pz) = vec_to_player in
  let nvx = vx - Ox_math.fixmul ~a:px ~b:(frame_time * 16) in
  let nvy = vy - Ox_math.fixmul ~a:py ~b:(frame_time * 16) in
  let nvz = vz - Ox_math.fixmul ~a:pz ~b:(frame_time * 16) in
  let (nvx, nvy, nvz) =
    if attack_type <> 0 then
      let objref = (objnum lxor ((frame_count + 3 * objnum) asr 5)) land 3 in
      let scale = frame_time lsl 5 in
      match objref with
      | 0 -> Ox_math.vm_vec_scale_add2 ~dest:(nvx, nvy, nvz) ~src:uvec ~k:scale
      | 1 -> Ox_math.vm_vec_scale_add2 ~dest:(nvx, nvy, nvz) ~src:uvec ~k:(- scale)
      | 2 -> Ox_math.vm_vec_scale_add2 ~dest:(nvx, nvy, nvz) ~src:rvec ~k:scale
      | _ -> Ox_math.vm_vec_scale_add2 ~dest:(nvx, nvy, nvz) ~src:rvec ~k:(- scale)
    else (nvx, nvy, nvz)
  in
  let speed = Ox_math.vm_vec_mag_quick ~v:(nvx, nvy, nvz) in
  if speed > max_speed then
    (nvx * 3 / 4, nvy * 3 / 4, nvz * 3 / 4)
  else
    (nvx, nvy, nvz)

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
  let desired_bank = - Ox_math.fixmul ~a:rotvel_y ~b:turnroll_scale in
  if turnroll <> desired_bank then
    let max_roll = Ox_math.fixmul ~a:roll_rate ~b:frame_time in
    let delta_ang = desired_bank - turnroll in
    let max_roll =
      if Int.abs delta_ang < max_roll then delta_ang
      else if delta_ang < 0 then - max_roll
      else max_roll
    in
    turnroll + max_roll
  else turnroll

(* compute_lead_component: compute one axis of lead firing vector.
   C original: ai2.cpp compute_lead_component (D2 only)
   Returns: fixdiv(player_pos - robot_pos, elapsed_time) + player_vel *)
let compute_lead_component ~player_pos ~robot_pos ~player_vel ~elapsed_time =
  Ox_math.fixdiv ~a:(player_pos - robot_pos) ~b:elapsed_time + player_vel

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
let lead_player ~fire_point ~believed_player_pos ~player_velocity
    ~fvec ~player_cloaked ~max_weapon_speed ~is_matter ~difficulty_level =
  let ndl = 5 in
  let min_lead_speed = f1_0 * 4 in
  let max_lead_distance = f1_0 * 200 in
  let lead_range = f1_0 / 2 in
  if player_cloaked then None
  else
    let (pvx, pvy, pvz) = player_velocity in
    let (_mag, player_movement_dir) =
      Ox_math.vm_vec_normalize_quick ~v:(pvx, pvy, pvz) in
    let player_speed = Ox_math.vm_vec_mag_quick ~v:(pvx, pvy, pvz) in
    if player_speed < min_lead_speed then None
    else
      let vec_to_player = Ox_math.vm_vec_sub ~a:believed_player_pos ~b:fire_point in
      let (_mag, vec_to_player_norm) =
        Ox_math.vm_vec_normalize_quick ~v:vec_to_player in
      let dist_to_player = Ox_math.vm_vec_mag_quick ~v:vec_to_player in
      if dist_to_player > max_lead_distance then None
      else
        let dot = Ox_math.vm_vec_dotprod ~a:vec_to_player_norm ~b:player_movement_dir in
        if dot < - lead_range || dot > lead_range then None
        else if max_weapon_speed < f1_0 then None
        else
          let max_weapon_speed =
            if is_matter then
              if difficulty_level <= 1 then 0
              else max_weapon_speed * (ndl - difficulty_level)
            else max_weapon_speed
          in
          if max_weapon_speed = 0 then None
          else
            let (fpx, fpy, fpz) = fire_point in
            let (bpx, bpy, bpz) = believed_player_pos in
            let projected_time = Ox_math.fixdiv ~a:dist_to_player ~b:max_weapon_speed in
            let fvx = compute_lead_component ~player_pos:bpx ~robot_pos:fpx
                ~player_vel:pvx ~elapsed_time:projected_time in
            let fvy = compute_lead_component ~player_pos:bpy ~robot_pos:fpy
                ~player_vel:pvy ~elapsed_time:projected_time in
            let fvz = compute_lead_component ~player_pos:bpz ~robot_pos:fpz
                ~player_vel:pvz ~elapsed_time:projected_time in
            let (_mag, fire_vec) =
              Ox_math.vm_vec_normalize_quick ~v:(fvx, fvy, fvz) in
            let (fvx, fvy, fvz) = fire_vec in
            let dot_fvec = Ox_math.vm_vec_dotprod ~a:fire_vec ~b:fvec in
            if dot_fvec < f1_0 / 2 then
              let (ax, ay, az) = Ox_math.vm_vec_add ~a:fire_vec ~b:vec_to_player_norm in
              let adjusted = (ax / 2, ay / 2, az / 2) in
              let dot2 = Ox_math.vm_vec_dotprod ~a:adjusted ~b:fvec in
              if dot2 < f1_0 / 2 then None
              else Some adjusted
            else Some (fvx, fvy, fvz)

(* homing_missile_turn_towards_velocity:
   Blend normalized velocity into forward vector and re-derive orientation.
   C original: laser.cpp homing_missile_turn_towards_velocity
   HOMING_MISSILE_SCALE = 8, identical in D1 and D2 *)
let homing_missile_turn_towards_velocity ~norm_vel ~fvec ~frame_time =
  let homing_missile_scale = 8 in
  let (nvx, nvy, nvz) = norm_vel in
  let s = frame_time * homing_missile_scale in
  let new_fvec =
    Ox_math.vm_vec_add
      ~a:(Ox_math.fixmul ~a:nvx ~b:s, Ox_math.fixmul ~a:nvy ~b:s, Ox_math.fixmul ~a:nvz ~b:s)
      ~b:fvec
  in
  let (_mag, new_fvec_n) = Ox_math.vm_vec_normalize_quick ~v:new_fvec in
  Ox_math.vm_vector_2_matrix ~fvec:new_fvec_n ~uvec:None ~rvec:None

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
    (packed.(base), packed.(base + 1), packed.(base + 2)) in
  let side_normal1 i =
    let base = 18 + i * 3 in
    (packed.(base), packed.(base + 1), packed.(base + 2)) in
  let num_faces i = packed.(36 + i) in
  let orient =
    ((packed.(42), packed.(43), packed.(44)),
     (packed.(45), packed.(46), packed.(47)),
     (packed.(48), packed.(49), packed.(50))) in
  let turnroll = packed.(51) in
  let floor_levelling = packed.(52) <> 0 in
  let frame_time = packed.(53) in
  let (_rvec, uvec, fvec) = orient in
  (* Find side most aligned with up vector *)
  let best_side = ref 0 in
  let largest_d = ref (- f1_0) in
  for i = 0 to 5 do
    let d = Ox_math.vm_vec_dotprod ~a:(side_normal0 i) ~b:uvec in
    if d > !largest_d then begin
      largest_d := d;
      best_side := i
    end
  done;
  (* Determine desired up vector *)
  let desired_upvec =
    if floor_levelling then
      (* Old way: use floor's normal (side 3) *)
      side_normal0 3
    else if num_faces !best_side = 2 then begin
      (* Average the two normals *)
      let (n0x, n0y, n0z) = side_normal0 !best_side in
      let (n1x, n1y, n1z) = side_normal1 !best_side in
      let avg = ((n0x + n1x) / 2, (n0y + n1y) / 2, (n0z + n1z) / 2) in
      let (_mag, normalized) = Ox_math.vm_vec_copy_normalize ~v:avg in
      normalized
    end else
      side_normal0 !best_side
  in
  (* Check if desired_upvec is not too parallel to fvec *)
  let fixang v = Ox_math.wrap_i32_to_fixang v in
  if Int.abs (Ox_math.vm_vec_dotprod ~a:desired_upvec ~b:fvec) < f1_0 / 2 then begin
    let temp_matrix = Ox_math.vm_vector_2_matrix ~fvec ~uvec:(Some desired_upvec) ~rvec:None in
    let (_temp_rvec, temp_uvec, _temp_fvec) = temp_matrix in
    (* C uses fixang (int16_t) for delta_ang and roll_ang *)
    let delta_ang =
      Ox_math.vm_vec_delta_ang ~v0:uvec ~v1:temp_uvec ~fvec:(Some fvec) in
    let delta_ang = fixang (delta_ang + turnroll) in
    if Int.abs delta_ang > damp_ang then begin
      let roll_ang = fixang (Ox_math.fixmul ~a:frame_time ~b:roll_rate) in
      let roll_ang =
        if Int.abs delta_ang < roll_ang then delta_ang
        else if delta_ang < 0 then - roll_ang
        else roll_ang
      in
      let rotmat = Ox_math.vm_angles_2_matrix ~v:(0, roll_ang, 0) in
      let new_orient = Ox_math.vm_matrix_x_matrix ~a:orient ~b:rotmat in
      (true, new_orient, floor_levelling)
    end else
      (* Delta is small enough: stop levelling *)
      (false, orient, false)
  end else
    (* desired_upvec too parallel to fvec: no change *)
    (false, orient, floor_levelling)
