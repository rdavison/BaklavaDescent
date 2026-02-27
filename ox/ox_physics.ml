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
