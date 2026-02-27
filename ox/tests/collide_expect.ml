(* Expect tests for Ox_collide — pure decision logic, no C oracle needed. *)

let pp_effect = function
  | Ox_collide.Increment_kills -> "Increment_kills"
  | Start_boss_death id -> sprintf "Start_boss_death(%d)" id
  | Explode_object id -> sprintf "Explode_object(%d)" id
  | Send_net_robot_explode (id, k) ->
    sprintf "Send_net_robot_explode(%d,%d)" id k

let rec pp_node = function
  | Ox_collide.Leaf (ret, effects) ->
    let effs = List.map effects ~f:pp_effect |> String.concat ~sep:", " in
    sprintf "Leaf(%d, [%s])" ret effs
  | Ox_collide.Query_multi_explode (obj_id, killer, t, e) ->
    sprintf "Query(%d,%d, then=%s, else=%s)" obj_id killer (pp_node t) (pp_node e)

let test ~flags ~shields ~damage ~is_boss ~is_multiplayer ~obj_id ~killer_objnum =
  let new_shields, boss_hit, tree =
    Ox_collide.apply_damage_to_robot_d1
      ~flags ~shields ~damage ~is_boss ~is_multiplayer ~obj_id ~killer_objnum
  in
  printf "shields=%d boss_hit=%b tree=%s\n" new_shields boss_hit (pp_node tree)

(* Also test serialization round-trip *)
let test_serialized ~flags ~shields ~damage ~is_boss ~is_multiplayer ~obj_id ~killer_objnum =
  let new_shields, boss_hit, tree =
    Ox_collide.apply_damage_to_robot_d1
      ~flags ~shields ~damage ~is_boss ~is_multiplayer ~obj_id ~killer_objnum
  in
  let size = Ox_collide.node_size tree in
  let buf = Array.create ~len:(2 + size) 0 in
  buf.(0) <- new_shields;
  buf.(1) <- (if boss_hit then 1 else 0);
  let end_pos = Ox_collide.serialize_node buf 2 tree in
  printf "serialized: len=%d vals=[%s]\n"
    end_pos
    (Array.to_list (Array.sub buf ~pos:0 ~len:end_pos)
     |> List.map ~f:Int.to_string |> String.concat ~sep:", ")

let%expect_test "robot already exploding" =
  test ~flags:1 ~shields:100 ~damage:50 ~is_boss:false ~is_multiplayer:false ~obj_id:7 ~killer_objnum:0;
  [%expect {| shields=100 boss_hit=false tree=Leaf(0, []) |}]

let%expect_test "robot already dead" =
  test ~flags:0 ~shields:(-1) ~damage:50 ~is_boss:false ~is_multiplayer:false ~obj_id:7 ~killer_objnum:0;
  [%expect {| shields=-1 boss_hit=false tree=Leaf(0, []) |}]

let%expect_test "damage without kill" =
  test ~flags:0 ~shields:100 ~damage:30 ~is_boss:false ~is_multiplayer:false ~obj_id:7 ~killer_objnum:0;
  [%expect {| shields=70 boss_hit=false tree=Leaf(0, []) |}]

let%expect_test "damage without kill (boss)" =
  test ~flags:0 ~shields:100 ~damage:30 ~is_boss:true ~is_multiplayer:false ~obj_id:7 ~killer_objnum:0;
  [%expect {| shields=70 boss_hit=true tree=Leaf(0, []) |}]

let%expect_test "kill in single player (non-boss)" =
  test ~flags:0 ~shields:10 ~damage:20 ~is_boss:false ~is_multiplayer:false ~obj_id:7 ~killer_objnum:0;
  [%expect {| shields=-10 boss_hit=false tree=Leaf(1, [Increment_kills, Explode_object(7)]) |}]

let%expect_test "kill in single player (boss)" =
  test ~flags:0 ~shields:10 ~damage:20 ~is_boss:true ~is_multiplayer:false ~obj_id:42 ~killer_objnum:0;
  [%expect {| shields=-10 boss_hit=true tree=Leaf(1, [Increment_kills, Start_boss_death(42)]) |}]

let%expect_test "kill in multiplayer" =
  test ~flags:0 ~shields:10 ~damage:20 ~is_boss:false ~is_multiplayer:true ~obj_id:5 ~killer_objnum:3;
  [%expect {| shields=-10 boss_hit=false tree=Query(5,3, then=Leaf(1, [Send_net_robot_explode(5,3)]), else=Leaf(0, [])) |}]

let%expect_test "kill in multiplayer (boss)" =
  test ~flags:0 ~shields:10 ~damage:20 ~is_boss:true ~is_multiplayer:true ~obj_id:5 ~killer_objnum:3;
  [%expect {| shields=-10 boss_hit=true tree=Query(5,3, then=Leaf(1, [Send_net_robot_explode(5,3)]), else=Leaf(0, [])) |}]

let%expect_test "serialization: simple leaf no effects" =
  test_serialized ~flags:0 ~shields:100 ~damage:30 ~is_boss:false ~is_multiplayer:false ~obj_id:7 ~killer_objnum:0;
  [%expect {| serialized: len=5 vals=[70, 0, 0, 0, 0] |}]

let%expect_test "serialization: kill in SP non-boss" =
  test_serialized ~flags:0 ~shields:10 ~damage:20 ~is_boss:false ~is_multiplayer:false ~obj_id:7 ~killer_objnum:0;
  [%expect {| serialized: len=8 vals=[-10, 0, 0, 1, 2, 0, 2, 7] |}]

let%expect_test "serialization: kill in SP boss" =
  test_serialized ~flags:0 ~shields:10 ~damage:20 ~is_boss:true ~is_multiplayer:false ~obj_id:42 ~killer_objnum:0;
  [%expect {| serialized: len=8 vals=[-10, 1, 0, 1, 2, 0, 1, 42] |}]

let%expect_test "serialization: kill in multiplayer" =
  test_serialized ~flags:0 ~shields:10 ~damage:20 ~is_boss:false ~is_multiplayer:true ~obj_id:5 ~killer_objnum:3;
  (* Query node: [1, obj=5, killer=3, then_len, ...then..., ...else...] *)
  [%expect {| serialized: len=15 vals=[-10, 0, 1, 5, 3, 6, 0, 1, 1, 3, 5, 3, 0, 0, 0] |}]
