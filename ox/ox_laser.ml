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
  | Fetch_release_guided_missile_data : int -> int array Effect.t
      (* player_num -> [| Player_num; guided_is_null; newdemo_state; game_mode_and_gm_multi |] *)
  | Release_guided_set_viewer : int -> unit Effect.t
      (* player_num -> sets Missile_viewer = Guided_missile[player_num] *)
  | Release_guided_multi_send : int -> unit Effect.t
      (* player_num -> multi_send_guided_info(Guided_missile[player_num], 1) *)
  | Release_guided_newdemo_record : unit Effect.t
      (* newdemo_record_guided_end() *)
  | Release_guided_clear : int -> unit Effect.t
      (* player_num -> Guided_missile[player_num] = NULL *)
  | Fetch_omega_blob_objnums : int -> int array Effect.t
      (* parent_num -> array of objnums matching (OBJ_WEAPON, OMEGA_ID, parent_num) *)
  | Obj_delete : int -> unit Effect.t
      (* objnum -> deletes the object *)
  | Fetch_create_omega_data : int -> int array Effect.t
      (* parent_objnum -> [| is_multi; frame_time; parent_type; parent_sig;
         parent_laser_parent_num; parent_uvec_x; parent_uvec_y; parent_uvec_z;
         blob_size; omega_strength; omega_speed |] *)
  | Find_point_seg_laser : (int * int * int * int) -> int Effect.t
      (* (pos_x, pos_y, pos_z, hint_seg) -> segnum *)
  | Create_omega_blob_obj : int array -> int Effect.t
      (* [| segnum; pos_x; pos_y; pos_z; lifeleft; vel_x; vel_y; vel_z;
         size; shields; parent_type; parent_sig; parent_num; movement_type |]
         -> objnum *)
  | Set_omega_blob_final : int array -> unit Effect.t
      (* [| objnum; vel_x; vel_y; vel_z |] — sets velocity and movement_type=MT_PHYSICS *)
  | Set_doing_lighting_hack : int -> unit Effect.t
      (* 0 or 1 -> sets Doing_lighting_hack_flag *)

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

(* ND_STATE_RECORDING = 1 *)
let nd_state_recording = 1

(* release_guided_missile: give up control of the guided missile.
   C original: laser.cpp release_guided_missile *)
let release_guided_missile ~player_num =
  let data = Effect.perform (Fetch_release_guided_missile_data player_num) in
  let player_num_global = data.(0) in
  let guided_is_null = data.(1) <> 0 in
  let newdemo_state = data.(2) in
  let game_mode_and_gm_multi = data.(3) <> 0 in

  if player_num = player_num_global then begin
    if guided_is_null then
      (* C returns early here — Guided_missile[player_num] is already NULL *)
      ()
    else begin
      Effect.perform (Release_guided_set_viewer player_num);
      if game_mode_and_gm_multi then
        Effect.perform (Release_guided_multi_send player_num);
      if newdemo_state = nd_state_recording then
        Effect.perform Release_guided_newdemo_record;
      (* Fall through to set Guided_missile[player_num] = NULL *)
      Effect.perform (Release_guided_clear player_num)
    end
  end else
    (* player_num != Player_num: just clear *)
    Effect.perform (Release_guided_clear player_num)
;;

(* delete_old_omega_blobs: Delete all omega weapon blobs belonging to the same parent.
   C original: main_d2/laser.cpp delete_old_omega_blobs *)
let delete_old_omega_blobs ~parent_num =
  let objnums = Effect.perform (Fetch_omega_blob_objnums parent_num) in
  let count = Array.length objnums in
  for i = 0 to count - 1 do
    Effect.perform (Obj_delete objnums.(i))
  done
  (* mprintf omitted — debug-only logging *)
;;

(* -- Constants for create_omega_blobs ------------------------------------- *)

let min_omega_blobs = 3
let min_omega_dist = f1_0 * 3
let desired_omega_dist = f1_0 * 5
let max_omega_blobs = 16
(* max_omega_dist = max_omega_blobs * desired_omega_dist *)
let omega_damage_scale = 32
let one_frame_time = 0x3ffffffe
let mt_none = 0
let mt_physics = 1

(* create_omega_blobs: Create a stream of omega weapon blobs from firing_pos
   to goal_pos. Blobs spread with random perturbation and live for one frame.
   C original: main_d2/laser.cpp create_omega_blobs *)
let create_omega_blobs ~firing_segnum ~fp_x ~fp_y ~fp_z
    ~gp_x ~gp_y ~gp_z ~parent_objnum =
  let data = Effect.perform (Fetch_create_omega_data parent_objnum) in
  let is_multi = data.(0) <> 0 in
  let frame_time = data.(1) in
  let parent_type = data.(2) in
  let parent_sig = data.(3) in
  let parent_laser_parent_num = data.(4) in
  let parent_uvec_x = data.(5) in
  let parent_uvec_y = data.(6) in
  let parent_uvec_z = data.(7) in
  let blob_size = data.(8) in
  let omega_strength = data.(9) in
  let omega_speed = data.(10) in

  if is_multi then
    delete_old_omega_blobs ~parent_num:parent_laser_parent_num;

  let vec_to_goal_raw = Ox_math.vm_vec_sub ~a:(gp_x, gp_y, gp_z) ~b:(fp_x, fp_y, fp_z) in
  let dist_to_goal, vec_to_goal = Ox_math.vm_vec_normalize_quick ~v:vec_to_goal_raw in

  let num_omega_blobs = ref 0 in
  let omega_blob_dist = ref 0 in

  if dist_to_goal < min_omega_blobs * min_omega_dist then begin
    omega_blob_dist := min_omega_dist;
    num_omega_blobs := dist_to_goal / !omega_blob_dist;
    if !num_omega_blobs = 0 then
      num_omega_blobs := 1
  end else begin
    omega_blob_dist := desired_omega_dist;
    num_omega_blobs := dist_to_goal / !omega_blob_dist;
    if !num_omega_blobs > max_omega_blobs then begin
      num_omega_blobs := max_omega_blobs;
      omega_blob_dist := dist_to_goal / !num_omega_blobs
    end else if !num_omega_blobs < min_omega_blobs then begin
      num_omega_blobs := min_omega_blobs;
      omega_blob_dist := dist_to_goal / !num_omega_blobs
    end
  end;

  let omega_delta_vector =
    Ox_math.vm_vec_scale ~v:vec_to_goal ~k:(!omega_blob_dist)
  in

  (* Set up blob positions and perturbation *)
  let blob_pos = ref (fp_x, fp_y, fp_z) in
  let last_segnum = ref firing_segnum in

  let perturb_array = Array.create ~len:max_omega_blobs 0 in

  if dist_to_goal < min_omega_dist * 4 then begin
    (* Nearby: no perturbation *)
    for i = 0 to !num_omega_blobs - 1 do
      perturb_array.(i) <- 0
    done
  end else begin
    (* Not nearby: start halfway out *)
    blob_pos := Ox_math.vm_vec_scale_add2 ~dest:(!blob_pos) ~src:omega_delta_vector ~k:(f1_0 / 2);
    for i = 0 to !num_omega_blobs / 2 - 1 do
      perturb_array.(i) <- f1_0 * i + f1_0 / 4;
      perturb_array.(!num_omega_blobs - 1 - i) <- f1_0 * i
    done
  end;

  (* Create random perturbation vector, favor not going up in player's reference *)
  let perturb_vec = ref (make_random_vector ()) in
  perturb_vec := Ox_math.vm_vec_scale_add2 ~dest:(!perturb_vec)
    ~src:(parent_uvec_x, parent_uvec_y, parent_uvec_z) ~k:(- f1_0 / 2);

  Effect.perform (Set_doing_lighting_hack 1);

  let last_created_objnum = ref (-1) in
  let break_loop = ref false in

  for i = 0 to !num_omega_blobs - 1 do
    if not !break_loop then begin
      (* Last blob: move another almost half section *)
      if i = !num_omega_blobs - 1 then
        blob_pos := Ox_math.vm_vec_scale_add2 ~dest:(!blob_pos) ~src:omega_delta_vector ~k:(15 * f1_0 / 32);

      (* Every 4th blob (i%4==3), re-perturb *)
      if i mod 4 = 3 then begin
        let temp_vec = make_random_vector () in
        perturb_vec := Ox_math.vm_vec_scale_add2 ~dest:(!perturb_vec) ~src:temp_vec ~k:(f1_0 / 4)
      end;

      let temp_pos = Ox_math.vm_vec_scale_add ~a:(!blob_pos) ~b:(!perturb_vec) ~k:perturb_array.(i) in
      let tp_x, tp_y, tp_z = temp_pos in

      let segnum = Effect.perform (Find_point_seg_laser (tp_x, tp_y, tp_z, !last_segnum)) in
      if segnum <> -1 then begin
        last_segnum := segnum;

        (* Compute velocity: vec_to_goal scaled by F1_0*4 *)
        let vel = Ox_math.vm_vec_scale ~v:vec_to_goal ~k:(f1_0 * 4) in
        let vel_x, vel_y, vel_z = vel in

        (* Compute shields: fixmul(OMEGA_DAMAGE_SCALE*FrameTime, strength) *)
        let shields = Ox_math.fixmul ~a:(omega_damage_scale * frame_time) ~b:omega_strength in

        let blob_objnum = Effect.perform (Create_omega_blob_obj
          [| segnum; tp_x; tp_y; tp_z; one_frame_time;
             vel_x; vel_y; vel_z; blob_size; shields;
             parent_type; parent_sig; parent_objnum; mt_none |])
        in
        if blob_objnum = -1 then
          break_loop := true
        else
          last_created_objnum := blob_objnum
      end;

      (* Advance blob_pos by omega_delta_vector *)
      let bx, by, bz = !blob_pos in
      let dx, dy, dz = omega_delta_vector in
      blob_pos := (bx + dx, by + dy, bz + dz)
    end
  done;

  (* Make last blob move faster: scale velocity by omega_speed/4, set MT_PHYSICS *)
  if !last_created_objnum <> -1 then begin
    (* The blob already has velocity = vec_to_goal * F1_0*4.
       Now scale that by omega_speed/4. *)
    let scaled_vel = Ox_math.vm_vec_scale ~v:vec_to_goal ~k:(f1_0 * 4) in
    let sv_x, sv_y, sv_z = scaled_vel in
    let final_vx = Ox_math.fixmul ~a:sv_x ~b:(omega_speed / 4) in
    let final_vy = Ox_math.fixmul ~a:sv_y ~b:(omega_speed / 4) in
    let final_vz = Ox_math.fixmul ~a:sv_z ~b:(omega_speed / 4) in
    Effect.perform (Set_omega_blob_final [| !last_created_objnum; final_vx; final_vy; final_vz |])
  end;

  Effect.perform (Set_doing_lighting_hack 0)
;;
