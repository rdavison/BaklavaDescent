(* Weapon decision logic ported from weapon.cpp *)

(* Return value flags *)
let has_weapon_flag = 1
let has_energy_flag = 2
let has_ammo_flag = 4

(* player_has_weapon: check if player has weapon, energy, and ammo.
   D1: args = weapon_flags, ammo, energy, ammo_usage, energy_usage, secondary_flag
   Returns: bitmask of HAS_WEAPON_FLAG | HAS_ENERGY_FLAG | HAS_AMMO_FLAG *)
let player_has_weapon_d1 ~weapon_flags ~ammo ~energy ~ammo_usage ~energy_usage =
  let r = ref 0 in
  if weapon_flags <> 0 then r := !r lor has_weapon_flag;
  if ammo_usage <= ammo then r := !r lor has_ammo_flag;
  if energy_usage <= energy then r := !r lor has_energy_flag;
  !r
;;

(* D2 version: same as D1 but with gauss/omega special cases.
   is_gauss: weapon is GAUSS_INDEX (uses vulcan ammo instead)
   is_omega: weapon is OMEGA_INDEX (has energy if energy>0 OR omega_charge>0) *)
let player_has_weapon_d2
      ~weapon_flags
      ~ammo
      ~energy
      ~ammo_usage
      ~energy_usage
      ~is_gauss
      ~vulcan_ammo
      ~is_omega
      ~omega_charge
  =
  let r = ref 0 in
  if weapon_flags <> 0 then r := !r lor has_weapon_flag;
  (* Gauss uses vulcan ammo *)
  if is_gauss
  then (if ammo_usage <= vulcan_ammo then r := !r lor has_ammo_flag)
  else if ammo_usage <= ammo
  then r := !r lor has_ammo_flag;
  (* Omega has energy if player has any energy or omega_charge *)
  if is_omega
  then (if energy > 0 || omega_charge > 0 then r := !r lor has_energy_flag)
  else if energy_usage <= energy
  then r := !r lor has_energy_flag;
  !r
;;

let max_primary_weapons = 10
let max_secondary_weapons = 10

(* POrderList: search PrimaryOrder array for weapon num, return its priority index.
   C original: int POrderList(int num) — weapon.cpp
   order array has MAX_PRIMARY_WEAPONS+1 = 11 elements *)
let p_order_list ~order_0 ~order_1 ~order_2 ~order_3 ~order_4
                 ~order_5 ~order_6 ~order_7 ~order_8 ~order_9 ~order_10
                 ~num =
  let order = [| order_0; order_1; order_2; order_3; order_4;
                 order_5; order_6; order_7; order_8; order_9; order_10 |] in
  let result = ref (-1) in
  for i = 0 to max_primary_weapons do
    if order.(i) = num then result := i
  done;
  if !result = -1 then 0
  else !result
;;

(* SOrderList: search SecondaryOrder array for weapon num, return its priority index.
   C original: int SOrderList(int num) — weapon.cpp
   order array has MAX_SECONDARY_WEAPONS+1 = 11 elements *)
let s_order_list ~order_0 ~order_1 ~order_2 ~order_3 ~order_4
                 ~order_5 ~order_6 ~order_7 ~order_8 ~order_9 ~order_10
                 ~num =
  let order = [| order_0; order_1; order_2; order_3; order_4;
                 order_5; order_6; order_7; order_8; order_9; order_10 |] in
  let result = ref (-1) in
  for i = 0 to max_secondary_weapons do
    if order.(i) = num then result := i
  done;
  if !result = -1 then 0
  else !result
;;

(* process_super_mines_frame: Check all super mines and detonate if near player/robot.
   Ported from main_d2/weapon.cpp.

   Fetch data layout (5 + highest_object_index+1 * 9 ints):
     [0] frame_count
     [1] super_mines_yes
     [2] highest_object_index
     [3] superprox_lifetime (Weapon_info[SUPERPROX_ID].lifetime)
     [4] is_shareware (CurrentLogicVersion == LogicVer::SHAREWARE ? 1 : 0)
     For each object i (0..highest_object_index):
       offset = 5 + i*9
       [+0] type  [+1] id  [+2] lifeleft
       [+3] pos.x [+4] pos.y [+5] pos.z
       [+6] segnum [+7] size [+8] parent_num

   Write data: [new_super_mines_yes, n_to_set, obj_idx_0, obj_idx_1, ...]

   FVI check effect: int array (8 ints) -> int (fate)
     [startseg, p0x, p0y, p0z, p1x, p1y, p1z, thisobjnum] -> hit_type *)

let f1_0 = 0x10000

let obj_player = 4
let obj_weapon = 5
let obj_robot = 2
let superprox_id = 38
let hit_wall = 1

type _ Effect.t +=
  | Fetch_process_super_mines_data : unit -> int array Effect.t
  | Write_process_super_mines : int array -> unit Effect.t
  | Super_mine_fvi_check : int array -> int Effect.t

let process_super_mines_frame () =
  let data = Effect.perform (Fetch_process_super_mines_data ()) in
  let frame_count = data.(0) in
  let _super_mines_yes_in = data.(1) in
  let highest = data.(2) in
  let superprox_lifetime = data.(3) in
  let is_shareware = data.(4) <> 0 in

  (* Determine start/add based on incoming super_mines_yes *)
  let start, add =
    if data.(1) = 0 then (frame_count land 7, 8)
    else (0, 1)
  in

  let super_mines_yes = ref 0 in
  let to_detonate = ref [] in

  let i = ref start in
  while !i <= highest do
    let off = 5 + !i * 9 in
    let obj_type = data.(off) in
    let obj_id = data.(off + 1) in
    if obj_type = obj_weapon && obj_id = superprox_id then begin
      let parent_num = data.(off + 8) in
      super_mines_yes := 1;
      let lifeleft = data.(off + 2) in
      (* lifeleft + F1_0*2 < superprox_lifetime *)
      if lifeleft + f1_0 * 2 < superprox_lifetime then begin
        let bomb_px = data.(off + 3) in
        let bomb_py = data.(off + 4) in
        let bomb_pz = data.(off + 5) in
        let bomb_seg = data.(off + 6) in
        let bomb_pos = (bomb_px, bomb_py, bomb_pz) in

        let j = ref 0 in
        let detonated = ref false in
        while !j <= highest && not !detonated do
          let joff = 5 + !j * 9 in
          let jtype = data.(joff) in
          if jtype = obj_player || jtype = obj_robot then begin
            let jpos = (data.(joff + 3), data.(joff + 4), data.(joff + 5)) in
            let jsize = data.(joff + 7) in
            let jseg = data.(joff + 6) in
            let dist = Ox_math.vm_vec_dist_quick ~a:bomb_pos ~b:jpos in
            if !j <> parent_num then begin
              (* dist - size < F1_0 * 20 *)
              if dist - jsize < f1_0 * 20 then begin
                if bomb_seg = jseg then begin
                  to_detonate := !i :: !to_detonate;
                  detonated := true
                end else begin
                  (* Expensive FVI check, only every 4th frame based on (FrameCount ^ (i+j)) % 4 *)
                  if (frame_count lxor (!i + !j)) mod 4 = 0 then begin
                    let fvi_args = [| bomb_seg; bomb_px; bomb_py; bomb_pz;
                                      data.(joff + 3); data.(joff + 4); data.(joff + 5);
                                      !i |] in
                    let fate = Effect.perform (Super_mine_fvi_check fvi_args) in
                    if fate <> hit_wall then begin
                      to_detonate := !i :: !to_detonate;
                      detonated := true
                    end
                  end
                end
              end
            end else if is_shareware then begin
              if dist - jsize < f1_0 * 20 then begin
                to_detonate := !i :: !to_detonate;
                detonated := true
              end
            end
          end;
          j := !j + 1
        done
      end
    end;
    i := !i + add
  done;

  (* Write back: [super_mines_yes, n_to_detonate, idx0, idx1, ...] *)
  let det_list = List.rev !to_detonate in
  let n = List.length det_list in
  let result = Array.create ~len:(2 + n) 0 in
  result.(0) <- !super_mines_yes;
  result.(1) <- n;
  List.iteri det_list ~f:(fun idx v -> result.(2 + idx) <- v);
  Effect.perform (Write_process_super_mines result)
;;
