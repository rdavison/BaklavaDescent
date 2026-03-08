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
