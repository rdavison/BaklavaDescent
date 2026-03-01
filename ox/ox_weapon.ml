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
