(* Expect tests for Ox_collide — pure decision logic with mock effect handler. *)

let pp_effect_log effects =
  let effs = List.rev !effects |> String.concat ~sep:", " in
  sprintf "[%s]" effs
;;

let run_with_mock
      ?(multi_explode_result = false)
      ~flags
      ~shields
      ~damage
      ~is_boss
      ~is_multiplayer
      ~obj_id
      ~killer_objnum
      ()
  =
  let effects = ref [] in
  let new_shields, boss_hit, ret =
    Effect.Deep.match_with
      (fun () ->
         Ox_collide.apply_damage_to_robot_d1
           ~flags
           ~shields
           ~damage
           ~is_boss
           ~is_multiplayer
           ~obj_id
           ~killer_objnum)
      ()
      { retc = (fun x -> x)
      ; exnc = raise
      ; effc =
          (fun (type a) (eff : a Effect.t) ->
            match eff with
            | Ox_collide.Increment_kills ->
              Some
                (fun (k : (a, _) Effect.Deep.continuation) ->
                  effects := "Increment_kills" :: !effects;
                  Effect.Deep.continue k ())
            | Ox_collide.Start_boss_death obj_id ->
              Some
                (fun (k : (a, _) Effect.Deep.continuation) ->
                  effects := sprintf "Start_boss_death(%d)" obj_id :: !effects;
                  Effect.Deep.continue k ())
            | Ox_collide.Explode_object obj_id ->
              Some
                (fun (k : (a, _) Effect.Deep.continuation) ->
                  effects := sprintf "Explode_object(%d)" obj_id :: !effects;
                  Effect.Deep.continue k ())
            | Ox_collide.Send_net_robot_explode (obj_id, killer) ->
              Some
                (fun (k : (a, _) Effect.Deep.continuation) ->
                  effects
                  := sprintf "Send_net_robot_explode(%d,%d)" obj_id killer :: !effects;
                  Effect.Deep.continue k ())
            | Ox_collide.Query_multi_explode (obj_id, killer) ->
              Some
                (fun (k : (a, _) Effect.Deep.continuation) ->
                  effects
                  := sprintf "Query_multi_explode(%d,%d)" obj_id killer :: !effects;
                  Effect.Deep.continue k multi_explode_result)
            | _ -> None)
      }
  in
  printf
    "shields=%d boss_hit=%b ret=%d effects=%s\n"
    new_shields
    boss_hit
    ret
    (pp_effect_log effects)
;;

let%expect_test "robot already exploding" =
  run_with_mock
    ~flags:1
    ~shields:100
    ~damage:50
    ~is_boss:false
    ~is_multiplayer:false
    ~obj_id:7
    ~killer_objnum:0
    ();
  [%expect {| shields=100 boss_hit=false ret=0 effects=[] |}]
;;

let%expect_test "robot already dead" =
  run_with_mock
    ~flags:0
    ~shields:(-1)
    ~damage:50
    ~is_boss:false
    ~is_multiplayer:false
    ~obj_id:7
    ~killer_objnum:0
    ();
  [%expect {| shields=-1 boss_hit=false ret=0 effects=[] |}]
;;

let%expect_test "damage without kill" =
  run_with_mock
    ~flags:0
    ~shields:100
    ~damage:30
    ~is_boss:false
    ~is_multiplayer:false
    ~obj_id:7
    ~killer_objnum:0
    ();
  [%expect {| shields=70 boss_hit=false ret=0 effects=[] |}]
;;

let%expect_test "damage without kill (boss)" =
  run_with_mock
    ~flags:0
    ~shields:100
    ~damage:30
    ~is_boss:true
    ~is_multiplayer:false
    ~obj_id:7
    ~killer_objnum:0
    ();
  [%expect {| shields=70 boss_hit=true ret=0 effects=[] |}]
;;

let%expect_test "kill in single player (non-boss)" =
  run_with_mock
    ~flags:0
    ~shields:10
    ~damage:20
    ~is_boss:false
    ~is_multiplayer:false
    ~obj_id:7
    ~killer_objnum:0
    ();
  [%expect
    {| shields=-10 boss_hit=false ret=1 effects=[Increment_kills, Explode_object(7)] |}]
;;

let%expect_test "kill in single player (boss)" =
  run_with_mock
    ~flags:0
    ~shields:10
    ~damage:20
    ~is_boss:true
    ~is_multiplayer:false
    ~obj_id:42
    ~killer_objnum:0
    ();
  [%expect
    {| shields=-10 boss_hit=true ret=1 effects=[Increment_kills, Start_boss_death(42)] |}]
;;

let%expect_test "kill in multiplayer (multi_explode=true)" =
  run_with_mock
    ~multi_explode_result:true
    ~flags:0
    ~shields:10
    ~damage:20
    ~is_boss:false
    ~is_multiplayer:true
    ~obj_id:5
    ~killer_objnum:3
    ();
  [%expect
    {| shields=-10 boss_hit=false ret=1 effects=[Query_multi_explode(5,3), Send_net_robot_explode(5,3)] |}]
;;

let%expect_test "kill in multiplayer (multi_explode=false)" =
  run_with_mock
    ~multi_explode_result:false
    ~flags:0
    ~shields:10
    ~damage:20
    ~is_boss:false
    ~is_multiplayer:true
    ~obj_id:5
    ~killer_objnum:3
    ();
  [%expect {| shields=-10 boss_hit=false ret=0 effects=[Query_multi_explode(5,3)] |}]
;;

let%expect_test "kill in multiplayer boss (multi_explode=true)" =
  run_with_mock
    ~multi_explode_result:true
    ~flags:0
    ~shields:10
    ~damage:20
    ~is_boss:true
    ~is_multiplayer:true
    ~obj_id:5
    ~killer_objnum:3
    ();
  [%expect
    {| shields=-10 boss_hit=true ret=1 effects=[Query_multi_explode(5,3), Send_net_robot_explode(5,3)] |}]
;;

let%expect_test "kill in multiplayer boss (multi_explode=false)" =
  run_with_mock
    ~multi_explode_result:false
    ~flags:0
    ~shields:10
    ~damage:20
    ~is_boss:true
    ~is_multiplayer:true
    ~obj_id:5
    ~killer_objnum:3
    ();
  [%expect {| shields=-10 boss_hit=true ret=0 effects=[Query_multi_explode(5,3)] |}]
;;

(* ── D2 tests ─────────────────────────────────────────── *)

let run_d2_with_mock
      ?(multi_explode_result = false)
      ?(player_dead_or_no_shields = false)
      ?(multi_all_players_alive = true)
      ~flags
      ~shields
      ~damage
      ~is_boss
      ~is_companion
      ~is_thief
      ~is_death_roll
      ~is_kamikaze
      ~robot_id
      ~is_multiplayer
      ~is_final_level
      ~obj_id
      ~killer_objnum
      ()
  =
  let effects = ref [] in
  let new_shields, ret =
    Effect.Deep.match_with
      (fun () ->
         Ox_collide.apply_damage_to_robot_d2
           ~flags
           ~shields
           ~damage
           ~is_boss
           ~is_companion
           ~is_thief
           ~is_death_roll
           ~is_kamikaze
           ~robot_id
           ~is_multiplayer
           ~is_final_level
           ~obj_id
           ~killer_objnum)
      ()
      { retc = (fun x -> x)
      ; exnc = raise
      ; effc =
          (fun (type a) (eff : a Effect.t) ->
            match eff with
            | Ox_collide.Increment_kills ->
              Some
                (fun (k : (a, _) Effect.Deep.continuation) ->
                  effects := "Increment_kills" :: !effects;
                  Effect.Deep.continue k ())
            | Ox_collide.Start_boss_death obj_id ->
              Some
                (fun (k : (a, _) Effect.Deep.continuation) ->
                  effects := sprintf "Start_boss_death(%d)" obj_id :: !effects;
                  Effect.Deep.continue k ())
            | Ox_collide.Set_boss_hit_time ->
              Some
                (fun (k : (a, _) Effect.Deep.continuation) ->
                  effects := "Set_boss_hit_time" :: !effects;
                  Effect.Deep.continue k ())
            | Ox_collide.Query_player_dead_or_no_shields ->
              Some
                (fun (k : (a, _) Effect.Deep.continuation) ->
                  effects := "Query_player_dead_or_no_shields" :: !effects;
                  Effect.Deep.continue k player_dead_or_no_shields)
            | Ox_collide.Query_multi_all_players_alive ->
              Some
                (fun (k : (a, _) Effect.Deep.continuation) ->
                  effects := "Query_multi_all_players_alive" :: !effects;
                  Effect.Deep.continue k multi_all_players_alive)
            | Ox_collide.Do_final_boss_hacks ->
              Some
                (fun (k : (a, _) Effect.Deep.continuation) ->
                  effects := "Do_final_boss_hacks" :: !effects;
                  Effect.Deep.continue k ())
            | Ox_collide.Multi_send_finish_game ->
              Some
                (fun (k : (a, _) Effect.Deep.continuation) ->
                  effects := "Multi_send_finish_game" :: !effects;
                  Effect.Deep.continue k ())
            | Ox_collide.Save_stolen_items ->
              Some
                (fun (k : (a, _) Effect.Deep.continuation) ->
                  effects := "Save_stolen_items" :: !effects;
                  Effect.Deep.continue k ())
            | Ox_collide.Restore_stolen_items ->
              Some
                (fun (k : (a, _) Effect.Deep.continuation) ->
                  effects := "Restore_stolen_items" :: !effects;
                  Effect.Deep.continue k ())
            | Ox_collide.Clear_stolen_items ->
              Some
                (fun (k : (a, _) Effect.Deep.continuation) ->
                  effects := "Clear_stolen_items" :: !effects;
                  Effect.Deep.continue k ())
            | Ox_collide.Query_multi_explode_d2 (obj_id, killer, is_thief) ->
              Some
                (fun (k : (a, _) Effect.Deep.continuation) ->
                  effects
                  := sprintf "Query_multi_explode_d2(%d,%d,%b)" obj_id killer is_thief
                     :: !effects;
                  Effect.Deep.continue k multi_explode_result)
            | Ox_collide.Multi_send_robot_explode_d2 (obj_id, killer, is_thief) ->
              Some
                (fun (k : (a, _) Effect.Deep.continuation) ->
                  effects
                  := sprintf
                       "Multi_send_robot_explode_d2(%d,%d,%b)"
                       obj_id
                       killer
                       is_thief
                     :: !effects;
                  Effect.Deep.continue k ())
            | Ox_collide.Start_robot_death_sequence obj_id ->
              Some
                (fun (k : (a, _) Effect.Deep.continuation) ->
                  effects := sprintf "Start_robot_death_sequence(%d)" obj_id :: !effects;
                  Effect.Deep.continue k ())
            | Ox_collide.Special_reactor_stuff ->
              Some
                (fun (k : (a, _) Effect.Deep.continuation) ->
                  effects := "Special_reactor_stuff" :: !effects;
                  Effect.Deep.continue k ())
            | Ox_collide.Explode_object_delay (obj_id, delay) ->
              Some
                (fun (k : (a, _) Effect.Deep.continuation) ->
                  effects
                  := sprintf "Explode_object_delay(%d,%d)" obj_id delay :: !effects;
                  Effect.Deep.continue k ())
            | _ -> None)
      }
  in
  printf "shields=%d ret=%d effects=%s\n" new_shields ret (pp_effect_log effects)
;;

(* Convenience shorthand for D2 tests *)
let d2 =
  run_d2_with_mock
    ~is_boss:false
    ~is_companion:false
    ~is_thief:false
    ~is_death_roll:false
    ~is_kamikaze:false
    ~robot_id:0
    ~is_final_level:false
;;

let%expect_test "D2: robot already exploding" =
  d2 ~flags:1 ~shields:100 ~damage:50 ~is_multiplayer:false ~obj_id:7 ~killer_objnum:0 ();
  [%expect {| shields=100 ret=0 effects=[] |}]
;;

let%expect_test "D2: robot already dead" =
  d2 ~flags:0 ~shields:(-1) ~damage:50 ~is_multiplayer:false ~obj_id:7 ~killer_objnum:0 ();
  [%expect {| shields=-1 ret=0 effects=[] |}]
;;

let%expect_test "D2: companion on final level" =
  run_d2_with_mock
    ~flags:0
    ~shields:100
    ~damage:50
    ~is_boss:false
    ~is_companion:true
    ~is_thief:false
    ~is_death_roll:false
    ~is_kamikaze:false
    ~robot_id:0
    ~is_multiplayer:false
    ~is_final_level:true
    ~obj_id:7
    ~killer_objnum:0
    ();
  [%expect {| shields=100 ret=0 effects=[] |}]
;;

let%expect_test "D2: damage without kill (non-boss)" =
  d2 ~flags:0 ~shields:100 ~damage:30 ~is_multiplayer:false ~obj_id:7 ~killer_objnum:0 ();
  [%expect {| shields=70 ret=0 effects=[] |}]
;;

let%expect_test "D2: damage without kill (boss sets hit time)" =
  run_d2_with_mock
    ~flags:0
    ~shields:100
    ~damage:30
    ~is_boss:true
    ~is_companion:false
    ~is_thief:false
    ~is_death_roll:false
    ~is_kamikaze:false
    ~robot_id:0
    ~is_multiplayer:false
    ~is_final_level:false
    ~obj_id:7
    ~killer_objnum:0
    ();
  [%expect {| shields=70 ret=0 effects=[Set_boss_hit_time] |}]
;;

let%expect_test "D2: SP kill non-boss standard" =
  d2 ~flags:0 ~shields:10 ~damage:20 ~is_multiplayer:false ~obj_id:7 ~killer_objnum:0 ();
  [%expect
    {| shields=-10 ret=1 effects=[Increment_kills, Explode_object_delay(7,16384)] |}]
;;

let%expect_test "D2: SP kill boss" =
  run_d2_with_mock
    ~flags:0
    ~shields:10
    ~damage:20
    ~is_boss:true
    ~is_companion:false
    ~is_thief:false
    ~is_death_roll:false
    ~is_kamikaze:false
    ~robot_id:0
    ~is_multiplayer:false
    ~is_final_level:false
    ~obj_id:42
    ~killer_objnum:0
    ();
  [%expect
    {| shields=-10 ret=1 effects=[Set_boss_hit_time, Increment_kills, Start_boss_death(42)] |}]
;;

let%expect_test "D2: SP kill death_roll robot" =
  run_d2_with_mock
    ~flags:0
    ~shields:10
    ~damage:20
    ~is_boss:false
    ~is_companion:false
    ~is_thief:false
    ~is_death_roll:true
    ~is_kamikaze:false
    ~robot_id:0
    ~is_multiplayer:false
    ~is_final_level:false
    ~obj_id:7
    ~killer_objnum:0
    ();
  [%expect
    {| shields=-10 ret=1 effects=[Increment_kills, Start_robot_death_sequence(7)] |}]
;;

let%expect_test "D2: SP kill kamikaze (delay=1)" =
  run_d2_with_mock
    ~flags:0
    ~shields:10
    ~damage:20
    ~is_boss:false
    ~is_companion:false
    ~is_thief:false
    ~is_death_roll:false
    ~is_kamikaze:true
    ~robot_id:0
    ~is_multiplayer:false
    ~is_final_level:false
    ~obj_id:7
    ~killer_objnum:0
    ();
  [%expect {| shields=-10 ret=1 effects=[Increment_kills, Explode_object_delay(7,1)] |}]
;;

let%expect_test "D2: SP kill special reactor (id=65)" =
  run_d2_with_mock
    ~flags:0
    ~shields:10
    ~damage:20
    ~is_boss:false
    ~is_companion:false
    ~is_thief:false
    ~is_death_roll:false
    ~is_kamikaze:false
    ~robot_id:65
    ~is_multiplayer:false
    ~is_final_level:false
    ~obj_id:7
    ~killer_objnum:0
    ();
  [%expect
    {| shields=-10 ret=1 effects=[Increment_kills, Special_reactor_stuff, Explode_object_delay(7,16384)] |}]
;;

let%expect_test "D2: MP kill thief (multi_explode=true)" =
  run_d2_with_mock
    ~multi_explode_result:true
    ~flags:0
    ~shields:10
    ~damage:20
    ~is_boss:false
    ~is_companion:false
    ~is_thief:true
    ~is_death_roll:false
    ~is_kamikaze:false
    ~robot_id:0
    ~is_multiplayer:true
    ~is_final_level:false
    ~obj_id:5
    ~killer_objnum:3
    ();
  [%expect
    {| shields=-10 ret=1 effects=[Save_stolen_items, Query_multi_explode_d2(5,3,true), Restore_stolen_items, Multi_send_robot_explode_d2(5,3,true), Clear_stolen_items] |}]
;;

let%expect_test "D2: MP kill non-thief (multi_explode=true)" =
  run_d2_with_mock
    ~multi_explode_result:true
    ~flags:0
    ~shields:10
    ~damage:20
    ~is_boss:false
    ~is_companion:false
    ~is_thief:false
    ~is_death_roll:false
    ~is_kamikaze:false
    ~robot_id:0
    ~is_multiplayer:true
    ~is_final_level:false
    ~obj_id:5
    ~killer_objnum:3
    ();
  [%expect
    {| shields=-10 ret=1 effects=[Query_multi_explode_d2(5,3,false), Multi_send_robot_explode_d2(5,3,false)] |}]
;;

let%expect_test "D2: MP kill (multi_explode=false)" =
  run_d2_with_mock
    ~multi_explode_result:false
    ~flags:0
    ~shields:10
    ~damage:20
    ~is_boss:false
    ~is_companion:false
    ~is_thief:false
    ~is_death_roll:false
    ~is_kamikaze:false
    ~robot_id:0
    ~is_multiplayer:true
    ~is_final_level:false
    ~obj_id:5
    ~killer_objnum:3
    ();
  [%expect {| shields=-10 ret=0 effects=[Query_multi_explode_d2(5,3,false)] |}]
;;

let%expect_test "D2: final boss SP player alive" =
  run_d2_with_mock
    ~player_dead_or_no_shields:false
    ~flags:0
    ~shields:10
    ~damage:20
    ~is_boss:true
    ~is_companion:false
    ~is_thief:false
    ~is_death_roll:false
    ~is_kamikaze:false
    ~robot_id:0
    ~is_multiplayer:false
    ~is_final_level:true
    ~obj_id:42
    ~killer_objnum:0
    ();
  [%expect
    {| shields=-10 ret=1 effects=[Set_boss_hit_time, Query_player_dead_or_no_shields, Do_final_boss_hacks, Increment_kills, Start_boss_death(42)] |}]
;;

let%expect_test "D2: final boss SP player dead (shields→1)" =
  run_d2_with_mock
    ~player_dead_or_no_shields:true
    ~flags:0
    ~shields:10
    ~damage:20
    ~is_boss:true
    ~is_companion:false
    ~is_thief:false
    ~is_death_roll:false
    ~is_kamikaze:false
    ~robot_id:0
    ~is_multiplayer:false
    ~is_final_level:true
    ~obj_id:42
    ~killer_objnum:0
    ();
  [%expect
    {| shields=1 ret=0 effects=[Set_boss_hit_time, Query_player_dead_or_no_shields] |}]
;;

let%expect_test "D2: final boss MP all alive" =
  run_d2_with_mock
    ~multi_all_players_alive:true
    ~multi_explode_result:true
    ~flags:0
    ~shields:10
    ~damage:20
    ~is_boss:true
    ~is_companion:false
    ~is_thief:false
    ~is_death_roll:false
    ~is_kamikaze:false
    ~robot_id:0
    ~is_multiplayer:true
    ~is_final_level:true
    ~obj_id:42
    ~killer_objnum:3
    ();
  [%expect
    {| shields=-10 ret=1 effects=[Set_boss_hit_time, Query_multi_all_players_alive, Multi_send_finish_game, Do_final_boss_hacks, Query_multi_explode_d2(42,3,false), Multi_send_robot_explode_d2(42,3,false)] |}]
;;

let%expect_test "D2: final boss MP not all alive (shields→1)" =
  run_d2_with_mock
    ~multi_all_players_alive:false
    ~multi_explode_result:true
    ~flags:0
    ~shields:10
    ~damage:20
    ~is_boss:true
    ~is_companion:false
    ~is_thief:false
    ~is_death_roll:false
    ~is_kamikaze:false
    ~robot_id:0
    ~is_multiplayer:true
    ~is_final_level:true
    ~obj_id:42
    ~killer_objnum:3
    ();
  [%expect
    {| shields=1 ret=0 effects=[Set_boss_hit_time, Query_multi_all_players_alive] |}]
;;

(* ── apply_damage_to_clutter tests ──────────────────────── *)

let run_clutter ~flags ~shields ~damage ~obj_id =
  let effects = ref [] in
  let new_shields, ret =
    Effect.Deep.match_with
      (fun () -> Ox_collide.apply_damage_to_clutter ~flags ~shields ~damage ~obj_id)
      ()
      { retc = (fun x -> x)
      ; exnc = raise
      ; effc =
          (fun (type a) (eff : a Effect.t) ->
            match eff with
            | Ox_collide.Explode_object_delay (obj_id, delay) ->
              Some
                (fun (k : (a, _) Effect.Deep.continuation) ->
                  effects
                  := sprintf "Explode_object_delay(%d,%d)" obj_id delay :: !effects;
                  Effect.Deep.continue k ())
            | _ -> None)
      }
  in
  printf "shields=%d ret=%d effects=%s\n" new_shields ret (pp_effect_log effects)
;;

let%expect_test "clutter: already exploding" =
  run_clutter ~flags:1 ~shields:100 ~damage:50 ~obj_id:10;
  [%expect {| shields=100 ret=0 effects=[] |}]
;;

let%expect_test "clutter: already dead" =
  run_clutter ~flags:0 ~shields:(-1) ~damage:50 ~obj_id:10;
  [%expect {| shields=-1 ret=0 effects=[] |}]
;;

let%expect_test "clutter: damage survive" =
  run_clutter ~flags:0 ~shields:100 ~damage:30 ~obj_id:10;
  [%expect {| shields=70 ret=0 effects=[] |}]
;;

let%expect_test "clutter: damage kill" =
  run_clutter ~flags:0 ~shields:10 ~damage:20 ~obj_id:10;
  [%expect {| shields=-10 ret=1 effects=[Explode_object_delay(10,0)] |}]
;;

(* ── apply_damage_to_controlcen tests ──────────────────── *)

let run_controlcen
      ?(who_is_player = true)
      ?(who_is_local_player = true)
      ?(who_objnum = 0)
      ?(local_player_objnum = 0)
      ?(is_multiplayer = false)
      ?(is_coop = false)
      ?(time_level_ok = true)
      ~shields
      ~flags
      ~damage
      ~obj_id
      ?(who_id = 0)
      ()
  =
  let effects = ref [] in
  let new_shields =
    Effect.Deep.match_with
      (fun () ->
         Ox_collide.apply_damage_to_controlcen
           ~shields
           ~flags
           ~damage
           ~who_is_player
           ~who_is_local_player
           ~who_objnum
           ~local_player_objnum
           ~is_multiplayer
           ~is_coop
           ~time_level_ok
           ~obj_id
           ~who_id)
      ()
      { retc = (fun x -> x)
      ; exnc = raise
      ; effc =
          (fun (type a) (eff : a Effect.t) ->
            match eff with
            | Ox_collide.Show_hud_invul_message ->
              Some
                (fun (k : (a, _) Effect.Deep.continuation) ->
                  effects := "Show_hud_invul_message" :: !effects;
                  Effect.Deep.continue k ())
            | Ox_collide.Controlcen_been_hit ->
              Some
                (fun (k : (a, _) Effect.Deep.continuation) ->
                  effects := "Controlcen_been_hit" :: !effects;
                  Effect.Deep.continue k ())
            | Ox_collide.Do_controlcen_destroyed obj_id ->
              Some
                (fun (k : (a, _) Effect.Deep.continuation) ->
                  effects := sprintf "Do_controlcen_destroyed(%d)" obj_id :: !effects;
                  Effect.Deep.continue k ())
            | Ox_collide.Add_controlcen_score ->
              Some
                (fun (k : (a, _) Effect.Deep.continuation) ->
                  effects := "Add_controlcen_score" :: !effects;
                  Effect.Deep.continue k ())
            | Ox_collide.Multi_send_destroy_controlcen (obj_id, who_id) ->
              Some
                (fun (k : (a, _) Effect.Deep.continuation) ->
                  effects
                  := sprintf "Multi_send_destroy_controlcen(%d,%d)" obj_id who_id
                     :: !effects;
                  Effect.Deep.continue k ())
            | Ox_collide.Sound_controlcen_destroyed obj_id ->
              Some
                (fun (k : (a, _) Effect.Deep.continuation) ->
                  effects := sprintf "Sound_controlcen_destroyed(%d)" obj_id :: !effects;
                  Effect.Deep.continue k ())
            | Ox_collide.Explode_object_delay (obj_id, delay) ->
              Some
                (fun (k : (a, _) Effect.Deep.continuation) ->
                  effects
                  := sprintf "Explode_object_delay(%d,%d)" obj_id delay :: !effects;
                  Effect.Deep.continue k ())
            | _ -> None)
      }
  in
  printf "shields=%d effects=%s\n" new_shields (pp_effect_log effects)
;;

let%expect_test "controlcen: non-player attacker" =
  run_controlcen ~who_is_player:false ~shields:100 ~flags:0 ~damage:50 ~obj_id:20 ();
  [%expect {| shields=100 effects=[] |}]
;;

let%expect_test "controlcen: invul local player" =
  run_controlcen
    ~is_multiplayer:true
    ~is_coop:false
    ~time_level_ok:false
    ~who_is_local_player:true
    ~shields:100
    ~flags:0
    ~damage:50
    ~obj_id:20
    ();
  [%expect {| shields=100 effects=[Show_hud_invul_message] |}]
;;

let%expect_test "controlcen: invul remote player" =
  run_controlcen
    ~is_multiplayer:true
    ~is_coop:false
    ~time_level_ok:false
    ~who_is_local_player:false
    ~shields:100
    ~flags:0
    ~damage:50
    ~obj_id:20
    ();
  [%expect {| shields=100 effects=[] |}]
;;

let%expect_test "controlcen: local hit survive" =
  run_controlcen ~shields:100 ~flags:0 ~damage:30 ~obj_id:20 ();
  [%expect {| shields=70 effects=[Controlcen_been_hit] |}]
;;

let%expect_test "controlcen: local kill single player" =
  run_controlcen ~shields:10 ~flags:0 ~damage:20 ~obj_id:20 ();
  [%expect
    {| shields=-10 effects=[Controlcen_been_hit, Do_controlcen_destroyed(20), Add_controlcen_score, Sound_controlcen_destroyed(20), Explode_object_delay(20,0)] |}]
;;

let%expect_test "controlcen: local kill multiplayer (local player)" =
  run_controlcen
    ~is_multiplayer:true
    ~who_objnum:5
    ~local_player_objnum:5
    ~shields:10
    ~flags:0
    ~damage:20
    ~obj_id:20
    ~who_id:0
    ();
  [%expect
    {| shields=-10 effects=[Controlcen_been_hit, Do_controlcen_destroyed(20), Add_controlcen_score, Multi_send_destroy_controlcen(20,0), Sound_controlcen_destroyed(20), Explode_object_delay(20,0)] |}]
;;

let%expect_test "controlcen: local kill multiplayer (remote player)" =
  run_controlcen
    ~is_multiplayer:true
    ~who_objnum:5
    ~local_player_objnum:7
    ~shields:10
    ~flags:0
    ~damage:20
    ~obj_id:20
    ~who_id:1
    ();
  [%expect
    {| shields=-10 effects=[Controlcen_been_hit, Do_controlcen_destroyed(20), Multi_send_destroy_controlcen(20,1), Sound_controlcen_destroyed(20), Explode_object_delay(20,0)] |}]
;;

let%expect_test "controlcen: non-local hit" =
  run_controlcen ~who_is_local_player:false ~shields:100 ~flags:0 ~damage:30 ~obj_id:20 ();
  [%expect {| shields=70 effects=[] |}]
;;

(* ── apply_damage_to_player_d1 tests ──────────────────── *)

let run_player_d1
      ?(is_dead = false)
      ?(is_invulnerable = false)
      ?(is_endlevel = false)
      ?(is_local_player = true)
      ~player_shields
      ~damage
      ~killer_objnum
      ()
  =
  let effects = ref [] in
  let new_shields, dead =
    Effect.Deep.match_with
      (fun () ->
         Ox_collide.apply_damage_to_player_d1
           ~is_dead
           ~is_invulnerable
           ~is_endlevel
           ~is_local_player
           ~player_shields
           ~damage
           ~killer_objnum)
      ()
      { retc = (fun x -> x)
      ; exnc = raise
      ; effc =
          (fun (type a) (eff : a Effect.t) ->
            match eff with
            | Ox_collide.Palette_flash (r, g, b) ->
              Some
                (fun (k : (a, _) Effect.Deep.continuation) ->
                  effects := sprintf "Palette_flash(%d,%d,%d)" r g b :: !effects;
                  Effect.Deep.continue k ())
            | Ox_collide.Set_player_dead killer ->
              Some
                (fun (k : (a, _) Effect.Deep.continuation) ->
                  effects := sprintf "Set_player_dead(%d)" killer :: !effects;
                  Effect.Deep.continue k ())
            | _ -> None)
      }
  in
  printf "shields=%d dead=%b effects=%s\n" new_shields dead (pp_effect_log effects)
;;

let%expect_test "player D1: already dead" =
  run_player_d1 ~is_dead:true ~player_shields:100 ~damage:50 ~killer_objnum:5 ();
  [%expect {| shields=100 dead=false effects=[] |}]
;;

let%expect_test "player D1: invulnerable" =
  run_player_d1 ~is_invulnerable:true ~player_shields:100 ~damage:50 ~killer_objnum:5 ();
  [%expect {| shields=100 dead=false effects=[] |}]
;;

let%expect_test "player D1: endlevel" =
  run_player_d1 ~is_endlevel:true ~player_shields:100 ~damage:50 ~killer_objnum:5 ();
  [%expect {| shields=100 dead=false effects=[] |}]
;;

let%expect_test "player D1: non-local" =
  run_player_d1 ~is_local_player:false ~player_shields:100 ~damage:50 ~killer_objnum:5 ();
  [%expect {| shields=100 dead=false effects=[] |}]
;;

let%expect_test "player D1: damage survive" =
  (* damage=0x140000 (20.0 in fix), shields=0x640000 (100.0 in fix) *)
  run_player_d1 ~player_shields:0x640000 ~damage:0x140000 ~killer_objnum:5 ();
  [%expect {| shields=5242880 dead=false effects=[Palette_flash(80,-10,-10)] |}]
;;

let%expect_test "player D1: damage kill" =
  (* damage=0x960000 (150.0), shields=0x640000 (100.0) *)
  run_player_d1 ~player_shields:0x640000 ~damage:0x960000 ~killer_objnum:7 ();
  [%expect
    {| shields=-3276800 dead=true effects=[Palette_flash(600,-75,-75), Set_player_dead(7)] |}]
;;

(* ── apply_damage_to_player_d2 tests ──────────────────── *)

let run_player_d2
      ?(is_dead = false)
      ?(is_invulnerable = false)
      ?(is_endlevel = false)
      ?(is_local_player = true)
      ?(killer_is_companion = false)
      ~player_shields
      ~damage
      ~killer_objnum
      ()
  =
  let effects = ref [] in
  let new_shields, dead =
    Effect.Deep.match_with
      (fun () ->
         Ox_collide.apply_damage_to_player_d2
           ~is_dead
           ~is_invulnerable
           ~is_endlevel
           ~is_local_player
           ~player_shields
           ~damage
           ~killer_objnum
           ~killer_is_companion)
      ()
      { retc = (fun x -> x)
      ; exnc = raise
      ; effc =
          (fun (type a) (eff : a Effect.t) ->
            match eff with
            | Ox_collide.Palette_flash (r, g, b) ->
              Some
                (fun (k : (a, _) Effect.Deep.continuation) ->
                  effects := sprintf "Palette_flash(%d,%d,%d)" r g b :: !effects;
                  Effect.Deep.continue k ())
            | Ox_collide.Set_player_dead killer ->
              Some
                (fun (k : (a, _) Effect.Deep.continuation) ->
                  effects := sprintf "Set_player_dead(%d)" killer :: !effects;
                  Effect.Deep.continue k ())
            | Ox_collide.Set_buddy_sorry_time ->
              Some
                (fun (k : (a, _) Effect.Deep.continuation) ->
                  effects := "Set_buddy_sorry_time" :: !effects;
                  Effect.Deep.continue k ())
            | _ -> None)
      }
  in
  printf "shields=%d dead=%b effects=%s\n" new_shields dead (pp_effect_log effects)
;;

let%expect_test "player D2: already dead" =
  run_player_d2 ~is_dead:true ~player_shields:100 ~damage:50 ~killer_objnum:5 ();
  [%expect {| shields=100 dead=false effects=[] |}]
;;

let%expect_test "player D2: invulnerable" =
  run_player_d2 ~is_invulnerable:true ~player_shields:100 ~damage:50 ~killer_objnum:5 ();
  [%expect {| shields=100 dead=false effects=[] |}]
;;

let%expect_test "player D2: endlevel" =
  run_player_d2 ~is_endlevel:true ~player_shields:100 ~damage:50 ~killer_objnum:5 ();
  [%expect {| shields=100 dead=false effects=[] |}]
;;

let%expect_test "player D2: non-local" =
  run_player_d2 ~is_local_player:false ~player_shields:100 ~damage:50 ~killer_objnum:5 ();
  [%expect {| shields=100 dead=false effects=[] |}]
;;

let%expect_test "player D2: damage survive" =
  run_player_d2 ~player_shields:0x640000 ~damage:0x140000 ~killer_objnum:5 ();
  [%expect {| shields=5242880 dead=false effects=[Palette_flash(80,-10,-10)] |}]
;;

let%expect_test "player D2: damage kill (non-companion)" =
  run_player_d2 ~player_shields:0x640000 ~damage:0x960000 ~killer_objnum:7 ();
  [%expect
    {| shields=-3276800 dead=true effects=[Palette_flash(600,-75,-75), Set_player_dead(7)] |}]
;;

let%expect_test "player D2: damage kill (companion)" =
  run_player_d2
    ~killer_is_companion:true
    ~player_shields:0x640000
    ~damage:0x960000
    ~killer_objnum:7
    ();
  [%expect
    {| shields=-3276800 dead=true effects=[Palette_flash(600,-75,-75), Set_player_dead(7), Set_buddy_sorry_time] |}]
;;

(* ── maybe_kill_weapon D1 tests ────────────────────────── *)

let run_mkw_d1 ~weapon_id ?(phys_flags = 0) ~weapon_shields ~other_type ~other_shields () =
  let new_shields, dead =
    Ox_collide.maybe_kill_weapon_d1
      ~weapon_id
      ~phys_flags
      ~weapon_shields
      ~other_type
      ~other_shields
  in
  printf "shields=%d dead=%b\n" new_shields dead
;;

let%expect_test "mkw D1: proximity always dies" =
  run_mkw_d1
    ~weapon_id:16
    ~weapon_shields:0x640000
    ~other_type:2
    ~other_shields:0x640000
    ();
  [%expect {| shields=6553600 dead=true |}]
;;

let%expect_test "mkw D1: non-persistent vs non-weapon → dead" =
  run_mkw_d1
    ~weapon_id:1
    ~weapon_shields:0x640000
    ~other_type:2
    ~other_shields:0x640000
    ();
  [%expect {| shields=6553600 dead=true |}]
;;

let%expect_test "mkw D1: persistent vs non-weapon → survives" =
  run_mkw_d1
    ~weapon_id:1
    ~phys_flags:0x20
    ~weapon_shields:0x640000
    ~other_type:2
    ~other_shields:0x640000
    ();
  [%expect {| shields=6553600 dead=false |}]
;;

let%expect_test "mkw D1: non-persistent vs weapon, weakened but survives" =
  run_mkw_d1
    ~weapon_id:1
    ~weapon_shields:0x640000
    ~other_type:5
    ~other_shields:0x320000
    ();
  [%expect {| shields=4915200 dead=false |}]
;;

let%expect_test "mkw D1: non-persistent vs weapon, weakened to death" =
  run_mkw_d1
    ~weapon_id:1
    ~weapon_shields:0x100000
    ~other_type:5
    ~other_shields:0x640000
    ();
  [%expect {| shields=0 dead=true |}]
;;

let%expect_test "mkw D1: non-persistent vs non-weapon (robot), shield reduced by 1/4" =
  run_mkw_d1
    ~weapon_id:1
    ~phys_flags:0
    ~weapon_shields:0x640000
    ~other_type:2
    ~other_shields:0x640000
    ();
  [%expect {| shields=6553600 dead=true |}]
;;

let%expect_test "mkw D1: persistent vs weapon → survives (persistent immune)" =
  run_mkw_d1
    ~weapon_id:1
    ~phys_flags:0x20
    ~weapon_shields:0x640000
    ~other_type:5
    ~other_shields:0x640000
    ();
  [%expect {| shields=6553600 dead=false |}]
;;

(* ── maybe_kill_weapon D2 tests ────────────────────────── *)

let run_mkw_d2
      ~weapon_id
      ?(phys_flags = 0)
      ~weapon_shields
      ~other_type
      ~other_shields
      ?(is_shareware = false)
      ()
  =
  let new_shields, dead =
    Ox_collide.maybe_kill_weapon_d2
      ~weapon_id
      ~phys_flags
      ~weapon_shields
      ~other_type
      ~other_shields
      ~is_shareware
  in
  printf "shields=%d dead=%b\n" new_shields dead
;;

let%expect_test "mkw D2: proximity always dies" =
  run_mkw_d2
    ~weapon_id:16
    ~weapon_shields:0x640000
    ~other_type:2
    ~other_shields:0x640000
    ();
  [%expect {| shields=6553600 dead=true |}]
;;

let%expect_test "mkw D2: superprox always dies" =
  run_mkw_d2
    ~weapon_id:38
    ~weapon_shields:0x640000
    ~other_type:2
    ~other_shields:0x640000
    ();
  [%expect {| shields=6553600 dead=true |}]
;;

let%expect_test "mkw D2: pmine always dies" =
  run_mkw_d2
    ~weapon_id:51
    ~weapon_shields:0x640000
    ~other_type:2
    ~other_shields:0x640000
    ();
  [%expect {| shields=6553600 dead=true |}]
;;

let%expect_test
    "mkw D2: non-persistent, non-shareware, vs weapon → dead (no shareware protection)"
  =
  run_mkw_d2
    ~weapon_id:1
    ~weapon_shields:0x640000
    ~other_type:5
    ~other_shields:0x640000
    ();
  [%expect {| shields=6553600 dead=true |}]
;;

let%expect_test "mkw D2: non-persistent, shareware, vs weapon → weakened" =
  run_mkw_d2
    ~weapon_id:1
    ~weapon_shields:0x640000
    ~other_type:5
    ~other_shields:0x320000
    ~is_shareware:true
    ();
  [%expect {| shields=4915200 dead=false |}]
;;

let%expect_test "mkw D2: persistent → survives" =
  run_mkw_d2
    ~weapon_id:1
    ~phys_flags:0x20
    ~weapon_shields:0x640000
    ~other_type:2
    ~other_shields:0x640000
    ();
  [%expect {| shields=6553600 dead=false |}]
;;

let%expect_test "mkw D2: non-persistent vs non-weapon, non-shareware → dead" =
  run_mkw_d2
    ~weapon_id:1
    ~weapon_shields:0x640000
    ~other_type:2
    ~other_shields:0x640000
    ();
  [%expect {| shields=6553600 dead=true |}]
;;

(* ── calc_best_gun tests ──────────────────────────────── *)

(* F1_0 = 0x10000 = 65536 *)
let f1_0 = 0x10000

let%expect_test "calc_best_gun: single gun, positive dot" =
  (* gun at origin, pointing +Z; player at (0, 0, 10*F1_0) → should pick gun 0 *)
  let packed =
    [| 1
     ; 0
     ; 0
     ; 0
     ; (* gun_pos[0] *)
       0
     ; 0
     ; f1_0
     ; (* gun_dir[0] *)
       0
     ; 0
     ; 10 * f1_0 (* objpos *)
    |]
  in
  printf "%d\n" (Ox_collide.calc_best_gun packed);
  [%expect {| 0 |}]
;;

let%expect_test "calc_best_gun: single gun, negative dot → -1" =
  (* gun at origin, pointing +Z; player behind at (0, 0, -10*F1_0) *)
  let packed =
    [| 1
     ; 0
     ; 0
     ; 0
     ; (* gun_pos[0] *)
       0
     ; 0
     ; f1_0
     ; (* gun_dir[0] *)
       0
     ; 0
     ; -10 * f1_0 (* objpos *)
    |]
  in
  printf "%d\n" (Ox_collide.calc_best_gun packed);
  [%expect {| -1 |}]
;;

let%expect_test "calc_best_gun: two guns, picks better one" =
  (* gun0 at origin pointing +X; gun1 at origin pointing +Z; player at (0, 0, 10*F1_0) *)
  let packed =
    [| 2
     ; 0
     ; 0
     ; 0
     ; (* gun_pos[0] *)
       0
     ; 0
     ; 0
     ; (* gun_pos[1] *)
       f1_0
     ; 0
     ; 0
     ; (* gun_dir[0] = +X *)
       0
     ; 0
     ; f1_0
     ; (* gun_dir[1] = +Z *)
       0
     ; 0
     ; 10 * f1_0 (* objpos: +Z direction *)
    |]
  in
  printf "%d\n" (Ox_collide.calc_best_gun packed);
  [%expect {| 1 |}]
;;

(* ── chase_angles tests ──────────────────────────────── *)

let run_chase ~cur_p ~cur_b ~cur_h ~desired_p ~desired_b ~desired_h ~frame_time () =
  let new_p, new_b, new_h, mask =
    Ox_collide.chase_angles
      ~cur_p
      ~cur_b
      ~cur_h
      ~desired_p
      ~desired_b
      ~desired_h
      ~frame_time
  in
  printf "p=%d b=%d h=%d mask=%d\n" new_p new_b new_h mask
;;

let%expect_test "chase_angles: already at destination" =
  run_chase
    ~cur_p:100
    ~cur_b:200
    ~cur_h:300
    ~desired_p:100
    ~desired_b:200
    ~desired_h:300
    ~frame_time:f1_0
    ();
  [%expect {| p=100 b=200 h=300 mask=7 |}]
;;

let%expect_test "chase_angles: small delta, snaps to dest" =
  (* CHASE_TURN_RATE = 0x1000, frame_time = F1_0 → frame_turn = 0x1000
     delta of 100 < 0x1000 → snaps *)
  run_chase
    ~cur_p:0
    ~cur_b:0
    ~cur_h:0
    ~desired_p:100
    ~desired_b:50
    ~desired_h:80
    ~frame_time:f1_0
    ();
  [%expect {| p=100 b=50 h=80 mask=7 |}]
;;

let%expect_test "chase_angles: large delta, moves by frame_turn" =
  (* frame_turn = fixmul(F1_0, 0x1000) = 0x1000
     delta = 0x8000 > 0x1000 → moves by 0x1000 *)
  run_chase
    ~cur_p:0
    ~cur_b:0
    ~cur_h:0
    ~desired_p:0x8000
    ~desired_b:0
    ~desired_h:0
    ~frame_time:f1_0
    ();
  [%expect {| p=4096 b=0 h=0 mask=6 |}]
;;

let%expect_test "chase_angles: negative delta, moves negatively" =
  run_chase
    ~cur_p:0x8000
    ~cur_b:0
    ~cur_h:0
    ~desired_p:0
    ~desired_b:0
    ~desired_h:0
    ~frame_time:f1_0
    ();
  [%expect {| p=28672 b=0 h=0 mask=6 |}]
;;

(* ── laser_are_related D1 tests ──────────────────────── *)

(* Constants: OBJ_WEAPON=5, PROXIMITY_ID=16, F1_0=0x10000 *)
let obj_weapon = 5

(* Make a packed array for laser_are_related.
   [o1_idx, o1_type, o1_id, o1_sig, o1_pnum, o1_psig, o1_ctime,
    o2_idx, o2_type, o2_id, o2_sig, o2_pnum, o2_psig, o2_ctime,
    game_time] *)
let mk_lar
      ?(o1_idx = 0)
      ?(o1_type = obj_weapon)
      ?(o1_id = 1)
      ?(o1_sig = 100)
      ?(o1_pnum = -1)
      ?(o1_psig = -1)
      ?(o1_ctime = 0)
      ?(o2_idx = 1)
      ?(o2_type = obj_weapon)
      ?(o2_id = 1)
      ?(o2_sig = 200)
      ?(o2_pnum = -1)
      ?(o2_psig = -1)
      ?(o2_ctime = 0)
      ?(game_time = 0)
      ()
  =
  [| o1_idx
   ; o1_type
   ; o1_id
   ; o1_sig
   ; o1_pnum
   ; o1_psig
   ; o1_ctime
   ; o2_idx
   ; o2_type
   ; o2_id
   ; o2_sig
   ; o2_pnum
   ; o2_psig
   ; o2_ctime
   ; game_time
  |]
;;

let%expect_test "lar D1: negative indices → 0" =
  printf "%d\n" (Ox_collide.laser_are_related_d1 (mk_lar ~o1_idx:(-1) ()));
  [%expect {| 0 |}]
;;

let%expect_test "lar D1: o1 is weapon, o2 is parent, non-proximity → related" =
  printf
    "%d\n"
    (Ox_collide.laser_are_related_d1
       (mk_lar
          ~o1_idx:5
          ~o1_type:obj_weapon
          ~o1_id:1
          ~o1_pnum:10
          ~o1_psig:200
          ~o2_idx:10
          ~o2_sig:200
          ~o2_type:4
          ()));
  [%expect {| 1 |}]
;;

let%expect_test "lar D1: o1 is proximity, young → related" =
  printf
    "%d\n"
    (Ox_collide.laser_are_related_d1
       (mk_lar
          ~o1_idx:5
          ~o1_type:obj_weapon
          ~o1_id:16
          ~o1_pnum:10
          ~o1_psig:200
          ~o1_ctime:100
          ~o2_idx:10
          ~o2_sig:200
          ~o2_type:4
          ~game_time:200
          ()));
  [%expect {| 1 |}]
;;

let%expect_test "lar D1: o1 is proximity, old (>2s) → not related" =
  printf
    "%d\n"
    (Ox_collide.laser_are_related_d1
       (mk_lar
          ~o1_idx:5
          ~o1_type:obj_weapon
          ~o1_id:16
          ~o1_pnum:10
          ~o1_psig:200
          ~o1_ctime:100
          ~o2_idx:10
          ~o2_sig:200
          ~o2_type:4
          ~game_time:(100 + (f1_0 * 2) + 1)
          ()));
  [%expect {| 0 |}]
;;

let%expect_test "lar D1: siblings, same parent, non-proximity → related" =
  printf
    "%d\n"
    (Ox_collide.laser_are_related_d1
       (mk_lar
          ~o1_idx:5
          ~o1_type:obj_weapon
          ~o1_id:1
          ~o1_psig:300
          ~o2_idx:6
          ~o2_type:obj_weapon
          ~o2_id:1
          ~o2_psig:300
          ()));
  [%expect {| 1 |}]
;;

let%expect_test "lar D1: siblings, same parent, one is proximity → not related" =
  printf
    "%d\n"
    (Ox_collide.laser_are_related_d1
       (mk_lar
          ~o1_idx:5
          ~o1_type:obj_weapon
          ~o1_id:16
          ~o1_psig:300
          ~o2_idx:6
          ~o2_type:obj_weapon
          ~o2_id:1
          ~o2_psig:300
          ()));
  [%expect {| 0 |}]
;;

let%expect_test "lar D1: both weapons, different parents → not related" =
  printf
    "%d\n"
    (Ox_collide.laser_are_related_d1
       (mk_lar
          ~o1_idx:5
          ~o1_type:obj_weapon
          ~o1_id:1
          ~o1_psig:300
          ~o2_idx:6
          ~o2_type:obj_weapon
          ~o2_id:1
          ~o2_psig:400
          ()));
  [%expect {| 0 |}]
;;

(* ── laser_are_related D2 tests ──────────────────────── *)

let%expect_test "lar D2: phoenix, old (>0.25s) → not related" =
  printf
    "%d\n"
    (Ox_collide.laser_are_related_d2
       (mk_lar
          ~o1_idx:5
          ~o1_type:obj_weapon
          ~o1_id:34
          ~o1_pnum:10
          ~o1_psig:200
          ~o1_ctime:100
          ~o2_idx:10
          ~o2_sig:200
          ~o2_type:4
          ~game_time:(100 + (f1_0 / 4) + 1)
          ()));
  [%expect {| 0 |}]
;;

let%expect_test "lar D2: phoenix, young → related" =
  printf
    "%d\n"
    (Ox_collide.laser_are_related_d2
       (mk_lar
          ~o1_idx:5
          ~o1_type:obj_weapon
          ~o1_id:34
          ~o1_pnum:10
          ~o1_psig:200
          ~o1_ctime:100
          ~o2_idx:10
          ~o2_sig:200
          ~o2_type:4
          ~game_time:200
          ()));
  [%expect {| 1 |}]
;;

let%expect_test "lar D2: siblings, prox, both young → related" =
  printf
    "%d\n"
    (Ox_collide.laser_are_related_d2
       (mk_lar
          ~o1_idx:5
          ~o1_type:obj_weapon
          ~o1_id:16
          ~o1_psig:300
          ~o1_ctime:1000
          ~o2_idx:6
          ~o2_type:obj_weapon
          ~o2_id:1
          ~o2_psig:300
          ~o2_ctime:1000
          ~game_time:1100
          ()));
  [%expect {| 1 |}]
;;

let%expect_test "lar D2: siblings, prox, one old → not related" =
  printf
    "%d\n"
    (Ox_collide.laser_are_related_d2
       (mk_lar
          ~o1_idx:5
          ~o1_type:obj_weapon
          ~o1_id:16
          ~o1_psig:300
          ~o1_ctime:100
          ~o2_idx:6
          ~o2_type:obj_weapon
          ~o2_id:1
          ~o2_psig:300
          ~o2_ctime:1000
          ~game_time:(100 + (f1_0 / 2) + 1)
          ()));
  [%expect {| 0 |}]
;;

let%expect_test "lar D2: robot_superprox → not related" =
  printf
    "%d\n"
    (Ox_collide.laser_are_related_d2
       (mk_lar
          ~o1_idx:5
          ~o1_type:obj_weapon
          ~o1_id:53
          ~o1_psig:300
          ~o2_idx:6
          ~o2_type:obj_weapon
          ~o2_id:1
          ~o2_psig:400
          ()));
  [%expect {| 0 |}]
;;

let%expect_test "lar D2: pmine → not related" =
  printf
    "%d\n"
    (Ox_collide.laser_are_related_d2
       (mk_lar
          ~o1_idx:5
          ~o1_type:obj_weapon
          ~o1_id:51
          ~o1_psig:300
          ~o2_idx:6
          ~o2_type:obj_weapon
          ~o2_id:1
          ~o2_psig:400
          ()));
  [%expect {| 0 |}]
;;

let%expect_test "lar D2: both regular weapons, different parents → related" =
  printf
    "%d\n"
    (Ox_collide.laser_are_related_d2
       (mk_lar
          ~o1_idx:5
          ~o1_type:obj_weapon
          ~o1_id:1
          ~o1_psig:300
          ~o2_idx:6
          ~o2_type:obj_weapon
          ~o2_id:2
          ~o2_psig:400
          ()));
  [%expect {| 1 |}]
;;

(* ── calc_controlcen_gun_point tests ─────────────────── *)

let%expect_test "ccgp: identity orient, gun at origin → gun at obj pos" =
  let gpx, gpy, gpz, gdx, gdy, gdz =
    Ox_collide.calc_controlcen_gun_point
      ~glpx:0
      ~glpy:0
      ~glpz:0
      ~gldx:0
      ~gldy:0
      ~gldz:f1_0
      ~or1:f1_0
      ~or2:0
      ~or3:0
      ~ou1:0
      ~ou2:f1_0
      ~ou3:0
      ~of1:0
      ~of2:0
      ~of3:f1_0
      ~opx:(10 * f1_0)
      ~opy:(20 * f1_0)
      ~opz:(30 * f1_0)
  in
  printf "gp=(%d,%d,%d) gd=(%d,%d,%d)\n" gpx gpy gpz gdx gdy gdz;
  [%expect {| gp=(655360,1310720,1966080) gd=(0,0,65536) |}]
;;

let%expect_test "ccgp: identity orient, gun offset → world offset" =
  let gpx, gpy, gpz, _gdx, _gdy, _gdz =
    Ox_collide.calc_controlcen_gun_point
      ~glpx:f1_0
      ~glpy:0
      ~glpz:0
      ~gldx:f1_0
      ~gldy:0
      ~gldz:0
      ~or1:f1_0
      ~or2:0
      ~or3:0
      ~ou1:0
      ~ou2:f1_0
      ~ou3:0
      ~of1:0
      ~of2:0
      ~of3:f1_0
      ~opx:(5 * f1_0)
      ~opy:0
      ~opz:0
  in
  printf "gp=(%d,%d,%d)\n" gpx gpy gpz;
  [%expect {| gp=(393216,0,0) |}]
;;
