(* Pure game logic for control center frame AI.
   do_controlcen_frame: detects player, selects gun, fires lasers with spread. *)

let f1_0 = 0x10000
let ndl = 5

(* -- Algebraic effects for side effects -------------------------------- *)

type _ Effect.t +=
  | Fire_weapon : (int * int * int * int * int * int * int * int) -> unit Effect.t
  | Send_controlcen_fire : (int * int * int * int * int) -> unit Effect.t
  | Make_random_vector : (int * int * int) Effect.t
  | P_Rand : int Effect.t

(* Fire_weapon args: dir_x, dir_y, dir_z, pos_x, pos_y, pos_z, parent_id, make_sound *)
(* Send_controlcen_fire args: dir_x, dir_y, dir_z, gun_num, obj_id *)
(* Make_random_vector returns: (rx, ry, rz) *)
(* P_Rand returns: int *)

(* FVI external for inline visibility check — reuses physics sim C function *)
external fvi_find_vector_intersection : int array -> int array
  = "cd_ox_effect_ps_find_vector_intersection"

(* Inline visibility check using FVI ray cast.
   Returns 2 if player visible (hit nothing or hit the player object), 0 otherwise. *)
let check_player_visible ~obj_x ~obj_y ~obj_z ~obj_segnum ~console_x ~console_y
    ~console_z ~obj_id ~player_objnum =
  let query = [| obj_x; obj_y; obj_z; console_x; console_y; console_z;
                 f1_0 / 4;      (* rad = F1_0/4 *)
                 obj_id;        (* thisobjnum *)
                 5;             (* FQ_TRANSWALL | FQ_CHECK_OBJS *)
                 obj_segnum;    (* startseg *)
                 0 |]           (* no ignore list *)
  in
  let result = fvi_find_vector_intersection query in
  let hit_type = result.(0) in
  let hit_object = result.(7) in
  if hit_type = 0 (* HIT_NONE *)
     || (hit_type = 2 (* HIT_OBJECT *) && hit_object = player_objnum)
  then 2 else 0

(* -- D1: do_controlcen_frame ------------------------------------------- *)

let do_controlcen_frame_d1
      ~cc_been_hit
      ~cc_player_seen
      ~cc_next_fire_time
      ~n_guns
      ~gun_pos_flat
      ~gun_dir_flat
      ~frame_count
      ~frame_time
      ~game_mode
      ~difficulty_level
      ~player_flags
      ~player_is_dead
      ~game_time
      ~player_time_of_death
      ~obj_x
      ~obj_y
      ~obj_z
      ~obj_segnum
      ~console_x
      ~console_y
      ~console_z
      ~believed_x
      ~believed_y
      ~believed_z
      ~has_children
      ~obj_id
      ~player_objnum
  =
  let player_flags_cloaked = 0x800 in
  let cc_been_hit = ref cc_been_hit in
  let cc_player_seen = ref cc_player_seen in
  let cc_next_fire_time = ref cc_next_fire_time in
  if not (!cc_been_hit <> 0 || !cc_player_seen <> 0)
  then (
    (* Detection phase: every 8 frames *)
    if frame_count mod 8 = 0
    then
      if not (has_children <> 0)
      then () (* isolated segment, bail *)
      else (
        let vtpx = console_x - obj_x in
        let vtpy = console_y - obj_y in
        let vtpz = console_z - obj_z in
        let dist, (nx, ny, nz) =
          Ox_math.vm_vec_copy_normalize_quick ~v:(vtpx, vtpy, vtpz)
        in
        if dist < f1_0 * 200
        then (
          let vis =
            check_player_visible ~obj_x ~obj_y ~obj_z ~obj_segnum ~console_x
              ~console_y ~console_z ~obj_id ~player_objnum
          in
          cc_player_seen := vis;
          cc_next_fire_time := 0));
    [| !cc_been_hit; !cc_player_seen; !cc_next_fire_time |])
  else if
    !cc_next_fire_time < 0
    && not (player_is_dead <> 0 && game_time > player_time_of_death + (f1_0 * 2))
  then (
    (* Fire phase *)
    let target_x, target_y, target_z =
      if player_flags land player_flags_cloaked <> 0
      then believed_x, believed_y, believed_z
      else console_x, console_y, console_z
    in
    (* calc_best_gun inline via packed array *)
    let packed_len = 1 + (6 * n_guns) + 3 in
    let packed = Array.create ~len:packed_len 0 in
    packed.(0) <- n_guns;
    for i = 0 to n_guns - 1 do
      packed.(1 + (3 * i)) <- gun_pos_flat.(3 * i);
      packed.(1 + (3 * i) + 1) <- gun_pos_flat.((3 * i) + 1);
      packed.(1 + (3 * i) + 2) <- gun_pos_flat.((3 * i) + 2)
    done;
    let dir_off = 1 + (3 * n_guns) in
    for i = 0 to n_guns - 1 do
      packed.(dir_off + (3 * i)) <- gun_dir_flat.(3 * i);
      packed.(dir_off + (3 * i) + 1) <- gun_dir_flat.((3 * i) + 1);
      packed.(dir_off + (3 * i) + 2) <- gun_dir_flat.((3 * i) + 2)
    done;
    let obj_off = 1 + (6 * n_guns) in
    packed.(obj_off) <- target_x;
    packed.(obj_off + 1) <- target_y;
    packed.(obj_off + 2) <- target_z;
    let best_gun_num = Ox_collide.calc_best_gun packed in
    if best_gun_num <> -1
    then (
      let gun_px = gun_pos_flat.(3 * best_gun_num) in
      let gun_py = gun_pos_flat.((3 * best_gun_num) + 1) in
      let gun_pz = gun_pos_flat.((3 * best_gun_num) + 2) in
      let vtgx = target_x - gun_px in
      let vtgy = target_y - gun_py in
      let vtgz = target_z - gun_pz in
      let dist, (nx, ny, nz) =
        Ox_math.vm_vec_copy_normalize_quick ~v:(vtgx, vtgy, vtgz)
      in
      if dist > f1_0 * 300
      then (
        cc_been_hit := 0;
        cc_player_seen := 0;
        [| !cc_been_hit; !cc_player_seen; !cc_next_fire_time |])
      else (
        let vec_x = ref nx in
        let vec_y = ref ny in
        let vec_z = ref nz in
        if game_mode land 1 <> 0
        then
          Effect.perform
            (Send_controlcen_fire (!vec_x, !vec_y, !vec_z, best_gun_num, obj_id));
        Effect.perform
          (Fire_weapon (!vec_x, !vec_y, !vec_z, gun_px, gun_py, gun_pz, obj_id, 1));
        (* 1/4 of time, fire another spread shot *)
        let prand = Effect.perform P_Rand in
        if prand < 32767 / 4
        then (
          let rx, ry, rz = Effect.perform Make_random_vector in
          let sx, sy, sz =
            Ox_math.vm_vec_scale_add2
              ~dest:(!vec_x, !vec_y, !vec_z)
              ~src:(rx, ry, rz)
              ~k:(f1_0 / 4)
          in
          let _, (nx2, ny2, nz2) = Ox_math.vm_vec_copy_normalize_quick ~v:(sx, sy, sz) in
          vec_x := nx2;
          vec_y := ny2;
          vec_z := nz2;
          if game_mode land 1 <> 0
          then
            Effect.perform
              (Send_controlcen_fire (!vec_x, !vec_y, !vec_z, best_gun_num, obj_id));
          Effect.perform
            (Fire_weapon (!vec_x, !vec_y, !vec_z, gun_px, gun_py, gun_pz, obj_id, 1)));
        let delta_fire_time = ref ((ndl - difficulty_level) * f1_0 / 4) in
        if game_mode land 1 <> 0 then delta_fire_time := !delta_fire_time * 2;
        cc_next_fire_time := !delta_fire_time;
        [| !cc_been_hit; !cc_player_seen; !cc_next_fire_time |]))
    else [| !cc_been_hit; !cc_player_seen; !cc_next_fire_time |])
  else (
    cc_next_fire_time := !cc_next_fire_time - frame_time;
    [| !cc_been_hit; !cc_player_seen; !cc_next_fire_time |])
;;

(* -- D2: do_controlcen_frame ------------------------------------------- *)

let do_controlcen_frame_d2
      ~cc_been_hit
      ~cc_player_seen
      ~cc_next_fire_time
      ~n_guns
      ~gun_pos_flat
      ~gun_dir_flat
      ~frame_count
      ~frame_time
      ~game_mode
      ~difficulty_level
      ~player_flags
      ~player_is_dead
      ~game_time
      ~player_time_of_death
      ~obj_x
      ~obj_y
      ~obj_z
      ~obj_segnum
      ~console_x
      ~console_y
      ~console_z
      ~believed_x
      ~believed_y
      ~believed_z
      ~has_children
      ~obj_id
      ~player_objnum
      ~current_level_num
      ~last_time_cc_vis_check
  =
  let player_flags_cloaked = 0x800 in
  let cc_been_hit = ref cc_been_hit in
  let cc_player_seen = ref cc_player_seen in
  let cc_next_fire_time = ref cc_next_fire_time in
  let last_vis_check = ref last_time_cc_vis_check in
  if not (!cc_been_hit <> 0 || !cc_player_seen <> 0)
  then (
    (* Detection phase: every 8 frames *)
    if frame_count mod 8 = 0
    then
      if not (has_children <> 0)
      then () (* isolated segment, bail *)
      else (
        let vtpx = console_x - obj_x in
        let vtpy = console_y - obj_y in
        let vtpz = console_z - obj_z in
        let dist, (nx, ny, nz) =
          Ox_math.vm_vec_copy_normalize_quick ~v:(vtpx, vtpy, vtpz)
        in
        if dist < f1_0 * 200
        then (
          let vis =
            check_player_visible ~obj_x ~obj_y ~obj_z ~obj_segnum ~console_x
              ~console_y ~console_z ~obj_id ~player_objnum
          in
          cc_player_seen := vis;
          cc_next_fire_time := 0));
    [| !cc_been_hit; !cc_player_seen; !cc_next_fire_time; !last_vis_check |])
  else (
    (* D2: periodic visibility re-check every 5 seconds *)
    if !cc_been_hit <> 0 || !cc_player_seen <> 0
    then
      if !last_vis_check + (f1_0 * 5) < game_time || !last_vis_check > game_time
      then (
        let vtpx = console_x - obj_x in
        let vtpy = console_y - obj_y in
        let vtpz = console_z - obj_z in
        let dist, (nx, ny, nz) =
          Ox_math.vm_vec_copy_normalize_quick ~v:(vtpx, vtpy, vtpz)
        in
        last_vis_check := game_time;
        if dist < f1_0 * 120
        then (
          let vis =
            check_player_visible ~obj_x ~obj_y ~obj_z ~obj_segnum ~console_x
              ~console_y ~console_z ~obj_id ~player_objnum
          in
          cc_player_seen := vis;
          if !cc_player_seen = 0 then cc_been_hit := 0));
    if
      !cc_next_fire_time < 0
      && not (player_is_dead <> 0 && game_time > player_time_of_death + (f1_0 * 2))
    then (
      (* Fire phase *)
      let target_x, target_y, target_z =
        if player_flags land player_flags_cloaked <> 0
        then believed_x, believed_y, believed_z
        else console_x, console_y, console_z
      in
      let packed_len = 1 + (6 * n_guns) + 3 in
      let packed = Array.create ~len:packed_len 0 in
      packed.(0) <- n_guns;
      for i = 0 to n_guns - 1 do
        packed.(1 + (3 * i)) <- gun_pos_flat.(3 * i);
        packed.(1 + (3 * i) + 1) <- gun_pos_flat.((3 * i) + 1);
        packed.(1 + (3 * i) + 2) <- gun_pos_flat.((3 * i) + 2)
      done;
      let dir_off = 1 + (3 * n_guns) in
      for i = 0 to n_guns - 1 do
        packed.(dir_off + (3 * i)) <- gun_dir_flat.(3 * i);
        packed.(dir_off + (3 * i) + 1) <- gun_dir_flat.((3 * i) + 1);
        packed.(dir_off + (3 * i) + 2) <- gun_dir_flat.((3 * i) + 2)
      done;
      let obj_off = 1 + (6 * n_guns) in
      packed.(obj_off) <- target_x;
      packed.(obj_off + 1) <- target_y;
      packed.(obj_off + 2) <- target_z;
      let best_gun_num = Ox_collide.calc_best_gun packed in
      if best_gun_num <> -1
      then (
        let gun_px = gun_pos_flat.(3 * best_gun_num) in
        let gun_py = gun_pos_flat.((3 * best_gun_num) + 1) in
        let gun_pz = gun_pos_flat.((3 * best_gun_num) + 2) in
        let vtgx = target_x - gun_px in
        let vtgy = target_y - gun_py in
        let vtgz = target_z - gun_pz in
        let dist, (nx, ny, nz) =
          Ox_math.vm_vec_copy_normalize_quick ~v:(vtgx, vtgy, vtgz)
        in
        if dist > f1_0 * 300
        then (
          cc_been_hit := 0;
          cc_player_seen := 0;
          [| !cc_been_hit; !cc_player_seen; !cc_next_fire_time; !last_vis_check |])
        else (
          let vec_x = ref nx in
          let vec_y = ref ny in
          let vec_z = ref nz in
          if game_mode land 1 <> 0
          then
            Effect.perform
              (Send_controlcen_fire (!vec_x, !vec_y, !vec_z, best_gun_num, obj_id));
          Effect.perform
            (Fire_weapon (!vec_x, !vec_y, !vec_z, gun_px, gun_py, gun_pz, obj_id, 1));
          (* D2: fire multiple spread shots based on level *)
          let rand_prob = f1_0 / ((abs current_level_num / 4) + 2) in
          let count = ref 0 in
          let keep_firing = ref true in
          while !keep_firing && !count < 4 do
            let prand = Effect.perform P_Rand in
            if prand > rand_prob
            then (
              let rx, ry, rz = Effect.perform Make_random_vector in
              let sx, sy, sz =
                Ox_math.vm_vec_scale_add2
                  ~dest:(!vec_x, !vec_y, !vec_z)
                  ~src:(rx, ry, rz)
                  ~k:(f1_0 / 6)
              in
              let _, (nx2, ny2, nz2) =
                Ox_math.vm_vec_copy_normalize_quick ~v:(sx, sy, sz)
              in
              vec_x := nx2;
              vec_y := ny2;
              vec_z := nz2;
              if game_mode land 1 <> 0
              then
                Effect.perform
                  (Send_controlcen_fire (!vec_x, !vec_y, !vec_z, best_gun_num, obj_id));
              Effect.perform
                (Fire_weapon (!vec_x, !vec_y, !vec_z, gun_px, gun_py, gun_pz, obj_id, 0));
              count := !count + 1)
            else keep_firing := false
          done;
          let delta_fire_time = ref ((ndl - difficulty_level) * f1_0 / 4) in
          if difficulty_level = 0 then delta_fire_time := !delta_fire_time + (f1_0 / 2);
          if game_mode land 1 <> 0 then delta_fire_time := !delta_fire_time * 2;
          cc_next_fire_time := !delta_fire_time;
          [| !cc_been_hit; !cc_player_seen; !cc_next_fire_time; !last_vis_check |]))
      else [| !cc_been_hit; !cc_player_seen; !cc_next_fire_time; !last_vis_check |])
    else (
      cc_next_fire_time := !cc_next_fire_time - frame_time;
      [| !cc_been_hit; !cc_player_seen; !cc_next_fire_time; !last_vis_check |]))
;;
