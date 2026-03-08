(* Pure OCaml game logic for fuelcen functions.
   Ported from main_d1/fuelcen.cpp and main_d2/fuelcen.cpp *)

(* Segment type constants *)
let segment_is_nothing    = 0
let segment_is_fuelcen    = 1
let segment_is_repaircen  = 2
let segment_is_controlcen = 3
let segment_is_robotmaker = 4
let segment_is_goal_blue  = 5
let segment_is_goal_red   = 6

(* -- Algebraic effects -------------------------------------------------- *)

type _ Effect.t +=
  | Fetch_fuelcen_create_data : int -> int array Effect.t
  | Write_fuelcen_create : int array -> unit Effect.t
  | Fetch_matcen_create_data : int -> int array Effect.t
  | Write_matcen_create : int array -> unit Effect.t
  | Set_segment_special : (int * int) -> unit Effect.t

(* fuelcen_create: Turns a segment into a fully charged up fuel center.
   Takes segnum (segment index).
   Fetch data: [station_type, num_fuelcenters, max_fuelcens, fuelcen_max_amount,
                 is_d2, center_x, center_y, center_z]
   Write back: [segnum, station_type, max_capacity, timer, flag,
                 center_x, center_y, center_z] *)
let fuelcen_create ~segnum =
  let data = Effect.perform (Fetch_fuelcen_create_data segnum) in
  let station_type = data.(0) in
  let num_fuelcenters = data.(1) in
  let max_fuelcens = data.(2) in
  let fuelcen_max_amount = data.(3) in
  let is_d2 = data.(4) <> 0 in
  let center_x = data.(5) in
  let center_y = data.(6) in
  let center_z = data.(7) in
  (* D2: NOTHING, GOAL_BLUE, GOAL_RED -> return early
     D1: only NOTHING -> return early *)
  let early_return =
    station_type = segment_is_nothing
    || (is_d2 && (station_type = segment_is_goal_blue
                  || station_type = segment_is_goal_red))
  in
  if early_return then ()
  else begin
    (* Valid station types: FUELCEN, REPAIRCEN, CONTROLCEN, ROBOTMAKER *)
    let valid =
      station_type = segment_is_fuelcen
      || station_type = segment_is_repaircen
      || station_type = segment_is_controlcen
      || station_type = segment_is_robotmaker
    in
    if not valid then
      Printf.eprintf "[OX] fuelcen_create: Error: Invalid station type %d\n" station_type
    else begin
      (* Assert(Num_fuelcenters < MAX_NUM_FUELCENS) *)
      if num_fuelcenters >= max_fuelcens then
        Printf.eprintf "[OX] fuelcen_create: Assert failed: Num_fuelcenters=%d >= MAX=%d\n"
          num_fuelcenters max_fuelcens;
      if num_fuelcenters < 0 then
        Printf.eprintf "[OX] fuelcen_create: Assert failed: Num_fuelcenters=%d < 0\n"
          num_fuelcenters;
      (* Write back: segnum, station_type, max_capacity (=fuelcen_max_amount),
         timer (-1), flag (0), center_x, center_y, center_z *)
      Effect.perform (Write_fuelcen_create
        [| segnum; station_type; fuelcen_max_amount; -1; 0;
           center_x; center_y; center_z |])
    end
  end
;;

(* Constants *)
let f1_0 = 0x10000
let matcen_hp_default  = f1_0 * 500  (* F1_0*500 *)
let matcen_interval_default = f1_0 * 5  (* F1_0*5 *)

(* matcen_create: Turns a segment into a robot maker (materialization center).
   Takes segnum (segment index).
   Fetch data: [station_type, num_fuelcenters, max_fuelcens, difficulty_level,
                 num_robot_centers, center_x, center_y, center_z, segnum_actual]
   Write back: [segnum, station_type, capacity, timer, flag,
                 center_x, center_y, center_z, matcen_num,
                 hit_points, interval, matcen_segnum, fuelcen_num] *)
let matcen_create ~segnum =
  let data = Effect.perform (Fetch_matcen_create_data segnum) in
  let station_type = data.(0) in
  let num_fuelcenters = data.(1) in
  let max_fuelcens = data.(2) in
  let difficulty_level = data.(3) in
  let num_robot_centers = data.(4) in
  let center_x = data.(5) in
  let center_y = data.(6) in
  let center_z = data.(7) in
  let segnum_actual = data.(8) in
  (* Assert(seg2p != NULL) — always true in our case *)
  (* Assert(station_type == SEGMENT_IS_ROBOTMAKER) *)
  if station_type <> segment_is_robotmaker then
    Printf.eprintf "[OX] matcen_create: Assert failed: station_type=%d != ROBOTMAKER\n"
      station_type;
  (* Assert(Num_fuelcenters < MAX_NUM_FUELCENS) *)
  if num_fuelcenters >= max_fuelcens then
    Printf.eprintf "[OX] matcen_create: Assert failed: Num_fuelcenters=%d >= MAX=%d\n"
      num_fuelcenters max_fuelcens;
  (* Assert(Num_fuelcenters > -1) *)
  if num_fuelcenters < 0 then
    Printf.eprintf "[OX] matcen_create: Assert failed: Num_fuelcenters=%d < 0\n"
      num_fuelcenters;
  (* Capacity = i2f(Difficulty_level + 3) *)
  let capacity = (difficulty_level + 3) * f1_0 in
  (* matcen_num = Num_robot_centers (before increment) *)
  let matcen_num = num_robot_centers in
  (* Write back all fields *)
  Effect.perform (Write_matcen_create
    [| segnum_actual;        (* 0: segnum for Station[].segnum and seg value *)
       station_type;         (* 1: Station[].Type *)
       capacity;             (* 2: Station[].Capacity and MaxCapacity *)
       -1;                   (* 3: Station[].Timer *)
       0;                    (* 4: Station[].Flag *)
       center_x;             (* 5: Station[].Center.x *)
       center_y;             (* 6: Station[].Center.y *)
       center_z;             (* 7: Station[].Center.z *)
       matcen_num;           (* 8: seg2p->matcen_num = Num_robot_centers *)
       matcen_hp_default;    (* 9: RobotCenters[].hit_points *)
       matcen_interval_default; (* 10: RobotCenters[].interval *)
       segnum_actual;        (* 11: RobotCenters[].segnum *)
       num_fuelcenters       (* 12: RobotCenters[].fuelcen_num *)
    |])
;;

(* fuelcen_activate: Adds a segment that already is a special type into the
   Station array. Sets seg2p->special then dispatches to matcen_create or
   fuelcen_create.
   Takes segnum (segment index) and station_type. *)
let fuelcen_activate ~segnum ~station_type =
  (* seg2p->special = station_type *)
  Effect.perform (Set_segment_special (segnum, station_type));
  if station_type = segment_is_robotmaker then
    matcen_create ~segnum
  else
    fuelcen_create ~segnum
;;

(* -- trigger_matcen ------------------------------------------------------- *)

(* NDL = 5, number of difficulty levels *)
let ndl = 5

type _ Effect.t +=
  | Fetch_trigger_matcen_data : int -> int array Effect.t
  | Write_trigger_matcen : int array -> unit Effect.t

(* trigger_matcen: Enable the materialization center in segment segnum.
   Fetch data: [special, matcen_num, num_fuelcenters, highest_segment_index,
                enabled, lives, difficulty_level, is_d2,
                center_x, center_y, center_z,
                vert0_x, vert0_y, vert0_z]
   Write back: [segnum, matcen_num, lives, timer, enabled, capacity,
                disable_time, pos_x, pos_y, pos_z] *)
let trigger_matcen ~segnum =
  let data = Effect.perform (Fetch_trigger_matcen_data segnum) in
  let special = data.(0) in
  let matcen_num = data.(1) in
  let num_fuelcenters = data.(2) in
  let highest_segment_index = data.(3) in
  let enabled = data.(4) in
  let lives = data.(5) in
  let difficulty_level = data.(6) in
  let is_d2 = data.(7) <> 0 in
  let center_x = data.(8) in
  let center_y = data.(9) in
  let center_z = data.(10) in
  let vert0_x = data.(11) in
  let vert0_y = data.(12) in
  let vert0_z = data.(13) in
  (* Assert(seg2p->special == SEGMENT_IS_ROBOTMAKER) *)
  if special <> segment_is_robotmaker then
    Printf.eprintf "[OX] trigger_matcen: Assert failed: special=%d != ROBOTMAKER\n" special;
  (* Assert(matcen_num < Num_fuelcenters) *)
  if matcen_num >= num_fuelcenters then
    Printf.eprintf "[OX] trigger_matcen: Assert failed: matcen_num=%d >= num_fuelcenters=%d\n"
      matcen_num num_fuelcenters;
  (* Assert(matcen_num >= 0 && matcen_num <= Highest_segment_index) *)
  if matcen_num < 0 || matcen_num > highest_segment_index then
    Printf.eprintf "[OX] trigger_matcen: Assert failed: matcen_num=%d out of range [0,%d]\n"
      matcen_num highest_segment_index;
  (* if (robotcen->Enabled == 1) return *)
  if enabled = 1 then ()
  (* if (!robotcen->Lives) return *)
  else if lives = 0 then ()
  else begin
    (* D2: At insane difficulty, matcens work forever (don't decrement lives)
       D1: Always decrement *)
    let new_lives =
      if is_d2 then
        (if difficulty_level + 1 < ndl then lives - 1 else lives)
      else
        lives - 1
    in
    let timer = f1_0 * 1000 in
    let new_enabled = 1 in
    let capacity = (difficulty_level + 3) * f1_0 in
    (* MATCEN_LIFE = i2f(30 - 2 * Difficulty_level) *)
    let matcen_life = (30 - 2 * difficulty_level) * f1_0 in
    (* pos = center; delta = vert0 - center; pos += delta * F1_0/2
       => pos = center + (vert0 - center) / 2 *)
    let delta_x = vert0_x - center_x in
    let delta_y = vert0_y - center_y in
    let delta_z = vert0_z - center_z in
    (* vm_vec_scale_add2(&pos, &delta, F1_0/2) adds (delta * (F1_0/2)) / F1_0
       = delta / 2 to pos. Since these are plain ints (not fixed-point for the
       scale factor applied to a vector), the scale is:
       pos += fixmul(delta, F1_0/2) = delta/2 (since fixmul(a, 0x8000) = a/2) *)
    let pos_x = center_x + (delta_x / 2) in
    let pos_y = center_y + (delta_y / 2) in
    let pos_z = center_z + (delta_z / 2) in
    Effect.perform (Write_trigger_matcen
      [| segnum; matcen_num; new_lives; timer; new_enabled;
         capacity; matcen_life; pos_x; pos_y; pos_z |])
  end
;;
