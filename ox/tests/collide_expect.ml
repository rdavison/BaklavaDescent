(* Expect tests for Ox_collide — pure decision logic with mock effect handler. *)

let pp_effect_log effects =
  let effs = List.rev !effects |> String.concat ~sep:", " in
  sprintf "[%s]" effs

let run_with_mock ?(multi_explode_result=false)
    ~flags ~shields ~damage ~is_boss ~is_multiplayer ~obj_id ~killer_objnum () =
  let effects = ref [] in
  let new_shields, boss_hit, ret =
    Effect.Deep.match_with
      (fun () ->
        Ox_collide.apply_damage_to_robot_d1
          ~flags ~shields ~damage ~is_boss ~is_multiplayer ~obj_id ~killer_objnum)
      ()
      { retc = (fun x -> x);
        exnc = raise;
        effc = fun (type a) (eff : a Effect.t) ->
          match eff with
          | Ox_collide.Increment_kills ->
            Some (fun (k : (a, _) Effect.Deep.continuation) ->
              effects := "Increment_kills" :: !effects;
              Effect.Deep.continue k ())
          | Ox_collide.Start_boss_death obj_id ->
            Some (fun (k : (a, _) Effect.Deep.continuation) ->
              effects := sprintf "Start_boss_death(%d)" obj_id :: !effects;
              Effect.Deep.continue k ())
          | Ox_collide.Explode_object obj_id ->
            Some (fun (k : (a, _) Effect.Deep.continuation) ->
              effects := sprintf "Explode_object(%d)" obj_id :: !effects;
              Effect.Deep.continue k ())
          | Ox_collide.Send_net_robot_explode (obj_id, killer) ->
            Some (fun (k : (a, _) Effect.Deep.continuation) ->
              effects := sprintf "Send_net_robot_explode(%d,%d)" obj_id killer :: !effects;
              Effect.Deep.continue k ())
          | Ox_collide.Query_multi_explode (obj_id, killer) ->
            Some (fun (k : (a, _) Effect.Deep.continuation) ->
              effects := sprintf "Query_multi_explode(%d,%d)" obj_id killer :: !effects;
              Effect.Deep.continue k multi_explode_result)
          | _ -> None }
  in
  printf "shields=%d boss_hit=%b ret=%d effects=%s\n"
    new_shields boss_hit ret (pp_effect_log effects)

let%expect_test "robot already exploding" =
  run_with_mock ~flags:1 ~shields:100 ~damage:50 ~is_boss:false ~is_multiplayer:false ~obj_id:7 ~killer_objnum:0 ();
  [%expect {| shields=100 boss_hit=false ret=0 effects=[] |}]

let%expect_test "robot already dead" =
  run_with_mock ~flags:0 ~shields:(-1) ~damage:50 ~is_boss:false ~is_multiplayer:false ~obj_id:7 ~killer_objnum:0 ();
  [%expect {| shields=-1 boss_hit=false ret=0 effects=[] |}]

let%expect_test "damage without kill" =
  run_with_mock ~flags:0 ~shields:100 ~damage:30 ~is_boss:false ~is_multiplayer:false ~obj_id:7 ~killer_objnum:0 ();
  [%expect {| shields=70 boss_hit=false ret=0 effects=[] |}]

let%expect_test "damage without kill (boss)" =
  run_with_mock ~flags:0 ~shields:100 ~damage:30 ~is_boss:true ~is_multiplayer:false ~obj_id:7 ~killer_objnum:0 ();
  [%expect {| shields=70 boss_hit=true ret=0 effects=[] |}]

let%expect_test "kill in single player (non-boss)" =
  run_with_mock ~flags:0 ~shields:10 ~damage:20 ~is_boss:false ~is_multiplayer:false ~obj_id:7 ~killer_objnum:0 ();
  [%expect {| shields=-10 boss_hit=false ret=1 effects=[Increment_kills, Explode_object(7)] |}]

let%expect_test "kill in single player (boss)" =
  run_with_mock ~flags:0 ~shields:10 ~damage:20 ~is_boss:true ~is_multiplayer:false ~obj_id:42 ~killer_objnum:0 ();
  [%expect {| shields=-10 boss_hit=true ret=1 effects=[Increment_kills, Start_boss_death(42)] |}]

let%expect_test "kill in multiplayer (multi_explode=true)" =
  run_with_mock ~multi_explode_result:true ~flags:0 ~shields:10 ~damage:20 ~is_boss:false ~is_multiplayer:true ~obj_id:5 ~killer_objnum:3 ();
  [%expect {| shields=-10 boss_hit=false ret=1 effects=[Query_multi_explode(5,3), Send_net_robot_explode(5,3)] |}]

let%expect_test "kill in multiplayer (multi_explode=false)" =
  run_with_mock ~multi_explode_result:false ~flags:0 ~shields:10 ~damage:20 ~is_boss:false ~is_multiplayer:true ~obj_id:5 ~killer_objnum:3 ();
  [%expect {| shields=-10 boss_hit=false ret=0 effects=[Query_multi_explode(5,3)] |}]

let%expect_test "kill in multiplayer boss (multi_explode=true)" =
  run_with_mock ~multi_explode_result:true ~flags:0 ~shields:10 ~damage:20 ~is_boss:true ~is_multiplayer:true ~obj_id:5 ~killer_objnum:3 ();
  [%expect {| shields=-10 boss_hit=true ret=1 effects=[Query_multi_explode(5,3), Send_net_robot_explode(5,3)] |}]

let%expect_test "kill in multiplayer boss (multi_explode=false)" =
  run_with_mock ~multi_explode_result:false ~flags:0 ~shields:10 ~damage:20 ~is_boss:true ~is_multiplayer:true ~obj_id:5 ~killer_objnum:3 ();
  [%expect {| shields=-10 boss_hit=true ret=0 effects=[Query_multi_explode(5,3)] |}]
