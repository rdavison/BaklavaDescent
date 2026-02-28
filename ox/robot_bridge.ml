(* Robot bridge callbacks for C bridge.

   cd_robot_get_anim_state: packed int array → int array
     Input: [anim_states..., robot_joints..., n_guns, gun_num, state,
             anim_states_len, robot_joints_len]
     Output: flat array of (jointnum, p, b, h) * n_joints

   cd_set_robot_state: packed int array → int array (30 ints)
     Input: [anim_states..., robot_joints..., n_guns, anim_angles(30), state,
             anim_states_len, robot_joints_len]
     Output: 30 ints — updated anim_angles[10] as (p,b,h) triples

   cd_robot_set_angles: packed int array → int array
     Input: [n_guns, gun_submodels(8), n_models, submodel_parents(10),
             angs(150), joint_offset]
     Output: [anim_states_flat..., n_new_joints, joints_flat...] *)

let cd_robot_get_anim_state (packed : int array) =
  let anim_states_len = packed.(Array.length packed - 2) in
  let robot_joints_len = packed.(Array.length packed - 1) in
  let anim_states = Array.init anim_states_len ~f:(fun i -> packed.(i)) in
  let robot_joints =
    Array.init robot_joints_len ~f:(fun i -> packed.(anim_states_len + i))
  in
  let trailer_base = anim_states_len + robot_joints_len in
  let n_guns = packed.(trailer_base) in
  let gun_num = packed.(trailer_base + 1) in
  let state = packed.(trailer_base + 2) in
  let joints =
    Ox_robot.robot_get_anim_state ~anim_states ~robot_joints ~n_guns ~gun_num ~state
  in
  let n = Array.length joints in
  let buf = Array.create ~len:(n * 4) 0 in
  Array.iteri joints ~f:(fun i (jn, p, b, h) ->
    buf.((i * 4) + 0) <- jn;
    buf.((i * 4) + 1) <- p;
    buf.((i * 4) + 2) <- b;
    buf.((i * 4) + 3) <- h);
  buf
;;

let cd_set_robot_state (packed : int array) =
  let anim_states_len = packed.(Array.length packed - 2) in
  let robot_joints_len = packed.(Array.length packed - 1) in
  let anim_states = Array.init anim_states_len ~f:(fun i -> packed.(i)) in
  let robot_joints =
    Array.init robot_joints_len ~f:(fun i -> packed.(anim_states_len + i))
  in
  let trailer_base = anim_states_len + robot_joints_len in
  let n_guns = packed.(trailer_base) in
  let anim_angles =
    Array.init 10 ~f:(fun i ->
      let base = trailer_base + 1 + (i * 3) in
      packed.(base), packed.(base + 1), packed.(base + 2))
  in
  let state = packed.(trailer_base + 31) in
  let result =
    Ox_robot.set_robot_state ~anim_states ~robot_joints ~n_guns ~anim_angles ~state
  in
  let buf = Array.create ~len:30 0 in
  Array.iteri result ~f:(fun i (p, b, h) ->
    buf.((i * 3) + 0) <- p;
    buf.((i * 3) + 1) <- b;
    buf.((i * 3) + 2) <- h);
  buf
;;

let cd_robot_set_angles (packed : int array) =
  let n_guns = packed.(0) in
  let gun_submodels = Array.init 8 ~f:(fun i -> packed.(1 + i)) in
  let n_models = packed.(9) in
  let submodel_parents = Array.init 10 ~f:(fun i -> packed.(10 + i)) in
  let angs = Array.init 150 ~f:(fun i -> packed.(20 + i)) in
  let joint_offset = packed.(170) in
  let anim_states_flat, new_joints =
    Ox_robot.robot_set_angles
      ~n_guns
      ~gun_submodels
      ~n_models
      ~submodel_parents
      ~angs
      ~joint_offset
  in
  let as_len = Array.length anim_states_flat in
  let nj = Array.length new_joints in
  let buf = Array.create ~len:(as_len + 1 + (nj * 4)) 0 in
  Array.blit ~src:anim_states_flat ~dst:buf ~src_pos:0 ~dst_pos:0 ~len:as_len;
  buf.(as_len) <- nj;
  Array.iteri new_joints ~f:(fun i (jn, p, b, h) ->
    let base = as_len + 1 + (i * 4) in
    buf.(base + 0) <- jn;
    buf.(base + 1) <- p;
    buf.(base + 2) <- b;
    buf.(base + 3) <- h);
  buf
;;

let () =
  Callback.register "cd_robot_get_anim_state" cd_robot_get_anim_state;
  Callback.register "cd_set_robot_state" cd_set_robot_state;
  Callback.register "cd_robot_set_angles" cd_robot_set_angles
;;
