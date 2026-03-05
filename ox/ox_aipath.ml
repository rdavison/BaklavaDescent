(* AI Pathfinding — pure OCaml port of main_d2/aipath.cpp.
   BFS pathfinding, path creation wrappers, path following, and recovery.
   Paths stored per-robot in hash table instead of global Point_segs array. *)

let f1_0 = 0x10000

(* -- Constants ------------------------------------------------------------ *)

let max_segments = 900
let max_sides_per_segment = 6
let wid_fly_flag = 1
let aim_still = 0
let aim_wander = 1
let aim_follow_path = 2
let aim_run_from_object = 4
let aim_snipe_fire = 11
let aim_snipe_retreat_backwards = 13
let aim_thief_attack = 15
let aib_still = 0x80
let aib_normal = 0x81
let aib_run_from = 0x83
let aib_snipe = 0x84
let aib_station = 0x85
let aib_follow = 0x86
let max_path_length = 200
let max_depth_to_search = 30
let avoid_seg_length = 7
let prand_max = 32767
let hit_none = 0
let hit_wall = 1

(* -- Effects -------------------------------------------------------------- *)
(* These are performed by pathfinding functions and handled in ai_frame_bridge *)

type _ Effect.t +=
  | Fetch_wall_data : (int * int) -> int array Effect.t
    (* (segnum, sidenum) -> [wall_num, wall_type, wall_keys, wall_flags,
       wall_state, clip_num, controlling_trigger, wallanim_flags] *)
  | Path_fvi_query : int array -> int array Effect.t
    (* [p0x,p0y,p0z, startseg, p1x,p1y,p1z, rad, thisobjnum] ->
       [hit_type, hit_x, hit_y, hit_z, hit_seg] *)
  | Path_obj_relink : int array -> unit Effect.t
    (* [objnum, x, y, z, segnum] — teleport object and relink *)
  | Path_move_to_legal_spot : unit Effect.t
  | Path_find_object_seg : (int * int * int) -> int Effect.t
    (* (x, y, z) -> segment or -1 *)

(* -- Path store ----------------------------------------------------------- *)
(* Per-robot path stored as flat array: [seg0; x0; y0; z0; seg1; x1; y1; z1; ...]
   4 ints per waypoint. Path length = Array.length path / 4. *)

let path_store : (int, int array) Hashtbl.Poly.t = Hashtbl.Poly.create ~size:200 ()
let path_dir_store : (int, int) Hashtbl.Poly.t = Hashtbl.Poly.create ~size:200 ()

let get_path objnum =
  match Hashtbl.find path_store objnum with
  | Some p -> p
  | None -> [||]
;;

let get_path_dir objnum =
  match Hashtbl.find path_dir_store objnum with
  | Some d -> d
  | None -> 1
;;

let set_path objnum path =
  Hashtbl.set path_store ~key:objnum ~data:path
;;

let set_path_dir objnum dir =
  Hashtbl.set path_dir_store ~key:objnum ~data:dir
;;

let path_point_seg path idx = path.(idx * 4)
let path_point_x path idx = path.(idx * 4 + 1)
let path_point_y path idx = path.(idx * 4 + 2)
let path_point_z path idx = path.(idx * 4 + 3)
let path_num_points path = Array.length path / 4

(* -- Helpers -------------------------------------------------------------- *)

let compute_seg_center_from_data (seg_data : int array) =
  let v i = seg_data.(56 + i*3), seg_data.(56 + i*3 + 1), seg_data.(56 + i*3 + 2) in
  Ox_gameseg.compute_segment_center
    ~v0:(v 0) ~v1:(v 1) ~v2:(v 2) ~v3:(v 3)
    ~v4:(v 4) ~v5:(v 5) ~v6:(v 6) ~v7:(v 7)
;;

let compute_side_center_from_data (seg_data : int array) sidenum =
  let sv = Ox_gameseg.side_to_verts.(sidenum) in
  let v i = seg_data.(56 + i*3), seg_data.(56 + i*3 + 1), seg_data.(56 + i*3 + 2) in
  Ox_gameseg.compute_center_point_on_side
    ~v0:(v sv.(0)) ~v1:(v sv.(1)) ~v2:(v sv.(2)) ~v3:(v sv.(3))
;;

(* Check if a door is openable by this robot *)
let check_door_openable ~is_d2 ~is_companion ~robot_id ~behavior ~player_flags ~mode
    ~segnum ~sidenum =
  let wall_data = Effect.perform (Fetch_wall_data (segnum, sidenum)) in
  let wall_num = wall_data.(0) in
  if wall_num = -1
  then false
  else if is_d2
  then
    Ox_ai.ai_door_is_openable_d2
      ~is_child:true
      ~is_console_object:false
      ~wall_num
      ~wall_type:wall_data.(1)
      ~wall_keys:wall_data.(2)
      ~wall_flags:wall_data.(3)
      ~wall_state:wall_data.(4)
      ~wall_clip_num:wall_data.(5)
      ~wall_controlling_trigger:wall_data.(6)
      ~wallanim_flags:wall_data.(7)
      ~objp_is_null:false
      ~is_companion
      ~robot_id
      ~ai_behavior:behavior
      ~player_flags
      ~ailp_mode:mode
    <> 0
  else
    Ox_ai.ai_door_is_openable_d1
      ~is_console_object:false
      ~robot_id
      ~ai_behavior:behavior
      ~wall_num
      ~wall_type:wall_data.(1)
      ~wall_keys:wall_data.(2)
      ~wall_flags:wall_data.(3)
    <> 0
;;

(* -- create_random_xlate -------------------------------------------------- *)

let create_random_xlate () =
  let xt = Array.init 6 ~f:(fun i -> i) in
  for i = 0 to 5 do
    let pr = Effect.perform Ox_misc.P_Rand_internal in
    let j = (pr * 6) / (prand_max + 1) in
    let j = max 0 (min 5 j) in
    let tmp = xt.(j) in
    xt.(j) <- xt.(i);
    xt.(i) <- tmp
  done;
  xt
;;

(* -- insert_center_points ------------------------------------------------- *)
(* Insert side-center midpoints between adjacent path segments for safety.
   Returns new path array. *)

let insert_center_points (psegs : int array) num_points =
  let n = num_points in
  if n <= 1 then psegs, n
  else (
    (* Expand: each pair gets a midpoint inserted *)
    let expanded = Array.create ~len:(n * 2 * 4) 0 in
    let count = ref 0 in
    (* Copy last point to position 2*(n-1) *)
    for i = n - 1 downto 0 do
      expanded.(2 * i * 4) <- psegs.(i * 4);
      expanded.(2 * i * 4 + 1) <- psegs.(i * 4 + 1);
      expanded.(2 * i * 4 + 2) <- psegs.(i * 4 + 2);
      expanded.(2 * i * 4 + 3) <- psegs.(i * 4 + 3)
    done;
    count := n;
    (* Insert center points *)
    for i = n - 1 downto 1 do
      let prev_seg = psegs.((i - 1) * 4) in
      let cur_seg = psegs.(i * 4) in
      let prev_data = Effect.perform (Ox_gameseg.Fetch_segment_data prev_seg) in
      let prev_children = Array.init 6 ~f:(fun s -> prev_data.(s)) in
      let connect_side =
        Ox_gameseg.find_connect_side ~children:prev_children ~base_seg_num:cur_seg
      in
      let connect_side = if connect_side = -1 then 0 else connect_side in
      let cpx, cpy, cpz = compute_side_center_from_data prev_data connect_side in
      (* Offset: slight pull toward previous point *)
      let ppx = psegs.((i - 1) * 4 + 1) in
      let ppy = psegs.((i - 1) * 4 + 2) in
      let ppz = psegs.((i - 1) * 4 + 3) in
      let dx = (ppx - cpx) / 16 in
      let dy = (ppy - cpy) / 16 in
      let dz = (ppz - cpz) / 16 in
      let midx = cpx - dx in
      let midy = cpy - dy in
      let midz = cpz - dz in
      (* Check if midpoint is in a valid segment *)
      let mid_seg =
        Ox_gameseg.find_point_seg_v2
          ~point:(midx, midy, midz) ~segnum:cur_seg
          ~n_segments:max_segments ~doing_lighting_hack:0
      in
      let final_x, final_y, final_z =
        if mid_seg = -1 then cpx, cpy, cpz
        else midx, midy, midz
      in
      (* Store midpoint at position 2*i - 1 *)
      let idx = (2 * i - 1) * 4 in
      expanded.(idx) <- cur_seg;
      expanded.(idx + 1) <- final_x;
      expanded.(idx + 2) <- final_y;
      expanded.(idx + 3) <- final_z;
      count := !count + 1
    done;
    let total = 2 * n - 1 in
    (* Now remove unnecessary center points that are nearly collinear *)
    for i = 0 to total - 1 do
      if i > 0 && i < total - 1 && i mod 2 = 1
      then (
        let px = expanded.((i - 1) * 4 + 1) in
        let py = expanded.((i - 1) * 4 + 2) in
        let pz = expanded.((i - 1) * 4 + 3) in
        let cx = expanded.(i * 4 + 1) in
        let cy = expanded.(i * 4 + 2) in
        let cz = expanded.(i * 4 + 3) in
        let nx = expanded.((i + 1) * 4 + 1) in
        let ny = expanded.((i + 1) * 4 + 2) in
        let nz = expanded.((i + 1) * 4 + 3) in
        let t1 = cx - px, cy - py, cz - pz in
        let t2 = nx - cx, ny - cy, nz - cz in
        let dot = Ox_math.vm_vec_dotprod ~a:t1 ~b:t2 in
        let m1 = Ox_math.vm_vec_mag ~v:t1 in
        let m2 = Ox_math.vm_vec_mag ~v:t2 in
        let product = Ox_math.fixmul ~a:m1 ~b:m2 in
        if dot * 9 / 8 > product
        then expanded.(i * 4) <- -1 (* mark for removal *))
    done;
    (* Compact: remove marked points *)
    let result = Array.create ~len:(total * 4) 0 in
    let j = ref 0 in
    for i = 0 to total - 1 do
      if expanded.(i * 4) <> -1
      then (
        result.(!j * 4) <- expanded.(i * 4);
        result.(!j * 4 + 1) <- expanded.(i * 4 + 1);
        result.(!j * 4 + 2) <- expanded.(i * 4 + 2);
        result.(!j * 4 + 3) <- expanded.(i * 4 + 3);
        j := !j + 1)
    done;
    Array.sub result ~pos:0 ~len:(!j * 4), !j)
;;

(* -- create_path_points --------------------------------------------------- *)
(* Core BFS pathfinder. Returns path as flat array [seg;x;y;z; ...] and count,
   or empty array and -1 on failure. *)

let rec create_path_points ~start_seg ~end_seg_in ~max_depth_in
    ~random_flag_in ~safety_flag ~avoid_seg_in
    ~behavior ~is_d2 ~console_segnum ~obj_size ~objnum
    ~is_companion ~robot_id ~player_flags ~mode =
  let end_seg = ref end_seg_in in
  let random_flag = ref random_flag_in in
  let avoid_seg =
    if behavior = aib_run_from
    then (
      random_flag := 1;
      console_segnum)
    else avoid_seg_in
  in
  let max_depth = if max_depth_in = -1 then max_path_length else max_depth_in in
  let visited = Array.create ~len:max_segments false in
  let queue_start = Array.create ~len:max_segments 0 in
  let queue_end = Array.create ~len:max_segments 0 in
  let qdepth = Array.create ~len:max_segments 0 in
  let qtail = ref 0 in
  let qhead = ref 0 in
  let random_xlate = ref (Array.init 6 ~f:(fun i -> i)) in
  (* Mark avoid_seg as visited *)
  if avoid_seg >= 0 && avoid_seg < max_segments
  then
    if start_seg <> avoid_seg && !end_seg <> avoid_seg
    then visited.(avoid_seg) <- true;
  if !random_flag <> 0 then random_xlate := create_random_xlate ();
  let cur_seg = ref start_seg in
  if start_seg >= 0 && start_seg < max_segments then visited.(start_seg) <- true;
  let cur_depth = ref 0 in
  let bfs_done = ref false in
  (* BFS loop *)
  while !cur_seg <> !end_seg && not !bfs_done do
    let seg_data = Effect.perform (Ox_gameseg.Fetch_segment_data !cur_seg) in
    if !random_flag <> 0
    then (
      let pr = Effect.perform Ox_misc.P_Rand_internal in
      if pr < 8192 then random_xlate := create_random_xlate ());
    for sidenum = 0 to max_sides_per_segment - 1 do
      let snum = if !random_flag <> 0 then (!random_xlate).(sidenum) else sidenum in
      let child = seg_data.(snum) in
      if child >= 0 && child < max_segments
      then (
        let wid = seg_data.(80 + snum) in
        let passable =
          wid land wid_fly_flag <> 0
          || check_door_openable ~is_d2 ~is_companion ~robot_id ~behavior
               ~player_flags ~mode ~segnum:!cur_seg ~sidenum:snum
        in
        if passable
        then (
          (* D2: run-from FVI check when player in avoid_seg *)
          let skip_fvi = ref false in
          if is_d2
             && ((!cur_seg = avoid_seg) || (child = avoid_seg))
             && console_segnum = avoid_seg
          then (
            let side_center = compute_side_center_from_data seg_data snum in
            let scx, scy, scz = side_center in
            let obj_seg_data =
              Effect.perform (Ox_gameseg.Fetch_segment_data !cur_seg)
            in
            let ocx, ocy, ocz = compute_seg_center_from_data obj_seg_data in
            let fvi_result =
              Effect.perform
                (Path_fvi_query
                   [| ocx; ocy; ocz; !cur_seg; scx; scy; scz; obj_size; objnum |])
            in
            if fvi_result.(0) <> hit_none then skip_fvi := true);
          if (not !skip_fvi) && not visited.(child)
          then (
            queue_start.(!qtail) <- !cur_seg;
            queue_end.(!qtail) <- child;
            visited.(child) <- true;
            qdepth.(!qtail) <- !cur_depth + 1;
            qtail := !qtail + 1;
            if qdepth.(!qtail - 1) = max_depth
            then (
              end_seg := queue_end.(!qtail - 1);
              bfs_done := true))))
    done;
    if not !bfs_done
    then
      if !qhead >= !qtail
      then (
        (* Couldn't reach goal — use furthest reached *)
        if !qtail = 0
        then end_seg := start_seg (* no path at all *)
        else end_seg := queue_end.(!qtail - 1);
        bfs_done := true)
      else (
        cur_seg := queue_end.(!qhead);
        cur_depth := qdepth.(!qhead);
        qhead := !qhead + 1)
  done;
  (* Reconstruct path: trace back from end_seg through queue *)
  let qtail_idx = ref (!qtail - 1) in
  (* Find queue entry ending at end_seg *)
  while !qtail_idx >= 0 && queue_end.(!qtail_idx) <> !end_seg do
    qtail_idx := !qtail_idx - 1
  done;
  if !qtail_idx < 0
  then [||], 0 (* failure *)
  else (
    (* Build reversed path *)
    let path_segs = Array.create ~len:(max_path_length + 2) (-1) in
    let path_len = ref 0 in
    let qi = ref !qtail_idx in
    let continue_ = ref true in
    while !continue_ && !qi >= 0 do
      let this_seg = queue_end.(!qi) in
      let parent_seg = queue_start.(!qi) in
      path_segs.(!path_len) <- this_seg;
      path_len := !path_len + 1;
      if parent_seg = start_seg
      then continue_ := false
      else (
        (* Find queue entry ending at parent_seg *)
        qi := !qi - 1;
        while !qi >= 0 && queue_end.(!qi) <> parent_seg do
          qi := !qi - 1
        done;
        if !qi < 0 then continue_ := false)
    done;
    (* Add start_seg *)
    path_segs.(!path_len) <- start_seg;
    path_len := !path_len + 1;
    (* Reverse to get start→end order *)
    let n = !path_len in
    for i = 0 to n / 2 - 1 do
      let tmp = path_segs.(i) in
      path_segs.(i) <- path_segs.(n - 1 - i);
      path_segs.(n - 1 - i) <- tmp
    done;
    (* Build point array with segment centers *)
    let points = Array.create ~len:(n * 4) 0 in
    for i = 0 to n - 1 do
      let seg = path_segs.(i) in
      let seg_data = Effect.perform (Ox_gameseg.Fetch_segment_data seg) in
      let cx, cy, cz = compute_seg_center_from_data seg_data in
      points.(i * 4) <- seg;
      points.(i * 4 + 1) <- cx;
      points.(i * 4 + 2) <- cy;
      points.(i * 4 + 3) <- cz
    done;
    (* Insert center points if safety_flag *)
    if safety_flag <> 0 && n > 1
    then (
      let safe_points, safe_n = insert_center_points points n in
      (* D2: move_towards_outside for companion *)
      if is_d2 && is_companion
      then (
        let mto_points = move_towards_outside safe_points safe_n ~obj_size ~objnum ~rand_flag:0 in
        mto_points, path_num_points mto_points)
      else safe_points, safe_n)
    else (
      let result = Array.sub points ~pos:0 ~len:(n * 4) in
      if is_d2 && is_companion
      then (
        let mto_points = move_towards_outside result n ~obj_size ~objnum ~rand_flag:0 in
        mto_points, path_num_points mto_points)
      else result, n))

(* -- move_towards_outside ------------------------------------------------- *)
(* Adjust interior path points toward outside of segments. D2 companion only.
   Returns modified path array. *)
and move_towards_outside (psegs : int array) num_points ~obj_size ~objnum ~rand_flag =
  if num_points <= 2 then psegs
  else (
    let new_points = Array.copy psegs in
    for i = 1 to num_points - 2 do
      let seg = psegs.(i * 4) in
      let px = psegs.(i * 4 + 1) in
      let py = psegs.(i * 4 + 2) in
      let pz = psegs.(i * 4 + 3) in
      (* Verify segment *)
      let temp_seg =
        Ox_gameseg.find_point_seg_v2
          ~point:(px, py, pz) ~segnum:seg
          ~n_segments:max_segments ~doing_lighting_hack:0
      in
      let seg = if temp_seg <> -1 then temp_seg else seg in
      new_points.(i * 4) <- seg;
      (* Compute direction vectors *)
      let prev_x = psegs.((i - 1) * 4 + 1) in
      let prev_y = psegs.((i - 1) * 4 + 2) in
      let prev_z = psegs.((i - 1) * 4 + 3) in
      let next_x = psegs.((i + 1) * 4 + 1) in
      let next_y = psegs.((i + 1) * 4 + 2) in
      let next_z = psegs.((i + 1) * 4 + 3) in
      let a = Ox_math.vm_vec_sub ~a:(px, py, pz) ~b:(prev_x, prev_y, prev_z) in
      let b = Ox_math.vm_vec_sub ~a:(next_x, next_y, next_z) ~b:(px, py, pz) in
      let _c = Ox_math.vm_vec_sub ~a:(next_x, next_y, next_z) ~b:(prev_x, prev_y, prev_z) in
      let _, norm_a = Ox_math.vm_vec_normalize_quick ~v:a in
      let _, norm_b = Ox_math.vm_vec_normalize_quick ~v:b in
      let dot_ab = Ox_math.vm_vec_dotprod ~a:norm_a ~b:norm_b in
      (* Only adjust if path is roughly straight *)
      if abs dot_ab > 3 * f1_0 / 4
      then (
        let _, _, az = norm_a in
        let e =
          if abs az < f1_0 / 2
          then
            if rand_flag <> 0
            then (
              let pr1 = (Effect.perform Ox_misc.P_Rand_internal - 16384) / 2 in
              let pr2 = (Effect.perform Ox_misc.P_Rand_internal - 16384) / 2 in
              let ex = pr1 in
              let ey = pr2 in
              let ez = abs ex + abs ey + 1 in
              let _, ne = Ox_math.vm_vec_normalize_quick ~v:(ex, ey, ez) in
              ne)
            else 0, 0, f1_0
          else if rand_flag <> 0
          then (
            let pr1 = (Effect.perform Ox_misc.P_Rand_internal - 16384) / 2 in
            let pr2 = (Effect.perform Ox_misc.P_Rand_internal - 16384) / 2 in
            let ey = pr1 in
            let ez = pr2 in
            let ex = abs ey + abs ez + 1 in
            let _, ne = Ox_math.vm_vec_normalize_quick ~v:(ex, ey, ez) in
            ne)
          else f1_0, 0, 0
        in
        (* Get segment size *)
        let seg_data = Effect.perform (Ox_gameseg.Fetch_segment_data seg) in
        let v0 = seg_data.(56), seg_data.(57), seg_data.(58) in
        let v6 = seg_data.(56 + 18), seg_data.(56 + 19), seg_data.(56 + 20) in
        let segment_size = min (Ox_math.vm_vec_dist_quick ~a:v0 ~b:v6) (f1_0 * 40) in
        (* Goal position: offset by e * segment_size/4 *)
        let gx, gy, gz =
          Ox_math.vm_vec_scale_add ~a:(px, py, pz) ~b:e ~k:(segment_size / 4)
        in
        (* FVI iteration to find safe position *)
        let goal = ref (gx, gy, gz) in
        let count = ref 3 in
        while !count > 0 do
          let gx, gy, gz = !goal in
          let fvi_result =
            Effect.perform
              (Path_fvi_query [| px; py; pz; seg; gx; gy; gz; obj_size; objnum |])
          in
          if fvi_result.(0) = hit_none
          then count := 0
          else (
            goal := (px + fvi_result.(1)) / 2, (py + fvi_result.(2)) / 2, (pz + fvi_result.(3)) / 2;
            count := !count - 1;
            if !count = 0 then goal := px, py, pz)
        done;
        let gx, gy, gz = !goal in
        let new_seg =
          Ox_gameseg.find_point_seg_v2
            ~point:(gx, gy, gz) ~segnum:seg
            ~n_segments:max_segments ~doing_lighting_hack:0
        in
        if new_seg = seg
        then (
          new_points.(i * 4 + 1) <- gx;
          new_points.(i * 4 + 2) <- gy;
          new_points.(i * 4 + 3) <- gz))
      else (
        (* Use cross product for perpendicular direction *)
        let d = Ox_math.vm_vec_crossprod ~a:norm_a ~b:norm_b in
        let e = Ox_math.vm_vec_crossprod ~a:_c ~b:d in
        let _, e = Ox_math.vm_vec_normalize_quick ~v:e in
        let seg_data = Effect.perform (Ox_gameseg.Fetch_segment_data seg) in
        let v0 = seg_data.(56), seg_data.(57), seg_data.(58) in
        let v6 = seg_data.(56 + 18), seg_data.(56 + 19), seg_data.(56 + 20) in
        let segment_size = min (Ox_math.vm_vec_dist_quick ~a:v0 ~b:v6) (f1_0 * 40) in
        let gx, gy, gz =
          Ox_math.vm_vec_scale_add ~a:(px, py, pz) ~b:e ~k:(segment_size / 4)
        in
        let goal = ref (gx, gy, gz) in
        let count = ref 3 in
        while !count > 0 do
          let gx, gy, gz = !goal in
          let fvi_result =
            Effect.perform
              (Path_fvi_query [| px; py; pz; seg; gx; gy; gz; obj_size; objnum |])
          in
          if fvi_result.(0) = hit_none
          then count := 0
          else (
            goal := (px + fvi_result.(1)) / 2, (py + fvi_result.(2)) / 2, (pz + fvi_result.(3)) / 2;
            count := !count - 1;
            if !count = 0 then goal := px, py, pz)
        done;
        let gx, gy, gz = !goal in
        let new_seg =
          Ox_gameseg.find_point_seg_v2
            ~point:(gx, gy, gz) ~segnum:seg
            ~n_segments:max_segments ~doing_lighting_hack:0
        in
        if new_seg = seg
        then (
          new_points.(i * 4 + 1) <- gx;
          new_points.(i * 4 + 2) <- gy;
          new_points.(i * 4 + 3) <- gz))
    done;
    new_points)
;;

(* -- polish_path ---------------------------------------------------------- *)
(* Drop up to 2 leading waypoints if FVI shows line-of-sight from current pos.
   Returns shortened path and new count. *)

let polish_path (psegs : int array) num_points ~obj_x ~obj_y ~obj_z ~obj_segnum
    ~obj_size ~objnum ~is_companion ~frame_count =
  if num_points <= 4 then psegs, num_points
  else (
    (* Companion: prevent polishing twice per frame — approximated by frame_count parity *)
    if is_companion then psegs, num_points
    else (
      let first_point = ref 0 in
      let stop = ref false in
      for i = 0 to min 1 (num_points - 1) do
        if not !stop
        then (
          let px = psegs.(i * 4 + 1) in
          let py = psegs.(i * 4 + 2) in
          let pz = psegs.(i * 4 + 3) in
          let fvi_result =
            Effect.perform
              (Path_fvi_query
                 [| obj_x; obj_y; obj_z; obj_segnum; px; py; pz; obj_size; objnum |])
          in
          if fvi_result.(0) = hit_none
          then first_point := i + 1
          else stop := true)
      done;
      ignore frame_count;
      if !first_point > 0
      then (
        let new_n = num_points - !first_point in
        let new_path = Array.create ~len:(new_n * 4) 0 in
        Array.blit ~src:psegs ~dst:new_path
          ~src_pos:(!first_point * 4) ~dst_pos:0 ~len:(new_n * 4);
        new_path, new_n)
      else psegs, num_points))
;;

(* -- Path state result packing -------------------------------------------- *)
(* Returns int array matching unpack_path_state format:
   [0]hide_index [1]path_length [2]cur_path_index [3]path_dir
   [4]mode [5]goal_segment [6]time_player_seen [7]player_awareness_type
   [8]behavior [9]hide_segment [10]skip_ai_count *)

let pack_path_state ~path_length ~cur_path_index ~path_dir ~mode
    ~goal_segment ~time_player_seen ~player_awareness_type
    ~behavior ~hide_segment ~skip_ai_count =
  [| -1 (* hide_index: unused in OCaml path store *)
   ; path_length
   ; cur_path_index
   ; path_dir
   ; mode
   ; goal_segment
   ; time_player_seen
   ; player_awareness_type
   ; behavior
   ; hide_segment
   ; skip_ai_count
  |]
;;

(* -- create_path_to_player ------------------------------------------------ *)

let create_path_to_player ~objnum ~obj_segnum ~obj_x ~obj_y ~obj_z
    ~obj_size ~believed_seg ~max_length ~safety_flag
    ~behavior ~is_companion ~is_d2 ~game_time
    ~hide_segment ~skip_ai_count ~robot_id ~player_flags ~mode
    ~frame_count ~console_segnum =
  let max_length = if max_length = -1 then max_depth_to_search else max_length in
  let end_seg = believed_seg in
  if end_seg = -1
  then
    pack_path_state ~path_length:0 ~cur_path_index:0 ~path_dir:1
      ~mode:aim_follow_path ~goal_segment:end_seg ~time_player_seen:game_time
      ~player_awareness_type:0 ~behavior ~hide_segment ~skip_ai_count
  else (
    let path, n =
      create_path_points ~start_seg:obj_segnum ~end_seg_in:end_seg
        ~max_depth_in:max_length ~random_flag_in:1 ~safety_flag
        ~avoid_seg_in:(-1) ~behavior ~is_d2 ~console_segnum ~obj_size
        ~objnum ~is_companion ~robot_id ~player_flags ~mode
    in
    let path, n =
      if is_d2 && n > 0
      then
        polish_path path n ~obj_x ~obj_y ~obj_z ~obj_segnum ~obj_size
          ~objnum ~is_companion ~frame_count
      else path, n
    in
    set_path objnum path;
    set_path_dir objnum 1;
    pack_path_state ~path_length:n ~cur_path_index:0 ~path_dir:1
      ~mode:aim_follow_path ~goal_segment:end_seg ~time_player_seen:game_time
      ~player_awareness_type:0 ~behavior ~hide_segment ~skip_ai_count)
;;

(* -- create_path_to_station ----------------------------------------------- *)

let create_path_to_station ~objnum ~obj_segnum ~obj_x ~obj_y ~obj_z
    ~obj_size ~hide_segment ~max_length
    ~behavior ~is_companion ~is_d2 ~game_time
    ~skip_ai_count ~robot_id ~player_flags ~mode
    ~frame_count ~console_segnum =
  let max_length = if max_length = -1 then max_depth_to_search else max_length in
  let end_seg = hide_segment in
  if end_seg = -1
  then
    pack_path_state ~path_length:0 ~cur_path_index:0 ~path_dir:1
      ~mode:aim_follow_path ~goal_segment:end_seg ~time_player_seen:game_time
      ~player_awareness_type:0 ~behavior ~hide_segment ~skip_ai_count
  else (
    let path, n =
      create_path_points ~start_seg:obj_segnum ~end_seg_in:end_seg
        ~max_depth_in:max_length ~random_flag_in:1 ~safety_flag:1
        ~avoid_seg_in:(-1) ~behavior ~is_d2 ~console_segnum ~obj_size
        ~objnum ~is_companion ~robot_id ~player_flags ~mode
    in
    let path, n =
      if is_d2 && n > 0
      then
        polish_path path n ~obj_x ~obj_y ~obj_z ~obj_segnum ~obj_size
          ~objnum ~is_companion ~frame_count
      else path, n
    in
    set_path objnum path;
    set_path_dir objnum 1;
    pack_path_state ~path_length:n ~cur_path_index:0 ~path_dir:1
      ~mode:aim_follow_path ~goal_segment:end_seg ~time_player_seen:game_time
      ~player_awareness_type:0 ~behavior ~hide_segment ~skip_ai_count)
;;

(* -- create_n_segment_path ------------------------------------------------ *)

let create_n_segment_path ~objnum ~obj_segnum ~obj_x ~obj_y ~obj_z
    ~obj_size ~path_length_in ~avoid_seg
    ~behavior ~is_companion ~is_d2
    ~previous_visibility ~skip_ai_count ~hide_segment
    ~robot_id ~player_flags ~mode
    ~frame_count ~console_segnum ~game_time =
  let path_length = ref path_length_in in
  let path, n =
    let p, n =
      create_path_points ~start_seg:obj_segnum ~end_seg_in:(-2)
        ~max_depth_in:!path_length ~random_flag_in:1 ~safety_flag:0
        ~avoid_seg_in:avoid_seg ~behavior ~is_d2 ~console_segnum ~obj_size
        ~objnum ~is_companion ~robot_id ~player_flags ~mode
    in
    if n = 0
    then (
      (* Retry with decreasing length *)
      let result = ref (p, n) in
      while !path_length > 1 && snd !result = 0 do
        path_length := !path_length - 1;
        result :=
          create_path_points ~start_seg:obj_segnum ~end_seg_in:(-2)
            ~max_depth_in:!path_length ~random_flag_in:1 ~safety_flag:0
            ~avoid_seg_in:(-1) ~behavior ~is_d2 ~console_segnum ~obj_size
            ~objnum ~is_companion ~robot_id ~player_flags ~mode
      done;
      !result)
    else p, n
  in
  (* D2: move_towards_outside with randomness if previously visible *)
  let path =
    if is_d2 && previous_visibility <> 0 && n > 0
    then move_towards_outside path n ~obj_size ~objnum ~rand_flag:1
    else path
  in
  ignore (obj_x, obj_y, obj_z, frame_count);
  set_path objnum path;
  set_path_dir objnum 1;
  pack_path_state ~path_length:n ~cur_path_index:0 ~path_dir:1
    ~mode:aim_follow_path ~goal_segment:(-1) ~time_player_seen:game_time
    ~player_awareness_type:0 ~behavior ~hide_segment ~skip_ai_count
;;

let create_n_segment_path_to_door = create_n_segment_path

(* -- attempt_to_resume_path ----------------------------------------------- *)

let rec attempt_to_resume_path ~objnum ~obj_segnum ~obj_x ~obj_y ~obj_z ~obj_size
    ~behavior ~is_companion ~is_d2
    ~cur_path_index ~path_length ~hide_segment
    ~skip_ai_count ~robot_id ~player_flags ~mode
    ~frame_count ~console_segnum ~game_time =
  let path_dir = get_path_dir objnum in
  (* Station behavior: 50% chance to give up *)
  let give_up =
    behavior = aib_station && (not is_companion || not is_d2)
    && (Effect.perform Ox_misc.P_Rand_internal) > 8192
  in
  if give_up
  then (
    set_path objnum [||];
    pack_path_state ~path_length:0 ~cur_path_index:0 ~path_dir:1
      ~mode:aim_still ~goal_segment:(-1) ~time_player_seen:game_time
      ~player_awareness_type:0 ~behavior ~hide_segment:obj_segnum ~skip_ai_count)
  else (
    let new_index = cur_path_index - path_dir in
    if new_index >= 0 && new_index < path_length
    then
      (* Back up one step *)
      pack_path_state ~path_length ~cur_path_index:new_index ~path_dir
        ~mode ~goal_segment:(-1) ~time_player_seen:game_time
        ~player_awareness_type:0 ~behavior ~hide_segment ~skip_ai_count
    else (
      (* At end of line — move to center and create new path *)
      move_towards_segment_center ~objnum ~obj_x ~obj_y ~obj_z ~obj_segnum ~obj_size;
      create_path_to_station ~objnum ~obj_segnum ~obj_x ~obj_y ~obj_z
        ~obj_size ~hide_segment ~max_length:15
        ~behavior ~is_companion ~is_d2 ~game_time
        ~skip_ai_count ~robot_id ~player_flags ~mode
        ~frame_count ~console_segnum))

(* -- move_towards_segment_center ------------------------------------------ *)
(* Move object one radius toward its segment center. *)

and move_towards_segment_center ~objnum ~obj_x ~obj_y ~obj_z ~obj_segnum ~obj_size =
  let seg_data = Effect.perform (Ox_gameseg.Fetch_segment_data obj_segnum) in
  let cx, cy, cz = compute_seg_center_from_data seg_data in
  let dir = Ox_math.vm_vec_sub ~a:(cx, cy, cz) ~b:(obj_x, obj_y, obj_z) in
  let mag, norm_dir = Ox_math.vm_vec_normalize_quick ~v:dir in
  if mag < obj_size
  then (
    (* Close enough: move to center *)
    let new_seg =
      Ox_gameseg.find_point_seg_v2
        ~point:(cx, cy, cz) ~segnum:obj_segnum
        ~n_segments:max_segments ~doing_lighting_hack:0
    in
    let seg = if new_seg <> -1 then new_seg else obj_segnum in
    Effect.perform (Path_obj_relink [| objnum; cx; cy; cz; seg |]))
  else (
    (* Move one radius toward center *)
    let nx, ny, nz =
      Ox_math.vm_vec_scale_add ~a:(obj_x, obj_y, obj_z) ~b:norm_dir ~k:obj_size
    in
    let new_seg =
      Ox_gameseg.find_point_seg_v2
        ~point:(nx, ny, nz) ~segnum:obj_segnum
        ~n_segments:max_segments ~doing_lighting_hack:0
    in
    if new_seg = obj_segnum
    then Effect.perform (Path_obj_relink [| objnum; nx; ny; nz; new_seg |])
    else (
      (* Fell out of segment — move to center *)
      let seg =
        Ox_gameseg.find_point_seg_v2
          ~point:(cx, cy, cz) ~segnum:obj_segnum
          ~n_segments:max_segments ~doing_lighting_hack:0
      in
      let seg = if seg <> -1 then seg else obj_segnum in
      Effect.perform (Path_obj_relink [| objnum; cx; cy; cz; seg |])))
;;

(* -- ai_follow_path ------------------------------------------------------- *)
(* Path execution engine. Advances through waypoints, creates new paths at
   end-of-path, returns updated path state.
   NOTE: Does NOT set velocity/orientation — caller must call ai_path_set_orient_and_vel
   with the goal_point returned here.
   Returns: (path_state array, goal_point_x, goal_point_y, goal_point_z) *)

let ai_follow_path ~objnum ~obj_x ~obj_y ~obj_z ~obj_segnum ~obj_size
    ~velocity_x ~velocity_y ~velocity_z
    ~player_visibility ~previous_visibility
    ~hide_index ~path_length ~cur_path_index
    ~behavior ~mode ~is_companion ~is_thief ~is_d2
    ~console_segnum ~frame_time ~frame_count ~game_time
    ~hide_segment ~skip_ai_count ~robot_id ~player_flags
    ~player_is_dead ~viewer_x ~viewer_y ~viewer_z
    ~max_speed ~difficulty_level =
  let path = get_path objnum in
  let path_dir = ref (get_path_dir objnum) in
  let cur_idx = ref cur_path_index in
  let p_length = ref path_length in
  let cur_mode = ref mode in
  let cur_behavior = ref behavior in
  let cur_hide_seg = ref hide_segment in
  let awareness_type = ref 0 in
  let awareness_time = ref 0 in
  ignore (awareness_time, difficulty_level);
  (* Helper: create n-seg path and update state *)
  let do_create_n_seg len avoid =
    let ps =
      create_n_segment_path ~objnum ~obj_segnum ~obj_x ~obj_y ~obj_z ~obj_size
        ~path_length_in:len ~avoid_seg:avoid ~behavior:!cur_behavior
        ~is_companion ~is_d2 ~previous_visibility ~skip_ai_count
        ~hide_segment:!cur_hide_seg ~robot_id ~player_flags ~mode:!cur_mode
        ~frame_count ~console_segnum ~game_time
    in
    p_length := ps.(1);
    cur_idx := ps.(2);
    path_dir := ps.(3);
    cur_mode := ps.(4)
  in
  let do_create_to_player len safety =
    let ps =
      create_path_to_player ~objnum ~obj_segnum ~obj_x ~obj_y ~obj_z ~obj_size
        ~believed_seg:console_segnum ~max_length:len ~safety_flag:safety
        ~behavior:!cur_behavior ~is_companion ~is_d2 ~game_time
        ~hide_segment:!cur_hide_seg ~skip_ai_count ~robot_id ~player_flags
        ~mode:!cur_mode ~frame_count ~console_segnum
    in
    p_length := ps.(1);
    cur_idx := ps.(2);
    path_dir := ps.(3);
    cur_mode := ps.(4);
    cur_hide_seg := ps.(9)
  in
  let do_create_to_station () =
    let ps =
      create_path_to_station ~objnum ~obj_segnum ~obj_x ~obj_y ~obj_z ~obj_size
        ~hide_segment:!cur_hide_seg ~max_length:15
        ~behavior:!cur_behavior ~is_companion ~is_d2 ~game_time
        ~skip_ai_count ~robot_id ~player_flags ~mode:!cur_mode
        ~frame_count ~console_segnum
    in
    p_length := ps.(1);
    cur_idx := ps.(2);
    path_dir := ps.(3);
    cur_mode := ps.(4);
    cur_hide_seg := ps.(9)
  in
  (* Initialize path if needed *)
  if Array.length path = 0 || !p_length = 0
  then (
    if !cur_mode = aim_run_from_object
    then (
      do_create_n_seg 5 (-1);
      cur_mode := aim_run_from_object)
    else do_create_n_seg 5 (-1));
  let path = get_path objnum in
  let n_pts = path_num_points path in
  (* Handle very short paths *)
  let early_result = ref None in
  if n_pts < 2
  then (
    if is_d2 && (!cur_behavior = aib_snipe || !cur_mode = aim_run_from_object)
    then (
      (* D2 snipe/run-from: create new path and fall through *)
      if console_segnum = obj_segnum
      then do_create_n_seg avoid_seg_length (-1)
      else do_create_n_seg avoid_seg_length console_segnum;
      if !cur_behavior = aib_snipe
      then
        cur_mode := (if is_thief then aim_thief_attack else aim_snipe_fire)
      else cur_mode := aim_run_from_object)
    else if not is_companion
    then (
      cur_mode := aim_still;
      p_length := 0;
      set_path_dir objnum !path_dir;
      let gx = if n_pts > 0 then path_point_x path 0 else obj_x in
      let gy = if n_pts > 0 then path_point_y path 0 else obj_y in
      let gz = if n_pts > 0 then path_point_z path 0 else obj_z in
      let ps =
        pack_path_state ~path_length:!p_length ~cur_path_index:!cur_idx
          ~path_dir:!path_dir ~mode:!cur_mode ~goal_segment:(-1)
          ~time_player_seen:game_time ~player_awareness_type:!awareness_type
          ~behavior:!cur_behavior ~hide_segment:!cur_hide_seg ~skip_ai_count
      in
      early_result := Some (ps, gx, gy, gz))
    else (
      set_path_dir objnum !path_dir;
      let ps =
        pack_path_state ~path_length:!p_length ~cur_path_index:!cur_idx
          ~path_dir:!path_dir ~mode:!cur_mode ~goal_segment:(-1)
          ~time_player_seen:game_time ~player_awareness_type:!awareness_type
          ~behavior:!cur_behavior ~hide_segment:!cur_hide_seg ~skip_ai_count
      in
      early_result := Some (ps, obj_x, obj_y, obj_z)));
  match !early_result with
  | Some r -> r
  | None ->
  let path = get_path objnum in
  let n_pts = path_num_points path in
  if n_pts < 2
  then (
    set_path_dir objnum !path_dir;
    let ps =
      pack_path_state ~path_length:!p_length ~cur_path_index:!cur_idx
        ~path_dir:!path_dir ~mode:!cur_mode ~goal_segment:(-1)
        ~time_player_seen:game_time ~player_awareness_type:!awareness_type
        ~behavior:!cur_behavior ~hide_segment:!cur_hide_seg ~skip_ai_count
    in
    ps, obj_x, obj_y, obj_z)
  else (
    (* Clamp index *)
    if !cur_idx < 0 then cur_idx := 0;
    if !cur_idx >= n_pts then cur_idx := n_pts - 1;
    let goal_x = ref (path_point_x path !cur_idx) in
    let goal_y = ref (path_point_y path !cur_idx) in
    let goal_z = ref (path_point_z path !cur_idx) in
    let dist_to_goal =
      Ox_math.vm_vec_dist_quick
        ~a:(!goal_x, !goal_y, !goal_z) ~b:(obj_x, obj_y, obj_z)
    in
    let dist_to_player =
      if player_is_dead <> 0
      then
        Ox_math.vm_vec_dist_quick
          ~a:(obj_x, obj_y, obj_z) ~b:(viewer_x, viewer_y, viewer_z)
      else
        Ox_math.vm_vec_dist_quick
          ~a:(obj_x, obj_y, obj_z) ~b:(console_segnum, 0, 0)
          (* Note: for dist_to_player we'd need actual console pos, but it's
             only used for the efficiency hack threshold check *)
    in
    ignore dist_to_player;
    (* Efficiency hack: far away, not visible, teleport *)
    (* TODO: implement move_object_to_goal for the efficiency hack *)
    (* Run-from-object velocity scaling *)
    if !cur_mode = aim_run_from_object
    then
      if player_visibility = 0 && !awareness_type = 0
      then (
        (* Scale down velocity — done via effect or returned flag *)
        ());
    (* Path index validation *)
    if !cur_idx < 0 then cur_idx := 0
    else if !cur_idx >= n_pts
    then
      if !cur_mode = aim_run_from_object
      then (
        do_create_n_seg avoid_seg_length console_segnum;
        cur_mode := aim_run_from_object)
      else cur_idx := n_pts - 1;
    let path = get_path objnum in
    let n_pts = path_num_points path in
    if n_pts >= 1 && !cur_idx < n_pts
    then (
      goal_x := path_point_x path !cur_idx;
      goal_y := path_point_y path !cur_idx;
      goal_z := path_point_z path !cur_idx);
    (* Main path traversal loop *)
    let vel_mag = Ox_math.vm_vec_mag_quick ~v:(velocity_x, velocity_y, velocity_z) in
    let threshold = Ox_math.fixmul ~a:vel_mag ~b:frame_time * 2 + f1_0 * 2 in
    let dist_to_goal = ref dist_to_goal in
    let forced_break = ref false in
    let original_dir = !path_dir in
    let original_index = !cur_idx in
    while !dist_to_goal < threshold && not !forced_break do
      cur_idx := !cur_idx + !path_dir;
      if !cur_idx >= n_pts || !cur_idx < 0
      then (
        (* End of path — behavior-dependent *)
        if is_d2 && is_companion
        then (
          (* Buddy: wander *)
          cur_mode := aim_wander;
          forced_break := true)
        else if !cur_behavior = aib_follow
        then do_create_n_seg 10 console_segnum
        else if !cur_behavior = aib_station
        then (
          do_create_to_station ();
          let new_path = get_path objnum in
          let new_n = path_num_points new_path in
          if new_n = 0
             || (new_n > 0
                && path_point_seg new_path (new_n - 1) <> !cur_hide_seg)
          then cur_mode := aim_still;
          forced_break := true)
        else if !cur_mode = aim_follow_path
        then (
          do_create_to_player 10 1;
          let new_path = get_path objnum in
          let new_n = path_num_points new_path in
          if new_n > 0 && path_point_seg new_path (new_n - 1) <> !cur_hide_seg
          then (
            cur_mode := aim_still;
            forced_break := true))
        else if !cur_mode = aim_run_from_object
        then (
          do_create_n_seg avoid_seg_length console_segnum;
          cur_mode := aim_run_from_object;
          let new_path = get_path objnum in
          let new_n = path_num_points new_path in
          if new_n < 1
          then (
            do_create_n_seg avoid_seg_length console_segnum;
            cur_mode := aim_run_from_object;
            let new_path = get_path objnum in
            let new_n = path_num_points new_path in
            if new_n < 1
            then (
              cur_behavior := aib_normal;
              cur_mode := aim_still;
              forced_break := true)))
        else (
          (* Check if opposite end is reachable (circular path) *)
          let opposite_idx =
            if abs (!cur_idx - n_pts) < !cur_idx then 0
            else n_pts - 1
          in
          if opposite_idx >= 0 && opposite_idx < n_pts
          then (
            let oex = path_point_x path opposite_idx in
            let oey = path_point_y path opposite_idx in
            let oez = path_point_z path opposite_idx in
            let fvi_result =
              Effect.perform
                (Path_fvi_query
                   [| obj_x; obj_y; obj_z; obj_segnum; oex; oey; oez; obj_size; objnum |])
            in
            if fvi_result.(0) <> hit_wall
            then cur_idx := opposite_idx
            else (
              path_dir := - !path_dir;
              cur_idx := !cur_idx + !path_dir))
          else (
            path_dir := - !path_dir;
            cur_idx := !cur_idx + !path_dir));
        if not !forced_break then forced_break := true)
      else (
        (* Normal advancement *)
        let path = get_path objnum in
        let n = path_num_points path in
        if !cur_idx >= 0 && !cur_idx < n
        then (
          goal_x := path_point_x path !cur_idx;
          goal_y := path_point_y path !cur_idx;
          goal_z := path_point_z path !cur_idx;
          dist_to_goal :=
            Ox_math.vm_vec_dist_quick
              ~a:(!goal_x, !goal_y, !goal_z) ~b:(obj_x, obj_y, obj_z))
        else forced_break := true);
      (* Check if we looped back to start *)
      if !cur_idx = original_index && !path_dir = original_dir
      then (
        do_create_to_player 3 1;
        forced_break := true)
    done;
    ignore max_speed;
    set_path_dir objnum !path_dir;
    let ps =
      pack_path_state ~path_length:!p_length ~cur_path_index:!cur_idx
        ~path_dir:!path_dir ~mode:!cur_mode ~goal_segment:(-1)
        ~time_player_seen:game_time ~player_awareness_type:!awareness_type
        ~behavior:!cur_behavior ~hide_segment:!cur_hide_seg ~skip_ai_count
    in
    ps, !goal_x, !goal_y, !goal_z)
;;
