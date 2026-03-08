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
