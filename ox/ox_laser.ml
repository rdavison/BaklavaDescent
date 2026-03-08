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
  | Fetch_weapon_create_data : int -> int array Effect.t
      (* weapon_type -> [|render_type; blob_size; model_num;
         po_len_to_width_ratio; mass; drag; bounce; bounce_cheat;
         polygon_model_rad|] *)
  | Obj_create_weapon : (int * int * int * int * int * int * int) -> int Effect.t
      (* (weapon_type, segnum, pos_x, pos_y, pos_z, laser_radius, rtype)
         -> objnum *)
  | Set_weapon_obj_props : int array -> unit Effect.t
      (* [|objnum; model_num; size; mass; drag; phys_flags_or|]
         model_num < 0 means skip polymodel setup
         phys_flags_or is OR'd into existing flags *)

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

(* -- Constants for create_weapon_object ----------------------------------- *)

let weapon_render_none = -1
let weapon_render_laser = 0
let weapon_render_blob = 1
let weapon_render_polymodel = 2
let weapon_render_vclip = 3

let rt_none = 0
let rt_polyobj = 1
let rt_laser = 3
let rt_weapon_vclip = 7

let pf_bounce = 0x04
let pf_bounces_twice = 0x200

(* create_weapon_object: Create a weapon object with the right render type,
   size, physics, and bounce properties.
   C original: main_d2/laser.cpp create_weapon_object *)
let create_weapon_object ~weapon_type ~segnum ~pos_x ~pos_y ~pos_z =
  let data = Effect.perform (Fetch_weapon_create_data weapon_type) in
  let render_type = data.(0) in
  let blob_size = data.(1) in
  let model_num = data.(2) in
  let po_len_to_width_ratio = data.(3) in
  let mass = data.(4) in
  let drag = data.(5) in
  let bounce = data.(6) in
  let bounce_cheat = data.(7) in
  let polygon_model_rad = data.(8) in

  let rtype = ref (-1) in
  let laser_radius = ref (-1) in

  (match render_type with
   | r when r = weapon_render_blob ->
     rtype := rt_laser;
     laser_radius := blob_size
   | r when r = weapon_render_polymodel ->
     laser_radius := 0;
     rtype := rt_polyobj
   | r when r = weapon_render_laser ->
     () (* Int3() - not supported anymore *)
   | r when r = weapon_render_none ->
     rtype := rt_none;
     laser_radius := f1_0
   | r when r = weapon_render_vclip ->
     rtype := rt_weapon_vclip;
     laser_radius := blob_size
   | _ ->
     failwith "Invalid weapon render type in Laser_create_new");

  (* Assert(laser_radius != -1); Assert(rtype != -1); *)

  let objnum = Effect.perform
    (Obj_create_weapon
       (weapon_type, segnum, pos_x, pos_y, pos_z, !laser_radius, !rtype))
  in

  (* Compute size for polymodel weapons *)
  let final_size =
    if render_type = weapon_render_polymodel then
      Ox_math.fixdiv ~a:polygon_model_rad ~b:po_len_to_width_ratio
    else
      0 (* not used — obj_create already set size to laser_radius *)
  in

  let final_model_num =
    if render_type = weapon_render_polymodel then model_num else -1
  in

  (* Compute phys_flags to OR in *)
  let phys_flags = ref 0 in
  if bounce = 1 then
    phys_flags := !phys_flags lor pf_bounce;
  if bounce = 2 || bounce_cheat <> 0 then
    phys_flags := !phys_flags lor (pf_bounce + pf_bounces_twice);

  Effect.perform
    (Set_weapon_obj_props
       [| objnum; final_model_num; final_size; mass; drag; !phys_flags |]);

  objnum
;;
