(* Pure OCaml game logic for laser/missile functions.
   Ported from main_d2/laser.cpp and main_d1/laser.cpp *)

let f1_0 = 0x10000

(* -- Algebraic effects -------------------------------------------------- *)

type _ Effect.t +=
  | P_Rand : int Effect.t
  | Fetch_object_pos : int -> (int * int * int) Effect.t
      (* objnum -> (pos_x, pos_y, pos_z) *)
  | Laser_create_new :
      (int * int * int * int * int * int * int * int * int * int)
      -> int Effect.t
      (* (dir_x, dir_y, dir_z, pos_x, pos_y, pos_z, segnum, parent_objnum,
          objtype, make_sound) -> objnum or -1 *)
  | Set_laser_track_goal : (int * int) -> unit Effect.t
      (* (objnum, goal_obj) *)

(* make_random_vector: generate a random unit-ish vector using P_Rand.
   Same logic as C make_random_vector / ox_controlcen.ml *)
let make_random_vector () =
  let rx = (Effect.perform P_Rand - 16384) lor 1 in
  let ry = Effect.perform P_Rand - 16384 in
  let rz = Effect.perform P_Rand - 16384 in
  let _, v = Ox_math.vm_vec_copy_normalize_quick ~v:(rx, ry, rz) in
  v
;;

(* create_homing_missile: Create a homing missile aimed at goal_obj.
   If goal_obj == -1, fire in a random direction.
   D1 and D2 versions are functionally identical.
   C original: laser.cpp create_homing_missile *)
let create_homing_missile ~objp_pos_x ~objp_pos_y ~objp_pos_z
    ~objp_segnum ~objp_objnum ~goal_obj ~objtype ~make_sound =
  let vector_to_goal =
    if goal_obj = -1 then
      make_random_vector ()
    else begin
      let goal_x, goal_y, goal_z = Effect.perform (Fetch_object_pos goal_obj) in
      (* D2 uses vm_vec_normalized_dir_quick = sub + normalize_quick
         D1 uses vm_vec_sub + vm_vec_normalize_quick — same result *)
      let _, dir =
        Ox_math.vm_vec_normalized_dir_quick
          ~v_end:(goal_x, goal_y, goal_z)
          ~v_start:(objp_pos_x, objp_pos_y, objp_pos_z)
      in
      let random_vector = make_random_vector () in
      let blended =
        Ox_math.vm_vec_scale_add2 ~dest:dir ~src:random_vector ~k:(f1_0 / 4)
      in
      let _, normalized = Ox_math.vm_vec_normalize_quick ~v:blended in
      normalized
    end
  in
  let dir_x, dir_y, dir_z = vector_to_goal in
  let objnum =
    Effect.perform
      (Laser_create_new
         ( dir_x, dir_y, dir_z
         , objp_pos_x, objp_pos_y, objp_pos_z
         , objp_segnum, objp_objnum, objtype, make_sound ))
  in
  if objnum = -1 then -1
  else begin
    Effect.perform (Set_laser_track_goal (objnum, goal_obj));
    objnum
  end
;;
