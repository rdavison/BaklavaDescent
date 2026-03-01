(* Pure game logic for do_physics_sim (D1 + D2).
   FVI retry loop with collision response, using algebraic effects. *)

let f1_0 = 0x10000

(* -- Constants ------------------------------------------------------------ *)

(* Collision fate codes (from fvi.h) *)
let hit_none = 0
let hit_wall = 1
let hit_object = 2
let hit_bad_p0 = 3

(* FQ flags *)
let fq_check_objs = 1
let fq_transpoint = 4
let fq_get_seglist = 8

(* Object type codes *)
let obj_player = 4
let obj_weapon = 5

(* Physics flags *)
let pf_levelling = 0x02
let pf_bounce = 0x04
let pf_stick = 0x10
let pf_persistent = 0x20
let pf_bounced_once = 0x80
let pf_bounces_twice = 0x200

(* Object flags *)
let of_should_be_dead = 2

(* Control type *)
let ct_ai = 7

(* D1: PROXIMITY_ID = 16 *)
let proximity_id = 16

(* D2: SUPERPROX_ID = 38 *)
let superprox_id = 38

(* D2: MAX_OBJECT_VEL = i2f(100) *)
let max_object_vel = 100 * f1_0

(* WID_FLY_FLAG *)
let wid_fly_flag = 1

(* Max retries *)
let max_fvi_segs = 100
let max_ignore_objs = 100

(* D2: SEGMENT_IS_CONTROLCEN *)
let segment_is_controlcen = 1

(* -- Algebraic effects ---------------------------------------------------- *)

type _ Effect.t +=
  | Find_vector_intersection :
      (int
      * int
      * int (* p0 *)
      * int
      * int
      * int (* p1 *)
      * int (* rad *)
      * int (* thisobjnum *)
      * int array (* ignore_obj_list, terminated by -1 *)
      * int (* flags *)
      * int (* startseg *))
      -> (int (* fate *)
         * int
         * int
         * int (* hit_pnt *)
         * int (* hit_seg *)
         * int (* hit_side *)
         * int (* hit_side_seg *)
         * int (* hit_object *)
         * int
         * int
         * int (* hit_wallnorm *)
         * int (* n_segs *)
         * int array (* seglist *))
           Effect.t
  | Collide_object_with_wall :
      (int * int * int * int * int * int * int)
      -> (* hit_speed, wall_seg, wall_side, hit_px, hit_py, hit_pz, obj_flags_out *)
      int Effect.t (* returns updated obj_flags *)
  | Scrape_object_on_wall :
      (int * int * int * int * int)
      -> (* wall_seg, wall_side, hit_px, hit_py, hit_pz *)
      int Effect.t (* returns updated obj_flags *)
  | Collide_two_objects :
      (int * int * int * int)
      -> (* hit_objnum, pos_hit_x, pos_hit_y, pos_hit_z *)
      (int (* obj_flags_out *) * int * int * int (* new velocity *)) Effect.t
  | Obj_relink : (int * int) -> unit Effect.t (* objnum, new_seg *)
  | Find_object_seg : int -> int Effect.t (* objnum -> seg or -1 *)
  | Update_object_seg : int -> unit Effect.t (* objnum *)
  | Find_point_seg :
      (int * int * int * int)
      -> int Effect.t (* px, py, pz, seg -> seg or -1 *)
  | Get_seg_masks :
      (int * int * int * int)
      -> int Effect.t (* px, py, pz, seg -> centermask *)
  | Compute_segment_center : int -> (int * int * int) Effect.t (* seg -> cx, cy, cz *)
  | Add_stuck_object : (int * int) -> unit Effect.t (* wall_seg, wall_side *)
  | Find_connect_side : (int * int) -> int Effect.t (* seg1, seg2 -> sidenum or -1 *)
  | Wall_is_doorway : (int * int) -> int Effect.t (* seg, side -> doorway flags *)
  | Create_abs_vertex_lists_and_dist :
      (int * int * int * int * int)
      -> (* seg, side, start_px, start_py, start_pz *)
      (int * int * int * int) Effect.t (* dist, normal_x, normal_y, normal_z *)
  | (* D2 only: check if a wall segment tmap has forcefield flag *)
      Tmap_is_force_field :
      (int * int)
      -> int Effect.t (* seg, side -> 0 or 1 *)
  | (* D2 only: vm_vector_2_matrix for weapon orientation on bounce *)
      Vm_vector_2_matrix_orient :
      (int * int * int * int * int * int)
      -> (* vel xyz, orient_uvec xyz *)
      (int * int * int * int * int * int * int * int * int) Effect.t (* orient 9 *)

(* -- Helper: build ignore list array -------------------------------------- *)

let make_ignore_list objs n =
  let arr = Array.create ~len:(n + 1) (-1) in
  for i = 0 to n - 1 do
    arr.(i) <- objs.(i)
  done;
  arr
;;

(* -- D1: do_physics_sim --------------------------------------------------- *)

let do_physics_sim_d1
      (* Object state *)
      ~pos_x
      ~pos_y
      ~pos_z
      ~vel_x
      ~vel_y
      ~vel_z
      ~thrust_x
      ~thrust_y
      ~thrust_z
      ~orient (* 9-element: rvec xyz, uvec xyz, fvec xyz *)
      ~rotvel_x
      ~rotvel_y
      ~rotvel_z
      ~rotthrust_x
      ~rotthrust_y
      ~rotthrust_z
      ~size
      ~mass
      ~drag
      ~phys_flags
      ~obj_flags
      ~obj_type
      ~obj_id:_obj_id
      ~obj_segnum
      ~objnum
      ~turnroll
      ~last_pos_x
      ~last_pos_y
      ~last_pos_z
      (* Game state *)
      ~frame_time
      ~physics_cheat_flag
  =
  (* do_physics_sim_rot *)
  let rvx, rvy, rvz, orient_r, turnroll_out =
    match
      Ox_physics.do_physics_sim_rot
        ~rotvel:(rotvel_x, rotvel_y, rotvel_z)
        ~rotthrust:(rotthrust_x, rotthrust_y, rotthrust_z)
        ~orient
        ~drag
        ~mass
        ~flags:phys_flags
        ~turnroll
        ~frame_time
    with
    | Some (orient_out, rotvel_out, turnroll_out) ->
      let rvx, rvy, rvz = rotvel_out in
      rvx, rvy, rvz, orient_out, turnroll_out
    | None -> rotvel_x, rotvel_y, rotvel_z, orient, turnroll
  in
  (* Early exit if no velocity/thrust *)
  let (o_rx, o_ry, o_rz), (o_ux, o_uy, o_uz), (o_fx, o_fy, o_fz) = orient_r in
  if
    not
      (vel_x <> 0
       || vel_y <> 0
       || vel_z <> 0
       || thrust_x <> 0
       || thrust_y <> 0
       || thrust_z <> 0)
  then
    [| pos_x
     ; pos_y
     ; pos_z
     ; vel_x
     ; vel_y
     ; vel_z
     ; o_rx
     ; o_ry
     ; o_rz
     ; o_ux
     ; o_uy
     ; o_uz
     ; o_fx
     ; o_fy
     ; o_fz
     ; obj_segnum
     ; obj_flags
     ; phys_flags
     ; turnroll_out
     ; rvx
     ; rvy
     ; rvz
     ; 0 (* retry_count *)
     ; 0 (* n_phys_segs *)
     ; 0 (* needs_levelling *)
    |]
  else (
    let sim_time = ref frame_time in
    (* Drag *)
    let vel_x, vel_y, vel_z =
      if drag <> 0
      then (
        let packed =
          [| vel_x
           ; vel_y
           ; vel_z
           ; thrust_x
           ; thrust_y
           ; thrust_z
           ; drag
           ; mass
           ; phys_flags
           ; !sim_time
          |]
        in
        let result = Ox_physics.do_physics_drag packed in
        result.(0), result.(1), result.(2))
      else vel_x, vel_y, vel_z
    in
    let cur_pos_x = ref pos_x in
    let cur_pos_y = ref pos_y in
    let cur_pos_z = ref pos_z in
    let cur_vel_x = ref vel_x in
    let cur_vel_y = ref vel_y in
    let cur_vel_z = ref vel_z in
    let cur_segnum = ref obj_segnum in
    let cur_flags = ref obj_flags in
    let cur_phys_flags = ref phys_flags in
    let start_pos_x = pos_x in
    let start_pos_y = pos_y in
    let start_pos_z = pos_z in
    let orig_segnum = obj_segnum in
    let obj_stopped = ref false in
    let retry_count = ref 0 in
    let n_ignore_objs = ref 0 in
    let ignore_objs = Array.create ~len:max_ignore_objs (-1) in
    let n_phys_segs = ref 0 in
    let phys_seglist = Array.create ~len:max_fvi_segs 0 in
    let try_again = ref true in
    let early_return = ref false in
    ignore phys_seglist;
    (* seglist is tracked but returned via n_phys_segs count *)
    while !try_again && not !early_return do
      try_again := false;
      (* frame_vec = velocity * sim_time *)
      let fvx, fvy, fvz =
        Ox_math.vm_vec_copy_scale ~v:(!cur_vel_x, !cur_vel_y, !cur_vel_z) ~k:!sim_time
      in
      if fvx = 0 && fvy = 0 && fvz = 0
      then () (* break *)
      else if !retry_count >= 3 && not (obj_type = obj_player && !retry_count < 8)
      then () (* break: too many retries *)
      else (
        let new_px, new_py, new_pz =
          Ox_math.vm_vec_add ~a:(!cur_pos_x, !cur_pos_y, !cur_pos_z) ~b:(fvx, fvy, fvz)
        in
        let ignore_list = make_ignore_list ignore_objs !n_ignore_objs in
        let fq_flags = ref fq_check_objs in
        if obj_type = obj_weapon then fq_flags := !fq_flags lor fq_transpoint;
        if obj_type = obj_player then fq_flags := !fq_flags lor fq_get_seglist;
        let ( fate
            , hit_px
            , hit_py
            , hit_pz
            , hit_seg
            , hit_side
            , hit_side_seg
            , hit_objnum
            , wn_x
            , wn_y
            , wn_z
            , n_segs
            , seglist )
          =
          Effect.perform
            (Find_vector_intersection
               ( !cur_pos_x
               , !cur_pos_y
               , !cur_pos_z
               , new_px
               , new_py
               , new_pz
               , size
               , objnum
               , ignore_list
               , !fq_flags
               , !cur_segnum ))
        in
        (* D1: proximity mine hack *)
        if fate = hit_object && hit_objnum >= 0
        then
          (* C checks: objp->type == OBJ_WEAPON && objp->id == PROXIMITY_ID
             We pass hit_objnum; C side does the check via effect return.
             For simplicity, we just note it and let C handle the decrement.
             Actually, let's handle it: the C effect already tells us hit_objnum.
             We'd need the object type/id — that's not passed to us.
             The plan says this is handled in C. We'll skip the count-- for now
             as it only affects retry limit. *)
          ();
        (* Player seglist tracking *)
        if obj_type = obj_player
        then (
          if
            !n_phys_segs > 0
            && n_segs > 0
            && phys_seglist.(!n_phys_segs - 1) = seglist.(0)
          then n_phys_segs := !n_phys_segs - 1;
          let i = ref 0 in
          while !i < n_segs && !n_phys_segs < max_fvi_segs - 1 do
            phys_seglist.(!n_phys_segs) <- seglist.(!i);
            n_phys_segs := !n_phys_segs + 1;
            i := !i + 1
          done);
        if hit_seg = -1
        then (
          (* Horrible error — kill weapons, break *)
          if obj_type = obj_weapon then cur_flags := !cur_flags lor of_should_be_dead;
          (* break *)
          ())
        else (
          let save_pos_x = !cur_pos_x in
          let save_pos_y = !cur_pos_y in
          let save_pos_z = !cur_pos_z in
          let save_seg = !cur_segnum in
          cur_pos_x := hit_px;
          cur_pos_y := hit_py;
          cur_pos_z := hit_pz;
          if hit_seg <> !cur_segnum
          then (
            Effect.perform (Obj_relink (objnum, hit_seg));
            cur_segnum := hit_seg);
          (* Check if position is valid *)
          let centermask =
            Effect.perform
              (Get_seg_masks (!cur_pos_x, !cur_pos_y, !cur_pos_z, !cur_segnum))
          in
          if centermask <> 0
          then (
            let n = Effect.perform (Find_object_seg objnum) in
            if n = -1
            then (
              if obj_type = obj_player
              then (
                let n2 =
                  Effect.perform
                    (Find_point_seg (last_pos_x, last_pos_y, last_pos_z, !cur_segnum))
                in
                if n2 <> -1
                then (
                  cur_pos_x := last_pos_x;
                  cur_pos_y := last_pos_y;
                  cur_pos_z := last_pos_z;
                  Effect.perform (Obj_relink (objnum, n2));
                  cur_segnum := n2)
                else (
                  let cx, cy, cz = Effect.perform (Compute_segment_center !cur_segnum) in
                  cur_pos_x := cx + objnum;
                  cur_pos_y := cy;
                  cur_pos_z := cz))
              else (
                let cx, cy, cz = Effect.perform (Compute_segment_center !cur_segnum) in
                cur_pos_x := cx + objnum;
                cur_pos_y := cy;
                cur_pos_z := cz);
              if obj_type = obj_weapon then cur_flags := !cur_flags lor of_should_be_dead;
              early_return := true)
            else ());
          if not !early_return
          then (
            (* Calculate new sim_time *)
            let moved_time = ref 0 in
            let _actual_dist, (mn_x, mn_y, mn_z) =
              Ox_math.vm_vec_normalized_dir
                ~v_end:(!cur_pos_x, !cur_pos_y, !cur_pos_z)
                ~v_start:(save_pos_x, save_pos_y, save_pos_z)
            in
            let actual_dist = _actual_dist in
            if
              fate = hit_wall
              && Ox_math.vm_vec_dotprod ~a:(mn_x, mn_y, mn_z) ~b:(fvx, fvy, fvz) < 0
            then (
              (* Moved backwards — restore position *)
              cur_pos_x := save_pos_x;
              cur_pos_y := save_pos_y;
              cur_pos_z := save_pos_z;
              Effect.perform (Obj_relink (objnum, save_seg));
              cur_segnum := save_seg;
              moved_time := 0)
            else (
              let attempted_dist = Ox_math.vm_vec_mag ~v:(fvx, fvy, fvz) in
              let old_sim_time = !sim_time in
              sim_time
              := Ox_math.fixmuldiv
                   ~a:!sim_time
                   ~b:(attempted_dist - actual_dist)
                   ~c:attempted_dist;
              moved_time := old_sim_time - !sim_time;
              if !sim_time < 0 || !sim_time > old_sim_time
              then (
                sim_time := old_sim_time;
                moved_time := 0));
            (* Collision response *)
            match fate with
            | f when f = hit_wall ->
              let mv_x, mv_y, mv_z =
                Ox_math.vm_vec_sub
                  ~a:(!cur_pos_x, !cur_pos_y, !cur_pos_z)
                  ~b:(save_pos_x, save_pos_y, save_pos_z)
              in
              let wall_part =
                Ox_math.vm_vec_dotprod ~a:(mv_x, mv_y, mv_z) ~b:(wn_x, wn_y, wn_z)
              in
              if
                wall_part <> 0
                && !moved_time > 0
                && -Ox_math.fixdiv ~a:wall_part ~b:!moved_time > 0
              then (
                let hit_speed = -Ox_math.fixdiv ~a:wall_part ~b:!moved_time in
                let new_flags =
                  Effect.perform
                    (Collide_object_with_wall
                       ( hit_speed
                       , hit_side_seg
                       , hit_side
                       , hit_px
                       , hit_py
                       , hit_pz
                       , !cur_flags ))
                in
                cur_flags := new_flags)
              else (
                let new_flags =
                  Effect.perform
                    (Scrape_object_on_wall (hit_side_seg, hit_side, hit_px, hit_py, hit_pz))
                in
                cur_flags := new_flags);
              if not (!cur_flags land of_should_be_dead <> 0)
              then
                if !cur_phys_flags land pf_stick <> 0
                then (
                  (* Stick to wall *)
                  Effect.perform (Add_stuck_object (hit_side_seg, hit_side));
                  cur_vel_x := 0;
                  cur_vel_y := 0;
                  cur_vel_z := 0;
                  obj_stopped := true;
                  try_again := false)
                else (
                  (* Slide along wall *)
                  let wall_part2 =
                    Ox_math.vm_vec_dotprod
                      ~a:(wn_x, wn_y, wn_z)
                      ~b:(!cur_vel_x, !cur_vel_y, !cur_vel_z)
                  in
                  let wall_part2 =
                    if !cur_phys_flags land pf_bounce <> 0
                    then wall_part2 * 2
                    else wall_part2
                  in
                  let nvx, nvy, nvz =
                    Ox_math.vm_vec_scale_add2
                      ~dest:(!cur_vel_x, !cur_vel_y, !cur_vel_z)
                      ~src:(wn_x, wn_y, wn_z)
                      ~k:(-wall_part2)
                  in
                  cur_vel_x := nvx;
                  cur_vel_y := nvy;
                  cur_vel_z := nvz;
                  try_again := true)
            | f when f = hit_object ->
              (* Calculate hit point between two objects *)
              (* The C side handles pos_hit calculation since it needs Objects[] access.
                  We pass hit_objnum and the effect handler computes pos_hit and calls
                  collide_two_objects. *)
              let new_flags, new_vx, new_vy, new_vz =
                Effect.perform (Collide_two_objects (hit_objnum, hit_px, hit_py, hit_pz))
              in
              let old_vx = !cur_vel_x in
              let old_vy = !cur_vel_y in
              let old_vz = !cur_vel_z in
              cur_flags := new_flags;
              cur_vel_x := new_vx;
              cur_vel_y := new_vy;
              cur_vel_z := new_vz;
              if not (!cur_flags land of_should_be_dead <> 0)
              then
                if
                  !cur_phys_flags land pf_persistent <> 0
                  || (old_vx = !cur_vel_x && old_vy = !cur_vel_y && old_vz = !cur_vel_z)
                then (
                  if !n_ignore_objs < max_ignore_objs
                  then (
                    ignore_objs.(!n_ignore_objs) <- hit_objnum;
                    n_ignore_objs := !n_ignore_objs + 1);
                  try_again := true)
            | _ ->
              (* HIT_NONE or HIT_BAD_P0 *)
              ())))
    done;
    (* Post-loop: set velocity from actual movement *)
    if (not !obj_stopped) && not !early_return
    then (
      let mv_x, mv_y, mv_z =
        Ox_math.vm_vec_sub
          ~a:(!cur_pos_x, !cur_pos_y, !cur_pos_z)
          ~b:(start_pos_x, start_pos_y, start_pos_z)
      in
      let nvx, nvy, nvz =
        Ox_math.vm_vec_copy_scale
          ~v:(mv_x, mv_y, mv_z)
          ~k:(Ox_math.fixdiv ~a:f1_0 ~b:frame_time)
      in
      cur_vel_x := nvx;
      cur_vel_y := nvy;
      cur_vel_z := nvz;
      (* BUMP_HACK: unstick player *)
      if
        obj_type = obj_player
        && !cur_vel_x = 0
        && !cur_vel_y = 0
        && !cur_vel_z = 0
        && not (thrust_x = 0 && thrust_y = 0 && thrust_z = 0)
      then (
        let cx, cy, cz = Effect.perform (Compute_segment_center !cur_segnum) in
        let _, (bx, by, bz) =
          Ox_math.vm_vec_copy_normalize_quick
            ~v:(cx - !cur_pos_x, cy - !cur_pos_y, cz - !cur_pos_z)
        in
        let npx, npy, npz =
          Ox_math.vm_vec_scale_add2
            ~dest:(!cur_pos_x, !cur_pos_y, !cur_pos_z)
            ~src:(bx, by, bz)
            ~k:(size / 5)
        in
        cur_pos_x := npx;
        cur_pos_y := npy;
        cur_pos_z := npz));
    (* Levelling *)
    (* Note: do_physics_align_object is handled by C side since it's already ported
     and takes packed array. We'll signal via a flag in the return. *)
    let needs_levelling = !cur_phys_flags land pf_levelling <> 0 in
    (* Door passability hack for player *)
    if
      obj_type = obj_player
      && !cur_segnum <> orig_segnum
      && physics_cheat_flag <> 0xBADA55
      && not !early_return
    then (
      let sidenum = Effect.perform (Find_connect_side (!cur_segnum, orig_segnum)) in
      if sidenum <> -1
      then (
        let doorway = Effect.perform (Wall_is_doorway (orig_segnum, sidenum)) in
        if doorway land wid_fly_flag = 0
        then (
          let dist, norm_x, norm_y, norm_z =
            Effect.perform
              (Create_abs_vertex_lists_and_dist
                 (orig_segnum, sidenum, start_pos_x, start_pos_y, start_pos_z))
          in
          let npx, npy, npz =
            Ox_math.vm_vec_scale_add
              ~a:(start_pos_x, start_pos_y, start_pos_z)
              ~b:(norm_x, norm_y, norm_z)
              ~k:(size - dist)
          in
          cur_pos_x := npx;
          cur_pos_y := npy;
          cur_pos_z := npz;
          Effect.perform (Update_object_seg objnum))));
    (* Final segment validation *)
    if not !early_return
    then (
      let centermask =
        Effect.perform (Get_seg_masks (!cur_pos_x, !cur_pos_y, !cur_pos_z, !cur_segnum))
      in
      if centermask <> 0
      then (
        let n = Effect.perform (Find_object_seg objnum) in
        if n = -1
        then (
          if obj_type = obj_player
          then (
            let n2 =
              Effect.perform
                (Find_point_seg (last_pos_x, last_pos_y, last_pos_z, !cur_segnum))
            in
            if n2 <> -1
            then (
              cur_pos_x := last_pos_x;
              cur_pos_y := last_pos_y;
              cur_pos_z := last_pos_z;
              Effect.perform (Obj_relink (objnum, n2));
              cur_segnum := n2)
            else (
              let cx, cy, cz = Effect.perform (Compute_segment_center !cur_segnum) in
              cur_pos_x := cx + objnum;
              cur_pos_y := cy;
              cur_pos_z := cz))
          else (
            let cx, cy, cz = Effect.perform (Compute_segment_center !cur_segnum) in
            cur_pos_x := cx + objnum;
            cur_pos_y := cy;
            cur_pos_z := cz);
          if obj_type = obj_weapon then cur_flags := !cur_flags lor of_should_be_dead)));
    (* Return packed result — orient was already unpacked above *)
    let base =
      [| !cur_pos_x
       ; !cur_pos_y
       ; !cur_pos_z
       ; !cur_vel_x
       ; !cur_vel_y
       ; !cur_vel_z
       ; o_rx
       ; o_ry
       ; o_rz
       ; o_ux
       ; o_uy
       ; o_uz
       ; o_fx
       ; o_fy
       ; o_fz
       ; !cur_segnum
       ; !cur_flags
       ; !cur_phys_flags
       ; turnroll_out
       ; rvx
       ; rvy
       ; rvz
       ; (if !retry_count > 0 then !retry_count - 1 else 0)
       ; !n_phys_segs
       ; (if needs_levelling then 1 else 0)
      |]
    in
    (* Append phys_seglist so C side can write it back to the global *)
    let segs = Array.sub phys_seglist ~pos:0 ~len:!n_phys_segs in
    Array.append base segs)
;;

(* -- D2: do_physics_sim --------------------------------------------------- *)

let do_physics_sim_d2
      (* Object state *)
      ~pos_x
      ~pos_y
      ~pos_z
      ~vel_x
      ~vel_y
      ~vel_z
      ~thrust_x
      ~thrust_y
      ~thrust_z
      ~orient (* 9-element: rvec xyz, uvec xyz, fvec xyz *)
      ~rotvel_x
      ~rotvel_y
      ~rotvel_z
      ~rotthrust_x
      ~rotthrust_y
      ~rotthrust_z
      ~size
      ~mass
      ~drag
      ~phys_flags
      ~obj_flags
      ~obj_type
      ~obj_id:_obj_id
      ~obj_segnum
      ~objnum
      ~turnroll
      ~last_pos_x
      ~last_pos_y
      ~last_pos_z
      (* D2 extras *)
      ~orient_uvec_x
      ~orient_uvec_y
      ~orient_uvec_z
      ~seg_special (* Segment2s[segnum].special — for BUMP_HACK *)
      (* Game state *)
      ~frame_time
      ~physics_cheat_flag
  =
  (* do_physics_sim_rot *)
  let rvx, rvy, rvz, orient_init, turnroll_out =
    match
      Ox_physics.do_physics_sim_rot
        ~rotvel:(rotvel_x, rotvel_y, rotvel_z)
        ~rotthrust:(rotthrust_x, rotthrust_y, rotthrust_z)
        ~orient
        ~drag
        ~mass
        ~flags:phys_flags
        ~turnroll
        ~frame_time
    with
    | Some (orient_out, rotvel_out, turnroll_out) ->
      let rvx, rvy, rvz = rotvel_out in
      rvx, rvy, rvz, orient_out, turnroll_out
    | None -> rotvel_x, rotvel_y, rotvel_z, orient, turnroll
  in
  let orient_r = ref orient_init in
  (* Early exit if no velocity/thrust *)
  if
    not
      (vel_x <> 0
       || vel_y <> 0
       || vel_z <> 0
       || thrust_x <> 0
       || thrust_y <> 0
       || thrust_z <> 0)
  then (
    let (o_rx, o_ry, o_rz), (o_ux, o_uy, o_uz), (o_fx, o_fy, o_fz) = !orient_r in
    [| pos_x
     ; pos_y
     ; pos_z
     ; vel_x
     ; vel_y
     ; vel_z
     ; o_rx
     ; o_ry
     ; o_rz
     ; o_ux
     ; o_uy
     ; o_uz
     ; o_fx
     ; o_fy
     ; o_fz
     ; obj_segnum
     ; obj_flags
     ; phys_flags
     ; turnroll_out
     ; rvx
     ; rvy
     ; rvz
     ; 0
     ; 0
     ; 0
    |])
  else (
    let sim_time = ref frame_time in
    (* Drag *)
    let vel_x, vel_y, vel_z =
      if drag <> 0
      then (
        let packed =
          [| vel_x
           ; vel_y
           ; vel_z
           ; thrust_x
           ; thrust_y
           ; thrust_z
           ; drag
           ; mass
           ; phys_flags
           ; !sim_time
          |]
        in
        let result = Ox_physics.do_physics_drag packed in
        result.(0), result.(1), result.(2))
      else vel_x, vel_y, vel_z
    in
    let cur_pos_x = ref pos_x in
    let cur_pos_y = ref pos_y in
    let cur_pos_z = ref pos_z in
    let cur_vel_x = ref vel_x in
    let cur_vel_y = ref vel_y in
    let cur_vel_z = ref vel_z in
    let cur_segnum = ref obj_segnum in
    let cur_flags = ref obj_flags in
    let cur_phys_flags = ref phys_flags in
    let start_pos_x = pos_x in
    let start_pos_y = pos_y in
    let start_pos_z = pos_z in
    let orig_segnum = obj_segnum in
    let bounced = ref false in
    let obj_stopped = ref false in
    let retry_count = ref 0 in
    let n_ignore_objs = ref 0 in
    let ignore_objs = Array.create ~len:max_ignore_objs (-1) in
    let n_phys_segs = ref 0 in
    let phys_seglist = Array.create ~len:max_fvi_segs 0 in
    let try_again = ref true in
    let early_return = ref false in
    ignore phys_seglist;
    while !try_again && not !early_return do
      try_again := false;
      let fvx, fvy, fvz =
        Ox_math.vm_vec_copy_scale ~v:(!cur_vel_x, !cur_vel_y, !cur_vel_z) ~k:!sim_time
      in
      if fvx = 0 && fvy = 0 && fvz = 0
      then ()
      else if !retry_count >= 3 && not (obj_type = obj_player && !retry_count < 8)
      then ()
      else (
        let new_px, new_py, new_pz =
          Ox_math.vm_vec_add ~a:(!cur_pos_x, !cur_pos_y, !cur_pos_z) ~b:(fvx, fvy, fvz)
        in
        let ignore_list = make_ignore_list ignore_objs !n_ignore_objs in
        let fq_flags = ref fq_check_objs in
        if obj_type = obj_weapon then fq_flags := !fq_flags lor fq_transpoint;
        if obj_type = obj_player then fq_flags := !fq_flags lor fq_get_seglist;
        let ( fate
            , hit_px
            , hit_py
            , hit_pz
            , hit_seg
            , hit_side
            , hit_side_seg
            , hit_objnum
            , wn_x
            , wn_y
            , wn_z
            , n_segs
            , seglist )
          =
          Effect.perform
            (Find_vector_intersection
               ( !cur_pos_x
               , !cur_pos_y
               , !cur_pos_z
               , new_px
               , new_py
               , new_pz
               , size
               , objnum
               , ignore_list
               , !fq_flags
               , !cur_segnum ))
        in
        (* D2: proximity + superprox mine hack — handled by C side
           (count-- for proximity/superprox hits) *)
        (* Player seglist tracking *)
        if obj_type = obj_player
        then (
          if
            !n_phys_segs > 0
            && n_segs > 0
            && phys_seglist.(!n_phys_segs - 1) = seglist.(0)
          then n_phys_segs := !n_phys_segs - 1;
          let i = ref 0 in
          while !i < n_segs && !n_phys_segs < max_fvi_segs - 1 do
            phys_seglist.(!n_phys_segs) <- seglist.(!i);
            n_phys_segs := !n_phys_segs + 1;
            i := !i + 1
          done);
        if hit_seg = -1
        then (if obj_type = obj_weapon then cur_flags := !cur_flags lor of_should_be_dead)
        else (
          let save_pos_x = !cur_pos_x in
          let save_pos_y = !cur_pos_y in
          let save_pos_z = !cur_pos_z in
          let save_seg = !cur_segnum in
          cur_pos_x := hit_px;
          cur_pos_y := hit_py;
          cur_pos_z := hit_pz;
          if hit_seg <> !cur_segnum
          then (
            Effect.perform (Obj_relink (objnum, hit_seg));
            cur_segnum := hit_seg);
          let centermask =
            Effect.perform
              (Get_seg_masks (!cur_pos_x, !cur_pos_y, !cur_pos_z, !cur_segnum))
          in
          if centermask <> 0
          then (
            let n = Effect.perform (Find_object_seg objnum) in
            if n = -1
            then (
              if obj_type = obj_player
              then (
                let n2 =
                  Effect.perform
                    (Find_point_seg (last_pos_x, last_pos_y, last_pos_z, !cur_segnum))
                in
                if n2 <> -1
                then (
                  cur_pos_x := last_pos_x;
                  cur_pos_y := last_pos_y;
                  cur_pos_z := last_pos_z;
                  Effect.perform (Obj_relink (objnum, n2));
                  cur_segnum := n2)
                else (
                  let cx, cy, cz = Effect.perform (Compute_segment_center !cur_segnum) in
                  cur_pos_x := cx + objnum;
                  cur_pos_y := cy;
                  cur_pos_z := cz))
              else (
                let cx, cy, cz = Effect.perform (Compute_segment_center !cur_segnum) in
                cur_pos_x := cx + objnum;
                cur_pos_y := cy;
                cur_pos_z := cz);
              if obj_type = obj_weapon then cur_flags := !cur_flags lor of_should_be_dead;
              early_return := true)
            else ());
          if not !early_return
          then (
            let moved_time = ref 0 in
            let _actual_dist, (mn_x, mn_y, mn_z) =
              Ox_math.vm_vec_normalized_dir
                ~v_end:(!cur_pos_x, !cur_pos_y, !cur_pos_z)
                ~v_start:(save_pos_x, save_pos_y, save_pos_z)
            in
            let actual_dist = _actual_dist in
            if
              fate = hit_wall
              && Ox_math.vm_vec_dotprod ~a:(mn_x, mn_y, mn_z) ~b:(fvx, fvy, fvz) < 0
            then (
              cur_pos_x := save_pos_x;
              cur_pos_y := save_pos_y;
              cur_pos_z := save_pos_z;
              Effect.perform (Obj_relink (objnum, save_seg));
              cur_segnum := save_seg;
              moved_time := 0)
            else (
              let attempted_dist = Ox_math.vm_vec_mag ~v:(fvx, fvy, fvz) in
              let old_sim_time = !sim_time in
              sim_time
              := Ox_math.fixmuldiv
                   ~a:!sim_time
                   ~b:(attempted_dist - actual_dist)
                   ~c:attempted_dist;
              moved_time := old_sim_time - !sim_time;
              if !sim_time < 0 || !sim_time > old_sim_time
              then (
                sim_time := old_sim_time;
                moved_time := 0));
            match fate with
            | f when f = hit_wall ->
              let mv_x, mv_y, mv_z =
                Ox_math.vm_vec_sub
                  ~a:(!cur_pos_x, !cur_pos_y, !cur_pos_z)
                  ~b:(save_pos_x, save_pos_y, save_pos_z)
              in
              let wall_part =
                Ox_math.vm_vec_dotprod ~a:(mv_x, mv_y, mv_z) ~b:(wn_x, wn_y, wn_z)
              in
              if
                wall_part <> 0
                && !moved_time > 0
                && -Ox_math.fixdiv ~a:wall_part ~b:!moved_time > 0
              then (
                let hit_speed = -Ox_math.fixdiv ~a:wall_part ~b:!moved_time in
                let new_flags =
                  Effect.perform
                    (Collide_object_with_wall
                       ( hit_speed
                       , hit_side_seg
                       , hit_side
                       , hit_px
                       , hit_py
                       , hit_pz
                       , !cur_flags ))
                in
                cur_flags := new_flags)
              else (
                let new_flags =
                  Effect.perform
                    (Scrape_object_on_wall (hit_side_seg, hit_side, hit_px, hit_py, hit_pz))
                in
                cur_flags := new_flags);
              if not (!cur_flags land of_should_be_dead <> 0)
              then (
                (* D2: check forcefield *)
                let forcefield_bounce =
                  Effect.perform (Tmap_is_force_field (hit_side_seg, hit_side))
                in
                if forcefield_bounce = 0 && !cur_phys_flags land pf_stick <> 0
                then (
                  Effect.perform (Add_stuck_object (hit_side_seg, hit_side));
                  cur_vel_x := 0;
                  cur_vel_y := 0;
                  cur_vel_z := 0;
                  obj_stopped := true;
                  try_again := false)
                else (
                  let wall_part2 =
                    Ox_math.vm_vec_dotprod
                      ~a:(wn_x, wn_y, wn_z)
                      ~b:(!cur_vel_x, !cur_vel_y, !cur_vel_z)
                  in
                  let wall_part2 = ref wall_part2 in
                  let check_vel = ref false in
                  if forcefield_bounce <> 0 || !cur_phys_flags land pf_bounce <> 0
                  then (
                    wall_part2 := !wall_part2 * 2;
                    if forcefield_bounce <> 0
                    then (
                      check_vel := true;
                      if obj_type = obj_player then wall_part2 := !wall_part2 * 2);
                    (* D2: PF_BOUNCES_TWICE tracking *)
                    if !cur_phys_flags land pf_bounces_twice <> 0
                    then
                      if !cur_phys_flags land pf_bounced_once <> 0
                      then
                        cur_phys_flags
                        := !cur_phys_flags
                           land lnot (pf_bounce lor pf_bounced_once lor pf_bounces_twice)
                      else cur_phys_flags := !cur_phys_flags lor pf_bounced_once;
                    bounced := true);
                  let nvx, nvy, nvz =
                    Ox_math.vm_vec_scale_add2
                      ~dest:(!cur_vel_x, !cur_vel_y, !cur_vel_z)
                      ~src:(wn_x, wn_y, wn_z)
                      ~k:(- !wall_part2)
                  in
                  cur_vel_x := nvx;
                  cur_vel_y := nvy;
                  cur_vel_z := nvz;
                  (* D2: velocity clamping on forcefield bounce *)
                  if !check_vel
                  then (
                    let vel =
                      Ox_math.vm_vec_mag_quick ~v:(!cur_vel_x, !cur_vel_y, !cur_vel_z)
                    in
                    if vel > max_object_vel
                    then (
                      let svx, svy, svz =
                        Ox_math.vm_vec_scale
                          ~v:(!cur_vel_x, !cur_vel_y, !cur_vel_z)
                          ~k:(Ox_math.fixdiv ~a:max_object_vel ~b:vel)
                      in
                      cur_vel_x := svx;
                      cur_vel_y := svy;
                      cur_vel_z := svz));
                  (* D2: update weapon orientation on bounce *)
                  if !bounced && obj_type = obj_weapon
                  then (
                    let new_orient =
                      Effect.perform
                        (Vm_vector_2_matrix_orient
                           ( !cur_vel_x
                           , !cur_vel_y
                           , !cur_vel_z
                           , orient_uvec_x
                           , orient_uvec_y
                           , orient_uvec_z ))
                    in
                    let o_rx, o_ry, o_rz, o_ux, o_uy, o_uz, o_fx, o_fy, o_fz =
                      new_orient
                    in
                    orient_r := (o_rx, o_ry, o_rz), (o_ux, o_uy, o_uz), (o_fx, o_fy, o_fz));
                  try_again := true))
            | f when f = hit_object ->
              let new_flags, new_vx, new_vy, new_vz =
                Effect.perform (Collide_two_objects (hit_objnum, hit_px, hit_py, hit_pz))
              in
              let old_vx = !cur_vel_x in
              let old_vy = !cur_vel_y in
              let old_vz = !cur_vel_z in
              cur_flags := new_flags;
              cur_vel_x := new_vx;
              cur_vel_y := new_vy;
              cur_vel_z := new_vz;
              if not (!cur_flags land of_should_be_dead <> 0)
              then
                if
                  !cur_phys_flags land pf_persistent <> 0
                  || (old_vx = !cur_vel_x && old_vy = !cur_vel_y && old_vz = !cur_vel_z)
                then (
                  if !n_ignore_objs < max_ignore_objs
                  then (
                    ignore_objs.(!n_ignore_objs) <- hit_objnum;
                    n_ignore_objs := !n_ignore_objs + 1);
                  try_again := true)
            | _ -> ())))
    done;
    (* Post-loop: set velocity from actual movement *)
    (* D2: skip velocity recalc if bounced *)
    if (not !obj_stopped) && (not !bounced) && not !early_return
    then (
      let mv_x, mv_y, mv_z =
        Ox_math.vm_vec_sub
          ~a:(!cur_pos_x, !cur_pos_y, !cur_pos_z)
          ~b:(start_pos_x, start_pos_y, start_pos_z)
      in
      let nvx, nvy, nvz =
        Ox_math.vm_vec_copy_scale
          ~v:(mv_x, mv_y, mv_z)
          ~k:(Ox_math.fixdiv ~a:f1_0 ~b:frame_time)
      in
      cur_vel_x := nvx;
      cur_vel_y := nvy;
      cur_vel_z := nvz;
      (* BUMP_HACK *)
      if
        obj_type = obj_player
        && !cur_vel_x = 0
        && !cur_vel_y = 0
        && !cur_vel_z = 0
        && not (thrust_x = 0 && thrust_y = 0 && thrust_z = 0)
      then (
        let cx, cy, cz = Effect.perform (Compute_segment_center !cur_segnum) in
        let _, (bx, by, bz) =
          Ox_math.vm_vec_copy_normalize_quick
            ~v:(cx - !cur_pos_x, cy - !cur_pos_y, cz - !cur_pos_z)
        in
        (* D2: negate bump direction if in reactor segment *)
        let bx, by, bz =
          if seg_special = segment_is_controlcen then -bx, -by, -bz else bx, by, bz
        in
        let npx, npy, npz =
          Ox_math.vm_vec_scale_add2
            ~dest:(!cur_pos_x, !cur_pos_y, !cur_pos_z)
            ~src:(bx, by, bz)
            ~k:(size / 5)
        in
        cur_pos_x := npx;
        cur_pos_y := npy;
        cur_pos_z := npz;
        (* D2: if moving away from reactor, may move out of seg *)
        if seg_special = segment_is_controlcen
        then Effect.perform (Update_object_seg objnum)));
    let needs_levelling = !cur_phys_flags land pf_levelling <> 0 in
    (* Door passability hack *)
    if
      obj_type = obj_player
      && !cur_segnum <> orig_segnum
      && physics_cheat_flag <> 0xBADA55
      && not !early_return
    then (
      let sidenum = Effect.perform (Find_connect_side (!cur_segnum, orig_segnum)) in
      if sidenum <> -1
      then (
        let doorway = Effect.perform (Wall_is_doorway (orig_segnum, sidenum)) in
        if doorway land wid_fly_flag = 0
        then (
          let dist, norm_x, norm_y, norm_z =
            Effect.perform
              (Create_abs_vertex_lists_and_dist
                 (orig_segnum, sidenum, start_pos_x, start_pos_y, start_pos_z))
          in
          let npx, npy, npz =
            Ox_math.vm_vec_scale_add
              ~a:(start_pos_x, start_pos_y, start_pos_z)
              ~b:(norm_x, norm_y, norm_z)
              ~k:(size - dist)
          in
          cur_pos_x := npx;
          cur_pos_y := npy;
          cur_pos_z := npz;
          Effect.perform (Update_object_seg objnum))));
    (* Final segment validation *)
    if not !early_return
    then (
      let centermask =
        Effect.perform (Get_seg_masks (!cur_pos_x, !cur_pos_y, !cur_pos_z, !cur_segnum))
      in
      if centermask <> 0
      then (
        let n = Effect.perform (Find_object_seg objnum) in
        if n = -1
        then (
          if obj_type = obj_player
          then (
            let n2 =
              Effect.perform
                (Find_point_seg (last_pos_x, last_pos_y, last_pos_z, !cur_segnum))
            in
            if n2 <> -1
            then (
              cur_pos_x := last_pos_x;
              cur_pos_y := last_pos_y;
              cur_pos_z := last_pos_z;
              Effect.perform (Obj_relink (objnum, n2));
              cur_segnum := n2)
            else (
              let cx, cy, cz = Effect.perform (Compute_segment_center !cur_segnum) in
              cur_pos_x := cx + objnum;
              cur_pos_y := cy;
              cur_pos_z := cz))
          else (
            let cx, cy, cz = Effect.perform (Compute_segment_center !cur_segnum) in
            cur_pos_x := cx + objnum;
            cur_pos_y := cy;
            cur_pos_z := cz);
          if obj_type = obj_weapon then cur_flags := !cur_flags lor of_should_be_dead)));
    let (o_rx, o_ry, o_rz), (o_ux, o_uy, o_uz), (o_fx, o_fy, o_fz) = !orient_r in
    let base =
      [| !cur_pos_x
       ; !cur_pos_y
       ; !cur_pos_z
       ; !cur_vel_x
       ; !cur_vel_y
       ; !cur_vel_z
       ; o_rx
       ; o_ry
       ; o_rz
       ; o_ux
       ; o_uy
       ; o_uz
       ; o_fx
       ; o_fy
       ; o_fz
       ; !cur_segnum
       ; !cur_flags
       ; !cur_phys_flags
       ; turnroll_out
       ; rvx
       ; rvy
       ; rvz
       ; (if !retry_count > 0 then !retry_count - 1 else 0)
       ; !n_phys_segs
       ; (if needs_levelling then 1 else 0)
      |]
    in
    let segs = Array.sub phys_seglist ~pos:0 ~len:!n_phys_segs in
    Array.append base segs)
;;
