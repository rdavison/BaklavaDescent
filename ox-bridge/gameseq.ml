(* Bridge adapter for gameseq functions.
   Uses algebraic effects: OCaml performs effects, C handler executes them. *)

(* Effect externals — fetch/write bash_to_shield data from C globals *)
external effect_fetch_bash_to_shield_data
  :  int
  -> int array
  = "cd_ox_effect_gs_fetch_bash_to_shield_data"

external effect_write_bash_to_shield
  :  int array
  -> unit
  = "cd_ox_effect_gs_write_bash_to_shield"

external effect_fetch_stuck_objects_data
  :  unit
  -> int array
  = "cd_ox_effect_gs_fetch_stuck_objects_data"

external effect_write_clear_stuck_objects
  :  int array
  -> unit
  = "cd_ox_effect_gs_write_clear_stuck_objects"

external effect_fetch_special_reset_objects_data
  :  unit
  -> int array
  = "cd_ox_effect_gs_fetch_special_reset_objects_data"

external effect_write_special_reset_objects
  :  int array
  -> unit
  = "cd_ox_effect_gs_write_special_reset_objects"

external effect_fetch_update_player_stats_data
  :  unit
  -> int array
  = "cd_ox_effect_gs_fetch_update_player_stats_data"

external effect_write_update_player_stats
  :  int array
  -> unit
  = "cd_ox_effect_gs_write_update_player_stats"

external effect_fetch_verify_console_object_data
  :  unit
  -> int array
  = "cd_ox_effect_gs_fetch_verify_console_object_data"

external effect_write_verify_console_object
  :  int
  -> unit
  = "cd_ox_effect_gs_write_verify_console_object"

external effect_fetch_init_player_object_data
  :  unit
  -> int array
  = "cd_ox_effect_gs_fetch_init_player_object_data"

external effect_write_init_player_object
  :  int array
  -> unit
  = "cd_ox_effect_gs_write_init_player_object"

external effect_fetch_init_ammo_energy_data
  :  unit
  -> int array
  = "cd_ox_effect_gs_fetch_init_ammo_energy_data"

external effect_write_init_ammo_energy
  :  int array
  -> unit
  = "cd_ox_effect_gs_write_init_ammo_energy"

external effect_fetch_remove_unused_players_data
  :  unit
  -> int array
  = "cd_ox_effect_gs_fetch_remove_unused_players_data"

external effect_write_remove_unused_players
  :  int array
  -> unit
  = "cd_ox_effect_gs_write_remove_unused_players"

external effect_fetch_free_object_slots_data
  :  unit
  -> int array
  = "cd_ox_effect_gs_fetch_free_object_slots_data"

external effect_write_free_object_slots
  :  int array
  -> unit
  = "cd_ox_effect_gs_write_free_object_slots"

external effect_fetch_copy_defaults_to_robot_data
  :  int
  -> int array
  = "cd_ox_effect_gs_fetch_copy_defaults_to_robot_data"

external effect_write_copy_defaults_to_robot
  :  int array
  -> unit
  = "cd_ox_effect_gs_write_copy_defaults_to_robot"

external effect_fetch_filter_objects_data
  :  unit
  -> int array
  = "cd_ox_effect_gs_fetch_filter_objects_data"

external effect_fetch_init_network_players_data
  :  unit
  -> int array
  = "cd_ox_effect_gs_fetch_init_network_players_data"

external effect_write_init_network_players
  :  int array
  -> unit
  = "cd_ox_effect_gs_write_init_network_players"

external effect_fetch_clear_transient_objects_data
  :  unit
  -> int array
  = "cd_ox_effect_gs_fetch_clear_transient_objects_data"

external effect_write_clear_transient_objects
  :  int array
  -> unit
  = "cd_ox_effect_gs_write_clear_transient_objects"

(* Effect handler *)
let effc (type a) (eff : a Effect.t) : ((a, 'b) Effect.Deep.continuation -> 'b) option =
  match eff with
  | Ox_gameseq.Fetch_bash_to_shield_data objnum ->
    Some (fun k ->
      let data = effect_fetch_bash_to_shield_data objnum in
      Effect.Deep.continue k data)
  | Ox_gameseq.Write_bash_to_shield packed ->
    Some (fun k ->
      effect_write_bash_to_shield packed;
      Effect.Deep.continue k ())
  | Ox_gameseq.Fetch_stuck_objects_data () ->
    Some (fun k ->
      let data = effect_fetch_stuck_objects_data () in
      Effect.Deep.continue k data)
  | Ox_gameseq.Write_clear_stuck_objects packed ->
    Some (fun k ->
      effect_write_clear_stuck_objects packed;
      Effect.Deep.continue k ())
  | Ox_gameseq.Fetch_special_reset_objects_data () ->
    Some (fun k ->
      let data = effect_fetch_special_reset_objects_data () in
      Effect.Deep.continue k data)
  | Ox_gameseq.Write_special_reset_objects packed ->
    Some (fun k ->
      effect_write_special_reset_objects packed;
      Effect.Deep.continue k ())
  | Ox_gameseq.Fetch_update_player_stats_data () ->
    Some (fun k ->
      let data = effect_fetch_update_player_stats_data () in
      Effect.Deep.continue k data)
  | Ox_gameseq.Write_update_player_stats packed ->
    Some (fun k ->
      effect_write_update_player_stats packed;
      Effect.Deep.continue k ())
  | Ox_gameseq.Fetch_verify_console_object_data () ->
    Some (fun k ->
      let data = effect_fetch_verify_console_object_data () in
      Effect.Deep.continue k data)
  | Ox_gameseq.Write_verify_console_object objnum ->
    Some (fun k ->
      effect_write_verify_console_object objnum;
      Effect.Deep.continue k ())
  | Ox_gameseq.Fetch_init_player_object_data () ->
    Some (fun k ->
      let data = effect_fetch_init_player_object_data () in
      Effect.Deep.continue k data)
  | Ox_gameseq.Write_init_player_object packed ->
    Some (fun k ->
      effect_write_init_player_object packed;
      Effect.Deep.continue k ())
  | Ox_gameseq.Fetch_init_ammo_energy_data () ->
    Some (fun k ->
      let data = effect_fetch_init_ammo_energy_data () in
      Effect.Deep.continue k data)
  | Ox_gameseq.Write_init_ammo_energy packed ->
    Some (fun k ->
      effect_write_init_ammo_energy packed;
      Effect.Deep.continue k ())
  | Ox_gameseq.Fetch_remove_unused_players_data () ->
    Some (fun k ->
      let data = effect_fetch_remove_unused_players_data () in
      Effect.Deep.continue k data)
  | Ox_gameseq.Write_remove_unused_players packed ->
    Some (fun k ->
      effect_write_remove_unused_players packed;
      Effect.Deep.continue k ())
  | Ox_gameseq.Fetch_free_object_slots_data () ->
    Some (fun k ->
      let data = effect_fetch_free_object_slots_data () in
      Effect.Deep.continue k data)
  | Ox_gameseq.Write_free_object_slots packed ->
    Some (fun k ->
      effect_write_free_object_slots packed;
      Effect.Deep.continue k ())
  | Ox_gameseq.Fetch_copy_defaults_to_robot_data objnum ->
    Some (fun k ->
      let data = effect_fetch_copy_defaults_to_robot_data objnum in
      Effect.Deep.continue k data)
  | Ox_gameseq.Write_copy_defaults_to_robot packed ->
    Some (fun k ->
      effect_write_copy_defaults_to_robot packed;
      Effect.Deep.continue k ())
  | Ox_gameseq.Fetch_filter_objects_data () ->
    Some (fun k ->
      let data = effect_fetch_filter_objects_data () in
      Effect.Deep.continue k data)
  | Ox_gameseq.Fetch_init_network_players_data () ->
    Some (fun k ->
      let data = effect_fetch_init_network_players_data () in
      Effect.Deep.continue k data)
  | Ox_gameseq.Write_init_network_players packed ->
    Some (fun k ->
      effect_write_init_network_players packed;
      Effect.Deep.continue k ())
  | Ox_gameseq.Fetch_clear_transient_objects_data () ->
    Some (fun k ->
      let data = effect_fetch_clear_transient_objects_data () in
      Effect.Deep.continue k data)
  | Ox_gameseq.Write_clear_transient_objects packed ->
    Some (fun k ->
      effect_write_clear_transient_objects packed;
      Effect.Deep.continue k ())
  | _ -> None
;;

(* Bridge entry point called from C via caml_callback *)
let cd_bash_to_shield objnum =
  Effect.Deep.match_with
    (fun () -> Ox_gameseq.bash_to_shield ~objnum)
    ()
    { retc = (fun () -> ())
    ; exnc = (fun e ->
        Printf.eprintf "[OX] bash_to_shield exception: %s\n" (Exn.to_string e);
        Out_channel.flush stderr)
    ; effc = (fun (type a) (eff : a Effect.t) -> effc eff)
    }
;;

let cd_clear_stuck_objects () =
  Effect.Deep.match_with
    (fun () -> Ox_gameseq.clear_stuck_objects ())
    ()
    { retc = (fun () -> ())
    ; exnc = (fun e ->
        Printf.eprintf "[OX] clear_stuck_objects exception: %s\n" (Exn.to_string e);
        Out_channel.flush stderr)
    ; effc = (fun (type a) (eff : a Effect.t) -> effc eff)
    }
;;

let cd_special_reset_objects () =
  Effect.Deep.match_with
    (fun () -> Ox_gameseq.special_reset_objects ())
    ()
    { retc = (fun () -> ())
    ; exnc = (fun e ->
        Printf.eprintf "[OX] special_reset_objects exception: %s\n" (Exn.to_string e);
        Out_channel.flush stderr)
    ; effc = (fun (type a) (eff : a Effect.t) -> effc eff)
    }
;;

let cd_update_player_stats () =
  Effect.Deep.match_with
    (fun () -> Ox_gameseq.update_player_stats ())
    ()
    { retc = (fun () -> ())
    ; exnc = (fun e ->
        Printf.eprintf "[OX] update_player_stats exception: %s\n" (Exn.to_string e);
        Out_channel.flush stderr)
    ; effc = (fun (type a) (eff : a Effect.t) -> effc eff)
    }
;;

let cd_init_player_object () =
  Effect.Deep.match_with
    (fun () -> Ox_gameseq.init_player_object ())
    ()
    { retc = (fun () -> ())
    ; exnc = (fun e ->
        Printf.eprintf "[OX] init_player_object exception: %s\n" (Exn.to_string e);
        Out_channel.flush stderr)
    ; effc = (fun (type a) (eff : a Effect.t) -> effc eff)
    }
;;

let cd_init_ammo_and_energy () =
  Effect.Deep.match_with
    (fun () -> Ox_gameseq.init_ammo_and_energy ())
    ()
    { retc = (fun () -> ())
    ; exnc = (fun e ->
        Printf.eprintf "[OX] init_ammo_and_energy exception: %s\n" (Exn.to_string e);
        Out_channel.flush stderr)
    ; effc = (fun (type a) (eff : a Effect.t) -> effc eff)
    }
;;

let cd_verify_console_object () =
  Effect.Deep.match_with
    (fun () -> Ox_gameseq.verify_console_object ())
    ()
    { retc = (fun () -> ())
    ; exnc = (fun e ->
        Printf.eprintf "[OX] verify_console_object exception: %s\n" (Exn.to_string e);
        Out_channel.flush stderr)
    ; effc = (fun (type a) (eff : a Effect.t) -> effc eff)
    }
;;

let cd_free_object_slots num_used =
  Effect.Deep.match_with
    (fun () -> Ox_gameseq.free_object_slots ~num_used)
    ()
    { retc = (fun () -> ())
    ; exnc = (fun e ->
        Printf.eprintf "[OX] free_object_slots exception: %s\n" (Exn.to_string e);
        Out_channel.flush stderr)
    ; effc = (fun (type a) (eff : a Effect.t) -> effc eff)
    }
;;

let cd_copy_defaults_to_robot objnum =
  Effect.Deep.match_with
    (fun () -> Ox_gameseq.copy_defaults_to_robot ~objnum)
    ()
    { retc = (fun () -> ())
    ; exnc = (fun e ->
        Printf.eprintf "[OX] copy_defaults_to_robot exception: %s\n" (Exn.to_string e);
        Out_channel.flush stderr)
    ; effc = (fun (type a) (eff : a Effect.t) -> effc eff)
    }
;;

let cd_copy_defaults_to_robot_all () =
  Effect.Deep.match_with
    (fun () -> Ox_gameseq.copy_defaults_to_robot_all ())
    ()
    { retc = (fun () -> ())
    ; exnc = (fun e ->
        Printf.eprintf "[OX] copy_defaults_to_robot_all exception: %s\n" (Exn.to_string e);
        Out_channel.flush stderr)
    ; effc = (fun (type a) (eff : a Effect.t) -> effc eff)
    }
;;

let cd_gameseq_remove_unused_players () =
  Effect.Deep.match_with
    (fun () -> Ox_gameseq.gameseq_remove_unused_players ())
    ()
    { retc = (fun () -> ())
    ; exnc = (fun e ->
        Printf.eprintf "[OX] gameseq_remove_unused_players exception: %s\n" (Exn.to_string e);
        Out_channel.flush stderr)
    ; effc = (fun (type a) (eff : a Effect.t) -> effc eff)
    }
;;

let cd_gameseq_init_network_players () =
  Effect.Deep.match_with
    (fun () -> Ox_gameseq.gameseq_init_network_players ())
    ()
    { retc = (fun () -> ())
    ; exnc = (fun e ->
        Printf.eprintf "[OX] gameseq_init_network_players exception: %s\n" (Exn.to_string e);
        Out_channel.flush stderr)
    ; effc = (fun (type a) (eff : a Effect.t) -> effc eff)
    }
;;

let cd_clear_transient_objects clear_all =
  Effect.Deep.match_with
    (fun () -> Ox_gameseq.clear_transient_objects ~clear_all)
    ()
    { retc = (fun () -> ())
    ; exnc = (fun e ->
        Printf.eprintf "[OX] clear_transient_objects exception: %s\n" (Exn.to_string e);
        Out_channel.flush stderr)
    ; effc = (fun (type a) (eff : a Effect.t) -> effc eff)
    }
;;

let cd_filter_objects_from_level () =
  Effect.Deep.match_with
    (fun () -> Ox_gameseq.filter_objects_from_level ())
    ()
    { retc = (fun () -> ())
    ; exnc = (fun e ->
        Printf.eprintf "[OX] filter_objects_from_level exception: %s\n" (Exn.to_string e);
        Out_channel.flush stderr)
    ; effc = (fun (type a) (eff : a Effect.t) -> effc eff)
    }
;;

let register_callbacks () =
  Callback.register "cd_init_player_object" cd_init_player_object;
  Callback.register "cd_bash_to_shield" cd_bash_to_shield;
  Callback.register "cd_clear_stuck_objects" cd_clear_stuck_objects;
  Callback.register "cd_init_ammo_and_energy" cd_init_ammo_and_energy;
  Callback.register "cd_special_reset_objects" cd_special_reset_objects;
  Callback.register "cd_update_player_stats" cd_update_player_stats;
  Callback.register "cd_verify_console_object" cd_verify_console_object;
  Callback.register "cd_free_object_slots" cd_free_object_slots;
  Callback.register "cd_copy_defaults_to_robot" cd_copy_defaults_to_robot;
  Callback.register "cd_copy_defaults_to_robot_all" cd_copy_defaults_to_robot_all;
  Callback.register "cd_gameseq_init_network_players" cd_gameseq_init_network_players;
  Callback.register "cd_gameseq_remove_unused_players" cd_gameseq_remove_unused_players;
  Callback.register "cd_clear_transient_objects" cd_clear_transient_objects;
  Callback.register "cd_filter_objects_from_level" cd_filter_objects_from_level
;;
