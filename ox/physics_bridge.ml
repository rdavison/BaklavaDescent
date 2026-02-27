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

(* do_physics_sim_rot: 20 scalar args → 13 ints (or 1 int if no-op)
   rotvel(3) + rotthrust(3) + orient(9) + drag(1) + mass(1) + flags(1) +
   turnroll(1) + frame_time(1) = 20 in
   Returns: tag(1) + orient(9) + rotvel(3) + turnroll(1) = 14 values
   tag=0 means no rotation needed (all zeros) *)
let cd_do_physics_sim_rot
    rvx rvy rvz rtx rty rtz
    o_rx o_ry o_rz o_ux o_uy o_uz o_fx o_fy o_fz
    drag mass flags turnroll frame_time =
  let orient =
    ((o_rx, o_ry, o_rz), (o_ux, o_uy, o_uz), (o_fx, o_fy, o_fz))
  in
  match Ox_physics.do_physics_sim_rot
    ~rotvel:(rvx, rvy, rvz)
    ~rotthrust:(rtx, rty, rtz)
    ~orient ~drag ~mass ~flags ~turnroll ~frame_time
  with
  | None -> (0, 0,0,0, 0,0,0, 0,0,0, 0,0,0, 0)
  | Some (((nrx, nry, nrz), (nux, nuy, nuz), (nfx, nfy, nfz)),
          (new_rvx, new_rvy, new_rvz), new_turnroll) ->
    (1, nrx,nry,nrz, nux,nuy,nuz, nfx,nfy,nfz,
     new_rvx, new_rvy, new_rvz, new_turnroll)

let () =
  Callback.register "cd_physics_turn_towards_vector"
    cd_physics_turn_towards_vector;
  Callback.register "cd_do_physics_sim_rot"
    cd_do_physics_sim_rot
