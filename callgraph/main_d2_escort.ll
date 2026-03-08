; ModuleID = '/Users/richard/code/ChocolateDescent/main_d2/escort.cpp'
source_filename = "/Users/richard/code/ChocolateDescent/main_d2/escort.cpp"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

%struct.robot_info = type { i32, [8 x %struct.vms_vector], [8 x i8], i16, i16, i16, i16, i8, i8, i8, i8, i8, i8, i8, i8, i16, i8, i8, i32, i32, i32, i32, [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i8], [5 x i8], i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, [3 x i8], i8, i8, i8, i8, [9 x [5 x %struct.jointlist]], i32 }
%struct.vms_vector = type { i32, i32, i32 }
%struct.jointlist = type { i16, i16 }
%struct.object = type { i32, i8, i8, i16, i16, i8, i8, i8, i8, i16, i16, %struct.vms_vector, %struct.vms_matrix, i32, i32, %struct.vms_vector, i8, i8, i8, i8, i32, %union.anon, %union.anon.0, %union.anon.1 }
%struct.vms_matrix = type { %struct.vms_vector, %struct.vms_vector, %struct.vms_vector }
%union.anon = type { %struct.physics_info }
%struct.physics_info = type { %struct.vms_vector, %struct.vms_vector, i32, i32, i32, %struct.vms_vector, %struct.vms_vector, i16, i16 }
%union.anon.0 = type { %struct.ai_static }
%struct.ai_static = type { i8, [11 x i8], i16, i16, i16, i8, i8, i16, i32, i32 }
%union.anon.1 = type { %struct.polyobj_info }
%struct.polyobj_info = type { i32, [10 x %struct.vms_angvec], i32, i32, i32 }
%struct.vms_angvec = type { i16, i16, i16 }
%struct.segment = type { [6 x %struct.side], [6 x i16], [8 x i16], i32 }
%struct.side = type { i8, i8, i16, i16, i16, [4 x %struct.uvl], [2 x %struct.vms_vector] }
%struct.uvl = type { i32, i32, i32 }
%struct.wall = type { i32, i32, i32, i32, i8, i8, i8, i8, i8, i8, i8, i8 }
%struct.segment2 = type { i8, i8, i8, i8, i32 }
%struct.ai_local = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [10 x %struct.vms_angvec], [10 x %struct.vms_angvec], [10 x i8], [10 x i8] }
%struct.point_seg = type { i32, %struct.vms_vector }
%struct.player = type { [9 x i8], [4 x i8], i16, i8, i32, i32, i32, i32, i32, i32, i8, i8, i8, i8, i16, i16, i16, [10 x i16], [10 x i16], i16, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i16, i8, i8, i32, i8, i8 }
%"class.std::__1::vector" = type { ptr, ptr, ptr }
%struct._grs_canvas = type { %struct._grs_bitmap, i16, i16, ptr, i16, i16 }
%struct._grs_bitmap = type { i16, i16, i16, i16, i8, i8, i16, ptr, i16, i8, i8 }
%struct.newmenu_item = type { i32, i32, i32, i32, i32, i32, ptr, i16, i16, i16, i16, i16, i8, [51 x i8] }
%struct.laser_info_s = type { i16, i16, i32, i32, i16, i16, i32 }
%struct._grs_screen = type { %struct._grs_canvas, i16, i16, i16, i32 }

@.str = private unnamed_addr constant [9 x i8] c"BLUE KEY\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [11 x i8] c"YELLOW KEY\00", align 1, !dbg !8
@.str.2 = private unnamed_addr constant [8 x i8] c"RED KEY\00", align 1, !dbg !13
@.str.3 = private unnamed_addr constant [8 x i8] c"REACTOR\00", align 1, !dbg !18
@.str.4 = private unnamed_addr constant [5 x i8] c"EXIT\00", align 1, !dbg !20
@.str.5 = private unnamed_addr constant [7 x i8] c"ENERGY\00", align 1, !dbg !25
@.str.6 = private unnamed_addr constant [10 x i8] c"ENERGYCEN\00", align 1, !dbg !30
@.str.7 = private unnamed_addr constant [7 x i8] c"SHIELD\00", align 1, !dbg !35
@.str.8 = private unnamed_addr constant [8 x i8] c"POWERUP\00", align 1, !dbg !37
@.str.9 = private unnamed_addr constant [6 x i8] c"ROBOT\00", align 1, !dbg !39
@.str.10 = private unnamed_addr constant [9 x i8] c"HOSTAGES\00", align 1, !dbg !44
@.str.11 = private unnamed_addr constant [5 x i8] c"SPEW\00", align 1, !dbg !46
@.str.12 = private unnamed_addr constant [6 x i8] c"SCRAM\00", align 1, !dbg !48
@.str.13 = private unnamed_addr constant [5 x i8] c"BOSS\00", align 1, !dbg !50
@.str.14 = private unnamed_addr constant [9 x i8] c"MARKER 1\00", align 1, !dbg !52
@.str.15 = private unnamed_addr constant [9 x i8] c"MARKER 2\00", align 1, !dbg !54
@.str.16 = private unnamed_addr constant [9 x i8] c"MARKER 3\00", align 1, !dbg !56
@.str.17 = private unnamed_addr constant [9 x i8] c"MARKER 4\00", align 1, !dbg !58
@.str.18 = private unnamed_addr constant [9 x i8] c"MARKER 5\00", align 1, !dbg !60
@.str.19 = private unnamed_addr constant [9 x i8] c"MARKER 6\00", align 1, !dbg !62
@.str.20 = private unnamed_addr constant [9 x i8] c"MARKER 7\00", align 1, !dbg !64
@.str.21 = private unnamed_addr constant [9 x i8] c"MARKER 8\00", align 1, !dbg !66
@.str.22 = private unnamed_addr constant [9 x i8] c"MARKER 9\00", align 1, !dbg !68
@Escort_goal_text = global [25 x ptr] [ptr @.str, ptr @.str.1, ptr @.str.2, ptr @.str.3, ptr @.str.4, ptr @.str.5, ptr @.str.6, ptr @.str.7, ptr @.str.8, ptr @.str.9, ptr @.str.10, ptr @.str.11, ptr @.str.12, ptr @.str.4, ptr @.str.13, ptr @.str.14, ptr @.str.15, ptr @.str.16, ptr @.str.17, ptr @.str.18, ptr @.str.19, ptr @.str.20, ptr @.str.21, ptr @.str.22, ptr null], align 8, !dbg !70
@Max_escort_length = global i32 200, align 4, !dbg !75
@Escort_kill_object = global i32 -1, align 4, !dbg !78
@Stolen_items = global [10 x i8] zeroinitializer, align 1, !dbg !80
@Stolen_item_index = global i32 0, align 4, !dbg !86
@Escort_last_path_created = global i32 0, align 4, !dbg !88
@Escort_goal_object = global i32 -1, align 4, !dbg !94
@Escort_special_goal = global i32 -1, align 4, !dbg !96
@Escort_goal_index = global i32 -1, align 4, !dbg !98
@Buddy_messages_suppressed = global i32 0, align 4, !dbg !100
@Buddy_sorry_time = global i32 0, align 4, !dbg !102
@Buddy_objnum = global i32 0, align 4, !dbg !104
@Buddy_allowed_to_talk = global i32 0, align 4, !dbg !106
@Looking_for_marker = global i32 0, align 4, !dbg !108
@Last_buddy_key = global i32 0, align 4, !dbg !110
@Last_buddy_message_time = global i32 0, align 4, !dbg !112
@guidebot_name = global [10 x i8] c"GUIDE-BOT\00", align 1, !dbg !114
@real_guidebot_name = global [10 x i8] c"GUIDE-BOT\00", align 1, !dbg !117
@Highest_object_index = external global i32, align 4
@Robot_info = external global [0 x %struct.robot_info], align 4
@Objects = external global [0 x %struct.object], align 4
@Segments = external global [0 x %struct.segment], align 4
@.str.23 = private unnamed_addr constant [20 x i8] c"head < MAX_SEGMENTS\00", align 1, !dbg !119
@.str.24 = private unnamed_addr constant [56 x i8] c"/Users/richard/code/ChocolateDescent/main_d2/escort.cpp\00", align 1, !dbg !124
@Walls = external global [254 x %struct.wall], align 4
@.str.25 = private unnamed_addr constant [22 x i8] c"Enter Guide-bot name:\00", align 1, !dbg !129
@Game_mode = external global i32, align 4
@GameTime = external global i32, align 4
@.str.26 = private unnamed_addr constant [6 x i8] c"%s %s\00", align 1, !dbg !134
@.str.27 = private unnamed_addr constant [7 x i8] c"THIEF:\00", align 1, !dbg !136
@.str.28 = private unnamed_addr constant [26 x i8] c"%s has not been released.\00", align 1, !dbg !138
@.str.29 = private unnamed_addr constant [22 x i8] c"No Guide-Bot in mine.\00", align 1, !dbg !143
@.str.30 = private unnamed_addr constant [22 x i8] c"Marker %i not placed.\00", align 1, !dbg !145
@Segment2s = external global [0 x %struct.segment2], align 4
@Highest_segment_index = external global i32, align 4
@Player_is_dead = external global i32, align 4
@.str.31 = private unnamed_addr constant [17 x i8] c"Finding BLUE KEY\00", align 1, !dbg !147
@.str.32 = private unnamed_addr constant [19 x i8] c"Finding YELLOW KEY\00", align 1, !dbg !152
@.str.33 = private unnamed_addr constant [16 x i8] c"Finding RED KEY\00", align 1, !dbg !157
@.str.34 = private unnamed_addr constant [16 x i8] c"Finding REACTOR\00", align 1, !dbg !162
@.str.35 = private unnamed_addr constant [13 x i8] c"Finding EXIT\00", align 1, !dbg !164
@.str.36 = private unnamed_addr constant [15 x i8] c"Finding ENERGY\00", align 1, !dbg !169
@.str.37 = private unnamed_addr constant [22 x i8] c"Finding ENERGY CENTER\00", align 1, !dbg !174
@.str.38 = private unnamed_addr constant [17 x i8] c"Finding a SHIELD\00", align 1, !dbg !176
@.str.39 = private unnamed_addr constant [18 x i8] c"Finding a POWERUP\00", align 1, !dbg !178
@.str.40 = private unnamed_addr constant [16 x i8] c"Finding a ROBOT\00", align 1, !dbg !183
@.str.41 = private unnamed_addr constant [18 x i8] c"Finding a HOSTAGE\00", align 1, !dbg !185
@.str.42 = private unnamed_addr constant [16 x i8] c"Staying away...\00", align 1, !dbg !187
@.str.43 = private unnamed_addr constant [19 x i8] c"Finding BOSS robot\00", align 1, !dbg !189
@.str.44 = private unnamed_addr constant [22 x i8] c"Finding your powerups\00", align 1, !dbg !191
@MarkerMessage = external global [16 x [40 x i8]], align 1
@.str.45 = private unnamed_addr constant [24 x i8] c"Finding marker %i: '%s'\00", align 1, !dbg !193
@Ai_local_info = external global [350 x %struct.ai_local], align 4
@.str.46 = private unnamed_addr constant [14 x i8] c"boss_id != -1\00", align 1, !dbg !198
@.str.47 = private unnamed_addr constant [15 x i8] c"No %s in mine.\00", align 1, !dbg !203
@.str.48 = private unnamed_addr constant [16 x i8] c"Can't reach %s.\00", align 1, !dbg !205
@Point_segs = external global [2500 x %struct.point_seg], align 4
@Believed_player_pos = external global %struct.vms_vector, align 4
@Believed_player_seg = external global i32, align 4
@ConsoleObject = external global ptr, align 8
@Control_center_destroyed = external global i32, align 4
@Num_boss_teleport_segs = external global i32, align 4
@Buddy_last_seen_player = global i32 0, align 4, !dbg !207
@Buddy_last_player_path_created = global i32 0, align 4, !dbg !209
@Buddy_dude_cheat = global i32 0, align 4, !dbg !211
@Last_come_back_message_time = global i32 0, align 4, !dbg !213
@Buddy_last_missile_time = global i32 0, align 4, !dbg !215
@.str.49 = private unnamed_addr constant [31 x i8] c"Buddy firing mega in frame %i\0A\00", align 1, !dbg !217
@FrameCount = external global i32, align 4
@.str.50 = private unnamed_addr constant [9 x i8] c"GAHOOGA!\00", align 1, !dbg !222
@.str.51 = private unnamed_addr constant [40 x i8] c"Buddy firing smart missile in frame %i\0A\00", align 1, !dbg !224
@.str.52 = private unnamed_addr constant [8 x i8] c"WHAMMO!\00", align 1, !dbg !229
@__stderrp = external global ptr, align 8
@.str.53 = private unnamed_addr constant [70 x i8] c"ESCORT28_DETAIL mode=%d ego=%d elpc=%d blsp=%d blppc=%d ttv=%d gt=%d\0A\00", align 1, !dbg !231
@Players = external global [12 x %struct.player], align 4
@Player_num = external global i32, align 4
@.str.54 = private unnamed_addr constant [26 x i8] c"Hey, your headlight's on!\00", align 1, !dbg !236
@.str.55 = private unnamed_addr constant [26 x i8] c"Oops, sorry 'bout that...\00", align 1, !dbg !238
@FrameTime = external global i32, align 4
@.str.56 = private unnamed_addr constant [42 x i8] c"Frame %i: Buddy creating new scram path.\0A\00", align 1, !dbg !240
@.str.57 = private unnamed_addr constant [39 x i8] c"ESCORT28_TIMER_RESET ego_was=%d gt=%d\0A\00", align 1, !dbg !245
@.str.58 = private unnamed_addr constant [36 x i8] c"ESCORT28_BRANCH=visit_player gt=%d\0A\00", align 1, !dbg !250
@.str.59 = private unnamed_addr constant [24 x i8] c"Coming back to get you.\00", align 1, !dbg !255
@.str.60 = private unnamed_addr constant [33 x i8] c"ESCORT28_BRANCH=time_away gt=%d\0A\00", align 1, !dbg !257
@.str.61 = private unnamed_addr constant [35 x i8] c"ESCORT28_BRANCH=goto_object gt=%d\0A\00", align 1, !dbg !262
@.str.62 = private unnamed_addr constant [35 x i8] c"ESCORT28_BRANCH=unspecified gt=%d\0A\00", align 1, !dbg !267
@.str.63 = private unnamed_addr constant [41 x i8] c"INVALIDATE_ESCORT_GOAL ego_was=%d gt=%d\0A\00", align 1, !dbg !269
@.str.64 = private unnamed_addr constant [67 x i8] c"Warning: Unable to find a connected segment for thief recreation.\0A\00", align 1, !dbg !274
@Re_init_thief_time = global i32 1056964608, align 4, !dbg !279
@Thief_wait_times = global [5 x i32] [i32 1966080, i32 1638400, i32 1310720, i32 983040, i32 655360], align 4, !dbg !281
@Current_level_num = external global i32, align 4
@Difficulty_level = external global i32, align 4
@.str.65 = private unnamed_addr constant [26 x i8] c"Thief mode (broken) = %d\0A\00", align 1, !dbg !284
@.str.66 = private unnamed_addr constant [24 x i8] c"Invulnerability stolen!\00", align 1, !dbg !286
@.str.67 = private unnamed_addr constant [14 x i8] c"Cloak stolen!\00", align 1, !dbg !288
@.str.68 = private unnamed_addr constant [17 x i8] c"Full map stolen!\00", align 1, !dbg !290
@.str.69 = private unnamed_addr constant [20 x i8] c"Quad lasers stolen!\00", align 1, !dbg !292
@.str.70 = private unnamed_addr constant [20 x i8] c"Afterburner stolen!\00", align 1, !dbg !294
@.str.71 = private unnamed_addr constant [18 x i8] c"Converter stolen!\00", align 1, !dbg !296
@.str.72 = private unnamed_addr constant [18 x i8] c"Headlight stolen!\00", align 1, !dbg !298
@.str.73 = private unnamed_addr constant [20 x i8] c"powerup_index != -1\00", align 1, !dbg !300
@Secondary_weapon_to_powerup = external global [10 x i8], align 1
@.str.74 = private unnamed_addr constant [11 x i8] c"%s stolen!\00", align 1, !dbg !302
@Text_string = external global %"class.std::__1::vector", align 8
@Primary_weapon_to_powerup = external global [10 x i8], align 1
@.str.75 = private unnamed_addr constant [20 x i8] c"%s level decreased!\00", align 1, !dbg !304
@Primary_weapon = external global i8, align 1
@Secondary_weapon = external global i8, align 1
@.str.76 = private unnamed_addr constant [24 x i8] c"MAX_STOLEN_ITEMS >= 3*2\00", align 1, !dbg !306
@.str.77 = private unnamed_addr constant [23 x i8] c"Dropping thief items!\0A\00", align 1, !dbg !308
@.str.78 = private unnamed_addr constant [29 x i8] c"No Guide-Bot in Multiplayer!\00", align 1, !dbg !313
@.str.79 = private unnamed_addr constant [30 x i8] c"No Guide-Bot present in mine!\00", align 1, !dbg !318
@.str.80 = private unnamed_addr constant [35 x i8] c"Debug Version: Creating Guide-Bot!\00", align 1, !dbg !323
@.str.81 = private unnamed_addr constant [25 x i8] c"%s has not been released\00", align 1, !dbg !325
@gr_palette = external global [768 x i8], align 1
@.str.82 = private unnamed_addr constant [6 x i8] c"ERROR\00", align 1, !dbg !330
@.str.83 = private unnamed_addr constant [9 x i8] c"blue key\00", align 1, !dbg !332
@.str.84 = private unnamed_addr constant [11 x i8] c"yellow key\00", align 1, !dbg !334
@.str.85 = private unnamed_addr constant [8 x i8] c"red key\00", align 1, !dbg !336
@.str.86 = private unnamed_addr constant [8 x i8] c"reactor\00", align 1, !dbg !338
@.str.87 = private unnamed_addr constant [5 x i8] c"boss\00", align 1, !dbg !340
@.str.88 = private unnamed_addr constant [5 x i8] c"exit\00", align 1, !dbg !342
@.str.89 = private unnamed_addr constant [10 x i8] c"marker %i\00", align 1, !dbg !344
@.str.90 = private unnamed_addr constant [9 x i8] c"Suppress\00", align 1, !dbg !346
@.str.91 = private unnamed_addr constant [7 x i8] c"Enable\00", align 1, !dbg !348
@.str.92 = private unnamed_addr constant [270 x i8] c"Select Guide-Bot Command:\0A\0A0.  Next Goal: %s\023\0A\84.  Find Energy Powerup\023\0A2.  Find Energy Center\023\0A3.  Find Shield Powerup\023\0A4.  Find Any Powerup\023\0A5.  Find a Robot\023\0A6.  Find a Hostage\023\0A7.  Stay Away From Me\023\0A8.  Find My Powerups\023\0A9.  Find the exit\0A\0AT.  %s Messages\0A\00", align 1, !dbg !350
@.str.93 = private unnamed_addr constant [11 x i8] c"suppressed\00", align 1, !dbg !355
@.str.94 = private unnamed_addr constant [8 x i8] c"enabled\00", align 1, !dbg !357
@.str.95 = private unnamed_addr constant [13 x i8] c"Messages %s.\00", align 1, !dbg !359
@VR_screen_pages = external global %struct._grs_canvas, align 8
@Gamefonts = external global [10 x ptr], align 8
@FontHires = external global i32, align 4
@grd_curscreen = external global ptr, align 8

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define void @_Z20init_buddy_for_levelv() #0 !dbg !1668 {
  %1 = alloca i32, align 4
    #dbg_declare(ptr %1, !1670, !DIExpression(), !1671)
  store i32 0, ptr @Buddy_allowed_to_talk, align 4, !dbg !1672
  store i32 -1, ptr @Buddy_objnum, align 4, !dbg !1673
  store i32 -1, ptr @Escort_goal_object, align 4, !dbg !1674
  store i32 -1, ptr @Escort_special_goal, align 4, !dbg !1675
  store i32 -1, ptr @Escort_goal_index, align 4, !dbg !1676
  store i32 0, ptr @Buddy_messages_suppressed, align 4, !dbg !1677
  store i32 0, ptr %1, align 4, !dbg !1678
  br label %2, !dbg !1680

2:                                                ; preds = %19, %0
  %3 = load i32, ptr %1, align 4, !dbg !1681
  %4 = load i32, ptr @Highest_object_index, align 4, !dbg !1683
  %5 = icmp sle i32 %3, %4, !dbg !1684
  br i1 %5, label %6, label %22, !dbg !1685

6:                                                ; preds = %2
  %7 = load i32, ptr %1, align 4, !dbg !1686
  %8 = sext i32 %7 to i64, !dbg !1688
  %9 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %8, !dbg !1688
  %10 = getelementptr inbounds nuw %struct.object, ptr %9, i32 0, i32 2, !dbg !1689
  %11 = load i8, ptr %10, align 1, !dbg !1689
  %12 = zext i8 %11 to i64, !dbg !1690
  %13 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %12, !dbg !1690
  %14 = getelementptr inbounds nuw %struct.robot_info, ptr %13, i32 0, i32 37, !dbg !1691
  %15 = load i8, ptr %14, align 1, !dbg !1691
  %16 = icmp ne i8 %15, 0, !dbg !1690
  br i1 %16, label %17, label %18, !dbg !1690

17:                                               ; preds = %6
  br label %23, !dbg !1692

18:                                               ; preds = %6
  br label %19, !dbg !1691

19:                                               ; preds = %18
  %20 = load i32, ptr %1, align 4, !dbg !1693
  %21 = add nsw i32 %20, 1, !dbg !1693
  store i32 %21, ptr %1, align 4, !dbg !1693
  br label %2, !dbg !1694, !llvm.loop !1695

22:                                               ; preds = %2
  br label %23, !dbg !1698

23:                                               ; preds = %22, %17
  %24 = load i32, ptr %1, align 4, !dbg !1698
  %25 = load i32, ptr @Highest_object_index, align 4, !dbg !1700
  %26 = icmp sle i32 %24, %25, !dbg !1701
  br i1 %26, label %27, label %29, !dbg !1701

27:                                               ; preds = %23
  %28 = load i32, ptr %1, align 4, !dbg !1702
  store i32 %28, ptr @Buddy_objnum, align 4, !dbg !1703
  br label %29, !dbg !1704

29:                                               ; preds = %27, %23
  store i32 -65536, ptr @Buddy_sorry_time, align 4, !dbg !1705
  store i32 -1, ptr @Looking_for_marker, align 4, !dbg !1706
  store i32 -1, ptr @Last_buddy_key, align 4, !dbg !1707
  ret void, !dbg !1708
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z20segment_is_reachableii(i32 noundef %0, i32 noundef %1) #1 !dbg !1709 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  store i32 %0, ptr %4, align 4
    #dbg_declare(ptr %4, !1712, !DIExpression(), !1713)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !1714, !DIExpression(), !1715)
    #dbg_declare(ptr %6, !1716, !DIExpression(), !1717)
    #dbg_declare(ptr %7, !1718, !DIExpression(), !1719)
    #dbg_declare(ptr %8, !1720, !DIExpression(), !1762)
  %9 = load i32, ptr %4, align 4, !dbg !1763
  %10 = sext i32 %9 to i64, !dbg !1764
  %11 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %10, !dbg !1764
  store ptr %11, ptr %8, align 8, !dbg !1762
  %12 = load ptr, ptr %8, align 8, !dbg !1765
  %13 = getelementptr inbounds nuw %struct.segment, ptr %12, i32 0, i32 1, !dbg !1765
  %14 = load i32, ptr %5, align 4, !dbg !1765
  %15 = sext i32 %14 to i64, !dbg !1765
  %16 = getelementptr inbounds [6 x i16], ptr %13, i64 0, i64 %15, !dbg !1765
  %17 = load i16, ptr %16, align 2, !dbg !1765
  %18 = sext i16 %17 to i32, !dbg !1765
  %19 = icmp sgt i32 %18, -1, !dbg !1765
  br i1 %19, label %21, label %20, !dbg !1767

20:                                               ; preds = %2
  store i32 0, ptr %3, align 4, !dbg !1768
  br label %38, !dbg !1768

21:                                               ; preds = %2
  %22 = load ptr, ptr %8, align 8, !dbg !1769
  %23 = getelementptr inbounds nuw %struct.segment, ptr %22, i32 0, i32 0, !dbg !1770
  %24 = load i32, ptr %5, align 4, !dbg !1771
  %25 = sext i32 %24 to i64, !dbg !1769
  %26 = getelementptr inbounds [6 x %struct.side], ptr %23, i64 0, i64 %25, !dbg !1769
  %27 = getelementptr inbounds nuw %struct.side, ptr %26, i32 0, i32 2, !dbg !1772
  %28 = load i16, ptr %27, align 2, !dbg !1772
  %29 = sext i16 %28 to i32, !dbg !1769
  store i32 %29, ptr %6, align 4, !dbg !1773
  %30 = load i32, ptr %6, align 4, !dbg !1774
  %31 = icmp eq i32 %30, -1, !dbg !1776
  br i1 %31, label %32, label %33, !dbg !1776

32:                                               ; preds = %21
  store i32 1, ptr %3, align 4, !dbg !1777
  br label %38, !dbg !1777

33:                                               ; preds = %21
  %34 = load ptr, ptr %8, align 8, !dbg !1778
  %35 = load i32, ptr %5, align 4, !dbg !1779
  %36 = call noundef i32 @_Z19ai_door_is_openableP6objectP7segmenti(ptr noundef null, ptr noundef %34, i32 noundef %35), !dbg !1780
  store i32 %36, ptr %7, align 4, !dbg !1781
  %37 = load i32, ptr %7, align 4, !dbg !1782
  store i32 %37, ptr %3, align 4, !dbg !1783
  br label %38, !dbg !1783

38:                                               ; preds = %33, %32, %20
  %39 = load i32, ptr %3, align 4, !dbg !1784
  ret i32 %39, !dbg !1784
}

declare noundef i32 @_Z19ai_door_is_openableP6objectP7segmenti(ptr noundef, ptr noundef, i32 noundef) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z15create_bfs_listiPsPii(i32 noundef %0, ptr noundef %1, ptr noundef %2, i32 noundef %3) #1 !dbg !1785 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca [900 x i8], align 1
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca ptr, align 8
  %16 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
    #dbg_declare(ptr %5, !1789, !DIExpression(), !1790)
  store ptr %1, ptr %6, align 8
    #dbg_declare(ptr %6, !1791, !DIExpression(), !1792)
  store ptr %2, ptr %7, align 8
    #dbg_declare(ptr %7, !1793, !DIExpression(), !1794)
  store i32 %3, ptr %8, align 4
    #dbg_declare(ptr %8, !1795, !DIExpression(), !1796)
    #dbg_declare(ptr %9, !1797, !DIExpression(), !1798)
    #dbg_declare(ptr %10, !1799, !DIExpression(), !1800)
    #dbg_declare(ptr %11, !1801, !DIExpression(), !1802)
    #dbg_declare(ptr %12, !1803, !DIExpression(), !1807)
  store i32 0, ptr %9, align 4, !dbg !1808
  br label %17, !dbg !1810

17:                                               ; preds = %24, %4
  %18 = load i32, ptr %9, align 4, !dbg !1811
  %19 = icmp slt i32 %18, 900, !dbg !1813
  br i1 %19, label %20, label %27, !dbg !1814

20:                                               ; preds = %17
  %21 = load i32, ptr %9, align 4, !dbg !1815
  %22 = sext i32 %21 to i64, !dbg !1816
  %23 = getelementptr inbounds [900 x i8], ptr %12, i64 0, i64 %22, !dbg !1816
  store i8 0, ptr %23, align 1, !dbg !1817
  br label %24, !dbg !1816

24:                                               ; preds = %20
  %25 = load i32, ptr %9, align 4, !dbg !1818
  %26 = add nsw i32 %25, 1, !dbg !1818
  store i32 %26, ptr %9, align 4, !dbg !1818
  br label %17, !dbg !1819, !llvm.loop !1820

27:                                               ; preds = %17
  store i32 0, ptr %10, align 4, !dbg !1822
  store i32 0, ptr %11, align 4, !dbg !1823
  %28 = load i32, ptr %5, align 4, !dbg !1824
  %29 = trunc i32 %28 to i16, !dbg !1824
  %30 = load ptr, ptr %6, align 8, !dbg !1825
  %31 = load i32, ptr %10, align 4, !dbg !1826
  %32 = add nsw i32 %31, 1, !dbg !1826
  store i32 %32, ptr %10, align 4, !dbg !1826
  %33 = sext i32 %31 to i64, !dbg !1825
  %34 = getelementptr inbounds i16, ptr %30, i64 %33, !dbg !1825
  store i16 %29, ptr %34, align 2, !dbg !1827
  %35 = load i32, ptr %5, align 4, !dbg !1828
  %36 = sext i32 %35 to i64, !dbg !1829
  %37 = getelementptr inbounds [900 x i8], ptr %12, i64 0, i64 %36, !dbg !1829
  store i8 1, ptr %37, align 1, !dbg !1830
  br label %38, !dbg !1831

38:                                               ; preds = %109, %27
  %39 = load i32, ptr %10, align 4, !dbg !1832
  %40 = load i32, ptr %11, align 4, !dbg !1833
  %41 = icmp ne i32 %39, %40, !dbg !1834
  br i1 %41, label %42, label %46, !dbg !1835

42:                                               ; preds = %38
  %43 = load i32, ptr %10, align 4, !dbg !1836
  %44 = load i32, ptr %8, align 4, !dbg !1837
  %45 = icmp slt i32 %43, %44, !dbg !1838
  br label %46

46:                                               ; preds = %42, %38
  %47 = phi i1 [ false, %38 ], [ %45, %42 ], !dbg !1839
  br i1 %47, label %48, label %110, !dbg !1831

48:                                               ; preds = %46
    #dbg_declare(ptr %13, !1840, !DIExpression(), !1842)
    #dbg_declare(ptr %14, !1843, !DIExpression(), !1844)
    #dbg_declare(ptr %15, !1845, !DIExpression(), !1846)
  %49 = load ptr, ptr %6, align 8, !dbg !1847
  %50 = load i32, ptr %11, align 4, !dbg !1848
  %51 = add nsw i32 %50, 1, !dbg !1848
  store i32 %51, ptr %11, align 4, !dbg !1848
  %52 = sext i32 %50 to i64, !dbg !1847
  %53 = getelementptr inbounds i16, ptr %49, i64 %52, !dbg !1847
  %54 = load i16, ptr %53, align 2, !dbg !1847
  %55 = sext i16 %54 to i32, !dbg !1847
  store i32 %55, ptr %14, align 4, !dbg !1849
  %56 = load i32, ptr %14, align 4, !dbg !1850
  %57 = sext i32 %56 to i64, !dbg !1851
  %58 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %57, !dbg !1851
  store ptr %58, ptr %15, align 8, !dbg !1852
  store i32 0, ptr %13, align 4, !dbg !1853
  br label %59, !dbg !1855

59:                                               ; preds = %105, %48
  %60 = load i32, ptr %13, align 4, !dbg !1856
  %61 = icmp slt i32 %60, 6, !dbg !1858
  br i1 %61, label %62, label %108, !dbg !1859

62:                                               ; preds = %59
    #dbg_declare(ptr %16, !1860, !DIExpression(), !1862)
  %63 = load ptr, ptr %15, align 8, !dbg !1863
  %64 = getelementptr inbounds nuw %struct.segment, ptr %63, i32 0, i32 1, !dbg !1864
  %65 = load i32, ptr %13, align 4, !dbg !1865
  %66 = sext i32 %65 to i64, !dbg !1863
  %67 = getelementptr inbounds [6 x i16], ptr %64, i64 0, i64 %66, !dbg !1863
  %68 = load i16, ptr %67, align 2, !dbg !1863
  %69 = sext i16 %68 to i32, !dbg !1863
  store i32 %69, ptr %16, align 4, !dbg !1866
  %70 = load i32, ptr %16, align 4, !dbg !1867
  %71 = icmp sgt i32 %70, -1, !dbg !1867
  br i1 %71, label %72, label %104, !dbg !1869

72:                                               ; preds = %62
  %73 = load i32, ptr %16, align 4, !dbg !1870
  %74 = sext i32 %73 to i64, !dbg !1871
  %75 = getelementptr inbounds [900 x i8], ptr %12, i64 0, i64 %74, !dbg !1871
  %76 = load i8, ptr %75, align 1, !dbg !1871
  %77 = sext i8 %76 to i32, !dbg !1871
  %78 = icmp eq i32 %77, 0, !dbg !1872
  br i1 %78, label %79, label %104, !dbg !1869

79:                                               ; preds = %72
  %80 = load i32, ptr %14, align 4, !dbg !1873
  %81 = load i32, ptr %13, align 4, !dbg !1876
  %82 = call noundef i32 @_Z20segment_is_reachableii(i32 noundef %80, i32 noundef %81), !dbg !1877
  %83 = icmp ne i32 %82, 0, !dbg !1877
  br i1 %83, label %84, label %103, !dbg !1877

84:                                               ; preds = %79
  %85 = load i32, ptr %16, align 4, !dbg !1878
  %86 = trunc i32 %85 to i16, !dbg !1878
  %87 = load ptr, ptr %6, align 8, !dbg !1880
  %88 = load i32, ptr %10, align 4, !dbg !1881
  %89 = add nsw i32 %88, 1, !dbg !1881
  store i32 %89, ptr %10, align 4, !dbg !1881
  %90 = sext i32 %88 to i64, !dbg !1880
  %91 = getelementptr inbounds i16, ptr %87, i64 %90, !dbg !1880
  store i16 %86, ptr %91, align 2, !dbg !1882
  %92 = load i32, ptr %10, align 4, !dbg !1883
  %93 = load i32, ptr %8, align 4, !dbg !1885
  %94 = icmp sge i32 %92, %93, !dbg !1886
  br i1 %94, label %95, label %96, !dbg !1886

95:                                               ; preds = %84
  br label %109, !dbg !1887

96:                                               ; preds = %84
  %97 = load i32, ptr %16, align 4, !dbg !1888
  %98 = sext i32 %97 to i64, !dbg !1889
  %99 = getelementptr inbounds [900 x i8], ptr %12, i64 0, i64 %98, !dbg !1889
  store i8 1, ptr %99, align 1, !dbg !1890
  %100 = load i32, ptr %10, align 4, !dbg !1891
  %101 = icmp slt i32 %100, 900, !dbg !1891
  %102 = zext i1 %101 to i32, !dbg !1891
  call void @_Z7_AssertiPKcS0_i(i32 noundef %102, ptr noundef @.str.23, ptr noundef @.str.24, i32 noundef 240), !dbg !1891
  br label %103, !dbg !1892

103:                                              ; preds = %96, %79
  br label %104, !dbg !1893

104:                                              ; preds = %103, %72, %62
  br label %105, !dbg !1894

105:                                              ; preds = %104
  %106 = load i32, ptr %13, align 4, !dbg !1895
  %107 = add nsw i32 %106, 1, !dbg !1895
  store i32 %107, ptr %13, align 4, !dbg !1895
  br label %59, !dbg !1896, !llvm.loop !1897

108:                                              ; preds = %59
  br label %109, !dbg !1831

109:                                              ; preds = %108, %95
  br label %38, !dbg !1831, !llvm.loop !1899

110:                                              ; preds = %46
  %111 = load i32, ptr %10, align 4, !dbg !1901
  %112 = load ptr, ptr %7, align 8, !dbg !1902
  store i32 %111, ptr %112, align 4, !dbg !1903
  ret void, !dbg !1904
}

declare void @_Z7_AssertiPKcS0_i(i32 noundef, ptr noundef, ptr noundef, i32 noundef) #2

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define noundef i32 @_Z20ok_for_buddy_to_talkv() #0 !dbg !1905 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
    #dbg_declare(ptr %2, !1906, !DIExpression(), !1907)
    #dbg_declare(ptr %3, !1908, !DIExpression(), !1909)
  %8 = load i32, ptr @Buddy_objnum, align 4, !dbg !1910
  %9 = sext i32 %8 to i64, !dbg !1912
  %10 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %9, !dbg !1912
  %11 = getelementptr inbounds nuw %struct.object, ptr %10, i32 0, i32 1, !dbg !1913
  %12 = load i8, ptr %11, align 4, !dbg !1913
  %13 = zext i8 %12 to i32, !dbg !1912
  %14 = icmp ne i32 %13, 2, !dbg !1914
  br i1 %14, label %15, label %16, !dbg !1914

15:                                               ; preds = %0
  store i32 0, ptr @Buddy_allowed_to_talk, align 4, !dbg !1915
  store i32 0, ptr %1, align 4, !dbg !1917
  br label %175, !dbg !1917

16:                                               ; preds = %0
  %17 = load i32, ptr @Buddy_allowed_to_talk, align 4, !dbg !1918
  %18 = icmp ne i32 %17, 0, !dbg !1918
  br i1 %18, label %19, label %20, !dbg !1918

19:                                               ; preds = %16
  store i32 1, ptr %1, align 4, !dbg !1920
  br label %175, !dbg !1920

20:                                               ; preds = %16
  %21 = load i32, ptr @Buddy_objnum, align 4, !dbg !1921
  %22 = sext i32 %21 to i64, !dbg !1923
  %23 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %22, !dbg !1923
  %24 = getelementptr inbounds nuw %struct.object, ptr %23, i32 0, i32 1, !dbg !1924
  %25 = load i8, ptr %24, align 4, !dbg !1924
  %26 = zext i8 %25 to i32, !dbg !1923
  %27 = icmp eq i32 %26, 2, !dbg !1925
  br i1 %27, label %28, label %73, !dbg !1926

28:                                               ; preds = %20
  %29 = load i32, ptr @Buddy_objnum, align 4, !dbg !1927
  %30 = load i32, ptr @Highest_object_index, align 4, !dbg !1928
  %31 = icmp sle i32 %29, %30, !dbg !1929
  br i1 %31, label %32, label %73, !dbg !1930

32:                                               ; preds = %28
  %33 = load i32, ptr @Buddy_objnum, align 4, !dbg !1931
  %34 = sext i32 %33 to i64, !dbg !1932
  %35 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %34, !dbg !1932
  %36 = getelementptr inbounds nuw %struct.object, ptr %35, i32 0, i32 2, !dbg !1933
  %37 = load i8, ptr %36, align 1, !dbg !1933
  %38 = zext i8 %37 to i64, !dbg !1934
  %39 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %38, !dbg !1934
  %40 = getelementptr inbounds nuw %struct.robot_info, ptr %39, i32 0, i32 37, !dbg !1935
  %41 = load i8, ptr %40, align 1, !dbg !1935
  %42 = icmp ne i8 %41, 0, !dbg !1934
  br i1 %42, label %73, label %43, !dbg !1930

43:                                               ; preds = %32
  store i32 0, ptr %2, align 4, !dbg !1936
  br label %44, !dbg !1939

44:                                               ; preds = %61, %43
  %45 = load i32, ptr %2, align 4, !dbg !1940
  %46 = load i32, ptr @Highest_object_index, align 4, !dbg !1942
  %47 = icmp sle i32 %45, %46, !dbg !1943
  br i1 %47, label %48, label %64, !dbg !1944

48:                                               ; preds = %44
  %49 = load i32, ptr %2, align 4, !dbg !1945
  %50 = sext i32 %49 to i64, !dbg !1947
  %51 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %50, !dbg !1947
  %52 = getelementptr inbounds nuw %struct.object, ptr %51, i32 0, i32 2, !dbg !1948
  %53 = load i8, ptr %52, align 1, !dbg !1948
  %54 = zext i8 %53 to i64, !dbg !1949
  %55 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %54, !dbg !1949
  %56 = getelementptr inbounds nuw %struct.robot_info, ptr %55, i32 0, i32 37, !dbg !1950
  %57 = load i8, ptr %56, align 1, !dbg !1950
  %58 = icmp ne i8 %57, 0, !dbg !1949
  br i1 %58, label %59, label %60, !dbg !1949

59:                                               ; preds = %48
  br label %65, !dbg !1951

60:                                               ; preds = %48
  br label %61, !dbg !1950

61:                                               ; preds = %60
  %62 = load i32, ptr %2, align 4, !dbg !1952
  %63 = add nsw i32 %62, 1, !dbg !1952
  store i32 %63, ptr %2, align 4, !dbg !1952
  br label %44, !dbg !1953, !llvm.loop !1954

64:                                               ; preds = %44
  br label %65, !dbg !1956

65:                                               ; preds = %64, %59
  %66 = load i32, ptr %2, align 4, !dbg !1956
  %67 = load i32, ptr @Highest_object_index, align 4, !dbg !1958
  %68 = icmp sgt i32 %66, %67, !dbg !1959
  br i1 %68, label %69, label %70, !dbg !1959

69:                                               ; preds = %65
  store i32 0, ptr %1, align 4, !dbg !1960
  br label %175, !dbg !1960

70:                                               ; preds = %65
  %71 = load i32, ptr %2, align 4, !dbg !1961
  store i32 %71, ptr @Buddy_objnum, align 4, !dbg !1962
  br label %72

72:                                               ; preds = %70
  br label %73, !dbg !1963

73:                                               ; preds = %72, %32, %28, %20
  %74 = load i32, ptr @Buddy_objnum, align 4, !dbg !1964
  %75 = sext i32 %74 to i64, !dbg !1965
  %76 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %75, !dbg !1965
  %77 = getelementptr inbounds nuw %struct.object, ptr %76, i32 0, i32 9, !dbg !1966
  %78 = load i16, ptr %77, align 2, !dbg !1966
  %79 = sext i16 %78 to i64, !dbg !1967
  %80 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %79, !dbg !1967
  store ptr %80, ptr %3, align 8, !dbg !1968
  store i32 0, ptr %2, align 4, !dbg !1969
  br label %81, !dbg !1971

81:                                               ; preds = %171, %73
  %82 = load i32, ptr %2, align 4, !dbg !1972
  %83 = icmp slt i32 %82, 6, !dbg !1974
  br i1 %83, label %84, label %174, !dbg !1975

84:                                               ; preds = %81
    #dbg_declare(ptr %4, !1976, !DIExpression(), !1978)
  %85 = load ptr, ptr %3, align 8, !dbg !1979
  %86 = getelementptr inbounds nuw %struct.segment, ptr %85, i32 0, i32 0, !dbg !1980
  %87 = load i32, ptr %2, align 4, !dbg !1981
  %88 = sext i32 %87 to i64, !dbg !1979
  %89 = getelementptr inbounds [6 x %struct.side], ptr %86, i64 0, i64 %88, !dbg !1979
  %90 = getelementptr inbounds nuw %struct.side, ptr %89, i32 0, i32 2, !dbg !1982
  %91 = load i16, ptr %90, align 2, !dbg !1982
  %92 = sext i16 %91 to i32, !dbg !1979
  store i32 %92, ptr %4, align 4, !dbg !1978
  %93 = load i32, ptr %4, align 4, !dbg !1983
  %94 = icmp ne i32 %93, -1, !dbg !1985
  br i1 %94, label %95, label %114, !dbg !1985

95:                                               ; preds = %84
  %96 = load i32, ptr %4, align 4, !dbg !1986
  %97 = sext i32 %96 to i64, !dbg !1989
  %98 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %97, !dbg !1989
  %99 = getelementptr inbounds nuw %struct.wall, ptr %98, i32 0, i32 4, !dbg !1990
  %100 = load i8, ptr %99, align 4, !dbg !1990
  %101 = zext i8 %100 to i32, !dbg !1989
  %102 = icmp eq i32 %101, 1, !dbg !1991
  br i1 %102, label %103, label %113, !dbg !1992

103:                                              ; preds = %95
  %104 = load i32, ptr %4, align 4, !dbg !1993
  %105 = sext i32 %104 to i64, !dbg !1994
  %106 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %105, !dbg !1994
  %107 = getelementptr inbounds nuw %struct.wall, ptr %106, i32 0, i32 5, !dbg !1995
  %108 = load i8, ptr %107, align 1, !dbg !1995
  %109 = zext i8 %108 to i32, !dbg !1994
  %110 = and i32 %109, 1, !dbg !1996
  %111 = icmp ne i32 %110, 0, !dbg !1997
  br i1 %111, label %113, label %112, !dbg !1992

112:                                              ; preds = %103
  store i32 0, ptr %1, align 4, !dbg !1998
  br label %175, !dbg !1998

113:                                              ; preds = %103, %95
  br label %114, !dbg !1999

114:                                              ; preds = %113, %84
  %115 = load ptr, ptr %3, align 8, !dbg !2000
  %116 = getelementptr inbounds nuw %struct.segment, ptr %115, i32 0, i32 1, !dbg !2000
  %117 = load i32, ptr %2, align 4, !dbg !2000
  %118 = sext i32 %117 to i64, !dbg !2000
  %119 = getelementptr inbounds [6 x i16], ptr %116, i64 0, i64 %118, !dbg !2000
  %120 = load i16, ptr %119, align 2, !dbg !2000
  %121 = sext i16 %120 to i32, !dbg !2000
  %122 = icmp sgt i32 %121, -1, !dbg !2000
  br i1 %122, label %123, label %170, !dbg !2000

123:                                              ; preds = %114
    #dbg_declare(ptr %5, !2002, !DIExpression(), !2004)
    #dbg_declare(ptr %6, !2005, !DIExpression(), !2006)
  %124 = load ptr, ptr %3, align 8, !dbg !2007
  %125 = getelementptr inbounds nuw %struct.segment, ptr %124, i32 0, i32 1, !dbg !2008
  %126 = load i32, ptr %2, align 4, !dbg !2009
  %127 = sext i32 %126 to i64, !dbg !2007
  %128 = getelementptr inbounds [6 x i16], ptr %125, i64 0, i64 %127, !dbg !2007
  %129 = load i16, ptr %128, align 2, !dbg !2007
  %130 = sext i16 %129 to i64, !dbg !2010
  %131 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %130, !dbg !2010
  store ptr %131, ptr %6, align 8, !dbg !2006
  store i32 0, ptr %5, align 4, !dbg !2011
  br label %132, !dbg !2013

132:                                              ; preds = %166, %123
  %133 = load i32, ptr %5, align 4, !dbg !2014
  %134 = icmp slt i32 %133, 6, !dbg !2016
  br i1 %134, label %135, label %169, !dbg !2017

135:                                              ; preds = %132
    #dbg_declare(ptr %7, !2018, !DIExpression(), !2020)
  %136 = load ptr, ptr %6, align 8, !dbg !2021
  %137 = getelementptr inbounds nuw %struct.segment, ptr %136, i32 0, i32 0, !dbg !2022
  %138 = load i32, ptr %5, align 4, !dbg !2023
  %139 = sext i32 %138 to i64, !dbg !2021
  %140 = getelementptr inbounds [6 x %struct.side], ptr %137, i64 0, i64 %139, !dbg !2021
  %141 = getelementptr inbounds nuw %struct.side, ptr %140, i32 0, i32 2, !dbg !2024
  %142 = load i16, ptr %141, align 2, !dbg !2024
  %143 = sext i16 %142 to i32, !dbg !2021
  store i32 %143, ptr %7, align 4, !dbg !2020
  %144 = load i32, ptr %7, align 4, !dbg !2025
  %145 = icmp ne i32 %144, -1, !dbg !2027
  br i1 %145, label %146, label %165, !dbg !2027

146:                                              ; preds = %135
  %147 = load i32, ptr %7, align 4, !dbg !2028
  %148 = sext i32 %147 to i64, !dbg !2031
  %149 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %148, !dbg !2031
  %150 = getelementptr inbounds nuw %struct.wall, ptr %149, i32 0, i32 4, !dbg !2032
  %151 = load i8, ptr %150, align 4, !dbg !2032
  %152 = zext i8 %151 to i32, !dbg !2031
  %153 = icmp eq i32 %152, 1, !dbg !2033
  br i1 %153, label %154, label %164, !dbg !2034

154:                                              ; preds = %146
  %155 = load i32, ptr %7, align 4, !dbg !2035
  %156 = sext i32 %155 to i64, !dbg !2036
  %157 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %156, !dbg !2036
  %158 = getelementptr inbounds nuw %struct.wall, ptr %157, i32 0, i32 5, !dbg !2037
  %159 = load i8, ptr %158, align 1, !dbg !2037
  %160 = zext i8 %159 to i32, !dbg !2036
  %161 = and i32 %160, 1, !dbg !2038
  %162 = icmp ne i32 %161, 0, !dbg !2039
  br i1 %162, label %164, label %163, !dbg !2034

163:                                              ; preds = %154
  store i32 0, ptr %1, align 4, !dbg !2040
  br label %175, !dbg !2040

164:                                              ; preds = %154, %146
  br label %165, !dbg !2041

165:                                              ; preds = %164, %135
  br label %166, !dbg !2042

166:                                              ; preds = %165
  %167 = load i32, ptr %5, align 4, !dbg !2043
  %168 = add nsw i32 %167, 1, !dbg !2043
  store i32 %168, ptr %5, align 4, !dbg !2043
  br label %132, !dbg !2044, !llvm.loop !2045

169:                                              ; preds = %132
  br label %170, !dbg !2047

170:                                              ; preds = %169, %114
  br label %171, !dbg !2048

171:                                              ; preds = %170
  %172 = load i32, ptr %2, align 4, !dbg !2049
  %173 = add nsw i32 %172, 1, !dbg !2049
  store i32 %173, ptr %2, align 4, !dbg !2049
  br label %81, !dbg !2050, !llvm.loop !2051

174:                                              ; preds = %81
  store i32 1, ptr @Buddy_allowed_to_talk, align 4, !dbg !2053
  store i32 1, ptr %1, align 4, !dbg !2054
  br label %175, !dbg !2054

175:                                              ; preds = %174, %163, %112, %69, %19, %15
  %176 = load i32, ptr %1, align 4, !dbg !2055
  ret i32 %176, !dbg !2055
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z31detect_escort_goal_accomplishedi(i32 noundef %0) #1 !dbg !2056 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !2057, !DIExpression(), !2058)
    #dbg_declare(ptr %3, !2059, !DIExpression(), !2060)
    #dbg_declare(ptr %4, !2061, !DIExpression(), !2062)
    #dbg_declare(ptr %5, !2063, !DIExpression(), !2064)
  store i32 0, ptr %5, align 4, !dbg !2064
  %6 = load i32, ptr @Buddy_allowed_to_talk, align 4, !dbg !2065
  %7 = icmp ne i32 %6, 0, !dbg !2065
  br i1 %7, label %9, label %8, !dbg !2067

8:                                                ; preds = %1
  br label %185, !dbg !2068

9:                                                ; preds = %1
  %10 = load i32, ptr @Escort_special_goal, align 4, !dbg !2069
  %11 = icmp eq i32 %10, 13, !dbg !2071
  br i1 %11, label %12, label %13, !dbg !2071

12:                                               ; preds = %9
  br label %185, !dbg !2072

13:                                               ; preds = %9
  %14 = load i32, ptr @Escort_special_goal, align 4, !dbg !2073
  %15 = icmp eq i32 %14, -1, !dbg !2075
  br i1 %15, label %16, label %21, !dbg !2076

16:                                               ; preds = %13
  %17 = load i32, ptr @Escort_goal_index, align 4, !dbg !2077
  %18 = load i32, ptr %2, align 4, !dbg !2078
  %19 = icmp eq i32 %17, %18, !dbg !2079
  br i1 %19, label %20, label %21, !dbg !2076

20:                                               ; preds = %16
  store i32 1, ptr %5, align 4, !dbg !2080
  br label %178, !dbg !2082

21:                                               ; preds = %16, %13
  %22 = load i32, ptr @Escort_goal_index, align 4, !dbg !2083
  %23 = icmp sle i32 %22, 3, !dbg !2085
  br i1 %23, label %24, label %78, !dbg !2086

24:                                               ; preds = %21
  %25 = load i32, ptr %2, align 4, !dbg !2087
  %26 = icmp sge i32 %25, 0, !dbg !2088
  br i1 %26, label %27, label %78, !dbg !2086

27:                                               ; preds = %24
  %28 = load i32, ptr %2, align 4, !dbg !2089
  %29 = sext i32 %28 to i64, !dbg !2092
  %30 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %29, !dbg !2092
  %31 = getelementptr inbounds nuw %struct.object, ptr %30, i32 0, i32 1, !dbg !2093
  %32 = load i8, ptr %31, align 4, !dbg !2093
  %33 = zext i8 %32 to i32, !dbg !2092
  %34 = icmp eq i32 %33, 7, !dbg !2094
  br i1 %34, label %35, label %77, !dbg !2094

35:                                               ; preds = %27
  %36 = load i32, ptr %2, align 4, !dbg !2095
  %37 = sext i32 %36 to i64, !dbg !2098
  %38 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %37, !dbg !2098
  %39 = getelementptr inbounds nuw %struct.object, ptr %38, i32 0, i32 2, !dbg !2099
  %40 = load i8, ptr %39, align 1, !dbg !2099
  %41 = zext i8 %40 to i32, !dbg !2098
  %42 = icmp eq i32 %41, 4, !dbg !2100
  br i1 %42, label %43, label %48, !dbg !2100

43:                                               ; preds = %35
  %44 = load i32, ptr @Escort_goal_index, align 4, !dbg !2101
  %45 = icmp eq i32 %44, 1, !dbg !2104
  br i1 %45, label %46, label %47, !dbg !2104

46:                                               ; preds = %43
  store i32 1, ptr %5, align 4, !dbg !2105
  br label %178, !dbg !2107

47:                                               ; preds = %43
  br label %76, !dbg !2108

48:                                               ; preds = %35
  %49 = load i32, ptr %2, align 4, !dbg !2109
  %50 = sext i32 %49 to i64, !dbg !2111
  %51 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %50, !dbg !2111
  %52 = getelementptr inbounds nuw %struct.object, ptr %51, i32 0, i32 2, !dbg !2112
  %53 = load i8, ptr %52, align 1, !dbg !2112
  %54 = zext i8 %53 to i32, !dbg !2111
  %55 = icmp eq i32 %54, 6, !dbg !2113
  br i1 %55, label %56, label %61, !dbg !2113

56:                                               ; preds = %48
  %57 = load i32, ptr @Escort_goal_index, align 4, !dbg !2114
  %58 = icmp eq i32 %57, 2, !dbg !2117
  br i1 %58, label %59, label %60, !dbg !2117

59:                                               ; preds = %56
  store i32 1, ptr %5, align 4, !dbg !2118
  br label %178, !dbg !2120

60:                                               ; preds = %56
  br label %75, !dbg !2121

61:                                               ; preds = %48
  %62 = load i32, ptr %2, align 4, !dbg !2122
  %63 = sext i32 %62 to i64, !dbg !2124
  %64 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %63, !dbg !2124
  %65 = getelementptr inbounds nuw %struct.object, ptr %64, i32 0, i32 2, !dbg !2125
  %66 = load i8, ptr %65, align 1, !dbg !2125
  %67 = zext i8 %66 to i32, !dbg !2124
  %68 = icmp eq i32 %67, 5, !dbg !2126
  br i1 %68, label %69, label %74, !dbg !2126

69:                                               ; preds = %61
  %70 = load i32, ptr @Escort_goal_index, align 4, !dbg !2127
  %71 = icmp eq i32 %70, 3, !dbg !2130
  br i1 %71, label %72, label %73, !dbg !2130

72:                                               ; preds = %69
  store i32 1, ptr %5, align 4, !dbg !2131
  br label %178, !dbg !2133

73:                                               ; preds = %69
  br label %74, !dbg !2134

74:                                               ; preds = %73, %61
  br label %75

75:                                               ; preds = %74, %60
  br label %76

76:                                               ; preds = %75, %47
  br label %77, !dbg !2135

77:                                               ; preds = %76, %27
  br label %78, !dbg !2136

78:                                               ; preds = %77, %24, %21
  %79 = load i32, ptr @Escort_special_goal, align 4, !dbg !2137
  %80 = icmp ne i32 %79, -1, !dbg !2139
  br i1 %80, label %81, label %177, !dbg !2139

81:                                               ; preds = %78
  %82 = load i32, ptr @Escort_special_goal, align 4, !dbg !2140
  %83 = icmp eq i32 %82, 7, !dbg !2142
  br i1 %83, label %84, label %133, !dbg !2142

84:                                               ; preds = %81
  %85 = load i32, ptr %2, align 4, !dbg !2143
  %86 = icmp eq i32 %85, -4, !dbg !2146
  br i1 %86, label %87, label %88, !dbg !2146

87:                                               ; preds = %84
  store i32 1, ptr %5, align 4, !dbg !2147
  br label %132, !dbg !2148

88:                                               ; preds = %84
  store i32 0, ptr %3, align 4, !dbg !2149
  br label %89, !dbg !2152

89:                                               ; preds = %128, %88
  %90 = load i32, ptr %3, align 4, !dbg !2153
  %91 = icmp slt i32 %90, 6, !dbg !2155
  br i1 %91, label %92, label %131, !dbg !2156

92:                                               ; preds = %89
  %93 = load i32, ptr %2, align 4, !dbg !2157
  %94 = sext i32 %93 to i64, !dbg !2159
  %95 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %94, !dbg !2159
  %96 = getelementptr inbounds nuw %struct.segment, ptr %95, i32 0, i32 1, !dbg !2160
  %97 = load i32, ptr %3, align 4, !dbg !2161
  %98 = sext i32 %97 to i64, !dbg !2159
  %99 = getelementptr inbounds [6 x i16], ptr %96, i64 0, i64 %98, !dbg !2159
  %100 = load i16, ptr %99, align 2, !dbg !2159
  %101 = sext i16 %100 to i32, !dbg !2159
  %102 = load i32, ptr @Escort_goal_index, align 4, !dbg !2162
  %103 = icmp eq i32 %101, %102, !dbg !2163
  br i1 %103, label %104, label %105, !dbg !2163

104:                                              ; preds = %92
  store i32 1, ptr %5, align 4, !dbg !2164
  br label %178, !dbg !2166

105:                                              ; preds = %92
  store i32 0, ptr %4, align 4, !dbg !2167
  br label %106, !dbg !2170

106:                                              ; preds = %123, %105
  %107 = load i32, ptr %4, align 4, !dbg !2171
  %108 = icmp slt i32 %107, 6, !dbg !2173
  br i1 %108, label %109, label %126, !dbg !2174

109:                                              ; preds = %106
  %110 = load i32, ptr %3, align 4, !dbg !2175
  %111 = sext i32 %110 to i64, !dbg !2177
  %112 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %111, !dbg !2177
  %113 = getelementptr inbounds nuw %struct.segment, ptr %112, i32 0, i32 1, !dbg !2178
  %114 = load i32, ptr %4, align 4, !dbg !2179
  %115 = sext i32 %114 to i64, !dbg !2177
  %116 = getelementptr inbounds [6 x i16], ptr %113, i64 0, i64 %115, !dbg !2177
  %117 = load i16, ptr %116, align 2, !dbg !2177
  %118 = sext i16 %117 to i32, !dbg !2177
  %119 = load i32, ptr @Escort_goal_index, align 4, !dbg !2180
  %120 = icmp eq i32 %118, %119, !dbg !2181
  br i1 %120, label %121, label %122, !dbg !2181

121:                                              ; preds = %109
  store i32 1, ptr %5, align 4, !dbg !2182
  br label %178, !dbg !2184

122:                                              ; preds = %109
  br label %123, !dbg !2180

123:                                              ; preds = %122
  %124 = load i32, ptr %4, align 4, !dbg !2185
  %125 = add nsw i32 %124, 1, !dbg !2185
  store i32 %125, ptr %4, align 4, !dbg !2185
  br label %106, !dbg !2186, !llvm.loop !2187

126:                                              ; preds = %106
  br label %127

127:                                              ; preds = %126
  br label %128, !dbg !2162

128:                                              ; preds = %127
  %129 = load i32, ptr %3, align 4, !dbg !2189
  %130 = add nsw i32 %129, 1, !dbg !2189
  store i32 %130, ptr %3, align 4, !dbg !2189
  br label %89, !dbg !2190, !llvm.loop !2191

131:                                              ; preds = %89
  br label %132

132:                                              ; preds = %131, %87
  br label %176, !dbg !2193

133:                                              ; preds = %81
  %134 = load i32, ptr %2, align 4, !dbg !2194
  %135 = sext i32 %134 to i64, !dbg !2196
  %136 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %135, !dbg !2196
  %137 = getelementptr inbounds nuw %struct.object, ptr %136, i32 0, i32 1, !dbg !2197
  %138 = load i8, ptr %137, align 4, !dbg !2197
  %139 = zext i8 %138 to i32, !dbg !2196
  %140 = icmp eq i32 %139, 7, !dbg !2198
  br i1 %140, label %141, label %145, !dbg !2199

141:                                              ; preds = %133
  %142 = load i32, ptr @Escort_special_goal, align 4, !dbg !2200
  %143 = icmp eq i32 %142, 9, !dbg !2201
  br i1 %143, label %144, label %145, !dbg !2199

144:                                              ; preds = %141
  store i32 1, ptr %5, align 4, !dbg !2202
  br label %175, !dbg !2203

145:                                              ; preds = %141, %133
  %146 = load i32, ptr %2, align 4, !dbg !2204
  %147 = sext i32 %146 to i64, !dbg !2206
  %148 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %147, !dbg !2206
  %149 = getelementptr inbounds nuw %struct.object, ptr %148, i32 0, i32 1, !dbg !2207
  %150 = load i8, ptr %149, align 4, !dbg !2207
  %151 = zext i8 %150 to i32, !dbg !2206
  %152 = load i32, ptr @Escort_goal_index, align 4, !dbg !2208
  %153 = sext i32 %152 to i64, !dbg !2209
  %154 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %153, !dbg !2209
  %155 = getelementptr inbounds nuw %struct.object, ptr %154, i32 0, i32 1, !dbg !2210
  %156 = load i8, ptr %155, align 4, !dbg !2210
  %157 = zext i8 %156 to i32, !dbg !2209
  %158 = icmp eq i32 %151, %157, !dbg !2211
  br i1 %158, label %159, label %174, !dbg !2212

159:                                              ; preds = %145
  %160 = load i32, ptr %2, align 4, !dbg !2213
  %161 = sext i32 %160 to i64, !dbg !2214
  %162 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %161, !dbg !2214
  %163 = getelementptr inbounds nuw %struct.object, ptr %162, i32 0, i32 2, !dbg !2215
  %164 = load i8, ptr %163, align 1, !dbg !2215
  %165 = zext i8 %164 to i32, !dbg !2214
  %166 = load i32, ptr @Escort_goal_index, align 4, !dbg !2216
  %167 = sext i32 %166 to i64, !dbg !2217
  %168 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %167, !dbg !2217
  %169 = getelementptr inbounds nuw %struct.object, ptr %168, i32 0, i32 2, !dbg !2218
  %170 = load i8, ptr %169, align 1, !dbg !2218
  %171 = zext i8 %170 to i32, !dbg !2217
  %172 = icmp eq i32 %165, %171, !dbg !2219
  br i1 %172, label %173, label %174, !dbg !2212

173:                                              ; preds = %159
  store i32 1, ptr %5, align 4, !dbg !2220
  br label %174, !dbg !2222

174:                                              ; preds = %173, %159, %145
  br label %175

175:                                              ; preds = %174, %144
  br label %176

176:                                              ; preds = %175, %132
  br label %177, !dbg !2223

177:                                              ; preds = %176, %78
  br label %178, !dbg !2224

178:                                              ; preds = %177, %121, %104, %72, %59, %46, %20
    #dbg_label(!2225, !2226)
  %179 = load i32, ptr %5, align 4, !dbg !2227
  %180 = icmp ne i32 %179, 0, !dbg !2227
  br i1 %180, label %181, label %185, !dbg !2229

181:                                              ; preds = %178
  %182 = call noundef i32 @_Z20ok_for_buddy_to_talkv(), !dbg !2230
  %183 = icmp ne i32 %182, 0, !dbg !2230
  br i1 %183, label %184, label %185, !dbg !2229

184:                                              ; preds = %181
  call void @_Z21digi_play_sample_onceii(i32 noundef 51, i32 noundef 65536), !dbg !2231
  store i32 -1, ptr @Escort_goal_index, align 4, !dbg !2233
  store i32 -1, ptr @Escort_goal_object, align 4, !dbg !2234
  store i32 -1, ptr @Escort_special_goal, align 4, !dbg !2235
  store i32 -1, ptr @Looking_for_marker, align 4, !dbg !2236
  br label %185, !dbg !2237

185:                                              ; preds = %8, %12, %184, %181, %178
  ret void, !dbg !2238
}

declare void @_Z21digi_play_sample_onceii(i32 noundef, i32 noundef) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z20change_guidebot_namev() #1 !dbg !2239 {
  %1 = alloca %struct.newmenu_item, align 8
  %2 = alloca [10 x i8], align 1
  %3 = alloca i32, align 4
    #dbg_declare(ptr %1, !2240, !DIExpression(), !2262)
    #dbg_declare(ptr %2, !2263, !DIExpression(), !2264)
  call void @llvm.memset.p0.i64(ptr align 1 %2, i8 0, i64 10, i1 false), !dbg !2264
    #dbg_declare(ptr %3, !2265, !DIExpression(), !2266)
  %4 = getelementptr inbounds [10 x i8], ptr %2, i64 0, i64 0, !dbg !2267
  %5 = call ptr @strcpy(ptr noundef %4, ptr noundef @guidebot_name) #6, !dbg !2268
  %6 = getelementptr inbounds nuw %struct.newmenu_item, ptr %1, i32 0, i32 0, !dbg !2269
  store i32 1, ptr %6, align 8, !dbg !2270
  %7 = getelementptr inbounds nuw %struct.newmenu_item, ptr %1, i32 0, i32 5, !dbg !2271
  store i32 9, ptr %7, align 4, !dbg !2272
  %8 = getelementptr inbounds [10 x i8], ptr %2, i64 0, i64 0, !dbg !2273
  %9 = getelementptr inbounds nuw %struct.newmenu_item, ptr %1, i32 0, i32 6, !dbg !2274
  store ptr %8, ptr %9, align 8, !dbg !2275
  %10 = call noundef i32 @_Z10newmenu_doPKcS0_iP12newmenu_itemPFviS2_PiiE(ptr noundef null, ptr noundef @.str.25, i32 noundef 1, ptr noundef %1, ptr noundef null), !dbg !2276
  store i32 %10, ptr %3, align 4, !dbg !2277
  %11 = load i32, ptr %3, align 4, !dbg !2278
  %12 = icmp ne i32 %11, -1, !dbg !2280
  br i1 %12, label %13, label %19, !dbg !2280

13:                                               ; preds = %0
  %14 = getelementptr inbounds [10 x i8], ptr %2, i64 0, i64 0, !dbg !2281
  %15 = call ptr @strcpy(ptr noundef @guidebot_name, ptr noundef %14) #6, !dbg !2283
  %16 = getelementptr inbounds [10 x i8], ptr %2, i64 0, i64 0, !dbg !2284
  %17 = call ptr @strcpy(ptr noundef @real_guidebot_name, ptr noundef %16) #6, !dbg !2285
  %18 = call noundef i32 @_Z17write_player_filev(), !dbg !2286
  br label %19, !dbg !2287

19:                                               ; preds = %13, %0
  ret void, !dbg !2288
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #4

declare noundef i32 @_Z10newmenu_doPKcS0_iP12newmenu_itemPFviS2_PiiE(ptr noundef, ptr noundef, i32 noundef, ptr noundef, ptr noundef) #2

declare noundef i32 @_Z17write_player_filev() #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z13buddy_messagePKcz(ptr noundef %0, ...) #1 !dbg !2289 {
  %2 = alloca ptr, align 8
  %3 = alloca [16 x i8], align 1
  %4 = alloca [128 x i8], align 1
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2292, !DIExpression(), !2293)
  %7 = load i32, ptr @Buddy_messages_suppressed, align 4, !dbg !2294
  %8 = icmp ne i32 %7, 0, !dbg !2294
  br i1 %8, label %9, label %10, !dbg !2294

9:                                                ; preds = %1
  br label %63, !dbg !2296

10:                                               ; preds = %1
  %11 = load i32, ptr @Game_mode, align 4, !dbg !2297
  %12 = and i32 %11, 38, !dbg !2299
  %13 = icmp ne i32 %12, 0, !dbg !2297
  br i1 %13, label %14, label %15, !dbg !2297

14:                                               ; preds = %10
  br label %63, !dbg !2300

15:                                               ; preds = %10
  %16 = load i32, ptr @Last_buddy_message_time, align 4, !dbg !2301
  %17 = add nsw i32 %16, 65536, !dbg !2303
  %18 = load i32, ptr @GameTime, align 4, !dbg !2304
  %19 = icmp slt i32 %17, %18, !dbg !2305
  br i1 %19, label %24, label %20, !dbg !2306

20:                                               ; preds = %15
  %21 = load i32, ptr @Last_buddy_message_time, align 4, !dbg !2307
  %22 = load i32, ptr @GameTime, align 4, !dbg !2308
  %23 = icmp sgt i32 %21, %22, !dbg !2309
  br i1 %23, label %24, label %63, !dbg !2306

24:                                               ; preds = %20, %15
  %25 = call noundef i32 @_Z20ok_for_buddy_to_talkv(), !dbg !2310
  %26 = icmp ne i32 %25, 0, !dbg !2310
  br i1 %26, label %27, label %62, !dbg !2310

27:                                               ; preds = %24
    #dbg_declare(ptr %3, !2313, !DIExpression(), !2316)
    #dbg_declare(ptr %4, !2317, !DIExpression(), !2318)
    #dbg_declare(ptr %5, !2319, !DIExpression(), !2320)
    #dbg_declare(ptr %6, !2321, !DIExpression(), !2322)
  call void @llvm.va_start.p0(ptr %5), !dbg !2323
  %28 = getelementptr inbounds [128 x i8], ptr %4, i64 0, i64 0, !dbg !2324
  %29 = load ptr, ptr %2, align 8, !dbg !2325
  %30 = load ptr, ptr %5, align 8, !dbg !2326
  %31 = call i32 @vsprintf(ptr noundef %28, ptr noundef %29, ptr noundef %30) #6, !dbg !2327
  call void @llvm.va_end.p0(ptr %5), !dbg !2328
  %32 = getelementptr inbounds [16 x i8], ptr %3, i64 0, i64 0, !dbg !2329
  store i8 1, ptr %32, align 1, !dbg !2330
  %33 = call noundef i32 @_Z21gr_find_closest_coloriii(i32 noundef 56, i32 noundef 0, i32 noundef 0), !dbg !2331
  %34 = trunc i32 %33 to i8, !dbg !2331
  %35 = getelementptr inbounds [16 x i8], ptr %3, i64 0, i64 1, !dbg !2332
  store i8 %34, ptr %35, align 1, !dbg !2333
  %36 = getelementptr inbounds [16 x i8], ptr %3, i64 0, i64 2, !dbg !2334
  %37 = call ptr @strcpy(ptr noundef %36, ptr noundef @guidebot_name) #6, !dbg !2335
  %38 = getelementptr inbounds [16 x i8], ptr %3, i64 0, i64 0, !dbg !2336
  %39 = call i64 @strlen(ptr noundef %38) #6, !dbg !2337
  %40 = trunc i64 %39 to i32, !dbg !2337
  store i32 %40, ptr %6, align 4, !dbg !2338
  %41 = load i32, ptr %6, align 4, !dbg !2339
  %42 = sext i32 %41 to i64, !dbg !2340
  %43 = getelementptr inbounds [16 x i8], ptr %3, i64 0, i64 %42, !dbg !2340
  store i8 58, ptr %43, align 1, !dbg !2341
  %44 = load i32, ptr %6, align 4, !dbg !2342
  %45 = add nsw i32 %44, 1, !dbg !2343
  %46 = sext i32 %45 to i64, !dbg !2344
  %47 = getelementptr inbounds [16 x i8], ptr %3, i64 0, i64 %46, !dbg !2344
  store i8 1, ptr %47, align 1, !dbg !2345
  %48 = call noundef i32 @_Z21gr_find_closest_coloriii(i32 noundef 0, i32 noundef 62, i32 noundef 0), !dbg !2346
  %49 = trunc i32 %48 to i8, !dbg !2346
  %50 = load i32, ptr %6, align 4, !dbg !2347
  %51 = add nsw i32 %50, 2, !dbg !2348
  %52 = sext i32 %51 to i64, !dbg !2349
  %53 = getelementptr inbounds [16 x i8], ptr %3, i64 0, i64 %52, !dbg !2349
  store i8 %49, ptr %53, align 1, !dbg !2350
  %54 = load i32, ptr %6, align 4, !dbg !2351
  %55 = add nsw i32 %54, 3, !dbg !2352
  %56 = sext i32 %55 to i64, !dbg !2353
  %57 = getelementptr inbounds [16 x i8], ptr %3, i64 0, i64 %56, !dbg !2353
  store i8 0, ptr %57, align 1, !dbg !2354
  %58 = getelementptr inbounds [16 x i8], ptr %3, i64 0, i64 0, !dbg !2355
  %59 = getelementptr inbounds [128 x i8], ptr %4, i64 0, i64 0, !dbg !2356
  %60 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.26, ptr noundef %58, ptr noundef %59), !dbg !2357
  %61 = load i32, ptr @GameTime, align 4, !dbg !2358
  store i32 %61, ptr @Last_buddy_message_time, align 4, !dbg !2359
  br label %62, !dbg !2360

62:                                               ; preds = %27, %24
  br label %63, !dbg !2361

63:                                               ; preds = %9, %14, %62, %20
  ret void, !dbg !2362
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_start.p0(ptr) #5

; Function Attrs: nounwind
declare i32 @vsprintf(ptr noundef, ptr noundef, ptr noundef) #4

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_end.p0(ptr) #5

declare noundef i32 @_Z21gr_find_closest_coloriii(i32 noundef, i32 noundef, i32 noundef) #2

; Function Attrs: nounwind
declare i64 @strlen(ptr noundef) #4

declare noundef i32 @_Z16HUD_init_messagePKcz(ptr noundef, ...) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z13thief_messagePKcz(ptr noundef %0, ...) #1 !dbg !2363 {
  %2 = alloca ptr, align 8
  %3 = alloca [16 x i8], align 1
  %4 = alloca [128 x i8], align 1
  %5 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2364, !DIExpression(), !2365)
    #dbg_declare(ptr %3, !2366, !DIExpression(), !2367)
    #dbg_declare(ptr %4, !2368, !DIExpression(), !2369)
    #dbg_declare(ptr %5, !2370, !DIExpression(), !2371)
  call void @llvm.va_start.p0(ptr %5), !dbg !2372
  %6 = getelementptr inbounds [128 x i8], ptr %4, i64 0, i64 0, !dbg !2373
  %7 = load ptr, ptr %2, align 8, !dbg !2374
  %8 = load ptr, ptr %5, align 8, !dbg !2375
  %9 = call i32 @vsprintf(ptr noundef %6, ptr noundef %7, ptr noundef %8) #6, !dbg !2376
  call void @llvm.va_end.p0(ptr %5), !dbg !2377
  %10 = getelementptr inbounds [16 x i8], ptr %3, i64 0, i64 0, !dbg !2378
  store i8 1, ptr %10, align 1, !dbg !2379
  %11 = call noundef i32 @_Z21gr_find_closest_coloriii(i32 noundef 56, i32 noundef 0, i32 noundef 0), !dbg !2380
  %12 = trunc i32 %11 to i8, !dbg !2380
  %13 = getelementptr inbounds [16 x i8], ptr %3, i64 0, i64 1, !dbg !2381
  store i8 %12, ptr %13, align 1, !dbg !2382
  %14 = getelementptr inbounds [16 x i8], ptr %3, i64 0, i64 2, !dbg !2383
  %15 = call ptr @strcpy(ptr noundef %14, ptr noundef @.str.27) #6, !dbg !2384
  %16 = getelementptr inbounds [16 x i8], ptr %3, i64 0, i64 8, !dbg !2385
  store i8 1, ptr %16, align 1, !dbg !2386
  %17 = call noundef i32 @_Z21gr_find_closest_coloriii(i32 noundef 0, i32 noundef 62, i32 noundef 0), !dbg !2387
  %18 = trunc i32 %17 to i8, !dbg !2387
  %19 = getelementptr inbounds [16 x i8], ptr %3, i64 0, i64 9, !dbg !2388
  store i8 %18, ptr %19, align 1, !dbg !2389
  %20 = getelementptr inbounds [16 x i8], ptr %3, i64 0, i64 10, !dbg !2390
  store i8 0, ptr %20, align 1, !dbg !2391
  %21 = getelementptr inbounds [16 x i8], ptr %3, i64 0, i64 0, !dbg !2392
  %22 = getelementptr inbounds [128 x i8], ptr %4, i64 0, i64 0, !dbg !2393
  %23 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.26, ptr noundef %21, ptr noundef %22), !dbg !2394
  ret void, !dbg !2395
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define noundef i32 @_Z21marker_exists_in_minei(i32 noundef %0) #0 !dbg !2396 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !2397, !DIExpression(), !2398)
    #dbg_declare(ptr %4, !2399, !DIExpression(), !2400)
  store i32 0, ptr %4, align 4, !dbg !2401
  br label %5, !dbg !2403

5:                                                ; preds = %29, %1
  %6 = load i32, ptr %4, align 4, !dbg !2404
  %7 = load i32, ptr @Highest_object_index, align 4, !dbg !2406
  %8 = icmp sle i32 %6, %7, !dbg !2407
  br i1 %8, label %9, label %32, !dbg !2408

9:                                                ; preds = %5
  %10 = load i32, ptr %4, align 4, !dbg !2409
  %11 = sext i32 %10 to i64, !dbg !2411
  %12 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %11, !dbg !2411
  %13 = getelementptr inbounds nuw %struct.object, ptr %12, i32 0, i32 1, !dbg !2412
  %14 = load i8, ptr %13, align 4, !dbg !2412
  %15 = zext i8 %14 to i32, !dbg !2411
  %16 = icmp eq i32 %15, 15, !dbg !2413
  br i1 %16, label %17, label %28, !dbg !2413

17:                                               ; preds = %9
  %18 = load i32, ptr %4, align 4, !dbg !2414
  %19 = sext i32 %18 to i64, !dbg !2416
  %20 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %19, !dbg !2416
  %21 = getelementptr inbounds nuw %struct.object, ptr %20, i32 0, i32 2, !dbg !2417
  %22 = load i8, ptr %21, align 1, !dbg !2417
  %23 = zext i8 %22 to i32, !dbg !2416
  %24 = load i32, ptr %3, align 4, !dbg !2418
  %25 = icmp eq i32 %23, %24, !dbg !2419
  br i1 %25, label %26, label %27, !dbg !2419

26:                                               ; preds = %17
  store i32 1, ptr %2, align 4, !dbg !2420
  br label %33, !dbg !2420

27:                                               ; preds = %17
  br label %28, !dbg !2418

28:                                               ; preds = %27, %9
  br label %29, !dbg !2421

29:                                               ; preds = %28
  %30 = load i32, ptr %4, align 4, !dbg !2422
  %31 = add nsw i32 %30, 1, !dbg !2422
  store i32 %31, ptr %4, align 4, !dbg !2422
  br label %5, !dbg !2423, !llvm.loop !2424

32:                                               ; preds = %5
  store i32 0, ptr %2, align 4, !dbg !2426
  br label %33, !dbg !2426

33:                                               ; preds = %32, %26
  %34 = load i32, ptr %2, align 4, !dbg !2427
  ret i32 %34, !dbg !2427
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z23set_escort_special_goali(i32 noundef %0) #1 !dbg !2428 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !2429, !DIExpression(), !2430)
    #dbg_declare(ptr %3, !2431, !DIExpression(), !2432)
  store i32 0, ptr @Buddy_messages_suppressed, align 4, !dbg !2433
  %5 = load i32, ptr @Buddy_allowed_to_talk, align 4, !dbg !2434
  %6 = icmp ne i32 %5, 0, !dbg !2434
  br i1 %6, label %51, label %7, !dbg !2436

7:                                                ; preds = %1
  %8 = call noundef i32 @_Z20ok_for_buddy_to_talkv(), !dbg !2437
  %9 = load i32, ptr @Buddy_allowed_to_talk, align 4, !dbg !2439
  %10 = icmp ne i32 %9, 0, !dbg !2439
  br i1 %10, label %50, label %11, !dbg !2441

11:                                               ; preds = %7
    #dbg_declare(ptr %4, !2442, !DIExpression(), !2444)
  store i32 0, ptr %4, align 4, !dbg !2445
  br label %12, !dbg !2447

12:                                               ; preds = %38, %11
  %13 = load i32, ptr %4, align 4, !dbg !2448
  %14 = load i32, ptr @Highest_object_index, align 4, !dbg !2450
  %15 = icmp sle i32 %13, %14, !dbg !2451
  br i1 %15, label %16, label %41, !dbg !2452

16:                                               ; preds = %12
  %17 = load i32, ptr %4, align 4, !dbg !2453
  %18 = sext i32 %17 to i64, !dbg !2455
  %19 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %18, !dbg !2455
  %20 = getelementptr inbounds nuw %struct.object, ptr %19, i32 0, i32 1, !dbg !2456
  %21 = load i8, ptr %20, align 4, !dbg !2456
  %22 = zext i8 %21 to i32, !dbg !2455
  %23 = icmp eq i32 %22, 2, !dbg !2457
  br i1 %23, label %24, label %37, !dbg !2458

24:                                               ; preds = %16
  %25 = load i32, ptr %4, align 4, !dbg !2459
  %26 = sext i32 %25 to i64, !dbg !2460
  %27 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %26, !dbg !2460
  %28 = getelementptr inbounds nuw %struct.object, ptr %27, i32 0, i32 2, !dbg !2461
  %29 = load i8, ptr %28, align 1, !dbg !2461
  %30 = zext i8 %29 to i64, !dbg !2462
  %31 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %30, !dbg !2462
  %32 = getelementptr inbounds nuw %struct.robot_info, ptr %31, i32 0, i32 37, !dbg !2463
  %33 = load i8, ptr %32, align 1, !dbg !2463
  %34 = icmp ne i8 %33, 0, !dbg !2462
  br i1 %34, label %35, label %37, !dbg !2458

35:                                               ; preds = %24
  %36 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.28, ptr noundef @guidebot_name), !dbg !2464
  br label %42, !dbg !2466

37:                                               ; preds = %24, %16
  br label %38, !dbg !2463

38:                                               ; preds = %37
  %39 = load i32, ptr %4, align 4, !dbg !2467
  %40 = add nsw i32 %39, 1, !dbg !2467
  store i32 %40, ptr %4, align 4, !dbg !2467
  br label %12, !dbg !2468, !llvm.loop !2469

41:                                               ; preds = %12
  br label %42, !dbg !2471

42:                                               ; preds = %41, %35
  %43 = load i32, ptr %4, align 4, !dbg !2471
  %44 = load i32, ptr @Highest_object_index, align 4, !dbg !2473
  %45 = add nsw i32 %44, 1, !dbg !2474
  %46 = icmp eq i32 %43, %45, !dbg !2475
  br i1 %46, label %47, label %49, !dbg !2475

47:                                               ; preds = %42
  %48 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.29), !dbg !2476
  br label %49, !dbg !2476

49:                                               ; preds = %47, %42
  br label %109, !dbg !2477

50:                                               ; preds = %7
  br label %51, !dbg !2478

51:                                               ; preds = %50, %1
  %52 = load i32, ptr %2, align 4, !dbg !2479
  %53 = and i32 %52, -257, !dbg !2480
  store i32 %53, ptr %2, align 4, !dbg !2481
  %54 = load i32, ptr %2, align 4, !dbg !2482
  store i32 %54, ptr %3, align 4, !dbg !2483
  %55 = load i32, ptr @Last_buddy_key, align 4, !dbg !2484
  %56 = load i32, ptr %2, align 4, !dbg !2486
  %57 = icmp eq i32 %55, %56, !dbg !2487
  br i1 %57, label %58, label %79, !dbg !2487

58:                                               ; preds = %51
  %59 = load i32, ptr @Looking_for_marker, align 4, !dbg !2488
  %60 = icmp eq i32 %59, -1, !dbg !2490
  br i1 %60, label %61, label %77, !dbg !2491

61:                                               ; preds = %58
  %62 = load i32, ptr %2, align 4, !dbg !2492
  %63 = icmp ne i32 %62, 11, !dbg !2493
  br i1 %63, label %64, label %77, !dbg !2491

64:                                               ; preds = %61
  %65 = load i32, ptr %3, align 4, !dbg !2494
  %66 = sub nsw i32 %65, 2, !dbg !2497
  %67 = call noundef i32 @_Z21marker_exists_in_minei(i32 noundef %66), !dbg !2498
  %68 = icmp ne i32 %67, 0, !dbg !2498
  br i1 %68, label %69, label %72, !dbg !2498

69:                                               ; preds = %64
  %70 = load i32, ptr %3, align 4, !dbg !2499
  %71 = sub nsw i32 %70, 2, !dbg !2500
  store i32 %71, ptr @Looking_for_marker, align 4, !dbg !2501
  br label %76, !dbg !2502

72:                                               ; preds = %64
  store i32 0, ptr @Last_buddy_message_time, align 4, !dbg !2503
  %73 = load i32, ptr %3, align 4, !dbg !2505
  %74 = sub nsw i32 %73, 2, !dbg !2506
  %75 = add nsw i32 %74, 1, !dbg !2507
  call void (ptr, ...) @_Z13buddy_messagePKcz(ptr noundef @.str.30, i32 noundef %75), !dbg !2508
  store i32 -1, ptr @Looking_for_marker, align 4, !dbg !2509
  br label %76

76:                                               ; preds = %72, %69
  br label %78, !dbg !2510

77:                                               ; preds = %61, %58
  store i32 -1, ptr @Looking_for_marker, align 4, !dbg !2511
  br label %78

78:                                               ; preds = %77, %76
  br label %79, !dbg !2512

79:                                               ; preds = %78, %51
  %80 = load i32, ptr %2, align 4, !dbg !2513
  store i32 %80, ptr @Last_buddy_key, align 4, !dbg !2514
  %81 = load i32, ptr %2, align 4, !dbg !2515
  %82 = icmp eq i32 %81, 11, !dbg !2517
  br i1 %82, label %83, label %84, !dbg !2517

83:                                               ; preds = %79
  store i32 -1, ptr @Looking_for_marker, align 4, !dbg !2518
  br label %84, !dbg !2519

84:                                               ; preds = %83, %79
  %85 = load i32, ptr @Looking_for_marker, align 4, !dbg !2520
  %86 = icmp ne i32 %85, -1, !dbg !2522
  br i1 %86, label %87, label %91, !dbg !2522

87:                                               ; preds = %84
  %88 = load i32, ptr %3, align 4, !dbg !2523
  %89 = add nsw i32 16, %88, !dbg !2525
  %90 = sub nsw i32 %89, 2, !dbg !2526
  store i32 %90, ptr @Escort_special_goal, align 4, !dbg !2527
  br label %105, !dbg !2528

91:                                               ; preds = %84
  %92 = load i32, ptr %2, align 4, !dbg !2529
  switch i32 %92, label %103 [
    i32 2, label %93
    i32 3, label %94
    i32 4, label %95
    i32 5, label %96
    i32 6, label %97
    i32 7, label %98
    i32 8, label %99
    i32 9, label %100
    i32 10, label %101
    i32 11, label %102
  ], !dbg !2531

93:                                               ; preds = %91
  store i32 6, ptr @Escort_special_goal, align 4, !dbg !2532
  br label %104, !dbg !2534

94:                                               ; preds = %91
  store i32 7, ptr @Escort_special_goal, align 4, !dbg !2535
  br label %104, !dbg !2536

95:                                               ; preds = %91
  store i32 8, ptr @Escort_special_goal, align 4, !dbg !2537
  br label %104, !dbg !2538

96:                                               ; preds = %91
  store i32 9, ptr @Escort_special_goal, align 4, !dbg !2539
  br label %104, !dbg !2540

97:                                               ; preds = %91
  store i32 10, ptr @Escort_special_goal, align 4, !dbg !2541
  br label %104, !dbg !2542

98:                                               ; preds = %91
  store i32 11, ptr @Escort_special_goal, align 4, !dbg !2543
  br label %104, !dbg !2544

99:                                               ; preds = %91
  store i32 13, ptr @Escort_special_goal, align 4, !dbg !2545
  br label %104, !dbg !2546

100:                                              ; preds = %91
  store i32 12, ptr @Escort_special_goal, align 4, !dbg !2547
  br label %104, !dbg !2548

101:                                              ; preds = %91
  store i32 5, ptr @Escort_special_goal, align 4, !dbg !2549
  br label %104, !dbg !2550

102:                                              ; preds = %91
  store i32 -1, ptr @Escort_special_goal, align 4, !dbg !2551
  br label %104, !dbg !2552

103:                                              ; preds = %91
  call void @_Z4Int3v(), !dbg !2553
  br label %104, !dbg !2554

104:                                              ; preds = %103, %102, %101, %100, %99, %98, %97, %96, %95, %94, %93
  br label %105

105:                                              ; preds = %104, %87
  %106 = load i32, ptr @GameTime, align 4, !dbg !2555
  %107 = sub nsw i32 %106, 131072, !dbg !2556
  store i32 %107, ptr @Last_buddy_message_time, align 4, !dbg !2557
  %108 = load i32, ptr @Escort_special_goal, align 4, !dbg !2558
  call void @_Z15say_escort_goali(i32 noundef %108), !dbg !2559
  store i32 -1, ptr @Escort_goal_object, align 4, !dbg !2560
  br label %109, !dbg !2561

109:                                              ; preds = %105, %49
  ret void, !dbg !2561
}

declare void @_Z4Int3v() #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z15say_escort_goali(i32 noundef %0) #1 !dbg !2562 {
  %2 = alloca i32, align 4
  %3 = alloca [25 x i8], align 1
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !2563, !DIExpression(), !2564)
  %4 = load i32, ptr @Player_is_dead, align 4, !dbg !2565
  %5 = icmp ne i32 %4, 0, !dbg !2565
  br i1 %5, label %6, label %7, !dbg !2565

6:                                                ; preds = %1
  br label %36, !dbg !2567

7:                                                ; preds = %1
  %8 = load i32, ptr %2, align 4, !dbg !2568
  switch i32 %8, label %36 [
    i32 1, label %9
    i32 2, label %10
    i32 3, label %11
    i32 4, label %12
    i32 5, label %13
    i32 6, label %14
    i32 7, label %15
    i32 8, label %16
    i32 9, label %17
    i32 10, label %18
    i32 11, label %19
    i32 13, label %20
    i32 15, label %21
    i32 12, label %22
    i32 16, label %23
    i32 17, label %23
    i32 18, label %23
    i32 19, label %23
    i32 20, label %23
    i32 21, label %23
    i32 22, label %23
    i32 23, label %23
    i32 24, label %23
  ], !dbg !2569

9:                                                ; preds = %7
  call void (ptr, ...) @_Z13buddy_messagePKcz(ptr noundef @.str.31), !dbg !2570
  br label %36, !dbg !2572

10:                                               ; preds = %7
  call void (ptr, ...) @_Z13buddy_messagePKcz(ptr noundef @.str.32), !dbg !2573
  br label %36, !dbg !2574

11:                                               ; preds = %7
  call void (ptr, ...) @_Z13buddy_messagePKcz(ptr noundef @.str.33), !dbg !2575
  br label %36, !dbg !2576

12:                                               ; preds = %7
  call void (ptr, ...) @_Z13buddy_messagePKcz(ptr noundef @.str.34), !dbg !2577
  br label %36, !dbg !2578

13:                                               ; preds = %7
  call void (ptr, ...) @_Z13buddy_messagePKcz(ptr noundef @.str.35), !dbg !2579
  br label %36, !dbg !2580

14:                                               ; preds = %7
  call void (ptr, ...) @_Z13buddy_messagePKcz(ptr noundef @.str.36), !dbg !2581
  br label %36, !dbg !2582

15:                                               ; preds = %7
  call void (ptr, ...) @_Z13buddy_messagePKcz(ptr noundef @.str.37), !dbg !2583
  br label %36, !dbg !2584

16:                                               ; preds = %7
  call void (ptr, ...) @_Z13buddy_messagePKcz(ptr noundef @.str.38), !dbg !2585
  br label %36, !dbg !2586

17:                                               ; preds = %7
  call void (ptr, ...) @_Z13buddy_messagePKcz(ptr noundef @.str.39), !dbg !2587
  br label %36, !dbg !2588

18:                                               ; preds = %7
  call void (ptr, ...) @_Z13buddy_messagePKcz(ptr noundef @.str.40), !dbg !2589
  br label %36, !dbg !2590

19:                                               ; preds = %7
  call void (ptr, ...) @_Z13buddy_messagePKcz(ptr noundef @.str.41), !dbg !2591
  br label %36, !dbg !2592

20:                                               ; preds = %7
  call void (ptr, ...) @_Z13buddy_messagePKcz(ptr noundef @.str.42), !dbg !2593
  br label %36, !dbg !2594

21:                                               ; preds = %7
  call void (ptr, ...) @_Z13buddy_messagePKcz(ptr noundef @.str.43), !dbg !2595
  br label %36, !dbg !2596

22:                                               ; preds = %7
  call void (ptr, ...) @_Z13buddy_messagePKcz(ptr noundef @.str.44), !dbg !2597
  br label %36, !dbg !2598

23:                                               ; preds = %7, %7, %7, %7, %7, %7, %7, %7, %7
    #dbg_declare(ptr %3, !2599, !DIExpression(), !2602)
  %24 = getelementptr inbounds [25 x i8], ptr %3, i64 0, i64 0, !dbg !2603
  %25 = load i32, ptr %2, align 4, !dbg !2604
  %26 = sub nsw i32 %25, 16, !dbg !2605
  %27 = sext i32 %26 to i64, !dbg !2606
  %28 = getelementptr inbounds [16 x [40 x i8]], ptr @MarkerMessage, i64 0, i64 %27, !dbg !2606
  %29 = getelementptr inbounds [40 x i8], ptr %28, i64 0, i64 0, !dbg !2606
  %30 = call ptr @strncpy(ptr noundef %24, ptr noundef %29, i64 noundef 24) #6, !dbg !2607
  %31 = getelementptr inbounds [25 x i8], ptr %3, i64 0, i64 24, !dbg !2608
  store i8 0, ptr %31, align 1, !dbg !2609
  %32 = load i32, ptr %2, align 4, !dbg !2610
  %33 = sub nsw i32 %32, 16, !dbg !2611
  %34 = add nsw i32 %33, 1, !dbg !2612
  %35 = getelementptr inbounds [25 x i8], ptr %3, i64 0, i64 0, !dbg !2613
  call void (ptr, ...) @_Z13buddy_messagePKcz(ptr noundef @.str.45, i32 noundef %34, ptr noundef %35), !dbg !2614
  br label %36, !dbg !2615

36:                                               ; preds = %6, %7, %23, %22, %21, %20, %19, %18, %17, %16, %15, %14, %13, %12, %11, %10, %9
  ret void, !dbg !2616
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define noundef i32 @_Z11get_boss_idv() #0 !dbg !2617 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
    #dbg_declare(ptr %2, !2618, !DIExpression(), !2619)
  store i32 0, ptr %2, align 4, !dbg !2620
  br label %3, !dbg !2622

3:                                                ; preds = %35, %0
  %4 = load i32, ptr %2, align 4, !dbg !2623
  %5 = load i32, ptr @Highest_object_index, align 4, !dbg !2625
  %6 = icmp sle i32 %4, %5, !dbg !2626
  br i1 %6, label %7, label %38, !dbg !2627

7:                                                ; preds = %3
  %8 = load i32, ptr %2, align 4, !dbg !2628
  %9 = sext i32 %8 to i64, !dbg !2630
  %10 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %9, !dbg !2630
  %11 = getelementptr inbounds nuw %struct.object, ptr %10, i32 0, i32 1, !dbg !2631
  %12 = load i8, ptr %11, align 4, !dbg !2631
  %13 = zext i8 %12 to i32, !dbg !2630
  %14 = icmp eq i32 %13, 2, !dbg !2632
  br i1 %14, label %15, label %34, !dbg !2632

15:                                               ; preds = %7
  %16 = load i32, ptr %2, align 4, !dbg !2633
  %17 = sext i32 %16 to i64, !dbg !2635
  %18 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %17, !dbg !2635
  %19 = getelementptr inbounds nuw %struct.object, ptr %18, i32 0, i32 2, !dbg !2636
  %20 = load i8, ptr %19, align 1, !dbg !2636
  %21 = zext i8 %20 to i64, !dbg !2637
  %22 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %21, !dbg !2637
  %23 = getelementptr inbounds nuw %struct.robot_info, ptr %22, i32 0, i32 36, !dbg !2638
  %24 = load i8, ptr %23, align 4, !dbg !2638
  %25 = icmp ne i8 %24, 0, !dbg !2637
  br i1 %25, label %26, label %33, !dbg !2637

26:                                               ; preds = %15
  %27 = load i32, ptr %2, align 4, !dbg !2639
  %28 = sext i32 %27 to i64, !dbg !2640
  %29 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %28, !dbg !2640
  %30 = getelementptr inbounds nuw %struct.object, ptr %29, i32 0, i32 2, !dbg !2641
  %31 = load i8, ptr %30, align 1, !dbg !2641
  %32 = zext i8 %31 to i32, !dbg !2640
  store i32 %32, ptr %1, align 4, !dbg !2642
  br label %39, !dbg !2642

33:                                               ; preds = %15
  br label %34, !dbg !2638

34:                                               ; preds = %33, %7
  br label %35, !dbg !2643

35:                                               ; preds = %34
  %36 = load i32, ptr %2, align 4, !dbg !2644
  %37 = add nsw i32 %36, 1, !dbg !2644
  store i32 %37, ptr %2, align 4, !dbg !2644
  br label %3, !dbg !2645, !llvm.loop !2646

38:                                               ; preds = %3
  store i32 -1, ptr %1, align 4, !dbg !2648
  br label %39, !dbg !2648

39:                                               ; preds = %38, %26
  %40 = load i32, ptr %1, align 4, !dbg !2649
  ret i32 %40, !dbg !2649
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define noundef i32 @_Z16exists_in_mine_2iiii(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 !dbg !2650 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  store i32 %0, ptr %6, align 4
    #dbg_declare(ptr %6, !2653, !DIExpression(), !2654)
  store i32 %1, ptr %7, align 4
    #dbg_declare(ptr %7, !2655, !DIExpression(), !2656)
  store i32 %2, ptr %8, align 4
    #dbg_declare(ptr %8, !2657, !DIExpression(), !2658)
  store i32 %3, ptr %9, align 4
    #dbg_declare(ptr %9, !2659, !DIExpression(), !2660)
  %12 = load i32, ptr %6, align 4, !dbg !2661
  %13 = sext i32 %12 to i64, !dbg !2663
  %14 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %13, !dbg !2663
  %15 = getelementptr inbounds nuw %struct.segment, ptr %14, i32 0, i32 3, !dbg !2664
  %16 = load i32, ptr %15, align 4, !dbg !2664
  %17 = icmp ne i32 %16, -1, !dbg !2665
  br i1 %17, label %18, label %138, !dbg !2665

18:                                               ; preds = %4
    #dbg_declare(ptr %10, !2666, !DIExpression(), !2668)
  %19 = load i32, ptr %6, align 4, !dbg !2669
  %20 = sext i32 %19 to i64, !dbg !2670
  %21 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %20, !dbg !2670
  %22 = getelementptr inbounds nuw %struct.segment, ptr %21, i32 0, i32 3, !dbg !2671
  %23 = load i32, ptr %22, align 4, !dbg !2671
  store i32 %23, ptr %10, align 4, !dbg !2668
  br label %24, !dbg !2672

24:                                               ; preds = %132, %18
  %25 = load i32, ptr %10, align 4, !dbg !2673
  %26 = icmp ne i32 %25, -1, !dbg !2674
  br i1 %26, label %27, label %137, !dbg !2672

27:                                               ; preds = %24
    #dbg_declare(ptr %11, !2675, !DIExpression(), !2805)
  %28 = load i32, ptr %10, align 4, !dbg !2806
  %29 = sext i32 %28 to i64, !dbg !2807
  %30 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %29, !dbg !2807
  store ptr %30, ptr %11, align 8, !dbg !2805
  %31 = load i32, ptr %9, align 4, !dbg !2808
  %32 = icmp eq i32 %31, 12, !dbg !2810
  br i1 %32, label %33, label %43, !dbg !2810

33:                                               ; preds = %27
  %34 = load ptr, ptr %11, align 8, !dbg !2811
  %35 = getelementptr inbounds nuw %struct.object, ptr %34, i32 0, i32 8, !dbg !2814
  %36 = load i8, ptr %35, align 1, !dbg !2814
  %37 = zext i8 %36 to i32, !dbg !2811
  %38 = and i32 %37, 64, !dbg !2815
  %39 = icmp ne i32 %38, 0, !dbg !2811
  br i1 %39, label %40, label %42, !dbg !2811

40:                                               ; preds = %33
  %41 = load i32, ptr %10, align 4, !dbg !2816
  store i32 %41, ptr %5, align 4, !dbg !2817
  br label %139, !dbg !2817

42:                                               ; preds = %33
  br label %43, !dbg !2818

43:                                               ; preds = %42, %27
  %44 = load ptr, ptr %11, align 8, !dbg !2819
  %45 = getelementptr inbounds nuw %struct.object, ptr %44, i32 0, i32 1, !dbg !2821
  %46 = load i8, ptr %45, align 4, !dbg !2821
  %47 = zext i8 %46 to i32, !dbg !2819
  %48 = load i32, ptr %7, align 4, !dbg !2822
  %49 = icmp eq i32 %47, %48, !dbg !2823
  br i1 %49, label %50, label %106, !dbg !2823

50:                                               ; preds = %43
  %51 = load ptr, ptr %11, align 8, !dbg !2824
  %52 = getelementptr inbounds nuw %struct.object, ptr %51, i32 0, i32 1, !dbg !2827
  %53 = load i8, ptr %52, align 4, !dbg !2827
  %54 = zext i8 %53 to i32, !dbg !2824
  %55 = icmp eq i32 %54, 2, !dbg !2828
  br i1 %55, label %56, label %66, !dbg !2829

56:                                               ; preds = %50
  %57 = load ptr, ptr %11, align 8, !dbg !2830
  %58 = getelementptr inbounds nuw %struct.object, ptr %57, i32 0, i32 2, !dbg !2831
  %59 = load i8, ptr %58, align 1, !dbg !2831
  %60 = zext i8 %59 to i64, !dbg !2832
  %61 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %60, !dbg !2832
  %62 = getelementptr inbounds nuw %struct.robot_info, ptr %61, i32 0, i32 37, !dbg !2833
  %63 = load i8, ptr %62, align 1, !dbg !2833
  %64 = icmp ne i8 %63, 0, !dbg !2834
  br i1 %64, label %65, label %66, !dbg !2829

65:                                               ; preds = %56
  br label %105, !dbg !2829

66:                                               ; preds = %56, %50
  %67 = load i32, ptr %8, align 4, !dbg !2835
  %68 = icmp eq i32 %67, -1, !dbg !2837
  br i1 %68, label %69, label %94, !dbg !2837

69:                                               ; preds = %66
  %70 = load i32, ptr %7, align 4, !dbg !2838
  %71 = icmp eq i32 %70, 7, !dbg !2841
  br i1 %71, label %72, label %92, !dbg !2842

72:                                               ; preds = %69
  %73 = load ptr, ptr %11, align 8, !dbg !2843
  %74 = getelementptr inbounds nuw %struct.object, ptr %73, i32 0, i32 2, !dbg !2844
  %75 = load i8, ptr %74, align 1, !dbg !2844
  %76 = zext i8 %75 to i32, !dbg !2843
  %77 = icmp ne i32 %76, 4, !dbg !2845
  br i1 %77, label %78, label %92, !dbg !2846

78:                                               ; preds = %72
  %79 = load ptr, ptr %11, align 8, !dbg !2847
  %80 = getelementptr inbounds nuw %struct.object, ptr %79, i32 0, i32 2, !dbg !2848
  %81 = load i8, ptr %80, align 1, !dbg !2848
  %82 = zext i8 %81 to i32, !dbg !2847
  %83 = icmp ne i32 %82, 6, !dbg !2849
  br i1 %83, label %84, label %92, !dbg !2850

84:                                               ; preds = %78
  %85 = load ptr, ptr %11, align 8, !dbg !2851
  %86 = getelementptr inbounds nuw %struct.object, ptr %85, i32 0, i32 2, !dbg !2852
  %87 = load i8, ptr %86, align 1, !dbg !2852
  %88 = zext i8 %87 to i32, !dbg !2851
  %89 = icmp ne i32 %88, 5, !dbg !2853
  br i1 %89, label %90, label %92, !dbg !2850

90:                                               ; preds = %84
  %91 = load i32, ptr %10, align 4, !dbg !2854
  store i32 %91, ptr %5, align 4, !dbg !2855
  br label %139, !dbg !2855

92:                                               ; preds = %84, %78, %72, %69
  %93 = load i32, ptr %10, align 4, !dbg !2856
  store i32 %93, ptr %5, align 4, !dbg !2857
  br label %139, !dbg !2857

94:                                               ; preds = %66
  %95 = load ptr, ptr %11, align 8, !dbg !2858
  %96 = getelementptr inbounds nuw %struct.object, ptr %95, i32 0, i32 2, !dbg !2860
  %97 = load i8, ptr %96, align 1, !dbg !2860
  %98 = zext i8 %97 to i32, !dbg !2858
  %99 = load i32, ptr %8, align 4, !dbg !2861
  %100 = icmp eq i32 %98, %99, !dbg !2862
  br i1 %100, label %101, label %103, !dbg !2862

101:                                              ; preds = %94
  %102 = load i32, ptr %10, align 4, !dbg !2863
  store i32 %102, ptr %5, align 4, !dbg !2864
  br label %139, !dbg !2864

103:                                              ; preds = %94
  br label %104

104:                                              ; preds = %103
  br label %105

105:                                              ; preds = %104, %65
  br label %106, !dbg !2865

106:                                              ; preds = %105, %43
  %107 = load i32, ptr %7, align 4, !dbg !2866
  %108 = icmp eq i32 %107, 7, !dbg !2868
  br i1 %108, label %109, label %132, !dbg !2868

109:                                              ; preds = %106
  %110 = load ptr, ptr %11, align 8, !dbg !2869
  %111 = getelementptr inbounds nuw %struct.object, ptr %110, i32 0, i32 18, !dbg !2871
  %112 = load i8, ptr %111, align 2, !dbg !2871
  %113 = icmp ne i8 %112, 0, !dbg !2869
  br i1 %113, label %114, label %131, !dbg !2869

114:                                              ; preds = %109
  %115 = load ptr, ptr %11, align 8, !dbg !2872
  %116 = getelementptr inbounds nuw %struct.object, ptr %115, i32 0, i32 16, !dbg !2874
  %117 = load i8, ptr %116, align 4, !dbg !2874
  %118 = sext i8 %117 to i32, !dbg !2872
  %119 = icmp eq i32 %118, 7, !dbg !2875
  br i1 %119, label %120, label %130, !dbg !2875

120:                                              ; preds = %114
  %121 = load ptr, ptr %11, align 8, !dbg !2876
  %122 = getelementptr inbounds nuw %struct.object, ptr %121, i32 0, i32 17, !dbg !2878
  %123 = load i8, ptr %122, align 1, !dbg !2878
  %124 = sext i8 %123 to i32, !dbg !2876
  %125 = load i32, ptr %8, align 4, !dbg !2879
  %126 = icmp eq i32 %124, %125, !dbg !2880
  br i1 %126, label %127, label %129, !dbg !2880

127:                                              ; preds = %120
  %128 = load i32, ptr %10, align 4, !dbg !2881
  store i32 %128, ptr %5, align 4, !dbg !2882
  br label %139, !dbg !2882

129:                                              ; preds = %120
  br label %130, !dbg !2879

130:                                              ; preds = %129, %114
  br label %131, !dbg !2883

131:                                              ; preds = %130, %109
  br label %132, !dbg !2871

132:                                              ; preds = %131, %106
  %133 = load ptr, ptr %11, align 8, !dbg !2884
  %134 = getelementptr inbounds nuw %struct.object, ptr %133, i32 0, i32 3, !dbg !2885
  %135 = load i16, ptr %134, align 2, !dbg !2885
  %136 = sext i16 %135 to i32, !dbg !2884
  store i32 %136, ptr %10, align 4, !dbg !2886
  br label %24, !dbg !2672, !llvm.loop !2887

137:                                              ; preds = %24
  br label %138, !dbg !2889

138:                                              ; preds = %137, %4
  store i32 -1, ptr %5, align 4, !dbg !2890
  br label %139, !dbg !2890

139:                                              ; preds = %138, %127, %101, %92, %90, %40
  %140 = load i32, ptr %5, align 4, !dbg !2891
  ret i32 %140, !dbg !2891
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z14exists_in_mineiiii(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #1 !dbg !2892 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca [900 x i16], align 2
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store i32 %0, ptr %6, align 4
    #dbg_declare(ptr %6, !2893, !DIExpression(), !2894)
  store i32 %1, ptr %7, align 4
    #dbg_declare(ptr %7, !2895, !DIExpression(), !2896)
  store i32 %2, ptr %8, align 4
    #dbg_declare(ptr %8, !2897, !DIExpression(), !2898)
  store i32 %3, ptr %9, align 4
    #dbg_declare(ptr %9, !2899, !DIExpression(), !2900)
    #dbg_declare(ptr %10, !2901, !DIExpression(), !2902)
    #dbg_declare(ptr %11, !2903, !DIExpression(), !2904)
    #dbg_declare(ptr %12, !2905, !DIExpression(), !2907)
    #dbg_declare(ptr %13, !2908, !DIExpression(), !2909)
  %16 = load i32, ptr %6, align 4, !dbg !2910
  %17 = getelementptr inbounds [900 x i16], ptr %12, i64 0, i64 0, !dbg !2911
  call void @_Z15create_bfs_listiPsPii(i32 noundef %16, ptr noundef %17, ptr noundef %13, i32 noundef 900), !dbg !2912
  %18 = load i32, ptr %7, align 4, !dbg !2913
  %19 = icmp eq i32 %18, 1000, !dbg !2915
  br i1 %19, label %20, label %45, !dbg !2915

20:                                               ; preds = %4
  store i32 0, ptr %10, align 4, !dbg !2916
  br label %21, !dbg !2919

21:                                               ; preds = %41, %20
  %22 = load i32, ptr %10, align 4, !dbg !2920
  %23 = load i32, ptr %13, align 4, !dbg !2922
  %24 = icmp slt i32 %22, %23, !dbg !2923
  br i1 %24, label %25, label %44, !dbg !2924

25:                                               ; preds = %21
  %26 = load i32, ptr %10, align 4, !dbg !2925
  %27 = sext i32 %26 to i64, !dbg !2927
  %28 = getelementptr inbounds [900 x i16], ptr %12, i64 0, i64 %27, !dbg !2927
  %29 = load i16, ptr %28, align 2, !dbg !2927
  %30 = sext i16 %29 to i32, !dbg !2927
  store i32 %30, ptr %11, align 4, !dbg !2928
  %31 = load i32, ptr %11, align 4, !dbg !2929
  %32 = sext i32 %31 to i64, !dbg !2931
  %33 = getelementptr inbounds [0 x %struct.segment2], ptr @Segment2s, i64 0, i64 %32, !dbg !2931
  %34 = getelementptr inbounds nuw %struct.segment2, ptr %33, i32 0, i32 0, !dbg !2932
  %35 = load i8, ptr %34, align 4, !dbg !2932
  %36 = zext i8 %35 to i32, !dbg !2931
  %37 = icmp eq i32 %36, 1, !dbg !2933
  br i1 %37, label %38, label %40, !dbg !2933

38:                                               ; preds = %25
  %39 = load i32, ptr %11, align 4, !dbg !2934
  store i32 %39, ptr %5, align 4, !dbg !2935
  br label %112, !dbg !2935

40:                                               ; preds = %25
  br label %41, !dbg !2936

41:                                               ; preds = %40
  %42 = load i32, ptr %10, align 4, !dbg !2937
  %43 = add nsw i32 %42, 1, !dbg !2937
  store i32 %43, ptr %10, align 4, !dbg !2937
  br label %21, !dbg !2938, !llvm.loop !2939

44:                                               ; preds = %21
  br label %70, !dbg !2941

45:                                               ; preds = %4
  store i32 0, ptr %10, align 4, !dbg !2942
  br label %46, !dbg !2945

46:                                               ; preds = %66, %45
  %47 = load i32, ptr %10, align 4, !dbg !2946
  %48 = load i32, ptr %13, align 4, !dbg !2948
  %49 = icmp slt i32 %47, %48, !dbg !2949
  br i1 %49, label %50, label %69, !dbg !2950

50:                                               ; preds = %46
    #dbg_declare(ptr %14, !2951, !DIExpression(), !2953)
  %51 = load i32, ptr %10, align 4, !dbg !2954
  %52 = sext i32 %51 to i64, !dbg !2955
  %53 = getelementptr inbounds [900 x i16], ptr %12, i64 0, i64 %52, !dbg !2955
  %54 = load i16, ptr %53, align 2, !dbg !2955
  %55 = sext i16 %54 to i32, !dbg !2955
  store i32 %55, ptr %11, align 4, !dbg !2956
  %56 = load i32, ptr %11, align 4, !dbg !2957
  %57 = load i32, ptr %7, align 4, !dbg !2958
  %58 = load i32, ptr %8, align 4, !dbg !2959
  %59 = load i32, ptr %9, align 4, !dbg !2960
  %60 = call noundef i32 @_Z16exists_in_mine_2iiii(i32 noundef %56, i32 noundef %57, i32 noundef %58, i32 noundef %59), !dbg !2961
  store i32 %60, ptr %14, align 4, !dbg !2962
  %61 = load i32, ptr %14, align 4, !dbg !2963
  %62 = icmp ne i32 %61, -1, !dbg !2965
  br i1 %62, label %63, label %65, !dbg !2965

63:                                               ; preds = %50
  %64 = load i32, ptr %14, align 4, !dbg !2966
  store i32 %64, ptr %5, align 4, !dbg !2967
  br label %112, !dbg !2967

65:                                               ; preds = %50
  br label %66, !dbg !2968

66:                                               ; preds = %65
  %67 = load i32, ptr %10, align 4, !dbg !2969
  %68 = add nsw i32 %67, 1, !dbg !2969
  store i32 %68, ptr %10, align 4, !dbg !2969
  br label %46, !dbg !2970, !llvm.loop !2971

69:                                               ; preds = %46
  br label %70

70:                                               ; preds = %69, %44
  %71 = load i32, ptr %7, align 4, !dbg !2973
  %72 = icmp eq i32 %71, 1000, !dbg !2975
  br i1 %72, label %73, label %92, !dbg !2975

73:                                               ; preds = %70
  store i32 0, ptr %11, align 4, !dbg !2976
  br label %74, !dbg !2979

74:                                               ; preds = %88, %73
  %75 = load i32, ptr %11, align 4, !dbg !2980
  %76 = load i32, ptr @Highest_segment_index, align 4, !dbg !2982
  %77 = icmp sle i32 %75, %76, !dbg !2983
  br i1 %77, label %78, label %91, !dbg !2984

78:                                               ; preds = %74
  %79 = load i32, ptr %11, align 4, !dbg !2985
  %80 = sext i32 %79 to i64, !dbg !2987
  %81 = getelementptr inbounds [0 x %struct.segment2], ptr @Segment2s, i64 0, i64 %80, !dbg !2987
  %82 = getelementptr inbounds nuw %struct.segment2, ptr %81, i32 0, i32 0, !dbg !2988
  %83 = load i8, ptr %82, align 4, !dbg !2988
  %84 = zext i8 %83 to i32, !dbg !2987
  %85 = icmp eq i32 %84, 1, !dbg !2989
  br i1 %85, label %86, label %87, !dbg !2989

86:                                               ; preds = %78
  store i32 -2, ptr %5, align 4, !dbg !2990
  br label %112, !dbg !2990

87:                                               ; preds = %78
  br label %88, !dbg !2991

88:                                               ; preds = %87
  %89 = load i32, ptr %11, align 4, !dbg !2992
  %90 = add nsw i32 %89, 1, !dbg !2992
  store i32 %90, ptr %11, align 4, !dbg !2992
  br label %74, !dbg !2993, !llvm.loop !2994

91:                                               ; preds = %74
  br label %111, !dbg !2996

92:                                               ; preds = %70
  store i32 0, ptr %11, align 4, !dbg !2997
  br label %93, !dbg !3000

93:                                               ; preds = %107, %92
  %94 = load i32, ptr %11, align 4, !dbg !3001
  %95 = load i32, ptr @Highest_segment_index, align 4, !dbg !3003
  %96 = icmp sle i32 %94, %95, !dbg !3004
  br i1 %96, label %97, label %110, !dbg !3005

97:                                               ; preds = %93
    #dbg_declare(ptr %15, !3006, !DIExpression(), !3008)
  %98 = load i32, ptr %11, align 4, !dbg !3009
  %99 = load i32, ptr %7, align 4, !dbg !3010
  %100 = load i32, ptr %8, align 4, !dbg !3011
  %101 = load i32, ptr %9, align 4, !dbg !3012
  %102 = call noundef i32 @_Z16exists_in_mine_2iiii(i32 noundef %98, i32 noundef %99, i32 noundef %100, i32 noundef %101), !dbg !3013
  store i32 %102, ptr %15, align 4, !dbg !3014
  %103 = load i32, ptr %15, align 4, !dbg !3015
  %104 = icmp ne i32 %103, -1, !dbg !3017
  br i1 %104, label %105, label %106, !dbg !3017

105:                                              ; preds = %97
  store i32 -2, ptr %5, align 4, !dbg !3018
  br label %112, !dbg !3018

106:                                              ; preds = %97
  br label %107, !dbg !3019

107:                                              ; preds = %106
  %108 = load i32, ptr %11, align 4, !dbg !3020
  %109 = add nsw i32 %108, 1, !dbg !3020
  store i32 %109, ptr %11, align 4, !dbg !3020
  br label %93, !dbg !3021, !llvm.loop !3022

110:                                              ; preds = %93
  br label %111

111:                                              ; preds = %110, %91
  store i32 -1, ptr %5, align 4, !dbg !3024
  br label %112, !dbg !3024

112:                                              ; preds = %111, %105, %86, %63, %38
  %113 = load i32, ptr %5, align 4, !dbg !3025
  ret i32 %113, !dbg !3025
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define noundef i32 @_Z17find_exit_segmentv() #0 !dbg !3026 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
    #dbg_declare(ptr %2, !3027, !DIExpression(), !3028)
    #dbg_declare(ptr %3, !3029, !DIExpression(), !3030)
  store i32 0, ptr %2, align 4, !dbg !3031
  br label %4, !dbg !3033

4:                                                ; preds = %30, %0
  %5 = load i32, ptr %2, align 4, !dbg !3034
  %6 = load i32, ptr @Highest_segment_index, align 4, !dbg !3036
  %7 = icmp sle i32 %5, %6, !dbg !3037
  br i1 %7, label %8, label %33, !dbg !3038

8:                                                ; preds = %4
  store i32 0, ptr %3, align 4, !dbg !3039
  br label %9, !dbg !3041

9:                                                ; preds = %26, %8
  %10 = load i32, ptr %3, align 4, !dbg !3042
  %11 = icmp slt i32 %10, 6, !dbg !3044
  br i1 %11, label %12, label %29, !dbg !3045

12:                                               ; preds = %9
  %13 = load i32, ptr %2, align 4, !dbg !3046
  %14 = sext i32 %13 to i64, !dbg !3048
  %15 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %14, !dbg !3048
  %16 = getelementptr inbounds nuw %struct.segment, ptr %15, i32 0, i32 1, !dbg !3049
  %17 = load i32, ptr %3, align 4, !dbg !3050
  %18 = sext i32 %17 to i64, !dbg !3048
  %19 = getelementptr inbounds [6 x i16], ptr %16, i64 0, i64 %18, !dbg !3048
  %20 = load i16, ptr %19, align 2, !dbg !3048
  %21 = sext i16 %20 to i32, !dbg !3048
  %22 = icmp eq i32 %21, -2, !dbg !3051
  br i1 %22, label %23, label %25, !dbg !3051

23:                                               ; preds = %12
  %24 = load i32, ptr %2, align 4, !dbg !3052
  store i32 %24, ptr %1, align 4, !dbg !3054
  br label %34, !dbg !3054

25:                                               ; preds = %12
  br label %26, !dbg !3055

26:                                               ; preds = %25
  %27 = load i32, ptr %3, align 4, !dbg !3056
  %28 = add nsw i32 %27, 1, !dbg !3056
  store i32 %28, ptr %3, align 4, !dbg !3056
  br label %9, !dbg !3057, !llvm.loop !3058

29:                                               ; preds = %9
  br label %30, !dbg !3059

30:                                               ; preds = %29
  %31 = load i32, ptr %2, align 4, !dbg !3060
  %32 = add nsw i32 %31, 1, !dbg !3060
  store i32 %32, ptr %2, align 4, !dbg !3060
  br label %4, !dbg !3061, !llvm.loop !3062

33:                                               ; preds = %4
  store i32 -1, ptr %1, align 4, !dbg !3064
  br label %34, !dbg !3064

34:                                               ; preds = %33, %23
  %35 = load i32, ptr %1, align 4, !dbg !3065
  ret i32 %35, !dbg !3065
}

; Function Attrs: nounwind
declare ptr @strncpy(ptr noundef, ptr noundef, i64 noundef) #4

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z26escort_create_path_to_goalP6object(ptr noundef %0) #1 !dbg !3066 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !3069, !DIExpression(), !3070)
    #dbg_declare(ptr %3, !3071, !DIExpression(), !3072)
  store i32 -1, ptr %3, align 4, !dbg !3072
    #dbg_declare(ptr %4, !3073, !DIExpression(), !3074)
  %9 = load ptr, ptr %2, align 8, !dbg !3075
  %10 = ptrtoint ptr %9 to i64, !dbg !3076
  %11 = sub i64 %10, ptrtoint (ptr @Objects to i64), !dbg !3076
  %12 = sdiv exact i64 %11, 268, !dbg !3076
  %13 = trunc i64 %12 to i32, !dbg !3075
  store i32 %13, ptr %4, align 4, !dbg !3074
    #dbg_declare(ptr %5, !3077, !DIExpression(), !3079)
  %14 = load ptr, ptr %2, align 8, !dbg !3080
  %15 = getelementptr inbounds nuw %struct.object, ptr %14, i32 0, i32 22, !dbg !3081
  store ptr %15, ptr %5, align 8, !dbg !3079
    #dbg_declare(ptr %6, !3082, !DIExpression(), !3107)
  %16 = load i32, ptr %4, align 4, !dbg !3108
  %17 = sext i32 %16 to i64, !dbg !3109
  %18 = getelementptr inbounds [350 x %struct.ai_local], ptr @Ai_local_info, i64 0, i64 %17, !dbg !3109
  store ptr %18, ptr %6, align 8, !dbg !3107
  %19 = load i32, ptr @Escort_special_goal, align 4, !dbg !3110
  %20 = icmp ne i32 %19, -1, !dbg !3112
  br i1 %20, label %21, label %23, !dbg !3112

21:                                               ; preds = %1
  %22 = load i32, ptr @Escort_special_goal, align 4, !dbg !3113
  store i32 %22, ptr @Escort_goal_object, align 4, !dbg !3114
  br label %23, !dbg !3115

23:                                               ; preds = %21, %1
  store i32 -1, ptr @Escort_kill_object, align 4, !dbg !3116
  %24 = load i32, ptr @Looking_for_marker, align 4, !dbg !3117
  %25 = icmp ne i32 %24, -1, !dbg !3119
  br i1 %25, label %26, label %44, !dbg !3119

26:                                               ; preds = %23
  %27 = load ptr, ptr %2, align 8, !dbg !3120
  %28 = getelementptr inbounds nuw %struct.object, ptr %27, i32 0, i32 9, !dbg !3122
  %29 = load i16, ptr %28, align 2, !dbg !3122
  %30 = sext i16 %29 to i32, !dbg !3120
  %31 = load i32, ptr @Escort_goal_object, align 4, !dbg !3123
  %32 = sub nsw i32 %31, 16, !dbg !3124
  %33 = call noundef i32 @_Z14exists_in_mineiiii(i32 noundef %30, i32 noundef 15, i32 noundef %32, i32 noundef -1), !dbg !3125
  store i32 %33, ptr @Escort_goal_index, align 4, !dbg !3126
  %34 = load i32, ptr @Escort_goal_index, align 4, !dbg !3127
  %35 = icmp sgt i32 %34, -1, !dbg !3129
  br i1 %35, label %36, label %43, !dbg !3129

36:                                               ; preds = %26
  %37 = load i32, ptr @Escort_goal_index, align 4, !dbg !3130
  %38 = sext i32 %37 to i64, !dbg !3131
  %39 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %38, !dbg !3131
  %40 = getelementptr inbounds nuw %struct.object, ptr %39, i32 0, i32 9, !dbg !3132
  %41 = load i16, ptr %40, align 2, !dbg !3132
  %42 = sext i16 %41 to i32, !dbg !3131
  store i32 %42, ptr %3, align 4, !dbg !3133
  br label %43, !dbg !3134

43:                                               ; preds = %36, %26
  br label %241, !dbg !3135

44:                                               ; preds = %23
  %45 = load i32, ptr @Escort_goal_object, align 4, !dbg !3136
  switch i32 %45, label %239 [
    i32 1, label %46
    i32 2, label %62
    i32 3, label %78
    i32 4, label %94
    i32 5, label %110
    i32 14, label %110
    i32 6, label %113
    i32 7, label %129
    i32 8, label %136
    i32 9, label %152
    i32 10, label %168
    i32 11, label %184
    i32 12, label %200
    i32 13, label %216
    i32 15, label %218
  ], !dbg !3138

46:                                               ; preds = %44
  %47 = load ptr, ptr %2, align 8, !dbg !3139
  %48 = getelementptr inbounds nuw %struct.object, ptr %47, i32 0, i32 9, !dbg !3141
  %49 = load i16, ptr %48, align 2, !dbg !3141
  %50 = sext i16 %49 to i32, !dbg !3139
  %51 = call noundef i32 @_Z14exists_in_mineiiii(i32 noundef %50, i32 noundef 7, i32 noundef 4, i32 noundef -1), !dbg !3142
  store i32 %51, ptr @Escort_goal_index, align 4, !dbg !3143
  %52 = load i32, ptr @Escort_goal_index, align 4, !dbg !3144
  %53 = icmp sgt i32 %52, -1, !dbg !3146
  br i1 %53, label %54, label %61, !dbg !3146

54:                                               ; preds = %46
  %55 = load i32, ptr @Escort_goal_index, align 4, !dbg !3147
  %56 = sext i32 %55 to i64, !dbg !3148
  %57 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %56, !dbg !3148
  %58 = getelementptr inbounds nuw %struct.object, ptr %57, i32 0, i32 9, !dbg !3149
  %59 = load i16, ptr %58, align 2, !dbg !3149
  %60 = sext i16 %59 to i32, !dbg !3148
  store i32 %60, ptr %3, align 4, !dbg !3150
  br label %61, !dbg !3151

61:                                               ; preds = %54, %46
  br label %240, !dbg !3152

62:                                               ; preds = %44
  %63 = load ptr, ptr %2, align 8, !dbg !3153
  %64 = getelementptr inbounds nuw %struct.object, ptr %63, i32 0, i32 9, !dbg !3154
  %65 = load i16, ptr %64, align 2, !dbg !3154
  %66 = sext i16 %65 to i32, !dbg !3153
  %67 = call noundef i32 @_Z14exists_in_mineiiii(i32 noundef %66, i32 noundef 7, i32 noundef 6, i32 noundef -1), !dbg !3155
  store i32 %67, ptr @Escort_goal_index, align 4, !dbg !3156
  %68 = load i32, ptr @Escort_goal_index, align 4, !dbg !3157
  %69 = icmp sgt i32 %68, -1, !dbg !3159
  br i1 %69, label %70, label %77, !dbg !3159

70:                                               ; preds = %62
  %71 = load i32, ptr @Escort_goal_index, align 4, !dbg !3160
  %72 = sext i32 %71 to i64, !dbg !3161
  %73 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %72, !dbg !3161
  %74 = getelementptr inbounds nuw %struct.object, ptr %73, i32 0, i32 9, !dbg !3162
  %75 = load i16, ptr %74, align 2, !dbg !3162
  %76 = sext i16 %75 to i32, !dbg !3161
  store i32 %76, ptr %3, align 4, !dbg !3163
  br label %77, !dbg !3164

77:                                               ; preds = %70, %62
  br label %240, !dbg !3165

78:                                               ; preds = %44
  %79 = load ptr, ptr %2, align 8, !dbg !3166
  %80 = getelementptr inbounds nuw %struct.object, ptr %79, i32 0, i32 9, !dbg !3167
  %81 = load i16, ptr %80, align 2, !dbg !3167
  %82 = sext i16 %81 to i32, !dbg !3166
  %83 = call noundef i32 @_Z14exists_in_mineiiii(i32 noundef %82, i32 noundef 7, i32 noundef 5, i32 noundef -1), !dbg !3168
  store i32 %83, ptr @Escort_goal_index, align 4, !dbg !3169
  %84 = load i32, ptr @Escort_goal_index, align 4, !dbg !3170
  %85 = icmp sgt i32 %84, -1, !dbg !3172
  br i1 %85, label %86, label %93, !dbg !3172

86:                                               ; preds = %78
  %87 = load i32, ptr @Escort_goal_index, align 4, !dbg !3173
  %88 = sext i32 %87 to i64, !dbg !3174
  %89 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %88, !dbg !3174
  %90 = getelementptr inbounds nuw %struct.object, ptr %89, i32 0, i32 9, !dbg !3175
  %91 = load i16, ptr %90, align 2, !dbg !3175
  %92 = sext i16 %91 to i32, !dbg !3174
  store i32 %92, ptr %3, align 4, !dbg !3176
  br label %93, !dbg !3177

93:                                               ; preds = %86, %78
  br label %240, !dbg !3178

94:                                               ; preds = %44
  %95 = load ptr, ptr %2, align 8, !dbg !3179
  %96 = getelementptr inbounds nuw %struct.object, ptr %95, i32 0, i32 9, !dbg !3180
  %97 = load i16, ptr %96, align 2, !dbg !3180
  %98 = sext i16 %97 to i32, !dbg !3179
  %99 = call noundef i32 @_Z14exists_in_mineiiii(i32 noundef %98, i32 noundef 9, i32 noundef -1, i32 noundef -1), !dbg !3181
  store i32 %99, ptr @Escort_goal_index, align 4, !dbg !3182
  %100 = load i32, ptr @Escort_goal_index, align 4, !dbg !3183
  %101 = icmp sgt i32 %100, -1, !dbg !3185
  br i1 %101, label %102, label %109, !dbg !3185

102:                                              ; preds = %94
  %103 = load i32, ptr @Escort_goal_index, align 4, !dbg !3186
  %104 = sext i32 %103 to i64, !dbg !3187
  %105 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %104, !dbg !3187
  %106 = getelementptr inbounds nuw %struct.object, ptr %105, i32 0, i32 9, !dbg !3188
  %107 = load i16, ptr %106, align 2, !dbg !3188
  %108 = sext i16 %107 to i32, !dbg !3187
  store i32 %108, ptr %3, align 4, !dbg !3189
  br label %109, !dbg !3190

109:                                              ; preds = %102, %94
  br label %240, !dbg !3191

110:                                              ; preds = %44, %44
  %111 = call noundef i32 @_Z17find_exit_segmentv(), !dbg !3192
  store i32 %111, ptr %3, align 4, !dbg !3193
  %112 = load i32, ptr %3, align 4, !dbg !3194
  store i32 %112, ptr @Escort_goal_index, align 4, !dbg !3195
  br label %240, !dbg !3196

113:                                              ; preds = %44
  %114 = load ptr, ptr %2, align 8, !dbg !3197
  %115 = getelementptr inbounds nuw %struct.object, ptr %114, i32 0, i32 9, !dbg !3198
  %116 = load i16, ptr %115, align 2, !dbg !3198
  %117 = sext i16 %116 to i32, !dbg !3197
  %118 = call noundef i32 @_Z14exists_in_mineiiii(i32 noundef %117, i32 noundef 7, i32 noundef 1, i32 noundef -1), !dbg !3199
  store i32 %118, ptr @Escort_goal_index, align 4, !dbg !3200
  %119 = load i32, ptr @Escort_goal_index, align 4, !dbg !3201
  %120 = icmp sgt i32 %119, -1, !dbg !3203
  br i1 %120, label %121, label %128, !dbg !3203

121:                                              ; preds = %113
  %122 = load i32, ptr @Escort_goal_index, align 4, !dbg !3204
  %123 = sext i32 %122 to i64, !dbg !3205
  %124 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %123, !dbg !3205
  %125 = getelementptr inbounds nuw %struct.object, ptr %124, i32 0, i32 9, !dbg !3206
  %126 = load i16, ptr %125, align 2, !dbg !3206
  %127 = sext i16 %126 to i32, !dbg !3205
  store i32 %127, ptr %3, align 4, !dbg !3207
  br label %128, !dbg !3208

128:                                              ; preds = %121, %113
  br label %240, !dbg !3209

129:                                              ; preds = %44
  %130 = load ptr, ptr %2, align 8, !dbg !3210
  %131 = getelementptr inbounds nuw %struct.object, ptr %130, i32 0, i32 9, !dbg !3211
  %132 = load i16, ptr %131, align 2, !dbg !3211
  %133 = sext i16 %132 to i32, !dbg !3210
  %134 = call noundef i32 @_Z14exists_in_mineiiii(i32 noundef %133, i32 noundef 1000, i32 noundef -1, i32 noundef -1), !dbg !3212
  store i32 %134, ptr %3, align 4, !dbg !3213
  %135 = load i32, ptr %3, align 4, !dbg !3214
  store i32 %135, ptr @Escort_goal_index, align 4, !dbg !3215
  br label %240, !dbg !3216

136:                                              ; preds = %44
  %137 = load ptr, ptr %2, align 8, !dbg !3217
  %138 = getelementptr inbounds nuw %struct.object, ptr %137, i32 0, i32 9, !dbg !3218
  %139 = load i16, ptr %138, align 2, !dbg !3218
  %140 = sext i16 %139 to i32, !dbg !3217
  %141 = call noundef i32 @_Z14exists_in_mineiiii(i32 noundef %140, i32 noundef 7, i32 noundef 2, i32 noundef -1), !dbg !3219
  store i32 %141, ptr @Escort_goal_index, align 4, !dbg !3220
  %142 = load i32, ptr @Escort_goal_index, align 4, !dbg !3221
  %143 = icmp sgt i32 %142, -1, !dbg !3223
  br i1 %143, label %144, label %151, !dbg !3223

144:                                              ; preds = %136
  %145 = load i32, ptr @Escort_goal_index, align 4, !dbg !3224
  %146 = sext i32 %145 to i64, !dbg !3225
  %147 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %146, !dbg !3225
  %148 = getelementptr inbounds nuw %struct.object, ptr %147, i32 0, i32 9, !dbg !3226
  %149 = load i16, ptr %148, align 2, !dbg !3226
  %150 = sext i16 %149 to i32, !dbg !3225
  store i32 %150, ptr %3, align 4, !dbg !3227
  br label %151, !dbg !3228

151:                                              ; preds = %144, %136
  br label %240, !dbg !3229

152:                                              ; preds = %44
  %153 = load ptr, ptr %2, align 8, !dbg !3230
  %154 = getelementptr inbounds nuw %struct.object, ptr %153, i32 0, i32 9, !dbg !3231
  %155 = load i16, ptr %154, align 2, !dbg !3231
  %156 = sext i16 %155 to i32, !dbg !3230
  %157 = call noundef i32 @_Z14exists_in_mineiiii(i32 noundef %156, i32 noundef 7, i32 noundef -1, i32 noundef -1), !dbg !3232
  store i32 %157, ptr @Escort_goal_index, align 4, !dbg !3233
  %158 = load i32, ptr @Escort_goal_index, align 4, !dbg !3234
  %159 = icmp sgt i32 %158, -1, !dbg !3236
  br i1 %159, label %160, label %167, !dbg !3236

160:                                              ; preds = %152
  %161 = load i32, ptr @Escort_goal_index, align 4, !dbg !3237
  %162 = sext i32 %161 to i64, !dbg !3238
  %163 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %162, !dbg !3238
  %164 = getelementptr inbounds nuw %struct.object, ptr %163, i32 0, i32 9, !dbg !3239
  %165 = load i16, ptr %164, align 2, !dbg !3239
  %166 = sext i16 %165 to i32, !dbg !3238
  store i32 %166, ptr %3, align 4, !dbg !3240
  br label %167, !dbg !3241

167:                                              ; preds = %160, %152
  br label %240, !dbg !3242

168:                                              ; preds = %44
  %169 = load ptr, ptr %2, align 8, !dbg !3243
  %170 = getelementptr inbounds nuw %struct.object, ptr %169, i32 0, i32 9, !dbg !3244
  %171 = load i16, ptr %170, align 2, !dbg !3244
  %172 = sext i16 %171 to i32, !dbg !3243
  %173 = call noundef i32 @_Z14exists_in_mineiiii(i32 noundef %172, i32 noundef 2, i32 noundef -1, i32 noundef -1), !dbg !3245
  store i32 %173, ptr @Escort_goal_index, align 4, !dbg !3246
  %174 = load i32, ptr @Escort_goal_index, align 4, !dbg !3247
  %175 = icmp sgt i32 %174, -1, !dbg !3249
  br i1 %175, label %176, label %183, !dbg !3249

176:                                              ; preds = %168
  %177 = load i32, ptr @Escort_goal_index, align 4, !dbg !3250
  %178 = sext i32 %177 to i64, !dbg !3251
  %179 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %178, !dbg !3251
  %180 = getelementptr inbounds nuw %struct.object, ptr %179, i32 0, i32 9, !dbg !3252
  %181 = load i16, ptr %180, align 2, !dbg !3252
  %182 = sext i16 %181 to i32, !dbg !3251
  store i32 %182, ptr %3, align 4, !dbg !3253
  br label %183, !dbg !3254

183:                                              ; preds = %176, %168
  br label %240, !dbg !3255

184:                                              ; preds = %44
  %185 = load ptr, ptr %2, align 8, !dbg !3256
  %186 = getelementptr inbounds nuw %struct.object, ptr %185, i32 0, i32 9, !dbg !3257
  %187 = load i16, ptr %186, align 2, !dbg !3257
  %188 = sext i16 %187 to i32, !dbg !3256
  %189 = call noundef i32 @_Z14exists_in_mineiiii(i32 noundef %188, i32 noundef 3, i32 noundef -1, i32 noundef -1), !dbg !3258
  store i32 %189, ptr @Escort_goal_index, align 4, !dbg !3259
  %190 = load i32, ptr @Escort_goal_index, align 4, !dbg !3260
  %191 = icmp sgt i32 %190, -1, !dbg !3262
  br i1 %191, label %192, label %199, !dbg !3262

192:                                              ; preds = %184
  %193 = load i32, ptr @Escort_goal_index, align 4, !dbg !3263
  %194 = sext i32 %193 to i64, !dbg !3264
  %195 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %194, !dbg !3264
  %196 = getelementptr inbounds nuw %struct.object, ptr %195, i32 0, i32 9, !dbg !3265
  %197 = load i16, ptr %196, align 2, !dbg !3265
  %198 = sext i16 %197 to i32, !dbg !3264
  store i32 %198, ptr %3, align 4, !dbg !3266
  br label %199, !dbg !3267

199:                                              ; preds = %192, %184
  br label %240, !dbg !3268

200:                                              ; preds = %44
  %201 = load ptr, ptr %2, align 8, !dbg !3269
  %202 = getelementptr inbounds nuw %struct.object, ptr %201, i32 0, i32 9, !dbg !3270
  %203 = load i16, ptr %202, align 2, !dbg !3270
  %204 = sext i16 %203 to i32, !dbg !3269
  %205 = call noundef i32 @_Z14exists_in_mineiiii(i32 noundef %204, i32 noundef -1, i32 noundef -1, i32 noundef 12), !dbg !3271
  store i32 %205, ptr @Escort_goal_index, align 4, !dbg !3272
  %206 = load i32, ptr @Escort_goal_index, align 4, !dbg !3273
  %207 = icmp sgt i32 %206, -1, !dbg !3275
  br i1 %207, label %208, label %215, !dbg !3275

208:                                              ; preds = %200
  %209 = load i32, ptr @Escort_goal_index, align 4, !dbg !3276
  %210 = sext i32 %209 to i64, !dbg !3277
  %211 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %210, !dbg !3277
  %212 = getelementptr inbounds nuw %struct.object, ptr %211, i32 0, i32 9, !dbg !3278
  %213 = load i16, ptr %212, align 2, !dbg !3278
  %214 = sext i16 %213 to i32, !dbg !3277
  store i32 %214, ptr %3, align 4, !dbg !3279
  br label %215, !dbg !3280

215:                                              ; preds = %208, %200
  br label %240, !dbg !3281

216:                                              ; preds = %44
  store i32 -3, ptr %3, align 4, !dbg !3282
  %217 = load i32, ptr %3, align 4, !dbg !3283
  store i32 %217, ptr @Escort_goal_index, align 4, !dbg !3284
  br label %240, !dbg !3285

218:                                              ; preds = %44
    #dbg_declare(ptr %7, !3286, !DIExpression(), !3288)
  %219 = call noundef i32 @_Z11get_boss_idv(), !dbg !3289
  store i32 %219, ptr %7, align 4, !dbg !3290
  %220 = load i32, ptr %7, align 4, !dbg !3291
  %221 = icmp ne i32 %220, -1, !dbg !3291
  %222 = zext i1 %221 to i32, !dbg !3291
  call void @_Z7_AssertiPKcS0_i(i32 noundef %222, ptr noundef @.str.46, ptr noundef @.str.24, i32 noundef 855), !dbg !3291
  %223 = load ptr, ptr %2, align 8, !dbg !3292
  %224 = getelementptr inbounds nuw %struct.object, ptr %223, i32 0, i32 9, !dbg !3293
  %225 = load i16, ptr %224, align 2, !dbg !3293
  %226 = sext i16 %225 to i32, !dbg !3292
  %227 = load i32, ptr %7, align 4, !dbg !3294
  %228 = call noundef i32 @_Z14exists_in_mineiiii(i32 noundef %226, i32 noundef 2, i32 noundef %227, i32 noundef -1), !dbg !3295
  store i32 %228, ptr @Escort_goal_index, align 4, !dbg !3296
  %229 = load i32, ptr @Escort_goal_index, align 4, !dbg !3297
  %230 = icmp sgt i32 %229, -1, !dbg !3299
  br i1 %230, label %231, label %238, !dbg !3299

231:                                              ; preds = %218
  %232 = load i32, ptr @Escort_goal_index, align 4, !dbg !3300
  %233 = sext i32 %232 to i64, !dbg !3301
  %234 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %233, !dbg !3301
  %235 = getelementptr inbounds nuw %struct.object, ptr %234, i32 0, i32 9, !dbg !3302
  %236 = load i16, ptr %235, align 2, !dbg !3302
  %237 = sext i16 %236 to i32, !dbg !3301
  store i32 %237, ptr %3, align 4, !dbg !3303
  br label %238, !dbg !3304

238:                                              ; preds = %231, %218
  br label %240, !dbg !3305

239:                                              ; preds = %44
  call void @_Z4Int3v(), !dbg !3306
  store i32 0, ptr %3, align 4, !dbg !3307
  br label %240, !dbg !3308

240:                                              ; preds = %239, %238, %216, %215, %199, %183, %167, %151, %129, %128, %110, %109, %93, %77, %61
  br label %241

241:                                              ; preds = %240, %43
  %242 = load i32, ptr @Escort_goal_index, align 4, !dbg !3309
  %243 = icmp slt i32 %242, 0, !dbg !3311
  br i1 %243, label %244, label %268, !dbg !3312

244:                                              ; preds = %241
  %245 = load i32, ptr @Escort_goal_index, align 4, !dbg !3313
  %246 = icmp ne i32 %245, -3, !dbg !3314
  br i1 %246, label %247, label %268, !dbg !3312

247:                                              ; preds = %244
  %248 = load i32, ptr @Escort_goal_index, align 4, !dbg !3315
  %249 = icmp eq i32 %248, -1, !dbg !3318
  br i1 %249, label %250, label %256, !dbg !3318

250:                                              ; preds = %247
  store i32 0, ptr @Last_buddy_message_time, align 4, !dbg !3319
  %251 = load i32, ptr @Escort_goal_object, align 4, !dbg !3321
  %252 = sub nsw i32 %251, 1, !dbg !3322
  %253 = sext i32 %252 to i64, !dbg !3323
  %254 = getelementptr inbounds [25 x ptr], ptr @Escort_goal_text, i64 0, i64 %253, !dbg !3323
  %255 = load ptr, ptr %254, align 8, !dbg !3323
  call void (ptr, ...) @_Z13buddy_messagePKcz(ptr noundef @.str.47, ptr noundef %255), !dbg !3324
  store i32 -1, ptr @Looking_for_marker, align 4, !dbg !3325
  br label %267, !dbg !3326

256:                                              ; preds = %247
  %257 = load i32, ptr @Escort_goal_index, align 4, !dbg !3327
  %258 = icmp eq i32 %257, -2, !dbg !3329
  br i1 %258, label %259, label %265, !dbg !3329

259:                                              ; preds = %256
  store i32 0, ptr @Last_buddy_message_time, align 4, !dbg !3330
  %260 = load i32, ptr @Escort_goal_object, align 4, !dbg !3332
  %261 = sub nsw i32 %260, 1, !dbg !3333
  %262 = sext i32 %261 to i64, !dbg !3334
  %263 = getelementptr inbounds [25 x ptr], ptr @Escort_goal_text, i64 0, i64 %262, !dbg !3334
  %264 = load ptr, ptr %263, align 8, !dbg !3334
  call void (ptr, ...) @_Z13buddy_messagePKcz(ptr noundef @.str.48, ptr noundef %264), !dbg !3335
  store i32 -1, ptr @Looking_for_marker, align 4, !dbg !3336
  br label %266, !dbg !3337

265:                                              ; preds = %256
  call void @_Z4Int3v(), !dbg !3338
  br label %266

266:                                              ; preds = %265, %259
  br label %267

267:                                              ; preds = %266, %250
  store i32 -1, ptr @Escort_goal_object, align 4, !dbg !3339
  store i32 -1, ptr @Escort_special_goal, align 4, !dbg !3340
  br label %381, !dbg !3341

268:                                              ; preds = %244, %241
  %269 = load i32, ptr %3, align 4, !dbg !3342
  %270 = icmp eq i32 %269, -3, !dbg !3345
  br i1 %270, label %271, label %290, !dbg !3345

271:                                              ; preds = %268
  %272 = load ptr, ptr %2, align 8, !dbg !3346
  %273 = call noundef i32 @_Z6P_Randv(), !dbg !3348
  %274 = mul nsw i32 %273, 16, !dbg !3349
  %275 = add nsw i32 16, %274, !dbg !3350
  call void @_Z21create_n_segment_pathP6objectii(ptr noundef %272, i32 noundef %275, i32 noundef -1), !dbg !3351
  %276 = load ptr, ptr %2, align 8, !dbg !3352
  %277 = load ptr, ptr %5, align 8, !dbg !3353
  %278 = getelementptr inbounds nuw %struct.ai_static, ptr %277, i32 0, i32 3, !dbg !3354
  %279 = load i16, ptr %278, align 2, !dbg !3354
  %280 = sext i16 %279 to i64, !dbg !3355
  %281 = getelementptr inbounds [2500 x %struct.point_seg], ptr @Point_segs, i64 0, i64 %280, !dbg !3355
  %282 = load ptr, ptr %5, align 8, !dbg !3356
  %283 = getelementptr inbounds nuw %struct.ai_static, ptr %282, i32 0, i32 4, !dbg !3357
  %284 = load i16, ptr %283, align 4, !dbg !3357
  %285 = sext i16 %284 to i32, !dbg !3356
  %286 = call noundef i32 @_Z11polish_pathP6objectP9point_segi(ptr noundef %276, ptr noundef %281, i32 noundef %285), !dbg !3358
  %287 = trunc i32 %286 to i16, !dbg !3358
  %288 = load ptr, ptr %5, align 8, !dbg !3359
  %289 = getelementptr inbounds nuw %struct.ai_static, ptr %288, i32 0, i32 4, !dbg !3360
  store i16 %287, ptr %289, align 4, !dbg !3361
  br label %377, !dbg !3362

290:                                              ; preds = %268
  %291 = load ptr, ptr %2, align 8, !dbg !3363
  %292 = load i32, ptr %3, align 4, !dbg !3365
  %293 = load i32, ptr @Max_escort_length, align 4, !dbg !3366
  call void @_Z22create_path_to_segmentP6objectiii(ptr noundef %291, i32 noundef %292, i32 noundef %293, i32 noundef 1), !dbg !3367
  %294 = load ptr, ptr %5, align 8, !dbg !3368
  %295 = getelementptr inbounds nuw %struct.ai_static, ptr %294, i32 0, i32 4, !dbg !3370
  %296 = load i16, ptr %295, align 4, !dbg !3370
  %297 = sext i16 %296 to i32, !dbg !3368
  %298 = icmp sgt i32 %297, 3, !dbg !3371
  br i1 %298, label %299, label %314, !dbg !3371

299:                                              ; preds = %290
  %300 = load ptr, ptr %2, align 8, !dbg !3372
  %301 = load ptr, ptr %5, align 8, !dbg !3373
  %302 = getelementptr inbounds nuw %struct.ai_static, ptr %301, i32 0, i32 3, !dbg !3374
  %303 = load i16, ptr %302, align 2, !dbg !3374
  %304 = sext i16 %303 to i64, !dbg !3375
  %305 = getelementptr inbounds [2500 x %struct.point_seg], ptr @Point_segs, i64 0, i64 %304, !dbg !3375
  %306 = load ptr, ptr %5, align 8, !dbg !3376
  %307 = getelementptr inbounds nuw %struct.ai_static, ptr %306, i32 0, i32 4, !dbg !3377
  %308 = load i16, ptr %307, align 4, !dbg !3377
  %309 = sext i16 %308 to i32, !dbg !3376
  %310 = call noundef i32 @_Z11polish_pathP6objectP9point_segi(ptr noundef %300, ptr noundef %305, i32 noundef %309), !dbg !3378
  %311 = trunc i32 %310 to i16, !dbg !3378
  %312 = load ptr, ptr %5, align 8, !dbg !3379
  %313 = getelementptr inbounds nuw %struct.ai_static, ptr %312, i32 0, i32 4, !dbg !3380
  store i16 %311, ptr %313, align 4, !dbg !3381
  br label %314, !dbg !3379

314:                                              ; preds = %299, %290
  %315 = load ptr, ptr %5, align 8, !dbg !3382
  %316 = getelementptr inbounds nuw %struct.ai_static, ptr %315, i32 0, i32 4, !dbg !3384
  %317 = load i16, ptr %316, align 4, !dbg !3384
  %318 = sext i16 %317 to i32, !dbg !3382
  %319 = icmp sgt i32 %318, 0, !dbg !3385
  br i1 %319, label %320, label %376, !dbg !3386

320:                                              ; preds = %314
  %321 = load ptr, ptr %5, align 8, !dbg !3387
  %322 = getelementptr inbounds nuw %struct.ai_static, ptr %321, i32 0, i32 3, !dbg !3388
  %323 = load i16, ptr %322, align 2, !dbg !3388
  %324 = sext i16 %323 to i32, !dbg !3387
  %325 = load ptr, ptr %5, align 8, !dbg !3389
  %326 = getelementptr inbounds nuw %struct.ai_static, ptr %325, i32 0, i32 4, !dbg !3390
  %327 = load i16, ptr %326, align 4, !dbg !3390
  %328 = sext i16 %327 to i32, !dbg !3389
  %329 = add nsw i32 %324, %328, !dbg !3391
  %330 = sub nsw i32 %329, 1, !dbg !3392
  %331 = sext i32 %330 to i64, !dbg !3393
  %332 = getelementptr inbounds [2500 x %struct.point_seg], ptr @Point_segs, i64 0, i64 %331, !dbg !3393
  %333 = getelementptr inbounds nuw %struct.point_seg, ptr %332, i32 0, i32 0, !dbg !3394
  %334 = load i32, ptr %333, align 4, !dbg !3394
  %335 = load i32, ptr %3, align 4, !dbg !3395
  %336 = icmp ne i32 %334, %335, !dbg !3396
  br i1 %336, label %337, label %376, !dbg !3386

337:                                              ; preds = %320
    #dbg_declare(ptr %8, !3397, !DIExpression(), !3399)
  store i32 0, ptr @Last_buddy_message_time, align 4, !dbg !3400
  %338 = load i32, ptr @Escort_goal_object, align 4, !dbg !3401
  %339 = sub nsw i32 %338, 1, !dbg !3402
  %340 = sext i32 %339 to i64, !dbg !3403
  %341 = getelementptr inbounds [25 x ptr], ptr @Escort_goal_text, i64 0, i64 %340, !dbg !3403
  %342 = load ptr, ptr %341, align 8, !dbg !3403
  call void (ptr, ...) @_Z13buddy_messagePKcz(ptr noundef @.str.48, ptr noundef %342), !dbg !3404
  store i32 -1, ptr @Looking_for_marker, align 4, !dbg !3405
  store i32 13, ptr @Escort_goal_object, align 4, !dbg !3406
  %343 = load ptr, ptr %2, align 8, !dbg !3407
  %344 = getelementptr inbounds nuw %struct.object, ptr %343, i32 0, i32 11, !dbg !3408
  %345 = load ptr, ptr %2, align 8, !dbg !3409
  %346 = getelementptr inbounds nuw %struct.object, ptr %345, i32 0, i32 9, !dbg !3410
  %347 = load i16, ptr %346, align 2, !dbg !3410
  %348 = sext i16 %347 to i32, !dbg !3409
  %349 = load i32, ptr @Believed_player_seg, align 4, !dbg !3411
  %350 = call noundef i32 @_Z23find_connected_distanceP10vms_vectoriS0_iii(ptr noundef %344, i32 noundef %348, ptr noundef @Believed_player_pos, i32 noundef %349, i32 noundef 100, i32 noundef 1), !dbg !3412
  store i32 %350, ptr %8, align 4, !dbg !3413
  %351 = load i32, ptr %8, align 4, !dbg !3414
  %352 = icmp sgt i32 %351, 2621440, !dbg !3416
  br i1 %352, label %353, label %356, !dbg !3416

353:                                              ; preds = %337
  %354 = load ptr, ptr %2, align 8, !dbg !3417
  %355 = load i32, ptr @Max_escort_length, align 4, !dbg !3418
  call void @_Z21create_path_to_playerP6objectii(ptr noundef %354, i32 noundef %355, i32 noundef 1), !dbg !3419
  br label %375, !dbg !3419

356:                                              ; preds = %337
  %357 = load ptr, ptr %2, align 8, !dbg !3420
  %358 = call noundef i32 @_Z6P_Randv(), !dbg !3422
  %359 = mul nsw i32 %358, 8, !dbg !3423
  %360 = add nsw i32 8, %359, !dbg !3424
  call void @_Z21create_n_segment_pathP6objectii(ptr noundef %357, i32 noundef %360, i32 noundef -1), !dbg !3425
  %361 = load ptr, ptr %2, align 8, !dbg !3426
  %362 = load ptr, ptr %5, align 8, !dbg !3427
  %363 = getelementptr inbounds nuw %struct.ai_static, ptr %362, i32 0, i32 3, !dbg !3428
  %364 = load i16, ptr %363, align 2, !dbg !3428
  %365 = sext i16 %364 to i64, !dbg !3429
  %366 = getelementptr inbounds [2500 x %struct.point_seg], ptr @Point_segs, i64 0, i64 %365, !dbg !3429
  %367 = load ptr, ptr %5, align 8, !dbg !3430
  %368 = getelementptr inbounds nuw %struct.ai_static, ptr %367, i32 0, i32 4, !dbg !3431
  %369 = load i16, ptr %368, align 4, !dbg !3431
  %370 = sext i16 %369 to i32, !dbg !3430
  %371 = call noundef i32 @_Z11polish_pathP6objectP9point_segi(ptr noundef %361, ptr noundef %366, i32 noundef %370), !dbg !3432
  %372 = trunc i32 %371 to i16, !dbg !3432
  %373 = load ptr, ptr %5, align 8, !dbg !3433
  %374 = getelementptr inbounds nuw %struct.ai_static, ptr %373, i32 0, i32 4, !dbg !3434
  store i16 %372, ptr %374, align 4, !dbg !3435
  br label %375

375:                                              ; preds = %356, %353
  br label %376, !dbg !3436

376:                                              ; preds = %375, %320, %314
  br label %377

377:                                              ; preds = %376, %271
  %378 = load ptr, ptr %6, align 8, !dbg !3437
  %379 = getelementptr inbounds nuw %struct.ai_local, ptr %378, i32 0, i32 3, !dbg !3438
  store i32 9, ptr %379, align 4, !dbg !3439
  %380 = load i32, ptr @Escort_goal_object, align 4, !dbg !3440
  call void @_Z15say_escort_goali(i32 noundef %380), !dbg !3441
  br label %381

381:                                              ; preds = %377, %267
  ret void, !dbg !3442
}

declare void @_Z21create_n_segment_pathP6objectii(ptr noundef, i32 noundef, i32 noundef) #2

declare noundef i32 @_Z6P_Randv() #2

declare noundef i32 @_Z11polish_pathP6objectP9point_segi(ptr noundef, ptr noundef, i32 noundef) #2

declare void @_Z22create_path_to_segmentP6objectiii(ptr noundef, i32 noundef, i32 noundef, i32 noundef) #2

declare noundef i32 @_Z23find_connected_distanceP10vms_vectoriS0_iii(ptr noundef, i32 noundef, ptr noundef, i32 noundef, i32 noundef, i32 noundef) #2

declare void @_Z21create_path_to_playerP6objectii(ptr noundef, i32 noundef, i32 noundef) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z22escort_set_goal_objectv() #1 !dbg !3443 {
  %1 = alloca i32, align 4
  %2 = load i32, ptr @Escort_special_goal, align 4, !dbg !3444
  %3 = icmp ne i32 %2, -1, !dbg !3446
  br i1 %3, label %4, label %5, !dbg !3446

4:                                                ; preds = %0
  store i32 -1, ptr %1, align 4, !dbg !3447
  br label %59, !dbg !3447

5:                                                ; preds = %0
  %6 = load ptr, ptr @ConsoleObject, align 8, !dbg !3448
  %7 = getelementptr inbounds nuw %struct.object, ptr %6, i32 0, i32 8, !dbg !3450
  %8 = load i8, ptr %7, align 1, !dbg !3450
  %9 = zext i8 %8 to i32, !dbg !3448
  %10 = and i32 %9, 2, !dbg !3451
  %11 = icmp ne i32 %10, 0, !dbg !3452
  br i1 %11, label %20, label %12, !dbg !3453

12:                                               ; preds = %5
  %13 = load ptr, ptr @ConsoleObject, align 8, !dbg !3454
  %14 = getelementptr inbounds nuw %struct.object, ptr %13, i32 0, i32 9, !dbg !3455
  %15 = load i16, ptr %14, align 2, !dbg !3455
  %16 = sext i16 %15 to i32, !dbg !3454
  %17 = call noundef i32 @_Z14exists_in_mineiiii(i32 noundef %16, i32 noundef 7, i32 noundef 4, i32 noundef -1), !dbg !3456
  %18 = icmp ne i32 %17, -1, !dbg !3457
  br i1 %18, label %19, label %20, !dbg !3453

19:                                               ; preds = %12
  store i32 1, ptr %1, align 4, !dbg !3458
  br label %59, !dbg !3458

20:                                               ; preds = %12, %5
  %21 = load ptr, ptr @ConsoleObject, align 8, !dbg !3459
  %22 = getelementptr inbounds nuw %struct.object, ptr %21, i32 0, i32 8, !dbg !3461
  %23 = load i8, ptr %22, align 1, !dbg !3461
  %24 = zext i8 %23 to i32, !dbg !3459
  %25 = and i32 %24, 8, !dbg !3462
  %26 = icmp ne i32 %25, 0, !dbg !3463
  br i1 %26, label %35, label %27, !dbg !3464

27:                                               ; preds = %20
  %28 = load ptr, ptr @ConsoleObject, align 8, !dbg !3465
  %29 = getelementptr inbounds nuw %struct.object, ptr %28, i32 0, i32 9, !dbg !3466
  %30 = load i16, ptr %29, align 2, !dbg !3466
  %31 = sext i16 %30 to i32, !dbg !3465
  %32 = call noundef i32 @_Z14exists_in_mineiiii(i32 noundef %31, i32 noundef 7, i32 noundef 6, i32 noundef -1), !dbg !3467
  %33 = icmp ne i32 %32, -1, !dbg !3468
  br i1 %33, label %34, label %35, !dbg !3464

34:                                               ; preds = %27
  store i32 2, ptr %1, align 4, !dbg !3469
  br label %59, !dbg !3469

35:                                               ; preds = %27, %20
  %36 = load ptr, ptr @ConsoleObject, align 8, !dbg !3470
  %37 = getelementptr inbounds nuw %struct.object, ptr %36, i32 0, i32 8, !dbg !3472
  %38 = load i8, ptr %37, align 1, !dbg !3472
  %39 = zext i8 %38 to i32, !dbg !3470
  %40 = and i32 %39, 4, !dbg !3473
  %41 = icmp ne i32 %40, 0, !dbg !3474
  br i1 %41, label %50, label %42, !dbg !3475

42:                                               ; preds = %35
  %43 = load ptr, ptr @ConsoleObject, align 8, !dbg !3476
  %44 = getelementptr inbounds nuw %struct.object, ptr %43, i32 0, i32 9, !dbg !3477
  %45 = load i16, ptr %44, align 2, !dbg !3477
  %46 = sext i16 %45 to i32, !dbg !3476
  %47 = call noundef i32 @_Z14exists_in_mineiiii(i32 noundef %46, i32 noundef 7, i32 noundef 5, i32 noundef -1), !dbg !3478
  %48 = icmp ne i32 %47, -1, !dbg !3479
  br i1 %48, label %49, label %50, !dbg !3475

49:                                               ; preds = %42
  store i32 3, ptr %1, align 4, !dbg !3480
  br label %59, !dbg !3480

50:                                               ; preds = %42, %35
  %51 = load i32, ptr @Control_center_destroyed, align 4, !dbg !3481
  %52 = icmp eq i32 %51, 0, !dbg !3483
  br i1 %52, label %53, label %58, !dbg !3483

53:                                               ; preds = %50
  %54 = load i32, ptr @Num_boss_teleport_segs, align 4, !dbg !3484
  %55 = icmp ne i32 %54, 0, !dbg !3484
  br i1 %55, label %56, label %57, !dbg !3484

56:                                               ; preds = %53
  store i32 15, ptr %1, align 4, !dbg !3487
  br label %59, !dbg !3487

57:                                               ; preds = %53
  store i32 4, ptr %1, align 4, !dbg !3488
  br label %59, !dbg !3488

58:                                               ; preds = %50
  store i32 5, ptr %1, align 4, !dbg !3489
  br label %59, !dbg !3489

59:                                               ; preds = %58, %57, %56, %49, %34, %19, %4
  %60 = load i32, ptr %1, align 4, !dbg !3490
  ret i32 %60, !dbg !3490
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define noundef i32 @_Z20time_to_visit_playerP6objectP8ai_localP9ai_static(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !3491 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
    #dbg_declare(ptr %5, !3494, !DIExpression(), !3495)
  store ptr %1, ptr %6, align 8
    #dbg_declare(ptr %6, !3496, !DIExpression(), !3497)
  store ptr %2, ptr %7, align 8
    #dbg_declare(ptr %7, !3498, !DIExpression(), !3499)
  %8 = load i32, ptr @GameTime, align 4, !dbg !3500
  %9 = load i32, ptr @Buddy_last_seen_player, align 4, !dbg !3502
  %10 = sub nsw i32 %8, %9, !dbg !3503
  %11 = icmp sgt i32 %10, 262144, !dbg !3504
  br i1 %11, label %12, label %19, !dbg !3504

12:                                               ; preds = %3
  %13 = load i32, ptr @GameTime, align 4, !dbg !3505
  %14 = load i32, ptr @Buddy_last_player_path_created, align 4, !dbg !3507
  %15 = sub nsw i32 %13, %14, !dbg !3508
  %16 = icmp sgt i32 %15, 65536, !dbg !3509
  br i1 %16, label %17, label %18, !dbg !3509

17:                                               ; preds = %12
  store i32 1, ptr %4, align 4, !dbg !3510
  br label %49, !dbg !3510

18:                                               ; preds = %12
  br label %19, !dbg !3511

19:                                               ; preds = %18, %3
  %20 = load ptr, ptr %6, align 8, !dbg !3512
  %21 = getelementptr inbounds nuw %struct.ai_local, ptr %20, i32 0, i32 3, !dbg !3514
  %22 = load i32, ptr %21, align 4, !dbg !3514
  %23 = icmp eq i32 %22, 8, !dbg !3515
  br i1 %23, label %24, label %25, !dbg !3515

24:                                               ; preds = %19
  store i32 0, ptr %4, align 4, !dbg !3516
  br label %49, !dbg !3516

25:                                               ; preds = %19
  %26 = load ptr, ptr %5, align 8, !dbg !3517
  %27 = getelementptr inbounds nuw %struct.object, ptr %26, i32 0, i32 9, !dbg !3519
  %28 = load i16, ptr %27, align 2, !dbg !3519
  %29 = sext i16 %28 to i32, !dbg !3517
  %30 = load ptr, ptr @ConsoleObject, align 8, !dbg !3520
  %31 = getelementptr inbounds nuw %struct.object, ptr %30, i32 0, i32 9, !dbg !3521
  %32 = load i16, ptr %31, align 2, !dbg !3521
  %33 = sext i16 %32 to i32, !dbg !3520
  %34 = icmp eq i32 %29, %33, !dbg !3522
  br i1 %34, label %35, label %36, !dbg !3522

35:                                               ; preds = %25
  store i32 0, ptr %4, align 4, !dbg !3523
  br label %49, !dbg !3523

36:                                               ; preds = %25
  %37 = load ptr, ptr %7, align 8, !dbg !3524
  %38 = getelementptr inbounds nuw %struct.ai_static, ptr %37, i32 0, i32 5, !dbg !3526
  %39 = load i8, ptr %38, align 2, !dbg !3526
  %40 = sext i8 %39 to i32, !dbg !3524
  %41 = load ptr, ptr %7, align 8, !dbg !3527
  %42 = getelementptr inbounds nuw %struct.ai_static, ptr %41, i32 0, i32 4, !dbg !3528
  %43 = load i16, ptr %42, align 4, !dbg !3528
  %44 = sext i16 %43 to i32, !dbg !3527
  %45 = sdiv i32 %44, 2, !dbg !3529
  %46 = icmp slt i32 %40, %45, !dbg !3530
  br i1 %46, label %47, label %48, !dbg !3530

47:                                               ; preds = %36
  store i32 0, ptr %4, align 4, !dbg !3531
  br label %49, !dbg !3531

48:                                               ; preds = %36
  store i32 1, ptr %4, align 4, !dbg !3532
  br label %49, !dbg !3532

49:                                               ; preds = %48, %47, %35, %24, %17
  %50 = load i32, ptr %4, align 4, !dbg !3533
  ret i32 %50, !dbg !3533
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define void @_Z22bash_buddy_weapon_infoi(i32 noundef %0) #0 !dbg !3534 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !3535, !DIExpression(), !3536)
    #dbg_declare(ptr %3, !3537, !DIExpression(), !3538)
  %4 = load i32, ptr %2, align 4, !dbg !3539
  %5 = sext i32 %4 to i64, !dbg !3540
  %6 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %5, !dbg !3540
  store ptr %6, ptr %3, align 8, !dbg !3538
  %7 = load ptr, ptr @ConsoleObject, align 8, !dbg !3541
  %8 = ptrtoint ptr %7 to i64, !dbg !3542
  %9 = sub i64 %8, ptrtoint (ptr @Objects to i64), !dbg !3542
  %10 = sdiv exact i64 %9, 268, !dbg !3542
  %11 = trunc i64 %10 to i16, !dbg !3541
  %12 = load ptr, ptr %3, align 8, !dbg !3543
  %13 = getelementptr inbounds nuw %struct.object, ptr %12, i32 0, i32 22, !dbg !3544
  %14 = getelementptr inbounds nuw %struct.laser_info_s, ptr %13, i32 0, i32 1, !dbg !3545
  store i16 %11, ptr %14, align 2, !dbg !3546
  %15 = load ptr, ptr %3, align 8, !dbg !3547
  %16 = getelementptr inbounds nuw %struct.object, ptr %15, i32 0, i32 22, !dbg !3548
  %17 = getelementptr inbounds nuw %struct.laser_info_s, ptr %16, i32 0, i32 0, !dbg !3549
  store i16 4, ptr %17, align 4, !dbg !3550
  %18 = load ptr, ptr @ConsoleObject, align 8, !dbg !3551
  %19 = getelementptr inbounds nuw %struct.object, ptr %18, i32 0, i32 0, !dbg !3552
  %20 = load i32, ptr %19, align 4, !dbg !3552
  %21 = load ptr, ptr %3, align 8, !dbg !3553
  %22 = getelementptr inbounds nuw %struct.object, ptr %21, i32 0, i32 22, !dbg !3554
  %23 = getelementptr inbounds nuw %struct.laser_info_s, ptr %22, i32 0, i32 2, !dbg !3555
  store i32 %20, ptr %23, align 4, !dbg !3556
  ret void, !dbg !3557
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z21maybe_buddy_fire_megai(i32 noundef %0) #1 !dbg !3558 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca %struct.vms_vector, align 4
  %9 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !3559, !DIExpression(), !3560)
    #dbg_declare(ptr %4, !3561, !DIExpression(), !3562)
  %10 = load i32, ptr %3, align 4, !dbg !3563
  %11 = sext i32 %10 to i64, !dbg !3564
  %12 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %11, !dbg !3564
  store ptr %12, ptr %4, align 8, !dbg !3562
    #dbg_declare(ptr %5, !3565, !DIExpression(), !3566)
  %13 = load i32, ptr @Buddy_objnum, align 4, !dbg !3567
  %14 = sext i32 %13 to i64, !dbg !3568
  %15 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %14, !dbg !3568
  store ptr %15, ptr %5, align 8, !dbg !3566
    #dbg_declare(ptr %6, !3569, !DIExpression(), !3570)
    #dbg_declare(ptr %7, !3571, !DIExpression(), !3572)
    #dbg_declare(ptr %8, !3573, !DIExpression(), !3574)
    #dbg_declare(ptr %9, !3575, !DIExpression(), !3576)
  %16 = load ptr, ptr %5, align 8, !dbg !3577
  %17 = getelementptr inbounds nuw %struct.object, ptr %16, i32 0, i32 11, !dbg !3578
  %18 = load ptr, ptr %4, align 8, !dbg !3579
  %19 = getelementptr inbounds nuw %struct.object, ptr %18, i32 0, i32 11, !dbg !3580
  %20 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %8, ptr noundef %17, ptr noundef %19), !dbg !3581
  %21 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %8), !dbg !3582
  store i32 %21, ptr %6, align 4, !dbg !3583
  %22 = load i32, ptr %6, align 4, !dbg !3584
  %23 = icmp sgt i32 %22, 6553600, !dbg !3586
  br i1 %23, label %24, label %25, !dbg !3586

24:                                               ; preds = %1
  store i32 0, ptr %2, align 4, !dbg !3587
  br label %53, !dbg !3587

25:                                               ; preds = %1
  %26 = load ptr, ptr %5, align 8, !dbg !3588
  %27 = getelementptr inbounds nuw %struct.object, ptr %26, i32 0, i32 12, !dbg !3588
  %28 = getelementptr inbounds nuw %struct.vms_matrix, ptr %27, i32 0, i32 2, !dbg !3588
  %29 = call noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef %8, ptr noundef %28), !dbg !3588
  store i32 %29, ptr %7, align 4, !dbg !3589
  %30 = load i32, ptr %7, align 4, !dbg !3590
  %31 = icmp slt i32 %30, 32768, !dbg !3592
  br i1 %31, label %32, label %33, !dbg !3592

32:                                               ; preds = %25
  store i32 0, ptr %2, align 4, !dbg !3593
  br label %53, !dbg !3593

33:                                               ; preds = %25
  %34 = load ptr, ptr %5, align 8, !dbg !3594
  %35 = load ptr, ptr %4, align 8, !dbg !3596
  %36 = call noundef i32 @_Z27object_to_object_visibilityP6objectS0_i(ptr noundef %34, ptr noundef %35, i32 noundef 2), !dbg !3597
  %37 = icmp ne i32 %36, 0, !dbg !3597
  br i1 %37, label %39, label %38, !dbg !3598

38:                                               ; preds = %33
  store i32 0, ptr %2, align 4, !dbg !3599
  br label %53, !dbg !3599

39:                                               ; preds = %33
  %40 = load i32, ptr @FrameCount, align 4, !dbg !3600
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.49, i32 noundef %40), !dbg !3600
  call void (ptr, ...) @_Z13buddy_messagePKcz(ptr noundef @.str.50), !dbg !3601
  %41 = load ptr, ptr %5, align 8, !dbg !3602
  %42 = getelementptr inbounds nuw %struct.object, ptr %41, i32 0, i32 12, !dbg !3603
  %43 = getelementptr inbounds nuw %struct.vms_matrix, ptr %42, i32 0, i32 2, !dbg !3604
  %44 = load ptr, ptr %5, align 8, !dbg !3605
  %45 = getelementptr inbounds nuw %struct.object, ptr %44, i32 0, i32 11, !dbg !3606
  %46 = load i32, ptr %3, align 4, !dbg !3607
  %47 = call noundef i32 @_Z21Laser_create_new_easyP10vms_vectorS0_iii(ptr noundef %43, ptr noundef %45, i32 noundef %46, i32 noundef 18, i32 noundef 1), !dbg !3608
  store i32 %47, ptr %9, align 4, !dbg !3609
  %48 = load i32, ptr %9, align 4, !dbg !3610
  %49 = icmp ne i32 %48, -1, !dbg !3612
  br i1 %49, label %50, label %52, !dbg !3612

50:                                               ; preds = %39
  %51 = load i32, ptr %9, align 4, !dbg !3613
  call void @_Z22bash_buddy_weapon_infoi(i32 noundef %51), !dbg !3614
  br label %52, !dbg !3614

52:                                               ; preds = %50, %39
  store i32 1, ptr %2, align 4, !dbg !3615
  br label %53, !dbg !3615

53:                                               ; preds = %52, %38, %32, %24
  %54 = load i32, ptr %2, align 4, !dbg !3616
  ret i32 %54, !dbg !3616
}

declare noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef, ptr noundef, ptr noundef) #2

declare noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef) #2

declare noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef, ptr noundef) #2

declare noundef i32 @_Z27object_to_object_visibilityP6objectS0_i(ptr noundef, ptr noundef, i32 noundef) #2

declare void @_Z8_mprintfiPKcz(i32 noundef, ptr noundef, ...) #2

declare noundef i32 @_Z21Laser_create_new_easyP10vms_vectorS0_iii(ptr noundef, ptr noundef, i32 noundef, i32 noundef, i32 noundef) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z22maybe_buddy_fire_smarti(i32 noundef %0) #1 !dbg !3617 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !3618, !DIExpression(), !3619)
    #dbg_declare(ptr %4, !3620, !DIExpression(), !3621)
  %8 = load i32, ptr %3, align 4, !dbg !3622
  %9 = sext i32 %8 to i64, !dbg !3623
  %10 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %9, !dbg !3623
  store ptr %10, ptr %4, align 8, !dbg !3621
    #dbg_declare(ptr %5, !3624, !DIExpression(), !3625)
  %11 = load i32, ptr @Buddy_objnum, align 4, !dbg !3626
  %12 = sext i32 %11 to i64, !dbg !3627
  %13 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %12, !dbg !3627
  store ptr %13, ptr %5, align 8, !dbg !3625
    #dbg_declare(ptr %6, !3628, !DIExpression(), !3629)
    #dbg_declare(ptr %7, !3630, !DIExpression(), !3631)
  %14 = load ptr, ptr %5, align 8, !dbg !3632
  %15 = getelementptr inbounds nuw %struct.object, ptr %14, i32 0, i32 11, !dbg !3633
  %16 = load ptr, ptr %4, align 8, !dbg !3634
  %17 = getelementptr inbounds nuw %struct.object, ptr %16, i32 0, i32 11, !dbg !3635
  %18 = call noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef %15, ptr noundef %17), !dbg !3636
  store i32 %18, ptr %6, align 4, !dbg !3637
  %19 = load i32, ptr %6, align 4, !dbg !3638
  %20 = icmp sgt i32 %19, 5242880, !dbg !3640
  br i1 %20, label %21, label %22, !dbg !3640

21:                                               ; preds = %1
  store i32 0, ptr %2, align 4, !dbg !3641
  br label %42, !dbg !3641

22:                                               ; preds = %1
  %23 = load ptr, ptr %5, align 8, !dbg !3642
  %24 = load ptr, ptr %4, align 8, !dbg !3644
  %25 = call noundef i32 @_Z27object_to_object_visibilityP6objectS0_i(ptr noundef %23, ptr noundef %24, i32 noundef 2), !dbg !3645
  %26 = icmp ne i32 %25, 0, !dbg !3645
  br i1 %26, label %28, label %27, !dbg !3646

27:                                               ; preds = %22
  store i32 0, ptr %2, align 4, !dbg !3647
  br label %42, !dbg !3647

28:                                               ; preds = %22
  %29 = load i32, ptr @FrameCount, align 4, !dbg !3648
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.51, i32 noundef %29), !dbg !3648
  call void (ptr, ...) @_Z13buddy_messagePKcz(ptr noundef @.str.52), !dbg !3649
  %30 = load ptr, ptr %5, align 8, !dbg !3650
  %31 = getelementptr inbounds nuw %struct.object, ptr %30, i32 0, i32 12, !dbg !3651
  %32 = getelementptr inbounds nuw %struct.vms_matrix, ptr %31, i32 0, i32 2, !dbg !3652
  %33 = load ptr, ptr %5, align 8, !dbg !3653
  %34 = getelementptr inbounds nuw %struct.object, ptr %33, i32 0, i32 11, !dbg !3654
  %35 = load i32, ptr %3, align 4, !dbg !3655
  %36 = call noundef i32 @_Z21Laser_create_new_easyP10vms_vectorS0_iii(ptr noundef %32, ptr noundef %34, i32 noundef %35, i32 noundef 17, i32 noundef 1), !dbg !3656
  store i32 %36, ptr %7, align 4, !dbg !3657
  %37 = load i32, ptr %7, align 4, !dbg !3658
  %38 = icmp ne i32 %37, -1, !dbg !3660
  br i1 %38, label %39, label %41, !dbg !3660

39:                                               ; preds = %28
  %40 = load i32, ptr %7, align 4, !dbg !3661
  call void @_Z22bash_buddy_weapon_infoi(i32 noundef %40), !dbg !3662
  br label %41, !dbg !3662

41:                                               ; preds = %39, %28
  store i32 1, ptr %2, align 4, !dbg !3663
  br label %42, !dbg !3663

42:                                               ; preds = %41, %27, %21
  %43 = load i32, ptr %2, align 4, !dbg !3664
  ret i32 %43, !dbg !3664
}

declare noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef, ptr noundef) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z19do_buddy_dude_stuffv() #1 !dbg !3665 {
  %1 = alloca i32, align 4
    #dbg_declare(ptr %1, !3666, !DIExpression(), !3667)
  %2 = call noundef i32 @_Z20ok_for_buddy_to_talkv(), !dbg !3668
  %3 = icmp ne i32 %2, 0, !dbg !3668
  br i1 %3, label %5, label %4, !dbg !3670

4:                                                ; preds = %0
  br label %86, !dbg !3671

5:                                                ; preds = %0
  %6 = load i32, ptr @Buddy_last_missile_time, align 4, !dbg !3672
  %7 = load i32, ptr @GameTime, align 4, !dbg !3674
  %8 = icmp sgt i32 %6, %7, !dbg !3675
  br i1 %8, label %9, label %10, !dbg !3675

9:                                                ; preds = %5
  store i32 0, ptr @Buddy_last_missile_time, align 4, !dbg !3676
  br label %10, !dbg !3677

10:                                               ; preds = %9, %5
  %11 = load i32, ptr @Buddy_last_missile_time, align 4, !dbg !3678
  %12 = add nsw i32 %11, 131072, !dbg !3680
  %13 = load i32, ptr @GameTime, align 4, !dbg !3681
  %14 = icmp slt i32 %12, %13, !dbg !3682
  br i1 %14, label %15, label %86, !dbg !3682

15:                                               ; preds = %10
  store i32 0, ptr %1, align 4, !dbg !3683
  br label %16, !dbg !3686

16:                                               ; preds = %47, %15
  %17 = load i32, ptr %1, align 4, !dbg !3687
  %18 = load i32, ptr @Highest_object_index, align 4, !dbg !3689
  %19 = icmp sle i32 %17, %18, !dbg !3690
  br i1 %19, label %20, label %50, !dbg !3691

20:                                               ; preds = %16
  %21 = load i32, ptr %1, align 4, !dbg !3692
  %22 = sext i32 %21 to i64, !dbg !3694
  %23 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %22, !dbg !3694
  %24 = getelementptr inbounds nuw %struct.object, ptr %23, i32 0, i32 1, !dbg !3695
  %25 = load i8, ptr %24, align 4, !dbg !3695
  %26 = zext i8 %25 to i32, !dbg !3694
  %27 = icmp eq i32 %26, 2, !dbg !3696
  br i1 %27, label %28, label %46, !dbg !3697

28:                                               ; preds = %20
  %29 = load i32, ptr %1, align 4, !dbg !3698
  %30 = sext i32 %29 to i64, !dbg !3699
  %31 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %30, !dbg !3699
  %32 = getelementptr inbounds nuw %struct.object, ptr %31, i32 0, i32 2, !dbg !3700
  %33 = load i8, ptr %32, align 1, !dbg !3700
  %34 = zext i8 %33 to i64, !dbg !3701
  %35 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %34, !dbg !3701
  %36 = getelementptr inbounds nuw %struct.robot_info, ptr %35, i32 0, i32 37, !dbg !3702
  %37 = load i8, ptr %36, align 1, !dbg !3702
  %38 = icmp ne i8 %37, 0, !dbg !3701
  br i1 %38, label %46, label %39, !dbg !3697

39:                                               ; preds = %28
  %40 = load i32, ptr %1, align 4, !dbg !3703
  %41 = call noundef i32 @_Z21maybe_buddy_fire_megai(i32 noundef %40), !dbg !3705
  %42 = icmp ne i32 %41, 0, !dbg !3705
  br i1 %42, label %43, label %45, !dbg !3705

43:                                               ; preds = %39
  %44 = load i32, ptr @GameTime, align 4, !dbg !3706
  store i32 %44, ptr @Buddy_last_missile_time, align 4, !dbg !3708
  br label %86, !dbg !3709

45:                                               ; preds = %39
  br label %46, !dbg !3710

46:                                               ; preds = %45, %28, %20
  br label %47, !dbg !3702

47:                                               ; preds = %46
  %48 = load i32, ptr %1, align 4, !dbg !3711
  %49 = add nsw i32 %48, 1, !dbg !3711
  store i32 %49, ptr %1, align 4, !dbg !3711
  br label %16, !dbg !3712, !llvm.loop !3713

50:                                               ; preds = %16
  store i32 0, ptr %1, align 4, !dbg !3715
  br label %51, !dbg !3717

51:                                               ; preds = %82, %50
  %52 = load i32, ptr %1, align 4, !dbg !3718
  %53 = load i32, ptr @Highest_object_index, align 4, !dbg !3720
  %54 = icmp sle i32 %52, %53, !dbg !3721
  br i1 %54, label %55, label %85, !dbg !3722

55:                                               ; preds = %51
  %56 = load i32, ptr %1, align 4, !dbg !3723
  %57 = sext i32 %56 to i64, !dbg !3725
  %58 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %57, !dbg !3725
  %59 = getelementptr inbounds nuw %struct.object, ptr %58, i32 0, i32 1, !dbg !3726
  %60 = load i8, ptr %59, align 4, !dbg !3726
  %61 = zext i8 %60 to i32, !dbg !3725
  %62 = icmp eq i32 %61, 2, !dbg !3727
  br i1 %62, label %63, label %81, !dbg !3728

63:                                               ; preds = %55
  %64 = load i32, ptr %1, align 4, !dbg !3729
  %65 = sext i32 %64 to i64, !dbg !3730
  %66 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %65, !dbg !3730
  %67 = getelementptr inbounds nuw %struct.object, ptr %66, i32 0, i32 2, !dbg !3731
  %68 = load i8, ptr %67, align 1, !dbg !3731
  %69 = zext i8 %68 to i64, !dbg !3732
  %70 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %69, !dbg !3732
  %71 = getelementptr inbounds nuw %struct.robot_info, ptr %70, i32 0, i32 37, !dbg !3733
  %72 = load i8, ptr %71, align 1, !dbg !3733
  %73 = icmp ne i8 %72, 0, !dbg !3732
  br i1 %73, label %81, label %74, !dbg !3728

74:                                               ; preds = %63
  %75 = load i32, ptr %1, align 4, !dbg !3734
  %76 = call noundef i32 @_Z22maybe_buddy_fire_smarti(i32 noundef %75), !dbg !3736
  %77 = icmp ne i32 %76, 0, !dbg !3736
  br i1 %77, label %78, label %80, !dbg !3736

78:                                               ; preds = %74
  %79 = load i32, ptr @GameTime, align 4, !dbg !3737
  store i32 %79, ptr @Buddy_last_missile_time, align 4, !dbg !3739
  br label %86, !dbg !3740

80:                                               ; preds = %74
  br label %81, !dbg !3741

81:                                               ; preds = %80, %63, %55
  br label %82, !dbg !3733

82:                                               ; preds = %81
  %83 = load i32, ptr %1, align 4, !dbg !3742
  %84 = add nsw i32 %83, 1, !dbg !3742
  store i32 %84, ptr %1, align 4, !dbg !3742
  br label %51, !dbg !3743, !llvm.loop !3744

85:                                               ; preds = %51
  br label %86, !dbg !3746

86:                                               ; preds = %4, %43, %78, %85, %10
  ret void, !dbg !3747
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z15do_escort_frameP6objectii(ptr noundef %0, i32 noundef %1, i32 noundef %2) #1 !dbg !3748 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !3751, !DIExpression(), !3752)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !3753, !DIExpression(), !3754)
  store i32 %2, ptr %6, align 4
    #dbg_declare(ptr %6, !3755, !DIExpression(), !3756)
    #dbg_declare(ptr %7, !3757, !DIExpression(), !3758)
  %12 = load ptr, ptr %4, align 8, !dbg !3759
  %13 = ptrtoint ptr %12 to i64, !dbg !3760
  %14 = sub i64 %13, ptrtoint (ptr @Objects to i64), !dbg !3760
  %15 = sdiv exact i64 %14, 268, !dbg !3760
  %16 = trunc i64 %15 to i32, !dbg !3759
  store i32 %16, ptr %7, align 4, !dbg !3758
    #dbg_declare(ptr %8, !3761, !DIExpression(), !3762)
  %17 = load ptr, ptr %4, align 8, !dbg !3763
  %18 = getelementptr inbounds nuw %struct.object, ptr %17, i32 0, i32 22, !dbg !3764
  store ptr %18, ptr %8, align 8, !dbg !3762
    #dbg_declare(ptr %9, !3765, !DIExpression(), !3766)
  %19 = load i32, ptr %7, align 4, !dbg !3767
  %20 = sext i32 %19 to i64, !dbg !3768
  %21 = getelementptr inbounds [350 x %struct.ai_local], ptr @Ai_local_info, i64 0, i64 %20, !dbg !3768
  store ptr %21, ptr %9, align 8, !dbg !3766
  %22 = load ptr, ptr %4, align 8, !dbg !3769
  %23 = ptrtoint ptr %22 to i64, !dbg !3770
  %24 = sub i64 %23, ptrtoint (ptr @Objects to i64), !dbg !3770
  %25 = sdiv exact i64 %24, 268, !dbg !3770
  %26 = trunc i64 %25 to i32, !dbg !3769
  store i32 %26, ptr @Buddy_objnum, align 4, !dbg !3771
  %27 = load i32, ptr %7, align 4, !dbg !3772
  %28 = icmp eq i32 %27, 28, !dbg !3774
  br i1 %28, label %29, label %45, !dbg !3774

29:                                               ; preds = %3
    #dbg_declare(ptr %10, !3775, !DIExpression(), !3777)
  %30 = load ptr, ptr %4, align 8, !dbg !3778
  %31 = load ptr, ptr %9, align 8, !dbg !3779
  %32 = load ptr, ptr %8, align 8, !dbg !3780
  %33 = call noundef i32 @_Z20time_to_visit_playerP6objectP8ai_localP9ai_static(ptr noundef %30, ptr noundef %31, ptr noundef %32), !dbg !3781
  store i32 %33, ptr %10, align 4, !dbg !3777
  %34 = load ptr, ptr @__stderrp, align 8, !dbg !3782
  %35 = load ptr, ptr %9, align 8, !dbg !3783
  %36 = getelementptr inbounds nuw %struct.ai_local, ptr %35, i32 0, i32 3, !dbg !3784
  %37 = load i32, ptr %36, align 4, !dbg !3784
  %38 = load i32, ptr @Escort_goal_object, align 4, !dbg !3785
  %39 = load i32, ptr @Escort_last_path_created, align 4, !dbg !3786
  %40 = load i32, ptr @Buddy_last_seen_player, align 4, !dbg !3787
  %41 = load i32, ptr @Buddy_last_player_path_created, align 4, !dbg !3788
  %42 = load i32, ptr %10, align 4, !dbg !3789
  %43 = load i32, ptr @GameTime, align 4, !dbg !3790
  %44 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %34, ptr noundef @.str.53, i32 noundef %37, i32 noundef %38, i32 noundef %39, i32 noundef %40, i32 noundef %41, i32 noundef %42, i32 noundef %43) #6, !dbg !3791
  br label %45, !dbg !3792

45:                                               ; preds = %29, %3
  %46 = load i32, ptr %6, align 4, !dbg !3793
  %47 = icmp ne i32 %46, 0, !dbg !3793
  br i1 %47, label %48, label %83, !dbg !3793

48:                                               ; preds = %45
  %49 = load i32, ptr @GameTime, align 4, !dbg !3795
  store i32 %49, ptr @Buddy_last_seen_player, align 4, !dbg !3797
  %50 = load i32, ptr @Player_num, align 4, !dbg !3798
  %51 = sext i32 %50 to i64, !dbg !3800
  %52 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %51, !dbg !3800
  %53 = getelementptr inbounds nuw %struct.player, ptr %52, i32 0, i32 7, !dbg !3801
  %54 = load i32, ptr %53, align 4, !dbg !3801
  %55 = and i32 %54, 16384, !dbg !3802
  %56 = icmp ne i32 %55, 0, !dbg !3800
  br i1 %56, label %57, label %82, !dbg !3800

57:                                               ; preds = %48
  %58 = load i32, ptr @Player_num, align 4, !dbg !3803
  %59 = sext i32 %58 to i64, !dbg !3805
  %60 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %59, !dbg !3805
  %61 = getelementptr inbounds nuw %struct.player, ptr %60, i32 0, i32 8, !dbg !3806
  %62 = load i32, ptr %61, align 4, !dbg !3806
  %63 = call noundef i32 @_Z3f2ii(i32 noundef %62), !dbg !3807
  %64 = icmp slt i32 %63, 40, !dbg !3808
  br i1 %64, label %65, label %81, !dbg !3808

65:                                               ; preds = %57
  %66 = load i32, ptr @Player_num, align 4, !dbg !3809
  %67 = sext i32 %66 to i64, !dbg !3811
  %68 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %67, !dbg !3811
  %69 = getelementptr inbounds nuw %struct.player, ptr %68, i32 0, i32 8, !dbg !3812
  %70 = load i32, ptr %69, align 4, !dbg !3812
  %71 = call noundef i32 @_Z3f2ii(i32 noundef %70), !dbg !3813
  %72 = sdiv i32 %71, 2, !dbg !3814
  %73 = and i32 %72, 2, !dbg !3815
  %74 = icmp ne i32 %73, 0, !dbg !3816
  br i1 %74, label %75, label %80, !dbg !3816

75:                                               ; preds = %65
  %76 = load i32, ptr @Player_is_dead, align 4, !dbg !3817
  %77 = icmp ne i32 %76, 0, !dbg !3817
  br i1 %77, label %79, label %78, !dbg !3819

78:                                               ; preds = %75
  call void (ptr, ...) @_Z13buddy_messagePKcz(ptr noundef @.str.54), !dbg !3820
  br label %79, !dbg !3820

79:                                               ; preds = %78, %75
  br label %80, !dbg !3817

80:                                               ; preds = %79, %65
  br label %81, !dbg !3821

81:                                               ; preds = %80, %57
  br label %82, !dbg !3822

82:                                               ; preds = %81, %48
  br label %83, !dbg !3823

83:                                               ; preds = %82, %45
  %84 = load i32, ptr @Buddy_dude_cheat, align 4, !dbg !3824
  %85 = icmp ne i32 %84, 0, !dbg !3824
  br i1 %85, label %86, label %87, !dbg !3824

86:                                               ; preds = %83
  call void @_Z19do_buddy_dude_stuffv(), !dbg !3826
  br label %87, !dbg !3826

87:                                               ; preds = %86, %83
  %88 = load i32, ptr @Buddy_sorry_time, align 4, !dbg !3827
  %89 = add nsw i32 %88, 65536, !dbg !3829
  %90 = load i32, ptr @GameTime, align 4, !dbg !3830
  %91 = icmp sgt i32 %89, %90, !dbg !3831
  br i1 %91, label %92, label %99, !dbg !3831

92:                                               ; preds = %87
  store i32 0, ptr @Last_buddy_message_time, align 4, !dbg !3832
  %93 = load i32, ptr @Buddy_sorry_time, align 4, !dbg !3834
  %94 = load i32, ptr @GameTime, align 4, !dbg !3836
  %95 = add nsw i32 %94, 131072, !dbg !3837
  %96 = icmp slt i32 %93, %95, !dbg !3838
  br i1 %96, label %97, label %98, !dbg !3838

97:                                               ; preds = %92
  call void (ptr, ...) @_Z13buddy_messagePKcz(ptr noundef @.str.55), !dbg !3839
  br label %98, !dbg !3839

98:                                               ; preds = %97, %92
  store i32 -131072, ptr @Buddy_sorry_time, align 4, !dbg !3840
  br label %99, !dbg !3841

99:                                               ; preds = %98, %87
  %100 = load i32, ptr @Buddy_allowed_to_talk, align 4, !dbg !3842
  %101 = icmp ne i32 %100, 0, !dbg !3842
  br i1 %101, label %113, label %102, !dbg !3844

102:                                              ; preds = %99
  %103 = load i32, ptr %5, align 4, !dbg !3845
  %104 = icmp sgt i32 %103, 6553600, !dbg !3847
  br i1 %104, label %105, label %112, !dbg !3847

105:                                              ; preds = %102
  %106 = load i32, ptr @FrameTime, align 4, !dbg !3848
  %107 = sdiv i32 16384, %106, !dbg !3849
  %108 = trunc i32 %107 to i8, !dbg !3850
  %109 = load ptr, ptr %8, align 8, !dbg !3851
  %110 = getelementptr inbounds nuw %struct.ai_static, ptr %109, i32 0, i32 1, !dbg !3852
  %111 = getelementptr inbounds [11 x i8], ptr %110, i64 0, i64 7, !dbg !3851
  store i8 %108, ptr %111, align 1, !dbg !3853
  br label %112, !dbg !3851

112:                                              ; preds = %105, %102
  br label %113, !dbg !3854

113:                                              ; preds = %112, %99
  %114 = load ptr, ptr %9, align 8, !dbg !3855
  %115 = getelementptr inbounds nuw %struct.ai_local, ptr %114, i32 0, i32 3, !dbg !3857
  %116 = load i32, ptr %115, align 4, !dbg !3857
  %117 = icmp eq i32 %116, 1, !dbg !3858
  br i1 %117, label %118, label %141, !dbg !3858

118:                                              ; preds = %113
  %119 = load i32, ptr %6, align 4, !dbg !3859
  %120 = icmp ne i32 %119, 0, !dbg !3859
  br i1 %120, label %121, label %140, !dbg !3859

121:                                              ; preds = %118
  %122 = load ptr, ptr %4, align 8, !dbg !3861
  %123 = call noundef i32 @_Z6P_Randv(), !dbg !3863
  %124 = mul nsw i32 %123, 16, !dbg !3864
  %125 = add nsw i32 16, %124, !dbg !3865
  call void @_Z21create_n_segment_pathP6objectii(ptr noundef %122, i32 noundef %125, i32 noundef -1), !dbg !3866
  %126 = load ptr, ptr %4, align 8, !dbg !3867
  %127 = load ptr, ptr %8, align 8, !dbg !3868
  %128 = getelementptr inbounds nuw %struct.ai_static, ptr %127, i32 0, i32 3, !dbg !3869
  %129 = load i16, ptr %128, align 2, !dbg !3869
  %130 = sext i16 %129 to i64, !dbg !3870
  %131 = getelementptr inbounds [2500 x %struct.point_seg], ptr @Point_segs, i64 0, i64 %130, !dbg !3870
  %132 = load ptr, ptr %8, align 8, !dbg !3871
  %133 = getelementptr inbounds nuw %struct.ai_static, ptr %132, i32 0, i32 4, !dbg !3872
  %134 = load i16, ptr %133, align 4, !dbg !3872
  %135 = sext i16 %134 to i32, !dbg !3871
  %136 = call noundef i32 @_Z11polish_pathP6objectP9point_segi(ptr noundef %126, ptr noundef %131, i32 noundef %135), !dbg !3873
  %137 = trunc i32 %136 to i16, !dbg !3873
  %138 = load ptr, ptr %8, align 8, !dbg !3874
  %139 = getelementptr inbounds nuw %struct.ai_static, ptr %138, i32 0, i32 4, !dbg !3875
  store i16 %137, ptr %139, align 4, !dbg !3876
  br label %140, !dbg !3877

140:                                              ; preds = %121, %118
  br label %141, !dbg !3859

141:                                              ; preds = %140, %113
  %142 = load i32, ptr @Escort_special_goal, align 4, !dbg !3878
  %143 = icmp eq i32 %142, 13, !dbg !3880
  br i1 %143, label %144, label %165, !dbg !3880

144:                                              ; preds = %141
  %145 = load i32, ptr %6, align 4, !dbg !3881
  %146 = icmp ne i32 %145, 0, !dbg !3881
  br i1 %146, label %147, label %164, !dbg !3881

147:                                              ; preds = %144
  %148 = load i32, ptr @Escort_last_path_created, align 4, !dbg !3884
  %149 = add nsw i32 %148, 196608, !dbg !3886
  %150 = load i32, ptr @GameTime, align 4, !dbg !3887
  %151 = icmp slt i32 %149, %150, !dbg !3888
  br i1 %151, label %152, label %163, !dbg !3888

152:                                              ; preds = %147
  %153 = load i32, ptr @FrameCount, align 4, !dbg !3889
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.56, i32 noundef %153), !dbg !3889
  %154 = load ptr, ptr %4, align 8, !dbg !3891
  %155 = call noundef i32 @_Z6P_Randv(), !dbg !3892
  %156 = mul nsw i32 %155, 16, !dbg !3893
  %157 = add nsw i32 10, %156, !dbg !3894
  %158 = load ptr, ptr @ConsoleObject, align 8, !dbg !3895
  %159 = getelementptr inbounds nuw %struct.object, ptr %158, i32 0, i32 9, !dbg !3896
  %160 = load i16, ptr %159, align 2, !dbg !3896
  %161 = sext i16 %160 to i32, !dbg !3895
  call void @_Z21create_n_segment_pathP6objectii(ptr noundef %154, i32 noundef %157, i32 noundef %161), !dbg !3897
  %162 = load i32, ptr @GameTime, align 4, !dbg !3898
  store i32 %162, ptr @Escort_last_path_created, align 4, !dbg !3899
  br label %163, !dbg !3900

163:                                              ; preds = %152, %147
  br label %164, !dbg !3887

164:                                              ; preds = %163, %144
  br label %380, !dbg !3901

165:                                              ; preds = %141
  %166 = load i32, ptr @Escort_special_goal, align 4, !dbg !3902
  %167 = icmp ne i32 %166, 13, !dbg !3904
  br i1 %167, label %168, label %173, !dbg !3905

168:                                              ; preds = %165
  %169 = load i32, ptr @Escort_last_path_created, align 4, !dbg !3906
  %170 = add nsw i32 %169, 327680, !dbg !3907
  %171 = load i32, ptr @GameTime, align 4, !dbg !3908
  %172 = icmp slt i32 %170, %171, !dbg !3909
  br i1 %172, label %181, label %173, !dbg !3910

173:                                              ; preds = %168, %165
  %174 = load i32, ptr @Escort_special_goal, align 4, !dbg !3911
  %175 = icmp eq i32 %174, 13, !dbg !3912
  br i1 %175, label %176, label %187, !dbg !3913

176:                                              ; preds = %173
  %177 = load i32, ptr @Escort_last_path_created, align 4, !dbg !3914
  %178 = add nsw i32 %177, 983040, !dbg !3915
  %179 = load i32, ptr @GameTime, align 4, !dbg !3916
  %180 = icmp slt i32 %178, %179, !dbg !3917
  br i1 %180, label %181, label %187, !dbg !3910

181:                                              ; preds = %176, %168
  %182 = load ptr, ptr @__stderrp, align 8, !dbg !3918
  %183 = load i32, ptr @Escort_goal_object, align 4, !dbg !3920
  %184 = load i32, ptr @GameTime, align 4, !dbg !3921
  %185 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %182, ptr noundef @.str.57, i32 noundef %183, i32 noundef %184) #6, !dbg !3922
  store i32 -1, ptr @Escort_goal_object, align 4, !dbg !3923
  %186 = load i32, ptr @GameTime, align 4, !dbg !3924
  store i32 %186, ptr @Escort_last_path_created, align 4, !dbg !3925
  br label %187, !dbg !3926

187:                                              ; preds = %181, %176, %173
  %188 = load i32, ptr @Escort_special_goal, align 4, !dbg !3927
  %189 = icmp ne i32 %188, 13, !dbg !3929
  br i1 %189, label %190, label %251, !dbg !3930

190:                                              ; preds = %187
  %191 = load ptr, ptr %4, align 8, !dbg !3931
  %192 = load ptr, ptr %9, align 8, !dbg !3932
  %193 = load ptr, ptr %8, align 8, !dbg !3933
  %194 = call noundef i32 @_Z20time_to_visit_playerP6objectP8ai_localP9ai_static(ptr noundef %191, ptr noundef %192, ptr noundef %193), !dbg !3934
  %195 = icmp ne i32 %194, 0, !dbg !3934
  br i1 %195, label %196, label %251, !dbg !3930

196:                                              ; preds = %190
    #dbg_declare(ptr %11, !3935, !DIExpression(), !3937)
  %197 = load i32, ptr %7, align 4, !dbg !3938
  %198 = icmp eq i32 %197, 28, !dbg !3940
  br i1 %198, label %199, label %209, !dbg !3941

199:                                              ; preds = %196
  %200 = load i32, ptr @GameTime, align 4, !dbg !3942
  %201 = icmp sgt i32 %200, 253000, !dbg !3943
  br i1 %201, label %202, label %209, !dbg !3944

202:                                              ; preds = %199
  %203 = load i32, ptr @GameTime, align 4, !dbg !3945
  %204 = icmp slt i32 %203, 255000, !dbg !3946
  br i1 %204, label %205, label %209, !dbg !3944

205:                                              ; preds = %202
  %206 = load ptr, ptr @__stderrp, align 8, !dbg !3947
  %207 = load i32, ptr @GameTime, align 4, !dbg !3948
  %208 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %206, ptr noundef @.str.58, i32 noundef %207) #6, !dbg !3949
  br label %209, !dbg !3949

209:                                              ; preds = %205, %202, %199, %196
  %210 = load i32, ptr @GameTime, align 4, !dbg !3950
  store i32 %210, ptr @Buddy_last_player_path_created, align 4, !dbg !3951
  %211 = load ptr, ptr %9, align 8, !dbg !3952
  %212 = getelementptr inbounds nuw %struct.ai_local, ptr %211, i32 0, i32 3, !dbg !3953
  store i32 8, ptr %212, align 4, !dbg !3954
  %213 = load i32, ptr %6, align 4, !dbg !3955
  %214 = icmp ne i32 %213, 0, !dbg !3955
  br i1 %214, label %227, label %215, !dbg !3957

215:                                              ; preds = %209
  %216 = load i32, ptr @Last_come_back_message_time, align 4, !dbg !3958
  %217 = add nsw i32 %216, 65536, !dbg !3961
  %218 = load i32, ptr @GameTime, align 4, !dbg !3962
  %219 = icmp slt i32 %217, %218, !dbg !3963
  br i1 %219, label %224, label %220, !dbg !3964

220:                                              ; preds = %215
  %221 = load i32, ptr @Last_come_back_message_time, align 4, !dbg !3965
  %222 = load i32, ptr @GameTime, align 4, !dbg !3966
  %223 = icmp sgt i32 %221, %222, !dbg !3967
  br i1 %223, label %224, label %226, !dbg !3964

224:                                              ; preds = %220, %215
  call void (ptr, ...) @_Z13buddy_messagePKcz(ptr noundef @.str.59), !dbg !3968
  %225 = load i32, ptr @GameTime, align 4, !dbg !3970
  store i32 %225, ptr @Last_come_back_message_time, align 4, !dbg !3971
  br label %226, !dbg !3972

226:                                              ; preds = %224, %220
  br label %227, !dbg !3973

227:                                              ; preds = %226, %209
  %228 = load i32, ptr @Max_escort_length, align 4, !dbg !3974
  store i32 %228, ptr %11, align 4, !dbg !3975
  %229 = load i32, ptr @Buddy_allowed_to_talk, align 4, !dbg !3976
  %230 = icmp ne i32 %229, 0, !dbg !3976
  br i1 %230, label %232, label %231, !dbg !3978

231:                                              ; preds = %227
  store i32 3, ptr %11, align 4, !dbg !3979
  br label %232, !dbg !3980

232:                                              ; preds = %231, %227
  %233 = load ptr, ptr %4, align 8, !dbg !3981
  %234 = load i32, ptr %11, align 4, !dbg !3982
  call void @_Z21create_path_to_playerP6objectii(ptr noundef %233, i32 noundef %234, i32 noundef 1), !dbg !3983
  %235 = load ptr, ptr %4, align 8, !dbg !3984
  %236 = load ptr, ptr %8, align 8, !dbg !3985
  %237 = getelementptr inbounds nuw %struct.ai_static, ptr %236, i32 0, i32 3, !dbg !3986
  %238 = load i16, ptr %237, align 2, !dbg !3986
  %239 = sext i16 %238 to i64, !dbg !3987
  %240 = getelementptr inbounds [2500 x %struct.point_seg], ptr @Point_segs, i64 0, i64 %239, !dbg !3987
  %241 = load ptr, ptr %8, align 8, !dbg !3988
  %242 = getelementptr inbounds nuw %struct.ai_static, ptr %241, i32 0, i32 4, !dbg !3989
  %243 = load i16, ptr %242, align 4, !dbg !3989
  %244 = sext i16 %243 to i32, !dbg !3988
  %245 = call noundef i32 @_Z11polish_pathP6objectP9point_segi(ptr noundef %235, ptr noundef %240, i32 noundef %244), !dbg !3990
  %246 = trunc i32 %245 to i16, !dbg !3990
  %247 = load ptr, ptr %8, align 8, !dbg !3991
  %248 = getelementptr inbounds nuw %struct.ai_static, ptr %247, i32 0, i32 4, !dbg !3992
  store i16 %246, ptr %248, align 4, !dbg !3993
  %249 = load ptr, ptr %9, align 8, !dbg !3994
  %250 = getelementptr inbounds nuw %struct.ai_local, ptr %249, i32 0, i32 3, !dbg !3995
  store i32 8, ptr %250, align 4, !dbg !3996
  br label %380, !dbg !3997

251:                                              ; preds = %190, %187
  %252 = load i32, ptr @GameTime, align 4, !dbg !3998
  %253 = load i32, ptr @Buddy_last_seen_player, align 4, !dbg !4000
  %254 = sub nsw i32 %252, %253, !dbg !4001
  %255 = icmp sgt i32 %254, 262144, !dbg !4002
  br i1 %255, label %256, label %270, !dbg !4002

256:                                              ; preds = %251
  %257 = load i32, ptr %7, align 4, !dbg !4003
  %258 = icmp eq i32 %257, 28, !dbg !4006
  br i1 %258, label %259, label %269, !dbg !4007

259:                                              ; preds = %256
  %260 = load i32, ptr @GameTime, align 4, !dbg !4008
  %261 = icmp sgt i32 %260, 253000, !dbg !4009
  br i1 %261, label %262, label %269, !dbg !4010

262:                                              ; preds = %259
  %263 = load i32, ptr @GameTime, align 4, !dbg !4011
  %264 = icmp slt i32 %263, 255000, !dbg !4012
  br i1 %264, label %265, label %269, !dbg !4010

265:                                              ; preds = %262
  %266 = load ptr, ptr @__stderrp, align 8, !dbg !4013
  %267 = load i32, ptr @GameTime, align 4, !dbg !4014
  %268 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %266, ptr noundef @.str.60, i32 noundef %267) #6, !dbg !4015
  br label %269, !dbg !4015

269:                                              ; preds = %265, %262, %259, %256
  br label %380, !dbg !4016

270:                                              ; preds = %251
  %271 = load ptr, ptr %9, align 8, !dbg !4017
  %272 = getelementptr inbounds nuw %struct.ai_local, ptr %271, i32 0, i32 3, !dbg !4019
  %273 = load i32, ptr %272, align 4, !dbg !4019
  %274 = icmp eq i32 %273, 8, !dbg !4020
  br i1 %274, label %275, label %321, !dbg !4021

275:                                              ; preds = %270
  %276 = load i32, ptr %5, align 4, !dbg !4022
  %277 = icmp slt i32 %276, 2621440, !dbg !4023
  br i1 %277, label %278, label %321, !dbg !4021

278:                                              ; preds = %275
  %279 = load i32, ptr %7, align 4, !dbg !4024
  %280 = icmp eq i32 %279, 28, !dbg !4027
  br i1 %280, label %281, label %291, !dbg !4028

281:                                              ; preds = %278
  %282 = load i32, ptr @GameTime, align 4, !dbg !4029
  %283 = icmp sgt i32 %282, 253000, !dbg !4030
  br i1 %283, label %284, label %291, !dbg !4031

284:                                              ; preds = %281
  %285 = load i32, ptr @GameTime, align 4, !dbg !4032
  %286 = icmp slt i32 %285, 255000, !dbg !4033
  br i1 %286, label %287, label %291, !dbg !4031

287:                                              ; preds = %284
  %288 = load ptr, ptr @__stderrp, align 8, !dbg !4034
  %289 = load i32, ptr @GameTime, align 4, !dbg !4035
  %290 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %288, ptr noundef @.str.61, i32 noundef %289) #6, !dbg !4036
  br label %291, !dbg !4036

291:                                              ; preds = %287, %284, %281, %278
  %292 = call noundef i32 @_Z22escort_set_goal_objectv(), !dbg !4037
  store i32 %292, ptr @Escort_goal_object, align 4, !dbg !4038
  %293 = load ptr, ptr %9, align 8, !dbg !4039
  %294 = getelementptr inbounds nuw %struct.ai_local, ptr %293, i32 0, i32 3, !dbg !4040
  store i32 9, ptr %294, align 4, !dbg !4041
  %295 = load ptr, ptr %4, align 8, !dbg !4042
  call void @_Z26escort_create_path_to_goalP6object(ptr noundef %295), !dbg !4043
  %296 = load ptr, ptr %4, align 8, !dbg !4044
  %297 = load ptr, ptr %8, align 8, !dbg !4045
  %298 = getelementptr inbounds nuw %struct.ai_static, ptr %297, i32 0, i32 3, !dbg !4046
  %299 = load i16, ptr %298, align 2, !dbg !4046
  %300 = sext i16 %299 to i64, !dbg !4047
  %301 = getelementptr inbounds [2500 x %struct.point_seg], ptr @Point_segs, i64 0, i64 %300, !dbg !4047
  %302 = load ptr, ptr %8, align 8, !dbg !4048
  %303 = getelementptr inbounds nuw %struct.ai_static, ptr %302, i32 0, i32 4, !dbg !4049
  %304 = load i16, ptr %303, align 4, !dbg !4049
  %305 = sext i16 %304 to i32, !dbg !4048
  %306 = call noundef i32 @_Z11polish_pathP6objectP9point_segi(ptr noundef %296, ptr noundef %301, i32 noundef %305), !dbg !4050
  %307 = trunc i32 %306 to i16, !dbg !4050
  %308 = load ptr, ptr %8, align 8, !dbg !4051
  %309 = getelementptr inbounds nuw %struct.ai_static, ptr %308, i32 0, i32 4, !dbg !4052
  store i16 %307, ptr %309, align 4, !dbg !4053
  %310 = load ptr, ptr %8, align 8, !dbg !4054
  %311 = getelementptr inbounds nuw %struct.ai_static, ptr %310, i32 0, i32 4, !dbg !4056
  %312 = load i16, ptr %311, align 4, !dbg !4056
  %313 = sext i16 %312 to i32, !dbg !4054
  %314 = icmp slt i32 %313, 3, !dbg !4057
  br i1 %314, label %315, label %318, !dbg !4057

315:                                              ; preds = %291
  %316 = load ptr, ptr %4, align 8, !dbg !4058
  %317 = load i32, ptr @Believed_player_seg, align 4, !dbg !4060
  call void @_Z21create_n_segment_pathP6objectii(ptr noundef %316, i32 noundef 5, i32 noundef %317), !dbg !4061
  br label %318, !dbg !4062

318:                                              ; preds = %315, %291
  %319 = load ptr, ptr %9, align 8, !dbg !4063
  %320 = getelementptr inbounds nuw %struct.ai_local, ptr %319, i32 0, i32 3, !dbg !4064
  store i32 9, ptr %320, align 4, !dbg !4065
  br label %378, !dbg !4066

321:                                              ; preds = %275, %270
  %322 = load i32, ptr @Escort_goal_object, align 4, !dbg !4067
  %323 = icmp eq i32 %322, -1, !dbg !4069
  br i1 %323, label %324, label %376, !dbg !4069

324:                                              ; preds = %321
  %325 = load i32, ptr %7, align 4, !dbg !4070
  %326 = icmp eq i32 %325, 28, !dbg !4073
  br i1 %326, label %327, label %337, !dbg !4074

327:                                              ; preds = %324
  %328 = load i32, ptr @GameTime, align 4, !dbg !4075
  %329 = icmp sgt i32 %328, 253000, !dbg !4076
  br i1 %329, label %330, label %337, !dbg !4077

330:                                              ; preds = %327
  %331 = load i32, ptr @GameTime, align 4, !dbg !4078
  %332 = icmp slt i32 %331, 255000, !dbg !4079
  br i1 %332, label %333, label %337, !dbg !4077

333:                                              ; preds = %330
  %334 = load ptr, ptr @__stderrp, align 8, !dbg !4080
  %335 = load i32, ptr @GameTime, align 4, !dbg !4081
  %336 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %334, ptr noundef @.str.62, i32 noundef %335) #6, !dbg !4082
  br label %337, !dbg !4082

337:                                              ; preds = %333, %330, %327, %324
  %338 = load ptr, ptr %9, align 8, !dbg !4083
  %339 = getelementptr inbounds nuw %struct.ai_local, ptr %338, i32 0, i32 3, !dbg !4085
  %340 = load i32, ptr %339, align 4, !dbg !4085
  %341 = icmp ne i32 %340, 8, !dbg !4086
  br i1 %341, label %345, label %342, !dbg !4087

342:                                              ; preds = %337
  %343 = load i32, ptr %5, align 4, !dbg !4088
  %344 = icmp slt i32 %343, 2621440, !dbg !4089
  br i1 %344, label %345, label %375, !dbg !4087

345:                                              ; preds = %342, %337
  %346 = call noundef i32 @_Z22escort_set_goal_objectv(), !dbg !4090
  store i32 %346, ptr @Escort_goal_object, align 4, !dbg !4092
  %347 = load ptr, ptr %9, align 8, !dbg !4093
  %348 = getelementptr inbounds nuw %struct.ai_local, ptr %347, i32 0, i32 3, !dbg !4094
  store i32 9, ptr %348, align 4, !dbg !4095
  %349 = load ptr, ptr %4, align 8, !dbg !4096
  call void @_Z26escort_create_path_to_goalP6object(ptr noundef %349), !dbg !4097
  %350 = load ptr, ptr %4, align 8, !dbg !4098
  %351 = load ptr, ptr %8, align 8, !dbg !4099
  %352 = getelementptr inbounds nuw %struct.ai_static, ptr %351, i32 0, i32 3, !dbg !4100
  %353 = load i16, ptr %352, align 2, !dbg !4100
  %354 = sext i16 %353 to i64, !dbg !4101
  %355 = getelementptr inbounds [2500 x %struct.point_seg], ptr @Point_segs, i64 0, i64 %354, !dbg !4101
  %356 = load ptr, ptr %8, align 8, !dbg !4102
  %357 = getelementptr inbounds nuw %struct.ai_static, ptr %356, i32 0, i32 4, !dbg !4103
  %358 = load i16, ptr %357, align 4, !dbg !4103
  %359 = sext i16 %358 to i32, !dbg !4102
  %360 = call noundef i32 @_Z11polish_pathP6objectP9point_segi(ptr noundef %350, ptr noundef %355, i32 noundef %359), !dbg !4104
  %361 = trunc i32 %360 to i16, !dbg !4104
  %362 = load ptr, ptr %8, align 8, !dbg !4105
  %363 = getelementptr inbounds nuw %struct.ai_static, ptr %362, i32 0, i32 4, !dbg !4106
  store i16 %361, ptr %363, align 4, !dbg !4107
  %364 = load ptr, ptr %8, align 8, !dbg !4108
  %365 = getelementptr inbounds nuw %struct.ai_static, ptr %364, i32 0, i32 4, !dbg !4110
  %366 = load i16, ptr %365, align 4, !dbg !4110
  %367 = sext i16 %366 to i32, !dbg !4108
  %368 = icmp slt i32 %367, 3, !dbg !4111
  br i1 %368, label %369, label %372, !dbg !4111

369:                                              ; preds = %345
  %370 = load ptr, ptr %4, align 8, !dbg !4112
  %371 = load i32, ptr @Believed_player_seg, align 4, !dbg !4114
  call void @_Z21create_n_segment_pathP6objectii(ptr noundef %370, i32 noundef 5, i32 noundef %371), !dbg !4115
  br label %372, !dbg !4116

372:                                              ; preds = %369, %345
  %373 = load ptr, ptr %9, align 8, !dbg !4117
  %374 = getelementptr inbounds nuw %struct.ai_local, ptr %373, i32 0, i32 3, !dbg !4118
  store i32 9, ptr %374, align 4, !dbg !4119
  br label %375, !dbg !4120

375:                                              ; preds = %372, %342
  br label %377, !dbg !4121

376:                                              ; preds = %321
  br label %377

377:                                              ; preds = %376, %375
  br label %378

378:                                              ; preds = %377, %318
  br label %379

379:                                              ; preds = %378
  br label %380

380:                                              ; preds = %164, %269, %379, %232
  ret void, !dbg !4122
}

; Function Attrs: nounwind
declare i32 @fprintf(ptr noundef, ptr noundef, ...) #4

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z3f2ii(i32 noundef %0) #0 !dbg !4123 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !4126, !DIExpression(), !4127)
  %3 = load i32, ptr %2, align 4, !dbg !4128
  %4 = ashr i32 %3, 16, !dbg !4129
  ret i32 %4, !dbg !4130
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define void @_Z22invalidate_escort_goalv() #0 !dbg !4131 {
  %1 = load ptr, ptr @__stderrp, align 8, !dbg !4132
  %2 = load i32, ptr @Escort_goal_object, align 4, !dbg !4133
  %3 = load i32, ptr @GameTime, align 4, !dbg !4134
  %4 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %1, ptr noundef @.str.63, i32 noundef %2, i32 noundef %3) #6, !dbg !4135
  store i32 -1, ptr @Escort_goal_object, align 4, !dbg !4136
  ret void, !dbg !4137
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z14do_snipe_frameP6objectiiP10vms_vector(ptr noundef %0, i32 noundef %1, i32 noundef %2, ptr noundef %3) #1 !dbg !4138 {
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
    #dbg_declare(ptr %5, !4142, !DIExpression(), !4143)
  store i32 %1, ptr %6, align 4
    #dbg_declare(ptr %6, !4144, !DIExpression(), !4145)
  store i32 %2, ptr %7, align 4
    #dbg_declare(ptr %7, !4146, !DIExpression(), !4147)
  store ptr %3, ptr %8, align 8
    #dbg_declare(ptr %8, !4148, !DIExpression(), !4149)
    #dbg_declare(ptr %9, !4150, !DIExpression(), !4151)
  %13 = load ptr, ptr %5, align 8, !dbg !4152
  %14 = ptrtoint ptr %13 to i64, !dbg !4153
  %15 = sub i64 %14, ptrtoint (ptr @Objects to i64), !dbg !4153
  %16 = sdiv exact i64 %15, 268, !dbg !4153
  %17 = trunc i64 %16 to i32, !dbg !4152
  store i32 %17, ptr %9, align 4, !dbg !4151
    #dbg_declare(ptr %10, !4154, !DIExpression(), !4155)
  %18 = load i32, ptr %9, align 4, !dbg !4156
  %19 = sext i32 %18 to i64, !dbg !4157
  %20 = getelementptr inbounds [350 x %struct.ai_local], ptr @Ai_local_info, i64 0, i64 %19, !dbg !4157
  store ptr %20, ptr %10, align 8, !dbg !4155
    #dbg_declare(ptr %11, !4158, !DIExpression(), !4159)
  %21 = load i32, ptr %6, align 4, !dbg !4160
  %22 = icmp sgt i32 %21, 32768000, !dbg !4162
  br i1 %22, label %23, label %24, !dbg !4162

23:                                               ; preds = %4
  br label %164, !dbg !4163

24:                                               ; preds = %4
  %25 = load ptr, ptr %10, align 8, !dbg !4164
  %26 = getelementptr inbounds nuw %struct.ai_local, ptr %25, i32 0, i32 3, !dbg !4165
  %27 = load i32, ptr %26, align 4, !dbg !4165
  switch i32 %27, label %159 [
    i32 14, label %28
    i32 12, label %57
    i32 13, label %57
    i32 10, label %89
    i32 11, label %116
  ], !dbg !4166

28:                                               ; preds = %24
  %29 = load i32, ptr %6, align 4, !dbg !4167
  %30 = icmp sgt i32 %29, 3276800, !dbg !4170
  br i1 %30, label %31, label %37, !dbg !4171

31:                                               ; preds = %28
  %32 = load ptr, ptr %10, align 8, !dbg !4172
  %33 = getelementptr inbounds nuw %struct.ai_local, ptr %32, i32 0, i32 7, !dbg !4173
  %34 = load i32, ptr %33, align 4, !dbg !4173
  %35 = icmp sgt i32 %34, 0, !dbg !4174
  br i1 %35, label %36, label %37, !dbg !4171

36:                                               ; preds = %31
  br label %164, !dbg !4175

37:                                               ; preds = %31, %28
  %38 = load ptr, ptr %10, align 8, !dbg !4176
  %39 = getelementptr inbounds nuw %struct.ai_local, ptr %38, i32 0, i32 7, !dbg !4177
  store i32 327680, ptr %39, align 4, !dbg !4178
  %40 = load ptr, ptr %5, align 8, !dbg !4179
  %41 = getelementptr inbounds nuw %struct.object, ptr %40, i32 0, i32 11, !dbg !4180
  %42 = load ptr, ptr %5, align 8, !dbg !4181
  %43 = getelementptr inbounds nuw %struct.object, ptr %42, i32 0, i32 9, !dbg !4182
  %44 = load i16, ptr %43, align 2, !dbg !4182
  %45 = sext i16 %44 to i32, !dbg !4181
  %46 = load i32, ptr @Believed_player_seg, align 4, !dbg !4183
  %47 = call noundef i32 @_Z23find_connected_distanceP10vms_vectoriS0_iii(ptr noundef %41, i32 noundef %45, ptr noundef @Believed_player_pos, i32 noundef %46, i32 noundef 30, i32 noundef 1), !dbg !4184
  store i32 %47, ptr %11, align 4, !dbg !4185
  %48 = load i32, ptr %11, align 4, !dbg !4186
  %49 = icmp slt i32 %48, 32768000, !dbg !4188
  br i1 %49, label %50, label %56, !dbg !4188

50:                                               ; preds = %37
  %51 = load ptr, ptr %5, align 8, !dbg !4189
  call void @_Z21create_path_to_playerP6objectii(ptr noundef %51, i32 noundef 30, i32 noundef 1), !dbg !4191
  %52 = load ptr, ptr %10, align 8, !dbg !4192
  %53 = getelementptr inbounds nuw %struct.ai_local, ptr %52, i32 0, i32 3, !dbg !4193
  store i32 10, ptr %53, align 4, !dbg !4194
  %54 = load ptr, ptr %10, align 8, !dbg !4195
  %55 = getelementptr inbounds nuw %struct.ai_local, ptr %54, i32 0, i32 7, !dbg !4196
  store i32 655360, ptr %55, align 4, !dbg !4197
  br label %56, !dbg !4198

56:                                               ; preds = %50, %37
  br label %164, !dbg !4199

57:                                               ; preds = %24, %24
  %58 = load ptr, ptr %10, align 8, !dbg !4200
  %59 = getelementptr inbounds nuw %struct.ai_local, ptr %58, i32 0, i32 7, !dbg !4202
  %60 = load i32, ptr %59, align 4, !dbg !4202
  %61 = icmp slt i32 %60, 0, !dbg !4203
  br i1 %61, label %62, label %67, !dbg !4203

62:                                               ; preds = %57
  %63 = load ptr, ptr %10, align 8, !dbg !4204
  %64 = getelementptr inbounds nuw %struct.ai_local, ptr %63, i32 0, i32 3, !dbg !4206
  store i32 14, ptr %64, align 4, !dbg !4207
  %65 = load ptr, ptr %10, align 8, !dbg !4208
  %66 = getelementptr inbounds nuw %struct.ai_local, ptr %65, i32 0, i32 7, !dbg !4209
  store i32 327680, ptr %66, align 4, !dbg !4210
  br label %88, !dbg !4211

67:                                               ; preds = %57
  %68 = load i32, ptr %7, align 4, !dbg !4212
  %69 = icmp eq i32 %68, 0, !dbg !4214
  br i1 %69, label %75, label %70, !dbg !4215

70:                                               ; preds = %67
  %71 = load ptr, ptr %10, align 8, !dbg !4216
  %72 = getelementptr inbounds nuw %struct.ai_local, ptr %71, i32 0, i32 7, !dbg !4217
  %73 = load i32, ptr %72, align 4, !dbg !4217
  %74 = icmp sgt i32 %73, 163840, !dbg !4218
  br i1 %74, label %75, label %82, !dbg !4215

75:                                               ; preds = %70, %67
  %76 = load ptr, ptr %5, align 8, !dbg !4219
  %77 = load i32, ptr %7, align 4, !dbg !4221
  %78 = load i32, ptr %7, align 4, !dbg !4222
  %79 = load ptr, ptr %8, align 8, !dbg !4223
  call void @_Z14ai_follow_pathP6objectiiP10vms_vector(ptr noundef %76, i32 noundef %77, i32 noundef %78, ptr noundef %79), !dbg !4224
  %80 = load ptr, ptr %10, align 8, !dbg !4225
  %81 = getelementptr inbounds nuw %struct.ai_local, ptr %80, i32 0, i32 3, !dbg !4226
  store i32 13, ptr %81, align 4, !dbg !4227
  br label %87, !dbg !4228

82:                                               ; preds = %70
  %83 = load ptr, ptr %10, align 8, !dbg !4229
  %84 = getelementptr inbounds nuw %struct.ai_local, ptr %83, i32 0, i32 3, !dbg !4231
  store i32 11, ptr %84, align 4, !dbg !4232
  %85 = load ptr, ptr %10, align 8, !dbg !4233
  %86 = getelementptr inbounds nuw %struct.ai_local, ptr %85, i32 0, i32 7, !dbg !4234
  store i32 65536, ptr %86, align 4, !dbg !4235
  br label %87

87:                                               ; preds = %82, %75
  br label %88

88:                                               ; preds = %87, %62
  br label %164, !dbg !4236

89:                                               ; preds = %24
  %90 = load ptr, ptr %10, align 8, !dbg !4237
  %91 = getelementptr inbounds nuw %struct.ai_local, ptr %90, i32 0, i32 7, !dbg !4239
  %92 = load i32, ptr %91, align 4, !dbg !4239
  %93 = icmp slt i32 %92, 0, !dbg !4240
  br i1 %93, label %94, label %99, !dbg !4240

94:                                               ; preds = %89
  %95 = load ptr, ptr %10, align 8, !dbg !4241
  %96 = getelementptr inbounds nuw %struct.ai_local, ptr %95, i32 0, i32 3, !dbg !4243
  store i32 12, ptr %96, align 4, !dbg !4244
  %97 = load ptr, ptr %10, align 8, !dbg !4245
  %98 = getelementptr inbounds nuw %struct.ai_local, ptr %97, i32 0, i32 7, !dbg !4246
  store i32 327680, ptr %98, align 4, !dbg !4247
  br label %115, !dbg !4248

99:                                               ; preds = %89
  %100 = load ptr, ptr %5, align 8, !dbg !4249
  %101 = load i32, ptr %7, align 4, !dbg !4251
  %102 = load i32, ptr %7, align 4, !dbg !4252
  %103 = load ptr, ptr %8, align 8, !dbg !4253
  call void @_Z14ai_follow_pathP6objectiiP10vms_vector(ptr noundef %100, i32 noundef %101, i32 noundef %102, ptr noundef %103), !dbg !4254
  %104 = load i32, ptr %7, align 4, !dbg !4255
  %105 = icmp ne i32 %104, 0, !dbg !4255
  br i1 %105, label %106, label %111, !dbg !4255

106:                                              ; preds = %99
  %107 = load ptr, ptr %10, align 8, !dbg !4257
  %108 = getelementptr inbounds nuw %struct.ai_local, ptr %107, i32 0, i32 3, !dbg !4259
  store i32 11, ptr %108, align 4, !dbg !4260
  %109 = load ptr, ptr %10, align 8, !dbg !4261
  %110 = getelementptr inbounds nuw %struct.ai_local, ptr %109, i32 0, i32 7, !dbg !4262
  store i32 131072, ptr %110, align 4, !dbg !4263
  br label %114, !dbg !4264

111:                                              ; preds = %99
  %112 = load ptr, ptr %10, align 8, !dbg !4265
  %113 = getelementptr inbounds nuw %struct.ai_local, ptr %112, i32 0, i32 3, !dbg !4266
  store i32 10, ptr %113, align 4, !dbg !4267
  br label %114

114:                                              ; preds = %111, %106
  br label %115

115:                                              ; preds = %114, %94
  br label %164, !dbg !4268

116:                                              ; preds = %24
  %117 = load ptr, ptr %10, align 8, !dbg !4269
  %118 = getelementptr inbounds nuw %struct.ai_local, ptr %117, i32 0, i32 7, !dbg !4271
  %119 = load i32, ptr %118, align 4, !dbg !4271
  %120 = icmp slt i32 %119, 0, !dbg !4272
  br i1 %120, label %121, label %157, !dbg !4272

121:                                              ; preds = %116
    #dbg_declare(ptr %12, !4273, !DIExpression(), !4275)
  %122 = load ptr, ptr %5, align 8, !dbg !4276
  %123 = getelementptr inbounds nuw %struct.object, ptr %122, i32 0, i32 22, !dbg !4277
  store ptr %123, ptr %12, align 8, !dbg !4275
  %124 = load ptr, ptr %5, align 8, !dbg !4278
  %125 = call noundef i32 @_Z6P_Randv(), !dbg !4279
  %126 = sdiv i32 %125, 2048, !dbg !4280
  %127 = add nsw i32 10, %126, !dbg !4281
  %128 = load ptr, ptr @ConsoleObject, align 8, !dbg !4282
  %129 = getelementptr inbounds nuw %struct.object, ptr %128, i32 0, i32 9, !dbg !4283
  %130 = load i16, ptr %129, align 2, !dbg !4283
  %131 = sext i16 %130 to i32, !dbg !4282
  call void @_Z21create_n_segment_pathP6objectii(ptr noundef %124, i32 noundef %127, i32 noundef %131), !dbg !4284
  %132 = load ptr, ptr %5, align 8, !dbg !4285
  %133 = load ptr, ptr %12, align 8, !dbg !4286
  %134 = getelementptr inbounds nuw %struct.ai_static, ptr %133, i32 0, i32 3, !dbg !4287
  %135 = load i16, ptr %134, align 2, !dbg !4287
  %136 = sext i16 %135 to i64, !dbg !4288
  %137 = getelementptr inbounds [2500 x %struct.point_seg], ptr @Point_segs, i64 0, i64 %136, !dbg !4288
  %138 = load ptr, ptr %12, align 8, !dbg !4289
  %139 = getelementptr inbounds nuw %struct.ai_static, ptr %138, i32 0, i32 4, !dbg !4290
  %140 = load i16, ptr %139, align 4, !dbg !4290
  %141 = sext i16 %140 to i32, !dbg !4289
  %142 = call noundef i32 @_Z11polish_pathP6objectP9point_segi(ptr noundef %132, ptr noundef %137, i32 noundef %141), !dbg !4291
  %143 = trunc i32 %142 to i16, !dbg !4291
  %144 = load ptr, ptr %12, align 8, !dbg !4292
  %145 = getelementptr inbounds nuw %struct.ai_static, ptr %144, i32 0, i32 4, !dbg !4293
  store i16 %143, ptr %145, align 4, !dbg !4294
  %146 = call noundef i32 @_Z6P_Randv(), !dbg !4295
  %147 = icmp slt i32 %146, 8192, !dbg !4297
  br i1 %147, label %148, label %151, !dbg !4297

148:                                              ; preds = %121
  %149 = load ptr, ptr %10, align 8, !dbg !4298
  %150 = getelementptr inbounds nuw %struct.ai_local, ptr %149, i32 0, i32 3, !dbg !4299
  store i32 13, ptr %150, align 4, !dbg !4300
  br label %154, !dbg !4298

151:                                              ; preds = %121
  %152 = load ptr, ptr %10, align 8, !dbg !4301
  %153 = getelementptr inbounds nuw %struct.ai_local, ptr %152, i32 0, i32 3, !dbg !4302
  store i32 12, ptr %153, align 4, !dbg !4303
  br label %154

154:                                              ; preds = %151, %148
  %155 = load ptr, ptr %10, align 8, !dbg !4304
  %156 = getelementptr inbounds nuw %struct.ai_local, ptr %155, i32 0, i32 7, !dbg !4305
  store i32 327680, ptr %156, align 4, !dbg !4306
  br label %158, !dbg !4307

157:                                              ; preds = %116
  br label %158

158:                                              ; preds = %157, %154
  br label %164, !dbg !4308

159:                                              ; preds = %24
  call void @_Z4Int3v(), !dbg !4309
  %160 = load ptr, ptr %10, align 8, !dbg !4310
  %161 = getelementptr inbounds nuw %struct.ai_local, ptr %160, i32 0, i32 3, !dbg !4311
  store i32 10, ptr %161, align 4, !dbg !4312
  %162 = load ptr, ptr %10, align 8, !dbg !4313
  %163 = getelementptr inbounds nuw %struct.ai_local, ptr %162, i32 0, i32 7, !dbg !4314
  store i32 65536, ptr %163, align 4, !dbg !4315
  br label %164, !dbg !4316

164:                                              ; preds = %23, %36, %159, %158, %115, %88, %56
  ret void, !dbg !4317
}

declare void @_Z14ai_follow_pathP6objectiiP10vms_vector(ptr noundef, i32 noundef, i32 noundef, ptr noundef) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z31choose_thief_recreation_segmentv() #1 !dbg !4318 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
    #dbg_declare(ptr %2, !4319, !DIExpression(), !4320)
  store i32 -1, ptr %2, align 4, !dbg !4320
    #dbg_declare(ptr %3, !4321, !DIExpression(), !4322)
  store i32 20, ptr %3, align 4, !dbg !4323
  br label %4, !dbg !4324

4:                                                ; preds = %30, %0
  %5 = load i32, ptr %2, align 4, !dbg !4325
  %6 = icmp eq i32 %5, -1, !dbg !4326
  br i1 %6, label %7, label %10, !dbg !4327

7:                                                ; preds = %4
  %8 = load i32, ptr %3, align 4, !dbg !4328
  %9 = icmp sgt i32 %8, 10, !dbg !4329
  br label %10

10:                                               ; preds = %7, %4
  %11 = phi i1 [ false, %4 ], [ %9, %7 ], !dbg !4330
  br i1 %11, label %12, label %33, !dbg !4324

12:                                               ; preds = %10
  %13 = load i32, ptr @Player_num, align 4, !dbg !4331
  %14 = sext i32 %13 to i64, !dbg !4333
  %15 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %14, !dbg !4333
  %16 = getelementptr inbounds nuw %struct.player, ptr %15, i32 0, i32 4, !dbg !4334
  %17 = load i32, ptr %16, align 4, !dbg !4334
  %18 = sext i32 %17 to i64, !dbg !4335
  %19 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %18, !dbg !4335
  %20 = load i32, ptr %3, align 4, !dbg !4336
  %21 = call noundef i32 @_Z22pick_connected_segmentP6objecti(ptr noundef %19, i32 noundef %20), !dbg !4337
  store i32 %21, ptr %2, align 4, !dbg !4338
  %22 = load i32, ptr %2, align 4, !dbg !4339
  %23 = sext i32 %22 to i64, !dbg !4341
  %24 = getelementptr inbounds [0 x %struct.segment2], ptr @Segment2s, i64 0, i64 %23, !dbg !4341
  %25 = getelementptr inbounds nuw %struct.segment2, ptr %24, i32 0, i32 0, !dbg !4342
  %26 = load i8, ptr %25, align 4, !dbg !4342
  %27 = zext i8 %26 to i32, !dbg !4341
  %28 = icmp eq i32 %27, 3, !dbg !4343
  br i1 %28, label %29, label %30, !dbg !4343

29:                                               ; preds = %12
  store i32 -1, ptr %2, align 4, !dbg !4344
  br label %30, !dbg !4345

30:                                               ; preds = %29, %12
  %31 = load i32, ptr %3, align 4, !dbg !4346
  %32 = add nsw i32 %31, -1, !dbg !4346
  store i32 %32, ptr %3, align 4, !dbg !4346
  br label %4, !dbg !4324, !llvm.loop !4347

33:                                               ; preds = %10
  %34 = load i32, ptr %2, align 4, !dbg !4349
  %35 = icmp eq i32 %34, -1, !dbg !4351
  br i1 %35, label %36, label %41, !dbg !4351

36:                                               ; preds = %33
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 1, ptr noundef @.str.64), !dbg !4352
  %37 = call noundef i32 @_Z6P_Randv(), !dbg !4354
  %38 = load i32, ptr @Highest_segment_index, align 4, !dbg !4355
  %39 = mul nsw i32 %37, %38, !dbg !4356
  %40 = ashr i32 %39, 15, !dbg !4357
  store i32 %40, ptr %1, align 4, !dbg !4358
  br label %43, !dbg !4358

41:                                               ; preds = %33
  %42 = load i32, ptr %2, align 4, !dbg !4359
  store i32 %42, ptr %1, align 4, !dbg !4360
  br label %43, !dbg !4360

43:                                               ; preds = %41, %36
  %44 = load i32, ptr %1, align 4, !dbg !4361
  ret i32 %44, !dbg !4361
}

declare noundef i32 @_Z22pick_connected_segmentP6objecti(ptr noundef, i32 noundef) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z14recreate_thiefP6object(ptr noundef %0) #1 !dbg !4362 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca %struct.vms_vector, align 4
  %5 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !4363, !DIExpression(), !4364)
    #dbg_declare(ptr %3, !4365, !DIExpression(), !4366)
    #dbg_declare(ptr %4, !4367, !DIExpression(), !4368)
    #dbg_declare(ptr %5, !4369, !DIExpression(), !4370)
  %6 = call noundef i32 @_Z31choose_thief_recreation_segmentv(), !dbg !4371
  store i32 %6, ptr %3, align 4, !dbg !4372
  %7 = load i32, ptr %3, align 4, !dbg !4373
  %8 = sext i32 %7 to i64, !dbg !4374
  %9 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %8, !dbg !4374
  call void @_Z22compute_segment_centerP10vms_vectorP7segment(ptr noundef %4, ptr noundef %9), !dbg !4375
  %10 = load i32, ptr %3, align 4, !dbg !4376
  %11 = sext i32 %10 to i64, !dbg !4377
  %12 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %11, !dbg !4377
  %13 = load ptr, ptr %2, align 8, !dbg !4378
  %14 = getelementptr inbounds nuw %struct.object, ptr %13, i32 0, i32 2, !dbg !4379
  %15 = load i8, ptr %14, align 1, !dbg !4379
  %16 = zext i8 %15 to i32, !dbg !4378
  %17 = call noundef ptr @_Z18create_morph_robotP7segmentP10vms_vectori(ptr noundef %12, ptr noundef %4, i32 noundef %16), !dbg !4380
  store ptr %17, ptr %5, align 8, !dbg !4381
  %18 = load ptr, ptr %5, align 8, !dbg !4382
  %19 = ptrtoint ptr %18 to i64, !dbg !4383
  %20 = sub i64 %19, ptrtoint (ptr @Objects to i64), !dbg !4383
  %21 = sdiv exact i64 %20, 268, !dbg !4383
  %22 = trunc i64 %21 to i32, !dbg !4382
  call void @_Z14init_ai_objectiii(i32 noundef %22, i32 noundef 132, i32 noundef -1), !dbg !4384
  %23 = load i32, ptr @GameTime, align 4, !dbg !4385
  %24 = add nsw i32 %23, 655360, !dbg !4386
  store i32 %24, ptr @Re_init_thief_time, align 4, !dbg !4387
  ret void, !dbg !4388
}

declare void @_Z22compute_segment_centerP10vms_vectorP7segment(ptr noundef, ptr noundef) #2

declare noundef ptr @_Z18create_morph_robotP7segmentP10vms_vectori(ptr noundef, ptr noundef, i32 noundef) #2

declare void @_Z14init_ai_objectiii(i32 noundef, i32 noundef, i32 noundef) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z14do_thief_frameP6objectiiP10vms_vector(ptr noundef %0, i32 noundef %1, i32 noundef %2, ptr noundef %3) #1 !dbg !4389 {
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
    #dbg_declare(ptr %5, !4390, !DIExpression(), !4391)
  store i32 %1, ptr %6, align 4
    #dbg_declare(ptr %6, !4392, !DIExpression(), !4393)
  store i32 %2, ptr %7, align 4
    #dbg_declare(ptr %7, !4394, !DIExpression(), !4395)
  store ptr %3, ptr %8, align 8
    #dbg_declare(ptr %8, !4396, !DIExpression(), !4397)
    #dbg_declare(ptr %9, !4398, !DIExpression(), !4399)
  %15 = load ptr, ptr %5, align 8, !dbg !4400
  %16 = ptrtoint ptr %15 to i64, !dbg !4401
  %17 = sub i64 %16, ptrtoint (ptr @Objects to i64), !dbg !4401
  %18 = sdiv exact i64 %17, 268, !dbg !4401
  %19 = trunc i64 %18 to i32, !dbg !4400
  store i32 %19, ptr %9, align 4, !dbg !4399
    #dbg_declare(ptr %10, !4402, !DIExpression(), !4403)
  %20 = load i32, ptr %9, align 4, !dbg !4404
  %21 = sext i32 %20 to i64, !dbg !4405
  %22 = getelementptr inbounds [350 x %struct.ai_local], ptr @Ai_local_info, i64 0, i64 %21, !dbg !4405
  store ptr %22, ptr %10, align 8, !dbg !4403
    #dbg_declare(ptr %11, !4406, !DIExpression(), !4407)
  %23 = load i32, ptr @Current_level_num, align 4, !dbg !4408
  %24 = icmp slt i32 %23, 0, !dbg !4410
  br i1 %24, label %25, label %36, !dbg !4411

25:                                               ; preds = %4
  %26 = load i32, ptr @Re_init_thief_time, align 4, !dbg !4412
  %27 = load i32, ptr @GameTime, align 4, !dbg !4413
  %28 = icmp slt i32 %26, %27, !dbg !4414
  br i1 %28, label %29, label %36, !dbg !4411

29:                                               ; preds = %25
  %30 = load i32, ptr @Re_init_thief_time, align 4, !dbg !4415
  %31 = load i32, ptr @GameTime, align 4, !dbg !4418
  %32 = sub nsw i32 %31, 131072, !dbg !4419
  %33 = icmp sgt i32 %30, %32, !dbg !4420
  br i1 %33, label %34, label %35, !dbg !4420

34:                                               ; preds = %29
  call void @_Z20init_thief_for_levelv(), !dbg !4421
  br label %35, !dbg !4423

35:                                               ; preds = %34, %29
  store i32 1056964608, ptr @Re_init_thief_time, align 4, !dbg !4424
  br label %36, !dbg !4425

36:                                               ; preds = %35, %25, %4
  %37 = load i32, ptr %6, align 4, !dbg !4426
  %38 = icmp sgt i32 %37, 32768000, !dbg !4428
  br i1 %38, label %39, label %45, !dbg !4429

39:                                               ; preds = %36
  %40 = load ptr, ptr %10, align 8, !dbg !4430
  %41 = getelementptr inbounds nuw %struct.ai_local, ptr %40, i32 0, i32 7, !dbg !4431
  %42 = load i32, ptr %41, align 4, !dbg !4431
  %43 = icmp sgt i32 %42, 0, !dbg !4432
  br i1 %43, label %44, label %45, !dbg !4429

44:                                               ; preds = %39
  br label %354, !dbg !4433

45:                                               ; preds = %39, %36
  %46 = load i32, ptr @Player_is_dead, align 4, !dbg !4434
  %47 = icmp ne i32 %46, 0, !dbg !4434
  br i1 %47, label %48, label %51, !dbg !4434

48:                                               ; preds = %45
  %49 = load ptr, ptr %10, align 8, !dbg !4436
  %50 = getelementptr inbounds nuw %struct.ai_local, ptr %49, i32 0, i32 3, !dbg !4437
  store i32 16, ptr %50, align 4, !dbg !4438
  br label %51, !dbg !4436

51:                                               ; preds = %48, %45
  %52 = load ptr, ptr %10, align 8, !dbg !4439
  %53 = getelementptr inbounds nuw %struct.ai_local, ptr %52, i32 0, i32 3, !dbg !4440
  %54 = load i32, ptr %53, align 4, !dbg !4440
  switch i32 %54, label %346 [
    i32 17, label %55
    i32 16, label %114
    i32 15, label %232
  ], !dbg !4441

55:                                               ; preds = %51
  %56 = load ptr, ptr %10, align 8, !dbg !4442
  %57 = getelementptr inbounds nuw %struct.ai_local, ptr %56, i32 0, i32 0, !dbg !4445
  %58 = load i32, ptr %57, align 4, !dbg !4445
  %59 = icmp sge i32 %58, 3, !dbg !4446
  br i1 %59, label %60, label %68, !dbg !4446

60:                                               ; preds = %55
  %61 = load ptr, ptr %10, align 8, !dbg !4447
  %62 = getelementptr inbounds nuw %struct.ai_local, ptr %61, i32 0, i32 0, !dbg !4449
  store i32 0, ptr %62, align 4, !dbg !4450
  %63 = load ptr, ptr %5, align 8, !dbg !4451
  call void @_Z21create_path_to_playerP6objectii(ptr noundef %63, i32 noundef 30, i32 noundef 1), !dbg !4452
  %64 = load ptr, ptr %10, align 8, !dbg !4453
  %65 = getelementptr inbounds nuw %struct.ai_local, ptr %64, i32 0, i32 3, !dbg !4454
  store i32 15, ptr %65, align 4, !dbg !4455
  %66 = load ptr, ptr %10, align 8, !dbg !4456
  %67 = getelementptr inbounds nuw %struct.ai_local, ptr %66, i32 0, i32 7, !dbg !4457
  store i32 327680, ptr %67, align 4, !dbg !4458
  br label %354, !dbg !4459

68:                                               ; preds = %55
  %69 = load i32, ptr %7, align 4, !dbg !4460
  %70 = icmp ne i32 %69, 0, !dbg !4460
  br i1 %70, label %71, label %79, !dbg !4460

71:                                               ; preds = %68
  %72 = load ptr, ptr %5, align 8, !dbg !4462
  %73 = load ptr, ptr @ConsoleObject, align 8, !dbg !4464
  %74 = getelementptr inbounds nuw %struct.object, ptr %73, i32 0, i32 9, !dbg !4465
  %75 = load i16, ptr %74, align 2, !dbg !4465
  %76 = sext i16 %75 to i32, !dbg !4464
  call void @_Z21create_n_segment_pathP6objectii(ptr noundef %72, i32 noundef 15, i32 noundef %76), !dbg !4466
  %77 = load ptr, ptr %10, align 8, !dbg !4467
  %78 = getelementptr inbounds nuw %struct.ai_local, ptr %77, i32 0, i32 3, !dbg !4468
  store i32 16, ptr %78, align 4, !dbg !4469
  br label %354, !dbg !4470

79:                                               ; preds = %68
  br label %80

80:                                               ; preds = %79
  %81 = load i32, ptr %6, align 4, !dbg !4471
  %82 = icmp sgt i32 %81, 3276800, !dbg !4473
  br i1 %82, label %83, label %89, !dbg !4474

83:                                               ; preds = %80
  %84 = load ptr, ptr %10, align 8, !dbg !4475
  %85 = getelementptr inbounds nuw %struct.ai_local, ptr %84, i32 0, i32 7, !dbg !4476
  %86 = load i32, ptr %85, align 4, !dbg !4476
  %87 = icmp sgt i32 %86, 0, !dbg !4477
  br i1 %87, label %88, label %89, !dbg !4474

88:                                               ; preds = %83
  br label %354, !dbg !4478

89:                                               ; preds = %83, %80
  %90 = load i32, ptr @Difficulty_level, align 4, !dbg !4479
  %91 = sext i32 %90 to i64, !dbg !4480
  %92 = getelementptr inbounds [5 x i32], ptr @Thief_wait_times, i64 0, i64 %91, !dbg !4480
  %93 = load i32, ptr %92, align 4, !dbg !4480
  %94 = sdiv i32 %93, 2, !dbg !4481
  %95 = load ptr, ptr %10, align 8, !dbg !4482
  %96 = getelementptr inbounds nuw %struct.ai_local, ptr %95, i32 0, i32 7, !dbg !4483
  store i32 %94, ptr %96, align 4, !dbg !4484
  %97 = load ptr, ptr %5, align 8, !dbg !4485
  %98 = getelementptr inbounds nuw %struct.object, ptr %97, i32 0, i32 11, !dbg !4486
  %99 = load ptr, ptr %5, align 8, !dbg !4487
  %100 = getelementptr inbounds nuw %struct.object, ptr %99, i32 0, i32 9, !dbg !4488
  %101 = load i16, ptr %100, align 2, !dbg !4488
  %102 = sext i16 %101 to i32, !dbg !4487
  %103 = load i32, ptr @Believed_player_seg, align 4, !dbg !4489
  %104 = call noundef i32 @_Z23find_connected_distanceP10vms_vectoriS0_iii(ptr noundef %98, i32 noundef %102, ptr noundef @Believed_player_pos, i32 noundef %103, i32 noundef 30, i32 noundef 1), !dbg !4490
  store i32 %104, ptr %11, align 4, !dbg !4491
  %105 = load i32, ptr %11, align 4, !dbg !4492
  %106 = icmp slt i32 %105, 32768000, !dbg !4494
  br i1 %106, label %107, label %113, !dbg !4494

107:                                              ; preds = %89
  %108 = load ptr, ptr %5, align 8, !dbg !4495
  call void @_Z21create_path_to_playerP6objectii(ptr noundef %108, i32 noundef 30, i32 noundef 1), !dbg !4497
  %109 = load ptr, ptr %10, align 8, !dbg !4498
  %110 = getelementptr inbounds nuw %struct.ai_local, ptr %109, i32 0, i32 3, !dbg !4499
  store i32 15, ptr %110, align 4, !dbg !4500
  %111 = load ptr, ptr %10, align 8, !dbg !4501
  %112 = getelementptr inbounds nuw %struct.ai_local, ptr %111, i32 0, i32 7, !dbg !4502
  store i32 655360, ptr %112, align 4, !dbg !4503
  br label %113, !dbg !4504

113:                                              ; preds = %107, %89
  br label %354, !dbg !4505

114:                                              ; preds = %51
  %115 = load ptr, ptr %10, align 8, !dbg !4506
  %116 = getelementptr inbounds nuw %struct.ai_local, ptr %115, i32 0, i32 7, !dbg !4508
  %117 = load i32, ptr %116, align 4, !dbg !4508
  %118 = icmp slt i32 %117, 0, !dbg !4509
  br i1 %118, label %119, label %128, !dbg !4509

119:                                              ; preds = %114
  %120 = load ptr, ptr %10, align 8, !dbg !4510
  %121 = getelementptr inbounds nuw %struct.ai_local, ptr %120, i32 0, i32 3, !dbg !4512
  store i32 17, ptr %121, align 4, !dbg !4513
  %122 = load i32, ptr @Difficulty_level, align 4, !dbg !4514
  %123 = sext i32 %122 to i64, !dbg !4515
  %124 = getelementptr inbounds [5 x i32], ptr @Thief_wait_times, i64 0, i64 %123, !dbg !4515
  %125 = load i32, ptr %124, align 4, !dbg !4515
  %126 = load ptr, ptr %10, align 8, !dbg !4516
  %127 = getelementptr inbounds nuw %struct.ai_local, ptr %126, i32 0, i32 7, !dbg !4517
  store i32 %125, ptr %127, align 4, !dbg !4518
  br label %231, !dbg !4519

128:                                              ; preds = %114
  %129 = load i32, ptr %6, align 4, !dbg !4520
  %130 = icmp slt i32 %129, 6553600, !dbg !4522
  br i1 %130, label %139, label %131, !dbg !4523

131:                                              ; preds = %128
  %132 = load i32, ptr %7, align 4, !dbg !4524
  %133 = icmp ne i32 %132, 0, !dbg !4524
  br i1 %133, label %139, label %134, !dbg !4525

134:                                              ; preds = %131
  %135 = load ptr, ptr %10, align 8, !dbg !4526
  %136 = getelementptr inbounds nuw %struct.ai_local, ptr %135, i32 0, i32 0, !dbg !4527
  %137 = load i32, ptr %136, align 4, !dbg !4527
  %138 = icmp sge i32 %137, 3, !dbg !4528
  br i1 %138, label %139, label %230, !dbg !4525

139:                                              ; preds = %134, %131, %128
  %140 = load ptr, ptr %5, align 8, !dbg !4529
  %141 = load i32, ptr %7, align 4, !dbg !4531
  %142 = load i32, ptr %7, align 4, !dbg !4532
  %143 = load ptr, ptr %8, align 8, !dbg !4533
  call void @_Z14ai_follow_pathP6objectiiP10vms_vector(ptr noundef %140, i32 noundef %141, i32 noundef %142, ptr noundef %143), !dbg !4534
  %144 = load i32, ptr %6, align 4, !dbg !4535
  %145 = icmp slt i32 %144, 6553600, !dbg !4537
  br i1 %145, label %151, label %146, !dbg !4538

146:                                              ; preds = %139
  %147 = load ptr, ptr %10, align 8, !dbg !4539
  %148 = getelementptr inbounds nuw %struct.ai_local, ptr %147, i32 0, i32 0, !dbg !4540
  %149 = load i32, ptr %148, align 4, !dbg !4540
  %150 = icmp sge i32 %149, 3, !dbg !4541
  br i1 %150, label %151, label %226, !dbg !4538

151:                                              ; preds = %146, %139
    #dbg_declare(ptr %12, !4542, !DIExpression(), !4544)
  %152 = load ptr, ptr %5, align 8, !dbg !4545
  %153 = getelementptr inbounds nuw %struct.object, ptr %152, i32 0, i32 22, !dbg !4546
  store ptr %153, ptr %12, align 8, !dbg !4544
  %154 = load ptr, ptr %12, align 8, !dbg !4547
  %155 = getelementptr inbounds nuw %struct.ai_static, ptr %154, i32 0, i32 5, !dbg !4549
  %156 = load i8, ptr %155, align 2, !dbg !4549
  %157 = sext i8 %156 to i32, !dbg !4547
  %158 = icmp sle i32 %157, 1, !dbg !4550
  br i1 %158, label %159, label %166, !dbg !4551

159:                                              ; preds = %151
  %160 = load ptr, ptr %12, align 8, !dbg !4552
  %161 = getelementptr inbounds nuw %struct.ai_static, ptr %160, i32 0, i32 1, !dbg !4553
  %162 = getelementptr inbounds [11 x i8], ptr %161, i64 0, i64 3, !dbg !4552
  %163 = load i8, ptr %162, align 1, !dbg !4552
  %164 = sext i8 %163 to i32, !dbg !4552
  %165 = icmp eq i32 %164, -1, !dbg !4554
  br i1 %165, label %184, label %166, !dbg !4555

166:                                              ; preds = %159, %151
  %167 = load ptr, ptr %12, align 8, !dbg !4556
  %168 = getelementptr inbounds nuw %struct.ai_static, ptr %167, i32 0, i32 5, !dbg !4557
  %169 = load i8, ptr %168, align 2, !dbg !4557
  %170 = sext i8 %169 to i32, !dbg !4556
  %171 = load ptr, ptr %12, align 8, !dbg !4558
  %172 = getelementptr inbounds nuw %struct.ai_static, ptr %171, i32 0, i32 4, !dbg !4559
  %173 = load i16, ptr %172, align 4, !dbg !4559
  %174 = sext i16 %173 to i32, !dbg !4558
  %175 = sub nsw i32 %174, 1, !dbg !4560
  %176 = icmp sge i32 %170, %175, !dbg !4561
  br i1 %176, label %177, label %225, !dbg !4562

177:                                              ; preds = %166
  %178 = load ptr, ptr %12, align 8, !dbg !4563
  %179 = getelementptr inbounds nuw %struct.ai_static, ptr %178, i32 0, i32 1, !dbg !4564
  %180 = getelementptr inbounds [11 x i8], ptr %179, i64 0, i64 3, !dbg !4563
  %181 = load i8, ptr %180, align 1, !dbg !4563
  %182 = sext i8 %181 to i32, !dbg !4563
  %183 = icmp eq i32 %182, 1, !dbg !4565
  br i1 %183, label %184, label %225, !dbg !4555

184:                                              ; preds = %177, %159
  %185 = load ptr, ptr %10, align 8, !dbg !4566
  %186 = getelementptr inbounds nuw %struct.ai_local, ptr %185, i32 0, i32 0, !dbg !4568
  store i32 0, ptr %186, align 4, !dbg !4569
  %187 = load ptr, ptr %5, align 8, !dbg !4570
  %188 = load ptr, ptr @ConsoleObject, align 8, !dbg !4571
  %189 = getelementptr inbounds nuw %struct.object, ptr %188, i32 0, i32 9, !dbg !4572
  %190 = load i16, ptr %189, align 2, !dbg !4572
  %191 = sext i16 %190 to i32, !dbg !4571
  call void @_Z21create_n_segment_pathP6objectii(ptr noundef %187, i32 noundef 10, i32 noundef %191), !dbg !4573
  %192 = load ptr, ptr %12, align 8, !dbg !4574
  %193 = getelementptr inbounds nuw %struct.ai_static, ptr %192, i32 0, i32 4, !dbg !4576
  %194 = load i16, ptr %193, align 4, !dbg !4576
  %195 = sext i16 %194 to i32, !dbg !4574
  %196 = icmp slt i32 %195, 4, !dbg !4577
  br i1 %196, label %197, label %199, !dbg !4577

197:                                              ; preds = %184
  %198 = load ptr, ptr %5, align 8, !dbg !4578
  call void @_Z21create_n_segment_pathP6objectii(ptr noundef %198, i32 noundef 10, i32 noundef -1), !dbg !4580
  br label %222, !dbg !4581

199:                                              ; preds = %184
  %200 = load ptr, ptr %5, align 8, !dbg !4582
  %201 = getelementptr inbounds nuw %struct.object, ptr %200, i32 0, i32 14, !dbg !4584
  %202 = load i32, ptr %201, align 4, !dbg !4584
  %203 = mul nsw i32 %202, 4, !dbg !4585
  %204 = load ptr, ptr %5, align 8, !dbg !4586
  %205 = getelementptr inbounds nuw %struct.object, ptr %204, i32 0, i32 2, !dbg !4587
  %206 = load i8, ptr %205, align 1, !dbg !4587
  %207 = zext i8 %206 to i64, !dbg !4588
  %208 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %207, !dbg !4588
  %209 = getelementptr inbounds nuw %struct.robot_info, ptr %208, i32 0, i32 19, !dbg !4589
  %210 = load i32, ptr %209, align 4, !dbg !4589
  %211 = icmp slt i32 %203, %210, !dbg !4590
  br i1 %211, label %212, label %221, !dbg !4590

212:                                              ; preds = %199
  %213 = load ptr, ptr %12, align 8, !dbg !4591
  %214 = getelementptr inbounds nuw %struct.ai_static, ptr %213, i32 0, i32 4, !dbg !4594
  %215 = load i16, ptr %214, align 4, !dbg !4594
  %216 = sext i16 %215 to i32, !dbg !4591
  %217 = icmp slt i32 %216, 8, !dbg !4595
  br i1 %217, label %218, label %220, !dbg !4595

218:                                              ; preds = %212
  %219 = load ptr, ptr %5, align 8, !dbg !4596
  call void @_Z21create_n_segment_pathP6objectii(ptr noundef %219, i32 noundef 10, i32 noundef -1), !dbg !4598
  br label %220, !dbg !4599

220:                                              ; preds = %218, %212
  br label %221, !dbg !4600

221:                                              ; preds = %220, %199
  br label %222

222:                                              ; preds = %221, %197
  %223 = load ptr, ptr %10, align 8, !dbg !4601
  %224 = getelementptr inbounds nuw %struct.ai_local, ptr %223, i32 0, i32 3, !dbg !4602
  store i32 16, ptr %224, align 4, !dbg !4603
  br label %225, !dbg !4604

225:                                              ; preds = %222, %177, %166
  br label %229, !dbg !4605

226:                                              ; preds = %146
  %227 = load ptr, ptr %10, align 8, !dbg !4606
  %228 = getelementptr inbounds nuw %struct.ai_local, ptr %227, i32 0, i32 3, !dbg !4607
  store i32 16, ptr %228, align 4, !dbg !4608
  br label %229

229:                                              ; preds = %226, %225
  br label %230, !dbg !4609

230:                                              ; preds = %229, %134
  br label %231

231:                                              ; preds = %230, %119
  br label %354, !dbg !4610

232:                                              ; preds = %51
  %233 = load ptr, ptr %10, align 8, !dbg !4611
  %234 = getelementptr inbounds nuw %struct.ai_local, ptr %233, i32 0, i32 0, !dbg !4613
  %235 = load i32, ptr %234, align 4, !dbg !4613
  %236 = icmp sge i32 %235, 3, !dbg !4614
  br i1 %236, label %237, label %266, !dbg !4614

237:                                              ; preds = %232
  %238 = load ptr, ptr %10, align 8, !dbg !4615
  %239 = getelementptr inbounds nuw %struct.ai_local, ptr %238, i32 0, i32 0, !dbg !4617
  store i32 0, ptr %239, align 4, !dbg !4618
  %240 = call noundef i32 @_Z6P_Randv(), !dbg !4619
  %241 = icmp sgt i32 %240, 8192, !dbg !4621
  br i1 %241, label %242, label %265, !dbg !4621

242:                                              ; preds = %237
  %243 = load ptr, ptr %5, align 8, !dbg !4622
  %244 = load ptr, ptr @ConsoleObject, align 8, !dbg !4624
  %245 = getelementptr inbounds nuw %struct.object, ptr %244, i32 0, i32 9, !dbg !4625
  %246 = load i16, ptr %245, align 2, !dbg !4625
  %247 = sext i16 %246 to i32, !dbg !4624
  call void @_Z21create_n_segment_pathP6objectii(ptr noundef %243, i32 noundef 10, i32 noundef %247), !dbg !4626
  %248 = load i32, ptr @Difficulty_level, align 4, !dbg !4627
  %249 = sext i32 %248 to i64, !dbg !4628
  %250 = getelementptr inbounds [5 x i32], ptr @Thief_wait_times, i64 0, i64 %249, !dbg !4628
  %251 = load i32, ptr %250, align 4, !dbg !4628
  %252 = sdiv i32 %251, 2, !dbg !4629
  %253 = load ptr, ptr %5, align 8, !dbg !4630
  %254 = ptrtoint ptr %253 to i64, !dbg !4631
  %255 = sub i64 %254, ptrtoint (ptr @Objects to i64), !dbg !4631
  %256 = sdiv exact i64 %255, 268, !dbg !4631
  %257 = getelementptr inbounds [350 x %struct.ai_local], ptr @Ai_local_info, i64 0, i64 %256, !dbg !4632
  %258 = getelementptr inbounds nuw %struct.ai_local, ptr %257, i32 0, i32 7, !dbg !4633
  store i32 %252, ptr %258, align 4, !dbg !4634
  %259 = load ptr, ptr %5, align 8, !dbg !4635
  %260 = ptrtoint ptr %259 to i64, !dbg !4636
  %261 = sub i64 %260, ptrtoint (ptr @Objects to i64), !dbg !4636
  %262 = sdiv exact i64 %261, 268, !dbg !4636
  %263 = getelementptr inbounds [350 x %struct.ai_local], ptr @Ai_local_info, i64 0, i64 %262, !dbg !4637
  %264 = getelementptr inbounds nuw %struct.ai_local, ptr %263, i32 0, i32 3, !dbg !4638
  store i32 16, ptr %264, align 4, !dbg !4639
  br label %265, !dbg !4640

265:                                              ; preds = %242, %237
  br label %345, !dbg !4641

266:                                              ; preds = %232
  %267 = load ptr, ptr %10, align 8, !dbg !4642
  %268 = getelementptr inbounds nuw %struct.ai_local, ptr %267, i32 0, i32 7, !dbg !4644
  %269 = load i32, ptr %268, align 4, !dbg !4644
  %270 = icmp slt i32 %269, 0, !dbg !4645
  br i1 %270, label %271, label %277, !dbg !4645

271:                                              ; preds = %266
  %272 = load ptr, ptr %10, align 8, !dbg !4646
  %273 = getelementptr inbounds nuw %struct.ai_local, ptr %272, i32 0, i32 7, !dbg !4648
  store i32 65536, ptr %273, align 4, !dbg !4649
  %274 = load ptr, ptr %5, align 8, !dbg !4650
  call void @_Z21create_path_to_playerP6objectii(ptr noundef %274, i32 noundef 100, i32 noundef 0), !dbg !4651
  %275 = load ptr, ptr %10, align 8, !dbg !4652
  %276 = getelementptr inbounds nuw %struct.ai_local, ptr %275, i32 0, i32 3, !dbg !4653
  store i32 15, ptr %276, align 4, !dbg !4654
  br label %344, !dbg !4655

277:                                              ; preds = %266
  %278 = load i32, ptr %7, align 4, !dbg !4656
  %279 = icmp ne i32 %278, 0, !dbg !4656
  br i1 %279, label %280, label %323, !dbg !4659

280:                                              ; preds = %277
  %281 = load i32, ptr %6, align 4, !dbg !4660
  %282 = icmp slt i32 %281, 6553600, !dbg !4661
  br i1 %282, label %283, label %323, !dbg !4659

283:                                              ; preds = %280
  %284 = load i32, ptr %6, align 4, !dbg !4662
  %285 = icmp sgt i32 %284, 3932160, !dbg !4665
  br i1 %285, label %286, label %318, !dbg !4665

286:                                              ; preds = %283
    #dbg_declare(ptr %13, !4666, !DIExpression(), !4668)
  %287 = load ptr, ptr %8, align 8, !dbg !4669
  %288 = load ptr, ptr @ConsoleObject, align 8, !dbg !4669
  %289 = getelementptr inbounds nuw %struct.object, ptr %288, i32 0, i32 12, !dbg !4669
  %290 = getelementptr inbounds nuw %struct.vms_matrix, ptr %289, i32 0, i32 2, !dbg !4669
  %291 = call noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef %287, ptr noundef %290), !dbg !4669
  store i32 %291, ptr %13, align 4, !dbg !4668
  %292 = load i32, ptr %13, align 4, !dbg !4670
  %293 = icmp slt i32 %292, -32768, !dbg !4672
  br i1 %293, label %294, label %317, !dbg !4672

294:                                              ; preds = %286
  %295 = load ptr, ptr %5, align 8, !dbg !4673
  %296 = load ptr, ptr @ConsoleObject, align 8, !dbg !4675
  %297 = getelementptr inbounds nuw %struct.object, ptr %296, i32 0, i32 9, !dbg !4676
  %298 = load i16, ptr %297, align 2, !dbg !4676
  %299 = sext i16 %298 to i32, !dbg !4675
  call void @_Z21create_n_segment_pathP6objectii(ptr noundef %295, i32 noundef 10, i32 noundef %299), !dbg !4677
  %300 = load i32, ptr @Difficulty_level, align 4, !dbg !4678
  %301 = sext i32 %300 to i64, !dbg !4679
  %302 = getelementptr inbounds [5 x i32], ptr @Thief_wait_times, i64 0, i64 %301, !dbg !4679
  %303 = load i32, ptr %302, align 4, !dbg !4679
  %304 = sdiv i32 %303, 2, !dbg !4680
  %305 = load ptr, ptr %5, align 8, !dbg !4681
  %306 = ptrtoint ptr %305 to i64, !dbg !4682
  %307 = sub i64 %306, ptrtoint (ptr @Objects to i64), !dbg !4682
  %308 = sdiv exact i64 %307, 268, !dbg !4682
  %309 = getelementptr inbounds [350 x %struct.ai_local], ptr @Ai_local_info, i64 0, i64 %308, !dbg !4683
  %310 = getelementptr inbounds nuw %struct.ai_local, ptr %309, i32 0, i32 7, !dbg !4684
  store i32 %304, ptr %310, align 4, !dbg !4685
  %311 = load ptr, ptr %5, align 8, !dbg !4686
  %312 = ptrtoint ptr %311 to i64, !dbg !4687
  %313 = sub i64 %312, ptrtoint (ptr @Objects to i64), !dbg !4687
  %314 = sdiv exact i64 %313, 268, !dbg !4687
  %315 = getelementptr inbounds [350 x %struct.ai_local], ptr @Ai_local_info, i64 0, i64 %314, !dbg !4688
  %316 = getelementptr inbounds nuw %struct.ai_local, ptr %315, i32 0, i32 3, !dbg !4689
  store i32 16, ptr %316, align 4, !dbg !4690
  br label %317, !dbg !4691

317:                                              ; preds = %294, %286
  br label %318, !dbg !4692

318:                                              ; preds = %317, %283
  %319 = load ptr, ptr %8, align 8, !dbg !4693
  %320 = load ptr, ptr %5, align 8, !dbg !4694
  call void @_Z22ai_turn_towards_vectorP10vms_vectorP6objecti(ptr noundef %319, ptr noundef %320, i32 noundef 16384), !dbg !4695
  %321 = load ptr, ptr %5, align 8, !dbg !4696
  %322 = load ptr, ptr %8, align 8, !dbg !4697
  call void @_Z19move_towards_playerP6objectP10vms_vector(ptr noundef %321, ptr noundef %322), !dbg !4698
  br label %343, !dbg !4699

323:                                              ; preds = %280, %277
    #dbg_declare(ptr %14, !4700, !DIExpression(), !4702)
  %324 = load ptr, ptr %5, align 8, !dbg !4703
  %325 = getelementptr inbounds nuw %struct.object, ptr %324, i32 0, i32 22, !dbg !4704
  store ptr %325, ptr %14, align 8, !dbg !4702
  %326 = load ptr, ptr %14, align 8, !dbg !4705
  %327 = getelementptr inbounds nuw %struct.ai_static, ptr %326, i32 0, i32 4, !dbg !4707
  %328 = load i16, ptr %327, align 4, !dbg !4707
  %329 = sext i16 %328 to i32, !dbg !4705
  %330 = icmp sgt i32 %329, 1, !dbg !4708
  br i1 %330, label %335, label %331, !dbg !4709

331:                                              ; preds = %323
  %332 = load i32, ptr @FrameCount, align 4, !dbg !4710
  %333 = and i32 %332, 15, !dbg !4711
  %334 = icmp eq i32 %333, 0, !dbg !4712
  br i1 %334, label %335, label %342, !dbg !4709

335:                                              ; preds = %331, %323
  %336 = load ptr, ptr %5, align 8, !dbg !4713
  %337 = load i32, ptr %7, align 4, !dbg !4715
  %338 = load i32, ptr %7, align 4, !dbg !4716
  %339 = load ptr, ptr %8, align 8, !dbg !4717
  call void @_Z14ai_follow_pathP6objectiiP10vms_vector(ptr noundef %336, i32 noundef %337, i32 noundef %338, ptr noundef %339), !dbg !4718
  %340 = load ptr, ptr %10, align 8, !dbg !4719
  %341 = getelementptr inbounds nuw %struct.ai_local, ptr %340, i32 0, i32 3, !dbg !4720
  store i32 15, ptr %341, align 4, !dbg !4721
  br label %342, !dbg !4722

342:                                              ; preds = %335, %331
  br label %343

343:                                              ; preds = %342, %318
  br label %344

344:                                              ; preds = %343, %271
  br label %345

345:                                              ; preds = %344, %265
  br label %354, !dbg !4723

346:                                              ; preds = %51
  %347 = load ptr, ptr %10, align 8, !dbg !4724
  %348 = getelementptr inbounds nuw %struct.ai_local, ptr %347, i32 0, i32 3, !dbg !4724
  %349 = load i32, ptr %348, align 4, !dbg !4724
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.65, i32 noundef %349), !dbg !4724
  %350 = load ptr, ptr %10, align 8, !dbg !4725
  %351 = getelementptr inbounds nuw %struct.ai_local, ptr %350, i32 0, i32 3, !dbg !4726
  store i32 15, ptr %351, align 4, !dbg !4727
  %352 = load ptr, ptr %10, align 8, !dbg !4728
  %353 = getelementptr inbounds nuw %struct.ai_local, ptr %352, i32 0, i32 7, !dbg !4729
  store i32 65536, ptr %353, align 4, !dbg !4730
  br label %354, !dbg !4731

354:                                              ; preds = %44, %60, %71, %88, %346, %345, %231, %113
  ret void, !dbg !4732
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z20init_thief_for_levelv() #1 !dbg !4733 {
  %1 = alloca i32, align 4
    #dbg_declare(ptr %1, !4734, !DIExpression(), !4735)
  store i32 0, ptr %1, align 4, !dbg !4736
  br label %2, !dbg !4738

2:                                                ; preds = %9, %0
  %3 = load i32, ptr %1, align 4, !dbg !4739
  %4 = icmp slt i32 %3, 10, !dbg !4741
  br i1 %4, label %5, label %12, !dbg !4742

5:                                                ; preds = %2
  %6 = load i32, ptr %1, align 4, !dbg !4743
  %7 = sext i32 %6 to i64, !dbg !4744
  %8 = getelementptr inbounds [10 x i8], ptr @Stolen_items, i64 0, i64 %7, !dbg !4744
  store i8 -1, ptr %8, align 1, !dbg !4745
  br label %9, !dbg !4744

9:                                                ; preds = %5
  %10 = load i32, ptr %1, align 4, !dbg !4746
  %11 = add nsw i32 %10, 1, !dbg !4746
  store i32 %11, ptr %1, align 4, !dbg !4746
  br label %2, !dbg !4747, !llvm.loop !4748

12:                                               ; preds = %2
  call void @_Z7_AssertiPKcS0_i(i32 noundef 1, ptr noundef @.str.76, ptr noundef @.str.24, i32 noundef 1742), !dbg !4750
  %13 = load i32, ptr @Game_mode, align 4, !dbg !4751
  %14 = and i32 %13, 38, !dbg !4753
  %15 = icmp ne i32 %14, 0, !dbg !4754
  br i1 %15, label %34, label %16, !dbg !4755

16:                                               ; preds = %12
  store i32 0, ptr %1, align 4, !dbg !4756
  br label %17, !dbg !4758

17:                                               ; preds = %30, %16
  %18 = load i32, ptr %1, align 4, !dbg !4759
  %19 = icmp slt i32 %18, 3, !dbg !4761
  br i1 %19, label %20, label %33, !dbg !4762

20:                                               ; preds = %17
  %21 = load i32, ptr %1, align 4, !dbg !4763
  %22 = mul nsw i32 2, %21, !dbg !4765
  %23 = sext i32 %22 to i64, !dbg !4766
  %24 = getelementptr inbounds [10 x i8], ptr @Stolen_items, i64 0, i64 %23, !dbg !4766
  store i8 2, ptr %24, align 1, !dbg !4767
  %25 = load i32, ptr %1, align 4, !dbg !4768
  %26 = mul nsw i32 2, %25, !dbg !4769
  %27 = add nsw i32 %26, 1, !dbg !4770
  %28 = sext i32 %27 to i64, !dbg !4771
  %29 = getelementptr inbounds [10 x i8], ptr @Stolen_items, i64 0, i64 %28, !dbg !4771
  store i8 1, ptr %29, align 1, !dbg !4772
  br label %30, !dbg !4773

30:                                               ; preds = %20
  %31 = load i32, ptr %1, align 4, !dbg !4774
  %32 = add nsw i32 %31, 1, !dbg !4774
  store i32 %32, ptr %1, align 4, !dbg !4774
  br label %17, !dbg !4775, !llvm.loop !4776

33:                                               ; preds = %17
  br label %34, !dbg !4777

34:                                               ; preds = %33, %12
  store i32 0, ptr @Stolen_item_index, align 4, !dbg !4778
  ret void, !dbg !4779
}

declare void @_Z22ai_turn_towards_vectorP10vms_vectorP6objecti(ptr noundef, ptr noundef, i32 noundef) #2

declare void @_Z19move_towards_playerP6objectP10vms_vector(ptr noundef, ptr noundef) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z21maybe_steal_flag_itemii(i32 noundef %0, i32 noundef %1) #1 !dbg !4780 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
    #dbg_declare(ptr %4, !4781, !DIExpression(), !4782)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !4783, !DIExpression(), !4784)
  %7 = load i32, ptr %4, align 4, !dbg !4785
  %8 = sext i32 %7 to i64, !dbg !4787
  %9 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %8, !dbg !4787
  %10 = getelementptr inbounds nuw %struct.player, ptr %9, i32 0, i32 7, !dbg !4788
  %11 = load i32, ptr %10, align 4, !dbg !4788
  %12 = load i32, ptr %5, align 4, !dbg !4789
  %13 = and i32 %11, %12, !dbg !4790
  %14 = icmp ne i32 %13, 0, !dbg !4787
  br i1 %14, label %15, label %51, !dbg !4787

15:                                               ; preds = %2
  %16 = call noundef i32 @_Z6P_Randv(), !dbg !4791
  %17 = icmp slt i32 %16, 16384, !dbg !4794
  br i1 %17, label %18, label %50, !dbg !4794

18:                                               ; preds = %15
    #dbg_declare(ptr %6, !4795, !DIExpression(), !4797)
  store i32 -1, ptr %6, align 4, !dbg !4797
  %19 = load i32, ptr %5, align 4, !dbg !4798
  %20 = xor i32 %19, -1, !dbg !4799
  %21 = load i32, ptr %4, align 4, !dbg !4800
  %22 = sext i32 %21 to i64, !dbg !4801
  %23 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %22, !dbg !4801
  %24 = getelementptr inbounds nuw %struct.player, ptr %23, i32 0, i32 7, !dbg !4802
  %25 = load i32, ptr %24, align 4, !dbg !4803
  %26 = and i32 %25, %20, !dbg !4803
  store i32 %26, ptr %24, align 4, !dbg !4803
  %27 = load i32, ptr %5, align 4, !dbg !4804
  switch i32 %27, label %41 [
    i32 1, label %28
    i32 2048, label %29
    i32 64, label %30
    i32 1024, label %31
    i32 4096, label %32
    i32 256, label %33
    i32 8192, label %34
  ], !dbg !4805

28:                                               ; preds = %18
  store i32 25, ptr %6, align 4, !dbg !4806
  call void (ptr, ...) @_Z13thief_messagePKcz(ptr noundef @.str.66), !dbg !4808
  br label %41, !dbg !4809

29:                                               ; preds = %18
  store i32 23, ptr %6, align 4, !dbg !4810
  call void (ptr, ...) @_Z13thief_messagePKcz(ptr noundef @.str.67), !dbg !4811
  br label %41, !dbg !4812

30:                                               ; preds = %18
  store i32 33, ptr %6, align 4, !dbg !4813
  call void (ptr, ...) @_Z13thief_messagePKcz(ptr noundef @.str.68), !dbg !4814
  br label %41, !dbg !4815

31:                                               ; preds = %18
  store i32 12, ptr %6, align 4, !dbg !4816
  call void (ptr, ...) @_Z13thief_messagePKcz(ptr noundef @.str.69), !dbg !4817
  br label %41, !dbg !4818

32:                                               ; preds = %18
  store i32 36, ptr %6, align 4, !dbg !4819
  call void (ptr, ...) @_Z13thief_messagePKcz(ptr noundef @.str.70), !dbg !4820
  br label %41, !dbg !4821

33:                                               ; preds = %18
  store i32 34, ptr %6, align 4, !dbg !4822
  call void (ptr, ...) @_Z13thief_messagePKcz(ptr noundef @.str.71), !dbg !4823
  br label %41, !dbg !4824

34:                                               ; preds = %18
  store i32 37, ptr %6, align 4, !dbg !4825
  call void (ptr, ...) @_Z13thief_messagePKcz(ptr noundef @.str.72), !dbg !4826
  %35 = load i32, ptr @Player_num, align 4, !dbg !4827
  %36 = sext i32 %35 to i64, !dbg !4828
  %37 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %36, !dbg !4828
  %38 = getelementptr inbounds nuw %struct.player, ptr %37, i32 0, i32 7, !dbg !4829
  %39 = load i32, ptr %38, align 4, !dbg !4830
  %40 = and i32 %39, -16385, !dbg !4830
  store i32 %40, ptr %38, align 4, !dbg !4830
  br label %41, !dbg !4831

41:                                               ; preds = %18, %34, %33, %32, %31, %30, %29, %28
  %42 = load i32, ptr %6, align 4, !dbg !4832
  %43 = icmp ne i32 %42, -1, !dbg !4832
  %44 = zext i1 %43 to i32, !dbg !4832
  call void @_Z7_AssertiPKcS0_i(i32 noundef %44, ptr noundef @.str.73, ptr noundef @.str.24, i32 noundef 1547), !dbg !4832
  %45 = load i32, ptr %6, align 4, !dbg !4833
  %46 = trunc i32 %45 to i8, !dbg !4833
  %47 = load i32, ptr @Stolen_item_index, align 4, !dbg !4834
  %48 = sext i32 %47 to i64, !dbg !4835
  %49 = getelementptr inbounds [10 x i8], ptr @Stolen_items, i64 0, i64 %48, !dbg !4835
  store i8 %46, ptr %49, align 1, !dbg !4836
  call void @_Z21digi_play_sample_onceii(i32 noundef 244, i32 noundef 65536), !dbg !4837
  store i32 1, ptr %3, align 4, !dbg !4838
  br label %52, !dbg !4838

50:                                               ; preds = %15
  br label %51, !dbg !4839

51:                                               ; preds = %50, %2
  store i32 0, ptr %3, align 4, !dbg !4840
  br label %52, !dbg !4840

52:                                               ; preds = %51, %41
  %53 = load i32, ptr %3, align 4, !dbg !4841
  ret i32 %53, !dbg !4841
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z28maybe_steal_secondary_weaponii(i32 noundef %0, i32 noundef %1) #1 !dbg !4842 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
    #dbg_declare(ptr %4, !4843, !DIExpression(), !4844)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !4845, !DIExpression(), !4846)
  %6 = load i32, ptr %4, align 4, !dbg !4847
  %7 = sext i32 %6 to i64, !dbg !4849
  %8 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %7, !dbg !4849
  %9 = getelementptr inbounds nuw %struct.player, ptr %8, i32 0, i32 16, !dbg !4850
  %10 = load i16, ptr %9, align 4, !dbg !4850
  %11 = zext i16 %10 to i32, !dbg !4849
  %12 = load i32, ptr %5, align 4, !dbg !4851
  %13 = shl i32 1, %12, !dbg !4851
  %14 = and i32 %11, %13, !dbg !4852
  %15 = icmp ne i32 %14, 0, !dbg !4853
  br i1 %15, label %16, label %79, !dbg !4854

16:                                               ; preds = %2
  %17 = load i32, ptr %4, align 4, !dbg !4855
  %18 = sext i32 %17 to i64, !dbg !4856
  %19 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %18, !dbg !4856
  %20 = getelementptr inbounds nuw %struct.player, ptr %19, i32 0, i32 18, !dbg !4857
  %21 = load i32, ptr %5, align 4, !dbg !4858
  %22 = sext i32 %21 to i64, !dbg !4856
  %23 = getelementptr inbounds [10 x i16], ptr %20, i64 0, i64 %22, !dbg !4856
  %24 = load i16, ptr %23, align 2, !dbg !4856
  %25 = icmp ne i16 %24, 0, !dbg !4856
  br i1 %25, label %26, label %79, !dbg !4854

26:                                               ; preds = %16
  %27 = call noundef i32 @_Z6P_Randv(), !dbg !4859
  %28 = icmp slt i32 %27, 16384, !dbg !4861
  br i1 %28, label %29, label %78, !dbg !4861

29:                                               ; preds = %26
  %30 = load i32, ptr %5, align 4, !dbg !4862
  %31 = icmp eq i32 %30, 2, !dbg !4865
  br i1 %31, label %32, label %37, !dbg !4865

32:                                               ; preds = %29
  %33 = call noundef i32 @_Z6P_Randv(), !dbg !4866
  %34 = icmp sgt i32 %33, 8192, !dbg !4868
  br i1 %34, label %35, label %36, !dbg !4868

35:                                               ; preds = %32
  store i32 0, ptr %3, align 4, !dbg !4869
  br label %80, !dbg !4869

36:                                               ; preds = %32
  br label %37, !dbg !4870

37:                                               ; preds = %36, %29
  %38 = load i32, ptr %4, align 4, !dbg !4871
  %39 = sext i32 %38 to i64, !dbg !4872
  %40 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %39, !dbg !4872
  %41 = getelementptr inbounds nuw %struct.player, ptr %40, i32 0, i32 18, !dbg !4873
  %42 = load i32, ptr %5, align 4, !dbg !4874
  %43 = sext i32 %42 to i64, !dbg !4872
  %44 = getelementptr inbounds [10 x i16], ptr %41, i64 0, i64 %43, !dbg !4872
  %45 = load i16, ptr %44, align 2, !dbg !4875
  %46 = add i16 %45, -1, !dbg !4875
  store i16 %46, ptr %44, align 2, !dbg !4875
  %47 = load i32, ptr %5, align 4, !dbg !4876
  %48 = icmp ne i32 %47, 2, !dbg !4878
  br i1 %48, label %49, label %60, !dbg !4879

49:                                               ; preds = %37
  %50 = load i32, ptr %5, align 4, !dbg !4880
  %51 = icmp ne i32 %50, 7, !dbg !4881
  br i1 %51, label %52, label %60, !dbg !4879

52:                                               ; preds = %49
  %53 = load i32, ptr %5, align 4, !dbg !4882
  %54 = sext i32 %53 to i64, !dbg !4884
  %55 = getelementptr inbounds [10 x i8], ptr @Secondary_weapon_to_powerup, i64 0, i64 %54, !dbg !4884
  %56 = load i8, ptr %55, align 1, !dbg !4884
  %57 = load i32, ptr @Stolen_item_index, align 4, !dbg !4885
  %58 = sext i32 %57 to i64, !dbg !4886
  %59 = getelementptr inbounds [10 x i8], ptr @Stolen_items, i64 0, i64 %58, !dbg !4886
  store i8 %56, ptr %59, align 1, !dbg !4887
  br label %60, !dbg !4888

60:                                               ; preds = %52, %49, %37
  %61 = load i32, ptr %5, align 4, !dbg !4889
  %62 = add nsw i32 114, %61, !dbg !4890
  %63 = sext i32 %62 to i64, !dbg !4891
  %64 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef %63) #6, !dbg !4892
  %65 = load ptr, ptr %64, align 8, !dbg !4892
  call void (ptr, ...) @_Z13thief_messagePKcz(ptr noundef @.str.74, ptr noundef %65), !dbg !4893
  %66 = load i32, ptr @Player_num, align 4, !dbg !4894
  %67 = sext i32 %66 to i64, !dbg !4896
  %68 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %67, !dbg !4896
  %69 = getelementptr inbounds nuw %struct.player, ptr %68, i32 0, i32 18, !dbg !4897
  %70 = load i32, ptr %5, align 4, !dbg !4898
  %71 = sext i32 %70 to i64, !dbg !4896
  %72 = getelementptr inbounds [10 x i16], ptr %69, i64 0, i64 %71, !dbg !4896
  %73 = load i16, ptr %72, align 2, !dbg !4896
  %74 = zext i16 %73 to i32, !dbg !4896
  %75 = icmp eq i32 %74, 0, !dbg !4899
  br i1 %75, label %76, label %77, !dbg !4899

76:                                               ; preds = %60
  call void @_Z18auto_select_weaponi(i32 noundef 1), !dbg !4900
  br label %77, !dbg !4900

77:                                               ; preds = %76, %60
  call void @_Z21digi_play_sample_onceii(i32 noundef 244, i32 noundef 65536), !dbg !4901
  store i32 1, ptr %3, align 4, !dbg !4902
  br label %80, !dbg !4902

78:                                               ; preds = %26
  br label %79, !dbg !4903

79:                                               ; preds = %78, %16, %2
  store i32 0, ptr %3, align 4, !dbg !4904
  br label %80, !dbg !4904

80:                                               ; preds = %79, %77, %35
  %81 = load i32, ptr %3, align 4, !dbg !4905
  ret i32 %81, !dbg !4905
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1) #0 !dbg !4906 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !5259, !DIExpression(), !5261)
  store i64 %1, ptr %4, align 8
    #dbg_declare(ptr %4, !5262, !DIExpression(), !5263)
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds nuw %"class.std::__1::vector", ptr %5, i32 0, i32 0, !dbg !5264
  %7 = load ptr, ptr %6, align 8, !dbg !5264
  %8 = load i64, ptr %4, align 8, !dbg !5265
  %9 = getelementptr inbounds nuw ptr, ptr %7, i64 %8, !dbg !5266
  ret ptr %9, !dbg !5267
}

declare void @_Z18auto_select_weaponi(i32 noundef) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z26maybe_steal_primary_weaponii(i32 noundef %0, i32 noundef %1) #1 !dbg !5268 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
    #dbg_declare(ptr %4, !5269, !DIExpression(), !5270)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !5271, !DIExpression(), !5272)
  %6 = load i32, ptr %4, align 4, !dbg !5273
  %7 = sext i32 %6 to i64, !dbg !5275
  %8 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %7, !dbg !5275
  %9 = getelementptr inbounds nuw %struct.player, ptr %8, i32 0, i32 15, !dbg !5276
  %10 = load i16, ptr %9, align 2, !dbg !5276
  %11 = zext i16 %10 to i32, !dbg !5275
  %12 = load i32, ptr %5, align 4, !dbg !5277
  %13 = shl i32 1, %12, !dbg !5277
  %14 = and i32 %11, %13, !dbg !5278
  %15 = icmp ne i32 %14, 0, !dbg !5279
  br i1 %15, label %16, label %111, !dbg !5280

16:                                               ; preds = %2
  %17 = load i32, ptr %4, align 4, !dbg !5281
  %18 = sext i32 %17 to i64, !dbg !5282
  %19 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %18, !dbg !5282
  %20 = getelementptr inbounds nuw %struct.player, ptr %19, i32 0, i32 17, !dbg !5283
  %21 = load i32, ptr %5, align 4, !dbg !5284
  %22 = sext i32 %21 to i64, !dbg !5282
  %23 = getelementptr inbounds [10 x i16], ptr %20, i64 0, i64 %22, !dbg !5282
  %24 = load i16, ptr %23, align 2, !dbg !5282
  %25 = icmp ne i16 %24, 0, !dbg !5282
  br i1 %25, label %26, label %111, !dbg !5280

26:                                               ; preds = %16
  %27 = call noundef i32 @_Z6P_Randv(), !dbg !5285
  %28 = icmp slt i32 %27, 16384, !dbg !5288
  br i1 %28, label %29, label %110, !dbg !5288

29:                                               ; preds = %26
  %30 = load i32, ptr %5, align 4, !dbg !5289
  %31 = icmp eq i32 %30, 0, !dbg !5292
  br i1 %31, label %32, label %73, !dbg !5292

32:                                               ; preds = %29
  %33 = load i32, ptr %4, align 4, !dbg !5293
  %34 = sext i32 %33 to i64, !dbg !5296
  %35 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %34, !dbg !5296
  %36 = getelementptr inbounds nuw %struct.player, ptr %35, i32 0, i32 12, !dbg !5297
  %37 = load i8, ptr %36, align 2, !dbg !5297
  %38 = zext i8 %37 to i32, !dbg !5296
  %39 = icmp sgt i32 %38, 0, !dbg !5298
  br i1 %39, label %40, label %72, !dbg !5298

40:                                               ; preds = %32
  %41 = load i32, ptr %4, align 4, !dbg !5299
  %42 = sext i32 %41 to i64, !dbg !5302
  %43 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %42, !dbg !5302
  %44 = getelementptr inbounds nuw %struct.player, ptr %43, i32 0, i32 12, !dbg !5303
  %45 = load i8, ptr %44, align 2, !dbg !5303
  %46 = zext i8 %45 to i32, !dbg !5302
  %47 = icmp sgt i32 %46, 3, !dbg !5304
  br i1 %47, label %48, label %52, !dbg !5304

48:                                               ; preds = %40
  %49 = load i32, ptr @Stolen_item_index, align 4, !dbg !5305
  %50 = sext i32 %49 to i64, !dbg !5307
  %51 = getelementptr inbounds [10 x i8], ptr @Stolen_items, i64 0, i64 %50, !dbg !5307
  store i8 32, ptr %51, align 1, !dbg !5308
  br label %60, !dbg !5309

52:                                               ; preds = %40
  %53 = load i32, ptr %5, align 4, !dbg !5310
  %54 = sext i32 %53 to i64, !dbg !5312
  %55 = getelementptr inbounds [10 x i8], ptr @Primary_weapon_to_powerup, i64 0, i64 %54, !dbg !5312
  %56 = load i8, ptr %55, align 1, !dbg !5312
  %57 = load i32, ptr @Stolen_item_index, align 4, !dbg !5313
  %58 = sext i32 %57 to i64, !dbg !5314
  %59 = getelementptr inbounds [10 x i8], ptr @Stolen_items, i64 0, i64 %58, !dbg !5314
  store i8 %56, ptr %59, align 1, !dbg !5315
  br label %60

60:                                               ; preds = %52, %48
  %61 = load i32, ptr %5, align 4, !dbg !5316
  %62 = add nsw i32 104, %61, !dbg !5317
  %63 = sext i32 %62 to i64, !dbg !5318
  %64 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef %63) #6, !dbg !5319
  %65 = load ptr, ptr %64, align 8, !dbg !5319
  call void (ptr, ...) @_Z13thief_messagePKcz(ptr noundef @.str.75, ptr noundef %65), !dbg !5320
  %66 = load i32, ptr %4, align 4, !dbg !5321
  %67 = sext i32 %66 to i64, !dbg !5322
  %68 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %67, !dbg !5322
  %69 = getelementptr inbounds nuw %struct.player, ptr %68, i32 0, i32 12, !dbg !5323
  %70 = load i8, ptr %69, align 2, !dbg !5324
  %71 = add i8 %70, -1, !dbg !5324
  store i8 %71, ptr %69, align 2, !dbg !5324
  call void @_Z21digi_play_sample_onceii(i32 noundef 244, i32 noundef 65536), !dbg !5325
  store i32 1, ptr %3, align 4, !dbg !5326
  br label %112, !dbg !5326

72:                                               ; preds = %32
  br label %109, !dbg !5327

73:                                               ; preds = %29
  %74 = load i32, ptr %4, align 4, !dbg !5328
  %75 = sext i32 %74 to i64, !dbg !5330
  %76 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %75, !dbg !5330
  %77 = getelementptr inbounds nuw %struct.player, ptr %76, i32 0, i32 15, !dbg !5331
  %78 = load i16, ptr %77, align 2, !dbg !5331
  %79 = zext i16 %78 to i32, !dbg !5330
  %80 = load i32, ptr %5, align 4, !dbg !5332
  %81 = shl i32 1, %80, !dbg !5333
  %82 = and i32 %79, %81, !dbg !5334
  %83 = icmp ne i32 %82, 0, !dbg !5330
  br i1 %83, label %84, label %108, !dbg !5330

84:                                               ; preds = %73
  %85 = load i32, ptr %5, align 4, !dbg !5335
  %86 = shl i32 1, %85, !dbg !5337
  %87 = xor i32 %86, -1, !dbg !5338
  %88 = load i32, ptr %4, align 4, !dbg !5339
  %89 = sext i32 %88 to i64, !dbg !5340
  %90 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %89, !dbg !5340
  %91 = getelementptr inbounds nuw %struct.player, ptr %90, i32 0, i32 15, !dbg !5341
  %92 = load i16, ptr %91, align 2, !dbg !5342
  %93 = zext i16 %92 to i32, !dbg !5342
  %94 = and i32 %93, %87, !dbg !5342
  %95 = trunc i32 %94 to i16, !dbg !5342
  store i16 %95, ptr %91, align 2, !dbg !5342
  %96 = load i32, ptr %5, align 4, !dbg !5343
  %97 = sext i32 %96 to i64, !dbg !5344
  %98 = getelementptr inbounds [10 x i8], ptr @Primary_weapon_to_powerup, i64 0, i64 %97, !dbg !5344
  %99 = load i8, ptr %98, align 1, !dbg !5344
  %100 = load i32, ptr @Stolen_item_index, align 4, !dbg !5345
  %101 = sext i32 %100 to i64, !dbg !5346
  %102 = getelementptr inbounds [10 x i8], ptr @Stolen_items, i64 0, i64 %101, !dbg !5346
  store i8 %99, ptr %102, align 1, !dbg !5347
  %103 = load i32, ptr %5, align 4, !dbg !5348
  %104 = add nsw i32 104, %103, !dbg !5349
  %105 = sext i32 %104 to i64, !dbg !5350
  %106 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) @Text_string, i64 noundef %105) #6, !dbg !5351
  %107 = load ptr, ptr %106, align 8, !dbg !5351
  call void (ptr, ...) @_Z13thief_messagePKcz(ptr noundef @.str.74, ptr noundef %107), !dbg !5352
  call void @_Z18auto_select_weaponi(i32 noundef 0), !dbg !5353
  call void @_Z21digi_play_sample_onceii(i32 noundef 244, i32 noundef 65536), !dbg !5354
  store i32 1, ptr %3, align 4, !dbg !5355
  br label %112, !dbg !5355

108:                                              ; preds = %73
  br label %109

109:                                              ; preds = %108, %72
  br label %110, !dbg !5356

110:                                              ; preds = %109, %26
  br label %111, !dbg !5357

111:                                              ; preds = %110, %16, %2
  store i32 0, ptr %3, align 4, !dbg !5358
  br label %112, !dbg !5358

112:                                              ; preds = %111, %84, %60
  %113 = load i32, ptr %3, align 4, !dbg !5359
  ret i32 %113, !dbg !5359
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z23attempt_to_steal_item_3P6objecti(ptr noundef %0, i32 noundef %1) #1 !dbg !5360 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !5363, !DIExpression(), !5364)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !5365, !DIExpression(), !5366)
    #dbg_declare(ptr %6, !5367, !DIExpression(), !5368)
  %7 = load ptr, ptr %4, align 8, !dbg !5369
  %8 = ptrtoint ptr %7 to i64, !dbg !5371
  %9 = sub i64 %8, ptrtoint (ptr @Objects to i64), !dbg !5371
  %10 = sdiv exact i64 %9, 268, !dbg !5371
  %11 = getelementptr inbounds [350 x %struct.ai_local], ptr @Ai_local_info, i64 0, i64 %10, !dbg !5372
  %12 = getelementptr inbounds nuw %struct.ai_local, ptr %11, i32 0, i32 3, !dbg !5373
  %13 = load i32, ptr %12, align 4, !dbg !5373
  %14 = icmp ne i32 %13, 15, !dbg !5374
  br i1 %14, label %15, label %16, !dbg !5374

15:                                               ; preds = %2
  store i32 0, ptr %3, align 4, !dbg !5375
  br label %109, !dbg !5375

16:                                               ; preds = %2
  %17 = load i32, ptr %5, align 4, !dbg !5376
  %18 = call noundef i32 @_Z21maybe_steal_flag_itemii(i32 noundef %17, i32 noundef 1), !dbg !5378
  %19 = icmp ne i32 %18, 0, !dbg !5378
  br i1 %19, label %20, label %21, !dbg !5378

20:                                               ; preds = %16
  store i32 1, ptr %3, align 4, !dbg !5379
  br label %109, !dbg !5379

21:                                               ; preds = %16
  %22 = load i8, ptr @Primary_weapon, align 1, !dbg !5380
  %23 = sext i8 %22 to i32, !dbg !5380
  %24 = icmp eq i32 %23, 0, !dbg !5382
  br i1 %24, label %25, label %31, !dbg !5382

25:                                               ; preds = %21
  %26 = load i32, ptr %5, align 4, !dbg !5383
  %27 = call noundef i32 @_Z21maybe_steal_flag_itemii(i32 noundef %26, i32 noundef 1024), !dbg !5385
  %28 = icmp ne i32 %27, 0, !dbg !5385
  br i1 %28, label %29, label %30, !dbg !5385

29:                                               ; preds = %25
  store i32 1, ptr %3, align 4, !dbg !5386
  br label %109, !dbg !5386

30:                                               ; preds = %25
  br label %31, !dbg !5387

31:                                               ; preds = %30, %21
  store i32 0, ptr %6, align 4, !dbg !5388
  br label %32, !dbg !5390

32:                                               ; preds = %43, %31
  %33 = load i32, ptr %6, align 4, !dbg !5391
  %34 = icmp slt i32 %33, 2, !dbg !5393
  br i1 %34, label %35, label %46, !dbg !5394

35:                                               ; preds = %32
  %36 = load i32, ptr %5, align 4, !dbg !5395
  %37 = load i8, ptr @Primary_weapon, align 1, !dbg !5397
  %38 = sext i8 %37 to i32, !dbg !5397
  %39 = call noundef i32 @_Z26maybe_steal_primary_weaponii(i32 noundef %36, i32 noundef %38), !dbg !5398
  %40 = icmp ne i32 %39, 0, !dbg !5398
  br i1 %40, label %41, label %42, !dbg !5398

41:                                               ; preds = %35
  store i32 1, ptr %3, align 4, !dbg !5399
  br label %109, !dbg !5399

42:                                               ; preds = %35
  br label %43, !dbg !5400

43:                                               ; preds = %42
  %44 = load i32, ptr %6, align 4, !dbg !5401
  %45 = add nsw i32 %44, 1, !dbg !5401
  store i32 %45, ptr %6, align 4, !dbg !5401
  br label %32, !dbg !5402, !llvm.loop !5403

46:                                               ; preds = %32
  %47 = load i32, ptr %5, align 4, !dbg !5405
  %48 = load i8, ptr @Secondary_weapon, align 1, !dbg !5407
  %49 = sext i8 %48 to i32, !dbg !5407
  %50 = call noundef i32 @_Z28maybe_steal_secondary_weaponii(i32 noundef %47, i32 noundef %49), !dbg !5408
  %51 = icmp ne i32 %50, 0, !dbg !5408
  br i1 %51, label %52, label %53, !dbg !5408

52:                                               ; preds = %46
  store i32 1, ptr %3, align 4, !dbg !5409
  br label %109, !dbg !5409

53:                                               ; preds = %46
  %54 = load i32, ptr %5, align 4, !dbg !5410
  %55 = call noundef i32 @_Z21maybe_steal_flag_itemii(i32 noundef %54, i32 noundef 1), !dbg !5412
  %56 = icmp ne i32 %55, 0, !dbg !5412
  br i1 %56, label %57, label %58, !dbg !5412

57:                                               ; preds = %53
  store i32 1, ptr %3, align 4, !dbg !5413
  br label %109, !dbg !5413

58:                                               ; preds = %53
  %59 = load i32, ptr %5, align 4, !dbg !5414
  %60 = call noundef i32 @_Z21maybe_steal_flag_itemii(i32 noundef %59, i32 noundef 2048), !dbg !5416
  %61 = icmp ne i32 %60, 0, !dbg !5416
  br i1 %61, label %62, label %63, !dbg !5416

62:                                               ; preds = %58
  store i32 1, ptr %3, align 4, !dbg !5417
  br label %109, !dbg !5417

63:                                               ; preds = %58
  %64 = load i32, ptr %5, align 4, !dbg !5418
  %65 = call noundef i32 @_Z21maybe_steal_flag_itemii(i32 noundef %64, i32 noundef 1024), !dbg !5420
  %66 = icmp ne i32 %65, 0, !dbg !5420
  br i1 %66, label %67, label %68, !dbg !5420

67:                                               ; preds = %63
  store i32 1, ptr %3, align 4, !dbg !5421
  br label %109, !dbg !5421

68:                                               ; preds = %63
  %69 = load i32, ptr %5, align 4, !dbg !5422
  %70 = call noundef i32 @_Z21maybe_steal_flag_itemii(i32 noundef %69, i32 noundef 4096), !dbg !5424
  %71 = icmp ne i32 %70, 0, !dbg !5424
  br i1 %71, label %72, label %73, !dbg !5424

72:                                               ; preds = %68
  store i32 1, ptr %3, align 4, !dbg !5425
  br label %109, !dbg !5425

73:                                               ; preds = %68
  %74 = load i32, ptr %5, align 4, !dbg !5426
  %75 = call noundef i32 @_Z21maybe_steal_flag_itemii(i32 noundef %74, i32 noundef 256), !dbg !5428
  %76 = icmp ne i32 %75, 0, !dbg !5428
  br i1 %76, label %77, label %78, !dbg !5428

77:                                               ; preds = %73
  store i32 1, ptr %3, align 4, !dbg !5429
  br label %109, !dbg !5429

78:                                               ; preds = %73
  %79 = load i32, ptr %5, align 4, !dbg !5430
  %80 = call noundef i32 @_Z21maybe_steal_flag_itemii(i32 noundef %79, i32 noundef 8192), !dbg !5432
  %81 = icmp ne i32 %80, 0, !dbg !5432
  br i1 %81, label %82, label %83, !dbg !5432

82:                                               ; preds = %78
  store i32 1, ptr %3, align 4, !dbg !5433
  br label %109, !dbg !5433

83:                                               ; preds = %78
  %84 = load i32, ptr %5, align 4, !dbg !5434
  %85 = call noundef i32 @_Z21maybe_steal_flag_itemii(i32 noundef %84, i32 noundef 64), !dbg !5436
  %86 = icmp ne i32 %85, 0, !dbg !5436
  br i1 %86, label %87, label %88, !dbg !5436

87:                                               ; preds = %83
  store i32 1, ptr %3, align 4, !dbg !5437
  br label %109, !dbg !5437

88:                                               ; preds = %83
  store i32 9, ptr %6, align 4, !dbg !5438
  br label %89, !dbg !5440

89:                                               ; preds = %105, %88
  %90 = load i32, ptr %6, align 4, !dbg !5441
  %91 = icmp sge i32 %90, 0, !dbg !5443
  br i1 %91, label %92, label %108, !dbg !5444

92:                                               ; preds = %89
  %93 = load i32, ptr %5, align 4, !dbg !5445
  %94 = load i32, ptr %6, align 4, !dbg !5448
  %95 = call noundef i32 @_Z26maybe_steal_primary_weaponii(i32 noundef %93, i32 noundef %94), !dbg !5449
  %96 = icmp ne i32 %95, 0, !dbg !5449
  br i1 %96, label %97, label %98, !dbg !5449

97:                                               ; preds = %92
  store i32 1, ptr %3, align 4, !dbg !5450
  br label %109, !dbg !5450

98:                                               ; preds = %92
  %99 = load i32, ptr %5, align 4, !dbg !5451
  %100 = load i32, ptr %6, align 4, !dbg !5453
  %101 = call noundef i32 @_Z28maybe_steal_secondary_weaponii(i32 noundef %99, i32 noundef %100), !dbg !5454
  %102 = icmp ne i32 %101, 0, !dbg !5454
  br i1 %102, label %103, label %104, !dbg !5454

103:                                              ; preds = %98
  store i32 1, ptr %3, align 4, !dbg !5455
  br label %109, !dbg !5455

104:                                              ; preds = %98
  br label %105, !dbg !5456

105:                                              ; preds = %104
  %106 = load i32, ptr %6, align 4, !dbg !5457
  %107 = add nsw i32 %106, -1, !dbg !5457
  store i32 %107, ptr %6, align 4, !dbg !5457
  br label %89, !dbg !5458, !llvm.loop !5459

108:                                              ; preds = %89
  store i32 0, ptr %3, align 4, !dbg !5461
  br label %109, !dbg !5461

109:                                              ; preds = %108, %103, %97, %87, %82, %77, %72, %67, %62, %57, %52, %41, %29, %20, %15
  %110 = load i32, ptr %3, align 4, !dbg !5462
  ret i32 %110, !dbg !5462
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z23attempt_to_steal_item_2P6objecti(ptr noundef %0, i32 noundef %1) #1 !dbg !5463 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !5464, !DIExpression(), !5465)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !5466, !DIExpression(), !5467)
    #dbg_declare(ptr %5, !5468, !DIExpression(), !5469)
  %6 = load ptr, ptr %3, align 8, !dbg !5470
  %7 = load i32, ptr %4, align 4, !dbg !5471
  %8 = call noundef i32 @_Z23attempt_to_steal_item_3P6objecti(ptr noundef %6, i32 noundef %7), !dbg !5472
  store i32 %8, ptr %5, align 4, !dbg !5473
  %9 = load i32, ptr %5, align 4, !dbg !5474
  %10 = icmp ne i32 %9, 0, !dbg !5474
  br i1 %10, label %11, label %22, !dbg !5474

11:                                               ; preds = %2
  %12 = load i32, ptr @Stolen_item_index, align 4, !dbg !5476
  %13 = add nsw i32 %12, 1, !dbg !5478
  %14 = srem i32 %13, 10, !dbg !5479
  store i32 %14, ptr @Stolen_item_index, align 4, !dbg !5480
  %15 = call noundef i32 @_Z6P_Randv(), !dbg !5481
  %16 = icmp sgt i32 %15, 20000, !dbg !5483
  br i1 %16, label %17, label %21, !dbg !5483

17:                                               ; preds = %11
  %18 = load i32, ptr @Stolen_item_index, align 4, !dbg !5484
  %19 = add nsw i32 %18, 1, !dbg !5485
  %20 = srem i32 %19, 10, !dbg !5486
  store i32 %20, ptr @Stolen_item_index, align 4, !dbg !5487
  br label %21, !dbg !5488

21:                                               ; preds = %17, %11
  br label %22, !dbg !5489

22:                                               ; preds = %21, %2
  %23 = load i32, ptr %5, align 4, !dbg !5490
  ret i32 %23, !dbg !5491
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z21attempt_to_steal_itemP6objecti(ptr noundef %0, i32 noundef %1) #1 !dbg !5492 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !5493, !DIExpression(), !5494)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !5495, !DIExpression(), !5496)
    #dbg_declare(ptr %6, !5497, !DIExpression(), !5498)
    #dbg_declare(ptr %7, !5499, !DIExpression(), !5500)
  store i32 0, ptr %7, align 4, !dbg !5500
  %8 = load ptr, ptr %4, align 8, !dbg !5501
  %9 = getelementptr inbounds nuw %struct.object, ptr %8, i32 0, i32 22, !dbg !5503
  %10 = getelementptr inbounds nuw %struct.ai_static, ptr %9, i32 0, i32 9, !dbg !5504
  %11 = load i32, ptr %10, align 4, !dbg !5504
  %12 = icmp ne i32 %11, 0, !dbg !5501
  br i1 %12, label %13, label %14, !dbg !5501

13:                                               ; preds = %2
  store i32 0, ptr %3, align 4, !dbg !5505
  br label %69, !dbg !5505

14:                                               ; preds = %2
  %15 = load ptr, ptr %4, align 8, !dbg !5506
  %16 = load i32, ptr %5, align 4, !dbg !5507
  %17 = call noundef i32 @_Z23attempt_to_steal_item_2P6objecti(ptr noundef %15, i32 noundef %16), !dbg !5508
  %18 = load i32, ptr %7, align 4, !dbg !5509
  %19 = add nsw i32 %18, %17, !dbg !5509
  store i32 %19, ptr %7, align 4, !dbg !5509
  store i32 0, ptr %6, align 4, !dbg !5510
  br label %20, !dbg !5512

20:                                               ; preds = %37, %14
  %21 = load i32, ptr %6, align 4, !dbg !5513
  %22 = icmp slt i32 %21, 3, !dbg !5515
  br i1 %22, label %23, label %40, !dbg !5516

23:                                               ; preds = %20
  %24 = load i32, ptr %7, align 4, !dbg !5517
  %25 = icmp ne i32 %24, 0, !dbg !5517
  br i1 %25, label %26, label %29, !dbg !5520

26:                                               ; preds = %23
  %27 = call noundef i32 @_Z6P_Randv(), !dbg !5521
  %28 = icmp slt i32 %27, 11000, !dbg !5522
  br i1 %28, label %29, label %35, !dbg !5520

29:                                               ; preds = %26, %23
  %30 = load ptr, ptr %4, align 8, !dbg !5523
  %31 = load i32, ptr %5, align 4, !dbg !5525
  %32 = call noundef i32 @_Z23attempt_to_steal_item_2P6objecti(ptr noundef %30, i32 noundef %31), !dbg !5526
  %33 = load i32, ptr %7, align 4, !dbg !5527
  %34 = add nsw i32 %33, %32, !dbg !5527
  store i32 %34, ptr %7, align 4, !dbg !5527
  br label %36, !dbg !5528

35:                                               ; preds = %26
  br label %41, !dbg !5529

36:                                               ; preds = %29
  br label %37, !dbg !5530

37:                                               ; preds = %36
  %38 = load i32, ptr %6, align 4, !dbg !5531
  %39 = add nsw i32 %38, 1, !dbg !5531
  store i32 %39, ptr %6, align 4, !dbg !5531
  br label %20, !dbg !5532, !llvm.loop !5533

40:                                               ; preds = %20
  br label %41, !dbg !5535

41:                                               ; preds = %40, %35
  %42 = load ptr, ptr %4, align 8, !dbg !5535
  %43 = load ptr, ptr @ConsoleObject, align 8, !dbg !5536
  %44 = getelementptr inbounds nuw %struct.object, ptr %43, i32 0, i32 9, !dbg !5537
  %45 = load i16, ptr %44, align 2, !dbg !5537
  %46 = sext i16 %45 to i32, !dbg !5536
  call void @_Z21create_n_segment_pathP6objectii(ptr noundef %42, i32 noundef 10, i32 noundef %46), !dbg !5538
  %47 = load i32, ptr @Difficulty_level, align 4, !dbg !5539
  %48 = sext i32 %47 to i64, !dbg !5540
  %49 = getelementptr inbounds [5 x i32], ptr @Thief_wait_times, i64 0, i64 %48, !dbg !5540
  %50 = load i32, ptr %49, align 4, !dbg !5540
  %51 = sdiv i32 %50, 2, !dbg !5541
  %52 = load ptr, ptr %4, align 8, !dbg !5542
  %53 = ptrtoint ptr %52 to i64, !dbg !5543
  %54 = sub i64 %53, ptrtoint (ptr @Objects to i64), !dbg !5543
  %55 = sdiv exact i64 %54, 268, !dbg !5543
  %56 = getelementptr inbounds [350 x %struct.ai_local], ptr @Ai_local_info, i64 0, i64 %55, !dbg !5544
  %57 = getelementptr inbounds nuw %struct.ai_local, ptr %56, i32 0, i32 7, !dbg !5545
  store i32 %51, ptr %57, align 4, !dbg !5546
  %58 = load ptr, ptr %4, align 8, !dbg !5547
  %59 = ptrtoint ptr %58 to i64, !dbg !5548
  %60 = sub i64 %59, ptrtoint (ptr @Objects to i64), !dbg !5548
  %61 = sdiv exact i64 %60, 268, !dbg !5548
  %62 = getelementptr inbounds [350 x %struct.ai_local], ptr @Ai_local_info, i64 0, i64 %61, !dbg !5549
  %63 = getelementptr inbounds nuw %struct.ai_local, ptr %62, i32 0, i32 3, !dbg !5550
  store i32 16, ptr %63, align 4, !dbg !5551
  %64 = load i32, ptr %7, align 4, !dbg !5552
  %65 = icmp ne i32 %64, 0, !dbg !5552
  br i1 %65, label %66, label %67, !dbg !5552

66:                                               ; preds = %41
  call void @_Z17PALETTE_FLASH_ADDiii(i32 noundef 30, i32 noundef 15, i32 noundef -20), !dbg !5554
  call void @_Z24update_laser_weapon_infov(), !dbg !5556
  br label %67, !dbg !5557

67:                                               ; preds = %66, %41
  %68 = load i32, ptr %7, align 4, !dbg !5558
  store i32 %68, ptr %3, align 4, !dbg !5559
  br label %69, !dbg !5559

69:                                               ; preds = %67, %13
  %70 = load i32, ptr %3, align 4, !dbg !5560
  ret i32 %70, !dbg !5560
}

declare void @_Z17PALETTE_FLASH_ADDiii(i32 noundef, i32 noundef, i32 noundef) #2

declare void @_Z24update_laser_weapon_infov() #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z17drop_stolen_itemsP6object(ptr noundef %0) #1 !dbg !5561 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !5562, !DIExpression(), !5563)
    #dbg_declare(ptr %3, !5564, !DIExpression(), !5565)
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.77), !dbg !5566
  store i32 0, ptr %3, align 4, !dbg !5567
  br label %4, !dbg !5569

4:                                                ; preds = %34, %1
  %5 = load i32, ptr %3, align 4, !dbg !5570
  %6 = icmp slt i32 %5, 10, !dbg !5572
  br i1 %6, label %7, label %37, !dbg !5573

7:                                                ; preds = %4
  %8 = load i32, ptr %3, align 4, !dbg !5574
  %9 = sext i32 %8 to i64, !dbg !5577
  %10 = getelementptr inbounds [10 x i8], ptr @Stolen_items, i64 0, i64 %9, !dbg !5577
  %11 = load i8, ptr %10, align 1, !dbg !5577
  %12 = zext i8 %11 to i32, !dbg !5577
  %13 = icmp ne i32 %12, 255, !dbg !5578
  br i1 %13, label %14, label %30, !dbg !5578

14:                                               ; preds = %7
  %15 = load i32, ptr %3, align 4, !dbg !5579
  %16 = sext i32 %15 to i64, !dbg !5580
  %17 = getelementptr inbounds [10 x i8], ptr @Stolen_items, i64 0, i64 %16, !dbg !5580
  %18 = load i8, ptr %17, align 1, !dbg !5580
  %19 = zext i8 %18 to i32, !dbg !5580
  %20 = load ptr, ptr %2, align 8, !dbg !5581
  %21 = getelementptr inbounds nuw %struct.object, ptr %20, i32 0, i32 21, !dbg !5582
  %22 = getelementptr inbounds nuw %struct.physics_info, ptr %21, i32 0, i32 0, !dbg !5583
  %23 = load ptr, ptr %2, align 8, !dbg !5584
  %24 = getelementptr inbounds nuw %struct.object, ptr %23, i32 0, i32 11, !dbg !5585
  %25 = load ptr, ptr %2, align 8, !dbg !5586
  %26 = getelementptr inbounds nuw %struct.object, ptr %25, i32 0, i32 9, !dbg !5587
  %27 = load i16, ptr %26, align 2, !dbg !5587
  %28 = sext i16 %27 to i32, !dbg !5586
  %29 = call noundef i32 @_Z12drop_powerupiiiP10vms_vectorS0_i(i32 noundef 7, i32 noundef %19, i32 noundef 1, ptr noundef %22, ptr noundef %24, i32 noundef %28), !dbg !5588
  br label %30, !dbg !5588

30:                                               ; preds = %14, %7
  %31 = load i32, ptr %3, align 4, !dbg !5589
  %32 = sext i32 %31 to i64, !dbg !5590
  %33 = getelementptr inbounds [10 x i8], ptr @Stolen_items, i64 0, i64 %32, !dbg !5590
  store i8 -1, ptr %33, align 1, !dbg !5591
  br label %34, !dbg !5592

34:                                               ; preds = %30
  %35 = load i32, ptr %3, align 4, !dbg !5593
  %36 = add nsw i32 %35, 1, !dbg !5593
  store i32 %36, ptr %3, align 4, !dbg !5593
  br label %4, !dbg !5594, !llvm.loop !5595

37:                                               ; preds = %4
  ret void, !dbg !5597
}

declare noundef i32 @_Z12drop_powerupiiiP10vms_vectorS0_i(i32 noundef, i32 noundef, i32 noundef, ptr noundef, ptr noundef, i32 noundef) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z14do_escort_menuv() #1 !dbg !5598 {
  %1 = alloca i32, align 4
  %2 = alloca [300 x i8], align 1
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca [32 x i8], align 1
  %7 = alloca [32 x i8], align 1
  %8 = alloca [32 x i8], align 1
  %9 = alloca i32, align 4
    #dbg_declare(ptr %1, !5599, !DIExpression(), !5600)
    #dbg_declare(ptr %2, !5601, !DIExpression(), !5605)
    #dbg_declare(ptr %3, !5606, !DIExpression(), !5607)
    #dbg_declare(ptr %4, !5608, !DIExpression(), !5609)
    #dbg_declare(ptr %5, !5610, !DIExpression(), !5611)
    #dbg_declare(ptr %6, !5612, !DIExpression(), !5616)
    #dbg_declare(ptr %7, !5617, !DIExpression(), !5618)
  %10 = load i32, ptr @Game_mode, align 4, !dbg !5619
  %11 = and i32 %10, 38, !dbg !5621
  %12 = icmp ne i32 %11, 0, !dbg !5619
  br i1 %12, label %13, label %15, !dbg !5619

13:                                               ; preds = %0
  %14 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.78), !dbg !5622
  br label %140, !dbg !5624

15:                                               ; preds = %0
  store i32 0, ptr %1, align 4, !dbg !5625
  br label %16, !dbg !5627

16:                                               ; preds = %42, %15
  %17 = load i32, ptr %1, align 4, !dbg !5628
  %18 = load i32, ptr @Highest_object_index, align 4, !dbg !5630
  %19 = icmp sle i32 %17, %18, !dbg !5631
  br i1 %19, label %20, label %45, !dbg !5632

20:                                               ; preds = %16
  %21 = load i32, ptr %1, align 4, !dbg !5633
  %22 = sext i32 %21 to i64, !dbg !5636
  %23 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %22, !dbg !5636
  %24 = getelementptr inbounds nuw %struct.object, ptr %23, i32 0, i32 1, !dbg !5637
  %25 = load i8, ptr %24, align 4, !dbg !5637
  %26 = zext i8 %25 to i32, !dbg !5636
  %27 = icmp eq i32 %26, 2, !dbg !5638
  br i1 %27, label %28, label %41, !dbg !5638

28:                                               ; preds = %20
  %29 = load i32, ptr %1, align 4, !dbg !5639
  %30 = sext i32 %29 to i64, !dbg !5641
  %31 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %30, !dbg !5641
  %32 = getelementptr inbounds nuw %struct.object, ptr %31, i32 0, i32 2, !dbg !5642
  %33 = load i8, ptr %32, align 1, !dbg !5642
  %34 = zext i8 %33 to i64, !dbg !5643
  %35 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %34, !dbg !5643
  %36 = getelementptr inbounds nuw %struct.robot_info, ptr %35, i32 0, i32 37, !dbg !5644
  %37 = load i8, ptr %36, align 1, !dbg !5644
  %38 = icmp ne i8 %37, 0, !dbg !5643
  br i1 %38, label %39, label %40, !dbg !5643

39:                                               ; preds = %28
  br label %46, !dbg !5645

40:                                               ; preds = %28
  br label %41, !dbg !5644

41:                                               ; preds = %40, %20
  br label %42, !dbg !5646

42:                                               ; preds = %41
  %43 = load i32, ptr %1, align 4, !dbg !5647
  %44 = add nsw i32 %43, 1, !dbg !5647
  store i32 %44, ptr %1, align 4, !dbg !5647
  br label %16, !dbg !5648, !llvm.loop !5649

45:                                               ; preds = %16
  br label %46, !dbg !5651

46:                                               ; preds = %45, %39
  %47 = load i32, ptr %1, align 4, !dbg !5651
  %48 = load i32, ptr @Highest_object_index, align 4, !dbg !5653
  %49 = icmp sgt i32 %47, %48, !dbg !5654
  br i1 %49, label %50, label %53, !dbg !5654

50:                                               ; preds = %46
  %51 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.79), !dbg !5655
  %52 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.80), !dbg !5657
  call void @_Z16create_buddy_botv(), !dbg !5658
  br label %53, !dbg !5659

53:                                               ; preds = %50, %46
  %54 = call noundef i32 @_Z20ok_for_buddy_to_talkv(), !dbg !5660
  %55 = load i32, ptr @Buddy_allowed_to_talk, align 4, !dbg !5661
  %56 = icmp ne i32 %55, 0, !dbg !5661
  br i1 %56, label %59, label %57, !dbg !5663

57:                                               ; preds = %53
  %58 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.81, ptr noundef @guidebot_name), !dbg !5664
  br label %140, !dbg !5666

59:                                               ; preds = %53
  call void @_Z22digi_pause_digi_soundsv(), !dbg !5667
  call void @_Z9stop_timev(), !dbg !5668
  call void @_Z12palette_savev(), !dbg !5669
  call void @_Z22apply_modified_palettev(), !dbg !5670
  call void @_Z17reset_palette_addv(), !dbg !5671
  call void @_Z17game_flush_inputsv(), !dbg !5672
  store i32 1, ptr %3, align 4, !dbg !5673
  call void @_Z16set_popup_screenv(), !dbg !5674
  call void @_Z15gr_palette_loadPh(ptr noundef @gr_palette), !dbg !5675
  %60 = load i32, ptr @Escort_special_goal, align 4, !dbg !5676
  %61 = icmp eq i32 %60, 13, !dbg !5678
  br i1 %61, label %62, label %64, !dbg !5678

62:                                               ; preds = %59
  store i32 -1, ptr @Escort_special_goal, align 4, !dbg !5679
  %63 = call noundef i32 @_Z22escort_set_goal_objectv(), !dbg !5681
  store i32 %63, ptr %5, align 4, !dbg !5682
  store i32 13, ptr @Escort_special_goal, align 4, !dbg !5683
  br label %66, !dbg !5684

64:                                               ; preds = %59
  store i32 -1, ptr @Escort_special_goal, align 4, !dbg !5685
  %65 = call noundef i32 @_Z22escort_set_goal_objectv(), !dbg !5687
  store i32 %65, ptr %5, align 4, !dbg !5688
  br label %66

66:                                               ; preds = %64, %62
  %67 = load i32, ptr %5, align 4, !dbg !5689
  switch i32 %67, label %95 [
    i32 -1, label %68
    i32 1, label %71
    i32 2, label %74
    i32 3, label %77
    i32 4, label %80
    i32 15, label %83
    i32 5, label %86
    i32 16, label %89
    i32 17, label %89
    i32 18, label %89
    i32 19, label %89
    i32 20, label %89
    i32 21, label %89
    i32 22, label %89
    i32 23, label %89
    i32 24, label %89
  ], !dbg !5690

68:                                               ; preds = %66
  call void @_Z4Int3v(), !dbg !5691
  %69 = getelementptr inbounds [32 x i8], ptr %6, i64 0, i64 0, !dbg !5693
  %70 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %69, ptr noundef @.str.82) #6, !dbg !5694
  br label %95, !dbg !5695

71:                                               ; preds = %66
  %72 = getelementptr inbounds [32 x i8], ptr %6, i64 0, i64 0, !dbg !5696
  %73 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %72, ptr noundef @.str.83) #6, !dbg !5697
  br label %95, !dbg !5698

74:                                               ; preds = %66
  %75 = getelementptr inbounds [32 x i8], ptr %6, i64 0, i64 0, !dbg !5699
  %76 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %75, ptr noundef @.str.84) #6, !dbg !5700
  br label %95, !dbg !5701

77:                                               ; preds = %66
  %78 = getelementptr inbounds [32 x i8], ptr %6, i64 0, i64 0, !dbg !5702
  %79 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %78, ptr noundef @.str.85) #6, !dbg !5703
  br label %95, !dbg !5704

80:                                               ; preds = %66
  %81 = getelementptr inbounds [32 x i8], ptr %6, i64 0, i64 0, !dbg !5705
  %82 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %81, ptr noundef @.str.86) #6, !dbg !5706
  br label %95, !dbg !5707

83:                                               ; preds = %66
  %84 = getelementptr inbounds [32 x i8], ptr %6, i64 0, i64 0, !dbg !5708
  %85 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %84, ptr noundef @.str.87) #6, !dbg !5709
  br label %95, !dbg !5710

86:                                               ; preds = %66
  %87 = getelementptr inbounds [32 x i8], ptr %6, i64 0, i64 0, !dbg !5711
  %88 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %87, ptr noundef @.str.88) #6, !dbg !5712
  br label %95, !dbg !5713

89:                                               ; preds = %66, %66, %66, %66, %66, %66, %66, %66, %66
  %90 = getelementptr inbounds [32 x i8], ptr %6, i64 0, i64 0, !dbg !5714
  %91 = load i32, ptr %5, align 4, !dbg !5715
  %92 = sub nsw i32 %91, 16, !dbg !5716
  %93 = add nsw i32 %92, 1, !dbg !5717
  %94 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %90, ptr noundef @.str.89, i32 noundef %93) #6, !dbg !5718
  br label %95, !dbg !5719

95:                                               ; preds = %66, %89, %86, %83, %80, %77, %74, %71, %68
  %96 = load i32, ptr @Buddy_messages_suppressed, align 4, !dbg !5720
  %97 = icmp ne i32 %96, 0, !dbg !5720
  br i1 %97, label %101, label %98, !dbg !5722

98:                                               ; preds = %95
  %99 = getelementptr inbounds [32 x i8], ptr %7, i64 0, i64 0, !dbg !5723
  %100 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %99, ptr noundef @.str.90) #6, !dbg !5724
  br label %104, !dbg !5724

101:                                              ; preds = %95
  %102 = getelementptr inbounds [32 x i8], ptr %7, i64 0, i64 0, !dbg !5725
  %103 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %102, ptr noundef @.str.91) #6, !dbg !5726
  br label %104

104:                                              ; preds = %101, %98
  %105 = getelementptr inbounds [300 x i8], ptr %2, i64 0, i64 0, !dbg !5727
  %106 = getelementptr inbounds [32 x i8], ptr %6, i64 0, i64 0, !dbg !5728
  %107 = getelementptr inbounds [32 x i8], ptr %7, i64 0, i64 0, !dbg !5729
  %108 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %105, ptr noundef @.str.92, ptr noundef %106, ptr noundef %107) #6, !dbg !5730
  %109 = getelementptr inbounds [300 x i8], ptr %2, i64 0, i64 0, !dbg !5731
  call void @_Z16show_escort_menuPc(ptr noundef %109), !dbg !5732
  call void @_Z19plat_present_canvasi(i32 noundef 0), !dbg !5733
  br label %110, !dbg !5734

110:                                              ; preds = %138, %104
  %111 = load i32, ptr %3, align 4, !dbg !5735
  %112 = icmp ne i32 %111, 0, !dbg !5735
  br i1 %112, label %113, label %139, !dbg !5734

113:                                              ; preds = %110
  %114 = call noundef i32 @_Z9key_getchv(), !dbg !5736
  store i32 %114, ptr %4, align 4, !dbg !5738
  %115 = load i32, ptr %4, align 4, !dbg !5739
  switch i32 %115, label %137 [
    i32 11, label %116
    i32 2, label %116
    i32 3, label %116
    i32 4, label %116
    i32 5, label %116
    i32 6, label %116
    i32 7, label %116
    i32 8, label %116
    i32 9, label %116
    i32 10, label %116
    i32 1, label %118
    i32 28, label %118
    i32 183, label %119
    i32 14, label %120
    i32 20, label %121
  ], !dbg !5740

116:                                              ; preds = %113, %113, %113, %113, %113, %113, %113, %113, %113, %113
  store i32 -1, ptr @Looking_for_marker, align 4, !dbg !5741
  store i32 -1, ptr @Last_buddy_key, align 4, !dbg !5743
  %117 = load i32, ptr %4, align 4, !dbg !5744
  call void @_Z23set_escort_special_goali(i32 noundef %117), !dbg !5745
  store i32 -1, ptr @Last_buddy_key, align 4, !dbg !5746
  store i32 0, ptr %3, align 4, !dbg !5747
  br label %138, !dbg !5748

118:                                              ; preds = %113, %113
  call void @_Z19clear_boxed_messagev(), !dbg !5749
  store i32 0, ptr %3, align 4, !dbg !5750
  br label %138, !dbg !5751

119:                                              ; preds = %113
  call void @_Z16save_screen_shoti(i32 noundef 0), !dbg !5752
  br label %138, !dbg !5753

120:                                              ; preds = %113
  call void @_Z4Int3v(), !dbg !5754
  br label %138, !dbg !5755

121:                                              ; preds = %113
    #dbg_declare(ptr %8, !5756, !DIExpression(), !5758)
    #dbg_declare(ptr %9, !5759, !DIExpression(), !5760)
  %122 = load i32, ptr @Buddy_messages_suppressed, align 4, !dbg !5761
  %123 = icmp ne i32 %122, 0, !dbg !5761
  %124 = xor i1 %123, true, !dbg !5762
  %125 = zext i1 %124 to i32, !dbg !5762
  store i32 %125, ptr %9, align 4, !dbg !5763
  %126 = load i32, ptr %9, align 4, !dbg !5764
  %127 = icmp ne i32 %126, 0, !dbg !5764
  br i1 %127, label %128, label %131, !dbg !5764

128:                                              ; preds = %121
  %129 = getelementptr inbounds [32 x i8], ptr %8, i64 0, i64 0, !dbg !5766
  %130 = call ptr @strcpy(ptr noundef %129, ptr noundef @.str.93) #6, !dbg !5767
  br label %134, !dbg !5767

131:                                              ; preds = %121
  %132 = getelementptr inbounds [32 x i8], ptr %8, i64 0, i64 0, !dbg !5768
  %133 = call ptr @strcpy(ptr noundef %132, ptr noundef @.str.94) #6, !dbg !5769
  br label %134

134:                                              ; preds = %131, %128
  store i32 1, ptr @Buddy_messages_suppressed, align 4, !dbg !5770
  %135 = getelementptr inbounds [32 x i8], ptr %8, i64 0, i64 0, !dbg !5771
  call void (ptr, ...) @_Z13buddy_messagePKcz(ptr noundef @.str.95, ptr noundef %135), !dbg !5772
  %136 = load i32, ptr %9, align 4, !dbg !5773
  store i32 %136, ptr @Buddy_messages_suppressed, align 4, !dbg !5774
  store i32 0, ptr %3, align 4, !dbg !5775
  br label %138, !dbg !5776

137:                                              ; preds = %113
  br label %138, !dbg !5777

138:                                              ; preds = %137, %134, %120, %119, %118, %116
  br label %110, !dbg !5734, !llvm.loop !5778

139:                                              ; preds = %110
  call void @_Z17game_flush_inputsv(), !dbg !5780
  call void @_Z15palette_restorev(), !dbg !5781
  call void @_Z10start_timev(), !dbg !5782
  call void @_Z23digi_resume_digi_soundsv(), !dbg !5783
  br label %140, !dbg !5784

140:                                              ; preds = %139, %57, %13
  ret void, !dbg !5784
}

declare void @_Z16create_buddy_botv() #2

declare void @_Z22digi_pause_digi_soundsv() #2

declare void @_Z9stop_timev() #2

declare void @_Z12palette_savev() #2

declare void @_Z22apply_modified_palettev() #2

declare void @_Z17reset_palette_addv() #2

declare void @_Z17game_flush_inputsv() #2

declare void @_Z16set_popup_screenv() #2

declare void @_Z15gr_palette_loadPh(ptr noundef) #2

; Function Attrs: nounwind
declare i32 @sprintf(ptr noundef, ptr noundef, ...) #4

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z16show_escort_menuPc(ptr noundef %0) #1 !dbg !5785 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !5788, !DIExpression(), !5789)
    #dbg_declare(ptr %3, !5790, !DIExpression(), !5791)
    #dbg_declare(ptr %4, !5792, !DIExpression(), !5793)
    #dbg_declare(ptr %5, !5794, !DIExpression(), !5795)
    #dbg_declare(ptr %6, !5796, !DIExpression(), !5797)
    #dbg_declare(ptr %7, !5798, !DIExpression(), !5799)
  call void @_Z21gr_set_current_canvasP11_grs_canvas(ptr noundef @VR_screen_pages), !dbg !5800
  %8 = load i32, ptr @FontHires, align 4, !dbg !5801
  %9 = add nsw i32 8, %8, !dbg !5801
  %10 = sext i32 %9 to i64, !dbg !5801
  %11 = getelementptr inbounds [10 x ptr], ptr @Gamefonts, i64 0, i64 %10, !dbg !5801
  %12 = load ptr, ptr %11, align 8, !dbg !5801
  call void @_Z14gr_set_curfontP9_grs_font(ptr noundef %12), !dbg !5802
  %13 = load ptr, ptr %2, align 8, !dbg !5803
  call void @_Z18gr_get_string_sizePKcPiS1_S1_(ptr noundef %13, ptr noundef %3, ptr noundef %4, ptr noundef %5), !dbg !5804
  %14 = load ptr, ptr @grd_curscreen, align 8, !dbg !5805
  %15 = getelementptr inbounds nuw %struct._grs_screen, ptr %14, i32 0, i32 2, !dbg !5806
  %16 = load i16, ptr %15, align 2, !dbg !5806
  %17 = sext i16 %16 to i32, !dbg !5805
  %18 = load i32, ptr %3, align 4, !dbg !5807
  %19 = sub nsw i32 %17, %18, !dbg !5808
  %20 = sdiv i32 %19, 2, !dbg !5809
  store i32 %20, ptr %6, align 4, !dbg !5810
  %21 = load ptr, ptr @grd_curscreen, align 8, !dbg !5811
  %22 = getelementptr inbounds nuw %struct._grs_screen, ptr %21, i32 0, i32 3, !dbg !5812
  %23 = load i16, ptr %22, align 4, !dbg !5812
  %24 = sext i16 %23 to i32, !dbg !5811
  %25 = load i32, ptr %4, align 4, !dbg !5813
  %26 = sub nsw i32 %24, %25, !dbg !5814
  %27 = sdiv i32 %26, 4, !dbg !5815
  store i32 %27, ptr %7, align 4, !dbg !5816
  %28 = call noundef i32 @_Z21gr_find_closest_coloriii(i32 noundef 0, i32 noundef 56, i32 noundef 0), !dbg !5817
  call void @_Z16gr_set_fontcolorii(i32 noundef %28, i32 noundef -1), !dbg !5818
  %29 = load i32, ptr %6, align 4, !dbg !5819
  %30 = sub nsw i32 %29, 15, !dbg !5820
  %31 = load i32, ptr %7, align 4, !dbg !5821
  %32 = sub nsw i32 %31, 15, !dbg !5822
  %33 = load i32, ptr %6, align 4, !dbg !5823
  %34 = load i32, ptr %3, align 4, !dbg !5824
  %35 = add nsw i32 %33, %34, !dbg !5825
  %36 = add nsw i32 %35, 15, !dbg !5826
  %37 = sub nsw i32 %36, 1, !dbg !5827
  %38 = load i32, ptr %7, align 4, !dbg !5828
  %39 = load i32, ptr %4, align 4, !dbg !5829
  %40 = add nsw i32 %38, %39, !dbg !5830
  %41 = add nsw i32 %40, 15, !dbg !5831
  %42 = sub nsw i32 %41, 1, !dbg !5832
  call void @_Z18nm_draw_backgroundiiii(i32 noundef %30, i32 noundef %32, i32 noundef %37, i32 noundef %42), !dbg !5833
  %43 = load i32, ptr %6, align 4, !dbg !5834
  %44 = load i32, ptr %7, align 4, !dbg !5835
  %45 = load ptr, ptr %2, align 8, !dbg !5836
  %46 = call noundef i32 @_Z10gr_ustringiiPKc(i32 noundef %43, i32 noundef %44, ptr noundef %45), !dbg !5837
  call void @_Z13reset_cockpitv(), !dbg !5838
  ret void, !dbg !5839
}

declare void @_Z19plat_present_canvasi(i32 noundef) #2

declare noundef i32 @_Z9key_getchv() #2

declare void @_Z19clear_boxed_messagev() #2

declare void @_Z16save_screen_shoti(i32 noundef) #2

declare void @_Z15palette_restorev() #2

declare void @_Z10start_timev() #2

declare void @_Z23digi_resume_digi_soundsv() #2

declare void @_Z21gr_set_current_canvasP11_grs_canvas(ptr noundef) #2

declare void @_Z14gr_set_curfontP9_grs_font(ptr noundef) #2

declare void @_Z18gr_get_string_sizePKcPiS1_S1_(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #2

declare void @_Z16gr_set_fontcolorii(i32 noundef, i32 noundef) #2

declare void @_Z18nm_draw_backgroundiiii(i32 noundef, i32 noundef, i32 noundef, i32 noundef) #2

declare noundef i32 @_Z10gr_ustringiiPKc(i32 noundef, i32 noundef, ptr noundef) #2

declare void @_Z13reset_cockpitv() #2

attributes #0 = { mustprogress noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { mustprogress noinline ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #2 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #4 = { nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #5 = { nocallback nofree nosync nounwind willreturn }
attributes #6 = { nounwind }

!llvm.module.flags = !{!1660, !1661, !1662, !1663, !1664, !1665, !1666}
!llvm.dbg.cu = !{!72}
!llvm.ident = !{!1667}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 70, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "main_d2/escort.cpp", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "a59dd54a42b019823b31a8b189a126d9")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 72, elements: !6)
!4 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !5)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !{!7}
!7 = !DISubrange(count: 9)
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(scope: null, file: !2, line: 71, type: !10, isLocal: true, isDefinition: true)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 88, elements: !11)
!11 = !{!12}
!12 = !DISubrange(count: 11)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(scope: null, file: !2, line: 72, type: !15, isLocal: true, isDefinition: true)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 64, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 8)
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(scope: null, file: !2, line: 73, type: !15, isLocal: true, isDefinition: true)
!20 = !DIGlobalVariableExpression(var: !21, expr: !DIExpression())
!21 = distinct !DIGlobalVariable(scope: null, file: !2, line: 74, type: !22, isLocal: true, isDefinition: true)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 40, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 5)
!25 = !DIGlobalVariableExpression(var: !26, expr: !DIExpression())
!26 = distinct !DIGlobalVariable(scope: null, file: !2, line: 75, type: !27, isLocal: true, isDefinition: true)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 56, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 7)
!30 = !DIGlobalVariableExpression(var: !31, expr: !DIExpression())
!31 = distinct !DIGlobalVariable(scope: null, file: !2, line: 76, type: !32, isLocal: true, isDefinition: true)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 80, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 10)
!35 = !DIGlobalVariableExpression(var: !36, expr: !DIExpression())
!36 = distinct !DIGlobalVariable(scope: null, file: !2, line: 77, type: !27, isLocal: true, isDefinition: true)
!37 = !DIGlobalVariableExpression(var: !38, expr: !DIExpression())
!38 = distinct !DIGlobalVariable(scope: null, file: !2, line: 78, type: !15, isLocal: true, isDefinition: true)
!39 = !DIGlobalVariableExpression(var: !40, expr: !DIExpression())
!40 = distinct !DIGlobalVariable(scope: null, file: !2, line: 79, type: !41, isLocal: true, isDefinition: true)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 48, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 6)
!44 = !DIGlobalVariableExpression(var: !45, expr: !DIExpression())
!45 = distinct !DIGlobalVariable(scope: null, file: !2, line: 80, type: !3, isLocal: true, isDefinition: true)
!46 = !DIGlobalVariableExpression(var: !47, expr: !DIExpression())
!47 = distinct !DIGlobalVariable(scope: null, file: !2, line: 81, type: !22, isLocal: true, isDefinition: true)
!48 = !DIGlobalVariableExpression(var: !49, expr: !DIExpression())
!49 = distinct !DIGlobalVariable(scope: null, file: !2, line: 82, type: !41, isLocal: true, isDefinition: true)
!50 = !DIGlobalVariableExpression(var: !51, expr: !DIExpression())
!51 = distinct !DIGlobalVariable(scope: null, file: !2, line: 84, type: !22, isLocal: true, isDefinition: true)
!52 = !DIGlobalVariableExpression(var: !53, expr: !DIExpression())
!53 = distinct !DIGlobalVariable(scope: null, file: !2, line: 85, type: !3, isLocal: true, isDefinition: true)
!54 = !DIGlobalVariableExpression(var: !55, expr: !DIExpression())
!55 = distinct !DIGlobalVariable(scope: null, file: !2, line: 86, type: !3, isLocal: true, isDefinition: true)
!56 = !DIGlobalVariableExpression(var: !57, expr: !DIExpression())
!57 = distinct !DIGlobalVariable(scope: null, file: !2, line: 87, type: !3, isLocal: true, isDefinition: true)
!58 = !DIGlobalVariableExpression(var: !59, expr: !DIExpression())
!59 = distinct !DIGlobalVariable(scope: null, file: !2, line: 88, type: !3, isLocal: true, isDefinition: true)
!60 = !DIGlobalVariableExpression(var: !61, expr: !DIExpression())
!61 = distinct !DIGlobalVariable(scope: null, file: !2, line: 89, type: !3, isLocal: true, isDefinition: true)
!62 = !DIGlobalVariableExpression(var: !63, expr: !DIExpression())
!63 = distinct !DIGlobalVariable(scope: null, file: !2, line: 90, type: !3, isLocal: true, isDefinition: true)
!64 = !DIGlobalVariableExpression(var: !65, expr: !DIExpression())
!65 = distinct !DIGlobalVariable(scope: null, file: !2, line: 91, type: !3, isLocal: true, isDefinition: true)
!66 = !DIGlobalVariableExpression(var: !67, expr: !DIExpression())
!67 = distinct !DIGlobalVariable(scope: null, file: !2, line: 92, type: !3, isLocal: true, isDefinition: true)
!68 = !DIGlobalVariableExpression(var: !69, expr: !DIExpression())
!69 = distinct !DIGlobalVariable(scope: null, file: !2, line: 93, type: !3, isLocal: true, isDefinition: true)
!70 = !DIGlobalVariableExpression(var: !71, expr: !DIExpression())
!71 = distinct !DIGlobalVariable(name: "Escort_goal_text", scope: !72, file: !2, line: 69, type: !1659, isLocal: false, isDefinition: true)
!72 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !73, producer: "Homebrew clang version 20.1.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !74, imports: !364, splitDebugInlining: false, nameTableKind: Apple, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk", sdk: "MacOSX15.sdk")
!73 = !DIFile(filename: "/Users/richard/code/ChocolateDescent/main_d2/escort.cpp", directory: "/Users/richard/code/ChocolateDescent/build-c-ref", checksumkind: CSK_MD5, checksum: "a59dd54a42b019823b31a8b189a126d9")
!74 = !{!0, !8, !13, !18, !20, !25, !30, !35, !37, !39, !44, !46, !48, !50, !52, !54, !56, !58, !60, !62, !64, !66, !68, !70, !75, !78, !80, !86, !88, !94, !96, !98, !100, !102, !104, !106, !108, !110, !112, !114, !117, !119, !124, !129, !134, !136, !138, !143, !145, !147, !152, !157, !162, !164, !169, !174, !176, !178, !183, !185, !187, !189, !191, !193, !198, !203, !205, !207, !209, !211, !213, !215, !217, !222, !224, !229, !231, !236, !238, !240, !245, !250, !255, !257, !262, !267, !269, !274, !279, !281, !284, !286, !288, !290, !292, !294, !296, !298, !300, !302, !304, !306, !308, !313, !318, !323, !325, !330, !332, !334, !336, !338, !340, !342, !344, !346, !348, !350, !355, !357, !359, !361}
!75 = !DIGlobalVariableExpression(var: !76, expr: !DIExpression())
!76 = distinct !DIGlobalVariable(name: "Max_escort_length", scope: !72, file: !2, line: 97, type: !77, isLocal: false, isDefinition: true)
!77 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!78 = !DIGlobalVariableExpression(var: !79, expr: !DIExpression())
!79 = distinct !DIGlobalVariable(name: "Escort_kill_object", scope: !72, file: !2, line: 98, type: !77, isLocal: false, isDefinition: true)
!80 = !DIGlobalVariableExpression(var: !81, expr: !DIExpression())
!81 = distinct !DIGlobalVariable(name: "Stolen_items", scope: !72, file: !2, line: 99, type: !82, isLocal: false, isDefinition: true)
!82 = !DICompositeType(tag: DW_TAG_array_type, baseType: !83, size: 80, elements: !33)
!83 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !84, line: 31, baseType: !85)
!84 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint8_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8b64ccf8c67b8c006b07b8daf1b49be5")
!85 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!86 = !DIGlobalVariableExpression(var: !87, expr: !DIExpression())
!87 = distinct !DIGlobalVariable(name: "Stolen_item_index", scope: !72, file: !2, line: 100, type: !77, isLocal: false, isDefinition: true)
!88 = !DIGlobalVariableExpression(var: !89, expr: !DIExpression())
!89 = distinct !DIGlobalVariable(name: "Escort_last_path_created", scope: !72, file: !2, line: 101, type: !90, isLocal: false, isDefinition: true)
!90 = !DIDerivedType(tag: DW_TAG_typedef, name: "fix", file: !91, line: 20, baseType: !92)
!91 = !DIFile(filename: "./fix/fix.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "c5006a11bf8b4cb7d963898499eda13a")
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !93, line: 30, baseType: !77)
!93 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int32_t.h", directory: "", checksumkind: CSK_MD5, checksum: "d23e8406e80ee79983f28509c741fa17")
!94 = !DIGlobalVariableExpression(var: !95, expr: !DIExpression())
!95 = distinct !DIGlobalVariable(name: "Escort_goal_object", scope: !72, file: !2, line: 102, type: !77, isLocal: false, isDefinition: true)
!96 = !DIGlobalVariableExpression(var: !97, expr: !DIExpression())
!97 = distinct !DIGlobalVariable(name: "Escort_special_goal", scope: !72, file: !2, line: 102, type: !77, isLocal: false, isDefinition: true)
!98 = !DIGlobalVariableExpression(var: !99, expr: !DIExpression())
!99 = distinct !DIGlobalVariable(name: "Escort_goal_index", scope: !72, file: !2, line: 102, type: !77, isLocal: false, isDefinition: true)
!100 = !DIGlobalVariableExpression(var: !101, expr: !DIExpression())
!101 = distinct !DIGlobalVariable(name: "Buddy_messages_suppressed", scope: !72, file: !2, line: 102, type: !77, isLocal: false, isDefinition: true)
!102 = !DIGlobalVariableExpression(var: !103, expr: !DIExpression())
!103 = distinct !DIGlobalVariable(name: "Buddy_sorry_time", scope: !72, file: !2, line: 103, type: !90, isLocal: false, isDefinition: true)
!104 = !DIGlobalVariableExpression(var: !105, expr: !DIExpression())
!105 = distinct !DIGlobalVariable(name: "Buddy_objnum", scope: !72, file: !2, line: 104, type: !77, isLocal: false, isDefinition: true)
!106 = !DIGlobalVariableExpression(var: !107, expr: !DIExpression())
!107 = distinct !DIGlobalVariable(name: "Buddy_allowed_to_talk", scope: !72, file: !2, line: 104, type: !77, isLocal: false, isDefinition: true)
!108 = !DIGlobalVariableExpression(var: !109, expr: !DIExpression())
!109 = distinct !DIGlobalVariable(name: "Looking_for_marker", scope: !72, file: !2, line: 105, type: !77, isLocal: false, isDefinition: true)
!110 = !DIGlobalVariableExpression(var: !111, expr: !DIExpression())
!111 = distinct !DIGlobalVariable(name: "Last_buddy_key", scope: !72, file: !2, line: 106, type: !77, isLocal: false, isDefinition: true)
!112 = !DIGlobalVariableExpression(var: !113, expr: !DIExpression())
!113 = distinct !DIGlobalVariable(name: "Last_buddy_message_time", scope: !72, file: !2, line: 108, type: !90, isLocal: false, isDefinition: true)
!114 = !DIGlobalVariableExpression(var: !115, expr: !DIExpression())
!115 = distinct !DIGlobalVariable(name: "guidebot_name", scope: !72, file: !2, line: 112, type: !116, isLocal: false, isDefinition: true)
!116 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 80, elements: !33)
!117 = !DIGlobalVariableExpression(var: !118, expr: !DIExpression())
!118 = distinct !DIGlobalVariable(name: "real_guidebot_name", scope: !72, file: !2, line: 113, type: !116, isLocal: false, isDefinition: true)
!119 = !DIGlobalVariableExpression(var: !120, expr: !DIExpression())
!120 = distinct !DIGlobalVariable(scope: null, file: !2, line: 240, type: !121, isLocal: true, isDefinition: true)
!121 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 160, elements: !122)
!122 = !{!123}
!123 = !DISubrange(count: 20)
!124 = !DIGlobalVariableExpression(var: !125, expr: !DIExpression())
!125 = distinct !DIGlobalVariable(scope: null, file: !2, line: 240, type: !126, isLocal: true, isDefinition: true)
!126 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 448, elements: !127)
!127 = !{!128}
!128 = !DISubrange(count: 56)
!129 = !DIGlobalVariableExpression(var: !130, expr: !DIExpression())
!130 = distinct !DIGlobalVariable(scope: null, file: !2, line: 399, type: !131, isLocal: true, isDefinition: true)
!131 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 176, elements: !132)
!132 = !{!133}
!133 = !DISubrange(count: 22)
!134 = !DIGlobalVariableExpression(var: !135, expr: !DIExpression())
!135 = distinct !DIGlobalVariable(scope: null, file: !2, line: 436, type: !41, isLocal: true, isDefinition: true)
!136 = !DIGlobalVariableExpression(var: !137, expr: !DIExpression())
!137 = distinct !DIGlobalVariable(scope: null, file: !2, line: 457, type: !27, isLocal: true, isDefinition: true)
!138 = !DIGlobalVariableExpression(var: !139, expr: !DIExpression())
!139 = distinct !DIGlobalVariable(scope: null, file: !2, line: 496, type: !140, isLocal: true, isDefinition: true)
!140 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 208, elements: !141)
!141 = !{!142}
!142 = !DISubrange(count: 26)
!143 = !DIGlobalVariableExpression(var: !144, expr: !DIExpression())
!144 = distinct !DIGlobalVariable(scope: null, file: !2, line: 500, type: !131, isLocal: true, isDefinition: true)
!145 = !DIGlobalVariableExpression(var: !146, expr: !DIExpression())
!146 = distinct !DIGlobalVariable(scope: null, file: !2, line: 539, type: !131, isLocal: true, isDefinition: true)
!147 = !DIGlobalVariableExpression(var: !148, expr: !DIExpression())
!148 = distinct !DIGlobalVariable(scope: null, file: !2, line: 746, type: !149, isLocal: true, isDefinition: true)
!149 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 136, elements: !150)
!150 = !{!151}
!151 = !DISubrange(count: 17)
!152 = !DIGlobalVariableExpression(var: !153, expr: !DIExpression())
!153 = distinct !DIGlobalVariable(scope: null, file: !2, line: 747, type: !154, isLocal: true, isDefinition: true)
!154 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 152, elements: !155)
!155 = !{!156}
!156 = !DISubrange(count: 19)
!157 = !DIGlobalVariableExpression(var: !158, expr: !DIExpression())
!158 = distinct !DIGlobalVariable(scope: null, file: !2, line: 748, type: !159, isLocal: true, isDefinition: true)
!159 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 128, elements: !160)
!160 = !{!161}
!161 = !DISubrange(count: 16)
!162 = !DIGlobalVariableExpression(var: !163, expr: !DIExpression())
!163 = distinct !DIGlobalVariable(scope: null, file: !2, line: 749, type: !159, isLocal: true, isDefinition: true)
!164 = !DIGlobalVariableExpression(var: !165, expr: !DIExpression())
!165 = distinct !DIGlobalVariable(scope: null, file: !2, line: 750, type: !166, isLocal: true, isDefinition: true)
!166 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 104, elements: !167)
!167 = !{!168}
!168 = !DISubrange(count: 13)
!169 = !DIGlobalVariableExpression(var: !170, expr: !DIExpression())
!170 = distinct !DIGlobalVariable(scope: null, file: !2, line: 751, type: !171, isLocal: true, isDefinition: true)
!171 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 120, elements: !172)
!172 = !{!173}
!173 = !DISubrange(count: 15)
!174 = !DIGlobalVariableExpression(var: !175, expr: !DIExpression())
!175 = distinct !DIGlobalVariable(scope: null, file: !2, line: 752, type: !131, isLocal: true, isDefinition: true)
!176 = !DIGlobalVariableExpression(var: !177, expr: !DIExpression())
!177 = distinct !DIGlobalVariable(scope: null, file: !2, line: 753, type: !149, isLocal: true, isDefinition: true)
!178 = !DIGlobalVariableExpression(var: !179, expr: !DIExpression())
!179 = distinct !DIGlobalVariable(scope: null, file: !2, line: 754, type: !180, isLocal: true, isDefinition: true)
!180 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 144, elements: !181)
!181 = !{!182}
!182 = !DISubrange(count: 18)
!183 = !DIGlobalVariableExpression(var: !184, expr: !DIExpression())
!184 = distinct !DIGlobalVariable(scope: null, file: !2, line: 755, type: !159, isLocal: true, isDefinition: true)
!185 = !DIGlobalVariableExpression(var: !186, expr: !DIExpression())
!186 = distinct !DIGlobalVariable(scope: null, file: !2, line: 756, type: !180, isLocal: true, isDefinition: true)
!187 = !DIGlobalVariableExpression(var: !188, expr: !DIExpression())
!188 = distinct !DIGlobalVariable(scope: null, file: !2, line: 757, type: !159, isLocal: true, isDefinition: true)
!189 = !DIGlobalVariableExpression(var: !190, expr: !DIExpression())
!190 = distinct !DIGlobalVariable(scope: null, file: !2, line: 758, type: !154, isLocal: true, isDefinition: true)
!191 = !DIGlobalVariableExpression(var: !192, expr: !DIExpression())
!192 = distinct !DIGlobalVariable(scope: null, file: !2, line: 759, type: !131, isLocal: true, isDefinition: true)
!193 = !DIGlobalVariableExpression(var: !194, expr: !DIExpression())
!194 = distinct !DIGlobalVariable(scope: null, file: !2, line: 772, type: !195, isLocal: true, isDefinition: true)
!195 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 192, elements: !196)
!196 = !{!197}
!197 = !DISubrange(count: 24)
!198 = !DIGlobalVariableExpression(var: !199, expr: !DIExpression())
!199 = distinct !DIGlobalVariable(scope: null, file: !2, line: 855, type: !200, isLocal: true, isDefinition: true)
!200 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 112, elements: !201)
!201 = !{!202}
!202 = !DISubrange(count: 14)
!203 = !DIGlobalVariableExpression(var: !204, expr: !DIExpression())
!204 = distinct !DIGlobalVariable(scope: null, file: !2, line: 871, type: !171, isLocal: true, isDefinition: true)
!205 = !DIGlobalVariableExpression(var: !206, expr: !DIExpression())
!206 = distinct !DIGlobalVariable(scope: null, file: !2, line: 875, type: !159, isLocal: true, isDefinition: true)
!207 = !DIGlobalVariableExpression(var: !208, expr: !DIExpression())
!208 = distinct !DIGlobalVariable(name: "Buddy_last_seen_player", scope: !72, file: !2, line: 938, type: !90, isLocal: false, isDefinition: true)
!209 = !DIGlobalVariableExpression(var: !210, expr: !DIExpression())
!210 = distinct !DIGlobalVariable(name: "Buddy_last_player_path_created", scope: !72, file: !2, line: 938, type: !90, isLocal: false, isDefinition: true)
!211 = !DIGlobalVariableExpression(var: !212, expr: !DIExpression())
!212 = distinct !DIGlobalVariable(name: "Buddy_dude_cheat", scope: !72, file: !2, line: 962, type: !77, isLocal: false, isDefinition: true)
!213 = !DIGlobalVariableExpression(var: !214, expr: !DIExpression())
!214 = distinct !DIGlobalVariable(name: "Last_come_back_message_time", scope: !72, file: !2, line: 963, type: !90, isLocal: false, isDefinition: true)
!215 = !DIGlobalVariableExpression(var: !216, expr: !DIExpression())
!216 = distinct !DIGlobalVariable(name: "Buddy_last_missile_time", scope: !72, file: !2, line: 965, type: !90, isLocal: false, isDefinition: true)
!217 = !DIGlobalVariableExpression(var: !218, expr: !DIExpression())
!218 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1000, type: !219, isLocal: true, isDefinition: true)
!219 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 248, elements: !220)
!220 = !{!221}
!221 = !DISubrange(count: 31)
!222 = !DIGlobalVariableExpression(var: !223, expr: !DIExpression())
!223 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1002, type: !3, isLocal: true, isDefinition: true)
!224 = !DIGlobalVariableExpression(var: !225, expr: !DIExpression())
!225 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1028, type: !226, isLocal: true, isDefinition: true)
!226 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !227)
!227 = !{!228}
!228 = !DISubrange(count: 40)
!229 = !DIGlobalVariableExpression(var: !230, expr: !DIExpression())
!230 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1030, type: !15, isLocal: true, isDefinition: true)
!231 = !DIGlobalVariableExpression(var: !232, expr: !DIExpression())
!232 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1083, type: !233, isLocal: true, isDefinition: true)
!233 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 560, elements: !234)
!234 = !{!235}
!235 = !DISubrange(count: 70)
!236 = !DIGlobalVariableExpression(var: !237, expr: !DIExpression())
!237 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1094, type: !140, isLocal: true, isDefinition: true)
!238 = !DIGlobalVariableExpression(var: !239, expr: !DIExpression())
!239 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1104, type: !140, isLocal: true, isDefinition: true)
!240 = !DIGlobalVariableExpression(var: !241, expr: !DIExpression())
!241 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1128, type: !242, isLocal: true, isDefinition: true)
!242 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 336, elements: !243)
!243 = !{!244}
!244 = !DISubrange(count: 42)
!245 = !DIGlobalVariableExpression(var: !246, expr: !DIExpression())
!246 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1141, type: !247, isLocal: true, isDefinition: true)
!247 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 312, elements: !248)
!248 = !{!249}
!249 = !DISubrange(count: 39)
!250 = !DIGlobalVariableExpression(var: !251, expr: !DIExpression())
!251 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1150, type: !252, isLocal: true, isDefinition: true)
!252 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 288, elements: !253)
!253 = !{!254}
!254 = !DISubrange(count: 36)
!255 = !DIGlobalVariableExpression(var: !256, expr: !DIExpression())
!256 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1155, type: !195, isLocal: true, isDefinition: true)
!257 = !DIGlobalVariableExpression(var: !258, expr: !DIExpression())
!258 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1170, type: !259, isLocal: true, isDefinition: true)
!259 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 264, elements: !260)
!260 = !{!261}
!261 = !DISubrange(count: 33)
!262 = !DIGlobalVariableExpression(var: !263, expr: !DIExpression())
!263 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1174, type: !264, isLocal: true, isDefinition: true)
!264 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 280, elements: !265)
!265 = !{!266}
!266 = !DISubrange(count: 35)
!267 = !DIGlobalVariableExpression(var: !268, expr: !DIExpression())
!268 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1187, type: !264, isLocal: true, isDefinition: true)
!269 = !DIGlobalVariableExpression(var: !270, expr: !DIExpression())
!270 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1207, type: !271, isLocal: true, isDefinition: true)
!271 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 328, elements: !272)
!272 = !{!273}
!273 = !DISubrange(count: 41)
!274 = !DIGlobalVariableExpression(var: !275, expr: !DIExpression())
!275 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1316, type: !276, isLocal: true, isDefinition: true)
!276 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !277)
!277 = !{!278}
!278 = !DISubrange(count: 67)
!279 = !DIGlobalVariableExpression(var: !280, expr: !DIExpression())
!280 = distinct !DIGlobalVariable(name: "Re_init_thief_time", scope: !72, file: !2, line: 1325, type: !90, isLocal: false, isDefinition: true)
!281 = !DIGlobalVariableExpression(var: !282, expr: !DIExpression())
!282 = distinct !DIGlobalVariable(name: "Thief_wait_times", scope: !72, file: !2, line: 1345, type: !283, isLocal: false, isDefinition: true)
!283 = !DICompositeType(tag: DW_TAG_array_type, baseType: !90, size: 160, elements: !23)
!284 = !DIGlobalVariableExpression(var: !285, expr: !DIExpression())
!285 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1494, type: !140, isLocal: true, isDefinition: true)
!286 = !DIGlobalVariableExpression(var: !287, expr: !DIExpression())
!287 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1515, type: !195, isLocal: true, isDefinition: true)
!288 = !DIGlobalVariableExpression(var: !289, expr: !DIExpression())
!289 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1519, type: !200, isLocal: true, isDefinition: true)
!290 = !DIGlobalVariableExpression(var: !291, expr: !DIExpression())
!291 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1523, type: !149, isLocal: true, isDefinition: true)
!292 = !DIGlobalVariableExpression(var: !293, expr: !DIExpression())
!293 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1527, type: !121, isLocal: true, isDefinition: true)
!294 = !DIGlobalVariableExpression(var: !295, expr: !DIExpression())
!295 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1531, type: !121, isLocal: true, isDefinition: true)
!296 = !DIGlobalVariableExpression(var: !297, expr: !DIExpression())
!297 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1539, type: !180, isLocal: true, isDefinition: true)
!298 = !DIGlobalVariableExpression(var: !299, expr: !DIExpression())
!299 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1543, type: !180, isLocal: true, isDefinition: true)
!300 = !DIGlobalVariableExpression(var: !301, expr: !DIExpression())
!301 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1547, type: !121, isLocal: true, isDefinition: true)
!302 = !DIGlobalVariableExpression(var: !303, expr: !DIExpression())
!303 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1573, type: !10, isLocal: true, isDefinition: true)
!304 = !DIGlobalVariableExpression(var: !305, expr: !DIExpression())
!305 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1597, type: !121, isLocal: true, isDefinition: true)
!306 = !DIGlobalVariableExpression(var: !307, expr: !DIExpression())
!307 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1742, type: !195, isLocal: true, isDefinition: true)
!308 = !DIGlobalVariableExpression(var: !309, expr: !DIExpression())
!309 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1758, type: !310, isLocal: true, isDefinition: true)
!310 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 184, elements: !311)
!311 = !{!312}
!312 = !DISubrange(count: 23)
!313 = !DIGlobalVariableExpression(var: !314, expr: !DIExpression())
!314 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1784, type: !315, isLocal: true, isDefinition: true)
!315 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 232, elements: !316)
!316 = !{!317}
!317 = !DISubrange(count: 29)
!318 = !DIGlobalVariableExpression(var: !319, expr: !DIExpression())
!319 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1797, type: !320, isLocal: true, isDefinition: true)
!320 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 240, elements: !321)
!321 = !{!322}
!322 = !DISubrange(count: 30)
!323 = !DIGlobalVariableExpression(var: !324, expr: !DIExpression())
!324 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1801, type: !264, isLocal: true, isDefinition: true)
!325 = !DIGlobalVariableExpression(var: !326, expr: !DIExpression())
!326 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1812, type: !327, isLocal: true, isDefinition: true)
!327 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 200, elements: !328)
!328 = !{!329}
!329 = !DISubrange(count: 25)
!330 = !DIGlobalVariableExpression(var: !331, expr: !DIExpression())
!331 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1849, type: !41, isLocal: true, isDefinition: true)
!332 = !DIGlobalVariableExpression(var: !333, expr: !DIExpression())
!333 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1854, type: !3, isLocal: true, isDefinition: true)
!334 = !DIGlobalVariableExpression(var: !335, expr: !DIExpression())
!335 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1857, type: !10, isLocal: true, isDefinition: true)
!336 = !DIGlobalVariableExpression(var: !337, expr: !DIExpression())
!337 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1860, type: !15, isLocal: true, isDefinition: true)
!338 = !DIGlobalVariableExpression(var: !339, expr: !DIExpression())
!339 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1863, type: !15, isLocal: true, isDefinition: true)
!340 = !DIGlobalVariableExpression(var: !341, expr: !DIExpression())
!341 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1866, type: !22, isLocal: true, isDefinition: true)
!342 = !DIGlobalVariableExpression(var: !343, expr: !DIExpression())
!343 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1869, type: !22, isLocal: true, isDefinition: true)
!344 = !DIGlobalVariableExpression(var: !345, expr: !DIExpression())
!345 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1880, type: !32, isLocal: true, isDefinition: true)
!346 = !DIGlobalVariableExpression(var: !347, expr: !DIExpression())
!347 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1886, type: !3, isLocal: true, isDefinition: true)
!348 = !DIGlobalVariableExpression(var: !349, expr: !DIExpression())
!349 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1888, type: !27, isLocal: true, isDefinition: true)
!350 = !DIGlobalVariableExpression(var: !351, expr: !DIExpression())
!351 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1890, type: !352, isLocal: true, isDefinition: true)
!352 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 2160, elements: !353)
!353 = !{!354}
!354 = !DISubrange(count: 270)
!355 = !DIGlobalVariableExpression(var: !356, expr: !DIExpression())
!356 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1968, type: !10, isLocal: true, isDefinition: true)
!357 = !DIGlobalVariableExpression(var: !358, expr: !DIExpression())
!358 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1970, type: !15, isLocal: true, isDefinition: true)
!359 = !DIGlobalVariableExpression(var: !360, expr: !DIExpression())
!360 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1973, type: !166, isLocal: true, isDefinition: true)
!361 = !DIGlobalVariableExpression(var: !362, expr: !DIExpression(DW_OP_constu, 16, DW_OP_stack_value))
!362 = distinct !DIGlobalVariable(name: "FRACBITS", scope: !72, file: !91, line: 18, type: !363, isLocal: true, isDefinition: true)
!363 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !77)
!364 = !{!365, !372, !376, !377, !381, !382, !386, !390, !394, !397, !399, !401, !403, !405, !407, !409, !411, !413, !415, !417, !419, !421, !423, !425, !427, !433, !437, !440, !443, !448, !454, !456, !458, !460, !462, !464, !466, !468, !470, !472, !474, !476, !478, !480, !485, !490, !495, !500, !502, !505, !507, !509, !511, !513, !515, !517, !519, !521, !523, !527, !532, !536, !538, !542, !546, !559, !575, !576, !631, !640, !642, !650, !656, !660, !664, !666, !670, !674, !678, !682, !686, !690, !692, !694, !698, !704, !709, !713, !717, !721, !725, !729, !733, !737, !739, !741, !745, !747, !751, !755, !760, !762, !764, !766, !770, !774, !778, !780, !784, !786, !788, !790, !792, !798, !802, !804, !810, !815, !819, !823, !828, !833, !837, !841, !845, !849, !851, !853, !861, !867, !873, !877, !881, !885, !889, !894, !898, !902, !906, !910, !914, !918, !922, !926, !931, !935, !939, !943, !948, !953, !957, !959, !963, !965, !974, !978, !983, !987, !991, !995, !999, !1001, !1005, !1009, !1013, !1017, !1021, !1023, !1025, !1027, !1035, !1037, !1039, !1041, !1047, !1049, !1050, !1051, !1052, !1055, !1057, !1058, !1062, !1064, !1066, !1070, !1072, !1074, !1076, !1078, !1080, !1082, !1084, !1089, !1093, !1095, !1097, !1098, !1103, !1105, !1107, !1109, !1111, !1113, !1115, !1117, !1119, !1121, !1123, !1125, !1127, !1129, !1131, !1133, !1135, !1139, !1141, !1143, !1145, !1149, !1151, !1155, !1157, !1159, !1161, !1163, !1167, !1169, !1171, !1175, !1177, !1179, !1183, !1185, !1189, !1191, !1193, !1197, !1199, !1201, !1203, !1205, !1207, !1209, !1213, !1215, !1217, !1219, !1221, !1223, !1225, !1227, !1231, !1235, !1237, !1239, !1241, !1243, !1245, !1247, !1249, !1251, !1253, !1255, !1257, !1259, !1261, !1263, !1265, !1267, !1269, !1271, !1273, !1277, !1279, !1281, !1283, !1287, !1289, !1293, !1295, !1297, !1299, !1301, !1305, !1307, !1311, !1313, !1315, !1317, !1319, !1323, !1325, !1327, !1331, !1333, !1335, !1337, !1343, !1345, !1349, !1353, !1355, !1357, !1361, !1365, !1369, !1371, !1375, !1380, !1384, !1388, !1390, !1392, !1394, !1396, !1398, !1400, !1404, !1408, !1413, !1418, !1422, !1423, !1427, !1431, !1436, !1441, !1445, !1451, !1455, !1457, !1461, !1463, !1464, !1468, !1470, !1474, !1478, !1482, !1484, !1488, !1492, !1496, !1502, !1504, !1508, !1512, !1516, !1518, !1522, !1526, !1530, !1532, !1534, !1536, !1540, !1544, !1549, !1553, !1559, !1563, !1567, !1569, !1571, !1573, !1577, !1581, !1585, !1587, !1589, !1593, !1597, !1599, !1603, !1607, !1610, !1612, !1614, !1616, !1645, !1650, !1655}
!365 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !368, file: !371, line: 158)
!366 = !DINamespace(name: "__1", scope: !367, exportSymbols: true)
!367 = !DINamespace(name: "std", scope: null)
!368 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !369, line: 30, baseType: !370)
!369 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int8_t.h", directory: "", checksumkind: CSK_MD5, checksum: "5052dfe782b50fed2355b8f61a9e4fa9")
!370 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!371 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdint", directory: "")
!372 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !373, file: !371, line: 159)
!373 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !374, line: 30, baseType: !375)
!374 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int16_t.h", directory: "", checksumkind: CSK_MD5, checksum: "47ed3c3ac6f65bfec021ca2b7be18e7e")
!375 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!376 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !92, file: !371, line: 160)
!377 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !378, file: !371, line: 161)
!378 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !379, line: 30, baseType: !380)
!379 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int64_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e6d85c1a9e23dbf7518ce3b162aac800")
!380 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!381 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !83, file: !371, line: 163)
!382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !383, file: !371, line: 164)
!383 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !384, line: 31, baseType: !385)
!384 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint16_t.h", directory: "", checksumkind: CSK_MD5, checksum: "f0aa926da906b10566dd3171bf347ab7")
!385 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !387, file: !371, line: 165)
!387 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !388, line: 31, baseType: !389)
!388 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint32_t.h", directory: "", checksumkind: CSK_MD5, checksum: "0254eb80c6b9719ac45c3c1cf872109b")
!389 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !391, file: !371, line: 166)
!391 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !392, line: 31, baseType: !393)
!392 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint64_t.h", directory: "", checksumkind: CSK_MD5, checksum: "77fc5e91653260959605f129691cf9b1")
!393 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !395, file: !371, line: 168)
!395 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !396, line: 29, baseType: !368)
!396 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "042ceedaf4137a8aaa272d0b27434016")
!397 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !398, file: !371, line: 169)
!398 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !396, line: 30, baseType: !373)
!399 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !400, file: !371, line: 170)
!400 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !396, line: 31, baseType: !92)
!401 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !402, file: !371, line: 171)
!402 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !396, line: 32, baseType: !378)
!403 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !404, file: !371, line: 173)
!404 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !396, line: 33, baseType: !83)
!405 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !406, file: !371, line: 174)
!406 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !396, line: 34, baseType: !383)
!407 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !408, file: !371, line: 175)
!408 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !396, line: 35, baseType: !387)
!409 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !410, file: !371, line: 176)
!410 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !396, line: 36, baseType: !391)
!411 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !412, file: !371, line: 178)
!412 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !396, line: 40, baseType: !368)
!413 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !414, file: !371, line: 179)
!414 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !396, line: 41, baseType: !373)
!415 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !416, file: !371, line: 180)
!416 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !396, line: 42, baseType: !92)
!417 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !418, file: !371, line: 181)
!418 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !396, line: 43, baseType: !378)
!419 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !420, file: !371, line: 183)
!420 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !396, line: 44, baseType: !83)
!421 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !422, file: !371, line: 184)
!422 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !396, line: 45, baseType: !383)
!423 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !424, file: !371, line: 185)
!424 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !396, line: 46, baseType: !387)
!425 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !426, file: !371, line: 186)
!426 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !396, line: 47, baseType: !391)
!427 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !428, file: !371, line: 188)
!428 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !429, line: 32, baseType: !430)
!429 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_intptr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e478ba47270923b1cca6659f19f02db1")
!430 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_intptr_t", file: !431, line: 40, baseType: !432)
!431 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/arm/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "b270144f57ae258d0ce80b8f87be068c")
!432 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!433 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !434, file: !371, line: 189)
!434 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !435, line: 34, baseType: !436)
!435 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_uintptr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e70ae655dd1b9d4ae0b1dcc073f5b7e4")
!436 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!437 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !438, file: !371, line: 191)
!438 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !439, line: 32, baseType: !432)
!439 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_intmax_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e37b9240f30f486478152ef3989b1545")
!440 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !441, file: !371, line: 192)
!441 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !442, line: 32, baseType: !436)
!442 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uintmax_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8217a3fbb207d8e87ca5318c313e81c2")
!443 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !444, file: !447, line: 22)
!444 = !DIDerivedType(tag: DW_TAG_typedef, name: "max_align_t", file: !445, line: 16, baseType: !446)
!445 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/lib/clang/20/include/__stddef_max_align_t.h", directory: "", checksumkind: CSK_MD5, checksum: "3c0a2f19d136d39aa835c737c7105def")
!446 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
!447 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__cstddef/max_align_t.h", directory: "")
!448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !449, file: !453, line: 113)
!449 = !DISubprogram(name: "isalnum", linkageName: "_Z7isalnumi", scope: !450, file: !450, line: 217, type: !451, flags: DIFlagPrototyped, spFlags: 0)
!450 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_ctype.h", directory: "", checksumkind: CSK_MD5, checksum: "b10215117a277691ffc4168ac4505796")
!451 = !DISubroutineType(types: !452)
!452 = !{!77, !77}
!453 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cctype", directory: "")
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !455, file: !453, line: 114)
!455 = !DISubprogram(name: "isalpha", linkageName: "_Z7isalphai", scope: !450, file: !450, line: 223, type: !451, flags: DIFlagPrototyped, spFlags: 0)
!456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !457, file: !453, line: 115)
!457 = !DISubprogram(name: "isblank", linkageName: "_Z7isblanki", scope: !450, file: !450, line: 229, type: !451, flags: DIFlagPrototyped, spFlags: 0)
!458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !459, file: !453, line: 116)
!459 = !DISubprogram(name: "iscntrl", linkageName: "_Z7iscntrli", scope: !450, file: !450, line: 235, type: !451, flags: DIFlagPrototyped, spFlags: 0)
!460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !461, file: !453, line: 117)
!461 = !DISubprogram(name: "isdigit", linkageName: "_Z7isdigiti", scope: !450, file: !450, line: 242, type: !451, flags: DIFlagPrototyped, spFlags: 0)
!462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !463, file: !453, line: 118)
!463 = !DISubprogram(name: "isgraph", linkageName: "_Z7isgraphi", scope: !450, file: !450, line: 248, type: !451, flags: DIFlagPrototyped, spFlags: 0)
!464 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !465, file: !453, line: 119)
!465 = !DISubprogram(name: "islower", linkageName: "_Z7isloweri", scope: !450, file: !450, line: 254, type: !451, flags: DIFlagPrototyped, spFlags: 0)
!466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !467, file: !453, line: 120)
!467 = !DISubprogram(name: "isprint", linkageName: "_Z7isprinti", scope: !450, file: !450, line: 260, type: !451, flags: DIFlagPrototyped, spFlags: 0)
!468 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !469, file: !453, line: 121)
!469 = !DISubprogram(name: "ispunct", linkageName: "_Z7ispuncti", scope: !450, file: !450, line: 266, type: !451, flags: DIFlagPrototyped, spFlags: 0)
!470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !471, file: !453, line: 122)
!471 = !DISubprogram(name: "isspace", linkageName: "_Z7isspacei", scope: !450, file: !450, line: 272, type: !451, flags: DIFlagPrototyped, spFlags: 0)
!472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !473, file: !453, line: 123)
!473 = !DISubprogram(name: "isupper", linkageName: "_Z7isupperi", scope: !450, file: !450, line: 278, type: !451, flags: DIFlagPrototyped, spFlags: 0)
!474 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !475, file: !453, line: 124)
!475 = !DISubprogram(name: "isxdigit", linkageName: "_Z8isxdigiti", scope: !450, file: !450, line: 285, type: !451, flags: DIFlagPrototyped, spFlags: 0)
!476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !477, file: !453, line: 125)
!477 = !DISubprogram(name: "tolower", linkageName: "_Z7toloweri", scope: !450, file: !450, line: 297, type: !451, flags: DIFlagPrototyped, spFlags: 0)
!478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !479, file: !453, line: 126)
!479 = !DISubprogram(name: "toupper", linkageName: "_Z7toupperi", scope: !450, file: !450, line: 303, type: !451, flags: DIFlagPrototyped, spFlags: 0)
!480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !481, file: !484, line: 75)
!481 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !482, line: 32, baseType: !483)
!482 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_wint_t.h", directory: "", checksumkind: CSK_MD5, checksum: "6dfd3a3d5009054224653c03b2c2b6ac")
!483 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wint_t", file: !431, line: 111, baseType: !77)
!484 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cwctype", directory: "")
!485 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !486, file: !484, line: 76)
!486 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !487, line: 32, baseType: !488)
!487 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_wctrans_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e70040c8494301cc74e19df26f4c1d76")
!488 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wctrans_t", file: !489, line: 44, baseType: !77)
!489 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "c789da493a5b476a3618b20a8fcff3c3")
!490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !491, file: !484, line: 77)
!491 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !492, line: 32, baseType: !493)
!492 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_wctype_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8d1720b82a490c742e6a297f971be2a2")
!493 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wctype_t", file: !489, line: 46, baseType: !494)
!494 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !431, line: 36, baseType: !389)
!495 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !496, file: !484, line: 78)
!496 = !DISubprogram(name: "iswalnum", linkageName: "_Z8iswalnumi", scope: !497, file: !497, line: 84, type: !498, flags: DIFlagPrototyped, spFlags: 0)
!497 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/___wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "d5a8bf0b4062c20bda4d49376e5b44d9")
!498 = !DISubroutineType(types: !499)
!499 = !{!77, !481}
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !501, file: !484, line: 79)
!501 = !DISubprogram(name: "iswalpha", linkageName: "_Z8iswalphai", scope: !497, file: !497, line: 90, type: !498, flags: DIFlagPrototyped, spFlags: 0)
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !503, file: !484, line: 80)
!503 = !DISubprogram(name: "iswblank", linkageName: "_Z8iswblanki", scope: !504, file: !504, line: 53, type: !498, flags: DIFlagPrototyped, spFlags: 0)
!504 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "6bc93063cb32b00d3df790305c546a93")
!505 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !506, file: !484, line: 81)
!506 = !DISubprogram(name: "iswcntrl", linkageName: "_Z8iswcntrli", scope: !497, file: !497, line: 96, type: !498, flags: DIFlagPrototyped, spFlags: 0)
!507 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !508, file: !484, line: 82)
!508 = !DISubprogram(name: "iswdigit", linkageName: "_Z8iswdigiti", scope: !497, file: !497, line: 108, type: !498, flags: DIFlagPrototyped, spFlags: 0)
!509 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !510, file: !484, line: 83)
!510 = !DISubprogram(name: "iswgraph", linkageName: "_Z8iswgraphi", scope: !497, file: !497, line: 114, type: !498, flags: DIFlagPrototyped, spFlags: 0)
!511 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !512, file: !484, line: 84)
!512 = !DISubprogram(name: "iswlower", linkageName: "_Z8iswloweri", scope: !497, file: !497, line: 120, type: !498, flags: DIFlagPrototyped, spFlags: 0)
!513 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !514, file: !484, line: 85)
!514 = !DISubprogram(name: "iswprint", linkageName: "_Z8iswprinti", scope: !497, file: !497, line: 126, type: !498, flags: DIFlagPrototyped, spFlags: 0)
!515 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !516, file: !484, line: 86)
!516 = !DISubprogram(name: "iswpunct", linkageName: "_Z8iswpuncti", scope: !497, file: !497, line: 132, type: !498, flags: DIFlagPrototyped, spFlags: 0)
!517 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !518, file: !484, line: 87)
!518 = !DISubprogram(name: "iswspace", linkageName: "_Z8iswspacei", scope: !497, file: !497, line: 138, type: !498, flags: DIFlagPrototyped, spFlags: 0)
!519 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !520, file: !484, line: 88)
!520 = !DISubprogram(name: "iswupper", linkageName: "_Z8iswupperi", scope: !497, file: !497, line: 144, type: !498, flags: DIFlagPrototyped, spFlags: 0)
!521 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !522, file: !484, line: 89)
!522 = !DISubprogram(name: "iswxdigit", linkageName: "_Z9iswxdigiti", scope: !497, file: !497, line: 150, type: !498, flags: DIFlagPrototyped, spFlags: 0)
!523 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !524, file: !484, line: 90)
!524 = !DISubprogram(name: "iswctype", linkageName: "_Z8iswctypeij", scope: !497, file: !497, line: 102, type: !525, flags: DIFlagPrototyped, spFlags: 0)
!525 = !DISubroutineType(types: !526)
!526 = !{!77, !481, !491}
!527 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !528, file: !484, line: 91)
!528 = !DISubprogram(name: "wctype", scope: !497, file: !497, line: 190, type: !529, flags: DIFlagPrototyped, spFlags: 0)
!529 = !DISubroutineType(types: !530)
!530 = !{!491, !531}
!531 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !533, file: !484, line: 92)
!533 = !DISubprogram(name: "towlower", linkageName: "_Z8towloweri", scope: !497, file: !497, line: 156, type: !534, flags: DIFlagPrototyped, spFlags: 0)
!534 = !DISubroutineType(types: !535)
!535 = !{!481, !481}
!536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !537, file: !484, line: 93)
!537 = !DISubprogram(name: "towupper", linkageName: "_Z8towupperi", scope: !497, file: !497, line: 162, type: !534, flags: DIFlagPrototyped, spFlags: 0)
!538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !539, file: !484, line: 94)
!539 = !DISubprogram(name: "towctrans", scope: !504, file: !504, line: 124, type: !540, flags: DIFlagPrototyped, spFlags: 0)
!540 = !DISubroutineType(types: !541)
!541 = !{!481, !481, !486}
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !543, file: !484, line: 95)
!543 = !DISubprogram(name: "wctrans", scope: !504, file: !504, line: 126, type: !544, flags: DIFlagPrototyped, spFlags: 0)
!544 = !DISubroutineType(types: !545)
!545 = !{!486, !531}
!546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !547, file: !558, line: 133)
!547 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !548, line: 32, baseType: !549)
!548 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8f920c8f4b68eb07504db5a6777c5466")
!549 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_mbstate_t", file: !431, line: 72, baseType: !550)
!550 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !431, line: 70, baseType: !551)
!551 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !431, line: 67, size: 1024, flags: DIFlagTypePassByValue, elements: !552, identifier: "_ZTS11__mbstate_t")
!552 = !{!553, !557}
!553 = !DIDerivedType(tag: DW_TAG_member, name: "__mbstate8", scope: !551, file: !431, line: 68, baseType: !554, size: 1024)
!554 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1024, elements: !555)
!555 = !{!556}
!556 = !DISubrange(count: 128)
!557 = !DIDerivedType(tag: DW_TAG_member, name: "_mbstateL", scope: !551, file: !431, line: 69, baseType: !380, size: 64)
!558 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cwchar", directory: "")
!559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !560, file: !558, line: 134)
!560 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !561, line: 78, size: 448, flags: DIFlagTypePassByValue, elements: !562, identifier: "_ZTS2tm")
!561 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_time.h", directory: "", checksumkind: CSK_MD5, checksum: "e65eafd533c28a52a9094e430476b03e")
!562 = !{!563, !564, !565, !566, !567, !568, !569, !570, !571, !572, !573}
!563 = !DIDerivedType(tag: DW_TAG_member, name: "tm_sec", scope: !560, file: !561, line: 79, baseType: !77, size: 32)
!564 = !DIDerivedType(tag: DW_TAG_member, name: "tm_min", scope: !560, file: !561, line: 80, baseType: !77, size: 32, offset: 32)
!565 = !DIDerivedType(tag: DW_TAG_member, name: "tm_hour", scope: !560, file: !561, line: 81, baseType: !77, size: 32, offset: 64)
!566 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mday", scope: !560, file: !561, line: 82, baseType: !77, size: 32, offset: 96)
!567 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mon", scope: !560, file: !561, line: 83, baseType: !77, size: 32, offset: 128)
!568 = !DIDerivedType(tag: DW_TAG_member, name: "tm_year", scope: !560, file: !561, line: 84, baseType: !77, size: 32, offset: 160)
!569 = !DIDerivedType(tag: DW_TAG_member, name: "tm_wday", scope: !560, file: !561, line: 85, baseType: !77, size: 32, offset: 192)
!570 = !DIDerivedType(tag: DW_TAG_member, name: "tm_yday", scope: !560, file: !561, line: 86, baseType: !77, size: 32, offset: 224)
!571 = !DIDerivedType(tag: DW_TAG_member, name: "tm_isdst", scope: !560, file: !561, line: 87, baseType: !77, size: 32, offset: 256)
!572 = !DIDerivedType(tag: DW_TAG_member, name: "tm_gmtoff", scope: !560, file: !561, line: 88, baseType: !432, size: 64, offset: 320)
!573 = !DIDerivedType(tag: DW_TAG_member, name: "tm_zone", scope: !560, file: !561, line: 89, baseType: !574, size: 64, offset: 384)
!574 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !481, file: !558, line: 135)
!576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !577, file: !558, line: 136)
!577 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !578, line: 162, baseType: !579)
!578 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "d91ebd7d161d9196cc100822ef0e5cdf")
!579 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILE", file: !578, line: 131, size: 1216, flags: DIFlagTypePassByValue, elements: !580, identifier: "_ZTS7__sFILE")
!580 = !{!581, !583, !584, !585, !586, !587, !592, !593, !595, !599, !603, !611, !615, !616, !619, !620, !624, !628, !629, !630}
!581 = !DIDerivedType(tag: DW_TAG_member, name: "_p", scope: !579, file: !578, line: 132, baseType: !582, size: 64)
!582 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!583 = !DIDerivedType(tag: DW_TAG_member, name: "_r", scope: !579, file: !578, line: 133, baseType: !77, size: 32, offset: 64)
!584 = !DIDerivedType(tag: DW_TAG_member, name: "_w", scope: !579, file: !578, line: 134, baseType: !77, size: 32, offset: 96)
!585 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !579, file: !578, line: 135, baseType: !375, size: 16, offset: 128)
!586 = !DIDerivedType(tag: DW_TAG_member, name: "_file", scope: !579, file: !578, line: 136, baseType: !375, size: 16, offset: 144)
!587 = !DIDerivedType(tag: DW_TAG_member, name: "_bf", scope: !579, file: !578, line: 137, baseType: !588, size: 128, offset: 192)
!588 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sbuf", file: !578, line: 97, size: 128, flags: DIFlagTypePassByValue, elements: !589, identifier: "_ZTS6__sbuf")
!589 = !{!590, !591}
!590 = !DIDerivedType(tag: DW_TAG_member, name: "_base", scope: !588, file: !578, line: 98, baseType: !582, size: 64)
!591 = !DIDerivedType(tag: DW_TAG_member, name: "_size", scope: !588, file: !578, line: 99, baseType: !77, size: 32, offset: 64)
!592 = !DIDerivedType(tag: DW_TAG_member, name: "_lbfsize", scope: !579, file: !578, line: 138, baseType: !77, size: 32, offset: 320)
!593 = !DIDerivedType(tag: DW_TAG_member, name: "_cookie", scope: !579, file: !578, line: 141, baseType: !594, size: 64, offset: 384)
!594 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!595 = !DIDerivedType(tag: DW_TAG_member, name: "_close", scope: !579, file: !578, line: 142, baseType: !596, size: 64, offset: 448)
!596 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !597, size: 64)
!597 = !DISubroutineType(types: !598)
!598 = !{!77, !594}
!599 = !DIDerivedType(tag: DW_TAG_member, name: "_read", scope: !579, file: !578, line: 143, baseType: !600, size: 64, offset: 512)
!600 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !601, size: 64)
!601 = !DISubroutineType(types: !602)
!602 = !{!77, !594, !574, !77}
!603 = !DIDerivedType(tag: DW_TAG_member, name: "_seek", scope: !579, file: !578, line: 144, baseType: !604, size: 64, offset: 576)
!604 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !605, size: 64)
!605 = !DISubroutineType(types: !606)
!606 = !{!607, !594, !607, !77}
!607 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !578, line: 86, baseType: !608)
!608 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_off_t", file: !609, line: 83, baseType: !610)
!609 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "af82ff6119a9fa80fad635d276556d46")
!610 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !431, line: 37, baseType: !380)
!611 = !DIDerivedType(tag: DW_TAG_member, name: "_write", scope: !579, file: !578, line: 145, baseType: !612, size: 64, offset: 640)
!612 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !613, size: 64)
!613 = !DISubroutineType(types: !614)
!614 = !{!77, !594, !531, !77}
!615 = !DIDerivedType(tag: DW_TAG_member, name: "_ub", scope: !579, file: !578, line: 148, baseType: !588, size: 128, offset: 704)
!616 = !DIDerivedType(tag: DW_TAG_member, name: "_extra", scope: !579, file: !578, line: 149, baseType: !617, size: 64, offset: 832)
!617 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !618, size: 64)
!618 = !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILEX", file: !578, line: 103, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS8__sFILEX")
!619 = !DIDerivedType(tag: DW_TAG_member, name: "_ur", scope: !579, file: !578, line: 150, baseType: !77, size: 32, offset: 896)
!620 = !DIDerivedType(tag: DW_TAG_member, name: "_ubuf", scope: !579, file: !578, line: 153, baseType: !621, size: 24, offset: 928)
!621 = !DICompositeType(tag: DW_TAG_array_type, baseType: !85, size: 24, elements: !622)
!622 = !{!623}
!623 = !DISubrange(count: 3)
!624 = !DIDerivedType(tag: DW_TAG_member, name: "_nbuf", scope: !579, file: !578, line: 154, baseType: !625, size: 8, offset: 952)
!625 = !DICompositeType(tag: DW_TAG_array_type, baseType: !85, size: 8, elements: !626)
!626 = !{!627}
!627 = !DISubrange(count: 1)
!628 = !DIDerivedType(tag: DW_TAG_member, name: "_lb", scope: !579, file: !578, line: 157, baseType: !588, size: 128, offset: 960)
!629 = !DIDerivedType(tag: DW_TAG_member, name: "_blksize", scope: !579, file: !578, line: 160, baseType: !77, size: 32, offset: 1088)
!630 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !579, file: !578, line: 161, baseType: !607, size: 64, offset: 1152)
!631 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !632, file: !558, line: 137)
!632 = !DISubprogram(name: "fwprintf", scope: !633, file: !633, line: 107, type: !634, flags: DIFlagPrototyped, spFlags: 0)
!633 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "c0db33314388059ce7a1663adf1bfda0")
!634 = !DISubroutineType(types: !635)
!635 = !{!77, !636, !637, null}
!636 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !577, size: 64)
!637 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !638, size: 64)
!638 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !639)
!639 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!640 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !641, file: !558, line: 138)
!641 = !DISubprogram(name: "fwscanf", scope: !633, file: !633, line: 108, type: !634, flags: DIFlagPrototyped, spFlags: 0)
!642 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !643, file: !558, line: 139)
!643 = !DISubprogram(name: "swprintf", scope: !633, file: !633, line: 120, type: !644, flags: DIFlagPrototyped, spFlags: 0)
!644 = !DISubroutineType(types: !645)
!645 = !{!77, !646, !647, !637, null}
!646 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !639, size: 64)
!647 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !648, line: 50, baseType: !649)
!648 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "f7981334d28e0c246f35cd24042aa2a4")
!649 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !431, line: 87, baseType: !436)
!650 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !651, file: !558, line: 140)
!651 = !DISubprogram(name: "vfwprintf", scope: !633, file: !633, line: 124, type: !652, flags: DIFlagPrototyped, spFlags: 0)
!652 = !DISubroutineType(types: !653)
!653 = !{!77, !636, !637, !654}
!654 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_va_list", file: !431, line: 95, baseType: !655)
!655 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !2, baseType: !574)
!656 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !657, file: !558, line: 141)
!657 = !DISubprogram(name: "vswprintf", scope: !633, file: !633, line: 126, type: !658, flags: DIFlagPrototyped, spFlags: 0)
!658 = !DISubroutineType(types: !659)
!659 = !{!77, !646, !647, !637, !654}
!660 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !661, file: !558, line: 142)
!661 = !DISubprogram(name: "swscanf", scope: !633, file: !633, line: 122, type: !662, flags: DIFlagPrototyped, spFlags: 0)
!662 = !DISubroutineType(types: !663)
!663 = !{!77, !637, !637, null}
!664 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !665, file: !558, line: 143)
!665 = !DISubprogram(name: "vfwscanf", scope: !633, file: !633, line: 195, type: !652, flags: DIFlagPrototyped, spFlags: 0)
!666 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !667, file: !558, line: 144)
!667 = !DISubprogram(name: "vswscanf", scope: !633, file: !633, line: 197, type: !668, flags: DIFlagPrototyped, spFlags: 0)
!668 = !DISubroutineType(types: !669)
!669 = !{!77, !637, !637, !654}
!670 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !671, file: !558, line: 145)
!671 = !DISubprogram(name: "fgetwc", scope: !633, file: !633, line: 100, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!672 = !DISubroutineType(types: !673)
!673 = !{!481, !636}
!674 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !675, file: !558, line: 146)
!675 = !DISubprogram(name: "fgetws", scope: !633, file: !633, line: 102, type: !676, flags: DIFlagPrototyped, spFlags: 0)
!676 = !DISubroutineType(types: !677)
!677 = !{!646, !646, !77, !636}
!678 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !679, file: !558, line: 147)
!679 = !DISubprogram(name: "fputwc", scope: !633, file: !633, line: 104, type: !680, flags: DIFlagPrototyped, spFlags: 0)
!680 = !DISubroutineType(types: !681)
!681 = !{!481, !639, !636}
!682 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !683, file: !558, line: 148)
!683 = !DISubprogram(name: "fputws", scope: !633, file: !633, line: 105, type: !684, flags: DIFlagPrototyped, spFlags: 0)
!684 = !DISubroutineType(types: !685)
!685 = !{!77, !637, !636}
!686 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !687, file: !558, line: 149)
!687 = !DISubprogram(name: "fwide", scope: !633, file: !633, line: 106, type: !688, flags: DIFlagPrototyped, spFlags: 0)
!688 = !DISubroutineType(types: !689)
!689 = !{!77, !636, !77}
!690 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !691, file: !558, line: 150)
!691 = !DISubprogram(name: "getwc", scope: !633, file: !633, line: 109, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!692 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !693, file: !558, line: 151)
!693 = !DISubprogram(name: "putwc", scope: !633, file: !633, line: 118, type: !680, flags: DIFlagPrototyped, spFlags: 0)
!694 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !695, file: !558, line: 152)
!695 = !DISubprogram(name: "ungetwc", scope: !633, file: !633, line: 123, type: !696, flags: DIFlagPrototyped, spFlags: 0)
!696 = !DISubroutineType(types: !697)
!697 = !{!481, !481, !636}
!698 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !699, file: !558, line: 153)
!699 = !DISubprogram(name: "wcstod", scope: !633, file: !633, line: 160, type: !700, flags: DIFlagPrototyped, spFlags: 0)
!700 = !DISubroutineType(types: !701)
!701 = !{!702, !637, !703}
!702 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!703 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !646, size: 64)
!704 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !705, file: !558, line: 154)
!705 = !DISubprogram(name: "wcstof", scope: !633, file: !633, line: 200, type: !706, flags: DIFlagPrototyped, spFlags: 0)
!706 = !DISubroutineType(types: !707)
!707 = !{!708, !637, !703}
!708 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!709 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !710, file: !558, line: 155)
!710 = !DISubprogram(name: "wcstold", scope: !633, file: !633, line: 202, type: !711, flags: DIFlagPrototyped, spFlags: 0)
!711 = !DISubroutineType(types: !712)
!712 = !{!446, !637, !703}
!713 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !714, file: !558, line: 156)
!714 = !DISubprogram(name: "wcstol", scope: !633, file: !633, line: 164, type: !715, flags: DIFlagPrototyped, spFlags: 0)
!715 = !DISubroutineType(types: !716)
!716 = !{!432, !637, !703, !77}
!717 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !718, file: !558, line: 157)
!718 = !DISubprogram(name: "wcstoll", scope: !633, file: !633, line: 205, type: !719, flags: DIFlagPrototyped, spFlags: 0)
!719 = !DISubroutineType(types: !720)
!720 = !{!380, !637, !703, !77}
!721 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !722, file: !558, line: 158)
!722 = !DISubprogram(name: "wcstoul", scope: !633, file: !633, line: 167, type: !723, flags: DIFlagPrototyped, spFlags: 0)
!723 = !DISubroutineType(types: !724)
!724 = !{!436, !637, !703, !77}
!725 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !726, file: !558, line: 159)
!726 = !DISubprogram(name: "wcstoull", scope: !633, file: !633, line: 207, type: !727, flags: DIFlagPrototyped, spFlags: 0)
!727 = !DISubroutineType(types: !728)
!728 = !{!393, !637, !703, !77}
!729 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !730, file: !558, line: 160)
!730 = !DISubprogram(name: "wcscpy", scope: !633, file: !633, line: 134, type: !731, flags: DIFlagPrototyped, spFlags: 0)
!731 = !DISubroutineType(types: !732)
!732 = !{!646, !646, !637}
!733 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !734, file: !558, line: 161)
!734 = !DISubprogram(name: "wcsncpy", scope: !633, file: !633, line: 148, type: !735, flags: DIFlagPrototyped, spFlags: 0)
!735 = !DISubroutineType(types: !736)
!736 = !{!646, !646, !637, !647}
!737 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !738, file: !558, line: 162)
!738 = !DISubprogram(name: "wcscat", scope: !633, file: !633, line: 130, type: !731, flags: DIFlagPrototyped, spFlags: 0)
!739 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !740, file: !558, line: 163)
!740 = !DISubprogram(name: "wcsncat", scope: !633, file: !633, line: 142, type: !735, flags: DIFlagPrototyped, spFlags: 0)
!741 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !742, file: !558, line: 164)
!742 = !DISubprogram(name: "wcscmp", scope: !633, file: !633, line: 132, type: !743, flags: DIFlagPrototyped, spFlags: 0)
!743 = !DISubroutineType(types: !744)
!744 = !{!77, !637, !637}
!745 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !746, file: !558, line: 165)
!746 = !DISubprogram(name: "wcscoll", scope: !633, file: !633, line: 133, type: !743, flags: DIFlagPrototyped, spFlags: 0)
!747 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !748, file: !558, line: 166)
!748 = !DISubprogram(name: "wcsncmp", scope: !633, file: !633, line: 145, type: !749, flags: DIFlagPrototyped, spFlags: 0)
!749 = !DISubroutineType(types: !750)
!750 = !{!77, !637, !637, !647}
!751 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !752, file: !558, line: 167)
!752 = !DISubprogram(name: "wcsxfrm", scope: !633, file: !633, line: 157, type: !753, flags: DIFlagPrototyped, spFlags: 0)
!753 = !DISubroutineType(types: !754)
!754 = !{!647, !646, !637, !647}
!755 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !756, file: !558, line: 168)
!756 = !DISubprogram(name: "wcschr", linkageName: "_Z6wcschrB8ne200100Ua9enable_ifILb1EEPww", scope: !757, file: !757, line: 147, type: !758, flags: DIFlagPrototyped, spFlags: 0)
!757 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/wchar.h", directory: "")
!758 = !DISubroutineType(types: !759)
!759 = !{!646, !646, !639}
!760 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !761, file: !558, line: 169)
!761 = !DISubprogram(name: "wcspbrk", linkageName: "_Z7wcspbrkB8ne200100Ua9enable_ifILb1EEPwPKw", scope: !757, file: !757, line: 158, type: !731, flags: DIFlagPrototyped, spFlags: 0)
!762 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !763, file: !558, line: 170)
!763 = !DISubprogram(name: "wcsrchr", linkageName: "_Z7wcsrchrB8ne200100Ua9enable_ifILb1EEPww", scope: !757, file: !757, line: 168, type: !758, flags: DIFlagPrototyped, spFlags: 0)
!764 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !765, file: !558, line: 171)
!765 = !DISubprogram(name: "wcsstr", linkageName: "_Z6wcsstrB8ne200100Ua9enable_ifILb1EEPwPKw", scope: !757, file: !757, line: 179, type: !731, flags: DIFlagPrototyped, spFlags: 0)
!766 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !767, file: !558, line: 172)
!767 = !DISubprogram(name: "wmemchr", linkageName: "_Z7wmemchrB8ne200100Ua9enable_ifILb1EEPwwm", scope: !757, file: !757, line: 190, type: !768, flags: DIFlagPrototyped, spFlags: 0)
!768 = !DISubroutineType(types: !769)
!769 = !{!646, !646, !639, !647}
!770 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !771, file: !558, line: 173)
!771 = !DISubprogram(name: "wcscspn", scope: !633, file: !633, line: 136, type: !772, flags: DIFlagPrototyped, spFlags: 0)
!772 = !DISubroutineType(types: !773)
!773 = !{!647, !637, !637}
!774 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !775, file: !558, line: 174)
!775 = !DISubprogram(name: "wcslen", scope: !633, file: !633, line: 140, type: !776, flags: DIFlagPrototyped, spFlags: 0)
!776 = !DISubroutineType(types: !777)
!777 = !{!647, !637}
!778 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !779, file: !558, line: 175)
!779 = !DISubprogram(name: "wcsspn", scope: !633, file: !633, line: 155, type: !772, flags: DIFlagPrototyped, spFlags: 0)
!780 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !781, file: !558, line: 176)
!781 = !DISubprogram(name: "wcstok", scope: !633, file: !633, line: 162, type: !782, flags: DIFlagPrototyped, spFlags: 0)
!782 = !DISubroutineType(types: !783)
!783 = !{!646, !646, !637, !703}
!784 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !785, file: !558, line: 177)
!785 = !DISubprogram(name: "wmemcmp", scope: !633, file: !633, line: 170, type: !749, flags: DIFlagPrototyped, spFlags: 0)
!786 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !787, file: !558, line: 178)
!787 = !DISubprogram(name: "wmemcpy", scope: !633, file: !633, line: 173, type: !735, flags: DIFlagPrototyped, spFlags: 0)
!788 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !789, file: !558, line: 179)
!789 = !DISubprogram(name: "wmemmove", scope: !633, file: !633, line: 176, type: !735, flags: DIFlagPrototyped, spFlags: 0)
!790 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !791, file: !558, line: 180)
!791 = !DISubprogram(name: "wmemset", scope: !633, file: !633, line: 179, type: !768, flags: DIFlagPrototyped, spFlags: 0)
!792 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !793, file: !558, line: 181)
!793 = !DISubprogram(name: "wcsftime", linkageName: "\01_wcsftime", scope: !633, file: !633, line: 137, type: !794, flags: DIFlagPrototyped, spFlags: 0)
!794 = !DISubroutineType(types: !795)
!795 = !{!647, !646, !647, !637, !796}
!796 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !797, size: 64)
!797 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !560)
!798 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !799, file: !558, line: 182)
!799 = !DISubprogram(name: "btowc", scope: !633, file: !633, line: 99, type: !800, flags: DIFlagPrototyped, spFlags: 0)
!800 = !DISubroutineType(types: !801)
!801 = !{!481, !77}
!802 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !803, file: !558, line: 183)
!803 = !DISubprogram(name: "wctob", scope: !633, file: !633, line: 159, type: !498, flags: DIFlagPrototyped, spFlags: 0)
!804 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !805, file: !558, line: 184)
!805 = !DISubprogram(name: "mbsinit", scope: !633, file: !633, line: 115, type: !806, flags: DIFlagPrototyped, spFlags: 0)
!806 = !DISubroutineType(types: !807)
!807 = !{!77, !808}
!808 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !809, size: 64)
!809 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !547)
!810 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !811, file: !558, line: 185)
!811 = !DISubprogram(name: "mbrlen", scope: !633, file: !633, line: 111, type: !812, flags: DIFlagPrototyped, spFlags: 0)
!812 = !DISubroutineType(types: !813)
!813 = !{!647, !531, !647, !814}
!814 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !547, size: 64)
!815 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !816, file: !558, line: 186)
!816 = !DISubprogram(name: "mbrtowc", scope: !633, file: !633, line: 113, type: !817, flags: DIFlagPrototyped, spFlags: 0)
!817 = !DISubroutineType(types: !818)
!818 = !{!647, !646, !531, !647, !814}
!819 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !820, file: !558, line: 187)
!820 = !DISubprogram(name: "wcrtomb", scope: !633, file: !633, line: 129, type: !821, flags: DIFlagPrototyped, spFlags: 0)
!821 = !DISubroutineType(types: !822)
!822 = !{!647, !574, !639, !814}
!823 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !824, file: !558, line: 188)
!824 = !DISubprogram(name: "mbsrtowcs", scope: !633, file: !633, line: 116, type: !825, flags: DIFlagPrototyped, spFlags: 0)
!825 = !DISubroutineType(types: !826)
!826 = !{!647, !646, !827, !647, !814}
!827 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !531, size: 64)
!828 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !829, file: !558, line: 189)
!829 = !DISubprogram(name: "wcsrtombs", scope: !633, file: !633, line: 153, type: !830, flags: DIFlagPrototyped, spFlags: 0)
!830 = !DISubroutineType(types: !831)
!831 = !{!647, !574, !832, !647, !814}
!832 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !637, size: 64)
!833 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !834, file: !558, line: 191)
!834 = !DISubprogram(name: "getwchar", scope: !633, file: !633, line: 110, type: !835, flags: DIFlagPrototyped, spFlags: 0)
!835 = !DISubroutineType(types: !836)
!836 = !{!481}
!837 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !838, file: !558, line: 192)
!838 = !DISubprogram(name: "vwscanf", scope: !633, file: !633, line: 199, type: !839, flags: DIFlagPrototyped, spFlags: 0)
!839 = !DISubroutineType(types: !840)
!840 = !{!77, !637, !654}
!841 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !842, file: !558, line: 193)
!842 = !DISubprogram(name: "wscanf", scope: !633, file: !633, line: 181, type: !843, flags: DIFlagPrototyped, spFlags: 0)
!843 = !DISubroutineType(types: !844)
!844 = !{!77, !637, null}
!845 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !846, file: !558, line: 195)
!846 = !DISubprogram(name: "putwchar", scope: !633, file: !633, line: 119, type: !847, flags: DIFlagPrototyped, spFlags: 0)
!847 = !DISubroutineType(types: !848)
!848 = !{!481, !639}
!849 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !850, file: !558, line: 196)
!850 = !DISubprogram(name: "vwprintf", scope: !633, file: !633, line: 128, type: !839, flags: DIFlagPrototyped, spFlags: 0)
!851 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !852, file: !558, line: 197)
!852 = !DISubprogram(name: "wprintf", scope: !633, file: !633, line: 180, type: !843, flags: DIFlagPrototyped, spFlags: 0)
!853 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !854, file: !860, line: 106)
!854 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !855, line: 105, baseType: !856)
!855 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "17a3e5580239ce2f2af260c9c943ad9b")
!856 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !855, line: 102, size: 64, flags: DIFlagTypePassByValue, elements: !857, identifier: "_ZTS5div_t")
!857 = !{!858, !859}
!858 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !856, file: !855, line: 103, baseType: !77, size: 32)
!859 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !856, file: !855, line: 104, baseType: !77, size: 32, offset: 32)
!860 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdlib", directory: "")
!861 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !862, file: !860, line: 107)
!862 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !855, line: 110, baseType: !863)
!863 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !855, line: 107, size: 128, flags: DIFlagTypePassByValue, elements: !864, identifier: "_ZTS6ldiv_t")
!864 = !{!865, !866}
!865 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !863, file: !855, line: 108, baseType: !432, size: 64)
!866 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !863, file: !855, line: 109, baseType: !432, size: 64, offset: 64)
!867 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !868, file: !860, line: 108)
!868 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !855, line: 116, baseType: !869)
!869 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !855, line: 113, size: 128, flags: DIFlagTypePassByValue, elements: !870, identifier: "_ZTS7lldiv_t")
!870 = !{!871, !872}
!871 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !869, file: !855, line: 114, baseType: !380, size: 64)
!872 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !869, file: !855, line: 115, baseType: !380, size: 64, offset: 64)
!873 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !874, file: !860, line: 109)
!874 = !DISubprogram(name: "atof", scope: !855, file: !855, line: 149, type: !875, flags: DIFlagPrototyped, spFlags: 0)
!875 = !DISubroutineType(types: !876)
!876 = !{!702, !531}
!877 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !878, file: !860, line: 110)
!878 = !DISubprogram(name: "atoi", scope: !855, file: !855, line: 150, type: !879, flags: DIFlagPrototyped, spFlags: 0)
!879 = !DISubroutineType(types: !880)
!880 = !{!77, !531}
!881 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !882, file: !860, line: 111)
!882 = !DISubprogram(name: "atol", scope: !855, file: !855, line: 151, type: !883, flags: DIFlagPrototyped, spFlags: 0)
!883 = !DISubroutineType(types: !884)
!884 = !{!432, !531}
!885 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !886, file: !860, line: 112)
!886 = !DISubprogram(name: "atoll", scope: !855, file: !855, line: 154, type: !887, flags: DIFlagPrototyped, spFlags: 0)
!887 = !DISubroutineType(types: !888)
!888 = !{!380, !531}
!889 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !890, file: !860, line: 113)
!890 = !DISubprogram(name: "strtod", linkageName: "\01_strtod", scope: !855, file: !855, line: 184, type: !891, flags: DIFlagPrototyped, spFlags: 0)
!891 = !DISubroutineType(types: !892)
!892 = !{!702, !531, !893}
!893 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !574, size: 64)
!894 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !895, file: !860, line: 114)
!895 = !DISubprogram(name: "strtof", linkageName: "\01_strtof", scope: !855, file: !855, line: 185, type: !896, flags: DIFlagPrototyped, spFlags: 0)
!896 = !DISubroutineType(types: !897)
!897 = !{!708, !531, !893}
!898 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !899, file: !860, line: 115)
!899 = !DISubprogram(name: "strtold", scope: !855, file: !855, line: 188, type: !900, flags: DIFlagPrototyped, spFlags: 0)
!900 = !DISubroutineType(types: !901)
!901 = !{!446, !531, !893}
!902 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !903, file: !860, line: 116)
!903 = !DISubprogram(name: "strtol", scope: !855, file: !855, line: 186, type: !904, flags: DIFlagPrototyped, spFlags: 0)
!904 = !DISubroutineType(types: !905)
!905 = !{!432, !531, !893, !77}
!906 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !907, file: !860, line: 117)
!907 = !DISubprogram(name: "strtoll", scope: !855, file: !855, line: 191, type: !908, flags: DIFlagPrototyped, spFlags: 0)
!908 = !DISubroutineType(types: !909)
!909 = !{!380, !531, !893, !77}
!910 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !911, file: !860, line: 118)
!911 = !DISubprogram(name: "strtoul", scope: !855, file: !855, line: 194, type: !912, flags: DIFlagPrototyped, spFlags: 0)
!912 = !DISubroutineType(types: !913)
!913 = !{!436, !531, !893, !77}
!914 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !915, file: !860, line: 119)
!915 = !DISubprogram(name: "strtoull", scope: !855, file: !855, line: 197, type: !916, flags: DIFlagPrototyped, spFlags: 0)
!916 = !DISubroutineType(types: !917)
!917 = !{!393, !531, !893, !77}
!918 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !919, file: !860, line: 120)
!919 = !DISubprogram(name: "rand", scope: !855, file: !855, line: 181, type: !920, flags: DIFlagPrototyped, spFlags: 0)
!920 = !DISubroutineType(types: !921)
!921 = !{!77}
!922 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !923, file: !860, line: 121)
!923 = !DISubprogram(name: "srand", scope: !855, file: !855, line: 183, type: !924, flags: DIFlagPrototyped, spFlags: 0)
!924 = !DISubroutineType(types: !925)
!925 = !{null, !389}
!926 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !927, file: !860, line: 122)
!927 = !DISubprogram(name: "calloc", scope: !928, file: !928, line: 55, type: !929, flags: DIFlagPrototyped, spFlags: 0)
!928 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/malloc/_malloc.h", directory: "", checksumkind: CSK_MD5, checksum: "169c9ed8662627a4a4d92e321cfa866c")
!929 = !DISubroutineType(types: !930)
!930 = !{!594, !647, !647}
!931 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !932, file: !860, line: 123)
!932 = !DISubprogram(name: "free", scope: !928, file: !928, line: 56, type: !933, flags: DIFlagPrototyped, spFlags: 0)
!933 = !DISubroutineType(types: !934)
!934 = !{null, !594}
!935 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !936, file: !860, line: 124)
!936 = !DISubprogram(name: "malloc", scope: !928, file: !928, line: 54, type: !937, flags: DIFlagPrototyped, spFlags: 0)
!937 = !DISubroutineType(types: !938)
!938 = !{!594, !647}
!939 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !940, file: !860, line: 125)
!940 = !DISubprogram(name: "realloc", scope: !928, file: !928, line: 57, type: !941, flags: DIFlagPrototyped, spFlags: 0)
!941 = !DISubroutineType(types: !942)
!942 = !{!594, !594, !647}
!943 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !944, file: !860, line: 126)
!944 = !DISubprogram(name: "abort", scope: !945, file: !945, line: 33, type: !946, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!945 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_abort.h", directory: "", checksumkind: CSK_MD5, checksum: "b8994a53d49770cf67adab87821b3fcb")
!946 = !DISubroutineType(types: !947)
!947 = !{null}
!948 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !949, file: !860, line: 127)
!949 = !DISubprogram(name: "atexit", scope: !855, file: !855, line: 144, type: !950, flags: DIFlagPrototyped, spFlags: 0)
!950 = !DISubroutineType(types: !951)
!951 = !{!77, !952}
!952 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !946, size: 64)
!953 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !954, file: !860, line: 128)
!954 = !DISubprogram(name: "exit", scope: !855, file: !855, line: 160, type: !955, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!955 = !DISubroutineType(types: !956)
!956 = !{null, !77}
!957 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !958, file: !860, line: 129)
!958 = !DISubprogram(name: "_Exit", scope: !855, file: !855, line: 210, type: !955, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!959 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !960, file: !860, line: 130)
!960 = !DISubprogram(name: "getenv", scope: !855, file: !855, line: 162, type: !961, flags: DIFlagPrototyped, spFlags: 0)
!961 = !DISubroutineType(types: !962)
!962 = !{!574, !531}
!963 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !964, file: !860, line: 131)
!964 = !DISubprogram(name: "system", linkageName: "\01_system", scope: !855, file: !855, line: 203, type: !879, flags: DIFlagPrototyped, spFlags: 0)
!965 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !966, file: !860, line: 132)
!966 = !DISubprogram(name: "bsearch", scope: !855, file: !855, line: 156, type: !967, flags: DIFlagPrototyped, spFlags: 0)
!967 = !DISubroutineType(types: !968)
!968 = !{!594, !969, !969, !647, !647, !971}
!969 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !970, size: 64)
!970 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!971 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !972, size: 64)
!972 = !DISubroutineType(types: !973)
!973 = !{!77, !969, !969}
!974 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !975, file: !860, line: 133)
!975 = !DISubprogram(name: "qsort", scope: !855, file: !855, line: 175, type: !976, flags: DIFlagPrototyped, spFlags: 0)
!976 = !DISubroutineType(types: !977)
!977 = !{null, !594, !647, !647, !971}
!978 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !979, file: !860, line: 134)
!979 = !DISubprogram(name: "abs", linkageName: "_Z3absB8ne200100e", scope: !980, file: !980, line: 123, type: !981, flags: DIFlagPrototyped, spFlags: 0)
!980 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/stdlib.h", directory: "")
!981 = !DISubroutineType(types: !982)
!982 = !{!446, !446}
!983 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !984, file: !860, line: 135)
!984 = !DISubprogram(name: "labs", scope: !855, file: !855, line: 163, type: !985, flags: DIFlagPrototyped, spFlags: 0)
!985 = !DISubroutineType(types: !986)
!986 = !{!432, !432}
!987 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !988, file: !860, line: 136)
!988 = !DISubprogram(name: "llabs", scope: !855, file: !855, line: 167, type: !989, flags: DIFlagPrototyped, spFlags: 0)
!989 = !DISubroutineType(types: !990)
!990 = !{!380, !380}
!991 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !992, file: !860, line: 137)
!992 = !DISubprogram(name: "div", linkageName: "_Z3divB8ne200100xx", scope: !980, file: !980, line: 143, type: !993, flags: DIFlagPrototyped, spFlags: 0)
!993 = !DISubroutineType(types: !994)
!994 = !{!868, !380, !380}
!995 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !996, file: !860, line: 138)
!996 = !DISubprogram(name: "ldiv", scope: !855, file: !855, line: 164, type: !997, flags: DIFlagPrototyped, spFlags: 0)
!997 = !DISubroutineType(types: !998)
!998 = !{!862, !432, !432}
!999 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1000, file: !860, line: 139)
!1000 = !DISubprogram(name: "lldiv", scope: !855, file: !855, line: 168, type: !993, flags: DIFlagPrototyped, spFlags: 0)
!1001 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1002, file: !860, line: 140)
!1002 = !DISubprogram(name: "mblen", scope: !855, file: !855, line: 171, type: !1003, flags: DIFlagPrototyped, spFlags: 0)
!1003 = !DISubroutineType(types: !1004)
!1004 = !{!77, !531, !647}
!1005 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1006, file: !860, line: 142)
!1006 = !DISubprogram(name: "mbtowc", scope: !855, file: !855, line: 173, type: !1007, flags: DIFlagPrototyped, spFlags: 0)
!1007 = !DISubroutineType(types: !1008)
!1008 = !{!77, !646, !531, !647}
!1009 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1010, file: !860, line: 143)
!1010 = !DISubprogram(name: "wctomb", scope: !855, file: !855, line: 207, type: !1011, flags: DIFlagPrototyped, spFlags: 0)
!1011 = !DISubroutineType(types: !1012)
!1012 = !{!77, !574, !639}
!1013 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1014, file: !860, line: 144)
!1014 = !DISubprogram(name: "mbstowcs", scope: !855, file: !855, line: 172, type: !1015, flags: DIFlagPrototyped, spFlags: 0)
!1015 = !DISubroutineType(types: !1016)
!1016 = !{!647, !646, !531, !647}
!1017 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1018, file: !860, line: 145)
!1018 = !DISubprogram(name: "wcstombs", scope: !855, file: !855, line: 206, type: !1019, flags: DIFlagPrototyped, spFlags: 0)
!1019 = !DISubroutineType(types: !1020)
!1020 = !{!647, !574, !637, !647}
!1021 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1022, file: !860, line: 148)
!1022 = !DISubprogram(name: "at_quick_exit", scope: !855, file: !855, line: 147, type: !950, flags: DIFlagPrototyped, spFlags: 0)
!1023 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1024, file: !860, line: 149)
!1024 = !DISubprogram(name: "quick_exit", scope: !855, file: !855, line: 179, type: !955, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1025 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !547, file: !1026, line: 25)
!1026 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__std_mbstate_t.h", directory: "")
!1027 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !72, entity: !1028, file: !1034, line: 422)
!1028 = !DISubprogram(name: "isfinite", linkageName: "_ZNSt3__16__math8isfiniteB8ne200100Ee", scope: !1030, file: !1029, line: 79, type: !1031, flags: DIFlagPrototyped, spFlags: 0)
!1029 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__math/traits.h", directory: "")
!1030 = !DINamespace(name: "__math", scope: !366)
!1031 = !DISubroutineType(types: !1032)
!1032 = !{!1033, !446}
!1033 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!1034 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/math.h", directory: "")
!1035 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !72, entity: !1036, file: !1034, line: 425)
!1036 = !DISubprogram(name: "isinf", linkageName: "_ZNSt3__16__math5isinfB8ne200100Ee", scope: !1030, file: !1029, line: 103, type: !1031, flags: DIFlagPrototyped, spFlags: 0)
!1037 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !72, entity: !1038, file: !1034, line: 429)
!1038 = !DISubprogram(name: "isnan", linkageName: "_ZNSt3__16__math5isnanB8ne200100Ee", scope: !1030, file: !1029, line: 127, type: !1031, flags: DIFlagPrototyped, spFlags: 0)
!1039 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !72, entity: !1040, file: !1034, line: 430)
!1040 = !DISubprogram(name: "isnormal", linkageName: "_ZNSt3__16__math8isnormalB8ne200100Ee", scope: !1030, file: !1029, line: 146, type: !1031, flags: DIFlagPrototyped, spFlags: 0)
!1041 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !72, entity: !1042, file: !1034, line: 485)
!1042 = !DISubprogram(name: "modf", linkageName: "_ZNSt3__16__math4modfB8ne200100EePe", scope: !1030, file: !1043, line: 55, type: !1044, flags: DIFlagPrototyped, spFlags: 0)
!1043 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__math/modulo.h", directory: "")
!1044 = !DISubroutineType(types: !1045)
!1045 = !{!446, !446, !1046}
!1046 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !446, size: 64)
!1047 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1028, file: !1048, line: 352)
!1048 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cmath", directory: "")
!1049 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1036, file: !1048, line: 353)
!1050 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1038, file: !1048, line: 354)
!1051 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1040, file: !1048, line: 355)
!1052 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1053, file: !1048, line: 364)
!1053 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !1054, line: 50, baseType: !708)
!1054 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/math.h", directory: "", checksumkind: CSK_MD5, checksum: "35b1ff63542c2c0c144330dd9277d2dc")
!1055 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1056, file: !1048, line: 365)
!1056 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !1054, line: 51, baseType: !702)
!1057 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !979, file: !1048, line: 367)
!1058 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1059, file: !1048, line: 370)
!1059 = !DISubprogram(name: "acosf", scope: !1054, file: !1054, line: 314, type: !1060, flags: DIFlagPrototyped, spFlags: 0)
!1060 = !DISubroutineType(types: !1061)
!1061 = !{!708, !708}
!1062 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1063, file: !1048, line: 372)
!1063 = !DISubprogram(name: "asinf", scope: !1054, file: !1054, line: 318, type: !1060, flags: DIFlagPrototyped, spFlags: 0)
!1064 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1065, file: !1048, line: 374)
!1065 = !DISubprogram(name: "atanf", scope: !1054, file: !1054, line: 322, type: !1060, flags: DIFlagPrototyped, spFlags: 0)
!1066 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1067, file: !1048, line: 376)
!1067 = !DISubprogram(name: "atan2f", scope: !1054, file: !1054, line: 326, type: !1068, flags: DIFlagPrototyped, spFlags: 0)
!1068 = !DISubroutineType(types: !1069)
!1069 = !{!708, !708, !708}
!1070 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1071, file: !1048, line: 378)
!1071 = !DISubprogram(name: "ceilf", scope: !1054, file: !1054, line: 461, type: !1060, flags: DIFlagPrototyped, spFlags: 0)
!1072 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1073, file: !1048, line: 380)
!1073 = !DISubprogram(name: "cosf", scope: !1054, file: !1054, line: 330, type: !1060, flags: DIFlagPrototyped, spFlags: 0)
!1074 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1075, file: !1048, line: 382)
!1075 = !DISubprogram(name: "coshf", scope: !1054, file: !1054, line: 354, type: !1060, flags: DIFlagPrototyped, spFlags: 0)
!1076 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1077, file: !1048, line: 385)
!1077 = !DISubprogram(name: "expf", scope: !1054, file: !1054, line: 366, type: !1060, flags: DIFlagPrototyped, spFlags: 0)
!1078 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1079, file: !1048, line: 388)
!1079 = !DISubprogram(name: "fabsf", scope: !1054, file: !1054, line: 422, type: !1060, flags: DIFlagPrototyped, spFlags: 0)
!1080 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1081, file: !1048, line: 390)
!1081 = !DISubprogram(name: "floorf", scope: !1054, file: !1054, line: 465, type: !1060, flags: DIFlagPrototyped, spFlags: 0)
!1082 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1083, file: !1048, line: 393)
!1083 = !DISubprogram(name: "fmodf", scope: !1054, file: !1054, line: 505, type: !1068, flags: DIFlagPrototyped, spFlags: 0)
!1084 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1085, file: !1048, line: 396)
!1085 = !DISubprogram(name: "frexpf", scope: !1054, file: !1054, line: 406, type: !1086, flags: DIFlagPrototyped, spFlags: 0)
!1086 = !DISubroutineType(types: !1087)
!1087 = !{!708, !708, !1088}
!1088 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!1089 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1090, file: !1048, line: 398)
!1090 = !DISubprogram(name: "ldexpf", scope: !1054, file: !1054, line: 402, type: !1091, flags: DIFlagPrototyped, spFlags: 0)
!1091 = !DISubroutineType(types: !1092)
!1092 = !{!708, !708, !77}
!1093 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1094, file: !1048, line: 401)
!1094 = !DISubprogram(name: "logf", scope: !1054, file: !1054, line: 378, type: !1060, flags: DIFlagPrototyped, spFlags: 0)
!1095 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1096, file: !1048, line: 404)
!1096 = !DISubprogram(name: "log10f", scope: !1054, file: !1054, line: 382, type: !1060, flags: DIFlagPrototyped, spFlags: 0)
!1097 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1042, file: !1048, line: 405)
!1098 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1099, file: !1048, line: 406)
!1099 = !DISubprogram(name: "modff", scope: !1054, file: !1054, line: 398, type: !1100, flags: DIFlagPrototyped, spFlags: 0)
!1100 = !DISubroutineType(types: !1101)
!1101 = !{!708, !708, !1102}
!1102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !708, size: 64)
!1103 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1104, file: !1048, line: 409)
!1104 = !DISubprogram(name: "powf", scope: !1054, file: !1054, line: 434, type: !1068, flags: DIFlagPrototyped, spFlags: 0)
!1105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1106, file: !1048, line: 412)
!1106 = !DISubprogram(name: "sinf", scope: !1054, file: !1054, line: 334, type: !1060, flags: DIFlagPrototyped, spFlags: 0)
!1107 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1108, file: !1048, line: 414)
!1108 = !DISubprogram(name: "sinhf", scope: !1054, file: !1054, line: 358, type: !1060, flags: DIFlagPrototyped, spFlags: 0)
!1109 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1110, file: !1048, line: 417)
!1110 = !DISubprogram(name: "sqrtf", scope: !1054, file: !1054, line: 438, type: !1060, flags: DIFlagPrototyped, spFlags: 0)
!1111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1112, file: !1048, line: 419)
!1112 = !DISubprogram(name: "tanf", scope: !1054, file: !1054, line: 338, type: !1060, flags: DIFlagPrototyped, spFlags: 0)
!1113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1114, file: !1048, line: 422)
!1114 = !DISubprogram(name: "tanhf", scope: !1054, file: !1054, line: 362, type: !1060, flags: DIFlagPrototyped, spFlags: 0)
!1115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1116, file: !1048, line: 425)
!1116 = !DISubprogram(name: "acoshf", scope: !1054, file: !1054, line: 342, type: !1060, flags: DIFlagPrototyped, spFlags: 0)
!1117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1118, file: !1048, line: 427)
!1118 = !DISubprogram(name: "asinhf", scope: !1054, file: !1054, line: 346, type: !1060, flags: DIFlagPrototyped, spFlags: 0)
!1119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1120, file: !1048, line: 429)
!1120 = !DISubprogram(name: "atanhf", scope: !1054, file: !1054, line: 350, type: !1060, flags: DIFlagPrototyped, spFlags: 0)
!1121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1122, file: !1048, line: 431)
!1122 = !DISubprogram(name: "cbrtf", scope: !1054, file: !1054, line: 426, type: !1060, flags: DIFlagPrototyped, spFlags: 0)
!1123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1124, file: !1048, line: 434)
!1124 = !DISubprogram(name: "copysignf", scope: !1054, file: !1054, line: 517, type: !1068, flags: DIFlagPrototyped, spFlags: 0)
!1125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1126, file: !1048, line: 437)
!1126 = !DISubprogram(name: "erff", scope: !1054, file: !1054, line: 442, type: !1060, flags: DIFlagPrototyped, spFlags: 0)
!1127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1128, file: !1048, line: 439)
!1128 = !DISubprogram(name: "erfcf", scope: !1054, file: !1054, line: 446, type: !1060, flags: DIFlagPrototyped, spFlags: 0)
!1129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1130, file: !1048, line: 441)
!1130 = !DISubprogram(name: "exp2f", scope: !1054, file: !1054, line: 370, type: !1060, flags: DIFlagPrototyped, spFlags: 0)
!1131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1132, file: !1048, line: 443)
!1132 = !DISubprogram(name: "expm1f", scope: !1054, file: !1054, line: 374, type: !1060, flags: DIFlagPrototyped, spFlags: 0)
!1133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1134, file: !1048, line: 445)
!1134 = !DISubprogram(name: "fdimf", scope: !1054, file: !1054, line: 533, type: !1068, flags: DIFlagPrototyped, spFlags: 0)
!1135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1136, file: !1048, line: 446)
!1136 = !DISubprogram(name: "fmaf", scope: !1054, file: !1054, line: 545, type: !1137, flags: DIFlagPrototyped, spFlags: 0)
!1137 = !DISubroutineType(types: !1138)
!1138 = !{!708, !708, !708, !708}
!1139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1140, file: !1048, line: 449)
!1140 = !DISubprogram(name: "fmaxf", scope: !1054, file: !1054, line: 537, type: !1068, flags: DIFlagPrototyped, spFlags: 0)
!1141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1142, file: !1048, line: 451)
!1142 = !DISubprogram(name: "fminf", scope: !1054, file: !1054, line: 541, type: !1068, flags: DIFlagPrototyped, spFlags: 0)
!1143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1144, file: !1048, line: 453)
!1144 = !DISubprogram(name: "hypotf", scope: !1054, file: !1054, line: 430, type: !1068, flags: DIFlagPrototyped, spFlags: 0)
!1145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1146, file: !1048, line: 455)
!1146 = !DISubprogram(name: "ilogbf", scope: !1054, file: !1054, line: 410, type: !1147, flags: DIFlagPrototyped, spFlags: 0)
!1147 = !DISubroutineType(types: !1148)
!1148 = !{!77, !708}
!1149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1150, file: !1048, line: 457)
!1150 = !DISubprogram(name: "lgammaf", scope: !1054, file: !1054, line: 453, type: !1060, flags: DIFlagPrototyped, spFlags: 0)
!1151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1152, file: !1048, line: 459)
!1152 = !DISubprogram(name: "llrintf", scope: !1054, file: !1054, line: 492, type: !1153, flags: DIFlagPrototyped, spFlags: 0)
!1153 = !DISubroutineType(types: !1154)
!1154 = !{!380, !708}
!1155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1156, file: !1048, line: 461)
!1156 = !DISubprogram(name: "llroundf", scope: !1054, file: !1054, line: 496, type: !1153, flags: DIFlagPrototyped, spFlags: 0)
!1157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1158, file: !1048, line: 463)
!1158 = !DISubprogram(name: "log1pf", scope: !1054, file: !1054, line: 390, type: !1060, flags: DIFlagPrototyped, spFlags: 0)
!1159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1160, file: !1048, line: 465)
!1160 = !DISubprogram(name: "log2f", scope: !1054, file: !1054, line: 386, type: !1060, flags: DIFlagPrototyped, spFlags: 0)
!1161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1162, file: !1048, line: 467)
!1162 = !DISubprogram(name: "logbf", scope: !1054, file: !1054, line: 394, type: !1060, flags: DIFlagPrototyped, spFlags: 0)
!1163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1164, file: !1048, line: 469)
!1164 = !DISubprogram(name: "lrintf", scope: !1054, file: !1054, line: 477, type: !1165, flags: DIFlagPrototyped, spFlags: 0)
!1165 = !DISubroutineType(types: !1166)
!1166 = !{!432, !708}
!1167 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1168, file: !1048, line: 471)
!1168 = !DISubprogram(name: "lroundf", scope: !1054, file: !1054, line: 485, type: !1165, flags: DIFlagPrototyped, spFlags: 0)
!1169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1170, file: !1048, line: 473)
!1170 = !DISubprogram(name: "nan", scope: !1054, file: !1054, line: 522, type: !875, flags: DIFlagPrototyped, spFlags: 0)
!1171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1172, file: !1048, line: 474)
!1172 = !DISubprogram(name: "nanf", scope: !1054, file: !1054, line: 521, type: !1173, flags: DIFlagPrototyped, spFlags: 0)
!1173 = !DISubroutineType(types: !1174)
!1174 = !{!708, !531}
!1175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1176, file: !1048, line: 477)
!1176 = !DISubprogram(name: "nearbyintf", scope: !1054, file: !1054, line: 469, type: !1060, flags: DIFlagPrototyped, spFlags: 0)
!1177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1178, file: !1048, line: 479)
!1178 = !DISubprogram(name: "nextafterf", scope: !1054, file: !1054, line: 525, type: !1068, flags: DIFlagPrototyped, spFlags: 0)
!1179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1180, file: !1048, line: 481)
!1180 = !DISubprogram(name: "nexttowardf", scope: !1054, file: !1054, line: 530, type: !1181, flags: DIFlagPrototyped, spFlags: 0)
!1181 = !DISubroutineType(types: !1182)
!1182 = !{!708, !708, !446}
!1183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1184, file: !1048, line: 483)
!1184 = !DISubprogram(name: "remainderf", scope: !1054, file: !1054, line: 509, type: !1068, flags: DIFlagPrototyped, spFlags: 0)
!1185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1186, file: !1048, line: 485)
!1186 = !DISubprogram(name: "remquof", scope: !1054, file: !1054, line: 513, type: !1187, flags: DIFlagPrototyped, spFlags: 0)
!1187 = !DISubroutineType(types: !1188)
!1188 = !{!708, !708, !708, !1088}
!1189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1190, file: !1048, line: 487)
!1190 = !DISubprogram(name: "rintf", scope: !1054, file: !1054, line: 473, type: !1060, flags: DIFlagPrototyped, spFlags: 0)
!1191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1192, file: !1048, line: 489)
!1192 = !DISubprogram(name: "roundf", scope: !1054, file: !1054, line: 481, type: !1060, flags: DIFlagPrototyped, spFlags: 0)
!1193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1194, file: !1048, line: 491)
!1194 = !DISubprogram(name: "scalblnf", scope: !1054, file: !1054, line: 418, type: !1195, flags: DIFlagPrototyped, spFlags: 0)
!1195 = !DISubroutineType(types: !1196)
!1196 = !{!708, !708, !432}
!1197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1198, file: !1048, line: 493)
!1198 = !DISubprogram(name: "scalbnf", scope: !1054, file: !1054, line: 414, type: !1091, flags: DIFlagPrototyped, spFlags: 0)
!1199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1200, file: !1048, line: 495)
!1200 = !DISubprogram(name: "tgammaf", scope: !1054, file: !1054, line: 457, type: !1060, flags: DIFlagPrototyped, spFlags: 0)
!1201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1202, file: !1048, line: 497)
!1202 = !DISubprogram(name: "truncf", scope: !1054, file: !1054, line: 501, type: !1060, flags: DIFlagPrototyped, spFlags: 0)
!1203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1204, file: !1048, line: 499)
!1204 = !DISubprogram(name: "acosl", scope: !1054, file: !1054, line: 316, type: !981, flags: DIFlagPrototyped, spFlags: 0)
!1205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1206, file: !1048, line: 500)
!1206 = !DISubprogram(name: "asinl", scope: !1054, file: !1054, line: 320, type: !981, flags: DIFlagPrototyped, spFlags: 0)
!1207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1208, file: !1048, line: 501)
!1208 = !DISubprogram(name: "atanl", scope: !1054, file: !1054, line: 324, type: !981, flags: DIFlagPrototyped, spFlags: 0)
!1209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1210, file: !1048, line: 502)
!1210 = !DISubprogram(name: "atan2l", scope: !1054, file: !1054, line: 328, type: !1211, flags: DIFlagPrototyped, spFlags: 0)
!1211 = !DISubroutineType(types: !1212)
!1212 = !{!446, !446, !446}
!1213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1214, file: !1048, line: 503)
!1214 = !DISubprogram(name: "ceill", scope: !1054, file: !1054, line: 463, type: !981, flags: DIFlagPrototyped, spFlags: 0)
!1215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1216, file: !1048, line: 504)
!1216 = !DISubprogram(name: "cosl", scope: !1054, file: !1054, line: 332, type: !981, flags: DIFlagPrototyped, spFlags: 0)
!1217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1218, file: !1048, line: 505)
!1218 = !DISubprogram(name: "coshl", scope: !1054, file: !1054, line: 356, type: !981, flags: DIFlagPrototyped, spFlags: 0)
!1219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1220, file: !1048, line: 506)
!1220 = !DISubprogram(name: "expl", scope: !1054, file: !1054, line: 368, type: !981, flags: DIFlagPrototyped, spFlags: 0)
!1221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1222, file: !1048, line: 507)
!1222 = !DISubprogram(name: "fabsl", scope: !1054, file: !1054, line: 424, type: !981, flags: DIFlagPrototyped, spFlags: 0)
!1223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1224, file: !1048, line: 508)
!1224 = !DISubprogram(name: "floorl", scope: !1054, file: !1054, line: 467, type: !981, flags: DIFlagPrototyped, spFlags: 0)
!1225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1226, file: !1048, line: 509)
!1226 = !DISubprogram(name: "fmodl", scope: !1054, file: !1054, line: 507, type: !1211, flags: DIFlagPrototyped, spFlags: 0)
!1227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1228, file: !1048, line: 510)
!1228 = !DISubprogram(name: "frexpl", scope: !1054, file: !1054, line: 408, type: !1229, flags: DIFlagPrototyped, spFlags: 0)
!1229 = !DISubroutineType(types: !1230)
!1230 = !{!446, !446, !1088}
!1231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1232, file: !1048, line: 511)
!1232 = !DISubprogram(name: "ldexpl", scope: !1054, file: !1054, line: 404, type: !1233, flags: DIFlagPrototyped, spFlags: 0)
!1233 = !DISubroutineType(types: !1234)
!1234 = !{!446, !446, !77}
!1235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1236, file: !1048, line: 512)
!1236 = !DISubprogram(name: "logl", scope: !1054, file: !1054, line: 380, type: !981, flags: DIFlagPrototyped, spFlags: 0)
!1237 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1238, file: !1048, line: 513)
!1238 = !DISubprogram(name: "log10l", scope: !1054, file: !1054, line: 384, type: !981, flags: DIFlagPrototyped, spFlags: 0)
!1239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1240, file: !1048, line: 514)
!1240 = !DISubprogram(name: "modfl", scope: !1054, file: !1054, line: 400, type: !1044, flags: DIFlagPrototyped, spFlags: 0)
!1241 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1242, file: !1048, line: 515)
!1242 = !DISubprogram(name: "powl", scope: !1054, file: !1054, line: 436, type: !1211, flags: DIFlagPrototyped, spFlags: 0)
!1243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1244, file: !1048, line: 516)
!1244 = !DISubprogram(name: "sinl", scope: !1054, file: !1054, line: 336, type: !981, flags: DIFlagPrototyped, spFlags: 0)
!1245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1246, file: !1048, line: 517)
!1246 = !DISubprogram(name: "sinhl", scope: !1054, file: !1054, line: 360, type: !981, flags: DIFlagPrototyped, spFlags: 0)
!1247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1248, file: !1048, line: 518)
!1248 = !DISubprogram(name: "sqrtl", scope: !1054, file: !1054, line: 440, type: !981, flags: DIFlagPrototyped, spFlags: 0)
!1249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1250, file: !1048, line: 519)
!1250 = !DISubprogram(name: "tanl", scope: !1054, file: !1054, line: 340, type: !981, flags: DIFlagPrototyped, spFlags: 0)
!1251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1252, file: !1048, line: 521)
!1252 = !DISubprogram(name: "tanhl", scope: !1054, file: !1054, line: 364, type: !981, flags: DIFlagPrototyped, spFlags: 0)
!1253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1254, file: !1048, line: 522)
!1254 = !DISubprogram(name: "acoshl", scope: !1054, file: !1054, line: 344, type: !981, flags: DIFlagPrototyped, spFlags: 0)
!1255 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1256, file: !1048, line: 523)
!1256 = !DISubprogram(name: "asinhl", scope: !1054, file: !1054, line: 348, type: !981, flags: DIFlagPrototyped, spFlags: 0)
!1257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1258, file: !1048, line: 524)
!1258 = !DISubprogram(name: "atanhl", scope: !1054, file: !1054, line: 352, type: !981, flags: DIFlagPrototyped, spFlags: 0)
!1259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1260, file: !1048, line: 525)
!1260 = !DISubprogram(name: "cbrtl", scope: !1054, file: !1054, line: 428, type: !981, flags: DIFlagPrototyped, spFlags: 0)
!1261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1262, file: !1048, line: 527)
!1262 = !DISubprogram(name: "copysignl", scope: !1054, file: !1054, line: 519, type: !1211, flags: DIFlagPrototyped, spFlags: 0)
!1263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1264, file: !1048, line: 529)
!1264 = !DISubprogram(name: "erfl", scope: !1054, file: !1054, line: 444, type: !981, flags: DIFlagPrototyped, spFlags: 0)
!1265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1266, file: !1048, line: 530)
!1266 = !DISubprogram(name: "erfcl", scope: !1054, file: !1054, line: 448, type: !981, flags: DIFlagPrototyped, spFlags: 0)
!1267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1268, file: !1048, line: 531)
!1268 = !DISubprogram(name: "exp2l", scope: !1054, file: !1054, line: 372, type: !981, flags: DIFlagPrototyped, spFlags: 0)
!1269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1270, file: !1048, line: 532)
!1270 = !DISubprogram(name: "expm1l", scope: !1054, file: !1054, line: 376, type: !981, flags: DIFlagPrototyped, spFlags: 0)
!1271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1272, file: !1048, line: 533)
!1272 = !DISubprogram(name: "fdiml", scope: !1054, file: !1054, line: 535, type: !1211, flags: DIFlagPrototyped, spFlags: 0)
!1273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1274, file: !1048, line: 534)
!1274 = !DISubprogram(name: "fmal", scope: !1054, file: !1054, line: 547, type: !1275, flags: DIFlagPrototyped, spFlags: 0)
!1275 = !DISubroutineType(types: !1276)
!1276 = !{!446, !446, !446, !446}
!1277 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1278, file: !1048, line: 535)
!1278 = !DISubprogram(name: "fmaxl", scope: !1054, file: !1054, line: 539, type: !1211, flags: DIFlagPrototyped, spFlags: 0)
!1279 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1280, file: !1048, line: 536)
!1280 = !DISubprogram(name: "fminl", scope: !1054, file: !1054, line: 543, type: !1211, flags: DIFlagPrototyped, spFlags: 0)
!1281 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1282, file: !1048, line: 537)
!1282 = !DISubprogram(name: "hypotl", scope: !1054, file: !1054, line: 432, type: !1211, flags: DIFlagPrototyped, spFlags: 0)
!1283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1284, file: !1048, line: 538)
!1284 = !DISubprogram(name: "ilogbl", scope: !1054, file: !1054, line: 412, type: !1285, flags: DIFlagPrototyped, spFlags: 0)
!1285 = !DISubroutineType(types: !1286)
!1286 = !{!77, !446}
!1287 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1288, file: !1048, line: 539)
!1288 = !DISubprogram(name: "lgammal", scope: !1054, file: !1054, line: 455, type: !981, flags: DIFlagPrototyped, spFlags: 0)
!1289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1290, file: !1048, line: 540)
!1290 = !DISubprogram(name: "llrintl", scope: !1054, file: !1054, line: 494, type: !1291, flags: DIFlagPrototyped, spFlags: 0)
!1291 = !DISubroutineType(types: !1292)
!1292 = !{!380, !446}
!1293 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1294, file: !1048, line: 541)
!1294 = !DISubprogram(name: "llroundl", scope: !1054, file: !1054, line: 498, type: !1291, flags: DIFlagPrototyped, spFlags: 0)
!1295 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1296, file: !1048, line: 542)
!1296 = !DISubprogram(name: "log1pl", scope: !1054, file: !1054, line: 392, type: !981, flags: DIFlagPrototyped, spFlags: 0)
!1297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1298, file: !1048, line: 543)
!1298 = !DISubprogram(name: "log2l", scope: !1054, file: !1054, line: 388, type: !981, flags: DIFlagPrototyped, spFlags: 0)
!1299 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1300, file: !1048, line: 544)
!1300 = !DISubprogram(name: "logbl", scope: !1054, file: !1054, line: 396, type: !981, flags: DIFlagPrototyped, spFlags: 0)
!1301 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1302, file: !1048, line: 545)
!1302 = !DISubprogram(name: "lrintl", scope: !1054, file: !1054, line: 479, type: !1303, flags: DIFlagPrototyped, spFlags: 0)
!1303 = !DISubroutineType(types: !1304)
!1304 = !{!432, !446}
!1305 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1306, file: !1048, line: 546)
!1306 = !DISubprogram(name: "lroundl", scope: !1054, file: !1054, line: 487, type: !1303, flags: DIFlagPrototyped, spFlags: 0)
!1307 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1308, file: !1048, line: 547)
!1308 = !DISubprogram(name: "nanl", scope: !1054, file: !1054, line: 523, type: !1309, flags: DIFlagPrototyped, spFlags: 0)
!1309 = !DISubroutineType(types: !1310)
!1310 = !{!446, !531}
!1311 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1312, file: !1048, line: 548)
!1312 = !DISubprogram(name: "nearbyintl", scope: !1054, file: !1054, line: 471, type: !981, flags: DIFlagPrototyped, spFlags: 0)
!1313 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1314, file: !1048, line: 549)
!1314 = !DISubprogram(name: "nextafterl", scope: !1054, file: !1054, line: 527, type: !1211, flags: DIFlagPrototyped, spFlags: 0)
!1315 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1316, file: !1048, line: 550)
!1316 = !DISubprogram(name: "nexttowardl", scope: !1054, file: !1054, line: 531, type: !1211, flags: DIFlagPrototyped, spFlags: 0)
!1317 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1318, file: !1048, line: 551)
!1318 = !DISubprogram(name: "remainderl", scope: !1054, file: !1054, line: 511, type: !1211, flags: DIFlagPrototyped, spFlags: 0)
!1319 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1320, file: !1048, line: 552)
!1320 = !DISubprogram(name: "remquol", scope: !1054, file: !1054, line: 515, type: !1321, flags: DIFlagPrototyped, spFlags: 0)
!1321 = !DISubroutineType(types: !1322)
!1322 = !{!446, !446, !446, !1088}
!1323 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1324, file: !1048, line: 553)
!1324 = !DISubprogram(name: "rintl", scope: !1054, file: !1054, line: 475, type: !981, flags: DIFlagPrototyped, spFlags: 0)
!1325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1326, file: !1048, line: 554)
!1326 = !DISubprogram(name: "roundl", scope: !1054, file: !1054, line: 483, type: !981, flags: DIFlagPrototyped, spFlags: 0)
!1327 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1328, file: !1048, line: 555)
!1328 = !DISubprogram(name: "scalblnl", scope: !1054, file: !1054, line: 420, type: !1329, flags: DIFlagPrototyped, spFlags: 0)
!1329 = !DISubroutineType(types: !1330)
!1330 = !{!446, !446, !432}
!1331 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1332, file: !1048, line: 556)
!1332 = !DISubprogram(name: "scalbnl", scope: !1054, file: !1054, line: 416, type: !1233, flags: DIFlagPrototyped, spFlags: 0)
!1333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1334, file: !1048, line: 557)
!1334 = !DISubprogram(name: "tgammal", scope: !1054, file: !1054, line: 459, type: !981, flags: DIFlagPrototyped, spFlags: 0)
!1335 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1336, file: !1048, line: 558)
!1336 = !DISubprogram(name: "truncl", scope: !1054, file: !1054, line: 503, type: !981, flags: DIFlagPrototyped, spFlags: 0)
!1337 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1338, file: !1342, line: 82)
!1338 = !DISubprogram(name: "memcpy", scope: !1339, file: !1339, line: 78, type: !1340, flags: DIFlagPrototyped, spFlags: 0)
!1339 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_string.h", directory: "", checksumkind: CSK_MD5, checksum: "c67be38c725261ca8572072ee1574b87")
!1340 = !DISubroutineType(types: !1341)
!1341 = !{!594, !594, !969, !647}
!1342 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstring", directory: "")
!1343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1344, file: !1342, line: 83)
!1344 = !DISubprogram(name: "memmove", scope: !1339, file: !1339, line: 81, type: !1340, flags: DIFlagPrototyped, spFlags: 0)
!1345 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1346, file: !1342, line: 84)
!1346 = !DISubprogram(name: "strcpy", scope: !1339, file: !1339, line: 92, type: !1347, flags: DIFlagPrototyped, spFlags: 0)
!1347 = !DISubroutineType(types: !1348)
!1348 = !{!574, !574, !531}
!1349 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1350, file: !1342, line: 85)
!1350 = !DISubprogram(name: "strncpy", scope: !1339, file: !1339, line: 104, type: !1351, flags: DIFlagPrototyped, spFlags: 0)
!1351 = !DISubroutineType(types: !1352)
!1352 = !{!574, !574, !531, !647}
!1353 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1354, file: !1342, line: 86)
!1354 = !DISubprogram(name: "strcat", scope: !1339, file: !1339, line: 86, type: !1347, flags: DIFlagPrototyped, spFlags: 0)
!1355 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1356, file: !1342, line: 87)
!1356 = !DISubprogram(name: "strncat", scope: !1339, file: !1339, line: 98, type: !1351, flags: DIFlagPrototyped, spFlags: 0)
!1357 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1358, file: !1342, line: 88)
!1358 = !DISubprogram(name: "memcmp", scope: !1339, file: !1339, line: 75, type: !1359, flags: DIFlagPrototyped, spFlags: 0)
!1359 = !DISubroutineType(types: !1360)
!1360 = !{!77, !969, !969, !647}
!1361 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1362, file: !1342, line: 89)
!1362 = !DISubprogram(name: "strcmp", scope: !1339, file: !1339, line: 89, type: !1363, flags: DIFlagPrototyped, spFlags: 0)
!1363 = !DISubroutineType(types: !1364)
!1364 = !{!77, !531, !531}
!1365 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1366, file: !1342, line: 90)
!1366 = !DISubprogram(name: "strncmp", scope: !1339, file: !1339, line: 101, type: !1367, flags: DIFlagPrototyped, spFlags: 0)
!1367 = !DISubroutineType(types: !1368)
!1368 = !{!77, !531, !531, !647}
!1369 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1370, file: !1342, line: 91)
!1370 = !DISubprogram(name: "strcoll", scope: !1339, file: !1339, line: 90, type: !1363, flags: DIFlagPrototyped, spFlags: 0)
!1371 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1372, file: !1342, line: 92)
!1372 = !DISubprogram(name: "strxfrm", scope: !1339, file: !1339, line: 112, type: !1373, flags: DIFlagPrototyped, spFlags: 0)
!1373 = !DISubroutineType(types: !1374)
!1374 = !{!647, !574, !531, !647}
!1375 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1376, file: !1342, line: 93)
!1376 = !DISubprogram(name: "memchr", linkageName: "_Z6memchrB8ne200100Ua9enable_ifILb1EEPvim", scope: !1377, file: !1377, line: 101, type: !1378, flags: DIFlagPrototyped, spFlags: 0)
!1377 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/string.h", directory: "")
!1378 = !DISubroutineType(types: !1379)
!1379 = !{!594, !594, !77, !647}
!1380 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1381, file: !1342, line: 94)
!1381 = !DISubprogram(name: "strchr", linkageName: "_Z6strchrB8ne200100Ua9enable_ifILb1EEPci", scope: !1377, file: !1377, line: 80, type: !1382, flags: DIFlagPrototyped, spFlags: 0)
!1382 = !DISubroutineType(types: !1383)
!1383 = !{!574, !574, !77}
!1384 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1385, file: !1342, line: 95)
!1385 = !DISubprogram(name: "strcspn", scope: !1339, file: !1339, line: 94, type: !1386, flags: DIFlagPrototyped, spFlags: 0)
!1386 = !DISubroutineType(types: !1387)
!1387 = !{!647, !531, !531}
!1388 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1389, file: !1342, line: 96)
!1389 = !DISubprogram(name: "strpbrk", linkageName: "_Z7strpbrkB8ne200100Ua9enable_ifILb1EEPcPKc", scope: !1377, file: !1377, line: 87, type: !1347, flags: DIFlagPrototyped, spFlags: 0)
!1390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1391, file: !1342, line: 97)
!1391 = !DISubprogram(name: "strrchr", linkageName: "_Z7strrchrB8ne200100Ua9enable_ifILb1EEPci", scope: !1377, file: !1377, line: 94, type: !1382, flags: DIFlagPrototyped, spFlags: 0)
!1392 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1393, file: !1342, line: 98)
!1393 = !DISubprogram(name: "strspn", scope: !1339, file: !1339, line: 109, type: !1386, flags: DIFlagPrototyped, spFlags: 0)
!1394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1395, file: !1342, line: 99)
!1395 = !DISubprogram(name: "strstr", linkageName: "_Z6strstrB8ne200100Ua9enable_ifILb1EEPcPKc", scope: !1377, file: !1377, line: 108, type: !1347, flags: DIFlagPrototyped, spFlags: 0)
!1396 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1397, file: !1342, line: 100)
!1397 = !DISubprogram(name: "strtok", scope: !1339, file: !1339, line: 111, type: !1347, flags: DIFlagPrototyped, spFlags: 0)
!1398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1399, file: !1342, line: 101)
!1399 = !DISubprogram(name: "memset", scope: !1339, file: !1339, line: 84, type: !1378, flags: DIFlagPrototyped, spFlags: 0)
!1400 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1401, file: !1342, line: 102)
!1401 = !DISubprogram(name: "strerror", linkageName: "\01_strerror", scope: !1339, file: !1339, line: 95, type: !1402, flags: DIFlagPrototyped, spFlags: 0)
!1402 = !DISubroutineType(types: !1403)
!1403 = !{!574, !77}
!1404 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1405, file: !1342, line: 103)
!1405 = !DISubprogram(name: "strlen", scope: !1339, file: !1339, line: 96, type: !1406, flags: DIFlagPrototyped, spFlags: 0)
!1406 = !DISubroutineType(types: !1407)
!1407 = !{!647, !531}
!1408 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !1409, entity: !1410, file: !1412, line: 536)
!1409 = !DINamespace(name: "chrono", scope: !366)
!1410 = !DINamespace(name: "chrono_literals", scope: !1411, exportSymbols: true)
!1411 = !DINamespace(name: "literals", scope: !366, exportSymbols: true)
!1412 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__chrono/duration.h", directory: "")
!1413 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1414, file: !1417, line: 68)
!1414 = !DIDerivedType(tag: DW_TAG_typedef, name: "clock_t", file: !1415, line: 31, baseType: !1416)
!1415 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_clock_t.h", directory: "", checksumkind: CSK_MD5, checksum: "757b93ac72874f074e33ca41b7ee521d")
!1416 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_clock_t", file: !431, line: 116, baseType: !436)
!1417 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/ctime", directory: "")
!1418 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1419, file: !1417, line: 69)
!1419 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !1420, line: 31, baseType: !1421)
!1420 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_time_t.h", directory: "", checksumkind: CSK_MD5, checksum: "ddc110fab0813d27960d5c9aaba0ed4f")
!1421 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_time_t", file: !431, line: 119, baseType: !432)
!1422 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !560, file: !1417, line: 70)
!1423 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1424, file: !1417, line: 74)
!1424 = !DISubprogram(name: "clock", linkageName: "\01_clock", scope: !561, file: !561, line: 112, type: !1425, flags: DIFlagPrototyped, spFlags: 0)
!1425 = !DISubroutineType(types: !1426)
!1426 = !{!1414}
!1427 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1428, file: !1417, line: 75)
!1428 = !DISubprogram(name: "difftime", scope: !561, file: !561, line: 114, type: !1429, flags: DIFlagPrototyped, spFlags: 0)
!1429 = !DISubroutineType(types: !1430)
!1430 = !{!702, !1419, !1419}
!1431 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1432, file: !1417, line: 76)
!1432 = !DISubprogram(name: "mktime", linkageName: "\01_mktime", scope: !561, file: !561, line: 118, type: !1433, flags: DIFlagPrototyped, spFlags: 0)
!1433 = !DISubroutineType(types: !1434)
!1434 = !{!1419, !1435}
!1435 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !560, size: 64)
!1436 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1437, file: !1417, line: 77)
!1437 = !DISubprogram(name: "time", scope: !561, file: !561, line: 121, type: !1438, flags: DIFlagPrototyped, spFlags: 0)
!1438 = !DISubroutineType(types: !1439)
!1439 = !{!1419, !1440}
!1440 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1419, size: 64)
!1441 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1442, file: !1417, line: 78)
!1442 = !DISubprogram(name: "asctime", scope: !561, file: !561, line: 111, type: !1443, flags: DIFlagPrototyped, spFlags: 0)
!1443 = !DISubroutineType(types: !1444)
!1444 = !{!574, !796}
!1445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1446, file: !1417, line: 79)
!1446 = !DISubprogram(name: "ctime", scope: !561, file: !561, line: 113, type: !1447, flags: DIFlagPrototyped, spFlags: 0)
!1447 = !DISubroutineType(types: !1448)
!1448 = !{!574, !1449}
!1449 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1450, size: 64)
!1450 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1419)
!1451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1452, file: !1417, line: 80)
!1452 = !DISubprogram(name: "gmtime", scope: !561, file: !561, line: 116, type: !1453, flags: DIFlagPrototyped, spFlags: 0)
!1453 = !DISubroutineType(types: !1454)
!1454 = !{!1435, !1449}
!1455 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1456, file: !1417, line: 81)
!1456 = !DISubprogram(name: "localtime", scope: !561, file: !561, line: 117, type: !1453, flags: DIFlagPrototyped, spFlags: 0)
!1457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1458, file: !1417, line: 82)
!1458 = !DISubprogram(name: "strftime", linkageName: "\01_strftime", scope: !561, file: !561, line: 119, type: !1459, flags: DIFlagPrototyped, spFlags: 0)
!1459 = !DISubroutineType(types: !1460)
!1460 = !{!647, !574, !647, !531, !796}
!1461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !577, file: !1462, line: 120)
!1462 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdio", directory: "")
!1463 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !607, file: !1462, line: 121)
!1464 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1465, file: !1462, line: 123)
!1465 = !DISubprogram(name: "fclose", scope: !578, file: !578, line: 233, type: !1466, flags: DIFlagPrototyped, spFlags: 0)
!1466 = !DISubroutineType(types: !1467)
!1467 = !{!77, !636}
!1468 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1469, file: !1462, line: 124)
!1469 = !DISubprogram(name: "fflush", scope: !578, file: !578, line: 236, type: !1466, flags: DIFlagPrototyped, spFlags: 0)
!1470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1471, file: !1462, line: 125)
!1471 = !DISubprogram(name: "setbuf", scope: !578, file: !578, line: 272, type: !1472, flags: DIFlagPrototyped, spFlags: 0)
!1472 = !DISubroutineType(types: !1473)
!1473 = !{null, !636, !574}
!1474 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1475, file: !1462, line: 126)
!1475 = !DISubprogram(name: "setvbuf", scope: !578, file: !578, line: 273, type: !1476, flags: DIFlagPrototyped, spFlags: 0)
!1476 = !DISubroutineType(types: !1477)
!1477 = !{!77, !636, !574, !77, !647}
!1478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1479, file: !1462, line: 127)
!1479 = !DISubprogram(name: "fprintf", scope: !578, file: !578, line: 245, type: !1480, flags: DIFlagPrototyped, spFlags: 0)
!1480 = !DISubroutineType(types: !1481)
!1481 = !{!77, !636, !531, null}
!1482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1483, file: !1462, line: 128)
!1483 = !DISubprogram(name: "fscanf", scope: !578, file: !578, line: 251, type: !1480, flags: DIFlagPrototyped, spFlags: 0)
!1484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1485, file: !1462, line: 129)
!1485 = !DISubprogram(name: "snprintf", scope: !578, file: !578, line: 435, type: !1486, flags: DIFlagPrototyped, spFlags: 0)
!1486 = !DISubroutineType(types: !1487)
!1487 = !{!77, !574, !647, !531, null}
!1488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1489, file: !1462, line: 130)
!1489 = !DISubprogram(name: "sprintf", scope: !578, file: !578, line: 280, type: !1490, flags: DIFlagPrototyped, spFlags: 0)
!1490 = !DISubroutineType(types: !1491)
!1491 = !{!77, !574, !531, null}
!1492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1493, file: !1462, line: 131)
!1493 = !DISubprogram(name: "sscanf", scope: !578, file: !578, line: 282, type: !1494, flags: DIFlagPrototyped, spFlags: 0)
!1494 = !DISubroutineType(types: !1495)
!1495 = !{!77, !531, !531, null}
!1496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1497, file: !1462, line: 132)
!1497 = !DISubprogram(name: "vfprintf", scope: !578, file: !578, line: 292, type: !1498, flags: DIFlagPrototyped, spFlags: 0)
!1498 = !DISubroutineType(types: !1499)
!1499 = !{!77, !636, !531, !1500}
!1500 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !1501, line: 44, baseType: !654)
!1501 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_va_list.h", directory: "", checksumkind: CSK_MD5, checksum: "41825c2dccdd98a1587ce428cded44de")
!1502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1503, file: !1462, line: 133)
!1503 = !DISubprogram(name: "vfscanf", scope: !578, file: !578, line: 436, type: !1498, flags: DIFlagPrototyped, spFlags: 0)
!1504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1505, file: !1462, line: 134)
!1505 = !DISubprogram(name: "vsscanf", scope: !578, file: !578, line: 439, type: !1506, flags: DIFlagPrototyped, spFlags: 0)
!1506 = !DISubroutineType(types: !1507)
!1507 = !{!77, !531, !531, !1500}
!1508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1509, file: !1462, line: 135)
!1509 = !DISubprogram(name: "vsnprintf", scope: !578, file: !578, line: 438, type: !1510, flags: DIFlagPrototyped, spFlags: 0)
!1510 = !DISubroutineType(types: !1511)
!1511 = !{!77, !574, !647, !531, !1500}
!1512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1513, file: !1462, line: 136)
!1513 = !DISubprogram(name: "vsprintf", scope: !578, file: !578, line: 300, type: !1514, flags: DIFlagPrototyped, spFlags: 0)
!1514 = !DISubroutineType(types: !1515)
!1515 = !{!77, !574, !531, !1500}
!1516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1517, file: !1462, line: 137)
!1517 = !DISubprogram(name: "fgetc", scope: !578, file: !578, line: 237, type: !1466, flags: DIFlagPrototyped, spFlags: 0)
!1518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1519, file: !1462, line: 138)
!1519 = !DISubprogram(name: "fgets", scope: !578, file: !578, line: 239, type: !1520, flags: DIFlagPrototyped, spFlags: 0)
!1520 = !DISubroutineType(types: !1521)
!1521 = !{!574, !574, !77, !636}
!1522 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1523, file: !1462, line: 139)
!1523 = !DISubprogram(name: "fputc", scope: !578, file: !578, line: 246, type: !1524, flags: DIFlagPrototyped, spFlags: 0)
!1524 = !DISubroutineType(types: !1525)
!1525 = !{!77, !77, !636}
!1526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1527, file: !1462, line: 140)
!1527 = !DISubprogram(name: "fputs", linkageName: "\01_fputs", scope: !578, file: !578, line: 247, type: !1528, flags: DIFlagPrototyped, spFlags: 0)
!1528 = !DISubroutineType(types: !1529)
!1529 = !{!77, !531, !636}
!1530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1531, file: !1462, line: 141)
!1531 = !DISubprogram(name: "getc", scope: !578, file: !578, line: 256, type: !1466, flags: DIFlagPrototyped, spFlags: 0)
!1532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1533, file: !1462, line: 142)
!1533 = !DISubprogram(name: "putc", scope: !578, file: !578, line: 265, type: !1524, flags: DIFlagPrototyped, spFlags: 0)
!1534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1535, file: !1462, line: 143)
!1535 = !DISubprogram(name: "ungetc", scope: !578, file: !578, line: 291, type: !1524, flags: DIFlagPrototyped, spFlags: 0)
!1536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1537, file: !1462, line: 144)
!1537 = !DISubprogram(name: "fread", scope: !578, file: !578, line: 248, type: !1538, flags: DIFlagPrototyped, spFlags: 0)
!1538 = !DISubroutineType(types: !1539)
!1539 = !{!647, !594, !647, !647, !636}
!1540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1541, file: !1462, line: 145)
!1541 = !DISubprogram(name: "fwrite", linkageName: "\01_fwrite", scope: !578, file: !578, line: 255, type: !1542, flags: DIFlagPrototyped, spFlags: 0)
!1542 = !DISubroutineType(types: !1543)
!1543 = !{!647, !969, !647, !647, !636}
!1544 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1545, file: !1462, line: 146)
!1545 = !DISubprogram(name: "fgetpos", scope: !578, file: !578, line: 238, type: !1546, flags: DIFlagPrototyped, spFlags: 0)
!1546 = !DISubroutineType(types: !1547)
!1547 = !{!77, !636, !1548}
!1548 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !607, size: 64)
!1549 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1550, file: !1462, line: 147)
!1550 = !DISubprogram(name: "fseek", scope: !578, file: !578, line: 252, type: !1551, flags: DIFlagPrototyped, spFlags: 0)
!1551 = !DISubroutineType(types: !1552)
!1552 = !{!77, !636, !432, !77}
!1553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1554, file: !1462, line: 148)
!1554 = !DISubprogram(name: "fsetpos", scope: !578, file: !578, line: 253, type: !1555, flags: DIFlagPrototyped, spFlags: 0)
!1555 = !DISubroutineType(types: !1556)
!1556 = !{!77, !636, !1557}
!1557 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1558, size: 64)
!1558 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !607)
!1559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1560, file: !1462, line: 149)
!1560 = !DISubprogram(name: "ftell", scope: !578, file: !578, line: 254, type: !1561, flags: DIFlagPrototyped, spFlags: 0)
!1561 = !DISubroutineType(types: !1562)
!1562 = !{!432, !636}
!1563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1564, file: !1462, line: 150)
!1564 = !DISubprogram(name: "rewind", scope: !578, file: !578, line: 270, type: !1565, flags: DIFlagPrototyped, spFlags: 0)
!1565 = !DISubroutineType(types: !1566)
!1566 = !{null, !636}
!1567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1568, file: !1462, line: 151)
!1568 = !DISubprogram(name: "clearerr", scope: !578, file: !578, line: 232, type: !1565, flags: DIFlagPrototyped, spFlags: 0)
!1569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1570, file: !1462, line: 152)
!1570 = !DISubprogram(name: "feof", scope: !578, file: !578, line: 234, type: !1466, flags: DIFlagPrototyped, spFlags: 0)
!1571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1572, file: !1462, line: 153)
!1572 = !DISubprogram(name: "ferror", scope: !578, file: !578, line: 235, type: !1466, flags: DIFlagPrototyped, spFlags: 0)
!1573 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1574, file: !1462, line: 154)
!1574 = !DISubprogram(name: "perror", scope: !578, file: !578, line: 264, type: !1575, flags: DIFlagPrototyped, spFlags: 0)
!1575 = !DISubroutineType(types: !1576)
!1576 = !{null, !531}
!1577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1578, file: !1462, line: 156)
!1578 = !DISubprogram(name: "fopen", linkageName: "\01_fopen", scope: !578, file: !578, line: 243, type: !1579, flags: DIFlagPrototyped, spFlags: 0)
!1579 = !DISubroutineType(types: !1580)
!1580 = !{!636, !531, !531}
!1581 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1582, file: !1462, line: 157)
!1582 = !DISubprogram(name: "freopen", linkageName: "\01_freopen", scope: !578, file: !578, line: 249, type: !1583, flags: DIFlagPrototyped, spFlags: 0)
!1583 = !DISubroutineType(types: !1584)
!1584 = !{!636, !531, !531, !636}
!1585 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1586, file: !1462, line: 158)
!1586 = !DISubprogram(name: "remove", scope: !578, file: !578, line: 268, type: !879, flags: DIFlagPrototyped, spFlags: 0)
!1587 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1588, file: !1462, line: 159)
!1588 = !DISubprogram(name: "rename", scope: !578, file: !578, line: 269, type: !1363, flags: DIFlagPrototyped, spFlags: 0)
!1589 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1590, file: !1462, line: 160)
!1590 = !DISubprogram(name: "tmpfile", scope: !578, file: !578, line: 283, type: !1591, flags: DIFlagPrototyped, spFlags: 0)
!1591 = !DISubroutineType(types: !1592)
!1592 = !{!636}
!1593 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1594, file: !1462, line: 161)
!1594 = !DISubprogram(name: "tmpnam", scope: !578, file: !578, line: 289, type: !1595, flags: DIFlagPrototyped, spFlags: 0)
!1595 = !DISubroutineType(types: !1596)
!1596 = !{!574, !574}
!1597 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1598, file: !1462, line: 163)
!1598 = !DISubprogram(name: "getchar", scope: !578, file: !578, line: 257, type: !920, flags: DIFlagPrototyped, spFlags: 0)
!1599 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1600, file: !1462, line: 167)
!1600 = !DISubprogram(name: "scanf", scope: !578, file: !578, line: 271, type: !1601, flags: DIFlagPrototyped, spFlags: 0)
!1601 = !DISubroutineType(types: !1602)
!1602 = !{!77, !531, null}
!1603 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1604, file: !1462, line: 168)
!1604 = !DISubprogram(name: "vscanf", scope: !578, file: !578, line: 437, type: !1605, flags: DIFlagPrototyped, spFlags: 0)
!1605 = !DISubroutineType(types: !1606)
!1606 = !{!77, !531, !1500}
!1607 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1608, file: !1462, line: 170)
!1608 = !DISubprogram(name: "printf", scope: !1609, file: !1609, line: 34, type: !1601, flags: DIFlagPrototyped, spFlags: 0)
!1609 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_printf.h", directory: "", checksumkind: CSK_MD5, checksum: "2d37517bd0342aa326aa1d3660ad4ab4")
!1610 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1611, file: !1462, line: 171)
!1611 = !DISubprogram(name: "putchar", scope: !578, file: !578, line: 266, type: !451, flags: DIFlagPrototyped, spFlags: 0)
!1612 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1613, file: !1462, line: 172)
!1613 = !DISubprogram(name: "puts", scope: !578, file: !578, line: 267, type: !879, flags: DIFlagPrototyped, spFlags: 0)
!1614 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1615, file: !1462, line: 173)
!1615 = !DISubprogram(name: "vprintf", scope: !578, file: !578, line: 293, type: !1605, flags: DIFlagPrototyped, spFlags: 0)
!1616 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1617, file: !1644, line: 52)
!1617 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !1618, line: 46, size: 768, flags: DIFlagTypePassByValue, elements: !1619, identifier: "_ZTS5lconv")
!1618 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_locale.h", directory: "", checksumkind: CSK_MD5, checksum: "a6054df13071a4f642aabbc00435a252")
!1619 = !{!1620, !1621, !1622, !1623, !1624, !1625, !1626, !1627, !1628, !1629, !1630, !1631, !1632, !1633, !1634, !1635, !1636, !1637, !1638, !1639, !1640, !1641, !1642, !1643}
!1620 = !DIDerivedType(tag: DW_TAG_member, name: "decimal_point", scope: !1617, file: !1618, line: 47, baseType: !574, size: 64)
!1621 = !DIDerivedType(tag: DW_TAG_member, name: "thousands_sep", scope: !1617, file: !1618, line: 48, baseType: !574, size: 64, offset: 64)
!1622 = !DIDerivedType(tag: DW_TAG_member, name: "grouping", scope: !1617, file: !1618, line: 49, baseType: !574, size: 64, offset: 128)
!1623 = !DIDerivedType(tag: DW_TAG_member, name: "int_curr_symbol", scope: !1617, file: !1618, line: 50, baseType: !574, size: 64, offset: 192)
!1624 = !DIDerivedType(tag: DW_TAG_member, name: "currency_symbol", scope: !1617, file: !1618, line: 51, baseType: !574, size: 64, offset: 256)
!1625 = !DIDerivedType(tag: DW_TAG_member, name: "mon_decimal_point", scope: !1617, file: !1618, line: 52, baseType: !574, size: 64, offset: 320)
!1626 = !DIDerivedType(tag: DW_TAG_member, name: "mon_thousands_sep", scope: !1617, file: !1618, line: 53, baseType: !574, size: 64, offset: 384)
!1627 = !DIDerivedType(tag: DW_TAG_member, name: "mon_grouping", scope: !1617, file: !1618, line: 54, baseType: !574, size: 64, offset: 448)
!1628 = !DIDerivedType(tag: DW_TAG_member, name: "positive_sign", scope: !1617, file: !1618, line: 55, baseType: !574, size: 64, offset: 512)
!1629 = !DIDerivedType(tag: DW_TAG_member, name: "negative_sign", scope: !1617, file: !1618, line: 56, baseType: !574, size: 64, offset: 576)
!1630 = !DIDerivedType(tag: DW_TAG_member, name: "int_frac_digits", scope: !1617, file: !1618, line: 57, baseType: !5, size: 8, offset: 640)
!1631 = !DIDerivedType(tag: DW_TAG_member, name: "frac_digits", scope: !1617, file: !1618, line: 58, baseType: !5, size: 8, offset: 648)
!1632 = !DIDerivedType(tag: DW_TAG_member, name: "p_cs_precedes", scope: !1617, file: !1618, line: 59, baseType: !5, size: 8, offset: 656)
!1633 = !DIDerivedType(tag: DW_TAG_member, name: "p_sep_by_space", scope: !1617, file: !1618, line: 60, baseType: !5, size: 8, offset: 664)
!1634 = !DIDerivedType(tag: DW_TAG_member, name: "n_cs_precedes", scope: !1617, file: !1618, line: 61, baseType: !5, size: 8, offset: 672)
!1635 = !DIDerivedType(tag: DW_TAG_member, name: "n_sep_by_space", scope: !1617, file: !1618, line: 62, baseType: !5, size: 8, offset: 680)
!1636 = !DIDerivedType(tag: DW_TAG_member, name: "p_sign_posn", scope: !1617, file: !1618, line: 63, baseType: !5, size: 8, offset: 688)
!1637 = !DIDerivedType(tag: DW_TAG_member, name: "n_sign_posn", scope: !1617, file: !1618, line: 64, baseType: !5, size: 8, offset: 696)
!1638 = !DIDerivedType(tag: DW_TAG_member, name: "int_p_cs_precedes", scope: !1617, file: !1618, line: 65, baseType: !5, size: 8, offset: 704)
!1639 = !DIDerivedType(tag: DW_TAG_member, name: "int_n_cs_precedes", scope: !1617, file: !1618, line: 66, baseType: !5, size: 8, offset: 712)
!1640 = !DIDerivedType(tag: DW_TAG_member, name: "int_p_sep_by_space", scope: !1617, file: !1618, line: 67, baseType: !5, size: 8, offset: 720)
!1641 = !DIDerivedType(tag: DW_TAG_member, name: "int_n_sep_by_space", scope: !1617, file: !1618, line: 68, baseType: !5, size: 8, offset: 728)
!1642 = !DIDerivedType(tag: DW_TAG_member, name: "int_p_sign_posn", scope: !1617, file: !1618, line: 69, baseType: !5, size: 8, offset: 736)
!1643 = !DIDerivedType(tag: DW_TAG_member, name: "int_n_sign_posn", scope: !1617, file: !1618, line: 70, baseType: !5, size: 8, offset: 744)
!1644 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/clocale", directory: "")
!1645 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1646, file: !1644, line: 53)
!1646 = !DISubprogram(name: "setlocale", scope: !1647, file: !1647, line: 56, type: !1648, flags: DIFlagPrototyped, spFlags: 0)
!1647 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/locale.h", directory: "", checksumkind: CSK_MD5, checksum: "fcf8310e4aaf18e49a21cced49364afb")
!1648 = !DISubroutineType(types: !1649)
!1649 = !{!574, !77, !531}
!1650 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1651, file: !1644, line: 54)
!1651 = !DISubprogram(name: "localeconv", scope: !1618, file: !1618, line: 99, type: !1652, flags: DIFlagPrototyped, spFlags: 0)
!1652 = !DISubroutineType(types: !1653)
!1653 = !{!1654}
!1654 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1617, size: 64)
!1655 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !366, entity: !1656, file: !1658, line: 53)
!1656 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !1657, line: 12, baseType: !655)
!1657 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/lib/clang/20/include/__stdarg_va_list.h", directory: "", checksumkind: CSK_MD5, checksum: "7bd78a282b99fcfe41a9e3c566d14f7d")
!1658 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdarg", directory: "")
!1659 = !DICompositeType(tag: DW_TAG_array_type, baseType: !531, size: 1600, elements: !328)
!1660 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 4]}
!1661 = !{i32 7, !"Dwarf Version", i32 5}
!1662 = !{i32 2, !"Debug Info Version", i32 3}
!1663 = !{i32 1, !"wchar_size", i32 4}
!1664 = !{i32 8, !"PIC Level", i32 2}
!1665 = !{i32 7, !"uwtable", i32 1}
!1666 = !{i32 7, !"frame-pointer", i32 1}
!1667 = !{!"Homebrew clang version 20.1.8"}
!1668 = distinct !DISubprogram(name: "init_buddy_for_level", linkageName: "_Z20init_buddy_for_levelv", scope: !2, file: !2, line: 115, type: !946, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !72, retainedNodes: !1669)
!1669 = !{}
!1670 = !DILocalVariable(name: "i", scope: !1668, file: !2, line: 117, type: !77)
!1671 = !DILocation(line: 117, column: 6, scope: !1668)
!1672 = !DILocation(line: 119, column: 24, scope: !1668)
!1673 = !DILocation(line: 120, column: 15, scope: !1668)
!1674 = !DILocation(line: 121, column: 21, scope: !1668)
!1675 = !DILocation(line: 122, column: 22, scope: !1668)
!1676 = !DILocation(line: 123, column: 20, scope: !1668)
!1677 = !DILocation(line: 124, column: 28, scope: !1668)
!1678 = !DILocation(line: 126, column: 8, scope: !1679)
!1679 = distinct !DILexicalBlock(scope: !1668, file: !2, line: 126, column: 2)
!1680 = !DILocation(line: 126, column: 7, scope: !1679)
!1681 = !DILocation(line: 126, column: 12, scope: !1682)
!1682 = distinct !DILexicalBlock(scope: !1679, file: !2, line: 126, column: 2)
!1683 = !DILocation(line: 126, column: 15, scope: !1682)
!1684 = !DILocation(line: 126, column: 13, scope: !1682)
!1685 = !DILocation(line: 126, column: 2, scope: !1679)
!1686 = !DILocation(line: 127, column: 26, scope: !1687)
!1687 = distinct !DILexicalBlock(scope: !1682, file: !2, line: 127, column: 7)
!1688 = !DILocation(line: 127, column: 18, scope: !1687)
!1689 = !DILocation(line: 127, column: 29, scope: !1687)
!1690 = !DILocation(line: 127, column: 7, scope: !1687)
!1691 = !DILocation(line: 127, column: 33, scope: !1687)
!1692 = !DILocation(line: 128, column: 4, scope: !1687)
!1693 = !DILocation(line: 126, column: 38, scope: !1682)
!1694 = !DILocation(line: 126, column: 2, scope: !1682)
!1695 = distinct !{!1695, !1685, !1696, !1697}
!1696 = !DILocation(line: 128, column: 4, scope: !1679)
!1697 = !{!"llvm.loop.mustprogress"}
!1698 = !DILocation(line: 129, column: 6, scope: !1699)
!1699 = distinct !DILexicalBlock(scope: !1668, file: !2, line: 129, column: 6)
!1700 = !DILocation(line: 129, column: 11, scope: !1699)
!1701 = !DILocation(line: 129, column: 8, scope: !1699)
!1702 = !DILocation(line: 130, column: 18, scope: !1699)
!1703 = !DILocation(line: 130, column: 16, scope: !1699)
!1704 = !DILocation(line: 130, column: 3, scope: !1699)
!1705 = !DILocation(line: 132, column: 19, scope: !1668)
!1706 = !DILocation(line: 134, column: 21, scope: !1668)
!1707 = !DILocation(line: 135, column: 17, scope: !1668)
!1708 = !DILocation(line: 136, column: 1, scope: !1668)
!1709 = distinct !DISubprogram(name: "segment_is_reachable", linkageName: "_Z20segment_is_reachableii", scope: !2, file: !2, line: 141, type: !1710, scopeLine: 142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !72, retainedNodes: !1669)
!1710 = !DISubroutineType(types: !1711)
!1711 = !{!77, !77, !77}
!1712 = !DILocalVariable(name: "curseg", arg: 1, scope: !1709, file: !2, line: 141, type: !77)
!1713 = !DILocation(line: 141, column: 30, scope: !1709)
!1714 = !DILocalVariable(name: "sidenum", arg: 2, scope: !1709, file: !2, line: 141, type: !77)
!1715 = !DILocation(line: 141, column: 42, scope: !1709)
!1716 = !DILocalVariable(name: "wall_num", scope: !1709, file: !2, line: 143, type: !77)
!1717 = !DILocation(line: 143, column: 7, scope: !1709)
!1718 = !DILocalVariable(name: "rval", scope: !1709, file: !2, line: 143, type: !77)
!1719 = !DILocation(line: 143, column: 17, scope: !1709)
!1720 = !DILocalVariable(name: "segp", scope: !1709, file: !2, line: 144, type: !1721)
!1721 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1722, size: 64)
!1722 = !DIDerivedType(tag: DW_TAG_typedef, name: "segment", file: !1723, line: 123, baseType: !1724)
!1723 = !DIFile(filename: "main_d2/segment.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "c950815a9b07e6bab2fa2587b90affec")
!1724 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "segment", file: !1723, line: 100, size: 4096, flags: DIFlagTypePassByValue, elements: !1725, identifier: "_ZTS7segment")
!1725 = !{!1726, !1757, !1759, !1761}
!1726 = !DIDerivedType(tag: DW_TAG_member, name: "sides", scope: !1724, file: !1723, line: 105, baseType: !1727, size: 3840)
!1727 = !DICompositeType(tag: DW_TAG_array_type, baseType: !1728, size: 3840, elements: !42)
!1728 = !DIDerivedType(tag: DW_TAG_typedef, name: "side", file: !1723, line: 91, baseType: !1729)
!1729 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "side", file: !1723, line: 82, size: 640, flags: DIFlagTypePassByValue, elements: !1730, identifier: "_ZTS4side")
!1730 = !{!1731, !1732, !1733, !1734, !1735, !1736, !1746}
!1731 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !1729, file: !1723, line: 84, baseType: !368, size: 8)
!1732 = !DIDerivedType(tag: DW_TAG_member, name: "pad", scope: !1729, file: !1723, line: 85, baseType: !83, size: 8, offset: 8)
!1733 = !DIDerivedType(tag: DW_TAG_member, name: "wall_num", scope: !1729, file: !1723, line: 86, baseType: !375, size: 16, offset: 16)
!1734 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_num", scope: !1729, file: !1723, line: 87, baseType: !375, size: 16, offset: 32)
!1735 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_num2", scope: !1729, file: !1723, line: 88, baseType: !375, size: 16, offset: 48)
!1736 = !DIDerivedType(tag: DW_TAG_member, name: "uvls", scope: !1729, file: !1723, line: 89, baseType: !1737, size: 384, offset: 64)
!1737 = !DICompositeType(tag: DW_TAG_array_type, baseType: !1738, size: 384, elements: !1744)
!1738 = !DIDerivedType(tag: DW_TAG_typedef, name: "uvl", file: !1723, line: 67, baseType: !1739)
!1739 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uvl", file: !1723, line: 64, size: 96, flags: DIFlagTypePassByValue, elements: !1740, identifier: "_ZTS3uvl")
!1740 = !{!1741, !1742, !1743}
!1741 = !DIDerivedType(tag: DW_TAG_member, name: "u", scope: !1739, file: !1723, line: 66, baseType: !90, size: 32)
!1742 = !DIDerivedType(tag: DW_TAG_member, name: "v", scope: !1739, file: !1723, line: 66, baseType: !90, size: 32, offset: 32)
!1743 = !DIDerivedType(tag: DW_TAG_member, name: "l", scope: !1739, file: !1723, line: 66, baseType: !90, size: 32, offset: 64)
!1744 = !{!1745}
!1745 = !DISubrange(count: 4)
!1746 = !DIDerivedType(tag: DW_TAG_member, name: "normals", scope: !1729, file: !1723, line: 90, baseType: !1747, size: 192, offset: 448)
!1747 = !DICompositeType(tag: DW_TAG_array_type, baseType: !1748, size: 192, elements: !1755)
!1748 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_vector", file: !1749, line: 22, baseType: !1750)
!1749 = !DIFile(filename: "./vecmat/vecmat.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "dfa84e3325c1ea4f5f74699fff5ef2bf")
!1750 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_vector", file: !1749, line: 19, size: 96, flags: DIFlagTypePassByValue, elements: !1751, identifier: "_ZTS10vms_vector")
!1751 = !{!1752, !1753, !1754}
!1752 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1750, file: !1749, line: 21, baseType: !90, size: 32)
!1753 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1750, file: !1749, line: 21, baseType: !90, size: 32, offset: 32)
!1754 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1750, file: !1749, line: 21, baseType: !90, size: 32, offset: 64)
!1755 = !{!1756}
!1756 = !DISubrange(count: 2)
!1757 = !DIDerivedType(tag: DW_TAG_member, name: "children", scope: !1724, file: !1723, line: 106, baseType: !1758, size: 96, offset: 3840)
!1758 = !DICompositeType(tag: DW_TAG_array_type, baseType: !375, size: 96, elements: !42)
!1759 = !DIDerivedType(tag: DW_TAG_member, name: "verts", scope: !1724, file: !1723, line: 107, baseType: !1760, size: 128, offset: 3936)
!1760 = !DICompositeType(tag: DW_TAG_array_type, baseType: !375, size: 128, elements: !16)
!1761 = !DIDerivedType(tag: DW_TAG_member, name: "objects", scope: !1724, file: !1723, line: 112, baseType: !77, size: 32, offset: 4064)
!1762 = !DILocation(line: 144, column: 11, scope: !1709)
!1763 = !DILocation(line: 144, column: 28, scope: !1709)
!1764 = !DILocation(line: 144, column: 19, scope: !1709)
!1765 = !DILocation(line: 146, column: 7, scope: !1766)
!1766 = distinct !DILexicalBlock(scope: !1709, file: !2, line: 146, column: 6)
!1767 = !DILocation(line: 146, column: 6, scope: !1766)
!1768 = !DILocation(line: 147, column: 3, scope: !1766)
!1769 = !DILocation(line: 149, column: 13, scope: !1709)
!1770 = !DILocation(line: 149, column: 19, scope: !1709)
!1771 = !DILocation(line: 149, column: 25, scope: !1709)
!1772 = !DILocation(line: 149, column: 34, scope: !1709)
!1773 = !DILocation(line: 149, column: 11, scope: !1709)
!1774 = !DILocation(line: 152, column: 6, scope: !1775)
!1775 = distinct !DILexicalBlock(scope: !1709, file: !2, line: 152, column: 6)
!1776 = !DILocation(line: 152, column: 15, scope: !1775)
!1777 = !DILocation(line: 153, column: 3, scope: !1775)
!1778 = !DILocation(line: 155, column: 35, scope: !1709)
!1779 = !DILocation(line: 155, column: 41, scope: !1709)
!1780 = !DILocation(line: 155, column: 9, scope: !1709)
!1781 = !DILocation(line: 155, column: 7, scope: !1709)
!1782 = !DILocation(line: 157, column: 9, scope: !1709)
!1783 = !DILocation(line: 157, column: 2, scope: !1709)
!1784 = !DILocation(line: 185, column: 1, scope: !1709)
!1785 = distinct !DISubprogram(name: "create_bfs_list", linkageName: "_Z15create_bfs_listiPsPii", scope: !2, file: !2, line: 197, type: !1786, scopeLine: 198, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !72, retainedNodes: !1669)
!1786 = !DISubroutineType(types: !1787)
!1787 = !{null, !77, !1788, !1088, !77}
!1788 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !375, size: 64)
!1789 = !DILocalVariable(name: "start_seg", arg: 1, scope: !1785, file: !2, line: 197, type: !77)
!1790 = !DILocation(line: 197, column: 26, scope: !1785)
!1791 = !DILocalVariable(name: "bfs_list", arg: 2, scope: !1785, file: !2, line: 197, type: !1788)
!1792 = !DILocation(line: 197, column: 43, scope: !1785)
!1793 = !DILocalVariable(name: "length", arg: 3, scope: !1785, file: !2, line: 197, type: !1088)
!1794 = !DILocation(line: 197, column: 60, scope: !1785)
!1795 = !DILocalVariable(name: "max_segs", arg: 4, scope: !1785, file: !2, line: 197, type: !77)
!1796 = !DILocation(line: 197, column: 72, scope: !1785)
!1797 = !DILocalVariable(name: "i", scope: !1785, file: !2, line: 205, type: !77)
!1798 = !DILocation(line: 205, column: 6, scope: !1785)
!1799 = !DILocalVariable(name: "head", scope: !1785, file: !2, line: 205, type: !77)
!1800 = !DILocation(line: 205, column: 9, scope: !1785)
!1801 = !DILocalVariable(name: "tail", scope: !1785, file: !2, line: 205, type: !77)
!1802 = !DILocation(line: 205, column: 15, scope: !1785)
!1803 = !DILocalVariable(name: "visited", scope: !1785, file: !2, line: 206, type: !1804)
!1804 = !DICompositeType(tag: DW_TAG_array_type, baseType: !368, size: 7200, elements: !1805)
!1805 = !{!1806}
!1806 = !DISubrange(count: 900)
!1807 = !DILocation(line: 206, column: 9, scope: !1785)
!1808 = !DILocation(line: 208, column: 8, scope: !1809)
!1809 = distinct !DILexicalBlock(scope: !1785, file: !2, line: 208, column: 2)
!1810 = !DILocation(line: 208, column: 7, scope: !1809)
!1811 = !DILocation(line: 208, column: 12, scope: !1812)
!1812 = distinct !DILexicalBlock(scope: !1809, file: !2, line: 208, column: 2)
!1813 = !DILocation(line: 208, column: 13, scope: !1812)
!1814 = !DILocation(line: 208, column: 2, scope: !1809)
!1815 = !DILocation(line: 209, column: 11, scope: !1812)
!1816 = !DILocation(line: 209, column: 3, scope: !1812)
!1817 = !DILocation(line: 209, column: 14, scope: !1812)
!1818 = !DILocation(line: 208, column: 29, scope: !1812)
!1819 = !DILocation(line: 208, column: 2, scope: !1812)
!1820 = distinct !{!1820, !1814, !1821, !1697}
!1821 = !DILocation(line: 209, column: 16, scope: !1809)
!1822 = !DILocation(line: 211, column: 7, scope: !1785)
!1823 = !DILocation(line: 212, column: 7, scope: !1785)
!1824 = !DILocation(line: 214, column: 21, scope: !1785)
!1825 = !DILocation(line: 214, column: 2, scope: !1785)
!1826 = !DILocation(line: 214, column: 15, scope: !1785)
!1827 = !DILocation(line: 214, column: 19, scope: !1785)
!1828 = !DILocation(line: 215, column: 10, scope: !1785)
!1829 = !DILocation(line: 215, column: 2, scope: !1785)
!1830 = !DILocation(line: 215, column: 21, scope: !1785)
!1831 = !DILocation(line: 217, column: 2, scope: !1785)
!1832 = !DILocation(line: 217, column: 10, scope: !1785)
!1833 = !DILocation(line: 217, column: 18, scope: !1785)
!1834 = !DILocation(line: 217, column: 15, scope: !1785)
!1835 = !DILocation(line: 217, column: 24, scope: !1785)
!1836 = !DILocation(line: 217, column: 28, scope: !1785)
!1837 = !DILocation(line: 217, column: 35, scope: !1785)
!1838 = !DILocation(line: 217, column: 33, scope: !1785)
!1839 = !DILocation(line: 0, scope: !1785)
!1840 = !DILocalVariable(name: "i", scope: !1841, file: !2, line: 219, type: !77)
!1841 = distinct !DILexicalBlock(scope: !1785, file: !2, line: 218, column: 2)
!1842 = !DILocation(line: 219, column: 8, scope: !1841)
!1843 = !DILocalVariable(name: "curseg", scope: !1841, file: !2, line: 220, type: !77)
!1844 = !DILocation(line: 220, column: 8, scope: !1841)
!1845 = !DILocalVariable(name: "cursegp", scope: !1841, file: !2, line: 221, type: !1721)
!1846 = !DILocation(line: 221, column: 12, scope: !1841)
!1847 = !DILocation(line: 223, column: 12, scope: !1841)
!1848 = !DILocation(line: 223, column: 25, scope: !1841)
!1849 = !DILocation(line: 223, column: 10, scope: !1841)
!1850 = !DILocation(line: 224, column: 23, scope: !1841)
!1851 = !DILocation(line: 224, column: 14, scope: !1841)
!1852 = !DILocation(line: 224, column: 11, scope: !1841)
!1853 = !DILocation(line: 226, column: 9, scope: !1854)
!1854 = distinct !DILexicalBlock(scope: !1841, file: !2, line: 226, column: 3)
!1855 = !DILocation(line: 226, column: 8, scope: !1854)
!1856 = !DILocation(line: 226, column: 13, scope: !1857)
!1857 = distinct !DILexicalBlock(scope: !1854, file: !2, line: 226, column: 3)
!1858 = !DILocation(line: 226, column: 14, scope: !1857)
!1859 = !DILocation(line: 226, column: 3, scope: !1854)
!1860 = !DILocalVariable(name: "connected_seg", scope: !1861, file: !2, line: 228, type: !77)
!1861 = distinct !DILexicalBlock(scope: !1857, file: !2, line: 227, column: 3)
!1862 = !DILocation(line: 228, column: 8, scope: !1861)
!1863 = !DILocation(line: 230, column: 20, scope: !1861)
!1864 = !DILocation(line: 230, column: 29, scope: !1861)
!1865 = !DILocation(line: 230, column: 38, scope: !1861)
!1866 = !DILocation(line: 230, column: 18, scope: !1861)
!1867 = !DILocation(line: 232, column: 8, scope: !1868)
!1868 = distinct !DILexicalBlock(scope: !1861, file: !2, line: 232, column: 8)
!1869 = !DILocation(line: 232, column: 32, scope: !1868)
!1870 = !DILocation(line: 232, column: 44, scope: !1868)
!1871 = !DILocation(line: 232, column: 36, scope: !1868)
!1872 = !DILocation(line: 232, column: 59, scope: !1868)
!1873 = !DILocation(line: 234, column: 30, scope: !1874)
!1874 = distinct !DILexicalBlock(scope: !1875, file: !2, line: 234, column: 9)
!1875 = distinct !DILexicalBlock(scope: !1868, file: !2, line: 233, column: 4)
!1876 = !DILocation(line: 234, column: 38, scope: !1874)
!1877 = !DILocation(line: 234, column: 9, scope: !1874)
!1878 = !DILocation(line: 236, column: 25, scope: !1879)
!1879 = distinct !DILexicalBlock(scope: !1874, file: !2, line: 235, column: 5)
!1880 = !DILocation(line: 236, column: 6, scope: !1879)
!1881 = !DILocation(line: 236, column: 19, scope: !1879)
!1882 = !DILocation(line: 236, column: 23, scope: !1879)
!1883 = !DILocation(line: 237, column: 10, scope: !1884)
!1884 = distinct !DILexicalBlock(scope: !1879, file: !2, line: 237, column: 10)
!1885 = !DILocation(line: 237, column: 18, scope: !1884)
!1886 = !DILocation(line: 237, column: 15, scope: !1884)
!1887 = !DILocation(line: 238, column: 7, scope: !1884)
!1888 = !DILocation(line: 239, column: 14, scope: !1879)
!1889 = !DILocation(line: 239, column: 6, scope: !1879)
!1890 = !DILocation(line: 239, column: 29, scope: !1879)
!1891 = !DILocation(line: 240, column: 6, scope: !1879)
!1892 = !DILocation(line: 241, column: 5, scope: !1879)
!1893 = !DILocation(line: 242, column: 4, scope: !1875)
!1894 = !DILocation(line: 243, column: 3, scope: !1861)
!1895 = !DILocation(line: 226, column: 39, scope: !1857)
!1896 = !DILocation(line: 226, column: 3, scope: !1857)
!1897 = distinct !{!1897, !1859, !1898, !1697}
!1898 = !DILocation(line: 243, column: 3, scope: !1854)
!1899 = distinct !{!1899, !1831, !1900, !1697}
!1900 = !DILocation(line: 244, column: 2, scope: !1785)
!1901 = !DILocation(line: 246, column: 12, scope: !1785)
!1902 = !DILocation(line: 246, column: 3, scope: !1785)
!1903 = !DILocation(line: 246, column: 10, scope: !1785)
!1904 = !DILocation(line: 248, column: 1, scope: !1785)
!1905 = distinct !DISubprogram(name: "ok_for_buddy_to_talk", linkageName: "_Z20ok_for_buddy_to_talkv", scope: !2, file: !2, line: 254, type: !920, scopeLine: 255, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !72, retainedNodes: !1669)
!1906 = !DILocalVariable(name: "i", scope: !1905, file: !2, line: 256, type: !77)
!1907 = !DILocation(line: 256, column: 7, scope: !1905)
!1908 = !DILocalVariable(name: "segp", scope: !1905, file: !2, line: 257, type: !1721)
!1909 = !DILocation(line: 257, column: 11, scope: !1905)
!1910 = !DILocation(line: 259, column: 14, scope: !1911)
!1911 = distinct !DILexicalBlock(scope: !1905, file: !2, line: 259, column: 6)
!1912 = !DILocation(line: 259, column: 6, scope: !1911)
!1913 = !DILocation(line: 259, column: 28, scope: !1911)
!1914 = !DILocation(line: 259, column: 33, scope: !1911)
!1915 = !DILocation(line: 261, column: 25, scope: !1916)
!1916 = distinct !DILexicalBlock(scope: !1911, file: !2, line: 260, column: 2)
!1917 = !DILocation(line: 262, column: 3, scope: !1916)
!1918 = !DILocation(line: 265, column: 6, scope: !1919)
!1919 = distinct !DILexicalBlock(scope: !1905, file: !2, line: 265, column: 6)
!1920 = !DILocation(line: 266, column: 3, scope: !1919)
!1921 = !DILocation(line: 268, column: 15, scope: !1922)
!1922 = distinct !DILexicalBlock(scope: !1905, file: !2, line: 268, column: 6)
!1923 = !DILocation(line: 268, column: 7, scope: !1922)
!1924 = !DILocation(line: 268, column: 29, scope: !1922)
!1925 = !DILocation(line: 268, column: 34, scope: !1922)
!1926 = !DILocation(line: 268, column: 48, scope: !1922)
!1927 = !DILocation(line: 268, column: 52, scope: !1922)
!1928 = !DILocation(line: 268, column: 68, scope: !1922)
!1929 = !DILocation(line: 268, column: 65, scope: !1922)
!1930 = !DILocation(line: 268, column: 90, scope: !1922)
!1931 = !DILocation(line: 268, column: 113, scope: !1922)
!1932 = !DILocation(line: 268, column: 105, scope: !1922)
!1933 = !DILocation(line: 268, column: 127, scope: !1922)
!1934 = !DILocation(line: 268, column: 94, scope: !1922)
!1935 = !DILocation(line: 268, column: 131, scope: !1922)
!1936 = !DILocation(line: 269, column: 9, scope: !1937)
!1937 = distinct !DILexicalBlock(scope: !1938, file: !2, line: 269, column: 3)
!1938 = distinct !DILexicalBlock(scope: !1922, file: !2, line: 268, column: 142)
!1939 = !DILocation(line: 269, column: 8, scope: !1937)
!1940 = !DILocation(line: 269, column: 13, scope: !1941)
!1941 = distinct !DILexicalBlock(scope: !1937, file: !2, line: 269, column: 3)
!1942 = !DILocation(line: 269, column: 16, scope: !1941)
!1943 = !DILocation(line: 269, column: 14, scope: !1941)
!1944 = !DILocation(line: 269, column: 3, scope: !1937)
!1945 = !DILocation(line: 270, column: 27, scope: !1946)
!1946 = distinct !DILexicalBlock(scope: !1941, file: !2, line: 270, column: 8)
!1947 = !DILocation(line: 270, column: 19, scope: !1946)
!1948 = !DILocation(line: 270, column: 30, scope: !1946)
!1949 = !DILocation(line: 270, column: 8, scope: !1946)
!1950 = !DILocation(line: 270, column: 34, scope: !1946)
!1951 = !DILocation(line: 271, column: 5, scope: !1946)
!1952 = !DILocation(line: 269, column: 39, scope: !1941)
!1953 = !DILocation(line: 269, column: 3, scope: !1941)
!1954 = distinct !{!1954, !1944, !1955, !1697}
!1955 = !DILocation(line: 271, column: 5, scope: !1937)
!1956 = !DILocation(line: 272, column: 7, scope: !1957)
!1957 = distinct !DILexicalBlock(scope: !1938, file: !2, line: 272, column: 7)
!1958 = !DILocation(line: 272, column: 11, scope: !1957)
!1959 = !DILocation(line: 272, column: 9, scope: !1957)
!1960 = !DILocation(line: 273, column: 4, scope: !1957)
!1961 = !DILocation(line: 275, column: 19, scope: !1957)
!1962 = !DILocation(line: 275, column: 17, scope: !1957)
!1963 = !DILocation(line: 276, column: 2, scope: !1938)
!1964 = !DILocation(line: 278, column: 27, scope: !1905)
!1965 = !DILocation(line: 278, column: 19, scope: !1905)
!1966 = !DILocation(line: 278, column: 41, scope: !1905)
!1967 = !DILocation(line: 278, column: 10, scope: !1905)
!1968 = !DILocation(line: 278, column: 7, scope: !1905)
!1969 = !DILocation(line: 280, column: 8, scope: !1970)
!1970 = distinct !DILexicalBlock(scope: !1905, file: !2, line: 280, column: 2)
!1971 = !DILocation(line: 280, column: 7, scope: !1970)
!1972 = !DILocation(line: 280, column: 12, scope: !1973)
!1973 = distinct !DILexicalBlock(scope: !1970, file: !2, line: 280, column: 2)
!1974 = !DILocation(line: 280, column: 13, scope: !1973)
!1975 = !DILocation(line: 280, column: 2, scope: !1970)
!1976 = !DILocalVariable(name: "wall_num", scope: !1977, file: !2, line: 282, type: !77)
!1977 = distinct !DILexicalBlock(scope: !1973, file: !2, line: 281, column: 2)
!1978 = !DILocation(line: 282, column: 7, scope: !1977)
!1979 = !DILocation(line: 282, column: 18, scope: !1977)
!1980 = !DILocation(line: 282, column: 24, scope: !1977)
!1981 = !DILocation(line: 282, column: 30, scope: !1977)
!1982 = !DILocation(line: 282, column: 33, scope: !1977)
!1983 = !DILocation(line: 284, column: 7, scope: !1984)
!1984 = distinct !DILexicalBlock(scope: !1977, file: !2, line: 284, column: 7)
!1985 = !DILocation(line: 284, column: 16, scope: !1984)
!1986 = !DILocation(line: 286, column: 15, scope: !1987)
!1987 = distinct !DILexicalBlock(scope: !1988, file: !2, line: 286, column: 8)
!1988 = distinct !DILexicalBlock(scope: !1984, file: !2, line: 285, column: 3)
!1989 = !DILocation(line: 286, column: 9, scope: !1987)
!1990 = !DILocation(line: 286, column: 25, scope: !1987)
!1991 = !DILocation(line: 286, column: 30, scope: !1987)
!1992 = !DILocation(line: 286, column: 49, scope: !1987)
!1993 = !DILocation(line: 286, column: 60, scope: !1987)
!1994 = !DILocation(line: 286, column: 54, scope: !1987)
!1995 = !DILocation(line: 286, column: 70, scope: !1987)
!1996 = !DILocation(line: 286, column: 76, scope: !1987)
!1997 = !DILocation(line: 286, column: 53, scope: !1987)
!1998 = !DILocation(line: 287, column: 5, scope: !1987)
!1999 = !DILocation(line: 288, column: 3, scope: !1988)
!2000 = !DILocation(line: 291, column: 7, scope: !2001)
!2001 = distinct !DILexicalBlock(scope: !1977, file: !2, line: 291, column: 7)
!2002 = !DILocalVariable(name: "j", scope: !2003, file: !2, line: 293, type: !77)
!2003 = distinct !DILexicalBlock(scope: !2001, file: !2, line: 292, column: 3)
!2004 = !DILocation(line: 293, column: 9, scope: !2003)
!2005 = !DILocalVariable(name: "csegp", scope: !2003, file: !2, line: 294, type: !1721)
!2006 = !DILocation(line: 294, column: 13, scope: !2003)
!2007 = !DILocation(line: 294, column: 31, scope: !2003)
!2008 = !DILocation(line: 294, column: 37, scope: !2003)
!2009 = !DILocation(line: 294, column: 46, scope: !2003)
!2010 = !DILocation(line: 294, column: 22, scope: !2003)
!2011 = !DILocation(line: 296, column: 10, scope: !2012)
!2012 = distinct !DILexicalBlock(scope: !2003, file: !2, line: 296, column: 4)
!2013 = !DILocation(line: 296, column: 9, scope: !2012)
!2014 = !DILocation(line: 296, column: 14, scope: !2015)
!2015 = distinct !DILexicalBlock(scope: !2012, file: !2, line: 296, column: 4)
!2016 = !DILocation(line: 296, column: 15, scope: !2015)
!2017 = !DILocation(line: 296, column: 4, scope: !2012)
!2018 = !DILocalVariable(name: "wall2", scope: !2019, file: !2, line: 298, type: !77)
!2019 = distinct !DILexicalBlock(scope: !2015, file: !2, line: 297, column: 4)
!2020 = !DILocation(line: 298, column: 9, scope: !2019)
!2021 = !DILocation(line: 298, column: 17, scope: !2019)
!2022 = !DILocation(line: 298, column: 24, scope: !2019)
!2023 = !DILocation(line: 298, column: 30, scope: !2019)
!2024 = !DILocation(line: 298, column: 33, scope: !2019)
!2025 = !DILocation(line: 300, column: 9, scope: !2026)
!2026 = distinct !DILexicalBlock(scope: !2019, file: !2, line: 300, column: 9)
!2027 = !DILocation(line: 300, column: 15, scope: !2026)
!2028 = !DILocation(line: 302, column: 17, scope: !2029)
!2029 = distinct !DILexicalBlock(scope: !2030, file: !2, line: 302, column: 10)
!2030 = distinct !DILexicalBlock(scope: !2026, file: !2, line: 301, column: 5)
!2031 = !DILocation(line: 302, column: 11, scope: !2029)
!2032 = !DILocation(line: 302, column: 24, scope: !2029)
!2033 = !DILocation(line: 302, column: 29, scope: !2029)
!2034 = !DILocation(line: 302, column: 48, scope: !2029)
!2035 = !DILocation(line: 302, column: 59, scope: !2029)
!2036 = !DILocation(line: 302, column: 53, scope: !2029)
!2037 = !DILocation(line: 302, column: 66, scope: !2029)
!2038 = !DILocation(line: 302, column: 72, scope: !2029)
!2039 = !DILocation(line: 302, column: 52, scope: !2029)
!2040 = !DILocation(line: 303, column: 7, scope: !2029)
!2041 = !DILocation(line: 304, column: 5, scope: !2030)
!2042 = !DILocation(line: 305, column: 4, scope: !2019)
!2043 = !DILocation(line: 296, column: 40, scope: !2015)
!2044 = !DILocation(line: 296, column: 4, scope: !2015)
!2045 = distinct !{!2045, !2017, !2046, !1697}
!2046 = !DILocation(line: 305, column: 4, scope: !2012)
!2047 = !DILocation(line: 306, column: 3, scope: !2003)
!2048 = !DILocation(line: 307, column: 2, scope: !1977)
!2049 = !DILocation(line: 280, column: 38, scope: !1973)
!2050 = !DILocation(line: 280, column: 2, scope: !1973)
!2051 = distinct !{!2051, !1975, !2052, !1697}
!2052 = !DILocation(line: 307, column: 2, scope: !1970)
!2053 = !DILocation(line: 309, column: 24, scope: !1905)
!2054 = !DILocation(line: 310, column: 2, scope: !1905)
!2055 = !DILocation(line: 311, column: 1, scope: !1905)
!2056 = distinct !DISubprogram(name: "detect_escort_goal_accomplished", linkageName: "_Z31detect_escort_goal_accomplishedi", scope: !2, file: !2, line: 314, type: !955, scopeLine: 315, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !72, retainedNodes: !1669)
!2057 = !DILocalVariable(name: "index", arg: 1, scope: !2056, file: !2, line: 314, type: !77)
!2058 = !DILocation(line: 314, column: 42, scope: !2056)
!2059 = !DILocalVariable(name: "i", scope: !2056, file: !2, line: 316, type: !77)
!2060 = !DILocation(line: 316, column: 6, scope: !2056)
!2061 = !DILocalVariable(name: "j", scope: !2056, file: !2, line: 316, type: !77)
!2062 = !DILocation(line: 316, column: 8, scope: !2056)
!2063 = !DILocalVariable(name: "detected", scope: !2056, file: !2, line: 317, type: !77)
!2064 = !DILocation(line: 317, column: 6, scope: !2056)
!2065 = !DILocation(line: 319, column: 7, scope: !2066)
!2066 = distinct !DILexicalBlock(scope: !2056, file: !2, line: 319, column: 6)
!2067 = !DILocation(line: 319, column: 6, scope: !2066)
!2068 = !DILocation(line: 320, column: 3, scope: !2066)
!2069 = !DILocation(line: 323, column: 6, scope: !2070)
!2070 = distinct !DILexicalBlock(scope: !2056, file: !2, line: 323, column: 6)
!2071 = !DILocation(line: 323, column: 26, scope: !2070)
!2072 = !DILocation(line: 324, column: 3, scope: !2070)
!2073 = !DILocation(line: 329, column: 6, scope: !2074)
!2074 = distinct !DILexicalBlock(scope: !2056, file: !2, line: 329, column: 5)
!2075 = !DILocation(line: 329, column: 26, scope: !2074)
!2076 = !DILocation(line: 329, column: 33, scope: !2074)
!2077 = !DILocation(line: 329, column: 37, scope: !2074)
!2078 = !DILocation(line: 329, column: 58, scope: !2074)
!2079 = !DILocation(line: 329, column: 55, scope: !2074)
!2080 = !DILocation(line: 330, column: 11, scope: !2081)
!2081 = distinct !DILexicalBlock(scope: !2074, file: !2, line: 329, column: 66)
!2082 = !DILocation(line: 331, column: 2, scope: !2081)
!2083 = !DILocation(line: 334, column: 6, scope: !2084)
!2084 = distinct !DILexicalBlock(scope: !2056, file: !2, line: 334, column: 5)
!2085 = !DILocation(line: 334, column: 24, scope: !2084)
!2086 = !DILocation(line: 334, column: 48, scope: !2084)
!2087 = !DILocation(line: 334, column: 52, scope: !2084)
!2088 = !DILocation(line: 334, column: 58, scope: !2084)
!2089 = !DILocation(line: 335, column: 14, scope: !2090)
!2090 = distinct !DILexicalBlock(scope: !2091, file: !2, line: 335, column: 6)
!2091 = distinct !DILexicalBlock(scope: !2084, file: !2, line: 334, column: 65)
!2092 = !DILocation(line: 335, column: 6, scope: !2090)
!2093 = !DILocation(line: 335, column: 21, scope: !2090)
!2094 = !DILocation(line: 335, column: 26, scope: !2090)
!2095 = !DILocation(line: 336, column: 15, scope: !2096)
!2096 = distinct !DILexicalBlock(scope: !2097, file: !2, line: 336, column: 7)
!2097 = distinct !DILexicalBlock(scope: !2090, file: !2, line: 335, column: 43)
!2098 = !DILocation(line: 336, column: 7, scope: !2096)
!2099 = !DILocation(line: 336, column: 22, scope: !2096)
!2100 = !DILocation(line: 336, column: 25, scope: !2096)
!2101 = !DILocation(line: 337, column: 8, scope: !2102)
!2102 = distinct !DILexicalBlock(scope: !2103, file: !2, line: 337, column: 8)
!2103 = distinct !DILexicalBlock(scope: !2096, file: !2, line: 336, column: 42)
!2104 = !DILocation(line: 337, column: 26, scope: !2102)
!2105 = !DILocation(line: 338, column: 14, scope: !2106)
!2106 = distinct !DILexicalBlock(scope: !2102, file: !2, line: 337, column: 51)
!2107 = !DILocation(line: 339, column: 5, scope: !2106)
!2108 = !DILocation(line: 341, column: 3, scope: !2103)
!2109 = !DILocation(line: 341, column: 22, scope: !2110)
!2110 = distinct !DILexicalBlock(scope: !2096, file: !2, line: 341, column: 14)
!2111 = !DILocation(line: 341, column: 14, scope: !2110)
!2112 = !DILocation(line: 341, column: 29, scope: !2110)
!2113 = !DILocation(line: 341, column: 32, scope: !2110)
!2114 = !DILocation(line: 342, column: 8, scope: !2115)
!2115 = distinct !DILexicalBlock(scope: !2116, file: !2, line: 342, column: 8)
!2116 = distinct !DILexicalBlock(scope: !2110, file: !2, line: 341, column: 49)
!2117 = !DILocation(line: 342, column: 26, scope: !2115)
!2118 = !DILocation(line: 343, column: 14, scope: !2119)
!2119 = distinct !DILexicalBlock(scope: !2115, file: !2, line: 342, column: 51)
!2120 = !DILocation(line: 344, column: 5, scope: !2119)
!2121 = !DILocation(line: 346, column: 3, scope: !2116)
!2122 = !DILocation(line: 346, column: 22, scope: !2123)
!2123 = distinct !DILexicalBlock(scope: !2110, file: !2, line: 346, column: 14)
!2124 = !DILocation(line: 346, column: 14, scope: !2123)
!2125 = !DILocation(line: 346, column: 29, scope: !2123)
!2126 = !DILocation(line: 346, column: 32, scope: !2123)
!2127 = !DILocation(line: 347, column: 8, scope: !2128)
!2128 = distinct !DILexicalBlock(scope: !2129, file: !2, line: 347, column: 8)
!2129 = distinct !DILexicalBlock(scope: !2123, file: !2, line: 346, column: 48)
!2130 = !DILocation(line: 347, column: 26, scope: !2128)
!2131 = !DILocation(line: 348, column: 14, scope: !2132)
!2132 = distinct !DILexicalBlock(scope: !2128, file: !2, line: 347, column: 50)
!2133 = !DILocation(line: 349, column: 5, scope: !2132)
!2134 = !DILocation(line: 351, column: 3, scope: !2129)
!2135 = !DILocation(line: 352, column: 2, scope: !2097)
!2136 = !DILocation(line: 353, column: 1, scope: !2091)
!2137 = !DILocation(line: 354, column: 6, scope: !2138)
!2138 = distinct !DILexicalBlock(scope: !2056, file: !2, line: 354, column: 6)
!2139 = !DILocation(line: 354, column: 26, scope: !2138)
!2140 = !DILocation(line: 355, column: 7, scope: !2141)
!2141 = distinct !DILexicalBlock(scope: !2138, file: !2, line: 355, column: 7)
!2142 = !DILocation(line: 355, column: 27, scope: !2141)
!2143 = !DILocation(line: 356, column: 8, scope: !2144)
!2144 = distinct !DILexicalBlock(scope: !2145, file: !2, line: 356, column: 8)
!2145 = distinct !DILexicalBlock(scope: !2141, file: !2, line: 355, column: 53)
!2146 = !DILocation(line: 356, column: 14, scope: !2144)
!2147 = !DILocation(line: 357, column: 14, scope: !2144)
!2148 = !DILocation(line: 357, column: 5, scope: !2144)
!2149 = !DILocation(line: 359, column: 11, scope: !2150)
!2150 = distinct !DILexicalBlock(scope: !2151, file: !2, line: 359, column: 5)
!2151 = distinct !DILexicalBlock(scope: !2144, file: !2, line: 358, column: 9)
!2152 = !DILocation(line: 359, column: 10, scope: !2150)
!2153 = !DILocation(line: 359, column: 15, scope: !2154)
!2154 = distinct !DILexicalBlock(scope: !2150, file: !2, line: 359, column: 5)
!2155 = !DILocation(line: 359, column: 16, scope: !2154)
!2156 = !DILocation(line: 359, column: 5, scope: !2150)
!2157 = !DILocation(line: 360, column: 19, scope: !2158)
!2158 = distinct !DILexicalBlock(scope: !2154, file: !2, line: 360, column: 10)
!2159 = !DILocation(line: 360, column: 10, scope: !2158)
!2160 = !DILocation(line: 360, column: 26, scope: !2158)
!2161 = !DILocation(line: 360, column: 35, scope: !2158)
!2162 = !DILocation(line: 360, column: 41, scope: !2158)
!2163 = !DILocation(line: 360, column: 38, scope: !2158)
!2164 = !DILocation(line: 361, column: 16, scope: !2165)
!2165 = distinct !DILexicalBlock(scope: !2158, file: !2, line: 360, column: 60)
!2166 = !DILocation(line: 362, column: 7, scope: !2165)
!2167 = !DILocation(line: 364, column: 13, scope: !2168)
!2168 = distinct !DILexicalBlock(scope: !2169, file: !2, line: 364, column: 7)
!2169 = distinct !DILexicalBlock(scope: !2158, file: !2, line: 363, column: 13)
!2170 = !DILocation(line: 364, column: 12, scope: !2168)
!2171 = !DILocation(line: 364, column: 17, scope: !2172)
!2172 = distinct !DILexicalBlock(scope: !2168, file: !2, line: 364, column: 7)
!2173 = !DILocation(line: 364, column: 18, scope: !2172)
!2174 = !DILocation(line: 364, column: 7, scope: !2168)
!2175 = !DILocation(line: 365, column: 21, scope: !2176)
!2176 = distinct !DILexicalBlock(scope: !2172, file: !2, line: 365, column: 12)
!2177 = !DILocation(line: 365, column: 12, scope: !2176)
!2178 = !DILocation(line: 365, column: 24, scope: !2176)
!2179 = !DILocation(line: 365, column: 33, scope: !2176)
!2180 = !DILocation(line: 365, column: 39, scope: !2176)
!2181 = !DILocation(line: 365, column: 36, scope: !2176)
!2182 = !DILocation(line: 366, column: 18, scope: !2183)
!2183 = distinct !DILexicalBlock(scope: !2176, file: !2, line: 365, column: 58)
!2184 = !DILocation(line: 367, column: 9, scope: !2183)
!2185 = !DILocation(line: 364, column: 43, scope: !2172)
!2186 = !DILocation(line: 364, column: 7, scope: !2172)
!2187 = distinct !{!2187, !2174, !2188, !1697}
!2188 = !DILocation(line: 368, column: 8, scope: !2168)
!2189 = !DILocation(line: 359, column: 41, scope: !2154)
!2190 = !DILocation(line: 359, column: 5, scope: !2154)
!2191 = distinct !{!2191, !2156, !2192, !1697}
!2192 = !DILocation(line: 369, column: 6, scope: !2150)
!2193 = !DILocation(line: 371, column: 3, scope: !2145)
!2194 = !DILocation(line: 371, column: 23, scope: !2195)
!2195 = distinct !DILexicalBlock(scope: !2141, file: !2, line: 371, column: 14)
!2196 = !DILocation(line: 371, column: 15, scope: !2195)
!2197 = !DILocation(line: 371, column: 30, scope: !2195)
!2198 = !DILocation(line: 371, column: 35, scope: !2195)
!2199 = !DILocation(line: 371, column: 51, scope: !2195)
!2200 = !DILocation(line: 371, column: 55, scope: !2195)
!2201 = !DILocation(line: 371, column: 75, scope: !2195)
!2202 = !DILocation(line: 372, column: 13, scope: !2195)
!2203 = !DILocation(line: 372, column: 4, scope: !2195)
!2204 = !DILocation(line: 373, column: 21, scope: !2205)
!2205 = distinct !DILexicalBlock(scope: !2195, file: !2, line: 373, column: 12)
!2206 = !DILocation(line: 373, column: 13, scope: !2205)
!2207 = !DILocation(line: 373, column: 28, scope: !2205)
!2208 = !DILocation(line: 373, column: 44, scope: !2205)
!2209 = !DILocation(line: 373, column: 36, scope: !2205)
!2210 = !DILocation(line: 373, column: 63, scope: !2205)
!2211 = !DILocation(line: 373, column: 33, scope: !2205)
!2212 = !DILocation(line: 373, column: 69, scope: !2205)
!2213 = !DILocation(line: 373, column: 81, scope: !2205)
!2214 = !DILocation(line: 373, column: 73, scope: !2205)
!2215 = !DILocation(line: 373, column: 88, scope: !2205)
!2216 = !DILocation(line: 373, column: 102, scope: !2205)
!2217 = !DILocation(line: 373, column: 94, scope: !2205)
!2218 = !DILocation(line: 373, column: 121, scope: !2205)
!2219 = !DILocation(line: 373, column: 91, scope: !2205)
!2220 = !DILocation(line: 376, column: 13, scope: !2221)
!2221 = distinct !DILexicalBlock(scope: !2205, file: !2, line: 373, column: 126)
!2222 = !DILocation(line: 377, column: 3, scope: !2221)
!2223 = !DILocation(line: 355, column: 30, scope: !2141)
!2224 = !DILocation(line: 354, column: 30, scope: !2138)
!2225 = !DILabel(scope: !2056, name: "dega_ok", file: !2, line: 379)
!2226 = !DILocation(line: 379, column: 1, scope: !2056)
!2227 = !DILocation(line: 380, column: 6, scope: !2228)
!2228 = distinct !DILexicalBlock(scope: !2056, file: !2, line: 380, column: 6)
!2229 = !DILocation(line: 380, column: 15, scope: !2228)
!2230 = !DILocation(line: 380, column: 18, scope: !2228)
!2231 = !DILocation(line: 381, column: 3, scope: !2232)
!2232 = distinct !DILexicalBlock(scope: !2228, file: !2, line: 380, column: 42)
!2233 = !DILocation(line: 382, column: 21, scope: !2232)
!2234 = !DILocation(line: 383, column: 22, scope: !2232)
!2235 = !DILocation(line: 384, column: 23, scope: !2232)
!2236 = !DILocation(line: 385, column: 22, scope: !2232)
!2237 = !DILocation(line: 386, column: 2, scope: !2232)
!2238 = !DILocation(line: 388, column: 1, scope: !2056)
!2239 = distinct !DISubprogram(name: "change_guidebot_name", linkageName: "_Z20change_guidebot_namev", scope: !2, file: !2, line: 390, type: !946, scopeLine: 391, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !72, retainedNodes: !1669)
!2240 = !DILocalVariable(name: "m", scope: !2239, file: !2, line: 392, type: !2241)
!2241 = !DIDerivedType(tag: DW_TAG_typedef, name: "newmenu_item", file: !2242, line: 43, baseType: !2243)
!2242 = !DIFile(filename: "main_d2/newmenu.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "4605fd1e125e01ec40c07444141cd888")
!2243 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "newmenu_item", file: !2242, line: 30, size: 768, flags: DIFlagTypePassByValue, elements: !2244, identifier: "_ZTS12newmenu_item")
!2244 = !{!2245, !2246, !2247, !2248, !2249, !2250, !2251, !2252, !2253, !2254, !2255, !2256, !2257, !2258}
!2245 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !2243, file: !2242, line: 31, baseType: !77, size: 32)
!2246 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !2243, file: !2242, line: 32, baseType: !77, size: 32, offset: 32)
!2247 = !DIDerivedType(tag: DW_TAG_member, name: "min_value", scope: !2243, file: !2242, line: 33, baseType: !77, size: 32, offset: 64)
!2248 = !DIDerivedType(tag: DW_TAG_member, name: "max_value", scope: !2243, file: !2242, line: 33, baseType: !77, size: 32, offset: 96)
!2249 = !DIDerivedType(tag: DW_TAG_member, name: "group", scope: !2243, file: !2242, line: 34, baseType: !77, size: 32, offset: 128)
!2250 = !DIDerivedType(tag: DW_TAG_member, name: "text_len", scope: !2243, file: !2242, line: 35, baseType: !77, size: 32, offset: 160)
!2251 = !DIDerivedType(tag: DW_TAG_member, name: "text", scope: !2243, file: !2242, line: 36, baseType: !574, size: 64, offset: 192)
!2252 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !2243, file: !2242, line: 38, baseType: !375, size: 16, offset: 256)
!2253 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !2243, file: !2242, line: 38, baseType: !375, size: 16, offset: 272)
!2254 = !DIDerivedType(tag: DW_TAG_member, name: "w", scope: !2243, file: !2242, line: 39, baseType: !375, size: 16, offset: 288)
!2255 = !DIDerivedType(tag: DW_TAG_member, name: "h", scope: !2243, file: !2242, line: 39, baseType: !375, size: 16, offset: 304)
!2256 = !DIDerivedType(tag: DW_TAG_member, name: "right_offset", scope: !2243, file: !2242, line: 40, baseType: !375, size: 16, offset: 320)
!2257 = !DIDerivedType(tag: DW_TAG_member, name: "redraw", scope: !2243, file: !2242, line: 41, baseType: !83, size: 8, offset: 336)
!2258 = !DIDerivedType(tag: DW_TAG_member, name: "saved_text", scope: !2243, file: !2242, line: 42, baseType: !2259, size: 408, offset: 344)
!2259 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 408, elements: !2260)
!2260 = !{!2261}
!2261 = !DISubrange(count: 51)
!2262 = !DILocation(line: 392, column: 15, scope: !2239)
!2263 = !DILocalVariable(name: "text", scope: !2239, file: !2, line: 393, type: !116)
!2264 = !DILocation(line: 393, column: 7, scope: !2239)
!2265 = !DILocalVariable(name: "item", scope: !2239, file: !2, line: 394, type: !77)
!2266 = !DILocation(line: 394, column: 6, scope: !2239)
!2267 = !DILocation(line: 396, column: 9, scope: !2239)
!2268 = !DILocation(line: 396, column: 2, scope: !2239)
!2269 = !DILocation(line: 398, column: 4, scope: !2239)
!2270 = !DILocation(line: 398, column: 8, scope: !2239)
!2271 = !DILocation(line: 398, column: 26, scope: !2239)
!2272 = !DILocation(line: 398, column: 35, scope: !2239)
!2273 = !DILocation(line: 398, column: 65, scope: !2239)
!2274 = !DILocation(line: 398, column: 58, scope: !2239)
!2275 = !DILocation(line: 398, column: 63, scope: !2239)
!2276 = !DILocation(line: 399, column: 9, scope: !2239)
!2277 = !DILocation(line: 399, column: 7, scope: !2239)
!2278 = !DILocation(line: 401, column: 6, scope: !2279)
!2279 = distinct !DILexicalBlock(scope: !2239, file: !2, line: 401, column: 6)
!2280 = !DILocation(line: 401, column: 11, scope: !2279)
!2281 = !DILocation(line: 402, column: 24, scope: !2282)
!2282 = distinct !DILexicalBlock(scope: !2279, file: !2, line: 401, column: 18)
!2283 = !DILocation(line: 402, column: 3, scope: !2282)
!2284 = !DILocation(line: 403, column: 29, scope: !2282)
!2285 = !DILocation(line: 403, column: 3, scope: !2282)
!2286 = !DILocation(line: 404, column: 3, scope: !2282)
!2287 = !DILocation(line: 405, column: 2, scope: !2282)
!2288 = !DILocation(line: 406, column: 1, scope: !2239)
!2289 = distinct !DISubprogram(name: "buddy_message", linkageName: "_Z13buddy_messagePKcz", scope: !2, file: !2, line: 409, type: !2290, scopeLine: 410, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !72, retainedNodes: !1669)
!2290 = !DISubroutineType(types: !2291)
!2291 = !{null, !531, null}
!2292 = !DILocalVariable(name: "format", arg: 1, scope: !2289, file: !2, line: 409, type: !531)
!2293 = !DILocation(line: 409, column: 33, scope: !2289)
!2294 = !DILocation(line: 411, column: 6, scope: !2295)
!2295 = distinct !DILexicalBlock(scope: !2289, file: !2, line: 411, column: 6)
!2296 = !DILocation(line: 412, column: 3, scope: !2295)
!2297 = !DILocation(line: 414, column: 6, scope: !2298)
!2298 = distinct !DILexicalBlock(scope: !2289, file: !2, line: 414, column: 6)
!2299 = !DILocation(line: 414, column: 16, scope: !2298)
!2300 = !DILocation(line: 415, column: 3, scope: !2298)
!2301 = !DILocation(line: 417, column: 7, scope: !2302)
!2302 = distinct !DILexicalBlock(scope: !2289, file: !2, line: 417, column: 6)
!2303 = !DILocation(line: 417, column: 31, scope: !2302)
!2304 = !DILocation(line: 417, column: 40, scope: !2302)
!2305 = !DILocation(line: 417, column: 38, scope: !2302)
!2306 = !DILocation(line: 417, column: 50, scope: !2302)
!2307 = !DILocation(line: 417, column: 54, scope: !2302)
!2308 = !DILocation(line: 417, column: 80, scope: !2302)
!2309 = !DILocation(line: 417, column: 78, scope: !2302)
!2310 = !DILocation(line: 418, column: 7, scope: !2311)
!2311 = distinct !DILexicalBlock(scope: !2312, file: !2, line: 418, column: 7)
!2312 = distinct !DILexicalBlock(scope: !2302, file: !2, line: 417, column: 91)
!2313 = !DILocalVariable(name: "gb_str", scope: !2314, file: !2, line: 419, type: !2315)
!2314 = distinct !DILexicalBlock(scope: !2311, file: !2, line: 418, column: 31)
!2315 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 128, elements: !160)
!2316 = !DILocation(line: 419, column: 9, scope: !2314)
!2317 = !DILocalVariable(name: "new_format", scope: !2314, file: !2, line: 419, type: !554)
!2318 = !DILocation(line: 419, column: 21, scope: !2314)
!2319 = !DILocalVariable(name: "args", scope: !2314, file: !2, line: 420, type: !1656)
!2320 = !DILocation(line: 420, column: 12, scope: !2314)
!2321 = !DILocalVariable(name: "t", scope: !2314, file: !2, line: 421, type: !77)
!2322 = !DILocation(line: 421, column: 8, scope: !2314)
!2323 = !DILocation(line: 423, column: 4, scope: !2314)
!2324 = !DILocation(line: 424, column: 13, scope: !2314)
!2325 = !DILocation(line: 424, column: 25, scope: !2314)
!2326 = !DILocation(line: 424, column: 33, scope: !2314)
!2327 = !DILocation(line: 424, column: 4, scope: !2314)
!2328 = !DILocation(line: 425, column: 4, scope: !2314)
!2329 = !DILocation(line: 427, column: 4, scope: !2314)
!2330 = !DILocation(line: 427, column: 14, scope: !2314)
!2331 = !DILocation(line: 428, column: 16, scope: !2314)
!2332 = !DILocation(line: 428, column: 4, scope: !2314)
!2333 = !DILocation(line: 428, column: 14, scope: !2314)
!2334 = !DILocation(line: 429, column: 12, scope: !2314)
!2335 = !DILocation(line: 429, column: 4, scope: !2314)
!2336 = !DILocation(line: 430, column: 15, scope: !2314)
!2337 = !DILocation(line: 430, column: 8, scope: !2314)
!2338 = !DILocation(line: 430, column: 6, scope: !2314)
!2339 = !DILocation(line: 431, column: 11, scope: !2314)
!2340 = !DILocation(line: 431, column: 4, scope: !2314)
!2341 = !DILocation(line: 431, column: 14, scope: !2314)
!2342 = !DILocation(line: 432, column: 11, scope: !2314)
!2343 = !DILocation(line: 432, column: 12, scope: !2314)
!2344 = !DILocation(line: 432, column: 4, scope: !2314)
!2345 = !DILocation(line: 432, column: 16, scope: !2314)
!2346 = !DILocation(line: 433, column: 18, scope: !2314)
!2347 = !DILocation(line: 433, column: 11, scope: !2314)
!2348 = !DILocation(line: 433, column: 12, scope: !2314)
!2349 = !DILocation(line: 433, column: 4, scope: !2314)
!2350 = !DILocation(line: 433, column: 16, scope: !2314)
!2351 = !DILocation(line: 434, column: 11, scope: !2314)
!2352 = !DILocation(line: 434, column: 12, scope: !2314)
!2353 = !DILocation(line: 434, column: 4, scope: !2314)
!2354 = !DILocation(line: 434, column: 16, scope: !2314)
!2355 = !DILocation(line: 436, column: 30, scope: !2314)
!2356 = !DILocation(line: 436, column: 38, scope: !2314)
!2357 = !DILocation(line: 436, column: 4, scope: !2314)
!2358 = !DILocation(line: 438, column: 30, scope: !2314)
!2359 = !DILocation(line: 438, column: 28, scope: !2314)
!2360 = !DILocation(line: 439, column: 3, scope: !2314)
!2361 = !DILocation(line: 440, column: 2, scope: !2312)
!2362 = !DILocation(line: 442, column: 1, scope: !2289)
!2363 = distinct !DISubprogram(name: "thief_message", linkageName: "_Z13thief_messagePKcz", scope: !2, file: !2, line: 445, type: !2290, scopeLine: 446, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !72, retainedNodes: !1669)
!2364 = !DILocalVariable(name: "format", arg: 1, scope: !2363, file: !2, line: 445, type: !531)
!2365 = !DILocation(line: 445, column: 33, scope: !2363)
!2366 = !DILocalVariable(name: "gb_str", scope: !2363, file: !2, line: 448, type: !2315)
!2367 = !DILocation(line: 448, column: 7, scope: !2363)
!2368 = !DILocalVariable(name: "new_format", scope: !2363, file: !2, line: 448, type: !554)
!2369 = !DILocation(line: 448, column: 19, scope: !2363)
!2370 = !DILocalVariable(name: "args", scope: !2363, file: !2, line: 449, type: !1656)
!2371 = !DILocation(line: 449, column: 10, scope: !2363)
!2372 = !DILocation(line: 451, column: 2, scope: !2363)
!2373 = !DILocation(line: 452, column: 11, scope: !2363)
!2374 = !DILocation(line: 452, column: 23, scope: !2363)
!2375 = !DILocation(line: 452, column: 31, scope: !2363)
!2376 = !DILocation(line: 452, column: 2, scope: !2363)
!2377 = !DILocation(line: 453, column: 2, scope: !2363)
!2378 = !DILocation(line: 455, column: 2, scope: !2363)
!2379 = !DILocation(line: 455, column: 12, scope: !2363)
!2380 = !DILocation(line: 456, column: 14, scope: !2363)
!2381 = !DILocation(line: 456, column: 2, scope: !2363)
!2382 = !DILocation(line: 456, column: 12, scope: !2363)
!2383 = !DILocation(line: 457, column: 10, scope: !2363)
!2384 = !DILocation(line: 457, column: 2, scope: !2363)
!2385 = !DILocation(line: 458, column: 2, scope: !2363)
!2386 = !DILocation(line: 458, column: 12, scope: !2363)
!2387 = !DILocation(line: 459, column: 14, scope: !2363)
!2388 = !DILocation(line: 459, column: 2, scope: !2363)
!2389 = !DILocation(line: 459, column: 12, scope: !2363)
!2390 = !DILocation(line: 460, column: 2, scope: !2363)
!2391 = !DILocation(line: 460, column: 13, scope: !2363)
!2392 = !DILocation(line: 462, column: 28, scope: !2363)
!2393 = !DILocation(line: 462, column: 36, scope: !2363)
!2394 = !DILocation(line: 462, column: 2, scope: !2363)
!2395 = !DILocation(line: 464, column: 1, scope: !2363)
!2396 = distinct !DISubprogram(name: "marker_exists_in_mine", linkageName: "_Z21marker_exists_in_minei", scope: !2, file: !2, line: 468, type: !451, scopeLine: 469, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !72, retainedNodes: !1669)
!2397 = !DILocalVariable(name: "id", arg: 1, scope: !2396, file: !2, line: 468, type: !77)
!2398 = !DILocation(line: 468, column: 31, scope: !2396)
!2399 = !DILocalVariable(name: "i", scope: !2396, file: !2, line: 470, type: !77)
!2400 = !DILocation(line: 470, column: 6, scope: !2396)
!2401 = !DILocation(line: 472, column: 8, scope: !2402)
!2402 = distinct !DILexicalBlock(scope: !2396, file: !2, line: 472, column: 2)
!2403 = !DILocation(line: 472, column: 7, scope: !2402)
!2404 = !DILocation(line: 472, column: 12, scope: !2405)
!2405 = distinct !DILexicalBlock(scope: !2402, file: !2, line: 472, column: 2)
!2406 = !DILocation(line: 472, column: 15, scope: !2405)
!2407 = !DILocation(line: 472, column: 13, scope: !2405)
!2408 = !DILocation(line: 472, column: 2, scope: !2402)
!2409 = !DILocation(line: 473, column: 15, scope: !2410)
!2410 = distinct !DILexicalBlock(scope: !2405, file: !2, line: 473, column: 7)
!2411 = !DILocation(line: 473, column: 7, scope: !2410)
!2412 = !DILocation(line: 473, column: 18, scope: !2410)
!2413 = !DILocation(line: 473, column: 23, scope: !2410)
!2414 = !DILocation(line: 474, column: 16, scope: !2415)
!2415 = distinct !DILexicalBlock(scope: !2410, file: !2, line: 474, column: 8)
!2416 = !DILocation(line: 474, column: 8, scope: !2415)
!2417 = !DILocation(line: 474, column: 19, scope: !2415)
!2418 = !DILocation(line: 474, column: 25, scope: !2415)
!2419 = !DILocation(line: 474, column: 22, scope: !2415)
!2420 = !DILocation(line: 475, column: 5, scope: !2415)
!2421 = !DILocation(line: 473, column: 26, scope: !2410)
!2422 = !DILocation(line: 472, column: 38, scope: !2405)
!2423 = !DILocation(line: 472, column: 2, scope: !2405)
!2424 = distinct !{!2424, !2408, !2425, !1697}
!2425 = !DILocation(line: 475, column: 12, scope: !2402)
!2426 = !DILocation(line: 477, column: 2, scope: !2396)
!2427 = !DILocation(line: 478, column: 1, scope: !2396)
!2428 = distinct !DISubprogram(name: "set_escort_special_goal", linkageName: "_Z23set_escort_special_goali", scope: !2, file: !2, line: 483, type: !955, scopeLine: 484, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !72, retainedNodes: !1669)
!2429 = !DILocalVariable(name: "special_key", arg: 1, scope: !2428, file: !2, line: 483, type: !77)
!2430 = !DILocation(line: 483, column: 34, scope: !2428)
!2431 = !DILocalVariable(name: "marker_key", scope: !2428, file: !2, line: 485, type: !77)
!2432 = !DILocation(line: 485, column: 6, scope: !2428)
!2433 = !DILocation(line: 487, column: 28, scope: !2428)
!2434 = !DILocation(line: 489, column: 7, scope: !2435)
!2435 = distinct !DILexicalBlock(scope: !2428, file: !2, line: 489, column: 6)
!2436 = !DILocation(line: 489, column: 6, scope: !2435)
!2437 = !DILocation(line: 490, column: 3, scope: !2438)
!2438 = distinct !DILexicalBlock(scope: !2435, file: !2, line: 489, column: 30)
!2439 = !DILocation(line: 491, column: 8, scope: !2440)
!2440 = distinct !DILexicalBlock(scope: !2438, file: !2, line: 491, column: 7)
!2441 = !DILocation(line: 491, column: 7, scope: !2440)
!2442 = !DILocalVariable(name: "i", scope: !2443, file: !2, line: 492, type: !77)
!2443 = distinct !DILexicalBlock(scope: !2440, file: !2, line: 491, column: 31)
!2444 = !DILocation(line: 492, column: 8, scope: !2443)
!2445 = !DILocation(line: 494, column: 10, scope: !2446)
!2446 = distinct !DILexicalBlock(scope: !2443, file: !2, line: 494, column: 4)
!2447 = !DILocation(line: 494, column: 9, scope: !2446)
!2448 = !DILocation(line: 494, column: 14, scope: !2449)
!2449 = distinct !DILexicalBlock(scope: !2446, file: !2, line: 494, column: 4)
!2450 = !DILocation(line: 494, column: 17, scope: !2449)
!2451 = !DILocation(line: 494, column: 15, scope: !2449)
!2452 = !DILocation(line: 494, column: 4, scope: !2446)
!2453 = !DILocation(line: 495, column: 18, scope: !2454)
!2454 = distinct !DILexicalBlock(scope: !2449, file: !2, line: 495, column: 9)
!2455 = !DILocation(line: 495, column: 10, scope: !2454)
!2456 = !DILocation(line: 495, column: 21, scope: !2454)
!2457 = !DILocation(line: 495, column: 26, scope: !2454)
!2458 = !DILocation(line: 495, column: 40, scope: !2454)
!2459 = !DILocation(line: 495, column: 62, scope: !2454)
!2460 = !DILocation(line: 495, column: 54, scope: !2454)
!2461 = !DILocation(line: 495, column: 65, scope: !2454)
!2462 = !DILocation(line: 495, column: 43, scope: !2454)
!2463 = !DILocation(line: 495, column: 69, scope: !2454)
!2464 = !DILocation(line: 496, column: 6, scope: !2465)
!2465 = distinct !DILexicalBlock(scope: !2454, file: !2, line: 495, column: 80)
!2466 = !DILocation(line: 497, column: 6, scope: !2465)
!2467 = !DILocation(line: 494, column: 40, scope: !2449)
!2468 = !DILocation(line: 494, column: 4, scope: !2449)
!2469 = distinct !{!2469, !2452, !2470, !1697}
!2470 = !DILocation(line: 498, column: 5, scope: !2446)
!2471 = !DILocation(line: 499, column: 8, scope: !2472)
!2472 = distinct !DILexicalBlock(scope: !2443, file: !2, line: 499, column: 8)
!2473 = !DILocation(line: 499, column: 13, scope: !2472)
!2474 = !DILocation(line: 499, column: 33, scope: !2472)
!2475 = !DILocation(line: 499, column: 10, scope: !2472)
!2476 = !DILocation(line: 500, column: 5, scope: !2472)
!2477 = !DILocation(line: 502, column: 4, scope: !2443)
!2478 = !DILocation(line: 504, column: 2, scope: !2438)
!2479 = !DILocation(line: 506, column: 16, scope: !2428)
!2480 = !DILocation(line: 506, column: 28, scope: !2428)
!2481 = !DILocation(line: 506, column: 14, scope: !2428)
!2482 = !DILocation(line: 508, column: 15, scope: !2428)
!2483 = !DILocation(line: 508, column: 13, scope: !2428)
!2484 = !DILocation(line: 533, column: 6, scope: !2485)
!2485 = distinct !DILexicalBlock(scope: !2428, file: !2, line: 533, column: 6)
!2486 = !DILocation(line: 533, column: 24, scope: !2485)
!2487 = !DILocation(line: 533, column: 21, scope: !2485)
!2488 = !DILocation(line: 534, column: 8, scope: !2489)
!2489 = distinct !DILexicalBlock(scope: !2485, file: !2, line: 534, column: 7)
!2490 = !DILocation(line: 534, column: 27, scope: !2489)
!2491 = !DILocation(line: 534, column: 34, scope: !2489)
!2492 = !DILocation(line: 534, column: 38, scope: !2489)
!2493 = !DILocation(line: 534, column: 50, scope: !2489)
!2494 = !DILocation(line: 535, column: 30, scope: !2495)
!2495 = distinct !DILexicalBlock(scope: !2496, file: !2, line: 535, column: 8)
!2496 = distinct !DILexicalBlock(scope: !2489, file: !2, line: 534, column: 61)
!2497 = !DILocation(line: 535, column: 41, scope: !2495)
!2498 = !DILocation(line: 535, column: 8, scope: !2495)
!2499 = !DILocation(line: 536, column: 26, scope: !2495)
!2500 = !DILocation(line: 536, column: 37, scope: !2495)
!2501 = !DILocation(line: 536, column: 24, scope: !2495)
!2502 = !DILocation(line: 536, column: 5, scope: !2495)
!2503 = !DILocation(line: 538, column: 29, scope: !2504)
!2504 = distinct !DILexicalBlock(scope: !2495, file: !2, line: 537, column: 9)
!2505 = !DILocation(line: 539, column: 44, scope: !2504)
!2506 = !DILocation(line: 539, column: 55, scope: !2504)
!2507 = !DILocation(line: 539, column: 63, scope: !2504)
!2508 = !DILocation(line: 539, column: 5, scope: !2504)
!2509 = !DILocation(line: 540, column: 24, scope: !2504)
!2510 = !DILocation(line: 542, column: 3, scope: !2496)
!2511 = !DILocation(line: 543, column: 23, scope: !2489)
!2512 = !DILocation(line: 534, column: 58, scope: !2489)
!2513 = !DILocation(line: 545, column: 19, scope: !2428)
!2514 = !DILocation(line: 545, column: 17, scope: !2428)
!2515 = !DILocation(line: 547, column: 6, scope: !2516)
!2516 = distinct !DILexicalBlock(scope: !2428, file: !2, line: 547, column: 6)
!2517 = !DILocation(line: 547, column: 18, scope: !2516)
!2518 = !DILocation(line: 548, column: 22, scope: !2516)
!2519 = !DILocation(line: 548, column: 3, scope: !2516)
!2520 = !DILocation(line: 550, column: 7, scope: !2521)
!2521 = distinct !DILexicalBlock(scope: !2428, file: !2, line: 550, column: 7)
!2522 = !DILocation(line: 550, column: 26, scope: !2521)
!2523 = !DILocation(line: 551, column: 47, scope: !2524)
!2524 = distinct !DILexicalBlock(scope: !2521, file: !2, line: 550, column: 34)
!2525 = !DILocation(line: 551, column: 45, scope: !2524)
!2526 = !DILocation(line: 551, column: 58, scope: !2524)
!2527 = !DILocation(line: 551, column: 23, scope: !2524)
!2528 = !DILocation(line: 552, column: 2, scope: !2524)
!2529 = !DILocation(line: 553, column: 11, scope: !2530)
!2530 = distinct !DILexicalBlock(scope: !2521, file: !2, line: 552, column: 9)
!2531 = !DILocation(line: 553, column: 3, scope: !2530)
!2532 = !DILocation(line: 554, column: 36, scope: !2533)
!2533 = distinct !DILexicalBlock(scope: !2530, file: !2, line: 553, column: 24)
!2534 = !DILocation(line: 554, column: 60, scope: !2533)
!2535 = !DILocation(line: 555, column: 36, scope: !2533)
!2536 = !DILocation(line: 555, column: 62, scope: !2533)
!2537 = !DILocation(line: 556, column: 36, scope: !2533)
!2538 = !DILocation(line: 556, column: 60, scope: !2533)
!2539 = !DILocation(line: 557, column: 36, scope: !2533)
!2540 = !DILocation(line: 557, column: 60, scope: !2533)
!2541 = !DILocation(line: 558, column: 36, scope: !2533)
!2542 = !DILocation(line: 558, column: 59, scope: !2533)
!2543 = !DILocation(line: 559, column: 36, scope: !2533)
!2544 = !DILocation(line: 559, column: 60, scope: !2533)
!2545 = !DILocation(line: 560, column: 36, scope: !2533)
!2546 = !DILocation(line: 560, column: 59, scope: !2533)
!2547 = !DILocation(line: 561, column: 36, scope: !2533)
!2548 = !DILocation(line: 561, column: 63, scope: !2533)
!2549 = !DILocation(line: 562, column: 36, scope: !2533)
!2550 = !DILocation(line: 562, column: 58, scope: !2533)
!2551 = !DILocation(line: 563, column: 36, scope: !2533)
!2552 = !DILocation(line: 563, column: 49, scope: !2533)
!2553 = !DILocation(line: 565, column: 5, scope: !2533)
!2554 = !DILocation(line: 566, column: 3, scope: !2533)
!2555 = !DILocation(line: 569, column: 28, scope: !2428)
!2556 = !DILocation(line: 569, column: 37, scope: !2428)
!2557 = !DILocation(line: 569, column: 26, scope: !2428)
!2558 = !DILocation(line: 571, column: 18, scope: !2428)
!2559 = !DILocation(line: 571, column: 2, scope: !2428)
!2560 = !DILocation(line: 574, column: 21, scope: !2428)
!2561 = !DILocation(line: 575, column: 1, scope: !2428)
!2562 = distinct !DISubprogram(name: "say_escort_goal", linkageName: "_Z15say_escort_goali", scope: !2, file: !2, line: 740, type: !955, scopeLine: 741, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !72, retainedNodes: !1669)
!2563 = !DILocalVariable(name: "goal_num", arg: 1, scope: !2562, file: !2, line: 740, type: !77)
!2564 = !DILocation(line: 740, column: 26, scope: !2562)
!2565 = !DILocation(line: 742, column: 6, scope: !2566)
!2566 = distinct !DILexicalBlock(scope: !2562, file: !2, line: 742, column: 6)
!2567 = !DILocation(line: 743, column: 3, scope: !2566)
!2568 = !DILocation(line: 745, column: 10, scope: !2562)
!2569 = !DILocation(line: 745, column: 2, scope: !2562)
!2570 = !DILocation(line: 746, column: 31, scope: !2571)
!2571 = distinct !DILexicalBlock(scope: !2562, file: !2, line: 745, column: 20)
!2572 = !DILocation(line: 746, column: 68, scope: !2571)
!2573 = !DILocation(line: 747, column: 31, scope: !2571)
!2574 = !DILocation(line: 747, column: 69, scope: !2571)
!2575 = !DILocation(line: 748, column: 30, scope: !2571)
!2576 = !DILocation(line: 748, column: 66, scope: !2571)
!2577 = !DILocation(line: 749, column: 32, scope: !2571)
!2578 = !DILocation(line: 749, column: 68, scope: !2571)
!2579 = !DILocation(line: 750, column: 28, scope: !2571)
!2580 = !DILocation(line: 750, column: 62, scope: !2571)
!2581 = !DILocation(line: 751, column: 29, scope: !2571)
!2582 = !DILocation(line: 751, column: 65, scope: !2571)
!2583 = !DILocation(line: 752, column: 31, scope: !2571)
!2584 = !DILocation(line: 752, column: 71, scope: !2571)
!2585 = !DILocation(line: 753, column: 29, scope: !2571)
!2586 = !DILocation(line: 753, column: 66, scope: !2571)
!2587 = !DILocation(line: 754, column: 30, scope: !2571)
!2588 = !DILocation(line: 754, column: 68, scope: !2571)
!2589 = !DILocation(line: 755, column: 29, scope: !2571)
!2590 = !DILocation(line: 755, column: 65, scope: !2571)
!2591 = !DILocation(line: 756, column: 30, scope: !2571)
!2592 = !DILocation(line: 756, column: 68, scope: !2571)
!2593 = !DILocation(line: 757, column: 29, scope: !2571)
!2594 = !DILocation(line: 757, column: 65, scope: !2571)
!2595 = !DILocation(line: 758, column: 28, scope: !2571)
!2596 = !DILocation(line: 758, column: 66, scope: !2571)
!2597 = !DILocation(line: 759, column: 33, scope: !2571)
!2598 = !DILocation(line: 759, column: 73, scope: !2571)
!2599 = !DILocalVariable(name: "marker_text", scope: !2600, file: !2, line: 769, type: !2601)
!2600 = distinct !DILexicalBlock(scope: !2571, file: !2, line: 769, column: 4)
!2601 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 200, elements: !328)
!2602 = !DILocation(line: 769, column: 11, scope: !2600)
!2603 = !DILocation(line: 770, column: 12, scope: !2600)
!2604 = !DILocation(line: 770, column: 39, scope: !2600)
!2605 = !DILocation(line: 770, column: 47, scope: !2600)
!2606 = !DILocation(line: 770, column: 25, scope: !2600)
!2607 = !DILocation(line: 770, column: 4, scope: !2600)
!2608 = !DILocation(line: 771, column: 4, scope: !2600)
!2609 = !DILocation(line: 771, column: 41, scope: !2600)
!2610 = !DILocation(line: 772, column: 45, scope: !2600)
!2611 = !DILocation(line: 772, column: 53, scope: !2600)
!2612 = !DILocation(line: 772, column: 73, scope: !2600)
!2613 = !DILocation(line: 772, column: 77, scope: !2600)
!2614 = !DILocation(line: 772, column: 4, scope: !2600)
!2615 = !DILocation(line: 773, column: 4, scope: !2600)
!2616 = !DILocation(line: 776, column: 1, scope: !2562)
!2617 = distinct !DISubprogram(name: "get_boss_id", linkageName: "_Z11get_boss_idv", scope: !2, file: !2, line: 613, type: !920, scopeLine: 614, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !72, retainedNodes: !1669)
!2618 = !DILocalVariable(name: "i", scope: !2617, file: !2, line: 615, type: !77)
!2619 = !DILocation(line: 615, column: 6, scope: !2617)
!2620 = !DILocation(line: 617, column: 8, scope: !2621)
!2621 = distinct !DILexicalBlock(scope: !2617, file: !2, line: 617, column: 2)
!2622 = !DILocation(line: 617, column: 7, scope: !2621)
!2623 = !DILocation(line: 617, column: 12, scope: !2624)
!2624 = distinct !DILexicalBlock(scope: !2621, file: !2, line: 617, column: 2)
!2625 = !DILocation(line: 617, column: 15, scope: !2624)
!2626 = !DILocation(line: 617, column: 13, scope: !2624)
!2627 = !DILocation(line: 617, column: 2, scope: !2621)
!2628 = !DILocation(line: 618, column: 15, scope: !2629)
!2629 = distinct !DILexicalBlock(scope: !2624, file: !2, line: 618, column: 7)
!2630 = !DILocation(line: 618, column: 7, scope: !2629)
!2631 = !DILocation(line: 618, column: 18, scope: !2629)
!2632 = !DILocation(line: 618, column: 23, scope: !2629)
!2633 = !DILocation(line: 619, column: 27, scope: !2634)
!2634 = distinct !DILexicalBlock(scope: !2629, file: !2, line: 619, column: 8)
!2635 = !DILocation(line: 619, column: 19, scope: !2634)
!2636 = !DILocation(line: 619, column: 30, scope: !2634)
!2637 = !DILocation(line: 619, column: 8, scope: !2634)
!2638 = !DILocation(line: 619, column: 34, scope: !2634)
!2639 = !DILocation(line: 620, column: 20, scope: !2634)
!2640 = !DILocation(line: 620, column: 12, scope: !2634)
!2641 = !DILocation(line: 620, column: 23, scope: !2634)
!2642 = !DILocation(line: 620, column: 5, scope: !2634)
!2643 = !DILocation(line: 618, column: 26, scope: !2629)
!2644 = !DILocation(line: 617, column: 38, scope: !2624)
!2645 = !DILocation(line: 617, column: 2, scope: !2624)
!2646 = distinct !{!2646, !2627, !2647, !1697}
!2647 = !DILocation(line: 620, column: 23, scope: !2621)
!2648 = !DILocation(line: 622, column: 2, scope: !2617)
!2649 = !DILocation(line: 623, column: 1, scope: !2617)
!2650 = distinct !DISubprogram(name: "exists_in_mine_2", linkageName: "_Z16exists_in_mine_2iiii", scope: !2, file: !2, line: 628, type: !2651, scopeLine: 629, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !72, retainedNodes: !1669)
!2651 = !DISubroutineType(types: !2652)
!2652 = !{!77, !77, !77, !77, !77}
!2653 = !DILocalVariable(name: "segnum", arg: 1, scope: !2650, file: !2, line: 628, type: !77)
!2654 = !DILocation(line: 628, column: 26, scope: !2650)
!2655 = !DILocalVariable(name: "objtype", arg: 2, scope: !2650, file: !2, line: 628, type: !77)
!2656 = !DILocation(line: 628, column: 38, scope: !2650)
!2657 = !DILocalVariable(name: "objid", arg: 3, scope: !2650, file: !2, line: 628, type: !77)
!2658 = !DILocation(line: 628, column: 51, scope: !2650)
!2659 = !DILocalVariable(name: "special", arg: 4, scope: !2650, file: !2, line: 628, type: !77)
!2660 = !DILocation(line: 628, column: 62, scope: !2650)
!2661 = !DILocation(line: 630, column: 15, scope: !2662)
!2662 = distinct !DILexicalBlock(scope: !2650, file: !2, line: 630, column: 6)
!2663 = !DILocation(line: 630, column: 6, scope: !2662)
!2664 = !DILocation(line: 630, column: 23, scope: !2662)
!2665 = !DILocation(line: 630, column: 31, scope: !2662)
!2666 = !DILocalVariable(name: "objnum", scope: !2667, file: !2, line: 631, type: !77)
!2667 = distinct !DILexicalBlock(scope: !2662, file: !2, line: 630, column: 38)
!2668 = !DILocation(line: 631, column: 8, scope: !2667)
!2669 = !DILocation(line: 631, column: 26, scope: !2667)
!2670 = !DILocation(line: 631, column: 17, scope: !2667)
!2671 = !DILocation(line: 631, column: 34, scope: !2667)
!2672 = !DILocation(line: 633, column: 3, scope: !2667)
!2673 = !DILocation(line: 633, column: 10, scope: !2667)
!2674 = !DILocation(line: 633, column: 17, scope: !2667)
!2675 = !DILocalVariable(name: "curobjp", scope: !2676, file: !2, line: 634, type: !2677)
!2676 = distinct !DILexicalBlock(scope: !2667, file: !2, line: 633, column: 24)
!2677 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2678, size: 64)
!2678 = !DIDerivedType(tag: DW_TAG_typedef, name: "object", file: !2679, line: 259, baseType: !2680)
!2679 = !DIFile(filename: "main_d2/object.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "1f2325d356aae4b692933d2aae4f3afd")
!2680 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "object", file: !2679, line: 210, size: 2144, flags: DIFlagTypePassByValue, elements: !2681, identifier: "_ZTS6object")
!2681 = !{!2682, !2683, !2684, !2685, !2686, !2687, !2688, !2689, !2690, !2691, !2692, !2693, !2694, !2701, !2702, !2703, !2704, !2705, !2706, !2707, !2708, !2709, !2727, !2779}
!2682 = !DIDerivedType(tag: DW_TAG_member, name: "signature", scope: !2680, file: !2679, line: 212, baseType: !77, size: 32)
!2683 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !2680, file: !2679, line: 213, baseType: !83, size: 8, offset: 32)
!2684 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !2680, file: !2679, line: 214, baseType: !83, size: 8, offset: 40)
!2685 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !2680, file: !2679, line: 215, baseType: !375, size: 16, offset: 48)
!2686 = !DIDerivedType(tag: DW_TAG_member, name: "prev", scope: !2680, file: !2679, line: 215, baseType: !375, size: 16, offset: 64)
!2687 = !DIDerivedType(tag: DW_TAG_member, name: "control_type", scope: !2680, file: !2679, line: 216, baseType: !83, size: 8, offset: 80)
!2688 = !DIDerivedType(tag: DW_TAG_member, name: "movement_type", scope: !2680, file: !2679, line: 217, baseType: !83, size: 8, offset: 88)
!2689 = !DIDerivedType(tag: DW_TAG_member, name: "render_type", scope: !2680, file: !2679, line: 218, baseType: !83, size: 8, offset: 96)
!2690 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !2680, file: !2679, line: 219, baseType: !83, size: 8, offset: 104)
!2691 = !DIDerivedType(tag: DW_TAG_member, name: "segnum", scope: !2680, file: !2679, line: 220, baseType: !375, size: 16, offset: 112)
!2692 = !DIDerivedType(tag: DW_TAG_member, name: "attached_obj", scope: !2680, file: !2679, line: 221, baseType: !375, size: 16, offset: 128)
!2693 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !2680, file: !2679, line: 222, baseType: !1748, size: 96, offset: 160)
!2694 = !DIDerivedType(tag: DW_TAG_member, name: "orient", scope: !2680, file: !2679, line: 223, baseType: !2695, size: 288, offset: 256)
!2695 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_matrix", file: !1749, line: 47, baseType: !2696)
!2696 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_matrix", file: !1749, line: 44, size: 288, flags: DIFlagTypePassByValue, elements: !2697, identifier: "_ZTS10vms_matrix")
!2697 = !{!2698, !2699, !2700}
!2698 = !DIDerivedType(tag: DW_TAG_member, name: "rvec", scope: !2696, file: !1749, line: 46, baseType: !1748, size: 96)
!2699 = !DIDerivedType(tag: DW_TAG_member, name: "uvec", scope: !2696, file: !1749, line: 46, baseType: !1748, size: 96, offset: 96)
!2700 = !DIDerivedType(tag: DW_TAG_member, name: "fvec", scope: !2696, file: !1749, line: 46, baseType: !1748, size: 96, offset: 192)
!2701 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !2680, file: !2679, line: 224, baseType: !90, size: 32, offset: 544)
!2702 = !DIDerivedType(tag: DW_TAG_member, name: "shields", scope: !2680, file: !2679, line: 225, baseType: !90, size: 32, offset: 576)
!2703 = !DIDerivedType(tag: DW_TAG_member, name: "last_pos", scope: !2680, file: !2679, line: 226, baseType: !1748, size: 96, offset: 608)
!2704 = !DIDerivedType(tag: DW_TAG_member, name: "contains_type", scope: !2680, file: !2679, line: 227, baseType: !368, size: 8, offset: 704)
!2705 = !DIDerivedType(tag: DW_TAG_member, name: "contains_id", scope: !2680, file: !2679, line: 228, baseType: !368, size: 8, offset: 712)
!2706 = !DIDerivedType(tag: DW_TAG_member, name: "contains_count", scope: !2680, file: !2679, line: 229, baseType: !368, size: 8, offset: 720)
!2707 = !DIDerivedType(tag: DW_TAG_member, name: "matcen_creator", scope: !2680, file: !2679, line: 230, baseType: !368, size: 8, offset: 728)
!2708 = !DIDerivedType(tag: DW_TAG_member, name: "lifeleft", scope: !2680, file: !2679, line: 231, baseType: !90, size: 32, offset: 736)
!2709 = !DIDerivedType(tag: DW_TAG_member, name: "mtype", scope: !2680, file: !2679, line: 240, baseType: !2710, size: 512, offset: 768)
!2710 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !2680, file: !2679, line: 236, size: 512, flags: DIFlagTypePassByValue, elements: !2711, identifier: "_ZTSN6objectUt_E")
!2711 = !{!2712, !2726}
!2712 = !DIDerivedType(tag: DW_TAG_member, name: "phys_info", scope: !2710, file: !2679, line: 238, baseType: !2713, size: 512)
!2713 = !DIDerivedType(tag: DW_TAG_typedef, name: "physics_info", file: !2679, line: 153, baseType: !2714)
!2714 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "physics_info", file: !2679, line: 142, size: 512, flags: DIFlagTypePassByValue, elements: !2715, identifier: "_ZTS12physics_info")
!2715 = !{!2716, !2717, !2718, !2719, !2720, !2721, !2722, !2723, !2725}
!2716 = !DIDerivedType(tag: DW_TAG_member, name: "velocity", scope: !2714, file: !2679, line: 144, baseType: !1748, size: 96)
!2717 = !DIDerivedType(tag: DW_TAG_member, name: "thrust", scope: !2714, file: !2679, line: 145, baseType: !1748, size: 96, offset: 96)
!2718 = !DIDerivedType(tag: DW_TAG_member, name: "mass", scope: !2714, file: !2679, line: 146, baseType: !90, size: 32, offset: 192)
!2719 = !DIDerivedType(tag: DW_TAG_member, name: "drag", scope: !2714, file: !2679, line: 147, baseType: !90, size: 32, offset: 224)
!2720 = !DIDerivedType(tag: DW_TAG_member, name: "brakes", scope: !2714, file: !2679, line: 148, baseType: !90, size: 32, offset: 256)
!2721 = !DIDerivedType(tag: DW_TAG_member, name: "rotvel", scope: !2714, file: !2679, line: 149, baseType: !1748, size: 96, offset: 288)
!2722 = !DIDerivedType(tag: DW_TAG_member, name: "rotthrust", scope: !2714, file: !2679, line: 150, baseType: !1748, size: 96, offset: 384)
!2723 = !DIDerivedType(tag: DW_TAG_member, name: "turnroll", scope: !2714, file: !2679, line: 151, baseType: !2724, size: 16, offset: 480)
!2724 = !DIDerivedType(tag: DW_TAG_typedef, name: "fixang", file: !91, line: 21, baseType: !375)
!2725 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !2714, file: !2679, line: 152, baseType: !383, size: 16, offset: 496)
!2726 = !DIDerivedType(tag: DW_TAG_member, name: "spin_rate", scope: !2710, file: !2679, line: 239, baseType: !1748, size: 96)
!2727 = !DIDerivedType(tag: DW_TAG_member, name: "ctype", scope: !2680, file: !2679, line: 250, baseType: !2728, size: 256, offset: 1280)
!2728 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !2680, file: !2679, line: 243, size: 256, flags: DIFlagTypePassByValue, elements: !2729, identifier: "_ZTSN6objectUt0_E")
!2729 = !{!2730, !2741, !2751, !2767, !2772}
!2730 = !DIDerivedType(tag: DW_TAG_member, name: "laser_info", scope: !2728, file: !2679, line: 245, baseType: !2731, size: 160)
!2731 = !DIDerivedType(tag: DW_TAG_typedef, name: "laser_info_t", file: !2679, line: 166, baseType: !2732)
!2732 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "laser_info_s", file: !2679, line: 157, size: 160, flags: DIFlagTypePassByValue, elements: !2733, identifier: "_ZTS12laser_info_s")
!2733 = !{!2734, !2735, !2736, !2737, !2738, !2739, !2740}
!2734 = !DIDerivedType(tag: DW_TAG_member, name: "parent_type", scope: !2732, file: !2679, line: 159, baseType: !375, size: 16)
!2735 = !DIDerivedType(tag: DW_TAG_member, name: "parent_num", scope: !2732, file: !2679, line: 160, baseType: !375, size: 16, offset: 16)
!2736 = !DIDerivedType(tag: DW_TAG_member, name: "parent_signature", scope: !2732, file: !2679, line: 161, baseType: !77, size: 32, offset: 32)
!2737 = !DIDerivedType(tag: DW_TAG_member, name: "creation_time", scope: !2732, file: !2679, line: 162, baseType: !90, size: 32, offset: 64)
!2738 = !DIDerivedType(tag: DW_TAG_member, name: "last_hitobj", scope: !2732, file: !2679, line: 163, baseType: !375, size: 16, offset: 96)
!2739 = !DIDerivedType(tag: DW_TAG_member, name: "track_goal", scope: !2732, file: !2679, line: 164, baseType: !375, size: 16, offset: 112)
!2740 = !DIDerivedType(tag: DW_TAG_member, name: "multiplier", scope: !2732, file: !2679, line: 165, baseType: !90, size: 32, offset: 128)
!2741 = !DIDerivedType(tag: DW_TAG_member, name: "expl_info", scope: !2728, file: !2679, line: 246, baseType: !2742, size: 128)
!2742 = !DIDerivedType(tag: DW_TAG_typedef, name: "explosion_info", file: !2679, line: 176, baseType: !2743)
!2743 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "explosion_info", file: !2679, line: 168, size: 128, flags: DIFlagTypePassByValue, elements: !2744, identifier: "_ZTS14explosion_info")
!2744 = !{!2745, !2746, !2747, !2748, !2749, !2750}
!2745 = !DIDerivedType(tag: DW_TAG_member, name: "spawn_time", scope: !2743, file: !2679, line: 170, baseType: !90, size: 32)
!2746 = !DIDerivedType(tag: DW_TAG_member, name: "delete_time", scope: !2743, file: !2679, line: 171, baseType: !90, size: 32, offset: 32)
!2747 = !DIDerivedType(tag: DW_TAG_member, name: "delete_objnum", scope: !2743, file: !2679, line: 172, baseType: !375, size: 16, offset: 64)
!2748 = !DIDerivedType(tag: DW_TAG_member, name: "attach_parent", scope: !2743, file: !2679, line: 173, baseType: !375, size: 16, offset: 80)
!2749 = !DIDerivedType(tag: DW_TAG_member, name: "prev_attach", scope: !2743, file: !2679, line: 174, baseType: !375, size: 16, offset: 96)
!2750 = !DIDerivedType(tag: DW_TAG_member, name: "next_attach", scope: !2743, file: !2679, line: 175, baseType: !375, size: 16, offset: 112)
!2751 = !DIDerivedType(tag: DW_TAG_member, name: "ai_info", scope: !2728, file: !2679, line: 247, baseType: !2752, size: 256)
!2752 = !DIDerivedType(tag: DW_TAG_typedef, name: "ai_static", file: !2753, line: 144, baseType: !2754)
!2753 = !DIFile(filename: "main_d2/aistruct.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "d122430e792a0ddc0f9eaa08ad217628")
!2754 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ai_static", file: !2753, line: 127, size: 256, flags: DIFlagTypePassByValue, elements: !2755, identifier: "_ZTS9ai_static")
!2755 = !{!2756, !2757, !2759, !2760, !2761, !2762, !2763, !2764, !2765, !2766}
!2756 = !DIDerivedType(tag: DW_TAG_member, name: "behavior", scope: !2754, file: !2753, line: 128, baseType: !83, size: 8)
!2757 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !2754, file: !2753, line: 129, baseType: !2758, size: 88, offset: 8)
!2758 = !DICompositeType(tag: DW_TAG_array_type, baseType: !368, size: 88, elements: !11)
!2759 = !DIDerivedType(tag: DW_TAG_member, name: "hide_segment", scope: !2754, file: !2753, line: 130, baseType: !375, size: 16, offset: 96)
!2760 = !DIDerivedType(tag: DW_TAG_member, name: "hide_index", scope: !2754, file: !2753, line: 131, baseType: !375, size: 16, offset: 112)
!2761 = !DIDerivedType(tag: DW_TAG_member, name: "path_length", scope: !2754, file: !2753, line: 132, baseType: !375, size: 16, offset: 128)
!2762 = !DIDerivedType(tag: DW_TAG_member, name: "cur_path_index", scope: !2754, file: !2753, line: 133, baseType: !368, size: 8, offset: 144)
!2763 = !DIDerivedType(tag: DW_TAG_member, name: "dying_sound_playing", scope: !2754, file: !2753, line: 134, baseType: !368, size: 8, offset: 152)
!2764 = !DIDerivedType(tag: DW_TAG_member, name: "danger_laser_num", scope: !2754, file: !2753, line: 139, baseType: !375, size: 16, offset: 160)
!2765 = !DIDerivedType(tag: DW_TAG_member, name: "danger_laser_signature", scope: !2754, file: !2753, line: 140, baseType: !77, size: 32, offset: 192)
!2766 = !DIDerivedType(tag: DW_TAG_member, name: "dying_start_time", scope: !2754, file: !2753, line: 141, baseType: !90, size: 32, offset: 224)
!2767 = !DIDerivedType(tag: DW_TAG_member, name: "light_info", scope: !2728, file: !2679, line: 248, baseType: !2768, size: 32)
!2768 = !DIDerivedType(tag: DW_TAG_typedef, name: "light_info_t", file: !2679, line: 181, baseType: !2769)
!2769 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "light_info_s", file: !2679, line: 178, size: 32, flags: DIFlagTypePassByValue, elements: !2770, identifier: "_ZTS12light_info_s")
!2770 = !{!2771}
!2771 = !DIDerivedType(tag: DW_TAG_member, name: "intensity", scope: !2769, file: !2679, line: 180, baseType: !90, size: 32)
!2772 = !DIDerivedType(tag: DW_TAG_member, name: "powerup_info", scope: !2728, file: !2679, line: 249, baseType: !2773, size: 96)
!2773 = !DIDerivedType(tag: DW_TAG_typedef, name: "powerup_info_t", file: !2679, line: 190, baseType: !2774)
!2774 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "powerup_info_s", file: !2679, line: 185, size: 96, flags: DIFlagTypePassByValue, elements: !2775, identifier: "_ZTS14powerup_info_s")
!2775 = !{!2776, !2777, !2778}
!2776 = !DIDerivedType(tag: DW_TAG_member, name: "count", scope: !2774, file: !2679, line: 187, baseType: !77, size: 32)
!2777 = !DIDerivedType(tag: DW_TAG_member, name: "creation_time", scope: !2774, file: !2679, line: 188, baseType: !90, size: 32, offset: 32)
!2778 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !2774, file: !2679, line: 189, baseType: !77, size: 32, offset: 64)
!2779 = !DIDerivedType(tag: DW_TAG_member, name: "rtype", scope: !2680, file: !2679, line: 257, baseType: !2780, size: 608, offset: 1536)
!2780 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !2680, file: !2679, line: 253, size: 608, flags: DIFlagTypePassByValue, elements: !2781, identifier: "_ZTSN6objectUt1_E")
!2781 = !{!2782, !2798}
!2782 = !DIDerivedType(tag: DW_TAG_member, name: "pobj_info", scope: !2780, file: !2679, line: 255, baseType: !2783, size: 608)
!2783 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyobj_info", file: !2679, line: 208, baseType: !2784)
!2784 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "polyobj_info", file: !2679, line: 201, size: 608, flags: DIFlagTypePassByValue, elements: !2785, identifier: "_ZTS12polyobj_info")
!2785 = !{!2786, !2787, !2795, !2796, !2797}
!2786 = !DIDerivedType(tag: DW_TAG_member, name: "model_num", scope: !2784, file: !2679, line: 203, baseType: !77, size: 32)
!2787 = !DIDerivedType(tag: DW_TAG_member, name: "anim_angles", scope: !2784, file: !2679, line: 204, baseType: !2788, size: 480, offset: 32)
!2788 = !DICompositeType(tag: DW_TAG_array_type, baseType: !2789, size: 480, elements: !33)
!2789 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_angvec", file: !1749, line: 40, baseType: !2790)
!2790 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_angvec", file: !1749, line: 37, size: 48, flags: DIFlagTypePassByValue, elements: !2791, identifier: "_ZTS10vms_angvec")
!2791 = !{!2792, !2793, !2794}
!2792 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !2790, file: !1749, line: 39, baseType: !2724, size: 16)
!2793 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !2790, file: !1749, line: 39, baseType: !2724, size: 16, offset: 16)
!2794 = !DIDerivedType(tag: DW_TAG_member, name: "h", scope: !2790, file: !1749, line: 39, baseType: !2724, size: 16, offset: 32)
!2795 = !DIDerivedType(tag: DW_TAG_member, name: "subobj_flags", scope: !2784, file: !2679, line: 205, baseType: !77, size: 32, offset: 512)
!2796 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_override", scope: !2784, file: !2679, line: 206, baseType: !77, size: 32, offset: 544)
!2797 = !DIDerivedType(tag: DW_TAG_member, name: "alt_textures", scope: !2784, file: !2679, line: 207, baseType: !77, size: 32, offset: 576)
!2798 = !DIDerivedType(tag: DW_TAG_member, name: "vclip_info", scope: !2780, file: !2679, line: 256, baseType: !2799, size: 96)
!2799 = !DIDerivedType(tag: DW_TAG_typedef, name: "vclip_info_t", file: !2679, line: 197, baseType: !2800)
!2800 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vclip_info_s", file: !2679, line: 192, size: 96, flags: DIFlagTypePassByValue, elements: !2801, identifier: "_ZTS12vclip_info_s")
!2801 = !{!2802, !2803, !2804}
!2802 = !DIDerivedType(tag: DW_TAG_member, name: "vclip_num", scope: !2800, file: !2679, line: 194, baseType: !77, size: 32)
!2803 = !DIDerivedType(tag: DW_TAG_member, name: "frametime", scope: !2800, file: !2679, line: 195, baseType: !90, size: 32, offset: 32)
!2804 = !DIDerivedType(tag: DW_TAG_member, name: "framenum", scope: !2800, file: !2679, line: 196, baseType: !368, size: 8, offset: 64)
!2805 = !DILocation(line: 634, column: 12, scope: !2676)
!2806 = !DILocation(line: 634, column: 31, scope: !2676)
!2807 = !DILocation(line: 634, column: 23, scope: !2676)
!2808 = !DILocation(line: 636, column: 8, scope: !2809)
!2809 = distinct !DILexicalBlock(scope: !2676, file: !2, line: 636, column: 8)
!2810 = !DILocation(line: 636, column: 16, scope: !2809)
!2811 = !DILocation(line: 637, column: 9, scope: !2812)
!2812 = distinct !DILexicalBlock(scope: !2813, file: !2, line: 637, column: 9)
!2813 = distinct !DILexicalBlock(scope: !2809, file: !2, line: 636, column: 44)
!2814 = !DILocation(line: 637, column: 18, scope: !2812)
!2815 = !DILocation(line: 637, column: 24, scope: !2812)
!2816 = !DILocation(line: 638, column: 13, scope: !2812)
!2817 = !DILocation(line: 638, column: 6, scope: !2812)
!2818 = !DILocation(line: 639, column: 4, scope: !2813)
!2819 = !DILocation(line: 641, column: 8, scope: !2820)
!2820 = distinct !DILexicalBlock(scope: !2676, file: !2, line: 641, column: 8)
!2821 = !DILocation(line: 641, column: 17, scope: !2820)
!2822 = !DILocation(line: 641, column: 25, scope: !2820)
!2823 = !DILocation(line: 641, column: 22, scope: !2820)
!2824 = !DILocation(line: 643, column: 10, scope: !2825)
!2825 = distinct !DILexicalBlock(scope: !2826, file: !2, line: 643, column: 9)
!2826 = distinct !DILexicalBlock(scope: !2820, file: !2, line: 641, column: 34)
!2827 = !DILocation(line: 643, column: 19, scope: !2825)
!2828 = !DILocation(line: 643, column: 24, scope: !2825)
!2829 = !DILocation(line: 643, column: 38, scope: !2825)
!2830 = !DILocation(line: 643, column: 53, scope: !2825)
!2831 = !DILocation(line: 643, column: 62, scope: !2825)
!2832 = !DILocation(line: 643, column: 42, scope: !2825)
!2833 = !DILocation(line: 643, column: 66, scope: !2825)
!2834 = !DILocation(line: 643, column: 41, scope: !2825)
!2835 = !DILocation(line: 645, column: 14, scope: !2836)
!2836 = distinct !DILexicalBlock(scope: !2825, file: !2, line: 645, column: 14)
!2837 = !DILocation(line: 645, column: 20, scope: !2836)
!2838 = !DILocation(line: 646, column: 11, scope: !2839)
!2839 = distinct !DILexicalBlock(scope: !2840, file: !2, line: 646, column: 10)
!2840 = distinct !DILexicalBlock(scope: !2836, file: !2, line: 645, column: 27)
!2841 = !DILocation(line: 646, column: 19, scope: !2839)
!2842 = !DILocation(line: 646, column: 35, scope: !2839)
!2843 = !DILocation(line: 646, column: 39, scope: !2839)
!2844 = !DILocation(line: 646, column: 48, scope: !2839)
!2845 = !DILocation(line: 646, column: 51, scope: !2839)
!2846 = !DILocation(line: 646, column: 68, scope: !2839)
!2847 = !DILocation(line: 646, column: 72, scope: !2839)
!2848 = !DILocation(line: 646, column: 81, scope: !2839)
!2849 = !DILocation(line: 646, column: 84, scope: !2839)
!2850 = !DILocation(line: 646, column: 101, scope: !2839)
!2851 = !DILocation(line: 646, column: 105, scope: !2839)
!2852 = !DILocation(line: 646, column: 114, scope: !2839)
!2853 = !DILocation(line: 646, column: 117, scope: !2839)
!2854 = !DILocation(line: 647, column: 14, scope: !2839)
!2855 = !DILocation(line: 647, column: 7, scope: !2839)
!2856 = !DILocation(line: 649, column: 14, scope: !2839)
!2857 = !DILocation(line: 649, column: 7, scope: !2839)
!2858 = !DILocation(line: 650, column: 16, scope: !2859)
!2859 = distinct !DILexicalBlock(scope: !2836, file: !2, line: 650, column: 16)
!2860 = !DILocation(line: 650, column: 25, scope: !2859)
!2861 = !DILocation(line: 650, column: 31, scope: !2859)
!2862 = !DILocation(line: 650, column: 28, scope: !2859)
!2863 = !DILocation(line: 651, column: 13, scope: !2859)
!2864 = !DILocation(line: 651, column: 6, scope: !2859)
!2865 = !DILocation(line: 652, column: 4, scope: !2826)
!2866 = !DILocation(line: 654, column: 8, scope: !2867)
!2867 = distinct !DILexicalBlock(scope: !2676, file: !2, line: 654, column: 8)
!2868 = !DILocation(line: 654, column: 16, scope: !2867)
!2869 = !DILocation(line: 655, column: 9, scope: !2870)
!2870 = distinct !DILexicalBlock(scope: !2867, file: !2, line: 655, column: 9)
!2871 = !DILocation(line: 655, column: 18, scope: !2870)
!2872 = !DILocation(line: 656, column: 10, scope: !2873)
!2873 = distinct !DILexicalBlock(scope: !2870, file: !2, line: 656, column: 10)
!2874 = !DILocation(line: 656, column: 19, scope: !2873)
!2875 = !DILocation(line: 656, column: 33, scope: !2873)
!2876 = !DILocation(line: 657, column: 11, scope: !2877)
!2877 = distinct !DILexicalBlock(scope: !2873, file: !2, line: 657, column: 11)
!2878 = !DILocation(line: 657, column: 20, scope: !2877)
!2879 = !DILocation(line: 657, column: 35, scope: !2877)
!2880 = !DILocation(line: 657, column: 32, scope: !2877)
!2881 = !DILocation(line: 658, column: 15, scope: !2877)
!2882 = !DILocation(line: 658, column: 8, scope: !2877)
!2883 = !DILocation(line: 656, column: 36, scope: !2873)
!2884 = !DILocation(line: 660, column: 13, scope: !2676)
!2885 = !DILocation(line: 660, column: 22, scope: !2676)
!2886 = !DILocation(line: 660, column: 11, scope: !2676)
!2887 = distinct !{!2887, !2672, !2888, !1697}
!2888 = !DILocation(line: 661, column: 3, scope: !2667)
!2889 = !DILocation(line: 662, column: 2, scope: !2667)
!2890 = !DILocation(line: 664, column: 2, scope: !2650)
!2891 = !DILocation(line: 665, column: 1, scope: !2650)
!2892 = distinct !DISubprogram(name: "exists_in_mine", linkageName: "_Z14exists_in_mineiiii", scope: !2, file: !2, line: 672, type: !2651, scopeLine: 673, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !72, retainedNodes: !1669)
!2893 = !DILocalVariable(name: "start_seg", arg: 1, scope: !2892, file: !2, line: 672, type: !77)
!2894 = !DILocation(line: 672, column: 24, scope: !2892)
!2895 = !DILocalVariable(name: "objtype", arg: 2, scope: !2892, file: !2, line: 672, type: !77)
!2896 = !DILocation(line: 672, column: 39, scope: !2892)
!2897 = !DILocalVariable(name: "objid", arg: 3, scope: !2892, file: !2, line: 672, type: !77)
!2898 = !DILocation(line: 672, column: 52, scope: !2892)
!2899 = !DILocalVariable(name: "special", arg: 4, scope: !2892, file: !2, line: 672, type: !77)
!2900 = !DILocation(line: 672, column: 63, scope: !2892)
!2901 = !DILocalVariable(name: "segindex", scope: !2892, file: !2, line: 674, type: !77)
!2902 = !DILocation(line: 674, column: 6, scope: !2892)
!2903 = !DILocalVariable(name: "segnum", scope: !2892, file: !2, line: 674, type: !77)
!2904 = !DILocation(line: 674, column: 16, scope: !2892)
!2905 = !DILocalVariable(name: "bfs_list", scope: !2892, file: !2, line: 675, type: !2906)
!2906 = !DICompositeType(tag: DW_TAG_array_type, baseType: !375, size: 14400, elements: !1805)
!2907 = !DILocation(line: 675, column: 8, scope: !2892)
!2908 = !DILocalVariable(name: "length", scope: !2892, file: !2, line: 676, type: !77)
!2909 = !DILocation(line: 676, column: 6, scope: !2892)
!2910 = !DILocation(line: 680, column: 18, scope: !2892)
!2911 = !DILocation(line: 680, column: 29, scope: !2892)
!2912 = !DILocation(line: 680, column: 2, scope: !2892)
!2913 = !DILocation(line: 682, column: 6, scope: !2914)
!2914 = distinct !DILexicalBlock(scope: !2892, file: !2, line: 682, column: 6)
!2915 = !DILocation(line: 682, column: 14, scope: !2914)
!2916 = !DILocation(line: 683, column: 16, scope: !2917)
!2917 = distinct !DILexicalBlock(scope: !2918, file: !2, line: 683, column: 3)
!2918 = distinct !DILexicalBlock(scope: !2914, file: !2, line: 682, column: 32)
!2919 = !DILocation(line: 683, column: 8, scope: !2917)
!2920 = !DILocation(line: 683, column: 20, scope: !2921)
!2921 = distinct !DILexicalBlock(scope: !2917, file: !2, line: 683, column: 3)
!2922 = !DILocation(line: 683, column: 29, scope: !2921)
!2923 = !DILocation(line: 683, column: 28, scope: !2921)
!2924 = !DILocation(line: 683, column: 3, scope: !2917)
!2925 = !DILocation(line: 684, column: 22, scope: !2926)
!2926 = distinct !DILexicalBlock(scope: !2921, file: !2, line: 683, column: 49)
!2927 = !DILocation(line: 684, column: 13, scope: !2926)
!2928 = !DILocation(line: 684, column: 11, scope: !2926)
!2929 = !DILocation(line: 685, column: 18, scope: !2930)
!2930 = distinct !DILexicalBlock(scope: !2926, file: !2, line: 685, column: 8)
!2931 = !DILocation(line: 685, column: 8, scope: !2930)
!2932 = !DILocation(line: 685, column: 26, scope: !2930)
!2933 = !DILocation(line: 685, column: 34, scope: !2930)
!2934 = !DILocation(line: 686, column: 12, scope: !2930)
!2935 = !DILocation(line: 686, column: 5, scope: !2930)
!2936 = !DILocation(line: 687, column: 3, scope: !2926)
!2937 = !DILocation(line: 683, column: 45, scope: !2921)
!2938 = !DILocation(line: 683, column: 3, scope: !2921)
!2939 = distinct !{!2939, !2924, !2940, !1697}
!2940 = !DILocation(line: 687, column: 3, scope: !2917)
!2941 = !DILocation(line: 688, column: 2, scope: !2918)
!2942 = !DILocation(line: 689, column: 16, scope: !2943)
!2943 = distinct !DILexicalBlock(scope: !2944, file: !2, line: 689, column: 3)
!2944 = distinct !DILexicalBlock(scope: !2914, file: !2, line: 688, column: 9)
!2945 = !DILocation(line: 689, column: 8, scope: !2943)
!2946 = !DILocation(line: 689, column: 20, scope: !2947)
!2947 = distinct !DILexicalBlock(scope: !2943, file: !2, line: 689, column: 3)
!2948 = !DILocation(line: 689, column: 29, scope: !2947)
!2949 = !DILocation(line: 689, column: 28, scope: !2947)
!2950 = !DILocation(line: 689, column: 3, scope: !2943)
!2951 = !DILocalVariable(name: "objnum", scope: !2952, file: !2, line: 690, type: !77)
!2952 = distinct !DILexicalBlock(scope: !2947, file: !2, line: 689, column: 49)
!2953 = !DILocation(line: 690, column: 8, scope: !2952)
!2954 = !DILocation(line: 692, column: 22, scope: !2952)
!2955 = !DILocation(line: 692, column: 13, scope: !2952)
!2956 = !DILocation(line: 692, column: 11, scope: !2952)
!2957 = !DILocation(line: 694, column: 30, scope: !2952)
!2958 = !DILocation(line: 694, column: 38, scope: !2952)
!2959 = !DILocation(line: 694, column: 47, scope: !2952)
!2960 = !DILocation(line: 694, column: 54, scope: !2952)
!2961 = !DILocation(line: 694, column: 13, scope: !2952)
!2962 = !DILocation(line: 694, column: 11, scope: !2952)
!2963 = !DILocation(line: 695, column: 8, scope: !2964)
!2964 = distinct !DILexicalBlock(scope: !2952, file: !2, line: 695, column: 8)
!2965 = !DILocation(line: 695, column: 15, scope: !2964)
!2966 = !DILocation(line: 696, column: 12, scope: !2964)
!2967 = !DILocation(line: 696, column: 5, scope: !2964)
!2968 = !DILocation(line: 698, column: 3, scope: !2952)
!2969 = !DILocation(line: 689, column: 45, scope: !2947)
!2970 = !DILocation(line: 689, column: 3, scope: !2947)
!2971 = distinct !{!2971, !2950, !2972, !1697}
!2972 = !DILocation(line: 698, column: 3, scope: !2943)
!2973 = !DILocation(line: 704, column: 6, scope: !2974)
!2974 = distinct !DILexicalBlock(scope: !2892, file: !2, line: 704, column: 6)
!2975 = !DILocation(line: 704, column: 14, scope: !2974)
!2976 = !DILocation(line: 705, column: 14, scope: !2977)
!2977 = distinct !DILexicalBlock(scope: !2978, file: !2, line: 705, column: 3)
!2978 = distinct !DILexicalBlock(scope: !2974, file: !2, line: 704, column: 32)
!2979 = !DILocation(line: 705, column: 8, scope: !2977)
!2980 = !DILocation(line: 705, column: 18, scope: !2981)
!2981 = distinct !DILexicalBlock(scope: !2977, file: !2, line: 705, column: 3)
!2982 = !DILocation(line: 705, column: 26, scope: !2981)
!2983 = !DILocation(line: 705, column: 24, scope: !2981)
!2984 = !DILocation(line: 705, column: 3, scope: !2977)
!2985 = !DILocation(line: 706, column: 18, scope: !2986)
!2986 = distinct !DILexicalBlock(scope: !2981, file: !2, line: 706, column: 8)
!2987 = !DILocation(line: 706, column: 8, scope: !2986)
!2988 = !DILocation(line: 706, column: 26, scope: !2986)
!2989 = !DILocation(line: 706, column: 34, scope: !2986)
!2990 = !DILocation(line: 707, column: 5, scope: !2986)
!2991 = !DILocation(line: 706, column: 37, scope: !2986)
!2992 = !DILocation(line: 705, column: 55, scope: !2981)
!2993 = !DILocation(line: 705, column: 3, scope: !2981)
!2994 = distinct !{!2994, !2984, !2995, !1697}
!2995 = !DILocation(line: 707, column: 13, scope: !2977)
!2996 = !DILocation(line: 708, column: 2, scope: !2978)
!2997 = !DILocation(line: 709, column: 14, scope: !2998)
!2998 = distinct !DILexicalBlock(scope: !2999, file: !2, line: 709, column: 3)
!2999 = distinct !DILexicalBlock(scope: !2974, file: !2, line: 708, column: 9)
!3000 = !DILocation(line: 709, column: 8, scope: !2998)
!3001 = !DILocation(line: 709, column: 18, scope: !3002)
!3002 = distinct !DILexicalBlock(scope: !2998, file: !2, line: 709, column: 3)
!3003 = !DILocation(line: 709, column: 26, scope: !3002)
!3004 = !DILocation(line: 709, column: 24, scope: !3002)
!3005 = !DILocation(line: 709, column: 3, scope: !2998)
!3006 = !DILocalVariable(name: "objnum", scope: !3007, file: !2, line: 710, type: !77)
!3007 = distinct !DILexicalBlock(scope: !3002, file: !2, line: 709, column: 59)
!3008 = !DILocation(line: 710, column: 8, scope: !3007)
!3009 = !DILocation(line: 712, column: 30, scope: !3007)
!3010 = !DILocation(line: 712, column: 38, scope: !3007)
!3011 = !DILocation(line: 712, column: 47, scope: !3007)
!3012 = !DILocation(line: 712, column: 54, scope: !3007)
!3013 = !DILocation(line: 712, column: 13, scope: !3007)
!3014 = !DILocation(line: 712, column: 11, scope: !3007)
!3015 = !DILocation(line: 713, column: 8, scope: !3016)
!3016 = distinct !DILexicalBlock(scope: !3007, file: !2, line: 713, column: 8)
!3017 = !DILocation(line: 713, column: 15, scope: !3016)
!3018 = !DILocation(line: 714, column: 5, scope: !3016)
!3019 = !DILocation(line: 715, column: 3, scope: !3007)
!3020 = !DILocation(line: 709, column: 55, scope: !3002)
!3021 = !DILocation(line: 709, column: 3, scope: !3002)
!3022 = distinct !{!3022, !3005, !3023, !1697}
!3023 = !DILocation(line: 715, column: 3, scope: !2998)
!3024 = !DILocation(line: 718, column: 2, scope: !2892)
!3025 = !DILocation(line: 719, column: 1, scope: !2892)
!3026 = distinct !DISubprogram(name: "find_exit_segment", linkageName: "_Z17find_exit_segmentv", scope: !2, file: !2, line: 723, type: !920, scopeLine: 724, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !72, retainedNodes: !1669)
!3027 = !DILocalVariable(name: "i", scope: !3026, file: !2, line: 725, type: !77)
!3028 = !DILocation(line: 725, column: 6, scope: !3026)
!3029 = !DILocalVariable(name: "j", scope: !3026, file: !2, line: 725, type: !77)
!3030 = !DILocation(line: 725, column: 8, scope: !3026)
!3031 = !DILocation(line: 728, column: 8, scope: !3032)
!3032 = distinct !DILexicalBlock(scope: !3026, file: !2, line: 728, column: 2)
!3033 = !DILocation(line: 728, column: 7, scope: !3032)
!3034 = !DILocation(line: 728, column: 12, scope: !3035)
!3035 = distinct !DILexicalBlock(scope: !3032, file: !2, line: 728, column: 2)
!3036 = !DILocation(line: 728, column: 15, scope: !3035)
!3037 = !DILocation(line: 728, column: 13, scope: !3035)
!3038 = !DILocation(line: 728, column: 2, scope: !3032)
!3039 = !DILocation(line: 729, column: 9, scope: !3040)
!3040 = distinct !DILexicalBlock(scope: !3035, file: !2, line: 729, column: 3)
!3041 = !DILocation(line: 729, column: 8, scope: !3040)
!3042 = !DILocation(line: 729, column: 13, scope: !3043)
!3043 = distinct !DILexicalBlock(scope: !3040, file: !2, line: 729, column: 3)
!3044 = !DILocation(line: 729, column: 14, scope: !3043)
!3045 = !DILocation(line: 729, column: 3, scope: !3040)
!3046 = !DILocation(line: 730, column: 17, scope: !3047)
!3047 = distinct !DILexicalBlock(scope: !3043, file: !2, line: 730, column: 8)
!3048 = !DILocation(line: 730, column: 8, scope: !3047)
!3049 = !DILocation(line: 730, column: 20, scope: !3047)
!3050 = !DILocation(line: 730, column: 29, scope: !3047)
!3051 = !DILocation(line: 730, column: 32, scope: !3047)
!3052 = !DILocation(line: 731, column: 12, scope: !3053)
!3053 = distinct !DILexicalBlock(scope: !3047, file: !2, line: 730, column: 39)
!3054 = !DILocation(line: 731, column: 5, scope: !3053)
!3055 = !DILocation(line: 730, column: 36, scope: !3047)
!3056 = !DILocation(line: 729, column: 39, scope: !3043)
!3057 = !DILocation(line: 729, column: 3, scope: !3043)
!3058 = distinct !{!3058, !3045, !3059, !1697}
!3059 = !DILocation(line: 732, column: 4, scope: !3040)
!3060 = !DILocation(line: 728, column: 39, scope: !3035)
!3061 = !DILocation(line: 728, column: 2, scope: !3035)
!3062 = distinct !{!3062, !3038, !3063, !1697}
!3063 = !DILocation(line: 732, column: 4, scope: !3032)
!3064 = !DILocation(line: 734, column: 2, scope: !3026)
!3065 = !DILocation(line: 735, column: 1, scope: !3026)
!3066 = distinct !DISubprogram(name: "escort_create_path_to_goal", linkageName: "_Z26escort_create_path_to_goalP6object", scope: !2, file: !2, line: 779, type: !3067, scopeLine: 780, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !72, retainedNodes: !1669)
!3067 = !DISubroutineType(types: !3068)
!3068 = !{null, !2677}
!3069 = !DILocalVariable(name: "objp", arg: 1, scope: !3066, file: !2, line: 779, type: !2677)
!3070 = !DILocation(line: 779, column: 41, scope: !3066)
!3071 = !DILocalVariable(name: "goal_seg", scope: !3066, file: !2, line: 781, type: !77)
!3072 = !DILocation(line: 781, column: 6, scope: !3066)
!3073 = !DILocalVariable(name: "objnum", scope: !3066, file: !2, line: 782, type: !77)
!3074 = !DILocation(line: 782, column: 8, scope: !3066)
!3075 = !DILocation(line: 782, column: 17, scope: !3066)
!3076 = !DILocation(line: 782, column: 21, scope: !3066)
!3077 = !DILocalVariable(name: "aip", scope: !3066, file: !2, line: 783, type: !3078)
!3078 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2752, size: 64)
!3079 = !DILocation(line: 783, column: 13, scope: !3066)
!3080 = !DILocation(line: 783, column: 20, scope: !3066)
!3081 = !DILocation(line: 783, column: 26, scope: !3066)
!3082 = !DILocalVariable(name: "ailp", scope: !3066, file: !2, line: 784, type: !3083)
!3083 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3084, size: 64)
!3084 = !DIDerivedType(tag: DW_TAG_typedef, name: "ai_local", file: !2753, line: 173, baseType: !3085)
!3085 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ai_local", file: !2753, line: 147, size: 1600, flags: DIFlagTypePassByValue, elements: !3086, identifier: "_ZTS8ai_local")
!3086 = !{!3087, !3088, !3089, !3090, !3091, !3092, !3093, !3094, !3095, !3096, !3097, !3098, !3099, !3100, !3101, !3102, !3103, !3104, !3106}
!3087 = !DIDerivedType(tag: DW_TAG_member, name: "player_awareness_type", scope: !3085, file: !2753, line: 151, baseType: !77, size: 32)
!3088 = !DIDerivedType(tag: DW_TAG_member, name: "retry_count", scope: !3085, file: !2753, line: 152, baseType: !77, size: 32, offset: 32)
!3089 = !DIDerivedType(tag: DW_TAG_member, name: "consecutive_retries", scope: !3085, file: !2753, line: 153, baseType: !77, size: 32, offset: 64)
!3090 = !DIDerivedType(tag: DW_TAG_member, name: "mode", scope: !3085, file: !2753, line: 154, baseType: !77, size: 32, offset: 96)
!3091 = !DIDerivedType(tag: DW_TAG_member, name: "previous_visibility", scope: !3085, file: !2753, line: 155, baseType: !77, size: 32, offset: 128)
!3092 = !DIDerivedType(tag: DW_TAG_member, name: "rapidfire_count", scope: !3085, file: !2753, line: 156, baseType: !77, size: 32, offset: 160)
!3093 = !DIDerivedType(tag: DW_TAG_member, name: "goal_segment", scope: !3085, file: !2753, line: 157, baseType: !77, size: 32, offset: 192)
!3094 = !DIDerivedType(tag: DW_TAG_member, name: "next_action_time", scope: !3085, file: !2753, line: 161, baseType: !90, size: 32, offset: 224)
!3095 = !DIDerivedType(tag: DW_TAG_member, name: "next_fire", scope: !3085, file: !2753, line: 162, baseType: !90, size: 32, offset: 256)
!3096 = !DIDerivedType(tag: DW_TAG_member, name: "next_fire2", scope: !3085, file: !2753, line: 163, baseType: !90, size: 32, offset: 288)
!3097 = !DIDerivedType(tag: DW_TAG_member, name: "player_awareness_time", scope: !3085, file: !2753, line: 164, baseType: !90, size: 32, offset: 320)
!3098 = !DIDerivedType(tag: DW_TAG_member, name: "time_player_seen", scope: !3085, file: !2753, line: 165, baseType: !90, size: 32, offset: 352)
!3099 = !DIDerivedType(tag: DW_TAG_member, name: "time_player_sound_attacked", scope: !3085, file: !2753, line: 166, baseType: !90, size: 32, offset: 384)
!3100 = !DIDerivedType(tag: DW_TAG_member, name: "next_misc_sound_time", scope: !3085, file: !2753, line: 167, baseType: !90, size: 32, offset: 416)
!3101 = !DIDerivedType(tag: DW_TAG_member, name: "time_since_processed", scope: !3085, file: !2753, line: 168, baseType: !90, size: 32, offset: 448)
!3102 = !DIDerivedType(tag: DW_TAG_member, name: "goal_angles", scope: !3085, file: !2753, line: 169, baseType: !2788, size: 480, offset: 480)
!3103 = !DIDerivedType(tag: DW_TAG_member, name: "delta_angles", scope: !3085, file: !2753, line: 170, baseType: !2788, size: 480, offset: 960)
!3104 = !DIDerivedType(tag: DW_TAG_member, name: "goal_state", scope: !3085, file: !2753, line: 171, baseType: !3105, size: 80, offset: 1440)
!3105 = !DICompositeType(tag: DW_TAG_array_type, baseType: !368, size: 80, elements: !33)
!3106 = !DIDerivedType(tag: DW_TAG_member, name: "achieved_state", scope: !3085, file: !2753, line: 172, baseType: !3105, size: 80, offset: 1520)
!3107 = !DILocation(line: 784, column: 13, scope: !3066)
!3108 = !DILocation(line: 784, column: 35, scope: !3066)
!3109 = !DILocation(line: 784, column: 21, scope: !3066)
!3110 = !DILocation(line: 786, column: 6, scope: !3111)
!3111 = distinct !DILexicalBlock(scope: !3066, file: !2, line: 786, column: 6)
!3112 = !DILocation(line: 786, column: 26, scope: !3111)
!3113 = !DILocation(line: 787, column: 24, scope: !3111)
!3114 = !DILocation(line: 787, column: 22, scope: !3111)
!3115 = !DILocation(line: 787, column: 3, scope: !3111)
!3116 = !DILocation(line: 789, column: 21, scope: !3066)
!3117 = !DILocation(line: 791, column: 6, scope: !3118)
!3118 = distinct !DILexicalBlock(scope: !3066, file: !2, line: 791, column: 6)
!3119 = !DILocation(line: 791, column: 25, scope: !3118)
!3120 = !DILocation(line: 793, column: 38, scope: !3121)
!3121 = distinct !DILexicalBlock(scope: !3118, file: !2, line: 791, column: 32)
!3122 = !DILocation(line: 793, column: 44, scope: !3121)
!3123 = !DILocation(line: 793, column: 64, scope: !3121)
!3124 = !DILocation(line: 793, column: 82, scope: !3121)
!3125 = !DILocation(line: 793, column: 23, scope: !3121)
!3126 = !DILocation(line: 793, column: 21, scope: !3121)
!3127 = !DILocation(line: 794, column: 7, scope: !3128)
!3128 = distinct !DILexicalBlock(scope: !3121, file: !2, line: 794, column: 7)
!3129 = !DILocation(line: 794, column: 25, scope: !3128)
!3130 = !DILocation(line: 795, column: 23, scope: !3128)
!3131 = !DILocation(line: 795, column: 15, scope: !3128)
!3132 = !DILocation(line: 795, column: 42, scope: !3128)
!3133 = !DILocation(line: 795, column: 13, scope: !3128)
!3134 = !DILocation(line: 795, column: 4, scope: !3128)
!3135 = !DILocation(line: 796, column: 2, scope: !3121)
!3136 = !DILocation(line: 797, column: 11, scope: !3137)
!3137 = distinct !DILexicalBlock(scope: !3118, file: !2, line: 796, column: 9)
!3138 = !DILocation(line: 797, column: 3, scope: !3137)
!3139 = !DILocation(line: 799, column: 40, scope: !3140)
!3140 = distinct !DILexicalBlock(scope: !3137, file: !2, line: 797, column: 31)
!3141 = !DILocation(line: 799, column: 46, scope: !3140)
!3142 = !DILocation(line: 799, column: 25, scope: !3140)
!3143 = !DILocation(line: 799, column: 23, scope: !3140)
!3144 = !DILocation(line: 800, column: 9, scope: !3145)
!3145 = distinct !DILexicalBlock(scope: !3140, file: !2, line: 800, column: 9)
!3146 = !DILocation(line: 800, column: 27, scope: !3145)
!3147 = !DILocation(line: 800, column: 52, scope: !3145)
!3148 = !DILocation(line: 800, column: 44, scope: !3145)
!3149 = !DILocation(line: 800, column: 71, scope: !3145)
!3150 = !DILocation(line: 800, column: 42, scope: !3145)
!3151 = !DILocation(line: 800, column: 33, scope: !3145)
!3152 = !DILocation(line: 801, column: 5, scope: !3140)
!3153 = !DILocation(line: 803, column: 40, scope: !3140)
!3154 = !DILocation(line: 803, column: 46, scope: !3140)
!3155 = !DILocation(line: 803, column: 25, scope: !3140)
!3156 = !DILocation(line: 803, column: 23, scope: !3140)
!3157 = !DILocation(line: 804, column: 9, scope: !3158)
!3158 = distinct !DILexicalBlock(scope: !3140, file: !2, line: 804, column: 9)
!3159 = !DILocation(line: 804, column: 27, scope: !3158)
!3160 = !DILocation(line: 804, column: 52, scope: !3158)
!3161 = !DILocation(line: 804, column: 44, scope: !3158)
!3162 = !DILocation(line: 804, column: 71, scope: !3158)
!3163 = !DILocation(line: 804, column: 42, scope: !3158)
!3164 = !DILocation(line: 804, column: 33, scope: !3158)
!3165 = !DILocation(line: 805, column: 5, scope: !3140)
!3166 = !DILocation(line: 807, column: 40, scope: !3140)
!3167 = !DILocation(line: 807, column: 46, scope: !3140)
!3168 = !DILocation(line: 807, column: 25, scope: !3140)
!3169 = !DILocation(line: 807, column: 23, scope: !3140)
!3170 = !DILocation(line: 808, column: 9, scope: !3171)
!3171 = distinct !DILexicalBlock(scope: !3140, file: !2, line: 808, column: 9)
!3172 = !DILocation(line: 808, column: 27, scope: !3171)
!3173 = !DILocation(line: 808, column: 52, scope: !3171)
!3174 = !DILocation(line: 808, column: 44, scope: !3171)
!3175 = !DILocation(line: 808, column: 71, scope: !3171)
!3176 = !DILocation(line: 808, column: 42, scope: !3171)
!3177 = !DILocation(line: 808, column: 33, scope: !3171)
!3178 = !DILocation(line: 809, column: 5, scope: !3140)
!3179 = !DILocation(line: 811, column: 40, scope: !3140)
!3180 = !DILocation(line: 811, column: 46, scope: !3140)
!3181 = !DILocation(line: 811, column: 25, scope: !3140)
!3182 = !DILocation(line: 811, column: 23, scope: !3140)
!3183 = !DILocation(line: 812, column: 9, scope: !3184)
!3184 = distinct !DILexicalBlock(scope: !3140, file: !2, line: 812, column: 9)
!3185 = !DILocation(line: 812, column: 27, scope: !3184)
!3186 = !DILocation(line: 812, column: 52, scope: !3184)
!3187 = !DILocation(line: 812, column: 44, scope: !3184)
!3188 = !DILocation(line: 812, column: 71, scope: !3184)
!3189 = !DILocation(line: 812, column: 42, scope: !3184)
!3190 = !DILocation(line: 812, column: 33, scope: !3184)
!3191 = !DILocation(line: 813, column: 5, scope: !3140)
!3192 = !DILocation(line: 816, column: 16, scope: !3140)
!3193 = !DILocation(line: 816, column: 14, scope: !3140)
!3194 = !DILocation(line: 817, column: 25, scope: !3140)
!3195 = !DILocation(line: 817, column: 23, scope: !3140)
!3196 = !DILocation(line: 818, column: 5, scope: !3140)
!3197 = !DILocation(line: 820, column: 40, scope: !3140)
!3198 = !DILocation(line: 820, column: 46, scope: !3140)
!3199 = !DILocation(line: 820, column: 25, scope: !3140)
!3200 = !DILocation(line: 820, column: 23, scope: !3140)
!3201 = !DILocation(line: 821, column: 9, scope: !3202)
!3202 = distinct !DILexicalBlock(scope: !3140, file: !2, line: 821, column: 9)
!3203 = !DILocation(line: 821, column: 27, scope: !3202)
!3204 = !DILocation(line: 821, column: 52, scope: !3202)
!3205 = !DILocation(line: 821, column: 44, scope: !3202)
!3206 = !DILocation(line: 821, column: 71, scope: !3202)
!3207 = !DILocation(line: 821, column: 42, scope: !3202)
!3208 = !DILocation(line: 821, column: 33, scope: !3202)
!3209 = !DILocation(line: 822, column: 5, scope: !3140)
!3210 = !DILocation(line: 824, column: 31, scope: !3140)
!3211 = !DILocation(line: 824, column: 37, scope: !3140)
!3212 = !DILocation(line: 824, column: 16, scope: !3140)
!3213 = !DILocation(line: 824, column: 14, scope: !3140)
!3214 = !DILocation(line: 825, column: 25, scope: !3140)
!3215 = !DILocation(line: 825, column: 23, scope: !3140)
!3216 = !DILocation(line: 826, column: 5, scope: !3140)
!3217 = !DILocation(line: 828, column: 40, scope: !3140)
!3218 = !DILocation(line: 828, column: 46, scope: !3140)
!3219 = !DILocation(line: 828, column: 25, scope: !3140)
!3220 = !DILocation(line: 828, column: 23, scope: !3140)
!3221 = !DILocation(line: 829, column: 9, scope: !3222)
!3222 = distinct !DILexicalBlock(scope: !3140, file: !2, line: 829, column: 9)
!3223 = !DILocation(line: 829, column: 27, scope: !3222)
!3224 = !DILocation(line: 829, column: 52, scope: !3222)
!3225 = !DILocation(line: 829, column: 44, scope: !3222)
!3226 = !DILocation(line: 829, column: 71, scope: !3222)
!3227 = !DILocation(line: 829, column: 42, scope: !3222)
!3228 = !DILocation(line: 829, column: 33, scope: !3222)
!3229 = !DILocation(line: 830, column: 5, scope: !3140)
!3230 = !DILocation(line: 832, column: 40, scope: !3140)
!3231 = !DILocation(line: 832, column: 46, scope: !3140)
!3232 = !DILocation(line: 832, column: 25, scope: !3140)
!3233 = !DILocation(line: 832, column: 23, scope: !3140)
!3234 = !DILocation(line: 833, column: 9, scope: !3235)
!3235 = distinct !DILexicalBlock(scope: !3140, file: !2, line: 833, column: 9)
!3236 = !DILocation(line: 833, column: 27, scope: !3235)
!3237 = !DILocation(line: 833, column: 52, scope: !3235)
!3238 = !DILocation(line: 833, column: 44, scope: !3235)
!3239 = !DILocation(line: 833, column: 71, scope: !3235)
!3240 = !DILocation(line: 833, column: 42, scope: !3235)
!3241 = !DILocation(line: 833, column: 33, scope: !3235)
!3242 = !DILocation(line: 834, column: 5, scope: !3140)
!3243 = !DILocation(line: 836, column: 40, scope: !3140)
!3244 = !DILocation(line: 836, column: 46, scope: !3140)
!3245 = !DILocation(line: 836, column: 25, scope: !3140)
!3246 = !DILocation(line: 836, column: 23, scope: !3140)
!3247 = !DILocation(line: 837, column: 9, scope: !3248)
!3248 = distinct !DILexicalBlock(scope: !3140, file: !2, line: 837, column: 9)
!3249 = !DILocation(line: 837, column: 27, scope: !3248)
!3250 = !DILocation(line: 837, column: 52, scope: !3248)
!3251 = !DILocation(line: 837, column: 44, scope: !3248)
!3252 = !DILocation(line: 837, column: 71, scope: !3248)
!3253 = !DILocation(line: 837, column: 42, scope: !3248)
!3254 = !DILocation(line: 837, column: 33, scope: !3248)
!3255 = !DILocation(line: 838, column: 5, scope: !3140)
!3256 = !DILocation(line: 840, column: 40, scope: !3140)
!3257 = !DILocation(line: 840, column: 46, scope: !3140)
!3258 = !DILocation(line: 840, column: 25, scope: !3140)
!3259 = !DILocation(line: 840, column: 23, scope: !3140)
!3260 = !DILocation(line: 841, column: 9, scope: !3261)
!3261 = distinct !DILexicalBlock(scope: !3140, file: !2, line: 841, column: 9)
!3262 = !DILocation(line: 841, column: 27, scope: !3261)
!3263 = !DILocation(line: 841, column: 52, scope: !3261)
!3264 = !DILocation(line: 841, column: 44, scope: !3261)
!3265 = !DILocation(line: 841, column: 71, scope: !3261)
!3266 = !DILocation(line: 841, column: 42, scope: !3261)
!3267 = !DILocation(line: 841, column: 33, scope: !3261)
!3268 = !DILocation(line: 842, column: 5, scope: !3140)
!3269 = !DILocation(line: 844, column: 40, scope: !3140)
!3270 = !DILocation(line: 844, column: 46, scope: !3140)
!3271 = !DILocation(line: 844, column: 25, scope: !3140)
!3272 = !DILocation(line: 844, column: 23, scope: !3140)
!3273 = !DILocation(line: 845, column: 9, scope: !3274)
!3274 = distinct !DILexicalBlock(scope: !3140, file: !2, line: 845, column: 9)
!3275 = !DILocation(line: 845, column: 27, scope: !3274)
!3276 = !DILocation(line: 845, column: 52, scope: !3274)
!3277 = !DILocation(line: 845, column: 44, scope: !3274)
!3278 = !DILocation(line: 845, column: 71, scope: !3274)
!3279 = !DILocation(line: 845, column: 42, scope: !3274)
!3280 = !DILocation(line: 845, column: 33, scope: !3274)
!3281 = !DILocation(line: 846, column: 5, scope: !3140)
!3282 = !DILocation(line: 848, column: 14, scope: !3140)
!3283 = !DILocation(line: 849, column: 25, scope: !3140)
!3284 = !DILocation(line: 849, column: 23, scope: !3140)
!3285 = !DILocation(line: 850, column: 5, scope: !3140)
!3286 = !DILocalVariable(name: "boss_id", scope: !3287, file: !2, line: 852, type: !77)
!3287 = distinct !DILexicalBlock(scope: !3140, file: !2, line: 851, column: 27)
!3288 = !DILocation(line: 852, column: 9, scope: !3287)
!3289 = !DILocation(line: 854, column: 15, scope: !3287)
!3290 = !DILocation(line: 854, column: 13, scope: !3287)
!3291 = !DILocation(line: 855, column: 5, scope: !3287)
!3292 = !DILocation(line: 856, column: 40, scope: !3287)
!3293 = !DILocation(line: 856, column: 46, scope: !3287)
!3294 = !DILocation(line: 856, column: 65, scope: !3287)
!3295 = !DILocation(line: 856, column: 25, scope: !3287)
!3296 = !DILocation(line: 856, column: 23, scope: !3287)
!3297 = !DILocation(line: 857, column: 9, scope: !3298)
!3298 = distinct !DILexicalBlock(scope: !3287, file: !2, line: 857, column: 9)
!3299 = !DILocation(line: 857, column: 27, scope: !3298)
!3300 = !DILocation(line: 857, column: 52, scope: !3298)
!3301 = !DILocation(line: 857, column: 44, scope: !3298)
!3302 = !DILocation(line: 857, column: 71, scope: !3298)
!3303 = !DILocation(line: 857, column: 42, scope: !3298)
!3304 = !DILocation(line: 857, column: 33, scope: !3298)
!3305 = !DILocation(line: 858, column: 5, scope: !3287)
!3306 = !DILocation(line: 861, column: 5, scope: !3140)
!3307 = !DILocation(line: 862, column: 14, scope: !3140)
!3308 = !DILocation(line: 863, column: 5, scope: !3140)
!3309 = !DILocation(line: 868, column: 7, scope: !3310)
!3310 = distinct !DILexicalBlock(scope: !3066, file: !2, line: 868, column: 6)
!3311 = !DILocation(line: 868, column: 25, scope: !3310)
!3312 = !DILocation(line: 868, column: 30, scope: !3310)
!3313 = !DILocation(line: 868, column: 34, scope: !3310)
!3314 = !DILocation(line: 868, column: 52, scope: !3310)
!3315 = !DILocation(line: 869, column: 7, scope: !3316)
!3316 = distinct !DILexicalBlock(scope: !3317, file: !2, line: 869, column: 7)
!3317 = distinct !DILexicalBlock(scope: !3310, file: !2, line: 868, column: 60)
!3318 = !DILocation(line: 869, column: 25, scope: !3316)
!3319 = !DILocation(line: 870, column: 28, scope: !3320)
!3320 = distinct !DILexicalBlock(scope: !3316, file: !2, line: 869, column: 32)
!3321 = !DILocation(line: 871, column: 53, scope: !3320)
!3322 = !DILocation(line: 871, column: 71, scope: !3320)
!3323 = !DILocation(line: 871, column: 36, scope: !3320)
!3324 = !DILocation(line: 871, column: 4, scope: !3320)
!3325 = !DILocation(line: 872, column: 23, scope: !3320)
!3326 = !DILocation(line: 873, column: 3, scope: !3320)
!3327 = !DILocation(line: 873, column: 14, scope: !3328)
!3328 = distinct !DILexicalBlock(scope: !3316, file: !2, line: 873, column: 14)
!3329 = !DILocation(line: 873, column: 32, scope: !3328)
!3330 = !DILocation(line: 874, column: 28, scope: !3331)
!3331 = distinct !DILexicalBlock(scope: !3328, file: !2, line: 873, column: 39)
!3332 = !DILocation(line: 875, column: 54, scope: !3331)
!3333 = !DILocation(line: 875, column: 72, scope: !3331)
!3334 = !DILocation(line: 875, column: 37, scope: !3331)
!3335 = !DILocation(line: 875, column: 4, scope: !3331)
!3336 = !DILocation(line: 876, column: 23, scope: !3331)
!3337 = !DILocation(line: 877, column: 3, scope: !3331)
!3338 = !DILocation(line: 878, column: 4, scope: !3328)
!3339 = !DILocation(line: 880, column: 22, scope: !3317)
!3340 = !DILocation(line: 881, column: 23, scope: !3317)
!3341 = !DILocation(line: 882, column: 2, scope: !3317)
!3342 = !DILocation(line: 883, column: 7, scope: !3343)
!3343 = distinct !DILexicalBlock(scope: !3344, file: !2, line: 883, column: 7)
!3344 = distinct !DILexicalBlock(scope: !3310, file: !2, line: 882, column: 9)
!3345 = !DILocation(line: 883, column: 16, scope: !3343)
!3346 = !DILocation(line: 884, column: 26, scope: !3347)
!3347 = distinct !DILexicalBlock(scope: !3343, file: !2, line: 883, column: 23)
!3348 = !DILocation(line: 884, column: 37, scope: !3347)
!3349 = !DILocation(line: 884, column: 46, scope: !3347)
!3350 = !DILocation(line: 884, column: 35, scope: !3347)
!3351 = !DILocation(line: 884, column: 4, scope: !3347)
!3352 = !DILocation(line: 885, column: 35, scope: !3347)
!3353 = !DILocation(line: 885, column: 53, scope: !3347)
!3354 = !DILocation(line: 885, column: 58, scope: !3347)
!3355 = !DILocation(line: 885, column: 42, scope: !3347)
!3356 = !DILocation(line: 885, column: 71, scope: !3347)
!3357 = !DILocation(line: 885, column: 76, scope: !3347)
!3358 = !DILocation(line: 885, column: 23, scope: !3347)
!3359 = !DILocation(line: 885, column: 4, scope: !3347)
!3360 = !DILocation(line: 885, column: 9, scope: !3347)
!3361 = !DILocation(line: 885, column: 21, scope: !3347)
!3362 = !DILocation(line: 886, column: 3, scope: !3347)
!3363 = !DILocation(line: 887, column: 27, scope: !3364)
!3364 = distinct !DILexicalBlock(scope: !3343, file: !2, line: 886, column: 10)
!3365 = !DILocation(line: 887, column: 33, scope: !3364)
!3366 = !DILocation(line: 887, column: 43, scope: !3364)
!3367 = !DILocation(line: 887, column: 4, scope: !3364)
!3368 = !DILocation(line: 888, column: 8, scope: !3369)
!3369 = distinct !DILexicalBlock(scope: !3364, file: !2, line: 888, column: 8)
!3370 = !DILocation(line: 888, column: 13, scope: !3369)
!3371 = !DILocation(line: 888, column: 25, scope: !3369)
!3372 = !DILocation(line: 889, column: 36, scope: !3369)
!3373 = !DILocation(line: 889, column: 54, scope: !3369)
!3374 = !DILocation(line: 889, column: 59, scope: !3369)
!3375 = !DILocation(line: 889, column: 43, scope: !3369)
!3376 = !DILocation(line: 889, column: 72, scope: !3369)
!3377 = !DILocation(line: 889, column: 77, scope: !3369)
!3378 = !DILocation(line: 889, column: 24, scope: !3369)
!3379 = !DILocation(line: 889, column: 5, scope: !3369)
!3380 = !DILocation(line: 889, column: 10, scope: !3369)
!3381 = !DILocation(line: 889, column: 22, scope: !3369)
!3382 = !DILocation(line: 890, column: 9, scope: !3383)
!3383 = distinct !DILexicalBlock(scope: !3364, file: !2, line: 890, column: 8)
!3384 = !DILocation(line: 890, column: 14, scope: !3383)
!3385 = !DILocation(line: 890, column: 26, scope: !3383)
!3386 = !DILocation(line: 890, column: 31, scope: !3383)
!3387 = !DILocation(line: 890, column: 46, scope: !3383)
!3388 = !DILocation(line: 890, column: 51, scope: !3383)
!3389 = !DILocation(line: 890, column: 64, scope: !3383)
!3390 = !DILocation(line: 890, column: 69, scope: !3383)
!3391 = !DILocation(line: 890, column: 62, scope: !3383)
!3392 = !DILocation(line: 890, column: 81, scope: !3383)
!3393 = !DILocation(line: 890, column: 35, scope: !3383)
!3394 = !DILocation(line: 890, column: 86, scope: !3383)
!3395 = !DILocation(line: 890, column: 96, scope: !3383)
!3396 = !DILocation(line: 890, column: 93, scope: !3383)
!3397 = !DILocalVariable(name: "dist_to_player", scope: !3398, file: !2, line: 891, type: !90)
!3398 = distinct !DILexicalBlock(scope: !3383, file: !2, line: 890, column: 107)
!3399 = !DILocation(line: 891, column: 9, scope: !3398)
!3400 = !DILocation(line: 892, column: 29, scope: !3398)
!3401 = !DILocation(line: 893, column: 55, scope: !3398)
!3402 = !DILocation(line: 893, column: 73, scope: !3398)
!3403 = !DILocation(line: 893, column: 38, scope: !3398)
!3404 = !DILocation(line: 893, column: 5, scope: !3398)
!3405 = !DILocation(line: 894, column: 24, scope: !3398)
!3406 = !DILocation(line: 895, column: 24, scope: !3398)
!3407 = !DILocation(line: 896, column: 47, scope: !3398)
!3408 = !DILocation(line: 896, column: 53, scope: !3398)
!3409 = !DILocation(line: 896, column: 58, scope: !3398)
!3410 = !DILocation(line: 896, column: 64, scope: !3398)
!3411 = !DILocation(line: 896, column: 94, scope: !3398)
!3412 = !DILocation(line: 896, column: 22, scope: !3398)
!3413 = !DILocation(line: 896, column: 20, scope: !3398)
!3414 = !DILocation(line: 897, column: 9, scope: !3415)
!3415 = distinct !DILexicalBlock(scope: !3398, file: !2, line: 897, column: 9)
!3416 = !DILocation(line: 897, column: 24, scope: !3415)
!3417 = !DILocation(line: 898, column: 28, scope: !3415)
!3418 = !DILocation(line: 898, column: 34, scope: !3415)
!3419 = !DILocation(line: 898, column: 6, scope: !3415)
!3420 = !DILocation(line: 900, column: 28, scope: !3421)
!3421 = distinct !DILexicalBlock(scope: !3415, file: !2, line: 899, column: 10)
!3422 = !DILocation(line: 900, column: 38, scope: !3421)
!3423 = !DILocation(line: 900, column: 47, scope: !3421)
!3424 = !DILocation(line: 900, column: 36, scope: !3421)
!3425 = !DILocation(line: 900, column: 6, scope: !3421)
!3426 = !DILocation(line: 901, column: 37, scope: !3421)
!3427 = !DILocation(line: 901, column: 55, scope: !3421)
!3428 = !DILocation(line: 901, column: 60, scope: !3421)
!3429 = !DILocation(line: 901, column: 44, scope: !3421)
!3430 = !DILocation(line: 901, column: 73, scope: !3421)
!3431 = !DILocation(line: 901, column: 78, scope: !3421)
!3432 = !DILocation(line: 901, column: 25, scope: !3421)
!3433 = !DILocation(line: 901, column: 6, scope: !3421)
!3434 = !DILocation(line: 901, column: 11, scope: !3421)
!3435 = !DILocation(line: 901, column: 23, scope: !3421)
!3436 = !DILocation(line: 903, column: 4, scope: !3398)
!3437 = !DILocation(line: 906, column: 3, scope: !3344)
!3438 = !DILocation(line: 906, column: 9, scope: !3344)
!3439 = !DILocation(line: 906, column: 14, scope: !3344)
!3440 = !DILocation(line: 908, column: 19, scope: !3344)
!3441 = !DILocation(line: 908, column: 3, scope: !3344)
!3442 = !DILocation(line: 911, column: 1, scope: !3066)
!3443 = distinct !DISubprogram(name: "escort_set_goal_object", linkageName: "_Z22escort_set_goal_objectv", scope: !2, file: !2, line: 916, type: !920, scopeLine: 917, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !72)
!3444 = !DILocation(line: 918, column: 6, scope: !3445)
!3445 = distinct !DILexicalBlock(scope: !3443, file: !2, line: 918, column: 6)
!3446 = !DILocation(line: 918, column: 26, scope: !3445)
!3447 = !DILocation(line: 919, column: 3, scope: !3445)
!3448 = !DILocation(line: 920, column: 13, scope: !3449)
!3449 = distinct !DILexicalBlock(scope: !3445, file: !2, line: 920, column: 11)
!3450 = !DILocation(line: 920, column: 28, scope: !3449)
!3451 = !DILocation(line: 920, column: 34, scope: !3449)
!3452 = !DILocation(line: 920, column: 12, scope: !3449)
!3453 = !DILocation(line: 920, column: 59, scope: !3449)
!3454 = !DILocation(line: 920, column: 78, scope: !3449)
!3455 = !DILocation(line: 920, column: 93, scope: !3449)
!3456 = !DILocation(line: 920, column: 63, scope: !3449)
!3457 = !DILocation(line: 920, column: 132, scope: !3449)
!3458 = !DILocation(line: 921, column: 3, scope: !3449)
!3459 = !DILocation(line: 922, column: 13, scope: !3460)
!3460 = distinct !DILexicalBlock(scope: !3449, file: !2, line: 922, column: 11)
!3461 = !DILocation(line: 922, column: 28, scope: !3460)
!3462 = !DILocation(line: 922, column: 34, scope: !3460)
!3463 = !DILocation(line: 922, column: 12, scope: !3460)
!3464 = !DILocation(line: 922, column: 59, scope: !3460)
!3465 = !DILocation(line: 922, column: 78, scope: !3460)
!3466 = !DILocation(line: 922, column: 93, scope: !3460)
!3467 = !DILocation(line: 922, column: 63, scope: !3460)
!3468 = !DILocation(line: 922, column: 132, scope: !3460)
!3469 = !DILocation(line: 923, column: 3, scope: !3460)
!3470 = !DILocation(line: 924, column: 13, scope: !3471)
!3471 = distinct !DILexicalBlock(scope: !3460, file: !2, line: 924, column: 11)
!3472 = !DILocation(line: 924, column: 28, scope: !3471)
!3473 = !DILocation(line: 924, column: 34, scope: !3471)
!3474 = !DILocation(line: 924, column: 12, scope: !3471)
!3475 = !DILocation(line: 924, column: 58, scope: !3471)
!3476 = !DILocation(line: 924, column: 77, scope: !3471)
!3477 = !DILocation(line: 924, column: 92, scope: !3471)
!3478 = !DILocation(line: 924, column: 62, scope: !3471)
!3479 = !DILocation(line: 924, column: 130, scope: !3471)
!3480 = !DILocation(line: 925, column: 3, scope: !3471)
!3481 = !DILocation(line: 926, column: 11, scope: !3482)
!3482 = distinct !DILexicalBlock(scope: !3471, file: !2, line: 926, column: 11)
!3483 = !DILocation(line: 926, column: 36, scope: !3482)
!3484 = !DILocation(line: 927, column: 7, scope: !3485)
!3485 = distinct !DILexicalBlock(scope: !3486, file: !2, line: 927, column: 7)
!3486 = distinct !DILexicalBlock(scope: !3482, file: !2, line: 926, column: 42)
!3487 = !DILocation(line: 928, column: 4, scope: !3485)
!3488 = !DILocation(line: 930, column: 4, scope: !3485)
!3489 = !DILocation(line: 932, column: 3, scope: !3482)
!3490 = !DILocation(line: 934, column: 1, scope: !3443)
!3491 = distinct !DISubprogram(name: "time_to_visit_player", linkageName: "_Z20time_to_visit_playerP6objectP8ai_localP9ai_static", scope: !2, file: !2, line: 941, type: !3492, scopeLine: 942, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !72, retainedNodes: !1669)
!3492 = !DISubroutineType(types: !3493)
!3493 = !{!77, !2677, !3083, !3078}
!3494 = !DILocalVariable(name: "objp", arg: 1, scope: !3491, file: !2, line: 941, type: !2677)
!3495 = !DILocation(line: 941, column: 34, scope: !3491)
!3496 = !DILocalVariable(name: "ailp", arg: 2, scope: !3491, file: !2, line: 941, type: !3083)
!3497 = !DILocation(line: 941, column: 50, scope: !3491)
!3498 = !DILocalVariable(name: "aip", arg: 3, scope: !3491, file: !2, line: 941, type: !3078)
!3499 = !DILocation(line: 941, column: 67, scope: !3491)
!3500 = !DILocation(line: 945, column: 6, scope: !3501)
!3501 = distinct !DILexicalBlock(scope: !3491, file: !2, line: 945, column: 6)
!3502 = !DILocation(line: 945, column: 17, scope: !3501)
!3503 = !DILocation(line: 945, column: 15, scope: !3501)
!3504 = !DILocation(line: 945, column: 40, scope: !3501)
!3505 = !DILocation(line: 946, column: 7, scope: !3506)
!3506 = distinct !DILexicalBlock(scope: !3501, file: !2, line: 946, column: 7)
!3507 = !DILocation(line: 946, column: 18, scope: !3506)
!3508 = !DILocation(line: 946, column: 16, scope: !3506)
!3509 = !DILocation(line: 946, column: 49, scope: !3506)
!3510 = !DILocation(line: 947, column: 4, scope: !3506)
!3511 = !DILocation(line: 946, column: 51, scope: !3506)
!3512 = !DILocation(line: 949, column: 6, scope: !3513)
!3513 = distinct !DILexicalBlock(scope: !3491, file: !2, line: 949, column: 6)
!3514 = !DILocation(line: 949, column: 12, scope: !3513)
!3515 = !DILocation(line: 949, column: 17, scope: !3513)
!3516 = !DILocation(line: 950, column: 3, scope: !3513)
!3517 = !DILocation(line: 952, column: 6, scope: !3518)
!3518 = distinct !DILexicalBlock(scope: !3491, file: !2, line: 952, column: 6)
!3519 = !DILocation(line: 952, column: 12, scope: !3518)
!3520 = !DILocation(line: 952, column: 22, scope: !3518)
!3521 = !DILocation(line: 952, column: 37, scope: !3518)
!3522 = !DILocation(line: 952, column: 19, scope: !3518)
!3523 = !DILocation(line: 953, column: 3, scope: !3518)
!3524 = !DILocation(line: 955, column: 6, scope: !3525)
!3525 = distinct !DILexicalBlock(scope: !3491, file: !2, line: 955, column: 6)
!3526 = !DILocation(line: 955, column: 11, scope: !3525)
!3527 = !DILocation(line: 955, column: 28, scope: !3525)
!3528 = !DILocation(line: 955, column: 33, scope: !3525)
!3529 = !DILocation(line: 955, column: 44, scope: !3525)
!3530 = !DILocation(line: 955, column: 26, scope: !3525)
!3531 = !DILocation(line: 956, column: 3, scope: !3525)
!3532 = !DILocation(line: 958, column: 2, scope: !3491)
!3533 = !DILocation(line: 959, column: 1, scope: !3491)
!3534 = distinct !DISubprogram(name: "bash_buddy_weapon_info", linkageName: "_Z22bash_buddy_weapon_infoi", scope: !2, file: !2, line: 968, type: !955, scopeLine: 969, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !72, retainedNodes: !1669)
!3535 = !DILocalVariable(name: "weapon_objnum", arg: 1, scope: !3534, file: !2, line: 968, type: !77)
!3536 = !DILocation(line: 968, column: 33, scope: !3534)
!3537 = !DILocalVariable(name: "objp", scope: !3534, file: !2, line: 970, type: !2677)
!3538 = !DILocation(line: 970, column: 10, scope: !3534)
!3539 = !DILocation(line: 970, column: 26, scope: !3534)
!3540 = !DILocation(line: 970, column: 18, scope: !3534)
!3541 = !DILocation(line: 972, column: 38, scope: !3534)
!3542 = !DILocation(line: 972, column: 51, scope: !3534)
!3543 = !DILocation(line: 972, column: 2, scope: !3534)
!3544 = !DILocation(line: 972, column: 8, scope: !3534)
!3545 = !DILocation(line: 972, column: 25, scope: !3534)
!3546 = !DILocation(line: 972, column: 36, scope: !3534)
!3547 = !DILocation(line: 973, column: 2, scope: !3534)
!3548 = !DILocation(line: 973, column: 8, scope: !3534)
!3549 = !DILocation(line: 973, column: 25, scope: !3534)
!3550 = !DILocation(line: 973, column: 37, scope: !3534)
!3551 = !DILocation(line: 974, column: 44, scope: !3534)
!3552 = !DILocation(line: 974, column: 59, scope: !3534)
!3553 = !DILocation(line: 974, column: 2, scope: !3534)
!3554 = !DILocation(line: 974, column: 8, scope: !3534)
!3555 = !DILocation(line: 974, column: 25, scope: !3534)
!3556 = !DILocation(line: 974, column: 42, scope: !3534)
!3557 = !DILocation(line: 975, column: 1, scope: !3534)
!3558 = distinct !DISubprogram(name: "maybe_buddy_fire_mega", linkageName: "_Z21maybe_buddy_fire_megai", scope: !2, file: !2, line: 978, type: !451, scopeLine: 979, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !72, retainedNodes: !1669)
!3559 = !DILocalVariable(name: "objnum", arg: 1, scope: !3558, file: !2, line: 978, type: !77)
!3560 = !DILocation(line: 978, column: 31, scope: !3558)
!3561 = !DILocalVariable(name: "objp", scope: !3558, file: !2, line: 980, type: !2677)
!3562 = !DILocation(line: 980, column: 10, scope: !3558)
!3563 = !DILocation(line: 980, column: 26, scope: !3558)
!3564 = !DILocation(line: 980, column: 18, scope: !3558)
!3565 = !DILocalVariable(name: "buddy_objp", scope: !3558, file: !2, line: 981, type: !2677)
!3566 = !DILocation(line: 981, column: 10, scope: !3558)
!3567 = !DILocation(line: 981, column: 32, scope: !3558)
!3568 = !DILocation(line: 981, column: 24, scope: !3558)
!3569 = !DILocalVariable(name: "dist", scope: !3558, file: !2, line: 982, type: !90)
!3570 = !DILocation(line: 982, column: 7, scope: !3558)
!3571 = !DILocalVariable(name: "dot", scope: !3558, file: !2, line: 982, type: !90)
!3572 = !DILocation(line: 982, column: 13, scope: !3558)
!3573 = !DILocalVariable(name: "vec_to_robot", scope: !3558, file: !2, line: 983, type: !1748)
!3574 = !DILocation(line: 983, column: 13, scope: !3558)
!3575 = !DILocalVariable(name: "weapon_objnum", scope: !3558, file: !2, line: 984, type: !77)
!3576 = !DILocation(line: 984, column: 7, scope: !3558)
!3577 = !DILocation(line: 986, column: 29, scope: !3558)
!3578 = !DILocation(line: 986, column: 41, scope: !3558)
!3579 = !DILocation(line: 986, column: 47, scope: !3558)
!3580 = !DILocation(line: 986, column: 53, scope: !3558)
!3581 = !DILocation(line: 986, column: 2, scope: !3558)
!3582 = !DILocation(line: 987, column: 9, scope: !3558)
!3583 = !DILocation(line: 987, column: 7, scope: !3558)
!3584 = !DILocation(line: 989, column: 6, scope: !3585)
!3585 = distinct !DILexicalBlock(scope: !3558, file: !2, line: 989, column: 6)
!3586 = !DILocation(line: 989, column: 11, scope: !3585)
!3587 = !DILocation(line: 990, column: 3, scope: !3585)
!3588 = !DILocation(line: 992, column: 8, scope: !3558)
!3589 = !DILocation(line: 992, column: 6, scope: !3558)
!3590 = !DILocation(line: 994, column: 6, scope: !3591)
!3591 = distinct !DILexicalBlock(scope: !3558, file: !2, line: 994, column: 6)
!3592 = !DILocation(line: 994, column: 10, scope: !3591)
!3593 = !DILocation(line: 995, column: 3, scope: !3591)
!3594 = !DILocation(line: 997, column: 35, scope: !3595)
!3595 = distinct !DILexicalBlock(scope: !3558, file: !2, line: 997, column: 6)
!3596 = !DILocation(line: 997, column: 47, scope: !3595)
!3597 = !DILocation(line: 997, column: 7, scope: !3595)
!3598 = !DILocation(line: 997, column: 6, scope: !3595)
!3599 = !DILocation(line: 998, column: 3, scope: !3595)
!3600 = !DILocation(line: 1000, column: 2, scope: !3558)
!3601 = !DILocation(line: 1002, column: 2, scope: !3558)
!3602 = !DILocation(line: 1004, column: 42, scope: !3558)
!3603 = !DILocation(line: 1004, column: 54, scope: !3558)
!3604 = !DILocation(line: 1004, column: 61, scope: !3558)
!3605 = !DILocation(line: 1004, column: 68, scope: !3558)
!3606 = !DILocation(line: 1004, column: 80, scope: !3558)
!3607 = !DILocation(line: 1004, column: 85, scope: !3558)
!3608 = !DILocation(line: 1004, column: 18, scope: !3558)
!3609 = !DILocation(line: 1004, column: 16, scope: !3558)
!3610 = !DILocation(line: 1006, column: 6, scope: !3611)
!3611 = distinct !DILexicalBlock(scope: !3558, file: !2, line: 1006, column: 6)
!3612 = !DILocation(line: 1006, column: 20, scope: !3611)
!3613 = !DILocation(line: 1007, column: 26, scope: !3611)
!3614 = !DILocation(line: 1007, column: 3, scope: !3611)
!3615 = !DILocation(line: 1009, column: 2, scope: !3558)
!3616 = !DILocation(line: 1010, column: 1, scope: !3558)
!3617 = distinct !DISubprogram(name: "maybe_buddy_fire_smart", linkageName: "_Z22maybe_buddy_fire_smarti", scope: !2, file: !2, line: 1013, type: !451, scopeLine: 1014, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !72, retainedNodes: !1669)
!3618 = !DILocalVariable(name: "objnum", arg: 1, scope: !3617, file: !2, line: 1013, type: !77)
!3619 = !DILocation(line: 1013, column: 32, scope: !3617)
!3620 = !DILocalVariable(name: "objp", scope: !3617, file: !2, line: 1015, type: !2677)
!3621 = !DILocation(line: 1015, column: 10, scope: !3617)
!3622 = !DILocation(line: 1015, column: 26, scope: !3617)
!3623 = !DILocation(line: 1015, column: 18, scope: !3617)
!3624 = !DILocalVariable(name: "buddy_objp", scope: !3617, file: !2, line: 1016, type: !2677)
!3625 = !DILocation(line: 1016, column: 10, scope: !3617)
!3626 = !DILocation(line: 1016, column: 32, scope: !3617)
!3627 = !DILocation(line: 1016, column: 24, scope: !3617)
!3628 = !DILocalVariable(name: "dist", scope: !3617, file: !2, line: 1017, type: !90)
!3629 = !DILocation(line: 1017, column: 7, scope: !3617)
!3630 = !DILocalVariable(name: "weapon_objnum", scope: !3617, file: !2, line: 1018, type: !77)
!3631 = !DILocation(line: 1018, column: 7, scope: !3617)
!3632 = !DILocation(line: 1020, column: 28, scope: !3617)
!3633 = !DILocation(line: 1020, column: 40, scope: !3617)
!3634 = !DILocation(line: 1020, column: 46, scope: !3617)
!3635 = !DILocation(line: 1020, column: 52, scope: !3617)
!3636 = !DILocation(line: 1020, column: 9, scope: !3617)
!3637 = !DILocation(line: 1020, column: 7, scope: !3617)
!3638 = !DILocation(line: 1022, column: 6, scope: !3639)
!3639 = distinct !DILexicalBlock(scope: !3617, file: !2, line: 1022, column: 6)
!3640 = !DILocation(line: 1022, column: 11, scope: !3639)
!3641 = !DILocation(line: 1023, column: 3, scope: !3639)
!3642 = !DILocation(line: 1025, column: 35, scope: !3643)
!3643 = distinct !DILexicalBlock(scope: !3617, file: !2, line: 1025, column: 6)
!3644 = !DILocation(line: 1025, column: 47, scope: !3643)
!3645 = !DILocation(line: 1025, column: 7, scope: !3643)
!3646 = !DILocation(line: 1025, column: 6, scope: !3643)
!3647 = !DILocation(line: 1026, column: 3, scope: !3643)
!3648 = !DILocation(line: 1028, column: 2, scope: !3617)
!3649 = !DILocation(line: 1030, column: 2, scope: !3617)
!3650 = !DILocation(line: 1032, column: 42, scope: !3617)
!3651 = !DILocation(line: 1032, column: 54, scope: !3617)
!3652 = !DILocation(line: 1032, column: 61, scope: !3617)
!3653 = !DILocation(line: 1032, column: 68, scope: !3617)
!3654 = !DILocation(line: 1032, column: 80, scope: !3617)
!3655 = !DILocation(line: 1032, column: 85, scope: !3617)
!3656 = !DILocation(line: 1032, column: 18, scope: !3617)
!3657 = !DILocation(line: 1032, column: 16, scope: !3617)
!3658 = !DILocation(line: 1034, column: 6, scope: !3659)
!3659 = distinct !DILexicalBlock(scope: !3617, file: !2, line: 1034, column: 6)
!3660 = !DILocation(line: 1034, column: 20, scope: !3659)
!3661 = !DILocation(line: 1035, column: 26, scope: !3659)
!3662 = !DILocation(line: 1035, column: 3, scope: !3659)
!3663 = !DILocation(line: 1037, column: 2, scope: !3617)
!3664 = !DILocation(line: 1038, column: 1, scope: !3617)
!3665 = distinct !DISubprogram(name: "do_buddy_dude_stuff", linkageName: "_Z19do_buddy_dude_stuffv", scope: !2, file: !2, line: 1041, type: !946, scopeLine: 1042, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !72, retainedNodes: !1669)
!3666 = !DILocalVariable(name: "i", scope: !3665, file: !2, line: 1043, type: !77)
!3667 = !DILocation(line: 1043, column: 6, scope: !3665)
!3668 = !DILocation(line: 1045, column: 7, scope: !3669)
!3669 = distinct !DILexicalBlock(scope: !3665, file: !2, line: 1045, column: 6)
!3670 = !DILocation(line: 1045, column: 6, scope: !3669)
!3671 = !DILocation(line: 1046, column: 3, scope: !3669)
!3672 = !DILocation(line: 1048, column: 6, scope: !3673)
!3673 = distinct !DILexicalBlock(scope: !3665, file: !2, line: 1048, column: 6)
!3674 = !DILocation(line: 1048, column: 32, scope: !3673)
!3675 = !DILocation(line: 1048, column: 30, scope: !3673)
!3676 = !DILocation(line: 1049, column: 27, scope: !3673)
!3677 = !DILocation(line: 1049, column: 3, scope: !3673)
!3678 = !DILocation(line: 1051, column: 6, scope: !3679)
!3679 = distinct !DILexicalBlock(scope: !3665, file: !2, line: 1051, column: 6)
!3680 = !DILocation(line: 1051, column: 30, scope: !3679)
!3681 = !DILocation(line: 1051, column: 41, scope: !3679)
!3682 = !DILocation(line: 1051, column: 39, scope: !3679)
!3683 = !DILocation(line: 1053, column: 9, scope: !3684)
!3684 = distinct !DILexicalBlock(scope: !3685, file: !2, line: 1053, column: 3)
!3685 = distinct !DILexicalBlock(scope: !3679, file: !2, line: 1051, column: 51)
!3686 = !DILocation(line: 1053, column: 8, scope: !3684)
!3687 = !DILocation(line: 1053, column: 13, scope: !3688)
!3688 = distinct !DILexicalBlock(scope: !3684, file: !2, line: 1053, column: 3)
!3689 = !DILocation(line: 1053, column: 16, scope: !3688)
!3690 = !DILocation(line: 1053, column: 14, scope: !3688)
!3691 = !DILocation(line: 1053, column: 3, scope: !3684)
!3692 = !DILocation(line: 1054, column: 17, scope: !3693)
!3693 = distinct !DILexicalBlock(scope: !3688, file: !2, line: 1054, column: 8)
!3694 = !DILocation(line: 1054, column: 9, scope: !3693)
!3695 = !DILocation(line: 1054, column: 20, scope: !3693)
!3696 = !DILocation(line: 1054, column: 25, scope: !3693)
!3697 = !DILocation(line: 1054, column: 39, scope: !3693)
!3698 = !DILocation(line: 1054, column: 62, scope: !3693)
!3699 = !DILocation(line: 1054, column: 54, scope: !3693)
!3700 = !DILocation(line: 1054, column: 65, scope: !3693)
!3701 = !DILocation(line: 1054, column: 43, scope: !3693)
!3702 = !DILocation(line: 1054, column: 69, scope: !3693)
!3703 = !DILocation(line: 1055, column: 31, scope: !3704)
!3704 = distinct !DILexicalBlock(scope: !3693, file: !2, line: 1055, column: 9)
!3705 = !DILocation(line: 1055, column: 9, scope: !3704)
!3706 = !DILocation(line: 1056, column: 32, scope: !3707)
!3707 = distinct !DILexicalBlock(scope: !3704, file: !2, line: 1055, column: 35)
!3708 = !DILocation(line: 1056, column: 30, scope: !3707)
!3709 = !DILocation(line: 1057, column: 6, scope: !3707)
!3710 = !DILocation(line: 1055, column: 32, scope: !3704)
!3711 = !DILocation(line: 1053, column: 39, scope: !3688)
!3712 = !DILocation(line: 1053, column: 3, scope: !3688)
!3713 = distinct !{!3713, !3691, !3714, !1697}
!3714 = !DILocation(line: 1058, column: 5, scope: !3684)
!3715 = !DILocation(line: 1061, column: 9, scope: !3716)
!3716 = distinct !DILexicalBlock(scope: !3685, file: !2, line: 1061, column: 3)
!3717 = !DILocation(line: 1061, column: 8, scope: !3716)
!3718 = !DILocation(line: 1061, column: 13, scope: !3719)
!3719 = distinct !DILexicalBlock(scope: !3716, file: !2, line: 1061, column: 3)
!3720 = !DILocation(line: 1061, column: 16, scope: !3719)
!3721 = !DILocation(line: 1061, column: 14, scope: !3719)
!3722 = !DILocation(line: 1061, column: 3, scope: !3716)
!3723 = !DILocation(line: 1062, column: 17, scope: !3724)
!3724 = distinct !DILexicalBlock(scope: !3719, file: !2, line: 1062, column: 8)
!3725 = !DILocation(line: 1062, column: 9, scope: !3724)
!3726 = !DILocation(line: 1062, column: 20, scope: !3724)
!3727 = !DILocation(line: 1062, column: 25, scope: !3724)
!3728 = !DILocation(line: 1062, column: 39, scope: !3724)
!3729 = !DILocation(line: 1062, column: 62, scope: !3724)
!3730 = !DILocation(line: 1062, column: 54, scope: !3724)
!3731 = !DILocation(line: 1062, column: 65, scope: !3724)
!3732 = !DILocation(line: 1062, column: 43, scope: !3724)
!3733 = !DILocation(line: 1062, column: 69, scope: !3724)
!3734 = !DILocation(line: 1063, column: 32, scope: !3735)
!3735 = distinct !DILexicalBlock(scope: !3724, file: !2, line: 1063, column: 9)
!3736 = !DILocation(line: 1063, column: 9, scope: !3735)
!3737 = !DILocation(line: 1064, column: 32, scope: !3738)
!3738 = distinct !DILexicalBlock(scope: !3735, file: !2, line: 1063, column: 36)
!3739 = !DILocation(line: 1064, column: 30, scope: !3738)
!3740 = !DILocation(line: 1065, column: 6, scope: !3738)
!3741 = !DILocation(line: 1063, column: 33, scope: !3735)
!3742 = !DILocation(line: 1061, column: 39, scope: !3719)
!3743 = !DILocation(line: 1061, column: 3, scope: !3719)
!3744 = distinct !{!3744, !3722, !3745, !1697}
!3745 = !DILocation(line: 1066, column: 5, scope: !3716)
!3746 = !DILocation(line: 1068, column: 2, scope: !3685)
!3747 = !DILocation(line: 1069, column: 1, scope: !3665)
!3748 = distinct !DISubprogram(name: "do_escort_frame", linkageName: "_Z15do_escort_frameP6objectii", scope: !2, file: !2, line: 1073, type: !3749, scopeLine: 1074, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !72, retainedNodes: !1669)
!3749 = !DISubroutineType(types: !3750)
!3750 = !{null, !2677, !90, !77}
!3751 = !DILocalVariable(name: "objp", arg: 1, scope: !3748, file: !2, line: 1073, type: !2677)
!3752 = !DILocation(line: 1073, column: 30, scope: !3748)
!3753 = !DILocalVariable(name: "dist_to_player", arg: 2, scope: !3748, file: !2, line: 1073, type: !90)
!3754 = !DILocation(line: 1073, column: 40, scope: !3748)
!3755 = !DILocalVariable(name: "player_visibility", arg: 3, scope: !3748, file: !2, line: 1073, type: !77)
!3756 = !DILocation(line: 1073, column: 60, scope: !3748)
!3757 = !DILocalVariable(name: "objnum", scope: !3748, file: !2, line: 1075, type: !77)
!3758 = !DILocation(line: 1075, column: 8, scope: !3748)
!3759 = !DILocation(line: 1075, column: 17, scope: !3748)
!3760 = !DILocation(line: 1075, column: 21, scope: !3748)
!3761 = !DILocalVariable(name: "aip", scope: !3748, file: !2, line: 1076, type: !3078)
!3762 = !DILocation(line: 1076, column: 13, scope: !3748)
!3763 = !DILocation(line: 1076, column: 20, scope: !3748)
!3764 = !DILocation(line: 1076, column: 26, scope: !3748)
!3765 = !DILocalVariable(name: "ailp", scope: !3748, file: !2, line: 1077, type: !3083)
!3766 = !DILocation(line: 1077, column: 13, scope: !3748)
!3767 = !DILocation(line: 1077, column: 35, scope: !3748)
!3768 = !DILocation(line: 1077, column: 21, scope: !3748)
!3769 = !DILocation(line: 1079, column: 17, scope: !3748)
!3770 = !DILocation(line: 1079, column: 21, scope: !3748)
!3771 = !DILocation(line: 1079, column: 15, scope: !3748)
!3772 = !DILocation(line: 1081, column: 6, scope: !3773)
!3773 = distinct !DILexicalBlock(scope: !3748, file: !2, line: 1081, column: 6)
!3774 = !DILocation(line: 1081, column: 13, scope: !3773)
!3775 = !DILocalVariable(name: "ttv", scope: !3776, file: !2, line: 1082, type: !77)
!3776 = distinct !DILexicalBlock(scope: !3773, file: !2, line: 1081, column: 20)
!3777 = !DILocation(line: 1082, column: 7, scope: !3776)
!3778 = !DILocation(line: 1082, column: 34, scope: !3776)
!3779 = !DILocation(line: 1082, column: 40, scope: !3776)
!3780 = !DILocation(line: 1082, column: 46, scope: !3776)
!3781 = !DILocation(line: 1082, column: 13, scope: !3776)
!3782 = !DILocation(line: 1083, column: 11, scope: !3776)
!3783 = !DILocation(line: 1084, column: 4, scope: !3776)
!3784 = !DILocation(line: 1084, column: 10, scope: !3776)
!3785 = !DILocation(line: 1084, column: 16, scope: !3776)
!3786 = !DILocation(line: 1084, column: 36, scope: !3776)
!3787 = !DILocation(line: 1084, column: 62, scope: !3776)
!3788 = !DILocation(line: 1085, column: 4, scope: !3776)
!3789 = !DILocation(line: 1085, column: 36, scope: !3776)
!3790 = !DILocation(line: 1085, column: 41, scope: !3776)
!3791 = !DILocation(line: 1083, column: 3, scope: !3776)
!3792 = !DILocation(line: 1086, column: 2, scope: !3776)
!3793 = !DILocation(line: 1088, column: 6, scope: !3794)
!3794 = distinct !DILexicalBlock(scope: !3748, file: !2, line: 1088, column: 6)
!3795 = !DILocation(line: 1089, column: 28, scope: !3796)
!3796 = distinct !DILexicalBlock(scope: !3794, file: !2, line: 1088, column: 25)
!3797 = !DILocation(line: 1089, column: 26, scope: !3796)
!3798 = !DILocation(line: 1090, column: 15, scope: !3799)
!3799 = distinct !DILexicalBlock(scope: !3796, file: !2, line: 1090, column: 7)
!3800 = !DILocation(line: 1090, column: 7, scope: !3799)
!3801 = !DILocation(line: 1090, column: 27, scope: !3799)
!3802 = !DILocation(line: 1090, column: 33, scope: !3799)
!3803 = !DILocation(line: 1091, column: 20, scope: !3804)
!3804 = distinct !DILexicalBlock(scope: !3799, file: !2, line: 1091, column: 8)
!3805 = !DILocation(line: 1091, column: 12, scope: !3804)
!3806 = !DILocation(line: 1091, column: 32, scope: !3804)
!3807 = !DILocation(line: 1091, column: 8, scope: !3804)
!3808 = !DILocation(line: 1091, column: 40, scope: !3804)
!3809 = !DILocation(line: 1092, column: 22, scope: !3810)
!3810 = distinct !DILexicalBlock(scope: !3804, file: !2, line: 1092, column: 9)
!3811 = !DILocation(line: 1092, column: 14, scope: !3810)
!3812 = !DILocation(line: 1092, column: 34, scope: !3810)
!3813 = !DILocation(line: 1092, column: 10, scope: !3810)
!3814 = !DILocation(line: 1092, column: 41, scope: !3810)
!3815 = !DILocation(line: 1092, column: 45, scope: !3810)
!3816 = !DILocation(line: 1092, column: 9, scope: !3810)
!3817 = !DILocation(line: 1093, column: 11, scope: !3818)
!3818 = distinct !DILexicalBlock(scope: !3810, file: !2, line: 1093, column: 10)
!3819 = !DILocation(line: 1093, column: 10, scope: !3818)
!3820 = !DILocation(line: 1094, column: 7, scope: !3818)
!3821 = !DILocation(line: 1092, column: 47, scope: !3810)
!3822 = !DILocation(line: 1091, column: 42, scope: !3804)
!3823 = !DILocation(line: 1096, column: 2, scope: !3796)
!3824 = !DILocation(line: 1098, column: 6, scope: !3825)
!3825 = distinct !DILexicalBlock(scope: !3748, file: !2, line: 1098, column: 6)
!3826 = !DILocation(line: 1099, column: 3, scope: !3825)
!3827 = !DILocation(line: 1101, column: 6, scope: !3828)
!3828 = distinct !DILexicalBlock(scope: !3748, file: !2, line: 1101, column: 6)
!3829 = !DILocation(line: 1101, column: 23, scope: !3828)
!3830 = !DILocation(line: 1101, column: 32, scope: !3828)
!3831 = !DILocation(line: 1101, column: 30, scope: !3828)
!3832 = !DILocation(line: 1102, column: 27, scope: !3833)
!3833 = distinct !DILexicalBlock(scope: !3828, file: !2, line: 1101, column: 42)
!3834 = !DILocation(line: 1103, column: 7, scope: !3835)
!3835 = distinct !DILexicalBlock(scope: !3833, file: !2, line: 1103, column: 7)
!3836 = !DILocation(line: 1103, column: 26, scope: !3835)
!3837 = !DILocation(line: 1103, column: 35, scope: !3835)
!3838 = !DILocation(line: 1103, column: 24, scope: !3835)
!3839 = !DILocation(line: 1104, column: 4, scope: !3835)
!3840 = !DILocation(line: 1105, column: 20, scope: !3833)
!3841 = !DILocation(line: 1106, column: 2, scope: !3833)
!3842 = !DILocation(line: 1109, column: 7, scope: !3843)
!3843 = distinct !DILexicalBlock(scope: !3748, file: !2, line: 1109, column: 6)
!3844 = !DILocation(line: 1109, column: 6, scope: !3843)
!3845 = !DILocation(line: 1110, column: 7, scope: !3846)
!3846 = distinct !DILexicalBlock(scope: !3843, file: !2, line: 1110, column: 7)
!3847 = !DILocation(line: 1110, column: 22, scope: !3846)
!3848 = !DILocation(line: 1111, column: 34, scope: !3846)
!3849 = !DILocation(line: 1111, column: 33, scope: !3846)
!3850 = !DILocation(line: 1111, column: 25, scope: !3846)
!3851 = !DILocation(line: 1111, column: 4, scope: !3846)
!3852 = !DILocation(line: 1111, column: 9, scope: !3846)
!3853 = !DILocation(line: 1111, column: 23, scope: !3846)
!3854 = !DILocation(line: 1110, column: 29, scope: !3846)
!3855 = !DILocation(line: 1118, column: 6, scope: !3856)
!3856 = distinct !DILexicalBlock(scope: !3748, file: !2, line: 1118, column: 6)
!3857 = !DILocation(line: 1118, column: 12, scope: !3856)
!3858 = !DILocation(line: 1118, column: 17, scope: !3856)
!3859 = !DILocation(line: 1119, column: 7, scope: !3860)
!3860 = distinct !DILexicalBlock(scope: !3856, file: !2, line: 1119, column: 7)
!3861 = !DILocation(line: 1121, column: 26, scope: !3862)
!3862 = distinct !DILexicalBlock(scope: !3860, file: !2, line: 1119, column: 26)
!3863 = !DILocation(line: 1121, column: 37, scope: !3862)
!3864 = !DILocation(line: 1121, column: 46, scope: !3862)
!3865 = !DILocation(line: 1121, column: 35, scope: !3862)
!3866 = !DILocation(line: 1121, column: 4, scope: !3862)
!3867 = !DILocation(line: 1122, column: 35, scope: !3862)
!3868 = !DILocation(line: 1122, column: 53, scope: !3862)
!3869 = !DILocation(line: 1122, column: 58, scope: !3862)
!3870 = !DILocation(line: 1122, column: 42, scope: !3862)
!3871 = !DILocation(line: 1122, column: 71, scope: !3862)
!3872 = !DILocation(line: 1122, column: 76, scope: !3862)
!3873 = !DILocation(line: 1122, column: 23, scope: !3862)
!3874 = !DILocation(line: 1122, column: 4, scope: !3862)
!3875 = !DILocation(line: 1122, column: 9, scope: !3862)
!3876 = !DILocation(line: 1122, column: 21, scope: !3862)
!3877 = !DILocation(line: 1123, column: 3, scope: !3862)
!3878 = !DILocation(line: 1125, column: 6, scope: !3879)
!3879 = distinct !DILexicalBlock(scope: !3748, file: !2, line: 1125, column: 6)
!3880 = !DILocation(line: 1125, column: 26, scope: !3879)
!3881 = !DILocation(line: 1126, column: 7, scope: !3882)
!3882 = distinct !DILexicalBlock(scope: !3883, file: !2, line: 1126, column: 7)
!3883 = distinct !DILexicalBlock(scope: !3879, file: !2, line: 1125, column: 48)
!3884 = !DILocation(line: 1127, column: 8, scope: !3885)
!3885 = distinct !DILexicalBlock(scope: !3882, file: !2, line: 1127, column: 8)
!3886 = !DILocation(line: 1127, column: 33, scope: !3885)
!3887 = !DILocation(line: 1127, column: 44, scope: !3885)
!3888 = !DILocation(line: 1127, column: 42, scope: !3885)
!3889 = !DILocation(line: 1128, column: 5, scope: !3890)
!3890 = distinct !DILexicalBlock(scope: !3885, file: !2, line: 1127, column: 54)
!3891 = !DILocation(line: 1129, column: 27, scope: !3890)
!3892 = !DILocation(line: 1129, column: 38, scope: !3890)
!3893 = !DILocation(line: 1129, column: 47, scope: !3890)
!3894 = !DILocation(line: 1129, column: 36, scope: !3890)
!3895 = !DILocation(line: 1129, column: 53, scope: !3890)
!3896 = !DILocation(line: 1129, column: 68, scope: !3890)
!3897 = !DILocation(line: 1129, column: 5, scope: !3890)
!3898 = !DILocation(line: 1130, column: 32, scope: !3890)
!3899 = !DILocation(line: 1130, column: 30, scope: !3890)
!3900 = !DILocation(line: 1131, column: 4, scope: !3890)
!3901 = !DILocation(line: 1135, column: 3, scope: !3883)
!3902 = !DILocation(line: 1139, column: 8, scope: !3903)
!3903 = distinct !DILexicalBlock(scope: !3748, file: !2, line: 1139, column: 6)
!3904 = !DILocation(line: 1139, column: 28, scope: !3903)
!3905 = !DILocation(line: 1139, column: 50, scope: !3903)
!3906 = !DILocation(line: 1139, column: 55, scope: !3903)
!3907 = !DILocation(line: 1139, column: 80, scope: !3903)
!3908 = !DILocation(line: 1139, column: 92, scope: !3903)
!3909 = !DILocation(line: 1139, column: 90, scope: !3903)
!3910 = !DILocation(line: 1139, column: 103, scope: !3903)
!3911 = !DILocation(line: 1140, column: 5, scope: !3903)
!3912 = !DILocation(line: 1140, column: 25, scope: !3903)
!3913 = !DILocation(line: 1140, column: 47, scope: !3903)
!3914 = !DILocation(line: 1140, column: 52, scope: !3903)
!3915 = !DILocation(line: 1140, column: 77, scope: !3903)
!3916 = !DILocation(line: 1140, column: 90, scope: !3903)
!3917 = !DILocation(line: 1140, column: 88, scope: !3903)
!3918 = !DILocation(line: 1141, column: 11, scope: !3919)
!3919 = distinct !DILexicalBlock(scope: !3903, file: !2, line: 1140, column: 102)
!3920 = !DILocation(line: 1141, column: 62, scope: !3919)
!3921 = !DILocation(line: 1141, column: 82, scope: !3919)
!3922 = !DILocation(line: 1141, column: 3, scope: !3919)
!3923 = !DILocation(line: 1142, column: 22, scope: !3919)
!3924 = !DILocation(line: 1143, column: 30, scope: !3919)
!3925 = !DILocation(line: 1143, column: 28, scope: !3919)
!3926 = !DILocation(line: 1144, column: 2, scope: !3919)
!3927 = !DILocation(line: 1146, column: 7, scope: !3928)
!3928 = distinct !DILexicalBlock(scope: !3748, file: !2, line: 1146, column: 6)
!3929 = !DILocation(line: 1146, column: 27, scope: !3928)
!3930 = !DILocation(line: 1146, column: 49, scope: !3928)
!3931 = !DILocation(line: 1146, column: 73, scope: !3928)
!3932 = !DILocation(line: 1146, column: 79, scope: !3928)
!3933 = !DILocation(line: 1146, column: 85, scope: !3928)
!3934 = !DILocation(line: 1146, column: 52, scope: !3928)
!3935 = !DILocalVariable(name: "max_len", scope: !3936, file: !2, line: 1147, type: !77)
!3936 = distinct !DILexicalBlock(scope: !3928, file: !2, line: 1146, column: 91)
!3937 = !DILocation(line: 1147, column: 7, scope: !3936)
!3938 = !DILocation(line: 1149, column: 7, scope: !3939)
!3939 = distinct !DILexicalBlock(scope: !3936, file: !2, line: 1149, column: 7)
!3940 = !DILocation(line: 1149, column: 14, scope: !3939)
!3941 = !DILocation(line: 1149, column: 20, scope: !3939)
!3942 = !DILocation(line: 1149, column: 23, scope: !3939)
!3943 = !DILocation(line: 1149, column: 32, scope: !3939)
!3944 = !DILocation(line: 1149, column: 41, scope: !3939)
!3945 = !DILocation(line: 1149, column: 44, scope: !3939)
!3946 = !DILocation(line: 1149, column: 53, scope: !3939)
!3947 = !DILocation(line: 1150, column: 12, scope: !3939)
!3948 = !DILocation(line: 1150, column: 60, scope: !3939)
!3949 = !DILocation(line: 1150, column: 4, scope: !3939)
!3950 = !DILocation(line: 1151, column: 36, scope: !3936)
!3951 = !DILocation(line: 1151, column: 34, scope: !3936)
!3952 = !DILocation(line: 1152, column: 3, scope: !3936)
!3953 = !DILocation(line: 1152, column: 9, scope: !3936)
!3954 = !DILocation(line: 1152, column: 14, scope: !3936)
!3955 = !DILocation(line: 1153, column: 8, scope: !3956)
!3956 = distinct !DILexicalBlock(scope: !3936, file: !2, line: 1153, column: 7)
!3957 = !DILocation(line: 1153, column: 7, scope: !3956)
!3958 = !DILocation(line: 1154, column: 9, scope: !3959)
!3959 = distinct !DILexicalBlock(scope: !3960, file: !2, line: 1154, column: 8)
!3960 = distinct !DILexicalBlock(scope: !3956, file: !2, line: 1153, column: 27)
!3961 = !DILocation(line: 1154, column: 37, scope: !3959)
!3962 = !DILocation(line: 1154, column: 46, scope: !3959)
!3963 = !DILocation(line: 1154, column: 44, scope: !3959)
!3964 = !DILocation(line: 1154, column: 56, scope: !3959)
!3965 = !DILocation(line: 1154, column: 60, scope: !3959)
!3966 = !DILocation(line: 1154, column: 90, scope: !3959)
!3967 = !DILocation(line: 1154, column: 88, scope: !3959)
!3968 = !DILocation(line: 1155, column: 5, scope: !3969)
!3969 = distinct !DILexicalBlock(scope: !3959, file: !2, line: 1154, column: 101)
!3970 = !DILocation(line: 1156, column: 35, scope: !3969)
!3971 = !DILocation(line: 1156, column: 33, scope: !3969)
!3972 = !DILocation(line: 1157, column: 4, scope: !3969)
!3973 = !DILocation(line: 1158, column: 3, scope: !3960)
!3974 = !DILocation(line: 1160, column: 13, scope: !3936)
!3975 = !DILocation(line: 1160, column: 11, scope: !3936)
!3976 = !DILocation(line: 1161, column: 8, scope: !3977)
!3977 = distinct !DILexicalBlock(scope: !3936, file: !2, line: 1161, column: 7)
!3978 = !DILocation(line: 1161, column: 7, scope: !3977)
!3979 = !DILocation(line: 1162, column: 12, scope: !3977)
!3980 = !DILocation(line: 1162, column: 4, scope: !3977)
!3981 = !DILocation(line: 1163, column: 25, scope: !3936)
!3982 = !DILocation(line: 1163, column: 31, scope: !3936)
!3983 = !DILocation(line: 1163, column: 3, scope: !3936)
!3984 = !DILocation(line: 1164, column: 34, scope: !3936)
!3985 = !DILocation(line: 1164, column: 52, scope: !3936)
!3986 = !DILocation(line: 1164, column: 57, scope: !3936)
!3987 = !DILocation(line: 1164, column: 41, scope: !3936)
!3988 = !DILocation(line: 1164, column: 70, scope: !3936)
!3989 = !DILocation(line: 1164, column: 75, scope: !3936)
!3990 = !DILocation(line: 1164, column: 22, scope: !3936)
!3991 = !DILocation(line: 1164, column: 3, scope: !3936)
!3992 = !DILocation(line: 1164, column: 8, scope: !3936)
!3993 = !DILocation(line: 1164, column: 20, scope: !3936)
!3994 = !DILocation(line: 1166, column: 3, scope: !3936)
!3995 = !DILocation(line: 1166, column: 9, scope: !3936)
!3996 = !DILocation(line: 1166, column: 14, scope: !3936)
!3997 = !DILocation(line: 1167, column: 2, scope: !3936)
!3998 = !DILocation(line: 1167, column: 13, scope: !3999)
!3999 = distinct !DILexicalBlock(scope: !3928, file: !2, line: 1167, column: 13)
!4000 = !DILocation(line: 1167, column: 24, scope: !3999)
!4001 = !DILocation(line: 1167, column: 22, scope: !3999)
!4002 = !DILocation(line: 1167, column: 47, scope: !3999)
!4003 = !DILocation(line: 1169, column: 7, scope: !4004)
!4004 = distinct !DILexicalBlock(scope: !4005, file: !2, line: 1169, column: 7)
!4005 = distinct !DILexicalBlock(scope: !3999, file: !2, line: 1167, column: 71)
!4006 = !DILocation(line: 1169, column: 14, scope: !4004)
!4007 = !DILocation(line: 1169, column: 20, scope: !4004)
!4008 = !DILocation(line: 1169, column: 23, scope: !4004)
!4009 = !DILocation(line: 1169, column: 32, scope: !4004)
!4010 = !DILocation(line: 1169, column: 41, scope: !4004)
!4011 = !DILocation(line: 1169, column: 44, scope: !4004)
!4012 = !DILocation(line: 1169, column: 53, scope: !4004)
!4013 = !DILocation(line: 1170, column: 12, scope: !4004)
!4014 = !DILocation(line: 1170, column: 57, scope: !4004)
!4015 = !DILocation(line: 1170, column: 4, scope: !4004)
!4016 = !DILocation(line: 1171, column: 3, scope: !4005)
!4017 = !DILocation(line: 1172, column: 14, scope: !4018)
!4018 = distinct !DILexicalBlock(scope: !3999, file: !2, line: 1172, column: 13)
!4019 = !DILocation(line: 1172, column: 20, scope: !4018)
!4020 = !DILocation(line: 1172, column: 25, scope: !4018)
!4021 = !DILocation(line: 1172, column: 45, scope: !4018)
!4022 = !DILocation(line: 1172, column: 49, scope: !4018)
!4023 = !DILocation(line: 1172, column: 64, scope: !4018)
!4024 = !DILocation(line: 1173, column: 7, scope: !4025)
!4025 = distinct !DILexicalBlock(scope: !4026, file: !2, line: 1173, column: 7)
!4026 = distinct !DILexicalBlock(scope: !4018, file: !2, line: 1172, column: 88)
!4027 = !DILocation(line: 1173, column: 14, scope: !4025)
!4028 = !DILocation(line: 1173, column: 20, scope: !4025)
!4029 = !DILocation(line: 1173, column: 23, scope: !4025)
!4030 = !DILocation(line: 1173, column: 32, scope: !4025)
!4031 = !DILocation(line: 1173, column: 41, scope: !4025)
!4032 = !DILocation(line: 1173, column: 44, scope: !4025)
!4033 = !DILocation(line: 1173, column: 53, scope: !4025)
!4034 = !DILocation(line: 1174, column: 12, scope: !4025)
!4035 = !DILocation(line: 1174, column: 59, scope: !4025)
!4036 = !DILocation(line: 1174, column: 4, scope: !4025)
!4037 = !DILocation(line: 1175, column: 24, scope: !4026)
!4038 = !DILocation(line: 1175, column: 22, scope: !4026)
!4039 = !DILocation(line: 1176, column: 3, scope: !4026)
!4040 = !DILocation(line: 1176, column: 9, scope: !4026)
!4041 = !DILocation(line: 1176, column: 14, scope: !4026)
!4042 = !DILocation(line: 1177, column: 30, scope: !4026)
!4043 = !DILocation(line: 1177, column: 3, scope: !4026)
!4044 = !DILocation(line: 1178, column: 34, scope: !4026)
!4045 = !DILocation(line: 1178, column: 52, scope: !4026)
!4046 = !DILocation(line: 1178, column: 57, scope: !4026)
!4047 = !DILocation(line: 1178, column: 41, scope: !4026)
!4048 = !DILocation(line: 1178, column: 70, scope: !4026)
!4049 = !DILocation(line: 1178, column: 75, scope: !4026)
!4050 = !DILocation(line: 1178, column: 22, scope: !4026)
!4051 = !DILocation(line: 1178, column: 3, scope: !4026)
!4052 = !DILocation(line: 1178, column: 8, scope: !4026)
!4053 = !DILocation(line: 1178, column: 20, scope: !4026)
!4054 = !DILocation(line: 1180, column: 7, scope: !4055)
!4055 = distinct !DILexicalBlock(scope: !4026, file: !2, line: 1180, column: 7)
!4056 = !DILocation(line: 1180, column: 12, scope: !4055)
!4057 = !DILocation(line: 1180, column: 24, scope: !4055)
!4058 = !DILocation(line: 1181, column: 26, scope: !4059)
!4059 = distinct !DILexicalBlock(scope: !4055, file: !2, line: 1180, column: 29)
!4060 = !DILocation(line: 1181, column: 35, scope: !4059)
!4061 = !DILocation(line: 1181, column: 4, scope: !4059)
!4062 = !DILocation(line: 1183, column: 3, scope: !4059)
!4063 = !DILocation(line: 1184, column: 3, scope: !4026)
!4064 = !DILocation(line: 1184, column: 9, scope: !4026)
!4065 = !DILocation(line: 1184, column: 14, scope: !4026)
!4066 = !DILocation(line: 1185, column: 2, scope: !4026)
!4067 = !DILocation(line: 1185, column: 13, scope: !4068)
!4068 = distinct !DILexicalBlock(scope: !4018, file: !2, line: 1185, column: 13)
!4069 = !DILocation(line: 1185, column: 32, scope: !4068)
!4070 = !DILocation(line: 1186, column: 7, scope: !4071)
!4071 = distinct !DILexicalBlock(scope: !4072, file: !2, line: 1186, column: 7)
!4072 = distinct !DILexicalBlock(scope: !4068, file: !2, line: 1185, column: 60)
!4073 = !DILocation(line: 1186, column: 14, scope: !4071)
!4074 = !DILocation(line: 1186, column: 20, scope: !4071)
!4075 = !DILocation(line: 1186, column: 23, scope: !4071)
!4076 = !DILocation(line: 1186, column: 32, scope: !4071)
!4077 = !DILocation(line: 1186, column: 41, scope: !4071)
!4078 = !DILocation(line: 1186, column: 44, scope: !4071)
!4079 = !DILocation(line: 1186, column: 53, scope: !4071)
!4080 = !DILocation(line: 1187, column: 12, scope: !4071)
!4081 = !DILocation(line: 1187, column: 59, scope: !4071)
!4082 = !DILocation(line: 1187, column: 4, scope: !4071)
!4083 = !DILocation(line: 1188, column: 8, scope: !4084)
!4084 = distinct !DILexicalBlock(scope: !4072, file: !2, line: 1188, column: 7)
!4085 = !DILocation(line: 1188, column: 14, scope: !4084)
!4086 = !DILocation(line: 1188, column: 19, scope: !4084)
!4087 = !DILocation(line: 1188, column: 39, scope: !4084)
!4088 = !DILocation(line: 1188, column: 43, scope: !4084)
!4089 = !DILocation(line: 1188, column: 58, scope: !4084)
!4090 = !DILocation(line: 1189, column: 25, scope: !4091)
!4091 = distinct !DILexicalBlock(scope: !4084, file: !2, line: 1188, column: 82)
!4092 = !DILocation(line: 1189, column: 23, scope: !4091)
!4093 = !DILocation(line: 1190, column: 4, scope: !4091)
!4094 = !DILocation(line: 1190, column: 10, scope: !4091)
!4095 = !DILocation(line: 1190, column: 15, scope: !4091)
!4096 = !DILocation(line: 1191, column: 31, scope: !4091)
!4097 = !DILocation(line: 1191, column: 4, scope: !4091)
!4098 = !DILocation(line: 1192, column: 35, scope: !4091)
!4099 = !DILocation(line: 1192, column: 53, scope: !4091)
!4100 = !DILocation(line: 1192, column: 58, scope: !4091)
!4101 = !DILocation(line: 1192, column: 42, scope: !4091)
!4102 = !DILocation(line: 1192, column: 71, scope: !4091)
!4103 = !DILocation(line: 1192, column: 76, scope: !4091)
!4104 = !DILocation(line: 1192, column: 23, scope: !4091)
!4105 = !DILocation(line: 1192, column: 4, scope: !4091)
!4106 = !DILocation(line: 1192, column: 9, scope: !4091)
!4107 = !DILocation(line: 1192, column: 21, scope: !4091)
!4108 = !DILocation(line: 1194, column: 8, scope: !4109)
!4109 = distinct !DILexicalBlock(scope: !4091, file: !2, line: 1194, column: 8)
!4110 = !DILocation(line: 1194, column: 13, scope: !4109)
!4111 = !DILocation(line: 1194, column: 25, scope: !4109)
!4112 = !DILocation(line: 1195, column: 27, scope: !4113)
!4113 = distinct !DILexicalBlock(scope: !4109, file: !2, line: 1194, column: 30)
!4114 = !DILocation(line: 1195, column: 36, scope: !4113)
!4115 = !DILocation(line: 1195, column: 5, scope: !4113)
!4116 = !DILocation(line: 1197, column: 4, scope: !4113)
!4117 = !DILocation(line: 1198, column: 4, scope: !4091)
!4118 = !DILocation(line: 1198, column: 10, scope: !4091)
!4119 = !DILocation(line: 1198, column: 15, scope: !4091)
!4120 = !DILocation(line: 1199, column: 3, scope: !4091)
!4121 = !DILocation(line: 1200, column: 2, scope: !4072)
!4122 = !DILocation(line: 1203, column: 1, scope: !3748)
!4123 = distinct !DISubprogram(name: "f2i", linkageName: "_Z3f2ii", scope: !91, file: !91, line: 55, type: !4124, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !72, retainedNodes: !1669)
!4124 = !DISubroutineType(types: !4125)
!4125 = !{!77, !90}
!4126 = !DILocalVariable(name: "f", arg: 1, scope: !4123, file: !91, line: 55, type: !90)
!4127 = !DILocation(line: 55, column: 23, scope: !4123)
!4128 = !DILocation(line: 57, column: 9, scope: !4123)
!4129 = !DILocation(line: 57, column: 11, scope: !4123)
!4130 = !DILocation(line: 57, column: 2, scope: !4123)
!4131 = distinct !DISubprogram(name: "invalidate_escort_goal", linkageName: "_Z22invalidate_escort_goalv", scope: !2, file: !2, line: 1205, type: !946, scopeLine: 1206, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !72)
!4132 = !DILocation(line: 1207, column: 10, scope: !4131)
!4133 = !DILocation(line: 1207, column: 63, scope: !4131)
!4134 = !DILocation(line: 1207, column: 83, scope: !4131)
!4135 = !DILocation(line: 1207, column: 2, scope: !4131)
!4136 = !DILocation(line: 1208, column: 21, scope: !4131)
!4137 = !DILocation(line: 1209, column: 1, scope: !4131)
!4138 = distinct !DISubprogram(name: "do_snipe_frame", linkageName: "_Z14do_snipe_frameP6objectiiP10vms_vector", scope: !2, file: !2, line: 1212, type: !4139, scopeLine: 1213, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !72, retainedNodes: !1669)
!4139 = !DISubroutineType(types: !4140)
!4140 = !{null, !2677, !90, !77, !4141}
!4141 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1748, size: 64)
!4142 = !DILocalVariable(name: "objp", arg: 1, scope: !4138, file: !2, line: 1212, type: !2677)
!4143 = !DILocation(line: 1212, column: 29, scope: !4138)
!4144 = !DILocalVariable(name: "dist_to_player", arg: 2, scope: !4138, file: !2, line: 1212, type: !90)
!4145 = !DILocation(line: 1212, column: 39, scope: !4138)
!4146 = !DILocalVariable(name: "player_visibility", arg: 3, scope: !4138, file: !2, line: 1212, type: !77)
!4147 = !DILocation(line: 1212, column: 59, scope: !4138)
!4148 = !DILocalVariable(name: "vec_to_player", arg: 4, scope: !4138, file: !2, line: 1212, type: !4141)
!4149 = !DILocation(line: 1212, column: 90, scope: !4138)
!4150 = !DILocalVariable(name: "objnum", scope: !4138, file: !2, line: 1214, type: !77)
!4151 = !DILocation(line: 1214, column: 8, scope: !4138)
!4152 = !DILocation(line: 1214, column: 17, scope: !4138)
!4153 = !DILocation(line: 1214, column: 21, scope: !4138)
!4154 = !DILocalVariable(name: "ailp", scope: !4138, file: !2, line: 1215, type: !3083)
!4155 = !DILocation(line: 1215, column: 13, scope: !4138)
!4156 = !DILocation(line: 1215, column: 35, scope: !4138)
!4157 = !DILocation(line: 1215, column: 21, scope: !4138)
!4158 = !DILocalVariable(name: "connected_distance", scope: !4138, file: !2, line: 1216, type: !90)
!4159 = !DILocation(line: 1216, column: 8, scope: !4138)
!4160 = !DILocation(line: 1218, column: 6, scope: !4161)
!4161 = distinct !DILexicalBlock(scope: !4138, file: !2, line: 1218, column: 6)
!4162 = !DILocation(line: 1218, column: 21, scope: !4161)
!4163 = !DILocation(line: 1219, column: 3, scope: !4161)
!4164 = !DILocation(line: 1223, column: 10, scope: !4138)
!4165 = !DILocation(line: 1223, column: 16, scope: !4138)
!4166 = !DILocation(line: 1223, column: 2, scope: !4138)
!4167 = !DILocation(line: 1225, column: 9, scope: !4168)
!4168 = distinct !DILexicalBlock(scope: !4169, file: !2, line: 1225, column: 8)
!4169 = distinct !DILexicalBlock(scope: !4138, file: !2, line: 1223, column: 22)
!4170 = !DILocation(line: 1225, column: 24, scope: !4168)
!4171 = !DILocation(line: 1225, column: 35, scope: !4168)
!4172 = !DILocation(line: 1225, column: 39, scope: !4168)
!4173 = !DILocation(line: 1225, column: 45, scope: !4168)
!4174 = !DILocation(line: 1225, column: 62, scope: !4168)
!4175 = !DILocation(line: 1226, column: 5, scope: !4168)
!4176 = !DILocation(line: 1228, column: 4, scope: !4169)
!4177 = !DILocation(line: 1228, column: 10, scope: !4169)
!4178 = !DILocation(line: 1228, column: 27, scope: !4169)
!4179 = !DILocation(line: 1230, column: 50, scope: !4169)
!4180 = !DILocation(line: 1230, column: 56, scope: !4169)
!4181 = !DILocation(line: 1230, column: 61, scope: !4169)
!4182 = !DILocation(line: 1230, column: 67, scope: !4169)
!4183 = !DILocation(line: 1230, column: 97, scope: !4169)
!4184 = !DILocation(line: 1230, column: 25, scope: !4169)
!4185 = !DILocation(line: 1230, column: 23, scope: !4169)
!4186 = !DILocation(line: 1231, column: 8, scope: !4187)
!4187 = distinct !DILexicalBlock(scope: !4169, file: !2, line: 1231, column: 8)
!4188 = !DILocation(line: 1231, column: 27, scope: !4187)
!4189 = !DILocation(line: 1233, column: 27, scope: !4190)
!4190 = distinct !DILexicalBlock(scope: !4187, file: !2, line: 1231, column: 39)
!4191 = !DILocation(line: 1233, column: 5, scope: !4190)
!4192 = !DILocation(line: 1234, column: 5, scope: !4190)
!4193 = !DILocation(line: 1234, column: 11, scope: !4190)
!4194 = !DILocation(line: 1234, column: 16, scope: !4190)
!4195 = !DILocation(line: 1235, column: 5, scope: !4190)
!4196 = !DILocation(line: 1235, column: 11, scope: !4190)
!4197 = !DILocation(line: 1235, column: 28, scope: !4190)
!4198 = !DILocation(line: 1236, column: 4, scope: !4190)
!4199 = !DILocation(line: 1237, column: 4, scope: !4169)
!4200 = !DILocation(line: 1241, column: 8, scope: !4201)
!4201 = distinct !DILexicalBlock(scope: !4169, file: !2, line: 1241, column: 8)
!4202 = !DILocation(line: 1241, column: 14, scope: !4201)
!4203 = !DILocation(line: 1241, column: 31, scope: !4201)
!4204 = !DILocation(line: 1242, column: 5, scope: !4205)
!4205 = distinct !DILexicalBlock(scope: !4201, file: !2, line: 1241, column: 36)
!4206 = !DILocation(line: 1242, column: 11, scope: !4205)
!4207 = !DILocation(line: 1242, column: 16, scope: !4205)
!4208 = !DILocation(line: 1243, column: 5, scope: !4205)
!4209 = !DILocation(line: 1243, column: 11, scope: !4205)
!4210 = !DILocation(line: 1243, column: 28, scope: !4205)
!4211 = !DILocation(line: 1245, column: 4, scope: !4205)
!4212 = !DILocation(line: 1245, column: 16, scope: !4213)
!4213 = distinct !DILexicalBlock(scope: !4201, file: !2, line: 1245, column: 15)
!4214 = !DILocation(line: 1245, column: 34, scope: !4213)
!4215 = !DILocation(line: 1245, column: 40, scope: !4213)
!4216 = !DILocation(line: 1245, column: 44, scope: !4213)
!4217 = !DILocation(line: 1245, column: 50, scope: !4213)
!4218 = !DILocation(line: 1245, column: 67, scope: !4213)
!4219 = !DILocation(line: 1246, column: 20, scope: !4220)
!4220 = distinct !DILexicalBlock(scope: !4213, file: !2, line: 1245, column: 96)
!4221 = !DILocation(line: 1246, column: 26, scope: !4220)
!4222 = !DILocation(line: 1246, column: 45, scope: !4220)
!4223 = !DILocation(line: 1246, column: 64, scope: !4220)
!4224 = !DILocation(line: 1246, column: 5, scope: !4220)
!4225 = !DILocation(line: 1247, column: 5, scope: !4220)
!4226 = !DILocation(line: 1247, column: 11, scope: !4220)
!4227 = !DILocation(line: 1247, column: 16, scope: !4220)
!4228 = !DILocation(line: 1248, column: 4, scope: !4220)
!4229 = !DILocation(line: 1250, column: 5, scope: !4230)
!4230 = distinct !DILexicalBlock(scope: !4213, file: !2, line: 1248, column: 11)
!4231 = !DILocation(line: 1250, column: 11, scope: !4230)
!4232 = !DILocation(line: 1250, column: 16, scope: !4230)
!4233 = !DILocation(line: 1251, column: 5, scope: !4230)
!4234 = !DILocation(line: 1251, column: 11, scope: !4230)
!4235 = !DILocation(line: 1251, column: 28, scope: !4230)
!4236 = !DILocation(line: 1253, column: 4, scope: !4169)
!4237 = !DILocation(line: 1256, column: 8, scope: !4238)
!4238 = distinct !DILexicalBlock(scope: !4169, file: !2, line: 1256, column: 8)
!4239 = !DILocation(line: 1256, column: 14, scope: !4238)
!4240 = !DILocation(line: 1256, column: 31, scope: !4238)
!4241 = !DILocation(line: 1258, column: 5, scope: !4242)
!4242 = distinct !DILexicalBlock(scope: !4238, file: !2, line: 1256, column: 36)
!4243 = !DILocation(line: 1258, column: 11, scope: !4242)
!4244 = !DILocation(line: 1258, column: 16, scope: !4242)
!4245 = !DILocation(line: 1259, column: 5, scope: !4242)
!4246 = !DILocation(line: 1259, column: 11, scope: !4242)
!4247 = !DILocation(line: 1259, column: 28, scope: !4242)
!4248 = !DILocation(line: 1260, column: 4, scope: !4242)
!4249 = !DILocation(line: 1262, column: 20, scope: !4250)
!4250 = distinct !DILexicalBlock(scope: !4238, file: !2, line: 1260, column: 11)
!4251 = !DILocation(line: 1262, column: 26, scope: !4250)
!4252 = !DILocation(line: 1262, column: 45, scope: !4250)
!4253 = !DILocation(line: 1262, column: 64, scope: !4250)
!4254 = !DILocation(line: 1262, column: 5, scope: !4250)
!4255 = !DILocation(line: 1263, column: 9, scope: !4256)
!4256 = distinct !DILexicalBlock(scope: !4250, file: !2, line: 1263, column: 9)
!4257 = !DILocation(line: 1264, column: 6, scope: !4258)
!4258 = distinct !DILexicalBlock(scope: !4256, file: !2, line: 1263, column: 28)
!4259 = !DILocation(line: 1264, column: 12, scope: !4258)
!4260 = !DILocation(line: 1264, column: 17, scope: !4258)
!4261 = !DILocation(line: 1265, column: 6, scope: !4258)
!4262 = !DILocation(line: 1265, column: 12, scope: !4258)
!4263 = !DILocation(line: 1265, column: 29, scope: !4258)
!4264 = !DILocation(line: 1266, column: 5, scope: !4258)
!4265 = !DILocation(line: 1267, column: 6, scope: !4256)
!4266 = !DILocation(line: 1267, column: 12, scope: !4256)
!4267 = !DILocation(line: 1267, column: 17, scope: !4256)
!4268 = !DILocation(line: 1269, column: 4, scope: !4169)
!4269 = !DILocation(line: 1272, column: 8, scope: !4270)
!4270 = distinct !DILexicalBlock(scope: !4169, file: !2, line: 1272, column: 8)
!4271 = !DILocation(line: 1272, column: 14, scope: !4270)
!4272 = !DILocation(line: 1272, column: 31, scope: !4270)
!4273 = !DILocalVariable(name: "aip", scope: !4274, file: !2, line: 1273, type: !3078)
!4274 = distinct !DILexicalBlock(scope: !4270, file: !2, line: 1272, column: 36)
!4275 = !DILocation(line: 1273, column: 16, scope: !4274)
!4276 = !DILocation(line: 1273, column: 23, scope: !4274)
!4277 = !DILocation(line: 1273, column: 29, scope: !4274)
!4278 = !DILocation(line: 1275, column: 27, scope: !4274)
!4279 = !DILocation(line: 1275, column: 38, scope: !4274)
!4280 = !DILocation(line: 1275, column: 46, scope: !4274)
!4281 = !DILocation(line: 1275, column: 36, scope: !4274)
!4282 = !DILocation(line: 1275, column: 53, scope: !4274)
!4283 = !DILocation(line: 1275, column: 68, scope: !4274)
!4284 = !DILocation(line: 1275, column: 5, scope: !4274)
!4285 = !DILocation(line: 1276, column: 36, scope: !4274)
!4286 = !DILocation(line: 1276, column: 54, scope: !4274)
!4287 = !DILocation(line: 1276, column: 59, scope: !4274)
!4288 = !DILocation(line: 1276, column: 43, scope: !4274)
!4289 = !DILocation(line: 1276, column: 72, scope: !4274)
!4290 = !DILocation(line: 1276, column: 77, scope: !4274)
!4291 = !DILocation(line: 1276, column: 24, scope: !4274)
!4292 = !DILocation(line: 1276, column: 5, scope: !4274)
!4293 = !DILocation(line: 1276, column: 10, scope: !4274)
!4294 = !DILocation(line: 1276, column: 22, scope: !4274)
!4295 = !DILocation(line: 1277, column: 9, scope: !4296)
!4296 = distinct !DILexicalBlock(scope: !4274, file: !2, line: 1277, column: 9)
!4297 = !DILocation(line: 1277, column: 18, scope: !4296)
!4298 = !DILocation(line: 1278, column: 6, scope: !4296)
!4299 = !DILocation(line: 1278, column: 12, scope: !4296)
!4300 = !DILocation(line: 1278, column: 17, scope: !4296)
!4301 = !DILocation(line: 1280, column: 6, scope: !4296)
!4302 = !DILocation(line: 1280, column: 12, scope: !4296)
!4303 = !DILocation(line: 1280, column: 17, scope: !4296)
!4304 = !DILocation(line: 1281, column: 5, scope: !4274)
!4305 = !DILocation(line: 1281, column: 11, scope: !4274)
!4306 = !DILocation(line: 1281, column: 28, scope: !4274)
!4307 = !DILocation(line: 1282, column: 4, scope: !4274)
!4308 = !DILocation(line: 1284, column: 4, scope: !4169)
!4309 = !DILocation(line: 1287, column: 4, scope: !4169)
!4310 = !DILocation(line: 1288, column: 4, scope: !4169)
!4311 = !DILocation(line: 1288, column: 10, scope: !4169)
!4312 = !DILocation(line: 1288, column: 15, scope: !4169)
!4313 = !DILocation(line: 1289, column: 4, scope: !4169)
!4314 = !DILocation(line: 1289, column: 10, scope: !4169)
!4315 = !DILocation(line: 1289, column: 27, scope: !4169)
!4316 = !DILocation(line: 1290, column: 4, scope: !4169)
!4317 = !DILocation(line: 1293, column: 1, scope: !4138)
!4318 = distinct !DISubprogram(name: "choose_thief_recreation_segment", linkageName: "_Z31choose_thief_recreation_segmentv", scope: !2, file: !2, line: 1301, type: !920, scopeLine: 1302, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !72, retainedNodes: !1669)
!4319 = !DILocalVariable(name: "segnum", scope: !4318, file: !2, line: 1303, type: !77)
!4320 = !DILocation(line: 1303, column: 6, scope: !4318)
!4321 = !DILocalVariable(name: "cur_drop_depth", scope: !4318, file: !2, line: 1304, type: !77)
!4322 = !DILocation(line: 1304, column: 6, scope: !4318)
!4323 = !DILocation(line: 1306, column: 17, scope: !4318)
!4324 = !DILocation(line: 1308, column: 2, scope: !4318)
!4325 = !DILocation(line: 1308, column: 10, scope: !4318)
!4326 = !DILocation(line: 1308, column: 17, scope: !4318)
!4327 = !DILocation(line: 1308, column: 24, scope: !4318)
!4328 = !DILocation(line: 1308, column: 28, scope: !4318)
!4329 = !DILocation(line: 1308, column: 43, scope: !4318)
!4330 = !DILocation(line: 0, scope: !4318)
!4331 = !DILocation(line: 1309, column: 52, scope: !4332)
!4332 = distinct !DILexicalBlock(scope: !4318, file: !2, line: 1308, column: 61)
!4333 = !DILocation(line: 1309, column: 44, scope: !4332)
!4334 = !DILocation(line: 1309, column: 64, scope: !4332)
!4335 = !DILocation(line: 1309, column: 36, scope: !4332)
!4336 = !DILocation(line: 1309, column: 73, scope: !4332)
!4337 = !DILocation(line: 1309, column: 12, scope: !4332)
!4338 = !DILocation(line: 1309, column: 10, scope: !4332)
!4339 = !DILocation(line: 1310, column: 17, scope: !4340)
!4340 = distinct !DILexicalBlock(scope: !4332, file: !2, line: 1310, column: 7)
!4341 = !DILocation(line: 1310, column: 7, scope: !4340)
!4342 = !DILocation(line: 1310, column: 25, scope: !4340)
!4343 = !DILocation(line: 1310, column: 33, scope: !4340)
!4344 = !DILocation(line: 1311, column: 11, scope: !4340)
!4345 = !DILocation(line: 1311, column: 4, scope: !4340)
!4346 = !DILocation(line: 1312, column: 17, scope: !4332)
!4347 = distinct !{!4347, !4324, !4348, !1697}
!4348 = !DILocation(line: 1313, column: 2, scope: !4318)
!4349 = !DILocation(line: 1315, column: 6, scope: !4350)
!4350 = distinct !DILexicalBlock(scope: !4318, file: !2, line: 1315, column: 6)
!4351 = !DILocation(line: 1315, column: 13, scope: !4350)
!4352 = !DILocation(line: 1316, column: 3, scope: !4353)
!4353 = distinct !DILexicalBlock(scope: !4350, file: !2, line: 1315, column: 20)
!4354 = !DILocation(line: 1317, column: 11, scope: !4353)
!4355 = !DILocation(line: 1317, column: 22, scope: !4353)
!4356 = !DILocation(line: 1317, column: 20, scope: !4353)
!4357 = !DILocation(line: 1317, column: 45, scope: !4353)
!4358 = !DILocation(line: 1317, column: 3, scope: !4353)
!4359 = !DILocation(line: 1319, column: 10, scope: !4350)
!4360 = !DILocation(line: 1319, column: 3, scope: !4350)
!4361 = !DILocation(line: 1321, column: 1, scope: !4318)
!4362 = distinct !DISubprogram(name: "recreate_thief", linkageName: "_Z14recreate_thiefP6object", scope: !2, file: !2, line: 1328, type: !3067, scopeLine: 1329, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !72, retainedNodes: !1669)
!4363 = !DILocalVariable(name: "objp", arg: 1, scope: !4362, file: !2, line: 1328, type: !2677)
!4364 = !DILocation(line: 1328, column: 29, scope: !4362)
!4365 = !DILocalVariable(name: "segnum", scope: !4362, file: !2, line: 1330, type: !77)
!4366 = !DILocation(line: 1330, column: 8, scope: !4362)
!4367 = !DILocalVariable(name: "center_point", scope: !4362, file: !2, line: 1331, type: !1748)
!4368 = !DILocation(line: 1331, column: 13, scope: !4362)
!4369 = !DILocalVariable(name: "new_obj", scope: !4362, file: !2, line: 1332, type: !2677)
!4370 = !DILocation(line: 1332, column: 11, scope: !4362)
!4371 = !DILocation(line: 1334, column: 11, scope: !4362)
!4372 = !DILocation(line: 1334, column: 9, scope: !4362)
!4373 = !DILocation(line: 1335, column: 50, scope: !4362)
!4374 = !DILocation(line: 1335, column: 41, scope: !4362)
!4375 = !DILocation(line: 1335, column: 2, scope: !4362)
!4376 = !DILocation(line: 1337, column: 42, scope: !4362)
!4377 = !DILocation(line: 1337, column: 33, scope: !4362)
!4378 = !DILocation(line: 1337, column: 66, scope: !4362)
!4379 = !DILocation(line: 1337, column: 72, scope: !4362)
!4380 = !DILocation(line: 1337, column: 12, scope: !4362)
!4381 = !DILocation(line: 1337, column: 10, scope: !4362)
!4382 = !DILocation(line: 1338, column: 17, scope: !4362)
!4383 = !DILocation(line: 1338, column: 24, scope: !4362)
!4384 = !DILocation(line: 1338, column: 2, scope: !4362)
!4385 = !DILocation(line: 1339, column: 23, scope: !4362)
!4386 = !DILocation(line: 1339, column: 32, scope: !4362)
!4387 = !DILocation(line: 1339, column: 21, scope: !4362)
!4388 = !DILocation(line: 1340, column: 1, scope: !4362)
!4389 = distinct !DISubprogram(name: "do_thief_frame", linkageName: "_Z14do_thief_frameP6objectiiP10vms_vector", scope: !2, file: !2, line: 1348, type: !4139, scopeLine: 1349, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !72, retainedNodes: !1669)
!4390 = !DILocalVariable(name: "objp", arg: 1, scope: !4389, file: !2, line: 1348, type: !2677)
!4391 = !DILocation(line: 1348, column: 29, scope: !4389)
!4392 = !DILocalVariable(name: "dist_to_player", arg: 2, scope: !4389, file: !2, line: 1348, type: !90)
!4393 = !DILocation(line: 1348, column: 39, scope: !4389)
!4394 = !DILocalVariable(name: "player_visibility", arg: 3, scope: !4389, file: !2, line: 1348, type: !77)
!4395 = !DILocation(line: 1348, column: 59, scope: !4389)
!4396 = !DILocalVariable(name: "vec_to_player", arg: 4, scope: !4389, file: !2, line: 1348, type: !4141)
!4397 = !DILocation(line: 1348, column: 90, scope: !4389)
!4398 = !DILocalVariable(name: "objnum", scope: !4389, file: !2, line: 1350, type: !77)
!4399 = !DILocation(line: 1350, column: 8, scope: !4389)
!4400 = !DILocation(line: 1350, column: 17, scope: !4389)
!4401 = !DILocation(line: 1350, column: 21, scope: !4389)
!4402 = !DILocalVariable(name: "ailp", scope: !4389, file: !2, line: 1351, type: !3083)
!4403 = !DILocation(line: 1351, column: 13, scope: !4389)
!4404 = !DILocation(line: 1351, column: 35, scope: !4389)
!4405 = !DILocation(line: 1351, column: 21, scope: !4389)
!4406 = !DILocalVariable(name: "connected_distance", scope: !4389, file: !2, line: 1352, type: !90)
!4407 = !DILocation(line: 1352, column: 8, scope: !4389)
!4408 = !DILocation(line: 1356, column: 7, scope: !4409)
!4409 = distinct !DILexicalBlock(scope: !4389, file: !2, line: 1356, column: 6)
!4410 = !DILocation(line: 1356, column: 25, scope: !4409)
!4411 = !DILocation(line: 1356, column: 30, scope: !4409)
!4412 = !DILocation(line: 1356, column: 34, scope: !4409)
!4413 = !DILocation(line: 1356, column: 55, scope: !4409)
!4414 = !DILocation(line: 1356, column: 53, scope: !4409)
!4415 = !DILocation(line: 1357, column: 7, scope: !4416)
!4416 = distinct !DILexicalBlock(scope: !4417, file: !2, line: 1357, column: 7)
!4417 = distinct !DILexicalBlock(scope: !4409, file: !2, line: 1356, column: 66)
!4418 = !DILocation(line: 1357, column: 28, scope: !4416)
!4419 = !DILocation(line: 1357, column: 37, scope: !4416)
!4420 = !DILocation(line: 1357, column: 26, scope: !4416)
!4421 = !DILocation(line: 1367, column: 4, scope: !4422)
!4422 = distinct !DILexicalBlock(scope: !4416, file: !2, line: 1357, column: 47)
!4423 = !DILocation(line: 1368, column: 3, scope: !4422)
!4424 = !DILocation(line: 1369, column: 22, scope: !4417)
!4425 = !DILocation(line: 1370, column: 2, scope: !4417)
!4426 = !DILocation(line: 1372, column: 7, scope: !4427)
!4427 = distinct !DILexicalBlock(scope: !4389, file: !2, line: 1372, column: 6)
!4428 = !DILocation(line: 1372, column: 22, scope: !4427)
!4429 = !DILocation(line: 1372, column: 34, scope: !4427)
!4430 = !DILocation(line: 1372, column: 38, scope: !4427)
!4431 = !DILocation(line: 1372, column: 44, scope: !4427)
!4432 = !DILocation(line: 1372, column: 61, scope: !4427)
!4433 = !DILocation(line: 1373, column: 3, scope: !4427)
!4434 = !DILocation(line: 1375, column: 6, scope: !4435)
!4435 = distinct !DILexicalBlock(scope: !4389, file: !2, line: 1375, column: 6)
!4436 = !DILocation(line: 1376, column: 3, scope: !4435)
!4437 = !DILocation(line: 1376, column: 9, scope: !4435)
!4438 = !DILocation(line: 1376, column: 14, scope: !4435)
!4439 = !DILocation(line: 1378, column: 10, scope: !4389)
!4440 = !DILocation(line: 1378, column: 16, scope: !4389)
!4441 = !DILocation(line: 1378, column: 2, scope: !4389)
!4442 = !DILocation(line: 1382, column: 8, scope: !4443)
!4443 = distinct !DILexicalBlock(scope: !4444, file: !2, line: 1382, column: 8)
!4444 = distinct !DILexicalBlock(scope: !4389, file: !2, line: 1378, column: 22)
!4445 = !DILocation(line: 1382, column: 14, scope: !4443)
!4446 = !DILocation(line: 1382, column: 36, scope: !4443)
!4447 = !DILocation(line: 1383, column: 5, scope: !4448)
!4448 = distinct !DILexicalBlock(scope: !4443, file: !2, line: 1382, column: 60)
!4449 = !DILocation(line: 1383, column: 11, scope: !4448)
!4450 = !DILocation(line: 1383, column: 33, scope: !4448)
!4451 = !DILocation(line: 1387, column: 27, scope: !4448)
!4452 = !DILocation(line: 1387, column: 5, scope: !4448)
!4453 = !DILocation(line: 1388, column: 5, scope: !4448)
!4454 = !DILocation(line: 1388, column: 11, scope: !4448)
!4455 = !DILocation(line: 1388, column: 16, scope: !4448)
!4456 = !DILocation(line: 1389, column: 5, scope: !4448)
!4457 = !DILocation(line: 1389, column: 11, scope: !4448)
!4458 = !DILocation(line: 1389, column: 28, scope: !4448)
!4459 = !DILocation(line: 1390, column: 5, scope: !4448)
!4460 = !DILocation(line: 1391, column: 15, scope: !4461)
!4461 = distinct !DILexicalBlock(scope: !4443, file: !2, line: 1391, column: 15)
!4462 = !DILocation(line: 1393, column: 27, scope: !4463)
!4463 = distinct !DILexicalBlock(scope: !4461, file: !2, line: 1391, column: 34)
!4464 = !DILocation(line: 1393, column: 37, scope: !4463)
!4465 = !DILocation(line: 1393, column: 52, scope: !4463)
!4466 = !DILocation(line: 1393, column: 5, scope: !4463)
!4467 = !DILocation(line: 1394, column: 5, scope: !4463)
!4468 = !DILocation(line: 1394, column: 11, scope: !4463)
!4469 = !DILocation(line: 1394, column: 16, scope: !4463)
!4470 = !DILocation(line: 1395, column: 5, scope: !4463)
!4471 = !DILocation(line: 1398, column: 9, scope: !4472)
!4472 = distinct !DILexicalBlock(scope: !4444, file: !2, line: 1398, column: 8)
!4473 = !DILocation(line: 1398, column: 24, scope: !4472)
!4474 = !DILocation(line: 1398, column: 35, scope: !4472)
!4475 = !DILocation(line: 1398, column: 39, scope: !4472)
!4476 = !DILocation(line: 1398, column: 45, scope: !4472)
!4477 = !DILocation(line: 1398, column: 62, scope: !4472)
!4478 = !DILocation(line: 1399, column: 5, scope: !4472)
!4479 = !DILocation(line: 1401, column: 46, scope: !4444)
!4480 = !DILocation(line: 1401, column: 29, scope: !4444)
!4481 = !DILocation(line: 1401, column: 63, scope: !4444)
!4482 = !DILocation(line: 1401, column: 4, scope: !4444)
!4483 = !DILocation(line: 1401, column: 10, scope: !4444)
!4484 = !DILocation(line: 1401, column: 27, scope: !4444)
!4485 = !DILocation(line: 1403, column: 50, scope: !4444)
!4486 = !DILocation(line: 1403, column: 56, scope: !4444)
!4487 = !DILocation(line: 1403, column: 61, scope: !4444)
!4488 = !DILocation(line: 1403, column: 67, scope: !4444)
!4489 = !DILocation(line: 1403, column: 97, scope: !4444)
!4490 = !DILocation(line: 1403, column: 25, scope: !4444)
!4491 = !DILocation(line: 1403, column: 23, scope: !4444)
!4492 = !DILocation(line: 1404, column: 8, scope: !4493)
!4493 = distinct !DILexicalBlock(scope: !4444, file: !2, line: 1404, column: 8)
!4494 = !DILocation(line: 1404, column: 27, scope: !4493)
!4495 = !DILocation(line: 1406, column: 27, scope: !4496)
!4496 = distinct !DILexicalBlock(scope: !4493, file: !2, line: 1404, column: 39)
!4497 = !DILocation(line: 1406, column: 5, scope: !4496)
!4498 = !DILocation(line: 1407, column: 5, scope: !4496)
!4499 = !DILocation(line: 1407, column: 11, scope: !4496)
!4500 = !DILocation(line: 1407, column: 16, scope: !4496)
!4501 = !DILocation(line: 1408, column: 5, scope: !4496)
!4502 = !DILocation(line: 1408, column: 11, scope: !4496)
!4503 = !DILocation(line: 1408, column: 28, scope: !4496)
!4504 = !DILocation(line: 1409, column: 4, scope: !4496)
!4505 = !DILocation(line: 1411, column: 4, scope: !4444)
!4506 = !DILocation(line: 1416, column: 8, scope: !4507)
!4507 = distinct !DILexicalBlock(scope: !4444, file: !2, line: 1416, column: 8)
!4508 = !DILocation(line: 1416, column: 14, scope: !4507)
!4509 = !DILocation(line: 1416, column: 31, scope: !4507)
!4510 = !DILocation(line: 1417, column: 5, scope: !4511)
!4511 = distinct !DILexicalBlock(scope: !4507, file: !2, line: 1416, column: 36)
!4512 = !DILocation(line: 1417, column: 11, scope: !4511)
!4513 = !DILocation(line: 1417, column: 16, scope: !4511)
!4514 = !DILocation(line: 1418, column: 47, scope: !4511)
!4515 = !DILocation(line: 1418, column: 30, scope: !4511)
!4516 = !DILocation(line: 1418, column: 5, scope: !4511)
!4517 = !DILocation(line: 1418, column: 11, scope: !4511)
!4518 = !DILocation(line: 1418, column: 28, scope: !4511)
!4519 = !DILocation(line: 1419, column: 4, scope: !4511)
!4520 = !DILocation(line: 1419, column: 16, scope: !4521)
!4521 = distinct !DILexicalBlock(scope: !4507, file: !2, line: 1419, column: 15)
!4522 = !DILocation(line: 1419, column: 31, scope: !4521)
!4523 = !DILocation(line: 1419, column: 43, scope: !4521)
!4524 = !DILocation(line: 1419, column: 46, scope: !4521)
!4525 = !DILocation(line: 1419, column: 64, scope: !4521)
!4526 = !DILocation(line: 1419, column: 68, scope: !4521)
!4527 = !DILocation(line: 1419, column: 74, scope: !4521)
!4528 = !DILocation(line: 1419, column: 96, scope: !4521)
!4529 = !DILocation(line: 1420, column: 20, scope: !4530)
!4530 = distinct !DILexicalBlock(scope: !4521, file: !2, line: 1419, column: 121)
!4531 = !DILocation(line: 1420, column: 26, scope: !4530)
!4532 = !DILocation(line: 1420, column: 45, scope: !4530)
!4533 = !DILocation(line: 1420, column: 64, scope: !4530)
!4534 = !DILocation(line: 1420, column: 5, scope: !4530)
!4535 = !DILocation(line: 1421, column: 10, scope: !4536)
!4536 = distinct !DILexicalBlock(scope: !4530, file: !2, line: 1421, column: 9)
!4537 = !DILocation(line: 1421, column: 25, scope: !4536)
!4538 = !DILocation(line: 1421, column: 37, scope: !4536)
!4539 = !DILocation(line: 1421, column: 41, scope: !4536)
!4540 = !DILocation(line: 1421, column: 47, scope: !4536)
!4541 = !DILocation(line: 1421, column: 69, scope: !4536)
!4542 = !DILocalVariable(name: "aip", scope: !4543, file: !2, line: 1422, type: !3078)
!4543 = distinct !DILexicalBlock(scope: !4536, file: !2, line: 1421, column: 94)
!4544 = !DILocation(line: 1422, column: 17, scope: !4543)
!4545 = !DILocation(line: 1422, column: 24, scope: !4543)
!4546 = !DILocation(line: 1422, column: 30, scope: !4543)
!4547 = !DILocation(line: 1423, column: 12, scope: !4548)
!4548 = distinct !DILexicalBlock(scope: !4543, file: !2, line: 1423, column: 10)
!4549 = !DILocation(line: 1423, column: 17, scope: !4548)
!4550 = !DILocation(line: 1423, column: 32, scope: !4548)
!4551 = !DILocation(line: 1423, column: 37, scope: !4548)
!4552 = !DILocation(line: 1423, column: 41, scope: !4548)
!4553 = !DILocation(line: 1423, column: 46, scope: !4548)
!4554 = !DILocation(line: 1423, column: 55, scope: !4548)
!4555 = !DILocation(line: 1423, column: 63, scope: !4548)
!4556 = !DILocation(line: 1423, column: 68, scope: !4548)
!4557 = !DILocation(line: 1423, column: 73, scope: !4548)
!4558 = !DILocation(line: 1423, column: 91, scope: !4548)
!4559 = !DILocation(line: 1423, column: 96, scope: !4548)
!4560 = !DILocation(line: 1423, column: 107, scope: !4548)
!4561 = !DILocation(line: 1423, column: 88, scope: !4548)
!4562 = !DILocation(line: 1423, column: 111, scope: !4548)
!4563 = !DILocation(line: 1423, column: 115, scope: !4548)
!4564 = !DILocation(line: 1423, column: 120, scope: !4548)
!4565 = !DILocation(line: 1423, column: 129, scope: !4548)
!4566 = !DILocation(line: 1424, column: 7, scope: !4567)
!4567 = distinct !DILexicalBlock(scope: !4548, file: !2, line: 1423, column: 137)
!4568 = !DILocation(line: 1424, column: 13, scope: !4567)
!4569 = !DILocation(line: 1424, column: 35, scope: !4567)
!4570 = !DILocation(line: 1425, column: 29, scope: !4567)
!4571 = !DILocation(line: 1425, column: 39, scope: !4567)
!4572 = !DILocation(line: 1425, column: 54, scope: !4567)
!4573 = !DILocation(line: 1425, column: 7, scope: !4567)
!4574 = !DILocation(line: 1428, column: 11, scope: !4575)
!4575 = distinct !DILexicalBlock(scope: !4567, file: !2, line: 1428, column: 11)
!4576 = !DILocation(line: 1428, column: 16, scope: !4575)
!4577 = !DILocation(line: 1428, column: 28, scope: !4575)
!4578 = !DILocation(line: 1430, column: 30, scope: !4579)
!4579 = distinct !DILexicalBlock(scope: !4575, file: !2, line: 1428, column: 33)
!4580 = !DILocation(line: 1430, column: 8, scope: !4579)
!4581 = !DILocation(line: 1431, column: 7, scope: !4579)
!4582 = !DILocation(line: 1431, column: 18, scope: !4583)
!4583 = distinct !DILexicalBlock(scope: !4575, file: !2, line: 1431, column: 18)
!4584 = !DILocation(line: 1431, column: 24, scope: !4583)
!4585 = !DILocation(line: 1431, column: 31, scope: !4583)
!4586 = !DILocation(line: 1431, column: 48, scope: !4583)
!4587 = !DILocation(line: 1431, column: 54, scope: !4583)
!4588 = !DILocation(line: 1431, column: 37, scope: !4583)
!4589 = !DILocation(line: 1431, column: 58, scope: !4583)
!4590 = !DILocation(line: 1431, column: 35, scope: !4583)
!4591 = !DILocation(line: 1433, column: 12, scope: !4592)
!4592 = distinct !DILexicalBlock(scope: !4593, file: !2, line: 1433, column: 12)
!4593 = distinct !DILexicalBlock(scope: !4583, file: !2, line: 1431, column: 68)
!4594 = !DILocation(line: 1433, column: 17, scope: !4592)
!4595 = !DILocation(line: 1433, column: 29, scope: !4592)
!4596 = !DILocation(line: 1434, column: 31, scope: !4597)
!4597 = distinct !DILexicalBlock(scope: !4592, file: !2, line: 1433, column: 34)
!4598 = !DILocation(line: 1434, column: 9, scope: !4597)
!4599 = !DILocation(line: 1435, column: 8, scope: !4597)
!4600 = !DILocation(line: 1436, column: 7, scope: !4593)
!4601 = !DILocation(line: 1438, column: 7, scope: !4567)
!4602 = !DILocation(line: 1438, column: 13, scope: !4567)
!4603 = !DILocation(line: 1438, column: 18, scope: !4567)
!4604 = !DILocation(line: 1440, column: 6, scope: !4567)
!4605 = !DILocation(line: 1441, column: 5, scope: !4543)
!4606 = !DILocation(line: 1442, column: 6, scope: !4536)
!4607 = !DILocation(line: 1442, column: 12, scope: !4536)
!4608 = !DILocation(line: 1442, column: 17, scope: !4536)
!4609 = !DILocation(line: 1444, column: 4, scope: !4530)
!4610 = !DILocation(line: 1446, column: 4, scope: !4444)
!4611 = !DILocation(line: 1454, column: 8, scope: !4612)
!4612 = distinct !DILexicalBlock(scope: !4444, file: !2, line: 1454, column: 8)
!4613 = !DILocation(line: 1454, column: 14, scope: !4612)
!4614 = !DILocation(line: 1454, column: 36, scope: !4612)
!4615 = !DILocation(line: 1455, column: 5, scope: !4616)
!4616 = distinct !DILexicalBlock(scope: !4612, file: !2, line: 1454, column: 60)
!4617 = !DILocation(line: 1455, column: 11, scope: !4616)
!4618 = !DILocation(line: 1455, column: 33, scope: !4616)
!4619 = !DILocation(line: 1456, column: 9, scope: !4620)
!4620 = distinct !DILexicalBlock(scope: !4616, file: !2, line: 1456, column: 9)
!4621 = !DILocation(line: 1456, column: 18, scope: !4620)
!4622 = !DILocation(line: 1458, column: 28, scope: !4623)
!4623 = distinct !DILexicalBlock(scope: !4620, file: !2, line: 1456, column: 26)
!4624 = !DILocation(line: 1458, column: 38, scope: !4623)
!4625 = !DILocation(line: 1458, column: 53, scope: !4623)
!4626 = !DILocation(line: 1458, column: 6, scope: !4623)
!4627 = !DILocation(line: 1459, column: 70, scope: !4623)
!4628 = !DILocation(line: 1459, column: 53, scope: !4623)
!4629 = !DILocation(line: 1459, column: 87, scope: !4623)
!4630 = !DILocation(line: 1459, column: 20, scope: !4623)
!4631 = !DILocation(line: 1459, column: 24, scope: !4623)
!4632 = !DILocation(line: 1459, column: 6, scope: !4623)
!4633 = !DILocation(line: 1459, column: 34, scope: !4623)
!4634 = !DILocation(line: 1459, column: 51, scope: !4623)
!4635 = !DILocation(line: 1460, column: 20, scope: !4623)
!4636 = !DILocation(line: 1460, column: 24, scope: !4623)
!4637 = !DILocation(line: 1460, column: 6, scope: !4623)
!4638 = !DILocation(line: 1460, column: 34, scope: !4623)
!4639 = !DILocation(line: 1460, column: 39, scope: !4623)
!4640 = !DILocation(line: 1461, column: 5, scope: !4623)
!4641 = !DILocation(line: 1462, column: 4, scope: !4616)
!4642 = !DILocation(line: 1462, column: 15, scope: !4643)
!4643 = distinct !DILexicalBlock(scope: !4612, file: !2, line: 1462, column: 15)
!4644 = !DILocation(line: 1462, column: 21, scope: !4643)
!4645 = !DILocation(line: 1462, column: 38, scope: !4643)
!4646 = !DILocation(line: 1464, column: 5, scope: !4647)
!4647 = distinct !DILexicalBlock(scope: !4643, file: !2, line: 1462, column: 43)
!4648 = !DILocation(line: 1464, column: 11, scope: !4647)
!4649 = !DILocation(line: 1464, column: 28, scope: !4647)
!4650 = !DILocation(line: 1465, column: 27, scope: !4647)
!4651 = !DILocation(line: 1465, column: 5, scope: !4647)
!4652 = !DILocation(line: 1466, column: 5, scope: !4647)
!4653 = !DILocation(line: 1466, column: 11, scope: !4647)
!4654 = !DILocation(line: 1466, column: 16, scope: !4647)
!4655 = !DILocation(line: 1468, column: 4, scope: !4647)
!4656 = !DILocation(line: 1469, column: 9, scope: !4657)
!4657 = distinct !DILexicalBlock(scope: !4658, file: !2, line: 1469, column: 9)
!4658 = distinct !DILexicalBlock(scope: !4643, file: !2, line: 1468, column: 11)
!4659 = !DILocation(line: 1469, column: 27, scope: !4657)
!4660 = !DILocation(line: 1469, column: 31, scope: !4657)
!4661 = !DILocation(line: 1469, column: 46, scope: !4657)
!4662 = !DILocation(line: 1472, column: 10, scope: !4663)
!4663 = distinct !DILexicalBlock(scope: !4664, file: !2, line: 1472, column: 10)
!4664 = distinct !DILexicalBlock(scope: !4657, file: !2, line: 1469, column: 59)
!4665 = !DILocation(line: 1472, column: 25, scope: !4663)
!4666 = !DILocalVariable(name: "dot", scope: !4667, file: !2, line: 1473, type: !90)
!4667 = distinct !DILexicalBlock(scope: !4663, file: !2, line: 1472, column: 36)
!4668 = !DILocation(line: 1473, column: 11, scope: !4667)
!4669 = !DILocation(line: 1473, column: 17, scope: !4667)
!4670 = !DILocation(line: 1474, column: 11, scope: !4671)
!4671 = distinct !DILexicalBlock(scope: !4667, file: !2, line: 1474, column: 11)
!4672 = !DILocation(line: 1474, column: 15, scope: !4671)
!4673 = !DILocation(line: 1475, column: 30, scope: !4674)
!4674 = distinct !DILexicalBlock(scope: !4671, file: !2, line: 1474, column: 26)
!4675 = !DILocation(line: 1475, column: 40, scope: !4674)
!4676 = !DILocation(line: 1475, column: 55, scope: !4674)
!4677 = !DILocation(line: 1475, column: 8, scope: !4674)
!4678 = !DILocation(line: 1476, column: 72, scope: !4674)
!4679 = !DILocation(line: 1476, column: 55, scope: !4674)
!4680 = !DILocation(line: 1476, column: 89, scope: !4674)
!4681 = !DILocation(line: 1476, column: 22, scope: !4674)
!4682 = !DILocation(line: 1476, column: 26, scope: !4674)
!4683 = !DILocation(line: 1476, column: 8, scope: !4674)
!4684 = !DILocation(line: 1476, column: 36, scope: !4674)
!4685 = !DILocation(line: 1476, column: 53, scope: !4674)
!4686 = !DILocation(line: 1477, column: 22, scope: !4674)
!4687 = !DILocation(line: 1477, column: 26, scope: !4674)
!4688 = !DILocation(line: 1477, column: 8, scope: !4674)
!4689 = !DILocation(line: 1477, column: 36, scope: !4674)
!4690 = !DILocation(line: 1477, column: 41, scope: !4674)
!4691 = !DILocation(line: 1478, column: 7, scope: !4674)
!4692 = !DILocation(line: 1479, column: 6, scope: !4667)
!4693 = !DILocation(line: 1480, column: 29, scope: !4664)
!4694 = !DILocation(line: 1480, column: 44, scope: !4664)
!4695 = !DILocation(line: 1480, column: 6, scope: !4664)
!4696 = !DILocation(line: 1481, column: 26, scope: !4664)
!4697 = !DILocation(line: 1481, column: 32, scope: !4664)
!4698 = !DILocation(line: 1481, column: 6, scope: !4664)
!4699 = !DILocation(line: 1482, column: 5, scope: !4664)
!4700 = !DILocalVariable(name: "aip", scope: !4701, file: !2, line: 1483, type: !3078)
!4701 = distinct !DILexicalBlock(scope: !4657, file: !2, line: 1482, column: 12)
!4702 = !DILocation(line: 1483, column: 17, scope: !4701)
!4703 = !DILocation(line: 1483, column: 24, scope: !4701)
!4704 = !DILocation(line: 1483, column: 30, scope: !4701)
!4705 = !DILocation(line: 1485, column: 11, scope: !4706)
!4706 = distinct !DILexicalBlock(scope: !4701, file: !2, line: 1485, column: 10)
!4707 = !DILocation(line: 1485, column: 16, scope: !4706)
!4708 = !DILocation(line: 1485, column: 28, scope: !4706)
!4709 = !DILocation(line: 1485, column: 33, scope: !4706)
!4710 = !DILocation(line: 1485, column: 38, scope: !4706)
!4711 = !DILocation(line: 1485, column: 49, scope: !4706)
!4712 = !DILocation(line: 1485, column: 57, scope: !4706)
!4713 = !DILocation(line: 1486, column: 22, scope: !4714)
!4714 = distinct !DILexicalBlock(scope: !4706, file: !2, line: 1485, column: 64)
!4715 = !DILocation(line: 1486, column: 28, scope: !4714)
!4716 = !DILocation(line: 1486, column: 47, scope: !4714)
!4717 = !DILocation(line: 1486, column: 66, scope: !4714)
!4718 = !DILocation(line: 1486, column: 7, scope: !4714)
!4719 = !DILocation(line: 1487, column: 7, scope: !4714)
!4720 = !DILocation(line: 1487, column: 13, scope: !4714)
!4721 = !DILocation(line: 1487, column: 18, scope: !4714)
!4722 = !DILocation(line: 1488, column: 6, scope: !4714)
!4723 = !DILocation(line: 1491, column: 4, scope: !4444)
!4724 = !DILocation(line: 1494, column: 4, scope: !4444)
!4725 = !DILocation(line: 1496, column: 4, scope: !4444)
!4726 = !DILocation(line: 1496, column: 10, scope: !4444)
!4727 = !DILocation(line: 1496, column: 15, scope: !4444)
!4728 = !DILocation(line: 1497, column: 4, scope: !4444)
!4729 = !DILocation(line: 1497, column: 10, scope: !4444)
!4730 = !DILocation(line: 1497, column: 27, scope: !4444)
!4731 = !DILocation(line: 1498, column: 4, scope: !4444)
!4732 = !DILocation(line: 1501, column: 1, scope: !4389)
!4733 = distinct !DISubprogram(name: "init_thief_for_level", linkageName: "_Z20init_thief_for_levelv", scope: !2, file: !2, line: 1735, type: !946, scopeLine: 1736, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !72, retainedNodes: !1669)
!4734 = !DILocalVariable(name: "i", scope: !4733, file: !2, line: 1737, type: !77)
!4735 = !DILocation(line: 1737, column: 6, scope: !4733)
!4736 = !DILocation(line: 1739, column: 8, scope: !4737)
!4737 = distinct !DILexicalBlock(scope: !4733, file: !2, line: 1739, column: 2)
!4738 = !DILocation(line: 1739, column: 7, scope: !4737)
!4739 = !DILocation(line: 1739, column: 12, scope: !4740)
!4740 = distinct !DILexicalBlock(scope: !4737, file: !2, line: 1739, column: 2)
!4741 = !DILocation(line: 1739, column: 13, scope: !4740)
!4742 = !DILocation(line: 1739, column: 2, scope: !4737)
!4743 = !DILocation(line: 1740, column: 16, scope: !4740)
!4744 = !DILocation(line: 1740, column: 3, scope: !4740)
!4745 = !DILocation(line: 1740, column: 19, scope: !4740)
!4746 = !DILocation(line: 1739, column: 33, scope: !4740)
!4747 = !DILocation(line: 1739, column: 2, scope: !4740)
!4748 = distinct !{!4748, !4742, !4749, !1697}
!4749 = !DILocation(line: 1740, column: 21, scope: !4737)
!4750 = !DILocation(line: 1742, column: 2, scope: !4733)
!4751 = !DILocation(line: 1744, column: 10, scope: !4752)
!4752 = distinct !DILexicalBlock(scope: !4733, file: !2, line: 1744, column: 8)
!4753 = !DILocation(line: 1744, column: 20, scope: !4752)
!4754 = !DILocation(line: 1744, column: 9, scope: !4752)
!4755 = !DILocation(line: 1744, column: 8, scope: !4752)
!4756 = !DILocation(line: 1745, column: 9, scope: !4757)
!4757 = distinct !DILexicalBlock(scope: !4752, file: !2, line: 1745, column: 3)
!4758 = !DILocation(line: 1745, column: 8, scope: !4757)
!4759 = !DILocation(line: 1745, column: 13, scope: !4760)
!4760 = distinct !DILexicalBlock(scope: !4757, file: !2, line: 1745, column: 3)
!4761 = !DILocation(line: 1745, column: 14, scope: !4760)
!4762 = !DILocation(line: 1745, column: 3, scope: !4757)
!4763 = !DILocation(line: 1746, column: 19, scope: !4764)
!4764 = distinct !DILexicalBlock(scope: !4760, file: !2, line: 1745, column: 23)
!4765 = !DILocation(line: 1746, column: 18, scope: !4764)
!4766 = !DILocation(line: 1746, column: 4, scope: !4764)
!4767 = !DILocation(line: 1746, column: 22, scope: !4764)
!4768 = !DILocation(line: 1747, column: 19, scope: !4764)
!4769 = !DILocation(line: 1747, column: 18, scope: !4764)
!4770 = !DILocation(line: 1747, column: 20, scope: !4764)
!4771 = !DILocation(line: 1747, column: 4, scope: !4764)
!4772 = !DILocation(line: 1747, column: 24, scope: !4764)
!4773 = !DILocation(line: 1748, column: 3, scope: !4764)
!4774 = !DILocation(line: 1745, column: 19, scope: !4760)
!4775 = !DILocation(line: 1745, column: 3, scope: !4760)
!4776 = distinct !{!4776, !4762, !4777, !1697}
!4777 = !DILocation(line: 1748, column: 3, scope: !4757)
!4778 = !DILocation(line: 1750, column: 20, scope: !4733)
!4779 = !DILocation(line: 1751, column: 1, scope: !4733)
!4780 = distinct !DISubprogram(name: "maybe_steal_flag_item", linkageName: "_Z21maybe_steal_flag_itemii", scope: !2, file: !2, line: 1505, type: !1710, scopeLine: 1506, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !72, retainedNodes: !1669)
!4781 = !DILocalVariable(name: "player_num", arg: 1, scope: !4780, file: !2, line: 1505, type: !77)
!4782 = !DILocation(line: 1505, column: 31, scope: !4780)
!4783 = !DILocalVariable(name: "flagval", arg: 2, scope: !4780, file: !2, line: 1505, type: !77)
!4784 = !DILocation(line: 1505, column: 47, scope: !4780)
!4785 = !DILocation(line: 1507, column: 14, scope: !4786)
!4786 = distinct !DILexicalBlock(scope: !4780, file: !2, line: 1507, column: 6)
!4787 = !DILocation(line: 1507, column: 6, scope: !4786)
!4788 = !DILocation(line: 1507, column: 26, scope: !4786)
!4789 = !DILocation(line: 1507, column: 34, scope: !4786)
!4790 = !DILocation(line: 1507, column: 32, scope: !4786)
!4791 = !DILocation(line: 1508, column: 7, scope: !4792)
!4792 = distinct !DILexicalBlock(scope: !4793, file: !2, line: 1508, column: 7)
!4793 = distinct !DILexicalBlock(scope: !4786, file: !2, line: 1507, column: 43)
!4794 = !DILocation(line: 1508, column: 16, scope: !4792)
!4795 = !DILocalVariable(name: "powerup_index", scope: !4796, file: !2, line: 1509, type: !77)
!4796 = distinct !DILexicalBlock(scope: !4792, file: !2, line: 1508, column: 37)
!4797 = !DILocation(line: 1509, column: 8, scope: !4796)
!4798 = !DILocation(line: 1510, column: 35, scope: !4796)
!4799 = !DILocation(line: 1510, column: 34, scope: !4796)
!4800 = !DILocation(line: 1510, column: 12, scope: !4796)
!4801 = !DILocation(line: 1510, column: 4, scope: !4796)
!4802 = !DILocation(line: 1510, column: 24, scope: !4796)
!4803 = !DILocation(line: 1510, column: 30, scope: !4796)
!4804 = !DILocation(line: 1512, column: 12, scope: !4796)
!4805 = !DILocation(line: 1512, column: 4, scope: !4796)
!4806 = !DILocation(line: 1514, column: 20, scope: !4807)
!4807 = distinct !DILexicalBlock(scope: !4796, file: !2, line: 1512, column: 21)
!4808 = !DILocation(line: 1515, column: 6, scope: !4807)
!4809 = !DILocation(line: 1516, column: 6, scope: !4807)
!4810 = !DILocation(line: 1518, column: 20, scope: !4807)
!4811 = !DILocation(line: 1519, column: 6, scope: !4807)
!4812 = !DILocation(line: 1520, column: 6, scope: !4807)
!4813 = !DILocation(line: 1522, column: 20, scope: !4807)
!4814 = !DILocation(line: 1523, column: 6, scope: !4807)
!4815 = !DILocation(line: 1524, column: 6, scope: !4807)
!4816 = !DILocation(line: 1526, column: 20, scope: !4807)
!4817 = !DILocation(line: 1527, column: 6, scope: !4807)
!4818 = !DILocation(line: 1528, column: 6, scope: !4807)
!4819 = !DILocation(line: 1530, column: 20, scope: !4807)
!4820 = !DILocation(line: 1531, column: 6, scope: !4807)
!4821 = !DILocation(line: 1532, column: 6, scope: !4807)
!4822 = !DILocation(line: 1538, column: 20, scope: !4807)
!4823 = !DILocation(line: 1539, column: 6, scope: !4807)
!4824 = !DILocation(line: 1540, column: 6, scope: !4807)
!4825 = !DILocation(line: 1542, column: 20, scope: !4807)
!4826 = !DILocation(line: 1543, column: 6, scope: !4807)
!4827 = !DILocation(line: 1544, column: 16, scope: !4807)
!4828 = !DILocation(line: 1544, column: 8, scope: !4807)
!4829 = !DILocation(line: 1544, column: 28, scope: !4807)
!4830 = !DILocation(line: 1544, column: 34, scope: !4807)
!4831 = !DILocation(line: 1545, column: 6, scope: !4807)
!4832 = !DILocation(line: 1547, column: 4, scope: !4796)
!4833 = !DILocation(line: 1548, column: 38, scope: !4796)
!4834 = !DILocation(line: 1548, column: 17, scope: !4796)
!4835 = !DILocation(line: 1548, column: 4, scope: !4796)
!4836 = !DILocation(line: 1548, column: 36, scope: !4796)
!4837 = !DILocation(line: 1550, column: 4, scope: !4796)
!4838 = !DILocation(line: 1551, column: 4, scope: !4796)
!4839 = !DILocation(line: 1553, column: 2, scope: !4793)
!4840 = !DILocation(line: 1555, column: 2, scope: !4780)
!4841 = !DILocation(line: 1556, column: 1, scope: !4780)
!4842 = distinct !DISubprogram(name: "maybe_steal_secondary_weapon", linkageName: "_Z28maybe_steal_secondary_weaponii", scope: !2, file: !2, line: 1559, type: !1710, scopeLine: 1560, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !72, retainedNodes: !1669)
!4843 = !DILocalVariable(name: "player_num", arg: 1, scope: !4842, file: !2, line: 1559, type: !77)
!4844 = !DILocation(line: 1559, column: 38, scope: !4842)
!4845 = !DILocalVariable(name: "weapon_num", arg: 2, scope: !4842, file: !2, line: 1559, type: !77)
!4846 = !DILocation(line: 1559, column: 54, scope: !4842)
!4847 = !DILocation(line: 1561, column: 15, scope: !4848)
!4848 = distinct !DILexicalBlock(scope: !4842, file: !2, line: 1561, column: 6)
!4849 = !DILocation(line: 1561, column: 7, scope: !4848)
!4850 = !DILocation(line: 1561, column: 27, scope: !4848)
!4851 = !DILocation(line: 1561, column: 52, scope: !4848)
!4852 = !DILocation(line: 1561, column: 50, scope: !4848)
!4853 = !DILocation(line: 1561, column: 6, scope: !4848)
!4854 = !DILocation(line: 1561, column: 74, scope: !4848)
!4855 = !DILocation(line: 1561, column: 85, scope: !4848)
!4856 = !DILocation(line: 1561, column: 77, scope: !4848)
!4857 = !DILocation(line: 1561, column: 97, scope: !4848)
!4858 = !DILocation(line: 1561, column: 112, scope: !4848)
!4859 = !DILocation(line: 1562, column: 7, scope: !4860)
!4860 = distinct !DILexicalBlock(scope: !4848, file: !2, line: 1562, column: 7)
!4861 = !DILocation(line: 1562, column: 16, scope: !4860)
!4862 = !DILocation(line: 1563, column: 8, scope: !4863)
!4863 = distinct !DILexicalBlock(scope: !4864, file: !2, line: 1563, column: 8)
!4864 = distinct !DILexicalBlock(scope: !4860, file: !2, line: 1562, column: 37)
!4865 = !DILocation(line: 1563, column: 19, scope: !4863)
!4866 = !DILocation(line: 1564, column: 9, scope: !4867)
!4867 = distinct !DILexicalBlock(scope: !4863, file: !2, line: 1564, column: 9)
!4868 = !DILocation(line: 1564, column: 18, scope: !4867)
!4869 = !DILocation(line: 1565, column: 6, scope: !4867)
!4870 = !DILocation(line: 1564, column: 20, scope: !4867)
!4871 = !DILocation(line: 1566, column: 12, scope: !4864)
!4872 = !DILocation(line: 1566, column: 4, scope: !4864)
!4873 = !DILocation(line: 1566, column: 24, scope: !4864)
!4874 = !DILocation(line: 1566, column: 39, scope: !4864)
!4875 = !DILocation(line: 1566, column: 50, scope: !4864)
!4876 = !DILocation(line: 1569, column: 9, scope: !4877)
!4877 = distinct !DILexicalBlock(scope: !4864, file: !2, line: 1569, column: 8)
!4878 = !DILocation(line: 1569, column: 20, scope: !4877)
!4879 = !DILocation(line: 1569, column: 40, scope: !4877)
!4880 = !DILocation(line: 1569, column: 44, scope: !4877)
!4881 = !DILocation(line: 1569, column: 55, scope: !4877)
!4882 = !DILocation(line: 1570, column: 67, scope: !4883)
!4883 = distinct !DILexicalBlock(scope: !4877, file: !2, line: 1569, column: 77)
!4884 = !DILocation(line: 1570, column: 39, scope: !4883)
!4885 = !DILocation(line: 1570, column: 18, scope: !4883)
!4886 = !DILocation(line: 1570, column: 5, scope: !4883)
!4887 = !DILocation(line: 1570, column: 37, scope: !4883)
!4888 = !DILocation(line: 1571, column: 4, scope: !4883)
!4889 = !DILocation(line: 1573, column: 48, scope: !4864)
!4890 = !DILocation(line: 1573, column: 47, scope: !4864)
!4891 = !DILocation(line: 1573, column: 44, scope: !4864)
!4892 = !DILocation(line: 1573, column: 32, scope: !4864)
!4893 = !DILocation(line: 1573, column: 4, scope: !4864)
!4894 = !DILocation(line: 1574, column: 16, scope: !4895)
!4895 = distinct !DILexicalBlock(scope: !4864, file: !2, line: 1574, column: 8)
!4896 = !DILocation(line: 1574, column: 8, scope: !4895)
!4897 = !DILocation(line: 1574, column: 28, scope: !4895)
!4898 = !DILocation(line: 1574, column: 43, scope: !4895)
!4899 = !DILocation(line: 1574, column: 55, scope: !4895)
!4900 = !DILocation(line: 1575, column: 5, scope: !4895)
!4901 = !DILocation(line: 1578, column: 4, scope: !4864)
!4902 = !DILocation(line: 1579, column: 4, scope: !4864)
!4903 = !DILocation(line: 1562, column: 18, scope: !4860)
!4904 = !DILocation(line: 1582, column: 2, scope: !4842)
!4905 = !DILocation(line: 1583, column: 1, scope: !4842)
!4906 = distinct !DISubprogram(name: "operator[]", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em", scope: !4908, file: !4907, line: 402, type: !5108, scopeLine: 402, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !72, declaration: !5107, retainedNodes: !1669)
!4907 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__vector/vector.h", directory: "")
!4908 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "vector<char *, std::__1::allocator<char *> >", scope: !366, file: !4907, line: 86, size: 192, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !4909, templateParams: !5257, identifier: "_ZTSNSt3__16vectorIPcNS_9allocatorIS1_EEEE")
!4909 = !{!4910, !4981, !4982, !4983, !4989, !4991, !4995, !4999, !5004, !5008, !5011, !5017, !5018, !5023, !5033, !5037, !5042, !5045, !5048, !5052, !5055, !5058, !5062, !5063, !5067, !5073, !5078, !5079, !5080, !5086, !5091, !5092, !5093, !5094, !5095, !5096, !5097, !5100, !5101, !5104, !5105, !5106, !5107, !5112, !5115, !5116, !5117, !5120, !5123, !5124, !5125, !5129, !5133, !5136, !5140, !5141, !5144, !5147, !5150, !5153, !5156, !5159, !5160, !5161, !5162, !5165, !5166, !5167, !5168, !5171, !5172, !5173, !5174, !5175, !5178, !5183, !5189, !5192, !5195, !5214, !5230, !5233, !5236, !5239, !5242, !5243, !5244, !5245, !5246, !5247, !5248, !5249, !5252, !5255, !5256}
!4910 = !DIDerivedType(tag: DW_TAG_member, name: "__begin_", scope: !4908, file: !4907, line: 548, baseType: !4911, size: 64)
!4911 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !4908, file: !4907, line: 102, baseType: !4912, flags: DIFlagPublic)
!4912 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !4914, file: !4913, line: 241, baseType: !4949)
!4913 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__memory/allocator_traits.h", directory: "")
!4914 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "allocator_traits<std::__1::allocator<char *> >", scope: !366, file: !4913, line: 238, size: 8, flags: DIFlagTypePassByValue, elements: !4915, templateParams: !4979, identifier: "_ZTSNSt3__116allocator_traitsINS_9allocatorIPcEEEE")
!4915 = !{!4916, !4976}
!4916 = !DISubprogram(name: "allocate", linkageName: "_ZNSt3__116allocator_traitsINS_9allocatorIPcEEE8allocateB8ne200100ERS3_m", scope: !4914, file: !4913, line: 269, type: !4917, scopeLine: 269, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!4917 = !DISubroutineType(types: !4918)
!4918 = !{!4912, !4919, !4974}
!4919 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !4920, size: 64)
!4920 = !DIDerivedType(tag: DW_TAG_typedef, name: "allocator_type", scope: !4914, file: !4913, line: 239, baseType: !4921)
!4921 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "allocator<char *>", scope: !366, file: !4922, line: 80, size: 8, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !4923, templateParams: !4972, identifier: "_ZTSNSt3__19allocatorIPcEE")
!4922 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__memory/allocator.h", directory: "")
!4923 = !{!4924, !4934, !4938, !4943, !4946, !4954, !4962, !4965, !4969}
!4924 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !4921, baseType: !4925, extraData: i32 0)
!4925 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__non_trivial_if<true, std::__1::allocator<char *> >", scope: !366, file: !4922, line: 70, size: 8, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !4926, templateParams: !4931, identifier: "_ZTSNSt3__116__non_trivial_ifILb1ENS_9allocatorIPcEEEE")
!4926 = !{!4927}
!4927 = !DISubprogram(name: "__non_trivial_if", scope: !4925, file: !4922, line: 71, type: !4928, scopeLine: 71, flags: DIFlagPrototyped, spFlags: 0)
!4928 = !DISubroutineType(types: !4929)
!4929 = !{null, !4930}
!4930 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4925, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!4931 = !{!4932, !4933}
!4932 = !DITemplateValueParameter(name: "_Cond", type: !1033, value: i8 1)
!4933 = !DITemplateTypeParameter(name: "_Unique", type: !4921)
!4934 = !DISubprogram(name: "allocator", scope: !4921, file: !4922, line: 93, type: !4935, scopeLine: 93, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4935 = !DISubroutineType(types: !4936)
!4936 = !{null, !4937}
!4937 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4921, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!4938 = !DISubprogram(name: "allocate", linkageName: "_ZNSt3__19allocatorIPcE8allocateB8ne200100Em", scope: !4921, file: !4922, line: 98, type: !4939, scopeLine: 98, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4939 = !DISubroutineType(types: !4940)
!4940 = !{!893, !4937, !4941}
!4941 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", scope: !366, file: !4942, line: 20, baseType: !436)
!4942 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__cstddef/size_t.h", directory: "")
!4943 = !DISubprogram(name: "deallocate", linkageName: "_ZNSt3__19allocatorIPcE10deallocateB8ne200100EPS1_m", scope: !4921, file: !4922, line: 116, type: !4944, scopeLine: 116, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4944 = !DISubroutineType(types: !4945)
!4945 = !{null, !4937, !893, !4941}
!4946 = !DISubprogram(name: "address", linkageName: "_ZNKSt3__19allocatorIPcE7addressB8ne200100ERS1_", scope: !4921, file: !4922, line: 136, type: !4947, scopeLine: 136, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4947 = !DISubroutineType(types: !4948)
!4948 = !{!4949, !4950, !4952}
!4949 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !4921, file: !4922, line: 126, baseType: !893, flags: DIFlagPublic)
!4950 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4951, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!4951 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4921)
!4952 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !4921, file: !4922, line: 128, baseType: !4953, flags: DIFlagPublic)
!4953 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !574, size: 64)
!4954 = !DISubprogram(name: "address", linkageName: "_ZNKSt3__19allocatorIPcE7addressB8ne200100ERKS1_", scope: !4921, file: !4922, line: 139, type: !4955, scopeLine: 139, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4955 = !DISubroutineType(types: !4956)
!4956 = !{!4957, !4950, !4960}
!4957 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !4921, file: !4922, line: 127, baseType: !4958, flags: DIFlagPublic)
!4958 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4959, size: 64)
!4959 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !574)
!4960 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !4921, file: !4922, line: 129, baseType: !4961, flags: DIFlagPublic)
!4961 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !4959, size: 64)
!4962 = !DISubprogram(name: "allocate", linkageName: "_ZNSt3__19allocatorIPcE8allocateB8ne200100EmPKv", scope: !4921, file: !4922, line: 143, type: !4963, scopeLine: 143, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4963 = !DISubroutineType(types: !4964)
!4964 = !{!893, !4937, !4941, !969}
!4965 = !DISubprogram(name: "max_size", linkageName: "_ZNKSt3__19allocatorIPcE8max_sizeB8ne200100Ev", scope: !4921, file: !4922, line: 147, type: !4966, scopeLine: 147, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4966 = !DISubroutineType(types: !4967)
!4967 = !{!4968, !4950}
!4968 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", file: !4922, line: 85, baseType: !4941, flags: DIFlagPublic)
!4969 = !DISubprogram(name: "destroy", linkageName: "_ZNSt3__19allocatorIPcE7destroyB8ne200100EPS1_", scope: !4921, file: !4922, line: 156, type: !4970, scopeLine: 156, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4970 = !DISubroutineType(types: !4971)
!4971 = !{null, !4937, !4949}
!4972 = !{!4973}
!4973 = !DITemplateTypeParameter(name: "_Tp", type: !574)
!4974 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !4914, file: !4913, line: 246, baseType: !4975)
!4975 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !4921, file: !4922, line: 85, baseType: !4941, flags: DIFlagPublic)
!4976 = !DISubprogram(name: "deallocate", linkageName: "_ZNSt3__116allocator_traitsINS_9allocatorIPcEEE10deallocateB8ne200100ERS3_PS2_m", scope: !4914, file: !4913, line: 301, type: !4977, scopeLine: 301, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!4977 = !DISubroutineType(types: !4978)
!4978 = !{null, !4919, !4912, !4974}
!4979 = !{!4980}
!4980 = !DITemplateTypeParameter(name: "_Alloc", type: !4921)
!4981 = !DIDerivedType(tag: DW_TAG_member, name: "__end_", scope: !4908, file: !4907, line: 549, baseType: !4911, size: 64, offset: 64)
!4982 = !DIDerivedType(tag: DW_TAG_member, name: "__cap_", scope: !4908, file: !4907, line: 550, baseType: !4911, size: 64, align: 8, offset: 128)
!4983 = !DIDerivedType(tag: DW_TAG_member, name: "__padding1_550_", scope: !4908, file: !4907, line: 550, baseType: !4984, size: 8)
!4984 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "__compressed_pair_padding<char **, true>", scope: !366, file: !4985, line: 74, size: 8, flags: DIFlagTypePassByValue, elements: !1669, templateParams: !4986, identifier: "_ZTSNSt3__125__compressed_pair_paddingIPPcLb1EEE")
!4985 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__memory/compressed_pair.h", directory: "")
!4986 = !{!4987, !4988}
!4987 = !DITemplateTypeParameter(name: "_ToPad", type: !893)
!4988 = !DITemplateValueParameter(name: "_Empty", type: !1033, defaulted: true, value: i8 1)
!4989 = !DIDerivedType(tag: DW_TAG_member, name: "__alloc_", scope: !4908, file: !4907, line: 550, baseType: !4990, size: 8)
!4990 = !DIDerivedType(tag: DW_TAG_typedef, name: "allocator_type", scope: !4908, file: !4907, line: 96, baseType: !4921, flags: DIFlagPublic)
!4991 = !DIDerivedType(tag: DW_TAG_member, name: "__padding2_550_", scope: !4908, file: !4907, line: 550, baseType: !4992, size: 8)
!4992 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "__compressed_pair_padding<std::__1::allocator<char *>, true>", scope: !366, file: !4985, line: 74, size: 8, flags: DIFlagTypePassByValue, elements: !1669, templateParams: !4993, identifier: "_ZTSNSt3__125__compressed_pair_paddingINS_9allocatorIPcEELb1EEE")
!4993 = !{!4994, !4988}
!4994 = !DITemplateTypeParameter(name: "_ToPad", type: !4921)
!4995 = !DISubprogram(name: "vector", scope: !4908, file: !4907, line: 133, type: !4996, scopeLine: 133, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!4996 = !DISubroutineType(types: !4997)
!4997 = !{null, !4998}
!4998 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4908, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!4999 = !DISubprogram(name: "vector", scope: !4908, file: !4907, line: 135, type: !5000, scopeLine: 135, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: 0)
!5000 = !DISubroutineType(types: !5001)
!5001 = !{null, !4998, !5002}
!5002 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !5003, size: 64)
!5003 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4990)
!5004 = !DISubprogram(name: "vector", scope: !4908, file: !4907, line: 144, type: !5005, scopeLine: 144, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: 0)
!5005 = !DISubroutineType(types: !5006)
!5006 = !{null, !4998, !5007}
!5007 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !4908, file: !4907, line: 100, baseType: !4974, flags: DIFlagPublic)
!5008 = !DISubprogram(name: "vector", scope: !4908, file: !4907, line: 154, type: !5009, scopeLine: 154, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: 0)
!5009 = !DISubroutineType(types: !5010)
!5010 = !{null, !4998, !5007, !5002}
!5011 = !DISubprogram(name: "vector", scope: !4908, file: !4907, line: 165, type: !5012, scopeLine: 165, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5012 = !DISubroutineType(types: !5013)
!5013 = !{null, !4998, !5007, !5014}
!5014 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !5015, size: 64)
!5015 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !5016)
!5016 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !4908, file: !4907, line: 95, baseType: !574, flags: DIFlagPublic)
!5017 = !DISubprogram(name: "~vector", scope: !4908, file: !4907, line: 259, type: !4996, scopeLine: 259, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5018 = !DISubprogram(name: "vector", scope: !4908, file: !4907, line: 261, type: !5019, scopeLine: 261, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5019 = !DISubroutineType(types: !5020)
!5020 = !{null, !4998, !5021}
!5021 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !5022, size: 64)
!5022 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4908)
!5023 = !DISubprogram(name: "vector", scope: !4908, file: !4907, line: 266, type: !5024, scopeLine: 266, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5024 = !DISubroutineType(types: !5025)
!5025 = !{null, !4998, !5021, !5026}
!5026 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !5027, size: 64)
!5027 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !5028)
!5028 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !5030, file: !5029, line: 22, baseType: !4921)
!5029 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__type_traits/type_identity.h", directory: "")
!5030 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__type_identity<std::__1::allocator<char *> >", scope: !366, file: !5029, line: 21, size: 8, flags: DIFlagTypePassByValue, elements: !1669, templateParams: !5031, identifier: "_ZTSNSt3__115__type_identityINS_9allocatorIPcEEEE")
!5031 = !{!5032}
!5032 = !DITemplateTypeParameter(name: "_Tp", type: !4921)
!5033 = !DISubprogram(name: "operator=", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEaSB8ne200100ERKS4_", scope: !4908, file: !4907, line: 270, type: !5034, scopeLine: 270, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5034 = !DISubroutineType(types: !5035)
!5035 = !{!5036, !4998, !5021}
!5036 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !4908, size: 64)
!5037 = !DISubprogram(name: "vector", scope: !4908, file: !4907, line: 273, type: !5038, scopeLine: 273, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5038 = !DISubroutineType(types: !5039)
!5039 = !{null, !4998, !5040}
!5040 = !DICompositeType(tag: DW_TAG_class_type, name: "initializer_list<char *>", scope: !367, file: !5041, line: 62, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSSt16initializer_listIPcE")
!5041 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/initializer_list", directory: "")
!5042 = !DISubprogram(name: "vector", scope: !4908, file: !4907, line: 278, type: !5043, scopeLine: 278, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5043 = !DISubroutineType(types: !5044)
!5044 = !{null, !4998, !5040, !5002}
!5045 = !DISubprogram(name: "operator=", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEaSB8ne200100ESt16initializer_listIS1_E", scope: !4908, file: !4907, line: 283, type: !5046, scopeLine: 283, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5046 = !DISubroutineType(types: !5047)
!5047 = !{!5036, !4998, !5040}
!5048 = !DISubprogram(name: "vector", scope: !4908, file: !4907, line: 289, type: !5049, scopeLine: 289, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5049 = !DISubroutineType(types: !5050)
!5050 = !{null, !4998, !5051}
!5051 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !4908, size: 64)
!5052 = !DISubprogram(name: "vector", scope: !4908, file: !4907, line: 297, type: !5053, scopeLine: 297, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5053 = !DISubroutineType(types: !5054)
!5054 = !{null, !4998, !5051, !5026}
!5055 = !DISubprogram(name: "operator=", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEaSB8ne200100EOS4_", scope: !4908, file: !4907, line: 298, type: !5056, scopeLine: 298, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5056 = !DISubroutineType(types: !5057)
!5057 = !{!5036, !4998, !5051}
!5058 = !DISubprogram(name: "assign", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6assignEmRKS1_", scope: !4908, file: !4907, line: 333, type: !5059, scopeLine: 333, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5059 = !DISubroutineType(types: !5060)
!5060 = !{null, !4998, !5007, !5061}
!5061 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !4908, file: !4907, line: 99, baseType: !5014, flags: DIFlagPublic)
!5062 = !DISubprogram(name: "assign", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6assignB8ne200100ESt16initializer_listIS1_E", scope: !4908, file: !4907, line: 336, type: !5038, scopeLine: 336, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5063 = !DISubprogram(name: "get_allocator", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE13get_allocatorB8ne200100Ev", scope: !4908, file: !4907, line: 341, type: !5064, scopeLine: 341, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5064 = !DISubroutineType(types: !5065)
!5065 = !{!4990, !5066}
!5066 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5022, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!5067 = !DISubprogram(name: "begin", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE5beginB8ne200100Ev", scope: !4908, file: !4907, line: 348, type: !5068, scopeLine: 348, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5068 = !DISubroutineType(types: !5069)
!5069 = !{!5070, !4998}
!5070 = !DIDerivedType(tag: DW_TAG_typedef, name: "iterator", scope: !4908, file: !4907, line: 111, baseType: !5071, flags: DIFlagPublic)
!5071 = !DICompositeType(tag: DW_TAG_class_type, name: "__wrap_iter<char **>", scope: !366, file: !5072, line: 35, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt3__111__wrap_iterIPPcEE")
!5072 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__iterator/wrap_iter.h", directory: "")
!5073 = !DISubprogram(name: "begin", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE5beginB8ne200100Ev", scope: !4908, file: !4907, line: 351, type: !5074, scopeLine: 351, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5074 = !DISubroutineType(types: !5075)
!5075 = !{!5076, !5066}
!5076 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_iterator", scope: !4908, file: !4907, line: 112, baseType: !5077, flags: DIFlagPublic)
!5077 = !DICompositeType(tag: DW_TAG_class_type, name: "__wrap_iter<char *const *>", scope: !366, file: !5072, line: 35, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt3__111__wrap_iterIPKPcEE")
!5078 = !DISubprogram(name: "end", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE3endB8ne200100Ev", scope: !4908, file: !4907, line: 354, type: !5068, scopeLine: 354, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5079 = !DISubprogram(name: "end", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE3endB8ne200100Ev", scope: !4908, file: !4907, line: 357, type: !5074, scopeLine: 357, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5080 = !DISubprogram(name: "rbegin", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6rbeginB8ne200100Ev", scope: !4908, file: !4907, line: 361, type: !5081, scopeLine: 361, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5081 = !DISubroutineType(types: !5082)
!5082 = !{!5083, !4998}
!5083 = !DIDerivedType(tag: DW_TAG_typedef, name: "reverse_iterator", scope: !4908, file: !4907, line: 114, baseType: !5084, flags: DIFlagPublic)
!5084 = !DICompositeType(tag: DW_TAG_class_type, name: "reverse_iterator<std::__1::__wrap_iter<char **> >", scope: !366, file: !5085, line: 51, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt3__116reverse_iteratorINS_11__wrap_iterIPPcEEEE")
!5085 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__iterator/reverse_iterator.h", directory: "")
!5086 = !DISubprogram(name: "rbegin", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE6rbeginB8ne200100Ev", scope: !4908, file: !4907, line: 364, type: !5087, scopeLine: 364, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5087 = !DISubroutineType(types: !5088)
!5088 = !{!5089, !5066}
!5089 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reverse_iterator", scope: !4908, file: !4907, line: 115, baseType: !5090, flags: DIFlagPublic)
!5090 = !DICompositeType(tag: DW_TAG_class_type, name: "reverse_iterator<std::__1::__wrap_iter<char *const *> >", scope: !366, file: !5085, line: 51, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt3__116reverse_iteratorINS_11__wrap_iterIPKPcEEEE")
!5091 = !DISubprogram(name: "rend", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE4rendB8ne200100Ev", scope: !4908, file: !4907, line: 367, type: !5081, scopeLine: 367, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5092 = !DISubprogram(name: "rend", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE4rendB8ne200100Ev", scope: !4908, file: !4907, line: 370, type: !5087, scopeLine: 370, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5093 = !DISubprogram(name: "cbegin", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE6cbeginB8ne200100Ev", scope: !4908, file: !4907, line: 374, type: !5074, scopeLine: 374, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5094 = !DISubprogram(name: "cend", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE4cendB8ne200100Ev", scope: !4908, file: !4907, line: 375, type: !5074, scopeLine: 375, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5095 = !DISubprogram(name: "crbegin", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE7crbeginB8ne200100Ev", scope: !4908, file: !4907, line: 376, type: !5087, scopeLine: 376, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5096 = !DISubprogram(name: "crend", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE5crendB8ne200100Ev", scope: !4908, file: !4907, line: 379, type: !5087, scopeLine: 379, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5097 = !DISubprogram(name: "size", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE4sizeB8ne200100Ev", scope: !4908, file: !4907, line: 384, type: !5098, scopeLine: 384, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5098 = !DISubroutineType(types: !5099)
!5099 = !{!5007, !5066}
!5100 = !DISubprogram(name: "capacity", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE8capacityB8ne200100Ev", scope: !4908, file: !4907, line: 387, type: !5098, scopeLine: 387, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5101 = !DISubprogram(name: "empty", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE5emptyB8ne200100Ev", scope: !4908, file: !4907, line: 390, type: !5102, scopeLine: 390, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5102 = !DISubroutineType(types: !5103)
!5103 = !{!1033, !5066}
!5104 = !DISubprogram(name: "max_size", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE8max_sizeB8ne200100Ev", scope: !4908, file: !4907, line: 393, type: !5098, scopeLine: 393, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5105 = !DISubprogram(name: "reserve", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE7reserveEm", scope: !4908, file: !4907, line: 396, type: !5005, scopeLine: 396, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5106 = !DISubprogram(name: "shrink_to_fit", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE13shrink_to_fitEv", scope: !4908, file: !4907, line: 397, type: !4996, scopeLine: 397, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5107 = !DISubprogram(name: "operator[]", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em", scope: !4908, file: !4907, line: 402, type: !5108, scopeLine: 402, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5108 = !DISubroutineType(types: !5109)
!5109 = !{!5110, !4998, !5007}
!5110 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !4908, file: !4907, line: 98, baseType: !5111, flags: DIFlagPublic)
!5111 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !5016, size: 64)
!5112 = !DISubprogram(name: "operator[]", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEEixB8ne200100Em", scope: !4908, file: !4907, line: 406, type: !5113, scopeLine: 406, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5113 = !DISubroutineType(types: !5114)
!5114 = !{!5061, !5066, !5007}
!5115 = !DISubprogram(name: "at", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE2atB8ne200100Em", scope: !4908, file: !4907, line: 410, type: !5108, scopeLine: 410, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5116 = !DISubprogram(name: "at", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE2atB8ne200100Em", scope: !4908, file: !4907, line: 415, type: !5113, scopeLine: 415, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5117 = !DISubprogram(name: "front", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE5frontB8ne200100Ev", scope: !4908, file: !4907, line: 421, type: !5118, scopeLine: 421, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5118 = !DISubroutineType(types: !5119)
!5119 = !{!5110, !4998}
!5120 = !DISubprogram(name: "front", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE5frontB8ne200100Ev", scope: !4908, file: !4907, line: 425, type: !5121, scopeLine: 425, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5121 = !DISubroutineType(types: !5122)
!5122 = !{!5061, !5066}
!5123 = !DISubprogram(name: "back", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE4backB8ne200100Ev", scope: !4908, file: !4907, line: 429, type: !5118, scopeLine: 429, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5124 = !DISubprogram(name: "back", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE4backB8ne200100Ev", scope: !4908, file: !4907, line: 433, type: !5121, scopeLine: 433, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5125 = !DISubprogram(name: "data", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE4dataB8ne200100Ev", scope: !4908, file: !4907, line: 441, type: !5126, scopeLine: 441, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5126 = !DISubroutineType(types: !5127)
!5127 = !{!5128, !4998}
!5128 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5016, size: 64)
!5129 = !DISubprogram(name: "data", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE4dataB8ne200100Ev", scope: !4908, file: !4907, line: 445, type: !5130, scopeLine: 445, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5130 = !DISubroutineType(types: !5131)
!5131 = !{!5132, !5066}
!5132 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5015, size: 64)
!5133 = !DISubprogram(name: "push_back", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE9push_backB8ne200100ERKS1_", scope: !4908, file: !4907, line: 452, type: !5134, scopeLine: 452, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5134 = !DISubroutineType(types: !5135)
!5135 = !{null, !4998, !5061}
!5136 = !DISubprogram(name: "push_back", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE9push_backB8ne200100EOS1_", scope: !4908, file: !4907, line: 454, type: !5137, scopeLine: 454, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5137 = !DISubroutineType(types: !5138)
!5138 = !{null, !4998, !5139}
!5139 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !5016, size: 64)
!5140 = !DISubprogram(name: "pop_back", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE8pop_backB8ne200100Ev", scope: !4908, file: !4907, line: 473, type: !4996, scopeLine: 473, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5141 = !DISubprogram(name: "insert", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EERS6_", scope: !4908, file: !4907, line: 478, type: !5142, scopeLine: 478, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5142 = !DISubroutineType(types: !5143)
!5143 = !{!5070, !4998, !5076, !5061}
!5144 = !DISubprogram(name: "insert", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEOS1_", scope: !4908, file: !4907, line: 480, type: !5145, scopeLine: 480, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5145 = !DISubroutineType(types: !5146)
!5146 = !{!5070, !4998, !5076, !5139}
!5147 = !DISubprogram(name: "insert", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_", scope: !4908, file: !4907, line: 485, type: !5148, scopeLine: 485, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5148 = !DISubroutineType(types: !5149)
!5149 = !{!5070, !4998, !5076, !5007, !5061}
!5150 = !DISubprogram(name: "insert", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6insertB8ne200100ENS_11__wrap_iterIPKS1_EESt16initializer_listIS1_E", scope: !4908, file: !4907, line: 521, type: !5151, scopeLine: 521, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5151 = !DISubroutineType(types: !5152)
!5152 = !{!5070, !4998, !5076, !5040}
!5153 = !DISubprogram(name: "erase", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE5eraseB8ne200100ENS_11__wrap_iterIPKS1_EE", scope: !4908, file: !4907, line: 526, type: !5154, scopeLine: 526, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5154 = !DISubroutineType(types: !5155)
!5155 = !{!5070, !4998, !5076}
!5156 = !DISubprogram(name: "erase", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE5eraseENS_11__wrap_iterIPKS1_EES8_", scope: !4908, file: !4907, line: 527, type: !5157, scopeLine: 527, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5157 = !DISubroutineType(types: !5158)
!5158 = !{!5070, !4998, !5076, !5076}
!5159 = !DISubprogram(name: "clear", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE5clearB8ne200100Ev", scope: !4908, file: !4907, line: 529, type: !4996, scopeLine: 529, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5160 = !DISubprogram(name: "resize", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6resizeEm", scope: !4908, file: !4907, line: 535, type: !5005, scopeLine: 535, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5161 = !DISubprogram(name: "resize", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE6resizeEmRKS1_", scope: !4908, file: !4907, line: 536, type: !5059, scopeLine: 536, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5162 = !DISubprogram(name: "swap", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE4swapERS4_", scope: !4908, file: !4907, line: 538, type: !5163, scopeLine: 538, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5163 = !DISubroutineType(types: !5164)
!5164 = !{null, !4998, !5036}
!5165 = !DISubprogram(name: "__invariants", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE12__invariantsEv", scope: !4908, file: !4907, line: 545, type: !5102, scopeLine: 545, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!5166 = !DISubprogram(name: "__vallocate", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE11__vallocateB8ne200100Em", scope: !4908, file: !4907, line: 559, type: !5005, scopeLine: 559, flags: DIFlagPrototyped, spFlags: 0)
!5167 = !DISubprogram(name: "__vdeallocate", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE13__vdeallocateEv", scope: !4908, file: !4907, line: 569, type: !4996, scopeLine: 569, flags: DIFlagPrototyped, spFlags: 0)
!5168 = !DISubprogram(name: "__recommend", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE11__recommendB8ne200100Em", scope: !4908, file: !4907, line: 570, type: !5169, scopeLine: 570, flags: DIFlagPrototyped, spFlags: 0)
!5169 = !DISubroutineType(types: !5170)
!5170 = !{!5007, !5066, !5007}
!5171 = !DISubprogram(name: "__construct_at_end", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE18__construct_at_endEm", scope: !4908, file: !4907, line: 571, type: !5005, scopeLine: 571, flags: DIFlagPrototyped, spFlags: 0)
!5172 = !DISubprogram(name: "__construct_at_end", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE18__construct_at_endEmRKS1_", scope: !4908, file: !4907, line: 572, type: !5059, scopeLine: 572, flags: DIFlagPrototyped, spFlags: 0)
!5173 = !DISubprogram(name: "__append", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE8__appendEm", scope: !4908, file: !4907, line: 620, type: !5005, scopeLine: 620, flags: DIFlagPrototyped, spFlags: 0)
!5174 = !DISubprogram(name: "__append", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE8__appendEmRKS1_", scope: !4908, file: !4907, line: 621, type: !5059, scopeLine: 621, flags: DIFlagPrototyped, spFlags: 0)
!5175 = !DISubprogram(name: "__make_iter", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE11__make_iterB8ne200100EPS1_", scope: !4908, file: !4907, line: 623, type: !5176, scopeLine: 623, flags: DIFlagPrototyped, spFlags: 0)
!5176 = !DISubroutineType(types: !5177)
!5177 = !{!5070, !4998, !4911}
!5178 = !DISubprogram(name: "__make_iter", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE11__make_iterB8ne200100EPKS1_", scope: !4908, file: !4907, line: 643, type: !5179, scopeLine: 643, flags: DIFlagPrototyped, spFlags: 0)
!5179 = !DISubroutineType(types: !5180)
!5180 = !{!5076, !5066, !5181}
!5181 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !4908, file: !4907, line: 103, baseType: !5182, flags: DIFlagPublic)
!5182 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !4914, file: !4913, line: 242, baseType: !4957)
!5183 = !DISubprogram(name: "__swap_out_circular_buffer", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS1_RS3_EE", scope: !4908, file: !4907, line: 656, type: !5184, scopeLine: 656, flags: DIFlagPrototyped, spFlags: 0)
!5184 = !DISubroutineType(types: !5185)
!5185 = !{null, !4998, !5186}
!5186 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !5187, size: 64)
!5187 = !DICompositeType(tag: DW_TAG_structure_type, name: "__split_buffer<char *, std::__1::allocator<char *> &>", scope: !366, file: !5188, line: 52, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt3__114__split_bufferIPcRNS_9allocatorIS1_EEEE")
!5188 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__split_buffer", directory: "")
!5189 = !DISubprogram(name: "__swap_out_circular_buffer", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS1_RS3_EEPS1_", scope: !4908, file: !4907, line: 658, type: !5190, scopeLine: 658, flags: DIFlagPrototyped, spFlags: 0)
!5190 = !DISubroutineType(types: !5191)
!5191 = !{!4911, !4998, !5186, !4911}
!5192 = !DISubprogram(name: "__move_range", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE12__move_rangeEPS1_S5_S5_", scope: !4908, file: !4907, line: 660, type: !5193, scopeLine: 660, flags: DIFlagPrototyped, spFlags: 0)
!5193 = !DISubroutineType(types: !5194)
!5194 = !{null, !4998, !4911, !4911, !4911}
!5195 = !DISubprogram(name: "__move_assign", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE13__move_assignERS4_NS_17integral_constantIbLb1EEE", scope: !4908, file: !4907, line: 661, type: !5196, scopeLine: 661, flags: DIFlagPrototyped, spFlags: 0)
!5196 = !DISubroutineType(types: !5197)
!5197 = !{null, !4998, !5036, !5198}
!5198 = !DIDerivedType(tag: DW_TAG_typedef, name: "true_type", scope: !366, file: !5199, line: 31, baseType: !5200)
!5199 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__type_traits/integral_constant.h", directory: "")
!5200 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "integral_constant<bool, true>", scope: !366, file: !5199, line: 21, size: 8, flags: DIFlagTypePassByValue, elements: !5201, templateParams: !5211, identifier: "_ZTSNSt3__117integral_constantIbLb1EEE")
!5201 = !{!5202, !5204, !5210}
!5202 = !DIDerivedType(tag: DW_TAG_variable, name: "value", scope: !5200, file: !5199, line: 22, baseType: !5203, flags: DIFlagStaticMember, extraData: i1 true)
!5203 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1033)
!5204 = !DISubprogram(name: "operator bool", linkageName: "_ZNKSt3__117integral_constantIbLb1EEcvbB8ne200100Ev", scope: !5200, file: !5199, line: 25, type: !5205, scopeLine: 25, flags: DIFlagPrototyped, spFlags: 0)
!5205 = !DISubroutineType(types: !5206)
!5206 = !{!5207, !5208}
!5207 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !5200, file: !5199, line: 23, baseType: !1033)
!5208 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5209, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!5209 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !5200)
!5210 = !DISubprogram(name: "operator()", linkageName: "_ZNKSt3__117integral_constantIbLb1EEclB8ne200100Ev", scope: !5200, file: !5199, line: 27, type: !5205, scopeLine: 27, flags: DIFlagPrototyped, spFlags: 0)
!5211 = !{!5212, !5213}
!5212 = !DITemplateTypeParameter(name: "_Tp", type: !1033)
!5213 = !DITemplateValueParameter(name: "__v", type: !1033, value: i8 1)
!5214 = !DISubprogram(name: "__move_assign", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE13__move_assignERS4_NS_17integral_constantIbLb0EEE", scope: !4908, file: !4907, line: 663, type: !5215, scopeLine: 663, flags: DIFlagPrototyped, spFlags: 0)
!5215 = !DISubroutineType(types: !5216)
!5216 = !{null, !4998, !5036, !5217}
!5217 = !DIDerivedType(tag: DW_TAG_typedef, name: "false_type", scope: !366, file: !5199, line: 32, baseType: !5218)
!5218 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "integral_constant<bool, false>", scope: !366, file: !5199, line: 21, size: 8, flags: DIFlagTypePassByValue, elements: !5219, templateParams: !5228, identifier: "_ZTSNSt3__117integral_constantIbLb0EEE")
!5219 = !{!5220, !5221, !5227}
!5220 = !DIDerivedType(tag: DW_TAG_variable, name: "value", scope: !5218, file: !5199, line: 22, baseType: !5203, flags: DIFlagStaticMember, extraData: i1 false)
!5221 = !DISubprogram(name: "operator bool", linkageName: "_ZNKSt3__117integral_constantIbLb0EEcvbB8ne200100Ev", scope: !5218, file: !5199, line: 25, type: !5222, scopeLine: 25, flags: DIFlagPrototyped, spFlags: 0)
!5222 = !DISubroutineType(types: !5223)
!5223 = !{!5224, !5225}
!5224 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !5218, file: !5199, line: 23, baseType: !1033)
!5225 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5226, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!5226 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !5218)
!5227 = !DISubprogram(name: "operator()", linkageName: "_ZNKSt3__117integral_constantIbLb0EEclB8ne200100Ev", scope: !5218, file: !5199, line: 27, type: !5222, scopeLine: 27, flags: DIFlagPrototyped, spFlags: 0)
!5228 = !{!5212, !5229}
!5229 = !DITemplateValueParameter(name: "__v", type: !1033, value: i8 0)
!5230 = !DISubprogram(name: "__destruct_at_end", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE17__destruct_at_endB8ne200100EPS1_", scope: !4908, file: !4907, line: 665, type: !5231, scopeLine: 665, flags: DIFlagPrototyped, spFlags: 0)
!5231 = !DISubroutineType(types: !5232)
!5232 = !{null, !4998, !4911}
!5233 = !DISubprogram(name: "__annotate_contiguous_container", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE31__annotate_contiguous_containerB8ne200100EPKvS6_", scope: !4908, file: !4907, line: 683, type: !5234, scopeLine: 683, flags: DIFlagPrototyped, spFlags: 0)
!5234 = !DISubroutineType(types: !5235)
!5235 = !{null, !5066, !969, !969}
!5236 = !DISubprogram(name: "__annotate_new", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE14__annotate_newB8ne200100Em", scope: !4908, file: !4907, line: 687, type: !5237, scopeLine: 687, flags: DIFlagPrototyped, spFlags: 0)
!5237 = !DISubroutineType(types: !5238)
!5238 = !{null, !5066, !5007}
!5239 = !DISubprogram(name: "__annotate_delete", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE17__annotate_deleteB8ne200100Ev", scope: !4908, file: !4907, line: 694, type: !5240, scopeLine: 694, flags: DIFlagPrototyped, spFlags: 0)
!5240 = !DISubroutineType(types: !5241)
!5241 = !{null, !5066}
!5242 = !DISubprogram(name: "__annotate_increase", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE19__annotate_increaseB8ne200100Em", scope: !4908, file: !4907, line: 700, type: !5237, scopeLine: 700, flags: DIFlagPrototyped, spFlags: 0)
!5243 = !DISubprogram(name: "__annotate_shrink", linkageName: "_ZNKSt3__16vectorIPcNS_9allocatorIS1_EEE17__annotate_shrinkB8ne200100Em", scope: !4908, file: !4907, line: 707, type: !5237, scopeLine: 707, flags: DIFlagPrototyped, spFlags: 0)
!5244 = !DISubprogram(name: "__base_destruct_at_end", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE22__base_destruct_at_endB8ne200100EPS1_", scope: !4908, file: !4907, line: 746, type: !5231, scopeLine: 746, flags: DIFlagPrototyped, spFlags: 0)
!5245 = !DISubprogram(name: "__copy_assign_alloc", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE19__copy_assign_allocB8ne200100ERKS4_", scope: !4908, file: !4907, line: 753, type: !5019, scopeLine: 753, flags: DIFlagPrototyped, spFlags: 0)
!5246 = !DISubprogram(name: "__move_assign_alloc", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE19__move_assign_allocB8ne200100ERS4_", scope: !4908, file: !4907, line: 757, type: !5163, scopeLine: 757, flags: DIFlagPrototyped, spFlags: 0)
!5247 = !DISubprogram(name: "__throw_length_error", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE20__throw_length_errorB8ne200100Ev", scope: !4908, file: !4907, line: 763, type: !946, scopeLine: 763, flags: DIFlagPrototyped | DIFlagStaticMember | DIFlagNoReturn, spFlags: 0)
!5248 = !DISubprogram(name: "__throw_out_of_range", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE20__throw_out_of_rangeB8ne200100Ev", scope: !4908, file: !4907, line: 765, type: !946, scopeLine: 765, flags: DIFlagPrototyped | DIFlagStaticMember | DIFlagNoReturn, spFlags: 0)
!5249 = !DISubprogram(name: "__copy_assign_alloc", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE19__copy_assign_allocB8ne200100ERKS4_NS_17integral_constantIbLb1EEE", scope: !4908, file: !4907, line: 767, type: !5250, scopeLine: 767, flags: DIFlagPrototyped, spFlags: 0)
!5250 = !DISubroutineType(types: !5251)
!5251 = !{null, !4998, !5021, !5198}
!5252 = !DISubprogram(name: "__copy_assign_alloc", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE19__copy_assign_allocB8ne200100ERKS4_NS_17integral_constantIbLb0EEE", scope: !4908, file: !4907, line: 777, type: !5253, scopeLine: 777, flags: DIFlagPrototyped, spFlags: 0)
!5253 = !DISubroutineType(types: !5254)
!5254 = !{null, !4998, !5021, !5217}
!5255 = !DISubprogram(name: "__move_assign_alloc", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE19__move_assign_allocB8ne200100ERS4_NS_17integral_constantIbLb1EEE", scope: !4908, file: !4907, line: 779, type: !5196, scopeLine: 779, flags: DIFlagPrototyped, spFlags: 0)
!5256 = !DISubprogram(name: "__move_assign_alloc", linkageName: "_ZNSt3__16vectorIPcNS_9allocatorIS1_EEE19__move_assign_allocB8ne200100ERS4_NS_17integral_constantIbLb0EEE", scope: !4908, file: !4907, line: 784, type: !5215, scopeLine: 784, flags: DIFlagPrototyped, spFlags: 0)
!5257 = !{!4973, !5258}
!5258 = !DITemplateTypeParameter(name: "_Allocator", type: !4921, defaulted: true)
!5259 = !DILocalVariable(name: "this", arg: 1, scope: !4906, type: !5260, flags: DIFlagArtificial | DIFlagObjectPointer)
!5260 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4908, size: 64)
!5261 = !DILocation(line: 0, scope: !4906)
!5262 = !DILocalVariable(name: "__n", arg: 2, scope: !4906, file: !4907, line: 402, type: !5007)
!5263 = !DILocation(line: 402, column: 86, scope: !4906)
!5264 = !DILocation(line: 404, column: 18, scope: !4906)
!5265 = !DILocation(line: 404, column: 27, scope: !4906)
!5266 = !DILocation(line: 404, column: 12, scope: !4906)
!5267 = !DILocation(line: 404, column: 5, scope: !4906)
!5268 = distinct !DISubprogram(name: "maybe_steal_primary_weapon", linkageName: "_Z26maybe_steal_primary_weaponii", scope: !2, file: !2, line: 1586, type: !1710, scopeLine: 1587, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !72, retainedNodes: !1669)
!5269 = !DILocalVariable(name: "player_num", arg: 1, scope: !5268, file: !2, line: 1586, type: !77)
!5270 = !DILocation(line: 1586, column: 36, scope: !5268)
!5271 = !DILocalVariable(name: "weapon_num", arg: 2, scope: !5268, file: !2, line: 1586, type: !77)
!5272 = !DILocation(line: 1586, column: 52, scope: !5268)
!5273 = !DILocation(line: 1588, column: 15, scope: !5274)
!5274 = distinct !DILexicalBlock(scope: !5268, file: !2, line: 1588, column: 6)
!5275 = !DILocation(line: 1588, column: 7, scope: !5274)
!5276 = !DILocation(line: 1588, column: 27, scope: !5274)
!5277 = !DILocation(line: 1588, column: 50, scope: !5274)
!5278 = !DILocation(line: 1588, column: 48, scope: !5274)
!5279 = !DILocation(line: 1588, column: 6, scope: !5274)
!5280 = !DILocation(line: 1588, column: 72, scope: !5274)
!5281 = !DILocation(line: 1588, column: 83, scope: !5274)
!5282 = !DILocation(line: 1588, column: 75, scope: !5274)
!5283 = !DILocation(line: 1588, column: 95, scope: !5274)
!5284 = !DILocation(line: 1588, column: 108, scope: !5274)
!5285 = !DILocation(line: 1589, column: 7, scope: !5286)
!5286 = distinct !DILexicalBlock(scope: !5287, file: !2, line: 1589, column: 7)
!5287 = distinct !DILexicalBlock(scope: !5274, file: !2, line: 1588, column: 121)
!5288 = !DILocation(line: 1589, column: 16, scope: !5286)
!5289 = !DILocation(line: 1590, column: 8, scope: !5290)
!5290 = distinct !DILexicalBlock(scope: !5291, file: !2, line: 1590, column: 8)
!5291 = distinct !DILexicalBlock(scope: !5286, file: !2, line: 1589, column: 37)
!5292 = !DILocation(line: 1590, column: 19, scope: !5290)
!5293 = !DILocation(line: 1591, column: 17, scope: !5294)
!5294 = distinct !DILexicalBlock(scope: !5295, file: !2, line: 1591, column: 9)
!5295 = distinct !DILexicalBlock(scope: !5290, file: !2, line: 1590, column: 25)
!5296 = !DILocation(line: 1591, column: 9, scope: !5294)
!5297 = !DILocation(line: 1591, column: 29, scope: !5294)
!5298 = !DILocation(line: 1591, column: 41, scope: !5294)
!5299 = !DILocation(line: 1592, column: 18, scope: !5300)
!5300 = distinct !DILexicalBlock(scope: !5301, file: !2, line: 1592, column: 10)
!5301 = distinct !DILexicalBlock(scope: !5294, file: !2, line: 1591, column: 46)
!5302 = !DILocation(line: 1592, column: 10, scope: !5300)
!5303 = !DILocation(line: 1592, column: 30, scope: !5300)
!5304 = !DILocation(line: 1592, column: 42, scope: !5300)
!5305 = !DILocation(line: 1593, column: 20, scope: !5306)
!5306 = distinct !DILexicalBlock(scope: !5300, file: !2, line: 1592, column: 47)
!5307 = !DILocation(line: 1593, column: 7, scope: !5306)
!5308 = !DILocation(line: 1593, column: 39, scope: !5306)
!5309 = !DILocation(line: 1594, column: 6, scope: !5306)
!5310 = !DILocation(line: 1595, column: 67, scope: !5311)
!5311 = distinct !DILexicalBlock(scope: !5300, file: !2, line: 1594, column: 13)
!5312 = !DILocation(line: 1595, column: 41, scope: !5311)
!5313 = !DILocation(line: 1595, column: 20, scope: !5311)
!5314 = !DILocation(line: 1595, column: 7, scope: !5311)
!5315 = !DILocation(line: 1595, column: 39, scope: !5311)
!5316 = !DILocation(line: 1597, column: 59, scope: !5301)
!5317 = !DILocation(line: 1597, column: 58, scope: !5301)
!5318 = !DILocation(line: 1597, column: 55, scope: !5301)
!5319 = !DILocation(line: 1597, column: 43, scope: !5301)
!5320 = !DILocation(line: 1597, column: 6, scope: !5301)
!5321 = !DILocation(line: 1598, column: 14, scope: !5301)
!5322 = !DILocation(line: 1598, column: 6, scope: !5301)
!5323 = !DILocation(line: 1598, column: 26, scope: !5301)
!5324 = !DILocation(line: 1598, column: 37, scope: !5301)
!5325 = !DILocation(line: 1599, column: 6, scope: !5301)
!5326 = !DILocation(line: 1600, column: 6, scope: !5301)
!5327 = !DILocation(line: 1602, column: 4, scope: !5295)
!5328 = !DILocation(line: 1602, column: 23, scope: !5329)
!5329 = distinct !DILexicalBlock(scope: !5290, file: !2, line: 1602, column: 15)
!5330 = !DILocation(line: 1602, column: 15, scope: !5329)
!5331 = !DILocation(line: 1602, column: 35, scope: !5329)
!5332 = !DILocation(line: 1602, column: 64, scope: !5329)
!5333 = !DILocation(line: 1602, column: 61, scope: !5329)
!5334 = !DILocation(line: 1602, column: 56, scope: !5329)
!5335 = !DILocation(line: 1603, column: 56, scope: !5336)
!5336 = distinct !DILexicalBlock(scope: !5329, file: !2, line: 1602, column: 77)
!5337 = !DILocation(line: 1603, column: 53, scope: !5336)
!5338 = !DILocation(line: 1603, column: 49, scope: !5336)
!5339 = !DILocation(line: 1603, column: 13, scope: !5336)
!5340 = !DILocation(line: 1603, column: 5, scope: !5336)
!5341 = !DILocation(line: 1603, column: 25, scope: !5336)
!5342 = !DILocation(line: 1603, column: 46, scope: !5336)
!5343 = !DILocation(line: 1604, column: 65, scope: !5336)
!5344 = !DILocation(line: 1604, column: 39, scope: !5336)
!5345 = !DILocation(line: 1604, column: 18, scope: !5336)
!5346 = !DILocation(line: 1604, column: 5, scope: !5336)
!5347 = !DILocation(line: 1604, column: 37, scope: !5336)
!5348 = !DILocation(line: 1606, column: 49, scope: !5336)
!5349 = !DILocation(line: 1606, column: 48, scope: !5336)
!5350 = !DILocation(line: 1606, column: 45, scope: !5336)
!5351 = !DILocation(line: 1606, column: 33, scope: !5336)
!5352 = !DILocation(line: 1606, column: 5, scope: !5336)
!5353 = !DILocation(line: 1607, column: 5, scope: !5336)
!5354 = !DILocation(line: 1608, column: 5, scope: !5336)
!5355 = !DILocation(line: 1609, column: 5, scope: !5336)
!5356 = !DILocation(line: 1611, column: 3, scope: !5291)
!5357 = !DILocation(line: 1612, column: 2, scope: !5287)
!5358 = !DILocation(line: 1614, column: 2, scope: !5268)
!5359 = !DILocation(line: 1615, column: 1, scope: !5268)
!5360 = distinct !DISubprogram(name: "attempt_to_steal_item_3", linkageName: "_Z23attempt_to_steal_item_3P6objecti", scope: !2, file: !2, line: 1624, type: !5361, scopeLine: 1625, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !72, retainedNodes: !1669)
!5361 = !DISubroutineType(types: !5362)
!5362 = !{!77, !2677, !77}
!5363 = !DILocalVariable(name: "objp", arg: 1, scope: !5360, file: !2, line: 1624, type: !2677)
!5364 = !DILocation(line: 1624, column: 37, scope: !5360)
!5365 = !DILocalVariable(name: "player_num", arg: 2, scope: !5360, file: !2, line: 1624, type: !77)
!5366 = !DILocation(line: 1624, column: 47, scope: !5360)
!5367 = !DILocalVariable(name: "i", scope: !5360, file: !2, line: 1626, type: !77)
!5368 = !DILocation(line: 1626, column: 6, scope: !5360)
!5369 = !DILocation(line: 1628, column: 20, scope: !5370)
!5370 = distinct !DILexicalBlock(scope: !5360, file: !2, line: 1628, column: 6)
!5371 = !DILocation(line: 1628, column: 24, scope: !5370)
!5372 = !DILocation(line: 1628, column: 6, scope: !5370)
!5373 = !DILocation(line: 1628, column: 34, scope: !5370)
!5374 = !DILocation(line: 1628, column: 39, scope: !5370)
!5375 = !DILocation(line: 1629, column: 3, scope: !5370)
!5376 = !DILocation(line: 1633, column: 28, scope: !5377)
!5377 = distinct !DILexicalBlock(scope: !5360, file: !2, line: 1633, column: 6)
!5378 = !DILocation(line: 1633, column: 6, scope: !5377)
!5379 = !DILocation(line: 1634, column: 3, scope: !5377)
!5380 = !DILocation(line: 1637, column: 6, scope: !5381)
!5381 = distinct !DILexicalBlock(scope: !5360, file: !2, line: 1637, column: 6)
!5382 = !DILocation(line: 1637, column: 21, scope: !5381)
!5383 = !DILocation(line: 1638, column: 29, scope: !5384)
!5384 = distinct !DILexicalBlock(scope: !5381, file: !2, line: 1638, column: 7)
!5385 = !DILocation(line: 1638, column: 7, scope: !5384)
!5386 = !DILocation(line: 1639, column: 4, scope: !5384)
!5387 = !DILocation(line: 1638, column: 65, scope: !5384)
!5388 = !DILocation(line: 1642, column: 8, scope: !5389)
!5389 = distinct !DILexicalBlock(scope: !5360, file: !2, line: 1642, column: 2)
!5390 = !DILocation(line: 1642, column: 7, scope: !5389)
!5391 = !DILocation(line: 1642, column: 12, scope: !5392)
!5392 = distinct !DILexicalBlock(scope: !5389, file: !2, line: 1642, column: 2)
!5393 = !DILocation(line: 1642, column: 13, scope: !5392)
!5394 = !DILocation(line: 1642, column: 2, scope: !5389)
!5395 = !DILocation(line: 1643, column: 34, scope: !5396)
!5396 = distinct !DILexicalBlock(scope: !5392, file: !2, line: 1643, column: 7)
!5397 = !DILocation(line: 1643, column: 46, scope: !5396)
!5398 = !DILocation(line: 1643, column: 7, scope: !5396)
!5399 = !DILocation(line: 1644, column: 4, scope: !5396)
!5400 = !DILocation(line: 1643, column: 60, scope: !5396)
!5401 = !DILocation(line: 1642, column: 18, scope: !5392)
!5402 = !DILocation(line: 1642, column: 2, scope: !5392)
!5403 = distinct !{!5403, !5394, !5404, !1697}
!5404 = !DILocation(line: 1644, column: 11, scope: !5389)
!5405 = !DILocation(line: 1646, column: 35, scope: !5406)
!5406 = distinct !DILexicalBlock(scope: !5360, file: !2, line: 1646, column: 6)
!5407 = !DILocation(line: 1646, column: 47, scope: !5406)
!5408 = !DILocation(line: 1646, column: 6, scope: !5406)
!5409 = !DILocation(line: 1647, column: 3, scope: !5406)
!5410 = !DILocation(line: 1651, column: 28, scope: !5411)
!5411 = distinct !DILexicalBlock(scope: !5360, file: !2, line: 1651, column: 6)
!5412 = !DILocation(line: 1651, column: 6, scope: !5411)
!5413 = !DILocation(line: 1652, column: 3, scope: !5411)
!5414 = !DILocation(line: 1653, column: 28, scope: !5415)
!5415 = distinct !DILexicalBlock(scope: !5360, file: !2, line: 1653, column: 6)
!5416 = !DILocation(line: 1653, column: 6, scope: !5415)
!5417 = !DILocation(line: 1654, column: 3, scope: !5415)
!5418 = !DILocation(line: 1655, column: 28, scope: !5419)
!5419 = distinct !DILexicalBlock(scope: !5360, file: !2, line: 1655, column: 6)
!5420 = !DILocation(line: 1655, column: 6, scope: !5419)
!5421 = !DILocation(line: 1656, column: 3, scope: !5419)
!5422 = !DILocation(line: 1657, column: 28, scope: !5423)
!5423 = distinct !DILexicalBlock(scope: !5360, file: !2, line: 1657, column: 6)
!5424 = !DILocation(line: 1657, column: 6, scope: !5423)
!5425 = !DILocation(line: 1658, column: 3, scope: !5423)
!5426 = !DILocation(line: 1659, column: 28, scope: !5427)
!5427 = distinct !DILexicalBlock(scope: !5360, file: !2, line: 1659, column: 6)
!5428 = !DILocation(line: 1659, column: 6, scope: !5427)
!5429 = !DILocation(line: 1660, column: 3, scope: !5427)
!5430 = !DILocation(line: 1663, column: 28, scope: !5431)
!5431 = distinct !DILexicalBlock(scope: !5360, file: !2, line: 1663, column: 6)
!5432 = !DILocation(line: 1663, column: 6, scope: !5431)
!5433 = !DILocation(line: 1664, column: 3, scope: !5431)
!5434 = !DILocation(line: 1665, column: 28, scope: !5435)
!5435 = distinct !DILexicalBlock(scope: !5360, file: !2, line: 1665, column: 6)
!5436 = !DILocation(line: 1665, column: 6, scope: !5435)
!5437 = !DILocation(line: 1666, column: 3, scope: !5435)
!5438 = !DILocation(line: 1668, column: 8, scope: !5439)
!5439 = distinct !DILexicalBlock(scope: !5360, file: !2, line: 1668, column: 2)
!5440 = !DILocation(line: 1668, column: 7, scope: !5439)
!5441 = !DILocation(line: 1668, column: 34, scope: !5442)
!5442 = distinct !DILexicalBlock(scope: !5439, file: !2, line: 1668, column: 2)
!5443 = !DILocation(line: 1668, column: 35, scope: !5442)
!5444 = !DILocation(line: 1668, column: 2, scope: !5439)
!5445 = !DILocation(line: 1669, column: 34, scope: !5446)
!5446 = distinct !DILexicalBlock(scope: !5447, file: !2, line: 1669, column: 7)
!5447 = distinct !DILexicalBlock(scope: !5442, file: !2, line: 1668, column: 45)
!5448 = !DILocation(line: 1669, column: 46, scope: !5446)
!5449 = !DILocation(line: 1669, column: 7, scope: !5446)
!5450 = !DILocation(line: 1670, column: 4, scope: !5446)
!5451 = !DILocation(line: 1671, column: 36, scope: !5452)
!5452 = distinct !DILexicalBlock(scope: !5447, file: !2, line: 1671, column: 7)
!5453 = !DILocation(line: 1671, column: 48, scope: !5452)
!5454 = !DILocation(line: 1671, column: 7, scope: !5452)
!5455 = !DILocation(line: 1672, column: 4, scope: !5452)
!5456 = !DILocation(line: 1673, column: 2, scope: !5447)
!5457 = !DILocation(line: 1668, column: 41, scope: !5442)
!5458 = !DILocation(line: 1668, column: 2, scope: !5442)
!5459 = distinct !{!5459, !5444, !5460, !1697}
!5460 = !DILocation(line: 1673, column: 2, scope: !5439)
!5461 = !DILocation(line: 1675, column: 2, scope: !5360)
!5462 = !DILocation(line: 1676, column: 1, scope: !5360)
!5463 = distinct !DISubprogram(name: "attempt_to_steal_item_2", linkageName: "_Z23attempt_to_steal_item_2P6objecti", scope: !2, file: !2, line: 1679, type: !5361, scopeLine: 1680, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !72, retainedNodes: !1669)
!5464 = !DILocalVariable(name: "objp", arg: 1, scope: !5463, file: !2, line: 1679, type: !2677)
!5465 = !DILocation(line: 1679, column: 37, scope: !5463)
!5466 = !DILocalVariable(name: "player_num", arg: 2, scope: !5463, file: !2, line: 1679, type: !77)
!5467 = !DILocation(line: 1679, column: 47, scope: !5463)
!5468 = !DILocalVariable(name: "rval", scope: !5463, file: !2, line: 1681, type: !77)
!5469 = !DILocation(line: 1681, column: 6, scope: !5463)
!5470 = !DILocation(line: 1683, column: 33, scope: !5463)
!5471 = !DILocation(line: 1683, column: 39, scope: !5463)
!5472 = !DILocation(line: 1683, column: 9, scope: !5463)
!5473 = !DILocation(line: 1683, column: 7, scope: !5463)
!5474 = !DILocation(line: 1685, column: 6, scope: !5475)
!5475 = distinct !DILexicalBlock(scope: !5463, file: !2, line: 1685, column: 6)
!5476 = !DILocation(line: 1686, column: 24, scope: !5477)
!5477 = distinct !DILexicalBlock(scope: !5475, file: !2, line: 1685, column: 12)
!5478 = !DILocation(line: 1686, column: 41, scope: !5477)
!5479 = !DILocation(line: 1686, column: 45, scope: !5477)
!5480 = !DILocation(line: 1686, column: 21, scope: !5477)
!5481 = !DILocation(line: 1687, column: 7, scope: !5482)
!5482 = distinct !DILexicalBlock(scope: !5477, file: !2, line: 1687, column: 7)
!5483 = !DILocation(line: 1687, column: 16, scope: !5482)
!5484 = !DILocation(line: 1688, column: 25, scope: !5482)
!5485 = !DILocation(line: 1688, column: 42, scope: !5482)
!5486 = !DILocation(line: 1688, column: 46, scope: !5482)
!5487 = !DILocation(line: 1688, column: 22, scope: !5482)
!5488 = !DILocation(line: 1688, column: 4, scope: !5482)
!5489 = !DILocation(line: 1689, column: 2, scope: !5477)
!5490 = !DILocation(line: 1691, column: 9, scope: !5463)
!5491 = !DILocation(line: 1691, column: 2, scope: !5463)
!5492 = distinct !DISubprogram(name: "attempt_to_steal_item", linkageName: "_Z21attempt_to_steal_itemP6objecti", scope: !2, file: !2, line: 1699, type: !5361, scopeLine: 1700, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !72, retainedNodes: !1669)
!5493 = !DILocalVariable(name: "objp", arg: 1, scope: !5492, file: !2, line: 1699, type: !2677)
!5494 = !DILocation(line: 1699, column: 35, scope: !5492)
!5495 = !DILocalVariable(name: "player_num", arg: 2, scope: !5492, file: !2, line: 1699, type: !77)
!5496 = !DILocation(line: 1699, column: 45, scope: !5492)
!5497 = !DILocalVariable(name: "i", scope: !5492, file: !2, line: 1701, type: !77)
!5498 = !DILocation(line: 1701, column: 6, scope: !5492)
!5499 = !DILocalVariable(name: "rval", scope: !5492, file: !2, line: 1702, type: !77)
!5500 = !DILocation(line: 1702, column: 6, scope: !5492)
!5501 = !DILocation(line: 1704, column: 6, scope: !5502)
!5502 = distinct !DILexicalBlock(scope: !5492, file: !2, line: 1704, column: 6)
!5503 = !DILocation(line: 1704, column: 12, scope: !5502)
!5504 = !DILocation(line: 1704, column: 26, scope: !5502)
!5505 = !DILocation(line: 1705, column: 3, scope: !5502)
!5506 = !DILocation(line: 1707, column: 34, scope: !5492)
!5507 = !DILocation(line: 1707, column: 40, scope: !5492)
!5508 = !DILocation(line: 1707, column: 10, scope: !5492)
!5509 = !DILocation(line: 1707, column: 7, scope: !5492)
!5510 = !DILocation(line: 1709, column: 8, scope: !5511)
!5511 = distinct !DILexicalBlock(scope: !5492, file: !2, line: 1709, column: 2)
!5512 = !DILocation(line: 1709, column: 7, scope: !5511)
!5513 = !DILocation(line: 1709, column: 12, scope: !5514)
!5514 = distinct !DILexicalBlock(scope: !5511, file: !2, line: 1709, column: 2)
!5515 = !DILocation(line: 1709, column: 13, scope: !5514)
!5516 = !DILocation(line: 1709, column: 2, scope: !5511)
!5517 = !DILocation(line: 1710, column: 8, scope: !5518)
!5518 = distinct !DILexicalBlock(scope: !5519, file: !2, line: 1710, column: 7)
!5519 = distinct !DILexicalBlock(scope: !5514, file: !2, line: 1709, column: 22)
!5520 = !DILocation(line: 1710, column: 13, scope: !5518)
!5521 = !DILocation(line: 1710, column: 17, scope: !5518)
!5522 = !DILocation(line: 1710, column: 26, scope: !5518)
!5523 = !DILocation(line: 1711, column: 36, scope: !5524)
!5524 = distinct !DILexicalBlock(scope: !5518, file: !2, line: 1710, column: 36)
!5525 = !DILocation(line: 1711, column: 42, scope: !5524)
!5526 = !DILocation(line: 1711, column: 12, scope: !5524)
!5527 = !DILocation(line: 1711, column: 9, scope: !5524)
!5528 = !DILocation(line: 1712, column: 3, scope: !5524)
!5529 = !DILocation(line: 1713, column: 4, scope: !5518)
!5530 = !DILocation(line: 1714, column: 2, scope: !5519)
!5531 = !DILocation(line: 1709, column: 18, scope: !5514)
!5532 = !DILocation(line: 1709, column: 2, scope: !5514)
!5533 = distinct !{!5533, !5516, !5534, !1697}
!5534 = !DILocation(line: 1714, column: 2, scope: !5511)
!5535 = !DILocation(line: 1717, column: 24, scope: !5492)
!5536 = !DILocation(line: 1717, column: 34, scope: !5492)
!5537 = !DILocation(line: 1717, column: 49, scope: !5492)
!5538 = !DILocation(line: 1717, column: 2, scope: !5492)
!5539 = !DILocation(line: 1718, column: 66, scope: !5492)
!5540 = !DILocation(line: 1718, column: 49, scope: !5492)
!5541 = !DILocation(line: 1718, column: 83, scope: !5492)
!5542 = !DILocation(line: 1718, column: 16, scope: !5492)
!5543 = !DILocation(line: 1718, column: 20, scope: !5492)
!5544 = !DILocation(line: 1718, column: 2, scope: !5492)
!5545 = !DILocation(line: 1718, column: 30, scope: !5492)
!5546 = !DILocation(line: 1718, column: 47, scope: !5492)
!5547 = !DILocation(line: 1719, column: 16, scope: !5492)
!5548 = !DILocation(line: 1719, column: 20, scope: !5492)
!5549 = !DILocation(line: 1719, column: 2, scope: !5492)
!5550 = !DILocation(line: 1719, column: 30, scope: !5492)
!5551 = !DILocation(line: 1719, column: 35, scope: !5492)
!5552 = !DILocation(line: 1720, column: 6, scope: !5553)
!5553 = distinct !DILexicalBlock(scope: !5492, file: !2, line: 1720, column: 6)
!5554 = !DILocation(line: 1721, column: 3, scope: !5555)
!5555 = distinct !DILexicalBlock(scope: !5553, file: !2, line: 1720, column: 12)
!5556 = !DILocation(line: 1722, column: 3, scope: !5555)
!5557 = !DILocation(line: 1729, column: 2, scope: !5555)
!5558 = !DILocation(line: 1730, column: 9, scope: !5492)
!5559 = !DILocation(line: 1730, column: 2, scope: !5492)
!5560 = !DILocation(line: 1731, column: 1, scope: !5492)
!5561 = distinct !DISubprogram(name: "drop_stolen_items", linkageName: "_Z17drop_stolen_itemsP6object", scope: !2, file: !2, line: 1754, type: !3067, scopeLine: 1755, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !72, retainedNodes: !1669)
!5562 = !DILocalVariable(name: "objp", arg: 1, scope: !5561, file: !2, line: 1754, type: !2677)
!5563 = !DILocation(line: 1754, column: 32, scope: !5561)
!5564 = !DILocalVariable(name: "i", scope: !5561, file: !2, line: 1756, type: !77)
!5565 = !DILocation(line: 1756, column: 6, scope: !5561)
!5566 = !DILocation(line: 1758, column: 9, scope: !5561)
!5567 = !DILocation(line: 1762, column: 8, scope: !5568)
!5568 = distinct !DILexicalBlock(scope: !5561, file: !2, line: 1762, column: 2)
!5569 = !DILocation(line: 1762, column: 7, scope: !5568)
!5570 = !DILocation(line: 1762, column: 12, scope: !5571)
!5571 = distinct !DILexicalBlock(scope: !5568, file: !2, line: 1762, column: 2)
!5572 = !DILocation(line: 1762, column: 13, scope: !5571)
!5573 = !DILocation(line: 1762, column: 2, scope: !5568)
!5574 = !DILocation(line: 1763, column: 20, scope: !5575)
!5575 = distinct !DILexicalBlock(scope: !5576, file: !2, line: 1763, column: 7)
!5576 = distinct !DILexicalBlock(scope: !5571, file: !2, line: 1762, column: 37)
!5577 = !DILocation(line: 1763, column: 7, scope: !5575)
!5578 = !DILocation(line: 1763, column: 23, scope: !5575)
!5579 = !DILocation(line: 1764, column: 43, scope: !5575)
!5580 = !DILocation(line: 1764, column: 30, scope: !5575)
!5581 = !DILocation(line: 1764, column: 51, scope: !5575)
!5582 = !DILocation(line: 1764, column: 57, scope: !5575)
!5583 = !DILocation(line: 1764, column: 73, scope: !5575)
!5584 = !DILocation(line: 1764, column: 84, scope: !5575)
!5585 = !DILocation(line: 1764, column: 90, scope: !5575)
!5586 = !DILocation(line: 1764, column: 95, scope: !5575)
!5587 = !DILocation(line: 1764, column: 101, scope: !5575)
!5588 = !DILocation(line: 1764, column: 4, scope: !5575)
!5589 = !DILocation(line: 1765, column: 16, scope: !5576)
!5590 = !DILocation(line: 1765, column: 3, scope: !5576)
!5591 = !DILocation(line: 1765, column: 19, scope: !5576)
!5592 = !DILocation(line: 1766, column: 2, scope: !5576)
!5593 = !DILocation(line: 1762, column: 33, scope: !5571)
!5594 = !DILocation(line: 1762, column: 2, scope: !5571)
!5595 = distinct !{!5595, !5573, !5596, !1697}
!5596 = !DILocation(line: 1766, column: 2, scope: !5568)
!5597 = !DILocation(line: 1768, column: 1, scope: !5561)
!5598 = distinct !DISubprogram(name: "do_escort_menu", linkageName: "_Z14do_escort_menuv", scope: !2, file: !2, line: 1773, type: !946, scopeLine: 1774, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !72, retainedNodes: !1669)
!5599 = !DILocalVariable(name: "i", scope: !5598, file: !2, line: 1775, type: !77)
!5600 = !DILocation(line: 1775, column: 6, scope: !5598)
!5601 = !DILocalVariable(name: "msg", scope: !5598, file: !2, line: 1776, type: !5602)
!5602 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 2400, elements: !5603)
!5603 = !{!5604}
!5604 = !DISubrange(count: 300)
!5605 = !DILocation(line: 1776, column: 7, scope: !5598)
!5606 = !DILocalVariable(name: "paused", scope: !5598, file: !2, line: 1777, type: !77)
!5607 = !DILocation(line: 1777, column: 6, scope: !5598)
!5608 = !DILocalVariable(name: "key", scope: !5598, file: !2, line: 1778, type: !77)
!5609 = !DILocation(line: 1778, column: 6, scope: !5598)
!5610 = !DILocalVariable(name: "next_goal", scope: !5598, file: !2, line: 1779, type: !77)
!5611 = !DILocation(line: 1779, column: 6, scope: !5598)
!5612 = !DILocalVariable(name: "goal_str", scope: !5598, file: !2, line: 1780, type: !5613)
!5613 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 256, elements: !5614)
!5614 = !{!5615}
!5615 = !DISubrange(count: 32)
!5616 = !DILocation(line: 1780, column: 7, scope: !5598)
!5617 = !DILocalVariable(name: "tstr", scope: !5598, file: !2, line: 1780, type: !5613)
!5618 = !DILocation(line: 1780, column: 21, scope: !5598)
!5619 = !DILocation(line: 1782, column: 6, scope: !5620)
!5620 = distinct !DILexicalBlock(scope: !5598, file: !2, line: 1782, column: 6)
!5621 = !DILocation(line: 1782, column: 16, scope: !5620)
!5622 = !DILocation(line: 1784, column: 3, scope: !5623)
!5623 = distinct !DILexicalBlock(scope: !5620, file: !2, line: 1783, column: 2)
!5624 = !DILocation(line: 1785, column: 3, scope: !5623)
!5625 = !DILocation(line: 1788, column: 8, scope: !5626)
!5626 = distinct !DILexicalBlock(scope: !5598, file: !2, line: 1788, column: 2)
!5627 = !DILocation(line: 1788, column: 7, scope: !5626)
!5628 = !DILocation(line: 1788, column: 12, scope: !5629)
!5629 = distinct !DILexicalBlock(scope: !5626, file: !2, line: 1788, column: 2)
!5630 = !DILocation(line: 1788, column: 15, scope: !5629)
!5631 = !DILocation(line: 1788, column: 13, scope: !5629)
!5632 = !DILocation(line: 1788, column: 2, scope: !5626)
!5633 = !DILocation(line: 1790, column: 15, scope: !5634)
!5634 = distinct !DILexicalBlock(scope: !5635, file: !2, line: 1790, column: 7)
!5635 = distinct !DILexicalBlock(scope: !5629, file: !2, line: 1789, column: 2)
!5636 = !DILocation(line: 1790, column: 7, scope: !5634)
!5637 = !DILocation(line: 1790, column: 18, scope: !5634)
!5638 = !DILocation(line: 1790, column: 23, scope: !5634)
!5639 = !DILocation(line: 1791, column: 27, scope: !5640)
!5640 = distinct !DILexicalBlock(scope: !5634, file: !2, line: 1791, column: 8)
!5641 = !DILocation(line: 1791, column: 19, scope: !5640)
!5642 = !DILocation(line: 1791, column: 30, scope: !5640)
!5643 = !DILocation(line: 1791, column: 8, scope: !5640)
!5644 = !DILocation(line: 1791, column: 34, scope: !5640)
!5645 = !DILocation(line: 1792, column: 5, scope: !5640)
!5646 = !DILocation(line: 1793, column: 2, scope: !5635)
!5647 = !DILocation(line: 1788, column: 38, scope: !5629)
!5648 = !DILocation(line: 1788, column: 2, scope: !5629)
!5649 = distinct !{!5649, !5632, !5650, !1697}
!5650 = !DILocation(line: 1793, column: 2, scope: !5626)
!5651 = !DILocation(line: 1795, column: 6, scope: !5652)
!5652 = distinct !DILexicalBlock(scope: !5598, file: !2, line: 1795, column: 6)
!5653 = !DILocation(line: 1795, column: 10, scope: !5652)
!5654 = !DILocation(line: 1795, column: 8, scope: !5652)
!5655 = !DILocation(line: 1797, column: 3, scope: !5656)
!5656 = distinct !DILexicalBlock(scope: !5652, file: !2, line: 1796, column: 2)
!5657 = !DILocation(line: 1801, column: 3, scope: !5656)
!5658 = !DILocation(line: 1802, column: 3, scope: !5656)
!5659 = !DILocation(line: 1806, column: 2, scope: !5656)
!5660 = !DILocation(line: 1808, column: 2, scope: !5598)
!5661 = !DILocation(line: 1810, column: 7, scope: !5662)
!5662 = distinct !DILexicalBlock(scope: !5598, file: !2, line: 1810, column: 6)
!5663 = !DILocation(line: 1810, column: 6, scope: !5662)
!5664 = !DILocation(line: 1812, column: 3, scope: !5665)
!5665 = distinct !DILexicalBlock(scope: !5662, file: !2, line: 1811, column: 2)
!5666 = !DILocation(line: 1813, column: 3, scope: !5665)
!5667 = !DILocation(line: 1816, column: 2, scope: !5598)
!5668 = !DILocation(line: 1817, column: 2, scope: !5598)
!5669 = !DILocation(line: 1819, column: 2, scope: !5598)
!5670 = !DILocation(line: 1820, column: 2, scope: !5598)
!5671 = !DILocation(line: 1821, column: 2, scope: !5598)
!5672 = !DILocation(line: 1823, column: 2, scope: !5598)
!5673 = !DILocation(line: 1825, column: 9, scope: !5598)
!5674 = !DILocation(line: 1828, column: 2, scope: !5598)
!5675 = !DILocation(line: 1829, column: 2, scope: !5598)
!5676 = !DILocation(line: 1833, column: 6, scope: !5677)
!5677 = distinct !DILexicalBlock(scope: !5598, file: !2, line: 1833, column: 6)
!5678 = !DILocation(line: 1833, column: 26, scope: !5677)
!5679 = !DILocation(line: 1835, column: 23, scope: !5680)
!5680 = distinct !DILexicalBlock(scope: !5677, file: !2, line: 1834, column: 2)
!5681 = !DILocation(line: 1836, column: 15, scope: !5680)
!5682 = !DILocation(line: 1836, column: 13, scope: !5680)
!5683 = !DILocation(line: 1837, column: 23, scope: !5680)
!5684 = !DILocation(line: 1838, column: 2, scope: !5680)
!5685 = !DILocation(line: 1840, column: 23, scope: !5686)
!5686 = distinct !DILexicalBlock(scope: !5677, file: !2, line: 1839, column: 2)
!5687 = !DILocation(line: 1841, column: 15, scope: !5686)
!5688 = !DILocation(line: 1841, column: 13, scope: !5686)
!5689 = !DILocation(line: 1844, column: 10, scope: !5598)
!5690 = !DILocation(line: 1844, column: 2, scope: !5598)
!5691 = !DILocation(line: 1848, column: 4, scope: !5692)
!5692 = distinct !DILexicalBlock(scope: !5598, file: !2, line: 1845, column: 2)
!5693 = !DILocation(line: 1849, column: 12, scope: !5692)
!5694 = !DILocation(line: 1849, column: 4, scope: !5692)
!5695 = !DILocation(line: 1850, column: 4, scope: !5692)
!5696 = !DILocation(line: 1854, column: 12, scope: !5692)
!5697 = !DILocation(line: 1854, column: 4, scope: !5692)
!5698 = !DILocation(line: 1855, column: 4, scope: !5692)
!5699 = !DILocation(line: 1857, column: 12, scope: !5692)
!5700 = !DILocation(line: 1857, column: 4, scope: !5692)
!5701 = !DILocation(line: 1858, column: 4, scope: !5692)
!5702 = !DILocation(line: 1860, column: 12, scope: !5692)
!5703 = !DILocation(line: 1860, column: 4, scope: !5692)
!5704 = !DILocation(line: 1861, column: 4, scope: !5692)
!5705 = !DILocation(line: 1863, column: 12, scope: !5692)
!5706 = !DILocation(line: 1863, column: 4, scope: !5692)
!5707 = !DILocation(line: 1864, column: 4, scope: !5692)
!5708 = !DILocation(line: 1866, column: 12, scope: !5692)
!5709 = !DILocation(line: 1866, column: 4, scope: !5692)
!5710 = !DILocation(line: 1867, column: 4, scope: !5692)
!5711 = !DILocation(line: 1869, column: 12, scope: !5692)
!5712 = !DILocation(line: 1869, column: 4, scope: !5692)
!5713 = !DILocation(line: 1870, column: 4, scope: !5692)
!5714 = !DILocation(line: 1880, column: 12, scope: !5692)
!5715 = !DILocation(line: 1880, column: 35, scope: !5692)
!5716 = !DILocation(line: 1880, column: 44, scope: !5692)
!5717 = !DILocation(line: 1880, column: 64, scope: !5692)
!5718 = !DILocation(line: 1880, column: 4, scope: !5692)
!5719 = !DILocation(line: 1881, column: 4, scope: !5692)
!5720 = !DILocation(line: 1885, column: 7, scope: !5721)
!5721 = distinct !DILexicalBlock(scope: !5598, file: !2, line: 1885, column: 6)
!5722 = !DILocation(line: 1885, column: 6, scope: !5721)
!5723 = !DILocation(line: 1886, column: 11, scope: !5721)
!5724 = !DILocation(line: 1886, column: 3, scope: !5721)
!5725 = !DILocation(line: 1888, column: 11, scope: !5721)
!5726 = !DILocation(line: 1888, column: 3, scope: !5721)
!5727 = !DILocation(line: 1890, column: 10, scope: !5598)
!5728 = !DILocation(line: 1903, column: 7, scope: !5598)
!5729 = !DILocation(line: 1903, column: 17, scope: !5598)
!5730 = !DILocation(line: 1890, column: 2, scope: !5598)
!5731 = !DILocation(line: 1905, column: 19, scope: !5598)
!5732 = !DILocation(line: 1905, column: 2, scope: !5598)
!5733 = !DILocation(line: 1906, column: 2, scope: !5598)
!5734 = !DILocation(line: 1908, column: 2, scope: !5598)
!5735 = !DILocation(line: 1908, column: 9, scope: !5598)
!5736 = !DILocation(line: 1917, column: 9, scope: !5737)
!5737 = distinct !DILexicalBlock(scope: !5598, file: !2, line: 1909, column: 2)
!5738 = !DILocation(line: 1917, column: 7, scope: !5737)
!5739 = !DILocation(line: 1920, column: 11, scope: !5737)
!5740 = !DILocation(line: 1920, column: 3, scope: !5737)
!5741 = !DILocation(line: 1932, column: 24, scope: !5742)
!5742 = distinct !DILexicalBlock(scope: !5737, file: !2, line: 1921, column: 3)
!5743 = !DILocation(line: 1933, column: 20, scope: !5742)
!5744 = !DILocation(line: 1934, column: 29, scope: !5742)
!5745 = !DILocation(line: 1934, column: 5, scope: !5742)
!5746 = !DILocation(line: 1935, column: 20, scope: !5742)
!5747 = !DILocation(line: 1936, column: 12, scope: !5742)
!5748 = !DILocation(line: 1937, column: 5, scope: !5742)
!5749 = !DILocation(line: 1941, column: 5, scope: !5742)
!5750 = !DILocation(line: 1942, column: 11, scope: !5742)
!5751 = !DILocation(line: 1943, column: 5, scope: !5742)
!5752 = !DILocation(line: 1953, column: 5, scope: !5742)
!5753 = !DILocation(line: 1954, column: 5, scope: !5742)
!5754 = !DILocation(line: 1957, column: 21, scope: !5742)
!5755 = !DILocation(line: 1957, column: 29, scope: !5742)
!5756 = !DILocalVariable(name: "msg", scope: !5757, file: !2, line: 1962, type: !5613)
!5757 = distinct !DILexicalBlock(scope: !5742, file: !2, line: 1961, column: 4)
!5758 = !DILocation(line: 1962, column: 10, scope: !5757)
!5759 = !DILocalVariable(name: "temp", scope: !5757, file: !2, line: 1963, type: !77)
!5760 = !DILocation(line: 1963, column: 9, scope: !5757)
!5761 = !DILocation(line: 1965, column: 13, scope: !5757)
!5762 = !DILocation(line: 1965, column: 12, scope: !5757)
!5763 = !DILocation(line: 1965, column: 10, scope: !5757)
!5764 = !DILocation(line: 1967, column: 9, scope: !5765)
!5765 = distinct !DILexicalBlock(scope: !5757, file: !2, line: 1967, column: 9)
!5766 = !DILocation(line: 1968, column: 13, scope: !5765)
!5767 = !DILocation(line: 1968, column: 6, scope: !5765)
!5768 = !DILocation(line: 1970, column: 13, scope: !5765)
!5769 = !DILocation(line: 1970, column: 6, scope: !5765)
!5770 = !DILocation(line: 1972, column: 31, scope: !5757)
!5771 = !DILocation(line: 1973, column: 35, scope: !5757)
!5772 = !DILocation(line: 1973, column: 5, scope: !5757)
!5773 = !DILocation(line: 1975, column: 33, scope: !5757)
!5774 = !DILocation(line: 1975, column: 31, scope: !5757)
!5775 = !DILocation(line: 1977, column: 12, scope: !5757)
!5776 = !DILocation(line: 1978, column: 5, scope: !5757)
!5777 = !DILocation(line: 1981, column: 5, scope: !5742)
!5778 = distinct !{!5778, !5734, !5779, !1697}
!5779 = !DILocation(line: 1983, column: 2, scope: !5598)
!5780 = !DILocation(line: 1984, column: 2, scope: !5598)
!5781 = !DILocation(line: 1986, column: 2, scope: !5598)
!5782 = !DILocation(line: 1988, column: 2, scope: !5598)
!5783 = !DILocation(line: 1989, column: 2, scope: !5598)
!5784 = !DILocation(line: 1991, column: 1, scope: !5598)
!5785 = distinct !DISubprogram(name: "show_escort_menu", linkageName: "_Z16show_escort_menuPc", scope: !2, file: !2, line: 1995, type: !5786, scopeLine: 1996, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !72, retainedNodes: !1669)
!5786 = !DISubroutineType(types: !5787)
!5787 = !{null, !574}
!5788 = !DILocalVariable(name: "msg", arg: 1, scope: !5785, file: !2, line: 1995, type: !574)
!5789 = !DILocation(line: 1995, column: 29, scope: !5785)
!5790 = !DILocalVariable(name: "w", scope: !5785, file: !2, line: 1997, type: !77)
!5791 = !DILocation(line: 1997, column: 6, scope: !5785)
!5792 = !DILocalVariable(name: "h", scope: !5785, file: !2, line: 1997, type: !77)
!5793 = !DILocation(line: 1997, column: 8, scope: !5785)
!5794 = !DILocalVariable(name: "aw", scope: !5785, file: !2, line: 1997, type: !77)
!5795 = !DILocation(line: 1997, column: 10, scope: !5785)
!5796 = !DILocalVariable(name: "x", scope: !5785, file: !2, line: 1998, type: !77)
!5797 = !DILocation(line: 1998, column: 6, scope: !5785)
!5798 = !DILocalVariable(name: "y", scope: !5785, file: !2, line: 1998, type: !77)
!5799 = !DILocation(line: 1998, column: 8, scope: !5785)
!5800 = !DILocation(line: 2000, column: 2, scope: !5785)
!5801 = !DILocation(line: 2002, column: 18, scope: !5785)
!5802 = !DILocation(line: 2002, column: 2, scope: !5785)
!5803 = !DILocation(line: 2004, column: 21, scope: !5785)
!5804 = !DILocation(line: 2004, column: 2, scope: !5785)
!5805 = !DILocation(line: 2006, column: 7, scope: !5785)
!5806 = !DILocation(line: 2006, column: 22, scope: !5785)
!5807 = !DILocation(line: 2006, column: 27, scope: !5785)
!5808 = !DILocation(line: 2006, column: 26, scope: !5785)
!5809 = !DILocation(line: 2006, column: 29, scope: !5785)
!5810 = !DILocation(line: 2006, column: 4, scope: !5785)
!5811 = !DILocation(line: 2007, column: 7, scope: !5785)
!5812 = !DILocation(line: 2007, column: 22, scope: !5785)
!5813 = !DILocation(line: 2007, column: 27, scope: !5785)
!5814 = !DILocation(line: 2007, column: 26, scope: !5785)
!5815 = !DILocation(line: 2007, column: 29, scope: !5785)
!5816 = !DILocation(line: 2007, column: 4, scope: !5785)
!5817 = !DILocation(line: 2009, column: 20, scope: !5785)
!5818 = !DILocation(line: 2009, column: 2, scope: !5785)
!5819 = !DILocation(line: 2015, column: 23, scope: !5785)
!5820 = !DILocation(line: 2015, column: 24, scope: !5785)
!5821 = !DILocation(line: 2015, column: 28, scope: !5785)
!5822 = !DILocation(line: 2015, column: 29, scope: !5785)
!5823 = !DILocation(line: 2015, column: 33, scope: !5785)
!5824 = !DILocation(line: 2015, column: 35, scope: !5785)
!5825 = !DILocation(line: 2015, column: 34, scope: !5785)
!5826 = !DILocation(line: 2015, column: 36, scope: !5785)
!5827 = !DILocation(line: 2015, column: 39, scope: !5785)
!5828 = !DILocation(line: 2015, column: 42, scope: !5785)
!5829 = !DILocation(line: 2015, column: 44, scope: !5785)
!5830 = !DILocation(line: 2015, column: 43, scope: !5785)
!5831 = !DILocation(line: 2015, column: 45, scope: !5785)
!5832 = !DILocation(line: 2015, column: 48, scope: !5785)
!5833 = !DILocation(line: 2015, column: 4, scope: !5785)
!5834 = !DILocation(line: 2021, column: 16, scope: !5785)
!5835 = !DILocation(line: 2021, column: 19, scope: !5785)
!5836 = !DILocation(line: 2021, column: 22, scope: !5785)
!5837 = !DILocation(line: 2021, column: 4, scope: !5785)
!5838 = !DILocation(line: 2024, column: 2, scope: !5785)
!5839 = !DILocation(line: 2025, column: 1, scope: !5785)
