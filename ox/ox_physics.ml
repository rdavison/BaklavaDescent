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
      Ox_math.vm_extract_angles_vector (0, 0, 0) goal
    in
    let cur_p, _cur_b, cur_h =
      Ox_math.vm_extract_angles_vector (0, 0, 0) fvec
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
    let delta_p = Ox_math.fixdiv delta_p rate in
    let delta_h = Ox_math.fixdiv delta_h rate in
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
  Ox_math.vm_vector_2_matrix (fx, fy, fz) (Some (ux, uy, uz)) None

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
  let desired_bank = fixang (- Ox_math.fixmul rotvel_y turnroll_scale) in
  if turnroll = desired_bank then turnroll
  else
    let max_roll = fixang (Ox_math.fixmul roll_rate frame_time) in
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
  (Ox_math.fixmul x s, Ox_math.fixmul y s, Ox_math.fixmul z s)

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
        let k = Ox_math.fixdiv r ft in
        let drag_scaled = (drag * 5) / 2 in
        if flags land pf_uses_thrust <> 0 then begin
          let accel = vec_scale rotthrust (Ox_math.fixdiv f1_0 mass) in
          (* Iterate count times: rotvel += accel; rotvel *= (1 - drag) *)
          let rv = ref rotvel in
          for _ = 1 to count do
            rv := vec_scale (vec_add !rv accel) (f1_0 - drag_scaled)
          done;
          (* Linear scale on remaining bit *)
          let rv = vec_scale_add2 !rv accel k in
          vec_scale rv (f1_0 - Ox_math.fixmul k drag_scaled)
        end
        else if flags land pf_free_spinning = 0 then begin
          (* No thrust, not free spinning: just apply drag *)
          let total_drag = ref f1_0 in
          for _ = 1 to count do
            total_drag := Ox_math.fixmul !total_drag (f1_0 - drag_scaled)
          done;
          let total_drag = Ox_math.fixmul !total_drag
              (f1_0 - Ox_math.fixmul k drag_scaled) in
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
        let rotmat = Ox_math.vm_angles_2_matrix (0, -turnroll, 0) in
        Ox_math.vm_matrix_x_matrix orient rotmat
      else orient
    in
    (* Apply rotation: tangles = rotvel * FrameTime *)
    let tp = Ox_math.fixmul (let (x, _, _) = rotvel in x) frame_time in
    let th = Ox_math.fixmul (let (_, y, _) = rotvel in y) frame_time in
    let tb = Ox_math.fixmul (let (_, _, z) = rotvel in z) frame_time in
    let rotmat = Ox_math.vm_angles_2_matrix (tp, tb, th) in
    let orient = Ox_math.vm_matrix_x_matrix orient rotmat in
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
        let rotmat = Ox_math.vm_angles_2_matrix (0, turnroll, 0) in
        Ox_math.vm_matrix_x_matrix orient rotmat
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
    let m = Ox_math.vm_angles_2_matrix (ap, ab, ah) in
    let m = Ox_math.vm_transpose_matrix m in
    let tpnt = Ox_math.vm_vec_rotate !pnt m in
    pnt := Ox_math.vm_vec_add tpnt (offsets.(!mn));
    mn := parents.(!mn)
  done;
  (* Instance for the entire object *)
  let m = Ox_math.vm_transpose_matrix orient in
  let rotated = Ox_math.vm_vec_rotate !pnt m in
  Ox_math.vm_vec_add rotated pos

(* Apply instantaneous force to object velocity.
   C original: physics.cpp phys_apply_force
   velocity += force_vec * (F1_0 / mass)
   D2 adds mass==0 guard (Omega blobs with 0 mass). *)
let phys_apply_force ~velocity ~force_vec ~mass =
  if mass = 0 then velocity
  else
    let scale = Ox_math.fixdiv f1_0 mass in
    Ox_math.vm_vec_scale_add2 velocity force_vec scale

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
  let vecmag = Ox_math.vm_vec_mag force_vec / 8 in
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
    let rate = Ox_math.fixdiv mass vecmag in
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
    let dot = Ox_math.vm_vec_dotprod goal fvec in
    if dot < (f1_0 - frame_time / 2) then
      let new_scale = Ox_math.fixdiv (frame_time * 1) rate in
      let scaled = Ox_math.vm_vec_scale goal new_scale in
      let combined = Ox_math.vm_vec_add scaled fvec in
      let (mag, normalized) = Ox_math.vm_vec_normalize_quick combined in
      if mag < f1_0 / 256 then goal
      else normalized
    else goal
  in
  (* D2 seismic tremor perturbation *)
  let new_fvec =
    if seismic_mag <> 0 then
      let scale = Ox_math.fixdiv (2 * seismic_mag) robot_mass in
      Ox_math.vm_vec_scale_add2 new_fvec rand_vec scale
    else new_fvec
  in
  Ox_math.vm_vector_2_matrix new_fvec None (Some rvec)

(* Compute thrust to maintain current velocity under drag.
   C original: physics.cpp set_thrust_from_velocity

   Inputs:
     mass     - object mass (fix)
     drag     - object drag coefficient (fix)
     velocity - current velocity (vec3)

   Returns: thrust vector (vec3)
   Formula: k = mass * drag / (F1_0 - drag); thrust = velocity * k *)
let set_thrust_from_velocity ~mass ~drag ~velocity =
  let k = Ox_math.fixmuldiv mass drag (f1_0 - drag) in
  Ox_math.vm_vec_copy_scale velocity k
