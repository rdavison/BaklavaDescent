(* Robot animation functions ported from main_d1/robot.cpp.
   Identical between D1 and D2. *)

let max_submodels = 10
let n_anim_states = 5

(* robot_get_anim_state: pure lookup into anim_states / robot_joints tables.
   anim_states: flat array of (n_guns+1)*N_ANIM_STATES*2 ints
     — laid out as [g][state] pairs of (n_joints, offset)
   robot_joints: flat array of N*4 ints (jointnum, p, b, h per entry)
   Returns: array of (jointnum, p, b, h) for the matching joints *)
let robot_get_anim_state ~anim_states ~robot_joints ~n_guns:_ ~gun_num ~state =
  let idx = ((gun_num * n_anim_states) + state) * 2 in
  let n_joints = anim_states.(idx) in
  let offset = anim_states.(idx + 1) in
  Array.init n_joints ~f:(fun j ->
    let base = (offset + j) * 4 in
    ( robot_joints.(base)
    , robot_joints.(base + 1)
    , robot_joints.(base + 2)
    , robot_joints.(base + 3) ))
;;

(* set_robot_state: for each gun group, look up anim_states and copy joint angles.
   anim_angles: 10-element array of (p,b,h) — the object's current animation angles.
   Returns: updated anim_angles array (10 elements of (p,b,h)). *)
let set_robot_state ~anim_states ~robot_joints ~n_guns ~anim_angles ~state =
  let result = Array.copy anim_angles in
  for g = 0 to n_guns do
    let idx = ((g * n_anim_states) + state) * 2 in
    let n_joints = anim_states.(idx) in
    let offset = anim_states.(idx + 1) in
    for j = 0 to n_joints - 1 do
      let base = (offset + j) * 4 in
      let jn = robot_joints.(base) in
      let p = robot_joints.(base + 1) in
      let b = robot_joints.(base + 2) in
      let h = robot_joints.(base + 3) in
      result.(jn) <- p, b, h
    done
  done;
  result
;;

(* robot_set_angles: build-time initialization of anim_states and Robot_joints.
   Classifies submodels into gun groups, then for each (gun_group, state)
   builds jointpos entries.

   gun_submodels: array of n_guns ints (which submodel each gun starts at)
   submodel_parents: array of n_models ints
   angs: flat array of N_ANIM_STATES * MAX_SUBMODELS * 3 ints (state-major)
         angs[state][model] = (p,b,h) at index (state*MAX_SUBMODELS + model)*3
   joint_offset: current N_robot_joints value

   Returns: (anim_states_flat, new_joints_list)
     anim_states_flat: (n_guns+1)*N_ANIM_STATES*2 ints
     new_joints_list: list of (jointnum, p, b, h) to append to Robot_joints *)
let robot_set_angles
      ~n_guns
      ~gun_submodels
      ~n_models
      ~submodel_parents
      ~angs
      ~joint_offset
  =
  (* Classify submodels into gun groups *)
  let gun_nums = Array.create ~len:max_submodels (-1) in
  for m = 0 to n_models - 1 do
    gun_nums.(m) <- n_guns
  done;
  gun_nums.(0) <- -1;
  for g = 0 to n_guns - 1 do
    let m = ref gun_submodels.(g) in
    while !m <> 0 do
      gun_nums.(!m) <- g;
      m := submodel_parents.(!m)
    done
  done;
  (* Build anim_states and joints *)
  let anim_states_flat = Array.create ~len:((n_guns + 1) * n_anim_states * 2) 0 in
  let joints = Queue.create () in
  let cur_offset = ref joint_offset in
  for g = 0 to n_guns do
    for state = 0 to n_anim_states - 1 do
      let idx = ((g * n_anim_states) + state) * 2 in
      anim_states_flat.(idx) <- 0;
      anim_states_flat.(idx + 1) <- !cur_offset;
      for m = 0 to n_models - 1 do
        if gun_nums.(m) = g
        then (
          let ang_base = ((state * max_submodels) + m) * 3 in
          let p = angs.(ang_base) in
          let b = angs.(ang_base + 1) in
          let h = angs.(ang_base + 2) in
          Queue.enqueue joints (m, p, b, h);
          anim_states_flat.(idx) <- anim_states_flat.(idx) + 1;
          cur_offset := !cur_offset + 1)
      done
    done
  done;
  anim_states_flat, Queue.to_array joints
;;
