; ModuleID = '/Users/richard/code/ChocolateDescent/main_d2/gameseq.cpp'
source_filename = "/Users/richard/code/ChocolateDescent/main_d2/gameseq.cpp"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

%struct.player = type { [9 x i8], [4 x i8], i16, i8, i32, i32, i32, i32, i32, i32, i8, i8, i8, i8, i16, i16, i16, [10 x i16], [10 x i16], i16, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i16, i8, i8, i32, i8, i8 }
%struct.obj_position = type { %struct.vms_vector, %struct.vms_matrix, i16 }
%struct.vms_vector = type { i32, i32, i32 }
%struct.vms_matrix = type { %struct.vms_vector, %struct.vms_vector, %struct.vms_vector }
%struct.object = type { i32, i8, i8, i16, i16, i8, i8, i8, i8, i16, i16, %struct.vms_vector, %struct.vms_matrix, i32, i32, %struct.vms_vector, i8, i8, i8, i8, i32, %union.anon, %union.anon.0, %union.anon.1 }
%union.anon = type { %struct.physics_info }
%struct.physics_info = type { %struct.vms_vector, %struct.vms_vector, i32, i32, i32, %struct.vms_vector, %struct.vms_vector, i16, i16 }
%union.anon.0 = type { %struct.ai_static }
%struct.ai_static = type { i8, [11 x i8], i16, i16, i16, i8, i8, i16, i32, i32 }
%union.anon.1 = type { %struct.polyobj_info }
%struct.polyobj_info = type { i32, [10 x %struct.vms_angvec], i32, i32, i32 }
%struct.vms_angvec = type { i16, i16, i16 }
%struct.robot_info = type { i32, [8 x %struct.vms_vector], [8 x i8], i16, i16, i16, i16, i8, i8, i8, i8, i8, i8, i8, i8, i16, i8, i8, i32, i32, i32, i32, [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i8], [5 x i8], i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, [3 x i8], i8, i8, i8, i8, [9 x [5 x %struct.jointlist]], i32 }
%struct.jointlist = type { i16, i16 }
%struct.control_info = type { i32, i32, i32, i32, i32, i32, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8 }
%struct.segment = type { [6 x %struct.side], [6 x i16], [8 x i16], i32 }
%struct.side = type { i8, i8, i16, i16, i16, [4 x %struct.uvl], [2 x %struct.vms_vector] }
%struct.uvl = type { i32, i32, i32 }
%struct.tmap_info = type { i8, [3 x i8], i32, i32, i16, i16, i16, i16 }
%struct.eclip = type { %struct.vclip, i32, i32, i16, i16, i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.vclip = type { i32, i32, i32, i32, i16, [30 x %struct.bitmap_index], i32 }
%struct.bitmap_index = type { i16 }
%"class.std::__1::vector" = type { ptr, ptr, ptr }
%struct._grs_bitmap = type { i16, i16, i16, i16, i8, i8, i16, ptr, i16, i8, i8 }
%struct.powerup_type_info = type { i32, i32, i32, i32 }
%struct.anon = type { i32, [13 x i8] }
%struct.newmenu_item = type { i32, i32, i32, i32, i32, i32, ptr, i16, i16, i16, i16, i16, i8, [51 x i8] }
%struct.DiskBitmapHeader = type { [8 x i8], i8, i8, i8, i8, i8, i8, i32 }
%struct.vclip_info_s = type { i32, i32, i8 }

@Current_level_num = global i32 0, align 4, !dbg !0
@Next_level_num = global i32 0, align 4, !dbg !27
@Current_level_name = global [36 x i8] zeroinitializer, align 1, !dbg !30
@Last_level = global i32 0, align 4, !dbg !35
@Last_secret_level = global i32 0, align 4, !dbg !37
@N_players = global i32 1, align 4, !dbg !39
@Player_num = global i32 0, align 4, !dbg !41
@Players = global [12 x %struct.player] zeroinitializer, align 4, !dbg !43
@Player_init = global [8 x %struct.obj_position] zeroinitializer, align 4, !dbg !111
@MaxNumNetPlayers = global i32 -1, align 4, !dbg !136
@NumNetPlayerPositions = global i32 -1, align 4, !dbg !138
@Do_appearance_effect = global i32 0, align 4, !dbg !140
@First_secret_visit = global i32 1, align 4, !dbg !142
@.str = private unnamed_addr constant [16 x i8] c"Player_num > -1\00", align 1, !dbg !144
@.str.1 = private unnamed_addr constant [57 x i8] c"/Users/richard/code/ChocolateDescent/main_d2/gameseq.cpp\00", align 1, !dbg !150
@.str.2 = private unnamed_addr constant [32 x i8] c"Players[Player_num].objnum > -1\00", align 1, !dbg !155
@Objects = external global [0 x %struct.object], align 4
@ConsoleObject = external global ptr, align 8
@.str.3 = private unnamed_addr constant [34 x i8] c"ConsoleObject->type == OBJ_PLAYER\00", align 1, !dbg !160
@.str.4 = private unnamed_addr constant [32 x i8] c"ConsoleObject->id == Player_num\00", align 1, !dbg !165
@Highest_object_index = external global i32, align 4
@Game_mode = external global i32, align 4
@Robot_info = external global [0 x %struct.robot_info], align 4
@.str.5 = private unnamed_addr constant [52 x i8] c"--NOT ENOUGH MULTIPLAYER POSITIONS IN THIS MINE!--\0A\00", align 1, !dbg !167
@StartingShields = global i32 6553600, align 4, !dbg !172
@Difficulty_level = external global i32, align 4
@Player_is_dead = external global i32, align 4
@GameTime = external global i32, align 4
@Next_laser_fire_time = external global i32, align 4
@Last_laser_fired_time = external global i32, align 4
@Controls = external global %struct.control_info, align 4
@Last_afterburner_state = external global i8, align 1
@Missile_viewer = external global ptr, align 8
@Newdemo_state = external global i32, align 4
@Afterburner_charge = external global i32, align 4
@Primary_last_was_super = external global [10 x i8], align 1
@Secondary_last_was_super = external global [10 x i8], align 1
@Primary_weapon = external global i8, align 1
@Secondary_weapon = external global i8, align 1
@Current_mission_num = external global i32, align 4
@Function_mode = external global i32, align 4
@LeaveGame = external global [48 x i32], align 4
@FrameTime = external global i32, align 4
@Dont_start_sound_objects = external global i32, align 4
@Segments = external global [0 x %struct.segment], align 4
@Highest_segment_index = external global i32, align 4
@TmapInfo = external global [1200 x %struct.tmap_info], align 4
@Effects = external global [110 x %struct.eclip], align 4
@flash_dist = global i32 58982, align 4, !dbg !174
@Viewer = external global ptr, align 8
@Vclip = external global [110 x %struct.vclip], align 4
@playername_allowed_chars = global [11 x i8] c"azAZ09__--\00", align 1, !dbg !176
@Newmenu_allowed_chars = external global ptr, align 8
@Text_string = external global %"class.std::__1::vector", align 8
@.str.6 = private unnamed_addr constant [7 x i8] c"%s.plr\00", align 1, !dbg !181
@.str.7 = private unnamed_addr constant [3 x i8] c"rb\00", align 1, !dbg !186
@.str.8 = private unnamed_addr constant [11 x i8] c"%s '%s' %s\00", align 1, !dbg !191
@Config_joystick_sensitivity = external global i8, align 1
@Config_control_type = external global i8, align 1
@default_kconfig_settings = external global [8 x [60 x i8]], align 1
@kconfig_settings = external global [8 x [60 x i8]], align 1
@config_last_player = external global [9 x i8], align 1
@.str.9 = private unnamed_addr constant [6 x i8] c"*.plr\00", align 1, !dbg !194
@Default_leveling_on = external global i32, align 4
@Auto_leveling_on = external global i32, align 4
@Default_display_mode = external global i32, align 4
@Bitmap_replacement_data = global ptr null, align 8, !dbg !199
@.str.10 = private unnamed_addr constant [5 x i8] c".POG\00", align 1, !dbg !201
@.str.11 = private unnamed_addr constant [8 x i8] c"indices\00", align 1, !dbg !206
@.str.12 = private unnamed_addr constant [24 x i8] c"Bitmap_replacement_data\00", align 1, !dbg !209
@GameBitmaps = external global [2620 x %struct._grs_bitmap], align 8
@last_palette_loaded_pig = external global [0 x i8], align 1
@.str.13 = private unnamed_addr constant [76 x i8] c"level_num <= Last_level && level_num >= Last_secret_level && level_num != 0\00", align 1, !dbg !214
@Secret_level_names = external global [6 x [13 x i8]], align 1
@Level_names = external global [30 x [13 x i8]], align 1
@Last_msg_ycrd = external global i32, align 4
@gr_palette = external global [768 x i8], align 1
@.str.14 = private unnamed_addr constant [42 x i8] c"Couldn't load level file <%s>, error = %d\00", align 1, !dbg !219
@Current_level_palette = external global [13 x i8], align 1
@CurrentDataVersion = external global i32, align 4
@Robot_replacements_loaded = external global i32, align 4
@.str.15 = private unnamed_addr constant [44 x i8] c"Player_num >= 0 && Player_num < MAX_PLAYERS\00", align 1, !dbg !224
@.str.16 = private unnamed_addr constant [22 x i8] c"DoEndLevelScoreGlitz\0A\00", align 1, !dbg !229
@N_secret_levels = external global i32, align 4
@Cheats_enabled = external global i32, align 4
@.str.17 = private unnamed_addr constant [6 x i8] c"%s%i\0A\00", align 1, !dbg !234
@.str.18 = private unnamed_addr constant [21 x i8] c"adding bonus points\0A\00", align 1, !dbg !236
@.str.19 = private unnamed_addr constant [5 x i8] c"%s%i\00", align 1, !dbg !241
@.str.20 = private unnamed_addr constant [3 x i8] c"%s\00", align 1, !dbg !243
@.str.21 = private unnamed_addr constant [18 x i8] c"%s%s %d %s\0A %s %s\00", align 1, !dbg !245
@.str.22 = private unnamed_addr constant [4 x i8] c"\0A\0A\0A\00", align 1, !dbg !250
@.str.23 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1, !dbg !253
@.str.24 = private unnamed_addr constant [17 x i8] c"%s%s %d %s\0A%s %s\00", align 1, !dbg !258
@.str.25 = private unnamed_addr constant [18 x i8] c"c <= N_GLITZITEMS\00", align 1, !dbg !263
@.str.26 = private unnamed_addr constant [12 x i8] c"doing menu\0A\00", align 1, !dbg !265
@MenuHires = external global i32, align 4
@.str.27 = private unnamed_addr constant [11 x i8] c"starsb.pcx\00", align 1, !dbg !268
@.str.28 = private unnamed_addr constant [10 x i8] c"stars.pcx\00", align 1, !dbg !270
@.str.29 = private unnamed_addr constant [27 x i8] c"done DoEndLevelScoreGlitz\0A\00", align 1, !dbg !273
@.str.30 = private unnamed_addr constant [16 x i8] c"!Player_is_dead\00", align 1, !dbg !278
@Auto_fire_fusion_cannon_time = external global i32, align 4
@Fusion_charge = external global i32, align 4
@Robot_firing_enabled = external global i32, align 4
@.str.31 = private unnamed_addr constant [11 x i8] c"secret.sgc\00", align 1, !dbg !280
@ThisLevelTime = external global i32, align 4
@.str.32 = private unnamed_addr constant [2 x i8] c" \00", align 1, !dbg !282
@last_drawn_cockpit = external global i32, align 4
@FrameCount = external global i32, align 4
@.str.33 = private unnamed_addr constant [55 x i8] c"Secret level already destroyed.\0AAdvancing to level %i.\00", align 1, !dbg !284
@.str.34 = private unnamed_addr constant [31 x i8] c"Current_level_num == level_num\00", align 1, !dbg !289
@.str.35 = private unnamed_addr constant [28 x i8] c"Function_mode == FMODE_GAME\00", align 1, !dbg !294
@Game_suspended = external global i32, align 4
@Control_center_destroyed = external global i32, align 4
@Last_level_path_created = external global i32, align 4
@Entered_from_level = global i32 0, align 4, !dbg !299
@.str.36 = private unnamed_addr constant [11 x i8] c"secret.sgb\00", align 1, !dbg !301
@.str.37 = private unnamed_addr constant [24 x i8] c"!(Game_mode & GM_MULTI)\00", align 1, !dbg !303
@Secret_level_table = global [6 x i32] zeroinitializer, align 4, !dbg !331
@.str.38 = private unnamed_addr constant [13 x i8] c"!secret_flag\00", align 1, !dbg !305
@.str.39 = private unnamed_addr constant [11 x i8] c"DoEndGame\0A\00", align 1, !dbg !310
@.str.40 = private unnamed_addr constant [16 x i8] c"doing briefing\0A\00", align 1, !dbg !312
@.str.41 = private unnamed_addr constant [12 x i8] c"ending2.tex\00", align 1, !dbg !314
@.str.42 = private unnamed_addr constant [15 x i8] c"briefing done\0A\00", align 1, !dbg !316
@.str.43 = private unnamed_addr constant [8 x i8] c"end.tex\00", align 1, !dbg !321
@.str.44 = private unnamed_addr constant [4 x i8] c"end\00", align 1, !dbg !323
@.str.45 = private unnamed_addr constant [7 x i8] c"%s.tex\00", align 1, !dbg !325
@Current_mission_filename = external global ptr, align 8
@.str.46 = private unnamed_addr constant [7 x i8] c"%s.ctb\00", align 1, !dbg !327
@.str.47 = private unnamed_addr constant [12 x i8] c"default.256\00", align 1, !dbg !329
@.str.48 = private unnamed_addr constant [14 x i8] c"AdvanceLevel\0A\00", align 1, !dbg !334
@.str.49 = private unnamed_addr constant [22 x i8] c"Finished last level!\0A\00", align 1, !dbg !339
@.str.50 = private unnamed_addr constant [22 x i8] c"Returning to level %i\00", align 1, !dbg !341
@.str.51 = private unnamed_addr constant [22 x i8] c"Current_level_num < 0\00", align 1, !dbg !343
@.str.52 = private unnamed_addr constant [44 x i8] c"Base level destroyed.\0AAdvancing to level %i\00", align 1, !dbg !345
@BigWindowSwitch = external global i32, align 4
@.str.53 = private unnamed_addr constant [35 x i8] c"N_players <= NumNetPlayerPositions\00", align 1, !dbg !347
@.str.54 = private unnamed_addr constant [34 x i8] c"Bashing %s object #%i to shield.\0A\00", align 1, !dbg !352
@Powerup_info = external global [50 x %struct.powerup_type_info], align 4
@.str.55 = private unnamed_addr constant [25 x i8] c"Highest object index=%d\0A\00", align 1, !dbg !354
@.str.56 = private unnamed_addr constant [9 x i8] c"Flag!!!!\00", align 1, !dbg !359
@intro_movie = internal global [7 x %struct.anon] [%struct.anon { i32 1, [13 x i8] c"pla\00\00\00\00\00\00\00\00\00\00" }, %struct.anon { i32 5, [13 x i8] c"plb\00\00\00\00\00\00\00\00\00\00" }, %struct.anon { i32 9, [13 x i8] c"plc\00\00\00\00\00\00\00\00\00\00" }, %struct.anon { i32 13, [13 x i8] c"pld\00\00\00\00\00\00\00\00\00\00" }, %struct.anon { i32 17, [13 x i8] c"ple\00\00\00\00\00\00\00\00\00\00" }, %struct.anon { i32 21, [13 x i8] c"plf\00\00\00\00\00\00\00\00\00\00" }, %struct.anon { i32 24, [13 x i8] c"plg\00\00\00\00\00\00\00\00\00\00" }], align 4, !dbg !387
@.str.57 = private unnamed_addr constant [11 x i8] c"brief2.tex\00", align 1, !dbg !362
@robot_movies = external global i32, align 4
@MenuHiresAvailable = external global i32, align 4
@Screen_mode = external global i32, align 4
@.str.58 = private unnamed_addr constant [10 x i8] c"robot.tex\00", align 1, !dbg !364
@.str.59 = private unnamed_addr constant [60 x i8] c"Bashing First_secret_visit to 1 because entering level %i.\0A\00", align 1, !dbg !366
@.str.60 = private unnamed_addr constant [41 x i8] c"Starting position is not being changed.\0A\00", align 1, !dbg !371
@.str.61 = private unnamed_addr constant [15 x i8] c"NewPlayer >= 0\00", align 1, !dbg !376
@.str.62 = private unnamed_addr constant [34 x i8] c"NewPlayer < NumNetPlayerPositions\00", align 1, !dbg !378
@.str.63 = private unnamed_addr constant [24 x i8] c"objp->type == OBJ_ROBOT\00", align 1, !dbg !380
@N_robot_types = external global i32, align 4
@.str.64 = private unnamed_addr constant [22 x i8] c"objid < N_robot_types\00", align 1, !dbg !382

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z21verify_console_objectv() #0 !dbg !1682 {
  %1 = load i32, ptr @Player_num, align 4, !dbg !1683
  %2 = icmp sgt i32 %1, -1, !dbg !1683
  %3 = zext i1 %2 to i32, !dbg !1683
  call void @_Z7_AssertiPKcS0_i(i32 noundef %3, ptr noundef @.str, ptr noundef @.str.1, i32 noundef 207), !dbg !1683
  %4 = load i32, ptr @Player_num, align 4, !dbg !1684
  %5 = sext i32 %4 to i64, !dbg !1684
  %6 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %5, !dbg !1684
  %7 = getelementptr inbounds nuw %struct.player, ptr %6, i32 0, i32 4, !dbg !1684
  %8 = load i32, ptr %7, align 4, !dbg !1684
  %9 = icmp sgt i32 %8, -1, !dbg !1684
  %10 = zext i1 %9 to i32, !dbg !1684
  call void @_Z7_AssertiPKcS0_i(i32 noundef %10, ptr noundef @.str.2, ptr noundef @.str.1, i32 noundef 208), !dbg !1684
  %11 = load i32, ptr @Player_num, align 4, !dbg !1685
  %12 = sext i32 %11 to i64, !dbg !1686
  %13 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %12, !dbg !1686
  %14 = getelementptr inbounds nuw %struct.player, ptr %13, i32 0, i32 4, !dbg !1687
  %15 = load i32, ptr %14, align 4, !dbg !1687
  %16 = sext i32 %15 to i64, !dbg !1688
  %17 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %16, !dbg !1688
  store ptr %17, ptr @ConsoleObject, align 8, !dbg !1689
  %18 = load ptr, ptr @ConsoleObject, align 8, !dbg !1690
  %19 = getelementptr inbounds nuw %struct.object, ptr %18, i32 0, i32 1, !dbg !1690
  %20 = load i8, ptr %19, align 4, !dbg !1690
  %21 = zext i8 %20 to i32, !dbg !1690
  %22 = icmp eq i32 %21, 4, !dbg !1690
  %23 = zext i1 %22 to i32, !dbg !1690
  call void @_Z7_AssertiPKcS0_i(i32 noundef %23, ptr noundef @.str.3, ptr noundef @.str.1, i32 noundef 210), !dbg !1690
  %24 = load ptr, ptr @ConsoleObject, align 8, !dbg !1691
  %25 = getelementptr inbounds nuw %struct.object, ptr %24, i32 0, i32 2, !dbg !1691
  %26 = load i8, ptr %25, align 1, !dbg !1691
  %27 = zext i8 %26 to i32, !dbg !1691
  %28 = load i32, ptr @Player_num, align 4, !dbg !1691
  %29 = icmp eq i32 %27, %28, !dbg !1691
  %30 = zext i1 %29 to i32, !dbg !1691
  call void @_Z7_AssertiPKcS0_i(i32 noundef %30, ptr noundef @.str.4, ptr noundef @.str.1, i32 noundef 211), !dbg !1691
  ret void, !dbg !1692
}

declare void @_Z7_AssertiPKcS0_i(i32 noundef, ptr noundef, ptr noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define noundef i32 @_Z22count_number_of_robotsv() #2 !dbg !1693 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
    #dbg_declare(ptr %1, !1695, !DIExpression(), !1696)
    #dbg_declare(ptr %2, !1697, !DIExpression(), !1698)
  store i32 0, ptr %1, align 4, !dbg !1699
  store i32 0, ptr %2, align 4, !dbg !1700
  br label %3, !dbg !1702

3:                                                ; preds = %19, %0
  %4 = load i32, ptr %2, align 4, !dbg !1703
  %5 = load i32, ptr @Highest_object_index, align 4, !dbg !1705
  %6 = icmp sle i32 %4, %5, !dbg !1706
  br i1 %6, label %7, label %22, !dbg !1707

7:                                                ; preds = %3
  %8 = load i32, ptr %2, align 4, !dbg !1708
  %9 = sext i32 %8 to i64, !dbg !1711
  %10 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %9, !dbg !1711
  %11 = getelementptr inbounds nuw %struct.object, ptr %10, i32 0, i32 1, !dbg !1712
  %12 = load i8, ptr %11, align 4, !dbg !1712
  %13 = zext i8 %12 to i32, !dbg !1711
  %14 = icmp eq i32 %13, 2, !dbg !1713
  br i1 %14, label %15, label %18, !dbg !1713

15:                                               ; preds = %7
  %16 = load i32, ptr %1, align 4, !dbg !1714
  %17 = add nsw i32 %16, 1, !dbg !1714
  store i32 %17, ptr %1, align 4, !dbg !1714
  br label %18, !dbg !1715

18:                                               ; preds = %15, %7
  br label %19, !dbg !1716

19:                                               ; preds = %18
  %20 = load i32, ptr %2, align 4, !dbg !1717
  %21 = add nsw i32 %20, 1, !dbg !1717
  store i32 %21, ptr %2, align 4, !dbg !1717
  br label %3, !dbg !1718, !llvm.loop !1719

22:                                               ; preds = %3
  %23 = load i32, ptr %1, align 4, !dbg !1722
  ret i32 %23, !dbg !1723
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define noundef i32 @_Z24count_number_of_hostagesv() #2 !dbg !1724 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
    #dbg_declare(ptr %1, !1725, !DIExpression(), !1726)
    #dbg_declare(ptr %2, !1727, !DIExpression(), !1728)
  store i32 0, ptr %1, align 4, !dbg !1729
  store i32 0, ptr %2, align 4, !dbg !1730
  br label %3, !dbg !1732

3:                                                ; preds = %19, %0
  %4 = load i32, ptr %2, align 4, !dbg !1733
  %5 = load i32, ptr @Highest_object_index, align 4, !dbg !1735
  %6 = icmp sle i32 %4, %5, !dbg !1736
  br i1 %6, label %7, label %22, !dbg !1737

7:                                                ; preds = %3
  %8 = load i32, ptr %2, align 4, !dbg !1738
  %9 = sext i32 %8 to i64, !dbg !1741
  %10 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %9, !dbg !1741
  %11 = getelementptr inbounds nuw %struct.object, ptr %10, i32 0, i32 1, !dbg !1742
  %12 = load i8, ptr %11, align 4, !dbg !1742
  %13 = zext i8 %12 to i32, !dbg !1741
  %14 = icmp eq i32 %13, 3, !dbg !1743
  br i1 %14, label %15, label %18, !dbg !1743

15:                                               ; preds = %7
  %16 = load i32, ptr %1, align 4, !dbg !1744
  %17 = add nsw i32 %16, 1, !dbg !1744
  store i32 %17, ptr %1, align 4, !dbg !1744
  br label %18, !dbg !1745

18:                                               ; preds = %15, %7
  br label %19, !dbg !1746

19:                                               ; preds = %18
  %20 = load i32, ptr %2, align 4, !dbg !1747
  %21 = add nsw i32 %20, 1, !dbg !1747
  store i32 %21, ptr %2, align 4, !dbg !1747
  br label %3, !dbg !1748, !llvm.loop !1749

22:                                               ; preds = %3
  %23 = load i32, ptr %1, align 4, !dbg !1751
  ret i32 %23, !dbg !1752
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z28gameseq_init_network_playersv() #0 !dbg !1753 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
    #dbg_declare(ptr %1, !1754, !DIExpression(), !1755)
    #dbg_declare(ptr %2, !1756, !DIExpression(), !1757)
    #dbg_declare(ptr %3, !1758, !DIExpression(), !1759)
  store ptr @Objects, ptr @ConsoleObject, align 8, !dbg !1760
  store i32 0, ptr %2, align 4, !dbg !1761
  store i32 0, ptr %3, align 4, !dbg !1762
  store i32 0, ptr %1, align 4, !dbg !1763
  br label %4, !dbg !1765

4:                                                ; preds = %141, %0
  %5 = load i32, ptr %1, align 4, !dbg !1766
  %6 = load i32, ptr @Highest_object_index, align 4, !dbg !1768
  %7 = icmp sle i32 %5, %6, !dbg !1769
  br i1 %7, label %8, label %144, !dbg !1770

8:                                                ; preds = %4
  %9 = load i32, ptr %1, align 4, !dbg !1771
  %10 = sext i32 %9 to i64, !dbg !1774
  %11 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %10, !dbg !1774
  %12 = getelementptr inbounds nuw %struct.object, ptr %11, i32 0, i32 1, !dbg !1775
  %13 = load i8, ptr %12, align 4, !dbg !1775
  %14 = zext i8 %13 to i32, !dbg !1774
  %15 = icmp eq i32 %14, 4, !dbg !1776
  br i1 %15, label %32, label %16, !dbg !1777

16:                                               ; preds = %8
  %17 = load i32, ptr %1, align 4, !dbg !1778
  %18 = sext i32 %17 to i64, !dbg !1779
  %19 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %18, !dbg !1779
  %20 = getelementptr inbounds nuw %struct.object, ptr %19, i32 0, i32 1, !dbg !1780
  %21 = load i8, ptr %20, align 4, !dbg !1780
  %22 = zext i8 %21 to i32, !dbg !1779
  %23 = icmp eq i32 %22, 12, !dbg !1781
  br i1 %23, label %32, label %24, !dbg !1782

24:                                               ; preds = %16
  %25 = load i32, ptr %1, align 4, !dbg !1783
  %26 = sext i32 %25 to i64, !dbg !1784
  %27 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %26, !dbg !1784
  %28 = getelementptr inbounds nuw %struct.object, ptr %27, i32 0, i32 1, !dbg !1785
  %29 = load i8, ptr %28, align 4, !dbg !1785
  %30 = zext i8 %29 to i32, !dbg !1784
  %31 = icmp eq i32 %30, 14, !dbg !1786
  br i1 %31, label %32, label %115, !dbg !1782

32:                                               ; preds = %24, %16, %8
  %33 = load i32, ptr @Game_mode, align 4, !dbg !1787
  %34 = and i32 %33, 16, !dbg !1790
  %35 = icmp ne i32 %34, 0, !dbg !1791
  br i1 %35, label %52, label %36, !dbg !1792

36:                                               ; preds = %32
  %37 = load i32, ptr %1, align 4, !dbg !1793
  %38 = sext i32 %37 to i64, !dbg !1794
  %39 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %38, !dbg !1794
  %40 = getelementptr inbounds nuw %struct.object, ptr %39, i32 0, i32 1, !dbg !1795
  %41 = load i8, ptr %40, align 4, !dbg !1795
  %42 = zext i8 %41 to i32, !dbg !1794
  %43 = icmp eq i32 %42, 4, !dbg !1796
  br i1 %43, label %67, label %44, !dbg !1797

44:                                               ; preds = %36
  %45 = load i32, ptr %1, align 4, !dbg !1798
  %46 = sext i32 %45 to i64, !dbg !1799
  %47 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %46, !dbg !1799
  %48 = getelementptr inbounds nuw %struct.object, ptr %47, i32 0, i32 1, !dbg !1800
  %49 = load i8, ptr %48, align 4, !dbg !1800
  %50 = zext i8 %49 to i32, !dbg !1799
  %51 = icmp eq i32 %50, 12, !dbg !1801
  br i1 %51, label %67, label %52, !dbg !1802

52:                                               ; preds = %44, %32
  %53 = load i32, ptr @Game_mode, align 4, !dbg !1803
  %54 = and i32 %53, 16, !dbg !1804
  %55 = icmp ne i32 %54, 0, !dbg !1805
  br i1 %55, label %56, label %110, !dbg !1806

56:                                               ; preds = %52
  %57 = load i32, ptr %3, align 4, !dbg !1807
  %58 = icmp eq i32 %57, 0, !dbg !1808
  br i1 %58, label %67, label %59, !dbg !1809

59:                                               ; preds = %56
  %60 = load i32, ptr %1, align 4, !dbg !1810
  %61 = sext i32 %60 to i64, !dbg !1811
  %62 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %61, !dbg !1811
  %63 = getelementptr inbounds nuw %struct.object, ptr %62, i32 0, i32 1, !dbg !1812
  %64 = load i8, ptr %63, align 4, !dbg !1812
  %65 = zext i8 %64 to i32, !dbg !1811
  %66 = icmp eq i32 %65, 14, !dbg !1813
  br i1 %66, label %67, label %110, !dbg !1802

67:                                               ; preds = %59, %56, %44, %36
  %68 = load i32, ptr %1, align 4, !dbg !1814
  %69 = sext i32 %68 to i64, !dbg !1816
  %70 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %69, !dbg !1816
  %71 = getelementptr inbounds nuw %struct.object, ptr %70, i32 0, i32 1, !dbg !1817
  store i8 4, ptr %71, align 4, !dbg !1818
  %72 = load i32, ptr %1, align 4, !dbg !1819
  %73 = sext i32 %72 to i64, !dbg !1820
  %74 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %73, !dbg !1820
  %75 = getelementptr inbounds nuw %struct.object, ptr %74, i32 0, i32 11, !dbg !1821
  %76 = load i32, ptr %2, align 4, !dbg !1822
  %77 = sext i32 %76 to i64, !dbg !1823
  %78 = getelementptr inbounds [8 x %struct.obj_position], ptr @Player_init, i64 0, i64 %77, !dbg !1823
  %79 = getelementptr inbounds nuw %struct.obj_position, ptr %78, i32 0, i32 0, !dbg !1824
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %79, ptr align 4 %75, i64 12, i1 false), !dbg !1825
  %80 = load i32, ptr %1, align 4, !dbg !1826
  %81 = sext i32 %80 to i64, !dbg !1827
  %82 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %81, !dbg !1827
  %83 = getelementptr inbounds nuw %struct.object, ptr %82, i32 0, i32 12, !dbg !1828
  %84 = load i32, ptr %2, align 4, !dbg !1829
  %85 = sext i32 %84 to i64, !dbg !1830
  %86 = getelementptr inbounds [8 x %struct.obj_position], ptr @Player_init, i64 0, i64 %85, !dbg !1830
  %87 = getelementptr inbounds nuw %struct.obj_position, ptr %86, i32 0, i32 1, !dbg !1831
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %87, ptr align 4 %83, i64 36, i1 false), !dbg !1832
  %88 = load i32, ptr %1, align 4, !dbg !1833
  %89 = sext i32 %88 to i64, !dbg !1834
  %90 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %89, !dbg !1834
  %91 = getelementptr inbounds nuw %struct.object, ptr %90, i32 0, i32 9, !dbg !1835
  %92 = load i16, ptr %91, align 2, !dbg !1835
  %93 = load i32, ptr %2, align 4, !dbg !1836
  %94 = sext i32 %93 to i64, !dbg !1837
  %95 = getelementptr inbounds [8 x %struct.obj_position], ptr @Player_init, i64 0, i64 %94, !dbg !1837
  %96 = getelementptr inbounds nuw %struct.obj_position, ptr %95, i32 0, i32 2, !dbg !1838
  store i16 %92, ptr %96, align 4, !dbg !1839
  %97 = load i32, ptr %1, align 4, !dbg !1840
  %98 = load i32, ptr %2, align 4, !dbg !1841
  %99 = sext i32 %98 to i64, !dbg !1842
  %100 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %99, !dbg !1842
  %101 = getelementptr inbounds nuw %struct.player, ptr %100, i32 0, i32 4, !dbg !1843
  store i32 %97, ptr %101, align 4, !dbg !1844
  %102 = load i32, ptr %2, align 4, !dbg !1845
  %103 = trunc i32 %102 to i8, !dbg !1845
  %104 = load i32, ptr %1, align 4, !dbg !1846
  %105 = sext i32 %104 to i64, !dbg !1847
  %106 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %105, !dbg !1847
  %107 = getelementptr inbounds nuw %struct.object, ptr %106, i32 0, i32 2, !dbg !1848
  store i8 %103, ptr %107, align 1, !dbg !1849
  %108 = load i32, ptr %2, align 4, !dbg !1850
  %109 = add nsw i32 %108, 1, !dbg !1850
  store i32 %109, ptr %2, align 4, !dbg !1850
  br label %112, !dbg !1851

110:                                              ; preds = %59, %52
  %111 = load i32, ptr %1, align 4, !dbg !1852
  call void @_Z10obj_deletei(i32 noundef %111), !dbg !1853
  br label %112

112:                                              ; preds = %110, %67
  %113 = load i32, ptr %3, align 4, !dbg !1854
  %114 = add nsw i32 %113, 1, !dbg !1854
  store i32 %114, ptr %3, align 4, !dbg !1854
  br label %115, !dbg !1855

115:                                              ; preds = %112, %24
  %116 = load i32, ptr %1, align 4, !dbg !1856
  %117 = sext i32 %116 to i64, !dbg !1858
  %118 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %117, !dbg !1858
  %119 = getelementptr inbounds nuw %struct.object, ptr %118, i32 0, i32 1, !dbg !1859
  %120 = load i8, ptr %119, align 4, !dbg !1859
  %121 = zext i8 %120 to i32, !dbg !1858
  %122 = icmp eq i32 %121, 2, !dbg !1860
  br i1 %122, label %123, label %140, !dbg !1861

123:                                              ; preds = %115
  %124 = load i32, ptr %1, align 4, !dbg !1862
  %125 = sext i32 %124 to i64, !dbg !1863
  %126 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %125, !dbg !1863
  %127 = getelementptr inbounds nuw %struct.object, ptr %126, i32 0, i32 2, !dbg !1864
  %128 = load i8, ptr %127, align 1, !dbg !1864
  %129 = zext i8 %128 to i64, !dbg !1865
  %130 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %129, !dbg !1865
  %131 = getelementptr inbounds nuw %struct.robot_info, ptr %130, i32 0, i32 37, !dbg !1866
  %132 = load i8, ptr %131, align 1, !dbg !1866
  %133 = icmp ne i8 %132, 0, !dbg !1867
  br i1 %133, label %134, label %140, !dbg !1868

134:                                              ; preds = %123
  %135 = load i32, ptr @Game_mode, align 4, !dbg !1869
  %136 = and i32 %135, 38, !dbg !1870
  %137 = icmp ne i32 %136, 0, !dbg !1871
  br i1 %137, label %138, label %140, !dbg !1868

138:                                              ; preds = %134
  %139 = load i32, ptr %1, align 4, !dbg !1872
  call void @_Z10obj_deletei(i32 noundef %139), !dbg !1873
  br label %140, !dbg !1873

140:                                              ; preds = %138, %134, %123, %115
  br label %141, !dbg !1874

141:                                              ; preds = %140
  %142 = load i32, ptr %1, align 4, !dbg !1875
  %143 = add nsw i32 %142, 1, !dbg !1875
  store i32 %143, ptr %1, align 4, !dbg !1875
  br label %4, !dbg !1876, !llvm.loop !1877

144:                                              ; preds = %4
  %145 = load i32, ptr %2, align 4, !dbg !1879
  store i32 %145, ptr @NumNetPlayerPositions, align 4, !dbg !1880
  %146 = load i32, ptr @Game_mode, align 4, !dbg !1881
  %147 = and i32 %146, 16, !dbg !1883
  %148 = icmp ne i32 %147, 0, !dbg !1884
  br i1 %148, label %149, label %152, !dbg !1885

149:                                              ; preds = %144
  %150 = load i32, ptr @NumNetPlayerPositions, align 4, !dbg !1886
  %151 = icmp ne i32 %150, 4, !dbg !1887
  br i1 %151, label %159, label %152, !dbg !1888

152:                                              ; preds = %149, %144
  %153 = load i32, ptr @Game_mode, align 4, !dbg !1889
  %154 = and i32 %153, 16, !dbg !1890
  %155 = icmp ne i32 %154, 0, !dbg !1891
  br i1 %155, label %160, label %156, !dbg !1892

156:                                              ; preds = %152
  %157 = load i32, ptr @NumNetPlayerPositions, align 4, !dbg !1893
  %158 = icmp ne i32 %157, 8, !dbg !1894
  br i1 %158, label %159, label %160, !dbg !1888

159:                                              ; preds = %156, %149
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 1, ptr noundef @.str.5), !dbg !1895
  br label %160, !dbg !1897

160:                                              ; preds = %159, %156, %152
  ret void, !dbg !1898
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

declare void @_Z10obj_deletei(i32 noundef) #1

declare void @_Z8_mprintfiPKcz(i32 noundef, ptr noundef, ...) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z29gameseq_remove_unused_playersv() #0 !dbg !1899 {
  %1 = alloca i32, align 4
    #dbg_declare(ptr %1, !1900, !DIExpression(), !1901)
  store i32 1, ptr %1, align 4, !dbg !1902
  br label %2, !dbg !1905

2:                                                ; preds = %12, %0
  %3 = load i32, ptr %1, align 4, !dbg !1906
  %4 = load i32, ptr @NumNetPlayerPositions, align 4, !dbg !1908
  %5 = icmp slt i32 %3, %4, !dbg !1909
  br i1 %5, label %6, label %15, !dbg !1910

6:                                                ; preds = %2
  %7 = load i32, ptr %1, align 4, !dbg !1911
  %8 = sext i32 %7 to i64, !dbg !1913
  %9 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %8, !dbg !1913
  %10 = getelementptr inbounds nuw %struct.player, ptr %9, i32 0, i32 4, !dbg !1914
  %11 = load i32, ptr %10, align 4, !dbg !1914
  call void @_Z10obj_deletei(i32 noundef %11), !dbg !1915
  br label %12, !dbg !1916

12:                                               ; preds = %6
  %13 = load i32, ptr %1, align 4, !dbg !1917
  %14 = add nsw i32 %13, 1, !dbg !1917
  store i32 %14, ptr %1, align 4, !dbg !1917
  br label %2, !dbg !1918, !llvm.loop !1919

15:                                               ; preds = %2
  ret void, !dbg !1921
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z22init_player_stats_gamev() #0 !dbg !1922 {
  %1 = load i32, ptr @Player_num, align 4, !dbg !1923
  %2 = sext i32 %1 to i64, !dbg !1924
  %3 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %2, !dbg !1924
  %4 = getelementptr inbounds nuw %struct.player, ptr %3, i32 0, i32 21, !dbg !1925
  store i32 0, ptr %4, align 4, !dbg !1926
  %5 = load i32, ptr @Player_num, align 4, !dbg !1927
  %6 = sext i32 %5 to i64, !dbg !1928
  %7 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %6, !dbg !1928
  %8 = getelementptr inbounds nuw %struct.player, ptr %7, i32 0, i32 20, !dbg !1929
  store i32 0, ptr %8, align 4, !dbg !1930
  %9 = load i32, ptr @Player_num, align 4, !dbg !1931
  %10 = sext i32 %9 to i64, !dbg !1932
  %11 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %10, !dbg !1932
  %12 = getelementptr inbounds nuw %struct.player, ptr %11, i32 0, i32 10, !dbg !1933
  store i8 3, ptr %12, align 4, !dbg !1934
  %13 = load i32, ptr @Player_num, align 4, !dbg !1935
  %14 = sext i32 %13 to i64, !dbg !1936
  %15 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %14, !dbg !1936
  %16 = getelementptr inbounds nuw %struct.player, ptr %15, i32 0, i32 11, !dbg !1937
  store i8 1, ptr %16, align 1, !dbg !1938
  %17 = load i32, ptr @Player_num, align 4, !dbg !1939
  %18 = sext i32 %17 to i64, !dbg !1940
  %19 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %18, !dbg !1940
  %20 = getelementptr inbounds nuw %struct.player, ptr %19, i32 0, i32 22, !dbg !1941
  store i32 0, ptr %20, align 4, !dbg !1942
  %21 = load i32, ptr @Player_num, align 4, !dbg !1943
  %22 = sext i32 %21 to i64, !dbg !1944
  %23 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %22, !dbg !1944
  %24 = getelementptr inbounds nuw %struct.player, ptr %23, i32 0, i32 23, !dbg !1945
  store i32 0, ptr %24, align 4, !dbg !1946
  %25 = load i32, ptr @Player_num, align 4, !dbg !1947
  %26 = sext i32 %25 to i64, !dbg !1948
  %27 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %26, !dbg !1948
  %28 = getelementptr inbounds nuw %struct.player, ptr %27, i32 0, i32 38, !dbg !1949
  store i8 0, ptr %28, align 4, !dbg !1950
  %29 = load i32, ptr @Player_num, align 4, !dbg !1951
  %30 = sext i32 %29 to i64, !dbg !1952
  %31 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %30, !dbg !1952
  %32 = getelementptr inbounds nuw %struct.player, ptr %31, i32 0, i32 39, !dbg !1953
  store i8 0, ptr %32, align 1, !dbg !1954
  %33 = call i32 @i2f(i32 noundef 100), !dbg !1955
  %34 = load i32, ptr @Player_num, align 4, !dbg !1956
  %35 = sext i32 %34 to i64, !dbg !1957
  %36 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %35, !dbg !1957
  %37 = getelementptr inbounds nuw %struct.player, ptr %36, i32 0, i32 8, !dbg !1958
  store i32 %33, ptr %37, align 4, !dbg !1959
  %38 = load i32, ptr @StartingShields, align 4, !dbg !1960
  %39 = load i32, ptr @Player_num, align 4, !dbg !1961
  %40 = sext i32 %39 to i64, !dbg !1962
  %41 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %40, !dbg !1962
  %42 = getelementptr inbounds nuw %struct.player, ptr %41, i32 0, i32 9, !dbg !1963
  store i32 %38, ptr %42, align 4, !dbg !1964
  %43 = load i32, ptr @Player_num, align 4, !dbg !1965
  %44 = sext i32 %43 to i64, !dbg !1966
  %45 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %44, !dbg !1966
  %46 = getelementptr inbounds nuw %struct.player, ptr %45, i32 0, i32 14, !dbg !1967
  store i16 -1, ptr %46, align 4, !dbg !1968
  %47 = load i32, ptr @Player_num, align 4, !dbg !1969
  %48 = sext i32 %47 to i64, !dbg !1970
  %49 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %48, !dbg !1970
  %50 = getelementptr inbounds nuw %struct.player, ptr %49, i32 0, i32 27, !dbg !1971
  store i16 0, ptr %50, align 2, !dbg !1972
  %51 = load i32, ptr @Player_num, align 4, !dbg !1973
  %52 = sext i32 %51 to i64, !dbg !1974
  %53 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %52, !dbg !1974
  %54 = getelementptr inbounds nuw %struct.player, ptr %53, i32 0, i32 28, !dbg !1975
  store i16 0, ptr %54, align 4, !dbg !1976
  %55 = load i32, ptr @Player_num, align 4, !dbg !1977
  %56 = sext i32 %55 to i64, !dbg !1978
  %57 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %56, !dbg !1978
  %58 = getelementptr inbounds nuw %struct.player, ptr %57, i32 0, i32 29, !dbg !1979
  store i16 0, ptr %58, align 2, !dbg !1980
  %59 = load i32, ptr @Player_num, align 4, !dbg !1981
  %60 = sext i32 %59 to i64, !dbg !1982
  %61 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %60, !dbg !1982
  %62 = getelementptr inbounds nuw %struct.player, ptr %61, i32 0, i32 30, !dbg !1983
  store i16 0, ptr %62, align 4, !dbg !1984
  %63 = load i32, ptr @Player_num, align 4, !dbg !1985
  %64 = sext i32 %63 to i64, !dbg !1986
  %65 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %64, !dbg !1986
  %66 = getelementptr inbounds nuw %struct.player, ptr %65, i32 0, i32 31, !dbg !1987
  store i16 0, ptr %66, align 2, !dbg !1988
  %67 = load i32, ptr @Player_num, align 4, !dbg !1989
  %68 = sext i32 %67 to i64, !dbg !1990
  %69 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %68, !dbg !1990
  %70 = getelementptr inbounds nuw %struct.player, ptr %69, i32 0, i32 32, !dbg !1991
  store i16 0, ptr %70, align 4, !dbg !1992
  %71 = load i32, ptr @Player_num, align 4, !dbg !1993
  %72 = sext i32 %71 to i64, !dbg !1994
  %73 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %72, !dbg !1994
  %74 = getelementptr inbounds nuw %struct.player, ptr %73, i32 0, i32 26, !dbg !1995
  store i16 0, ptr %74, align 4, !dbg !1996
  %75 = load i32, ptr @Player_num, align 4, !dbg !1997
  %76 = sext i32 %75 to i64, !dbg !1998
  %77 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %76, !dbg !1998
  %78 = getelementptr inbounds nuw %struct.player, ptr %77, i32 0, i32 33, !dbg !1999
  store i16 0, ptr %78, align 2, !dbg !2000
  %79 = load i32, ptr @Player_num, align 4, !dbg !2001
  %80 = sext i32 %79 to i64, !dbg !2002
  %81 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %80, !dbg !2002
  %82 = getelementptr inbounds nuw %struct.player, ptr %81, i32 0, i32 36, !dbg !2003
  store i8 0, ptr %82, align 1, !dbg !2004
  %83 = load i32, ptr @Player_num, align 4, !dbg !2005
  %84 = sext i32 %83 to i64, !dbg !2006
  %85 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %84, !dbg !2006
  %86 = getelementptr inbounds nuw %struct.player, ptr %85, i32 0, i32 34, !dbg !2007
  store i16 0, ptr %86, align 4, !dbg !2008
  %87 = load i32, ptr @Player_num, align 4, !dbg !2009
  %88 = sext i32 %87 to i64, !dbg !2010
  %89 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %88, !dbg !2010
  %90 = getelementptr inbounds nuw %struct.player, ptr %89, i32 0, i32 12, !dbg !2011
  store i8 0, ptr %90, align 2, !dbg !2012
  %91 = load i32, ptr @Player_num, align 4, !dbg !2013
  %92 = sext i32 %91 to i64, !dbg !2014
  %93 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %92, !dbg !2014
  %94 = getelementptr inbounds nuw %struct.player, ptr %93, i32 0, i32 7, !dbg !2015
  store i32 0, ptr %94, align 4, !dbg !2016
  call void @_Z26init_player_stats_new_shipv(), !dbg !2017
  store i32 1, ptr @First_secret_visit, align 4, !dbg !2018
  ret void, !dbg !2019
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr i32 @i2f(i32 noundef %0) #2 !dbg !2020 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !2023, !DIExpression(), !2024)
  %3 = load i32, ptr %2, align 4, !dbg !2025
  %4 = shl i32 %3, 16, !dbg !2026
  ret i32 %4, !dbg !2027
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z26init_player_stats_new_shipv() #0 !dbg !2028 {
  %1 = alloca i32, align 4
    #dbg_declare(ptr %1, !2029, !DIExpression(), !2030)
  %2 = load i32, ptr @Newdemo_state, align 4, !dbg !2031
  %3 = icmp eq i32 %2, 1, !dbg !2033
  br i1 %3, label %4, label %10, !dbg !2033

4:                                                ; preds = %0
  %5 = load i32, ptr @Player_num, align 4, !dbg !2034
  %6 = sext i32 %5 to i64, !dbg !2036
  %7 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %6, !dbg !2036
  %8 = getelementptr inbounds nuw %struct.player, ptr %7, i32 0, i32 12, !dbg !2037
  %9 = load i8, ptr %8, align 2, !dbg !2037
  call void @_Z26newdemo_record_laser_levelaa(i8 noundef signext %9, i8 noundef signext 0), !dbg !2038
  call void @_Z28newdemo_record_player_weaponii(i32 noundef 0, i32 noundef 0), !dbg !2039
  call void @_Z28newdemo_record_player_weaponii(i32 noundef 1, i32 noundef 0), !dbg !2040
  br label %10, !dbg !2041

10:                                               ; preds = %4, %0
  %11 = call i32 @i2f(i32 noundef 100), !dbg !2042
  %12 = load i32, ptr @Player_num, align 4, !dbg !2043
  %13 = sext i32 %12 to i64, !dbg !2044
  %14 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %13, !dbg !2044
  %15 = getelementptr inbounds nuw %struct.player, ptr %14, i32 0, i32 8, !dbg !2045
  store i32 %11, ptr %15, align 4, !dbg !2046
  %16 = load i32, ptr @StartingShields, align 4, !dbg !2047
  %17 = load i32, ptr @Player_num, align 4, !dbg !2048
  %18 = sext i32 %17 to i64, !dbg !2049
  %19 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %18, !dbg !2049
  %20 = getelementptr inbounds nuw %struct.player, ptr %19, i32 0, i32 9, !dbg !2050
  store i32 %16, ptr %20, align 4, !dbg !2051
  %21 = load i32, ptr @Player_num, align 4, !dbg !2052
  %22 = sext i32 %21 to i64, !dbg !2053
  %23 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %22, !dbg !2053
  %24 = getelementptr inbounds nuw %struct.player, ptr %23, i32 0, i32 12, !dbg !2054
  store i8 0, ptr %24, align 2, !dbg !2055
  %25 = load i32, ptr @Player_num, align 4, !dbg !2056
  %26 = sext i32 %25 to i64, !dbg !2057
  %27 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %26, !dbg !2057
  %28 = getelementptr inbounds nuw %struct.player, ptr %27, i32 0, i32 14, !dbg !2058
  store i16 -1, ptr %28, align 4, !dbg !2059
  %29 = load i32, ptr @Player_num, align 4, !dbg !2060
  %30 = sext i32 %29 to i64, !dbg !2061
  %31 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %30, !dbg !2061
  %32 = getelementptr inbounds nuw %struct.player, ptr %31, i32 0, i32 35, !dbg !2062
  store i8 0, ptr %32, align 2, !dbg !2063
  store i32 0, ptr @Afterburner_charge, align 4, !dbg !2064
  store i32 0, ptr %1, align 4, !dbg !2065
  br label %33, !dbg !2067

33:                                               ; preds = %47, %10
  %34 = load i32, ptr %1, align 4, !dbg !2068
  %35 = icmp slt i32 %34, 10, !dbg !2070
  br i1 %35, label %36, label %50, !dbg !2071

36:                                               ; preds = %33
  %37 = load i32, ptr @Player_num, align 4, !dbg !2072
  %38 = sext i32 %37 to i64, !dbg !2074
  %39 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %38, !dbg !2074
  %40 = getelementptr inbounds nuw %struct.player, ptr %39, i32 0, i32 17, !dbg !2075
  %41 = load i32, ptr %1, align 4, !dbg !2076
  %42 = sext i32 %41 to i64, !dbg !2074
  %43 = getelementptr inbounds [10 x i16], ptr %40, i64 0, i64 %42, !dbg !2074
  store i16 0, ptr %43, align 2, !dbg !2077
  %44 = load i32, ptr %1, align 4, !dbg !2078
  %45 = sext i32 %44 to i64, !dbg !2079
  %46 = getelementptr inbounds [10 x i8], ptr @Primary_last_was_super, i64 0, i64 %45, !dbg !2079
  store i8 0, ptr %46, align 1, !dbg !2080
  br label %47, !dbg !2081

47:                                               ; preds = %36
  %48 = load i32, ptr %1, align 4, !dbg !2082
  %49 = add nsw i32 %48, 1, !dbg !2082
  store i32 %49, ptr %1, align 4, !dbg !2082
  br label %33, !dbg !2083, !llvm.loop !2084

50:                                               ; preds = %33
  store i32 1, ptr %1, align 4, !dbg !2086
  br label %51, !dbg !2088

51:                                               ; preds = %65, %50
  %52 = load i32, ptr %1, align 4, !dbg !2089
  %53 = icmp slt i32 %52, 10, !dbg !2091
  br i1 %53, label %54, label %68, !dbg !2092

54:                                               ; preds = %51
  %55 = load i32, ptr @Player_num, align 4, !dbg !2093
  %56 = sext i32 %55 to i64, !dbg !2095
  %57 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %56, !dbg !2095
  %58 = getelementptr inbounds nuw %struct.player, ptr %57, i32 0, i32 18, !dbg !2096
  %59 = load i32, ptr %1, align 4, !dbg !2097
  %60 = sext i32 %59 to i64, !dbg !2095
  %61 = getelementptr inbounds [10 x i16], ptr %58, i64 0, i64 %60, !dbg !2095
  store i16 0, ptr %61, align 2, !dbg !2098
  %62 = load i32, ptr %1, align 4, !dbg !2099
  %63 = sext i32 %62 to i64, !dbg !2100
  %64 = getelementptr inbounds [10 x i8], ptr @Secondary_last_was_super, i64 0, i64 %63, !dbg !2100
  store i8 0, ptr %64, align 1, !dbg !2101
  br label %65, !dbg !2102

65:                                               ; preds = %54
  %66 = load i32, ptr %1, align 4, !dbg !2103
  %67 = add nsw i32 %66, 1, !dbg !2103
  store i32 %67, ptr %1, align 4, !dbg !2103
  br label %51, !dbg !2104, !llvm.loop !2105

68:                                               ; preds = %51
  %69 = load i32, ptr @Difficulty_level, align 4, !dbg !2107
  %70 = sub nsw i32 7, %69, !dbg !2108
  %71 = trunc i32 %70 to i16, !dbg !2109
  %72 = load i32, ptr @Player_num, align 4, !dbg !2110
  %73 = sext i32 %72 to i64, !dbg !2111
  %74 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %73, !dbg !2111
  %75 = getelementptr inbounds nuw %struct.player, ptr %74, i32 0, i32 18, !dbg !2112
  %76 = getelementptr inbounds [10 x i16], ptr %75, i64 0, i64 0, !dbg !2111
  store i16 %71, ptr %76, align 2, !dbg !2113
  %77 = load i32, ptr @Player_num, align 4, !dbg !2114
  %78 = sext i32 %77 to i64, !dbg !2115
  %79 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %78, !dbg !2115
  %80 = getelementptr inbounds nuw %struct.player, ptr %79, i32 0, i32 15, !dbg !2116
  store i16 1, ptr %80, align 2, !dbg !2117
  %81 = load i32, ptr @Player_num, align 4, !dbg !2118
  %82 = sext i32 %81 to i64, !dbg !2119
  %83 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %82, !dbg !2119
  %84 = getelementptr inbounds nuw %struct.player, ptr %83, i32 0, i32 16, !dbg !2120
  store i16 1, ptr %84, align 4, !dbg !2121
  store i8 0, ptr @Primary_weapon, align 1, !dbg !2122
  store i8 0, ptr @Secondary_weapon, align 1, !dbg !2123
  %85 = load i32, ptr @Player_num, align 4, !dbg !2124
  %86 = sext i32 %85 to i64, !dbg !2125
  %87 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %86, !dbg !2125
  %88 = getelementptr inbounds nuw %struct.player, ptr %87, i32 0, i32 7, !dbg !2126
  %89 = load i32, ptr %88, align 4, !dbg !2127
  %90 = and i32 %89, -32210, !dbg !2127
  store i32 %90, ptr %88, align 4, !dbg !2127
  %91 = load i32, ptr @Player_num, align 4, !dbg !2128
  %92 = sext i32 %91 to i64, !dbg !2129
  %93 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %92, !dbg !2129
  %94 = getelementptr inbounds nuw %struct.player, ptr %93, i32 0, i32 24, !dbg !2130
  store i32 0, ptr %94, align 4, !dbg !2131
  %95 = load i32, ptr @Player_num, align 4, !dbg !2132
  %96 = sext i32 %95 to i64, !dbg !2133
  %97 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %96, !dbg !2133
  %98 = getelementptr inbounds nuw %struct.player, ptr %97, i32 0, i32 25, !dbg !2134
  store i32 0, ptr %98, align 4, !dbg !2135
  store i32 0, ptr @Player_is_dead, align 4, !dbg !2136
  %99 = load i32, ptr @Player_num, align 4, !dbg !2137
  %100 = sext i32 %99 to i64, !dbg !2138
  %101 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %100, !dbg !2138
  %102 = getelementptr inbounds nuw %struct.player, ptr %101, i32 0, i32 37, !dbg !2139
  store i32 -65536, ptr %102, align 4, !dbg !2140
  store i8 0, ptr getelementptr inbounds nuw (%struct.control_info, ptr @Controls, i32 0, i32 16), align 2, !dbg !2141
  store i8 0, ptr @Last_afterburner_state, align 1, !dbg !2142
  %103 = load i32, ptr @Player_num, align 4, !dbg !2143
  %104 = sext i32 %103 to i64, !dbg !2144
  %105 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %104, !dbg !2144
  %106 = getelementptr inbounds nuw %struct.player, ptr %105, i32 0, i32 4, !dbg !2145
  %107 = load i32, ptr %106, align 4, !dbg !2145
  call void @_Z32digi_kill_sound_linked_to_objecti(i32 noundef %107), !dbg !2146
  store ptr null, ptr @Missile_viewer, align 8, !dbg !2147
  call void @_Z16init_ai_for_shipv(), !dbg !2148
  ret void, !dbg !2149
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z20init_ammo_and_energyv() #0 !dbg !2150 {
  %1 = load i32, ptr @Player_num, align 4, !dbg !2151
  %2 = sext i32 %1 to i64, !dbg !2153
  %3 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %2, !dbg !2153
  %4 = getelementptr inbounds nuw %struct.player, ptr %3, i32 0, i32 8, !dbg !2154
  %5 = load i32, ptr %4, align 4, !dbg !2154
  %6 = call i32 @i2f(i32 noundef 100), !dbg !2155
  %7 = icmp slt i32 %5, %6, !dbg !2156
  br i1 %7, label %8, label %14, !dbg !2156

8:                                                ; preds = %0
  %9 = call i32 @i2f(i32 noundef 100), !dbg !2157
  %10 = load i32, ptr @Player_num, align 4, !dbg !2158
  %11 = sext i32 %10 to i64, !dbg !2159
  %12 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %11, !dbg !2159
  %13 = getelementptr inbounds nuw %struct.player, ptr %12, i32 0, i32 8, !dbg !2160
  store i32 %9, ptr %13, align 4, !dbg !2161
  br label %14, !dbg !2159

14:                                               ; preds = %8, %0
  %15 = load i32, ptr @Player_num, align 4, !dbg !2162
  %16 = sext i32 %15 to i64, !dbg !2164
  %17 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %16, !dbg !2164
  %18 = getelementptr inbounds nuw %struct.player, ptr %17, i32 0, i32 9, !dbg !2165
  %19 = load i32, ptr %18, align 4, !dbg !2165
  %20 = load i32, ptr @StartingShields, align 4, !dbg !2166
  %21 = icmp slt i32 %19, %20, !dbg !2167
  br i1 %21, label %22, label %28, !dbg !2167

22:                                               ; preds = %14
  %23 = load i32, ptr @StartingShields, align 4, !dbg !2168
  %24 = load i32, ptr @Player_num, align 4, !dbg !2169
  %25 = sext i32 %24 to i64, !dbg !2170
  %26 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %25, !dbg !2170
  %27 = getelementptr inbounds nuw %struct.player, ptr %26, i32 0, i32 9, !dbg !2171
  store i32 %23, ptr %27, align 4, !dbg !2172
  br label %28, !dbg !2170

28:                                               ; preds = %22, %14
  %29 = load i32, ptr @Player_num, align 4, !dbg !2173
  %30 = sext i32 %29 to i64, !dbg !2175
  %31 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %30, !dbg !2175
  %32 = getelementptr inbounds nuw %struct.player, ptr %31, i32 0, i32 18, !dbg !2176
  %33 = getelementptr inbounds [10 x i16], ptr %32, i64 0, i64 0, !dbg !2175
  %34 = load i16, ptr %33, align 2, !dbg !2175
  %35 = zext i16 %34 to i32, !dbg !2175
  %36 = load i32, ptr @Difficulty_level, align 4, !dbg !2177
  %37 = sub nsw i32 7, %36, !dbg !2178
  %38 = icmp slt i32 %35, %37, !dbg !2179
  br i1 %38, label %39, label %48, !dbg !2179

39:                                               ; preds = %28
  %40 = load i32, ptr @Difficulty_level, align 4, !dbg !2180
  %41 = sub nsw i32 7, %40, !dbg !2181
  %42 = trunc i32 %41 to i16, !dbg !2182
  %43 = load i32, ptr @Player_num, align 4, !dbg !2183
  %44 = sext i32 %43 to i64, !dbg !2184
  %45 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %44, !dbg !2184
  %46 = getelementptr inbounds nuw %struct.player, ptr %45, i32 0, i32 18, !dbg !2185
  %47 = getelementptr inbounds [10 x i16], ptr %46, i64 0, i64 0, !dbg !2184
  store i16 %42, ptr %47, align 2, !dbg !2186
  br label %48, !dbg !2184

48:                                               ; preds = %39, %28
  ret void, !dbg !2187
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z23init_player_stats_leveli(i32 noundef %0) #0 !dbg !2188 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !2189, !DIExpression(), !2190)
  %3 = load i32, ptr @Player_num, align 4, !dbg !2191
  %4 = sext i32 %3 to i64, !dbg !2192
  %5 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %4, !dbg !2192
  %6 = getelementptr inbounds nuw %struct.player, ptr %5, i32 0, i32 21, !dbg !2193
  %7 = load i32, ptr %6, align 4, !dbg !2193
  %8 = load i32, ptr @Player_num, align 4, !dbg !2194
  %9 = sext i32 %8 to i64, !dbg !2195
  %10 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %9, !dbg !2195
  %11 = getelementptr inbounds nuw %struct.player, ptr %10, i32 0, i32 20, !dbg !2196
  store i32 %7, ptr %11, align 4, !dbg !2197
  %12 = load i32, ptr @Current_level_num, align 4, !dbg !2198
  %13 = trunc i32 %12 to i8, !dbg !2198
  %14 = load i32, ptr @Player_num, align 4, !dbg !2199
  %15 = sext i32 %14 to i64, !dbg !2200
  %16 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %15, !dbg !2200
  %17 = getelementptr inbounds nuw %struct.player, ptr %16, i32 0, i32 11, !dbg !2201
  store i8 %13, ptr %17, align 1, !dbg !2202
  %18 = load i32, ptr @Player_num, align 4, !dbg !2203
  %19 = sext i32 %18 to i64, !dbg !2205
  %20 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %19, !dbg !2205
  %21 = getelementptr inbounds nuw %struct.player, ptr %20, i32 0, i32 22, !dbg !2206
  store i32 0, ptr %21, align 4, !dbg !2207
  %22 = load i32, ptr @Player_num, align 4, !dbg !2208
  %23 = sext i32 %22 to i64, !dbg !2209
  %24 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %23, !dbg !2209
  %25 = getelementptr inbounds nuw %struct.player, ptr %24, i32 0, i32 38, !dbg !2210
  store i8 0, ptr %25, align 4, !dbg !2211
  %26 = load i32, ptr @Player_num, align 4, !dbg !2212
  %27 = sext i32 %26 to i64, !dbg !2213
  %28 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %27, !dbg !2213
  %29 = getelementptr inbounds nuw %struct.player, ptr %28, i32 0, i32 14, !dbg !2214
  store i16 -1, ptr %29, align 4, !dbg !2215
  %30 = load i32, ptr @Player_num, align 4, !dbg !2216
  %31 = sext i32 %30 to i64, !dbg !2217
  %32 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %31, !dbg !2217
  %33 = getelementptr inbounds nuw %struct.player, ptr %32, i32 0, i32 29, !dbg !2218
  store i16 0, ptr %33, align 2, !dbg !2219
  %34 = call noundef i32 @_Z22count_number_of_robotsv(), !dbg !2220
  %35 = trunc i32 %34 to i16, !dbg !2220
  %36 = load i32, ptr @Player_num, align 4, !dbg !2221
  %37 = sext i32 %36 to i64, !dbg !2222
  %38 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %37, !dbg !2222
  %39 = getelementptr inbounds nuw %struct.player, ptr %38, i32 0, i32 31, !dbg !2223
  store i16 %35, ptr %39, align 2, !dbg !2224
  %40 = load i32, ptr @Player_num, align 4, !dbg !2225
  %41 = sext i32 %40 to i64, !dbg !2226
  %42 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %41, !dbg !2226
  %43 = getelementptr inbounds nuw %struct.player, ptr %42, i32 0, i32 31, !dbg !2227
  %44 = load i16, ptr %43, align 2, !dbg !2227
  %45 = sext i16 %44 to i32, !dbg !2226
  %46 = load i32, ptr @Player_num, align 4, !dbg !2228
  %47 = sext i32 %46 to i64, !dbg !2229
  %48 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %47, !dbg !2229
  %49 = getelementptr inbounds nuw %struct.player, ptr %48, i32 0, i32 32, !dbg !2230
  %50 = load i16, ptr %49, align 4, !dbg !2231
  %51 = sext i16 %50 to i32, !dbg !2231
  %52 = add nsw i32 %51, %45, !dbg !2231
  %53 = trunc i32 %52 to i16, !dbg !2231
  store i16 %53, ptr %49, align 4, !dbg !2231
  %54 = call noundef i32 @_Z24count_number_of_hostagesv(), !dbg !2232
  %55 = trunc i32 %54 to i8, !dbg !2232
  %56 = load i32, ptr @Player_num, align 4, !dbg !2233
  %57 = sext i32 %56 to i64, !dbg !2234
  %58 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %57, !dbg !2234
  %59 = getelementptr inbounds nuw %struct.player, ptr %58, i32 0, i32 36, !dbg !2235
  store i8 %55, ptr %59, align 1, !dbg !2236
  %60 = load i32, ptr @Player_num, align 4, !dbg !2237
  %61 = sext i32 %60 to i64, !dbg !2238
  %62 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %61, !dbg !2238
  %63 = getelementptr inbounds nuw %struct.player, ptr %62, i32 0, i32 36, !dbg !2239
  %64 = load i8, ptr %63, align 1, !dbg !2239
  %65 = zext i8 %64 to i32, !dbg !2238
  %66 = load i32, ptr @Player_num, align 4, !dbg !2240
  %67 = sext i32 %66 to i64, !dbg !2241
  %68 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %67, !dbg !2241
  %69 = getelementptr inbounds nuw %struct.player, ptr %68, i32 0, i32 34, !dbg !2242
  %70 = load i16, ptr %69, align 4, !dbg !2243
  %71 = zext i16 %70 to i32, !dbg !2243
  %72 = add nsw i32 %71, %65, !dbg !2243
  %73 = trunc i32 %72 to i16, !dbg !2243
  store i16 %73, ptr %69, align 4, !dbg !2243
  %74 = load i32, ptr @Player_num, align 4, !dbg !2244
  %75 = sext i32 %74 to i64, !dbg !2245
  %76 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %75, !dbg !2245
  %77 = getelementptr inbounds nuw %struct.player, ptr %76, i32 0, i32 35, !dbg !2246
  store i8 0, ptr %77, align 2, !dbg !2247
  %78 = load i32, ptr %2, align 4, !dbg !2248
  %79 = icmp ne i32 %78, 0, !dbg !2248
  br i1 %79, label %128, label %80, !dbg !2250

80:                                               ; preds = %1
  call void @_Z20init_ammo_and_energyv(), !dbg !2251
  %81 = load i32, ptr @Player_num, align 4, !dbg !2253
  %82 = sext i32 %81 to i64, !dbg !2254
  %83 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %82, !dbg !2254
  %84 = getelementptr inbounds nuw %struct.player, ptr %83, i32 0, i32 7, !dbg !2255
  %85 = load i32, ptr %84, align 4, !dbg !2256
  %86 = and i32 %85, -3, !dbg !2256
  store i32 %86, ptr %84, align 4, !dbg !2256
  %87 = load i32, ptr @Player_num, align 4, !dbg !2257
  %88 = sext i32 %87 to i64, !dbg !2258
  %89 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %88, !dbg !2258
  %90 = getelementptr inbounds nuw %struct.player, ptr %89, i32 0, i32 7, !dbg !2259
  %91 = load i32, ptr %90, align 4, !dbg !2260
  %92 = and i32 %91, -5, !dbg !2260
  store i32 %92, ptr %90, align 4, !dbg !2260
  %93 = load i32, ptr @Player_num, align 4, !dbg !2261
  %94 = sext i32 %93 to i64, !dbg !2262
  %95 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %94, !dbg !2262
  %96 = getelementptr inbounds nuw %struct.player, ptr %95, i32 0, i32 7, !dbg !2263
  %97 = load i32, ptr %96, align 4, !dbg !2264
  %98 = and i32 %97, -9, !dbg !2264
  store i32 %98, ptr %96, align 4, !dbg !2264
  %99 = load i32, ptr @Player_num, align 4, !dbg !2265
  %100 = sext i32 %99 to i64, !dbg !2266
  %101 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %100, !dbg !2266
  %102 = getelementptr inbounds nuw %struct.player, ptr %101, i32 0, i32 7, !dbg !2267
  %103 = load i32, ptr %102, align 4, !dbg !2268
  %104 = and i32 %103, -2114, !dbg !2268
  store i32 %104, ptr %102, align 4, !dbg !2268
  %105 = load i32, ptr @Player_num, align 4, !dbg !2269
  %106 = sext i32 %105 to i64, !dbg !2270
  %107 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %106, !dbg !2270
  %108 = getelementptr inbounds nuw %struct.player, ptr %107, i32 0, i32 24, !dbg !2271
  store i32 0, ptr %108, align 4, !dbg !2272
  %109 = load i32, ptr @Player_num, align 4, !dbg !2273
  %110 = sext i32 %109 to i64, !dbg !2274
  %111 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %110, !dbg !2274
  %112 = getelementptr inbounds nuw %struct.player, ptr %111, i32 0, i32 25, !dbg !2275
  store i32 0, ptr %112, align 4, !dbg !2276
  %113 = load i32, ptr @Game_mode, align 4, !dbg !2277
  %114 = and i32 %113, 38, !dbg !2279
  %115 = icmp ne i32 %114, 0, !dbg !2280
  br i1 %115, label %116, label %127, !dbg !2281

116:                                              ; preds = %80
  %117 = load i32, ptr @Game_mode, align 4, !dbg !2282
  %118 = and i32 %117, 16, !dbg !2283
  %119 = icmp ne i32 %118, 0, !dbg !2284
  br i1 %119, label %127, label %120, !dbg !2281

120:                                              ; preds = %116
  %121 = load i32, ptr @Player_num, align 4, !dbg !2285
  %122 = sext i32 %121 to i64, !dbg !2286
  %123 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %122, !dbg !2286
  %124 = getelementptr inbounds nuw %struct.player, ptr %123, i32 0, i32 7, !dbg !2287
  %125 = load i32, ptr %124, align 4, !dbg !2288
  %126 = or i32 %125, 14, !dbg !2288
  store i32 %126, ptr %124, align 4, !dbg !2288
  br label %127, !dbg !2286

127:                                              ; preds = %120, %116, %80
  br label %128, !dbg !2289

128:                                              ; preds = %127, %1
  store i32 0, ptr @Player_is_dead, align 4, !dbg !2290
  %129 = load i32, ptr @Player_num, align 4, !dbg !2291
  %130 = sext i32 %129 to i64, !dbg !2292
  %131 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %130, !dbg !2292
  %132 = getelementptr inbounds nuw %struct.player, ptr %131, i32 0, i32 37, !dbg !2293
  store i32 -65536, ptr %132, align 4, !dbg !2294
  %133 = load i32, ptr @GameTime, align 4, !dbg !2295
  store i32 %133, ptr @Next_laser_fire_time, align 4, !dbg !2296
  store i32 %133, ptr @Last_laser_fired_time, align 4, !dbg !2297
  store i8 0, ptr getelementptr inbounds nuw (%struct.control_info, ptr @Controls, i32 0, i32 16), align 2, !dbg !2298
  store i8 0, ptr @Last_afterburner_state, align 1, !dbg !2299
  %134 = load i32, ptr @Player_num, align 4, !dbg !2300
  %135 = sext i32 %134 to i64, !dbg !2301
  %136 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %135, !dbg !2301
  %137 = getelementptr inbounds nuw %struct.player, ptr %136, i32 0, i32 4, !dbg !2302
  %138 = load i32, ptr %137, align 4, !dbg !2302
  call void @_Z32digi_kill_sound_linked_to_objecti(i32 noundef %138), !dbg !2303
  call void @_Z11init_gaugesv(), !dbg !2304
  store ptr null, ptr @Missile_viewer, align 8, !dbg !2305
  ret void, !dbg !2306
}

declare void @_Z32digi_kill_sound_linked_to_objecti(i32 noundef) #1

declare void @_Z11init_gaugesv() #1

declare void @_Z26newdemo_record_laser_levelaa(i8 noundef signext, i8 noundef signext) #1

declare void @_Z28newdemo_record_player_weaponii(i32 noundef, i32 noundef) #1

declare void @_Z16init_ai_for_shipv() #1

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define void @_Z21reset_network_objectsv() #2 !dbg !2307 {
  ret void, !dbg !2308
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z10DoGameOverv() #0 !dbg !2309 {
  %1 = load i32, ptr @Current_mission_num, align 4, !dbg !2310
  %2 = icmp eq i32 %1, 0, !dbg !2312
  br i1 %2, label %3, label %4, !dbg !2312

3:                                                ; preds = %0
  call void @_Z23scores_maybe_add_playeri(i32 noundef 0), !dbg !2313
  br label %4, !dbg !2313

4:                                                ; preds = %3, %0
  store i32 1, ptr @Function_mode, align 4, !dbg !2314
  store i32 128, ptr @Game_mode, align 4, !dbg !2315
  call void @longjmp(ptr noundef @LeaveGame, i32 noundef 0) #8, !dbg !2316
  unreachable, !dbg !2316
}

declare void @_Z23scores_maybe_add_playeri(i32 noundef) #1

; Function Attrs: noreturn
declare void @longjmp(ptr noundef, i32 noundef) #4

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z19update_player_statsv() #0 !dbg !2317 {
  %1 = load i32, ptr @FrameTime, align 4, !dbg !2318
  %2 = load i32, ptr @Player_num, align 4, !dbg !2319
  %3 = sext i32 %2 to i64, !dbg !2320
  %4 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %3, !dbg !2320
  %5 = getelementptr inbounds nuw %struct.player, ptr %4, i32 0, i32 22, !dbg !2321
  %6 = load i32, ptr %5, align 4, !dbg !2322
  %7 = add nsw i32 %6, %1, !dbg !2322
  store i32 %7, ptr %5, align 4, !dbg !2322
  %8 = load i32, ptr @Player_num, align 4, !dbg !2323
  %9 = sext i32 %8 to i64, !dbg !2325
  %10 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %9, !dbg !2325
  %11 = getelementptr inbounds nuw %struct.player, ptr %10, i32 0, i32 22, !dbg !2326
  %12 = load i32, ptr %11, align 4, !dbg !2326
  %13 = call i32 @i2f(i32 noundef 3600), !dbg !2327
  %14 = icmp sgt i32 %12, %13, !dbg !2328
  br i1 %14, label %15, label %29, !dbg !2328

15:                                               ; preds = %0
  %16 = call i32 @i2f(i32 noundef 3600), !dbg !2329
  %17 = load i32, ptr @Player_num, align 4, !dbg !2331
  %18 = sext i32 %17 to i64, !dbg !2332
  %19 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %18, !dbg !2332
  %20 = getelementptr inbounds nuw %struct.player, ptr %19, i32 0, i32 22, !dbg !2333
  %21 = load i32, ptr %20, align 4, !dbg !2334
  %22 = sub nsw i32 %21, %16, !dbg !2334
  store i32 %22, ptr %20, align 4, !dbg !2334
  %23 = load i32, ptr @Player_num, align 4, !dbg !2335
  %24 = sext i32 %23 to i64, !dbg !2336
  %25 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %24, !dbg !2336
  %26 = getelementptr inbounds nuw %struct.player, ptr %25, i32 0, i32 38, !dbg !2337
  %27 = load i8, ptr %26, align 4, !dbg !2338
  %28 = add i8 %27, 1, !dbg !2338
  store i8 %28, ptr %26, align 4, !dbg !2338
  br label %29, !dbg !2339

29:                                               ; preds = %15, %0
  %30 = load i32, ptr @FrameTime, align 4, !dbg !2340
  %31 = load i32, ptr @Player_num, align 4, !dbg !2341
  %32 = sext i32 %31 to i64, !dbg !2342
  %33 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %32, !dbg !2342
  %34 = getelementptr inbounds nuw %struct.player, ptr %33, i32 0, i32 23, !dbg !2343
  %35 = load i32, ptr %34, align 4, !dbg !2344
  %36 = add nsw i32 %35, %30, !dbg !2344
  store i32 %36, ptr %34, align 4, !dbg !2344
  %37 = load i32, ptr @Player_num, align 4, !dbg !2345
  %38 = sext i32 %37 to i64, !dbg !2347
  %39 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %38, !dbg !2347
  %40 = getelementptr inbounds nuw %struct.player, ptr %39, i32 0, i32 23, !dbg !2348
  %41 = load i32, ptr %40, align 4, !dbg !2348
  %42 = call i32 @i2f(i32 noundef 3600), !dbg !2349
  %43 = icmp sgt i32 %41, %42, !dbg !2350
  br i1 %43, label %44, label %58, !dbg !2350

44:                                               ; preds = %29
  %45 = call i32 @i2f(i32 noundef 3600), !dbg !2351
  %46 = load i32, ptr @Player_num, align 4, !dbg !2353
  %47 = sext i32 %46 to i64, !dbg !2354
  %48 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %47, !dbg !2354
  %49 = getelementptr inbounds nuw %struct.player, ptr %48, i32 0, i32 23, !dbg !2355
  %50 = load i32, ptr %49, align 4, !dbg !2356
  %51 = sub nsw i32 %50, %45, !dbg !2356
  store i32 %51, ptr %49, align 4, !dbg !2356
  %52 = load i32, ptr @Player_num, align 4, !dbg !2357
  %53 = sext i32 %52 to i64, !dbg !2358
  %54 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %53, !dbg !2358
  %55 = getelementptr inbounds nuw %struct.player, ptr %54, i32 0, i32 39, !dbg !2359
  %56 = load i8, ptr %55, align 1, !dbg !2360
  %57 = add i8 %56, 1, !dbg !2360
  store i8 %57, ptr %55, align 1, !dbg !2360
  br label %58, !dbg !2361

58:                                               ; preds = %44, %29
  ret void, !dbg !2362
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z17set_sound_sourcesv() #0 !dbg !2363 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.vms_vector, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
    #dbg_declare(ptr %1, !2364, !DIExpression(), !2365)
    #dbg_declare(ptr %2, !2366, !DIExpression(), !2367)
    #dbg_declare(ptr %3, !2368, !DIExpression(), !2399)
  call void @_Z16digi_init_soundsv(), !dbg !2400
  store i32 1, ptr @Dont_start_sound_objects, align 4, !dbg !2401
  store ptr @Segments, ptr %3, align 8, !dbg !2402
  store i32 0, ptr %1, align 4, !dbg !2404
  br label %11, !dbg !2405

11:                                               ; preds = %207, %0
  %12 = load i32, ptr %1, align 4, !dbg !2406
  %13 = load i32, ptr @Highest_segment_index, align 4, !dbg !2408
  %14 = icmp sle i32 %12, %13, !dbg !2409
  br i1 %14, label %15, label %212, !dbg !2410

15:                                               ; preds = %11
  store i32 0, ptr %2, align 4, !dbg !2411
  br label %16, !dbg !2413

16:                                               ; preds = %203, %15
  %17 = load i32, ptr %2, align 4, !dbg !2414
  %18 = icmp slt i32 %17, 6, !dbg !2416
  br i1 %18, label %19, label %206, !dbg !2417

19:                                               ; preds = %16
    #dbg_declare(ptr %4, !2418, !DIExpression(), !2420)
    #dbg_declare(ptr %5, !2421, !DIExpression(), !2422)
    #dbg_declare(ptr %6, !2423, !DIExpression(), !2424)
  %20 = load ptr, ptr %3, align 8, !dbg !2425
  %21 = getelementptr inbounds nuw %struct.segment, ptr %20, i32 0, i32 1, !dbg !2425
  %22 = load i32, ptr %2, align 4, !dbg !2425
  %23 = sext i32 %22 to i64, !dbg !2425
  %24 = getelementptr inbounds [6 x i16], ptr %21, i64 0, i64 %23, !dbg !2425
  %25 = load i16, ptr %24, align 2, !dbg !2425
  %26 = sext i16 %25 to i32, !dbg !2425
  %27 = icmp eq i32 %26, -1, !dbg !2425
  br i1 %27, label %28, label %29, !dbg !2425

28:                                               ; preds = %19
  br label %58, !dbg !2425

29:                                               ; preds = %19
  %30 = load ptr, ptr %3, align 8, !dbg !2425
  %31 = getelementptr inbounds nuw %struct.segment, ptr %30, i32 0, i32 1, !dbg !2425
  %32 = load i32, ptr %2, align 4, !dbg !2425
  %33 = sext i32 %32 to i64, !dbg !2425
  %34 = getelementptr inbounds [6 x i16], ptr %31, i64 0, i64 %33, !dbg !2425
  %35 = load i16, ptr %34, align 2, !dbg !2425
  %36 = sext i16 %35 to i32, !dbg !2425
  %37 = icmp eq i32 %36, -2, !dbg !2425
  br i1 %37, label %38, label %39, !dbg !2425

38:                                               ; preds = %29
  br label %56, !dbg !2425

39:                                               ; preds = %29
  %40 = load ptr, ptr %3, align 8, !dbg !2425
  %41 = getelementptr inbounds nuw %struct.segment, ptr %40, i32 0, i32 0, !dbg !2425
  %42 = load i32, ptr %2, align 4, !dbg !2425
  %43 = sext i32 %42 to i64, !dbg !2425
  %44 = getelementptr inbounds [6 x %struct.side], ptr %41, i64 0, i64 %43, !dbg !2425
  %45 = getelementptr inbounds nuw %struct.side, ptr %44, i32 0, i32 2, !dbg !2425
  %46 = load i16, ptr %45, align 2, !dbg !2425
  %47 = sext i16 %46 to i32, !dbg !2425
  %48 = icmp eq i32 %47, -1, !dbg !2425
  br i1 %48, label %49, label %50, !dbg !2425

49:                                               ; preds = %39
  br label %54, !dbg !2425

50:                                               ; preds = %39
  %51 = load ptr, ptr %3, align 8, !dbg !2425
  %52 = load i32, ptr %2, align 4, !dbg !2425
  %53 = call noundef i32 @_Z15wall_is_doorwayP7segmenti(ptr noundef %51, i32 noundef %52), !dbg !2425
  br label %54, !dbg !2425

54:                                               ; preds = %50, %49
  %55 = phi i32 [ 5, %49 ], [ %53, %50 ], !dbg !2425
  br label %56, !dbg !2425

56:                                               ; preds = %54, %38
  %57 = phi i32 [ 8, %38 ], [ %55, %54 ], !dbg !2425
  br label %58, !dbg !2425

58:                                               ; preds = %56, %28
  %59 = phi i32 [ 2, %28 ], [ %57, %56 ], !dbg !2425
  %60 = and i32 %59, 2, !dbg !2427
  %61 = icmp ne i32 %60, 0, !dbg !2425
  br i1 %61, label %62, label %202, !dbg !2425

62:                                               ; preds = %58
  %63 = load ptr, ptr %3, align 8, !dbg !2428
  %64 = getelementptr inbounds nuw %struct.segment, ptr %63, i32 0, i32 0, !dbg !2430
  %65 = load i32, ptr %2, align 4, !dbg !2431
  %66 = sext i32 %65 to i64, !dbg !2428
  %67 = getelementptr inbounds [6 x %struct.side], ptr %64, i64 0, i64 %66, !dbg !2428
  %68 = getelementptr inbounds nuw %struct.side, ptr %67, i32 0, i32 4, !dbg !2432
  %69 = load i16, ptr %68, align 2, !dbg !2432
  %70 = sext i16 %69 to i32, !dbg !2428
  store i32 %70, ptr %4, align 4, !dbg !2433
  %71 = icmp ne i32 %70, 0, !dbg !2434
  br i1 %71, label %72, label %81, !dbg !2435

72:                                               ; preds = %62
  %73 = load i32, ptr %4, align 4, !dbg !2436
  %74 = and i32 %73, 16383, !dbg !2437
  %75 = sext i32 %74 to i64, !dbg !2438
  %76 = getelementptr inbounds [1200 x %struct.tmap_info], ptr @TmapInfo, i64 0, i64 %75, !dbg !2438
  %77 = getelementptr inbounds nuw %struct.tmap_info, ptr %76, i32 0, i32 4, !dbg !2439
  %78 = load i16, ptr %77, align 4, !dbg !2439
  %79 = sext i16 %78 to i32, !dbg !2438
  store i32 %79, ptr %5, align 4, !dbg !2440
  %80 = icmp ne i32 %79, -1, !dbg !2441
  br i1 %80, label %95, label %81, !dbg !2442

81:                                               ; preds = %72, %62
  %82 = load ptr, ptr %3, align 8, !dbg !2443
  %83 = getelementptr inbounds nuw %struct.segment, ptr %82, i32 0, i32 0, !dbg !2444
  %84 = load i32, ptr %2, align 4, !dbg !2445
  %85 = sext i32 %84 to i64, !dbg !2443
  %86 = getelementptr inbounds [6 x %struct.side], ptr %83, i64 0, i64 %85, !dbg !2443
  %87 = getelementptr inbounds nuw %struct.side, ptr %86, i32 0, i32 3, !dbg !2446
  %88 = load i16, ptr %87, align 4, !dbg !2446
  %89 = sext i16 %88 to i64, !dbg !2447
  %90 = getelementptr inbounds [1200 x %struct.tmap_info], ptr @TmapInfo, i64 0, i64 %89, !dbg !2447
  %91 = getelementptr inbounds nuw %struct.tmap_info, ptr %90, i32 0, i32 4, !dbg !2448
  %92 = load i16, ptr %91, align 4, !dbg !2448
  %93 = sext i16 %92 to i32, !dbg !2447
  store i32 %93, ptr %5, align 4, !dbg !2449
  %94 = icmp ne i32 %93, -1, !dbg !2450
  br i1 %94, label %95, label %201, !dbg !2442

95:                                               ; preds = %81, %72
  %96 = load i32, ptr %5, align 4, !dbg !2451
  %97 = sext i32 %96 to i64, !dbg !2453
  %98 = getelementptr inbounds [110 x %struct.eclip], ptr @Effects, i64 0, i64 %97, !dbg !2453
  %99 = getelementptr inbounds nuw %struct.eclip, ptr %98, i32 0, i32 11, !dbg !2454
  %100 = load i32, ptr %99, align 4, !dbg !2454
  store i32 %100, ptr %6, align 4, !dbg !2455
  %101 = icmp ne i32 %100, -1, !dbg !2456
  br i1 %101, label %102, label %200, !dbg !2456

102:                                              ; preds = %95
    #dbg_declare(ptr %7, !2457, !DIExpression(), !2459)
    #dbg_declare(ptr %8, !2460, !DIExpression(), !2461)
  %103 = load ptr, ptr %3, align 8, !dbg !2462
  %104 = getelementptr inbounds nuw %struct.segment, ptr %103, i32 0, i32 1, !dbg !2463
  %105 = load i32, ptr %2, align 4, !dbg !2464
  %106 = sext i32 %105 to i64, !dbg !2462
  %107 = getelementptr inbounds [6 x i16], ptr %104, i64 0, i64 %106, !dbg !2462
  %108 = load i16, ptr %107, align 2, !dbg !2462
  %109 = sext i16 %108 to i32, !dbg !2462
  store i32 %109, ptr %8, align 4, !dbg !2461
  %110 = load i32, ptr %8, align 4, !dbg !2465
  %111 = icmp sgt i32 %110, -1, !dbg !2465
  br i1 %111, label %112, label %191, !dbg !2467

112:                                              ; preds = %102
  %113 = load i32, ptr %8, align 4, !dbg !2468
  %114 = load i32, ptr %1, align 4, !dbg !2469
  %115 = icmp slt i32 %113, %114, !dbg !2470
  br i1 %115, label %116, label %191, !dbg !2467

116:                                              ; preds = %112
  %117 = load ptr, ptr %3, align 8, !dbg !2471
  %118 = getelementptr inbounds nuw %struct.segment, ptr %117, i32 0, i32 1, !dbg !2471
  %119 = load i32, ptr %2, align 4, !dbg !2471
  %120 = sext i32 %119 to i64, !dbg !2471
  %121 = getelementptr inbounds [6 x i16], ptr %118, i64 0, i64 %120, !dbg !2471
  %122 = load i16, ptr %121, align 2, !dbg !2471
  %123 = sext i16 %122 to i32, !dbg !2471
  %124 = icmp eq i32 %123, -1, !dbg !2471
  br i1 %124, label %125, label %126, !dbg !2471

125:                                              ; preds = %116
  br label %155, !dbg !2471

126:                                              ; preds = %116
  %127 = load ptr, ptr %3, align 8, !dbg !2471
  %128 = getelementptr inbounds nuw %struct.segment, ptr %127, i32 0, i32 1, !dbg !2471
  %129 = load i32, ptr %2, align 4, !dbg !2471
  %130 = sext i32 %129 to i64, !dbg !2471
  %131 = getelementptr inbounds [6 x i16], ptr %128, i64 0, i64 %130, !dbg !2471
  %132 = load i16, ptr %131, align 2, !dbg !2471
  %133 = sext i16 %132 to i32, !dbg !2471
  %134 = icmp eq i32 %133, -2, !dbg !2471
  br i1 %134, label %135, label %136, !dbg !2471

135:                                              ; preds = %126
  br label %153, !dbg !2471

136:                                              ; preds = %126
  %137 = load ptr, ptr %3, align 8, !dbg !2471
  %138 = getelementptr inbounds nuw %struct.segment, ptr %137, i32 0, i32 0, !dbg !2471
  %139 = load i32, ptr %2, align 4, !dbg !2471
  %140 = sext i32 %139 to i64, !dbg !2471
  %141 = getelementptr inbounds [6 x %struct.side], ptr %138, i64 0, i64 %140, !dbg !2471
  %142 = getelementptr inbounds nuw %struct.side, ptr %141, i32 0, i32 2, !dbg !2471
  %143 = load i16, ptr %142, align 2, !dbg !2471
  %144 = sext i16 %143 to i32, !dbg !2471
  %145 = icmp eq i32 %144, -1, !dbg !2471
  br i1 %145, label %146, label %147, !dbg !2471

146:                                              ; preds = %136
  br label %151, !dbg !2471

147:                                              ; preds = %136
  %148 = load ptr, ptr %3, align 8, !dbg !2471
  %149 = load i32, ptr %2, align 4, !dbg !2471
  %150 = call noundef i32 @_Z15wall_is_doorwayP7segmenti(ptr noundef %148, i32 noundef %149), !dbg !2471
  br label %151, !dbg !2471

151:                                              ; preds = %147, %146
  %152 = phi i32 [ 5, %146 ], [ %150, %147 ], !dbg !2471
  br label %153, !dbg !2471

153:                                              ; preds = %151, %135
  %154 = phi i32 [ 8, %135 ], [ %152, %151 ], !dbg !2471
  br label %155, !dbg !2471

155:                                              ; preds = %153, %125
  %156 = phi i32 [ 2, %125 ], [ %154, %153 ], !dbg !2471
  %157 = and i32 %156, 5, !dbg !2474
  %158 = icmp ne i32 %157, 0, !dbg !2471
  br i1 %158, label %159, label %190, !dbg !2471

159:                                              ; preds = %155
    #dbg_declare(ptr %9, !2475, !DIExpression(), !2477)
    #dbg_declare(ptr %10, !2478, !DIExpression(), !2479)
  %160 = load ptr, ptr %3, align 8, !dbg !2480
  %161 = getelementptr inbounds nuw %struct.segment, ptr %160, i32 0, i32 1, !dbg !2481
  %162 = load i32, ptr %2, align 4, !dbg !2482
  %163 = sext i32 %162 to i64, !dbg !2480
  %164 = getelementptr inbounds [6 x i16], ptr %161, i64 0, i64 %163, !dbg !2480
  %165 = load i16, ptr %164, align 2, !dbg !2480
  %166 = sext i16 %165 to i64, !dbg !2483
  %167 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %166, !dbg !2483
  store ptr %167, ptr %9, align 8, !dbg !2484
  %168 = load ptr, ptr %3, align 8, !dbg !2485
  %169 = load ptr, ptr %9, align 8, !dbg !2486
  %170 = call noundef i32 @_Z17find_connect_sideP7segmentS0_(ptr noundef %168, ptr noundef %169), !dbg !2487
  store i32 %170, ptr %10, align 4, !dbg !2488
  %171 = load ptr, ptr %9, align 8, !dbg !2489
  %172 = getelementptr inbounds nuw %struct.segment, ptr %171, i32 0, i32 0, !dbg !2491
  %173 = load i32, ptr %10, align 4, !dbg !2492
  %174 = sext i32 %173 to i64, !dbg !2489
  %175 = getelementptr inbounds [6 x %struct.side], ptr %172, i64 0, i64 %174, !dbg !2489
  %176 = getelementptr inbounds nuw %struct.side, ptr %175, i32 0, i32 4, !dbg !2493
  %177 = load i16, ptr %176, align 2, !dbg !2493
  %178 = sext i16 %177 to i32, !dbg !2489
  %179 = load ptr, ptr %3, align 8, !dbg !2494
  %180 = getelementptr inbounds nuw %struct.segment, ptr %179, i32 0, i32 0, !dbg !2495
  %181 = load i32, ptr %2, align 4, !dbg !2496
  %182 = sext i32 %181 to i64, !dbg !2494
  %183 = getelementptr inbounds [6 x %struct.side], ptr %180, i64 0, i64 %182, !dbg !2494
  %184 = getelementptr inbounds nuw %struct.side, ptr %183, i32 0, i32 4, !dbg !2497
  %185 = load i16, ptr %184, align 2, !dbg !2497
  %186 = sext i16 %185 to i32, !dbg !2494
  %187 = icmp eq i32 %178, %186, !dbg !2498
  br i1 %187, label %188, label %189, !dbg !2498

188:                                              ; preds = %159
  br label %203, !dbg !2499

189:                                              ; preds = %159
  br label %190, !dbg !2500

190:                                              ; preds = %189, %155
  br label %191, !dbg !2501

191:                                              ; preds = %190, %112, %102
  %192 = load ptr, ptr %3, align 8, !dbg !2502
  %193 = load i32, ptr %2, align 4, !dbg !2503
  call void @_Z28compute_center_point_on_sideP10vms_vectorP7segmenti(ptr noundef %7, ptr noundef %192, i32 noundef %193), !dbg !2504
  %194 = load i32, ptr %6, align 4, !dbg !2505
  %195 = load i32, ptr %1, align 4, !dbg !2506
  %196 = trunc i32 %195 to i16, !dbg !2506
  %197 = load i32, ptr %2, align 4, !dbg !2507
  %198 = trunc i32 %197 to i16, !dbg !2507
  %199 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef %194, i16 noundef signext %196, i16 noundef signext %198, ptr noundef %7, i32 noundef 1, i32 noundef 32768), !dbg !2508
  br label %200, !dbg !2509

200:                                              ; preds = %191, %95
  br label %201, !dbg !2510

201:                                              ; preds = %200, %81
  br label %202, !dbg !2511

202:                                              ; preds = %201, %58
  br label %203, !dbg !2512

203:                                              ; preds = %202, %188
  %204 = load i32, ptr %2, align 4, !dbg !2513
  %205 = add nsw i32 %204, 1, !dbg !2513
  store i32 %205, ptr %2, align 4, !dbg !2513
  br label %16, !dbg !2514, !llvm.loop !2515

206:                                              ; preds = %16
  br label %207, !dbg !2516

207:                                              ; preds = %206
  %208 = load ptr, ptr %3, align 8, !dbg !2517
  %209 = getelementptr inbounds nuw %struct.segment, ptr %208, i32 1, !dbg !2517
  store ptr %209, ptr %3, align 8, !dbg !2517
  %210 = load i32, ptr %1, align 4, !dbg !2518
  %211 = add nsw i32 %210, 1, !dbg !2518
  store i32 %211, ptr %1, align 4, !dbg !2518
  br label %11, !dbg !2519, !llvm.loop !2520

212:                                              ; preds = %11
  store i32 0, ptr @Dont_start_sound_objects, align 4, !dbg !2522
  ret void, !dbg !2523
}

declare void @_Z16digi_init_soundsv() #1

declare noundef i32 @_Z15wall_is_doorwayP7segmenti(ptr noundef, i32 noundef) #1

declare noundef i32 @_Z17find_connect_sideP7segmentS0_(ptr noundef, ptr noundef) #1

declare void @_Z28compute_center_point_on_sideP10vms_vectorP7segmenti(ptr noundef, ptr noundef, i32 noundef) #1

declare noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef, i16 noundef signext, i16 noundef signext, ptr noundef, i32 noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z31create_player_appearance_effectP6object(ptr noundef %0) #0 !dbg !2524 {
  %2 = alloca ptr, align 8
  %3 = alloca %struct.vms_vector, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2648, !DIExpression(), !2649)
    #dbg_declare(ptr %3, !2650, !DIExpression(), !2651)
    #dbg_declare(ptr %4, !2652, !DIExpression(), !2653)
    #dbg_declare(ptr %5, !2654, !DIExpression(), !2656)
  %6 = load ptr, ptr %2, align 8, !dbg !2657
  %7 = ptrtoint ptr %6 to i64, !dbg !2658
  %8 = sub i64 %7, ptrtoint (ptr @Objects to i64), !dbg !2658
  %9 = sdiv exact i64 %8, 268, !dbg !2658
  %10 = trunc i64 %9 to i32, !dbg !2657
  store i32 %10, ptr %5, align 4, !dbg !2656
  %11 = load i32, ptr %5, align 4, !dbg !2659
  %12 = icmp slt i32 %11, 0, !dbg !2661
  br i1 %12, label %17, label %13, !dbg !2662

13:                                               ; preds = %1
  %14 = load i32, ptr %5, align 4, !dbg !2663
  %15 = load i32, ptr @Highest_object_index, align 4, !dbg !2664
  %16 = icmp sgt i32 %14, %15, !dbg !2665
  br i1 %16, label %17, label %18, !dbg !2662

17:                                               ; preds = %13, %1
  call void @_Z4Int3v(), !dbg !2666
  br label %18, !dbg !2666

18:                                               ; preds = %17, %13
  %19 = load ptr, ptr %2, align 8, !dbg !2667
  %20 = load ptr, ptr @Viewer, align 8, !dbg !2669
  %21 = icmp eq ptr %19, %20, !dbg !2670
  br i1 %21, label %22, label %34, !dbg !2670

22:                                               ; preds = %18
  %23 = load ptr, ptr %2, align 8, !dbg !2671
  %24 = getelementptr inbounds nuw %struct.object, ptr %23, i32 0, i32 11, !dbg !2672
  %25 = load ptr, ptr %2, align 8, !dbg !2673
  %26 = getelementptr inbounds nuw %struct.object, ptr %25, i32 0, i32 12, !dbg !2674
  %27 = getelementptr inbounds nuw %struct.vms_matrix, ptr %26, i32 0, i32 2, !dbg !2675
  %28 = load ptr, ptr %2, align 8, !dbg !2676
  %29 = getelementptr inbounds nuw %struct.object, ptr %28, i32 0, i32 13, !dbg !2677
  %30 = load i32, ptr %29, align 4, !dbg !2677
  %31 = load i32, ptr @flash_dist, align 4, !dbg !2678
  %32 = call i32 @fixmul(i32 noundef %30, i32 noundef %31), !dbg !2679
  %33 = call noundef ptr @_Z16vm_vec_scale_addP10vms_vectorS0_S0_i(ptr noundef %3, ptr noundef %24, ptr noundef %27, i32 noundef %32), !dbg !2680
  br label %37, !dbg !2680

34:                                               ; preds = %18
  %35 = load ptr, ptr %2, align 8, !dbg !2681
  %36 = getelementptr inbounds nuw %struct.object, ptr %35, i32 0, i32 11, !dbg !2682
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %3, ptr align 4 %36, i64 12, i1 false), !dbg !2683
  br label %37

37:                                               ; preds = %34, %22
  %38 = load ptr, ptr %2, align 8, !dbg !2684
  %39 = getelementptr inbounds nuw %struct.object, ptr %38, i32 0, i32 9, !dbg !2685
  %40 = load i16, ptr %39, align 2, !dbg !2685
  %41 = load ptr, ptr %2, align 8, !dbg !2686
  %42 = getelementptr inbounds nuw %struct.object, ptr %41, i32 0, i32 13, !dbg !2687
  %43 = load i32, ptr %42, align 4, !dbg !2687
  %44 = call noundef ptr @_Z23object_create_explosionsP10vms_vectorii(i16 noundef signext %40, ptr noundef %3, i32 noundef %43, i32 noundef 61), !dbg !2688
  store ptr %44, ptr %4, align 8, !dbg !2689
  %45 = load ptr, ptr %4, align 8, !dbg !2690
  %46 = icmp ne ptr %45, null, !dbg !2690
  br i1 %46, label %47, label %65, !dbg !2690

47:                                               ; preds = %37
  %48 = load ptr, ptr %2, align 8, !dbg !2692
  %49 = getelementptr inbounds nuw %struct.object, ptr %48, i32 0, i32 12, !dbg !2694
  %50 = load ptr, ptr %4, align 8, !dbg !2695
  %51 = getelementptr inbounds nuw %struct.object, ptr %50, i32 0, i32 12, !dbg !2696
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %51, ptr align 4 %49, i64 36, i1 false), !dbg !2697
  %52 = load i16, ptr getelementptr inbounds nuw (%struct.vclip, ptr getelementptr inbounds ([110 x %struct.vclip], ptr @Vclip, i64 0, i64 61), i32 0, i32 4), align 4, !dbg !2698
  %53 = sext i16 %52 to i32, !dbg !2700
  %54 = icmp sgt i32 %53, -1, !dbg !2701
  br i1 %54, label %55, label %64, !dbg !2701

55:                                               ; preds = %47
  %56 = load i16, ptr getelementptr inbounds nuw (%struct.vclip, ptr getelementptr inbounds ([110 x %struct.vclip], ptr @Vclip, i64 0, i64 61), i32 0, i32 4), align 4, !dbg !2702
  %57 = sext i16 %56 to i32, !dbg !2703
  %58 = load ptr, ptr %4, align 8, !dbg !2704
  %59 = ptrtoint ptr %58 to i64, !dbg !2705
  %60 = sub i64 %59, ptrtoint (ptr @Objects to i64), !dbg !2705
  %61 = sdiv exact i64 %60, 268, !dbg !2705
  %62 = trunc i64 %61 to i16, !dbg !2704
  %63 = call noundef i32 @_Z25digi_link_sound_to_objectisii(i32 noundef %57, i16 noundef signext %62, i32 noundef 0, i32 noundef 65536), !dbg !2706
  br label %64, !dbg !2706

64:                                               ; preds = %55, %47
  br label %65, !dbg !2707

65:                                               ; preds = %64, %37
  ret void, !dbg !2708
}

declare void @_Z4Int3v() #1

declare noundef ptr @_Z16vm_vec_scale_addP10vms_vectorS0_S0_i(ptr noundef, ptr noundef, ptr noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr i32 @fixmul(i32 noundef %0, i32 noundef %1) #2 !dbg !2709 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !2712, !DIExpression(), !2713)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !2714, !DIExpression(), !2715)
  %5 = load i32, ptr %3, align 4, !dbg !2716
  %6 = sext i32 %5 to i64, !dbg !2716
  %7 = load i32, ptr %4, align 4, !dbg !2717
  %8 = sext i32 %7 to i64, !dbg !2717
  %9 = mul nsw i64 %6, %8, !dbg !2718
  %10 = ashr i64 %9, 16, !dbg !2719
  %11 = trunc i64 %10 to i32, !dbg !2720
  ret i32 %11, !dbg !2721
}

declare noundef ptr @_Z23object_create_explosionsP10vms_vectorii(i16 noundef signext, ptr noundef, i32 noundef, i32 noundef) #1

declare noundef i32 @_Z25digi_link_sound_to_objectisii(i32 noundef, i16 noundef signext, i32 noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z17MakeNewPlayerFilei(i32 noundef %0) #0 !dbg !2722 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca [14 x i8], align 1
  %6 = alloca %struct.newmenu_item, align 8
  %7 = alloca [9 x i8], align 1
  %8 = alloca ptr, align 8
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !2723, !DIExpression(), !2724)
    #dbg_declare(ptr %4, !2725, !DIExpression(), !2726)
    #dbg_declare(ptr %5, !2727, !DIExpression(), !2729)
    #dbg_declare(ptr %6, !2730, !DIExpression(), !2752)
    #dbg_declare(ptr %7, !2753, !DIExpression(), !2754)
  call void @llvm.memset.p0.i64(ptr align 1 %7, i8 0, i64 9, i1 false), !dbg !2754
    #dbg_declare(ptr %8, !2755, !DIExpression(), !2756)
  %9 = getelementptr inbounds [9 x i8], ptr %7, i64 0, i64 0, !dbg !2757
  %10 = load i32, ptr @Player_num, align 4, !dbg !2758
  %11 = sext i32 %10 to i64, !dbg !2759
  %12 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %11, !dbg !2759
  %13 = getelementptr inbounds nuw %struct.player, ptr %12, i32 0, i32 0, !dbg !2760
  %14 = getelementptr inbounds [9 x i8], ptr %13, i64 0, i64 0, !dbg !2759
  %15 = call ptr @strncpy(ptr noundef %9, ptr noundef %14, i64 noundef 8) #9, !dbg !2761
  br label %16, !dbg !2761

16:                                               ; preds = %31, %1
    #dbg_label(!2762, !2763)
  %17 = getelementptr inbounds nuw %struct.newmenu_item, ptr %6, i32 0, i32 0, !dbg !2764
  store i32 1, ptr %17, align 8, !dbg !2765
  %18 = getelementptr inbounds nuw %struct.newmenu_item, ptr %6, i32 0, i32 5, !dbg !2766
  store i32 8, ptr %18, align 4, !dbg !2767
  %19 = getelementptr inbounds [9 x i8], ptr %7, i64 0, i64 0, !dbg !2768
  %20 = getelementptr inbounds nuw %struct.newmenu_item, ptr %6, i32 0, i32 6, !dbg !2769
  store ptr %19, ptr %20, align 8, !dbg !2770
  store ptr @playername_allowed_chars, ptr @Newmenu_allowed_chars, align 8, !dbg !2771
  %21 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 442) #9, !dbg !2772
  %22 = load ptr, ptr %21, align 8, !dbg !2772
  %23 = call noundef i32 @_Z10newmenu_doPKcS0_iP12newmenu_itemPFviS2_PiiE(ptr noundef null, ptr noundef %22, i32 noundef 1, ptr noundef %6, ptr noundef null), !dbg !2773
  store i32 %23, ptr %4, align 4, !dbg !2774
  store ptr null, ptr @Newmenu_allowed_chars, align 8, !dbg !2775
  %24 = load i32, ptr %4, align 4, !dbg !2776
  %25 = icmp slt i32 %24, 0, !dbg !2778
  br i1 %25, label %26, label %32, !dbg !2778

26:                                               ; preds = %16
  %27 = load i32, ptr %3, align 4, !dbg !2779
  %28 = icmp ne i32 %27, 0, !dbg !2779
  br i1 %28, label %29, label %30, !dbg !2779

29:                                               ; preds = %26
  store i32 0, ptr %2, align 4, !dbg !2782
  br label %70, !dbg !2782

30:                                               ; preds = %26
  br label %31, !dbg !2783

31:                                               ; preds = %30, %37, %46, %60
  br label %16, !dbg !2764

32:                                               ; preds = %16
  %33 = getelementptr inbounds [9 x i8], ptr %7, i64 0, i64 0, !dbg !2784
  %34 = load i8, ptr %33, align 1, !dbg !2784
  %35 = sext i8 %34 to i32, !dbg !2784
  %36 = icmp eq i32 %35, 0, !dbg !2786
  br i1 %36, label %37, label %38, !dbg !2786

37:                                               ; preds = %32
  br label %31, !dbg !2787

38:                                               ; preds = %32
  %39 = getelementptr inbounds [14 x i8], ptr %5, i64 0, i64 0, !dbg !2788
  %40 = getelementptr inbounds [9 x i8], ptr %7, i64 0, i64 0, !dbg !2789
  %41 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %39, ptr noundef @.str.6, ptr noundef %40) #9, !dbg !2790
  %42 = getelementptr inbounds [14 x i8], ptr %5, i64 0, i64 0, !dbg !2791
  %43 = call ptr @"\01_fopen"(ptr noundef %42, ptr noundef @.str.7), !dbg !2792
  store ptr %43, ptr %8, align 8, !dbg !2793
  %44 = load ptr, ptr %8, align 8, !dbg !2794
  %45 = icmp ne ptr %44, null, !dbg !2794
  br i1 %45, label %46, label %57, !dbg !2794

46:                                               ; preds = %38
  %47 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 34) #9, !dbg !2796
  %48 = load ptr, ptr %47, align 8, !dbg !2796
  %49 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 443) #9, !dbg !2798
  %50 = load ptr, ptr %49, align 8, !dbg !2798
  %51 = getelementptr inbounds [9 x i8], ptr %7, i64 0, i64 0, !dbg !2799
  %52 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 444) #9, !dbg !2800
  %53 = load ptr, ptr %52, align 8, !dbg !2800
  %54 = call noundef i32 (ptr, i32, ...) @_Z13nm_messageboxPKciz(ptr noundef null, i32 noundef 1, ptr noundef %48, ptr noundef @.str.8, ptr noundef %50, ptr noundef %51, ptr noundef %53), !dbg !2801
  %55 = load ptr, ptr %8, align 8, !dbg !2802
  %56 = call i32 @fclose(ptr noundef %55), !dbg !2803
  br label %31, !dbg !2804

57:                                               ; preds = %38
  %58 = call noundef i32 @_Z17new_player_configv(), !dbg !2805
  %59 = icmp ne i32 %58, 0, !dbg !2805
  br i1 %59, label %61, label %60, !dbg !2807

60:                                               ; preds = %57
  br label %31, !dbg !2808

61:                                               ; preds = %57
  %62 = load i32, ptr @Player_num, align 4, !dbg !2809
  %63 = sext i32 %62 to i64, !dbg !2810
  %64 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %63, !dbg !2810
  %65 = getelementptr inbounds nuw %struct.player, ptr %64, i32 0, i32 0, !dbg !2811
  %66 = getelementptr inbounds [9 x i8], ptr %65, i64 0, i64 0, !dbg !2810
  %67 = getelementptr inbounds [9 x i8], ptr %7, i64 0, i64 0, !dbg !2812
  %68 = call ptr @strncpy(ptr noundef %66, ptr noundef %67, i64 noundef 8) #9, !dbg !2813
  %69 = call noundef i32 @_Z17write_player_filev(), !dbg !2814
  store i32 1, ptr %2, align 4, !dbg !2815
  br label %70, !dbg !2815

70:                                               ; preds = %61, %29
  %71 = load i32, ptr %2, align 4, !dbg !2816
  ret i32 %71, !dbg !2816
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare ptr @strncpy(ptr noundef, ptr noundef, i64 noundef) #6

declare noundef i32 @_Z10newmenu_doPKcS0_iP12newmenu_itemPFviS2_PiiE(ptr noundef, ptr noundef, i32 noundef, ptr noundef, ptr noundef) #1

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1) #2 !dbg !2817 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !3170, !DIExpression(), !3172)
  store i64 %1, ptr %4, align 8
    #dbg_declare(ptr %4, !3173, !DIExpression(), !3174)
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds nuw %"class.std::__1::vector", ptr %5, i32 0, i32 0, !dbg !3175
  %7 = load ptr, ptr %6, align 8, !dbg !3175
  %8 = load i64, ptr %4, align 8, !dbg !3176
  %9 = getelementptr inbounds nuw ptr, ptr %7, i64 %8, !dbg !3177
  ret ptr %9, !dbg !3178
}

; Function Attrs: nounwind
declare i32 @sprintf(ptr noundef, ptr noundef, ...) #6

declare ptr @"\01_fopen"(ptr noundef, ptr noundef) #1

declare noundef i32 @_Z13nm_messageboxPKciz(ptr noundef, i32 noundef, ...) #1

declare i32 @fclose(ptr noundef) #1

declare noundef i32 @_Z17new_player_configv() #1

declare noundef i32 @_Z17write_player_filev() #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z14RegisterPlayerv() #0 !dbg !3179 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca [14 x i8], align 1
  %4 = alloca i32, align 4
    #dbg_declare(ptr %1, !3180, !DIExpression(), !3181)
    #dbg_declare(ptr %2, !3182, !DIExpression(), !3183)
    #dbg_declare(ptr %3, !3184, !DIExpression(), !3185)
    #dbg_declare(ptr %4, !3186, !DIExpression(), !3187)
  store i32 1, ptr %4, align 4, !dbg !3187
  %5 = load i32, ptr @Player_num, align 4, !dbg !3188
  %6 = sext i32 %5 to i64, !dbg !3190
  %7 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %6, !dbg !3190
  %8 = getelementptr inbounds nuw %struct.player, ptr %7, i32 0, i32 0, !dbg !3191
  %9 = getelementptr inbounds [9 x i8], ptr %8, i64 0, i64 0, !dbg !3190
  %10 = load i8, ptr %9, align 4, !dbg !3190
  %11 = sext i8 %10 to i32, !dbg !3190
  %12 = icmp eq i32 %11, 0, !dbg !3192
  br i1 %12, label %13, label %54, !dbg !3192

13:                                               ; preds = %0
  store i8 8, ptr @Config_joystick_sensitivity, align 1, !dbg !3193
  store i8 0, ptr @Config_control_type, align 1, !dbg !3195
  store i32 0, ptr %1, align 4, !dbg !3196
  br label %14, !dbg !3198

14:                                               ; preds = %39, %13
  %15 = load i32, ptr %1, align 4, !dbg !3199
  %16 = icmp slt i32 %15, 8, !dbg !3201
  br i1 %16, label %17, label %42, !dbg !3202

17:                                               ; preds = %14
  store i32 0, ptr %2, align 4, !dbg !3203
  br label %18, !dbg !3205

18:                                               ; preds = %35, %17
  %19 = load i32, ptr %2, align 4, !dbg !3206
  %20 = icmp slt i32 %19, 60, !dbg !3208
  br i1 %20, label %21, label %38, !dbg !3209

21:                                               ; preds = %18
  %22 = load i32, ptr %1, align 4, !dbg !3210
  %23 = sext i32 %22 to i64, !dbg !3211
  %24 = getelementptr inbounds [8 x [60 x i8]], ptr @default_kconfig_settings, i64 0, i64 %23, !dbg !3211
  %25 = load i32, ptr %2, align 4, !dbg !3212
  %26 = sext i32 %25 to i64, !dbg !3211
  %27 = getelementptr inbounds [60 x i8], ptr %24, i64 0, i64 %26, !dbg !3211
  %28 = load i8, ptr %27, align 1, !dbg !3211
  %29 = load i32, ptr %1, align 4, !dbg !3213
  %30 = sext i32 %29 to i64, !dbg !3214
  %31 = getelementptr inbounds [8 x [60 x i8]], ptr @kconfig_settings, i64 0, i64 %30, !dbg !3214
  %32 = load i32, ptr %2, align 4, !dbg !3215
  %33 = sext i32 %32 to i64, !dbg !3214
  %34 = getelementptr inbounds [60 x i8], ptr %31, i64 0, i64 %33, !dbg !3214
  store i8 %28, ptr %34, align 1, !dbg !3216
  br label %35, !dbg !3214

35:                                               ; preds = %21
  %36 = load i32, ptr %2, align 4, !dbg !3217
  %37 = add nsw i32 %36, 1, !dbg !3217
  store i32 %37, ptr %2, align 4, !dbg !3217
  br label %18, !dbg !3218, !llvm.loop !3219

38:                                               ; preds = %18
  br label %39, !dbg !3220

39:                                               ; preds = %38
  %40 = load i32, ptr %1, align 4, !dbg !3221
  %41 = add nsw i32 %40, 1, !dbg !3221
  store i32 %41, ptr %1, align 4, !dbg !3221
  br label %14, !dbg !3222, !llvm.loop !3223

42:                                               ; preds = %14
  call void @_Z15kc_set_controlsv(), !dbg !3225
  %43 = load i32, ptr @Player_num, align 4, !dbg !3226
  %44 = sext i32 %43 to i64, !dbg !3227
  %45 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %44, !dbg !3227
  %46 = getelementptr inbounds nuw %struct.player, ptr %45, i32 0, i32 0, !dbg !3228
  %47 = getelementptr inbounds [9 x i8], ptr %46, i64 0, i64 0, !dbg !3227
  %48 = call ptr @strncpy(ptr noundef %47, ptr noundef @config_last_player, i64 noundef 8) #9, !dbg !3229
  %49 = load i8, ptr @config_last_player, align 1, !dbg !3230
  %50 = sext i8 %49 to i32, !dbg !3230
  %51 = icmp eq i32 %50, 0, !dbg !3232
  br i1 %51, label %52, label %53, !dbg !3232

52:                                               ; preds = %42
  store i32 0, ptr %4, align 4, !dbg !3233
  br label %53, !dbg !3234

53:                                               ; preds = %52, %42
  br label %54, !dbg !3235

54:                                               ; preds = %53, %0
  br label %55, !dbg !3236

55:                                               ; preds = %63, %54
    #dbg_label(!3237, !3238)
  %56 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 441) #9, !dbg !3239
  %57 = load ptr, ptr %56, align 8, !dbg !3239
  %58 = getelementptr inbounds [14 x i8], ptr %3, i64 0, i64 0, !dbg !3241
  %59 = load i32, ptr %4, align 4, !dbg !3242
  %60 = call noundef i32 @_Z20newmenu_get_filenamePKcS0_Pci(ptr noundef %57, ptr noundef @.str.9, ptr noundef %58, i32 noundef %59), !dbg !3243
  %61 = icmp ne i32 %60, 0, !dbg !3243
  br i1 %61, label %64, label %62, !dbg !3244

62:                                               ; preds = %55
  br label %63, !dbg !3245

63:                                               ; preds = %62, %73, %86
  br label %55, !dbg !3239

64:                                               ; preds = %55
  %65 = getelementptr inbounds [14 x i8], ptr %3, i64 0, i64 0, !dbg !3247
  %66 = load i8, ptr %65, align 1, !dbg !3247
  %67 = sext i8 %66 to i32, !dbg !3247
  %68 = icmp eq i32 %67, 60, !dbg !3249
  br i1 %68, label %69, label %75, !dbg !3249

69:                                               ; preds = %64
  %70 = load i32, ptr %4, align 4, !dbg !3250
  %71 = call noundef i32 @_Z17MakeNewPlayerFilei(i32 noundef %70), !dbg !3253
  %72 = icmp ne i32 %71, 0, !dbg !3253
  br i1 %72, label %74, label %73, !dbg !3254

73:                                               ; preds = %69
  br label %63, !dbg !3255

74:                                               ; preds = %69
  br label %83, !dbg !3256

75:                                               ; preds = %64
  %76 = load i32, ptr @Player_num, align 4, !dbg !3257
  %77 = sext i32 %76 to i64, !dbg !3259
  %78 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %77, !dbg !3259
  %79 = getelementptr inbounds nuw %struct.player, ptr %78, i32 0, i32 0, !dbg !3260
  %80 = getelementptr inbounds [9 x i8], ptr %79, i64 0, i64 0, !dbg !3259
  %81 = getelementptr inbounds [14 x i8], ptr %3, i64 0, i64 0, !dbg !3261
  %82 = call ptr @strncpy(ptr noundef %80, ptr noundef %81, i64 noundef 8) #9, !dbg !3262
  br label %83

83:                                               ; preds = %75, %74
  %84 = call noundef i32 @_Z16read_player_filev(), !dbg !3263
  %85 = icmp ne i32 %84, 0, !dbg !3265
  br i1 %85, label %86, label %87, !dbg !3265

86:                                               ; preds = %83
  br label %63, !dbg !3266

87:                                               ; preds = %83
  %88 = load i32, ptr @Default_leveling_on, align 4, !dbg !3267
  store i32 %88, ptr @Auto_leveling_on, align 4, !dbg !3268
  %89 = load i32, ptr @Default_display_mode, align 4, !dbg !3269
  call void @_Z16set_display_modei(i32 noundef %89), !dbg !3270
  %90 = call noundef i32 @_Z15WriteConfigFilev(), !dbg !3271
  ret i32 1, !dbg !3272
}

declare void @_Z15kc_set_controlsv() #1

declare noundef i32 @_Z20newmenu_get_filenamePKcS0_Pci(ptr noundef, ptr noundef, ptr noundef, i32 noundef) #1

declare noundef i32 @_Z16read_player_filev() #1

declare void @_Z16set_display_modei(i32 noundef) #1

declare noundef i32 @_Z15WriteConfigFilev() #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z24load_bitmap_replacementsPc(ptr noundef %0) #0 !dbg !3273 {
  %2 = alloca ptr, align 8
  %3 = alloca [13 x i8], align 1
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca %struct.DiskBitmapHeader, align 4
  %12 = alloca %struct._grs_bitmap, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !3276, !DIExpression(), !3277)
    #dbg_declare(ptr %3, !3278, !DIExpression(), !3279)
    #dbg_declare(ptr %4, !3280, !DIExpression(), !3290)
    #dbg_declare(ptr %5, !3291, !DIExpression(), !3292)
  %13 = load ptr, ptr @Bitmap_replacement_data, align 8, !dbg !3293
  %14 = icmp ne ptr %13, null, !dbg !3293
  br i1 %14, label %15, label %19, !dbg !3293

15:                                               ; preds = %1
  br label %16, !dbg !3295

16:                                               ; preds = %15
  %17 = load ptr, ptr @Bitmap_replacement_data, align 8, !dbg !3297
  call void @_Z9mem_free_Pv(ptr noundef %17), !dbg !3297
  store ptr null, ptr @Bitmap_replacement_data, align 8, !dbg !3297
  br label %18, !dbg !3297

18:                                               ; preds = %16
  store ptr null, ptr @Bitmap_replacement_data, align 8, !dbg !3299
  br label %19, !dbg !3300

19:                                               ; preds = %18, %1
  %20 = getelementptr inbounds [13 x i8], ptr %3, i64 0, i64 0, !dbg !3301
  %21 = load ptr, ptr %2, align 8, !dbg !3302
  call void @_Z25change_filename_extensionPcPKcS1_(ptr noundef %20, ptr noundef %21, ptr noundef @.str.10), !dbg !3303
  %22 = getelementptr inbounds [13 x i8], ptr %3, i64 0, i64 0, !dbg !3304
  %23 = call noundef ptr @_Z6cfopenPKcS0_(ptr noundef %22, ptr noundef @.str.7), !dbg !3305
  store ptr %23, ptr %4, align 8, !dbg !3306
  %24 = load ptr, ptr %4, align 8, !dbg !3307
  %25 = icmp ne ptr %24, null, !dbg !3307
  br i1 %25, label %26, label %220, !dbg !3307

26:                                               ; preds = %19
    #dbg_declare(ptr %6, !3309, !DIExpression(), !3311)
    #dbg_declare(ptr %7, !3312, !DIExpression(), !3313)
    #dbg_declare(ptr %8, !3314, !DIExpression(), !3315)
    #dbg_declare(ptr %9, !3316, !DIExpression(), !3317)
    #dbg_declare(ptr %10, !3318, !DIExpression(), !3319)
  %27 = load ptr, ptr %4, align 8, !dbg !3320
  %28 = call noundef i32 @_Z14cfile_read_intP5CFILE(ptr noundef %27), !dbg !3321
  store i32 %28, ptr %6, align 4, !dbg !3322
  %29 = load ptr, ptr %4, align 8, !dbg !3323
  %30 = call noundef i32 @_Z14cfile_read_intP5CFILE(ptr noundef %29), !dbg !3324
  store i32 %30, ptr %7, align 4, !dbg !3325
  %31 = load i32, ptr %6, align 4, !dbg !3326
  %32 = icmp ne i32 %31, 1196380228, !dbg !3328
  br i1 %32, label %36, label %33, !dbg !3329

33:                                               ; preds = %26
  %34 = load i32, ptr %7, align 4, !dbg !3330
  %35 = icmp ne i32 %34, 1, !dbg !3331
  br i1 %35, label %36, label %38, !dbg !3329

36:                                               ; preds = %33, %26
  %37 = load ptr, ptr %4, align 8, !dbg !3332
  call void @_Z7cfcloseP5CFILE(ptr noundef %37), !dbg !3334
  br label %220, !dbg !3335

38:                                               ; preds = %33
  %39 = load ptr, ptr %4, align 8, !dbg !3336
  %40 = call noundef i32 @_Z14cfile_read_intP5CFILE(ptr noundef %39), !dbg !3337
  store i32 %40, ptr %8, align 4, !dbg !3338
  %41 = load i32, ptr %8, align 4, !dbg !3339
  %42 = sext i32 %41 to i64, !dbg !3339
  %43 = mul i64 %42, 2, !dbg !3339
  %44 = trunc i64 %43 to i32, !dbg !3339
  %45 = call noundef ptr @_Z11mem_malloc_jPKcS0_ii(i32 noundef %44, ptr noundef @.str.11, ptr noundef @.str.1, i32 noundef 1049, i32 noundef 0), !dbg !3339
  store ptr %45, ptr %10, align 8, !dbg !3339
  store i32 0, ptr %5, align 4, !dbg !3340
  br label %46, !dbg !3342

46:                                               ; preds = %57, %38
  %47 = load i32, ptr %5, align 4, !dbg !3343
  %48 = load i32, ptr %8, align 4, !dbg !3345
  %49 = icmp slt i32 %47, %48, !dbg !3346
  br i1 %49, label %50, label %60, !dbg !3347

50:                                               ; preds = %46
  %51 = load ptr, ptr %4, align 8, !dbg !3348
  %52 = call noundef signext i16 @_Z16cfile_read_shortP5CFILE(ptr noundef %51), !dbg !3350
  %53 = load ptr, ptr %10, align 8, !dbg !3351
  %54 = load i32, ptr %5, align 4, !dbg !3352
  %55 = sext i32 %54 to i64, !dbg !3351
  %56 = getelementptr inbounds i16, ptr %53, i64 %55, !dbg !3351
  store i16 %52, ptr %56, align 2, !dbg !3353
  br label %57, !dbg !3354

57:                                               ; preds = %50
  %58 = load i32, ptr %5, align 4, !dbg !3355
  %59 = add nsw i32 %58, 1, !dbg !3355
  store i32 %59, ptr %5, align 4, !dbg !3355
  br label %46, !dbg !3356, !llvm.loop !3357

60:                                               ; preds = %46
  %61 = load ptr, ptr %4, align 8, !dbg !3359
  %62 = call noundef i32 @_Z11cfilelengthP5CFILE(ptr noundef %61), !dbg !3360
  %63 = load ptr, ptr %4, align 8, !dbg !3361
  %64 = call noundef i32 @_Z6cftellP5CFILE(ptr noundef %63), !dbg !3362
  %65 = sub nsw i32 %62, %64, !dbg !3363
  %66 = load i32, ptr %8, align 4, !dbg !3364
  %67 = mul nsw i32 18, %66, !dbg !3365
  %68 = sub nsw i32 %65, %67, !dbg !3366
  store i32 %68, ptr %9, align 4, !dbg !3367
  %69 = load i32, ptr %9, align 4, !dbg !3368
  %70 = sext i32 %69 to i64, !dbg !3368
  %71 = mul i64 %70, 1, !dbg !3368
  %72 = trunc i64 %71 to i32, !dbg !3368
  %73 = call noundef ptr @_Z11mem_malloc_jPKcS0_ii(i32 noundef %72, ptr noundef @.str.12, ptr noundef @.str.1, i32 noundef 1057, i32 noundef 0), !dbg !3368
  store ptr %73, ptr @Bitmap_replacement_data, align 8, !dbg !3368
  store i32 0, ptr %5, align 4, !dbg !3369
  br label %74, !dbg !3371

74:                                               ; preds = %207, %60
  %75 = load i32, ptr %5, align 4, !dbg !3372
  %76 = load i32, ptr %8, align 4, !dbg !3374
  %77 = icmp slt i32 %75, %76, !dbg !3375
  br i1 %77, label %78, label %210, !dbg !3376

78:                                               ; preds = %74
    #dbg_declare(ptr %11, !3377, !DIExpression(), !3391)
    #dbg_declare(ptr %12, !3392, !DIExpression(), !3408)
  %79 = getelementptr inbounds nuw %struct.DiskBitmapHeader, ptr %11, i32 0, i32 0, !dbg !3409
  %80 = getelementptr inbounds [8 x i8], ptr %79, i64 0, i64 0, !dbg !3410
  %81 = load ptr, ptr %4, align 8, !dbg !3411
  %82 = call noundef i64 @_Z6cfreadPvmmP5CFILE(ptr noundef %80, i64 noundef 8, i64 noundef 1, ptr noundef %81), !dbg !3412
  %83 = load ptr, ptr %4, align 8, !dbg !3413
  %84 = call noundef zeroext i8 @_Z15cfile_read_byteP5CFILE(ptr noundef %83), !dbg !3414
  %85 = getelementptr inbounds nuw %struct.DiskBitmapHeader, ptr %11, i32 0, i32 1, !dbg !3415
  store i8 %84, ptr %85, align 4, !dbg !3416
  %86 = load ptr, ptr %4, align 8, !dbg !3417
  %87 = call noundef zeroext i8 @_Z15cfile_read_byteP5CFILE(ptr noundef %86), !dbg !3418
  %88 = getelementptr inbounds nuw %struct.DiskBitmapHeader, ptr %11, i32 0, i32 2, !dbg !3419
  store i8 %87, ptr %88, align 1, !dbg !3420
  %89 = load ptr, ptr %4, align 8, !dbg !3421
  %90 = call noundef zeroext i8 @_Z15cfile_read_byteP5CFILE(ptr noundef %89), !dbg !3422
  %91 = getelementptr inbounds nuw %struct.DiskBitmapHeader, ptr %11, i32 0, i32 3, !dbg !3423
  store i8 %90, ptr %91, align 2, !dbg !3424
  %92 = load ptr, ptr %4, align 8, !dbg !3425
  %93 = call noundef zeroext i8 @_Z15cfile_read_byteP5CFILE(ptr noundef %92), !dbg !3426
  %94 = getelementptr inbounds nuw %struct.DiskBitmapHeader, ptr %11, i32 0, i32 4, !dbg !3427
  store i8 %93, ptr %94, align 1, !dbg !3428
  %95 = load ptr, ptr %4, align 8, !dbg !3429
  %96 = call noundef zeroext i8 @_Z15cfile_read_byteP5CFILE(ptr noundef %95), !dbg !3430
  %97 = getelementptr inbounds nuw %struct.DiskBitmapHeader, ptr %11, i32 0, i32 5, !dbg !3431
  store i8 %96, ptr %97, align 4, !dbg !3432
  %98 = load ptr, ptr %4, align 8, !dbg !3433
  %99 = call noundef zeroext i8 @_Z15cfile_read_byteP5CFILE(ptr noundef %98), !dbg !3434
  %100 = getelementptr inbounds nuw %struct.DiskBitmapHeader, ptr %11, i32 0, i32 6, !dbg !3435
  store i8 %99, ptr %100, align 1, !dbg !3436
  %101 = load ptr, ptr %4, align 8, !dbg !3437
  %102 = call noundef i32 @_Z14cfile_read_intP5CFILE(ptr noundef %101), !dbg !3438
  %103 = getelementptr inbounds nuw %struct.DiskBitmapHeader, ptr %11, i32 0, i32 7, !dbg !3439
  store i32 %102, ptr %103, align 4, !dbg !3440
  call void @llvm.memset.p0.i64(ptr align 8 %12, i8 0, i64 32, i1 false), !dbg !3441
  %104 = getelementptr inbounds nuw %struct.DiskBitmapHeader, ptr %11, i32 0, i32 2, !dbg !3442
  %105 = load i8, ptr %104, align 1, !dbg !3442
  %106 = zext i8 %105 to i32, !dbg !3443
  %107 = getelementptr inbounds nuw %struct.DiskBitmapHeader, ptr %11, i32 0, i32 4, !dbg !3444
  %108 = load i8, ptr %107, align 1, !dbg !3444
  %109 = zext i8 %108 to i32, !dbg !3445
  %110 = and i32 %109, 15, !dbg !3446
  %111 = trunc i32 %110 to i16, !dbg !3447
  %112 = sext i16 %111 to i32, !dbg !3448
  %113 = shl i32 %112, 8, !dbg !3449
  %114 = add nsw i32 %106, %113, !dbg !3450
  %115 = trunc i32 %114 to i16, !dbg !3443
  %116 = getelementptr inbounds nuw %struct._grs_bitmap, ptr %12, i32 0, i32 6, !dbg !3451
  store i16 %115, ptr %116, align 2, !dbg !3452
  %117 = getelementptr inbounds nuw %struct._grs_bitmap, ptr %12, i32 0, i32 2, !dbg !3453
  store i16 %115, ptr %117, align 4, !dbg !3454
  %118 = getelementptr inbounds nuw %struct.DiskBitmapHeader, ptr %11, i32 0, i32 3, !dbg !3455
  %119 = load i8, ptr %118, align 2, !dbg !3455
  %120 = zext i8 %119 to i32, !dbg !3456
  %121 = getelementptr inbounds nuw %struct.DiskBitmapHeader, ptr %11, i32 0, i32 4, !dbg !3457
  %122 = load i8, ptr %121, align 1, !dbg !3457
  %123 = zext i8 %122 to i32, !dbg !3458
  %124 = and i32 %123, 240, !dbg !3459
  %125 = trunc i32 %124 to i16, !dbg !3460
  %126 = sext i16 %125 to i32, !dbg !3461
  %127 = shl i32 %126, 4, !dbg !3462
  %128 = add nsw i32 %120, %127, !dbg !3463
  %129 = trunc i32 %128 to i16, !dbg !3456
  %130 = getelementptr inbounds nuw %struct._grs_bitmap, ptr %12, i32 0, i32 3, !dbg !3464
  store i16 %129, ptr %130, align 2, !dbg !3465
  %131 = getelementptr inbounds nuw %struct.DiskBitmapHeader, ptr %11, i32 0, i32 6, !dbg !3466
  %132 = load i8, ptr %131, align 1, !dbg !3466
  %133 = getelementptr inbounds nuw %struct._grs_bitmap, ptr %12, i32 0, i32 9, !dbg !3467
  store i8 %132, ptr %133, align 2, !dbg !3468
  %134 = load ptr, ptr @Bitmap_replacement_data, align 8, !dbg !3469
  %135 = getelementptr inbounds nuw %struct.DiskBitmapHeader, ptr %11, i32 0, i32 7, !dbg !3470
  %136 = load i32, ptr %135, align 4, !dbg !3470
  %137 = sext i32 %136 to i64, !dbg !3471
  %138 = getelementptr inbounds i8, ptr %134, i64 %137, !dbg !3471
  %139 = getelementptr inbounds nuw %struct._grs_bitmap, ptr %12, i32 0, i32 7, !dbg !3472
  store ptr %138, ptr %139, align 8, !dbg !3473
  %140 = getelementptr inbounds nuw %struct.DiskBitmapHeader, ptr %11, i32 0, i32 5, !dbg !3474
  %141 = load i8, ptr %140, align 4, !dbg !3474
  %142 = zext i8 %141 to i32, !dbg !3476
  %143 = and i32 %142, 1, !dbg !3477
  %144 = icmp ne i32 %143, 0, !dbg !3476
  br i1 %144, label %145, label %151, !dbg !3476

145:                                              ; preds = %78
  %146 = getelementptr inbounds nuw %struct._grs_bitmap, ptr %12, i32 0, i32 5, !dbg !3478
  %147 = load i8, ptr %146, align 1, !dbg !3479
  %148 = sext i8 %147 to i32, !dbg !3479
  %149 = or i32 %148, 1, !dbg !3479
  %150 = trunc i32 %149 to i8, !dbg !3479
  store i8 %150, ptr %146, align 1, !dbg !3479
  br label %151, !dbg !3480

151:                                              ; preds = %145, %78
  %152 = getelementptr inbounds nuw %struct.DiskBitmapHeader, ptr %11, i32 0, i32 5, !dbg !3481
  %153 = load i8, ptr %152, align 4, !dbg !3481
  %154 = zext i8 %153 to i32, !dbg !3483
  %155 = and i32 %154, 2, !dbg !3484
  %156 = icmp ne i32 %155, 0, !dbg !3483
  br i1 %156, label %157, label %163, !dbg !3483

157:                                              ; preds = %151
  %158 = getelementptr inbounds nuw %struct._grs_bitmap, ptr %12, i32 0, i32 5, !dbg !3485
  %159 = load i8, ptr %158, align 1, !dbg !3486
  %160 = sext i8 %159 to i32, !dbg !3486
  %161 = or i32 %160, 2, !dbg !3486
  %162 = trunc i32 %161 to i8, !dbg !3486
  store i8 %162, ptr %158, align 1, !dbg !3486
  br label %163, !dbg !3487

163:                                              ; preds = %157, %151
  %164 = getelementptr inbounds nuw %struct.DiskBitmapHeader, ptr %11, i32 0, i32 5, !dbg !3488
  %165 = load i8, ptr %164, align 4, !dbg !3488
  %166 = zext i8 %165 to i32, !dbg !3490
  %167 = and i32 %166, 4, !dbg !3491
  %168 = icmp ne i32 %167, 0, !dbg !3490
  br i1 %168, label %169, label %175, !dbg !3490

169:                                              ; preds = %163
  %170 = getelementptr inbounds nuw %struct._grs_bitmap, ptr %12, i32 0, i32 5, !dbg !3492
  %171 = load i8, ptr %170, align 1, !dbg !3493
  %172 = sext i8 %171 to i32, !dbg !3493
  %173 = or i32 %172, 4, !dbg !3493
  %174 = trunc i32 %173 to i8, !dbg !3493
  store i8 %174, ptr %170, align 1, !dbg !3493
  br label %175, !dbg !3494

175:                                              ; preds = %169, %163
  %176 = getelementptr inbounds nuw %struct.DiskBitmapHeader, ptr %11, i32 0, i32 5, !dbg !3495
  %177 = load i8, ptr %176, align 4, !dbg !3495
  %178 = zext i8 %177 to i32, !dbg !3497
  %179 = and i32 %178, 8, !dbg !3498
  %180 = icmp ne i32 %179, 0, !dbg !3497
  br i1 %180, label %181, label %187, !dbg !3497

181:                                              ; preds = %175
  %182 = getelementptr inbounds nuw %struct._grs_bitmap, ptr %12, i32 0, i32 5, !dbg !3499
  %183 = load i8, ptr %182, align 1, !dbg !3500
  %184 = sext i8 %183 to i32, !dbg !3500
  %185 = or i32 %184, 8, !dbg !3500
  %186 = trunc i32 %185 to i8, !dbg !3500
  store i8 %186, ptr %182, align 1, !dbg !3500
  br label %187, !dbg !3501

187:                                              ; preds = %181, %175
  %188 = getelementptr inbounds nuw %struct.DiskBitmapHeader, ptr %11, i32 0, i32 5, !dbg !3502
  %189 = load i8, ptr %188, align 4, !dbg !3502
  %190 = zext i8 %189 to i32, !dbg !3504
  %191 = and i32 %190, 32, !dbg !3505
  %192 = icmp ne i32 %191, 0, !dbg !3504
  br i1 %192, label %193, label %199, !dbg !3504

193:                                              ; preds = %187
  %194 = getelementptr inbounds nuw %struct._grs_bitmap, ptr %12, i32 0, i32 5, !dbg !3506
  %195 = load i8, ptr %194, align 1, !dbg !3507
  %196 = sext i8 %195 to i32, !dbg !3507
  %197 = or i32 %196, 32, !dbg !3507
  %198 = trunc i32 %197 to i8, !dbg !3507
  store i8 %198, ptr %194, align 1, !dbg !3507
  br label %199, !dbg !3508

199:                                              ; preds = %193, %187
  %200 = load ptr, ptr %10, align 8, !dbg !3509
  %201 = load i32, ptr %5, align 4, !dbg !3510
  %202 = sext i32 %201 to i64, !dbg !3509
  %203 = getelementptr inbounds i16, ptr %200, i64 %202, !dbg !3509
  %204 = load i16, ptr %203, align 2, !dbg !3509
  %205 = zext i16 %204 to i64, !dbg !3511
  %206 = getelementptr inbounds nuw [2620 x %struct._grs_bitmap], ptr @GameBitmaps, i64 0, i64 %205, !dbg !3511
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %206, ptr align 8 %12, i64 32, i1 false), !dbg !3512
  br label %207, !dbg !3513

207:                                              ; preds = %199
  %208 = load i32, ptr %5, align 4, !dbg !3514
  %209 = add nsw i32 %208, 1, !dbg !3514
  store i32 %209, ptr %5, align 4, !dbg !3514
  br label %74, !dbg !3515, !llvm.loop !3516

210:                                              ; preds = %74
  %211 = load ptr, ptr @Bitmap_replacement_data, align 8, !dbg !3518
  %212 = load i32, ptr %9, align 4, !dbg !3519
  %213 = sext i32 %212 to i64, !dbg !3519
  %214 = load ptr, ptr %4, align 8, !dbg !3520
  %215 = call noundef i64 @_Z6cfreadPvmmP5CFILE(ptr noundef %211, i64 noundef 1, i64 noundef %213, ptr noundef %214), !dbg !3521
  br label %216, !dbg !3522

216:                                              ; preds = %210
  %217 = load ptr, ptr %10, align 8, !dbg !3523
  call void @_Z9mem_free_Pv(ptr noundef %217), !dbg !3523
  store ptr null, ptr %10, align 8, !dbg !3523
  br label %218, !dbg !3523

218:                                              ; preds = %216
  %219 = load ptr, ptr %4, align 8, !dbg !3525
  call void @_Z7cfcloseP5CFILE(ptr noundef %219), !dbg !3526
  store i8 0, ptr @last_palette_loaded_pig, align 1, !dbg !3527
  call void @_Z14texmerge_flushv(), !dbg !3528
  br label %220, !dbg !3529

220:                                              ; preds = %36, %218, %19
  ret void, !dbg !3530
}

declare void @_Z9mem_free_Pv(ptr noundef) #1

declare void @_Z25change_filename_extensionPcPKcS1_(ptr noundef, ptr noundef, ptr noundef) #1

declare noundef ptr @_Z6cfopenPKcS0_(ptr noundef, ptr noundef) #1

declare noundef i32 @_Z14cfile_read_intP5CFILE(ptr noundef) #1

declare void @_Z7cfcloseP5CFILE(ptr noundef) #1

declare noundef ptr @_Z11mem_malloc_jPKcS0_ii(i32 noundef, ptr noundef, ptr noundef, i32 noundef, i32 noundef) #1

declare noundef signext i16 @_Z16cfile_read_shortP5CFILE(ptr noundef) #1

declare noundef i32 @_Z11cfilelengthP5CFILE(ptr noundef) #1

declare noundef i32 @_Z6cftellP5CFILE(ptr noundef) #1

declare noundef i64 @_Z6cfreadPvmmP5CFILE(ptr noundef, i64 noundef, i64 noundef, ptr noundef) #1

declare noundef zeroext i8 @_Z15cfile_read_byteP5CFILE(ptr noundef) #1

declare void @_Z14texmerge_flushv() #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z9LoadLevelii(i32 noundef %0, i32 noundef %1) #0 !dbg !3531 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca %struct.player, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !3534, !DIExpression(), !3535)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !3536, !DIExpression(), !3537)
    #dbg_declare(ptr %5, !3538, !DIExpression(), !3539)
    #dbg_declare(ptr %6, !3540, !DIExpression(), !3541)
    #dbg_declare(ptr %7, !3542, !DIExpression(), !3543)
  %8 = load i32, ptr @Player_num, align 4, !dbg !3544
  %9 = sext i32 %8 to i64, !dbg !3545
  %10 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %9, !dbg !3545
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %6, ptr align 4 %10, i64 148, i1 false), !dbg !3546
  %11 = load i32, ptr %3, align 4, !dbg !3547
  %12 = load i32, ptr @Last_level, align 4, !dbg !3547
  %13 = icmp sle i32 %11, %12, !dbg !3547
  br i1 %13, label %14, label %21, !dbg !3547

14:                                               ; preds = %2
  %15 = load i32, ptr %3, align 4, !dbg !3547
  %16 = load i32, ptr @Last_secret_level, align 4, !dbg !3547
  %17 = icmp sge i32 %15, %16, !dbg !3547
  br i1 %17, label %18, label %21, !dbg !3547

18:                                               ; preds = %14
  %19 = load i32, ptr %3, align 4, !dbg !3547
  %20 = icmp ne i32 %19, 0, !dbg !3547
  br label %21

21:                                               ; preds = %18, %14, %2
  %22 = phi i1 [ false, %14 ], [ false, %2 ], [ %20, %18 ], !dbg !3548
  %23 = zext i1 %22 to i32, !dbg !3547
  call void @_Z7_AssertiPKcS0_i(i32 noundef %23, ptr noundef @.str.13, ptr noundef @.str.1, i32 noundef 1115), !dbg !3547
  %24 = load i32, ptr %3, align 4, !dbg !3549
  %25 = icmp slt i32 %24, 0, !dbg !3551
  br i1 %25, label %26, label %33, !dbg !3551

26:                                               ; preds = %21
  %27 = load i32, ptr %3, align 4, !dbg !3552
  %28 = sub nsw i32 0, %27, !dbg !3553
  %29 = sub nsw i32 %28, 1, !dbg !3554
  %30 = sext i32 %29 to i64, !dbg !3555
  %31 = getelementptr inbounds [6 x [13 x i8]], ptr @Secret_level_names, i64 0, i64 %30, !dbg !3555
  %32 = getelementptr inbounds [13 x i8], ptr %31, i64 0, i64 0, !dbg !3555
  store ptr %32, ptr %5, align 8, !dbg !3556
  br label %39, !dbg !3557

33:                                               ; preds = %21
  %34 = load i32, ptr %3, align 4, !dbg !3558
  %35 = sub nsw i32 %34, 1, !dbg !3559
  %36 = sext i32 %35 to i64, !dbg !3560
  %37 = getelementptr inbounds [30 x [13 x i8]], ptr @Level_names, i64 0, i64 %36, !dbg !3560
  %38 = getelementptr inbounds [13 x i8], ptr %37, i64 0, i64 0, !dbg !3560
  store ptr %38, ptr %5, align 8, !dbg !3561
  br label %39

39:                                               ; preds = %33, %26
  call void @_Z21gr_set_current_canvasP11_grs_canvas(ptr noundef null), !dbg !3562
  %40 = call noundef i32 @_Z21gr_find_closest_coloriii(i32 noundef 0, i32 noundef 0, i32 noundef 0), !dbg !3563
  call void @_Z15gr_clear_canvasi(i32 noundef %40), !dbg !3564
  store i32 -1, ptr @Last_msg_ycrd, align 4, !dbg !3565
  %41 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 445) #9, !dbg !3566
  %42 = load ptr, ptr %41, align 8, !dbg !3566
  call void @_Z18show_boxed_messagePc(ptr noundef %42), !dbg !3567
  call void @_Z15gr_palette_loadPh(ptr noundef @gr_palette), !dbg !3568
  call void @_Z19plat_present_canvasi(i32 noundef 0), !dbg !3569
  %43 = load ptr, ptr %5, align 8, !dbg !3570
  %44 = call noundef i32 @_Z10load_levelPc(ptr noundef %43), !dbg !3571
  store i32 %44, ptr %7, align 4, !dbg !3572
  %45 = load i32, ptr %7, align 4, !dbg !3573
  %46 = icmp ne i32 %45, 0, !dbg !3573
  br i1 %46, label %47, label %50, !dbg !3573

47:                                               ; preds = %39
  %48 = load ptr, ptr %5, align 8, !dbg !3575
  %49 = load i32, ptr %7, align 4, !dbg !3576
  call void (ptr, ...) @_Z5ErrorPKcz(ptr noundef @.str.14, ptr noundef %48, i32 noundef %49), !dbg !3577
  br label %50, !dbg !3577

50:                                               ; preds = %47, %39
  %51 = load i32, ptr %3, align 4, !dbg !3578
  store i32 %51, ptr @Current_level_num, align 4, !dbg !3579
  %52 = call noundef i32 @_Z12load_palettePKcii(ptr noundef @Current_level_palette, i32 noundef 1, i32 noundef 1), !dbg !3580
  %53 = load i32, ptr @CurrentDataVersion, align 4, !dbg !3581
  %54 = icmp eq i32 %53, 0, !dbg !3583
  br i1 %54, label %55, label %57, !dbg !3583

55:                                               ; preds = %50
  %56 = load i32, ptr %3, align 4, !dbg !3584
  call void @_Z18load_endlevel_datai(i32 noundef %56), !dbg !3585
  br label %57, !dbg !3585

57:                                               ; preds = %55, %50
  %58 = load i32, ptr %4, align 4, !dbg !3586
  %59 = icmp ne i32 %58, 0, !dbg !3586
  br i1 %59, label %60, label %61, !dbg !3586

60:                                               ; preds = %57
  call void @_Z21piggy_load_level_datav(), !dbg !3588
  br label %61, !dbg !3588

61:                                               ; preds = %60, %57
  %62 = load ptr, ptr %5, align 8, !dbg !3589
  call void @_Z24load_bitmap_replacementsPc(ptr noundef %62), !dbg !3590
  %63 = load i32, ptr @Robot_replacements_loaded, align 4, !dbg !3591
  %64 = icmp ne i32 %63, 0, !dbg !3591
  br i1 %64, label %65, label %67, !dbg !3591

65:                                               ; preds = %61
  %66 = call noundef i32 @_Z12read_hamfilev(), !dbg !3593
  store i32 0, ptr @Robot_replacements_loaded, align 4, !dbg !3595
  br label %67, !dbg !3596

67:                                               ; preds = %65, %61
  %68 = load ptr, ptr %5, align 8, !dbg !3597
  call void @_Z23load_robot_replacementsPc(ptr noundef %68), !dbg !3598
  call void @_Z21reset_network_objectsv(), !dbg !3599
  %69 = load i32, ptr @Player_num, align 4, !dbg !3600
  %70 = sext i32 %69 to i64, !dbg !3601
  %71 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %70, !dbg !3601
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %71, ptr align 4 %6, i64 148, i1 false), !dbg !3602
  call void @_Z17set_sound_sourcesv(), !dbg !3603
  %72 = load i32, ptr @Current_level_num, align 4, !dbg !3604
  call void @_Z21songs_play_level_songi(i32 noundef %72), !dbg !3605
  call void @_Z19clear_boxed_messagev(), !dbg !3606
  call void @_Z15gr_palette_loadPh(ptr noundef @gr_palette), !dbg !3607
  ret void, !dbg !3608
}

declare void @_Z21gr_set_current_canvasP11_grs_canvas(ptr noundef) #1

declare void @_Z15gr_clear_canvasi(i32 noundef) #1

declare noundef i32 @_Z21gr_find_closest_coloriii(i32 noundef, i32 noundef, i32 noundef) #1

declare void @_Z18show_boxed_messagePc(ptr noundef) #1

declare void @_Z15gr_palette_loadPh(ptr noundef) #1

declare void @_Z19plat_present_canvasi(i32 noundef) #1

declare noundef i32 @_Z10load_levelPc(ptr noundef) #1

declare void @_Z5ErrorPKcz(ptr noundef, ...) #1

declare noundef i32 @_Z12load_palettePKcii(ptr noundef, i32 noundef, i32 noundef) #1

declare void @_Z18load_endlevel_datai(i32 noundef) #1

declare void @_Z21piggy_load_level_datav() #1

declare noundef i32 @_Z12read_hamfilev() #1

declare void @_Z23load_robot_replacementsPc(ptr noundef) #1

declare void @_Z21songs_play_level_songi(i32 noundef) #1

declare void @_Z19clear_boxed_messagev() #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z16InitPlayerObjectv() #0 !dbg !3609 {
  %1 = load i32, ptr @Player_num, align 4, !dbg !3610
  %2 = icmp sge i32 %1, 0, !dbg !3610
  br i1 %2, label %3, label %6, !dbg !3610

3:                                                ; preds = %0
  %4 = load i32, ptr @Player_num, align 4, !dbg !3610
  %5 = icmp slt i32 %4, 8, !dbg !3610
  br label %6

6:                                                ; preds = %3, %0
  %7 = phi i1 [ false, %0 ], [ %5, %3 ], !dbg !3611
  %8 = zext i1 %7 to i32, !dbg !3610
  call void @_Z7_AssertiPKcS0_i(i32 noundef %8, ptr noundef @.str.15, ptr noundef @.str.1, i32 noundef 1214), !dbg !3610
  %9 = load i32, ptr @Player_num, align 4, !dbg !3612
  %10 = icmp ne i32 %9, 0, !dbg !3614
  br i1 %10, label %11, label %15, !dbg !3614

11:                                               ; preds = %6
  %12 = load i32, ptr @Player_num, align 4, !dbg !3615
  %13 = sext i32 %12 to i64, !dbg !3617
  %14 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %13, !dbg !3617
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 @Players, ptr align 4 %14, i64 148, i1 false), !dbg !3618
  store i32 0, ptr @Player_num, align 4, !dbg !3619
  br label %15, !dbg !3620

15:                                               ; preds = %11, %6
  %16 = load i32, ptr @Player_num, align 4, !dbg !3621
  %17 = sext i32 %16 to i64, !dbg !3622
  %18 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %17, !dbg !3622
  %19 = getelementptr inbounds nuw %struct.player, ptr %18, i32 0, i32 4, !dbg !3623
  store i32 0, ptr %19, align 4, !dbg !3624
  %20 = load i32, ptr @Player_num, align 4, !dbg !3625
  %21 = sext i32 %20 to i64, !dbg !3626
  %22 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %21, !dbg !3626
  %23 = getelementptr inbounds nuw %struct.player, ptr %22, i32 0, i32 4, !dbg !3627
  %24 = load i32, ptr %23, align 4, !dbg !3627
  %25 = sext i32 %24 to i64, !dbg !3628
  %26 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %25, !dbg !3628
  store ptr %26, ptr @ConsoleObject, align 8, !dbg !3629
  %27 = load ptr, ptr @ConsoleObject, align 8, !dbg !3630
  %28 = getelementptr inbounds nuw %struct.object, ptr %27, i32 0, i32 1, !dbg !3631
  store i8 4, ptr %28, align 4, !dbg !3632
  %29 = load i32, ptr @Player_num, align 4, !dbg !3633
  %30 = trunc i32 %29 to i8, !dbg !3633
  %31 = load ptr, ptr @ConsoleObject, align 8, !dbg !3634
  %32 = getelementptr inbounds nuw %struct.object, ptr %31, i32 0, i32 2, !dbg !3635
  store i8 %30, ptr %32, align 1, !dbg !3636
  %33 = load ptr, ptr @ConsoleObject, align 8, !dbg !3637
  %34 = getelementptr inbounds nuw %struct.object, ptr %33, i32 0, i32 5, !dbg !3638
  store i8 4, ptr %34, align 2, !dbg !3639
  %35 = load ptr, ptr @ConsoleObject, align 8, !dbg !3640
  %36 = getelementptr inbounds nuw %struct.object, ptr %35, i32 0, i32 6, !dbg !3641
  store i8 1, ptr %36, align 1, !dbg !3642
  ret void, !dbg !3643
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z12StartNewGamei(i32 noundef %0) #0 !dbg !3644 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !3645, !DIExpression(), !3646)
  store i32 0, ptr @Game_mode, align 4, !dbg !3647
  store i32 2, ptr @Function_mode, align 4, !dbg !3648
  store i32 0, ptr @Next_level_num, align 4, !dbg !3649
  call void @_Z16InitPlayerObjectv(), !dbg !3650
  call void @_Z22init_player_stats_gamev(), !dbg !3651
  store i32 1, ptr @N_players, align 4, !dbg !3652
  %3 = load i32, ptr %2, align 4, !dbg !3653
  %4 = icmp slt i32 %3, 0, !dbg !3655
  br i1 %4, label %5, label %7, !dbg !3655

5:                                                ; preds = %1
  %6 = load i32, ptr %2, align 4, !dbg !3656
  call void @_Z19StartNewLevelSecretii(i32 noundef %6, i32 noundef 0), !dbg !3657
  br label %9, !dbg !3657

7:                                                ; preds = %1
  %8 = load i32, ptr %2, align 4, !dbg !3658
  call void @_Z13StartNewLevelii(i32 noundef %8, i32 noundef 0), !dbg !3659
  br label %9

9:                                                ; preds = %7, %5
  %10 = load i32, ptr %2, align 4, !dbg !3660
  %11 = trunc i32 %10 to i8, !dbg !3660
  %12 = load i32, ptr @Player_num, align 4, !dbg !3661
  %13 = sext i32 %12 to i64, !dbg !3662
  %14 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %13, !dbg !3662
  %15 = getelementptr inbounds nuw %struct.player, ptr %14, i32 0, i32 13, !dbg !3663
  store i8 %11, ptr %15, align 1, !dbg !3664
  call void @_Z19game_disable_cheatsv(), !dbg !3665
  call void @_Z25init_seismic_disturbancesv(), !dbg !3666
  ret void, !dbg !3667
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z19StartNewLevelSecretii(i32 noundef %0, i32 noundef %1) #0 !dbg !3668 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca [1 x %struct.newmenu_item], align 8
  %6 = alloca ptr, align 8
  %7 = alloca [128 x i8], align 1
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca [128 x i8], align 1
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !3669, !DIExpression(), !3670)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !3671, !DIExpression(), !3672)
    #dbg_declare(ptr %5, !3673, !DIExpression(), !3675)
  store i32 0, ptr @ThisLevelTime, align 4, !dbg !3676
  %12 = getelementptr inbounds [1 x %struct.newmenu_item], ptr %5, i64 0, i64 0, !dbg !3677
  %13 = getelementptr inbounds nuw %struct.newmenu_item, ptr %12, i32 0, i32 0, !dbg !3678
  store i32 4, ptr %13, align 8, !dbg !3679
  %14 = getelementptr inbounds [1 x %struct.newmenu_item], ptr %5, i64 0, i64 0, !dbg !3680
  %15 = getelementptr inbounds nuw %struct.newmenu_item, ptr %14, i32 0, i32 6, !dbg !3681
  store ptr @.str.32, ptr %15, align 8, !dbg !3682
  store i32 -1, ptr @last_drawn_cockpit, align 4, !dbg !3683
  %16 = load i32, ptr @Newdemo_state, align 4, !dbg !3684
  %17 = icmp eq i32 %16, 3, !dbg !3686
  br i1 %17, label %18, label %19, !dbg !3686

18:                                               ; preds = %2
  store i32 1, ptr @Newdemo_state, align 4, !dbg !3687
  br label %19, !dbg !3688

19:                                               ; preds = %18, %2
  %20 = load i32, ptr @Newdemo_state, align 4, !dbg !3689
  %21 = icmp eq i32 %20, 1, !dbg !3691
  br i1 %21, label %22, label %26, !dbg !3691

22:                                               ; preds = %19
  %23 = load i32, ptr %3, align 4, !dbg !3692
  call void @_Z21newdemo_set_new_leveli(i32 noundef %23), !dbg !3694
  %24 = load i32, ptr @FrameCount, align 4, !dbg !3695
  %25 = load i32, ptr @FrameTime, align 4, !dbg !3696
  call void @_Z26newdemo_record_start_frameii(i32 noundef %24, i32 noundef %25), !dbg !3697
  br label %54, !dbg !3698

26:                                               ; preds = %19
  %27 = load i32, ptr @Newdemo_state, align 4, !dbg !3699
  %28 = icmp ne i32 %27, 2, !dbg !3701
  br i1 %28, label %29, label %53, !dbg !3701

29:                                               ; preds = %26
  %30 = call noundef i32 @_Z19gr_palette_fade_outPhii(ptr noundef @gr_palette, i32 noundef 32, i32 noundef 0), !dbg !3702
  %31 = call noundef i32 @_Z15set_screen_modei(i32 noundef 0), !dbg !3704
  %32 = load i32, ptr @First_secret_visit, align 4, !dbg !3705
  %33 = icmp ne i32 %32, 0, !dbg !3705
  br i1 %33, label %34, label %37, !dbg !3705

34:                                               ; preds = %29
  %35 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 567) #9, !dbg !3707
  %36 = load ptr, ptr %35, align 8, !dbg !3707
  call void @_Z17do_secret_messagePc(ptr noundef %36), !dbg !3709
  br label %52, !dbg !3710

37:                                               ; preds = %29
    #dbg_declare(ptr %6, !3711, !DIExpression(), !3713)
  %38 = call ptr @"\01_fopen"(ptr noundef @.str.31, ptr noundef @.str.7), !dbg !3714
  store ptr %38, ptr %6, align 8, !dbg !3716
  %39 = icmp ne ptr %38, null, !dbg !3717
  br i1 %39, label %40, label %45, !dbg !3717

40:                                               ; preds = %37
  %41 = load ptr, ptr %6, align 8, !dbg !3718
  %42 = call i32 @fclose(ptr noundef %41), !dbg !3720
  %43 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 567) #9, !dbg !3721
  %44 = load ptr, ptr %43, align 8, !dbg !3721
  call void @_Z17do_secret_messagePc(ptr noundef %44), !dbg !3722
  br label %51, !dbg !3723

45:                                               ; preds = %37
    #dbg_declare(ptr %7, !3724, !DIExpression(), !3726)
  %46 = getelementptr inbounds [128 x i8], ptr %7, i64 0, i64 0, !dbg !3727
  %47 = load i32, ptr @Current_level_num, align 4, !dbg !3728
  %48 = add nsw i32 %47, 1, !dbg !3729
  %49 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %46, ptr noundef @.str.33, i32 noundef %48) #9, !dbg !3730
  %50 = getelementptr inbounds [128 x i8], ptr %7, i64 0, i64 0, !dbg !3731
  call void @_Z17do_secret_messagePc(ptr noundef %50), !dbg !3732
  br label %51

51:                                               ; preds = %45, %40
  br label %52

52:                                               ; preds = %51, %34
  br label %53, !dbg !3733

53:                                               ; preds = %52, %26
  br label %54

54:                                               ; preds = %53, %22
  %55 = load i32, ptr %3, align 4, !dbg !3734
  %56 = load i32, ptr %4, align 4, !dbg !3735
  call void @_Z9LoadLevelii(i32 noundef %55, i32 noundef %56), !dbg !3736
  %57 = load i32, ptr @Current_level_num, align 4, !dbg !3737
  %58 = load i32, ptr %3, align 4, !dbg !3737
  %59 = icmp eq i32 %57, %58, !dbg !3737
  %60 = zext i1 %59 to i32, !dbg !3737
  call void @_Z7_AssertiPKcS0_i(i32 noundef %60, ptr noundef @.str.34, ptr noundef @.str.1, i32 noundef 1571), !dbg !3737
  %61 = load i32, ptr @Function_mode, align 4, !dbg !3738
  %62 = icmp eq i32 %61, 2, !dbg !3738
  %63 = zext i1 %62 to i32, !dbg !3738
  call void @_Z7_AssertiPKcS0_i(i32 noundef %63, ptr noundef @.str.35, ptr noundef @.str.1, i32 noundef 1573), !dbg !3738
  call void @_Z28gameseq_init_network_playersv(), !dbg !3739
  call void @_Z18HUD_clear_messagesv(), !dbg !3740
  call void @_Z21automap_clear_visitedv(), !dbg !3741
  %64 = load i32, ptr @Player_num, align 4, !dbg !3742
  %65 = sext i32 %64 to i64, !dbg !3743
  %66 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %65, !dbg !3743
  %67 = getelementptr inbounds nuw %struct.player, ptr %66, i32 0, i32 4, !dbg !3744
  %68 = load i32, ptr %67, align 4, !dbg !3744
  %69 = sext i32 %68 to i64, !dbg !3745
  %70 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %69, !dbg !3745
  store ptr %70, ptr @Viewer, align 8, !dbg !3746
  call void @_Z29gameseq_remove_unused_playersv(), !dbg !3747
  store i32 0, ptr @Game_suspended, align 4, !dbg !3748
  store i32 0, ptr @Control_center_destroyed, align 4, !dbg !3749
  call void @_Z12init_cockpitv(), !dbg !3750
  call void @_Z17reset_palette_addv(), !dbg !3751
  %71 = load i32, ptr @First_secret_visit, align 4, !dbg !3752
  %72 = icmp ne i32 %71, 0, !dbg !3752
  br i1 %72, label %76, label %73, !dbg !3754

73:                                               ; preds = %54
  %74 = load i32, ptr @Newdemo_state, align 4, !dbg !3755
  %75 = icmp eq i32 %74, 2, !dbg !3756
  br i1 %75, label %76, label %77, !dbg !3754

76:                                               ; preds = %73, %54
  call void @_Z21init_robots_for_levelv(), !dbg !3757
  call void @_Z15init_ai_objectsv(), !dbg !3759
  call void @_Z20init_smega_detonatesv(), !dbg !3760
  call void @_Z11init_morphsv(), !dbg !3761
  call void @_Z16init_all_matcensv(), !dbg !3762
  call void @_Z21reset_special_effectsv(), !dbg !3763
  call void @_Z16StartSecretLevelv(), !dbg !3764
  br label %99, !dbg !3765

77:                                               ; preds = %73
    #dbg_declare(ptr %8, !3766, !DIExpression(), !3768)
  %78 = call ptr @"\01_fopen"(ptr noundef @.str.31, ptr noundef @.str.7), !dbg !3769
  store ptr %78, ptr %8, align 8, !dbg !3771
  %79 = icmp ne ptr %78, null, !dbg !3772
  br i1 %79, label %80, label %92, !dbg !3772

80:                                               ; preds = %77
    #dbg_declare(ptr %9, !3773, !DIExpression(), !3775)
    #dbg_declare(ptr %10, !3776, !DIExpression(), !3777)
  %81 = load ptr, ptr %8, align 8, !dbg !3778
  %82 = call i32 @fclose(ptr noundef %81), !dbg !3779
  %83 = load i8, ptr @Primary_weapon, align 1, !dbg !3780
  %84 = sext i8 %83 to i32, !dbg !3780
  store i32 %84, ptr %9, align 4, !dbg !3781
  %85 = load i8, ptr @Secondary_weapon, align 1, !dbg !3782
  %86 = sext i8 %85 to i32, !dbg !3782
  store i32 %86, ptr %10, align 4, !dbg !3783
  %87 = call noundef i32 @_Z17state_restore_alliiPc(i32 noundef 1, i32 noundef 1, ptr noundef @.str.31), !dbg !3784
  %88 = load i32, ptr %9, align 4, !dbg !3785
  %89 = trunc i32 %88 to i8, !dbg !3785
  store i8 %89, ptr @Primary_weapon, align 1, !dbg !3786
  %90 = load i32, ptr %10, align 4, !dbg !3787
  %91 = trunc i32 %90 to i8, !dbg !3787
  store i8 %91, ptr @Secondary_weapon, align 1, !dbg !3788
  call void @_Z21reset_special_effectsv(), !dbg !3789
  call void @_Z16StartSecretLevelv(), !dbg !3790
  br label %98, !dbg !3791

92:                                               ; preds = %77
    #dbg_declare(ptr %11, !3792, !DIExpression(), !3794)
  %93 = getelementptr inbounds [128 x i8], ptr %11, i64 0, i64 0, !dbg !3795
  %94 = load i32, ptr @Current_level_num, align 4, !dbg !3796
  %95 = add nsw i32 %94, 1, !dbg !3797
  %96 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %93, ptr noundef @.str.33, i32 noundef %95) #9, !dbg !3798
  %97 = getelementptr inbounds [128 x i8], ptr %11, i64 0, i64 0, !dbg !3799
  call void @_Z17do_secret_messagePc(ptr noundef %97), !dbg !3800
  br label %104, !dbg !3801

98:                                               ; preds = %80
  br label %99

99:                                               ; preds = %98, %76
  %100 = load i32, ptr @First_secret_visit, align 4, !dbg !3802
  %101 = icmp ne i32 %100, 0, !dbg !3802
  br i1 %101, label %102, label %103, !dbg !3802

102:                                              ; preds = %99
  call void @_Z26copy_defaults_to_robot_allv(), !dbg !3804
  br label %103, !dbg !3806

103:                                              ; preds = %102, %99
  call void @_Z15turn_cheats_offv(), !dbg !3807
  call void @_Z25init_controlcen_for_levelv(), !dbg !3808
  store i32 -1, ptr @Last_level_path_created, align 4, !dbg !3809
  store i32 0, ptr @First_secret_visit, align 4, !dbg !3810
  br label %104, !dbg !3811

104:                                              ; preds = %103, %92
  ret void, !dbg !3811
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z13StartNewLevelii(i32 noundef %0, i32 noundef %1) #0 !dbg !3812 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !3813, !DIExpression(), !3814)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !3815, !DIExpression(), !3816)
  store i32 0, ptr @ThisLevelTime, align 4, !dbg !3817
  %5 = load i32, ptr %3, align 4, !dbg !3818
  %6 = icmp sgt i32 %5, 0, !dbg !3820
  br i1 %6, label %7, label %12, !dbg !3821

7:                                                ; preds = %2
  %8 = load i32, ptr %4, align 4, !dbg !3822
  %9 = icmp ne i32 %8, 0, !dbg !3822
  br i1 %9, label %12, label %10, !dbg !3821

10:                                               ; preds = %7
  %11 = load i32, ptr %3, align 4, !dbg !3823
  call void @_Z28maybe_set_first_secret_visiti(i32 noundef %11), !dbg !3825
  br label %12, !dbg !3826

12:                                               ; preds = %10, %7, %2
  %13 = load i32, ptr %3, align 4, !dbg !3827
  call void @_Z14ShowLevelIntroi(i32 noundef %13), !dbg !3828
  %14 = load i32, ptr %3, align 4, !dbg !3829
  %15 = load i32, ptr %4, align 4, !dbg !3830
  call void @_Z16StartNewLevelSubiii(i32 noundef %14, i32 noundef 1, i32 noundef %15), !dbg !3831
  ret void, !dbg !3832
}

declare void @_Z19game_disable_cheatsv() #1

declare void @_Z25init_seismic_disturbancesv() #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z20DoEndLevelScoreGlitzi(i32 noundef %0) #0 !dbg !3833 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca [64 x i8], align 1
  %11 = alloca [64 x i8], align 1
  %12 = alloca [11 x [30 x i8]], align 1
  %13 = alloca [12 x %struct.newmenu_item], align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca [128 x i8], align 1
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !3834, !DIExpression(), !3835)
    #dbg_declare(ptr %3, !3836, !DIExpression(), !3837)
    #dbg_declare(ptr %4, !3838, !DIExpression(), !3839)
    #dbg_declare(ptr %5, !3840, !DIExpression(), !3841)
    #dbg_declare(ptr %6, !3842, !DIExpression(), !3843)
    #dbg_declare(ptr %7, !3844, !DIExpression(), !3845)
    #dbg_declare(ptr %8, !3846, !DIExpression(), !3847)
    #dbg_declare(ptr %9, !3848, !DIExpression(), !3849)
    #dbg_declare(ptr %10, !3850, !DIExpression(), !3854)
    #dbg_declare(ptr %11, !3855, !DIExpression(), !3856)
    #dbg_declare(ptr %12, !3857, !DIExpression(), !3861)
    #dbg_declare(ptr %13, !3862, !DIExpression(), !3864)
    #dbg_declare(ptr %14, !3865, !DIExpression(), !3866)
    #dbg_declare(ptr %15, !3867, !DIExpression(), !3868)
    #dbg_declare(ptr %16, !3869, !DIExpression(), !3870)
    #dbg_declare(ptr %17, !3871, !DIExpression(), !3872)
    #dbg_declare(ptr %18, !3873, !DIExpression(), !3874)
  %19 = call noundef i32 @_Z15set_screen_modei(i32 noundef 0), !dbg !3875
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.16), !dbg !3876
  %20 = load i32, ptr @Player_num, align 4, !dbg !3877
  %21 = sext i32 %20 to i64, !dbg !3878
  %22 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %21, !dbg !3878
  %23 = getelementptr inbounds nuw %struct.player, ptr %22, i32 0, i32 11, !dbg !3879
  %24 = load i8, ptr %23, align 1, !dbg !3879
  %25 = sext i8 %24 to i32, !dbg !3878
  store i32 %25, ptr %18, align 4, !dbg !3880
  %26 = load i32, ptr %18, align 4, !dbg !3881
  %27 = icmp slt i32 %26, 0, !dbg !3883
  br i1 %27, label %28, label %35, !dbg !3883

28:                                               ; preds = %1
  %29 = load i32, ptr @Last_level, align 4, !dbg !3884
  %30 = load i32, ptr @N_secret_levels, align 4, !dbg !3885
  %31 = sdiv i32 %29, %30, !dbg !3886
  %32 = sub nsw i32 0, %31, !dbg !3887
  %33 = load i32, ptr %18, align 4, !dbg !3888
  %34 = mul nsw i32 %33, %32, !dbg !3888
  store i32 %34, ptr %18, align 4, !dbg !3888
  br label %35, !dbg !3889

35:                                               ; preds = %28, %1
  %36 = load i32, ptr @Player_num, align 4, !dbg !3890
  %37 = sext i32 %36 to i64, !dbg !3891
  %38 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %37, !dbg !3891
  %39 = getelementptr inbounds nuw %struct.player, ptr %38, i32 0, i32 21, !dbg !3892
  %40 = load i32, ptr %39, align 4, !dbg !3892
  %41 = load i32, ptr @Player_num, align 4, !dbg !3893
  %42 = sext i32 %41 to i64, !dbg !3894
  %43 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %42, !dbg !3894
  %44 = getelementptr inbounds nuw %struct.player, ptr %43, i32 0, i32 20, !dbg !3895
  %45 = load i32, ptr %44, align 4, !dbg !3895
  %46 = sub nsw i32 %40, %45, !dbg !3896
  store i32 %46, ptr %3, align 4, !dbg !3897
  %47 = load i32, ptr @Cheats_enabled, align 4, !dbg !3898
  %48 = icmp ne i32 %47, 0, !dbg !3898
  br i1 %48, label %99, label %49, !dbg !3900

49:                                               ; preds = %35
  %50 = load i32, ptr @Difficulty_level, align 4, !dbg !3901
  %51 = icmp sgt i32 %50, 1, !dbg !3904
  br i1 %51, label %52, label %61, !dbg !3904

52:                                               ; preds = %49
  %53 = load i32, ptr %3, align 4, !dbg !3905
  %54 = load i32, ptr @Difficulty_level, align 4, !dbg !3907
  %55 = mul nsw i32 %53, %54, !dbg !3908
  %56 = sdiv i32 %55, 4, !dbg !3909
  store i32 %56, ptr %4, align 4, !dbg !3910
  %57 = load i32, ptr %4, align 4, !dbg !3911
  %58 = srem i32 %57, 100, !dbg !3912
  %59 = load i32, ptr %4, align 4, !dbg !3913
  %60 = sub nsw i32 %59, %58, !dbg !3913
  store i32 %60, ptr %4, align 4, !dbg !3913
  br label %62, !dbg !3914

61:                                               ; preds = %49
  store i32 0, ptr %4, align 4, !dbg !3915
  br label %62

62:                                               ; preds = %61, %52
  %63 = load i32, ptr @Player_num, align 4, !dbg !3916
  %64 = sext i32 %63 to i64, !dbg !3917
  %65 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %64, !dbg !3917
  %66 = getelementptr inbounds nuw %struct.player, ptr %65, i32 0, i32 9, !dbg !3918
  %67 = load i32, ptr %66, align 4, !dbg !3918
  %68 = call i32 @f2i(i32 noundef %67), !dbg !3919
  %69 = mul nsw i32 %68, 5, !dbg !3920
  %70 = load i32, ptr %18, align 4, !dbg !3921
  %71 = mul nsw i32 %69, %70, !dbg !3922
  store i32 %71, ptr %6, align 4, !dbg !3923
  %72 = load i32, ptr @Player_num, align 4, !dbg !3924
  %73 = sext i32 %72 to i64, !dbg !3925
  %74 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %73, !dbg !3925
  %75 = getelementptr inbounds nuw %struct.player, ptr %74, i32 0, i32 8, !dbg !3926
  %76 = load i32, ptr %75, align 4, !dbg !3926
  %77 = call i32 @f2i(i32 noundef %76), !dbg !3927
  %78 = mul nsw i32 %77, 2, !dbg !3928
  %79 = load i32, ptr %18, align 4, !dbg !3929
  %80 = mul nsw i32 %78, %79, !dbg !3930
  store i32 %80, ptr %5, align 4, !dbg !3931
  %81 = load i32, ptr @Player_num, align 4, !dbg !3932
  %82 = sext i32 %81 to i64, !dbg !3933
  %83 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %82, !dbg !3933
  %84 = getelementptr inbounds nuw %struct.player, ptr %83, i32 0, i32 35, !dbg !3934
  %85 = load i8, ptr %84, align 2, !dbg !3934
  %86 = zext i8 %85 to i32, !dbg !3933
  %87 = mul nsw i32 %86, 500, !dbg !3935
  %88 = load i32, ptr @Difficulty_level, align 4, !dbg !3936
  %89 = add nsw i32 %88, 1, !dbg !3937
  %90 = mul nsw i32 %87, %89, !dbg !3938
  store i32 %90, ptr %7, align 4, !dbg !3939
  %91 = load i32, ptr %6, align 4, !dbg !3940
  %92 = srem i32 %91, 50, !dbg !3941
  %93 = load i32, ptr %6, align 4, !dbg !3942
  %94 = sub nsw i32 %93, %92, !dbg !3942
  store i32 %94, ptr %6, align 4, !dbg !3942
  %95 = load i32, ptr %5, align 4, !dbg !3943
  %96 = srem i32 %95, 50, !dbg !3944
  %97 = load i32, ptr %5, align 4, !dbg !3945
  %98 = sub nsw i32 %97, %96, !dbg !3945
  store i32 %98, ptr %5, align 4, !dbg !3945
  br label %100, !dbg !3946

99:                                               ; preds = %35
  store i32 0, ptr %4, align 4, !dbg !3947
  store i32 0, ptr %6, align 4, !dbg !3949
  store i32 0, ptr %5, align 4, !dbg !3950
  store i32 0, ptr %7, align 4, !dbg !3951
  br label %100

100:                                              ; preds = %99, %62
  %101 = getelementptr inbounds [64 x i8], ptr %10, i64 0, i64 0, !dbg !3952
  store i8 0, ptr %101, align 1, !dbg !3953
  %102 = getelementptr inbounds [64 x i8], ptr %11, i64 0, i64 0, !dbg !3954
  store i8 0, ptr %102, align 1, !dbg !3955
  %103 = load i32, ptr @Cheats_enabled, align 4, !dbg !3956
  %104 = icmp ne i32 %103, 0, !dbg !3956
  br i1 %104, label %135, label %105, !dbg !3958

105:                                              ; preds = %100
  %106 = load i32, ptr @Player_num, align 4, !dbg !3959
  %107 = sext i32 %106 to i64, !dbg !3960
  %108 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %107, !dbg !3960
  %109 = getelementptr inbounds nuw %struct.player, ptr %108, i32 0, i32 35, !dbg !3961
  %110 = load i8, ptr %109, align 2, !dbg !3961
  %111 = zext i8 %110 to i32, !dbg !3960
  %112 = load i32, ptr @Player_num, align 4, !dbg !3962
  %113 = sext i32 %112 to i64, !dbg !3963
  %114 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %113, !dbg !3963
  %115 = getelementptr inbounds nuw %struct.player, ptr %114, i32 0, i32 36, !dbg !3964
  %116 = load i8, ptr %115, align 1, !dbg !3964
  %117 = zext i8 %116 to i32, !dbg !3963
  %118 = icmp eq i32 %111, %117, !dbg !3965
  br i1 %118, label %119, label %135, !dbg !3958

119:                                              ; preds = %105
  %120 = load i32, ptr @Player_num, align 4, !dbg !3966
  %121 = sext i32 %120 to i64, !dbg !3968
  %122 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %121, !dbg !3968
  %123 = getelementptr inbounds nuw %struct.player, ptr %122, i32 0, i32 35, !dbg !3969
  %124 = load i8, ptr %123, align 2, !dbg !3969
  %125 = zext i8 %124 to i32, !dbg !3968
  %126 = mul nsw i32 %125, 1000, !dbg !3970
  %127 = load i32, ptr @Difficulty_level, align 4, !dbg !3971
  %128 = add nsw i32 %127, 1, !dbg !3972
  %129 = mul nsw i32 %126, %128, !dbg !3973
  store i32 %129, ptr %8, align 4, !dbg !3974
  %130 = getelementptr inbounds [64 x i8], ptr %10, i64 0, i64 0, !dbg !3975
  %131 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 446) #9, !dbg !3976
  %132 = load ptr, ptr %131, align 8, !dbg !3976
  %133 = load i32, ptr %8, align 4, !dbg !3977
  %134 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %130, ptr noundef @.str.17, ptr noundef %132, i32 noundef %133) #9, !dbg !3978
  br label %136, !dbg !3979

135:                                              ; preds = %105, %100
  store i32 0, ptr %8, align 4, !dbg !3980
  br label %136

136:                                              ; preds = %135, %119
  %137 = load i32, ptr @Cheats_enabled, align 4, !dbg !3981
  %138 = icmp ne i32 %137, 0, !dbg !3981
  br i1 %138, label %167, label %139, !dbg !3983

139:                                              ; preds = %136
  %140 = load i32, ptr @Game_mode, align 4, !dbg !3984
  %141 = and i32 %140, 38, !dbg !3985
  %142 = icmp ne i32 %141, 0, !dbg !3986
  br i1 %142, label %167, label %143, !dbg !3987

143:                                              ; preds = %139
  %144 = load i32, ptr @Player_num, align 4, !dbg !3988
  %145 = sext i32 %144 to i64, !dbg !3989
  %146 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %145, !dbg !3989
  %147 = getelementptr inbounds nuw %struct.player, ptr %146, i32 0, i32 10, !dbg !3990
  %148 = load i8, ptr %147, align 4, !dbg !3990
  %149 = icmp ne i8 %148, 0, !dbg !3991
  br i1 %149, label %150, label %167, !dbg !3992

150:                                              ; preds = %143
  %151 = load i32, ptr @Current_level_num, align 4, !dbg !3993
  %152 = load i32, ptr @Last_level, align 4, !dbg !3994
  %153 = icmp eq i32 %151, %152, !dbg !3995
  br i1 %153, label %154, label %167, !dbg !3992

154:                                              ; preds = %150
  %155 = load i32, ptr @Player_num, align 4, !dbg !3996
  %156 = sext i32 %155 to i64, !dbg !3998
  %157 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %156, !dbg !3998
  %158 = getelementptr inbounds nuw %struct.player, ptr %157, i32 0, i32 10, !dbg !3999
  %159 = load i8, ptr %158, align 4, !dbg !3999
  %160 = zext i8 %159 to i32, !dbg !3998
  %161 = mul nsw i32 %160, 10000, !dbg !4000
  store i32 %161, ptr %9, align 4, !dbg !4001
  %162 = getelementptr inbounds [64 x i8], ptr %11, i64 0, i64 0, !dbg !4002
  %163 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 516) #9, !dbg !4003
  %164 = load ptr, ptr %163, align 8, !dbg !4003
  %165 = load i32, ptr %9, align 4, !dbg !4004
  %166 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %162, ptr noundef @.str.17, ptr noundef %164, i32 noundef %165) #9, !dbg !4005
  store i32 1, ptr %17, align 4, !dbg !4006
  br label %168, !dbg !4007

167:                                              ; preds = %150, %143, %139, %136
  store i32 0, ptr %17, align 4, !dbg !4008
  store i32 0, ptr %9, align 4, !dbg !4009
  br label %168

168:                                              ; preds = %167, %154
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.18), !dbg !4010
  %169 = load i32, ptr %4, align 4, !dbg !4011
  %170 = load i32, ptr %5, align 4, !dbg !4012
  %171 = add nsw i32 %169, %170, !dbg !4013
  %172 = load i32, ptr %6, align 4, !dbg !4014
  %173 = add nsw i32 %171, %172, !dbg !4015
  %174 = load i32, ptr %7, align 4, !dbg !4016
  %175 = add nsw i32 %173, %174, !dbg !4017
  %176 = load i32, ptr %8, align 4, !dbg !4018
  %177 = add nsw i32 %175, %176, !dbg !4019
  %178 = load i32, ptr %9, align 4, !dbg !4020
  %179 = add nsw i32 %177, %178, !dbg !4021
  call void @_Z25add_bonus_points_to_scorei(i32 noundef %179), !dbg !4022
  store i32 0, ptr %15, align 4, !dbg !4023
  %180 = load i32, ptr %15, align 4, !dbg !4024
  %181 = add nsw i32 %180, 1, !dbg !4024
  store i32 %181, ptr %15, align 4, !dbg !4024
  %182 = sext i32 %180 to i64, !dbg !4025
  %183 = getelementptr inbounds [11 x [30 x i8]], ptr %12, i64 0, i64 %182, !dbg !4025
  %184 = getelementptr inbounds [30 x i8], ptr %183, i64 0, i64 0, !dbg !4025
  %185 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 447) #9, !dbg !4026
  %186 = load ptr, ptr %185, align 8, !dbg !4026
  %187 = load i32, ptr %6, align 4, !dbg !4027
  %188 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %184, ptr noundef @.str.19, ptr noundef %186, i32 noundef %187) #9, !dbg !4028
  %189 = load i32, ptr %15, align 4, !dbg !4029
  %190 = add nsw i32 %189, 1, !dbg !4029
  store i32 %190, ptr %15, align 4, !dbg !4029
  %191 = sext i32 %189 to i64, !dbg !4030
  %192 = getelementptr inbounds [11 x [30 x i8]], ptr %12, i64 0, i64 %191, !dbg !4030
  %193 = getelementptr inbounds [30 x i8], ptr %192, i64 0, i64 0, !dbg !4030
  %194 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 448) #9, !dbg !4031
  %195 = load ptr, ptr %194, align 8, !dbg !4031
  %196 = load i32, ptr %5, align 4, !dbg !4032
  %197 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %193, ptr noundef @.str.19, ptr noundef %195, i32 noundef %196) #9, !dbg !4033
  %198 = load i32, ptr %15, align 4, !dbg !4034
  %199 = add nsw i32 %198, 1, !dbg !4034
  store i32 %199, ptr %15, align 4, !dbg !4034
  %200 = sext i32 %198 to i64, !dbg !4035
  %201 = getelementptr inbounds [11 x [30 x i8]], ptr %12, i64 0, i64 %200, !dbg !4035
  %202 = getelementptr inbounds [30 x i8], ptr %201, i64 0, i64 0, !dbg !4035
  %203 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 449) #9, !dbg !4036
  %204 = load ptr, ptr %203, align 8, !dbg !4036
  %205 = load i32, ptr %7, align 4, !dbg !4037
  %206 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %202, ptr noundef @.str.19, ptr noundef %204, i32 noundef %205) #9, !dbg !4038
  %207 = load i32, ptr %15, align 4, !dbg !4039
  %208 = add nsw i32 %207, 1, !dbg !4039
  store i32 %208, ptr %15, align 4, !dbg !4039
  %209 = sext i32 %207 to i64, !dbg !4040
  %210 = getelementptr inbounds [11 x [30 x i8]], ptr %12, i64 0, i64 %209, !dbg !4040
  %211 = getelementptr inbounds [30 x i8], ptr %210, i64 0, i64 0, !dbg !4040
  %212 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 450) #9, !dbg !4041
  %213 = load ptr, ptr %212, align 8, !dbg !4041
  %214 = load i32, ptr %4, align 4, !dbg !4042
  %215 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %211, ptr noundef @.str.19, ptr noundef %213, i32 noundef %214) #9, !dbg !4043
  %216 = load i32, ptr %15, align 4, !dbg !4044
  %217 = add nsw i32 %216, 1, !dbg !4044
  store i32 %217, ptr %15, align 4, !dbg !4044
  %218 = sext i32 %216 to i64, !dbg !4045
  %219 = getelementptr inbounds [11 x [30 x i8]], ptr %12, i64 0, i64 %218, !dbg !4045
  %220 = getelementptr inbounds [30 x i8], ptr %219, i64 0, i64 0, !dbg !4045
  %221 = getelementptr inbounds [64 x i8], ptr %10, i64 0, i64 0, !dbg !4046
  %222 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %220, ptr noundef @.str.20, ptr noundef %221) #9, !dbg !4047
  %223 = load i32, ptr @Game_mode, align 4, !dbg !4048
  %224 = and i32 %223, 38, !dbg !4050
  %225 = icmp ne i32 %224, 0, !dbg !4051
  br i1 %225, label %245, label %226, !dbg !4052

226:                                              ; preds = %168
  %227 = load i32, ptr @Player_num, align 4, !dbg !4053
  %228 = sext i32 %227 to i64, !dbg !4054
  %229 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %228, !dbg !4054
  %230 = getelementptr inbounds nuw %struct.player, ptr %229, i32 0, i32 10, !dbg !4055
  %231 = load i8, ptr %230, align 4, !dbg !4055
  %232 = icmp ne i8 %231, 0, !dbg !4056
  br i1 %232, label %233, label %245, !dbg !4057

233:                                              ; preds = %226
  %234 = load i32, ptr @Current_level_num, align 4, !dbg !4058
  %235 = load i32, ptr @Last_level, align 4, !dbg !4059
  %236 = icmp eq i32 %234, %235, !dbg !4060
  br i1 %236, label %237, label %245, !dbg !4057

237:                                              ; preds = %233
  %238 = load i32, ptr %15, align 4, !dbg !4061
  %239 = add nsw i32 %238, 1, !dbg !4061
  store i32 %239, ptr %15, align 4, !dbg !4061
  %240 = sext i32 %238 to i64, !dbg !4062
  %241 = getelementptr inbounds [11 x [30 x i8]], ptr %12, i64 0, i64 %240, !dbg !4062
  %242 = getelementptr inbounds [30 x i8], ptr %241, i64 0, i64 0, !dbg !4062
  %243 = getelementptr inbounds [64 x i8], ptr %11, i64 0, i64 0, !dbg !4063
  %244 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %242, ptr noundef @.str.20, ptr noundef %243) #9, !dbg !4064
  br label %245, !dbg !4064

245:                                              ; preds = %237, %233, %226, %168
  %246 = load i32, ptr %15, align 4, !dbg !4065
  %247 = add nsw i32 %246, 1, !dbg !4065
  store i32 %247, ptr %15, align 4, !dbg !4065
  %248 = sext i32 %246 to i64, !dbg !4066
  %249 = getelementptr inbounds [11 x [30 x i8]], ptr %12, i64 0, i64 %248, !dbg !4066
  %250 = getelementptr inbounds [30 x i8], ptr %249, i64 0, i64 0, !dbg !4066
  %251 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 451) #9, !dbg !4067
  %252 = load ptr, ptr %251, align 8, !dbg !4067
  %253 = load i32, ptr %6, align 4, !dbg !4068
  %254 = load i32, ptr %5, align 4, !dbg !4069
  %255 = add nsw i32 %253, %254, !dbg !4070
  %256 = load i32, ptr %7, align 4, !dbg !4071
  %257 = add nsw i32 %255, %256, !dbg !4072
  %258 = load i32, ptr %4, align 4, !dbg !4073
  %259 = add nsw i32 %257, %258, !dbg !4074
  %260 = load i32, ptr %8, align 4, !dbg !4075
  %261 = add nsw i32 %259, %260, !dbg !4076
  %262 = load i32, ptr %9, align 4, !dbg !4077
  %263 = add nsw i32 %261, %262, !dbg !4078
  %264 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %250, ptr noundef @.str.17, ptr noundef %252, i32 noundef %263) #9, !dbg !4079
  %265 = load i32, ptr %15, align 4, !dbg !4080
  %266 = add nsw i32 %265, 1, !dbg !4080
  store i32 %266, ptr %15, align 4, !dbg !4080
  %267 = sext i32 %265 to i64, !dbg !4081
  %268 = getelementptr inbounds [11 x [30 x i8]], ptr %12, i64 0, i64 %267, !dbg !4081
  %269 = getelementptr inbounds [30 x i8], ptr %268, i64 0, i64 0, !dbg !4081
  %270 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 452) #9, !dbg !4082
  %271 = load ptr, ptr %270, align 8, !dbg !4082
  %272 = load i32, ptr @Player_num, align 4, !dbg !4083
  %273 = sext i32 %272 to i64, !dbg !4084
  %274 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %273, !dbg !4084
  %275 = getelementptr inbounds nuw %struct.player, ptr %274, i32 0, i32 21, !dbg !4085
  %276 = load i32, ptr %275, align 4, !dbg !4085
  %277 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %269, ptr noundef @.str.19, ptr noundef %271, i32 noundef %276) #9, !dbg !4086
  store i32 0, ptr %14, align 4, !dbg !4087
  br label %278, !dbg !4089

278:                                              ; preds = %295, %245
  %279 = load i32, ptr %14, align 4, !dbg !4090
  %280 = load i32, ptr %15, align 4, !dbg !4092
  %281 = icmp slt i32 %279, %280, !dbg !4093
  br i1 %281, label %282, label %298, !dbg !4094

282:                                              ; preds = %278
  %283 = load i32, ptr %14, align 4, !dbg !4095
  %284 = sext i32 %283 to i64, !dbg !4097
  %285 = getelementptr inbounds [12 x %struct.newmenu_item], ptr %13, i64 0, i64 %284, !dbg !4097
  %286 = getelementptr inbounds nuw %struct.newmenu_item, ptr %285, i32 0, i32 0, !dbg !4098
  store i32 4, ptr %286, align 8, !dbg !4099
  %287 = load i32, ptr %14, align 4, !dbg !4100
  %288 = sext i32 %287 to i64, !dbg !4101
  %289 = getelementptr inbounds [11 x [30 x i8]], ptr %12, i64 0, i64 %288, !dbg !4101
  %290 = getelementptr inbounds [30 x i8], ptr %289, i64 0, i64 0, !dbg !4101
  %291 = load i32, ptr %14, align 4, !dbg !4102
  %292 = sext i32 %291 to i64, !dbg !4103
  %293 = getelementptr inbounds [12 x %struct.newmenu_item], ptr %13, i64 0, i64 %292, !dbg !4103
  %294 = getelementptr inbounds nuw %struct.newmenu_item, ptr %293, i32 0, i32 6, !dbg !4104
  store ptr %290, ptr %294, align 8, !dbg !4105
  br label %295, !dbg !4106

295:                                              ; preds = %282
  %296 = load i32, ptr %14, align 4, !dbg !4107
  %297 = add nsw i32 %296, 1, !dbg !4107
  store i32 %297, ptr %14, align 4, !dbg !4107
  br label %278, !dbg !4108, !llvm.loop !4109

298:                                              ; preds = %278
  %299 = load i32, ptr @Current_level_num, align 4, !dbg !4111
  %300 = icmp slt i32 %299, 0, !dbg !4113
  br i1 %300, label %301, label %316, !dbg !4113

301:                                              ; preds = %298
  %302 = getelementptr inbounds [128 x i8], ptr %16, i64 0, i64 0, !dbg !4114
  %303 = load i32, ptr %17, align 4, !dbg !4115
  %304 = icmp ne i32 %303, 0, !dbg !4115
  %305 = zext i1 %304 to i64, !dbg !4115
  %306 = select i1 %304, ptr @.str.22, ptr @.str.23, !dbg !4115
  %307 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 453) #9, !dbg !4116
  %308 = load ptr, ptr %307, align 8, !dbg !4116
  %309 = load i32, ptr @Current_level_num, align 4, !dbg !4117
  %310 = sub nsw i32 0, %309, !dbg !4118
  %311 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 454) #9, !dbg !4119
  %312 = load ptr, ptr %311, align 8, !dbg !4119
  %313 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 455) #9, !dbg !4120
  %314 = load ptr, ptr %313, align 8, !dbg !4120
  %315 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %302, ptr noundef @.str.21, ptr noundef %306, ptr noundef %308, i32 noundef %310, ptr noundef %312, ptr noundef @Current_level_name, ptr noundef %314) #9, !dbg !4121
  br label %330, !dbg !4121

316:                                              ; preds = %298
  %317 = getelementptr inbounds [128 x i8], ptr %16, i64 0, i64 0, !dbg !4122
  %318 = load i32, ptr %17, align 4, !dbg !4123
  %319 = icmp ne i32 %318, 0, !dbg !4123
  %320 = zext i1 %319 to i64, !dbg !4123
  %321 = select i1 %319, ptr @.str.22, ptr @.str.23, !dbg !4123
  %322 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 397) #9, !dbg !4124
  %323 = load ptr, ptr %322, align 8, !dbg !4124
  %324 = load i32, ptr @Current_level_num, align 4, !dbg !4125
  %325 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 454) #9, !dbg !4126
  %326 = load ptr, ptr %325, align 8, !dbg !4126
  %327 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 455) #9, !dbg !4127
  %328 = load ptr, ptr %327, align 8, !dbg !4127
  %329 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %317, ptr noundef @.str.24, ptr noundef %321, ptr noundef %323, i32 noundef %324, ptr noundef %326, ptr noundef @Current_level_name, ptr noundef %328) #9, !dbg !4128
  br label %330

330:                                              ; preds = %316, %301
  %331 = load i32, ptr %15, align 4, !dbg !4129
  %332 = icmp sle i32 %331, 11, !dbg !4129
  %333 = zext i1 %332 to i32, !dbg !4129
  call void @_Z7_AssertiPKcS0_i(i32 noundef %333, ptr noundef @.str.25, ptr noundef @.str.1, i32 noundef 1410), !dbg !4129
  %334 = call noundef i32 @_Z19gr_palette_fade_outPhii(ptr noundef @gr_palette, i32 noundef 32, i32 noundef 0), !dbg !4130
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.26), !dbg !4131
  %335 = getelementptr inbounds [128 x i8], ptr %16, i64 0, i64 0, !dbg !4132
  %336 = load i32, ptr %15, align 4, !dbg !4133
  %337 = getelementptr inbounds [12 x %struct.newmenu_item], ptr %13, i64 0, i64 0, !dbg !4134
  %338 = load i32, ptr @MenuHires, align 4, !dbg !4135
  %339 = icmp ne i32 %338, 0, !dbg !4135
  %340 = zext i1 %339 to i64, !dbg !4135
  %341 = select i1 %339, ptr @.str.27, ptr @.str.28, !dbg !4135
  %342 = call noundef i32 @_Z11newmenu_do2PKcS0_iP12newmenu_itemPFviS2_PiiEiS0_(ptr noundef null, ptr noundef %335, i32 noundef %336, ptr noundef %337, ptr noundef null, i32 noundef 0, ptr noundef %341), !dbg !4136
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.29), !dbg !4137
  ret void, !dbg !4138
}

declare noundef i32 @_Z15set_screen_modei(i32 noundef) #1

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr i32 @f2i(i32 noundef %0) #2 !dbg !4139 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !4142, !DIExpression(), !4143)
  %3 = load i32, ptr %2, align 4, !dbg !4144
  %4 = ashr i32 %3, 16, !dbg !4145
  ret i32 %4, !dbg !4146
}

declare void @_Z25add_bonus_points_to_scorei(i32 noundef) #1

declare noundef i32 @_Z19gr_palette_fade_outPhii(ptr noundef, i32 noundef, i32 noundef) #1

declare noundef i32 @_Z11newmenu_do2PKcS0_iP12newmenu_itemPFviS2_PiiEiS0_(ptr noundef, ptr noundef, i32 noundef, ptr noundef, ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define void @_Z14DoEndlevelMenuv() #2 !dbg !4147 {
  ret void, !dbg !4148
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z16StartSecretLevelv() #0 !dbg !4149 {
  %1 = load i32, ptr @Player_is_dead, align 4, !dbg !4150
  %2 = icmp ne i32 %1, 0, !dbg !4150
  %3 = xor i1 %2, true, !dbg !4150
  %4 = zext i1 %3 to i32, !dbg !4150
  call void @_Z7_AssertiPKcS0_i(i32 noundef %4, ptr noundef @.str.30, ptr noundef @.str.1, i32 noundef 1440), !dbg !4150
  call void @_Z18InitPlayerPositioni(i32 noundef 0), !dbg !4151
  call void @_Z21verify_console_objectv(), !dbg !4152
  %5 = load ptr, ptr @ConsoleObject, align 8, !dbg !4153
  %6 = getelementptr inbounds nuw %struct.object, ptr %5, i32 0, i32 5, !dbg !4154
  store i8 4, ptr %6, align 2, !dbg !4155
  %7 = load ptr, ptr @ConsoleObject, align 8, !dbg !4156
  %8 = getelementptr inbounds nuw %struct.object, ptr %7, i32 0, i32 6, !dbg !4157
  store i8 1, ptr %8, align 1, !dbg !4158
  call void @_Z23clear_transient_objectsi(i32 noundef 0), !dbg !4159
  store i32 1, ptr @Do_appearance_effect, align 4, !dbg !4160
  call void @_Z18ai_reset_all_pathsv(), !dbg !4161
  call void @_Z15reset_rear_viewv(), !dbg !4162
  store i32 0, ptr @Auto_fire_fusion_cannon_time, align 4, !dbg !4163
  store i32 0, ptr @Fusion_charge, align 4, !dbg !4164
  store i32 1, ptr @Robot_firing_enabled, align 4, !dbg !4165
  ret void, !dbg !4166
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z18InitPlayerPositioni(i32 noundef %0) #0 !dbg !4167 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !4168, !DIExpression(), !4169)
    #dbg_declare(ptr %3, !4170, !DIExpression(), !4171)
  %4 = load i32, ptr @Game_mode, align 4, !dbg !4172
  %5 = and i32 %4, 38, !dbg !4174
  %6 = icmp ne i32 %5, 0, !dbg !4175
  br i1 %6, label %7, label %11, !dbg !4176

7:                                                ; preds = %1
  %8 = load i32, ptr @Game_mode, align 4, !dbg !4177
  %9 = and i32 %8, 16, !dbg !4178
  %10 = icmp ne i32 %9, 0, !dbg !4179
  br i1 %10, label %11, label %13, !dbg !4180

11:                                               ; preds = %7, %1
  %12 = load i32, ptr @Player_num, align 4, !dbg !4181
  store i32 %12, ptr %3, align 4, !dbg !4182
  br label %14, !dbg !4183

13:                                               ; preds = %7
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.60), !dbg !4184
  br label %45, !dbg !4186

14:                                               ; preds = %11
  %15 = load i32, ptr %3, align 4, !dbg !4187
  %16 = icmp sge i32 %15, 0, !dbg !4187
  %17 = zext i1 %16 to i32, !dbg !4187
  call void @_Z7_AssertiPKcS0_i(i32 noundef %17, ptr noundef @.str.61, ptr noundef @.str.1, i32 noundef 2591), !dbg !4187
  %18 = load i32, ptr %3, align 4, !dbg !4188
  %19 = load i32, ptr @NumNetPlayerPositions, align 4, !dbg !4188
  %20 = icmp slt i32 %18, %19, !dbg !4188
  %21 = zext i1 %20 to i32, !dbg !4188
  call void @_Z7_AssertiPKcS0_i(i32 noundef %21, ptr noundef @.str.62, ptr noundef @.str.1, i32 noundef 2592), !dbg !4188
  %22 = load i32, ptr %3, align 4, !dbg !4189
  %23 = sext i32 %22 to i64, !dbg !4190
  %24 = getelementptr inbounds [8 x %struct.obj_position], ptr @Player_init, i64 0, i64 %23, !dbg !4190
  %25 = getelementptr inbounds nuw %struct.obj_position, ptr %24, i32 0, i32 0, !dbg !4191
  %26 = load ptr, ptr @ConsoleObject, align 8, !dbg !4192
  %27 = getelementptr inbounds nuw %struct.object, ptr %26, i32 0, i32 11, !dbg !4193
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %27, ptr align 4 %25, i64 12, i1 false), !dbg !4194
  %28 = load i32, ptr %3, align 4, !dbg !4195
  %29 = sext i32 %28 to i64, !dbg !4196
  %30 = getelementptr inbounds [8 x %struct.obj_position], ptr @Player_init, i64 0, i64 %29, !dbg !4196
  %31 = getelementptr inbounds nuw %struct.obj_position, ptr %30, i32 0, i32 1, !dbg !4197
  %32 = load ptr, ptr @ConsoleObject, align 8, !dbg !4198
  %33 = getelementptr inbounds nuw %struct.object, ptr %32, i32 0, i32 12, !dbg !4199
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %33, ptr align 4 %31, i64 36, i1 false), !dbg !4200
  %34 = load ptr, ptr @ConsoleObject, align 8, !dbg !4201
  %35 = ptrtoint ptr %34 to i64, !dbg !4202
  %36 = sub i64 %35, ptrtoint (ptr @Objects to i64), !dbg !4202
  %37 = sdiv exact i64 %36, 268, !dbg !4202
  %38 = trunc i64 %37 to i32, !dbg !4201
  %39 = load i32, ptr %3, align 4, !dbg !4203
  %40 = sext i32 %39 to i64, !dbg !4204
  %41 = getelementptr inbounds [8 x %struct.obj_position], ptr @Player_init, i64 0, i64 %40, !dbg !4204
  %42 = getelementptr inbounds nuw %struct.obj_position, ptr %41, i32 0, i32 2, !dbg !4205
  %43 = load i16, ptr %42, align 4, !dbg !4205
  %44 = sext i16 %43 to i32, !dbg !4204
  call void @_Z10obj_relinkii(i32 noundef %38, i32 noundef %44), !dbg !4206
  br label %45, !dbg !4206

45:                                               ; preds = %14, %13
    #dbg_label(!4207, !4208)
  call void @_Z19reset_player_objectv(), !dbg !4209
  call void @_Z12reset_cruisev(), !dbg !4210
  ret void, !dbg !4211
}

declare void @_Z23clear_transient_objectsi(i32 noundef) #1

declare void @_Z18ai_reset_all_pathsv() #1

declare void @_Z15reset_rear_viewv() #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z24p_secret_level_destroyedv() #0 !dbg !4212 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = load i32, ptr @First_secret_visit, align 4, !dbg !4213
  %4 = icmp ne i32 %3, 0, !dbg !4213
  br i1 %4, label %5, label %6, !dbg !4213

5:                                                ; preds = %0
  store i32 0, ptr %1, align 4, !dbg !4215
  br label %13, !dbg !4215

6:                                                ; preds = %0
    #dbg_declare(ptr %2, !4217, !DIExpression(), !4219)
  %7 = call ptr @"\01_fopen"(ptr noundef @.str.31, ptr noundef @.str.7), !dbg !4220
  store ptr %7, ptr %2, align 8, !dbg !4222
  %8 = icmp ne ptr %7, null, !dbg !4223
  br i1 %8, label %9, label %12, !dbg !4223

9:                                                ; preds = %6
  %10 = load ptr, ptr %2, align 8, !dbg !4224
  %11 = call i32 @fclose(ptr noundef %10), !dbg !4226
  store i32 0, ptr %1, align 4, !dbg !4227
  br label %13, !dbg !4227

12:                                               ; preds = %6
  store i32 1, ptr %1, align 4, !dbg !4228
  br label %13, !dbg !4228

13:                                               ; preds = %12, %9, %5
  %14 = load i32, ptr %1, align 4, !dbg !4230
  ret i32 %14, !dbg !4230
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z17do_secret_messagePc(ptr noundef %0) #0 !dbg !4231 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !4232, !DIExpression(), !4233)
    #dbg_declare(ptr %3, !4234, !DIExpression(), !4235)
  call void @_Z10load_starsv(), !dbg !4236
  %4 = load i32, ptr @Function_mode, align 4, !dbg !4237
  store i32 %4, ptr %3, align 4, !dbg !4238
  store i32 1, ptr @Function_mode, align 4, !dbg !4239
  %5 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 34) #9, !dbg !4240
  %6 = load ptr, ptr %5, align 8, !dbg !4240
  %7 = load ptr, ptr %2, align 8, !dbg !4241
  %8 = call noundef i32 (ptr, i32, ...) @_Z13nm_messageboxPKciz(ptr noundef null, i32 noundef 1, ptr noundef %6, ptr noundef %7), !dbg !4242
  %9 = load i32, ptr %3, align 4, !dbg !4243
  store i32 %9, ptr @Function_mode, align 4, !dbg !4244
  ret void, !dbg !4245
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z10load_starsv() #0 !dbg !4246 {
  %1 = load i32, ptr @MenuHires, align 4, !dbg !4247
  %2 = icmp ne i32 %1, 0, !dbg !4247
  %3 = zext i1 %2 to i64, !dbg !4247
  %4 = select i1 %2, ptr @.str.27, ptr @.str.28, !dbg !4247
  call void @_Z19nm_draw_background1PKc(ptr noundef %4), !dbg !4248
  ret void, !dbg !4249
}

declare void @_Z21newdemo_set_new_leveli(i32 noundef) #1

declare void @_Z26newdemo_record_start_frameii(i32 noundef, i32 noundef) #1

declare void @_Z18HUD_clear_messagesv() #1

declare void @_Z21automap_clear_visitedv() #1

declare void @_Z12init_cockpitv() #1

declare void @_Z17reset_palette_addv() #1

declare void @_Z21init_robots_for_levelv() #1

declare void @_Z15init_ai_objectsv() #1

declare void @_Z20init_smega_detonatesv() #1

declare void @_Z11init_morphsv() #1

declare void @_Z16init_all_matcensv() #1

declare void @_Z21reset_special_effectsv() #1

declare noundef i32 @_Z17state_restore_alliiPc(i32 noundef, i32 noundef, ptr noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z26copy_defaults_to_robot_allv() #0 !dbg !4250 {
  %1 = alloca i32, align 4
    #dbg_declare(ptr %1, !4251, !DIExpression(), !4252)
  store i32 0, ptr %1, align 4, !dbg !4253
  br label %2, !dbg !4255

2:                                                ; preds = %19, %0
  %3 = load i32, ptr %1, align 4, !dbg !4256
  %4 = load i32, ptr @Highest_object_index, align 4, !dbg !4258
  %5 = icmp sle i32 %3, %4, !dbg !4259
  br i1 %5, label %6, label %22, !dbg !4260

6:                                                ; preds = %2
  %7 = load i32, ptr %1, align 4, !dbg !4261
  %8 = sext i32 %7 to i64, !dbg !4263
  %9 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %8, !dbg !4263
  %10 = getelementptr inbounds nuw %struct.object, ptr %9, i32 0, i32 1, !dbg !4264
  %11 = load i8, ptr %10, align 4, !dbg !4264
  %12 = zext i8 %11 to i32, !dbg !4263
  %13 = icmp eq i32 %12, 2, !dbg !4265
  br i1 %13, label %14, label %18, !dbg !4265

14:                                               ; preds = %6
  %15 = load i32, ptr %1, align 4, !dbg !4266
  %16 = sext i32 %15 to i64, !dbg !4267
  %17 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %16, !dbg !4267
  call void @_Z22copy_defaults_to_robotP6object(ptr noundef %17), !dbg !4268
  br label %18, !dbg !4268

18:                                               ; preds = %14, %6
  br label %19, !dbg !4269

19:                                               ; preds = %18
  %20 = load i32, ptr %1, align 4, !dbg !4270
  %21 = add nsw i32 %20, 1, !dbg !4270
  store i32 %21, ptr %1, align 4, !dbg !4270
  br label %2, !dbg !4271, !llvm.loop !4272

22:                                               ; preds = %2
  ret void, !dbg !4274
}

declare void @_Z15turn_cheats_offv() #1

declare void @_Z25init_controlcen_for_levelv() #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z15ExitSecretLevelv() #0 !dbg !4275 {
  %1 = alloca ptr, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
    #dbg_declare(ptr %1, !4276, !DIExpression(), !4277)
  %4 = load i32, ptr @Newdemo_state, align 4, !dbg !4278
  %5 = icmp eq i32 %4, 2, !dbg !4280
  br i1 %5, label %6, label %7, !dbg !4280

6:                                                ; preds = %0
  br label %36, !dbg !4281

7:                                                ; preds = %0
  %8 = load i32, ptr @Control_center_destroyed, align 4, !dbg !4282
  %9 = icmp ne i32 %8, 0, !dbg !4282
  br i1 %9, label %12, label %10, !dbg !4284

10:                                               ; preds = %7
  %11 = call noundef i32 @_Z14state_save_alliiPc(i32 noundef 0, i32 noundef 2, ptr noundef @.str.31), !dbg !4285
  br label %12, !dbg !4287

12:                                               ; preds = %10, %7
  %13 = call ptr @"\01_fopen"(ptr noundef @.str.36, ptr noundef @.str.7), !dbg !4288
  store ptr %13, ptr %1, align 8, !dbg !4290
  %14 = icmp ne ptr %13, null, !dbg !4291
  br i1 %14, label %15, label %27, !dbg !4291

15:                                               ; preds = %12
    #dbg_declare(ptr %2, !4292, !DIExpression(), !4294)
    #dbg_declare(ptr %3, !4295, !DIExpression(), !4296)
  call void @_Z26returning_to_level_messagev(), !dbg !4297
  %16 = load ptr, ptr %1, align 8, !dbg !4298
  %17 = call i32 @fclose(ptr noundef %16), !dbg !4299
  %18 = load i8, ptr @Primary_weapon, align 1, !dbg !4300
  %19 = sext i8 %18 to i32, !dbg !4300
  store i32 %19, ptr %2, align 4, !dbg !4301
  %20 = load i8, ptr @Secondary_weapon, align 1, !dbg !4302
  %21 = sext i8 %20 to i32, !dbg !4302
  store i32 %21, ptr %3, align 4, !dbg !4303
  %22 = call noundef i32 @_Z17state_restore_alliiPc(i32 noundef 1, i32 noundef 1, ptr noundef @.str.36), !dbg !4304
  %23 = load i32, ptr %2, align 4, !dbg !4305
  %24 = trunc i32 %23 to i8, !dbg !4305
  store i8 %24, ptr @Primary_weapon, align 1, !dbg !4306
  %25 = load i32, ptr %3, align 4, !dbg !4307
  %26 = trunc i32 %25 to i8, !dbg !4307
  store i8 %26, ptr @Secondary_weapon, align 1, !dbg !4308
  br label %36, !dbg !4309

27:                                               ; preds = %12
  %28 = load i32, ptr @Entered_from_level, align 4, !dbg !4310
  %29 = load i32, ptr @Last_level, align 4, !dbg !4313
  %30 = icmp eq i32 %28, %29, !dbg !4314
  br i1 %30, label %31, label %32, !dbg !4314

31:                                               ; preds = %27
  call void @_Z9DoEndGamev(), !dbg !4315
  br label %35, !dbg !4315

32:                                               ; preds = %27
  call void @_Z26advancing_to_level_messagev(), !dbg !4316
  %33 = load i32, ptr @Entered_from_level, align 4, !dbg !4318
  %34 = add nsw i32 %33, 1, !dbg !4319
  call void @_Z13StartNewLevelii(i32 noundef %34, i32 noundef 0), !dbg !4320
  br label %35

35:                                               ; preds = %32, %31
  br label %36

36:                                               ; preds = %6, %35, %15
  ret void, !dbg !4321
}

declare noundef i32 @_Z14state_save_alliiPc(i32 noundef, i32 noundef, ptr noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z26returning_to_level_messagev() #0 !dbg !4322 {
  %1 = alloca [128 x i8], align 1
  %2 = alloca i32, align 4
    #dbg_declare(ptr %1, !4323, !DIExpression(), !4324)
    #dbg_declare(ptr %2, !4325, !DIExpression(), !4326)
  %3 = load i32, ptr @Game_mode, align 4, !dbg !4327
  %4 = and i32 %3, 38, !dbg !4329
  %5 = icmp ne i32 %4, 0, !dbg !4327
  br i1 %5, label %6, label %7, !dbg !4327

6:                                                ; preds = %0
  br label %19, !dbg !4330

7:                                                ; preds = %0
  %8 = call noundef i32 @_Z19gr_palette_fade_outPhii(ptr noundef @gr_palette, i32 noundef 32, i32 noundef 0), !dbg !4331
  %9 = call noundef i32 @_Z15set_screen_modei(i32 noundef 0), !dbg !4332
  call void @_Z21gr_set_current_canvasP11_grs_canvas(ptr noundef null), !dbg !4333
  call void @_Z10load_starsv(), !dbg !4334
  %10 = load i32, ptr @Function_mode, align 4, !dbg !4335
  store i32 %10, ptr %2, align 4, !dbg !4336
  store i32 1, ptr @Function_mode, align 4, !dbg !4337
  %11 = getelementptr inbounds [128 x i8], ptr %1, i64 0, i64 0, !dbg !4338
  %12 = load i32, ptr @Entered_from_level, align 4, !dbg !4339
  %13 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %11, ptr noundef @.str.50, i32 noundef %12) #9, !dbg !4340
  %14 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 34) #9, !dbg !4341
  %15 = load ptr, ptr %14, align 8, !dbg !4341
  %16 = getelementptr inbounds [128 x i8], ptr %1, i64 0, i64 0, !dbg !4342
  %17 = call noundef i32 (ptr, i32, ...) @_Z13nm_messageboxPKciz(ptr noundef null, i32 noundef 1, ptr noundef %15, ptr noundef %16), !dbg !4343
  %18 = load i32, ptr %2, align 4, !dbg !4344
  store i32 %18, ptr @Function_mode, align 4, !dbg !4345
  br label %19, !dbg !4346

19:                                               ; preds = %7, %6
  ret void, !dbg !4346
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z9DoEndGamev() #0 !dbg !4347 {
  %1 = alloca i32, align 4
  %2 = alloca [13 x i8], align 1
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.39), !dbg !4348
  store i32 1, ptr @Function_mode, align 4, !dbg !4349
  %3 = load i32, ptr @Newdemo_state, align 4, !dbg !4350
  %4 = icmp eq i32 %3, 1, !dbg !4352
  br i1 %4, label %8, label %5, !dbg !4353

5:                                                ; preds = %0
  %6 = load i32, ptr @Newdemo_state, align 4, !dbg !4354
  %7 = icmp eq i32 %6, 3, !dbg !4355
  br i1 %7, label %8, label %9, !dbg !4353

8:                                                ; preds = %5, %0
  call void @_Z22newdemo_stop_recordingv(), !dbg !4356
  br label %9, !dbg !4356

9:                                                ; preds = %8, %5
  %10 = call noundef i32 @_Z15set_screen_modei(i32 noundef 0), !dbg !4357
  call void @_Z21gr_set_current_canvasP11_grs_canvas(ptr noundef null), !dbg !4358
  call void @_Z9key_flushv(), !dbg !4359
  %11 = load i32, ptr @Current_mission_num, align 4, !dbg !4360
  %12 = icmp eq i32 %11, 0, !dbg !4362
  br i1 %12, label %13, label %25, !dbg !4363

13:                                               ; preds = %9
  %14 = load i32, ptr @Game_mode, align 4, !dbg !4364
  %15 = and i32 %14, 38, !dbg !4365
  %16 = icmp ne i32 %15, 0, !dbg !4366
  br i1 %16, label %25, label %17, !dbg !4363

17:                                               ; preds = %13
    #dbg_declare(ptr %1, !4367, !DIExpression(), !4369)
  store i32 0, ptr %1, align 4, !dbg !4369
  %18 = load i32, ptr @CurrentDataVersion, align 4, !dbg !4370
  %19 = icmp eq i32 %18, 0, !dbg !4372
  br i1 %19, label %20, label %21, !dbg !4372

20:                                               ; preds = %17
  call void @_Z15songs_play_songii(i32 noundef 3, i32 noundef 0), !dbg !4373
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.40), !dbg !4375
  call void @_Z19do_briefing_screensPKci(ptr noundef @.str.41, i32 noundef 1), !dbg !4376
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.42), !dbg !4377
  br label %24, !dbg !4378

21:                                               ; preds = %17
  %22 = call noundef i32 @_Z14init_subtitlesPKc(ptr noundef @.str.43), !dbg !4379
  %23 = call noundef i32 @_Z9PlayMoviePKci(ptr noundef @.str.44, i32 noundef 0), !dbg !4381
  store i32 %23, ptr %1, align 4, !dbg !4382
  call void @_Z15close_subtitlesv(), !dbg !4383
  br label %24

24:                                               ; preds = %21, %20
  br label %41, !dbg !4384

25:                                               ; preds = %13, %9
  %26 = load i32, ptr @Game_mode, align 4, !dbg !4385
  %27 = and i32 %26, 38, !dbg !4387
  %28 = icmp ne i32 %27, 0, !dbg !4388
  br i1 %28, label %40, label %29, !dbg !4389

29:                                               ; preds = %25
    #dbg_declare(ptr %2, !4390, !DIExpression(), !4392)
  %30 = getelementptr inbounds [13 x i8], ptr %2, i64 0, i64 0, !dbg !4393
  %31 = load ptr, ptr @Current_mission_filename, align 8, !dbg !4394
  %32 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %30, ptr noundef @.str.45, ptr noundef %31) #9, !dbg !4395
  %33 = getelementptr inbounds [13 x i8], ptr %2, i64 0, i64 0, !dbg !4396
  %34 = load i32, ptr @Last_level, align 4, !dbg !4397
  %35 = add nsw i32 %34, 1, !dbg !4398
  call void @_Z19do_briefing_screensPKci(ptr noundef %33, i32 noundef %35), !dbg !4399
  %36 = getelementptr inbounds [13 x i8], ptr %2, i64 0, i64 0, !dbg !4400
  %37 = load ptr, ptr @Current_mission_filename, align 8, !dbg !4401
  %38 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %36, ptr noundef @.str.46, ptr noundef %37) #9, !dbg !4402
  %39 = getelementptr inbounds [13 x i8], ptr %2, i64 0, i64 0, !dbg !4403
  call void @_Z12credits_showPc(ptr noundef %39), !dbg !4404
  br label %40, !dbg !4405

40:                                               ; preds = %29, %25
  br label %41

41:                                               ; preds = %40, %24
  call void @_Z9key_flushv(), !dbg !4406
  %42 = load i32, ptr @CurrentDataVersion, align 4, !dbg !4407
  %43 = icmp eq i32 %42, 0, !dbg !4409
  br i1 %43, label %44, label %45, !dbg !4409

44:                                               ; preds = %41
  call void @_Z15show_order_formv(), !dbg !4410
  br label %45, !dbg !4410

45:                                               ; preds = %44, %41
  call void @_Z20DoEndLevelScoreGlitzi(i32 noundef 0), !dbg !4411
  %46 = load i32, ptr @Current_mission_num, align 4, !dbg !4412
  %47 = icmp eq i32 %46, 0, !dbg !4414
  br i1 %47, label %48, label %59, !dbg !4415

48:                                               ; preds = %45
  %49 = load i32, ptr @Game_mode, align 4, !dbg !4416
  %50 = and i32 %49, 38, !dbg !4417
  %51 = icmp ne i32 %50, 0, !dbg !4418
  br i1 %51, label %52, label %56, !dbg !4419

52:                                               ; preds = %48
  %53 = load i32, ptr @Game_mode, align 4, !dbg !4420
  %54 = and i32 %53, 16, !dbg !4421
  %55 = icmp ne i32 %54, 0, !dbg !4422
  br i1 %55, label %56, label %59, !dbg !4415

56:                                               ; preds = %52, %48
  call void @_Z21gr_set_current_canvasP11_grs_canvas(ptr noundef null), !dbg !4423
  %57 = call noundef i32 @_Z21gr_find_closest_coloriii(i32 noundef 0, i32 noundef 0, i32 noundef 0), !dbg !4425
  call void @_Z15gr_clear_canvasi(i32 noundef %57), !dbg !4425
  call void @_Z16gr_palette_clearv(), !dbg !4426
  %58 = call noundef i32 @_Z12load_palettePKcii(ptr noundef @.str.47, i32 noundef 0, i32 noundef 1), !dbg !4427
  call void @_Z23scores_maybe_add_playeri(i32 noundef 0), !dbg !4428
  br label %59, !dbg !4429

59:                                               ; preds = %56, %52, %45
  store i32 1, ptr @Function_mode, align 4, !dbg !4430
  store i32 128, ptr @Game_mode, align 4, !dbg !4431
  call void @longjmp(ptr noundef @LeaveGame, i32 noundef 0) #8, !dbg !4432
  unreachable, !dbg !4432
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z26advancing_to_level_messagev() #0 !dbg !4433 {
  %1 = alloca [128 x i8], align 1
  %2 = alloca i32, align 4
    #dbg_declare(ptr %1, !4434, !DIExpression(), !4435)
    #dbg_declare(ptr %2, !4436, !DIExpression(), !4437)
  %3 = load i32, ptr @Current_level_num, align 4, !dbg !4438
  %4 = icmp slt i32 %3, 0, !dbg !4438
  %5 = zext i1 %4 to i32, !dbg !4438
  call void @_Z7_AssertiPKcS0_i(i32 noundef %5, ptr noundef @.str.51, ptr noundef @.str.1, i32 noundef 2059), !dbg !4438
  %6 = load i32, ptr @Game_mode, align 4, !dbg !4439
  %7 = and i32 %6, 38, !dbg !4441
  %8 = icmp ne i32 %7, 0, !dbg !4439
  br i1 %8, label %9, label %10, !dbg !4439

9:                                                ; preds = %0
  br label %23, !dbg !4442

10:                                               ; preds = %0
  %11 = call noundef i32 @_Z19gr_palette_fade_outPhii(ptr noundef @gr_palette, i32 noundef 32, i32 noundef 0), !dbg !4443
  %12 = call noundef i32 @_Z15set_screen_modei(i32 noundef 0), !dbg !4444
  call void @_Z21gr_set_current_canvasP11_grs_canvas(ptr noundef null), !dbg !4445
  call void @_Z10load_starsv(), !dbg !4446
  %13 = load i32, ptr @Function_mode, align 4, !dbg !4447
  store i32 %13, ptr %2, align 4, !dbg !4448
  store i32 1, ptr @Function_mode, align 4, !dbg !4449
  %14 = getelementptr inbounds [128 x i8], ptr %1, i64 0, i64 0, !dbg !4450
  %15 = load i32, ptr @Entered_from_level, align 4, !dbg !4451
  %16 = add nsw i32 %15, 1, !dbg !4452
  %17 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %14, ptr noundef @.str.52, i32 noundef %16) #9, !dbg !4453
  %18 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 34) #9, !dbg !4454
  %19 = load ptr, ptr %18, align 8, !dbg !4454
  %20 = getelementptr inbounds [128 x i8], ptr %1, i64 0, i64 0, !dbg !4455
  %21 = call noundef i32 (ptr, i32, ...) @_Z13nm_messageboxPKciz(ptr noundef null, i32 noundef 1, ptr noundef %19, ptr noundef %20), !dbg !4456
  %22 = load i32, ptr %2, align 4, !dbg !4457
  store i32 %22, ptr @Function_mode, align 4, !dbg !4458
  br label %23, !dbg !4459

23:                                               ; preds = %10, %9
  ret void, !dbg !4459
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define void @_Z27do_cloak_invul_secret_stuffi(i32 noundef %0) #2 !dbg !4460 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !4463, !DIExpression(), !4464)
  %5 = load i32, ptr @Player_num, align 4, !dbg !4465
  %6 = sext i32 %5 to i64, !dbg !4467
  %7 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %6, !dbg !4467
  %8 = getelementptr inbounds nuw %struct.player, ptr %7, i32 0, i32 7, !dbg !4468
  %9 = load i32, ptr %8, align 4, !dbg !4468
  %10 = and i32 %9, 1, !dbg !4469
  %11 = icmp ne i32 %10, 0, !dbg !4467
  br i1 %11, label %12, label %27, !dbg !4467

12:                                               ; preds = %1
    #dbg_declare(ptr %3, !4470, !DIExpression(), !4472)
  %13 = load i32, ptr %2, align 4, !dbg !4473
  %14 = load i32, ptr @Player_num, align 4, !dbg !4474
  %15 = sext i32 %14 to i64, !dbg !4475
  %16 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %15, !dbg !4475
  %17 = getelementptr inbounds nuw %struct.player, ptr %16, i32 0, i32 25, !dbg !4476
  %18 = load i32, ptr %17, align 4, !dbg !4476
  %19 = sub nsw i32 %13, %18, !dbg !4477
  store i32 %19, ptr %3, align 4, !dbg !4478
  %20 = load i32, ptr @GameTime, align 4, !dbg !4479
  %21 = load i32, ptr %3, align 4, !dbg !4480
  %22 = sub nsw i32 %20, %21, !dbg !4481
  %23 = load i32, ptr @Player_num, align 4, !dbg !4482
  %24 = sext i32 %23 to i64, !dbg !4483
  %25 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %24, !dbg !4483
  %26 = getelementptr inbounds nuw %struct.player, ptr %25, i32 0, i32 25, !dbg !4484
  store i32 %22, ptr %26, align 4, !dbg !4485
  br label %27, !dbg !4486

27:                                               ; preds = %12, %1
  %28 = load i32, ptr @Player_num, align 4, !dbg !4487
  %29 = sext i32 %28 to i64, !dbg !4489
  %30 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %29, !dbg !4489
  %31 = getelementptr inbounds nuw %struct.player, ptr %30, i32 0, i32 7, !dbg !4490
  %32 = load i32, ptr %31, align 4, !dbg !4490
  %33 = and i32 %32, 2048, !dbg !4491
  %34 = icmp ne i32 %33, 0, !dbg !4489
  br i1 %34, label %35, label %50, !dbg !4489

35:                                               ; preds = %27
    #dbg_declare(ptr %4, !4492, !DIExpression(), !4494)
  %36 = load i32, ptr %2, align 4, !dbg !4495
  %37 = load i32, ptr @Player_num, align 4, !dbg !4496
  %38 = sext i32 %37 to i64, !dbg !4497
  %39 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %38, !dbg !4497
  %40 = getelementptr inbounds nuw %struct.player, ptr %39, i32 0, i32 24, !dbg !4498
  %41 = load i32, ptr %40, align 4, !dbg !4498
  %42 = sub nsw i32 %36, %41, !dbg !4499
  store i32 %42, ptr %4, align 4, !dbg !4500
  %43 = load i32, ptr @GameTime, align 4, !dbg !4501
  %44 = load i32, ptr %4, align 4, !dbg !4502
  %45 = sub nsw i32 %43, %44, !dbg !4503
  %46 = load i32, ptr @Player_num, align 4, !dbg !4504
  %47 = sext i32 %46 to i64, !dbg !4505
  %48 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %47, !dbg !4505
  %49 = getelementptr inbounds nuw %struct.player, ptr %48, i32 0, i32 24, !dbg !4506
  store i32 %45, ptr %49, align 4, !dbg !4507
  br label %50, !dbg !4508

50:                                               ; preds = %35, %27
  ret void, !dbg !4509
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z16EnterSecretLevelv() #0 !dbg !4510 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
    #dbg_declare(ptr %1, !4511, !DIExpression(), !4512)
    #dbg_declare(ptr %2, !4513, !DIExpression(), !4514)
  %3 = load i32, ptr @Game_mode, align 4, !dbg !4515
  %4 = and i32 %3, 38, !dbg !4515
  %5 = icmp ne i32 %4, 0, !dbg !4515
  %6 = xor i1 %5, true, !dbg !4515
  %7 = zext i1 %6 to i32, !dbg !4515
  call void @_Z7_AssertiPKcS0_i(i32 noundef %7, ptr noundef @.str.37, ptr noundef @.str.1, i32 noundef 1730), !dbg !4515
  %8 = load i32, ptr @Current_level_num, align 4, !dbg !4516
  store i32 %8, ptr @Entered_from_level, align 4, !dbg !4517
  %9 = load i32, ptr @Control_center_destroyed, align 4, !dbg !4518
  %10 = icmp ne i32 %9, 0, !dbg !4518
  br i1 %10, label %11, label %12, !dbg !4518

11:                                               ; preds = %0
  call void @_Z20DoEndLevelScoreGlitzi(i32 noundef 0), !dbg !4520
  br label %12, !dbg !4520

12:                                               ; preds = %11, %0
  %13 = load i32, ptr @Newdemo_state, align 4, !dbg !4521
  %14 = icmp ne i32 %13, 2, !dbg !4523
  br i1 %14, label %15, label %17, !dbg !4523

15:                                               ; preds = %12
  %16 = call noundef i32 @_Z14state_save_alliiPc(i32 noundef 0, i32 noundef 1, ptr noundef null), !dbg !4524
  br label %17, !dbg !4524

17:                                               ; preds = %15, %12
  store i32 0, ptr %2, align 4, !dbg !4525
  br label %18, !dbg !4527

18:                                               ; preds = %46, %17
  %19 = load i32, ptr %2, align 4, !dbg !4528
  %20 = load i32, ptr @Last_secret_level, align 4, !dbg !4530
  %21 = sub nsw i32 0, %20, !dbg !4531
  %22 = icmp slt i32 %19, %21, !dbg !4532
  br i1 %22, label %23, label %49, !dbg !4533

23:                                               ; preds = %18
  %24 = load i32, ptr %2, align 4, !dbg !4534
  %25 = sext i32 %24 to i64, !dbg !4536
  %26 = getelementptr inbounds [6 x i32], ptr @Secret_level_table, i64 0, i64 %25, !dbg !4536
  %27 = load i32, ptr %26, align 4, !dbg !4536
  %28 = load i32, ptr @Current_level_num, align 4, !dbg !4537
  %29 = icmp eq i32 %27, %28, !dbg !4538
  br i1 %29, label %30, label %34, !dbg !4538

30:                                               ; preds = %23
  %31 = load i32, ptr %2, align 4, !dbg !4539
  %32 = add nsw i32 %31, 1, !dbg !4541
  %33 = sub nsw i32 0, %32, !dbg !4542
  store i32 %33, ptr @Next_level_num, align 4, !dbg !4543
  br label %50, !dbg !4544

34:                                               ; preds = %23
  %35 = load i32, ptr %2, align 4, !dbg !4545
  %36 = sext i32 %35 to i64, !dbg !4547
  %37 = getelementptr inbounds [6 x i32], ptr @Secret_level_table, i64 0, i64 %36, !dbg !4547
  %38 = load i32, ptr %37, align 4, !dbg !4547
  %39 = load i32, ptr @Current_level_num, align 4, !dbg !4548
  %40 = icmp sgt i32 %38, %39, !dbg !4549
  br i1 %40, label %41, label %44, !dbg !4549

41:                                               ; preds = %34
  %42 = load i32, ptr %2, align 4, !dbg !4550
  %43 = sub nsw i32 0, %42, !dbg !4552
  store i32 %43, ptr @Next_level_num, align 4, !dbg !4553
  br label %50, !dbg !4554

44:                                               ; preds = %34
  br label %45

45:                                               ; preds = %44
  br label %46, !dbg !4537

46:                                               ; preds = %45
  %47 = load i32, ptr %2, align 4, !dbg !4555
  %48 = add nsw i32 %47, 1, !dbg !4555
  store i32 %48, ptr %2, align 4, !dbg !4555
  br label %18, !dbg !4556, !llvm.loop !4557

49:                                               ; preds = %18
  br label %50, !dbg !4559

50:                                               ; preds = %49, %41, %30
  %51 = load i32, ptr %2, align 4, !dbg !4559
  %52 = load i32, ptr @Last_secret_level, align 4, !dbg !4561
  %53 = sub nsw i32 0, %52, !dbg !4562
  %54 = icmp slt i32 %51, %53, !dbg !4563
  br i1 %54, label %57, label %55, !dbg !4564

55:                                               ; preds = %50
  %56 = load i32, ptr @Last_secret_level, align 4, !dbg !4565
  store i32 %56, ptr @Next_level_num, align 4, !dbg !4566
  br label %57, !dbg !4567

57:                                               ; preds = %55, %50
  %58 = load i32, ptr @GameTime, align 4, !dbg !4568
  store i32 %58, ptr %1, align 4, !dbg !4569
  %59 = load i32, ptr @Next_level_num, align 4, !dbg !4570
  call void @_Z19StartNewLevelSecretii(i32 noundef %59, i32 noundef 1), !dbg !4571
  ret void, !dbg !4572
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z19PlayerFinishedLeveli(i32 noundef %0) #0 !dbg !4573 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !4574, !DIExpression(), !4575)
  %3 = load i32, ptr %2, align 4, !dbg !4576
  %4 = icmp ne i32 %3, 0, !dbg !4576
  %5 = xor i1 %4, true, !dbg !4576
  %6 = zext i1 %5 to i32, !dbg !4576
  call void @_Z7_AssertiPKcS0_i(i32 noundef %6, ptr noundef @.str.38, ptr noundef @.str.1, i32 noundef 1768), !dbg !4576
  %7 = load i32, ptr @Player_num, align 4, !dbg !4577
  %8 = sext i32 %7 to i64, !dbg !4578
  %9 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %8, !dbg !4578
  %10 = getelementptr inbounds nuw %struct.player, ptr %9, i32 0, i32 35, !dbg !4579
  %11 = load i8, ptr %10, align 2, !dbg !4579
  %12 = zext i8 %11 to i32, !dbg !4578
  %13 = load i32, ptr @Player_num, align 4, !dbg !4580
  %14 = sext i32 %13 to i64, !dbg !4581
  %15 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %14, !dbg !4581
  %16 = getelementptr inbounds nuw %struct.player, ptr %15, i32 0, i32 33, !dbg !4582
  %17 = load i16, ptr %16, align 2, !dbg !4583
  %18 = zext i16 %17 to i32, !dbg !4583
  %19 = add nsw i32 %18, %12, !dbg !4583
  %20 = trunc i32 %19 to i16, !dbg !4583
  store i16 %20, ptr %16, align 2, !dbg !4583
  %21 = load i32, ptr @Game_mode, align 4, !dbg !4584
  %22 = and i32 %21, 4, !dbg !4586
  %23 = icmp ne i32 %22, 0, !dbg !4584
  br i1 %23, label %24, label %29, !dbg !4584

24:                                               ; preds = %1
  %25 = load i32, ptr @Player_num, align 4, !dbg !4587
  %26 = sext i32 %25 to i64, !dbg !4588
  %27 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %26, !dbg !4588
  %28 = getelementptr inbounds nuw %struct.player, ptr %27, i32 0, i32 3, !dbg !4589
  store i8 2, ptr %28, align 4, !dbg !4590
  br label %29, !dbg !4588

29:                                               ; preds = %24, %1
  store i32 -1, ptr @last_drawn_cockpit, align 4, !dbg !4591
  %30 = load i32, ptr %2, align 4, !dbg !4592
  call void @_Z12AdvanceLeveli(i32 noundef %30), !dbg !4593
  ret void, !dbg !4594
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z12AdvanceLeveli(i32 noundef %0) #0 !dbg !4595 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !4596, !DIExpression(), !4597)
    #dbg_declare(ptr %3, !4598, !DIExpression(), !4599)
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.48), !dbg !4600
  %4 = load i32, ptr %2, align 4, !dbg !4601
  %5 = icmp ne i32 %4, 0, !dbg !4601
  %6 = xor i1 %5, true, !dbg !4601
  %7 = zext i1 %6 to i32, !dbg !4601
  call void @_Z7_AssertiPKcS0_i(i32 noundef %7, ptr noundef @.str.38, ptr noundef @.str.1, i32 noundef 1891), !dbg !4601
  %8 = load i32, ptr @Current_level_num, align 4, !dbg !4602
  %9 = load i32, ptr @Last_level, align 4, !dbg !4604
  %10 = icmp ne i32 %8, %9, !dbg !4605
  br i1 %10, label %11, label %12, !dbg !4605

11:                                               ; preds = %1
  call void @_Z20DoEndLevelScoreGlitzi(i32 noundef 0), !dbg !4606
  br label %12, !dbg !4608

12:                                               ; preds = %11, %1
  store i32 0, ptr @Control_center_destroyed, align 4, !dbg !4609
  %13 = load i32, ptr @Current_level_num, align 4, !dbg !4610
  %14 = load i32, ptr @Last_level, align 4, !dbg !4612
  %15 = icmp eq i32 %13, %14, !dbg !4613
  br i1 %15, label %16, label %17, !dbg !4613

16:                                               ; preds = %12
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.49), !dbg !4614
  call void @_Z9DoEndGamev(), !dbg !4616
  br label %26, !dbg !4617

17:                                               ; preds = %12
  %18 = load i32, ptr @Current_level_num, align 4, !dbg !4618
  %19 = add nsw i32 %18, 1, !dbg !4620
  store i32 %19, ptr @Next_level_num, align 4, !dbg !4621
  %20 = load i32, ptr @Game_mode, align 4, !dbg !4622
  %21 = and i32 %20, 38, !dbg !4624
  %22 = icmp ne i32 %21, 0, !dbg !4625
  br i1 %22, label %24, label %23, !dbg !4626

23:                                               ; preds = %17
  call void @_Z14DoEndlevelMenuv(), !dbg !4627
  br label %24, !dbg !4627

24:                                               ; preds = %23, %17
  %25 = load i32, ptr @Next_level_num, align 4, !dbg !4628
  call void @_Z13StartNewLevelii(i32 noundef %25, i32 noundef 0), !dbg !4629
  br label %26

26:                                               ; preds = %24, %16
  ret void, !dbg !4630
}

declare void @_Z22newdemo_stop_recordingv() #1

declare void @_Z9key_flushv() #1

declare void @_Z15songs_play_songii(i32 noundef, i32 noundef) #1

declare void @_Z19do_briefing_screensPKci(ptr noundef, i32 noundef) #1

declare noundef i32 @_Z14init_subtitlesPKc(ptr noundef) #1

declare noundef i32 @_Z9PlayMoviePKci(ptr noundef, i32 noundef) #1

declare void @_Z15close_subtitlesv() #1

declare void @_Z12credits_showPc(ptr noundef) #1

declare void @_Z15show_order_formv() #1

declare void @_Z16gr_palette_clearv() #1

declare void @_Z19nm_draw_background1PKc(ptr noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z20died_in_mine_messagev() #0 !dbg !4631 {
  %1 = alloca i32, align 4
    #dbg_declare(ptr %1, !4632, !DIExpression(), !4633)
  %2 = load i32, ptr @Game_mode, align 4, !dbg !4634
  %3 = and i32 %2, 38, !dbg !4636
  %4 = icmp ne i32 %3, 0, !dbg !4634
  br i1 %4, label %5, label %6, !dbg !4634

5:                                                ; preds = %0
  br label %16, !dbg !4637

6:                                                ; preds = %0
  %7 = call noundef i32 @_Z19gr_palette_fade_outPhii(ptr noundef @gr_palette, i32 noundef 32, i32 noundef 0), !dbg !4638
  %8 = call noundef i32 @_Z15set_screen_modei(i32 noundef 0), !dbg !4639
  call void @_Z21gr_set_current_canvasP11_grs_canvas(ptr noundef null), !dbg !4640
  call void @_Z10load_starsv(), !dbg !4641
  %9 = load i32, ptr @Function_mode, align 4, !dbg !4642
  store i32 %9, ptr %1, align 4, !dbg !4643
  store i32 1, ptr @Function_mode, align 4, !dbg !4644
  %10 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 34) #9, !dbg !4645
  %11 = load ptr, ptr %10, align 8, !dbg !4645
  %12 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef 515) #9, !dbg !4646
  %13 = load ptr, ptr %12, align 8, !dbg !4646
  %14 = call noundef i32 (ptr, i32, ...) @_Z13nm_messageboxPKciz(ptr noundef null, i32 noundef 1, ptr noundef %11, ptr noundef %13), !dbg !4647
  %15 = load i32, ptr %1, align 4, !dbg !4648
  store i32 %15, ptr @Function_mode, align 4, !dbg !4649
  br label %16, !dbg !4650

16:                                               ; preds = %6, %5
  ret void, !dbg !4650
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z12DoPlayerDeadv() #0 !dbg !4651 {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  call void @_Z17reset_palette_addv(), !dbg !4652
  call void @_Z15gr_palette_loadPh(ptr noundef @gr_palette), !dbg !4653
  call void @_Z21digi_stop_digi_soundsv(), !dbg !4654
  call void @_Z15dead_player_endv(), !dbg !4655
  %3 = load i32, ptr @Player_num, align 4, !dbg !4656
  %4 = sext i32 %3 to i64, !dbg !4658
  %5 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %4, !dbg !4658
  %6 = getelementptr inbounds nuw %struct.player, ptr %5, i32 0, i32 10, !dbg !4659
  %7 = load i8, ptr %6, align 4, !dbg !4660
  %8 = add i8 %7, -1, !dbg !4660
  store i8 %8, ptr %6, align 4, !dbg !4660
  %9 = load i32, ptr @Player_num, align 4, !dbg !4661
  %10 = sext i32 %9 to i64, !dbg !4663
  %11 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %10, !dbg !4663
  %12 = getelementptr inbounds nuw %struct.player, ptr %11, i32 0, i32 10, !dbg !4664
  %13 = load i8, ptr %12, align 4, !dbg !4664
  %14 = zext i8 %13 to i32, !dbg !4663
  %15 = icmp eq i32 %14, 0, !dbg !4665
  br i1 %15, label %16, label %17, !dbg !4665

16:                                               ; preds = %0
  call void @_Z10DoGameOverv(), !dbg !4666
  br label %86, !dbg !4668

17:                                               ; preds = %0
  %18 = load i32, ptr @Control_center_destroyed, align 4, !dbg !4669
  %19 = icmp ne i32 %18, 0, !dbg !4669
  br i1 %19, label %20, label %58, !dbg !4669

20:                                               ; preds = %17
  %21 = load i32, ptr @Player_num, align 4, !dbg !4671
  %22 = sext i32 %21 to i64, !dbg !4673
  %23 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %22, !dbg !4673
  %24 = getelementptr inbounds nuw %struct.player, ptr %23, i32 0, i32 35, !dbg !4674
  store i8 0, ptr %24, align 2, !dbg !4675
  %25 = load i32, ptr @Player_num, align 4, !dbg !4676
  %26 = sext i32 %25 to i64, !dbg !4677
  %27 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %26, !dbg !4677
  %28 = getelementptr inbounds nuw %struct.player, ptr %27, i32 0, i32 8, !dbg !4678
  store i32 0, ptr %28, align 4, !dbg !4679
  %29 = load i32, ptr @Player_num, align 4, !dbg !4680
  %30 = sext i32 %29 to i64, !dbg !4681
  %31 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %30, !dbg !4681
  %32 = getelementptr inbounds nuw %struct.player, ptr %31, i32 0, i32 9, !dbg !4682
  store i32 0, ptr %32, align 4, !dbg !4683
  %33 = load i32, ptr @Player_num, align 4, !dbg !4684
  %34 = sext i32 %33 to i64, !dbg !4685
  %35 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %34, !dbg !4685
  %36 = getelementptr inbounds nuw %struct.player, ptr %35, i32 0, i32 3, !dbg !4686
  store i8 3, ptr %36, align 4, !dbg !4687
  call void @_Z20died_in_mine_messagev(), !dbg !4688
  %37 = load i32, ptr @Current_level_num, align 4, !dbg !4689
  %38 = icmp slt i32 %37, 0, !dbg !4691
  br i1 %38, label %39, label %56, !dbg !4691

39:                                               ; preds = %20
    #dbg_declare(ptr %1, !4692, !DIExpression(), !4694)
  %40 = call ptr @"\01_fopen"(ptr noundef @.str.36, ptr noundef @.str.7), !dbg !4695
  store ptr %40, ptr %1, align 8, !dbg !4697
  %41 = icmp ne ptr %40, null, !dbg !4698
  br i1 %41, label %42, label %52, !dbg !4698

42:                                               ; preds = %39
  %43 = load ptr, ptr %1, align 8, !dbg !4699
  %44 = call i32 @fclose(ptr noundef %43), !dbg !4701
  call void @_Z26returning_to_level_messagev(), !dbg !4702
  %45 = call noundef i32 @_Z17state_restore_alliiPc(i32 noundef 1, i32 noundef 2, ptr noundef @.str.36), !dbg !4703
  call void @_Z27set_pos_from_return_segmentv(), !dbg !4704
  %46 = load i32, ptr @Player_num, align 4, !dbg !4705
  %47 = sext i32 %46 to i64, !dbg !4706
  %48 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %47, !dbg !4706
  %49 = getelementptr inbounds nuw %struct.player, ptr %48, i32 0, i32 10, !dbg !4707
  %50 = load i8, ptr %49, align 4, !dbg !4708
  %51 = add i8 %50, -1, !dbg !4708
  store i8 %51, ptr %49, align 4, !dbg !4708
  br label %55, !dbg !4709

52:                                               ; preds = %39
  call void @_Z26advancing_to_level_messagev(), !dbg !4710
  %53 = load i32, ptr @Entered_from_level, align 4, !dbg !4712
  %54 = add nsw i32 %53, 1, !dbg !4713
  call void @_Z13StartNewLevelii(i32 noundef %54, i32 noundef 0), !dbg !4714
  call void @_Z26init_player_stats_new_shipv(), !dbg !4715
  br label %55

55:                                               ; preds = %52, %42
  br label %57, !dbg !4716

56:                                               ; preds = %20
  call void @_Z12AdvanceLeveli(i32 noundef 0), !dbg !4717
  call void @_Z26init_player_stats_new_shipv(), !dbg !4719
  store i32 -1, ptr @last_drawn_cockpit, align 4, !dbg !4720
  br label %57

57:                                               ; preds = %56, %55
  br label %85, !dbg !4721

58:                                               ; preds = %17
  %59 = load i32, ptr @Current_level_num, align 4, !dbg !4722
  %60 = icmp slt i32 %59, 0, !dbg !4724
  br i1 %60, label %61, label %83, !dbg !4724

61:                                               ; preds = %58
    #dbg_declare(ptr %2, !4725, !DIExpression(), !4727)
  %62 = call ptr @"\01_fopen"(ptr noundef @.str.36, ptr noundef @.str.7), !dbg !4728
  store ptr %62, ptr %2, align 8, !dbg !4730
  %63 = icmp ne ptr %62, null, !dbg !4731
  br i1 %63, label %64, label %79, !dbg !4731

64:                                               ; preds = %61
  %65 = load ptr, ptr %2, align 8, !dbg !4732
  %66 = call i32 @fclose(ptr noundef %65), !dbg !4734
  call void @_Z26returning_to_level_messagev(), !dbg !4735
  %67 = load i32, ptr @Control_center_destroyed, align 4, !dbg !4736
  %68 = icmp ne i32 %67, 0, !dbg !4736
  br i1 %68, label %71, label %69, !dbg !4738

69:                                               ; preds = %64
  %70 = call noundef i32 @_Z14state_save_alliiPc(i32 noundef 0, i32 noundef 2, ptr noundef @.str.31), !dbg !4739
  br label %71, !dbg !4739

71:                                               ; preds = %69, %64
  %72 = call noundef i32 @_Z17state_restore_alliiPc(i32 noundef 1, i32 noundef 2, ptr noundef @.str.36), !dbg !4740
  call void @_Z27set_pos_from_return_segmentv(), !dbg !4741
  %73 = load i32, ptr @Player_num, align 4, !dbg !4742
  %74 = sext i32 %73 to i64, !dbg !4743
  %75 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %74, !dbg !4743
  %76 = getelementptr inbounds nuw %struct.player, ptr %75, i32 0, i32 10, !dbg !4744
  %77 = load i8, ptr %76, align 4, !dbg !4745
  %78 = add i8 %77, -1, !dbg !4745
  store i8 %78, ptr %76, align 4, !dbg !4745
  br label %82, !dbg !4746

79:                                               ; preds = %61
  call void @_Z20died_in_mine_messagev(), !dbg !4747
  call void @_Z26advancing_to_level_messagev(), !dbg !4749
  %80 = load i32, ptr @Entered_from_level, align 4, !dbg !4750
  %81 = add nsw i32 %80, 1, !dbg !4751
  call void @_Z13StartNewLevelii(i32 noundef %81, i32 noundef 0), !dbg !4752
  call void @_Z26init_player_stats_new_shipv(), !dbg !4753
  br label %82

82:                                               ; preds = %79, %71
  br label %84, !dbg !4754

83:                                               ; preds = %58
  call void @_Z26init_player_stats_new_shipv(), !dbg !4755
  call void @_Z10StartLeveli(i32 noundef 1), !dbg !4757
  br label %84

84:                                               ; preds = %83, %82
  br label %85

85:                                               ; preds = %84, %57
  call void @_Z16digi_sync_soundsv(), !dbg !4758
  br label %86, !dbg !4759

86:                                               ; preds = %85, %16
  ret void, !dbg !4759
}

declare void @_Z21digi_stop_digi_soundsv() #1

declare void @_Z15dead_player_endv() #1

declare void @_Z27set_pos_from_return_segmentv() #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z10StartLeveli(i32 noundef %0) #0 !dbg !4760 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !4761, !DIExpression(), !4762)
  %3 = load i32, ptr @Player_is_dead, align 4, !dbg !4763
  %4 = icmp ne i32 %3, 0, !dbg !4763
  %5 = xor i1 %4, true, !dbg !4763
  %6 = zext i1 %5 to i32, !dbg !4763
  call void @_Z7_AssertiPKcS0_i(i32 noundef %6, ptr noundef @.str.30, ptr noundef @.str.1, i32 noundef 2748), !dbg !4763
  %7 = load i32, ptr %2, align 4, !dbg !4764
  call void @_Z18InitPlayerPositioni(i32 noundef %7), !dbg !4765
  call void @_Z21verify_console_objectv(), !dbg !4766
  %8 = load ptr, ptr @ConsoleObject, align 8, !dbg !4767
  %9 = getelementptr inbounds nuw %struct.object, ptr %8, i32 0, i32 5, !dbg !4768
  store i8 4, ptr %9, align 2, !dbg !4769
  %10 = load ptr, ptr @ConsoleObject, align 8, !dbg !4770
  %11 = getelementptr inbounds nuw %struct.object, ptr %10, i32 0, i32 6, !dbg !4771
  store i8 1, ptr %11, align 1, !dbg !4772
  call void @_Z15disable_matcensv(), !dbg !4773
  call void @_Z23clear_transient_objectsi(i32 noundef 0), !dbg !4774
  store i32 1, ptr @Do_appearance_effect, align 4, !dbg !4775
  call void @_Z18ai_reset_all_pathsv(), !dbg !4776
  call void @_Z21ai_init_boss_for_shipv(), !dbg !4777
  call void @_Z19clear_stuck_objectsv(), !dbg !4778
  call void @_Z10reset_timev(), !dbg !4779
  call void @_Z15reset_rear_viewv(), !dbg !4780
  store i32 0, ptr @Auto_fire_fusion_cannon_time, align 4, !dbg !4781
  store i32 0, ptr @Fusion_charge, align 4, !dbg !4782
  store i32 1, ptr @Robot_firing_enabled, align 4, !dbg !4783
  ret void, !dbg !4784
}

declare void @_Z16digi_sync_soundsv() #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z16StartNewLevelSubiii(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 !dbg !4785 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
    #dbg_declare(ptr %4, !4788, !DIExpression(), !4789)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !4790, !DIExpression(), !4791)
  store i32 %2, ptr %6, align 4
    #dbg_declare(ptr %6, !4792, !DIExpression(), !4793)
  %7 = load i32, ptr @Game_mode, align 4, !dbg !4794
  %8 = and i32 %7, 38, !dbg !4796
  %9 = icmp ne i32 %8, 0, !dbg !4797
  br i1 %9, label %11, label %10, !dbg !4798

10:                                               ; preds = %3
  store i32 -1, ptr @last_drawn_cockpit, align 4, !dbg !4799
  br label %11, !dbg !4801

11:                                               ; preds = %10, %3
  store i32 0, ptr @BigWindowSwitch, align 4, !dbg !4802
  %12 = load i32, ptr @Newdemo_state, align 4, !dbg !4803
  %13 = icmp eq i32 %12, 3, !dbg !4805
  br i1 %13, label %14, label %15, !dbg !4805

14:                                               ; preds = %11
  store i32 1, ptr @Newdemo_state, align 4, !dbg !4806
  br label %15, !dbg !4807

15:                                               ; preds = %14, %11
  %16 = load i32, ptr @Newdemo_state, align 4, !dbg !4808
  %17 = icmp eq i32 %16, 1, !dbg !4810
  br i1 %17, label %18, label %22, !dbg !4810

18:                                               ; preds = %15
  %19 = load i32, ptr %4, align 4, !dbg !4811
  call void @_Z21newdemo_set_new_leveli(i32 noundef %19), !dbg !4813
  %20 = load i32, ptr @FrameCount, align 4, !dbg !4814
  %21 = load i32, ptr @FrameTime, align 4, !dbg !4815
  call void @_Z26newdemo_record_start_frameii(i32 noundef %20, i32 noundef %21), !dbg !4816
  br label %22, !dbg !4817

22:                                               ; preds = %18, %15
  %23 = load i32, ptr @Game_mode, align 4, !dbg !4818
  %24 = and i32 %23, 38, !dbg !4820
  %25 = icmp ne i32 %24, 0, !dbg !4818
  br i1 %25, label %26, label %27, !dbg !4818

26:                                               ; preds = %22
  store i32 1, ptr @Function_mode, align 4, !dbg !4821
  br label %27, !dbg !4822

27:                                               ; preds = %26, %22
  %28 = load i32, ptr %4, align 4, !dbg !4823
  %29 = load i32, ptr %5, align 4, !dbg !4824
  call void @_Z9LoadLevelii(i32 noundef %28, i32 noundef %29), !dbg !4825
  %30 = load i32, ptr @Current_level_num, align 4, !dbg !4826
  %31 = load i32, ptr %4, align 4, !dbg !4826
  %32 = icmp eq i32 %30, %31, !dbg !4826
  %33 = zext i1 %32 to i32, !dbg !4826
  call void @_Z7_AssertiPKcS0_i(i32 noundef %33, ptr noundef @.str.34, ptr noundef @.str.1, i32 noundef 2226), !dbg !4826
  call void @_Z28gameseq_init_network_playersv(), !dbg !4827
  %34 = load i32, ptr @Player_num, align 4, !dbg !4828
  %35 = sext i32 %34 to i64, !dbg !4829
  %36 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %35, !dbg !4829
  %37 = getelementptr inbounds nuw %struct.player, ptr %36, i32 0, i32 4, !dbg !4830
  %38 = load i32, ptr %37, align 4, !dbg !4830
  %39 = sext i32 %38 to i64, !dbg !4831
  %40 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %39, !dbg !4831
  store ptr %40, ptr @Viewer, align 8, !dbg !4832
  %41 = load i32, ptr @N_players, align 4, !dbg !4833
  %42 = load i32, ptr @NumNetPlayerPositions, align 4, !dbg !4833
  %43 = icmp sle i32 %41, %42, !dbg !4833
  %44 = zext i1 %43 to i32, !dbg !4833
  call void @_Z7_AssertiPKcS0_i(i32 noundef %44, ptr noundef @.str.53, ptr noundef @.str.1, i32 noundef 2232), !dbg !4833
  %45 = load i32, ptr @Function_mode, align 4, !dbg !4834
  %46 = icmp eq i32 %45, 2, !dbg !4834
  %47 = zext i1 %46 to i32, !dbg !4834
  call void @_Z7_AssertiPKcS0_i(i32 noundef %47, ptr noundef @.str.35, ptr noundef @.str.1, i32 noundef 2243), !dbg !4834
  call void @_Z18HUD_clear_messagesv(), !dbg !4835
  call void @_Z21automap_clear_visitedv(), !dbg !4836
  %48 = load i32, ptr %6, align 4, !dbg !4837
  call void @_Z23init_player_stats_leveli(i32 noundef %48), !dbg !4838
  call void @_Z29gameseq_remove_unused_playersv(), !dbg !4839
  store i32 0, ptr @Game_suspended, align 4, !dbg !4840
  store i32 0, ptr @Control_center_destroyed, align 4, !dbg !4841
  %49 = call noundef i32 @_Z15set_screen_modei(i32 noundef 1), !dbg !4842
  call void @_Z12init_cockpitv(), !dbg !4843
  call void @_Z21init_robots_for_levelv(), !dbg !4844
  call void @_Z15init_ai_objectsv(), !dbg !4845
  call void @_Z20init_smega_detonatesv(), !dbg !4846
  call void @_Z11init_morphsv(), !dbg !4847
  call void @_Z16init_all_matcensv(), !dbg !4848
  call void @_Z17reset_palette_addv(), !dbg !4849
  call void @_Z20init_thief_for_levelv(), !dbg !4850
  call void @_Z18init_stuck_objectsv(), !dbg !4851
  call void @_Z17game_flush_inputsv(), !dbg !4852
  %50 = load i32, ptr @Game_mode, align 4, !dbg !4853
  %51 = and i32 %50, 38, !dbg !4855
  %52 = icmp ne i32 %51, 0, !dbg !4856
  br i1 %52, label %54, label %53, !dbg !4857

53:                                               ; preds = %27
  call void @_Z25filter_objects_from_levelv(), !dbg !4858
  br label %54, !dbg !4858

54:                                               ; preds = %53, %27
  call void @_Z15turn_cheats_offv(), !dbg !4859
  %55 = load i32, ptr @Game_mode, align 4, !dbg !4860
  %56 = and i32 %55, 38, !dbg !4862
  %57 = icmp ne i32 %56, 0, !dbg !4863
  br i1 %57, label %63, label %58, !dbg !4864

58:                                               ; preds = %54
  %59 = load i32, ptr @Cheats_enabled, align 4, !dbg !4865
  %60 = icmp ne i32 %59, 0, !dbg !4865
  br i1 %60, label %63, label %61, !dbg !4864

61:                                               ; preds = %58
  %62 = load i32, ptr @Current_level_num, align 4, !dbg !4866
  call void @_Z17set_highest_leveli(i32 noundef %62), !dbg !4867
  br label %65, !dbg !4867

63:                                               ; preds = %58, %54
  %64 = call noundef i32 @_Z16read_player_filev(), !dbg !4868
  br label %65

65:                                               ; preds = %63, %61
  call void @_Z21reset_special_effectsv(), !dbg !4869
  call void @_Z10StartLeveli(i32 noundef 0), !dbg !4870
  call void @_Z26copy_defaults_to_robot_allv(), !dbg !4871
  call void @_Z25init_controlcen_for_levelv(), !dbg !4872
  %66 = call i32 @ox_recorder_active(), !dbg !4873
  %67 = icmp ne i32 %66, 0, !dbg !4873
  br i1 %67, label %68, label %71, !dbg !4873

68:                                               ; preds = %65
  %69 = load i32, ptr %4, align 4, !dbg !4875
  %70 = load i32, ptr @Difficulty_level, align 4, !dbg !4876
  call void @ox_recorder_level_start(i32 noundef %69, i32 noundef %70), !dbg !4877
  br label %71, !dbg !4877

71:                                               ; preds = %68, %65
  %72 = call i32 @ox_replayer_active(), !dbg !4878
  %73 = icmp ne i32 %72, 0, !dbg !4878
  br i1 %73, label %74, label %75, !dbg !4878

74:                                               ; preds = %71
  call void @ox_replayer_restore_initial_state(), !dbg !4880
  br label %75, !dbg !4880

75:                                               ; preds = %74, %71
  store i32 -1, ptr @Last_level_path_created, align 4, !dbg !4881
  ret void, !dbg !4882
}

declare void @_Z20init_thief_for_levelv() #1

declare void @_Z18init_stuck_objectsv() #1

declare void @_Z17game_flush_inputsv() #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z25filter_objects_from_levelv() #0 !dbg !4883 {
  %1 = alloca i32, align 4
    #dbg_declare(ptr %1, !4884, !DIExpression(), !4885)
  %2 = load i32, ptr @Highest_object_index, align 4, !dbg !4886
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.55, i32 noundef %2), !dbg !4886
  store i32 0, ptr %1, align 4, !dbg !4887
  br label %3, !dbg !4889

3:                                                ; preds = %35, %0
  %4 = load i32, ptr %1, align 4, !dbg !4890
  %5 = load i32, ptr @Highest_object_index, align 4, !dbg !4892
  %6 = icmp sle i32 %4, %5, !dbg !4893
  br i1 %6, label %7, label %38, !dbg !4894

7:                                                ; preds = %3
  %8 = load i32, ptr %1, align 4, !dbg !4895
  %9 = sext i32 %8 to i64, !dbg !4898
  %10 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %9, !dbg !4898
  %11 = getelementptr inbounds nuw %struct.object, ptr %10, i32 0, i32 1, !dbg !4899
  %12 = load i8, ptr %11, align 4, !dbg !4899
  %13 = zext i8 %12 to i32, !dbg !4898
  %14 = icmp eq i32 %13, 7, !dbg !4900
  br i1 %14, label %15, label %34, !dbg !4900

15:                                               ; preds = %7
  %16 = load i32, ptr %1, align 4, !dbg !4901
  %17 = sext i32 %16 to i64, !dbg !4903
  %18 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %17, !dbg !4903
  %19 = getelementptr inbounds nuw %struct.object, ptr %18, i32 0, i32 2, !dbg !4904
  %20 = load i8, ptr %19, align 1, !dbg !4904
  %21 = zext i8 %20 to i32, !dbg !4903
  %22 = icmp eq i32 %21, 47, !dbg !4905
  br i1 %22, label %31, label %23, !dbg !4906

23:                                               ; preds = %15
  %24 = load i32, ptr %1, align 4, !dbg !4907
  %25 = sext i32 %24 to i64, !dbg !4908
  %26 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %25, !dbg !4908
  %27 = getelementptr inbounds nuw %struct.object, ptr %26, i32 0, i32 2, !dbg !4909
  %28 = load i8, ptr %27, align 1, !dbg !4909
  %29 = zext i8 %28 to i32, !dbg !4908
  %30 = icmp eq i32 %29, 46, !dbg !4910
  br i1 %30, label %31, label %33, !dbg !4906

31:                                               ; preds = %23, %15
  %32 = load i32, ptr %1, align 4, !dbg !4911
  call void @_Z14bash_to_shieldiPKc(i32 noundef %32, ptr noundef @.str.56), !dbg !4912
  br label %33, !dbg !4912

33:                                               ; preds = %31, %23
  br label %34, !dbg !4913

34:                                               ; preds = %33, %7
  br label %35, !dbg !4914

35:                                               ; preds = %34
  %36 = load i32, ptr %1, align 4, !dbg !4915
  %37 = add nsw i32 %36, 1, !dbg !4915
  store i32 %37, ptr %1, align 4, !dbg !4915
  br label %3, !dbg !4916, !llvm.loop !4917

38:                                               ; preds = %3
  ret void, !dbg !4919
}

declare void @_Z17set_highest_leveli(i32 noundef) #1

declare i32 @ox_recorder_active() #1

declare void @ox_recorder_level_start(i32 noundef, i32 noundef) #1

declare i32 @ox_replayer_active() #1

declare void @ox_replayer_restore_initial_state() #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z14bash_to_shieldiPKc(i32 noundef %0, ptr noundef %1) #0 !dbg !4920 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !4923, !DIExpression(), !4924)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !4925, !DIExpression(), !4926)
    #dbg_declare(ptr %5, !4927, !DIExpression(), !4928)
  %6 = load i32, ptr %3, align 4, !dbg !4929
  %7 = sext i32 %6 to i64, !dbg !4930
  %8 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %7, !dbg !4930
  %9 = getelementptr inbounds nuw %struct.object, ptr %8, i32 0, i32 2, !dbg !4931
  %10 = load i8, ptr %9, align 1, !dbg !4931
  %11 = zext i8 %10 to i32, !dbg !4930
  store i32 %11, ptr %5, align 4, !dbg !4928
  %12 = load ptr, ptr %4, align 8, !dbg !4932
  %13 = load i32, ptr %3, align 4, !dbg !4932
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.54, ptr noundef %12, i32 noundef %13), !dbg !4932
  %14 = load i32, ptr %3, align 4, !dbg !4933
  %15 = sext i32 %14 to i64, !dbg !4934
  %16 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %15, !dbg !4934
  %17 = getelementptr inbounds nuw %struct.object, ptr %16, i32 0, i32 2, !dbg !4935
  store i8 2, ptr %17, align 1, !dbg !4936
  %18 = load i32, ptr %3, align 4, !dbg !4937
  %19 = sext i32 %18 to i64, !dbg !4938
  %20 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %19, !dbg !4938
  %21 = getelementptr inbounds nuw %struct.object, ptr %20, i32 0, i32 2, !dbg !4939
  %22 = load i8, ptr %21, align 1, !dbg !4939
  %23 = zext i8 %22 to i64, !dbg !4940
  %24 = getelementptr inbounds nuw [50 x %struct.powerup_type_info], ptr @Powerup_info, i64 0, i64 %23, !dbg !4940
  %25 = getelementptr inbounds nuw %struct.powerup_type_info, ptr %24, i32 0, i32 0, !dbg !4941
  %26 = load i32, ptr %25, align 4, !dbg !4941
  %27 = load i32, ptr %3, align 4, !dbg !4942
  %28 = sext i32 %27 to i64, !dbg !4943
  %29 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %28, !dbg !4943
  %30 = getelementptr inbounds nuw %struct.object, ptr %29, i32 0, i32 23, !dbg !4944
  %31 = getelementptr inbounds nuw %struct.vclip_info_s, ptr %30, i32 0, i32 0, !dbg !4945
  store i32 %26, ptr %31, align 4, !dbg !4946
  %32 = load i32, ptr %3, align 4, !dbg !4947
  %33 = sext i32 %32 to i64, !dbg !4948
  %34 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %33, !dbg !4948
  %35 = getelementptr inbounds nuw %struct.object, ptr %34, i32 0, i32 23, !dbg !4949
  %36 = getelementptr inbounds nuw %struct.vclip_info_s, ptr %35, i32 0, i32 0, !dbg !4950
  %37 = load i32, ptr %36, align 4, !dbg !4950
  %38 = sext i32 %37 to i64, !dbg !4951
  %39 = getelementptr inbounds [110 x %struct.vclip], ptr @Vclip, i64 0, i64 %38, !dbg !4951
  %40 = getelementptr inbounds nuw %struct.vclip, ptr %39, i32 0, i32 2, !dbg !4952
  %41 = load i32, ptr %40, align 4, !dbg !4952
  %42 = load i32, ptr %3, align 4, !dbg !4953
  %43 = sext i32 %42 to i64, !dbg !4954
  %44 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %43, !dbg !4954
  %45 = getelementptr inbounds nuw %struct.object, ptr %44, i32 0, i32 23, !dbg !4955
  %46 = getelementptr inbounds nuw %struct.vclip_info_s, ptr %45, i32 0, i32 1, !dbg !4956
  store i32 %41, ptr %46, align 4, !dbg !4957
  ret void, !dbg !4958
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z14ShowLevelIntroi(i32 noundef %0) #0 !dbg !4959 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca [768 x i8], align 1
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca [13 x i8], align 1
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !4960, !DIExpression(), !4961)
  %8 = load i32, ptr @Game_mode, align 4, !dbg !4962
  %9 = and i32 %8, 38, !dbg !4964
  %10 = icmp ne i32 %9, 0, !dbg !4965
  br i1 %10, label %76, label %11, !dbg !4966

11:                                               ; preds = %1
    #dbg_declare(ptr %3, !4967, !DIExpression(), !4969)
    #dbg_declare(ptr %4, !4970, !DIExpression(), !4974)
  %12 = getelementptr inbounds [768 x i8], ptr %4, i64 0, i64 0, !dbg !4975
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %12, ptr align 1 @gr_palette, i64 768, i1 false), !dbg !4975
  %13 = load i32, ptr @Current_mission_num, align 4, !dbg !4976
  %14 = icmp eq i32 %13, 0, !dbg !4978
  br i1 %14, label %15, label %68, !dbg !4978

15:                                               ; preds = %11
    #dbg_declare(ptr %5, !4979, !DIExpression(), !4981)
  store i32 0, ptr %5, align 4, !dbg !4981
  store i32 0, ptr %3, align 4, !dbg !4982
  br label %16, !dbg !4984

16:                                               ; preds = %36, %15
  %17 = load i32, ptr %3, align 4, !dbg !4985
  %18 = sext i32 %17 to i64, !dbg !4985
  %19 = icmp ult i64 %18, 7, !dbg !4987
  br i1 %19, label %20, label %39, !dbg !4988

20:                                               ; preds = %16
  %21 = load i32, ptr %3, align 4, !dbg !4989
  %22 = sext i32 %21 to i64, !dbg !4992
  %23 = getelementptr inbounds [7 x %struct.anon], ptr @intro_movie, i64 0, i64 %22, !dbg !4992
  %24 = getelementptr inbounds nuw %struct.anon, ptr %23, i32 0, i32 0, !dbg !4993
  %25 = load i32, ptr %24, align 4, !dbg !4993
  %26 = load i32, ptr %2, align 4, !dbg !4994
  %27 = icmp eq i32 %25, %26, !dbg !4995
  br i1 %27, label %28, label %35, !dbg !4995

28:                                               ; preds = %20
  %29 = load i32, ptr %3, align 4, !dbg !4996
  %30 = sext i32 %29 to i64, !dbg !4998
  %31 = getelementptr inbounds [7 x %struct.anon], ptr @intro_movie, i64 0, i64 %30, !dbg !4998
  %32 = getelementptr inbounds nuw %struct.anon, ptr %31, i32 0, i32 1, !dbg !4999
  %33 = getelementptr inbounds [13 x i8], ptr %32, i64 0, i64 0, !dbg !4998
  %34 = call noundef i32 @_Z9PlayMoviePKci(ptr noundef %33, i32 noundef 0), !dbg !5000
  store i32 1, ptr %5, align 4, !dbg !5001
  br label %40, !dbg !5002

35:                                               ; preds = %20
  br label %36, !dbg !5003

36:                                               ; preds = %35
  %37 = load i32, ptr %3, align 4, !dbg !5004
  %38 = add nsw i32 %37, 1, !dbg !5004
  store i32 %38, ptr %3, align 4, !dbg !5004
  br label %16, !dbg !5005, !llvm.loop !5006

39:                                               ; preds = %16
  br label %40, !dbg !5008

40:                                               ; preds = %39, %28
  %41 = load i32, ptr @CurrentDataVersion, align 4, !dbg !5008
  %42 = icmp eq i32 %41, 0, !dbg !5010
  br i1 %42, label %43, label %47, !dbg !5011

43:                                               ; preds = %40
  %44 = load i32, ptr %2, align 4, !dbg !5012
  %45 = icmp eq i32 %44, 1, !dbg !5013
  br i1 %45, label %46, label %47, !dbg !5011

46:                                               ; preds = %43
  call void @_Z19do_briefing_screensPKci(ptr noundef @.str.57, i32 noundef 1), !dbg !5014
  br label %47, !dbg !5016

47:                                               ; preds = %46, %43, %40
  %48 = load i32, ptr @CurrentDataVersion, align 4, !dbg !5017
  %49 = icmp ne i32 %48, 0, !dbg !5019
  br i1 %49, label %50, label %67, !dbg !5019

50:                                               ; preds = %47
  %51 = load i32, ptr @robot_movies, align 4, !dbg !5020
  %52 = icmp ne i32 %51, 0, !dbg !5020
  br i1 %52, label %53, label %66, !dbg !5020

53:                                               ; preds = %50
    #dbg_declare(ptr %6, !5023, !DIExpression(), !5025)
  %54 = load i32, ptr @MenuHiresAvailable, align 4, !dbg !5026
  store i32 %54, ptr %6, align 4, !dbg !5025
  %55 = load i32, ptr @robot_movies, align 4, !dbg !5027
  %56 = icmp eq i32 %55, 1, !dbg !5029
  br i1 %56, label %57, label %63, !dbg !5029

57:                                               ; preds = %53
  store i32 0, ptr @MenuHiresAvailable, align 4, !dbg !5030
  %58 = load i32, ptr %6, align 4, !dbg !5032
  %59 = load i32, ptr @MenuHiresAvailable, align 4, !dbg !5034
  %60 = icmp ne i32 %58, %59, !dbg !5035
  br i1 %60, label %61, label %62, !dbg !5035

61:                                               ; preds = %57
  store i32 -1, ptr @Screen_mode, align 4, !dbg !5036
  br label %62, !dbg !5037

62:                                               ; preds = %61, %57
  br label %63, !dbg !5038

63:                                               ; preds = %62, %53
  %64 = load i32, ptr %2, align 4, !dbg !5039
  call void @_Z19do_briefing_screensPKci(ptr noundef @.str.58, i32 noundef %64), !dbg !5040
  %65 = load i32, ptr %6, align 4, !dbg !5041
  store i32 %65, ptr @MenuHiresAvailable, align 4, !dbg !5042
  br label %66, !dbg !5043

66:                                               ; preds = %63, %50
  br label %67, !dbg !5044

67:                                               ; preds = %66, %47
  br label %74, !dbg !5045

68:                                               ; preds = %11
    #dbg_declare(ptr %7, !5046, !DIExpression(), !5048)
  %69 = getelementptr inbounds [13 x i8], ptr %7, i64 0, i64 0, !dbg !5049
  %70 = load ptr, ptr @Current_mission_filename, align 8, !dbg !5050
  %71 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %69, ptr noundef @.str.45, ptr noundef %70) #9, !dbg !5051
  %72 = getelementptr inbounds [13 x i8], ptr %7, i64 0, i64 0, !dbg !5052
  %73 = load i32, ptr %2, align 4, !dbg !5053
  call void @_Z19do_briefing_screensPKci(ptr noundef %72, i32 noundef %73), !dbg !5054
  br label %74

74:                                               ; preds = %68, %67
  %75 = getelementptr inbounds [768 x i8], ptr %4, i64 0, i64 0, !dbg !5055
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 @gr_palette, ptr align 1 %75, i64 768, i1 false), !dbg !5055
  br label %76, !dbg !5056

76:                                               ; preds = %74, %1
  ret void, !dbg !5057
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z28maybe_set_first_secret_visiti(i32 noundef %0) #0 !dbg !5058 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !5059, !DIExpression(), !5060)
    #dbg_declare(ptr %3, !5061, !DIExpression(), !5062)
  store i32 0, ptr %3, align 4, !dbg !5063
  br label %4, !dbg !5065

4:                                                ; preds = %18, %1
  %5 = load i32, ptr %3, align 4, !dbg !5066
  %6 = load i32, ptr @N_secret_levels, align 4, !dbg !5068
  %7 = icmp slt i32 %5, %6, !dbg !5069
  br i1 %7, label %8, label %21, !dbg !5070

8:                                                ; preds = %4
  %9 = load i32, ptr %3, align 4, !dbg !5071
  %10 = sext i32 %9 to i64, !dbg !5074
  %11 = getelementptr inbounds [6 x i32], ptr @Secret_level_table, i64 0, i64 %10, !dbg !5074
  %12 = load i32, ptr %11, align 4, !dbg !5074
  %13 = load i32, ptr %2, align 4, !dbg !5075
  %14 = icmp eq i32 %12, %13, !dbg !5076
  br i1 %14, label %15, label %17, !dbg !5076

15:                                               ; preds = %8
  store i32 1, ptr @First_secret_visit, align 4, !dbg !5077
  %16 = load i32, ptr %2, align 4, !dbg !5079
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.59, i32 noundef %16), !dbg !5079
  br label %17, !dbg !5080

17:                                               ; preds = %15, %8
  br label %18, !dbg !5081

18:                                               ; preds = %17
  %19 = load i32, ptr %3, align 4, !dbg !5082
  %20 = add nsw i32 %19, 1, !dbg !5082
  store i32 %20, ptr %3, align 4, !dbg !5082
  br label %4, !dbg !5083, !llvm.loop !5084

21:                                               ; preds = %4
  ret void, !dbg !5086
}

declare void @_Z10obj_relinkii(i32 noundef, i32 noundef) #1

declare void @_Z19reset_player_objectv() #1

declare void @_Z12reset_cruisev() #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z22copy_defaults_to_robotP6object(ptr noundef %0) #0 !dbg !5087 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !5088, !DIExpression(), !5089)
    #dbg_declare(ptr %3, !5090, !DIExpression(), !5160)
    #dbg_declare(ptr %4, !5161, !DIExpression(), !5162)
  %5 = load ptr, ptr %2, align 8, !dbg !5163
  %6 = getelementptr inbounds nuw %struct.object, ptr %5, i32 0, i32 1, !dbg !5163
  %7 = load i8, ptr %6, align 4, !dbg !5163
  %8 = zext i8 %7 to i32, !dbg !5163
  %9 = icmp eq i32 %8, 2, !dbg !5163
  %10 = zext i1 %9 to i32, !dbg !5163
  call void @_Z7_AssertiPKcS0_i(i32 noundef %10, ptr noundef @.str.63, ptr noundef @.str.1, i32 noundef 2649), !dbg !5163
  %11 = load ptr, ptr %2, align 8, !dbg !5164
  %12 = getelementptr inbounds nuw %struct.object, ptr %11, i32 0, i32 2, !dbg !5165
  %13 = load i8, ptr %12, align 1, !dbg !5165
  %14 = zext i8 %13 to i32, !dbg !5164
  store i32 %14, ptr %4, align 4, !dbg !5166
  %15 = load i32, ptr %4, align 4, !dbg !5167
  %16 = load i32, ptr @N_robot_types, align 4, !dbg !5167
  %17 = icmp slt i32 %15, %16, !dbg !5167
  %18 = zext i1 %17 to i32, !dbg !5167
  call void @_Z7_AssertiPKcS0_i(i32 noundef %18, ptr noundef @.str.64, ptr noundef @.str.1, i32 noundef 2651), !dbg !5167
  %19 = load i32, ptr %4, align 4, !dbg !5168
  %20 = sext i32 %19 to i64, !dbg !5169
  %21 = getelementptr inbounds [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %20, !dbg !5169
  store ptr %21, ptr %3, align 8, !dbg !5170
  %22 = load ptr, ptr %3, align 8, !dbg !5171
  %23 = getelementptr inbounds nuw %struct.robot_info, ptr %22, i32 0, i32 19, !dbg !5172
  %24 = load i32, ptr %23, align 4, !dbg !5172
  %25 = load ptr, ptr %2, align 8, !dbg !5173
  %26 = getelementptr inbounds nuw %struct.object, ptr %25, i32 0, i32 14, !dbg !5174
  store i32 %24, ptr %26, align 4, !dbg !5175
  %27 = load ptr, ptr %3, align 8, !dbg !5176
  %28 = getelementptr inbounds nuw %struct.robot_info, ptr %27, i32 0, i32 40, !dbg !5178
  %29 = load i8, ptr %28, align 4, !dbg !5178
  %30 = icmp ne i8 %29, 0, !dbg !5179
  br i1 %30, label %36, label %31, !dbg !5180

31:                                               ; preds = %1
  %32 = load ptr, ptr %3, align 8, !dbg !5181
  %33 = getelementptr inbounds nuw %struct.robot_info, ptr %32, i32 0, i32 37, !dbg !5182
  %34 = load i8, ptr %33, align 1, !dbg !5182
  %35 = icmp ne i8 %34, 0, !dbg !5183
  br i1 %35, label %36, label %70, !dbg !5180

36:                                               ; preds = %31, %1
  %37 = load ptr, ptr %2, align 8, !dbg !5184
  %38 = getelementptr inbounds nuw %struct.object, ptr %37, i32 0, i32 14, !dbg !5186
  %39 = load i32, ptr %38, align 4, !dbg !5186
  %40 = load i32, ptr @Current_level_num, align 4, !dbg !5187
  %41 = call i32 @llvm.abs.i32(i32 %40, i1 true), !dbg !5188
  %42 = add nsw i32 %41, 7, !dbg !5189
  %43 = mul nsw i32 %39, %42, !dbg !5190
  %44 = sdiv i32 %43, 8, !dbg !5191
  %45 = load ptr, ptr %2, align 8, !dbg !5192
  %46 = getelementptr inbounds nuw %struct.object, ptr %45, i32 0, i32 14, !dbg !5193
  store i32 %44, ptr %46, align 4, !dbg !5194
  %47 = load ptr, ptr %3, align 8, !dbg !5195
  %48 = getelementptr inbounds nuw %struct.robot_info, ptr %47, i32 0, i32 37, !dbg !5197
  %49 = load i8, ptr %48, align 1, !dbg !5197
  %50 = icmp ne i8 %49, 0, !dbg !5195
  br i1 %50, label %51, label %69, !dbg !5195

51:                                               ; preds = %36
  %52 = load i32, ptr @Difficulty_level, align 4, !dbg !5198
  switch i32 %52, label %67 [
    i32 0, label %53
    i32 1, label %57
    i32 2, label %62
  ], !dbg !5200

53:                                               ; preds = %51
  %54 = call i32 @i2f(i32 noundef 20000), !dbg !5201
  %55 = load ptr, ptr %2, align 8, !dbg !5203
  %56 = getelementptr inbounds nuw %struct.object, ptr %55, i32 0, i32 14, !dbg !5204
  store i32 %54, ptr %56, align 4, !dbg !5205
  br label %68, !dbg !5206

57:                                               ; preds = %51
  %58 = load ptr, ptr %2, align 8, !dbg !5207
  %59 = getelementptr inbounds nuw %struct.object, ptr %58, i32 0, i32 14, !dbg !5208
  %60 = load i32, ptr %59, align 4, !dbg !5209
  %61 = mul nsw i32 %60, 3, !dbg !5209
  store i32 %61, ptr %59, align 4, !dbg !5209
  br label %68, !dbg !5210

62:                                               ; preds = %51
  %63 = load ptr, ptr %2, align 8, !dbg !5211
  %64 = getelementptr inbounds nuw %struct.object, ptr %63, i32 0, i32 14, !dbg !5212
  %65 = load i32, ptr %64, align 4, !dbg !5213
  %66 = mul nsw i32 %65, 2, !dbg !5213
  store i32 %66, ptr %64, align 4, !dbg !5213
  br label %68, !dbg !5214

67:                                               ; preds = %51
  br label %68, !dbg !5215

68:                                               ; preds = %67, %62, %57, %53
  br label %69, !dbg !5216

69:                                               ; preds = %68, %36
  br label %86, !dbg !5217

70:                                               ; preds = %31
  %71 = load ptr, ptr %3, align 8, !dbg !5218
  %72 = getelementptr inbounds nuw %struct.robot_info, ptr %71, i32 0, i32 36, !dbg !5220
  %73 = load i8, ptr %72, align 4, !dbg !5220
  %74 = icmp ne i8 %73, 0, !dbg !5218
  br i1 %74, label %75, label %85, !dbg !5218

75:                                               ; preds = %70
  %76 = load ptr, ptr %2, align 8, !dbg !5221
  %77 = getelementptr inbounds nuw %struct.object, ptr %76, i32 0, i32 14, !dbg !5222
  %78 = load i32, ptr %77, align 4, !dbg !5222
  %79 = sdiv i32 %78, 8, !dbg !5223
  %80 = load i32, ptr @Difficulty_level, align 4, !dbg !5224
  %81 = add nsw i32 %80, 4, !dbg !5225
  %82 = mul nsw i32 %79, %81, !dbg !5226
  %83 = load ptr, ptr %2, align 8, !dbg !5227
  %84 = getelementptr inbounds nuw %struct.object, ptr %83, i32 0, i32 14, !dbg !5228
  store i32 %82, ptr %84, align 4, !dbg !5229
  br label %85, !dbg !5227

85:                                               ; preds = %75, %70
  br label %86

86:                                               ; preds = %85, %69
  %87 = load ptr, ptr %3, align 8, !dbg !5230
  %88 = getelementptr inbounds nuw %struct.robot_info, ptr %87, i32 0, i32 36, !dbg !5232
  %89 = load i8, ptr %88, align 4, !dbg !5232
  %90 = icmp ne i8 %89, 0, !dbg !5233
  br i1 %90, label %91, label %99, !dbg !5234

91:                                               ; preds = %86
  %92 = load i32, ptr @Difficulty_level, align 4, !dbg !5235
  %93 = icmp eq i32 %92, 0, !dbg !5236
  br i1 %93, label %94, label %99, !dbg !5234

94:                                               ; preds = %91
  %95 = load ptr, ptr %2, align 8, !dbg !5237
  %96 = getelementptr inbounds nuw %struct.object, ptr %95, i32 0, i32 14, !dbg !5238
  %97 = load i32, ptr %96, align 4, !dbg !5239
  %98 = sdiv i32 %97, 2, !dbg !5239
  store i32 %98, ptr %96, align 4, !dbg !5239
  br label %99, !dbg !5237

99:                                               ; preds = %94, %91, %86
  ret void, !dbg !5240
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.abs.i32(i32, i1 immarg) #7

declare void @_Z15disable_matcensv() #1

declare void @_Z21ai_init_boss_for_shipv() #1

declare void @_Z19clear_stuck_objectsv() #1

declare void @_Z10reset_timev() #1

attributes #0 = { mustprogress noinline ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #2 = { mustprogress noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { noreturn "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #5 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #6 = { nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #7 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #8 = { noreturn }
attributes #9 = { nounwind }

!llvm.module.flags = !{!1674, !1675, !1676, !1677, !1678, !1679, !1680}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!1681}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "Current_level_num", scope: !2, file: !29, line: 139, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !3, producer: "Homebrew clang version 20.1.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !11, globals: !26, imports: !395, splitDebugInlining: false, nameTableKind: Apple, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk", sdk: "MacOSX15.sdk")
!3 = !DIFile(filename: "/Users/richard/code/ChocolateDescent/main_d2/gameseq.cpp", directory: "/Users/richard/code/ChocolateDescent/build-c-ref", checksumkind: CSK_MD5, checksum: "ccc706ac29acfa3b2de8d91a72e22710")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "DataVer", file: !6, line: 72, baseType: !7, size: 32, flags: DIFlagEnumClass, elements: !8, identifier: "_ZTS7DataVer")
!6 = !DIFile(filename: "main_d2/inferno.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "f9bd7760bcc54609c0547a3a7ca7ee90")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{!9, !10}
!9 = !DIEnumerator(name: "DEMO", value: 0)
!10 = !DIEnumerator(name: "FULL", value: 1)
!11 = !{!12, !16, !20, !21, !23}
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !14, line: 31, baseType: !15)
!14 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint16_t.h", directory: "", checksumkind: CSK_MD5, checksum: "f0aa926da906b10566dd3171bf347ab7")
!15 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !18, line: 31, baseType: !19)
!18 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint8_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8b64ccf8c67b8c006b07b8daf1b49be5")
!19 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!20 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !24, line: 30, baseType: !25)
!24 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int64_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e6d85c1a9e23dbf7518ce3b162aac800")
!25 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!26 = !{!0, !27, !30, !35, !37, !39, !41, !43, !111, !136, !138, !140, !142, !144, !150, !155, !160, !165, !167, !172, !174, !176, !181, !186, !191, !194, !199, !201, !206, !209, !214, !219, !224, !229, !234, !236, !241, !243, !245, !250, !253, !258, !263, !265, !268, !270, !273, !278, !280, !282, !284, !289, !294, !299, !301, !303, !305, !310, !312, !314, !316, !321, !323, !325, !327, !329, !331, !334, !339, !341, !343, !345, !347, !352, !354, !359, !362, !364, !366, !371, !376, !378, !380, !382, !384, !387}
!27 = !DIGlobalVariableExpression(var: !28, expr: !DIExpression())
!28 = distinct !DIGlobalVariable(name: "Next_level_num", scope: !2, file: !29, line: 139, type: !7, isLocal: false, isDefinition: true)
!29 = !DIFile(filename: "main_d2/gameseq.cpp", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "ccc706ac29acfa3b2de8d91a72e22710")
!30 = !DIGlobalVariableExpression(var: !31, expr: !DIExpression())
!31 = distinct !DIGlobalVariable(name: "Current_level_name", scope: !2, file: !29, line: 140, type: !32, isLocal: false, isDefinition: true)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 288, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 36)
!35 = !DIGlobalVariableExpression(var: !36, expr: !DIExpression())
!36 = distinct !DIGlobalVariable(name: "Last_level", scope: !2, file: !29, line: 143, type: !7, isLocal: false, isDefinition: true)
!37 = !DIGlobalVariableExpression(var: !38, expr: !DIExpression())
!38 = distinct !DIGlobalVariable(name: "Last_secret_level", scope: !2, file: !29, line: 143, type: !7, isLocal: false, isDefinition: true)
!39 = !DIGlobalVariableExpression(var: !40, expr: !DIExpression())
!40 = distinct !DIGlobalVariable(name: "N_players", scope: !2, file: !29, line: 147, type: !7, isLocal: false, isDefinition: true)
!41 = !DIGlobalVariableExpression(var: !42, expr: !DIExpression())
!42 = distinct !DIGlobalVariable(name: "Player_num", scope: !2, file: !29, line: 148, type: !7, isLocal: false, isDefinition: true)
!43 = !DIGlobalVariableExpression(var: !44, expr: !DIExpression())
!44 = distinct !DIGlobalVariable(name: "Players", scope: !2, file: !29, line: 149, type: !45, isLocal: false, isDefinition: true)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !46, size: 14208, elements: !109)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "player", file: !47, line: 118, baseType: !48)
!47 = !DIFile(filename: "main_d2/player.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "8ffee99de4d393c8ae4578dcf4efebc6")
!48 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "player", file: !47, line: 65, size: 1184, flags: DIFlagTypePassByValue, elements: !49, identifier: "_ZTS6player")
!49 = !{!50, !54, !58, !59, !63, !64, !65, !66, !70, !75, !76, !77, !78, !79, !80, !81, !82, !83, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108}
!50 = !DIDerivedType(tag: DW_TAG_member, name: "callsign", scope: !48, file: !47, line: 67, baseType: !51, size: 72)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 72, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 9)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "net_address", scope: !48, file: !47, line: 68, baseType: !55, size: 32, offset: 72)
!55 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 32, elements: !56)
!56 = !{!57}
!57 = !DISubrange(count: 4)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "net_port", scope: !48, file: !47, line: 69, baseType: !13, size: 16, offset: 112)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "connected", scope: !48, file: !47, line: 70, baseType: !60, size: 8, offset: 128)
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !61, line: 30, baseType: !62)
!61 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int8_t.h", directory: "", checksumkind: CSK_MD5, checksum: "5052dfe782b50fed2355b8f61a9e4fa9")
!62 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "objnum", scope: !48, file: !47, line: 71, baseType: !7, size: 32, offset: 160)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "n_packets_got", scope: !48, file: !47, line: 72, baseType: !7, size: 32, offset: 192)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "n_packets_sent", scope: !48, file: !47, line: 73, baseType: !7, size: 32, offset: 224)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !48, file: !47, line: 78, baseType: !67, size: 32, offset: 256)
!67 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !68, line: 31, baseType: !69)
!68 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint32_t.h", directory: "", checksumkind: CSK_MD5, checksum: "0254eb80c6b9719ac45c3c1cf872109b")
!69 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!70 = !DIDerivedType(tag: DW_TAG_member, name: "energy", scope: !48, file: !47, line: 79, baseType: !71, size: 32, offset: 288)
!71 = !DIDerivedType(tag: DW_TAG_typedef, name: "fix", file: !72, line: 20, baseType: !73)
!72 = !DIFile(filename: "./fix/fix.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "c5006a11bf8b4cb7d963898499eda13a")
!73 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !74, line: 30, baseType: !7)
!74 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int32_t.h", directory: "", checksumkind: CSK_MD5, checksum: "d23e8406e80ee79983f28509c741fa17")
!75 = !DIDerivedType(tag: DW_TAG_member, name: "shields", scope: !48, file: !47, line: 80, baseType: !71, size: 32, offset: 320)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "lives", scope: !48, file: !47, line: 81, baseType: !17, size: 8, offset: 352)
!77 = !DIDerivedType(tag: DW_TAG_member, name: "level", scope: !48, file: !47, line: 82, baseType: !60, size: 8, offset: 360)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "laser_level", scope: !48, file: !47, line: 83, baseType: !17, size: 8, offset: 368)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "starting_level", scope: !48, file: !47, line: 84, baseType: !60, size: 8, offset: 376)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "killer_objnum", scope: !48, file: !47, line: 85, baseType: !20, size: 16, offset: 384)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "primary_weapon_flags", scope: !48, file: !47, line: 86, baseType: !13, size: 16, offset: 400)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "secondary_weapon_flags", scope: !48, file: !47, line: 87, baseType: !13, size: 16, offset: 416)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "primary_ammo", scope: !48, file: !47, line: 88, baseType: !84, size: 160, offset: 432)
!84 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 160, elements: !85)
!85 = !{!86}
!86 = !DISubrange(count: 10)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "secondary_ammo", scope: !48, file: !47, line: 89, baseType: !84, size: 160, offset: 592)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "pad", scope: !48, file: !47, line: 91, baseType: !13, size: 16, offset: 752)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "last_score", scope: !48, file: !47, line: 96, baseType: !7, size: 32, offset: 768)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "score", scope: !48, file: !47, line: 97, baseType: !7, size: 32, offset: 800)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "time_level", scope: !48, file: !47, line: 98, baseType: !71, size: 32, offset: 832)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "time_total", scope: !48, file: !47, line: 99, baseType: !71, size: 32, offset: 864)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "cloak_time", scope: !48, file: !47, line: 101, baseType: !71, size: 32, offset: 896)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "invulnerable_time", scope: !48, file: !47, line: 102, baseType: !71, size: 32, offset: 928)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "KillGoalCount", scope: !48, file: !47, line: 104, baseType: !20, size: 16, offset: 960)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "net_killed_total", scope: !48, file: !47, line: 105, baseType: !20, size: 16, offset: 976)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "net_kills_total", scope: !48, file: !47, line: 106, baseType: !20, size: 16, offset: 992)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "num_kills_level", scope: !48, file: !47, line: 107, baseType: !20, size: 16, offset: 1008)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "num_kills_total", scope: !48, file: !47, line: 108, baseType: !20, size: 16, offset: 1024)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "num_robots_level", scope: !48, file: !47, line: 109, baseType: !20, size: 16, offset: 1040)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "num_robots_total", scope: !48, file: !47, line: 110, baseType: !20, size: 16, offset: 1056)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "hostages_rescued_total", scope: !48, file: !47, line: 111, baseType: !13, size: 16, offset: 1072)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "hostages_total", scope: !48, file: !47, line: 112, baseType: !13, size: 16, offset: 1088)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "hostages_on_board", scope: !48, file: !47, line: 113, baseType: !17, size: 8, offset: 1104)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "hostages_level", scope: !48, file: !47, line: 114, baseType: !17, size: 8, offset: 1112)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "homing_object_dist", scope: !48, file: !47, line: 115, baseType: !71, size: 32, offset: 1120)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "hours_level", scope: !48, file: !47, line: 116, baseType: !60, size: 8, offset: 1152)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "hours_total", scope: !48, file: !47, line: 117, baseType: !60, size: 8, offset: 1160)
!109 = !{!110}
!110 = !DISubrange(count: 12)
!111 = !DIGlobalVariableExpression(var: !112, expr: !DIExpression())
!112 = distinct !DIGlobalVariable(name: "Player_init", scope: !2, file: !29, line: 150, type: !113, isLocal: false, isDefinition: true)
!113 = !DICompositeType(tag: DW_TAG_array_type, baseType: !114, size: 3328, elements: !134)
!114 = !DIDerivedType(tag: DW_TAG_typedef, name: "obj_position", file: !115, line: 266, baseType: !116)
!115 = !DIFile(filename: "main_d2/object.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "1f2325d356aae4b692933d2aae4f3afd")
!116 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "obj_position", file: !115, line: 261, size: 416, flags: DIFlagTypePassByValue, elements: !117, identifier: "_ZTS12obj_position")
!117 = !{!118, !126, !133}
!118 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !116, file: !115, line: 263, baseType: !119, size: 96)
!119 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_vector", file: !120, line: 22, baseType: !121)
!120 = !DIFile(filename: "./vecmat/vecmat.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "dfa84e3325c1ea4f5f74699fff5ef2bf")
!121 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_vector", file: !120, line: 19, size: 96, flags: DIFlagTypePassByValue, elements: !122, identifier: "_ZTS10vms_vector")
!122 = !{!123, !124, !125}
!123 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !121, file: !120, line: 21, baseType: !71, size: 32)
!124 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !121, file: !120, line: 21, baseType: !71, size: 32, offset: 32)
!125 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !121, file: !120, line: 21, baseType: !71, size: 32, offset: 64)
!126 = !DIDerivedType(tag: DW_TAG_member, name: "orient", scope: !116, file: !115, line: 264, baseType: !127, size: 288, offset: 96)
!127 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_matrix", file: !120, line: 47, baseType: !128)
!128 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_matrix", file: !120, line: 44, size: 288, flags: DIFlagTypePassByValue, elements: !129, identifier: "_ZTS10vms_matrix")
!129 = !{!130, !131, !132}
!130 = !DIDerivedType(tag: DW_TAG_member, name: "rvec", scope: !128, file: !120, line: 46, baseType: !119, size: 96)
!131 = !DIDerivedType(tag: DW_TAG_member, name: "uvec", scope: !128, file: !120, line: 46, baseType: !119, size: 96, offset: 96)
!132 = !DIDerivedType(tag: DW_TAG_member, name: "fvec", scope: !128, file: !120, line: 46, baseType: !119, size: 96, offset: 192)
!133 = !DIDerivedType(tag: DW_TAG_member, name: "segnum", scope: !116, file: !115, line: 265, baseType: !20, size: 16, offset: 384)
!134 = !{!135}
!135 = !DISubrange(count: 8)
!136 = !DIGlobalVariableExpression(var: !137, expr: !DIExpression())
!137 = distinct !DIGlobalVariable(name: "MaxNumNetPlayers", scope: !2, file: !29, line: 153, type: !7, isLocal: false, isDefinition: true)
!138 = !DIGlobalVariableExpression(var: !139, expr: !DIExpression())
!139 = distinct !DIGlobalVariable(name: "NumNetPlayerPositions", scope: !2, file: !29, line: 154, type: !7, isLocal: false, isDefinition: true)
!140 = !DIGlobalVariableExpression(var: !141, expr: !DIExpression())
!141 = distinct !DIGlobalVariable(name: "Do_appearance_effect", scope: !2, file: !29, line: 171, type: !7, isLocal: false, isDefinition: true)
!142 = !DIGlobalVariableExpression(var: !143, expr: !DIExpression())
!143 = distinct !DIGlobalVariable(name: "First_secret_visit", scope: !2, file: !29, line: 175, type: !7, isLocal: false, isDefinition: true)
!144 = !DIGlobalVariableExpression(var: !145, expr: !DIExpression())
!145 = distinct !DIGlobalVariable(scope: null, file: !29, line: 207, type: !146, isLocal: true, isDefinition: true)
!146 = !DICompositeType(tag: DW_TAG_array_type, baseType: !147, size: 128, elements: !148)
!147 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !22)
!148 = !{!149}
!149 = !DISubrange(count: 16)
!150 = !DIGlobalVariableExpression(var: !151, expr: !DIExpression())
!151 = distinct !DIGlobalVariable(scope: null, file: !29, line: 207, type: !152, isLocal: true, isDefinition: true)
!152 = !DICompositeType(tag: DW_TAG_array_type, baseType: !147, size: 456, elements: !153)
!153 = !{!154}
!154 = !DISubrange(count: 57)
!155 = !DIGlobalVariableExpression(var: !156, expr: !DIExpression())
!156 = distinct !DIGlobalVariable(scope: null, file: !29, line: 208, type: !157, isLocal: true, isDefinition: true)
!157 = !DICompositeType(tag: DW_TAG_array_type, baseType: !147, size: 256, elements: !158)
!158 = !{!159}
!159 = !DISubrange(count: 32)
!160 = !DIGlobalVariableExpression(var: !161, expr: !DIExpression())
!161 = distinct !DIGlobalVariable(scope: null, file: !29, line: 210, type: !162, isLocal: true, isDefinition: true)
!162 = !DICompositeType(tag: DW_TAG_array_type, baseType: !147, size: 272, elements: !163)
!163 = !{!164}
!164 = !DISubrange(count: 34)
!165 = !DIGlobalVariableExpression(var: !166, expr: !DIExpression())
!166 = distinct !DIGlobalVariable(scope: null, file: !29, line: 211, type: !157, isLocal: true, isDefinition: true)
!167 = !DIGlobalVariableExpression(var: !168, expr: !DIExpression())
!168 = distinct !DIGlobalVariable(scope: null, file: !29, line: 339, type: !169, isLocal: true, isDefinition: true)
!169 = !DICompositeType(tag: DW_TAG_array_type, baseType: !147, size: 416, elements: !170)
!170 = !{!171}
!171 = !DISubrange(count: 52)
!172 = !DIGlobalVariableExpression(var: !173, expr: !DIExpression())
!173 = distinct !DIGlobalVariable(name: "StartingShields", scope: !2, file: !29, line: 414, type: !71, isLocal: false, isDefinition: true)
!174 = !DIGlobalVariableExpression(var: !175, expr: !DIExpression())
!175 = distinct !DIGlobalVariable(name: "flash_dist", scope: !2, file: !29, line: 828, type: !71, isLocal: false, isDefinition: true)
!176 = !DIGlobalVariableExpression(var: !177, expr: !DIExpression())
!177 = distinct !DIGlobalVariable(name: "playername_allowed_chars", scope: !2, file: !29, line: 865, type: !178, isLocal: false, isDefinition: true)
!178 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 88, elements: !179)
!179 = !{!180}
!180 = !DISubrange(count: 11)
!181 = !DIGlobalVariableExpression(var: !182, expr: !DIExpression())
!182 = distinct !DIGlobalVariable(scope: null, file: !29, line: 893, type: !183, isLocal: true, isDefinition: true)
!183 = !DICompositeType(tag: DW_TAG_array_type, baseType: !147, size: 56, elements: !184)
!184 = !{!185}
!185 = !DISubrange(count: 7)
!186 = !DIGlobalVariableExpression(var: !187, expr: !DIExpression())
!187 = distinct !DIGlobalVariable(scope: null, file: !29, line: 895, type: !188, isLocal: true, isDefinition: true)
!188 = !DICompositeType(tag: DW_TAG_array_type, baseType: !147, size: 24, elements: !189)
!189 = !{!190}
!190 = !DISubrange(count: 3)
!191 = !DIGlobalVariableExpression(var: !192, expr: !DIExpression())
!192 = distinct !DIGlobalVariable(scope: null, file: !29, line: 909, type: !193, isLocal: true, isDefinition: true)
!193 = !DICompositeType(tag: DW_TAG_array_type, baseType: !147, size: 88, elements: !179)
!194 = !DIGlobalVariableExpression(var: !195, expr: !DIExpression())
!195 = distinct !DIGlobalVariable(scope: null, file: !29, line: 960, type: !196, isLocal: true, isDefinition: true)
!196 = !DICompositeType(tag: DW_TAG_array_type, baseType: !147, size: 48, elements: !197)
!197 = !{!198}
!198 = !DISubrange(count: 6)
!199 = !DIGlobalVariableExpression(var: !200, expr: !DIExpression())
!200 = distinct !DIGlobalVariable(name: "Bitmap_replacement_data", scope: !2, file: !29, line: 1000, type: !16, isLocal: false, isDefinition: true)
!201 = !DIGlobalVariableExpression(var: !202, expr: !DIExpression())
!202 = distinct !DIGlobalVariable(scope: null, file: !29, line: 1030, type: !203, isLocal: true, isDefinition: true)
!203 = !DICompositeType(tag: DW_TAG_array_type, baseType: !147, size: 40, elements: !204)
!204 = !{!205}
!205 = !DISubrange(count: 5)
!206 = !DIGlobalVariableExpression(var: !207, expr: !DIExpression())
!207 = distinct !DIGlobalVariable(scope: null, file: !29, line: 1049, type: !208, isLocal: true, isDefinition: true)
!208 = !DICompositeType(tag: DW_TAG_array_type, baseType: !147, size: 64, elements: !134)
!209 = !DIGlobalVariableExpression(var: !210, expr: !DIExpression())
!210 = distinct !DIGlobalVariable(scope: null, file: !29, line: 1057, type: !211, isLocal: true, isDefinition: true)
!211 = !DICompositeType(tag: DW_TAG_array_type, baseType: !147, size: 192, elements: !212)
!212 = !{!213}
!213 = !DISubrange(count: 24)
!214 = !DIGlobalVariableExpression(var: !215, expr: !DIExpression())
!215 = distinct !DIGlobalVariable(scope: null, file: !29, line: 1115, type: !216, isLocal: true, isDefinition: true)
!216 = !DICompositeType(tag: DW_TAG_array_type, baseType: !147, size: 608, elements: !217)
!217 = !{!218}
!218 = !DISubrange(count: 76)
!219 = !DIGlobalVariableExpression(var: !220, expr: !DIExpression())
!220 = distinct !DIGlobalVariable(scope: null, file: !29, line: 1140, type: !221, isLocal: true, isDefinition: true)
!221 = !DICompositeType(tag: DW_TAG_array_type, baseType: !147, size: 336, elements: !222)
!222 = !{!223}
!223 = !DISubrange(count: 42)
!224 = !DIGlobalVariableExpression(var: !225, expr: !DIExpression())
!225 = distinct !DIGlobalVariable(scope: null, file: !29, line: 1214, type: !226, isLocal: true, isDefinition: true)
!226 = !DICompositeType(tag: DW_TAG_array_type, baseType: !147, size: 352, elements: !227)
!227 = !{!228}
!228 = !DISubrange(count: 44)
!229 = !DIGlobalVariableExpression(var: !230, expr: !DIExpression())
!230 = distinct !DIGlobalVariable(scope: null, file: !29, line: 1319, type: !231, isLocal: true, isDefinition: true)
!231 = !DICompositeType(tag: DW_TAG_array_type, baseType: !147, size: 176, elements: !232)
!232 = !{!233}
!233 = !DISubrange(count: 22)
!234 = !DIGlobalVariableExpression(var: !235, expr: !DIExpression())
!235 = distinct !DIGlobalVariable(scope: null, file: !29, line: 1359, type: !196, isLocal: true, isDefinition: true)
!236 = !DIGlobalVariableExpression(var: !237, expr: !DIExpression())
!237 = distinct !DIGlobalVariable(scope: null, file: !29, line: 1373, type: !238, isLocal: true, isDefinition: true)
!238 = !DICompositeType(tag: DW_TAG_array_type, baseType: !147, size: 168, elements: !239)
!239 = !{!240}
!240 = !DISubrange(count: 21)
!241 = !DIGlobalVariableExpression(var: !242, expr: !DIExpression())
!242 = distinct !DIGlobalVariable(scope: null, file: !29, line: 1377, type: !203, isLocal: true, isDefinition: true)
!243 = !DIGlobalVariableExpression(var: !244, expr: !DIExpression())
!244 = distinct !DIGlobalVariable(scope: null, file: !29, line: 1382, type: !188, isLocal: true, isDefinition: true)
!245 = !DIGlobalVariableExpression(var: !246, expr: !DIExpression())
!246 = distinct !DIGlobalVariable(scope: null, file: !29, line: 1406, type: !247, isLocal: true, isDefinition: true)
!247 = !DICompositeType(tag: DW_TAG_array_type, baseType: !147, size: 144, elements: !248)
!248 = !{!249}
!249 = !DISubrange(count: 18)
!250 = !DIGlobalVariableExpression(var: !251, expr: !DIExpression())
!251 = distinct !DIGlobalVariable(scope: null, file: !29, line: 1406, type: !252, isLocal: true, isDefinition: true)
!252 = !DICompositeType(tag: DW_TAG_array_type, baseType: !147, size: 32, elements: !56)
!253 = !DIGlobalVariableExpression(var: !254, expr: !DIExpression())
!254 = distinct !DIGlobalVariable(scope: null, file: !29, line: 1406, type: !255, isLocal: true, isDefinition: true)
!255 = !DICompositeType(tag: DW_TAG_array_type, baseType: !147, size: 16, elements: !256)
!256 = !{!257}
!257 = !DISubrange(count: 2)
!258 = !DIGlobalVariableExpression(var: !259, expr: !DIExpression())
!259 = distinct !DIGlobalVariable(scope: null, file: !29, line: 1408, type: !260, isLocal: true, isDefinition: true)
!260 = !DICompositeType(tag: DW_TAG_array_type, baseType: !147, size: 136, elements: !261)
!261 = !{!262}
!262 = !DISubrange(count: 17)
!263 = !DIGlobalVariableExpression(var: !264, expr: !DIExpression())
!264 = distinct !DIGlobalVariable(scope: null, file: !29, line: 1410, type: !247, isLocal: true, isDefinition: true)
!265 = !DIGlobalVariableExpression(var: !266, expr: !DIExpression())
!266 = distinct !DIGlobalVariable(scope: null, file: !29, line: 1414, type: !267, isLocal: true, isDefinition: true)
!267 = !DICompositeType(tag: DW_TAG_array_type, baseType: !147, size: 96, elements: !109)
!268 = !DIGlobalVariableExpression(var: !269, expr: !DIExpression())
!269 = distinct !DIGlobalVariable(scope: null, file: !29, line: 1423, type: !193, isLocal: true, isDefinition: true)
!270 = !DIGlobalVariableExpression(var: !271, expr: !DIExpression())
!271 = distinct !DIGlobalVariable(scope: null, file: !29, line: 1423, type: !272, isLocal: true, isDefinition: true)
!272 = !DICompositeType(tag: DW_TAG_array_type, baseType: !147, size: 80, elements: !85)
!273 = !DIGlobalVariableExpression(var: !274, expr: !DIExpression())
!274 = distinct !DIGlobalVariable(scope: null, file: !29, line: 1425, type: !275, isLocal: true, isDefinition: true)
!275 = !DICompositeType(tag: DW_TAG_array_type, baseType: !147, size: 216, elements: !276)
!276 = !{!277}
!277 = !DISubrange(count: 27)
!278 = !DIGlobalVariableExpression(var: !279, expr: !DIExpression())
!279 = distinct !DIGlobalVariable(scope: null, file: !29, line: 1440, type: !146, isLocal: true, isDefinition: true)
!280 = !DIGlobalVariableExpression(var: !281, expr: !DIExpression())
!281 = distinct !DIGlobalVariable(scope: null, file: !29, line: 1477, type: !193, isLocal: true, isDefinition: true)
!282 = !DIGlobalVariableExpression(var: !283, expr: !DIExpression())
!283 = distinct !DIGlobalVariable(scope: null, file: !29, line: 1528, type: !255, isLocal: true, isDefinition: true)
!284 = !DIGlobalVariableExpression(var: !285, expr: !DIExpression())
!285 = distinct !DIGlobalVariable(scope: null, file: !29, line: 1563, type: !286, isLocal: true, isDefinition: true)
!286 = !DICompositeType(tag: DW_TAG_array_type, baseType: !147, size: 440, elements: !287)
!287 = !{!288}
!288 = !DISubrange(count: 55)
!289 = !DIGlobalVariableExpression(var: !290, expr: !DIExpression())
!290 = distinct !DIGlobalVariable(scope: null, file: !29, line: 1571, type: !291, isLocal: true, isDefinition: true)
!291 = !DICompositeType(tag: DW_TAG_array_type, baseType: !147, size: 248, elements: !292)
!292 = !{!293}
!293 = !DISubrange(count: 31)
!294 = !DIGlobalVariableExpression(var: !295, expr: !DIExpression())
!295 = distinct !DIGlobalVariable(scope: null, file: !29, line: 1573, type: !296, isLocal: true, isDefinition: true)
!296 = !DICompositeType(tag: DW_TAG_array_type, baseType: !147, size: 224, elements: !297)
!297 = !{!298}
!298 = !DISubrange(count: 28)
!299 = !DIGlobalVariableExpression(var: !300, expr: !DIExpression())
!300 = distinct !DIGlobalVariable(name: "Entered_from_level", scope: !2, file: !29, line: 1654, type: !7, isLocal: false, isDefinition: true)
!301 = !DIGlobalVariableExpression(var: !302, expr: !DIExpression())
!302 = distinct !DIGlobalVariable(scope: null, file: !29, line: 1674, type: !193, isLocal: true, isDefinition: true)
!303 = !DIGlobalVariableExpression(var: !304, expr: !DIExpression())
!304 = distinct !DIGlobalVariable(scope: null, file: !29, line: 1730, type: !211, isLocal: true, isDefinition: true)
!305 = !DIGlobalVariableExpression(var: !306, expr: !DIExpression())
!306 = distinct !DIGlobalVariable(scope: null, file: !29, line: 1768, type: !307, isLocal: true, isDefinition: true)
!307 = !DICompositeType(tag: DW_TAG_array_type, baseType: !147, size: 104, elements: !308)
!308 = !{!309}
!309 = !DISubrange(count: 13)
!310 = !DIGlobalVariableExpression(var: !311, expr: !DIExpression())
!311 = distinct !DIGlobalVariable(scope: null, file: !29, line: 1795, type: !193, isLocal: true, isDefinition: true)
!312 = !DIGlobalVariableExpression(var: !313, expr: !DIExpression())
!313 = distinct !DIGlobalVariable(scope: null, file: !29, line: 1817, type: !146, isLocal: true, isDefinition: true)
!314 = !DIGlobalVariableExpression(var: !315, expr: !DIExpression())
!315 = distinct !DIGlobalVariable(scope: null, file: !29, line: 1818, type: !267, isLocal: true, isDefinition: true)
!316 = !DIGlobalVariableExpression(var: !317, expr: !DIExpression())
!317 = distinct !DIGlobalVariable(scope: null, file: !29, line: 1819, type: !318, isLocal: true, isDefinition: true)
!318 = !DICompositeType(tag: DW_TAG_array_type, baseType: !147, size: 120, elements: !319)
!319 = !{!320}
!320 = !DISubrange(count: 15)
!321 = !DIGlobalVariableExpression(var: !322, expr: !DIExpression())
!322 = distinct !DIGlobalVariable(scope: null, file: !29, line: 1823, type: !208, isLocal: true, isDefinition: true)
!323 = !DIGlobalVariableExpression(var: !324, expr: !DIExpression())
!324 = distinct !DIGlobalVariable(scope: null, file: !29, line: 1824, type: !252, isLocal: true, isDefinition: true)
!325 = !DIGlobalVariableExpression(var: !326, expr: !DIExpression())
!326 = distinct !DIGlobalVariable(scope: null, file: !29, line: 1838, type: !183, isLocal: true, isDefinition: true)
!327 = !DIGlobalVariableExpression(var: !328, expr: !DIExpression())
!328 = distinct !DIGlobalVariable(scope: null, file: !29, line: 1842, type: !183, isLocal: true, isDefinition: true)
!329 = !DIGlobalVariableExpression(var: !330, expr: !DIExpression())
!330 = distinct !DIGlobalVariable(scope: null, file: !29, line: 1869, type: !267, isLocal: true, isDefinition: true)
!331 = !DIGlobalVariableExpression(var: !332, expr: !DIExpression())
!332 = distinct !DIGlobalVariable(name: "Secret_level_table", scope: !2, file: !29, line: 1880, type: !333, isLocal: false, isDefinition: true)
!333 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 192, elements: !197)
!334 = !DIGlobalVariableExpression(var: !335, expr: !DIExpression())
!335 = distinct !DIGlobalVariable(scope: null, file: !29, line: 1889, type: !336, isLocal: true, isDefinition: true)
!336 = !DICompositeType(tag: DW_TAG_array_type, baseType: !147, size: 112, elements: !337)
!337 = !{!338}
!338 = !DISubrange(count: 14)
!339 = !DIGlobalVariableExpression(var: !340, expr: !DIExpression())
!340 = distinct !DIGlobalVariable(scope: null, file: !29, line: 1924, type: !231, isLocal: true, isDefinition: true)
!341 = !DIGlobalVariableExpression(var: !342, expr: !DIExpression())
!342 = distinct !DIGlobalVariable(scope: null, file: !29, line: 2040, type: !231, isLocal: true, isDefinition: true)
!343 = !DIGlobalVariableExpression(var: !344, expr: !DIExpression())
!344 = distinct !DIGlobalVariable(scope: null, file: !29, line: 2059, type: !231, isLocal: true, isDefinition: true)
!345 = !DIGlobalVariableExpression(var: !346, expr: !DIExpression())
!346 = distinct !DIGlobalVariable(scope: null, file: !29, line: 2079, type: !226, isLocal: true, isDefinition: true)
!347 = !DIGlobalVariableExpression(var: !348, expr: !DIExpression())
!348 = distinct !DIGlobalVariable(scope: null, file: !29, line: 2232, type: !349, isLocal: true, isDefinition: true)
!349 = !DICompositeType(tag: DW_TAG_array_type, baseType: !147, size: 280, elements: !350)
!350 = !{!351}
!351 = !DISubrange(count: 35)
!352 = !DIGlobalVariableExpression(var: !353, expr: !DIExpression())
!353 = distinct !DIGlobalVariable(scope: null, file: !29, line: 2374, type: !162, isLocal: true, isDefinition: true)
!354 = !DIGlobalVariableExpression(var: !355, expr: !DIExpression())
!355 = distinct !DIGlobalVariable(scope: null, file: !29, line: 2406, type: !356, isLocal: true, isDefinition: true)
!356 = !DICompositeType(tag: DW_TAG_array_type, baseType: !147, size: 200, elements: !357)
!357 = !{!358}
!358 = !DISubrange(count: 25)
!359 = !DIGlobalVariableExpression(var: !360, expr: !DIExpression())
!360 = distinct !DIGlobalVariable(scope: null, file: !29, line: 2412, type: !361, isLocal: true, isDefinition: true)
!361 = !DICompositeType(tag: DW_TAG_array_type, baseType: !147, size: 72, elements: !52)
!362 = !DIGlobalVariableExpression(var: !363, expr: !DIExpression())
!363 = distinct !DIGlobalVariable(scope: null, file: !29, line: 2464, type: !193, isLocal: true, isDefinition: true)
!364 = !DIGlobalVariableExpression(var: !365, expr: !DIExpression())
!365 = distinct !DIGlobalVariable(scope: null, file: !29, line: 2481, type: !272, isLocal: true, isDefinition: true)
!366 = !DIGlobalVariableExpression(var: !367, expr: !DIExpression())
!367 = distinct !DIGlobalVariable(scope: null, file: !29, line: 2511, type: !368, isLocal: true, isDefinition: true)
!368 = !DICompositeType(tag: DW_TAG_array_type, baseType: !147, size: 480, elements: !369)
!369 = !{!370}
!370 = !DISubrange(count: 60)
!371 = !DIGlobalVariableExpression(var: !372, expr: !DIExpression())
!372 = distinct !DIGlobalVariable(scope: null, file: !29, line: 2588, type: !373, isLocal: true, isDefinition: true)
!373 = !DICompositeType(tag: DW_TAG_array_type, baseType: !147, size: 328, elements: !374)
!374 = !{!375}
!375 = !DISubrange(count: 41)
!376 = !DIGlobalVariableExpression(var: !377, expr: !DIExpression())
!377 = distinct !DIGlobalVariable(scope: null, file: !29, line: 2591, type: !318, isLocal: true, isDefinition: true)
!378 = !DIGlobalVariableExpression(var: !379, expr: !DIExpression())
!379 = distinct !DIGlobalVariable(scope: null, file: !29, line: 2592, type: !162, isLocal: true, isDefinition: true)
!380 = !DIGlobalVariableExpression(var: !381, expr: !DIExpression())
!381 = distinct !DIGlobalVariable(scope: null, file: !29, line: 2649, type: !211, isLocal: true, isDefinition: true)
!382 = !DIGlobalVariableExpression(var: !383, expr: !DIExpression())
!383 = distinct !DIGlobalVariable(scope: null, file: !29, line: 2651, type: !231, isLocal: true, isDefinition: true)
!384 = !DIGlobalVariableExpression(var: !385, expr: !DIExpression(DW_OP_constu, 16, DW_OP_stack_value))
!385 = distinct !DIGlobalVariable(name: "FRACBITS", scope: !2, file: !72, line: 18, type: !386, isLocal: true, isDefinition: true)
!386 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!387 = !DIGlobalVariableExpression(var: !388, expr: !DIExpression())
!388 = distinct !DIGlobalVariable(name: "intro_movie", scope: !2, file: !29, line: 2419, type: !389, isLocal: true, isDefinition: true)
!389 = !DICompositeType(tag: DW_TAG_array_type, baseType: !390, size: 1120, elements: !184)
!390 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !29, line: 2416, size: 160, flags: DIFlagTypePassByValue, elements: !391)
!391 = !{!392, !393}
!392 = !DIDerivedType(tag: DW_TAG_member, name: "level_num", scope: !390, file: !29, line: 2417, baseType: !7, size: 32)
!393 = !DIDerivedType(tag: DW_TAG_member, name: "movie_name", scope: !390, file: !29, line: 2418, baseType: !394, size: 104, offset: 32)
!394 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 104, elements: !308)
!395 = !{!396, !400, !403, !404, !405, !406, !407, !408, !412, !415, !417, !419, !421, !423, !425, !427, !429, !431, !433, !435, !437, !439, !441, !443, !445, !451, !455, !458, !461, !466, !472, !474, !476, !478, !480, !482, !484, !486, !488, !490, !492, !494, !496, !498, !503, !508, !513, !518, !520, !523, !525, !527, !529, !531, !533, !535, !537, !539, !541, !545, !550, !554, !556, !560, !564, !577, !592, !593, !646, !655, !657, !665, !671, !675, !679, !681, !685, !689, !693, !697, !701, !705, !707, !709, !713, !719, !724, !728, !732, !736, !740, !744, !748, !752, !754, !756, !760, !762, !766, !770, !775, !777, !779, !781, !785, !789, !793, !795, !799, !801, !803, !805, !807, !813, !817, !819, !825, !830, !834, !838, !843, !848, !852, !856, !860, !864, !866, !868, !876, !882, !888, !892, !896, !900, !904, !909, !913, !917, !921, !925, !929, !933, !937, !941, !946, !950, !954, !958, !963, !968, !972, !974, !978, !980, !989, !993, !998, !1002, !1006, !1010, !1014, !1016, !1020, !1024, !1028, !1032, !1036, !1038, !1040, !1042, !1050, !1052, !1054, !1056, !1062, !1064, !1065, !1066, !1067, !1070, !1072, !1073, !1077, !1079, !1081, !1085, !1087, !1089, !1091, !1093, !1095, !1097, !1099, !1104, !1108, !1110, !1112, !1113, !1118, !1120, !1122, !1124, !1126, !1128, !1130, !1132, !1134, !1136, !1138, !1140, !1142, !1144, !1146, !1148, !1150, !1154, !1156, !1158, !1160, !1164, !1166, !1170, !1172, !1174, !1176, !1178, !1182, !1184, !1186, !1190, !1192, !1194, !1198, !1200, !1204, !1206, !1208, !1212, !1214, !1216, !1218, !1220, !1222, !1224, !1228, !1230, !1232, !1234, !1236, !1238, !1240, !1242, !1246, !1250, !1252, !1254, !1256, !1258, !1260, !1262, !1264, !1266, !1268, !1270, !1272, !1274, !1276, !1278, !1280, !1282, !1284, !1286, !1288, !1292, !1294, !1296, !1298, !1302, !1304, !1308, !1310, !1312, !1314, !1316, !1320, !1322, !1326, !1328, !1330, !1332, !1334, !1338, !1340, !1342, !1346, !1348, !1350, !1352, !1358, !1360, !1364, !1368, !1370, !1372, !1376, !1380, !1384, !1386, !1390, !1395, !1399, !1403, !1405, !1407, !1409, !1411, !1413, !1415, !1419, !1423, !1428, !1433, !1437, !1438, !1442, !1446, !1451, !1456, !1460, !1466, !1470, !1472, !1476, !1478, !1479, !1483, !1485, !1489, !1493, !1497, !1499, !1503, !1507, !1511, !1517, !1519, !1523, !1527, !1531, !1533, !1537, !1541, !1545, !1547, !1549, !1551, !1555, !1559, !1564, !1568, !1574, !1578, !1582, !1584, !1586, !1588, !1592, !1596, !1600, !1602, !1604, !1608, !1612, !1614, !1618, !1622, !1625, !1627, !1629, !1631, !1660, !1665, !1670}
!396 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !60, file: !399, line: 158)
!397 = !DINamespace(name: "__1", scope: !398, exportSymbols: true)
!398 = !DINamespace(name: "std", scope: null)
!399 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdint", directory: "")
!400 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !401, file: !399, line: 159)
!401 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !402, line: 30, baseType: !20)
!402 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int16_t.h", directory: "", checksumkind: CSK_MD5, checksum: "47ed3c3ac6f65bfec021ca2b7be18e7e")
!403 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !73, file: !399, line: 160)
!404 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !23, file: !399, line: 161)
!405 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !17, file: !399, line: 163)
!406 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !13, file: !399, line: 164)
!407 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !67, file: !399, line: 165)
!408 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !409, file: !399, line: 166)
!409 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !410, line: 31, baseType: !411)
!410 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint64_t.h", directory: "", checksumkind: CSK_MD5, checksum: "77fc5e91653260959605f129691cf9b1")
!411 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!412 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !413, file: !399, line: 168)
!413 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !414, line: 29, baseType: !60)
!414 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "042ceedaf4137a8aaa272d0b27434016")
!415 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !416, file: !399, line: 169)
!416 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !414, line: 30, baseType: !401)
!417 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !418, file: !399, line: 170)
!418 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !414, line: 31, baseType: !73)
!419 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !420, file: !399, line: 171)
!420 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !414, line: 32, baseType: !23)
!421 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !422, file: !399, line: 173)
!422 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !414, line: 33, baseType: !17)
!423 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !424, file: !399, line: 174)
!424 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !414, line: 34, baseType: !13)
!425 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !426, file: !399, line: 175)
!426 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !414, line: 35, baseType: !67)
!427 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !428, file: !399, line: 176)
!428 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !414, line: 36, baseType: !409)
!429 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !430, file: !399, line: 178)
!430 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !414, line: 40, baseType: !60)
!431 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !432, file: !399, line: 179)
!432 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !414, line: 41, baseType: !401)
!433 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !434, file: !399, line: 180)
!434 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !414, line: 42, baseType: !73)
!435 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !436, file: !399, line: 181)
!436 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !414, line: 43, baseType: !23)
!437 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !438, file: !399, line: 183)
!438 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !414, line: 44, baseType: !17)
!439 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !440, file: !399, line: 184)
!440 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !414, line: 45, baseType: !13)
!441 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !442, file: !399, line: 185)
!442 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !414, line: 46, baseType: !67)
!443 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !444, file: !399, line: 186)
!444 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !414, line: 47, baseType: !409)
!445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !446, file: !399, line: 188)
!446 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !447, line: 32, baseType: !448)
!447 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_intptr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e478ba47270923b1cca6659f19f02db1")
!448 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_intptr_t", file: !449, line: 40, baseType: !450)
!449 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/arm/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "b270144f57ae258d0ce80b8f87be068c")
!450 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !452, file: !399, line: 189)
!452 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !453, line: 34, baseType: !454)
!453 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_uintptr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e70ae655dd1b9d4ae0b1dcc073f5b7e4")
!454 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!455 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !456, file: !399, line: 191)
!456 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !457, line: 32, baseType: !450)
!457 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_intmax_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e37b9240f30f486478152ef3989b1545")
!458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !459, file: !399, line: 192)
!459 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !460, line: 32, baseType: !454)
!460 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uintmax_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8217a3fbb207d8e87ca5318c313e81c2")
!461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !462, file: !465, line: 22)
!462 = !DIDerivedType(tag: DW_TAG_typedef, name: "max_align_t", file: !463, line: 16, baseType: !464)
!463 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/lib/clang/20/include/__stddef_max_align_t.h", directory: "", checksumkind: CSK_MD5, checksum: "3c0a2f19d136d39aa835c737c7105def")
!464 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
!465 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__cstddef/max_align_t.h", directory: "")
!466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !467, file: !471, line: 113)
!467 = !DISubprogram(name: "isalnum", linkageName: "_Z7isalnumi", scope: !468, file: !468, line: 217, type: !469, flags: DIFlagPrototyped, spFlags: 0)
!468 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_ctype.h", directory: "", checksumkind: CSK_MD5, checksum: "b10215117a277691ffc4168ac4505796")
!469 = !DISubroutineType(types: !470)
!470 = !{!7, !7}
!471 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cctype", directory: "")
!472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !473, file: !471, line: 114)
!473 = !DISubprogram(name: "isalpha", linkageName: "_Z7isalphai", scope: !468, file: !468, line: 223, type: !469, flags: DIFlagPrototyped, spFlags: 0)
!474 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !475, file: !471, line: 115)
!475 = !DISubprogram(name: "isblank", linkageName: "_Z7isblanki", scope: !468, file: !468, line: 229, type: !469, flags: DIFlagPrototyped, spFlags: 0)
!476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !477, file: !471, line: 116)
!477 = !DISubprogram(name: "iscntrl", linkageName: "_Z7iscntrli", scope: !468, file: !468, line: 235, type: !469, flags: DIFlagPrototyped, spFlags: 0)
!478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !479, file: !471, line: 117)
!479 = !DISubprogram(name: "isdigit", linkageName: "_Z7isdigiti", scope: !468, file: !468, line: 242, type: !469, flags: DIFlagPrototyped, spFlags: 0)
!480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !481, file: !471, line: 118)
!481 = !DISubprogram(name: "isgraph", linkageName: "_Z7isgraphi", scope: !468, file: !468, line: 248, type: !469, flags: DIFlagPrototyped, spFlags: 0)
!482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !483, file: !471, line: 119)
!483 = !DISubprogram(name: "islower", linkageName: "_Z7isloweri", scope: !468, file: !468, line: 254, type: !469, flags: DIFlagPrototyped, spFlags: 0)
!484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !485, file: !471, line: 120)
!485 = !DISubprogram(name: "isprint", linkageName: "_Z7isprinti", scope: !468, file: !468, line: 260, type: !469, flags: DIFlagPrototyped, spFlags: 0)
!486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !487, file: !471, line: 121)
!487 = !DISubprogram(name: "ispunct", linkageName: "_Z7ispuncti", scope: !468, file: !468, line: 266, type: !469, flags: DIFlagPrototyped, spFlags: 0)
!488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !489, file: !471, line: 122)
!489 = !DISubprogram(name: "isspace", linkageName: "_Z7isspacei", scope: !468, file: !468, line: 272, type: !469, flags: DIFlagPrototyped, spFlags: 0)
!490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !491, file: !471, line: 123)
!491 = !DISubprogram(name: "isupper", linkageName: "_Z7isupperi", scope: !468, file: !468, line: 278, type: !469, flags: DIFlagPrototyped, spFlags: 0)
!492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !493, file: !471, line: 124)
!493 = !DISubprogram(name: "isxdigit", linkageName: "_Z8isxdigiti", scope: !468, file: !468, line: 285, type: !469, flags: DIFlagPrototyped, spFlags: 0)
!494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !495, file: !471, line: 125)
!495 = !DISubprogram(name: "tolower", linkageName: "_Z7toloweri", scope: !468, file: !468, line: 297, type: !469, flags: DIFlagPrototyped, spFlags: 0)
!496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !497, file: !471, line: 126)
!497 = !DISubprogram(name: "toupper", linkageName: "_Z7toupperi", scope: !468, file: !468, line: 303, type: !469, flags: DIFlagPrototyped, spFlags: 0)
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !499, file: !502, line: 75)
!499 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !500, line: 32, baseType: !501)
!500 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_wint_t.h", directory: "", checksumkind: CSK_MD5, checksum: "6dfd3a3d5009054224653c03b2c2b6ac")
!501 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wint_t", file: !449, line: 111, baseType: !7)
!502 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cwctype", directory: "")
!503 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !504, file: !502, line: 76)
!504 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !505, line: 32, baseType: !506)
!505 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_wctrans_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e70040c8494301cc74e19df26f4c1d76")
!506 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wctrans_t", file: !507, line: 44, baseType: !7)
!507 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "c789da493a5b476a3618b20a8fcff3c3")
!508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !509, file: !502, line: 77)
!509 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !510, line: 32, baseType: !511)
!510 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_wctype_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8d1720b82a490c742e6a297f971be2a2")
!511 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wctype_t", file: !507, line: 46, baseType: !512)
!512 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !449, line: 36, baseType: !69)
!513 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !514, file: !502, line: 78)
!514 = !DISubprogram(name: "iswalnum", linkageName: "_Z8iswalnumi", scope: !515, file: !515, line: 84, type: !516, flags: DIFlagPrototyped, spFlags: 0)
!515 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/___wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "d5a8bf0b4062c20bda4d49376e5b44d9")
!516 = !DISubroutineType(types: !517)
!517 = !{!7, !499}
!518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !519, file: !502, line: 79)
!519 = !DISubprogram(name: "iswalpha", linkageName: "_Z8iswalphai", scope: !515, file: !515, line: 90, type: !516, flags: DIFlagPrototyped, spFlags: 0)
!520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !521, file: !502, line: 80)
!521 = !DISubprogram(name: "iswblank", linkageName: "_Z8iswblanki", scope: !522, file: !522, line: 53, type: !516, flags: DIFlagPrototyped, spFlags: 0)
!522 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "6bc93063cb32b00d3df790305c546a93")
!523 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !524, file: !502, line: 81)
!524 = !DISubprogram(name: "iswcntrl", linkageName: "_Z8iswcntrli", scope: !515, file: !515, line: 96, type: !516, flags: DIFlagPrototyped, spFlags: 0)
!525 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !526, file: !502, line: 82)
!526 = !DISubprogram(name: "iswdigit", linkageName: "_Z8iswdigiti", scope: !515, file: !515, line: 108, type: !516, flags: DIFlagPrototyped, spFlags: 0)
!527 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !528, file: !502, line: 83)
!528 = !DISubprogram(name: "iswgraph", linkageName: "_Z8iswgraphi", scope: !515, file: !515, line: 114, type: !516, flags: DIFlagPrototyped, spFlags: 0)
!529 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !530, file: !502, line: 84)
!530 = !DISubprogram(name: "iswlower", linkageName: "_Z8iswloweri", scope: !515, file: !515, line: 120, type: !516, flags: DIFlagPrototyped, spFlags: 0)
!531 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !532, file: !502, line: 85)
!532 = !DISubprogram(name: "iswprint", linkageName: "_Z8iswprinti", scope: !515, file: !515, line: 126, type: !516, flags: DIFlagPrototyped, spFlags: 0)
!533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !534, file: !502, line: 86)
!534 = !DISubprogram(name: "iswpunct", linkageName: "_Z8iswpuncti", scope: !515, file: !515, line: 132, type: !516, flags: DIFlagPrototyped, spFlags: 0)
!535 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !536, file: !502, line: 87)
!536 = !DISubprogram(name: "iswspace", linkageName: "_Z8iswspacei", scope: !515, file: !515, line: 138, type: !516, flags: DIFlagPrototyped, spFlags: 0)
!537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !538, file: !502, line: 88)
!538 = !DISubprogram(name: "iswupper", linkageName: "_Z8iswupperi", scope: !515, file: !515, line: 144, type: !516, flags: DIFlagPrototyped, spFlags: 0)
!539 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !540, file: !502, line: 89)
!540 = !DISubprogram(name: "iswxdigit", linkageName: "_Z9iswxdigiti", scope: !515, file: !515, line: 150, type: !516, flags: DIFlagPrototyped, spFlags: 0)
!541 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !542, file: !502, line: 90)
!542 = !DISubprogram(name: "iswctype", linkageName: "_Z8iswctypeij", scope: !515, file: !515, line: 102, type: !543, flags: DIFlagPrototyped, spFlags: 0)
!543 = !DISubroutineType(types: !544)
!544 = !{!7, !499, !509}
!545 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !546, file: !502, line: 91)
!546 = !DISubprogram(name: "wctype", scope: !515, file: !515, line: 190, type: !547, flags: DIFlagPrototyped, spFlags: 0)
!547 = !DISubroutineType(types: !548)
!548 = !{!509, !549}
!549 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !147, size: 64)
!550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !551, file: !502, line: 92)
!551 = !DISubprogram(name: "towlower", linkageName: "_Z8towloweri", scope: !515, file: !515, line: 156, type: !552, flags: DIFlagPrototyped, spFlags: 0)
!552 = !DISubroutineType(types: !553)
!553 = !{!499, !499}
!554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !555, file: !502, line: 93)
!555 = !DISubprogram(name: "towupper", linkageName: "_Z8towupperi", scope: !515, file: !515, line: 162, type: !552, flags: DIFlagPrototyped, spFlags: 0)
!556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !557, file: !502, line: 94)
!557 = !DISubprogram(name: "towctrans", scope: !522, file: !522, line: 124, type: !558, flags: DIFlagPrototyped, spFlags: 0)
!558 = !DISubroutineType(types: !559)
!559 = !{!499, !499, !504}
!560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !561, file: !502, line: 95)
!561 = !DISubprogram(name: "wctrans", scope: !522, file: !522, line: 126, type: !562, flags: DIFlagPrototyped, spFlags: 0)
!562 = !DISubroutineType(types: !563)
!563 = !{!504, !549}
!564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !565, file: !576, line: 133)
!565 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !566, line: 32, baseType: !567)
!566 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8f920c8f4b68eb07504db5a6777c5466")
!567 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_mbstate_t", file: !449, line: 72, baseType: !568)
!568 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !449, line: 70, baseType: !569)
!569 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !449, line: 67, size: 1024, flags: DIFlagTypePassByValue, elements: !570, identifier: "_ZTS11__mbstate_t")
!570 = !{!571, !575}
!571 = !DIDerivedType(tag: DW_TAG_member, name: "__mbstate8", scope: !569, file: !449, line: 68, baseType: !572, size: 1024)
!572 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 1024, elements: !573)
!573 = !{!574}
!574 = !DISubrange(count: 128)
!575 = !DIDerivedType(tag: DW_TAG_member, name: "_mbstateL", scope: !569, file: !449, line: 69, baseType: !25, size: 64)
!576 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cwchar", directory: "")
!577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !578, file: !576, line: 134)
!578 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !579, line: 78, size: 448, flags: DIFlagTypePassByValue, elements: !580, identifier: "_ZTS2tm")
!579 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_time.h", directory: "", checksumkind: CSK_MD5, checksum: "e65eafd533c28a52a9094e430476b03e")
!580 = !{!581, !582, !583, !584, !585, !586, !587, !588, !589, !590, !591}
!581 = !DIDerivedType(tag: DW_TAG_member, name: "tm_sec", scope: !578, file: !579, line: 79, baseType: !7, size: 32)
!582 = !DIDerivedType(tag: DW_TAG_member, name: "tm_min", scope: !578, file: !579, line: 80, baseType: !7, size: 32, offset: 32)
!583 = !DIDerivedType(tag: DW_TAG_member, name: "tm_hour", scope: !578, file: !579, line: 81, baseType: !7, size: 32, offset: 64)
!584 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mday", scope: !578, file: !579, line: 82, baseType: !7, size: 32, offset: 96)
!585 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mon", scope: !578, file: !579, line: 83, baseType: !7, size: 32, offset: 128)
!586 = !DIDerivedType(tag: DW_TAG_member, name: "tm_year", scope: !578, file: !579, line: 84, baseType: !7, size: 32, offset: 160)
!587 = !DIDerivedType(tag: DW_TAG_member, name: "tm_wday", scope: !578, file: !579, line: 85, baseType: !7, size: 32, offset: 192)
!588 = !DIDerivedType(tag: DW_TAG_member, name: "tm_yday", scope: !578, file: !579, line: 86, baseType: !7, size: 32, offset: 224)
!589 = !DIDerivedType(tag: DW_TAG_member, name: "tm_isdst", scope: !578, file: !579, line: 87, baseType: !7, size: 32, offset: 256)
!590 = !DIDerivedType(tag: DW_TAG_member, name: "tm_gmtoff", scope: !578, file: !579, line: 88, baseType: !450, size: 64, offset: 320)
!591 = !DIDerivedType(tag: DW_TAG_member, name: "tm_zone", scope: !578, file: !579, line: 89, baseType: !21, size: 64, offset: 384)
!592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !499, file: !576, line: 135)
!593 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !594, file: !576, line: 136)
!594 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !595, line: 162, baseType: !596)
!595 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "d91ebd7d161d9196cc100822ef0e5cdf")
!596 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILE", file: !595, line: 131, size: 1216, flags: DIFlagTypePassByValue, elements: !597, identifier: "_ZTS7__sFILE")
!597 = !{!598, !600, !601, !602, !603, !604, !609, !610, !612, !616, !620, !628, !632, !633, !636, !637, !639, !643, !644, !645}
!598 = !DIDerivedType(tag: DW_TAG_member, name: "_p", scope: !596, file: !595, line: 132, baseType: !599, size: 64)
!599 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!600 = !DIDerivedType(tag: DW_TAG_member, name: "_r", scope: !596, file: !595, line: 133, baseType: !7, size: 32, offset: 64)
!601 = !DIDerivedType(tag: DW_TAG_member, name: "_w", scope: !596, file: !595, line: 134, baseType: !7, size: 32, offset: 96)
!602 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !596, file: !595, line: 135, baseType: !20, size: 16, offset: 128)
!603 = !DIDerivedType(tag: DW_TAG_member, name: "_file", scope: !596, file: !595, line: 136, baseType: !20, size: 16, offset: 144)
!604 = !DIDerivedType(tag: DW_TAG_member, name: "_bf", scope: !596, file: !595, line: 137, baseType: !605, size: 128, offset: 192)
!605 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sbuf", file: !595, line: 97, size: 128, flags: DIFlagTypePassByValue, elements: !606, identifier: "_ZTS6__sbuf")
!606 = !{!607, !608}
!607 = !DIDerivedType(tag: DW_TAG_member, name: "_base", scope: !605, file: !595, line: 98, baseType: !599, size: 64)
!608 = !DIDerivedType(tag: DW_TAG_member, name: "_size", scope: !605, file: !595, line: 99, baseType: !7, size: 32, offset: 64)
!609 = !DIDerivedType(tag: DW_TAG_member, name: "_lbfsize", scope: !596, file: !595, line: 138, baseType: !7, size: 32, offset: 320)
!610 = !DIDerivedType(tag: DW_TAG_member, name: "_cookie", scope: !596, file: !595, line: 141, baseType: !611, size: 64, offset: 384)
!611 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!612 = !DIDerivedType(tag: DW_TAG_member, name: "_close", scope: !596, file: !595, line: 142, baseType: !613, size: 64, offset: 448)
!613 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !614, size: 64)
!614 = !DISubroutineType(types: !615)
!615 = !{!7, !611}
!616 = !DIDerivedType(tag: DW_TAG_member, name: "_read", scope: !596, file: !595, line: 143, baseType: !617, size: 64, offset: 512)
!617 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !618, size: 64)
!618 = !DISubroutineType(types: !619)
!619 = !{!7, !611, !21, !7}
!620 = !DIDerivedType(tag: DW_TAG_member, name: "_seek", scope: !596, file: !595, line: 144, baseType: !621, size: 64, offset: 576)
!621 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !622, size: 64)
!622 = !DISubroutineType(types: !623)
!623 = !{!624, !611, !624, !7}
!624 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !595, line: 86, baseType: !625)
!625 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_off_t", file: !626, line: 83, baseType: !627)
!626 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "af82ff6119a9fa80fad635d276556d46")
!627 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !449, line: 37, baseType: !25)
!628 = !DIDerivedType(tag: DW_TAG_member, name: "_write", scope: !596, file: !595, line: 145, baseType: !629, size: 64, offset: 640)
!629 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !630, size: 64)
!630 = !DISubroutineType(types: !631)
!631 = !{!7, !611, !549, !7}
!632 = !DIDerivedType(tag: DW_TAG_member, name: "_ub", scope: !596, file: !595, line: 148, baseType: !605, size: 128, offset: 704)
!633 = !DIDerivedType(tag: DW_TAG_member, name: "_extra", scope: !596, file: !595, line: 149, baseType: !634, size: 64, offset: 832)
!634 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !635, size: 64)
!635 = !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILEX", file: !595, line: 103, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS8__sFILEX")
!636 = !DIDerivedType(tag: DW_TAG_member, name: "_ur", scope: !596, file: !595, line: 150, baseType: !7, size: 32, offset: 896)
!637 = !DIDerivedType(tag: DW_TAG_member, name: "_ubuf", scope: !596, file: !595, line: 153, baseType: !638, size: 24, offset: 928)
!638 = !DICompositeType(tag: DW_TAG_array_type, baseType: !19, size: 24, elements: !189)
!639 = !DIDerivedType(tag: DW_TAG_member, name: "_nbuf", scope: !596, file: !595, line: 154, baseType: !640, size: 8, offset: 952)
!640 = !DICompositeType(tag: DW_TAG_array_type, baseType: !19, size: 8, elements: !641)
!641 = !{!642}
!642 = !DISubrange(count: 1)
!643 = !DIDerivedType(tag: DW_TAG_member, name: "_lb", scope: !596, file: !595, line: 157, baseType: !605, size: 128, offset: 960)
!644 = !DIDerivedType(tag: DW_TAG_member, name: "_blksize", scope: !596, file: !595, line: 160, baseType: !7, size: 32, offset: 1088)
!645 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !596, file: !595, line: 161, baseType: !624, size: 64, offset: 1152)
!646 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !647, file: !576, line: 137)
!647 = !DISubprogram(name: "fwprintf", scope: !648, file: !648, line: 107, type: !649, flags: DIFlagPrototyped, spFlags: 0)
!648 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "c0db33314388059ce7a1663adf1bfda0")
!649 = !DISubroutineType(types: !650)
!650 = !{!7, !651, !652, null}
!651 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !594, size: 64)
!652 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !653, size: 64)
!653 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !654)
!654 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!655 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !656, file: !576, line: 138)
!656 = !DISubprogram(name: "fwscanf", scope: !648, file: !648, line: 108, type: !649, flags: DIFlagPrototyped, spFlags: 0)
!657 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !658, file: !576, line: 139)
!658 = !DISubprogram(name: "swprintf", scope: !648, file: !648, line: 120, type: !659, flags: DIFlagPrototyped, spFlags: 0)
!659 = !DISubroutineType(types: !660)
!660 = !{!7, !661, !662, !652, null}
!661 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !654, size: 64)
!662 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !663, line: 50, baseType: !664)
!663 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "f7981334d28e0c246f35cd24042aa2a4")
!664 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !449, line: 87, baseType: !454)
!665 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !666, file: !576, line: 140)
!666 = !DISubprogram(name: "vfwprintf", scope: !648, file: !648, line: 124, type: !667, flags: DIFlagPrototyped, spFlags: 0)
!667 = !DISubroutineType(types: !668)
!668 = !{!7, !651, !652, !669}
!669 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_va_list", file: !449, line: 95, baseType: !670)
!670 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !29, baseType: !21)
!671 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !672, file: !576, line: 141)
!672 = !DISubprogram(name: "vswprintf", scope: !648, file: !648, line: 126, type: !673, flags: DIFlagPrototyped, spFlags: 0)
!673 = !DISubroutineType(types: !674)
!674 = !{!7, !661, !662, !652, !669}
!675 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !676, file: !576, line: 142)
!676 = !DISubprogram(name: "swscanf", scope: !648, file: !648, line: 122, type: !677, flags: DIFlagPrototyped, spFlags: 0)
!677 = !DISubroutineType(types: !678)
!678 = !{!7, !652, !652, null}
!679 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !680, file: !576, line: 143)
!680 = !DISubprogram(name: "vfwscanf", scope: !648, file: !648, line: 195, type: !667, flags: DIFlagPrototyped, spFlags: 0)
!681 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !682, file: !576, line: 144)
!682 = !DISubprogram(name: "vswscanf", scope: !648, file: !648, line: 197, type: !683, flags: DIFlagPrototyped, spFlags: 0)
!683 = !DISubroutineType(types: !684)
!684 = !{!7, !652, !652, !669}
!685 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !686, file: !576, line: 145)
!686 = !DISubprogram(name: "fgetwc", scope: !648, file: !648, line: 100, type: !687, flags: DIFlagPrototyped, spFlags: 0)
!687 = !DISubroutineType(types: !688)
!688 = !{!499, !651}
!689 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !690, file: !576, line: 146)
!690 = !DISubprogram(name: "fgetws", scope: !648, file: !648, line: 102, type: !691, flags: DIFlagPrototyped, spFlags: 0)
!691 = !DISubroutineType(types: !692)
!692 = !{!661, !661, !7, !651}
!693 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !694, file: !576, line: 147)
!694 = !DISubprogram(name: "fputwc", scope: !648, file: !648, line: 104, type: !695, flags: DIFlagPrototyped, spFlags: 0)
!695 = !DISubroutineType(types: !696)
!696 = !{!499, !654, !651}
!697 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !698, file: !576, line: 148)
!698 = !DISubprogram(name: "fputws", scope: !648, file: !648, line: 105, type: !699, flags: DIFlagPrototyped, spFlags: 0)
!699 = !DISubroutineType(types: !700)
!700 = !{!7, !652, !651}
!701 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !702, file: !576, line: 149)
!702 = !DISubprogram(name: "fwide", scope: !648, file: !648, line: 106, type: !703, flags: DIFlagPrototyped, spFlags: 0)
!703 = !DISubroutineType(types: !704)
!704 = !{!7, !651, !7}
!705 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !706, file: !576, line: 150)
!706 = !DISubprogram(name: "getwc", scope: !648, file: !648, line: 109, type: !687, flags: DIFlagPrototyped, spFlags: 0)
!707 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !708, file: !576, line: 151)
!708 = !DISubprogram(name: "putwc", scope: !648, file: !648, line: 118, type: !695, flags: DIFlagPrototyped, spFlags: 0)
!709 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !710, file: !576, line: 152)
!710 = !DISubprogram(name: "ungetwc", scope: !648, file: !648, line: 123, type: !711, flags: DIFlagPrototyped, spFlags: 0)
!711 = !DISubroutineType(types: !712)
!712 = !{!499, !499, !651}
!713 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !714, file: !576, line: 153)
!714 = !DISubprogram(name: "wcstod", scope: !648, file: !648, line: 160, type: !715, flags: DIFlagPrototyped, spFlags: 0)
!715 = !DISubroutineType(types: !716)
!716 = !{!717, !652, !718}
!717 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!718 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !661, size: 64)
!719 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !720, file: !576, line: 154)
!720 = !DISubprogram(name: "wcstof", scope: !648, file: !648, line: 200, type: !721, flags: DIFlagPrototyped, spFlags: 0)
!721 = !DISubroutineType(types: !722)
!722 = !{!723, !652, !718}
!723 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!724 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !725, file: !576, line: 155)
!725 = !DISubprogram(name: "wcstold", scope: !648, file: !648, line: 202, type: !726, flags: DIFlagPrototyped, spFlags: 0)
!726 = !DISubroutineType(types: !727)
!727 = !{!464, !652, !718}
!728 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !729, file: !576, line: 156)
!729 = !DISubprogram(name: "wcstol", scope: !648, file: !648, line: 164, type: !730, flags: DIFlagPrototyped, spFlags: 0)
!730 = !DISubroutineType(types: !731)
!731 = !{!450, !652, !718, !7}
!732 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !733, file: !576, line: 157)
!733 = !DISubprogram(name: "wcstoll", scope: !648, file: !648, line: 205, type: !734, flags: DIFlagPrototyped, spFlags: 0)
!734 = !DISubroutineType(types: !735)
!735 = !{!25, !652, !718, !7}
!736 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !737, file: !576, line: 158)
!737 = !DISubprogram(name: "wcstoul", scope: !648, file: !648, line: 167, type: !738, flags: DIFlagPrototyped, spFlags: 0)
!738 = !DISubroutineType(types: !739)
!739 = !{!454, !652, !718, !7}
!740 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !741, file: !576, line: 159)
!741 = !DISubprogram(name: "wcstoull", scope: !648, file: !648, line: 207, type: !742, flags: DIFlagPrototyped, spFlags: 0)
!742 = !DISubroutineType(types: !743)
!743 = !{!411, !652, !718, !7}
!744 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !745, file: !576, line: 160)
!745 = !DISubprogram(name: "wcscpy", scope: !648, file: !648, line: 134, type: !746, flags: DIFlagPrototyped, spFlags: 0)
!746 = !DISubroutineType(types: !747)
!747 = !{!661, !661, !652}
!748 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !749, file: !576, line: 161)
!749 = !DISubprogram(name: "wcsncpy", scope: !648, file: !648, line: 148, type: !750, flags: DIFlagPrototyped, spFlags: 0)
!750 = !DISubroutineType(types: !751)
!751 = !{!661, !661, !652, !662}
!752 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !753, file: !576, line: 162)
!753 = !DISubprogram(name: "wcscat", scope: !648, file: !648, line: 130, type: !746, flags: DIFlagPrototyped, spFlags: 0)
!754 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !755, file: !576, line: 163)
!755 = !DISubprogram(name: "wcsncat", scope: !648, file: !648, line: 142, type: !750, flags: DIFlagPrototyped, spFlags: 0)
!756 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !757, file: !576, line: 164)
!757 = !DISubprogram(name: "wcscmp", scope: !648, file: !648, line: 132, type: !758, flags: DIFlagPrototyped, spFlags: 0)
!758 = !DISubroutineType(types: !759)
!759 = !{!7, !652, !652}
!760 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !761, file: !576, line: 165)
!761 = !DISubprogram(name: "wcscoll", scope: !648, file: !648, line: 133, type: !758, flags: DIFlagPrototyped, spFlags: 0)
!762 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !763, file: !576, line: 166)
!763 = !DISubprogram(name: "wcsncmp", scope: !648, file: !648, line: 145, type: !764, flags: DIFlagPrototyped, spFlags: 0)
!764 = !DISubroutineType(types: !765)
!765 = !{!7, !652, !652, !662}
!766 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !767, file: !576, line: 167)
!767 = !DISubprogram(name: "wcsxfrm", scope: !648, file: !648, line: 157, type: !768, flags: DIFlagPrototyped, spFlags: 0)
!768 = !DISubroutineType(types: !769)
!769 = !{!662, !661, !652, !662}
!770 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !771, file: !576, line: 168)
!771 = !DISubprogram(name: "wcschr", linkageName: "_Z6wcschrB8ne200100Ua9enable_ifILb1EEPww", scope: !772, file: !772, line: 147, type: !773, flags: DIFlagPrototyped, spFlags: 0)
!772 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/wchar.h", directory: "")
!773 = !DISubroutineType(types: !774)
!774 = !{!661, !661, !654}
!775 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !776, file: !576, line: 169)
!776 = !DISubprogram(name: "wcspbrk", linkageName: "_Z7wcspbrkB8ne200100Ua9enable_ifILb1EEPwPKw", scope: !772, file: !772, line: 158, type: !746, flags: DIFlagPrototyped, spFlags: 0)
!777 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !778, file: !576, line: 170)
!778 = !DISubprogram(name: "wcsrchr", linkageName: "_Z7wcsrchrB8ne200100Ua9enable_ifILb1EEPww", scope: !772, file: !772, line: 168, type: !773, flags: DIFlagPrototyped, spFlags: 0)
!779 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !780, file: !576, line: 171)
!780 = !DISubprogram(name: "wcsstr", linkageName: "_Z6wcsstrB8ne200100Ua9enable_ifILb1EEPwPKw", scope: !772, file: !772, line: 179, type: !746, flags: DIFlagPrototyped, spFlags: 0)
!781 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !782, file: !576, line: 172)
!782 = !DISubprogram(name: "wmemchr", linkageName: "_Z7wmemchrB8ne200100Ua9enable_ifILb1EEPwwm", scope: !772, file: !772, line: 190, type: !783, flags: DIFlagPrototyped, spFlags: 0)
!783 = !DISubroutineType(types: !784)
!784 = !{!661, !661, !654, !662}
!785 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !786, file: !576, line: 173)
!786 = !DISubprogram(name: "wcscspn", scope: !648, file: !648, line: 136, type: !787, flags: DIFlagPrototyped, spFlags: 0)
!787 = !DISubroutineType(types: !788)
!788 = !{!662, !652, !652}
!789 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !790, file: !576, line: 174)
!790 = !DISubprogram(name: "wcslen", scope: !648, file: !648, line: 140, type: !791, flags: DIFlagPrototyped, spFlags: 0)
!791 = !DISubroutineType(types: !792)
!792 = !{!662, !652}
!793 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !794, file: !576, line: 175)
!794 = !DISubprogram(name: "wcsspn", scope: !648, file: !648, line: 155, type: !787, flags: DIFlagPrototyped, spFlags: 0)
!795 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !796, file: !576, line: 176)
!796 = !DISubprogram(name: "wcstok", scope: !648, file: !648, line: 162, type: !797, flags: DIFlagPrototyped, spFlags: 0)
!797 = !DISubroutineType(types: !798)
!798 = !{!661, !661, !652, !718}
!799 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !800, file: !576, line: 177)
!800 = !DISubprogram(name: "wmemcmp", scope: !648, file: !648, line: 170, type: !764, flags: DIFlagPrototyped, spFlags: 0)
!801 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !802, file: !576, line: 178)
!802 = !DISubprogram(name: "wmemcpy", scope: !648, file: !648, line: 173, type: !750, flags: DIFlagPrototyped, spFlags: 0)
!803 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !804, file: !576, line: 179)
!804 = !DISubprogram(name: "wmemmove", scope: !648, file: !648, line: 176, type: !750, flags: DIFlagPrototyped, spFlags: 0)
!805 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !806, file: !576, line: 180)
!806 = !DISubprogram(name: "wmemset", scope: !648, file: !648, line: 179, type: !783, flags: DIFlagPrototyped, spFlags: 0)
!807 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !808, file: !576, line: 181)
!808 = !DISubprogram(name: "wcsftime", linkageName: "\01_wcsftime", scope: !648, file: !648, line: 137, type: !809, flags: DIFlagPrototyped, spFlags: 0)
!809 = !DISubroutineType(types: !810)
!810 = !{!662, !661, !662, !652, !811}
!811 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !812, size: 64)
!812 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !578)
!813 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !814, file: !576, line: 182)
!814 = !DISubprogram(name: "btowc", scope: !648, file: !648, line: 99, type: !815, flags: DIFlagPrototyped, spFlags: 0)
!815 = !DISubroutineType(types: !816)
!816 = !{!499, !7}
!817 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !818, file: !576, line: 183)
!818 = !DISubprogram(name: "wctob", scope: !648, file: !648, line: 159, type: !516, flags: DIFlagPrototyped, spFlags: 0)
!819 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !820, file: !576, line: 184)
!820 = !DISubprogram(name: "mbsinit", scope: !648, file: !648, line: 115, type: !821, flags: DIFlagPrototyped, spFlags: 0)
!821 = !DISubroutineType(types: !822)
!822 = !{!7, !823}
!823 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !824, size: 64)
!824 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !565)
!825 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !826, file: !576, line: 185)
!826 = !DISubprogram(name: "mbrlen", scope: !648, file: !648, line: 111, type: !827, flags: DIFlagPrototyped, spFlags: 0)
!827 = !DISubroutineType(types: !828)
!828 = !{!662, !549, !662, !829}
!829 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !565, size: 64)
!830 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !831, file: !576, line: 186)
!831 = !DISubprogram(name: "mbrtowc", scope: !648, file: !648, line: 113, type: !832, flags: DIFlagPrototyped, spFlags: 0)
!832 = !DISubroutineType(types: !833)
!833 = !{!662, !661, !549, !662, !829}
!834 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !835, file: !576, line: 187)
!835 = !DISubprogram(name: "wcrtomb", scope: !648, file: !648, line: 129, type: !836, flags: DIFlagPrototyped, spFlags: 0)
!836 = !DISubroutineType(types: !837)
!837 = !{!662, !21, !654, !829}
!838 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !839, file: !576, line: 188)
!839 = !DISubprogram(name: "mbsrtowcs", scope: !648, file: !648, line: 116, type: !840, flags: DIFlagPrototyped, spFlags: 0)
!840 = !DISubroutineType(types: !841)
!841 = !{!662, !661, !842, !662, !829}
!842 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !549, size: 64)
!843 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !844, file: !576, line: 189)
!844 = !DISubprogram(name: "wcsrtombs", scope: !648, file: !648, line: 153, type: !845, flags: DIFlagPrototyped, spFlags: 0)
!845 = !DISubroutineType(types: !846)
!846 = !{!662, !21, !847, !662, !829}
!847 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !652, size: 64)
!848 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !849, file: !576, line: 191)
!849 = !DISubprogram(name: "getwchar", scope: !648, file: !648, line: 110, type: !850, flags: DIFlagPrototyped, spFlags: 0)
!850 = !DISubroutineType(types: !851)
!851 = !{!499}
!852 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !853, file: !576, line: 192)
!853 = !DISubprogram(name: "vwscanf", scope: !648, file: !648, line: 199, type: !854, flags: DIFlagPrototyped, spFlags: 0)
!854 = !DISubroutineType(types: !855)
!855 = !{!7, !652, !669}
!856 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !857, file: !576, line: 193)
!857 = !DISubprogram(name: "wscanf", scope: !648, file: !648, line: 181, type: !858, flags: DIFlagPrototyped, spFlags: 0)
!858 = !DISubroutineType(types: !859)
!859 = !{!7, !652, null}
!860 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !861, file: !576, line: 195)
!861 = !DISubprogram(name: "putwchar", scope: !648, file: !648, line: 119, type: !862, flags: DIFlagPrototyped, spFlags: 0)
!862 = !DISubroutineType(types: !863)
!863 = !{!499, !654}
!864 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !865, file: !576, line: 196)
!865 = !DISubprogram(name: "vwprintf", scope: !648, file: !648, line: 128, type: !854, flags: DIFlagPrototyped, spFlags: 0)
!866 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !867, file: !576, line: 197)
!867 = !DISubprogram(name: "wprintf", scope: !648, file: !648, line: 180, type: !858, flags: DIFlagPrototyped, spFlags: 0)
!868 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !869, file: !875, line: 106)
!869 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !870, line: 105, baseType: !871)
!870 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "17a3e5580239ce2f2af260c9c943ad9b")
!871 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !870, line: 102, size: 64, flags: DIFlagTypePassByValue, elements: !872, identifier: "_ZTS5div_t")
!872 = !{!873, !874}
!873 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !871, file: !870, line: 103, baseType: !7, size: 32)
!874 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !871, file: !870, line: 104, baseType: !7, size: 32, offset: 32)
!875 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdlib", directory: "")
!876 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !877, file: !875, line: 107)
!877 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !870, line: 110, baseType: !878)
!878 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !870, line: 107, size: 128, flags: DIFlagTypePassByValue, elements: !879, identifier: "_ZTS6ldiv_t")
!879 = !{!880, !881}
!880 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !878, file: !870, line: 108, baseType: !450, size: 64)
!881 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !878, file: !870, line: 109, baseType: !450, size: 64, offset: 64)
!882 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !883, file: !875, line: 108)
!883 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !870, line: 116, baseType: !884)
!884 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !870, line: 113, size: 128, flags: DIFlagTypePassByValue, elements: !885, identifier: "_ZTS7lldiv_t")
!885 = !{!886, !887}
!886 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !884, file: !870, line: 114, baseType: !25, size: 64)
!887 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !884, file: !870, line: 115, baseType: !25, size: 64, offset: 64)
!888 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !889, file: !875, line: 109)
!889 = !DISubprogram(name: "atof", scope: !870, file: !870, line: 149, type: !890, flags: DIFlagPrototyped, spFlags: 0)
!890 = !DISubroutineType(types: !891)
!891 = !{!717, !549}
!892 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !893, file: !875, line: 110)
!893 = !DISubprogram(name: "atoi", scope: !870, file: !870, line: 150, type: !894, flags: DIFlagPrototyped, spFlags: 0)
!894 = !DISubroutineType(types: !895)
!895 = !{!7, !549}
!896 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !897, file: !875, line: 111)
!897 = !DISubprogram(name: "atol", scope: !870, file: !870, line: 151, type: !898, flags: DIFlagPrototyped, spFlags: 0)
!898 = !DISubroutineType(types: !899)
!899 = !{!450, !549}
!900 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !901, file: !875, line: 112)
!901 = !DISubprogram(name: "atoll", scope: !870, file: !870, line: 154, type: !902, flags: DIFlagPrototyped, spFlags: 0)
!902 = !DISubroutineType(types: !903)
!903 = !{!25, !549}
!904 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !905, file: !875, line: 113)
!905 = !DISubprogram(name: "strtod", linkageName: "\01_strtod", scope: !870, file: !870, line: 184, type: !906, flags: DIFlagPrototyped, spFlags: 0)
!906 = !DISubroutineType(types: !907)
!907 = !{!717, !549, !908}
!908 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!909 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !910, file: !875, line: 114)
!910 = !DISubprogram(name: "strtof", linkageName: "\01_strtof", scope: !870, file: !870, line: 185, type: !911, flags: DIFlagPrototyped, spFlags: 0)
!911 = !DISubroutineType(types: !912)
!912 = !{!723, !549, !908}
!913 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !914, file: !875, line: 115)
!914 = !DISubprogram(name: "strtold", scope: !870, file: !870, line: 188, type: !915, flags: DIFlagPrototyped, spFlags: 0)
!915 = !DISubroutineType(types: !916)
!916 = !{!464, !549, !908}
!917 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !918, file: !875, line: 116)
!918 = !DISubprogram(name: "strtol", scope: !870, file: !870, line: 186, type: !919, flags: DIFlagPrototyped, spFlags: 0)
!919 = !DISubroutineType(types: !920)
!920 = !{!450, !549, !908, !7}
!921 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !922, file: !875, line: 117)
!922 = !DISubprogram(name: "strtoll", scope: !870, file: !870, line: 191, type: !923, flags: DIFlagPrototyped, spFlags: 0)
!923 = !DISubroutineType(types: !924)
!924 = !{!25, !549, !908, !7}
!925 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !926, file: !875, line: 118)
!926 = !DISubprogram(name: "strtoul", scope: !870, file: !870, line: 194, type: !927, flags: DIFlagPrototyped, spFlags: 0)
!927 = !DISubroutineType(types: !928)
!928 = !{!454, !549, !908, !7}
!929 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !930, file: !875, line: 119)
!930 = !DISubprogram(name: "strtoull", scope: !870, file: !870, line: 197, type: !931, flags: DIFlagPrototyped, spFlags: 0)
!931 = !DISubroutineType(types: !932)
!932 = !{!411, !549, !908, !7}
!933 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !934, file: !875, line: 120)
!934 = !DISubprogram(name: "rand", scope: !870, file: !870, line: 181, type: !935, flags: DIFlagPrototyped, spFlags: 0)
!935 = !DISubroutineType(types: !936)
!936 = !{!7}
!937 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !938, file: !875, line: 121)
!938 = !DISubprogram(name: "srand", scope: !870, file: !870, line: 183, type: !939, flags: DIFlagPrototyped, spFlags: 0)
!939 = !DISubroutineType(types: !940)
!940 = !{null, !69}
!941 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !942, file: !875, line: 122)
!942 = !DISubprogram(name: "calloc", scope: !943, file: !943, line: 55, type: !944, flags: DIFlagPrototyped, spFlags: 0)
!943 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/malloc/_malloc.h", directory: "", checksumkind: CSK_MD5, checksum: "169c9ed8662627a4a4d92e321cfa866c")
!944 = !DISubroutineType(types: !945)
!945 = !{!611, !662, !662}
!946 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !947, file: !875, line: 123)
!947 = !DISubprogram(name: "free", scope: !943, file: !943, line: 56, type: !948, flags: DIFlagPrototyped, spFlags: 0)
!948 = !DISubroutineType(types: !949)
!949 = !{null, !611}
!950 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !951, file: !875, line: 124)
!951 = !DISubprogram(name: "malloc", scope: !943, file: !943, line: 54, type: !952, flags: DIFlagPrototyped, spFlags: 0)
!952 = !DISubroutineType(types: !953)
!953 = !{!611, !662}
!954 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !955, file: !875, line: 125)
!955 = !DISubprogram(name: "realloc", scope: !943, file: !943, line: 57, type: !956, flags: DIFlagPrototyped, spFlags: 0)
!956 = !DISubroutineType(types: !957)
!957 = !{!611, !611, !662}
!958 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !959, file: !875, line: 126)
!959 = !DISubprogram(name: "abort", scope: !960, file: !960, line: 33, type: !961, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!960 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_abort.h", directory: "", checksumkind: CSK_MD5, checksum: "b8994a53d49770cf67adab87821b3fcb")
!961 = !DISubroutineType(types: !962)
!962 = !{null}
!963 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !964, file: !875, line: 127)
!964 = !DISubprogram(name: "atexit", scope: !870, file: !870, line: 144, type: !965, flags: DIFlagPrototyped, spFlags: 0)
!965 = !DISubroutineType(types: !966)
!966 = !{!7, !967}
!967 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !961, size: 64)
!968 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !969, file: !875, line: 128)
!969 = !DISubprogram(name: "exit", scope: !870, file: !870, line: 160, type: !970, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!970 = !DISubroutineType(types: !971)
!971 = !{null, !7}
!972 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !973, file: !875, line: 129)
!973 = !DISubprogram(name: "_Exit", scope: !870, file: !870, line: 210, type: !970, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!974 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !975, file: !875, line: 130)
!975 = !DISubprogram(name: "getenv", scope: !870, file: !870, line: 162, type: !976, flags: DIFlagPrototyped, spFlags: 0)
!976 = !DISubroutineType(types: !977)
!977 = !{!21, !549}
!978 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !979, file: !875, line: 131)
!979 = !DISubprogram(name: "system", linkageName: "\01_system", scope: !870, file: !870, line: 203, type: !894, flags: DIFlagPrototyped, spFlags: 0)
!980 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !981, file: !875, line: 132)
!981 = !DISubprogram(name: "bsearch", scope: !870, file: !870, line: 156, type: !982, flags: DIFlagPrototyped, spFlags: 0)
!982 = !DISubroutineType(types: !983)
!983 = !{!611, !984, !984, !662, !662, !986}
!984 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !985, size: 64)
!985 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!986 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !987, size: 64)
!987 = !DISubroutineType(types: !988)
!988 = !{!7, !984, !984}
!989 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !990, file: !875, line: 133)
!990 = !DISubprogram(name: "qsort", scope: !870, file: !870, line: 175, type: !991, flags: DIFlagPrototyped, spFlags: 0)
!991 = !DISubroutineType(types: !992)
!992 = !{null, !611, !662, !662, !986}
!993 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !994, file: !875, line: 134)
!994 = !DISubprogram(name: "abs", linkageName: "_Z3absB8ne200100e", scope: !995, file: !995, line: 123, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!995 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/stdlib.h", directory: "")
!996 = !DISubroutineType(types: !997)
!997 = !{!464, !464}
!998 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !999, file: !875, line: 135)
!999 = !DISubprogram(name: "labs", scope: !870, file: !870, line: 163, type: !1000, flags: DIFlagPrototyped, spFlags: 0)
!1000 = !DISubroutineType(types: !1001)
!1001 = !{!450, !450}
!1002 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1003, file: !875, line: 136)
!1003 = !DISubprogram(name: "llabs", scope: !870, file: !870, line: 167, type: !1004, flags: DIFlagPrototyped, spFlags: 0)
!1004 = !DISubroutineType(types: !1005)
!1005 = !{!25, !25}
!1006 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1007, file: !875, line: 137)
!1007 = !DISubprogram(name: "div", linkageName: "_Z3divB8ne200100xx", scope: !995, file: !995, line: 143, type: !1008, flags: DIFlagPrototyped, spFlags: 0)
!1008 = !DISubroutineType(types: !1009)
!1009 = !{!883, !25, !25}
!1010 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1011, file: !875, line: 138)
!1011 = !DISubprogram(name: "ldiv", scope: !870, file: !870, line: 164, type: !1012, flags: DIFlagPrototyped, spFlags: 0)
!1012 = !DISubroutineType(types: !1013)
!1013 = !{!877, !450, !450}
!1014 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1015, file: !875, line: 139)
!1015 = !DISubprogram(name: "lldiv", scope: !870, file: !870, line: 168, type: !1008, flags: DIFlagPrototyped, spFlags: 0)
!1016 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1017, file: !875, line: 140)
!1017 = !DISubprogram(name: "mblen", scope: !870, file: !870, line: 171, type: !1018, flags: DIFlagPrototyped, spFlags: 0)
!1018 = !DISubroutineType(types: !1019)
!1019 = !{!7, !549, !662}
!1020 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1021, file: !875, line: 142)
!1021 = !DISubprogram(name: "mbtowc", scope: !870, file: !870, line: 173, type: !1022, flags: DIFlagPrototyped, spFlags: 0)
!1022 = !DISubroutineType(types: !1023)
!1023 = !{!7, !661, !549, !662}
!1024 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1025, file: !875, line: 143)
!1025 = !DISubprogram(name: "wctomb", scope: !870, file: !870, line: 207, type: !1026, flags: DIFlagPrototyped, spFlags: 0)
!1026 = !DISubroutineType(types: !1027)
!1027 = !{!7, !21, !654}
!1028 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1029, file: !875, line: 144)
!1029 = !DISubprogram(name: "mbstowcs", scope: !870, file: !870, line: 172, type: !1030, flags: DIFlagPrototyped, spFlags: 0)
!1030 = !DISubroutineType(types: !1031)
!1031 = !{!662, !661, !549, !662}
!1032 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1033, file: !875, line: 145)
!1033 = !DISubprogram(name: "wcstombs", scope: !870, file: !870, line: 206, type: !1034, flags: DIFlagPrototyped, spFlags: 0)
!1034 = !DISubroutineType(types: !1035)
!1035 = !{!662, !21, !652, !662}
!1036 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1037, file: !875, line: 148)
!1037 = !DISubprogram(name: "at_quick_exit", scope: !870, file: !870, line: 147, type: !965, flags: DIFlagPrototyped, spFlags: 0)
!1038 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1039, file: !875, line: 149)
!1039 = !DISubprogram(name: "quick_exit", scope: !870, file: !870, line: 179, type: !970, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1040 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !565, file: !1041, line: 25)
!1041 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__std_mbstate_t.h", directory: "")
!1042 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1043, file: !1049, line: 422)
!1043 = !DISubprogram(name: "isfinite", linkageName: "_ZNSt3__16__math8isfiniteB8ne200100Ee", scope: !1045, file: !1044, line: 79, type: !1046, flags: DIFlagPrototyped, spFlags: 0)
!1044 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__math/traits.h", directory: "")
!1045 = !DINamespace(name: "__math", scope: !397)
!1046 = !DISubroutineType(types: !1047)
!1047 = !{!1048, !464}
!1048 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!1049 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/math.h", directory: "")
!1050 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1051, file: !1049, line: 425)
!1051 = !DISubprogram(name: "isinf", linkageName: "_ZNSt3__16__math5isinfB8ne200100Ee", scope: !1045, file: !1044, line: 103, type: !1046, flags: DIFlagPrototyped, spFlags: 0)
!1052 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1053, file: !1049, line: 429)
!1053 = !DISubprogram(name: "isnan", linkageName: "_ZNSt3__16__math5isnanB8ne200100Ee", scope: !1045, file: !1044, line: 127, type: !1046, flags: DIFlagPrototyped, spFlags: 0)
!1054 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1055, file: !1049, line: 430)
!1055 = !DISubprogram(name: "isnormal", linkageName: "_ZNSt3__16__math8isnormalB8ne200100Ee", scope: !1045, file: !1044, line: 146, type: !1046, flags: DIFlagPrototyped, spFlags: 0)
!1056 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1057, file: !1049, line: 485)
!1057 = !DISubprogram(name: "modf", linkageName: "_ZNSt3__16__math4modfB8ne200100EePe", scope: !1045, file: !1058, line: 55, type: !1059, flags: DIFlagPrototyped, spFlags: 0)
!1058 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__math/modulo.h", directory: "")
!1059 = !DISubroutineType(types: !1060)
!1060 = !{!464, !464, !1061}
!1061 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !464, size: 64)
!1062 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1043, file: !1063, line: 352)
!1063 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cmath", directory: "")
!1064 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1051, file: !1063, line: 353)
!1065 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1053, file: !1063, line: 354)
!1066 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1055, file: !1063, line: 355)
!1067 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1068, file: !1063, line: 364)
!1068 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !1069, line: 50, baseType: !723)
!1069 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/math.h", directory: "", checksumkind: CSK_MD5, checksum: "35b1ff63542c2c0c144330dd9277d2dc")
!1070 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1071, file: !1063, line: 365)
!1071 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !1069, line: 51, baseType: !717)
!1072 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !994, file: !1063, line: 367)
!1073 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1074, file: !1063, line: 370)
!1074 = !DISubprogram(name: "acosf", scope: !1069, file: !1069, line: 314, type: !1075, flags: DIFlagPrototyped, spFlags: 0)
!1075 = !DISubroutineType(types: !1076)
!1076 = !{!723, !723}
!1077 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1078, file: !1063, line: 372)
!1078 = !DISubprogram(name: "asinf", scope: !1069, file: !1069, line: 318, type: !1075, flags: DIFlagPrototyped, spFlags: 0)
!1079 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1080, file: !1063, line: 374)
!1080 = !DISubprogram(name: "atanf", scope: !1069, file: !1069, line: 322, type: !1075, flags: DIFlagPrototyped, spFlags: 0)
!1081 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1082, file: !1063, line: 376)
!1082 = !DISubprogram(name: "atan2f", scope: !1069, file: !1069, line: 326, type: !1083, flags: DIFlagPrototyped, spFlags: 0)
!1083 = !DISubroutineType(types: !1084)
!1084 = !{!723, !723, !723}
!1085 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1086, file: !1063, line: 378)
!1086 = !DISubprogram(name: "ceilf", scope: !1069, file: !1069, line: 461, type: !1075, flags: DIFlagPrototyped, spFlags: 0)
!1087 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1088, file: !1063, line: 380)
!1088 = !DISubprogram(name: "cosf", scope: !1069, file: !1069, line: 330, type: !1075, flags: DIFlagPrototyped, spFlags: 0)
!1089 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1090, file: !1063, line: 382)
!1090 = !DISubprogram(name: "coshf", scope: !1069, file: !1069, line: 354, type: !1075, flags: DIFlagPrototyped, spFlags: 0)
!1091 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1092, file: !1063, line: 385)
!1092 = !DISubprogram(name: "expf", scope: !1069, file: !1069, line: 366, type: !1075, flags: DIFlagPrototyped, spFlags: 0)
!1093 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1094, file: !1063, line: 388)
!1094 = !DISubprogram(name: "fabsf", scope: !1069, file: !1069, line: 422, type: !1075, flags: DIFlagPrototyped, spFlags: 0)
!1095 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1096, file: !1063, line: 390)
!1096 = !DISubprogram(name: "floorf", scope: !1069, file: !1069, line: 465, type: !1075, flags: DIFlagPrototyped, spFlags: 0)
!1097 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1098, file: !1063, line: 393)
!1098 = !DISubprogram(name: "fmodf", scope: !1069, file: !1069, line: 505, type: !1083, flags: DIFlagPrototyped, spFlags: 0)
!1099 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1100, file: !1063, line: 396)
!1100 = !DISubprogram(name: "frexpf", scope: !1069, file: !1069, line: 406, type: !1101, flags: DIFlagPrototyped, spFlags: 0)
!1101 = !DISubroutineType(types: !1102)
!1102 = !{!723, !723, !1103}
!1103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!1104 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1105, file: !1063, line: 398)
!1105 = !DISubprogram(name: "ldexpf", scope: !1069, file: !1069, line: 402, type: !1106, flags: DIFlagPrototyped, spFlags: 0)
!1106 = !DISubroutineType(types: !1107)
!1107 = !{!723, !723, !7}
!1108 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1109, file: !1063, line: 401)
!1109 = !DISubprogram(name: "logf", scope: !1069, file: !1069, line: 378, type: !1075, flags: DIFlagPrototyped, spFlags: 0)
!1110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1111, file: !1063, line: 404)
!1111 = !DISubprogram(name: "log10f", scope: !1069, file: !1069, line: 382, type: !1075, flags: DIFlagPrototyped, spFlags: 0)
!1112 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1057, file: !1063, line: 405)
!1113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1114, file: !1063, line: 406)
!1114 = !DISubprogram(name: "modff", scope: !1069, file: !1069, line: 398, type: !1115, flags: DIFlagPrototyped, spFlags: 0)
!1115 = !DISubroutineType(types: !1116)
!1116 = !{!723, !723, !1117}
!1117 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !723, size: 64)
!1118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1119, file: !1063, line: 409)
!1119 = !DISubprogram(name: "powf", scope: !1069, file: !1069, line: 434, type: !1083, flags: DIFlagPrototyped, spFlags: 0)
!1120 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1121, file: !1063, line: 412)
!1121 = !DISubprogram(name: "sinf", scope: !1069, file: !1069, line: 334, type: !1075, flags: DIFlagPrototyped, spFlags: 0)
!1122 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1123, file: !1063, line: 414)
!1123 = !DISubprogram(name: "sinhf", scope: !1069, file: !1069, line: 358, type: !1075, flags: DIFlagPrototyped, spFlags: 0)
!1124 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1125, file: !1063, line: 417)
!1125 = !DISubprogram(name: "sqrtf", scope: !1069, file: !1069, line: 438, type: !1075, flags: DIFlagPrototyped, spFlags: 0)
!1126 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1127, file: !1063, line: 419)
!1127 = !DISubprogram(name: "tanf", scope: !1069, file: !1069, line: 338, type: !1075, flags: DIFlagPrototyped, spFlags: 0)
!1128 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1129, file: !1063, line: 422)
!1129 = !DISubprogram(name: "tanhf", scope: !1069, file: !1069, line: 362, type: !1075, flags: DIFlagPrototyped, spFlags: 0)
!1130 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1131, file: !1063, line: 425)
!1131 = !DISubprogram(name: "acoshf", scope: !1069, file: !1069, line: 342, type: !1075, flags: DIFlagPrototyped, spFlags: 0)
!1132 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1133, file: !1063, line: 427)
!1133 = !DISubprogram(name: "asinhf", scope: !1069, file: !1069, line: 346, type: !1075, flags: DIFlagPrototyped, spFlags: 0)
!1134 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1135, file: !1063, line: 429)
!1135 = !DISubprogram(name: "atanhf", scope: !1069, file: !1069, line: 350, type: !1075, flags: DIFlagPrototyped, spFlags: 0)
!1136 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1137, file: !1063, line: 431)
!1137 = !DISubprogram(name: "cbrtf", scope: !1069, file: !1069, line: 426, type: !1075, flags: DIFlagPrototyped, spFlags: 0)
!1138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1139, file: !1063, line: 434)
!1139 = !DISubprogram(name: "copysignf", scope: !1069, file: !1069, line: 517, type: !1083, flags: DIFlagPrototyped, spFlags: 0)
!1140 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1141, file: !1063, line: 437)
!1141 = !DISubprogram(name: "erff", scope: !1069, file: !1069, line: 442, type: !1075, flags: DIFlagPrototyped, spFlags: 0)
!1142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1143, file: !1063, line: 439)
!1143 = !DISubprogram(name: "erfcf", scope: !1069, file: !1069, line: 446, type: !1075, flags: DIFlagPrototyped, spFlags: 0)
!1144 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1145, file: !1063, line: 441)
!1145 = !DISubprogram(name: "exp2f", scope: !1069, file: !1069, line: 370, type: !1075, flags: DIFlagPrototyped, spFlags: 0)
!1146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1147, file: !1063, line: 443)
!1147 = !DISubprogram(name: "expm1f", scope: !1069, file: !1069, line: 374, type: !1075, flags: DIFlagPrototyped, spFlags: 0)
!1148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1149, file: !1063, line: 445)
!1149 = !DISubprogram(name: "fdimf", scope: !1069, file: !1069, line: 533, type: !1083, flags: DIFlagPrototyped, spFlags: 0)
!1150 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1151, file: !1063, line: 446)
!1151 = !DISubprogram(name: "fmaf", scope: !1069, file: !1069, line: 545, type: !1152, flags: DIFlagPrototyped, spFlags: 0)
!1152 = !DISubroutineType(types: !1153)
!1153 = !{!723, !723, !723, !723}
!1154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1155, file: !1063, line: 449)
!1155 = !DISubprogram(name: "fmaxf", scope: !1069, file: !1069, line: 537, type: !1083, flags: DIFlagPrototyped, spFlags: 0)
!1156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1157, file: !1063, line: 451)
!1157 = !DISubprogram(name: "fminf", scope: !1069, file: !1069, line: 541, type: !1083, flags: DIFlagPrototyped, spFlags: 0)
!1158 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1159, file: !1063, line: 453)
!1159 = !DISubprogram(name: "hypotf", scope: !1069, file: !1069, line: 430, type: !1083, flags: DIFlagPrototyped, spFlags: 0)
!1160 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1161, file: !1063, line: 455)
!1161 = !DISubprogram(name: "ilogbf", scope: !1069, file: !1069, line: 410, type: !1162, flags: DIFlagPrototyped, spFlags: 0)
!1162 = !DISubroutineType(types: !1163)
!1163 = !{!7, !723}
!1164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1165, file: !1063, line: 457)
!1165 = !DISubprogram(name: "lgammaf", scope: !1069, file: !1069, line: 453, type: !1075, flags: DIFlagPrototyped, spFlags: 0)
!1166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1167, file: !1063, line: 459)
!1167 = !DISubprogram(name: "llrintf", scope: !1069, file: !1069, line: 492, type: !1168, flags: DIFlagPrototyped, spFlags: 0)
!1168 = !DISubroutineType(types: !1169)
!1169 = !{!25, !723}
!1170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1171, file: !1063, line: 461)
!1171 = !DISubprogram(name: "llroundf", scope: !1069, file: !1069, line: 496, type: !1168, flags: DIFlagPrototyped, spFlags: 0)
!1172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1173, file: !1063, line: 463)
!1173 = !DISubprogram(name: "log1pf", scope: !1069, file: !1069, line: 390, type: !1075, flags: DIFlagPrototyped, spFlags: 0)
!1174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1175, file: !1063, line: 465)
!1175 = !DISubprogram(name: "log2f", scope: !1069, file: !1069, line: 386, type: !1075, flags: DIFlagPrototyped, spFlags: 0)
!1176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1177, file: !1063, line: 467)
!1177 = !DISubprogram(name: "logbf", scope: !1069, file: !1069, line: 394, type: !1075, flags: DIFlagPrototyped, spFlags: 0)
!1178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1179, file: !1063, line: 469)
!1179 = !DISubprogram(name: "lrintf", scope: !1069, file: !1069, line: 477, type: !1180, flags: DIFlagPrototyped, spFlags: 0)
!1180 = !DISubroutineType(types: !1181)
!1181 = !{!450, !723}
!1182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1183, file: !1063, line: 471)
!1183 = !DISubprogram(name: "lroundf", scope: !1069, file: !1069, line: 485, type: !1180, flags: DIFlagPrototyped, spFlags: 0)
!1184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1185, file: !1063, line: 473)
!1185 = !DISubprogram(name: "nan", scope: !1069, file: !1069, line: 522, type: !890, flags: DIFlagPrototyped, spFlags: 0)
!1186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1187, file: !1063, line: 474)
!1187 = !DISubprogram(name: "nanf", scope: !1069, file: !1069, line: 521, type: !1188, flags: DIFlagPrototyped, spFlags: 0)
!1188 = !DISubroutineType(types: !1189)
!1189 = !{!723, !549}
!1190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1191, file: !1063, line: 477)
!1191 = !DISubprogram(name: "nearbyintf", scope: !1069, file: !1069, line: 469, type: !1075, flags: DIFlagPrototyped, spFlags: 0)
!1192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1193, file: !1063, line: 479)
!1193 = !DISubprogram(name: "nextafterf", scope: !1069, file: !1069, line: 525, type: !1083, flags: DIFlagPrototyped, spFlags: 0)
!1194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1195, file: !1063, line: 481)
!1195 = !DISubprogram(name: "nexttowardf", scope: !1069, file: !1069, line: 530, type: !1196, flags: DIFlagPrototyped, spFlags: 0)
!1196 = !DISubroutineType(types: !1197)
!1197 = !{!723, !723, !464}
!1198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1199, file: !1063, line: 483)
!1199 = !DISubprogram(name: "remainderf", scope: !1069, file: !1069, line: 509, type: !1083, flags: DIFlagPrototyped, spFlags: 0)
!1200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1201, file: !1063, line: 485)
!1201 = !DISubprogram(name: "remquof", scope: !1069, file: !1069, line: 513, type: !1202, flags: DIFlagPrototyped, spFlags: 0)
!1202 = !DISubroutineType(types: !1203)
!1203 = !{!723, !723, !723, !1103}
!1204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1205, file: !1063, line: 487)
!1205 = !DISubprogram(name: "rintf", scope: !1069, file: !1069, line: 473, type: !1075, flags: DIFlagPrototyped, spFlags: 0)
!1206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1207, file: !1063, line: 489)
!1207 = !DISubprogram(name: "roundf", scope: !1069, file: !1069, line: 481, type: !1075, flags: DIFlagPrototyped, spFlags: 0)
!1208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1209, file: !1063, line: 491)
!1209 = !DISubprogram(name: "scalblnf", scope: !1069, file: !1069, line: 418, type: !1210, flags: DIFlagPrototyped, spFlags: 0)
!1210 = !DISubroutineType(types: !1211)
!1211 = !{!723, !723, !450}
!1212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1213, file: !1063, line: 493)
!1213 = !DISubprogram(name: "scalbnf", scope: !1069, file: !1069, line: 414, type: !1106, flags: DIFlagPrototyped, spFlags: 0)
!1214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1215, file: !1063, line: 495)
!1215 = !DISubprogram(name: "tgammaf", scope: !1069, file: !1069, line: 457, type: !1075, flags: DIFlagPrototyped, spFlags: 0)
!1216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1217, file: !1063, line: 497)
!1217 = !DISubprogram(name: "truncf", scope: !1069, file: !1069, line: 501, type: !1075, flags: DIFlagPrototyped, spFlags: 0)
!1218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1219, file: !1063, line: 499)
!1219 = !DISubprogram(name: "acosl", scope: !1069, file: !1069, line: 316, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!1220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1221, file: !1063, line: 500)
!1221 = !DISubprogram(name: "asinl", scope: !1069, file: !1069, line: 320, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!1222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1223, file: !1063, line: 501)
!1223 = !DISubprogram(name: "atanl", scope: !1069, file: !1069, line: 324, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!1224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1225, file: !1063, line: 502)
!1225 = !DISubprogram(name: "atan2l", scope: !1069, file: !1069, line: 328, type: !1226, flags: DIFlagPrototyped, spFlags: 0)
!1226 = !DISubroutineType(types: !1227)
!1227 = !{!464, !464, !464}
!1228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1229, file: !1063, line: 503)
!1229 = !DISubprogram(name: "ceill", scope: !1069, file: !1069, line: 463, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!1230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1231, file: !1063, line: 504)
!1231 = !DISubprogram(name: "cosl", scope: !1069, file: !1069, line: 332, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!1232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1233, file: !1063, line: 505)
!1233 = !DISubprogram(name: "coshl", scope: !1069, file: !1069, line: 356, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!1234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1235, file: !1063, line: 506)
!1235 = !DISubprogram(name: "expl", scope: !1069, file: !1069, line: 368, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!1236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1237, file: !1063, line: 507)
!1237 = !DISubprogram(name: "fabsl", scope: !1069, file: !1069, line: 424, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!1238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1239, file: !1063, line: 508)
!1239 = !DISubprogram(name: "floorl", scope: !1069, file: !1069, line: 467, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!1240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1241, file: !1063, line: 509)
!1241 = !DISubprogram(name: "fmodl", scope: !1069, file: !1069, line: 507, type: !1226, flags: DIFlagPrototyped, spFlags: 0)
!1242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1243, file: !1063, line: 510)
!1243 = !DISubprogram(name: "frexpl", scope: !1069, file: !1069, line: 408, type: !1244, flags: DIFlagPrototyped, spFlags: 0)
!1244 = !DISubroutineType(types: !1245)
!1245 = !{!464, !464, !1103}
!1246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1247, file: !1063, line: 511)
!1247 = !DISubprogram(name: "ldexpl", scope: !1069, file: !1069, line: 404, type: !1248, flags: DIFlagPrototyped, spFlags: 0)
!1248 = !DISubroutineType(types: !1249)
!1249 = !{!464, !464, !7}
!1250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1251, file: !1063, line: 512)
!1251 = !DISubprogram(name: "logl", scope: !1069, file: !1069, line: 380, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!1252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1253, file: !1063, line: 513)
!1253 = !DISubprogram(name: "log10l", scope: !1069, file: !1069, line: 384, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!1254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1255, file: !1063, line: 514)
!1255 = !DISubprogram(name: "modfl", scope: !1069, file: !1069, line: 400, type: !1059, flags: DIFlagPrototyped, spFlags: 0)
!1256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1257, file: !1063, line: 515)
!1257 = !DISubprogram(name: "powl", scope: !1069, file: !1069, line: 436, type: !1226, flags: DIFlagPrototyped, spFlags: 0)
!1258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1259, file: !1063, line: 516)
!1259 = !DISubprogram(name: "sinl", scope: !1069, file: !1069, line: 336, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!1260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1261, file: !1063, line: 517)
!1261 = !DISubprogram(name: "sinhl", scope: !1069, file: !1069, line: 360, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!1262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1263, file: !1063, line: 518)
!1263 = !DISubprogram(name: "sqrtl", scope: !1069, file: !1069, line: 440, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!1264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1265, file: !1063, line: 519)
!1265 = !DISubprogram(name: "tanl", scope: !1069, file: !1069, line: 340, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!1266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1267, file: !1063, line: 521)
!1267 = !DISubprogram(name: "tanhl", scope: !1069, file: !1069, line: 364, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!1268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1269, file: !1063, line: 522)
!1269 = !DISubprogram(name: "acoshl", scope: !1069, file: !1069, line: 344, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!1270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1271, file: !1063, line: 523)
!1271 = !DISubprogram(name: "asinhl", scope: !1069, file: !1069, line: 348, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!1272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1273, file: !1063, line: 524)
!1273 = !DISubprogram(name: "atanhl", scope: !1069, file: !1069, line: 352, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!1274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1275, file: !1063, line: 525)
!1275 = !DISubprogram(name: "cbrtl", scope: !1069, file: !1069, line: 428, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!1276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1277, file: !1063, line: 527)
!1277 = !DISubprogram(name: "copysignl", scope: !1069, file: !1069, line: 519, type: !1226, flags: DIFlagPrototyped, spFlags: 0)
!1278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1279, file: !1063, line: 529)
!1279 = !DISubprogram(name: "erfl", scope: !1069, file: !1069, line: 444, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!1280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1281, file: !1063, line: 530)
!1281 = !DISubprogram(name: "erfcl", scope: !1069, file: !1069, line: 448, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!1282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1283, file: !1063, line: 531)
!1283 = !DISubprogram(name: "exp2l", scope: !1069, file: !1069, line: 372, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!1284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1285, file: !1063, line: 532)
!1285 = !DISubprogram(name: "expm1l", scope: !1069, file: !1069, line: 376, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!1286 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1287, file: !1063, line: 533)
!1287 = !DISubprogram(name: "fdiml", scope: !1069, file: !1069, line: 535, type: !1226, flags: DIFlagPrototyped, spFlags: 0)
!1288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1289, file: !1063, line: 534)
!1289 = !DISubprogram(name: "fmal", scope: !1069, file: !1069, line: 547, type: !1290, flags: DIFlagPrototyped, spFlags: 0)
!1290 = !DISubroutineType(types: !1291)
!1291 = !{!464, !464, !464, !464}
!1292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1293, file: !1063, line: 535)
!1293 = !DISubprogram(name: "fmaxl", scope: !1069, file: !1069, line: 539, type: !1226, flags: DIFlagPrototyped, spFlags: 0)
!1294 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1295, file: !1063, line: 536)
!1295 = !DISubprogram(name: "fminl", scope: !1069, file: !1069, line: 543, type: !1226, flags: DIFlagPrototyped, spFlags: 0)
!1296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1297, file: !1063, line: 537)
!1297 = !DISubprogram(name: "hypotl", scope: !1069, file: !1069, line: 432, type: !1226, flags: DIFlagPrototyped, spFlags: 0)
!1298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1299, file: !1063, line: 538)
!1299 = !DISubprogram(name: "ilogbl", scope: !1069, file: !1069, line: 412, type: !1300, flags: DIFlagPrototyped, spFlags: 0)
!1300 = !DISubroutineType(types: !1301)
!1301 = !{!7, !464}
!1302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1303, file: !1063, line: 539)
!1303 = !DISubprogram(name: "lgammal", scope: !1069, file: !1069, line: 455, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!1304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1305, file: !1063, line: 540)
!1305 = !DISubprogram(name: "llrintl", scope: !1069, file: !1069, line: 494, type: !1306, flags: DIFlagPrototyped, spFlags: 0)
!1306 = !DISubroutineType(types: !1307)
!1307 = !{!25, !464}
!1308 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1309, file: !1063, line: 541)
!1309 = !DISubprogram(name: "llroundl", scope: !1069, file: !1069, line: 498, type: !1306, flags: DIFlagPrototyped, spFlags: 0)
!1310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1311, file: !1063, line: 542)
!1311 = !DISubprogram(name: "log1pl", scope: !1069, file: !1069, line: 392, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!1312 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1313, file: !1063, line: 543)
!1313 = !DISubprogram(name: "log2l", scope: !1069, file: !1069, line: 388, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!1314 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1315, file: !1063, line: 544)
!1315 = !DISubprogram(name: "logbl", scope: !1069, file: !1069, line: 396, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!1316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1317, file: !1063, line: 545)
!1317 = !DISubprogram(name: "lrintl", scope: !1069, file: !1069, line: 479, type: !1318, flags: DIFlagPrototyped, spFlags: 0)
!1318 = !DISubroutineType(types: !1319)
!1319 = !{!450, !464}
!1320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1321, file: !1063, line: 546)
!1321 = !DISubprogram(name: "lroundl", scope: !1069, file: !1069, line: 487, type: !1318, flags: DIFlagPrototyped, spFlags: 0)
!1322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1323, file: !1063, line: 547)
!1323 = !DISubprogram(name: "nanl", scope: !1069, file: !1069, line: 523, type: !1324, flags: DIFlagPrototyped, spFlags: 0)
!1324 = !DISubroutineType(types: !1325)
!1325 = !{!464, !549}
!1326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1327, file: !1063, line: 548)
!1327 = !DISubprogram(name: "nearbyintl", scope: !1069, file: !1069, line: 471, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!1328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1329, file: !1063, line: 549)
!1329 = !DISubprogram(name: "nextafterl", scope: !1069, file: !1069, line: 527, type: !1226, flags: DIFlagPrototyped, spFlags: 0)
!1330 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1331, file: !1063, line: 550)
!1331 = !DISubprogram(name: "nexttowardl", scope: !1069, file: !1069, line: 531, type: !1226, flags: DIFlagPrototyped, spFlags: 0)
!1332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1333, file: !1063, line: 551)
!1333 = !DISubprogram(name: "remainderl", scope: !1069, file: !1069, line: 511, type: !1226, flags: DIFlagPrototyped, spFlags: 0)
!1334 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1335, file: !1063, line: 552)
!1335 = !DISubprogram(name: "remquol", scope: !1069, file: !1069, line: 515, type: !1336, flags: DIFlagPrototyped, spFlags: 0)
!1336 = !DISubroutineType(types: !1337)
!1337 = !{!464, !464, !464, !1103}
!1338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1339, file: !1063, line: 553)
!1339 = !DISubprogram(name: "rintl", scope: !1069, file: !1069, line: 475, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!1340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1341, file: !1063, line: 554)
!1341 = !DISubprogram(name: "roundl", scope: !1069, file: !1069, line: 483, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!1342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1343, file: !1063, line: 555)
!1343 = !DISubprogram(name: "scalblnl", scope: !1069, file: !1069, line: 420, type: !1344, flags: DIFlagPrototyped, spFlags: 0)
!1344 = !DISubroutineType(types: !1345)
!1345 = !{!464, !464, !450}
!1346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1347, file: !1063, line: 556)
!1347 = !DISubprogram(name: "scalbnl", scope: !1069, file: !1069, line: 416, type: !1248, flags: DIFlagPrototyped, spFlags: 0)
!1348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1349, file: !1063, line: 557)
!1349 = !DISubprogram(name: "tgammal", scope: !1069, file: !1069, line: 459, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!1350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1351, file: !1063, line: 558)
!1351 = !DISubprogram(name: "truncl", scope: !1069, file: !1069, line: 503, type: !996, flags: DIFlagPrototyped, spFlags: 0)
!1352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1353, file: !1357, line: 82)
!1353 = !DISubprogram(name: "memcpy", scope: !1354, file: !1354, line: 78, type: !1355, flags: DIFlagPrototyped, spFlags: 0)
!1354 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_string.h", directory: "", checksumkind: CSK_MD5, checksum: "c67be38c725261ca8572072ee1574b87")
!1355 = !DISubroutineType(types: !1356)
!1356 = !{!611, !611, !984, !662}
!1357 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstring", directory: "")
!1358 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1359, file: !1357, line: 83)
!1359 = !DISubprogram(name: "memmove", scope: !1354, file: !1354, line: 81, type: !1355, flags: DIFlagPrototyped, spFlags: 0)
!1360 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1361, file: !1357, line: 84)
!1361 = !DISubprogram(name: "strcpy", scope: !1354, file: !1354, line: 92, type: !1362, flags: DIFlagPrototyped, spFlags: 0)
!1362 = !DISubroutineType(types: !1363)
!1363 = !{!21, !21, !549}
!1364 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1365, file: !1357, line: 85)
!1365 = !DISubprogram(name: "strncpy", scope: !1354, file: !1354, line: 104, type: !1366, flags: DIFlagPrototyped, spFlags: 0)
!1366 = !DISubroutineType(types: !1367)
!1367 = !{!21, !21, !549, !662}
!1368 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1369, file: !1357, line: 86)
!1369 = !DISubprogram(name: "strcat", scope: !1354, file: !1354, line: 86, type: !1362, flags: DIFlagPrototyped, spFlags: 0)
!1370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1371, file: !1357, line: 87)
!1371 = !DISubprogram(name: "strncat", scope: !1354, file: !1354, line: 98, type: !1366, flags: DIFlagPrototyped, spFlags: 0)
!1372 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1373, file: !1357, line: 88)
!1373 = !DISubprogram(name: "memcmp", scope: !1354, file: !1354, line: 75, type: !1374, flags: DIFlagPrototyped, spFlags: 0)
!1374 = !DISubroutineType(types: !1375)
!1375 = !{!7, !984, !984, !662}
!1376 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1377, file: !1357, line: 89)
!1377 = !DISubprogram(name: "strcmp", scope: !1354, file: !1354, line: 89, type: !1378, flags: DIFlagPrototyped, spFlags: 0)
!1378 = !DISubroutineType(types: !1379)
!1379 = !{!7, !549, !549}
!1380 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1381, file: !1357, line: 90)
!1381 = !DISubprogram(name: "strncmp", scope: !1354, file: !1354, line: 101, type: !1382, flags: DIFlagPrototyped, spFlags: 0)
!1382 = !DISubroutineType(types: !1383)
!1383 = !{!7, !549, !549, !662}
!1384 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1385, file: !1357, line: 91)
!1385 = !DISubprogram(name: "strcoll", scope: !1354, file: !1354, line: 90, type: !1378, flags: DIFlagPrototyped, spFlags: 0)
!1386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1387, file: !1357, line: 92)
!1387 = !DISubprogram(name: "strxfrm", scope: !1354, file: !1354, line: 112, type: !1388, flags: DIFlagPrototyped, spFlags: 0)
!1388 = !DISubroutineType(types: !1389)
!1389 = !{!662, !21, !549, !662}
!1390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1391, file: !1357, line: 93)
!1391 = !DISubprogram(name: "memchr", linkageName: "_Z6memchrB8ne200100Ua9enable_ifILb1EEPvim", scope: !1392, file: !1392, line: 101, type: !1393, flags: DIFlagPrototyped, spFlags: 0)
!1392 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/string.h", directory: "")
!1393 = !DISubroutineType(types: !1394)
!1394 = !{!611, !611, !7, !662}
!1395 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1396, file: !1357, line: 94)
!1396 = !DISubprogram(name: "strchr", linkageName: "_Z6strchrB8ne200100Ua9enable_ifILb1EEPci", scope: !1392, file: !1392, line: 80, type: !1397, flags: DIFlagPrototyped, spFlags: 0)
!1397 = !DISubroutineType(types: !1398)
!1398 = !{!21, !21, !7}
!1399 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1400, file: !1357, line: 95)
!1400 = !DISubprogram(name: "strcspn", scope: !1354, file: !1354, line: 94, type: !1401, flags: DIFlagPrototyped, spFlags: 0)
!1401 = !DISubroutineType(types: !1402)
!1402 = !{!662, !549, !549}
!1403 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1404, file: !1357, line: 96)
!1404 = !DISubprogram(name: "strpbrk", linkageName: "_Z7strpbrkB8ne200100Ua9enable_ifILb1EEPcPKc", scope: !1392, file: !1392, line: 87, type: !1362, flags: DIFlagPrototyped, spFlags: 0)
!1405 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1406, file: !1357, line: 97)
!1406 = !DISubprogram(name: "strrchr", linkageName: "_Z7strrchrB8ne200100Ua9enable_ifILb1EEPci", scope: !1392, file: !1392, line: 94, type: !1397, flags: DIFlagPrototyped, spFlags: 0)
!1407 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1408, file: !1357, line: 98)
!1408 = !DISubprogram(name: "strspn", scope: !1354, file: !1354, line: 109, type: !1401, flags: DIFlagPrototyped, spFlags: 0)
!1409 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1410, file: !1357, line: 99)
!1410 = !DISubprogram(name: "strstr", linkageName: "_Z6strstrB8ne200100Ua9enable_ifILb1EEPcPKc", scope: !1392, file: !1392, line: 108, type: !1362, flags: DIFlagPrototyped, spFlags: 0)
!1411 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1412, file: !1357, line: 100)
!1412 = !DISubprogram(name: "strtok", scope: !1354, file: !1354, line: 111, type: !1362, flags: DIFlagPrototyped, spFlags: 0)
!1413 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1414, file: !1357, line: 101)
!1414 = !DISubprogram(name: "memset", scope: !1354, file: !1354, line: 84, type: !1393, flags: DIFlagPrototyped, spFlags: 0)
!1415 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1416, file: !1357, line: 102)
!1416 = !DISubprogram(name: "strerror", linkageName: "\01_strerror", scope: !1354, file: !1354, line: 95, type: !1417, flags: DIFlagPrototyped, spFlags: 0)
!1417 = !DISubroutineType(types: !1418)
!1418 = !{!21, !7}
!1419 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1420, file: !1357, line: 103)
!1420 = !DISubprogram(name: "strlen", scope: !1354, file: !1354, line: 96, type: !1421, flags: DIFlagPrototyped, spFlags: 0)
!1421 = !DISubroutineType(types: !1422)
!1422 = !{!662, !549}
!1423 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !1424, entity: !1425, file: !1427, line: 536)
!1424 = !DINamespace(name: "chrono", scope: !397)
!1425 = !DINamespace(name: "chrono_literals", scope: !1426, exportSymbols: true)
!1426 = !DINamespace(name: "literals", scope: !397, exportSymbols: true)
!1427 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__chrono/duration.h", directory: "")
!1428 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1429, file: !1432, line: 68)
!1429 = !DIDerivedType(tag: DW_TAG_typedef, name: "clock_t", file: !1430, line: 31, baseType: !1431)
!1430 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_clock_t.h", directory: "", checksumkind: CSK_MD5, checksum: "757b93ac72874f074e33ca41b7ee521d")
!1431 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_clock_t", file: !449, line: 116, baseType: !454)
!1432 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/ctime", directory: "")
!1433 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1434, file: !1432, line: 69)
!1434 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !1435, line: 31, baseType: !1436)
!1435 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_time_t.h", directory: "", checksumkind: CSK_MD5, checksum: "ddc110fab0813d27960d5c9aaba0ed4f")
!1436 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_time_t", file: !449, line: 119, baseType: !450)
!1437 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !578, file: !1432, line: 70)
!1438 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1439, file: !1432, line: 74)
!1439 = !DISubprogram(name: "clock", linkageName: "\01_clock", scope: !579, file: !579, line: 112, type: !1440, flags: DIFlagPrototyped, spFlags: 0)
!1440 = !DISubroutineType(types: !1441)
!1441 = !{!1429}
!1442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1443, file: !1432, line: 75)
!1443 = !DISubprogram(name: "difftime", scope: !579, file: !579, line: 114, type: !1444, flags: DIFlagPrototyped, spFlags: 0)
!1444 = !DISubroutineType(types: !1445)
!1445 = !{!717, !1434, !1434}
!1446 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1447, file: !1432, line: 76)
!1447 = !DISubprogram(name: "mktime", linkageName: "\01_mktime", scope: !579, file: !579, line: 118, type: !1448, flags: DIFlagPrototyped, spFlags: 0)
!1448 = !DISubroutineType(types: !1449)
!1449 = !{!1434, !1450}
!1450 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !578, size: 64)
!1451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1452, file: !1432, line: 77)
!1452 = !DISubprogram(name: "time", scope: !579, file: !579, line: 121, type: !1453, flags: DIFlagPrototyped, spFlags: 0)
!1453 = !DISubroutineType(types: !1454)
!1454 = !{!1434, !1455}
!1455 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1434, size: 64)
!1456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1457, file: !1432, line: 78)
!1457 = !DISubprogram(name: "asctime", scope: !579, file: !579, line: 111, type: !1458, flags: DIFlagPrototyped, spFlags: 0)
!1458 = !DISubroutineType(types: !1459)
!1459 = !{!21, !811}
!1460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1461, file: !1432, line: 79)
!1461 = !DISubprogram(name: "ctime", scope: !579, file: !579, line: 113, type: !1462, flags: DIFlagPrototyped, spFlags: 0)
!1462 = !DISubroutineType(types: !1463)
!1463 = !{!21, !1464}
!1464 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1465, size: 64)
!1465 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1434)
!1466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1467, file: !1432, line: 80)
!1467 = !DISubprogram(name: "gmtime", scope: !579, file: !579, line: 116, type: !1468, flags: DIFlagPrototyped, spFlags: 0)
!1468 = !DISubroutineType(types: !1469)
!1469 = !{!1450, !1464}
!1470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1471, file: !1432, line: 81)
!1471 = !DISubprogram(name: "localtime", scope: !579, file: !579, line: 117, type: !1468, flags: DIFlagPrototyped, spFlags: 0)
!1472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1473, file: !1432, line: 82)
!1473 = !DISubprogram(name: "strftime", linkageName: "\01_strftime", scope: !579, file: !579, line: 119, type: !1474, flags: DIFlagPrototyped, spFlags: 0)
!1474 = !DISubroutineType(types: !1475)
!1475 = !{!662, !21, !662, !549, !811}
!1476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !594, file: !1477, line: 120)
!1477 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdio", directory: "")
!1478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !624, file: !1477, line: 121)
!1479 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1480, file: !1477, line: 123)
!1480 = !DISubprogram(name: "fclose", scope: !595, file: !595, line: 233, type: !1481, flags: DIFlagPrototyped, spFlags: 0)
!1481 = !DISubroutineType(types: !1482)
!1482 = !{!7, !651}
!1483 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1484, file: !1477, line: 124)
!1484 = !DISubprogram(name: "fflush", scope: !595, file: !595, line: 236, type: !1481, flags: DIFlagPrototyped, spFlags: 0)
!1485 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1486, file: !1477, line: 125)
!1486 = !DISubprogram(name: "setbuf", scope: !595, file: !595, line: 272, type: !1487, flags: DIFlagPrototyped, spFlags: 0)
!1487 = !DISubroutineType(types: !1488)
!1488 = !{null, !651, !21}
!1489 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1490, file: !1477, line: 126)
!1490 = !DISubprogram(name: "setvbuf", scope: !595, file: !595, line: 273, type: !1491, flags: DIFlagPrototyped, spFlags: 0)
!1491 = !DISubroutineType(types: !1492)
!1492 = !{!7, !651, !21, !7, !662}
!1493 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1494, file: !1477, line: 127)
!1494 = !DISubprogram(name: "fprintf", scope: !595, file: !595, line: 245, type: !1495, flags: DIFlagPrototyped, spFlags: 0)
!1495 = !DISubroutineType(types: !1496)
!1496 = !{!7, !651, !549, null}
!1497 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1498, file: !1477, line: 128)
!1498 = !DISubprogram(name: "fscanf", scope: !595, file: !595, line: 251, type: !1495, flags: DIFlagPrototyped, spFlags: 0)
!1499 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1500, file: !1477, line: 129)
!1500 = !DISubprogram(name: "snprintf", scope: !595, file: !595, line: 435, type: !1501, flags: DIFlagPrototyped, spFlags: 0)
!1501 = !DISubroutineType(types: !1502)
!1502 = !{!7, !21, !662, !549, null}
!1503 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1504, file: !1477, line: 130)
!1504 = !DISubprogram(name: "sprintf", scope: !595, file: !595, line: 280, type: !1505, flags: DIFlagPrototyped, spFlags: 0)
!1505 = !DISubroutineType(types: !1506)
!1506 = !{!7, !21, !549, null}
!1507 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1508, file: !1477, line: 131)
!1508 = !DISubprogram(name: "sscanf", scope: !595, file: !595, line: 282, type: !1509, flags: DIFlagPrototyped, spFlags: 0)
!1509 = !DISubroutineType(types: !1510)
!1510 = !{!7, !549, !549, null}
!1511 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1512, file: !1477, line: 132)
!1512 = !DISubprogram(name: "vfprintf", scope: !595, file: !595, line: 292, type: !1513, flags: DIFlagPrototyped, spFlags: 0)
!1513 = !DISubroutineType(types: !1514)
!1514 = !{!7, !651, !549, !1515}
!1515 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !1516, line: 44, baseType: !669)
!1516 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_va_list.h", directory: "", checksumkind: CSK_MD5, checksum: "41825c2dccdd98a1587ce428cded44de")
!1517 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1518, file: !1477, line: 133)
!1518 = !DISubprogram(name: "vfscanf", scope: !595, file: !595, line: 436, type: !1513, flags: DIFlagPrototyped, spFlags: 0)
!1519 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1520, file: !1477, line: 134)
!1520 = !DISubprogram(name: "vsscanf", scope: !595, file: !595, line: 439, type: !1521, flags: DIFlagPrototyped, spFlags: 0)
!1521 = !DISubroutineType(types: !1522)
!1522 = !{!7, !549, !549, !1515}
!1523 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1524, file: !1477, line: 135)
!1524 = !DISubprogram(name: "vsnprintf", scope: !595, file: !595, line: 438, type: !1525, flags: DIFlagPrototyped, spFlags: 0)
!1525 = !DISubroutineType(types: !1526)
!1526 = !{!7, !21, !662, !549, !1515}
!1527 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1528, file: !1477, line: 136)
!1528 = !DISubprogram(name: "vsprintf", scope: !595, file: !595, line: 300, type: !1529, flags: DIFlagPrototyped, spFlags: 0)
!1529 = !DISubroutineType(types: !1530)
!1530 = !{!7, !21, !549, !1515}
!1531 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1532, file: !1477, line: 137)
!1532 = !DISubprogram(name: "fgetc", scope: !595, file: !595, line: 237, type: !1481, flags: DIFlagPrototyped, spFlags: 0)
!1533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1534, file: !1477, line: 138)
!1534 = !DISubprogram(name: "fgets", scope: !595, file: !595, line: 239, type: !1535, flags: DIFlagPrototyped, spFlags: 0)
!1535 = !DISubroutineType(types: !1536)
!1536 = !{!21, !21, !7, !651}
!1537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1538, file: !1477, line: 139)
!1538 = !DISubprogram(name: "fputc", scope: !595, file: !595, line: 246, type: !1539, flags: DIFlagPrototyped, spFlags: 0)
!1539 = !DISubroutineType(types: !1540)
!1540 = !{!7, !7, !651}
!1541 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1542, file: !1477, line: 140)
!1542 = !DISubprogram(name: "fputs", linkageName: "\01_fputs", scope: !595, file: !595, line: 247, type: !1543, flags: DIFlagPrototyped, spFlags: 0)
!1543 = !DISubroutineType(types: !1544)
!1544 = !{!7, !549, !651}
!1545 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1546, file: !1477, line: 141)
!1546 = !DISubprogram(name: "getc", scope: !595, file: !595, line: 256, type: !1481, flags: DIFlagPrototyped, spFlags: 0)
!1547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1548, file: !1477, line: 142)
!1548 = !DISubprogram(name: "putc", scope: !595, file: !595, line: 265, type: !1539, flags: DIFlagPrototyped, spFlags: 0)
!1549 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1550, file: !1477, line: 143)
!1550 = !DISubprogram(name: "ungetc", scope: !595, file: !595, line: 291, type: !1539, flags: DIFlagPrototyped, spFlags: 0)
!1551 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1552, file: !1477, line: 144)
!1552 = !DISubprogram(name: "fread", scope: !595, file: !595, line: 248, type: !1553, flags: DIFlagPrototyped, spFlags: 0)
!1553 = !DISubroutineType(types: !1554)
!1554 = !{!662, !611, !662, !662, !651}
!1555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1556, file: !1477, line: 145)
!1556 = !DISubprogram(name: "fwrite", linkageName: "\01_fwrite", scope: !595, file: !595, line: 255, type: !1557, flags: DIFlagPrototyped, spFlags: 0)
!1557 = !DISubroutineType(types: !1558)
!1558 = !{!662, !984, !662, !662, !651}
!1559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1560, file: !1477, line: 146)
!1560 = !DISubprogram(name: "fgetpos", scope: !595, file: !595, line: 238, type: !1561, flags: DIFlagPrototyped, spFlags: 0)
!1561 = !DISubroutineType(types: !1562)
!1562 = !{!7, !651, !1563}
!1563 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !624, size: 64)
!1564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1565, file: !1477, line: 147)
!1565 = !DISubprogram(name: "fseek", scope: !595, file: !595, line: 252, type: !1566, flags: DIFlagPrototyped, spFlags: 0)
!1566 = !DISubroutineType(types: !1567)
!1567 = !{!7, !651, !450, !7}
!1568 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1569, file: !1477, line: 148)
!1569 = !DISubprogram(name: "fsetpos", scope: !595, file: !595, line: 253, type: !1570, flags: DIFlagPrototyped, spFlags: 0)
!1570 = !DISubroutineType(types: !1571)
!1571 = !{!7, !651, !1572}
!1572 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1573, size: 64)
!1573 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !624)
!1574 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1575, file: !1477, line: 149)
!1575 = !DISubprogram(name: "ftell", scope: !595, file: !595, line: 254, type: !1576, flags: DIFlagPrototyped, spFlags: 0)
!1576 = !DISubroutineType(types: !1577)
!1577 = !{!450, !651}
!1578 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1579, file: !1477, line: 150)
!1579 = !DISubprogram(name: "rewind", scope: !595, file: !595, line: 270, type: !1580, flags: DIFlagPrototyped, spFlags: 0)
!1580 = !DISubroutineType(types: !1581)
!1581 = !{null, !651}
!1582 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1583, file: !1477, line: 151)
!1583 = !DISubprogram(name: "clearerr", scope: !595, file: !595, line: 232, type: !1580, flags: DIFlagPrototyped, spFlags: 0)
!1584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1585, file: !1477, line: 152)
!1585 = !DISubprogram(name: "feof", scope: !595, file: !595, line: 234, type: !1481, flags: DIFlagPrototyped, spFlags: 0)
!1586 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1587, file: !1477, line: 153)
!1587 = !DISubprogram(name: "ferror", scope: !595, file: !595, line: 235, type: !1481, flags: DIFlagPrototyped, spFlags: 0)
!1588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1589, file: !1477, line: 154)
!1589 = !DISubprogram(name: "perror", scope: !595, file: !595, line: 264, type: !1590, flags: DIFlagPrototyped, spFlags: 0)
!1590 = !DISubroutineType(types: !1591)
!1591 = !{null, !549}
!1592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1593, file: !1477, line: 156)
!1593 = !DISubprogram(name: "fopen", linkageName: "\01_fopen", scope: !595, file: !595, line: 243, type: !1594, flags: DIFlagPrototyped, spFlags: 0)
!1594 = !DISubroutineType(types: !1595)
!1595 = !{!651, !549, !549}
!1596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1597, file: !1477, line: 157)
!1597 = !DISubprogram(name: "freopen", linkageName: "\01_freopen", scope: !595, file: !595, line: 249, type: !1598, flags: DIFlagPrototyped, spFlags: 0)
!1598 = !DISubroutineType(types: !1599)
!1599 = !{!651, !549, !549, !651}
!1600 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1601, file: !1477, line: 158)
!1601 = !DISubprogram(name: "remove", scope: !595, file: !595, line: 268, type: !894, flags: DIFlagPrototyped, spFlags: 0)
!1602 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1603, file: !1477, line: 159)
!1603 = !DISubprogram(name: "rename", scope: !595, file: !595, line: 269, type: !1378, flags: DIFlagPrototyped, spFlags: 0)
!1604 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1605, file: !1477, line: 160)
!1605 = !DISubprogram(name: "tmpfile", scope: !595, file: !595, line: 283, type: !1606, flags: DIFlagPrototyped, spFlags: 0)
!1606 = !DISubroutineType(types: !1607)
!1607 = !{!651}
!1608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1609, file: !1477, line: 161)
!1609 = !DISubprogram(name: "tmpnam", scope: !595, file: !595, line: 289, type: !1610, flags: DIFlagPrototyped, spFlags: 0)
!1610 = !DISubroutineType(types: !1611)
!1611 = !{!21, !21}
!1612 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1613, file: !1477, line: 163)
!1613 = !DISubprogram(name: "getchar", scope: !595, file: !595, line: 257, type: !935, flags: DIFlagPrototyped, spFlags: 0)
!1614 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1615, file: !1477, line: 167)
!1615 = !DISubprogram(name: "scanf", scope: !595, file: !595, line: 271, type: !1616, flags: DIFlagPrototyped, spFlags: 0)
!1616 = !DISubroutineType(types: !1617)
!1617 = !{!7, !549, null}
!1618 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1619, file: !1477, line: 168)
!1619 = !DISubprogram(name: "vscanf", scope: !595, file: !595, line: 437, type: !1620, flags: DIFlagPrototyped, spFlags: 0)
!1620 = !DISubroutineType(types: !1621)
!1621 = !{!7, !549, !1515}
!1622 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1623, file: !1477, line: 170)
!1623 = !DISubprogram(name: "printf", scope: !1624, file: !1624, line: 34, type: !1616, flags: DIFlagPrototyped, spFlags: 0)
!1624 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_printf.h", directory: "", checksumkind: CSK_MD5, checksum: "2d37517bd0342aa326aa1d3660ad4ab4")
!1625 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1626, file: !1477, line: 171)
!1626 = !DISubprogram(name: "putchar", scope: !595, file: !595, line: 266, type: !469, flags: DIFlagPrototyped, spFlags: 0)
!1627 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1628, file: !1477, line: 172)
!1628 = !DISubprogram(name: "puts", scope: !595, file: !595, line: 267, type: !894, flags: DIFlagPrototyped, spFlags: 0)
!1629 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1630, file: !1477, line: 173)
!1630 = !DISubprogram(name: "vprintf", scope: !595, file: !595, line: 293, type: !1620, flags: DIFlagPrototyped, spFlags: 0)
!1631 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1632, file: !1659, line: 52)
!1632 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !1633, line: 46, size: 768, flags: DIFlagTypePassByValue, elements: !1634, identifier: "_ZTS5lconv")
!1633 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_locale.h", directory: "", checksumkind: CSK_MD5, checksum: "a6054df13071a4f642aabbc00435a252")
!1634 = !{!1635, !1636, !1637, !1638, !1639, !1640, !1641, !1642, !1643, !1644, !1645, !1646, !1647, !1648, !1649, !1650, !1651, !1652, !1653, !1654, !1655, !1656, !1657, !1658}
!1635 = !DIDerivedType(tag: DW_TAG_member, name: "decimal_point", scope: !1632, file: !1633, line: 47, baseType: !21, size: 64)
!1636 = !DIDerivedType(tag: DW_TAG_member, name: "thousands_sep", scope: !1632, file: !1633, line: 48, baseType: !21, size: 64, offset: 64)
!1637 = !DIDerivedType(tag: DW_TAG_member, name: "grouping", scope: !1632, file: !1633, line: 49, baseType: !21, size: 64, offset: 128)
!1638 = !DIDerivedType(tag: DW_TAG_member, name: "int_curr_symbol", scope: !1632, file: !1633, line: 50, baseType: !21, size: 64, offset: 192)
!1639 = !DIDerivedType(tag: DW_TAG_member, name: "currency_symbol", scope: !1632, file: !1633, line: 51, baseType: !21, size: 64, offset: 256)
!1640 = !DIDerivedType(tag: DW_TAG_member, name: "mon_decimal_point", scope: !1632, file: !1633, line: 52, baseType: !21, size: 64, offset: 320)
!1641 = !DIDerivedType(tag: DW_TAG_member, name: "mon_thousands_sep", scope: !1632, file: !1633, line: 53, baseType: !21, size: 64, offset: 384)
!1642 = !DIDerivedType(tag: DW_TAG_member, name: "mon_grouping", scope: !1632, file: !1633, line: 54, baseType: !21, size: 64, offset: 448)
!1643 = !DIDerivedType(tag: DW_TAG_member, name: "positive_sign", scope: !1632, file: !1633, line: 55, baseType: !21, size: 64, offset: 512)
!1644 = !DIDerivedType(tag: DW_TAG_member, name: "negative_sign", scope: !1632, file: !1633, line: 56, baseType: !21, size: 64, offset: 576)
!1645 = !DIDerivedType(tag: DW_TAG_member, name: "int_frac_digits", scope: !1632, file: !1633, line: 57, baseType: !22, size: 8, offset: 640)
!1646 = !DIDerivedType(tag: DW_TAG_member, name: "frac_digits", scope: !1632, file: !1633, line: 58, baseType: !22, size: 8, offset: 648)
!1647 = !DIDerivedType(tag: DW_TAG_member, name: "p_cs_precedes", scope: !1632, file: !1633, line: 59, baseType: !22, size: 8, offset: 656)
!1648 = !DIDerivedType(tag: DW_TAG_member, name: "p_sep_by_space", scope: !1632, file: !1633, line: 60, baseType: !22, size: 8, offset: 664)
!1649 = !DIDerivedType(tag: DW_TAG_member, name: "n_cs_precedes", scope: !1632, file: !1633, line: 61, baseType: !22, size: 8, offset: 672)
!1650 = !DIDerivedType(tag: DW_TAG_member, name: "n_sep_by_space", scope: !1632, file: !1633, line: 62, baseType: !22, size: 8, offset: 680)
!1651 = !DIDerivedType(tag: DW_TAG_member, name: "p_sign_posn", scope: !1632, file: !1633, line: 63, baseType: !22, size: 8, offset: 688)
!1652 = !DIDerivedType(tag: DW_TAG_member, name: "n_sign_posn", scope: !1632, file: !1633, line: 64, baseType: !22, size: 8, offset: 696)
!1653 = !DIDerivedType(tag: DW_TAG_member, name: "int_p_cs_precedes", scope: !1632, file: !1633, line: 65, baseType: !22, size: 8, offset: 704)
!1654 = !DIDerivedType(tag: DW_TAG_member, name: "int_n_cs_precedes", scope: !1632, file: !1633, line: 66, baseType: !22, size: 8, offset: 712)
!1655 = !DIDerivedType(tag: DW_TAG_member, name: "int_p_sep_by_space", scope: !1632, file: !1633, line: 67, baseType: !22, size: 8, offset: 720)
!1656 = !DIDerivedType(tag: DW_TAG_member, name: "int_n_sep_by_space", scope: !1632, file: !1633, line: 68, baseType: !22, size: 8, offset: 728)
!1657 = !DIDerivedType(tag: DW_TAG_member, name: "int_p_sign_posn", scope: !1632, file: !1633, line: 69, baseType: !22, size: 8, offset: 736)
!1658 = !DIDerivedType(tag: DW_TAG_member, name: "int_n_sign_posn", scope: !1632, file: !1633, line: 70, baseType: !22, size: 8, offset: 744)
!1659 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/clocale", directory: "")
!1660 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1661, file: !1659, line: 53)
!1661 = !DISubprogram(name: "setlocale", scope: !1662, file: !1662, line: 56, type: !1663, flags: DIFlagPrototyped, spFlags: 0)
!1662 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/locale.h", directory: "", checksumkind: CSK_MD5, checksum: "fcf8310e4aaf18e49a21cced49364afb")
!1663 = !DISubroutineType(types: !1664)
!1664 = !{!21, !7, !549}
!1665 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1666, file: !1659, line: 54)
!1666 = !DISubprogram(name: "localeconv", scope: !1633, file: !1633, line: 99, type: !1667, flags: DIFlagPrototyped, spFlags: 0)
!1667 = !DISubroutineType(types: !1668)
!1668 = !{!1669}
!1669 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1632, size: 64)
!1670 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !397, entity: !1671, file: !1673, line: 53)
!1671 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !1672, line: 12, baseType: !670)
!1672 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/lib/clang/20/include/__stdarg_va_list.h", directory: "", checksumkind: CSK_MD5, checksum: "7bd78a282b99fcfe41a9e3c566d14f7d")
!1673 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdarg", directory: "")
!1674 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 4]}
!1675 = !{i32 7, !"Dwarf Version", i32 5}
!1676 = !{i32 2, !"Debug Info Version", i32 3}
!1677 = !{i32 1, !"wchar_size", i32 4}
!1678 = !{i32 8, !"PIC Level", i32 2}
!1679 = !{i32 7, !"uwtable", i32 1}
!1680 = !{i32 7, !"frame-pointer", i32 1}
!1681 = !{!"Homebrew clang version 20.1.8"}
!1682 = distinct !DISubprogram(name: "verify_console_object", linkageName: "_Z21verify_console_objectv", scope: !29, file: !29, line: 182, type: !961, scopeLine: 183, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2)
!1683 = !DILocation(line: 207, column: 2, scope: !1682)
!1684 = !DILocation(line: 208, column: 2, scope: !1682)
!1685 = !DILocation(line: 209, column: 35, scope: !1682)
!1686 = !DILocation(line: 209, column: 27, scope: !1682)
!1687 = !DILocation(line: 209, column: 47, scope: !1682)
!1688 = !DILocation(line: 209, column: 19, scope: !1682)
!1689 = !DILocation(line: 209, column: 16, scope: !1682)
!1690 = !DILocation(line: 210, column: 2, scope: !1682)
!1691 = !DILocation(line: 211, column: 2, scope: !1682)
!1692 = !DILocation(line: 212, column: 1, scope: !1682)
!1693 = distinct !DISubprogram(name: "count_number_of_robots", linkageName: "_Z22count_number_of_robotsv", scope: !29, file: !29, line: 214, type: !935, scopeLine: 215, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1694)
!1694 = !{}
!1695 = !DILocalVariable(name: "robot_count", scope: !1693, file: !29, line: 216, type: !7)
!1696 = !DILocation(line: 216, column: 6, scope: !1693)
!1697 = !DILocalVariable(name: "i", scope: !1693, file: !29, line: 217, type: !7)
!1698 = !DILocation(line: 217, column: 6, scope: !1693)
!1699 = !DILocation(line: 219, column: 14, scope: !1693)
!1700 = !DILocation(line: 220, column: 9, scope: !1701)
!1701 = distinct !DILexicalBlock(scope: !1693, file: !29, line: 220, column: 2)
!1702 = !DILocation(line: 220, column: 7, scope: !1701)
!1703 = !DILocation(line: 220, column: 14, scope: !1704)
!1704 = distinct !DILexicalBlock(scope: !1701, file: !29, line: 220, column: 2)
!1705 = !DILocation(line: 220, column: 19, scope: !1704)
!1706 = !DILocation(line: 220, column: 16, scope: !1704)
!1707 = !DILocation(line: 220, column: 2, scope: !1701)
!1708 = !DILocation(line: 221, column: 15, scope: !1709)
!1709 = distinct !DILexicalBlock(scope: !1710, file: !29, line: 221, column: 7)
!1710 = distinct !DILexicalBlock(scope: !1704, file: !29, line: 220, column: 46)
!1711 = !DILocation(line: 221, column: 7, scope: !1709)
!1712 = !DILocation(line: 221, column: 18, scope: !1709)
!1713 = !DILocation(line: 221, column: 23, scope: !1709)
!1714 = !DILocation(line: 222, column: 15, scope: !1709)
!1715 = !DILocation(line: 222, column: 4, scope: !1709)
!1716 = !DILocation(line: 223, column: 2, scope: !1710)
!1717 = !DILocation(line: 220, column: 42, scope: !1704)
!1718 = !DILocation(line: 220, column: 2, scope: !1704)
!1719 = distinct !{!1719, !1707, !1720, !1721}
!1720 = !DILocation(line: 223, column: 2, scope: !1701)
!1721 = !{!"llvm.loop.mustprogress"}
!1722 = !DILocation(line: 225, column: 9, scope: !1693)
!1723 = !DILocation(line: 225, column: 2, scope: !1693)
!1724 = distinct !DISubprogram(name: "count_number_of_hostages", linkageName: "_Z24count_number_of_hostagesv", scope: !29, file: !29, line: 229, type: !935, scopeLine: 230, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1694)
!1725 = !DILocalVariable(name: "count", scope: !1724, file: !29, line: 231, type: !7)
!1726 = !DILocation(line: 231, column: 6, scope: !1724)
!1727 = !DILocalVariable(name: "i", scope: !1724, file: !29, line: 232, type: !7)
!1728 = !DILocation(line: 232, column: 6, scope: !1724)
!1729 = !DILocation(line: 234, column: 8, scope: !1724)
!1730 = !DILocation(line: 235, column: 9, scope: !1731)
!1731 = distinct !DILexicalBlock(scope: !1724, file: !29, line: 235, column: 2)
!1732 = !DILocation(line: 235, column: 7, scope: !1731)
!1733 = !DILocation(line: 235, column: 14, scope: !1734)
!1734 = distinct !DILexicalBlock(scope: !1731, file: !29, line: 235, column: 2)
!1735 = !DILocation(line: 235, column: 19, scope: !1734)
!1736 = !DILocation(line: 235, column: 16, scope: !1734)
!1737 = !DILocation(line: 235, column: 2, scope: !1731)
!1738 = !DILocation(line: 236, column: 15, scope: !1739)
!1739 = distinct !DILexicalBlock(scope: !1740, file: !29, line: 236, column: 7)
!1740 = distinct !DILexicalBlock(scope: !1734, file: !29, line: 235, column: 46)
!1741 = !DILocation(line: 236, column: 7, scope: !1739)
!1742 = !DILocation(line: 236, column: 18, scope: !1739)
!1743 = !DILocation(line: 236, column: 23, scope: !1739)
!1744 = !DILocation(line: 237, column: 9, scope: !1739)
!1745 = !DILocation(line: 237, column: 4, scope: !1739)
!1746 = !DILocation(line: 238, column: 2, scope: !1740)
!1747 = !DILocation(line: 235, column: 42, scope: !1734)
!1748 = !DILocation(line: 235, column: 2, scope: !1734)
!1749 = distinct !{!1749, !1737, !1750, !1721}
!1750 = !DILocation(line: 238, column: 2, scope: !1731)
!1751 = !DILocation(line: 240, column: 9, scope: !1724)
!1752 = !DILocation(line: 240, column: 2, scope: !1724)
!1753 = distinct !DISubprogram(name: "gameseq_init_network_players", linkageName: "_Z28gameseq_init_network_playersv", scope: !29, file: !29, line: 244, type: !961, scopeLine: 245, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1694)
!1754 = !DILocalVariable(name: "i", scope: !1753, file: !29, line: 300, type: !7)
!1755 = !DILocation(line: 300, column: 6, scope: !1753)
!1756 = !DILocalVariable(name: "k", scope: !1753, file: !29, line: 300, type: !7)
!1757 = !DILocation(line: 300, column: 9, scope: !1753)
!1758 = !DILocalVariable(name: "j", scope: !1753, file: !29, line: 300, type: !7)
!1759 = !DILocation(line: 300, column: 12, scope: !1753)
!1760 = !DILocation(line: 304, column: 16, scope: !1753)
!1761 = !DILocation(line: 305, column: 4, scope: !1753)
!1762 = !DILocation(line: 306, column: 4, scope: !1753)
!1763 = !DILocation(line: 307, column: 9, scope: !1764)
!1764 = distinct !DILexicalBlock(scope: !1753, file: !29, line: 307, column: 2)
!1765 = !DILocation(line: 307, column: 7, scope: !1764)
!1766 = !DILocation(line: 307, column: 14, scope: !1767)
!1767 = distinct !DILexicalBlock(scope: !1764, file: !29, line: 307, column: 2)
!1768 = !DILocation(line: 307, column: 19, scope: !1767)
!1769 = !DILocation(line: 307, column: 16, scope: !1767)
!1770 = !DILocation(line: 307, column: 2, scope: !1764)
!1771 = !DILocation(line: 309, column: 16, scope: !1772)
!1772 = distinct !DILexicalBlock(scope: !1773, file: !29, line: 309, column: 7)
!1773 = distinct !DILexicalBlock(scope: !1767, file: !29, line: 308, column: 2)
!1774 = !DILocation(line: 309, column: 8, scope: !1772)
!1775 = !DILocation(line: 309, column: 19, scope: !1772)
!1776 = !DILocation(line: 309, column: 24, scope: !1772)
!1777 = !DILocation(line: 309, column: 39, scope: !1772)
!1778 = !DILocation(line: 309, column: 51, scope: !1772)
!1779 = !DILocation(line: 309, column: 43, scope: !1772)
!1780 = !DILocation(line: 309, column: 54, scope: !1772)
!1781 = !DILocation(line: 309, column: 59, scope: !1772)
!1782 = !DILocation(line: 309, column: 73, scope: !1772)
!1783 = !DILocation(line: 309, column: 85, scope: !1772)
!1784 = !DILocation(line: 309, column: 77, scope: !1772)
!1785 = !DILocation(line: 309, column: 88, scope: !1772)
!1786 = !DILocation(line: 309, column: 93, scope: !1772)
!1787 = !DILocation(line: 311, column: 11, scope: !1788)
!1788 = distinct !DILexicalBlock(scope: !1789, file: !29, line: 311, column: 8)
!1789 = distinct !DILexicalBlock(scope: !1772, file: !29, line: 310, column: 3)
!1790 = !DILocation(line: 311, column: 21, scope: !1788)
!1791 = !DILocation(line: 311, column: 10, scope: !1788)
!1792 = !DILocation(line: 311, column: 38, scope: !1788)
!1793 = !DILocation(line: 311, column: 51, scope: !1788)
!1794 = !DILocation(line: 311, column: 43, scope: !1788)
!1795 = !DILocation(line: 311, column: 54, scope: !1788)
!1796 = !DILocation(line: 311, column: 59, scope: !1788)
!1797 = !DILocation(line: 311, column: 74, scope: !1788)
!1798 = !DILocation(line: 311, column: 86, scope: !1788)
!1799 = !DILocation(line: 311, column: 78, scope: !1788)
!1800 = !DILocation(line: 311, column: 89, scope: !1788)
!1801 = !DILocation(line: 311, column: 94, scope: !1788)
!1802 = !DILocation(line: 311, column: 110, scope: !1788)
!1803 = !DILocation(line: 312, column: 7, scope: !1788)
!1804 = !DILocation(line: 312, column: 17, scope: !1788)
!1805 = !DILocation(line: 312, column: 6, scope: !1788)
!1806 = !DILocation(line: 312, column: 34, scope: !1788)
!1807 = !DILocation(line: 312, column: 39, scope: !1788)
!1808 = !DILocation(line: 312, column: 41, scope: !1788)
!1809 = !DILocation(line: 312, column: 47, scope: !1788)
!1810 = !DILocation(line: 312, column: 59, scope: !1788)
!1811 = !DILocation(line: 312, column: 51, scope: !1788)
!1812 = !DILocation(line: 312, column: 62, scope: !1788)
!1813 = !DILocation(line: 312, column: 67, scope: !1788)
!1814 = !DILocation(line: 315, column: 13, scope: !1815)
!1815 = distinct !DILexicalBlock(scope: !1788, file: !29, line: 313, column: 4)
!1816 = !DILocation(line: 315, column: 5, scope: !1815)
!1817 = !DILocation(line: 315, column: 16, scope: !1815)
!1818 = !DILocation(line: 315, column: 21, scope: !1815)
!1819 = !DILocation(line: 317, column: 34, scope: !1815)
!1820 = !DILocation(line: 317, column: 26, scope: !1815)
!1821 = !DILocation(line: 317, column: 37, scope: !1815)
!1822 = !DILocation(line: 317, column: 17, scope: !1815)
!1823 = !DILocation(line: 317, column: 5, scope: !1815)
!1824 = !DILocation(line: 317, column: 20, scope: !1815)
!1825 = !DILocation(line: 317, column: 24, scope: !1815)
!1826 = !DILocation(line: 318, column: 37, scope: !1815)
!1827 = !DILocation(line: 318, column: 29, scope: !1815)
!1828 = !DILocation(line: 318, column: 40, scope: !1815)
!1829 = !DILocation(line: 318, column: 17, scope: !1815)
!1830 = !DILocation(line: 318, column: 5, scope: !1815)
!1831 = !DILocation(line: 318, column: 20, scope: !1815)
!1832 = !DILocation(line: 318, column: 27, scope: !1815)
!1833 = !DILocation(line: 319, column: 37, scope: !1815)
!1834 = !DILocation(line: 319, column: 29, scope: !1815)
!1835 = !DILocation(line: 319, column: 40, scope: !1815)
!1836 = !DILocation(line: 319, column: 17, scope: !1815)
!1837 = !DILocation(line: 319, column: 5, scope: !1815)
!1838 = !DILocation(line: 319, column: 20, scope: !1815)
!1839 = !DILocation(line: 319, column: 27, scope: !1815)
!1840 = !DILocation(line: 320, column: 25, scope: !1815)
!1841 = !DILocation(line: 320, column: 13, scope: !1815)
!1842 = !DILocation(line: 320, column: 5, scope: !1815)
!1843 = !DILocation(line: 320, column: 16, scope: !1815)
!1844 = !DILocation(line: 320, column: 23, scope: !1815)
!1845 = !DILocation(line: 321, column: 21, scope: !1815)
!1846 = !DILocation(line: 321, column: 13, scope: !1815)
!1847 = !DILocation(line: 321, column: 5, scope: !1815)
!1848 = !DILocation(line: 321, column: 16, scope: !1815)
!1849 = !DILocation(line: 321, column: 19, scope: !1815)
!1850 = !DILocation(line: 322, column: 6, scope: !1815)
!1851 = !DILocation(line: 323, column: 4, scope: !1815)
!1852 = !DILocation(line: 325, column: 16, scope: !1788)
!1853 = !DILocation(line: 325, column: 5, scope: !1788)
!1854 = !DILocation(line: 326, column: 5, scope: !1789)
!1855 = !DILocation(line: 327, column: 3, scope: !1789)
!1856 = !DILocation(line: 329, column: 16, scope: !1857)
!1857 = distinct !DILexicalBlock(scope: !1773, file: !29, line: 329, column: 7)
!1858 = !DILocation(line: 329, column: 8, scope: !1857)
!1859 = !DILocation(line: 329, column: 19, scope: !1857)
!1860 = !DILocation(line: 329, column: 24, scope: !1857)
!1861 = !DILocation(line: 329, column: 38, scope: !1857)
!1862 = !DILocation(line: 329, column: 61, scope: !1857)
!1863 = !DILocation(line: 329, column: 53, scope: !1857)
!1864 = !DILocation(line: 329, column: 64, scope: !1857)
!1865 = !DILocation(line: 329, column: 42, scope: !1857)
!1866 = !DILocation(line: 329, column: 68, scope: !1857)
!1867 = !DILocation(line: 329, column: 41, scope: !1857)
!1868 = !DILocation(line: 329, column: 79, scope: !1857)
!1869 = !DILocation(line: 329, column: 83, scope: !1857)
!1870 = !DILocation(line: 329, column: 93, scope: !1857)
!1871 = !DILocation(line: 329, column: 82, scope: !1857)
!1872 = !DILocation(line: 330, column: 15, scope: !1857)
!1873 = !DILocation(line: 330, column: 4, scope: !1857)
!1874 = !DILocation(line: 332, column: 2, scope: !1773)
!1875 = !DILocation(line: 307, column: 42, scope: !1767)
!1876 = !DILocation(line: 307, column: 2, scope: !1767)
!1877 = distinct !{!1877, !1770, !1878, !1721}
!1878 = !DILocation(line: 332, column: 2, scope: !1764)
!1879 = !DILocation(line: 333, column: 26, scope: !1753)
!1880 = !DILocation(line: 333, column: 24, scope: !1753)
!1881 = !DILocation(line: 336, column: 8, scope: !1882)
!1882 = distinct !DILexicalBlock(scope: !1753, file: !29, line: 336, column: 6)
!1883 = !DILocation(line: 336, column: 18, scope: !1882)
!1884 = !DILocation(line: 336, column: 7, scope: !1882)
!1885 = !DILocation(line: 336, column: 35, scope: !1882)
!1886 = !DILocation(line: 336, column: 39, scope: !1882)
!1887 = !DILocation(line: 336, column: 61, scope: !1882)
!1888 = !DILocation(line: 336, column: 68, scope: !1882)
!1889 = !DILocation(line: 337, column: 6, scope: !1882)
!1890 = !DILocation(line: 337, column: 16, scope: !1882)
!1891 = !DILocation(line: 337, column: 5, scope: !1882)
!1892 = !DILocation(line: 337, column: 33, scope: !1882)
!1893 = !DILocation(line: 337, column: 37, scope: !1882)
!1894 = !DILocation(line: 337, column: 59, scope: !1882)
!1895 = !DILocation(line: 339, column: 3, scope: !1896)
!1896 = distinct !DILexicalBlock(scope: !1882, file: !29, line: 338, column: 2)
!1897 = !DILocation(line: 341, column: 2, scope: !1896)
!1898 = !DILocation(line: 355, column: 1, scope: !1753)
!1899 = distinct !DISubprogram(name: "gameseq_remove_unused_players", linkageName: "_Z29gameseq_remove_unused_playersv", scope: !29, file: !29, line: 357, type: !961, scopeLine: 358, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1694)
!1900 = !DILocalVariable(name: "i", scope: !1899, file: !29, line: 359, type: !7)
!1901 = !DILocation(line: 359, column: 6, scope: !1899)
!1902 = !DILocation(line: 407, column: 10, scope: !1903)
!1903 = distinct !DILexicalBlock(scope: !1904, file: !29, line: 407, column: 3)
!1904 = distinct !DILexicalBlock(scope: !1899, file: !29, line: 403, column: 2)
!1905 = !DILocation(line: 407, column: 8, scope: !1903)
!1906 = !DILocation(line: 407, column: 15, scope: !1907)
!1907 = distinct !DILexicalBlock(scope: !1903, file: !29, line: 407, column: 3)
!1908 = !DILocation(line: 407, column: 19, scope: !1907)
!1909 = !DILocation(line: 407, column: 17, scope: !1907)
!1910 = !DILocation(line: 407, column: 3, scope: !1903)
!1911 = !DILocation(line: 409, column: 23, scope: !1912)
!1912 = distinct !DILexicalBlock(scope: !1907, file: !29, line: 408, column: 3)
!1913 = !DILocation(line: 409, column: 15, scope: !1912)
!1914 = !DILocation(line: 409, column: 26, scope: !1912)
!1915 = !DILocation(line: 409, column: 4, scope: !1912)
!1916 = !DILocation(line: 410, column: 3, scope: !1912)
!1917 = !DILocation(line: 407, column: 43, scope: !1907)
!1918 = !DILocation(line: 407, column: 3, scope: !1907)
!1919 = distinct !{!1919, !1910, !1920, !1721}
!1920 = !DILocation(line: 410, column: 3, scope: !1903)
!1921 = !DILocation(line: 412, column: 1, scope: !1899)
!1922 = distinct !DISubprogram(name: "init_player_stats_game", linkageName: "_Z22init_player_stats_gamev", scope: !29, file: !29, line: 417, type: !961, scopeLine: 418, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2)
!1923 = !DILocation(line: 419, column: 10, scope: !1922)
!1924 = !DILocation(line: 419, column: 2, scope: !1922)
!1925 = !DILocation(line: 419, column: 22, scope: !1922)
!1926 = !DILocation(line: 419, column: 28, scope: !1922)
!1927 = !DILocation(line: 420, column: 10, scope: !1922)
!1928 = !DILocation(line: 420, column: 2, scope: !1922)
!1929 = !DILocation(line: 420, column: 22, scope: !1922)
!1930 = !DILocation(line: 420, column: 33, scope: !1922)
!1931 = !DILocation(line: 421, column: 10, scope: !1922)
!1932 = !DILocation(line: 421, column: 2, scope: !1922)
!1933 = !DILocation(line: 421, column: 22, scope: !1922)
!1934 = !DILocation(line: 421, column: 28, scope: !1922)
!1935 = !DILocation(line: 422, column: 10, scope: !1922)
!1936 = !DILocation(line: 422, column: 2, scope: !1922)
!1937 = !DILocation(line: 422, column: 22, scope: !1922)
!1938 = !DILocation(line: 422, column: 28, scope: !1922)
!1939 = !DILocation(line: 424, column: 10, scope: !1922)
!1940 = !DILocation(line: 424, column: 2, scope: !1922)
!1941 = !DILocation(line: 424, column: 22, scope: !1922)
!1942 = !DILocation(line: 424, column: 33, scope: !1922)
!1943 = !DILocation(line: 425, column: 10, scope: !1922)
!1944 = !DILocation(line: 425, column: 2, scope: !1922)
!1945 = !DILocation(line: 425, column: 22, scope: !1922)
!1946 = !DILocation(line: 425, column: 33, scope: !1922)
!1947 = !DILocation(line: 426, column: 10, scope: !1922)
!1948 = !DILocation(line: 426, column: 2, scope: !1922)
!1949 = !DILocation(line: 426, column: 22, scope: !1922)
!1950 = !DILocation(line: 426, column: 34, scope: !1922)
!1951 = !DILocation(line: 427, column: 10, scope: !1922)
!1952 = !DILocation(line: 427, column: 2, scope: !1922)
!1953 = !DILocation(line: 427, column: 22, scope: !1922)
!1954 = !DILocation(line: 427, column: 34, scope: !1922)
!1955 = !DILocation(line: 429, column: 31, scope: !1922)
!1956 = !DILocation(line: 429, column: 10, scope: !1922)
!1957 = !DILocation(line: 429, column: 2, scope: !1922)
!1958 = !DILocation(line: 429, column: 22, scope: !1922)
!1959 = !DILocation(line: 429, column: 29, scope: !1922)
!1960 = !DILocation(line: 430, column: 32, scope: !1922)
!1961 = !DILocation(line: 430, column: 10, scope: !1922)
!1962 = !DILocation(line: 430, column: 2, scope: !1922)
!1963 = !DILocation(line: 430, column: 22, scope: !1922)
!1964 = !DILocation(line: 430, column: 30, scope: !1922)
!1965 = !DILocation(line: 431, column: 10, scope: !1922)
!1966 = !DILocation(line: 431, column: 2, scope: !1922)
!1967 = !DILocation(line: 431, column: 22, scope: !1922)
!1968 = !DILocation(line: 431, column: 36, scope: !1922)
!1969 = !DILocation(line: 433, column: 10, scope: !1922)
!1970 = !DILocation(line: 433, column: 2, scope: !1922)
!1971 = !DILocation(line: 433, column: 22, scope: !1922)
!1972 = !DILocation(line: 433, column: 39, scope: !1922)
!1973 = !DILocation(line: 434, column: 10, scope: !1922)
!1974 = !DILocation(line: 434, column: 2, scope: !1922)
!1975 = !DILocation(line: 434, column: 22, scope: !1922)
!1976 = !DILocation(line: 434, column: 38, scope: !1922)
!1977 = !DILocation(line: 436, column: 10, scope: !1922)
!1978 = !DILocation(line: 436, column: 2, scope: !1922)
!1979 = !DILocation(line: 436, column: 22, scope: !1922)
!1980 = !DILocation(line: 436, column: 38, scope: !1922)
!1981 = !DILocation(line: 437, column: 10, scope: !1922)
!1982 = !DILocation(line: 437, column: 2, scope: !1922)
!1983 = !DILocation(line: 437, column: 22, scope: !1922)
!1984 = !DILocation(line: 437, column: 38, scope: !1922)
!1985 = !DILocation(line: 438, column: 10, scope: !1922)
!1986 = !DILocation(line: 438, column: 2, scope: !1922)
!1987 = !DILocation(line: 438, column: 22, scope: !1922)
!1988 = !DILocation(line: 438, column: 39, scope: !1922)
!1989 = !DILocation(line: 439, column: 10, scope: !1922)
!1990 = !DILocation(line: 439, column: 2, scope: !1922)
!1991 = !DILocation(line: 439, column: 22, scope: !1922)
!1992 = !DILocation(line: 439, column: 39, scope: !1922)
!1993 = !DILocation(line: 440, column: 10, scope: !1922)
!1994 = !DILocation(line: 440, column: 2, scope: !1922)
!1995 = !DILocation(line: 440, column: 22, scope: !1922)
!1996 = !DILocation(line: 440, column: 36, scope: !1922)
!1997 = !DILocation(line: 442, column: 10, scope: !1922)
!1998 = !DILocation(line: 442, column: 2, scope: !1922)
!1999 = !DILocation(line: 442, column: 22, scope: !1922)
!2000 = !DILocation(line: 442, column: 45, scope: !1922)
!2001 = !DILocation(line: 443, column: 10, scope: !1922)
!2002 = !DILocation(line: 443, column: 2, scope: !1922)
!2003 = !DILocation(line: 443, column: 22, scope: !1922)
!2004 = !DILocation(line: 443, column: 37, scope: !1922)
!2005 = !DILocation(line: 444, column: 10, scope: !1922)
!2006 = !DILocation(line: 444, column: 2, scope: !1922)
!2007 = !DILocation(line: 444, column: 22, scope: !1922)
!2008 = !DILocation(line: 444, column: 37, scope: !1922)
!2009 = !DILocation(line: 446, column: 10, scope: !1922)
!2010 = !DILocation(line: 446, column: 2, scope: !1922)
!2011 = !DILocation(line: 446, column: 22, scope: !1922)
!2012 = !DILocation(line: 446, column: 34, scope: !1922)
!2013 = !DILocation(line: 447, column: 10, scope: !1922)
!2014 = !DILocation(line: 447, column: 2, scope: !1922)
!2015 = !DILocation(line: 447, column: 22, scope: !1922)
!2016 = !DILocation(line: 447, column: 28, scope: !1922)
!2017 = !DILocation(line: 449, column: 2, scope: !1922)
!2018 = !DILocation(line: 451, column: 21, scope: !1922)
!2019 = !DILocation(line: 452, column: 1, scope: !1922)
!2020 = distinct !DISubprogram(name: "i2f", scope: !72, file: !72, line: 49, type: !2021, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1694)
!2021 = !DISubroutineType(types: !2022)
!2022 = !{!71, !7}
!2023 = !DILocalVariable(name: "i", arg: 1, scope: !2020, file: !72, line: 49, type: !7)
!2024 = !DILocation(line: 49, column: 23, scope: !2020)
!2025 = !DILocation(line: 51, column: 9, scope: !2020)
!2026 = !DILocation(line: 51, column: 11, scope: !2020)
!2027 = !DILocation(line: 51, column: 2, scope: !2020)
!2028 = distinct !DISubprogram(name: "init_player_stats_new_ship", linkageName: "_Z26init_player_stats_new_shipv", scope: !29, file: !29, line: 564, type: !961, scopeLine: 565, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1694)
!2029 = !DILocalVariable(name: "i", scope: !2028, file: !29, line: 566, type: !7)
!2030 = !DILocation(line: 566, column: 6, scope: !2028)
!2031 = !DILocation(line: 568, column: 6, scope: !2032)
!2032 = distinct !DILexicalBlock(scope: !2028, file: !29, line: 568, column: 6)
!2033 = !DILocation(line: 568, column: 20, scope: !2032)
!2034 = !DILocation(line: 570, column: 38, scope: !2035)
!2035 = distinct !DILexicalBlock(scope: !2032, file: !29, line: 569, column: 2)
!2036 = !DILocation(line: 570, column: 30, scope: !2035)
!2037 = !DILocation(line: 570, column: 50, scope: !2035)
!2038 = !DILocation(line: 570, column: 3, scope: !2035)
!2039 = !DILocation(line: 571, column: 3, scope: !2035)
!2040 = !DILocation(line: 572, column: 3, scope: !2035)
!2041 = !DILocation(line: 573, column: 2, scope: !2035)
!2042 = !DILocation(line: 575, column: 31, scope: !2028)
!2043 = !DILocation(line: 575, column: 10, scope: !2028)
!2044 = !DILocation(line: 575, column: 2, scope: !2028)
!2045 = !DILocation(line: 575, column: 22, scope: !2028)
!2046 = !DILocation(line: 575, column: 29, scope: !2028)
!2047 = !DILocation(line: 576, column: 32, scope: !2028)
!2048 = !DILocation(line: 576, column: 10, scope: !2028)
!2049 = !DILocation(line: 576, column: 2, scope: !2028)
!2050 = !DILocation(line: 576, column: 22, scope: !2028)
!2051 = !DILocation(line: 576, column: 30, scope: !2028)
!2052 = !DILocation(line: 577, column: 10, scope: !2028)
!2053 = !DILocation(line: 577, column: 2, scope: !2028)
!2054 = !DILocation(line: 577, column: 22, scope: !2028)
!2055 = !DILocation(line: 577, column: 34, scope: !2028)
!2056 = !DILocation(line: 578, column: 10, scope: !2028)
!2057 = !DILocation(line: 578, column: 2, scope: !2028)
!2058 = !DILocation(line: 578, column: 22, scope: !2028)
!2059 = !DILocation(line: 578, column: 36, scope: !2028)
!2060 = !DILocation(line: 579, column: 10, scope: !2028)
!2061 = !DILocation(line: 579, column: 2, scope: !2028)
!2062 = !DILocation(line: 579, column: 22, scope: !2028)
!2063 = !DILocation(line: 579, column: 40, scope: !2028)
!2064 = !DILocation(line: 581, column: 21, scope: !2028)
!2065 = !DILocation(line: 583, column: 9, scope: !2066)
!2066 = distinct !DILexicalBlock(scope: !2028, file: !29, line: 583, column: 2)
!2067 = !DILocation(line: 583, column: 7, scope: !2066)
!2068 = !DILocation(line: 583, column: 14, scope: !2069)
!2069 = distinct !DILexicalBlock(scope: !2066, file: !29, line: 583, column: 2)
!2070 = !DILocation(line: 583, column: 16, scope: !2069)
!2071 = !DILocation(line: 583, column: 2, scope: !2066)
!2072 = !DILocation(line: 585, column: 11, scope: !2073)
!2073 = distinct !DILexicalBlock(scope: !2069, file: !29, line: 584, column: 2)
!2074 = !DILocation(line: 585, column: 3, scope: !2073)
!2075 = !DILocation(line: 585, column: 23, scope: !2073)
!2076 = !DILocation(line: 585, column: 36, scope: !2073)
!2077 = !DILocation(line: 585, column: 39, scope: !2073)
!2078 = !DILocation(line: 586, column: 26, scope: !2073)
!2079 = !DILocation(line: 586, column: 3, scope: !2073)
!2080 = !DILocation(line: 586, column: 29, scope: !2073)
!2081 = !DILocation(line: 587, column: 2, scope: !2073)
!2082 = !DILocation(line: 583, column: 40, scope: !2069)
!2083 = !DILocation(line: 583, column: 2, scope: !2069)
!2084 = distinct !{!2084, !2071, !2085, !1721}
!2085 = !DILocation(line: 587, column: 2, scope: !2066)
!2086 = !DILocation(line: 589, column: 9, scope: !2087)
!2087 = distinct !DILexicalBlock(scope: !2028, file: !29, line: 589, column: 2)
!2088 = !DILocation(line: 589, column: 7, scope: !2087)
!2089 = !DILocation(line: 589, column: 14, scope: !2090)
!2090 = distinct !DILexicalBlock(scope: !2087, file: !29, line: 589, column: 2)
!2091 = !DILocation(line: 589, column: 16, scope: !2090)
!2092 = !DILocation(line: 589, column: 2, scope: !2087)
!2093 = !DILocation(line: 591, column: 11, scope: !2094)
!2094 = distinct !DILexicalBlock(scope: !2090, file: !29, line: 590, column: 2)
!2095 = !DILocation(line: 591, column: 3, scope: !2094)
!2096 = !DILocation(line: 591, column: 23, scope: !2094)
!2097 = !DILocation(line: 591, column: 38, scope: !2094)
!2098 = !DILocation(line: 591, column: 41, scope: !2094)
!2099 = !DILocation(line: 592, column: 28, scope: !2094)
!2100 = !DILocation(line: 592, column: 3, scope: !2094)
!2101 = !DILocation(line: 592, column: 31, scope: !2094)
!2102 = !DILocation(line: 593, column: 2, scope: !2094)
!2103 = !DILocation(line: 589, column: 42, scope: !2090)
!2104 = !DILocation(line: 589, column: 2, scope: !2090)
!2105 = distinct !{!2105, !2092, !2106, !1721}
!2106 = !DILocation(line: 593, column: 2, scope: !2087)
!2107 = !DILocation(line: 594, column: 52, scope: !2028)
!2108 = !DILocation(line: 594, column: 50, scope: !2028)
!2109 = !DILocation(line: 594, column: 42, scope: !2028)
!2110 = !DILocation(line: 594, column: 10, scope: !2028)
!2111 = !DILocation(line: 594, column: 2, scope: !2028)
!2112 = !DILocation(line: 594, column: 22, scope: !2028)
!2113 = !DILocation(line: 594, column: 40, scope: !2028)
!2114 = !DILocation(line: 596, column: 10, scope: !2028)
!2115 = !DILocation(line: 596, column: 2, scope: !2028)
!2116 = !DILocation(line: 596, column: 22, scope: !2028)
!2117 = !DILocation(line: 596, column: 43, scope: !2028)
!2118 = !DILocation(line: 597, column: 10, scope: !2028)
!2119 = !DILocation(line: 597, column: 2, scope: !2028)
!2120 = !DILocation(line: 597, column: 22, scope: !2028)
!2121 = !DILocation(line: 597, column: 45, scope: !2028)
!2122 = !DILocation(line: 599, column: 17, scope: !2028)
!2123 = !DILocation(line: 600, column: 19, scope: !2028)
!2124 = !DILocation(line: 602, column: 10, scope: !2028)
!2125 = !DILocation(line: 602, column: 2, scope: !2028)
!2126 = !DILocation(line: 602, column: 22, scope: !2028)
!2127 = !DILocation(line: 602, column: 28, scope: !2028)
!2128 = !DILocation(line: 613, column: 10, scope: !2028)
!2129 = !DILocation(line: 613, column: 2, scope: !2028)
!2130 = !DILocation(line: 613, column: 22, scope: !2028)
!2131 = !DILocation(line: 613, column: 33, scope: !2028)
!2132 = !DILocation(line: 614, column: 10, scope: !2028)
!2133 = !DILocation(line: 614, column: 2, scope: !2028)
!2134 = !DILocation(line: 614, column: 22, scope: !2028)
!2135 = !DILocation(line: 614, column: 40, scope: !2028)
!2136 = !DILocation(line: 616, column: 17, scope: !2028)
!2137 = !DILocation(line: 618, column: 10, scope: !2028)
!2138 = !DILocation(line: 618, column: 2, scope: !2028)
!2139 = !DILocation(line: 618, column: 22, scope: !2028)
!2140 = !DILocation(line: 618, column: 41, scope: !2028)
!2141 = !DILocation(line: 620, column: 29, scope: !2028)
!2142 = !DILocation(line: 621, column: 25, scope: !2028)
!2143 = !DILocation(line: 623, column: 43, scope: !2028)
!2144 = !DILocation(line: 623, column: 35, scope: !2028)
!2145 = !DILocation(line: 623, column: 55, scope: !2028)
!2146 = !DILocation(line: 623, column: 2, scope: !2028)
!2147 = !DILocation(line: 625, column: 17, scope: !2028)
!2148 = !DILocation(line: 651, column: 2, scope: !2028)
!2149 = !DILocation(line: 652, column: 1, scope: !2028)
!2150 = distinct !DISubprogram(name: "init_ammo_and_energy", linkageName: "_Z20init_ammo_and_energyv", scope: !29, file: !29, line: 454, type: !961, scopeLine: 455, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2)
!2151 = !DILocation(line: 484, column: 14, scope: !2152)
!2152 = distinct !DILexicalBlock(scope: !2150, file: !29, line: 484, column: 6)
!2153 = !DILocation(line: 484, column: 6, scope: !2152)
!2154 = !DILocation(line: 484, column: 26, scope: !2152)
!2155 = !DILocation(line: 484, column: 35, scope: !2152)
!2156 = !DILocation(line: 484, column: 33, scope: !2152)
!2157 = !DILocation(line: 485, column: 32, scope: !2152)
!2158 = !DILocation(line: 485, column: 11, scope: !2152)
!2159 = !DILocation(line: 485, column: 3, scope: !2152)
!2160 = !DILocation(line: 485, column: 23, scope: !2152)
!2161 = !DILocation(line: 485, column: 30, scope: !2152)
!2162 = !DILocation(line: 486, column: 14, scope: !2163)
!2163 = distinct !DILexicalBlock(scope: !2150, file: !29, line: 486, column: 6)
!2164 = !DILocation(line: 486, column: 6, scope: !2163)
!2165 = !DILocation(line: 486, column: 26, scope: !2163)
!2166 = !DILocation(line: 486, column: 36, scope: !2163)
!2167 = !DILocation(line: 486, column: 34, scope: !2163)
!2168 = !DILocation(line: 487, column: 33, scope: !2163)
!2169 = !DILocation(line: 487, column: 11, scope: !2163)
!2170 = !DILocation(line: 487, column: 3, scope: !2163)
!2171 = !DILocation(line: 487, column: 23, scope: !2163)
!2172 = !DILocation(line: 487, column: 31, scope: !2163)
!2173 = !DILocation(line: 489, column: 14, scope: !2174)
!2174 = distinct !DILexicalBlock(scope: !2150, file: !29, line: 489, column: 6)
!2175 = !DILocation(line: 489, column: 6, scope: !2174)
!2176 = !DILocation(line: 489, column: 26, scope: !2174)
!2177 = !DILocation(line: 489, column: 56, scope: !2174)
!2178 = !DILocation(line: 489, column: 54, scope: !2174)
!2179 = !DILocation(line: 489, column: 44, scope: !2174)
!2180 = !DILocation(line: 490, column: 53, scope: !2174)
!2181 = !DILocation(line: 490, column: 51, scope: !2174)
!2182 = !DILocation(line: 490, column: 43, scope: !2174)
!2183 = !DILocation(line: 490, column: 11, scope: !2174)
!2184 = !DILocation(line: 490, column: 3, scope: !2174)
!2185 = !DILocation(line: 490, column: 23, scope: !2174)
!2186 = !DILocation(line: 490, column: 41, scope: !2174)
!2187 = !DILocation(line: 491, column: 1, scope: !2150)
!2188 = distinct !DISubprogram(name: "init_player_stats_level", linkageName: "_Z23init_player_stats_leveli", scope: !29, file: !29, line: 496, type: !970, scopeLine: 497, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1694)
!2189 = !DILocalVariable(name: "secret_flag", arg: 1, scope: !2188, file: !29, line: 496, type: !7)
!2190 = !DILocation(line: 496, column: 34, scope: !2188)
!2191 = !DILocation(line: 500, column: 43, scope: !2188)
!2192 = !DILocation(line: 500, column: 35, scope: !2188)
!2193 = !DILocation(line: 500, column: 55, scope: !2188)
!2194 = !DILocation(line: 500, column: 10, scope: !2188)
!2195 = !DILocation(line: 500, column: 2, scope: !2188)
!2196 = !DILocation(line: 500, column: 22, scope: !2188)
!2197 = !DILocation(line: 500, column: 33, scope: !2188)
!2198 = !DILocation(line: 502, column: 30, scope: !2188)
!2199 = !DILocation(line: 502, column: 10, scope: !2188)
!2200 = !DILocation(line: 502, column: 2, scope: !2188)
!2201 = !DILocation(line: 502, column: 22, scope: !2188)
!2202 = !DILocation(line: 502, column: 28, scope: !2188)
!2203 = !DILocation(line: 508, column: 11, scope: !2204)
!2204 = distinct !DILexicalBlock(scope: !2188, file: !29, line: 507, column: 2)
!2205 = !DILocation(line: 508, column: 3, scope: !2204)
!2206 = !DILocation(line: 508, column: 23, scope: !2204)
!2207 = !DILocation(line: 508, column: 34, scope: !2204)
!2208 = !DILocation(line: 509, column: 11, scope: !2204)
!2209 = !DILocation(line: 509, column: 3, scope: !2204)
!2210 = !DILocation(line: 509, column: 23, scope: !2204)
!2211 = !DILocation(line: 509, column: 35, scope: !2204)
!2212 = !DILocation(line: 512, column: 10, scope: !2188)
!2213 = !DILocation(line: 512, column: 2, scope: !2188)
!2214 = !DILocation(line: 512, column: 22, scope: !2188)
!2215 = !DILocation(line: 512, column: 36, scope: !2188)
!2216 = !DILocation(line: 514, column: 10, scope: !2188)
!2217 = !DILocation(line: 514, column: 2, scope: !2188)
!2218 = !DILocation(line: 514, column: 22, scope: !2188)
!2219 = !DILocation(line: 514, column: 38, scope: !2188)
!2220 = !DILocation(line: 515, column: 41, scope: !2188)
!2221 = !DILocation(line: 515, column: 10, scope: !2188)
!2222 = !DILocation(line: 515, column: 2, scope: !2188)
!2223 = !DILocation(line: 515, column: 22, scope: !2188)
!2224 = !DILocation(line: 515, column: 39, scope: !2188)
!2225 = !DILocation(line: 516, column: 50, scope: !2188)
!2226 = !DILocation(line: 516, column: 42, scope: !2188)
!2227 = !DILocation(line: 516, column: 62, scope: !2188)
!2228 = !DILocation(line: 516, column: 10, scope: !2188)
!2229 = !DILocation(line: 516, column: 2, scope: !2188)
!2230 = !DILocation(line: 516, column: 22, scope: !2188)
!2231 = !DILocation(line: 516, column: 39, scope: !2188)
!2232 = !DILocation(line: 518, column: 39, scope: !2188)
!2233 = !DILocation(line: 518, column: 10, scope: !2188)
!2234 = !DILocation(line: 518, column: 2, scope: !2188)
!2235 = !DILocation(line: 518, column: 22, scope: !2188)
!2236 = !DILocation(line: 518, column: 37, scope: !2188)
!2237 = !DILocation(line: 519, column: 48, scope: !2188)
!2238 = !DILocation(line: 519, column: 40, scope: !2188)
!2239 = !DILocation(line: 519, column: 60, scope: !2188)
!2240 = !DILocation(line: 519, column: 10, scope: !2188)
!2241 = !DILocation(line: 519, column: 2, scope: !2188)
!2242 = !DILocation(line: 519, column: 22, scope: !2188)
!2243 = !DILocation(line: 519, column: 37, scope: !2188)
!2244 = !DILocation(line: 520, column: 10, scope: !2188)
!2245 = !DILocation(line: 520, column: 2, scope: !2188)
!2246 = !DILocation(line: 520, column: 22, scope: !2188)
!2247 = !DILocation(line: 520, column: 40, scope: !2188)
!2248 = !DILocation(line: 522, column: 7, scope: !2249)
!2249 = distinct !DILexicalBlock(scope: !2188, file: !29, line: 522, column: 6)
!2250 = !DILocation(line: 522, column: 6, scope: !2249)
!2251 = !DILocation(line: 524, column: 3, scope: !2252)
!2252 = distinct !DILexicalBlock(scope: !2249, file: !29, line: 523, column: 2)
!2253 = !DILocation(line: 526, column: 11, scope: !2252)
!2254 = !DILocation(line: 526, column: 3, scope: !2252)
!2255 = !DILocation(line: 526, column: 23, scope: !2252)
!2256 = !DILocation(line: 526, column: 29, scope: !2252)
!2257 = !DILocation(line: 527, column: 11, scope: !2252)
!2258 = !DILocation(line: 527, column: 3, scope: !2252)
!2259 = !DILocation(line: 527, column: 23, scope: !2252)
!2260 = !DILocation(line: 527, column: 29, scope: !2252)
!2261 = !DILocation(line: 528, column: 11, scope: !2252)
!2262 = !DILocation(line: 528, column: 3, scope: !2252)
!2263 = !DILocation(line: 528, column: 23, scope: !2252)
!2264 = !DILocation(line: 528, column: 29, scope: !2252)
!2265 = !DILocation(line: 530, column: 11, scope: !2252)
!2266 = !DILocation(line: 530, column: 3, scope: !2252)
!2267 = !DILocation(line: 530, column: 23, scope: !2252)
!2268 = !DILocation(line: 530, column: 29, scope: !2252)
!2269 = !DILocation(line: 534, column: 11, scope: !2252)
!2270 = !DILocation(line: 534, column: 3, scope: !2252)
!2271 = !DILocation(line: 534, column: 23, scope: !2252)
!2272 = !DILocation(line: 534, column: 34, scope: !2252)
!2273 = !DILocation(line: 535, column: 11, scope: !2252)
!2274 = !DILocation(line: 535, column: 3, scope: !2252)
!2275 = !DILocation(line: 535, column: 23, scope: !2252)
!2276 = !DILocation(line: 535, column: 41, scope: !2252)
!2277 = !DILocation(line: 537, column: 8, scope: !2278)
!2278 = distinct !DILexicalBlock(scope: !2252, file: !29, line: 537, column: 7)
!2279 = !DILocation(line: 537, column: 18, scope: !2278)
!2280 = !DILocation(line: 537, column: 7, scope: !2278)
!2281 = !DILocation(line: 537, column: 30, scope: !2278)
!2282 = !DILocation(line: 537, column: 35, scope: !2278)
!2283 = !DILocation(line: 537, column: 45, scope: !2278)
!2284 = !DILocation(line: 537, column: 34, scope: !2278)
!2285 = !DILocation(line: 538, column: 12, scope: !2278)
!2286 = !DILocation(line: 538, column: 4, scope: !2278)
!2287 = !DILocation(line: 538, column: 24, scope: !2278)
!2288 = !DILocation(line: 538, column: 30, scope: !2278)
!2289 = !DILocation(line: 539, column: 2, scope: !2252)
!2290 = !DILocation(line: 541, column: 17, scope: !2188)
!2291 = !DILocation(line: 542, column: 10, scope: !2188)
!2292 = !DILocation(line: 542, column: 2, scope: !2188)
!2293 = !DILocation(line: 542, column: 22, scope: !2188)
!2294 = !DILocation(line: 542, column: 41, scope: !2188)
!2295 = !DILocation(line: 544, column: 49, scope: !2188)
!2296 = !DILocation(line: 544, column: 47, scope: !2188)
!2297 = !DILocation(line: 544, column: 24, scope: !2188)
!2298 = !DILocation(line: 546, column: 29, scope: !2188)
!2299 = !DILocation(line: 547, column: 25, scope: !2188)
!2300 = !DILocation(line: 549, column: 43, scope: !2188)
!2301 = !DILocation(line: 549, column: 35, scope: !2188)
!2302 = !DILocation(line: 549, column: 55, scope: !2188)
!2303 = !DILocation(line: 549, column: 2, scope: !2188)
!2304 = !DILocation(line: 551, column: 2, scope: !2188)
!2305 = !DILocation(line: 558, column: 17, scope: !2188)
!2306 = !DILocation(line: 559, column: 1, scope: !2188)
!2307 = distinct !DISubprogram(name: "reset_network_objects", linkageName: "_Z21reset_network_objectsv", scope: !29, file: !29, line: 654, type: !961, scopeLine: 655, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2)
!2308 = !DILocation(line: 661, column: 1, scope: !2307)
!2309 = distinct !DISubprogram(name: "DoGameOver", linkageName: "_Z10DoGameOverv", scope: !29, file: !29, line: 712, type: !961, scopeLine: 713, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2)
!2310 = !DILocation(line: 716, column: 6, scope: !2311)
!2311 = distinct !DILexicalBlock(scope: !2309, file: !29, line: 716, column: 6)
!2312 = !DILocation(line: 716, column: 26, scope: !2311)
!2313 = !DILocation(line: 717, column: 3, scope: !2311)
!2314 = !DILocation(line: 719, column: 16, scope: !2309)
!2315 = !DILocation(line: 720, column: 12, scope: !2309)
!2316 = !DILocation(line: 721, column: 2, scope: !2309)
!2317 = distinct !DISubprogram(name: "update_player_stats", linkageName: "_Z19update_player_statsv", scope: !29, file: !29, line: 728, type: !961, scopeLine: 729, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2)
!2318 = !DILocation(line: 757, column: 36, scope: !2317)
!2319 = !DILocation(line: 757, column: 10, scope: !2317)
!2320 = !DILocation(line: 757, column: 2, scope: !2317)
!2321 = !DILocation(line: 757, column: 22, scope: !2317)
!2322 = !DILocation(line: 757, column: 33, scope: !2317)
!2323 = !DILocation(line: 758, column: 14, scope: !2324)
!2324 = distinct !DILexicalBlock(scope: !2317, file: !29, line: 758, column: 6)
!2325 = !DILocation(line: 758, column: 6, scope: !2324)
!2326 = !DILocation(line: 758, column: 26, scope: !2324)
!2327 = !DILocation(line: 758, column: 39, scope: !2324)
!2328 = !DILocation(line: 758, column: 37, scope: !2324)
!2329 = !DILocation(line: 760, column: 37, scope: !2330)
!2330 = distinct !DILexicalBlock(scope: !2324, file: !29, line: 759, column: 2)
!2331 = !DILocation(line: 760, column: 11, scope: !2330)
!2332 = !DILocation(line: 760, column: 3, scope: !2330)
!2333 = !DILocation(line: 760, column: 23, scope: !2330)
!2334 = !DILocation(line: 760, column: 34, scope: !2330)
!2335 = !DILocation(line: 761, column: 11, scope: !2330)
!2336 = !DILocation(line: 761, column: 3, scope: !2330)
!2337 = !DILocation(line: 761, column: 23, scope: !2330)
!2338 = !DILocation(line: 761, column: 34, scope: !2330)
!2339 = !DILocation(line: 762, column: 2, scope: !2330)
!2340 = !DILocation(line: 764, column: 36, scope: !2317)
!2341 = !DILocation(line: 764, column: 10, scope: !2317)
!2342 = !DILocation(line: 764, column: 2, scope: !2317)
!2343 = !DILocation(line: 764, column: 22, scope: !2317)
!2344 = !DILocation(line: 764, column: 33, scope: !2317)
!2345 = !DILocation(line: 765, column: 14, scope: !2346)
!2346 = distinct !DILexicalBlock(scope: !2317, file: !29, line: 765, column: 6)
!2347 = !DILocation(line: 765, column: 6, scope: !2346)
!2348 = !DILocation(line: 765, column: 26, scope: !2346)
!2349 = !DILocation(line: 765, column: 39, scope: !2346)
!2350 = !DILocation(line: 765, column: 37, scope: !2346)
!2351 = !DILocation(line: 767, column: 37, scope: !2352)
!2352 = distinct !DILexicalBlock(scope: !2346, file: !29, line: 766, column: 2)
!2353 = !DILocation(line: 767, column: 11, scope: !2352)
!2354 = !DILocation(line: 767, column: 3, scope: !2352)
!2355 = !DILocation(line: 767, column: 23, scope: !2352)
!2356 = !DILocation(line: 767, column: 34, scope: !2352)
!2357 = !DILocation(line: 768, column: 11, scope: !2352)
!2358 = !DILocation(line: 768, column: 3, scope: !2352)
!2359 = !DILocation(line: 768, column: 23, scope: !2352)
!2360 = !DILocation(line: 768, column: 34, scope: !2352)
!2361 = !DILocation(line: 769, column: 2, scope: !2352)
!2362 = !DILocation(line: 770, column: 1, scope: !2317)
!2363 = distinct !DISubprogram(name: "set_sound_sources", linkageName: "_Z17set_sound_sourcesv", scope: !29, file: !29, line: 776, type: !961, scopeLine: 777, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1694)
!2364 = !DILocalVariable(name: "segnum", scope: !2363, file: !29, line: 778, type: !7)
!2365 = !DILocation(line: 778, column: 6, scope: !2363)
!2366 = !DILocalVariable(name: "sidenum", scope: !2363, file: !29, line: 778, type: !7)
!2367 = !DILocation(line: 778, column: 14, scope: !2363)
!2368 = !DILocalVariable(name: "seg", scope: !2363, file: !29, line: 779, type: !2369)
!2369 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2370, size: 64)
!2370 = !DIDerivedType(tag: DW_TAG_typedef, name: "segment", file: !2371, line: 123, baseType: !2372)
!2371 = !DIFile(filename: "main_d2/segment.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "c950815a9b07e6bab2fa2587b90affec")
!2372 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "segment", file: !2371, line: 100, size: 4096, flags: DIFlagTypePassByValue, elements: !2373, identifier: "_ZTS7segment")
!2373 = !{!2374, !2394, !2396, !2398}
!2374 = !DIDerivedType(tag: DW_TAG_member, name: "sides", scope: !2372, file: !2371, line: 105, baseType: !2375, size: 3840)
!2375 = !DICompositeType(tag: DW_TAG_array_type, baseType: !2376, size: 3840, elements: !197)
!2376 = !DIDerivedType(tag: DW_TAG_typedef, name: "side", file: !2371, line: 91, baseType: !2377)
!2377 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "side", file: !2371, line: 82, size: 640, flags: DIFlagTypePassByValue, elements: !2378, identifier: "_ZTS4side")
!2378 = !{!2379, !2380, !2381, !2382, !2383, !2384, !2392}
!2379 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !2377, file: !2371, line: 84, baseType: !60, size: 8)
!2380 = !DIDerivedType(tag: DW_TAG_member, name: "pad", scope: !2377, file: !2371, line: 85, baseType: !17, size: 8, offset: 8)
!2381 = !DIDerivedType(tag: DW_TAG_member, name: "wall_num", scope: !2377, file: !2371, line: 86, baseType: !20, size: 16, offset: 16)
!2382 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_num", scope: !2377, file: !2371, line: 87, baseType: !20, size: 16, offset: 32)
!2383 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_num2", scope: !2377, file: !2371, line: 88, baseType: !20, size: 16, offset: 48)
!2384 = !DIDerivedType(tag: DW_TAG_member, name: "uvls", scope: !2377, file: !2371, line: 89, baseType: !2385, size: 384, offset: 64)
!2385 = !DICompositeType(tag: DW_TAG_array_type, baseType: !2386, size: 384, elements: !56)
!2386 = !DIDerivedType(tag: DW_TAG_typedef, name: "uvl", file: !2371, line: 67, baseType: !2387)
!2387 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uvl", file: !2371, line: 64, size: 96, flags: DIFlagTypePassByValue, elements: !2388, identifier: "_ZTS3uvl")
!2388 = !{!2389, !2390, !2391}
!2389 = !DIDerivedType(tag: DW_TAG_member, name: "u", scope: !2387, file: !2371, line: 66, baseType: !71, size: 32)
!2390 = !DIDerivedType(tag: DW_TAG_member, name: "v", scope: !2387, file: !2371, line: 66, baseType: !71, size: 32, offset: 32)
!2391 = !DIDerivedType(tag: DW_TAG_member, name: "l", scope: !2387, file: !2371, line: 66, baseType: !71, size: 32, offset: 64)
!2392 = !DIDerivedType(tag: DW_TAG_member, name: "normals", scope: !2377, file: !2371, line: 90, baseType: !2393, size: 192, offset: 448)
!2393 = !DICompositeType(tag: DW_TAG_array_type, baseType: !119, size: 192, elements: !256)
!2394 = !DIDerivedType(tag: DW_TAG_member, name: "children", scope: !2372, file: !2371, line: 106, baseType: !2395, size: 96, offset: 3840)
!2395 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 96, elements: !197)
!2396 = !DIDerivedType(tag: DW_TAG_member, name: "verts", scope: !2372, file: !2371, line: 107, baseType: !2397, size: 128, offset: 3936)
!2397 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 128, elements: !134)
!2398 = !DIDerivedType(tag: DW_TAG_member, name: "objects", scope: !2372, file: !2371, line: 112, baseType: !7, size: 32, offset: 4064)
!2399 = !DILocation(line: 779, column: 11, scope: !2363)
!2400 = !DILocation(line: 781, column: 2, scope: !2363)
!2401 = !DILocation(line: 783, column: 27, scope: !2363)
!2402 = !DILocation(line: 785, column: 11, scope: !2403)
!2403 = distinct !DILexicalBlock(scope: !2363, file: !29, line: 785, column: 2)
!2404 = !DILocation(line: 785, column: 34, scope: !2403)
!2405 = !DILocation(line: 785, column: 7, scope: !2403)
!2406 = !DILocation(line: 785, column: 39, scope: !2407)
!2407 = distinct !DILexicalBlock(scope: !2403, file: !29, line: 785, column: 2)
!2408 = !DILocation(line: 785, column: 49, scope: !2407)
!2409 = !DILocation(line: 785, column: 46, scope: !2407)
!2410 = !DILocation(line: 785, column: 2, scope: !2403)
!2411 = !DILocation(line: 786, column: 16, scope: !2412)
!2412 = distinct !DILexicalBlock(scope: !2407, file: !29, line: 786, column: 3)
!2413 = !DILocation(line: 786, column: 8, scope: !2412)
!2414 = !DILocation(line: 786, column: 21, scope: !2415)
!2415 = distinct !DILexicalBlock(scope: !2412, file: !29, line: 786, column: 3)
!2416 = !DILocation(line: 786, column: 29, scope: !2415)
!2417 = !DILocation(line: 786, column: 3, scope: !2412)
!2418 = !DILocalVariable(name: "tm", scope: !2419, file: !29, line: 788, type: !7)
!2419 = distinct !DILexicalBlock(scope: !2415, file: !29, line: 787, column: 3)
!2420 = !DILocation(line: 788, column: 8, scope: !2419)
!2421 = !DILocalVariable(name: "ec", scope: !2419, file: !29, line: 788, type: !7)
!2422 = !DILocation(line: 788, column: 12, scope: !2419)
!2423 = !DILocalVariable(name: "sn", scope: !2419, file: !29, line: 788, type: !7)
!2424 = !DILocation(line: 788, column: 16, scope: !2419)
!2425 = !DILocation(line: 790, column: 8, scope: !2426)
!2426 = distinct !DILexicalBlock(scope: !2419, file: !29, line: 790, column: 8)
!2427 = !DILocation(line: 790, column: 38, scope: !2426)
!2428 = !DILocation(line: 791, column: 17, scope: !2429)
!2429 = distinct !DILexicalBlock(scope: !2426, file: !29, line: 791, column: 9)
!2430 = !DILocation(line: 791, column: 22, scope: !2429)
!2431 = !DILocation(line: 791, column: 28, scope: !2429)
!2432 = !DILocation(line: 791, column: 37, scope: !2429)
!2433 = !DILocation(line: 791, column: 15, scope: !2429)
!2434 = !DILocation(line: 791, column: 48, scope: !2429)
!2435 = !DILocation(line: 791, column: 54, scope: !2429)
!2436 = !DILocation(line: 791, column: 73, scope: !2429)
!2437 = !DILocation(line: 791, column: 76, scope: !2429)
!2438 = !DILocation(line: 791, column: 64, scope: !2429)
!2439 = !DILocation(line: 791, column: 86, scope: !2429)
!2440 = !DILocation(line: 791, column: 62, scope: !2429)
!2441 = !DILocation(line: 791, column: 97, scope: !2429)
!2442 = !DILocation(line: 791, column: 105, scope: !2429)
!2443 = !DILocation(line: 791, column: 124, scope: !2429)
!2444 = !DILocation(line: 791, column: 129, scope: !2429)
!2445 = !DILocation(line: 791, column: 135, scope: !2429)
!2446 = !DILocation(line: 791, column: 144, scope: !2429)
!2447 = !DILocation(line: 791, column: 115, scope: !2429)
!2448 = !DILocation(line: 791, column: 154, scope: !2429)
!2449 = !DILocation(line: 791, column: 113, scope: !2429)
!2450 = !DILocation(line: 791, column: 165, scope: !2429)
!2451 = !DILocation(line: 792, column: 24, scope: !2452)
!2452 = distinct !DILexicalBlock(scope: !2429, file: !29, line: 792, column: 10)
!2453 = !DILocation(line: 792, column: 16, scope: !2452)
!2454 = !DILocation(line: 792, column: 28, scope: !2452)
!2455 = !DILocation(line: 792, column: 14, scope: !2452)
!2456 = !DILocation(line: 792, column: 39, scope: !2452)
!2457 = !DILocalVariable(name: "pnt", scope: !2458, file: !29, line: 794, type: !119)
!2458 = distinct !DILexicalBlock(scope: !2452, file: !29, line: 793, column: 6)
!2459 = !DILocation(line: 794, column: 18, scope: !2458)
!2460 = !DILocalVariable(name: "csegnum", scope: !2458, file: !29, line: 795, type: !7)
!2461 = !DILocation(line: 795, column: 11, scope: !2458)
!2462 = !DILocation(line: 795, column: 21, scope: !2458)
!2463 = !DILocation(line: 795, column: 26, scope: !2458)
!2464 = !DILocation(line: 795, column: 35, scope: !2458)
!2465 = !DILocation(line: 802, column: 11, scope: !2466)
!2466 = distinct !DILexicalBlock(scope: !2458, file: !29, line: 802, column: 11)
!2467 = !DILocation(line: 802, column: 29, scope: !2466)
!2468 = !DILocation(line: 802, column: 32, scope: !2466)
!2469 = !DILocation(line: 802, column: 42, scope: !2466)
!2470 = !DILocation(line: 802, column: 40, scope: !2466)
!2471 = !DILocation(line: 804, column: 12, scope: !2472)
!2472 = distinct !DILexicalBlock(scope: !2473, file: !29, line: 804, column: 12)
!2473 = distinct !DILexicalBlock(scope: !2466, file: !29, line: 803, column: 7)
!2474 = !DILocation(line: 804, column: 42, scope: !2472)
!2475 = !DILocalVariable(name: "csegp", scope: !2476, file: !29, line: 806, type: !2369)
!2476 = distinct !DILexicalBlock(scope: !2472, file: !29, line: 805, column: 8)
!2477 = !DILocation(line: 806, column: 18, scope: !2476)
!2478 = !DILocalVariable(name: "csidenum", scope: !2476, file: !29, line: 807, type: !7)
!2479 = !DILocation(line: 807, column: 13, scope: !2476)
!2480 = !DILocation(line: 809, column: 27, scope: !2476)
!2481 = !DILocation(line: 809, column: 32, scope: !2476)
!2482 = !DILocation(line: 809, column: 41, scope: !2476)
!2483 = !DILocation(line: 809, column: 18, scope: !2476)
!2484 = !DILocation(line: 809, column: 15, scope: !2476)
!2485 = !DILocation(line: 810, column: 38, scope: !2476)
!2486 = !DILocation(line: 810, column: 43, scope: !2476)
!2487 = !DILocation(line: 810, column: 20, scope: !2476)
!2488 = !DILocation(line: 810, column: 18, scope: !2476)
!2489 = !DILocation(line: 812, column: 13, scope: !2490)
!2490 = distinct !DILexicalBlock(scope: !2476, file: !29, line: 812, column: 13)
!2491 = !DILocation(line: 812, column: 20, scope: !2490)
!2492 = !DILocation(line: 812, column: 26, scope: !2490)
!2493 = !DILocation(line: 812, column: 36, scope: !2490)
!2494 = !DILocation(line: 812, column: 49, scope: !2490)
!2495 = !DILocation(line: 812, column: 54, scope: !2490)
!2496 = !DILocation(line: 812, column: 60, scope: !2490)
!2497 = !DILocation(line: 812, column: 69, scope: !2490)
!2498 = !DILocation(line: 812, column: 46, scope: !2490)
!2499 = !DILocation(line: 813, column: 10, scope: !2490)
!2500 = !DILocation(line: 814, column: 8, scope: !2476)
!2501 = !DILocation(line: 815, column: 7, scope: !2473)
!2502 = !DILocation(line: 817, column: 42, scope: !2458)
!2503 = !DILocation(line: 817, column: 47, scope: !2458)
!2504 = !DILocation(line: 817, column: 7, scope: !2458)
!2505 = !DILocation(line: 818, column: 30, scope: !2458)
!2506 = !DILocation(line: 818, column: 34, scope: !2458)
!2507 = !DILocation(line: 818, column: 42, scope: !2458)
!2508 = !DILocation(line: 818, column: 7, scope: !2458)
!2509 = !DILocation(line: 819, column: 6, scope: !2458)
!2510 = !DILocation(line: 792, column: 43, scope: !2452)
!2511 = !DILocation(line: 791, column: 170, scope: !2429)
!2512 = !DILocation(line: 820, column: 3, scope: !2419)
!2513 = !DILocation(line: 786, column: 61, scope: !2415)
!2514 = !DILocation(line: 786, column: 3, scope: !2415)
!2515 = distinct !{!2515, !2417, !2516, !1721}
!2516 = !DILocation(line: 820, column: 3, scope: !2412)
!2517 = !DILocation(line: 785, column: 75, scope: !2407)
!2518 = !DILocation(line: 785, column: 85, scope: !2407)
!2519 = !DILocation(line: 785, column: 2, scope: !2407)
!2520 = distinct !{!2520, !2410, !2521, !1721}
!2521 = !DILocation(line: 820, column: 3, scope: !2403)
!2522 = !DILocation(line: 822, column: 27, scope: !2363)
!2523 = !DILocation(line: 824, column: 1, scope: !2363)
!2524 = distinct !DISubprogram(name: "create_player_appearance_effect", linkageName: "_Z31create_player_appearance_effectP6object", scope: !29, file: !29, line: 831, type: !2525, scopeLine: 832, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1694)
!2525 = !DISubroutineType(types: !2526)
!2526 = !{null, !2527}
!2527 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2528, size: 64)
!2528 = !DIDerivedType(tag: DW_TAG_typedef, name: "object", file: !115, line: 259, baseType: !2529)
!2529 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "object", file: !115, line: 210, size: 2144, flags: DIFlagTypePassByValue, elements: !2530, identifier: "_ZTS6object")
!2530 = !{!2531, !2532, !2533, !2534, !2535, !2536, !2537, !2538, !2539, !2540, !2541, !2542, !2543, !2544, !2545, !2546, !2547, !2548, !2549, !2550, !2551, !2552, !2570, !2622}
!2531 = !DIDerivedType(tag: DW_TAG_member, name: "signature", scope: !2529, file: !115, line: 212, baseType: !7, size: 32)
!2532 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !2529, file: !115, line: 213, baseType: !17, size: 8, offset: 32)
!2533 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !2529, file: !115, line: 214, baseType: !17, size: 8, offset: 40)
!2534 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !2529, file: !115, line: 215, baseType: !20, size: 16, offset: 48)
!2535 = !DIDerivedType(tag: DW_TAG_member, name: "prev", scope: !2529, file: !115, line: 215, baseType: !20, size: 16, offset: 64)
!2536 = !DIDerivedType(tag: DW_TAG_member, name: "control_type", scope: !2529, file: !115, line: 216, baseType: !17, size: 8, offset: 80)
!2537 = !DIDerivedType(tag: DW_TAG_member, name: "movement_type", scope: !2529, file: !115, line: 217, baseType: !17, size: 8, offset: 88)
!2538 = !DIDerivedType(tag: DW_TAG_member, name: "render_type", scope: !2529, file: !115, line: 218, baseType: !17, size: 8, offset: 96)
!2539 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !2529, file: !115, line: 219, baseType: !17, size: 8, offset: 104)
!2540 = !DIDerivedType(tag: DW_TAG_member, name: "segnum", scope: !2529, file: !115, line: 220, baseType: !20, size: 16, offset: 112)
!2541 = !DIDerivedType(tag: DW_TAG_member, name: "attached_obj", scope: !2529, file: !115, line: 221, baseType: !20, size: 16, offset: 128)
!2542 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !2529, file: !115, line: 222, baseType: !119, size: 96, offset: 160)
!2543 = !DIDerivedType(tag: DW_TAG_member, name: "orient", scope: !2529, file: !115, line: 223, baseType: !127, size: 288, offset: 256)
!2544 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !2529, file: !115, line: 224, baseType: !71, size: 32, offset: 544)
!2545 = !DIDerivedType(tag: DW_TAG_member, name: "shields", scope: !2529, file: !115, line: 225, baseType: !71, size: 32, offset: 576)
!2546 = !DIDerivedType(tag: DW_TAG_member, name: "last_pos", scope: !2529, file: !115, line: 226, baseType: !119, size: 96, offset: 608)
!2547 = !DIDerivedType(tag: DW_TAG_member, name: "contains_type", scope: !2529, file: !115, line: 227, baseType: !60, size: 8, offset: 704)
!2548 = !DIDerivedType(tag: DW_TAG_member, name: "contains_id", scope: !2529, file: !115, line: 228, baseType: !60, size: 8, offset: 712)
!2549 = !DIDerivedType(tag: DW_TAG_member, name: "contains_count", scope: !2529, file: !115, line: 229, baseType: !60, size: 8, offset: 720)
!2550 = !DIDerivedType(tag: DW_TAG_member, name: "matcen_creator", scope: !2529, file: !115, line: 230, baseType: !60, size: 8, offset: 728)
!2551 = !DIDerivedType(tag: DW_TAG_member, name: "lifeleft", scope: !2529, file: !115, line: 231, baseType: !71, size: 32, offset: 736)
!2552 = !DIDerivedType(tag: DW_TAG_member, name: "mtype", scope: !2529, file: !115, line: 240, baseType: !2553, size: 512, offset: 768)
!2553 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !2529, file: !115, line: 236, size: 512, flags: DIFlagTypePassByValue, elements: !2554, identifier: "_ZTSN6objectUt_E")
!2554 = !{!2555, !2569}
!2555 = !DIDerivedType(tag: DW_TAG_member, name: "phys_info", scope: !2553, file: !115, line: 238, baseType: !2556, size: 512)
!2556 = !DIDerivedType(tag: DW_TAG_typedef, name: "physics_info", file: !115, line: 153, baseType: !2557)
!2557 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "physics_info", file: !115, line: 142, size: 512, flags: DIFlagTypePassByValue, elements: !2558, identifier: "_ZTS12physics_info")
!2558 = !{!2559, !2560, !2561, !2562, !2563, !2564, !2565, !2566, !2568}
!2559 = !DIDerivedType(tag: DW_TAG_member, name: "velocity", scope: !2557, file: !115, line: 144, baseType: !119, size: 96)
!2560 = !DIDerivedType(tag: DW_TAG_member, name: "thrust", scope: !2557, file: !115, line: 145, baseType: !119, size: 96, offset: 96)
!2561 = !DIDerivedType(tag: DW_TAG_member, name: "mass", scope: !2557, file: !115, line: 146, baseType: !71, size: 32, offset: 192)
!2562 = !DIDerivedType(tag: DW_TAG_member, name: "drag", scope: !2557, file: !115, line: 147, baseType: !71, size: 32, offset: 224)
!2563 = !DIDerivedType(tag: DW_TAG_member, name: "brakes", scope: !2557, file: !115, line: 148, baseType: !71, size: 32, offset: 256)
!2564 = !DIDerivedType(tag: DW_TAG_member, name: "rotvel", scope: !2557, file: !115, line: 149, baseType: !119, size: 96, offset: 288)
!2565 = !DIDerivedType(tag: DW_TAG_member, name: "rotthrust", scope: !2557, file: !115, line: 150, baseType: !119, size: 96, offset: 384)
!2566 = !DIDerivedType(tag: DW_TAG_member, name: "turnroll", scope: !2557, file: !115, line: 151, baseType: !2567, size: 16, offset: 480)
!2567 = !DIDerivedType(tag: DW_TAG_typedef, name: "fixang", file: !72, line: 21, baseType: !20)
!2568 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !2557, file: !115, line: 152, baseType: !13, size: 16, offset: 496)
!2569 = !DIDerivedType(tag: DW_TAG_member, name: "spin_rate", scope: !2553, file: !115, line: 239, baseType: !119, size: 96)
!2570 = !DIDerivedType(tag: DW_TAG_member, name: "ctype", scope: !2529, file: !115, line: 250, baseType: !2571, size: 256, offset: 1280)
!2571 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !2529, file: !115, line: 243, size: 256, flags: DIFlagTypePassByValue, elements: !2572, identifier: "_ZTSN6objectUt0_E")
!2572 = !{!2573, !2584, !2594, !2610, !2615}
!2573 = !DIDerivedType(tag: DW_TAG_member, name: "laser_info", scope: !2571, file: !115, line: 245, baseType: !2574, size: 160)
!2574 = !DIDerivedType(tag: DW_TAG_typedef, name: "laser_info_t", file: !115, line: 166, baseType: !2575)
!2575 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "laser_info_s", file: !115, line: 157, size: 160, flags: DIFlagTypePassByValue, elements: !2576, identifier: "_ZTS12laser_info_s")
!2576 = !{!2577, !2578, !2579, !2580, !2581, !2582, !2583}
!2577 = !DIDerivedType(tag: DW_TAG_member, name: "parent_type", scope: !2575, file: !115, line: 159, baseType: !20, size: 16)
!2578 = !DIDerivedType(tag: DW_TAG_member, name: "parent_num", scope: !2575, file: !115, line: 160, baseType: !20, size: 16, offset: 16)
!2579 = !DIDerivedType(tag: DW_TAG_member, name: "parent_signature", scope: !2575, file: !115, line: 161, baseType: !7, size: 32, offset: 32)
!2580 = !DIDerivedType(tag: DW_TAG_member, name: "creation_time", scope: !2575, file: !115, line: 162, baseType: !71, size: 32, offset: 64)
!2581 = !DIDerivedType(tag: DW_TAG_member, name: "last_hitobj", scope: !2575, file: !115, line: 163, baseType: !20, size: 16, offset: 96)
!2582 = !DIDerivedType(tag: DW_TAG_member, name: "track_goal", scope: !2575, file: !115, line: 164, baseType: !20, size: 16, offset: 112)
!2583 = !DIDerivedType(tag: DW_TAG_member, name: "multiplier", scope: !2575, file: !115, line: 165, baseType: !71, size: 32, offset: 128)
!2584 = !DIDerivedType(tag: DW_TAG_member, name: "expl_info", scope: !2571, file: !115, line: 246, baseType: !2585, size: 128)
!2585 = !DIDerivedType(tag: DW_TAG_typedef, name: "explosion_info", file: !115, line: 176, baseType: !2586)
!2586 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "explosion_info", file: !115, line: 168, size: 128, flags: DIFlagTypePassByValue, elements: !2587, identifier: "_ZTS14explosion_info")
!2587 = !{!2588, !2589, !2590, !2591, !2592, !2593}
!2588 = !DIDerivedType(tag: DW_TAG_member, name: "spawn_time", scope: !2586, file: !115, line: 170, baseType: !71, size: 32)
!2589 = !DIDerivedType(tag: DW_TAG_member, name: "delete_time", scope: !2586, file: !115, line: 171, baseType: !71, size: 32, offset: 32)
!2590 = !DIDerivedType(tag: DW_TAG_member, name: "delete_objnum", scope: !2586, file: !115, line: 172, baseType: !20, size: 16, offset: 64)
!2591 = !DIDerivedType(tag: DW_TAG_member, name: "attach_parent", scope: !2586, file: !115, line: 173, baseType: !20, size: 16, offset: 80)
!2592 = !DIDerivedType(tag: DW_TAG_member, name: "prev_attach", scope: !2586, file: !115, line: 174, baseType: !20, size: 16, offset: 96)
!2593 = !DIDerivedType(tag: DW_TAG_member, name: "next_attach", scope: !2586, file: !115, line: 175, baseType: !20, size: 16, offset: 112)
!2594 = !DIDerivedType(tag: DW_TAG_member, name: "ai_info", scope: !2571, file: !115, line: 247, baseType: !2595, size: 256)
!2595 = !DIDerivedType(tag: DW_TAG_typedef, name: "ai_static", file: !2596, line: 144, baseType: !2597)
!2596 = !DIFile(filename: "main_d2/aistruct.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "d122430e792a0ddc0f9eaa08ad217628")
!2597 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ai_static", file: !2596, line: 127, size: 256, flags: DIFlagTypePassByValue, elements: !2598, identifier: "_ZTS9ai_static")
!2598 = !{!2599, !2600, !2602, !2603, !2604, !2605, !2606, !2607, !2608, !2609}
!2599 = !DIDerivedType(tag: DW_TAG_member, name: "behavior", scope: !2597, file: !2596, line: 128, baseType: !17, size: 8)
!2600 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !2597, file: !2596, line: 129, baseType: !2601, size: 88, offset: 8)
!2601 = !DICompositeType(tag: DW_TAG_array_type, baseType: !60, size: 88, elements: !179)
!2602 = !DIDerivedType(tag: DW_TAG_member, name: "hide_segment", scope: !2597, file: !2596, line: 130, baseType: !20, size: 16, offset: 96)
!2603 = !DIDerivedType(tag: DW_TAG_member, name: "hide_index", scope: !2597, file: !2596, line: 131, baseType: !20, size: 16, offset: 112)
!2604 = !DIDerivedType(tag: DW_TAG_member, name: "path_length", scope: !2597, file: !2596, line: 132, baseType: !20, size: 16, offset: 128)
!2605 = !DIDerivedType(tag: DW_TAG_member, name: "cur_path_index", scope: !2597, file: !2596, line: 133, baseType: !60, size: 8, offset: 144)
!2606 = !DIDerivedType(tag: DW_TAG_member, name: "dying_sound_playing", scope: !2597, file: !2596, line: 134, baseType: !60, size: 8, offset: 152)
!2607 = !DIDerivedType(tag: DW_TAG_member, name: "danger_laser_num", scope: !2597, file: !2596, line: 139, baseType: !20, size: 16, offset: 160)
!2608 = !DIDerivedType(tag: DW_TAG_member, name: "danger_laser_signature", scope: !2597, file: !2596, line: 140, baseType: !7, size: 32, offset: 192)
!2609 = !DIDerivedType(tag: DW_TAG_member, name: "dying_start_time", scope: !2597, file: !2596, line: 141, baseType: !71, size: 32, offset: 224)
!2610 = !DIDerivedType(tag: DW_TAG_member, name: "light_info", scope: !2571, file: !115, line: 248, baseType: !2611, size: 32)
!2611 = !DIDerivedType(tag: DW_TAG_typedef, name: "light_info_t", file: !115, line: 181, baseType: !2612)
!2612 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "light_info_s", file: !115, line: 178, size: 32, flags: DIFlagTypePassByValue, elements: !2613, identifier: "_ZTS12light_info_s")
!2613 = !{!2614}
!2614 = !DIDerivedType(tag: DW_TAG_member, name: "intensity", scope: !2612, file: !115, line: 180, baseType: !71, size: 32)
!2615 = !DIDerivedType(tag: DW_TAG_member, name: "powerup_info", scope: !2571, file: !115, line: 249, baseType: !2616, size: 96)
!2616 = !DIDerivedType(tag: DW_TAG_typedef, name: "powerup_info_t", file: !115, line: 190, baseType: !2617)
!2617 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "powerup_info_s", file: !115, line: 185, size: 96, flags: DIFlagTypePassByValue, elements: !2618, identifier: "_ZTS14powerup_info_s")
!2618 = !{!2619, !2620, !2621}
!2619 = !DIDerivedType(tag: DW_TAG_member, name: "count", scope: !2617, file: !115, line: 187, baseType: !7, size: 32)
!2620 = !DIDerivedType(tag: DW_TAG_member, name: "creation_time", scope: !2617, file: !115, line: 188, baseType: !71, size: 32, offset: 32)
!2621 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !2617, file: !115, line: 189, baseType: !7, size: 32, offset: 64)
!2622 = !DIDerivedType(tag: DW_TAG_member, name: "rtype", scope: !2529, file: !115, line: 257, baseType: !2623, size: 608, offset: 1536)
!2623 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !2529, file: !115, line: 253, size: 608, flags: DIFlagTypePassByValue, elements: !2624, identifier: "_ZTSN6objectUt1_E")
!2624 = !{!2625, !2641}
!2625 = !DIDerivedType(tag: DW_TAG_member, name: "pobj_info", scope: !2623, file: !115, line: 255, baseType: !2626, size: 608)
!2626 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyobj_info", file: !115, line: 208, baseType: !2627)
!2627 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "polyobj_info", file: !115, line: 201, size: 608, flags: DIFlagTypePassByValue, elements: !2628, identifier: "_ZTS12polyobj_info")
!2628 = !{!2629, !2630, !2638, !2639, !2640}
!2629 = !DIDerivedType(tag: DW_TAG_member, name: "model_num", scope: !2627, file: !115, line: 203, baseType: !7, size: 32)
!2630 = !DIDerivedType(tag: DW_TAG_member, name: "anim_angles", scope: !2627, file: !115, line: 204, baseType: !2631, size: 480, offset: 32)
!2631 = !DICompositeType(tag: DW_TAG_array_type, baseType: !2632, size: 480, elements: !85)
!2632 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_angvec", file: !120, line: 40, baseType: !2633)
!2633 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_angvec", file: !120, line: 37, size: 48, flags: DIFlagTypePassByValue, elements: !2634, identifier: "_ZTS10vms_angvec")
!2634 = !{!2635, !2636, !2637}
!2635 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !2633, file: !120, line: 39, baseType: !2567, size: 16)
!2636 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !2633, file: !120, line: 39, baseType: !2567, size: 16, offset: 16)
!2637 = !DIDerivedType(tag: DW_TAG_member, name: "h", scope: !2633, file: !120, line: 39, baseType: !2567, size: 16, offset: 32)
!2638 = !DIDerivedType(tag: DW_TAG_member, name: "subobj_flags", scope: !2627, file: !115, line: 205, baseType: !7, size: 32, offset: 512)
!2639 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_override", scope: !2627, file: !115, line: 206, baseType: !7, size: 32, offset: 544)
!2640 = !DIDerivedType(tag: DW_TAG_member, name: "alt_textures", scope: !2627, file: !115, line: 207, baseType: !7, size: 32, offset: 576)
!2641 = !DIDerivedType(tag: DW_TAG_member, name: "vclip_info", scope: !2623, file: !115, line: 256, baseType: !2642, size: 96)
!2642 = !DIDerivedType(tag: DW_TAG_typedef, name: "vclip_info_t", file: !115, line: 197, baseType: !2643)
!2643 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vclip_info_s", file: !115, line: 192, size: 96, flags: DIFlagTypePassByValue, elements: !2644, identifier: "_ZTS12vclip_info_s")
!2644 = !{!2645, !2646, !2647}
!2645 = !DIDerivedType(tag: DW_TAG_member, name: "vclip_num", scope: !2643, file: !115, line: 194, baseType: !7, size: 32)
!2646 = !DIDerivedType(tag: DW_TAG_member, name: "frametime", scope: !2643, file: !115, line: 195, baseType: !71, size: 32, offset: 32)
!2647 = !DIDerivedType(tag: DW_TAG_member, name: "framenum", scope: !2643, file: !115, line: 196, baseType: !60, size: 8, offset: 64)
!2648 = !DILocalVariable(name: "player_obj", arg: 1, scope: !2524, file: !29, line: 831, type: !2527)
!2649 = !DILocation(line: 831, column: 46, scope: !2524)
!2650 = !DILocalVariable(name: "pos", scope: !2524, file: !29, line: 833, type: !119)
!2651 = !DILocation(line: 833, column: 13, scope: !2524)
!2652 = !DILocalVariable(name: "effect_obj", scope: !2524, file: !29, line: 834, type: !2527)
!2653 = !DILocation(line: 834, column: 10, scope: !2524)
!2654 = !DILocalVariable(name: "objnum", scope: !2655, file: !29, line: 838, type: !7)
!2655 = distinct !DILexicalBlock(scope: !2524, file: !29, line: 837, column: 2)
!2656 = !DILocation(line: 838, column: 7, scope: !2655)
!2657 = !DILocation(line: 838, column: 16, scope: !2655)
!2658 = !DILocation(line: 838, column: 27, scope: !2655)
!2659 = !DILocation(line: 839, column: 8, scope: !2660)
!2660 = distinct !DILexicalBlock(scope: !2655, file: !29, line: 839, column: 7)
!2661 = !DILocation(line: 839, column: 15, scope: !2660)
!2662 = !DILocation(line: 839, column: 20, scope: !2660)
!2663 = !DILocation(line: 839, column: 24, scope: !2660)
!2664 = !DILocation(line: 839, column: 33, scope: !2660)
!2665 = !DILocation(line: 839, column: 31, scope: !2660)
!2666 = !DILocation(line: 840, column: 4, scope: !2660)
!2667 = !DILocation(line: 844, column: 6, scope: !2668)
!2668 = distinct !DILexicalBlock(scope: !2524, file: !29, line: 844, column: 6)
!2669 = !DILocation(line: 844, column: 20, scope: !2668)
!2670 = !DILocation(line: 844, column: 17, scope: !2668)
!2671 = !DILocation(line: 845, column: 27, scope: !2668)
!2672 = !DILocation(line: 845, column: 39, scope: !2668)
!2673 = !DILocation(line: 845, column: 45, scope: !2668)
!2674 = !DILocation(line: 845, column: 57, scope: !2668)
!2675 = !DILocation(line: 845, column: 64, scope: !2668)
!2676 = !DILocation(line: 845, column: 77, scope: !2668)
!2677 = !DILocation(line: 845, column: 89, scope: !2668)
!2678 = !DILocation(line: 845, column: 95, scope: !2668)
!2679 = !DILocation(line: 845, column: 70, scope: !2668)
!2680 = !DILocation(line: 845, column: 3, scope: !2668)
!2681 = !DILocation(line: 847, column: 9, scope: !2668)
!2682 = !DILocation(line: 847, column: 21, scope: !2668)
!2683 = !DILocation(line: 847, column: 7, scope: !2668)
!2684 = !DILocation(line: 849, column: 39, scope: !2524)
!2685 = !DILocation(line: 849, column: 51, scope: !2524)
!2686 = !DILocation(line: 849, column: 65, scope: !2524)
!2687 = !DILocation(line: 849, column: 77, scope: !2524)
!2688 = !DILocation(line: 849, column: 15, scope: !2524)
!2689 = !DILocation(line: 849, column: 13, scope: !2524)
!2690 = !DILocation(line: 851, column: 6, scope: !2691)
!2691 = distinct !DILexicalBlock(scope: !2524, file: !29, line: 851, column: 6)
!2692 = !DILocation(line: 853, column: 24, scope: !2693)
!2693 = distinct !DILexicalBlock(scope: !2691, file: !29, line: 852, column: 2)
!2694 = !DILocation(line: 853, column: 36, scope: !2693)
!2695 = !DILocation(line: 853, column: 3, scope: !2693)
!2696 = !DILocation(line: 853, column: 15, scope: !2693)
!2697 = !DILocation(line: 853, column: 22, scope: !2693)
!2698 = !DILocation(line: 855, column: 38, scope: !2699)
!2699 = distinct !DILexicalBlock(scope: !2693, file: !29, line: 855, column: 7)
!2700 = !DILocation(line: 855, column: 7, scope: !2699)
!2701 = !DILocation(line: 855, column: 48, scope: !2699)
!2702 = !DILocation(line: 856, column: 61, scope: !2699)
!2703 = !DILocation(line: 856, column: 30, scope: !2699)
!2704 = !DILocation(line: 856, column: 72, scope: !2699)
!2705 = !DILocation(line: 856, column: 83, scope: !2699)
!2706 = !DILocation(line: 856, column: 4, scope: !2699)
!2707 = !DILocation(line: 857, column: 2, scope: !2693)
!2708 = !DILocation(line: 858, column: 1, scope: !2524)
!2709 = distinct !DISubprogram(name: "fixmul", scope: !72, file: !72, line: 83, type: !2710, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1694)
!2710 = !DISubroutineType(types: !2711)
!2711 = !{!71, !71, !71}
!2712 = !DILocalVariable(name: "a", arg: 1, scope: !2709, file: !72, line: 83, type: !71)
!2713 = !DILocation(line: 83, column: 26, scope: !2709)
!2714 = !DILocalVariable(name: "b", arg: 2, scope: !2709, file: !72, line: 83, type: !71)
!2715 = !DILocation(line: 83, column: 33, scope: !2709)
!2716 = !DILocation(line: 85, column: 19, scope: !2709)
!2717 = !DILocation(line: 85, column: 32, scope: !2709)
!2718 = !DILocation(line: 85, column: 21, scope: !2709)
!2719 = !DILocation(line: 85, column: 35, scope: !2709)
!2720 = !DILocation(line: 85, column: 9, scope: !2709)
!2721 = !DILocation(line: 85, column: 2, scope: !2709)
!2722 = distinct !DISubprogram(name: "MakeNewPlayerFile", linkageName: "_Z17MakeNewPlayerFilei", scope: !29, file: !29, line: 867, type: !469, scopeLine: 868, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1694)
!2723 = !DILocalVariable(name: "allow_abort", arg: 1, scope: !2722, file: !29, line: 867, type: !7)
!2724 = !DILocation(line: 867, column: 27, scope: !2722)
!2725 = !DILocalVariable(name: "x", scope: !2722, file: !29, line: 869, type: !7)
!2726 = !DILocation(line: 869, column: 6, scope: !2722)
!2727 = !DILocalVariable(name: "filename", scope: !2722, file: !29, line: 870, type: !2728)
!2728 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 112, elements: !337)
!2729 = !DILocation(line: 870, column: 7, scope: !2722)
!2730 = !DILocalVariable(name: "m", scope: !2722, file: !29, line: 871, type: !2731)
!2731 = !DIDerivedType(tag: DW_TAG_typedef, name: "newmenu_item", file: !2732, line: 43, baseType: !2733)
!2732 = !DIFile(filename: "main_d2/newmenu.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "4605fd1e125e01ec40c07444141cd888")
!2733 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "newmenu_item", file: !2732, line: 30, size: 768, flags: DIFlagTypePassByValue, elements: !2734, identifier: "_ZTS12newmenu_item")
!2734 = !{!2735, !2736, !2737, !2738, !2739, !2740, !2741, !2742, !2743, !2744, !2745, !2746, !2747, !2748}
!2735 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !2733, file: !2732, line: 31, baseType: !7, size: 32)
!2736 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !2733, file: !2732, line: 32, baseType: !7, size: 32, offset: 32)
!2737 = !DIDerivedType(tag: DW_TAG_member, name: "min_value", scope: !2733, file: !2732, line: 33, baseType: !7, size: 32, offset: 64)
!2738 = !DIDerivedType(tag: DW_TAG_member, name: "max_value", scope: !2733, file: !2732, line: 33, baseType: !7, size: 32, offset: 96)
!2739 = !DIDerivedType(tag: DW_TAG_member, name: "group", scope: !2733, file: !2732, line: 34, baseType: !7, size: 32, offset: 128)
!2740 = !DIDerivedType(tag: DW_TAG_member, name: "text_len", scope: !2733, file: !2732, line: 35, baseType: !7, size: 32, offset: 160)
!2741 = !DIDerivedType(tag: DW_TAG_member, name: "text", scope: !2733, file: !2732, line: 36, baseType: !21, size: 64, offset: 192)
!2742 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !2733, file: !2732, line: 38, baseType: !20, size: 16, offset: 256)
!2743 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !2733, file: !2732, line: 38, baseType: !20, size: 16, offset: 272)
!2744 = !DIDerivedType(tag: DW_TAG_member, name: "w", scope: !2733, file: !2732, line: 39, baseType: !20, size: 16, offset: 288)
!2745 = !DIDerivedType(tag: DW_TAG_member, name: "h", scope: !2733, file: !2732, line: 39, baseType: !20, size: 16, offset: 304)
!2746 = !DIDerivedType(tag: DW_TAG_member, name: "right_offset", scope: !2733, file: !2732, line: 40, baseType: !20, size: 16, offset: 320)
!2747 = !DIDerivedType(tag: DW_TAG_member, name: "redraw", scope: !2733, file: !2732, line: 41, baseType: !17, size: 8, offset: 336)
!2748 = !DIDerivedType(tag: DW_TAG_member, name: "saved_text", scope: !2733, file: !2732, line: 42, baseType: !2749, size: 408, offset: 344)
!2749 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 408, elements: !2750)
!2750 = !{!2751}
!2751 = !DISubrange(count: 51)
!2752 = !DILocation(line: 871, column: 15, scope: !2722)
!2753 = !DILocalVariable(name: "text", scope: !2722, file: !29, line: 872, type: !51)
!2754 = !DILocation(line: 872, column: 7, scope: !2722)
!2755 = !DILocalVariable(name: "fp", scope: !2722, file: !29, line: 873, type: !651)
!2756 = !DILocation(line: 873, column: 8, scope: !2722)
!2757 = !DILocation(line: 875, column: 10, scope: !2722)
!2758 = !DILocation(line: 875, column: 24, scope: !2722)
!2759 = !DILocation(line: 875, column: 16, scope: !2722)
!2760 = !DILocation(line: 875, column: 36, scope: !2722)
!2761 = !DILocation(line: 875, column: 2, scope: !2722)
!2762 = !DILabel(scope: !2722, name: "try_again", file: !29, line: 877)
!2763 = !DILocation(line: 877, column: 1, scope: !2722)
!2764 = !DILocation(line: 878, column: 4, scope: !2722)
!2765 = !DILocation(line: 878, column: 9, scope: !2722)
!2766 = !DILocation(line: 878, column: 28, scope: !2722)
!2767 = !DILocation(line: 878, column: 37, scope: !2722)
!2768 = !DILocation(line: 878, column: 51, scope: !2722)
!2769 = !DILocation(line: 878, column: 44, scope: !2722)
!2770 = !DILocation(line: 878, column: 49, scope: !2722)
!2771 = !DILocation(line: 880, column: 24, scope: !2722)
!2772 = !DILocation(line: 881, column: 23, scope: !2722)
!2773 = !DILocation(line: 881, column: 6, scope: !2722)
!2774 = !DILocation(line: 881, column: 4, scope: !2722)
!2775 = !DILocation(line: 882, column: 24, scope: !2722)
!2776 = !DILocation(line: 884, column: 6, scope: !2777)
!2777 = distinct !DILexicalBlock(scope: !2722, file: !29, line: 884, column: 6)
!2778 = !DILocation(line: 884, column: 8, scope: !2777)
!2779 = !DILocation(line: 886, column: 7, scope: !2780)
!2780 = distinct !DILexicalBlock(scope: !2781, file: !29, line: 886, column: 7)
!2781 = distinct !DILexicalBlock(scope: !2777, file: !29, line: 885, column: 2)
!2782 = !DILocation(line: 886, column: 20, scope: !2780)
!2783 = !DILocation(line: 887, column: 3, scope: !2781)
!2784 = !DILocation(line: 890, column: 6, scope: !2785)
!2785 = distinct !DILexicalBlock(scope: !2722, file: !29, line: 890, column: 6)
!2786 = !DILocation(line: 890, column: 14, scope: !2785)
!2787 = !DILocation(line: 891, column: 3, scope: !2785)
!2788 = !DILocation(line: 893, column: 10, scope: !2722)
!2789 = !DILocation(line: 893, column: 30, scope: !2722)
!2790 = !DILocation(line: 893, column: 2, scope: !2722)
!2791 = !DILocation(line: 895, column: 13, scope: !2722)
!2792 = !DILocation(line: 895, column: 7, scope: !2722)
!2793 = !DILocation(line: 895, column: 5, scope: !2722)
!2794 = !DILocation(line: 907, column: 6, scope: !2795)
!2795 = distinct !DILexicalBlock(scope: !2722, file: !29, line: 907, column: 6)
!2796 = !DILocation(line: 909, column: 26, scope: !2797)
!2797 = distinct !DILexicalBlock(scope: !2795, file: !29, line: 908, column: 2)
!2798 = !DILocation(line: 909, column: 48, scope: !2797)
!2799 = !DILocation(line: 909, column: 60, scope: !2797)
!2800 = !DILocation(line: 909, column: 66, scope: !2797)
!2801 = !DILocation(line: 909, column: 3, scope: !2797)
!2802 = !DILocation(line: 910, column: 10, scope: !2797)
!2803 = !DILocation(line: 910, column: 3, scope: !2797)
!2804 = !DILocation(line: 911, column: 3, scope: !2797)
!2805 = !DILocation(line: 914, column: 7, scope: !2806)
!2806 = distinct !DILexicalBlock(scope: !2722, file: !29, line: 914, column: 6)
!2807 = !DILocation(line: 914, column: 6, scope: !2806)
!2808 = !DILocation(line: 915, column: 3, scope: !2806)
!2809 = !DILocation(line: 917, column: 18, scope: !2722)
!2810 = !DILocation(line: 917, column: 10, scope: !2722)
!2811 = !DILocation(line: 917, column: 30, scope: !2722)
!2812 = !DILocation(line: 917, column: 40, scope: !2722)
!2813 = !DILocation(line: 917, column: 2, scope: !2722)
!2814 = !DILocation(line: 919, column: 2, scope: !2722)
!2815 = !DILocation(line: 921, column: 2, scope: !2722)
!2816 = !DILocation(line: 922, column: 1, scope: !2722)
!2817 = distinct !DISubprogram(name: "operator[]", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em", scope: !2819, file: !2818, line: 402, type: !3019, scopeLine: 402, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, declaration: !3018, retainedNodes: !1694)
!2818 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__vector/vector.h", directory: "")
!2819 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "vector<char *, std::__1::allocator<char *> >", scope: !397, file: !2818, line: 86, size: 192, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !2820, templateParams: !3168, identifier: "_ZTSNSt3__16vectorIPcNS_9allocatorIS1_EEEE")
!2820 = !{!2821, !2892, !2893, !2894, !2900, !2902, !2906, !2910, !2915, !2919, !2922, !2928, !2929, !2934, !2944, !2948, !2953, !2956, !2959, !2963, !2966, !2969, !2973, !2974, !2978, !2984, !2989, !2990, !2991, !2997, !3002, !3003, !3004, !3005, !3006, !3007, !3008, !3011, !3012, !3015, !3016, !3017, !3018, !3023, !3026, !3027, !3028, !3031, !3034, !3035, !3036, !3040, !3044, !3047, !3051, !3052, !3055, !3058, !3061, !3064, !3067, !3070, !3071, !3072, !3073, !3076, !3077, !3078, !3079, !3082, !3083, !3084, !3085, !3086, !3089, !3094, !3100, !3103, !3106, !3125, !3141, !3144, !3147, !3150, !3153, !3154, !3155, !3156, !3157, !3158, !3159, !3160, !3163, !3166, !3167}
!2821 = !DIDerivedType(tag: DW_TAG_member, name: "__begin_", scope: !2819, file: !2818, line: 548, baseType: !2822, size: 64)
!2822 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !2819, file: !2818, line: 102, baseType: !2823, flags: DIFlagPublic)
!2823 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !2825, file: !2824, line: 241, baseType: !2860)
!2824 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__memory/allocator_traits.h", directory: "")
!2825 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "allocator_traits<std::__1::allocator<char *> >", scope: !397, file: !2824, line: 238, size: 8, flags: DIFlagTypePassByValue, elements: !2826, templateParams: !2890, identifier: "_ZTSNSt3__116allocator_traitsINS_9allocatorIPcEEEE")
!2826 = !{!2827, !2887}
!2827 = !DISubprogram(name: "allocate", linkageName: "_ZNSt3__116allocator_traitsINS_9allocatorIPcEEE8allocateB8ne200100ERS3_m", scope: !2825, file: !2824, line: 269, type: !2828, scopeLine: 269, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!2828 = !DISubroutineType(types: !2829)
!2829 = !{!2823, !2830, !2885}
!2830 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2831, size: 64)
!2831 = !DIDerivedType(tag: DW_TAG_typedef, name: "allocator_type", scope: !2825, file: !2824, line: 239, baseType: !2832)
!2832 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "allocator<char *>", scope: !397, file: !2833, line: 80, size: 8, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !2834, templateParams: !2883, identifier: "_ZTSNSt3__19allocatorIPcEE")
!2833 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__memory/allocator.h", directory: "")
!2834 = !{!2835, !2845, !2849, !2854, !2857, !2865, !2873, !2876, !2880}
!2835 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !2832, baseType: !2836, extraData: i32 0)
!2836 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__non_trivial_if<true, std::__1::allocator<char *> >", scope: !397, file: !2833, line: 70, size: 8, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !2837, templateParams: !2842, identifier: "_ZTSNSt3__116__non_trivial_ifILb1ENS_9allocatorIPcEEEE")
!2837 = !{!2838}
!2838 = !DISubprogram(name: "__non_trivial_if", scope: !2836, file: !2833, line: 71, type: !2839, scopeLine: 71, flags: DIFlagPrototyped, spFlags: 0)
!2839 = !DISubroutineType(types: !2840)
!2840 = !{null, !2841}
!2841 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2836, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2842 = !{!2843, !2844}
!2843 = !DITemplateValueParameter(name: "_Cond", type: !1048, value: i8 1)
!2844 = !DITemplateTypeParameter(name: "_Unique", type: !2832)
!2845 = !DISubprogram(name: "allocator", scope: !2832, file: !2833, line: 93, type: !2846, scopeLine: 93, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2846 = !DISubroutineType(types: !2847)
!2847 = !{null, !2848}
!2848 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2832, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2849 = !DISubprogram(name: "allocate", linkageName: "_ZNSt3__19allocatorIPcE8allocateB8ne200100Em", scope: !2832, file: !2833, line: 98, type: !2850, scopeLine: 98, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2850 = !DISubroutineType(types: !2851)
!2851 = !{!908, !2848, !2852}
!2852 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", scope: !397, file: !2853, line: 20, baseType: !454)
!2853 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__cstddef/size_t.h", directory: "")
!2854 = !DISubprogram(name: "deallocate", linkageName: "_ZNSt3__19allocatorIPcE10deallocateB8ne200100EPS1_m", scope: !2832, file: !2833, line: 116, type: !2855, scopeLine: 116, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2855 = !DISubroutineType(types: !2856)
!2856 = !{null, !2848, !908, !2852}
!2857 = !DISubprogram(name: "address", linkageName: "_ZNKSt3__19allocatorIPcE7addressB8ne200100ERS1_", scope: !2832, file: !2833, line: 136, type: !2858, scopeLine: 136, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2858 = !DISubroutineType(types: !2859)
!2859 = !{!2860, !2861, !2863}
!2860 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !2832, file: !2833, line: 126, baseType: !908, flags: DIFlagPublic)
!2861 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2862, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2862 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2832)
!2863 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !2832, file: !2833, line: 128, baseType: !2864, flags: DIFlagPublic)
!2864 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !21, size: 64)
!2865 = !DISubprogram(name: "address", linkageName: "_ZNKSt3__19allocatorIPcE7addressB8ne200100ERKS1_", scope: !2832, file: !2833, line: 139, type: !2866, scopeLine: 139, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2866 = !DISubroutineType(types: !2867)
!2867 = !{!2868, !2861, !2871}
!2868 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !2832, file: !2833, line: 127, baseType: !2869, flags: DIFlagPublic)
!2869 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2870, size: 64)
!2870 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !21)
!2871 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !2832, file: !2833, line: 129, baseType: !2872, flags: DIFlagPublic)
!2872 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2870, size: 64)
!2873 = !DISubprogram(name: "allocate", linkageName: "_ZNSt3__19allocatorIPcE8allocateB8ne200100EmPKv", scope: !2832, file: !2833, line: 143, type: !2874, scopeLine: 143, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2874 = !DISubroutineType(types: !2875)
!2875 = !{!908, !2848, !2852, !984}
!2876 = !DISubprogram(name: "max_size", linkageName: "_ZNKSt3__19allocatorIPcE8max_sizeB8ne200100Ev", scope: !2832, file: !2833, line: 147, type: !2877, scopeLine: 147, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2877 = !DISubroutineType(types: !2878)
!2878 = !{!2879, !2861}
!2879 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", file: !2833, line: 85, baseType: !2852, flags: DIFlagPublic)
!2880 = !DISubprogram(name: "destroy", linkageName: "_ZNSt3__19allocatorIPcE7destroyB8ne200100EPS1_", scope: !2832, file: !2833, line: 156, type: !2881, scopeLine: 156, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2881 = !DISubroutineType(types: !2882)
!2882 = !{null, !2848, !2860}
!2883 = !{!2884}
!2884 = !DITemplateTypeParameter(name: "_Tp", type: !21)
!2885 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !2825, file: !2824, line: 246, baseType: !2886)
!2886 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !2832, file: !2833, line: 85, baseType: !2852, flags: DIFlagPublic)
!2887 = !DISubprogram(name: "deallocate", linkageName: "_ZNSt3__116allocator_traitsINS_9allocatorIPcEEE10deallocateB8ne200100ERS3_PS2_m", scope: !2825, file: !2824, line: 301, type: !2888, scopeLine: 301, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!2888 = !DISubroutineType(types: !2889)
!2889 = !{null, !2830, !2823, !2885}
!2890 = !{!2891}
!2891 = !DITemplateTypeParameter(name: "_Alloc", type: !2832)
!2892 = !DIDerivedType(tag: DW_TAG_member, name: "__end_", scope: !2819, file: !2818, line: 549, baseType: !2822, size: 64, offset: 64)
!2893 = !DIDerivedType(tag: DW_TAG_member, name: "__cap_", scope: !2819, file: !2818, line: 550, baseType: !2822, size: 64, align: 8, offset: 128)
!2894 = !DIDerivedType(tag: DW_TAG_member, name: "__padding1_550_", scope: !2819, file: !2818, line: 550, baseType: !2895, size: 8)
!2895 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "__compressed_pair_padding<char **, true>", scope: !397, file: !2896, line: 74, size: 8, flags: DIFlagTypePassByValue, elements: !1694, templateParams: !2897, identifier: "_ZTSNSt3__125__compressed_pair_paddingIPPcLb1EEE")
!2896 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__memory/compressed_pair.h", directory: "")
!2897 = !{!2898, !2899}
!2898 = !DITemplateTypeParameter(name: "_ToPad", type: !908)
!2899 = !DITemplateValueParameter(name: "_Empty", type: !1048, defaulted: true, value: i8 1)
!2900 = !DIDerivedType(tag: DW_TAG_member, name: "__alloc_", scope: !2819, file: !2818, line: 550, baseType: !2901, size: 8)
!2901 = !DIDerivedType(tag: DW_TAG_typedef, name: "allocator_type", scope: !2819, file: !2818, line: 96, baseType: !2832, flags: DIFlagPublic)
!2902 = !DIDerivedType(tag: DW_TAG_member, name: "__padding2_550_", scope: !2819, file: !2818, line: 550, baseType: !2903, size: 8)
!2903 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "__compressed_pair_padding<std::__1::allocator<char *>, true>", scope: !397, file: !2896, line: 74, size: 8, flags: DIFlagTypePassByValue, elements: !1694, templateParams: !2904, identifier: "_ZTSNSt3__125__compressed_pair_paddingINS_9allocatorIPcEELb1EEE")
!2904 = !{!2905, !2899}
!2905 = !DITemplateTypeParameter(name: "_ToPad", type: !2832)
!2906 = !DISubprogram(name: "vector", scope: !2819, file: !2818, line: 133, type: !2907, scopeLine: 133, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2907 = !DISubroutineType(types: !2908)
!2908 = !{null, !2909}
!2909 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2819, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2910 = !DISubprogram(name: "vector", scope: !2819, file: !2818, line: 135, type: !2911, scopeLine: 135, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: 0)
!2911 = !DISubroutineType(types: !2912)
!2912 = !{null, !2909, !2913}
!2913 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2914, size: 64)
!2914 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2901)
!2915 = !DISubprogram(name: "vector", scope: !2819, file: !2818, line: 144, type: !2916, scopeLine: 144, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: 0)
!2916 = !DISubroutineType(types: !2917)
!2917 = !{null, !2909, !2918}
!2918 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !2819, file: !2818, line: 100, baseType: !2885, flags: DIFlagPublic)
!2919 = !DISubprogram(name: "vector", scope: !2819, file: !2818, line: 154, type: !2920, scopeLine: 154, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: 0)
!2920 = !DISubroutineType(types: !2921)
!2921 = !{null, !2909, !2918, !2913}
!2922 = !DISubprogram(name: "vector", scope: !2819, file: !2818, line: 165, type: !2923, scopeLine: 165, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2923 = !DISubroutineType(types: !2924)
!2924 = !{null, !2909, !2918, !2925}
!2925 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2926, size: 64)
!2926 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2927)
!2927 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !2819, file: !2818, line: 95, baseType: !21, flags: DIFlagPublic)
!2928 = !DISubprogram(name: "~vector", scope: !2819, file: !2818, line: 259, type: !2907, scopeLine: 259, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2929 = !DISubprogram(name: "vector", scope: !2819, file: !2818, line: 261, type: !2930, scopeLine: 261, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2930 = !DISubroutineType(types: !2931)
!2931 = !{null, !2909, !2932}
!2932 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2933, size: 64)
!2933 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2819)
!2934 = !DISubprogram(name: "vector", scope: !2819, file: !2818, line: 266, type: !2935, scopeLine: 266, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2935 = !DISubroutineType(types: !2936)
!2936 = !{null, !2909, !2932, !2937}
!2937 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2938, size: 64)
!2938 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2939)
!2939 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !2941, file: !2940, line: 22, baseType: !2832)
!2940 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__type_traits/type_identity.h", directory: "")
!2941 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__type_identity<std::__1::allocator<char *> >", scope: !397, file: !2940, line: 21, size: 8, flags: DIFlagTypePassByValue, elements: !1694, templateParams: !2942, identifier: "_ZTSNSt3__115__type_identityINS_9allocatorIPcEEEE")
!2942 = !{!2943}
!2943 = !DITemplateTypeParameter(name: "_Tp", type: !2832)
!2944 = !DISubprogram(name: "operator=", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEaSB8ne200100ERKS4_", scope: !2819, file: !2818, line: 270, type: !2945, scopeLine: 270, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2945 = !DISubroutineType(types: !2946)
!2946 = !{!2947, !2909, !2932}
!2947 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2819, size: 64)
!2948 = !DISubprogram(name: "vector", scope: !2819, file: !2818, line: 273, type: !2949, scopeLine: 273, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2949 = !DISubroutineType(types: !2950)
!2950 = !{null, !2909, !2951}
!2951 = !DICompositeType(tag: DW_TAG_class_type, name: "initializer_list<char *>", scope: !398, file: !2952, line: 62, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSSt16initializer_listIPcE")
!2952 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/initializer_list", directory: "")
!2953 = !DISubprogram(name: "vector", scope: !2819, file: !2818, line: 278, type: !2954, scopeLine: 278, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2954 = !DISubroutineType(types: !2955)
!2955 = !{null, !2909, !2951, !2913}
!2956 = !DISubprogram(name: "operator=", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEaSB8ne200100ESt16initializer_listIS1_E", scope: !2819, file: !2818, line: 283, type: !2957, scopeLine: 283, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2957 = !DISubroutineType(types: !2958)
!2958 = !{!2947, !2909, !2951}
!2959 = !DISubprogram(name: "vector", scope: !2819, file: !2818, line: 289, type: !2960, scopeLine: 289, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2960 = !DISubroutineType(types: !2961)
!2961 = !{null, !2909, !2962}
!2962 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !2819, size: 64)
!2963 = !DISubprogram(name: "vector", scope: !2819, file: !2818, line: 297, type: !2964, scopeLine: 297, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2964 = !DISubroutineType(types: !2965)
!2965 = !{null, !2909, !2962, !2937}
!2966 = !DISubprogram(name: "operator=", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEaSB8ne200100EOS4_", scope: !2819, file: !2818, line: 298, type: !2967, scopeLine: 298, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2967 = !DISubroutineType(types: !2968)
!2968 = !{!2947, !2909, !2962}
!2969 = !DISubprogram(name: "assign", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6assignEmRKS1_", scope: !2819, file: !2818, line: 333, type: !2970, scopeLine: 333, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2970 = !DISubroutineType(types: !2971)
!2971 = !{null, !2909, !2918, !2972}
!2972 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !2819, file: !2818, line: 99, baseType: !2925, flags: DIFlagPublic)
!2973 = !DISubprogram(name: "assign", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6assignB8ne200100ESt16initializer_listIS1_E", scope: !2819, file: !2818, line: 336, type: !2949, scopeLine: 336, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2974 = !DISubprogram(name: "get_allocator", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE13get_allocatorB8ne200100Ev", scope: !2819, file: !2818, line: 341, type: !2975, scopeLine: 341, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2975 = !DISubroutineType(types: !2976)
!2976 = !{!2901, !2977}
!2977 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2933, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2978 = !DISubprogram(name: "begin", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE5beginB8ne200100Ev", scope: !2819, file: !2818, line: 348, type: !2979, scopeLine: 348, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2979 = !DISubroutineType(types: !2980)
!2980 = !{!2981, !2909}
!2981 = !DIDerivedType(tag: DW_TAG_typedef, name: "iterator", scope: !2819, file: !2818, line: 111, baseType: !2982, flags: DIFlagPublic)
!2982 = !DICompositeType(tag: DW_TAG_class_type, name: "__wrap_iter<char **>", scope: !397, file: !2983, line: 35, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt3__111__wrap_iterIPPcEE")
!2983 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__iterator/wrap_iter.h", directory: "")
!2984 = !DISubprogram(name: "begin", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE5beginB8ne200100Ev", scope: !2819, file: !2818, line: 351, type: !2985, scopeLine: 351, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2985 = !DISubroutineType(types: !2986)
!2986 = !{!2987, !2977}
!2987 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_iterator", scope: !2819, file: !2818, line: 112, baseType: !2988, flags: DIFlagPublic)
!2988 = !DICompositeType(tag: DW_TAG_class_type, name: "__wrap_iter<char *const *>", scope: !397, file: !2983, line: 35, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt3__111__wrap_iterIPKPcEE")
!2989 = !DISubprogram(name: "end", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE3endB8ne200100Ev", scope: !2819, file: !2818, line: 354, type: !2979, scopeLine: 354, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2990 = !DISubprogram(name: "end", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE3endB8ne200100Ev", scope: !2819, file: !2818, line: 357, type: !2985, scopeLine: 357, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2991 = !DISubprogram(name: "rbegin", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6rbeginB8ne200100Ev", scope: !2819, file: !2818, line: 361, type: !2992, scopeLine: 361, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2992 = !DISubroutineType(types: !2993)
!2993 = !{!2994, !2909}
!2994 = !DIDerivedType(tag: DW_TAG_typedef, name: "reverse_iterator", scope: !2819, file: !2818, line: 114, baseType: !2995, flags: DIFlagPublic)
!2995 = !DICompositeType(tag: DW_TAG_class_type, name: "reverse_iterator<std::__1::__wrap_iter<char **> >", scope: !397, file: !2996, line: 51, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt3__116reverse_iteratorINS_11__wrap_iterIPPcEEEE")
!2996 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__iterator/reverse_iterator.h", directory: "")
!2997 = !DISubprogram(name: "rbegin", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE6rbeginB8ne200100Ev", scope: !2819, file: !2818, line: 364, type: !2998, scopeLine: 364, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!2998 = !DISubroutineType(types: !2999)
!2999 = !{!3000, !2977}
!3000 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reverse_iterator", scope: !2819, file: !2818, line: 115, baseType: !3001, flags: DIFlagPublic)
!3001 = !DICompositeType(tag: DW_TAG_class_type, name: "reverse_iterator<std::__1::__wrap_iter<char *const *> >", scope: !397, file: !2996, line: 51, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt3__116reverse_iteratorINS_11__wrap_iterIPKPcEEEE")
!3002 = !DISubprogram(name: "rend", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE4rendB8ne200100Ev", scope: !2819, file: !2818, line: 367, type: !2992, scopeLine: 367, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!3003 = !DISubprogram(name: "rend", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE4rendB8ne200100Ev", scope: !2819, file: !2818, line: 370, type: !2998, scopeLine: 370, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!3004 = !DISubprogram(name: "cbegin", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE6cbeginB8ne200100Ev", scope: !2819, file: !2818, line: 374, type: !2985, scopeLine: 374, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!3005 = !DISubprogram(name: "cend", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE4cendB8ne200100Ev", scope: !2819, file: !2818, line: 375, type: !2985, scopeLine: 375, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!3006 = !DISubprogram(name: "crbegin", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE7crbeginB8ne200100Ev", scope: !2819, file: !2818, line: 376, type: !2998, scopeLine: 376, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!3007 = !DISubprogram(name: "crend", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE5crendB8ne200100Ev", scope: !2819, file: !2818, line: 379, type: !2998, scopeLine: 379, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!3008 = !DISubprogram(name: "size", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE4sizeB8ne200100Ev", scope: !2819, file: !2818, line: 384, type: !3009, scopeLine: 384, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!3009 = !DISubroutineType(types: !3010)
!3010 = !{!2918, !2977}
!3011 = !DISubprogram(name: "capacity", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE8capacityB8ne200100Ev", scope: !2819, file: !2818, line: 387, type: !3009, scopeLine: 387, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!3012 = !DISubprogram(name: "empty", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE5emptyB8ne200100Ev", scope: !2819, file: !2818, line: 390, type: !3013, scopeLine: 390, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!3013 = !DISubroutineType(types: !3014)
!3014 = !{!1048, !2977}
!3015 = !DISubprogram(name: "max_size", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE8max_sizeB8ne200100Ev", scope: !2819, file: !2818, line: 393, type: !3009, scopeLine: 393, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!3016 = !DISubprogram(name: "reserve", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE7reserveEm", scope: !2819, file: !2818, line: 396, type: !2916, scopeLine: 396, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!3017 = !DISubprogram(name: "shrink_to_fit", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE13shrink_to_fitEv", scope: !2819, file: !2818, line: 397, type: !2907, scopeLine: 397, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!3018 = !DISubprogram(name: "operator[]", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em", scope: !2819, file: !2818, line: 402, type: !3019, scopeLine: 402, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!3019 = !DISubroutineType(types: !3020)
!3020 = !{!3021, !2909, !2918}
!3021 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !2819, file: !2818, line: 98, baseType: !3022, flags: DIFlagPublic)
!3022 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2927, size: 64)
!3023 = !DISubprogram(name: "operator[]", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em", scope: !2819, file: !2818, line: 406, type: !3024, scopeLine: 406, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!3024 = !DISubroutineType(types: !3025)
!3025 = !{!2972, !2977, !2918}
!3026 = !DISubprogram(name: "at", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE2atB8ne200100Em", scope: !2819, file: !2818, line: 410, type: !3019, scopeLine: 410, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!3027 = !DISubprogram(name: "at", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE2atB8ne200100Em", scope: !2819, file: !2818, line: 415, type: !3024, scopeLine: 415, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!3028 = !DISubprogram(name: "front", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE5frontB8ne200100Ev", scope: !2819, file: !2818, line: 421, type: !3029, scopeLine: 421, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!3029 = !DISubroutineType(types: !3030)
!3030 = !{!3021, !2909}
!3031 = !DISubprogram(name: "front", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE5frontB8ne200100Ev", scope: !2819, file: !2818, line: 425, type: !3032, scopeLine: 425, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!3032 = !DISubroutineType(types: !3033)
!3033 = !{!2972, !2977}
!3034 = !DISubprogram(name: "back", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE4backB8ne200100Ev", scope: !2819, file: !2818, line: 429, type: !3029, scopeLine: 429, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!3035 = !DISubprogram(name: "back", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE4backB8ne200100Ev", scope: !2819, file: !2818, line: 433, type: !3032, scopeLine: 433, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!3036 = !DISubprogram(name: "data", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE4dataB8ne200100Ev", scope: !2819, file: !2818, line: 441, type: !3037, scopeLine: 441, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!3037 = !DISubroutineType(types: !3038)
!3038 = !{!3039, !2909}
!3039 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2927, size: 64)
!3040 = !DISubprogram(name: "data", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE4dataB8ne200100Ev", scope: !2819, file: !2818, line: 445, type: !3041, scopeLine: 445, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!3041 = !DISubroutineType(types: !3042)
!3042 = !{!3043, !2977}
!3043 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2926, size: 64)
!3044 = !DISubprogram(name: "push_back", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE9push_backB8ne200100ERKS1_", scope: !2819, file: !2818, line: 452, type: !3045, scopeLine: 452, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!3045 = !DISubroutineType(types: !3046)
!3046 = !{null, !2909, !2972}
!3047 = !DISubprogram(name: "push_back", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE9push_backB8ne200100EOS1_", scope: !2819, file: !2818, line: 454, type: !3048, scopeLine: 454, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!3048 = !DISubroutineType(types: !3049)
!3049 = !{null, !2909, !3050}
!3050 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !2927, size: 64)
!3051 = !DISubprogram(name: "pop_back", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE8pop_backB8ne200100Ev", scope: !2819, file: !2818, line: 473, type: !2907, scopeLine: 473, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!3052 = !DISubprogram(name: "insert", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EERS6_", scope: !2819, file: !2818, line: 478, type: !3053, scopeLine: 478, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!3053 = !DISubroutineType(types: !3054)
!3054 = !{!2981, !2909, !2987, !2972}
!3055 = !DISubprogram(name: "insert", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEOS1_", scope: !2819, file: !2818, line: 480, type: !3056, scopeLine: 480, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!3056 = !DISubroutineType(types: !3057)
!3057 = !{!2981, !2909, !2987, !3050}
!3058 = !DISubprogram(name: "insert", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_", scope: !2819, file: !2818, line: 485, type: !3059, scopeLine: 485, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!3059 = !DISubroutineType(types: !3060)
!3060 = !{!2981, !2909, !2987, !2918, !2972}
!3061 = !DISubprogram(name: "insert", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6insertB8ne200100ENS_11__wrap_iterIPKS1_EESt16initializer_listIS1_E", scope: !2819, file: !2818, line: 521, type: !3062, scopeLine: 521, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!3062 = !DISubroutineType(types: !3063)
!3063 = !{!2981, !2909, !2987, !2951}
!3064 = !DISubprogram(name: "erase", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE5eraseB8ne200100ENS_11__wrap_iterIPKS1_EE", scope: !2819, file: !2818, line: 526, type: !3065, scopeLine: 526, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!3065 = !DISubroutineType(types: !3066)
!3066 = !{!2981, !2909, !2987}
!3067 = !DISubprogram(name: "erase", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE5eraseENS_11__wrap_iterIPKS1_EES8_", scope: !2819, file: !2818, line: 527, type: !3068, scopeLine: 527, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!3068 = !DISubroutineType(types: !3069)
!3069 = !{!2981, !2909, !2987, !2987}
!3070 = !DISubprogram(name: "clear", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE5clearB8ne200100Ev", scope: !2819, file: !2818, line: 529, type: !2907, scopeLine: 529, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!3071 = !DISubprogram(name: "resize", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6resizeEm", scope: !2819, file: !2818, line: 535, type: !2916, scopeLine: 535, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!3072 = !DISubprogram(name: "resize", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6resizeEmRKS1_", scope: !2819, file: !2818, line: 536, type: !2970, scopeLine: 536, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!3073 = !DISubprogram(name: "swap", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE4swapERS4_", scope: !2819, file: !2818, line: 538, type: !3074, scopeLine: 538, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!3074 = !DISubroutineType(types: !3075)
!3075 = !{null, !2909, !2947}
!3076 = !DISubprogram(name: "__invariants", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE12__invariantsEv", scope: !2819, file: !2818, line: 545, type: !3013, scopeLine: 545, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!3077 = !DISubprogram(name: "__vallocate", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE11__vallocateB8ne200100Em", scope: !2819, file: !2818, line: 559, type: !2916, scopeLine: 559, flags: DIFlagPrototyped, spFlags: 0)
!3078 = !DISubprogram(name: "__vdeallocate", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE13__vdeallocateEv", scope: !2819, file: !2818, line: 569, type: !2907, scopeLine: 569, flags: DIFlagPrototyped, spFlags: 0)
!3079 = !DISubprogram(name: "__recommend", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE11__recommendB8ne200100Em", scope: !2819, file: !2818, line: 570, type: !3080, scopeLine: 570, flags: DIFlagPrototyped, spFlags: 0)
!3080 = !DISubroutineType(types: !3081)
!3081 = !{!2918, !2977, !2918}
!3082 = !DISubprogram(name: "__construct_at_end", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE18__construct_at_endEm", scope: !2819, file: !2818, line: 571, type: !2916, scopeLine: 571, flags: DIFlagPrototyped, spFlags: 0)
!3083 = !DISubprogram(name: "__construct_at_end", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE18__construct_at_endEmRKS1_", scope: !2819, file: !2818, line: 572, type: !2970, scopeLine: 572, flags: DIFlagPrototyped, spFlags: 0)
!3084 = !DISubprogram(name: "__append", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE8__appendEm", scope: !2819, file: !2818, line: 620, type: !2916, scopeLine: 620, flags: DIFlagPrototyped, spFlags: 0)
!3085 = !DISubprogram(name: "__append", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE8__appendEmRKS1_", scope: !2819, file: !2818, line: 621, type: !2970, scopeLine: 621, flags: DIFlagPrototyped, spFlags: 0)
!3086 = !DISubprogram(name: "__make_iter", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE11__make_iterB8ne200100EPS1_", scope: !2819, file: !2818, line: 623, type: !3087, scopeLine: 623, flags: DIFlagPrototyped, spFlags: 0)
!3087 = !DISubroutineType(types: !3088)
!3088 = !{!2981, !2909, !2822}
!3089 = !DISubprogram(name: "__make_iter", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE11__make_iterB8ne200100EPKS1_", scope: !2819, file: !2818, line: 643, type: !3090, scopeLine: 643, flags: DIFlagPrototyped, spFlags: 0)
!3090 = !DISubroutineType(types: !3091)
!3091 = !{!2987, !2977, !3092}
!3092 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !2819, file: !2818, line: 103, baseType: !3093, flags: DIFlagPublic)
!3093 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !2825, file: !2824, line: 242, baseType: !2868)
!3094 = !DISubprogram(name: "__swap_out_circular_buffer", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS1_RS3_EE", scope: !2819, file: !2818, line: 656, type: !3095, scopeLine: 656, flags: DIFlagPrototyped, spFlags: 0)
!3095 = !DISubroutineType(types: !3096)
!3096 = !{null, !2909, !3097}
!3097 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !3098, size: 64)
!3098 = !DICompositeType(tag: DW_TAG_structure_type, name: "__split_buffer<char *, std::__1::allocator<char *> &>", scope: !397, file: !3099, line: 52, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt3__114__split_bufferIPcRNS_9allocatorIS1_EEEE")
!3099 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__split_buffer", directory: "")
!3100 = !DISubprogram(name: "__swap_out_circular_buffer", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS1_RS3_EEPS1_", scope: !2819, file: !2818, line: 658, type: !3101, scopeLine: 658, flags: DIFlagPrototyped, spFlags: 0)
!3101 = !DISubroutineType(types: !3102)
!3102 = !{!2822, !2909, !3097, !2822}
!3103 = !DISubprogram(name: "__move_range", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE12__move_rangeEPS1_S5_S5_", scope: !2819, file: !2818, line: 660, type: !3104, scopeLine: 660, flags: DIFlagPrototyped, spFlags: 0)
!3104 = !DISubroutineType(types: !3105)
!3105 = !{null, !2909, !2822, !2822, !2822}
!3106 = !DISubprogram(name: "__move_assign", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE13__move_assignERS4_NS_17integral_constantIbLb1EEE", scope: !2819, file: !2818, line: 661, type: !3107, scopeLine: 661, flags: DIFlagPrototyped, spFlags: 0)
!3107 = !DISubroutineType(types: !3108)
!3108 = !{null, !2909, !2947, !3109}
!3109 = !DIDerivedType(tag: DW_TAG_typedef, name: "true_type", scope: !397, file: !3110, line: 31, baseType: !3111)
!3110 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__type_traits/integral_constant.h", directory: "")
!3111 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "integral_constant<bool, true>", scope: !397, file: !3110, line: 21, size: 8, flags: DIFlagTypePassByValue, elements: !3112, templateParams: !3122, identifier: "_ZTSNSt3__117integral_constantIbLb1EEE")
!3112 = !{!3113, !3115, !3121}
!3113 = !DIDerivedType(tag: DW_TAG_variable, name: "value", scope: !3111, file: !3110, line: 22, baseType: !3114, flags: DIFlagStaticMember, extraData: i1 true)
!3114 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1048)
!3115 = !DISubprogram(name: "operator bool", linkageName: "_ZNKSt3__117integral_constantIbLb1EEcvbB8ne200100Ev", scope: !3111, file: !3110, line: 25, type: !3116, scopeLine: 25, flags: DIFlagPrototyped, spFlags: 0)
!3116 = !DISubroutineType(types: !3117)
!3117 = !{!3118, !3119}
!3118 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !3111, file: !3110, line: 23, baseType: !1048)
!3119 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3120, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!3120 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !3111)
!3121 = !DISubprogram(name: "operator()", linkageName: "_ZNKSt3__117integral_constantIbLb1EEclB8ne200100Ev", scope: !3111, file: !3110, line: 27, type: !3116, scopeLine: 27, flags: DIFlagPrototyped, spFlags: 0)
!3122 = !{!3123, !3124}
!3123 = !DITemplateTypeParameter(name: "_Tp", type: !1048)
!3124 = !DITemplateValueParameter(name: "__v", type: !1048, value: i8 1)
!3125 = !DISubprogram(name: "__move_assign", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE13__move_assignERS4_NS_17integral_constantIbLb0EEE", scope: !2819, file: !2818, line: 663, type: !3126, scopeLine: 663, flags: DIFlagPrototyped, spFlags: 0)
!3126 = !DISubroutineType(types: !3127)
!3127 = !{null, !2909, !2947, !3128}
!3128 = !DIDerivedType(tag: DW_TAG_typedef, name: "false_type", scope: !397, file: !3110, line: 32, baseType: !3129)
!3129 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "integral_constant<bool, false>", scope: !397, file: !3110, line: 21, size: 8, flags: DIFlagTypePassByValue, elements: !3130, templateParams: !3139, identifier: "_ZTSNSt3__117integral_constantIbLb0EEE")
!3130 = !{!3131, !3132, !3138}
!3131 = !DIDerivedType(tag: DW_TAG_variable, name: "value", scope: !3129, file: !3110, line: 22, baseType: !3114, flags: DIFlagStaticMember, extraData: i1 false)
!3132 = !DISubprogram(name: "operator bool", linkageName: "_ZNKSt3__117integral_constantIbLb0EEcvbB8ne200100Ev", scope: !3129, file: !3110, line: 25, type: !3133, scopeLine: 25, flags: DIFlagPrototyped, spFlags: 0)
!3133 = !DISubroutineType(types: !3134)
!3134 = !{!3135, !3136}
!3135 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !3129, file: !3110, line: 23, baseType: !1048)
!3136 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3137, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!3137 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !3129)
!3138 = !DISubprogram(name: "operator()", linkageName: "_ZNKSt3__117integral_constantIbLb0EEclB8ne200100Ev", scope: !3129, file: !3110, line: 27, type: !3133, scopeLine: 27, flags: DIFlagPrototyped, spFlags: 0)
!3139 = !{!3123, !3140}
!3140 = !DITemplateValueParameter(name: "__v", type: !1048, value: i8 0)
!3141 = !DISubprogram(name: "__destruct_at_end", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE17__destruct_at_endB8ne200100EPS1_", scope: !2819, file: !2818, line: 665, type: !3142, scopeLine: 665, flags: DIFlagPrototyped, spFlags: 0)
!3142 = !DISubroutineType(types: !3143)
!3143 = !{null, !2909, !2822}
!3144 = !DISubprogram(name: "__annotate_contiguous_container", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE31__annotate_contiguous_containerB8ne200100EPKvS6_", scope: !2819, file: !2818, line: 683, type: !3145, scopeLine: 683, flags: DIFlagPrototyped, spFlags: 0)
!3145 = !DISubroutineType(types: !3146)
!3146 = !{null, !2977, !984, !984}
!3147 = !DISubprogram(name: "__annotate_new", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE14__annotate_newB8ne200100Em", scope: !2819, file: !2818, line: 687, type: !3148, scopeLine: 687, flags: DIFlagPrototyped, spFlags: 0)
!3148 = !DISubroutineType(types: !3149)
!3149 = !{null, !2977, !2918}
!3150 = !DISubprogram(name: "__annotate_delete", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE17__annotate_deleteB8ne200100Ev", scope: !2819, file: !2818, line: 694, type: !3151, scopeLine: 694, flags: DIFlagPrototyped, spFlags: 0)
!3151 = !DISubroutineType(types: !3152)
!3152 = !{null, !2977}
!3153 = !DISubprogram(name: "__annotate_increase", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE19__annotate_increaseB8ne200100Em", scope: !2819, file: !2818, line: 700, type: !3148, scopeLine: 700, flags: DIFlagPrototyped, spFlags: 0)
!3154 = !DISubprogram(name: "__annotate_shrink", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE17__annotate_shrinkB8ne200100Em", scope: !2819, file: !2818, line: 707, type: !3148, scopeLine: 707, flags: DIFlagPrototyped, spFlags: 0)
!3155 = !DISubprogram(name: "__base_destruct_at_end", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE22__base_destruct_at_endB8ne200100EPS1_", scope: !2819, file: !2818, line: 746, type: !3142, scopeLine: 746, flags: DIFlagPrototyped, spFlags: 0)
!3156 = !DISubprogram(name: "__copy_assign_alloc", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE19__copy_assign_allocB8ne200100ERKS4_", scope: !2819, file: !2818, line: 753, type: !2930, scopeLine: 753, flags: DIFlagPrototyped, spFlags: 0)
!3157 = !DISubprogram(name: "__move_assign_alloc", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE19__move_assign_allocB8ne200100ERS4_", scope: !2819, file: !2818, line: 757, type: !3074, scopeLine: 757, flags: DIFlagPrototyped, spFlags: 0)
!3158 = !DISubprogram(name: "__throw_length_error", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE20__throw_length_errorB8ne200100Ev", scope: !2819, file: !2818, line: 763, type: !961, scopeLine: 763, flags: DIFlagPrototyped | DIFlagStaticMember | DIFlagNoReturn, spFlags: 0)
!3159 = !DISubprogram(name: "__throw_out_of_range", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE20__throw_out_of_rangeB8ne200100Ev", scope: !2819, file: !2818, line: 765, type: !961, scopeLine: 765, flags: DIFlagPrototyped | DIFlagStaticMember | DIFlagNoReturn, spFlags: 0)
!3160 = !DISubprogram(name: "__copy_assign_alloc", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE19__copy_assign_allocB8ne200100ERKS4_NS_17integral_constantIbLb1EEE", scope: !2819, file: !2818, line: 767, type: !3161, scopeLine: 767, flags: DIFlagPrototyped, spFlags: 0)
!3161 = !DISubroutineType(types: !3162)
!3162 = !{null, !2909, !2932, !3109}
!3163 = !DISubprogram(name: "__copy_assign_alloc", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE19__copy_assign_allocB8ne200100ERKS4_NS_17integral_constantIbLb0EEE", scope: !2819, file: !2818, line: 777, type: !3164, scopeLine: 777, flags: DIFlagPrototyped, spFlags: 0)
!3164 = !DISubroutineType(types: !3165)
!3165 = !{null, !2909, !2932, !3128}
!3166 = !DISubprogram(name: "__move_assign_alloc", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE19__move_assign_allocB8ne200100ERS4_NS_17integral_constantIbLb1EEE", scope: !2819, file: !2818, line: 779, type: !3107, scopeLine: 779, flags: DIFlagPrototyped, spFlags: 0)
!3167 = !DISubprogram(name: "__move_assign_alloc", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE19__move_assign_allocB8ne200100ERS4_NS_17integral_constantIbLb0EEE", scope: !2819, file: !2818, line: 784, type: !3126, scopeLine: 784, flags: DIFlagPrototyped, spFlags: 0)
!3168 = !{!2884, !3169}
!3169 = !DITemplateTypeParameter(name: "_Allocator", type: !2832, defaulted: true)
!3170 = !DILocalVariable(name: "this", arg: 1, scope: !2817, type: !3171, flags: DIFlagArtificial | DIFlagObjectPointer)
!3171 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2819, size: 64)
!3172 = !DILocation(line: 0, scope: !2817)
!3173 = !DILocalVariable(name: "__n", arg: 2, scope: !2817, file: !2818, line: 402, type: !2918)
!3174 = !DILocation(line: 402, column: 86, scope: !2817)
!3175 = !DILocation(line: 404, column: 18, scope: !2817)
!3176 = !DILocation(line: 404, column: 27, scope: !2817)
!3177 = !DILocation(line: 404, column: 12, scope: !2817)
!3178 = !DILocation(line: 404, column: 5, scope: !2817)
!3179 = distinct !DISubprogram(name: "RegisterPlayer", linkageName: "_Z14RegisterPlayerv", scope: !29, file: !29, line: 930, type: !935, scopeLine: 931, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1694)
!3180 = !DILocalVariable(name: "i", scope: !3179, file: !29, line: 932, type: !7)
!3181 = !DILocation(line: 932, column: 6, scope: !3179)
!3182 = !DILocalVariable(name: "j", scope: !3179, file: !29, line: 932, type: !7)
!3183 = !DILocation(line: 932, column: 9, scope: !3179)
!3184 = !DILocalVariable(name: "filename", scope: !3179, file: !29, line: 933, type: !2728)
!3185 = !DILocation(line: 933, column: 7, scope: !3179)
!3186 = !DILocalVariable(name: "allow_abort_flag", scope: !3179, file: !29, line: 934, type: !7)
!3187 = !DILocation(line: 934, column: 6, scope: !3179)
!3188 = !DILocation(line: 936, column: 14, scope: !3189)
!3189 = distinct !DILexicalBlock(scope: !3179, file: !29, line: 936, column: 6)
!3190 = !DILocation(line: 936, column: 6, scope: !3189)
!3191 = !DILocation(line: 936, column: 26, scope: !3189)
!3192 = !DILocation(line: 936, column: 38, scope: !3189)
!3193 = !DILocation(line: 941, column: 31, scope: !3194)
!3194 = distinct !DILexicalBlock(scope: !3189, file: !29, line: 937, column: 2)
!3195 = !DILocation(line: 942, column: 23, scope: !3194)
!3196 = !DILocation(line: 943, column: 10, scope: !3197)
!3197 = distinct !DILexicalBlock(scope: !3194, file: !29, line: 943, column: 3)
!3198 = !DILocation(line: 943, column: 8, scope: !3197)
!3199 = !DILocation(line: 943, column: 15, scope: !3200)
!3200 = distinct !DILexicalBlock(scope: !3197, file: !29, line: 943, column: 3)
!3201 = !DILocation(line: 943, column: 17, scope: !3200)
!3202 = !DILocation(line: 943, column: 3, scope: !3197)
!3203 = !DILocation(line: 944, column: 11, scope: !3204)
!3204 = distinct !DILexicalBlock(scope: !3200, file: !29, line: 944, column: 4)
!3205 = !DILocation(line: 944, column: 9, scope: !3204)
!3206 = !DILocation(line: 944, column: 16, scope: !3207)
!3207 = distinct !DILexicalBlock(scope: !3204, file: !29, line: 944, column: 4)
!3208 = !DILocation(line: 944, column: 18, scope: !3207)
!3209 = !DILocation(line: 944, column: 4, scope: !3204)
!3210 = !DILocation(line: 945, column: 55, scope: !3207)
!3211 = !DILocation(line: 945, column: 30, scope: !3207)
!3212 = !DILocation(line: 945, column: 58, scope: !3207)
!3213 = !DILocation(line: 945, column: 22, scope: !3207)
!3214 = !DILocation(line: 945, column: 5, scope: !3207)
!3215 = !DILocation(line: 945, column: 25, scope: !3207)
!3216 = !DILocation(line: 945, column: 28, scope: !3207)
!3217 = !DILocation(line: 944, column: 35, scope: !3207)
!3218 = !DILocation(line: 944, column: 4, scope: !3207)
!3219 = distinct !{!3219, !3209, !3220, !1721}
!3220 = !DILocation(line: 945, column: 59, scope: !3204)
!3221 = !DILocation(line: 943, column: 39, scope: !3200)
!3222 = !DILocation(line: 943, column: 3, scope: !3200)
!3223 = distinct !{!3223, !3202, !3224, !1721}
!3224 = !DILocation(line: 945, column: 59, scope: !3197)
!3225 = !DILocation(line: 946, column: 3, scope: !3194)
!3226 = !DILocation(line: 950, column: 19, scope: !3194)
!3227 = !DILocation(line: 950, column: 11, scope: !3194)
!3228 = !DILocation(line: 950, column: 31, scope: !3194)
!3229 = !DILocation(line: 950, column: 3, scope: !3194)
!3230 = !DILocation(line: 952, column: 7, scope: !3231)
!3231 = distinct !DILexicalBlock(scope: !3194, file: !29, line: 952, column: 7)
!3232 = !DILocation(line: 952, column: 29, scope: !3231)
!3233 = !DILocation(line: 953, column: 21, scope: !3231)
!3234 = !DILocation(line: 953, column: 4, scope: !3231)
!3235 = !DILocation(line: 954, column: 2, scope: !3194)
!3236 = !DILocation(line: 936, column: 41, scope: !3189)
!3237 = !DILabel(scope: !3179, name: "do_menu_again", file: !29, line: 956)
!3238 = !DILocation(line: 956, column: 1, scope: !3179)
!3239 = !DILocation(line: 960, column: 28, scope: !3240)
!3240 = distinct !DILexicalBlock(scope: !3179, file: !29, line: 960, column: 6)
!3241 = !DILocation(line: 960, column: 55, scope: !3240)
!3242 = !DILocation(line: 960, column: 65, scope: !3240)
!3243 = !DILocation(line: 960, column: 7, scope: !3240)
!3244 = !DILocation(line: 960, column: 6, scope: !3240)
!3245 = !DILocation(line: 961, column: 3, scope: !3246)
!3246 = distinct !DILexicalBlock(scope: !3240, file: !29, line: 960, column: 84)
!3247 = !DILocation(line: 973, column: 6, scope: !3248)
!3248 = distinct !DILexicalBlock(scope: !3179, file: !29, line: 973, column: 6)
!3249 = !DILocation(line: 973, column: 18, scope: !3248)
!3250 = !DILocation(line: 976, column: 26, scope: !3251)
!3251 = distinct !DILexicalBlock(scope: !3252, file: !29, line: 976, column: 7)
!3252 = distinct !DILexicalBlock(scope: !3248, file: !29, line: 974, column: 2)
!3253 = !DILocation(line: 976, column: 8, scope: !3251)
!3254 = !DILocation(line: 976, column: 7, scope: !3251)
!3255 = !DILocation(line: 978, column: 4, scope: !3251)
!3256 = !DILocation(line: 979, column: 2, scope: !3252)
!3257 = !DILocation(line: 982, column: 19, scope: !3258)
!3258 = distinct !DILexicalBlock(scope: !3248, file: !29, line: 981, column: 2)
!3259 = !DILocation(line: 982, column: 11, scope: !3258)
!3260 = !DILocation(line: 982, column: 31, scope: !3258)
!3261 = !DILocation(line: 982, column: 41, scope: !3258)
!3262 = !DILocation(line: 982, column: 3, scope: !3258)
!3263 = !DILocation(line: 985, column: 6, scope: !3264)
!3264 = distinct !DILexicalBlock(scope: !3179, file: !29, line: 985, column: 6)
!3265 = !DILocation(line: 985, column: 25, scope: !3264)
!3266 = !DILocation(line: 986, column: 3, scope: !3264)
!3267 = !DILocation(line: 988, column: 21, scope: !3179)
!3268 = !DILocation(line: 988, column: 19, scope: !3179)
!3269 = !DILocation(line: 990, column: 19, scope: !3179)
!3270 = !DILocation(line: 990, column: 2, scope: !3179)
!3271 = !DILocation(line: 992, column: 2, scope: !3179)
!3272 = !DILocation(line: 994, column: 2, scope: !3179)
!3273 = distinct !DISubprogram(name: "load_bitmap_replacements", linkageName: "_Z24load_bitmap_replacementsPc", scope: !29, file: !29, line: 1017, type: !3274, scopeLine: 1018, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1694)
!3274 = !DISubroutineType(types: !3275)
!3275 = !{null, !21}
!3276 = !DILocalVariable(name: "level_name", arg: 1, scope: !3273, file: !29, line: 1017, type: !21)
!3277 = !DILocation(line: 1017, column: 37, scope: !3273)
!3278 = !DILocalVariable(name: "ifile_name", scope: !3273, file: !29, line: 1019, type: !394)
!3279 = !DILocation(line: 1019, column: 7, scope: !3273)
!3280 = !DILocalVariable(name: "ifile", scope: !3273, file: !29, line: 1020, type: !3281)
!3281 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3282, size: 64)
!3282 = !DIDerivedType(tag: DW_TAG_typedef, name: "CFILE", file: !3283, line: 27, baseType: !3284)
!3283 = !DIFile(filename: "./cfile/cfile.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "c0c63b40a454e07d7452c92e5cb2b9c5")
!3284 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "CFILE", file: !3283, line: 21, size: 192, flags: DIFlagTypePassByValue, elements: !3285, identifier: "_ZTS5CFILE")
!3285 = !{!3286, !3287, !3288, !3289}
!3286 = !DIDerivedType(tag: DW_TAG_member, name: "file", scope: !3284, file: !3283, line: 23, baseType: !651, size: 64)
!3287 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !3284, file: !3283, line: 24, baseType: !7, size: 32, offset: 64)
!3288 = !DIDerivedType(tag: DW_TAG_member, name: "lib_offset", scope: !3284, file: !3283, line: 25, baseType: !7, size: 32, offset: 96)
!3289 = !DIDerivedType(tag: DW_TAG_member, name: "raw_position", scope: !3284, file: !3283, line: 26, baseType: !7, size: 32, offset: 128)
!3290 = !DILocation(line: 1020, column: 9, scope: !3273)
!3291 = !DILocalVariable(name: "i", scope: !3273, file: !29, line: 1021, type: !7)
!3292 = !DILocation(line: 1021, column: 6, scope: !3273)
!3293 = !DILocation(line: 1024, column: 6, scope: !3294)
!3294 = distinct !DILexicalBlock(scope: !3273, file: !29, line: 1024, column: 6)
!3295 = !DILocation(line: 1026, column: 3, scope: !3296)
!3296 = distinct !DILexicalBlock(scope: !3294, file: !29, line: 1025, column: 2)
!3297 = !DILocation(line: 1026, column: 3, scope: !3298)
!3298 = distinct !DILexicalBlock(scope: !3296, file: !29, line: 1026, column: 3)
!3299 = !DILocation(line: 1027, column: 27, scope: !3296)
!3300 = !DILocation(line: 1028, column: 2, scope: !3296)
!3301 = !DILocation(line: 1030, column: 28, scope: !3273)
!3302 = !DILocation(line: 1030, column: 40, scope: !3273)
!3303 = !DILocation(line: 1030, column: 2, scope: !3273)
!3304 = !DILocation(line: 1032, column: 17, scope: !3273)
!3305 = !DILocation(line: 1032, column: 10, scope: !3273)
!3306 = !DILocation(line: 1032, column: 8, scope: !3273)
!3307 = !DILocation(line: 1034, column: 6, scope: !3308)
!3308 = distinct !DILexicalBlock(scope: !3273, file: !29, line: 1034, column: 6)
!3309 = !DILocalVariable(name: "id", scope: !3310, file: !29, line: 1035, type: !7)
!3310 = distinct !DILexicalBlock(scope: !3308, file: !29, line: 1034, column: 13)
!3311 = !DILocation(line: 1035, column: 7, scope: !3310)
!3312 = !DILocalVariable(name: "version", scope: !3310, file: !29, line: 1035, type: !7)
!3313 = !DILocation(line: 1035, column: 11, scope: !3310)
!3314 = !DILocalVariable(name: "n_bitmaps", scope: !3310, file: !29, line: 1035, type: !7)
!3315 = !DILocation(line: 1035, column: 20, scope: !3310)
!3316 = !DILocalVariable(name: "bitmap_data_size", scope: !3310, file: !29, line: 1036, type: !7)
!3317 = !DILocation(line: 1036, column: 7, scope: !3310)
!3318 = !DILocalVariable(name: "indices", scope: !3310, file: !29, line: 1037, type: !12)
!3319 = !DILocation(line: 1037, column: 13, scope: !3310)
!3320 = !DILocation(line: 1039, column: 23, scope: !3310)
!3321 = !DILocation(line: 1039, column: 8, scope: !3310)
!3322 = !DILocation(line: 1039, column: 6, scope: !3310)
!3323 = !DILocation(line: 1040, column: 28, scope: !3310)
!3324 = !DILocation(line: 1040, column: 13, scope: !3310)
!3325 = !DILocation(line: 1040, column: 11, scope: !3310)
!3326 = !DILocation(line: 1042, column: 7, scope: !3327)
!3327 = distinct !DILexicalBlock(scope: !3310, file: !29, line: 1042, column: 7)
!3328 = !DILocation(line: 1042, column: 10, scope: !3327)
!3329 = !DILocation(line: 1042, column: 20, scope: !3327)
!3330 = !DILocation(line: 1042, column: 23, scope: !3327)
!3331 = !DILocation(line: 1042, column: 31, scope: !3327)
!3332 = !DILocation(line: 1043, column: 12, scope: !3333)
!3333 = distinct !DILexicalBlock(scope: !3327, file: !29, line: 1042, column: 37)
!3334 = !DILocation(line: 1043, column: 4, scope: !3333)
!3335 = !DILocation(line: 1044, column: 4, scope: !3333)
!3336 = !DILocation(line: 1047, column: 30, scope: !3310)
!3337 = !DILocation(line: 1047, column: 15, scope: !3310)
!3338 = !DILocation(line: 1047, column: 13, scope: !3310)
!3339 = !DILocation(line: 1049, column: 3, scope: !3310)
!3340 = !DILocation(line: 1051, column: 10, scope: !3341)
!3341 = distinct !DILexicalBlock(scope: !3310, file: !29, line: 1051, column: 3)
!3342 = !DILocation(line: 1051, column: 8, scope: !3341)
!3343 = !DILocation(line: 1051, column: 15, scope: !3344)
!3344 = distinct !DILexicalBlock(scope: !3341, file: !29, line: 1051, column: 3)
!3345 = !DILocation(line: 1051, column: 19, scope: !3344)
!3346 = !DILocation(line: 1051, column: 17, scope: !3344)
!3347 = !DILocation(line: 1051, column: 3, scope: !3341)
!3348 = !DILocation(line: 1053, column: 34, scope: !3349)
!3349 = distinct !DILexicalBlock(scope: !3344, file: !29, line: 1052, column: 3)
!3350 = !DILocation(line: 1053, column: 17, scope: !3349)
!3351 = !DILocation(line: 1053, column: 4, scope: !3349)
!3352 = !DILocation(line: 1053, column: 12, scope: !3349)
!3353 = !DILocation(line: 1053, column: 15, scope: !3349)
!3354 = !DILocation(line: 1054, column: 3, scope: !3349)
!3355 = !DILocation(line: 1051, column: 31, scope: !3344)
!3356 = !DILocation(line: 1051, column: 3, scope: !3344)
!3357 = distinct !{!3357, !3347, !3358, !1721}
!3358 = !DILocation(line: 1054, column: 3, scope: !3341)
!3359 = !DILocation(line: 1056, column: 34, scope: !3310)
!3360 = !DILocation(line: 1056, column: 22, scope: !3310)
!3361 = !DILocation(line: 1056, column: 50, scope: !3310)
!3362 = !DILocation(line: 1056, column: 43, scope: !3310)
!3363 = !DILocation(line: 1056, column: 41, scope: !3310)
!3364 = !DILocation(line: 1056, column: 81, scope: !3310)
!3365 = !DILocation(line: 1056, column: 79, scope: !3310)
!3366 = !DILocation(line: 1056, column: 57, scope: !3310)
!3367 = !DILocation(line: 1056, column: 20, scope: !3310)
!3368 = !DILocation(line: 1057, column: 3, scope: !3310)
!3369 = !DILocation(line: 1059, column: 10, scope: !3370)
!3370 = distinct !DILexicalBlock(scope: !3310, file: !29, line: 1059, column: 3)
!3371 = !DILocation(line: 1059, column: 8, scope: !3370)
!3372 = !DILocation(line: 1059, column: 15, scope: !3373)
!3373 = distinct !DILexicalBlock(scope: !3370, file: !29, line: 1059, column: 3)
!3374 = !DILocation(line: 1059, column: 19, scope: !3373)
!3375 = !DILocation(line: 1059, column: 17, scope: !3373)
!3376 = !DILocation(line: 1059, column: 3, scope: !3370)
!3377 = !DILocalVariable(name: "bmh", scope: !3378, file: !29, line: 1061, type: !3379)
!3378 = distinct !DILexicalBlock(scope: !3373, file: !29, line: 1060, column: 3)
!3379 = !DIDerivedType(tag: DW_TAG_typedef, name: "DiskBitmapHeader", file: !29, line: 1012, baseType: !3380)
!3380 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "DiskBitmapHeader", file: !29, line: 1002, size: 160, flags: DIFlagTypePassByValue, elements: !3381, identifier: "_ZTS16DiskBitmapHeader")
!3381 = !{!3382, !3384, !3385, !3386, !3387, !3388, !3389, !3390}
!3382 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !3380, file: !29, line: 1004, baseType: !3383, size: 64)
!3383 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 64, elements: !134)
!3384 = !DIDerivedType(tag: DW_TAG_member, name: "dflags", scope: !3380, file: !29, line: 1005, baseType: !17, size: 8, offset: 64)
!3385 = !DIDerivedType(tag: DW_TAG_member, name: "width", scope: !3380, file: !29, line: 1006, baseType: !17, size: 8, offset: 72)
!3386 = !DIDerivedType(tag: DW_TAG_member, name: "height", scope: !3380, file: !29, line: 1007, baseType: !17, size: 8, offset: 80)
!3387 = !DIDerivedType(tag: DW_TAG_member, name: "wh_extra", scope: !3380, file: !29, line: 1008, baseType: !17, size: 8, offset: 88)
!3388 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !3380, file: !29, line: 1009, baseType: !17, size: 8, offset: 96)
!3389 = !DIDerivedType(tag: DW_TAG_member, name: "avg_color", scope: !3380, file: !29, line: 1010, baseType: !17, size: 8, offset: 104)
!3390 = !DIDerivedType(tag: DW_TAG_member, name: "offset", scope: !3380, file: !29, line: 1011, baseType: !7, size: 32, offset: 128)
!3391 = !DILocation(line: 1061, column: 21, scope: !3378)
!3392 = !DILocalVariable(name: "temp_bitmap", scope: !3378, file: !29, line: 1062, type: !3393)
!3393 = !DIDerivedType(tag: DW_TAG_typedef, name: "grs_bitmap", file: !3394, line: 87, baseType: !3395)
!3394 = !DIFile(filename: "./2d/gr.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "15a87c28ac1ffa2cb346888bc15e47c5")
!3395 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_grs_bitmap", file: !3394, line: 72, size: 256, flags: DIFlagTypePassByValue, elements: !3396, identifier: "_ZTS11_grs_bitmap")
!3396 = !{!3397, !3398, !3399, !3400, !3401, !3402, !3403, !3404, !3405, !3406, !3407}
!3397 = !DIDerivedType(tag: DW_TAG_member, name: "bm_x", scope: !3395, file: !3394, line: 73, baseType: !20, size: 16)
!3398 = !DIDerivedType(tag: DW_TAG_member, name: "bm_y", scope: !3395, file: !3394, line: 73, baseType: !20, size: 16, offset: 16)
!3399 = !DIDerivedType(tag: DW_TAG_member, name: "bm_w", scope: !3395, file: !3394, line: 74, baseType: !20, size: 16, offset: 32)
!3400 = !DIDerivedType(tag: DW_TAG_member, name: "bm_h", scope: !3395, file: !3394, line: 74, baseType: !20, size: 16, offset: 48)
!3401 = !DIDerivedType(tag: DW_TAG_member, name: "bm_type", scope: !3395, file: !3394, line: 75, baseType: !60, size: 8, offset: 64)
!3402 = !DIDerivedType(tag: DW_TAG_member, name: "bm_flags", scope: !3395, file: !3394, line: 76, baseType: !60, size: 8, offset: 72)
!3403 = !DIDerivedType(tag: DW_TAG_member, name: "bm_rowsize", scope: !3395, file: !3394, line: 79, baseType: !20, size: 16, offset: 80)
!3404 = !DIDerivedType(tag: DW_TAG_member, name: "bm_data", scope: !3395, file: !3394, line: 80, baseType: !599, size: 64, offset: 128)
!3405 = !DIDerivedType(tag: DW_TAG_member, name: "bm_selector", scope: !3395, file: !3394, line: 84, baseType: !15, size: 16, offset: 192)
!3406 = !DIDerivedType(tag: DW_TAG_member, name: "avg_color", scope: !3395, file: !3394, line: 85, baseType: !17, size: 8, offset: 208)
!3407 = !DIDerivedType(tag: DW_TAG_member, name: "unused", scope: !3395, file: !3394, line: 86, baseType: !60, size: 8, offset: 216)
!3408 = !DILocation(line: 1062, column: 15, scope: !3378)
!3409 = !DILocation(line: 1065, column: 15, scope: !3378)
!3410 = !DILocation(line: 1065, column: 11, scope: !3378)
!3411 = !DILocation(line: 1065, column: 27, scope: !3378)
!3412 = !DILocation(line: 1065, column: 4, scope: !3378)
!3413 = !DILocation(line: 1066, column: 33, scope: !3378)
!3414 = !DILocation(line: 1066, column: 17, scope: !3378)
!3415 = !DILocation(line: 1066, column: 8, scope: !3378)
!3416 = !DILocation(line: 1066, column: 15, scope: !3378)
!3417 = !DILocation(line: 1067, column: 32, scope: !3378)
!3418 = !DILocation(line: 1067, column: 16, scope: !3378)
!3419 = !DILocation(line: 1067, column: 8, scope: !3378)
!3420 = !DILocation(line: 1067, column: 14, scope: !3378)
!3421 = !DILocation(line: 1068, column: 33, scope: !3378)
!3422 = !DILocation(line: 1068, column: 17, scope: !3378)
!3423 = !DILocation(line: 1068, column: 8, scope: !3378)
!3424 = !DILocation(line: 1068, column: 15, scope: !3378)
!3425 = !DILocation(line: 1069, column: 35, scope: !3378)
!3426 = !DILocation(line: 1069, column: 19, scope: !3378)
!3427 = !DILocation(line: 1069, column: 8, scope: !3378)
!3428 = !DILocation(line: 1069, column: 17, scope: !3378)
!3429 = !DILocation(line: 1070, column: 32, scope: !3378)
!3430 = !DILocation(line: 1070, column: 16, scope: !3378)
!3431 = !DILocation(line: 1070, column: 8, scope: !3378)
!3432 = !DILocation(line: 1070, column: 14, scope: !3378)
!3433 = !DILocation(line: 1071, column: 36, scope: !3378)
!3434 = !DILocation(line: 1071, column: 20, scope: !3378)
!3435 = !DILocation(line: 1071, column: 8, scope: !3378)
!3436 = !DILocation(line: 1071, column: 18, scope: !3378)
!3437 = !DILocation(line: 1072, column: 32, scope: !3378)
!3438 = !DILocation(line: 1072, column: 17, scope: !3378)
!3439 = !DILocation(line: 1072, column: 8, scope: !3378)
!3440 = !DILocation(line: 1072, column: 15, scope: !3378)
!3441 = !DILocation(line: 1074, column: 4, scope: !3378)
!3442 = !DILocation(line: 1076, column: 52, scope: !3378)
!3443 = !DILocation(line: 1076, column: 48, scope: !3378)
!3444 = !DILocation(line: 1076, column: 73, scope: !3378)
!3445 = !DILocation(line: 1076, column: 69, scope: !3378)
!3446 = !DILocation(line: 1076, column: 82, scope: !3378)
!3447 = !DILocation(line: 1076, column: 68, scope: !3378)
!3448 = !DILocation(line: 1076, column: 61, scope: !3378)
!3449 = !DILocation(line: 1076, column: 90, scope: !3378)
!3450 = !DILocation(line: 1076, column: 58, scope: !3378)
!3451 = !DILocation(line: 1076, column: 35, scope: !3378)
!3452 = !DILocation(line: 1076, column: 46, scope: !3378)
!3453 = !DILocation(line: 1076, column: 16, scope: !3378)
!3454 = !DILocation(line: 1076, column: 21, scope: !3378)
!3455 = !DILocation(line: 1077, column: 27, scope: !3378)
!3456 = !DILocation(line: 1077, column: 23, scope: !3378)
!3457 = !DILocation(line: 1077, column: 49, scope: !3378)
!3458 = !DILocation(line: 1077, column: 45, scope: !3378)
!3459 = !DILocation(line: 1077, column: 58, scope: !3378)
!3460 = !DILocation(line: 1077, column: 44, scope: !3378)
!3461 = !DILocation(line: 1077, column: 37, scope: !3378)
!3462 = !DILocation(line: 1077, column: 66, scope: !3378)
!3463 = !DILocation(line: 1077, column: 34, scope: !3378)
!3464 = !DILocation(line: 1077, column: 16, scope: !3378)
!3465 = !DILocation(line: 1077, column: 21, scope: !3378)
!3466 = !DILocation(line: 1078, column: 32, scope: !3378)
!3467 = !DILocation(line: 1078, column: 16, scope: !3378)
!3468 = !DILocation(line: 1078, column: 26, scope: !3378)
!3469 = !DILocation(line: 1079, column: 26, scope: !3378)
!3470 = !DILocation(line: 1079, column: 56, scope: !3378)
!3471 = !DILocation(line: 1079, column: 50, scope: !3378)
!3472 = !DILocation(line: 1079, column: 16, scope: !3378)
!3473 = !DILocation(line: 1079, column: 24, scope: !3378)
!3474 = !DILocation(line: 1081, column: 12, scope: !3475)
!3475 = distinct !DILexicalBlock(scope: !3378, file: !29, line: 1081, column: 8)
!3476 = !DILocation(line: 1081, column: 8, scope: !3475)
!3477 = !DILocation(line: 1081, column: 18, scope: !3475)
!3478 = !DILocation(line: 1081, column: 53, scope: !3475)
!3479 = !DILocation(line: 1081, column: 62, scope: !3475)
!3480 = !DILocation(line: 1081, column: 41, scope: !3475)
!3481 = !DILocation(line: 1082, column: 12, scope: !3482)
!3482 = distinct !DILexicalBlock(scope: !3378, file: !29, line: 1082, column: 8)
!3483 = !DILocation(line: 1082, column: 8, scope: !3482)
!3484 = !DILocation(line: 1082, column: 18, scope: !3482)
!3485 = !DILocation(line: 1082, column: 59, scope: !3482)
!3486 = !DILocation(line: 1082, column: 68, scope: !3482)
!3487 = !DILocation(line: 1082, column: 47, scope: !3482)
!3488 = !DILocation(line: 1083, column: 12, scope: !3489)
!3489 = distinct !DILexicalBlock(scope: !3378, file: !29, line: 1083, column: 8)
!3490 = !DILocation(line: 1083, column: 8, scope: !3489)
!3491 = !DILocation(line: 1083, column: 18, scope: !3489)
!3492 = !DILocation(line: 1083, column: 53, scope: !3489)
!3493 = !DILocation(line: 1083, column: 62, scope: !3489)
!3494 = !DILocation(line: 1083, column: 41, scope: !3489)
!3495 = !DILocation(line: 1084, column: 12, scope: !3496)
!3496 = distinct !DILexicalBlock(scope: !3378, file: !29, line: 1084, column: 8)
!3497 = !DILocation(line: 1084, column: 8, scope: !3496)
!3498 = !DILocation(line: 1084, column: 18, scope: !3496)
!3499 = !DILocation(line: 1084, column: 45, scope: !3496)
!3500 = !DILocation(line: 1084, column: 54, scope: !3496)
!3501 = !DILocation(line: 1084, column: 33, scope: !3496)
!3502 = !DILocation(line: 1085, column: 12, scope: !3503)
!3503 = distinct !DILexicalBlock(scope: !3378, file: !29, line: 1085, column: 8)
!3504 = !DILocation(line: 1085, column: 8, scope: !3503)
!3505 = !DILocation(line: 1085, column: 18, scope: !3503)
!3506 = !DILocation(line: 1085, column: 49, scope: !3503)
!3507 = !DILocation(line: 1085, column: 58, scope: !3503)
!3508 = !DILocation(line: 1085, column: 37, scope: !3503)
!3509 = !DILocation(line: 1087, column: 16, scope: !3378)
!3510 = !DILocation(line: 1087, column: 24, scope: !3378)
!3511 = !DILocation(line: 1087, column: 4, scope: !3378)
!3512 = !DILocation(line: 1087, column: 28, scope: !3378)
!3513 = !DILocation(line: 1088, column: 3, scope: !3378)
!3514 = !DILocation(line: 1059, column: 31, scope: !3373)
!3515 = !DILocation(line: 1059, column: 3, scope: !3373)
!3516 = distinct !{!3516, !3376, !3517, !1721}
!3517 = !DILocation(line: 1088, column: 3, scope: !3370)
!3518 = !DILocation(line: 1090, column: 10, scope: !3310)
!3519 = !DILocation(line: 1090, column: 38, scope: !3310)
!3520 = !DILocation(line: 1090, column: 56, scope: !3310)
!3521 = !DILocation(line: 1090, column: 3, scope: !3310)
!3522 = !DILocation(line: 1092, column: 3, scope: !3310)
!3523 = !DILocation(line: 1092, column: 3, scope: !3524)
!3524 = distinct !DILexicalBlock(scope: !3310, file: !29, line: 1092, column: 3)
!3525 = !DILocation(line: 1094, column: 11, scope: !3310)
!3526 = !DILocation(line: 1094, column: 3, scope: !3310)
!3527 = !DILocation(line: 1096, column: 30, scope: !3310)
!3528 = !DILocation(line: 1098, column: 3, scope: !3310)
!3529 = !DILocation(line: 1099, column: 2, scope: !3310)
!3530 = !DILocation(line: 1100, column: 1, scope: !3273)
!3531 = distinct !DISubprogram(name: "LoadLevel", linkageName: "_Z9LoadLevelii", scope: !29, file: !29, line: 1107, type: !3532, scopeLine: 1108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1694)
!3532 = !DISubroutineType(types: !3533)
!3533 = !{null, !7, !7}
!3534 = !DILocalVariable(name: "level_num", arg: 1, scope: !3531, file: !29, line: 1107, type: !7)
!3535 = !DILocation(line: 1107, column: 20, scope: !3531)
!3536 = !DILocalVariable(name: "page_in_textures", arg: 2, scope: !3531, file: !29, line: 1107, type: !7)
!3537 = !DILocation(line: 1107, column: 35, scope: !3531)
!3538 = !DILocalVariable(name: "level_name", scope: !3531, file: !29, line: 1109, type: !21)
!3539 = !DILocation(line: 1109, column: 8, scope: !3531)
!3540 = !DILocalVariable(name: "save_player", scope: !3531, file: !29, line: 1110, type: !46)
!3541 = !DILocation(line: 1110, column: 9, scope: !3531)
!3542 = !DILocalVariable(name: "load_ret", scope: !3531, file: !29, line: 1111, type: !7)
!3543 = !DILocation(line: 1111, column: 6, scope: !3531)
!3544 = !DILocation(line: 1113, column: 24, scope: !3531)
!3545 = !DILocation(line: 1113, column: 16, scope: !3531)
!3546 = !DILocation(line: 1113, column: 14, scope: !3531)
!3547 = !DILocation(line: 1115, column: 2, scope: !3531)
!3548 = !DILocation(line: 0, scope: !3531)
!3549 = !DILocation(line: 1117, column: 6, scope: !3550)
!3550 = distinct !DILexicalBlock(scope: !3531, file: !29, line: 1117, column: 6)
!3551 = !DILocation(line: 1117, column: 16, scope: !3550)
!3552 = !DILocation(line: 1118, column: 36, scope: !3550)
!3553 = !DILocation(line: 1118, column: 35, scope: !3550)
!3554 = !DILocation(line: 1118, column: 46, scope: !3550)
!3555 = !DILocation(line: 1118, column: 16, scope: !3550)
!3556 = !DILocation(line: 1118, column: 14, scope: !3550)
!3557 = !DILocation(line: 1118, column: 3, scope: !3550)
!3558 = !DILocation(line: 1120, column: 28, scope: !3550)
!3559 = !DILocation(line: 1120, column: 38, scope: !3550)
!3560 = !DILocation(line: 1120, column: 16, scope: !3550)
!3561 = !DILocation(line: 1120, column: 14, scope: !3550)
!3562 = !DILocation(line: 1122, column: 2, scope: !3531)
!3563 = !DILocation(line: 1123, column: 18, scope: !3531)
!3564 = !DILocation(line: 1123, column: 2, scope: !3531)
!3565 = !DILocation(line: 1125, column: 16, scope: !3531)
!3566 = !DILocation(line: 1131, column: 21, scope: !3531)
!3567 = !DILocation(line: 1131, column: 2, scope: !3531)
!3568 = !DILocation(line: 1132, column: 2, scope: !3531)
!3569 = !DILocation(line: 1133, column: 2, scope: !3531)
!3570 = !DILocation(line: 1137, column: 24, scope: !3531)
!3571 = !DILocation(line: 1137, column: 13, scope: !3531)
!3572 = !DILocation(line: 1137, column: 11, scope: !3531)
!3573 = !DILocation(line: 1139, column: 6, scope: !3574)
!3574 = distinct !DILexicalBlock(scope: !3531, file: !29, line: 1139, column: 6)
!3575 = !DILocation(line: 1140, column: 54, scope: !3574)
!3576 = !DILocation(line: 1140, column: 66, scope: !3574)
!3577 = !DILocation(line: 1140, column: 3, scope: !3574)
!3578 = !DILocation(line: 1142, column: 22, scope: !3531)
!3579 = !DILocation(line: 1142, column: 20, scope: !3531)
!3580 = !DILocation(line: 1146, column: 2, scope: !3531)
!3581 = !DILocation(line: 1148, column: 6, scope: !3582)
!3582 = distinct !DILexicalBlock(scope: !3531, file: !29, line: 1148, column: 6)
!3583 = !DILocation(line: 1148, column: 25, scope: !3582)
!3584 = !DILocation(line: 1149, column: 22, scope: !3582)
!3585 = !DILocation(line: 1149, column: 3, scope: !3582)
!3586 = !DILocation(line: 1151, column: 6, scope: !3587)
!3587 = distinct !DILexicalBlock(scope: !3531, file: !29, line: 1151, column: 6)
!3588 = !DILocation(line: 1152, column: 3, scope: !3587)
!3589 = !DILocation(line: 1154, column: 27, scope: !3531)
!3590 = !DILocation(line: 1154, column: 2, scope: !3531)
!3591 = !DILocation(line: 1156, column: 6, scope: !3592)
!3592 = distinct !DILexicalBlock(scope: !3531, file: !29, line: 1156, column: 6)
!3593 = !DILocation(line: 1157, column: 3, scope: !3594)
!3594 = distinct !DILexicalBlock(scope: !3592, file: !29, line: 1156, column: 33)
!3595 = !DILocation(line: 1158, column: 29, scope: !3594)
!3596 = !DILocation(line: 1159, column: 2, scope: !3594)
!3597 = !DILocation(line: 1160, column: 26, scope: !3531)
!3598 = !DILocation(line: 1160, column: 2, scope: !3531)
!3599 = !DILocation(line: 1166, column: 2, scope: !3531)
!3600 = !DILocation(line: 1168, column: 10, scope: !3531)
!3601 = !DILocation(line: 1168, column: 2, scope: !3531)
!3602 = !DILocation(line: 1168, column: 22, scope: !3531)
!3603 = !DILocation(line: 1170, column: 2, scope: !3531)
!3604 = !DILocation(line: 1172, column: 24, scope: !3531)
!3605 = !DILocation(line: 1172, column: 2, scope: !3531)
!3606 = !DILocation(line: 1174, column: 2, scope: !3531)
!3607 = !DILocation(line: 1176, column: 2, scope: !3531)
!3608 = !DILocation(line: 1179, column: 1, scope: !3531)
!3609 = distinct !DISubprogram(name: "InitPlayerObject", linkageName: "_Z16InitPlayerObjectv", scope: !29, file: !29, line: 1182, type: !961, scopeLine: 1183, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2)
!3610 = !DILocation(line: 1214, column: 2, scope: !3609)
!3611 = !DILocation(line: 0, scope: !3609)
!3612 = !DILocation(line: 1216, column: 6, scope: !3613)
!3613 = distinct !DILexicalBlock(scope: !3609, file: !29, line: 1216, column: 6)
!3614 = !DILocation(line: 1216, column: 17, scope: !3613)
!3615 = !DILocation(line: 1218, column: 24, scope: !3616)
!3616 = distinct !DILexicalBlock(scope: !3613, file: !29, line: 1217, column: 2)
!3617 = !DILocation(line: 1218, column: 16, scope: !3616)
!3618 = !DILocation(line: 1218, column: 14, scope: !3616)
!3619 = !DILocation(line: 1219, column: 14, scope: !3616)
!3620 = !DILocation(line: 1220, column: 2, scope: !3616)
!3621 = !DILocation(line: 1222, column: 10, scope: !3609)
!3622 = !DILocation(line: 1222, column: 2, scope: !3609)
!3623 = !DILocation(line: 1222, column: 22, scope: !3609)
!3624 = !DILocation(line: 1222, column: 29, scope: !3609)
!3625 = !DILocation(line: 1224, column: 35, scope: !3609)
!3626 = !DILocation(line: 1224, column: 27, scope: !3609)
!3627 = !DILocation(line: 1224, column: 47, scope: !3609)
!3628 = !DILocation(line: 1224, column: 19, scope: !3609)
!3629 = !DILocation(line: 1224, column: 16, scope: !3609)
!3630 = !DILocation(line: 1226, column: 2, scope: !3609)
!3631 = !DILocation(line: 1226, column: 17, scope: !3609)
!3632 = !DILocation(line: 1226, column: 22, scope: !3609)
!3633 = !DILocation(line: 1227, column: 22, scope: !3609)
!3634 = !DILocation(line: 1227, column: 2, scope: !3609)
!3635 = !DILocation(line: 1227, column: 17, scope: !3609)
!3636 = !DILocation(line: 1227, column: 20, scope: !3609)
!3637 = !DILocation(line: 1228, column: 2, scope: !3609)
!3638 = !DILocation(line: 1228, column: 17, scope: !3609)
!3639 = !DILocation(line: 1228, column: 30, scope: !3609)
!3640 = !DILocation(line: 1229, column: 2, scope: !3609)
!3641 = !DILocation(line: 1229, column: 17, scope: !3609)
!3642 = !DILocation(line: 1229, column: 31, scope: !3609)
!3643 = !DILocation(line: 1230, column: 1, scope: !3609)
!3644 = distinct !DISubprogram(name: "StartNewGame", linkageName: "_Z12StartNewGamei", scope: !29, file: !29, line: 1238, type: !970, scopeLine: 1239, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1694)
!3645 = !DILocalVariable(name: "start_level", arg: 1, scope: !3644, file: !29, line: 1238, type: !7)
!3646 = !DILocation(line: 1238, column: 23, scope: !3644)
!3647 = !DILocation(line: 1240, column: 12, scope: !3644)
!3648 = !DILocation(line: 1241, column: 16, scope: !3644)
!3649 = !DILocation(line: 1243, column: 17, scope: !3644)
!3650 = !DILocation(line: 1245, column: 2, scope: !3644)
!3651 = !DILocation(line: 1247, column: 2, scope: !3644)
!3652 = !DILocation(line: 1249, column: 12, scope: !3644)
!3653 = !DILocation(line: 1254, column: 6, scope: !3654)
!3654 = distinct !DILexicalBlock(scope: !3644, file: !29, line: 1254, column: 6)
!3655 = !DILocation(line: 1254, column: 18, scope: !3654)
!3656 = !DILocation(line: 1255, column: 23, scope: !3654)
!3657 = !DILocation(line: 1255, column: 3, scope: !3654)
!3658 = !DILocation(line: 1257, column: 17, scope: !3654)
!3659 = !DILocation(line: 1257, column: 3, scope: !3654)
!3660 = !DILocation(line: 1259, column: 39, scope: !3644)
!3661 = !DILocation(line: 1259, column: 10, scope: !3644)
!3662 = !DILocation(line: 1259, column: 2, scope: !3644)
!3663 = !DILocation(line: 1259, column: 22, scope: !3644)
!3664 = !DILocation(line: 1259, column: 37, scope: !3644)
!3665 = !DILocation(line: 1261, column: 2, scope: !3644)
!3666 = !DILocation(line: 1263, column: 2, scope: !3644)
!3667 = !DILocation(line: 1264, column: 1, scope: !3644)
!3668 = distinct !DISubprogram(name: "StartNewLevelSecret", linkageName: "_Z19StartNewLevelSecretii", scope: !29, file: !29, line: 1520, type: !3532, scopeLine: 1521, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1694)
!3669 = !DILocalVariable(name: "level_num", arg: 1, scope: !3668, file: !29, line: 1520, type: !7)
!3670 = !DILocation(line: 1520, column: 30, scope: !3668)
!3671 = !DILocalVariable(name: "page_in_textures", arg: 2, scope: !3668, file: !29, line: 1520, type: !7)
!3672 = !DILocation(line: 1520, column: 45, scope: !3668)
!3673 = !DILocalVariable(name: "m", scope: !3668, file: !29, line: 1522, type: !3674)
!3674 = !DICompositeType(tag: DW_TAG_array_type, baseType: !2731, size: 768, elements: !641)
!3675 = !DILocation(line: 1522, column: 15, scope: !3668)
!3676 = !DILocation(line: 1525, column: 16, scope: !3668)
!3677 = !DILocation(line: 1527, column: 2, scope: !3668)
!3678 = !DILocation(line: 1527, column: 7, scope: !3668)
!3679 = !DILocation(line: 1527, column: 12, scope: !3668)
!3680 = !DILocation(line: 1528, column: 2, scope: !3668)
!3681 = !DILocation(line: 1528, column: 7, scope: !3668)
!3682 = !DILocation(line: 1528, column: 12, scope: !3668)
!3683 = !DILocation(line: 1530, column: 21, scope: !3668)
!3684 = !DILocation(line: 1532, column: 6, scope: !3685)
!3685 = distinct !DILexicalBlock(scope: !3668, file: !29, line: 1532, column: 6)
!3686 = !DILocation(line: 1532, column: 20, scope: !3685)
!3687 = !DILocation(line: 1533, column: 17, scope: !3685)
!3688 = !DILocation(line: 1533, column: 3, scope: !3685)
!3689 = !DILocation(line: 1535, column: 6, scope: !3690)
!3690 = distinct !DILexicalBlock(scope: !3668, file: !29, line: 1535, column: 6)
!3691 = !DILocation(line: 1535, column: 20, scope: !3690)
!3692 = !DILocation(line: 1537, column: 25, scope: !3693)
!3693 = distinct !DILexicalBlock(scope: !3690, file: !29, line: 1536, column: 2)
!3694 = !DILocation(line: 1537, column: 3, scope: !3693)
!3695 = !DILocation(line: 1538, column: 30, scope: !3693)
!3696 = !DILocation(line: 1538, column: 42, scope: !3693)
!3697 = !DILocation(line: 1538, column: 3, scope: !3693)
!3698 = !DILocation(line: 1539, column: 2, scope: !3693)
!3699 = !DILocation(line: 1540, column: 11, scope: !3700)
!3700 = distinct !DILexicalBlock(scope: !3690, file: !29, line: 1540, column: 11)
!3701 = !DILocation(line: 1540, column: 25, scope: !3700)
!3702 = !DILocation(line: 1543, column: 3, scope: !3703)
!3703 = distinct !DILexicalBlock(scope: !3700, file: !29, line: 1541, column: 2)
!3704 = !DILocation(line: 1545, column: 3, scope: !3703)
!3705 = !DILocation(line: 1547, column: 7, scope: !3706)
!3706 = distinct !DILexicalBlock(scope: !3703, file: !29, line: 1547, column: 7)
!3707 = !DILocation(line: 1549, column: 22, scope: !3708)
!3708 = distinct !DILexicalBlock(scope: !3706, file: !29, line: 1548, column: 3)
!3709 = !DILocation(line: 1549, column: 4, scope: !3708)
!3710 = !DILocation(line: 1550, column: 3, scope: !3708)
!3711 = !DILocalVariable(name: "fp", scope: !3712, file: !29, line: 1553, type: !651)
!3712 = distinct !DILexicalBlock(scope: !3706, file: !29, line: 1552, column: 3)
!3713 = !DILocation(line: 1553, column: 10, scope: !3712)
!3714 = !DILocation(line: 1554, column: 14, scope: !3715)
!3715 = distinct !DILexicalBlock(scope: !3712, file: !29, line: 1554, column: 8)
!3716 = !DILocation(line: 1554, column: 12, scope: !3715)
!3717 = !DILocation(line: 1554, column: 45, scope: !3715)
!3718 = !DILocation(line: 1556, column: 12, scope: !3719)
!3719 = distinct !DILexicalBlock(scope: !3715, file: !29, line: 1555, column: 4)
!3720 = !DILocation(line: 1556, column: 5, scope: !3719)
!3721 = !DILocation(line: 1557, column: 23, scope: !3719)
!3722 = !DILocation(line: 1557, column: 5, scope: !3719)
!3723 = !DILocation(line: 1558, column: 4, scope: !3719)
!3724 = !DILocalVariable(name: "text_str", scope: !3725, file: !29, line: 1561, type: !572)
!3725 = distinct !DILexicalBlock(scope: !3715, file: !29, line: 1560, column: 4)
!3726 = !DILocation(line: 1561, column: 10, scope: !3725)
!3727 = !DILocation(line: 1563, column: 13, scope: !3725)
!3728 = !DILocation(line: 1563, column: 82, scope: !3725)
!3729 = !DILocation(line: 1563, column: 100, scope: !3725)
!3730 = !DILocation(line: 1563, column: 5, scope: !3725)
!3731 = !DILocation(line: 1564, column: 23, scope: !3725)
!3732 = !DILocation(line: 1564, column: 5, scope: !3725)
!3733 = !DILocation(line: 1567, column: 2, scope: !3703)
!3734 = !DILocation(line: 1569, column: 12, scope: !3668)
!3735 = !DILocation(line: 1569, column: 23, scope: !3668)
!3736 = !DILocation(line: 1569, column: 2, scope: !3668)
!3737 = !DILocation(line: 1571, column: 2, scope: !3668)
!3738 = !DILocation(line: 1573, column: 2, scope: !3668)
!3739 = !DILocation(line: 1575, column: 2, scope: !3668)
!3740 = !DILocation(line: 1578, column: 2, scope: !3668)
!3741 = !DILocation(line: 1580, column: 2, scope: !3668)
!3742 = !DILocation(line: 1584, column: 28, scope: !3668)
!3743 = !DILocation(line: 1584, column: 20, scope: !3668)
!3744 = !DILocation(line: 1584, column: 40, scope: !3668)
!3745 = !DILocation(line: 1584, column: 12, scope: !3668)
!3746 = !DILocation(line: 1584, column: 9, scope: !3668)
!3747 = !DILocation(line: 1586, column: 2, scope: !3668)
!3748 = !DILocation(line: 1588, column: 17, scope: !3668)
!3749 = !DILocation(line: 1590, column: 27, scope: !3668)
!3750 = !DILocation(line: 1592, column: 2, scope: !3668)
!3751 = !DILocation(line: 1593, column: 2, scope: !3668)
!3752 = !DILocation(line: 1595, column: 6, scope: !3753)
!3753 = distinct !DILexicalBlock(scope: !3668, file: !29, line: 1595, column: 6)
!3754 = !DILocation(line: 1595, column: 25, scope: !3753)
!3755 = !DILocation(line: 1595, column: 29, scope: !3753)
!3756 = !DILocation(line: 1595, column: 43, scope: !3753)
!3757 = !DILocation(line: 1597, column: 3, scope: !3758)
!3758 = distinct !DILexicalBlock(scope: !3753, file: !29, line: 1596, column: 2)
!3759 = !DILocation(line: 1598, column: 3, scope: !3758)
!3760 = !DILocation(line: 1599, column: 3, scope: !3758)
!3761 = !DILocation(line: 1600, column: 3, scope: !3758)
!3762 = !DILocation(line: 1601, column: 3, scope: !3758)
!3763 = !DILocation(line: 1602, column: 3, scope: !3758)
!3764 = !DILocation(line: 1603, column: 3, scope: !3758)
!3765 = !DILocation(line: 1604, column: 2, scope: !3758)
!3766 = !DILocalVariable(name: "fp", scope: !3767, file: !29, line: 1607, type: !651)
!3767 = distinct !DILexicalBlock(scope: !3753, file: !29, line: 1606, column: 2)
!3768 = !DILocation(line: 1607, column: 9, scope: !3767)
!3769 = !DILocation(line: 1608, column: 13, scope: !3770)
!3770 = distinct !DILexicalBlock(scope: !3767, file: !29, line: 1608, column: 7)
!3771 = !DILocation(line: 1608, column: 11, scope: !3770)
!3772 = !DILocation(line: 1608, column: 44, scope: !3770)
!3773 = !DILocalVariable(name: "pw_save", scope: !3774, file: !29, line: 1610, type: !7)
!3774 = distinct !DILexicalBlock(scope: !3770, file: !29, line: 1609, column: 3)
!3775 = !DILocation(line: 1610, column: 8, scope: !3774)
!3776 = !DILocalVariable(name: "sw_save", scope: !3774, file: !29, line: 1610, type: !7)
!3777 = !DILocation(line: 1610, column: 17, scope: !3774)
!3778 = !DILocation(line: 1612, column: 11, scope: !3774)
!3779 = !DILocation(line: 1612, column: 4, scope: !3774)
!3780 = !DILocation(line: 1614, column: 14, scope: !3774)
!3781 = !DILocation(line: 1614, column: 12, scope: !3774)
!3782 = !DILocation(line: 1615, column: 14, scope: !3774)
!3783 = !DILocation(line: 1615, column: 12, scope: !3774)
!3784 = !DILocation(line: 1616, column: 4, scope: !3774)
!3785 = !DILocation(line: 1617, column: 21, scope: !3774)
!3786 = !DILocation(line: 1617, column: 19, scope: !3774)
!3787 = !DILocation(line: 1618, column: 23, scope: !3774)
!3788 = !DILocation(line: 1618, column: 21, scope: !3774)
!3789 = !DILocation(line: 1619, column: 4, scope: !3774)
!3790 = !DILocation(line: 1620, column: 4, scope: !3774)
!3791 = !DILocation(line: 1622, column: 3, scope: !3774)
!3792 = !DILocalVariable(name: "text_str", scope: !3793, file: !29, line: 1625, type: !572)
!3793 = distinct !DILexicalBlock(scope: !3770, file: !29, line: 1624, column: 3)
!3794 = !DILocation(line: 1625, column: 9, scope: !3793)
!3795 = !DILocation(line: 1627, column: 12, scope: !3793)
!3796 = !DILocation(line: 1627, column: 81, scope: !3793)
!3797 = !DILocation(line: 1627, column: 99, scope: !3793)
!3798 = !DILocation(line: 1627, column: 4, scope: !3793)
!3799 = !DILocation(line: 1628, column: 22, scope: !3793)
!3800 = !DILocation(line: 1628, column: 4, scope: !3793)
!3801 = !DILocation(line: 1629, column: 4, scope: !3793)
!3802 = !DILocation(line: 1639, column: 6, scope: !3803)
!3803 = distinct !DILexicalBlock(scope: !3668, file: !29, line: 1639, column: 6)
!3804 = !DILocation(line: 1641, column: 3, scope: !3805)
!3805 = distinct !DILexicalBlock(scope: !3803, file: !29, line: 1640, column: 2)
!3806 = !DILocation(line: 1642, column: 2, scope: !3805)
!3807 = !DILocation(line: 1644, column: 2, scope: !3668)
!3808 = !DILocation(line: 1646, column: 2, scope: !3668)
!3809 = !DILocation(line: 1649, column: 26, scope: !3668)
!3810 = !DILocation(line: 1651, column: 21, scope: !3668)
!3811 = !DILocation(line: 1652, column: 1, scope: !3668)
!3812 = distinct !DISubprogram(name: "StartNewLevel", linkageName: "_Z13StartNewLevelii", scope: !29, file: !29, line: 2518, type: !3532, scopeLine: 2519, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1694)
!3813 = !DILocalVariable(name: "level_num", arg: 1, scope: !3812, file: !29, line: 2518, type: !7)
!3814 = !DILocation(line: 2518, column: 24, scope: !3812)
!3815 = !DILocalVariable(name: "secret_flag", arg: 2, scope: !3812, file: !29, line: 2518, type: !7)
!3816 = !DILocation(line: 2518, column: 39, scope: !3812)
!3817 = !DILocation(line: 2520, column: 16, scope: !3812)
!3818 = !DILocation(line: 2522, column: 7, scope: !3819)
!3819 = distinct !DILexicalBlock(scope: !3812, file: !29, line: 2522, column: 6)
!3820 = !DILocation(line: 2522, column: 17, scope: !3819)
!3821 = !DILocation(line: 2522, column: 22, scope: !3819)
!3822 = !DILocation(line: 2522, column: 27, scope: !3819)
!3823 = !DILocation(line: 2524, column: 32, scope: !3824)
!3824 = distinct !DILexicalBlock(scope: !3819, file: !29, line: 2523, column: 2)
!3825 = !DILocation(line: 2524, column: 3, scope: !3824)
!3826 = !DILocation(line: 2525, column: 2, scope: !3824)
!3827 = !DILocation(line: 2527, column: 17, scope: !3812)
!3828 = !DILocation(line: 2527, column: 2, scope: !3812)
!3829 = !DILocation(line: 2529, column: 19, scope: !3812)
!3830 = !DILocation(line: 2529, column: 33, scope: !3812)
!3831 = !DILocation(line: 2529, column: 2, scope: !3812)
!3832 = !DILocation(line: 2530, column: 1, scope: !3812)
!3833 = distinct !DISubprogram(name: "DoEndLevelScoreGlitz", linkageName: "_Z20DoEndLevelScoreGlitzi", scope: !29, file: !29, line: 1297, type: !970, scopeLine: 1298, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1694)
!3834 = !DILocalVariable(name: "network", arg: 1, scope: !3833, file: !29, line: 1297, type: !7)
!3835 = !DILocation(line: 1297, column: 31, scope: !3833)
!3836 = !DILocalVariable(name: "level_points", scope: !3833, file: !29, line: 1299, type: !7)
!3837 = !DILocation(line: 1299, column: 6, scope: !3833)
!3838 = !DILocalVariable(name: "skill_points", scope: !3833, file: !29, line: 1299, type: !7)
!3839 = !DILocation(line: 1299, column: 20, scope: !3833)
!3840 = !DILocalVariable(name: "energy_points", scope: !3833, file: !29, line: 1299, type: !7)
!3841 = !DILocation(line: 1299, column: 34, scope: !3833)
!3842 = !DILocalVariable(name: "shield_points", scope: !3833, file: !29, line: 1299, type: !7)
!3843 = !DILocation(line: 1299, column: 49, scope: !3833)
!3844 = !DILocalVariable(name: "hostage_points", scope: !3833, file: !29, line: 1299, type: !7)
!3845 = !DILocation(line: 1299, column: 64, scope: !3833)
!3846 = !DILocalVariable(name: "all_hostage_points", scope: !3833, file: !29, line: 1300, type: !7)
!3847 = !DILocation(line: 1300, column: 6, scope: !3833)
!3848 = !DILocalVariable(name: "endgame_points", scope: !3833, file: !29, line: 1301, type: !7)
!3849 = !DILocation(line: 1301, column: 6, scope: !3833)
!3850 = !DILocalVariable(name: "all_hostage_text", scope: !3833, file: !29, line: 1302, type: !3851)
!3851 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 512, elements: !3852)
!3852 = !{!3853}
!3853 = !DISubrange(count: 64)
!3854 = !DILocation(line: 1302, column: 7, scope: !3833)
!3855 = !DILocalVariable(name: "endgame_text", scope: !3833, file: !29, line: 1303, type: !3851)
!3856 = !DILocation(line: 1303, column: 7, scope: !3833)
!3857 = !DILocalVariable(name: "m_str", scope: !3833, file: !29, line: 1305, type: !3858)
!3858 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 2640, elements: !3859)
!3859 = !{!180, !3860}
!3860 = !DISubrange(count: 30)
!3861 = !DILocation(line: 1305, column: 10, scope: !3833)
!3862 = !DILocalVariable(name: "m", scope: !3833, file: !29, line: 1306, type: !3863)
!3863 = !DICompositeType(tag: DW_TAG_array_type, baseType: !2731, size: 9216, elements: !109)
!3864 = !DILocation(line: 1306, column: 15, scope: !3833)
!3865 = !DILocalVariable(name: "i", scope: !3833, file: !29, line: 1307, type: !7)
!3866 = !DILocation(line: 1307, column: 9, scope: !3833)
!3867 = !DILocalVariable(name: "c", scope: !3833, file: !29, line: 1307, type: !7)
!3868 = !DILocation(line: 1307, column: 12, scope: !3833)
!3869 = !DILocalVariable(name: "title", scope: !3833, file: !29, line: 1308, type: !572)
!3870 = !DILocation(line: 1308, column: 10, scope: !3833)
!3871 = !DILocalVariable(name: "is_last_level", scope: !3833, file: !29, line: 1309, type: !7)
!3872 = !DILocation(line: 1309, column: 9, scope: !3833)
!3873 = !DILocalVariable(name: "mine_level", scope: !3833, file: !29, line: 1310, type: !7)
!3874 = !DILocation(line: 1310, column: 9, scope: !3833)
!3875 = !DILocation(line: 1312, column: 2, scope: !3833)
!3876 = !DILocation(line: 1319, column: 2, scope: !3833)
!3877 = !DILocation(line: 1322, column: 23, scope: !3833)
!3878 = !DILocation(line: 1322, column: 15, scope: !3833)
!3879 = !DILocation(line: 1322, column: 35, scope: !3833)
!3880 = !DILocation(line: 1322, column: 13, scope: !3833)
!3881 = !DILocation(line: 1323, column: 6, scope: !3882)
!3882 = distinct !DILexicalBlock(scope: !3833, file: !29, line: 1323, column: 6)
!3883 = !DILocation(line: 1323, column: 17, scope: !3882)
!3884 = !DILocation(line: 1324, column: 19, scope: !3882)
!3885 = !DILocation(line: 1324, column: 32, scope: !3882)
!3886 = !DILocation(line: 1324, column: 30, scope: !3882)
!3887 = !DILocation(line: 1324, column: 17, scope: !3882)
!3888 = !DILocation(line: 1324, column: 14, scope: !3882)
!3889 = !DILocation(line: 1324, column: 3, scope: !3882)
!3890 = !DILocation(line: 1326, column: 25, scope: !3833)
!3891 = !DILocation(line: 1326, column: 17, scope: !3833)
!3892 = !DILocation(line: 1326, column: 37, scope: !3833)
!3893 = !DILocation(line: 1326, column: 53, scope: !3833)
!3894 = !DILocation(line: 1326, column: 45, scope: !3833)
!3895 = !DILocation(line: 1326, column: 65, scope: !3833)
!3896 = !DILocation(line: 1326, column: 43, scope: !3833)
!3897 = !DILocation(line: 1326, column: 15, scope: !3833)
!3898 = !DILocation(line: 1328, column: 7, scope: !3899)
!3899 = distinct !DILexicalBlock(scope: !3833, file: !29, line: 1328, column: 6)
!3900 = !DILocation(line: 1328, column: 6, scope: !3899)
!3901 = !DILocation(line: 1330, column: 7, scope: !3902)
!3902 = distinct !DILexicalBlock(scope: !3903, file: !29, line: 1330, column: 7)
!3903 = distinct !DILexicalBlock(scope: !3899, file: !29, line: 1329, column: 2)
!3904 = !DILocation(line: 1330, column: 24, scope: !3902)
!3905 = !DILocation(line: 1332, column: 19, scope: !3906)
!3906 = distinct !DILexicalBlock(scope: !3902, file: !29, line: 1331, column: 3)
!3907 = !DILocation(line: 1332, column: 35, scope: !3906)
!3908 = !DILocation(line: 1332, column: 32, scope: !3906)
!3909 = !DILocation(line: 1332, column: 53, scope: !3906)
!3910 = !DILocation(line: 1332, column: 17, scope: !3906)
!3911 = !DILocation(line: 1333, column: 20, scope: !3906)
!3912 = !DILocation(line: 1333, column: 33, scope: !3906)
!3913 = !DILocation(line: 1333, column: 17, scope: !3906)
!3914 = !DILocation(line: 1334, column: 3, scope: !3906)
!3915 = !DILocation(line: 1336, column: 17, scope: !3902)
!3916 = !DILocation(line: 1338, column: 31, scope: !3903)
!3917 = !DILocation(line: 1338, column: 23, scope: !3903)
!3918 = !DILocation(line: 1338, column: 43, scope: !3903)
!3919 = !DILocation(line: 1338, column: 19, scope: !3903)
!3920 = !DILocation(line: 1338, column: 52, scope: !3903)
!3921 = !DILocation(line: 1338, column: 58, scope: !3903)
!3922 = !DILocation(line: 1338, column: 56, scope: !3903)
!3923 = !DILocation(line: 1338, column: 17, scope: !3903)
!3924 = !DILocation(line: 1339, column: 31, scope: !3903)
!3925 = !DILocation(line: 1339, column: 23, scope: !3903)
!3926 = !DILocation(line: 1339, column: 43, scope: !3903)
!3927 = !DILocation(line: 1339, column: 19, scope: !3903)
!3928 = !DILocation(line: 1339, column: 51, scope: !3903)
!3929 = !DILocation(line: 1339, column: 57, scope: !3903)
!3930 = !DILocation(line: 1339, column: 55, scope: !3903)
!3931 = !DILocation(line: 1339, column: 17, scope: !3903)
!3932 = !DILocation(line: 1340, column: 28, scope: !3903)
!3933 = !DILocation(line: 1340, column: 20, scope: !3903)
!3934 = !DILocation(line: 1340, column: 40, scope: !3903)
!3935 = !DILocation(line: 1340, column: 58, scope: !3903)
!3936 = !DILocation(line: 1340, column: 67, scope: !3903)
!3937 = !DILocation(line: 1340, column: 84, scope: !3903)
!3938 = !DILocation(line: 1340, column: 64, scope: !3903)
!3939 = !DILocation(line: 1340, column: 18, scope: !3903)
!3940 = !DILocation(line: 1342, column: 20, scope: !3903)
!3941 = !DILocation(line: 1342, column: 34, scope: !3903)
!3942 = !DILocation(line: 1342, column: 17, scope: !3903)
!3943 = !DILocation(line: 1343, column: 20, scope: !3903)
!3944 = !DILocation(line: 1343, column: 34, scope: !3903)
!3945 = !DILocation(line: 1343, column: 17, scope: !3903)
!3946 = !DILocation(line: 1344, column: 2, scope: !3903)
!3947 = !DILocation(line: 1347, column: 16, scope: !3948)
!3948 = distinct !DILexicalBlock(scope: !3899, file: !29, line: 1346, column: 2)
!3949 = !DILocation(line: 1348, column: 17, scope: !3948)
!3950 = !DILocation(line: 1349, column: 17, scope: !3948)
!3951 = !DILocation(line: 1350, column: 18, scope: !3948)
!3952 = !DILocation(line: 1353, column: 2, scope: !3833)
!3953 = !DILocation(line: 1353, column: 22, scope: !3833)
!3954 = !DILocation(line: 1354, column: 2, scope: !3833)
!3955 = !DILocation(line: 1354, column: 18, scope: !3833)
!3956 = !DILocation(line: 1356, column: 7, scope: !3957)
!3957 = distinct !DILexicalBlock(scope: !3833, file: !29, line: 1356, column: 6)
!3958 = !DILocation(line: 1356, column: 22, scope: !3957)
!3959 = !DILocation(line: 1356, column: 34, scope: !3957)
!3960 = !DILocation(line: 1356, column: 26, scope: !3957)
!3961 = !DILocation(line: 1356, column: 46, scope: !3957)
!3962 = !DILocation(line: 1356, column: 75, scope: !3957)
!3963 = !DILocation(line: 1356, column: 67, scope: !3957)
!3964 = !DILocation(line: 1356, column: 87, scope: !3957)
!3965 = !DILocation(line: 1356, column: 64, scope: !3957)
!3966 = !DILocation(line: 1358, column: 32, scope: !3967)
!3967 = distinct !DILexicalBlock(scope: !3957, file: !29, line: 1357, column: 2)
!3968 = !DILocation(line: 1358, column: 24, scope: !3967)
!3969 = !DILocation(line: 1358, column: 44, scope: !3967)
!3970 = !DILocation(line: 1358, column: 62, scope: !3967)
!3971 = !DILocation(line: 1358, column: 72, scope: !3967)
!3972 = !DILocation(line: 1358, column: 89, scope: !3967)
!3973 = !DILocation(line: 1358, column: 69, scope: !3967)
!3974 = !DILocation(line: 1358, column: 22, scope: !3967)
!3975 = !DILocation(line: 1359, column: 11, scope: !3967)
!3976 = !DILocation(line: 1359, column: 39, scope: !3967)
!3977 = !DILocation(line: 1359, column: 62, scope: !3967)
!3978 = !DILocation(line: 1359, column: 3, scope: !3967)
!3979 = !DILocation(line: 1360, column: 2, scope: !3967)
!3980 = !DILocation(line: 1362, column: 22, scope: !3957)
!3981 = !DILocation(line: 1364, column: 7, scope: !3982)
!3982 = distinct !DILexicalBlock(scope: !3833, file: !29, line: 1364, column: 6)
!3983 = !DILocation(line: 1364, column: 22, scope: !3982)
!3984 = !DILocation(line: 1364, column: 27, scope: !3982)
!3985 = !DILocation(line: 1364, column: 37, scope: !3982)
!3986 = !DILocation(line: 1364, column: 26, scope: !3982)
!3987 = !DILocation(line: 1364, column: 49, scope: !3982)
!3988 = !DILocation(line: 1364, column: 61, scope: !3982)
!3989 = !DILocation(line: 1364, column: 53, scope: !3982)
!3990 = !DILocation(line: 1364, column: 73, scope: !3982)
!3991 = !DILocation(line: 1364, column: 52, scope: !3982)
!3992 = !DILocation(line: 1364, column: 80, scope: !3982)
!3993 = !DILocation(line: 1364, column: 84, scope: !3982)
!3994 = !DILocation(line: 1364, column: 105, scope: !3982)
!3995 = !DILocation(line: 1364, column: 102, scope: !3982)
!3996 = !DILocation(line: 1366, column: 28, scope: !3997)
!3997 = distinct !DILexicalBlock(scope: !3982, file: !29, line: 1365, column: 2)
!3998 = !DILocation(line: 1366, column: 20, scope: !3997)
!3999 = !DILocation(line: 1366, column: 40, scope: !3997)
!4000 = !DILocation(line: 1366, column: 46, scope: !3997)
!4001 = !DILocation(line: 1366, column: 18, scope: !3997)
!4002 = !DILocation(line: 1367, column: 11, scope: !3997)
!4003 = !DILocation(line: 1367, column: 35, scope: !3997)
!4004 = !DILocation(line: 1367, column: 51, scope: !3997)
!4005 = !DILocation(line: 1367, column: 3, scope: !3997)
!4006 = !DILocation(line: 1368, column: 17, scope: !3997)
!4007 = !DILocation(line: 1369, column: 2, scope: !3997)
!4008 = !DILocation(line: 1371, column: 34, scope: !3982)
!4009 = !DILocation(line: 1371, column: 18, scope: !3982)
!4010 = !DILocation(line: 1373, column: 2, scope: !3833)
!4011 = !DILocation(line: 1374, column: 28, scope: !3833)
!4012 = !DILocation(line: 1374, column: 43, scope: !3833)
!4013 = !DILocation(line: 1374, column: 41, scope: !3833)
!4014 = !DILocation(line: 1374, column: 59, scope: !3833)
!4015 = !DILocation(line: 1374, column: 57, scope: !3833)
!4016 = !DILocation(line: 1374, column: 75, scope: !3833)
!4017 = !DILocation(line: 1374, column: 73, scope: !3833)
!4018 = !DILocation(line: 1374, column: 92, scope: !3833)
!4019 = !DILocation(line: 1374, column: 90, scope: !3833)
!4020 = !DILocation(line: 1374, column: 113, scope: !3833)
!4021 = !DILocation(line: 1374, column: 111, scope: !3833)
!4022 = !DILocation(line: 1374, column: 2, scope: !3833)
!4023 = !DILocation(line: 1376, column: 4, scope: !3833)
!4024 = !DILocation(line: 1377, column: 17, scope: !3833)
!4025 = !DILocation(line: 1377, column: 10, scope: !3833)
!4026 = !DILocation(line: 1377, column: 30, scope: !3833)
!4027 = !DILocation(line: 1377, column: 48, scope: !3833)
!4028 = !DILocation(line: 1377, column: 2, scope: !3833)
!4029 = !DILocation(line: 1378, column: 17, scope: !3833)
!4030 = !DILocation(line: 1378, column: 10, scope: !3833)
!4031 = !DILocation(line: 1378, column: 30, scope: !3833)
!4032 = !DILocation(line: 1378, column: 48, scope: !3833)
!4033 = !DILocation(line: 1378, column: 2, scope: !3833)
!4034 = !DILocation(line: 1379, column: 17, scope: !3833)
!4035 = !DILocation(line: 1379, column: 10, scope: !3833)
!4036 = !DILocation(line: 1379, column: 30, scope: !3833)
!4037 = !DILocation(line: 1379, column: 49, scope: !3833)
!4038 = !DILocation(line: 1379, column: 2, scope: !3833)
!4039 = !DILocation(line: 1380, column: 17, scope: !3833)
!4040 = !DILocation(line: 1380, column: 10, scope: !3833)
!4041 = !DILocation(line: 1380, column: 30, scope: !3833)
!4042 = !DILocation(line: 1380, column: 47, scope: !3833)
!4043 = !DILocation(line: 1380, column: 2, scope: !3833)
!4044 = !DILocation(line: 1382, column: 17, scope: !3833)
!4045 = !DILocation(line: 1382, column: 10, scope: !3833)
!4046 = !DILocation(line: 1382, column: 28, scope: !3833)
!4047 = !DILocation(line: 1382, column: 2, scope: !3833)
!4048 = !DILocation(line: 1383, column: 8, scope: !4049)
!4049 = distinct !DILexicalBlock(scope: !3833, file: !29, line: 1383, column: 6)
!4050 = !DILocation(line: 1383, column: 18, scope: !4049)
!4051 = !DILocation(line: 1383, column: 7, scope: !4049)
!4052 = !DILocation(line: 1383, column: 30, scope: !4049)
!4053 = !DILocation(line: 1383, column: 42, scope: !4049)
!4054 = !DILocation(line: 1383, column: 34, scope: !4049)
!4055 = !DILocation(line: 1383, column: 54, scope: !4049)
!4056 = !DILocation(line: 1383, column: 33, scope: !4049)
!4057 = !DILocation(line: 1383, column: 61, scope: !4049)
!4058 = !DILocation(line: 1383, column: 65, scope: !4049)
!4059 = !DILocation(line: 1383, column: 86, scope: !4049)
!4060 = !DILocation(line: 1383, column: 83, scope: !4049)
!4061 = !DILocation(line: 1384, column: 18, scope: !4049)
!4062 = !DILocation(line: 1384, column: 11, scope: !4049)
!4063 = !DILocation(line: 1384, column: 29, scope: !4049)
!4064 = !DILocation(line: 1384, column: 3, scope: !4049)
!4065 = !DILocation(line: 1386, column: 17, scope: !3833)
!4066 = !DILocation(line: 1386, column: 10, scope: !3833)
!4067 = !DILocation(line: 1386, column: 32, scope: !3833)
!4068 = !DILocation(line: 1386, column: 49, scope: !3833)
!4069 = !DILocation(line: 1386, column: 65, scope: !3833)
!4070 = !DILocation(line: 1386, column: 63, scope: !3833)
!4071 = !DILocation(line: 1386, column: 81, scope: !3833)
!4072 = !DILocation(line: 1386, column: 79, scope: !3833)
!4073 = !DILocation(line: 1386, column: 98, scope: !3833)
!4074 = !DILocation(line: 1386, column: 96, scope: !3833)
!4075 = !DILocation(line: 1386, column: 113, scope: !3833)
!4076 = !DILocation(line: 1386, column: 111, scope: !3833)
!4077 = !DILocation(line: 1386, column: 134, scope: !3833)
!4078 = !DILocation(line: 1386, column: 132, scope: !3833)
!4079 = !DILocation(line: 1386, column: 2, scope: !3833)
!4080 = !DILocation(line: 1387, column: 17, scope: !3833)
!4081 = !DILocation(line: 1387, column: 10, scope: !3833)
!4082 = !DILocation(line: 1387, column: 30, scope: !3833)
!4083 = !DILocation(line: 1387, column: 55, scope: !3833)
!4084 = !DILocation(line: 1387, column: 47, scope: !3833)
!4085 = !DILocation(line: 1387, column: 67, scope: !3833)
!4086 = !DILocation(line: 1387, column: 2, scope: !3833)
!4087 = !DILocation(line: 1394, column: 9, scope: !4088)
!4088 = distinct !DILexicalBlock(scope: !3833, file: !29, line: 1394, column: 2)
!4089 = !DILocation(line: 1394, column: 7, scope: !4088)
!4090 = !DILocation(line: 1394, column: 14, scope: !4091)
!4091 = distinct !DILexicalBlock(scope: !4088, file: !29, line: 1394, column: 2)
!4092 = !DILocation(line: 1394, column: 18, scope: !4091)
!4093 = !DILocation(line: 1394, column: 16, scope: !4091)
!4094 = !DILocation(line: 1394, column: 2, scope: !4088)
!4095 = !DILocation(line: 1395, column: 5, scope: !4096)
!4096 = distinct !DILexicalBlock(scope: !4091, file: !29, line: 1394, column: 26)
!4097 = !DILocation(line: 1395, column: 3, scope: !4096)
!4098 = !DILocation(line: 1395, column: 8, scope: !4096)
!4099 = !DILocation(line: 1395, column: 13, scope: !4096)
!4100 = !DILocation(line: 1396, column: 21, scope: !4096)
!4101 = !DILocation(line: 1396, column: 15, scope: !4096)
!4102 = !DILocation(line: 1396, column: 5, scope: !4096)
!4103 = !DILocation(line: 1396, column: 3, scope: !4096)
!4104 = !DILocation(line: 1396, column: 8, scope: !4096)
!4105 = !DILocation(line: 1396, column: 13, scope: !4096)
!4106 = !DILocation(line: 1397, column: 2, scope: !4096)
!4107 = !DILocation(line: 1394, column: 22, scope: !4091)
!4108 = !DILocation(line: 1394, column: 2, scope: !4091)
!4109 = distinct !{!4109, !4094, !4110, !1721}
!4110 = !DILocation(line: 1397, column: 2, scope: !4088)
!4111 = !DILocation(line: 1405, column: 6, scope: !4112)
!4112 = distinct !DILexicalBlock(scope: !3833, file: !29, line: 1405, column: 6)
!4113 = !DILocation(line: 1405, column: 24, scope: !4112)
!4114 = !DILocation(line: 1406, column: 11, scope: !4112)
!4115 = !DILocation(line: 1406, column: 40, scope: !4112)
!4116 = !DILocation(line: 1406, column: 73, scope: !4112)
!4117 = !DILocation(line: 1406, column: 92, scope: !4112)
!4118 = !DILocation(line: 1406, column: 91, scope: !4112)
!4119 = !DILocation(line: 1406, column: 111, scope: !4112)
!4120 = !DILocation(line: 1406, column: 145, scope: !4112)
!4121 = !DILocation(line: 1406, column: 3, scope: !4112)
!4122 = !DILocation(line: 1408, column: 11, scope: !4112)
!4123 = !DILocation(line: 1408, column: 39, scope: !4112)
!4124 = !DILocation(line: 1408, column: 72, scope: !4112)
!4125 = !DILocation(line: 1408, column: 83, scope: !4112)
!4126 = !DILocation(line: 1408, column: 102, scope: !4112)
!4127 = !DILocation(line: 1408, column: 136, scope: !4112)
!4128 = !DILocation(line: 1408, column: 3, scope: !4112)
!4129 = !DILocation(line: 1410, column: 2, scope: !3833)
!4130 = !DILocation(line: 1412, column: 2, scope: !3833)
!4131 = !DILocation(line: 1414, column: 2, scope: !3833)
!4132 = !DILocation(line: 1423, column: 21, scope: !3833)
!4133 = !DILocation(line: 1423, column: 28, scope: !3833)
!4134 = !DILocation(line: 1423, column: 31, scope: !3833)
!4135 = !DILocation(line: 1423, column: 43, scope: !3833)
!4136 = !DILocation(line: 1423, column: 3, scope: !3833)
!4137 = !DILocation(line: 1425, column: 2, scope: !3833)
!4138 = !DILocation(line: 1426, column: 1, scope: !3833)
!4139 = distinct !DISubprogram(name: "f2i", scope: !72, file: !72, line: 55, type: !4140, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1694)
!4140 = !DISubroutineType(types: !4141)
!4141 = !{!7, !71}
!4142 = !DILocalVariable(name: "f", arg: 1, scope: !4139, file: !72, line: 55, type: !71)
!4143 = !DILocation(line: 55, column: 23, scope: !4139)
!4144 = !DILocation(line: 57, column: 9, scope: !4139)
!4145 = !DILocation(line: 57, column: 11, scope: !4139)
!4146 = !DILocation(line: 57, column: 2, scope: !4139)
!4147 = distinct !DISubprogram(name: "DoEndlevelMenu", linkageName: "_Z14DoEndlevelMenuv", scope: !29, file: !29, line: 1429, type: !961, scopeLine: 1430, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2)
!4148 = !DILocation(line: 1432, column: 1, scope: !4147)
!4149 = distinct !DISubprogram(name: "StartSecretLevel", linkageName: "_Z16StartSecretLevelv", scope: !29, file: !29, line: 1438, type: !961, scopeLine: 1439, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2)
!4150 = !DILocation(line: 1440, column: 2, scope: !4149)
!4151 = !DILocation(line: 1442, column: 2, scope: !4149)
!4152 = !DILocation(line: 1444, column: 2, scope: !4149)
!4153 = !DILocation(line: 1446, column: 2, scope: !4149)
!4154 = !DILocation(line: 1446, column: 17, scope: !4149)
!4155 = !DILocation(line: 1446, column: 30, scope: !4149)
!4156 = !DILocation(line: 1447, column: 2, scope: !4149)
!4157 = !DILocation(line: 1447, column: 17, scope: !4149)
!4158 = !DILocation(line: 1447, column: 31, scope: !4149)
!4159 = !DILocation(line: 1450, column: 2, scope: !4149)
!4160 = !DILocation(line: 1453, column: 23, scope: !4149)
!4161 = !DILocation(line: 1455, column: 2, scope: !4149)
!4162 = !DILocation(line: 1458, column: 2, scope: !4149)
!4163 = !DILocation(line: 1459, column: 31, scope: !4149)
!4164 = !DILocation(line: 1460, column: 16, scope: !4149)
!4165 = !DILocation(line: 1462, column: 23, scope: !4149)
!4166 = !DILocation(line: 1463, column: 1, scope: !4149)
!4167 = distinct !DISubprogram(name: "InitPlayerPosition", linkageName: "_Z18InitPlayerPositioni", scope: !29, file: !29, line: 2533, type: !970, scopeLine: 2534, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1694)
!4168 = !DILocalVariable(name: "random_flag", arg: 1, scope: !4167, file: !29, line: 2533, type: !7)
!4169 = !DILocation(line: 2533, column: 29, scope: !4167)
!4170 = !DILocalVariable(name: "NewPlayer", scope: !4167, file: !29, line: 2535, type: !7)
!4171 = !DILocation(line: 2535, column: 6, scope: !4167)
!4172 = !DILocation(line: 2537, column: 9, scope: !4173)
!4173 = distinct !DILexicalBlock(scope: !4167, file: !29, line: 2537, column: 6)
!4174 = !DILocation(line: 2537, column: 19, scope: !4173)
!4175 = !DILocation(line: 2537, column: 8, scope: !4173)
!4176 = !DILocation(line: 2537, column: 31, scope: !4173)
!4177 = !DILocation(line: 2537, column: 36, scope: !4173)
!4178 = !DILocation(line: 2537, column: 46, scope: !4173)
!4179 = !DILocation(line: 2537, column: 35, scope: !4173)
!4180 = !DILocation(line: 2537, column: 6, scope: !4173)
!4181 = !DILocation(line: 2538, column: 15, scope: !4173)
!4182 = !DILocation(line: 2538, column: 13, scope: !4173)
!4183 = !DILocation(line: 2538, column: 3, scope: !4173)
!4184 = !DILocation(line: 2588, column: 3, scope: !4185)
!4185 = distinct !DILexicalBlock(scope: !4173, file: !29, line: 2587, column: 2)
!4186 = !DILocation(line: 2589, column: 3, scope: !4185)
!4187 = !DILocation(line: 2591, column: 2, scope: !4167)
!4188 = !DILocation(line: 2592, column: 2, scope: !4167)
!4189 = !DILocation(line: 2594, column: 35, scope: !4167)
!4190 = !DILocation(line: 2594, column: 23, scope: !4167)
!4191 = !DILocation(line: 2594, column: 46, scope: !4167)
!4192 = !DILocation(line: 2594, column: 2, scope: !4167)
!4193 = !DILocation(line: 2594, column: 17, scope: !4167)
!4194 = !DILocation(line: 2594, column: 21, scope: !4167)
!4195 = !DILocation(line: 2595, column: 38, scope: !4167)
!4196 = !DILocation(line: 2595, column: 26, scope: !4167)
!4197 = !DILocation(line: 2595, column: 49, scope: !4167)
!4198 = !DILocation(line: 2595, column: 2, scope: !4167)
!4199 = !DILocation(line: 2595, column: 17, scope: !4167)
!4200 = !DILocation(line: 2595, column: 24, scope: !4167)
!4201 = !DILocation(line: 2600, column: 13, scope: !4167)
!4202 = !DILocation(line: 2600, column: 27, scope: !4167)
!4203 = !DILocation(line: 2600, column: 50, scope: !4167)
!4204 = !DILocation(line: 2600, column: 38, scope: !4167)
!4205 = !DILocation(line: 2600, column: 61, scope: !4167)
!4206 = !DILocation(line: 2600, column: 2, scope: !4167)
!4207 = !DILabel(scope: !4167, name: "done", file: !29, line: 2602)
!4208 = !DILocation(line: 2602, column: 1, scope: !4167)
!4209 = !DILocation(line: 2603, column: 2, scope: !4167)
!4210 = !DILocation(line: 2604, column: 2, scope: !4167)
!4211 = !DILocation(line: 2605, column: 1, scope: !4167)
!4212 = distinct !DISubprogram(name: "p_secret_level_destroyed", linkageName: "_Z24p_secret_level_destroyedv", scope: !29, file: !29, line: 1468, type: !935, scopeLine: 1469, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1694)
!4213 = !DILocation(line: 1470, column: 6, scope: !4214)
!4214 = distinct !DILexicalBlock(scope: !4212, file: !29, line: 1470, column: 6)
!4215 = !DILocation(line: 1472, column: 3, scope: !4216)
!4216 = distinct !DILexicalBlock(scope: !4214, file: !29, line: 1471, column: 2)
!4217 = !DILocalVariable(name: "fp", scope: !4218, file: !29, line: 1476, type: !651)
!4218 = distinct !DILexicalBlock(scope: !4214, file: !29, line: 1475, column: 2)
!4219 = !DILocation(line: 1476, column: 9, scope: !4218)
!4220 = !DILocation(line: 1477, column: 13, scope: !4221)
!4221 = distinct !DILexicalBlock(scope: !4218, file: !29, line: 1477, column: 7)
!4222 = !DILocation(line: 1477, column: 11, scope: !4221)
!4223 = !DILocation(line: 1477, column: 44, scope: !4221)
!4224 = !DILocation(line: 1479, column: 11, scope: !4225)
!4225 = distinct !DILexicalBlock(scope: !4221, file: !29, line: 1478, column: 3)
!4226 = !DILocation(line: 1479, column: 4, scope: !4225)
!4227 = !DILocation(line: 1480, column: 4, scope: !4225)
!4228 = !DILocation(line: 1484, column: 4, scope: !4229)
!4229 = distinct !DILexicalBlock(scope: !4221, file: !29, line: 1483, column: 3)
!4230 = !DILocation(line: 1487, column: 1, scope: !4212)
!4231 = distinct !DISubprogram(name: "do_secret_message", linkageName: "_Z17do_secret_messagePc", scope: !29, file: !29, line: 1492, type: !3274, scopeLine: 1493, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1694)
!4232 = !DILocalVariable(name: "msg", arg: 1, scope: !4231, file: !29, line: 1492, type: !21)
!4233 = !DILocation(line: 1492, column: 30, scope: !4231)
!4234 = !DILocalVariable(name: "old_fmode", scope: !4231, file: !29, line: 1494, type: !7)
!4235 = !DILocation(line: 1494, column: 6, scope: !4231)
!4236 = !DILocation(line: 1496, column: 2, scope: !4231)
!4237 = !DILocation(line: 1503, column: 14, scope: !4231)
!4238 = !DILocation(line: 1503, column: 12, scope: !4231)
!4239 = !DILocation(line: 1504, column: 16, scope: !4231)
!4240 = !DILocation(line: 1505, column: 25, scope: !4231)
!4241 = !DILocation(line: 1505, column: 33, scope: !4231)
!4242 = !DILocation(line: 1505, column: 2, scope: !4231)
!4243 = !DILocation(line: 1506, column: 18, scope: !4231)
!4244 = !DILocation(line: 1506, column: 16, scope: !4231)
!4245 = !DILocation(line: 1513, column: 1, scope: !4231)
!4246 = distinct !DISubprogram(name: "load_stars", linkageName: "_Z10load_starsv", scope: !29, file: !29, line: 1972, type: !961, scopeLine: 1973, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2)
!4247 = !DILocation(line: 1975, column: 22, scope: !4246)
!4248 = !DILocation(line: 1975, column: 2, scope: !4246)
!4249 = !DILocation(line: 1976, column: 1, scope: !4246)
!4250 = distinct !DISubprogram(name: "copy_defaults_to_robot_all", linkageName: "_Z26copy_defaults_to_robot_allv", scope: !29, file: !29, line: 2686, type: !961, scopeLine: 2687, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1694)
!4251 = !DILocalVariable(name: "i", scope: !4250, file: !29, line: 2734, type: !7)
!4252 = !DILocation(line: 2734, column: 6, scope: !4250)
!4253 = !DILocation(line: 2736, column: 9, scope: !4254)
!4254 = distinct !DILexicalBlock(scope: !4250, file: !29, line: 2736, column: 2)
!4255 = !DILocation(line: 2736, column: 7, scope: !4254)
!4256 = !DILocation(line: 2736, column: 14, scope: !4257)
!4257 = distinct !DILexicalBlock(scope: !4254, file: !29, line: 2736, column: 2)
!4258 = !DILocation(line: 2736, column: 19, scope: !4257)
!4259 = !DILocation(line: 2736, column: 16, scope: !4257)
!4260 = !DILocation(line: 2736, column: 2, scope: !4254)
!4261 = !DILocation(line: 2737, column: 15, scope: !4262)
!4262 = distinct !DILexicalBlock(scope: !4257, file: !29, line: 2737, column: 7)
!4263 = !DILocation(line: 2737, column: 7, scope: !4262)
!4264 = !DILocation(line: 2737, column: 18, scope: !4262)
!4265 = !DILocation(line: 2737, column: 23, scope: !4262)
!4266 = !DILocation(line: 2738, column: 36, scope: !4262)
!4267 = !DILocation(line: 2738, column: 28, scope: !4262)
!4268 = !DILocation(line: 2738, column: 4, scope: !4262)
!4269 = !DILocation(line: 2737, column: 26, scope: !4262)
!4270 = !DILocation(line: 2736, column: 42, scope: !4257)
!4271 = !DILocation(line: 2736, column: 2, scope: !4257)
!4272 = distinct !{!4272, !4260, !4273, !1721}
!4273 = !DILocation(line: 2738, column: 38, scope: !4254)
!4274 = !DILocation(line: 2740, column: 1, scope: !4250)
!4275 = distinct !DISubprogram(name: "ExitSecretLevel", linkageName: "_Z15ExitSecretLevelv", scope: !29, file: !29, line: 1662, type: !961, scopeLine: 1663, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1694)
!4276 = !DILocalVariable(name: "fp", scope: !4275, file: !29, line: 1664, type: !651)
!4277 = !DILocation(line: 1664, column: 8, scope: !4275)
!4278 = !DILocation(line: 1666, column: 6, scope: !4279)
!4279 = distinct !DILexicalBlock(scope: !4275, file: !29, line: 1666, column: 6)
!4280 = !DILocation(line: 1666, column: 20, scope: !4279)
!4281 = !DILocation(line: 1667, column: 3, scope: !4279)
!4282 = !DILocation(line: 1669, column: 7, scope: !4283)
!4283 = distinct !DILexicalBlock(scope: !4275, file: !29, line: 1669, column: 6)
!4284 = !DILocation(line: 1669, column: 6, scope: !4283)
!4285 = !DILocation(line: 1671, column: 3, scope: !4286)
!4286 = distinct !DILexicalBlock(scope: !4283, file: !29, line: 1670, column: 2)
!4287 = !DILocation(line: 1672, column: 2, scope: !4286)
!4288 = !DILocation(line: 1674, column: 12, scope: !4289)
!4289 = distinct !DILexicalBlock(scope: !4275, file: !29, line: 1674, column: 6)
!4290 = !DILocation(line: 1674, column: 10, scope: !4289)
!4291 = !DILocation(line: 1674, column: 43, scope: !4289)
!4292 = !DILocalVariable(name: "pw_save", scope: !4293, file: !29, line: 1676, type: !7)
!4293 = distinct !DILexicalBlock(scope: !4289, file: !29, line: 1675, column: 2)
!4294 = !DILocation(line: 1676, column: 7, scope: !4293)
!4295 = !DILocalVariable(name: "sw_save", scope: !4293, file: !29, line: 1676, type: !7)
!4296 = !DILocation(line: 1676, column: 16, scope: !4293)
!4297 = !DILocation(line: 1678, column: 3, scope: !4293)
!4298 = !DILocation(line: 1679, column: 10, scope: !4293)
!4299 = !DILocation(line: 1679, column: 3, scope: !4293)
!4300 = !DILocation(line: 1680, column: 13, scope: !4293)
!4301 = !DILocation(line: 1680, column: 11, scope: !4293)
!4302 = !DILocation(line: 1681, column: 13, scope: !4293)
!4303 = !DILocation(line: 1681, column: 11, scope: !4293)
!4304 = !DILocation(line: 1682, column: 3, scope: !4293)
!4305 = !DILocation(line: 1683, column: 20, scope: !4293)
!4306 = !DILocation(line: 1683, column: 18, scope: !4293)
!4307 = !DILocation(line: 1684, column: 22, scope: !4293)
!4308 = !DILocation(line: 1684, column: 20, scope: !4293)
!4309 = !DILocation(line: 1685, column: 2, scope: !4293)
!4310 = !DILocation(line: 1689, column: 7, scope: !4311)
!4311 = distinct !DILexicalBlock(scope: !4312, file: !29, line: 1689, column: 7)
!4312 = distinct !DILexicalBlock(scope: !4289, file: !29, line: 1687, column: 2)
!4313 = !DILocation(line: 1689, column: 29, scope: !4311)
!4314 = !DILocation(line: 1689, column: 26, scope: !4311)
!4315 = !DILocation(line: 1690, column: 4, scope: !4311)
!4316 = !DILocation(line: 1693, column: 4, scope: !4317)
!4317 = distinct !DILexicalBlock(scope: !4311, file: !29, line: 1692, column: 3)
!4318 = !DILocation(line: 1694, column: 18, scope: !4317)
!4319 = !DILocation(line: 1694, column: 37, scope: !4317)
!4320 = !DILocation(line: 1694, column: 4, scope: !4317)
!4321 = !DILocation(line: 1697, column: 1, scope: !4275)
!4322 = distinct !DISubprogram(name: "returning_to_level_message", linkageName: "_Z26returning_to_level_messagev", scope: !29, file: !29, line: 2016, type: !961, scopeLine: 2017, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1694)
!4323 = !DILocalVariable(name: "msg", scope: !4322, file: !29, line: 2018, type: !572)
!4324 = !DILocation(line: 2018, column: 7, scope: !4322)
!4325 = !DILocalVariable(name: "old_fmode", scope: !4322, file: !29, line: 2020, type: !7)
!4326 = !DILocation(line: 2020, column: 6, scope: !4322)
!4327 = !DILocation(line: 2022, column: 6, scope: !4328)
!4328 = distinct !DILexicalBlock(scope: !4322, file: !29, line: 2022, column: 6)
!4329 = !DILocation(line: 2022, column: 16, scope: !4328)
!4330 = !DILocation(line: 2023, column: 3, scope: !4328)
!4331 = !DILocation(line: 2025, column: 2, scope: !4322)
!4332 = !DILocation(line: 2027, column: 2, scope: !4322)
!4333 = !DILocation(line: 2029, column: 2, scope: !4322)
!4334 = !DILocation(line: 2031, column: 2, scope: !4322)
!4335 = !DILocation(line: 2038, column: 14, scope: !4322)
!4336 = !DILocation(line: 2038, column: 12, scope: !4322)
!4337 = !DILocation(line: 2039, column: 16, scope: !4322)
!4338 = !DILocation(line: 2040, column: 10, scope: !4322)
!4339 = !DILocation(line: 2040, column: 40, scope: !4322)
!4340 = !DILocation(line: 2040, column: 2, scope: !4322)
!4341 = !DILocation(line: 2041, column: 25, scope: !4322)
!4342 = !DILocation(line: 2041, column: 33, scope: !4322)
!4343 = !DILocation(line: 2041, column: 2, scope: !4322)
!4344 = !DILocation(line: 2042, column: 18, scope: !4322)
!4345 = !DILocation(line: 2042, column: 16, scope: !4322)
!4346 = !DILocation(line: 2049, column: 1, scope: !4322)
!4347 = distinct !DISubprogram(name: "DoEndGame", linkageName: "_Z9DoEndGamev", scope: !29, file: !29, line: 1793, type: !961, scopeLine: 1794, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1694)
!4348 = !DILocation(line: 1795, column: 2, scope: !4347)
!4349 = !DILocation(line: 1797, column: 16, scope: !4347)
!4350 = !DILocation(line: 1798, column: 7, scope: !4351)
!4351 = distinct !DILexicalBlock(scope: !4347, file: !29, line: 1798, column: 6)
!4352 = !DILocation(line: 1798, column: 21, scope: !4351)
!4353 = !DILocation(line: 1798, column: 44, scope: !4351)
!4354 = !DILocation(line: 1798, column: 48, scope: !4351)
!4355 = !DILocation(line: 1798, column: 62, scope: !4351)
!4356 = !DILocation(line: 1799, column: 3, scope: !4351)
!4357 = !DILocation(line: 1801, column: 2, scope: !4347)
!4358 = !DILocation(line: 1803, column: 2, scope: !4347)
!4359 = !DILocation(line: 1808, column: 2, scope: !4347)
!4360 = !DILocation(line: 1810, column: 6, scope: !4361)
!4361 = distinct !DILexicalBlock(scope: !4347, file: !29, line: 1810, column: 6)
!4362 = !DILocation(line: 1810, column: 26, scope: !4361)
!4363 = !DILocation(line: 1810, column: 31, scope: !4361)
!4364 = !DILocation(line: 1810, column: 36, scope: !4361)
!4365 = !DILocation(line: 1810, column: 46, scope: !4361)
!4366 = !DILocation(line: 1810, column: 35, scope: !4361)
!4367 = !DILocalVariable(name: "played", scope: !4368, file: !29, line: 1812, type: !7)
!4368 = distinct !DILexicalBlock(scope: !4361, file: !29, line: 1811, column: 2)
!4369 = !DILocation(line: 1812, column: 7, scope: !4368)
!4370 = !DILocation(line: 1814, column: 7, scope: !4371)
!4371 = distinct !DILexicalBlock(scope: !4368, file: !29, line: 1814, column: 7)
!4372 = !DILocation(line: 1814, column: 26, scope: !4371)
!4373 = !DILocation(line: 1816, column: 4, scope: !4374)
!4374 = distinct !DILexicalBlock(scope: !4371, file: !29, line: 1815, column: 3)
!4375 = !DILocation(line: 1817, column: 4, scope: !4374)
!4376 = !DILocation(line: 1818, column: 4, scope: !4374)
!4377 = !DILocation(line: 1819, column: 4, scope: !4374)
!4378 = !DILocation(line: 1820, column: 3, scope: !4374)
!4379 = !DILocation(line: 1823, column: 4, scope: !4380)
!4380 = distinct !DILexicalBlock(scope: !4371, file: !29, line: 1822, column: 3)
!4381 = !DILocation(line: 1824, column: 13, scope: !4380)
!4382 = !DILocation(line: 1824, column: 11, scope: !4380)
!4383 = !DILocation(line: 1825, column: 4, scope: !4380)
!4384 = !DILocation(line: 1834, column: 2, scope: !4368)
!4385 = !DILocation(line: 1835, column: 13, scope: !4386)
!4386 = distinct !DILexicalBlock(scope: !4361, file: !29, line: 1835, column: 11)
!4387 = !DILocation(line: 1835, column: 23, scope: !4386)
!4388 = !DILocation(line: 1835, column: 12, scope: !4386)
!4389 = !DILocation(line: 1835, column: 11, scope: !4386)
!4390 = !DILocalVariable(name: "tname", scope: !4391, file: !29, line: 1837, type: !394)
!4391 = distinct !DILexicalBlock(scope: !4386, file: !29, line: 1836, column: 2)
!4392 = !DILocation(line: 1837, column: 8, scope: !4391)
!4393 = !DILocation(line: 1838, column: 11, scope: !4391)
!4394 = !DILocation(line: 1838, column: 28, scope: !4391)
!4395 = !DILocation(line: 1838, column: 3, scope: !4391)
!4396 = !DILocation(line: 1839, column: 23, scope: !4391)
!4397 = !DILocation(line: 1839, column: 30, scope: !4391)
!4398 = !DILocation(line: 1839, column: 41, scope: !4391)
!4399 = !DILocation(line: 1839, column: 3, scope: !4391)
!4400 = !DILocation(line: 1842, column: 11, scope: !4391)
!4401 = !DILocation(line: 1842, column: 28, scope: !4391)
!4402 = !DILocation(line: 1842, column: 3, scope: !4391)
!4403 = !DILocation(line: 1843, column: 16, scope: !4391)
!4404 = !DILocation(line: 1843, column: 3, scope: !4391)
!4405 = !DILocation(line: 1844, column: 2, scope: !4391)
!4406 = !DILocation(line: 1846, column: 2, scope: !4347)
!4407 = !DILocation(line: 1848, column: 6, scope: !4408)
!4408 = distinct !DILexicalBlock(scope: !4347, file: !29, line: 1848, column: 6)
!4409 = !DILocation(line: 1848, column: 25, scope: !4408)
!4410 = !DILocation(line: 1849, column: 3, scope: !4408)
!4411 = !DILocation(line: 1856, column: 3, scope: !4347)
!4412 = !DILocation(line: 1858, column: 6, scope: !4413)
!4413 = distinct !DILexicalBlock(scope: !4347, file: !29, line: 1858, column: 6)
!4414 = !DILocation(line: 1858, column: 26, scope: !4413)
!4415 = !DILocation(line: 1858, column: 31, scope: !4413)
!4416 = !DILocation(line: 1858, column: 37, scope: !4413)
!4417 = !DILocation(line: 1858, column: 47, scope: !4413)
!4418 = !DILocation(line: 1858, column: 36, scope: !4413)
!4419 = !DILocation(line: 1858, column: 59, scope: !4413)
!4420 = !DILocation(line: 1858, column: 64, scope: !4413)
!4421 = !DILocation(line: 1858, column: 74, scope: !4413)
!4422 = !DILocation(line: 1858, column: 63, scope: !4413)
!4423 = !DILocation(line: 1860, column: 3, scope: !4424)
!4424 = distinct !DILexicalBlock(scope: !4413, file: !29, line: 1859, column: 2)
!4425 = !DILocation(line: 1864, column: 3, scope: !4424)
!4426 = !DILocation(line: 1868, column: 3, scope: !4424)
!4427 = !DILocation(line: 1869, column: 3, scope: !4424)
!4428 = !DILocation(line: 1870, column: 3, scope: !4424)
!4429 = !DILocation(line: 1871, column: 2, scope: !4424)
!4430 = !DILocation(line: 1873, column: 16, scope: !4347)
!4431 = !DILocation(line: 1874, column: 12, scope: !4347)
!4432 = !DILocation(line: 1876, column: 2, scope: !4347)
!4433 = distinct !DISubprogram(name: "advancing_to_level_message", linkageName: "_Z26advancing_to_level_messagev", scope: !29, file: !29, line: 2052, type: !961, scopeLine: 2053, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1694)
!4434 = !DILocalVariable(name: "msg", scope: !4433, file: !29, line: 2054, type: !572)
!4435 = !DILocation(line: 2054, column: 7, scope: !4433)
!4436 = !DILocalVariable(name: "old_fmode", scope: !4433, file: !29, line: 2056, type: !7)
!4437 = !DILocation(line: 2056, column: 6, scope: !4433)
!4438 = !DILocation(line: 2059, column: 2, scope: !4433)
!4439 = !DILocation(line: 2061, column: 6, scope: !4440)
!4440 = distinct !DILexicalBlock(scope: !4433, file: !29, line: 2061, column: 6)
!4441 = !DILocation(line: 2061, column: 16, scope: !4440)
!4442 = !DILocation(line: 2062, column: 3, scope: !4440)
!4443 = !DILocation(line: 2064, column: 2, scope: !4433)
!4444 = !DILocation(line: 2066, column: 2, scope: !4433)
!4445 = !DILocation(line: 2068, column: 2, scope: !4433)
!4446 = !DILocation(line: 2070, column: 2, scope: !4433)
!4447 = !DILocation(line: 2077, column: 14, scope: !4433)
!4448 = !DILocation(line: 2077, column: 12, scope: !4433)
!4449 = !DILocation(line: 2078, column: 16, scope: !4433)
!4450 = !DILocation(line: 2079, column: 10, scope: !4433)
!4451 = !DILocation(line: 2079, column: 63, scope: !4433)
!4452 = !DILocation(line: 2079, column: 82, scope: !4433)
!4453 = !DILocation(line: 2079, column: 2, scope: !4433)
!4454 = !DILocation(line: 2080, column: 25, scope: !4433)
!4455 = !DILocation(line: 2080, column: 33, scope: !4433)
!4456 = !DILocation(line: 2080, column: 2, scope: !4433)
!4457 = !DILocation(line: 2081, column: 18, scope: !4433)
!4458 = !DILocation(line: 2081, column: 16, scope: !4433)
!4459 = !DILocation(line: 2088, column: 1, scope: !4433)
!4460 = distinct !DISubprogram(name: "do_cloak_invul_secret_stuff", linkageName: "_Z27do_cloak_invul_secret_stuffi", scope: !29, file: !29, line: 1702, type: !4461, scopeLine: 1703, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1694)
!4461 = !DISubroutineType(types: !4462)
!4462 = !{null, !71}
!4463 = !DILocalVariable(name: "old_gametime", arg: 1, scope: !4460, file: !29, line: 1702, type: !71)
!4464 = !DILocation(line: 1702, column: 38, scope: !4460)
!4465 = !DILocation(line: 1704, column: 14, scope: !4466)
!4466 = distinct !DILexicalBlock(scope: !4460, file: !29, line: 1704, column: 6)
!4467 = !DILocation(line: 1704, column: 6, scope: !4466)
!4468 = !DILocation(line: 1704, column: 26, scope: !4466)
!4469 = !DILocation(line: 1704, column: 32, scope: !4466)
!4470 = !DILocalVariable(name: "time_used", scope: !4471, file: !29, line: 1706, type: !71)
!4471 = distinct !DILexicalBlock(scope: !4466, file: !29, line: 1705, column: 2)
!4472 = !DILocation(line: 1706, column: 7, scope: !4471)
!4473 = !DILocation(line: 1708, column: 15, scope: !4471)
!4474 = !DILocation(line: 1708, column: 38, scope: !4471)
!4475 = !DILocation(line: 1708, column: 30, scope: !4471)
!4476 = !DILocation(line: 1708, column: 50, scope: !4471)
!4477 = !DILocation(line: 1708, column: 28, scope: !4471)
!4478 = !DILocation(line: 1708, column: 13, scope: !4471)
!4479 = !DILocation(line: 1709, column: 43, scope: !4471)
!4480 = !DILocation(line: 1709, column: 54, scope: !4471)
!4481 = !DILocation(line: 1709, column: 52, scope: !4471)
!4482 = !DILocation(line: 1709, column: 11, scope: !4471)
!4483 = !DILocation(line: 1709, column: 3, scope: !4471)
!4484 = !DILocation(line: 1709, column: 23, scope: !4471)
!4485 = !DILocation(line: 1709, column: 41, scope: !4471)
!4486 = !DILocation(line: 1710, column: 2, scope: !4471)
!4487 = !DILocation(line: 1712, column: 14, scope: !4488)
!4488 = distinct !DILexicalBlock(scope: !4460, file: !29, line: 1712, column: 6)
!4489 = !DILocation(line: 1712, column: 6, scope: !4488)
!4490 = !DILocation(line: 1712, column: 26, scope: !4488)
!4491 = !DILocation(line: 1712, column: 32, scope: !4488)
!4492 = !DILocalVariable(name: "time_used", scope: !4493, file: !29, line: 1714, type: !71)
!4493 = distinct !DILexicalBlock(scope: !4488, file: !29, line: 1713, column: 2)
!4494 = !DILocation(line: 1714, column: 7, scope: !4493)
!4495 = !DILocation(line: 1716, column: 15, scope: !4493)
!4496 = !DILocation(line: 1716, column: 38, scope: !4493)
!4497 = !DILocation(line: 1716, column: 30, scope: !4493)
!4498 = !DILocation(line: 1716, column: 50, scope: !4493)
!4499 = !DILocation(line: 1716, column: 28, scope: !4493)
!4500 = !DILocation(line: 1716, column: 13, scope: !4493)
!4501 = !DILocation(line: 1717, column: 36, scope: !4493)
!4502 = !DILocation(line: 1717, column: 47, scope: !4493)
!4503 = !DILocation(line: 1717, column: 45, scope: !4493)
!4504 = !DILocation(line: 1717, column: 11, scope: !4493)
!4505 = !DILocation(line: 1717, column: 3, scope: !4493)
!4506 = !DILocation(line: 1717, column: 23, scope: !4493)
!4507 = !DILocation(line: 1717, column: 34, scope: !4493)
!4508 = !DILocation(line: 1718, column: 2, scope: !4493)
!4509 = !DILocation(line: 1719, column: 1, scope: !4460)
!4510 = distinct !DISubprogram(name: "EnterSecretLevel", linkageName: "_Z16EnterSecretLevelv", scope: !29, file: !29, line: 1725, type: !961, scopeLine: 1726, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1694)
!4511 = !DILocalVariable(name: "old_gametime", scope: !4510, file: !29, line: 1727, type: !71)
!4512 = !DILocation(line: 1727, column: 6, scope: !4510)
!4513 = !DILocalVariable(name: "i", scope: !4510, file: !29, line: 1728, type: !7)
!4514 = !DILocation(line: 1728, column: 6, scope: !4510)
!4515 = !DILocation(line: 1730, column: 2, scope: !4510)
!4516 = !DILocation(line: 1732, column: 23, scope: !4510)
!4517 = !DILocation(line: 1732, column: 21, scope: !4510)
!4518 = !DILocation(line: 1734, column: 6, scope: !4519)
!4519 = distinct !DILexicalBlock(scope: !4510, file: !29, line: 1734, column: 6)
!4520 = !DILocation(line: 1735, column: 3, scope: !4519)
!4521 = !DILocation(line: 1737, column: 6, scope: !4522)
!4522 = distinct !DILexicalBlock(scope: !4510, file: !29, line: 1737, column: 6)
!4523 = !DILocation(line: 1737, column: 20, scope: !4522)
!4524 = !DILocation(line: 1738, column: 3, scope: !4522)
!4525 = !DILocation(line: 1741, column: 9, scope: !4526)
!4526 = distinct !DILexicalBlock(scope: !4510, file: !29, line: 1741, column: 2)
!4527 = !DILocation(line: 1741, column: 7, scope: !4526)
!4528 = !DILocation(line: 1741, column: 14, scope: !4529)
!4529 = distinct !DILexicalBlock(scope: !4526, file: !29, line: 1741, column: 2)
!4530 = !DILocation(line: 1741, column: 19, scope: !4529)
!4531 = !DILocation(line: 1741, column: 18, scope: !4529)
!4532 = !DILocation(line: 1741, column: 16, scope: !4529)
!4533 = !DILocation(line: 1741, column: 2, scope: !4526)
!4534 = !DILocation(line: 1742, column: 26, scope: !4535)
!4535 = distinct !DILexicalBlock(scope: !4529, file: !29, line: 1742, column: 7)
!4536 = !DILocation(line: 1742, column: 7, scope: !4535)
!4537 = !DILocation(line: 1742, column: 32, scope: !4535)
!4538 = !DILocation(line: 1742, column: 29, scope: !4535)
!4539 = !DILocation(line: 1744, column: 23, scope: !4540)
!4540 = distinct !DILexicalBlock(scope: !4535, file: !29, line: 1743, column: 3)
!4541 = !DILocation(line: 1744, column: 25, scope: !4540)
!4542 = !DILocation(line: 1744, column: 21, scope: !4540)
!4543 = !DILocation(line: 1744, column: 19, scope: !4540)
!4544 = !DILocation(line: 1745, column: 4, scope: !4540)
!4545 = !DILocation(line: 1747, column: 31, scope: !4546)
!4546 = distinct !DILexicalBlock(scope: !4535, file: !29, line: 1747, column: 12)
!4547 = !DILocation(line: 1747, column: 12, scope: !4546)
!4548 = !DILocation(line: 1747, column: 36, scope: !4546)
!4549 = !DILocation(line: 1747, column: 34, scope: !4546)
!4550 = !DILocation(line: 1749, column: 22, scope: !4551)
!4551 = distinct !DILexicalBlock(scope: !4546, file: !29, line: 1748, column: 3)
!4552 = !DILocation(line: 1749, column: 21, scope: !4551)
!4553 = !DILocation(line: 1749, column: 19, scope: !4551)
!4554 = !DILocation(line: 1750, column: 4, scope: !4551)
!4555 = !DILocation(line: 1741, column: 39, scope: !4529)
!4556 = !DILocation(line: 1741, column: 2, scope: !4529)
!4557 = distinct !{!4557, !4533, !4558, !1721}
!4558 = !DILocation(line: 1751, column: 3, scope: !4526)
!4559 = !DILocation(line: 1753, column: 8, scope: !4560)
!4560 = distinct !DILexicalBlock(scope: !4510, file: !29, line: 1753, column: 6)
!4561 = !DILocation(line: 1753, column: 13, scope: !4560)
!4562 = !DILocation(line: 1753, column: 12, scope: !4560)
!4563 = !DILocation(line: 1753, column: 10, scope: !4560)
!4564 = !DILocation(line: 1753, column: 6, scope: !4560)
!4565 = !DILocation(line: 1754, column: 20, scope: !4560)
!4566 = !DILocation(line: 1754, column: 18, scope: !4560)
!4567 = !DILocation(line: 1754, column: 3, scope: !4560)
!4568 = !DILocation(line: 1756, column: 17, scope: !4510)
!4569 = !DILocation(line: 1756, column: 15, scope: !4510)
!4570 = !DILocation(line: 1758, column: 22, scope: !4510)
!4571 = !DILocation(line: 1758, column: 2, scope: !4510)
!4572 = !DILocation(line: 1761, column: 1, scope: !4510)
!4573 = distinct !DISubprogram(name: "PlayerFinishedLevel", linkageName: "_Z19PlayerFinishedLeveli", scope: !29, file: !29, line: 1766, type: !970, scopeLine: 1767, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1694)
!4574 = !DILocalVariable(name: "secret_flag", arg: 1, scope: !4573, file: !29, line: 1766, type: !7)
!4575 = !DILocation(line: 1766, column: 30, scope: !4573)
!4576 = !DILocation(line: 1768, column: 2, scope: !4573)
!4577 = !DILocation(line: 1771, column: 56, scope: !4573)
!4578 = !DILocation(line: 1771, column: 48, scope: !4573)
!4579 = !DILocation(line: 1771, column: 68, scope: !4573)
!4580 = !DILocation(line: 1771, column: 10, scope: !4573)
!4581 = !DILocation(line: 1771, column: 2, scope: !4573)
!4582 = !DILocation(line: 1771, column: 22, scope: !4573)
!4583 = !DILocation(line: 1771, column: 45, scope: !4573)
!4584 = !DILocation(line: 1773, column: 6, scope: !4585)
!4585 = distinct !DILexicalBlock(scope: !4573, file: !29, line: 1773, column: 6)
!4586 = !DILocation(line: 1773, column: 16, scope: !4585)
!4587 = !DILocation(line: 1774, column: 11, scope: !4585)
!4588 = !DILocation(line: 1774, column: 3, scope: !4585)
!4589 = !DILocation(line: 1774, column: 23, scope: !4585)
!4590 = !DILocation(line: 1774, column: 33, scope: !4585)
!4591 = !DILocation(line: 1776, column: 21, scope: !4573)
!4592 = !DILocation(line: 1778, column: 15, scope: !4573)
!4593 = !DILocation(line: 1778, column: 2, scope: !4573)
!4594 = !DILocation(line: 1779, column: 1, scope: !4573)
!4595 = distinct !DISubprogram(name: "AdvanceLevel", linkageName: "_Z12AdvanceLeveli", scope: !29, file: !29, line: 1885, type: !970, scopeLine: 1886, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1694)
!4596 = !DILocalVariable(name: "secret_flag", arg: 1, scope: !4595, file: !29, line: 1885, type: !7)
!4597 = !DILocation(line: 1885, column: 23, scope: !4595)
!4598 = !DILocalVariable(name: "result", scope: !4595, file: !29, line: 1887, type: !7)
!4599 = !DILocation(line: 1887, column: 6, scope: !4595)
!4600 = !DILocation(line: 1889, column: 2, scope: !4595)
!4601 = !DILocation(line: 1891, column: 2, scope: !4595)
!4602 = !DILocation(line: 1893, column: 6, scope: !4603)
!4603 = distinct !DILexicalBlock(scope: !4595, file: !29, line: 1893, column: 6)
!4604 = !DILocation(line: 1893, column: 27, scope: !4603)
!4605 = !DILocation(line: 1893, column: 24, scope: !4603)
!4606 = !DILocation(line: 1900, column: 4, scope: !4607)
!4607 = distinct !DILexicalBlock(scope: !4603, file: !29, line: 1894, column: 2)
!4608 = !DILocation(line: 1901, column: 2, scope: !4607)
!4609 = !DILocation(line: 1903, column: 27, scope: !4595)
!4610 = !DILocation(line: 1922, column: 6, scope: !4611)
!4611 = distinct !DILexicalBlock(scope: !4595, file: !29, line: 1922, column: 6)
!4612 = !DILocation(line: 1922, column: 27, scope: !4611)
!4613 = !DILocation(line: 1922, column: 24, scope: !4611)
!4614 = !DILocation(line: 1924, column: 3, scope: !4615)
!4615 = distinct !DILexicalBlock(scope: !4611, file: !29, line: 1923, column: 2)
!4616 = !DILocation(line: 1925, column: 3, scope: !4615)
!4617 = !DILocation(line: 1926, column: 2, scope: !4615)
!4618 = !DILocation(line: 1929, column: 20, scope: !4619)
!4619 = distinct !DILexicalBlock(scope: !4611, file: !29, line: 1928, column: 2)
!4620 = !DILocation(line: 1929, column: 38, scope: !4619)
!4621 = !DILocation(line: 1929, column: 18, scope: !4619)
!4622 = !DILocation(line: 1931, column: 9, scope: !4623)
!4623 = distinct !DILexicalBlock(scope: !4619, file: !29, line: 1931, column: 7)
!4624 = !DILocation(line: 1931, column: 19, scope: !4623)
!4625 = !DILocation(line: 1931, column: 8, scope: !4623)
!4626 = !DILocation(line: 1931, column: 7, scope: !4623)
!4627 = !DILocation(line: 1932, column: 4, scope: !4623)
!4628 = !DILocation(line: 1934, column: 17, scope: !4619)
!4629 = !DILocation(line: 1934, column: 3, scope: !4619)
!4630 = !DILocation(line: 1936, column: 1, scope: !4595)
!4631 = distinct !DISubprogram(name: "died_in_mine_message", linkageName: "_Z20died_in_mine_messagev", scope: !29, file: !29, line: 1979, type: !961, scopeLine: 1980, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1694)
!4632 = !DILocalVariable(name: "old_fmode", scope: !4631, file: !29, line: 1982, type: !7)
!4633 = !DILocation(line: 1982, column: 6, scope: !4631)
!4634 = !DILocation(line: 1984, column: 6, scope: !4635)
!4635 = distinct !DILexicalBlock(scope: !4631, file: !29, line: 1984, column: 6)
!4636 = !DILocation(line: 1984, column: 16, scope: !4635)
!4637 = !DILocation(line: 1985, column: 3, scope: !4635)
!4638 = !DILocation(line: 1987, column: 2, scope: !4631)
!4639 = !DILocation(line: 1989, column: 2, scope: !4631)
!4640 = !DILocation(line: 1991, column: 2, scope: !4631)
!4641 = !DILocation(line: 1996, column: 2, scope: !4631)
!4642 = !DILocation(line: 2003, column: 14, scope: !4631)
!4643 = !DILocation(line: 2003, column: 12, scope: !4631)
!4644 = !DILocation(line: 2004, column: 16, scope: !4631)
!4645 = !DILocation(line: 2005, column: 25, scope: !4631)
!4646 = !DILocation(line: 2005, column: 33, scope: !4631)
!4647 = !DILocation(line: 2005, column: 2, scope: !4631)
!4648 = !DILocation(line: 2006, column: 18, scope: !4631)
!4649 = !DILocation(line: 2006, column: 16, scope: !4631)
!4650 = !DILocation(line: 2013, column: 1, scope: !4631)
!4651 = distinct !DISubprogram(name: "DoPlayerDead", linkageName: "_Z12DoPlayerDeadv", scope: !29, file: !29, line: 2092, type: !961, scopeLine: 2093, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1694)
!4652 = !DILocation(line: 2094, column: 2, scope: !4651)
!4653 = !DILocation(line: 2096, column: 2, scope: !4651)
!4654 = !DILocation(line: 2099, column: 2, scope: !4651)
!4655 = !DILocation(line: 2101, column: 2, scope: !4651)
!4656 = !DILocation(line: 2123, column: 11, scope: !4657)
!4657 = distinct !DILexicalBlock(scope: !4651, file: !29, line: 2122, column: 2)
!4658 = !DILocation(line: 2123, column: 3, scope: !4657)
!4659 = !DILocation(line: 2123, column: 23, scope: !4657)
!4660 = !DILocation(line: 2123, column: 28, scope: !4657)
!4661 = !DILocation(line: 2124, column: 15, scope: !4662)
!4662 = distinct !DILexicalBlock(scope: !4657, file: !29, line: 2124, column: 7)
!4663 = !DILocation(line: 2124, column: 7, scope: !4662)
!4664 = !DILocation(line: 2124, column: 27, scope: !4662)
!4665 = !DILocation(line: 2124, column: 33, scope: !4662)
!4666 = !DILocation(line: 2126, column: 4, scope: !4667)
!4667 = distinct !DILexicalBlock(scope: !4662, file: !29, line: 2125, column: 3)
!4668 = !DILocation(line: 2127, column: 4, scope: !4667)
!4669 = !DILocation(line: 2131, column: 6, scope: !4670)
!4670 = distinct !DILexicalBlock(scope: !4651, file: !29, line: 2131, column: 6)
!4671 = !DILocation(line: 2134, column: 11, scope: !4672)
!4672 = distinct !DILexicalBlock(scope: !4670, file: !29, line: 2132, column: 2)
!4673 = !DILocation(line: 2134, column: 3, scope: !4672)
!4674 = !DILocation(line: 2134, column: 23, scope: !4672)
!4675 = !DILocation(line: 2134, column: 41, scope: !4672)
!4676 = !DILocation(line: 2135, column: 11, scope: !4672)
!4677 = !DILocation(line: 2135, column: 3, scope: !4672)
!4678 = !DILocation(line: 2135, column: 23, scope: !4672)
!4679 = !DILocation(line: 2135, column: 30, scope: !4672)
!4680 = !DILocation(line: 2136, column: 11, scope: !4672)
!4681 = !DILocation(line: 2136, column: 3, scope: !4672)
!4682 = !DILocation(line: 2136, column: 23, scope: !4672)
!4683 = !DILocation(line: 2136, column: 31, scope: !4672)
!4684 = !DILocation(line: 2137, column: 11, scope: !4672)
!4685 = !DILocation(line: 2137, column: 3, scope: !4672)
!4686 = !DILocation(line: 2137, column: 23, scope: !4672)
!4687 = !DILocation(line: 2137, column: 33, scope: !4672)
!4688 = !DILocation(line: 2139, column: 3, scope: !4672)
!4689 = !DILocation(line: 2141, column: 7, scope: !4690)
!4690 = distinct !DILexicalBlock(scope: !4672, file: !29, line: 2141, column: 7)
!4691 = !DILocation(line: 2141, column: 25, scope: !4690)
!4692 = !DILocalVariable(name: "fp", scope: !4693, file: !29, line: 2143, type: !651)
!4693 = distinct !DILexicalBlock(scope: !4690, file: !29, line: 2142, column: 3)
!4694 = !DILocation(line: 2143, column: 10, scope: !4693)
!4695 = !DILocation(line: 2145, column: 14, scope: !4696)
!4696 = distinct !DILexicalBlock(scope: !4693, file: !29, line: 2145, column: 8)
!4697 = !DILocation(line: 2145, column: 12, scope: !4696)
!4698 = !DILocation(line: 2145, column: 45, scope: !4696)
!4699 = !DILocation(line: 2147, column: 12, scope: !4700)
!4700 = distinct !DILexicalBlock(scope: !4696, file: !29, line: 2146, column: 4)
!4701 = !DILocation(line: 2147, column: 5, scope: !4700)
!4702 = !DILocation(line: 2148, column: 5, scope: !4700)
!4703 = !DILocation(line: 2149, column: 5, scope: !4700)
!4704 = !DILocation(line: 2150, column: 5, scope: !4700)
!4705 = !DILocation(line: 2151, column: 13, scope: !4700)
!4706 = !DILocation(line: 2151, column: 5, scope: !4700)
!4707 = !DILocation(line: 2151, column: 25, scope: !4700)
!4708 = !DILocation(line: 2151, column: 30, scope: !4700)
!4709 = !DILocation(line: 2152, column: 4, scope: !4700)
!4710 = !DILocation(line: 2155, column: 5, scope: !4711)
!4711 = distinct !DILexicalBlock(scope: !4696, file: !29, line: 2154, column: 4)
!4712 = !DILocation(line: 2156, column: 19, scope: !4711)
!4713 = !DILocation(line: 2156, column: 38, scope: !4711)
!4714 = !DILocation(line: 2156, column: 5, scope: !4711)
!4715 = !DILocation(line: 2157, column: 5, scope: !4711)
!4716 = !DILocation(line: 2159, column: 3, scope: !4693)
!4717 = !DILocation(line: 2162, column: 4, scope: !4718)
!4718 = distinct !DILexicalBlock(scope: !4690, file: !29, line: 2161, column: 3)
!4719 = !DILocation(line: 2164, column: 4, scope: !4718)
!4720 = !DILocation(line: 2165, column: 23, scope: !4718)
!4721 = !DILocation(line: 2168, column: 2, scope: !4672)
!4722 = !DILocation(line: 2169, column: 11, scope: !4723)
!4723 = distinct !DILexicalBlock(scope: !4670, file: !29, line: 2169, column: 11)
!4724 = !DILocation(line: 2169, column: 29, scope: !4723)
!4725 = !DILocalVariable(name: "fp", scope: !4726, file: !29, line: 2171, type: !651)
!4726 = distinct !DILexicalBlock(scope: !4723, file: !29, line: 2170, column: 2)
!4727 = !DILocation(line: 2171, column: 9, scope: !4726)
!4728 = !DILocation(line: 2172, column: 13, scope: !4729)
!4729 = distinct !DILexicalBlock(scope: !4726, file: !29, line: 2172, column: 7)
!4730 = !DILocation(line: 2172, column: 11, scope: !4729)
!4731 = !DILocation(line: 2172, column: 44, scope: !4729)
!4732 = !DILocation(line: 2174, column: 11, scope: !4733)
!4733 = distinct !DILexicalBlock(scope: !4729, file: !29, line: 2173, column: 3)
!4734 = !DILocation(line: 2174, column: 4, scope: !4733)
!4735 = !DILocation(line: 2175, column: 4, scope: !4733)
!4736 = !DILocation(line: 2176, column: 9, scope: !4737)
!4737 = distinct !DILexicalBlock(scope: !4733, file: !29, line: 2176, column: 8)
!4738 = !DILocation(line: 2176, column: 8, scope: !4737)
!4739 = !DILocation(line: 2177, column: 5, scope: !4737)
!4740 = !DILocation(line: 2178, column: 4, scope: !4733)
!4741 = !DILocation(line: 2179, column: 4, scope: !4733)
!4742 = !DILocation(line: 2180, column: 12, scope: !4733)
!4743 = !DILocation(line: 2180, column: 4, scope: !4733)
!4744 = !DILocation(line: 2180, column: 24, scope: !4733)
!4745 = !DILocation(line: 2180, column: 29, scope: !4733)
!4746 = !DILocation(line: 2181, column: 3, scope: !4733)
!4747 = !DILocation(line: 2184, column: 4, scope: !4748)
!4748 = distinct !DILexicalBlock(scope: !4729, file: !29, line: 2183, column: 3)
!4749 = !DILocation(line: 2185, column: 4, scope: !4748)
!4750 = !DILocation(line: 2186, column: 18, scope: !4748)
!4751 = !DILocation(line: 2186, column: 37, scope: !4748)
!4752 = !DILocation(line: 2186, column: 4, scope: !4748)
!4753 = !DILocation(line: 2187, column: 4, scope: !4748)
!4754 = !DILocation(line: 2189, column: 2, scope: !4726)
!4755 = !DILocation(line: 2192, column: 3, scope: !4756)
!4756 = distinct !DILexicalBlock(scope: !4723, file: !29, line: 2191, column: 2)
!4757 = !DILocation(line: 2193, column: 3, scope: !4756)
!4758 = !DILocation(line: 2196, column: 2, scope: !4651)
!4759 = !DILocation(line: 2197, column: 1, scope: !4651)
!4760 = distinct !DISubprogram(name: "StartLevel", linkageName: "_Z10StartLeveli", scope: !29, file: !29, line: 2746, type: !970, scopeLine: 2747, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1694)
!4761 = !DILocalVariable(name: "random_flag", arg: 1, scope: !4760, file: !29, line: 2746, type: !7)
!4762 = !DILocation(line: 2746, column: 21, scope: !4760)
!4763 = !DILocation(line: 2748, column: 2, scope: !4760)
!4764 = !DILocation(line: 2750, column: 21, scope: !4760)
!4765 = !DILocation(line: 2750, column: 2, scope: !4760)
!4766 = !DILocation(line: 2752, column: 2, scope: !4760)
!4767 = !DILocation(line: 2754, column: 2, scope: !4760)
!4768 = !DILocation(line: 2754, column: 17, scope: !4760)
!4769 = !DILocation(line: 2754, column: 30, scope: !4760)
!4770 = !DILocation(line: 2755, column: 2, scope: !4760)
!4771 = !DILocation(line: 2755, column: 17, scope: !4760)
!4772 = !DILocation(line: 2755, column: 31, scope: !4760)
!4773 = !DILocation(line: 2757, column: 2, scope: !4760)
!4774 = !DILocation(line: 2759, column: 2, scope: !4760)
!4775 = !DILocation(line: 2762, column: 23, scope: !4760)
!4776 = !DILocation(line: 2777, column: 2, scope: !4760)
!4777 = !DILocation(line: 2778, column: 2, scope: !4760)
!4778 = !DILocation(line: 2779, column: 2, scope: !4760)
!4779 = !DILocation(line: 2789, column: 2, scope: !4760)
!4780 = !DILocation(line: 2791, column: 2, scope: !4760)
!4781 = !DILocation(line: 2792, column: 31, scope: !4760)
!4782 = !DILocation(line: 2793, column: 16, scope: !4760)
!4783 = !DILocation(line: 2795, column: 23, scope: !4760)
!4784 = !DILocation(line: 2796, column: 1, scope: !4760)
!4785 = distinct !DISubprogram(name: "StartNewLevelSub", linkageName: "_Z16StartNewLevelSubiii", scope: !29, file: !29, line: 2204, type: !4786, scopeLine: 2205, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1694)
!4786 = !DISubroutineType(types: !4787)
!4787 = !{null, !7, !7, !7}
!4788 = !DILocalVariable(name: "level_num", arg: 1, scope: !4785, file: !29, line: 2204, type: !7)
!4789 = !DILocation(line: 2204, column: 27, scope: !4785)
!4790 = !DILocalVariable(name: "page_in_textures", arg: 2, scope: !4785, file: !29, line: 2204, type: !7)
!4791 = !DILocation(line: 2204, column: 42, scope: !4785)
!4792 = !DILocalVariable(name: "secret_flag", arg: 3, scope: !4785, file: !29, line: 2204, type: !7)
!4793 = !DILocation(line: 2204, column: 64, scope: !4785)
!4794 = !DILocation(line: 2206, column: 8, scope: !4795)
!4795 = distinct !DILexicalBlock(scope: !4785, file: !29, line: 2206, column: 6)
!4796 = !DILocation(line: 2206, column: 18, scope: !4795)
!4797 = !DILocation(line: 2206, column: 7, scope: !4795)
!4798 = !DILocation(line: 2206, column: 6, scope: !4795)
!4799 = !DILocation(line: 2208, column: 22, scope: !4800)
!4800 = distinct !DILexicalBlock(scope: !4795, file: !29, line: 2207, column: 2)
!4801 = !DILocation(line: 2209, column: 2, scope: !4800)
!4802 = !DILocation(line: 2210, column: 18, scope: !4785)
!4803 = !DILocation(line: 2212, column: 6, scope: !4804)
!4804 = distinct !DILexicalBlock(scope: !4785, file: !29, line: 2212, column: 6)
!4805 = !DILocation(line: 2212, column: 20, scope: !4804)
!4806 = !DILocation(line: 2213, column: 17, scope: !4804)
!4807 = !DILocation(line: 2213, column: 3, scope: !4804)
!4808 = !DILocation(line: 2215, column: 6, scope: !4809)
!4809 = distinct !DILexicalBlock(scope: !4785, file: !29, line: 2215, column: 6)
!4810 = !DILocation(line: 2215, column: 20, scope: !4809)
!4811 = !DILocation(line: 2217, column: 25, scope: !4812)
!4812 = distinct !DILexicalBlock(scope: !4809, file: !29, line: 2216, column: 2)
!4813 = !DILocation(line: 2217, column: 3, scope: !4812)
!4814 = !DILocation(line: 2218, column: 30, scope: !4812)
!4815 = !DILocation(line: 2218, column: 42, scope: !4812)
!4816 = !DILocation(line: 2218, column: 3, scope: !4812)
!4817 = !DILocation(line: 2219, column: 2, scope: !4812)
!4818 = !DILocation(line: 2221, column: 6, scope: !4819)
!4819 = distinct !DILexicalBlock(scope: !4785, file: !29, line: 2221, column: 6)
!4820 = !DILocation(line: 2221, column: 16, scope: !4819)
!4821 = !DILocation(line: 2222, column: 17, scope: !4819)
!4822 = !DILocation(line: 2222, column: 3, scope: !4819)
!4823 = !DILocation(line: 2224, column: 12, scope: !4785)
!4824 = !DILocation(line: 2224, column: 23, scope: !4785)
!4825 = !DILocation(line: 2224, column: 2, scope: !4785)
!4826 = !DILocation(line: 2226, column: 2, scope: !4785)
!4827 = !DILocation(line: 2228, column: 2, scope: !4785)
!4828 = !DILocation(line: 2230, column: 28, scope: !4785)
!4829 = !DILocation(line: 2230, column: 20, scope: !4785)
!4830 = !DILocation(line: 2230, column: 40, scope: !4785)
!4831 = !DILocation(line: 2230, column: 12, scope: !4785)
!4832 = !DILocation(line: 2230, column: 9, scope: !4785)
!4833 = !DILocation(line: 2232, column: 2, scope: !4785)
!4834 = !DILocation(line: 2243, column: 2, scope: !4785)
!4835 = !DILocation(line: 2248, column: 2, scope: !4785)
!4836 = !DILocation(line: 2249, column: 2, scope: !4785)
!4837 = !DILocation(line: 2258, column: 26, scope: !4785)
!4838 = !DILocation(line: 2258, column: 2, scope: !4785)
!4839 = !DILocation(line: 2274, column: 2, scope: !4785)
!4840 = !DILocation(line: 2276, column: 17, scope: !4785)
!4841 = !DILocation(line: 2278, column: 27, scope: !4785)
!4842 = !DILocation(line: 2280, column: 2, scope: !4785)
!4843 = !DILocation(line: 2281, column: 2, scope: !4785)
!4844 = !DILocation(line: 2282, column: 2, scope: !4785)
!4845 = !DILocation(line: 2283, column: 2, scope: !4785)
!4846 = !DILocation(line: 2284, column: 2, scope: !4785)
!4847 = !DILocation(line: 2285, column: 2, scope: !4785)
!4848 = !DILocation(line: 2286, column: 2, scope: !4785)
!4849 = !DILocation(line: 2287, column: 2, scope: !4785)
!4850 = !DILocation(line: 2297, column: 2, scope: !4785)
!4851 = !DILocation(line: 2298, column: 2, scope: !4785)
!4852 = !DILocation(line: 2299, column: 2, scope: !4785)
!4853 = !DILocation(line: 2300, column: 8, scope: !4854)
!4854 = distinct !DILexicalBlock(scope: !4785, file: !29, line: 2300, column: 6)
!4855 = !DILocation(line: 2300, column: 18, scope: !4854)
!4856 = !DILocation(line: 2300, column: 7, scope: !4854)
!4857 = !DILocation(line: 2300, column: 6, scope: !4854)
!4858 = !DILocation(line: 2301, column: 3, scope: !4854)
!4859 = !DILocation(line: 2303, column: 2, scope: !4785)
!4860 = !DILocation(line: 2305, column: 8, scope: !4861)
!4861 = distinct !DILexicalBlock(scope: !4785, file: !29, line: 2305, column: 6)
!4862 = !DILocation(line: 2305, column: 18, scope: !4861)
!4863 = !DILocation(line: 2305, column: 7, scope: !4861)
!4864 = !DILocation(line: 2305, column: 30, scope: !4861)
!4865 = !DILocation(line: 2305, column: 34, scope: !4861)
!4866 = !DILocation(line: 2306, column: 21, scope: !4861)
!4867 = !DILocation(line: 2306, column: 3, scope: !4861)
!4868 = !DILocation(line: 2308, column: 3, scope: !4861)
!4869 = !DILocation(line: 2310, column: 2, scope: !4785)
!4870 = !DILocation(line: 2323, column: 3, scope: !4785)
!4871 = !DILocation(line: 2325, column: 2, scope: !4785)
!4872 = !DILocation(line: 2326, column: 2, scope: !4785)
!4873 = !DILocation(line: 2330, column: 6, scope: !4874)
!4874 = distinct !DILexicalBlock(scope: !4785, file: !29, line: 2330, column: 6)
!4875 = !DILocation(line: 2331, column: 27, scope: !4874)
!4876 = !DILocation(line: 2331, column: 38, scope: !4874)
!4877 = !DILocation(line: 2331, column: 3, scope: !4874)
!4878 = !DILocation(line: 2334, column: 6, scope: !4879)
!4879 = distinct !DILexicalBlock(scope: !4785, file: !29, line: 2334, column: 6)
!4880 = !DILocation(line: 2335, column: 3, scope: !4879)
!4881 = !DILocation(line: 2339, column: 26, scope: !4785)
!4882 = !DILocation(line: 2340, column: 1, scope: !4785)
!4883 = distinct !DISubprogram(name: "filter_objects_from_level", linkageName: "_Z25filter_objects_from_levelv", scope: !29, file: !29, line: 2382, type: !961, scopeLine: 2383, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1694)
!4884 = !DILocalVariable(name: "i", scope: !4883, file: !29, line: 2404, type: !7)
!4885 = !DILocation(line: 2404, column: 6, scope: !4883)
!4886 = !DILocation(line: 2406, column: 2, scope: !4883)
!4887 = !DILocation(line: 2408, column: 9, scope: !4888)
!4888 = distinct !DILexicalBlock(scope: !4883, file: !29, line: 2408, column: 2)
!4889 = !DILocation(line: 2408, column: 7, scope: !4888)
!4890 = !DILocation(line: 2408, column: 14, scope: !4891)
!4891 = distinct !DILexicalBlock(scope: !4888, file: !29, line: 2408, column: 2)
!4892 = !DILocation(line: 2408, column: 19, scope: !4891)
!4893 = !DILocation(line: 2408, column: 16, scope: !4891)
!4894 = !DILocation(line: 2408, column: 2, scope: !4888)
!4895 = !DILocation(line: 2410, column: 15, scope: !4896)
!4896 = distinct !DILexicalBlock(scope: !4897, file: !29, line: 2410, column: 7)
!4897 = distinct !DILexicalBlock(scope: !4891, file: !29, line: 2409, column: 2)
!4898 = !DILocation(line: 2410, column: 7, scope: !4896)
!4899 = !DILocation(line: 2410, column: 18, scope: !4896)
!4900 = !DILocation(line: 2410, column: 23, scope: !4896)
!4901 = !DILocation(line: 2411, column: 16, scope: !4902)
!4902 = distinct !DILexicalBlock(scope: !4896, file: !29, line: 2411, column: 8)
!4903 = !DILocation(line: 2411, column: 8, scope: !4902)
!4904 = !DILocation(line: 2411, column: 19, scope: !4902)
!4905 = !DILocation(line: 2411, column: 22, scope: !4902)
!4906 = !DILocation(line: 2411, column: 38, scope: !4902)
!4907 = !DILocation(line: 2411, column: 49, scope: !4902)
!4908 = !DILocation(line: 2411, column: 41, scope: !4902)
!4909 = !DILocation(line: 2411, column: 52, scope: !4902)
!4910 = !DILocation(line: 2411, column: 55, scope: !4902)
!4911 = !DILocation(line: 2412, column: 20, scope: !4902)
!4912 = !DILocation(line: 2412, column: 5, scope: !4902)
!4913 = !DILocation(line: 2411, column: 58, scope: !4902)
!4914 = !DILocation(line: 2413, column: 2, scope: !4897)
!4915 = !DILocation(line: 2408, column: 42, scope: !4891)
!4916 = !DILocation(line: 2408, column: 2, scope: !4891)
!4917 = distinct !{!4917, !4894, !4918, !1721}
!4918 = !DILocation(line: 2413, column: 2, scope: !4888)
!4919 = !DILocation(line: 2414, column: 1, scope: !4883)
!4920 = distinct !DISubprogram(name: "bash_to_shield", linkageName: "_Z14bash_to_shieldiPKc", scope: !29, file: !29, line: 2345, type: !4921, scopeLine: 2346, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1694)
!4921 = !DISubroutineType(types: !4922)
!4922 = !{null, !7, !549}
!4923 = !DILocalVariable(name: "i", arg: 1, scope: !4920, file: !29, line: 2345, type: !7)
!4924 = !DILocation(line: 2345, column: 25, scope: !4920)
!4925 = !DILocalVariable(name: "s", arg: 2, scope: !4920, file: !29, line: 2345, type: !549)
!4926 = !DILocation(line: 2345, column: 40, scope: !4920)
!4927 = !DILocalVariable(name: "type", scope: !4920, file: !29, line: 2372, type: !7)
!4928 = !DILocation(line: 2372, column: 6, scope: !4920)
!4929 = !DILocation(line: 2372, column: 21, scope: !4920)
!4930 = !DILocation(line: 2372, column: 13, scope: !4920)
!4931 = !DILocation(line: 2372, column: 24, scope: !4920)
!4932 = !DILocation(line: 2374, column: 2, scope: !4920)
!4933 = !DILocation(line: 2376, column: 10, scope: !4920)
!4934 = !DILocation(line: 2376, column: 2, scope: !4920)
!4935 = !DILocation(line: 2376, column: 13, scope: !4920)
!4936 = !DILocation(line: 2376, column: 16, scope: !4920)
!4937 = !DILocation(line: 2377, column: 63, scope: !4920)
!4938 = !DILocation(line: 2377, column: 55, scope: !4920)
!4939 = !DILocation(line: 2377, column: 66, scope: !4920)
!4940 = !DILocation(line: 2377, column: 42, scope: !4920)
!4941 = !DILocation(line: 2377, column: 70, scope: !4920)
!4942 = !DILocation(line: 2377, column: 10, scope: !4920)
!4943 = !DILocation(line: 2377, column: 2, scope: !4920)
!4944 = !DILocation(line: 2377, column: 13, scope: !4920)
!4945 = !DILocation(line: 2377, column: 30, scope: !4920)
!4946 = !DILocation(line: 2377, column: 40, scope: !4920)
!4947 = !DILocation(line: 2378, column: 56, scope: !4920)
!4948 = !DILocation(line: 2378, column: 48, scope: !4920)
!4949 = !DILocation(line: 2378, column: 59, scope: !4920)
!4950 = !DILocation(line: 2378, column: 76, scope: !4920)
!4951 = !DILocation(line: 2378, column: 42, scope: !4920)
!4952 = !DILocation(line: 2378, column: 87, scope: !4920)
!4953 = !DILocation(line: 2378, column: 10, scope: !4920)
!4954 = !DILocation(line: 2378, column: 2, scope: !4920)
!4955 = !DILocation(line: 2378, column: 13, scope: !4920)
!4956 = !DILocation(line: 2378, column: 30, scope: !4920)
!4957 = !DILocation(line: 2378, column: 40, scope: !4920)
!4958 = !DILocation(line: 2379, column: 1, scope: !4920)
!4959 = distinct !DISubprogram(name: "ShowLevelIntro", linkageName: "_Z14ShowLevelIntroi", scope: !29, file: !29, line: 2433, type: !970, scopeLine: 2434, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1694)
!4960 = !DILocalVariable(name: "level_num", arg: 1, scope: !4959, file: !29, line: 2433, type: !7)
!4961 = !DILocation(line: 2433, column: 25, scope: !4959)
!4962 = !DILocation(line: 2437, column: 8, scope: !4963)
!4963 = distinct !DILexicalBlock(scope: !4959, file: !29, line: 2437, column: 6)
!4964 = !DILocation(line: 2437, column: 18, scope: !4963)
!4965 = !DILocation(line: 2437, column: 7, scope: !4963)
!4966 = !DILocation(line: 2437, column: 6, scope: !4963)
!4967 = !DILocalVariable(name: "i", scope: !4968, file: !29, line: 2438, type: !7)
!4968 = distinct !DILexicalBlock(scope: !4963, file: !29, line: 2437, column: 31)
!4969 = !DILocation(line: 2438, column: 7, scope: !4968)
!4970 = !DILocalVariable(name: "save_pal", scope: !4968, file: !29, line: 2439, type: !4971)
!4971 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6144, elements: !4972)
!4972 = !{!4973}
!4973 = !DISubrange(count: 768)
!4974 = !DILocation(line: 2439, column: 11, scope: !4968)
!4975 = !DILocation(line: 2441, column: 3, scope: !4968)
!4976 = !DILocation(line: 2448, column: 7, scope: !4977)
!4977 = distinct !DILexicalBlock(scope: !4968, file: !29, line: 2448, column: 7)
!4978 = !DILocation(line: 2448, column: 27, scope: !4977)
!4979 = !DILocalVariable(name: "movie", scope: !4980, file: !29, line: 2450, type: !7)
!4980 = distinct !DILexicalBlock(scope: !4977, file: !29, line: 2449, column: 3)
!4981 = !DILocation(line: 2450, column: 8, scope: !4980)
!4982 = !DILocation(line: 2452, column: 11, scope: !4983)
!4983 = distinct !DILexicalBlock(scope: !4980, file: !29, line: 2452, column: 4)
!4984 = !DILocation(line: 2452, column: 9, scope: !4983)
!4985 = !DILocation(line: 2452, column: 16, scope: !4986)
!4986 = distinct !DILexicalBlock(scope: !4983, file: !29, line: 2452, column: 4)
!4987 = !DILocation(line: 2452, column: 18, scope: !4986)
!4988 = !DILocation(line: 2452, column: 4, scope: !4983)
!4989 = !DILocation(line: 2454, column: 21, scope: !4990)
!4990 = distinct !DILexicalBlock(scope: !4991, file: !29, line: 2454, column: 9)
!4991 = distinct !DILexicalBlock(scope: !4986, file: !29, line: 2453, column: 4)
!4992 = !DILocation(line: 2454, column: 9, scope: !4990)
!4993 = !DILocation(line: 2454, column: 24, scope: !4990)
!4994 = !DILocation(line: 2454, column: 37, scope: !4990)
!4995 = !DILocation(line: 2454, column: 34, scope: !4990)
!4996 = !DILocation(line: 2456, column: 28, scope: !4997)
!4997 = distinct !DILexicalBlock(scope: !4990, file: !29, line: 2455, column: 5)
!4998 = !DILocation(line: 2456, column: 16, scope: !4997)
!4999 = !DILocation(line: 2456, column: 31, scope: !4997)
!5000 = !DILocation(line: 2456, column: 6, scope: !4997)
!5001 = !DILocation(line: 2457, column: 12, scope: !4997)
!5002 = !DILocation(line: 2458, column: 6, scope: !4997)
!5003 = !DILocation(line: 2460, column: 4, scope: !4991)
!5004 = !DILocation(line: 2452, column: 39, scope: !4986)
!5005 = !DILocation(line: 2452, column: 4, scope: !4986)
!5006 = distinct !{!5006, !4988, !5007, !1721}
!5007 = !DILocation(line: 2460, column: 4, scope: !4983)
!5008 = !DILocation(line: 2462, column: 8, scope: !5009)
!5009 = distinct !DILexicalBlock(scope: !4980, file: !29, line: 2462, column: 8)
!5010 = !DILocation(line: 2462, column: 27, scope: !5009)
!5011 = !DILocation(line: 2462, column: 44, scope: !5009)
!5012 = !DILocation(line: 2462, column: 47, scope: !5009)
!5013 = !DILocation(line: 2462, column: 57, scope: !5009)
!5014 = !DILocation(line: 2464, column: 5, scope: !5015)
!5015 = distinct !DILexicalBlock(scope: !5009, file: !29, line: 2463, column: 4)
!5016 = !DILocation(line: 2465, column: 4, scope: !5015)
!5017 = !DILocation(line: 2467, column: 8, scope: !5018)
!5018 = distinct !DILexicalBlock(scope: !4980, file: !29, line: 2467, column: 8)
!5019 = !DILocation(line: 2467, column: 27, scope: !5018)
!5020 = !DILocation(line: 2469, column: 9, scope: !5021)
!5021 = distinct !DILexicalBlock(scope: !5022, file: !29, line: 2469, column: 9)
!5022 = distinct !DILexicalBlock(scope: !5018, file: !29, line: 2468, column: 4)
!5023 = !DILocalVariable(name: "hires_save", scope: !5024, file: !29, line: 2471, type: !7)
!5024 = distinct !DILexicalBlock(scope: !5021, file: !29, line: 2470, column: 5)
!5025 = !DILocation(line: 2471, column: 10, scope: !5024)
!5026 = !DILocation(line: 2471, column: 23, scope: !5024)
!5027 = !DILocation(line: 2473, column: 10, scope: !5028)
!5028 = distinct !DILexicalBlock(scope: !5024, file: !29, line: 2473, column: 10)
!5029 = !DILocation(line: 2473, column: 23, scope: !5028)
!5030 = !DILocation(line: 2475, column: 26, scope: !5031)
!5031 = distinct !DILexicalBlock(scope: !5028, file: !29, line: 2474, column: 6)
!5032 = !DILocation(line: 2477, column: 11, scope: !5033)
!5033 = distinct !DILexicalBlock(scope: !5031, file: !29, line: 2477, column: 11)
!5034 = !DILocation(line: 2477, column: 25, scope: !5033)
!5035 = !DILocation(line: 2477, column: 22, scope: !5033)
!5036 = !DILocation(line: 2478, column: 20, scope: !5033)
!5037 = !DILocation(line: 2478, column: 8, scope: !5033)
!5038 = !DILocation(line: 2480, column: 6, scope: !5031)
!5039 = !DILocation(line: 2481, column: 39, scope: !5024)
!5040 = !DILocation(line: 2481, column: 6, scope: !5024)
!5041 = !DILocation(line: 2482, column: 27, scope: !5024)
!5042 = !DILocation(line: 2482, column: 25, scope: !5024)
!5043 = !DILocation(line: 2483, column: 3, scope: !5024)
!5044 = !DILocation(line: 2484, column: 2, scope: !5022)
!5045 = !DILocation(line: 2486, column: 3, scope: !4980)
!5046 = !DILocalVariable(name: "tname", scope: !5047, file: !29, line: 2489, type: !394)
!5047 = distinct !DILexicalBlock(scope: !4977, file: !29, line: 2488, column: 3)
!5048 = !DILocation(line: 2489, column: 9, scope: !5047)
!5049 = !DILocation(line: 2490, column: 12, scope: !5047)
!5050 = !DILocation(line: 2490, column: 29, scope: !5047)
!5051 = !DILocation(line: 2490, column: 4, scope: !5047)
!5052 = !DILocation(line: 2491, column: 24, scope: !5047)
!5053 = !DILocation(line: 2491, column: 31, scope: !5047)
!5054 = !DILocation(line: 2491, column: 4, scope: !5047)
!5055 = !DILocation(line: 2495, column: 3, scope: !4968)
!5056 = !DILocation(line: 2496, column: 2, scope: !4968)
!5057 = !DILocation(line: 2497, column: 1, scope: !4959)
!5058 = distinct !DISubprogram(name: "maybe_set_first_secret_visit", linkageName: "_Z28maybe_set_first_secret_visiti", scope: !29, file: !29, line: 2504, type: !970, scopeLine: 2505, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1694)
!5059 = !DILocalVariable(name: "level_num", arg: 1, scope: !5058, file: !29, line: 2504, type: !7)
!5060 = !DILocation(line: 2504, column: 39, scope: !5058)
!5061 = !DILocalVariable(name: "i", scope: !5058, file: !29, line: 2506, type: !7)
!5062 = !DILocation(line: 2506, column: 6, scope: !5058)
!5063 = !DILocation(line: 2508, column: 9, scope: !5064)
!5064 = distinct !DILexicalBlock(scope: !5058, file: !29, line: 2508, column: 2)
!5065 = !DILocation(line: 2508, column: 7, scope: !5064)
!5066 = !DILocation(line: 2508, column: 14, scope: !5067)
!5067 = distinct !DILexicalBlock(scope: !5064, file: !29, line: 2508, column: 2)
!5068 = !DILocation(line: 2508, column: 18, scope: !5067)
!5069 = !DILocation(line: 2508, column: 16, scope: !5067)
!5070 = !DILocation(line: 2508, column: 2, scope: !5064)
!5071 = !DILocation(line: 2509, column: 26, scope: !5072)
!5072 = distinct !DILexicalBlock(scope: !5073, file: !29, line: 2509, column: 7)
!5073 = distinct !DILexicalBlock(scope: !5067, file: !29, line: 2508, column: 40)
!5074 = !DILocation(line: 2509, column: 7, scope: !5072)
!5075 = !DILocation(line: 2509, column: 32, scope: !5072)
!5076 = !DILocation(line: 2509, column: 29, scope: !5072)
!5077 = !DILocation(line: 2510, column: 23, scope: !5078)
!5078 = distinct !DILexicalBlock(scope: !5072, file: !29, line: 2509, column: 43)
!5079 = !DILocation(line: 2511, column: 4, scope: !5078)
!5080 = !DILocation(line: 2512, column: 3, scope: !5078)
!5081 = !DILocation(line: 2513, column: 2, scope: !5073)
!5082 = !DILocation(line: 2508, column: 36, scope: !5067)
!5083 = !DILocation(line: 2508, column: 2, scope: !5067)
!5084 = distinct !{!5084, !5070, !5085, !1721}
!5085 = !DILocation(line: 2513, column: 2, scope: !5064)
!5086 = !DILocation(line: 2514, column: 1, scope: !5058)
!5087 = distinct !DISubprogram(name: "copy_defaults_to_robot", linkageName: "_Z22copy_defaults_to_robotP6object", scope: !29, file: !29, line: 2610, type: !2525, scopeLine: 2611, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1694)
!5088 = !DILocalVariable(name: "objp", arg: 1, scope: !5087, file: !29, line: 2610, type: !2527)
!5089 = !DILocation(line: 2610, column: 37, scope: !5087)
!5090 = !DILocalVariable(name: "robptr", scope: !5087, file: !29, line: 2646, type: !5091)
!5091 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5092, size: 64)
!5092 = !DIDerivedType(tag: DW_TAG_typedef, name: "robot_info", file: !5093, line: 128, baseType: !5094)
!5093 = !DIFile(filename: "main_d2/robot.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "7821ab73cbe058734a84802231002e5e")
!5094 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "robot_info", file: !5093, line: 53, size: 3840, flags: DIFlagTypePassByValue, elements: !5095, identifier: "_ZTS10robot_info")
!5095 = !{!5096, !5097, !5099, !5101, !5102, !5103, !5104, !5105, !5106, !5107, !5108, !5109, !5110, !5111, !5112, !5113, !5114, !5115, !5116, !5117, !5118, !5119, !5120, !5122, !5123, !5124, !5125, !5126, !5127, !5129, !5130, !5131, !5132, !5133, !5134, !5135, !5136, !5137, !5138, !5139, !5140, !5141, !5142, !5143, !5144, !5145, !5147, !5148, !5149, !5150, !5151, !5159}
!5096 = !DIDerivedType(tag: DW_TAG_member, name: "model_num", scope: !5094, file: !5093, line: 55, baseType: !7, size: 32)
!5097 = !DIDerivedType(tag: DW_TAG_member, name: "gun_points", scope: !5094, file: !5093, line: 56, baseType: !5098, size: 768, offset: 32)
!5098 = !DICompositeType(tag: DW_TAG_array_type, baseType: !119, size: 768, elements: !134)
!5099 = !DIDerivedType(tag: DW_TAG_member, name: "gun_submodels", scope: !5094, file: !5093, line: 57, baseType: !5100, size: 64, offset: 800)
!5100 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 64, elements: !134)
!5101 = !DIDerivedType(tag: DW_TAG_member, name: "exp1_vclip_num", scope: !5094, file: !5093, line: 59, baseType: !20, size: 16, offset: 864)
!5102 = !DIDerivedType(tag: DW_TAG_member, name: "exp1_sound_num", scope: !5094, file: !5093, line: 60, baseType: !20, size: 16, offset: 880)
!5103 = !DIDerivedType(tag: DW_TAG_member, name: "exp2_vclip_num", scope: !5094, file: !5093, line: 62, baseType: !20, size: 16, offset: 896)
!5104 = !DIDerivedType(tag: DW_TAG_member, name: "exp2_sound_num", scope: !5094, file: !5093, line: 63, baseType: !20, size: 16, offset: 912)
!5105 = !DIDerivedType(tag: DW_TAG_member, name: "weapon_type", scope: !5094, file: !5093, line: 65, baseType: !60, size: 8, offset: 928)
!5106 = !DIDerivedType(tag: DW_TAG_member, name: "weapon_type2", scope: !5094, file: !5093, line: 66, baseType: !60, size: 8, offset: 936)
!5107 = !DIDerivedType(tag: DW_TAG_member, name: "n_guns", scope: !5094, file: !5093, line: 67, baseType: !60, size: 8, offset: 944)
!5108 = !DIDerivedType(tag: DW_TAG_member, name: "contains_id", scope: !5094, file: !5093, line: 68, baseType: !60, size: 8, offset: 952)
!5109 = !DIDerivedType(tag: DW_TAG_member, name: "contains_count", scope: !5094, file: !5093, line: 70, baseType: !60, size: 8, offset: 960)
!5110 = !DIDerivedType(tag: DW_TAG_member, name: "contains_prob", scope: !5094, file: !5093, line: 71, baseType: !60, size: 8, offset: 968)
!5111 = !DIDerivedType(tag: DW_TAG_member, name: "contains_type", scope: !5094, file: !5093, line: 72, baseType: !60, size: 8, offset: 976)
!5112 = !DIDerivedType(tag: DW_TAG_member, name: "kamikaze", scope: !5094, file: !5093, line: 73, baseType: !60, size: 8, offset: 984)
!5113 = !DIDerivedType(tag: DW_TAG_member, name: "score_value", scope: !5094, file: !5093, line: 75, baseType: !20, size: 16, offset: 992)
!5114 = !DIDerivedType(tag: DW_TAG_member, name: "badass", scope: !5094, file: !5093, line: 76, baseType: !60, size: 8, offset: 1008)
!5115 = !DIDerivedType(tag: DW_TAG_member, name: "energy_drain", scope: !5094, file: !5093, line: 77, baseType: !60, size: 8, offset: 1016)
!5116 = !DIDerivedType(tag: DW_TAG_member, name: "lighting", scope: !5094, file: !5093, line: 79, baseType: !71, size: 32, offset: 1024)
!5117 = !DIDerivedType(tag: DW_TAG_member, name: "strength", scope: !5094, file: !5093, line: 80, baseType: !71, size: 32, offset: 1056)
!5118 = !DIDerivedType(tag: DW_TAG_member, name: "mass", scope: !5094, file: !5093, line: 82, baseType: !71, size: 32, offset: 1088)
!5119 = !DIDerivedType(tag: DW_TAG_member, name: "drag", scope: !5094, file: !5093, line: 83, baseType: !71, size: 32, offset: 1120)
!5120 = !DIDerivedType(tag: DW_TAG_member, name: "field_of_view", scope: !5094, file: !5093, line: 85, baseType: !5121, size: 160, offset: 1152)
!5121 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 160, elements: !204)
!5122 = !DIDerivedType(tag: DW_TAG_member, name: "firing_wait", scope: !5094, file: !5093, line: 86, baseType: !5121, size: 160, offset: 1312)
!5123 = !DIDerivedType(tag: DW_TAG_member, name: "firing_wait2", scope: !5094, file: !5093, line: 87, baseType: !5121, size: 160, offset: 1472)
!5124 = !DIDerivedType(tag: DW_TAG_member, name: "turn_time", scope: !5094, file: !5093, line: 88, baseType: !5121, size: 160, offset: 1632)
!5125 = !DIDerivedType(tag: DW_TAG_member, name: "max_speed", scope: !5094, file: !5093, line: 91, baseType: !5121, size: 160, offset: 1792)
!5126 = !DIDerivedType(tag: DW_TAG_member, name: "circle_distance", scope: !5094, file: !5093, line: 92, baseType: !5121, size: 160, offset: 1952)
!5127 = !DIDerivedType(tag: DW_TAG_member, name: "rapidfire_count", scope: !5094, file: !5093, line: 94, baseType: !5128, size: 40, offset: 2112)
!5128 = !DICompositeType(tag: DW_TAG_array_type, baseType: !60, size: 40, elements: !204)
!5129 = !DIDerivedType(tag: DW_TAG_member, name: "evade_speed", scope: !5094, file: !5093, line: 95, baseType: !5128, size: 40, offset: 2152)
!5130 = !DIDerivedType(tag: DW_TAG_member, name: "cloak_type", scope: !5094, file: !5093, line: 96, baseType: !60, size: 8, offset: 2192)
!5131 = !DIDerivedType(tag: DW_TAG_member, name: "attack_type", scope: !5094, file: !5093, line: 97, baseType: !60, size: 8, offset: 2200)
!5132 = !DIDerivedType(tag: DW_TAG_member, name: "see_sound", scope: !5094, file: !5093, line: 99, baseType: !17, size: 8, offset: 2208)
!5133 = !DIDerivedType(tag: DW_TAG_member, name: "attack_sound", scope: !5094, file: !5093, line: 100, baseType: !17, size: 8, offset: 2216)
!5134 = !DIDerivedType(tag: DW_TAG_member, name: "claw_sound", scope: !5094, file: !5093, line: 101, baseType: !17, size: 8, offset: 2224)
!5135 = !DIDerivedType(tag: DW_TAG_member, name: "taunt_sound", scope: !5094, file: !5093, line: 102, baseType: !17, size: 8, offset: 2232)
!5136 = !DIDerivedType(tag: DW_TAG_member, name: "boss_flag", scope: !5094, file: !5093, line: 104, baseType: !60, size: 8, offset: 2240)
!5137 = !DIDerivedType(tag: DW_TAG_member, name: "companion", scope: !5094, file: !5093, line: 105, baseType: !60, size: 8, offset: 2248)
!5138 = !DIDerivedType(tag: DW_TAG_member, name: "smart_blobs", scope: !5094, file: !5093, line: 106, baseType: !60, size: 8, offset: 2256)
!5139 = !DIDerivedType(tag: DW_TAG_member, name: "energy_blobs", scope: !5094, file: !5093, line: 107, baseType: !60, size: 8, offset: 2264)
!5140 = !DIDerivedType(tag: DW_TAG_member, name: "thief", scope: !5094, file: !5093, line: 109, baseType: !60, size: 8, offset: 2272)
!5141 = !DIDerivedType(tag: DW_TAG_member, name: "pursuit", scope: !5094, file: !5093, line: 110, baseType: !60, size: 8, offset: 2280)
!5142 = !DIDerivedType(tag: DW_TAG_member, name: "lightcast", scope: !5094, file: !5093, line: 111, baseType: !60, size: 8, offset: 2288)
!5143 = !DIDerivedType(tag: DW_TAG_member, name: "death_roll", scope: !5094, file: !5093, line: 112, baseType: !60, size: 8, offset: 2296)
!5144 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !5094, file: !5093, line: 115, baseType: !17, size: 8, offset: 2304)
!5145 = !DIDerivedType(tag: DW_TAG_member, name: "pad", scope: !5094, file: !5093, line: 116, baseType: !5146, size: 24, offset: 2312)
!5146 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 24, elements: !189)
!5147 = !DIDerivedType(tag: DW_TAG_member, name: "deathroll_sound", scope: !5094, file: !5093, line: 118, baseType: !17, size: 8, offset: 2336)
!5148 = !DIDerivedType(tag: DW_TAG_member, name: "glow", scope: !5094, file: !5093, line: 119, baseType: !17, size: 8, offset: 2344)
!5149 = !DIDerivedType(tag: DW_TAG_member, name: "behavior", scope: !5094, file: !5093, line: 120, baseType: !17, size: 8, offset: 2352)
!5150 = !DIDerivedType(tag: DW_TAG_member, name: "aim", scope: !5094, file: !5093, line: 121, baseType: !17, size: 8, offset: 2360)
!5151 = !DIDerivedType(tag: DW_TAG_member, name: "anim_states", scope: !5094, file: !5093, line: 124, baseType: !5152, size: 1440, offset: 2368)
!5152 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5153, size: 1440, elements: !5158)
!5153 = !DIDerivedType(tag: DW_TAG_typedef, name: "jointlist", file: !5093, line: 46, baseType: !5154)
!5154 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "jointlist", file: !5093, line: 42, size: 32, flags: DIFlagTypePassByValue, elements: !5155, identifier: "_ZTS9jointlist")
!5155 = !{!5156, !5157}
!5156 = !DIDerivedType(tag: DW_TAG_member, name: "n_joints", scope: !5154, file: !5093, line: 44, baseType: !20, size: 16)
!5157 = !DIDerivedType(tag: DW_TAG_member, name: "offset", scope: !5154, file: !5093, line: 45, baseType: !20, size: 16, offset: 16)
!5158 = !{!53, !205}
!5159 = !DIDerivedType(tag: DW_TAG_member, name: "always_0xabcd", scope: !5094, file: !5093, line: 126, baseType: !7, size: 32, offset: 3808)
!5160 = !DILocation(line: 2646, column: 14, scope: !5087)
!5161 = !DILocalVariable(name: "objid", scope: !5087, file: !29, line: 2647, type: !7)
!5162 = !DILocation(line: 2647, column: 8, scope: !5087)
!5163 = !DILocation(line: 2649, column: 2, scope: !5087)
!5164 = !DILocation(line: 2650, column: 10, scope: !5087)
!5165 = !DILocation(line: 2650, column: 16, scope: !5087)
!5166 = !DILocation(line: 2650, column: 8, scope: !5087)
!5167 = !DILocation(line: 2651, column: 2, scope: !5087)
!5168 = !DILocation(line: 2653, column: 23, scope: !5087)
!5169 = !DILocation(line: 2653, column: 12, scope: !5087)
!5170 = !DILocation(line: 2653, column: 9, scope: !5087)
!5171 = !DILocation(line: 2656, column: 18, scope: !5087)
!5172 = !DILocation(line: 2656, column: 26, scope: !5087)
!5173 = !DILocation(line: 2656, column: 2, scope: !5087)
!5174 = !DILocation(line: 2656, column: 8, scope: !5087)
!5175 = !DILocation(line: 2656, column: 16, scope: !5087)
!5176 = !DILocation(line: 2658, column: 7, scope: !5177)
!5177 = distinct !DILexicalBlock(scope: !5087, file: !29, line: 2658, column: 6)
!5178 = !DILocation(line: 2658, column: 15, scope: !5177)
!5179 = !DILocation(line: 2658, column: 6, scope: !5177)
!5180 = !DILocation(line: 2658, column: 22, scope: !5177)
!5181 = !DILocation(line: 2658, column: 26, scope: !5177)
!5182 = !DILocation(line: 2658, column: 34, scope: !5177)
!5183 = !DILocation(line: 2658, column: 25, scope: !5177)
!5184 = !DILocation(line: 2660, column: 20, scope: !5185)
!5185 = distinct !DILexicalBlock(scope: !5177, file: !29, line: 2659, column: 2)
!5186 = !DILocation(line: 2660, column: 26, scope: !5185)
!5187 = !DILocation(line: 2660, column: 41, scope: !5185)
!5188 = !DILocation(line: 2660, column: 37, scope: !5185)
!5189 = !DILocation(line: 2660, column: 60, scope: !5185)
!5190 = !DILocation(line: 2660, column: 34, scope: !5185)
!5191 = !DILocation(line: 2660, column: 66, scope: !5185)
!5192 = !DILocation(line: 2660, column: 3, scope: !5185)
!5193 = !DILocation(line: 2660, column: 9, scope: !5185)
!5194 = !DILocation(line: 2660, column: 17, scope: !5185)
!5195 = !DILocation(line: 2662, column: 7, scope: !5196)
!5196 = distinct !DILexicalBlock(scope: !5185, file: !29, line: 2662, column: 7)
!5197 = !DILocation(line: 2662, column: 15, scope: !5196)
!5198 = !DILocation(line: 2665, column: 12, scope: !5199)
!5199 = distinct !DILexicalBlock(scope: !5196, file: !29, line: 2663, column: 3)
!5200 = !DILocation(line: 2665, column: 4, scope: !5199)
!5201 = !DILocation(line: 2667, column: 28, scope: !5202)
!5202 = distinct !DILexicalBlock(scope: !5199, file: !29, line: 2666, column: 4)
!5203 = !DILocation(line: 2667, column: 12, scope: !5202)
!5204 = !DILocation(line: 2667, column: 18, scope: !5202)
!5205 = !DILocation(line: 2667, column: 26, scope: !5202)
!5206 = !DILocation(line: 2667, column: 40, scope: !5202)
!5207 = !DILocation(line: 2668, column: 12, scope: !5202)
!5208 = !DILocation(line: 2668, column: 18, scope: !5202)
!5209 = !DILocation(line: 2668, column: 26, scope: !5202)
!5210 = !DILocation(line: 2668, column: 35, scope: !5202)
!5211 = !DILocation(line: 2669, column: 12, scope: !5202)
!5212 = !DILocation(line: 2669, column: 18, scope: !5202)
!5213 = !DILocation(line: 2669, column: 26, scope: !5202)
!5214 = !DILocation(line: 2669, column: 35, scope: !5202)
!5215 = !DILocation(line: 2670, column: 13, scope: !5202)
!5216 = !DILocation(line: 2672, column: 3, scope: !5199)
!5217 = !DILocation(line: 2673, column: 2, scope: !5185)
!5218 = !DILocation(line: 2674, column: 11, scope: !5219)
!5219 = distinct !DILexicalBlock(scope: !5177, file: !29, line: 2674, column: 11)
!5220 = !DILocation(line: 2674, column: 19, scope: !5219)
!5221 = !DILocation(line: 2675, column: 19, scope: !5219)
!5222 = !DILocation(line: 2675, column: 25, scope: !5219)
!5223 = !DILocation(line: 2675, column: 33, scope: !5219)
!5224 = !DILocation(line: 2675, column: 48, scope: !5219)
!5225 = !DILocation(line: 2675, column: 65, scope: !5219)
!5226 = !DILocation(line: 2675, column: 45, scope: !5219)
!5227 = !DILocation(line: 2675, column: 3, scope: !5219)
!5228 = !DILocation(line: 2675, column: 9, scope: !5219)
!5229 = !DILocation(line: 2675, column: 17, scope: !5219)
!5230 = !DILocation(line: 2678, column: 7, scope: !5231)
!5231 = distinct !DILexicalBlock(scope: !5087, file: !29, line: 2678, column: 6)
!5232 = !DILocation(line: 2678, column: 15, scope: !5231)
!5233 = !DILocation(line: 2678, column: 6, scope: !5231)
!5234 = !DILocation(line: 2678, column: 26, scope: !5231)
!5235 = !DILocation(line: 2678, column: 30, scope: !5231)
!5236 = !DILocation(line: 2678, column: 47, scope: !5231)
!5237 = !DILocation(line: 2679, column: 3, scope: !5231)
!5238 = !DILocation(line: 2679, column: 9, scope: !5231)
!5239 = !DILocation(line: 2679, column: 17, scope: !5231)
!5240 = !DILocation(line: 2680, column: 1, scope: !5087)
