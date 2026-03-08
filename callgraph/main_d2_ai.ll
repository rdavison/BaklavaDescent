; ModuleID = '/Users/richard/code/ChocolateDescent/main_d2/ai.cpp'
source_filename = "/Users/richard/code/ChocolateDescent/main_d2/ai.cpp"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

%struct.ai_local = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [10 x %struct.vms_angvec], [10 x %struct.vms_angvec], [10 x i8], [10 x i8] }
%struct.vms_angvec = type { i16, i16, i16 }
%struct.point_seg = type { i32, %struct.vms_vector }
%struct.vms_vector = type { i32, i32, i32 }
%struct.ai_cloak_info = type { i32, i32, %struct.vms_vector }
%struct.fvi_info = type { i32, %struct.vms_vector, i32, i32, i32, i32, %struct.vms_vector, i32, [100 x i32] }
%struct.awareness_event = type { i16, i16, %struct.vms_vector }
%struct.player = type { [9 x i8], [4 x i8], i16, i8, i32, i32, i32, i32, i32, i32, i8, i8, i8, i8, i16, i16, i16, [10 x i16], [10 x i16], i16, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i16, i8, i8, i32, i8, i8 }
%struct.control_info = type { i32, i32, i32, i32, i32, i32, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8 }
%struct.segment = type { [6 x %struct.side], [6 x i16], [8 x i16], i32 }
%struct.side = type { i8, i8, i16, i16, i16, [4 x %struct.uvl], [2 x %struct.vms_vector] }
%struct.uvl = type { i32, i32, i32 }
%struct.object = type { i32, i8, i8, i16, i16, i8, i8, i8, i8, i16, i16, %struct.vms_vector, %struct.vms_matrix, i32, i32, %struct.vms_vector, i8, i8, i8, i8, i32, %union.anon, %union.anon.0, %union.anon.1 }
%struct.vms_matrix = type { %struct.vms_vector, %struct.vms_vector, %struct.vms_vector }
%union.anon = type { %struct.physics_info }
%struct.physics_info = type { %struct.vms_vector, %struct.vms_vector, i32, i32, i32, %struct.vms_vector, %struct.vms_vector, i16, i16 }
%union.anon.0 = type { %struct.ai_static }
%struct.ai_static = type { i8, [11 x i8], i16, i16, i16, i8, i8, i16, i32, i32 }
%union.anon.1 = type { %struct.polyobj_info }
%struct.polyobj_info = type { i32, [10 x %struct.vms_angvec], i32, i32, i32 }
%struct.robot_info = type { i32, [8 x %struct.vms_vector], [8 x i8], i16, i16, i16, i16, i8, i8, i8, i8, i8, i8, i8, i8, i16, i8, i8, i32, i32, i32, i32, [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i8], [5 x i8], i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, [3 x i8], i8, i8, i8, i8, [9 x [5 x %struct.jointlist]], i32 }
%struct.jointlist = type { i16, i16 }
%struct.segment2 = type { i8, i8, i8, i8, i32 }
%struct.FuelCenter = type { i32, i32, i8, i8, i8, i8, i32, i32, i32, i32, %struct.vms_vector }

@Ai_initialized = global i32 0, align 4, !dbg !0
@Overall_agitation = global i32 0, align 4, !dbg !18
@Ai_local_info = global [350 x %struct.ai_local] zeroinitializer, align 4, !dbg !21
@Point_segs = global [2500 x %struct.point_seg] zeroinitializer, align 4, !dbg !69
@Point_segs_free_ptr = global ptr @Point_segs, align 8, !dbg !85
@Ai_cloak_info = global [8 x %struct.ai_cloak_info] zeroinitializer, align 4, !dbg !88
@Boss_cloak_start_time = global i32 0, align 4, !dbg !100
@New_awareness = global [900 x i8] zeroinitializer, align 1, !dbg !102
@Boss_cloak_end_time = global i32 0, align 4, !dbg !107
@Last_teleport_time = global i32 0, align 4, !dbg !109
@Boss_teleport_interval = global i32 524288, align 4, !dbg !111
@Boss_cloak_interval = global i32 655360, align 4, !dbg !113
@Boss_cloak_duration = global i32 458752, align 4, !dbg !115
@Last_gate_time = global i32 0, align 4, !dbg !117
@Gate_interval = global i32 393216, align 4, !dbg !119
@Boss_dying_start_time = global i32 0, align 4, !dbg !121
@Boss_hit_time = global i32 0, align 4, !dbg !123
@Boss_dying = global i8 0, align 1, !dbg !125
@Boss_dying_sound_playing = global i8 0, align 1, !dbg !127
@unused123 = global i8 0, align 1, !dbg !129
@unused234 = global i8 0, align 1, !dbg !131
@Boss_teleports = global [8 x i8] c"\01\01\01\01\01\01\01\01", align 1, !dbg !133
@Boss_spew_more = global [8 x i8] c"\00\01\00\00\00\00\00\00", align 1, !dbg !139
@Boss_spews_bots_energy = global [8 x i8] c"\01\01\00\01\00\01\01\01", align 1, !dbg !141
@Boss_spews_bots_matter = global [8 x i8] c"\00\00\01\01\01\01\00\01", align 1, !dbg !143
@Boss_invulnerable_energy = global [8 x i8] c"\00\00\01\01\00\00\00\00", align 1, !dbg !145
@Boss_invulnerable_matter = global [8 x i8] c"\00\00\00\00\01\01\01\00", align 1, !dbg !147
@Boss_invulnerable_spot = global [8 x i8] c"\00\00\00\00\00\01\00\01", align 1, !dbg !149
@ai_evaded = global i32 0, align 4, !dbg !151
@Robot_firing_enabled = global i32 1, align 4, !dbg !153
@Animation_enabled = global i32 1, align 4, !dbg !155
@Ai_info_enabled = global i32 0, align 4, !dbg !157
@Hit_pos = global %struct.vms_vector zeroinitializer, align 4, !dbg !159
@Hit_type = global i32 0, align 4, !dbg !161
@Hit_seg = global i32 0, align 4, !dbg !163
@Hit_data = global %struct.fvi_info zeroinitializer, align 4, !dbg !165
@Num_awareness_events = global i32 0, align 4, !dbg !183
@Awareness_events = global [64 x %struct.awareness_event] zeroinitializer, align 4, !dbg !185
@Believed_player_pos = global %struct.vms_vector zeroinitializer, align 4, !dbg !196
@Believed_player_seg = global i32 0, align 4, !dbg !198
@.str = private unnamed_addr constant [6 x i8] c"STILL\00", align 1, !dbg !200
@.str.1 = private unnamed_addr constant [7 x i8] c"WANDER\00", align 1, !dbg !207
@.str.2 = private unnamed_addr constant [9 x i8] c"FOL_PATH\00", align 1, !dbg !212
@.str.3 = private unnamed_addr constant [10 x i8] c"CHASE_OBJ\00", align 1, !dbg !217
@.str.4 = private unnamed_addr constant [9 x i8] c"RUN_FROM\00", align 1, !dbg !220
@.str.5 = private unnamed_addr constant [7 x i8] c"BEHIND\00", align 1, !dbg !222
@.str.6 = private unnamed_addr constant [10 x i8] c"FOL_PATH2\00", align 1, !dbg !224
@.str.7 = private unnamed_addr constant [10 x i8] c"OPEN_DOOR\00", align 1, !dbg !226
@.str.8 = private unnamed_addr constant [9 x i8] c"GOTO_PLR\00", align 1, !dbg !228
@.str.9 = private unnamed_addr constant [9 x i8] c"GOTO_OBJ\00", align 1, !dbg !230
@.str.10 = private unnamed_addr constant [7 x i8] c"SN_ATT\00", align 1, !dbg !232
@.str.11 = private unnamed_addr constant [8 x i8] c"SN_FIRE\00", align 1, !dbg !234
@.str.12 = private unnamed_addr constant [8 x i8] c"SN_RETR\00", align 1, !dbg !237
@.str.13 = private unnamed_addr constant [8 x i8] c"SN_RTBK\00", align 1, !dbg !239
@.str.14 = private unnamed_addr constant [8 x i8] c"SN_WAIT\00", align 1, !dbg !241
@.str.15 = private unnamed_addr constant [10 x i8] c"TH_ATTACK\00", align 1, !dbg !243
@.str.16 = private unnamed_addr constant [11 x i8] c"TH_RETREAT\00", align 1, !dbg !245
@.str.17 = private unnamed_addr constant [8 x i8] c"TH_WAIT\00", align 1, !dbg !250
@mode_text = global [18 x ptr] [ptr @.str, ptr @.str.1, ptr @.str.2, ptr @.str.3, ptr @.str.4, ptr @.str.5, ptr @.str.6, ptr @.str.7, ptr @.str.8, ptr @.str.9, ptr @.str.10, ptr @.str.11, ptr @.str.12, ptr @.str.13, ptr @.str.14, ptr @.str.15, ptr @.str.16, ptr @.str.17], align 8, !dbg !252
@behavior_text = constant [6 x [9 x i8]] [[9 x i8] c"STILL   \00", [9 x i8] c"NORMAL  \00", [9 x i8] c"HIDE    \00", [9 x i8] c"RUN_FROM\00", [9 x i8] c"FOLPATH \00", [9 x i8] c"STATION \00"], align 1, !dbg !258
@state_text = constant [8 x [5 x i8]] [[5 x i8] c"NONE\00", [5 x i8] c"REST\00", [5 x i8] c"SRCH\00", [5 x i8] c"LOCK\00", [5 x i8] c"FLIN\00", [5 x i8] c"FIRE\00", [5 x i8] c"RECO\00", [5 x i8] c"ERR_\00"], align 1, !dbg !262
@Ai_transition_table = global [4 x [7 x [7 x i8]]] [[7 x [7 x i8]] [[7 x i8] c"\07\03\03\03\04\05\06", [7 x i8] c"\07\03\03\03\04\05\06", [7 x i8] c"\07\03\03\03\04\05\06", [7 x i8] c"\07\03\03\03\04\05\06", [7 x i8] c"\07\01\03\03\03\05\06", [7 x i8] c"\07\05\05\05\04\05\06", [7 x i8] c"\07\03\03\03\04\05\05"], [7 x [7 x i8]] [[7 x i8] c"\07\03\03\03\04\05\06", [7 x i8] c"\07\03\03\03\04\05\06", [7 x i8] c"\07\03\03\03\04\05\06", [7 x i8] c"\07\03\03\03\04\05\06", [7 x i8] c"\07\03\03\03\03\04\04", [7 x i8] c"\07\01\03\03\03\05\06", [7 x i8] c"\07\03\03\03\04\05\05"], [7 x [7 x i8]] [[7 x i8] c"\07\03\03\03\04\05\06", [7 x i8] c"\07\03\03\03\04\05\06", [7 x i8] c"\07\03\03\03\04\05\06", [7 x i8] c"\07\03\03\03\04\05\06", [7 x i8] c"\07\04\04\04\03\04\04", [7 x i8] c"\07\01\03\03\03\05\06", [7 x i8] c"\07\03\03\03\04\05\05"], [7 x [7 x i8]] [[7 x i8] c"\07\04\04\04\04\04\04", [7 x i8] c"\07\04\04\04\04\04\04", [7 x i8] c"\07\04\04\04\04\04\04", [7 x i8] c"\07\04\04\04\04\04\04", [7 x i8] c"\07\04\04\04\04\04\04", [7 x i8] c"\07\04\04\04\04\04\04", [7 x i8] c"\07\04\04\04\04\04\04"]], align 1, !dbg !267
@Dist_to_last_fired_upon_player_pos = global i32 0, align 4, !dbg !272
@Last_fired_upon_player_pos = external global %struct.vms_vector, align 4
@CurrentLogicVersion = external global i32, align 4
@Players = external global [12 x %struct.player], align 4
@Player_num = external global i32, align 4
@ConsoleObject = external global ptr, align 8
@Afterburner_charge = external global i32, align 4
@Controls = external global %struct.control_info, align 4
@Segments = external global [0 x %struct.segment], align 4
@Objects = external global [0 x %struct.object], align 4
@Robot_info = external global [0 x %struct.robot_info], align 4
@.str.18 = private unnamed_addr constant [38 x i8] c"Making robot #%i go into snipe mode!\0A\00", align 1, !dbg !274
@.str.19 = private unnamed_addr constant [38 x i8] c"Couldn't find a robot to make snipe!\0A\00", align 1, !dbg !279
@Ai_last_missile_camera = global i32 0, align 4, !dbg !281
@Robots_kill_robots_cheat = global i32 0, align 4, !dbg !283
@FrameTime = external global i32, align 4
@.str.20 = private unnamed_addr constant [32 x i8] c"robptr->always_0xabcd == 0xabcd\00", align 1, !dbg !285
@.str.21 = private unnamed_addr constant [52 x i8] c"/Users/richard/code/ChocolateDescent/main_d2/ai.cpp\00", align 1, !dbg !290
@Do_ai_flag = external global i32, align 4
@Break_on_object = external global i32, align 4
@.str.22 = private unnamed_addr constant [18 x i8] c"obj->segnum != -1\00", align 1, !dbg !295
@N_robot_types = external global i32, align 4
@.str.23 = private unnamed_addr constant [24 x i8] c"obj->id < N_robot_types\00", align 1, !dbg !298
@FrameCount = external global i32, align 4
@Highest_object_index = external global i32, align 4
@Game_mode = external global i32, align 4
@Difficulty_level = external global i32, align 4
@Escort_goal_object = external global i32, align 4
@.str.24 = private unnamed_addr constant [34 x i8] c"Hiding robot (%i) collided much.\0A\00", align 1, !dbg !303
@Segment2s = external global [0 x %struct.segment2], align 4
@Station = external global [70 x %struct.FuelCenter], align 4
@Player_is_dead = external global i32, align 4
@.str.25 = private unnamed_addr constant [44 x i8] c"Warning: D1 boss detected.  Not supported!\0A\00", align 1, !dbg !308
@.str.26 = private unnamed_addr constant [2 x i8] c"T\00", align 1, !dbg !313
@GameTime = external global i32, align 4
@__stderrp = external global ptr, align 8
@.str.27 = private unnamed_addr constant [39 x i8] c"CESCORT28 dist=%d vis=%d pat=%d gt=%d\0A\00", align 1, !dbg !318
@.str.28 = private unnamed_addr constant [38 x i8] c"CESCORT28_AFTER pat=%d mode=%d gt=%d\0A\00", align 1, !dbg !323
@Buddy_allowed_to_talk = external global i32, align 4
@Stolen_item_index = external global i32, align 4
@.str.29 = private unnamed_addr constant [23 x i8] c"obj->id == ROBOT_BRAIN\00", align 1, !dbg !325
@.str.30 = private unnamed_addr constant [46 x i8] c"Unknown mode = %i in robot %i, behavior = %i\0A\00", align 1, !dbg !330
@.str.31 = private unnamed_addr constant [39 x i8] c"ailp->player_awareness_type <= AIE_MAX\00", align 1, !dbg !335
@.str.32 = private unnamed_addr constant [29 x i8] c"aip->CURRENT_STATE < AIS_MAX\00", align 1, !dbg !337
@.str.33 = private unnamed_addr constant [26 x i8] c"aip->GOAL_STATE < AIS_MAX\00", align 1, !dbg !342
@.str.34 = private unnamed_addr constant [32 x i8] c"Unknown mode for AI object #%i\0A\00", align 1, !dbg !347
@Highest_segment_index = external global i32, align 4
@Ai_dump_enable = global i32 0, align 4, !dbg !349
@Ai_dump_file = global ptr null, align 8, !dbg !351
@Ai_error_message = global [128 x i8] zeroinitializer, align 1, !dbg !410
@.str.35 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1, !dbg !415
@Final_boss_is_dead = external global i32, align 4
@Buddy_objnum = external global i32, align 4
@Boss_invulnerable_dot = external global i32, align 4
@Escort_kill_object = external global i32, align 4
@Escort_last_path_created = external global i32, align 4
@Escort_special_goal = external global i32, align 4
@Escort_goal_index = external global i32, align 4
@Stolen_items = external global [10 x i8], align 1
@Num_boss_teleport_segs = external global i32, align 4
@Num_boss_gate_segs = external global i32, align 4
@Boss_gate_segs = external global [0 x i16], align 2
@Boss_teleport_segs = external global [100 x i16], align 2
@.str.36 = private unnamed_addr constant [52 x i8] c"ai_restore_state: Too many boss teleport segments.\0A\00", align 1, !dbg !419
@.str.37 = private unnamed_addr constant [49 x i8] c"ai_restore_state: Too many boss gate segemnets.\0A\00", align 1, !dbg !421
@.str.38 = private unnamed_addr constant [66 x i8] c"Warning: If you fight the boss, he might teleport to segment #0!\0A\00", align 1, !dbg !426

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z13init_ai_framev() #0 !dbg !1669 {
  %1 = alloca i32, align 4
  %2 = call noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef @Last_fired_upon_player_pos, ptr noundef @Believed_player_pos), !dbg !1671
  store i32 %2, ptr @Dist_to_last_fired_upon_player_pos, align 4, !dbg !1672
  %3 = load i32, ptr @CurrentLogicVersion, align 4, !dbg !1673
  %4 = icmp eq i32 %3, 0, !dbg !1675
  br i1 %4, label %5, label %21, !dbg !1675

5:                                                ; preds = %0
  %6 = load i32, ptr @Player_num, align 4, !dbg !1676
  %7 = sext i32 %6 to i64, !dbg !1679
  %8 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %7, !dbg !1679
  %9 = getelementptr inbounds nuw %struct.player, ptr %8, i32 0, i32 7, !dbg !1680
  %10 = load i32, ptr %9, align 4, !dbg !1680
  %11 = and i32 %10, 2048, !dbg !1681
  %12 = icmp ne i32 %11, 0, !dbg !1679
  br i1 %12, label %13, label %20, !dbg !1679

13:                                               ; preds = %5
  %14 = load ptr, ptr @ConsoleObject, align 8, !dbg !1682
  %15 = getelementptr inbounds nuw %struct.object, ptr %14, i32 0, i32 9, !dbg !1684
  %16 = load i16, ptr %15, align 2, !dbg !1684
  %17 = sext i16 %16 to i32, !dbg !1682
  store i32 %17, ptr @Believed_player_seg, align 4, !dbg !1685
  %18 = load ptr, ptr @ConsoleObject, align 8, !dbg !1686
  %19 = getelementptr inbounds nuw %struct.object, ptr %18, i32 0, i32 11, !dbg !1687
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 @Believed_player_pos, ptr align 4 %19, i64 12, i1 false), !dbg !1688
  br label %20, !dbg !1689

20:                                               ; preds = %13, %5
  br label %58, !dbg !1690

21:                                               ; preds = %0
    #dbg_declare(ptr %1, !1691, !DIExpression(), !1693)
  %22 = load i32, ptr @Afterburner_charge, align 4, !dbg !1694
  %23 = icmp ne i32 %22, 0, !dbg !1694
  br i1 %23, label %24, label %35, !dbg !1695

24:                                               ; preds = %21
  %25 = load i8, ptr getelementptr inbounds nuw (%struct.control_info, ptr @Controls, i32 0, i32 16), align 2, !dbg !1696
  %26 = icmp ne i8 %25, 0, !dbg !1697
  br i1 %26, label %27, label %35, !dbg !1698

27:                                               ; preds = %24
  %28 = load i32, ptr @Player_num, align 4, !dbg !1699
  %29 = sext i32 %28 to i64, !dbg !1700
  %30 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %29, !dbg !1700
  %31 = getelementptr inbounds nuw %struct.player, ptr %30, i32 0, i32 7, !dbg !1701
  %32 = load i32, ptr %31, align 4, !dbg !1701
  %33 = and i32 %32, 4096, !dbg !1702
  %34 = icmp ne i32 %33, 0, !dbg !1703
  br label %35

35:                                               ; preds = %27, %24, %21
  %36 = phi i1 [ false, %24 ], [ false, %21 ], [ %34, %27 ], !dbg !1704
  %37 = zext i1 %36 to i32, !dbg !1694
  store i32 %37, ptr %1, align 4, !dbg !1693
  %38 = load i32, ptr @Player_num, align 4, !dbg !1705
  %39 = sext i32 %38 to i64, !dbg !1707
  %40 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %39, !dbg !1707
  %41 = getelementptr inbounds nuw %struct.player, ptr %40, i32 0, i32 7, !dbg !1708
  %42 = load i32, ptr %41, align 4, !dbg !1708
  %43 = and i32 %42, 2048, !dbg !1709
  %44 = icmp ne i32 %43, 0, !dbg !1710
  br i1 %44, label %45, label %56, !dbg !1711

45:                                               ; preds = %35
  %46 = load i32, ptr @Player_num, align 4, !dbg !1712
  %47 = sext i32 %46 to i64, !dbg !1713
  %48 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %47, !dbg !1713
  %49 = getelementptr inbounds nuw %struct.player, ptr %48, i32 0, i32 7, !dbg !1714
  %50 = load i32, ptr %49, align 4, !dbg !1714
  %51 = and i32 %50, 16384, !dbg !1715
  %52 = icmp ne i32 %51, 0, !dbg !1716
  br i1 %52, label %56, label %53, !dbg !1717

53:                                               ; preds = %45
  %54 = load i32, ptr %1, align 4, !dbg !1718
  %55 = icmp ne i32 %54, 0, !dbg !1718
  br i1 %55, label %56, label %57, !dbg !1717

56:                                               ; preds = %53, %45, %35
  call void @_Z17ai_do_cloak_stuffv(), !dbg !1719
  br label %57, !dbg !1721

57:                                               ; preds = %56, %53
  br label %58

58:                                               ; preds = %57, %20
  ret void, !dbg !1722
}

declare noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef, ptr noundef) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define void @_Z17ai_do_cloak_stuffv() #3 !dbg !1723 {
  %1 = alloca i32, align 4
    #dbg_declare(ptr %1, !1724, !DIExpression(), !1725)
  store i32 0, ptr %1, align 4, !dbg !1726
  br label %2, !dbg !1728

2:                                                ; preds = %25, %0
  %3 = load i32, ptr %1, align 4, !dbg !1729
  %4 = icmp slt i32 %3, 8, !dbg !1731
  br i1 %4, label %5, label %28, !dbg !1732

5:                                                ; preds = %2
  %6 = load ptr, ptr @ConsoleObject, align 8, !dbg !1733
  %7 = getelementptr inbounds nuw %struct.object, ptr %6, i32 0, i32 11, !dbg !1735
  %8 = load i32, ptr %1, align 4, !dbg !1736
  %9 = sext i32 %8 to i64, !dbg !1737
  %10 = getelementptr inbounds [8 x %struct.ai_cloak_info], ptr @Ai_cloak_info, i64 0, i64 %9, !dbg !1737
  %11 = getelementptr inbounds nuw %struct.ai_cloak_info, ptr %10, i32 0, i32 2, !dbg !1738
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %11, ptr align 4 %7, i64 12, i1 false), !dbg !1739
  %12 = load ptr, ptr @ConsoleObject, align 8, !dbg !1740
  %13 = getelementptr inbounds nuw %struct.object, ptr %12, i32 0, i32 9, !dbg !1741
  %14 = load i16, ptr %13, align 2, !dbg !1741
  %15 = sext i16 %14 to i32, !dbg !1740
  %16 = load i32, ptr %1, align 4, !dbg !1742
  %17 = sext i32 %16 to i64, !dbg !1743
  %18 = getelementptr inbounds [8 x %struct.ai_cloak_info], ptr @Ai_cloak_info, i64 0, i64 %17, !dbg !1743
  %19 = getelementptr inbounds nuw %struct.ai_cloak_info, ptr %18, i32 0, i32 1, !dbg !1744
  store i32 %15, ptr %19, align 4, !dbg !1745
  %20 = load i32, ptr @GameTime, align 4, !dbg !1746
  %21 = load i32, ptr %1, align 4, !dbg !1747
  %22 = sext i32 %21 to i64, !dbg !1748
  %23 = getelementptr inbounds [8 x %struct.ai_cloak_info], ptr @Ai_cloak_info, i64 0, i64 %22, !dbg !1748
  %24 = getelementptr inbounds nuw %struct.ai_cloak_info, ptr %23, i32 0, i32 0, !dbg !1749
  store i32 %20, ptr %24, align 4, !dbg !1750
  br label %25, !dbg !1751

25:                                               ; preds = %5
  %26 = load i32, ptr %1, align 4, !dbg !1752
  %27 = add nsw i32 %26, 1, !dbg !1752
  store i32 %27, ptr %1, align 4, !dbg !1752
  br label %2, !dbg !1753, !llvm.loop !1754

28:                                               ; preds = %2
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 @Believed_player_pos, ptr align 4 getelementptr inbounds nuw (%struct.ai_cloak_info, ptr @Ai_cloak_info, i32 0, i32 2), i64 12, i1 false), !dbg !1757
  %29 = load i32, ptr getelementptr inbounds nuw (%struct.ai_cloak_info, ptr @Ai_cloak_info, i32 0, i32 1), align 4, !dbg !1758
  store i32 %29, ptr @Believed_player_seg, align 4, !dbg !1759
  ret void, !dbg !1760
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define noundef i32 @_Z13ready_to_fireP10robot_infoP8ai_local(ptr noundef %0, ptr noundef %1) #3 !dbg !1761 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !1834, !DIExpression(), !1835)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !1836, !DIExpression(), !1837)
  %6 = load ptr, ptr %4, align 8, !dbg !1838
  %7 = getelementptr inbounds nuw %struct.robot_info, ptr %6, i32 0, i32 8, !dbg !1840
  %8 = load i8, ptr %7, align 1, !dbg !1840
  %9 = sext i8 %8 to i32, !dbg !1838
  %10 = icmp ne i32 %9, -1, !dbg !1841
  br i1 %10, label %11, label %24, !dbg !1841

11:                                               ; preds = %2
  %12 = load ptr, ptr %5, align 8, !dbg !1842
  %13 = getelementptr inbounds nuw %struct.ai_local, ptr %12, i32 0, i32 8, !dbg !1843
  %14 = load i32, ptr %13, align 4, !dbg !1843
  %15 = icmp sle i32 %14, 0, !dbg !1844
  br i1 %15, label %21, label %16, !dbg !1845

16:                                               ; preds = %11
  %17 = load ptr, ptr %5, align 8, !dbg !1846
  %18 = getelementptr inbounds nuw %struct.ai_local, ptr %17, i32 0, i32 9, !dbg !1847
  %19 = load i32, ptr %18, align 4, !dbg !1847
  %20 = icmp sle i32 %19, 0, !dbg !1848
  br label %21, !dbg !1845

21:                                               ; preds = %16, %11
  %22 = phi i1 [ true, %11 ], [ %20, %16 ]
  %23 = zext i1 %22 to i32, !dbg !1849
  store i32 %23, ptr %3, align 4, !dbg !1850
  br label %30, !dbg !1850

24:                                               ; preds = %2
  %25 = load ptr, ptr %5, align 8, !dbg !1851
  %26 = getelementptr inbounds nuw %struct.ai_local, ptr %25, i32 0, i32 8, !dbg !1852
  %27 = load i32, ptr %26, align 4, !dbg !1852
  %28 = icmp sle i32 %27, 0, !dbg !1853
  %29 = zext i1 %28 to i32, !dbg !1854
  store i32 %29, ptr %3, align 4, !dbg !1855
  br label %30, !dbg !1855

30:                                               ; preds = %24, %21
  %31 = load i32, ptr %3, align 4, !dbg !1856
  ret i32 %31, !dbg !1856
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z23make_nearby_robot_snipev() #0 !dbg !1857 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca [70 x i16], align 2
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
    #dbg_declare(ptr %1, !1858, !DIExpression(), !1859)
    #dbg_declare(ptr %2, !1860, !DIExpression(), !1861)
    #dbg_declare(ptr %3, !1862, !DIExpression(), !1866)
  %7 = load ptr, ptr @ConsoleObject, align 8, !dbg !1867
  %8 = getelementptr inbounds nuw %struct.object, ptr %7, i32 0, i32 9, !dbg !1868
  %9 = load i16, ptr %8, align 2, !dbg !1868
  %10 = sext i16 %9 to i32, !dbg !1867
  %11 = getelementptr inbounds [70 x i16], ptr %3, i64 0, i64 0, !dbg !1869
  call void @_Z15create_bfs_listiPsPii(i32 noundef %10, ptr noundef %11, ptr noundef %1, i32 noundef 70), !dbg !1870
  store i32 0, ptr %2, align 4, !dbg !1871
  br label %12, !dbg !1873

12:                                               ; preds = %92, %0
  %13 = load i32, ptr %2, align 4, !dbg !1874
  %14 = load i32, ptr %1, align 4, !dbg !1876
  %15 = icmp slt i32 %13, %14, !dbg !1877
  br i1 %15, label %16, label %95, !dbg !1878

16:                                               ; preds = %12
    #dbg_declare(ptr %4, !1879, !DIExpression(), !1881)
  %17 = load i32, ptr %2, align 4, !dbg !1882
  %18 = sext i32 %17 to i64, !dbg !1883
  %19 = getelementptr inbounds [70 x i16], ptr %3, i64 0, i64 %18, !dbg !1883
  %20 = load i16, ptr %19, align 2, !dbg !1883
  %21 = sext i16 %20 to i64, !dbg !1884
  %22 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %21, !dbg !1884
  %23 = getelementptr inbounds nuw %struct.segment, ptr %22, i32 0, i32 3, !dbg !1885
  %24 = load i32, ptr %23, align 4, !dbg !1885
  store i32 %24, ptr %4, align 4, !dbg !1881
  br label %25, !dbg !1886

25:                                               ; preds = %86, %16
  %26 = load i32, ptr %4, align 4, !dbg !1887
  %27 = icmp ne i32 %26, -1, !dbg !1888
  br i1 %27, label %28, label %91, !dbg !1886

28:                                               ; preds = %25
    #dbg_declare(ptr %5, !1889, !DIExpression(), !2010)
  %29 = load i32, ptr %4, align 4, !dbg !2011
  %30 = sext i32 %29 to i64, !dbg !2012
  %31 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %30, !dbg !2012
  store ptr %31, ptr %5, align 8, !dbg !2010
    #dbg_declare(ptr %6, !2013, !DIExpression(), !2014)
  %32 = load ptr, ptr %5, align 8, !dbg !2015
  %33 = getelementptr inbounds nuw %struct.object, ptr %32, i32 0, i32 2, !dbg !2016
  %34 = load i8, ptr %33, align 1, !dbg !2016
  %35 = zext i8 %34 to i64, !dbg !2017
  %36 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %35, !dbg !2017
  store ptr %36, ptr %6, align 8, !dbg !2014
  %37 = load ptr, ptr %5, align 8, !dbg !2018
  %38 = getelementptr inbounds nuw %struct.object, ptr %37, i32 0, i32 1, !dbg !2020
  %39 = load i8, ptr %38, align 4, !dbg !2020
  %40 = zext i8 %39 to i32, !dbg !2018
  %41 = icmp eq i32 %40, 2, !dbg !2021
  br i1 %41, label %42, label %86, !dbg !2022

42:                                               ; preds = %28
  %43 = load ptr, ptr %5, align 8, !dbg !2023
  %44 = getelementptr inbounds nuw %struct.object, ptr %43, i32 0, i32 2, !dbg !2024
  %45 = load i8, ptr %44, align 1, !dbg !2024
  %46 = zext i8 %45 to i32, !dbg !2023
  %47 = icmp ne i32 %46, 7, !dbg !2025
  br i1 %47, label %48, label %86, !dbg !2022

48:                                               ; preds = %42
  %49 = load ptr, ptr %5, align 8, !dbg !2026
  %50 = getelementptr inbounds nuw %struct.object, ptr %49, i32 0, i32 22, !dbg !2029
  %51 = getelementptr inbounds nuw %struct.ai_static, ptr %50, i32 0, i32 0, !dbg !2030
  %52 = load i8, ptr %51, align 4, !dbg !2030
  %53 = zext i8 %52 to i32, !dbg !2026
  %54 = icmp ne i32 %53, 132, !dbg !2031
  br i1 %54, label %55, label %85, !dbg !2032

55:                                               ; preds = %48
  %56 = load ptr, ptr %5, align 8, !dbg !2033
  %57 = getelementptr inbounds nuw %struct.object, ptr %56, i32 0, i32 22, !dbg !2034
  %58 = getelementptr inbounds nuw %struct.ai_static, ptr %57, i32 0, i32 0, !dbg !2035
  %59 = load i8, ptr %58, align 4, !dbg !2035
  %60 = zext i8 %59 to i32, !dbg !2033
  %61 = icmp ne i32 %60, 131, !dbg !2036
  br i1 %61, label %62, label %85, !dbg !2037

62:                                               ; preds = %55
  %63 = load ptr, ptr %5, align 8, !dbg !2038
  %64 = getelementptr inbounds nuw %struct.object, ptr %63, i32 0, i32 2, !dbg !2039
  %65 = load i8, ptr %64, align 1, !dbg !2039
  %66 = zext i8 %65 to i64, !dbg !2040
  %67 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %66, !dbg !2040
  %68 = getelementptr inbounds nuw %struct.robot_info, ptr %67, i32 0, i32 36, !dbg !2041
  %69 = load i8, ptr %68, align 4, !dbg !2041
  %70 = icmp ne i8 %69, 0, !dbg !2040
  br i1 %70, label %85, label %71, !dbg !2042

71:                                               ; preds = %62
  %72 = load ptr, ptr %6, align 8, !dbg !2043
  %73 = getelementptr inbounds nuw %struct.robot_info, ptr %72, i32 0, i32 37, !dbg !2044
  %74 = load i8, ptr %73, align 1, !dbg !2044
  %75 = icmp ne i8 %74, 0, !dbg !2043
  br i1 %75, label %85, label %76, !dbg !2042

76:                                               ; preds = %71
  %77 = load ptr, ptr %5, align 8, !dbg !2045
  %78 = getelementptr inbounds nuw %struct.object, ptr %77, i32 0, i32 22, !dbg !2047
  %79 = getelementptr inbounds nuw %struct.ai_static, ptr %78, i32 0, i32 0, !dbg !2048
  store i8 -124, ptr %79, align 4, !dbg !2049
  %80 = load i32, ptr %4, align 4, !dbg !2050
  %81 = sext i32 %80 to i64, !dbg !2051
  %82 = getelementptr inbounds [350 x %struct.ai_local], ptr @Ai_local_info, i64 0, i64 %81, !dbg !2051
  %83 = getelementptr inbounds nuw %struct.ai_local, ptr %82, i32 0, i32 3, !dbg !2052
  store i32 10, ptr %83, align 4, !dbg !2053
  %84 = load i32, ptr %4, align 4, !dbg !2054
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.18, i32 noundef %84), !dbg !2054
  br label %96, !dbg !2055

85:                                               ; preds = %71, %62, %55, %48
  br label %86, !dbg !2056

86:                                               ; preds = %85, %42, %28
  %87 = load ptr, ptr %5, align 8, !dbg !2057
  %88 = getelementptr inbounds nuw %struct.object, ptr %87, i32 0, i32 3, !dbg !2058
  %89 = load i16, ptr %88, align 2, !dbg !2058
  %90 = sext i16 %89 to i32, !dbg !2057
  store i32 %90, ptr %4, align 4, !dbg !2059
  br label %25, !dbg !1886, !llvm.loop !2060

91:                                               ; preds = %25
  br label %92, !dbg !2062

92:                                               ; preds = %91
  %93 = load i32, ptr %2, align 4, !dbg !2063
  %94 = add nsw i32 %93, 1, !dbg !2063
  store i32 %94, ptr %2, align 4, !dbg !2063
  br label %12, !dbg !2064, !llvm.loop !2065

95:                                               ; preds = %12
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.19), !dbg !2067
  br label %96, !dbg !2068

96:                                               ; preds = %95, %76
  ret void, !dbg !2068
}

declare void @_Z15create_bfs_listiPsPii(i32 noundef, ptr noundef, ptr noundef, i32 noundef) #1

declare void @_Z8_mprintfiPKcz(i32 noundef, ptr noundef, ...) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z11do_ai_frameP6object(ptr noundef %0) #0 !dbg !2069 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.vms_vector, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca %struct.vms_vector, align 4
  %17 = alloca %struct.vms_vector, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca ptr, align 8
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca i32, align 4
  %32 = alloca %struct.vms_vector, align 4
  %33 = alloca %struct.vms_vector, align 4
  %34 = alloca i32, align 4
  %35 = alloca %struct.vms_vector, align 4
  %36 = alloca %struct.vms_vector, align 4
  %37 = alloca %struct.vms_vector, align 4
  %38 = alloca %struct.vms_vector, align 4
  %39 = alloca i32, align 4
  %40 = alloca i32, align 4
  %41 = alloca %struct.vms_vector, align 4
  %42 = alloca %struct.vms_vector, align 4
  %43 = alloca i32, align 4
  %44 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2072, !DIExpression(), !2073)
    #dbg_declare(ptr %3, !2074, !DIExpression(), !2075)
  %45 = load ptr, ptr %2, align 8, !dbg !2076
  %46 = ptrtoint ptr %45 to i64, !dbg !2077
  %47 = sub i64 %46, ptrtoint (ptr @Objects to i64), !dbg !2077
  %48 = sdiv exact i64 %47, 268, !dbg !2077
  %49 = trunc i64 %48 to i32, !dbg !2076
  store i32 %49, ptr %3, align 4, !dbg !2075
    #dbg_declare(ptr %4, !2078, !DIExpression(), !2080)
  %50 = load ptr, ptr %2, align 8, !dbg !2081
  %51 = getelementptr inbounds nuw %struct.object, ptr %50, i32 0, i32 22, !dbg !2082
  store ptr %51, ptr %4, align 8, !dbg !2080
    #dbg_declare(ptr %5, !2083, !DIExpression(), !2084)
  %52 = load i32, ptr %3, align 4, !dbg !2085
  %53 = sext i32 %52 to i64, !dbg !2086
  %54 = getelementptr inbounds [350 x %struct.ai_local], ptr @Ai_local_info, i64 0, i64 %53, !dbg !2086
  store ptr %54, ptr %5, align 8, !dbg !2084
    #dbg_declare(ptr %6, !2087, !DIExpression(), !2088)
    #dbg_declare(ptr %7, !2089, !DIExpression(), !2090)
    #dbg_declare(ptr %8, !2091, !DIExpression(), !2092)
    #dbg_declare(ptr %9, !2093, !DIExpression(), !2094)
    #dbg_declare(ptr %10, !2095, !DIExpression(), !2096)
  store i32 -1, ptr %10, align 4, !dbg !2096
    #dbg_declare(ptr %11, !2097, !DIExpression(), !2098)
    #dbg_declare(ptr %12, !2099, !DIExpression(), !2100)
    #dbg_declare(ptr %13, !2101, !DIExpression(), !2102)
    #dbg_declare(ptr %14, !2103, !DIExpression(), !2104)
  store i32 0, ptr %14, align 4, !dbg !2104
    #dbg_declare(ptr %15, !2105, !DIExpression(), !2106)
    #dbg_declare(ptr %16, !2107, !DIExpression(), !2108)
    #dbg_declare(ptr %17, !2109, !DIExpression(), !2110)
  %55 = load i32, ptr @FrameTime, align 4, !dbg !2111
  %56 = load ptr, ptr %5, align 8, !dbg !2112
  %57 = getelementptr inbounds nuw %struct.ai_local, ptr %56, i32 0, i32 7, !dbg !2113
  %58 = load i32, ptr %57, align 4, !dbg !2114
  %59 = sub nsw i32 %58, %55, !dbg !2114
  store i32 %59, ptr %57, align 4, !dbg !2114
  %60 = load ptr, ptr %4, align 8, !dbg !2115
  %61 = getelementptr inbounds nuw %struct.ai_static, ptr %60, i32 0, i32 1, !dbg !2117
  %62 = getelementptr inbounds [11 x i8], ptr %61, i64 0, i64 7, !dbg !2115
  %63 = load i8, ptr %62, align 1, !dbg !2115
  %64 = icmp ne i8 %63, 0, !dbg !2115
  br i1 %64, label %65, label %127, !dbg !2115

65:                                               ; preds = %1
  %66 = load ptr, ptr %4, align 8, !dbg !2118
  %67 = getelementptr inbounds nuw %struct.ai_static, ptr %66, i32 0, i32 1, !dbg !2120
  %68 = getelementptr inbounds [11 x i8], ptr %67, i64 0, i64 7, !dbg !2118
  %69 = load i8, ptr %68, align 1, !dbg !2121
  %70 = add i8 %69, -1, !dbg !2121
  store i8 %70, ptr %68, align 1, !dbg !2121
  %71 = load ptr, ptr %2, align 8, !dbg !2122
  %72 = getelementptr inbounds nuw %struct.object, ptr %71, i32 0, i32 21, !dbg !2124
  %73 = getelementptr inbounds nuw %struct.physics_info, ptr %72, i32 0, i32 8, !dbg !2125
  %74 = load i16, ptr %73, align 2, !dbg !2125
  %75 = zext i16 %74 to i32, !dbg !2122
  %76 = and i32 %75, 64, !dbg !2126
  %77 = icmp ne i32 %76, 0, !dbg !2122
  br i1 %77, label %78, label %126, !dbg !2122

78:                                               ; preds = %65
  %79 = load ptr, ptr %2, align 8, !dbg !2127
  %80 = getelementptr inbounds nuw %struct.object, ptr %79, i32 0, i32 21, !dbg !2129
  %81 = getelementptr inbounds nuw %struct.physics_info, ptr %80, i32 0, i32 6, !dbg !2130
  %82 = getelementptr inbounds nuw %struct.vms_vector, ptr %81, i32 0, i32 0, !dbg !2131
  %83 = load i32, ptr %82, align 4, !dbg !2131
  %84 = mul nsw i32 %83, 15, !dbg !2132
  %85 = sdiv i32 %84, 16, !dbg !2133
  %86 = load ptr, ptr %2, align 8, !dbg !2134
  %87 = getelementptr inbounds nuw %struct.object, ptr %86, i32 0, i32 21, !dbg !2135
  %88 = getelementptr inbounds nuw %struct.physics_info, ptr %87, i32 0, i32 6, !dbg !2136
  %89 = getelementptr inbounds nuw %struct.vms_vector, ptr %88, i32 0, i32 0, !dbg !2137
  store i32 %85, ptr %89, align 4, !dbg !2138
  %90 = load ptr, ptr %2, align 8, !dbg !2139
  %91 = getelementptr inbounds nuw %struct.object, ptr %90, i32 0, i32 21, !dbg !2140
  %92 = getelementptr inbounds nuw %struct.physics_info, ptr %91, i32 0, i32 6, !dbg !2141
  %93 = getelementptr inbounds nuw %struct.vms_vector, ptr %92, i32 0, i32 1, !dbg !2142
  %94 = load i32, ptr %93, align 4, !dbg !2142
  %95 = mul nsw i32 %94, 15, !dbg !2143
  %96 = sdiv i32 %95, 16, !dbg !2144
  %97 = load ptr, ptr %2, align 8, !dbg !2145
  %98 = getelementptr inbounds nuw %struct.object, ptr %97, i32 0, i32 21, !dbg !2146
  %99 = getelementptr inbounds nuw %struct.physics_info, ptr %98, i32 0, i32 6, !dbg !2147
  %100 = getelementptr inbounds nuw %struct.vms_vector, ptr %99, i32 0, i32 1, !dbg !2148
  store i32 %96, ptr %100, align 4, !dbg !2149
  %101 = load ptr, ptr %2, align 8, !dbg !2150
  %102 = getelementptr inbounds nuw %struct.object, ptr %101, i32 0, i32 21, !dbg !2151
  %103 = getelementptr inbounds nuw %struct.physics_info, ptr %102, i32 0, i32 6, !dbg !2152
  %104 = getelementptr inbounds nuw %struct.vms_vector, ptr %103, i32 0, i32 2, !dbg !2153
  %105 = load i32, ptr %104, align 4, !dbg !2153
  %106 = mul nsw i32 %105, 15, !dbg !2154
  %107 = sdiv i32 %106, 16, !dbg !2155
  %108 = load ptr, ptr %2, align 8, !dbg !2156
  %109 = getelementptr inbounds nuw %struct.object, ptr %108, i32 0, i32 21, !dbg !2157
  %110 = getelementptr inbounds nuw %struct.physics_info, ptr %109, i32 0, i32 6, !dbg !2158
  %111 = getelementptr inbounds nuw %struct.vms_vector, ptr %110, i32 0, i32 2, !dbg !2159
  store i32 %107, ptr %111, align 4, !dbg !2160
  %112 = load ptr, ptr %4, align 8, !dbg !2161
  %113 = getelementptr inbounds nuw %struct.ai_static, ptr %112, i32 0, i32 1, !dbg !2163
  %114 = getelementptr inbounds [11 x i8], ptr %113, i64 0, i64 7, !dbg !2161
  %115 = load i8, ptr %114, align 1, !dbg !2161
  %116 = icmp ne i8 %115, 0, !dbg !2161
  br i1 %116, label %125, label %117, !dbg !2164

117:                                              ; preds = %78
  %118 = load ptr, ptr %2, align 8, !dbg !2165
  %119 = getelementptr inbounds nuw %struct.object, ptr %118, i32 0, i32 21, !dbg !2166
  %120 = getelementptr inbounds nuw %struct.physics_info, ptr %119, i32 0, i32 8, !dbg !2167
  %121 = load i16, ptr %120, align 2, !dbg !2168
  %122 = zext i16 %121 to i32, !dbg !2168
  %123 = and i32 %122, -65, !dbg !2168
  %124 = trunc i32 %123 to i16, !dbg !2168
  store i16 %124, ptr %120, align 2, !dbg !2168
  br label %125, !dbg !2165

125:                                              ; preds = %117, %78
  br label %126, !dbg !2169

126:                                              ; preds = %125, %65
  br label %2900, !dbg !2170

127:                                              ; preds = %1
  %128 = load ptr, ptr %2, align 8, !dbg !2171
  %129 = getelementptr inbounds nuw %struct.object, ptr %128, i32 0, i32 2, !dbg !2172
  %130 = load i8, ptr %129, align 1, !dbg !2172
  %131 = zext i8 %130 to i64, !dbg !2173
  %132 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %131, !dbg !2173
  store ptr %132, ptr %9, align 8, !dbg !2174
  %133 = load ptr, ptr %9, align 8, !dbg !2175
  %134 = getelementptr inbounds nuw %struct.robot_info, ptr %133, i32 0, i32 51, !dbg !2175
  %135 = load i32, ptr %134, align 4, !dbg !2175
  %136 = icmp eq i32 %135, 43981, !dbg !2175
  %137 = zext i1 %136 to i32, !dbg !2175
  call void @_Z7_AssertiPKcS0_i(i32 noundef %137, ptr noundef @.str.20, ptr noundef @.str.21, i32 noundef 916), !dbg !2175
  %138 = load ptr, ptr %2, align 8, !dbg !2176
  %139 = call noundef i32 @_Z24do_any_robot_dying_frameP6object(ptr noundef %138), !dbg !2178
  %140 = icmp ne i32 %139, 0, !dbg !2178
  br i1 %140, label %141, label %142, !dbg !2178

141:                                              ; preds = %127
  br label %2900, !dbg !2179

142:                                              ; preds = %127
  %143 = load ptr, ptr %4, align 8, !dbg !2180
  %144 = getelementptr inbounds nuw %struct.ai_static, ptr %143, i32 0, i32 1, !dbg !2182
  %145 = getelementptr inbounds [11 x i8], ptr %144, i64 0, i64 2, !dbg !2180
  %146 = load i8, ptr %145, align 1, !dbg !2180
  %147 = sext i8 %146 to i32, !dbg !2180
  %148 = icmp eq i32 %147, 4, !dbg !2183
  br i1 %148, label %149, label %158, !dbg !2184

149:                                              ; preds = %142
  %150 = load ptr, ptr %9, align 8, !dbg !2185
  %151 = load ptr, ptr %5, align 8, !dbg !2186
  %152 = call noundef i32 @_Z13ready_to_fireP10robot_infoP8ai_local(ptr noundef %150, ptr noundef %151), !dbg !2187
  %153 = icmp ne i32 %152, 0, !dbg !2187
  br i1 %153, label %154, label %158, !dbg !2184

154:                                              ; preds = %149
  %155 = load ptr, ptr %4, align 8, !dbg !2188
  %156 = getelementptr inbounds nuw %struct.ai_static, ptr %155, i32 0, i32 1, !dbg !2190
  %157 = getelementptr inbounds [11 x i8], ptr %156, i64 0, i64 2, !dbg !2188
  store i8 5, ptr %157, align 1, !dbg !2191
  br label %158, !dbg !2192

158:                                              ; preds = %154, %149, %142
  %159 = load ptr, ptr %4, align 8, !dbg !2193
  %160 = getelementptr inbounds nuw %struct.ai_static, ptr %159, i32 0, i32 0, !dbg !2195
  %161 = load i8, ptr %160, align 4, !dbg !2195
  %162 = zext i8 %161 to i32, !dbg !2193
  %163 = icmp eq i32 %162, 131, !dbg !2196
  br i1 %163, label %164, label %170, !dbg !2197

164:                                              ; preds = %158
  %165 = load ptr, ptr %5, align 8, !dbg !2198
  %166 = getelementptr inbounds nuw %struct.ai_local, ptr %165, i32 0, i32 3, !dbg !2199
  %167 = load i32, ptr %166, align 4, !dbg !2199
  %168 = icmp ne i32 %167, 4, !dbg !2200
  br i1 %168, label %169, label %170, !dbg !2197

169:                                              ; preds = %164
  call void @_Z4Int3v(), !dbg !2201
  br label %170, !dbg !2201

170:                                              ; preds = %169, %164, %158
  %171 = load ptr, ptr %2, align 8, !dbg !2202
  call void @_Z22mprintf_animation_infoP6object(ptr noundef %171), !dbg !2203
  %172 = load i32, ptr @Do_ai_flag, align 4, !dbg !2204
  %173 = icmp ne i32 %172, 0, !dbg !2204
  br i1 %173, label %175, label %174, !dbg !2206

174:                                              ; preds = %170
  br label %2900, !dbg !2207

175:                                              ; preds = %170
  %176 = load i32, ptr @Break_on_object, align 4, !dbg !2208
  %177 = icmp ne i32 %176, -1, !dbg !2210
  br i1 %177, label %178, label %188, !dbg !2210

178:                                              ; preds = %175
  %179 = load ptr, ptr %2, align 8, !dbg !2211
  %180 = ptrtoint ptr %179 to i64, !dbg !2213
  %181 = sub i64 %180, ptrtoint (ptr @Objects to i64), !dbg !2213
  %182 = sdiv exact i64 %181, 268, !dbg !2213
  %183 = load i32, ptr @Break_on_object, align 4, !dbg !2214
  %184 = sext i32 %183 to i64, !dbg !2214
  %185 = icmp eq i64 %182, %184, !dbg !2215
  br i1 %185, label %186, label %187, !dbg !2215

186:                                              ; preds = %178
  call void @_Z4Int3v(), !dbg !2216
  br label %187, !dbg !2216

187:                                              ; preds = %186, %178
  br label %188, !dbg !2214

188:                                              ; preds = %187, %175
  %189 = load ptr, ptr %4, align 8, !dbg !2217
  %190 = getelementptr inbounds nuw %struct.ai_static, ptr %189, i32 0, i32 0, !dbg !2219
  %191 = load i8, ptr %190, align 4, !dbg !2219
  %192 = zext i8 %191 to i32, !dbg !2217
  %193 = icmp sge i32 %192, 128, !dbg !2220
  br i1 %193, label %194, label %200, !dbg !2221

194:                                              ; preds = %188
  %195 = load ptr, ptr %4, align 8, !dbg !2222
  %196 = getelementptr inbounds nuw %struct.ai_static, ptr %195, i32 0, i32 0, !dbg !2223
  %197 = load i8, ptr %196, align 4, !dbg !2223
  %198 = zext i8 %197 to i32, !dbg !2222
  %199 = icmp sle i32 %198, 134, !dbg !2224
  br i1 %199, label %203, label %200, !dbg !2225

200:                                              ; preds = %194, %188
  %201 = load ptr, ptr %4, align 8, !dbg !2226
  %202 = getelementptr inbounds nuw %struct.ai_static, ptr %201, i32 0, i32 0, !dbg !2228
  store i8 -127, ptr %202, align 4, !dbg !2229
  br label %203, !dbg !2230

203:                                              ; preds = %200, %194
  %204 = load ptr, ptr %2, align 8, !dbg !2231
  %205 = getelementptr inbounds nuw %struct.object, ptr %204, i32 0, i32 9, !dbg !2231
  %206 = load i16, ptr %205, align 2, !dbg !2231
  %207 = sext i16 %206 to i32, !dbg !2231
  %208 = icmp ne i32 %207, -1, !dbg !2231
  %209 = zext i1 %208 to i32, !dbg !2231
  call void @_Z7_AssertiPKcS0_i(i32 noundef %209, ptr noundef @.str.22, ptr noundef @.str.21, i32 noundef 951), !dbg !2231
  %210 = load ptr, ptr %2, align 8, !dbg !2232
  %211 = getelementptr inbounds nuw %struct.object, ptr %210, i32 0, i32 2, !dbg !2232
  %212 = load i8, ptr %211, align 1, !dbg !2232
  %213 = zext i8 %212 to i32, !dbg !2232
  %214 = load i32, ptr @N_robot_types, align 4, !dbg !2232
  %215 = icmp slt i32 %213, %214, !dbg !2232
  %216 = zext i1 %215 to i32, !dbg !2232
  call void @_Z7_AssertiPKcS0_i(i32 noundef %216, ptr noundef @.str.23, ptr noundef @.str.21, i32 noundef 952), !dbg !2232
  %217 = load i32, ptr %3, align 4, !dbg !2233
  %218 = load i32, ptr @FrameCount, align 4, !dbg !2234
  %219 = xor i32 %217, %218, !dbg !2235
  store i32 %219, ptr %11, align 4, !dbg !2236
  %220 = load ptr, ptr %5, align 8, !dbg !2237
  %221 = getelementptr inbounds nuw %struct.ai_local, ptr %220, i32 0, i32 8, !dbg !2239
  %222 = load i32, ptr %221, align 4, !dbg !2239
  %223 = icmp sgt i32 %222, -524288, !dbg !2240
  br i1 %223, label %224, label %230, !dbg !2240

224:                                              ; preds = %203
  %225 = load i32, ptr @FrameTime, align 4, !dbg !2241
  %226 = load ptr, ptr %5, align 8, !dbg !2242
  %227 = getelementptr inbounds nuw %struct.ai_local, ptr %226, i32 0, i32 8, !dbg !2243
  %228 = load i32, ptr %227, align 4, !dbg !2244
  %229 = sub nsw i32 %228, %225, !dbg !2244
  store i32 %229, ptr %227, align 4, !dbg !2244
  br label %230, !dbg !2242

230:                                              ; preds = %224, %203
  %231 = load ptr, ptr %9, align 8, !dbg !2245
  %232 = getelementptr inbounds nuw %struct.robot_info, ptr %231, i32 0, i32 8, !dbg !2247
  %233 = load i8, ptr %232, align 1, !dbg !2247
  %234 = sext i8 %233 to i32, !dbg !2245
  %235 = icmp ne i32 %234, -1, !dbg !2248
  br i1 %235, label %236, label %248, !dbg !2248

236:                                              ; preds = %230
  %237 = load ptr, ptr %5, align 8, !dbg !2249
  %238 = getelementptr inbounds nuw %struct.ai_local, ptr %237, i32 0, i32 9, !dbg !2252
  %239 = load i32, ptr %238, align 4, !dbg !2252
  %240 = icmp sgt i32 %239, -524288, !dbg !2253
  br i1 %240, label %241, label %247, !dbg !2253

241:                                              ; preds = %236
  %242 = load i32, ptr @FrameTime, align 4, !dbg !2254
  %243 = load ptr, ptr %5, align 8, !dbg !2255
  %244 = getelementptr inbounds nuw %struct.ai_local, ptr %243, i32 0, i32 9, !dbg !2256
  %245 = load i32, ptr %244, align 4, !dbg !2257
  %246 = sub nsw i32 %245, %242, !dbg !2257
  store i32 %246, ptr %244, align 4, !dbg !2257
  br label %247, !dbg !2255

247:                                              ; preds = %241, %236
  br label %251, !dbg !2258

248:                                              ; preds = %230
  %249 = load ptr, ptr %5, align 8, !dbg !2259
  %250 = getelementptr inbounds nuw %struct.ai_local, ptr %249, i32 0, i32 9, !dbg !2260
  store i32 524288, ptr %250, align 4, !dbg !2261
  br label %251

251:                                              ; preds = %248, %247
  %252 = load ptr, ptr %5, align 8, !dbg !2262
  %253 = getelementptr inbounds nuw %struct.ai_local, ptr %252, i32 0, i32 14, !dbg !2264
  %254 = load i32, ptr %253, align 4, !dbg !2264
  %255 = icmp slt i32 %254, 16777216, !dbg !2265
  br i1 %255, label %256, label %262, !dbg !2265

256:                                              ; preds = %251
  %257 = load i32, ptr @FrameTime, align 4, !dbg !2266
  %258 = load ptr, ptr %5, align 8, !dbg !2267
  %259 = getelementptr inbounds nuw %struct.ai_local, ptr %258, i32 0, i32 14, !dbg !2268
  %260 = load i32, ptr %259, align 4, !dbg !2269
  %261 = add nsw i32 %260, %257, !dbg !2269
  store i32 %261, ptr %259, align 4, !dbg !2269
  br label %262, !dbg !2267

262:                                              ; preds = %256, %251
  %263 = load ptr, ptr %5, align 8, !dbg !2270
  %264 = getelementptr inbounds nuw %struct.ai_local, ptr %263, i32 0, i32 4, !dbg !2271
  %265 = load i32, ptr %264, align 4, !dbg !2271
  store i32 %265, ptr %15, align 4, !dbg !2272
  %266 = load ptr, ptr %4, align 8, !dbg !2273
  %267 = getelementptr inbounds nuw %struct.ai_static, ptr %266, i32 0, i32 1, !dbg !2275
  %268 = getelementptr inbounds [11 x i8], ptr %267, i64 0, i64 4, !dbg !2273
  %269 = load i8, ptr %268, align 1, !dbg !2273
  %270 = sext i8 %269 to i32, !dbg !2273
  %271 = and i32 %270, 4, !dbg !2276
  %272 = icmp ne i32 %271, 0, !dbg !2277
  br i1 %272, label %273, label %281, !dbg !2278

273:                                              ; preds = %262
  %274 = load i32, ptr @Ai_last_missile_camera, align 4, !dbg !2279
  %275 = icmp ne i32 %274, -1, !dbg !2280
  br i1 %275, label %276, label %281, !dbg !2278

276:                                              ; preds = %273
  %277 = load i32, ptr @Ai_last_missile_camera, align 4, !dbg !2281
  %278 = sext i32 %277 to i64, !dbg !2282
  %279 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %278, !dbg !2282
  %280 = getelementptr inbounds nuw %struct.object, ptr %279, i32 0, i32 11, !dbg !2283
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 @Believed_player_pos, ptr align 4 %280, i64 12, i1 false), !dbg !2284
  br label %381, !dbg !2285

281:                                              ; preds = %273, %262
  %282 = load i32, ptr @Robots_kill_robots_cheat, align 4, !dbg !2286
  %283 = icmp ne i32 %282, 0, !dbg !2286
  br i1 %283, label %284, label %361, !dbg !2286

284:                                              ; preds = %281
  %285 = load ptr, ptr %2, align 8, !dbg !2289
  %286 = getelementptr inbounds nuw %struct.object, ptr %285, i32 0, i32 11, !dbg !2291
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %17, ptr align 4 %286, i64 12, i1 false), !dbg !2292
  %287 = load ptr, ptr %2, align 8, !dbg !2293
  %288 = load ptr, ptr %5, align 8, !dbg !2294
  %289 = load ptr, ptr %9, align 8, !dbg !2295
  call void @_Z19compute_vis_and_vecP6objectP10vms_vectorP8ai_localS2_PiP10robot_infoS5_(ptr noundef %287, ptr noundef %17, ptr noundef %288, ptr noundef %7, ptr noundef %10, ptr noundef %289, ptr noundef %14), !dbg !2296
  %290 = load i32, ptr %10, align 4, !dbg !2297
  %291 = icmp ne i32 %290, 0, !dbg !2297
  br i1 %291, label %292, label %359, !dbg !2297

292:                                              ; preds = %284
    #dbg_declare(ptr %18, !2299, !DIExpression(), !2301)
    #dbg_declare(ptr %19, !2302, !DIExpression(), !2303)
  store i32 -1, ptr %19, align 4, !dbg !2303
    #dbg_declare(ptr %20, !2304, !DIExpression(), !2305)
  store i32 13107200, ptr %20, align 4, !dbg !2305
    #dbg_declare(ptr %21, !2306, !DIExpression(), !2307)
  store i32 0, ptr %18, align 4, !dbg !2308
  br label %293, !dbg !2310

293:                                              ; preds = %337, %292
  %294 = load i32, ptr %18, align 4, !dbg !2311
  %295 = load i32, ptr @Highest_object_index, align 4, !dbg !2313
  %296 = icmp sle i32 %294, %295, !dbg !2314
  br i1 %296, label %297, label %340, !dbg !2315

297:                                              ; preds = %293
  %298 = load i32, ptr %18, align 4, !dbg !2316
  %299 = sext i32 %298 to i64, !dbg !2318
  %300 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %299, !dbg !2318
  %301 = getelementptr inbounds nuw %struct.object, ptr %300, i32 0, i32 1, !dbg !2319
  %302 = load i8, ptr %301, align 4, !dbg !2319
  %303 = zext i8 %302 to i32, !dbg !2318
  %304 = icmp eq i32 %303, 2, !dbg !2320
  br i1 %304, label %305, label %336, !dbg !2321

305:                                              ; preds = %297
  %306 = load i32, ptr %18, align 4, !dbg !2322
  %307 = load i32, ptr %3, align 4, !dbg !2323
  %308 = icmp ne i32 %306, %307, !dbg !2324
  br i1 %308, label %309, label %336, !dbg !2321

309:                                              ; preds = %305
  %310 = load ptr, ptr %2, align 8, !dbg !2325
  %311 = getelementptr inbounds nuw %struct.object, ptr %310, i32 0, i32 11, !dbg !2327
  %312 = load i32, ptr %18, align 4, !dbg !2328
  %313 = sext i32 %312 to i64, !dbg !2329
  %314 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %313, !dbg !2329
  %315 = getelementptr inbounds nuw %struct.object, ptr %314, i32 0, i32 11, !dbg !2330
  %316 = call noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef %311, ptr noundef %315), !dbg !2331
  store i32 %316, ptr %21, align 4, !dbg !2332
  %317 = load i32, ptr %21, align 4, !dbg !2333
  %318 = icmp slt i32 %317, 6553600, !dbg !2335
  br i1 %318, label %319, label %335, !dbg !2335

319:                                              ; preds = %309
  %320 = load ptr, ptr %2, align 8, !dbg !2336
  %321 = load i32, ptr %18, align 4, !dbg !2338
  %322 = sext i32 %321 to i64, !dbg !2339
  %323 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %322, !dbg !2339
  %324 = call noundef i32 @_Z27object_to_object_visibilityP6objectS0_i(ptr noundef %320, ptr noundef %323, i32 noundef 2), !dbg !2340
  %325 = icmp ne i32 %324, 0, !dbg !2340
  br i1 %325, label %326, label %334, !dbg !2340

326:                                              ; preds = %319
  %327 = load i32, ptr %21, align 4, !dbg !2341
  %328 = load i32, ptr %20, align 4, !dbg !2343
  %329 = icmp slt i32 %327, %328, !dbg !2344
  br i1 %329, label %330, label %333, !dbg !2344

330:                                              ; preds = %326
  %331 = load i32, ptr %18, align 4, !dbg !2345
  store i32 %331, ptr %19, align 4, !dbg !2347
  %332 = load i32, ptr %21, align 4, !dbg !2348
  store i32 %332, ptr %20, align 4, !dbg !2349
  br label %333, !dbg !2350

333:                                              ; preds = %330, %326
  br label %334, !dbg !2343

334:                                              ; preds = %333, %319
  br label %335, !dbg !2351

335:                                              ; preds = %334, %309
  br label %336, !dbg !2352

336:                                              ; preds = %335, %305, %297
  br label %337, !dbg !2353

337:                                              ; preds = %336
  %338 = load i32, ptr %18, align 4, !dbg !2354
  %339 = add nsw i32 %338, 1, !dbg !2354
  store i32 %339, ptr %18, align 4, !dbg !2354
  br label %293, !dbg !2355, !llvm.loop !2356

340:                                              ; preds = %293
  %341 = load i32, ptr %19, align 4, !dbg !2358
  %342 = icmp ne i32 %341, -1, !dbg !2360
  br i1 %342, label %343, label %357, !dbg !2360

343:                                              ; preds = %340
  %344 = load i32, ptr %19, align 4, !dbg !2361
  %345 = sext i32 %344 to i64, !dbg !2363
  %346 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %345, !dbg !2363
  %347 = getelementptr inbounds nuw %struct.object, ptr %346, i32 0, i32 11, !dbg !2364
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 @Believed_player_pos, ptr align 4 %347, i64 12, i1 false), !dbg !2365
  %348 = load i32, ptr %19, align 4, !dbg !2366
  %349 = sext i32 %348 to i64, !dbg !2367
  %350 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %349, !dbg !2367
  %351 = getelementptr inbounds nuw %struct.object, ptr %350, i32 0, i32 9, !dbg !2368
  %352 = load i16, ptr %351, align 2, !dbg !2368
  %353 = sext i16 %352 to i32, !dbg !2367
  store i32 %353, ptr @Believed_player_seg, align 4, !dbg !2369
  %354 = load ptr, ptr %2, align 8, !dbg !2370
  %355 = getelementptr inbounds nuw %struct.object, ptr %354, i32 0, i32 11, !dbg !2371
  %356 = call noundef i32 @_Z27vm_vec_normalized_dir_quickP10vms_vectorS0_S0_(ptr noundef %7, ptr noundef @Believed_player_pos, ptr noundef %355), !dbg !2372
  br label %358, !dbg !2373

357:                                              ; preds = %340
  br label %362, !dbg !2374

358:                                              ; preds = %343
  br label %360, !dbg !2375

359:                                              ; preds = %284
  br label %362, !dbg !2376

360:                                              ; preds = %358
  br label %380, !dbg !2377

361:                                              ; preds = %281
  br label %362, !dbg !2378

362:                                              ; preds = %361, %359, %357
    #dbg_label(!2379, !2381)
  store i32 0, ptr %14, align 4, !dbg !2382
  %363 = load i32, ptr @Player_num, align 4, !dbg !2383
  %364 = sext i32 %363 to i64, !dbg !2385
  %365 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %364, !dbg !2385
  %366 = getelementptr inbounds nuw %struct.player, ptr %365, i32 0, i32 7, !dbg !2386
  %367 = load i32, ptr %366, align 4, !dbg !2386
  %368 = and i32 %367, 2048, !dbg !2387
  %369 = icmp ne i32 %368, 0, !dbg !2388
  br i1 %369, label %373, label %370, !dbg !2389

370:                                              ; preds = %362
  %371 = load ptr, ptr @ConsoleObject, align 8, !dbg !2390
  %372 = getelementptr inbounds nuw %struct.object, ptr %371, i32 0, i32 11, !dbg !2391
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 @Believed_player_pos, ptr align 4 %372, i64 12, i1 false), !dbg !2392
  br label %379, !dbg !2393

373:                                              ; preds = %362
  %374 = load i32, ptr %3, align 4, !dbg !2394
  %375 = and i32 %374, 7, !dbg !2395
  %376 = sext i32 %375 to i64, !dbg !2396
  %377 = getelementptr inbounds [8 x %struct.ai_cloak_info], ptr @Ai_cloak_info, i64 0, i64 %376, !dbg !2396
  %378 = getelementptr inbounds nuw %struct.ai_cloak_info, ptr %377, i32 0, i32 2, !dbg !2397
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 @Believed_player_pos, ptr align 4 %378, i64 12, i1 false), !dbg !2398
  br label %379

379:                                              ; preds = %373, %370
  br label %380

380:                                              ; preds = %379, %360
  br label %381

381:                                              ; preds = %380, %276
  %382 = load ptr, ptr %2, align 8, !dbg !2399
  %383 = getelementptr inbounds nuw %struct.object, ptr %382, i32 0, i32 11, !dbg !2400
  %384 = call noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef @Believed_player_pos, ptr noundef %383), !dbg !2401
  store i32 %384, ptr %6, align 4, !dbg !2402
  %385 = load i32, ptr %15, align 4, !dbg !2403
  %386 = icmp ne i32 %385, 0, !dbg !2403
  br i1 %386, label %391, label %387, !dbg !2405

387:                                              ; preds = %381
  %388 = load i32, ptr %11, align 4, !dbg !2406
  %389 = and i32 %388, 3, !dbg !2407
  %390 = icmp ne i32 %389, 0, !dbg !2408
  br i1 %390, label %424, label %391, !dbg !2409

391:                                              ; preds = %387, %381
  %392 = load ptr, ptr %9, align 8, !dbg !2410
  %393 = load ptr, ptr %5, align 8, !dbg !2411
  %394 = call noundef i32 @_Z13ready_to_fireP10robot_infoP8ai_local(ptr noundef %392, ptr noundef %393), !dbg !2412
  %395 = icmp ne i32 %394, 0, !dbg !2412
  br i1 %395, label %396, label %424, !dbg !2413

396:                                              ; preds = %391
  %397 = load i32, ptr %6, align 4, !dbg !2414
  %398 = icmp slt i32 %397, 13107200, !dbg !2415
  br i1 %398, label %399, label %424, !dbg !2416

399:                                              ; preds = %396
  %400 = load ptr, ptr %9, align 8, !dbg !2417
  %401 = getelementptr inbounds nuw %struct.robot_info, ptr %400, i32 0, i32 9, !dbg !2418
  %402 = load i8, ptr %401, align 2, !dbg !2418
  %403 = icmp ne i8 %402, 0, !dbg !2419
  br i1 %403, label %404, label %424, !dbg !2420

404:                                              ; preds = %399
  %405 = load ptr, ptr %9, align 8, !dbg !2421
  %406 = getelementptr inbounds nuw %struct.robot_info, ptr %405, i32 0, i32 31, !dbg !2422
  %407 = load i8, ptr %406, align 1, !dbg !2422
  %408 = icmp ne i8 %407, 0, !dbg !2423
  br i1 %408, label %424, label %409, !dbg !2420

409:                                              ; preds = %404
  %410 = load ptr, ptr %5, align 8, !dbg !2424
  %411 = getelementptr inbounds nuw %struct.ai_local, ptr %410, i32 0, i32 8, !dbg !2427
  %412 = load i32, ptr %411, align 4, !dbg !2427
  %413 = icmp sle i32 %412, 0, !dbg !2428
  br i1 %413, label %414, label %421, !dbg !2428

414:                                              ; preds = %409
  %415 = load ptr, ptr %2, align 8, !dbg !2429
  %416 = load ptr, ptr %4, align 8, !dbg !2430
  %417 = getelementptr inbounds nuw %struct.ai_static, ptr %416, i32 0, i32 1, !dbg !2431
  %418 = getelementptr inbounds [11 x i8], ptr %417, i64 0, i64 0, !dbg !2430
  %419 = load i8, ptr %418, align 1, !dbg !2430
  %420 = sext i8 %419 to i32, !dbg !2430
  call void @_Z14calc_gun_pointP10vms_vectorP6objecti(ptr noundef %16, ptr noundef %415, i32 noundef %420), !dbg !2432
  br label %423, !dbg !2432

421:                                              ; preds = %409
  %422 = load ptr, ptr %2, align 8, !dbg !2433
  call void @_Z14calc_gun_pointP10vms_vectorP6objecti(ptr noundef %16, ptr noundef %422, i32 noundef 0), !dbg !2434
  br label %423

423:                                              ; preds = %421, %414
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %17, ptr align 4 %16, i64 12, i1 false), !dbg !2435
  br label %430, !dbg !2436

424:                                              ; preds = %404, %399, %396, %391, %387
  %425 = load ptr, ptr %2, align 8, !dbg !2437
  %426 = getelementptr inbounds nuw %struct.object, ptr %425, i32 0, i32 11, !dbg !2439
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %17, ptr align 4 %426, i64 12, i1 false), !dbg !2440
  %427 = getelementptr inbounds nuw %struct.vms_vector, ptr %16, i32 0, i32 2, !dbg !2441
  store i32 0, ptr %427, align 4, !dbg !2441
  %428 = getelementptr inbounds nuw %struct.vms_vector, ptr %16, i32 0, i32 1, !dbg !2441
  store i32 0, ptr %428, align 4, !dbg !2441
  %429 = getelementptr inbounds nuw %struct.vms_vector, ptr %16, i32 0, i32 0, !dbg !2441
  store i32 0, ptr %429, align 4, !dbg !2441
  br label %430

430:                                              ; preds = %424, %423
  %431 = load ptr, ptr %4, align 8, !dbg !2442
  %432 = getelementptr inbounds nuw %struct.ai_static, ptr %431, i32 0, i32 0, !dbg !2444
  %433 = load i8, ptr %432, align 4, !dbg !2444
  %434 = zext i8 %433 to i32, !dbg !2442
  %435 = icmp ne i32 %434, 132, !dbg !2445
  br i1 %435, label %436, label %491, !dbg !2446

436:                                              ; preds = %430
  %437 = load ptr, ptr %4, align 8, !dbg !2447
  %438 = getelementptr inbounds nuw %struct.ai_static, ptr %437, i32 0, i32 0, !dbg !2448
  %439 = load i8, ptr %438, align 4, !dbg !2448
  %440 = zext i8 %439 to i32, !dbg !2447
  %441 = icmp ne i32 %440, 131, !dbg !2449
  br i1 %441, label %442, label %491, !dbg !2450

442:                                              ; preds = %436
  %443 = load ptr, ptr %4, align 8, !dbg !2451
  %444 = getelementptr inbounds nuw %struct.ai_static, ptr %443, i32 0, i32 0, !dbg !2452
  %445 = load i8, ptr %444, align 4, !dbg !2452
  %446 = zext i8 %445 to i32, !dbg !2451
  %447 = icmp ne i32 %446, 128, !dbg !2453
  br i1 %447, label %448, label %491, !dbg !2454

448:                                              ; preds = %442
  %449 = load i32, ptr @Game_mode, align 4, !dbg !2455
  %450 = and i32 %449, 38, !dbg !2456
  %451 = icmp ne i32 %450, 0, !dbg !2457
  br i1 %451, label %491, label %452, !dbg !2458

452:                                              ; preds = %448
  %453 = load ptr, ptr %9, align 8, !dbg !2459
  %454 = getelementptr inbounds nuw %struct.robot_info, ptr %453, i32 0, i32 37, !dbg !2460
  %455 = load i8, ptr %454, align 1, !dbg !2460
  %456 = sext i8 %455 to i32, !dbg !2459
  %457 = icmp ne i32 %456, 1, !dbg !2461
  br i1 %457, label %458, label %491, !dbg !2462

458:                                              ; preds = %452
  %459 = load ptr, ptr %9, align 8, !dbg !2463
  %460 = getelementptr inbounds nuw %struct.robot_info, ptr %459, i32 0, i32 40, !dbg !2464
  %461 = load i8, ptr %460, align 4, !dbg !2464
  %462 = sext i8 %461 to i32, !dbg !2463
  %463 = icmp ne i32 %462, 1, !dbg !2465
  br i1 %463, label %464, label %491, !dbg !2462

464:                                              ; preds = %458
  %465 = load i32, ptr @Overall_agitation, align 4, !dbg !2466
  %466 = icmp sgt i32 %465, 70, !dbg !2468
  br i1 %466, label %467, label %490, !dbg !2468

467:                                              ; preds = %464
  %468 = load i32, ptr %6, align 4, !dbg !2469
  %469 = icmp slt i32 %468, 13107200, !dbg !2472
  br i1 %469, label %470, label %489, !dbg !2473

470:                                              ; preds = %467
  %471 = call noundef i32 @_Z6P_Randv(), !dbg !2474
  %472 = load i32, ptr @FrameTime, align 4, !dbg !2475
  %473 = sdiv i32 %472, 4, !dbg !2476
  %474 = icmp slt i32 %471, %473, !dbg !2477
  br i1 %474, label %475, label %489, !dbg !2473

475:                                              ; preds = %470
  %476 = call noundef i32 @_Z6P_Randv(), !dbg !2478
  %477 = load i32, ptr @Overall_agitation, align 4, !dbg !2481
  %478 = sub nsw i32 %477, 40, !dbg !2482
  %479 = mul nsw i32 %476, %478, !dbg !2483
  %480 = icmp sgt i32 %479, 327680, !dbg !2484
  br i1 %480, label %481, label %488, !dbg !2484

481:                                              ; preds = %475
  %482 = load ptr, ptr %2, align 8, !dbg !2485
  %483 = load i32, ptr @Overall_agitation, align 4, !dbg !2487
  %484 = sdiv i32 %483, 8, !dbg !2488
  %485 = add nsw i32 4, %484, !dbg !2489
  %486 = load i32, ptr @Difficulty_level, align 4, !dbg !2490
  %487 = add nsw i32 %485, %486, !dbg !2491
  call void @_Z21create_path_to_playerP6objectii(ptr noundef %482, i32 noundef %487, i32 noundef 1), !dbg !2492
  br label %2900, !dbg !2493

488:                                              ; preds = %475
  br label %489, !dbg !2494

489:                                              ; preds = %488, %470, %467
  br label %490, !dbg !2495

490:                                              ; preds = %489, %464
  br label %491, !dbg !2496

491:                                              ; preds = %490, %458, %452, %448, %442, %436, %430
  %492 = load ptr, ptr %5, align 8, !dbg !2497
  %493 = getelementptr inbounds nuw %struct.ai_local, ptr %492, i32 0, i32 1, !dbg !2499
  %494 = load i32, ptr %493, align 4, !dbg !2499
  %495 = icmp ne i32 %494, 0, !dbg !2500
  br i1 %495, label %496, label %610, !dbg !2501

496:                                              ; preds = %491
  %497 = load i32, ptr @Game_mode, align 4, !dbg !2502
  %498 = and i32 %497, 38, !dbg !2503
  %499 = icmp ne i32 %498, 0, !dbg !2504
  br i1 %499, label %610, label %500, !dbg !2501

500:                                              ; preds = %496
  %501 = load ptr, ptr %5, align 8, !dbg !2505
  %502 = getelementptr inbounds nuw %struct.ai_local, ptr %501, i32 0, i32 1, !dbg !2507
  %503 = load i32, ptr %502, align 4, !dbg !2507
  %504 = load ptr, ptr %5, align 8, !dbg !2508
  %505 = getelementptr inbounds nuw %struct.ai_local, ptr %504, i32 0, i32 2, !dbg !2509
  %506 = load i32, ptr %505, align 4, !dbg !2510
  %507 = add nsw i32 %506, %503, !dbg !2510
  store i32 %507, ptr %505, align 4, !dbg !2510
  %508 = load ptr, ptr %5, align 8, !dbg !2511
  %509 = getelementptr inbounds nuw %struct.ai_local, ptr %508, i32 0, i32 1, !dbg !2512
  store i32 0, ptr %509, align 4, !dbg !2513
  %510 = load ptr, ptr %5, align 8, !dbg !2514
  %511 = getelementptr inbounds nuw %struct.ai_local, ptr %510, i32 0, i32 2, !dbg !2516
  %512 = load i32, ptr %511, align 4, !dbg !2516
  %513 = icmp sgt i32 %512, 3, !dbg !2517
  br i1 %513, label %514, label %609, !dbg !2517

514:                                              ; preds = %500
  %515 = load ptr, ptr %5, align 8, !dbg !2518
  %516 = getelementptr inbounds nuw %struct.ai_local, ptr %515, i32 0, i32 3, !dbg !2520
  %517 = load i32, ptr %516, align 4, !dbg !2520
  switch i32 %517, label %606 [
    i32 8, label %518
    i32 9, label %521
    i32 3, label %522
    i32 0, label %529
    i32 2, label %558
    i32 4, label %568
    i32 5, label %585
    i32 7, label %603
    i32 6, label %605
  ], !dbg !2521

518:                                              ; preds = %514
  %519 = load ptr, ptr %2, align 8, !dbg !2522
  call void @_Z27move_towards_segment_centerP6object(ptr noundef %519), !dbg !2524
  %520 = load ptr, ptr %2, align 8, !dbg !2525
  call void @_Z21create_path_to_playerP6objectii(ptr noundef %520, i32 noundef 100, i32 noundef 1), !dbg !2526
  br label %606, !dbg !2527

521:                                              ; preds = %514
  store i32 -1, ptr @Escort_goal_object, align 4, !dbg !2528
  br label %606, !dbg !2529

522:                                              ; preds = %514
  %523 = load ptr, ptr %2, align 8, !dbg !2530
  %524 = load i32, ptr @Overall_agitation, align 4, !dbg !2531
  %525 = sdiv i32 %524, 8, !dbg !2532
  %526 = add nsw i32 4, %525, !dbg !2533
  %527 = load i32, ptr @Difficulty_level, align 4, !dbg !2534
  %528 = add nsw i32 %526, %527, !dbg !2535
  call void @_Z21create_path_to_playerP6objectii(ptr noundef %523, i32 noundef %528, i32 noundef 1), !dbg !2536
  br label %606, !dbg !2537

529:                                              ; preds = %514
  %530 = load ptr, ptr %9, align 8, !dbg !2538
  %531 = getelementptr inbounds nuw %struct.robot_info, ptr %530, i32 0, i32 31, !dbg !2540
  %532 = load i8, ptr %531, align 1, !dbg !2540
  %533 = icmp ne i8 %532, 0, !dbg !2538
  br i1 %533, label %534, label %536, !dbg !2538

534:                                              ; preds = %529
  %535 = load ptr, ptr %2, align 8, !dbg !2541
  call void @_Z27move_towards_segment_centerP6object(ptr noundef %535), !dbg !2542
  br label %557, !dbg !2542

536:                                              ; preds = %529
  %537 = load ptr, ptr %4, align 8, !dbg !2543
  %538 = getelementptr inbounds nuw %struct.ai_static, ptr %537, i32 0, i32 0, !dbg !2545
  %539 = load i8, ptr %538, align 4, !dbg !2545
  %540 = zext i8 %539 to i32, !dbg !2543
  %541 = icmp eq i32 %540, 128, !dbg !2546
  br i1 %541, label %556, label %542, !dbg !2547

542:                                              ; preds = %536
  %543 = load ptr, ptr %4, align 8, !dbg !2548
  %544 = getelementptr inbounds nuw %struct.ai_static, ptr %543, i32 0, i32 0, !dbg !2549
  %545 = load i8, ptr %544, align 4, !dbg !2549
  %546 = zext i8 %545 to i32, !dbg !2548
  %547 = icmp eq i32 %546, 133, !dbg !2550
  br i1 %547, label %556, label %548, !dbg !2551

548:                                              ; preds = %542
  %549 = load ptr, ptr %4, align 8, !dbg !2552
  %550 = getelementptr inbounds nuw %struct.ai_static, ptr %549, i32 0, i32 0, !dbg !2553
  %551 = load i8, ptr %550, align 4, !dbg !2553
  %552 = zext i8 %551 to i32, !dbg !2552
  %553 = icmp eq i32 %552, 134, !dbg !2554
  br i1 %553, label %556, label %554, !dbg !2555

554:                                              ; preds = %548
  %555 = load ptr, ptr %2, align 8, !dbg !2556
  call void @_Z22attempt_to_resume_pathP6object(ptr noundef %555), !dbg !2557
  br label %556, !dbg !2557

556:                                              ; preds = %554, %548, %542, %536
  br label %557

557:                                              ; preds = %556, %534
  br label %606, !dbg !2558

558:                                              ; preds = %514
  %559 = load i32, ptr @Game_mode, align 4, !dbg !2559
  %560 = and i32 %559, 38, !dbg !2561
  %561 = icmp ne i32 %560, 0, !dbg !2559
  br i1 %561, label %562, label %565, !dbg !2559

562:                                              ; preds = %558
  %563 = load ptr, ptr %5, align 8, !dbg !2562
  %564 = getelementptr inbounds nuw %struct.ai_local, ptr %563, i32 0, i32 3, !dbg !2564
  store i32 0, ptr %564, align 4, !dbg !2565
  br label %567, !dbg !2566

565:                                              ; preds = %558
  %566 = load ptr, ptr %2, align 8, !dbg !2567
  call void @_Z22attempt_to_resume_pathP6object(ptr noundef %566), !dbg !2568
  br label %567

567:                                              ; preds = %565, %562
  br label %606, !dbg !2569

568:                                              ; preds = %514
  %569 = load ptr, ptr %2, align 8, !dbg !2570
  call void @_Z27move_towards_segment_centerP6object(ptr noundef %569), !dbg !2571
  %570 = load ptr, ptr %2, align 8, !dbg !2572
  %571 = getelementptr inbounds nuw %struct.object, ptr %570, i32 0, i32 21, !dbg !2573
  %572 = getelementptr inbounds nuw %struct.physics_info, ptr %571, i32 0, i32 0, !dbg !2574
  %573 = getelementptr inbounds nuw %struct.vms_vector, ptr %572, i32 0, i32 0, !dbg !2575
  store i32 0, ptr %573, align 4, !dbg !2576
  %574 = load ptr, ptr %2, align 8, !dbg !2577
  %575 = getelementptr inbounds nuw %struct.object, ptr %574, i32 0, i32 21, !dbg !2578
  %576 = getelementptr inbounds nuw %struct.physics_info, ptr %575, i32 0, i32 0, !dbg !2579
  %577 = getelementptr inbounds nuw %struct.vms_vector, ptr %576, i32 0, i32 1, !dbg !2580
  store i32 0, ptr %577, align 4, !dbg !2581
  %578 = load ptr, ptr %2, align 8, !dbg !2582
  %579 = getelementptr inbounds nuw %struct.object, ptr %578, i32 0, i32 21, !dbg !2583
  %580 = getelementptr inbounds nuw %struct.physics_info, ptr %579, i32 0, i32 0, !dbg !2584
  %581 = getelementptr inbounds nuw %struct.vms_vector, ptr %580, i32 0, i32 2, !dbg !2585
  store i32 0, ptr %581, align 4, !dbg !2586
  %582 = load ptr, ptr %2, align 8, !dbg !2587
  call void @_Z21create_n_segment_pathP6objectii(ptr noundef %582, i32 noundef 5, i32 noundef -1), !dbg !2588
  %583 = load ptr, ptr %5, align 8, !dbg !2589
  %584 = getelementptr inbounds nuw %struct.ai_local, ptr %583, i32 0, i32 3, !dbg !2590
  store i32 4, ptr %584, align 4, !dbg !2591
  br label %606, !dbg !2592

585:                                              ; preds = %514
  %586 = load ptr, ptr %2, align 8, !dbg !2593
  %587 = ptrtoint ptr %586 to i64, !dbg !2593
  %588 = sub i64 %587, ptrtoint (ptr @Objects to i64), !dbg !2593
  %589 = sdiv exact i64 %588, 268, !dbg !2593
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.24, i64 noundef %589), !dbg !2593
  %590 = load ptr, ptr %2, align 8, !dbg !2594
  call void @_Z27move_towards_segment_centerP6object(ptr noundef %590), !dbg !2595
  %591 = load ptr, ptr %2, align 8, !dbg !2596
  %592 = getelementptr inbounds nuw %struct.object, ptr %591, i32 0, i32 21, !dbg !2597
  %593 = getelementptr inbounds nuw %struct.physics_info, ptr %592, i32 0, i32 0, !dbg !2598
  %594 = getelementptr inbounds nuw %struct.vms_vector, ptr %593, i32 0, i32 0, !dbg !2599
  store i32 0, ptr %594, align 4, !dbg !2600
  %595 = load ptr, ptr %2, align 8, !dbg !2601
  %596 = getelementptr inbounds nuw %struct.object, ptr %595, i32 0, i32 21, !dbg !2602
  %597 = getelementptr inbounds nuw %struct.physics_info, ptr %596, i32 0, i32 0, !dbg !2603
  %598 = getelementptr inbounds nuw %struct.vms_vector, ptr %597, i32 0, i32 1, !dbg !2604
  store i32 0, ptr %598, align 4, !dbg !2605
  %599 = load ptr, ptr %2, align 8, !dbg !2606
  %600 = getelementptr inbounds nuw %struct.object, ptr %599, i32 0, i32 21, !dbg !2607
  %601 = getelementptr inbounds nuw %struct.physics_info, ptr %600, i32 0, i32 0, !dbg !2608
  %602 = getelementptr inbounds nuw %struct.vms_vector, ptr %601, i32 0, i32 2, !dbg !2609
  store i32 0, ptr %602, align 4, !dbg !2610
  br label %606, !dbg !2611

603:                                              ; preds = %514
  %604 = load ptr, ptr %2, align 8, !dbg !2612
  call void @_Z29create_n_segment_path_to_doorP6objectii(ptr noundef %604, i32 noundef 5, i32 noundef -1), !dbg !2613
  br label %606, !dbg !2614

605:                                              ; preds = %514
  call void @_Z4Int3v(), !dbg !2615
  br label %606, !dbg !2616

606:                                              ; preds = %514, %605, %603, %585, %568, %567, %557, %522, %521, %518
  %607 = load ptr, ptr %5, align 8, !dbg !2617
  %608 = getelementptr inbounds nuw %struct.ai_local, ptr %607, i32 0, i32 2, !dbg !2618
  store i32 0, ptr %608, align 4, !dbg !2619
  br label %609, !dbg !2620

609:                                              ; preds = %606, %500
  br label %615, !dbg !2621

610:                                              ; preds = %496, %491
  %611 = load ptr, ptr %5, align 8, !dbg !2622
  %612 = getelementptr inbounds nuw %struct.ai_local, ptr %611, i32 0, i32 2, !dbg !2623
  %613 = load i32, ptr %612, align 4, !dbg !2624
  %614 = sdiv i32 %613, 2, !dbg !2624
  store i32 %614, ptr %612, align 4, !dbg !2624
  br label %615

615:                                              ; preds = %610, %609
  %616 = load i32, ptr @Game_mode, align 4, !dbg !2625
  %617 = and i32 %616, 38, !dbg !2627
  %618 = icmp ne i32 %617, 0, !dbg !2628
  br i1 %618, label %645, label %619, !dbg !2629

619:                                              ; preds = %615
  %620 = load ptr, ptr %2, align 8, !dbg !2630
  %621 = getelementptr inbounds nuw %struct.object, ptr %620, i32 0, i32 9, !dbg !2631
  %622 = load i16, ptr %621, align 2, !dbg !2631
  %623 = sext i16 %622 to i64, !dbg !2632
  %624 = getelementptr inbounds [0 x %struct.segment2], ptr @Segment2s, i64 0, i64 %623, !dbg !2632
  %625 = getelementptr inbounds nuw %struct.segment2, ptr %624, i32 0, i32 0, !dbg !2633
  %626 = load i8, ptr %625, align 4, !dbg !2633
  %627 = zext i8 %626 to i32, !dbg !2632
  %628 = icmp eq i32 %627, 4, !dbg !2634
  br i1 %628, label %629, label %645, !dbg !2629

629:                                              ; preds = %619
  %630 = load ptr, ptr %2, align 8, !dbg !2635
  %631 = getelementptr inbounds nuw %struct.object, ptr %630, i32 0, i32 9, !dbg !2638
  %632 = load i16, ptr %631, align 2, !dbg !2638
  %633 = sext i16 %632 to i64, !dbg !2639
  %634 = getelementptr inbounds [0 x %struct.segment2], ptr @Segment2s, i64 0, i64 %633, !dbg !2639
  %635 = getelementptr inbounds nuw %struct.segment2, ptr %634, i32 0, i32 2, !dbg !2640
  %636 = load i8, ptr %635, align 2, !dbg !2640
  %637 = sext i8 %636 to i64, !dbg !2641
  %638 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %637, !dbg !2641
  %639 = getelementptr inbounds nuw %struct.FuelCenter, ptr %638, i32 0, i32 3, !dbg !2642
  %640 = load i8, ptr %639, align 1, !dbg !2642
  %641 = icmp ne i8 %640, 0, !dbg !2641
  br i1 %641, label %642, label %644, !dbg !2641

642:                                              ; preds = %629
  %643 = load ptr, ptr %2, align 8, !dbg !2643
  call void @_Z14ai_follow_pathP6objectiiP10vms_vector(ptr noundef %643, i32 noundef 1, i32 noundef 1, ptr noundef null), !dbg !2645
  br label %2900, !dbg !2646

644:                                              ; preds = %629
  br label %645, !dbg !2647

645:                                              ; preds = %644, %619, %615
  %646 = load ptr, ptr %5, align 8, !dbg !2648
  %647 = getelementptr inbounds nuw %struct.ai_local, ptr %646, i32 0, i32 0, !dbg !2650
  %648 = load i32, ptr %647, align 4, !dbg !2650
  %649 = icmp ne i32 %648, 0, !dbg !2648
  br i1 %649, label %650, label %681, !dbg !2648

650:                                              ; preds = %645
  %651 = load ptr, ptr %5, align 8, !dbg !2651
  %652 = getelementptr inbounds nuw %struct.ai_local, ptr %651, i32 0, i32 10, !dbg !2654
  %653 = load i32, ptr %652, align 4, !dbg !2654
  %654 = icmp sgt i32 %653, 0, !dbg !2655
  br i1 %654, label %655, label %673, !dbg !2655

655:                                              ; preds = %650
  %656 = load i32, ptr @FrameTime, align 4, !dbg !2656
  %657 = load ptr, ptr %5, align 8, !dbg !2658
  %658 = getelementptr inbounds nuw %struct.ai_local, ptr %657, i32 0, i32 10, !dbg !2659
  %659 = load i32, ptr %658, align 4, !dbg !2660
  %660 = sub nsw i32 %659, %656, !dbg !2660
  store i32 %660, ptr %658, align 4, !dbg !2660
  %661 = load ptr, ptr %5, align 8, !dbg !2661
  %662 = getelementptr inbounds nuw %struct.ai_local, ptr %661, i32 0, i32 10, !dbg !2663
  %663 = load i32, ptr %662, align 4, !dbg !2663
  %664 = icmp sle i32 %663, 0, !dbg !2664
  br i1 %664, label %665, label %672, !dbg !2664

665:                                              ; preds = %655
  %666 = load ptr, ptr %5, align 8, !dbg !2665
  %667 = getelementptr inbounds nuw %struct.ai_local, ptr %666, i32 0, i32 10, !dbg !2667
  store i32 131072, ptr %667, align 4, !dbg !2668
  %668 = load ptr, ptr %5, align 8, !dbg !2669
  %669 = getelementptr inbounds nuw %struct.ai_local, ptr %668, i32 0, i32 0, !dbg !2670
  %670 = load i32, ptr %669, align 4, !dbg !2671
  %671 = add nsw i32 %670, -1, !dbg !2671
  store i32 %671, ptr %669, align 4, !dbg !2671
  br label %672, !dbg !2672

672:                                              ; preds = %665, %655
  br label %680, !dbg !2673

673:                                              ; preds = %650
  %674 = load ptr, ptr %5, align 8, !dbg !2674
  %675 = getelementptr inbounds nuw %struct.ai_local, ptr %674, i32 0, i32 0, !dbg !2676
  %676 = load i32, ptr %675, align 4, !dbg !2677
  %677 = add nsw i32 %676, -1, !dbg !2677
  store i32 %677, ptr %675, align 4, !dbg !2677
  %678 = load ptr, ptr %5, align 8, !dbg !2678
  %679 = getelementptr inbounds nuw %struct.ai_local, ptr %678, i32 0, i32 10, !dbg !2679
  store i32 131072, ptr %679, align 4, !dbg !2680
  br label %680

680:                                              ; preds = %673, %672
  br label %685, !dbg !2681

681:                                              ; preds = %645
  %682 = load ptr, ptr %4, align 8, !dbg !2682
  %683 = getelementptr inbounds nuw %struct.ai_static, ptr %682, i32 0, i32 1, !dbg !2683
  %684 = getelementptr inbounds [11 x i8], ptr %683, i64 0, i64 2, !dbg !2682
  store i8 1, ptr %684, align 1, !dbg !2684
  br label %685

685:                                              ; preds = %681, %680
  %686 = load i32, ptr @Player_is_dead, align 4, !dbg !2685
  %687 = icmp ne i32 %686, 0, !dbg !2685
  br i1 %687, label %688, label %759, !dbg !2687

688:                                              ; preds = %685
  %689 = load ptr, ptr %5, align 8, !dbg !2688
  %690 = getelementptr inbounds nuw %struct.ai_local, ptr %689, i32 0, i32 0, !dbg !2689
  %691 = load i32, ptr %690, align 4, !dbg !2689
  %692 = icmp eq i32 %691, 0, !dbg !2690
  br i1 %692, label %693, label %759, !dbg !2687

693:                                              ; preds = %688
  %694 = load i32, ptr %6, align 4, !dbg !2691
  %695 = icmp slt i32 %694, 13107200, !dbg !2693
  br i1 %695, label %696, label %758, !dbg !2694

696:                                              ; preds = %693
  %697 = call noundef i32 @_Z6P_Randv(), !dbg !2695
  %698 = load i32, ptr @FrameTime, align 4, !dbg !2696
  %699 = sdiv i32 %698, 8, !dbg !2697
  %700 = icmp slt i32 %697, %699, !dbg !2698
  br i1 %700, label %701, label %758, !dbg !2694

701:                                              ; preds = %696
  %702 = load ptr, ptr %4, align 8, !dbg !2699
  %703 = getelementptr inbounds nuw %struct.ai_static, ptr %702, i32 0, i32 0, !dbg !2702
  %704 = load i8, ptr %703, align 4, !dbg !2702
  %705 = zext i8 %704 to i32, !dbg !2699
  %706 = icmp ne i32 %705, 128, !dbg !2703
  br i1 %706, label %707, label %757, !dbg !2704

707:                                              ; preds = %701
  %708 = load ptr, ptr %4, align 8, !dbg !2705
  %709 = getelementptr inbounds nuw %struct.ai_static, ptr %708, i32 0, i32 0, !dbg !2706
  %710 = load i8, ptr %709, align 4, !dbg !2706
  %711 = zext i8 %710 to i32, !dbg !2705
  %712 = icmp ne i32 %711, 131, !dbg !2707
  br i1 %712, label %713, label %757, !dbg !2704

713:                                              ; preds = %707
  %714 = load ptr, ptr %2, align 8, !dbg !2708
  %715 = call noundef i32 @_Z24ai_multiplayer_awarenessP6objecti(ptr noundef %714, i32 noundef 30), !dbg !2711
  %716 = icmp ne i32 %715, 0, !dbg !2711
  br i1 %716, label %718, label %717, !dbg !2712

717:                                              ; preds = %713
  br label %2900, !dbg !2713

718:                                              ; preds = %713
  %719 = load i32, ptr %3, align 4, !dbg !2714
  call void @_Z28ai_multi_send_robot_positionii(i32 noundef %719, i32 noundef -1), !dbg !2715
  %720 = load ptr, ptr %5, align 8, !dbg !2716
  %721 = getelementptr inbounds nuw %struct.ai_local, ptr %720, i32 0, i32 3, !dbg !2718
  %722 = load i32, ptr %721, align 4, !dbg !2718
  %723 = icmp eq i32 %722, 2, !dbg !2719
  br i1 %723, label %724, label %735, !dbg !2720

724:                                              ; preds = %718
  %725 = load ptr, ptr %4, align 8, !dbg !2721
  %726 = getelementptr inbounds nuw %struct.ai_static, ptr %725, i32 0, i32 5, !dbg !2722
  %727 = load i8, ptr %726, align 2, !dbg !2722
  %728 = sext i8 %727 to i32, !dbg !2721
  %729 = load ptr, ptr %4, align 8, !dbg !2723
  %730 = getelementptr inbounds nuw %struct.ai_static, ptr %729, i32 0, i32 4, !dbg !2724
  %731 = load i16, ptr %730, align 4, !dbg !2724
  %732 = sext i16 %731 to i32, !dbg !2723
  %733 = sub nsw i32 %732, 1, !dbg !2725
  %734 = icmp slt i32 %728, %733, !dbg !2726
  br i1 %734, label %756, label %735, !dbg !2727

735:                                              ; preds = %724, %718
  %736 = load ptr, ptr %4, align 8, !dbg !2728
  %737 = getelementptr inbounds nuw %struct.ai_static, ptr %736, i32 0, i32 0, !dbg !2730
  %738 = load i8, ptr %737, align 4, !dbg !2730
  %739 = zext i8 %738 to i32, !dbg !2728
  %740 = icmp ne i32 %739, 132, !dbg !2731
  br i1 %740, label %741, label %755, !dbg !2732

741:                                              ; preds = %735
  %742 = load ptr, ptr %4, align 8, !dbg !2733
  %743 = getelementptr inbounds nuw %struct.ai_static, ptr %742, i32 0, i32 0, !dbg !2734
  %744 = load i8, ptr %743, align 4, !dbg !2734
  %745 = zext i8 %744 to i32, !dbg !2733
  %746 = icmp ne i32 %745, 131, !dbg !2735
  br i1 %746, label %747, label %755, !dbg !2732

747:                                              ; preds = %741
  %748 = load i32, ptr %6, align 4, !dbg !2736
  %749 = icmp slt i32 %748, 1966080, !dbg !2739
  br i1 %749, label %750, label %752, !dbg !2739

750:                                              ; preds = %747
  %751 = load ptr, ptr %2, align 8, !dbg !2740
  call void @_Z21create_n_segment_pathP6objectii(ptr noundef %751, i32 noundef 5, i32 noundef 1), !dbg !2741
  br label %754, !dbg !2741

752:                                              ; preds = %747
  %753 = load ptr, ptr %2, align 8, !dbg !2742
  call void @_Z21create_path_to_playerP6objectii(ptr noundef %753, i32 noundef 20, i32 noundef 1), !dbg !2743
  br label %754

754:                                              ; preds = %752, %750
  br label %755, !dbg !2744

755:                                              ; preds = %754, %741, %735
  br label %756, !dbg !2745

756:                                              ; preds = %755, %724
  br label %757, !dbg !2746

757:                                              ; preds = %756, %707, %701
  br label %758, !dbg !2747

758:                                              ; preds = %757, %696, %693
  br label %759, !dbg !2748

759:                                              ; preds = %758, %688, %685
  %760 = load ptr, ptr %5, align 8, !dbg !2749
  %761 = getelementptr inbounds nuw %struct.ai_local, ptr %760, i32 0, i32 0, !dbg !2751
  %762 = load i32, ptr %761, align 4, !dbg !2751
  %763 = icmp eq i32 %762, 4, !dbg !2752
  br i1 %763, label %769, label %764, !dbg !2753

764:                                              ; preds = %759
  %765 = load ptr, ptr %5, align 8, !dbg !2754
  %766 = getelementptr inbounds nuw %struct.ai_local, ptr %765, i32 0, i32 0, !dbg !2755
  %767 = load i32, ptr %766, align 4, !dbg !2755
  %768 = icmp sge i32 %767, 3, !dbg !2756
  br i1 %768, label %769, label %777, !dbg !2753

769:                                              ; preds = %764, %759
  %770 = load ptr, ptr %2, align 8, !dbg !2757
  %771 = load ptr, ptr %5, align 8, !dbg !2759
  %772 = load ptr, ptr %9, align 8, !dbg !2760
  call void @_Z19compute_vis_and_vecP6objectP10vms_vectorP8ai_localS2_PiP10robot_infoS5_(ptr noundef %770, ptr noundef %17, ptr noundef %771, ptr noundef %7, ptr noundef %10, ptr noundef %772, ptr noundef %14), !dbg !2761
  %773 = load i32, ptr %10, align 4, !dbg !2762
  %774 = icmp eq i32 %773, 1, !dbg !2764
  br i1 %774, label %775, label %776, !dbg !2764

775:                                              ; preds = %769
  store i32 2, ptr %10, align 4, !dbg !2765
  br label %776, !dbg !2766

776:                                              ; preds = %775, %769
  br label %825, !dbg !2767

777:                                              ; preds = %764
  %778 = load i32, ptr %11, align 4, !dbg !2768
  %779 = and i32 %778, 3, !dbg !2770
  %780 = icmp eq i32 %779, 0, !dbg !2771
  br i1 %780, label %781, label %824, !dbg !2772

781:                                              ; preds = %777
  %782 = load i32, ptr %15, align 4, !dbg !2773
  %783 = icmp ne i32 %782, 0, !dbg !2773
  br i1 %783, label %824, label %784, !dbg !2774

784:                                              ; preds = %781
  %785 = load i32, ptr %6, align 4, !dbg !2775
  %786 = icmp slt i32 %785, 6553600, !dbg !2776
  br i1 %786, label %787, label %824, !dbg !2774

787:                                              ; preds = %784
    #dbg_declare(ptr %22, !2777, !DIExpression(), !2779)
    #dbg_declare(ptr %23, !2780, !DIExpression(), !2781)
  %788 = call noundef i32 @_Z6P_Randv(), !dbg !2782
  store i32 %788, ptr %23, align 4, !dbg !2783
  %789 = load i32, ptr %6, align 4, !dbg !2784
  %790 = load i32, ptr @Difficulty_level, align 4, !dbg !2785
  %791 = add nsw i32 %790, 1, !dbg !2786
  %792 = mul nsw i32 %789, %791, !dbg !2787
  %793 = sdiv i32 %792, 64, !dbg !2788
  store i32 %793, ptr %22, align 4, !dbg !2789
  %794 = load i32, ptr %3, align 4, !dbg !2790
  %795 = icmp eq i32 %794, 28, !dbg !2792
  br i1 %795, label %796, label %797, !dbg !2792

796:                                              ; preds = %787
  br label %797, !dbg !2793

797:                                              ; preds = %796, %787
  %798 = load i32, ptr %23, align 4, !dbg !2795
  %799 = load i32, ptr %22, align 4, !dbg !2797
  %800 = call noundef i32 @_Z6fixmulii(i32 noundef %798, i32 noundef %799), !dbg !2798
  %801 = load i32, ptr @FrameTime, align 4, !dbg !2799
  %802 = icmp slt i32 %800, %801, !dbg !2800
  br i1 %802, label %811, label %803, !dbg !2801

803:                                              ; preds = %797
  %804 = load i32, ptr @Player_num, align 4, !dbg !2802
  %805 = sext i32 %804 to i64, !dbg !2803
  %806 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %805, !dbg !2803
  %807 = getelementptr inbounds nuw %struct.player, ptr %806, i32 0, i32 7, !dbg !2804
  %808 = load i32, ptr %807, align 4, !dbg !2804
  %809 = and i32 %808, 16384, !dbg !2805
  %810 = icmp ne i32 %809, 0, !dbg !2806
  br i1 %810, label %811, label %823, !dbg !2801

811:                                              ; preds = %803, %797
  %812 = load ptr, ptr %5, align 8, !dbg !2807
  %813 = getelementptr inbounds nuw %struct.ai_local, ptr %812, i32 0, i32 0, !dbg !2809
  store i32 3, ptr %813, align 4, !dbg !2810
  %814 = load ptr, ptr %5, align 8, !dbg !2811
  %815 = getelementptr inbounds nuw %struct.ai_local, ptr %814, i32 0, i32 10, !dbg !2812
  store i32 196608, ptr %815, align 4, !dbg !2813
  %816 = load ptr, ptr %2, align 8, !dbg !2814
  %817 = load ptr, ptr %5, align 8, !dbg !2815
  %818 = load ptr, ptr %9, align 8, !dbg !2816
  call void @_Z19compute_vis_and_vecP6objectP10vms_vectorP8ai_localS2_PiP10robot_infoS5_(ptr noundef %816, ptr noundef %17, ptr noundef %817, ptr noundef %7, ptr noundef %10, ptr noundef %818, ptr noundef %14), !dbg !2817
  %819 = load i32, ptr %10, align 4, !dbg !2818
  %820 = icmp eq i32 %819, 1, !dbg !2820
  br i1 %820, label %821, label %822, !dbg !2820

821:                                              ; preds = %811
  store i32 2, ptr %10, align 4, !dbg !2821
  br label %822, !dbg !2823

822:                                              ; preds = %821, %811
  br label %823, !dbg !2824

823:                                              ; preds = %822, %803
  br label %824, !dbg !2825

824:                                              ; preds = %823, %784, %781, %777
  br label %825

825:                                              ; preds = %824, %776
  %826 = load ptr, ptr %4, align 8, !dbg !2826
  %827 = getelementptr inbounds nuw %struct.ai_static, ptr %826, i32 0, i32 1, !dbg !2828
  %828 = getelementptr inbounds [11 x i8], ptr %827, i64 0, i64 2, !dbg !2826
  %829 = load i8, ptr %828, align 1, !dbg !2826
  %830 = sext i8 %829 to i32, !dbg !2826
  %831 = icmp eq i32 %830, 4, !dbg !2829
  br i1 %831, label %832, label %843, !dbg !2830

832:                                              ; preds = %825
  %833 = load ptr, ptr %4, align 8, !dbg !2831
  %834 = getelementptr inbounds nuw %struct.ai_static, ptr %833, i32 0, i32 1, !dbg !2832
  %835 = getelementptr inbounds [11 x i8], ptr %834, i64 0, i64 1, !dbg !2831
  %836 = load i8, ptr %835, align 1, !dbg !2831
  %837 = sext i8 %836 to i32, !dbg !2831
  %838 = icmp eq i32 %837, 4, !dbg !2833
  br i1 %838, label %839, label %843, !dbg !2830

839:                                              ; preds = %832
  %840 = load ptr, ptr %4, align 8, !dbg !2834
  %841 = getelementptr inbounds nuw %struct.ai_static, ptr %840, i32 0, i32 1, !dbg !2835
  %842 = getelementptr inbounds [11 x i8], ptr %841, i64 0, i64 2, !dbg !2834
  store i8 3, ptr %842, align 1, !dbg !2836
  br label %843, !dbg !2834

843:                                              ; preds = %839, %832, %825
  %844 = load i32, ptr @Animation_enabled, align 4, !dbg !2837
  %845 = icmp ne i32 %844, 0, !dbg !2837
  br i1 %845, label %846, label %857, !dbg !2839

846:                                              ; preds = %843
  %847 = load i32, ptr %6, align 4, !dbg !2840
  %848 = icmp slt i32 %847, 6553600, !dbg !2841
  br i1 %848, label %849, label %857, !dbg !2839

849:                                              ; preds = %846
  %850 = load ptr, ptr %2, align 8, !dbg !2842
  %851 = call noundef i32 @_Z18do_silly_animationP6object(ptr noundef %850), !dbg !2844
  store i32 %851, ptr %12, align 4, !dbg !2845
  %852 = load i32, ptr %12, align 4, !dbg !2846
  %853 = icmp ne i32 %852, 0, !dbg !2846
  br i1 %853, label %854, label %856, !dbg !2846

854:                                              ; preds = %849
  %855 = load ptr, ptr %2, align 8, !dbg !2848
  call void @_Z18ai_frame_animationP6object(ptr noundef %855), !dbg !2849
  br label %856, !dbg !2849

856:                                              ; preds = %854, %849
  br label %865, !dbg !2850

857:                                              ; preds = %846, %843
  %858 = load ptr, ptr %4, align 8, !dbg !2851
  %859 = getelementptr inbounds nuw %struct.ai_static, ptr %858, i32 0, i32 1, !dbg !2853
  %860 = getelementptr inbounds [11 x i8], ptr %859, i64 0, i64 2, !dbg !2851
  %861 = load i8, ptr %860, align 1, !dbg !2851
  %862 = load ptr, ptr %4, align 8, !dbg !2854
  %863 = getelementptr inbounds nuw %struct.ai_static, ptr %862, i32 0, i32 1, !dbg !2855
  %864 = getelementptr inbounds [11 x i8], ptr %863, i64 0, i64 1, !dbg !2854
  store i8 %861, ptr %864, align 1, !dbg !2856
  store i32 0, ptr %12, align 4, !dbg !2857
  br label %865

865:                                              ; preds = %857, %856
  %866 = load ptr, ptr %2, align 8, !dbg !2858
  %867 = getelementptr inbounds nuw %struct.object, ptr %866, i32 0, i32 2, !dbg !2859
  %868 = load i8, ptr %867, align 1, !dbg !2859
  %869 = zext i8 %868 to i64, !dbg !2860
  %870 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %869, !dbg !2860
  %871 = getelementptr inbounds nuw %struct.robot_info, ptr %870, i32 0, i32 36, !dbg !2861
  %872 = load i8, ptr %871, align 4, !dbg !2861
  %873 = sext i8 %872 to i32, !dbg !2860
  switch i32 %873, label %876 [
    i32 0, label %874
    i32 1, label %875
    i32 2, label %875
  ], !dbg !2862

874:                                              ; preds = %865
  br label %922, !dbg !2863

875:                                              ; preds = %865, %865
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 1, ptr noundef @.str.25), !dbg !2865
  br label %922, !dbg !2866

876:                                              ; preds = %865
    #dbg_declare(ptr %24, !2867, !DIExpression(), !2869)
    #dbg_declare(ptr %25, !2870, !DIExpression(), !2871)
  %877 = load i32, ptr %6, align 4, !dbg !2872
  %878 = sdiv i32 %877, 4, !dbg !2873
  store i32 %878, ptr %25, align 4, !dbg !2871
  %879 = load ptr, ptr %4, align 8, !dbg !2874
  %880 = getelementptr inbounds nuw %struct.ai_static, ptr %879, i32 0, i32 1, !dbg !2876
  %881 = getelementptr inbounds [11 x i8], ptr %880, i64 0, i64 2, !dbg !2874
  %882 = load i8, ptr %881, align 1, !dbg !2874
  %883 = sext i8 %882 to i32, !dbg !2874
  %884 = icmp eq i32 %883, 4, !dbg !2877
  br i1 %884, label %885, label %889, !dbg !2877

885:                                              ; preds = %876
  %886 = load ptr, ptr %4, align 8, !dbg !2878
  %887 = getelementptr inbounds nuw %struct.ai_static, ptr %886, i32 0, i32 1, !dbg !2879
  %888 = getelementptr inbounds [11 x i8], ptr %887, i64 0, i64 2, !dbg !2878
  store i8 5, ptr %888, align 1, !dbg !2880
  br label %889, !dbg !2878

889:                                              ; preds = %885, %876
  %890 = load ptr, ptr %4, align 8, !dbg !2881
  %891 = getelementptr inbounds nuw %struct.ai_static, ptr %890, i32 0, i32 1, !dbg !2883
  %892 = getelementptr inbounds [11 x i8], ptr %891, i64 0, i64 1, !dbg !2881
  %893 = load i8, ptr %892, align 1, !dbg !2881
  %894 = sext i8 %893 to i32, !dbg !2881
  %895 = icmp eq i32 %894, 4, !dbg !2884
  br i1 %895, label %896, label %900, !dbg !2884

896:                                              ; preds = %889
  %897 = load ptr, ptr %4, align 8, !dbg !2885
  %898 = getelementptr inbounds nuw %struct.ai_static, ptr %897, i32 0, i32 1, !dbg !2886
  %899 = getelementptr inbounds [11 x i8], ptr %898, i64 0, i64 1, !dbg !2885
  store i8 5, ptr %899, align 1, !dbg !2887
  br label %900, !dbg !2885

900:                                              ; preds = %896, %889
  %901 = load ptr, ptr %2, align 8, !dbg !2888
  %902 = load ptr, ptr %5, align 8, !dbg !2889
  %903 = load ptr, ptr %9, align 8, !dbg !2890
  call void @_Z19compute_vis_and_vecP6objectP10vms_vectorP8ai_localS2_PiP10robot_infoS5_(ptr noundef %901, ptr noundef %17, ptr noundef %902, ptr noundef %7, ptr noundef %10, ptr noundef %903, ptr noundef %14), !dbg !2891
  %904 = load i32, ptr %10, align 4, !dbg !2892
  store i32 %904, ptr %24, align 4, !dbg !2893
  %905 = load i32, ptr @Player_num, align 4, !dbg !2894
  %906 = sext i32 %905 to i64, !dbg !2896
  %907 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %906, !dbg !2896
  %908 = getelementptr inbounds nuw %struct.player, ptr %907, i32 0, i32 7, !dbg !2897
  %909 = load i32, ptr %908, align 4, !dbg !2897
  %910 = and i32 %909, 2048, !dbg !2898
  %911 = icmp ne i32 %910, 0, !dbg !2896
  br i1 %911, label %912, label %919, !dbg !2896

912:                                              ; preds = %900
  store i32 0, ptr %24, align 4, !dbg !2899
  %913 = load ptr, ptr @ConsoleObject, align 8, !dbg !2901
  %914 = getelementptr inbounds nuw %struct.object, ptr %913, i32 0, i32 11, !dbg !2902
  %915 = load ptr, ptr %2, align 8, !dbg !2903
  %916 = getelementptr inbounds nuw %struct.object, ptr %915, i32 0, i32 11, !dbg !2904
  %917 = call noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef %914, ptr noundef %916), !dbg !2905
  %918 = sdiv i32 %917, 4, !dbg !2906
  store i32 %918, ptr %25, align 4, !dbg !2907
  br label %919, !dbg !2908

919:                                              ; preds = %912, %900
  %920 = load ptr, ptr %2, align 8, !dbg !2909
  %921 = load i32, ptr %24, align 4, !dbg !2910
  call void @_Z13do_boss_stuffP6objecti(ptr noundef %920, i32 noundef %921), !dbg !2911
  br label %922, !dbg !2912

922:                                              ; preds = %919, %875, %874
  %923 = load ptr, ptr %4, align 8, !dbg !2913
  %924 = getelementptr inbounds nuw %struct.ai_static, ptr %923, i32 0, i32 0, !dbg !2915
  %925 = load i8, ptr %924, align 4, !dbg !2915
  %926 = zext i8 %925 to i32, !dbg !2913
  %927 = icmp eq i32 %926, 132, !dbg !2916
  br i1 %927, label %928, label %933, !dbg !2917

928:                                              ; preds = %922
  %929 = load ptr, ptr %5, align 8, !dbg !2918
  %930 = getelementptr inbounds nuw %struct.ai_local, ptr %929, i32 0, i32 3, !dbg !2919
  %931 = load i32, ptr %930, align 4, !dbg !2919
  %932 = icmp ne i32 %931, 14, !dbg !2920
  br i1 %932, label %1000, label %933, !dbg !2921

933:                                              ; preds = %928, %922
  %934 = load ptr, ptr %9, align 8, !dbg !2922
  %935 = getelementptr inbounds nuw %struct.robot_info, ptr %934, i32 0, i32 37, !dbg !2923
  %936 = load i8, ptr %935, align 1, !dbg !2923
  %937 = icmp ne i8 %936, 0, !dbg !2922
  br i1 %937, label %1000, label %938, !dbg !2924

938:                                              ; preds = %933
  %939 = load ptr, ptr %9, align 8, !dbg !2925
  %940 = getelementptr inbounds nuw %struct.robot_info, ptr %939, i32 0, i32 40, !dbg !2926
  %941 = load i8, ptr %940, align 4, !dbg !2926
  %942 = icmp ne i8 %941, 0, !dbg !2925
  br i1 %942, label %1000, label %943, !dbg !2927

943:                                              ; preds = %938
  %944 = load ptr, ptr %5, align 8, !dbg !2928
  %945 = getelementptr inbounds nuw %struct.ai_local, ptr %944, i32 0, i32 0, !dbg !2929
  %946 = load i32, ptr %945, align 4, !dbg !2929
  %947 = icmp slt i32 %946, 3, !dbg !2930
  br i1 %947, label %948, label %1000, !dbg !2927

948:                                              ; preds = %943
  %949 = load i32, ptr @Break_on_object, align 4, !dbg !2931
  %950 = load i32, ptr %3, align 4, !dbg !2934
  %951 = icmp ne i32 %949, %950, !dbg !2935
  br i1 %951, label %952, label %999, !dbg !2935

952:                                              ; preds = %948
  %953 = load ptr, ptr %4, align 8, !dbg !2936
  %954 = getelementptr inbounds nuw %struct.ai_static, ptr %953, i32 0, i32 0, !dbg !2939
  %955 = load i8, ptr %954, align 4, !dbg !2939
  %956 = zext i8 %955 to i32, !dbg !2936
  %957 = icmp eq i32 %956, 133, !dbg !2940
  br i1 %957, label %958, label %978, !dbg !2941

958:                                              ; preds = %952
  %959 = load ptr, ptr %5, align 8, !dbg !2942
  %960 = getelementptr inbounds nuw %struct.ai_local, ptr %959, i32 0, i32 3, !dbg !2943
  %961 = load i32, ptr %960, align 4, !dbg !2943
  %962 = icmp eq i32 %961, 2, !dbg !2944
  br i1 %962, label %963, label %978, !dbg !2945

963:                                              ; preds = %958
  %964 = load ptr, ptr %4, align 8, !dbg !2946
  %965 = getelementptr inbounds nuw %struct.ai_static, ptr %964, i32 0, i32 2, !dbg !2947
  %966 = load i16, ptr %965, align 4, !dbg !2947
  %967 = sext i16 %966 to i32, !dbg !2946
  %968 = load ptr, ptr %2, align 8, !dbg !2948
  %969 = getelementptr inbounds nuw %struct.object, ptr %968, i32 0, i32 9, !dbg !2949
  %970 = load i16, ptr %969, align 2, !dbg !2949
  %971 = sext i16 %970 to i32, !dbg !2948
  %972 = icmp ne i32 %967, %971, !dbg !2950
  br i1 %972, label %973, label %978, !dbg !2945

973:                                              ; preds = %963
  %974 = load i32, ptr %6, align 4, !dbg !2951
  %975 = icmp sgt i32 %974, 16384000, !dbg !2954
  br i1 %975, label %976, label %977, !dbg !2954

976:                                              ; preds = %973
  br label %2900, !dbg !2955

977:                                              ; preds = %973
  br label %998, !dbg !2956

978:                                              ; preds = %963, %958, %952
  %979 = load ptr, ptr %5, align 8, !dbg !2957
  %980 = getelementptr inbounds nuw %struct.ai_local, ptr %979, i32 0, i32 4, !dbg !2959
  %981 = load i32, ptr %980, align 4, !dbg !2959
  %982 = icmp ne i32 %981, 0, !dbg !2957
  br i1 %982, label %997, label %983, !dbg !2960

983:                                              ; preds = %978
  %984 = load i32, ptr %6, align 4, !dbg !2961
  %985 = ashr i32 %984, 7, !dbg !2962
  %986 = load ptr, ptr %5, align 8, !dbg !2963
  %987 = getelementptr inbounds nuw %struct.ai_local, ptr %986, i32 0, i32 14, !dbg !2964
  %988 = load i32, ptr %987, align 4, !dbg !2964
  %989 = icmp sgt i32 %985, %988, !dbg !2965
  br i1 %989, label %990, label %997, !dbg !2960

990:                                              ; preds = %983
  %991 = load ptr, ptr %9, align 8, !dbg !2966
  %992 = getelementptr inbounds nuw %struct.robot_info, ptr %991, i32 0, i32 40, !dbg !2969
  %993 = load i8, ptr %992, align 4, !dbg !2969
  %994 = icmp ne i8 %993, 0, !dbg !2966
  br i1 %994, label %995, label %996, !dbg !2966

995:                                              ; preds = %990
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.26), !dbg !2970
  br label %996, !dbg !2970

996:                                              ; preds = %995, %990
  br label %2900, !dbg !2971

997:                                              ; preds = %983, %978
  br label %998

998:                                              ; preds = %997, %977
  br label %999, !dbg !2972

999:                                              ; preds = %998, %948
  br label %1000, !dbg !2973

1000:                                             ; preds = %999, %943, %938, %933, %928
  %1001 = load i32, ptr %3, align 4, !dbg !2974
  %1002 = and i32 %1001, 3, !dbg !2975
  %1003 = load i32, ptr @FrameTime, align 4, !dbg !2976
  %1004 = mul nsw i32 %1002, %1003, !dbg !2977
  %1005 = sub nsw i32 0, %1004, !dbg !2978
  %1006 = sdiv i32 %1005, 2, !dbg !2979
  %1007 = load ptr, ptr %5, align 8, !dbg !2980
  %1008 = getelementptr inbounds nuw %struct.ai_local, ptr %1007, i32 0, i32 14, !dbg !2981
  store i32 %1006, ptr %1008, align 4, !dbg !2982
  %1009 = load ptr, ptr %2, align 8, !dbg !2983
  %1010 = getelementptr inbounds nuw %struct.object, ptr %1009, i32 0, i32 2, !dbg !2984
  %1011 = load i8, ptr %1010, align 1, !dbg !2984
  %1012 = zext i8 %1011 to i32, !dbg !2983
  switch i32 %1012, label %1110 [
    i32 7, label %1013
  ], !dbg !2985

1013:                                             ; preds = %1000
  %1014 = load ptr, ptr @ConsoleObject, align 8, !dbg !2986
  %1015 = getelementptr inbounds nuw %struct.object, ptr %1014, i32 0, i32 9, !dbg !2989
  %1016 = load i16, ptr %1015, align 2, !dbg !2989
  %1017 = sext i16 %1016 to i32, !dbg !2986
  %1018 = load ptr, ptr %2, align 8, !dbg !2990
  %1019 = getelementptr inbounds nuw %struct.object, ptr %1018, i32 0, i32 9, !dbg !2991
  %1020 = load i16, ptr %1019, align 2, !dbg !2991
  %1021 = sext i16 %1020 to i32, !dbg !2990
  %1022 = icmp eq i32 %1017, %1021, !dbg !2992
  br i1 %1022, label %1023, label %1034, !dbg !2992

1023:                                             ; preds = %1013
  %1024 = load ptr, ptr %2, align 8, !dbg !2993
  %1025 = call noundef i32 @_Z24ai_multiplayer_awarenessP6objecti(ptr noundef %1024, i32 noundef 97), !dbg !2996
  %1026 = icmp ne i32 %1025, 0, !dbg !2996
  br i1 %1026, label %1028, label %1027, !dbg !2997

1027:                                             ; preds = %1023
  br label %2900, !dbg !2998

1028:                                             ; preds = %1023
  %1029 = load ptr, ptr %2, align 8, !dbg !2999
  %1030 = load ptr, ptr %5, align 8, !dbg !3000
  %1031 = load ptr, ptr %9, align 8, !dbg !3001
  call void @_Z19compute_vis_and_vecP6objectP10vms_vectorP8ai_localS2_PiP10robot_infoS5_(ptr noundef %1029, ptr noundef %17, ptr noundef %1030, ptr noundef %7, ptr noundef %10, ptr noundef %1031, ptr noundef %14), !dbg !3002
  %1032 = load ptr, ptr %2, align 8, !dbg !3003
  call void @_Z21move_away_from_playerP6objectP10vms_vectori(ptr noundef %1032, ptr noundef %7, i32 noundef 0), !dbg !3004
  %1033 = load i32, ptr %3, align 4, !dbg !3005
  call void @_Z28ai_multi_send_robot_positionii(i32 noundef %1033, i32 noundef -1), !dbg !3006
  br label %1109, !dbg !3007

1034:                                             ; preds = %1013
  %1035 = load ptr, ptr %5, align 8, !dbg !3008
  %1036 = getelementptr inbounds nuw %struct.ai_local, ptr %1035, i32 0, i32 3, !dbg !3010
  %1037 = load i32, ptr %1036, align 4, !dbg !3010
  %1038 = icmp ne i32 %1037, 0, !dbg !3011
  br i1 %1038, label %1039, label %1091, !dbg !3011

1039:                                             ; preds = %1034
    #dbg_declare(ptr %26, !3012, !DIExpression(), !3014)
  %1040 = load ptr, ptr %2, align 8, !dbg !3015
  %1041 = getelementptr inbounds nuw %struct.object, ptr %1040, i32 0, i32 9, !dbg !3016
  %1042 = load i16, ptr %1041, align 2, !dbg !3016
  %1043 = sext i16 %1042 to i32, !dbg !3015
  %1044 = call noundef i32 @_Z25openable_doors_in_segmenti(i32 noundef %1043), !dbg !3017
  store i32 %1044, ptr %26, align 4, !dbg !3018
  %1045 = load i32, ptr %26, align 4, !dbg !3019
  %1046 = icmp ne i32 %1045, -1, !dbg !3021
  br i1 %1046, label %1047, label %1055, !dbg !3021

1047:                                             ; preds = %1039
  %1048 = load ptr, ptr %5, align 8, !dbg !3022
  %1049 = getelementptr inbounds nuw %struct.ai_local, ptr %1048, i32 0, i32 3, !dbg !3024
  store i32 7, ptr %1049, align 4, !dbg !3025
  %1050 = load i32, ptr %26, align 4, !dbg !3026
  %1051 = trunc i32 %1050 to i8, !dbg !3026
  %1052 = load ptr, ptr %4, align 8, !dbg !3027
  %1053 = getelementptr inbounds nuw %struct.ai_static, ptr %1052, i32 0, i32 1, !dbg !3028
  %1054 = getelementptr inbounds [11 x i8], ptr %1053, i64 0, i64 5, !dbg !3027
  store i8 %1051, ptr %1054, align 1, !dbg !3029
  br label %1071, !dbg !3030

1055:                                             ; preds = %1039
  %1056 = load ptr, ptr %5, align 8, !dbg !3031
  %1057 = getelementptr inbounds nuw %struct.ai_local, ptr %1056, i32 0, i32 3, !dbg !3033
  %1058 = load i32, ptr %1057, align 4, !dbg !3033
  %1059 = icmp ne i32 %1058, 2, !dbg !3034
  br i1 %1059, label %1060, label %1070, !dbg !3034

1060:                                             ; preds = %1055
  %1061 = load ptr, ptr %2, align 8, !dbg !3035
  %1062 = call noundef i32 @_Z24ai_multiplayer_awarenessP6objecti(ptr noundef %1061, i32 noundef 50), !dbg !3038
  %1063 = icmp ne i32 %1062, 0, !dbg !3038
  br i1 %1063, label %1065, label %1064, !dbg !3039

1064:                                             ; preds = %1060
  br label %2900, !dbg !3040

1065:                                             ; preds = %1060
  %1066 = load ptr, ptr %2, align 8, !dbg !3041
  %1067 = load i32, ptr @Difficulty_level, align 4, !dbg !3042
  %1068 = add nsw i32 8, %1067, !dbg !3043
  call void @_Z29create_n_segment_path_to_doorP6objectii(ptr noundef %1066, i32 noundef %1068, i32 noundef -1), !dbg !3044
  %1069 = load i32, ptr %3, align 4, !dbg !3045
  call void @_Z28ai_multi_send_robot_positionii(i32 noundef %1069, i32 noundef -1), !dbg !3046
  br label %1070, !dbg !3047

1070:                                             ; preds = %1065, %1055
  br label %1071

1071:                                             ; preds = %1070, %1047
  %1072 = load ptr, ptr %5, align 8, !dbg !3048
  %1073 = getelementptr inbounds nuw %struct.ai_local, ptr %1072, i32 0, i32 7, !dbg !3050
  %1074 = load i32, ptr %1073, align 4, !dbg !3050
  %1075 = icmp slt i32 %1074, 0, !dbg !3051
  br i1 %1075, label %1076, label %1090, !dbg !3051

1076:                                             ; preds = %1071
  %1077 = load ptr, ptr %2, align 8, !dbg !3052
  %1078 = load ptr, ptr %5, align 8, !dbg !3054
  %1079 = load ptr, ptr %9, align 8, !dbg !3055
  call void @_Z19compute_vis_and_vecP6objectP10vms_vectorP8ai_localS2_PiP10robot_infoS5_(ptr noundef %1077, ptr noundef %17, ptr noundef %1078, ptr noundef %7, ptr noundef %10, ptr noundef %1079, ptr noundef %14), !dbg !3056
  %1080 = load i32, ptr %10, align 4, !dbg !3057
  %1081 = icmp ne i32 %1080, 0, !dbg !3057
  br i1 %1081, label %1082, label %1089, !dbg !3057

1082:                                             ; preds = %1076
  call void @_Z23make_nearby_robot_snipev(), !dbg !3059
  %1083 = load i32, ptr @Difficulty_level, align 4, !dbg !3061
  %1084 = sub nsw i32 5, %1083, !dbg !3062
  %1085 = mul nsw i32 %1084, 2, !dbg !3063
  %1086 = mul nsw i32 %1085, 65536, !dbg !3064
  %1087 = load ptr, ptr %5, align 8, !dbg !3065
  %1088 = getelementptr inbounds nuw %struct.ai_local, ptr %1087, i32 0, i32 7, !dbg !3066
  store i32 %1086, ptr %1088, align 4, !dbg !3067
  br label %1089, !dbg !3068

1089:                                             ; preds = %1082, %1076
  br label %1090, !dbg !3069

1090:                                             ; preds = %1089, %1071
  br label %1108, !dbg !3070

1091:                                             ; preds = %1034
  %1092 = load ptr, ptr %2, align 8, !dbg !3071
  %1093 = load ptr, ptr %5, align 8, !dbg !3073
  %1094 = load ptr, ptr %9, align 8, !dbg !3074
  call void @_Z19compute_vis_and_vecP6objectP10vms_vectorP8ai_localS2_PiP10robot_infoS5_(ptr noundef %1092, ptr noundef %17, ptr noundef %1093, ptr noundef %7, ptr noundef %10, ptr noundef %1094, ptr noundef %14), !dbg !3075
  %1095 = load i32, ptr %10, align 4, !dbg !3076
  %1096 = icmp ne i32 %1095, 0, !dbg !3076
  br i1 %1096, label %1097, label %1107, !dbg !3076

1097:                                             ; preds = %1091
  %1098 = load ptr, ptr %2, align 8, !dbg !3078
  %1099 = call noundef i32 @_Z24ai_multiplayer_awarenessP6objecti(ptr noundef %1098, i32 noundef 50), !dbg !3081
  %1100 = icmp ne i32 %1099, 0, !dbg !3081
  br i1 %1100, label %1102, label %1101, !dbg !3082

1101:                                             ; preds = %1097
  br label %2900, !dbg !3083

1102:                                             ; preds = %1097
  %1103 = load ptr, ptr %2, align 8, !dbg !3084
  %1104 = load i32, ptr @Difficulty_level, align 4, !dbg !3085
  %1105 = add nsw i32 8, %1104, !dbg !3086
  call void @_Z29create_n_segment_path_to_doorP6objectii(ptr noundef %1103, i32 noundef %1105, i32 noundef -1), !dbg !3087
  %1106 = load i32, ptr %3, align 4, !dbg !3088
  call void @_Z28ai_multi_send_robot_positionii(i32 noundef %1106, i32 noundef -1), !dbg !3089
  br label %1107, !dbg !3090

1107:                                             ; preds = %1102, %1091
  br label %1108

1108:                                             ; preds = %1107, %1090
  br label %1109

1109:                                             ; preds = %1108, %1028
  br label %1111, !dbg !3091

1110:                                             ; preds = %1000
  br label %1111, !dbg !3092

1111:                                             ; preds = %1110, %1109
  %1112 = load ptr, ptr %4, align 8, !dbg !3093
  %1113 = getelementptr inbounds nuw %struct.ai_static, ptr %1112, i32 0, i32 0, !dbg !3095
  %1114 = load i8, ptr %1113, align 4, !dbg !3095
  %1115 = zext i8 %1114 to i32, !dbg !3093
  %1116 = icmp eq i32 %1115, 132, !dbg !3096
  br i1 %1116, label %1117, label %1186, !dbg !3096

1117:                                             ; preds = %1111
  %1118 = load i32, ptr @Game_mode, align 4, !dbg !3097
  %1119 = and i32 %1118, 38, !dbg !3100
  %1120 = icmp ne i32 %1119, 0, !dbg !3101
  br i1 %1120, label %1121, label %1131, !dbg !3102

1121:                                             ; preds = %1117
  %1122 = load ptr, ptr %9, align 8, !dbg !3103
  %1123 = getelementptr inbounds nuw %struct.robot_info, ptr %1122, i32 0, i32 40, !dbg !3104
  %1124 = load i8, ptr %1123, align 4, !dbg !3104
  %1125 = icmp ne i8 %1124, 0, !dbg !3103
  br i1 %1125, label %1131, label %1126, !dbg !3102

1126:                                             ; preds = %1121
  %1127 = load ptr, ptr %4, align 8, !dbg !3105
  %1128 = getelementptr inbounds nuw %struct.ai_static, ptr %1127, i32 0, i32 0, !dbg !3107
  store i8 -127, ptr %1128, align 4, !dbg !3108
  %1129 = load ptr, ptr %5, align 8, !dbg !3109
  %1130 = getelementptr inbounds nuw %struct.ai_local, ptr %1129, i32 0, i32 3, !dbg !3110
  store i32 3, ptr %1130, align 4, !dbg !3111
  br label %2900, !dbg !3112

1131:                                             ; preds = %1121, %1117
  %1132 = load i32, ptr %11, align 4, !dbg !3113
  %1133 = and i32 %1132, 3, !dbg !3115
  %1134 = icmp ne i32 %1133, 0, !dbg !3116
  br i1 %1134, label %1135, label %1138, !dbg !3117

1135:                                             ; preds = %1131
  %1136 = load i32, ptr %15, align 4, !dbg !3118
  %1137 = icmp ne i32 %1136, 0, !dbg !3118
  br i1 %1137, label %1138, label %1173, !dbg !3117

1138:                                             ; preds = %1135, %1131
  %1139 = load ptr, ptr %2, align 8, !dbg !3119
  %1140 = load ptr, ptr %5, align 8, !dbg !3121
  %1141 = load ptr, ptr %9, align 8, !dbg !3122
  call void @_Z19compute_vis_and_vecP6objectP10vms_vectorP8ai_localS2_PiP10robot_infoS5_(ptr noundef %1139, ptr noundef %17, ptr noundef %1140, ptr noundef %7, ptr noundef %10, ptr noundef %1141, ptr noundef %14), !dbg !3123
  %1142 = load ptr, ptr %5, align 8, !dbg !3124
  %1143 = getelementptr inbounds nuw %struct.ai_local, ptr %1142, i32 0, i32 3, !dbg !3126
  %1144 = load i32, ptr %1143, align 4, !dbg !3126
  %1145 = icmp eq i32 %1144, 0, !dbg !3127
  br i1 %1145, label %1146, label %1158, !dbg !3127

1146:                                             ; preds = %1138
  %1147 = load i32, ptr %10, align 4, !dbg !3128
  %1148 = icmp ne i32 %1147, 0, !dbg !3128
  br i1 %1148, label %1154, label %1149, !dbg !3130

1149:                                             ; preds = %1146
  %1150 = load ptr, ptr %5, align 8, !dbg !3131
  %1151 = getelementptr inbounds nuw %struct.ai_local, ptr %1150, i32 0, i32 0, !dbg !3132
  %1152 = load i32, ptr %1151, align 4, !dbg !3132
  %1153 = icmp eq i32 %1152, 4, !dbg !3133
  br i1 %1153, label %1154, label %1157, !dbg !3130

1154:                                             ; preds = %1149, %1146
  %1155 = load ptr, ptr %5, align 8, !dbg !3134
  %1156 = getelementptr inbounds nuw %struct.ai_local, ptr %1155, i32 0, i32 3, !dbg !3135
  store i32 10, ptr %1156, align 4, !dbg !3136
  br label %1157, !dbg !3134

1157:                                             ; preds = %1154, %1149
  br label %1158, !dbg !3137

1158:                                             ; preds = %1157, %1138
  %1159 = load ptr, ptr %9, align 8, !dbg !3138
  %1160 = getelementptr inbounds nuw %struct.robot_info, ptr %1159, i32 0, i32 40, !dbg !3140
  %1161 = load i8, ptr %1160, align 4, !dbg !3140
  %1162 = icmp ne i8 %1161, 0, !dbg !3138
  br i1 %1162, label %1172, label %1163, !dbg !3141

1163:                                             ; preds = %1158
  %1164 = load ptr, ptr %5, align 8, !dbg !3142
  %1165 = getelementptr inbounds nuw %struct.ai_local, ptr %1164, i32 0, i32 3, !dbg !3143
  %1166 = load i32, ptr %1165, align 4, !dbg !3143
  %1167 = icmp ne i32 %1166, 0, !dbg !3144
  br i1 %1167, label %1168, label %1172, !dbg !3141

1168:                                             ; preds = %1163
  %1169 = load ptr, ptr %2, align 8, !dbg !3145
  %1170 = load i32, ptr %6, align 4, !dbg !3146
  %1171 = load i32, ptr %10, align 4, !dbg !3147
  call void @_Z14do_snipe_frameP6objectiiP10vms_vector(ptr noundef %1169, i32 noundef %1170, i32 noundef %1171, ptr noundef %7), !dbg !3148
  br label %1172, !dbg !3148

1172:                                             ; preds = %1168, %1163, %1158
  br label %1185, !dbg !3149

1173:                                             ; preds = %1135
  %1174 = load ptr, ptr %9, align 8, !dbg !3150
  %1175 = getelementptr inbounds nuw %struct.robot_info, ptr %1174, i32 0, i32 40, !dbg !3152
  %1176 = load i8, ptr %1175, align 4, !dbg !3152
  %1177 = icmp ne i8 %1176, 0, !dbg !3150
  br i1 %1177, label %1184, label %1178, !dbg !3153

1178:                                             ; preds = %1173
  %1179 = load ptr, ptr %9, align 8, !dbg !3154
  %1180 = getelementptr inbounds nuw %struct.robot_info, ptr %1179, i32 0, i32 37, !dbg !3155
  %1181 = load i8, ptr %1180, align 1, !dbg !3155
  %1182 = icmp ne i8 %1181, 0, !dbg !3154
  br i1 %1182, label %1184, label %1183, !dbg !3153

1183:                                             ; preds = %1178
  br label %2900, !dbg !3156

1184:                                             ; preds = %1178, %1173
  br label %1185

1185:                                             ; preds = %1184, %1172
  br label %1186, !dbg !3157

1186:                                             ; preds = %1185, %1111
  %1187 = load ptr, ptr %9, align 8, !dbg !3158
  %1188 = getelementptr inbounds nuw %struct.robot_info, ptr %1187, i32 0, i32 37, !dbg !3160
  %1189 = load i8, ptr %1188, align 1, !dbg !3160
  %1190 = icmp ne i8 %1189, 0, !dbg !3158
  br i1 %1190, label %1191, label %1390, !dbg !3158

1191:                                             ; preds = %1186
  %1192 = load ptr, ptr %2, align 8, !dbg !3161
  %1193 = load ptr, ptr %5, align 8, !dbg !3163
  %1194 = load ptr, ptr %9, align 8, !dbg !3164
  call void @_Z19compute_vis_and_vecP6objectP10vms_vectorP8ai_localS2_PiP10robot_infoS5_(ptr noundef %1192, ptr noundef %17, ptr noundef %1193, ptr noundef %7, ptr noundef %10, ptr noundef %1194, ptr noundef %14), !dbg !3165
  %1195 = load i32, ptr %3, align 4, !dbg !3166
  %1196 = icmp eq i32 %1195, 28, !dbg !3168
  br i1 %1196, label %1197, label %1212, !dbg !3169

1197:                                             ; preds = %1191
  %1198 = load i32, ptr @GameTime, align 4, !dbg !3170
  %1199 = icmp sgt i32 %1198, 253000, !dbg !3171
  br i1 %1199, label %1200, label %1212, !dbg !3172

1200:                                             ; preds = %1197
  %1201 = load i32, ptr @GameTime, align 4, !dbg !3173
  %1202 = icmp slt i32 %1201, 255000, !dbg !3174
  br i1 %1202, label %1203, label %1212, !dbg !3172

1203:                                             ; preds = %1200
  %1204 = load ptr, ptr @__stderrp, align 8, !dbg !3175
  %1205 = load i32, ptr %6, align 4, !dbg !3176
  %1206 = load i32, ptr %10, align 4, !dbg !3177
  %1207 = load ptr, ptr %5, align 8, !dbg !3178
  %1208 = getelementptr inbounds nuw %struct.ai_local, ptr %1207, i32 0, i32 0, !dbg !3179
  %1209 = load i32, ptr %1208, align 4, !dbg !3179
  %1210 = load i32, ptr @GameTime, align 4, !dbg !3180
  %1211 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %1204, ptr noundef @.str.27, i32 noundef %1205, i32 noundef %1206, i32 noundef %1209, i32 noundef %1210) #6, !dbg !3181
  br label %1212, !dbg !3181

1212:                                             ; preds = %1203, %1200, %1197, %1191
  %1213 = load ptr, ptr %2, align 8, !dbg !3182
  %1214 = load i32, ptr %6, align 4, !dbg !3183
  %1215 = load i32, ptr %10, align 4, !dbg !3184
  call void @_Z15do_escort_frameP6objectii(ptr noundef %1213, i32 noundef %1214, i32 noundef %1215), !dbg !3185
  %1216 = load i32, ptr %3, align 4, !dbg !3186
  %1217 = icmp eq i32 %1216, 28, !dbg !3188
  br i1 %1217, label %1218, label %1234, !dbg !3189

1218:                                             ; preds = %1212
  %1219 = load i32, ptr @GameTime, align 4, !dbg !3190
  %1220 = icmp sgt i32 %1219, 253000, !dbg !3191
  br i1 %1220, label %1221, label %1234, !dbg !3192

1221:                                             ; preds = %1218
  %1222 = load i32, ptr @GameTime, align 4, !dbg !3193
  %1223 = icmp slt i32 %1222, 255000, !dbg !3194
  br i1 %1223, label %1224, label %1234, !dbg !3192

1224:                                             ; preds = %1221
  %1225 = load ptr, ptr @__stderrp, align 8, !dbg !3195
  %1226 = load ptr, ptr %5, align 8, !dbg !3196
  %1227 = getelementptr inbounds nuw %struct.ai_local, ptr %1226, i32 0, i32 0, !dbg !3197
  %1228 = load i32, ptr %1227, align 4, !dbg !3197
  %1229 = load ptr, ptr %5, align 8, !dbg !3198
  %1230 = getelementptr inbounds nuw %struct.ai_local, ptr %1229, i32 0, i32 3, !dbg !3199
  %1231 = load i32, ptr %1230, align 4, !dbg !3199
  %1232 = load i32, ptr @GameTime, align 4, !dbg !3200
  %1233 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %1225, ptr noundef @.str.28, i32 noundef %1228, i32 noundef %1231, i32 noundef %1232) #6, !dbg !3201
  br label %1234, !dbg !3201

1234:                                             ; preds = %1224, %1221, %1218, %1212
  %1235 = load ptr, ptr %2, align 8, !dbg !3202
  %1236 = getelementptr inbounds nuw %struct.object, ptr %1235, i32 0, i32 22, !dbg !3204
  %1237 = getelementptr inbounds nuw %struct.ai_static, ptr %1236, i32 0, i32 7, !dbg !3205
  %1238 = load i16, ptr %1237, align 4, !dbg !3205
  %1239 = sext i16 %1238 to i32, !dbg !3202
  %1240 = icmp ne i32 %1239, -1, !dbg !3206
  br i1 %1240, label %1241, label %1279, !dbg !3206

1241:                                             ; preds = %1234
    #dbg_declare(ptr %27, !3207, !DIExpression(), !3209)
  %1242 = load ptr, ptr %2, align 8, !dbg !3210
  %1243 = getelementptr inbounds nuw %struct.object, ptr %1242, i32 0, i32 22, !dbg !3211
  %1244 = getelementptr inbounds nuw %struct.ai_static, ptr %1243, i32 0, i32 7, !dbg !3212
  %1245 = load i16, ptr %1244, align 4, !dbg !3212
  %1246 = sext i16 %1245 to i64, !dbg !3213
  %1247 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %1246, !dbg !3213
  store ptr %1247, ptr %27, align 8, !dbg !3209
  %1248 = load ptr, ptr %27, align 8, !dbg !3214
  %1249 = getelementptr inbounds nuw %struct.object, ptr %1248, i32 0, i32 1, !dbg !3216
  %1250 = load i8, ptr %1249, align 4, !dbg !3216
  %1251 = zext i8 %1250 to i32, !dbg !3214
  %1252 = icmp eq i32 %1251, 5, !dbg !3217
  br i1 %1252, label %1253, label %1278, !dbg !3218

1253:                                             ; preds = %1241
  %1254 = load ptr, ptr %27, align 8, !dbg !3219
  %1255 = getelementptr inbounds nuw %struct.object, ptr %1254, i32 0, i32 0, !dbg !3220
  %1256 = load i32, ptr %1255, align 4, !dbg !3220
  %1257 = load ptr, ptr %2, align 8, !dbg !3221
  %1258 = getelementptr inbounds nuw %struct.object, ptr %1257, i32 0, i32 22, !dbg !3222
  %1259 = getelementptr inbounds nuw %struct.ai_static, ptr %1258, i32 0, i32 8, !dbg !3223
  %1260 = load i32, ptr %1259, align 4, !dbg !3223
  %1261 = icmp eq i32 %1256, %1260, !dbg !3224
  br i1 %1261, label %1262, label %1278, !dbg !3218

1262:                                             ; preds = %1253
    #dbg_declare(ptr %28, !3225, !DIExpression(), !3227)
  %1263 = load ptr, ptr %9, align 8, !dbg !3228
  %1264 = getelementptr inbounds nuw %struct.robot_info, ptr %1263, i32 0, i32 27, !dbg !3229
  %1265 = load i32, ptr @Difficulty_level, align 4, !dbg !3230
  %1266 = sext i32 %1265 to i64, !dbg !3228
  %1267 = getelementptr inbounds [5 x i32], ptr %1264, i64 0, i64 %1266, !dbg !3228
  %1268 = load i32, ptr %1267, align 4, !dbg !3228
  %1269 = load ptr, ptr @ConsoleObject, align 8, !dbg !3231
  %1270 = getelementptr inbounds nuw %struct.object, ptr %1269, i32 0, i32 13, !dbg !3232
  %1271 = load i32, ptr %1270, align 4, !dbg !3232
  %1272 = add nsw i32 %1268, %1271, !dbg !3233
  store i32 %1272, ptr %28, align 4, !dbg !3234
  %1273 = load ptr, ptr %2, align 8, !dbg !3235
  %1274 = load ptr, ptr %5, align 8, !dbg !3236
  %1275 = load i32, ptr %6, align 4, !dbg !3237
  %1276 = load i32, ptr %28, align 4, !dbg !3238
  %1277 = load i32, ptr %10, align 4, !dbg !3239
  call void @_Z26ai_move_relative_to_playerP6objectP8ai_localiP10vms_vectoriii(ptr noundef %1273, ptr noundef %1274, i32 noundef %1275, ptr noundef %7, i32 noundef %1276, i32 noundef 1, i32 noundef %1277), !dbg !3240
  br label %1278, !dbg !3241

1278:                                             ; preds = %1262, %1253, %1241
  br label %1279, !dbg !3242

1279:                                             ; preds = %1278, %1234
  %1280 = load ptr, ptr %9, align 8, !dbg !3243
  %1281 = load ptr, ptr %5, align 8, !dbg !3245
  %1282 = call noundef i32 @_Z13ready_to_fireP10robot_infoP8ai_local(ptr noundef %1280, ptr noundef %1281), !dbg !3246
  %1283 = icmp ne i32 %1282, 0, !dbg !3246
  br i1 %1283, label %1284, label %1389, !dbg !3246

1284:                                             ; preds = %1279
    #dbg_declare(ptr %29, !3247, !DIExpression(), !3249)
  store i32 0, ptr %29, align 4, !dbg !3249
  %1285 = load ptr, ptr %2, align 8, !dbg !3250
  %1286 = getelementptr inbounds nuw %struct.object, ptr %1285, i32 0, i32 9, !dbg !3252
  %1287 = load i16, ptr %1286, align 2, !dbg !3252
  %1288 = sext i16 %1287 to i32, !dbg !3250
  %1289 = call noundef i32 @_Z25openable_doors_in_segmenti(i32 noundef %1288), !dbg !3253
  %1290 = icmp ne i32 %1289, -1, !dbg !3254
  br i1 %1290, label %1291, label %1292, !dbg !3254

1291:                                             ; preds = %1284
  store i32 1, ptr %29, align 4, !dbg !3255
  br label %1358, !dbg !3256

1292:                                             ; preds = %1284
  %1293 = load ptr, ptr %4, align 8, !dbg !3257
  %1294 = getelementptr inbounds nuw %struct.ai_static, ptr %1293, i32 0, i32 3, !dbg !3259
  %1295 = load i16, ptr %1294, align 2, !dbg !3259
  %1296 = sext i16 %1295 to i32, !dbg !3257
  %1297 = load ptr, ptr %4, align 8, !dbg !3260
  %1298 = getelementptr inbounds nuw %struct.ai_static, ptr %1297, i32 0, i32 5, !dbg !3261
  %1299 = load i8, ptr %1298, align 2, !dbg !3261
  %1300 = sext i8 %1299 to i32, !dbg !3260
  %1301 = add nsw i32 %1296, %1300, !dbg !3262
  %1302 = load ptr, ptr %4, align 8, !dbg !3263
  %1303 = getelementptr inbounds nuw %struct.ai_static, ptr %1302, i32 0, i32 1, !dbg !3264
  %1304 = getelementptr inbounds [11 x i8], ptr %1303, i64 0, i64 3, !dbg !3263
  %1305 = load i8, ptr %1304, align 1, !dbg !3263
  %1306 = sext i8 %1305 to i32, !dbg !3263
  %1307 = add nsw i32 %1301, %1306, !dbg !3265
  %1308 = sext i32 %1307 to i64, !dbg !3266
  %1309 = getelementptr inbounds [2500 x %struct.point_seg], ptr @Point_segs, i64 0, i64 %1308, !dbg !3266
  %1310 = getelementptr inbounds nuw %struct.point_seg, ptr %1309, i32 0, i32 0, !dbg !3267
  %1311 = load i32, ptr %1310, align 4, !dbg !3267
  %1312 = call noundef i32 @_Z25openable_doors_in_segmenti(i32 noundef %1311), !dbg !3268
  %1313 = icmp ne i32 %1312, -1, !dbg !3269
  br i1 %1313, label %1314, label %1315, !dbg !3269

1314:                                             ; preds = %1292
  store i32 1, ptr %29, align 4, !dbg !3270
  br label %1357, !dbg !3271

1315:                                             ; preds = %1292
  %1316 = load ptr, ptr %4, align 8, !dbg !3272
  %1317 = getelementptr inbounds nuw %struct.ai_static, ptr %1316, i32 0, i32 3, !dbg !3274
  %1318 = load i16, ptr %1317, align 2, !dbg !3274
  %1319 = sext i16 %1318 to i32, !dbg !3272
  %1320 = load ptr, ptr %4, align 8, !dbg !3275
  %1321 = getelementptr inbounds nuw %struct.ai_static, ptr %1320, i32 0, i32 5, !dbg !3276
  %1322 = load i8, ptr %1321, align 2, !dbg !3276
  %1323 = sext i8 %1322 to i32, !dbg !3275
  %1324 = add nsw i32 %1319, %1323, !dbg !3277
  %1325 = load ptr, ptr %4, align 8, !dbg !3278
  %1326 = getelementptr inbounds nuw %struct.ai_static, ptr %1325, i32 0, i32 1, !dbg !3279
  %1327 = getelementptr inbounds [11 x i8], ptr %1326, i64 0, i64 3, !dbg !3278
  %1328 = load i8, ptr %1327, align 1, !dbg !3278
  %1329 = sext i8 %1328 to i32, !dbg !3278
  %1330 = mul nsw i32 2, %1329, !dbg !3280
  %1331 = add nsw i32 %1324, %1330, !dbg !3281
  %1332 = sext i32 %1331 to i64, !dbg !3282
  %1333 = getelementptr inbounds [2500 x %struct.point_seg], ptr @Point_segs, i64 0, i64 %1332, !dbg !3282
  %1334 = getelementptr inbounds nuw %struct.point_seg, ptr %1333, i32 0, i32 0, !dbg !3283
  %1335 = load i32, ptr %1334, align 4, !dbg !3283
  %1336 = call noundef i32 @_Z25openable_doors_in_segmenti(i32 noundef %1335), !dbg !3284
  %1337 = icmp ne i32 %1336, -1, !dbg !3285
  br i1 %1337, label %1338, label %1339, !dbg !3285

1338:                                             ; preds = %1315
  store i32 1, ptr %29, align 4, !dbg !3286
  br label %1356, !dbg !3287

1339:                                             ; preds = %1315
  %1340 = load ptr, ptr %5, align 8, !dbg !3288
  %1341 = getelementptr inbounds nuw %struct.ai_local, ptr %1340, i32 0, i32 3, !dbg !3290
  %1342 = load i32, ptr %1341, align 4, !dbg !3290
  %1343 = icmp eq i32 %1342, 8, !dbg !3291
  br i1 %1343, label %1344, label %1354, !dbg !3292

1344:                                             ; preds = %1339
  %1345 = load i32, ptr %6, align 4, !dbg !3293
  %1346 = icmp slt i32 %1345, 3932160, !dbg !3294
  br i1 %1346, label %1347, label %1354, !dbg !3295

1347:                                             ; preds = %1344
  %1348 = load ptr, ptr @ConsoleObject, align 8, !dbg !3296
  %1349 = getelementptr inbounds nuw %struct.object, ptr %1348, i32 0, i32 12, !dbg !3296
  %1350 = getelementptr inbounds nuw %struct.vms_matrix, ptr %1349, i32 0, i32 2, !dbg !3296
  %1351 = call noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef %1350, ptr noundef %7), !dbg !3296
  %1352 = icmp sgt i32 %1351, -16384, !dbg !3297
  br i1 %1352, label %1353, label %1354, !dbg !3295

1353:                                             ; preds = %1347
  store i32 1, ptr %29, align 4, !dbg !3298
  br label %1355, !dbg !3300

1354:                                             ; preds = %1347, %1344, %1339
  br label %1355

1355:                                             ; preds = %1354, %1353
  br label %1356

1356:                                             ; preds = %1355, %1338
  br label %1357

1357:                                             ; preds = %1356, %1314
  br label %1358

1358:                                             ; preds = %1357, %1291
  %1359 = load i32, ptr %29, align 4, !dbg !3301
  %1360 = icmp ne i32 %1359, 0, !dbg !3301
  br i1 %1360, label %1361, label %1388, !dbg !3301

1361:                                             ; preds = %1358
  %1362 = load ptr, ptr %2, align 8, !dbg !3303
  %1363 = getelementptr inbounds nuw %struct.object, ptr %1362, i32 0, i32 12, !dbg !3305
  %1364 = getelementptr inbounds nuw %struct.vms_matrix, ptr %1363, i32 0, i32 2, !dbg !3306
  %1365 = load ptr, ptr %2, align 8, !dbg !3307
  %1366 = getelementptr inbounds nuw %struct.object, ptr %1365, i32 0, i32 11, !dbg !3308
  %1367 = load ptr, ptr %2, align 8, !dbg !3309
  %1368 = ptrtoint ptr %1367 to i64, !dbg !3310
  %1369 = sub i64 %1368, ptrtoint (ptr @Objects to i64), !dbg !3310
  %1370 = sdiv exact i64 %1369, 268, !dbg !3310
  %1371 = trunc i64 %1370 to i32, !dbg !3309
  %1372 = call noundef i32 @_Z21Laser_create_new_easyP10vms_vectorS0_iii(ptr noundef %1364, ptr noundef %1366, i32 noundef %1371, i32 noundef 9, i32 noundef 1), !dbg !3311
  %1373 = load ptr, ptr %5, align 8, !dbg !3312
  %1374 = getelementptr inbounds nuw %struct.ai_local, ptr %1373, i32 0, i32 8, !dbg !3313
  store i32 32768, ptr %1374, align 4, !dbg !3314
  %1375 = load i32, ptr @Buddy_allowed_to_talk, align 4, !dbg !3315
  %1376 = icmp ne i32 %1375, 0, !dbg !3315
  br i1 %1376, label %1387, label %1377, !dbg !3317

1377:                                             ; preds = %1361
  %1378 = load i32, ptr @CurrentLogicVersion, align 4, !dbg !3318
  %1379 = icmp sgt i32 %1378, 0, !dbg !3319
  br i1 %1379, label %1380, label %1387, !dbg !3317

1380:                                             ; preds = %1377
  %1381 = call noundef i32 @_Z6P_Randv(), !dbg !3320
  %1382 = mul nsw i32 %1381, 4, !dbg !3321
  %1383 = load ptr, ptr %5, align 8, !dbg !3322
  %1384 = getelementptr inbounds nuw %struct.ai_local, ptr %1383, i32 0, i32 8, !dbg !3323
  %1385 = load i32, ptr %1384, align 4, !dbg !3324
  %1386 = add nsw i32 %1385, %1382, !dbg !3324
  store i32 %1386, ptr %1384, align 4, !dbg !3324
  br label %1387, !dbg !3322

1387:                                             ; preds = %1380, %1377, %1361
  br label %1388, !dbg !3325

1388:                                             ; preds = %1387, %1358
  br label %1389, !dbg !3326

1389:                                             ; preds = %1388, %1279
  br label %1390, !dbg !3327

1390:                                             ; preds = %1389, %1186
  %1391 = load ptr, ptr %9, align 8, !dbg !3328
  %1392 = getelementptr inbounds nuw %struct.robot_info, ptr %1391, i32 0, i32 40, !dbg !3330
  %1393 = load i8, ptr %1392, align 4, !dbg !3330
  %1394 = icmp ne i8 %1393, 0, !dbg !3328
  br i1 %1394, label %1395, label %1495, !dbg !3328

1395:                                             ; preds = %1390
  %1396 = load ptr, ptr %2, align 8, !dbg !3331
  %1397 = load ptr, ptr %5, align 8, !dbg !3333
  %1398 = load ptr, ptr %9, align 8, !dbg !3334
  call void @_Z19compute_vis_and_vecP6objectP10vms_vectorP8ai_localS2_PiP10robot_infoS5_(ptr noundef %1396, ptr noundef %17, ptr noundef %1397, ptr noundef %7, ptr noundef %10, ptr noundef %1398, ptr noundef %14), !dbg !3335
  %1399 = load ptr, ptr %2, align 8, !dbg !3336
  %1400 = load i32, ptr %6, align 4, !dbg !3337
  %1401 = load i32, ptr %10, align 4, !dbg !3338
  call void @_Z14do_thief_frameP6objectiiP10vms_vector(ptr noundef %1399, i32 noundef %1400, i32 noundef %1401, ptr noundef %7), !dbg !3339
  %1402 = load ptr, ptr %9, align 8, !dbg !3340
  %1403 = load ptr, ptr %5, align 8, !dbg !3342
  %1404 = call noundef i32 @_Z13ready_to_fireP10robot_infoP8ai_local(ptr noundef %1402, ptr noundef %1403), !dbg !3343
  %1405 = icmp ne i32 %1404, 0, !dbg !3343
  br i1 %1405, label %1406, label %1494, !dbg !3343

1406:                                             ; preds = %1395
    #dbg_declare(ptr %30, !3344, !DIExpression(), !3346)
  store i32 0, ptr %30, align 4, !dbg !3346
  %1407 = load ptr, ptr %2, align 8, !dbg !3347
  %1408 = getelementptr inbounds nuw %struct.object, ptr %1407, i32 0, i32 9, !dbg !3349
  %1409 = load i16, ptr %1408, align 2, !dbg !3349
  %1410 = sext i16 %1409 to i32, !dbg !3347
  %1411 = call noundef i32 @_Z25openable_doors_in_segmenti(i32 noundef %1410), !dbg !3350
  %1412 = icmp ne i32 %1411, -1, !dbg !3351
  br i1 %1412, label %1413, label %1414, !dbg !3351

1413:                                             ; preds = %1406
  store i32 1, ptr %30, align 4, !dbg !3352
  br label %1463, !dbg !3353

1414:                                             ; preds = %1406
  %1415 = load ptr, ptr %4, align 8, !dbg !3354
  %1416 = getelementptr inbounds nuw %struct.ai_static, ptr %1415, i32 0, i32 3, !dbg !3356
  %1417 = load i16, ptr %1416, align 2, !dbg !3356
  %1418 = sext i16 %1417 to i32, !dbg !3354
  %1419 = load ptr, ptr %4, align 8, !dbg !3357
  %1420 = getelementptr inbounds nuw %struct.ai_static, ptr %1419, i32 0, i32 5, !dbg !3358
  %1421 = load i8, ptr %1420, align 2, !dbg !3358
  %1422 = sext i8 %1421 to i32, !dbg !3357
  %1423 = add nsw i32 %1418, %1422, !dbg !3359
  %1424 = load ptr, ptr %4, align 8, !dbg !3360
  %1425 = getelementptr inbounds nuw %struct.ai_static, ptr %1424, i32 0, i32 1, !dbg !3361
  %1426 = getelementptr inbounds [11 x i8], ptr %1425, i64 0, i64 3, !dbg !3360
  %1427 = load i8, ptr %1426, align 1, !dbg !3360
  %1428 = sext i8 %1427 to i32, !dbg !3360
  %1429 = add nsw i32 %1423, %1428, !dbg !3362
  %1430 = sext i32 %1429 to i64, !dbg !3363
  %1431 = getelementptr inbounds [2500 x %struct.point_seg], ptr @Point_segs, i64 0, i64 %1430, !dbg !3363
  %1432 = getelementptr inbounds nuw %struct.point_seg, ptr %1431, i32 0, i32 0, !dbg !3364
  %1433 = load i32, ptr %1432, align 4, !dbg !3364
  %1434 = call noundef i32 @_Z25openable_doors_in_segmenti(i32 noundef %1433), !dbg !3365
  %1435 = icmp ne i32 %1434, -1, !dbg !3366
  br i1 %1435, label %1436, label %1437, !dbg !3366

1436:                                             ; preds = %1414
  store i32 1, ptr %30, align 4, !dbg !3367
  br label %1462, !dbg !3368

1437:                                             ; preds = %1414
  %1438 = load ptr, ptr %4, align 8, !dbg !3369
  %1439 = getelementptr inbounds nuw %struct.ai_static, ptr %1438, i32 0, i32 3, !dbg !3371
  %1440 = load i16, ptr %1439, align 2, !dbg !3371
  %1441 = sext i16 %1440 to i32, !dbg !3369
  %1442 = load ptr, ptr %4, align 8, !dbg !3372
  %1443 = getelementptr inbounds nuw %struct.ai_static, ptr %1442, i32 0, i32 5, !dbg !3373
  %1444 = load i8, ptr %1443, align 2, !dbg !3373
  %1445 = sext i8 %1444 to i32, !dbg !3372
  %1446 = add nsw i32 %1441, %1445, !dbg !3374
  %1447 = load ptr, ptr %4, align 8, !dbg !3375
  %1448 = getelementptr inbounds nuw %struct.ai_static, ptr %1447, i32 0, i32 1, !dbg !3376
  %1449 = getelementptr inbounds [11 x i8], ptr %1448, i64 0, i64 3, !dbg !3375
  %1450 = load i8, ptr %1449, align 1, !dbg !3375
  %1451 = sext i8 %1450 to i32, !dbg !3375
  %1452 = mul nsw i32 2, %1451, !dbg !3377
  %1453 = add nsw i32 %1446, %1452, !dbg !3378
  %1454 = sext i32 %1453 to i64, !dbg !3379
  %1455 = getelementptr inbounds [2500 x %struct.point_seg], ptr @Point_segs, i64 0, i64 %1454, !dbg !3379
  %1456 = getelementptr inbounds nuw %struct.point_seg, ptr %1455, i32 0, i32 0, !dbg !3380
  %1457 = load i32, ptr %1456, align 4, !dbg !3380
  %1458 = call noundef i32 @_Z25openable_doors_in_segmenti(i32 noundef %1457), !dbg !3381
  %1459 = icmp ne i32 %1458, -1, !dbg !3382
  br i1 %1459, label %1460, label %1461, !dbg !3382

1460:                                             ; preds = %1437
  store i32 1, ptr %30, align 4, !dbg !3383
  br label %1461, !dbg !3384

1461:                                             ; preds = %1460, %1437
  br label %1462

1462:                                             ; preds = %1461, %1436
  br label %1463

1463:                                             ; preds = %1462, %1413
  %1464 = load i32, ptr %30, align 4, !dbg !3385
  %1465 = icmp ne i32 %1464, 0, !dbg !3385
  br i1 %1465, label %1466, label %1493, !dbg !3385

1466:                                             ; preds = %1463
  %1467 = load ptr, ptr %2, align 8, !dbg !3387
  %1468 = getelementptr inbounds nuw %struct.object, ptr %1467, i32 0, i32 12, !dbg !3389
  %1469 = getelementptr inbounds nuw %struct.vms_matrix, ptr %1468, i32 0, i32 2, !dbg !3390
  %1470 = load ptr, ptr %2, align 8, !dbg !3391
  %1471 = getelementptr inbounds nuw %struct.object, ptr %1470, i32 0, i32 11, !dbg !3392
  %1472 = load ptr, ptr %2, align 8, !dbg !3393
  %1473 = ptrtoint ptr %1472 to i64, !dbg !3394
  %1474 = sub i64 %1473, ptrtoint (ptr @Objects to i64), !dbg !3394
  %1475 = sdiv exact i64 %1474, 268, !dbg !3394
  %1476 = trunc i64 %1475 to i32, !dbg !3393
  %1477 = call noundef i32 @_Z21Laser_create_new_easyP10vms_vectorS0_iii(ptr noundef %1469, ptr noundef %1471, i32 noundef %1476, i32 noundef 9, i32 noundef 1), !dbg !3395
  %1478 = load ptr, ptr %5, align 8, !dbg !3396
  %1479 = getelementptr inbounds nuw %struct.ai_local, ptr %1478, i32 0, i32 8, !dbg !3397
  store i32 32768, ptr %1479, align 4, !dbg !3398
  %1480 = load i32, ptr @Stolen_item_index, align 4, !dbg !3399
  %1481 = icmp eq i32 %1480, 0, !dbg !3401
  br i1 %1481, label %1482, label %1492, !dbg !3402

1482:                                             ; preds = %1466
  %1483 = load i32, ptr @CurrentLogicVersion, align 4, !dbg !3403
  %1484 = icmp sgt i32 %1483, 0, !dbg !3404
  br i1 %1484, label %1485, label %1492, !dbg !3402

1485:                                             ; preds = %1482
  %1486 = call noundef i32 @_Z6P_Randv(), !dbg !3405
  %1487 = mul nsw i32 %1486, 4, !dbg !3406
  %1488 = load ptr, ptr %5, align 8, !dbg !3407
  %1489 = getelementptr inbounds nuw %struct.ai_local, ptr %1488, i32 0, i32 8, !dbg !3408
  %1490 = load i32, ptr %1489, align 4, !dbg !3409
  %1491 = add nsw i32 %1490, %1487, !dbg !3409
  store i32 %1491, ptr %1489, align 4, !dbg !3409
  br label %1492, !dbg !3407

1492:                                             ; preds = %1485, %1482, %1466
  br label %1493, !dbg !3410

1493:                                             ; preds = %1492, %1463
  br label %1494, !dbg !3411

1494:                                             ; preds = %1493, %1395
  br label %1495, !dbg !3412

1495:                                             ; preds = %1494, %1390
  %1496 = load ptr, ptr %5, align 8, !dbg !3413
  %1497 = getelementptr inbounds nuw %struct.ai_local, ptr %1496, i32 0, i32 3, !dbg !3414
  %1498 = load i32, ptr %1497, align 4, !dbg !3414
  switch i32 %1498, label %2457 [
    i32 3, label %1499
    i32 4, label %1752
    i32 8, label %1869
    i32 9, label %1869
    i32 2, label %1873
    i32 5, label %2065
    i32 0, label %2219
    i32 7, label %2391
    i32 14, label %2426
    i32 12, label %2427
    i32 13, label %2428
    i32 10, label %2428
    i32 11, label %2428
    i32 17, label %2456
    i32 15, label %2456
    i32 16, label %2456
    i32 1, label %2456
  ], !dbg !3415

1499:                                             ; preds = %1495
    #dbg_declare(ptr %31, !3416, !DIExpression(), !3419)
  %1500 = load ptr, ptr %9, align 8, !dbg !3420
  %1501 = getelementptr inbounds nuw %struct.robot_info, ptr %1500, i32 0, i32 27, !dbg !3421
  %1502 = load i32, ptr @Difficulty_level, align 4, !dbg !3422
  %1503 = sext i32 %1502 to i64, !dbg !3420
  %1504 = getelementptr inbounds [5 x i32], ptr %1501, i64 0, i64 %1503, !dbg !3420
  %1505 = load i32, ptr %1504, align 4, !dbg !3420
  %1506 = load ptr, ptr @ConsoleObject, align 8, !dbg !3423
  %1507 = getelementptr inbounds nuw %struct.object, ptr %1506, i32 0, i32 13, !dbg !3424
  %1508 = load i32, ptr %1507, align 4, !dbg !3424
  %1509 = add nsw i32 %1505, %1508, !dbg !3425
  store i32 %1509, ptr %31, align 4, !dbg !3426
  %1510 = load ptr, ptr %9, align 8, !dbg !3427
  %1511 = getelementptr inbounds nuw %struct.robot_info, ptr %1510, i32 0, i32 31, !dbg !3429
  %1512 = load i8, ptr %1511, align 1, !dbg !3429
  %1513 = sext i8 %1512 to i32, !dbg !3427
  %1514 = icmp ne i32 %1513, 1, !dbg !3430
  br i1 %1514, label %1515, label %1522, !dbg !3430

1515:                                             ; preds = %1499
  %1516 = load i32, ptr %3, align 4, !dbg !3431
  %1517 = and i32 %1516, 15, !dbg !3432
  %1518 = mul nsw i32 %1517, 65536, !dbg !3433
  %1519 = sdiv i32 %1518, 2, !dbg !3434
  %1520 = load i32, ptr %31, align 4, !dbg !3435
  %1521 = add nsw i32 %1520, %1519, !dbg !3435
  store i32 %1521, ptr %31, align 4, !dbg !3435
  br label %1522, !dbg !3436

1522:                                             ; preds = %1515, %1499
  %1523 = load ptr, ptr %2, align 8, !dbg !3437
  %1524 = load ptr, ptr %5, align 8, !dbg !3438
  %1525 = load ptr, ptr %9, align 8, !dbg !3439
  call void @_Z19compute_vis_and_vecP6objectP10vms_vectorP8ai_localS2_PiP10robot_infoS5_(ptr noundef %1523, ptr noundef %17, ptr noundef %1524, ptr noundef %7, ptr noundef %10, ptr noundef %1525, ptr noundef %14), !dbg !3440
  %1526 = load i32, ptr %10, align 4, !dbg !3441
  %1527 = icmp slt i32 %1526, 2, !dbg !3443
  br i1 %1527, label %1528, label %1557, !dbg !3444

1528:                                             ; preds = %1522
  %1529 = load i32, ptr %15, align 4, !dbg !3445
  %1530 = icmp eq i32 %1529, 2, !dbg !3446
  br i1 %1530, label %1531, label %1557, !dbg !3444

1531:                                             ; preds = %1528
  %1532 = load ptr, ptr %2, align 8, !dbg !3447
  %1533 = call noundef i32 @_Z24ai_multiplayer_awarenessP6objecti(ptr noundef %1532, i32 noundef 53), !dbg !3450
  %1534 = icmp ne i32 %1533, 0, !dbg !3450
  br i1 %1534, label %1554, label %1535, !dbg !3451

1535:                                             ; preds = %1531
  %1536 = load ptr, ptr %2, align 8, !dbg !3452
  %1537 = load ptr, ptr %4, align 8, !dbg !3455
  %1538 = call noundef i32 @_Z31maybe_ai_do_actual_firing_stuffP6objectP9ai_static(ptr noundef %1536, ptr noundef %1537), !dbg !3456
  %1539 = icmp ne i32 %1538, 0, !dbg !3456
  br i1 %1539, label %1540, label %1553, !dbg !3456

1540:                                             ; preds = %1535
  %1541 = load ptr, ptr %2, align 8, !dbg !3457
  %1542 = load ptr, ptr %4, align 8, !dbg !3458
  %1543 = load ptr, ptr %5, align 8, !dbg !3459
  %1544 = load ptr, ptr %9, align 8, !dbg !3460
  %1545 = load i32, ptr %6, align 4, !dbg !3461
  %1546 = load i32, ptr %10, align 4, !dbg !3462
  %1547 = load i32, ptr %12, align 4, !dbg !3463
  %1548 = load ptr, ptr %4, align 8, !dbg !3464
  %1549 = getelementptr inbounds nuw %struct.ai_static, ptr %1548, i32 0, i32 1, !dbg !3465
  %1550 = getelementptr inbounds [11 x i8], ptr %1549, i64 0, i64 0, !dbg !3464
  %1551 = load i8, ptr %1550, align 1, !dbg !3464
  %1552 = sext i8 %1551 to i32, !dbg !3464
  call void @_Z25ai_do_actual_firing_stuffP6objectP9ai_staticP8ai_localP10robot_infoP10vms_vectoriS8_iii(ptr noundef %1541, ptr noundef %1542, ptr noundef %1543, ptr noundef %1544, ptr noundef %7, i32 noundef %1545, ptr noundef %16, i32 noundef %1546, i32 noundef %1547, i32 noundef %1552), !dbg !3466
  br label %1553, !dbg !3466

1553:                                             ; preds = %1540, %1535
  br label %2900, !dbg !3467

1554:                                             ; preds = %1531
  %1555 = load ptr, ptr %2, align 8, !dbg !3468
  call void @_Z21create_path_to_playerP6objectii(ptr noundef %1555, i32 noundef 8, i32 noundef 1), !dbg !3469
  %1556 = load i32, ptr %3, align 4, !dbg !3470
  call void @_Z28ai_multi_send_robot_positionii(i32 noundef %1556, i32 noundef -1), !dbg !3471
  br label %1583, !dbg !3472

1557:                                             ; preds = %1528, %1522
  %1558 = load i32, ptr %10, align 4, !dbg !3473
  %1559 = icmp eq i32 %1558, 0, !dbg !3475
  br i1 %1559, label %1560, label %1582, !dbg !3476

1560:                                             ; preds = %1557
  %1561 = load i32, ptr %6, align 4, !dbg !3477
  %1562 = icmp sgt i32 %1561, 5242880, !dbg !3478
  br i1 %1562, label %1563, label %1582, !dbg !3479

1563:                                             ; preds = %1560
  %1564 = load i32, ptr @Game_mode, align 4, !dbg !3480
  %1565 = and i32 %1564, 38, !dbg !3481
  %1566 = icmp ne i32 %1565, 0, !dbg !3482
  br i1 %1566, label %1582, label %1567, !dbg !3479

1567:                                             ; preds = %1563
  %1568 = load ptr, ptr %4, align 8, !dbg !3483
  %1569 = getelementptr inbounds nuw %struct.ai_static, ptr %1568, i32 0, i32 0, !dbg !3486
  %1570 = load i8, ptr %1569, align 4, !dbg !3486
  %1571 = zext i8 %1570 to i32, !dbg !3483
  %1572 = icmp eq i32 %1571, 133, !dbg !3487
  br i1 %1572, label %1573, label %1581, !dbg !3487

1573:                                             ; preds = %1567
  %1574 = load ptr, ptr %4, align 8, !dbg !3488
  %1575 = getelementptr inbounds nuw %struct.ai_static, ptr %1574, i32 0, i32 2, !dbg !3490
  %1576 = load i16, ptr %1575, align 4, !dbg !3490
  %1577 = sext i16 %1576 to i32, !dbg !3488
  %1578 = load ptr, ptr %5, align 8, !dbg !3491
  %1579 = getelementptr inbounds nuw %struct.ai_local, ptr %1578, i32 0, i32 6, !dbg !3492
  store i32 %1577, ptr %1579, align 4, !dbg !3493
  %1580 = load ptr, ptr %2, align 8, !dbg !3494
  call void @_Z22create_path_to_stationP6objecti(ptr noundef %1580, i32 noundef 15), !dbg !3495
  br label %1581, !dbg !3496

1581:                                             ; preds = %1573, %1567
  br label %2471, !dbg !3497

1582:                                             ; preds = %1563, %1560, %1557
  br label %1583

1583:                                             ; preds = %1582, %1554
  %1584 = load ptr, ptr %4, align 8, !dbg !3498
  %1585 = getelementptr inbounds nuw %struct.ai_static, ptr %1584, i32 0, i32 1, !dbg !3500
  %1586 = getelementptr inbounds [11 x i8], ptr %1585, i64 0, i64 1, !dbg !3498
  %1587 = load i8, ptr %1586, align 1, !dbg !3498
  %1588 = sext i8 %1587 to i32, !dbg !3498
  %1589 = icmp eq i32 %1588, 1, !dbg !3501
  br i1 %1589, label %1590, label %1623, !dbg !3502

1590:                                             ; preds = %1583
  %1591 = load ptr, ptr %4, align 8, !dbg !3503
  %1592 = getelementptr inbounds nuw %struct.ai_static, ptr %1591, i32 0, i32 1, !dbg !3504
  %1593 = getelementptr inbounds [11 x i8], ptr %1592, i64 0, i64 2, !dbg !3503
  %1594 = load i8, ptr %1593, align 1, !dbg !3503
  %1595 = sext i8 %1594 to i32, !dbg !3503
  %1596 = icmp eq i32 %1595, 1, !dbg !3505
  br i1 %1596, label %1597, label %1623, !dbg !3502

1597:                                             ; preds = %1590
  %1598 = load i32, ptr %10, align 4, !dbg !3506
  %1599 = icmp ne i32 %1598, 0, !dbg !3506
  br i1 %1599, label %1600, label %1622, !dbg !3506

1600:                                             ; preds = %1597
  %1601 = call noundef i32 @_Z6P_Randv(), !dbg !3509
  %1602 = load i32, ptr @FrameTime, align 4, !dbg !3512
  %1603 = load i32, ptr %10, align 4, !dbg !3513
  %1604 = mul nsw i32 %1602, %1603, !dbg !3514
  %1605 = icmp slt i32 %1601, %1604, !dbg !3515
  br i1 %1605, label %1606, label %1621, !dbg !3515

1606:                                             ; preds = %1600
  %1607 = load i32, ptr %6, align 4, !dbg !3516
  %1608 = sdiv i32 %1607, 256, !dbg !3519
  %1609 = call noundef i32 @_Z6P_Randv(), !dbg !3520
  %1610 = load i32, ptr %10, align 4, !dbg !3521
  %1611 = mul nsw i32 %1609, %1610, !dbg !3522
  %1612 = icmp slt i32 %1608, %1611, !dbg !3523
  br i1 %1612, label %1613, label %1620, !dbg !3523

1613:                                             ; preds = %1606
  %1614 = load ptr, ptr %4, align 8, !dbg !3524
  %1615 = getelementptr inbounds nuw %struct.ai_static, ptr %1614, i32 0, i32 1, !dbg !3526
  %1616 = getelementptr inbounds [11 x i8], ptr %1615, i64 0, i64 2, !dbg !3524
  store i8 2, ptr %1616, align 1, !dbg !3527
  %1617 = load ptr, ptr %4, align 8, !dbg !3528
  %1618 = getelementptr inbounds nuw %struct.ai_static, ptr %1617, i32 0, i32 1, !dbg !3529
  %1619 = getelementptr inbounds [11 x i8], ptr %1618, i64 0, i64 1, !dbg !3528
  store i8 2, ptr %1619, align 1, !dbg !3530
  br label %1620, !dbg !3531

1620:                                             ; preds = %1613, %1606
  br label %1621, !dbg !3532

1621:                                             ; preds = %1620, %1600
  br label %1622, !dbg !3533

1622:                                             ; preds = %1621, %1597
  br label %1623, !dbg !3534

1623:                                             ; preds = %1622, %1590, %1583
  %1624 = load i32, ptr @GameTime, align 4, !dbg !3535
  %1625 = load ptr, ptr %5, align 8, !dbg !3537
  %1626 = getelementptr inbounds nuw %struct.ai_local, ptr %1625, i32 0, i32 11, !dbg !3538
  %1627 = load i32, ptr %1626, align 4, !dbg !3538
  %1628 = sub nsw i32 %1624, %1627, !dbg !3539
  %1629 = icmp sgt i32 %1628, 524288, !dbg !3540
  br i1 %1629, label %1630, label %1668, !dbg !3540

1630:                                             ; preds = %1623
  %1631 = load i32, ptr @Game_mode, align 4, !dbg !3541
  %1632 = and i32 %1631, 38, !dbg !3544
  %1633 = icmp ne i32 %1632, 0, !dbg !3541
  br i1 %1633, label %1634, label %1644, !dbg !3541

1634:                                             ; preds = %1630
  %1635 = load i32, ptr %10, align 4, !dbg !3545
  %1636 = icmp ne i32 %1635, 0, !dbg !3545
  br i1 %1636, label %1643, label %1637, !dbg !3547

1637:                                             ; preds = %1634
  %1638 = load i32, ptr %6, align 4, !dbg !3548
  %1639 = icmp sgt i32 %1638, 4587520, !dbg !3549
  br i1 %1639, label %1640, label %1643, !dbg !3547

1640:                                             ; preds = %1637
  %1641 = load ptr, ptr %5, align 8, !dbg !3550
  %1642 = getelementptr inbounds nuw %struct.ai_local, ptr %1641, i32 0, i32 3, !dbg !3552
  store i32 0, ptr %1642, align 4, !dbg !3553
  br label %2900, !dbg !3554

1643:                                             ; preds = %1637, %1634
  br label %1644, !dbg !3555

1644:                                             ; preds = %1643, %1630
  %1645 = load ptr, ptr %2, align 8, !dbg !3556
  %1646 = call noundef i32 @_Z24ai_multiplayer_awarenessP6objecti(ptr noundef %1645, i32 noundef 64), !dbg !3558
  %1647 = icmp ne i32 %1646, 0, !dbg !3558
  br i1 %1647, label %1667, label %1648, !dbg !3559

1648:                                             ; preds = %1644
  %1649 = load ptr, ptr %2, align 8, !dbg !3560
  %1650 = load ptr, ptr %4, align 8, !dbg !3563
  %1651 = call noundef i32 @_Z31maybe_ai_do_actual_firing_stuffP6objectP9ai_static(ptr noundef %1649, ptr noundef %1650), !dbg !3564
  %1652 = icmp ne i32 %1651, 0, !dbg !3564
  br i1 %1652, label %1653, label %1666, !dbg !3564

1653:                                             ; preds = %1648
  %1654 = load ptr, ptr %2, align 8, !dbg !3565
  %1655 = load ptr, ptr %4, align 8, !dbg !3566
  %1656 = load ptr, ptr %5, align 8, !dbg !3567
  %1657 = load ptr, ptr %9, align 8, !dbg !3568
  %1658 = load i32, ptr %6, align 4, !dbg !3569
  %1659 = load i32, ptr %10, align 4, !dbg !3570
  %1660 = load i32, ptr %12, align 4, !dbg !3571
  %1661 = load ptr, ptr %4, align 8, !dbg !3572
  %1662 = getelementptr inbounds nuw %struct.ai_static, ptr %1661, i32 0, i32 1, !dbg !3573
  %1663 = getelementptr inbounds [11 x i8], ptr %1662, i64 0, i64 0, !dbg !3572
  %1664 = load i8, ptr %1663, align 1, !dbg !3572
  %1665 = sext i8 %1664 to i32, !dbg !3572
  call void @_Z25ai_do_actual_firing_stuffP6objectP9ai_staticP8ai_localP10robot_infoP10vms_vectoriS8_iii(ptr noundef %1654, ptr noundef %1655, ptr noundef %1656, ptr noundef %1657, ptr noundef %7, i32 noundef %1658, ptr noundef %16, i32 noundef %1659, i32 noundef %1660, i32 noundef %1665), !dbg !3574
  br label %1666, !dbg !3574

1666:                                             ; preds = %1653, %1648
  br label %2900, !dbg !3575

1667:                                             ; preds = %1644
  br label %1751, !dbg !3576

1668:                                             ; preds = %1623
  %1669 = load ptr, ptr %4, align 8, !dbg !3577
  %1670 = getelementptr inbounds nuw %struct.ai_static, ptr %1669, i32 0, i32 1, !dbg !3579
  %1671 = getelementptr inbounds [11 x i8], ptr %1670, i64 0, i64 1, !dbg !3577
  %1672 = load i8, ptr %1671, align 1, !dbg !3577
  %1673 = sext i8 %1672 to i32, !dbg !3577
  %1674 = icmp ne i32 %1673, 1, !dbg !3580
  br i1 %1674, label %1675, label %1750, !dbg !3581

1675:                                             ; preds = %1668
  %1676 = load ptr, ptr %4, align 8, !dbg !3582
  %1677 = getelementptr inbounds nuw %struct.ai_static, ptr %1676, i32 0, i32 1, !dbg !3583
  %1678 = getelementptr inbounds [11 x i8], ptr %1677, i64 0, i64 2, !dbg !3582
  %1679 = load i8, ptr %1678, align 1, !dbg !3582
  %1680 = sext i8 %1679 to i32, !dbg !3582
  %1681 = icmp ne i32 %1680, 1, !dbg !3584
  br i1 %1681, label %1682, label %1750, !dbg !3581

1682:                                             ; preds = %1675
  %1683 = load ptr, ptr %2, align 8, !dbg !3585
  %1684 = call noundef i32 @_Z24ai_multiplayer_awarenessP6objecti(ptr noundef %1683, i32 noundef 70), !dbg !3588
  %1685 = icmp ne i32 %1684, 0, !dbg !3588
  br i1 %1685, label %1705, label %1686, !dbg !3589

1686:                                             ; preds = %1682
  %1687 = load ptr, ptr %2, align 8, !dbg !3590
  %1688 = load ptr, ptr %4, align 8, !dbg !3593
  %1689 = call noundef i32 @_Z31maybe_ai_do_actual_firing_stuffP6objectP9ai_static(ptr noundef %1687, ptr noundef %1688), !dbg !3594
  %1690 = icmp ne i32 %1689, 0, !dbg !3594
  br i1 %1690, label %1691, label %1704, !dbg !3594

1691:                                             ; preds = %1686
  %1692 = load ptr, ptr %2, align 8, !dbg !3595
  %1693 = load ptr, ptr %4, align 8, !dbg !3596
  %1694 = load ptr, ptr %5, align 8, !dbg !3597
  %1695 = load ptr, ptr %9, align 8, !dbg !3598
  %1696 = load i32, ptr %6, align 4, !dbg !3599
  %1697 = load i32, ptr %10, align 4, !dbg !3600
  %1698 = load i32, ptr %12, align 4, !dbg !3601
  %1699 = load ptr, ptr %4, align 8, !dbg !3602
  %1700 = getelementptr inbounds nuw %struct.ai_static, ptr %1699, i32 0, i32 1, !dbg !3603
  %1701 = getelementptr inbounds [11 x i8], ptr %1700, i64 0, i64 0, !dbg !3602
  %1702 = load i8, ptr %1701, align 1, !dbg !3602
  %1703 = sext i8 %1702 to i32, !dbg !3602
  call void @_Z25ai_do_actual_firing_stuffP6objectP9ai_staticP8ai_localP10robot_infoP10vms_vectoriS8_iii(ptr noundef %1692, ptr noundef %1693, ptr noundef %1694, ptr noundef %1695, ptr noundef %7, i32 noundef %1696, ptr noundef %16, i32 noundef %1697, i32 noundef %1698, i32 noundef %1703), !dbg !3604
  br label %1704, !dbg !3604

1704:                                             ; preds = %1691, %1686
  br label %2900, !dbg !3605

1705:                                             ; preds = %1682
  %1706 = load ptr, ptr %2, align 8, !dbg !3606
  %1707 = load ptr, ptr %5, align 8, !dbg !3607
  %1708 = load i32, ptr %6, align 4, !dbg !3608
  %1709 = load i32, ptr %31, align 4, !dbg !3609
  %1710 = load i32, ptr %10, align 4, !dbg !3610
  call void @_Z26ai_move_relative_to_playerP6objectP8ai_localiP10vms_vectoriii(ptr noundef %1706, ptr noundef %1707, i32 noundef %1708, ptr noundef %7, i32 noundef %1709, i32 noundef 0, i32 noundef %1710), !dbg !3611
  %1711 = load i32, ptr %11, align 4, !dbg !3612
  %1712 = and i32 %1711, 1, !dbg !3614
  %1713 = icmp ne i32 %1712, 0, !dbg !3615
  br i1 %1713, label %1714, label %1740, !dbg !3616

1714:                                             ; preds = %1705
  %1715 = load ptr, ptr %4, align 8, !dbg !3617
  %1716 = getelementptr inbounds nuw %struct.ai_static, ptr %1715, i32 0, i32 1, !dbg !3618
  %1717 = getelementptr inbounds [11 x i8], ptr %1716, i64 0, i64 2, !dbg !3617
  %1718 = load i8, ptr %1717, align 1, !dbg !3617
  %1719 = sext i8 %1718 to i32, !dbg !3617
  %1720 = icmp eq i32 %1719, 2, !dbg !3619
  br i1 %1720, label %1728, label %1721, !dbg !3620

1721:                                             ; preds = %1714
  %1722 = load ptr, ptr %4, align 8, !dbg !3621
  %1723 = getelementptr inbounds nuw %struct.ai_static, ptr %1722, i32 0, i32 1, !dbg !3622
  %1724 = getelementptr inbounds [11 x i8], ptr %1723, i64 0, i64 2, !dbg !3621
  %1725 = load i8, ptr %1724, align 1, !dbg !3621
  %1726 = sext i8 %1725 to i32, !dbg !3621
  %1727 = icmp eq i32 %1726, 3, !dbg !3623
  br i1 %1727, label %1728, label %1740, !dbg !3616

1728:                                             ; preds = %1721, %1714
  %1729 = load i32, ptr %10, align 4, !dbg !3624
  %1730 = icmp ne i32 %1729, 0, !dbg !3624
  br i1 %1730, label %1731, label %1739, !dbg !3624

1731:                                             ; preds = %1728
  %1732 = load ptr, ptr %2, align 8, !dbg !3627
  %1733 = load ptr, ptr %9, align 8, !dbg !3628
  %1734 = getelementptr inbounds nuw %struct.robot_info, ptr %1733, i32 0, i32 25, !dbg !3629
  %1735 = load i32, ptr @Difficulty_level, align 4, !dbg !3630
  %1736 = sext i32 %1735 to i64, !dbg !3628
  %1737 = getelementptr inbounds [5 x i32], ptr %1734, i64 0, i64 %1736, !dbg !3628
  %1738 = load i32, ptr %1737, align 4, !dbg !3628
  call void @_Z22ai_turn_towards_vectorP10vms_vectorP6objecti(ptr noundef %7, ptr noundef %1732, i32 noundef %1738), !dbg !3631
  br label %1739, !dbg !3631

1739:                                             ; preds = %1731, %1728
  br label %1740, !dbg !3632

1740:                                             ; preds = %1739, %1721, %1705
  %1741 = load i32, ptr @ai_evaded, align 4, !dbg !3633
  %1742 = icmp ne i32 %1741, 0, !dbg !3633
  br i1 %1742, label %1743, label %1745, !dbg !3633

1743:                                             ; preds = %1740
  %1744 = load i32, ptr %3, align 4, !dbg !3635
  call void @_Z28ai_multi_send_robot_positionii(i32 noundef %1744, i32 noundef 1), !dbg !3637
  store i32 0, ptr @ai_evaded, align 4, !dbg !3638
  br label %1747, !dbg !3639

1745:                                             ; preds = %1740
  %1746 = load i32, ptr %3, align 4, !dbg !3640
  call void @_Z28ai_multi_send_robot_positionii(i32 noundef %1746, i32 noundef -1), !dbg !3641
  br label %1747

1747:                                             ; preds = %1745, %1743
  %1748 = load ptr, ptr %2, align 8, !dbg !3642
  %1749 = load i32, ptr %10, align 4, !dbg !3643
  call void @_Z15do_firing_stuffP6objectiP10vms_vector(ptr noundef %1748, i32 noundef %1749, ptr noundef %7), !dbg !3644
  br label %1750, !dbg !3645

1750:                                             ; preds = %1747, %1675, %1668
  br label %1751

1751:                                             ; preds = %1750, %1667
  br label %2471, !dbg !3646

1752:                                             ; preds = %1495
  %1753 = load ptr, ptr %2, align 8, !dbg !3647
  %1754 = load ptr, ptr %5, align 8, !dbg !3648
  %1755 = load ptr, ptr %9, align 8, !dbg !3649
  call void @_Z19compute_vis_and_vecP6objectP10vms_vectorP8ai_localS2_PiP10robot_infoS5_(ptr noundef %1753, ptr noundef %17, ptr noundef %1754, ptr noundef %7, ptr noundef %10, ptr noundef %1755, ptr noundef %14), !dbg !3650
  %1756 = load i32, ptr %10, align 4, !dbg !3651
  %1757 = icmp ne i32 %1756, 0, !dbg !3651
  br i1 %1757, label %1758, label %1767, !dbg !3651

1758:                                             ; preds = %1752
  %1759 = load ptr, ptr %5, align 8, !dbg !3653
  %1760 = getelementptr inbounds nuw %struct.ai_local, ptr %1759, i32 0, i32 0, !dbg !3656
  %1761 = load i32, ptr %1760, align 4, !dbg !3656
  %1762 = icmp eq i32 %1761, 0, !dbg !3657
  br i1 %1762, label %1763, label %1766, !dbg !3657

1763:                                             ; preds = %1758
  %1764 = load ptr, ptr %5, align 8, !dbg !3658
  %1765 = getelementptr inbounds nuw %struct.ai_local, ptr %1764, i32 0, i32 0, !dbg !3659
  store i32 4, ptr %1765, align 4, !dbg !3660
  br label %1766, !dbg !3658

1766:                                             ; preds = %1763, %1758
  br label %1767, !dbg !3661

1767:                                             ; preds = %1766, %1752
  %1768 = load i32, ptr @Game_mode, align 4, !dbg !3662
  %1769 = and i32 %1768, 38, !dbg !3664
  %1770 = icmp ne i32 %1769, 0, !dbg !3665
  br i1 %1770, label %1771, label %1774, !dbg !3666

1771:                                             ; preds = %1767
  %1772 = load i32, ptr %10, align 4, !dbg !3667
  %1773 = icmp ne i32 %1772, 0, !dbg !3667
  br i1 %1773, label %1774, label %1784, !dbg !3666

1774:                                             ; preds = %1771, %1767
  %1775 = load ptr, ptr %2, align 8, !dbg !3668
  %1776 = call noundef i32 @_Z24ai_multiplayer_awarenessP6objecti(ptr noundef %1775, i32 noundef 75), !dbg !3670
  %1777 = icmp ne i32 %1776, 0, !dbg !3670
  br i1 %1777, label %1778, label %1783, !dbg !3670

1778:                                             ; preds = %1774
  %1779 = load ptr, ptr %2, align 8, !dbg !3671
  %1780 = load i32, ptr %10, align 4, !dbg !3673
  %1781 = load i32, ptr %15, align 4, !dbg !3674
  call void @_Z14ai_follow_pathP6objectiiP10vms_vector(ptr noundef %1779, i32 noundef %1780, i32 noundef %1781, ptr noundef %7), !dbg !3675
  %1782 = load i32, ptr %3, align 4, !dbg !3676
  call void @_Z28ai_multi_send_robot_positionii(i32 noundef %1782, i32 noundef -1), !dbg !3677
  br label %1783, !dbg !3678

1783:                                             ; preds = %1778, %1774
  br label %1784, !dbg !3679

1784:                                             ; preds = %1783, %1771
  %1785 = load ptr, ptr %4, align 8, !dbg !3680
  %1786 = getelementptr inbounds nuw %struct.ai_static, ptr %1785, i32 0, i32 1, !dbg !3682
  %1787 = getelementptr inbounds [11 x i8], ptr %1786, i64 0, i64 2, !dbg !3680
  %1788 = load i8, ptr %1787, align 1, !dbg !3680
  %1789 = sext i8 %1788 to i32, !dbg !3680
  %1790 = icmp ne i32 %1789, 4, !dbg !3683
  br i1 %1790, label %1791, label %1795, !dbg !3683

1791:                                             ; preds = %1784
  %1792 = load ptr, ptr %4, align 8, !dbg !3684
  %1793 = getelementptr inbounds nuw %struct.ai_static, ptr %1792, i32 0, i32 1, !dbg !3685
  %1794 = getelementptr inbounds [11 x i8], ptr %1793, i64 0, i64 2, !dbg !3684
  store i8 3, ptr %1794, align 1, !dbg !3686
  br label %1807, !dbg !3684

1795:                                             ; preds = %1784
  %1796 = load ptr, ptr %4, align 8, !dbg !3687
  %1797 = getelementptr inbounds nuw %struct.ai_static, ptr %1796, i32 0, i32 1, !dbg !3689
  %1798 = getelementptr inbounds [11 x i8], ptr %1797, i64 0, i64 1, !dbg !3687
  %1799 = load i8, ptr %1798, align 1, !dbg !3687
  %1800 = sext i8 %1799 to i32, !dbg !3687
  %1801 = icmp eq i32 %1800, 4, !dbg !3690
  br i1 %1801, label %1802, label %1806, !dbg !3690

1802:                                             ; preds = %1795
  %1803 = load ptr, ptr %4, align 8, !dbg !3691
  %1804 = getelementptr inbounds nuw %struct.ai_static, ptr %1803, i32 0, i32 1, !dbg !3692
  %1805 = getelementptr inbounds [11 x i8], ptr %1804, i64 0, i64 2, !dbg !3691
  store i8 3, ptr %1805, align 1, !dbg !3693
  br label %1806, !dbg !3691

1806:                                             ; preds = %1802, %1795
  br label %1807

1807:                                             ; preds = %1806, %1791
  %1808 = load ptr, ptr %5, align 8, !dbg !3694
  %1809 = getelementptr inbounds nuw %struct.ai_local, ptr %1808, i32 0, i32 8, !dbg !3696
  %1810 = load i32, ptr %1809, align 4, !dbg !3696
  %1811 = icmp sle i32 %1810, 0, !dbg !3697
  br i1 %1811, label %1812, label %1868, !dbg !3698

1812:                                             ; preds = %1807
  %1813 = load i32, ptr %10, align 4, !dbg !3699
  %1814 = icmp ne i32 %1813, 0, !dbg !3700
  br i1 %1814, label %1815, label %1868, !dbg !3698

1815:                                             ; preds = %1812
    #dbg_declare(ptr %32, !3701, !DIExpression(), !3703)
    #dbg_declare(ptr %33, !3704, !DIExpression(), !3705)
  %1816 = load ptr, ptr %2, align 8, !dbg !3706
  %1817 = call noundef i32 @_Z24ai_multiplayer_awarenessP6objecti(ptr noundef %1816, i32 noundef 75), !dbg !3708
  %1818 = icmp ne i32 %1817, 0, !dbg !3708
  br i1 %1818, label %1820, label %1819, !dbg !3709

1819:                                             ; preds = %1815
  br label %2900, !dbg !3710

1820:                                             ; preds = %1815
  %1821 = load ptr, ptr %2, align 8, !dbg !3711
  %1822 = getelementptr inbounds nuw %struct.object, ptr %1821, i32 0, i32 12, !dbg !3712
  %1823 = getelementptr inbounds nuw %struct.vms_matrix, ptr %1822, i32 0, i32 2, !dbg !3713
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %32, ptr align 4 %1823, i64 12, i1 false), !dbg !3714
  br label %1824, !dbg !3715

1824:                                             ; preds = %1820
  %1825 = getelementptr inbounds nuw %struct.vms_vector, ptr %32, i32 0, i32 0, !dbg !3716
  %1826 = load i32, ptr %1825, align 4, !dbg !3716
  %1827 = sub nsw i32 0, %1826, !dbg !3716
  %1828 = getelementptr inbounds nuw %struct.vms_vector, ptr %32, i32 0, i32 0, !dbg !3716
  store i32 %1827, ptr %1828, align 4, !dbg !3716
  %1829 = getelementptr inbounds nuw %struct.vms_vector, ptr %32, i32 0, i32 1, !dbg !3716
  %1830 = load i32, ptr %1829, align 4, !dbg !3716
  %1831 = sub nsw i32 0, %1830, !dbg !3716
  %1832 = getelementptr inbounds nuw %struct.vms_vector, ptr %32, i32 0, i32 1, !dbg !3716
  store i32 %1831, ptr %1832, align 4, !dbg !3716
  %1833 = getelementptr inbounds nuw %struct.vms_vector, ptr %32, i32 0, i32 2, !dbg !3716
  %1834 = load i32, ptr %1833, align 4, !dbg !3716
  %1835 = sub nsw i32 0, %1834, !dbg !3716
  %1836 = getelementptr inbounds nuw %struct.vms_vector, ptr %32, i32 0, i32 2, !dbg !3716
  store i32 %1835, ptr %1836, align 4, !dbg !3716
  br label %1837, !dbg !3716

1837:                                             ; preds = %1824
  %1838 = load ptr, ptr %2, align 8, !dbg !3718
  %1839 = getelementptr inbounds nuw %struct.object, ptr %1838, i32 0, i32 11, !dbg !3719
  %1840 = call noundef ptr @_Z10vm_vec_addP10vms_vectorS0_S0_(ptr noundef %33, ptr noundef %1839, ptr noundef %32), !dbg !3720
  %1841 = load ptr, ptr %4, align 8, !dbg !3721
  %1842 = getelementptr inbounds nuw %struct.ai_static, ptr %1841, i32 0, i32 1, !dbg !3723
  %1843 = getelementptr inbounds [11 x i8], ptr %1842, i64 0, i64 4, !dbg !3721
  %1844 = load i8, ptr %1843, align 1, !dbg !3721
  %1845 = sext i8 %1844 to i32, !dbg !3721
  %1846 = and i32 %1845, 2, !dbg !3724
  %1847 = icmp ne i32 %1846, 0, !dbg !3721
  br i1 %1847, label %1848, label %1855, !dbg !3721

1848:                                             ; preds = %1837
  %1849 = load ptr, ptr %2, align 8, !dbg !3725
  %1850 = ptrtoint ptr %1849 to i64, !dbg !3726
  %1851 = sub i64 %1850, ptrtoint (ptr @Objects to i64), !dbg !3726
  %1852 = sdiv exact i64 %1851, 268, !dbg !3726
  %1853 = trunc i64 %1852 to i32, !dbg !3725
  %1854 = call noundef i32 @_Z21Laser_create_new_easyP10vms_vectorS0_iii(ptr noundef %32, ptr noundef %33, i32 noundef %1853, i32 noundef 53, i32 noundef 1), !dbg !3727
  br label %1862, !dbg !3727

1855:                                             ; preds = %1837
  %1856 = load ptr, ptr %2, align 8, !dbg !3728
  %1857 = ptrtoint ptr %1856 to i64, !dbg !3729
  %1858 = sub i64 %1857, ptrtoint (ptr @Objects to i64), !dbg !3729
  %1859 = sdiv exact i64 %1858, 268, !dbg !3729
  %1860 = trunc i64 %1859 to i32, !dbg !3728
  %1861 = call noundef i32 @_Z21Laser_create_new_easyP10vms_vectorS0_iii(ptr noundef %32, ptr noundef %33, i32 noundef %1860, i32 noundef 16, i32 noundef 1), !dbg !3730
  br label %1862

1862:                                             ; preds = %1855, %1848
  %1863 = load i32, ptr @Difficulty_level, align 4, !dbg !3731
  %1864 = sub nsw i32 10, %1863, !dbg !3732
  %1865 = mul nsw i32 32768, %1864, !dbg !3733
  %1866 = load ptr, ptr %5, align 8, !dbg !3734
  %1867 = getelementptr inbounds nuw %struct.ai_local, ptr %1866, i32 0, i32 8, !dbg !3735
  store i32 %1865, ptr %1867, align 4, !dbg !3736
  br label %1868, !dbg !3737

1868:                                             ; preds = %1862, %1812, %1807
  br label %2471, !dbg !3738

1869:                                             ; preds = %1495, %1495
  %1870 = load ptr, ptr %2, align 8, !dbg !3739
  %1871 = load i32, ptr %15, align 4, !dbg !3740
  call void @_Z14ai_follow_pathP6objectiiP10vms_vector(ptr noundef %1870, i32 noundef 2, i32 noundef %1871, ptr noundef %7), !dbg !3741
  %1872 = load i32, ptr %3, align 4, !dbg !3742
  call void @_Z28ai_multi_send_robot_positionii(i32 noundef %1872, i32 noundef -1), !dbg !3743
  br label %2471, !dbg !3744

1873:                                             ; preds = %1495
    #dbg_declare(ptr %34, !3745, !DIExpression(), !3747)
  store i32 65, ptr %34, align 4, !dbg !3747
  %1874 = load ptr, ptr %4, align 8, !dbg !3748
  %1875 = getelementptr inbounds nuw %struct.ai_static, ptr %1874, i32 0, i32 0, !dbg !3750
  %1876 = load i8, ptr %1875, align 4, !dbg !3750
  %1877 = zext i8 %1876 to i32, !dbg !3748
  %1878 = icmp eq i32 %1877, 133, !dbg !3751
  br i1 %1878, label %1879, label %1901, !dbg !3751

1879:                                             ; preds = %1873
  %1880 = load ptr, ptr %4, align 8, !dbg !3752
  %1881 = getelementptr inbounds nuw %struct.ai_static, ptr %1880, i32 0, i32 3, !dbg !3754
  %1882 = load i16, ptr %1881, align 2, !dbg !3754
  %1883 = sext i16 %1882 to i32, !dbg !3752
  %1884 = load ptr, ptr %4, align 8, !dbg !3755
  %1885 = getelementptr inbounds nuw %struct.ai_static, ptr %1884, i32 0, i32 4, !dbg !3756
  %1886 = load i16, ptr %1885, align 4, !dbg !3756
  %1887 = sext i16 %1886 to i32, !dbg !3755
  %1888 = add nsw i32 %1883, %1887, !dbg !3757
  %1889 = sub nsw i32 %1888, 1, !dbg !3758
  %1890 = sext i32 %1889 to i64, !dbg !3759
  %1891 = getelementptr inbounds [2500 x %struct.point_seg], ptr @Point_segs, i64 0, i64 %1890, !dbg !3759
  %1892 = getelementptr inbounds nuw %struct.point_seg, ptr %1891, i32 0, i32 0, !dbg !3760
  %1893 = load i32, ptr %1892, align 4, !dbg !3760
  %1894 = load ptr, ptr %4, align 8, !dbg !3761
  %1895 = getelementptr inbounds nuw %struct.ai_static, ptr %1894, i32 0, i32 2, !dbg !3762
  %1896 = load i16, ptr %1895, align 4, !dbg !3762
  %1897 = sext i16 %1896 to i32, !dbg !3761
  %1898 = icmp eq i32 %1893, %1897, !dbg !3763
  br i1 %1898, label %1899, label %1900, !dbg !3763

1899:                                             ; preds = %1879
  store i32 64, ptr %34, align 4, !dbg !3764
  br label %1900, !dbg !3766

1900:                                             ; preds = %1899, %1879
  br label %1901, !dbg !3762

1901:                                             ; preds = %1900, %1873
  %1902 = load ptr, ptr %2, align 8, !dbg !3767
  %1903 = load ptr, ptr %5, align 8, !dbg !3768
  %1904 = load ptr, ptr %9, align 8, !dbg !3769
  call void @_Z19compute_vis_and_vecP6objectP10vms_vectorP8ai_localS2_PiP10robot_infoS5_(ptr noundef %1902, ptr noundef %17, ptr noundef %1903, ptr noundef %7, ptr noundef %10, ptr noundef %1904, ptr noundef %14), !dbg !3770
  %1905 = load ptr, ptr %2, align 8, !dbg !3771
  %1906 = load i32, ptr %34, align 4, !dbg !3773
  %1907 = call noundef i32 @_Z24ai_multiplayer_awarenessP6objecti(ptr noundef %1905, i32 noundef %1906), !dbg !3774
  %1908 = icmp ne i32 %1907, 0, !dbg !3774
  br i1 %1908, label %1931, label %1909, !dbg !3775

1909:                                             ; preds = %1901
  %1910 = load ptr, ptr %2, align 8, !dbg !3776
  %1911 = load ptr, ptr %4, align 8, !dbg !3779
  %1912 = call noundef i32 @_Z31maybe_ai_do_actual_firing_stuffP6objectP9ai_static(ptr noundef %1910, ptr noundef %1911), !dbg !3780
  %1913 = icmp ne i32 %1912, 0, !dbg !3780
  br i1 %1913, label %1914, label %1930, !dbg !3780

1914:                                             ; preds = %1909
  %1915 = load ptr, ptr %2, align 8, !dbg !3781
  %1916 = load ptr, ptr %5, align 8, !dbg !3783
  %1917 = load ptr, ptr %9, align 8, !dbg !3784
  call void @_Z19compute_vis_and_vecP6objectP10vms_vectorP8ai_localS2_PiP10robot_infoS5_(ptr noundef %1915, ptr noundef %17, ptr noundef %1916, ptr noundef %7, ptr noundef %10, ptr noundef %1917, ptr noundef %14), !dbg !3785
  %1918 = load ptr, ptr %2, align 8, !dbg !3786
  %1919 = load ptr, ptr %4, align 8, !dbg !3787
  %1920 = load ptr, ptr %5, align 8, !dbg !3788
  %1921 = load ptr, ptr %9, align 8, !dbg !3789
  %1922 = load i32, ptr %6, align 4, !dbg !3790
  %1923 = load i32, ptr %10, align 4, !dbg !3791
  %1924 = load i32, ptr %12, align 4, !dbg !3792
  %1925 = load ptr, ptr %4, align 8, !dbg !3793
  %1926 = getelementptr inbounds nuw %struct.ai_static, ptr %1925, i32 0, i32 1, !dbg !3794
  %1927 = getelementptr inbounds [11 x i8], ptr %1926, i64 0, i64 0, !dbg !3793
  %1928 = load i8, ptr %1927, align 1, !dbg !3793
  %1929 = sext i8 %1928 to i32, !dbg !3793
  call void @_Z25ai_do_actual_firing_stuffP6objectP9ai_staticP8ai_localP10robot_infoP10vms_vectoriS8_iii(ptr noundef %1918, ptr noundef %1919, ptr noundef %1920, ptr noundef %1921, ptr noundef %7, i32 noundef %1922, ptr noundef %16, i32 noundef %1923, i32 noundef %1924, i32 noundef %1929), !dbg !3795
  br label %1930, !dbg !3796

1930:                                             ; preds = %1914, %1909
  br label %2900, !dbg !3797

1931:                                             ; preds = %1901
  %1932 = load ptr, ptr %2, align 8, !dbg !3798
  %1933 = load i32, ptr %10, align 4, !dbg !3799
  %1934 = load i32, ptr %15, align 4, !dbg !3800
  call void @_Z14ai_follow_pathP6objectiiP10vms_vector(ptr noundef %1932, i32 noundef %1933, i32 noundef %1934, ptr noundef %7), !dbg !3801
  %1935 = load ptr, ptr %4, align 8, !dbg !3802
  %1936 = getelementptr inbounds nuw %struct.ai_static, ptr %1935, i32 0, i32 1, !dbg !3804
  %1937 = getelementptr inbounds [11 x i8], ptr %1936, i64 0, i64 2, !dbg !3802
  %1938 = load i8, ptr %1937, align 1, !dbg !3802
  %1939 = sext i8 %1938 to i32, !dbg !3802
  %1940 = icmp ne i32 %1939, 4, !dbg !3805
  br i1 %1940, label %1941, label %1945, !dbg !3805

1941:                                             ; preds = %1931
  %1942 = load ptr, ptr %4, align 8, !dbg !3806
  %1943 = getelementptr inbounds nuw %struct.ai_static, ptr %1942, i32 0, i32 1, !dbg !3807
  %1944 = getelementptr inbounds [11 x i8], ptr %1943, i64 0, i64 2, !dbg !3806
  store i8 3, ptr %1944, align 1, !dbg !3808
  br label %1957, !dbg !3806

1945:                                             ; preds = %1931
  %1946 = load ptr, ptr %4, align 8, !dbg !3809
  %1947 = getelementptr inbounds nuw %struct.ai_static, ptr %1946, i32 0, i32 1, !dbg !3811
  %1948 = getelementptr inbounds [11 x i8], ptr %1947, i64 0, i64 1, !dbg !3809
  %1949 = load i8, ptr %1948, align 1, !dbg !3809
  %1950 = sext i8 %1949 to i32, !dbg !3809
  %1951 = icmp eq i32 %1950, 4, !dbg !3812
  br i1 %1951, label %1952, label %1956, !dbg !3812

1952:                                             ; preds = %1945
  %1953 = load ptr, ptr %4, align 8, !dbg !3813
  %1954 = getelementptr inbounds nuw %struct.ai_static, ptr %1953, i32 0, i32 1, !dbg !3814
  %1955 = getelementptr inbounds [11 x i8], ptr %1954, i64 0, i64 2, !dbg !3813
  store i8 3, ptr %1955, align 1, !dbg !3815
  br label %1956, !dbg !3813

1956:                                             ; preds = %1952, %1945
  br label %1957

1957:                                             ; preds = %1956, %1941
  %1958 = load ptr, ptr %4, align 8, !dbg !3816
  %1959 = getelementptr inbounds nuw %struct.ai_static, ptr %1958, i32 0, i32 0, !dbg !3818
  %1960 = load i8, ptr %1959, align 4, !dbg !3818
  %1961 = zext i8 %1960 to i32, !dbg !3816
  %1962 = icmp ne i32 %1961, 131, !dbg !3819
  br i1 %1962, label %1963, label %1966, !dbg !3819

1963:                                             ; preds = %1957
  %1964 = load ptr, ptr %2, align 8, !dbg !3820
  %1965 = load i32, ptr %10, align 4, !dbg !3821
  call void @_Z15do_firing_stuffP6objectiP10vms_vector(ptr noundef %1964, i32 noundef %1965, ptr noundef %7), !dbg !3822
  br label %1966, !dbg !3822

1966:                                             ; preds = %1963, %1957
  %1967 = load i32, ptr %10, align 4, !dbg !3823
  %1968 = icmp eq i32 %1967, 2, !dbg !3825
  br i1 %1968, label %1969, label %2015, !dbg !3826

1969:                                             ; preds = %1966
  %1970 = load ptr, ptr %4, align 8, !dbg !3827
  %1971 = getelementptr inbounds nuw %struct.ai_static, ptr %1970, i32 0, i32 0, !dbg !3828
  %1972 = load i8, ptr %1971, align 4, !dbg !3828
  %1973 = zext i8 %1972 to i32, !dbg !3827
  %1974 = icmp ne i32 %1973, 132, !dbg !3829
  br i1 %1974, label %1975, label %2015, !dbg !3830

1975:                                             ; preds = %1969
  %1976 = load ptr, ptr %4, align 8, !dbg !3831
  %1977 = getelementptr inbounds nuw %struct.ai_static, ptr %1976, i32 0, i32 0, !dbg !3832
  %1978 = load i8, ptr %1977, align 4, !dbg !3832
  %1979 = zext i8 %1978 to i32, !dbg !3831
  %1980 = icmp ne i32 %1979, 134, !dbg !3833
  br i1 %1980, label %1981, label %2015, !dbg !3834

1981:                                             ; preds = %1975
  %1982 = load ptr, ptr %4, align 8, !dbg !3835
  %1983 = getelementptr inbounds nuw %struct.ai_static, ptr %1982, i32 0, i32 0, !dbg !3836
  %1984 = load i8, ptr %1983, align 4, !dbg !3836
  %1985 = zext i8 %1984 to i32, !dbg !3835
  %1986 = icmp ne i32 %1985, 131, !dbg !3837
  br i1 %1986, label %1987, label %2015, !dbg !3838

1987:                                             ; preds = %1981
  %1988 = load ptr, ptr %2, align 8, !dbg !3839
  %1989 = getelementptr inbounds nuw %struct.object, ptr %1988, i32 0, i32 2, !dbg !3840
  %1990 = load i8, ptr %1989, align 1, !dbg !3840
  %1991 = zext i8 %1990 to i32, !dbg !3839
  %1992 = icmp ne i32 %1991, 7, !dbg !3841
  br i1 %1992, label %1993, label %2015, !dbg !3842

1993:                                             ; preds = %1987
  %1994 = load ptr, ptr %9, align 8, !dbg !3843
  %1995 = getelementptr inbounds nuw %struct.robot_info, ptr %1994, i32 0, i32 37, !dbg !3844
  %1996 = load i8, ptr %1995, align 1, !dbg !3844
  %1997 = sext i8 %1996 to i32, !dbg !3843
  %1998 = icmp ne i32 %1997, 1, !dbg !3845
  br i1 %1998, label %1999, label %2015, !dbg !3846

1999:                                             ; preds = %1993
  %2000 = load ptr, ptr %9, align 8, !dbg !3847
  %2001 = getelementptr inbounds nuw %struct.robot_info, ptr %2000, i32 0, i32 40, !dbg !3848
  %2002 = load i8, ptr %2001, align 4, !dbg !3848
  %2003 = sext i8 %2002 to i32, !dbg !3847
  %2004 = icmp ne i32 %2003, 1, !dbg !3849
  br i1 %2004, label %2005, label %2015, !dbg !3846

2005:                                             ; preds = %1999
  %2006 = load ptr, ptr %9, align 8, !dbg !3850
  %2007 = getelementptr inbounds nuw %struct.robot_info, ptr %2006, i32 0, i32 31, !dbg !3853
  %2008 = load i8, ptr %2007, align 1, !dbg !3853
  %2009 = sext i8 %2008 to i32, !dbg !3850
  %2010 = icmp eq i32 %2009, 0, !dbg !3854
  br i1 %2010, label %2011, label %2014, !dbg !3854

2011:                                             ; preds = %2005
  %2012 = load ptr, ptr %5, align 8, !dbg !3855
  %2013 = getelementptr inbounds nuw %struct.ai_local, ptr %2012, i32 0, i32 3, !dbg !3856
  store i32 3, ptr %2013, align 4, !dbg !3857
  br label %2014, !dbg !3855

2014:                                             ; preds = %2011, %2005
  br label %2063, !dbg !3858

2015:                                             ; preds = %1999, %1993, %1987, %1981, %1975, %1969, %1966
  %2016 = load i32, ptr %6, align 4, !dbg !3859
  %2017 = load i32, ptr @Difficulty_level, align 4, !dbg !3861
  %2018 = mul nsw i32 2, %2017, !dbg !3862
  %2019 = load ptr, ptr %9, align 8, !dbg !3863
  %2020 = getelementptr inbounds nuw %struct.robot_info, ptr %2019, i32 0, i32 41, !dbg !3864
  %2021 = load i8, ptr %2020, align 1, !dbg !3864
  %2022 = sext i8 %2021 to i32, !dbg !3863
  %2023 = add nsw i32 %2018, %2022, !dbg !3865
  %2024 = mul nsw i32 20, %2023, !dbg !3866
  %2025 = mul nsw i32 65536, %2024, !dbg !3867
  %2026 = icmp sgt i32 %2016, %2025, !dbg !3868
  br i1 %2026, label %2027, label %2062, !dbg !3869

2027:                                             ; preds = %2015
  %2028 = load i32, ptr @GameTime, align 4, !dbg !3870
  %2029 = load ptr, ptr %5, align 8, !dbg !3871
  %2030 = getelementptr inbounds nuw %struct.ai_local, ptr %2029, i32 0, i32 11, !dbg !3872
  %2031 = load i32, ptr %2030, align 4, !dbg !3872
  %2032 = sub nsw i32 %2028, %2031, !dbg !3873
  %2033 = load i32, ptr @Difficulty_level, align 4, !dbg !3874
  %2034 = load ptr, ptr %9, align 8, !dbg !3875
  %2035 = getelementptr inbounds nuw %struct.robot_info, ptr %2034, i32 0, i32 41, !dbg !3876
  %2036 = load i8, ptr %2035, align 1, !dbg !3876
  %2037 = sext i8 %2036 to i32, !dbg !3875
  %2038 = add nsw i32 %2033, %2037, !dbg !3877
  %2039 = mul nsw i32 32768, %2038, !dbg !3878
  %2040 = icmp sgt i32 %2032, %2039, !dbg !3879
  br i1 %2040, label %2041, label %2062, !dbg !3880

2041:                                             ; preds = %2027
  %2042 = load i32, ptr %10, align 4, !dbg !3881
  %2043 = icmp eq i32 %2042, 0, !dbg !3882
  br i1 %2043, label %2044, label %2062, !dbg !3883

2044:                                             ; preds = %2041
  %2045 = load ptr, ptr %4, align 8, !dbg !3884
  %2046 = getelementptr inbounds nuw %struct.ai_static, ptr %2045, i32 0, i32 0, !dbg !3885
  %2047 = load i8, ptr %2046, align 4, !dbg !3885
  %2048 = zext i8 %2047 to i32, !dbg !3884
  %2049 = icmp eq i32 %2048, 129, !dbg !3886
  br i1 %2049, label %2050, label %2062, !dbg !3887

2050:                                             ; preds = %2044
  %2051 = load ptr, ptr %5, align 8, !dbg !3888
  %2052 = getelementptr inbounds nuw %struct.ai_local, ptr %2051, i32 0, i32 3, !dbg !3889
  %2053 = load i32, ptr %2052, align 4, !dbg !3889
  %2054 = icmp eq i32 %2053, 2, !dbg !3890
  br i1 %2054, label %2055, label %2062, !dbg !3887

2055:                                             ; preds = %2050
  %2056 = load ptr, ptr %5, align 8, !dbg !3891
  %2057 = getelementptr inbounds nuw %struct.ai_local, ptr %2056, i32 0, i32 3, !dbg !3893
  store i32 0, ptr %2057, align 4, !dbg !3894
  %2058 = load ptr, ptr %4, align 8, !dbg !3895
  %2059 = getelementptr inbounds nuw %struct.ai_static, ptr %2058, i32 0, i32 3, !dbg !3896
  store i16 -1, ptr %2059, align 2, !dbg !3897
  %2060 = load ptr, ptr %4, align 8, !dbg !3898
  %2061 = getelementptr inbounds nuw %struct.ai_static, ptr %2060, i32 0, i32 4, !dbg !3899
  store i16 0, ptr %2061, align 4, !dbg !3900
  br label %2062, !dbg !3901

2062:                                             ; preds = %2055, %2050, %2044, %2041, %2027, %2015
  br label %2063

2063:                                             ; preds = %2062, %2014
  %2064 = load i32, ptr %3, align 4, !dbg !3902
  call void @_Z28ai_multi_send_robot_positionii(i32 noundef %2064, i32 noundef -1), !dbg !3903
  br label %2471, !dbg !3904

2065:                                             ; preds = %1495
  %2066 = load ptr, ptr %2, align 8, !dbg !3905
  %2067 = call noundef i32 @_Z24ai_multiplayer_awarenessP6objecti(ptr noundef %2066, i32 noundef 71), !dbg !3907
  %2068 = icmp ne i32 %2067, 0, !dbg !3907
  br i1 %2068, label %2091, label %2069, !dbg !3908

2069:                                             ; preds = %2065
  %2070 = load ptr, ptr %2, align 8, !dbg !3909
  %2071 = load ptr, ptr %4, align 8, !dbg !3912
  %2072 = call noundef i32 @_Z31maybe_ai_do_actual_firing_stuffP6objectP9ai_static(ptr noundef %2070, ptr noundef %2071), !dbg !3913
  %2073 = icmp ne i32 %2072, 0, !dbg !3913
  br i1 %2073, label %2074, label %2090, !dbg !3913

2074:                                             ; preds = %2069
  %2075 = load ptr, ptr %2, align 8, !dbg !3914
  %2076 = load ptr, ptr %5, align 8, !dbg !3916
  %2077 = load ptr, ptr %9, align 8, !dbg !3917
  call void @_Z19compute_vis_and_vecP6objectP10vms_vectorP8ai_localS2_PiP10robot_infoS5_(ptr noundef %2075, ptr noundef %17, ptr noundef %2076, ptr noundef %7, ptr noundef %10, ptr noundef %2077, ptr noundef %14), !dbg !3918
  %2078 = load ptr, ptr %2, align 8, !dbg !3919
  %2079 = load ptr, ptr %4, align 8, !dbg !3920
  %2080 = load ptr, ptr %5, align 8, !dbg !3921
  %2081 = load ptr, ptr %9, align 8, !dbg !3922
  %2082 = load i32, ptr %6, align 4, !dbg !3923
  %2083 = load i32, ptr %10, align 4, !dbg !3924
  %2084 = load i32, ptr %12, align 4, !dbg !3925
  %2085 = load ptr, ptr %4, align 8, !dbg !3926
  %2086 = getelementptr inbounds nuw %struct.ai_static, ptr %2085, i32 0, i32 1, !dbg !3927
  %2087 = getelementptr inbounds [11 x i8], ptr %2086, i64 0, i64 0, !dbg !3926
  %2088 = load i8, ptr %2087, align 1, !dbg !3926
  %2089 = sext i8 %2088 to i32, !dbg !3926
  call void @_Z25ai_do_actual_firing_stuffP6objectP9ai_staticP8ai_localP10robot_infoP10vms_vectoriS8_iii(ptr noundef %2078, ptr noundef %2079, ptr noundef %2080, ptr noundef %2081, ptr noundef %7, i32 noundef %2082, ptr noundef %16, i32 noundef %2083, i32 noundef %2084, i32 noundef %2089), !dbg !3928
  br label %2090, !dbg !3929

2090:                                             ; preds = %2074, %2069
  br label %2900, !dbg !3930

2091:                                             ; preds = %2065
  %2092 = load ptr, ptr %2, align 8, !dbg !3931
  %2093 = load ptr, ptr %5, align 8, !dbg !3932
  %2094 = load ptr, ptr %9, align 8, !dbg !3933
  call void @_Z19compute_vis_and_vecP6objectP10vms_vectorP8ai_localS2_PiP10robot_infoS5_(ptr noundef %2092, ptr noundef %17, ptr noundef %2093, ptr noundef %7, ptr noundef %10, ptr noundef %2094, ptr noundef %14), !dbg !3934
  %2095 = load i32, ptr %10, align 4, !dbg !3935
  %2096 = icmp eq i32 %2095, 2, !dbg !3937
  br i1 %2096, label %2097, label %2194, !dbg !3937

2097:                                             ; preds = %2091
    #dbg_declare(ptr %35, !3938, !DIExpression(), !3940)
    #dbg_declare(ptr %36, !3941, !DIExpression(), !3942)
    #dbg_declare(ptr %37, !3943, !DIExpression(), !3944)
    #dbg_declare(ptr %38, !3945, !DIExpression(), !3946)
    #dbg_declare(ptr %39, !3947, !DIExpression(), !3948)
  %2098 = load ptr, ptr @ConsoleObject, align 8, !dbg !3949
  %2099 = getelementptr inbounds nuw %struct.object, ptr %2098, i32 0, i32 12, !dbg !3949
  %2100 = getelementptr inbounds nuw %struct.vms_matrix, ptr %2099, i32 0, i32 2, !dbg !3949
  %2101 = call noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef %2100, ptr noundef %7), !dbg !3949
  store i32 %2101, ptr %39, align 4, !dbg !3950
  %2102 = load i32, ptr %39, align 4, !dbg !3951
  %2103 = icmp sgt i32 %2102, 0, !dbg !3953
  br i1 %2103, label %2104, label %2122, !dbg !3953

2104:                                             ; preds = %2097
  %2105 = load ptr, ptr @ConsoleObject, align 8, !dbg !3954
  %2106 = getelementptr inbounds nuw %struct.object, ptr %2105, i32 0, i32 12, !dbg !3956
  %2107 = getelementptr inbounds nuw %struct.vms_matrix, ptr %2106, i32 0, i32 2, !dbg !3957
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %36, ptr align 4 %2107, i64 12, i1 false), !dbg !3958
  br label %2108, !dbg !3959

2108:                                             ; preds = %2104
  %2109 = getelementptr inbounds nuw %struct.vms_vector, ptr %36, i32 0, i32 0, !dbg !3960
  %2110 = load i32, ptr %2109, align 4, !dbg !3960
  %2111 = sub nsw i32 0, %2110, !dbg !3960
  %2112 = getelementptr inbounds nuw %struct.vms_vector, ptr %36, i32 0, i32 0, !dbg !3960
  store i32 %2111, ptr %2112, align 4, !dbg !3960
  %2113 = getelementptr inbounds nuw %struct.vms_vector, ptr %36, i32 0, i32 1, !dbg !3960
  %2114 = load i32, ptr %2113, align 4, !dbg !3960
  %2115 = sub nsw i32 0, %2114, !dbg !3960
  %2116 = getelementptr inbounds nuw %struct.vms_vector, ptr %36, i32 0, i32 1, !dbg !3960
  store i32 %2115, ptr %2116, align 4, !dbg !3960
  %2117 = getelementptr inbounds nuw %struct.vms_vector, ptr %36, i32 0, i32 2, !dbg !3960
  %2118 = load i32, ptr %2117, align 4, !dbg !3960
  %2119 = sub nsw i32 0, %2118, !dbg !3960
  %2120 = getelementptr inbounds nuw %struct.vms_vector, ptr %36, i32 0, i32 2, !dbg !3960
  store i32 %2119, ptr %2120, align 4, !dbg !3960
  br label %2121, !dbg !3960

2121:                                             ; preds = %2108
  br label %2149, !dbg !3962

2122:                                             ; preds = %2097
    #dbg_declare(ptr %40, !3963, !DIExpression(), !3965)
  %2123 = load ptr, ptr @ConsoleObject, align 8, !dbg !3966
  %2124 = getelementptr inbounds nuw %struct.object, ptr %2123, i32 0, i32 12, !dbg !3966
  %2125 = getelementptr inbounds nuw %struct.vms_matrix, ptr %2124, i32 0, i32 0, !dbg !3966
  %2126 = call noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef %2125, ptr noundef %7), !dbg !3966
  store i32 %2126, ptr %40, align 4, !dbg !3967
  %2127 = load ptr, ptr @ConsoleObject, align 8, !dbg !3968
  %2128 = getelementptr inbounds nuw %struct.object, ptr %2127, i32 0, i32 12, !dbg !3969
  %2129 = getelementptr inbounds nuw %struct.vms_matrix, ptr %2128, i32 0, i32 0, !dbg !3970
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %36, ptr align 4 %2129, i64 12, i1 false), !dbg !3971
  %2130 = load i32, ptr %40, align 4, !dbg !3972
  %2131 = icmp sgt i32 %2130, 0, !dbg !3974
  br i1 %2131, label %2132, label %2147, !dbg !3974

2132:                                             ; preds = %2122
  br label %2133, !dbg !3975

2133:                                             ; preds = %2132
  %2134 = getelementptr inbounds nuw %struct.vms_vector, ptr %36, i32 0, i32 0, !dbg !3977
  %2135 = load i32, ptr %2134, align 4, !dbg !3977
  %2136 = sub nsw i32 0, %2135, !dbg !3977
  %2137 = getelementptr inbounds nuw %struct.vms_vector, ptr %36, i32 0, i32 0, !dbg !3977
  store i32 %2136, ptr %2137, align 4, !dbg !3977
  %2138 = getelementptr inbounds nuw %struct.vms_vector, ptr %36, i32 0, i32 1, !dbg !3977
  %2139 = load i32, ptr %2138, align 4, !dbg !3977
  %2140 = sub nsw i32 0, %2139, !dbg !3977
  %2141 = getelementptr inbounds nuw %struct.vms_vector, ptr %36, i32 0, i32 1, !dbg !3977
  store i32 %2140, ptr %2141, align 4, !dbg !3977
  %2142 = getelementptr inbounds nuw %struct.vms_vector, ptr %36, i32 0, i32 2, !dbg !3977
  %2143 = load i32, ptr %2142, align 4, !dbg !3977
  %2144 = sub nsw i32 0, %2143, !dbg !3977
  %2145 = getelementptr inbounds nuw %struct.vms_vector, ptr %36, i32 0, i32 2, !dbg !3977
  store i32 %2144, ptr %2145, align 4, !dbg !3977
  br label %2146, !dbg !3977

2146:                                             ; preds = %2133
  br label %2148, !dbg !3979

2147:                                             ; preds = %2122
  br label %2148

2148:                                             ; preds = %2147, %2146
  br label %2149

2149:                                             ; preds = %2148, %2121
  %2150 = load ptr, ptr @ConsoleObject, align 8, !dbg !3980
  %2151 = getelementptr inbounds nuw %struct.object, ptr %2150, i32 0, i32 13, !dbg !3981
  %2152 = load i32, ptr %2151, align 4, !dbg !3981
  %2153 = load ptr, ptr %2, align 8, !dbg !3982
  %2154 = getelementptr inbounds nuw %struct.object, ptr %2153, i32 0, i32 13, !dbg !3983
  %2155 = load i32, ptr %2154, align 4, !dbg !3983
  %2156 = add nsw i32 %2152, %2155, !dbg !3984
  %2157 = load i32, ptr %3, align 4, !dbg !3985
  %2158 = mul nsw i32 %2157, 4, !dbg !3986
  %2159 = load i32, ptr @FrameCount, align 4, !dbg !3987
  %2160 = add nsw i32 %2158, %2159, !dbg !3988
  %2161 = and i32 %2160, 63, !dbg !3989
  %2162 = shl i32 %2161, 12, !dbg !3990
  %2163 = add nsw i32 %2156, %2162, !dbg !3991
  %2164 = mul nsw i32 2, %2163, !dbg !3992
  %2165 = call noundef ptr @_Z12vm_vec_scaleP10vms_vectori(ptr noundef %36, i32 noundef %2164), !dbg !3993
  %2166 = load ptr, ptr @ConsoleObject, align 8, !dbg !3994
  %2167 = getelementptr inbounds nuw %struct.object, ptr %2166, i32 0, i32 11, !dbg !3995
  %2168 = call noundef ptr @_Z10vm_vec_addP10vms_vectorS0_S0_(ptr noundef %35, ptr noundef %2167, ptr noundef %36), !dbg !3996
  call void @_Z18make_random_vectorP10vms_vector(ptr noundef %38), !dbg !3997
  %2169 = call noundef ptr @_Z17vm_vec_scale_add2P10vms_vectorS0_i(ptr noundef %35, ptr noundef %38, i32 noundef 524288), !dbg !3998
  %2170 = load ptr, ptr %2, align 8, !dbg !3999
  %2171 = getelementptr inbounds nuw %struct.object, ptr %2170, i32 0, i32 11, !dbg !4000
  %2172 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %37, ptr noundef %35, ptr noundef %2171), !dbg !4001
  %2173 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %37), !dbg !4002
  %2174 = load ptr, ptr %2, align 8, !dbg !4003
  call void @_Z19move_towards_vectorP6objectP10vms_vectori(ptr noundef %2174, ptr noundef %37, i32 noundef 0), !dbg !4004
  %2175 = load ptr, ptr %2, align 8, !dbg !4005
  %2176 = load ptr, ptr %9, align 8, !dbg !4006
  %2177 = getelementptr inbounds nuw %struct.robot_info, ptr %2176, i32 0, i32 25, !dbg !4007
  %2178 = load i32, ptr @Difficulty_level, align 4, !dbg !4008
  %2179 = sext i32 %2178 to i64, !dbg !4006
  %2180 = getelementptr inbounds [5 x i32], ptr %2177, i64 0, i64 %2179, !dbg !4006
  %2181 = load i32, ptr %2180, align 4, !dbg !4006
  call void @_Z22ai_turn_towards_vectorP10vms_vectorP6objecti(ptr noundef %7, ptr noundef %2175, i32 noundef %2181), !dbg !4009
  %2182 = load ptr, ptr %2, align 8, !dbg !4010
  %2183 = load ptr, ptr %4, align 8, !dbg !4011
  %2184 = load ptr, ptr %5, align 8, !dbg !4012
  %2185 = load ptr, ptr %9, align 8, !dbg !4013
  %2186 = load i32, ptr %6, align 4, !dbg !4014
  %2187 = load i32, ptr %10, align 4, !dbg !4015
  %2188 = load i32, ptr %12, align 4, !dbg !4016
  %2189 = load ptr, ptr %4, align 8, !dbg !4017
  %2190 = getelementptr inbounds nuw %struct.ai_static, ptr %2189, i32 0, i32 1, !dbg !4018
  %2191 = getelementptr inbounds [11 x i8], ptr %2190, i64 0, i64 0, !dbg !4017
  %2192 = load i8, ptr %2191, align 1, !dbg !4017
  %2193 = sext i8 %2192 to i32, !dbg !4017
  call void @_Z25ai_do_actual_firing_stuffP6objectP9ai_staticP8ai_localP10robot_infoP10vms_vectoriS8_iii(ptr noundef %2182, ptr noundef %2183, ptr noundef %2184, ptr noundef %2185, ptr noundef %7, i32 noundef %2186, ptr noundef %16, i32 noundef %2187, i32 noundef %2188, i32 noundef %2193), !dbg !4019
  br label %2194, !dbg !4020

2194:                                             ; preds = %2149, %2091
  %2195 = load ptr, ptr %4, align 8, !dbg !4021
  %2196 = getelementptr inbounds nuw %struct.ai_static, ptr %2195, i32 0, i32 1, !dbg !4023
  %2197 = getelementptr inbounds [11 x i8], ptr %2196, i64 0, i64 2, !dbg !4021
  %2198 = load i8, ptr %2197, align 1, !dbg !4021
  %2199 = sext i8 %2198 to i32, !dbg !4021
  %2200 = icmp ne i32 %2199, 4, !dbg !4024
  br i1 %2200, label %2201, label %2205, !dbg !4024

2201:                                             ; preds = %2194
  %2202 = load ptr, ptr %4, align 8, !dbg !4025
  %2203 = getelementptr inbounds nuw %struct.ai_static, ptr %2202, i32 0, i32 1, !dbg !4026
  %2204 = getelementptr inbounds [11 x i8], ptr %2203, i64 0, i64 2, !dbg !4025
  store i8 3, ptr %2204, align 1, !dbg !4027
  br label %2217, !dbg !4025

2205:                                             ; preds = %2194
  %2206 = load ptr, ptr %4, align 8, !dbg !4028
  %2207 = getelementptr inbounds nuw %struct.ai_static, ptr %2206, i32 0, i32 1, !dbg !4030
  %2208 = getelementptr inbounds [11 x i8], ptr %2207, i64 0, i64 1, !dbg !4028
  %2209 = load i8, ptr %2208, align 1, !dbg !4028
  %2210 = sext i8 %2209 to i32, !dbg !4028
  %2211 = icmp eq i32 %2210, 4, !dbg !4031
  br i1 %2211, label %2212, label %2216, !dbg !4031

2212:                                             ; preds = %2205
  %2213 = load ptr, ptr %4, align 8, !dbg !4032
  %2214 = getelementptr inbounds nuw %struct.ai_static, ptr %2213, i32 0, i32 1, !dbg !4033
  %2215 = getelementptr inbounds [11 x i8], ptr %2214, i64 0, i64 2, !dbg !4032
  store i8 3, ptr %2215, align 1, !dbg !4034
  br label %2216, !dbg !4032

2216:                                             ; preds = %2212, %2205
  br label %2217

2217:                                             ; preds = %2216, %2201
  %2218 = load i32, ptr %3, align 4, !dbg !4035
  call void @_Z28ai_multi_send_robot_positionii(i32 noundef %2218, i32 noundef -1), !dbg !4036
  br label %2471, !dbg !4037

2219:                                             ; preds = %1495
  %2220 = load i32, ptr %6, align 4, !dbg !4038
  %2221 = load i32, ptr @Difficulty_level, align 4, !dbg !4040
  %2222 = mul nsw i32 %2221, 65536, !dbg !4041
  %2223 = mul nsw i32 %2222, 20, !dbg !4042
  %2224 = add nsw i32 7864320, %2223, !dbg !4043
  %2225 = icmp slt i32 %2220, %2224, !dbg !4044
  br i1 %2225, label %2231, label %2226, !dbg !4045

2226:                                             ; preds = %2219
  %2227 = load ptr, ptr %5, align 8, !dbg !4046
  %2228 = getelementptr inbounds nuw %struct.ai_local, ptr %2227, i32 0, i32 0, !dbg !4047
  %2229 = load i32, ptr %2228, align 4, !dbg !4047
  %2230 = icmp sge i32 %2229, 3, !dbg !4048
  br i1 %2230, label %2231, label %2390, !dbg !4045

2231:                                             ; preds = %2226, %2219
  %2232 = load ptr, ptr %2, align 8, !dbg !4049
  %2233 = load ptr, ptr %5, align 8, !dbg !4051
  %2234 = load ptr, ptr %9, align 8, !dbg !4052
  call void @_Z19compute_vis_and_vecP6objectP10vms_vectorP8ai_localS2_PiP10robot_infoS5_(ptr noundef %2232, ptr noundef %17, ptr noundef %2233, ptr noundef %7, ptr noundef %10, ptr noundef %2234, ptr noundef %14), !dbg !4053
  %2235 = load i32, ptr %10, align 4, !dbg !4054
  %2236 = icmp eq i32 %2235, 2, !dbg !4056
  br i1 %2236, label %2240, label %2237, !dbg !4057

2237:                                             ; preds = %2231
  %2238 = load i32, ptr %15, align 4, !dbg !4058
  %2239 = icmp eq i32 %2238, 2, !dbg !4059
  br i1 %2239, label %2240, label %2272, !dbg !4057

2240:                                             ; preds = %2237, %2231
  %2241 = load ptr, ptr %2, align 8, !dbg !4060
  %2242 = call noundef i32 @_Z24ai_multiplayer_awarenessP6objecti(ptr noundef %2241, i32 noundef 71), !dbg !4063
  %2243 = icmp ne i32 %2242, 0, !dbg !4063
  br i1 %2243, label %2263, label %2244, !dbg !4064

2244:                                             ; preds = %2240
  %2245 = load ptr, ptr %2, align 8, !dbg !4065
  %2246 = load ptr, ptr %4, align 8, !dbg !4068
  %2247 = call noundef i32 @_Z31maybe_ai_do_actual_firing_stuffP6objectP9ai_static(ptr noundef %2245, ptr noundef %2246), !dbg !4069
  %2248 = icmp ne i32 %2247, 0, !dbg !4069
  br i1 %2248, label %2249, label %2262, !dbg !4069

2249:                                             ; preds = %2244
  %2250 = load ptr, ptr %2, align 8, !dbg !4070
  %2251 = load ptr, ptr %4, align 8, !dbg !4071
  %2252 = load ptr, ptr %5, align 8, !dbg !4072
  %2253 = load ptr, ptr %9, align 8, !dbg !4073
  %2254 = load i32, ptr %6, align 4, !dbg !4074
  %2255 = load i32, ptr %10, align 4, !dbg !4075
  %2256 = load i32, ptr %12, align 4, !dbg !4076
  %2257 = load ptr, ptr %4, align 8, !dbg !4077
  %2258 = getelementptr inbounds nuw %struct.ai_static, ptr %2257, i32 0, i32 1, !dbg !4078
  %2259 = getelementptr inbounds [11 x i8], ptr %2258, i64 0, i64 0, !dbg !4077
  %2260 = load i8, ptr %2259, align 1, !dbg !4077
  %2261 = sext i8 %2260 to i32, !dbg !4077
  call void @_Z25ai_do_actual_firing_stuffP6objectP9ai_staticP8ai_localP10robot_infoP10vms_vectoriS8_iii(ptr noundef %2250, ptr noundef %2251, ptr noundef %2252, ptr noundef %2253, ptr noundef %7, i32 noundef %2254, ptr noundef %16, i32 noundef %2255, i32 noundef %2256, i32 noundef %2261), !dbg !4079
  br label %2262, !dbg !4079

2262:                                             ; preds = %2249, %2244
  br label %2900, !dbg !4080

2263:                                             ; preds = %2240
  %2264 = load ptr, ptr %2, align 8, !dbg !4081
  %2265 = load ptr, ptr %9, align 8, !dbg !4082
  %2266 = getelementptr inbounds nuw %struct.robot_info, ptr %2265, i32 0, i32 25, !dbg !4083
  %2267 = load i32, ptr @Difficulty_level, align 4, !dbg !4084
  %2268 = sext i32 %2267 to i64, !dbg !4082
  %2269 = getelementptr inbounds [5 x i32], ptr %2266, i64 0, i64 %2268, !dbg !4082
  %2270 = load i32, ptr %2269, align 4, !dbg !4082
  call void @_Z22ai_turn_towards_vectorP10vms_vectorP6objecti(ptr noundef %7, ptr noundef %2264, i32 noundef %2270), !dbg !4085
  %2271 = load i32, ptr %3, align 4, !dbg !4086
  call void @_Z28ai_multi_send_robot_positionii(i32 noundef %2271, i32 noundef -1), !dbg !4087
  br label %2272, !dbg !4088

2272:                                             ; preds = %2263, %2237
  %2273 = load ptr, ptr %2, align 8, !dbg !4089
  %2274 = load i32, ptr %10, align 4, !dbg !4090
  call void @_Z15do_firing_stuffP6objectiP10vms_vector(ptr noundef %2273, i32 noundef %2274, ptr noundef %7), !dbg !4091
  %2275 = load i32, ptr %10, align 4, !dbg !4092
  %2276 = icmp eq i32 %2275, 2, !dbg !4094
  br i1 %2276, label %2277, label %2356, !dbg !4094

2277:                                             ; preds = %2272
  %2278 = load ptr, ptr %9, align 8, !dbg !4095
  %2279 = getelementptr inbounds nuw %struct.robot_info, ptr %2278, i32 0, i32 31, !dbg !4098
  %2280 = load i8, ptr %2279, align 1, !dbg !4098
  %2281 = sext i8 %2280 to i32, !dbg !4095
  %2282 = icmp eq i32 %2281, 1, !dbg !4099
  br i1 %2282, label %2283, label %2320, !dbg !4099

2283:                                             ; preds = %2277
  %2284 = load ptr, ptr %4, align 8, !dbg !4100
  %2285 = getelementptr inbounds nuw %struct.ai_static, ptr %2284, i32 0, i32 0, !dbg !4102
  store i8 -127, ptr %2285, align 4, !dbg !4103
  %2286 = load ptr, ptr %2, align 8, !dbg !4104
  %2287 = call noundef i32 @_Z24ai_multiplayer_awarenessP6objecti(ptr noundef %2286, i32 noundef 80), !dbg !4106
  %2288 = icmp ne i32 %2287, 0, !dbg !4106
  br i1 %2288, label %2308, label %2289, !dbg !4107

2289:                                             ; preds = %2283
  %2290 = load ptr, ptr %2, align 8, !dbg !4108
  %2291 = load ptr, ptr %4, align 8, !dbg !4111
  %2292 = call noundef i32 @_Z31maybe_ai_do_actual_firing_stuffP6objectP9ai_static(ptr noundef %2290, ptr noundef %2291), !dbg !4112
  %2293 = icmp ne i32 %2292, 0, !dbg !4112
  br i1 %2293, label %2294, label %2307, !dbg !4112

2294:                                             ; preds = %2289
  %2295 = load ptr, ptr %2, align 8, !dbg !4113
  %2296 = load ptr, ptr %4, align 8, !dbg !4114
  %2297 = load ptr, ptr %5, align 8, !dbg !4115
  %2298 = load ptr, ptr %9, align 8, !dbg !4116
  %2299 = load i32, ptr %6, align 4, !dbg !4117
  %2300 = load i32, ptr %10, align 4, !dbg !4118
  %2301 = load i32, ptr %12, align 4, !dbg !4119
  %2302 = load ptr, ptr %4, align 8, !dbg !4120
  %2303 = getelementptr inbounds nuw %struct.ai_static, ptr %2302, i32 0, i32 1, !dbg !4121
  %2304 = getelementptr inbounds [11 x i8], ptr %2303, i64 0, i64 0, !dbg !4120
  %2305 = load i8, ptr %2304, align 1, !dbg !4120
  %2306 = sext i8 %2305 to i32, !dbg !4120
  call void @_Z25ai_do_actual_firing_stuffP6objectP9ai_staticP8ai_localP10robot_infoP10vms_vectoriS8_iii(ptr noundef %2295, ptr noundef %2296, ptr noundef %2297, ptr noundef %2298, ptr noundef %7, i32 noundef %2299, ptr noundef %16, i32 noundef %2300, i32 noundef %2301, i32 noundef %2306), !dbg !4122
  br label %2307, !dbg !4122

2307:                                             ; preds = %2294, %2289
  br label %2900, !dbg !4123

2308:                                             ; preds = %2283
  %2309 = load ptr, ptr %2, align 8, !dbg !4124
  %2310 = load ptr, ptr %5, align 8, !dbg !4125
  %2311 = load i32, ptr %6, align 4, !dbg !4126
  %2312 = load i32, ptr %10, align 4, !dbg !4127
  call void @_Z26ai_move_relative_to_playerP6objectP8ai_localiP10vms_vectoriii(ptr noundef %2309, ptr noundef %2310, i32 noundef %2311, ptr noundef %7, i32 noundef 0, i32 noundef 0, i32 noundef %2312), !dbg !4128
  %2313 = load i32, ptr @ai_evaded, align 4, !dbg !4129
  %2314 = icmp ne i32 %2313, 0, !dbg !4129
  br i1 %2314, label %2315, label %2317, !dbg !4129

2315:                                             ; preds = %2308
  %2316 = load i32, ptr %3, align 4, !dbg !4131
  call void @_Z28ai_multi_send_robot_positionii(i32 noundef %2316, i32 noundef 1), !dbg !4133
  store i32 0, ptr @ai_evaded, align 4, !dbg !4134
  br label %2319, !dbg !4135

2317:                                             ; preds = %2308
  %2318 = load i32, ptr %3, align 4, !dbg !4136
  call void @_Z28ai_multi_send_robot_positionii(i32 noundef %2318, i32 noundef -1), !dbg !4137
  br label %2319

2319:                                             ; preds = %2317, %2315
  br label %2355, !dbg !4138

2320:                                             ; preds = %2277
  %2321 = load ptr, ptr %2, align 8, !dbg !4139
  %2322 = call noundef i32 @_Z24ai_multiplayer_awarenessP6objecti(ptr noundef %2321, i32 noundef 81), !dbg !4142
  %2323 = icmp ne i32 %2322, 0, !dbg !4142
  br i1 %2323, label %2343, label %2324, !dbg !4143

2324:                                             ; preds = %2320
  %2325 = load ptr, ptr %2, align 8, !dbg !4144
  %2326 = load ptr, ptr %4, align 8, !dbg !4147
  %2327 = call noundef i32 @_Z31maybe_ai_do_actual_firing_stuffP6objectP9ai_static(ptr noundef %2325, ptr noundef %2326), !dbg !4148
  %2328 = icmp ne i32 %2327, 0, !dbg !4148
  br i1 %2328, label %2329, label %2342, !dbg !4148

2329:                                             ; preds = %2324
  %2330 = load ptr, ptr %2, align 8, !dbg !4149
  %2331 = load ptr, ptr %4, align 8, !dbg !4150
  %2332 = load ptr, ptr %5, align 8, !dbg !4151
  %2333 = load ptr, ptr %9, align 8, !dbg !4152
  %2334 = load i32, ptr %6, align 4, !dbg !4153
  %2335 = load i32, ptr %10, align 4, !dbg !4154
  %2336 = load i32, ptr %12, align 4, !dbg !4155
  %2337 = load ptr, ptr %4, align 8, !dbg !4156
  %2338 = getelementptr inbounds nuw %struct.ai_static, ptr %2337, i32 0, i32 1, !dbg !4157
  %2339 = getelementptr inbounds [11 x i8], ptr %2338, i64 0, i64 0, !dbg !4156
  %2340 = load i8, ptr %2339, align 1, !dbg !4156
  %2341 = sext i8 %2340 to i32, !dbg !4156
  call void @_Z25ai_do_actual_firing_stuffP6objectP9ai_staticP8ai_localP10robot_infoP10vms_vectoriS8_iii(ptr noundef %2330, ptr noundef %2331, ptr noundef %2332, ptr noundef %2333, ptr noundef %7, i32 noundef %2334, ptr noundef %16, i32 noundef %2335, i32 noundef %2336, i32 noundef %2341), !dbg !4158
  br label %2342, !dbg !4158

2342:                                             ; preds = %2329, %2324
  br label %2900, !dbg !4159

2343:                                             ; preds = %2320
  %2344 = load ptr, ptr %2, align 8, !dbg !4160
  %2345 = load ptr, ptr %5, align 8, !dbg !4161
  %2346 = load i32, ptr %6, align 4, !dbg !4162
  %2347 = load i32, ptr %10, align 4, !dbg !4163
  call void @_Z26ai_move_relative_to_playerP6objectP8ai_localiP10vms_vectoriii(ptr noundef %2344, ptr noundef %2345, i32 noundef %2346, ptr noundef %7, i32 noundef 0, i32 noundef 1, i32 noundef %2347), !dbg !4164
  %2348 = load i32, ptr @ai_evaded, align 4, !dbg !4165
  %2349 = icmp ne i32 %2348, 0, !dbg !4165
  br i1 %2349, label %2350, label %2352, !dbg !4165

2350:                                             ; preds = %2343
  %2351 = load i32, ptr %3, align 4, !dbg !4167
  call void @_Z28ai_multi_send_robot_positionii(i32 noundef %2351, i32 noundef -1), !dbg !4169
  store i32 0, ptr @ai_evaded, align 4, !dbg !4170
  br label %2354, !dbg !4171

2352:                                             ; preds = %2343
  %2353 = load i32, ptr %3, align 4, !dbg !4172
  call void @_Z28ai_multi_send_robot_positionii(i32 noundef %2353, i32 noundef -1), !dbg !4173
  br label %2354

2354:                                             ; preds = %2352, %2350
  br label %2355

2355:                                             ; preds = %2354, %2319
  br label %2389, !dbg !4174

2356:                                             ; preds = %2272
  %2357 = load ptr, ptr %2, align 8, !dbg !4175
  %2358 = getelementptr inbounds nuw %struct.object, ptr %2357, i32 0, i32 9, !dbg !4177
  %2359 = load i16, ptr %2358, align 2, !dbg !4177
  %2360 = sext i16 %2359 to i32, !dbg !4175
  %2361 = load ptr, ptr %4, align 8, !dbg !4178
  %2362 = getelementptr inbounds nuw %struct.ai_static, ptr %2361, i32 0, i32 2, !dbg !4179
  %2363 = load i16, ptr %2362, align 4, !dbg !4179
  %2364 = sext i16 %2363 to i32, !dbg !4178
  %2365 = icmp ne i32 %2360, %2364, !dbg !4180
  br i1 %2365, label %2366, label %2388, !dbg !4181

2366:                                             ; preds = %2356
  %2367 = load i32, ptr %6, align 4, !dbg !4182
  %2368 = icmp sgt i32 %2367, 5242880, !dbg !4183
  br i1 %2368, label %2369, label %2388, !dbg !4184

2369:                                             ; preds = %2366
  %2370 = load i32, ptr @Game_mode, align 4, !dbg !4185
  %2371 = and i32 %2370, 38, !dbg !4186
  %2372 = icmp ne i32 %2371, 0, !dbg !4187
  br i1 %2372, label %2388, label %2373, !dbg !4184

2373:                                             ; preds = %2369
  %2374 = load ptr, ptr %4, align 8, !dbg !4188
  %2375 = getelementptr inbounds nuw %struct.ai_static, ptr %2374, i32 0, i32 0, !dbg !4191
  %2376 = load i8, ptr %2375, align 4, !dbg !4191
  %2377 = zext i8 %2376 to i32, !dbg !4188
  %2378 = icmp eq i32 %2377, 133, !dbg !4192
  br i1 %2378, label %2379, label %2387, !dbg !4192

2379:                                             ; preds = %2373
  %2380 = load ptr, ptr %4, align 8, !dbg !4193
  %2381 = getelementptr inbounds nuw %struct.ai_static, ptr %2380, i32 0, i32 2, !dbg !4195
  %2382 = load i16, ptr %2381, align 4, !dbg !4195
  %2383 = sext i16 %2382 to i32, !dbg !4193
  %2384 = load ptr, ptr %5, align 8, !dbg !4196
  %2385 = getelementptr inbounds nuw %struct.ai_local, ptr %2384, i32 0, i32 6, !dbg !4197
  store i32 %2383, ptr %2385, align 4, !dbg !4198
  %2386 = load ptr, ptr %2, align 8, !dbg !4199
  call void @_Z22create_path_to_stationP6objecti(ptr noundef %2386, i32 noundef 15), !dbg !4200
  br label %2387, !dbg !4201

2387:                                             ; preds = %2379, %2373
  br label %2471, !dbg !4202

2388:                                             ; preds = %2369, %2366, %2356
  br label %2389

2389:                                             ; preds = %2388, %2355
  br label %2390, !dbg !4203

2390:                                             ; preds = %2389, %2226
  br label %2471, !dbg !4204

2391:                                             ; preds = %1495
    #dbg_declare(ptr %41, !4205, !DIExpression(), !4207)
    #dbg_declare(ptr %42, !4208, !DIExpression(), !4209)
  %2392 = load ptr, ptr %2, align 8, !dbg !4210
  %2393 = getelementptr inbounds nuw %struct.object, ptr %2392, i32 0, i32 2, !dbg !4210
  %2394 = load i8, ptr %2393, align 1, !dbg !4210
  %2395 = zext i8 %2394 to i32, !dbg !4210
  %2396 = icmp eq i32 %2395, 7, !dbg !4210
  %2397 = zext i1 %2396 to i32, !dbg !4210
  call void @_Z7_AssertiPKcS0_i(i32 noundef %2397, ptr noundef @.str.29, ptr noundef @.str.21, i32 noundef 1778), !dbg !4210
  %2398 = load ptr, ptr %2, align 8, !dbg !4211
  %2399 = call noundef i32 @_Z24ai_multiplayer_awarenessP6objecti(ptr noundef %2398, i32 noundef 62), !dbg !4213
  %2400 = icmp ne i32 %2399, 0, !dbg !4213
  br i1 %2400, label %2402, label %2401, !dbg !4214

2401:                                             ; preds = %2391
  br label %2900, !dbg !4215

2402:                                             ; preds = %2391
  %2403 = load ptr, ptr %2, align 8, !dbg !4216
  %2404 = getelementptr inbounds nuw %struct.object, ptr %2403, i32 0, i32 9, !dbg !4217
  %2405 = load i16, ptr %2404, align 2, !dbg !4217
  %2406 = sext i16 %2405 to i64, !dbg !4218
  %2407 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %2406, !dbg !4218
  %2408 = load ptr, ptr %4, align 8, !dbg !4219
  %2409 = getelementptr inbounds nuw %struct.ai_static, ptr %2408, i32 0, i32 1, !dbg !4220
  %2410 = getelementptr inbounds [11 x i8], ptr %2409, i64 0, i64 5, !dbg !4219
  %2411 = load i8, ptr %2410, align 1, !dbg !4219
  %2412 = sext i8 %2411 to i32, !dbg !4219
  call void @_Z28compute_center_point_on_sideP10vms_vectorP7segmenti(ptr noundef %41, ptr noundef %2407, i32 noundef %2412), !dbg !4221
  %2413 = load ptr, ptr %2, align 8, !dbg !4222
  %2414 = getelementptr inbounds nuw %struct.object, ptr %2413, i32 0, i32 11, !dbg !4223
  %2415 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %42, ptr noundef %41, ptr noundef %2414), !dbg !4224
  %2416 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %42), !dbg !4225
  %2417 = load ptr, ptr %2, align 8, !dbg !4226
  %2418 = load ptr, ptr %9, align 8, !dbg !4227
  %2419 = getelementptr inbounds nuw %struct.robot_info, ptr %2418, i32 0, i32 25, !dbg !4228
  %2420 = load i32, ptr @Difficulty_level, align 4, !dbg !4229
  %2421 = sext i32 %2420 to i64, !dbg !4227
  %2422 = getelementptr inbounds [5 x i32], ptr %2419, i64 0, i64 %2421, !dbg !4227
  %2423 = load i32, ptr %2422, align 4, !dbg !4227
  call void @_Z22ai_turn_towards_vectorP10vms_vectorP6objecti(ptr noundef %42, ptr noundef %2417, i32 noundef %2423), !dbg !4230
  %2424 = load ptr, ptr %2, align 8, !dbg !4231
  call void @_Z19move_towards_vectorP6objectP10vms_vectori(ptr noundef %2424, ptr noundef %42, i32 noundef 0), !dbg !4232
  %2425 = load i32, ptr %3, align 4, !dbg !4233
  call void @_Z28ai_multi_send_robot_positionii(i32 noundef %2425, i32 noundef -1), !dbg !4234
  br label %2471, !dbg !4235

2426:                                             ; preds = %1495
  br label %2471, !dbg !4236

2427:                                             ; preds = %1495
  br label %2471, !dbg !4237

2428:                                             ; preds = %1495, %1495, %1495
  %2429 = load ptr, ptr %2, align 8, !dbg !4238
  %2430 = call noundef i32 @_Z24ai_multiplayer_awarenessP6objecti(ptr noundef %2429, i32 noundef 53), !dbg !4240
  %2431 = icmp ne i32 %2430, 0, !dbg !4240
  br i1 %2431, label %2432, label %2455, !dbg !4240

2432:                                             ; preds = %2428
  %2433 = load ptr, ptr %2, align 8, !dbg !4241
  %2434 = load ptr, ptr %4, align 8, !dbg !4243
  %2435 = load ptr, ptr %5, align 8, !dbg !4244
  %2436 = load ptr, ptr %9, align 8, !dbg !4245
  %2437 = load i32, ptr %6, align 4, !dbg !4246
  %2438 = load i32, ptr %10, align 4, !dbg !4247
  %2439 = load i32, ptr %12, align 4, !dbg !4248
  %2440 = load ptr, ptr %4, align 8, !dbg !4249
  %2441 = getelementptr inbounds nuw %struct.ai_static, ptr %2440, i32 0, i32 1, !dbg !4250
  %2442 = getelementptr inbounds [11 x i8], ptr %2441, i64 0, i64 0, !dbg !4249
  %2443 = load i8, ptr %2442, align 1, !dbg !4249
  %2444 = sext i8 %2443 to i32, !dbg !4249
  call void @_Z25ai_do_actual_firing_stuffP6objectP9ai_staticP8ai_localP10robot_infoP10vms_vectoriS8_iii(ptr noundef %2433, ptr noundef %2434, ptr noundef %2435, ptr noundef %2436, ptr noundef %7, i32 noundef %2437, ptr noundef %16, i32 noundef %2438, i32 noundef %2439, i32 noundef %2444), !dbg !4251
  %2445 = load ptr, ptr %9, align 8, !dbg !4252
  %2446 = getelementptr inbounds nuw %struct.robot_info, ptr %2445, i32 0, i32 40, !dbg !4254
  %2447 = load i8, ptr %2446, align 4, !dbg !4254
  %2448 = icmp ne i8 %2447, 0, !dbg !4252
  br i1 %2448, label %2449, label %2454, !dbg !4252

2449:                                             ; preds = %2432
  %2450 = load ptr, ptr %2, align 8, !dbg !4255
  %2451 = load ptr, ptr %5, align 8, !dbg !4256
  %2452 = load i32, ptr %6, align 4, !dbg !4257
  %2453 = load i32, ptr %10, align 4, !dbg !4258
  call void @_Z26ai_move_relative_to_playerP6objectP8ai_localiP10vms_vectoriii(ptr noundef %2450, ptr noundef %2451, i32 noundef %2452, ptr noundef %7, i32 noundef 0, i32 noundef 0, i32 noundef %2453), !dbg !4259
  br label %2454, !dbg !4259

2454:                                             ; preds = %2449, %2432
  br label %2471, !dbg !4260

2455:                                             ; preds = %2428
  br label %2471, !dbg !4261

2456:                                             ; preds = %1495, %1495, %1495, %1495
  br label %2471, !dbg !4262

2457:                                             ; preds = %1495
  %2458 = load ptr, ptr %5, align 8, !dbg !4263
  %2459 = getelementptr inbounds nuw %struct.ai_local, ptr %2458, i32 0, i32 3, !dbg !4263
  %2460 = load i32, ptr %2459, align 4, !dbg !4263
  %2461 = load ptr, ptr %2, align 8, !dbg !4263
  %2462 = ptrtoint ptr %2461 to i64, !dbg !4263
  %2463 = sub i64 %2462, ptrtoint (ptr @Objects to i64), !dbg !4263
  %2464 = sdiv exact i64 %2463, 268, !dbg !4263
  %2465 = load ptr, ptr %4, align 8, !dbg !4263
  %2466 = getelementptr inbounds nuw %struct.ai_static, ptr %2465, i32 0, i32 0, !dbg !4263
  %2467 = load i8, ptr %2466, align 4, !dbg !4263
  %2468 = zext i8 %2467 to i32, !dbg !4263
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.30, i32 noundef %2460, i64 noundef %2464, i32 noundef %2468), !dbg !4263
  %2469 = load ptr, ptr %5, align 8, !dbg !4264
  %2470 = getelementptr inbounds nuw %struct.ai_local, ptr %2469, i32 0, i32 3, !dbg !4265
  store i32 3, ptr %2470, align 4, !dbg !4266
  br label %2471, !dbg !4267

2471:                                             ; preds = %2457, %2456, %2455, %2454, %2427, %2426, %2402, %2390, %2387, %2217, %2063, %1869, %1868, %1751, %1581
  %2472 = load ptr, ptr %2, align 8, !dbg !4268
  %2473 = load ptr, ptr %5, align 8, !dbg !4269
  %2474 = load ptr, ptr %9, align 8, !dbg !4270
  call void @_Z19compute_vis_and_vecP6objectP10vms_vectorP8ai_localS2_PiP10robot_infoS5_(ptr noundef %2472, ptr noundef %17, ptr noundef %2473, ptr noundef %7, ptr noundef %10, ptr noundef %2474, ptr noundef %14), !dbg !4271
  %2475 = load i32, ptr %10, align 4, !dbg !4272
  %2476 = icmp eq i32 %2475, 2, !dbg !4274
  br i1 %2476, label %2477, label %2519, !dbg !4275

2477:                                             ; preds = %2471
  %2478 = load ptr, ptr %4, align 8, !dbg !4276
  %2479 = getelementptr inbounds nuw %struct.ai_static, ptr %2478, i32 0, i32 0, !dbg !4277
  %2480 = load i8, ptr %2479, align 4, !dbg !4277
  %2481 = zext i8 %2480 to i32, !dbg !4276
  %2482 = icmp ne i32 %2481, 134, !dbg !4278
  br i1 %2482, label %2483, label %2519, !dbg !4279

2483:                                             ; preds = %2477
  %2484 = load ptr, ptr %9, align 8, !dbg !4280
  %2485 = getelementptr inbounds nuw %struct.robot_info, ptr %2484, i32 0, i32 40, !dbg !4281
  %2486 = load i8, ptr %2485, align 4, !dbg !4281
  %2487 = icmp ne i8 %2486, 0, !dbg !4280
  br i1 %2487, label %2519, label %2488, !dbg !4279

2488:                                             ; preds = %2483
  %2489 = load ptr, ptr %5, align 8, !dbg !4282
  %2490 = getelementptr inbounds nuw %struct.ai_local, ptr %2489, i32 0, i32 0, !dbg !4285
  %2491 = load i32, ptr %2490, align 4, !dbg !4285
  %2492 = icmp eq i32 %2491, 0, !dbg !4286
  br i1 %2492, label %2493, label %2509, !dbg !4287

2493:                                             ; preds = %2488
  %2494 = load ptr, ptr %4, align 8, !dbg !4288
  %2495 = getelementptr inbounds nuw %struct.ai_static, ptr %2494, i32 0, i32 1, !dbg !4289
  %2496 = getelementptr inbounds [11 x i8], ptr %2495, i64 0, i64 4, !dbg !4288
  %2497 = load i8, ptr %2496, align 1, !dbg !4288
  %2498 = sext i8 %2497 to i32, !dbg !4288
  %2499 = and i32 %2498, 4, !dbg !4290
  %2500 = icmp ne i32 %2499, 0, !dbg !4291
  br i1 %2500, label %2501, label %2509, !dbg !4287

2501:                                             ; preds = %2493
  %2502 = load ptr, ptr %4, align 8, !dbg !4292
  %2503 = getelementptr inbounds nuw %struct.ai_static, ptr %2502, i32 0, i32 1, !dbg !4293
  %2504 = getelementptr inbounds [11 x i8], ptr %2503, i64 0, i64 4, !dbg !4292
  %2505 = load i8, ptr %2504, align 1, !dbg !4294
  %2506 = sext i8 %2505 to i32, !dbg !4294
  %2507 = and i32 %2506, -5, !dbg !4294
  %2508 = trunc i32 %2507 to i8, !dbg !4294
  store i8 %2508, ptr %2504, align 1, !dbg !4294
  br label %2518, !dbg !4292

2509:                                             ; preds = %2493, %2488
  %2510 = load ptr, ptr %5, align 8, !dbg !4295
  %2511 = getelementptr inbounds nuw %struct.ai_local, ptr %2510, i32 0, i32 0, !dbg !4297
  %2512 = load i32, ptr %2511, align 4, !dbg !4297
  %2513 = icmp eq i32 %2512, 0, !dbg !4298
  br i1 %2513, label %2514, label %2517, !dbg !4298

2514:                                             ; preds = %2509
  %2515 = load ptr, ptr %5, align 8, !dbg !4299
  %2516 = getelementptr inbounds nuw %struct.ai_local, ptr %2515, i32 0, i32 0, !dbg !4300
  store i32 3, ptr %2516, align 4, !dbg !4301
  br label %2517, !dbg !4299

2517:                                             ; preds = %2514, %2509
  br label %2518

2518:                                             ; preds = %2517, %2501
  br label %2519, !dbg !4302

2519:                                             ; preds = %2518, %2483, %2477, %2471
  %2520 = load i32, ptr %12, align 4, !dbg !4303
  %2521 = icmp ne i32 %2520, 0, !dbg !4303
  br i1 %2521, label %2530, label %2522, !dbg !4305

2522:                                             ; preds = %2519
  %2523 = load ptr, ptr %4, align 8, !dbg !4306
  %2524 = getelementptr inbounds nuw %struct.ai_static, ptr %2523, i32 0, i32 1, !dbg !4308
  %2525 = getelementptr inbounds [11 x i8], ptr %2524, i64 0, i64 2, !dbg !4306
  %2526 = load i8, ptr %2525, align 1, !dbg !4306
  %2527 = load ptr, ptr %4, align 8, !dbg !4309
  %2528 = getelementptr inbounds nuw %struct.ai_static, ptr %2527, i32 0, i32 1, !dbg !4310
  %2529 = getelementptr inbounds [11 x i8], ptr %2528, i64 0, i64 1, !dbg !4309
  store i8 %2526, ptr %2529, align 1, !dbg !4311
  br label %2530, !dbg !4312

2530:                                             ; preds = %2522, %2519
  %2531 = load ptr, ptr %5, align 8, !dbg !4313
  %2532 = getelementptr inbounds nuw %struct.ai_local, ptr %2531, i32 0, i32 0, !dbg !4313
  %2533 = load i32, ptr %2532, align 4, !dbg !4313
  %2534 = icmp sle i32 %2533, 4, !dbg !4313
  %2535 = zext i1 %2534 to i32, !dbg !4313
  call void @_Z7_AssertiPKcS0_i(i32 noundef %2535, ptr noundef @.str.31, ptr noundef @.str.21, i32 noundef 1840), !dbg !4313
  %2536 = load ptr, ptr %4, align 8, !dbg !4314
  %2537 = getelementptr inbounds nuw %struct.ai_static, ptr %2536, i32 0, i32 1, !dbg !4314
  %2538 = getelementptr inbounds [11 x i8], ptr %2537, i64 0, i64 1, !dbg !4314
  %2539 = load i8, ptr %2538, align 1, !dbg !4314
  %2540 = sext i8 %2539 to i32, !dbg !4314
  %2541 = icmp slt i32 %2540, 8, !dbg !4314
  %2542 = zext i1 %2541 to i32, !dbg !4314
  call void @_Z7_AssertiPKcS0_i(i32 noundef %2542, ptr noundef @.str.32, ptr noundef @.str.21, i32 noundef 1841), !dbg !4314
  %2543 = load ptr, ptr %4, align 8, !dbg !4315
  %2544 = getelementptr inbounds nuw %struct.ai_static, ptr %2543, i32 0, i32 1, !dbg !4315
  %2545 = getelementptr inbounds [11 x i8], ptr %2544, i64 0, i64 2, !dbg !4315
  %2546 = load i8, ptr %2545, align 1, !dbg !4315
  %2547 = sext i8 %2546 to i32, !dbg !4315
  %2548 = icmp slt i32 %2547, 8, !dbg !4315
  %2549 = zext i1 %2548 to i32, !dbg !4315
  call void @_Z7_AssertiPKcS0_i(i32 noundef %2549, ptr noundef @.str.33, ptr noundef @.str.21, i32 noundef 1842), !dbg !4315
  %2550 = load ptr, ptr %5, align 8, !dbg !4316
  %2551 = getelementptr inbounds nuw %struct.ai_local, ptr %2550, i32 0, i32 0, !dbg !4318
  %2552 = load i32, ptr %2551, align 4, !dbg !4318
  %2553 = icmp ne i32 %2552, 0, !dbg !4316
  br i1 %2553, label %2554, label %2607, !dbg !4316

2554:                                             ; preds = %2530
  %2555 = load ptr, ptr %5, align 8, !dbg !4319
  %2556 = getelementptr inbounds nuw %struct.ai_local, ptr %2555, i32 0, i32 0, !dbg !4321
  %2557 = load i32, ptr %2556, align 4, !dbg !4321
  %2558 = sub nsw i32 %2557, 1, !dbg !4322
  %2559 = sext i32 %2558 to i64, !dbg !4323
  %2560 = getelementptr inbounds [4 x [7 x [7 x i8]]], ptr @Ai_transition_table, i64 0, i64 %2559, !dbg !4323
  %2561 = load ptr, ptr %4, align 8, !dbg !4324
  %2562 = getelementptr inbounds nuw %struct.ai_static, ptr %2561, i32 0, i32 1, !dbg !4325
  %2563 = getelementptr inbounds [11 x i8], ptr %2562, i64 0, i64 1, !dbg !4324
  %2564 = load i8, ptr %2563, align 1, !dbg !4324
  %2565 = sext i8 %2564 to i64, !dbg !4323
  %2566 = getelementptr inbounds [7 x [7 x i8]], ptr %2560, i64 0, i64 %2565, !dbg !4323
  %2567 = load ptr, ptr %4, align 8, !dbg !4326
  %2568 = getelementptr inbounds nuw %struct.ai_static, ptr %2567, i32 0, i32 1, !dbg !4327
  %2569 = getelementptr inbounds [11 x i8], ptr %2568, i64 0, i64 2, !dbg !4326
  %2570 = load i8, ptr %2569, align 1, !dbg !4326
  %2571 = sext i8 %2570 to i64, !dbg !4323
  %2572 = getelementptr inbounds [7 x i8], ptr %2566, i64 0, i64 %2571, !dbg !4323
  %2573 = load i8, ptr %2572, align 1, !dbg !4323
  %2574 = sext i8 %2573 to i32, !dbg !4323
  store i32 %2574, ptr %13, align 4, !dbg !4328
  %2575 = load ptr, ptr %5, align 8, !dbg !4329
  %2576 = getelementptr inbounds nuw %struct.ai_local, ptr %2575, i32 0, i32 0, !dbg !4331
  %2577 = load i32, ptr %2576, align 4, !dbg !4331
  %2578 = icmp eq i32 %2577, 4, !dbg !4332
  br i1 %2578, label %2579, label %2586, !dbg !4332

2579:                                             ; preds = %2554
  %2580 = load ptr, ptr %5, align 8, !dbg !4333
  %2581 = getelementptr inbounds nuw %struct.ai_local, ptr %2580, i32 0, i32 0, !dbg !4335
  %2582 = load i32, ptr %2581, align 4, !dbg !4336
  %2583 = add nsw i32 %2582, -1, !dbg !4336
  store i32 %2583, ptr %2581, align 4, !dbg !4336
  %2584 = load ptr, ptr %5, align 8, !dbg !4337
  %2585 = getelementptr inbounds nuw %struct.ai_local, ptr %2584, i32 0, i32 10, !dbg !4338
  store i32 196608, ptr %2585, align 4, !dbg !4339
  br label %2586, !dbg !4340

2586:                                             ; preds = %2579, %2554
  %2587 = load i32, ptr %13, align 4, !dbg !4341
  %2588 = icmp eq i32 %2587, 7, !dbg !4343
  br i1 %2588, label %2589, label %2590, !dbg !4343

2589:                                             ; preds = %2586
  store i32 1, ptr %13, align 4, !dbg !4344
  br label %2590, !dbg !4345

2590:                                             ; preds = %2589, %2586
  %2591 = load ptr, ptr %4, align 8, !dbg !4346
  %2592 = getelementptr inbounds nuw %struct.ai_static, ptr %2591, i32 0, i32 1, !dbg !4348
  %2593 = getelementptr inbounds [11 x i8], ptr %2592, i64 0, i64 1, !dbg !4346
  %2594 = load i8, ptr %2593, align 1, !dbg !4346
  %2595 = sext i8 %2594 to i32, !dbg !4346
  %2596 = icmp eq i32 %2595, 0, !dbg !4349
  br i1 %2596, label %2597, label %2601, !dbg !4349

2597:                                             ; preds = %2590
  %2598 = load ptr, ptr %4, align 8, !dbg !4350
  %2599 = getelementptr inbounds nuw %struct.ai_static, ptr %2598, i32 0, i32 1, !dbg !4351
  %2600 = getelementptr inbounds [11 x i8], ptr %2599, i64 0, i64 1, !dbg !4350
  store i8 1, ptr %2600, align 1, !dbg !4352
  br label %2601, !dbg !4350

2601:                                             ; preds = %2597, %2590
  %2602 = load i32, ptr %13, align 4, !dbg !4353
  %2603 = trunc i32 %2602 to i8, !dbg !4353
  %2604 = load ptr, ptr %4, align 8, !dbg !4354
  %2605 = getelementptr inbounds nuw %struct.ai_static, ptr %2604, i32 0, i32 1, !dbg !4355
  %2606 = getelementptr inbounds [11 x i8], ptr %2605, i64 0, i64 2, !dbg !4354
  store i8 %2603, ptr %2606, align 1, !dbg !4356
  br label %2607, !dbg !4357

2607:                                             ; preds = %2601, %2530
  %2608 = load ptr, ptr %4, align 8, !dbg !4358
  %2609 = getelementptr inbounds nuw %struct.ai_static, ptr %2608, i32 0, i32 1, !dbg !4360
  %2610 = getelementptr inbounds [11 x i8], ptr %2609, i64 0, i64 2, !dbg !4358
  %2611 = load i8, ptr %2610, align 1, !dbg !4358
  %2612 = sext i8 %2611 to i32, !dbg !4358
  %2613 = icmp eq i32 %2612, 5, !dbg !4361
  br i1 %2613, label %2614, label %2637, !dbg !4362

2614:                                             ; preds = %2607
    #dbg_declare(ptr %43, !4363, !DIExpression(), !4365)
    #dbg_declare(ptr %44, !4366, !DIExpression(), !4367)
  %2615 = load ptr, ptr %2, align 8, !dbg !4368
  %2616 = getelementptr inbounds nuw %struct.object, ptr %2615, i32 0, i32 2, !dbg !4369
  %2617 = load i8, ptr %2616, align 1, !dbg !4369
  %2618 = zext i8 %2617 to i64, !dbg !4370
  %2619 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %2618, !dbg !4370
  %2620 = getelementptr inbounds nuw %struct.robot_info, ptr %2619, i32 0, i32 9, !dbg !4371
  %2621 = load i8, ptr %2620, align 2, !dbg !4371
  %2622 = sext i8 %2621 to i32, !dbg !4370
  store i32 %2622, ptr %44, align 4, !dbg !4372
  store i32 0, ptr %43, align 4, !dbg !4373
  br label %2623, !dbg !4375

2623:                                             ; preds = %2633, %2614
  %2624 = load i32, ptr %43, align 4, !dbg !4376
  %2625 = load i32, ptr %44, align 4, !dbg !4378
  %2626 = icmp slt i32 %2624, %2625, !dbg !4379
  br i1 %2626, label %2627, label %2636, !dbg !4380

2627:                                             ; preds = %2623
  %2628 = load ptr, ptr %5, align 8, !dbg !4381
  %2629 = getelementptr inbounds nuw %struct.ai_local, ptr %2628, i32 0, i32 17, !dbg !4382
  %2630 = load i32, ptr %43, align 4, !dbg !4383
  %2631 = sext i32 %2630 to i64, !dbg !4381
  %2632 = getelementptr inbounds [10 x i8], ptr %2629, i64 0, i64 %2631, !dbg !4381
  store i8 5, ptr %2632, align 1, !dbg !4384
  br label %2633, !dbg !4381

2633:                                             ; preds = %2627
  %2634 = load i32, ptr %43, align 4, !dbg !4385
  %2635 = add nsw i32 %2634, 1, !dbg !4385
  store i32 %2635, ptr %43, align 4, !dbg !4385
  br label %2623, !dbg !4386, !llvm.loop !4387

2636:                                             ; preds = %2623
  br label %2637, !dbg !4389

2637:                                             ; preds = %2636, %2607
  %2638 = load ptr, ptr %9, align 8, !dbg !4390
  %2639 = load ptr, ptr %5, align 8, !dbg !4392
  %2640 = call noundef i32 @_Z13ready_to_fireP10robot_infoP8ai_local(ptr noundef %2638, ptr noundef %2639), !dbg !4393
  %2641 = icmp ne i32 %2640, 0, !dbg !4393
  br i1 %2641, label %2642, label %2653, !dbg !4394

2642:                                             ; preds = %2637
  %2643 = load ptr, ptr %4, align 8, !dbg !4395
  %2644 = getelementptr inbounds nuw %struct.ai_static, ptr %2643, i32 0, i32 1, !dbg !4396
  %2645 = getelementptr inbounds [11 x i8], ptr %2644, i64 0, i64 2, !dbg !4395
  %2646 = load i8, ptr %2645, align 1, !dbg !4395
  %2647 = sext i8 %2646 to i32, !dbg !4395
  %2648 = icmp eq i32 %2647, 5, !dbg !4397
  br i1 %2648, label %2649, label %2653, !dbg !4394

2649:                                             ; preds = %2642
  %2650 = load ptr, ptr %4, align 8, !dbg !4398
  %2651 = getelementptr inbounds nuw %struct.ai_static, ptr %2650, i32 0, i32 1, !dbg !4399
  %2652 = getelementptr inbounds [11 x i8], ptr %2651, i64 0, i64 1, !dbg !4398
  store i8 5, ptr %2652, align 1, !dbg !4400
  br label %2653, !dbg !4398

2653:                                             ; preds = %2649, %2642, %2637
  %2654 = load ptr, ptr %4, align 8, !dbg !4401
  %2655 = getelementptr inbounds nuw %struct.ai_static, ptr %2654, i32 0, i32 1, !dbg !4403
  %2656 = getelementptr inbounds [11 x i8], ptr %2655, i64 0, i64 2, !dbg !4401
  %2657 = load i8, ptr %2656, align 1, !dbg !4401
  %2658 = sext i8 %2657 to i32, !dbg !4401
  %2659 = icmp ne i32 %2658, 4, !dbg !4404
  br i1 %2659, label %2660, label %2855, !dbg !4405

2660:                                             ; preds = %2653
  %2661 = load ptr, ptr %2, align 8, !dbg !4406
  %2662 = getelementptr inbounds nuw %struct.object, ptr %2661, i32 0, i32 2, !dbg !4407
  %2663 = load i8, ptr %2662, align 1, !dbg !4407
  %2664 = zext i8 %2663 to i32, !dbg !4406
  %2665 = icmp ne i32 %2664, 7, !dbg !4408
  br i1 %2665, label %2666, label %2855, !dbg !4405

2666:                                             ; preds = %2660
  %2667 = load ptr, ptr %4, align 8, !dbg !4409
  %2668 = getelementptr inbounds nuw %struct.ai_static, ptr %2667, i32 0, i32 1, !dbg !4411
  %2669 = getelementptr inbounds [11 x i8], ptr %2668, i64 0, i64 1, !dbg !4409
  %2670 = load i8, ptr %2669, align 1, !dbg !4409
  %2671 = sext i8 %2670 to i32, !dbg !4409
  switch i32 %2671, label %2846 [
    i32 0, label %2672
    i32 1, label %2695
    i32 2, label %2719
    i32 3, label %2740
    i32 5, label %2769
    i32 6, label %2819
    i32 4, label %2845
  ], !dbg !4412

2672:                                             ; preds = %2666
  %2673 = load ptr, ptr %2, align 8, !dbg !4413
  %2674 = load ptr, ptr %5, align 8, !dbg !4415
  %2675 = load ptr, ptr %9, align 8, !dbg !4416
  call void @_Z19compute_vis_and_vecP6objectP10vms_vectorP8ai_localS2_PiP10robot_infoS5_(ptr noundef %2673, ptr noundef %17, ptr noundef %2674, ptr noundef %7, ptr noundef %10, ptr noundef %2675, ptr noundef %14), !dbg !4417
  %2676 = load ptr, ptr %2, align 8, !dbg !4418
  %2677 = getelementptr inbounds nuw %struct.object, ptr %2676, i32 0, i32 12, !dbg !4418
  %2678 = getelementptr inbounds nuw %struct.vms_matrix, ptr %2677, i32 0, i32 2, !dbg !4418
  %2679 = call noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef %2678, ptr noundef %7), !dbg !4418
  store i32 %2679, ptr %8, align 4, !dbg !4419
  %2680 = load i32, ptr %8, align 4, !dbg !4420
  %2681 = icmp sge i32 %2680, 32768, !dbg !4422
  br i1 %2681, label %2682, label %2694, !dbg !4422

2682:                                             ; preds = %2672
  %2683 = load ptr, ptr %4, align 8, !dbg !4423
  %2684 = getelementptr inbounds nuw %struct.ai_static, ptr %2683, i32 0, i32 1, !dbg !4425
  %2685 = getelementptr inbounds [11 x i8], ptr %2684, i64 0, i64 2, !dbg !4423
  %2686 = load i8, ptr %2685, align 1, !dbg !4423
  %2687 = sext i8 %2686 to i32, !dbg !4423
  %2688 = icmp eq i32 %2687, 1, !dbg !4426
  br i1 %2688, label %2689, label %2693, !dbg !4426

2689:                                             ; preds = %2682
  %2690 = load ptr, ptr %4, align 8, !dbg !4427
  %2691 = getelementptr inbounds nuw %struct.ai_static, ptr %2690, i32 0, i32 1, !dbg !4428
  %2692 = getelementptr inbounds [11 x i8], ptr %2691, i64 0, i64 2, !dbg !4427
  store i8 2, ptr %2692, align 1, !dbg !4429
  br label %2693, !dbg !4427

2693:                                             ; preds = %2689, %2682
  br label %2694, !dbg !4430

2694:                                             ; preds = %2693, %2672
  br label %2854, !dbg !4431

2695:                                             ; preds = %2666
  %2696 = load ptr, ptr %4, align 8, !dbg !4432
  %2697 = getelementptr inbounds nuw %struct.ai_static, ptr %2696, i32 0, i32 1, !dbg !4434
  %2698 = getelementptr inbounds [11 x i8], ptr %2697, i64 0, i64 2, !dbg !4432
  %2699 = load i8, ptr %2698, align 1, !dbg !4432
  %2700 = sext i8 %2699 to i32, !dbg !4432
  %2701 = icmp eq i32 %2700, 1, !dbg !4435
  br i1 %2701, label %2702, label %2718, !dbg !4435

2702:                                             ; preds = %2695
  %2703 = load ptr, ptr %2, align 8, !dbg !4436
  %2704 = load ptr, ptr %5, align 8, !dbg !4438
  %2705 = load ptr, ptr %9, align 8, !dbg !4439
  call void @_Z19compute_vis_and_vecP6objectP10vms_vectorP8ai_localS2_PiP10robot_infoS5_(ptr noundef %2703, ptr noundef %17, ptr noundef %2704, ptr noundef %7, ptr noundef %10, ptr noundef %2705, ptr noundef %14), !dbg !4440
  %2706 = load ptr, ptr %9, align 8, !dbg !4441
  %2707 = load ptr, ptr %5, align 8, !dbg !4443
  %2708 = call noundef i32 @_Z13ready_to_fireP10robot_infoP8ai_local(ptr noundef %2706, ptr noundef %2707), !dbg !4444
  %2709 = icmp ne i32 %2708, 0, !dbg !4444
  br i1 %2709, label %2710, label %2717, !dbg !4445

2710:                                             ; preds = %2702
  %2711 = load i32, ptr %10, align 4, !dbg !4446
  %2712 = icmp ne i32 %2711, 0, !dbg !4447
  br i1 %2712, label %2713, label %2717, !dbg !4445

2713:                                             ; preds = %2710
  %2714 = load ptr, ptr %4, align 8, !dbg !4448
  %2715 = getelementptr inbounds nuw %struct.ai_static, ptr %2714, i32 0, i32 1, !dbg !4450
  %2716 = getelementptr inbounds [11 x i8], ptr %2715, i64 0, i64 2, !dbg !4448
  store i8 5, ptr %2716, align 1, !dbg !4451
  br label %2717, !dbg !4452

2717:                                             ; preds = %2713, %2710, %2702
  br label %2718, !dbg !4453

2718:                                             ; preds = %2717, %2695
  br label %2854, !dbg !4454

2719:                                             ; preds = %2666
  %2720 = load ptr, ptr %2, align 8, !dbg !4455
  %2721 = call noundef i32 @_Z24ai_multiplayer_awarenessP6objecti(ptr noundef %2720, i32 noundef 60), !dbg !4457
  %2722 = icmp ne i32 %2721, 0, !dbg !4457
  br i1 %2722, label %2724, label %2723, !dbg !4458

2723:                                             ; preds = %2719
  br label %2900, !dbg !4459

2724:                                             ; preds = %2719
  %2725 = load ptr, ptr %2, align 8, !dbg !4460
  %2726 = load ptr, ptr %5, align 8, !dbg !4461
  %2727 = load ptr, ptr %9, align 8, !dbg !4462
  call void @_Z19compute_vis_and_vecP6objectP10vms_vectorP8ai_localS2_PiP10robot_infoS5_(ptr noundef %2725, ptr noundef %17, ptr noundef %2726, ptr noundef %7, ptr noundef %10, ptr noundef %2727, ptr noundef %14), !dbg !4463
  %2728 = load i32, ptr %10, align 4, !dbg !4464
  %2729 = icmp eq i32 %2728, 2, !dbg !4466
  br i1 %2729, label %2730, label %2739, !dbg !4466

2730:                                             ; preds = %2724
  %2731 = load ptr, ptr %2, align 8, !dbg !4467
  %2732 = load ptr, ptr %9, align 8, !dbg !4469
  %2733 = getelementptr inbounds nuw %struct.robot_info, ptr %2732, i32 0, i32 25, !dbg !4470
  %2734 = load i32, ptr @Difficulty_level, align 4, !dbg !4471
  %2735 = sext i32 %2734 to i64, !dbg !4469
  %2736 = getelementptr inbounds [5 x i32], ptr %2733, i64 0, i64 %2735, !dbg !4469
  %2737 = load i32, ptr %2736, align 4, !dbg !4469
  call void @_Z22ai_turn_towards_vectorP10vms_vectorP6objecti(ptr noundef %7, ptr noundef %2731, i32 noundef %2737), !dbg !4472
  %2738 = load i32, ptr %3, align 4, !dbg !4473
  call void @_Z28ai_multi_send_robot_positionii(i32 noundef %2738, i32 noundef -1), !dbg !4474
  br label %2739, !dbg !4475

2739:                                             ; preds = %2730, %2724
  br label %2854, !dbg !4476

2740:                                             ; preds = %2666
  %2741 = load ptr, ptr %2, align 8, !dbg !4477
  %2742 = load ptr, ptr %5, align 8, !dbg !4478
  %2743 = load ptr, ptr %9, align 8, !dbg !4479
  call void @_Z19compute_vis_and_vecP6objectP10vms_vectorP8ai_localS2_PiP10robot_infoS5_(ptr noundef %2741, ptr noundef %17, ptr noundef %2742, ptr noundef %7, ptr noundef %10, ptr noundef %2743, ptr noundef %14), !dbg !4480
  %2744 = load i32, ptr @Game_mode, align 4, !dbg !4481
  %2745 = and i32 %2744, 38, !dbg !4483
  %2746 = icmp ne i32 %2745, 0, !dbg !4484
  br i1 %2746, label %2747, label %2750, !dbg !4485

2747:                                             ; preds = %2740
  %2748 = load i32, ptr %10, align 4, !dbg !4486
  %2749 = icmp ne i32 %2748, 0, !dbg !4487
  br i1 %2749, label %2750, label %2768, !dbg !4485

2750:                                             ; preds = %2747, %2740
  %2751 = load ptr, ptr %2, align 8, !dbg !4488
  %2752 = call noundef i32 @_Z24ai_multiplayer_awarenessP6objecti(ptr noundef %2751, i32 noundef 68), !dbg !4491
  %2753 = icmp ne i32 %2752, 0, !dbg !4491
  br i1 %2753, label %2755, label %2754, !dbg !4492

2754:                                             ; preds = %2750
  br label %2900, !dbg !4493

2755:                                             ; preds = %2750
  %2756 = load i32, ptr %10, align 4, !dbg !4494
  %2757 = icmp eq i32 %2756, 2, !dbg !4496
  br i1 %2757, label %2758, label %2767, !dbg !4496

2758:                                             ; preds = %2755
  %2759 = load ptr, ptr %2, align 8, !dbg !4497
  %2760 = load ptr, ptr %9, align 8, !dbg !4499
  %2761 = getelementptr inbounds nuw %struct.robot_info, ptr %2760, i32 0, i32 25, !dbg !4500
  %2762 = load i32, ptr @Difficulty_level, align 4, !dbg !4501
  %2763 = sext i32 %2762 to i64, !dbg !4499
  %2764 = getelementptr inbounds [5 x i32], ptr %2761, i64 0, i64 %2763, !dbg !4499
  %2765 = load i32, ptr %2764, align 4, !dbg !4499
  call void @_Z22ai_turn_towards_vectorP10vms_vectorP6objecti(ptr noundef %7, ptr noundef %2759, i32 noundef %2765), !dbg !4502
  %2766 = load i32, ptr %3, align 4, !dbg !4503
  call void @_Z28ai_multi_send_robot_positionii(i32 noundef %2766, i32 noundef -1), !dbg !4504
  br label %2767, !dbg !4505

2767:                                             ; preds = %2758, %2755
  br label %2768, !dbg !4506

2768:                                             ; preds = %2767, %2747
  br label %2854, !dbg !4507

2769:                                             ; preds = %2666
  %2770 = load ptr, ptr %2, align 8, !dbg !4508
  %2771 = load ptr, ptr %5, align 8, !dbg !4509
  %2772 = load ptr, ptr %9, align 8, !dbg !4510
  call void @_Z19compute_vis_and_vecP6objectP10vms_vectorP8ai_localS2_PiP10robot_infoS5_(ptr noundef %2770, ptr noundef %17, ptr noundef %2771, ptr noundef %7, ptr noundef %10, ptr noundef %2772, ptr noundef %14), !dbg !4511
  %2773 = load i32, ptr %10, align 4, !dbg !4512
  %2774 = icmp eq i32 %2773, 2, !dbg !4514
  br i1 %2774, label %2775, label %2806, !dbg !4514

2775:                                             ; preds = %2769
  %2776 = load ptr, ptr %2, align 8, !dbg !4515
  %2777 = call noundef i32 @_Z24ai_multiplayer_awarenessP6objecti(ptr noundef %2776, i32 noundef 93), !dbg !4518
  %2778 = icmp ne i32 %2777, 0, !dbg !4518
  br i1 %2778, label %2797, label %2779, !dbg !4519

2779:                                             ; preds = %2775
  %2780 = load i32, ptr @Game_mode, align 4, !dbg !4520
  %2781 = and i32 %2780, 38, !dbg !4523
  %2782 = icmp ne i32 %2781, 0, !dbg !4520
  br i1 %2782, label %2783, label %2796, !dbg !4520

2783:                                             ; preds = %2779
  %2784 = load ptr, ptr %2, align 8, !dbg !4524
  %2785 = load ptr, ptr %4, align 8, !dbg !4526
  %2786 = load ptr, ptr %5, align 8, !dbg !4527
  %2787 = load ptr, ptr %9, align 8, !dbg !4528
  %2788 = load i32, ptr %6, align 4, !dbg !4529
  %2789 = load i32, ptr %10, align 4, !dbg !4530
  %2790 = load i32, ptr %12, align 4, !dbg !4531
  %2791 = load ptr, ptr %4, align 8, !dbg !4532
  %2792 = getelementptr inbounds nuw %struct.ai_static, ptr %2791, i32 0, i32 1, !dbg !4533
  %2793 = getelementptr inbounds [11 x i8], ptr %2792, i64 0, i64 0, !dbg !4532
  %2794 = load i8, ptr %2793, align 1, !dbg !4532
  %2795 = sext i8 %2794 to i32, !dbg !4532
  call void @_Z25ai_do_actual_firing_stuffP6objectP9ai_staticP8ai_localP10robot_infoP10vms_vectoriS8_iii(ptr noundef %2784, ptr noundef %2785, ptr noundef %2786, ptr noundef %2787, ptr noundef %7, i32 noundef %2788, ptr noundef %16, i32 noundef %2789, i32 noundef %2790, i32 noundef %2795), !dbg !4534
  br label %2900, !dbg !4535

2796:                                             ; preds = %2779
  br label %2797, !dbg !4536

2797:                                             ; preds = %2796, %2775
  %2798 = load ptr, ptr %2, align 8, !dbg !4537
  %2799 = load ptr, ptr %9, align 8, !dbg !4538
  %2800 = getelementptr inbounds nuw %struct.robot_info, ptr %2799, i32 0, i32 25, !dbg !4539
  %2801 = load i32, ptr @Difficulty_level, align 4, !dbg !4540
  %2802 = sext i32 %2801 to i64, !dbg !4538
  %2803 = getelementptr inbounds [5 x i32], ptr %2800, i64 0, i64 %2802, !dbg !4538
  %2804 = load i32, ptr %2803, align 4, !dbg !4538
  call void @_Z22ai_turn_towards_vectorP10vms_vectorP6objecti(ptr noundef %7, ptr noundef %2798, i32 noundef %2804), !dbg !4541
  %2805 = load i32, ptr %3, align 4, !dbg !4542
  call void @_Z28ai_multi_send_robot_positionii(i32 noundef %2805, i32 noundef -1), !dbg !4543
  br label %2806, !dbg !4544

2806:                                             ; preds = %2797, %2769
  %2807 = load ptr, ptr %2, align 8, !dbg !4545
  %2808 = load ptr, ptr %4, align 8, !dbg !4546
  %2809 = load ptr, ptr %5, align 8, !dbg !4547
  %2810 = load ptr, ptr %9, align 8, !dbg !4548
  %2811 = load i32, ptr %6, align 4, !dbg !4549
  %2812 = load i32, ptr %10, align 4, !dbg !4550
  %2813 = load i32, ptr %12, align 4, !dbg !4551
  %2814 = load ptr, ptr %4, align 8, !dbg !4552
  %2815 = getelementptr inbounds nuw %struct.ai_static, ptr %2814, i32 0, i32 1, !dbg !4553
  %2816 = getelementptr inbounds [11 x i8], ptr %2815, i64 0, i64 0, !dbg !4552
  %2817 = load i8, ptr %2816, align 1, !dbg !4552
  %2818 = sext i8 %2817 to i32, !dbg !4552
  call void @_Z25ai_do_actual_firing_stuffP6objectP9ai_staticP8ai_localP10robot_infoP10vms_vectoriS8_iii(ptr noundef %2807, ptr noundef %2808, ptr noundef %2809, ptr noundef %2810, ptr noundef %7, i32 noundef %2811, ptr noundef %16, i32 noundef %2812, i32 noundef %2813, i32 noundef %2818), !dbg !4554
  br label %2854, !dbg !4555

2819:                                             ; preds = %2666
  %2820 = load i32, ptr %11, align 4, !dbg !4556
  %2821 = and i32 %2820, 3, !dbg !4558
  %2822 = icmp ne i32 %2821, 0, !dbg !4559
  br i1 %2822, label %2844, label %2823, !dbg !4560

2823:                                             ; preds = %2819
  %2824 = load ptr, ptr %2, align 8, !dbg !4561
  %2825 = load ptr, ptr %5, align 8, !dbg !4563
  %2826 = load ptr, ptr %9, align 8, !dbg !4564
  call void @_Z19compute_vis_and_vecP6objectP10vms_vectorP8ai_localS2_PiP10robot_infoS5_(ptr noundef %2824, ptr noundef %17, ptr noundef %2825, ptr noundef %7, ptr noundef %10, ptr noundef %2826, ptr noundef %14), !dbg !4565
  %2827 = load i32, ptr %10, align 4, !dbg !4566
  %2828 = icmp eq i32 %2827, 2, !dbg !4568
  br i1 %2828, label %2829, label %2843, !dbg !4568

2829:                                             ; preds = %2823
  %2830 = load ptr, ptr %2, align 8, !dbg !4569
  %2831 = call noundef i32 @_Z24ai_multiplayer_awarenessP6objecti(ptr noundef %2830, i32 noundef 69), !dbg !4572
  %2832 = icmp ne i32 %2831, 0, !dbg !4572
  br i1 %2832, label %2834, label %2833, !dbg !4573

2833:                                             ; preds = %2829
  br label %2900, !dbg !4574

2834:                                             ; preds = %2829
  %2835 = load ptr, ptr %2, align 8, !dbg !4575
  %2836 = load ptr, ptr %9, align 8, !dbg !4576
  %2837 = getelementptr inbounds nuw %struct.robot_info, ptr %2836, i32 0, i32 25, !dbg !4577
  %2838 = load i32, ptr @Difficulty_level, align 4, !dbg !4578
  %2839 = sext i32 %2838 to i64, !dbg !4576
  %2840 = getelementptr inbounds [5 x i32], ptr %2837, i64 0, i64 %2839, !dbg !4576
  %2841 = load i32, ptr %2840, align 4, !dbg !4576
  call void @_Z22ai_turn_towards_vectorP10vms_vectorP6objecti(ptr noundef %7, ptr noundef %2835, i32 noundef %2841), !dbg !4579
  %2842 = load i32, ptr %3, align 4, !dbg !4580
  call void @_Z28ai_multi_send_robot_positionii(i32 noundef %2842, i32 noundef -1), !dbg !4581
  br label %2843, !dbg !4582

2843:                                             ; preds = %2834, %2823
  br label %2844, !dbg !4583

2844:                                             ; preds = %2843, %2819
  br label %2854, !dbg !4584

2845:                                             ; preds = %2666
  br label %2854, !dbg !4585

2846:                                             ; preds = %2666
  %2847 = load i32, ptr %3, align 4, !dbg !4586
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 1, ptr noundef @.str.34, i32 noundef %2847), !dbg !4586
  %2848 = load ptr, ptr %4, align 8, !dbg !4587
  %2849 = getelementptr inbounds nuw %struct.ai_static, ptr %2848, i32 0, i32 1, !dbg !4588
  %2850 = getelementptr inbounds [11 x i8], ptr %2849, i64 0, i64 2, !dbg !4587
  store i8 1, ptr %2850, align 1, !dbg !4589
  %2851 = load ptr, ptr %4, align 8, !dbg !4590
  %2852 = getelementptr inbounds nuw %struct.ai_static, ptr %2851, i32 0, i32 1, !dbg !4591
  %2853 = getelementptr inbounds [11 x i8], ptr %2852, i64 0, i64 1, !dbg !4590
  store i8 1, ptr %2853, align 1, !dbg !4592
  br label %2854, !dbg !4593

2854:                                             ; preds = %2846, %2845, %2844, %2806, %2768, %2739, %2718, %2694
  br label %2855, !dbg !4594

2855:                                             ; preds = %2854, %2660, %2653
  %2856 = load i32, ptr %10, align 4, !dbg !4595
  %2857 = icmp eq i32 %2856, 0, !dbg !4597
  br i1 %2857, label %2858, label %2900, !dbg !4597

2858:                                             ; preds = %2855
  %2859 = load ptr, ptr %4, align 8, !dbg !4598
  %2860 = getelementptr inbounds nuw %struct.ai_static, ptr %2859, i32 0, i32 1, !dbg !4600
  %2861 = getelementptr inbounds [11 x i8], ptr %2860, i64 0, i64 0, !dbg !4598
  %2862 = load i8, ptr %2861, align 1, !dbg !4601
  %2863 = add i8 %2862, 1, !dbg !4601
  store i8 %2863, ptr %2861, align 1, !dbg !4601
  %2864 = load ptr, ptr %4, align 8, !dbg !4602
  %2865 = getelementptr inbounds nuw %struct.ai_static, ptr %2864, i32 0, i32 1, !dbg !4604
  %2866 = getelementptr inbounds [11 x i8], ptr %2865, i64 0, i64 0, !dbg !4602
  %2867 = load i8, ptr %2866, align 1, !dbg !4602
  %2868 = sext i8 %2867 to i32, !dbg !4602
  %2869 = load ptr, ptr %2, align 8, !dbg !4605
  %2870 = getelementptr inbounds nuw %struct.object, ptr %2869, i32 0, i32 2, !dbg !4606
  %2871 = load i8, ptr %2870, align 1, !dbg !4606
  %2872 = zext i8 %2871 to i64, !dbg !4607
  %2873 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %2872, !dbg !4607
  %2874 = getelementptr inbounds nuw %struct.robot_info, ptr %2873, i32 0, i32 9, !dbg !4608
  %2875 = load i8, ptr %2874, align 2, !dbg !4608
  %2876 = sext i8 %2875 to i32, !dbg !4607
  %2877 = icmp sge i32 %2868, %2876, !dbg !4609
  br i1 %2877, label %2878, label %2899, !dbg !4609

2878:                                             ; preds = %2858
  %2879 = load ptr, ptr %9, align 8, !dbg !4610
  %2880 = getelementptr inbounds nuw %struct.robot_info, ptr %2879, i32 0, i32 9, !dbg !4612
  %2881 = load i8, ptr %2880, align 2, !dbg !4612
  %2882 = sext i8 %2881 to i32, !dbg !4610
  %2883 = icmp eq i32 %2882, 1, !dbg !4613
  br i1 %2883, label %2890, label %2884, !dbg !4614

2884:                                             ; preds = %2878
  %2885 = load ptr, ptr %9, align 8, !dbg !4615
  %2886 = getelementptr inbounds nuw %struct.robot_info, ptr %2885, i32 0, i32 8, !dbg !4616
  %2887 = load i8, ptr %2886, align 1, !dbg !4616
  %2888 = sext i8 %2887 to i32, !dbg !4615
  %2889 = icmp eq i32 %2888, -1, !dbg !4617
  br i1 %2889, label %2890, label %2894, !dbg !4614

2890:                                             ; preds = %2884, %2878
  %2891 = load ptr, ptr %4, align 8, !dbg !4618
  %2892 = getelementptr inbounds nuw %struct.ai_static, ptr %2891, i32 0, i32 1, !dbg !4619
  %2893 = getelementptr inbounds [11 x i8], ptr %2892, i64 0, i64 0, !dbg !4618
  store i8 0, ptr %2893, align 1, !dbg !4620
  br label %2898, !dbg !4618

2894:                                             ; preds = %2884
  %2895 = load ptr, ptr %4, align 8, !dbg !4621
  %2896 = getelementptr inbounds nuw %struct.ai_static, ptr %2895, i32 0, i32 1, !dbg !4622
  %2897 = getelementptr inbounds [11 x i8], ptr %2896, i64 0, i64 0, !dbg !4621
  store i8 1, ptr %2897, align 1, !dbg !4623
  br label %2898

2898:                                             ; preds = %2894, %2890
  br label %2899, !dbg !4624

2899:                                             ; preds = %2898, %2858
  br label %2900, !dbg !4625

2900:                                             ; preds = %126, %141, %174, %481, %642, %717, %976, %996, %1027, %1064, %1101, %1126, %1183, %1553, %1640, %1666, %1704, %1819, %1930, %2090, %2262, %2307, %2342, %2401, %2723, %2754, %2783, %2833, %2899, %2855
  ret void, !dbg !4626
}

declare void @_Z7_AssertiPKcS0_i(i32 noundef, ptr noundef, ptr noundef, i32 noundef) #1

declare noundef i32 @_Z24do_any_robot_dying_frameP6object(ptr noundef) #1

declare void @_Z4Int3v() #1

declare void @_Z22mprintf_animation_infoP6object(ptr noundef) #1

declare void @_Z19compute_vis_and_vecP6objectP10vms_vectorP8ai_localS2_PiP10robot_infoS5_(ptr noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef) #1

declare noundef i32 @_Z27object_to_object_visibilityP6objectS0_i(ptr noundef, ptr noundef, i32 noundef) #1

declare noundef i32 @_Z27vm_vec_normalized_dir_quickP10vms_vectorS0_S0_(ptr noundef, ptr noundef, ptr noundef) #1

declare void @_Z14calc_gun_pointP10vms_vectorP6objecti(ptr noundef, ptr noundef, i32 noundef) #1

declare noundef i32 @_Z6P_Randv() #1

declare void @_Z21create_path_to_playerP6objectii(ptr noundef, i32 noundef, i32 noundef) #1

declare void @_Z27move_towards_segment_centerP6object(ptr noundef) #1

declare void @_Z22attempt_to_resume_pathP6object(ptr noundef) #1

declare void @_Z21create_n_segment_pathP6objectii(ptr noundef, i32 noundef, i32 noundef) #1

declare void @_Z29create_n_segment_path_to_doorP6objectii(ptr noundef, i32 noundef, i32 noundef) #1

declare void @_Z14ai_follow_pathP6objectiiP10vms_vector(ptr noundef, i32 noundef, i32 noundef, ptr noundef) #1

declare noundef i32 @_Z24ai_multiplayer_awarenessP6objecti(ptr noundef, i32 noundef) #1

declare void @_Z28ai_multi_send_robot_positionii(i32 noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z6fixmulii(i32 noundef %0, i32 noundef %1) #3 !dbg !4627 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !4630, !DIExpression(), !4631)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !4632, !DIExpression(), !4633)
  %5 = load i32, ptr %3, align 4, !dbg !4634
  %6 = sext i32 %5 to i64, !dbg !4634
  %7 = load i32, ptr %4, align 4, !dbg !4635
  %8 = sext i32 %7 to i64, !dbg !4635
  %9 = mul nsw i64 %6, %8, !dbg !4636
  %10 = ashr i64 %9, 16, !dbg !4637
  %11 = trunc i64 %10 to i32, !dbg !4638
  ret i32 %11, !dbg !4639
}

declare noundef i32 @_Z18do_silly_animationP6object(ptr noundef) #1

declare void @_Z18ai_frame_animationP6object(ptr noundef) #1

declare void @_Z13do_boss_stuffP6objecti(ptr noundef, i32 noundef) #1

declare void @_Z21move_away_from_playerP6objectP10vms_vectori(ptr noundef, ptr noundef, i32 noundef) #1

declare noundef i32 @_Z25openable_doors_in_segmenti(i32 noundef) #1

declare void @_Z14do_snipe_frameP6objectiiP10vms_vector(ptr noundef, i32 noundef, i32 noundef, ptr noundef) #1

; Function Attrs: nounwind
declare i32 @fprintf(ptr noundef, ptr noundef, ...) #4

declare void @_Z15do_escort_frameP6objectii(ptr noundef, i32 noundef, i32 noundef) #1

declare void @_Z26ai_move_relative_to_playerP6objectP8ai_localiP10vms_vectoriii(ptr noundef, ptr noundef, i32 noundef, ptr noundef, i32 noundef, i32 noundef, i32 noundef) #1

declare noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef, ptr noundef) #1

declare noundef i32 @_Z21Laser_create_new_easyP10vms_vectorS0_iii(ptr noundef, ptr noundef, i32 noundef, i32 noundef, i32 noundef) #1

declare void @_Z14do_thief_frameP6objectiiP10vms_vector(ptr noundef, i32 noundef, i32 noundef, ptr noundef) #1

declare noundef i32 @_Z31maybe_ai_do_actual_firing_stuffP6objectP9ai_static(ptr noundef, ptr noundef) #1

declare void @_Z25ai_do_actual_firing_stuffP6objectP9ai_staticP8ai_localP10robot_infoP10vms_vectoriS8_iii(ptr noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef, i32 noundef, ptr noundef, i32 noundef, i32 noundef, i32 noundef) #1

declare void @_Z22create_path_to_stationP6objecti(ptr noundef, i32 noundef) #1

declare void @_Z22ai_turn_towards_vectorP10vms_vectorP6objecti(ptr noundef, ptr noundef, i32 noundef) #1

declare void @_Z15do_firing_stuffP6objectiP10vms_vector(ptr noundef, i32 noundef, ptr noundef) #1

declare noundef ptr @_Z10vm_vec_addP10vms_vectorS0_S0_(ptr noundef, ptr noundef, ptr noundef) #1

declare noundef ptr @_Z12vm_vec_scaleP10vms_vectori(ptr noundef, i32 noundef) #1

declare void @_Z18make_random_vectorP10vms_vector(ptr noundef) #1

declare noundef ptr @_Z17vm_vec_scale_add2P10vms_vectorS0_i(ptr noundef, ptr noundef, i32 noundef) #1

declare noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef, ptr noundef, ptr noundef) #1

declare noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef) #1

declare void @_Z19move_towards_vectorP6objectP10vms_vectori(ptr noundef, ptr noundef, i32 noundef) #1

declare void @_Z28compute_center_point_on_sideP10vms_vectorP7segmenti(ptr noundef, ptr noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z19add_awareness_eventP6objecti(ptr noundef %0, i32 noundef %1) #0 !dbg !4640 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !4643, !DIExpression(), !4644)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !4645, !DIExpression(), !4646)
  %6 = load i32, ptr %5, align 4, !dbg !4647
  %7 = icmp eq i32 %6, 4, !dbg !4649
  br i1 %7, label %14, label %8, !dbg !4650

8:                                                ; preds = %2
  %9 = load i32, ptr %5, align 4, !dbg !4651
  %10 = icmp eq i32 %9, 2, !dbg !4652
  br i1 %10, label %14, label %11, !dbg !4653

11:                                               ; preds = %8
  %12 = load i32, ptr %5, align 4, !dbg !4654
  %13 = icmp eq i32 %12, 3, !dbg !4655
  br i1 %13, label %14, label %15, !dbg !4653

14:                                               ; preds = %11, %8, %2
  call void @_Z17ai_do_cloak_stuffv(), !dbg !4656
  br label %15, !dbg !4656

15:                                               ; preds = %14, %11
  %16 = load i32, ptr @Num_awareness_events, align 4, !dbg !4657
  %17 = icmp slt i32 %16, 64, !dbg !4659
  br i1 %17, label %18, label %58, !dbg !4659

18:                                               ; preds = %15
  %19 = load i32, ptr %5, align 4, !dbg !4660
  %20 = icmp eq i32 %19, 2, !dbg !4663
  br i1 %20, label %24, label %21, !dbg !4664

21:                                               ; preds = %18
  %22 = load i32, ptr %5, align 4, !dbg !4665
  %23 = icmp eq i32 %22, 4, !dbg !4666
  br i1 %23, label %24, label %36, !dbg !4664

24:                                               ; preds = %21, %18
  %25 = load ptr, ptr %4, align 8, !dbg !4667
  %26 = getelementptr inbounds nuw %struct.object, ptr %25, i32 0, i32 2, !dbg !4669
  %27 = load i8, ptr %26, align 1, !dbg !4669
  %28 = zext i8 %27 to i32, !dbg !4667
  %29 = icmp eq i32 %28, 11, !dbg !4670
  br i1 %29, label %30, label %35, !dbg !4670

30:                                               ; preds = %24
  %31 = call noundef i32 @_Z6P_Randv(), !dbg !4671
  %32 = icmp sgt i32 %31, 3276, !dbg !4673
  br i1 %32, label %33, label %34, !dbg !4673

33:                                               ; preds = %30
  store i32 0, ptr %3, align 4, !dbg !4674
  br label %60, !dbg !4674

34:                                               ; preds = %30
  br label %35, !dbg !4675

35:                                               ; preds = %34, %24
  br label %36, !dbg !4676

36:                                               ; preds = %35, %21
  %37 = load ptr, ptr %4, align 8, !dbg !4677
  %38 = getelementptr inbounds nuw %struct.object, ptr %37, i32 0, i32 9, !dbg !4678
  %39 = load i16, ptr %38, align 2, !dbg !4678
  %40 = load i32, ptr @Num_awareness_events, align 4, !dbg !4679
  %41 = sext i32 %40 to i64, !dbg !4680
  %42 = getelementptr inbounds [64 x %struct.awareness_event], ptr @Awareness_events, i64 0, i64 %41, !dbg !4680
  %43 = getelementptr inbounds nuw %struct.awareness_event, ptr %42, i32 0, i32 0, !dbg !4681
  store i16 %39, ptr %43, align 4, !dbg !4682
  %44 = load ptr, ptr %4, align 8, !dbg !4683
  %45 = getelementptr inbounds nuw %struct.object, ptr %44, i32 0, i32 11, !dbg !4684
  %46 = load i32, ptr @Num_awareness_events, align 4, !dbg !4685
  %47 = sext i32 %46 to i64, !dbg !4686
  %48 = getelementptr inbounds [64 x %struct.awareness_event], ptr @Awareness_events, i64 0, i64 %47, !dbg !4686
  %49 = getelementptr inbounds nuw %struct.awareness_event, ptr %48, i32 0, i32 2, !dbg !4687
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %49, ptr align 4 %45, i64 12, i1 false), !dbg !4688
  %50 = load i32, ptr %5, align 4, !dbg !4689
  %51 = trunc i32 %50 to i16, !dbg !4689
  %52 = load i32, ptr @Num_awareness_events, align 4, !dbg !4690
  %53 = sext i32 %52 to i64, !dbg !4691
  %54 = getelementptr inbounds [64 x %struct.awareness_event], ptr @Awareness_events, i64 0, i64 %53, !dbg !4691
  %55 = getelementptr inbounds nuw %struct.awareness_event, ptr %54, i32 0, i32 1, !dbg !4692
  store i16 %51, ptr %55, align 2, !dbg !4693
  %56 = load i32, ptr @Num_awareness_events, align 4, !dbg !4694
  %57 = add nsw i32 %56, 1, !dbg !4694
  store i32 %57, ptr @Num_awareness_events, align 4, !dbg !4694
  br label %59, !dbg !4695

58:                                               ; preds = %15
  br label %59

59:                                               ; preds = %58, %36
  store i32 1, ptr %3, align 4, !dbg !4696
  br label %60, !dbg !4696

60:                                               ; preds = %59, %33
  %61 = load i32, ptr %3, align 4, !dbg !4697
  ret i32 %61, !dbg !4697
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z22create_awareness_eventP6objecti(ptr noundef %0, i32 noundef %1) #0 !dbg !4698 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !4701, !DIExpression(), !4702)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !4703, !DIExpression(), !4704)
  %5 = load i32, ptr @Game_mode, align 4, !dbg !4705
  %6 = and i32 %5, 38, !dbg !4707
  %7 = icmp ne i32 %6, 0, !dbg !4708
  br i1 %7, label %8, label %12, !dbg !4709

8:                                                ; preds = %2
  %9 = load i32, ptr @Game_mode, align 4, !dbg !4710
  %10 = and i32 %9, 8, !dbg !4711
  %11 = icmp ne i32 %10, 0, !dbg !4712
  br i1 %11, label %12, label %33, !dbg !4709

12:                                               ; preds = %8, %2
  %13 = load ptr, ptr %3, align 8, !dbg !4713
  %14 = load i32, ptr %4, align 4, !dbg !4716
  %15 = call noundef i32 @_Z19add_awareness_eventP6objecti(ptr noundef %13, i32 noundef %14), !dbg !4717
  %16 = icmp ne i32 %15, 0, !dbg !4717
  br i1 %16, label %17, label %32, !dbg !4717

17:                                               ; preds = %12
  %18 = call noundef i32 @_Z6P_Randv(), !dbg !4718
  %19 = load i32, ptr %4, align 4, !dbg !4721
  %20 = add nsw i32 %19, 4, !dbg !4722
  %21 = mul nsw i32 %18, %20, !dbg !4723
  %22 = ashr i32 %21, 15, !dbg !4724
  %23 = icmp sgt i32 %22, 4, !dbg !4725
  br i1 %23, label %24, label %27, !dbg !4725

24:                                               ; preds = %17
  %25 = load i32, ptr @Overall_agitation, align 4, !dbg !4726
  %26 = add nsw i32 %25, 1, !dbg !4726
  store i32 %26, ptr @Overall_agitation, align 4, !dbg !4726
  br label %27, !dbg !4727

27:                                               ; preds = %24, %17
  %28 = load i32, ptr @Overall_agitation, align 4, !dbg !4728
  %29 = icmp sgt i32 %28, 100, !dbg !4730
  br i1 %29, label %30, label %31, !dbg !4730

30:                                               ; preds = %27
  store i32 100, ptr @Overall_agitation, align 4, !dbg !4731
  br label %31, !dbg !4732

31:                                               ; preds = %30, %27
  br label %32, !dbg !4733

32:                                               ; preds = %31, %12
  br label %33, !dbg !4734

33:                                               ; preds = %32, %8
  ret void, !dbg !4735
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z7pae_auxiii(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 !dbg !4736 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
    #dbg_declare(ptr %4, !4739, !DIExpression(), !4740)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !4741, !DIExpression(), !4742)
  store i32 %2, ptr %6, align 4
    #dbg_declare(ptr %6, !4743, !DIExpression(), !4744)
    #dbg_declare(ptr %7, !4745, !DIExpression(), !4746)
  %8 = load i32, ptr %4, align 4, !dbg !4747
  %9 = sext i32 %8 to i64, !dbg !4749
  %10 = getelementptr inbounds [900 x i8], ptr @New_awareness, i64 0, i64 %9, !dbg !4749
  %11 = load i8, ptr %10, align 1, !dbg !4749
  %12 = sext i8 %11 to i32, !dbg !4749
  %13 = load i32, ptr %5, align 4, !dbg !4750
  %14 = icmp slt i32 %12, %13, !dbg !4751
  br i1 %14, label %15, label %21, !dbg !4751

15:                                               ; preds = %3
  %16 = load i32, ptr %5, align 4, !dbg !4752
  %17 = trunc i32 %16 to i8, !dbg !4752
  %18 = load i32, ptr %4, align 4, !dbg !4753
  %19 = sext i32 %18 to i64, !dbg !4754
  %20 = getelementptr inbounds [900 x i8], ptr @New_awareness, i64 0, i64 %19, !dbg !4754
  store i8 %17, ptr %20, align 1, !dbg !4755
  br label %21, !dbg !4754

21:                                               ; preds = %15, %3
  store i32 0, ptr %7, align 4, !dbg !4756
  br label %22, !dbg !4758

22:                                               ; preds = %72, %21
  %23 = load i32, ptr %7, align 4, !dbg !4759
  %24 = icmp slt i32 %23, 6, !dbg !4761
  br i1 %24, label %25, label %75, !dbg !4762

25:                                               ; preds = %22
  %26 = load i32, ptr %4, align 4, !dbg !4763
  %27 = sext i32 %26 to i64, !dbg !4763
  %28 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %27, !dbg !4763
  %29 = getelementptr inbounds nuw %struct.segment, ptr %28, i32 0, i32 1, !dbg !4763
  %30 = load i32, ptr %7, align 4, !dbg !4763
  %31 = sext i32 %30 to i64, !dbg !4763
  %32 = getelementptr inbounds [6 x i16], ptr %29, i64 0, i64 %31, !dbg !4763
  %33 = load i16, ptr %32, align 2, !dbg !4763
  %34 = sext i16 %33 to i32, !dbg !4763
  %35 = icmp sgt i32 %34, -1, !dbg !4763
  br i1 %35, label %36, label %71, !dbg !4763

36:                                               ; preds = %25
  %37 = load i32, ptr %6, align 4, !dbg !4765
  %38 = icmp sle i32 %37, 3, !dbg !4767
  br i1 %38, label %39, label %70, !dbg !4767

39:                                               ; preds = %36
  %40 = load i32, ptr %5, align 4, !dbg !4768
  %41 = icmp eq i32 %40, 4, !dbg !4770
  br i1 %41, label %42, label %56, !dbg !4770

42:                                               ; preds = %39
  %43 = load i32, ptr %4, align 4, !dbg !4771
  %44 = sext i32 %43 to i64, !dbg !4772
  %45 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %44, !dbg !4772
  %46 = getelementptr inbounds nuw %struct.segment, ptr %45, i32 0, i32 1, !dbg !4773
  %47 = load i32, ptr %7, align 4, !dbg !4774
  %48 = sext i32 %47 to i64, !dbg !4772
  %49 = getelementptr inbounds [6 x i16], ptr %46, i64 0, i64 %48, !dbg !4772
  %50 = load i16, ptr %49, align 2, !dbg !4772
  %51 = sext i16 %50 to i32, !dbg !4772
  %52 = load i32, ptr %5, align 4, !dbg !4775
  %53 = sub nsw i32 %52, 1, !dbg !4776
  %54 = load i32, ptr %6, align 4, !dbg !4777
  %55 = add nsw i32 %54, 1, !dbg !4778
  call void @_Z7pae_auxiii(i32 noundef %51, i32 noundef %53, i32 noundef %55), !dbg !4779
  br label %69, !dbg !4779

56:                                               ; preds = %39
  %57 = load i32, ptr %4, align 4, !dbg !4780
  %58 = sext i32 %57 to i64, !dbg !4781
  %59 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %58, !dbg !4781
  %60 = getelementptr inbounds nuw %struct.segment, ptr %59, i32 0, i32 1, !dbg !4782
  %61 = load i32, ptr %7, align 4, !dbg !4783
  %62 = sext i32 %61 to i64, !dbg !4781
  %63 = getelementptr inbounds [6 x i16], ptr %60, i64 0, i64 %62, !dbg !4781
  %64 = load i16, ptr %63, align 2, !dbg !4781
  %65 = sext i16 %64 to i32, !dbg !4781
  %66 = load i32, ptr %5, align 4, !dbg !4784
  %67 = load i32, ptr %6, align 4, !dbg !4785
  %68 = add nsw i32 %67, 1, !dbg !4786
  call void @_Z7pae_auxiii(i32 noundef %65, i32 noundef %66, i32 noundef %68), !dbg !4787
  br label %69

69:                                               ; preds = %56, %42
  br label %70, !dbg !4788

70:                                               ; preds = %69, %36
  br label %71, !dbg !4789

71:                                               ; preds = %70, %25
  br label %72, !dbg !4763

72:                                               ; preds = %71
  %73 = load i32, ptr %7, align 4, !dbg !4790
  %74 = add nsw i32 %73, 1, !dbg !4790
  store i32 %74, ptr %7, align 4, !dbg !4790
  br label %22, !dbg !4791, !llvm.loop !4792

75:                                               ; preds = %22
  ret void, !dbg !4794
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z24process_awareness_eventsv() #0 !dbg !4795 {
  %1 = alloca i32, align 4
    #dbg_declare(ptr %1, !4796, !DIExpression(), !4797)
  %2 = load i32, ptr @Game_mode, align 4, !dbg !4798
  %3 = and i32 %2, 38, !dbg !4800
  %4 = icmp ne i32 %3, 0, !dbg !4801
  br i1 %4, label %5, label %9, !dbg !4802

5:                                                ; preds = %0
  %6 = load i32, ptr @Game_mode, align 4, !dbg !4803
  %7 = and i32 %6, 8, !dbg !4804
  %8 = icmp ne i32 %7, 0, !dbg !4805
  br i1 %8, label %9, label %35, !dbg !4802

9:                                                ; preds = %5, %0
  %10 = load i32, ptr @Highest_segment_index, align 4, !dbg !4806
  %11 = add nsw i32 %10, 1, !dbg !4808
  %12 = sext i32 %11 to i64, !dbg !4809
  %13 = mul i64 1, %12, !dbg !4810
  call void @llvm.memset.p0.i64(ptr align 1 @New_awareness, i8 0, i64 %13, i1 false), !dbg !4811
  store i32 0, ptr %1, align 4, !dbg !4812
  br label %14, !dbg !4814

14:                                               ; preds = %31, %9
  %15 = load i32, ptr %1, align 4, !dbg !4815
  %16 = load i32, ptr @Num_awareness_events, align 4, !dbg !4817
  %17 = icmp slt i32 %15, %16, !dbg !4818
  br i1 %17, label %18, label %34, !dbg !4819

18:                                               ; preds = %14
  %19 = load i32, ptr %1, align 4, !dbg !4820
  %20 = sext i32 %19 to i64, !dbg !4821
  %21 = getelementptr inbounds [64 x %struct.awareness_event], ptr @Awareness_events, i64 0, i64 %20, !dbg !4821
  %22 = getelementptr inbounds nuw %struct.awareness_event, ptr %21, i32 0, i32 0, !dbg !4822
  %23 = load i16, ptr %22, align 4, !dbg !4822
  %24 = sext i16 %23 to i32, !dbg !4821
  %25 = load i32, ptr %1, align 4, !dbg !4823
  %26 = sext i32 %25 to i64, !dbg !4824
  %27 = getelementptr inbounds [64 x %struct.awareness_event], ptr @Awareness_events, i64 0, i64 %26, !dbg !4824
  %28 = getelementptr inbounds nuw %struct.awareness_event, ptr %27, i32 0, i32 1, !dbg !4825
  %29 = load i16, ptr %28, align 2, !dbg !4825
  %30 = sext i16 %29 to i32, !dbg !4824
  call void @_Z7pae_auxiii(i32 noundef %24, i32 noundef %30, i32 noundef 1), !dbg !4826
  br label %31, !dbg !4826

31:                                               ; preds = %18
  %32 = load i32, ptr %1, align 4, !dbg !4827
  %33 = add nsw i32 %32, 1, !dbg !4827
  store i32 %33, ptr %1, align 4, !dbg !4827
  br label %14, !dbg !4828, !llvm.loop !4829

34:                                               ; preds = %14
  br label %35, !dbg !4831

35:                                               ; preds = %34, %5
  store i32 0, ptr @Num_awareness_events, align 4, !dbg !4832
  ret void, !dbg !4833
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z24set_player_awareness_allv() #0 !dbg !4834 {
  %1 = alloca i32, align 4
    #dbg_declare(ptr %1, !4835, !DIExpression(), !4836)
  call void @_Z24process_awareness_eventsv(), !dbg !4837
  store i32 0, ptr %1, align 4, !dbg !4838
  br label %2, !dbg !4840

2:                                                ; preds = %77, %0
  %3 = load i32, ptr %1, align 4, !dbg !4841
  %4 = load i32, ptr @Highest_object_index, align 4, !dbg !4843
  %5 = icmp sle i32 %3, %4, !dbg !4844
  br i1 %5, label %6, label %80, !dbg !4845

6:                                                ; preds = %2
  %7 = load i32, ptr %1, align 4, !dbg !4846
  %8 = sext i32 %7 to i64, !dbg !4848
  %9 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %8, !dbg !4848
  %10 = getelementptr inbounds nuw %struct.object, ptr %9, i32 0, i32 5, !dbg !4849
  %11 = load i8, ptr %10, align 2, !dbg !4849
  %12 = zext i8 %11 to i32, !dbg !4848
  %13 = icmp eq i32 %12, 1, !dbg !4850
  br i1 %13, label %14, label %76, !dbg !4850

14:                                               ; preds = %6
  %15 = load i32, ptr %1, align 4, !dbg !4851
  %16 = sext i32 %15 to i64, !dbg !4854
  %17 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %16, !dbg !4854
  %18 = getelementptr inbounds nuw %struct.object, ptr %17, i32 0, i32 9, !dbg !4855
  %19 = load i16, ptr %18, align 2, !dbg !4855
  %20 = sext i16 %19 to i64, !dbg !4856
  %21 = getelementptr inbounds [900 x i8], ptr @New_awareness, i64 0, i64 %20, !dbg !4856
  %22 = load i8, ptr %21, align 1, !dbg !4856
  %23 = sext i8 %22 to i32, !dbg !4856
  %24 = load i32, ptr %1, align 4, !dbg !4857
  %25 = sext i32 %24 to i64, !dbg !4858
  %26 = getelementptr inbounds [350 x %struct.ai_local], ptr @Ai_local_info, i64 0, i64 %25, !dbg !4858
  %27 = getelementptr inbounds nuw %struct.ai_local, ptr %26, i32 0, i32 0, !dbg !4859
  %28 = load i32, ptr %27, align 4, !dbg !4859
  %29 = icmp sgt i32 %23, %28, !dbg !4860
  br i1 %29, label %30, label %48, !dbg !4860

30:                                               ; preds = %14
  %31 = load i32, ptr %1, align 4, !dbg !4861
  %32 = sext i32 %31 to i64, !dbg !4863
  %33 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %32, !dbg !4863
  %34 = getelementptr inbounds nuw %struct.object, ptr %33, i32 0, i32 9, !dbg !4864
  %35 = load i16, ptr %34, align 2, !dbg !4864
  %36 = sext i16 %35 to i64, !dbg !4865
  %37 = getelementptr inbounds [900 x i8], ptr @New_awareness, i64 0, i64 %36, !dbg !4865
  %38 = load i8, ptr %37, align 1, !dbg !4865
  %39 = sext i8 %38 to i32, !dbg !4865
  %40 = load i32, ptr %1, align 4, !dbg !4866
  %41 = sext i32 %40 to i64, !dbg !4867
  %42 = getelementptr inbounds [350 x %struct.ai_local], ptr @Ai_local_info, i64 0, i64 %41, !dbg !4867
  %43 = getelementptr inbounds nuw %struct.ai_local, ptr %42, i32 0, i32 0, !dbg !4868
  store i32 %39, ptr %43, align 4, !dbg !4869
  %44 = load i32, ptr %1, align 4, !dbg !4870
  %45 = sext i32 %44 to i64, !dbg !4871
  %46 = getelementptr inbounds [350 x %struct.ai_local], ptr @Ai_local_info, i64 0, i64 %45, !dbg !4871
  %47 = getelementptr inbounds nuw %struct.ai_local, ptr %46, i32 0, i32 10, !dbg !4872
  store i32 196608, ptr %47, align 4, !dbg !4873
  br label %48, !dbg !4874

48:                                               ; preds = %30, %14
  %49 = load i32, ptr %1, align 4, !dbg !4875
  %50 = sext i32 %49 to i64, !dbg !4877
  %51 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %50, !dbg !4877
  %52 = getelementptr inbounds nuw %struct.object, ptr %51, i32 0, i32 9, !dbg !4878
  %53 = load i16, ptr %52, align 2, !dbg !4878
  %54 = sext i16 %53 to i64, !dbg !4879
  %55 = getelementptr inbounds [900 x i8], ptr @New_awareness, i64 0, i64 %54, !dbg !4879
  %56 = load i8, ptr %55, align 1, !dbg !4879
  %57 = sext i8 %56 to i32, !dbg !4879
  %58 = load i32, ptr %1, align 4, !dbg !4880
  %59 = sext i32 %58 to i64, !dbg !4881
  %60 = getelementptr inbounds [350 x %struct.ai_local], ptr @Ai_local_info, i64 0, i64 %59, !dbg !4881
  %61 = getelementptr inbounds nuw %struct.ai_local, ptr %60, i32 0, i32 0, !dbg !4882
  %62 = load i32, ptr %61, align 4, !dbg !4882
  %63 = icmp sgt i32 %57, %62, !dbg !4883
  br i1 %63, label %64, label %75, !dbg !4883

64:                                               ; preds = %48
  %65 = load i32, ptr %1, align 4, !dbg !4884
  %66 = sext i32 %65 to i64, !dbg !4885
  %67 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %66, !dbg !4885
  %68 = getelementptr inbounds nuw %struct.object, ptr %67, i32 0, i32 22, !dbg !4886
  %69 = getelementptr inbounds nuw %struct.ai_static, ptr %68, i32 0, i32 1, !dbg !4887
  %70 = getelementptr inbounds [11 x i8], ptr %69, i64 0, i64 4, !dbg !4885
  %71 = load i8, ptr %70, align 1, !dbg !4888
  %72 = sext i8 %71 to i32, !dbg !4888
  %73 = and i32 %72, -5, !dbg !4888
  %74 = trunc i32 %73 to i8, !dbg !4888
  store i8 %74, ptr %70, align 1, !dbg !4888
  br label %75, !dbg !4885

75:                                               ; preds = %64, %48
  br label %76, !dbg !4889

76:                                               ; preds = %75, %6
  br label %77, !dbg !4890

77:                                               ; preds = %76
  %78 = load i32, ptr %1, align 4, !dbg !4891
  %79 = add nsw i32 %78, 1, !dbg !4891
  store i32 %79, ptr %1, align 4, !dbg !4891
  br label %2, !dbg !4892, !llvm.loop !4893

80:                                               ; preds = %2
  ret void, !dbg !4895
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define void @_Z25force_dump_ai_objects_allPKc(ptr noundef %0) #3 !dbg !4896 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !4897, !DIExpression(), !4898)
    #dbg_declare(ptr %3, !4899, !DIExpression(), !4900)
  %4 = load i32, ptr @Ai_dump_enable, align 4, !dbg !4901
  store i32 %4, ptr %3, align 4, !dbg !4902
  store i32 1, ptr @Ai_dump_enable, align 4, !dbg !4903
  %5 = load ptr, ptr %2, align 8, !dbg !4904
  %6 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef @Ai_error_message, ptr noundef @.str.35, ptr noundef %5) #6, !dbg !4905
  store i8 0, ptr @Ai_error_message, align 1, !dbg !4906
  %7 = load i32, ptr %3, align 4, !dbg !4907
  store i32 %7, ptr @Ai_dump_enable, align 4, !dbg !4908
  ret void, !dbg !4909
}

; Function Attrs: nounwind
declare i32 @sprintf(ptr noundef, ptr noundef, ...) #4

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z16turn_off_ai_dumpv() #0 !dbg !4910 {
  %1 = load ptr, ptr @Ai_dump_file, align 8, !dbg !4911
  %2 = icmp ne ptr %1, null, !dbg !4913
  br i1 %2, label %3, label %6, !dbg !4913

3:                                                ; preds = %0
  %4 = load ptr, ptr @Ai_dump_file, align 8, !dbg !4914
  %5 = call i32 @fclose(ptr noundef %4), !dbg !4915
  br label %6, !dbg !4915

6:                                                ; preds = %3, %0
  store ptr null, ptr @Ai_dump_file, align 8, !dbg !4916
  ret void, !dbg !4917
}

declare i32 @fclose(ptr noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z15do_ai_frame_allv() #0 !dbg !4918 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  call void @_Z24set_player_awareness_allv(), !dbg !4919
  %3 = load i32, ptr @Ai_last_missile_camera, align 4, !dbg !4920
  %4 = icmp ne i32 %3, -1, !dbg !4922
  br i1 %4, label %5, label %47, !dbg !4922

5:                                                ; preds = %0
  %6 = load i32, ptr @FrameCount, align 4, !dbg !4923
  %7 = and i32 %6, 15, !dbg !4926
  %8 = icmp eq i32 %7, 0, !dbg !4927
  br i1 %8, label %17, label %9, !dbg !4928

9:                                                ; preds = %5
  %10 = load i32, ptr @Ai_last_missile_camera, align 4, !dbg !4929
  %11 = sext i32 %10 to i64, !dbg !4930
  %12 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %11, !dbg !4930
  %13 = getelementptr inbounds nuw %struct.object, ptr %12, i32 0, i32 1, !dbg !4931
  %14 = load i8, ptr %13, align 4, !dbg !4931
  %15 = zext i8 %14 to i32, !dbg !4930
  %16 = icmp ne i32 %15, 5, !dbg !4932
  br i1 %16, label %17, label %46, !dbg !4928

17:                                               ; preds = %9, %5
    #dbg_declare(ptr %1, !4933, !DIExpression(), !4935)
  store i32 -1, ptr @Ai_last_missile_camera, align 4, !dbg !4936
  store i32 0, ptr %1, align 4, !dbg !4937
  br label %18, !dbg !4939

18:                                               ; preds = %42, %17
  %19 = load i32, ptr %1, align 4, !dbg !4940
  %20 = load i32, ptr @Highest_object_index, align 4, !dbg !4942
  %21 = icmp sle i32 %19, %20, !dbg !4943
  br i1 %21, label %22, label %45, !dbg !4944

22:                                               ; preds = %18
  %23 = load i32, ptr %1, align 4, !dbg !4945
  %24 = sext i32 %23 to i64, !dbg !4947
  %25 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %24, !dbg !4947
  %26 = getelementptr inbounds nuw %struct.object, ptr %25, i32 0, i32 1, !dbg !4948
  %27 = load i8, ptr %26, align 4, !dbg !4948
  %28 = zext i8 %27 to i32, !dbg !4947
  %29 = icmp eq i32 %28, 2, !dbg !4949
  br i1 %29, label %30, label %41, !dbg !4949

30:                                               ; preds = %22
  %31 = load i32, ptr %1, align 4, !dbg !4950
  %32 = sext i32 %31 to i64, !dbg !4951
  %33 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %32, !dbg !4951
  %34 = getelementptr inbounds nuw %struct.object, ptr %33, i32 0, i32 22, !dbg !4952
  %35 = getelementptr inbounds nuw %struct.ai_static, ptr %34, i32 0, i32 1, !dbg !4953
  %36 = getelementptr inbounds [11 x i8], ptr %35, i64 0, i64 4, !dbg !4951
  %37 = load i8, ptr %36, align 1, !dbg !4954
  %38 = sext i8 %37 to i32, !dbg !4954
  %39 = and i32 %38, -5, !dbg !4954
  %40 = trunc i32 %39 to i8, !dbg !4954
  store i8 %40, ptr %36, align 1, !dbg !4954
  br label %41, !dbg !4951

41:                                               ; preds = %30, %22
  br label %42, !dbg !4955

42:                                               ; preds = %41
  %43 = load i32, ptr %1, align 4, !dbg !4956
  %44 = add nsw i32 %43, 1, !dbg !4956
  store i32 %44, ptr %1, align 4, !dbg !4956
  br label %18, !dbg !4957, !llvm.loop !4958

45:                                               ; preds = %18
  br label %46, !dbg !4960

46:                                               ; preds = %45, %9
  br label %47, !dbg !4961

47:                                               ; preds = %46, %0
  %48 = load i8, ptr @Boss_dying, align 1, !dbg !4962
  %49 = icmp ne i8 %48, 0, !dbg !4962
  br i1 %49, label %50, label %84, !dbg !4962

50:                                               ; preds = %47
    #dbg_declare(ptr %2, !4964, !DIExpression(), !4966)
  store i32 0, ptr %2, align 4, !dbg !4967
  br label %51, !dbg !4969

51:                                               ; preds = %80, %50
  %52 = load i32, ptr %2, align 4, !dbg !4970
  %53 = load i32, ptr @Highest_object_index, align 4, !dbg !4972
  %54 = icmp sle i32 %52, %53, !dbg !4973
  br i1 %54, label %55, label %83, !dbg !4974

55:                                               ; preds = %51
  %56 = load i32, ptr %2, align 4, !dbg !4975
  %57 = sext i32 %56 to i64, !dbg !4977
  %58 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %57, !dbg !4977
  %59 = getelementptr inbounds nuw %struct.object, ptr %58, i32 0, i32 1, !dbg !4978
  %60 = load i8, ptr %59, align 4, !dbg !4978
  %61 = zext i8 %60 to i32, !dbg !4977
  %62 = icmp eq i32 %61, 2, !dbg !4979
  br i1 %62, label %63, label %79, !dbg !4979

63:                                               ; preds = %55
  %64 = load i32, ptr %2, align 4, !dbg !4980
  %65 = sext i32 %64 to i64, !dbg !4982
  %66 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %65, !dbg !4982
  %67 = getelementptr inbounds nuw %struct.object, ptr %66, i32 0, i32 2, !dbg !4983
  %68 = load i8, ptr %67, align 1, !dbg !4983
  %69 = zext i8 %68 to i64, !dbg !4984
  %70 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %69, !dbg !4984
  %71 = getelementptr inbounds nuw %struct.robot_info, ptr %70, i32 0, i32 36, !dbg !4985
  %72 = load i8, ptr %71, align 4, !dbg !4985
  %73 = icmp ne i8 %72, 0, !dbg !4984
  br i1 %73, label %74, label %78, !dbg !4984

74:                                               ; preds = %63
  %75 = load i32, ptr %2, align 4, !dbg !4986
  %76 = sext i32 %75 to i64, !dbg !4987
  %77 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %76, !dbg !4987
  call void @_Z19do_boss_dying_frameP6object(ptr noundef %77), !dbg !4988
  br label %78, !dbg !4988

78:                                               ; preds = %74, %63
  br label %79, !dbg !4985

79:                                               ; preds = %78, %55
  br label %80, !dbg !4989

80:                                               ; preds = %79
  %81 = load i32, ptr %2, align 4, !dbg !4990
  %82 = add nsw i32 %81, 1, !dbg !4990
  store i32 %82, ptr %2, align 4, !dbg !4990
  br label %51, !dbg !4991, !llvm.loop !4992

83:                                               ; preds = %51
  br label %84, !dbg !4994

84:                                               ; preds = %83, %47
  ret void, !dbg !4995
}

declare void @_Z19do_boss_dying_frameP6object(ptr noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z21init_robots_for_levelv() #0 !dbg !4996 {
  store i32 0, ptr @Overall_agitation, align 4, !dbg !4997
  store i32 0, ptr @Final_boss_is_dead, align 4, !dbg !4998
  store i32 0, ptr @Buddy_objnum, align 4, !dbg !4999
  store i32 0, ptr @Buddy_allowed_to_talk, align 4, !dbg !5000
  %1 = load i32, ptr @Difficulty_level, align 4, !dbg !5001
  %2 = call noundef i32 @_Z3i2fi(i32 noundef %1), !dbg !5002
  %3 = sdiv i32 %2, 8, !dbg !5003
  %4 = sub nsw i32 16384, %3, !dbg !5004
  store i32 %4, ptr @Boss_invulnerable_dot, align 4, !dbg !5005
  store i32 0, ptr @Boss_dying_start_time, align 4, !dbg !5006
  ret void, !dbg !5007
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z3i2fi(i32 noundef %0) #3 !dbg !5008 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !5011, !DIExpression(), !5012)
  %3 = load i32, ptr %2, align 4, !dbg !5013
  %4 = shl i32 %3, 16, !dbg !5014
  ret i32 %4, !dbg !5015
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z13ai_save_stateP7__sFILE(ptr noundef %0) #0 !dbg !5016 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !5017, !DIExpression(), !5018)
    #dbg_declare(ptr %3, !5019, !DIExpression(), !5020)
  %7 = load ptr, ptr %2, align 8, !dbg !5021
  %8 = load i32, ptr @Ai_initialized, align 4, !dbg !5022
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %7, i32 noundef %8), !dbg !5023
  %9 = load ptr, ptr %2, align 8, !dbg !5024
  %10 = load i32, ptr @Overall_agitation, align 4, !dbg !5025
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %9, i32 noundef %10), !dbg !5026
  store i32 0, ptr %3, align 4, !dbg !5027
  br label %11, !dbg !5029

11:                                               ; preds = %19, %1
  %12 = load i32, ptr %3, align 4, !dbg !5030
  %13 = icmp slt i32 %12, 350, !dbg !5032
  br i1 %13, label %14, label %22, !dbg !5033

14:                                               ; preds = %11
  %15 = load i32, ptr %3, align 4, !dbg !5034
  %16 = sext i32 %15 to i64, !dbg !5035
  %17 = getelementptr inbounds [350 x %struct.ai_local], ptr @Ai_local_info, i64 0, i64 %16, !dbg !5035
  %18 = load ptr, ptr %2, align 8, !dbg !5036
  call void @_Z15P_WriteAILocalsP8ai_localP7__sFILE(ptr noundef %17, ptr noundef %18), !dbg !5037
  br label %19, !dbg !5037

19:                                               ; preds = %14
  %20 = load i32, ptr %3, align 4, !dbg !5038
  %21 = add nsw i32 %20, 1, !dbg !5038
  store i32 %21, ptr %3, align 4, !dbg !5038
  br label %11, !dbg !5039, !llvm.loop !5040

22:                                               ; preds = %11
  store i32 0, ptr %3, align 4, !dbg !5042
  br label %23, !dbg !5044

23:                                               ; preds = %31, %22
  %24 = load i32, ptr %3, align 4, !dbg !5045
  %25 = icmp slt i32 %24, 2500, !dbg !5047
  br i1 %25, label %26, label %34, !dbg !5048

26:                                               ; preds = %23
  %27 = load i32, ptr %3, align 4, !dbg !5049
  %28 = sext i32 %27 to i64, !dbg !5050
  %29 = getelementptr inbounds [2500 x %struct.point_seg], ptr @Point_segs, i64 0, i64 %28, !dbg !5050
  %30 = load ptr, ptr %2, align 8, !dbg !5051
  call void @_Z15P_WriteSegPointP9point_segP7__sFILE(ptr noundef %29, ptr noundef %30), !dbg !5052
  br label %31, !dbg !5052

31:                                               ; preds = %26
  %32 = load i32, ptr %3, align 4, !dbg !5053
  %33 = add nsw i32 %32, 1, !dbg !5053
  store i32 %33, ptr %3, align 4, !dbg !5053
  br label %23, !dbg !5054, !llvm.loop !5055

34:                                               ; preds = %23
  store i32 0, ptr %3, align 4, !dbg !5057
  br label %35, !dbg !5059

35:                                               ; preds = %43, %34
  %36 = load i32, ptr %3, align 4, !dbg !5060
  %37 = icmp slt i32 %36, 8, !dbg !5062
  br i1 %37, label %38, label %46, !dbg !5063

38:                                               ; preds = %35
  %39 = load i32, ptr %3, align 4, !dbg !5064
  %40 = sext i32 %39 to i64, !dbg !5065
  %41 = getelementptr inbounds [8 x %struct.ai_cloak_info], ptr @Ai_cloak_info, i64 0, i64 %40, !dbg !5065
  %42 = load ptr, ptr %2, align 8, !dbg !5066
  call void @_Z16P_WriteCloakInfoP13ai_cloak_infoP7__sFILE(ptr noundef %41, ptr noundef %42), !dbg !5067
  br label %43, !dbg !5067

43:                                               ; preds = %38
  %44 = load i32, ptr %3, align 4, !dbg !5068
  %45 = add nsw i32 %44, 1, !dbg !5068
  store i32 %45, ptr %3, align 4, !dbg !5068
  br label %35, !dbg !5069, !llvm.loop !5070

46:                                               ; preds = %35
  %47 = load ptr, ptr %2, align 8, !dbg !5072
  %48 = load i32, ptr @Boss_cloak_start_time, align 4, !dbg !5073
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %47, i32 noundef %48), !dbg !5074
  %49 = load ptr, ptr %2, align 8, !dbg !5075
  %50 = load i32, ptr @Boss_cloak_end_time, align 4, !dbg !5076
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %49, i32 noundef %50), !dbg !5077
  %51 = load ptr, ptr %2, align 8, !dbg !5078
  %52 = load i32, ptr @Last_teleport_time, align 4, !dbg !5079
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %51, i32 noundef %52), !dbg !5080
  %53 = load ptr, ptr %2, align 8, !dbg !5081
  %54 = load i32, ptr @Boss_teleport_interval, align 4, !dbg !5082
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %53, i32 noundef %54), !dbg !5083
  %55 = load ptr, ptr %2, align 8, !dbg !5084
  %56 = load i32, ptr @Boss_cloak_interval, align 4, !dbg !5085
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %55, i32 noundef %56), !dbg !5086
  %57 = load ptr, ptr %2, align 8, !dbg !5087
  %58 = load i32, ptr @Boss_cloak_duration, align 4, !dbg !5088
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %57, i32 noundef %58), !dbg !5089
  %59 = load ptr, ptr %2, align 8, !dbg !5090
  %60 = load i32, ptr @Last_gate_time, align 4, !dbg !5091
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %59, i32 noundef %60), !dbg !5092
  %61 = load ptr, ptr %2, align 8, !dbg !5093
  %62 = load i32, ptr @Gate_interval, align 4, !dbg !5094
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %61, i32 noundef %62), !dbg !5095
  %63 = load ptr, ptr %2, align 8, !dbg !5096
  %64 = load i32, ptr @Boss_dying_start_time, align 4, !dbg !5097
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %63, i32 noundef %64), !dbg !5098
  %65 = load ptr, ptr %2, align 8, !dbg !5099
  %66 = load i8, ptr @Boss_dying, align 1, !dbg !5100
  %67 = sext i8 %66 to i32, !dbg !5100
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %65, i32 noundef %67), !dbg !5101
  %68 = load ptr, ptr %2, align 8, !dbg !5102
  %69 = load i8, ptr @Boss_dying_sound_playing, align 1, !dbg !5103
  %70 = sext i8 %69 to i32, !dbg !5103
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %68, i32 noundef %70), !dbg !5104
  %71 = load ptr, ptr %2, align 8, !dbg !5105
  %72 = load i32, ptr @Boss_hit_time, align 4, !dbg !5106
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %71, i32 noundef %72), !dbg !5107
  %73 = load ptr, ptr %2, align 8, !dbg !5108
  %74 = load i32, ptr @Escort_kill_object, align 4, !dbg !5109
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %73, i32 noundef %74), !dbg !5110
  %75 = load ptr, ptr %2, align 8, !dbg !5111
  %76 = load i32, ptr @Escort_last_path_created, align 4, !dbg !5112
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %75, i32 noundef %76), !dbg !5113
  %77 = load ptr, ptr %2, align 8, !dbg !5114
  %78 = load i32, ptr @Escort_goal_object, align 4, !dbg !5115
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %77, i32 noundef %78), !dbg !5116
  %79 = load ptr, ptr %2, align 8, !dbg !5117
  %80 = load i32, ptr @Escort_special_goal, align 4, !dbg !5118
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %79, i32 noundef %80), !dbg !5119
  %81 = load ptr, ptr %2, align 8, !dbg !5120
  %82 = load i32, ptr @Escort_goal_index, align 4, !dbg !5121
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %81, i32 noundef %82), !dbg !5122
  store i32 0, ptr %3, align 4, !dbg !5123
  br label %83, !dbg !5125

83:                                               ; preds = %92, %46
  %84 = load i32, ptr %3, align 4, !dbg !5126
  %85 = icmp slt i32 %84, 10, !dbg !5128
  br i1 %85, label %86, label %95, !dbg !5129

86:                                               ; preds = %83
  %87 = load ptr, ptr %2, align 8, !dbg !5130
  %88 = load i32, ptr %3, align 4, !dbg !5131
  %89 = sext i32 %88 to i64, !dbg !5132
  %90 = getelementptr inbounds [10 x i8], ptr @Stolen_items, i64 0, i64 %89, !dbg !5132
  %91 = load i8, ptr %90, align 1, !dbg !5132
  call void @_Z15file_write_byteP7__sFILEh(ptr noundef %87, i8 noundef zeroext %91), !dbg !5133
  br label %92, !dbg !5133

92:                                               ; preds = %86
  %93 = load i32, ptr %3, align 4, !dbg !5134
  %94 = add nsw i32 %93, 1, !dbg !5134
  store i32 %94, ptr %3, align 4, !dbg !5134
  br label %83, !dbg !5135, !llvm.loop !5136

95:                                               ; preds = %83
    #dbg_declare(ptr %4, !5138, !DIExpression(), !5140)
  %96 = load ptr, ptr @Point_segs_free_ptr, align 8, !dbg !5141
  %97 = ptrtoint ptr %96 to i64, !dbg !5142
  %98 = sub i64 %97, ptrtoint (ptr @Point_segs to i64), !dbg !5142
  %99 = sdiv exact i64 %98, 16, !dbg !5142
  %100 = trunc i64 %99 to i32, !dbg !5141
  store i32 %100, ptr %4, align 4, !dbg !5143
  %101 = load ptr, ptr %2, align 8, !dbg !5144
  %102 = load i32, ptr %4, align 4, !dbg !5145
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %101, i32 noundef %102), !dbg !5146
  %103 = load ptr, ptr %2, align 8, !dbg !5147
  %104 = load i32, ptr @Num_boss_teleport_segs, align 4, !dbg !5148
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %103, i32 noundef %104), !dbg !5149
  %105 = load ptr, ptr %2, align 8, !dbg !5150
  %106 = load i32, ptr @Num_boss_gate_segs, align 4, !dbg !5151
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %105, i32 noundef %106), !dbg !5152
    #dbg_declare(ptr %5, !5153, !DIExpression(), !5155)
  store i32 0, ptr %5, align 4, !dbg !5155
  br label %107, !dbg !5156

107:                                              ; preds = %117, %95
  %108 = load i32, ptr %5, align 4, !dbg !5157
  %109 = load i32, ptr @Num_boss_gate_segs, align 4, !dbg !5159
  %110 = icmp slt i32 %108, %109, !dbg !5160
  br i1 %110, label %111, label %120, !dbg !5161

111:                                              ; preds = %107
  %112 = load ptr, ptr %2, align 8, !dbg !5162
  %113 = load i32, ptr %5, align 4, !dbg !5164
  %114 = sext i32 %113 to i64, !dbg !5165
  %115 = getelementptr inbounds [0 x i16], ptr @Boss_gate_segs, i64 0, i64 %114, !dbg !5165
  %116 = load i16, ptr %115, align 2, !dbg !5165
  call void @_Z16file_write_shortP7__sFILEs(ptr noundef %112, i16 noundef signext %116), !dbg !5166
  br label %117, !dbg !5167

117:                                              ; preds = %111
  %118 = load i32, ptr %5, align 4, !dbg !5168
  %119 = add nsw i32 %118, 1, !dbg !5168
  store i32 %119, ptr %5, align 4, !dbg !5168
  br label %107, !dbg !5169, !llvm.loop !5170

120:                                              ; preds = %107
    #dbg_declare(ptr %6, !5172, !DIExpression(), !5174)
  store i32 0, ptr %6, align 4, !dbg !5174
  br label %121, !dbg !5175

121:                                              ; preds = %131, %120
  %122 = load i32, ptr %6, align 4, !dbg !5176
  %123 = load i32, ptr @Num_boss_teleport_segs, align 4, !dbg !5178
  %124 = icmp slt i32 %122, %123, !dbg !5179
  br i1 %124, label %125, label %134, !dbg !5180

125:                                              ; preds = %121
  %126 = load ptr, ptr %2, align 8, !dbg !5181
  %127 = load i32, ptr %6, align 4, !dbg !5183
  %128 = sext i32 %127 to i64, !dbg !5184
  %129 = getelementptr inbounds [100 x i16], ptr @Boss_teleport_segs, i64 0, i64 %128, !dbg !5184
  %130 = load i16, ptr %129, align 2, !dbg !5184
  call void @_Z16file_write_shortP7__sFILEs(ptr noundef %126, i16 noundef signext %130), !dbg !5185
  br label %131, !dbg !5186

131:                                              ; preds = %125
  %132 = load i32, ptr %6, align 4, !dbg !5187
  %133 = add nsw i32 %132, 1, !dbg !5187
  store i32 %133, ptr %6, align 4, !dbg !5187
  br label %121, !dbg !5188, !llvm.loop !5189

134:                                              ; preds = %121
  ret i32 1, !dbg !5191
}

declare void @_Z14file_write_intP7__sFILEi(ptr noundef, i32 noundef) #1

declare void @_Z15P_WriteAILocalsP8ai_localP7__sFILE(ptr noundef, ptr noundef) #1

declare void @_Z15P_WriteSegPointP9point_segP7__sFILE(ptr noundef, ptr noundef) #1

declare void @_Z16P_WriteCloakInfoP13ai_cloak_infoP7__sFILE(ptr noundef, ptr noundef) #1

declare void @_Z15file_write_byteP7__sFILEh(ptr noundef, i8 noundef zeroext) #1

declare void @_Z16file_write_shortP7__sFILEs(ptr noundef, i16 noundef signext) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z16ai_restore_stateP7__sFILEi(ptr noundef %0, i32 noundef %1) #0 !dbg !5192 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !5193, !DIExpression(), !5194)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !5195, !DIExpression(), !5196)
    #dbg_declare(ptr %5, !5197, !DIExpression(), !5198)
  %7 = load ptr, ptr %3, align 8, !dbg !5199
  %8 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %7), !dbg !5200
  store i32 %8, ptr @Ai_initialized, align 4, !dbg !5201
  %9 = load ptr, ptr %3, align 8, !dbg !5202
  %10 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %9), !dbg !5203
  store i32 %10, ptr @Overall_agitation, align 4, !dbg !5204
  store i32 0, ptr %5, align 4, !dbg !5205
  br label %11, !dbg !5207

11:                                               ; preds = %19, %2
  %12 = load i32, ptr %5, align 4, !dbg !5208
  %13 = icmp slt i32 %12, 350, !dbg !5210
  br i1 %13, label %14, label %22, !dbg !5211

14:                                               ; preds = %11
  %15 = load i32, ptr %5, align 4, !dbg !5212
  %16 = sext i32 %15 to i64, !dbg !5213
  %17 = getelementptr inbounds [350 x %struct.ai_local], ptr @Ai_local_info, i64 0, i64 %16, !dbg !5213
  %18 = load ptr, ptr %3, align 8, !dbg !5214
  call void @_Z14P_ReadAILocalsP8ai_localP7__sFILE(ptr noundef %17, ptr noundef %18), !dbg !5215
  br label %19, !dbg !5215

19:                                               ; preds = %14
  %20 = load i32, ptr %5, align 4, !dbg !5216
  %21 = add nsw i32 %20, 1, !dbg !5216
  store i32 %21, ptr %5, align 4, !dbg !5216
  br label %11, !dbg !5217, !llvm.loop !5218

22:                                               ; preds = %11
  store i32 0, ptr %5, align 4, !dbg !5220
  br label %23, !dbg !5222

23:                                               ; preds = %31, %22
  %24 = load i32, ptr %5, align 4, !dbg !5223
  %25 = icmp slt i32 %24, 2500, !dbg !5225
  br i1 %25, label %26, label %34, !dbg !5226

26:                                               ; preds = %23
  %27 = load i32, ptr %5, align 4, !dbg !5227
  %28 = sext i32 %27 to i64, !dbg !5228
  %29 = getelementptr inbounds [2500 x %struct.point_seg], ptr @Point_segs, i64 0, i64 %28, !dbg !5228
  %30 = load ptr, ptr %3, align 8, !dbg !5229
  call void @_Z14P_ReadSegPointP9point_segP7__sFILE(ptr noundef %29, ptr noundef %30), !dbg !5230
  br label %31, !dbg !5230

31:                                               ; preds = %26
  %32 = load i32, ptr %5, align 4, !dbg !5231
  %33 = add nsw i32 %32, 1, !dbg !5231
  store i32 %33, ptr %5, align 4, !dbg !5231
  br label %23, !dbg !5232, !llvm.loop !5233

34:                                               ; preds = %23
  store i32 0, ptr %5, align 4, !dbg !5235
  br label %35, !dbg !5237

35:                                               ; preds = %43, %34
  %36 = load i32, ptr %5, align 4, !dbg !5238
  %37 = icmp slt i32 %36, 8, !dbg !5240
  br i1 %37, label %38, label %46, !dbg !5241

38:                                               ; preds = %35
  %39 = load i32, ptr %5, align 4, !dbg !5242
  %40 = sext i32 %39 to i64, !dbg !5243
  %41 = getelementptr inbounds [8 x %struct.ai_cloak_info], ptr @Ai_cloak_info, i64 0, i64 %40, !dbg !5243
  %42 = load ptr, ptr %3, align 8, !dbg !5244
  call void @_Z15P_ReadCloakInfoP13ai_cloak_infoP7__sFILE(ptr noundef %41, ptr noundef %42), !dbg !5245
  br label %43, !dbg !5245

43:                                               ; preds = %38
  %44 = load i32, ptr %5, align 4, !dbg !5246
  %45 = add nsw i32 %44, 1, !dbg !5246
  store i32 %45, ptr %5, align 4, !dbg !5246
  br label %35, !dbg !5247, !llvm.loop !5248

46:                                               ; preds = %35
  %47 = load ptr, ptr %3, align 8, !dbg !5250
  %48 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %47), !dbg !5251
  store i32 %48, ptr @Boss_cloak_start_time, align 4, !dbg !5252
  %49 = load ptr, ptr %3, align 8, !dbg !5253
  %50 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %49), !dbg !5254
  store i32 %50, ptr @Boss_cloak_end_time, align 4, !dbg !5255
  %51 = load ptr, ptr %3, align 8, !dbg !5256
  %52 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %51), !dbg !5257
  store i32 %52, ptr @Last_teleport_time, align 4, !dbg !5258
  %53 = load ptr, ptr %3, align 8, !dbg !5259
  %54 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %53), !dbg !5260
  store i32 %54, ptr @Boss_teleport_interval, align 4, !dbg !5261
  %55 = load ptr, ptr %3, align 8, !dbg !5262
  %56 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %55), !dbg !5263
  store i32 %56, ptr @Boss_cloak_interval, align 4, !dbg !5264
  %57 = load ptr, ptr %3, align 8, !dbg !5265
  %58 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %57), !dbg !5266
  store i32 %58, ptr @Boss_cloak_duration, align 4, !dbg !5267
  %59 = load ptr, ptr %3, align 8, !dbg !5268
  %60 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %59), !dbg !5269
  store i32 %60, ptr @Last_gate_time, align 4, !dbg !5270
  %61 = load ptr, ptr %3, align 8, !dbg !5271
  %62 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %61), !dbg !5272
  store i32 %62, ptr @Gate_interval, align 4, !dbg !5273
  %63 = load ptr, ptr %3, align 8, !dbg !5274
  %64 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %63), !dbg !5275
  store i32 %64, ptr @Boss_dying_start_time, align 4, !dbg !5276
  %65 = load ptr, ptr %3, align 8, !dbg !5277
  %66 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %65), !dbg !5278
  %67 = trunc i32 %66 to i8, !dbg !5278
  store i8 %67, ptr @Boss_dying, align 1, !dbg !5279
  %68 = load ptr, ptr %3, align 8, !dbg !5280
  %69 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %68), !dbg !5281
  %70 = trunc i32 %69 to i8, !dbg !5281
  store i8 %70, ptr @Boss_dying_sound_playing, align 1, !dbg !5282
  %71 = load ptr, ptr %3, align 8, !dbg !5283
  %72 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %71), !dbg !5284
  store i32 %72, ptr @Boss_hit_time, align 4, !dbg !5285
  %73 = load i32, ptr %4, align 4, !dbg !5286
  %74 = icmp sge i32 %73, 8, !dbg !5288
  br i1 %74, label %75, label %99, !dbg !5288

75:                                               ; preds = %46
  %76 = load ptr, ptr %3, align 8, !dbg !5289
  %77 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %76), !dbg !5291
  store i32 %77, ptr @Escort_kill_object, align 4, !dbg !5292
  %78 = load ptr, ptr %3, align 8, !dbg !5293
  %79 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %78), !dbg !5294
  store i32 %79, ptr @Escort_last_path_created, align 4, !dbg !5295
  %80 = load ptr, ptr %3, align 8, !dbg !5296
  %81 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %80), !dbg !5297
  store i32 %81, ptr @Escort_goal_object, align 4, !dbg !5298
  %82 = load ptr, ptr %3, align 8, !dbg !5299
  %83 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %82), !dbg !5300
  store i32 %83, ptr @Escort_special_goal, align 4, !dbg !5301
  %84 = load ptr, ptr %3, align 8, !dbg !5302
  %85 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %84), !dbg !5303
  store i32 %85, ptr @Escort_goal_index, align 4, !dbg !5304
  store i32 0, ptr %5, align 4, !dbg !5305
  br label %86, !dbg !5307

86:                                               ; preds = %95, %75
  %87 = load i32, ptr %5, align 4, !dbg !5308
  %88 = icmp slt i32 %87, 10, !dbg !5310
  br i1 %88, label %89, label %98, !dbg !5311

89:                                               ; preds = %86
  %90 = load ptr, ptr %3, align 8, !dbg !5312
  %91 = call noundef zeroext i8 @_Z14file_read_byteP7__sFILE(ptr noundef %90), !dbg !5313
  %92 = load i32, ptr %5, align 4, !dbg !5314
  %93 = sext i32 %92 to i64, !dbg !5315
  %94 = getelementptr inbounds [10 x i8], ptr @Stolen_items, i64 0, i64 %93, !dbg !5315
  store i8 %91, ptr %94, align 1, !dbg !5316
  br label %95, !dbg !5315

95:                                               ; preds = %89
  %96 = load i32, ptr %5, align 4, !dbg !5317
  %97 = add nsw i32 %96, 1, !dbg !5317
  store i32 %97, ptr %5, align 4, !dbg !5317
  br label %86, !dbg !5318, !llvm.loop !5319

98:                                               ; preds = %86
  br label %111, !dbg !5321

99:                                               ; preds = %46
  store i32 -1, ptr @Escort_kill_object, align 4, !dbg !5322
  store i32 0, ptr @Escort_last_path_created, align 4, !dbg !5324
  store i32 -1, ptr @Escort_goal_object, align 4, !dbg !5325
  store i32 -1, ptr @Escort_special_goal, align 4, !dbg !5326
  store i32 -1, ptr @Escort_goal_index, align 4, !dbg !5327
  store i32 0, ptr %5, align 4, !dbg !5328
  br label %100, !dbg !5330

100:                                              ; preds = %107, %99
  %101 = load i32, ptr %5, align 4, !dbg !5331
  %102 = icmp slt i32 %101, 10, !dbg !5333
  br i1 %102, label %103, label %110, !dbg !5334

103:                                              ; preds = %100
  %104 = load i32, ptr %5, align 4, !dbg !5335
  %105 = sext i32 %104 to i64, !dbg !5336
  %106 = getelementptr inbounds [10 x i8], ptr @Stolen_items, i64 0, i64 %105, !dbg !5336
  store i8 -1, ptr %106, align 1, !dbg !5337
  br label %107, !dbg !5336

107:                                              ; preds = %103
  %108 = load i32, ptr %5, align 4, !dbg !5338
  %109 = add nsw i32 %108, 1, !dbg !5338
  store i32 %109, ptr %5, align 4, !dbg !5338
  br label %100, !dbg !5339, !llvm.loop !5340

110:                                              ; preds = %100
  br label %111

111:                                              ; preds = %110, %98
  %112 = load i32, ptr %4, align 4, !dbg !5342
  %113 = icmp sge i32 %112, 15, !dbg !5344
  br i1 %113, label %114, label %120, !dbg !5344

114:                                              ; preds = %111
    #dbg_declare(ptr %6, !5345, !DIExpression(), !5347)
  %115 = load ptr, ptr %3, align 8, !dbg !5348
  %116 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %115), !dbg !5349
  store i32 %116, ptr %6, align 4, !dbg !5347
  %117 = load i32, ptr %6, align 4, !dbg !5350
  %118 = sext i32 %117 to i64, !dbg !5351
  %119 = getelementptr inbounds [2500 x %struct.point_seg], ptr @Point_segs, i64 0, i64 %118, !dbg !5351
  store ptr %119, ptr @Point_segs_free_ptr, align 8, !dbg !5352
  br label %121, !dbg !5353

120:                                              ; preds = %111
  call void @_Z18ai_reset_all_pathsv(), !dbg !5354
  br label %121

121:                                              ; preds = %120, %114
  %122 = load i32, ptr %4, align 4, !dbg !5355
  %123 = icmp sge i32 %122, 21, !dbg !5357
  br i1 %123, label %124, label %173, !dbg !5357

124:                                              ; preds = %121
  %125 = load ptr, ptr %3, align 8, !dbg !5358
  %126 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %125), !dbg !5360
  store i32 %126, ptr @Num_boss_teleport_segs, align 4, !dbg !5361
  %127 = load ptr, ptr %3, align 8, !dbg !5362
  %128 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %127), !dbg !5363
  store i32 %128, ptr @Num_boss_gate_segs, align 4, !dbg !5364
  %129 = load i32, ptr @Num_boss_teleport_segs, align 4, !dbg !5365
  %130 = icmp sgt i32 %129, 100, !dbg !5367
  br i1 %130, label %131, label %132, !dbg !5367

131:                                              ; preds = %124
  call void (ptr, ...) @_Z5ErrorPKcz(ptr noundef @.str.36), !dbg !5368
  br label %132, !dbg !5368

132:                                              ; preds = %131, %124
  %133 = load i32, ptr @Num_boss_gate_segs, align 4, !dbg !5369
  %134 = icmp sgt i32 %133, 100, !dbg !5371
  br i1 %134, label %135, label %136, !dbg !5371

135:                                              ; preds = %132
  call void (ptr, ...) @_Z5ErrorPKcz(ptr noundef @.str.37), !dbg !5372
  br label %136, !dbg !5372

136:                                              ; preds = %135, %132
  %137 = load i32, ptr @Num_boss_gate_segs, align 4, !dbg !5373
  %138 = icmp ne i32 %137, 0, !dbg !5373
  br i1 %138, label %139, label %154, !dbg !5373

139:                                              ; preds = %136
  store i32 0, ptr %5, align 4, !dbg !5375
  br label %140, !dbg !5377

140:                                              ; preds = %150, %139
  %141 = load i32, ptr %5, align 4, !dbg !5378
  %142 = load i32, ptr @Num_boss_gate_segs, align 4, !dbg !5380
  %143 = icmp slt i32 %141, %142, !dbg !5381
  br i1 %143, label %144, label %153, !dbg !5382

144:                                              ; preds = %140
  %145 = load ptr, ptr %3, align 8, !dbg !5383
  %146 = call noundef signext i16 @_Z15file_read_shortP7__sFILE(ptr noundef %145), !dbg !5384
  %147 = load i32, ptr %5, align 4, !dbg !5385
  %148 = sext i32 %147 to i64, !dbg !5386
  %149 = getelementptr inbounds [0 x i16], ptr @Boss_gate_segs, i64 0, i64 %148, !dbg !5386
  store i16 %146, ptr %149, align 2, !dbg !5387
  br label %150, !dbg !5386

150:                                              ; preds = %144
  %151 = load i32, ptr %5, align 4, !dbg !5388
  %152 = add nsw i32 %151, 1, !dbg !5388
  store i32 %152, ptr %5, align 4, !dbg !5388
  br label %140, !dbg !5389, !llvm.loop !5390

153:                                              ; preds = %140
  br label %154, !dbg !5391

154:                                              ; preds = %153, %136
  %155 = load i32, ptr @Num_boss_teleport_segs, align 4, !dbg !5392
  %156 = icmp ne i32 %155, 0, !dbg !5392
  br i1 %156, label %157, label %172, !dbg !5392

157:                                              ; preds = %154
  store i32 0, ptr %5, align 4, !dbg !5394
  br label %158, !dbg !5396

158:                                              ; preds = %168, %157
  %159 = load i32, ptr %5, align 4, !dbg !5397
  %160 = load i32, ptr @Num_boss_teleport_segs, align 4, !dbg !5399
  %161 = icmp slt i32 %159, %160, !dbg !5400
  br i1 %161, label %162, label %171, !dbg !5401

162:                                              ; preds = %158
  %163 = load ptr, ptr %3, align 8, !dbg !5402
  %164 = call noundef signext i16 @_Z15file_read_shortP7__sFILE(ptr noundef %163), !dbg !5403
  %165 = load i32, ptr %5, align 4, !dbg !5404
  %166 = sext i32 %165 to i64, !dbg !5405
  %167 = getelementptr inbounds [100 x i16], ptr @Boss_teleport_segs, i64 0, i64 %166, !dbg !5405
  store i16 %164, ptr %167, align 2, !dbg !5406
  br label %168, !dbg !5405

168:                                              ; preds = %162
  %169 = load i32, ptr %5, align 4, !dbg !5407
  %170 = add nsw i32 %169, 1, !dbg !5407
  store i32 %170, ptr %5, align 4, !dbg !5407
  br label %158, !dbg !5408, !llvm.loop !5409

171:                                              ; preds = %158
  br label %172, !dbg !5410

172:                                              ; preds = %171, %154
  br label %174, !dbg !5411

173:                                              ; preds = %121
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 1, ptr noundef @.str.38), !dbg !5412
  br label %174

174:                                              ; preds = %173, %172
  ret i32 1, !dbg !5414
}

declare noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef) #1

declare void @_Z14P_ReadAILocalsP8ai_localP7__sFILE(ptr noundef, ptr noundef) #1

declare void @_Z14P_ReadSegPointP9point_segP7__sFILE(ptr noundef, ptr noundef) #1

declare void @_Z15P_ReadCloakInfoP13ai_cloak_infoP7__sFILE(ptr noundef, ptr noundef) #1

declare noundef zeroext i8 @_Z14file_read_byteP7__sFILE(ptr noundef) #1

declare void @_Z18ai_reset_all_pathsv() #1

declare void @_Z5ErrorPKcz(ptr noundef, ...) #1

declare noundef signext i16 @_Z15file_read_shortP7__sFILE(ptr noundef) #1

attributes #0 = { mustprogress noinline ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #4 = { nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #5 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #6 = { nounwind }

!llvm.module.flags = !{!1661, !1662, !1663, !1664, !1665, !1666, !1667}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!1668}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "Ai_initialized", scope: !2, file: !20, line: 74, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !3, producer: "Homebrew clang version 20.1.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !13, globals: !17, imports: !434, splitDebugInlining: false, nameTableKind: Apple, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk", sdk: "MacOSX15.sdk")
!3 = !DIFile(filename: "/Users/richard/code/ChocolateDescent/main_d2/ai.cpp", directory: "/Users/richard/code/ChocolateDescent/build-c-ref", checksumkind: CSK_MD5, checksum: "ab686873ed81952092c0ae51181ff912")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "LogicVer", file: !6, line: 56, baseType: !7, size: 32, flags: DIFlagEnumClass, elements: !8, identifier: "_ZTS8LogicVer")
!6 = !DIFile(filename: "main_d2/inferno.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "f9bd7760bcc54609c0547a3a7ca7ee90")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{!9, !10, !11, !12}
!9 = !DIEnumerator(name: "SHAREWARE", value: 0)
!10 = !DIEnumerator(name: "FULL_1_0", value: 1)
!11 = !DIEnumerator(name: "FULL_1_1", value: 2)
!12 = !DIEnumerator(name: "FULL_1_2", value: 3)
!13 = !{!14}
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !15, line: 30, baseType: !16)
!15 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int64_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e6d85c1a9e23dbf7518ce3b162aac800")
!16 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!17 = !{!0, !18, !21, !69, !85, !88, !100, !102, !107, !109, !111, !113, !115, !117, !119, !121, !123, !125, !127, !129, !131, !133, !139, !141, !143, !145, !147, !149, !151, !153, !155, !157, !159, !161, !163, !165, !183, !185, !196, !198, !200, !207, !212, !217, !220, !222, !224, !226, !228, !230, !232, !234, !237, !239, !241, !243, !245, !250, !252, !258, !262, !267, !272, !274, !279, !281, !283, !285, !290, !295, !298, !303, !308, !313, !318, !323, !325, !330, !335, !337, !342, !347, !349, !351, !410, !415, !419, !421, !426, !431}
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "Overall_agitation", scope: !2, file: !20, line: 75, type: !7, isLocal: false, isDefinition: true)
!20 = !DIFile(filename: "main_d2/ai.cpp", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "ab686873ed81952092c0ae51181ff912")
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "Ai_local_info", scope: !2, file: !20, line: 76, type: !23, isLocal: false, isDefinition: true)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 560000, elements: !67)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "ai_local", file: !25, line: 173, baseType: !26)
!25 = !DIFile(filename: "main_d2/aistruct.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "d122430e792a0ddc0f9eaa08ad217628")
!26 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ai_local", file: !25, line: 147, size: 1600, flags: DIFlagTypePassByValue, elements: !27, identifier: "_ZTS8ai_local")
!27 = !{!28, !29, !30, !31, !32, !33, !34, !35, !40, !41, !42, !43, !44, !45, !46, !47, !60, !61, !66}
!28 = !DIDerivedType(tag: DW_TAG_member, name: "player_awareness_type", scope: !26, file: !25, line: 151, baseType: !7, size: 32)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "retry_count", scope: !26, file: !25, line: 152, baseType: !7, size: 32, offset: 32)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "consecutive_retries", scope: !26, file: !25, line: 153, baseType: !7, size: 32, offset: 64)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "mode", scope: !26, file: !25, line: 154, baseType: !7, size: 32, offset: 96)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "previous_visibility", scope: !26, file: !25, line: 155, baseType: !7, size: 32, offset: 128)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "rapidfire_count", scope: !26, file: !25, line: 156, baseType: !7, size: 32, offset: 160)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "goal_segment", scope: !26, file: !25, line: 157, baseType: !7, size: 32, offset: 192)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "next_action_time", scope: !26, file: !25, line: 161, baseType: !36, size: 32, offset: 224)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "fix", file: !37, line: 20, baseType: !38)
!37 = !DIFile(filename: "./fix/fix.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "c5006a11bf8b4cb7d963898499eda13a")
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !39, line: 30, baseType: !7)
!39 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int32_t.h", directory: "", checksumkind: CSK_MD5, checksum: "d23e8406e80ee79983f28509c741fa17")
!40 = !DIDerivedType(tag: DW_TAG_member, name: "next_fire", scope: !26, file: !25, line: 162, baseType: !36, size: 32, offset: 256)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "next_fire2", scope: !26, file: !25, line: 163, baseType: !36, size: 32, offset: 288)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "player_awareness_time", scope: !26, file: !25, line: 164, baseType: !36, size: 32, offset: 320)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "time_player_seen", scope: !26, file: !25, line: 165, baseType: !36, size: 32, offset: 352)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "time_player_sound_attacked", scope: !26, file: !25, line: 166, baseType: !36, size: 32, offset: 384)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "next_misc_sound_time", scope: !26, file: !25, line: 167, baseType: !36, size: 32, offset: 416)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "time_since_processed", scope: !26, file: !25, line: 168, baseType: !36, size: 32, offset: 448)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "goal_angles", scope: !26, file: !25, line: 169, baseType: !48, size: 480, offset: 480)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !49, size: 480, elements: !58)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_angvec", file: !50, line: 40, baseType: !51)
!50 = !DIFile(filename: "./vecmat/vecmat.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "dfa84e3325c1ea4f5f74699fff5ef2bf")
!51 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_angvec", file: !50, line: 37, size: 48, flags: DIFlagTypePassByValue, elements: !52, identifier: "_ZTS10vms_angvec")
!52 = !{!53, !56, !57}
!53 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !51, file: !50, line: 39, baseType: !54, size: 16)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "fixang", file: !37, line: 21, baseType: !55)
!55 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !51, file: !50, line: 39, baseType: !54, size: 16, offset: 16)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "h", scope: !51, file: !50, line: 39, baseType: !54, size: 16, offset: 32)
!58 = !{!59}
!59 = !DISubrange(count: 10)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "delta_angles", scope: !26, file: !25, line: 170, baseType: !48, size: 480, offset: 960)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "goal_state", scope: !26, file: !25, line: 171, baseType: !62, size: 80, offset: 1440)
!62 = !DICompositeType(tag: DW_TAG_array_type, baseType: !63, size: 80, elements: !58)
!63 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !64, line: 30, baseType: !65)
!64 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int8_t.h", directory: "", checksumkind: CSK_MD5, checksum: "5052dfe782b50fed2355b8f61a9e4fa9")
!65 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "achieved_state", scope: !26, file: !25, line: 172, baseType: !62, size: 80, offset: 1520)
!67 = !{!68}
!68 = !DISubrange(count: 350)
!69 = !DIGlobalVariableExpression(var: !70, expr: !DIExpression())
!70 = distinct !DIGlobalVariable(name: "Point_segs", scope: !2, file: !20, line: 77, type: !71, isLocal: false, isDefinition: true)
!71 = !DICompositeType(tag: DW_TAG_array_type, baseType: !72, size: 320000, elements: !83)
!72 = !DIDerivedType(tag: DW_TAG_typedef, name: "point_seg", file: !25, line: 178, baseType: !73)
!73 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !25, line: 175, size: 128, flags: DIFlagTypePassByValue, elements: !74, identifier: "_ZTS9point_seg")
!74 = !{!75, !76}
!75 = !DIDerivedType(tag: DW_TAG_member, name: "segnum", scope: !73, file: !25, line: 176, baseType: !7, size: 32)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "point", scope: !73, file: !25, line: 177, baseType: !77, size: 96, offset: 32)
!77 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_vector", file: !50, line: 22, baseType: !78)
!78 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_vector", file: !50, line: 19, size: 96, flags: DIFlagTypePassByValue, elements: !79, identifier: "_ZTS10vms_vector")
!79 = !{!80, !81, !82}
!80 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !78, file: !50, line: 21, baseType: !36, size: 32)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !78, file: !50, line: 21, baseType: !36, size: 32, offset: 32)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !78, file: !50, line: 21, baseType: !36, size: 32, offset: 64)
!83 = !{!84}
!84 = !DISubrange(count: 2500)
!85 = !DIGlobalVariableExpression(var: !86, expr: !DIExpression())
!86 = distinct !DIGlobalVariable(name: "Point_segs_free_ptr", scope: !2, file: !20, line: 78, type: !87, isLocal: false, isDefinition: true)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!88 = !DIGlobalVariableExpression(var: !89, expr: !DIExpression())
!89 = distinct !DIGlobalVariable(name: "Ai_cloak_info", scope: !2, file: !20, line: 79, type: !90, isLocal: false, isDefinition: true)
!90 = !DICompositeType(tag: DW_TAG_array_type, baseType: !91, size: 1280, elements: !98)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "ai_cloak_info", file: !92, line: 137, baseType: !93)
!92 = !DIFile(filename: "main_d2/ai.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "c3b19557982e3be343af585a29fb965b")
!93 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !92, line: 132, size: 160, flags: DIFlagTypePassByValue, elements: !94, identifier: "_ZTS13ai_cloak_info")
!94 = !{!95, !96, !97}
!95 = !DIDerivedType(tag: DW_TAG_member, name: "last_time", scope: !93, file: !92, line: 134, baseType: !36, size: 32)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "last_segment", scope: !93, file: !92, line: 135, baseType: !7, size: 32, offset: 32)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "last_position", scope: !93, file: !92, line: 136, baseType: !77, size: 96, offset: 64)
!98 = !{!99}
!99 = !DISubrange(count: 8)
!100 = !DIGlobalVariableExpression(var: !101, expr: !DIExpression())
!101 = distinct !DIGlobalVariable(name: "Boss_cloak_start_time", scope: !2, file: !20, line: 80, type: !36, isLocal: false, isDefinition: true)
!102 = !DIGlobalVariableExpression(var: !103, expr: !DIExpression())
!103 = distinct !DIGlobalVariable(name: "New_awareness", scope: !2, file: !20, line: 81, type: !104, isLocal: false, isDefinition: true)
!104 = !DICompositeType(tag: DW_TAG_array_type, baseType: !63, size: 7200, elements: !105)
!105 = !{!106}
!106 = !DISubrange(count: 900)
!107 = !DIGlobalVariableExpression(var: !108, expr: !DIExpression())
!108 = distinct !DIGlobalVariable(name: "Boss_cloak_end_time", scope: !2, file: !20, line: 82, type: !36, isLocal: false, isDefinition: true)
!109 = !DIGlobalVariableExpression(var: !110, expr: !DIExpression())
!110 = distinct !DIGlobalVariable(name: "Last_teleport_time", scope: !2, file: !20, line: 83, type: !36, isLocal: false, isDefinition: true)
!111 = !DIGlobalVariableExpression(var: !112, expr: !DIExpression())
!112 = distinct !DIGlobalVariable(name: "Boss_teleport_interval", scope: !2, file: !20, line: 84, type: !36, isLocal: false, isDefinition: true)
!113 = !DIGlobalVariableExpression(var: !114, expr: !DIExpression())
!114 = distinct !DIGlobalVariable(name: "Boss_cloak_interval", scope: !2, file: !20, line: 85, type: !36, isLocal: false, isDefinition: true)
!115 = !DIGlobalVariableExpression(var: !116, expr: !DIExpression())
!116 = distinct !DIGlobalVariable(name: "Boss_cloak_duration", scope: !2, file: !20, line: 86, type: !36, isLocal: false, isDefinition: true)
!117 = !DIGlobalVariableExpression(var: !118, expr: !DIExpression())
!118 = distinct !DIGlobalVariable(name: "Last_gate_time", scope: !2, file: !20, line: 87, type: !36, isLocal: false, isDefinition: true)
!119 = !DIGlobalVariableExpression(var: !120, expr: !DIExpression())
!120 = distinct !DIGlobalVariable(name: "Gate_interval", scope: !2, file: !20, line: 88, type: !36, isLocal: false, isDefinition: true)
!121 = !DIGlobalVariableExpression(var: !122, expr: !DIExpression())
!122 = distinct !DIGlobalVariable(name: "Boss_dying_start_time", scope: !2, file: !20, line: 89, type: !36, isLocal: false, isDefinition: true)
!123 = !DIGlobalVariableExpression(var: !124, expr: !DIExpression())
!124 = distinct !DIGlobalVariable(name: "Boss_hit_time", scope: !2, file: !20, line: 90, type: !36, isLocal: false, isDefinition: true)
!125 = !DIGlobalVariableExpression(var: !126, expr: !DIExpression())
!126 = distinct !DIGlobalVariable(name: "Boss_dying", scope: !2, file: !20, line: 91, type: !63, isLocal: false, isDefinition: true)
!127 = !DIGlobalVariableExpression(var: !128, expr: !DIExpression())
!128 = distinct !DIGlobalVariable(name: "Boss_dying_sound_playing", scope: !2, file: !20, line: 91, type: !63, isLocal: false, isDefinition: true)
!129 = !DIGlobalVariableExpression(var: !130, expr: !DIExpression())
!130 = distinct !DIGlobalVariable(name: "unused123", scope: !2, file: !20, line: 91, type: !63, isLocal: false, isDefinition: true)
!131 = !DIGlobalVariableExpression(var: !132, expr: !DIExpression())
!132 = distinct !DIGlobalVariable(name: "unused234", scope: !2, file: !20, line: 91, type: !63, isLocal: false, isDefinition: true)
!133 = !DIGlobalVariableExpression(var: !134, expr: !DIExpression())
!134 = distinct !DIGlobalVariable(name: "Boss_teleports", scope: !2, file: !20, line: 101, type: !135, isLocal: false, isDefinition: true)
!135 = !DICompositeType(tag: DW_TAG_array_type, baseType: !136, size: 64, elements: !98)
!136 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !137, line: 31, baseType: !138)
!137 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint8_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8b64ccf8c67b8c006b07b8daf1b49be5")
!138 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!139 = !DIGlobalVariableExpression(var: !140, expr: !DIExpression())
!140 = distinct !DIGlobalVariable(name: "Boss_spew_more", scope: !2, file: !20, line: 102, type: !135, isLocal: false, isDefinition: true)
!141 = !DIGlobalVariableExpression(var: !142, expr: !DIExpression())
!142 = distinct !DIGlobalVariable(name: "Boss_spews_bots_energy", scope: !2, file: !20, line: 103, type: !135, isLocal: false, isDefinition: true)
!143 = !DIGlobalVariableExpression(var: !144, expr: !DIExpression())
!144 = distinct !DIGlobalVariable(name: "Boss_spews_bots_matter", scope: !2, file: !20, line: 104, type: !135, isLocal: false, isDefinition: true)
!145 = !DIGlobalVariableExpression(var: !146, expr: !DIExpression())
!146 = distinct !DIGlobalVariable(name: "Boss_invulnerable_energy", scope: !2, file: !20, line: 105, type: !135, isLocal: false, isDefinition: true)
!147 = !DIGlobalVariableExpression(var: !148, expr: !DIExpression())
!148 = distinct !DIGlobalVariable(name: "Boss_invulnerable_matter", scope: !2, file: !20, line: 106, type: !135, isLocal: false, isDefinition: true)
!149 = !DIGlobalVariableExpression(var: !150, expr: !DIExpression())
!150 = distinct !DIGlobalVariable(name: "Boss_invulnerable_spot", scope: !2, file: !20, line: 107, type: !135, isLocal: false, isDefinition: true)
!151 = !DIGlobalVariableExpression(var: !152, expr: !DIExpression())
!152 = distinct !DIGlobalVariable(name: "ai_evaded", scope: !2, file: !20, line: 109, type: !7, isLocal: false, isDefinition: true)
!153 = !DIGlobalVariableExpression(var: !154, expr: !DIExpression())
!154 = distinct !DIGlobalVariable(name: "Robot_firing_enabled", scope: !2, file: !20, line: 113, type: !7, isLocal: false, isDefinition: true)
!155 = !DIGlobalVariableExpression(var: !156, expr: !DIExpression())
!156 = distinct !DIGlobalVariable(name: "Animation_enabled", scope: !2, file: !20, line: 114, type: !7, isLocal: false, isDefinition: true)
!157 = !DIGlobalVariableExpression(var: !158, expr: !DIExpression())
!158 = distinct !DIGlobalVariable(name: "Ai_info_enabled", scope: !2, file: !20, line: 117, type: !7, isLocal: false, isDefinition: true)
!159 = !DIGlobalVariableExpression(var: !160, expr: !DIExpression())
!160 = distinct !DIGlobalVariable(name: "Hit_pos", scope: !2, file: !20, line: 123, type: !77, isLocal: false, isDefinition: true)
!161 = !DIGlobalVariableExpression(var: !162, expr: !DIExpression())
!162 = distinct !DIGlobalVariable(name: "Hit_type", scope: !2, file: !20, line: 124, type: !7, isLocal: false, isDefinition: true)
!163 = !DIGlobalVariableExpression(var: !164, expr: !DIExpression())
!164 = distinct !DIGlobalVariable(name: "Hit_seg", scope: !2, file: !20, line: 124, type: !7, isLocal: false, isDefinition: true)
!165 = !DIGlobalVariableExpression(var: !166, expr: !DIExpression())
!166 = distinct !DIGlobalVariable(name: "Hit_data", scope: !2, file: !20, line: 125, type: !167, isLocal: false, isDefinition: true)
!167 = !DIDerivedType(tag: DW_TAG_typedef, name: "fvi_info", file: !168, line: 40, baseType: !169)
!168 = !DIFile(filename: "main_d2/fvi.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "d2a92d1b0ff4ebfc1a57eff3c7d6fa46")
!169 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fvi_info", file: !168, line: 29, size: 3584, flags: DIFlagTypePassByValue, elements: !170, identifier: "_ZTS8fvi_info")
!170 = !{!171, !172, !173, !174, !175, !176, !177, !178, !179}
!171 = !DIDerivedType(tag: DW_TAG_member, name: "hit_type", scope: !169, file: !168, line: 31, baseType: !7, size: 32)
!172 = !DIDerivedType(tag: DW_TAG_member, name: "hit_pnt", scope: !169, file: !168, line: 32, baseType: !77, size: 96, offset: 32)
!173 = !DIDerivedType(tag: DW_TAG_member, name: "hit_seg", scope: !169, file: !168, line: 33, baseType: !7, size: 32, offset: 128)
!174 = !DIDerivedType(tag: DW_TAG_member, name: "hit_side", scope: !169, file: !168, line: 34, baseType: !7, size: 32, offset: 160)
!175 = !DIDerivedType(tag: DW_TAG_member, name: "hit_side_seg", scope: !169, file: !168, line: 35, baseType: !7, size: 32, offset: 192)
!176 = !DIDerivedType(tag: DW_TAG_member, name: "hit_object", scope: !169, file: !168, line: 36, baseType: !7, size: 32, offset: 224)
!177 = !DIDerivedType(tag: DW_TAG_member, name: "hit_wallnorm", scope: !169, file: !168, line: 37, baseType: !77, size: 96, offset: 256)
!178 = !DIDerivedType(tag: DW_TAG_member, name: "n_segs", scope: !169, file: !168, line: 38, baseType: !7, size: 32, offset: 352)
!179 = !DIDerivedType(tag: DW_TAG_member, name: "seglist", scope: !169, file: !168, line: 39, baseType: !180, size: 3200, offset: 384)
!180 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !181)
!181 = !{!182}
!182 = !DISubrange(count: 100)
!183 = !DIGlobalVariableExpression(var: !184, expr: !DIExpression())
!184 = distinct !DIGlobalVariable(name: "Num_awareness_events", scope: !2, file: !20, line: 127, type: !7, isLocal: false, isDefinition: true)
!185 = !DIGlobalVariableExpression(var: !186, expr: !DIExpression())
!186 = distinct !DIGlobalVariable(name: "Awareness_events", scope: !2, file: !20, line: 128, type: !187, isLocal: false, isDefinition: true)
!187 = !DICompositeType(tag: DW_TAG_array_type, baseType: !188, size: 8192, elements: !194)
!188 = !DIDerivedType(tag: DW_TAG_typedef, name: "awareness_event", file: !92, line: 154, baseType: !189)
!189 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "awareness_event", file: !92, line: 150, size: 128, flags: DIFlagTypePassByValue, elements: !190, identifier: "_ZTS15awareness_event")
!190 = !{!191, !192, !193}
!191 = !DIDerivedType(tag: DW_TAG_member, name: "segnum", scope: !189, file: !92, line: 151, baseType: !55, size: 16)
!192 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !189, file: !92, line: 152, baseType: !55, size: 16, offset: 16)
!193 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !189, file: !92, line: 153, baseType: !77, size: 96, offset: 32)
!194 = !{!195}
!195 = !DISubrange(count: 64)
!196 = !DIGlobalVariableExpression(var: !197, expr: !DIExpression())
!197 = distinct !DIGlobalVariable(name: "Believed_player_pos", scope: !2, file: !20, line: 130, type: !77, isLocal: false, isDefinition: true)
!198 = !DIGlobalVariableExpression(var: !199, expr: !DIExpression())
!199 = distinct !DIGlobalVariable(name: "Believed_player_seg", scope: !2, file: !20, line: 131, type: !7, isLocal: false, isDefinition: true)
!200 = !DIGlobalVariableExpression(var: !201, expr: !DIExpression())
!201 = distinct !DIGlobalVariable(scope: null, file: !20, line: 136, type: !202, isLocal: true, isDefinition: true)
!202 = !DICompositeType(tag: DW_TAG_array_type, baseType: !203, size: 48, elements: !205)
!203 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !204)
!204 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!205 = !{!206}
!206 = !DISubrange(count: 6)
!207 = !DIGlobalVariableExpression(var: !208, expr: !DIExpression())
!208 = distinct !DIGlobalVariable(scope: null, file: !20, line: 137, type: !209, isLocal: true, isDefinition: true)
!209 = !DICompositeType(tag: DW_TAG_array_type, baseType: !203, size: 56, elements: !210)
!210 = !{!211}
!211 = !DISubrange(count: 7)
!212 = !DIGlobalVariableExpression(var: !213, expr: !DIExpression())
!213 = distinct !DIGlobalVariable(scope: null, file: !20, line: 138, type: !214, isLocal: true, isDefinition: true)
!214 = !DICompositeType(tag: DW_TAG_array_type, baseType: !203, size: 72, elements: !215)
!215 = !{!216}
!216 = !DISubrange(count: 9)
!217 = !DIGlobalVariableExpression(var: !218, expr: !DIExpression())
!218 = distinct !DIGlobalVariable(scope: null, file: !20, line: 139, type: !219, isLocal: true, isDefinition: true)
!219 = !DICompositeType(tag: DW_TAG_array_type, baseType: !203, size: 80, elements: !58)
!220 = !DIGlobalVariableExpression(var: !221, expr: !DIExpression())
!221 = distinct !DIGlobalVariable(scope: null, file: !20, line: 140, type: !214, isLocal: true, isDefinition: true)
!222 = !DIGlobalVariableExpression(var: !223, expr: !DIExpression())
!223 = distinct !DIGlobalVariable(scope: null, file: !20, line: 141, type: !209, isLocal: true, isDefinition: true)
!224 = !DIGlobalVariableExpression(var: !225, expr: !DIExpression())
!225 = distinct !DIGlobalVariable(scope: null, file: !20, line: 142, type: !219, isLocal: true, isDefinition: true)
!226 = !DIGlobalVariableExpression(var: !227, expr: !DIExpression())
!227 = distinct !DIGlobalVariable(scope: null, file: !20, line: 143, type: !219, isLocal: true, isDefinition: true)
!228 = !DIGlobalVariableExpression(var: !229, expr: !DIExpression())
!229 = distinct !DIGlobalVariable(scope: null, file: !20, line: 144, type: !214, isLocal: true, isDefinition: true)
!230 = !DIGlobalVariableExpression(var: !231, expr: !DIExpression())
!231 = distinct !DIGlobalVariable(scope: null, file: !20, line: 145, type: !214, isLocal: true, isDefinition: true)
!232 = !DIGlobalVariableExpression(var: !233, expr: !DIExpression())
!233 = distinct !DIGlobalVariable(scope: null, file: !20, line: 146, type: !209, isLocal: true, isDefinition: true)
!234 = !DIGlobalVariableExpression(var: !235, expr: !DIExpression())
!235 = distinct !DIGlobalVariable(scope: null, file: !20, line: 147, type: !236, isLocal: true, isDefinition: true)
!236 = !DICompositeType(tag: DW_TAG_array_type, baseType: !203, size: 64, elements: !98)
!237 = !DIGlobalVariableExpression(var: !238, expr: !DIExpression())
!238 = distinct !DIGlobalVariable(scope: null, file: !20, line: 148, type: !236, isLocal: true, isDefinition: true)
!239 = !DIGlobalVariableExpression(var: !240, expr: !DIExpression())
!240 = distinct !DIGlobalVariable(scope: null, file: !20, line: 149, type: !236, isLocal: true, isDefinition: true)
!241 = !DIGlobalVariableExpression(var: !242, expr: !DIExpression())
!242 = distinct !DIGlobalVariable(scope: null, file: !20, line: 150, type: !236, isLocal: true, isDefinition: true)
!243 = !DIGlobalVariableExpression(var: !244, expr: !DIExpression())
!244 = distinct !DIGlobalVariable(scope: null, file: !20, line: 151, type: !219, isLocal: true, isDefinition: true)
!245 = !DIGlobalVariableExpression(var: !246, expr: !DIExpression())
!246 = distinct !DIGlobalVariable(scope: null, file: !20, line: 152, type: !247, isLocal: true, isDefinition: true)
!247 = !DICompositeType(tag: DW_TAG_array_type, baseType: !203, size: 88, elements: !248)
!248 = !{!249}
!249 = !DISubrange(count: 11)
!250 = !DIGlobalVariableExpression(var: !251, expr: !DIExpression())
!251 = distinct !DIGlobalVariable(scope: null, file: !20, line: 153, type: !236, isLocal: true, isDefinition: true)
!252 = !DIGlobalVariableExpression(var: !253, expr: !DIExpression())
!253 = distinct !DIGlobalVariable(name: "mode_text", scope: !2, file: !20, line: 135, type: !254, isLocal: false, isDefinition: true)
!254 = !DICompositeType(tag: DW_TAG_array_type, baseType: !255, size: 1152, elements: !256)
!255 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !203, size: 64)
!256 = !{!257}
!257 = !DISubrange(count: 18)
!258 = !DIGlobalVariableExpression(var: !259, expr: !DIExpression())
!259 = distinct !DIGlobalVariable(name: "behavior_text", scope: !2, file: !20, line: 158, type: !260, isLocal: false, isDefinition: true)
!260 = !DICompositeType(tag: DW_TAG_array_type, baseType: !203, size: 432, elements: !261)
!261 = !{!206, !216}
!262 = !DIGlobalVariableExpression(var: !263, expr: !DIExpression())
!263 = distinct !DIGlobalVariable(name: "state_text", scope: !2, file: !20, line: 168, type: !264, isLocal: false, isDefinition: true)
!264 = !DICompositeType(tag: DW_TAG_array_type, baseType: !203, size: 320, elements: !265)
!265 = !{!99, !266}
!266 = !DISubrange(count: 5)
!267 = !DIGlobalVariableExpression(var: !268, expr: !DIExpression())
!268 = distinct !DIGlobalVariable(name: "Ai_transition_table", scope: !2, file: !20, line: 189, type: !269, isLocal: false, isDefinition: true)
!269 = !DICompositeType(tag: DW_TAG_array_type, baseType: !63, size: 1568, elements: !270)
!270 = !{!271, !211, !211}
!271 = !DISubrange(count: 4)
!272 = !DIGlobalVariableExpression(var: !273, expr: !DIExpression())
!273 = distinct !DIGlobalVariable(name: "Dist_to_last_fired_upon_player_pos", scope: !2, file: !20, line: 239, type: !36, isLocal: false, isDefinition: true)
!274 = !DIGlobalVariableExpression(var: !275, expr: !DIExpression())
!275 = distinct !DIGlobalVariable(scope: null, file: !20, line: 319, type: !276, isLocal: true, isDefinition: true)
!276 = !DICompositeType(tag: DW_TAG_array_type, baseType: !203, size: 304, elements: !277)
!277 = !{!278}
!278 = !DISubrange(count: 38)
!279 = !DIGlobalVariableExpression(var: !280, expr: !DIExpression())
!280 = distinct !DIGlobalVariable(scope: null, file: !20, line: 327, type: !276, isLocal: true, isDefinition: true)
!281 = !DIGlobalVariableExpression(var: !282, expr: !DIExpression())
!282 = distinct !DIGlobalVariable(name: "Ai_last_missile_camera", scope: !2, file: !20, line: 331, type: !7, isLocal: false, isDefinition: true)
!283 = !DIGlobalVariableExpression(var: !284, expr: !DIExpression())
!284 = distinct !DIGlobalVariable(name: "Robots_kill_robots_cheat", scope: !2, file: !20, line: 333, type: !7, isLocal: false, isDefinition: true)
!285 = !DIGlobalVariableExpression(var: !286, expr: !DIExpression())
!286 = distinct !DIGlobalVariable(scope: null, file: !20, line: 916, type: !287, isLocal: true, isDefinition: true)
!287 = !DICompositeType(tag: DW_TAG_array_type, baseType: !203, size: 256, elements: !288)
!288 = !{!289}
!289 = !DISubrange(count: 32)
!290 = !DIGlobalVariableExpression(var: !291, expr: !DIExpression())
!291 = distinct !DIGlobalVariable(scope: null, file: !20, line: 916, type: !292, isLocal: true, isDefinition: true)
!292 = !DICompositeType(tag: DW_TAG_array_type, baseType: !203, size: 416, elements: !293)
!293 = !{!294}
!294 = !DISubrange(count: 52)
!295 = !DIGlobalVariableExpression(var: !296, expr: !DIExpression())
!296 = distinct !DIGlobalVariable(scope: null, file: !20, line: 951, type: !297, isLocal: true, isDefinition: true)
!297 = !DICompositeType(tag: DW_TAG_array_type, baseType: !203, size: 144, elements: !256)
!298 = !DIGlobalVariableExpression(var: !299, expr: !DIExpression())
!299 = distinct !DIGlobalVariable(scope: null, file: !20, line: 952, type: !300, isLocal: true, isDefinition: true)
!300 = !DICompositeType(tag: DW_TAG_array_type, baseType: !203, size: 192, elements: !301)
!301 = !{!302}
!302 = !DISubrange(count: 24)
!303 = !DIGlobalVariableExpression(var: !304, expr: !DIExpression())
!304 = distinct !DIGlobalVariable(scope: null, file: !20, line: 1114, type: !305, isLocal: true, isDefinition: true)
!305 = !DICompositeType(tag: DW_TAG_array_type, baseType: !203, size: 272, elements: !306)
!306 = !{!307}
!307 = !DISubrange(count: 34)
!308 = !DIGlobalVariableExpression(var: !309, expr: !DIExpression())
!309 = distinct !DIGlobalVariable(scope: null, file: !20, line: 1247, type: !310, isLocal: true, isDefinition: true)
!310 = !DICompositeType(tag: DW_TAG_array_type, baseType: !203, size: 352, elements: !311)
!311 = !{!312}
!312 = !DISubrange(count: 44)
!313 = !DIGlobalVariableExpression(var: !314, expr: !DIExpression())
!314 = distinct !DIGlobalVariable(scope: null, file: !20, line: 1287, type: !315, isLocal: true, isDefinition: true)
!315 = !DICompositeType(tag: DW_TAG_array_type, baseType: !203, size: 16, elements: !316)
!316 = !{!317}
!317 = !DISubrange(count: 2)
!318 = !DIGlobalVariableExpression(var: !319, expr: !DIExpression())
!319 = distinct !DIGlobalVariable(scope: null, file: !20, line: 1377, type: !320, isLocal: true, isDefinition: true)
!320 = !DICompositeType(tag: DW_TAG_array_type, baseType: !203, size: 312, elements: !321)
!321 = !{!322}
!322 = !DISubrange(count: 39)
!323 = !DIGlobalVariableExpression(var: !324, expr: !DIExpression())
!324 = distinct !DIGlobalVariable(scope: null, file: !20, line: 1381, type: !276, isLocal: true, isDefinition: true)
!325 = !DIGlobalVariableExpression(var: !326, expr: !DIExpression())
!326 = distinct !DIGlobalVariable(scope: null, file: !20, line: 1778, type: !327, isLocal: true, isDefinition: true)
!327 = !DICompositeType(tag: DW_TAG_array_type, baseType: !203, size: 184, elements: !328)
!328 = !{!329}
!329 = !DISubrange(count: 23)
!330 = !DIGlobalVariableExpression(var: !331, expr: !DIExpression())
!331 = distinct !DIGlobalVariable(scope: null, file: !20, line: 1817, type: !332, isLocal: true, isDefinition: true)
!332 = !DICompositeType(tag: DW_TAG_array_type, baseType: !203, size: 368, elements: !333)
!333 = !{!334}
!334 = !DISubrange(count: 46)
!335 = !DIGlobalVariableExpression(var: !336, expr: !DIExpression())
!336 = distinct !DIGlobalVariable(scope: null, file: !20, line: 1840, type: !320, isLocal: true, isDefinition: true)
!337 = !DIGlobalVariableExpression(var: !338, expr: !DIExpression())
!338 = distinct !DIGlobalVariable(scope: null, file: !20, line: 1841, type: !339, isLocal: true, isDefinition: true)
!339 = !DICompositeType(tag: DW_TAG_array_type, baseType: !203, size: 232, elements: !340)
!340 = !{!341}
!341 = !DISubrange(count: 29)
!342 = !DIGlobalVariableExpression(var: !343, expr: !DIExpression())
!343 = distinct !DIGlobalVariable(scope: null, file: !20, line: 1842, type: !344, isLocal: true, isDefinition: true)
!344 = !DICompositeType(tag: DW_TAG_array_type, baseType: !203, size: 208, elements: !345)
!345 = !{!346}
!346 = !DISubrange(count: 26)
!347 = !DIGlobalVariableExpression(var: !348, expr: !DIExpression())
!348 = distinct !DIGlobalVariable(scope: null, file: !20, line: 1953, type: !287, isLocal: true, isDefinition: true)
!349 = !DIGlobalVariableExpression(var: !350, expr: !DIExpression())
!350 = distinct !DIGlobalVariable(name: "Ai_dump_enable", scope: !2, file: !20, line: 2125, type: !7, isLocal: false, isDefinition: true)
!351 = !DIGlobalVariableExpression(var: !352, expr: !DIExpression())
!352 = distinct !DIGlobalVariable(name: "Ai_dump_file", scope: !2, file: !20, line: 2127, type: !353, isLocal: false, isDefinition: true)
!353 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !354, size: 64)
!354 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !355, line: 162, baseType: !356)
!355 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "d91ebd7d161d9196cc100822ef0e5cdf")
!356 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILE", file: !355, line: 131, size: 1216, flags: DIFlagTypePassByValue, elements: !357, identifier: "_ZTS7__sFILE")
!357 = !{!358, !360, !361, !362, !363, !364, !369, !370, !372, !376, !381, !390, !394, !395, !398, !399, !403, !407, !408, !409}
!358 = !DIDerivedType(tag: DW_TAG_member, name: "_p", scope: !356, file: !355, line: 132, baseType: !359, size: 64)
!359 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !138, size: 64)
!360 = !DIDerivedType(tag: DW_TAG_member, name: "_r", scope: !356, file: !355, line: 133, baseType: !7, size: 32, offset: 64)
!361 = !DIDerivedType(tag: DW_TAG_member, name: "_w", scope: !356, file: !355, line: 134, baseType: !7, size: 32, offset: 96)
!362 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !356, file: !355, line: 135, baseType: !55, size: 16, offset: 128)
!363 = !DIDerivedType(tag: DW_TAG_member, name: "_file", scope: !356, file: !355, line: 136, baseType: !55, size: 16, offset: 144)
!364 = !DIDerivedType(tag: DW_TAG_member, name: "_bf", scope: !356, file: !355, line: 137, baseType: !365, size: 128, offset: 192)
!365 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sbuf", file: !355, line: 97, size: 128, flags: DIFlagTypePassByValue, elements: !366, identifier: "_ZTS6__sbuf")
!366 = !{!367, !368}
!367 = !DIDerivedType(tag: DW_TAG_member, name: "_base", scope: !365, file: !355, line: 98, baseType: !359, size: 64)
!368 = !DIDerivedType(tag: DW_TAG_member, name: "_size", scope: !365, file: !355, line: 99, baseType: !7, size: 32, offset: 64)
!369 = !DIDerivedType(tag: DW_TAG_member, name: "_lbfsize", scope: !356, file: !355, line: 138, baseType: !7, size: 32, offset: 320)
!370 = !DIDerivedType(tag: DW_TAG_member, name: "_cookie", scope: !356, file: !355, line: 141, baseType: !371, size: 64, offset: 384)
!371 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!372 = !DIDerivedType(tag: DW_TAG_member, name: "_close", scope: !356, file: !355, line: 142, baseType: !373, size: 64, offset: 448)
!373 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !374, size: 64)
!374 = !DISubroutineType(types: !375)
!375 = !{!7, !371}
!376 = !DIDerivedType(tag: DW_TAG_member, name: "_read", scope: !356, file: !355, line: 143, baseType: !377, size: 64, offset: 512)
!377 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !378, size: 64)
!378 = !DISubroutineType(types: !379)
!379 = !{!7, !371, !380, !7}
!380 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !204, size: 64)
!381 = !DIDerivedType(tag: DW_TAG_member, name: "_seek", scope: !356, file: !355, line: 144, baseType: !382, size: 64, offset: 576)
!382 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !383, size: 64)
!383 = !DISubroutineType(types: !384)
!384 = !{!385, !371, !385, !7}
!385 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !355, line: 86, baseType: !386)
!386 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_off_t", file: !387, line: 83, baseType: !388)
!387 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "af82ff6119a9fa80fad635d276556d46")
!388 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !389, line: 37, baseType: !16)
!389 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/arm/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "b270144f57ae258d0ce80b8f87be068c")
!390 = !DIDerivedType(tag: DW_TAG_member, name: "_write", scope: !356, file: !355, line: 145, baseType: !391, size: 64, offset: 640)
!391 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !392, size: 64)
!392 = !DISubroutineType(types: !393)
!393 = !{!7, !371, !255, !7}
!394 = !DIDerivedType(tag: DW_TAG_member, name: "_ub", scope: !356, file: !355, line: 148, baseType: !365, size: 128, offset: 704)
!395 = !DIDerivedType(tag: DW_TAG_member, name: "_extra", scope: !356, file: !355, line: 149, baseType: !396, size: 64, offset: 832)
!396 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !397, size: 64)
!397 = !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILEX", file: !355, line: 103, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS8__sFILEX")
!398 = !DIDerivedType(tag: DW_TAG_member, name: "_ur", scope: !356, file: !355, line: 150, baseType: !7, size: 32, offset: 896)
!399 = !DIDerivedType(tag: DW_TAG_member, name: "_ubuf", scope: !356, file: !355, line: 153, baseType: !400, size: 24, offset: 928)
!400 = !DICompositeType(tag: DW_TAG_array_type, baseType: !138, size: 24, elements: !401)
!401 = !{!402}
!402 = !DISubrange(count: 3)
!403 = !DIDerivedType(tag: DW_TAG_member, name: "_nbuf", scope: !356, file: !355, line: 154, baseType: !404, size: 8, offset: 952)
!404 = !DICompositeType(tag: DW_TAG_array_type, baseType: !138, size: 8, elements: !405)
!405 = !{!406}
!406 = !DISubrange(count: 1)
!407 = !DIDerivedType(tag: DW_TAG_member, name: "_lb", scope: !356, file: !355, line: 157, baseType: !365, size: 128, offset: 960)
!408 = !DIDerivedType(tag: DW_TAG_member, name: "_blksize", scope: !356, file: !355, line: 160, baseType: !7, size: 32, offset: 1088)
!409 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !356, file: !355, line: 161, baseType: !385, size: 64, offset: 1152)
!410 = !DIGlobalVariableExpression(var: !411, expr: !DIExpression())
!411 = distinct !DIGlobalVariable(name: "Ai_error_message", scope: !2, file: !20, line: 2129, type: !412, isLocal: false, isDefinition: true)
!412 = !DICompositeType(tag: DW_TAG_array_type, baseType: !204, size: 1024, elements: !413)
!413 = !{!414}
!414 = !DISubrange(count: 128)
!415 = !DIGlobalVariableExpression(var: !416, expr: !DIExpression())
!416 = distinct !DIGlobalVariable(scope: null, file: !20, line: 2140, type: !417, isLocal: true, isDefinition: true)
!417 = !DICompositeType(tag: DW_TAG_array_type, baseType: !203, size: 32, elements: !418)
!418 = !{!271}
!419 = !DIGlobalVariableExpression(var: !420, expr: !DIExpression())
!420 = distinct !DIGlobalVariable(scope: null, file: !20, line: 2394, type: !292, isLocal: true, isDefinition: true)
!421 = !DIGlobalVariableExpression(var: !422, expr: !DIExpression())
!422 = distinct !DIGlobalVariable(scope: null, file: !20, line: 2396, type: !423, isLocal: true, isDefinition: true)
!423 = !DICompositeType(tag: DW_TAG_array_type, baseType: !203, size: 392, elements: !424)
!424 = !{!425}
!425 = !DISubrange(count: 49)
!426 = !DIGlobalVariableExpression(var: !427, expr: !DIExpression())
!427 = distinct !DIGlobalVariable(scope: null, file: !20, line: 2415, type: !428, isLocal: true, isDefinition: true)
!428 = !DICompositeType(tag: DW_TAG_array_type, baseType: !203, size: 528, elements: !429)
!429 = !{!430}
!430 = !DISubrange(count: 66)
!431 = !DIGlobalVariableExpression(var: !432, expr: !DIExpression(DW_OP_constu, 16, DW_OP_stack_value))
!432 = distinct !DIGlobalVariable(name: "FRACBITS", scope: !2, file: !37, line: 18, type: !433, isLocal: true, isDefinition: true)
!433 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!434 = !{!435, !439, !442, !443, !444, !445, !449, !453, !457, !460, !462, !464, !466, !468, !470, !472, !474, !476, !478, !480, !482, !484, !486, !488, !490, !495, !499, !502, !505, !510, !516, !518, !520, !522, !524, !526, !528, !530, !532, !534, !536, !538, !540, !542, !547, !552, !557, !562, !564, !567, !569, !571, !573, !575, !577, !579, !581, !583, !585, !589, !593, !597, !599, !603, !607, !617, !632, !633, !634, !642, !644, !652, !658, !662, !666, !668, !672, !676, !680, !684, !688, !692, !694, !696, !700, !706, !711, !715, !719, !723, !727, !731, !735, !739, !741, !743, !747, !749, !753, !757, !762, !764, !766, !768, !772, !776, !780, !782, !786, !788, !790, !792, !794, !800, !804, !806, !812, !817, !821, !825, !830, !835, !839, !843, !847, !851, !853, !855, !863, !869, !875, !879, !883, !887, !891, !896, !900, !904, !908, !912, !916, !920, !924, !928, !933, !937, !941, !945, !950, !955, !959, !961, !965, !967, !976, !980, !985, !989, !993, !997, !1001, !1003, !1007, !1011, !1015, !1019, !1023, !1025, !1027, !1029, !1037, !1039, !1041, !1043, !1049, !1051, !1052, !1053, !1054, !1057, !1059, !1060, !1064, !1066, !1068, !1072, !1074, !1076, !1078, !1080, !1082, !1084, !1086, !1091, !1095, !1097, !1099, !1100, !1105, !1107, !1109, !1111, !1113, !1115, !1117, !1119, !1121, !1123, !1125, !1127, !1129, !1131, !1133, !1135, !1137, !1141, !1143, !1145, !1147, !1151, !1153, !1157, !1159, !1161, !1163, !1165, !1169, !1171, !1173, !1177, !1179, !1181, !1185, !1187, !1191, !1193, !1195, !1199, !1201, !1203, !1205, !1207, !1209, !1211, !1215, !1217, !1219, !1221, !1223, !1225, !1227, !1229, !1233, !1237, !1239, !1241, !1243, !1245, !1247, !1249, !1251, !1253, !1255, !1257, !1259, !1261, !1263, !1265, !1267, !1269, !1271, !1273, !1275, !1279, !1281, !1283, !1285, !1289, !1291, !1295, !1297, !1299, !1301, !1303, !1307, !1309, !1313, !1315, !1317, !1319, !1321, !1325, !1327, !1329, !1333, !1335, !1337, !1339, !1345, !1347, !1351, !1355, !1357, !1359, !1363, !1367, !1371, !1373, !1377, !1382, !1386, !1390, !1392, !1394, !1396, !1398, !1400, !1402, !1406, !1410, !1415, !1420, !1424, !1425, !1429, !1433, !1438, !1443, !1447, !1453, !1457, !1459, !1463, !1465, !1466, !1470, !1472, !1476, !1480, !1484, !1486, !1490, !1494, !1498, !1504, !1506, !1510, !1514, !1518, !1520, !1524, !1528, !1532, !1534, !1536, !1538, !1542, !1546, !1551, !1555, !1561, !1565, !1569, !1571, !1573, !1575, !1579, !1583, !1587, !1589, !1591, !1595, !1599, !1601, !1605, !1609, !1612, !1614, !1616, !1618, !1647, !1652, !1657}
!435 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !63, file: !438, line: 158)
!436 = !DINamespace(name: "__1", scope: !437, exportSymbols: true)
!437 = !DINamespace(name: "std", scope: null)
!438 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdint", directory: "")
!439 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !440, file: !438, line: 159)
!440 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !441, line: 30, baseType: !55)
!441 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int16_t.h", directory: "", checksumkind: CSK_MD5, checksum: "47ed3c3ac6f65bfec021ca2b7be18e7e")
!442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !38, file: !438, line: 160)
!443 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !14, file: !438, line: 161)
!444 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !136, file: !438, line: 163)
!445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !446, file: !438, line: 164)
!446 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !447, line: 31, baseType: !448)
!447 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint16_t.h", directory: "", checksumkind: CSK_MD5, checksum: "f0aa926da906b10566dd3171bf347ab7")
!448 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!449 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !450, file: !438, line: 165)
!450 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !451, line: 31, baseType: !452)
!451 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint32_t.h", directory: "", checksumkind: CSK_MD5, checksum: "0254eb80c6b9719ac45c3c1cf872109b")
!452 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !454, file: !438, line: 166)
!454 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !455, line: 31, baseType: !456)
!455 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint64_t.h", directory: "", checksumkind: CSK_MD5, checksum: "77fc5e91653260959605f129691cf9b1")
!456 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !458, file: !438, line: 168)
!458 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !459, line: 29, baseType: !63)
!459 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "042ceedaf4137a8aaa272d0b27434016")
!460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !461, file: !438, line: 169)
!461 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !459, line: 30, baseType: !440)
!462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !463, file: !438, line: 170)
!463 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !459, line: 31, baseType: !38)
!464 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !465, file: !438, line: 171)
!465 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !459, line: 32, baseType: !14)
!466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !467, file: !438, line: 173)
!467 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !459, line: 33, baseType: !136)
!468 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !469, file: !438, line: 174)
!469 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !459, line: 34, baseType: !446)
!470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !471, file: !438, line: 175)
!471 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !459, line: 35, baseType: !450)
!472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !473, file: !438, line: 176)
!473 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !459, line: 36, baseType: !454)
!474 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !475, file: !438, line: 178)
!475 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !459, line: 40, baseType: !63)
!476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !477, file: !438, line: 179)
!477 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !459, line: 41, baseType: !440)
!478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !479, file: !438, line: 180)
!479 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !459, line: 42, baseType: !38)
!480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !481, file: !438, line: 181)
!481 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !459, line: 43, baseType: !14)
!482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !483, file: !438, line: 183)
!483 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !459, line: 44, baseType: !136)
!484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !485, file: !438, line: 184)
!485 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !459, line: 45, baseType: !446)
!486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !487, file: !438, line: 185)
!487 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !459, line: 46, baseType: !450)
!488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !489, file: !438, line: 186)
!489 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !459, line: 47, baseType: !454)
!490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !491, file: !438, line: 188)
!491 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !492, line: 32, baseType: !493)
!492 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_intptr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e478ba47270923b1cca6659f19f02db1")
!493 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_intptr_t", file: !389, line: 40, baseType: !494)
!494 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!495 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !496, file: !438, line: 189)
!496 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !497, line: 34, baseType: !498)
!497 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_uintptr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e70ae655dd1b9d4ae0b1dcc073f5b7e4")
!498 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!499 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !500, file: !438, line: 191)
!500 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !501, line: 32, baseType: !494)
!501 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_intmax_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e37b9240f30f486478152ef3989b1545")
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !503, file: !438, line: 192)
!503 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !504, line: 32, baseType: !498)
!504 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uintmax_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8217a3fbb207d8e87ca5318c313e81c2")
!505 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !506, file: !509, line: 22)
!506 = !DIDerivedType(tag: DW_TAG_typedef, name: "max_align_t", file: !507, line: 16, baseType: !508)
!507 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/lib/clang/20/include/__stddef_max_align_t.h", directory: "", checksumkind: CSK_MD5, checksum: "3c0a2f19d136d39aa835c737c7105def")
!508 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
!509 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__cstddef/max_align_t.h", directory: "")
!510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !511, file: !515, line: 113)
!511 = !DISubprogram(name: "isalnum", linkageName: "_Z7isalnumi", scope: !512, file: !512, line: 217, type: !513, flags: DIFlagPrototyped, spFlags: 0)
!512 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_ctype.h", directory: "", checksumkind: CSK_MD5, checksum: "b10215117a277691ffc4168ac4505796")
!513 = !DISubroutineType(types: !514)
!514 = !{!7, !7}
!515 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cctype", directory: "")
!516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !517, file: !515, line: 114)
!517 = !DISubprogram(name: "isalpha", linkageName: "_Z7isalphai", scope: !512, file: !512, line: 223, type: !513, flags: DIFlagPrototyped, spFlags: 0)
!518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !519, file: !515, line: 115)
!519 = !DISubprogram(name: "isblank", linkageName: "_Z7isblanki", scope: !512, file: !512, line: 229, type: !513, flags: DIFlagPrototyped, spFlags: 0)
!520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !521, file: !515, line: 116)
!521 = !DISubprogram(name: "iscntrl", linkageName: "_Z7iscntrli", scope: !512, file: !512, line: 235, type: !513, flags: DIFlagPrototyped, spFlags: 0)
!522 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !523, file: !515, line: 117)
!523 = !DISubprogram(name: "isdigit", linkageName: "_Z7isdigiti", scope: !512, file: !512, line: 242, type: !513, flags: DIFlagPrototyped, spFlags: 0)
!524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !525, file: !515, line: 118)
!525 = !DISubprogram(name: "isgraph", linkageName: "_Z7isgraphi", scope: !512, file: !512, line: 248, type: !513, flags: DIFlagPrototyped, spFlags: 0)
!526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !527, file: !515, line: 119)
!527 = !DISubprogram(name: "islower", linkageName: "_Z7isloweri", scope: !512, file: !512, line: 254, type: !513, flags: DIFlagPrototyped, spFlags: 0)
!528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !529, file: !515, line: 120)
!529 = !DISubprogram(name: "isprint", linkageName: "_Z7isprinti", scope: !512, file: !512, line: 260, type: !513, flags: DIFlagPrototyped, spFlags: 0)
!530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !531, file: !515, line: 121)
!531 = !DISubprogram(name: "ispunct", linkageName: "_Z7ispuncti", scope: !512, file: !512, line: 266, type: !513, flags: DIFlagPrototyped, spFlags: 0)
!532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !533, file: !515, line: 122)
!533 = !DISubprogram(name: "isspace", linkageName: "_Z7isspacei", scope: !512, file: !512, line: 272, type: !513, flags: DIFlagPrototyped, spFlags: 0)
!534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !535, file: !515, line: 123)
!535 = !DISubprogram(name: "isupper", linkageName: "_Z7isupperi", scope: !512, file: !512, line: 278, type: !513, flags: DIFlagPrototyped, spFlags: 0)
!536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !537, file: !515, line: 124)
!537 = !DISubprogram(name: "isxdigit", linkageName: "_Z8isxdigiti", scope: !512, file: !512, line: 285, type: !513, flags: DIFlagPrototyped, spFlags: 0)
!538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !539, file: !515, line: 125)
!539 = !DISubprogram(name: "tolower", linkageName: "_Z7toloweri", scope: !512, file: !512, line: 297, type: !513, flags: DIFlagPrototyped, spFlags: 0)
!540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !541, file: !515, line: 126)
!541 = !DISubprogram(name: "toupper", linkageName: "_Z7toupperi", scope: !512, file: !512, line: 303, type: !513, flags: DIFlagPrototyped, spFlags: 0)
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !543, file: !546, line: 75)
!543 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !544, line: 32, baseType: !545)
!544 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_wint_t.h", directory: "", checksumkind: CSK_MD5, checksum: "6dfd3a3d5009054224653c03b2c2b6ac")
!545 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wint_t", file: !389, line: 111, baseType: !7)
!546 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cwctype", directory: "")
!547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !548, file: !546, line: 76)
!548 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !549, line: 32, baseType: !550)
!549 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_wctrans_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e70040c8494301cc74e19df26f4c1d76")
!550 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wctrans_t", file: !551, line: 44, baseType: !7)
!551 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "c789da493a5b476a3618b20a8fcff3c3")
!552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !553, file: !546, line: 77)
!553 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !554, line: 32, baseType: !555)
!554 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_wctype_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8d1720b82a490c742e6a297f971be2a2")
!555 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wctype_t", file: !551, line: 46, baseType: !556)
!556 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !389, line: 36, baseType: !452)
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !558, file: !546, line: 78)
!558 = !DISubprogram(name: "iswalnum", linkageName: "_Z8iswalnumi", scope: !559, file: !559, line: 84, type: !560, flags: DIFlagPrototyped, spFlags: 0)
!559 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/___wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "d5a8bf0b4062c20bda4d49376e5b44d9")
!560 = !DISubroutineType(types: !561)
!561 = !{!7, !543}
!562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !563, file: !546, line: 79)
!563 = !DISubprogram(name: "iswalpha", linkageName: "_Z8iswalphai", scope: !559, file: !559, line: 90, type: !560, flags: DIFlagPrototyped, spFlags: 0)
!564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !565, file: !546, line: 80)
!565 = !DISubprogram(name: "iswblank", linkageName: "_Z8iswblanki", scope: !566, file: !566, line: 53, type: !560, flags: DIFlagPrototyped, spFlags: 0)
!566 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "6bc93063cb32b00d3df790305c546a93")
!567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !568, file: !546, line: 81)
!568 = !DISubprogram(name: "iswcntrl", linkageName: "_Z8iswcntrli", scope: !559, file: !559, line: 96, type: !560, flags: DIFlagPrototyped, spFlags: 0)
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !570, file: !546, line: 82)
!570 = !DISubprogram(name: "iswdigit", linkageName: "_Z8iswdigiti", scope: !559, file: !559, line: 108, type: !560, flags: DIFlagPrototyped, spFlags: 0)
!571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !572, file: !546, line: 83)
!572 = !DISubprogram(name: "iswgraph", linkageName: "_Z8iswgraphi", scope: !559, file: !559, line: 114, type: !560, flags: DIFlagPrototyped, spFlags: 0)
!573 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !574, file: !546, line: 84)
!574 = !DISubprogram(name: "iswlower", linkageName: "_Z8iswloweri", scope: !559, file: !559, line: 120, type: !560, flags: DIFlagPrototyped, spFlags: 0)
!575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !576, file: !546, line: 85)
!576 = !DISubprogram(name: "iswprint", linkageName: "_Z8iswprinti", scope: !559, file: !559, line: 126, type: !560, flags: DIFlagPrototyped, spFlags: 0)
!577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !578, file: !546, line: 86)
!578 = !DISubprogram(name: "iswpunct", linkageName: "_Z8iswpuncti", scope: !559, file: !559, line: 132, type: !560, flags: DIFlagPrototyped, spFlags: 0)
!579 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !580, file: !546, line: 87)
!580 = !DISubprogram(name: "iswspace", linkageName: "_Z8iswspacei", scope: !559, file: !559, line: 138, type: !560, flags: DIFlagPrototyped, spFlags: 0)
!581 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !582, file: !546, line: 88)
!582 = !DISubprogram(name: "iswupper", linkageName: "_Z8iswupperi", scope: !559, file: !559, line: 144, type: !560, flags: DIFlagPrototyped, spFlags: 0)
!583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !584, file: !546, line: 89)
!584 = !DISubprogram(name: "iswxdigit", linkageName: "_Z9iswxdigiti", scope: !559, file: !559, line: 150, type: !560, flags: DIFlagPrototyped, spFlags: 0)
!585 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !586, file: !546, line: 90)
!586 = !DISubprogram(name: "iswctype", linkageName: "_Z8iswctypeij", scope: !559, file: !559, line: 102, type: !587, flags: DIFlagPrototyped, spFlags: 0)
!587 = !DISubroutineType(types: !588)
!588 = !{!7, !543, !553}
!589 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !590, file: !546, line: 91)
!590 = !DISubprogram(name: "wctype", scope: !559, file: !559, line: 190, type: !591, flags: DIFlagPrototyped, spFlags: 0)
!591 = !DISubroutineType(types: !592)
!592 = !{!553, !255}
!593 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !594, file: !546, line: 92)
!594 = !DISubprogram(name: "towlower", linkageName: "_Z8towloweri", scope: !559, file: !559, line: 156, type: !595, flags: DIFlagPrototyped, spFlags: 0)
!595 = !DISubroutineType(types: !596)
!596 = !{!543, !543}
!597 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !598, file: !546, line: 93)
!598 = !DISubprogram(name: "towupper", linkageName: "_Z8towupperi", scope: !559, file: !559, line: 162, type: !595, flags: DIFlagPrototyped, spFlags: 0)
!599 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !600, file: !546, line: 94)
!600 = !DISubprogram(name: "towctrans", scope: !566, file: !566, line: 124, type: !601, flags: DIFlagPrototyped, spFlags: 0)
!601 = !DISubroutineType(types: !602)
!602 = !{!543, !543, !548}
!603 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !604, file: !546, line: 95)
!604 = !DISubprogram(name: "wctrans", scope: !566, file: !566, line: 126, type: !605, flags: DIFlagPrototyped, spFlags: 0)
!605 = !DISubroutineType(types: !606)
!606 = !{!548, !255}
!607 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !608, file: !616, line: 133)
!608 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !609, line: 32, baseType: !610)
!609 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8f920c8f4b68eb07504db5a6777c5466")
!610 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_mbstate_t", file: !389, line: 72, baseType: !611)
!611 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !389, line: 70, baseType: !612)
!612 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !389, line: 67, size: 1024, flags: DIFlagTypePassByValue, elements: !613, identifier: "_ZTS11__mbstate_t")
!613 = !{!614, !615}
!614 = !DIDerivedType(tag: DW_TAG_member, name: "__mbstate8", scope: !612, file: !389, line: 68, baseType: !412, size: 1024)
!615 = !DIDerivedType(tag: DW_TAG_member, name: "_mbstateL", scope: !612, file: !389, line: 69, baseType: !16, size: 64)
!616 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cwchar", directory: "")
!617 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !618, file: !616, line: 134)
!618 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !619, line: 78, size: 448, flags: DIFlagTypePassByValue, elements: !620, identifier: "_ZTS2tm")
!619 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_time.h", directory: "", checksumkind: CSK_MD5, checksum: "e65eafd533c28a52a9094e430476b03e")
!620 = !{!621, !622, !623, !624, !625, !626, !627, !628, !629, !630, !631}
!621 = !DIDerivedType(tag: DW_TAG_member, name: "tm_sec", scope: !618, file: !619, line: 79, baseType: !7, size: 32)
!622 = !DIDerivedType(tag: DW_TAG_member, name: "tm_min", scope: !618, file: !619, line: 80, baseType: !7, size: 32, offset: 32)
!623 = !DIDerivedType(tag: DW_TAG_member, name: "tm_hour", scope: !618, file: !619, line: 81, baseType: !7, size: 32, offset: 64)
!624 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mday", scope: !618, file: !619, line: 82, baseType: !7, size: 32, offset: 96)
!625 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mon", scope: !618, file: !619, line: 83, baseType: !7, size: 32, offset: 128)
!626 = !DIDerivedType(tag: DW_TAG_member, name: "tm_year", scope: !618, file: !619, line: 84, baseType: !7, size: 32, offset: 160)
!627 = !DIDerivedType(tag: DW_TAG_member, name: "tm_wday", scope: !618, file: !619, line: 85, baseType: !7, size: 32, offset: 192)
!628 = !DIDerivedType(tag: DW_TAG_member, name: "tm_yday", scope: !618, file: !619, line: 86, baseType: !7, size: 32, offset: 224)
!629 = !DIDerivedType(tag: DW_TAG_member, name: "tm_isdst", scope: !618, file: !619, line: 87, baseType: !7, size: 32, offset: 256)
!630 = !DIDerivedType(tag: DW_TAG_member, name: "tm_gmtoff", scope: !618, file: !619, line: 88, baseType: !494, size: 64, offset: 320)
!631 = !DIDerivedType(tag: DW_TAG_member, name: "tm_zone", scope: !618, file: !619, line: 89, baseType: !380, size: 64, offset: 384)
!632 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !543, file: !616, line: 135)
!633 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !354, file: !616, line: 136)
!634 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !635, file: !616, line: 137)
!635 = !DISubprogram(name: "fwprintf", scope: !636, file: !636, line: 107, type: !637, flags: DIFlagPrototyped, spFlags: 0)
!636 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "c0db33314388059ce7a1663adf1bfda0")
!637 = !DISubroutineType(types: !638)
!638 = !{!7, !353, !639, null}
!639 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !640, size: 64)
!640 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !641)
!641 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!642 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !643, file: !616, line: 138)
!643 = !DISubprogram(name: "fwscanf", scope: !636, file: !636, line: 108, type: !637, flags: DIFlagPrototyped, spFlags: 0)
!644 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !645, file: !616, line: 139)
!645 = !DISubprogram(name: "swprintf", scope: !636, file: !636, line: 120, type: !646, flags: DIFlagPrototyped, spFlags: 0)
!646 = !DISubroutineType(types: !647)
!647 = !{!7, !648, !649, !639, null}
!648 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !641, size: 64)
!649 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !650, line: 50, baseType: !651)
!650 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "f7981334d28e0c246f35cd24042aa2a4")
!651 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !389, line: 87, baseType: !498)
!652 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !653, file: !616, line: 140)
!653 = !DISubprogram(name: "vfwprintf", scope: !636, file: !636, line: 124, type: !654, flags: DIFlagPrototyped, spFlags: 0)
!654 = !DISubroutineType(types: !655)
!655 = !{!7, !353, !639, !656}
!656 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_va_list", file: !389, line: 95, baseType: !657)
!657 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !20, baseType: !380)
!658 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !659, file: !616, line: 141)
!659 = !DISubprogram(name: "vswprintf", scope: !636, file: !636, line: 126, type: !660, flags: DIFlagPrototyped, spFlags: 0)
!660 = !DISubroutineType(types: !661)
!661 = !{!7, !648, !649, !639, !656}
!662 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !663, file: !616, line: 142)
!663 = !DISubprogram(name: "swscanf", scope: !636, file: !636, line: 122, type: !664, flags: DIFlagPrototyped, spFlags: 0)
!664 = !DISubroutineType(types: !665)
!665 = !{!7, !639, !639, null}
!666 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !667, file: !616, line: 143)
!667 = !DISubprogram(name: "vfwscanf", scope: !636, file: !636, line: 195, type: !654, flags: DIFlagPrototyped, spFlags: 0)
!668 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !669, file: !616, line: 144)
!669 = !DISubprogram(name: "vswscanf", scope: !636, file: !636, line: 197, type: !670, flags: DIFlagPrototyped, spFlags: 0)
!670 = !DISubroutineType(types: !671)
!671 = !{!7, !639, !639, !656}
!672 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !673, file: !616, line: 145)
!673 = !DISubprogram(name: "fgetwc", scope: !636, file: !636, line: 100, type: !674, flags: DIFlagPrototyped, spFlags: 0)
!674 = !DISubroutineType(types: !675)
!675 = !{!543, !353}
!676 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !677, file: !616, line: 146)
!677 = !DISubprogram(name: "fgetws", scope: !636, file: !636, line: 102, type: !678, flags: DIFlagPrototyped, spFlags: 0)
!678 = !DISubroutineType(types: !679)
!679 = !{!648, !648, !7, !353}
!680 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !681, file: !616, line: 147)
!681 = !DISubprogram(name: "fputwc", scope: !636, file: !636, line: 104, type: !682, flags: DIFlagPrototyped, spFlags: 0)
!682 = !DISubroutineType(types: !683)
!683 = !{!543, !641, !353}
!684 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !685, file: !616, line: 148)
!685 = !DISubprogram(name: "fputws", scope: !636, file: !636, line: 105, type: !686, flags: DIFlagPrototyped, spFlags: 0)
!686 = !DISubroutineType(types: !687)
!687 = !{!7, !639, !353}
!688 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !689, file: !616, line: 149)
!689 = !DISubprogram(name: "fwide", scope: !636, file: !636, line: 106, type: !690, flags: DIFlagPrototyped, spFlags: 0)
!690 = !DISubroutineType(types: !691)
!691 = !{!7, !353, !7}
!692 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !693, file: !616, line: 150)
!693 = !DISubprogram(name: "getwc", scope: !636, file: !636, line: 109, type: !674, flags: DIFlagPrototyped, spFlags: 0)
!694 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !695, file: !616, line: 151)
!695 = !DISubprogram(name: "putwc", scope: !636, file: !636, line: 118, type: !682, flags: DIFlagPrototyped, spFlags: 0)
!696 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !697, file: !616, line: 152)
!697 = !DISubprogram(name: "ungetwc", scope: !636, file: !636, line: 123, type: !698, flags: DIFlagPrototyped, spFlags: 0)
!698 = !DISubroutineType(types: !699)
!699 = !{!543, !543, !353}
!700 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !701, file: !616, line: 153)
!701 = !DISubprogram(name: "wcstod", scope: !636, file: !636, line: 160, type: !702, flags: DIFlagPrototyped, spFlags: 0)
!702 = !DISubroutineType(types: !703)
!703 = !{!704, !639, !705}
!704 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!705 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !648, size: 64)
!706 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !707, file: !616, line: 154)
!707 = !DISubprogram(name: "wcstof", scope: !636, file: !636, line: 200, type: !708, flags: DIFlagPrototyped, spFlags: 0)
!708 = !DISubroutineType(types: !709)
!709 = !{!710, !639, !705}
!710 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!711 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !712, file: !616, line: 155)
!712 = !DISubprogram(name: "wcstold", scope: !636, file: !636, line: 202, type: !713, flags: DIFlagPrototyped, spFlags: 0)
!713 = !DISubroutineType(types: !714)
!714 = !{!508, !639, !705}
!715 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !716, file: !616, line: 156)
!716 = !DISubprogram(name: "wcstol", scope: !636, file: !636, line: 164, type: !717, flags: DIFlagPrototyped, spFlags: 0)
!717 = !DISubroutineType(types: !718)
!718 = !{!494, !639, !705, !7}
!719 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !720, file: !616, line: 157)
!720 = !DISubprogram(name: "wcstoll", scope: !636, file: !636, line: 205, type: !721, flags: DIFlagPrototyped, spFlags: 0)
!721 = !DISubroutineType(types: !722)
!722 = !{!16, !639, !705, !7}
!723 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !724, file: !616, line: 158)
!724 = !DISubprogram(name: "wcstoul", scope: !636, file: !636, line: 167, type: !725, flags: DIFlagPrototyped, spFlags: 0)
!725 = !DISubroutineType(types: !726)
!726 = !{!498, !639, !705, !7}
!727 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !728, file: !616, line: 159)
!728 = !DISubprogram(name: "wcstoull", scope: !636, file: !636, line: 207, type: !729, flags: DIFlagPrototyped, spFlags: 0)
!729 = !DISubroutineType(types: !730)
!730 = !{!456, !639, !705, !7}
!731 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !732, file: !616, line: 160)
!732 = !DISubprogram(name: "wcscpy", scope: !636, file: !636, line: 134, type: !733, flags: DIFlagPrototyped, spFlags: 0)
!733 = !DISubroutineType(types: !734)
!734 = !{!648, !648, !639}
!735 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !736, file: !616, line: 161)
!736 = !DISubprogram(name: "wcsncpy", scope: !636, file: !636, line: 148, type: !737, flags: DIFlagPrototyped, spFlags: 0)
!737 = !DISubroutineType(types: !738)
!738 = !{!648, !648, !639, !649}
!739 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !740, file: !616, line: 162)
!740 = !DISubprogram(name: "wcscat", scope: !636, file: !636, line: 130, type: !733, flags: DIFlagPrototyped, spFlags: 0)
!741 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !742, file: !616, line: 163)
!742 = !DISubprogram(name: "wcsncat", scope: !636, file: !636, line: 142, type: !737, flags: DIFlagPrototyped, spFlags: 0)
!743 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !744, file: !616, line: 164)
!744 = !DISubprogram(name: "wcscmp", scope: !636, file: !636, line: 132, type: !745, flags: DIFlagPrototyped, spFlags: 0)
!745 = !DISubroutineType(types: !746)
!746 = !{!7, !639, !639}
!747 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !748, file: !616, line: 165)
!748 = !DISubprogram(name: "wcscoll", scope: !636, file: !636, line: 133, type: !745, flags: DIFlagPrototyped, spFlags: 0)
!749 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !750, file: !616, line: 166)
!750 = !DISubprogram(name: "wcsncmp", scope: !636, file: !636, line: 145, type: !751, flags: DIFlagPrototyped, spFlags: 0)
!751 = !DISubroutineType(types: !752)
!752 = !{!7, !639, !639, !649}
!753 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !754, file: !616, line: 167)
!754 = !DISubprogram(name: "wcsxfrm", scope: !636, file: !636, line: 157, type: !755, flags: DIFlagPrototyped, spFlags: 0)
!755 = !DISubroutineType(types: !756)
!756 = !{!649, !648, !639, !649}
!757 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !758, file: !616, line: 168)
!758 = !DISubprogram(name: "wcschr", linkageName: "_Z6wcschrB8ne200100Ua9enable_ifILb1EEPww", scope: !759, file: !759, line: 147, type: !760, flags: DIFlagPrototyped, spFlags: 0)
!759 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/wchar.h", directory: "")
!760 = !DISubroutineType(types: !761)
!761 = !{!648, !648, !641}
!762 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !763, file: !616, line: 169)
!763 = !DISubprogram(name: "wcspbrk", linkageName: "_Z7wcspbrkB8ne200100Ua9enable_ifILb1EEPwPKw", scope: !759, file: !759, line: 158, type: !733, flags: DIFlagPrototyped, spFlags: 0)
!764 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !765, file: !616, line: 170)
!765 = !DISubprogram(name: "wcsrchr", linkageName: "_Z7wcsrchrB8ne200100Ua9enable_ifILb1EEPww", scope: !759, file: !759, line: 168, type: !760, flags: DIFlagPrototyped, spFlags: 0)
!766 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !767, file: !616, line: 171)
!767 = !DISubprogram(name: "wcsstr", linkageName: "_Z6wcsstrB8ne200100Ua9enable_ifILb1EEPwPKw", scope: !759, file: !759, line: 179, type: !733, flags: DIFlagPrototyped, spFlags: 0)
!768 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !769, file: !616, line: 172)
!769 = !DISubprogram(name: "wmemchr", linkageName: "_Z7wmemchrB8ne200100Ua9enable_ifILb1EEPwwm", scope: !759, file: !759, line: 190, type: !770, flags: DIFlagPrototyped, spFlags: 0)
!770 = !DISubroutineType(types: !771)
!771 = !{!648, !648, !641, !649}
!772 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !773, file: !616, line: 173)
!773 = !DISubprogram(name: "wcscspn", scope: !636, file: !636, line: 136, type: !774, flags: DIFlagPrototyped, spFlags: 0)
!774 = !DISubroutineType(types: !775)
!775 = !{!649, !639, !639}
!776 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !777, file: !616, line: 174)
!777 = !DISubprogram(name: "wcslen", scope: !636, file: !636, line: 140, type: !778, flags: DIFlagPrototyped, spFlags: 0)
!778 = !DISubroutineType(types: !779)
!779 = !{!649, !639}
!780 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !781, file: !616, line: 175)
!781 = !DISubprogram(name: "wcsspn", scope: !636, file: !636, line: 155, type: !774, flags: DIFlagPrototyped, spFlags: 0)
!782 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !783, file: !616, line: 176)
!783 = !DISubprogram(name: "wcstok", scope: !636, file: !636, line: 162, type: !784, flags: DIFlagPrototyped, spFlags: 0)
!784 = !DISubroutineType(types: !785)
!785 = !{!648, !648, !639, !705}
!786 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !787, file: !616, line: 177)
!787 = !DISubprogram(name: "wmemcmp", scope: !636, file: !636, line: 170, type: !751, flags: DIFlagPrototyped, spFlags: 0)
!788 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !789, file: !616, line: 178)
!789 = !DISubprogram(name: "wmemcpy", scope: !636, file: !636, line: 173, type: !737, flags: DIFlagPrototyped, spFlags: 0)
!790 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !791, file: !616, line: 179)
!791 = !DISubprogram(name: "wmemmove", scope: !636, file: !636, line: 176, type: !737, flags: DIFlagPrototyped, spFlags: 0)
!792 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !793, file: !616, line: 180)
!793 = !DISubprogram(name: "wmemset", scope: !636, file: !636, line: 179, type: !770, flags: DIFlagPrototyped, spFlags: 0)
!794 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !795, file: !616, line: 181)
!795 = !DISubprogram(name: "wcsftime", linkageName: "\01_wcsftime", scope: !636, file: !636, line: 137, type: !796, flags: DIFlagPrototyped, spFlags: 0)
!796 = !DISubroutineType(types: !797)
!797 = !{!649, !648, !649, !639, !798}
!798 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !799, size: 64)
!799 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !618)
!800 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !801, file: !616, line: 182)
!801 = !DISubprogram(name: "btowc", scope: !636, file: !636, line: 99, type: !802, flags: DIFlagPrototyped, spFlags: 0)
!802 = !DISubroutineType(types: !803)
!803 = !{!543, !7}
!804 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !805, file: !616, line: 183)
!805 = !DISubprogram(name: "wctob", scope: !636, file: !636, line: 159, type: !560, flags: DIFlagPrototyped, spFlags: 0)
!806 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !807, file: !616, line: 184)
!807 = !DISubprogram(name: "mbsinit", scope: !636, file: !636, line: 115, type: !808, flags: DIFlagPrototyped, spFlags: 0)
!808 = !DISubroutineType(types: !809)
!809 = !{!7, !810}
!810 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !811, size: 64)
!811 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !608)
!812 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !813, file: !616, line: 185)
!813 = !DISubprogram(name: "mbrlen", scope: !636, file: !636, line: 111, type: !814, flags: DIFlagPrototyped, spFlags: 0)
!814 = !DISubroutineType(types: !815)
!815 = !{!649, !255, !649, !816}
!816 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !608, size: 64)
!817 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !818, file: !616, line: 186)
!818 = !DISubprogram(name: "mbrtowc", scope: !636, file: !636, line: 113, type: !819, flags: DIFlagPrototyped, spFlags: 0)
!819 = !DISubroutineType(types: !820)
!820 = !{!649, !648, !255, !649, !816}
!821 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !822, file: !616, line: 187)
!822 = !DISubprogram(name: "wcrtomb", scope: !636, file: !636, line: 129, type: !823, flags: DIFlagPrototyped, spFlags: 0)
!823 = !DISubroutineType(types: !824)
!824 = !{!649, !380, !641, !816}
!825 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !826, file: !616, line: 188)
!826 = !DISubprogram(name: "mbsrtowcs", scope: !636, file: !636, line: 116, type: !827, flags: DIFlagPrototyped, spFlags: 0)
!827 = !DISubroutineType(types: !828)
!828 = !{!649, !648, !829, !649, !816}
!829 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !255, size: 64)
!830 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !831, file: !616, line: 189)
!831 = !DISubprogram(name: "wcsrtombs", scope: !636, file: !636, line: 153, type: !832, flags: DIFlagPrototyped, spFlags: 0)
!832 = !DISubroutineType(types: !833)
!833 = !{!649, !380, !834, !649, !816}
!834 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !639, size: 64)
!835 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !836, file: !616, line: 191)
!836 = !DISubprogram(name: "getwchar", scope: !636, file: !636, line: 110, type: !837, flags: DIFlagPrototyped, spFlags: 0)
!837 = !DISubroutineType(types: !838)
!838 = !{!543}
!839 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !840, file: !616, line: 192)
!840 = !DISubprogram(name: "vwscanf", scope: !636, file: !636, line: 199, type: !841, flags: DIFlagPrototyped, spFlags: 0)
!841 = !DISubroutineType(types: !842)
!842 = !{!7, !639, !656}
!843 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !844, file: !616, line: 193)
!844 = !DISubprogram(name: "wscanf", scope: !636, file: !636, line: 181, type: !845, flags: DIFlagPrototyped, spFlags: 0)
!845 = !DISubroutineType(types: !846)
!846 = !{!7, !639, null}
!847 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !848, file: !616, line: 195)
!848 = !DISubprogram(name: "putwchar", scope: !636, file: !636, line: 119, type: !849, flags: DIFlagPrototyped, spFlags: 0)
!849 = !DISubroutineType(types: !850)
!850 = !{!543, !641}
!851 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !852, file: !616, line: 196)
!852 = !DISubprogram(name: "vwprintf", scope: !636, file: !636, line: 128, type: !841, flags: DIFlagPrototyped, spFlags: 0)
!853 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !854, file: !616, line: 197)
!854 = !DISubprogram(name: "wprintf", scope: !636, file: !636, line: 180, type: !845, flags: DIFlagPrototyped, spFlags: 0)
!855 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !856, file: !862, line: 106)
!856 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !857, line: 105, baseType: !858)
!857 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "17a3e5580239ce2f2af260c9c943ad9b")
!858 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !857, line: 102, size: 64, flags: DIFlagTypePassByValue, elements: !859, identifier: "_ZTS5div_t")
!859 = !{!860, !861}
!860 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !858, file: !857, line: 103, baseType: !7, size: 32)
!861 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !858, file: !857, line: 104, baseType: !7, size: 32, offset: 32)
!862 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdlib", directory: "")
!863 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !864, file: !862, line: 107)
!864 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !857, line: 110, baseType: !865)
!865 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !857, line: 107, size: 128, flags: DIFlagTypePassByValue, elements: !866, identifier: "_ZTS6ldiv_t")
!866 = !{!867, !868}
!867 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !865, file: !857, line: 108, baseType: !494, size: 64)
!868 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !865, file: !857, line: 109, baseType: !494, size: 64, offset: 64)
!869 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !870, file: !862, line: 108)
!870 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !857, line: 116, baseType: !871)
!871 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !857, line: 113, size: 128, flags: DIFlagTypePassByValue, elements: !872, identifier: "_ZTS7lldiv_t")
!872 = !{!873, !874}
!873 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !871, file: !857, line: 114, baseType: !16, size: 64)
!874 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !871, file: !857, line: 115, baseType: !16, size: 64, offset: 64)
!875 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !876, file: !862, line: 109)
!876 = !DISubprogram(name: "atof", scope: !857, file: !857, line: 149, type: !877, flags: DIFlagPrototyped, spFlags: 0)
!877 = !DISubroutineType(types: !878)
!878 = !{!704, !255}
!879 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !880, file: !862, line: 110)
!880 = !DISubprogram(name: "atoi", scope: !857, file: !857, line: 150, type: !881, flags: DIFlagPrototyped, spFlags: 0)
!881 = !DISubroutineType(types: !882)
!882 = !{!7, !255}
!883 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !884, file: !862, line: 111)
!884 = !DISubprogram(name: "atol", scope: !857, file: !857, line: 151, type: !885, flags: DIFlagPrototyped, spFlags: 0)
!885 = !DISubroutineType(types: !886)
!886 = !{!494, !255}
!887 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !888, file: !862, line: 112)
!888 = !DISubprogram(name: "atoll", scope: !857, file: !857, line: 154, type: !889, flags: DIFlagPrototyped, spFlags: 0)
!889 = !DISubroutineType(types: !890)
!890 = !{!16, !255}
!891 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !892, file: !862, line: 113)
!892 = !DISubprogram(name: "strtod", linkageName: "\01_strtod", scope: !857, file: !857, line: 184, type: !893, flags: DIFlagPrototyped, spFlags: 0)
!893 = !DISubroutineType(types: !894)
!894 = !{!704, !255, !895}
!895 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !380, size: 64)
!896 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !897, file: !862, line: 114)
!897 = !DISubprogram(name: "strtof", linkageName: "\01_strtof", scope: !857, file: !857, line: 185, type: !898, flags: DIFlagPrototyped, spFlags: 0)
!898 = !DISubroutineType(types: !899)
!899 = !{!710, !255, !895}
!900 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !901, file: !862, line: 115)
!901 = !DISubprogram(name: "strtold", scope: !857, file: !857, line: 188, type: !902, flags: DIFlagPrototyped, spFlags: 0)
!902 = !DISubroutineType(types: !903)
!903 = !{!508, !255, !895}
!904 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !905, file: !862, line: 116)
!905 = !DISubprogram(name: "strtol", scope: !857, file: !857, line: 186, type: !906, flags: DIFlagPrototyped, spFlags: 0)
!906 = !DISubroutineType(types: !907)
!907 = !{!494, !255, !895, !7}
!908 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !909, file: !862, line: 117)
!909 = !DISubprogram(name: "strtoll", scope: !857, file: !857, line: 191, type: !910, flags: DIFlagPrototyped, spFlags: 0)
!910 = !DISubroutineType(types: !911)
!911 = !{!16, !255, !895, !7}
!912 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !913, file: !862, line: 118)
!913 = !DISubprogram(name: "strtoul", scope: !857, file: !857, line: 194, type: !914, flags: DIFlagPrototyped, spFlags: 0)
!914 = !DISubroutineType(types: !915)
!915 = !{!498, !255, !895, !7}
!916 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !917, file: !862, line: 119)
!917 = !DISubprogram(name: "strtoull", scope: !857, file: !857, line: 197, type: !918, flags: DIFlagPrototyped, spFlags: 0)
!918 = !DISubroutineType(types: !919)
!919 = !{!456, !255, !895, !7}
!920 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !921, file: !862, line: 120)
!921 = !DISubprogram(name: "rand", scope: !857, file: !857, line: 181, type: !922, flags: DIFlagPrototyped, spFlags: 0)
!922 = !DISubroutineType(types: !923)
!923 = !{!7}
!924 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !925, file: !862, line: 121)
!925 = !DISubprogram(name: "srand", scope: !857, file: !857, line: 183, type: !926, flags: DIFlagPrototyped, spFlags: 0)
!926 = !DISubroutineType(types: !927)
!927 = !{null, !452}
!928 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !929, file: !862, line: 122)
!929 = !DISubprogram(name: "calloc", scope: !930, file: !930, line: 55, type: !931, flags: DIFlagPrototyped, spFlags: 0)
!930 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/malloc/_malloc.h", directory: "", checksumkind: CSK_MD5, checksum: "169c9ed8662627a4a4d92e321cfa866c")
!931 = !DISubroutineType(types: !932)
!932 = !{!371, !649, !649}
!933 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !934, file: !862, line: 123)
!934 = !DISubprogram(name: "free", scope: !930, file: !930, line: 56, type: !935, flags: DIFlagPrototyped, spFlags: 0)
!935 = !DISubroutineType(types: !936)
!936 = !{null, !371}
!937 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !938, file: !862, line: 124)
!938 = !DISubprogram(name: "malloc", scope: !930, file: !930, line: 54, type: !939, flags: DIFlagPrototyped, spFlags: 0)
!939 = !DISubroutineType(types: !940)
!940 = !{!371, !649}
!941 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !942, file: !862, line: 125)
!942 = !DISubprogram(name: "realloc", scope: !930, file: !930, line: 57, type: !943, flags: DIFlagPrototyped, spFlags: 0)
!943 = !DISubroutineType(types: !944)
!944 = !{!371, !371, !649}
!945 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !946, file: !862, line: 126)
!946 = !DISubprogram(name: "abort", scope: !947, file: !947, line: 33, type: !948, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!947 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_abort.h", directory: "", checksumkind: CSK_MD5, checksum: "b8994a53d49770cf67adab87821b3fcb")
!948 = !DISubroutineType(types: !949)
!949 = !{null}
!950 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !951, file: !862, line: 127)
!951 = !DISubprogram(name: "atexit", scope: !857, file: !857, line: 144, type: !952, flags: DIFlagPrototyped, spFlags: 0)
!952 = !DISubroutineType(types: !953)
!953 = !{!7, !954}
!954 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !948, size: 64)
!955 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !956, file: !862, line: 128)
!956 = !DISubprogram(name: "exit", scope: !857, file: !857, line: 160, type: !957, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!957 = !DISubroutineType(types: !958)
!958 = !{null, !7}
!959 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !960, file: !862, line: 129)
!960 = !DISubprogram(name: "_Exit", scope: !857, file: !857, line: 210, type: !957, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!961 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !962, file: !862, line: 130)
!962 = !DISubprogram(name: "getenv", scope: !857, file: !857, line: 162, type: !963, flags: DIFlagPrototyped, spFlags: 0)
!963 = !DISubroutineType(types: !964)
!964 = !{!380, !255}
!965 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !966, file: !862, line: 131)
!966 = !DISubprogram(name: "system", linkageName: "\01_system", scope: !857, file: !857, line: 203, type: !881, flags: DIFlagPrototyped, spFlags: 0)
!967 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !968, file: !862, line: 132)
!968 = !DISubprogram(name: "bsearch", scope: !857, file: !857, line: 156, type: !969, flags: DIFlagPrototyped, spFlags: 0)
!969 = !DISubroutineType(types: !970)
!970 = !{!371, !971, !971, !649, !649, !973}
!971 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !972, size: 64)
!972 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!973 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !974, size: 64)
!974 = !DISubroutineType(types: !975)
!975 = !{!7, !971, !971}
!976 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !977, file: !862, line: 133)
!977 = !DISubprogram(name: "qsort", scope: !857, file: !857, line: 175, type: !978, flags: DIFlagPrototyped, spFlags: 0)
!978 = !DISubroutineType(types: !979)
!979 = !{null, !371, !649, !649, !973}
!980 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !981, file: !862, line: 134)
!981 = !DISubprogram(name: "abs", linkageName: "_Z3absB8ne200100e", scope: !982, file: !982, line: 123, type: !983, flags: DIFlagPrototyped, spFlags: 0)
!982 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/stdlib.h", directory: "")
!983 = !DISubroutineType(types: !984)
!984 = !{!508, !508}
!985 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !986, file: !862, line: 135)
!986 = !DISubprogram(name: "labs", scope: !857, file: !857, line: 163, type: !987, flags: DIFlagPrototyped, spFlags: 0)
!987 = !DISubroutineType(types: !988)
!988 = !{!494, !494}
!989 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !990, file: !862, line: 136)
!990 = !DISubprogram(name: "llabs", scope: !857, file: !857, line: 167, type: !991, flags: DIFlagPrototyped, spFlags: 0)
!991 = !DISubroutineType(types: !992)
!992 = !{!16, !16}
!993 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !994, file: !862, line: 137)
!994 = !DISubprogram(name: "div", linkageName: "_Z3divB8ne200100xx", scope: !982, file: !982, line: 143, type: !995, flags: DIFlagPrototyped, spFlags: 0)
!995 = !DISubroutineType(types: !996)
!996 = !{!870, !16, !16}
!997 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !998, file: !862, line: 138)
!998 = !DISubprogram(name: "ldiv", scope: !857, file: !857, line: 164, type: !999, flags: DIFlagPrototyped, spFlags: 0)
!999 = !DISubroutineType(types: !1000)
!1000 = !{!864, !494, !494}
!1001 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1002, file: !862, line: 139)
!1002 = !DISubprogram(name: "lldiv", scope: !857, file: !857, line: 168, type: !995, flags: DIFlagPrototyped, spFlags: 0)
!1003 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1004, file: !862, line: 140)
!1004 = !DISubprogram(name: "mblen", scope: !857, file: !857, line: 171, type: !1005, flags: DIFlagPrototyped, spFlags: 0)
!1005 = !DISubroutineType(types: !1006)
!1006 = !{!7, !255, !649}
!1007 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1008, file: !862, line: 142)
!1008 = !DISubprogram(name: "mbtowc", scope: !857, file: !857, line: 173, type: !1009, flags: DIFlagPrototyped, spFlags: 0)
!1009 = !DISubroutineType(types: !1010)
!1010 = !{!7, !648, !255, !649}
!1011 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1012, file: !862, line: 143)
!1012 = !DISubprogram(name: "wctomb", scope: !857, file: !857, line: 207, type: !1013, flags: DIFlagPrototyped, spFlags: 0)
!1013 = !DISubroutineType(types: !1014)
!1014 = !{!7, !380, !641}
!1015 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1016, file: !862, line: 144)
!1016 = !DISubprogram(name: "mbstowcs", scope: !857, file: !857, line: 172, type: !1017, flags: DIFlagPrototyped, spFlags: 0)
!1017 = !DISubroutineType(types: !1018)
!1018 = !{!649, !648, !255, !649}
!1019 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1020, file: !862, line: 145)
!1020 = !DISubprogram(name: "wcstombs", scope: !857, file: !857, line: 206, type: !1021, flags: DIFlagPrototyped, spFlags: 0)
!1021 = !DISubroutineType(types: !1022)
!1022 = !{!649, !380, !639, !649}
!1023 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1024, file: !862, line: 148)
!1024 = !DISubprogram(name: "at_quick_exit", scope: !857, file: !857, line: 147, type: !952, flags: DIFlagPrototyped, spFlags: 0)
!1025 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1026, file: !862, line: 149)
!1026 = !DISubprogram(name: "quick_exit", scope: !857, file: !857, line: 179, type: !957, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1027 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !608, file: !1028, line: 25)
!1028 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__std_mbstate_t.h", directory: "")
!1029 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1030, file: !1036, line: 422)
!1030 = !DISubprogram(name: "isfinite", linkageName: "_ZNSt3__16__math8isfiniteB8ne200100Ee", scope: !1032, file: !1031, line: 79, type: !1033, flags: DIFlagPrototyped, spFlags: 0)
!1031 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__math/traits.h", directory: "")
!1032 = !DINamespace(name: "__math", scope: !436)
!1033 = !DISubroutineType(types: !1034)
!1034 = !{!1035, !508}
!1035 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!1036 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/math.h", directory: "")
!1037 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1038, file: !1036, line: 425)
!1038 = !DISubprogram(name: "isinf", linkageName: "_ZNSt3__16__math5isinfB8ne200100Ee", scope: !1032, file: !1031, line: 103, type: !1033, flags: DIFlagPrototyped, spFlags: 0)
!1039 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1040, file: !1036, line: 429)
!1040 = !DISubprogram(name: "isnan", linkageName: "_ZNSt3__16__math5isnanB8ne200100Ee", scope: !1032, file: !1031, line: 127, type: !1033, flags: DIFlagPrototyped, spFlags: 0)
!1041 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1042, file: !1036, line: 430)
!1042 = !DISubprogram(name: "isnormal", linkageName: "_ZNSt3__16__math8isnormalB8ne200100Ee", scope: !1032, file: !1031, line: 146, type: !1033, flags: DIFlagPrototyped, spFlags: 0)
!1043 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1044, file: !1036, line: 485)
!1044 = !DISubprogram(name: "modf", linkageName: "_ZNSt3__16__math4modfB8ne200100EePe", scope: !1032, file: !1045, line: 55, type: !1046, flags: DIFlagPrototyped, spFlags: 0)
!1045 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__math/modulo.h", directory: "")
!1046 = !DISubroutineType(types: !1047)
!1047 = !{!508, !508, !1048}
!1048 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !508, size: 64)
!1049 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1030, file: !1050, line: 352)
!1050 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cmath", directory: "")
!1051 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1038, file: !1050, line: 353)
!1052 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1040, file: !1050, line: 354)
!1053 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1042, file: !1050, line: 355)
!1054 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1055, file: !1050, line: 364)
!1055 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !1056, line: 50, baseType: !710)
!1056 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/math.h", directory: "", checksumkind: CSK_MD5, checksum: "35b1ff63542c2c0c144330dd9277d2dc")
!1057 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1058, file: !1050, line: 365)
!1058 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !1056, line: 51, baseType: !704)
!1059 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !981, file: !1050, line: 367)
!1060 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1061, file: !1050, line: 370)
!1061 = !DISubprogram(name: "acosf", scope: !1056, file: !1056, line: 314, type: !1062, flags: DIFlagPrototyped, spFlags: 0)
!1062 = !DISubroutineType(types: !1063)
!1063 = !{!710, !710}
!1064 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1065, file: !1050, line: 372)
!1065 = !DISubprogram(name: "asinf", scope: !1056, file: !1056, line: 318, type: !1062, flags: DIFlagPrototyped, spFlags: 0)
!1066 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1067, file: !1050, line: 374)
!1067 = !DISubprogram(name: "atanf", scope: !1056, file: !1056, line: 322, type: !1062, flags: DIFlagPrototyped, spFlags: 0)
!1068 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1069, file: !1050, line: 376)
!1069 = !DISubprogram(name: "atan2f", scope: !1056, file: !1056, line: 326, type: !1070, flags: DIFlagPrototyped, spFlags: 0)
!1070 = !DISubroutineType(types: !1071)
!1071 = !{!710, !710, !710}
!1072 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1073, file: !1050, line: 378)
!1073 = !DISubprogram(name: "ceilf", scope: !1056, file: !1056, line: 461, type: !1062, flags: DIFlagPrototyped, spFlags: 0)
!1074 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1075, file: !1050, line: 380)
!1075 = !DISubprogram(name: "cosf", scope: !1056, file: !1056, line: 330, type: !1062, flags: DIFlagPrototyped, spFlags: 0)
!1076 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1077, file: !1050, line: 382)
!1077 = !DISubprogram(name: "coshf", scope: !1056, file: !1056, line: 354, type: !1062, flags: DIFlagPrototyped, spFlags: 0)
!1078 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1079, file: !1050, line: 385)
!1079 = !DISubprogram(name: "expf", scope: !1056, file: !1056, line: 366, type: !1062, flags: DIFlagPrototyped, spFlags: 0)
!1080 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1081, file: !1050, line: 388)
!1081 = !DISubprogram(name: "fabsf", scope: !1056, file: !1056, line: 422, type: !1062, flags: DIFlagPrototyped, spFlags: 0)
!1082 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1083, file: !1050, line: 390)
!1083 = !DISubprogram(name: "floorf", scope: !1056, file: !1056, line: 465, type: !1062, flags: DIFlagPrototyped, spFlags: 0)
!1084 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1085, file: !1050, line: 393)
!1085 = !DISubprogram(name: "fmodf", scope: !1056, file: !1056, line: 505, type: !1070, flags: DIFlagPrototyped, spFlags: 0)
!1086 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1087, file: !1050, line: 396)
!1087 = !DISubprogram(name: "frexpf", scope: !1056, file: !1056, line: 406, type: !1088, flags: DIFlagPrototyped, spFlags: 0)
!1088 = !DISubroutineType(types: !1089)
!1089 = !{!710, !710, !1090}
!1090 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!1091 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1092, file: !1050, line: 398)
!1092 = !DISubprogram(name: "ldexpf", scope: !1056, file: !1056, line: 402, type: !1093, flags: DIFlagPrototyped, spFlags: 0)
!1093 = !DISubroutineType(types: !1094)
!1094 = !{!710, !710, !7}
!1095 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1096, file: !1050, line: 401)
!1096 = !DISubprogram(name: "logf", scope: !1056, file: !1056, line: 378, type: !1062, flags: DIFlagPrototyped, spFlags: 0)
!1097 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1098, file: !1050, line: 404)
!1098 = !DISubprogram(name: "log10f", scope: !1056, file: !1056, line: 382, type: !1062, flags: DIFlagPrototyped, spFlags: 0)
!1099 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1044, file: !1050, line: 405)
!1100 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1101, file: !1050, line: 406)
!1101 = !DISubprogram(name: "modff", scope: !1056, file: !1056, line: 398, type: !1102, flags: DIFlagPrototyped, spFlags: 0)
!1102 = !DISubroutineType(types: !1103)
!1103 = !{!710, !710, !1104}
!1104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !710, size: 64)
!1105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1106, file: !1050, line: 409)
!1106 = !DISubprogram(name: "powf", scope: !1056, file: !1056, line: 434, type: !1070, flags: DIFlagPrototyped, spFlags: 0)
!1107 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1108, file: !1050, line: 412)
!1108 = !DISubprogram(name: "sinf", scope: !1056, file: !1056, line: 334, type: !1062, flags: DIFlagPrototyped, spFlags: 0)
!1109 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1110, file: !1050, line: 414)
!1110 = !DISubprogram(name: "sinhf", scope: !1056, file: !1056, line: 358, type: !1062, flags: DIFlagPrototyped, spFlags: 0)
!1111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1112, file: !1050, line: 417)
!1112 = !DISubprogram(name: "sqrtf", scope: !1056, file: !1056, line: 438, type: !1062, flags: DIFlagPrototyped, spFlags: 0)
!1113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1114, file: !1050, line: 419)
!1114 = !DISubprogram(name: "tanf", scope: !1056, file: !1056, line: 338, type: !1062, flags: DIFlagPrototyped, spFlags: 0)
!1115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1116, file: !1050, line: 422)
!1116 = !DISubprogram(name: "tanhf", scope: !1056, file: !1056, line: 362, type: !1062, flags: DIFlagPrototyped, spFlags: 0)
!1117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1118, file: !1050, line: 425)
!1118 = !DISubprogram(name: "acoshf", scope: !1056, file: !1056, line: 342, type: !1062, flags: DIFlagPrototyped, spFlags: 0)
!1119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1120, file: !1050, line: 427)
!1120 = !DISubprogram(name: "asinhf", scope: !1056, file: !1056, line: 346, type: !1062, flags: DIFlagPrototyped, spFlags: 0)
!1121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1122, file: !1050, line: 429)
!1122 = !DISubprogram(name: "atanhf", scope: !1056, file: !1056, line: 350, type: !1062, flags: DIFlagPrototyped, spFlags: 0)
!1123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1124, file: !1050, line: 431)
!1124 = !DISubprogram(name: "cbrtf", scope: !1056, file: !1056, line: 426, type: !1062, flags: DIFlagPrototyped, spFlags: 0)
!1125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1126, file: !1050, line: 434)
!1126 = !DISubprogram(name: "copysignf", scope: !1056, file: !1056, line: 517, type: !1070, flags: DIFlagPrototyped, spFlags: 0)
!1127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1128, file: !1050, line: 437)
!1128 = !DISubprogram(name: "erff", scope: !1056, file: !1056, line: 442, type: !1062, flags: DIFlagPrototyped, spFlags: 0)
!1129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1130, file: !1050, line: 439)
!1130 = !DISubprogram(name: "erfcf", scope: !1056, file: !1056, line: 446, type: !1062, flags: DIFlagPrototyped, spFlags: 0)
!1131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1132, file: !1050, line: 441)
!1132 = !DISubprogram(name: "exp2f", scope: !1056, file: !1056, line: 370, type: !1062, flags: DIFlagPrototyped, spFlags: 0)
!1133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1134, file: !1050, line: 443)
!1134 = !DISubprogram(name: "expm1f", scope: !1056, file: !1056, line: 374, type: !1062, flags: DIFlagPrototyped, spFlags: 0)
!1135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1136, file: !1050, line: 445)
!1136 = !DISubprogram(name: "fdimf", scope: !1056, file: !1056, line: 533, type: !1070, flags: DIFlagPrototyped, spFlags: 0)
!1137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1138, file: !1050, line: 446)
!1138 = !DISubprogram(name: "fmaf", scope: !1056, file: !1056, line: 545, type: !1139, flags: DIFlagPrototyped, spFlags: 0)
!1139 = !DISubroutineType(types: !1140)
!1140 = !{!710, !710, !710, !710}
!1141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1142, file: !1050, line: 449)
!1142 = !DISubprogram(name: "fmaxf", scope: !1056, file: !1056, line: 537, type: !1070, flags: DIFlagPrototyped, spFlags: 0)
!1143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1144, file: !1050, line: 451)
!1144 = !DISubprogram(name: "fminf", scope: !1056, file: !1056, line: 541, type: !1070, flags: DIFlagPrototyped, spFlags: 0)
!1145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1146, file: !1050, line: 453)
!1146 = !DISubprogram(name: "hypotf", scope: !1056, file: !1056, line: 430, type: !1070, flags: DIFlagPrototyped, spFlags: 0)
!1147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1148, file: !1050, line: 455)
!1148 = !DISubprogram(name: "ilogbf", scope: !1056, file: !1056, line: 410, type: !1149, flags: DIFlagPrototyped, spFlags: 0)
!1149 = !DISubroutineType(types: !1150)
!1150 = !{!7, !710}
!1151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1152, file: !1050, line: 457)
!1152 = !DISubprogram(name: "lgammaf", scope: !1056, file: !1056, line: 453, type: !1062, flags: DIFlagPrototyped, spFlags: 0)
!1153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1154, file: !1050, line: 459)
!1154 = !DISubprogram(name: "llrintf", scope: !1056, file: !1056, line: 492, type: !1155, flags: DIFlagPrototyped, spFlags: 0)
!1155 = !DISubroutineType(types: !1156)
!1156 = !{!16, !710}
!1157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1158, file: !1050, line: 461)
!1158 = !DISubprogram(name: "llroundf", scope: !1056, file: !1056, line: 496, type: !1155, flags: DIFlagPrototyped, spFlags: 0)
!1159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1160, file: !1050, line: 463)
!1160 = !DISubprogram(name: "log1pf", scope: !1056, file: !1056, line: 390, type: !1062, flags: DIFlagPrototyped, spFlags: 0)
!1161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1162, file: !1050, line: 465)
!1162 = !DISubprogram(name: "log2f", scope: !1056, file: !1056, line: 386, type: !1062, flags: DIFlagPrototyped, spFlags: 0)
!1163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1164, file: !1050, line: 467)
!1164 = !DISubprogram(name: "logbf", scope: !1056, file: !1056, line: 394, type: !1062, flags: DIFlagPrototyped, spFlags: 0)
!1165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1166, file: !1050, line: 469)
!1166 = !DISubprogram(name: "lrintf", scope: !1056, file: !1056, line: 477, type: !1167, flags: DIFlagPrototyped, spFlags: 0)
!1167 = !DISubroutineType(types: !1168)
!1168 = !{!494, !710}
!1169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1170, file: !1050, line: 471)
!1170 = !DISubprogram(name: "lroundf", scope: !1056, file: !1056, line: 485, type: !1167, flags: DIFlagPrototyped, spFlags: 0)
!1171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1172, file: !1050, line: 473)
!1172 = !DISubprogram(name: "nan", scope: !1056, file: !1056, line: 522, type: !877, flags: DIFlagPrototyped, spFlags: 0)
!1173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1174, file: !1050, line: 474)
!1174 = !DISubprogram(name: "nanf", scope: !1056, file: !1056, line: 521, type: !1175, flags: DIFlagPrototyped, spFlags: 0)
!1175 = !DISubroutineType(types: !1176)
!1176 = !{!710, !255}
!1177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1178, file: !1050, line: 477)
!1178 = !DISubprogram(name: "nearbyintf", scope: !1056, file: !1056, line: 469, type: !1062, flags: DIFlagPrototyped, spFlags: 0)
!1179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1180, file: !1050, line: 479)
!1180 = !DISubprogram(name: "nextafterf", scope: !1056, file: !1056, line: 525, type: !1070, flags: DIFlagPrototyped, spFlags: 0)
!1181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1182, file: !1050, line: 481)
!1182 = !DISubprogram(name: "nexttowardf", scope: !1056, file: !1056, line: 530, type: !1183, flags: DIFlagPrototyped, spFlags: 0)
!1183 = !DISubroutineType(types: !1184)
!1184 = !{!710, !710, !508}
!1185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1186, file: !1050, line: 483)
!1186 = !DISubprogram(name: "remainderf", scope: !1056, file: !1056, line: 509, type: !1070, flags: DIFlagPrototyped, spFlags: 0)
!1187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1188, file: !1050, line: 485)
!1188 = !DISubprogram(name: "remquof", scope: !1056, file: !1056, line: 513, type: !1189, flags: DIFlagPrototyped, spFlags: 0)
!1189 = !DISubroutineType(types: !1190)
!1190 = !{!710, !710, !710, !1090}
!1191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1192, file: !1050, line: 487)
!1192 = !DISubprogram(name: "rintf", scope: !1056, file: !1056, line: 473, type: !1062, flags: DIFlagPrototyped, spFlags: 0)
!1193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1194, file: !1050, line: 489)
!1194 = !DISubprogram(name: "roundf", scope: !1056, file: !1056, line: 481, type: !1062, flags: DIFlagPrototyped, spFlags: 0)
!1195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1196, file: !1050, line: 491)
!1196 = !DISubprogram(name: "scalblnf", scope: !1056, file: !1056, line: 418, type: !1197, flags: DIFlagPrototyped, spFlags: 0)
!1197 = !DISubroutineType(types: !1198)
!1198 = !{!710, !710, !494}
!1199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1200, file: !1050, line: 493)
!1200 = !DISubprogram(name: "scalbnf", scope: !1056, file: !1056, line: 414, type: !1093, flags: DIFlagPrototyped, spFlags: 0)
!1201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1202, file: !1050, line: 495)
!1202 = !DISubprogram(name: "tgammaf", scope: !1056, file: !1056, line: 457, type: !1062, flags: DIFlagPrototyped, spFlags: 0)
!1203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1204, file: !1050, line: 497)
!1204 = !DISubprogram(name: "truncf", scope: !1056, file: !1056, line: 501, type: !1062, flags: DIFlagPrototyped, spFlags: 0)
!1205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1206, file: !1050, line: 499)
!1206 = !DISubprogram(name: "acosl", scope: !1056, file: !1056, line: 316, type: !983, flags: DIFlagPrototyped, spFlags: 0)
!1207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1208, file: !1050, line: 500)
!1208 = !DISubprogram(name: "asinl", scope: !1056, file: !1056, line: 320, type: !983, flags: DIFlagPrototyped, spFlags: 0)
!1209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1210, file: !1050, line: 501)
!1210 = !DISubprogram(name: "atanl", scope: !1056, file: !1056, line: 324, type: !983, flags: DIFlagPrototyped, spFlags: 0)
!1211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1212, file: !1050, line: 502)
!1212 = !DISubprogram(name: "atan2l", scope: !1056, file: !1056, line: 328, type: !1213, flags: DIFlagPrototyped, spFlags: 0)
!1213 = !DISubroutineType(types: !1214)
!1214 = !{!508, !508, !508}
!1215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1216, file: !1050, line: 503)
!1216 = !DISubprogram(name: "ceill", scope: !1056, file: !1056, line: 463, type: !983, flags: DIFlagPrototyped, spFlags: 0)
!1217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1218, file: !1050, line: 504)
!1218 = !DISubprogram(name: "cosl", scope: !1056, file: !1056, line: 332, type: !983, flags: DIFlagPrototyped, spFlags: 0)
!1219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1220, file: !1050, line: 505)
!1220 = !DISubprogram(name: "coshl", scope: !1056, file: !1056, line: 356, type: !983, flags: DIFlagPrototyped, spFlags: 0)
!1221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1222, file: !1050, line: 506)
!1222 = !DISubprogram(name: "expl", scope: !1056, file: !1056, line: 368, type: !983, flags: DIFlagPrototyped, spFlags: 0)
!1223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1224, file: !1050, line: 507)
!1224 = !DISubprogram(name: "fabsl", scope: !1056, file: !1056, line: 424, type: !983, flags: DIFlagPrototyped, spFlags: 0)
!1225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1226, file: !1050, line: 508)
!1226 = !DISubprogram(name: "floorl", scope: !1056, file: !1056, line: 467, type: !983, flags: DIFlagPrototyped, spFlags: 0)
!1227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1228, file: !1050, line: 509)
!1228 = !DISubprogram(name: "fmodl", scope: !1056, file: !1056, line: 507, type: !1213, flags: DIFlagPrototyped, spFlags: 0)
!1229 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1230, file: !1050, line: 510)
!1230 = !DISubprogram(name: "frexpl", scope: !1056, file: !1056, line: 408, type: !1231, flags: DIFlagPrototyped, spFlags: 0)
!1231 = !DISubroutineType(types: !1232)
!1232 = !{!508, !508, !1090}
!1233 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1234, file: !1050, line: 511)
!1234 = !DISubprogram(name: "ldexpl", scope: !1056, file: !1056, line: 404, type: !1235, flags: DIFlagPrototyped, spFlags: 0)
!1235 = !DISubroutineType(types: !1236)
!1236 = !{!508, !508, !7}
!1237 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1238, file: !1050, line: 512)
!1238 = !DISubprogram(name: "logl", scope: !1056, file: !1056, line: 380, type: !983, flags: DIFlagPrototyped, spFlags: 0)
!1239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1240, file: !1050, line: 513)
!1240 = !DISubprogram(name: "log10l", scope: !1056, file: !1056, line: 384, type: !983, flags: DIFlagPrototyped, spFlags: 0)
!1241 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1242, file: !1050, line: 514)
!1242 = !DISubprogram(name: "modfl", scope: !1056, file: !1056, line: 400, type: !1046, flags: DIFlagPrototyped, spFlags: 0)
!1243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1244, file: !1050, line: 515)
!1244 = !DISubprogram(name: "powl", scope: !1056, file: !1056, line: 436, type: !1213, flags: DIFlagPrototyped, spFlags: 0)
!1245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1246, file: !1050, line: 516)
!1246 = !DISubprogram(name: "sinl", scope: !1056, file: !1056, line: 336, type: !983, flags: DIFlagPrototyped, spFlags: 0)
!1247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1248, file: !1050, line: 517)
!1248 = !DISubprogram(name: "sinhl", scope: !1056, file: !1056, line: 360, type: !983, flags: DIFlagPrototyped, spFlags: 0)
!1249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1250, file: !1050, line: 518)
!1250 = !DISubprogram(name: "sqrtl", scope: !1056, file: !1056, line: 440, type: !983, flags: DIFlagPrototyped, spFlags: 0)
!1251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1252, file: !1050, line: 519)
!1252 = !DISubprogram(name: "tanl", scope: !1056, file: !1056, line: 340, type: !983, flags: DIFlagPrototyped, spFlags: 0)
!1253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1254, file: !1050, line: 521)
!1254 = !DISubprogram(name: "tanhl", scope: !1056, file: !1056, line: 364, type: !983, flags: DIFlagPrototyped, spFlags: 0)
!1255 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1256, file: !1050, line: 522)
!1256 = !DISubprogram(name: "acoshl", scope: !1056, file: !1056, line: 344, type: !983, flags: DIFlagPrototyped, spFlags: 0)
!1257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1258, file: !1050, line: 523)
!1258 = !DISubprogram(name: "asinhl", scope: !1056, file: !1056, line: 348, type: !983, flags: DIFlagPrototyped, spFlags: 0)
!1259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1260, file: !1050, line: 524)
!1260 = !DISubprogram(name: "atanhl", scope: !1056, file: !1056, line: 352, type: !983, flags: DIFlagPrototyped, spFlags: 0)
!1261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1262, file: !1050, line: 525)
!1262 = !DISubprogram(name: "cbrtl", scope: !1056, file: !1056, line: 428, type: !983, flags: DIFlagPrototyped, spFlags: 0)
!1263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1264, file: !1050, line: 527)
!1264 = !DISubprogram(name: "copysignl", scope: !1056, file: !1056, line: 519, type: !1213, flags: DIFlagPrototyped, spFlags: 0)
!1265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1266, file: !1050, line: 529)
!1266 = !DISubprogram(name: "erfl", scope: !1056, file: !1056, line: 444, type: !983, flags: DIFlagPrototyped, spFlags: 0)
!1267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1268, file: !1050, line: 530)
!1268 = !DISubprogram(name: "erfcl", scope: !1056, file: !1056, line: 448, type: !983, flags: DIFlagPrototyped, spFlags: 0)
!1269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1270, file: !1050, line: 531)
!1270 = !DISubprogram(name: "exp2l", scope: !1056, file: !1056, line: 372, type: !983, flags: DIFlagPrototyped, spFlags: 0)
!1271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1272, file: !1050, line: 532)
!1272 = !DISubprogram(name: "expm1l", scope: !1056, file: !1056, line: 376, type: !983, flags: DIFlagPrototyped, spFlags: 0)
!1273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1274, file: !1050, line: 533)
!1274 = !DISubprogram(name: "fdiml", scope: !1056, file: !1056, line: 535, type: !1213, flags: DIFlagPrototyped, spFlags: 0)
!1275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1276, file: !1050, line: 534)
!1276 = !DISubprogram(name: "fmal", scope: !1056, file: !1056, line: 547, type: !1277, flags: DIFlagPrototyped, spFlags: 0)
!1277 = !DISubroutineType(types: !1278)
!1278 = !{!508, !508, !508, !508}
!1279 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1280, file: !1050, line: 535)
!1280 = !DISubprogram(name: "fmaxl", scope: !1056, file: !1056, line: 539, type: !1213, flags: DIFlagPrototyped, spFlags: 0)
!1281 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1282, file: !1050, line: 536)
!1282 = !DISubprogram(name: "fminl", scope: !1056, file: !1056, line: 543, type: !1213, flags: DIFlagPrototyped, spFlags: 0)
!1283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1284, file: !1050, line: 537)
!1284 = !DISubprogram(name: "hypotl", scope: !1056, file: !1056, line: 432, type: !1213, flags: DIFlagPrototyped, spFlags: 0)
!1285 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1286, file: !1050, line: 538)
!1286 = !DISubprogram(name: "ilogbl", scope: !1056, file: !1056, line: 412, type: !1287, flags: DIFlagPrototyped, spFlags: 0)
!1287 = !DISubroutineType(types: !1288)
!1288 = !{!7, !508}
!1289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1290, file: !1050, line: 539)
!1290 = !DISubprogram(name: "lgammal", scope: !1056, file: !1056, line: 455, type: !983, flags: DIFlagPrototyped, spFlags: 0)
!1291 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1292, file: !1050, line: 540)
!1292 = !DISubprogram(name: "llrintl", scope: !1056, file: !1056, line: 494, type: !1293, flags: DIFlagPrototyped, spFlags: 0)
!1293 = !DISubroutineType(types: !1294)
!1294 = !{!16, !508}
!1295 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1296, file: !1050, line: 541)
!1296 = !DISubprogram(name: "llroundl", scope: !1056, file: !1056, line: 498, type: !1293, flags: DIFlagPrototyped, spFlags: 0)
!1297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1298, file: !1050, line: 542)
!1298 = !DISubprogram(name: "log1pl", scope: !1056, file: !1056, line: 392, type: !983, flags: DIFlagPrototyped, spFlags: 0)
!1299 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1300, file: !1050, line: 543)
!1300 = !DISubprogram(name: "log2l", scope: !1056, file: !1056, line: 388, type: !983, flags: DIFlagPrototyped, spFlags: 0)
!1301 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1302, file: !1050, line: 544)
!1302 = !DISubprogram(name: "logbl", scope: !1056, file: !1056, line: 396, type: !983, flags: DIFlagPrototyped, spFlags: 0)
!1303 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1304, file: !1050, line: 545)
!1304 = !DISubprogram(name: "lrintl", scope: !1056, file: !1056, line: 479, type: !1305, flags: DIFlagPrototyped, spFlags: 0)
!1305 = !DISubroutineType(types: !1306)
!1306 = !{!494, !508}
!1307 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1308, file: !1050, line: 546)
!1308 = !DISubprogram(name: "lroundl", scope: !1056, file: !1056, line: 487, type: !1305, flags: DIFlagPrototyped, spFlags: 0)
!1309 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1310, file: !1050, line: 547)
!1310 = !DISubprogram(name: "nanl", scope: !1056, file: !1056, line: 523, type: !1311, flags: DIFlagPrototyped, spFlags: 0)
!1311 = !DISubroutineType(types: !1312)
!1312 = !{!508, !255}
!1313 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1314, file: !1050, line: 548)
!1314 = !DISubprogram(name: "nearbyintl", scope: !1056, file: !1056, line: 471, type: !983, flags: DIFlagPrototyped, spFlags: 0)
!1315 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1316, file: !1050, line: 549)
!1316 = !DISubprogram(name: "nextafterl", scope: !1056, file: !1056, line: 527, type: !1213, flags: DIFlagPrototyped, spFlags: 0)
!1317 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1318, file: !1050, line: 550)
!1318 = !DISubprogram(name: "nexttowardl", scope: !1056, file: !1056, line: 531, type: !1213, flags: DIFlagPrototyped, spFlags: 0)
!1319 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1320, file: !1050, line: 551)
!1320 = !DISubprogram(name: "remainderl", scope: !1056, file: !1056, line: 511, type: !1213, flags: DIFlagPrototyped, spFlags: 0)
!1321 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1322, file: !1050, line: 552)
!1322 = !DISubprogram(name: "remquol", scope: !1056, file: !1056, line: 515, type: !1323, flags: DIFlagPrototyped, spFlags: 0)
!1323 = !DISubroutineType(types: !1324)
!1324 = !{!508, !508, !508, !1090}
!1325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1326, file: !1050, line: 553)
!1326 = !DISubprogram(name: "rintl", scope: !1056, file: !1056, line: 475, type: !983, flags: DIFlagPrototyped, spFlags: 0)
!1327 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1328, file: !1050, line: 554)
!1328 = !DISubprogram(name: "roundl", scope: !1056, file: !1056, line: 483, type: !983, flags: DIFlagPrototyped, spFlags: 0)
!1329 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1330, file: !1050, line: 555)
!1330 = !DISubprogram(name: "scalblnl", scope: !1056, file: !1056, line: 420, type: !1331, flags: DIFlagPrototyped, spFlags: 0)
!1331 = !DISubroutineType(types: !1332)
!1332 = !{!508, !508, !494}
!1333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1334, file: !1050, line: 556)
!1334 = !DISubprogram(name: "scalbnl", scope: !1056, file: !1056, line: 416, type: !1235, flags: DIFlagPrototyped, spFlags: 0)
!1335 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1336, file: !1050, line: 557)
!1336 = !DISubprogram(name: "tgammal", scope: !1056, file: !1056, line: 459, type: !983, flags: DIFlagPrototyped, spFlags: 0)
!1337 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1338, file: !1050, line: 558)
!1338 = !DISubprogram(name: "truncl", scope: !1056, file: !1056, line: 503, type: !983, flags: DIFlagPrototyped, spFlags: 0)
!1339 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1340, file: !1344, line: 82)
!1340 = !DISubprogram(name: "memcpy", scope: !1341, file: !1341, line: 78, type: !1342, flags: DIFlagPrototyped, spFlags: 0)
!1341 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_string.h", directory: "", checksumkind: CSK_MD5, checksum: "c67be38c725261ca8572072ee1574b87")
!1342 = !DISubroutineType(types: !1343)
!1343 = !{!371, !371, !971, !649}
!1344 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstring", directory: "")
!1345 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1346, file: !1344, line: 83)
!1346 = !DISubprogram(name: "memmove", scope: !1341, file: !1341, line: 81, type: !1342, flags: DIFlagPrototyped, spFlags: 0)
!1347 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1348, file: !1344, line: 84)
!1348 = !DISubprogram(name: "strcpy", scope: !1341, file: !1341, line: 92, type: !1349, flags: DIFlagPrototyped, spFlags: 0)
!1349 = !DISubroutineType(types: !1350)
!1350 = !{!380, !380, !255}
!1351 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1352, file: !1344, line: 85)
!1352 = !DISubprogram(name: "strncpy", scope: !1341, file: !1341, line: 104, type: !1353, flags: DIFlagPrototyped, spFlags: 0)
!1353 = !DISubroutineType(types: !1354)
!1354 = !{!380, !380, !255, !649}
!1355 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1356, file: !1344, line: 86)
!1356 = !DISubprogram(name: "strcat", scope: !1341, file: !1341, line: 86, type: !1349, flags: DIFlagPrototyped, spFlags: 0)
!1357 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1358, file: !1344, line: 87)
!1358 = !DISubprogram(name: "strncat", scope: !1341, file: !1341, line: 98, type: !1353, flags: DIFlagPrototyped, spFlags: 0)
!1359 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1360, file: !1344, line: 88)
!1360 = !DISubprogram(name: "memcmp", scope: !1341, file: !1341, line: 75, type: !1361, flags: DIFlagPrototyped, spFlags: 0)
!1361 = !DISubroutineType(types: !1362)
!1362 = !{!7, !971, !971, !649}
!1363 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1364, file: !1344, line: 89)
!1364 = !DISubprogram(name: "strcmp", scope: !1341, file: !1341, line: 89, type: !1365, flags: DIFlagPrototyped, spFlags: 0)
!1365 = !DISubroutineType(types: !1366)
!1366 = !{!7, !255, !255}
!1367 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1368, file: !1344, line: 90)
!1368 = !DISubprogram(name: "strncmp", scope: !1341, file: !1341, line: 101, type: !1369, flags: DIFlagPrototyped, spFlags: 0)
!1369 = !DISubroutineType(types: !1370)
!1370 = !{!7, !255, !255, !649}
!1371 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1372, file: !1344, line: 91)
!1372 = !DISubprogram(name: "strcoll", scope: !1341, file: !1341, line: 90, type: !1365, flags: DIFlagPrototyped, spFlags: 0)
!1373 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1374, file: !1344, line: 92)
!1374 = !DISubprogram(name: "strxfrm", scope: !1341, file: !1341, line: 112, type: !1375, flags: DIFlagPrototyped, spFlags: 0)
!1375 = !DISubroutineType(types: !1376)
!1376 = !{!649, !380, !255, !649}
!1377 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1378, file: !1344, line: 93)
!1378 = !DISubprogram(name: "memchr", linkageName: "_Z6memchrB8ne200100Ua9enable_ifILb1EEPvim", scope: !1379, file: !1379, line: 101, type: !1380, flags: DIFlagPrototyped, spFlags: 0)
!1379 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/string.h", directory: "")
!1380 = !DISubroutineType(types: !1381)
!1381 = !{!371, !371, !7, !649}
!1382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1383, file: !1344, line: 94)
!1383 = !DISubprogram(name: "strchr", linkageName: "_Z6strchrB8ne200100Ua9enable_ifILb1EEPci", scope: !1379, file: !1379, line: 80, type: !1384, flags: DIFlagPrototyped, spFlags: 0)
!1384 = !DISubroutineType(types: !1385)
!1385 = !{!380, !380, !7}
!1386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1387, file: !1344, line: 95)
!1387 = !DISubprogram(name: "strcspn", scope: !1341, file: !1341, line: 94, type: !1388, flags: DIFlagPrototyped, spFlags: 0)
!1388 = !DISubroutineType(types: !1389)
!1389 = !{!649, !255, !255}
!1390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1391, file: !1344, line: 96)
!1391 = !DISubprogram(name: "strpbrk", linkageName: "_Z7strpbrkB8ne200100Ua9enable_ifILb1EEPcPKc", scope: !1379, file: !1379, line: 87, type: !1349, flags: DIFlagPrototyped, spFlags: 0)
!1392 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1393, file: !1344, line: 97)
!1393 = !DISubprogram(name: "strrchr", linkageName: "_Z7strrchrB8ne200100Ua9enable_ifILb1EEPci", scope: !1379, file: !1379, line: 94, type: !1384, flags: DIFlagPrototyped, spFlags: 0)
!1394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1395, file: !1344, line: 98)
!1395 = !DISubprogram(name: "strspn", scope: !1341, file: !1341, line: 109, type: !1388, flags: DIFlagPrototyped, spFlags: 0)
!1396 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1397, file: !1344, line: 99)
!1397 = !DISubprogram(name: "strstr", linkageName: "_Z6strstrB8ne200100Ua9enable_ifILb1EEPcPKc", scope: !1379, file: !1379, line: 108, type: !1349, flags: DIFlagPrototyped, spFlags: 0)
!1398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1399, file: !1344, line: 100)
!1399 = !DISubprogram(name: "strtok", scope: !1341, file: !1341, line: 111, type: !1349, flags: DIFlagPrototyped, spFlags: 0)
!1400 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1401, file: !1344, line: 101)
!1401 = !DISubprogram(name: "memset", scope: !1341, file: !1341, line: 84, type: !1380, flags: DIFlagPrototyped, spFlags: 0)
!1402 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1403, file: !1344, line: 102)
!1403 = !DISubprogram(name: "strerror", linkageName: "\01_strerror", scope: !1341, file: !1341, line: 95, type: !1404, flags: DIFlagPrototyped, spFlags: 0)
!1404 = !DISubroutineType(types: !1405)
!1405 = !{!380, !7}
!1406 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1407, file: !1344, line: 103)
!1407 = !DISubprogram(name: "strlen", scope: !1341, file: !1341, line: 96, type: !1408, flags: DIFlagPrototyped, spFlags: 0)
!1408 = !DISubroutineType(types: !1409)
!1409 = !{!649, !255}
!1410 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !1411, entity: !1412, file: !1414, line: 536)
!1411 = !DINamespace(name: "chrono", scope: !436)
!1412 = !DINamespace(name: "chrono_literals", scope: !1413, exportSymbols: true)
!1413 = !DINamespace(name: "literals", scope: !436, exportSymbols: true)
!1414 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__chrono/duration.h", directory: "")
!1415 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1416, file: !1419, line: 68)
!1416 = !DIDerivedType(tag: DW_TAG_typedef, name: "clock_t", file: !1417, line: 31, baseType: !1418)
!1417 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_clock_t.h", directory: "", checksumkind: CSK_MD5, checksum: "757b93ac72874f074e33ca41b7ee521d")
!1418 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_clock_t", file: !389, line: 116, baseType: !498)
!1419 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/ctime", directory: "")
!1420 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1421, file: !1419, line: 69)
!1421 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !1422, line: 31, baseType: !1423)
!1422 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_time_t.h", directory: "", checksumkind: CSK_MD5, checksum: "ddc110fab0813d27960d5c9aaba0ed4f")
!1423 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_time_t", file: !389, line: 119, baseType: !494)
!1424 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !618, file: !1419, line: 70)
!1425 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1426, file: !1419, line: 74)
!1426 = !DISubprogram(name: "clock", linkageName: "\01_clock", scope: !619, file: !619, line: 112, type: !1427, flags: DIFlagPrototyped, spFlags: 0)
!1427 = !DISubroutineType(types: !1428)
!1428 = !{!1416}
!1429 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1430, file: !1419, line: 75)
!1430 = !DISubprogram(name: "difftime", scope: !619, file: !619, line: 114, type: !1431, flags: DIFlagPrototyped, spFlags: 0)
!1431 = !DISubroutineType(types: !1432)
!1432 = !{!704, !1421, !1421}
!1433 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1434, file: !1419, line: 76)
!1434 = !DISubprogram(name: "mktime", linkageName: "\01_mktime", scope: !619, file: !619, line: 118, type: !1435, flags: DIFlagPrototyped, spFlags: 0)
!1435 = !DISubroutineType(types: !1436)
!1436 = !{!1421, !1437}
!1437 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !618, size: 64)
!1438 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1439, file: !1419, line: 77)
!1439 = !DISubprogram(name: "time", scope: !619, file: !619, line: 121, type: !1440, flags: DIFlagPrototyped, spFlags: 0)
!1440 = !DISubroutineType(types: !1441)
!1441 = !{!1421, !1442}
!1442 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1421, size: 64)
!1443 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1444, file: !1419, line: 78)
!1444 = !DISubprogram(name: "asctime", scope: !619, file: !619, line: 111, type: !1445, flags: DIFlagPrototyped, spFlags: 0)
!1445 = !DISubroutineType(types: !1446)
!1446 = !{!380, !798}
!1447 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1448, file: !1419, line: 79)
!1448 = !DISubprogram(name: "ctime", scope: !619, file: !619, line: 113, type: !1449, flags: DIFlagPrototyped, spFlags: 0)
!1449 = !DISubroutineType(types: !1450)
!1450 = !{!380, !1451}
!1451 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1452, size: 64)
!1452 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1421)
!1453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1454, file: !1419, line: 80)
!1454 = !DISubprogram(name: "gmtime", scope: !619, file: !619, line: 116, type: !1455, flags: DIFlagPrototyped, spFlags: 0)
!1455 = !DISubroutineType(types: !1456)
!1456 = !{!1437, !1451}
!1457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1458, file: !1419, line: 81)
!1458 = !DISubprogram(name: "localtime", scope: !619, file: !619, line: 117, type: !1455, flags: DIFlagPrototyped, spFlags: 0)
!1459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1460, file: !1419, line: 82)
!1460 = !DISubprogram(name: "strftime", linkageName: "\01_strftime", scope: !619, file: !619, line: 119, type: !1461, flags: DIFlagPrototyped, spFlags: 0)
!1461 = !DISubroutineType(types: !1462)
!1462 = !{!649, !380, !649, !255, !798}
!1463 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !354, file: !1464, line: 120)
!1464 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdio", directory: "")
!1465 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !385, file: !1464, line: 121)
!1466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1467, file: !1464, line: 123)
!1467 = !DISubprogram(name: "fclose", scope: !355, file: !355, line: 233, type: !1468, flags: DIFlagPrototyped, spFlags: 0)
!1468 = !DISubroutineType(types: !1469)
!1469 = !{!7, !353}
!1470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1471, file: !1464, line: 124)
!1471 = !DISubprogram(name: "fflush", scope: !355, file: !355, line: 236, type: !1468, flags: DIFlagPrototyped, spFlags: 0)
!1472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1473, file: !1464, line: 125)
!1473 = !DISubprogram(name: "setbuf", scope: !355, file: !355, line: 272, type: !1474, flags: DIFlagPrototyped, spFlags: 0)
!1474 = !DISubroutineType(types: !1475)
!1475 = !{null, !353, !380}
!1476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1477, file: !1464, line: 126)
!1477 = !DISubprogram(name: "setvbuf", scope: !355, file: !355, line: 273, type: !1478, flags: DIFlagPrototyped, spFlags: 0)
!1478 = !DISubroutineType(types: !1479)
!1479 = !{!7, !353, !380, !7, !649}
!1480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1481, file: !1464, line: 127)
!1481 = !DISubprogram(name: "fprintf", scope: !355, file: !355, line: 245, type: !1482, flags: DIFlagPrototyped, spFlags: 0)
!1482 = !DISubroutineType(types: !1483)
!1483 = !{!7, !353, !255, null}
!1484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1485, file: !1464, line: 128)
!1485 = !DISubprogram(name: "fscanf", scope: !355, file: !355, line: 251, type: !1482, flags: DIFlagPrototyped, spFlags: 0)
!1486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1487, file: !1464, line: 129)
!1487 = !DISubprogram(name: "snprintf", scope: !355, file: !355, line: 435, type: !1488, flags: DIFlagPrototyped, spFlags: 0)
!1488 = !DISubroutineType(types: !1489)
!1489 = !{!7, !380, !649, !255, null}
!1490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1491, file: !1464, line: 130)
!1491 = !DISubprogram(name: "sprintf", scope: !355, file: !355, line: 280, type: !1492, flags: DIFlagPrototyped, spFlags: 0)
!1492 = !DISubroutineType(types: !1493)
!1493 = !{!7, !380, !255, null}
!1494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1495, file: !1464, line: 131)
!1495 = !DISubprogram(name: "sscanf", scope: !355, file: !355, line: 282, type: !1496, flags: DIFlagPrototyped, spFlags: 0)
!1496 = !DISubroutineType(types: !1497)
!1497 = !{!7, !255, !255, null}
!1498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1499, file: !1464, line: 132)
!1499 = !DISubprogram(name: "vfprintf", scope: !355, file: !355, line: 292, type: !1500, flags: DIFlagPrototyped, spFlags: 0)
!1500 = !DISubroutineType(types: !1501)
!1501 = !{!7, !353, !255, !1502}
!1502 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !1503, line: 44, baseType: !656)
!1503 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_va_list.h", directory: "", checksumkind: CSK_MD5, checksum: "41825c2dccdd98a1587ce428cded44de")
!1504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1505, file: !1464, line: 133)
!1505 = !DISubprogram(name: "vfscanf", scope: !355, file: !355, line: 436, type: !1500, flags: DIFlagPrototyped, spFlags: 0)
!1506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1507, file: !1464, line: 134)
!1507 = !DISubprogram(name: "vsscanf", scope: !355, file: !355, line: 439, type: !1508, flags: DIFlagPrototyped, spFlags: 0)
!1508 = !DISubroutineType(types: !1509)
!1509 = !{!7, !255, !255, !1502}
!1510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1511, file: !1464, line: 135)
!1511 = !DISubprogram(name: "vsnprintf", scope: !355, file: !355, line: 438, type: !1512, flags: DIFlagPrototyped, spFlags: 0)
!1512 = !DISubroutineType(types: !1513)
!1513 = !{!7, !380, !649, !255, !1502}
!1514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1515, file: !1464, line: 136)
!1515 = !DISubprogram(name: "vsprintf", scope: !355, file: !355, line: 300, type: !1516, flags: DIFlagPrototyped, spFlags: 0)
!1516 = !DISubroutineType(types: !1517)
!1517 = !{!7, !380, !255, !1502}
!1518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1519, file: !1464, line: 137)
!1519 = !DISubprogram(name: "fgetc", scope: !355, file: !355, line: 237, type: !1468, flags: DIFlagPrototyped, spFlags: 0)
!1520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1521, file: !1464, line: 138)
!1521 = !DISubprogram(name: "fgets", scope: !355, file: !355, line: 239, type: !1522, flags: DIFlagPrototyped, spFlags: 0)
!1522 = !DISubroutineType(types: !1523)
!1523 = !{!380, !380, !7, !353}
!1524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1525, file: !1464, line: 139)
!1525 = !DISubprogram(name: "fputc", scope: !355, file: !355, line: 246, type: !1526, flags: DIFlagPrototyped, spFlags: 0)
!1526 = !DISubroutineType(types: !1527)
!1527 = !{!7, !7, !353}
!1528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1529, file: !1464, line: 140)
!1529 = !DISubprogram(name: "fputs", linkageName: "\01_fputs", scope: !355, file: !355, line: 247, type: !1530, flags: DIFlagPrototyped, spFlags: 0)
!1530 = !DISubroutineType(types: !1531)
!1531 = !{!7, !255, !353}
!1532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1533, file: !1464, line: 141)
!1533 = !DISubprogram(name: "getc", scope: !355, file: !355, line: 256, type: !1468, flags: DIFlagPrototyped, spFlags: 0)
!1534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1535, file: !1464, line: 142)
!1535 = !DISubprogram(name: "putc", scope: !355, file: !355, line: 265, type: !1526, flags: DIFlagPrototyped, spFlags: 0)
!1536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1537, file: !1464, line: 143)
!1537 = !DISubprogram(name: "ungetc", scope: !355, file: !355, line: 291, type: !1526, flags: DIFlagPrototyped, spFlags: 0)
!1538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1539, file: !1464, line: 144)
!1539 = !DISubprogram(name: "fread", scope: !355, file: !355, line: 248, type: !1540, flags: DIFlagPrototyped, spFlags: 0)
!1540 = !DISubroutineType(types: !1541)
!1541 = !{!649, !371, !649, !649, !353}
!1542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1543, file: !1464, line: 145)
!1543 = !DISubprogram(name: "fwrite", linkageName: "\01_fwrite", scope: !355, file: !355, line: 255, type: !1544, flags: DIFlagPrototyped, spFlags: 0)
!1544 = !DISubroutineType(types: !1545)
!1545 = !{!649, !971, !649, !649, !353}
!1546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1547, file: !1464, line: 146)
!1547 = !DISubprogram(name: "fgetpos", scope: !355, file: !355, line: 238, type: !1548, flags: DIFlagPrototyped, spFlags: 0)
!1548 = !DISubroutineType(types: !1549)
!1549 = !{!7, !353, !1550}
!1550 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !385, size: 64)
!1551 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1552, file: !1464, line: 147)
!1552 = !DISubprogram(name: "fseek", scope: !355, file: !355, line: 252, type: !1553, flags: DIFlagPrototyped, spFlags: 0)
!1553 = !DISubroutineType(types: !1554)
!1554 = !{!7, !353, !494, !7}
!1555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1556, file: !1464, line: 148)
!1556 = !DISubprogram(name: "fsetpos", scope: !355, file: !355, line: 253, type: !1557, flags: DIFlagPrototyped, spFlags: 0)
!1557 = !DISubroutineType(types: !1558)
!1558 = !{!7, !353, !1559}
!1559 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1560, size: 64)
!1560 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !385)
!1561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1562, file: !1464, line: 149)
!1562 = !DISubprogram(name: "ftell", scope: !355, file: !355, line: 254, type: !1563, flags: DIFlagPrototyped, spFlags: 0)
!1563 = !DISubroutineType(types: !1564)
!1564 = !{!494, !353}
!1565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1566, file: !1464, line: 150)
!1566 = !DISubprogram(name: "rewind", scope: !355, file: !355, line: 270, type: !1567, flags: DIFlagPrototyped, spFlags: 0)
!1567 = !DISubroutineType(types: !1568)
!1568 = !{null, !353}
!1569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1570, file: !1464, line: 151)
!1570 = !DISubprogram(name: "clearerr", scope: !355, file: !355, line: 232, type: !1567, flags: DIFlagPrototyped, spFlags: 0)
!1571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1572, file: !1464, line: 152)
!1572 = !DISubprogram(name: "feof", scope: !355, file: !355, line: 234, type: !1468, flags: DIFlagPrototyped, spFlags: 0)
!1573 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1574, file: !1464, line: 153)
!1574 = !DISubprogram(name: "ferror", scope: !355, file: !355, line: 235, type: !1468, flags: DIFlagPrototyped, spFlags: 0)
!1575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1576, file: !1464, line: 154)
!1576 = !DISubprogram(name: "perror", scope: !355, file: !355, line: 264, type: !1577, flags: DIFlagPrototyped, spFlags: 0)
!1577 = !DISubroutineType(types: !1578)
!1578 = !{null, !255}
!1579 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1580, file: !1464, line: 156)
!1580 = !DISubprogram(name: "fopen", linkageName: "\01_fopen", scope: !355, file: !355, line: 243, type: !1581, flags: DIFlagPrototyped, spFlags: 0)
!1581 = !DISubroutineType(types: !1582)
!1582 = !{!353, !255, !255}
!1583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1584, file: !1464, line: 157)
!1584 = !DISubprogram(name: "freopen", linkageName: "\01_freopen", scope: !355, file: !355, line: 249, type: !1585, flags: DIFlagPrototyped, spFlags: 0)
!1585 = !DISubroutineType(types: !1586)
!1586 = !{!353, !255, !255, !353}
!1587 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1588, file: !1464, line: 158)
!1588 = !DISubprogram(name: "remove", scope: !355, file: !355, line: 268, type: !881, flags: DIFlagPrototyped, spFlags: 0)
!1589 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1590, file: !1464, line: 159)
!1590 = !DISubprogram(name: "rename", scope: !355, file: !355, line: 269, type: !1365, flags: DIFlagPrototyped, spFlags: 0)
!1591 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1592, file: !1464, line: 160)
!1592 = !DISubprogram(name: "tmpfile", scope: !355, file: !355, line: 283, type: !1593, flags: DIFlagPrototyped, spFlags: 0)
!1593 = !DISubroutineType(types: !1594)
!1594 = !{!353}
!1595 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1596, file: !1464, line: 161)
!1596 = !DISubprogram(name: "tmpnam", scope: !355, file: !355, line: 289, type: !1597, flags: DIFlagPrototyped, spFlags: 0)
!1597 = !DISubroutineType(types: !1598)
!1598 = !{!380, !380}
!1599 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1600, file: !1464, line: 163)
!1600 = !DISubprogram(name: "getchar", scope: !355, file: !355, line: 257, type: !922, flags: DIFlagPrototyped, spFlags: 0)
!1601 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1602, file: !1464, line: 167)
!1602 = !DISubprogram(name: "scanf", scope: !355, file: !355, line: 271, type: !1603, flags: DIFlagPrototyped, spFlags: 0)
!1603 = !DISubroutineType(types: !1604)
!1604 = !{!7, !255, null}
!1605 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1606, file: !1464, line: 168)
!1606 = !DISubprogram(name: "vscanf", scope: !355, file: !355, line: 437, type: !1607, flags: DIFlagPrototyped, spFlags: 0)
!1607 = !DISubroutineType(types: !1608)
!1608 = !{!7, !255, !1502}
!1609 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1610, file: !1464, line: 170)
!1610 = !DISubprogram(name: "printf", scope: !1611, file: !1611, line: 34, type: !1603, flags: DIFlagPrototyped, spFlags: 0)
!1611 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_printf.h", directory: "", checksumkind: CSK_MD5, checksum: "2d37517bd0342aa326aa1d3660ad4ab4")
!1612 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1613, file: !1464, line: 171)
!1613 = !DISubprogram(name: "putchar", scope: !355, file: !355, line: 266, type: !513, flags: DIFlagPrototyped, spFlags: 0)
!1614 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1615, file: !1464, line: 172)
!1615 = !DISubprogram(name: "puts", scope: !355, file: !355, line: 267, type: !881, flags: DIFlagPrototyped, spFlags: 0)
!1616 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1617, file: !1464, line: 173)
!1617 = !DISubprogram(name: "vprintf", scope: !355, file: !355, line: 293, type: !1607, flags: DIFlagPrototyped, spFlags: 0)
!1618 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1619, file: !1646, line: 52)
!1619 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !1620, line: 46, size: 768, flags: DIFlagTypePassByValue, elements: !1621, identifier: "_ZTS5lconv")
!1620 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_locale.h", directory: "", checksumkind: CSK_MD5, checksum: "a6054df13071a4f642aabbc00435a252")
!1621 = !{!1622, !1623, !1624, !1625, !1626, !1627, !1628, !1629, !1630, !1631, !1632, !1633, !1634, !1635, !1636, !1637, !1638, !1639, !1640, !1641, !1642, !1643, !1644, !1645}
!1622 = !DIDerivedType(tag: DW_TAG_member, name: "decimal_point", scope: !1619, file: !1620, line: 47, baseType: !380, size: 64)
!1623 = !DIDerivedType(tag: DW_TAG_member, name: "thousands_sep", scope: !1619, file: !1620, line: 48, baseType: !380, size: 64, offset: 64)
!1624 = !DIDerivedType(tag: DW_TAG_member, name: "grouping", scope: !1619, file: !1620, line: 49, baseType: !380, size: 64, offset: 128)
!1625 = !DIDerivedType(tag: DW_TAG_member, name: "int_curr_symbol", scope: !1619, file: !1620, line: 50, baseType: !380, size: 64, offset: 192)
!1626 = !DIDerivedType(tag: DW_TAG_member, name: "currency_symbol", scope: !1619, file: !1620, line: 51, baseType: !380, size: 64, offset: 256)
!1627 = !DIDerivedType(tag: DW_TAG_member, name: "mon_decimal_point", scope: !1619, file: !1620, line: 52, baseType: !380, size: 64, offset: 320)
!1628 = !DIDerivedType(tag: DW_TAG_member, name: "mon_thousands_sep", scope: !1619, file: !1620, line: 53, baseType: !380, size: 64, offset: 384)
!1629 = !DIDerivedType(tag: DW_TAG_member, name: "mon_grouping", scope: !1619, file: !1620, line: 54, baseType: !380, size: 64, offset: 448)
!1630 = !DIDerivedType(tag: DW_TAG_member, name: "positive_sign", scope: !1619, file: !1620, line: 55, baseType: !380, size: 64, offset: 512)
!1631 = !DIDerivedType(tag: DW_TAG_member, name: "negative_sign", scope: !1619, file: !1620, line: 56, baseType: !380, size: 64, offset: 576)
!1632 = !DIDerivedType(tag: DW_TAG_member, name: "int_frac_digits", scope: !1619, file: !1620, line: 57, baseType: !204, size: 8, offset: 640)
!1633 = !DIDerivedType(tag: DW_TAG_member, name: "frac_digits", scope: !1619, file: !1620, line: 58, baseType: !204, size: 8, offset: 648)
!1634 = !DIDerivedType(tag: DW_TAG_member, name: "p_cs_precedes", scope: !1619, file: !1620, line: 59, baseType: !204, size: 8, offset: 656)
!1635 = !DIDerivedType(tag: DW_TAG_member, name: "p_sep_by_space", scope: !1619, file: !1620, line: 60, baseType: !204, size: 8, offset: 664)
!1636 = !DIDerivedType(tag: DW_TAG_member, name: "n_cs_precedes", scope: !1619, file: !1620, line: 61, baseType: !204, size: 8, offset: 672)
!1637 = !DIDerivedType(tag: DW_TAG_member, name: "n_sep_by_space", scope: !1619, file: !1620, line: 62, baseType: !204, size: 8, offset: 680)
!1638 = !DIDerivedType(tag: DW_TAG_member, name: "p_sign_posn", scope: !1619, file: !1620, line: 63, baseType: !204, size: 8, offset: 688)
!1639 = !DIDerivedType(tag: DW_TAG_member, name: "n_sign_posn", scope: !1619, file: !1620, line: 64, baseType: !204, size: 8, offset: 696)
!1640 = !DIDerivedType(tag: DW_TAG_member, name: "int_p_cs_precedes", scope: !1619, file: !1620, line: 65, baseType: !204, size: 8, offset: 704)
!1641 = !DIDerivedType(tag: DW_TAG_member, name: "int_n_cs_precedes", scope: !1619, file: !1620, line: 66, baseType: !204, size: 8, offset: 712)
!1642 = !DIDerivedType(tag: DW_TAG_member, name: "int_p_sep_by_space", scope: !1619, file: !1620, line: 67, baseType: !204, size: 8, offset: 720)
!1643 = !DIDerivedType(tag: DW_TAG_member, name: "int_n_sep_by_space", scope: !1619, file: !1620, line: 68, baseType: !204, size: 8, offset: 728)
!1644 = !DIDerivedType(tag: DW_TAG_member, name: "int_p_sign_posn", scope: !1619, file: !1620, line: 69, baseType: !204, size: 8, offset: 736)
!1645 = !DIDerivedType(tag: DW_TAG_member, name: "int_n_sign_posn", scope: !1619, file: !1620, line: 70, baseType: !204, size: 8, offset: 744)
!1646 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/clocale", directory: "")
!1647 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1648, file: !1646, line: 53)
!1648 = !DISubprogram(name: "setlocale", scope: !1649, file: !1649, line: 56, type: !1650, flags: DIFlagPrototyped, spFlags: 0)
!1649 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/locale.h", directory: "", checksumkind: CSK_MD5, checksum: "fcf8310e4aaf18e49a21cced49364afb")
!1650 = !DISubroutineType(types: !1651)
!1651 = !{!380, !7, !255}
!1652 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1653, file: !1646, line: 54)
!1653 = !DISubprogram(name: "localeconv", scope: !1620, file: !1620, line: 99, type: !1654, flags: DIFlagPrototyped, spFlags: 0)
!1654 = !DISubroutineType(types: !1655)
!1655 = !{!1656}
!1656 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1619, size: 64)
!1657 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !436, entity: !1658, file: !1660, line: 53)
!1658 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !1659, line: 12, baseType: !657)
!1659 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/lib/clang/20/include/__stdarg_va_list.h", directory: "", checksumkind: CSK_MD5, checksum: "7bd78a282b99fcfe41a9e3c566d14f7d")
!1660 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdarg", directory: "")
!1661 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 4]}
!1662 = !{i32 7, !"Dwarf Version", i32 5}
!1663 = !{i32 2, !"Debug Info Version", i32 3}
!1664 = !{i32 1, !"wchar_size", i32 4}
!1665 = !{i32 8, !"PIC Level", i32 2}
!1666 = !{i32 7, !"uwtable", i32 1}
!1667 = !{i32 7, !"frame-pointer", i32 1}
!1668 = !{!"Homebrew clang version 20.1.8"}
!1669 = distinct !DISubprogram(name: "init_ai_frame", linkageName: "_Z13init_ai_framev", scope: !20, file: !20, line: 242, type: !948, scopeLine: 243, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1670)
!1670 = !{}
!1671 = !DILocation(line: 266, column: 39, scope: !1669)
!1672 = !DILocation(line: 266, column: 37, scope: !1669)
!1673 = !DILocation(line: 268, column: 6, scope: !1674)
!1674 = distinct !DILexicalBlock(scope: !1669, file: !20, line: 268, column: 6)
!1675 = !DILocation(line: 268, column: 26, scope: !1674)
!1676 = !DILocation(line: 270, column: 15, scope: !1677)
!1677 = distinct !DILexicalBlock(scope: !1678, file: !20, line: 270, column: 7)
!1678 = distinct !DILexicalBlock(scope: !1674, file: !20, line: 269, column: 2)
!1679 = !DILocation(line: 270, column: 7, scope: !1677)
!1680 = !DILocation(line: 270, column: 27, scope: !1677)
!1681 = !DILocation(line: 270, column: 33, scope: !1677)
!1682 = !DILocation(line: 272, column: 26, scope: !1683)
!1683 = distinct !DILexicalBlock(scope: !1677, file: !20, line: 271, column: 3)
!1684 = !DILocation(line: 272, column: 41, scope: !1683)
!1685 = !DILocation(line: 272, column: 24, scope: !1683)
!1686 = !DILocation(line: 273, column: 26, scope: !1683)
!1687 = !DILocation(line: 273, column: 41, scope: !1683)
!1688 = !DILocation(line: 273, column: 24, scope: !1683)
!1689 = !DILocation(line: 274, column: 3, scope: !1683)
!1690 = !DILocation(line: 275, column: 2, scope: !1678)
!1691 = !DILocalVariable(name: "ab_state", scope: !1692, file: !20, line: 278, type: !7)
!1692 = distinct !DILexicalBlock(scope: !1674, file: !20, line: 277, column: 2)
!1693 = !DILocation(line: 278, column: 7, scope: !1692)
!1694 = !DILocation(line: 278, column: 18, scope: !1692)
!1695 = !DILocation(line: 278, column: 37, scope: !1692)
!1696 = !DILocation(line: 278, column: 49, scope: !1692)
!1697 = !DILocation(line: 278, column: 40, scope: !1692)
!1698 = !DILocation(line: 278, column: 67, scope: !1692)
!1699 = !DILocation(line: 278, column: 79, scope: !1692)
!1700 = !DILocation(line: 278, column: 71, scope: !1692)
!1701 = !DILocation(line: 278, column: 91, scope: !1692)
!1702 = !DILocation(line: 278, column: 97, scope: !1692)
!1703 = !DILocation(line: 278, column: 70, scope: !1692)
!1704 = !DILocation(line: 0, scope: !1692)
!1705 = !DILocation(line: 280, column: 17, scope: !1706)
!1706 = distinct !DILexicalBlock(scope: !1692, file: !20, line: 280, column: 7)
!1707 = !DILocation(line: 280, column: 9, scope: !1706)
!1708 = !DILocation(line: 280, column: 29, scope: !1706)
!1709 = !DILocation(line: 280, column: 35, scope: !1706)
!1710 = !DILocation(line: 280, column: 8, scope: !1706)
!1711 = !DILocation(line: 280, column: 59, scope: !1706)
!1712 = !DILocation(line: 280, column: 71, scope: !1706)
!1713 = !DILocation(line: 280, column: 63, scope: !1706)
!1714 = !DILocation(line: 280, column: 83, scope: !1706)
!1715 = !DILocation(line: 280, column: 89, scope: !1706)
!1716 = !DILocation(line: 280, column: 62, scope: !1706)
!1717 = !DILocation(line: 280, column: 118, scope: !1706)
!1718 = !DILocation(line: 280, column: 121, scope: !1706)
!1719 = !DILocation(line: 281, column: 4, scope: !1720)
!1720 = distinct !DILexicalBlock(scope: !1706, file: !20, line: 280, column: 131)
!1721 = !DILocation(line: 282, column: 3, scope: !1720)
!1722 = !DILocation(line: 285, column: 1, scope: !1669)
!1723 = distinct !DISubprogram(name: "ai_do_cloak_stuff", linkageName: "_Z17ai_do_cloak_stuffv", scope: !20, file: !20, line: 1973, type: !948, scopeLine: 1974, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1670)
!1724 = !DILocalVariable(name: "i", scope: !1723, file: !20, line: 1975, type: !7)
!1725 = !DILocation(line: 1975, column: 6, scope: !1723)
!1726 = !DILocation(line: 1977, column: 9, scope: !1727)
!1727 = distinct !DILexicalBlock(scope: !1723, file: !20, line: 1977, column: 2)
!1728 = !DILocation(line: 1977, column: 7, scope: !1727)
!1729 = !DILocation(line: 1977, column: 14, scope: !1730)
!1730 = distinct !DILexicalBlock(scope: !1727, file: !20, line: 1977, column: 2)
!1731 = !DILocation(line: 1977, column: 16, scope: !1730)
!1732 = !DILocation(line: 1977, column: 2, scope: !1727)
!1733 = !DILocation(line: 1978, column: 36, scope: !1734)
!1734 = distinct !DILexicalBlock(scope: !1730, file: !20, line: 1977, column: 42)
!1735 = !DILocation(line: 1978, column: 51, scope: !1734)
!1736 = !DILocation(line: 1978, column: 17, scope: !1734)
!1737 = !DILocation(line: 1978, column: 3, scope: !1734)
!1738 = !DILocation(line: 1978, column: 20, scope: !1734)
!1739 = !DILocation(line: 1978, column: 34, scope: !1734)
!1740 = !DILocation(line: 1979, column: 35, scope: !1734)
!1741 = !DILocation(line: 1979, column: 50, scope: !1734)
!1742 = !DILocation(line: 1979, column: 17, scope: !1734)
!1743 = !DILocation(line: 1979, column: 3, scope: !1734)
!1744 = !DILocation(line: 1979, column: 20, scope: !1734)
!1745 = !DILocation(line: 1979, column: 33, scope: !1734)
!1746 = !DILocation(line: 1980, column: 32, scope: !1734)
!1747 = !DILocation(line: 1980, column: 17, scope: !1734)
!1748 = !DILocation(line: 1980, column: 3, scope: !1734)
!1749 = !DILocation(line: 1980, column: 20, scope: !1734)
!1750 = !DILocation(line: 1980, column: 30, scope: !1734)
!1751 = !DILocation(line: 1981, column: 2, scope: !1734)
!1752 = !DILocation(line: 1977, column: 38, scope: !1730)
!1753 = !DILocation(line: 1977, column: 2, scope: !1730)
!1754 = distinct !{!1754, !1732, !1755, !1756}
!1755 = !DILocation(line: 1981, column: 2, scope: !1727)
!1756 = !{!"llvm.loop.mustprogress"}
!1757 = !DILocation(line: 1984, column: 22, scope: !1723)
!1758 = !DILocation(line: 1985, column: 41, scope: !1723)
!1759 = !DILocation(line: 1985, column: 22, scope: !1723)
!1760 = !DILocation(line: 1987, column: 1, scope: !1723)
!1761 = distinct !DISubprogram(name: "ready_to_fire", linkageName: "_Z13ready_to_fireP10robot_infoP8ai_local", scope: !20, file: !20, line: 291, type: !1762, scopeLine: 292, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1670)
!1762 = !DISubroutineType(types: !1763)
!1763 = !{!7, !1764, !1833}
!1764 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1765, size: 64)
!1765 = !DIDerivedType(tag: DW_TAG_typedef, name: "robot_info", file: !1766, line: 128, baseType: !1767)
!1766 = !DIFile(filename: "main_d2/robot.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "7821ab73cbe058734a84802231002e5e")
!1767 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "robot_info", file: !1766, line: 53, size: 3840, flags: DIFlagTypePassByValue, elements: !1768, identifier: "_ZTS10robot_info")
!1768 = !{!1769, !1770, !1772, !1773, !1774, !1775, !1776, !1777, !1778, !1779, !1780, !1781, !1782, !1783, !1784, !1785, !1786, !1787, !1788, !1789, !1790, !1791, !1792, !1795, !1796, !1797, !1798, !1799, !1800, !1802, !1803, !1804, !1805, !1806, !1807, !1808, !1809, !1810, !1811, !1812, !1813, !1814, !1815, !1816, !1817, !1818, !1820, !1821, !1822, !1823, !1824, !1832}
!1769 = !DIDerivedType(tag: DW_TAG_member, name: "model_num", scope: !1767, file: !1766, line: 55, baseType: !7, size: 32)
!1770 = !DIDerivedType(tag: DW_TAG_member, name: "gun_points", scope: !1767, file: !1766, line: 56, baseType: !1771, size: 768, offset: 32)
!1771 = !DICompositeType(tag: DW_TAG_array_type, baseType: !77, size: 768, elements: !98)
!1772 = !DIDerivedType(tag: DW_TAG_member, name: "gun_submodels", scope: !1767, file: !1766, line: 57, baseType: !135, size: 64, offset: 800)
!1773 = !DIDerivedType(tag: DW_TAG_member, name: "exp1_vclip_num", scope: !1767, file: !1766, line: 59, baseType: !55, size: 16, offset: 864)
!1774 = !DIDerivedType(tag: DW_TAG_member, name: "exp1_sound_num", scope: !1767, file: !1766, line: 60, baseType: !55, size: 16, offset: 880)
!1775 = !DIDerivedType(tag: DW_TAG_member, name: "exp2_vclip_num", scope: !1767, file: !1766, line: 62, baseType: !55, size: 16, offset: 896)
!1776 = !DIDerivedType(tag: DW_TAG_member, name: "exp2_sound_num", scope: !1767, file: !1766, line: 63, baseType: !55, size: 16, offset: 912)
!1777 = !DIDerivedType(tag: DW_TAG_member, name: "weapon_type", scope: !1767, file: !1766, line: 65, baseType: !63, size: 8, offset: 928)
!1778 = !DIDerivedType(tag: DW_TAG_member, name: "weapon_type2", scope: !1767, file: !1766, line: 66, baseType: !63, size: 8, offset: 936)
!1779 = !DIDerivedType(tag: DW_TAG_member, name: "n_guns", scope: !1767, file: !1766, line: 67, baseType: !63, size: 8, offset: 944)
!1780 = !DIDerivedType(tag: DW_TAG_member, name: "contains_id", scope: !1767, file: !1766, line: 68, baseType: !63, size: 8, offset: 952)
!1781 = !DIDerivedType(tag: DW_TAG_member, name: "contains_count", scope: !1767, file: !1766, line: 70, baseType: !63, size: 8, offset: 960)
!1782 = !DIDerivedType(tag: DW_TAG_member, name: "contains_prob", scope: !1767, file: !1766, line: 71, baseType: !63, size: 8, offset: 968)
!1783 = !DIDerivedType(tag: DW_TAG_member, name: "contains_type", scope: !1767, file: !1766, line: 72, baseType: !63, size: 8, offset: 976)
!1784 = !DIDerivedType(tag: DW_TAG_member, name: "kamikaze", scope: !1767, file: !1766, line: 73, baseType: !63, size: 8, offset: 984)
!1785 = !DIDerivedType(tag: DW_TAG_member, name: "score_value", scope: !1767, file: !1766, line: 75, baseType: !55, size: 16, offset: 992)
!1786 = !DIDerivedType(tag: DW_TAG_member, name: "badass", scope: !1767, file: !1766, line: 76, baseType: !63, size: 8, offset: 1008)
!1787 = !DIDerivedType(tag: DW_TAG_member, name: "energy_drain", scope: !1767, file: !1766, line: 77, baseType: !63, size: 8, offset: 1016)
!1788 = !DIDerivedType(tag: DW_TAG_member, name: "lighting", scope: !1767, file: !1766, line: 79, baseType: !36, size: 32, offset: 1024)
!1789 = !DIDerivedType(tag: DW_TAG_member, name: "strength", scope: !1767, file: !1766, line: 80, baseType: !36, size: 32, offset: 1056)
!1790 = !DIDerivedType(tag: DW_TAG_member, name: "mass", scope: !1767, file: !1766, line: 82, baseType: !36, size: 32, offset: 1088)
!1791 = !DIDerivedType(tag: DW_TAG_member, name: "drag", scope: !1767, file: !1766, line: 83, baseType: !36, size: 32, offset: 1120)
!1792 = !DIDerivedType(tag: DW_TAG_member, name: "field_of_view", scope: !1767, file: !1766, line: 85, baseType: !1793, size: 160, offset: 1152)
!1793 = !DICompositeType(tag: DW_TAG_array_type, baseType: !36, size: 160, elements: !1794)
!1794 = !{!266}
!1795 = !DIDerivedType(tag: DW_TAG_member, name: "firing_wait", scope: !1767, file: !1766, line: 86, baseType: !1793, size: 160, offset: 1312)
!1796 = !DIDerivedType(tag: DW_TAG_member, name: "firing_wait2", scope: !1767, file: !1766, line: 87, baseType: !1793, size: 160, offset: 1472)
!1797 = !DIDerivedType(tag: DW_TAG_member, name: "turn_time", scope: !1767, file: !1766, line: 88, baseType: !1793, size: 160, offset: 1632)
!1798 = !DIDerivedType(tag: DW_TAG_member, name: "max_speed", scope: !1767, file: !1766, line: 91, baseType: !1793, size: 160, offset: 1792)
!1799 = !DIDerivedType(tag: DW_TAG_member, name: "circle_distance", scope: !1767, file: !1766, line: 92, baseType: !1793, size: 160, offset: 1952)
!1800 = !DIDerivedType(tag: DW_TAG_member, name: "rapidfire_count", scope: !1767, file: !1766, line: 94, baseType: !1801, size: 40, offset: 2112)
!1801 = !DICompositeType(tag: DW_TAG_array_type, baseType: !63, size: 40, elements: !1794)
!1802 = !DIDerivedType(tag: DW_TAG_member, name: "evade_speed", scope: !1767, file: !1766, line: 95, baseType: !1801, size: 40, offset: 2152)
!1803 = !DIDerivedType(tag: DW_TAG_member, name: "cloak_type", scope: !1767, file: !1766, line: 96, baseType: !63, size: 8, offset: 2192)
!1804 = !DIDerivedType(tag: DW_TAG_member, name: "attack_type", scope: !1767, file: !1766, line: 97, baseType: !63, size: 8, offset: 2200)
!1805 = !DIDerivedType(tag: DW_TAG_member, name: "see_sound", scope: !1767, file: !1766, line: 99, baseType: !136, size: 8, offset: 2208)
!1806 = !DIDerivedType(tag: DW_TAG_member, name: "attack_sound", scope: !1767, file: !1766, line: 100, baseType: !136, size: 8, offset: 2216)
!1807 = !DIDerivedType(tag: DW_TAG_member, name: "claw_sound", scope: !1767, file: !1766, line: 101, baseType: !136, size: 8, offset: 2224)
!1808 = !DIDerivedType(tag: DW_TAG_member, name: "taunt_sound", scope: !1767, file: !1766, line: 102, baseType: !136, size: 8, offset: 2232)
!1809 = !DIDerivedType(tag: DW_TAG_member, name: "boss_flag", scope: !1767, file: !1766, line: 104, baseType: !63, size: 8, offset: 2240)
!1810 = !DIDerivedType(tag: DW_TAG_member, name: "companion", scope: !1767, file: !1766, line: 105, baseType: !63, size: 8, offset: 2248)
!1811 = !DIDerivedType(tag: DW_TAG_member, name: "smart_blobs", scope: !1767, file: !1766, line: 106, baseType: !63, size: 8, offset: 2256)
!1812 = !DIDerivedType(tag: DW_TAG_member, name: "energy_blobs", scope: !1767, file: !1766, line: 107, baseType: !63, size: 8, offset: 2264)
!1813 = !DIDerivedType(tag: DW_TAG_member, name: "thief", scope: !1767, file: !1766, line: 109, baseType: !63, size: 8, offset: 2272)
!1814 = !DIDerivedType(tag: DW_TAG_member, name: "pursuit", scope: !1767, file: !1766, line: 110, baseType: !63, size: 8, offset: 2280)
!1815 = !DIDerivedType(tag: DW_TAG_member, name: "lightcast", scope: !1767, file: !1766, line: 111, baseType: !63, size: 8, offset: 2288)
!1816 = !DIDerivedType(tag: DW_TAG_member, name: "death_roll", scope: !1767, file: !1766, line: 112, baseType: !63, size: 8, offset: 2296)
!1817 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !1767, file: !1766, line: 115, baseType: !136, size: 8, offset: 2304)
!1818 = !DIDerivedType(tag: DW_TAG_member, name: "pad", scope: !1767, file: !1766, line: 116, baseType: !1819, size: 24, offset: 2312)
!1819 = !DICompositeType(tag: DW_TAG_array_type, baseType: !136, size: 24, elements: !401)
!1820 = !DIDerivedType(tag: DW_TAG_member, name: "deathroll_sound", scope: !1767, file: !1766, line: 118, baseType: !136, size: 8, offset: 2336)
!1821 = !DIDerivedType(tag: DW_TAG_member, name: "glow", scope: !1767, file: !1766, line: 119, baseType: !136, size: 8, offset: 2344)
!1822 = !DIDerivedType(tag: DW_TAG_member, name: "behavior", scope: !1767, file: !1766, line: 120, baseType: !136, size: 8, offset: 2352)
!1823 = !DIDerivedType(tag: DW_TAG_member, name: "aim", scope: !1767, file: !1766, line: 121, baseType: !136, size: 8, offset: 2360)
!1824 = !DIDerivedType(tag: DW_TAG_member, name: "anim_states", scope: !1767, file: !1766, line: 124, baseType: !1825, size: 1440, offset: 2368)
!1825 = !DICompositeType(tag: DW_TAG_array_type, baseType: !1826, size: 1440, elements: !1831)
!1826 = !DIDerivedType(tag: DW_TAG_typedef, name: "jointlist", file: !1766, line: 46, baseType: !1827)
!1827 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "jointlist", file: !1766, line: 42, size: 32, flags: DIFlagTypePassByValue, elements: !1828, identifier: "_ZTS9jointlist")
!1828 = !{!1829, !1830}
!1829 = !DIDerivedType(tag: DW_TAG_member, name: "n_joints", scope: !1827, file: !1766, line: 44, baseType: !55, size: 16)
!1830 = !DIDerivedType(tag: DW_TAG_member, name: "offset", scope: !1827, file: !1766, line: 45, baseType: !55, size: 16, offset: 16)
!1831 = !{!216, !266}
!1832 = !DIDerivedType(tag: DW_TAG_member, name: "always_0xabcd", scope: !1767, file: !1766, line: 126, baseType: !7, size: 32, offset: 3808)
!1833 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!1834 = !DILocalVariable(name: "robptr", arg: 1, scope: !1761, file: !20, line: 291, type: !1764)
!1835 = !DILocation(line: 291, column: 31, scope: !1761)
!1836 = !DILocalVariable(name: "ailp", arg: 2, scope: !1761, file: !20, line: 291, type: !1833)
!1837 = !DILocation(line: 291, column: 49, scope: !1761)
!1838 = !DILocation(line: 293, column: 6, scope: !1839)
!1839 = distinct !DILexicalBlock(scope: !1761, file: !20, line: 293, column: 6)
!1840 = !DILocation(line: 293, column: 14, scope: !1839)
!1841 = !DILocation(line: 293, column: 27, scope: !1839)
!1842 = !DILocation(line: 294, column: 11, scope: !1839)
!1843 = !DILocation(line: 294, column: 17, scope: !1839)
!1844 = !DILocation(line: 294, column: 27, scope: !1839)
!1845 = !DILocation(line: 294, column: 33, scope: !1839)
!1846 = !DILocation(line: 294, column: 37, scope: !1839)
!1847 = !DILocation(line: 294, column: 43, scope: !1839)
!1848 = !DILocation(line: 294, column: 54, scope: !1839)
!1849 = !DILocation(line: 294, column: 10, scope: !1839)
!1850 = !DILocation(line: 294, column: 3, scope: !1839)
!1851 = !DILocation(line: 296, column: 11, scope: !1839)
!1852 = !DILocation(line: 296, column: 17, scope: !1839)
!1853 = !DILocation(line: 296, column: 27, scope: !1839)
!1854 = !DILocation(line: 296, column: 10, scope: !1839)
!1855 = !DILocation(line: 296, column: 3, scope: !1839)
!1856 = !DILocation(line: 297, column: 1, scope: !1761)
!1857 = distinct !DISubprogram(name: "make_nearby_robot_snipe", linkageName: "_Z23make_nearby_robot_snipev", scope: !20, file: !20, line: 302, type: !948, scopeLine: 303, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1670)
!1858 = !DILocalVariable(name: "bfs_length", scope: !1857, file: !20, line: 304, type: !7)
!1859 = !DILocation(line: 304, column: 6, scope: !1857)
!1860 = !DILocalVariable(name: "i", scope: !1857, file: !20, line: 304, type: !7)
!1861 = !DILocation(line: 304, column: 18, scope: !1857)
!1862 = !DILocalVariable(name: "bfs_list", scope: !1857, file: !20, line: 305, type: !1863)
!1863 = !DICompositeType(tag: DW_TAG_array_type, baseType: !55, size: 1120, elements: !1864)
!1864 = !{!1865}
!1865 = !DISubrange(count: 70)
!1866 = !DILocation(line: 305, column: 8, scope: !1857)
!1867 = !DILocation(line: 307, column: 18, scope: !1857)
!1868 = !DILocation(line: 307, column: 33, scope: !1857)
!1869 = !DILocation(line: 307, column: 41, scope: !1857)
!1870 = !DILocation(line: 307, column: 2, scope: !1857)
!1871 = !DILocation(line: 309, column: 9, scope: !1872)
!1872 = distinct !DILexicalBlock(scope: !1857, file: !20, line: 309, column: 2)
!1873 = !DILocation(line: 309, column: 7, scope: !1872)
!1874 = !DILocation(line: 309, column: 14, scope: !1875)
!1875 = distinct !DILexicalBlock(scope: !1872, file: !20, line: 309, column: 2)
!1876 = !DILocation(line: 309, column: 18, scope: !1875)
!1877 = !DILocation(line: 309, column: 16, scope: !1875)
!1878 = !DILocation(line: 309, column: 2, scope: !1872)
!1879 = !DILocalVariable(name: "objnum", scope: !1880, file: !20, line: 310, type: !7)
!1880 = distinct !DILexicalBlock(scope: !1875, file: !20, line: 309, column: 35)
!1881 = !DILocation(line: 310, column: 7, scope: !1880)
!1882 = !DILocation(line: 310, column: 34, scope: !1880)
!1883 = !DILocation(line: 310, column: 25, scope: !1880)
!1884 = !DILocation(line: 310, column: 16, scope: !1880)
!1885 = !DILocation(line: 310, column: 38, scope: !1880)
!1886 = !DILocation(line: 311, column: 3, scope: !1880)
!1887 = !DILocation(line: 311, column: 10, scope: !1880)
!1888 = !DILocation(line: 311, column: 17, scope: !1880)
!1889 = !DILocalVariable(name: "objp", scope: !1890, file: !20, line: 312, type: !1891)
!1890 = distinct !DILexicalBlock(scope: !1880, file: !20, line: 311, column: 24)
!1891 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1892, size: 64)
!1892 = !DIDerivedType(tag: DW_TAG_typedef, name: "object", file: !1893, line: 259, baseType: !1894)
!1893 = !DIFile(filename: "main_d2/object.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "1f2325d356aae4b692933d2aae4f3afd")
!1894 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "object", file: !1893, line: 210, size: 2144, flags: DIFlagTypePassByValue, elements: !1895, identifier: "_ZTS6object")
!1895 = !{!1896, !1897, !1898, !1899, !1900, !1901, !1902, !1903, !1904, !1905, !1906, !1907, !1908, !1915, !1916, !1917, !1918, !1919, !1920, !1921, !1922, !1923, !1940, !1991}
!1896 = !DIDerivedType(tag: DW_TAG_member, name: "signature", scope: !1894, file: !1893, line: 212, baseType: !7, size: 32)
!1897 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !1894, file: !1893, line: 213, baseType: !136, size: 8, offset: 32)
!1898 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !1894, file: !1893, line: 214, baseType: !136, size: 8, offset: 40)
!1899 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !1894, file: !1893, line: 215, baseType: !55, size: 16, offset: 48)
!1900 = !DIDerivedType(tag: DW_TAG_member, name: "prev", scope: !1894, file: !1893, line: 215, baseType: !55, size: 16, offset: 64)
!1901 = !DIDerivedType(tag: DW_TAG_member, name: "control_type", scope: !1894, file: !1893, line: 216, baseType: !136, size: 8, offset: 80)
!1902 = !DIDerivedType(tag: DW_TAG_member, name: "movement_type", scope: !1894, file: !1893, line: 217, baseType: !136, size: 8, offset: 88)
!1903 = !DIDerivedType(tag: DW_TAG_member, name: "render_type", scope: !1894, file: !1893, line: 218, baseType: !136, size: 8, offset: 96)
!1904 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !1894, file: !1893, line: 219, baseType: !136, size: 8, offset: 104)
!1905 = !DIDerivedType(tag: DW_TAG_member, name: "segnum", scope: !1894, file: !1893, line: 220, baseType: !55, size: 16, offset: 112)
!1906 = !DIDerivedType(tag: DW_TAG_member, name: "attached_obj", scope: !1894, file: !1893, line: 221, baseType: !55, size: 16, offset: 128)
!1907 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !1894, file: !1893, line: 222, baseType: !77, size: 96, offset: 160)
!1908 = !DIDerivedType(tag: DW_TAG_member, name: "orient", scope: !1894, file: !1893, line: 223, baseType: !1909, size: 288, offset: 256)
!1909 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_matrix", file: !50, line: 47, baseType: !1910)
!1910 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_matrix", file: !50, line: 44, size: 288, flags: DIFlagTypePassByValue, elements: !1911, identifier: "_ZTS10vms_matrix")
!1911 = !{!1912, !1913, !1914}
!1912 = !DIDerivedType(tag: DW_TAG_member, name: "rvec", scope: !1910, file: !50, line: 46, baseType: !77, size: 96)
!1913 = !DIDerivedType(tag: DW_TAG_member, name: "uvec", scope: !1910, file: !50, line: 46, baseType: !77, size: 96, offset: 96)
!1914 = !DIDerivedType(tag: DW_TAG_member, name: "fvec", scope: !1910, file: !50, line: 46, baseType: !77, size: 96, offset: 192)
!1915 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !1894, file: !1893, line: 224, baseType: !36, size: 32, offset: 544)
!1916 = !DIDerivedType(tag: DW_TAG_member, name: "shields", scope: !1894, file: !1893, line: 225, baseType: !36, size: 32, offset: 576)
!1917 = !DIDerivedType(tag: DW_TAG_member, name: "last_pos", scope: !1894, file: !1893, line: 226, baseType: !77, size: 96, offset: 608)
!1918 = !DIDerivedType(tag: DW_TAG_member, name: "contains_type", scope: !1894, file: !1893, line: 227, baseType: !63, size: 8, offset: 704)
!1919 = !DIDerivedType(tag: DW_TAG_member, name: "contains_id", scope: !1894, file: !1893, line: 228, baseType: !63, size: 8, offset: 712)
!1920 = !DIDerivedType(tag: DW_TAG_member, name: "contains_count", scope: !1894, file: !1893, line: 229, baseType: !63, size: 8, offset: 720)
!1921 = !DIDerivedType(tag: DW_TAG_member, name: "matcen_creator", scope: !1894, file: !1893, line: 230, baseType: !63, size: 8, offset: 728)
!1922 = !DIDerivedType(tag: DW_TAG_member, name: "lifeleft", scope: !1894, file: !1893, line: 231, baseType: !36, size: 32, offset: 736)
!1923 = !DIDerivedType(tag: DW_TAG_member, name: "mtype", scope: !1894, file: !1893, line: 240, baseType: !1924, size: 512, offset: 768)
!1924 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !1894, file: !1893, line: 236, size: 512, flags: DIFlagTypePassByValue, elements: !1925, identifier: "_ZTSN6objectUt_E")
!1925 = !{!1926, !1939}
!1926 = !DIDerivedType(tag: DW_TAG_member, name: "phys_info", scope: !1924, file: !1893, line: 238, baseType: !1927, size: 512)
!1927 = !DIDerivedType(tag: DW_TAG_typedef, name: "physics_info", file: !1893, line: 153, baseType: !1928)
!1928 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "physics_info", file: !1893, line: 142, size: 512, flags: DIFlagTypePassByValue, elements: !1929, identifier: "_ZTS12physics_info")
!1929 = !{!1930, !1931, !1932, !1933, !1934, !1935, !1936, !1937, !1938}
!1930 = !DIDerivedType(tag: DW_TAG_member, name: "velocity", scope: !1928, file: !1893, line: 144, baseType: !77, size: 96)
!1931 = !DIDerivedType(tag: DW_TAG_member, name: "thrust", scope: !1928, file: !1893, line: 145, baseType: !77, size: 96, offset: 96)
!1932 = !DIDerivedType(tag: DW_TAG_member, name: "mass", scope: !1928, file: !1893, line: 146, baseType: !36, size: 32, offset: 192)
!1933 = !DIDerivedType(tag: DW_TAG_member, name: "drag", scope: !1928, file: !1893, line: 147, baseType: !36, size: 32, offset: 224)
!1934 = !DIDerivedType(tag: DW_TAG_member, name: "brakes", scope: !1928, file: !1893, line: 148, baseType: !36, size: 32, offset: 256)
!1935 = !DIDerivedType(tag: DW_TAG_member, name: "rotvel", scope: !1928, file: !1893, line: 149, baseType: !77, size: 96, offset: 288)
!1936 = !DIDerivedType(tag: DW_TAG_member, name: "rotthrust", scope: !1928, file: !1893, line: 150, baseType: !77, size: 96, offset: 384)
!1937 = !DIDerivedType(tag: DW_TAG_member, name: "turnroll", scope: !1928, file: !1893, line: 151, baseType: !54, size: 16, offset: 480)
!1938 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !1928, file: !1893, line: 152, baseType: !446, size: 16, offset: 496)
!1939 = !DIDerivedType(tag: DW_TAG_member, name: "spin_rate", scope: !1924, file: !1893, line: 239, baseType: !77, size: 96)
!1940 = !DIDerivedType(tag: DW_TAG_member, name: "ctype", scope: !1894, file: !1893, line: 250, baseType: !1941, size: 256, offset: 1280)
!1941 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !1894, file: !1893, line: 243, size: 256, flags: DIFlagTypePassByValue, elements: !1942, identifier: "_ZTSN6objectUt0_E")
!1942 = !{!1943, !1954, !1964, !1979, !1984}
!1943 = !DIDerivedType(tag: DW_TAG_member, name: "laser_info", scope: !1941, file: !1893, line: 245, baseType: !1944, size: 160)
!1944 = !DIDerivedType(tag: DW_TAG_typedef, name: "laser_info_t", file: !1893, line: 166, baseType: !1945)
!1945 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "laser_info_s", file: !1893, line: 157, size: 160, flags: DIFlagTypePassByValue, elements: !1946, identifier: "_ZTS12laser_info_s")
!1946 = !{!1947, !1948, !1949, !1950, !1951, !1952, !1953}
!1947 = !DIDerivedType(tag: DW_TAG_member, name: "parent_type", scope: !1945, file: !1893, line: 159, baseType: !55, size: 16)
!1948 = !DIDerivedType(tag: DW_TAG_member, name: "parent_num", scope: !1945, file: !1893, line: 160, baseType: !55, size: 16, offset: 16)
!1949 = !DIDerivedType(tag: DW_TAG_member, name: "parent_signature", scope: !1945, file: !1893, line: 161, baseType: !7, size: 32, offset: 32)
!1950 = !DIDerivedType(tag: DW_TAG_member, name: "creation_time", scope: !1945, file: !1893, line: 162, baseType: !36, size: 32, offset: 64)
!1951 = !DIDerivedType(tag: DW_TAG_member, name: "last_hitobj", scope: !1945, file: !1893, line: 163, baseType: !55, size: 16, offset: 96)
!1952 = !DIDerivedType(tag: DW_TAG_member, name: "track_goal", scope: !1945, file: !1893, line: 164, baseType: !55, size: 16, offset: 112)
!1953 = !DIDerivedType(tag: DW_TAG_member, name: "multiplier", scope: !1945, file: !1893, line: 165, baseType: !36, size: 32, offset: 128)
!1954 = !DIDerivedType(tag: DW_TAG_member, name: "expl_info", scope: !1941, file: !1893, line: 246, baseType: !1955, size: 128)
!1955 = !DIDerivedType(tag: DW_TAG_typedef, name: "explosion_info", file: !1893, line: 176, baseType: !1956)
!1956 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "explosion_info", file: !1893, line: 168, size: 128, flags: DIFlagTypePassByValue, elements: !1957, identifier: "_ZTS14explosion_info")
!1957 = !{!1958, !1959, !1960, !1961, !1962, !1963}
!1958 = !DIDerivedType(tag: DW_TAG_member, name: "spawn_time", scope: !1956, file: !1893, line: 170, baseType: !36, size: 32)
!1959 = !DIDerivedType(tag: DW_TAG_member, name: "delete_time", scope: !1956, file: !1893, line: 171, baseType: !36, size: 32, offset: 32)
!1960 = !DIDerivedType(tag: DW_TAG_member, name: "delete_objnum", scope: !1956, file: !1893, line: 172, baseType: !55, size: 16, offset: 64)
!1961 = !DIDerivedType(tag: DW_TAG_member, name: "attach_parent", scope: !1956, file: !1893, line: 173, baseType: !55, size: 16, offset: 80)
!1962 = !DIDerivedType(tag: DW_TAG_member, name: "prev_attach", scope: !1956, file: !1893, line: 174, baseType: !55, size: 16, offset: 96)
!1963 = !DIDerivedType(tag: DW_TAG_member, name: "next_attach", scope: !1956, file: !1893, line: 175, baseType: !55, size: 16, offset: 112)
!1964 = !DIDerivedType(tag: DW_TAG_member, name: "ai_info", scope: !1941, file: !1893, line: 247, baseType: !1965, size: 256)
!1965 = !DIDerivedType(tag: DW_TAG_typedef, name: "ai_static", file: !25, line: 144, baseType: !1966)
!1966 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ai_static", file: !25, line: 127, size: 256, flags: DIFlagTypePassByValue, elements: !1967, identifier: "_ZTS9ai_static")
!1967 = !{!1968, !1969, !1971, !1972, !1973, !1974, !1975, !1976, !1977, !1978}
!1968 = !DIDerivedType(tag: DW_TAG_member, name: "behavior", scope: !1966, file: !25, line: 128, baseType: !136, size: 8)
!1969 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !1966, file: !25, line: 129, baseType: !1970, size: 88, offset: 8)
!1970 = !DICompositeType(tag: DW_TAG_array_type, baseType: !63, size: 88, elements: !248)
!1971 = !DIDerivedType(tag: DW_TAG_member, name: "hide_segment", scope: !1966, file: !25, line: 130, baseType: !55, size: 16, offset: 96)
!1972 = !DIDerivedType(tag: DW_TAG_member, name: "hide_index", scope: !1966, file: !25, line: 131, baseType: !55, size: 16, offset: 112)
!1973 = !DIDerivedType(tag: DW_TAG_member, name: "path_length", scope: !1966, file: !25, line: 132, baseType: !55, size: 16, offset: 128)
!1974 = !DIDerivedType(tag: DW_TAG_member, name: "cur_path_index", scope: !1966, file: !25, line: 133, baseType: !63, size: 8, offset: 144)
!1975 = !DIDerivedType(tag: DW_TAG_member, name: "dying_sound_playing", scope: !1966, file: !25, line: 134, baseType: !63, size: 8, offset: 152)
!1976 = !DIDerivedType(tag: DW_TAG_member, name: "danger_laser_num", scope: !1966, file: !25, line: 139, baseType: !55, size: 16, offset: 160)
!1977 = !DIDerivedType(tag: DW_TAG_member, name: "danger_laser_signature", scope: !1966, file: !25, line: 140, baseType: !7, size: 32, offset: 192)
!1978 = !DIDerivedType(tag: DW_TAG_member, name: "dying_start_time", scope: !1966, file: !25, line: 141, baseType: !36, size: 32, offset: 224)
!1979 = !DIDerivedType(tag: DW_TAG_member, name: "light_info", scope: !1941, file: !1893, line: 248, baseType: !1980, size: 32)
!1980 = !DIDerivedType(tag: DW_TAG_typedef, name: "light_info_t", file: !1893, line: 181, baseType: !1981)
!1981 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "light_info_s", file: !1893, line: 178, size: 32, flags: DIFlagTypePassByValue, elements: !1982, identifier: "_ZTS12light_info_s")
!1982 = !{!1983}
!1983 = !DIDerivedType(tag: DW_TAG_member, name: "intensity", scope: !1981, file: !1893, line: 180, baseType: !36, size: 32)
!1984 = !DIDerivedType(tag: DW_TAG_member, name: "powerup_info", scope: !1941, file: !1893, line: 249, baseType: !1985, size: 96)
!1985 = !DIDerivedType(tag: DW_TAG_typedef, name: "powerup_info_t", file: !1893, line: 190, baseType: !1986)
!1986 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "powerup_info_s", file: !1893, line: 185, size: 96, flags: DIFlagTypePassByValue, elements: !1987, identifier: "_ZTS14powerup_info_s")
!1987 = !{!1988, !1989, !1990}
!1988 = !DIDerivedType(tag: DW_TAG_member, name: "count", scope: !1986, file: !1893, line: 187, baseType: !7, size: 32)
!1989 = !DIDerivedType(tag: DW_TAG_member, name: "creation_time", scope: !1986, file: !1893, line: 188, baseType: !36, size: 32, offset: 32)
!1990 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !1986, file: !1893, line: 189, baseType: !7, size: 32, offset: 64)
!1991 = !DIDerivedType(tag: DW_TAG_member, name: "rtype", scope: !1894, file: !1893, line: 257, baseType: !1992, size: 608, offset: 1536)
!1992 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !1894, file: !1893, line: 253, size: 608, flags: DIFlagTypePassByValue, elements: !1993, identifier: "_ZTSN6objectUt1_E")
!1993 = !{!1994, !2003}
!1994 = !DIDerivedType(tag: DW_TAG_member, name: "pobj_info", scope: !1992, file: !1893, line: 255, baseType: !1995, size: 608)
!1995 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyobj_info", file: !1893, line: 208, baseType: !1996)
!1996 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "polyobj_info", file: !1893, line: 201, size: 608, flags: DIFlagTypePassByValue, elements: !1997, identifier: "_ZTS12polyobj_info")
!1997 = !{!1998, !1999, !2000, !2001, !2002}
!1998 = !DIDerivedType(tag: DW_TAG_member, name: "model_num", scope: !1996, file: !1893, line: 203, baseType: !7, size: 32)
!1999 = !DIDerivedType(tag: DW_TAG_member, name: "anim_angles", scope: !1996, file: !1893, line: 204, baseType: !48, size: 480, offset: 32)
!2000 = !DIDerivedType(tag: DW_TAG_member, name: "subobj_flags", scope: !1996, file: !1893, line: 205, baseType: !7, size: 32, offset: 512)
!2001 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_override", scope: !1996, file: !1893, line: 206, baseType: !7, size: 32, offset: 544)
!2002 = !DIDerivedType(tag: DW_TAG_member, name: "alt_textures", scope: !1996, file: !1893, line: 207, baseType: !7, size: 32, offset: 576)
!2003 = !DIDerivedType(tag: DW_TAG_member, name: "vclip_info", scope: !1992, file: !1893, line: 256, baseType: !2004, size: 96)
!2004 = !DIDerivedType(tag: DW_TAG_typedef, name: "vclip_info_t", file: !1893, line: 197, baseType: !2005)
!2005 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vclip_info_s", file: !1893, line: 192, size: 96, flags: DIFlagTypePassByValue, elements: !2006, identifier: "_ZTS12vclip_info_s")
!2006 = !{!2007, !2008, !2009}
!2007 = !DIDerivedType(tag: DW_TAG_member, name: "vclip_num", scope: !2005, file: !1893, line: 194, baseType: !7, size: 32)
!2008 = !DIDerivedType(tag: DW_TAG_member, name: "frametime", scope: !2005, file: !1893, line: 195, baseType: !36, size: 32, offset: 32)
!2009 = !DIDerivedType(tag: DW_TAG_member, name: "framenum", scope: !2005, file: !1893, line: 196, baseType: !63, size: 8, offset: 64)
!2010 = !DILocation(line: 312, column: 12, scope: !1890)
!2011 = !DILocation(line: 312, column: 28, scope: !1890)
!2012 = !DILocation(line: 312, column: 20, scope: !1890)
!2013 = !DILocalVariable(name: "robptr", scope: !1890, file: !20, line: 313, type: !1764)
!2014 = !DILocation(line: 313, column: 16, scope: !1890)
!2015 = !DILocation(line: 313, column: 37, scope: !1890)
!2016 = !DILocation(line: 313, column: 43, scope: !1890)
!2017 = !DILocation(line: 313, column: 26, scope: !1890)
!2018 = !DILocation(line: 315, column: 9, scope: !2019)
!2019 = distinct !DILexicalBlock(scope: !1890, file: !20, line: 315, column: 8)
!2020 = !DILocation(line: 315, column: 15, scope: !2019)
!2021 = !DILocation(line: 315, column: 20, scope: !2019)
!2022 = !DILocation(line: 315, column: 34, scope: !2019)
!2023 = !DILocation(line: 315, column: 38, scope: !2019)
!2024 = !DILocation(line: 315, column: 44, scope: !2019)
!2025 = !DILocation(line: 315, column: 47, scope: !2019)
!2026 = !DILocation(line: 316, column: 10, scope: !2027)
!2027 = distinct !DILexicalBlock(scope: !2028, file: !20, line: 316, column: 9)
!2028 = distinct !DILexicalBlock(scope: !2019, file: !20, line: 315, column: 64)
!2029 = !DILocation(line: 316, column: 16, scope: !2027)
!2030 = !DILocation(line: 316, column: 30, scope: !2027)
!2031 = !DILocation(line: 316, column: 39, scope: !2027)
!2032 = !DILocation(line: 316, column: 53, scope: !2027)
!2033 = !DILocation(line: 316, column: 57, scope: !2027)
!2034 = !DILocation(line: 316, column: 63, scope: !2027)
!2035 = !DILocation(line: 316, column: 77, scope: !2027)
!2036 = !DILocation(line: 316, column: 86, scope: !2027)
!2037 = !DILocation(line: 316, column: 103, scope: !2027)
!2038 = !DILocation(line: 316, column: 118, scope: !2027)
!2039 = !DILocation(line: 316, column: 124, scope: !2027)
!2040 = !DILocation(line: 316, column: 107, scope: !2027)
!2041 = !DILocation(line: 316, column: 128, scope: !2027)
!2042 = !DILocation(line: 316, column: 138, scope: !2027)
!2043 = !DILocation(line: 316, column: 142, scope: !2027)
!2044 = !DILocation(line: 316, column: 150, scope: !2027)
!2045 = !DILocation(line: 317, column: 6, scope: !2046)
!2046 = distinct !DILexicalBlock(scope: !2027, file: !20, line: 316, column: 161)
!2047 = !DILocation(line: 317, column: 12, scope: !2046)
!2048 = !DILocation(line: 317, column: 26, scope: !2046)
!2049 = !DILocation(line: 317, column: 35, scope: !2046)
!2050 = !DILocation(line: 318, column: 20, scope: !2046)
!2051 = !DILocation(line: 318, column: 6, scope: !2046)
!2052 = !DILocation(line: 318, column: 28, scope: !2046)
!2053 = !DILocation(line: 318, column: 33, scope: !2046)
!2054 = !DILocation(line: 319, column: 6, scope: !2046)
!2055 = !DILocation(line: 320, column: 6, scope: !2046)
!2056 = !DILocation(line: 322, column: 4, scope: !2028)
!2057 = !DILocation(line: 323, column: 13, scope: !1890)
!2058 = !DILocation(line: 323, column: 19, scope: !1890)
!2059 = !DILocation(line: 323, column: 11, scope: !1890)
!2060 = distinct !{!2060, !1886, !2061, !1756}
!2061 = !DILocation(line: 324, column: 3, scope: !1880)
!2062 = !DILocation(line: 325, column: 2, scope: !1880)
!2063 = !DILocation(line: 309, column: 31, scope: !1875)
!2064 = !DILocation(line: 309, column: 2, scope: !1875)
!2065 = distinct !{!2065, !1878, !2066, !1756}
!2066 = !DILocation(line: 325, column: 2, scope: !1872)
!2067 = !DILocation(line: 327, column: 2, scope: !1857)
!2068 = !DILocation(line: 329, column: 1, scope: !1857)
!2069 = distinct !DISubprogram(name: "do_ai_frame", linkageName: "_Z11do_ai_frameP6object", scope: !20, file: !20, line: 338, type: !2070, scopeLine: 339, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1670)
!2070 = !DISubroutineType(types: !2071)
!2071 = !{null, !1891}
!2072 = !DILocalVariable(name: "obj", arg: 1, scope: !2069, file: !20, line: 338, type: !1891)
!2073 = !DILocation(line: 338, column: 26, scope: !2069)
!2074 = !DILocalVariable(name: "objnum", scope: !2069, file: !20, line: 884, type: !7)
!2075 = !DILocation(line: 884, column: 8, scope: !2069)
!2076 = !DILocation(line: 884, column: 17, scope: !2069)
!2077 = !DILocation(line: 884, column: 21, scope: !2069)
!2078 = !DILocalVariable(name: "aip", scope: !2069, file: !20, line: 885, type: !2079)
!2079 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1965, size: 64)
!2080 = !DILocation(line: 885, column: 13, scope: !2069)
!2081 = !DILocation(line: 885, column: 20, scope: !2069)
!2082 = !DILocation(line: 885, column: 25, scope: !2069)
!2083 = !DILocalVariable(name: "ailp", scope: !2069, file: !20, line: 886, type: !1833)
!2084 = !DILocation(line: 886, column: 12, scope: !2069)
!2085 = !DILocation(line: 886, column: 34, scope: !2069)
!2086 = !DILocation(line: 886, column: 20, scope: !2069)
!2087 = !DILocalVariable(name: "dist_to_player", scope: !2069, file: !20, line: 887, type: !36)
!2088 = !DILocation(line: 887, column: 8, scope: !2069)
!2089 = !DILocalVariable(name: "vec_to_player", scope: !2069, file: !20, line: 888, type: !77)
!2090 = !DILocation(line: 888, column: 13, scope: !2069)
!2091 = !DILocalVariable(name: "dot", scope: !2069, file: !20, line: 889, type: !36)
!2092 = !DILocation(line: 889, column: 8, scope: !2069)
!2093 = !DILocalVariable(name: "robptr", scope: !2069, file: !20, line: 890, type: !1764)
!2094 = !DILocation(line: 890, column: 14, scope: !2069)
!2095 = !DILocalVariable(name: "player_visibility", scope: !2069, file: !20, line: 891, type: !7)
!2096 = !DILocation(line: 891, column: 8, scope: !2069)
!2097 = !DILocalVariable(name: "obj_ref", scope: !2069, file: !20, line: 892, type: !7)
!2098 = !DILocation(line: 892, column: 8, scope: !2069)
!2099 = !DILocalVariable(name: "object_animates", scope: !2069, file: !20, line: 893, type: !7)
!2100 = !DILocation(line: 893, column: 8, scope: !2069)
!2101 = !DILocalVariable(name: "new_goal_state", scope: !2069, file: !20, line: 895, type: !7)
!2102 = !DILocation(line: 895, column: 8, scope: !2069)
!2103 = !DILocalVariable(name: "visibility_and_vec_computed", scope: !2069, file: !20, line: 896, type: !7)
!2104 = !DILocation(line: 896, column: 8, scope: !2069)
!2105 = !DILocalVariable(name: "previous_visibility", scope: !2069, file: !20, line: 897, type: !7)
!2106 = !DILocation(line: 897, column: 8, scope: !2069)
!2107 = !DILocalVariable(name: "gun_point", scope: !2069, file: !20, line: 898, type: !77)
!2108 = !DILocation(line: 898, column: 13, scope: !2069)
!2109 = !DILocalVariable(name: "vis_vec_pos", scope: !2069, file: !20, line: 899, type: !77)
!2110 = !DILocation(line: 899, column: 13, scope: !2069)
!2111 = !DILocation(line: 901, column: 28, scope: !2069)
!2112 = !DILocation(line: 901, column: 2, scope: !2069)
!2113 = !DILocation(line: 901, column: 8, scope: !2069)
!2114 = !DILocation(line: 901, column: 25, scope: !2069)
!2115 = !DILocation(line: 903, column: 6, scope: !2116)
!2116 = distinct !DILexicalBlock(scope: !2069, file: !20, line: 903, column: 6)
!2117 = !DILocation(line: 903, column: 11, scope: !2116)
!2118 = !DILocation(line: 904, column: 3, scope: !2119)
!2119 = distinct !DILexicalBlock(scope: !2116, file: !20, line: 903, column: 26)
!2120 = !DILocation(line: 904, column: 8, scope: !2119)
!2121 = !DILocation(line: 904, column: 21, scope: !2119)
!2122 = !DILocation(line: 905, column: 7, scope: !2123)
!2123 = distinct !DILexicalBlock(scope: !2119, file: !20, line: 905, column: 7)
!2124 = !DILocation(line: 905, column: 12, scope: !2123)
!2125 = !DILocation(line: 905, column: 28, scope: !2123)
!2126 = !DILocation(line: 905, column: 34, scope: !2123)
!2127 = !DILocation(line: 906, column: 40, scope: !2128)
!2128 = distinct !DILexicalBlock(scope: !2123, file: !20, line: 905, column: 52)
!2129 = !DILocation(line: 906, column: 45, scope: !2128)
!2130 = !DILocation(line: 906, column: 61, scope: !2128)
!2131 = !DILocation(line: 906, column: 71, scope: !2128)
!2132 = !DILocation(line: 906, column: 73, scope: !2128)
!2133 = !DILocation(line: 906, column: 79, scope: !2128)
!2134 = !DILocation(line: 906, column: 4, scope: !2128)
!2135 = !DILocation(line: 906, column: 9, scope: !2128)
!2136 = !DILocation(line: 906, column: 25, scope: !2128)
!2137 = !DILocation(line: 906, column: 35, scope: !2128)
!2138 = !DILocation(line: 906, column: 37, scope: !2128)
!2139 = !DILocation(line: 907, column: 40, scope: !2128)
!2140 = !DILocation(line: 907, column: 45, scope: !2128)
!2141 = !DILocation(line: 907, column: 61, scope: !2128)
!2142 = !DILocation(line: 907, column: 71, scope: !2128)
!2143 = !DILocation(line: 907, column: 73, scope: !2128)
!2144 = !DILocation(line: 907, column: 79, scope: !2128)
!2145 = !DILocation(line: 907, column: 4, scope: !2128)
!2146 = !DILocation(line: 907, column: 9, scope: !2128)
!2147 = !DILocation(line: 907, column: 25, scope: !2128)
!2148 = !DILocation(line: 907, column: 35, scope: !2128)
!2149 = !DILocation(line: 907, column: 37, scope: !2128)
!2150 = !DILocation(line: 908, column: 40, scope: !2128)
!2151 = !DILocation(line: 908, column: 45, scope: !2128)
!2152 = !DILocation(line: 908, column: 61, scope: !2128)
!2153 = !DILocation(line: 908, column: 71, scope: !2128)
!2154 = !DILocation(line: 908, column: 73, scope: !2128)
!2155 = !DILocation(line: 908, column: 79, scope: !2128)
!2156 = !DILocation(line: 908, column: 4, scope: !2128)
!2157 = !DILocation(line: 908, column: 9, scope: !2128)
!2158 = !DILocation(line: 908, column: 25, scope: !2128)
!2159 = !DILocation(line: 908, column: 35, scope: !2128)
!2160 = !DILocation(line: 908, column: 37, scope: !2128)
!2161 = !DILocation(line: 909, column: 9, scope: !2162)
!2162 = distinct !DILexicalBlock(scope: !2128, file: !20, line: 909, column: 8)
!2163 = !DILocation(line: 909, column: 14, scope: !2162)
!2164 = !DILocation(line: 909, column: 8, scope: !2162)
!2165 = !DILocation(line: 910, column: 5, scope: !2162)
!2166 = !DILocation(line: 910, column: 10, scope: !2162)
!2167 = !DILocation(line: 910, column: 26, scope: !2162)
!2168 = !DILocation(line: 910, column: 32, scope: !2162)
!2169 = !DILocation(line: 911, column: 3, scope: !2128)
!2170 = !DILocation(line: 912, column: 3, scope: !2119)
!2171 = !DILocation(line: 915, column: 23, scope: !2069)
!2172 = !DILocation(line: 915, column: 28, scope: !2069)
!2173 = !DILocation(line: 915, column: 12, scope: !2069)
!2174 = !DILocation(line: 915, column: 9, scope: !2069)
!2175 = !DILocation(line: 916, column: 2, scope: !2069)
!2176 = !DILocation(line: 918, column: 31, scope: !2177)
!2177 = distinct !DILexicalBlock(scope: !2069, file: !20, line: 918, column: 6)
!2178 = !DILocation(line: 918, column: 6, scope: !2177)
!2179 = !DILocation(line: 919, column: 3, scope: !2177)
!2180 = !DILocation(line: 924, column: 7, scope: !2181)
!2181 = distinct !DILexicalBlock(scope: !2069, file: !20, line: 924, column: 6)
!2182 = !DILocation(line: 924, column: 12, scope: !2181)
!2183 = !DILocation(line: 924, column: 23, scope: !2181)
!2184 = !DILocation(line: 924, column: 36, scope: !2181)
!2185 = !DILocation(line: 924, column: 53, scope: !2181)
!2186 = !DILocation(line: 924, column: 61, scope: !2181)
!2187 = !DILocation(line: 924, column: 39, scope: !2181)
!2188 = !DILocation(line: 925, column: 3, scope: !2189)
!2189 = distinct !DILexicalBlock(scope: !2181, file: !20, line: 924, column: 68)
!2190 = !DILocation(line: 925, column: 8, scope: !2189)
!2191 = !DILocation(line: 925, column: 19, scope: !2189)
!2192 = !DILocation(line: 926, column: 2, scope: !2189)
!2193 = !DILocation(line: 929, column: 7, scope: !2194)
!2194 = distinct !DILexicalBlock(scope: !2069, file: !20, line: 929, column: 6)
!2195 = !DILocation(line: 929, column: 12, scope: !2194)
!2196 = !DILocation(line: 929, column: 21, scope: !2194)
!2197 = !DILocation(line: 929, column: 38, scope: !2194)
!2198 = !DILocation(line: 929, column: 42, scope: !2194)
!2199 = !DILocation(line: 929, column: 48, scope: !2194)
!2200 = !DILocation(line: 929, column: 53, scope: !2194)
!2201 = !DILocation(line: 930, column: 3, scope: !2194)
!2202 = !DILocation(line: 932, column: 26, scope: !2069)
!2203 = !DILocation(line: 932, column: 2, scope: !2069)
!2204 = !DILocation(line: 934, column: 7, scope: !2205)
!2205 = distinct !DILexicalBlock(scope: !2069, file: !20, line: 934, column: 6)
!2206 = !DILocation(line: 934, column: 6, scope: !2205)
!2207 = !DILocation(line: 935, column: 3, scope: !2205)
!2208 = !DILocation(line: 937, column: 6, scope: !2209)
!2209 = distinct !DILexicalBlock(scope: !2069, file: !20, line: 937, column: 6)
!2210 = !DILocation(line: 937, column: 22, scope: !2209)
!2211 = !DILocation(line: 938, column: 8, scope: !2212)
!2212 = distinct !DILexicalBlock(scope: !2209, file: !20, line: 938, column: 7)
!2213 = !DILocation(line: 938, column: 12, scope: !2212)
!2214 = !DILocation(line: 938, column: 26, scope: !2212)
!2215 = !DILocation(line: 938, column: 23, scope: !2212)
!2216 = !DILocation(line: 939, column: 4, scope: !2212)
!2217 = !DILocation(line: 946, column: 9, scope: !2218)
!2218 = distinct !DILexicalBlock(scope: !2069, file: !20, line: 946, column: 6)
!2219 = !DILocation(line: 946, column: 14, scope: !2218)
!2220 = !DILocation(line: 946, column: 23, scope: !2218)
!2221 = !DILocation(line: 946, column: 40, scope: !2218)
!2222 = !DILocation(line: 946, column: 44, scope: !2218)
!2223 = !DILocation(line: 946, column: 49, scope: !2218)
!2224 = !DILocation(line: 946, column: 58, scope: !2218)
!2225 = !DILocation(line: 946, column: 6, scope: !2218)
!2226 = !DILocation(line: 948, column: 3, scope: !2227)
!2227 = distinct !DILexicalBlock(scope: !2218, file: !20, line: 946, column: 77)
!2228 = !DILocation(line: 948, column: 8, scope: !2227)
!2229 = !DILocation(line: 948, column: 17, scope: !2227)
!2230 = !DILocation(line: 949, column: 2, scope: !2227)
!2231 = !DILocation(line: 951, column: 2, scope: !2069)
!2232 = !DILocation(line: 952, column: 2, scope: !2069)
!2233 = !DILocation(line: 954, column: 12, scope: !2069)
!2234 = !DILocation(line: 954, column: 21, scope: !2069)
!2235 = !DILocation(line: 954, column: 19, scope: !2069)
!2236 = !DILocation(line: 954, column: 10, scope: !2069)
!2237 = !DILocation(line: 956, column: 6, scope: !2238)
!2238 = distinct !DILexicalBlock(scope: !2069, file: !20, line: 956, column: 6)
!2239 = !DILocation(line: 956, column: 12, scope: !2238)
!2240 = !DILocation(line: 956, column: 22, scope: !2238)
!2241 = !DILocation(line: 957, column: 22, scope: !2238)
!2242 = !DILocation(line: 957, column: 3, scope: !2238)
!2243 = !DILocation(line: 957, column: 9, scope: !2238)
!2244 = !DILocation(line: 957, column: 19, scope: !2238)
!2245 = !DILocation(line: 959, column: 6, scope: !2246)
!2246 = distinct !DILexicalBlock(scope: !2069, file: !20, line: 959, column: 6)
!2247 = !DILocation(line: 959, column: 14, scope: !2246)
!2248 = !DILocation(line: 959, column: 27, scope: !2246)
!2249 = !DILocation(line: 960, column: 7, scope: !2250)
!2250 = distinct !DILexicalBlock(scope: !2251, file: !20, line: 960, column: 7)
!2251 = distinct !DILexicalBlock(scope: !2246, file: !20, line: 959, column: 34)
!2252 = !DILocation(line: 960, column: 13, scope: !2250)
!2253 = !DILocation(line: 960, column: 24, scope: !2250)
!2254 = !DILocation(line: 961, column: 24, scope: !2250)
!2255 = !DILocation(line: 961, column: 4, scope: !2250)
!2256 = !DILocation(line: 961, column: 10, scope: !2250)
!2257 = !DILocation(line: 961, column: 21, scope: !2250)
!2258 = !DILocation(line: 962, column: 2, scope: !2251)
!2259 = !DILocation(line: 964, column: 3, scope: !2246)
!2260 = !DILocation(line: 964, column: 9, scope: !2246)
!2261 = !DILocation(line: 964, column: 20, scope: !2246)
!2262 = !DILocation(line: 966, column: 6, scope: !2263)
!2263 = distinct !DILexicalBlock(scope: !2069, file: !20, line: 966, column: 6)
!2264 = !DILocation(line: 966, column: 12, scope: !2263)
!2265 = !DILocation(line: 966, column: 33, scope: !2263)
!2266 = !DILocation(line: 967, column: 33, scope: !2263)
!2267 = !DILocation(line: 967, column: 3, scope: !2263)
!2268 = !DILocation(line: 967, column: 9, scope: !2263)
!2269 = !DILocation(line: 967, column: 30, scope: !2263)
!2270 = !DILocation(line: 969, column: 24, scope: !2069)
!2271 = !DILocation(line: 969, column: 30, scope: !2069)
!2272 = !DILocation(line: 969, column: 22, scope: !2069)
!2273 = !DILocation(line: 980, column: 7, scope: !2274)
!2274 = distinct !DILexicalBlock(scope: !2069, file: !20, line: 980, column: 6)
!2275 = !DILocation(line: 980, column: 12, scope: !2274)
!2276 = !DILocation(line: 980, column: 22, scope: !2274)
!2277 = !DILocation(line: 980, column: 6, scope: !2274)
!2278 = !DILocation(line: 980, column: 48, scope: !2274)
!2279 = !DILocation(line: 980, column: 52, scope: !2274)
!2280 = !DILocation(line: 980, column: 75, scope: !2274)
!2281 = !DILocation(line: 981, column: 33, scope: !2274)
!2282 = !DILocation(line: 981, column: 25, scope: !2274)
!2283 = !DILocation(line: 981, column: 57, scope: !2274)
!2284 = !DILocation(line: 981, column: 23, scope: !2274)
!2285 = !DILocation(line: 981, column: 3, scope: !2274)
!2286 = !DILocation(line: 983, column: 7, scope: !2287)
!2287 = distinct !DILexicalBlock(scope: !2288, file: !20, line: 983, column: 7)
!2288 = distinct !DILexicalBlock(scope: !2274, file: !20, line: 982, column: 7)
!2289 = !DILocation(line: 984, column: 18, scope: !2290)
!2290 = distinct !DILexicalBlock(scope: !2287, file: !20, line: 983, column: 33)
!2291 = !DILocation(line: 984, column: 23, scope: !2290)
!2292 = !DILocation(line: 984, column: 16, scope: !2290)
!2293 = !DILocation(line: 985, column: 24, scope: !2290)
!2294 = !DILocation(line: 985, column: 43, scope: !2290)
!2295 = !DILocation(line: 985, column: 85, scope: !2290)
!2296 = !DILocation(line: 985, column: 4, scope: !2290)
!2297 = !DILocation(line: 986, column: 8, scope: !2298)
!2298 = distinct !DILexicalBlock(scope: !2290, file: !20, line: 986, column: 8)
!2299 = !DILocalVariable(name: "ii", scope: !2300, file: !20, line: 987, type: !7)
!2300 = distinct !DILexicalBlock(scope: !2298, file: !20, line: 986, column: 27)
!2301 = !DILocation(line: 987, column: 9, scope: !2300)
!2302 = !DILocalVariable(name: "min_obj", scope: !2300, file: !20, line: 987, type: !7)
!2303 = !DILocation(line: 987, column: 13, scope: !2300)
!2304 = !DILocalVariable(name: "min_dist", scope: !2300, file: !20, line: 988, type: !36)
!2305 = !DILocation(line: 988, column: 9, scope: !2300)
!2306 = !DILocalVariable(name: "cur_dist", scope: !2300, file: !20, line: 988, type: !36)
!2307 = !DILocation(line: 988, column: 32, scope: !2300)
!2308 = !DILocation(line: 990, column: 13, scope: !2309)
!2309 = distinct !DILexicalBlock(scope: !2300, file: !20, line: 990, column: 5)
!2310 = !DILocation(line: 990, column: 10, scope: !2309)
!2311 = !DILocation(line: 990, column: 18, scope: !2312)
!2312 = distinct !DILexicalBlock(scope: !2309, file: !20, line: 990, column: 5)
!2313 = !DILocation(line: 990, column: 24, scope: !2312)
!2314 = !DILocation(line: 990, column: 21, scope: !2312)
!2315 = !DILocation(line: 990, column: 5, scope: !2309)
!2316 = !DILocation(line: 991, column: 19, scope: !2317)
!2317 = distinct !DILexicalBlock(scope: !2312, file: !20, line: 991, column: 10)
!2318 = !DILocation(line: 991, column: 11, scope: !2317)
!2319 = !DILocation(line: 991, column: 23, scope: !2317)
!2320 = !DILocation(line: 991, column: 28, scope: !2317)
!2321 = !DILocation(line: 991, column: 42, scope: !2317)
!2322 = !DILocation(line: 991, column: 46, scope: !2317)
!2323 = !DILocation(line: 991, column: 52, scope: !2317)
!2324 = !DILocation(line: 991, column: 49, scope: !2317)
!2325 = !DILocation(line: 992, column: 37, scope: !2326)
!2326 = distinct !DILexicalBlock(scope: !2317, file: !20, line: 991, column: 61)
!2327 = !DILocation(line: 992, column: 42, scope: !2326)
!2328 = !DILocation(line: 992, column: 56, scope: !2326)
!2329 = !DILocation(line: 992, column: 48, scope: !2326)
!2330 = !DILocation(line: 992, column: 60, scope: !2326)
!2331 = !DILocation(line: 992, column: 18, scope: !2326)
!2332 = !DILocation(line: 992, column: 16, scope: !2326)
!2333 = !DILocation(line: 994, column: 11, scope: !2334)
!2334 = distinct !DILexicalBlock(scope: !2326, file: !20, line: 994, column: 11)
!2335 = !DILocation(line: 994, column: 20, scope: !2334)
!2336 = !DILocation(line: 995, column: 40, scope: !2337)
!2337 = distinct !DILexicalBlock(scope: !2334, file: !20, line: 995, column: 12)
!2338 = !DILocation(line: 995, column: 54, scope: !2337)
!2339 = !DILocation(line: 995, column: 46, scope: !2337)
!2340 = !DILocation(line: 995, column: 12, scope: !2337)
!2341 = !DILocation(line: 996, column: 13, scope: !2342)
!2342 = distinct !DILexicalBlock(scope: !2337, file: !20, line: 996, column: 13)
!2343 = !DILocation(line: 996, column: 24, scope: !2342)
!2344 = !DILocation(line: 996, column: 22, scope: !2342)
!2345 = !DILocation(line: 997, column: 20, scope: !2346)
!2346 = distinct !DILexicalBlock(scope: !2342, file: !20, line: 996, column: 34)
!2347 = !DILocation(line: 997, column: 18, scope: !2346)
!2348 = !DILocation(line: 998, column: 21, scope: !2346)
!2349 = !DILocation(line: 998, column: 19, scope: !2346)
!2350 = !DILocation(line: 999, column: 9, scope: !2346)
!2351 = !DILocation(line: 995, column: 71, scope: !2337)
!2352 = !DILocation(line: 1000, column: 6, scope: !2326)
!2353 = !DILocation(line: 991, column: 58, scope: !2317)
!2354 = !DILocation(line: 990, column: 48, scope: !2312)
!2355 = !DILocation(line: 990, column: 5, scope: !2312)
!2356 = distinct !{!2356, !2315, !2357, !1756}
!2357 = !DILocation(line: 1000, column: 6, scope: !2309)
!2358 = !DILocation(line: 1001, column: 9, scope: !2359)
!2359 = distinct !DILexicalBlock(scope: !2300, file: !20, line: 1001, column: 9)
!2360 = !DILocation(line: 1001, column: 17, scope: !2359)
!2361 = !DILocation(line: 1002, column: 36, scope: !2362)
!2362 = distinct !DILexicalBlock(scope: !2359, file: !20, line: 1001, column: 24)
!2363 = !DILocation(line: 1002, column: 28, scope: !2362)
!2364 = !DILocation(line: 1002, column: 45, scope: !2362)
!2365 = !DILocation(line: 1002, column: 26, scope: !2362)
!2366 = !DILocation(line: 1003, column: 36, scope: !2362)
!2367 = !DILocation(line: 1003, column: 28, scope: !2362)
!2368 = !DILocation(line: 1003, column: 45, scope: !2362)
!2369 = !DILocation(line: 1003, column: 26, scope: !2362)
!2370 = !DILocation(line: 1004, column: 73, scope: !2362)
!2371 = !DILocation(line: 1004, column: 78, scope: !2362)
!2372 = !DILocation(line: 1004, column: 6, scope: !2362)
!2373 = !DILocation(line: 1005, column: 5, scope: !2362)
!2374 = !DILocation(line: 1007, column: 6, scope: !2359)
!2375 = !DILocation(line: 1008, column: 4, scope: !2300)
!2376 = !DILocation(line: 1010, column: 5, scope: !2298)
!2377 = !DILocation(line: 1011, column: 3, scope: !2290)
!2378 = !DILocation(line: 1012, column: 8, scope: !2287)
!2379 = !DILabel(scope: !2380, name: "_exit_cheat", file: !20, line: 1013)
!2380 = distinct !DILexicalBlock(scope: !2287, file: !20, line: 1012, column: 8)
!2381 = !DILocation(line: 1013, column: 3, scope: !2380)
!2382 = !DILocation(line: 1014, column: 32, scope: !2380)
!2383 = !DILocation(line: 1015, column: 18, scope: !2384)
!2384 = distinct !DILexicalBlock(scope: !2380, file: !20, line: 1015, column: 8)
!2385 = !DILocation(line: 1015, column: 10, scope: !2384)
!2386 = !DILocation(line: 1015, column: 30, scope: !2384)
!2387 = !DILocation(line: 1015, column: 36, scope: !2384)
!2388 = !DILocation(line: 1015, column: 9, scope: !2384)
!2389 = !DILocation(line: 1015, column: 8, scope: !2384)
!2390 = !DILocation(line: 1016, column: 27, scope: !2384)
!2391 = !DILocation(line: 1016, column: 42, scope: !2384)
!2392 = !DILocation(line: 1016, column: 25, scope: !2384)
!2393 = !DILocation(line: 1016, column: 5, scope: !2384)
!2394 = !DILocation(line: 1018, column: 41, scope: !2384)
!2395 = !DILocation(line: 1018, column: 48, scope: !2384)
!2396 = !DILocation(line: 1018, column: 27, scope: !2384)
!2397 = !DILocation(line: 1018, column: 75, scope: !2384)
!2398 = !DILocation(line: 1018, column: 25, scope: !2384)
!2399 = !DILocation(line: 1021, column: 60, scope: !2069)
!2400 = !DILocation(line: 1021, column: 65, scope: !2069)
!2401 = !DILocation(line: 1021, column: 19, scope: !2069)
!2402 = !DILocation(line: 1021, column: 17, scope: !2069)
!2403 = !DILocation(line: 1027, column: 7, scope: !2404)
!2404 = distinct !DILexicalBlock(scope: !2069, file: !20, line: 1027, column: 6)
!2405 = !DILocation(line: 1027, column: 27, scope: !2404)
!2406 = !DILocation(line: 1027, column: 32, scope: !2404)
!2407 = !DILocation(line: 1027, column: 40, scope: !2404)
!2408 = !DILocation(line: 1027, column: 31, scope: !2404)
!2409 = !DILocation(line: 1027, column: 46, scope: !2404)
!2410 = !DILocation(line: 1027, column: 63, scope: !2404)
!2411 = !DILocation(line: 1027, column: 71, scope: !2404)
!2412 = !DILocation(line: 1027, column: 49, scope: !2404)
!2413 = !DILocation(line: 1027, column: 77, scope: !2404)
!2414 = !DILocation(line: 1027, column: 81, scope: !2404)
!2415 = !DILocation(line: 1027, column: 96, scope: !2404)
!2416 = !DILocation(line: 1027, column: 110, scope: !2404)
!2417 = !DILocation(line: 1027, column: 114, scope: !2404)
!2418 = !DILocation(line: 1027, column: 122, scope: !2404)
!2419 = !DILocation(line: 1027, column: 113, scope: !2404)
!2420 = !DILocation(line: 1027, column: 130, scope: !2404)
!2421 = !DILocation(line: 1027, column: 135, scope: !2404)
!2422 = !DILocation(line: 1027, column: 143, scope: !2404)
!2423 = !DILocation(line: 1027, column: 134, scope: !2404)
!2424 = !DILocation(line: 1030, column: 7, scope: !2425)
!2425 = distinct !DILexicalBlock(scope: !2426, file: !20, line: 1030, column: 7)
!2426 = distinct !DILexicalBlock(scope: !2404, file: !20, line: 1027, column: 157)
!2427 = !DILocation(line: 1030, column: 13, scope: !2425)
!2428 = !DILocation(line: 1030, column: 23, scope: !2425)
!2429 = !DILocation(line: 1031, column: 31, scope: !2425)
!2430 = !DILocation(line: 1031, column: 36, scope: !2425)
!2431 = !DILocation(line: 1031, column: 41, scope: !2425)
!2432 = !DILocation(line: 1031, column: 4, scope: !2425)
!2433 = !DILocation(line: 1033, column: 31, scope: !2425)
!2434 = !DILocation(line: 1033, column: 4, scope: !2425)
!2435 = !DILocation(line: 1034, column: 15, scope: !2426)
!2436 = !DILocation(line: 1035, column: 2, scope: !2426)
!2437 = !DILocation(line: 1037, column: 17, scope: !2438)
!2438 = distinct !DILexicalBlock(scope: !2404, file: !20, line: 1036, column: 7)
!2439 = !DILocation(line: 1037, column: 22, scope: !2438)
!2440 = !DILocation(line: 1037, column: 15, scope: !2438)
!2441 = !DILocation(line: 1038, column: 3, scope: !2438)
!2442 = !DILocation(line: 1050, column: 7, scope: !2443)
!2443 = distinct !DILexicalBlock(scope: !2069, file: !20, line: 1050, column: 6)
!2444 = !DILocation(line: 1050, column: 12, scope: !2443)
!2445 = !DILocation(line: 1050, column: 21, scope: !2443)
!2446 = !DILocation(line: 1050, column: 35, scope: !2443)
!2447 = !DILocation(line: 1050, column: 39, scope: !2443)
!2448 = !DILocation(line: 1050, column: 44, scope: !2443)
!2449 = !DILocation(line: 1050, column: 53, scope: !2443)
!2450 = !DILocation(line: 1050, column: 70, scope: !2443)
!2451 = !DILocation(line: 1050, column: 74, scope: !2443)
!2452 = !DILocation(line: 1050, column: 79, scope: !2443)
!2453 = !DILocation(line: 1050, column: 88, scope: !2443)
!2454 = !DILocation(line: 1050, column: 102, scope: !2443)
!2455 = !DILocation(line: 1050, column: 107, scope: !2443)
!2456 = !DILocation(line: 1050, column: 117, scope: !2443)
!2457 = !DILocation(line: 1050, column: 106, scope: !2443)
!2458 = !DILocation(line: 1050, column: 129, scope: !2443)
!2459 = !DILocation(line: 1050, column: 133, scope: !2443)
!2460 = !DILocation(line: 1050, column: 141, scope: !2443)
!2461 = !DILocation(line: 1050, column: 151, scope: !2443)
!2462 = !DILocation(line: 1050, column: 157, scope: !2443)
!2463 = !DILocation(line: 1050, column: 161, scope: !2443)
!2464 = !DILocation(line: 1050, column: 169, scope: !2443)
!2465 = !DILocation(line: 1050, column: 175, scope: !2443)
!2466 = !DILocation(line: 1051, column: 7, scope: !2467)
!2467 = distinct !DILexicalBlock(scope: !2443, file: !20, line: 1051, column: 7)
!2468 = !DILocation(line: 1051, column: 25, scope: !2467)
!2469 = !DILocation(line: 1052, column: 9, scope: !2470)
!2470 = distinct !DILexicalBlock(scope: !2471, file: !20, line: 1052, column: 8)
!2471 = distinct !DILexicalBlock(scope: !2467, file: !20, line: 1051, column: 31)
!2472 = !DILocation(line: 1052, column: 24, scope: !2470)
!2473 = !DILocation(line: 1052, column: 38, scope: !2470)
!2474 = !DILocation(line: 1052, column: 42, scope: !2470)
!2475 = !DILocation(line: 1052, column: 53, scope: !2470)
!2476 = !DILocation(line: 1052, column: 63, scope: !2470)
!2477 = !DILocation(line: 1052, column: 51, scope: !2470)
!2478 = !DILocation(line: 1053, column: 9, scope: !2479)
!2479 = distinct !DILexicalBlock(scope: !2480, file: !20, line: 1053, column: 9)
!2480 = distinct !DILexicalBlock(scope: !2470, file: !20, line: 1052, column: 69)
!2481 = !DILocation(line: 1053, column: 21, scope: !2479)
!2482 = !DILocation(line: 1053, column: 39, scope: !2479)
!2483 = !DILocation(line: 1053, column: 18, scope: !2479)
!2484 = !DILocation(line: 1053, column: 45, scope: !2479)
!2485 = !DILocation(line: 1055, column: 28, scope: !2486)
!2486 = distinct !DILexicalBlock(scope: !2479, file: !20, line: 1053, column: 57)
!2487 = !DILocation(line: 1055, column: 37, scope: !2486)
!2488 = !DILocation(line: 1055, column: 55, scope: !2486)
!2489 = !DILocation(line: 1055, column: 35, scope: !2486)
!2490 = !DILocation(line: 1055, column: 61, scope: !2486)
!2491 = !DILocation(line: 1055, column: 59, scope: !2486)
!2492 = !DILocation(line: 1055, column: 6, scope: !2486)
!2493 = !DILocation(line: 1056, column: 6, scope: !2486)
!2494 = !DILocation(line: 1058, column: 4, scope: !2480)
!2495 = !DILocation(line: 1059, column: 3, scope: !2471)
!2496 = !DILocation(line: 1051, column: 27, scope: !2467)
!2497 = !DILocation(line: 1066, column: 7, scope: !2498)
!2498 = distinct !DILexicalBlock(scope: !2069, file: !20, line: 1066, column: 6)
!2499 = !DILocation(line: 1066, column: 13, scope: !2498)
!2500 = !DILocation(line: 1066, column: 6, scope: !2498)
!2501 = !DILocation(line: 1066, column: 26, scope: !2498)
!2502 = !DILocation(line: 1066, column: 31, scope: !2498)
!2503 = !DILocation(line: 1066, column: 41, scope: !2498)
!2504 = !DILocation(line: 1066, column: 30, scope: !2498)
!2505 = !DILocation(line: 1067, column: 32, scope: !2506)
!2506 = distinct !DILexicalBlock(scope: !2498, file: !20, line: 1066, column: 54)
!2507 = !DILocation(line: 1067, column: 38, scope: !2506)
!2508 = !DILocation(line: 1067, column: 3, scope: !2506)
!2509 = !DILocation(line: 1067, column: 9, scope: !2506)
!2510 = !DILocation(line: 1067, column: 29, scope: !2506)
!2511 = !DILocation(line: 1068, column: 3, scope: !2506)
!2512 = !DILocation(line: 1068, column: 9, scope: !2506)
!2513 = !DILocation(line: 1068, column: 21, scope: !2506)
!2514 = !DILocation(line: 1069, column: 7, scope: !2515)
!2515 = distinct !DILexicalBlock(scope: !2506, file: !20, line: 1069, column: 7)
!2516 = !DILocation(line: 1069, column: 13, scope: !2515)
!2517 = !DILocation(line: 1069, column: 33, scope: !2515)
!2518 = !DILocation(line: 1070, column: 12, scope: !2519)
!2519 = distinct !DILexicalBlock(scope: !2515, file: !20, line: 1069, column: 38)
!2520 = !DILocation(line: 1070, column: 18, scope: !2519)
!2521 = !DILocation(line: 1070, column: 4, scope: !2519)
!2522 = !DILocation(line: 1074, column: 33, scope: !2523)
!2523 = distinct !DILexicalBlock(scope: !2519, file: !20, line: 1070, column: 24)
!2524 = !DILocation(line: 1074, column: 5, scope: !2523)
!2525 = !DILocation(line: 1075, column: 27, scope: !2523)
!2526 = !DILocation(line: 1075, column: 5, scope: !2523)
!2527 = !DILocation(line: 1077, column: 5, scope: !2523)
!2528 = !DILocation(line: 1080, column: 24, scope: !2523)
!2529 = !DILocation(line: 1086, column: 5, scope: !2523)
!2530 = !DILocation(line: 1089, column: 27, scope: !2523)
!2531 = !DILocation(line: 1089, column: 36, scope: !2523)
!2532 = !DILocation(line: 1089, column: 54, scope: !2523)
!2533 = !DILocation(line: 1089, column: 34, scope: !2523)
!2534 = !DILocation(line: 1089, column: 60, scope: !2523)
!2535 = !DILocation(line: 1089, column: 58, scope: !2523)
!2536 = !DILocation(line: 1089, column: 5, scope: !2523)
!2537 = !DILocation(line: 1090, column: 5, scope: !2523)
!2538 = !DILocation(line: 1092, column: 9, scope: !2539)
!2539 = distinct !DILexicalBlock(scope: !2523, file: !20, line: 1092, column: 9)
!2540 = !DILocation(line: 1092, column: 17, scope: !2539)
!2541 = !DILocation(line: 1093, column: 34, scope: !2539)
!2542 = !DILocation(line: 1093, column: 6, scope: !2539)
!2543 = !DILocation(line: 1094, column: 17, scope: !2544)
!2544 = distinct !DILexicalBlock(scope: !2539, file: !20, line: 1094, column: 14)
!2545 = !DILocation(line: 1094, column: 22, scope: !2544)
!2546 = !DILocation(line: 1094, column: 31, scope: !2544)
!2547 = !DILocation(line: 1094, column: 45, scope: !2544)
!2548 = !DILocation(line: 1094, column: 49, scope: !2544)
!2549 = !DILocation(line: 1094, column: 54, scope: !2544)
!2550 = !DILocation(line: 1094, column: 63, scope: !2544)
!2551 = !DILocation(line: 1094, column: 79, scope: !2544)
!2552 = !DILocation(line: 1094, column: 83, scope: !2544)
!2553 = !DILocation(line: 1094, column: 88, scope: !2544)
!2554 = !DILocation(line: 1094, column: 97, scope: !2544)
!2555 = !DILocation(line: 1094, column: 14, scope: !2544)
!2556 = !DILocation(line: 1095, column: 29, scope: !2544)
!2557 = !DILocation(line: 1095, column: 6, scope: !2544)
!2558 = !DILocation(line: 1096, column: 5, scope: !2523)
!2559 = !DILocation(line: 1099, column: 9, scope: !2560)
!2560 = distinct !DILexicalBlock(scope: !2523, file: !20, line: 1099, column: 9)
!2561 = !DILocation(line: 1099, column: 19, scope: !2560)
!2562 = !DILocation(line: 1100, column: 6, scope: !2563)
!2563 = distinct !DILexicalBlock(scope: !2560, file: !20, line: 1099, column: 31)
!2564 = !DILocation(line: 1100, column: 12, scope: !2563)
!2565 = !DILocation(line: 1100, column: 17, scope: !2563)
!2566 = !DILocation(line: 1101, column: 5, scope: !2563)
!2567 = !DILocation(line: 1103, column: 29, scope: !2560)
!2568 = !DILocation(line: 1103, column: 6, scope: !2560)
!2569 = !DILocation(line: 1104, column: 5, scope: !2523)
!2570 = !DILocation(line: 1106, column: 33, scope: !2523)
!2571 = !DILocation(line: 1106, column: 5, scope: !2523)
!2572 = !DILocation(line: 1107, column: 5, scope: !2523)
!2573 = !DILocation(line: 1107, column: 10, scope: !2523)
!2574 = !DILocation(line: 1107, column: 26, scope: !2523)
!2575 = !DILocation(line: 1107, column: 35, scope: !2523)
!2576 = !DILocation(line: 1107, column: 37, scope: !2523)
!2577 = !DILocation(line: 1108, column: 5, scope: !2523)
!2578 = !DILocation(line: 1108, column: 10, scope: !2523)
!2579 = !DILocation(line: 1108, column: 26, scope: !2523)
!2580 = !DILocation(line: 1108, column: 35, scope: !2523)
!2581 = !DILocation(line: 1108, column: 37, scope: !2523)
!2582 = !DILocation(line: 1109, column: 5, scope: !2523)
!2583 = !DILocation(line: 1109, column: 10, scope: !2523)
!2584 = !DILocation(line: 1109, column: 26, scope: !2523)
!2585 = !DILocation(line: 1109, column: 35, scope: !2523)
!2586 = !DILocation(line: 1109, column: 37, scope: !2523)
!2587 = !DILocation(line: 1110, column: 27, scope: !2523)
!2588 = !DILocation(line: 1110, column: 5, scope: !2523)
!2589 = !DILocation(line: 1111, column: 5, scope: !2523)
!2590 = !DILocation(line: 1111, column: 11, scope: !2523)
!2591 = !DILocation(line: 1111, column: 16, scope: !2523)
!2592 = !DILocation(line: 1112, column: 5, scope: !2523)
!2593 = !DILocation(line: 1114, column: 5, scope: !2523)
!2594 = !DILocation(line: 1115, column: 33, scope: !2523)
!2595 = !DILocation(line: 1115, column: 5, scope: !2523)
!2596 = !DILocation(line: 1116, column: 5, scope: !2523)
!2597 = !DILocation(line: 1116, column: 10, scope: !2523)
!2598 = !DILocation(line: 1116, column: 26, scope: !2523)
!2599 = !DILocation(line: 1116, column: 35, scope: !2523)
!2600 = !DILocation(line: 1116, column: 37, scope: !2523)
!2601 = !DILocation(line: 1117, column: 5, scope: !2523)
!2602 = !DILocation(line: 1117, column: 10, scope: !2523)
!2603 = !DILocation(line: 1117, column: 26, scope: !2523)
!2604 = !DILocation(line: 1117, column: 35, scope: !2523)
!2605 = !DILocation(line: 1117, column: 37, scope: !2523)
!2606 = !DILocation(line: 1118, column: 5, scope: !2523)
!2607 = !DILocation(line: 1118, column: 10, scope: !2523)
!2608 = !DILocation(line: 1118, column: 26, scope: !2523)
!2609 = !DILocation(line: 1118, column: 35, scope: !2523)
!2610 = !DILocation(line: 1118, column: 37, scope: !2523)
!2611 = !DILocation(line: 1119, column: 5, scope: !2523)
!2612 = !DILocation(line: 1121, column: 35, scope: !2523)
!2613 = !DILocation(line: 1121, column: 5, scope: !2523)
!2614 = !DILocation(line: 1122, column: 5, scope: !2523)
!2615 = !DILocation(line: 1125, column: 5, scope: !2523)
!2616 = !DILocation(line: 1126, column: 5, scope: !2523)
!2617 = !DILocation(line: 1129, column: 4, scope: !2519)
!2618 = !DILocation(line: 1129, column: 10, scope: !2519)
!2619 = !DILocation(line: 1129, column: 30, scope: !2519)
!2620 = !DILocation(line: 1130, column: 3, scope: !2519)
!2621 = !DILocation(line: 1131, column: 2, scope: !2506)
!2622 = !DILocation(line: 1133, column: 3, scope: !2498)
!2623 = !DILocation(line: 1133, column: 9, scope: !2498)
!2624 = !DILocation(line: 1133, column: 29, scope: !2498)
!2625 = !DILocation(line: 1137, column: 8, scope: !2626)
!2626 = distinct !DILexicalBlock(scope: !2069, file: !20, line: 1137, column: 6)
!2627 = !DILocation(line: 1137, column: 18, scope: !2626)
!2628 = !DILocation(line: 1137, column: 7, scope: !2626)
!2629 = !DILocation(line: 1137, column: 30, scope: !2626)
!2630 = !DILocation(line: 1137, column: 44, scope: !2626)
!2631 = !DILocation(line: 1137, column: 49, scope: !2626)
!2632 = !DILocation(line: 1137, column: 34, scope: !2626)
!2633 = !DILocation(line: 1137, column: 57, scope: !2626)
!2634 = !DILocation(line: 1137, column: 65, scope: !2626)
!2635 = !DILocation(line: 1138, column: 25, scope: !2636)
!2636 = distinct !DILexicalBlock(scope: !2637, file: !20, line: 1138, column: 7)
!2637 = distinct !DILexicalBlock(scope: !2626, file: !20, line: 1137, column: 92)
!2638 = !DILocation(line: 1138, column: 30, scope: !2636)
!2639 = !DILocation(line: 1138, column: 15, scope: !2636)
!2640 = !DILocation(line: 1138, column: 38, scope: !2636)
!2641 = !DILocation(line: 1138, column: 7, scope: !2636)
!2642 = !DILocation(line: 1138, column: 45, scope: !2636)
!2643 = !DILocation(line: 1139, column: 19, scope: !2644)
!2644 = distinct !DILexicalBlock(scope: !2636, file: !20, line: 1138, column: 54)
!2645 = !DILocation(line: 1139, column: 4, scope: !2644)
!2646 = !DILocation(line: 1140, column: 4, scope: !2644)
!2647 = !DILocation(line: 1142, column: 2, scope: !2637)
!2648 = !DILocation(line: 1146, column: 6, scope: !2649)
!2649 = distinct !DILexicalBlock(scope: !2069, file: !20, line: 1146, column: 6)
!2650 = !DILocation(line: 1146, column: 12, scope: !2649)
!2651 = !DILocation(line: 1147, column: 7, scope: !2652)
!2652 = distinct !DILexicalBlock(scope: !2653, file: !20, line: 1147, column: 7)
!2653 = distinct !DILexicalBlock(scope: !2649, file: !20, line: 1146, column: 35)
!2654 = !DILocation(line: 1147, column: 13, scope: !2652)
!2655 = !DILocation(line: 1147, column: 35, scope: !2652)
!2656 = !DILocation(line: 1148, column: 35, scope: !2657)
!2657 = distinct !DILexicalBlock(scope: !2652, file: !20, line: 1147, column: 40)
!2658 = !DILocation(line: 1148, column: 4, scope: !2657)
!2659 = !DILocation(line: 1148, column: 10, scope: !2657)
!2660 = !DILocation(line: 1148, column: 32, scope: !2657)
!2661 = !DILocation(line: 1149, column: 8, scope: !2662)
!2662 = distinct !DILexicalBlock(scope: !2657, file: !20, line: 1149, column: 8)
!2663 = !DILocation(line: 1149, column: 14, scope: !2662)
!2664 = !DILocation(line: 1149, column: 36, scope: !2662)
!2665 = !DILocation(line: 1150, column: 5, scope: !2666)
!2666 = distinct !DILexicalBlock(scope: !2662, file: !20, line: 1149, column: 42)
!2667 = !DILocation(line: 1150, column: 11, scope: !2666)
!2668 = !DILocation(line: 1150, column: 33, scope: !2666)
!2669 = !DILocation(line: 1151, column: 5, scope: !2666)
!2670 = !DILocation(line: 1151, column: 11, scope: !2666)
!2671 = !DILocation(line: 1151, column: 32, scope: !2666)
!2672 = !DILocation(line: 1152, column: 4, scope: !2666)
!2673 = !DILocation(line: 1153, column: 3, scope: !2657)
!2674 = !DILocation(line: 1155, column: 4, scope: !2675)
!2675 = distinct !DILexicalBlock(scope: !2652, file: !20, line: 1154, column: 8)
!2676 = !DILocation(line: 1155, column: 10, scope: !2675)
!2677 = !DILocation(line: 1155, column: 31, scope: !2675)
!2678 = !DILocation(line: 1156, column: 4, scope: !2675)
!2679 = !DILocation(line: 1156, column: 10, scope: !2675)
!2680 = !DILocation(line: 1156, column: 32, scope: !2675)
!2681 = !DILocation(line: 1159, column: 2, scope: !2653)
!2682 = !DILocation(line: 1161, column: 3, scope: !2649)
!2683 = !DILocation(line: 1161, column: 8, scope: !2649)
!2684 = !DILocation(line: 1161, column: 19, scope: !2649)
!2685 = !DILocation(line: 1165, column: 6, scope: !2686)
!2686 = distinct !DILexicalBlock(scope: !2069, file: !20, line: 1165, column: 6)
!2687 = !DILocation(line: 1165, column: 21, scope: !2686)
!2688 = !DILocation(line: 1165, column: 25, scope: !2686)
!2689 = !DILocation(line: 1165, column: 31, scope: !2686)
!2690 = !DILocation(line: 1165, column: 53, scope: !2686)
!2691 = !DILocation(line: 1166, column: 8, scope: !2692)
!2692 = distinct !DILexicalBlock(scope: !2686, file: !20, line: 1166, column: 7)
!2693 = !DILocation(line: 1166, column: 23, scope: !2692)
!2694 = !DILocation(line: 1166, column: 37, scope: !2692)
!2695 = !DILocation(line: 1166, column: 41, scope: !2692)
!2696 = !DILocation(line: 1166, column: 52, scope: !2692)
!2697 = !DILocation(line: 1166, column: 62, scope: !2692)
!2698 = !DILocation(line: 1166, column: 50, scope: !2692)
!2699 = !DILocation(line: 1167, column: 9, scope: !2700)
!2700 = distinct !DILexicalBlock(scope: !2701, file: !20, line: 1167, column: 8)
!2701 = distinct !DILexicalBlock(scope: !2692, file: !20, line: 1166, column: 68)
!2702 = !DILocation(line: 1167, column: 14, scope: !2700)
!2703 = !DILocation(line: 1167, column: 23, scope: !2700)
!2704 = !DILocation(line: 1167, column: 37, scope: !2700)
!2705 = !DILocation(line: 1167, column: 41, scope: !2700)
!2706 = !DILocation(line: 1167, column: 46, scope: !2700)
!2707 = !DILocation(line: 1167, column: 55, scope: !2700)
!2708 = !DILocation(line: 1168, column: 35, scope: !2709)
!2709 = distinct !DILexicalBlock(scope: !2710, file: !20, line: 1168, column: 9)
!2710 = distinct !DILexicalBlock(scope: !2700, file: !20, line: 1167, column: 73)
!2711 = !DILocation(line: 1168, column: 10, scope: !2709)
!2712 = !DILocation(line: 1168, column: 9, scope: !2709)
!2713 = !DILocation(line: 1169, column: 6, scope: !2709)
!2714 = !DILocation(line: 1171, column: 34, scope: !2710)
!2715 = !DILocation(line: 1171, column: 5, scope: !2710)
!2716 = !DILocation(line: 1174, column: 12, scope: !2717)
!2717 = distinct !DILexicalBlock(scope: !2710, file: !20, line: 1174, column: 9)
!2718 = !DILocation(line: 1174, column: 18, scope: !2717)
!2719 = !DILocation(line: 1174, column: 23, scope: !2717)
!2720 = !DILocation(line: 1174, column: 43, scope: !2717)
!2721 = !DILocation(line: 1174, column: 47, scope: !2717)
!2722 = !DILocation(line: 1174, column: 52, scope: !2717)
!2723 = !DILocation(line: 1174, column: 69, scope: !2717)
!2724 = !DILocation(line: 1174, column: 74, scope: !2717)
!2725 = !DILocation(line: 1174, column: 86, scope: !2717)
!2726 = !DILocation(line: 1174, column: 67, scope: !2717)
!2727 = !DILocation(line: 1174, column: 9, scope: !2717)
!2728 = !DILocation(line: 1175, column: 11, scope: !2729)
!2729 = distinct !DILexicalBlock(scope: !2717, file: !20, line: 1175, column: 10)
!2730 = !DILocation(line: 1175, column: 16, scope: !2729)
!2731 = !DILocation(line: 1175, column: 25, scope: !2729)
!2732 = !DILocation(line: 1175, column: 39, scope: !2729)
!2733 = !DILocation(line: 1175, column: 43, scope: !2729)
!2734 = !DILocation(line: 1175, column: 48, scope: !2729)
!2735 = !DILocation(line: 1175, column: 57, scope: !2729)
!2736 = !DILocation(line: 1176, column: 11, scope: !2737)
!2737 = distinct !DILexicalBlock(scope: !2738, file: !20, line: 1176, column: 11)
!2738 = distinct !DILexicalBlock(scope: !2729, file: !20, line: 1175, column: 75)
!2739 = !DILocation(line: 1176, column: 26, scope: !2737)
!2740 = !DILocation(line: 1177, column: 30, scope: !2737)
!2741 = !DILocation(line: 1177, column: 8, scope: !2737)
!2742 = !DILocation(line: 1179, column: 30, scope: !2737)
!2743 = !DILocation(line: 1179, column: 8, scope: !2737)
!2744 = !DILocation(line: 1180, column: 6, scope: !2738)
!2745 = !DILocation(line: 1175, column: 72, scope: !2729)
!2746 = !DILocation(line: 1181, column: 4, scope: !2710)
!2747 = !DILocation(line: 1182, column: 3, scope: !2701)
!2748 = !DILocation(line: 1166, column: 65, scope: !2692)
!2749 = !DILocation(line: 1194, column: 7, scope: !2750)
!2750 = distinct !DILexicalBlock(scope: !2069, file: !20, line: 1194, column: 6)
!2751 = !DILocation(line: 1194, column: 13, scope: !2750)
!2752 = !DILocation(line: 1194, column: 35, scope: !2750)
!2753 = !DILocation(line: 1194, column: 65, scope: !2750)
!2754 = !DILocation(line: 1194, column: 69, scope: !2750)
!2755 = !DILocation(line: 1194, column: 75, scope: !2750)
!2756 = !DILocation(line: 1194, column: 97, scope: !2750)
!2757 = !DILocation(line: 1195, column: 23, scope: !2758)
!2758 = distinct !DILexicalBlock(scope: !2750, file: !20, line: 1194, column: 122)
!2759 = !DILocation(line: 1195, column: 42, scope: !2758)
!2760 = !DILocation(line: 1195, column: 84, scope: !2758)
!2761 = !DILocation(line: 1195, column: 3, scope: !2758)
!2762 = !DILocation(line: 1196, column: 7, scope: !2763)
!2763 = distinct !DILexicalBlock(scope: !2758, file: !20, line: 1196, column: 7)
!2764 = !DILocation(line: 1196, column: 25, scope: !2763)
!2765 = !DILocation(line: 1197, column: 22, scope: !2763)
!2766 = !DILocation(line: 1197, column: 4, scope: !2763)
!2767 = !DILocation(line: 1198, column: 2, scope: !2758)
!2768 = !DILocation(line: 1199, column: 13, scope: !2769)
!2769 = distinct !DILexicalBlock(scope: !2750, file: !20, line: 1199, column: 11)
!2770 = !DILocation(line: 1199, column: 21, scope: !2769)
!2771 = !DILocation(line: 1199, column: 26, scope: !2769)
!2772 = !DILocation(line: 1199, column: 32, scope: !2769)
!2773 = !DILocation(line: 1199, column: 36, scope: !2769)
!2774 = !DILocation(line: 1199, column: 56, scope: !2769)
!2775 = !DILocation(line: 1199, column: 60, scope: !2769)
!2776 = !DILocation(line: 1199, column: 75, scope: !2769)
!2777 = !DILocalVariable(name: "sval", scope: !2778, file: !20, line: 1200, type: !36)
!2778 = distinct !DILexicalBlock(scope: !2769, file: !20, line: 1199, column: 90)
!2779 = !DILocation(line: 1200, column: 7, scope: !2778)
!2780 = !DILocalVariable(name: "rval", scope: !2778, file: !20, line: 1200, type: !36)
!2781 = !DILocation(line: 1200, column: 13, scope: !2778)
!2782 = !DILocation(line: 1202, column: 10, scope: !2778)
!2783 = !DILocation(line: 1202, column: 8, scope: !2778)
!2784 = !DILocation(line: 1203, column: 11, scope: !2778)
!2785 = !DILocation(line: 1203, column: 29, scope: !2778)
!2786 = !DILocation(line: 1203, column: 46, scope: !2778)
!2787 = !DILocation(line: 1203, column: 26, scope: !2778)
!2788 = !DILocation(line: 1203, column: 52, scope: !2778)
!2789 = !DILocation(line: 1203, column: 8, scope: !2778)
!2790 = !DILocation(line: 1205, column: 7, scope: !2791)
!2791 = distinct !DILexicalBlock(scope: !2778, file: !20, line: 1205, column: 7)
!2792 = !DILocation(line: 1205, column: 14, scope: !2791)
!2793 = !DILocation(line: 1206, column: 3, scope: !2794)
!2794 = distinct !DILexicalBlock(scope: !2791, file: !20, line: 1205, column: 21)
!2795 = !DILocation(line: 1208, column: 15, scope: !2796)
!2796 = distinct !DILexicalBlock(scope: !2778, file: !20, line: 1208, column: 7)
!2797 = !DILocation(line: 1208, column: 21, scope: !2796)
!2798 = !DILocation(line: 1208, column: 8, scope: !2796)
!2799 = !DILocation(line: 1208, column: 29, scope: !2796)
!2800 = !DILocation(line: 1208, column: 27, scope: !2796)
!2801 = !DILocation(line: 1208, column: 40, scope: !2796)
!2802 = !DILocation(line: 1208, column: 52, scope: !2796)
!2803 = !DILocation(line: 1208, column: 44, scope: !2796)
!2804 = !DILocation(line: 1208, column: 64, scope: !2796)
!2805 = !DILocation(line: 1208, column: 70, scope: !2796)
!2806 = !DILocation(line: 1208, column: 43, scope: !2796)
!2807 = !DILocation(line: 1209, column: 4, scope: !2808)
!2808 = distinct !DILexicalBlock(scope: !2796, file: !20, line: 1208, column: 100)
!2809 = !DILocation(line: 1209, column: 10, scope: !2808)
!2810 = !DILocation(line: 1209, column: 32, scope: !2808)
!2811 = !DILocation(line: 1210, column: 4, scope: !2808)
!2812 = !DILocation(line: 1210, column: 10, scope: !2808)
!2813 = !DILocation(line: 1210, column: 32, scope: !2808)
!2814 = !DILocation(line: 1211, column: 24, scope: !2808)
!2815 = !DILocation(line: 1211, column: 43, scope: !2808)
!2816 = !DILocation(line: 1211, column: 85, scope: !2808)
!2817 = !DILocation(line: 1211, column: 4, scope: !2808)
!2818 = !DILocation(line: 1212, column: 8, scope: !2819)
!2819 = distinct !DILexicalBlock(scope: !2808, file: !20, line: 1212, column: 8)
!2820 = !DILocation(line: 1212, column: 26, scope: !2819)
!2821 = !DILocation(line: 1213, column: 23, scope: !2822)
!2822 = distinct !DILexicalBlock(scope: !2819, file: !20, line: 1212, column: 32)
!2823 = !DILocation(line: 1215, column: 4, scope: !2822)
!2824 = !DILocation(line: 1216, column: 3, scope: !2808)
!2825 = !DILocation(line: 1219, column: 2, scope: !2778)
!2826 = !DILocation(line: 1223, column: 7, scope: !2827)
!2827 = distinct !DILexicalBlock(scope: !2069, file: !20, line: 1223, column: 6)
!2828 = !DILocation(line: 1223, column: 12, scope: !2827)
!2829 = !DILocation(line: 1223, column: 23, scope: !2827)
!2830 = !DILocation(line: 1223, column: 36, scope: !2827)
!2831 = !DILocation(line: 1223, column: 40, scope: !2827)
!2832 = !DILocation(line: 1223, column: 45, scope: !2827)
!2833 = !DILocation(line: 1223, column: 59, scope: !2827)
!2834 = !DILocation(line: 1224, column: 3, scope: !2827)
!2835 = !DILocation(line: 1224, column: 8, scope: !2827)
!2836 = !DILocation(line: 1224, column: 19, scope: !2827)
!2837 = !DILocation(line: 1228, column: 6, scope: !2838)
!2838 = distinct !DILexicalBlock(scope: !2069, file: !20, line: 1228, column: 6)
!2839 = !DILocation(line: 1228, column: 24, scope: !2838)
!2840 = !DILocation(line: 1228, column: 28, scope: !2838)
!2841 = !DILocation(line: 1228, column: 43, scope: !2838)
!2842 = !DILocation(line: 1229, column: 40, scope: !2843)
!2843 = distinct !DILexicalBlock(scope: !2838, file: !20, line: 1228, column: 58)
!2844 = !DILocation(line: 1229, column: 21, scope: !2843)
!2845 = !DILocation(line: 1229, column: 19, scope: !2843)
!2846 = !DILocation(line: 1230, column: 7, scope: !2847)
!2847 = distinct !DILexicalBlock(scope: !2843, file: !20, line: 1230, column: 7)
!2848 = !DILocation(line: 1231, column: 23, scope: !2847)
!2849 = !DILocation(line: 1231, column: 4, scope: !2847)
!2850 = !DILocation(line: 1233, column: 2, scope: !2843)
!2851 = !DILocation(line: 1237, column: 24, scope: !2852)
!2852 = distinct !DILexicalBlock(scope: !2838, file: !20, line: 1234, column: 7)
!2853 = !DILocation(line: 1237, column: 29, scope: !2852)
!2854 = !DILocation(line: 1237, column: 3, scope: !2852)
!2855 = !DILocation(line: 1237, column: 8, scope: !2852)
!2856 = !DILocation(line: 1237, column: 22, scope: !2852)
!2857 = !DILocation(line: 1238, column: 19, scope: !2852)
!2858 = !DILocation(line: 1241, column: 21, scope: !2069)
!2859 = !DILocation(line: 1241, column: 26, scope: !2069)
!2860 = !DILocation(line: 1241, column: 10, scope: !2069)
!2861 = !DILocation(line: 1241, column: 30, scope: !2069)
!2862 = !DILocation(line: 1241, column: 2, scope: !2069)
!2863 = !DILocation(line: 1243, column: 3, scope: !2864)
!2864 = distinct !DILexicalBlock(scope: !2069, file: !20, line: 1241, column: 41)
!2865 = !DILocation(line: 1247, column: 3, scope: !2864)
!2866 = !DILocation(line: 1248, column: 3, scope: !2864)
!2867 = !DILocalVariable(name: "pv", scope: !2868, file: !20, line: 1251, type: !7)
!2868 = distinct !DILexicalBlock(scope: !2864, file: !20, line: 1250, column: 11)
!2869 = !DILocation(line: 1251, column: 7, scope: !2868)
!2870 = !DILocalVariable(name: "dtp", scope: !2868, file: !20, line: 1252, type: !36)
!2871 = !DILocation(line: 1252, column: 7, scope: !2868)
!2872 = !DILocation(line: 1252, column: 13, scope: !2868)
!2873 = !DILocation(line: 1252, column: 28, scope: !2868)
!2874 = !DILocation(line: 1254, column: 7, scope: !2875)
!2875 = distinct !DILexicalBlock(scope: !2868, file: !20, line: 1254, column: 7)
!2876 = !DILocation(line: 1254, column: 12, scope: !2875)
!2877 = !DILocation(line: 1254, column: 23, scope: !2875)
!2878 = !DILocation(line: 1255, column: 4, scope: !2875)
!2879 = !DILocation(line: 1255, column: 9, scope: !2875)
!2880 = !DILocation(line: 1255, column: 20, scope: !2875)
!2881 = !DILocation(line: 1256, column: 7, scope: !2882)
!2882 = distinct !DILexicalBlock(scope: !2868, file: !20, line: 1256, column: 7)
!2883 = !DILocation(line: 1256, column: 12, scope: !2882)
!2884 = !DILocation(line: 1256, column: 26, scope: !2882)
!2885 = !DILocation(line: 1257, column: 4, scope: !2882)
!2886 = !DILocation(line: 1257, column: 9, scope: !2882)
!2887 = !DILocation(line: 1257, column: 23, scope: !2882)
!2888 = !DILocation(line: 1259, column: 23, scope: !2868)
!2889 = !DILocation(line: 1259, column: 42, scope: !2868)
!2890 = !DILocation(line: 1259, column: 84, scope: !2868)
!2891 = !DILocation(line: 1259, column: 3, scope: !2868)
!2892 = !DILocation(line: 1261, column: 8, scope: !2868)
!2893 = !DILocation(line: 1261, column: 6, scope: !2868)
!2894 = !DILocation(line: 1264, column: 15, scope: !2895)
!2895 = distinct !DILexicalBlock(scope: !2868, file: !20, line: 1264, column: 7)
!2896 = !DILocation(line: 1264, column: 7, scope: !2895)
!2897 = !DILocation(line: 1264, column: 27, scope: !2895)
!2898 = !DILocation(line: 1264, column: 33, scope: !2895)
!2899 = !DILocation(line: 1265, column: 7, scope: !2900)
!2900 = distinct !DILexicalBlock(scope: !2895, file: !20, line: 1264, column: 57)
!2901 = !DILocation(line: 1266, column: 29, scope: !2900)
!2902 = !DILocation(line: 1266, column: 44, scope: !2900)
!2903 = !DILocation(line: 1266, column: 50, scope: !2900)
!2904 = !DILocation(line: 1266, column: 55, scope: !2900)
!2905 = !DILocation(line: 1266, column: 10, scope: !2900)
!2906 = !DILocation(line: 1266, column: 60, scope: !2900)
!2907 = !DILocation(line: 1266, column: 8, scope: !2900)
!2908 = !DILocation(line: 1267, column: 3, scope: !2900)
!2909 = !DILocation(line: 1269, column: 17, scope: !2868)
!2910 = !DILocation(line: 1269, column: 22, scope: !2868)
!2911 = !DILocation(line: 1269, column: 3, scope: !2868)
!2912 = !DILocation(line: 1271, column: 5, scope: !2864)
!2913 = !DILocation(line: 1277, column: 9, scope: !2914)
!2914 = distinct !DILexicalBlock(scope: !2069, file: !20, line: 1277, column: 6)
!2915 = !DILocation(line: 1277, column: 14, scope: !2914)
!2916 = !DILocation(line: 1277, column: 23, scope: !2914)
!2917 = !DILocation(line: 1277, column: 37, scope: !2914)
!2918 = !DILocation(line: 1277, column: 41, scope: !2914)
!2919 = !DILocation(line: 1277, column: 47, scope: !2914)
!2920 = !DILocation(line: 1277, column: 52, scope: !2914)
!2921 = !DILocation(line: 1277, column: 72, scope: !2914)
!2922 = !DILocation(line: 1277, column: 76, scope: !2914)
!2923 = !DILocation(line: 1277, column: 84, scope: !2914)
!2924 = !DILocation(line: 1277, column: 94, scope: !2914)
!2925 = !DILocation(line: 1277, column: 98, scope: !2914)
!2926 = !DILocation(line: 1277, column: 106, scope: !2914)
!2927 = !DILocation(line: 1277, column: 112, scope: !2914)
!2928 = !DILocation(line: 1277, column: 116, scope: !2914)
!2929 = !DILocation(line: 1277, column: 122, scope: !2914)
!2930 = !DILocation(line: 1277, column: 144, scope: !2914)
!2931 = !DILocation(line: 1279, column: 7, scope: !2932)
!2932 = distinct !DILexicalBlock(scope: !2933, file: !20, line: 1279, column: 7)
!2933 = distinct !DILexicalBlock(scope: !2914, file: !20, line: 1277, column: 178)
!2934 = !DILocation(line: 1279, column: 26, scope: !2932)
!2935 = !DILocation(line: 1279, column: 23, scope: !2932)
!2936 = !DILocation(line: 1281, column: 9, scope: !2937)
!2937 = distinct !DILexicalBlock(scope: !2938, file: !20, line: 1281, column: 8)
!2938 = distinct !DILexicalBlock(scope: !2932, file: !20, line: 1279, column: 34)
!2939 = !DILocation(line: 1281, column: 14, scope: !2937)
!2940 = !DILocation(line: 1281, column: 23, scope: !2937)
!2941 = !DILocation(line: 1281, column: 39, scope: !2937)
!2942 = !DILocation(line: 1281, column: 43, scope: !2937)
!2943 = !DILocation(line: 1281, column: 49, scope: !2937)
!2944 = !DILocation(line: 1281, column: 54, scope: !2937)
!2945 = !DILocation(line: 1281, column: 74, scope: !2937)
!2946 = !DILocation(line: 1281, column: 78, scope: !2937)
!2947 = !DILocation(line: 1281, column: 83, scope: !2937)
!2948 = !DILocation(line: 1281, column: 99, scope: !2937)
!2949 = !DILocation(line: 1281, column: 104, scope: !2937)
!2950 = !DILocation(line: 1281, column: 96, scope: !2937)
!2951 = !DILocation(line: 1282, column: 9, scope: !2952)
!2952 = distinct !DILexicalBlock(scope: !2953, file: !20, line: 1282, column: 9)
!2953 = distinct !DILexicalBlock(scope: !2937, file: !20, line: 1281, column: 113)
!2954 = !DILocation(line: 1282, column: 24, scope: !2952)
!2955 = !DILocation(line: 1283, column: 6, scope: !2952)
!2956 = !DILocation(line: 1284, column: 4, scope: !2953)
!2957 = !DILocation(line: 1285, column: 15, scope: !2958)
!2958 = distinct !DILexicalBlock(scope: !2937, file: !20, line: 1285, column: 13)
!2959 = !DILocation(line: 1285, column: 21, scope: !2958)
!2960 = !DILocation(line: 1285, column: 42, scope: !2958)
!2961 = !DILocation(line: 1285, column: 47, scope: !2958)
!2962 = !DILocation(line: 1285, column: 62, scope: !2958)
!2963 = !DILocation(line: 1285, column: 70, scope: !2958)
!2964 = !DILocation(line: 1285, column: 76, scope: !2958)
!2965 = !DILocation(line: 1285, column: 68, scope: !2958)
!2966 = !DILocation(line: 1286, column: 9, scope: !2967)
!2967 = distinct !DILexicalBlock(scope: !2968, file: !20, line: 1286, column: 9)
!2968 = distinct !DILexicalBlock(scope: !2958, file: !20, line: 1285, column: 99)
!2969 = !DILocation(line: 1286, column: 17, scope: !2967)
!2970 = !DILocation(line: 1287, column: 6, scope: !2967)
!2971 = !DILocation(line: 1288, column: 5, scope: !2968)
!2972 = !DILocation(line: 1291, column: 3, scope: !2938)
!2973 = !DILocation(line: 1293, column: 2, scope: !2933)
!2974 = !DILocation(line: 1298, column: 34, scope: !2069)
!2975 = !DILocation(line: 1298, column: 41, scope: !2069)
!2976 = !DILocation(line: 1298, column: 51, scope: !2069)
!2977 = !DILocation(line: 1298, column: 49, scope: !2069)
!2978 = !DILocation(line: 1298, column: 31, scope: !2069)
!2979 = !DILocation(line: 1298, column: 62, scope: !2069)
!2980 = !DILocation(line: 1298, column: 2, scope: !2069)
!2981 = !DILocation(line: 1298, column: 8, scope: !2069)
!2982 = !DILocation(line: 1298, column: 29, scope: !2069)
!2983 = !DILocation(line: 1302, column: 10, scope: !2069)
!2984 = !DILocation(line: 1302, column: 15, scope: !2069)
!2985 = !DILocation(line: 1302, column: 2, scope: !2069)
!2986 = !DILocation(line: 1306, column: 7, scope: !2987)
!2987 = distinct !DILexicalBlock(scope: !2988, file: !20, line: 1306, column: 7)
!2988 = distinct !DILexicalBlock(scope: !2069, file: !20, line: 1302, column: 19)
!2989 = !DILocation(line: 1306, column: 22, scope: !2987)
!2990 = !DILocation(line: 1306, column: 32, scope: !2987)
!2991 = !DILocation(line: 1306, column: 37, scope: !2987)
!2992 = !DILocation(line: 1306, column: 29, scope: !2987)
!2993 = !DILocation(line: 1307, column: 34, scope: !2994)
!2994 = distinct !DILexicalBlock(scope: !2995, file: !20, line: 1307, column: 8)
!2995 = distinct !DILexicalBlock(scope: !2987, file: !20, line: 1306, column: 45)
!2996 = !DILocation(line: 1307, column: 9, scope: !2994)
!2997 = !DILocation(line: 1307, column: 8, scope: !2994)
!2998 = !DILocation(line: 1308, column: 5, scope: !2994)
!2999 = !DILocation(line: 1309, column: 24, scope: !2995)
!3000 = !DILocation(line: 1309, column: 43, scope: !2995)
!3001 = !DILocation(line: 1309, column: 85, scope: !2995)
!3002 = !DILocation(line: 1309, column: 4, scope: !2995)
!3003 = !DILocation(line: 1310, column: 26, scope: !2995)
!3004 = !DILocation(line: 1310, column: 4, scope: !2995)
!3005 = !DILocation(line: 1311, column: 33, scope: !2995)
!3006 = !DILocation(line: 1311, column: 4, scope: !2995)
!3007 = !DILocation(line: 1312, column: 3, scope: !2995)
!3008 = !DILocation(line: 1313, column: 12, scope: !3009)
!3009 = distinct !DILexicalBlock(scope: !2987, file: !20, line: 1313, column: 12)
!3010 = !DILocation(line: 1313, column: 18, scope: !3009)
!3011 = !DILocation(line: 1313, column: 23, scope: !3009)
!3012 = !DILocalVariable(name: "r", scope: !3013, file: !20, line: 1314, type: !7)
!3013 = distinct !DILexicalBlock(scope: !3009, file: !20, line: 1313, column: 37)
!3014 = !DILocation(line: 1314, column: 8, scope: !3013)
!3015 = !DILocation(line: 1316, column: 34, scope: !3013)
!3016 = !DILocation(line: 1316, column: 39, scope: !3013)
!3017 = !DILocation(line: 1316, column: 8, scope: !3013)
!3018 = !DILocation(line: 1316, column: 6, scope: !3013)
!3019 = !DILocation(line: 1317, column: 8, scope: !3020)
!3020 = distinct !DILexicalBlock(scope: !3013, file: !20, line: 1317, column: 8)
!3021 = !DILocation(line: 1317, column: 10, scope: !3020)
!3022 = !DILocation(line: 1318, column: 5, scope: !3023)
!3023 = distinct !DILexicalBlock(scope: !3020, file: !20, line: 1317, column: 17)
!3024 = !DILocation(line: 1318, column: 11, scope: !3023)
!3025 = !DILocation(line: 1318, column: 16, scope: !3023)
!3026 = !DILocation(line: 1319, column: 21, scope: !3023)
!3027 = !DILocation(line: 1319, column: 5, scope: !3023)
!3028 = !DILocation(line: 1319, column: 10, scope: !3023)
!3029 = !DILocation(line: 1319, column: 19, scope: !3023)
!3030 = !DILocation(line: 1320, column: 4, scope: !3023)
!3031 = !DILocation(line: 1321, column: 13, scope: !3032)
!3032 = distinct !DILexicalBlock(scope: !3020, file: !20, line: 1321, column: 13)
!3033 = !DILocation(line: 1321, column: 19, scope: !3032)
!3034 = !DILocation(line: 1321, column: 24, scope: !3032)
!3035 = !DILocation(line: 1322, column: 35, scope: !3036)
!3036 = distinct !DILexicalBlock(scope: !3037, file: !20, line: 1322, column: 9)
!3037 = distinct !DILexicalBlock(scope: !3032, file: !20, line: 1321, column: 44)
!3038 = !DILocation(line: 1322, column: 10, scope: !3036)
!3039 = !DILocation(line: 1322, column: 9, scope: !3036)
!3040 = !DILocation(line: 1323, column: 6, scope: !3036)
!3041 = !DILocation(line: 1324, column: 35, scope: !3037)
!3042 = !DILocation(line: 1324, column: 44, scope: !3037)
!3043 = !DILocation(line: 1324, column: 42, scope: !3037)
!3044 = !DILocation(line: 1324, column: 5, scope: !3037)
!3045 = !DILocation(line: 1325, column: 34, scope: !3037)
!3046 = !DILocation(line: 1325, column: 5, scope: !3037)
!3047 = !DILocation(line: 1326, column: 4, scope: !3037)
!3048 = !DILocation(line: 1328, column: 8, scope: !3049)
!3049 = distinct !DILexicalBlock(scope: !3013, file: !20, line: 1328, column: 8)
!3050 = !DILocation(line: 1328, column: 14, scope: !3049)
!3051 = !DILocation(line: 1328, column: 31, scope: !3049)
!3052 = !DILocation(line: 1329, column: 25, scope: !3053)
!3053 = distinct !DILexicalBlock(scope: !3049, file: !20, line: 1328, column: 36)
!3054 = !DILocation(line: 1329, column: 44, scope: !3053)
!3055 = !DILocation(line: 1329, column: 86, scope: !3053)
!3056 = !DILocation(line: 1329, column: 5, scope: !3053)
!3057 = !DILocation(line: 1330, column: 9, scope: !3058)
!3058 = distinct !DILexicalBlock(scope: !3053, file: !20, line: 1330, column: 9)
!3059 = !DILocation(line: 1331, column: 6, scope: !3060)
!3060 = distinct !DILexicalBlock(scope: !3058, file: !20, line: 1330, column: 28)
!3061 = !DILocation(line: 1332, column: 38, scope: !3060)
!3062 = !DILocation(line: 1332, column: 36, scope: !3060)
!3063 = !DILocation(line: 1332, column: 56, scope: !3060)
!3064 = !DILocation(line: 1332, column: 60, scope: !3060)
!3065 = !DILocation(line: 1332, column: 6, scope: !3060)
!3066 = !DILocation(line: 1332, column: 12, scope: !3060)
!3067 = !DILocation(line: 1332, column: 29, scope: !3060)
!3068 = !DILocation(line: 1333, column: 5, scope: !3060)
!3069 = !DILocation(line: 1334, column: 4, scope: !3053)
!3070 = !DILocation(line: 1335, column: 3, scope: !3013)
!3071 = !DILocation(line: 1337, column: 24, scope: !3072)
!3072 = distinct !DILexicalBlock(scope: !3009, file: !20, line: 1336, column: 8)
!3073 = !DILocation(line: 1337, column: 43, scope: !3072)
!3074 = !DILocation(line: 1337, column: 85, scope: !3072)
!3075 = !DILocation(line: 1337, column: 4, scope: !3072)
!3076 = !DILocation(line: 1338, column: 8, scope: !3077)
!3077 = distinct !DILexicalBlock(scope: !3072, file: !20, line: 1338, column: 8)
!3078 = !DILocation(line: 1339, column: 35, scope: !3079)
!3079 = distinct !DILexicalBlock(scope: !3080, file: !20, line: 1339, column: 9)
!3080 = distinct !DILexicalBlock(scope: !3077, file: !20, line: 1338, column: 27)
!3081 = !DILocation(line: 1339, column: 10, scope: !3079)
!3082 = !DILocation(line: 1339, column: 9, scope: !3079)
!3083 = !DILocation(line: 1340, column: 6, scope: !3079)
!3084 = !DILocation(line: 1341, column: 35, scope: !3080)
!3085 = !DILocation(line: 1341, column: 44, scope: !3080)
!3086 = !DILocation(line: 1341, column: 42, scope: !3080)
!3087 = !DILocation(line: 1341, column: 5, scope: !3080)
!3088 = !DILocation(line: 1342, column: 34, scope: !3080)
!3089 = !DILocation(line: 1342, column: 5, scope: !3080)
!3090 = !DILocation(line: 1343, column: 4, scope: !3080)
!3091 = !DILocation(line: 1345, column: 3, scope: !2988)
!3092 = !DILocation(line: 1347, column: 3, scope: !2988)
!3093 = !DILocation(line: 1350, column: 6, scope: !3094)
!3094 = distinct !DILexicalBlock(scope: !2069, file: !20, line: 1350, column: 6)
!3095 = !DILocation(line: 1350, column: 11, scope: !3094)
!3096 = !DILocation(line: 1350, column: 20, scope: !3094)
!3097 = !DILocation(line: 1351, column: 8, scope: !3098)
!3098 = distinct !DILexicalBlock(scope: !3099, file: !20, line: 1351, column: 7)
!3099 = distinct !DILexicalBlock(scope: !3094, file: !20, line: 1350, column: 34)
!3100 = !DILocation(line: 1351, column: 18, scope: !3098)
!3101 = !DILocation(line: 1351, column: 7, scope: !3098)
!3102 = !DILocation(line: 1351, column: 30, scope: !3098)
!3103 = !DILocation(line: 1351, column: 34, scope: !3098)
!3104 = !DILocation(line: 1351, column: 42, scope: !3098)
!3105 = !DILocation(line: 1352, column: 4, scope: !3106)
!3106 = distinct !DILexicalBlock(scope: !3098, file: !20, line: 1351, column: 49)
!3107 = !DILocation(line: 1352, column: 9, scope: !3106)
!3108 = !DILocation(line: 1352, column: 18, scope: !3106)
!3109 = !DILocation(line: 1353, column: 4, scope: !3106)
!3110 = !DILocation(line: 1353, column: 10, scope: !3106)
!3111 = !DILocation(line: 1353, column: 15, scope: !3106)
!3112 = !DILocation(line: 1354, column: 4, scope: !3106)
!3113 = !DILocation(line: 1357, column: 9, scope: !3114)
!3114 = distinct !DILexicalBlock(scope: !3099, file: !20, line: 1357, column: 7)
!3115 = !DILocation(line: 1357, column: 17, scope: !3114)
!3116 = !DILocation(line: 1357, column: 8, scope: !3114)
!3117 = !DILocation(line: 1357, column: 22, scope: !3114)
!3118 = !DILocation(line: 1357, column: 25, scope: !3114)
!3119 = !DILocation(line: 1358, column: 24, scope: !3120)
!3120 = distinct !DILexicalBlock(scope: !3114, file: !20, line: 1357, column: 46)
!3121 = !DILocation(line: 1358, column: 43, scope: !3120)
!3122 = !DILocation(line: 1358, column: 85, scope: !3120)
!3123 = !DILocation(line: 1358, column: 4, scope: !3120)
!3124 = !DILocation(line: 1361, column: 8, scope: !3125)
!3125 = distinct !DILexicalBlock(scope: !3120, file: !20, line: 1361, column: 8)
!3126 = !DILocation(line: 1361, column: 14, scope: !3125)
!3127 = !DILocation(line: 1361, column: 19, scope: !3125)
!3128 = !DILocation(line: 1362, column: 9, scope: !3129)
!3129 = distinct !DILexicalBlock(scope: !3125, file: !20, line: 1362, column: 9)
!3130 = !DILocation(line: 1362, column: 27, scope: !3129)
!3131 = !DILocation(line: 1362, column: 31, scope: !3129)
!3132 = !DILocation(line: 1362, column: 37, scope: !3129)
!3133 = !DILocation(line: 1362, column: 59, scope: !3129)
!3134 = !DILocation(line: 1363, column: 6, scope: !3129)
!3135 = !DILocation(line: 1363, column: 12, scope: !3129)
!3136 = !DILocation(line: 1363, column: 17, scope: !3129)
!3137 = !DILocation(line: 1362, column: 87, scope: !3129)
!3138 = !DILocation(line: 1365, column: 9, scope: !3139)
!3139 = distinct !DILexicalBlock(scope: !3120, file: !20, line: 1365, column: 8)
!3140 = !DILocation(line: 1365, column: 17, scope: !3139)
!3141 = !DILocation(line: 1365, column: 23, scope: !3139)
!3142 = !DILocation(line: 1365, column: 27, scope: !3139)
!3143 = !DILocation(line: 1365, column: 33, scope: !3139)
!3144 = !DILocation(line: 1365, column: 38, scope: !3139)
!3145 = !DILocation(line: 1366, column: 20, scope: !3139)
!3146 = !DILocation(line: 1366, column: 25, scope: !3139)
!3147 = !DILocation(line: 1366, column: 41, scope: !3139)
!3148 = !DILocation(line: 1366, column: 5, scope: !3139)
!3149 = !DILocation(line: 1367, column: 3, scope: !3120)
!3150 = !DILocation(line: 1368, column: 13, scope: !3151)
!3151 = distinct !DILexicalBlock(scope: !3114, file: !20, line: 1368, column: 12)
!3152 = !DILocation(line: 1368, column: 21, scope: !3151)
!3153 = !DILocation(line: 1368, column: 27, scope: !3151)
!3154 = !DILocation(line: 1368, column: 31, scope: !3151)
!3155 = !DILocation(line: 1368, column: 39, scope: !3151)
!3156 = !DILocation(line: 1369, column: 4, scope: !3151)
!3157 = !DILocation(line: 1370, column: 2, scope: !3099)
!3158 = !DILocation(line: 1373, column: 6, scope: !3159)
!3159 = distinct !DILexicalBlock(scope: !2069, file: !20, line: 1373, column: 6)
!3160 = !DILocation(line: 1373, column: 14, scope: !3159)
!3161 = !DILocation(line: 1375, column: 23, scope: !3162)
!3162 = distinct !DILexicalBlock(scope: !3159, file: !20, line: 1373, column: 25)
!3163 = !DILocation(line: 1375, column: 42, scope: !3162)
!3164 = !DILocation(line: 1375, column: 84, scope: !3162)
!3165 = !DILocation(line: 1375, column: 3, scope: !3162)
!3166 = !DILocation(line: 1376, column: 7, scope: !3167)
!3167 = distinct !DILexicalBlock(scope: !3162, file: !20, line: 1376, column: 7)
!3168 = !DILocation(line: 1376, column: 14, scope: !3167)
!3169 = !DILocation(line: 1376, column: 20, scope: !3167)
!3170 = !DILocation(line: 1376, column: 23, scope: !3167)
!3171 = !DILocation(line: 1376, column: 32, scope: !3167)
!3172 = !DILocation(line: 1376, column: 41, scope: !3167)
!3173 = !DILocation(line: 1376, column: 44, scope: !3167)
!3174 = !DILocation(line: 1376, column: 53, scope: !3167)
!3175 = !DILocation(line: 1377, column: 12, scope: !3167)
!3176 = !DILocation(line: 1378, column: 5, scope: !3167)
!3177 = !DILocation(line: 1378, column: 21, scope: !3167)
!3178 = !DILocation(line: 1378, column: 40, scope: !3167)
!3179 = !DILocation(line: 1378, column: 46, scope: !3167)
!3180 = !DILocation(line: 1378, column: 69, scope: !3167)
!3181 = !DILocation(line: 1377, column: 4, scope: !3167)
!3182 = !DILocation(line: 1379, column: 19, scope: !3162)
!3183 = !DILocation(line: 1379, column: 24, scope: !3162)
!3184 = !DILocation(line: 1379, column: 40, scope: !3162)
!3185 = !DILocation(line: 1379, column: 3, scope: !3162)
!3186 = !DILocation(line: 1380, column: 7, scope: !3187)
!3187 = distinct !DILexicalBlock(scope: !3162, file: !20, line: 1380, column: 7)
!3188 = !DILocation(line: 1380, column: 14, scope: !3187)
!3189 = !DILocation(line: 1380, column: 20, scope: !3187)
!3190 = !DILocation(line: 1380, column: 23, scope: !3187)
!3191 = !DILocation(line: 1380, column: 32, scope: !3187)
!3192 = !DILocation(line: 1380, column: 41, scope: !3187)
!3193 = !DILocation(line: 1380, column: 44, scope: !3187)
!3194 = !DILocation(line: 1380, column: 53, scope: !3187)
!3195 = !DILocation(line: 1381, column: 12, scope: !3187)
!3196 = !DILocation(line: 1382, column: 5, scope: !3187)
!3197 = !DILocation(line: 1382, column: 11, scope: !3187)
!3198 = !DILocation(line: 1382, column: 34, scope: !3187)
!3199 = !DILocation(line: 1382, column: 40, scope: !3187)
!3200 = !DILocation(line: 1382, column: 46, scope: !3187)
!3201 = !DILocation(line: 1381, column: 4, scope: !3187)
!3202 = !DILocation(line: 1384, column: 7, scope: !3203)
!3203 = distinct !DILexicalBlock(scope: !3162, file: !20, line: 1384, column: 7)
!3204 = !DILocation(line: 1384, column: 12, scope: !3203)
!3205 = !DILocation(line: 1384, column: 26, scope: !3203)
!3206 = !DILocation(line: 1384, column: 43, scope: !3203)
!3207 = !DILocalVariable(name: "dobjp", scope: !3208, file: !20, line: 1385, type: !1891)
!3208 = distinct !DILexicalBlock(scope: !3203, file: !20, line: 1384, column: 50)
!3209 = !DILocation(line: 1385, column: 12, scope: !3208)
!3210 = !DILocation(line: 1385, column: 29, scope: !3208)
!3211 = !DILocation(line: 1385, column: 34, scope: !3208)
!3212 = !DILocation(line: 1385, column: 48, scope: !3208)
!3213 = !DILocation(line: 1385, column: 21, scope: !3208)
!3214 = !DILocation(line: 1387, column: 9, scope: !3215)
!3215 = distinct !DILexicalBlock(scope: !3208, file: !20, line: 1387, column: 8)
!3216 = !DILocation(line: 1387, column: 16, scope: !3215)
!3217 = !DILocation(line: 1387, column: 21, scope: !3215)
!3218 = !DILocation(line: 1387, column: 36, scope: !3215)
!3219 = !DILocation(line: 1387, column: 40, scope: !3215)
!3220 = !DILocation(line: 1387, column: 47, scope: !3215)
!3221 = !DILocation(line: 1387, column: 60, scope: !3215)
!3222 = !DILocation(line: 1387, column: 65, scope: !3215)
!3223 = !DILocation(line: 1387, column: 79, scope: !3215)
!3224 = !DILocation(line: 1387, column: 57, scope: !3215)
!3225 = !DILocalVariable(name: "circle_distance", scope: !3226, file: !20, line: 1388, type: !36)
!3226 = distinct !DILexicalBlock(scope: !3215, file: !20, line: 1387, column: 104)
!3227 = !DILocation(line: 1388, column: 9, scope: !3226)
!3228 = !DILocation(line: 1390, column: 23, scope: !3226)
!3229 = !DILocation(line: 1390, column: 31, scope: !3226)
!3230 = !DILocation(line: 1390, column: 47, scope: !3226)
!3231 = !DILocation(line: 1390, column: 67, scope: !3226)
!3232 = !DILocation(line: 1390, column: 82, scope: !3226)
!3233 = !DILocation(line: 1390, column: 65, scope: !3226)
!3234 = !DILocation(line: 1390, column: 21, scope: !3226)
!3235 = !DILocation(line: 1391, column: 32, scope: !3226)
!3236 = !DILocation(line: 1391, column: 37, scope: !3226)
!3237 = !DILocation(line: 1391, column: 43, scope: !3226)
!3238 = !DILocation(line: 1391, column: 75, scope: !3226)
!3239 = !DILocation(line: 1391, column: 95, scope: !3226)
!3240 = !DILocation(line: 1391, column: 5, scope: !3226)
!3241 = !DILocation(line: 1392, column: 4, scope: !3226)
!3242 = !DILocation(line: 1393, column: 3, scope: !3208)
!3243 = !DILocation(line: 1395, column: 21, scope: !3244)
!3244 = distinct !DILexicalBlock(scope: !3162, file: !20, line: 1395, column: 7)
!3245 = !DILocation(line: 1395, column: 29, scope: !3244)
!3246 = !DILocation(line: 1395, column: 7, scope: !3244)
!3247 = !DILocalVariable(name: "do_stuff", scope: !3248, file: !20, line: 1396, type: !7)
!3248 = distinct !DILexicalBlock(scope: !3244, file: !20, line: 1395, column: 36)
!3249 = !DILocation(line: 1396, column: 8, scope: !3248)
!3250 = !DILocation(line: 1397, column: 34, scope: !3251)
!3251 = distinct !DILexicalBlock(scope: !3248, file: !20, line: 1397, column: 8)
!3252 = !DILocation(line: 1397, column: 39, scope: !3251)
!3253 = !DILocation(line: 1397, column: 8, scope: !3251)
!3254 = !DILocation(line: 1397, column: 47, scope: !3251)
!3255 = !DILocation(line: 1398, column: 14, scope: !3251)
!3256 = !DILocation(line: 1398, column: 5, scope: !3251)
!3257 = !DILocation(line: 1399, column: 50, scope: !3258)
!3258 = distinct !DILexicalBlock(scope: !3251, file: !20, line: 1399, column: 13)
!3259 = !DILocation(line: 1399, column: 55, scope: !3258)
!3260 = !DILocation(line: 1399, column: 68, scope: !3258)
!3261 = !DILocation(line: 1399, column: 73, scope: !3258)
!3262 = !DILocation(line: 1399, column: 66, scope: !3258)
!3263 = !DILocation(line: 1399, column: 90, scope: !3258)
!3264 = !DILocation(line: 1399, column: 95, scope: !3258)
!3265 = !DILocation(line: 1399, column: 88, scope: !3258)
!3266 = !DILocation(line: 1399, column: 39, scope: !3258)
!3267 = !DILocation(line: 1399, column: 105, scope: !3258)
!3268 = !DILocation(line: 1399, column: 13, scope: !3258)
!3269 = !DILocation(line: 1399, column: 113, scope: !3258)
!3270 = !DILocation(line: 1400, column: 14, scope: !3258)
!3271 = !DILocation(line: 1400, column: 5, scope: !3258)
!3272 = !DILocation(line: 1401, column: 50, scope: !3273)
!3273 = distinct !DILexicalBlock(scope: !3258, file: !20, line: 1401, column: 13)
!3274 = !DILocation(line: 1401, column: 55, scope: !3273)
!3275 = !DILocation(line: 1401, column: 68, scope: !3273)
!3276 = !DILocation(line: 1401, column: 73, scope: !3273)
!3277 = !DILocation(line: 1401, column: 66, scope: !3273)
!3278 = !DILocation(line: 1401, column: 94, scope: !3273)
!3279 = !DILocation(line: 1401, column: 99, scope: !3273)
!3280 = !DILocation(line: 1401, column: 92, scope: !3273)
!3281 = !DILocation(line: 1401, column: 88, scope: !3273)
!3282 = !DILocation(line: 1401, column: 39, scope: !3273)
!3283 = !DILocation(line: 1401, column: 109, scope: !3273)
!3284 = !DILocation(line: 1401, column: 13, scope: !3273)
!3285 = !DILocation(line: 1401, column: 117, scope: !3273)
!3286 = !DILocation(line: 1402, column: 14, scope: !3273)
!3287 = !DILocation(line: 1402, column: 5, scope: !3273)
!3288 = !DILocation(line: 1403, column: 14, scope: !3289)
!3289 = distinct !DILexicalBlock(scope: !3273, file: !20, line: 1403, column: 13)
!3290 = !DILocation(line: 1403, column: 20, scope: !3289)
!3291 = !DILocation(line: 1403, column: 25, scope: !3289)
!3292 = !DILocation(line: 1403, column: 45, scope: !3289)
!3293 = !DILocation(line: 1403, column: 49, scope: !3289)
!3294 = !DILocation(line: 1403, column: 64, scope: !3289)
!3295 = !DILocation(line: 1403, column: 95, scope: !3289)
!3296 = !DILocation(line: 1403, column: 99, scope: !3289)
!3297 = !DILocation(line: 1403, column: 155, scope: !3289)
!3298 = !DILocation(line: 1405, column: 14, scope: !3299)
!3299 = distinct !DILexicalBlock(scope: !3289, file: !20, line: 1403, column: 169)
!3300 = !DILocation(line: 1406, column: 4, scope: !3299)
!3301 = !DILocation(line: 1410, column: 8, scope: !3302)
!3302 = distinct !DILexicalBlock(scope: !3248, file: !20, line: 1410, column: 8)
!3303 = !DILocation(line: 1411, column: 28, scope: !3304)
!3304 = distinct !DILexicalBlock(scope: !3302, file: !20, line: 1410, column: 18)
!3305 = !DILocation(line: 1411, column: 33, scope: !3304)
!3306 = !DILocation(line: 1411, column: 40, scope: !3304)
!3307 = !DILocation(line: 1411, column: 47, scope: !3304)
!3308 = !DILocation(line: 1411, column: 52, scope: !3304)
!3309 = !DILocation(line: 1411, column: 57, scope: !3304)
!3310 = !DILocation(line: 1411, column: 61, scope: !3304)
!3311 = !DILocation(line: 1411, column: 5, scope: !3304)
!3312 = !DILocation(line: 1412, column: 5, scope: !3304)
!3313 = !DILocation(line: 1412, column: 11, scope: !3304)
!3314 = !DILocation(line: 1412, column: 21, scope: !3304)
!3315 = !DILocation(line: 1413, column: 10, scope: !3316)
!3316 = distinct !DILexicalBlock(scope: !3304, file: !20, line: 1413, column: 9)
!3317 = !DILocation(line: 1413, column: 32, scope: !3316)
!3318 = !DILocation(line: 1413, column: 35, scope: !3316)
!3319 = !DILocation(line: 1413, column: 55, scope: !3316)
!3320 = !DILocation(line: 1414, column: 25, scope: !3316)
!3321 = !DILocation(line: 1414, column: 34, scope: !3316)
!3322 = !DILocation(line: 1414, column: 6, scope: !3316)
!3323 = !DILocation(line: 1414, column: 12, scope: !3316)
!3324 = !DILocation(line: 1414, column: 22, scope: !3316)
!3325 = !DILocation(line: 1415, column: 4, scope: !3304)
!3326 = !DILocation(line: 1417, column: 3, scope: !3248)
!3327 = !DILocation(line: 1418, column: 2, scope: !3162)
!3328 = !DILocation(line: 1420, column: 6, scope: !3329)
!3329 = distinct !DILexicalBlock(scope: !2069, file: !20, line: 1420, column: 6)
!3330 = !DILocation(line: 1420, column: 14, scope: !3329)
!3331 = !DILocation(line: 1422, column: 23, scope: !3332)
!3332 = distinct !DILexicalBlock(scope: !3329, file: !20, line: 1420, column: 21)
!3333 = !DILocation(line: 1422, column: 42, scope: !3332)
!3334 = !DILocation(line: 1422, column: 84, scope: !3332)
!3335 = !DILocation(line: 1422, column: 3, scope: !3332)
!3336 = !DILocation(line: 1423, column: 18, scope: !3332)
!3337 = !DILocation(line: 1423, column: 23, scope: !3332)
!3338 = !DILocation(line: 1423, column: 39, scope: !3332)
!3339 = !DILocation(line: 1423, column: 3, scope: !3332)
!3340 = !DILocation(line: 1425, column: 21, scope: !3341)
!3341 = distinct !DILexicalBlock(scope: !3332, file: !20, line: 1425, column: 7)
!3342 = !DILocation(line: 1425, column: 29, scope: !3341)
!3343 = !DILocation(line: 1425, column: 7, scope: !3341)
!3344 = !DILocalVariable(name: "do_stuff", scope: !3345, file: !20, line: 1426, type: !7)
!3345 = distinct !DILexicalBlock(scope: !3341, file: !20, line: 1425, column: 36)
!3346 = !DILocation(line: 1426, column: 8, scope: !3345)
!3347 = !DILocation(line: 1427, column: 34, scope: !3348)
!3348 = distinct !DILexicalBlock(scope: !3345, file: !20, line: 1427, column: 8)
!3349 = !DILocation(line: 1427, column: 39, scope: !3348)
!3350 = !DILocation(line: 1427, column: 8, scope: !3348)
!3351 = !DILocation(line: 1427, column: 47, scope: !3348)
!3352 = !DILocation(line: 1428, column: 14, scope: !3348)
!3353 = !DILocation(line: 1428, column: 5, scope: !3348)
!3354 = !DILocation(line: 1429, column: 50, scope: !3355)
!3355 = distinct !DILexicalBlock(scope: !3348, file: !20, line: 1429, column: 13)
!3356 = !DILocation(line: 1429, column: 55, scope: !3355)
!3357 = !DILocation(line: 1429, column: 68, scope: !3355)
!3358 = !DILocation(line: 1429, column: 73, scope: !3355)
!3359 = !DILocation(line: 1429, column: 66, scope: !3355)
!3360 = !DILocation(line: 1429, column: 90, scope: !3355)
!3361 = !DILocation(line: 1429, column: 95, scope: !3355)
!3362 = !DILocation(line: 1429, column: 88, scope: !3355)
!3363 = !DILocation(line: 1429, column: 39, scope: !3355)
!3364 = !DILocation(line: 1429, column: 105, scope: !3355)
!3365 = !DILocation(line: 1429, column: 13, scope: !3355)
!3366 = !DILocation(line: 1429, column: 113, scope: !3355)
!3367 = !DILocation(line: 1430, column: 14, scope: !3355)
!3368 = !DILocation(line: 1430, column: 5, scope: !3355)
!3369 = !DILocation(line: 1431, column: 50, scope: !3370)
!3370 = distinct !DILexicalBlock(scope: !3355, file: !20, line: 1431, column: 13)
!3371 = !DILocation(line: 1431, column: 55, scope: !3370)
!3372 = !DILocation(line: 1431, column: 68, scope: !3370)
!3373 = !DILocation(line: 1431, column: 73, scope: !3370)
!3374 = !DILocation(line: 1431, column: 66, scope: !3370)
!3375 = !DILocation(line: 1431, column: 94, scope: !3370)
!3376 = !DILocation(line: 1431, column: 99, scope: !3370)
!3377 = !DILocation(line: 1431, column: 92, scope: !3370)
!3378 = !DILocation(line: 1431, column: 88, scope: !3370)
!3379 = !DILocation(line: 1431, column: 39, scope: !3370)
!3380 = !DILocation(line: 1431, column: 109, scope: !3370)
!3381 = !DILocation(line: 1431, column: 13, scope: !3370)
!3382 = !DILocation(line: 1431, column: 117, scope: !3370)
!3383 = !DILocation(line: 1432, column: 14, scope: !3370)
!3384 = !DILocation(line: 1432, column: 5, scope: !3370)
!3385 = !DILocation(line: 1434, column: 8, scope: !3386)
!3386 = distinct !DILexicalBlock(scope: !3345, file: !20, line: 1434, column: 8)
!3387 = !DILocation(line: 1436, column: 28, scope: !3388)
!3388 = distinct !DILexicalBlock(scope: !3386, file: !20, line: 1434, column: 18)
!3389 = !DILocation(line: 1436, column: 33, scope: !3388)
!3390 = !DILocation(line: 1436, column: 40, scope: !3388)
!3391 = !DILocation(line: 1436, column: 47, scope: !3388)
!3392 = !DILocation(line: 1436, column: 52, scope: !3388)
!3393 = !DILocation(line: 1436, column: 57, scope: !3388)
!3394 = !DILocation(line: 1436, column: 61, scope: !3388)
!3395 = !DILocation(line: 1436, column: 5, scope: !3388)
!3396 = !DILocation(line: 1437, column: 5, scope: !3388)
!3397 = !DILocation(line: 1437, column: 11, scope: !3388)
!3398 = !DILocation(line: 1437, column: 21, scope: !3388)
!3399 = !DILocation(line: 1438, column: 9, scope: !3400)
!3400 = distinct !DILexicalBlock(scope: !3388, file: !20, line: 1438, column: 9)
!3401 = !DILocation(line: 1438, column: 27, scope: !3400)
!3402 = !DILocation(line: 1438, column: 32, scope: !3400)
!3403 = !DILocation(line: 1438, column: 35, scope: !3400)
!3404 = !DILocation(line: 1438, column: 55, scope: !3400)
!3405 = !DILocation(line: 1439, column: 25, scope: !3400)
!3406 = !DILocation(line: 1439, column: 34, scope: !3400)
!3407 = !DILocation(line: 1439, column: 6, scope: !3400)
!3408 = !DILocation(line: 1439, column: 12, scope: !3400)
!3409 = !DILocation(line: 1439, column: 22, scope: !3400)
!3410 = !DILocation(line: 1440, column: 4, scope: !3388)
!3411 = !DILocation(line: 1441, column: 3, scope: !3345)
!3412 = !DILocation(line: 1442, column: 2, scope: !3332)
!3413 = !DILocation(line: 1445, column: 10, scope: !2069)
!3414 = !DILocation(line: 1445, column: 16, scope: !2069)
!3415 = !DILocation(line: 1445, column: 2, scope: !2069)
!3416 = !DILocalVariable(name: "circle_distance", scope: !3417, file: !20, line: 1447, type: !36)
!3417 = distinct !DILexicalBlock(scope: !3418, file: !20, line: 1446, column: 25)
!3418 = distinct !DILexicalBlock(scope: !2069, file: !20, line: 1445, column: 22)
!3419 = !DILocation(line: 1447, column: 7, scope: !3417)
!3420 = !DILocation(line: 1449, column: 21, scope: !3417)
!3421 = !DILocation(line: 1449, column: 29, scope: !3417)
!3422 = !DILocation(line: 1449, column: 45, scope: !3417)
!3423 = !DILocation(line: 1449, column: 65, scope: !3417)
!3424 = !DILocation(line: 1449, column: 80, scope: !3417)
!3425 = !DILocation(line: 1449, column: 63, scope: !3417)
!3426 = !DILocation(line: 1449, column: 19, scope: !3417)
!3427 = !DILocation(line: 1451, column: 7, scope: !3428)
!3428 = distinct !DILexicalBlock(scope: !3417, file: !20, line: 1451, column: 7)
!3429 = !DILocation(line: 1451, column: 15, scope: !3428)
!3430 = !DILocation(line: 1451, column: 27, scope: !3428)
!3431 = !DILocation(line: 1452, column: 24, scope: !3428)
!3432 = !DILocation(line: 1452, column: 31, scope: !3428)
!3433 = !DILocation(line: 1452, column: 38, scope: !3428)
!3434 = !DILocation(line: 1452, column: 45, scope: !3428)
!3435 = !DILocation(line: 1452, column: 20, scope: !3428)
!3436 = !DILocation(line: 1452, column: 4, scope: !3428)
!3437 = !DILocation(line: 1454, column: 23, scope: !3417)
!3438 = !DILocation(line: 1454, column: 42, scope: !3417)
!3439 = !DILocation(line: 1454, column: 84, scope: !3417)
!3440 = !DILocation(line: 1454, column: 3, scope: !3417)
!3441 = !DILocation(line: 1457, column: 8, scope: !3442)
!3442 = distinct !DILexicalBlock(scope: !3417, file: !20, line: 1457, column: 7)
!3443 = !DILocation(line: 1457, column: 26, scope: !3442)
!3444 = !DILocation(line: 1457, column: 31, scope: !3442)
!3445 = !DILocation(line: 1457, column: 35, scope: !3442)
!3446 = !DILocation(line: 1457, column: 55, scope: !3442)
!3447 = !DILocation(line: 1459, column: 34, scope: !3448)
!3448 = distinct !DILexicalBlock(scope: !3449, file: !20, line: 1459, column: 8)
!3449 = distinct !DILexicalBlock(scope: !3442, file: !20, line: 1457, column: 62)
!3450 = !DILocation(line: 1459, column: 9, scope: !3448)
!3451 = !DILocation(line: 1459, column: 8, scope: !3448)
!3452 = !DILocation(line: 1460, column: 41, scope: !3453)
!3453 = distinct !DILexicalBlock(scope: !3454, file: !20, line: 1460, column: 9)
!3454 = distinct !DILexicalBlock(scope: !3448, file: !20, line: 1459, column: 44)
!3455 = !DILocation(line: 1460, column: 46, scope: !3453)
!3456 = !DILocation(line: 1460, column: 9, scope: !3453)
!3457 = !DILocation(line: 1461, column: 32, scope: !3453)
!3458 = !DILocation(line: 1461, column: 37, scope: !3453)
!3459 = !DILocation(line: 1461, column: 42, scope: !3453)
!3460 = !DILocation(line: 1461, column: 48, scope: !3453)
!3461 = !DILocation(line: 1461, column: 72, scope: !3453)
!3462 = !DILocation(line: 1461, column: 100, scope: !3453)
!3463 = !DILocation(line: 1461, column: 119, scope: !3453)
!3464 = !DILocation(line: 1461, column: 136, scope: !3453)
!3465 = !DILocation(line: 1461, column: 141, scope: !3453)
!3466 = !DILocation(line: 1461, column: 6, scope: !3453)
!3467 = !DILocation(line: 1462, column: 5, scope: !3454)
!3468 = !DILocation(line: 1465, column: 26, scope: !3449)
!3469 = !DILocation(line: 1465, column: 4, scope: !3449)
!3470 = !DILocation(line: 1466, column: 33, scope: !3449)
!3471 = !DILocation(line: 1466, column: 4, scope: !3449)
!3472 = !DILocation(line: 1467, column: 3, scope: !3449)
!3473 = !DILocation(line: 1468, column: 13, scope: !3474)
!3474 = distinct !DILexicalBlock(scope: !3442, file: !20, line: 1468, column: 12)
!3475 = !DILocation(line: 1468, column: 31, scope: !3474)
!3476 = !DILocation(line: 1468, column: 37, scope: !3474)
!3477 = !DILocation(line: 1468, column: 41, scope: !3474)
!3478 = !DILocation(line: 1468, column: 56, scope: !3474)
!3479 = !DILocation(line: 1468, column: 69, scope: !3474)
!3480 = !DILocation(line: 1468, column: 75, scope: !3474)
!3481 = !DILocation(line: 1468, column: 85, scope: !3474)
!3482 = !DILocation(line: 1468, column: 74, scope: !3474)
!3483 = !DILocation(line: 1471, column: 8, scope: !3484)
!3484 = distinct !DILexicalBlock(scope: !3485, file: !20, line: 1471, column: 8)
!3485 = distinct !DILexicalBlock(scope: !3474, file: !20, line: 1468, column: 99)
!3486 = !DILocation(line: 1471, column: 13, scope: !3484)
!3487 = !DILocation(line: 1471, column: 22, scope: !3484)
!3488 = !DILocation(line: 1472, column: 26, scope: !3489)
!3489 = distinct !DILexicalBlock(scope: !3484, file: !20, line: 1471, column: 38)
!3490 = !DILocation(line: 1472, column: 31, scope: !3489)
!3491 = !DILocation(line: 1472, column: 5, scope: !3489)
!3492 = !DILocation(line: 1472, column: 11, scope: !3489)
!3493 = !DILocation(line: 1472, column: 24, scope: !3489)
!3494 = !DILocation(line: 1474, column: 28, scope: !3489)
!3495 = !DILocation(line: 1474, column: 5, scope: !3489)
!3496 = !DILocation(line: 1475, column: 4, scope: !3489)
!3497 = !DILocation(line: 1476, column: 4, scope: !3485)
!3498 = !DILocation(line: 1479, column: 8, scope: !3499)
!3499 = distinct !DILexicalBlock(scope: !3417, file: !20, line: 1479, column: 7)
!3500 = !DILocation(line: 1479, column: 13, scope: !3499)
!3501 = !DILocation(line: 1479, column: 27, scope: !3499)
!3502 = !DILocation(line: 1479, column: 40, scope: !3499)
!3503 = !DILocation(line: 1479, column: 44, scope: !3499)
!3504 = !DILocation(line: 1479, column: 49, scope: !3499)
!3505 = !DILocation(line: 1479, column: 60, scope: !3499)
!3506 = !DILocation(line: 1480, column: 8, scope: !3507)
!3507 = distinct !DILexicalBlock(scope: !3508, file: !20, line: 1480, column: 8)
!3508 = distinct !DILexicalBlock(scope: !3499, file: !20, line: 1479, column: 74)
!3509 = !DILocation(line: 1481, column: 9, scope: !3510)
!3510 = distinct !DILexicalBlock(scope: !3511, file: !20, line: 1481, column: 9)
!3511 = distinct !DILexicalBlock(scope: !3507, file: !20, line: 1480, column: 27)
!3512 = !DILocation(line: 1481, column: 20, scope: !3510)
!3513 = !DILocation(line: 1481, column: 32, scope: !3510)
!3514 = !DILocation(line: 1481, column: 30, scope: !3510)
!3515 = !DILocation(line: 1481, column: 18, scope: !3510)
!3516 = !DILocation(line: 1482, column: 10, scope: !3517)
!3517 = distinct !DILexicalBlock(scope: !3518, file: !20, line: 1482, column: 10)
!3518 = distinct !DILexicalBlock(scope: !3510, file: !20, line: 1481, column: 51)
!3519 = !DILocation(line: 1482, column: 25, scope: !3517)
!3520 = !DILocation(line: 1482, column: 33, scope: !3517)
!3521 = !DILocation(line: 1482, column: 44, scope: !3517)
!3522 = !DILocation(line: 1482, column: 42, scope: !3517)
!3523 = !DILocation(line: 1482, column: 31, scope: !3517)
!3524 = !DILocation(line: 1484, column: 7, scope: !3525)
!3525 = distinct !DILexicalBlock(scope: !3517, file: !20, line: 1482, column: 63)
!3526 = !DILocation(line: 1484, column: 12, scope: !3525)
!3527 = !DILocation(line: 1484, column: 23, scope: !3525)
!3528 = !DILocation(line: 1485, column: 7, scope: !3525)
!3529 = !DILocation(line: 1485, column: 12, scope: !3525)
!3530 = !DILocation(line: 1485, column: 26, scope: !3525)
!3531 = !DILocation(line: 1486, column: 6, scope: !3525)
!3532 = !DILocation(line: 1487, column: 5, scope: !3518)
!3533 = !DILocation(line: 1488, column: 4, scope: !3511)
!3534 = !DILocation(line: 1489, column: 3, scope: !3508)
!3535 = !DILocation(line: 1491, column: 7, scope: !3536)
!3536 = distinct !DILexicalBlock(scope: !3417, file: !20, line: 1491, column: 7)
!3537 = !DILocation(line: 1491, column: 18, scope: !3536)
!3538 = !DILocation(line: 1491, column: 24, scope: !3536)
!3539 = !DILocation(line: 1491, column: 16, scope: !3536)
!3540 = !DILocation(line: 1491, column: 41, scope: !3536)
!3541 = !DILocation(line: 1493, column: 8, scope: !3542)
!3542 = distinct !DILexicalBlock(scope: !3543, file: !20, line: 1493, column: 8)
!3543 = distinct !DILexicalBlock(scope: !3536, file: !20, line: 1491, column: 62)
!3544 = !DILocation(line: 1493, column: 18, scope: !3542)
!3545 = !DILocation(line: 1494, column: 10, scope: !3546)
!3546 = distinct !DILexicalBlock(scope: !3542, file: !20, line: 1494, column: 9)
!3547 = !DILocation(line: 1494, column: 28, scope: !3546)
!3548 = !DILocation(line: 1494, column: 32, scope: !3546)
!3549 = !DILocation(line: 1494, column: 47, scope: !3546)
!3550 = !DILocation(line: 1495, column: 6, scope: !3551)
!3551 = distinct !DILexicalBlock(scope: !3546, file: !20, line: 1494, column: 61)
!3552 = !DILocation(line: 1495, column: 12, scope: !3551)
!3553 = !DILocation(line: 1495, column: 17, scope: !3551)
!3554 = !DILocation(line: 1496, column: 6, scope: !3551)
!3555 = !DILocation(line: 1494, column: 58, scope: !3546)
!3556 = !DILocation(line: 1499, column: 34, scope: !3557)
!3557 = distinct !DILexicalBlock(scope: !3543, file: !20, line: 1499, column: 8)
!3558 = !DILocation(line: 1499, column: 9, scope: !3557)
!3559 = !DILocation(line: 1499, column: 8, scope: !3557)
!3560 = !DILocation(line: 1500, column: 41, scope: !3561)
!3561 = distinct !DILexicalBlock(scope: !3562, file: !20, line: 1500, column: 9)
!3562 = distinct !DILexicalBlock(scope: !3557, file: !20, line: 1499, column: 44)
!3563 = !DILocation(line: 1500, column: 46, scope: !3561)
!3564 = !DILocation(line: 1500, column: 9, scope: !3561)
!3565 = !DILocation(line: 1501, column: 32, scope: !3561)
!3566 = !DILocation(line: 1501, column: 37, scope: !3561)
!3567 = !DILocation(line: 1501, column: 42, scope: !3561)
!3568 = !DILocation(line: 1501, column: 48, scope: !3561)
!3569 = !DILocation(line: 1501, column: 72, scope: !3561)
!3570 = !DILocation(line: 1501, column: 100, scope: !3561)
!3571 = !DILocation(line: 1501, column: 119, scope: !3561)
!3572 = !DILocation(line: 1501, column: 136, scope: !3561)
!3573 = !DILocation(line: 1501, column: 141, scope: !3561)
!3574 = !DILocation(line: 1501, column: 6, scope: !3561)
!3575 = !DILocation(line: 1502, column: 5, scope: !3562)
!3576 = !DILocation(line: 1507, column: 3, scope: !3543)
!3577 = !DILocation(line: 1508, column: 13, scope: !3578)
!3578 = distinct !DILexicalBlock(scope: !3536, file: !20, line: 1508, column: 12)
!3579 = !DILocation(line: 1508, column: 18, scope: !3578)
!3580 = !DILocation(line: 1508, column: 32, scope: !3578)
!3581 = !DILocation(line: 1508, column: 45, scope: !3578)
!3582 = !DILocation(line: 1508, column: 49, scope: !3578)
!3583 = !DILocation(line: 1508, column: 54, scope: !3578)
!3584 = !DILocation(line: 1508, column: 65, scope: !3578)
!3585 = !DILocation(line: 1509, column: 34, scope: !3586)
!3586 = distinct !DILexicalBlock(scope: !3587, file: !20, line: 1509, column: 8)
!3587 = distinct !DILexicalBlock(scope: !3578, file: !20, line: 1508, column: 79)
!3588 = !DILocation(line: 1509, column: 9, scope: !3586)
!3589 = !DILocation(line: 1509, column: 8, scope: !3586)
!3590 = !DILocation(line: 1510, column: 41, scope: !3591)
!3591 = distinct !DILexicalBlock(scope: !3592, file: !20, line: 1510, column: 9)
!3592 = distinct !DILexicalBlock(scope: !3586, file: !20, line: 1509, column: 44)
!3593 = !DILocation(line: 1510, column: 46, scope: !3591)
!3594 = !DILocation(line: 1510, column: 9, scope: !3591)
!3595 = !DILocation(line: 1511, column: 32, scope: !3591)
!3596 = !DILocation(line: 1511, column: 37, scope: !3591)
!3597 = !DILocation(line: 1511, column: 42, scope: !3591)
!3598 = !DILocation(line: 1511, column: 48, scope: !3591)
!3599 = !DILocation(line: 1511, column: 72, scope: !3591)
!3600 = !DILocation(line: 1511, column: 100, scope: !3591)
!3601 = !DILocation(line: 1511, column: 119, scope: !3591)
!3602 = !DILocation(line: 1511, column: 136, scope: !3591)
!3603 = !DILocation(line: 1511, column: 141, scope: !3591)
!3604 = !DILocation(line: 1511, column: 6, scope: !3591)
!3605 = !DILocation(line: 1512, column: 5, scope: !3592)
!3606 = !DILocation(line: 1514, column: 31, scope: !3587)
!3607 = !DILocation(line: 1514, column: 36, scope: !3587)
!3608 = !DILocation(line: 1514, column: 42, scope: !3587)
!3609 = !DILocation(line: 1514, column: 74, scope: !3587)
!3610 = !DILocation(line: 1514, column: 94, scope: !3587)
!3611 = !DILocation(line: 1514, column: 4, scope: !3587)
!3612 = !DILocation(line: 1516, column: 9, scope: !3613)
!3613 = distinct !DILexicalBlock(scope: !3587, file: !20, line: 1516, column: 8)
!3614 = !DILocation(line: 1516, column: 17, scope: !3613)
!3615 = !DILocation(line: 1516, column: 8, scope: !3613)
!3616 = !DILocation(line: 1516, column: 22, scope: !3613)
!3617 = !DILocation(line: 1516, column: 27, scope: !3613)
!3618 = !DILocation(line: 1516, column: 32, scope: !3613)
!3619 = !DILocation(line: 1516, column: 43, scope: !3613)
!3620 = !DILocation(line: 1516, column: 56, scope: !3613)
!3621 = !DILocation(line: 1516, column: 60, scope: !3613)
!3622 = !DILocation(line: 1516, column: 65, scope: !3613)
!3623 = !DILocation(line: 1516, column: 76, scope: !3613)
!3624 = !DILocation(line: 1517, column: 9, scope: !3625)
!3625 = distinct !DILexicalBlock(scope: !3626, file: !20, line: 1517, column: 9)
!3626 = distinct !DILexicalBlock(scope: !3613, file: !20, line: 1516, column: 91)
!3627 = !DILocation(line: 1518, column: 45, scope: !3625)
!3628 = !DILocation(line: 1518, column: 50, scope: !3625)
!3629 = !DILocation(line: 1518, column: 58, scope: !3625)
!3630 = !DILocation(line: 1518, column: 68, scope: !3625)
!3631 = !DILocation(line: 1518, column: 6, scope: !3625)
!3632 = !DILocation(line: 1519, column: 4, scope: !3626)
!3633 = !DILocation(line: 1521, column: 8, scope: !3634)
!3634 = distinct !DILexicalBlock(scope: !3587, file: !20, line: 1521, column: 8)
!3635 = !DILocation(line: 1522, column: 34, scope: !3636)
!3636 = distinct !DILexicalBlock(scope: !3634, file: !20, line: 1521, column: 19)
!3637 = !DILocation(line: 1522, column: 5, scope: !3636)
!3638 = !DILocation(line: 1523, column: 15, scope: !3636)
!3639 = !DILocation(line: 1524, column: 4, scope: !3636)
!3640 = !DILocation(line: 1526, column: 34, scope: !3634)
!3641 = !DILocation(line: 1526, column: 5, scope: !3634)
!3642 = !DILocation(line: 1528, column: 20, scope: !3587)
!3643 = !DILocation(line: 1528, column: 25, scope: !3587)
!3644 = !DILocation(line: 1528, column: 4, scope: !3587)
!3645 = !DILocation(line: 1529, column: 3, scope: !3587)
!3646 = !DILocation(line: 1530, column: 3, scope: !3417)
!3647 = !DILocation(line: 1534, column: 23, scope: !3418)
!3648 = !DILocation(line: 1534, column: 42, scope: !3418)
!3649 = !DILocation(line: 1534, column: 84, scope: !3418)
!3650 = !DILocation(line: 1534, column: 3, scope: !3418)
!3651 = !DILocation(line: 1536, column: 7, scope: !3652)
!3652 = distinct !DILexicalBlock(scope: !3418, file: !20, line: 1536, column: 7)
!3653 = !DILocation(line: 1537, column: 8, scope: !3654)
!3654 = distinct !DILexicalBlock(scope: !3655, file: !20, line: 1537, column: 8)
!3655 = distinct !DILexicalBlock(scope: !3652, file: !20, line: 1536, column: 26)
!3656 = !DILocation(line: 1537, column: 14, scope: !3654)
!3657 = !DILocation(line: 1537, column: 36, scope: !3654)
!3658 = !DILocation(line: 1538, column: 5, scope: !3654)
!3659 = !DILocation(line: 1538, column: 11, scope: !3654)
!3660 = !DILocation(line: 1538, column: 33, scope: !3654)
!3661 = !DILocation(line: 1540, column: 3, scope: !3655)
!3662 = !DILocation(line: 1543, column: 9, scope: !3663)
!3663 = distinct !DILexicalBlock(scope: !3418, file: !20, line: 1543, column: 7)
!3664 = !DILocation(line: 1543, column: 19, scope: !3663)
!3665 = !DILocation(line: 1543, column: 8, scope: !3663)
!3666 = !DILocation(line: 1543, column: 31, scope: !3663)
!3667 = !DILocation(line: 1543, column: 34, scope: !3663)
!3668 = !DILocation(line: 1544, column: 33, scope: !3669)
!3669 = distinct !DILexicalBlock(scope: !3663, file: !20, line: 1544, column: 8)
!3670 = !DILocation(line: 1544, column: 8, scope: !3669)
!3671 = !DILocation(line: 1545, column: 20, scope: !3672)
!3672 = distinct !DILexicalBlock(scope: !3669, file: !20, line: 1544, column: 43)
!3673 = !DILocation(line: 1545, column: 25, scope: !3672)
!3674 = !DILocation(line: 1545, column: 44, scope: !3672)
!3675 = !DILocation(line: 1545, column: 5, scope: !3672)
!3676 = !DILocation(line: 1546, column: 34, scope: !3672)
!3677 = !DILocation(line: 1546, column: 5, scope: !3672)
!3678 = !DILocation(line: 1547, column: 4, scope: !3672)
!3679 = !DILocation(line: 1544, column: 40, scope: !3669)
!3680 = !DILocation(line: 1549, column: 7, scope: !3681)
!3681 = distinct !DILexicalBlock(scope: !3418, file: !20, line: 1549, column: 7)
!3682 = !DILocation(line: 1549, column: 12, scope: !3681)
!3683 = !DILocation(line: 1549, column: 23, scope: !3681)
!3684 = !DILocation(line: 1550, column: 4, scope: !3681)
!3685 = !DILocation(line: 1550, column: 9, scope: !3681)
!3686 = !DILocation(line: 1550, column: 20, scope: !3681)
!3687 = !DILocation(line: 1551, column: 12, scope: !3688)
!3688 = distinct !DILexicalBlock(scope: !3681, file: !20, line: 1551, column: 12)
!3689 = !DILocation(line: 1551, column: 17, scope: !3688)
!3690 = !DILocation(line: 1551, column: 31, scope: !3688)
!3691 = !DILocation(line: 1552, column: 4, scope: !3688)
!3692 = !DILocation(line: 1552, column: 9, scope: !3688)
!3693 = !DILocation(line: 1552, column: 20, scope: !3688)
!3694 = !DILocation(line: 1560, column: 8, scope: !3695)
!3695 = distinct !DILexicalBlock(scope: !3418, file: !20, line: 1560, column: 7)
!3696 = !DILocation(line: 1560, column: 14, scope: !3695)
!3697 = !DILocation(line: 1560, column: 24, scope: !3695)
!3698 = !DILocation(line: 1560, column: 30, scope: !3695)
!3699 = !DILocation(line: 1560, column: 34, scope: !3695)
!3700 = !DILocation(line: 1560, column: 33, scope: !3695)
!3701 = !DILocalVariable(name: "fire_vec", scope: !3702, file: !20, line: 1562, type: !77)
!3702 = distinct !DILexicalBlock(scope: !3695, file: !20, line: 1561, column: 3)
!3703 = !DILocation(line: 1562, column: 15, scope: !3702)
!3704 = !DILocalVariable(name: "fire_pos", scope: !3702, file: !20, line: 1562, type: !77)
!3705 = !DILocation(line: 1562, column: 25, scope: !3702)
!3706 = !DILocation(line: 1564, column: 34, scope: !3707)
!3707 = distinct !DILexicalBlock(scope: !3702, file: !20, line: 1564, column: 8)
!3708 = !DILocation(line: 1564, column: 9, scope: !3707)
!3709 = !DILocation(line: 1564, column: 8, scope: !3707)
!3710 = !DILocation(line: 1565, column: 5, scope: !3707)
!3711 = !DILocation(line: 1567, column: 15, scope: !3702)
!3712 = !DILocation(line: 1567, column: 20, scope: !3702)
!3713 = !DILocation(line: 1567, column: 27, scope: !3702)
!3714 = !DILocation(line: 1567, column: 13, scope: !3702)
!3715 = !DILocation(line: 1568, column: 4, scope: !3702)
!3716 = !DILocation(line: 1568, column: 4, scope: !3717)
!3717 = distinct !DILexicalBlock(scope: !3702, file: !20, line: 1568, column: 4)
!3718 = !DILocation(line: 1569, column: 27, scope: !3702)
!3719 = !DILocation(line: 1569, column: 32, scope: !3702)
!3720 = !DILocation(line: 1569, column: 4, scope: !3702)
!3721 = !DILocation(line: 1571, column: 8, scope: !3722)
!3722 = distinct !DILexicalBlock(scope: !3702, file: !20, line: 1571, column: 8)
!3723 = !DILocation(line: 1571, column: 13, scope: !3722)
!3724 = !DILocation(line: 1571, column: 23, scope: !3722)
!3725 = !DILocation(line: 1572, column: 49, scope: !3722)
!3726 = !DILocation(line: 1572, column: 53, scope: !3722)
!3727 = !DILocation(line: 1572, column: 5, scope: !3722)
!3728 = !DILocation(line: 1574, column: 49, scope: !3722)
!3729 = !DILocation(line: 1574, column: 53, scope: !3722)
!3730 = !DILocation(line: 1574, column: 5, scope: !3722)
!3731 = !DILocation(line: 1576, column: 46, scope: !3702)
!3732 = !DILocation(line: 1576, column: 44, scope: !3702)
!3733 = !DILocation(line: 1576, column: 33, scope: !3702)
!3734 = !DILocation(line: 1576, column: 4, scope: !3702)
!3735 = !DILocation(line: 1576, column: 10, scope: !3702)
!3736 = !DILocation(line: 1576, column: 20, scope: !3702)
!3737 = !DILocation(line: 1590, column: 3, scope: !3702)
!3738 = !DILocation(line: 1591, column: 3, scope: !3418)
!3739 = !DILocation(line: 1595, column: 18, scope: !3418)
!3740 = !DILocation(line: 1595, column: 26, scope: !3418)
!3741 = !DILocation(line: 1595, column: 3, scope: !3418)
!3742 = !DILocation(line: 1596, column: 32, scope: !3418)
!3743 = !DILocation(line: 1596, column: 3, scope: !3418)
!3744 = !DILocation(line: 1597, column: 3, scope: !3418)
!3745 = !DILocalVariable(name: "anger_level", scope: !3746, file: !20, line: 1600, type: !7)
!3746 = distinct !DILexicalBlock(scope: !3418, file: !20, line: 1599, column: 24)
!3747 = !DILocation(line: 1600, column: 7, scope: !3746)
!3748 = !DILocation(line: 1602, column: 7, scope: !3749)
!3749 = distinct !DILexicalBlock(scope: !3746, file: !20, line: 1602, column: 7)
!3750 = !DILocation(line: 1602, column: 12, scope: !3749)
!3751 = !DILocation(line: 1602, column: 21, scope: !3749)
!3752 = !DILocation(line: 1603, column: 19, scope: !3753)
!3753 = distinct !DILexicalBlock(scope: !3749, file: !20, line: 1603, column: 8)
!3754 = !DILocation(line: 1603, column: 24, scope: !3753)
!3755 = !DILocation(line: 1603, column: 37, scope: !3753)
!3756 = !DILocation(line: 1603, column: 42, scope: !3753)
!3757 = !DILocation(line: 1603, column: 35, scope: !3753)
!3758 = !DILocation(line: 1603, column: 54, scope: !3753)
!3759 = !DILocation(line: 1603, column: 8, scope: !3753)
!3760 = !DILocation(line: 1603, column: 59, scope: !3753)
!3761 = !DILocation(line: 1603, column: 69, scope: !3753)
!3762 = !DILocation(line: 1603, column: 74, scope: !3753)
!3763 = !DILocation(line: 1603, column: 66, scope: !3753)
!3764 = !DILocation(line: 1604, column: 17, scope: !3765)
!3765 = distinct !DILexicalBlock(scope: !3753, file: !20, line: 1603, column: 88)
!3766 = !DILocation(line: 1606, column: 4, scope: !3765)
!3767 = !DILocation(line: 1608, column: 23, scope: !3746)
!3768 = !DILocation(line: 1608, column: 42, scope: !3746)
!3769 = !DILocation(line: 1608, column: 84, scope: !3746)
!3770 = !DILocation(line: 1608, column: 3, scope: !3746)
!3771 = !DILocation(line: 1618, column: 33, scope: !3772)
!3772 = distinct !DILexicalBlock(scope: !3746, file: !20, line: 1618, column: 7)
!3773 = !DILocation(line: 1618, column: 38, scope: !3772)
!3774 = !DILocation(line: 1618, column: 8, scope: !3772)
!3775 = !DILocation(line: 1618, column: 7, scope: !3772)
!3776 = !DILocation(line: 1619, column: 40, scope: !3777)
!3777 = distinct !DILexicalBlock(scope: !3778, file: !20, line: 1619, column: 8)
!3778 = distinct !DILexicalBlock(scope: !3772, file: !20, line: 1618, column: 52)
!3779 = !DILocation(line: 1619, column: 45, scope: !3777)
!3780 = !DILocation(line: 1619, column: 8, scope: !3777)
!3781 = !DILocation(line: 1620, column: 25, scope: !3782)
!3782 = distinct !DILexicalBlock(scope: !3777, file: !20, line: 1619, column: 51)
!3783 = !DILocation(line: 1620, column: 44, scope: !3782)
!3784 = !DILocation(line: 1620, column: 86, scope: !3782)
!3785 = !DILocation(line: 1620, column: 5, scope: !3782)
!3786 = !DILocation(line: 1621, column: 31, scope: !3782)
!3787 = !DILocation(line: 1621, column: 36, scope: !3782)
!3788 = !DILocation(line: 1621, column: 41, scope: !3782)
!3789 = !DILocation(line: 1621, column: 47, scope: !3782)
!3790 = !DILocation(line: 1621, column: 71, scope: !3782)
!3791 = !DILocation(line: 1621, column: 99, scope: !3782)
!3792 = !DILocation(line: 1621, column: 118, scope: !3782)
!3793 = !DILocation(line: 1621, column: 135, scope: !3782)
!3794 = !DILocation(line: 1621, column: 140, scope: !3782)
!3795 = !DILocation(line: 1621, column: 5, scope: !3782)
!3796 = !DILocation(line: 1622, column: 4, scope: !3782)
!3797 = !DILocation(line: 1623, column: 4, scope: !3778)
!3798 = !DILocation(line: 1626, column: 18, scope: !3746)
!3799 = !DILocation(line: 1626, column: 23, scope: !3746)
!3800 = !DILocation(line: 1626, column: 42, scope: !3746)
!3801 = !DILocation(line: 1626, column: 3, scope: !3746)
!3802 = !DILocation(line: 1628, column: 7, scope: !3803)
!3803 = distinct !DILexicalBlock(scope: !3746, file: !20, line: 1628, column: 7)
!3804 = !DILocation(line: 1628, column: 12, scope: !3803)
!3805 = !DILocation(line: 1628, column: 23, scope: !3803)
!3806 = !DILocation(line: 1629, column: 4, scope: !3803)
!3807 = !DILocation(line: 1629, column: 9, scope: !3803)
!3808 = !DILocation(line: 1629, column: 20, scope: !3803)
!3809 = !DILocation(line: 1630, column: 12, scope: !3810)
!3810 = distinct !DILexicalBlock(scope: !3803, file: !20, line: 1630, column: 12)
!3811 = !DILocation(line: 1630, column: 17, scope: !3810)
!3812 = !DILocation(line: 1630, column: 31, scope: !3810)
!3813 = !DILocation(line: 1631, column: 4, scope: !3810)
!3814 = !DILocation(line: 1631, column: 9, scope: !3810)
!3815 = !DILocation(line: 1631, column: 20, scope: !3810)
!3816 = !DILocation(line: 1633, column: 7, scope: !3817)
!3817 = distinct !DILexicalBlock(scope: !3746, file: !20, line: 1633, column: 7)
!3818 = !DILocation(line: 1633, column: 12, scope: !3817)
!3819 = !DILocation(line: 1633, column: 21, scope: !3817)
!3820 = !DILocation(line: 1634, column: 20, scope: !3817)
!3821 = !DILocation(line: 1634, column: 25, scope: !3817)
!3822 = !DILocation(line: 1634, column: 4, scope: !3817)
!3823 = !DILocation(line: 1636, column: 8, scope: !3824)
!3824 = distinct !DILexicalBlock(scope: !3746, file: !20, line: 1636, column: 7)
!3825 = !DILocation(line: 1636, column: 26, scope: !3824)
!3826 = !DILocation(line: 1636, column: 32, scope: !3824)
!3827 = !DILocation(line: 1636, column: 36, scope: !3824)
!3828 = !DILocation(line: 1636, column: 41, scope: !3824)
!3829 = !DILocation(line: 1636, column: 50, scope: !3824)
!3830 = !DILocation(line: 1636, column: 64, scope: !3824)
!3831 = !DILocation(line: 1636, column: 68, scope: !3824)
!3832 = !DILocation(line: 1636, column: 73, scope: !3824)
!3833 = !DILocation(line: 1636, column: 82, scope: !3824)
!3834 = !DILocation(line: 1636, column: 97, scope: !3824)
!3835 = !DILocation(line: 1636, column: 101, scope: !3824)
!3836 = !DILocation(line: 1636, column: 106, scope: !3824)
!3837 = !DILocation(line: 1636, column: 115, scope: !3824)
!3838 = !DILocation(line: 1636, column: 132, scope: !3824)
!3839 = !DILocation(line: 1636, column: 136, scope: !3824)
!3840 = !DILocation(line: 1636, column: 141, scope: !3824)
!3841 = !DILocation(line: 1636, column: 144, scope: !3824)
!3842 = !DILocation(line: 1636, column: 160, scope: !3824)
!3843 = !DILocation(line: 1636, column: 164, scope: !3824)
!3844 = !DILocation(line: 1636, column: 172, scope: !3824)
!3845 = !DILocation(line: 1636, column: 182, scope: !3824)
!3846 = !DILocation(line: 1636, column: 188, scope: !3824)
!3847 = !DILocation(line: 1636, column: 192, scope: !3824)
!3848 = !DILocation(line: 1636, column: 200, scope: !3824)
!3849 = !DILocation(line: 1636, column: 206, scope: !3824)
!3850 = !DILocation(line: 1637, column: 8, scope: !3851)
!3851 = distinct !DILexicalBlock(scope: !3852, file: !20, line: 1637, column: 8)
!3852 = distinct !DILexicalBlock(scope: !3824, file: !20, line: 1636, column: 213)
!3853 = !DILocation(line: 1637, column: 16, scope: !3851)
!3854 = !DILocation(line: 1637, column: 28, scope: !3851)
!3855 = !DILocation(line: 1638, column: 5, scope: !3851)
!3856 = !DILocation(line: 1638, column: 11, scope: !3851)
!3857 = !DILocation(line: 1638, column: 16, scope: !3851)
!3858 = !DILocation(line: 1640, column: 3, scope: !3852)
!3859 = !DILocation(line: 1641, column: 13, scope: !3860)
!3860 = distinct !DILexicalBlock(scope: !3824, file: !20, line: 1641, column: 12)
!3861 = !DILocation(line: 1641, column: 48, scope: !3860)
!3862 = !DILocation(line: 1641, column: 46, scope: !3860)
!3863 = !DILocation(line: 1641, column: 67, scope: !3860)
!3864 = !DILocation(line: 1641, column: 75, scope: !3860)
!3865 = !DILocation(line: 1641, column: 65, scope: !3860)
!3866 = !DILocation(line: 1641, column: 41, scope: !3860)
!3867 = !DILocation(line: 1641, column: 35, scope: !3860)
!3868 = !DILocation(line: 1641, column: 28, scope: !3860)
!3869 = !DILocation(line: 1642, column: 4, scope: !3860)
!3870 = !DILocation(line: 1642, column: 8, scope: !3860)
!3871 = !DILocation(line: 1642, column: 19, scope: !3860)
!3872 = !DILocation(line: 1642, column: 25, scope: !3860)
!3873 = !DILocation(line: 1642, column: 17, scope: !3860)
!3874 = !DILocation(line: 1642, column: 57, scope: !3860)
!3875 = !DILocation(line: 1642, column: 76, scope: !3860)
!3876 = !DILocation(line: 1642, column: 84, scope: !3860)
!3877 = !DILocation(line: 1642, column: 74, scope: !3860)
!3878 = !DILocation(line: 1642, column: 54, scope: !3860)
!3879 = !DILocation(line: 1642, column: 42, scope: !3860)
!3880 = !DILocation(line: 1643, column: 4, scope: !3860)
!3881 = !DILocation(line: 1643, column: 8, scope: !3860)
!3882 = !DILocation(line: 1643, column: 26, scope: !3860)
!3883 = !DILocation(line: 1644, column: 4, scope: !3860)
!3884 = !DILocation(line: 1644, column: 8, scope: !3860)
!3885 = !DILocation(line: 1644, column: 13, scope: !3860)
!3886 = !DILocation(line: 1644, column: 22, scope: !3860)
!3887 = !DILocation(line: 1645, column: 4, scope: !3860)
!3888 = !DILocation(line: 1645, column: 8, scope: !3860)
!3889 = !DILocation(line: 1645, column: 14, scope: !3860)
!3890 = !DILocation(line: 1645, column: 19, scope: !3860)
!3891 = !DILocation(line: 1646, column: 4, scope: !3892)
!3892 = distinct !DILexicalBlock(scope: !3860, file: !20, line: 1645, column: 40)
!3893 = !DILocation(line: 1646, column: 10, scope: !3892)
!3894 = !DILocation(line: 1646, column: 15, scope: !3892)
!3895 = !DILocation(line: 1647, column: 4, scope: !3892)
!3896 = !DILocation(line: 1647, column: 9, scope: !3892)
!3897 = !DILocation(line: 1647, column: 20, scope: !3892)
!3898 = !DILocation(line: 1648, column: 4, scope: !3892)
!3899 = !DILocation(line: 1648, column: 9, scope: !3892)
!3900 = !DILocation(line: 1648, column: 21, scope: !3892)
!3901 = !DILocation(line: 1649, column: 3, scope: !3892)
!3902 = !DILocation(line: 1651, column: 32, scope: !3746)
!3903 = !DILocation(line: 1651, column: 3, scope: !3746)
!3904 = !DILocation(line: 1653, column: 3, scope: !3746)
!3905 = !DILocation(line: 1657, column: 33, scope: !3906)
!3906 = distinct !DILexicalBlock(scope: !3418, file: !20, line: 1657, column: 7)
!3907 = !DILocation(line: 1657, column: 8, scope: !3906)
!3908 = !DILocation(line: 1657, column: 7, scope: !3906)
!3909 = !DILocation(line: 1658, column: 40, scope: !3910)
!3910 = distinct !DILexicalBlock(scope: !3911, file: !20, line: 1658, column: 8)
!3911 = distinct !DILexicalBlock(scope: !3906, file: !20, line: 1657, column: 43)
!3912 = !DILocation(line: 1658, column: 45, scope: !3910)
!3913 = !DILocation(line: 1658, column: 8, scope: !3910)
!3914 = !DILocation(line: 1659, column: 25, scope: !3915)
!3915 = distinct !DILexicalBlock(scope: !3910, file: !20, line: 1658, column: 51)
!3916 = !DILocation(line: 1659, column: 44, scope: !3915)
!3917 = !DILocation(line: 1659, column: 86, scope: !3915)
!3918 = !DILocation(line: 1659, column: 5, scope: !3915)
!3919 = !DILocation(line: 1660, column: 31, scope: !3915)
!3920 = !DILocation(line: 1660, column: 36, scope: !3915)
!3921 = !DILocation(line: 1660, column: 41, scope: !3915)
!3922 = !DILocation(line: 1660, column: 47, scope: !3915)
!3923 = !DILocation(line: 1660, column: 71, scope: !3915)
!3924 = !DILocation(line: 1660, column: 99, scope: !3915)
!3925 = !DILocation(line: 1660, column: 118, scope: !3915)
!3926 = !DILocation(line: 1660, column: 135, scope: !3915)
!3927 = !DILocation(line: 1660, column: 140, scope: !3915)
!3928 = !DILocation(line: 1660, column: 5, scope: !3915)
!3929 = !DILocation(line: 1661, column: 4, scope: !3915)
!3930 = !DILocation(line: 1662, column: 4, scope: !3911)
!3931 = !DILocation(line: 1665, column: 23, scope: !3418)
!3932 = !DILocation(line: 1665, column: 42, scope: !3418)
!3933 = !DILocation(line: 1665, column: 84, scope: !3418)
!3934 = !DILocation(line: 1665, column: 3, scope: !3418)
!3935 = !DILocation(line: 1667, column: 7, scope: !3936)
!3936 = distinct !DILexicalBlock(scope: !3418, file: !20, line: 1667, column: 7)
!3937 = !DILocation(line: 1667, column: 25, scope: !3936)
!3938 = !DILocalVariable(name: "goal_point", scope: !3939, file: !20, line: 1672, type: !77)
!3939 = distinct !DILexicalBlock(scope: !3936, file: !20, line: 1667, column: 31)
!3940 = !DILocation(line: 1672, column: 15, scope: !3939)
!3941 = !DILocalVariable(name: "goal_vector", scope: !3939, file: !20, line: 1672, type: !77)
!3942 = !DILocation(line: 1672, column: 27, scope: !3939)
!3943 = !DILocalVariable(name: "vec_to_goal", scope: !3939, file: !20, line: 1672, type: !77)
!3944 = !DILocation(line: 1672, column: 40, scope: !3939)
!3945 = !DILocalVariable(name: "rand_vec", scope: !3939, file: !20, line: 1672, type: !77)
!3946 = !DILocation(line: 1672, column: 53, scope: !3939)
!3947 = !DILocalVariable(name: "dot", scope: !3939, file: !20, line: 1673, type: !36)
!3948 = !DILocation(line: 1673, column: 10, scope: !3939)
!3949 = !DILocation(line: 1675, column: 10, scope: !3939)
!3950 = !DILocation(line: 1675, column: 8, scope: !3939)
!3951 = !DILocation(line: 1676, column: 8, scope: !3952)
!3952 = distinct !DILexicalBlock(scope: !3939, file: !20, line: 1676, column: 8)
!3953 = !DILocation(line: 1676, column: 12, scope: !3952)
!3954 = !DILocation(line: 1677, column: 19, scope: !3955)
!3955 = distinct !DILexicalBlock(scope: !3952, file: !20, line: 1676, column: 17)
!3956 = !DILocation(line: 1677, column: 34, scope: !3955)
!3957 = !DILocation(line: 1677, column: 41, scope: !3955)
!3958 = !DILocation(line: 1677, column: 17, scope: !3955)
!3959 = !DILocation(line: 1678, column: 5, scope: !3955)
!3960 = !DILocation(line: 1678, column: 5, scope: !3961)
!3961 = distinct !DILexicalBlock(scope: !3955, file: !20, line: 1678, column: 5)
!3962 = !DILocation(line: 1680, column: 4, scope: !3955)
!3963 = !DILocalVariable(name: "dot", scope: !3964, file: !20, line: 1682, type: !36)
!3964 = distinct !DILexicalBlock(scope: !3952, file: !20, line: 1681, column: 9)
!3965 = !DILocation(line: 1682, column: 9, scope: !3964)
!3966 = !DILocation(line: 1683, column: 11, scope: !3964)
!3967 = !DILocation(line: 1683, column: 9, scope: !3964)
!3968 = !DILocation(line: 1684, column: 19, scope: !3964)
!3969 = !DILocation(line: 1684, column: 34, scope: !3964)
!3970 = !DILocation(line: 1684, column: 41, scope: !3964)
!3971 = !DILocation(line: 1684, column: 17, scope: !3964)
!3972 = !DILocation(line: 1685, column: 9, scope: !3973)
!3973 = distinct !DILexicalBlock(scope: !3964, file: !20, line: 1685, column: 9)
!3974 = !DILocation(line: 1685, column: 13, scope: !3973)
!3975 = !DILocation(line: 1686, column: 6, scope: !3976)
!3976 = distinct !DILexicalBlock(scope: !3973, file: !20, line: 1685, column: 18)
!3977 = !DILocation(line: 1686, column: 6, scope: !3978)
!3978 = distinct !DILexicalBlock(scope: !3976, file: !20, line: 1686, column: 6)
!3979 = !DILocation(line: 1688, column: 5, scope: !3976)
!3980 = !DILocation(line: 1693, column: 36, scope: !3939)
!3981 = !DILocation(line: 1693, column: 51, scope: !3939)
!3982 = !DILocation(line: 1693, column: 58, scope: !3939)
!3983 = !DILocation(line: 1693, column: 63, scope: !3939)
!3984 = !DILocation(line: 1693, column: 56, scope: !3939)
!3985 = !DILocation(line: 1693, column: 73, scope: !3939)
!3986 = !DILocation(line: 1693, column: 80, scope: !3939)
!3987 = !DILocation(line: 1693, column: 86, scope: !3939)
!3988 = !DILocation(line: 1693, column: 84, scope: !3939)
!3989 = !DILocation(line: 1693, column: 98, scope: !3939)
!3990 = !DILocation(line: 1693, column: 104, scope: !3939)
!3991 = !DILocation(line: 1693, column: 68, scope: !3939)
!3992 = !DILocation(line: 1693, column: 33, scope: !3939)
!3993 = !DILocation(line: 1693, column: 4, scope: !3939)
!3994 = !DILocation(line: 1694, column: 29, scope: !3939)
!3995 = !DILocation(line: 1694, column: 44, scope: !3939)
!3996 = !DILocation(line: 1694, column: 4, scope: !3939)
!3997 = !DILocation(line: 1695, column: 4, scope: !3939)
!3998 = !DILocation(line: 1696, column: 4, scope: !3939)
!3999 = !DILocation(line: 1697, column: 43, scope: !3939)
!4000 = !DILocation(line: 1697, column: 48, scope: !3939)
!4001 = !DILocation(line: 1697, column: 4, scope: !3939)
!4002 = !DILocation(line: 1698, column: 4, scope: !3939)
!4003 = !DILocation(line: 1699, column: 24, scope: !3939)
!4004 = !DILocation(line: 1699, column: 4, scope: !3939)
!4005 = !DILocation(line: 1700, column: 43, scope: !3939)
!4006 = !DILocation(line: 1700, column: 48, scope: !3939)
!4007 = !DILocation(line: 1700, column: 56, scope: !3939)
!4008 = !DILocation(line: 1700, column: 66, scope: !3939)
!4009 = !DILocation(line: 1700, column: 4, scope: !3939)
!4010 = !DILocation(line: 1701, column: 30, scope: !3939)
!4011 = !DILocation(line: 1701, column: 35, scope: !3939)
!4012 = !DILocation(line: 1701, column: 40, scope: !3939)
!4013 = !DILocation(line: 1701, column: 46, scope: !3939)
!4014 = !DILocation(line: 1701, column: 70, scope: !3939)
!4015 = !DILocation(line: 1701, column: 98, scope: !3939)
!4016 = !DILocation(line: 1701, column: 117, scope: !3939)
!4017 = !DILocation(line: 1701, column: 134, scope: !3939)
!4018 = !DILocation(line: 1701, column: 139, scope: !3939)
!4019 = !DILocation(line: 1701, column: 4, scope: !3939)
!4020 = !DILocation(line: 1702, column: 3, scope: !3939)
!4021 = !DILocation(line: 1704, column: 7, scope: !4022)
!4022 = distinct !DILexicalBlock(scope: !3418, file: !20, line: 1704, column: 7)
!4023 = !DILocation(line: 1704, column: 12, scope: !4022)
!4024 = !DILocation(line: 1704, column: 23, scope: !4022)
!4025 = !DILocation(line: 1705, column: 4, scope: !4022)
!4026 = !DILocation(line: 1705, column: 9, scope: !4022)
!4027 = !DILocation(line: 1705, column: 20, scope: !4022)
!4028 = !DILocation(line: 1706, column: 12, scope: !4029)
!4029 = distinct !DILexicalBlock(scope: !4022, file: !20, line: 1706, column: 12)
!4030 = !DILocation(line: 1706, column: 17, scope: !4029)
!4031 = !DILocation(line: 1706, column: 31, scope: !4029)
!4032 = !DILocation(line: 1707, column: 4, scope: !4029)
!4033 = !DILocation(line: 1707, column: 9, scope: !4029)
!4034 = !DILocation(line: 1707, column: 20, scope: !4029)
!4035 = !DILocation(line: 1709, column: 32, scope: !3418)
!4036 = !DILocation(line: 1709, column: 3, scope: !3418)
!4037 = !DILocation(line: 1710, column: 3, scope: !3418)
!4038 = !DILocation(line: 1713, column: 8, scope: !4039)
!4039 = distinct !DILexicalBlock(scope: !3418, file: !20, line: 1713, column: 7)
!4040 = !DILocation(line: 1713, column: 38, scope: !4039)
!4041 = !DILocation(line: 1713, column: 55, scope: !4039)
!4042 = !DILocation(line: 1713, column: 62, scope: !4039)
!4043 = !DILocation(line: 1713, column: 36, scope: !4039)
!4044 = !DILocation(line: 1713, column: 23, scope: !4039)
!4045 = !DILocation(line: 1713, column: 68, scope: !4039)
!4046 = !DILocation(line: 1713, column: 72, scope: !4039)
!4047 = !DILocation(line: 1713, column: 78, scope: !4039)
!4048 = !DILocation(line: 1713, column: 100, scope: !4039)
!4049 = !DILocation(line: 1714, column: 24, scope: !4050)
!4050 = distinct !DILexicalBlock(scope: !4039, file: !20, line: 1713, column: 135)
!4051 = !DILocation(line: 1714, column: 43, scope: !4050)
!4052 = !DILocation(line: 1714, column: 85, scope: !4050)
!4053 = !DILocation(line: 1714, column: 4, scope: !4050)
!4054 = !DILocation(line: 1720, column: 9, scope: !4055)
!4055 = distinct !DILexicalBlock(scope: !4050, file: !20, line: 1720, column: 8)
!4056 = !DILocation(line: 1720, column: 27, scope: !4055)
!4057 = !DILocation(line: 1720, column: 33, scope: !4055)
!4058 = !DILocation(line: 1720, column: 37, scope: !4055)
!4059 = !DILocation(line: 1720, column: 57, scope: !4055)
!4060 = !DILocation(line: 1721, column: 35, scope: !4061)
!4061 = distinct !DILexicalBlock(scope: !4062, file: !20, line: 1721, column: 9)
!4062 = distinct !DILexicalBlock(scope: !4055, file: !20, line: 1720, column: 64)
!4063 = !DILocation(line: 1721, column: 10, scope: !4061)
!4064 = !DILocation(line: 1721, column: 9, scope: !4061)
!4065 = !DILocation(line: 1722, column: 42, scope: !4066)
!4066 = distinct !DILexicalBlock(scope: !4067, file: !20, line: 1722, column: 10)
!4067 = distinct !DILexicalBlock(scope: !4061, file: !20, line: 1721, column: 45)
!4068 = !DILocation(line: 1722, column: 47, scope: !4066)
!4069 = !DILocation(line: 1722, column: 10, scope: !4066)
!4070 = !DILocation(line: 1723, column: 33, scope: !4066)
!4071 = !DILocation(line: 1723, column: 38, scope: !4066)
!4072 = !DILocation(line: 1723, column: 43, scope: !4066)
!4073 = !DILocation(line: 1723, column: 49, scope: !4066)
!4074 = !DILocation(line: 1723, column: 73, scope: !4066)
!4075 = !DILocation(line: 1723, column: 101, scope: !4066)
!4076 = !DILocation(line: 1723, column: 120, scope: !4066)
!4077 = !DILocation(line: 1723, column: 137, scope: !4066)
!4078 = !DILocation(line: 1723, column: 142, scope: !4066)
!4079 = !DILocation(line: 1723, column: 7, scope: !4066)
!4080 = !DILocation(line: 1724, column: 6, scope: !4067)
!4081 = !DILocation(line: 1726, column: 44, scope: !4062)
!4082 = !DILocation(line: 1726, column: 49, scope: !4062)
!4083 = !DILocation(line: 1726, column: 57, scope: !4062)
!4084 = !DILocation(line: 1726, column: 67, scope: !4062)
!4085 = !DILocation(line: 1726, column: 5, scope: !4062)
!4086 = !DILocation(line: 1727, column: 34, scope: !4062)
!4087 = !DILocation(line: 1727, column: 5, scope: !4062)
!4088 = !DILocation(line: 1728, column: 4, scope: !4062)
!4089 = !DILocation(line: 1730, column: 20, scope: !4050)
!4090 = !DILocation(line: 1730, column: 25, scope: !4050)
!4091 = !DILocation(line: 1730, column: 4, scope: !4050)
!4092 = !DILocation(line: 1731, column: 8, scope: !4093)
!4093 = distinct !DILexicalBlock(scope: !4050, file: !20, line: 1731, column: 8)
!4094 = !DILocation(line: 1731, column: 26, scope: !4093)
!4095 = !DILocation(line: 1732, column: 9, scope: !4096)
!4096 = distinct !DILexicalBlock(scope: !4097, file: !20, line: 1732, column: 9)
!4097 = distinct !DILexicalBlock(scope: !4093, file: !20, line: 1731, column: 32)
!4098 = !DILocation(line: 1732, column: 17, scope: !4096)
!4099 = !DILocation(line: 1732, column: 29, scope: !4096)
!4100 = !DILocation(line: 1733, column: 6, scope: !4101)
!4101 = distinct !DILexicalBlock(scope: !4096, file: !20, line: 1732, column: 35)
!4102 = !DILocation(line: 1733, column: 11, scope: !4101)
!4103 = !DILocation(line: 1733, column: 20, scope: !4101)
!4104 = !DILocation(line: 1734, column: 36, scope: !4105)
!4105 = distinct !DILexicalBlock(scope: !4101, file: !20, line: 1734, column: 10)
!4106 = !DILocation(line: 1734, column: 11, scope: !4105)
!4107 = !DILocation(line: 1734, column: 10, scope: !4105)
!4108 = !DILocation(line: 1735, column: 43, scope: !4109)
!4109 = distinct !DILexicalBlock(scope: !4110, file: !20, line: 1735, column: 11)
!4110 = distinct !DILexicalBlock(scope: !4105, file: !20, line: 1734, column: 46)
!4111 = !DILocation(line: 1735, column: 48, scope: !4109)
!4112 = !DILocation(line: 1735, column: 11, scope: !4109)
!4113 = !DILocation(line: 1736, column: 34, scope: !4109)
!4114 = !DILocation(line: 1736, column: 39, scope: !4109)
!4115 = !DILocation(line: 1736, column: 44, scope: !4109)
!4116 = !DILocation(line: 1736, column: 50, scope: !4109)
!4117 = !DILocation(line: 1736, column: 74, scope: !4109)
!4118 = !DILocation(line: 1736, column: 102, scope: !4109)
!4119 = !DILocation(line: 1736, column: 121, scope: !4109)
!4120 = !DILocation(line: 1736, column: 138, scope: !4109)
!4121 = !DILocation(line: 1736, column: 143, scope: !4109)
!4122 = !DILocation(line: 1736, column: 8, scope: !4109)
!4123 = !DILocation(line: 1737, column: 7, scope: !4110)
!4124 = !DILocation(line: 1739, column: 33, scope: !4101)
!4125 = !DILocation(line: 1739, column: 38, scope: !4101)
!4126 = !DILocation(line: 1739, column: 44, scope: !4101)
!4127 = !DILocation(line: 1739, column: 82, scope: !4101)
!4128 = !DILocation(line: 1739, column: 6, scope: !4101)
!4129 = !DILocation(line: 1740, column: 10, scope: !4130)
!4130 = distinct !DILexicalBlock(scope: !4101, file: !20, line: 1740, column: 10)
!4131 = !DILocation(line: 1741, column: 36, scope: !4132)
!4132 = distinct !DILexicalBlock(scope: !4130, file: !20, line: 1740, column: 21)
!4133 = !DILocation(line: 1741, column: 7, scope: !4132)
!4134 = !DILocation(line: 1742, column: 17, scope: !4132)
!4135 = !DILocation(line: 1743, column: 6, scope: !4132)
!4136 = !DILocation(line: 1745, column: 36, scope: !4130)
!4137 = !DILocation(line: 1745, column: 7, scope: !4130)
!4138 = !DILocation(line: 1746, column: 5, scope: !4101)
!4139 = !DILocation(line: 1749, column: 36, scope: !4140)
!4140 = distinct !DILexicalBlock(scope: !4141, file: !20, line: 1749, column: 10)
!4141 = distinct !DILexicalBlock(scope: !4096, file: !20, line: 1747, column: 10)
!4142 = !DILocation(line: 1749, column: 11, scope: !4140)
!4143 = !DILocation(line: 1749, column: 10, scope: !4140)
!4144 = !DILocation(line: 1750, column: 43, scope: !4145)
!4145 = distinct !DILexicalBlock(scope: !4146, file: !20, line: 1750, column: 11)
!4146 = distinct !DILexicalBlock(scope: !4140, file: !20, line: 1749, column: 46)
!4147 = !DILocation(line: 1750, column: 48, scope: !4145)
!4148 = !DILocation(line: 1750, column: 11, scope: !4145)
!4149 = !DILocation(line: 1751, column: 34, scope: !4145)
!4150 = !DILocation(line: 1751, column: 39, scope: !4145)
!4151 = !DILocation(line: 1751, column: 44, scope: !4145)
!4152 = !DILocation(line: 1751, column: 50, scope: !4145)
!4153 = !DILocation(line: 1751, column: 74, scope: !4145)
!4154 = !DILocation(line: 1751, column: 102, scope: !4145)
!4155 = !DILocation(line: 1751, column: 121, scope: !4145)
!4156 = !DILocation(line: 1751, column: 138, scope: !4145)
!4157 = !DILocation(line: 1751, column: 143, scope: !4145)
!4158 = !DILocation(line: 1751, column: 8, scope: !4145)
!4159 = !DILocation(line: 1752, column: 7, scope: !4146)
!4160 = !DILocation(line: 1754, column: 33, scope: !4141)
!4161 = !DILocation(line: 1754, column: 38, scope: !4141)
!4162 = !DILocation(line: 1754, column: 44, scope: !4141)
!4163 = !DILocation(line: 1754, column: 82, scope: !4141)
!4164 = !DILocation(line: 1754, column: 6, scope: !4141)
!4165 = !DILocation(line: 1755, column: 10, scope: !4166)
!4166 = distinct !DILexicalBlock(scope: !4141, file: !20, line: 1755, column: 10)
!4167 = !DILocation(line: 1756, column: 36, scope: !4168)
!4168 = distinct !DILexicalBlock(scope: !4166, file: !20, line: 1755, column: 21)
!4169 = !DILocation(line: 1756, column: 7, scope: !4168)
!4170 = !DILocation(line: 1757, column: 17, scope: !4168)
!4171 = !DILocation(line: 1758, column: 6, scope: !4168)
!4172 = !DILocation(line: 1760, column: 36, scope: !4166)
!4173 = !DILocation(line: 1760, column: 7, scope: !4166)
!4174 = !DILocation(line: 1762, column: 4, scope: !4097)
!4175 = !DILocation(line: 1763, column: 14, scope: !4176)
!4176 = distinct !DILexicalBlock(scope: !4093, file: !20, line: 1763, column: 13)
!4177 = !DILocation(line: 1763, column: 19, scope: !4176)
!4178 = !DILocation(line: 1763, column: 29, scope: !4176)
!4179 = !DILocation(line: 1763, column: 34, scope: !4176)
!4180 = !DILocation(line: 1763, column: 26, scope: !4176)
!4181 = !DILocation(line: 1763, column: 48, scope: !4176)
!4182 = !DILocation(line: 1763, column: 52, scope: !4176)
!4183 = !DILocation(line: 1763, column: 67, scope: !4176)
!4184 = !DILocation(line: 1763, column: 80, scope: !4176)
!4185 = !DILocation(line: 1763, column: 86, scope: !4176)
!4186 = !DILocation(line: 1763, column: 96, scope: !4176)
!4187 = !DILocation(line: 1763, column: 85, scope: !4176)
!4188 = !DILocation(line: 1766, column: 9, scope: !4189)
!4189 = distinct !DILexicalBlock(scope: !4190, file: !20, line: 1766, column: 9)
!4190 = distinct !DILexicalBlock(scope: !4176, file: !20, line: 1763, column: 110)
!4191 = !DILocation(line: 1766, column: 14, scope: !4189)
!4192 = !DILocation(line: 1766, column: 23, scope: !4189)
!4193 = !DILocation(line: 1767, column: 27, scope: !4194)
!4194 = distinct !DILexicalBlock(scope: !4189, file: !20, line: 1766, column: 39)
!4195 = !DILocation(line: 1767, column: 32, scope: !4194)
!4196 = !DILocation(line: 1767, column: 6, scope: !4194)
!4197 = !DILocation(line: 1767, column: 12, scope: !4194)
!4198 = !DILocation(line: 1767, column: 25, scope: !4194)
!4199 = !DILocation(line: 1769, column: 29, scope: !4194)
!4200 = !DILocation(line: 1769, column: 6, scope: !4194)
!4201 = !DILocation(line: 1770, column: 5, scope: !4194)
!4202 = !DILocation(line: 1771, column: 5, scope: !4190)
!4203 = !DILocation(line: 1773, column: 3, scope: !4050)
!4204 = !DILocation(line: 1775, column: 3, scope: !3418)
!4205 = !DILocalVariable(name: "center_point", scope: !4206, file: !20, line: 1777, type: !77)
!4206 = distinct !DILexicalBlock(scope: !3418, file: !20, line: 1776, column: 22)
!4207 = !DILocation(line: 1777, column: 14, scope: !4206)
!4208 = !DILocalVariable(name: "goal_vector", scope: !4206, file: !20, line: 1777, type: !77)
!4209 = !DILocation(line: 1777, column: 28, scope: !4206)
!4210 = !DILocation(line: 1778, column: 3, scope: !4206)
!4211 = !DILocation(line: 1780, column: 33, scope: !4212)
!4212 = distinct !DILexicalBlock(scope: !4206, file: !20, line: 1780, column: 7)
!4213 = !DILocation(line: 1780, column: 8, scope: !4212)
!4214 = !DILocation(line: 1780, column: 7, scope: !4212)
!4215 = !DILocation(line: 1781, column: 4, scope: !4212)
!4216 = !DILocation(line: 1782, column: 57, scope: !4206)
!4217 = !DILocation(line: 1782, column: 62, scope: !4206)
!4218 = !DILocation(line: 1782, column: 48, scope: !4206)
!4219 = !DILocation(line: 1782, column: 71, scope: !4206)
!4220 = !DILocation(line: 1782, column: 76, scope: !4206)
!4221 = !DILocation(line: 1782, column: 3, scope: !4206)
!4222 = !DILocation(line: 1783, column: 44, scope: !4206)
!4223 = !DILocation(line: 1783, column: 49, scope: !4206)
!4224 = !DILocation(line: 1783, column: 3, scope: !4206)
!4225 = !DILocation(line: 1784, column: 3, scope: !4206)
!4226 = !DILocation(line: 1785, column: 40, scope: !4206)
!4227 = !DILocation(line: 1785, column: 45, scope: !4206)
!4228 = !DILocation(line: 1785, column: 53, scope: !4206)
!4229 = !DILocation(line: 1785, column: 63, scope: !4206)
!4230 = !DILocation(line: 1785, column: 3, scope: !4206)
!4231 = !DILocation(line: 1786, column: 23, scope: !4206)
!4232 = !DILocation(line: 1786, column: 3, scope: !4206)
!4233 = !DILocation(line: 1787, column: 32, scope: !4206)
!4234 = !DILocation(line: 1787, column: 3, scope: !4206)
!4235 = !DILocation(line: 1789, column: 3, scope: !4206)
!4236 = !DILocation(line: 1793, column: 3, scope: !3418)
!4237 = !DILocation(line: 1798, column: 3, scope: !3418)
!4238 = !DILocation(line: 1802, column: 32, scope: !4239)
!4239 = distinct !DILexicalBlock(scope: !3418, file: !20, line: 1802, column: 7)
!4240 = !DILocation(line: 1802, column: 7, scope: !4239)
!4241 = !DILocation(line: 1803, column: 30, scope: !4242)
!4242 = distinct !DILexicalBlock(scope: !4239, file: !20, line: 1802, column: 42)
!4243 = !DILocation(line: 1803, column: 35, scope: !4242)
!4244 = !DILocation(line: 1803, column: 40, scope: !4242)
!4245 = !DILocation(line: 1803, column: 46, scope: !4242)
!4246 = !DILocation(line: 1803, column: 70, scope: !4242)
!4247 = !DILocation(line: 1803, column: 98, scope: !4242)
!4248 = !DILocation(line: 1803, column: 117, scope: !4242)
!4249 = !DILocation(line: 1803, column: 134, scope: !4242)
!4250 = !DILocation(line: 1803, column: 139, scope: !4242)
!4251 = !DILocation(line: 1803, column: 4, scope: !4242)
!4252 = !DILocation(line: 1804, column: 8, scope: !4253)
!4253 = distinct !DILexicalBlock(scope: !4242, file: !20, line: 1804, column: 8)
!4254 = !DILocation(line: 1804, column: 16, scope: !4253)
!4255 = !DILocation(line: 1805, column: 32, scope: !4253)
!4256 = !DILocation(line: 1805, column: 37, scope: !4253)
!4257 = !DILocation(line: 1805, column: 43, scope: !4253)
!4258 = !DILocation(line: 1805, column: 81, scope: !4253)
!4259 = !DILocation(line: 1805, column: 5, scope: !4253)
!4260 = !DILocation(line: 1806, column: 4, scope: !4242)
!4261 = !DILocation(line: 1808, column: 3, scope: !3418)
!4262 = !DILocation(line: 1814, column: 3, scope: !3418)
!4263 = !DILocation(line: 1817, column: 3, scope: !3418)
!4264 = !DILocation(line: 1818, column: 3, scope: !3418)
!4265 = !DILocation(line: 1818, column: 9, scope: !3418)
!4266 = !DILocation(line: 1818, column: 14, scope: !3418)
!4267 = !DILocation(line: 1819, column: 3, scope: !3418)
!4268 = !DILocation(line: 1826, column: 22, scope: !2069)
!4269 = !DILocation(line: 1826, column: 41, scope: !2069)
!4270 = !DILocation(line: 1826, column: 83, scope: !2069)
!4271 = !DILocation(line: 1826, column: 2, scope: !2069)
!4272 = !DILocation(line: 1827, column: 7, scope: !4273)
!4273 = distinct !DILexicalBlock(scope: !2069, file: !20, line: 1827, column: 6)
!4274 = !DILocation(line: 1827, column: 25, scope: !4273)
!4275 = !DILocation(line: 1827, column: 31, scope: !4273)
!4276 = !DILocation(line: 1827, column: 35, scope: !4273)
!4277 = !DILocation(line: 1827, column: 40, scope: !4273)
!4278 = !DILocation(line: 1827, column: 49, scope: !4273)
!4279 = !DILocation(line: 1827, column: 64, scope: !4273)
!4280 = !DILocation(line: 1827, column: 69, scope: !4273)
!4281 = !DILocation(line: 1827, column: 77, scope: !4273)
!4282 = !DILocation(line: 1828, column: 8, scope: !4283)
!4283 = distinct !DILexicalBlock(scope: !4284, file: !20, line: 1828, column: 7)
!4284 = distinct !DILexicalBlock(scope: !4273, file: !20, line: 1827, column: 85)
!4285 = !DILocation(line: 1828, column: 14, scope: !4283)
!4286 = !DILocation(line: 1828, column: 36, scope: !4283)
!4287 = !DILocation(line: 1828, column: 42, scope: !4283)
!4288 = !DILocation(line: 1828, column: 46, scope: !4283)
!4289 = !DILocation(line: 1828, column: 51, scope: !4283)
!4290 = !DILocation(line: 1828, column: 61, scope: !4283)
!4291 = !DILocation(line: 1828, column: 45, scope: !4283)
!4292 = !DILocation(line: 1829, column: 4, scope: !4283)
!4293 = !DILocation(line: 1829, column: 9, scope: !4283)
!4294 = !DILocation(line: 1829, column: 19, scope: !4283)
!4295 = !DILocation(line: 1830, column: 12, scope: !4296)
!4296 = distinct !DILexicalBlock(scope: !4283, file: !20, line: 1830, column: 12)
!4297 = !DILocation(line: 1830, column: 18, scope: !4296)
!4298 = !DILocation(line: 1830, column: 40, scope: !4296)
!4299 = !DILocation(line: 1831, column: 4, scope: !4296)
!4300 = !DILocation(line: 1831, column: 10, scope: !4296)
!4301 = !DILocation(line: 1831, column: 32, scope: !4296)
!4302 = !DILocation(line: 1832, column: 2, scope: !4284)
!4303 = !DILocation(line: 1835, column: 7, scope: !4304)
!4304 = distinct !DILexicalBlock(scope: !2069, file: !20, line: 1835, column: 6)
!4305 = !DILocation(line: 1835, column: 6, scope: !4304)
!4306 = !DILocation(line: 1836, column: 24, scope: !4307)
!4307 = distinct !DILexicalBlock(scope: !4304, file: !20, line: 1835, column: 24)
!4308 = !DILocation(line: 1836, column: 29, scope: !4307)
!4309 = !DILocation(line: 1836, column: 3, scope: !4307)
!4310 = !DILocation(line: 1836, column: 8, scope: !4307)
!4311 = !DILocation(line: 1836, column: 22, scope: !4307)
!4312 = !DILocation(line: 1838, column: 2, scope: !4307)
!4313 = !DILocation(line: 1840, column: 2, scope: !2069)
!4314 = !DILocation(line: 1841, column: 2, scope: !2069)
!4315 = !DILocation(line: 1842, column: 2, scope: !2069)
!4316 = !DILocation(line: 1845, column: 6, scope: !4317)
!4317 = distinct !DILexicalBlock(scope: !2069, file: !20, line: 1845, column: 6)
!4318 = !DILocation(line: 1845, column: 12, scope: !4317)
!4319 = !DILocation(line: 1846, column: 40, scope: !4320)
!4320 = distinct !DILexicalBlock(scope: !4317, file: !20, line: 1845, column: 35)
!4321 = !DILocation(line: 1846, column: 46, scope: !4320)
!4322 = !DILocation(line: 1846, column: 68, scope: !4320)
!4323 = !DILocation(line: 1846, column: 20, scope: !4320)
!4324 = !DILocation(line: 1846, column: 73, scope: !4320)
!4325 = !DILocation(line: 1846, column: 78, scope: !4320)
!4326 = !DILocation(line: 1846, column: 93, scope: !4320)
!4327 = !DILocation(line: 1846, column: 98, scope: !4320)
!4328 = !DILocation(line: 1846, column: 18, scope: !4320)
!4329 = !DILocation(line: 1847, column: 7, scope: !4330)
!4330 = distinct !DILexicalBlock(scope: !4320, file: !20, line: 1847, column: 7)
!4331 = !DILocation(line: 1847, column: 13, scope: !4330)
!4332 = !DILocation(line: 1847, column: 35, scope: !4330)
!4333 = !DILocation(line: 1849, column: 4, scope: !4334)
!4334 = distinct !DILexicalBlock(scope: !4330, file: !20, line: 1847, column: 65)
!4335 = !DILocation(line: 1849, column: 10, scope: !4334)
!4336 = !DILocation(line: 1849, column: 31, scope: !4334)
!4337 = !DILocation(line: 1850, column: 4, scope: !4334)
!4338 = !DILocation(line: 1850, column: 10, scope: !4334)
!4339 = !DILocation(line: 1850, column: 32, scope: !4334)
!4340 = !DILocation(line: 1851, column: 3, scope: !4334)
!4341 = !DILocation(line: 1853, column: 7, scope: !4342)
!4342 = distinct !DILexicalBlock(scope: !4320, file: !20, line: 1853, column: 7)
!4343 = !DILocation(line: 1853, column: 22, scope: !4342)
!4344 = !DILocation(line: 1854, column: 19, scope: !4342)
!4345 = !DILocation(line: 1854, column: 4, scope: !4342)
!4346 = !DILocation(line: 1856, column: 7, scope: !4347)
!4347 = distinct !DILexicalBlock(scope: !4320, file: !20, line: 1856, column: 7)
!4348 = !DILocation(line: 1856, column: 12, scope: !4347)
!4349 = !DILocation(line: 1856, column: 26, scope: !4347)
!4350 = !DILocation(line: 1857, column: 4, scope: !4347)
!4351 = !DILocation(line: 1857, column: 9, scope: !4347)
!4352 = !DILocation(line: 1857, column: 23, scope: !4347)
!4353 = !DILocation(line: 1859, column: 21, scope: !4320)
!4354 = !DILocation(line: 1859, column: 3, scope: !4320)
!4355 = !DILocation(line: 1859, column: 8, scope: !4320)
!4356 = !DILocation(line: 1859, column: 19, scope: !4320)
!4357 = !DILocation(line: 1861, column: 2, scope: !4320)
!4358 = !DILocation(line: 1865, column: 7, scope: !4359)
!4359 = distinct !DILexicalBlock(scope: !2069, file: !20, line: 1865, column: 6)
!4360 = !DILocation(line: 1865, column: 12, scope: !4359)
!4361 = !DILocation(line: 1865, column: 23, scope: !4359)
!4362 = !DILocation(line: 1865, column: 6, scope: !4359)
!4363 = !DILocalVariable(name: "i", scope: !4364, file: !20, line: 1866, type: !7)
!4364 = distinct !DILexicalBlock(scope: !4359, file: !20, line: 1865, column: 37)
!4365 = !DILocation(line: 1866, column: 7, scope: !4364)
!4366 = !DILocalVariable(name: "num_guns", scope: !4364, file: !20, line: 1866, type: !7)
!4367 = !DILocation(line: 1866, column: 10, scope: !4364)
!4368 = !DILocation(line: 1867, column: 25, scope: !4364)
!4369 = !DILocation(line: 1867, column: 30, scope: !4364)
!4370 = !DILocation(line: 1867, column: 14, scope: !4364)
!4371 = !DILocation(line: 1867, column: 34, scope: !4364)
!4372 = !DILocation(line: 1867, column: 12, scope: !4364)
!4373 = !DILocation(line: 1868, column: 10, scope: !4374)
!4374 = distinct !DILexicalBlock(scope: !4364, file: !20, line: 1868, column: 3)
!4375 = !DILocation(line: 1868, column: 8, scope: !4374)
!4376 = !DILocation(line: 1868, column: 15, scope: !4377)
!4377 = distinct !DILexicalBlock(scope: !4374, file: !20, line: 1868, column: 3)
!4378 = !DILocation(line: 1868, column: 19, scope: !4377)
!4379 = !DILocation(line: 1868, column: 17, scope: !4377)
!4380 = !DILocation(line: 1868, column: 3, scope: !4374)
!4381 = !DILocation(line: 1869, column: 4, scope: !4377)
!4382 = !DILocation(line: 1869, column: 10, scope: !4377)
!4383 = !DILocation(line: 1869, column: 21, scope: !4377)
!4384 = !DILocation(line: 1869, column: 24, scope: !4377)
!4385 = !DILocation(line: 1868, column: 30, scope: !4377)
!4386 = !DILocation(line: 1868, column: 3, scope: !4377)
!4387 = distinct !{!4387, !4380, !4388, !1756}
!4388 = !DILocation(line: 1869, column: 26, scope: !4374)
!4389 = !DILocation(line: 1870, column: 2, scope: !4364)
!4390 = !DILocation(line: 1874, column: 20, scope: !4391)
!4391 = distinct !DILexicalBlock(scope: !2069, file: !20, line: 1874, column: 6)
!4392 = !DILocation(line: 1874, column: 28, scope: !4391)
!4393 = !DILocation(line: 1874, column: 6, scope: !4391)
!4394 = !DILocation(line: 1874, column: 34, scope: !4391)
!4395 = !DILocation(line: 1874, column: 38, scope: !4391)
!4396 = !DILocation(line: 1874, column: 43, scope: !4391)
!4397 = !DILocation(line: 1874, column: 54, scope: !4391)
!4398 = !DILocation(line: 1875, column: 3, scope: !4391)
!4399 = !DILocation(line: 1875, column: 8, scope: !4391)
!4400 = !DILocation(line: 1875, column: 22, scope: !4391)
!4401 = !DILocation(line: 1877, column: 7, scope: !4402)
!4402 = distinct !DILexicalBlock(scope: !2069, file: !20, line: 1877, column: 6)
!4403 = !DILocation(line: 1877, column: 12, scope: !4402)
!4404 = !DILocation(line: 1877, column: 23, scope: !4402)
!4405 = !DILocation(line: 1877, column: 36, scope: !4402)
!4406 = !DILocation(line: 1877, column: 40, scope: !4402)
!4407 = !DILocation(line: 1877, column: 45, scope: !4402)
!4408 = !DILocation(line: 1877, column: 48, scope: !4402)
!4409 = !DILocation(line: 1878, column: 11, scope: !4410)
!4410 = distinct !DILexicalBlock(scope: !4402, file: !20, line: 1877, column: 65)
!4411 = !DILocation(line: 1878, column: 16, scope: !4410)
!4412 = !DILocation(line: 1878, column: 3, scope: !4410)
!4413 = !DILocation(line: 1880, column: 24, scope: !4414)
!4414 = distinct !DILexicalBlock(scope: !4410, file: !20, line: 1878, column: 31)
!4415 = !DILocation(line: 1880, column: 43, scope: !4414)
!4416 = !DILocation(line: 1880, column: 85, scope: !4414)
!4417 = !DILocation(line: 1880, column: 4, scope: !4414)
!4418 = !DILocation(line: 1882, column: 10, scope: !4414)
!4419 = !DILocation(line: 1882, column: 8, scope: !4414)
!4420 = !DILocation(line: 1883, column: 8, scope: !4421)
!4421 = distinct !DILexicalBlock(scope: !4414, file: !20, line: 1883, column: 8)
!4422 = !DILocation(line: 1883, column: 12, scope: !4421)
!4423 = !DILocation(line: 1884, column: 9, scope: !4424)
!4424 = distinct !DILexicalBlock(scope: !4421, file: !20, line: 1884, column: 9)
!4425 = !DILocation(line: 1884, column: 14, scope: !4424)
!4426 = !DILocation(line: 1884, column: 25, scope: !4424)
!4427 = !DILocation(line: 1885, column: 6, scope: !4424)
!4428 = !DILocation(line: 1885, column: 11, scope: !4424)
!4429 = !DILocation(line: 1885, column: 22, scope: !4424)
!4430 = !DILocation(line: 1884, column: 28, scope: !4424)
!4431 = !DILocation(line: 1886, column: 4, scope: !4414)
!4432 = !DILocation(line: 1888, column: 8, scope: !4433)
!4433 = distinct !DILexicalBlock(scope: !4414, file: !20, line: 1888, column: 8)
!4434 = !DILocation(line: 1888, column: 13, scope: !4433)
!4435 = !DILocation(line: 1888, column: 24, scope: !4433)
!4436 = !DILocation(line: 1889, column: 25, scope: !4437)
!4437 = distinct !DILexicalBlock(scope: !4433, file: !20, line: 1888, column: 37)
!4438 = !DILocation(line: 1889, column: 44, scope: !4437)
!4439 = !DILocation(line: 1889, column: 86, scope: !4437)
!4440 = !DILocation(line: 1889, column: 5, scope: !4437)
!4441 = !DILocation(line: 1890, column: 23, scope: !4442)
!4442 = distinct !DILexicalBlock(scope: !4437, file: !20, line: 1890, column: 9)
!4443 = !DILocation(line: 1890, column: 31, scope: !4442)
!4444 = !DILocation(line: 1890, column: 9, scope: !4442)
!4445 = !DILocation(line: 1890, column: 37, scope: !4442)
!4446 = !DILocation(line: 1890, column: 41, scope: !4442)
!4447 = !DILocation(line: 1890, column: 40, scope: !4442)
!4448 = !DILocation(line: 1892, column: 6, scope: !4449)
!4449 = distinct !DILexicalBlock(scope: !4442, file: !20, line: 1890, column: 61)
!4450 = !DILocation(line: 1892, column: 11, scope: !4449)
!4451 = !DILocation(line: 1892, column: 22, scope: !4449)
!4452 = !DILocation(line: 1893, column: 5, scope: !4449)
!4453 = !DILocation(line: 1894, column: 4, scope: !4437)
!4454 = !DILocation(line: 1895, column: 4, scope: !4414)
!4455 = !DILocation(line: 1897, column: 34, scope: !4456)
!4456 = distinct !DILexicalBlock(scope: !4414, file: !20, line: 1897, column: 8)
!4457 = !DILocation(line: 1897, column: 9, scope: !4456)
!4458 = !DILocation(line: 1897, column: 8, scope: !4456)
!4459 = !DILocation(line: 1898, column: 5, scope: !4456)
!4460 = !DILocation(line: 1900, column: 24, scope: !4414)
!4461 = !DILocation(line: 1900, column: 43, scope: !4414)
!4462 = !DILocation(line: 1900, column: 85, scope: !4414)
!4463 = !DILocation(line: 1900, column: 4, scope: !4414)
!4464 = !DILocation(line: 1902, column: 8, scope: !4465)
!4465 = distinct !DILexicalBlock(scope: !4414, file: !20, line: 1902, column: 8)
!4466 = !DILocation(line: 1902, column: 26, scope: !4465)
!4467 = !DILocation(line: 1903, column: 44, scope: !4468)
!4468 = distinct !DILexicalBlock(scope: !4465, file: !20, line: 1902, column: 32)
!4469 = !DILocation(line: 1903, column: 49, scope: !4468)
!4470 = !DILocation(line: 1903, column: 57, scope: !4468)
!4471 = !DILocation(line: 1903, column: 67, scope: !4468)
!4472 = !DILocation(line: 1903, column: 5, scope: !4468)
!4473 = !DILocation(line: 1904, column: 34, scope: !4468)
!4474 = !DILocation(line: 1904, column: 5, scope: !4468)
!4475 = !DILocation(line: 1905, column: 4, scope: !4468)
!4476 = !DILocation(line: 1906, column: 4, scope: !4414)
!4477 = !DILocation(line: 1908, column: 24, scope: !4414)
!4478 = !DILocation(line: 1908, column: 43, scope: !4414)
!4479 = !DILocation(line: 1908, column: 85, scope: !4414)
!4480 = !DILocation(line: 1908, column: 4, scope: !4414)
!4481 = !DILocation(line: 1910, column: 10, scope: !4482)
!4482 = distinct !DILexicalBlock(scope: !4414, file: !20, line: 1910, column: 8)
!4483 = !DILocation(line: 1910, column: 20, scope: !4482)
!4484 = !DILocation(line: 1910, column: 9, scope: !4482)
!4485 = !DILocation(line: 1910, column: 32, scope: !4482)
!4486 = !DILocation(line: 1910, column: 36, scope: !4482)
!4487 = !DILocation(line: 1910, column: 35, scope: !4482)
!4488 = !DILocation(line: 1911, column: 35, scope: !4489)
!4489 = distinct !DILexicalBlock(scope: !4490, file: !20, line: 1911, column: 9)
!4490 = distinct !DILexicalBlock(scope: !4482, file: !20, line: 1910, column: 56)
!4491 = !DILocation(line: 1911, column: 10, scope: !4489)
!4492 = !DILocation(line: 1911, column: 9, scope: !4489)
!4493 = !DILocation(line: 1912, column: 6, scope: !4489)
!4494 = !DILocation(line: 1914, column: 9, scope: !4495)
!4495 = distinct !DILexicalBlock(scope: !4490, file: !20, line: 1914, column: 9)
!4496 = !DILocation(line: 1914, column: 27, scope: !4495)
!4497 = !DILocation(line: 1915, column: 45, scope: !4498)
!4498 = distinct !DILexicalBlock(scope: !4495, file: !20, line: 1914, column: 33)
!4499 = !DILocation(line: 1915, column: 50, scope: !4498)
!4500 = !DILocation(line: 1915, column: 58, scope: !4498)
!4501 = !DILocation(line: 1915, column: 68, scope: !4498)
!4502 = !DILocation(line: 1915, column: 6, scope: !4498)
!4503 = !DILocation(line: 1916, column: 35, scope: !4498)
!4504 = !DILocation(line: 1916, column: 6, scope: !4498)
!4505 = !DILocation(line: 1917, column: 5, scope: !4498)
!4506 = !DILocation(line: 1918, column: 4, scope: !4490)
!4507 = !DILocation(line: 1919, column: 4, scope: !4414)
!4508 = !DILocation(line: 1921, column: 24, scope: !4414)
!4509 = !DILocation(line: 1921, column: 43, scope: !4414)
!4510 = !DILocation(line: 1921, column: 85, scope: !4414)
!4511 = !DILocation(line: 1921, column: 4, scope: !4414)
!4512 = !DILocation(line: 1923, column: 8, scope: !4513)
!4513 = distinct !DILexicalBlock(scope: !4414, file: !20, line: 1923, column: 8)
!4514 = !DILocation(line: 1923, column: 26, scope: !4513)
!4515 = !DILocation(line: 1924, column: 35, scope: !4516)
!4516 = distinct !DILexicalBlock(scope: !4517, file: !20, line: 1924, column: 9)
!4517 = distinct !DILexicalBlock(scope: !4513, file: !20, line: 1923, column: 32)
!4518 = !DILocation(line: 1924, column: 10, scope: !4516)
!4519 = !DILocation(line: 1924, column: 9, scope: !4516)
!4520 = !DILocation(line: 1925, column: 10, scope: !4521)
!4521 = distinct !DILexicalBlock(scope: !4522, file: !20, line: 1925, column: 10)
!4522 = distinct !DILexicalBlock(scope: !4516, file: !20, line: 1924, column: 69)
!4523 = !DILocation(line: 1925, column: 20, scope: !4521)
!4524 = !DILocation(line: 1926, column: 33, scope: !4525)
!4525 = distinct !DILexicalBlock(scope: !4521, file: !20, line: 1925, column: 32)
!4526 = !DILocation(line: 1926, column: 38, scope: !4525)
!4527 = !DILocation(line: 1926, column: 43, scope: !4525)
!4528 = !DILocation(line: 1926, column: 49, scope: !4525)
!4529 = !DILocation(line: 1926, column: 73, scope: !4525)
!4530 = !DILocation(line: 1926, column: 101, scope: !4525)
!4531 = !DILocation(line: 1926, column: 120, scope: !4525)
!4532 = !DILocation(line: 1926, column: 137, scope: !4525)
!4533 = !DILocation(line: 1926, column: 142, scope: !4525)
!4534 = !DILocation(line: 1926, column: 7, scope: !4525)
!4535 = !DILocation(line: 1927, column: 7, scope: !4525)
!4536 = !DILocation(line: 1929, column: 5, scope: !4522)
!4537 = !DILocation(line: 1930, column: 44, scope: !4517)
!4538 = !DILocation(line: 1930, column: 49, scope: !4517)
!4539 = !DILocation(line: 1930, column: 57, scope: !4517)
!4540 = !DILocation(line: 1930, column: 67, scope: !4517)
!4541 = !DILocation(line: 1930, column: 5, scope: !4517)
!4542 = !DILocation(line: 1931, column: 34, scope: !4517)
!4543 = !DILocation(line: 1931, column: 5, scope: !4517)
!4544 = !DILocation(line: 1932, column: 4, scope: !4517)
!4545 = !DILocation(line: 1935, column: 30, scope: !4414)
!4546 = !DILocation(line: 1935, column: 35, scope: !4414)
!4547 = !DILocation(line: 1935, column: 40, scope: !4414)
!4548 = !DILocation(line: 1935, column: 46, scope: !4414)
!4549 = !DILocation(line: 1935, column: 70, scope: !4414)
!4550 = !DILocation(line: 1935, column: 98, scope: !4414)
!4551 = !DILocation(line: 1935, column: 117, scope: !4414)
!4552 = !DILocation(line: 1935, column: 134, scope: !4414)
!4553 = !DILocation(line: 1935, column: 139, scope: !4414)
!4554 = !DILocation(line: 1935, column: 4, scope: !4414)
!4555 = !DILocation(line: 1937, column: 4, scope: !4414)
!4556 = !DILocation(line: 1939, column: 10, scope: !4557)
!4557 = distinct !DILexicalBlock(scope: !4414, file: !20, line: 1939, column: 8)
!4558 = !DILocation(line: 1939, column: 18, scope: !4557)
!4559 = !DILocation(line: 1939, column: 9, scope: !4557)
!4560 = !DILocation(line: 1939, column: 8, scope: !4557)
!4561 = !DILocation(line: 1940, column: 25, scope: !4562)
!4562 = distinct !DILexicalBlock(scope: !4557, file: !20, line: 1939, column: 24)
!4563 = !DILocation(line: 1940, column: 44, scope: !4562)
!4564 = !DILocation(line: 1940, column: 86, scope: !4562)
!4565 = !DILocation(line: 1940, column: 5, scope: !4562)
!4566 = !DILocation(line: 1941, column: 9, scope: !4567)
!4567 = distinct !DILexicalBlock(scope: !4562, file: !20, line: 1941, column: 9)
!4568 = !DILocation(line: 1941, column: 27, scope: !4567)
!4569 = !DILocation(line: 1942, column: 36, scope: !4570)
!4570 = distinct !DILexicalBlock(scope: !4571, file: !20, line: 1942, column: 10)
!4571 = distinct !DILexicalBlock(scope: !4567, file: !20, line: 1941, column: 33)
!4572 = !DILocation(line: 1942, column: 11, scope: !4570)
!4573 = !DILocation(line: 1942, column: 10, scope: !4570)
!4574 = !DILocation(line: 1943, column: 7, scope: !4570)
!4575 = !DILocation(line: 1944, column: 45, scope: !4571)
!4576 = !DILocation(line: 1944, column: 50, scope: !4571)
!4577 = !DILocation(line: 1944, column: 58, scope: !4571)
!4578 = !DILocation(line: 1944, column: 68, scope: !4571)
!4579 = !DILocation(line: 1944, column: 6, scope: !4571)
!4580 = !DILocation(line: 1945, column: 35, scope: !4571)
!4581 = !DILocation(line: 1945, column: 6, scope: !4571)
!4582 = !DILocation(line: 1946, column: 5, scope: !4571)
!4583 = !DILocation(line: 1947, column: 4, scope: !4562)
!4584 = !DILocation(line: 1948, column: 4, scope: !4414)
!4585 = !DILocation(line: 1951, column: 4, scope: !4414)
!4586 = !DILocation(line: 1953, column: 4, scope: !4414)
!4587 = !DILocation(line: 1954, column: 4, scope: !4414)
!4588 = !DILocation(line: 1954, column: 9, scope: !4414)
!4589 = !DILocation(line: 1954, column: 20, scope: !4414)
!4590 = !DILocation(line: 1955, column: 4, scope: !4414)
!4591 = !DILocation(line: 1955, column: 9, scope: !4414)
!4592 = !DILocation(line: 1955, column: 23, scope: !4414)
!4593 = !DILocation(line: 1956, column: 4, scope: !4414)
!4594 = !DILocation(line: 1958, column: 2, scope: !4410)
!4595 = !DILocation(line: 1961, column: 6, scope: !4596)
!4596 = distinct !DILexicalBlock(scope: !2069, file: !20, line: 1961, column: 6)
!4597 = !DILocation(line: 1961, column: 24, scope: !4596)
!4598 = !DILocation(line: 1962, column: 3, scope: !4599)
!4599 = distinct !DILexicalBlock(scope: !4596, file: !20, line: 1961, column: 30)
!4600 = !DILocation(line: 1962, column: 8, scope: !4599)
!4601 = !DILocation(line: 1962, column: 19, scope: !4599)
!4602 = !DILocation(line: 1963, column: 7, scope: !4603)
!4603 = distinct !DILexicalBlock(scope: !4599, file: !20, line: 1963, column: 7)
!4604 = !DILocation(line: 1963, column: 12, scope: !4603)
!4605 = !DILocation(line: 1963, column: 38, scope: !4603)
!4606 = !DILocation(line: 1963, column: 43, scope: !4603)
!4607 = !DILocation(line: 1963, column: 27, scope: !4603)
!4608 = !DILocation(line: 1963, column: 47, scope: !4603)
!4609 = !DILocation(line: 1963, column: 24, scope: !4603)
!4610 = !DILocation(line: 1964, column: 9, scope: !4611)
!4611 = distinct !DILexicalBlock(scope: !4603, file: !20, line: 1964, column: 8)
!4612 = !DILocation(line: 1964, column: 17, scope: !4611)
!4613 = !DILocation(line: 1964, column: 24, scope: !4611)
!4614 = !DILocation(line: 1964, column: 30, scope: !4611)
!4615 = !DILocation(line: 1964, column: 34, scope: !4611)
!4616 = !DILocation(line: 1964, column: 42, scope: !4611)
!4617 = !DILocation(line: 1964, column: 55, scope: !4611)
!4618 = !DILocation(line: 1965, column: 5, scope: !4611)
!4619 = !DILocation(line: 1965, column: 10, scope: !4611)
!4620 = !DILocation(line: 1965, column: 22, scope: !4611)
!4621 = !DILocation(line: 1967, column: 5, scope: !4611)
!4622 = !DILocation(line: 1967, column: 10, scope: !4611)
!4623 = !DILocation(line: 1967, column: 22, scope: !4611)
!4624 = !DILocation(line: 1964, column: 60, scope: !4611)
!4625 = !DILocation(line: 1968, column: 2, scope: !4599)
!4626 = !DILocation(line: 1970, column: 1, scope: !2069)
!4627 = distinct !DISubprogram(name: "fixmul", linkageName: "_Z6fixmulii", scope: !37, file: !37, line: 83, type: !4628, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1670)
!4628 = !DISubroutineType(types: !4629)
!4629 = !{!36, !36, !36}
!4630 = !DILocalVariable(name: "a", arg: 1, scope: !4627, file: !37, line: 83, type: !36)
!4631 = !DILocation(line: 83, column: 26, scope: !4627)
!4632 = !DILocalVariable(name: "b", arg: 2, scope: !4627, file: !37, line: 83, type: !36)
!4633 = !DILocation(line: 83, column: 33, scope: !4627)
!4634 = !DILocation(line: 85, column: 19, scope: !4627)
!4635 = !DILocation(line: 85, column: 32, scope: !4627)
!4636 = !DILocation(line: 85, column: 21, scope: !4627)
!4637 = !DILocation(line: 85, column: 35, scope: !4627)
!4638 = !DILocation(line: 85, column: 9, scope: !4627)
!4639 = !DILocation(line: 85, column: 2, scope: !4627)
!4640 = distinct !DISubprogram(name: "add_awareness_event", linkageName: "_Z19add_awareness_eventP6objecti", scope: !20, file: !20, line: 1991, type: !4641, scopeLine: 1992, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1670)
!4641 = !DISubroutineType(types: !4642)
!4642 = !{!7, !1891, !7}
!4643 = !DILocalVariable(name: "objp", arg: 1, scope: !4640, file: !20, line: 1991, type: !1891)
!4644 = !DILocation(line: 1991, column: 33, scope: !4640)
!4645 = !DILocalVariable(name: "type", arg: 2, scope: !4640, file: !20, line: 1991, type: !7)
!4646 = !DILocation(line: 1991, column: 43, scope: !4640)
!4647 = !DILocation(line: 2011, column: 7, scope: !4648)
!4648 = distinct !DILexicalBlock(scope: !4640, file: !20, line: 2011, column: 6)
!4649 = !DILocation(line: 2011, column: 12, scope: !4648)
!4650 = !DILocation(line: 2011, column: 42, scope: !4648)
!4651 = !DILocation(line: 2011, column: 46, scope: !4648)
!4652 = !DILocation(line: 2011, column: 51, scope: !4648)
!4653 = !DILocation(line: 2011, column: 80, scope: !4648)
!4654 = !DILocation(line: 2011, column: 84, scope: !4648)
!4655 = !DILocation(line: 2011, column: 89, scope: !4648)
!4656 = !DILocation(line: 2012, column: 3, scope: !4648)
!4657 = !DILocation(line: 2014, column: 6, scope: !4658)
!4658 = distinct !DILexicalBlock(scope: !4640, file: !20, line: 2014, column: 6)
!4659 = !DILocation(line: 2014, column: 27, scope: !4658)
!4660 = !DILocation(line: 2015, column: 8, scope: !4661)
!4661 = distinct !DILexicalBlock(scope: !4662, file: !20, line: 2015, column: 7)
!4662 = distinct !DILexicalBlock(scope: !4658, file: !20, line: 2014, column: 51)
!4663 = !DILocation(line: 2015, column: 13, scope: !4661)
!4664 = !DILocation(line: 2015, column: 42, scope: !4661)
!4665 = !DILocation(line: 2015, column: 46, scope: !4661)
!4666 = !DILocation(line: 2015, column: 51, scope: !4661)
!4667 = !DILocation(line: 2016, column: 8, scope: !4668)
!4668 = distinct !DILexicalBlock(scope: !4661, file: !20, line: 2016, column: 8)
!4669 = !DILocation(line: 2016, column: 14, scope: !4668)
!4670 = !DILocation(line: 2016, column: 17, scope: !4668)
!4671 = !DILocation(line: 2017, column: 9, scope: !4672)
!4672 = distinct !DILexicalBlock(scope: !4668, file: !20, line: 2017, column: 9)
!4673 = !DILocation(line: 2017, column: 18, scope: !4672)
!4674 = !DILocation(line: 2018, column: 6, scope: !4672)
!4675 = !DILocation(line: 2017, column: 20, scope: !4672)
!4676 = !DILocation(line: 2016, column: 20, scope: !4668)
!4677 = !DILocation(line: 2020, column: 51, scope: !4662)
!4678 = !DILocation(line: 2020, column: 57, scope: !4662)
!4679 = !DILocation(line: 2020, column: 20, scope: !4662)
!4680 = !DILocation(line: 2020, column: 3, scope: !4662)
!4681 = !DILocation(line: 2020, column: 42, scope: !4662)
!4682 = !DILocation(line: 2020, column: 49, scope: !4662)
!4683 = !DILocation(line: 2021, column: 48, scope: !4662)
!4684 = !DILocation(line: 2021, column: 54, scope: !4662)
!4685 = !DILocation(line: 2021, column: 20, scope: !4662)
!4686 = !DILocation(line: 2021, column: 3, scope: !4662)
!4687 = !DILocation(line: 2021, column: 42, scope: !4662)
!4688 = !DILocation(line: 2021, column: 46, scope: !4662)
!4689 = !DILocation(line: 2022, column: 49, scope: !4662)
!4690 = !DILocation(line: 2022, column: 20, scope: !4662)
!4691 = !DILocation(line: 2022, column: 3, scope: !4662)
!4692 = !DILocation(line: 2022, column: 42, scope: !4662)
!4693 = !DILocation(line: 2022, column: 47, scope: !4662)
!4694 = !DILocation(line: 2023, column: 23, scope: !4662)
!4695 = !DILocation(line: 2024, column: 2, scope: !4662)
!4696 = !DILocation(line: 2029, column: 2, scope: !4640)
!4697 = !DILocation(line: 2032, column: 1, scope: !4640)
!4698 = distinct !DISubprogram(name: "create_awareness_event", linkageName: "_Z22create_awareness_eventP6objecti", scope: !20, file: !20, line: 2037, type: !4699, scopeLine: 2038, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1670)
!4699 = !DISubroutineType(types: !4700)
!4700 = !{null, !1891, !7}
!4701 = !DILocalVariable(name: "objp", arg: 1, scope: !4698, file: !20, line: 2037, type: !1891)
!4702 = !DILocation(line: 2037, column: 37, scope: !4698)
!4703 = !DILocalVariable(name: "type", arg: 2, scope: !4698, file: !20, line: 2037, type: !7)
!4704 = !DILocation(line: 2037, column: 47, scope: !4698)
!4705 = !DILocation(line: 2058, column: 8, scope: !4706)
!4706 = distinct !DILexicalBlock(scope: !4698, file: !20, line: 2058, column: 6)
!4707 = !DILocation(line: 2058, column: 18, scope: !4706)
!4708 = !DILocation(line: 2058, column: 7, scope: !4706)
!4709 = !DILocation(line: 2058, column: 30, scope: !4706)
!4710 = !DILocation(line: 2058, column: 34, scope: !4706)
!4711 = !DILocation(line: 2058, column: 44, scope: !4706)
!4712 = !DILocation(line: 2058, column: 33, scope: !4706)
!4713 = !DILocation(line: 2059, column: 27, scope: !4714)
!4714 = distinct !DILexicalBlock(scope: !4715, file: !20, line: 2059, column: 7)
!4715 = distinct !DILexicalBlock(scope: !4706, file: !20, line: 2058, column: 64)
!4716 = !DILocation(line: 2059, column: 33, scope: !4714)
!4717 = !DILocation(line: 2059, column: 7, scope: !4714)
!4718 = !DILocation(line: 2060, column: 10, scope: !4719)
!4719 = distinct !DILexicalBlock(scope: !4720, file: !20, line: 2060, column: 8)
!4720 = distinct !DILexicalBlock(scope: !4714, file: !20, line: 2059, column: 40)
!4721 = !DILocation(line: 2060, column: 22, scope: !4719)
!4722 = !DILocation(line: 2060, column: 27, scope: !4719)
!4723 = !DILocation(line: 2060, column: 19, scope: !4719)
!4724 = !DILocation(line: 2060, column: 33, scope: !4719)
!4725 = !DILocation(line: 2060, column: 40, scope: !4719)
!4726 = !DILocation(line: 2061, column: 22, scope: !4719)
!4727 = !DILocation(line: 2061, column: 5, scope: !4719)
!4728 = !DILocation(line: 2062, column: 8, scope: !4729)
!4729 = distinct !DILexicalBlock(scope: !4720, file: !20, line: 2062, column: 8)
!4730 = !DILocation(line: 2062, column: 26, scope: !4729)
!4731 = !DILocation(line: 2063, column: 23, scope: !4729)
!4732 = !DILocation(line: 2063, column: 5, scope: !4729)
!4733 = !DILocation(line: 2064, column: 3, scope: !4720)
!4734 = !DILocation(line: 2065, column: 2, scope: !4715)
!4735 = !DILocation(line: 2067, column: 1, scope: !4698)
!4736 = distinct !DISubprogram(name: "pae_aux", linkageName: "_Z7pae_auxiii", scope: !20, file: !20, line: 2070, type: !4737, scopeLine: 2071, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1670)
!4737 = !DISubroutineType(types: !4738)
!4738 = !{null, !7, !7, !7}
!4739 = !DILocalVariable(name: "segnum", arg: 1, scope: !4736, file: !20, line: 2070, type: !7)
!4740 = !DILocation(line: 2070, column: 18, scope: !4736)
!4741 = !DILocalVariable(name: "type", arg: 2, scope: !4736, file: !20, line: 2070, type: !7)
!4742 = !DILocation(line: 2070, column: 30, scope: !4736)
!4743 = !DILocalVariable(name: "level", arg: 3, scope: !4736, file: !20, line: 2070, type: !7)
!4744 = !DILocation(line: 2070, column: 40, scope: !4736)
!4745 = !DILocalVariable(name: "j", scope: !4736, file: !20, line: 2072, type: !7)
!4746 = !DILocation(line: 2072, column: 6, scope: !4736)
!4747 = !DILocation(line: 2074, column: 20, scope: !4748)
!4748 = distinct !DILexicalBlock(scope: !4736, file: !20, line: 2074, column: 6)
!4749 = !DILocation(line: 2074, column: 6, scope: !4748)
!4750 = !DILocation(line: 2074, column: 30, scope: !4748)
!4751 = !DILocation(line: 2074, column: 28, scope: !4748)
!4752 = !DILocation(line: 2075, column: 27, scope: !4748)
!4753 = !DILocation(line: 2075, column: 17, scope: !4748)
!4754 = !DILocation(line: 2075, column: 3, scope: !4748)
!4755 = !DILocation(line: 2075, column: 25, scope: !4748)
!4756 = !DILocation(line: 2078, column: 9, scope: !4757)
!4757 = distinct !DILexicalBlock(scope: !4736, file: !20, line: 2078, column: 2)
!4758 = !DILocation(line: 2078, column: 7, scope: !4757)
!4759 = !DILocation(line: 2078, column: 14, scope: !4760)
!4760 = distinct !DILexicalBlock(scope: !4757, file: !20, line: 2078, column: 2)
!4761 = !DILocation(line: 2078, column: 16, scope: !4760)
!4762 = !DILocation(line: 2078, column: 2, scope: !4757)
!4763 = !DILocation(line: 2079, column: 7, scope: !4764)
!4764 = distinct !DILexicalBlock(scope: !4760, file: !20, line: 2079, column: 7)
!4765 = !DILocation(line: 2080, column: 8, scope: !4766)
!4766 = distinct !DILexicalBlock(scope: !4764, file: !20, line: 2080, column: 8)
!4767 = !DILocation(line: 2080, column: 14, scope: !4766)
!4768 = !DILocation(line: 2081, column: 9, scope: !4769)
!4769 = distinct !DILexicalBlock(scope: !4766, file: !20, line: 2081, column: 9)
!4770 = !DILocation(line: 2081, column: 14, scope: !4769)
!4771 = !DILocation(line: 2082, column: 23, scope: !4769)
!4772 = !DILocation(line: 2082, column: 14, scope: !4769)
!4773 = !DILocation(line: 2082, column: 31, scope: !4769)
!4774 = !DILocation(line: 2082, column: 40, scope: !4769)
!4775 = !DILocation(line: 2082, column: 44, scope: !4769)
!4776 = !DILocation(line: 2082, column: 49, scope: !4769)
!4777 = !DILocation(line: 2082, column: 54, scope: !4769)
!4778 = !DILocation(line: 2082, column: 60, scope: !4769)
!4779 = !DILocation(line: 2082, column: 6, scope: !4769)
!4780 = !DILocation(line: 2084, column: 23, scope: !4769)
!4781 = !DILocation(line: 2084, column: 14, scope: !4769)
!4782 = !DILocation(line: 2084, column: 31, scope: !4769)
!4783 = !DILocation(line: 2084, column: 40, scope: !4769)
!4784 = !DILocation(line: 2084, column: 44, scope: !4769)
!4785 = !DILocation(line: 2084, column: 50, scope: !4769)
!4786 = !DILocation(line: 2084, column: 56, scope: !4769)
!4787 = !DILocation(line: 2084, column: 6, scope: !4769)
!4788 = !DILocation(line: 2081, column: 17, scope: !4769)
!4789 = !DILocation(line: 2080, column: 17, scope: !4766)
!4790 = !DILocation(line: 2078, column: 42, scope: !4760)
!4791 = !DILocation(line: 2078, column: 2, scope: !4760)
!4792 = distinct !{!4792, !4762, !4793, !1756}
!4793 = !DILocation(line: 2084, column: 59, scope: !4757)
!4794 = !DILocation(line: 2085, column: 1, scope: !4736)
!4795 = distinct !DISubprogram(name: "process_awareness_events", linkageName: "_Z24process_awareness_eventsv", scope: !20, file: !20, line: 2089, type: !948, scopeLine: 2090, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1670)
!4796 = !DILocalVariable(name: "i", scope: !4795, file: !20, line: 2091, type: !7)
!4797 = !DILocation(line: 2091, column: 6, scope: !4795)
!4798 = !DILocation(line: 2093, column: 8, scope: !4799)
!4799 = distinct !DILexicalBlock(scope: !4795, file: !20, line: 2093, column: 6)
!4800 = !DILocation(line: 2093, column: 18, scope: !4799)
!4801 = !DILocation(line: 2093, column: 7, scope: !4799)
!4802 = !DILocation(line: 2093, column: 30, scope: !4799)
!4803 = !DILocation(line: 2093, column: 34, scope: !4799)
!4804 = !DILocation(line: 2093, column: 44, scope: !4799)
!4805 = !DILocation(line: 2093, column: 33, scope: !4799)
!4806 = !DILocation(line: 2094, column: 56, scope: !4807)
!4807 = distinct !DILexicalBlock(scope: !4799, file: !20, line: 2093, column: 64)
!4808 = !DILocation(line: 2094, column: 78, scope: !4807)
!4809 = !DILocation(line: 2094, column: 55, scope: !4807)
!4810 = !DILocation(line: 2094, column: 53, scope: !4807)
!4811 = !DILocation(line: 2094, column: 3, scope: !4807)
!4812 = !DILocation(line: 2096, column: 10, scope: !4813)
!4813 = distinct !DILexicalBlock(scope: !4807, file: !20, line: 2096, column: 3)
!4814 = !DILocation(line: 2096, column: 8, scope: !4813)
!4815 = !DILocation(line: 2096, column: 15, scope: !4816)
!4816 = distinct !DILexicalBlock(scope: !4813, file: !20, line: 2096, column: 3)
!4817 = !DILocation(line: 2096, column: 19, scope: !4816)
!4818 = !DILocation(line: 2096, column: 17, scope: !4816)
!4819 = !DILocation(line: 2096, column: 3, scope: !4813)
!4820 = !DILocation(line: 2097, column: 29, scope: !4816)
!4821 = !DILocation(line: 2097, column: 12, scope: !4816)
!4822 = !DILocation(line: 2097, column: 32, scope: !4816)
!4823 = !DILocation(line: 2097, column: 57, scope: !4816)
!4824 = !DILocation(line: 2097, column: 40, scope: !4816)
!4825 = !DILocation(line: 2097, column: 60, scope: !4816)
!4826 = !DILocation(line: 2097, column: 4, scope: !4816)
!4827 = !DILocation(line: 2096, column: 42, scope: !4816)
!4828 = !DILocation(line: 2096, column: 3, scope: !4816)
!4829 = distinct !{!4829, !4819, !4830, !1756}
!4830 = !DILocation(line: 2097, column: 67, scope: !4813)
!4831 = !DILocation(line: 2099, column: 2, scope: !4807)
!4832 = !DILocation(line: 2101, column: 23, scope: !4795)
!4833 = !DILocation(line: 2102, column: 1, scope: !4795)
!4834 = distinct !DISubprogram(name: "set_player_awareness_all", linkageName: "_Z24set_player_awareness_allv", scope: !20, file: !20, line: 2105, type: !948, scopeLine: 2106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1670)
!4835 = !DILocalVariable(name: "i", scope: !4834, file: !20, line: 2107, type: !7)
!4836 = !DILocation(line: 2107, column: 6, scope: !4834)
!4837 = !DILocation(line: 2109, column: 2, scope: !4834)
!4838 = !DILocation(line: 2111, column: 9, scope: !4839)
!4839 = distinct !DILexicalBlock(scope: !4834, file: !20, line: 2111, column: 2)
!4840 = !DILocation(line: 2111, column: 7, scope: !4839)
!4841 = !DILocation(line: 2111, column: 14, scope: !4842)
!4842 = distinct !DILexicalBlock(scope: !4839, file: !20, line: 2111, column: 2)
!4843 = !DILocation(line: 2111, column: 19, scope: !4842)
!4844 = !DILocation(line: 2111, column: 16, scope: !4842)
!4845 = !DILocation(line: 2111, column: 2, scope: !4839)
!4846 = !DILocation(line: 2112, column: 15, scope: !4847)
!4847 = distinct !DILexicalBlock(scope: !4842, file: !20, line: 2112, column: 7)
!4848 = !DILocation(line: 2112, column: 7, scope: !4847)
!4849 = !DILocation(line: 2112, column: 18, scope: !4847)
!4850 = !DILocation(line: 2112, column: 31, scope: !4847)
!4851 = !DILocation(line: 2113, column: 30, scope: !4852)
!4852 = distinct !DILexicalBlock(scope: !4853, file: !20, line: 2113, column: 8)
!4853 = distinct !DILexicalBlock(scope: !4847, file: !20, line: 2112, column: 41)
!4854 = !DILocation(line: 2113, column: 22, scope: !4852)
!4855 = !DILocation(line: 2113, column: 33, scope: !4852)
!4856 = !DILocation(line: 2113, column: 8, scope: !4852)
!4857 = !DILocation(line: 2113, column: 57, scope: !4852)
!4858 = !DILocation(line: 2113, column: 43, scope: !4852)
!4859 = !DILocation(line: 2113, column: 60, scope: !4852)
!4860 = !DILocation(line: 2113, column: 41, scope: !4852)
!4861 = !DILocation(line: 2114, column: 68, scope: !4862)
!4862 = distinct !DILexicalBlock(scope: !4852, file: !20, line: 2113, column: 83)
!4863 = !DILocation(line: 2114, column: 60, scope: !4862)
!4864 = !DILocation(line: 2114, column: 71, scope: !4862)
!4865 = !DILocation(line: 2114, column: 46, scope: !4862)
!4866 = !DILocation(line: 2114, column: 19, scope: !4862)
!4867 = !DILocation(line: 2114, column: 5, scope: !4862)
!4868 = !DILocation(line: 2114, column: 22, scope: !4862)
!4869 = !DILocation(line: 2114, column: 44, scope: !4862)
!4870 = !DILocation(line: 2115, column: 19, scope: !4862)
!4871 = !DILocation(line: 2115, column: 5, scope: !4862)
!4872 = !DILocation(line: 2115, column: 22, scope: !4862)
!4873 = !DILocation(line: 2115, column: 44, scope: !4862)
!4874 = !DILocation(line: 2116, column: 4, scope: !4862)
!4875 = !DILocation(line: 2119, column: 30, scope: !4876)
!4876 = distinct !DILexicalBlock(scope: !4853, file: !20, line: 2119, column: 8)
!4877 = !DILocation(line: 2119, column: 22, scope: !4876)
!4878 = !DILocation(line: 2119, column: 33, scope: !4876)
!4879 = !DILocation(line: 2119, column: 8, scope: !4876)
!4880 = !DILocation(line: 2119, column: 57, scope: !4876)
!4881 = !DILocation(line: 2119, column: 43, scope: !4876)
!4882 = !DILocation(line: 2119, column: 60, scope: !4876)
!4883 = !DILocation(line: 2119, column: 41, scope: !4876)
!4884 = !DILocation(line: 2120, column: 13, scope: !4876)
!4885 = !DILocation(line: 2120, column: 5, scope: !4876)
!4886 = !DILocation(line: 2120, column: 16, scope: !4876)
!4887 = !DILocation(line: 2120, column: 30, scope: !4876)
!4888 = !DILocation(line: 2120, column: 40, scope: !4876)
!4889 = !DILocation(line: 2121, column: 3, scope: !4853)
!4890 = !DILocation(line: 2112, column: 34, scope: !4847)
!4891 = !DILocation(line: 2111, column: 42, scope: !4842)
!4892 = !DILocation(line: 2111, column: 2, scope: !4842)
!4893 = distinct !{!4893, !4845, !4894, !1756}
!4894 = !DILocation(line: 2121, column: 3, scope: !4839)
!4895 = !DILocation(line: 2122, column: 1, scope: !4834)
!4896 = distinct !DISubprogram(name: "force_dump_ai_objects_all", linkageName: "_Z25force_dump_ai_objects_allPKc", scope: !20, file: !20, line: 2132, type: !1577, scopeLine: 2133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1670)
!4897 = !DILocalVariable(name: "msg", arg: 1, scope: !4896, file: !20, line: 2132, type: !255)
!4898 = !DILocation(line: 2132, column: 44, scope: !4896)
!4899 = !DILocalVariable(name: "tsave", scope: !4896, file: !20, line: 2134, type: !7)
!4900 = !DILocation(line: 2134, column: 6, scope: !4896)
!4901 = !DILocation(line: 2136, column: 10, scope: !4896)
!4902 = !DILocation(line: 2136, column: 8, scope: !4896)
!4903 = !DILocation(line: 2138, column: 17, scope: !4896)
!4904 = !DILocation(line: 2140, column: 36, scope: !4896)
!4905 = !DILocation(line: 2140, column: 2, scope: !4896)
!4906 = !DILocation(line: 2142, column: 22, scope: !4896)
!4907 = !DILocation(line: 2144, column: 19, scope: !4896)
!4908 = !DILocation(line: 2144, column: 17, scope: !4896)
!4909 = !DILocation(line: 2145, column: 1, scope: !4896)
!4910 = distinct !DISubprogram(name: "turn_off_ai_dump", linkageName: "_Z16turn_off_ai_dumpv", scope: !20, file: !20, line: 2148, type: !948, scopeLine: 2149, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2)
!4911 = !DILocation(line: 2150, column: 6, scope: !4912)
!4912 = distinct !DILexicalBlock(scope: !4910, file: !20, line: 2150, column: 6)
!4913 = !DILocation(line: 2150, column: 19, scope: !4912)
!4914 = !DILocation(line: 2151, column: 10, scope: !4912)
!4915 = !DILocation(line: 2151, column: 3, scope: !4912)
!4916 = !DILocation(line: 2153, column: 15, scope: !4910)
!4917 = !DILocation(line: 2154, column: 1, scope: !4910)
!4918 = distinct !DISubprogram(name: "do_ai_frame_all", linkageName: "_Z15do_ai_frame_allv", scope: !20, file: !20, line: 2164, type: !948, scopeLine: 2165, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1670)
!4919 = !DILocation(line: 2170, column: 2, scope: !4918)
!4920 = !DILocation(line: 2172, column: 6, scope: !4921)
!4921 = distinct !DILexicalBlock(scope: !4918, file: !20, line: 2172, column: 6)
!4922 = !DILocation(line: 2172, column: 29, scope: !4921)
!4923 = !DILocation(line: 2174, column: 9, scope: !4924)
!4924 = distinct !DILexicalBlock(scope: !4925, file: !20, line: 2174, column: 7)
!4925 = distinct !DILexicalBlock(scope: !4921, file: !20, line: 2172, column: 36)
!4926 = !DILocation(line: 2174, column: 20, scope: !4924)
!4927 = !DILocation(line: 2174, column: 28, scope: !4924)
!4928 = !DILocation(line: 2174, column: 34, scope: !4924)
!4929 = !DILocation(line: 2174, column: 46, scope: !4924)
!4930 = !DILocation(line: 2174, column: 38, scope: !4924)
!4931 = !DILocation(line: 2174, column: 70, scope: !4924)
!4932 = !DILocation(line: 2174, column: 75, scope: !4924)
!4933 = !DILocalVariable(name: "i", scope: !4934, file: !20, line: 2175, type: !7)
!4934 = distinct !DILexicalBlock(scope: !4924, file: !20, line: 2174, column: 91)
!4935 = !DILocation(line: 2175, column: 8, scope: !4934)
!4936 = !DILocation(line: 2177, column: 27, scope: !4934)
!4937 = !DILocation(line: 2178, column: 11, scope: !4938)
!4938 = distinct !DILexicalBlock(scope: !4934, file: !20, line: 2178, column: 4)
!4939 = !DILocation(line: 2178, column: 9, scope: !4938)
!4940 = !DILocation(line: 2178, column: 16, scope: !4941)
!4941 = distinct !DILexicalBlock(scope: !4938, file: !20, line: 2178, column: 4)
!4942 = !DILocation(line: 2178, column: 21, scope: !4941)
!4943 = !DILocation(line: 2178, column: 18, scope: !4941)
!4944 = !DILocation(line: 2178, column: 4, scope: !4938)
!4945 = !DILocation(line: 2179, column: 17, scope: !4946)
!4946 = distinct !DILexicalBlock(scope: !4941, file: !20, line: 2179, column: 9)
!4947 = !DILocation(line: 2179, column: 9, scope: !4946)
!4948 = !DILocation(line: 2179, column: 20, scope: !4946)
!4949 = !DILocation(line: 2179, column: 25, scope: !4946)
!4950 = !DILocation(line: 2180, column: 14, scope: !4946)
!4951 = !DILocation(line: 2180, column: 6, scope: !4946)
!4952 = !DILocation(line: 2180, column: 17, scope: !4946)
!4953 = !DILocation(line: 2180, column: 31, scope: !4946)
!4954 = !DILocation(line: 2180, column: 41, scope: !4946)
!4955 = !DILocation(line: 2179, column: 28, scope: !4946)
!4956 = !DILocation(line: 2178, column: 44, scope: !4941)
!4957 = !DILocation(line: 2178, column: 4, scope: !4941)
!4958 = distinct !{!4958, !4944, !4959, !1756}
!4959 = !DILocation(line: 2180, column: 45, scope: !4938)
!4960 = !DILocation(line: 2181, column: 3, scope: !4934)
!4961 = !DILocation(line: 2182, column: 2, scope: !4925)
!4962 = !DILocation(line: 2185, column: 6, scope: !4963)
!4963 = distinct !DILexicalBlock(scope: !4918, file: !20, line: 2185, column: 6)
!4964 = !DILocalVariable(name: "i", scope: !4965, file: !20, line: 2186, type: !7)
!4965 = distinct !DILexicalBlock(scope: !4963, file: !20, line: 2185, column: 18)
!4966 = !DILocation(line: 2186, column: 7, scope: !4965)
!4967 = !DILocation(line: 2188, column: 10, scope: !4968)
!4968 = distinct !DILexicalBlock(scope: !4965, file: !20, line: 2188, column: 3)
!4969 = !DILocation(line: 2188, column: 8, scope: !4968)
!4970 = !DILocation(line: 2188, column: 15, scope: !4971)
!4971 = distinct !DILexicalBlock(scope: !4968, file: !20, line: 2188, column: 3)
!4972 = !DILocation(line: 2188, column: 20, scope: !4971)
!4973 = !DILocation(line: 2188, column: 17, scope: !4971)
!4974 = !DILocation(line: 2188, column: 3, scope: !4968)
!4975 = !DILocation(line: 2189, column: 16, scope: !4976)
!4976 = distinct !DILexicalBlock(scope: !4971, file: !20, line: 2189, column: 8)
!4977 = !DILocation(line: 2189, column: 8, scope: !4976)
!4978 = !DILocation(line: 2189, column: 19, scope: !4976)
!4979 = !DILocation(line: 2189, column: 24, scope: !4976)
!4980 = !DILocation(line: 2190, column: 28, scope: !4981)
!4981 = distinct !DILexicalBlock(scope: !4976, file: !20, line: 2190, column: 9)
!4982 = !DILocation(line: 2190, column: 20, scope: !4981)
!4983 = !DILocation(line: 2190, column: 31, scope: !4981)
!4984 = !DILocation(line: 2190, column: 9, scope: !4981)
!4985 = !DILocation(line: 2190, column: 35, scope: !4981)
!4986 = !DILocation(line: 2191, column: 35, scope: !4981)
!4987 = !DILocation(line: 2191, column: 27, scope: !4981)
!4988 = !DILocation(line: 2191, column: 6, scope: !4981)
!4989 = !DILocation(line: 2189, column: 27, scope: !4976)
!4990 = !DILocation(line: 2188, column: 43, scope: !4971)
!4991 = !DILocation(line: 2188, column: 3, scope: !4971)
!4992 = distinct !{!4992, !4974, !4993, !1756}
!4993 = !DILocation(line: 2191, column: 37, scope: !4968)
!4994 = !DILocation(line: 2192, column: 2, scope: !4965)
!4995 = !DILocation(line: 2193, column: 1, scope: !4918)
!4996 = distinct !DISubprogram(name: "init_robots_for_level", linkageName: "_Z21init_robots_for_levelv", scope: !20, file: !20, line: 2200, type: !948, scopeLine: 2201, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2)
!4997 = !DILocation(line: 2215, column: 20, scope: !4996)
!4998 = !DILocation(line: 2216, column: 21, scope: !4996)
!4999 = !DILocation(line: 2218, column: 15, scope: !4996)
!5000 = !DILocation(line: 2219, column: 24, scope: !4996)
!5001 = !DILocation(line: 2221, column: 41, scope: !4996)
!5002 = !DILocation(line: 2221, column: 37, scope: !4996)
!5003 = !DILocation(line: 2221, column: 59, scope: !4996)
!5004 = !DILocation(line: 2221, column: 35, scope: !4996)
!5005 = !DILocation(line: 2221, column: 24, scope: !4996)
!5006 = !DILocation(line: 2222, column: 24, scope: !4996)
!5007 = !DILocation(line: 2223, column: 1, scope: !4996)
!5008 = distinct !DISubprogram(name: "i2f", linkageName: "_Z3i2fi", scope: !37, file: !37, line: 49, type: !5009, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1670)
!5009 = !DISubroutineType(types: !5010)
!5010 = !{!36, !7}
!5011 = !DILocalVariable(name: "i", arg: 1, scope: !5008, file: !37, line: 49, type: !7)
!5012 = !DILocation(line: 49, column: 23, scope: !5008)
!5013 = !DILocation(line: 51, column: 9, scope: !5008)
!5014 = !DILocation(line: 51, column: 11, scope: !5008)
!5015 = !DILocation(line: 51, column: 2, scope: !5008)
!5016 = distinct !DISubprogram(name: "ai_save_state", linkageName: "_Z13ai_save_stateP7__sFILE", scope: !20, file: !20, line: 2227, type: !1468, scopeLine: 2228, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1670)
!5017 = !DILocalVariable(name: "fp", arg: 1, scope: !5016, file: !20, line: 2227, type: !353)
!5018 = !DILocation(line: 2227, column: 25, scope: !5016)
!5019 = !DILocalVariable(name: "i", scope: !5016, file: !20, line: 2271, type: !7)
!5020 = !DILocation(line: 2271, column: 6, scope: !5016)
!5021 = !DILocation(line: 2273, column: 17, scope: !5016)
!5022 = !DILocation(line: 2273, column: 21, scope: !5016)
!5023 = !DILocation(line: 2273, column: 2, scope: !5016)
!5024 = !DILocation(line: 2274, column: 17, scope: !5016)
!5025 = !DILocation(line: 2274, column: 21, scope: !5016)
!5026 = !DILocation(line: 2274, column: 2, scope: !5016)
!5027 = !DILocation(line: 2275, column: 9, scope: !5028)
!5028 = distinct !DILexicalBlock(scope: !5016, file: !20, line: 2275, column: 2)
!5029 = !DILocation(line: 2275, column: 7, scope: !5028)
!5030 = !DILocation(line: 2275, column: 14, scope: !5031)
!5031 = distinct !DILexicalBlock(scope: !5028, file: !20, line: 2275, column: 2)
!5032 = !DILocation(line: 2275, column: 16, scope: !5031)
!5033 = !DILocation(line: 2275, column: 2, scope: !5028)
!5034 = !DILocation(line: 2276, column: 34, scope: !5031)
!5035 = !DILocation(line: 2276, column: 20, scope: !5031)
!5036 = !DILocation(line: 2276, column: 38, scope: !5031)
!5037 = !DILocation(line: 2276, column: 3, scope: !5031)
!5038 = !DILocation(line: 2275, column: 32, scope: !5031)
!5039 = !DILocation(line: 2275, column: 2, scope: !5031)
!5040 = distinct !{!5040, !5033, !5041, !1756}
!5041 = !DILocation(line: 2276, column: 40, scope: !5028)
!5042 = !DILocation(line: 2277, column: 9, scope: !5043)
!5043 = distinct !DILexicalBlock(scope: !5016, file: !20, line: 2277, column: 2)
!5044 = !DILocation(line: 2277, column: 7, scope: !5043)
!5045 = !DILocation(line: 2277, column: 14, scope: !5046)
!5046 = distinct !DILexicalBlock(scope: !5043, file: !20, line: 2277, column: 2)
!5047 = !DILocation(line: 2277, column: 16, scope: !5046)
!5048 = !DILocation(line: 2277, column: 2, scope: !5043)
!5049 = !DILocation(line: 2278, column: 31, scope: !5046)
!5050 = !DILocation(line: 2278, column: 20, scope: !5046)
!5051 = !DILocation(line: 2278, column: 35, scope: !5046)
!5052 = !DILocation(line: 2278, column: 3, scope: !5046)
!5053 = !DILocation(line: 2277, column: 35, scope: !5046)
!5054 = !DILocation(line: 2277, column: 2, scope: !5046)
!5055 = distinct !{!5055, !5048, !5056, !1756}
!5056 = !DILocation(line: 2278, column: 37, scope: !5043)
!5057 = !DILocation(line: 2279, column: 9, scope: !5058)
!5058 = distinct !DILexicalBlock(scope: !5016, file: !20, line: 2279, column: 2)
!5059 = !DILocation(line: 2279, column: 7, scope: !5058)
!5060 = !DILocation(line: 2279, column: 14, scope: !5061)
!5061 = distinct !DILexicalBlock(scope: !5058, file: !20, line: 2279, column: 2)
!5062 = !DILocation(line: 2279, column: 16, scope: !5061)
!5063 = !DILocation(line: 2279, column: 2, scope: !5058)
!5064 = !DILocation(line: 2280, column: 35, scope: !5061)
!5065 = !DILocation(line: 2280, column: 21, scope: !5061)
!5066 = !DILocation(line: 2280, column: 39, scope: !5061)
!5067 = !DILocation(line: 2280, column: 3, scope: !5061)
!5068 = !DILocation(line: 2279, column: 38, scope: !5061)
!5069 = !DILocation(line: 2279, column: 2, scope: !5061)
!5070 = distinct !{!5070, !5063, !5071, !1756}
!5071 = !DILocation(line: 2280, column: 41, scope: !5058)
!5072 = !DILocation(line: 2282, column: 17, scope: !5016)
!5073 = !DILocation(line: 2282, column: 21, scope: !5016)
!5074 = !DILocation(line: 2282, column: 2, scope: !5016)
!5075 = !DILocation(line: 2283, column: 17, scope: !5016)
!5076 = !DILocation(line: 2283, column: 21, scope: !5016)
!5077 = !DILocation(line: 2283, column: 2, scope: !5016)
!5078 = !DILocation(line: 2284, column: 17, scope: !5016)
!5079 = !DILocation(line: 2284, column: 21, scope: !5016)
!5080 = !DILocation(line: 2284, column: 2, scope: !5016)
!5081 = !DILocation(line: 2285, column: 17, scope: !5016)
!5082 = !DILocation(line: 2285, column: 21, scope: !5016)
!5083 = !DILocation(line: 2285, column: 2, scope: !5016)
!5084 = !DILocation(line: 2286, column: 17, scope: !5016)
!5085 = !DILocation(line: 2286, column: 21, scope: !5016)
!5086 = !DILocation(line: 2286, column: 2, scope: !5016)
!5087 = !DILocation(line: 2287, column: 17, scope: !5016)
!5088 = !DILocation(line: 2287, column: 21, scope: !5016)
!5089 = !DILocation(line: 2287, column: 2, scope: !5016)
!5090 = !DILocation(line: 2288, column: 17, scope: !5016)
!5091 = !DILocation(line: 2288, column: 21, scope: !5016)
!5092 = !DILocation(line: 2288, column: 2, scope: !5016)
!5093 = !DILocation(line: 2289, column: 17, scope: !5016)
!5094 = !DILocation(line: 2289, column: 21, scope: !5016)
!5095 = !DILocation(line: 2289, column: 2, scope: !5016)
!5096 = !DILocation(line: 2290, column: 17, scope: !5016)
!5097 = !DILocation(line: 2290, column: 21, scope: !5016)
!5098 = !DILocation(line: 2290, column: 2, scope: !5016)
!5099 = !DILocation(line: 2291, column: 17, scope: !5016)
!5100 = !DILocation(line: 2291, column: 21, scope: !5016)
!5101 = !DILocation(line: 2291, column: 2, scope: !5016)
!5102 = !DILocation(line: 2292, column: 17, scope: !5016)
!5103 = !DILocation(line: 2292, column: 21, scope: !5016)
!5104 = !DILocation(line: 2292, column: 2, scope: !5016)
!5105 = !DILocation(line: 2293, column: 17, scope: !5016)
!5106 = !DILocation(line: 2293, column: 21, scope: !5016)
!5107 = !DILocation(line: 2293, column: 2, scope: !5016)
!5108 = !DILocation(line: 2295, column: 17, scope: !5016)
!5109 = !DILocation(line: 2295, column: 21, scope: !5016)
!5110 = !DILocation(line: 2295, column: 2, scope: !5016)
!5111 = !DILocation(line: 2296, column: 17, scope: !5016)
!5112 = !DILocation(line: 2296, column: 21, scope: !5016)
!5113 = !DILocation(line: 2296, column: 2, scope: !5016)
!5114 = !DILocation(line: 2297, column: 17, scope: !5016)
!5115 = !DILocation(line: 2297, column: 21, scope: !5016)
!5116 = !DILocation(line: 2297, column: 2, scope: !5016)
!5117 = !DILocation(line: 2298, column: 17, scope: !5016)
!5118 = !DILocation(line: 2298, column: 21, scope: !5016)
!5119 = !DILocation(line: 2298, column: 2, scope: !5016)
!5120 = !DILocation(line: 2299, column: 17, scope: !5016)
!5121 = !DILocation(line: 2299, column: 21, scope: !5016)
!5122 = !DILocation(line: 2299, column: 2, scope: !5016)
!5123 = !DILocation(line: 2300, column: 9, scope: !5124)
!5124 = distinct !DILexicalBlock(scope: !5016, file: !20, line: 2300, column: 2)
!5125 = !DILocation(line: 2300, column: 7, scope: !5124)
!5126 = !DILocation(line: 2300, column: 14, scope: !5127)
!5127 = distinct !DILexicalBlock(scope: !5124, file: !20, line: 2300, column: 2)
!5128 = !DILocation(line: 2300, column: 16, scope: !5127)
!5129 = !DILocation(line: 2300, column: 2, scope: !5124)
!5130 = !DILocation(line: 2301, column: 19, scope: !5127)
!5131 = !DILocation(line: 2301, column: 36, scope: !5127)
!5132 = !DILocation(line: 2301, column: 23, scope: !5127)
!5133 = !DILocation(line: 2301, column: 3, scope: !5127)
!5134 = !DILocation(line: 2300, column: 37, scope: !5127)
!5135 = !DILocation(line: 2300, column: 2, scope: !5127)
!5136 = distinct !{!5136, !5129, !5137, !1756}
!5137 = !DILocation(line: 2301, column: 38, scope: !5124)
!5138 = !DILocalVariable(name: "temp", scope: !5139, file: !20, line: 2304, type: !7)
!5139 = distinct !DILexicalBlock(scope: !5016, file: !20, line: 2303, column: 2)
!5140 = !DILocation(line: 2304, column: 7, scope: !5139)
!5141 = !DILocation(line: 2305, column: 10, scope: !5139)
!5142 = !DILocation(line: 2305, column: 30, scope: !5139)
!5143 = !DILocation(line: 2305, column: 8, scope: !5139)
!5144 = !DILocation(line: 2307, column: 18, scope: !5139)
!5145 = !DILocation(line: 2307, column: 22, scope: !5139)
!5146 = !DILocation(line: 2307, column: 3, scope: !5139)
!5147 = !DILocation(line: 2310, column: 17, scope: !5016)
!5148 = !DILocation(line: 2310, column: 21, scope: !5016)
!5149 = !DILocation(line: 2310, column: 2, scope: !5016)
!5150 = !DILocation(line: 2311, column: 17, scope: !5016)
!5151 = !DILocation(line: 2311, column: 21, scope: !5016)
!5152 = !DILocation(line: 2311, column: 2, scope: !5016)
!5153 = !DILocalVariable(name: "i", scope: !5154, file: !20, line: 2314, type: !7)
!5154 = distinct !DILexicalBlock(scope: !5016, file: !20, line: 2314, column: 2)
!5155 = !DILocation(line: 2314, column: 11, scope: !5154)
!5156 = !DILocation(line: 2314, column: 7, scope: !5154)
!5157 = !DILocation(line: 2314, column: 18, scope: !5158)
!5158 = distinct !DILexicalBlock(scope: !5154, file: !20, line: 2314, column: 2)
!5159 = !DILocation(line: 2314, column: 22, scope: !5158)
!5160 = !DILocation(line: 2314, column: 20, scope: !5158)
!5161 = !DILocation(line: 2314, column: 2, scope: !5154)
!5162 = !DILocation(line: 2316, column: 20, scope: !5163)
!5163 = distinct !DILexicalBlock(scope: !5158, file: !20, line: 2315, column: 2)
!5164 = !DILocation(line: 2316, column: 39, scope: !5163)
!5165 = !DILocation(line: 2316, column: 24, scope: !5163)
!5166 = !DILocation(line: 2316, column: 3, scope: !5163)
!5167 = !DILocation(line: 2317, column: 2, scope: !5163)
!5168 = !DILocation(line: 2314, column: 43, scope: !5158)
!5169 = !DILocation(line: 2314, column: 2, scope: !5158)
!5170 = distinct !{!5170, !5161, !5171, !1756}
!5171 = !DILocation(line: 2317, column: 2, scope: !5154)
!5172 = !DILocalVariable(name: "i", scope: !5173, file: !20, line: 2318, type: !7)
!5173 = distinct !DILexicalBlock(scope: !5016, file: !20, line: 2318, column: 2)
!5174 = !DILocation(line: 2318, column: 11, scope: !5173)
!5175 = !DILocation(line: 2318, column: 7, scope: !5173)
!5176 = !DILocation(line: 2318, column: 18, scope: !5177)
!5177 = distinct !DILexicalBlock(scope: !5173, file: !20, line: 2318, column: 2)
!5178 = !DILocation(line: 2318, column: 22, scope: !5177)
!5179 = !DILocation(line: 2318, column: 20, scope: !5177)
!5180 = !DILocation(line: 2318, column: 2, scope: !5173)
!5181 = !DILocation(line: 2320, column: 20, scope: !5182)
!5182 = distinct !DILexicalBlock(scope: !5177, file: !20, line: 2319, column: 2)
!5183 = !DILocation(line: 2320, column: 43, scope: !5182)
!5184 = !DILocation(line: 2320, column: 24, scope: !5182)
!5185 = !DILocation(line: 2320, column: 3, scope: !5182)
!5186 = !DILocation(line: 2321, column: 2, scope: !5182)
!5187 = !DILocation(line: 2318, column: 47, scope: !5177)
!5188 = !DILocation(line: 2318, column: 2, scope: !5177)
!5189 = distinct !{!5189, !5180, !5190, !1756}
!5190 = !DILocation(line: 2321, column: 2, scope: !5173)
!5191 = !DILocation(line: 2327, column: 2, scope: !5016)
!5192 = distinct !DISubprogram(name: "ai_restore_state", linkageName: "_Z16ai_restore_stateP7__sFILEi", scope: !20, file: !20, line: 2330, type: !690, scopeLine: 2331, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1670)
!5193 = !DILocalVariable(name: "fp", arg: 1, scope: !5192, file: !20, line: 2330, type: !353)
!5194 = !DILocation(line: 2330, column: 28, scope: !5192)
!5195 = !DILocalVariable(name: "version", arg: 2, scope: !5192, file: !20, line: 2330, type: !7)
!5196 = !DILocation(line: 2330, column: 36, scope: !5192)
!5197 = !DILocalVariable(name: "i", scope: !5192, file: !20, line: 2332, type: !7)
!5198 = !DILocation(line: 2332, column: 6, scope: !5192)
!5199 = !DILocation(line: 2333, column: 33, scope: !5192)
!5200 = !DILocation(line: 2333, column: 19, scope: !5192)
!5201 = !DILocation(line: 2333, column: 17, scope: !5192)
!5202 = !DILocation(line: 2334, column: 36, scope: !5192)
!5203 = !DILocation(line: 2334, column: 22, scope: !5192)
!5204 = !DILocation(line: 2334, column: 20, scope: !5192)
!5205 = !DILocation(line: 2335, column: 9, scope: !5206)
!5206 = distinct !DILexicalBlock(scope: !5192, file: !20, line: 2335, column: 2)
!5207 = !DILocation(line: 2335, column: 7, scope: !5206)
!5208 = !DILocation(line: 2335, column: 14, scope: !5209)
!5209 = distinct !DILexicalBlock(scope: !5206, file: !20, line: 2335, column: 2)
!5210 = !DILocation(line: 2335, column: 16, scope: !5209)
!5211 = !DILocation(line: 2335, column: 2, scope: !5206)
!5212 = !DILocation(line: 2336, column: 33, scope: !5209)
!5213 = !DILocation(line: 2336, column: 19, scope: !5209)
!5214 = !DILocation(line: 2336, column: 37, scope: !5209)
!5215 = !DILocation(line: 2336, column: 3, scope: !5209)
!5216 = !DILocation(line: 2335, column: 32, scope: !5209)
!5217 = !DILocation(line: 2335, column: 2, scope: !5209)
!5218 = distinct !{!5218, !5211, !5219, !1756}
!5219 = !DILocation(line: 2336, column: 39, scope: !5206)
!5220 = !DILocation(line: 2337, column: 9, scope: !5221)
!5221 = distinct !DILexicalBlock(scope: !5192, file: !20, line: 2337, column: 2)
!5222 = !DILocation(line: 2337, column: 7, scope: !5221)
!5223 = !DILocation(line: 2337, column: 14, scope: !5224)
!5224 = distinct !DILexicalBlock(scope: !5221, file: !20, line: 2337, column: 2)
!5225 = !DILocation(line: 2337, column: 16, scope: !5224)
!5226 = !DILocation(line: 2337, column: 2, scope: !5221)
!5227 = !DILocation(line: 2338, column: 30, scope: !5224)
!5228 = !DILocation(line: 2338, column: 19, scope: !5224)
!5229 = !DILocation(line: 2338, column: 34, scope: !5224)
!5230 = !DILocation(line: 2338, column: 3, scope: !5224)
!5231 = !DILocation(line: 2337, column: 35, scope: !5224)
!5232 = !DILocation(line: 2337, column: 2, scope: !5224)
!5233 = distinct !{!5233, !5226, !5234, !1756}
!5234 = !DILocation(line: 2338, column: 36, scope: !5221)
!5235 = !DILocation(line: 2339, column: 9, scope: !5236)
!5236 = distinct !DILexicalBlock(scope: !5192, file: !20, line: 2339, column: 2)
!5237 = !DILocation(line: 2339, column: 7, scope: !5236)
!5238 = !DILocation(line: 2339, column: 14, scope: !5239)
!5239 = distinct !DILexicalBlock(scope: !5236, file: !20, line: 2339, column: 2)
!5240 = !DILocation(line: 2339, column: 16, scope: !5239)
!5241 = !DILocation(line: 2339, column: 2, scope: !5236)
!5242 = !DILocation(line: 2340, column: 34, scope: !5239)
!5243 = !DILocation(line: 2340, column: 20, scope: !5239)
!5244 = !DILocation(line: 2340, column: 38, scope: !5239)
!5245 = !DILocation(line: 2340, column: 3, scope: !5239)
!5246 = !DILocation(line: 2339, column: 38, scope: !5239)
!5247 = !DILocation(line: 2339, column: 2, scope: !5239)
!5248 = distinct !{!5248, !5241, !5249, !1756}
!5249 = !DILocation(line: 2340, column: 40, scope: !5236)
!5250 = !DILocation(line: 2342, column: 40, scope: !5192)
!5251 = !DILocation(line: 2342, column: 26, scope: !5192)
!5252 = !DILocation(line: 2342, column: 24, scope: !5192)
!5253 = !DILocation(line: 2343, column: 38, scope: !5192)
!5254 = !DILocation(line: 2343, column: 24, scope: !5192)
!5255 = !DILocation(line: 2343, column: 22, scope: !5192)
!5256 = !DILocation(line: 2344, column: 37, scope: !5192)
!5257 = !DILocation(line: 2344, column: 23, scope: !5192)
!5258 = !DILocation(line: 2344, column: 21, scope: !5192)
!5259 = !DILocation(line: 2345, column: 41, scope: !5192)
!5260 = !DILocation(line: 2345, column: 27, scope: !5192)
!5261 = !DILocation(line: 2345, column: 25, scope: !5192)
!5262 = !DILocation(line: 2346, column: 38, scope: !5192)
!5263 = !DILocation(line: 2346, column: 24, scope: !5192)
!5264 = !DILocation(line: 2346, column: 22, scope: !5192)
!5265 = !DILocation(line: 2347, column: 38, scope: !5192)
!5266 = !DILocation(line: 2347, column: 24, scope: !5192)
!5267 = !DILocation(line: 2347, column: 22, scope: !5192)
!5268 = !DILocation(line: 2348, column: 33, scope: !5192)
!5269 = !DILocation(line: 2348, column: 19, scope: !5192)
!5270 = !DILocation(line: 2348, column: 17, scope: !5192)
!5271 = !DILocation(line: 2349, column: 32, scope: !5192)
!5272 = !DILocation(line: 2349, column: 18, scope: !5192)
!5273 = !DILocation(line: 2349, column: 16, scope: !5192)
!5274 = !DILocation(line: 2350, column: 40, scope: !5192)
!5275 = !DILocation(line: 2350, column: 26, scope: !5192)
!5276 = !DILocation(line: 2350, column: 24, scope: !5192)
!5277 = !DILocation(line: 2351, column: 29, scope: !5192)
!5278 = !DILocation(line: 2351, column: 15, scope: !5192)
!5279 = !DILocation(line: 2351, column: 13, scope: !5192)
!5280 = !DILocation(line: 2352, column: 43, scope: !5192)
!5281 = !DILocation(line: 2352, column: 29, scope: !5192)
!5282 = !DILocation(line: 2352, column: 27, scope: !5192)
!5283 = !DILocation(line: 2353, column: 32, scope: !5192)
!5284 = !DILocation(line: 2353, column: 18, scope: !5192)
!5285 = !DILocation(line: 2353, column: 16, scope: !5192)
!5286 = !DILocation(line: 2355, column: 6, scope: !5287)
!5287 = distinct !DILexicalBlock(scope: !5192, file: !20, line: 2355, column: 6)
!5288 = !DILocation(line: 2355, column: 14, scope: !5287)
!5289 = !DILocation(line: 2357, column: 38, scope: !5290)
!5290 = distinct !DILexicalBlock(scope: !5287, file: !20, line: 2356, column: 2)
!5291 = !DILocation(line: 2357, column: 24, scope: !5290)
!5292 = !DILocation(line: 2357, column: 22, scope: !5290)
!5293 = !DILocation(line: 2358, column: 44, scope: !5290)
!5294 = !DILocation(line: 2358, column: 30, scope: !5290)
!5295 = !DILocation(line: 2358, column: 28, scope: !5290)
!5296 = !DILocation(line: 2359, column: 38, scope: !5290)
!5297 = !DILocation(line: 2359, column: 24, scope: !5290)
!5298 = !DILocation(line: 2359, column: 22, scope: !5290)
!5299 = !DILocation(line: 2360, column: 39, scope: !5290)
!5300 = !DILocation(line: 2360, column: 25, scope: !5290)
!5301 = !DILocation(line: 2360, column: 23, scope: !5290)
!5302 = !DILocation(line: 2361, column: 37, scope: !5290)
!5303 = !DILocation(line: 2361, column: 23, scope: !5290)
!5304 = !DILocation(line: 2361, column: 21, scope: !5290)
!5305 = !DILocation(line: 2362, column: 10, scope: !5306)
!5306 = distinct !DILexicalBlock(scope: !5290, file: !20, line: 2362, column: 3)
!5307 = !DILocation(line: 2362, column: 8, scope: !5306)
!5308 = !DILocation(line: 2362, column: 15, scope: !5309)
!5309 = distinct !DILexicalBlock(scope: !5306, file: !20, line: 2362, column: 3)
!5310 = !DILocation(line: 2362, column: 17, scope: !5309)
!5311 = !DILocation(line: 2362, column: 3, scope: !5306)
!5312 = !DILocation(line: 2363, column: 37, scope: !5309)
!5313 = !DILocation(line: 2363, column: 22, scope: !5309)
!5314 = !DILocation(line: 2363, column: 17, scope: !5309)
!5315 = !DILocation(line: 2363, column: 4, scope: !5309)
!5316 = !DILocation(line: 2363, column: 20, scope: !5309)
!5317 = !DILocation(line: 2362, column: 38, scope: !5309)
!5318 = !DILocation(line: 2362, column: 3, scope: !5309)
!5319 = distinct !{!5319, !5311, !5320, !1756}
!5320 = !DILocation(line: 2363, column: 39, scope: !5306)
!5321 = !DILocation(line: 2364, column: 2, scope: !5290)
!5322 = !DILocation(line: 2367, column: 22, scope: !5323)
!5323 = distinct !DILexicalBlock(scope: !5287, file: !20, line: 2366, column: 2)
!5324 = !DILocation(line: 2368, column: 28, scope: !5323)
!5325 = !DILocation(line: 2369, column: 22, scope: !5323)
!5326 = !DILocation(line: 2370, column: 23, scope: !5323)
!5327 = !DILocation(line: 2371, column: 21, scope: !5323)
!5328 = !DILocation(line: 2373, column: 10, scope: !5329)
!5329 = distinct !DILexicalBlock(scope: !5323, file: !20, line: 2373, column: 3)
!5330 = !DILocation(line: 2373, column: 8, scope: !5329)
!5331 = !DILocation(line: 2373, column: 15, scope: !5332)
!5332 = distinct !DILexicalBlock(scope: !5329, file: !20, line: 2373, column: 3)
!5333 = !DILocation(line: 2373, column: 17, scope: !5332)
!5334 = !DILocation(line: 2373, column: 3, scope: !5329)
!5335 = !DILocation(line: 2374, column: 17, scope: !5332)
!5336 = !DILocation(line: 2374, column: 4, scope: !5332)
!5337 = !DILocation(line: 2374, column: 20, scope: !5332)
!5338 = !DILocation(line: 2373, column: 38, scope: !5332)
!5339 = !DILocation(line: 2373, column: 3, scope: !5332)
!5340 = distinct !{!5340, !5334, !5341, !1756}
!5341 = !DILocation(line: 2374, column: 22, scope: !5329)
!5342 = !DILocation(line: 2377, column: 6, scope: !5343)
!5343 = distinct !DILexicalBlock(scope: !5192, file: !20, line: 2377, column: 6)
!5344 = !DILocation(line: 2377, column: 14, scope: !5343)
!5345 = !DILocalVariable(name: "temp", scope: !5346, file: !20, line: 2379, type: !7)
!5346 = distinct !DILexicalBlock(scope: !5343, file: !20, line: 2378, column: 2)
!5347 = !DILocation(line: 2379, column: 7, scope: !5346)
!5348 = !DILocation(line: 2379, column: 28, scope: !5346)
!5349 = !DILocation(line: 2379, column: 14, scope: !5346)
!5350 = !DILocation(line: 2381, column: 37, scope: !5346)
!5351 = !DILocation(line: 2381, column: 26, scope: !5346)
!5352 = !DILocation(line: 2381, column: 23, scope: !5346)
!5353 = !DILocation(line: 2382, column: 2, scope: !5346)
!5354 = !DILocation(line: 2384, column: 3, scope: !5343)
!5355 = !DILocation(line: 2386, column: 6, scope: !5356)
!5356 = distinct !DILexicalBlock(scope: !5192, file: !20, line: 2386, column: 6)
!5357 = !DILocation(line: 2386, column: 14, scope: !5356)
!5358 = !DILocation(line: 2390, column: 42, scope: !5359)
!5359 = distinct !DILexicalBlock(scope: !5356, file: !20, line: 2387, column: 2)
!5360 = !DILocation(line: 2390, column: 28, scope: !5359)
!5361 = !DILocation(line: 2390, column: 26, scope: !5359)
!5362 = !DILocation(line: 2391, column: 38, scope: !5359)
!5363 = !DILocation(line: 2391, column: 24, scope: !5359)
!5364 = !DILocation(line: 2391, column: 22, scope: !5359)
!5365 = !DILocation(line: 2393, column: 7, scope: !5366)
!5366 = distinct !DILexicalBlock(scope: !5359, file: !20, line: 2393, column: 7)
!5367 = !DILocation(line: 2393, column: 30, scope: !5366)
!5368 = !DILocation(line: 2394, column: 4, scope: !5366)
!5369 = !DILocation(line: 2395, column: 7, scope: !5370)
!5370 = distinct !DILexicalBlock(scope: !5359, file: !20, line: 2395, column: 7)
!5371 = !DILocation(line: 2395, column: 26, scope: !5370)
!5372 = !DILocation(line: 2396, column: 4, scope: !5370)
!5373 = !DILocation(line: 2398, column: 7, scope: !5374)
!5374 = distinct !DILexicalBlock(scope: !5359, file: !20, line: 2398, column: 7)
!5375 = !DILocation(line: 2399, column: 11, scope: !5376)
!5376 = distinct !DILexicalBlock(scope: !5374, file: !20, line: 2399, column: 4)
!5377 = !DILocation(line: 2399, column: 9, scope: !5376)
!5378 = !DILocation(line: 2399, column: 16, scope: !5379)
!5379 = distinct !DILexicalBlock(scope: !5376, file: !20, line: 2399, column: 4)
!5380 = !DILocation(line: 2399, column: 20, scope: !5379)
!5381 = !DILocation(line: 2399, column: 18, scope: !5379)
!5382 = !DILocation(line: 2399, column: 4, scope: !5376)
!5383 = !DILocation(line: 2400, column: 41, scope: !5379)
!5384 = !DILocation(line: 2400, column: 25, scope: !5379)
!5385 = !DILocation(line: 2400, column: 20, scope: !5379)
!5386 = !DILocation(line: 2400, column: 5, scope: !5379)
!5387 = !DILocation(line: 2400, column: 23, scope: !5379)
!5388 = !DILocation(line: 2399, column: 41, scope: !5379)
!5389 = !DILocation(line: 2399, column: 4, scope: !5379)
!5390 = distinct !{!5390, !5382, !5391, !1756}
!5391 = !DILocation(line: 2400, column: 43, scope: !5376)
!5392 = !DILocation(line: 2403, column: 7, scope: !5393)
!5393 = distinct !DILexicalBlock(scope: !5359, file: !20, line: 2403, column: 7)
!5394 = !DILocation(line: 2404, column: 11, scope: !5395)
!5395 = distinct !DILexicalBlock(scope: !5393, file: !20, line: 2404, column: 4)
!5396 = !DILocation(line: 2404, column: 9, scope: !5395)
!5397 = !DILocation(line: 2404, column: 16, scope: !5398)
!5398 = distinct !DILexicalBlock(scope: !5395, file: !20, line: 2404, column: 4)
!5399 = !DILocation(line: 2404, column: 20, scope: !5398)
!5400 = !DILocation(line: 2404, column: 18, scope: !5398)
!5401 = !DILocation(line: 2404, column: 4, scope: !5395)
!5402 = !DILocation(line: 2405, column: 45, scope: !5398)
!5403 = !DILocation(line: 2405, column: 29, scope: !5398)
!5404 = !DILocation(line: 2405, column: 24, scope: !5398)
!5405 = !DILocation(line: 2405, column: 5, scope: !5398)
!5406 = !DILocation(line: 2405, column: 27, scope: !5398)
!5407 = !DILocation(line: 2404, column: 45, scope: !5398)
!5408 = !DILocation(line: 2404, column: 4, scope: !5398)
!5409 = distinct !{!5409, !5401, !5410, !1756}
!5410 = !DILocation(line: 2405, column: 47, scope: !5395)
!5411 = !DILocation(line: 2407, column: 2, scope: !5359)
!5412 = !DILocation(line: 2415, column: 3, scope: !5413)
!5413 = distinct !DILexicalBlock(scope: !5356, file: !20, line: 2409, column: 2)
!5414 = !DILocation(line: 2492, column: 2, scope: !5192)
