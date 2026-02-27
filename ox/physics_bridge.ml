(* Physics bridge callbacks for C bridge.

   physics_turn_towards_vector: 10 scalar args → 3 ints
     goal(3) + fvec(3) + rate(1) + is_morph(1) + cur_rotvel(3) = 11 in
     Returns (new_rx, new_ry, new_rz) *)

let cd_physics_turn_towards_vector
    gx gy gz fx fy fz rate is_morph crx cry crz =
  let (rx, ry, rz) =
    Ox_physics.physics_turn_towards_vector
      ~goal:(gx, gy, gz)
      ~fvec:(fx, fy, fz)
      ~rate
      ~is_morph:(is_morph <> 0)
      ~cur_rotvel:(crx, cry, crz)
  in
  (rx, ry, rz)

let () =
  Callback.register "cd_physics_turn_towards_vector"
    cd_physics_turn_towards_vector
