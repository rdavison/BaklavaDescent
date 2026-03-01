(* Bridge adapter for physics sim logic (do_physics_sim).
   Uses algebraic effects: OCaml performs effects, C handler executes them. *)

(* Effect externals — called from OCaml effect handler, dispatch to C *)

(* find_vector_intersection:
   Takes packed query (p0xyz, p1xyz, rad, thisobjnum, ignore_list, flags, startseg)
   Returns packed result (fate, hit_pnt xyz, hit_seg, hit_side, hit_side_seg,
   hit_object, wallnorm xyz, n_segs, seglist[]) *)
external effect_find_vector_intersection
  :  int array
  -> int array
  = "cd_ox_effect_ps_find_vector_intersection"

(* collide_object_with_wall:
   Args: hit_speed, wall_seg, wall_side, hit_px, hit_py, hit_pz, obj_flags
   Returns: updated obj_flags *)
external effect_collide_object_with_wall
  :  int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int
  = "cd_ox_effect_ps_collide_object_with_wall_bytecode"
    "cd_ox_effect_ps_collide_object_with_wall"

(* scrape_object_on_wall:
   Args: wall_seg, wall_side, hit_px, hit_py, hit_pz
   Returns: updated obj_flags *)
external effect_scrape_object_on_wall
  :  int
  -> int
  -> int
  -> int
  -> int
  -> int
  = "cd_ox_effect_ps_scrape_object_on_wall_bytecode"
    "cd_ox_effect_ps_scrape_object_on_wall"

(* collide_two_objects:
   Args: hit_objnum, pos_hit_x, pos_hit_y, pos_hit_z
   Returns: (obj_flags, new_vx, new_vy, new_vz) *)
external effect_collide_two_objects
  :  int
  -> int
  -> int
  -> int
  -> int * int * int * int
  = "cd_ox_effect_ps_collide_two_objects"

external effect_obj_relink : int -> int -> unit = "cd_ox_effect_ps_obj_relink"
external effect_find_object_seg : int -> int = "cd_ox_effect_ps_find_object_seg"
external effect_update_object_seg : int -> unit = "cd_ox_effect_ps_update_object_seg"

external effect_find_point_seg
  :  int
  -> int
  -> int
  -> int
  -> int
  = "cd_ox_effect_ps_find_point_seg"

external effect_get_seg_masks
  :  int
  -> int
  -> int
  -> int
  -> int
  = "cd_ox_effect_ps_get_seg_masks"

external effect_compute_segment_center
  :  int
  -> int * int * int
  = "cd_ox_effect_ps_compute_segment_center"

external effect_add_stuck_object : int -> int -> unit = "cd_ox_effect_ps_add_stuck_object"

external effect_find_connect_side
  :  int
  -> int
  -> int
  = "cd_ox_effect_ps_find_connect_side"

external effect_wall_is_doorway : int -> int -> int = "cd_ox_effect_ps_wall_is_doorway"

(* create_abs_vertex_lists_and_dist:
   Args: seg, side, start_px, start_py, start_pz
   Returns: (dist, normal_x, normal_y, normal_z) *)
external effect_create_abs_vertex_lists_and_dist
  :  int
  -> int
  -> int
  -> int
  -> int
  -> int * int * int * int
  = "cd_ox_effect_ps_create_abs_vertex_lists_and_dist"

(* D2 only: check if tmap has forcefield flag *)
external effect_tmap_is_force_field
  :  int
  -> int
  -> int
  = "cd_ox_effect_ps_tmap_is_force_field"

(* D2 only: vm_vector_2_matrix for weapon orient on bounce *)
external effect_vm_vector_2_matrix_orient
  :  int
  -> int
  -> int
  -> int
  -> int
  -> int
  -> int * int * int * int * int * int * int * int * int
  = "cd_ox_effect_ps_vm_vector_2_matrix_orient_bytecode"
    "cd_ox_effect_ps_vm_vector_2_matrix_orient"

(* Effect handler *)
let physics_sim_effect_handler
  : type a. a Effect.t -> ((a, _) Effect.Deep.continuation -> _) option
  =
  fun eff ->
  match eff with
  | Ox_physics_sim.Find_vector_intersection
      (p0x, p0y, p0z, p1x, p1y, p1z, rad, thisobjnum, ignore_list, flags, startseg) ->
    Some
      (fun k ->
        let query =
          [| p0x
           ; p0y
           ; p0z
           ; p1x
           ; p1y
           ; p1z
           ; rad
           ; thisobjnum
           ; flags
           ; startseg
           ; Array.length ignore_list
          |]
        in
        let packed = Array.append query ignore_list in
        let result = effect_find_vector_intersection packed in
        (* Unpack: fate, hit_pnt xyz, hit_seg, hit_side, hit_side_seg,
           hit_object, wallnorm xyz, n_segs, seglist[] *)
        let fate = result.(0) in
        let hit_px = result.(1) in
        let hit_py = result.(2) in
        let hit_pz = result.(3) in
        let hit_seg = result.(4) in
        let hit_side = result.(5) in
        let hit_side_seg = result.(6) in
        let hit_object = result.(7) in
        let wn_x = result.(8) in
        let wn_y = result.(9) in
        let wn_z = result.(10) in
        let n_segs = result.(11) in
        let seglist = Array.sub result ~pos:12 ~len:n_segs in
        Effect.Deep.continue
          k
          ( fate
          , hit_px
          , hit_py
          , hit_pz
          , hit_seg
          , hit_side
          , hit_side_seg
          , hit_object
          , wn_x
          , wn_y
          , wn_z
          , n_segs
          , seglist ))
  | Ox_physics_sim.Collide_object_with_wall
      (hit_speed, wall_seg, wall_side, hit_px, hit_py, hit_pz, obj_flags) ->
    Some
      (fun k ->
        let result =
          effect_collide_object_with_wall
            hit_speed
            wall_seg
            wall_side
            hit_px
            hit_py
            hit_pz
            obj_flags
        in
        Effect.Deep.continue k result)
  | Ox_physics_sim.Scrape_object_on_wall (wall_seg, wall_side, hit_px, hit_py, hit_pz) ->
    Some
      (fun k ->
        let result =
          effect_scrape_object_on_wall wall_seg wall_side hit_px hit_py hit_pz
        in
        Effect.Deep.continue k result)
  | Ox_physics_sim.Collide_two_objects (hit_objnum, pos_hit_x, pos_hit_y, pos_hit_z) ->
    Some
      (fun k ->
        let result =
          effect_collide_two_objects hit_objnum pos_hit_x pos_hit_y pos_hit_z
        in
        Effect.Deep.continue k result)
  | Ox_physics_sim.Obj_relink (objnum, new_seg) ->
    Some
      (fun k ->
        effect_obj_relink objnum new_seg;
        Effect.Deep.continue k ())
  | Ox_physics_sim.Find_object_seg objnum ->
    Some
      (fun k ->
        let result = effect_find_object_seg objnum in
        Effect.Deep.continue k result)
  | Ox_physics_sim.Update_object_seg objnum ->
    Some
      (fun k ->
        effect_update_object_seg objnum;
        Effect.Deep.continue k ())
  | Ox_physics_sim.Find_point_seg (px, py, pz, seg) ->
    Some
      (fun k ->
        let result = effect_find_point_seg px py pz seg in
        Effect.Deep.continue k result)
  | Ox_physics_sim.Get_seg_masks (px, py, pz, seg) ->
    Some
      (fun k ->
        let result = effect_get_seg_masks px py pz seg in
        Effect.Deep.continue k result)
  | Ox_physics_sim.Compute_segment_center seg ->
    Some
      (fun k ->
        let result = effect_compute_segment_center seg in
        Effect.Deep.continue k result)
  | Ox_physics_sim.Add_stuck_object (wall_seg, wall_side) ->
    Some
      (fun k ->
        effect_add_stuck_object wall_seg wall_side;
        Effect.Deep.continue k ())
  | Ox_physics_sim.Find_connect_side (seg1, seg2) ->
    Some
      (fun k ->
        let result = effect_find_connect_side seg1 seg2 in
        Effect.Deep.continue k result)
  | Ox_physics_sim.Wall_is_doorway (seg, side) ->
    Some
      (fun k ->
        let result = effect_wall_is_doorway seg side in
        Effect.Deep.continue k result)
  | Ox_physics_sim.Create_abs_vertex_lists_and_dist (seg, side, spx, spy, spz) ->
    Some
      (fun k ->
        let result = effect_create_abs_vertex_lists_and_dist seg side spx spy spz in
        Effect.Deep.continue k result)
  | Ox_physics_sim.Tmap_is_force_field (seg, side) ->
    Some
      (fun k ->
        let result = effect_tmap_is_force_field seg side in
        Effect.Deep.continue k result)
  | Ox_physics_sim.Vm_vector_2_matrix_orient (vx, vy, vz, ux, uy, uz) ->
    Some
      (fun k ->
        let result = effect_vm_vector_2_matrix_orient vx vy vz ux uy uz in
        Effect.Deep.continue k result)
  | _ -> None
;;

(* D1 bridge function *)
let cd_do_physics_sim_d1
      pos_x
      pos_y
      pos_z
      vel_x
      vel_y
      vel_z
      thrust_x
      thrust_y
      thrust_z
      orient
      rotvel_x
      rotvel_y
      rotvel_z
      rotthrust_x
      rotthrust_y
      rotthrust_z
      size
      mass
      drag
      phys_flags
      obj_flags
      obj_type
      obj_id
      obj_segnum
      objnum
      turnroll
      last_pos_x
      last_pos_y
      last_pos_z
      frame_time
      physics_cheat_flag
  =
  Effect.Deep.match_with
    (fun () ->
       Ox_physics_sim.do_physics_sim_d1
         ~pos_x
         ~pos_y
         ~pos_z
         ~vel_x
         ~vel_y
         ~vel_z
         ~thrust_x
         ~thrust_y
         ~thrust_z
         ~orient
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
         ~obj_id
         ~obj_segnum
         ~objnum
         ~turnroll
         ~last_pos_x
         ~last_pos_y
         ~last_pos_z
         ~frame_time
         ~physics_cheat_flag)
    ()
    { retc = (fun x -> x)
    ; exnc = raise
    ; effc = (fun (type a) (eff : a Effect.t) -> physics_sim_effect_handler eff)
    }
;;

(* D2 bridge function *)
let cd_do_physics_sim_d2
      pos_x
      pos_y
      pos_z
      vel_x
      vel_y
      vel_z
      thrust_x
      thrust_y
      thrust_z
      orient
      rotvel_x
      rotvel_y
      rotvel_z
      rotthrust_x
      rotthrust_y
      rotthrust_z
      size
      mass
      drag
      phys_flags
      obj_flags
      obj_type
      obj_id
      obj_segnum
      objnum
      turnroll
      last_pos_x
      last_pos_y
      last_pos_z
      orient_uvec_x
      orient_uvec_y
      orient_uvec_z
      seg_special
      frame_time
      physics_cheat_flag
  =
  Effect.Deep.match_with
    (fun () ->
       Ox_physics_sim.do_physics_sim_d2
         ~pos_x
         ~pos_y
         ~pos_z
         ~vel_x
         ~vel_y
         ~vel_z
         ~thrust_x
         ~thrust_y
         ~thrust_z
         ~orient
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
         ~obj_id
         ~obj_segnum
         ~objnum
         ~turnroll
         ~last_pos_x
         ~last_pos_y
         ~last_pos_z
         ~orient_uvec_x
         ~orient_uvec_y
         ~orient_uvec_z
         ~seg_special
         ~frame_time
         ~physics_cheat_flag)
    ()
    { retc = (fun x -> x)
    ; exnc = raise
    ; effc = (fun (type a) (eff : a Effect.t) -> physics_sim_effect_handler eff)
    }
;;

let () =
  Callback.register "cd_do_physics_sim_d1" cd_do_physics_sim_d1;
  Callback.register "cd_do_physics_sim_d2" cd_do_physics_sim_d2
;;
