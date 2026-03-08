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

let cd_p_order_list o0 o1 o2 o3 o4 o5 o6 o7 o8 o9 o10 num =
  Ox_weapon.p_order_list
    ~order_0:o0 ~order_1:o1 ~order_2:o2 ~order_3:o3 ~order_4:o4
    ~order_5:o5 ~order_6:o6 ~order_7:o7 ~order_8:o8 ~order_9:o9 ~order_10:o10
    ~num
;;

let cd_s_order_list o0 o1 o2 o3 o4 o5 o6 o7 o8 o9 o10 num =
  Ox_weapon.s_order_list
    ~order_0:o0 ~order_1:o1 ~order_2:o2 ~order_3:o3 ~order_4:o4
    ~order_5:o5 ~order_6:o6 ~order_7:o7 ~order_8:o8 ~order_9:o9 ~order_10:o10
    ~num
;;

let register_callbacks () =
  Callback.register "cd_player_has_weapon_d1" cd_player_has_weapon_d1;
  Callback.register "cd_player_has_weapon_d2" cd_player_has_weapon_d2;
  Callback.register "cd_p_order_list" cd_p_order_list;
  Callback.register "cd_s_order_list" cd_s_order_list
;;
