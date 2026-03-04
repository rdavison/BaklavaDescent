(* Bridge adapter for weapon decision logic.
   player_has_weapon: 5 scalar args (D1) or 9 scalar args (D2) → int *)

let cd_player_has_weapon_d1 weapon_flags ammo energy ammo_usage energy_usage =
  Ox_weapon.player_has_weapon_d1 ~weapon_flags ~ammo ~energy ~ammo_usage ~energy_usage
;;

let cd_player_has_weapon_d2
      weapon_flags
      ammo
      energy
      ammo_usage
      energy_usage
      is_gauss
      vulcan_ammo
      is_omega
      omega_charge
  =
  Ox_weapon.player_has_weapon_d2
    ~weapon_flags
    ~ammo
    ~energy
    ~ammo_usage
    ~energy_usage
    ~is_gauss:(is_gauss <> 0)
    ~vulcan_ammo
    ~is_omega:(is_omega <> 0)
    ~omega_charge
;;

let register_callbacks () =
  Callback.register "cd_player_has_weapon_d1" cd_player_has_weapon_d1;
  Callback.register "cd_player_has_weapon_d2" cd_player_has_weapon_d2
;;
