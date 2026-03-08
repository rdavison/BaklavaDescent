; ModuleID = '/Users/richard/code/ChocolateDescent/main_d2/cntrlcen.cpp'
source_filename = "/Users/richard/code/ChocolateDescent/main_d2/cntrlcen.cpp"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

%struct.reactor = type { i32, i32, [8 x %struct.vms_vector], [8 x %struct.vms_vector] }
%struct.vms_vector = type { i32, i32, i32 }
%struct.control_center_triggers = type { i16, [10 x i16], [10 x i16] }
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
%struct.player = type { [9 x i8], [4 x i8], i16, i8, i32, i32, i32, i32, i32, i32, i8, i8, i8, i8, i16, i16, i16, [10 x i16], [10 x i16], i16, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i16, i8, i8, i32, i8, i8 }
%struct.robot_info = type { i32, [8 x %struct.vms_vector], [8 x i8], i16, i16, i16, i16, i8, i8, i8, i8, i8, i8, i8, i8, i16, i8, i8, i32, i32, i32, i32, [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i8], [5 x i8], i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, [3 x i8], i8, i8, i8, i8, [9 x [5 x %struct.jointlist]], i32 }
%struct.jointlist = type { i16, i16 }

@Reactors = global [7 x %struct.reactor] zeroinitializer, align 4, !dbg !0
@Num_reactors = global i32 0, align 4, !dbg !20
@ControlCenterTriggers = global %struct.control_center_triggers zeroinitializer, align 2, !dbg !23
@N_controlcen_guns = global i32 0, align 4, !dbg !36
@Control_center_been_hit = global i32 0, align 4, !dbg !38
@Control_center_player_been_seen = global i32 0, align 4, !dbg !40
@Control_center_next_fire_time = global i32 0, align 4, !dbg !42
@Control_center_present = global i32 0, align 4, !dbg !44
@Gun_pos = global [8 x %struct.vms_vector] zeroinitializer, align 4, !dbg !46
@Gun_dir = global [8 x %struct.vms_vector] zeroinitializer, align 4, !dbg !58
@.str = private unnamed_addr constant [26 x i8] c"obj->type == OBJ_CNTRLCEN\00", align 1, !dbg !60
@.str.1 = private unnamed_addr constant [58 x i8] c"/Users/richard/code/ChocolateDescent/main_d2/cntrlcen.cpp\00", align 1, !dbg !67
@.str.2 = private unnamed_addr constant [29 x i8] c"obj->render_type==RT_POLYOBJ\00", align 1, !dbg !72
@.str.3 = private unnamed_addr constant [26 x i8] c"gun_num < reactor->n_guns\00", align 1, !dbg !77
@.str.4 = private unnamed_addr constant [15 x i8] c"best_gun != -1\00", align 1, !dbg !79
@Dead_controlcen_object_num = global i32 -1, align 4, !dbg !84
@Base_control_center_explosion_time = global i32 30, align 4, !dbg !86
@Control_center_destroyed = global i32 0, align 4, !dbg !88
@Countdown_timer = global i32 0, align 4, !dbg !90
@Countdown_seconds_left = global i32 0, align 4, !dbg !92
@Total_countdown_time = global i32 0, align 4, !dbg !94
@Alan_pavlish_reactor_times = global [5 x i32] [i32 90, i32 60, i32 45, i32 35, i32 30], align 4, !dbg !96
@FrameTime = external global i32, align 4
@Objects = external global [0 x %struct.object], align 4
@Endlevel_sequence = external global i32, align 4
@CurrentDataVersion = external global i32, align 4
@Current_mission_num = external global i32, align 4
@Current_level_num = external global i32, align 4
@Last_level = external global i32, align 4
@Game_mode = external global i32, align 4
@Difficulty_level = external global i32, align 4
@ConsoleObject = external global ptr, align 8
@RealFrameTime = external global i32, align 4
@PaletteRedAdd = external global i32, align 4
@PaletteGreenAdd = external global i32, align 4
@PaletteBlueAdd = external global i32, align 4
@Segments = external global [0 x %struct.segment], align 4
@.str.5 = private unnamed_addr constant [11 x i8] c"secret.sgc\00", align 1, !dbg !101
@.str.6 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1, !dbg !106
@.str.7 = private unnamed_addr constant [40 x i8] c"Deleting secret.sgc, return value = %i\0A\00", align 1, !dbg !111
@Last_time_cc_vis_check = global i32 0, align 4, !dbg !116
@Robot_firing_enabled = external global i32, align 4
@Game_suspended = external global i32, align 4
@FrameCount = external global i32, align 4
@Players = external global [12 x %struct.player], align 4
@Player_num = external global i32, align 4
@Believed_player_pos = external global %struct.vms_vector, align 4
@GameTime = external global i32, align 4
@Player_is_dead = external global i32, align 4
@Player_time_of_death = external global i32, align 4
@Reactor_strength = global i32 -1, align 4, !dbg !118
@Highest_object_index = external global i32, align 4
@.str.8 = private unnamed_addr constant [58 x i8] c"Warning: Two or more control centers including %i and %i\0A\00", align 1, !dbg !120
@Robot_info = external global [0 x %struct.robot_info], align 4
@.str.9 = private unnamed_addr constant [49 x i8] c"Warning: Two or more bosses including %i and %i\0A\00", align 1, !dbg !122
@.str.10 = private unnamed_addr constant [29 x i8] c"Warning: No control center.\0A\00", align 1, !dbg !127
@.str.11 = private unnamed_addr constant [38 x i8] c"Mucking with reactor countdown time.\0A\00", align 1, !dbg !129

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z25calc_controlcen_gun_pointP10vms_vectorS0_P6objecti(ptr noundef %0, ptr noundef %1, ptr noundef %2, i32 noundef %3) #0 !dbg !233 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca %struct.vms_matrix, align 4
  store ptr %0, ptr %5, align 8
    #dbg_declare(ptr %5, !366, !DIExpression(), !367)
  store ptr %1, ptr %6, align 8
    #dbg_declare(ptr %6, !368, !DIExpression(), !369)
  store ptr %2, ptr %7, align 8
    #dbg_declare(ptr %7, !370, !DIExpression(), !371)
  store i32 %3, ptr %8, align 4
    #dbg_declare(ptr %8, !372, !DIExpression(), !373)
    #dbg_declare(ptr %9, !374, !DIExpression(), !376)
    #dbg_declare(ptr %10, !377, !DIExpression(), !378)
  %11 = load ptr, ptr %7, align 8, !dbg !379
  %12 = getelementptr inbounds nuw %struct.object, ptr %11, i32 0, i32 1, !dbg !379
  %13 = load i8, ptr %12, align 4, !dbg !379
  %14 = zext i8 %13 to i32, !dbg !379
  %15 = icmp eq i32 %14, 9, !dbg !379
  %16 = zext i1 %15 to i32, !dbg !379
  call void @_Z7_AssertiPKcS0_i(i32 noundef %16, ptr noundef @.str, ptr noundef @.str.1, i32 noundef 83), !dbg !379
  %17 = load ptr, ptr %7, align 8, !dbg !380
  %18 = getelementptr inbounds nuw %struct.object, ptr %17, i32 0, i32 7, !dbg !380
  %19 = load i8, ptr %18, align 4, !dbg !380
  %20 = zext i8 %19 to i32, !dbg !380
  %21 = icmp eq i32 %20, 1, !dbg !380
  %22 = zext i1 %21 to i32, !dbg !380
  call void @_Z7_AssertiPKcS0_i(i32 noundef %22, ptr noundef @.str.2, ptr noundef @.str.1, i32 noundef 84), !dbg !380
  %23 = load ptr, ptr %7, align 8, !dbg !381
  %24 = getelementptr inbounds nuw %struct.object, ptr %23, i32 0, i32 2, !dbg !382
  %25 = load i8, ptr %24, align 1, !dbg !382
  %26 = zext i8 %25 to i64, !dbg !383
  %27 = getelementptr inbounds nuw [7 x %struct.reactor], ptr @Reactors, i64 0, i64 %26, !dbg !383
  store ptr %27, ptr %9, align 8, !dbg !384
  %28 = load i32, ptr %8, align 4, !dbg !385
  %29 = load ptr, ptr %9, align 8, !dbg !385
  %30 = getelementptr inbounds nuw %struct.reactor, ptr %29, i32 0, i32 1, !dbg !385
  %31 = load i32, ptr %30, align 4, !dbg !385
  %32 = icmp slt i32 %28, %31, !dbg !385
  %33 = zext i1 %32 to i32, !dbg !385
  call void @_Z7_AssertiPKcS0_i(i32 noundef %33, ptr noundef @.str.3, ptr noundef @.str.1, i32 noundef 88), !dbg !385
  %34 = load ptr, ptr %7, align 8, !dbg !386
  %35 = getelementptr inbounds nuw %struct.object, ptr %34, i32 0, i32 12, !dbg !387
  %36 = call noundef ptr @_Z24vm_copy_transpose_matrixP10vms_matrixS0_(ptr noundef %10, ptr noundef %35), !dbg !388
  %37 = load ptr, ptr %5, align 8, !dbg !389
  %38 = load ptr, ptr %9, align 8, !dbg !390
  %39 = getelementptr inbounds nuw %struct.reactor, ptr %38, i32 0, i32 2, !dbg !391
  %40 = load i32, ptr %8, align 4, !dbg !392
  %41 = sext i32 %40 to i64, !dbg !390
  %42 = getelementptr inbounds [8 x %struct.vms_vector], ptr %39, i64 0, i64 %41, !dbg !390
  %43 = call noundef ptr @_Z13vm_vec_rotateP10vms_vectorS0_P10vms_matrix(ptr noundef %37, ptr noundef %42, ptr noundef %10), !dbg !393
  %44 = load ptr, ptr %5, align 8, !dbg !394
  %45 = load ptr, ptr %7, align 8, !dbg !395
  %46 = getelementptr inbounds nuw %struct.object, ptr %45, i32 0, i32 11, !dbg !396
  %47 = call noundef ptr @_Z11vm_vec_add2P10vms_vectorS0_(ptr noundef %44, ptr noundef %46), !dbg !397
  %48 = load ptr, ptr %6, align 8, !dbg !398
  %49 = load ptr, ptr %9, align 8, !dbg !399
  %50 = getelementptr inbounds nuw %struct.reactor, ptr %49, i32 0, i32 3, !dbg !400
  %51 = load i32, ptr %8, align 4, !dbg !401
  %52 = sext i32 %51 to i64, !dbg !399
  %53 = getelementptr inbounds [8 x %struct.vms_vector], ptr %50, i64 0, i64 %52, !dbg !399
  %54 = call noundef ptr @_Z13vm_vec_rotateP10vms_vectorS0_P10vms_matrix(ptr noundef %48, ptr noundef %53, ptr noundef %10), !dbg !402
  ret void, !dbg !403
}

declare void @_Z7_AssertiPKcS0_i(i32 noundef, ptr noundef, ptr noundef, i32 noundef) #1

declare noundef ptr @_Z24vm_copy_transpose_matrixP10vms_matrixS0_(ptr noundef, ptr noundef) #1

declare noundef ptr @_Z13vm_vec_rotateP10vms_vectorS0_P10vms_matrix(ptr noundef, ptr noundef, ptr noundef) #1

declare noundef ptr @_Z11vm_vec_add2P10vms_vectorS0_(ptr noundef, ptr noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z13calc_best_guniP10vms_vectorS0_S0_(i32 noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 !dbg !404 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca %struct.vms_vector, align 4
  store i32 %0, ptr %6, align 4
    #dbg_declare(ptr %6, !407, !DIExpression(), !408)
  store ptr %1, ptr %7, align 8
    #dbg_declare(ptr %7, !409, !DIExpression(), !410)
  store ptr %2, ptr %8, align 8
    #dbg_declare(ptr %8, !411, !DIExpression(), !412)
  store ptr %3, ptr %9, align 8
    #dbg_declare(ptr %9, !413, !DIExpression(), !414)
    #dbg_declare(ptr %10, !415, !DIExpression(), !416)
    #dbg_declare(ptr %11, !417, !DIExpression(), !418)
    #dbg_declare(ptr %12, !419, !DIExpression(), !420)
  store i32 -131072, ptr %11, align 4, !dbg !421
  store i32 -1, ptr %12, align 4, !dbg !422
  store i32 0, ptr %10, align 4, !dbg !423
  br label %15, !dbg !425

15:                                               ; preds = %39, %4
  %16 = load i32, ptr %10, align 4, !dbg !426
  %17 = load i32, ptr %6, align 4, !dbg !428
  %18 = icmp slt i32 %16, %17, !dbg !429
  br i1 %18, label %19, label %42, !dbg !430

19:                                               ; preds = %15
    #dbg_declare(ptr %13, !431, !DIExpression(), !433)
    #dbg_declare(ptr %14, !434, !DIExpression(), !435)
  %20 = load ptr, ptr %9, align 8, !dbg !436
  %21 = load ptr, ptr %7, align 8, !dbg !437
  %22 = load i32, ptr %10, align 4, !dbg !438
  %23 = sext i32 %22 to i64, !dbg !437
  %24 = getelementptr inbounds %struct.vms_vector, ptr %21, i64 %23, !dbg !437
  %25 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %14, ptr noundef %20, ptr noundef %24), !dbg !439
  %26 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %14), !dbg !440
  %27 = load ptr, ptr %8, align 8, !dbg !441
  %28 = load i32, ptr %10, align 4, !dbg !441
  %29 = sext i32 %28 to i64, !dbg !441
  %30 = getelementptr inbounds %struct.vms_vector, ptr %27, i64 %29, !dbg !441
  %31 = call noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef %30, ptr noundef %14), !dbg !441
  store i32 %31, ptr %13, align 4, !dbg !442
  %32 = load i32, ptr %13, align 4, !dbg !443
  %33 = load i32, ptr %11, align 4, !dbg !445
  %34 = icmp sgt i32 %32, %33, !dbg !446
  br i1 %34, label %35, label %38, !dbg !446

35:                                               ; preds = %19
  %36 = load i32, ptr %13, align 4, !dbg !447
  store i32 %36, ptr %11, align 4, !dbg !449
  %37 = load i32, ptr %10, align 4, !dbg !450
  store i32 %37, ptr %12, align 4, !dbg !451
  br label %38, !dbg !452

38:                                               ; preds = %35, %19
  br label %39, !dbg !453

39:                                               ; preds = %38
  %40 = load i32, ptr %10, align 4, !dbg !454
  %41 = add nsw i32 %40, 1, !dbg !454
  store i32 %41, ptr %10, align 4, !dbg !454
  br label %15, !dbg !455, !llvm.loop !456

42:                                               ; preds = %15
  %43 = load i32, ptr %12, align 4, !dbg !459
  %44 = icmp ne i32 %43, -1, !dbg !459
  %45 = zext i1 %44 to i32, !dbg !459
  call void @_Z7_AssertiPKcS0_i(i32 noundef %45, ptr noundef @.str.4, ptr noundef @.str.1, i32 noundef 146), !dbg !459
  %46 = load i32, ptr %11, align 4, !dbg !460
  %47 = icmp slt i32 %46, 0, !dbg !462
  br i1 %47, label %48, label %49, !dbg !462

48:                                               ; preds = %42
  store i32 -1, ptr %5, align 4, !dbg !463
  br label %51, !dbg !463

49:                                               ; preds = %42
  %50 = load i32, ptr %12, align 4, !dbg !464
  store i32 %50, ptr %5, align 4, !dbg !465
  br label %51, !dbg !465

51:                                               ; preds = %49, %48
  %52 = load i32, ptr %5, align 4, !dbg !466
  ret i32 %52, !dbg !466
}

declare noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef, ptr noundef, ptr noundef) #1

declare noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef) #1

declare noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef, ptr noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z24do_controlcen_dead_framev() #0 !dbg !467 {
  %1 = load i32, ptr @Dead_controlcen_object_num, align 4, !dbg !470
  %2 = icmp ne i32 %1, -1, !dbg !472
  br i1 %2, label %3, label %16, !dbg !473

3:                                                ; preds = %0
  %4 = load i32, ptr @Countdown_seconds_left, align 4, !dbg !474
  %5 = icmp sgt i32 %4, 0, !dbg !475
  br i1 %5, label %6, label %16, !dbg !473

6:                                                ; preds = %3
  %7 = call noundef i32 @_Z6P_Randv(), !dbg !476
  %8 = load i32, ptr @FrameTime, align 4, !dbg !478
  %9 = mul nsw i32 %8, 4, !dbg !479
  %10 = icmp slt i32 %7, %9, !dbg !480
  br i1 %10, label %11, label %15, !dbg !480

11:                                               ; preds = %6
  %12 = load i32, ptr @Dead_controlcen_object_num, align 4, !dbg !481
  %13 = sext i32 %12 to i64, !dbg !482
  %14 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %13, !dbg !482
  call void @_Z31create_small_fireball_on_objectP6objectii(ptr noundef %14, i32 noundef 65536, i32 noundef 1), !dbg !483
  br label %15, !dbg !483

15:                                               ; preds = %11, %6
  br label %16, !dbg !484

16:                                               ; preds = %15, %3, %0
  %17 = load i32, ptr @Control_center_destroyed, align 4, !dbg !485
  %18 = icmp ne i32 %17, 0, !dbg !485
  br i1 %18, label %19, label %23, !dbg !487

19:                                               ; preds = %16
  %20 = load i32, ptr @Endlevel_sequence, align 4, !dbg !488
  %21 = icmp ne i32 %20, 0, !dbg !488
  br i1 %21, label %23, label %22, !dbg !487

22:                                               ; preds = %19
  call void @_Z18do_countdown_framev(), !dbg !489
  br label %23, !dbg !489

23:                                               ; preds = %22, %19, %16
  ret void, !dbg !490
}

declare noundef i32 @_Z6P_Randv() #1

declare void @_Z31create_small_fireball_on_objectP6objectii(ptr noundef, i32 noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z18do_countdown_framev() #0 !dbg !491 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
    #dbg_declare(ptr %1, !492, !DIExpression(), !493)
    #dbg_declare(ptr %2, !494, !DIExpression(), !495)
    #dbg_declare(ptr %3, !496, !DIExpression(), !497)
  %7 = load i32, ptr @Control_center_destroyed, align 4, !dbg !498
  %8 = icmp ne i32 %7, 0, !dbg !498
  br i1 %8, label %10, label %9, !dbg !500

9:                                                ; preds = %0
  br label %153, !dbg !501

10:                                               ; preds = %0
  %11 = load i32, ptr @CurrentDataVersion, align 4, !dbg !502
  %12 = icmp eq i32 %11, 1, !dbg !504
  br i1 %12, label %13, label %31, !dbg !505

13:                                               ; preds = %10
  %14 = load i32, ptr @Current_mission_num, align 4, !dbg !506
  %15 = icmp eq i32 %14, 0, !dbg !507
  br i1 %15, label %16, label %31, !dbg !508

16:                                               ; preds = %13
  %17 = load i32, ptr @Current_level_num, align 4, !dbg !509
  %18 = load i32, ptr @Last_level, align 4, !dbg !510
  %19 = icmp eq i32 %17, %18, !dbg !511
  br i1 %19, label %20, label %31, !dbg !508

20:                                               ; preds = %16
  %21 = load i32, ptr @Game_mode, align 4, !dbg !512
  %22 = and i32 %21, 38, !dbg !515
  %23 = icmp ne i32 %22, 0, !dbg !516
  br i1 %23, label %25, label %24, !dbg !517

24:                                               ; preds = %20
  br label %153, !dbg !518

25:                                               ; preds = %20
  %26 = load i32, ptr @Game_mode, align 4, !dbg !519
  %27 = and i32 %26, 8, !dbg !521
  %28 = icmp ne i32 %27, 0, !dbg !519
  br i1 %28, label %29, label %30, !dbg !519

29:                                               ; preds = %25
  br label %153, !dbg !522

30:                                               ; preds = %25
  br label %31, !dbg !523

31:                                               ; preds = %30, %16, %13, %10
  %32 = load i32, ptr @Countdown_seconds_left, align 4, !dbg !524
  store i32 %32, ptr %2, align 4, !dbg !525
  %33 = load i32, ptr %2, align 4, !dbg !526
  %34 = icmp sgt i32 %33, 16, !dbg !528
  br i1 %34, label %35, label %36, !dbg !528

35:                                               ; preds = %31
  store i32 16, ptr %2, align 4, !dbg !529
  br label %36, !dbg !530

36:                                               ; preds = %35, %31
  store i32 1, ptr %3, align 4, !dbg !531
  %37 = load i32, ptr @Difficulty_level, align 4, !dbg !532
  %38 = icmp eq i32 %37, 0, !dbg !534
  br i1 %38, label %39, label %40, !dbg !534

39:                                               ; preds = %36
  store i32 4, ptr %3, align 4, !dbg !535
  br label %40, !dbg !536

40:                                               ; preds = %39, %36
  %41 = call noundef i32 @_Z6P_Randv(), !dbg !537
  %42 = sub nsw i32 %41, 16384, !dbg !538
  %43 = load i32, ptr %2, align 4, !dbg !539
  %44 = sub nsw i32 16, %43, !dbg !540
  %45 = mul nsw i32 65536, %44, !dbg !541
  %46 = sdiv i32 %45, 32, !dbg !542
  %47 = add nsw i32 12288, %46, !dbg !543
  %48 = call noundef i32 @_Z6fixmulii(i32 noundef %42, i32 noundef %47), !dbg !544
  %49 = load i32, ptr %3, align 4, !dbg !545
  %50 = sdiv i32 %48, %49, !dbg !546
  %51 = load ptr, ptr @ConsoleObject, align 8, !dbg !547
  %52 = getelementptr inbounds nuw %struct.object, ptr %51, i32 0, i32 21, !dbg !548
  %53 = getelementptr inbounds nuw %struct.physics_info, ptr %52, i32 0, i32 5, !dbg !549
  %54 = getelementptr inbounds nuw %struct.vms_vector, ptr %53, i32 0, i32 0, !dbg !550
  %55 = load i32, ptr %54, align 4, !dbg !551
  %56 = add nsw i32 %55, %50, !dbg !551
  store i32 %56, ptr %54, align 4, !dbg !551
  %57 = call noundef i32 @_Z6P_Randv(), !dbg !552
  %58 = sub nsw i32 %57, 16384, !dbg !553
  %59 = load i32, ptr %2, align 4, !dbg !554
  %60 = sub nsw i32 16, %59, !dbg !555
  %61 = mul nsw i32 65536, %60, !dbg !556
  %62 = sdiv i32 %61, 32, !dbg !557
  %63 = add nsw i32 12288, %62, !dbg !558
  %64 = call noundef i32 @_Z6fixmulii(i32 noundef %58, i32 noundef %63), !dbg !559
  %65 = load i32, ptr %3, align 4, !dbg !560
  %66 = sdiv i32 %64, %65, !dbg !561
  %67 = load ptr, ptr @ConsoleObject, align 8, !dbg !562
  %68 = getelementptr inbounds nuw %struct.object, ptr %67, i32 0, i32 21, !dbg !563
  %69 = getelementptr inbounds nuw %struct.physics_info, ptr %68, i32 0, i32 5, !dbg !564
  %70 = getelementptr inbounds nuw %struct.vms_vector, ptr %69, i32 0, i32 2, !dbg !565
  %71 = load i32, ptr %70, align 4, !dbg !566
  %72 = add nsw i32 %71, %66, !dbg !566
  store i32 %72, ptr %70, align 4, !dbg !566
  %73 = load i32, ptr @Countdown_timer, align 4, !dbg !567
  store i32 %73, ptr %1, align 4, !dbg !568
  %74 = load i32, ptr @RealFrameTime, align 4, !dbg !569
  %75 = load i32, ptr @Countdown_timer, align 4, !dbg !570
  %76 = sub nsw i32 %75, %74, !dbg !570
  store i32 %76, ptr @Countdown_timer, align 4, !dbg !570
  %77 = load i32, ptr @Countdown_timer, align 4, !dbg !571
  %78 = add nsw i32 %77, 57344, !dbg !572
  %79 = call noundef i32 @_Z3f2ii(i32 noundef %78), !dbg !573
  store i32 %79, ptr @Countdown_seconds_left, align 4, !dbg !574
  %80 = load i32, ptr %1, align 4, !dbg !575
  %81 = call noundef i32 @_Z4fl2ff(float noundef 1.275000e+01), !dbg !577
  %82 = icmp sgt i32 %80, %81, !dbg !578
  br i1 %82, label %83, label %88, !dbg !579

83:                                               ; preds = %40
  %84 = load i32, ptr @Countdown_timer, align 4, !dbg !580
  %85 = call noundef i32 @_Z4fl2ff(float noundef 1.275000e+01), !dbg !581
  %86 = icmp sle i32 %84, %85, !dbg !582
  br i1 %86, label %87, label %88, !dbg !579

87:                                               ; preds = %83
  call void @_Z16digi_play_sampleii(i32 noundef 113, i32 noundef 196608), !dbg !583
  br label %88, !dbg !585

88:                                               ; preds = %87, %83, %40
  %89 = load i32, ptr %1, align 4, !dbg !586
  %90 = add nsw i32 %89, 57344, !dbg !588
  %91 = call noundef i32 @_Z3f2ii(i32 noundef %90), !dbg !589
  %92 = load i32, ptr @Countdown_seconds_left, align 4, !dbg !590
  %93 = icmp ne i32 %91, %92, !dbg !591
  br i1 %93, label %94, label %110, !dbg !591

94:                                               ; preds = %88
  %95 = load i32, ptr @Countdown_seconds_left, align 4, !dbg !592
  %96 = icmp sge i32 %95, 0, !dbg !595
  br i1 %96, label %97, label %103, !dbg !596

97:                                               ; preds = %94
  %98 = load i32, ptr @Countdown_seconds_left, align 4, !dbg !597
  %99 = icmp slt i32 %98, 10, !dbg !598
  br i1 %99, label %100, label %103, !dbg !596

100:                                              ; preds = %97
  %101 = load i32, ptr @Countdown_seconds_left, align 4, !dbg !599
  %102 = add nsw i32 100, %101, !dbg !600
  call void @_Z16digi_play_sampleii(i32 noundef %102, i32 noundef 196608), !dbg !601
  br label %103, !dbg !601

103:                                              ; preds = %100, %97, %94
  %104 = load i32, ptr @Countdown_seconds_left, align 4, !dbg !602
  %105 = load i32, ptr @Total_countdown_time, align 4, !dbg !604
  %106 = sub nsw i32 %105, 1, !dbg !605
  %107 = icmp eq i32 %104, %106, !dbg !606
  br i1 %107, label %108, label %109, !dbg !606

108:                                              ; preds = %103
  call void @_Z16digi_play_sampleii(i32 noundef 114, i32 noundef 196608), !dbg !607
  br label %109, !dbg !607

109:                                              ; preds = %108, %103
  br label %110, !dbg !608

110:                                              ; preds = %109, %88
  %111 = load i32, ptr @Countdown_timer, align 4, !dbg !609
  %112 = icmp sgt i32 %111, 0, !dbg !611
  br i1 %112, label %113, label %136, !dbg !611

113:                                              ; preds = %110
    #dbg_declare(ptr %4, !612, !DIExpression(), !614)
    #dbg_declare(ptr %5, !615, !DIExpression(), !616)
  %114 = load i32, ptr @Total_countdown_time, align 4, !dbg !617
  %115 = call noundef i32 @_Z3i2fi(i32 noundef %114), !dbg !618
  %116 = load i32, ptr @Countdown_timer, align 4, !dbg !619
  %117 = sub nsw i32 %115, %116, !dbg !620
  %118 = call noundef i32 @_Z4fl2ff(float noundef 0x3FE4CCCCC0000000), !dbg !621
  %119 = sdiv i32 %117, %118, !dbg !622
  store i32 %119, ptr %4, align 4, !dbg !623
  %120 = load i32, ptr @Total_countdown_time, align 4, !dbg !624
  %121 = call noundef i32 @_Z3i2fi(i32 noundef %120), !dbg !625
  %122 = load i32, ptr %1, align 4, !dbg !626
  %123 = sub nsw i32 %121, %122, !dbg !627
  %124 = call noundef i32 @_Z4fl2ff(float noundef 0x3FE4CCCCC0000000), !dbg !628
  %125 = sdiv i32 %123, %124, !dbg !629
  store i32 %125, ptr %5, align 4, !dbg !630
  %126 = load i32, ptr %4, align 4, !dbg !631
  %127 = load i32, ptr %5, align 4, !dbg !633
  %128 = icmp ne i32 %126, %127, !dbg !634
  br i1 %128, label %129, label %135, !dbg !635

129:                                              ; preds = %113
  %130 = load i32, ptr @Countdown_seconds_left, align 4, !dbg !636
  %131 = load i32, ptr @Total_countdown_time, align 4, !dbg !637
  %132 = sub nsw i32 %131, 5, !dbg !638
  %133 = icmp slt i32 %130, %132, !dbg !639
  br i1 %133, label %134, label %135, !dbg !635

134:                                              ; preds = %129
  call void @_Z16digi_play_sampleii(i32 noundef 32, i32 noundef 196608), !dbg !640
  br label %135, !dbg !642

135:                                              ; preds = %134, %129, %113
  br label %153, !dbg !643

136:                                              ; preds = %110
    #dbg_declare(ptr %6, !644, !DIExpression(), !646)
  %137 = load i32, ptr %1, align 4, !dbg !647
  %138 = icmp sgt i32 %137, 0, !dbg !649
  br i1 %138, label %139, label %140, !dbg !649

139:                                              ; preds = %136
  call void @_Z16digi_play_sampleii(i32 noundef 33, i32 noundef 65536), !dbg !650
  br label %140, !dbg !650

140:                                              ; preds = %139, %136
  %141 = load i32, ptr @Countdown_timer, align 4, !dbg !651
  %142 = sub nsw i32 0, %141, !dbg !652
  %143 = mul nsw i32 %142, 16, !dbg !653
  %144 = call noundef i32 @_Z3f2ii(i32 noundef %143), !dbg !654
  store i32 %144, ptr %6, align 4, !dbg !655
  %145 = load i32, ptr %6, align 4, !dbg !656
  store i32 %145, ptr @PaletteRedAdd, align 4, !dbg !656
  %146 = load i32, ptr %6, align 4, !dbg !656
  store i32 %146, ptr @PaletteGreenAdd, align 4, !dbg !656
  %147 = load i32, ptr %6, align 4, !dbg !656
  store i32 %147, ptr @PaletteBlueAdd, align 4, !dbg !656
  %148 = load i32, ptr @PaletteBlueAdd, align 4, !dbg !657
  %149 = icmp sgt i32 %148, 64, !dbg !659
  br i1 %149, label %150, label %152, !dbg !659

150:                                              ; preds = %140
  call void @_Z21gr_set_current_canvasP11_grs_canvas(ptr noundef null), !dbg !660
  %151 = call noundef i32 @_Z21gr_find_closest_coloriii(i32 noundef 62, i32 noundef 62, i32 noundef 62), !dbg !662
  call void @_Z15gr_clear_canvasi(i32 noundef %151), !dbg !662
  call void @_Z13reset_cockpitv(), !dbg !663
  call void @_Z17reset_palette_addv(), !dbg !664
  call void @_Z12DoPlayerDeadv(), !dbg !665
  br label %152, !dbg !666

152:                                              ; preds = %150, %140
  br label %153

153:                                              ; preds = %9, %24, %29, %152, %135
  ret void, !dbg !667
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z6fixmulii(i32 noundef %0, i32 noundef %1) #2 !dbg !668 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !671, !DIExpression(), !672)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !673, !DIExpression(), !674)
  %5 = load i32, ptr %3, align 4, !dbg !675
  %6 = sext i32 %5 to i64, !dbg !675
  %7 = load i32, ptr %4, align 4, !dbg !676
  %8 = sext i32 %7 to i64, !dbg !676
  %9 = mul nsw i64 %6, %8, !dbg !677
  %10 = ashr i64 %9, 16, !dbg !678
  %11 = trunc i64 %10 to i32, !dbg !679
  ret i32 %11, !dbg !680
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z3f2ii(i32 noundef %0) #2 !dbg !681 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !684, !DIExpression(), !685)
  %3 = load i32, ptr %2, align 4, !dbg !686
  %4 = ashr i32 %3, 16, !dbg !687
  ret i32 %4, !dbg !688
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z4fl2ff(float noundef %0) #2 !dbg !689 {
  %2 = alloca float, align 4
  store float %0, ptr %2, align 4
    #dbg_declare(ptr %2, !693, !DIExpression(), !694)
  %3 = load float, ptr %2, align 4, !dbg !695
  %4 = fmul float %3, 6.553600e+04, !dbg !696
  %5 = fptosi float %4 to i32, !dbg !697
  ret i32 %5, !dbg !698
}

declare void @_Z16digi_play_sampleii(i32 noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z3i2fi(i32 noundef %0) #2 !dbg !699 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !702, !DIExpression(), !703)
  %3 = load i32, ptr %2, align 4, !dbg !704
  %4 = shl i32 %3, 16, !dbg !705
  ret i32 %4, !dbg !706
}

declare void @_Z21gr_set_current_canvasP11_grs_canvas(ptr noundef) #1

declare void @_Z15gr_clear_canvasi(i32 noundef) #1

declare noundef i32 @_Z21gr_find_closest_coloriii(i32 noundef, i32 noundef, i32 noundef) #1

declare void @_Z13reset_cockpitv() #1

declare void @_Z17reset_palette_addv() #1

declare void @_Z12DoPlayerDeadv() #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z29do_controlcen_destroyed_stuffP6object(ptr noundef %0) #0 !dbg !707 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca [1024 x i8], align 1
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !710, !DIExpression(), !711)
    #dbg_declare(ptr %3, !712, !DIExpression(), !713)
  %6 = load i32, ptr @Game_mode, align 4, !dbg !714
  %7 = and i32 %6, 8, !dbg !716
  %8 = icmp ne i32 %7, 0, !dbg !717
  br i1 %8, label %9, label %13, !dbg !718

9:                                                ; preds = %1
  %10 = load i32, ptr @Control_center_destroyed, align 4, !dbg !719
  %11 = icmp ne i32 %10, 0, !dbg !719
  br i1 %11, label %12, label %13, !dbg !718

12:                                               ; preds = %9
  br label %88, !dbg !720

13:                                               ; preds = %9, %1
  store i32 0, ptr %3, align 4, !dbg !721
  br label %14, !dbg !723

14:                                               ; preds = %31, %13
  %15 = load i32, ptr %3, align 4, !dbg !724
  %16 = load i16, ptr @ControlCenterTriggers, align 2, !dbg !726
  %17 = sext i16 %16 to i32, !dbg !727
  %18 = icmp slt i32 %15, %17, !dbg !728
  br i1 %18, label %19, label %34, !dbg !729

19:                                               ; preds = %14
  %20 = load i32, ptr %3, align 4, !dbg !730
  %21 = sext i32 %20 to i64, !dbg !731
  %22 = getelementptr inbounds [10 x i16], ptr getelementptr inbounds nuw (%struct.control_center_triggers, ptr @ControlCenterTriggers, i32 0, i32 1), i64 0, i64 %21, !dbg !731
  %23 = load i16, ptr %22, align 2, !dbg !731
  %24 = sext i16 %23 to i64, !dbg !732
  %25 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %24, !dbg !732
  %26 = load i32, ptr %3, align 4, !dbg !733
  %27 = sext i32 %26 to i64, !dbg !734
  %28 = getelementptr inbounds [10 x i16], ptr getelementptr inbounds nuw (%struct.control_center_triggers, ptr @ControlCenterTriggers, i32 0, i32 2), i64 0, i64 %27, !dbg !734
  %29 = load i16, ptr %28, align 2, !dbg !734
  %30 = sext i16 %29 to i32, !dbg !734
  call void @_Z11wall_toggleP7segmenti(ptr noundef %25, i32 noundef %30), !dbg !735
  br label %31, !dbg !735

31:                                               ; preds = %19
  %32 = load i32, ptr %3, align 4, !dbg !736
  %33 = add nsw i32 %32, 1, !dbg !736
  store i32 %33, ptr %3, align 4, !dbg !736
  br label %14, !dbg !737, !llvm.loop !738

34:                                               ; preds = %14
  store i32 1, ptr @Control_center_destroyed, align 4, !dbg !740
  %35 = load i32, ptr @Current_level_num, align 4, !dbg !741
  %36 = icmp slt i32 %35, 0, !dbg !743
  br i1 %36, label %37, label %42, !dbg !743

37:                                               ; preds = %34
    #dbg_declare(ptr %4, !744, !DIExpression(), !746)
    #dbg_declare(ptr %5, !747, !DIExpression(), !751)
  %38 = getelementptr inbounds [1024 x i8], ptr %5, i64 0, i64 0, !dbg !752
  call void @_Z18get_full_file_pathPcPKcS1_(ptr noundef %38, ptr noundef @.str.5, ptr noundef @.str.6), !dbg !753
  %39 = getelementptr inbounds [1024 x i8], ptr %5, i64 0, i64 0, !dbg !754
  %40 = call i32 @unlink(ptr noundef %39), !dbg !754
  store i32 %40, ptr %4, align 4, !dbg !755
  %41 = load i32, ptr %4, align 4, !dbg !756
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.7, i32 noundef %41), !dbg !756
  br label %42, !dbg !757

42:                                               ; preds = %37, %34
  %43 = load i32, ptr @CurrentDataVersion, align 4, !dbg !758
  %44 = icmp eq i32 %43, 0, !dbg !760
  br i1 %44, label %45, label %55, !dbg !760

45:                                               ; preds = %42
  %46 = load i32, ptr @Base_control_center_explosion_time, align 4, !dbg !761
  %47 = load i32, ptr @Base_control_center_explosion_time, align 4, !dbg !763
  %48 = load i32, ptr @Difficulty_level, align 4, !dbg !764
  %49 = sub nsw i32 5, %48, !dbg !765
  %50 = sub nsw i32 %49, 1, !dbg !766
  %51 = mul nsw i32 %47, %50, !dbg !767
  %52 = sdiv i32 %51, 4, !dbg !768
  %53 = add nsw i32 %46, %52, !dbg !769
  %54 = sub nsw i32 %53, 1, !dbg !770
  store i32 %54, ptr @Total_countdown_time, align 4, !dbg !771
  br label %73, !dbg !772

55:                                               ; preds = %42
  %56 = load i32, ptr @Base_control_center_explosion_time, align 4, !dbg !773
  %57 = icmp ne i32 %56, 30, !dbg !776
  br i1 %57, label %58, label %67, !dbg !776

58:                                               ; preds = %55
  %59 = load i32, ptr @Base_control_center_explosion_time, align 4, !dbg !777
  %60 = load i32, ptr @Base_control_center_explosion_time, align 4, !dbg !778
  %61 = load i32, ptr @Difficulty_level, align 4, !dbg !779
  %62 = sub nsw i32 5, %61, !dbg !780
  %63 = sub nsw i32 %62, 1, !dbg !781
  %64 = mul nsw i32 %60, %63, !dbg !782
  %65 = sdiv i32 %64, 2, !dbg !783
  %66 = add nsw i32 %59, %65, !dbg !784
  store i32 %66, ptr @Total_countdown_time, align 4, !dbg !785
  br label %72, !dbg !786

67:                                               ; preds = %55
  %68 = load i32, ptr @Difficulty_level, align 4, !dbg !787
  %69 = sext i32 %68 to i64, !dbg !788
  %70 = getelementptr inbounds [5 x i32], ptr @Alan_pavlish_reactor_times, i64 0, i64 %69, !dbg !788
  %71 = load i32, ptr %70, align 4, !dbg !788
  store i32 %71, ptr @Total_countdown_time, align 4, !dbg !789
  br label %72

72:                                               ; preds = %67, %58
  br label %73

73:                                               ; preds = %72, %45
  %74 = load i32, ptr @Total_countdown_time, align 4, !dbg !790
  %75 = call noundef i32 @_Z3i2fi(i32 noundef %74), !dbg !791
  store i32 %75, ptr @Countdown_timer, align 4, !dbg !792
  %76 = load i32, ptr @Control_center_present, align 4, !dbg !793
  %77 = icmp ne i32 %76, 0, !dbg !793
  br i1 %77, label %78, label %81, !dbg !795

78:                                               ; preds = %73
  %79 = load ptr, ptr %2, align 8, !dbg !796
  %80 = icmp eq ptr %79, null, !dbg !797
  br i1 %80, label %81, label %82, !dbg !795

81:                                               ; preds = %78, %73
  br label %88, !dbg !798

82:                                               ; preds = %78
  %83 = load ptr, ptr %2, align 8, !dbg !800
  %84 = ptrtoint ptr %83 to i64, !dbg !801
  %85 = sub i64 %84, ptrtoint (ptr @Objects to i64), !dbg !801
  %86 = sdiv exact i64 %85, 268, !dbg !801
  %87 = trunc i64 %86 to i32, !dbg !800
  store i32 %87, ptr @Dead_controlcen_object_num, align 4, !dbg !802
  br label %88, !dbg !803

88:                                               ; preds = %82, %81, %12
  ret void, !dbg !803
}

declare void @_Z11wall_toggleP7segmenti(ptr noundef, i32 noundef) #1

declare void @_Z18get_full_file_pathPcPKcS1_(ptr noundef, ptr noundef, ptr noundef) #1

declare i32 @unlink(ptr noundef) #1

declare void @_Z8_mprintfiPKcz(i32 noundef, ptr noundef, ...) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z19do_controlcen_frameP6object(ptr noundef %0) #0 !dbg !804 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca %struct.vms_vector, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca %struct.vms_vector, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca %struct.vms_vector, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca %struct.vms_vector, align 4
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !805, !DIExpression(), !806)
    #dbg_declare(ptr %3, !807, !DIExpression(), !808)
  %16 = load i32, ptr @Control_center_present, align 4, !dbg !809
  %17 = icmp ne i32 %16, 0, !dbg !809
  br i1 %17, label %19, label %18, !dbg !811

18:                                               ; preds = %1
  br label %248, !dbg !812

19:                                               ; preds = %1
  %20 = load i32, ptr @Robot_firing_enabled, align 4, !dbg !813
  %21 = icmp ne i32 %20, 0, !dbg !813
  br i1 %21, label %22, label %26, !dbg !815

22:                                               ; preds = %19
  %23 = load i32, ptr @Game_suspended, align 4, !dbg !816
  %24 = and i32 %23, 1, !dbg !817
  %25 = icmp ne i32 %24, 0, !dbg !818
  br i1 %25, label %26, label %27, !dbg !815

26:                                               ; preds = %22, %19
  br label %248, !dbg !819

27:                                               ; preds = %22
  %28 = load i32, ptr @Control_center_been_hit, align 4, !dbg !820
  %29 = icmp ne i32 %28, 0, !dbg !820
  br i1 %29, label %94, label %30, !dbg !822

30:                                               ; preds = %27
  %31 = load i32, ptr @Control_center_player_been_seen, align 4, !dbg !823
  %32 = icmp ne i32 %31, 0, !dbg !823
  br i1 %32, label %94, label %33, !dbg !824

33:                                               ; preds = %30
  %34 = load i32, ptr @FrameCount, align 4, !dbg !825
  %35 = srem i32 %34, 8, !dbg !828
  %36 = icmp ne i32 %35, 0, !dbg !829
  br i1 %36, label %93, label %37, !dbg !830

37:                                               ; preds = %33
    #dbg_declare(ptr %4, !831, !DIExpression(), !833)
    #dbg_declare(ptr %5, !834, !DIExpression(), !835)
    #dbg_declare(ptr %6, !836, !DIExpression(), !837)
    #dbg_declare(ptr %7, !838, !DIExpression(), !875)
  %38 = load ptr, ptr %2, align 8, !dbg !876
  %39 = getelementptr inbounds nuw %struct.object, ptr %38, i32 0, i32 9, !dbg !877
  %40 = load i16, ptr %39, align 2, !dbg !877
  %41 = sext i16 %40 to i64, !dbg !878
  %42 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %41, !dbg !878
  store ptr %42, ptr %7, align 8, !dbg !875
  %43 = load i32, ptr @Game_mode, align 4, !dbg !879
  %44 = and i32 %43, 38, !dbg !881
  %45 = icmp ne i32 %44, 0, !dbg !879
  br i1 %45, label %46, label %55, !dbg !879

46:                                               ; preds = %37
  %47 = load i32, ptr @Player_num, align 4, !dbg !882
  %48 = sext i32 %47 to i64, !dbg !883
  %49 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %48, !dbg !883
  %50 = getelementptr inbounds nuw %struct.player, ptr %49, i32 0, i32 4, !dbg !884
  %51 = load i32, ptr %50, align 4, !dbg !884
  %52 = sext i32 %51 to i64, !dbg !885
  %53 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %52, !dbg !885
  %54 = getelementptr inbounds nuw %struct.object, ptr %53, i32 0, i32 11, !dbg !886
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 @Believed_player_pos, ptr align 4 %54, i64 12, i1 false), !dbg !887
  br label %55, !dbg !888

55:                                               ; preds = %46, %37
  store i32 0, ptr %6, align 4, !dbg !889
  br label %56, !dbg !891

56:                                               ; preds = %70, %55
  %57 = load i32, ptr %6, align 4, !dbg !892
  %58 = icmp slt i32 %57, 6, !dbg !894
  br i1 %58, label %59, label %73, !dbg !895

59:                                               ; preds = %56
  %60 = load ptr, ptr %7, align 8, !dbg !896
  %61 = getelementptr inbounds nuw %struct.segment, ptr %60, i32 0, i32 1, !dbg !896
  %62 = load i32, ptr %6, align 4, !dbg !896
  %63 = sext i32 %62 to i64, !dbg !896
  %64 = getelementptr inbounds [6 x i16], ptr %61, i64 0, i64 %63, !dbg !896
  %65 = load i16, ptr %64, align 2, !dbg !896
  %66 = sext i16 %65 to i32, !dbg !896
  %67 = icmp sgt i32 %66, -1, !dbg !896
  br i1 %67, label %68, label %69, !dbg !896

68:                                               ; preds = %59
  br label %74, !dbg !898

69:                                               ; preds = %59
  br label %70, !dbg !896

70:                                               ; preds = %69
  %71 = load i32, ptr %6, align 4, !dbg !899
  %72 = add nsw i32 %71, 1, !dbg !899
  store i32 %72, ptr %6, align 4, !dbg !899
  br label %56, !dbg !900, !llvm.loop !901

73:                                               ; preds = %56
  br label %74, !dbg !903

74:                                               ; preds = %73, %68
  %75 = load i32, ptr %6, align 4, !dbg !903
  %76 = icmp eq i32 %75, 6, !dbg !905
  br i1 %76, label %77, label %78, !dbg !905

77:                                               ; preds = %74
  br label %248, !dbg !906

78:                                               ; preds = %74
  %79 = load ptr, ptr @ConsoleObject, align 8, !dbg !907
  %80 = getelementptr inbounds nuw %struct.object, ptr %79, i32 0, i32 11, !dbg !908
  %81 = load ptr, ptr %2, align 8, !dbg !909
  %82 = getelementptr inbounds nuw %struct.object, ptr %81, i32 0, i32 11, !dbg !910
  %83 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %4, ptr noundef %80, ptr noundef %82), !dbg !911
  %84 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %4), !dbg !912
  store i32 %84, ptr %5, align 4, !dbg !913
  %85 = load i32, ptr %5, align 4, !dbg !914
  %86 = icmp slt i32 %85, 13107200, !dbg !916
  br i1 %86, label %87, label %92, !dbg !916

87:                                               ; preds = %78
  %88 = load ptr, ptr %2, align 8, !dbg !917
  %89 = load ptr, ptr %2, align 8, !dbg !919
  %90 = getelementptr inbounds nuw %struct.object, ptr %89, i32 0, i32 11, !dbg !920
  %91 = call noundef i32 @_Z29player_is_visible_from_objectP6objectP10vms_vectoriS2_(ptr noundef %88, ptr noundef %90, i32 noundef 0, ptr noundef %4), !dbg !921
  store i32 %91, ptr @Control_center_player_been_seen, align 4, !dbg !922
  store i32 0, ptr @Control_center_next_fire_time, align 4, !dbg !923
  br label %92, !dbg !924

92:                                               ; preds = %87, %78
  br label %93, !dbg !925

93:                                               ; preds = %92, %33
  br label %248, !dbg !926

94:                                               ; preds = %30, %27
  %95 = load i32, ptr @Control_center_been_hit, align 4, !dbg !927
  %96 = icmp ne i32 %95, 0, !dbg !927
  br i1 %96, label %100, label %97, !dbg !929

97:                                               ; preds = %94
  %98 = load i32, ptr @Control_center_player_been_seen, align 4, !dbg !930
  %99 = icmp ne i32 %98, 0, !dbg !930
  br i1 %99, label %100, label %130, !dbg !929

100:                                              ; preds = %97, %94
  %101 = load i32, ptr @Last_time_cc_vis_check, align 4, !dbg !931
  %102 = add nsw i32 %101, 327680, !dbg !934
  %103 = load i32, ptr @GameTime, align 4, !dbg !935
  %104 = icmp slt i32 %102, %103, !dbg !936
  br i1 %104, label %109, label %105, !dbg !937

105:                                              ; preds = %100
  %106 = load i32, ptr @Last_time_cc_vis_check, align 4, !dbg !938
  %107 = load i32, ptr @GameTime, align 4, !dbg !939
  %108 = icmp sgt i32 %106, %107, !dbg !940
  br i1 %108, label %109, label %129, !dbg !937

109:                                              ; preds = %105, %100
    #dbg_declare(ptr %8, !941, !DIExpression(), !943)
    #dbg_declare(ptr %9, !944, !DIExpression(), !945)
  %110 = load ptr, ptr @ConsoleObject, align 8, !dbg !946
  %111 = getelementptr inbounds nuw %struct.object, ptr %110, i32 0, i32 11, !dbg !947
  %112 = load ptr, ptr %2, align 8, !dbg !948
  %113 = getelementptr inbounds nuw %struct.object, ptr %112, i32 0, i32 11, !dbg !949
  %114 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %8, ptr noundef %111, ptr noundef %113), !dbg !950
  %115 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %8), !dbg !951
  store i32 %115, ptr %9, align 4, !dbg !952
  %116 = load i32, ptr @GameTime, align 4, !dbg !953
  store i32 %116, ptr @Last_time_cc_vis_check, align 4, !dbg !954
  %117 = load i32, ptr %9, align 4, !dbg !955
  %118 = icmp slt i32 %117, 7864320, !dbg !957
  br i1 %118, label %119, label %128, !dbg !957

119:                                              ; preds = %109
  %120 = load ptr, ptr %2, align 8, !dbg !958
  %121 = load ptr, ptr %2, align 8, !dbg !960
  %122 = getelementptr inbounds nuw %struct.object, ptr %121, i32 0, i32 11, !dbg !961
  %123 = call noundef i32 @_Z29player_is_visible_from_objectP6objectP10vms_vectoriS2_(ptr noundef %120, ptr noundef %122, i32 noundef 0, ptr noundef %8), !dbg !962
  store i32 %123, ptr @Control_center_player_been_seen, align 4, !dbg !963
  %124 = load i32, ptr @Control_center_player_been_seen, align 4, !dbg !964
  %125 = icmp ne i32 %124, 0, !dbg !964
  br i1 %125, label %127, label %126, !dbg !966

126:                                              ; preds = %119
  store i32 0, ptr @Control_center_been_hit, align 4, !dbg !967
  br label %127, !dbg !968

127:                                              ; preds = %126, %119
  br label %128, !dbg !969

128:                                              ; preds = %127, %109
  br label %129, !dbg !970

129:                                              ; preds = %128, %105
  br label %130, !dbg !971

130:                                              ; preds = %129, %97
  %131 = load i32, ptr @Control_center_next_fire_time, align 4, !dbg !972
  %132 = icmp slt i32 %131, 0, !dbg !974
  br i1 %132, label %133, label %244, !dbg !975

133:                                              ; preds = %130
  %134 = load i32, ptr @Player_is_dead, align 4, !dbg !976
  %135 = icmp ne i32 %134, 0, !dbg !976
  br i1 %135, label %136, label %141, !dbg !977

136:                                              ; preds = %133
  %137 = load i32, ptr @GameTime, align 4, !dbg !978
  %138 = load i32, ptr @Player_time_of_death, align 4, !dbg !979
  %139 = add nsw i32 %138, 131072, !dbg !980
  %140 = icmp sgt i32 %137, %139, !dbg !981
  br i1 %140, label %244, label %141, !dbg !975

141:                                              ; preds = %136, %133
  %142 = load i32, ptr @Player_num, align 4, !dbg !982
  %143 = sext i32 %142 to i64, !dbg !985
  %144 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %143, !dbg !985
  %145 = getelementptr inbounds nuw %struct.player, ptr %144, i32 0, i32 7, !dbg !986
  %146 = load i32, ptr %145, align 4, !dbg !986
  %147 = and i32 %146, 2048, !dbg !987
  %148 = icmp ne i32 %147, 0, !dbg !985
  br i1 %148, label %149, label %152, !dbg !985

149:                                              ; preds = %141
  %150 = load i32, ptr @N_controlcen_guns, align 4, !dbg !988
  %151 = call noundef i32 @_Z13calc_best_guniP10vms_vectorS0_S0_(i32 noundef %150, ptr noundef @Gun_pos, ptr noundef @Gun_dir, ptr noundef @Believed_player_pos), !dbg !989
  store i32 %151, ptr %3, align 4, !dbg !990
  br label %157, !dbg !991

152:                                              ; preds = %141
  %153 = load i32, ptr @N_controlcen_guns, align 4, !dbg !992
  %154 = load ptr, ptr @ConsoleObject, align 8, !dbg !993
  %155 = getelementptr inbounds nuw %struct.object, ptr %154, i32 0, i32 11, !dbg !994
  %156 = call noundef i32 @_Z13calc_best_guniP10vms_vectorS0_S0_(i32 noundef %153, ptr noundef @Gun_pos, ptr noundef @Gun_dir, ptr noundef %155), !dbg !995
  store i32 %156, ptr %3, align 4, !dbg !996
  br label %157

157:                                              ; preds = %152, %149
  %158 = load i32, ptr %3, align 4, !dbg !997
  %159 = icmp ne i32 %158, -1, !dbg !999
  br i1 %159, label %160, label %243, !dbg !999

160:                                              ; preds = %157
    #dbg_declare(ptr %10, !1000, !DIExpression(), !1002)
    #dbg_declare(ptr %11, !1003, !DIExpression(), !1004)
    #dbg_declare(ptr %12, !1005, !DIExpression(), !1006)
    #dbg_declare(ptr %13, !1007, !DIExpression(), !1008)
    #dbg_declare(ptr %14, !1009, !DIExpression(), !1010)
  %161 = load i32, ptr @Player_num, align 4, !dbg !1011
  %162 = sext i32 %161 to i64, !dbg !1013
  %163 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %162, !dbg !1013
  %164 = getelementptr inbounds nuw %struct.player, ptr %163, i32 0, i32 7, !dbg !1014
  %165 = load i32, ptr %164, align 4, !dbg !1014
  %166 = and i32 %165, 2048, !dbg !1015
  %167 = icmp ne i32 %166, 0, !dbg !1013
  br i1 %167, label %168, label %174, !dbg !1013

168:                                              ; preds = %160
  %169 = load i32, ptr %3, align 4, !dbg !1016
  %170 = sext i32 %169 to i64, !dbg !1018
  %171 = getelementptr inbounds [8 x %struct.vms_vector], ptr @Gun_pos, i64 0, i64 %170, !dbg !1018
  %172 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %12, ptr noundef @Believed_player_pos, ptr noundef %171), !dbg !1019
  %173 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %12), !dbg !1020
  store i32 %173, ptr %13, align 4, !dbg !1021
  br label %182, !dbg !1022

174:                                              ; preds = %160
  %175 = load ptr, ptr @ConsoleObject, align 8, !dbg !1023
  %176 = getelementptr inbounds nuw %struct.object, ptr %175, i32 0, i32 11, !dbg !1025
  %177 = load i32, ptr %3, align 4, !dbg !1026
  %178 = sext i32 %177 to i64, !dbg !1027
  %179 = getelementptr inbounds [8 x %struct.vms_vector], ptr @Gun_pos, i64 0, i64 %178, !dbg !1027
  %180 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %12, ptr noundef %176, ptr noundef %179), !dbg !1028
  %181 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %12), !dbg !1029
  store i32 %181, ptr %13, align 4, !dbg !1030
  br label %182

182:                                              ; preds = %174, %168
  %183 = load i32, ptr %13, align 4, !dbg !1031
  %184 = icmp sgt i32 %183, 19660800, !dbg !1033
  br i1 %184, label %185, label %186, !dbg !1033

185:                                              ; preds = %182
  store i32 0, ptr @Control_center_been_hit, align 4, !dbg !1034
  store i32 0, ptr @Control_center_player_been_seen, align 4, !dbg !1036
  br label %248, !dbg !1037

186:                                              ; preds = %182
  %187 = load i32, ptr %3, align 4, !dbg !1038
  %188 = sext i32 %187 to i64, !dbg !1039
  %189 = getelementptr inbounds [8 x %struct.vms_vector], ptr @Gun_pos, i64 0, i64 %188, !dbg !1039
  %190 = load ptr, ptr %2, align 8, !dbg !1040
  %191 = ptrtoint ptr %190 to i64, !dbg !1041
  %192 = sub i64 %191, ptrtoint (ptr @Objects to i64), !dbg !1041
  %193 = sdiv exact i64 %192, 268, !dbg !1041
  %194 = trunc i64 %193 to i32, !dbg !1040
  %195 = call noundef i32 @_Z21Laser_create_new_easyP10vms_vectorS0_iii(ptr noundef %12, ptr noundef %189, i32 noundef %194, i32 noundef 6, i32 noundef 1), !dbg !1042
  %196 = load i32, ptr @Current_level_num, align 4, !dbg !1043
  %197 = call i32 @llvm.abs.i32(i32 %196, i1 true), !dbg !1044
  %198 = sdiv i32 %197, 4, !dbg !1045
  %199 = add nsw i32 %198, 2, !dbg !1046
  %200 = sdiv i32 65536, %199, !dbg !1047
  store i32 %200, ptr %10, align 4, !dbg !1048
  store i32 0, ptr %11, align 4, !dbg !1049
  br label %201, !dbg !1050

201:                                              ; preds = %210, %186
  %202 = call noundef i32 @_Z6P_Randv(), !dbg !1051
  %203 = load i32, ptr %10, align 4, !dbg !1052
  %204 = icmp sgt i32 %202, %203, !dbg !1053
  br i1 %204, label %205, label %208, !dbg !1054

205:                                              ; preds = %201
  %206 = load i32, ptr %11, align 4, !dbg !1055
  %207 = icmp slt i32 %206, 4, !dbg !1056
  br label %208

208:                                              ; preds = %205, %201
  %209 = phi i1 [ false, %201 ], [ %207, %205 ], !dbg !1057
  br i1 %209, label %210, label %224, !dbg !1050

210:                                              ; preds = %208
    #dbg_declare(ptr %15, !1058, !DIExpression(), !1060)
  call void @_Z18make_random_vectorP10vms_vector(ptr noundef %15), !dbg !1061
  %211 = call noundef ptr @_Z17vm_vec_scale_add2P10vms_vectorS0_i(ptr noundef %12, ptr noundef %15, i32 noundef 10922), !dbg !1062
  %212 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %12), !dbg !1063
  %213 = load i32, ptr %3, align 4, !dbg !1064
  %214 = sext i32 %213 to i64, !dbg !1065
  %215 = getelementptr inbounds [8 x %struct.vms_vector], ptr @Gun_pos, i64 0, i64 %214, !dbg !1065
  %216 = load ptr, ptr %2, align 8, !dbg !1066
  %217 = ptrtoint ptr %216 to i64, !dbg !1067
  %218 = sub i64 %217, ptrtoint (ptr @Objects to i64), !dbg !1067
  %219 = sdiv exact i64 %218, 268, !dbg !1067
  %220 = trunc i64 %219 to i32, !dbg !1066
  %221 = call noundef i32 @_Z21Laser_create_new_easyP10vms_vectorS0_iii(ptr noundef %12, ptr noundef %215, i32 noundef %220, i32 noundef 6, i32 noundef 0), !dbg !1068
  %222 = load i32, ptr %11, align 4, !dbg !1069
  %223 = add nsw i32 %222, 1, !dbg !1069
  store i32 %223, ptr %11, align 4, !dbg !1069
  br label %201, !dbg !1050, !llvm.loop !1070

224:                                              ; preds = %208
  %225 = load i32, ptr @Difficulty_level, align 4, !dbg !1072
  %226 = sub nsw i32 5, %225, !dbg !1073
  %227 = mul nsw i32 %226, 65536, !dbg !1074
  %228 = sdiv i32 %227, 4, !dbg !1075
  store i32 %228, ptr %14, align 4, !dbg !1076
  %229 = load i32, ptr @Difficulty_level, align 4, !dbg !1077
  %230 = icmp eq i32 %229, 0, !dbg !1079
  br i1 %230, label %231, label %234, !dbg !1079

231:                                              ; preds = %224
  %232 = load i32, ptr %14, align 4, !dbg !1080
  %233 = add nsw i32 %232, 32768, !dbg !1080
  store i32 %233, ptr %14, align 4, !dbg !1080
  br label %234, !dbg !1081

234:                                              ; preds = %231, %224
  %235 = load i32, ptr @Game_mode, align 4, !dbg !1082
  %236 = and i32 %235, 38, !dbg !1084
  %237 = icmp ne i32 %236, 0, !dbg !1082
  br i1 %237, label %238, label %241, !dbg !1082

238:                                              ; preds = %234
  %239 = load i32, ptr %14, align 4, !dbg !1085
  %240 = mul nsw i32 %239, 2, !dbg !1085
  store i32 %240, ptr %14, align 4, !dbg !1085
  br label %241, !dbg !1086

241:                                              ; preds = %238, %234
  %242 = load i32, ptr %14, align 4, !dbg !1087
  store i32 %242, ptr @Control_center_next_fire_time, align 4, !dbg !1088
  br label %243, !dbg !1089

243:                                              ; preds = %241, %157
  br label %248, !dbg !1090

244:                                              ; preds = %136, %130
  %245 = load i32, ptr @FrameTime, align 4, !dbg !1091
  %246 = load i32, ptr @Control_center_next_fire_time, align 4, !dbg !1092
  %247 = sub nsw i32 %246, %245, !dbg !1092
  store i32 %247, ptr @Control_center_next_fire_time, align 4, !dbg !1092
  br label %248

248:                                              ; preds = %18, %26, %77, %93, %185, %244, %243
  ret void, !dbg !1093
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

declare noundef i32 @_Z29player_is_visible_from_objectP6objectP10vms_vectoriS2_(ptr noundef, ptr noundef, i32 noundef, ptr noundef) #1

declare noundef i32 @_Z21Laser_create_new_easyP10vms_vectorS0_iii(ptr noundef, ptr noundef, i32 noundef, i32 noundef, i32 noundef) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.abs.i32(i32, i1 immarg) #4

declare void @_Z18make_random_vectorP10vms_vector(ptr noundef) #1

declare noundef ptr @_Z17vm_vec_scale_add2P10vms_vectorS0_i(ptr noundef, ptr noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z25init_controlcen_for_levelv() #0 !dbg !1094 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
    #dbg_declare(ptr %1, !1095, !DIExpression(), !1096)
    #dbg_declare(ptr %2, !1097, !DIExpression(), !1098)
    #dbg_declare(ptr %3, !1099, !DIExpression(), !1100)
  store i32 -1, ptr %3, align 4, !dbg !1100
    #dbg_declare(ptr %4, !1101, !DIExpression(), !1102)
  store i32 -1, ptr %4, align 4, !dbg !1102
  store i32 0, ptr %1, align 4, !dbg !1103
  br label %5, !dbg !1105

5:                                                ; preds = %52, %0
  %6 = load i32, ptr %1, align 4, !dbg !1106
  %7 = load i32, ptr @Highest_object_index, align 4, !dbg !1108
  %8 = icmp sle i32 %6, %7, !dbg !1109
  br i1 %8, label %9, label %55, !dbg !1110

9:                                                ; preds = %5
  %10 = load i32, ptr %1, align 4, !dbg !1111
  %11 = sext i32 %10 to i64, !dbg !1113
  %12 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %11, !dbg !1113
  store ptr %12, ptr %2, align 8, !dbg !1114
  %13 = load ptr, ptr %2, align 8, !dbg !1115
  %14 = getelementptr inbounds nuw %struct.object, ptr %13, i32 0, i32 1, !dbg !1117
  %15 = load i8, ptr %14, align 4, !dbg !1117
  %16 = zext i8 %15 to i32, !dbg !1115
  %17 = icmp eq i32 %16, 9, !dbg !1118
  br i1 %17, label %18, label %27, !dbg !1118

18:                                               ; preds = %9
  %19 = load i32, ptr %3, align 4, !dbg !1119
  %20 = icmp ne i32 %19, -1, !dbg !1121
  br i1 %20, label %21, label %24, !dbg !1121

21:                                               ; preds = %18
  %22 = load i32, ptr %1, align 4, !dbg !1122
  %23 = load i32, ptr %3, align 4, !dbg !1122
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 1, ptr noundef @.str.8, i32 noundef %22, i32 noundef %23), !dbg !1122
  br label %26, !dbg !1122

24:                                               ; preds = %18
  %25 = load i32, ptr %1, align 4, !dbg !1123
  store i32 %25, ptr %3, align 4, !dbg !1124
  br label %26

26:                                               ; preds = %24, %21
  br label %27, !dbg !1125

27:                                               ; preds = %26, %9
  %28 = load ptr, ptr %2, align 8, !dbg !1126
  %29 = getelementptr inbounds nuw %struct.object, ptr %28, i32 0, i32 1, !dbg !1128
  %30 = load i8, ptr %29, align 4, !dbg !1128
  %31 = zext i8 %30 to i32, !dbg !1126
  %32 = icmp eq i32 %31, 2, !dbg !1129
  br i1 %32, label %33, label %51, !dbg !1130

33:                                               ; preds = %27
  %34 = load ptr, ptr %2, align 8, !dbg !1131
  %35 = getelementptr inbounds nuw %struct.object, ptr %34, i32 0, i32 2, !dbg !1132
  %36 = load i8, ptr %35, align 1, !dbg !1132
  %37 = zext i8 %36 to i64, !dbg !1133
  %38 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %37, !dbg !1133
  %39 = getelementptr inbounds nuw %struct.robot_info, ptr %38, i32 0, i32 36, !dbg !1134
  %40 = load i8, ptr %39, align 4, !dbg !1134
  %41 = icmp ne i8 %40, 0, !dbg !1135
  br i1 %41, label %42, label %51, !dbg !1130

42:                                               ; preds = %33
  %43 = load i32, ptr %4, align 4, !dbg !1136
  %44 = icmp ne i32 %43, -1, !dbg !1139
  br i1 %44, label %45, label %48, !dbg !1139

45:                                               ; preds = %42
  %46 = load i32, ptr %1, align 4, !dbg !1140
  %47 = load i32, ptr %4, align 4, !dbg !1140
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 1, ptr noundef @.str.9, i32 noundef %46, i32 noundef %47), !dbg !1140
  br label %50, !dbg !1140

48:                                               ; preds = %42
  %49 = load i32, ptr %1, align 4, !dbg !1141
  store i32 %49, ptr %4, align 4, !dbg !1142
  br label %50

50:                                               ; preds = %48, %45
  br label %51, !dbg !1143

51:                                               ; preds = %50, %33, %27
  br label %52, !dbg !1144

52:                                               ; preds = %51
  %53 = load i32, ptr %1, align 4, !dbg !1145
  %54 = add nsw i32 %53, 1, !dbg !1145
  store i32 %54, ptr %1, align 4, !dbg !1145
  br label %5, !dbg !1146, !llvm.loop !1147

55:                                               ; preds = %5
  %56 = load i32, ptr %3, align 4, !dbg !1149
  %57 = icmp eq i32 %56, -1, !dbg !1151
  br i1 %57, label %58, label %59, !dbg !1151

58:                                               ; preds = %55
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 1, ptr noundef @.str.10), !dbg !1152
  store i32 0, ptr @Control_center_been_hit, align 4, !dbg !1154
  store i32 0, ptr @Control_center_player_been_seen, align 4, !dbg !1155
  store i32 0, ptr @Control_center_next_fire_time, align 4, !dbg !1156
  store i32 -1, ptr @Dead_controlcen_object_num, align 4, !dbg !1157
  br label %137, !dbg !1158

59:                                               ; preds = %55
  %60 = load i32, ptr %4, align 4, !dbg !1159
  %61 = icmp ne i32 %60, -1, !dbg !1161
  br i1 %61, label %62, label %83, !dbg !1162

62:                                               ; preds = %59
  %63 = load i32, ptr @Game_mode, align 4, !dbg !1163
  %64 = and i32 %63, 38, !dbg !1164
  %65 = icmp ne i32 %64, 0, !dbg !1165
  br i1 %65, label %66, label %70, !dbg !1166

66:                                               ; preds = %62
  %67 = load i32, ptr @Game_mode, align 4, !dbg !1167
  %68 = and i32 %67, 8, !dbg !1168
  %69 = icmp ne i32 %68, 0, !dbg !1169
  br i1 %69, label %70, label %83, !dbg !1162

70:                                               ; preds = %66, %62
  %71 = load i32, ptr %3, align 4, !dbg !1170
  %72 = icmp ne i32 %71, -1, !dbg !1173
  br i1 %72, label %73, label %82, !dbg !1173

73:                                               ; preds = %70
  %74 = load i32, ptr %3, align 4, !dbg !1174
  %75 = sext i32 %74 to i64, !dbg !1176
  %76 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %75, !dbg !1176
  %77 = getelementptr inbounds nuw %struct.object, ptr %76, i32 0, i32 1, !dbg !1177
  store i8 12, ptr %77, align 4, !dbg !1178
  %78 = load i32, ptr %3, align 4, !dbg !1179
  %79 = sext i32 %78 to i64, !dbg !1180
  %80 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %79, !dbg !1180
  %81 = getelementptr inbounds nuw %struct.object, ptr %80, i32 0, i32 7, !dbg !1181
  store i8 0, ptr %81, align 4, !dbg !1182
  store i32 0, ptr @Control_center_present, align 4, !dbg !1183
  br label %82, !dbg !1184

82:                                               ; preds = %73, %70
  br label %136, !dbg !1185

83:                                               ; preds = %66, %59
  %84 = load i32, ptr %3, align 4, !dbg !1186
  %85 = sext i32 %84 to i64, !dbg !1188
  %86 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %85, !dbg !1188
  store ptr %86, ptr %2, align 8, !dbg !1189
  %87 = load ptr, ptr %2, align 8, !dbg !1190
  %88 = getelementptr inbounds nuw %struct.object, ptr %87, i32 0, i32 2, !dbg !1191
  %89 = load i8, ptr %88, align 1, !dbg !1191
  %90 = zext i8 %89 to i64, !dbg !1192
  %91 = getelementptr inbounds nuw [7 x %struct.reactor], ptr @Reactors, i64 0, i64 %90, !dbg !1192
  %92 = getelementptr inbounds nuw %struct.reactor, ptr %91, i32 0, i32 1, !dbg !1193
  %93 = load i32, ptr %92, align 4, !dbg !1193
  store i32 %93, ptr @N_controlcen_guns, align 4, !dbg !1194
  store i32 0, ptr %1, align 4, !dbg !1195
  br label %94, !dbg !1197

94:                                               ; preds = %107, %83
  %95 = load i32, ptr %1, align 4, !dbg !1198
  %96 = load i32, ptr @N_controlcen_guns, align 4, !dbg !1200
  %97 = icmp slt i32 %95, %96, !dbg !1201
  br i1 %97, label %98, label %110, !dbg !1202

98:                                               ; preds = %94
  %99 = load i32, ptr %1, align 4, !dbg !1203
  %100 = sext i32 %99 to i64, !dbg !1204
  %101 = getelementptr inbounds [8 x %struct.vms_vector], ptr @Gun_pos, i64 0, i64 %100, !dbg !1204
  %102 = load i32, ptr %1, align 4, !dbg !1205
  %103 = sext i32 %102 to i64, !dbg !1206
  %104 = getelementptr inbounds [8 x %struct.vms_vector], ptr @Gun_dir, i64 0, i64 %103, !dbg !1206
  %105 = load ptr, ptr %2, align 8, !dbg !1207
  %106 = load i32, ptr %1, align 4, !dbg !1208
  call void @_Z25calc_controlcen_gun_pointP10vms_vectorS0_P6objecti(ptr noundef %101, ptr noundef %104, ptr noundef %105, i32 noundef %106), !dbg !1209
  br label %107, !dbg !1209

107:                                              ; preds = %98
  %108 = load i32, ptr %1, align 4, !dbg !1210
  %109 = add nsw i32 %108, 1, !dbg !1210
  store i32 %109, ptr %1, align 4, !dbg !1210
  br label %94, !dbg !1211, !llvm.loop !1212

110:                                              ; preds = %94
  store i32 1, ptr @Control_center_present, align 4, !dbg !1214
  %111 = load i32, ptr @Reactor_strength, align 4, !dbg !1215
  %112 = icmp eq i32 %111, -1, !dbg !1217
  br i1 %112, label %113, label %130, !dbg !1217

113:                                              ; preds = %110
  %114 = load i32, ptr @Current_level_num, align 4, !dbg !1218
  %115 = icmp sge i32 %114, 0, !dbg !1221
  br i1 %115, label %116, label %122, !dbg !1221

116:                                              ; preds = %113
  %117 = load i32, ptr @Current_level_num, align 4, !dbg !1222
  %118 = mul nsw i32 3276800, %117, !dbg !1223
  %119 = add nsw i32 13107200, %118, !dbg !1224
  %120 = load ptr, ptr %2, align 8, !dbg !1225
  %121 = getelementptr inbounds nuw %struct.object, ptr %120, i32 0, i32 14, !dbg !1226
  store i32 %119, ptr %121, align 4, !dbg !1227
  br label %129, !dbg !1225

122:                                              ; preds = %113
  %123 = load i32, ptr @Current_level_num, align 4, !dbg !1228
  %124 = mul nsw i32 %123, 65536, !dbg !1229
  %125 = mul nsw i32 %124, 150, !dbg !1230
  %126 = sub nsw i32 13107200, %125, !dbg !1231
  %127 = load ptr, ptr %2, align 8, !dbg !1232
  %128 = getelementptr inbounds nuw %struct.object, ptr %127, i32 0, i32 14, !dbg !1233
  store i32 %126, ptr %128, align 4, !dbg !1234
  br label %129

129:                                              ; preds = %122, %116
  br label %135, !dbg !1235

130:                                              ; preds = %110
  %131 = load i32, ptr @Reactor_strength, align 4, !dbg !1236
  %132 = call noundef i32 @_Z3i2fi(i32 noundef %131), !dbg !1238
  %133 = load ptr, ptr %2, align 8, !dbg !1239
  %134 = getelementptr inbounds nuw %struct.object, ptr %133, i32 0, i32 14, !dbg !1240
  store i32 %132, ptr %134, align 4, !dbg !1241
  br label %135

135:                                              ; preds = %130, %129
  br label %136

136:                                              ; preds = %135, %82
  store i32 0, ptr @Control_center_been_hit, align 4, !dbg !1242
  store i32 0, ptr @Control_center_player_been_seen, align 4, !dbg !1243
  store i32 0, ptr @Control_center_next_fire_time, align 4, !dbg !1244
  store i32 -1, ptr @Dead_controlcen_object_num, align 4, !dbg !1245
  br label %137, !dbg !1246

137:                                              ; preds = %136, %58
  ret void, !dbg !1246
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z21special_reactor_stuffv() #0 !dbg !1247 {
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.11), !dbg !1248
  %1 = load i32, ptr @Control_center_destroyed, align 4, !dbg !1249
  %2 = icmp ne i32 %1, 0, !dbg !1249
  br i1 %2, label %3, label %17, !dbg !1249

3:                                                ; preds = %0
  %4 = load i32, ptr @Base_control_center_explosion_time, align 4, !dbg !1251
  %5 = load i32, ptr @Difficulty_level, align 4, !dbg !1253
  %6 = sub nsw i32 4, %5, !dbg !1254
  %7 = load i32, ptr @Base_control_center_explosion_time, align 4, !dbg !1255
  %8 = mul nsw i32 %6, %7, !dbg !1256
  %9 = sdiv i32 %8, 4, !dbg !1257
  %10 = add nsw i32 %4, %9, !dbg !1258
  %11 = call noundef i32 @_Z3i2fi(i32 noundef %10), !dbg !1259
  %12 = load i32, ptr @Countdown_timer, align 4, !dbg !1260
  %13 = add nsw i32 %12, %11, !dbg !1260
  store i32 %13, ptr @Countdown_timer, align 4, !dbg !1260
  %14 = load i32, ptr @Countdown_timer, align 4, !dbg !1261
  %15 = call noundef i32 @_Z3f2ii(i32 noundef %14), !dbg !1262
  %16 = add nsw i32 %15, 2, !dbg !1263
  store i32 %16, ptr @Total_countdown_time, align 4, !dbg !1264
  br label %17, !dbg !1265

17:                                               ; preds = %3, %0
  ret void, !dbg !1266
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z21read_reactor_triggersP23control_center_triggersP7__sFILE(ptr noundef %0, ptr noundef %1) #0 !dbg !1267 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !1326, !DIExpression(), !1327)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !1328, !DIExpression(), !1329)
    #dbg_declare(ptr %5, !1330, !DIExpression(), !1331)
  %6 = load ptr, ptr %4, align 8, !dbg !1332
  %7 = call noundef signext i16 @_Z15file_read_shortP7__sFILE(ptr noundef %6), !dbg !1333
  %8 = load ptr, ptr %3, align 8, !dbg !1334
  %9 = getelementptr inbounds nuw %struct.control_center_triggers, ptr %8, i32 0, i32 0, !dbg !1335
  store i16 %7, ptr %9, align 2, !dbg !1336
  store i32 0, ptr %5, align 4, !dbg !1337
  br label %10, !dbg !1339

10:                                               ; preds = %21, %2
  %11 = load i32, ptr %5, align 4, !dbg !1340
  %12 = icmp slt i32 %11, 10, !dbg !1342
  br i1 %12, label %13, label %24, !dbg !1343

13:                                               ; preds = %10
  %14 = load ptr, ptr %4, align 8, !dbg !1344
  %15 = call noundef signext i16 @_Z15file_read_shortP7__sFILE(ptr noundef %14), !dbg !1345
  %16 = load ptr, ptr %3, align 8, !dbg !1346
  %17 = getelementptr inbounds nuw %struct.control_center_triggers, ptr %16, i32 0, i32 1, !dbg !1347
  %18 = load i32, ptr %5, align 4, !dbg !1348
  %19 = sext i32 %18 to i64, !dbg !1346
  %20 = getelementptr inbounds [10 x i16], ptr %17, i64 0, i64 %19, !dbg !1346
  store i16 %15, ptr %20, align 2, !dbg !1349
  br label %21, !dbg !1346

21:                                               ; preds = %13
  %22 = load i32, ptr %5, align 4, !dbg !1350
  %23 = add nsw i32 %22, 1, !dbg !1350
  store i32 %23, ptr %5, align 4, !dbg !1350
  br label %10, !dbg !1351, !llvm.loop !1352

24:                                               ; preds = %10
  store i32 0, ptr %5, align 4, !dbg !1354
  br label %25, !dbg !1356

25:                                               ; preds = %36, %24
  %26 = load i32, ptr %5, align 4, !dbg !1357
  %27 = icmp slt i32 %26, 10, !dbg !1359
  br i1 %27, label %28, label %39, !dbg !1360

28:                                               ; preds = %25
  %29 = load ptr, ptr %4, align 8, !dbg !1361
  %30 = call noundef signext i16 @_Z15file_read_shortP7__sFILE(ptr noundef %29), !dbg !1362
  %31 = load ptr, ptr %3, align 8, !dbg !1363
  %32 = getelementptr inbounds nuw %struct.control_center_triggers, ptr %31, i32 0, i32 2, !dbg !1364
  %33 = load i32, ptr %5, align 4, !dbg !1365
  %34 = sext i32 %33 to i64, !dbg !1363
  %35 = getelementptr inbounds [10 x i16], ptr %32, i64 0, i64 %34, !dbg !1363
  store i16 %30, ptr %35, align 2, !dbg !1366
  br label %36, !dbg !1363

36:                                               ; preds = %28
  %37 = load i32, ptr %5, align 4, !dbg !1367
  %38 = add nsw i32 %37, 1, !dbg !1367
  store i32 %38, ptr %5, align 4, !dbg !1367
  br label %25, !dbg !1368, !llvm.loop !1369

39:                                               ; preds = %25
  ret void, !dbg !1371
}

declare noundef signext i16 @_Z15file_read_shortP7__sFILE(ptr noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z22write_reactor_triggersP23control_center_triggersP7__sFILE(ptr noundef %0, ptr noundef %1) #0 !dbg !1372 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !1373, !DIExpression(), !1374)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !1375, !DIExpression(), !1376)
    #dbg_declare(ptr %5, !1377, !DIExpression(), !1378)
  %6 = load ptr, ptr %4, align 8, !dbg !1379
  %7 = load ptr, ptr %3, align 8, !dbg !1380
  %8 = getelementptr inbounds nuw %struct.control_center_triggers, ptr %7, i32 0, i32 0, !dbg !1381
  %9 = load i16, ptr %8, align 2, !dbg !1381
  call void @_Z16file_write_shortP7__sFILEs(ptr noundef %6, i16 noundef signext %9), !dbg !1382
  store i32 0, ptr %5, align 4, !dbg !1383
  br label %10, !dbg !1385

10:                                               ; preds = %21, %2
  %11 = load i32, ptr %5, align 4, !dbg !1386
  %12 = icmp slt i32 %11, 10, !dbg !1388
  br i1 %12, label %13, label %24, !dbg !1389

13:                                               ; preds = %10
  %14 = load ptr, ptr %4, align 8, !dbg !1390
  %15 = load ptr, ptr %3, align 8, !dbg !1391
  %16 = getelementptr inbounds nuw %struct.control_center_triggers, ptr %15, i32 0, i32 1, !dbg !1392
  %17 = load i32, ptr %5, align 4, !dbg !1393
  %18 = sext i32 %17 to i64, !dbg !1391
  %19 = getelementptr inbounds [10 x i16], ptr %16, i64 0, i64 %18, !dbg !1391
  %20 = load i16, ptr %19, align 2, !dbg !1391
  call void @_Z16file_write_shortP7__sFILEs(ptr noundef %14, i16 noundef signext %20), !dbg !1394
  br label %21, !dbg !1394

21:                                               ; preds = %13
  %22 = load i32, ptr %5, align 4, !dbg !1395
  %23 = add nsw i32 %22, 1, !dbg !1395
  store i32 %23, ptr %5, align 4, !dbg !1395
  br label %10, !dbg !1396, !llvm.loop !1397

24:                                               ; preds = %10
  store i32 0, ptr %5, align 4, !dbg !1399
  br label %25, !dbg !1401

25:                                               ; preds = %36, %24
  %26 = load i32, ptr %5, align 4, !dbg !1402
  %27 = icmp slt i32 %26, 10, !dbg !1404
  br i1 %27, label %28, label %39, !dbg !1405

28:                                               ; preds = %25
  %29 = load ptr, ptr %4, align 8, !dbg !1406
  %30 = load ptr, ptr %3, align 8, !dbg !1407
  %31 = getelementptr inbounds nuw %struct.control_center_triggers, ptr %30, i32 0, i32 2, !dbg !1408
  %32 = load i32, ptr %5, align 4, !dbg !1409
  %33 = sext i32 %32 to i64, !dbg !1407
  %34 = getelementptr inbounds [10 x i16], ptr %31, i64 0, i64 %33, !dbg !1407
  %35 = load i16, ptr %34, align 2, !dbg !1407
  call void @_Z16file_write_shortP7__sFILEs(ptr noundef %29, i16 noundef signext %35), !dbg !1410
  br label %36, !dbg !1410

36:                                               ; preds = %28
  %37 = load i32, ptr %5, align 4, !dbg !1411
  %38 = add nsw i32 %37, 1, !dbg !1411
  store i32 %38, ptr %5, align 4, !dbg !1411
  br label %25, !dbg !1412, !llvm.loop !1413

39:                                               ; preds = %25
  ret void, !dbg !1415
}

declare void @_Z16file_write_shortP7__sFILEs(ptr noundef, i16 noundef signext) #1

attributes #0 = { mustprogress noinline ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #2 = { mustprogress noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!225, !226, !227, !228, !229, !230, !231}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!232}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "Reactors", scope: !2, file: !22, line: 48, type: !215, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !3, producer: "Homebrew clang version 20.1.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !11, globals: !19, imports: !137, splitDebugInlining: false, nameTableKind: Apple, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk", sdk: "MacOSX15.sdk")
!3 = !DIFile(filename: "/Users/richard/code/ChocolateDescent/main_d2/cntrlcen.cpp", directory: "/Users/richard/code/ChocolateDescent/build-c-ref", checksumkind: CSK_MD5, checksum: "a8d88a3c09981971e25256c3a23b599f")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "DataVer", file: !6, line: 72, baseType: !7, size: 32, flags: DIFlagEnumClass, elements: !8, identifier: "_ZTS7DataVer")
!6 = !DIFile(filename: "main_d2/inferno.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "f9bd7760bcc54609c0547a3a7ca7ee90")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{!9, !10}
!9 = !DIEnumerator(name: "DEMO", value: 0)
!10 = !DIEnumerator(name: "FULL", value: 1)
!11 = !{!12, !15}
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !13, line: 30, baseType: !14)
!13 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int64_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e6d85c1a9e23dbf7518ce3b162aac800")
!14 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "fix", file: !16, line: 20, baseType: !17)
!16 = !DIFile(filename: "./fix/fix.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "c5006a11bf8b4cb7d963898499eda13a")
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !18, line: 30, baseType: !7)
!18 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int32_t.h", directory: "", checksumkind: CSK_MD5, checksum: "d23e8406e80ee79983f28509c741fa17")
!19 = !{!0, !20, !23, !36, !38, !40, !42, !44, !46, !58, !60, !67, !72, !77, !79, !84, !86, !88, !90, !92, !94, !96, !101, !106, !111, !116, !118, !120, !122, !127, !129, !134}
!20 = !DIGlobalVariableExpression(var: !21, expr: !DIExpression())
!21 = distinct !DIGlobalVariable(name: "Num_reactors", scope: !2, file: !22, line: 49, type: !7, isLocal: false, isDefinition: true)
!22 = !DIFile(filename: "main_d2/cntrlcen.cpp", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "a8d88a3c09981971e25256c3a23b599f")
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(name: "ControlCenterTriggers", scope: !2, file: !22, line: 51, type: !25, isLocal: false, isDefinition: true)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "control_center_triggers", file: !26, line: 32, baseType: !27)
!26 = !DIFile(filename: "main_d2/cntrlcen.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "928a70e79d6bcbec0ceb272bda5e47fa")
!27 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "control_center_triggers", file: !26, line: 27, size: 336, flags: DIFlagTypePassByValue, elements: !28, identifier: "_ZTS23control_center_triggers")
!28 = !{!29, !31, !35}
!29 = !DIDerivedType(tag: DW_TAG_member, name: "num_links", scope: !27, file: !26, line: 29, baseType: !30, size: 16)
!30 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "seg", scope: !27, file: !26, line: 30, baseType: !32, size: 160, offset: 16)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 160, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 10)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "side", scope: !27, file: !26, line: 31, baseType: !32, size: 160, offset: 176)
!36 = !DIGlobalVariableExpression(var: !37, expr: !DIExpression())
!37 = distinct !DIGlobalVariable(name: "N_controlcen_guns", scope: !2, file: !22, line: 53, type: !7, isLocal: false, isDefinition: true)
!38 = !DIGlobalVariableExpression(var: !39, expr: !DIExpression())
!39 = distinct !DIGlobalVariable(name: "Control_center_been_hit", scope: !2, file: !22, line: 54, type: !7, isLocal: false, isDefinition: true)
!40 = !DIGlobalVariableExpression(var: !41, expr: !DIExpression())
!41 = distinct !DIGlobalVariable(name: "Control_center_player_been_seen", scope: !2, file: !22, line: 55, type: !7, isLocal: false, isDefinition: true)
!42 = !DIGlobalVariableExpression(var: !43, expr: !DIExpression())
!43 = distinct !DIGlobalVariable(name: "Control_center_next_fire_time", scope: !2, file: !22, line: 56, type: !7, isLocal: false, isDefinition: true)
!44 = !DIGlobalVariableExpression(var: !45, expr: !DIExpression())
!45 = distinct !DIGlobalVariable(name: "Control_center_present", scope: !2, file: !22, line: 57, type: !7, isLocal: false, isDefinition: true)
!46 = !DIGlobalVariableExpression(var: !47, expr: !DIExpression())
!47 = distinct !DIGlobalVariable(name: "Gun_pos", scope: !2, file: !22, line: 59, type: !48, isLocal: false, isDefinition: true)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !49, size: 768, elements: !56)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_vector", file: !50, line: 22, baseType: !51)
!50 = !DIFile(filename: "./vecmat/vecmat.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "dfa84e3325c1ea4f5f74699fff5ef2bf")
!51 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_vector", file: !50, line: 19, size: 96, flags: DIFlagTypePassByValue, elements: !52, identifier: "_ZTS10vms_vector")
!52 = !{!53, !54, !55}
!53 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !51, file: !50, line: 21, baseType: !15, size: 32)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !51, file: !50, line: 21, baseType: !15, size: 32, offset: 32)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !51, file: !50, line: 21, baseType: !15, size: 32, offset: 64)
!56 = !{!57}
!57 = !DISubrange(count: 8)
!58 = !DIGlobalVariableExpression(var: !59, expr: !DIExpression())
!59 = distinct !DIGlobalVariable(name: "Gun_dir", scope: !2, file: !22, line: 59, type: !48, isLocal: false, isDefinition: true)
!60 = !DIGlobalVariableExpression(var: !61, expr: !DIExpression())
!61 = distinct !DIGlobalVariable(scope: null, file: !22, line: 83, type: !62, isLocal: true, isDefinition: true)
!62 = !DICompositeType(tag: DW_TAG_array_type, baseType: !63, size: 208, elements: !65)
!63 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !{!66}
!66 = !DISubrange(count: 26)
!67 = !DIGlobalVariableExpression(var: !68, expr: !DIExpression())
!68 = distinct !DIGlobalVariable(scope: null, file: !22, line: 83, type: !69, isLocal: true, isDefinition: true)
!69 = !DICompositeType(tag: DW_TAG_array_type, baseType: !63, size: 464, elements: !70)
!70 = !{!71}
!71 = !DISubrange(count: 58)
!72 = !DIGlobalVariableExpression(var: !73, expr: !DIExpression())
!73 = distinct !DIGlobalVariable(scope: null, file: !22, line: 84, type: !74, isLocal: true, isDefinition: true)
!74 = !DICompositeType(tag: DW_TAG_array_type, baseType: !63, size: 232, elements: !75)
!75 = !{!76}
!76 = !DISubrange(count: 29)
!77 = !DIGlobalVariableExpression(var: !78, expr: !DIExpression())
!78 = distinct !DIGlobalVariable(scope: null, file: !22, line: 88, type: !62, isLocal: true, isDefinition: true)
!79 = !DIGlobalVariableExpression(var: !80, expr: !DIExpression())
!80 = distinct !DIGlobalVariable(scope: null, file: !22, line: 146, type: !81, isLocal: true, isDefinition: true)
!81 = !DICompositeType(tag: DW_TAG_array_type, baseType: !63, size: 120, elements: !82)
!82 = !{!83}
!83 = !DISubrange(count: 15)
!84 = !DIGlobalVariableExpression(var: !85, expr: !DIExpression())
!85 = distinct !DIGlobalVariable(name: "Dead_controlcen_object_num", scope: !2, file: !22, line: 157, type: !7, isLocal: false, isDefinition: true)
!86 = !DIGlobalVariableExpression(var: !87, expr: !DIExpression())
!87 = distinct !DIGlobalVariable(name: "Base_control_center_explosion_time", scope: !2, file: !22, line: 160, type: !7, isLocal: false, isDefinition: true)
!88 = !DIGlobalVariableExpression(var: !89, expr: !DIExpression())
!89 = distinct !DIGlobalVariable(name: "Control_center_destroyed", scope: !2, file: !22, line: 162, type: !7, isLocal: false, isDefinition: true)
!90 = !DIGlobalVariableExpression(var: !91, expr: !DIExpression())
!91 = distinct !DIGlobalVariable(name: "Countdown_timer", scope: !2, file: !22, line: 163, type: !15, isLocal: false, isDefinition: true)
!92 = !DIGlobalVariableExpression(var: !93, expr: !DIExpression())
!93 = distinct !DIGlobalVariable(name: "Countdown_seconds_left", scope: !2, file: !22, line: 164, type: !7, isLocal: false, isDefinition: true)
!94 = !DIGlobalVariableExpression(var: !95, expr: !DIExpression())
!95 = distinct !DIGlobalVariable(name: "Total_countdown_time", scope: !2, file: !22, line: 164, type: !7, isLocal: false, isDefinition: true)
!96 = !DIGlobalVariableExpression(var: !97, expr: !DIExpression())
!97 = distinct !DIGlobalVariable(name: "Alan_pavlish_reactor_times", scope: !2, file: !22, line: 166, type: !98, isLocal: false, isDefinition: true)
!98 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 160, elements: !99)
!99 = !{!100}
!100 = !DISubrange(count: 5)
!101 = !DIGlobalVariableExpression(var: !102, expr: !DIExpression())
!102 = distinct !DIGlobalVariable(scope: null, file: !22, line: 295, type: !103, isLocal: true, isDefinition: true)
!103 = !DICompositeType(tag: DW_TAG_array_type, baseType: !63, size: 88, elements: !104)
!104 = !{!105}
!105 = !DISubrange(count: 11)
!106 = !DIGlobalVariableExpression(var: !107, expr: !DIExpression())
!107 = distinct !DIGlobalVariable(scope: null, file: !22, line: 295, type: !108, isLocal: true, isDefinition: true)
!108 = !DICompositeType(tag: DW_TAG_array_type, baseType: !63, size: 8, elements: !109)
!109 = !{!110}
!110 = !DISubrange(count: 1)
!111 = !DIGlobalVariableExpression(var: !112, expr: !DIExpression())
!112 = distinct !DIGlobalVariable(scope: null, file: !22, line: 300, type: !113, isLocal: true, isDefinition: true)
!113 = !DICompositeType(tag: DW_TAG_array_type, baseType: !63, size: 320, elements: !114)
!114 = !{!115}
!115 = !DISubrange(count: 40)
!116 = !DIGlobalVariableExpression(var: !117, expr: !DIExpression())
!117 = distinct !DIGlobalVariable(name: "Last_time_cc_vis_check", scope: !2, file: !22, line: 327, type: !7, isLocal: false, isDefinition: true)
!118 = !DIGlobalVariableExpression(var: !119, expr: !DIExpression())
!119 = distinct !DIGlobalVariable(name: "Reactor_strength", scope: !2, file: !22, line: 546, type: !7, isLocal: false, isDefinition: true)
!120 = !DIGlobalVariableExpression(var: !121, expr: !DIExpression())
!121 = distinct !DIGlobalVariable(scope: null, file: !22, line: 562, type: !69, isLocal: true, isDefinition: true)
!122 = !DIGlobalVariableExpression(var: !123, expr: !DIExpression())
!123 = distinct !DIGlobalVariable(scope: null, file: !22, line: 569, type: !124, isLocal: true, isDefinition: true)
!124 = !DICompositeType(tag: DW_TAG_array_type, baseType: !63, size: 392, elements: !125)
!125 = !{!126}
!126 = !DISubrange(count: 49)
!127 = !DIGlobalVariableExpression(var: !128, expr: !DIExpression())
!128 = distinct !DIGlobalVariable(scope: null, file: !22, line: 578, type: !74, isLocal: true, isDefinition: true)
!129 = !DIGlobalVariableExpression(var: !130, expr: !DIExpression())
!130 = distinct !DIGlobalVariable(scope: null, file: !22, line: 628, type: !131, isLocal: true, isDefinition: true)
!131 = !DICompositeType(tag: DW_TAG_array_type, baseType: !63, size: 304, elements: !132)
!132 = !{!133}
!133 = !DISubrange(count: 38)
!134 = !DIGlobalVariableExpression(var: !135, expr: !DIExpression(DW_OP_constu, 16, DW_OP_stack_value))
!135 = distinct !DIGlobalVariable(name: "FRACBITS", scope: !2, file: !16, line: 18, type: !136, isLocal: true, isDefinition: true)
!136 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!137 = !{!138, !145, !148, !149, !150, !154, !158, !162, !166, !169, !171, !173, !175, !177, !179, !181, !183, !185, !187, !189, !191, !193, !195, !197, !199, !205, !209, !212}
!138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !139, entity: !141, file: !144, line: 158)
!139 = !DINamespace(name: "__1", scope: !140, exportSymbols: true)
!140 = !DINamespace(name: "std", scope: null)
!141 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !142, line: 30, baseType: !143)
!142 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int8_t.h", directory: "", checksumkind: CSK_MD5, checksum: "5052dfe782b50fed2355b8f61a9e4fa9")
!143 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!144 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdint", directory: "")
!145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !139, entity: !146, file: !144, line: 159)
!146 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !147, line: 30, baseType: !30)
!147 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int16_t.h", directory: "", checksumkind: CSK_MD5, checksum: "47ed3c3ac6f65bfec021ca2b7be18e7e")
!148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !139, entity: !17, file: !144, line: 160)
!149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !139, entity: !12, file: !144, line: 161)
!150 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !139, entity: !151, file: !144, line: 163)
!151 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !152, line: 31, baseType: !153)
!152 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint8_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8b64ccf8c67b8c006b07b8daf1b49be5")
!153 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !139, entity: !155, file: !144, line: 164)
!155 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !156, line: 31, baseType: !157)
!156 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint16_t.h", directory: "", checksumkind: CSK_MD5, checksum: "f0aa926da906b10566dd3171bf347ab7")
!157 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!158 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !139, entity: !159, file: !144, line: 165)
!159 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !160, line: 31, baseType: !161)
!160 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint32_t.h", directory: "", checksumkind: CSK_MD5, checksum: "0254eb80c6b9719ac45c3c1cf872109b")
!161 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !139, entity: !163, file: !144, line: 166)
!163 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !164, line: 31, baseType: !165)
!164 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint64_t.h", directory: "", checksumkind: CSK_MD5, checksum: "77fc5e91653260959605f129691cf9b1")
!165 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !139, entity: !167, file: !144, line: 168)
!167 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !168, line: 29, baseType: !141)
!168 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "042ceedaf4137a8aaa272d0b27434016")
!169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !139, entity: !170, file: !144, line: 169)
!170 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !168, line: 30, baseType: !146)
!171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !139, entity: !172, file: !144, line: 170)
!172 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !168, line: 31, baseType: !17)
!173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !139, entity: !174, file: !144, line: 171)
!174 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !168, line: 32, baseType: !12)
!175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !139, entity: !176, file: !144, line: 173)
!176 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !168, line: 33, baseType: !151)
!177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !139, entity: !178, file: !144, line: 174)
!178 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !168, line: 34, baseType: !155)
!179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !139, entity: !180, file: !144, line: 175)
!180 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !168, line: 35, baseType: !159)
!181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !139, entity: !182, file: !144, line: 176)
!182 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !168, line: 36, baseType: !163)
!183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !139, entity: !184, file: !144, line: 178)
!184 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !168, line: 40, baseType: !141)
!185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !139, entity: !186, file: !144, line: 179)
!186 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !168, line: 41, baseType: !146)
!187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !139, entity: !188, file: !144, line: 180)
!188 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !168, line: 42, baseType: !17)
!189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !139, entity: !190, file: !144, line: 181)
!190 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !168, line: 43, baseType: !12)
!191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !139, entity: !192, file: !144, line: 183)
!192 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !168, line: 44, baseType: !151)
!193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !139, entity: !194, file: !144, line: 184)
!194 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !168, line: 45, baseType: !155)
!195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !139, entity: !196, file: !144, line: 185)
!196 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !168, line: 46, baseType: !159)
!197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !139, entity: !198, file: !144, line: 186)
!198 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !168, line: 47, baseType: !163)
!199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !139, entity: !200, file: !144, line: 188)
!200 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !201, line: 32, baseType: !202)
!201 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_intptr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e478ba47270923b1cca6659f19f02db1")
!202 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_intptr_t", file: !203, line: 40, baseType: !204)
!203 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/arm/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "b270144f57ae258d0ce80b8f87be068c")
!204 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !139, entity: !206, file: !144, line: 189)
!206 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !207, line: 34, baseType: !208)
!207 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_uintptr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e70ae655dd1b9d4ae0b1dcc073f5b7e4")
!208 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !139, entity: !210, file: !144, line: 191)
!210 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !211, line: 32, baseType: !204)
!211 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_intmax_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e37b9240f30f486478152ef3989b1545")
!212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !139, entity: !213, file: !144, line: 192)
!213 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !214, line: 32, baseType: !208)
!214 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uintmax_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8217a3fbb207d8e87ca5318c313e81c2")
!215 = !DICompositeType(tag: DW_TAG_array_type, baseType: !216, size: 11200, elements: !223)
!216 = !DIDerivedType(tag: DW_TAG_typedef, name: "reactor", file: !26, line: 42, baseType: !217)
!217 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "reactor", file: !26, line: 36, size: 1600, flags: DIFlagTypePassByValue, elements: !218, identifier: "_ZTS7reactor")
!218 = !{!219, !220, !221, !222}
!219 = !DIDerivedType(tag: DW_TAG_member, name: "model_num", scope: !217, file: !26, line: 38, baseType: !7, size: 32)
!220 = !DIDerivedType(tag: DW_TAG_member, name: "n_guns", scope: !217, file: !26, line: 39, baseType: !7, size: 32, offset: 32)
!221 = !DIDerivedType(tag: DW_TAG_member, name: "gun_points", scope: !217, file: !26, line: 40, baseType: !48, size: 768, offset: 64)
!222 = !DIDerivedType(tag: DW_TAG_member, name: "gun_dirs", scope: !217, file: !26, line: 41, baseType: !48, size: 768, offset: 832)
!223 = !{!224}
!224 = !DISubrange(count: 7)
!225 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 4]}
!226 = !{i32 7, !"Dwarf Version", i32 5}
!227 = !{i32 2, !"Debug Info Version", i32 3}
!228 = !{i32 1, !"wchar_size", i32 4}
!229 = !{i32 8, !"PIC Level", i32 2}
!230 = !{i32 7, !"uwtable", i32 1}
!231 = !{i32 7, !"frame-pointer", i32 1}
!232 = !{!"Homebrew clang version 20.1.8"}
!233 = distinct !DISubprogram(name: "calc_controlcen_gun_point", linkageName: "_Z25calc_controlcen_gun_pointP10vms_vectorS0_P6objecti", scope: !22, file: !22, line: 63, type: !234, scopeLine: 64, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !365)
!234 = !DISubroutineType(types: !235)
!235 = !{null, !236, !236, !237, !7}
!236 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!237 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !238, size: 64)
!238 = !DIDerivedType(tag: DW_TAG_typedef, name: "object", file: !239, line: 259, baseType: !240)
!239 = !DIFile(filename: "main_d2/object.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "1f2325d356aae4b692933d2aae4f3afd")
!240 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "object", file: !239, line: 210, size: 2144, flags: DIFlagTypePassByValue, elements: !241, identifier: "_ZTS6object")
!241 = !{!242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !261, !262, !263, !264, !265, !266, !267, !268, !269, !287, !339}
!242 = !DIDerivedType(tag: DW_TAG_member, name: "signature", scope: !240, file: !239, line: 212, baseType: !7, size: 32)
!243 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !240, file: !239, line: 213, baseType: !151, size: 8, offset: 32)
!244 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !240, file: !239, line: 214, baseType: !151, size: 8, offset: 40)
!245 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !240, file: !239, line: 215, baseType: !30, size: 16, offset: 48)
!246 = !DIDerivedType(tag: DW_TAG_member, name: "prev", scope: !240, file: !239, line: 215, baseType: !30, size: 16, offset: 64)
!247 = !DIDerivedType(tag: DW_TAG_member, name: "control_type", scope: !240, file: !239, line: 216, baseType: !151, size: 8, offset: 80)
!248 = !DIDerivedType(tag: DW_TAG_member, name: "movement_type", scope: !240, file: !239, line: 217, baseType: !151, size: 8, offset: 88)
!249 = !DIDerivedType(tag: DW_TAG_member, name: "render_type", scope: !240, file: !239, line: 218, baseType: !151, size: 8, offset: 96)
!250 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !240, file: !239, line: 219, baseType: !151, size: 8, offset: 104)
!251 = !DIDerivedType(tag: DW_TAG_member, name: "segnum", scope: !240, file: !239, line: 220, baseType: !30, size: 16, offset: 112)
!252 = !DIDerivedType(tag: DW_TAG_member, name: "attached_obj", scope: !240, file: !239, line: 221, baseType: !30, size: 16, offset: 128)
!253 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !240, file: !239, line: 222, baseType: !49, size: 96, offset: 160)
!254 = !DIDerivedType(tag: DW_TAG_member, name: "orient", scope: !240, file: !239, line: 223, baseType: !255, size: 288, offset: 256)
!255 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_matrix", file: !50, line: 47, baseType: !256)
!256 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_matrix", file: !50, line: 44, size: 288, flags: DIFlagTypePassByValue, elements: !257, identifier: "_ZTS10vms_matrix")
!257 = !{!258, !259, !260}
!258 = !DIDerivedType(tag: DW_TAG_member, name: "rvec", scope: !256, file: !50, line: 46, baseType: !49, size: 96)
!259 = !DIDerivedType(tag: DW_TAG_member, name: "uvec", scope: !256, file: !50, line: 46, baseType: !49, size: 96, offset: 96)
!260 = !DIDerivedType(tag: DW_TAG_member, name: "fvec", scope: !256, file: !50, line: 46, baseType: !49, size: 96, offset: 192)
!261 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !240, file: !239, line: 224, baseType: !15, size: 32, offset: 544)
!262 = !DIDerivedType(tag: DW_TAG_member, name: "shields", scope: !240, file: !239, line: 225, baseType: !15, size: 32, offset: 576)
!263 = !DIDerivedType(tag: DW_TAG_member, name: "last_pos", scope: !240, file: !239, line: 226, baseType: !49, size: 96, offset: 608)
!264 = !DIDerivedType(tag: DW_TAG_member, name: "contains_type", scope: !240, file: !239, line: 227, baseType: !141, size: 8, offset: 704)
!265 = !DIDerivedType(tag: DW_TAG_member, name: "contains_id", scope: !240, file: !239, line: 228, baseType: !141, size: 8, offset: 712)
!266 = !DIDerivedType(tag: DW_TAG_member, name: "contains_count", scope: !240, file: !239, line: 229, baseType: !141, size: 8, offset: 720)
!267 = !DIDerivedType(tag: DW_TAG_member, name: "matcen_creator", scope: !240, file: !239, line: 230, baseType: !141, size: 8, offset: 728)
!268 = !DIDerivedType(tag: DW_TAG_member, name: "lifeleft", scope: !240, file: !239, line: 231, baseType: !15, size: 32, offset: 736)
!269 = !DIDerivedType(tag: DW_TAG_member, name: "mtype", scope: !240, file: !239, line: 240, baseType: !270, size: 512, offset: 768)
!270 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !240, file: !239, line: 236, size: 512, flags: DIFlagTypePassByValue, elements: !271, identifier: "_ZTSN6objectUt_E")
!271 = !{!272, !286}
!272 = !DIDerivedType(tag: DW_TAG_member, name: "phys_info", scope: !270, file: !239, line: 238, baseType: !273, size: 512)
!273 = !DIDerivedType(tag: DW_TAG_typedef, name: "physics_info", file: !239, line: 153, baseType: !274)
!274 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "physics_info", file: !239, line: 142, size: 512, flags: DIFlagTypePassByValue, elements: !275, identifier: "_ZTS12physics_info")
!275 = !{!276, !277, !278, !279, !280, !281, !282, !283, !285}
!276 = !DIDerivedType(tag: DW_TAG_member, name: "velocity", scope: !274, file: !239, line: 144, baseType: !49, size: 96)
!277 = !DIDerivedType(tag: DW_TAG_member, name: "thrust", scope: !274, file: !239, line: 145, baseType: !49, size: 96, offset: 96)
!278 = !DIDerivedType(tag: DW_TAG_member, name: "mass", scope: !274, file: !239, line: 146, baseType: !15, size: 32, offset: 192)
!279 = !DIDerivedType(tag: DW_TAG_member, name: "drag", scope: !274, file: !239, line: 147, baseType: !15, size: 32, offset: 224)
!280 = !DIDerivedType(tag: DW_TAG_member, name: "brakes", scope: !274, file: !239, line: 148, baseType: !15, size: 32, offset: 256)
!281 = !DIDerivedType(tag: DW_TAG_member, name: "rotvel", scope: !274, file: !239, line: 149, baseType: !49, size: 96, offset: 288)
!282 = !DIDerivedType(tag: DW_TAG_member, name: "rotthrust", scope: !274, file: !239, line: 150, baseType: !49, size: 96, offset: 384)
!283 = !DIDerivedType(tag: DW_TAG_member, name: "turnroll", scope: !274, file: !239, line: 151, baseType: !284, size: 16, offset: 480)
!284 = !DIDerivedType(tag: DW_TAG_typedef, name: "fixang", file: !16, line: 21, baseType: !30)
!285 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !274, file: !239, line: 152, baseType: !155, size: 16, offset: 496)
!286 = !DIDerivedType(tag: DW_TAG_member, name: "spin_rate", scope: !270, file: !239, line: 239, baseType: !49, size: 96)
!287 = !DIDerivedType(tag: DW_TAG_member, name: "ctype", scope: !240, file: !239, line: 250, baseType: !288, size: 256, offset: 1280)
!288 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !240, file: !239, line: 243, size: 256, flags: DIFlagTypePassByValue, elements: !289, identifier: "_ZTSN6objectUt0_E")
!289 = !{!290, !301, !311, !327, !332}
!290 = !DIDerivedType(tag: DW_TAG_member, name: "laser_info", scope: !288, file: !239, line: 245, baseType: !291, size: 160)
!291 = !DIDerivedType(tag: DW_TAG_typedef, name: "laser_info_t", file: !239, line: 166, baseType: !292)
!292 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "laser_info_s", file: !239, line: 157, size: 160, flags: DIFlagTypePassByValue, elements: !293, identifier: "_ZTS12laser_info_s")
!293 = !{!294, !295, !296, !297, !298, !299, !300}
!294 = !DIDerivedType(tag: DW_TAG_member, name: "parent_type", scope: !292, file: !239, line: 159, baseType: !30, size: 16)
!295 = !DIDerivedType(tag: DW_TAG_member, name: "parent_num", scope: !292, file: !239, line: 160, baseType: !30, size: 16, offset: 16)
!296 = !DIDerivedType(tag: DW_TAG_member, name: "parent_signature", scope: !292, file: !239, line: 161, baseType: !7, size: 32, offset: 32)
!297 = !DIDerivedType(tag: DW_TAG_member, name: "creation_time", scope: !292, file: !239, line: 162, baseType: !15, size: 32, offset: 64)
!298 = !DIDerivedType(tag: DW_TAG_member, name: "last_hitobj", scope: !292, file: !239, line: 163, baseType: !30, size: 16, offset: 96)
!299 = !DIDerivedType(tag: DW_TAG_member, name: "track_goal", scope: !292, file: !239, line: 164, baseType: !30, size: 16, offset: 112)
!300 = !DIDerivedType(tag: DW_TAG_member, name: "multiplier", scope: !292, file: !239, line: 165, baseType: !15, size: 32, offset: 128)
!301 = !DIDerivedType(tag: DW_TAG_member, name: "expl_info", scope: !288, file: !239, line: 246, baseType: !302, size: 128)
!302 = !DIDerivedType(tag: DW_TAG_typedef, name: "explosion_info", file: !239, line: 176, baseType: !303)
!303 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "explosion_info", file: !239, line: 168, size: 128, flags: DIFlagTypePassByValue, elements: !304, identifier: "_ZTS14explosion_info")
!304 = !{!305, !306, !307, !308, !309, !310}
!305 = !DIDerivedType(tag: DW_TAG_member, name: "spawn_time", scope: !303, file: !239, line: 170, baseType: !15, size: 32)
!306 = !DIDerivedType(tag: DW_TAG_member, name: "delete_time", scope: !303, file: !239, line: 171, baseType: !15, size: 32, offset: 32)
!307 = !DIDerivedType(tag: DW_TAG_member, name: "delete_objnum", scope: !303, file: !239, line: 172, baseType: !30, size: 16, offset: 64)
!308 = !DIDerivedType(tag: DW_TAG_member, name: "attach_parent", scope: !303, file: !239, line: 173, baseType: !30, size: 16, offset: 80)
!309 = !DIDerivedType(tag: DW_TAG_member, name: "prev_attach", scope: !303, file: !239, line: 174, baseType: !30, size: 16, offset: 96)
!310 = !DIDerivedType(tag: DW_TAG_member, name: "next_attach", scope: !303, file: !239, line: 175, baseType: !30, size: 16, offset: 112)
!311 = !DIDerivedType(tag: DW_TAG_member, name: "ai_info", scope: !288, file: !239, line: 247, baseType: !312, size: 256)
!312 = !DIDerivedType(tag: DW_TAG_typedef, name: "ai_static", file: !313, line: 144, baseType: !314)
!313 = !DIFile(filename: "main_d2/aistruct.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "d122430e792a0ddc0f9eaa08ad217628")
!314 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ai_static", file: !313, line: 127, size: 256, flags: DIFlagTypePassByValue, elements: !315, identifier: "_ZTS9ai_static")
!315 = !{!316, !317, !319, !320, !321, !322, !323, !324, !325, !326}
!316 = !DIDerivedType(tag: DW_TAG_member, name: "behavior", scope: !314, file: !313, line: 128, baseType: !151, size: 8)
!317 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !314, file: !313, line: 129, baseType: !318, size: 88, offset: 8)
!318 = !DICompositeType(tag: DW_TAG_array_type, baseType: !141, size: 88, elements: !104)
!319 = !DIDerivedType(tag: DW_TAG_member, name: "hide_segment", scope: !314, file: !313, line: 130, baseType: !30, size: 16, offset: 96)
!320 = !DIDerivedType(tag: DW_TAG_member, name: "hide_index", scope: !314, file: !313, line: 131, baseType: !30, size: 16, offset: 112)
!321 = !DIDerivedType(tag: DW_TAG_member, name: "path_length", scope: !314, file: !313, line: 132, baseType: !30, size: 16, offset: 128)
!322 = !DIDerivedType(tag: DW_TAG_member, name: "cur_path_index", scope: !314, file: !313, line: 133, baseType: !141, size: 8, offset: 144)
!323 = !DIDerivedType(tag: DW_TAG_member, name: "dying_sound_playing", scope: !314, file: !313, line: 134, baseType: !141, size: 8, offset: 152)
!324 = !DIDerivedType(tag: DW_TAG_member, name: "danger_laser_num", scope: !314, file: !313, line: 139, baseType: !30, size: 16, offset: 160)
!325 = !DIDerivedType(tag: DW_TAG_member, name: "danger_laser_signature", scope: !314, file: !313, line: 140, baseType: !7, size: 32, offset: 192)
!326 = !DIDerivedType(tag: DW_TAG_member, name: "dying_start_time", scope: !314, file: !313, line: 141, baseType: !15, size: 32, offset: 224)
!327 = !DIDerivedType(tag: DW_TAG_member, name: "light_info", scope: !288, file: !239, line: 248, baseType: !328, size: 32)
!328 = !DIDerivedType(tag: DW_TAG_typedef, name: "light_info_t", file: !239, line: 181, baseType: !329)
!329 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "light_info_s", file: !239, line: 178, size: 32, flags: DIFlagTypePassByValue, elements: !330, identifier: "_ZTS12light_info_s")
!330 = !{!331}
!331 = !DIDerivedType(tag: DW_TAG_member, name: "intensity", scope: !329, file: !239, line: 180, baseType: !15, size: 32)
!332 = !DIDerivedType(tag: DW_TAG_member, name: "powerup_info", scope: !288, file: !239, line: 249, baseType: !333, size: 96)
!333 = !DIDerivedType(tag: DW_TAG_typedef, name: "powerup_info_t", file: !239, line: 190, baseType: !334)
!334 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "powerup_info_s", file: !239, line: 185, size: 96, flags: DIFlagTypePassByValue, elements: !335, identifier: "_ZTS14powerup_info_s")
!335 = !{!336, !337, !338}
!336 = !DIDerivedType(tag: DW_TAG_member, name: "count", scope: !334, file: !239, line: 187, baseType: !7, size: 32)
!337 = !DIDerivedType(tag: DW_TAG_member, name: "creation_time", scope: !334, file: !239, line: 188, baseType: !15, size: 32, offset: 32)
!338 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !334, file: !239, line: 189, baseType: !7, size: 32, offset: 64)
!339 = !DIDerivedType(tag: DW_TAG_member, name: "rtype", scope: !240, file: !239, line: 257, baseType: !340, size: 608, offset: 1536)
!340 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !240, file: !239, line: 253, size: 608, flags: DIFlagTypePassByValue, elements: !341, identifier: "_ZTSN6objectUt1_E")
!341 = !{!342, !358}
!342 = !DIDerivedType(tag: DW_TAG_member, name: "pobj_info", scope: !340, file: !239, line: 255, baseType: !343, size: 608)
!343 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyobj_info", file: !239, line: 208, baseType: !344)
!344 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "polyobj_info", file: !239, line: 201, size: 608, flags: DIFlagTypePassByValue, elements: !345, identifier: "_ZTS12polyobj_info")
!345 = !{!346, !347, !355, !356, !357}
!346 = !DIDerivedType(tag: DW_TAG_member, name: "model_num", scope: !344, file: !239, line: 203, baseType: !7, size: 32)
!347 = !DIDerivedType(tag: DW_TAG_member, name: "anim_angles", scope: !344, file: !239, line: 204, baseType: !348, size: 480, offset: 32)
!348 = !DICompositeType(tag: DW_TAG_array_type, baseType: !349, size: 480, elements: !33)
!349 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_angvec", file: !50, line: 40, baseType: !350)
!350 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_angvec", file: !50, line: 37, size: 48, flags: DIFlagTypePassByValue, elements: !351, identifier: "_ZTS10vms_angvec")
!351 = !{!352, !353, !354}
!352 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !350, file: !50, line: 39, baseType: !284, size: 16)
!353 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !350, file: !50, line: 39, baseType: !284, size: 16, offset: 16)
!354 = !DIDerivedType(tag: DW_TAG_member, name: "h", scope: !350, file: !50, line: 39, baseType: !284, size: 16, offset: 32)
!355 = !DIDerivedType(tag: DW_TAG_member, name: "subobj_flags", scope: !344, file: !239, line: 205, baseType: !7, size: 32, offset: 512)
!356 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_override", scope: !344, file: !239, line: 206, baseType: !7, size: 32, offset: 544)
!357 = !DIDerivedType(tag: DW_TAG_member, name: "alt_textures", scope: !344, file: !239, line: 207, baseType: !7, size: 32, offset: 576)
!358 = !DIDerivedType(tag: DW_TAG_member, name: "vclip_info", scope: !340, file: !239, line: 256, baseType: !359, size: 96)
!359 = !DIDerivedType(tag: DW_TAG_typedef, name: "vclip_info_t", file: !239, line: 197, baseType: !360)
!360 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vclip_info_s", file: !239, line: 192, size: 96, flags: DIFlagTypePassByValue, elements: !361, identifier: "_ZTS12vclip_info_s")
!361 = !{!362, !363, !364}
!362 = !DIDerivedType(tag: DW_TAG_member, name: "vclip_num", scope: !360, file: !239, line: 194, baseType: !7, size: 32)
!363 = !DIDerivedType(tag: DW_TAG_member, name: "frametime", scope: !360, file: !239, line: 195, baseType: !15, size: 32, offset: 32)
!364 = !DIDerivedType(tag: DW_TAG_member, name: "framenum", scope: !360, file: !239, line: 196, baseType: !141, size: 8, offset: 64)
!365 = !{}
!366 = !DILocalVariable(name: "gun_point", arg: 1, scope: !233, file: !22, line: 63, type: !236)
!367 = !DILocation(line: 63, column: 44, scope: !233)
!368 = !DILocalVariable(name: "gun_dir", arg: 2, scope: !233, file: !22, line: 63, type: !236)
!369 = !DILocation(line: 63, column: 66, scope: !233)
!370 = !DILocalVariable(name: "obj", arg: 3, scope: !233, file: !22, line: 63, type: !237)
!371 = !DILocation(line: 63, column: 82, scope: !233)
!372 = !DILocalVariable(name: "gun_num", arg: 4, scope: !233, file: !22, line: 63, type: !7)
!373 = !DILocation(line: 63, column: 90, scope: !233)
!374 = !DILocalVariable(name: "reactor", scope: !233, file: !22, line: 80, type: !375)
!375 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !217, size: 64)
!376 = !DILocation(line: 80, column: 18, scope: !233)
!377 = !DILocalVariable(name: "m", scope: !233, file: !22, line: 81, type: !255)
!378 = !DILocation(line: 81, column: 13, scope: !233)
!379 = !DILocation(line: 83, column: 2, scope: !233)
!380 = !DILocation(line: 84, column: 2, scope: !233)
!381 = !DILocation(line: 86, column: 22, scope: !233)
!382 = !DILocation(line: 86, column: 27, scope: !233)
!383 = !DILocation(line: 86, column: 13, scope: !233)
!384 = !DILocation(line: 86, column: 10, scope: !233)
!385 = !DILocation(line: 88, column: 2, scope: !233)
!386 = !DILocation(line: 90, column: 31, scope: !233)
!387 = !DILocation(line: 90, column: 36, scope: !233)
!388 = !DILocation(line: 90, column: 2, scope: !233)
!389 = !DILocation(line: 92, column: 16, scope: !233)
!390 = !DILocation(line: 92, column: 27, scope: !233)
!391 = !DILocation(line: 92, column: 36, scope: !233)
!392 = !DILocation(line: 92, column: 47, scope: !233)
!393 = !DILocation(line: 92, column: 2, scope: !233)
!394 = !DILocation(line: 93, column: 14, scope: !233)
!395 = !DILocation(line: 93, column: 25, scope: !233)
!396 = !DILocation(line: 93, column: 30, scope: !233)
!397 = !DILocation(line: 93, column: 2, scope: !233)
!398 = !DILocation(line: 94, column: 16, scope: !233)
!399 = !DILocation(line: 94, column: 25, scope: !233)
!400 = !DILocation(line: 94, column: 34, scope: !233)
!401 = !DILocation(line: 94, column: 43, scope: !233)
!402 = !DILocation(line: 94, column: 2, scope: !233)
!403 = !DILocation(line: 96, column: 1, scope: !233)
!404 = distinct !DISubprogram(name: "calc_best_gun", linkageName: "_Z13calc_best_guniP10vms_vectorS0_S0_", scope: !22, file: !22, line: 102, type: !405, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !365)
!405 = !DISubroutineType(types: !406)
!406 = !{!7, !7, !236, !236, !236}
!407 = !DILocalVariable(name: "num_guns", arg: 1, scope: !404, file: !22, line: 102, type: !7)
!408 = !DILocation(line: 102, column: 23, scope: !404)
!409 = !DILocalVariable(name: "gun_pos", arg: 2, scope: !404, file: !22, line: 102, type: !236)
!410 = !DILocation(line: 102, column: 45, scope: !404)
!411 = !DILocalVariable(name: "gun_dir", arg: 3, scope: !404, file: !22, line: 102, type: !236)
!412 = !DILocation(line: 102, column: 66, scope: !404)
!413 = !DILocalVariable(name: "objpos", arg: 4, scope: !404, file: !22, line: 102, type: !236)
!414 = !DILocation(line: 102, column: 87, scope: !404)
!415 = !DILocalVariable(name: "i", scope: !404, file: !22, line: 125, type: !7)
!416 = !DILocation(line: 125, column: 6, scope: !404)
!417 = !DILocalVariable(name: "best_dot", scope: !404, file: !22, line: 126, type: !15)
!418 = !DILocation(line: 126, column: 6, scope: !404)
!419 = !DILocalVariable(name: "best_gun", scope: !404, file: !22, line: 127, type: !7)
!420 = !DILocation(line: 127, column: 6, scope: !404)
!421 = !DILocation(line: 129, column: 11, scope: !404)
!422 = !DILocation(line: 130, column: 11, scope: !404)
!423 = !DILocation(line: 132, column: 8, scope: !424)
!424 = distinct !DILexicalBlock(scope: !404, file: !22, line: 132, column: 2)
!425 = !DILocation(line: 132, column: 7, scope: !424)
!426 = !DILocation(line: 132, column: 12, scope: !427)
!427 = distinct !DILexicalBlock(scope: !424, file: !22, line: 132, column: 2)
!428 = !DILocation(line: 132, column: 14, scope: !427)
!429 = !DILocation(line: 132, column: 13, scope: !427)
!430 = !DILocation(line: 132, column: 2, scope: !424)
!431 = !DILocalVariable(name: "dot", scope: !432, file: !22, line: 133, type: !15)
!432 = distinct !DILexicalBlock(scope: !427, file: !22, line: 132, column: 29)
!433 = !DILocation(line: 133, column: 9, scope: !432)
!434 = !DILocalVariable(name: "gun_vec", scope: !432, file: !22, line: 134, type: !49)
!435 = !DILocation(line: 134, column: 14, scope: !432)
!436 = !DILocation(line: 136, column: 24, scope: !432)
!437 = !DILocation(line: 136, column: 33, scope: !432)
!438 = !DILocation(line: 136, column: 41, scope: !432)
!439 = !DILocation(line: 136, column: 3, scope: !432)
!440 = !DILocation(line: 137, column: 3, scope: !432)
!441 = !DILocation(line: 138, column: 9, scope: !432)
!442 = !DILocation(line: 138, column: 7, scope: !432)
!443 = !DILocation(line: 140, column: 7, scope: !444)
!444 = distinct !DILexicalBlock(scope: !432, file: !22, line: 140, column: 7)
!445 = !DILocation(line: 140, column: 13, scope: !444)
!446 = !DILocation(line: 140, column: 11, scope: !444)
!447 = !DILocation(line: 141, column: 15, scope: !448)
!448 = distinct !DILexicalBlock(scope: !444, file: !22, line: 140, column: 23)
!449 = !DILocation(line: 141, column: 13, scope: !448)
!450 = !DILocation(line: 142, column: 15, scope: !448)
!451 = !DILocation(line: 142, column: 13, scope: !448)
!452 = !DILocation(line: 143, column: 3, scope: !448)
!453 = !DILocation(line: 144, column: 2, scope: !432)
!454 = !DILocation(line: 132, column: 25, scope: !427)
!455 = !DILocation(line: 132, column: 2, scope: !427)
!456 = distinct !{!456, !430, !457, !458}
!457 = !DILocation(line: 144, column: 2, scope: !424)
!458 = !{!"llvm.loop.mustprogress"}
!459 = !DILocation(line: 146, column: 2, scope: !404)
!460 = !DILocation(line: 148, column: 6, scope: !461)
!461 = distinct !DILexicalBlock(scope: !404, file: !22, line: 148, column: 6)
!462 = !DILocation(line: 148, column: 15, scope: !461)
!463 = !DILocation(line: 149, column: 3, scope: !461)
!464 = !DILocation(line: 151, column: 10, scope: !461)
!465 = !DILocation(line: 151, column: 3, scope: !461)
!466 = !DILocation(line: 153, column: 1, scope: !404)
!467 = distinct !DISubprogram(name: "do_controlcen_dead_frame", linkageName: "_Z24do_controlcen_dead_framev", scope: !22, file: !22, line: 172, type: !468, scopeLine: 173, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2)
!468 = !DISubroutineType(types: !469)
!469 = !{null}
!470 = !DILocation(line: 174, column: 7, scope: !471)
!471 = distinct !DILexicalBlock(scope: !467, file: !22, line: 174, column: 6)
!472 = !DILocation(line: 174, column: 34, scope: !471)
!473 = !DILocation(line: 174, column: 41, scope: !471)
!474 = !DILocation(line: 174, column: 45, scope: !471)
!475 = !DILocation(line: 174, column: 68, scope: !471)
!476 = !DILocation(line: 175, column: 7, scope: !477)
!477 = distinct !DILexicalBlock(scope: !471, file: !22, line: 175, column: 7)
!478 = !DILocation(line: 175, column: 18, scope: !477)
!479 = !DILocation(line: 175, column: 27, scope: !477)
!480 = !DILocation(line: 175, column: 16, scope: !477)
!481 = !DILocation(line: 176, column: 45, scope: !477)
!482 = !DILocation(line: 176, column: 37, scope: !477)
!483 = !DILocation(line: 176, column: 4, scope: !477)
!484 = !DILocation(line: 175, column: 28, scope: !477)
!485 = !DILocation(line: 178, column: 6, scope: !486)
!486 = distinct !DILexicalBlock(scope: !467, file: !22, line: 178, column: 6)
!487 = !DILocation(line: 178, column: 31, scope: !486)
!488 = !DILocation(line: 178, column: 35, scope: !486)
!489 = !DILocation(line: 179, column: 3, scope: !486)
!490 = !DILocation(line: 180, column: 1, scope: !467)
!491 = distinct !DISubprogram(name: "do_countdown_frame", linkageName: "_Z18do_countdown_framev", scope: !22, file: !22, line: 184, type: !468, scopeLine: 185, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !365)
!492 = !DILocalVariable(name: "old_time", scope: !491, file: !22, line: 186, type: !15)
!493 = !DILocation(line: 186, column: 6, scope: !491)
!494 = !DILocalVariable(name: "fc", scope: !491, file: !22, line: 187, type: !7)
!495 = !DILocation(line: 187, column: 6, scope: !491)
!496 = !DILocalVariable(name: "div_scale", scope: !491, file: !22, line: 187, type: !7)
!497 = !DILocation(line: 187, column: 10, scope: !491)
!498 = !DILocation(line: 189, column: 7, scope: !499)
!499 = distinct !DILexicalBlock(scope: !491, file: !22, line: 189, column: 6)
!500 = !DILocation(line: 189, column: 6, scope: !499)
!501 = !DILocation(line: 189, column: 33, scope: !499)
!502 = !DILocation(line: 193, column: 6, scope: !503)
!503 = distinct !DILexicalBlock(scope: !491, file: !22, line: 193, column: 6)
!504 = !DILocation(line: 193, column: 25, scope: !503)
!505 = !DILocation(line: 193, column: 42, scope: !503)
!506 = !DILocation(line: 193, column: 46, scope: !503)
!507 = !DILocation(line: 193, column: 66, scope: !503)
!508 = !DILocation(line: 193, column: 72, scope: !503)
!509 = !DILocation(line: 193, column: 76, scope: !503)
!510 = !DILocation(line: 193, column: 97, scope: !503)
!511 = !DILocation(line: 193, column: 94, scope: !503)
!512 = !DILocation(line: 195, column: 9, scope: !513)
!513 = distinct !DILexicalBlock(scope: !514, file: !22, line: 195, column: 7)
!514 = distinct !DILexicalBlock(scope: !503, file: !22, line: 194, column: 5)
!515 = !DILocation(line: 195, column: 19, scope: !513)
!516 = !DILocation(line: 195, column: 8, scope: !513)
!517 = !DILocation(line: 195, column: 7, scope: !513)
!518 = !DILocation(line: 196, column: 4, scope: !513)
!519 = !DILocation(line: 197, column: 7, scope: !520)
!520 = distinct !DILexicalBlock(scope: !514, file: !22, line: 197, column: 7)
!521 = !DILocation(line: 197, column: 17, scope: !520)
!522 = !DILocation(line: 198, column: 4, scope: !520)
!523 = !DILocation(line: 199, column: 5, scope: !514)
!524 = !DILocation(line: 203, column: 7, scope: !491)
!525 = !DILocation(line: 203, column: 5, scope: !491)
!526 = !DILocation(line: 204, column: 6, scope: !527)
!527 = distinct !DILexicalBlock(scope: !491, file: !22, line: 204, column: 6)
!528 = !DILocation(line: 204, column: 9, scope: !527)
!529 = !DILocation(line: 205, column: 6, scope: !527)
!530 = !DILocation(line: 205, column: 3, scope: !527)
!531 = !DILocation(line: 208, column: 12, scope: !491)
!532 = !DILocation(line: 209, column: 6, scope: !533)
!533 = distinct !DILexicalBlock(scope: !491, file: !22, line: 209, column: 6)
!534 = !DILocation(line: 209, column: 23, scope: !533)
!535 = !DILocation(line: 210, column: 13, scope: !533)
!536 = !DILocation(line: 210, column: 3, scope: !533)
!537 = !DILocation(line: 212, column: 53, scope: !491)
!538 = !DILocation(line: 212, column: 62, scope: !491)
!539 = !DILocation(line: 212, column: 93, scope: !491)
!540 = !DILocation(line: 212, column: 92, scope: !491)
!541 = !DILocation(line: 212, column: 88, scope: !491)
!542 = !DILocation(line: 212, column: 97, scope: !491)
!543 = !DILocation(line: 212, column: 81, scope: !491)
!544 = !DILocation(line: 212, column: 46, scope: !491)
!545 = !DILocation(line: 212, column: 103, scope: !491)
!546 = !DILocation(line: 212, column: 102, scope: !491)
!547 = !DILocation(line: 212, column: 2, scope: !491)
!548 = !DILocation(line: 212, column: 17, scope: !491)
!549 = !DILocation(line: 212, column: 33, scope: !491)
!550 = !DILocation(line: 212, column: 40, scope: !491)
!551 = !DILocation(line: 212, column: 42, scope: !491)
!552 = !DILocation(line: 213, column: 53, scope: !491)
!553 = !DILocation(line: 213, column: 62, scope: !491)
!554 = !DILocation(line: 213, column: 93, scope: !491)
!555 = !DILocation(line: 213, column: 92, scope: !491)
!556 = !DILocation(line: 213, column: 88, scope: !491)
!557 = !DILocation(line: 213, column: 97, scope: !491)
!558 = !DILocation(line: 213, column: 81, scope: !491)
!559 = !DILocation(line: 213, column: 46, scope: !491)
!560 = !DILocation(line: 213, column: 103, scope: !491)
!561 = !DILocation(line: 213, column: 102, scope: !491)
!562 = !DILocation(line: 213, column: 2, scope: !491)
!563 = !DILocation(line: 213, column: 17, scope: !491)
!564 = !DILocation(line: 213, column: 33, scope: !491)
!565 = !DILocation(line: 213, column: 40, scope: !491)
!566 = !DILocation(line: 213, column: 42, scope: !491)
!567 = !DILocation(line: 216, column: 13, scope: !491)
!568 = !DILocation(line: 216, column: 11, scope: !491)
!569 = !DILocation(line: 217, column: 21, scope: !491)
!570 = !DILocation(line: 217, column: 18, scope: !491)
!571 = !DILocation(line: 218, column: 31, scope: !491)
!572 = !DILocation(line: 218, column: 47, scope: !491)
!573 = !DILocation(line: 218, column: 27, scope: !491)
!574 = !DILocation(line: 218, column: 25, scope: !491)
!575 = !DILocation(line: 220, column: 8, scope: !576)
!576 = distinct !DILexicalBlock(scope: !491, file: !22, line: 220, column: 7)
!577 = !DILocation(line: 220, column: 19, scope: !576)
!578 = !DILocation(line: 220, column: 17, scope: !576)
!579 = !DILocation(line: 220, column: 42, scope: !576)
!580 = !DILocation(line: 220, column: 46, scope: !576)
!581 = !DILocation(line: 220, column: 65, scope: !576)
!582 = !DILocation(line: 220, column: 62, scope: !576)
!583 = !DILocation(line: 221, column: 3, scope: !584)
!584 = distinct !DILexicalBlock(scope: !576, file: !22, line: 220, column: 89)
!585 = !DILocation(line: 222, column: 2, scope: !584)
!586 = !DILocation(line: 223, column: 11, scope: !587)
!587 = distinct !DILexicalBlock(scope: !491, file: !22, line: 223, column: 7)
!588 = !DILocation(line: 223, column: 20, scope: !587)
!589 = !DILocation(line: 223, column: 7, scope: !587)
!590 = !DILocation(line: 223, column: 35, scope: !587)
!591 = !DILocation(line: 223, column: 32, scope: !587)
!592 = !DILocation(line: 224, column: 9, scope: !593)
!593 = distinct !DILexicalBlock(scope: !594, file: !22, line: 224, column: 8)
!594 = distinct !DILexicalBlock(scope: !587, file: !22, line: 223, column: 60)
!595 = !DILocation(line: 224, column: 31, scope: !593)
!596 = !DILocation(line: 224, column: 36, scope: !593)
!597 = !DILocation(line: 224, column: 40, scope: !593)
!598 = !DILocation(line: 224, column: 62, scope: !593)
!599 = !DILocation(line: 225, column: 45, scope: !593)
!600 = !DILocation(line: 225, column: 44, scope: !593)
!601 = !DILocation(line: 225, column: 4, scope: !593)
!602 = !DILocation(line: 226, column: 8, scope: !603)
!603 = distinct !DILexicalBlock(scope: !594, file: !22, line: 226, column: 8)
!604 = !DILocation(line: 226, column: 32, scope: !603)
!605 = !DILocation(line: 226, column: 52, scope: !603)
!606 = !DILocation(line: 226, column: 30, scope: !603)
!607 = !DILocation(line: 227, column: 4, scope: !603)
!608 = !DILocation(line: 228, column: 2, scope: !594)
!609 = !DILocation(line: 230, column: 6, scope: !610)
!610 = distinct !DILexicalBlock(scope: !491, file: !22, line: 230, column: 6)
!611 = !DILocation(line: 230, column: 22, scope: !610)
!612 = !DILocalVariable(name: "size", scope: !613, file: !22, line: 231, type: !15)
!613 = distinct !DILexicalBlock(scope: !610, file: !22, line: 230, column: 27)
!614 = !DILocation(line: 231, column: 7, scope: !613)
!615 = !DILocalVariable(name: "old_size", scope: !613, file: !22, line: 231, type: !15)
!616 = !DILocation(line: 231, column: 12, scope: !613)
!617 = !DILocation(line: 232, column: 15, scope: !613)
!618 = !DILocation(line: 232, column: 11, scope: !613)
!619 = !DILocation(line: 232, column: 37, scope: !613)
!620 = !DILocation(line: 232, column: 36, scope: !613)
!621 = !DILocation(line: 232, column: 56, scope: !613)
!622 = !DILocation(line: 232, column: 54, scope: !613)
!623 = !DILocation(line: 232, column: 8, scope: !613)
!624 = !DILocation(line: 233, column: 19, scope: !613)
!625 = !DILocation(line: 233, column: 15, scope: !613)
!626 = !DILocation(line: 233, column: 41, scope: !613)
!627 = !DILocation(line: 233, column: 40, scope: !613)
!628 = !DILocation(line: 233, column: 53, scope: !613)
!629 = !DILocation(line: 233, column: 51, scope: !613)
!630 = !DILocation(line: 233, column: 12, scope: !613)
!631 = !DILocation(line: 234, column: 7, scope: !632)
!632 = distinct !DILexicalBlock(scope: !613, file: !22, line: 234, column: 7)
!633 = !DILocation(line: 234, column: 15, scope: !632)
!634 = !DILocation(line: 234, column: 12, scope: !632)
!635 = !DILocation(line: 234, column: 24, scope: !632)
!636 = !DILocation(line: 234, column: 28, scope: !632)
!637 = !DILocation(line: 234, column: 54, scope: !632)
!638 = !DILocation(line: 234, column: 74, scope: !632)
!639 = !DILocation(line: 234, column: 51, scope: !632)
!640 = !DILocation(line: 241, column: 4, scope: !641)
!641 = distinct !DILexicalBlock(scope: !632, file: !22, line: 234, column: 82)
!642 = !DILocation(line: 242, column: 3, scope: !641)
!643 = !DILocation(line: 243, column: 2, scope: !613)
!644 = !DILocalVariable(name: "flash_value", scope: !645, file: !22, line: 244, type: !7)
!645 = distinct !DILexicalBlock(scope: !610, file: !22, line: 243, column: 10)
!646 = !DILocation(line: 244, column: 7, scope: !645)
!647 = !DILocation(line: 246, column: 7, scope: !648)
!648 = distinct !DILexicalBlock(scope: !645, file: !22, line: 246, column: 7)
!649 = !DILocation(line: 246, column: 16, scope: !648)
!650 = !DILocation(line: 247, column: 4, scope: !648)
!651 = !DILocation(line: 249, column: 22, scope: !645)
!652 = !DILocation(line: 249, column: 21, scope: !645)
!653 = !DILocation(line: 249, column: 38, scope: !645)
!654 = !DILocation(line: 249, column: 17, scope: !645)
!655 = !DILocation(line: 249, column: 15, scope: !645)
!656 = !DILocation(line: 250, column: 3, scope: !645)
!657 = !DILocation(line: 252, column: 7, scope: !658)
!658 = distinct !DILexicalBlock(scope: !645, file: !22, line: 252, column: 7)
!659 = !DILocation(line: 252, column: 22, scope: !658)
!660 = !DILocation(line: 253, column: 3, scope: !661)
!661 = distinct !DILexicalBlock(scope: !658, file: !22, line: 252, column: 29)
!662 = !DILocation(line: 257, column: 3, scope: !661)
!663 = !DILocation(line: 261, column: 4, scope: !661)
!664 = !DILocation(line: 262, column: 4, scope: !661)
!665 = !DILocation(line: 265, column: 4, scope: !661)
!666 = !DILocation(line: 266, column: 3, scope: !661)
!667 = !DILocation(line: 268, column: 1, scope: !491)
!668 = distinct !DISubprogram(name: "fixmul", linkageName: "_Z6fixmulii", scope: !16, file: !16, line: 83, type: !669, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !365)
!669 = !DISubroutineType(types: !670)
!670 = !{!15, !15, !15}
!671 = !DILocalVariable(name: "a", arg: 1, scope: !668, file: !16, line: 83, type: !15)
!672 = !DILocation(line: 83, column: 26, scope: !668)
!673 = !DILocalVariable(name: "b", arg: 2, scope: !668, file: !16, line: 83, type: !15)
!674 = !DILocation(line: 83, column: 33, scope: !668)
!675 = !DILocation(line: 85, column: 19, scope: !668)
!676 = !DILocation(line: 85, column: 32, scope: !668)
!677 = !DILocation(line: 85, column: 21, scope: !668)
!678 = !DILocation(line: 85, column: 35, scope: !668)
!679 = !DILocation(line: 85, column: 9, scope: !668)
!680 = !DILocation(line: 85, column: 2, scope: !668)
!681 = distinct !DISubprogram(name: "f2i", linkageName: "_Z3f2ii", scope: !16, file: !16, line: 55, type: !682, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !365)
!682 = !DISubroutineType(types: !683)
!683 = !{!7, !15}
!684 = !DILocalVariable(name: "f", arg: 1, scope: !681, file: !16, line: 55, type: !15)
!685 = !DILocation(line: 55, column: 23, scope: !681)
!686 = !DILocation(line: 57, column: 9, scope: !681)
!687 = !DILocation(line: 57, column: 11, scope: !681)
!688 = !DILocation(line: 57, column: 2, scope: !681)
!689 = distinct !DISubprogram(name: "fl2f", linkageName: "_Z4fl2ff", scope: !16, file: !16, line: 77, type: !690, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !365)
!690 = !DISubroutineType(types: !691)
!691 = !{!15, !692}
!692 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!693 = !DILocalVariable(name: "f", arg: 1, scope: !689, file: !16, line: 77, type: !692)
!694 = !DILocation(line: 77, column: 26, scope: !689)
!695 = !DILocation(line: 79, column: 15, scope: !689)
!696 = !DILocation(line: 79, column: 17, scope: !689)
!697 = !DILocation(line: 79, column: 14, scope: !689)
!698 = !DILocation(line: 79, column: 2, scope: !689)
!699 = distinct !DISubprogram(name: "i2f", linkageName: "_Z3i2fi", scope: !16, file: !16, line: 49, type: !700, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !365)
!700 = !DISubroutineType(types: !701)
!701 = !{!15, !7}
!702 = !DILocalVariable(name: "i", arg: 1, scope: !699, file: !16, line: 49, type: !7)
!703 = !DILocation(line: 49, column: 23, scope: !699)
!704 = !DILocation(line: 51, column: 9, scope: !699)
!705 = !DILocation(line: 51, column: 11, scope: !699)
!706 = !DILocation(line: 51, column: 2, scope: !699)
!707 = distinct !DISubprogram(name: "do_controlcen_destroyed_stuff", linkageName: "_Z29do_controlcen_destroyed_stuffP6object", scope: !22, file: !22, line: 275, type: !708, scopeLine: 276, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !365)
!708 = !DISubroutineType(types: !709)
!709 = !{null, !237}
!710 = !DILocalVariable(name: "objp", arg: 1, scope: !707, file: !22, line: 275, type: !237)
!711 = !DILocation(line: 275, column: 44, scope: !707)
!712 = !DILocalVariable(name: "i", scope: !707, file: !22, line: 277, type: !7)
!713 = !DILocation(line: 277, column: 6, scope: !707)
!714 = !DILocation(line: 279, column: 9, scope: !715)
!715 = distinct !DILexicalBlock(scope: !707, file: !22, line: 279, column: 8)
!716 = !DILocation(line: 279, column: 19, scope: !715)
!717 = !DILocation(line: 279, column: 8, scope: !715)
!718 = !DILocation(line: 279, column: 38, scope: !715)
!719 = !DILocation(line: 279, column: 41, scope: !715)
!720 = !DILocation(line: 280, column: 5, scope: !715)
!721 = !DILocation(line: 283, column: 8, scope: !722)
!722 = distinct !DILexicalBlock(scope: !707, file: !22, line: 283, column: 2)
!723 = !DILocation(line: 283, column: 7, scope: !722)
!724 = !DILocation(line: 283, column: 11, scope: !725)
!725 = distinct !DILexicalBlock(scope: !722, file: !22, line: 283, column: 2)
!726 = !DILocation(line: 283, column: 35, scope: !725)
!727 = !DILocation(line: 283, column: 13, scope: !725)
!728 = !DILocation(line: 283, column: 12, scope: !725)
!729 = !DILocation(line: 283, column: 2, scope: !722)
!730 = !DILocation(line: 284, column: 51, scope: !725)
!731 = !DILocation(line: 284, column: 25, scope: !725)
!732 = !DILocation(line: 284, column: 16, scope: !725)
!733 = !DILocation(line: 284, column: 83, scope: !725)
!734 = !DILocation(line: 284, column: 56, scope: !725)
!735 = !DILocation(line: 284, column: 3, scope: !725)
!736 = !DILocation(line: 283, column: 46, scope: !725)
!737 = !DILocation(line: 283, column: 2, scope: !725)
!738 = distinct !{!738, !729, !739, !458}
!739 = !DILocation(line: 284, column: 85, scope: !722)
!740 = !DILocation(line: 287, column: 27, scope: !707)
!741 = !DILocation(line: 290, column: 6, scope: !742)
!742 = distinct !DILexicalBlock(scope: !707, file: !22, line: 290, column: 6)
!743 = !DILocation(line: 290, column: 24, scope: !742)
!744 = !DILocalVariable(name: "rval", scope: !745, file: !22, line: 292, type: !7)
!745 = distinct !DILexicalBlock(scope: !742, file: !22, line: 291, column: 2)
!746 = !DILocation(line: 292, column: 7, scope: !745)
!747 = !DILocalVariable(name: "secretc_full_path", scope: !745, file: !22, line: 294, type: !748)
!748 = !DICompositeType(tag: DW_TAG_array_type, baseType: !64, size: 8192, elements: !749)
!749 = !{!750}
!750 = !DISubrange(count: 1024)
!751 = !DILocation(line: 294, column: 8, scope: !745)
!752 = !DILocation(line: 295, column: 22, scope: !745)
!753 = !DILocation(line: 295, column: 3, scope: !745)
!754 = !DILocation(line: 296, column: 10, scope: !745)
!755 = !DILocation(line: 296, column: 8, scope: !745)
!756 = !DILocation(line: 300, column: 3, scope: !745)
!757 = !DILocation(line: 301, column: 2, scope: !745)
!758 = !DILocation(line: 303, column: 6, scope: !759)
!759 = distinct !DILexicalBlock(scope: !707, file: !22, line: 303, column: 6)
!760 = !DILocation(line: 303, column: 25, scope: !759)
!761 = !DILocation(line: 305, column: 26, scope: !762)
!762 = distinct !DILexicalBlock(scope: !759, file: !22, line: 304, column: 2)
!763 = !DILocation(line: 305, column: 63, scope: !762)
!764 = !DILocation(line: 305, column: 107, scope: !762)
!765 = !DILocation(line: 305, column: 105, scope: !762)
!766 = !DILocation(line: 305, column: 124, scope: !762)
!767 = !DILocation(line: 305, column: 98, scope: !762)
!768 = !DILocation(line: 305, column: 129, scope: !762)
!769 = !DILocation(line: 305, column: 61, scope: !762)
!770 = !DILocation(line: 305, column: 133, scope: !762)
!771 = !DILocation(line: 305, column: 24, scope: !762)
!772 = !DILocation(line: 306, column: 2, scope: !762)
!773 = !DILocation(line: 309, column: 7, scope: !774)
!774 = distinct !DILexicalBlock(scope: !775, file: !22, line: 309, column: 7)
!775 = distinct !DILexicalBlock(scope: !759, file: !22, line: 308, column: 2)
!776 = !DILocation(line: 309, column: 42, scope: !774)
!777 = !DILocation(line: 310, column: 27, scope: !774)
!778 = !DILocation(line: 310, column: 64, scope: !774)
!779 = !DILocation(line: 310, column: 108, scope: !774)
!780 = !DILocation(line: 310, column: 106, scope: !774)
!781 = !DILocation(line: 310, column: 125, scope: !774)
!782 = !DILocation(line: 310, column: 99, scope: !774)
!783 = !DILocation(line: 310, column: 130, scope: !774)
!784 = !DILocation(line: 310, column: 62, scope: !774)
!785 = !DILocation(line: 310, column: 25, scope: !774)
!786 = !DILocation(line: 310, column: 4, scope: !774)
!787 = !DILocation(line: 312, column: 54, scope: !774)
!788 = !DILocation(line: 312, column: 27, scope: !774)
!789 = !DILocation(line: 312, column: 25, scope: !774)
!790 = !DILocation(line: 315, column: 24, scope: !707)
!791 = !DILocation(line: 315, column: 20, scope: !707)
!792 = !DILocation(line: 315, column: 18, scope: !707)
!793 = !DILocation(line: 317, column: 7, scope: !794)
!794 = distinct !DILexicalBlock(scope: !707, file: !22, line: 317, column: 6)
!795 = !DILocation(line: 317, column: 30, scope: !794)
!796 = !DILocation(line: 317, column: 33, scope: !794)
!797 = !DILocation(line: 317, column: 37, scope: !794)
!798 = !DILocation(line: 319, column: 3, scope: !799)
!799 = distinct !DILexicalBlock(scope: !794, file: !22, line: 317, column: 45)
!800 = !DILocation(line: 324, column: 31, scope: !707)
!801 = !DILocation(line: 324, column: 35, scope: !707)
!802 = !DILocation(line: 324, column: 29, scope: !707)
!803 = !DILocation(line: 325, column: 1, scope: !707)
!804 = distinct !DISubprogram(name: "do_controlcen_frame", linkageName: "_Z19do_controlcen_frameP6object", scope: !22, file: !22, line: 331, type: !708, scopeLine: 332, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !365)
!805 = !DILocalVariable(name: "obj", arg: 1, scope: !804, file: !22, line: 331, type: !237)
!806 = !DILocation(line: 331, column: 34, scope: !804)
!807 = !DILocalVariable(name: "best_gun_num", scope: !804, file: !22, line: 412, type: !7)
!808 = !DILocation(line: 412, column: 8, scope: !804)
!809 = !DILocation(line: 415, column: 7, scope: !810)
!810 = distinct !DILexicalBlock(scope: !804, file: !22, line: 415, column: 6)
!811 = !DILocation(line: 415, column: 6, scope: !810)
!812 = !DILocation(line: 416, column: 3, scope: !810)
!813 = !DILocation(line: 419, column: 7, scope: !814)
!814 = distinct !DILexicalBlock(scope: !804, file: !22, line: 419, column: 6)
!815 = !DILocation(line: 419, column: 28, scope: !814)
!816 = !DILocation(line: 419, column: 32, scope: !814)
!817 = !DILocation(line: 419, column: 47, scope: !814)
!818 = !DILocation(line: 419, column: 31, scope: !814)
!819 = !DILocation(line: 420, column: 3, scope: !814)
!820 = !DILocation(line: 426, column: 8, scope: !821)
!821 = distinct !DILexicalBlock(scope: !804, file: !22, line: 426, column: 6)
!822 = !DILocation(line: 426, column: 32, scope: !821)
!823 = !DILocation(line: 426, column: 35, scope: !821)
!824 = !DILocation(line: 426, column: 6, scope: !821)
!825 = !DILocation(line: 427, column: 9, scope: !826)
!826 = distinct !DILexicalBlock(scope: !827, file: !22, line: 427, column: 7)
!827 = distinct !DILexicalBlock(scope: !821, file: !22, line: 426, column: 69)
!828 = !DILocation(line: 427, column: 20, scope: !826)
!829 = !DILocation(line: 427, column: 8, scope: !826)
!830 = !DILocation(line: 427, column: 7, scope: !826)
!831 = !DILocalVariable(name: "vec_to_player", scope: !832, file: !22, line: 428, type: !49)
!832 = distinct !DILexicalBlock(scope: !826, file: !22, line: 427, column: 26)
!833 = !DILocation(line: 428, column: 15, scope: !832)
!834 = !DILocalVariable(name: "dist_to_player", scope: !832, file: !22, line: 429, type: !15)
!835 = !DILocation(line: 429, column: 10, scope: !832)
!836 = !DILocalVariable(name: "i", scope: !832, file: !22, line: 430, type: !7)
!837 = !DILocation(line: 430, column: 10, scope: !832)
!838 = !DILocalVariable(name: "segp", scope: !832, file: !22, line: 431, type: !839)
!839 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !840, size: 64)
!840 = !DIDerivedType(tag: DW_TAG_typedef, name: "segment", file: !841, line: 123, baseType: !842)
!841 = !DIFile(filename: "main_d2/segment.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "c950815a9b07e6bab2fa2587b90affec")
!842 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "segment", file: !841, line: 100, size: 4096, flags: DIFlagTypePassByValue, elements: !843, identifier: "_ZTS7segment")
!843 = !{!844, !870, !872, !874}
!844 = !DIDerivedType(tag: DW_TAG_member, name: "sides", scope: !842, file: !841, line: 105, baseType: !845, size: 3840)
!845 = !DICompositeType(tag: DW_TAG_array_type, baseType: !846, size: 3840, elements: !868)
!846 = !DIDerivedType(tag: DW_TAG_typedef, name: "side", file: !841, line: 91, baseType: !847)
!847 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "side", file: !841, line: 82, size: 640, flags: DIFlagTypePassByValue, elements: !848, identifier: "_ZTS4side")
!848 = !{!849, !850, !851, !852, !853, !854, !864}
!849 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !847, file: !841, line: 84, baseType: !141, size: 8)
!850 = !DIDerivedType(tag: DW_TAG_member, name: "pad", scope: !847, file: !841, line: 85, baseType: !151, size: 8, offset: 8)
!851 = !DIDerivedType(tag: DW_TAG_member, name: "wall_num", scope: !847, file: !841, line: 86, baseType: !30, size: 16, offset: 16)
!852 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_num", scope: !847, file: !841, line: 87, baseType: !30, size: 16, offset: 32)
!853 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_num2", scope: !847, file: !841, line: 88, baseType: !30, size: 16, offset: 48)
!854 = !DIDerivedType(tag: DW_TAG_member, name: "uvls", scope: !847, file: !841, line: 89, baseType: !855, size: 384, offset: 64)
!855 = !DICompositeType(tag: DW_TAG_array_type, baseType: !856, size: 384, elements: !862)
!856 = !DIDerivedType(tag: DW_TAG_typedef, name: "uvl", file: !841, line: 67, baseType: !857)
!857 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uvl", file: !841, line: 64, size: 96, flags: DIFlagTypePassByValue, elements: !858, identifier: "_ZTS3uvl")
!858 = !{!859, !860, !861}
!859 = !DIDerivedType(tag: DW_TAG_member, name: "u", scope: !857, file: !841, line: 66, baseType: !15, size: 32)
!860 = !DIDerivedType(tag: DW_TAG_member, name: "v", scope: !857, file: !841, line: 66, baseType: !15, size: 32, offset: 32)
!861 = !DIDerivedType(tag: DW_TAG_member, name: "l", scope: !857, file: !841, line: 66, baseType: !15, size: 32, offset: 64)
!862 = !{!863}
!863 = !DISubrange(count: 4)
!864 = !DIDerivedType(tag: DW_TAG_member, name: "normals", scope: !847, file: !841, line: 90, baseType: !865, size: 192, offset: 448)
!865 = !DICompositeType(tag: DW_TAG_array_type, baseType: !49, size: 192, elements: !866)
!866 = !{!867}
!867 = !DISubrange(count: 2)
!868 = !{!869}
!869 = !DISubrange(count: 6)
!870 = !DIDerivedType(tag: DW_TAG_member, name: "children", scope: !842, file: !841, line: 106, baseType: !871, size: 96, offset: 3840)
!871 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 96, elements: !868)
!872 = !DIDerivedType(tag: DW_TAG_member, name: "verts", scope: !842, file: !841, line: 107, baseType: !873, size: 128, offset: 3936)
!873 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 128, elements: !56)
!874 = !DIDerivedType(tag: DW_TAG_member, name: "objects", scope: !842, file: !841, line: 112, baseType: !7, size: 32, offset: 4064)
!875 = !DILocation(line: 431, column: 14, scope: !832)
!876 = !DILocation(line: 431, column: 31, scope: !832)
!877 = !DILocation(line: 431, column: 36, scope: !832)
!878 = !DILocation(line: 431, column: 22, scope: !832)
!879 = !DILocation(line: 441, column: 8, scope: !880)
!880 = distinct !DILexicalBlock(scope: !832, file: !22, line: 441, column: 8)
!881 = !DILocation(line: 441, column: 18, scope: !880)
!882 = !DILocation(line: 442, column: 43, scope: !880)
!883 = !DILocation(line: 442, column: 35, scope: !880)
!884 = !DILocation(line: 442, column: 55, scope: !880)
!885 = !DILocation(line: 442, column: 27, scope: !880)
!886 = !DILocation(line: 442, column: 63, scope: !880)
!887 = !DILocation(line: 442, column: 25, scope: !880)
!888 = !DILocation(line: 442, column: 5, scope: !880)
!889 = !DILocation(line: 446, column: 10, scope: !890)
!890 = distinct !DILexicalBlock(scope: !832, file: !22, line: 446, column: 4)
!891 = !DILocation(line: 446, column: 9, scope: !890)
!892 = !DILocation(line: 446, column: 14, scope: !893)
!893 = distinct !DILexicalBlock(scope: !890, file: !22, line: 446, column: 4)
!894 = !DILocation(line: 446, column: 15, scope: !893)
!895 = !DILocation(line: 446, column: 4, scope: !890)
!896 = !DILocation(line: 447, column: 9, scope: !897)
!897 = distinct !DILexicalBlock(scope: !893, file: !22, line: 447, column: 9)
!898 = !DILocation(line: 448, column: 6, scope: !897)
!899 = !DILocation(line: 446, column: 40, scope: !893)
!900 = !DILocation(line: 446, column: 4, scope: !893)
!901 = distinct !{!901, !895, !902, !458}
!902 = !DILocation(line: 448, column: 6, scope: !890)
!903 = !DILocation(line: 449, column: 8, scope: !904)
!904 = distinct !DILexicalBlock(scope: !832, file: !22, line: 449, column: 8)
!905 = !DILocation(line: 449, column: 10, scope: !904)
!906 = !DILocation(line: 450, column: 5, scope: !904)
!907 = !DILocation(line: 452, column: 32, scope: !832)
!908 = !DILocation(line: 452, column: 47, scope: !832)
!909 = !DILocation(line: 452, column: 53, scope: !832)
!910 = !DILocation(line: 452, column: 58, scope: !832)
!911 = !DILocation(line: 452, column: 4, scope: !832)
!912 = !DILocation(line: 453, column: 21, scope: !832)
!913 = !DILocation(line: 453, column: 19, scope: !832)
!914 = !DILocation(line: 454, column: 8, scope: !915)
!915 = distinct !DILexicalBlock(scope: !832, file: !22, line: 454, column: 8)
!916 = !DILocation(line: 454, column: 23, scope: !915)
!917 = !DILocation(line: 455, column: 69, scope: !918)
!918 = distinct !DILexicalBlock(scope: !915, file: !22, line: 454, column: 35)
!919 = !DILocation(line: 455, column: 75, scope: !918)
!920 = !DILocation(line: 455, column: 80, scope: !918)
!921 = !DILocation(line: 455, column: 39, scope: !918)
!922 = !DILocation(line: 455, column: 37, scope: !918)
!923 = !DILocation(line: 456, column: 35, scope: !918)
!924 = !DILocation(line: 457, column: 4, scope: !918)
!925 = !DILocation(line: 458, column: 3, scope: !832)
!926 = !DILocation(line: 460, column: 3, scope: !827)
!927 = !DILocation(line: 464, column: 6, scope: !928)
!928 = distinct !DILexicalBlock(scope: !804, file: !22, line: 464, column: 6)
!929 = !DILocation(line: 464, column: 30, scope: !928)
!930 = !DILocation(line: 464, column: 33, scope: !928)
!931 = !DILocation(line: 465, column: 8, scope: !932)
!932 = distinct !DILexicalBlock(scope: !933, file: !22, line: 465, column: 7)
!933 = distinct !DILexicalBlock(scope: !928, file: !22, line: 464, column: 66)
!934 = !DILocation(line: 465, column: 31, scope: !932)
!935 = !DILocation(line: 465, column: 42, scope: !932)
!936 = !DILocation(line: 465, column: 40, scope: !932)
!937 = !DILocation(line: 465, column: 52, scope: !932)
!938 = !DILocation(line: 465, column: 56, scope: !932)
!939 = !DILocation(line: 465, column: 81, scope: !932)
!940 = !DILocation(line: 465, column: 79, scope: !932)
!941 = !DILocalVariable(name: "vec_to_player", scope: !942, file: !22, line: 466, type: !49)
!942 = distinct !DILexicalBlock(scope: !932, file: !22, line: 465, column: 92)
!943 = !DILocation(line: 466, column: 15, scope: !942)
!944 = !DILocalVariable(name: "dist_to_player", scope: !942, file: !22, line: 467, type: !15)
!945 = !DILocation(line: 467, column: 10, scope: !942)
!946 = !DILocation(line: 469, column: 32, scope: !942)
!947 = !DILocation(line: 469, column: 47, scope: !942)
!948 = !DILocation(line: 469, column: 53, scope: !942)
!949 = !DILocation(line: 469, column: 58, scope: !942)
!950 = !DILocation(line: 469, column: 4, scope: !942)
!951 = !DILocation(line: 470, column: 21, scope: !942)
!952 = !DILocation(line: 470, column: 19, scope: !942)
!953 = !DILocation(line: 471, column: 29, scope: !942)
!954 = !DILocation(line: 471, column: 27, scope: !942)
!955 = !DILocation(line: 472, column: 8, scope: !956)
!956 = distinct !DILexicalBlock(scope: !942, file: !22, line: 472, column: 8)
!957 = !DILocation(line: 472, column: 23, scope: !956)
!958 = !DILocation(line: 473, column: 69, scope: !959)
!959 = distinct !DILexicalBlock(scope: !956, file: !22, line: 472, column: 35)
!960 = !DILocation(line: 473, column: 75, scope: !959)
!961 = !DILocation(line: 473, column: 80, scope: !959)
!962 = !DILocation(line: 473, column: 39, scope: !959)
!963 = !DILocation(line: 473, column: 37, scope: !959)
!964 = !DILocation(line: 474, column: 10, scope: !965)
!965 = distinct !DILexicalBlock(scope: !959, file: !22, line: 474, column: 9)
!966 = !DILocation(line: 474, column: 9, scope: !965)
!967 = !DILocation(line: 475, column: 30, scope: !965)
!968 = !DILocation(line: 475, column: 6, scope: !965)
!969 = !DILocation(line: 476, column: 4, scope: !959)
!970 = !DILocation(line: 477, column: 3, scope: !942)
!971 = !DILocation(line: 479, column: 2, scope: !933)
!972 = !DILocation(line: 481, column: 7, scope: !973)
!973 = distinct !DILexicalBlock(scope: !804, file: !22, line: 481, column: 6)
!974 = !DILocation(line: 481, column: 37, scope: !973)
!975 = !DILocation(line: 481, column: 42, scope: !973)
!976 = !DILocation(line: 481, column: 47, scope: !973)
!977 = !DILocation(line: 481, column: 62, scope: !973)
!978 = !DILocation(line: 481, column: 66, scope: !973)
!979 = !DILocation(line: 481, column: 77, scope: !973)
!980 = !DILocation(line: 481, column: 97, scope: !973)
!981 = !DILocation(line: 481, column: 75, scope: !973)
!982 = !DILocation(line: 482, column: 15, scope: !983)
!983 = distinct !DILexicalBlock(scope: !984, file: !22, line: 482, column: 7)
!984 = distinct !DILexicalBlock(scope: !973, file: !22, line: 481, column: 108)
!985 = !DILocation(line: 482, column: 7, scope: !983)
!986 = !DILocation(line: 482, column: 27, scope: !983)
!987 = !DILocation(line: 482, column: 33, scope: !983)
!988 = !DILocation(line: 483, column: 33, scope: !983)
!989 = !DILocation(line: 483, column: 19, scope: !983)
!990 = !DILocation(line: 483, column: 17, scope: !983)
!991 = !DILocation(line: 483, column: 4, scope: !983)
!992 = !DILocation(line: 485, column: 33, scope: !983)
!993 = !DILocation(line: 485, column: 71, scope: !983)
!994 = !DILocation(line: 485, column: 86, scope: !983)
!995 = !DILocation(line: 485, column: 19, scope: !983)
!996 = !DILocation(line: 485, column: 17, scope: !983)
!997 = !DILocation(line: 487, column: 7, scope: !998)
!998 = distinct !DILexicalBlock(scope: !984, file: !22, line: 487, column: 7)
!999 = !DILocation(line: 487, column: 20, scope: !998)
!1000 = !DILocalVariable(name: "rand_prob", scope: !1001, file: !22, line: 488, type: !7)
!1001 = distinct !DILexicalBlock(scope: !998, file: !22, line: 487, column: 27)
!1002 = !DILocation(line: 488, column: 10, scope: !1001)
!1003 = !DILocalVariable(name: "count", scope: !1001, file: !22, line: 488, type: !7)
!1004 = !DILocation(line: 488, column: 21, scope: !1001)
!1005 = !DILocalVariable(name: "vec_to_goal", scope: !1001, file: !22, line: 489, type: !49)
!1006 = !DILocation(line: 489, column: 15, scope: !1001)
!1007 = !DILocalVariable(name: "dist_to_player", scope: !1001, file: !22, line: 490, type: !15)
!1008 = !DILocation(line: 490, column: 10, scope: !1001)
!1009 = !DILocalVariable(name: "delta_fire_time", scope: !1001, file: !22, line: 491, type: !15)
!1010 = !DILocation(line: 491, column: 10, scope: !1001)
!1011 = !DILocation(line: 493, column: 16, scope: !1012)
!1012 = distinct !DILexicalBlock(scope: !1001, file: !22, line: 493, column: 8)
!1013 = !DILocation(line: 493, column: 8, scope: !1012)
!1014 = !DILocation(line: 493, column: 28, scope: !1012)
!1015 = !DILocation(line: 493, column: 34, scope: !1012)
!1016 = !DILocation(line: 494, column: 61, scope: !1017)
!1017 = distinct !DILexicalBlock(scope: !1012, file: !22, line: 493, column: 58)
!1018 = !DILocation(line: 494, column: 53, scope: !1017)
!1019 = !DILocation(line: 494, column: 5, scope: !1017)
!1020 = !DILocation(line: 495, column: 22, scope: !1017)
!1021 = !DILocation(line: 495, column: 20, scope: !1017)
!1022 = !DILocation(line: 496, column: 4, scope: !1017)
!1023 = !DILocation(line: 497, column: 31, scope: !1024)
!1024 = distinct !DILexicalBlock(scope: !1012, file: !22, line: 496, column: 11)
!1025 = !DILocation(line: 497, column: 46, scope: !1024)
!1026 = !DILocation(line: 497, column: 60, scope: !1024)
!1027 = !DILocation(line: 497, column: 52, scope: !1024)
!1028 = !DILocation(line: 497, column: 5, scope: !1024)
!1029 = !DILocation(line: 498, column: 22, scope: !1024)
!1030 = !DILocation(line: 498, column: 20, scope: !1024)
!1031 = !DILocation(line: 501, column: 8, scope: !1032)
!1032 = distinct !DILexicalBlock(scope: !1001, file: !22, line: 501, column: 8)
!1033 = !DILocation(line: 501, column: 23, scope: !1032)
!1034 = !DILocation(line: 503, column: 29, scope: !1035)
!1035 = distinct !DILexicalBlock(scope: !1032, file: !22, line: 502, column: 4)
!1036 = !DILocation(line: 504, column: 37, scope: !1035)
!1037 = !DILocation(line: 505, column: 5, scope: !1035)
!1038 = !DILocation(line: 512, column: 50, scope: !1001)
!1039 = !DILocation(line: 512, column: 42, scope: !1001)
!1040 = !DILocation(line: 512, column: 65, scope: !1001)
!1041 = !DILocation(line: 512, column: 68, scope: !1001)
!1042 = !DILocation(line: 512, column: 4, scope: !1001)
!1043 = !DILocation(line: 515, column: 26, scope: !1001)
!1044 = !DILocation(line: 515, column: 22, scope: !1001)
!1045 = !DILocation(line: 515, column: 44, scope: !1001)
!1046 = !DILocation(line: 515, column: 46, scope: !1001)
!1047 = !DILocation(line: 515, column: 20, scope: !1001)
!1048 = !DILocation(line: 515, column: 14, scope: !1001)
!1049 = !DILocation(line: 516, column: 10, scope: !1001)
!1050 = !DILocation(line: 517, column: 4, scope: !1001)
!1051 = !DILocation(line: 517, column: 12, scope: !1001)
!1052 = !DILocation(line: 517, column: 23, scope: !1001)
!1053 = !DILocation(line: 517, column: 21, scope: !1001)
!1054 = !DILocation(line: 517, column: 34, scope: !1001)
!1055 = !DILocation(line: 517, column: 38, scope: !1001)
!1056 = !DILocation(line: 517, column: 44, scope: !1001)
!1057 = !DILocation(line: 0, scope: !1001)
!1058 = !DILocalVariable(name: "randvec", scope: !1059, file: !22, line: 518, type: !49)
!1059 = distinct !DILexicalBlock(scope: !1001, file: !22, line: 517, column: 50)
!1060 = !DILocation(line: 518, column: 16, scope: !1059)
!1061 = !DILocation(line: 520, column: 5, scope: !1059)
!1062 = !DILocation(line: 521, column: 5, scope: !1059)
!1063 = !DILocation(line: 522, column: 5, scope: !1059)
!1064 = !DILocation(line: 527, column: 51, scope: !1059)
!1065 = !DILocation(line: 527, column: 43, scope: !1059)
!1066 = !DILocation(line: 527, column: 66, scope: !1059)
!1067 = !DILocation(line: 527, column: 69, scope: !1059)
!1068 = !DILocation(line: 527, column: 5, scope: !1059)
!1069 = !DILocation(line: 528, column: 10, scope: !1059)
!1070 = distinct !{!1070, !1050, !1071, !458}
!1071 = !DILocation(line: 529, column: 4, scope: !1001)
!1072 = !DILocation(line: 531, column: 29, scope: !1001)
!1073 = !DILocation(line: 531, column: 27, scope: !1001)
!1074 = !DILocation(line: 531, column: 47, scope: !1001)
!1075 = !DILocation(line: 531, column: 53, scope: !1001)
!1076 = !DILocation(line: 531, column: 20, scope: !1001)
!1077 = !DILocation(line: 532, column: 8, scope: !1078)
!1078 = distinct !DILexicalBlock(scope: !1001, file: !22, line: 532, column: 8)
!1079 = !DILocation(line: 532, column: 25, scope: !1078)
!1080 = !DILocation(line: 533, column: 21, scope: !1078)
!1081 = !DILocation(line: 533, column: 5, scope: !1078)
!1082 = !DILocation(line: 535, column: 8, scope: !1083)
!1083 = distinct !DILexicalBlock(scope: !1001, file: !22, line: 535, column: 8)
!1084 = !DILocation(line: 535, column: 18, scope: !1083)
!1085 = !DILocation(line: 536, column: 21, scope: !1083)
!1086 = !DILocation(line: 536, column: 5, scope: !1083)
!1087 = !DILocation(line: 538, column: 36, scope: !1001)
!1088 = !DILocation(line: 538, column: 34, scope: !1001)
!1089 = !DILocation(line: 540, column: 3, scope: !1001)
!1090 = !DILocation(line: 541, column: 2, scope: !984)
!1091 = !DILocation(line: 542, column: 36, scope: !973)
!1092 = !DILocation(line: 542, column: 33, scope: !973)
!1093 = !DILocation(line: 544, column: 1, scope: !804)
!1094 = distinct !DISubprogram(name: "init_controlcen_for_level", linkageName: "_Z25init_controlcen_for_levelv", scope: !22, file: !22, line: 552, type: !468, scopeLine: 553, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !365)
!1095 = !DILocalVariable(name: "i", scope: !1094, file: !22, line: 554, type: !7)
!1096 = !DILocation(line: 554, column: 7, scope: !1094)
!1097 = !DILocalVariable(name: "objp", scope: !1094, file: !22, line: 555, type: !237)
!1098 = !DILocation(line: 555, column: 10, scope: !1094)
!1099 = !DILocalVariable(name: "cntrlcen_objnum", scope: !1094, file: !22, line: 556, type: !7)
!1100 = !DILocation(line: 556, column: 7, scope: !1094)
!1101 = !DILocalVariable(name: "boss_objnum", scope: !1094, file: !22, line: 556, type: !7)
!1102 = !DILocation(line: 556, column: 27, scope: !1094)
!1103 = !DILocation(line: 558, column: 8, scope: !1104)
!1104 = distinct !DILexicalBlock(scope: !1094, file: !22, line: 558, column: 2)
!1105 = !DILocation(line: 558, column: 7, scope: !1104)
!1106 = !DILocation(line: 558, column: 12, scope: !1107)
!1107 = distinct !DILexicalBlock(scope: !1104, file: !22, line: 558, column: 2)
!1108 = !DILocation(line: 558, column: 15, scope: !1107)
!1109 = !DILocation(line: 558, column: 13, scope: !1107)
!1110 = !DILocation(line: 558, column: 2, scope: !1104)
!1111 = !DILocation(line: 559, column: 19, scope: !1112)
!1112 = distinct !DILexicalBlock(scope: !1107, file: !22, line: 558, column: 42)
!1113 = !DILocation(line: 559, column: 11, scope: !1112)
!1114 = !DILocation(line: 559, column: 8, scope: !1112)
!1115 = !DILocation(line: 560, column: 7, scope: !1116)
!1116 = distinct !DILexicalBlock(scope: !1112, file: !22, line: 560, column: 7)
!1117 = !DILocation(line: 560, column: 13, scope: !1116)
!1118 = !DILocation(line: 560, column: 18, scope: !1116)
!1119 = !DILocation(line: 561, column: 8, scope: !1120)
!1120 = distinct !DILexicalBlock(scope: !1116, file: !22, line: 561, column: 8)
!1121 = !DILocation(line: 561, column: 24, scope: !1120)
!1122 = !DILocation(line: 562, column: 5, scope: !1120)
!1123 = !DILocation(line: 564, column: 23, scope: !1120)
!1124 = !DILocation(line: 564, column: 21, scope: !1120)
!1125 = !DILocation(line: 561, column: 28, scope: !1120)
!1126 = !DILocation(line: 566, column: 8, scope: !1127)
!1127 = distinct !DILexicalBlock(scope: !1112, file: !22, line: 566, column: 7)
!1128 = !DILocation(line: 566, column: 14, scope: !1127)
!1129 = !DILocation(line: 566, column: 19, scope: !1127)
!1130 = !DILocation(line: 566, column: 33, scope: !1127)
!1131 = !DILocation(line: 566, column: 48, scope: !1127)
!1132 = !DILocation(line: 566, column: 54, scope: !1127)
!1133 = !DILocation(line: 566, column: 37, scope: !1127)
!1134 = !DILocation(line: 566, column: 58, scope: !1127)
!1135 = !DILocation(line: 566, column: 36, scope: !1127)
!1136 = !DILocation(line: 568, column: 8, scope: !1137)
!1137 = distinct !DILexicalBlock(scope: !1138, file: !22, line: 568, column: 8)
!1138 = distinct !DILexicalBlock(scope: !1127, file: !22, line: 566, column: 70)
!1139 = !DILocation(line: 568, column: 20, scope: !1137)
!1140 = !DILocation(line: 569, column: 5, scope: !1137)
!1141 = !DILocation(line: 571, column: 19, scope: !1137)
!1142 = !DILocation(line: 571, column: 17, scope: !1137)
!1143 = !DILocation(line: 572, column: 3, scope: !1138)
!1144 = !DILocation(line: 573, column: 2, scope: !1112)
!1145 = !DILocation(line: 558, column: 38, scope: !1107)
!1146 = !DILocation(line: 558, column: 2, scope: !1107)
!1147 = distinct !{!1147, !1110, !1148, !458}
!1148 = !DILocation(line: 573, column: 2, scope: !1104)
!1149 = !DILocation(line: 576, column: 6, scope: !1150)
!1150 = distinct !DILexicalBlock(scope: !1094, file: !22, line: 576, column: 6)
!1151 = !DILocation(line: 576, column: 22, scope: !1150)
!1152 = !DILocation(line: 578, column: 3, scope: !1153)
!1153 = distinct !DILexicalBlock(scope: !1150, file: !22, line: 577, column: 2)
!1154 = !DILocation(line: 581, column: 27, scope: !1153)
!1155 = !DILocation(line: 582, column: 35, scope: !1153)
!1156 = !DILocation(line: 583, column: 33, scope: !1153)
!1157 = !DILocation(line: 585, column: 30, scope: !1153)
!1158 = !DILocation(line: 586, column: 3, scope: !1153)
!1159 = !DILocation(line: 590, column: 8, scope: !1160)
!1160 = distinct !DILexicalBlock(scope: !1094, file: !22, line: 590, column: 7)
!1161 = !DILocation(line: 590, column: 20, scope: !1160)
!1162 = !DILocation(line: 590, column: 27, scope: !1160)
!1163 = !DILocation(line: 590, column: 33, scope: !1160)
!1164 = !DILocation(line: 590, column: 43, scope: !1160)
!1165 = !DILocation(line: 590, column: 32, scope: !1160)
!1166 = !DILocation(line: 590, column: 55, scope: !1160)
!1167 = !DILocation(line: 590, column: 60, scope: !1160)
!1168 = !DILocation(line: 590, column: 70, scope: !1160)
!1169 = !DILocation(line: 590, column: 59, scope: !1160)
!1170 = !DILocation(line: 591, column: 7, scope: !1171)
!1171 = distinct !DILexicalBlock(scope: !1172, file: !22, line: 591, column: 7)
!1172 = distinct !DILexicalBlock(scope: !1160, file: !22, line: 590, column: 92)
!1173 = !DILocation(line: 591, column: 23, scope: !1171)
!1174 = !DILocation(line: 593, column: 12, scope: !1175)
!1175 = distinct !DILexicalBlock(scope: !1171, file: !22, line: 591, column: 30)
!1176 = !DILocation(line: 593, column: 4, scope: !1175)
!1177 = !DILocation(line: 593, column: 29, scope: !1175)
!1178 = !DILocation(line: 593, column: 34, scope: !1175)
!1179 = !DILocation(line: 594, column: 12, scope: !1175)
!1180 = !DILocation(line: 594, column: 4, scope: !1175)
!1181 = !DILocation(line: 594, column: 29, scope: !1175)
!1182 = !DILocation(line: 594, column: 41, scope: !1175)
!1183 = !DILocation(line: 595, column: 27, scope: !1175)
!1184 = !DILocation(line: 596, column: 3, scope: !1175)
!1185 = !DILocation(line: 597, column: 2, scope: !1172)
!1186 = !DILocation(line: 599, column: 19, scope: !1187)
!1187 = distinct !DILexicalBlock(scope: !1160, file: !22, line: 597, column: 9)
!1188 = !DILocation(line: 599, column: 11, scope: !1187)
!1189 = !DILocation(line: 599, column: 8, scope: !1187)
!1190 = !DILocation(line: 600, column: 32, scope: !1187)
!1191 = !DILocation(line: 600, column: 38, scope: !1187)
!1192 = !DILocation(line: 600, column: 23, scope: !1187)
!1193 = !DILocation(line: 600, column: 42, scope: !1187)
!1194 = !DILocation(line: 600, column: 21, scope: !1187)
!1195 = !DILocation(line: 601, column: 9, scope: !1196)
!1196 = distinct !DILexicalBlock(scope: !1187, file: !22, line: 601, column: 3)
!1197 = !DILocation(line: 601, column: 8, scope: !1196)
!1198 = !DILocation(line: 601, column: 13, scope: !1199)
!1199 = distinct !DILexicalBlock(scope: !1196, file: !22, line: 601, column: 3)
!1200 = !DILocation(line: 601, column: 15, scope: !1199)
!1201 = !DILocation(line: 601, column: 14, scope: !1199)
!1202 = !DILocation(line: 601, column: 3, scope: !1196)
!1203 = !DILocation(line: 602, column: 39, scope: !1199)
!1204 = !DILocation(line: 602, column: 31, scope: !1199)
!1205 = !DILocation(line: 602, column: 52, scope: !1199)
!1206 = !DILocation(line: 602, column: 44, scope: !1199)
!1207 = !DILocation(line: 602, column: 56, scope: !1199)
!1208 = !DILocation(line: 602, column: 62, scope: !1199)
!1209 = !DILocation(line: 602, column: 4, scope: !1199)
!1210 = !DILocation(line: 601, column: 35, scope: !1199)
!1211 = !DILocation(line: 601, column: 3, scope: !1199)
!1212 = distinct !{!1212, !1202, !1213, !458}
!1213 = !DILocation(line: 602, column: 63, scope: !1196)
!1214 = !DILocation(line: 603, column: 26, scope: !1187)
!1215 = !DILocation(line: 605, column: 7, scope: !1216)
!1216 = distinct !DILexicalBlock(scope: !1187, file: !22, line: 605, column: 7)
!1217 = !DILocation(line: 605, column: 24, scope: !1216)
!1218 = !DILocation(line: 607, column: 8, scope: !1219)
!1219 = distinct !DILexicalBlock(scope: !1220, file: !22, line: 607, column: 8)
!1220 = distinct !DILexicalBlock(scope: !1216, file: !22, line: 605, column: 31)
!1221 = !DILocation(line: 607, column: 26, scope: !1219)
!1222 = !DILocation(line: 608, column: 47, scope: !1219)
!1223 = !DILocation(line: 608, column: 45, scope: !1219)
!1224 = !DILocation(line: 608, column: 30, scope: !1219)
!1225 = !DILocation(line: 608, column: 5, scope: !1219)
!1226 = !DILocation(line: 608, column: 11, scope: !1219)
!1227 = !DILocation(line: 608, column: 19, scope: !1219)
!1228 = !DILocation(line: 610, column: 32, scope: !1219)
!1229 = !DILocation(line: 610, column: 49, scope: !1219)
!1230 = !DILocation(line: 610, column: 54, scope: !1219)
!1231 = !DILocation(line: 610, column: 30, scope: !1219)
!1232 = !DILocation(line: 610, column: 5, scope: !1219)
!1233 = !DILocation(line: 610, column: 11, scope: !1219)
!1234 = !DILocation(line: 610, column: 19, scope: !1219)
!1235 = !DILocation(line: 611, column: 3, scope: !1220)
!1236 = !DILocation(line: 613, column: 24, scope: !1237)
!1237 = distinct !DILexicalBlock(scope: !1216, file: !22, line: 612, column: 8)
!1238 = !DILocation(line: 613, column: 20, scope: !1237)
!1239 = !DILocation(line: 613, column: 4, scope: !1237)
!1240 = !DILocation(line: 613, column: 10, scope: !1237)
!1241 = !DILocation(line: 613, column: 18, scope: !1237)
!1242 = !DILocation(line: 619, column: 26, scope: !1094)
!1243 = !DILocation(line: 620, column: 34, scope: !1094)
!1244 = !DILocation(line: 621, column: 32, scope: !1094)
!1245 = !DILocation(line: 623, column: 29, scope: !1094)
!1246 = !DILocation(line: 624, column: 1, scope: !1094)
!1247 = distinct !DISubprogram(name: "special_reactor_stuff", linkageName: "_Z21special_reactor_stuffv", scope: !22, file: !22, line: 626, type: !468, scopeLine: 627, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2)
!1248 = !DILocation(line: 628, column: 2, scope: !1247)
!1249 = !DILocation(line: 629, column: 6, scope: !1250)
!1250 = distinct !DILexicalBlock(scope: !1247, file: !22, line: 629, column: 6)
!1251 = !DILocation(line: 630, column: 26, scope: !1252)
!1252 = distinct !DILexicalBlock(scope: !1250, file: !22, line: 629, column: 32)
!1253 = !DILocation(line: 630, column: 70, scope: !1252)
!1254 = !DILocation(line: 630, column: 69, scope: !1252)
!1255 = !DILocation(line: 630, column: 88, scope: !1252)
!1256 = !DILocation(line: 630, column: 87, scope: !1252)
!1257 = !DILocation(line: 630, column: 122, scope: !1252)
!1258 = !DILocation(line: 630, column: 61, scope: !1252)
!1259 = !DILocation(line: 630, column: 22, scope: !1252)
!1260 = !DILocation(line: 630, column: 19, scope: !1252)
!1261 = !DILocation(line: 631, column: 30, scope: !1252)
!1262 = !DILocation(line: 631, column: 26, scope: !1252)
!1263 = !DILocation(line: 631, column: 46, scope: !1252)
!1264 = !DILocation(line: 631, column: 24, scope: !1252)
!1265 = !DILocation(line: 632, column: 2, scope: !1252)
!1266 = !DILocation(line: 633, column: 1, scope: !1247)
!1267 = distinct !DISubprogram(name: "read_reactor_triggers", linkageName: "_Z21read_reactor_triggersP23control_center_triggersP7__sFILE", scope: !22, file: !22, line: 637, type: !1268, scopeLine: 638, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !365)
!1268 = !DISubroutineType(types: !1269)
!1269 = !{null, !1270, !1271}
!1270 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!1271 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1272, size: 64)
!1272 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !1273, line: 162, baseType: !1274)
!1273 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "d91ebd7d161d9196cc100822ef0e5cdf")
!1274 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILE", file: !1273, line: 131, size: 1216, flags: DIFlagTypePassByValue, elements: !1275, identifier: "_ZTS7__sFILE")
!1275 = !{!1276, !1278, !1279, !1280, !1281, !1282, !1287, !1288, !1290, !1294, !1299, !1307, !1312, !1313, !1316, !1317, !1321, !1323, !1324, !1325}
!1276 = !DIDerivedType(tag: DW_TAG_member, name: "_p", scope: !1274, file: !1273, line: 132, baseType: !1277, size: 64)
!1277 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !153, size: 64)
!1278 = !DIDerivedType(tag: DW_TAG_member, name: "_r", scope: !1274, file: !1273, line: 133, baseType: !7, size: 32, offset: 64)
!1279 = !DIDerivedType(tag: DW_TAG_member, name: "_w", scope: !1274, file: !1273, line: 134, baseType: !7, size: 32, offset: 96)
!1280 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !1274, file: !1273, line: 135, baseType: !30, size: 16, offset: 128)
!1281 = !DIDerivedType(tag: DW_TAG_member, name: "_file", scope: !1274, file: !1273, line: 136, baseType: !30, size: 16, offset: 144)
!1282 = !DIDerivedType(tag: DW_TAG_member, name: "_bf", scope: !1274, file: !1273, line: 137, baseType: !1283, size: 128, offset: 192)
!1283 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sbuf", file: !1273, line: 97, size: 128, flags: DIFlagTypePassByValue, elements: !1284, identifier: "_ZTS6__sbuf")
!1284 = !{!1285, !1286}
!1285 = !DIDerivedType(tag: DW_TAG_member, name: "_base", scope: !1283, file: !1273, line: 98, baseType: !1277, size: 64)
!1286 = !DIDerivedType(tag: DW_TAG_member, name: "_size", scope: !1283, file: !1273, line: 99, baseType: !7, size: 32, offset: 64)
!1287 = !DIDerivedType(tag: DW_TAG_member, name: "_lbfsize", scope: !1274, file: !1273, line: 138, baseType: !7, size: 32, offset: 320)
!1288 = !DIDerivedType(tag: DW_TAG_member, name: "_cookie", scope: !1274, file: !1273, line: 141, baseType: !1289, size: 64, offset: 384)
!1289 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!1290 = !DIDerivedType(tag: DW_TAG_member, name: "_close", scope: !1274, file: !1273, line: 142, baseType: !1291, size: 64, offset: 448)
!1291 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1292, size: 64)
!1292 = !DISubroutineType(types: !1293)
!1293 = !{!7, !1289}
!1294 = !DIDerivedType(tag: DW_TAG_member, name: "_read", scope: !1274, file: !1273, line: 143, baseType: !1295, size: 64, offset: 512)
!1295 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1296, size: 64)
!1296 = !DISubroutineType(types: !1297)
!1297 = !{!7, !1289, !1298, !7}
!1298 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!1299 = !DIDerivedType(tag: DW_TAG_member, name: "_seek", scope: !1274, file: !1273, line: 144, baseType: !1300, size: 64, offset: 576)
!1300 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1301, size: 64)
!1301 = !DISubroutineType(types: !1302)
!1302 = !{!1303, !1289, !1303, !7}
!1303 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !1273, line: 86, baseType: !1304)
!1304 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_off_t", file: !1305, line: 83, baseType: !1306)
!1305 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "af82ff6119a9fa80fad635d276556d46")
!1306 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !203, line: 37, baseType: !14)
!1307 = !DIDerivedType(tag: DW_TAG_member, name: "_write", scope: !1274, file: !1273, line: 145, baseType: !1308, size: 64, offset: 640)
!1308 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1309, size: 64)
!1309 = !DISubroutineType(types: !1310)
!1310 = !{!7, !1289, !1311, !7}
!1311 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!1312 = !DIDerivedType(tag: DW_TAG_member, name: "_ub", scope: !1274, file: !1273, line: 148, baseType: !1283, size: 128, offset: 704)
!1313 = !DIDerivedType(tag: DW_TAG_member, name: "_extra", scope: !1274, file: !1273, line: 149, baseType: !1314, size: 64, offset: 832)
!1314 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1315, size: 64)
!1315 = !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILEX", file: !1273, line: 103, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS8__sFILEX")
!1316 = !DIDerivedType(tag: DW_TAG_member, name: "_ur", scope: !1274, file: !1273, line: 150, baseType: !7, size: 32, offset: 896)
!1317 = !DIDerivedType(tag: DW_TAG_member, name: "_ubuf", scope: !1274, file: !1273, line: 153, baseType: !1318, size: 24, offset: 928)
!1318 = !DICompositeType(tag: DW_TAG_array_type, baseType: !153, size: 24, elements: !1319)
!1319 = !{!1320}
!1320 = !DISubrange(count: 3)
!1321 = !DIDerivedType(tag: DW_TAG_member, name: "_nbuf", scope: !1274, file: !1273, line: 154, baseType: !1322, size: 8, offset: 952)
!1322 = !DICompositeType(tag: DW_TAG_array_type, baseType: !153, size: 8, elements: !109)
!1323 = !DIDerivedType(tag: DW_TAG_member, name: "_lb", scope: !1274, file: !1273, line: 157, baseType: !1283, size: 128, offset: 960)
!1324 = !DIDerivedType(tag: DW_TAG_member, name: "_blksize", scope: !1274, file: !1273, line: 160, baseType: !7, size: 32, offset: 1088)
!1325 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !1274, file: !1273, line: 161, baseType: !1303, size: 64, offset: 1152)
!1326 = !DILocalVariable(name: "trigger", arg: 1, scope: !1267, file: !22, line: 637, type: !1270)
!1327 = !DILocation(line: 637, column: 53, scope: !1267)
!1328 = !DILocalVariable(name: "fp", arg: 2, scope: !1267, file: !22, line: 637, type: !1271)
!1329 = !DILocation(line: 637, column: 68, scope: !1267)
!1330 = !DILocalVariable(name: "i", scope: !1267, file: !22, line: 639, type: !7)
!1331 = !DILocation(line: 639, column: 6, scope: !1267)
!1332 = !DILocation(line: 641, column: 39, scope: !1267)
!1333 = !DILocation(line: 641, column: 23, scope: !1267)
!1334 = !DILocation(line: 641, column: 2, scope: !1267)
!1335 = !DILocation(line: 641, column: 11, scope: !1267)
!1336 = !DILocation(line: 641, column: 21, scope: !1267)
!1337 = !DILocation(line: 642, column: 9, scope: !1338)
!1338 = distinct !DILexicalBlock(scope: !1267, file: !22, line: 642, column: 2)
!1339 = !DILocation(line: 642, column: 7, scope: !1338)
!1340 = !DILocation(line: 642, column: 14, scope: !1341)
!1341 = distinct !DILexicalBlock(scope: !1338, file: !22, line: 642, column: 2)
!1342 = !DILocation(line: 642, column: 16, scope: !1341)
!1343 = !DILocation(line: 642, column: 2, scope: !1338)
!1344 = !DILocation(line: 643, column: 37, scope: !1341)
!1345 = !DILocation(line: 643, column: 21, scope: !1341)
!1346 = !DILocation(line: 643, column: 3, scope: !1341)
!1347 = !DILocation(line: 643, column: 12, scope: !1341)
!1348 = !DILocation(line: 643, column: 16, scope: !1341)
!1349 = !DILocation(line: 643, column: 19, scope: !1341)
!1350 = !DILocation(line: 642, column: 41, scope: !1341)
!1351 = !DILocation(line: 642, column: 2, scope: !1341)
!1352 = distinct !{!1352, !1343, !1353, !458}
!1353 = !DILocation(line: 643, column: 39, scope: !1338)
!1354 = !DILocation(line: 644, column: 9, scope: !1355)
!1355 = distinct !DILexicalBlock(scope: !1267, file: !22, line: 644, column: 2)
!1356 = !DILocation(line: 644, column: 7, scope: !1355)
!1357 = !DILocation(line: 644, column: 14, scope: !1358)
!1358 = distinct !DILexicalBlock(scope: !1355, file: !22, line: 644, column: 2)
!1359 = !DILocation(line: 644, column: 16, scope: !1358)
!1360 = !DILocation(line: 644, column: 2, scope: !1355)
!1361 = !DILocation(line: 645, column: 38, scope: !1358)
!1362 = !DILocation(line: 645, column: 22, scope: !1358)
!1363 = !DILocation(line: 645, column: 3, scope: !1358)
!1364 = !DILocation(line: 645, column: 12, scope: !1358)
!1365 = !DILocation(line: 645, column: 17, scope: !1358)
!1366 = !DILocation(line: 645, column: 20, scope: !1358)
!1367 = !DILocation(line: 644, column: 41, scope: !1358)
!1368 = !DILocation(line: 644, column: 2, scope: !1358)
!1369 = distinct !{!1369, !1360, !1370, !458}
!1370 = !DILocation(line: 645, column: 40, scope: !1355)
!1371 = !DILocation(line: 646, column: 1, scope: !1267)
!1372 = distinct !DISubprogram(name: "write_reactor_triggers", linkageName: "_Z22write_reactor_triggersP23control_center_triggersP7__sFILE", scope: !22, file: !22, line: 648, type: !1268, scopeLine: 649, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !365)
!1373 = !DILocalVariable(name: "trigger", arg: 1, scope: !1372, file: !22, line: 648, type: !1270)
!1374 = !DILocation(line: 648, column: 54, scope: !1372)
!1375 = !DILocalVariable(name: "fp", arg: 2, scope: !1372, file: !22, line: 648, type: !1271)
!1376 = !DILocation(line: 648, column: 69, scope: !1372)
!1377 = !DILocalVariable(name: "i", scope: !1372, file: !22, line: 650, type: !7)
!1378 = !DILocation(line: 650, column: 6, scope: !1372)
!1379 = !DILocation(line: 652, column: 19, scope: !1372)
!1380 = !DILocation(line: 652, column: 23, scope: !1372)
!1381 = !DILocation(line: 652, column: 32, scope: !1372)
!1382 = !DILocation(line: 652, column: 2, scope: !1372)
!1383 = !DILocation(line: 653, column: 9, scope: !1384)
!1384 = distinct !DILexicalBlock(scope: !1372, file: !22, line: 653, column: 2)
!1385 = !DILocation(line: 653, column: 7, scope: !1384)
!1386 = !DILocation(line: 653, column: 14, scope: !1387)
!1387 = distinct !DILexicalBlock(scope: !1384, file: !22, line: 653, column: 2)
!1388 = !DILocation(line: 653, column: 16, scope: !1387)
!1389 = !DILocation(line: 653, column: 2, scope: !1384)
!1390 = !DILocation(line: 654, column: 20, scope: !1387)
!1391 = !DILocation(line: 654, column: 24, scope: !1387)
!1392 = !DILocation(line: 654, column: 33, scope: !1387)
!1393 = !DILocation(line: 654, column: 37, scope: !1387)
!1394 = !DILocation(line: 654, column: 3, scope: !1387)
!1395 = !DILocation(line: 653, column: 41, scope: !1387)
!1396 = !DILocation(line: 653, column: 2, scope: !1387)
!1397 = distinct !{!1397, !1389, !1398, !458}
!1398 = !DILocation(line: 654, column: 39, scope: !1384)
!1399 = !DILocation(line: 655, column: 9, scope: !1400)
!1400 = distinct !DILexicalBlock(scope: !1372, file: !22, line: 655, column: 2)
!1401 = !DILocation(line: 655, column: 7, scope: !1400)
!1402 = !DILocation(line: 655, column: 14, scope: !1403)
!1403 = distinct !DILexicalBlock(scope: !1400, file: !22, line: 655, column: 2)
!1404 = !DILocation(line: 655, column: 16, scope: !1403)
!1405 = !DILocation(line: 655, column: 2, scope: !1400)
!1406 = !DILocation(line: 656, column: 20, scope: !1403)
!1407 = !DILocation(line: 656, column: 24, scope: !1403)
!1408 = !DILocation(line: 656, column: 33, scope: !1403)
!1409 = !DILocation(line: 656, column: 38, scope: !1403)
!1410 = !DILocation(line: 656, column: 3, scope: !1403)
!1411 = !DILocation(line: 655, column: 41, scope: !1403)
!1412 = !DILocation(line: 655, column: 2, scope: !1403)
!1413 = distinct !{!1413, !1405, !1414, !458}
!1414 = !DILocation(line: 656, column: 40, scope: !1400)
!1415 = !DILocation(line: 657, column: 1, scope: !1372)
