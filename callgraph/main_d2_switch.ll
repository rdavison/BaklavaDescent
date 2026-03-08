; ModuleID = '/Users/richard/code/ChocolateDescent/main_d2/switch.cpp'
source_filename = "/Users/richard/code/ChocolateDescent/main_d2/switch.cpp"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

%struct.trigger = type { i8, i8, i8, i8, i32, i32, [10 x i16], [10 x i16] }
%struct.segment = type { [6 x %struct.side], [6 x i16], [8 x i16], i32 }
%struct.side = type { i8, i8, i16, i16, i16, [4 x %struct.uvl], [2 x %struct.vms_vector] }
%struct.uvl = type { i32, i32, i32 }
%struct.vms_vector = type { i32, i32, i32 }
%struct.tmap_info = type { i8, [3 x i8], i32, i32, i16, i16, i16, i16 }
%struct.wall = type { i32, i32, i32, i32, i8, i8, i8, i8, i8, i8, i8, i8 }
%struct.player = type { [9 x i8], [4 x i8], i16, i8, i32, i32, i32, i32, i32, i32, i8, i8, i8, i8, i16, i16, i16, [10 x i16], [10 x i16], i16, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i16, i8, i8, i32, i8, i8 }
%struct.object = type { i32, i8, i8, i16, i16, i8, i8, i8, i8, i16, i16, %struct.vms_vector, %struct.vms_matrix, i32, i32, %struct.vms_vector, i8, i8, i8, i8, i32, %union.anon, %union.anon.0, %union.anon.1 }
%struct.vms_matrix = type { %struct.vms_vector, %struct.vms_vector, %struct.vms_vector }
%union.anon = type { %struct.physics_info }
%struct.physics_info = type { %struct.vms_vector, %struct.vms_vector, i32, i32, i32, %struct.vms_vector, %struct.vms_vector, i16, i16 }
%union.anon.0 = type { %struct.ai_static }
%struct.ai_static = type { i8, [11 x i8], i16, i16, i16, i8, i8, i16, i32, i32 }
%union.anon.1 = type { %struct.polyobj_info }
%struct.polyobj_info = type { i32, [10 x %struct.vms_angvec], i32, i32, i32 }
%struct.vms_angvec = type { i16, i16, i16 }
%struct.robot_info = type { i32, [8 x %struct.vms_vector], [8 x i8], i16, i16, i16, i16, i8, i8, i8, i8, i8, i8, i8, i8, i16, i8, i8, i32, i32, i32, i32, [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i8], [5 x i8], i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, [3 x i8], i8, i8, i8, i8, [9 x [5 x %struct.jointlist]], i32 }
%struct.jointlist = type { i16, i16 }

@Triggers = global [100 x %struct.trigger] zeroinitializer, align 4, !dbg !0
@Num_triggers = global i32 0, align 4, !dbg !15
@.str = private unnamed_addr constant [12 x i8] c"Door link!\0A\00", align 1, !dbg !18
@Segments = external global [0 x %struct.segment], align 4
@.str.1 = private unnamed_addr constant [35 x i8] c" trigger_num %d : seg %d, side %d\0A\00", align 1, !dbg !24
@.str.2 = private unnamed_addr constant [13 x i8] c"Door close!\0A\00", align 1, !dbg !29
@.str.3 = private unnamed_addr constant [14 x i8] c"Lighting on!\0A\00", align 1, !dbg !34
@TmapInfo = external global [1200 x %struct.tmap_info], align 4
@.str.4 = private unnamed_addr constant [15 x i8] c"Lighting off!\0A\00", align 1, !dbg !39
@.str.5 = private unnamed_addr constant [14 x i8] c"Door unlock!\0A\00", align 1, !dbg !44
@Walls = external global [254 x %struct.wall], align 4
@.str.6 = private unnamed_addr constant [44 x i8] c"Wall #%i is keyed to trigger #%i, link #%i\0A\00", align 1, !dbg !46
@Num_walls = external global i32, align 4
@.str.7 = private unnamed_addr constant [12 x i8] c"Door lock!\0A\00", align 1, !dbg !51
@.str.8 = private unnamed_addr constant [14 x i8] c"Wall remove!\0A\00", align 1, !dbg !53
@.str.9 = private unnamed_addr constant [12 x i8] c"cside != -1\00", align 1, !dbg !55
@.str.10 = private unnamed_addr constant [56 x i8] c"/Users/richard/code/ChocolateDescent/main_d2/switch.cpp\00", align 1, !dbg !57
@.str.11 = private unnamed_addr constant [11 x i8] c"Open wall\0A\00", align 1, !dbg !62
@.str.12 = private unnamed_addr constant [12 x i8] c"Close wall\0A\00", align 1, !dbg !67
@.str.13 = private unnamed_addr constant [15 x i8] c"Illusory wall\0A\00", align 1, !dbg !69
@Player_num = external global i32, align 4
@.str.14 = private unnamed_addr constant [2 x i8] c"s\00", align 1, !dbg !71
@.str.15 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1, !dbg !76
@.str.16 = private unnamed_addr constant [14 x i8] c"Matcen link!\0A\00", align 1, !dbg !81
@.str.17 = private unnamed_addr constant [26 x i8] c" trigger_num %d : seg %d\0A\00", align 1, !dbg !83
@.str.18 = private unnamed_addr constant [13 x i8] c"Illusion ON\0A\00", align 1, !dbg !88
@.str.19 = private unnamed_addr constant [14 x i8] c"Illusion OFF\0A\00", align 1, !dbg !90
@.str.20 = private unnamed_addr constant [28 x i8] c"trignum=%d type=%d shot=%d\0A\00", align 1, !dbg !92
@Current_level_num = external global i32, align 4
@.str.21 = private unnamed_addr constant [29 x i8] c"WOOHOO! (leaving the mine!)\0A\00", align 1, !dbg !97
@Players = external global [12 x %struct.player], align 4
@Player_is_dead = external global i32, align 4
@CurrentDataVersion = external global i32, align 4
@.str.22 = private unnamed_addr constant [51 x i8] c"Secret Level Teleporter disabled in Descent 2 Demo\00", align 1, !dbg !102
@Game_mode = external global i32, align 4
@.str.23 = private unnamed_addr constant [49 x i8] c"Secret Level Teleporter disabled in multiplayer!\00", align 1, !dbg !107
@Newdemo_state = external global i32, align 4
@.str.24 = private unnamed_addr constant [40 x i8] c"Secret Level destroyed.  Exit disabled.\00", align 1, !dbg !112
@.str.25 = private unnamed_addr constant [25 x i8] c"Exiting to secret level\0A\00", align 1, !dbg !117
@gr_palette = external global [768 x i8], align 1
@Control_center_destroyed = external global i32, align 4
@.str.26 = private unnamed_addr constant [2 x i8] c"D\00", align 1, !dbg !122
@.str.27 = private unnamed_addr constant [15 x i8] c"Door%s opened!\00", align 1, !dbg !124
@.str.28 = private unnamed_addr constant [15 x i8] c"Door%s closed!\00", align 1, !dbg !126
@.str.29 = private unnamed_addr constant [17 x i8] c"Door%s unlocked!\00", align 1, !dbg !128
@.str.30 = private unnamed_addr constant [15 x i8] c"Door%s locked!\00", align 1, !dbg !133
@.str.31 = private unnamed_addr constant [27 x i8] c"Force field%s deactivated!\00", align 1, !dbg !135
@.str.32 = private unnamed_addr constant [15 x i8] c"Wall%s opened!\00", align 1, !dbg !140
@.str.33 = private unnamed_addr constant [25 x i8] c"Force field%s activated!\00", align 1, !dbg !142
@.str.34 = private unnamed_addr constant [15 x i8] c"Wall%s closed!\00", align 1, !dbg !144
@.str.35 = private unnamed_addr constant [2 x i8] c"I\00", align 1, !dbg !146
@.str.36 = private unnamed_addr constant [15 x i8] c"Illusion%s on!\00", align 1, !dbg !148
@.str.37 = private unnamed_addr constant [2 x i8] c"i\00", align 1, !dbg !150
@.str.38 = private unnamed_addr constant [16 x i8] c"Illusion%s off!\00", align 1, !dbg !152
@.str.39 = private unnamed_addr constant [12 x i8] c"Lights off!\00", align 1, !dbg !157
@.str.40 = private unnamed_addr constant [11 x i8] c"Lights on!\00", align 1, !dbg !159
@Objects = external global [0 x %struct.object], align 4
@Robot_info = external global [0 x %struct.robot_info], align 4
@FrameTime = external global i32, align 4

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z7do_linka(i8 noundef signext %0) #0 !dbg !294 {
  %2 = alloca i8, align 1
  %3 = alloca i32, align 4
  store i8 %0, ptr %2, align 1
    #dbg_declare(ptr %2, !298, !DIExpression(), !299)
    #dbg_declare(ptr %3, !300, !DIExpression(), !301)
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str), !dbg !302
  %4 = load i8, ptr %2, align 1, !dbg !303
  %5 = sext i8 %4 to i32, !dbg !303
  %6 = icmp ne i32 %5, -1, !dbg !305
  br i1 %6, label %7, label %61, !dbg !305

7:                                                ; preds = %1
  store i32 0, ptr %3, align 4, !dbg !306
  br label %8, !dbg !309

8:                                                ; preds = %57, %7
  %9 = load i32, ptr %3, align 4, !dbg !310
  %10 = load i8, ptr %2, align 1, !dbg !312
  %11 = sext i8 %10 to i64, !dbg !313
  %12 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %11, !dbg !313
  %13 = getelementptr inbounds nuw %struct.trigger, ptr %12, i32 0, i32 2, !dbg !314
  %14 = load i8, ptr %13, align 2, !dbg !314
  %15 = sext i8 %14 to i32, !dbg !313
  %16 = icmp slt i32 %9, %15, !dbg !315
  br i1 %16, label %17, label %60, !dbg !316

17:                                               ; preds = %8
  %18 = load i8, ptr %2, align 1, !dbg !317
  %19 = sext i8 %18 to i64, !dbg !319
  %20 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %19, !dbg !319
  %21 = getelementptr inbounds nuw %struct.trigger, ptr %20, i32 0, i32 6, !dbg !320
  %22 = load i32, ptr %3, align 4, !dbg !321
  %23 = sext i32 %22 to i64, !dbg !319
  %24 = getelementptr inbounds [10 x i16], ptr %21, i64 0, i64 %23, !dbg !319
  %25 = load i16, ptr %24, align 2, !dbg !319
  %26 = sext i16 %25 to i64, !dbg !322
  %27 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %26, !dbg !322
  %28 = load i8, ptr %2, align 1, !dbg !323
  %29 = sext i8 %28 to i64, !dbg !324
  %30 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %29, !dbg !324
  %31 = getelementptr inbounds nuw %struct.trigger, ptr %30, i32 0, i32 7, !dbg !325
  %32 = load i32, ptr %3, align 4, !dbg !326
  %33 = sext i32 %32 to i64, !dbg !324
  %34 = getelementptr inbounds [10 x i16], ptr %31, i64 0, i64 %33, !dbg !324
  %35 = load i16, ptr %34, align 2, !dbg !324
  %36 = sext i16 %35 to i32, !dbg !324
  call void @_Z11wall_toggleP7segmenti(ptr noundef %27, i32 noundef %36), !dbg !327
  %37 = load i8, ptr %2, align 1, !dbg !328
  %38 = sext i8 %37 to i32, !dbg !328
  %39 = load i8, ptr %2, align 1, !dbg !328
  %40 = sext i8 %39 to i64, !dbg !328
  %41 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %40, !dbg !328
  %42 = getelementptr inbounds nuw %struct.trigger, ptr %41, i32 0, i32 6, !dbg !328
  %43 = load i32, ptr %3, align 4, !dbg !328
  %44 = sext i32 %43 to i64, !dbg !328
  %45 = getelementptr inbounds [10 x i16], ptr %42, i64 0, i64 %44, !dbg !328
  %46 = load i16, ptr %45, align 2, !dbg !328
  %47 = sext i16 %46 to i32, !dbg !328
  %48 = load i8, ptr %2, align 1, !dbg !328
  %49 = sext i8 %48 to i64, !dbg !328
  %50 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %49, !dbg !328
  %51 = getelementptr inbounds nuw %struct.trigger, ptr %50, i32 0, i32 7, !dbg !328
  %52 = load i32, ptr %3, align 4, !dbg !328
  %53 = sext i32 %52 to i64, !dbg !328
  %54 = getelementptr inbounds [10 x i16], ptr %51, i64 0, i64 %53, !dbg !328
  %55 = load i16, ptr %54, align 2, !dbg !328
  %56 = sext i16 %55 to i32, !dbg !328
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.1, i32 noundef %38, i32 noundef %47, i32 noundef %56), !dbg !328
  br label %57, !dbg !329

57:                                               ; preds = %17
  %58 = load i32, ptr %3, align 4, !dbg !330
  %59 = add nsw i32 %58, 1, !dbg !330
  store i32 %59, ptr %3, align 4, !dbg !330
  br label %8, !dbg !331, !llvm.loop !332

60:                                               ; preds = %8
  br label %61, !dbg !335

61:                                               ; preds = %60, %1
  ret void, !dbg !336
}

declare void @_Z8_mprintfiPKcz(i32 noundef, ptr noundef, ...) #1

declare void @_Z11wall_toggleP7segmenti(ptr noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z13do_close_doora(i8 noundef signext %0) #0 !dbg !337 {
  %2 = alloca i8, align 1
  %3 = alloca i32, align 4
  store i8 %0, ptr %2, align 1
    #dbg_declare(ptr %2, !338, !DIExpression(), !339)
    #dbg_declare(ptr %3, !340, !DIExpression(), !341)
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.2), !dbg !342
  %4 = load i8, ptr %2, align 1, !dbg !343
  %5 = sext i8 %4 to i32, !dbg !343
  %6 = icmp ne i32 %5, -1, !dbg !345
  br i1 %6, label %7, label %41, !dbg !345

7:                                                ; preds = %1
  store i32 0, ptr %3, align 4, !dbg !346
  br label %8, !dbg !349

8:                                                ; preds = %37, %7
  %9 = load i32, ptr %3, align 4, !dbg !350
  %10 = load i8, ptr %2, align 1, !dbg !352
  %11 = sext i8 %10 to i64, !dbg !353
  %12 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %11, !dbg !353
  %13 = getelementptr inbounds nuw %struct.trigger, ptr %12, i32 0, i32 2, !dbg !354
  %14 = load i8, ptr %13, align 2, !dbg !354
  %15 = sext i8 %14 to i32, !dbg !353
  %16 = icmp slt i32 %9, %15, !dbg !355
  br i1 %16, label %17, label %40, !dbg !356

17:                                               ; preds = %8
  %18 = load i8, ptr %2, align 1, !dbg !357
  %19 = sext i8 %18 to i64, !dbg !358
  %20 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %19, !dbg !358
  %21 = getelementptr inbounds nuw %struct.trigger, ptr %20, i32 0, i32 6, !dbg !359
  %22 = load i32, ptr %3, align 4, !dbg !360
  %23 = sext i32 %22 to i64, !dbg !358
  %24 = getelementptr inbounds [10 x i16], ptr %21, i64 0, i64 %23, !dbg !358
  %25 = load i16, ptr %24, align 2, !dbg !358
  %26 = sext i16 %25 to i64, !dbg !361
  %27 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %26, !dbg !361
  %28 = load i8, ptr %2, align 1, !dbg !362
  %29 = sext i8 %28 to i64, !dbg !363
  %30 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %29, !dbg !363
  %31 = getelementptr inbounds nuw %struct.trigger, ptr %30, i32 0, i32 7, !dbg !364
  %32 = load i32, ptr %3, align 4, !dbg !365
  %33 = sext i32 %32 to i64, !dbg !363
  %34 = getelementptr inbounds [10 x i16], ptr %31, i64 0, i64 %33, !dbg !363
  %35 = load i16, ptr %34, align 2, !dbg !363
  %36 = sext i16 %35 to i32, !dbg !363
  call void @_Z15wall_close_doorP7segmenti(ptr noundef %27, i32 noundef %36), !dbg !366
  br label %37, !dbg !366

37:                                               ; preds = %17
  %38 = load i32, ptr %3, align 4, !dbg !367
  %39 = add nsw i32 %38, 1, !dbg !367
  store i32 %39, ptr %3, align 4, !dbg !367
  br label %8, !dbg !368, !llvm.loop !369

40:                                               ; preds = %8
  br label %41, !dbg !371

41:                                               ; preds = %40, %1
  ret void, !dbg !372
}

declare void @_Z15wall_close_doorP7segmenti(ptr noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z11do_light_ona(i8 noundef signext %0) #0 !dbg !373 {
  %2 = alloca i8, align 1
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i8 %0, ptr %2, align 1
    #dbg_declare(ptr %2, !376, !DIExpression(), !377)
    #dbg_declare(ptr %3, !378, !DIExpression(), !379)
    #dbg_declare(ptr %4, !380, !DIExpression(), !381)
  store i32 0, ptr %4, align 4, !dbg !381
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.3), !dbg !382
  %7 = load i8, ptr %2, align 1, !dbg !383
  %8 = sext i8 %7 to i32, !dbg !383
  %9 = icmp ne i32 %8, -1, !dbg !385
  br i1 %9, label %10, label %68, !dbg !385

10:                                               ; preds = %1
  store i32 0, ptr %3, align 4, !dbg !386
  br label %11, !dbg !389

11:                                               ; preds = %64, %10
  %12 = load i32, ptr %3, align 4, !dbg !390
  %13 = load i8, ptr %2, align 1, !dbg !392
  %14 = sext i8 %13 to i64, !dbg !393
  %15 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %14, !dbg !393
  %16 = getelementptr inbounds nuw %struct.trigger, ptr %15, i32 0, i32 2, !dbg !394
  %17 = load i8, ptr %16, align 2, !dbg !394
  %18 = sext i8 %17 to i32, !dbg !393
  %19 = icmp slt i32 %12, %18, !dbg !395
  br i1 %19, label %20, label %67, !dbg !396

20:                                               ; preds = %11
    #dbg_declare(ptr %5, !397, !DIExpression(), !399)
    #dbg_declare(ptr %6, !400, !DIExpression(), !401)
  %21 = load i8, ptr %2, align 1, !dbg !402
  %22 = sext i8 %21 to i64, !dbg !403
  %23 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %22, !dbg !403
  %24 = getelementptr inbounds nuw %struct.trigger, ptr %23, i32 0, i32 6, !dbg !404
  %25 = load i32, ptr %3, align 4, !dbg !405
  %26 = sext i32 %25 to i64, !dbg !403
  %27 = getelementptr inbounds [10 x i16], ptr %24, i64 0, i64 %26, !dbg !403
  %28 = load i16, ptr %27, align 2, !dbg !403
  %29 = sext i16 %28 to i32, !dbg !403
  store i32 %29, ptr %5, align 4, !dbg !406
  %30 = load i8, ptr %2, align 1, !dbg !407
  %31 = sext i8 %30 to i64, !dbg !408
  %32 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %31, !dbg !408
  %33 = getelementptr inbounds nuw %struct.trigger, ptr %32, i32 0, i32 7, !dbg !409
  %34 = load i32, ptr %3, align 4, !dbg !410
  %35 = sext i32 %34 to i64, !dbg !408
  %36 = getelementptr inbounds [10 x i16], ptr %33, i64 0, i64 %35, !dbg !408
  %37 = load i16, ptr %36, align 2, !dbg !408
  %38 = sext i16 %37 to i32, !dbg !408
  store i32 %38, ptr %6, align 4, !dbg !411
  %39 = load i32, ptr %5, align 4, !dbg !412
  %40 = sext i32 %39 to i64, !dbg !414
  %41 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %40, !dbg !414
  %42 = getelementptr inbounds nuw %struct.segment, ptr %41, i32 0, i32 0, !dbg !415
  %43 = load i32, ptr %6, align 4, !dbg !416
  %44 = sext i32 %43 to i64, !dbg !414
  %45 = getelementptr inbounds [6 x %struct.side], ptr %42, i64 0, i64 %44, !dbg !414
  %46 = getelementptr inbounds nuw %struct.side, ptr %45, i32 0, i32 4, !dbg !417
  %47 = load i16, ptr %46, align 2, !dbg !417
  %48 = sext i16 %47 to i32, !dbg !414
  %49 = and i32 %48, 16383, !dbg !418
  %50 = sext i32 %49 to i64, !dbg !419
  %51 = getelementptr inbounds [1200 x %struct.tmap_info], ptr @TmapInfo, i64 0, i64 %50, !dbg !419
  %52 = getelementptr inbounds nuw %struct.tmap_info, ptr %51, i32 0, i32 2, !dbg !420
  %53 = load i32, ptr %52, align 4, !dbg !420
  %54 = icmp ne i32 %53, 0, !dbg !419
  br i1 %54, label %55, label %63, !dbg !419

55:                                               ; preds = %20
  %56 = load i32, ptr %5, align 4, !dbg !421
  %57 = load i32, ptr %6, align 4, !dbg !423
  %58 = call noundef i32 @_Z9add_lightii(i32 noundef %56, i32 noundef %57), !dbg !424
  %59 = load i32, ptr %4, align 4, !dbg !425
  %60 = or i32 %59, %58, !dbg !425
  store i32 %60, ptr %4, align 4, !dbg !425
  %61 = load i32, ptr %5, align 4, !dbg !426
  %62 = load i32, ptr %6, align 4, !dbg !427
  call void @_Z14enable_flickerii(i32 noundef %61, i32 noundef %62), !dbg !428
  br label %63, !dbg !429

63:                                               ; preds = %55, %20
  br label %64, !dbg !430

64:                                               ; preds = %63
  %65 = load i32, ptr %3, align 4, !dbg !431
  %66 = add nsw i32 %65, 1, !dbg !431
  store i32 %66, ptr %3, align 4, !dbg !431
  br label %11, !dbg !432, !llvm.loop !433

67:                                               ; preds = %11
  br label %68, !dbg !435

68:                                               ; preds = %67, %1
  %69 = load i32, ptr %4, align 4, !dbg !436
  ret i32 %69, !dbg !437
}

declare noundef i32 @_Z9add_lightii(i32 noundef, i32 noundef) #1

declare void @_Z14enable_flickerii(i32 noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z12do_light_offa(i8 noundef signext %0) #0 !dbg !438 {
  %2 = alloca i8, align 1
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i8 %0, ptr %2, align 1
    #dbg_declare(ptr %2, !439, !DIExpression(), !440)
    #dbg_declare(ptr %3, !441, !DIExpression(), !442)
    #dbg_declare(ptr %4, !443, !DIExpression(), !444)
  store i32 0, ptr %4, align 4, !dbg !444
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.4), !dbg !445
  %7 = load i8, ptr %2, align 1, !dbg !446
  %8 = sext i8 %7 to i32, !dbg !446
  %9 = icmp ne i32 %8, -1, !dbg !448
  br i1 %9, label %10, label %68, !dbg !448

10:                                               ; preds = %1
  store i32 0, ptr %3, align 4, !dbg !449
  br label %11, !dbg !452

11:                                               ; preds = %64, %10
  %12 = load i32, ptr %3, align 4, !dbg !453
  %13 = load i8, ptr %2, align 1, !dbg !455
  %14 = sext i8 %13 to i64, !dbg !456
  %15 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %14, !dbg !456
  %16 = getelementptr inbounds nuw %struct.trigger, ptr %15, i32 0, i32 2, !dbg !457
  %17 = load i8, ptr %16, align 2, !dbg !457
  %18 = sext i8 %17 to i32, !dbg !456
  %19 = icmp slt i32 %12, %18, !dbg !458
  br i1 %19, label %20, label %67, !dbg !459

20:                                               ; preds = %11
    #dbg_declare(ptr %5, !460, !DIExpression(), !462)
    #dbg_declare(ptr %6, !463, !DIExpression(), !464)
  %21 = load i8, ptr %2, align 1, !dbg !465
  %22 = sext i8 %21 to i64, !dbg !466
  %23 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %22, !dbg !466
  %24 = getelementptr inbounds nuw %struct.trigger, ptr %23, i32 0, i32 6, !dbg !467
  %25 = load i32, ptr %3, align 4, !dbg !468
  %26 = sext i32 %25 to i64, !dbg !466
  %27 = getelementptr inbounds [10 x i16], ptr %24, i64 0, i64 %26, !dbg !466
  %28 = load i16, ptr %27, align 2, !dbg !466
  %29 = sext i16 %28 to i32, !dbg !466
  store i32 %29, ptr %5, align 4, !dbg !469
  %30 = load i8, ptr %2, align 1, !dbg !470
  %31 = sext i8 %30 to i64, !dbg !471
  %32 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %31, !dbg !471
  %33 = getelementptr inbounds nuw %struct.trigger, ptr %32, i32 0, i32 7, !dbg !472
  %34 = load i32, ptr %3, align 4, !dbg !473
  %35 = sext i32 %34 to i64, !dbg !471
  %36 = getelementptr inbounds [10 x i16], ptr %33, i64 0, i64 %35, !dbg !471
  %37 = load i16, ptr %36, align 2, !dbg !471
  %38 = sext i16 %37 to i32, !dbg !471
  store i32 %38, ptr %6, align 4, !dbg !474
  %39 = load i32, ptr %5, align 4, !dbg !475
  %40 = sext i32 %39 to i64, !dbg !477
  %41 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %40, !dbg !477
  %42 = getelementptr inbounds nuw %struct.segment, ptr %41, i32 0, i32 0, !dbg !478
  %43 = load i32, ptr %6, align 4, !dbg !479
  %44 = sext i32 %43 to i64, !dbg !477
  %45 = getelementptr inbounds [6 x %struct.side], ptr %42, i64 0, i64 %44, !dbg !477
  %46 = getelementptr inbounds nuw %struct.side, ptr %45, i32 0, i32 4, !dbg !480
  %47 = load i16, ptr %46, align 2, !dbg !480
  %48 = sext i16 %47 to i32, !dbg !477
  %49 = and i32 %48, 16383, !dbg !481
  %50 = sext i32 %49 to i64, !dbg !482
  %51 = getelementptr inbounds [1200 x %struct.tmap_info], ptr @TmapInfo, i64 0, i64 %50, !dbg !482
  %52 = getelementptr inbounds nuw %struct.tmap_info, ptr %51, i32 0, i32 2, !dbg !483
  %53 = load i32, ptr %52, align 4, !dbg !483
  %54 = icmp ne i32 %53, 0, !dbg !482
  br i1 %54, label %55, label %63, !dbg !482

55:                                               ; preds = %20
  %56 = load i32, ptr %5, align 4, !dbg !484
  %57 = load i32, ptr %6, align 4, !dbg !486
  %58 = call noundef i32 @_Z14subtract_lightii(i32 noundef %56, i32 noundef %57), !dbg !487
  %59 = load i32, ptr %4, align 4, !dbg !488
  %60 = or i32 %59, %58, !dbg !488
  store i32 %60, ptr %4, align 4, !dbg !488
  %61 = load i32, ptr %5, align 4, !dbg !489
  %62 = load i32, ptr %6, align 4, !dbg !490
  call void @_Z15disable_flickerii(i32 noundef %61, i32 noundef %62), !dbg !491
  br label %63, !dbg !492

63:                                               ; preds = %55, %20
  br label %64, !dbg !493

64:                                               ; preds = %63
  %65 = load i32, ptr %3, align 4, !dbg !494
  %66 = add nsw i32 %65, 1, !dbg !494
  store i32 %66, ptr %3, align 4, !dbg !494
  br label %11, !dbg !495, !llvm.loop !496

67:                                               ; preds = %11
  br label %68, !dbg !498

68:                                               ; preds = %67, %1
  %69 = load i32, ptr %4, align 4, !dbg !499
  ret i32 %69, !dbg !500
}

declare noundef i32 @_Z14subtract_lightii(i32 noundef, i32 noundef) #1

declare void @_Z15disable_flickerii(i32 noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z15do_unlock_doorsa(i8 noundef signext %0) #0 !dbg !501 {
  %2 = alloca i8, align 1
  %3 = alloca i32, align 4
  store i8 %0, ptr %2, align 1
    #dbg_declare(ptr %2, !502, !DIExpression(), !503)
    #dbg_declare(ptr %3, !504, !DIExpression(), !505)
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.5), !dbg !506
  %4 = load i8, ptr %2, align 1, !dbg !507
  %5 = sext i8 %4 to i32, !dbg !507
  %6 = icmp ne i32 %5, -1, !dbg !509
  br i1 %6, label %7, label %78, !dbg !509

7:                                                ; preds = %1
  store i32 0, ptr %3, align 4, !dbg !510
  br label %8, !dbg !513

8:                                                ; preds = %74, %7
  %9 = load i32, ptr %3, align 4, !dbg !514
  %10 = load i8, ptr %2, align 1, !dbg !516
  %11 = sext i8 %10 to i64, !dbg !517
  %12 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %11, !dbg !517
  %13 = getelementptr inbounds nuw %struct.trigger, ptr %12, i32 0, i32 2, !dbg !518
  %14 = load i8, ptr %13, align 2, !dbg !518
  %15 = sext i8 %14 to i32, !dbg !517
  %16 = icmp slt i32 %9, %15, !dbg !519
  br i1 %16, label %17, label %77, !dbg !520

17:                                               ; preds = %8
  %18 = load i8, ptr %2, align 1, !dbg !521
  %19 = sext i8 %18 to i64, !dbg !523
  %20 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %19, !dbg !523
  %21 = getelementptr inbounds nuw %struct.trigger, ptr %20, i32 0, i32 6, !dbg !524
  %22 = load i32, ptr %3, align 4, !dbg !525
  %23 = sext i32 %22 to i64, !dbg !523
  %24 = getelementptr inbounds [10 x i16], ptr %21, i64 0, i64 %23, !dbg !523
  %25 = load i16, ptr %24, align 2, !dbg !523
  %26 = sext i16 %25 to i64, !dbg !526
  %27 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %26, !dbg !526
  %28 = getelementptr inbounds nuw %struct.segment, ptr %27, i32 0, i32 0, !dbg !527
  %29 = load i8, ptr %2, align 1, !dbg !528
  %30 = sext i8 %29 to i64, !dbg !529
  %31 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %30, !dbg !529
  %32 = getelementptr inbounds nuw %struct.trigger, ptr %31, i32 0, i32 7, !dbg !530
  %33 = load i32, ptr %3, align 4, !dbg !531
  %34 = sext i32 %33 to i64, !dbg !529
  %35 = getelementptr inbounds [10 x i16], ptr %32, i64 0, i64 %34, !dbg !529
  %36 = load i16, ptr %35, align 2, !dbg !529
  %37 = sext i16 %36 to i64, !dbg !526
  %38 = getelementptr inbounds [6 x %struct.side], ptr %28, i64 0, i64 %37, !dbg !526
  %39 = getelementptr inbounds nuw %struct.side, ptr %38, i32 0, i32 2, !dbg !532
  %40 = load i16, ptr %39, align 2, !dbg !532
  %41 = sext i16 %40 to i64, !dbg !533
  %42 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %41, !dbg !533
  %43 = getelementptr inbounds nuw %struct.wall, ptr %42, i32 0, i32 5, !dbg !534
  %44 = load i8, ptr %43, align 1, !dbg !535
  %45 = zext i8 %44 to i32, !dbg !535
  %46 = and i32 %45, -9, !dbg !535
  %47 = trunc i32 %46 to i8, !dbg !535
  store i8 %47, ptr %43, align 1, !dbg !535
  %48 = load i8, ptr %2, align 1, !dbg !536
  %49 = sext i8 %48 to i64, !dbg !537
  %50 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %49, !dbg !537
  %51 = getelementptr inbounds nuw %struct.trigger, ptr %50, i32 0, i32 6, !dbg !538
  %52 = load i32, ptr %3, align 4, !dbg !539
  %53 = sext i32 %52 to i64, !dbg !537
  %54 = getelementptr inbounds [10 x i16], ptr %51, i64 0, i64 %53, !dbg !537
  %55 = load i16, ptr %54, align 2, !dbg !537
  %56 = sext i16 %55 to i64, !dbg !540
  %57 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %56, !dbg !540
  %58 = getelementptr inbounds nuw %struct.segment, ptr %57, i32 0, i32 0, !dbg !541
  %59 = load i8, ptr %2, align 1, !dbg !542
  %60 = sext i8 %59 to i64, !dbg !543
  %61 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %60, !dbg !543
  %62 = getelementptr inbounds nuw %struct.trigger, ptr %61, i32 0, i32 7, !dbg !544
  %63 = load i32, ptr %3, align 4, !dbg !545
  %64 = sext i32 %63 to i64, !dbg !543
  %65 = getelementptr inbounds [10 x i16], ptr %62, i64 0, i64 %64, !dbg !543
  %66 = load i16, ptr %65, align 2, !dbg !543
  %67 = sext i16 %66 to i64, !dbg !540
  %68 = getelementptr inbounds [6 x %struct.side], ptr %58, i64 0, i64 %67, !dbg !540
  %69 = getelementptr inbounds nuw %struct.side, ptr %68, i32 0, i32 2, !dbg !546
  %70 = load i16, ptr %69, align 2, !dbg !546
  %71 = sext i16 %70 to i64, !dbg !547
  %72 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %71, !dbg !547
  %73 = getelementptr inbounds nuw %struct.wall, ptr %72, i32 0, i32 9, !dbg !548
  store i8 1, ptr %73, align 1, !dbg !549
  br label %74, !dbg !550

74:                                               ; preds = %17
  %75 = load i32, ptr %3, align 4, !dbg !551
  %76 = add nsw i32 %75, 1, !dbg !551
  store i32 %76, ptr %3, align 4, !dbg !551
  br label %8, !dbg !552, !llvm.loop !553

77:                                               ; preds = %8
  br label %78, !dbg !555

78:                                               ; preds = %77, %1
  ret void, !dbg !556
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z21door_is_wall_switchedi(i32 noundef %0) #0 !dbg !557 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !560, !DIExpression(), !561)
    #dbg_declare(ptr %4, !562, !DIExpression(), !563)
    #dbg_declare(ptr %5, !564, !DIExpression(), !565)
  store i32 0, ptr %5, align 4, !dbg !566
  br label %6, !dbg !568

6:                                                ; preds = %57, %1
  %7 = load i32, ptr %5, align 4, !dbg !569
  %8 = load i32, ptr @Num_triggers, align 4, !dbg !571
  %9 = icmp slt i32 %7, %8, !dbg !572
  br i1 %9, label %10, label %60, !dbg !573

10:                                               ; preds = %6
  store i32 0, ptr %4, align 4, !dbg !574
  br label %11, !dbg !577

11:                                               ; preds = %53, %10
  %12 = load i32, ptr %4, align 4, !dbg !578
  %13 = load i32, ptr %5, align 4, !dbg !580
  %14 = sext i32 %13 to i64, !dbg !581
  %15 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %14, !dbg !581
  %16 = getelementptr inbounds nuw %struct.trigger, ptr %15, i32 0, i32 2, !dbg !582
  %17 = load i8, ptr %16, align 2, !dbg !582
  %18 = sext i8 %17 to i32, !dbg !581
  %19 = icmp slt i32 %12, %18, !dbg !583
  br i1 %19, label %20, label %56, !dbg !584

20:                                               ; preds = %11
  %21 = load i32, ptr %5, align 4, !dbg !585
  %22 = sext i32 %21 to i64, !dbg !588
  %23 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %22, !dbg !588
  %24 = getelementptr inbounds nuw %struct.trigger, ptr %23, i32 0, i32 6, !dbg !589
  %25 = load i32, ptr %4, align 4, !dbg !590
  %26 = sext i32 %25 to i64, !dbg !588
  %27 = getelementptr inbounds [10 x i16], ptr %24, i64 0, i64 %26, !dbg !588
  %28 = load i16, ptr %27, align 2, !dbg !588
  %29 = sext i16 %28 to i64, !dbg !591
  %30 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %29, !dbg !591
  %31 = getelementptr inbounds nuw %struct.segment, ptr %30, i32 0, i32 0, !dbg !592
  %32 = load i32, ptr %5, align 4, !dbg !593
  %33 = sext i32 %32 to i64, !dbg !594
  %34 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %33, !dbg !594
  %35 = getelementptr inbounds nuw %struct.trigger, ptr %34, i32 0, i32 7, !dbg !595
  %36 = load i32, ptr %4, align 4, !dbg !596
  %37 = sext i32 %36 to i64, !dbg !594
  %38 = getelementptr inbounds [10 x i16], ptr %35, i64 0, i64 %37, !dbg !594
  %39 = load i16, ptr %38, align 2, !dbg !594
  %40 = sext i16 %39 to i64, !dbg !591
  %41 = getelementptr inbounds [6 x %struct.side], ptr %31, i64 0, i64 %40, !dbg !591
  %42 = getelementptr inbounds nuw %struct.side, ptr %41, i32 0, i32 2, !dbg !597
  %43 = load i16, ptr %42, align 2, !dbg !597
  %44 = sext i16 %43 to i32, !dbg !591
  %45 = load i32, ptr %3, align 4, !dbg !598
  %46 = icmp eq i32 %44, %45, !dbg !599
  br i1 %46, label %47, label %52, !dbg !599

47:                                               ; preds = %20
  %48 = load i32, ptr %3, align 4, !dbg !600
  %49 = load i32, ptr %5, align 4, !dbg !600
  %50 = load i32, ptr %4, align 4, !dbg !600
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.6, i32 noundef %48, i32 noundef %49, i32 noundef %50), !dbg !600
  %51 = load i32, ptr %5, align 4, !dbg !602
  store i32 %51, ptr %2, align 4, !dbg !603
  br label %61, !dbg !603

52:                                               ; preds = %20
  br label %53, !dbg !604

53:                                               ; preds = %52
  %54 = load i32, ptr %4, align 4, !dbg !605
  %55 = add nsw i32 %54, 1, !dbg !605
  store i32 %55, ptr %4, align 4, !dbg !605
  br label %11, !dbg !606, !llvm.loop !607

56:                                               ; preds = %11
  br label %57, !dbg !609

57:                                               ; preds = %56
  %58 = load i32, ptr %5, align 4, !dbg !610
  %59 = add nsw i32 %58, 1, !dbg !610
  store i32 %59, ptr %5, align 4, !dbg !610
  br label %6, !dbg !611, !llvm.loop !612

60:                                               ; preds = %6
  store i32 -1, ptr %2, align 4, !dbg !614
  br label %61, !dbg !614

61:                                               ; preds = %60, %47
  %62 = load i32, ptr %2, align 4, !dbg !615
  ret i32 %62, !dbg !615
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z24flag_wall_switched_doorsv() #0 !dbg !616 {
  %1 = alloca i32, align 4
    #dbg_declare(ptr %1, !619, !DIExpression(), !620)
  store i32 0, ptr %1, align 4, !dbg !621
  br label %2, !dbg !623

2:                                                ; preds = %20, %0
  %3 = load i32, ptr %1, align 4, !dbg !624
  %4 = load i32, ptr @Num_walls, align 4, !dbg !626
  %5 = icmp slt i32 %3, %4, !dbg !627
  br i1 %5, label %6, label %23, !dbg !628

6:                                                ; preds = %2
  %7 = load i32, ptr %1, align 4, !dbg !629
  %8 = call noundef i32 @_Z21door_is_wall_switchedi(i32 noundef %7), !dbg !632
  %9 = icmp ne i32 %8, 0, !dbg !632
  br i1 %9, label %10, label %19, !dbg !632

10:                                               ; preds = %6
  %11 = load i32, ptr %1, align 4, !dbg !633
  %12 = sext i32 %11 to i64, !dbg !634
  %13 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %12, !dbg !634
  %14 = getelementptr inbounds nuw %struct.wall, ptr %13, i32 0, i32 5, !dbg !635
  %15 = load i8, ptr %14, align 1, !dbg !636
  %16 = zext i8 %15 to i32, !dbg !636
  %17 = or i32 %16, 64, !dbg !636
  %18 = trunc i32 %17 to i8, !dbg !636
  store i8 %18, ptr %14, align 1, !dbg !636
  br label %19, !dbg !634

19:                                               ; preds = %10, %6
  br label %20, !dbg !637

20:                                               ; preds = %19
  %21 = load i32, ptr %1, align 4, !dbg !638
  %22 = add nsw i32 %21, 1, !dbg !638
  store i32 %22, ptr %1, align 4, !dbg !638
  br label %2, !dbg !639, !llvm.loop !640

23:                                               ; preds = %2
  ret void, !dbg !642
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z13do_lock_doorsa(i8 noundef signext %0) #0 !dbg !643 {
  %2 = alloca i8, align 1
  %3 = alloca i32, align 4
  store i8 %0, ptr %2, align 1
    #dbg_declare(ptr %2, !644, !DIExpression(), !645)
    #dbg_declare(ptr %3, !646, !DIExpression(), !647)
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.7), !dbg !648
  %4 = load i8, ptr %2, align 1, !dbg !649
  %5 = sext i8 %4 to i32, !dbg !649
  %6 = icmp ne i32 %5, -1, !dbg !651
  br i1 %6, label %7, label %52, !dbg !651

7:                                                ; preds = %1
  store i32 0, ptr %3, align 4, !dbg !652
  br label %8, !dbg !655

8:                                                ; preds = %48, %7
  %9 = load i32, ptr %3, align 4, !dbg !656
  %10 = load i8, ptr %2, align 1, !dbg !658
  %11 = sext i8 %10 to i64, !dbg !659
  %12 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %11, !dbg !659
  %13 = getelementptr inbounds nuw %struct.trigger, ptr %12, i32 0, i32 2, !dbg !660
  %14 = load i8, ptr %13, align 2, !dbg !660
  %15 = sext i8 %14 to i32, !dbg !659
  %16 = icmp slt i32 %9, %15, !dbg !661
  br i1 %16, label %17, label %51, !dbg !662

17:                                               ; preds = %8
  %18 = load i8, ptr %2, align 1, !dbg !663
  %19 = sext i8 %18 to i64, !dbg !665
  %20 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %19, !dbg !665
  %21 = getelementptr inbounds nuw %struct.trigger, ptr %20, i32 0, i32 6, !dbg !666
  %22 = load i32, ptr %3, align 4, !dbg !667
  %23 = sext i32 %22 to i64, !dbg !665
  %24 = getelementptr inbounds [10 x i16], ptr %21, i64 0, i64 %23, !dbg !665
  %25 = load i16, ptr %24, align 2, !dbg !665
  %26 = sext i16 %25 to i64, !dbg !668
  %27 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %26, !dbg !668
  %28 = getelementptr inbounds nuw %struct.segment, ptr %27, i32 0, i32 0, !dbg !669
  %29 = load i8, ptr %2, align 1, !dbg !670
  %30 = sext i8 %29 to i64, !dbg !671
  %31 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %30, !dbg !671
  %32 = getelementptr inbounds nuw %struct.trigger, ptr %31, i32 0, i32 7, !dbg !672
  %33 = load i32, ptr %3, align 4, !dbg !673
  %34 = sext i32 %33 to i64, !dbg !671
  %35 = getelementptr inbounds [10 x i16], ptr %32, i64 0, i64 %34, !dbg !671
  %36 = load i16, ptr %35, align 2, !dbg !671
  %37 = sext i16 %36 to i64, !dbg !668
  %38 = getelementptr inbounds [6 x %struct.side], ptr %28, i64 0, i64 %37, !dbg !668
  %39 = getelementptr inbounds nuw %struct.side, ptr %38, i32 0, i32 2, !dbg !674
  %40 = load i16, ptr %39, align 2, !dbg !674
  %41 = sext i16 %40 to i64, !dbg !675
  %42 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %41, !dbg !675
  %43 = getelementptr inbounds nuw %struct.wall, ptr %42, i32 0, i32 5, !dbg !676
  %44 = load i8, ptr %43, align 1, !dbg !677
  %45 = zext i8 %44 to i32, !dbg !677
  %46 = or i32 %45, 8, !dbg !677
  %47 = trunc i32 %46 to i8, !dbg !677
  store i8 %47, ptr %43, align 1, !dbg !677
  br label %48, !dbg !678

48:                                               ; preds = %17
  %49 = load i32, ptr %3, align 4, !dbg !679
  %50 = add nsw i32 %49, 1, !dbg !679
  store i32 %50, ptr %3, align 4, !dbg !679
  br label %8, !dbg !680, !llvm.loop !681

51:                                               ; preds = %8
  br label %52, !dbg !683

52:                                               ; preds = %51, %1
  ret void, !dbg !684
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z15do_change_wallsa(i8 noundef signext %0) #0 !dbg !685 {
  %2 = alloca i8, align 1
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i16, align 2
  %8 = alloca i16, align 2
  %9 = alloca i32, align 4
  %10 = alloca %struct.vms_vector, align 4
  %11 = alloca %struct.vms_vector, align 4
  store i8 %0, ptr %2, align 1
    #dbg_declare(ptr %2, !686, !DIExpression(), !687)
    #dbg_declare(ptr %3, !688, !DIExpression(), !689)
    #dbg_declare(ptr %4, !690, !DIExpression(), !691)
  store i32 0, ptr %4, align 4, !dbg !691
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.8), !dbg !692
  %12 = load i8, ptr %2, align 1, !dbg !693
  %13 = sext i8 %12 to i32, !dbg !693
  %14 = icmp ne i32 %13, -1, !dbg !695
  br i1 %14, label %15, label %277, !dbg !695

15:                                               ; preds = %1
  store i32 0, ptr %3, align 4, !dbg !696
  br label %16, !dbg !699

16:                                               ; preds = %273, %15
  %17 = load i32, ptr %3, align 4, !dbg !700
  %18 = load i8, ptr %2, align 1, !dbg !702
  %19 = sext i8 %18 to i64, !dbg !703
  %20 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %19, !dbg !703
  %21 = getelementptr inbounds nuw %struct.trigger, ptr %20, i32 0, i32 2, !dbg !704
  %22 = load i8, ptr %21, align 2, !dbg !704
  %23 = sext i8 %22 to i32, !dbg !703
  %24 = icmp slt i32 %17, %23, !dbg !705
  br i1 %24, label %25, label %276, !dbg !706

25:                                               ; preds = %16
    #dbg_declare(ptr %5, !707, !DIExpression(), !752)
    #dbg_declare(ptr %6, !753, !DIExpression(), !754)
    #dbg_declare(ptr %7, !755, !DIExpression(), !756)
    #dbg_declare(ptr %8, !757, !DIExpression(), !758)
    #dbg_declare(ptr %9, !759, !DIExpression(), !760)
  %26 = load i8, ptr %2, align 1, !dbg !761
  %27 = sext i8 %26 to i64, !dbg !762
  %28 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %27, !dbg !762
  %29 = getelementptr inbounds nuw %struct.trigger, ptr %28, i32 0, i32 6, !dbg !763
  %30 = load i32, ptr %3, align 4, !dbg !764
  %31 = sext i32 %30 to i64, !dbg !762
  %32 = getelementptr inbounds [10 x i16], ptr %29, i64 0, i64 %31, !dbg !762
  %33 = load i16, ptr %32, align 2, !dbg !762
  %34 = sext i16 %33 to i64, !dbg !765
  %35 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %34, !dbg !765
  store ptr %35, ptr %5, align 8, !dbg !766
  %36 = load i8, ptr %2, align 1, !dbg !767
  %37 = sext i8 %36 to i64, !dbg !768
  %38 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %37, !dbg !768
  %39 = getelementptr inbounds nuw %struct.trigger, ptr %38, i32 0, i32 7, !dbg !769
  %40 = load i32, ptr %3, align 4, !dbg !770
  %41 = sext i32 %40 to i64, !dbg !768
  %42 = getelementptr inbounds [10 x i16], ptr %39, i64 0, i64 %41, !dbg !768
  %43 = load i16, ptr %42, align 2, !dbg !768
  store i16 %43, ptr %7, align 2, !dbg !771
  %44 = load ptr, ptr %5, align 8, !dbg !772
  %45 = getelementptr inbounds nuw %struct.segment, ptr %44, i32 0, i32 1, !dbg !773
  %46 = load i16, ptr %7, align 2, !dbg !774
  %47 = sext i16 %46 to i64, !dbg !772
  %48 = getelementptr inbounds [6 x i16], ptr %45, i64 0, i64 %47, !dbg !772
  %49 = load i16, ptr %48, align 2, !dbg !772
  %50 = sext i16 %49 to i64, !dbg !775
  %51 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %50, !dbg !775
  store ptr %51, ptr %6, align 8, !dbg !776
  %52 = load ptr, ptr %5, align 8, !dbg !777
  %53 = load ptr, ptr %6, align 8, !dbg !778
  %54 = call noundef i32 @_Z17find_connect_sideP7segmentS0_(ptr noundef %52, ptr noundef %53), !dbg !779
  %55 = trunc i32 %54 to i16, !dbg !779
  store i16 %55, ptr %8, align 2, !dbg !780
  %56 = load i16, ptr %8, align 2, !dbg !781
  %57 = sext i16 %56 to i32, !dbg !781
  %58 = icmp ne i32 %57, -1, !dbg !781
  %59 = zext i1 %58 to i32, !dbg !781
  call void @_Z7_AssertiPKcS0_i(i32 noundef %59, ptr noundef @.str.9, ptr noundef @.str.10, i32 noundef 311), !dbg !781
  %60 = load i8, ptr %2, align 1, !dbg !782
  %61 = sext i8 %60 to i64, !dbg !783
  %62 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %61, !dbg !783
  %63 = getelementptr inbounds nuw %struct.trigger, ptr %62, i32 0, i32 0, !dbg !784
  %64 = load i8, ptr %63, align 4, !dbg !784
  %65 = zext i8 %64 to i32, !dbg !783
  switch i32 %65, label %69 [
    i32 9, label %66
    i32 10, label %67
    i32 11, label %68
  ], !dbg !785

66:                                               ; preds = %25
  store i32 4, ptr %9, align 4, !dbg !786
  br label %69, !dbg !788

67:                                               ; preds = %25
  store i32 5, ptr %9, align 4, !dbg !789
  br label %69, !dbg !790

68:                                               ; preds = %25
  store i32 3, ptr %9, align 4, !dbg !791
  br label %69, !dbg !792

69:                                               ; preds = %25, %68, %67, %66
  %70 = load ptr, ptr %5, align 8, !dbg !793
  %71 = getelementptr inbounds nuw %struct.segment, ptr %70, i32 0, i32 0, !dbg !795
  %72 = load i16, ptr %7, align 2, !dbg !796
  %73 = sext i16 %72 to i64, !dbg !793
  %74 = getelementptr inbounds [6 x %struct.side], ptr %71, i64 0, i64 %73, !dbg !793
  %75 = getelementptr inbounds nuw %struct.side, ptr %74, i32 0, i32 2, !dbg !797
  %76 = load i16, ptr %75, align 2, !dbg !797
  %77 = sext i16 %76 to i64, !dbg !798
  %78 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %77, !dbg !798
  %79 = getelementptr inbounds nuw %struct.wall, ptr %78, i32 0, i32 4, !dbg !799
  %80 = load i8, ptr %79, align 4, !dbg !799
  %81 = zext i8 %80 to i32, !dbg !798
  %82 = load i32, ptr %9, align 4, !dbg !800
  %83 = icmp eq i32 %81, %82, !dbg !801
  br i1 %83, label %84, label %100, !dbg !802

84:                                               ; preds = %69
  %85 = load ptr, ptr %6, align 8, !dbg !803
  %86 = getelementptr inbounds nuw %struct.segment, ptr %85, i32 0, i32 0, !dbg !804
  %87 = load i16, ptr %8, align 2, !dbg !805
  %88 = sext i16 %87 to i64, !dbg !803
  %89 = getelementptr inbounds [6 x %struct.side], ptr %86, i64 0, i64 %88, !dbg !803
  %90 = getelementptr inbounds nuw %struct.side, ptr %89, i32 0, i32 2, !dbg !806
  %91 = load i16, ptr %90, align 2, !dbg !806
  %92 = sext i16 %91 to i64, !dbg !807
  %93 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %92, !dbg !807
  %94 = getelementptr inbounds nuw %struct.wall, ptr %93, i32 0, i32 4, !dbg !808
  %95 = load i8, ptr %94, align 4, !dbg !808
  %96 = zext i8 %95 to i32, !dbg !807
  %97 = load i32, ptr %9, align 4, !dbg !809
  %98 = icmp eq i32 %96, %97, !dbg !810
  br i1 %98, label %99, label %100, !dbg !802

99:                                               ; preds = %84
  br label %273, !dbg !811

100:                                              ; preds = %84, %69
  store i32 1, ptr %4, align 4, !dbg !812
  %101 = load i8, ptr %2, align 1, !dbg !813
  %102 = sext i8 %101 to i64, !dbg !814
  %103 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %102, !dbg !814
  %104 = getelementptr inbounds nuw %struct.trigger, ptr %103, i32 0, i32 0, !dbg !815
  %105 = load i8, ptr %104, align 4, !dbg !815
  %106 = zext i8 %105 to i32, !dbg !814
  switch i32 %106, label %256 [
    i32 9, label %107
    i32 10, label %176
    i32 11, label %231
  ], !dbg !816

107:                                              ; preds = %100
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.11), !dbg !817
  %108 = load ptr, ptr %5, align 8, !dbg !819
  %109 = getelementptr inbounds nuw %struct.segment, ptr %108, i32 0, i32 0, !dbg !821
  %110 = load i16, ptr %7, align 2, !dbg !822
  %111 = sext i16 %110 to i64, !dbg !819
  %112 = getelementptr inbounds [6 x %struct.side], ptr %109, i64 0, i64 %111, !dbg !819
  %113 = getelementptr inbounds nuw %struct.side, ptr %112, i32 0, i32 3, !dbg !823
  %114 = load i16, ptr %113, align 4, !dbg !823
  %115 = sext i16 %114 to i64, !dbg !824
  %116 = getelementptr inbounds [1200 x %struct.tmap_info], ptr @TmapInfo, i64 0, i64 %115, !dbg !824
  %117 = getelementptr inbounds nuw %struct.tmap_info, ptr %116, i32 0, i32 0, !dbg !825
  %118 = load i8, ptr %117, align 4, !dbg !825
  %119 = zext i8 %118 to i32, !dbg !824
  %120 = and i32 %119, 4, !dbg !826
  %121 = icmp ne i32 %120, 0, !dbg !827
  br i1 %121, label %122, label %171, !dbg !827

122:                                              ; preds = %107
    #dbg_declare(ptr %10, !828, !DIExpression(), !830)
  %123 = load ptr, ptr %5, align 8, !dbg !831
  %124 = load i16, ptr %7, align 2, !dbg !832
  %125 = sext i16 %124 to i32, !dbg !832
  call void @_Z28compute_center_point_on_sideP10vms_vectorP7segmenti(ptr noundef %10, ptr noundef %123, i32 noundef %125), !dbg !833
  %126 = load ptr, ptr %5, align 8, !dbg !834
  %127 = ptrtoint ptr %126 to i64, !dbg !835
  %128 = sub i64 %127, ptrtoint (ptr @Segments to i64), !dbg !835
  %129 = sdiv exact i64 %128, 512, !dbg !835
  %130 = trunc i64 %129 to i16, !dbg !834
  %131 = load i16, ptr %7, align 2, !dbg !836
  %132 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef 43, i16 noundef signext %130, i16 noundef signext %131, ptr noundef %10, i32 noundef 0, i32 noundef 65536), !dbg !837
  %133 = load i32, ptr %9, align 4, !dbg !838
  %134 = trunc i32 %133 to i8, !dbg !838
  %135 = load ptr, ptr %5, align 8, !dbg !839
  %136 = getelementptr inbounds nuw %struct.segment, ptr %135, i32 0, i32 0, !dbg !840
  %137 = load i16, ptr %7, align 2, !dbg !841
  %138 = sext i16 %137 to i64, !dbg !839
  %139 = getelementptr inbounds [6 x %struct.side], ptr %136, i64 0, i64 %138, !dbg !839
  %140 = getelementptr inbounds nuw %struct.side, ptr %139, i32 0, i32 2, !dbg !842
  %141 = load i16, ptr %140, align 2, !dbg !842
  %142 = sext i16 %141 to i64, !dbg !843
  %143 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %142, !dbg !843
  %144 = getelementptr inbounds nuw %struct.wall, ptr %143, i32 0, i32 4, !dbg !844
  store i8 %134, ptr %144, align 4, !dbg !845
  %145 = load i32, ptr %9, align 4, !dbg !846
  %146 = trunc i32 %145 to i8, !dbg !846
  %147 = load ptr, ptr %6, align 8, !dbg !847
  %148 = getelementptr inbounds nuw %struct.segment, ptr %147, i32 0, i32 0, !dbg !848
  %149 = load i16, ptr %8, align 2, !dbg !849
  %150 = sext i16 %149 to i64, !dbg !847
  %151 = getelementptr inbounds [6 x %struct.side], ptr %148, i64 0, i64 %150, !dbg !847
  %152 = getelementptr inbounds nuw %struct.side, ptr %151, i32 0, i32 2, !dbg !850
  %153 = load i16, ptr %152, align 2, !dbg !850
  %154 = sext i16 %153 to i64, !dbg !851
  %155 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %154, !dbg !851
  %156 = getelementptr inbounds nuw %struct.wall, ptr %155, i32 0, i32 4, !dbg !852
  store i8 %146, ptr %156, align 4, !dbg !853
  %157 = load ptr, ptr %5, align 8, !dbg !854
  %158 = ptrtoint ptr %157 to i64, !dbg !855
  %159 = sub i64 %158, ptrtoint (ptr @Segments to i64), !dbg !855
  %160 = sdiv exact i64 %159, 512, !dbg !855
  %161 = trunc i64 %160 to i32, !dbg !854
  %162 = load i16, ptr %7, align 2, !dbg !856
  %163 = sext i16 %162 to i32, !dbg !856
  call void @_Z33digi_kill_sound_linked_to_segmentiii(i32 noundef %161, i32 noundef %163, i32 noundef 42), !dbg !857
  %164 = load ptr, ptr %6, align 8, !dbg !858
  %165 = ptrtoint ptr %164 to i64, !dbg !859
  %166 = sub i64 %165, ptrtoint (ptr @Segments to i64), !dbg !859
  %167 = sdiv exact i64 %166, 512, !dbg !859
  %168 = trunc i64 %167 to i32, !dbg !858
  %169 = load i16, ptr %8, align 2, !dbg !860
  %170 = sext i16 %169 to i32, !dbg !860
  call void @_Z33digi_kill_sound_linked_to_segmentiii(i32 noundef %168, i32 noundef %170, i32 noundef 42), !dbg !861
  br label %175, !dbg !862

171:                                              ; preds = %107
  %172 = load ptr, ptr %5, align 8, !dbg !863
  %173 = load i16, ptr %7, align 2, !dbg !864
  %174 = sext i16 %173 to i32, !dbg !864
  call void @_Z16start_wall_cloakP7segmenti(ptr noundef %172, i32 noundef %174), !dbg !865
  br label %175

175:                                              ; preds = %171, %122
  store i32 1, ptr %4, align 4, !dbg !866
  br label %256, !dbg !867

176:                                              ; preds = %100
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.12), !dbg !868
  %177 = load ptr, ptr %5, align 8, !dbg !869
  %178 = getelementptr inbounds nuw %struct.segment, ptr %177, i32 0, i32 0, !dbg !871
  %179 = load i16, ptr %7, align 2, !dbg !872
  %180 = sext i16 %179 to i64, !dbg !869
  %181 = getelementptr inbounds [6 x %struct.side], ptr %178, i64 0, i64 %180, !dbg !869
  %182 = getelementptr inbounds nuw %struct.side, ptr %181, i32 0, i32 3, !dbg !873
  %183 = load i16, ptr %182, align 4, !dbg !873
  %184 = sext i16 %183 to i64, !dbg !874
  %185 = getelementptr inbounds [1200 x %struct.tmap_info], ptr @TmapInfo, i64 0, i64 %184, !dbg !874
  %186 = getelementptr inbounds nuw %struct.tmap_info, ptr %185, i32 0, i32 0, !dbg !875
  %187 = load i8, ptr %186, align 4, !dbg !875
  %188 = zext i8 %187 to i32, !dbg !874
  %189 = and i32 %188, 4, !dbg !876
  %190 = icmp ne i32 %189, 0, !dbg !877
  br i1 %190, label %191, label %226, !dbg !877

191:                                              ; preds = %176
    #dbg_declare(ptr %11, !878, !DIExpression(), !880)
  %192 = load ptr, ptr %5, align 8, !dbg !881
  %193 = load i16, ptr %7, align 2, !dbg !882
  %194 = sext i16 %193 to i32, !dbg !882
  call void @_Z28compute_center_point_on_sideP10vms_vectorP7segmenti(ptr noundef %11, ptr noundef %192, i32 noundef %194), !dbg !883
  %195 = load ptr, ptr %5, align 8, !dbg !884
  %196 = ptrtoint ptr %195 to i64, !dbg !885
  %197 = sub i64 %196, ptrtoint (ptr @Segments to i64), !dbg !885
  %198 = sdiv exact i64 %197, 512, !dbg !885
  %199 = trunc i64 %198 to i16, !dbg !884
  %200 = load i16, ptr %7, align 2, !dbg !886
  %201 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef 42, i16 noundef signext %199, i16 noundef signext %200, ptr noundef %11, i32 noundef 1, i32 noundef 32768), !dbg !887
  %202 = load i32, ptr %9, align 4, !dbg !888
  %203 = trunc i32 %202 to i8, !dbg !888
  %204 = load ptr, ptr %5, align 8, !dbg !889
  %205 = getelementptr inbounds nuw %struct.segment, ptr %204, i32 0, i32 0, !dbg !890
  %206 = load i16, ptr %7, align 2, !dbg !891
  %207 = sext i16 %206 to i64, !dbg !889
  %208 = getelementptr inbounds [6 x %struct.side], ptr %205, i64 0, i64 %207, !dbg !889
  %209 = getelementptr inbounds nuw %struct.side, ptr %208, i32 0, i32 2, !dbg !892
  %210 = load i16, ptr %209, align 2, !dbg !892
  %211 = sext i16 %210 to i64, !dbg !893
  %212 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %211, !dbg !893
  %213 = getelementptr inbounds nuw %struct.wall, ptr %212, i32 0, i32 4, !dbg !894
  store i8 %203, ptr %213, align 4, !dbg !895
  %214 = load i32, ptr %9, align 4, !dbg !896
  %215 = trunc i32 %214 to i8, !dbg !896
  %216 = load ptr, ptr %6, align 8, !dbg !897
  %217 = getelementptr inbounds nuw %struct.segment, ptr %216, i32 0, i32 0, !dbg !898
  %218 = load i16, ptr %8, align 2, !dbg !899
  %219 = sext i16 %218 to i64, !dbg !897
  %220 = getelementptr inbounds [6 x %struct.side], ptr %217, i64 0, i64 %219, !dbg !897
  %221 = getelementptr inbounds nuw %struct.side, ptr %220, i32 0, i32 2, !dbg !900
  %222 = load i16, ptr %221, align 2, !dbg !900
  %223 = sext i16 %222 to i64, !dbg !901
  %224 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %223, !dbg !901
  %225 = getelementptr inbounds nuw %struct.wall, ptr %224, i32 0, i32 4, !dbg !902
  store i8 %215, ptr %225, align 4, !dbg !903
  br label %230, !dbg !904

226:                                              ; preds = %176
  %227 = load ptr, ptr %5, align 8, !dbg !905
  %228 = load i16, ptr %7, align 2, !dbg !906
  %229 = sext i16 %228 to i32, !dbg !906
  call void @_Z18start_wall_decloakP7segmenti(ptr noundef %227, i32 noundef %229), !dbg !907
  br label %230

230:                                              ; preds = %226, %191
  br label %256, !dbg !908

231:                                              ; preds = %100
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.13), !dbg !909
  %232 = load i32, ptr %9, align 4, !dbg !910
  %233 = trunc i32 %232 to i8, !dbg !910
  %234 = load ptr, ptr %5, align 8, !dbg !911
  %235 = getelementptr inbounds nuw %struct.segment, ptr %234, i32 0, i32 0, !dbg !912
  %236 = load i16, ptr %7, align 2, !dbg !913
  %237 = sext i16 %236 to i64, !dbg !911
  %238 = getelementptr inbounds [6 x %struct.side], ptr %235, i64 0, i64 %237, !dbg !911
  %239 = getelementptr inbounds nuw %struct.side, ptr %238, i32 0, i32 2, !dbg !914
  %240 = load i16, ptr %239, align 2, !dbg !914
  %241 = sext i16 %240 to i64, !dbg !915
  %242 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %241, !dbg !915
  %243 = getelementptr inbounds nuw %struct.wall, ptr %242, i32 0, i32 4, !dbg !916
  store i8 %233, ptr %243, align 4, !dbg !917
  %244 = load i32, ptr %9, align 4, !dbg !918
  %245 = trunc i32 %244 to i8, !dbg !918
  %246 = load ptr, ptr %6, align 8, !dbg !919
  %247 = getelementptr inbounds nuw %struct.segment, ptr %246, i32 0, i32 0, !dbg !920
  %248 = load i16, ptr %8, align 2, !dbg !921
  %249 = sext i16 %248 to i64, !dbg !919
  %250 = getelementptr inbounds [6 x %struct.side], ptr %247, i64 0, i64 %249, !dbg !919
  %251 = getelementptr inbounds nuw %struct.side, ptr %250, i32 0, i32 2, !dbg !922
  %252 = load i16, ptr %251, align 2, !dbg !922
  %253 = sext i16 %252 to i64, !dbg !923
  %254 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %253, !dbg !923
  %255 = getelementptr inbounds nuw %struct.wall, ptr %254, i32 0, i32 4, !dbg !924
  store i8 %245, ptr %255, align 4, !dbg !925
  br label %256, !dbg !926

256:                                              ; preds = %100, %231, %230, %175
  %257 = load ptr, ptr %5, align 8, !dbg !927
  %258 = getelementptr inbounds nuw %struct.segment, ptr %257, i32 0, i32 0, !dbg !928
  %259 = load i16, ptr %7, align 2, !dbg !929
  %260 = sext i16 %259 to i64, !dbg !927
  %261 = getelementptr inbounds [6 x %struct.side], ptr %258, i64 0, i64 %260, !dbg !927
  %262 = getelementptr inbounds nuw %struct.side, ptr %261, i32 0, i32 2, !dbg !930
  %263 = load i16, ptr %262, align 2, !dbg !930
  %264 = sext i16 %263 to i32, !dbg !927
  call void @_Z18kill_stuck_objectsi(i32 noundef %264), !dbg !931
  %265 = load ptr, ptr %6, align 8, !dbg !932
  %266 = getelementptr inbounds nuw %struct.segment, ptr %265, i32 0, i32 0, !dbg !933
  %267 = load i16, ptr %8, align 2, !dbg !934
  %268 = sext i16 %267 to i64, !dbg !932
  %269 = getelementptr inbounds [6 x %struct.side], ptr %266, i64 0, i64 %268, !dbg !932
  %270 = getelementptr inbounds nuw %struct.side, ptr %269, i32 0, i32 2, !dbg !935
  %271 = load i16, ptr %270, align 2, !dbg !935
  %272 = sext i16 %271 to i32, !dbg !932
  call void @_Z18kill_stuck_objectsi(i32 noundef %272), !dbg !936
  br label %273, !dbg !937

273:                                              ; preds = %256, %99
  %274 = load i32, ptr %3, align 4, !dbg !938
  %275 = add nsw i32 %274, 1, !dbg !938
  store i32 %275, ptr %3, align 4, !dbg !938
  br label %16, !dbg !939, !llvm.loop !940

276:                                              ; preds = %16
  br label %277, !dbg !942

277:                                              ; preds = %276, %1
  %278 = load i32, ptr %4, align 4, !dbg !943
  ret i32 %278, !dbg !944
}

declare noundef i32 @_Z17find_connect_sideP7segmentS0_(ptr noundef, ptr noundef) #1

declare void @_Z7_AssertiPKcS0_i(i32 noundef, ptr noundef, ptr noundef, i32 noundef) #1

declare void @_Z28compute_center_point_on_sideP10vms_vectorP7segmenti(ptr noundef, ptr noundef, i32 noundef) #1

declare noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef, i16 noundef signext, i16 noundef signext, ptr noundef, i32 noundef, i32 noundef) #1

declare void @_Z33digi_kill_sound_linked_to_segmentiii(i32 noundef, i32 noundef, i32 noundef) #1

declare void @_Z16start_wall_cloakP7segmenti(ptr noundef, i32 noundef) #1

declare void @_Z18start_wall_decloakP7segmenti(ptr noundef, i32 noundef) #1

declare void @_Z18kill_stuck_objectsi(i32 noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z21print_trigger_messageiiiPKc(i32 noundef %0, i32 noundef %1, i32 noundef %2, ptr noundef %3) #0 !dbg !945 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  store i32 %0, ptr %5, align 4
    #dbg_declare(ptr %5, !949, !DIExpression(), !950)
  store i32 %1, ptr %6, align 4
    #dbg_declare(ptr %6, !951, !DIExpression(), !952)
  store i32 %2, ptr %7, align 4
    #dbg_declare(ptr %7, !953, !DIExpression(), !954)
  store ptr %3, ptr %8, align 8
    #dbg_declare(ptr %8, !955, !DIExpression(), !956)
    #dbg_declare(ptr %9, !957, !DIExpression(), !958)
  %10 = load i32, ptr %5, align 4, !dbg !959
  %11 = load i32, ptr @Player_num, align 4, !dbg !961
  %12 = icmp ne i32 %10, %11, !dbg !962
  br i1 %12, label %13, label %14, !dbg !962

13:                                               ; preds = %4
  br label %39, !dbg !963

14:                                               ; preds = %4
  %15 = load i32, ptr %6, align 4, !dbg !964
  %16 = sext i32 %15 to i64, !dbg !965
  %17 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %16, !dbg !965
  %18 = getelementptr inbounds nuw %struct.trigger, ptr %17, i32 0, i32 2, !dbg !966
  %19 = load i8, ptr %18, align 2, !dbg !966
  %20 = sext i8 %19 to i32, !dbg !965
  %21 = icmp sgt i32 %20, 1, !dbg !967
  %22 = zext i1 %21 to i64, !dbg !968
  %23 = select i1 %21, ptr @.str.14, ptr @.str.15, !dbg !968
  store ptr %23, ptr %9, align 8, !dbg !969
  %24 = load i32, ptr %6, align 4, !dbg !970
  %25 = sext i32 %24 to i64, !dbg !972
  %26 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %25, !dbg !972
  %27 = getelementptr inbounds nuw %struct.trigger, ptr %26, i32 0, i32 1, !dbg !973
  %28 = load i8, ptr %27, align 1, !dbg !973
  %29 = zext i8 %28 to i32, !dbg !972
  %30 = and i32 %29, 1, !dbg !974
  %31 = icmp ne i32 %30, 0, !dbg !975
  br i1 %31, label %39, label %32, !dbg !976

32:                                               ; preds = %14
  %33 = load i32, ptr %7, align 4, !dbg !977
  %34 = icmp ne i32 %33, 0, !dbg !977
  br i1 %34, label %35, label %39, !dbg !976

35:                                               ; preds = %32
  %36 = load ptr, ptr %8, align 8, !dbg !978
  %37 = load ptr, ptr %9, align 8, !dbg !979
  %38 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef %36, ptr noundef %37), !dbg !980
  br label %39, !dbg !980

39:                                               ; preds = %13, %35, %32, %14
  ret void, !dbg !981
}

declare noundef i32 @_Z16HUD_init_messagePKcz(ptr noundef, ...) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z9do_matcena(i8 noundef signext %0) #0 !dbg !982 {
  %2 = alloca i8, align 1
  %3 = alloca i32, align 4
  store i8 %0, ptr %2, align 1
    #dbg_declare(ptr %2, !983, !DIExpression(), !984)
    #dbg_declare(ptr %3, !985, !DIExpression(), !986)
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.16), !dbg !987
  %4 = load i8, ptr %2, align 1, !dbg !988
  %5 = sext i8 %4 to i32, !dbg !988
  %6 = icmp ne i32 %5, -1, !dbg !990
  br i1 %6, label %7, label %42, !dbg !990

7:                                                ; preds = %1
  store i32 0, ptr %3, align 4, !dbg !991
  br label %8, !dbg !994

8:                                                ; preds = %38, %7
  %9 = load i32, ptr %3, align 4, !dbg !995
  %10 = load i8, ptr %2, align 1, !dbg !997
  %11 = sext i8 %10 to i64, !dbg !998
  %12 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %11, !dbg !998
  %13 = getelementptr inbounds nuw %struct.trigger, ptr %12, i32 0, i32 2, !dbg !999
  %14 = load i8, ptr %13, align 2, !dbg !999
  %15 = sext i8 %14 to i32, !dbg !998
  %16 = icmp slt i32 %9, %15, !dbg !1000
  br i1 %16, label %17, label %41, !dbg !1001

17:                                               ; preds = %8
  %18 = load i8, ptr %2, align 1, !dbg !1002
  %19 = sext i8 %18 to i64, !dbg !1004
  %20 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %19, !dbg !1004
  %21 = getelementptr inbounds nuw %struct.trigger, ptr %20, i32 0, i32 6, !dbg !1005
  %22 = load i32, ptr %3, align 4, !dbg !1006
  %23 = sext i32 %22 to i64, !dbg !1004
  %24 = getelementptr inbounds [10 x i16], ptr %21, i64 0, i64 %23, !dbg !1004
  %25 = load i16, ptr %24, align 2, !dbg !1004
  %26 = sext i16 %25 to i32, !dbg !1004
  call void @_Z14trigger_matceni(i32 noundef %26), !dbg !1007
  %27 = load i8, ptr %2, align 1, !dbg !1008
  %28 = sext i8 %27 to i32, !dbg !1008
  %29 = load i8, ptr %2, align 1, !dbg !1008
  %30 = sext i8 %29 to i64, !dbg !1008
  %31 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %30, !dbg !1008
  %32 = getelementptr inbounds nuw %struct.trigger, ptr %31, i32 0, i32 6, !dbg !1008
  %33 = load i32, ptr %3, align 4, !dbg !1008
  %34 = sext i32 %33 to i64, !dbg !1008
  %35 = getelementptr inbounds [10 x i16], ptr %32, i64 0, i64 %34, !dbg !1008
  %36 = load i16, ptr %35, align 2, !dbg !1008
  %37 = sext i16 %36 to i32, !dbg !1008
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.17, i32 noundef %28, i32 noundef %37), !dbg !1008
  br label %38, !dbg !1009

38:                                               ; preds = %17
  %39 = load i32, ptr %3, align 4, !dbg !1010
  %40 = add nsw i32 %39, 1, !dbg !1010
  store i32 %40, ptr %3, align 4, !dbg !1010
  br label %8, !dbg !1011, !llvm.loop !1012

41:                                               ; preds = %8
  br label %42, !dbg !1014

42:                                               ; preds = %41, %1
  ret void, !dbg !1015
}

declare void @_Z14trigger_matceni(i32 noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z8do_il_ona(i8 noundef signext %0) #0 !dbg !1016 {
  %2 = alloca i8, align 1
  %3 = alloca i32, align 4
  store i8 %0, ptr %2, align 1
    #dbg_declare(ptr %2, !1017, !DIExpression(), !1018)
    #dbg_declare(ptr %3, !1019, !DIExpression(), !1020)
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.18), !dbg !1021
  %4 = load i8, ptr %2, align 1, !dbg !1022
  %5 = sext i8 %4 to i32, !dbg !1022
  %6 = icmp ne i32 %5, -1, !dbg !1024
  br i1 %6, label %7, label %61, !dbg !1024

7:                                                ; preds = %1
  store i32 0, ptr %3, align 4, !dbg !1025
  br label %8, !dbg !1028

8:                                                ; preds = %57, %7
  %9 = load i32, ptr %3, align 4, !dbg !1029
  %10 = load i8, ptr %2, align 1, !dbg !1031
  %11 = sext i8 %10 to i64, !dbg !1032
  %12 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %11, !dbg !1032
  %13 = getelementptr inbounds nuw %struct.trigger, ptr %12, i32 0, i32 2, !dbg !1033
  %14 = load i8, ptr %13, align 2, !dbg !1033
  %15 = sext i8 %14 to i32, !dbg !1032
  %16 = icmp slt i32 %9, %15, !dbg !1034
  br i1 %16, label %17, label %60, !dbg !1035

17:                                               ; preds = %8
  %18 = load i8, ptr %2, align 1, !dbg !1036
  %19 = sext i8 %18 to i64, !dbg !1038
  %20 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %19, !dbg !1038
  %21 = getelementptr inbounds nuw %struct.trigger, ptr %20, i32 0, i32 6, !dbg !1039
  %22 = load i32, ptr %3, align 4, !dbg !1040
  %23 = sext i32 %22 to i64, !dbg !1038
  %24 = getelementptr inbounds [10 x i16], ptr %21, i64 0, i64 %23, !dbg !1038
  %25 = load i16, ptr %24, align 2, !dbg !1038
  %26 = sext i16 %25 to i64, !dbg !1041
  %27 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %26, !dbg !1041
  %28 = load i8, ptr %2, align 1, !dbg !1042
  %29 = sext i8 %28 to i64, !dbg !1043
  %30 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %29, !dbg !1043
  %31 = getelementptr inbounds nuw %struct.trigger, ptr %30, i32 0, i32 7, !dbg !1044
  %32 = load i32, ptr %3, align 4, !dbg !1045
  %33 = sext i32 %32 to i64, !dbg !1043
  %34 = getelementptr inbounds [10 x i16], ptr %31, i64 0, i64 %33, !dbg !1043
  %35 = load i16, ptr %34, align 2, !dbg !1043
  %36 = sext i16 %35 to i32, !dbg !1043
  call void @_Z16wall_illusion_onP7segmenti(ptr noundef %27, i32 noundef %36), !dbg !1046
  %37 = load i8, ptr %2, align 1, !dbg !1047
  %38 = sext i8 %37 to i32, !dbg !1047
  %39 = load i8, ptr %2, align 1, !dbg !1047
  %40 = sext i8 %39 to i64, !dbg !1047
  %41 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %40, !dbg !1047
  %42 = getelementptr inbounds nuw %struct.trigger, ptr %41, i32 0, i32 6, !dbg !1047
  %43 = load i32, ptr %3, align 4, !dbg !1047
  %44 = sext i32 %43 to i64, !dbg !1047
  %45 = getelementptr inbounds [10 x i16], ptr %42, i64 0, i64 %44, !dbg !1047
  %46 = load i16, ptr %45, align 2, !dbg !1047
  %47 = sext i16 %46 to i32, !dbg !1047
  %48 = load i8, ptr %2, align 1, !dbg !1047
  %49 = sext i8 %48 to i64, !dbg !1047
  %50 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %49, !dbg !1047
  %51 = getelementptr inbounds nuw %struct.trigger, ptr %50, i32 0, i32 7, !dbg !1047
  %52 = load i32, ptr %3, align 4, !dbg !1047
  %53 = sext i32 %52 to i64, !dbg !1047
  %54 = getelementptr inbounds [10 x i16], ptr %51, i64 0, i64 %53, !dbg !1047
  %55 = load i16, ptr %54, align 2, !dbg !1047
  %56 = sext i16 %55 to i32, !dbg !1047
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.1, i32 noundef %38, i32 noundef %47, i32 noundef %56), !dbg !1047
  br label %57, !dbg !1048

57:                                               ; preds = %17
  %58 = load i32, ptr %3, align 4, !dbg !1049
  %59 = add nsw i32 %58, 1, !dbg !1049
  store i32 %59, ptr %3, align 4, !dbg !1049
  br label %8, !dbg !1050, !llvm.loop !1051

60:                                               ; preds = %8
  br label %61, !dbg !1053

61:                                               ; preds = %60, %1
  ret void, !dbg !1054
}

declare void @_Z16wall_illusion_onP7segmenti(ptr noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z9do_il_offa(i8 noundef signext %0) #0 !dbg !1055 {
  %2 = alloca i8, align 1
  %3 = alloca i32, align 4
  %4 = alloca %struct.vms_vector, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store i8 %0, ptr %2, align 1
    #dbg_declare(ptr %2, !1056, !DIExpression(), !1057)
    #dbg_declare(ptr %3, !1058, !DIExpression(), !1059)
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.19), !dbg !1060
  %7 = load i8, ptr %2, align 1, !dbg !1061
  %8 = sext i8 %7 to i32, !dbg !1061
  %9 = icmp ne i32 %8, -1, !dbg !1063
  br i1 %9, label %10, label %76, !dbg !1063

10:                                               ; preds = %1
  store i32 0, ptr %3, align 4, !dbg !1064
  br label %11, !dbg !1067

11:                                               ; preds = %72, %10
  %12 = load i32, ptr %3, align 4, !dbg !1068
  %13 = load i8, ptr %2, align 1, !dbg !1070
  %14 = sext i8 %13 to i64, !dbg !1071
  %15 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %14, !dbg !1071
  %16 = getelementptr inbounds nuw %struct.trigger, ptr %15, i32 0, i32 2, !dbg !1072
  %17 = load i8, ptr %16, align 2, !dbg !1072
  %18 = sext i8 %17 to i32, !dbg !1071
  %19 = icmp slt i32 %12, %18, !dbg !1073
  br i1 %19, label %20, label %75, !dbg !1074

20:                                               ; preds = %11
    #dbg_declare(ptr %4, !1075, !DIExpression(), !1077)
    #dbg_declare(ptr %5, !1078, !DIExpression(), !1079)
  %21 = load i8, ptr %2, align 1, !dbg !1080
  %22 = sext i8 %21 to i64, !dbg !1081
  %23 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %22, !dbg !1081
  %24 = getelementptr inbounds nuw %struct.trigger, ptr %23, i32 0, i32 6, !dbg !1082
  %25 = load i32, ptr %3, align 4, !dbg !1083
  %26 = sext i32 %25 to i64, !dbg !1081
  %27 = getelementptr inbounds [10 x i16], ptr %24, i64 0, i64 %26, !dbg !1081
  %28 = load i16, ptr %27, align 2, !dbg !1081
  %29 = sext i16 %28 to i64, !dbg !1084
  %30 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %29, !dbg !1084
  store ptr %30, ptr %5, align 8, !dbg !1079
    #dbg_declare(ptr %6, !1085, !DIExpression(), !1086)
  %31 = load i8, ptr %2, align 1, !dbg !1087
  %32 = sext i8 %31 to i64, !dbg !1088
  %33 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %32, !dbg !1088
  %34 = getelementptr inbounds nuw %struct.trigger, ptr %33, i32 0, i32 7, !dbg !1089
  %35 = load i32, ptr %3, align 4, !dbg !1090
  %36 = sext i32 %35 to i64, !dbg !1088
  %37 = getelementptr inbounds [10 x i16], ptr %34, i64 0, i64 %36, !dbg !1088
  %38 = load i16, ptr %37, align 2, !dbg !1088
  %39 = sext i16 %38 to i32, !dbg !1088
  store i32 %39, ptr %6, align 4, !dbg !1086
  %40 = load ptr, ptr %5, align 8, !dbg !1091
  %41 = load i32, ptr %6, align 4, !dbg !1092
  call void @_Z17wall_illusion_offP7segmenti(ptr noundef %40, i32 noundef %41), !dbg !1093
  %42 = load i8, ptr %2, align 1, !dbg !1094
  %43 = sext i8 %42 to i32, !dbg !1094
  %44 = load i8, ptr %2, align 1, !dbg !1094
  %45 = sext i8 %44 to i64, !dbg !1094
  %46 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %45, !dbg !1094
  %47 = getelementptr inbounds nuw %struct.trigger, ptr %46, i32 0, i32 6, !dbg !1094
  %48 = load i32, ptr %3, align 4, !dbg !1094
  %49 = sext i32 %48 to i64, !dbg !1094
  %50 = getelementptr inbounds [10 x i16], ptr %47, i64 0, i64 %49, !dbg !1094
  %51 = load i16, ptr %50, align 2, !dbg !1094
  %52 = sext i16 %51 to i32, !dbg !1094
  %53 = load i8, ptr %2, align 1, !dbg !1094
  %54 = sext i8 %53 to i64, !dbg !1094
  %55 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %54, !dbg !1094
  %56 = getelementptr inbounds nuw %struct.trigger, ptr %55, i32 0, i32 7, !dbg !1094
  %57 = load i32, ptr %3, align 4, !dbg !1094
  %58 = sext i32 %57 to i64, !dbg !1094
  %59 = getelementptr inbounds [10 x i16], ptr %56, i64 0, i64 %58, !dbg !1094
  %60 = load i16, ptr %59, align 2, !dbg !1094
  %61 = sext i16 %60 to i32, !dbg !1094
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.1, i32 noundef %43, i32 noundef %52, i32 noundef %61), !dbg !1094
  %62 = load ptr, ptr %5, align 8, !dbg !1095
  %63 = load i32, ptr %6, align 4, !dbg !1096
  call void @_Z28compute_center_point_on_sideP10vms_vectorP7segmenti(ptr noundef %4, ptr noundef %62, i32 noundef %63), !dbg !1097
  %64 = load ptr, ptr %5, align 8, !dbg !1098
  %65 = ptrtoint ptr %64 to i64, !dbg !1099
  %66 = sub i64 %65, ptrtoint (ptr @Segments to i64), !dbg !1099
  %67 = sdiv exact i64 %66, 512, !dbg !1099
  %68 = trunc i64 %67 to i16, !dbg !1098
  %69 = load i32, ptr %6, align 4, !dbg !1100
  %70 = trunc i32 %69 to i16, !dbg !1100
  %71 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef 246, i16 noundef signext %68, i16 noundef signext %70, ptr noundef %4, i32 noundef 0, i32 noundef 65536), !dbg !1101
  br label %72, !dbg !1102

72:                                               ; preds = %20
  %73 = load i32, ptr %3, align 4, !dbg !1103
  %74 = add nsw i32 %73, 1, !dbg !1103
  store i32 %74, ptr %3, align 4, !dbg !1103
  br label %11, !dbg !1104, !llvm.loop !1105

75:                                               ; preds = %11
  br label %76, !dbg !1107

76:                                               ; preds = %75, %1
  ret void, !dbg !1108
}

declare void @_Z17wall_illusion_offP7segmenti(ptr noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define noundef i32 @_Z18wall_is_forcefieldP7trigger(ptr noundef %0) #2 !dbg !1109 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !1113, !DIExpression(), !1114)
    #dbg_declare(ptr %3, !1115, !DIExpression(), !1116)
  store i32 0, ptr %3, align 4, !dbg !1117
  br label %4, !dbg !1119

4:                                                ; preds = %40, %1
  %5 = load i32, ptr %3, align 4, !dbg !1120
  %6 = load ptr, ptr %2, align 8, !dbg !1122
  %7 = getelementptr inbounds nuw %struct.trigger, ptr %6, i32 0, i32 2, !dbg !1123
  %8 = load i8, ptr %7, align 2, !dbg !1123
  %9 = sext i8 %8 to i32, !dbg !1122
  %10 = icmp slt i32 %5, %9, !dbg !1124
  br i1 %10, label %11, label %43, !dbg !1125

11:                                               ; preds = %4
  %12 = load ptr, ptr %2, align 8, !dbg !1126
  %13 = getelementptr inbounds nuw %struct.trigger, ptr %12, i32 0, i32 6, !dbg !1128
  %14 = load i32, ptr %3, align 4, !dbg !1129
  %15 = sext i32 %14 to i64, !dbg !1126
  %16 = getelementptr inbounds [10 x i16], ptr %13, i64 0, i64 %15, !dbg !1126
  %17 = load i16, ptr %16, align 2, !dbg !1126
  %18 = sext i16 %17 to i64, !dbg !1130
  %19 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %18, !dbg !1130
  %20 = getelementptr inbounds nuw %struct.segment, ptr %19, i32 0, i32 0, !dbg !1131
  %21 = load ptr, ptr %2, align 8, !dbg !1132
  %22 = getelementptr inbounds nuw %struct.trigger, ptr %21, i32 0, i32 7, !dbg !1133
  %23 = load i32, ptr %3, align 4, !dbg !1134
  %24 = sext i32 %23 to i64, !dbg !1132
  %25 = getelementptr inbounds [10 x i16], ptr %22, i64 0, i64 %24, !dbg !1132
  %26 = load i16, ptr %25, align 2, !dbg !1132
  %27 = sext i16 %26 to i64, !dbg !1130
  %28 = getelementptr inbounds [6 x %struct.side], ptr %20, i64 0, i64 %27, !dbg !1130
  %29 = getelementptr inbounds nuw %struct.side, ptr %28, i32 0, i32 3, !dbg !1135
  %30 = load i16, ptr %29, align 4, !dbg !1135
  %31 = sext i16 %30 to i64, !dbg !1136
  %32 = getelementptr inbounds [1200 x %struct.tmap_info], ptr @TmapInfo, i64 0, i64 %31, !dbg !1136
  %33 = getelementptr inbounds nuw %struct.tmap_info, ptr %32, i32 0, i32 0, !dbg !1137
  %34 = load i8, ptr %33, align 4, !dbg !1137
  %35 = zext i8 %34 to i32, !dbg !1136
  %36 = and i32 %35, 4, !dbg !1138
  %37 = icmp ne i32 %36, 0, !dbg !1139
  br i1 %37, label %38, label %39, !dbg !1139

38:                                               ; preds = %11
  br label %44, !dbg !1140

39:                                               ; preds = %11
  br label %40, !dbg !1141

40:                                               ; preds = %39
  %41 = load i32, ptr %3, align 4, !dbg !1142
  %42 = add nsw i32 %41, 1, !dbg !1142
  store i32 %42, ptr %3, align 4, !dbg !1142
  br label %4, !dbg !1143, !llvm.loop !1144

43:                                               ; preds = %4
  br label %44, !dbg !1146

44:                                               ; preds = %43, %38
  %45 = load i32, ptr %3, align 4, !dbg !1146
  %46 = load ptr, ptr %2, align 8, !dbg !1147
  %47 = getelementptr inbounds nuw %struct.trigger, ptr %46, i32 0, i32 2, !dbg !1148
  %48 = load i8, ptr %47, align 2, !dbg !1148
  %49 = sext i8 %48 to i32, !dbg !1147
  %50 = icmp slt i32 %45, %49, !dbg !1149
  %51 = zext i1 %50 to i32, !dbg !1150
  ret i32 %51, !dbg !1151
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z17check_trigger_subiii(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 !dbg !1152 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
    #dbg_declare(ptr %5, !1155, !DIExpression(), !1156)
  store i32 %1, ptr %6, align 4
    #dbg_declare(ptr %6, !1157, !DIExpression(), !1158)
  store i32 %2, ptr %7, align 4
    #dbg_declare(ptr %7, !1159, !DIExpression(), !1160)
    #dbg_declare(ptr %8, !1161, !DIExpression(), !1162)
  %10 = load i32, ptr %5, align 4, !dbg !1163
  %11 = sext i32 %10 to i64, !dbg !1164
  %12 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %11, !dbg !1164
  store ptr %12, ptr %8, align 8, !dbg !1162
  %13 = load i32, ptr %5, align 4, !dbg !1165
  %14 = load ptr, ptr %8, align 8, !dbg !1165
  %15 = getelementptr inbounds nuw %struct.trigger, ptr %14, i32 0, i32 0, !dbg !1165
  %16 = load i8, ptr %15, align 4, !dbg !1165
  %17 = zext i8 %16 to i32, !dbg !1165
  %18 = load i32, ptr %7, align 4, !dbg !1165
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.20, i32 noundef %13, i32 noundef %17, i32 noundef %18), !dbg !1165
  %19 = load ptr, ptr %8, align 8, !dbg !1166
  %20 = getelementptr inbounds nuw %struct.trigger, ptr %19, i32 0, i32 1, !dbg !1168
  %21 = load i8, ptr %20, align 1, !dbg !1168
  %22 = zext i8 %21 to i32, !dbg !1166
  %23 = and i32 %22, 4, !dbg !1169
  %24 = icmp ne i32 %23, 0, !dbg !1166
  br i1 %24, label %25, label %26, !dbg !1166

25:                                               ; preds = %3
  store i32 1, ptr %4, align 4, !dbg !1170
  br label %231, !dbg !1170

26:                                               ; preds = %3
  %27 = load ptr, ptr %8, align 8, !dbg !1171
  %28 = getelementptr inbounds nuw %struct.trigger, ptr %27, i32 0, i32 1, !dbg !1173
  %29 = load i8, ptr %28, align 1, !dbg !1173
  %30 = zext i8 %29 to i32, !dbg !1171
  %31 = and i32 %30, 2, !dbg !1174
  %32 = icmp ne i32 %31, 0, !dbg !1171
  br i1 %32, label %33, label %40, !dbg !1171

33:                                               ; preds = %26
  %34 = load ptr, ptr %8, align 8, !dbg !1175
  %35 = getelementptr inbounds nuw %struct.trigger, ptr %34, i32 0, i32 1, !dbg !1176
  %36 = load i8, ptr %35, align 1, !dbg !1177
  %37 = zext i8 %36 to i32, !dbg !1177
  %38 = or i32 %37, 4, !dbg !1177
  %39 = trunc i32 %38 to i8, !dbg !1177
  store i8 %39, ptr %35, align 1, !dbg !1177
  br label %40, !dbg !1175

40:                                               ; preds = %33, %26
  %41 = load ptr, ptr %8, align 8, !dbg !1178
  %42 = getelementptr inbounds nuw %struct.trigger, ptr %41, i32 0, i32 0, !dbg !1179
  %43 = load i8, ptr %42, align 4, !dbg !1179
  %44 = zext i8 %43 to i32, !dbg !1178
  switch i32 %44, label %229 [
    i32 3, label %45
    i32 4, label %72
    i32 0, label %119
    i32 1, label %125
    i32 7, label %131
    i32 8, label %137
    i32 9, label %143
    i32 10, label %162
    i32 11, label %181
    i32 2, label %185
    i32 6, label %197
    i32 5, label %203
    i32 12, label %209
    i32 13, label %219
  ], !dbg !1180

45:                                               ; preds = %40
  %46 = load i32, ptr %6, align 4, !dbg !1181
  %47 = load i32, ptr @Player_num, align 4, !dbg !1184
  %48 = icmp ne i32 %46, %47, !dbg !1185
  br i1 %48, label %49, label %50, !dbg !1185

49:                                               ; preds = %45
  br label %230, !dbg !1186

50:                                               ; preds = %45
  call void @_Z13digi_stop_allv(), !dbg !1187
  %51 = load i32, ptr @Current_level_num, align 4, !dbg !1188
  %52 = icmp sgt i32 %51, 0, !dbg !1190
  br i1 %52, label %53, label %54, !dbg !1190

53:                                               ; preds = %50
  call void @_Z23start_endlevel_sequencev(), !dbg !1191
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.21), !dbg !1193
  br label %71, !dbg !1194

54:                                               ; preds = %50
  %55 = load i32, ptr @Current_level_num, align 4, !dbg !1195
  %56 = icmp slt i32 %55, 0, !dbg !1197
  br i1 %56, label %57, label %69, !dbg !1197

57:                                               ; preds = %54
  %58 = load i32, ptr @Player_num, align 4, !dbg !1198
  %59 = sext i32 %58 to i64, !dbg !1201
  %60 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %59, !dbg !1201
  %61 = getelementptr inbounds nuw %struct.player, ptr %60, i32 0, i32 9, !dbg !1202
  %62 = load i32, ptr %61, align 4, !dbg !1202
  %63 = icmp slt i32 %62, 0, !dbg !1203
  br i1 %63, label %67, label %64, !dbg !1204

64:                                               ; preds = %57
  %65 = load i32, ptr @Player_is_dead, align 4, !dbg !1205
  %66 = icmp ne i32 %65, 0, !dbg !1205
  br i1 %66, label %67, label %68, !dbg !1204

67:                                               ; preds = %64, %57
  br label %230, !dbg !1206

68:                                               ; preds = %64
  call void @_Z15ExitSecretLevelv(), !dbg !1207
  store i32 1, ptr %4, align 4, !dbg !1208
  br label %231, !dbg !1208

69:                                               ; preds = %54
  call void @_Z4Int3v(), !dbg !1209
  br label %70

70:                                               ; preds = %69
  br label %71

71:                                               ; preds = %70, %53
  store i32 1, ptr %4, align 4, !dbg !1211
  br label %231, !dbg !1211

72:                                               ; preds = %40
    #dbg_declare(ptr %9, !1212, !DIExpression(), !1214)
  %73 = load i32, ptr @CurrentDataVersion, align 4, !dbg !1215
  %74 = icmp eq i32 %73, 0, !dbg !1217
  br i1 %74, label %75, label %77, !dbg !1217

75:                                               ; preds = %72
  %76 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.22), !dbg !1218
  call void @_Z16digi_play_sampleii(i32 noundef 156, i32 noundef 65536), !dbg !1220
  br label %230, !dbg !1221

77:                                               ; preds = %72
  %78 = load i32, ptr %6, align 4, !dbg !1222
  %79 = load i32, ptr @Player_num, align 4, !dbg !1224
  %80 = icmp ne i32 %78, %79, !dbg !1225
  br i1 %80, label %81, label %82, !dbg !1225

81:                                               ; preds = %77
  br label %230, !dbg !1226

82:                                               ; preds = %77
  %83 = load i32, ptr @Player_num, align 4, !dbg !1227
  %84 = sext i32 %83 to i64, !dbg !1229
  %85 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %84, !dbg !1229
  %86 = getelementptr inbounds nuw %struct.player, ptr %85, i32 0, i32 9, !dbg !1230
  %87 = load i32, ptr %86, align 4, !dbg !1230
  %88 = icmp slt i32 %87, 0, !dbg !1231
  br i1 %88, label %92, label %89, !dbg !1232

89:                                               ; preds = %82
  %90 = load i32, ptr @Player_is_dead, align 4, !dbg !1233
  %91 = icmp ne i32 %90, 0, !dbg !1233
  br i1 %91, label %92, label %93, !dbg !1232

92:                                               ; preds = %89, %82
  br label %230, !dbg !1234

93:                                               ; preds = %89
  %94 = load i32, ptr @Game_mode, align 4, !dbg !1235
  %95 = and i32 %94, 38, !dbg !1237
  %96 = icmp ne i32 %95, 0, !dbg !1235
  br i1 %96, label %97, label %99, !dbg !1235

97:                                               ; preds = %93
  %98 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.23), !dbg !1238
  call void @_Z16digi_play_sampleii(i32 noundef 156, i32 noundef 65536), !dbg !1240
  br label %230, !dbg !1241

99:                                               ; preds = %93
  %100 = call noundef i32 @_Z24p_secret_level_destroyedv(), !dbg !1242
  store i32 %100, ptr %9, align 4, !dbg !1243
  %101 = load i32, ptr @Newdemo_state, align 4, !dbg !1244
  %102 = icmp eq i32 %101, 1, !dbg !1246
  br i1 %102, label %103, label %105, !dbg !1246

103:                                              ; preds = %99
  %104 = load i32, ptr %9, align 4, !dbg !1247
  call void @_Z32newdemo_record_secret_exit_blowni(i32 noundef %104), !dbg !1248
  br label %105, !dbg !1248

105:                                              ; preds = %103, %99
  %106 = load i32, ptr @Newdemo_state, align 4, !dbg !1249
  %107 = icmp ne i32 %106, 2, !dbg !1251
  br i1 %107, label %108, label %113, !dbg !1252

108:                                              ; preds = %105
  %109 = load i32, ptr %9, align 4, !dbg !1253
  %110 = icmp ne i32 %109, 0, !dbg !1253
  br i1 %110, label %111, label %113, !dbg !1252

111:                                              ; preds = %108
  %112 = call noundef i32 (ptr, ...) @_Z16HUD_init_messagePKcz(ptr noundef @.str.24), !dbg !1254
  call void @_Z16digi_play_sampleii(i32 noundef 156, i32 noundef 65536), !dbg !1256
  br label %230, !dbg !1257

113:                                              ; preds = %108, %105
  %114 = load i32, ptr @Newdemo_state, align 4, !dbg !1258
  %115 = icmp eq i32 %114, 1, !dbg !1260
  br i1 %115, label %116, label %117, !dbg !1260

116:                                              ; preds = %113
  store i32 3, ptr @Newdemo_state, align 4, !dbg !1261
  br label %117, !dbg !1262

117:                                              ; preds = %116, %113
  call void @_Z13digi_stop_allv(), !dbg !1263
  call void @_Z16digi_play_sampleii(i32 noundef 249, i32 noundef 65536), !dbg !1264
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.25), !dbg !1265
  %118 = call noundef i32 @_Z19gr_palette_fade_outPhii(ptr noundef @gr_palette, i32 noundef 32, i32 noundef 0), !dbg !1266
  call void @_Z16EnterSecretLevelv(), !dbg !1267
  store i32 0, ptr @Control_center_destroyed, align 4, !dbg !1268
  store i32 1, ptr %4, align 4, !dbg !1269
  br label %231, !dbg !1269

119:                                              ; preds = %40
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.26), !dbg !1270
  %120 = load i32, ptr %5, align 4, !dbg !1271
  %121 = trunc i32 %120 to i8, !dbg !1271
  call void @_Z7do_linka(i8 noundef signext %121), !dbg !1272
  %122 = load i32, ptr %6, align 4, !dbg !1273
  %123 = load i32, ptr %5, align 4, !dbg !1274
  %124 = load i32, ptr %7, align 4, !dbg !1275
  call void @_Z21print_trigger_messageiiiPKc(i32 noundef %122, i32 noundef %123, i32 noundef %124, ptr noundef @.str.27), !dbg !1276
  br label %230, !dbg !1277

125:                                              ; preds = %40
  %126 = load i32, ptr %5, align 4, !dbg !1278
  %127 = trunc i32 %126 to i8, !dbg !1278
  call void @_Z13do_close_doora(i8 noundef signext %127), !dbg !1279
  %128 = load i32, ptr %6, align 4, !dbg !1280
  %129 = load i32, ptr %5, align 4, !dbg !1281
  %130 = load i32, ptr %7, align 4, !dbg !1282
  call void @_Z21print_trigger_messageiiiPKc(i32 noundef %128, i32 noundef %129, i32 noundef %130, ptr noundef @.str.28), !dbg !1283
  br label %230, !dbg !1284

131:                                              ; preds = %40
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.26), !dbg !1285
  %132 = load i32, ptr %5, align 4, !dbg !1286
  %133 = trunc i32 %132 to i8, !dbg !1286
  call void @_Z15do_unlock_doorsa(i8 noundef signext %133), !dbg !1287
  %134 = load i32, ptr %6, align 4, !dbg !1288
  %135 = load i32, ptr %5, align 4, !dbg !1289
  %136 = load i32, ptr %7, align 4, !dbg !1290
  call void @_Z21print_trigger_messageiiiPKc(i32 noundef %134, i32 noundef %135, i32 noundef %136, ptr noundef @.str.29), !dbg !1291
  br label %230, !dbg !1292

137:                                              ; preds = %40
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.26), !dbg !1293
  %138 = load i32, ptr %5, align 4, !dbg !1294
  %139 = trunc i32 %138 to i8, !dbg !1294
  call void @_Z13do_lock_doorsa(i8 noundef signext %139), !dbg !1295
  %140 = load i32, ptr %6, align 4, !dbg !1296
  %141 = load i32, ptr %5, align 4, !dbg !1297
  %142 = load i32, ptr %7, align 4, !dbg !1298
  call void @_Z21print_trigger_messageiiiPKc(i32 noundef %140, i32 noundef %141, i32 noundef %142, ptr noundef @.str.30), !dbg !1299
  br label %230, !dbg !1300

143:                                              ; preds = %40
  %144 = load i32, ptr %5, align 4, !dbg !1301
  %145 = trunc i32 %144 to i8, !dbg !1301
  %146 = call noundef i32 @_Z15do_change_wallsa(i8 noundef signext %145), !dbg !1303
  %147 = icmp ne i32 %146, 0, !dbg !1303
  br i1 %147, label %148, label %161, !dbg !1303

148:                                              ; preds = %143
  %149 = load ptr, ptr %8, align 8, !dbg !1304
  %150 = call noundef i32 @_Z18wall_is_forcefieldP7trigger(ptr noundef %149), !dbg !1306
  %151 = icmp ne i32 %150, 0, !dbg !1306
  br i1 %151, label %152, label %156, !dbg !1306

152:                                              ; preds = %148
  %153 = load i32, ptr %6, align 4, !dbg !1307
  %154 = load i32, ptr %5, align 4, !dbg !1308
  %155 = load i32, ptr %7, align 4, !dbg !1309
  call void @_Z21print_trigger_messageiiiPKc(i32 noundef %153, i32 noundef %154, i32 noundef %155, ptr noundef @.str.31), !dbg !1310
  br label %160, !dbg !1310

156:                                              ; preds = %148
  %157 = load i32, ptr %6, align 4, !dbg !1311
  %158 = load i32, ptr %5, align 4, !dbg !1312
  %159 = load i32, ptr %7, align 4, !dbg !1313
  call void @_Z21print_trigger_messageiiiPKc(i32 noundef %157, i32 noundef %158, i32 noundef %159, ptr noundef @.str.32), !dbg !1314
  br label %160

160:                                              ; preds = %156, %152
  br label %161, !dbg !1315

161:                                              ; preds = %160, %143
  br label %230, !dbg !1316

162:                                              ; preds = %40
  %163 = load i32, ptr %5, align 4, !dbg !1317
  %164 = trunc i32 %163 to i8, !dbg !1317
  %165 = call noundef i32 @_Z15do_change_wallsa(i8 noundef signext %164), !dbg !1319
  %166 = icmp ne i32 %165, 0, !dbg !1319
  br i1 %166, label %167, label %180, !dbg !1319

167:                                              ; preds = %162
  %168 = load ptr, ptr %8, align 8, !dbg !1320
  %169 = call noundef i32 @_Z18wall_is_forcefieldP7trigger(ptr noundef %168), !dbg !1322
  %170 = icmp ne i32 %169, 0, !dbg !1322
  br i1 %170, label %171, label %175, !dbg !1322

171:                                              ; preds = %167
  %172 = load i32, ptr %6, align 4, !dbg !1323
  %173 = load i32, ptr %5, align 4, !dbg !1324
  %174 = load i32, ptr %7, align 4, !dbg !1325
  call void @_Z21print_trigger_messageiiiPKc(i32 noundef %172, i32 noundef %173, i32 noundef %174, ptr noundef @.str.33), !dbg !1326
  br label %179, !dbg !1326

175:                                              ; preds = %167
  %176 = load i32, ptr %6, align 4, !dbg !1327
  %177 = load i32, ptr %5, align 4, !dbg !1328
  %178 = load i32, ptr %7, align 4, !dbg !1329
  call void @_Z21print_trigger_messageiiiPKc(i32 noundef %176, i32 noundef %177, i32 noundef %178, ptr noundef @.str.34), !dbg !1330
  br label %179

179:                                              ; preds = %175, %171
  br label %180, !dbg !1331

180:                                              ; preds = %179, %162
  br label %230, !dbg !1332

181:                                              ; preds = %40
  %182 = load i32, ptr %5, align 4, !dbg !1333
  %183 = trunc i32 %182 to i8, !dbg !1333
  %184 = call noundef i32 @_Z15do_change_wallsa(i8 noundef signext %183), !dbg !1334
  br label %230, !dbg !1335

185:                                              ; preds = %40
  %186 = load i32, ptr @Game_mode, align 4, !dbg !1336
  %187 = and i32 %186, 38, !dbg !1338
  %188 = icmp ne i32 %187, 0, !dbg !1339
  br i1 %188, label %189, label %193, !dbg !1340

189:                                              ; preds = %185
  %190 = load i32, ptr @Game_mode, align 4, !dbg !1341
  %191 = and i32 %190, 8, !dbg !1342
  %192 = icmp ne i32 %191, 0, !dbg !1343
  br i1 %192, label %193, label %196, !dbg !1340

193:                                              ; preds = %189, %185
  %194 = load i32, ptr %5, align 4, !dbg !1344
  %195 = trunc i32 %194 to i8, !dbg !1344
  call void @_Z9do_matcena(i8 noundef signext %195), !dbg !1345
  br label %196, !dbg !1345

196:                                              ; preds = %193, %189
  br label %230, !dbg !1346

197:                                              ; preds = %40
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.35), !dbg !1347
  %198 = load i32, ptr %5, align 4, !dbg !1348
  %199 = trunc i32 %198 to i8, !dbg !1348
  call void @_Z8do_il_ona(i8 noundef signext %199), !dbg !1349
  %200 = load i32, ptr %6, align 4, !dbg !1350
  %201 = load i32, ptr %5, align 4, !dbg !1351
  %202 = load i32, ptr %7, align 4, !dbg !1352
  call void @_Z21print_trigger_messageiiiPKc(i32 noundef %200, i32 noundef %201, i32 noundef %202, ptr noundef @.str.36), !dbg !1353
  br label %230, !dbg !1354

203:                                              ; preds = %40
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.37), !dbg !1355
  %204 = load i32, ptr %5, align 4, !dbg !1356
  %205 = trunc i32 %204 to i8, !dbg !1356
  call void @_Z9do_il_offa(i8 noundef signext %205), !dbg !1357
  %206 = load i32, ptr %6, align 4, !dbg !1358
  %207 = load i32, ptr %5, align 4, !dbg !1359
  %208 = load i32, ptr %7, align 4, !dbg !1360
  call void @_Z21print_trigger_messageiiiPKc(i32 noundef %206, i32 noundef %207, i32 noundef %208, ptr noundef @.str.38), !dbg !1361
  br label %230, !dbg !1362

209:                                              ; preds = %40
  %210 = load i32, ptr %5, align 4, !dbg !1363
  %211 = trunc i32 %210 to i8, !dbg !1363
  %212 = call noundef i32 @_Z12do_light_offa(i8 noundef signext %211), !dbg !1365
  %213 = icmp ne i32 %212, 0, !dbg !1365
  br i1 %213, label %214, label %218, !dbg !1365

214:                                              ; preds = %209
  %215 = load i32, ptr %6, align 4, !dbg !1366
  %216 = load i32, ptr %5, align 4, !dbg !1367
  %217 = load i32, ptr %7, align 4, !dbg !1368
  call void @_Z21print_trigger_messageiiiPKc(i32 noundef %215, i32 noundef %216, i32 noundef %217, ptr noundef @.str.39), !dbg !1369
  br label %218, !dbg !1369

218:                                              ; preds = %214, %209
  br label %230, !dbg !1370

219:                                              ; preds = %40
  %220 = load i32, ptr %5, align 4, !dbg !1371
  %221 = trunc i32 %220 to i8, !dbg !1371
  %222 = call noundef i32 @_Z11do_light_ona(i8 noundef signext %221), !dbg !1373
  %223 = icmp ne i32 %222, 0, !dbg !1373
  br i1 %223, label %224, label %228, !dbg !1373

224:                                              ; preds = %219
  %225 = load i32, ptr %6, align 4, !dbg !1374
  %226 = load i32, ptr %5, align 4, !dbg !1375
  %227 = load i32, ptr %7, align 4, !dbg !1376
  call void @_Z21print_trigger_messageiiiPKc(i32 noundef %225, i32 noundef %226, i32 noundef %227, ptr noundef @.str.40), !dbg !1377
  br label %228, !dbg !1377

228:                                              ; preds = %224, %219
  br label %230, !dbg !1378

229:                                              ; preds = %40
  call void @_Z4Int3v(), !dbg !1379
  br label %230, !dbg !1380

230:                                              ; preds = %229, %228, %218, %203, %197, %196, %181, %180, %161, %137, %131, %125, %119, %111, %97, %92, %81, %75, %67, %49
  store i32 0, ptr %4, align 4, !dbg !1381
  br label %231, !dbg !1381

231:                                              ; preds = %230, %117, %71, %68, %25
  %232 = load i32, ptr %4, align 4, !dbg !1382
  ret i32 %232, !dbg !1382
}

declare void @_Z13digi_stop_allv() #1

declare void @_Z23start_endlevel_sequencev() #1

declare void @_Z15ExitSecretLevelv() #1

declare void @_Z4Int3v() #1

declare void @_Z16digi_play_sampleii(i32 noundef, i32 noundef) #1

declare noundef i32 @_Z24p_secret_level_destroyedv() #1

declare void @_Z32newdemo_record_secret_exit_blowni(i32 noundef) #1

declare noundef i32 @_Z19gr_palette_fade_outPhii(ptr noundef, i32 noundef, i32 noundef) #1

declare void @_Z16EnterSecretLevelv() #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z13check_triggerP7segmentssi(ptr noundef %0, i16 noundef signext %1, i16 noundef signext %2, i32 noundef %3) #0 !dbg !1383 {
  %5 = alloca ptr, align 8
  %6 = alloca i16, align 2
  %7 = alloca i16, align 2
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
    #dbg_declare(ptr %5, !1386, !DIExpression(), !1387)
  store i16 %1, ptr %6, align 2
    #dbg_declare(ptr %6, !1388, !DIExpression(), !1389)
  store i16 %2, ptr %7, align 2
    #dbg_declare(ptr %7, !1390, !DIExpression(), !1391)
  store i32 %3, ptr %8, align 4
    #dbg_declare(ptr %8, !1392, !DIExpression(), !1393)
    #dbg_declare(ptr %9, !1394, !DIExpression(), !1395)
    #dbg_declare(ptr %10, !1396, !DIExpression(), !1397)
  %11 = load i16, ptr %7, align 2, !dbg !1398
  %12 = sext i16 %11 to i32, !dbg !1398
  %13 = load i32, ptr @Player_num, align 4, !dbg !1400
  %14 = sext i32 %13 to i64, !dbg !1401
  %15 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %14, !dbg !1401
  %16 = getelementptr inbounds nuw %struct.player, ptr %15, i32 0, i32 4, !dbg !1402
  %17 = load i32, ptr %16, align 4, !dbg !1402
  %18 = icmp eq i32 %12, %17, !dbg !1403
  br i1 %18, label %38, label %19, !dbg !1404

19:                                               ; preds = %4
  %20 = load i16, ptr %7, align 2, !dbg !1405
  %21 = sext i16 %20 to i64, !dbg !1406
  %22 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %21, !dbg !1406
  %23 = getelementptr inbounds nuw %struct.object, ptr %22, i32 0, i32 1, !dbg !1407
  %24 = load i8, ptr %23, align 4, !dbg !1407
  %25 = zext i8 %24 to i32, !dbg !1406
  %26 = icmp eq i32 %25, 2, !dbg !1408
  br i1 %26, label %27, label %82, !dbg !1409

27:                                               ; preds = %19
  %28 = load i16, ptr %7, align 2, !dbg !1410
  %29 = sext i16 %28 to i64, !dbg !1411
  %30 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %29, !dbg !1411
  %31 = getelementptr inbounds nuw %struct.object, ptr %30, i32 0, i32 2, !dbg !1412
  %32 = load i8, ptr %31, align 1, !dbg !1412
  %33 = zext i8 %32 to i64, !dbg !1413
  %34 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %33, !dbg !1413
  %35 = getelementptr inbounds nuw %struct.robot_info, ptr %34, i32 0, i32 37, !dbg !1414
  %36 = load i8, ptr %35, align 1, !dbg !1414
  %37 = icmp ne i8 %36, 0, !dbg !1415
  br i1 %37, label %38, label %82, !dbg !1404

38:                                               ; preds = %27, %4
  %39 = load i32, ptr @Newdemo_state, align 4, !dbg !1416
  %40 = icmp eq i32 %39, 1, !dbg !1419
  br i1 %40, label %41, label %52, !dbg !1419

41:                                               ; preds = %38
  %42 = load ptr, ptr %5, align 8, !dbg !1420
  %43 = ptrtoint ptr %42 to i64, !dbg !1421
  %44 = sub i64 %43, ptrtoint (ptr @Segments to i64), !dbg !1421
  %45 = sdiv exact i64 %44, 512, !dbg !1421
  %46 = trunc i64 %45 to i32, !dbg !1420
  %47 = load i16, ptr %6, align 2, !dbg !1422
  %48 = sext i16 %47 to i32, !dbg !1422
  %49 = load i16, ptr %7, align 2, !dbg !1423
  %50 = sext i16 %49 to i32, !dbg !1423
  %51 = load i32, ptr %8, align 4, !dbg !1424
  call void @_Z22newdemo_record_triggeriiii(i32 noundef %46, i32 noundef %48, i32 noundef %50, i32 noundef %51), !dbg !1425
  br label %52, !dbg !1425

52:                                               ; preds = %41, %38
  %53 = load ptr, ptr %5, align 8, !dbg !1426
  %54 = getelementptr inbounds nuw %struct.segment, ptr %53, i32 0, i32 0, !dbg !1427
  %55 = load i16, ptr %6, align 2, !dbg !1428
  %56 = sext i16 %55 to i64, !dbg !1426
  %57 = getelementptr inbounds [6 x %struct.side], ptr %54, i64 0, i64 %56, !dbg !1426
  %58 = getelementptr inbounds nuw %struct.side, ptr %57, i32 0, i32 2, !dbg !1429
  %59 = load i16, ptr %58, align 2, !dbg !1429
  %60 = sext i16 %59 to i32, !dbg !1426
  store i32 %60, ptr %9, align 4, !dbg !1430
  %61 = load i32, ptr %9, align 4, !dbg !1431
  %62 = icmp eq i32 %61, -1, !dbg !1433
  br i1 %62, label %63, label %64, !dbg !1433

63:                                               ; preds = %52
  br label %82, !dbg !1434

64:                                               ; preds = %52
  %65 = load i32, ptr %9, align 4, !dbg !1435
  %66 = sext i32 %65 to i64, !dbg !1436
  %67 = getelementptr inbounds [254 x %struct.wall], ptr @Walls, i64 0, i64 %66, !dbg !1436
  %68 = getelementptr inbounds nuw %struct.wall, ptr %67, i32 0, i32 7, !dbg !1437
  %69 = load i8, ptr %68, align 1, !dbg !1437
  %70 = sext i8 %69 to i32, !dbg !1436
  store i32 %70, ptr %10, align 4, !dbg !1438
  %71 = load i32, ptr %10, align 4, !dbg !1439
  %72 = icmp eq i32 %71, -1, !dbg !1441
  br i1 %72, label %73, label %74, !dbg !1441

73:                                               ; preds = %64
  br label %82, !dbg !1442

74:                                               ; preds = %64
  %75 = load i32, ptr %10, align 4, !dbg !1443
  %76 = load i32, ptr @Player_num, align 4, !dbg !1445
  %77 = load i32, ptr %8, align 4, !dbg !1446
  %78 = call noundef i32 @_Z17check_trigger_subiii(i32 noundef %75, i32 noundef %76, i32 noundef %77), !dbg !1447
  %79 = icmp ne i32 %78, 0, !dbg !1447
  br i1 %79, label %80, label %81, !dbg !1447

80:                                               ; preds = %74
  br label %82, !dbg !1448

81:                                               ; preds = %74
  br label %82, !dbg !1449

82:                                               ; preds = %63, %73, %80, %81, %27, %19
  ret void, !dbg !1450
}

declare void @_Z22newdemo_record_triggeriiii(i32 noundef, i32 noundef, i32 noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define void @_Z22triggers_frame_processv() #2 !dbg !1451 {
  %1 = alloca i32, align 4
    #dbg_declare(ptr %1, !1452, !DIExpression(), !1453)
  store i32 0, ptr %1, align 4, !dbg !1454
  br label %2, !dbg !1456

2:                                                ; preds = %22, %0
  %3 = load i32, ptr %1, align 4, !dbg !1457
  %4 = load i32, ptr @Num_triggers, align 4, !dbg !1459
  %5 = icmp slt i32 %3, %4, !dbg !1460
  br i1 %5, label %6, label %25, !dbg !1461

6:                                                ; preds = %2
  %7 = load i32, ptr %1, align 4, !dbg !1462
  %8 = sext i32 %7 to i64, !dbg !1464
  %9 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %8, !dbg !1464
  %10 = getelementptr inbounds nuw %struct.trigger, ptr %9, i32 0, i32 5, !dbg !1465
  %11 = load i32, ptr %10, align 4, !dbg !1465
  %12 = icmp sge i32 %11, 0, !dbg !1466
  br i1 %12, label %13, label %21, !dbg !1466

13:                                               ; preds = %6
  %14 = load i32, ptr @FrameTime, align 4, !dbg !1467
  %15 = load i32, ptr %1, align 4, !dbg !1468
  %16 = sext i32 %15 to i64, !dbg !1469
  %17 = getelementptr inbounds [100 x %struct.trigger], ptr @Triggers, i64 0, i64 %16, !dbg !1469
  %18 = getelementptr inbounds nuw %struct.trigger, ptr %17, i32 0, i32 5, !dbg !1470
  %19 = load i32, ptr %18, align 4, !dbg !1471
  %20 = sub nsw i32 %19, %14, !dbg !1471
  store i32 %20, ptr %18, align 4, !dbg !1471
  br label %21, !dbg !1469

21:                                               ; preds = %13, %6
  br label %22, !dbg !1472

22:                                               ; preds = %21
  %23 = load i32, ptr %1, align 4, !dbg !1473
  %24 = add nsw i32 %23, 1, !dbg !1473
  store i32 %24, ptr %1, align 4, !dbg !1473
  br label %2, !dbg !1474, !llvm.loop !1475

25:                                               ; preds = %2
  ret void, !dbg !1477
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z12read_triggerP7triggerP7__sFILE(ptr noundef %0, ptr noundef %1) #0 !dbg !1478 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !1534, !DIExpression(), !1535)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !1536, !DIExpression(), !1537)
    #dbg_declare(ptr %5, !1538, !DIExpression(), !1539)
  %6 = load ptr, ptr %4, align 8, !dbg !1540
  %7 = call noundef zeroext i8 @_Z14file_read_byteP7__sFILE(ptr noundef %6), !dbg !1541
  %8 = load ptr, ptr %3, align 8, !dbg !1542
  %9 = getelementptr inbounds nuw %struct.trigger, ptr %8, i32 0, i32 0, !dbg !1543
  store i8 %7, ptr %9, align 4, !dbg !1544
  %10 = load ptr, ptr %4, align 8, !dbg !1545
  %11 = call noundef zeroext i8 @_Z14file_read_byteP7__sFILE(ptr noundef %10), !dbg !1546
  %12 = load ptr, ptr %3, align 8, !dbg !1547
  %13 = getelementptr inbounds nuw %struct.trigger, ptr %12, i32 0, i32 1, !dbg !1548
  store i8 %11, ptr %13, align 1, !dbg !1549
  %14 = load ptr, ptr %4, align 8, !dbg !1550
  %15 = call noundef zeroext i8 @_Z14file_read_byteP7__sFILE(ptr noundef %14), !dbg !1551
  %16 = load ptr, ptr %3, align 8, !dbg !1552
  %17 = getelementptr inbounds nuw %struct.trigger, ptr %16, i32 0, i32 2, !dbg !1553
  store i8 %15, ptr %17, align 2, !dbg !1554
  %18 = load ptr, ptr %4, align 8, !dbg !1555
  %19 = call noundef zeroext i8 @_Z14file_read_byteP7__sFILE(ptr noundef %18), !dbg !1556
  %20 = load ptr, ptr %3, align 8, !dbg !1557
  %21 = getelementptr inbounds nuw %struct.trigger, ptr %20, i32 0, i32 3, !dbg !1558
  store i8 %19, ptr %21, align 1, !dbg !1559
  %22 = load ptr, ptr %4, align 8, !dbg !1560
  %23 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %22), !dbg !1561
  %24 = load ptr, ptr %3, align 8, !dbg !1562
  %25 = getelementptr inbounds nuw %struct.trigger, ptr %24, i32 0, i32 4, !dbg !1563
  store i32 %23, ptr %25, align 4, !dbg !1564
  %26 = load ptr, ptr %4, align 8, !dbg !1565
  %27 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %26), !dbg !1566
  %28 = load ptr, ptr %3, align 8, !dbg !1567
  %29 = getelementptr inbounds nuw %struct.trigger, ptr %28, i32 0, i32 5, !dbg !1568
  store i32 %27, ptr %29, align 4, !dbg !1569
  store i32 0, ptr %5, align 4, !dbg !1570
  br label %30, !dbg !1572

30:                                               ; preds = %41, %2
  %31 = load i32, ptr %5, align 4, !dbg !1573
  %32 = icmp slt i32 %31, 10, !dbg !1575
  br i1 %32, label %33, label %44, !dbg !1576

33:                                               ; preds = %30
  %34 = load ptr, ptr %4, align 8, !dbg !1577
  %35 = call noundef signext i16 @_Z15file_read_shortP7__sFILE(ptr noundef %34), !dbg !1578
  %36 = load ptr, ptr %3, align 8, !dbg !1579
  %37 = getelementptr inbounds nuw %struct.trigger, ptr %36, i32 0, i32 6, !dbg !1580
  %38 = load i32, ptr %5, align 4, !dbg !1581
  %39 = sext i32 %38 to i64, !dbg !1579
  %40 = getelementptr inbounds [10 x i16], ptr %37, i64 0, i64 %39, !dbg !1579
  store i16 %35, ptr %40, align 2, !dbg !1582
  br label %41, !dbg !1579

41:                                               ; preds = %33
  %42 = load i32, ptr %5, align 4, !dbg !1583
  %43 = add nsw i32 %42, 1, !dbg !1583
  store i32 %43, ptr %5, align 4, !dbg !1583
  br label %30, !dbg !1584, !llvm.loop !1585

44:                                               ; preds = %30
  store i32 0, ptr %5, align 4, !dbg !1587
  br label %45, !dbg !1589

45:                                               ; preds = %56, %44
  %46 = load i32, ptr %5, align 4, !dbg !1590
  %47 = icmp slt i32 %46, 10, !dbg !1592
  br i1 %47, label %48, label %59, !dbg !1593

48:                                               ; preds = %45
  %49 = load ptr, ptr %4, align 8, !dbg !1594
  %50 = call noundef signext i16 @_Z15file_read_shortP7__sFILE(ptr noundef %49), !dbg !1595
  %51 = load ptr, ptr %3, align 8, !dbg !1596
  %52 = getelementptr inbounds nuw %struct.trigger, ptr %51, i32 0, i32 7, !dbg !1597
  %53 = load i32, ptr %5, align 4, !dbg !1598
  %54 = sext i32 %53 to i64, !dbg !1596
  %55 = getelementptr inbounds [10 x i16], ptr %52, i64 0, i64 %54, !dbg !1596
  store i16 %50, ptr %55, align 2, !dbg !1599
  br label %56, !dbg !1596

56:                                               ; preds = %48
  %57 = load i32, ptr %5, align 4, !dbg !1600
  %58 = add nsw i32 %57, 1, !dbg !1600
  store i32 %58, ptr %5, align 4, !dbg !1600
  br label %45, !dbg !1601, !llvm.loop !1602

59:                                               ; preds = %45
  ret void, !dbg !1604
}

declare noundef zeroext i8 @_Z14file_read_byteP7__sFILE(ptr noundef) #1

declare noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef) #1

declare noundef signext i16 @_Z15file_read_shortP7__sFILE(ptr noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z13write_triggerP7triggerP7__sFILE(ptr noundef %0, ptr noundef %1) #0 !dbg !1605 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !1606, !DIExpression(), !1607)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !1608, !DIExpression(), !1609)
    #dbg_declare(ptr %5, !1610, !DIExpression(), !1611)
  %6 = load ptr, ptr %4, align 8, !dbg !1612
  %7 = load ptr, ptr %3, align 8, !dbg !1613
  %8 = getelementptr inbounds nuw %struct.trigger, ptr %7, i32 0, i32 0, !dbg !1614
  %9 = load i8, ptr %8, align 4, !dbg !1614
  call void @_Z15file_write_byteP7__sFILEh(ptr noundef %6, i8 noundef zeroext %9), !dbg !1615
  %10 = load ptr, ptr %4, align 8, !dbg !1616
  %11 = load ptr, ptr %3, align 8, !dbg !1617
  %12 = getelementptr inbounds nuw %struct.trigger, ptr %11, i32 0, i32 1, !dbg !1618
  %13 = load i8, ptr %12, align 1, !dbg !1618
  call void @_Z15file_write_byteP7__sFILEh(ptr noundef %10, i8 noundef zeroext %13), !dbg !1619
  %14 = load ptr, ptr %4, align 8, !dbg !1620
  %15 = load ptr, ptr %3, align 8, !dbg !1621
  %16 = getelementptr inbounds nuw %struct.trigger, ptr %15, i32 0, i32 2, !dbg !1622
  %17 = load i8, ptr %16, align 2, !dbg !1622
  call void @_Z15file_write_byteP7__sFILEh(ptr noundef %14, i8 noundef zeroext %17), !dbg !1623
  %18 = load ptr, ptr %4, align 8, !dbg !1624
  %19 = load ptr, ptr %3, align 8, !dbg !1625
  %20 = getelementptr inbounds nuw %struct.trigger, ptr %19, i32 0, i32 3, !dbg !1626
  %21 = load i8, ptr %20, align 1, !dbg !1626
  call void @_Z15file_write_byteP7__sFILEh(ptr noundef %18, i8 noundef zeroext %21), !dbg !1627
  %22 = load ptr, ptr %4, align 8, !dbg !1628
  %23 = load ptr, ptr %3, align 8, !dbg !1629
  %24 = getelementptr inbounds nuw %struct.trigger, ptr %23, i32 0, i32 4, !dbg !1630
  %25 = load i32, ptr %24, align 4, !dbg !1630
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %22, i32 noundef %25), !dbg !1631
  %26 = load ptr, ptr %4, align 8, !dbg !1632
  %27 = load ptr, ptr %3, align 8, !dbg !1633
  %28 = getelementptr inbounds nuw %struct.trigger, ptr %27, i32 0, i32 5, !dbg !1634
  %29 = load i32, ptr %28, align 4, !dbg !1634
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %26, i32 noundef %29), !dbg !1635
  store i32 0, ptr %5, align 4, !dbg !1636
  br label %30, !dbg !1638

30:                                               ; preds = %41, %2
  %31 = load i32, ptr %5, align 4, !dbg !1639
  %32 = icmp slt i32 %31, 10, !dbg !1641
  br i1 %32, label %33, label %44, !dbg !1642

33:                                               ; preds = %30
  %34 = load ptr, ptr %4, align 8, !dbg !1643
  %35 = load ptr, ptr %3, align 8, !dbg !1644
  %36 = getelementptr inbounds nuw %struct.trigger, ptr %35, i32 0, i32 6, !dbg !1645
  %37 = load i32, ptr %5, align 4, !dbg !1646
  %38 = sext i32 %37 to i64, !dbg !1644
  %39 = getelementptr inbounds [10 x i16], ptr %36, i64 0, i64 %38, !dbg !1644
  %40 = load i16, ptr %39, align 2, !dbg !1644
  call void @_Z16file_write_shortP7__sFILEs(ptr noundef %34, i16 noundef signext %40), !dbg !1647
  br label %41, !dbg !1647

41:                                               ; preds = %33
  %42 = load i32, ptr %5, align 4, !dbg !1648
  %43 = add nsw i32 %42, 1, !dbg !1648
  store i32 %43, ptr %5, align 4, !dbg !1648
  br label %30, !dbg !1649, !llvm.loop !1650

44:                                               ; preds = %30
  store i32 0, ptr %5, align 4, !dbg !1652
  br label %45, !dbg !1654

45:                                               ; preds = %56, %44
  %46 = load i32, ptr %5, align 4, !dbg !1655
  %47 = icmp slt i32 %46, 10, !dbg !1657
  br i1 %47, label %48, label %59, !dbg !1658

48:                                               ; preds = %45
  %49 = load ptr, ptr %4, align 8, !dbg !1659
  %50 = load ptr, ptr %3, align 8, !dbg !1660
  %51 = getelementptr inbounds nuw %struct.trigger, ptr %50, i32 0, i32 7, !dbg !1661
  %52 = load i32, ptr %5, align 4, !dbg !1662
  %53 = sext i32 %52 to i64, !dbg !1660
  %54 = getelementptr inbounds [10 x i16], ptr %51, i64 0, i64 %53, !dbg !1660
  %55 = load i16, ptr %54, align 2, !dbg !1660
  call void @_Z16file_write_shortP7__sFILEs(ptr noundef %49, i16 noundef signext %55), !dbg !1663
  br label %56, !dbg !1663

56:                                               ; preds = %48
  %57 = load i32, ptr %5, align 4, !dbg !1664
  %58 = add nsw i32 %57, 1, !dbg !1664
  store i32 %58, ptr %5, align 4, !dbg !1664
  br label %45, !dbg !1665, !llvm.loop !1666

59:                                               ; preds = %45
  ret void, !dbg !1668
}

declare void @_Z15file_write_byteP7__sFILEh(ptr noundef, i8 noundef zeroext) #1

declare void @_Z14file_write_intP7__sFILEi(ptr noundef, i32 noundef) #1

declare void @_Z16file_write_shortP7__sFILEs(ptr noundef, i16 noundef signext) #1

attributes #0 = { mustprogress noinline ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #2 = { mustprogress noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }

!llvm.module.flags = !{!286, !287, !288, !289, !290, !291, !292}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!293}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "Triggers", scope: !2, file: !17, line: 49, type: !266, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !3, producer: "Homebrew clang version 20.1.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !11, globals: !14, imports: !161, splitDebugInlining: false, nameTableKind: Apple, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk", sdk: "MacOSX15.sdk")
!3 = !DIFile(filename: "/Users/richard/code/ChocolateDescent/main_d2/switch.cpp", directory: "/Users/richard/code/ChocolateDescent/build-c-ref", checksumkind: CSK_MD5, checksum: "33d852d74a0659e7cb7559e01e65f808")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "DataVer", file: !6, line: 72, baseType: !7, size: 32, flags: DIFlagEnumClass, elements: !8, identifier: "_ZTS7DataVer")
!6 = !DIFile(filename: "main_d2/inferno.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "f9bd7760bcc54609c0547a3a7ca7ee90")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{!9, !10}
!9 = !DIEnumerator(name: "DEMO", value: 0)
!10 = !DIEnumerator(name: "FULL", value: 1)
!11 = !{!12}
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !{!0, !15, !18, !24, !29, !34, !39, !44, !46, !51, !53, !55, !57, !62, !67, !69, !71, !76, !81, !83, !88, !90, !92, !97, !102, !107, !112, !117, !122, !124, !126, !128, !133, !135, !140, !142, !144, !146, !148, !150, !152, !157, !159}
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "Num_triggers", scope: !2, file: !17, line: 50, type: !7, isLocal: false, isDefinition: true)
!17 = !DIFile(filename: "main_d2/switch.cpp", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "33d852d74a0659e7cb7559e01e65f808")
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(scope: null, file: !17, line: 85, type: !20, isLocal: true, isDefinition: true)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 96, elements: !22)
!21 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!22 = !{!23}
!23 = !DISubrange(count: 12)
!24 = !DIGlobalVariableExpression(var: !25, expr: !DIExpression())
!25 = distinct !DIGlobalVariable(scope: null, file: !17, line: 92, type: !26, isLocal: true, isDefinition: true)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 280, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 35)
!29 = !DIGlobalVariableExpression(var: !30, expr: !DIExpression())
!30 = distinct !DIGlobalVariable(scope: null, file: !17, line: 103, type: !31, isLocal: true, isDefinition: true)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 104, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 13)
!34 = !DIGlobalVariableExpression(var: !35, expr: !DIExpression())
!35 = distinct !DIGlobalVariable(scope: null, file: !17, line: 118, type: !36, isLocal: true, isDefinition: true)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 112, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 14)
!39 = !DIGlobalVariableExpression(var: !40, expr: !DIExpression())
!40 = distinct !DIGlobalVariable(scope: null, file: !17, line: 147, type: !41, isLocal: true, isDefinition: true)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 120, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 15)
!44 = !DIGlobalVariableExpression(var: !45, expr: !DIExpression())
!45 = distinct !DIGlobalVariable(scope: null, file: !17, line: 215, type: !36, isLocal: true, isDefinition: true)
!46 = !DIGlobalVariableExpression(var: !47, expr: !DIExpression())
!47 = distinct !DIGlobalVariable(scope: null, file: !17, line: 242, type: !48, isLocal: true, isDefinition: true)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 352, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 44)
!51 = !DIGlobalVariableExpression(var: !52, expr: !DIExpression())
!52 = distinct !DIGlobalVariable(scope: null, file: !17, line: 280, type: !20, isLocal: true, isDefinition: true)
!53 = !DIGlobalVariableExpression(var: !54, expr: !DIExpression())
!54 = distinct !DIGlobalVariable(scope: null, file: !17, line: 296, type: !36, isLocal: true, isDefinition: true)
!55 = !DIGlobalVariableExpression(var: !56, expr: !DIExpression())
!56 = distinct !DIGlobalVariable(scope: null, file: !17, line: 311, type: !20, isLocal: true, isDefinition: true)
!57 = !DIGlobalVariableExpression(var: !58, expr: !DIExpression())
!58 = distinct !DIGlobalVariable(scope: null, file: !17, line: 311, type: !59, isLocal: true, isDefinition: true)
!59 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 448, elements: !60)
!60 = !{!61}
!61 = !DISubrange(count: 56)
!62 = !DIGlobalVariableExpression(var: !63, expr: !DIExpression())
!63 = distinct !DIGlobalVariable(scope: null, file: !17, line: 332, type: !64, isLocal: true, isDefinition: true)
!64 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 88, elements: !65)
!65 = !{!66}
!66 = !DISubrange(count: 11)
!67 = !DIGlobalVariableExpression(var: !68, expr: !DIExpression())
!68 = distinct !DIGlobalVariable(scope: null, file: !17, line: 352, type: !20, isLocal: true, isDefinition: true)
!69 = !DIGlobalVariableExpression(var: !70, expr: !DIExpression())
!70 = distinct !DIGlobalVariable(scope: null, file: !17, line: 367, type: !41, isLocal: true, isDefinition: true)
!71 = !DIGlobalVariableExpression(var: !72, expr: !DIExpression())
!72 = distinct !DIGlobalVariable(scope: null, file: !17, line: 390, type: !73, isLocal: true, isDefinition: true)
!73 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 16, elements: !74)
!74 = !{!75}
!75 = !DISubrange(count: 2)
!76 = !DIGlobalVariableExpression(var: !77, expr: !DIExpression())
!77 = distinct !DIGlobalVariable(scope: null, file: !17, line: 390, type: !78, isLocal: true, isDefinition: true)
!78 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 8, elements: !79)
!79 = !{!80}
!80 = !DISubrange(count: 1)
!81 = !DIGlobalVariableExpression(var: !82, expr: !DIExpression())
!82 = distinct !DIGlobalVariable(scope: null, file: !17, line: 401, type: !36, isLocal: true, isDefinition: true)
!83 = !DIGlobalVariableExpression(var: !84, expr: !DIExpression())
!84 = distinct !DIGlobalVariable(scope: null, file: !17, line: 408, type: !85, isLocal: true, isDefinition: true)
!85 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 208, elements: !86)
!86 = !{!87}
!87 = !DISubrange(count: 26)
!88 = !DIGlobalVariableExpression(var: !89, expr: !DIExpression())
!89 = distinct !DIGlobalVariable(scope: null, file: !17, line: 440, type: !31, isLocal: true, isDefinition: true)
!90 = !DIGlobalVariableExpression(var: !91, expr: !DIExpression())
!91 = distinct !DIGlobalVariable(scope: null, file: !17, line: 478, type: !36, isLocal: true, isDefinition: true)
!92 = !DIGlobalVariableExpression(var: !93, expr: !DIExpression())
!93 = distinct !DIGlobalVariable(scope: null, file: !17, line: 519, type: !94, isLocal: true, isDefinition: true)
!94 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 224, elements: !95)
!95 = !{!96}
!96 = !DISubrange(count: 28)
!97 = !DIGlobalVariableExpression(var: !98, expr: !DIExpression())
!98 = distinct !DIGlobalVariable(scope: null, file: !17, line: 539, type: !99, isLocal: true, isDefinition: true)
!99 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 232, elements: !100)
!100 = !{!101}
!101 = !DISubrange(count: 29)
!102 = !DIGlobalVariableExpression(var: !103, expr: !DIExpression())
!103 = distinct !DIGlobalVariable(scope: null, file: !17, line: 564, type: !104, isLocal: true, isDefinition: true)
!104 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 408, elements: !105)
!105 = !{!106}
!106 = !DISubrange(count: 51)
!107 = !DIGlobalVariableExpression(var: !108, expr: !DIExpression())
!108 = distinct !DIGlobalVariable(scope: null, file: !17, line: 577, type: !109, isLocal: true, isDefinition: true)
!109 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 392, elements: !110)
!110 = !{!111}
!111 = !DISubrange(count: 49)
!112 = !DIGlobalVariableExpression(var: !113, expr: !DIExpression())
!113 = distinct !DIGlobalVariable(scope: null, file: !17, line: 589, type: !114, isLocal: true, isDefinition: true)
!114 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 320, elements: !115)
!115 = !{!116}
!116 = !DISubrange(count: 40)
!117 = !DIGlobalVariableExpression(var: !118, expr: !DIExpression())
!118 = distinct !DIGlobalVariable(scope: null, file: !17, line: 600, type: !119, isLocal: true, isDefinition: true)
!119 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 200, elements: !120)
!120 = !{!121}
!121 = !DISubrange(count: 25)
!122 = !DIGlobalVariableExpression(var: !123, expr: !DIExpression())
!123 = distinct !DIGlobalVariable(scope: null, file: !17, line: 611, type: !73, isLocal: true, isDefinition: true)
!124 = !DIGlobalVariableExpression(var: !125, expr: !DIExpression())
!125 = distinct !DIGlobalVariable(scope: null, file: !17, line: 613, type: !41, isLocal: true, isDefinition: true)
!126 = !DIGlobalVariableExpression(var: !127, expr: !DIExpression())
!127 = distinct !DIGlobalVariable(scope: null, file: !17, line: 619, type: !41, isLocal: true, isDefinition: true)
!128 = !DIGlobalVariableExpression(var: !129, expr: !DIExpression())
!129 = distinct !DIGlobalVariable(scope: null, file: !17, line: 625, type: !130, isLocal: true, isDefinition: true)
!130 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 136, elements: !131)
!131 = !{!132}
!132 = !DISubrange(count: 17)
!133 = !DIGlobalVariableExpression(var: !134, expr: !DIExpression())
!134 = distinct !DIGlobalVariable(scope: null, file: !17, line: 632, type: !41, isLocal: true, isDefinition: true)
!135 = !DIGlobalVariableExpression(var: !136, expr: !DIExpression())
!136 = distinct !DIGlobalVariable(scope: null, file: !17, line: 639, type: !137, isLocal: true, isDefinition: true)
!137 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 216, elements: !138)
!138 = !{!139}
!139 = !DISubrange(count: 27)
!140 = !DIGlobalVariableExpression(var: !141, expr: !DIExpression())
!141 = distinct !DIGlobalVariable(scope: null, file: !17, line: 641, type: !41, isLocal: true, isDefinition: true)
!142 = !DIGlobalVariableExpression(var: !143, expr: !DIExpression())
!143 = distinct !DIGlobalVariable(scope: null, file: !17, line: 647, type: !119, isLocal: true, isDefinition: true)
!144 = !DIGlobalVariableExpression(var: !145, expr: !DIExpression())
!145 = distinct !DIGlobalVariable(scope: null, file: !17, line: 649, type: !41, isLocal: true, isDefinition: true)
!146 = !DIGlobalVariableExpression(var: !147, expr: !DIExpression())
!147 = distinct !DIGlobalVariable(scope: null, file: !17, line: 663, type: !73, isLocal: true, isDefinition: true)
!148 = !DIGlobalVariableExpression(var: !149, expr: !DIExpression())
!149 = distinct !DIGlobalVariable(scope: null, file: !17, line: 665, type: !41, isLocal: true, isDefinition: true)
!150 = !DIGlobalVariableExpression(var: !151, expr: !DIExpression())
!151 = distinct !DIGlobalVariable(scope: null, file: !17, line: 669, type: !73, isLocal: true, isDefinition: true)
!152 = !DIGlobalVariableExpression(var: !153, expr: !DIExpression())
!153 = distinct !DIGlobalVariable(scope: null, file: !17, line: 671, type: !154, isLocal: true, isDefinition: true)
!154 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 128, elements: !155)
!155 = !{!156}
!156 = !DISubrange(count: 16)
!157 = !DIGlobalVariableExpression(var: !158, expr: !DIExpression())
!158 = distinct !DIGlobalVariable(scope: null, file: !17, line: 676, type: !20, isLocal: true, isDefinition: true)
!159 = !DIGlobalVariableExpression(var: !160, expr: !DIExpression())
!160 = distinct !DIGlobalVariable(scope: null, file: !17, line: 681, type: !64, isLocal: true, isDefinition: true)
!161 = !{!162, !169, !173, !176, !180, !184, !188, !192, !196, !199, !201, !203, !205, !207, !209, !211, !213, !215, !217, !219, !221, !223, !225, !227, !229, !235, !239, !242, !245, !254, !256, !258, !260}
!162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !165, file: !168, line: 158)
!163 = !DINamespace(name: "__1", scope: !164, exportSymbols: true)
!164 = !DINamespace(name: "std", scope: null)
!165 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !166, line: 30, baseType: !167)
!166 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int8_t.h", directory: "", checksumkind: CSK_MD5, checksum: "5052dfe782b50fed2355b8f61a9e4fa9")
!167 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!168 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdint", directory: "")
!169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !170, file: !168, line: 159)
!170 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !171, line: 30, baseType: !172)
!171 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int16_t.h", directory: "", checksumkind: CSK_MD5, checksum: "47ed3c3ac6f65bfec021ca2b7be18e7e")
!172 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !174, file: !168, line: 160)
!174 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !175, line: 30, baseType: !7)
!175 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int32_t.h", directory: "", checksumkind: CSK_MD5, checksum: "d23e8406e80ee79983f28509c741fa17")
!176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !177, file: !168, line: 161)
!177 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !178, line: 30, baseType: !179)
!178 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int64_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e6d85c1a9e23dbf7518ce3b162aac800")
!179 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !181, file: !168, line: 163)
!181 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !182, line: 31, baseType: !183)
!182 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint8_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8b64ccf8c67b8c006b07b8daf1b49be5")
!183 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !185, file: !168, line: 164)
!185 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !186, line: 31, baseType: !187)
!186 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint16_t.h", directory: "", checksumkind: CSK_MD5, checksum: "f0aa926da906b10566dd3171bf347ab7")
!187 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !189, file: !168, line: 165)
!189 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !190, line: 31, baseType: !191)
!190 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint32_t.h", directory: "", checksumkind: CSK_MD5, checksum: "0254eb80c6b9719ac45c3c1cf872109b")
!191 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !193, file: !168, line: 166)
!193 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !194, line: 31, baseType: !195)
!194 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint64_t.h", directory: "", checksumkind: CSK_MD5, checksum: "77fc5e91653260959605f129691cf9b1")
!195 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !197, file: !168, line: 168)
!197 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !198, line: 29, baseType: !165)
!198 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "042ceedaf4137a8aaa272d0b27434016")
!199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !200, file: !168, line: 169)
!200 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !198, line: 30, baseType: !170)
!201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !202, file: !168, line: 170)
!202 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !198, line: 31, baseType: !174)
!203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !204, file: !168, line: 171)
!204 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !198, line: 32, baseType: !177)
!205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !206, file: !168, line: 173)
!206 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !198, line: 33, baseType: !181)
!207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !208, file: !168, line: 174)
!208 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !198, line: 34, baseType: !185)
!209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !210, file: !168, line: 175)
!210 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !198, line: 35, baseType: !189)
!211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !212, file: !168, line: 176)
!212 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !198, line: 36, baseType: !193)
!213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !214, file: !168, line: 178)
!214 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !198, line: 40, baseType: !165)
!215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !216, file: !168, line: 179)
!216 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !198, line: 41, baseType: !170)
!217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !218, file: !168, line: 180)
!218 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !198, line: 42, baseType: !174)
!219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !220, file: !168, line: 181)
!220 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !198, line: 43, baseType: !177)
!221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !222, file: !168, line: 183)
!222 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !198, line: 44, baseType: !181)
!223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !224, file: !168, line: 184)
!224 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !198, line: 45, baseType: !185)
!225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !226, file: !168, line: 185)
!226 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !198, line: 46, baseType: !189)
!227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !228, file: !168, line: 186)
!228 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !198, line: 47, baseType: !193)
!229 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !230, file: !168, line: 188)
!230 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !231, line: 32, baseType: !232)
!231 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_intptr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e478ba47270923b1cca6659f19f02db1")
!232 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_intptr_t", file: !233, line: 40, baseType: !234)
!233 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/arm/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "b270144f57ae258d0ce80b8f87be068c")
!234 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !236, file: !168, line: 189)
!236 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !237, line: 34, baseType: !238)
!237 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_uintptr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e70ae655dd1b9d4ae0b1dcc073f5b7e4")
!238 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !240, file: !168, line: 191)
!240 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !241, line: 32, baseType: !234)
!241 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_intmax_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e37b9240f30f486478152ef3989b1545")
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !243, file: !168, line: 192)
!243 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !244, line: 32, baseType: !238)
!244 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uintmax_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8217a3fbb207d8e87ca5318c313e81c2")
!245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !246, file: !253, line: 422)
!246 = !DISubprogram(name: "isfinite", linkageName: "_ZNSt3__16__math8isfiniteB8ne200100Ee", scope: !248, file: !247, line: 79, type: !249, flags: DIFlagPrototyped, spFlags: 0)
!247 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__math/traits.h", directory: "")
!248 = !DINamespace(name: "__math", scope: !163)
!249 = !DISubroutineType(types: !250)
!250 = !{!251, !252}
!251 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!252 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
!253 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/math.h", directory: "")
!254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !255, file: !253, line: 425)
!255 = !DISubprogram(name: "isinf", linkageName: "_ZNSt3__16__math5isinfB8ne200100Ee", scope: !248, file: !247, line: 103, type: !249, flags: DIFlagPrototyped, spFlags: 0)
!256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !257, file: !253, line: 429)
!257 = !DISubprogram(name: "isnan", linkageName: "_ZNSt3__16__math5isnanB8ne200100Ee", scope: !248, file: !247, line: 127, type: !249, flags: DIFlagPrototyped, spFlags: 0)
!258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !259, file: !253, line: 430)
!259 = !DISubprogram(name: "isnormal", linkageName: "_ZNSt3__16__math8isnormalB8ne200100Ee", scope: !248, file: !247, line: 146, type: !249, flags: DIFlagPrototyped, spFlags: 0)
!260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !261, file: !253, line: 485)
!261 = !DISubprogram(name: "modf", linkageName: "_ZNSt3__16__math4modfB8ne200100EePe", scope: !248, file: !262, line: 55, type: !263, flags: DIFlagPrototyped, spFlags: 0)
!262 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__math/modulo.h", directory: "")
!263 = !DISubroutineType(types: !264)
!264 = !{!252, !252, !265}
!265 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !252, size: 64)
!266 = !DICompositeType(tag: DW_TAG_array_type, baseType: !267, size: 41600, elements: !284)
!267 = !DIDerivedType(tag: DW_TAG_typedef, name: "trigger", file: !268, line: 64, baseType: !269)
!268 = !DIFile(filename: "main_d2/switch.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "1c47ec4b0a8e3071adad238a409d843e")
!269 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "trigger", file: !268, line: 54, size: 416, flags: DIFlagTypePassByValue, elements: !270, identifier: "_ZTS7trigger")
!270 = !{!271, !272, !273, !274, !275, !278, !279, !283}
!271 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !269, file: !268, line: 56, baseType: !181, size: 8)
!272 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !269, file: !268, line: 57, baseType: !181, size: 8, offset: 8)
!273 = !DIDerivedType(tag: DW_TAG_member, name: "num_links", scope: !269, file: !268, line: 58, baseType: !165, size: 8, offset: 16)
!274 = !DIDerivedType(tag: DW_TAG_member, name: "pad", scope: !269, file: !268, line: 59, baseType: !165, size: 8, offset: 24)
!275 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !269, file: !268, line: 60, baseType: !276, size: 32, offset: 32)
!276 = !DIDerivedType(tag: DW_TAG_typedef, name: "fix", file: !277, line: 20, baseType: !174)
!277 = !DIFile(filename: "./fix/fix.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "c5006a11bf8b4cb7d963898499eda13a")
!278 = !DIDerivedType(tag: DW_TAG_member, name: "time", scope: !269, file: !268, line: 61, baseType: !276, size: 32, offset: 64)
!279 = !DIDerivedType(tag: DW_TAG_member, name: "seg", scope: !269, file: !268, line: 62, baseType: !280, size: 160, offset: 96)
!280 = !DICompositeType(tag: DW_TAG_array_type, baseType: !172, size: 160, elements: !281)
!281 = !{!282}
!282 = !DISubrange(count: 10)
!283 = !DIDerivedType(tag: DW_TAG_member, name: "side", scope: !269, file: !268, line: 63, baseType: !280, size: 160, offset: 256)
!284 = !{!285}
!285 = !DISubrange(count: 100)
!286 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 4]}
!287 = !{i32 7, !"Dwarf Version", i32 5}
!288 = !{i32 2, !"Debug Info Version", i32 3}
!289 = !{i32 1, !"wchar_size", i32 4}
!290 = !{i32 8, !"PIC Level", i32 2}
!291 = !{i32 7, !"uwtable", i32 1}
!292 = !{i32 7, !"frame-pointer", i32 1}
!293 = !{!"Homebrew clang version 20.1.8"}
!294 = distinct !DISubprogram(name: "do_link", linkageName: "_Z7do_linka", scope: !17, file: !17, line: 81, type: !295, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !297)
!295 = !DISubroutineType(types: !296)
!296 = !{null, !165}
!297 = !{}
!298 = !DILocalVariable(name: "trigger_num", arg: 1, scope: !294, file: !17, line: 81, type: !165)
!299 = !DILocation(line: 81, column: 21, scope: !294)
!300 = !DILocalVariable(name: "i", scope: !294, file: !17, line: 83, type: !7)
!301 = !DILocation(line: 83, column: 6, scope: !294)
!302 = !DILocation(line: 85, column: 2, scope: !294)
!303 = !DILocation(line: 87, column: 6, scope: !304)
!304 = distinct !DILexicalBlock(scope: !294, file: !17, line: 87, column: 6)
!305 = !DILocation(line: 87, column: 18, scope: !304)
!306 = !DILocation(line: 89, column: 9, scope: !307)
!307 = distinct !DILexicalBlock(scope: !308, file: !17, line: 89, column: 3)
!308 = distinct !DILexicalBlock(scope: !304, file: !17, line: 88, column: 2)
!309 = !DILocation(line: 89, column: 8, scope: !307)
!310 = !DILocation(line: 89, column: 12, scope: !311)
!311 = distinct !DILexicalBlock(scope: !307, file: !17, line: 89, column: 3)
!312 = !DILocation(line: 89, column: 23, scope: !311)
!313 = !DILocation(line: 89, column: 14, scope: !311)
!314 = !DILocation(line: 89, column: 36, scope: !311)
!315 = !DILocation(line: 89, column: 13, scope: !311)
!316 = !DILocation(line: 89, column: 3, scope: !307)
!317 = !DILocation(line: 91, column: 35, scope: !318)
!318 = distinct !DILexicalBlock(scope: !311, file: !17, line: 90, column: 3)
!319 = !DILocation(line: 91, column: 26, scope: !318)
!320 = !DILocation(line: 91, column: 48, scope: !318)
!321 = !DILocation(line: 91, column: 52, scope: !318)
!322 = !DILocation(line: 91, column: 17, scope: !318)
!323 = !DILocation(line: 91, column: 66, scope: !318)
!324 = !DILocation(line: 91, column: 57, scope: !318)
!325 = !DILocation(line: 91, column: 79, scope: !318)
!326 = !DILocation(line: 91, column: 84, scope: !318)
!327 = !DILocation(line: 91, column: 4, scope: !318)
!328 = !DILocation(line: 92, column: 4, scope: !318)
!329 = !DILocation(line: 94, column: 5, scope: !318)
!330 = !DILocation(line: 89, column: 47, scope: !311)
!331 = !DILocation(line: 89, column: 3, scope: !311)
!332 = distinct !{!332, !316, !333, !334}
!333 = !DILocation(line: 94, column: 5, scope: !307)
!334 = !{!"llvm.loop.mustprogress"}
!335 = !DILocation(line: 95, column: 4, scope: !308)
!336 = !DILocation(line: 96, column: 1, scope: !294)
!337 = distinct !DISubprogram(name: "do_close_door", linkageName: "_Z13do_close_doora", scope: !17, file: !17, line: 99, type: !295, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !297)
!338 = !DILocalVariable(name: "trigger_num", arg: 1, scope: !337, file: !17, line: 99, type: !165)
!339 = !DILocation(line: 99, column: 27, scope: !337)
!340 = !DILocalVariable(name: "i", scope: !337, file: !17, line: 101, type: !7)
!341 = !DILocation(line: 101, column: 6, scope: !337)
!342 = !DILocation(line: 103, column: 2, scope: !337)
!343 = !DILocation(line: 105, column: 6, scope: !344)
!344 = distinct !DILexicalBlock(scope: !337, file: !17, line: 105, column: 6)
!345 = !DILocation(line: 105, column: 18, scope: !344)
!346 = !DILocation(line: 107, column: 9, scope: !347)
!347 = distinct !DILexicalBlock(scope: !348, file: !17, line: 107, column: 3)
!348 = distinct !DILexicalBlock(scope: !344, file: !17, line: 106, column: 2)
!349 = !DILocation(line: 107, column: 8, scope: !347)
!350 = !DILocation(line: 107, column: 12, scope: !351)
!351 = distinct !DILexicalBlock(scope: !347, file: !17, line: 107, column: 3)
!352 = !DILocation(line: 107, column: 23, scope: !351)
!353 = !DILocation(line: 107, column: 14, scope: !351)
!354 = !DILocation(line: 107, column: 36, scope: !351)
!355 = !DILocation(line: 107, column: 13, scope: !351)
!356 = !DILocation(line: 107, column: 3, scope: !347)
!357 = !DILocation(line: 108, column: 39, scope: !351)
!358 = !DILocation(line: 108, column: 30, scope: !351)
!359 = !DILocation(line: 108, column: 52, scope: !351)
!360 = !DILocation(line: 108, column: 56, scope: !351)
!361 = !DILocation(line: 108, column: 21, scope: !351)
!362 = !DILocation(line: 108, column: 70, scope: !351)
!363 = !DILocation(line: 108, column: 61, scope: !351)
!364 = !DILocation(line: 108, column: 83, scope: !351)
!365 = !DILocation(line: 108, column: 88, scope: !351)
!366 = !DILocation(line: 108, column: 4, scope: !351)
!367 = !DILocation(line: 107, column: 47, scope: !351)
!368 = !DILocation(line: 107, column: 3, scope: !351)
!369 = distinct !{!369, !356, !370, !334}
!370 = !DILocation(line: 108, column: 90, scope: !347)
!371 = !DILocation(line: 109, column: 4, scope: !348)
!372 = !DILocation(line: 110, column: 1, scope: !337)
!373 = distinct !DISubprogram(name: "do_light_on", linkageName: "_Z11do_light_ona", scope: !17, file: !17, line: 114, type: !374, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !297)
!374 = !DISubroutineType(types: !375)
!375 = !{!7, !165}
!376 = !DILocalVariable(name: "trigger_num", arg: 1, scope: !373, file: !17, line: 114, type: !165)
!377 = !DILocation(line: 114, column: 24, scope: !373)
!378 = !DILocalVariable(name: "i", scope: !373, file: !17, line: 116, type: !7)
!379 = !DILocation(line: 116, column: 6, scope: !373)
!380 = !DILocalVariable(name: "ret", scope: !373, file: !17, line: 116, type: !7)
!381 = !DILocation(line: 116, column: 8, scope: !373)
!382 = !DILocation(line: 118, column: 2, scope: !373)
!383 = !DILocation(line: 120, column: 6, scope: !384)
!384 = distinct !DILexicalBlock(scope: !373, file: !17, line: 120, column: 6)
!385 = !DILocation(line: 120, column: 18, scope: !384)
!386 = !DILocation(line: 122, column: 9, scope: !387)
!387 = distinct !DILexicalBlock(scope: !388, file: !17, line: 122, column: 3)
!388 = distinct !DILexicalBlock(scope: !384, file: !17, line: 121, column: 2)
!389 = !DILocation(line: 122, column: 8, scope: !387)
!390 = !DILocation(line: 122, column: 12, scope: !391)
!391 = distinct !DILexicalBlock(scope: !387, file: !17, line: 122, column: 3)
!392 = !DILocation(line: 122, column: 23, scope: !391)
!393 = !DILocation(line: 122, column: 14, scope: !391)
!394 = !DILocation(line: 122, column: 36, scope: !391)
!395 = !DILocation(line: 122, column: 13, scope: !391)
!396 = !DILocation(line: 122, column: 3, scope: !387)
!397 = !DILocalVariable(name: "segnum", scope: !398, file: !17, line: 124, type: !7)
!398 = distinct !DILexicalBlock(scope: !391, file: !17, line: 123, column: 3)
!399 = !DILocation(line: 124, column: 8, scope: !398)
!400 = !DILocalVariable(name: "sidenum", scope: !398, file: !17, line: 124, type: !7)
!401 = !DILocation(line: 124, column: 15, scope: !398)
!402 = !DILocation(line: 125, column: 22, scope: !398)
!403 = !DILocation(line: 125, column: 13, scope: !398)
!404 = !DILocation(line: 125, column: 35, scope: !398)
!405 = !DILocation(line: 125, column: 39, scope: !398)
!406 = !DILocation(line: 125, column: 11, scope: !398)
!407 = !DILocation(line: 126, column: 23, scope: !398)
!408 = !DILocation(line: 126, column: 14, scope: !398)
!409 = !DILocation(line: 126, column: 36, scope: !398)
!410 = !DILocation(line: 126, column: 41, scope: !398)
!411 = !DILocation(line: 126, column: 12, scope: !398)
!412 = !DILocation(line: 130, column: 26, scope: !413)
!413 = distinct !DILexicalBlock(scope: !398, file: !17, line: 130, column: 8)
!414 = !DILocation(line: 130, column: 17, scope: !413)
!415 = !DILocation(line: 130, column: 34, scope: !413)
!416 = !DILocation(line: 130, column: 40, scope: !413)
!417 = !DILocation(line: 130, column: 49, scope: !413)
!418 = !DILocation(line: 130, column: 59, scope: !413)
!419 = !DILocation(line: 130, column: 8, scope: !413)
!420 = !DILocation(line: 130, column: 69, scope: !413)
!421 = !DILocation(line: 132, column: 22, scope: !422)
!422 = distinct !DILexicalBlock(scope: !413, file: !17, line: 131, column: 4)
!423 = !DILocation(line: 132, column: 30, scope: !422)
!424 = !DILocation(line: 132, column: 12, scope: !422)
!425 = !DILocation(line: 132, column: 9, scope: !422)
!426 = !DILocation(line: 133, column: 20, scope: !422)
!427 = !DILocation(line: 133, column: 28, scope: !422)
!428 = !DILocation(line: 133, column: 5, scope: !422)
!429 = !DILocation(line: 134, column: 4, scope: !422)
!430 = !DILocation(line: 135, column: 3, scope: !398)
!431 = !DILocation(line: 122, column: 47, scope: !391)
!432 = !DILocation(line: 122, column: 3, scope: !391)
!433 = distinct !{!433, !396, !434, !334}
!434 = !DILocation(line: 135, column: 3, scope: !387)
!435 = !DILocation(line: 136, column: 2, scope: !388)
!436 = !DILocation(line: 138, column: 9, scope: !373)
!437 = !DILocation(line: 138, column: 2, scope: !373)
!438 = distinct !DISubprogram(name: "do_light_off", linkageName: "_Z12do_light_offa", scope: !17, file: !17, line: 143, type: !374, scopeLine: 144, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !297)
!439 = !DILocalVariable(name: "trigger_num", arg: 1, scope: !438, file: !17, line: 143, type: !165)
!440 = !DILocation(line: 143, column: 25, scope: !438)
!441 = !DILocalVariable(name: "i", scope: !438, file: !17, line: 145, type: !7)
!442 = !DILocation(line: 145, column: 6, scope: !438)
!443 = !DILocalVariable(name: "ret", scope: !438, file: !17, line: 145, type: !7)
!444 = !DILocation(line: 145, column: 8, scope: !438)
!445 = !DILocation(line: 147, column: 2, scope: !438)
!446 = !DILocation(line: 149, column: 6, scope: !447)
!447 = distinct !DILexicalBlock(scope: !438, file: !17, line: 149, column: 6)
!448 = !DILocation(line: 149, column: 18, scope: !447)
!449 = !DILocation(line: 151, column: 9, scope: !450)
!450 = distinct !DILexicalBlock(scope: !451, file: !17, line: 151, column: 3)
!451 = distinct !DILexicalBlock(scope: !447, file: !17, line: 150, column: 2)
!452 = !DILocation(line: 151, column: 8, scope: !450)
!453 = !DILocation(line: 151, column: 12, scope: !454)
!454 = distinct !DILexicalBlock(scope: !450, file: !17, line: 151, column: 3)
!455 = !DILocation(line: 151, column: 23, scope: !454)
!456 = !DILocation(line: 151, column: 14, scope: !454)
!457 = !DILocation(line: 151, column: 36, scope: !454)
!458 = !DILocation(line: 151, column: 13, scope: !454)
!459 = !DILocation(line: 151, column: 3, scope: !450)
!460 = !DILocalVariable(name: "segnum", scope: !461, file: !17, line: 153, type: !7)
!461 = distinct !DILexicalBlock(scope: !454, file: !17, line: 152, column: 3)
!462 = !DILocation(line: 153, column: 8, scope: !461)
!463 = !DILocalVariable(name: "sidenum", scope: !461, file: !17, line: 153, type: !7)
!464 = !DILocation(line: 153, column: 15, scope: !461)
!465 = !DILocation(line: 154, column: 22, scope: !461)
!466 = !DILocation(line: 154, column: 13, scope: !461)
!467 = !DILocation(line: 154, column: 35, scope: !461)
!468 = !DILocation(line: 154, column: 39, scope: !461)
!469 = !DILocation(line: 154, column: 11, scope: !461)
!470 = !DILocation(line: 155, column: 23, scope: !461)
!471 = !DILocation(line: 155, column: 14, scope: !461)
!472 = !DILocation(line: 155, column: 36, scope: !461)
!473 = !DILocation(line: 155, column: 41, scope: !461)
!474 = !DILocation(line: 155, column: 12, scope: !461)
!475 = !DILocation(line: 159, column: 26, scope: !476)
!476 = distinct !DILexicalBlock(scope: !461, file: !17, line: 159, column: 8)
!477 = !DILocation(line: 159, column: 17, scope: !476)
!478 = !DILocation(line: 159, column: 34, scope: !476)
!479 = !DILocation(line: 159, column: 40, scope: !476)
!480 = !DILocation(line: 159, column: 49, scope: !476)
!481 = !DILocation(line: 159, column: 59, scope: !476)
!482 = !DILocation(line: 159, column: 8, scope: !476)
!483 = !DILocation(line: 159, column: 69, scope: !476)
!484 = !DILocation(line: 161, column: 27, scope: !485)
!485 = distinct !DILexicalBlock(scope: !476, file: !17, line: 160, column: 4)
!486 = !DILocation(line: 161, column: 35, scope: !485)
!487 = !DILocation(line: 161, column: 12, scope: !485)
!488 = !DILocation(line: 161, column: 9, scope: !485)
!489 = !DILocation(line: 162, column: 21, scope: !485)
!490 = !DILocation(line: 162, column: 29, scope: !485)
!491 = !DILocation(line: 162, column: 5, scope: !485)
!492 = !DILocation(line: 163, column: 4, scope: !485)
!493 = !DILocation(line: 164, column: 5, scope: !461)
!494 = !DILocation(line: 151, column: 47, scope: !454)
!495 = !DILocation(line: 151, column: 3, scope: !454)
!496 = distinct !{!496, !459, !497, !334}
!497 = !DILocation(line: 164, column: 5, scope: !450)
!498 = !DILocation(line: 165, column: 4, scope: !451)
!499 = !DILocation(line: 167, column: 9, scope: !438)
!500 = !DILocation(line: 167, column: 2, scope: !438)
!501 = distinct !DISubprogram(name: "do_unlock_doors", linkageName: "_Z15do_unlock_doorsa", scope: !17, file: !17, line: 171, type: !295, scopeLine: 172, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !297)
!502 = !DILocalVariable(name: "trigger_num", arg: 1, scope: !501, file: !17, line: 171, type: !165)
!503 = !DILocation(line: 171, column: 29, scope: !501)
!504 = !DILocalVariable(name: "i", scope: !501, file: !17, line: 213, type: !7)
!505 = !DILocation(line: 213, column: 6, scope: !501)
!506 = !DILocation(line: 215, column: 2, scope: !501)
!507 = !DILocation(line: 217, column: 6, scope: !508)
!508 = distinct !DILexicalBlock(scope: !501, file: !17, line: 217, column: 6)
!509 = !DILocation(line: 217, column: 18, scope: !508)
!510 = !DILocation(line: 219, column: 9, scope: !511)
!511 = distinct !DILexicalBlock(scope: !512, file: !17, line: 219, column: 3)
!512 = distinct !DILexicalBlock(scope: !508, file: !17, line: 218, column: 2)
!513 = !DILocation(line: 219, column: 8, scope: !511)
!514 = !DILocation(line: 219, column: 12, scope: !515)
!515 = distinct !DILexicalBlock(scope: !511, file: !17, line: 219, column: 3)
!516 = !DILocation(line: 219, column: 23, scope: !515)
!517 = !DILocation(line: 219, column: 14, scope: !515)
!518 = !DILocation(line: 219, column: 36, scope: !515)
!519 = !DILocation(line: 219, column: 13, scope: !515)
!520 = !DILocation(line: 219, column: 3, scope: !511)
!521 = !DILocation(line: 221, column: 28, scope: !522)
!522 = distinct !DILexicalBlock(scope: !515, file: !17, line: 220, column: 3)
!523 = !DILocation(line: 221, column: 19, scope: !522)
!524 = !DILocation(line: 221, column: 41, scope: !522)
!525 = !DILocation(line: 221, column: 45, scope: !522)
!526 = !DILocation(line: 221, column: 10, scope: !522)
!527 = !DILocation(line: 221, column: 49, scope: !522)
!528 = !DILocation(line: 221, column: 64, scope: !522)
!529 = !DILocation(line: 221, column: 55, scope: !522)
!530 = !DILocation(line: 221, column: 77, scope: !522)
!531 = !DILocation(line: 221, column: 82, scope: !522)
!532 = !DILocation(line: 221, column: 86, scope: !522)
!533 = !DILocation(line: 221, column: 4, scope: !522)
!534 = !DILocation(line: 221, column: 96, scope: !522)
!535 = !DILocation(line: 221, column: 102, scope: !522)
!536 = !DILocation(line: 222, column: 28, scope: !522)
!537 = !DILocation(line: 222, column: 19, scope: !522)
!538 = !DILocation(line: 222, column: 41, scope: !522)
!539 = !DILocation(line: 222, column: 45, scope: !522)
!540 = !DILocation(line: 222, column: 10, scope: !522)
!541 = !DILocation(line: 222, column: 49, scope: !522)
!542 = !DILocation(line: 222, column: 64, scope: !522)
!543 = !DILocation(line: 222, column: 55, scope: !522)
!544 = !DILocation(line: 222, column: 77, scope: !522)
!545 = !DILocation(line: 222, column: 82, scope: !522)
!546 = !DILocation(line: 222, column: 86, scope: !522)
!547 = !DILocation(line: 222, column: 4, scope: !522)
!548 = !DILocation(line: 222, column: 96, scope: !522)
!549 = !DILocation(line: 222, column: 101, scope: !522)
!550 = !DILocation(line: 223, column: 5, scope: !522)
!551 = !DILocation(line: 219, column: 47, scope: !515)
!552 = !DILocation(line: 219, column: 3, scope: !515)
!553 = distinct !{!553, !520, !554, !334}
!554 = !DILocation(line: 223, column: 5, scope: !511)
!555 = !DILocation(line: 224, column: 4, scope: !512)
!556 = !DILocation(line: 225, column: 1, scope: !501)
!557 = distinct !DISubprogram(name: "door_is_wall_switched", linkageName: "_Z21door_is_wall_switchedi", scope: !17, file: !17, line: 228, type: !558, scopeLine: 229, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !297)
!558 = !DISubroutineType(types: !559)
!559 = !{!7, !7}
!560 = !DILocalVariable(name: "wall_num", arg: 1, scope: !557, file: !17, line: 228, type: !7)
!561 = !DILocation(line: 228, column: 31, scope: !557)
!562 = !DILocalVariable(name: "i", scope: !557, file: !17, line: 235, type: !7)
!563 = !DILocation(line: 235, column: 6, scope: !557)
!564 = !DILocalVariable(name: "t", scope: !557, file: !17, line: 235, type: !7)
!565 = !DILocation(line: 235, column: 9, scope: !557)
!566 = !DILocation(line: 237, column: 8, scope: !567)
!567 = distinct !DILexicalBlock(scope: !557, file: !17, line: 237, column: 2)
!568 = !DILocation(line: 237, column: 7, scope: !567)
!569 = !DILocation(line: 237, column: 12, scope: !570)
!570 = distinct !DILexicalBlock(scope: !567, file: !17, line: 237, column: 2)
!571 = !DILocation(line: 237, column: 14, scope: !570)
!572 = !DILocation(line: 237, column: 13, scope: !570)
!573 = !DILocation(line: 237, column: 2, scope: !567)
!574 = !DILocation(line: 239, column: 9, scope: !575)
!575 = distinct !DILexicalBlock(scope: !576, file: !17, line: 239, column: 3)
!576 = distinct !DILexicalBlock(scope: !570, file: !17, line: 238, column: 2)
!577 = !DILocation(line: 239, column: 8, scope: !575)
!578 = !DILocation(line: 239, column: 13, scope: !579)
!579 = distinct !DILexicalBlock(scope: !575, file: !17, line: 239, column: 3)
!580 = !DILocation(line: 239, column: 24, scope: !579)
!581 = !DILocation(line: 239, column: 15, scope: !579)
!582 = !DILocation(line: 239, column: 27, scope: !579)
!583 = !DILocation(line: 239, column: 14, scope: !579)
!584 = !DILocation(line: 239, column: 3, scope: !575)
!585 = !DILocation(line: 241, column: 26, scope: !586)
!586 = distinct !DILexicalBlock(scope: !587, file: !17, line: 241, column: 8)
!587 = distinct !DILexicalBlock(scope: !579, file: !17, line: 240, column: 3)
!588 = !DILocation(line: 241, column: 17, scope: !586)
!589 = !DILocation(line: 241, column: 29, scope: !586)
!590 = !DILocation(line: 241, column: 33, scope: !586)
!591 = !DILocation(line: 241, column: 8, scope: !586)
!592 = !DILocation(line: 241, column: 37, scope: !586)
!593 = !DILocation(line: 241, column: 52, scope: !586)
!594 = !DILocation(line: 241, column: 43, scope: !586)
!595 = !DILocation(line: 241, column: 55, scope: !586)
!596 = !DILocation(line: 241, column: 60, scope: !586)
!597 = !DILocation(line: 241, column: 64, scope: !586)
!598 = !DILocation(line: 241, column: 76, scope: !586)
!599 = !DILocation(line: 241, column: 73, scope: !586)
!600 = !DILocation(line: 242, column: 5, scope: !601)
!601 = distinct !DILexicalBlock(scope: !586, file: !17, line: 241, column: 86)
!602 = !DILocation(line: 243, column: 12, scope: !601)
!603 = !DILocation(line: 243, column: 5, scope: !601)
!604 = !DILocation(line: 245, column: 5, scope: !587)
!605 = !DILocation(line: 239, column: 39, scope: !579)
!606 = !DILocation(line: 239, column: 3, scope: !579)
!607 = distinct !{!607, !584, !608, !334}
!608 = !DILocation(line: 245, column: 5, scope: !575)
!609 = !DILocation(line: 246, column: 2, scope: !576)
!610 = !DILocation(line: 237, column: 29, scope: !570)
!611 = !DILocation(line: 237, column: 2, scope: !570)
!612 = distinct !{!612, !573, !613, !334}
!613 = !DILocation(line: 246, column: 2, scope: !567)
!614 = !DILocation(line: 248, column: 2, scope: !557)
!615 = !DILocation(line: 249, column: 1, scope: !557)
!616 = distinct !DISubprogram(name: "flag_wall_switched_doors", linkageName: "_Z24flag_wall_switched_doorsv", scope: !17, file: !17, line: 251, type: !617, scopeLine: 252, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !297)
!617 = !DISubroutineType(types: !618)
!618 = !{null}
!619 = !DILocalVariable(name: "i", scope: !616, file: !17, line: 259, type: !7)
!620 = !DILocation(line: 259, column: 6, scope: !616)
!621 = !DILocation(line: 261, column: 8, scope: !622)
!622 = distinct !DILexicalBlock(scope: !616, file: !17, line: 261, column: 2)
!623 = !DILocation(line: 261, column: 7, scope: !622)
!624 = !DILocation(line: 261, column: 12, scope: !625)
!625 = distinct !DILexicalBlock(scope: !622, file: !17, line: 261, column: 2)
!626 = !DILocation(line: 261, column: 14, scope: !625)
!627 = !DILocation(line: 261, column: 13, scope: !625)
!628 = !DILocation(line: 261, column: 2, scope: !622)
!629 = !DILocation(line: 263, column: 29, scope: !630)
!630 = distinct !DILexicalBlock(scope: !631, file: !17, line: 263, column: 7)
!631 = distinct !DILexicalBlock(scope: !625, file: !17, line: 262, column: 2)
!632 = !DILocation(line: 263, column: 7, scope: !630)
!633 = !DILocation(line: 264, column: 10, scope: !630)
!634 = !DILocation(line: 264, column: 4, scope: !630)
!635 = !DILocation(line: 264, column: 13, scope: !630)
!636 = !DILocation(line: 264, column: 19, scope: !630)
!637 = !DILocation(line: 265, column: 2, scope: !631)
!638 = !DILocation(line: 261, column: 26, scope: !625)
!639 = !DILocation(line: 261, column: 2, scope: !625)
!640 = distinct !{!640, !628, !641, !334}
!641 = !DILocation(line: 265, column: 2, scope: !622)
!642 = !DILocation(line: 267, column: 1, scope: !616)
!643 = distinct !DISubprogram(name: "do_lock_doors", linkageName: "_Z13do_lock_doorsa", scope: !17, file: !17, line: 270, type: !295, scopeLine: 271, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !297)
!644 = !DILocalVariable(name: "trigger_num", arg: 1, scope: !643, file: !17, line: 270, type: !165)
!645 = !DILocation(line: 270, column: 27, scope: !643)
!646 = !DILocalVariable(name: "i", scope: !643, file: !17, line: 278, type: !7)
!647 = !DILocation(line: 278, column: 6, scope: !643)
!648 = !DILocation(line: 280, column: 2, scope: !643)
!649 = !DILocation(line: 282, column: 6, scope: !650)
!650 = distinct !DILexicalBlock(scope: !643, file: !17, line: 282, column: 6)
!651 = !DILocation(line: 282, column: 18, scope: !650)
!652 = !DILocation(line: 284, column: 9, scope: !653)
!653 = distinct !DILexicalBlock(scope: !654, file: !17, line: 284, column: 3)
!654 = distinct !DILexicalBlock(scope: !650, file: !17, line: 283, column: 2)
!655 = !DILocation(line: 284, column: 8, scope: !653)
!656 = !DILocation(line: 284, column: 12, scope: !657)
!657 = distinct !DILexicalBlock(scope: !653, file: !17, line: 284, column: 3)
!658 = !DILocation(line: 284, column: 23, scope: !657)
!659 = !DILocation(line: 284, column: 14, scope: !657)
!660 = !DILocation(line: 284, column: 36, scope: !657)
!661 = !DILocation(line: 284, column: 13, scope: !657)
!662 = !DILocation(line: 284, column: 3, scope: !653)
!663 = !DILocation(line: 286, column: 28, scope: !664)
!664 = distinct !DILexicalBlock(scope: !657, file: !17, line: 285, column: 3)
!665 = !DILocation(line: 286, column: 19, scope: !664)
!666 = !DILocation(line: 286, column: 41, scope: !664)
!667 = !DILocation(line: 286, column: 45, scope: !664)
!668 = !DILocation(line: 286, column: 10, scope: !664)
!669 = !DILocation(line: 286, column: 49, scope: !664)
!670 = !DILocation(line: 286, column: 64, scope: !664)
!671 = !DILocation(line: 286, column: 55, scope: !664)
!672 = !DILocation(line: 286, column: 77, scope: !664)
!673 = !DILocation(line: 286, column: 82, scope: !664)
!674 = !DILocation(line: 286, column: 86, scope: !664)
!675 = !DILocation(line: 286, column: 4, scope: !664)
!676 = !DILocation(line: 286, column: 96, scope: !664)
!677 = !DILocation(line: 286, column: 102, scope: !664)
!678 = !DILocation(line: 287, column: 5, scope: !664)
!679 = !DILocation(line: 284, column: 47, scope: !657)
!680 = !DILocation(line: 284, column: 3, scope: !657)
!681 = distinct !{!681, !662, !682, !334}
!682 = !DILocation(line: 287, column: 5, scope: !653)
!683 = !DILocation(line: 288, column: 4, scope: !654)
!684 = !DILocation(line: 289, column: 1, scope: !643)
!685 = distinct !DISubprogram(name: "do_change_walls", linkageName: "_Z15do_change_wallsa", scope: !17, file: !17, line: 292, type: !374, scopeLine: 293, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !297)
!686 = !DILocalVariable(name: "trigger_num", arg: 1, scope: !685, file: !17, line: 292, type: !165)
!687 = !DILocation(line: 292, column: 28, scope: !685)
!688 = !DILocalVariable(name: "i", scope: !685, file: !17, line: 294, type: !7)
!689 = !DILocation(line: 294, column: 6, scope: !685)
!690 = !DILocalVariable(name: "ret", scope: !685, file: !17, line: 294, type: !7)
!691 = !DILocation(line: 294, column: 8, scope: !685)
!692 = !DILocation(line: 296, column: 2, scope: !685)
!693 = !DILocation(line: 298, column: 6, scope: !694)
!694 = distinct !DILexicalBlock(scope: !685, file: !17, line: 298, column: 6)
!695 = !DILocation(line: 298, column: 18, scope: !694)
!696 = !DILocation(line: 300, column: 9, scope: !697)
!697 = distinct !DILexicalBlock(scope: !698, file: !17, line: 300, column: 3)
!698 = distinct !DILexicalBlock(scope: !694, file: !17, line: 299, column: 2)
!699 = !DILocation(line: 300, column: 8, scope: !697)
!700 = !DILocation(line: 300, column: 12, scope: !701)
!701 = distinct !DILexicalBlock(scope: !697, file: !17, line: 300, column: 3)
!702 = !DILocation(line: 300, column: 23, scope: !701)
!703 = !DILocation(line: 300, column: 14, scope: !701)
!704 = !DILocation(line: 300, column: 36, scope: !701)
!705 = !DILocation(line: 300, column: 13, scope: !701)
!706 = !DILocation(line: 300, column: 3, scope: !697)
!707 = !DILocalVariable(name: "segp", scope: !708, file: !17, line: 302, type: !709)
!708 = distinct !DILexicalBlock(scope: !701, file: !17, line: 301, column: 3)
!709 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !710, size: 64)
!710 = !DIDerivedType(tag: DW_TAG_typedef, name: "segment", file: !711, line: 123, baseType: !712)
!711 = !DIFile(filename: "main_d2/segment.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "c950815a9b07e6bab2fa2587b90affec")
!712 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "segment", file: !711, line: 100, size: 4096, flags: DIFlagTypePassByValue, elements: !713, identifier: "_ZTS7segment")
!713 = !{!714, !745, !747, !751}
!714 = !DIDerivedType(tag: DW_TAG_member, name: "sides", scope: !712, file: !711, line: 105, baseType: !715, size: 3840)
!715 = !DICompositeType(tag: DW_TAG_array_type, baseType: !716, size: 3840, elements: !743)
!716 = !DIDerivedType(tag: DW_TAG_typedef, name: "side", file: !711, line: 91, baseType: !717)
!717 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "side", file: !711, line: 82, size: 640, flags: DIFlagTypePassByValue, elements: !718, identifier: "_ZTS4side")
!718 = !{!719, !720, !721, !722, !723, !724, !734}
!719 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !717, file: !711, line: 84, baseType: !165, size: 8)
!720 = !DIDerivedType(tag: DW_TAG_member, name: "pad", scope: !717, file: !711, line: 85, baseType: !181, size: 8, offset: 8)
!721 = !DIDerivedType(tag: DW_TAG_member, name: "wall_num", scope: !717, file: !711, line: 86, baseType: !172, size: 16, offset: 16)
!722 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_num", scope: !717, file: !711, line: 87, baseType: !172, size: 16, offset: 32)
!723 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_num2", scope: !717, file: !711, line: 88, baseType: !172, size: 16, offset: 48)
!724 = !DIDerivedType(tag: DW_TAG_member, name: "uvls", scope: !717, file: !711, line: 89, baseType: !725, size: 384, offset: 64)
!725 = !DICompositeType(tag: DW_TAG_array_type, baseType: !726, size: 384, elements: !732)
!726 = !DIDerivedType(tag: DW_TAG_typedef, name: "uvl", file: !711, line: 67, baseType: !727)
!727 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uvl", file: !711, line: 64, size: 96, flags: DIFlagTypePassByValue, elements: !728, identifier: "_ZTS3uvl")
!728 = !{!729, !730, !731}
!729 = !DIDerivedType(tag: DW_TAG_member, name: "u", scope: !727, file: !711, line: 66, baseType: !276, size: 32)
!730 = !DIDerivedType(tag: DW_TAG_member, name: "v", scope: !727, file: !711, line: 66, baseType: !276, size: 32, offset: 32)
!731 = !DIDerivedType(tag: DW_TAG_member, name: "l", scope: !727, file: !711, line: 66, baseType: !276, size: 32, offset: 64)
!732 = !{!733}
!733 = !DISubrange(count: 4)
!734 = !DIDerivedType(tag: DW_TAG_member, name: "normals", scope: !717, file: !711, line: 90, baseType: !735, size: 192, offset: 448)
!735 = !DICompositeType(tag: DW_TAG_array_type, baseType: !736, size: 192, elements: !74)
!736 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_vector", file: !737, line: 22, baseType: !738)
!737 = !DIFile(filename: "./vecmat/vecmat.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "dfa84e3325c1ea4f5f74699fff5ef2bf")
!738 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_vector", file: !737, line: 19, size: 96, flags: DIFlagTypePassByValue, elements: !739, identifier: "_ZTS10vms_vector")
!739 = !{!740, !741, !742}
!740 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !738, file: !737, line: 21, baseType: !276, size: 32)
!741 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !738, file: !737, line: 21, baseType: !276, size: 32, offset: 32)
!742 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !738, file: !737, line: 21, baseType: !276, size: 32, offset: 64)
!743 = !{!744}
!744 = !DISubrange(count: 6)
!745 = !DIDerivedType(tag: DW_TAG_member, name: "children", scope: !712, file: !711, line: 106, baseType: !746, size: 96, offset: 3840)
!746 = !DICompositeType(tag: DW_TAG_array_type, baseType: !172, size: 96, elements: !743)
!747 = !DIDerivedType(tag: DW_TAG_member, name: "verts", scope: !712, file: !711, line: 107, baseType: !748, size: 128, offset: 3936)
!748 = !DICompositeType(tag: DW_TAG_array_type, baseType: !172, size: 128, elements: !749)
!749 = !{!750}
!750 = !DISubrange(count: 8)
!751 = !DIDerivedType(tag: DW_TAG_member, name: "objects", scope: !712, file: !711, line: 112, baseType: !7, size: 32, offset: 4064)
!752 = !DILocation(line: 302, column: 13, scope: !708)
!753 = !DILocalVariable(name: "csegp", scope: !708, file: !17, line: 302, type: !709)
!754 = !DILocation(line: 302, column: 19, scope: !708)
!755 = !DILocalVariable(name: "side", scope: !708, file: !17, line: 303, type: !172)
!756 = !DILocation(line: 303, column: 10, scope: !708)
!757 = !DILocalVariable(name: "cside", scope: !708, file: !17, line: 303, type: !172)
!758 = !DILocation(line: 303, column: 15, scope: !708)
!759 = !DILocalVariable(name: "new_wall_type", scope: !708, file: !17, line: 304, type: !7)
!760 = !DILocation(line: 304, column: 8, scope: !708)
!761 = !DILocation(line: 306, column: 30, scope: !708)
!762 = !DILocation(line: 306, column: 21, scope: !708)
!763 = !DILocation(line: 306, column: 43, scope: !708)
!764 = !DILocation(line: 306, column: 47, scope: !708)
!765 = !DILocation(line: 306, column: 12, scope: !708)
!766 = !DILocation(line: 306, column: 9, scope: !708)
!767 = !DILocation(line: 307, column: 20, scope: !708)
!768 = !DILocation(line: 307, column: 11, scope: !708)
!769 = !DILocation(line: 307, column: 33, scope: !708)
!770 = !DILocation(line: 307, column: 38, scope: !708)
!771 = !DILocation(line: 307, column: 9, scope: !708)
!772 = !DILocation(line: 309, column: 22, scope: !708)
!773 = !DILocation(line: 309, column: 28, scope: !708)
!774 = !DILocation(line: 309, column: 37, scope: !708)
!775 = !DILocation(line: 309, column: 13, scope: !708)
!776 = !DILocation(line: 309, column: 10, scope: !708)
!777 = !DILocation(line: 310, column: 30, scope: !708)
!778 = !DILocation(line: 310, column: 36, scope: !708)
!779 = !DILocation(line: 310, column: 12, scope: !708)
!780 = !DILocation(line: 310, column: 10, scope: !708)
!781 = !DILocation(line: 311, column: 4, scope: !708)
!782 = !DILocation(line: 316, column: 21, scope: !708)
!783 = !DILocation(line: 316, column: 12, scope: !708)
!784 = !DILocation(line: 316, column: 34, scope: !708)
!785 = !DILocation(line: 316, column: 4, scope: !708)
!786 = !DILocation(line: 318, column: 39, scope: !787)
!787 = distinct !DILexicalBlock(scope: !708, file: !17, line: 317, column: 4)
!788 = !DILocation(line: 318, column: 52, scope: !787)
!789 = !DILocation(line: 319, column: 40, scope: !787)
!790 = !DILocation(line: 319, column: 55, scope: !787)
!791 = !DILocation(line: 320, column: 42, scope: !787)
!792 = !DILocation(line: 320, column: 59, scope: !787)
!793 = !DILocation(line: 323, column: 14, scope: !794)
!794 = distinct !DILexicalBlock(scope: !708, file: !17, line: 323, column: 8)
!795 = !DILocation(line: 323, column: 20, scope: !794)
!796 = !DILocation(line: 323, column: 26, scope: !794)
!797 = !DILocation(line: 323, column: 32, scope: !794)
!798 = !DILocation(line: 323, column: 8, scope: !794)
!799 = !DILocation(line: 323, column: 42, scope: !794)
!800 = !DILocation(line: 323, column: 50, scope: !794)
!801 = !DILocation(line: 323, column: 47, scope: !794)
!802 = !DILocation(line: 323, column: 64, scope: !794)
!803 = !DILocation(line: 323, column: 73, scope: !794)
!804 = !DILocation(line: 323, column: 80, scope: !794)
!805 = !DILocation(line: 323, column: 86, scope: !794)
!806 = !DILocation(line: 323, column: 93, scope: !794)
!807 = !DILocation(line: 323, column: 67, scope: !794)
!808 = !DILocation(line: 323, column: 103, scope: !794)
!809 = !DILocation(line: 323, column: 111, scope: !794)
!810 = !DILocation(line: 323, column: 108, scope: !794)
!811 = !DILocation(line: 324, column: 5, scope: !794)
!812 = !DILocation(line: 326, column: 8, scope: !708)
!813 = !DILocation(line: 328, column: 21, scope: !708)
!814 = !DILocation(line: 328, column: 12, scope: !708)
!815 = !DILocation(line: 328, column: 34, scope: !708)
!816 = !DILocation(line: 328, column: 4, scope: !708)
!817 = !DILocation(line: 332, column: 6, scope: !818)
!818 = distinct !DILexicalBlock(scope: !708, file: !17, line: 329, column: 4)
!819 = !DILocation(line: 334, column: 20, scope: !820)
!820 = distinct !DILexicalBlock(scope: !818, file: !17, line: 334, column: 10)
!821 = !DILocation(line: 334, column: 26, scope: !820)
!822 = !DILocation(line: 334, column: 32, scope: !820)
!823 = !DILocation(line: 334, column: 38, scope: !820)
!824 = !DILocation(line: 334, column: 11, scope: !820)
!825 = !DILocation(line: 334, column: 48, scope: !820)
!826 = !DILocation(line: 334, column: 54, scope: !820)
!827 = !DILocation(line: 334, column: 10, scope: !820)
!828 = !DILocalVariable(name: "pos", scope: !829, file: !17, line: 336, type: !736)
!829 = distinct !DILexicalBlock(scope: !820, file: !17, line: 335, column: 6)
!830 = !DILocation(line: 336, column: 18, scope: !829)
!831 = !DILocation(line: 337, column: 42, scope: !829)
!832 = !DILocation(line: 337, column: 48, scope: !829)
!833 = !DILocation(line: 337, column: 7, scope: !829)
!834 = !DILocation(line: 338, column: 53, scope: !829)
!835 = !DILocation(line: 338, column: 57, scope: !829)
!836 = !DILocation(line: 338, column: 68, scope: !829)
!837 = !DILocation(line: 338, column: 7, scope: !829)
!838 = !DILocation(line: 339, column: 48, scope: !829)
!839 = !DILocation(line: 339, column: 13, scope: !829)
!840 = !DILocation(line: 339, column: 19, scope: !829)
!841 = !DILocation(line: 339, column: 25, scope: !829)
!842 = !DILocation(line: 339, column: 31, scope: !829)
!843 = !DILocation(line: 339, column: 7, scope: !829)
!844 = !DILocation(line: 339, column: 41, scope: !829)
!845 = !DILocation(line: 339, column: 46, scope: !829)
!846 = !DILocation(line: 340, column: 50, scope: !829)
!847 = !DILocation(line: 340, column: 13, scope: !829)
!848 = !DILocation(line: 340, column: 20, scope: !829)
!849 = !DILocation(line: 340, column: 26, scope: !829)
!850 = !DILocation(line: 340, column: 33, scope: !829)
!851 = !DILocation(line: 340, column: 7, scope: !829)
!852 = !DILocation(line: 340, column: 43, scope: !829)
!853 = !DILocation(line: 340, column: 48, scope: !829)
!854 = !DILocation(line: 341, column: 41, scope: !829)
!855 = !DILocation(line: 341, column: 45, scope: !829)
!856 = !DILocation(line: 341, column: 55, scope: !829)
!857 = !DILocation(line: 341, column: 7, scope: !829)
!858 = !DILocation(line: 342, column: 41, scope: !829)
!859 = !DILocation(line: 342, column: 46, scope: !829)
!860 = !DILocation(line: 342, column: 56, scope: !829)
!861 = !DILocation(line: 342, column: 7, scope: !829)
!862 = !DILocation(line: 343, column: 6, scope: !829)
!863 = !DILocation(line: 345, column: 24, scope: !820)
!864 = !DILocation(line: 345, column: 29, scope: !820)
!865 = !DILocation(line: 345, column: 7, scope: !820)
!866 = !DILocation(line: 347, column: 10, scope: !818)
!867 = !DILocation(line: 349, column: 6, scope: !818)
!868 = !DILocation(line: 352, column: 6, scope: !818)
!869 = !DILocation(line: 354, column: 20, scope: !870)
!870 = distinct !DILexicalBlock(scope: !818, file: !17, line: 354, column: 10)
!871 = !DILocation(line: 354, column: 26, scope: !870)
!872 = !DILocation(line: 354, column: 32, scope: !870)
!873 = !DILocation(line: 354, column: 38, scope: !870)
!874 = !DILocation(line: 354, column: 11, scope: !870)
!875 = !DILocation(line: 354, column: 48, scope: !870)
!876 = !DILocation(line: 354, column: 54, scope: !870)
!877 = !DILocation(line: 354, column: 10, scope: !870)
!878 = !DILocalVariable(name: "pos", scope: !879, file: !17, line: 356, type: !736)
!879 = distinct !DILexicalBlock(scope: !870, file: !17, line: 355, column: 6)
!880 = !DILocation(line: 356, column: 18, scope: !879)
!881 = !DILocation(line: 357, column: 42, scope: !879)
!882 = !DILocation(line: 357, column: 48, scope: !879)
!883 = !DILocation(line: 357, column: 7, scope: !879)
!884 = !DILocation(line: 358, column: 51, scope: !879)
!885 = !DILocation(line: 358, column: 55, scope: !879)
!886 = !DILocation(line: 358, column: 65, scope: !879)
!887 = !DILocation(line: 358, column: 7, scope: !879)
!888 = !DILocation(line: 359, column: 48, scope: !879)
!889 = !DILocation(line: 359, column: 13, scope: !879)
!890 = !DILocation(line: 359, column: 19, scope: !879)
!891 = !DILocation(line: 359, column: 25, scope: !879)
!892 = !DILocation(line: 359, column: 31, scope: !879)
!893 = !DILocation(line: 359, column: 7, scope: !879)
!894 = !DILocation(line: 359, column: 41, scope: !879)
!895 = !DILocation(line: 359, column: 46, scope: !879)
!896 = !DILocation(line: 360, column: 50, scope: !879)
!897 = !DILocation(line: 360, column: 13, scope: !879)
!898 = !DILocation(line: 360, column: 20, scope: !879)
!899 = !DILocation(line: 360, column: 26, scope: !879)
!900 = !DILocation(line: 360, column: 33, scope: !879)
!901 = !DILocation(line: 360, column: 7, scope: !879)
!902 = !DILocation(line: 360, column: 43, scope: !879)
!903 = !DILocation(line: 360, column: 48, scope: !879)
!904 = !DILocation(line: 361, column: 6, scope: !879)
!905 = !DILocation(line: 363, column: 26, scope: !870)
!906 = !DILocation(line: 363, column: 31, scope: !870)
!907 = !DILocation(line: 363, column: 7, scope: !870)
!908 = !DILocation(line: 364, column: 6, scope: !818)
!909 = !DILocation(line: 367, column: 6, scope: !818)
!910 = !DILocation(line: 368, column: 47, scope: !818)
!911 = !DILocation(line: 368, column: 12, scope: !818)
!912 = !DILocation(line: 368, column: 18, scope: !818)
!913 = !DILocation(line: 368, column: 24, scope: !818)
!914 = !DILocation(line: 368, column: 30, scope: !818)
!915 = !DILocation(line: 368, column: 6, scope: !818)
!916 = !DILocation(line: 368, column: 40, scope: !818)
!917 = !DILocation(line: 368, column: 45, scope: !818)
!918 = !DILocation(line: 369, column: 49, scope: !818)
!919 = !DILocation(line: 369, column: 12, scope: !818)
!920 = !DILocation(line: 369, column: 19, scope: !818)
!921 = !DILocation(line: 369, column: 25, scope: !818)
!922 = !DILocation(line: 369, column: 32, scope: !818)
!923 = !DILocation(line: 369, column: 6, scope: !818)
!924 = !DILocation(line: 369, column: 42, scope: !818)
!925 = !DILocation(line: 369, column: 47, scope: !818)
!926 = !DILocation(line: 370, column: 6, scope: !818)
!927 = !DILocation(line: 374, column: 23, scope: !708)
!928 = !DILocation(line: 374, column: 29, scope: !708)
!929 = !DILocation(line: 374, column: 35, scope: !708)
!930 = !DILocation(line: 374, column: 41, scope: !708)
!931 = !DILocation(line: 374, column: 4, scope: !708)
!932 = !DILocation(line: 375, column: 23, scope: !708)
!933 = !DILocation(line: 375, column: 30, scope: !708)
!934 = !DILocation(line: 375, column: 36, scope: !708)
!935 = !DILocation(line: 375, column: 43, scope: !708)
!936 = !DILocation(line: 375, column: 4, scope: !708)
!937 = !DILocation(line: 377, column: 5, scope: !708)
!938 = !DILocation(line: 300, column: 47, scope: !701)
!939 = !DILocation(line: 300, column: 3, scope: !701)
!940 = distinct !{!940, !706, !941, !334}
!941 = !DILocation(line: 377, column: 5, scope: !697)
!942 = !DILocation(line: 378, column: 4, scope: !698)
!943 = !DILocation(line: 380, column: 9, scope: !685)
!944 = !DILocation(line: 380, column: 2, scope: !685)
!945 = distinct !DISubprogram(name: "print_trigger_message", linkageName: "_Z21print_trigger_messageiiiPKc", scope: !17, file: !17, line: 383, type: !946, scopeLine: 384, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !297)
!946 = !DISubroutineType(types: !947)
!947 = !{null, !7, !7, !7, !948}
!948 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!949 = !DILocalVariable(name: "pnum", arg: 1, scope: !945, file: !17, line: 383, type: !7)
!950 = !DILocation(line: 383, column: 33, scope: !945)
!951 = !DILocalVariable(name: "trig", arg: 2, scope: !945, file: !17, line: 383, type: !7)
!952 = !DILocation(line: 383, column: 42, scope: !945)
!953 = !DILocalVariable(name: "shot", arg: 3, scope: !945, file: !17, line: 383, type: !7)
!954 = !DILocation(line: 383, column: 51, scope: !945)
!955 = !DILocalVariable(name: "message", arg: 4, scope: !945, file: !17, line: 383, type: !948)
!956 = !DILocation(line: 383, column: 68, scope: !945)
!957 = !DILocalVariable(name: "pl", scope: !945, file: !17, line: 385, type: !12)
!958 = !DILocation(line: 385, column: 8, scope: !945)
!959 = !DILocation(line: 387, column: 8, scope: !960)
!960 = distinct !DILexicalBlock(scope: !945, file: !17, line: 387, column: 8)
!961 = !DILocation(line: 387, column: 14, scope: !960)
!962 = !DILocation(line: 387, column: 12, scope: !960)
!963 = !DILocation(line: 388, column: 3, scope: !960)
!964 = !DILocation(line: 390, column: 35, scope: !945)
!965 = !DILocation(line: 390, column: 26, scope: !945)
!966 = !DILocation(line: 390, column: 41, scope: !945)
!967 = !DILocation(line: 390, column: 50, scope: !945)
!968 = !DILocation(line: 390, column: 25, scope: !945)
!969 = !DILocation(line: 390, column: 5, scope: !945)
!970 = !DILocation(line: 392, column: 20, scope: !971)
!971 = distinct !DILexicalBlock(scope: !945, file: !17, line: 392, column: 9)
!972 = !DILocation(line: 392, column: 11, scope: !971)
!973 = !DILocation(line: 392, column: 26, scope: !971)
!974 = !DILocation(line: 392, column: 32, scope: !971)
!975 = !DILocation(line: 392, column: 10, scope: !971)
!976 = !DILocation(line: 392, column: 49, scope: !971)
!977 = !DILocation(line: 392, column: 52, scope: !971)
!978 = !DILocation(line: 393, column: 24, scope: !971)
!979 = !DILocation(line: 393, column: 32, scope: !971)
!980 = !DILocation(line: 393, column: 6, scope: !971)
!981 = !DILocation(line: 394, column: 2, scope: !945)
!982 = distinct !DISubprogram(name: "do_matcen", linkageName: "_Z9do_matcena", scope: !17, file: !17, line: 397, type: !295, scopeLine: 398, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !297)
!983 = !DILocalVariable(name: "trigger_num", arg: 1, scope: !982, file: !17, line: 397, type: !165)
!984 = !DILocation(line: 397, column: 23, scope: !982)
!985 = !DILocalVariable(name: "i", scope: !982, file: !17, line: 399, type: !7)
!986 = !DILocation(line: 399, column: 6, scope: !982)
!987 = !DILocation(line: 401, column: 2, scope: !982)
!988 = !DILocation(line: 403, column: 6, scope: !989)
!989 = distinct !DILexicalBlock(scope: !982, file: !17, line: 403, column: 6)
!990 = !DILocation(line: 403, column: 18, scope: !989)
!991 = !DILocation(line: 405, column: 9, scope: !992)
!992 = distinct !DILexicalBlock(scope: !993, file: !17, line: 405, column: 3)
!993 = distinct !DILexicalBlock(scope: !989, file: !17, line: 404, column: 2)
!994 = !DILocation(line: 405, column: 8, scope: !992)
!995 = !DILocation(line: 405, column: 12, scope: !996)
!996 = distinct !DILexicalBlock(scope: !992, file: !17, line: 405, column: 3)
!997 = !DILocation(line: 405, column: 23, scope: !996)
!998 = !DILocation(line: 405, column: 14, scope: !996)
!999 = !DILocation(line: 405, column: 36, scope: !996)
!1000 = !DILocation(line: 405, column: 13, scope: !996)
!1001 = !DILocation(line: 405, column: 3, scope: !992)
!1002 = !DILocation(line: 407, column: 28, scope: !1003)
!1003 = distinct !DILexicalBlock(scope: !996, file: !17, line: 406, column: 3)
!1004 = !DILocation(line: 407, column: 19, scope: !1003)
!1005 = !DILocation(line: 407, column: 41, scope: !1003)
!1006 = !DILocation(line: 407, column: 45, scope: !1003)
!1007 = !DILocation(line: 407, column: 4, scope: !1003)
!1008 = !DILocation(line: 408, column: 4, scope: !1003)
!1009 = !DILocation(line: 410, column: 5, scope: !1003)
!1010 = !DILocation(line: 405, column: 47, scope: !996)
!1011 = !DILocation(line: 405, column: 3, scope: !996)
!1012 = distinct !{!1012, !1001, !1013, !334}
!1013 = !DILocation(line: 410, column: 5, scope: !992)
!1014 = !DILocation(line: 411, column: 4, scope: !993)
!1015 = !DILocation(line: 412, column: 1, scope: !982)
!1016 = distinct !DISubprogram(name: "do_il_on", linkageName: "_Z8do_il_ona", scope: !17, file: !17, line: 415, type: !295, scopeLine: 416, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !297)
!1017 = !DILocalVariable(name: "trigger_num", arg: 1, scope: !1016, file: !17, line: 415, type: !165)
!1018 = !DILocation(line: 415, column: 22, scope: !1016)
!1019 = !DILocalVariable(name: "i", scope: !1016, file: !17, line: 438, type: !7)
!1020 = !DILocation(line: 438, column: 6, scope: !1016)
!1021 = !DILocation(line: 440, column: 2, scope: !1016)
!1022 = !DILocation(line: 442, column: 6, scope: !1023)
!1023 = distinct !DILexicalBlock(scope: !1016, file: !17, line: 442, column: 6)
!1024 = !DILocation(line: 442, column: 18, scope: !1023)
!1025 = !DILocation(line: 444, column: 9, scope: !1026)
!1026 = distinct !DILexicalBlock(scope: !1027, file: !17, line: 444, column: 3)
!1027 = distinct !DILexicalBlock(scope: !1023, file: !17, line: 443, column: 2)
!1028 = !DILocation(line: 444, column: 8, scope: !1026)
!1029 = !DILocation(line: 444, column: 12, scope: !1030)
!1030 = distinct !DILexicalBlock(scope: !1026, file: !17, line: 444, column: 3)
!1031 = !DILocation(line: 444, column: 23, scope: !1030)
!1032 = !DILocation(line: 444, column: 14, scope: !1030)
!1033 = !DILocation(line: 444, column: 36, scope: !1030)
!1034 = !DILocation(line: 444, column: 13, scope: !1030)
!1035 = !DILocation(line: 444, column: 3, scope: !1026)
!1036 = !DILocation(line: 446, column: 40, scope: !1037)
!1037 = distinct !DILexicalBlock(scope: !1030, file: !17, line: 445, column: 3)
!1038 = !DILocation(line: 446, column: 31, scope: !1037)
!1039 = !DILocation(line: 446, column: 53, scope: !1037)
!1040 = !DILocation(line: 446, column: 57, scope: !1037)
!1041 = !DILocation(line: 446, column: 22, scope: !1037)
!1042 = !DILocation(line: 446, column: 71, scope: !1037)
!1043 = !DILocation(line: 446, column: 62, scope: !1037)
!1044 = !DILocation(line: 446, column: 84, scope: !1037)
!1045 = !DILocation(line: 446, column: 89, scope: !1037)
!1046 = !DILocation(line: 446, column: 4, scope: !1037)
!1047 = !DILocation(line: 447, column: 4, scope: !1037)
!1048 = !DILocation(line: 449, column: 5, scope: !1037)
!1049 = !DILocation(line: 444, column: 47, scope: !1030)
!1050 = !DILocation(line: 444, column: 3, scope: !1030)
!1051 = distinct !{!1051, !1035, !1052, !334}
!1052 = !DILocation(line: 449, column: 5, scope: !1026)
!1053 = !DILocation(line: 450, column: 4, scope: !1027)
!1054 = !DILocation(line: 451, column: 1, scope: !1016)
!1055 = distinct !DISubprogram(name: "do_il_off", linkageName: "_Z9do_il_offa", scope: !17, file: !17, line: 453, type: !295, scopeLine: 454, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !297)
!1056 = !DILocalVariable(name: "trigger_num", arg: 1, scope: !1055, file: !17, line: 453, type: !165)
!1057 = !DILocation(line: 453, column: 23, scope: !1055)
!1058 = !DILocalVariable(name: "i", scope: !1055, file: !17, line: 476, type: !7)
!1059 = !DILocation(line: 476, column: 6, scope: !1055)
!1060 = !DILocation(line: 478, column: 2, scope: !1055)
!1061 = !DILocation(line: 480, column: 6, scope: !1062)
!1062 = distinct !DILexicalBlock(scope: !1055, file: !17, line: 480, column: 6)
!1063 = !DILocation(line: 480, column: 18, scope: !1062)
!1064 = !DILocation(line: 482, column: 9, scope: !1065)
!1065 = distinct !DILexicalBlock(scope: !1066, file: !17, line: 482, column: 3)
!1066 = distinct !DILexicalBlock(scope: !1062, file: !17, line: 481, column: 2)
!1067 = !DILocation(line: 482, column: 8, scope: !1065)
!1068 = !DILocation(line: 482, column: 12, scope: !1069)
!1069 = distinct !DILexicalBlock(scope: !1065, file: !17, line: 482, column: 3)
!1070 = !DILocation(line: 482, column: 23, scope: !1069)
!1071 = !DILocation(line: 482, column: 14, scope: !1069)
!1072 = !DILocation(line: 482, column: 36, scope: !1069)
!1073 = !DILocation(line: 482, column: 13, scope: !1069)
!1074 = !DILocation(line: 482, column: 3, scope: !1065)
!1075 = !DILocalVariable(name: "cp", scope: !1076, file: !17, line: 484, type: !736)
!1076 = distinct !DILexicalBlock(scope: !1069, file: !17, line: 483, column: 3)
!1077 = !DILocation(line: 484, column: 15, scope: !1076)
!1078 = !DILocalVariable(name: "seg", scope: !1076, file: !17, line: 485, type: !709)
!1079 = !DILocation(line: 485, column: 14, scope: !1076)
!1080 = !DILocation(line: 485, column: 39, scope: !1076)
!1081 = !DILocation(line: 485, column: 30, scope: !1076)
!1082 = !DILocation(line: 485, column: 52, scope: !1076)
!1083 = !DILocation(line: 485, column: 56, scope: !1076)
!1084 = !DILocation(line: 485, column: 21, scope: !1076)
!1085 = !DILocalVariable(name: "side", scope: !1076, file: !17, line: 486, type: !7)
!1086 = !DILocation(line: 486, column: 10, scope: !1076)
!1087 = !DILocation(line: 486, column: 26, scope: !1076)
!1088 = !DILocation(line: 486, column: 17, scope: !1076)
!1089 = !DILocation(line: 486, column: 39, scope: !1076)
!1090 = !DILocation(line: 486, column: 44, scope: !1076)
!1091 = !DILocation(line: 488, column: 22, scope: !1076)
!1092 = !DILocation(line: 488, column: 27, scope: !1076)
!1093 = !DILocation(line: 488, column: 4, scope: !1076)
!1094 = !DILocation(line: 490, column: 4, scope: !1076)
!1095 = !DILocation(line: 493, column: 38, scope: !1076)
!1096 = !DILocation(line: 493, column: 43, scope: !1076)
!1097 = !DILocation(line: 493, column: 4, scope: !1076)
!1098 = !DILocation(line: 494, column: 48, scope: !1076)
!1099 = !DILocation(line: 494, column: 51, scope: !1076)
!1100 = !DILocation(line: 494, column: 62, scope: !1076)
!1101 = !DILocation(line: 494, column: 4, scope: !1076)
!1102 = !DILocation(line: 496, column: 5, scope: !1076)
!1103 = !DILocation(line: 482, column: 47, scope: !1069)
!1104 = !DILocation(line: 482, column: 3, scope: !1069)
!1105 = distinct !{!1105, !1074, !1106, !334}
!1106 = !DILocation(line: 496, column: 5, scope: !1065)
!1107 = !DILocation(line: 497, column: 4, scope: !1066)
!1108 = !DILocation(line: 498, column: 1, scope: !1055)
!1109 = distinct !DISubprogram(name: "wall_is_forcefield", linkageName: "_Z18wall_is_forcefieldP7trigger", scope: !17, file: !17, line: 504, type: !1110, scopeLine: 505, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !297)
!1110 = !DISubroutineType(types: !1111)
!1111 = !{!7, !1112}
!1112 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !267, size: 64)
!1113 = !DILocalVariable(name: "trig", arg: 1, scope: !1109, file: !17, line: 504, type: !1112)
!1114 = !DILocation(line: 504, column: 33, scope: !1109)
!1115 = !DILocalVariable(name: "i", scope: !1109, file: !17, line: 506, type: !7)
!1116 = !DILocation(line: 506, column: 6, scope: !1109)
!1117 = !DILocation(line: 508, column: 8, scope: !1118)
!1118 = distinct !DILexicalBlock(scope: !1109, file: !17, line: 508, column: 2)
!1119 = !DILocation(line: 508, column: 7, scope: !1118)
!1120 = !DILocation(line: 508, column: 11, scope: !1121)
!1121 = distinct !DILexicalBlock(scope: !1118, file: !17, line: 508, column: 2)
!1122 = !DILocation(line: 508, column: 13, scope: !1121)
!1123 = !DILocation(line: 508, column: 19, scope: !1121)
!1124 = !DILocation(line: 508, column: 12, scope: !1121)
!1125 = !DILocation(line: 508, column: 2, scope: !1118)
!1126 = !DILocation(line: 509, column: 26, scope: !1127)
!1127 = distinct !DILexicalBlock(scope: !1121, file: !17, line: 509, column: 7)
!1128 = !DILocation(line: 509, column: 32, scope: !1127)
!1129 = !DILocation(line: 509, column: 36, scope: !1127)
!1130 = !DILocation(line: 509, column: 17, scope: !1127)
!1131 = !DILocation(line: 509, column: 40, scope: !1127)
!1132 = !DILocation(line: 509, column: 46, scope: !1127)
!1133 = !DILocation(line: 509, column: 52, scope: !1127)
!1134 = !DILocation(line: 509, column: 57, scope: !1127)
!1135 = !DILocation(line: 509, column: 61, scope: !1127)
!1136 = !DILocation(line: 509, column: 8, scope: !1127)
!1137 = !DILocation(line: 509, column: 71, scope: !1127)
!1138 = !DILocation(line: 509, column: 77, scope: !1127)
!1139 = !DILocation(line: 509, column: 7, scope: !1127)
!1140 = !DILocation(line: 510, column: 4, scope: !1127)
!1141 = !DILocation(line: 509, column: 94, scope: !1127)
!1142 = !DILocation(line: 508, column: 30, scope: !1121)
!1143 = !DILocation(line: 508, column: 2, scope: !1121)
!1144 = distinct !{!1144, !1125, !1145, !334}
!1145 = !DILocation(line: 510, column: 4, scope: !1118)
!1146 = !DILocation(line: 512, column: 10, scope: !1109)
!1147 = !DILocation(line: 512, column: 12, scope: !1109)
!1148 = !DILocation(line: 512, column: 18, scope: !1109)
!1149 = !DILocation(line: 512, column: 11, scope: !1109)
!1150 = !DILocation(line: 512, column: 9, scope: !1109)
!1151 = !DILocation(line: 512, column: 2, scope: !1109)
!1152 = distinct !DISubprogram(name: "check_trigger_sub", linkageName: "_Z17check_trigger_subiii", scope: !17, file: !17, line: 515, type: !1153, scopeLine: 516, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !297)
!1153 = !DISubroutineType(types: !1154)
!1154 = !{!7, !7, !7, !7}
!1155 = !DILocalVariable(name: "trigger_num", arg: 1, scope: !1152, file: !17, line: 515, type: !7)
!1156 = !DILocation(line: 515, column: 27, scope: !1152)
!1157 = !DILocalVariable(name: "pnum", arg: 2, scope: !1152, file: !17, line: 515, type: !7)
!1158 = !DILocation(line: 515, column: 44, scope: !1152)
!1159 = !DILocalVariable(name: "shot", arg: 3, scope: !1152, file: !17, line: 515, type: !7)
!1160 = !DILocation(line: 515, column: 53, scope: !1152)
!1161 = !DILocalVariable(name: "trig", scope: !1152, file: !17, line: 517, type: !1112)
!1162 = !DILocation(line: 517, column: 11, scope: !1152)
!1163 = !DILocation(line: 517, column: 28, scope: !1152)
!1164 = !DILocation(line: 517, column: 19, scope: !1152)
!1165 = !DILocation(line: 519, column: 2, scope: !1152)
!1166 = !DILocation(line: 521, column: 6, scope: !1167)
!1167 = distinct !DILexicalBlock(scope: !1152, file: !17, line: 521, column: 6)
!1168 = !DILocation(line: 521, column: 12, scope: !1167)
!1169 = !DILocation(line: 521, column: 18, scope: !1167)
!1170 = !DILocation(line: 522, column: 3, scope: !1167)
!1171 = !DILocation(line: 524, column: 6, scope: !1172)
!1172 = distinct !DILexicalBlock(scope: !1152, file: !17, line: 524, column: 6)
!1173 = !DILocation(line: 524, column: 12, scope: !1172)
!1174 = !DILocation(line: 524, column: 18, scope: !1172)
!1175 = !DILocation(line: 525, column: 3, scope: !1172)
!1176 = !DILocation(line: 525, column: 9, scope: !1172)
!1177 = !DILocation(line: 525, column: 15, scope: !1172)
!1178 = !DILocation(line: 527, column: 10, scope: !1152)
!1179 = !DILocation(line: 527, column: 16, scope: !1152)
!1180 = !DILocation(line: 527, column: 2, scope: !1152)
!1181 = !DILocation(line: 531, column: 8, scope: !1182)
!1182 = distinct !DILexicalBlock(scope: !1183, file: !17, line: 531, column: 8)
!1183 = distinct !DILexicalBlock(scope: !1152, file: !17, line: 528, column: 2)
!1184 = !DILocation(line: 531, column: 14, scope: !1182)
!1185 = !DILocation(line: 531, column: 12, scope: !1182)
!1186 = !DILocation(line: 532, column: 6, scope: !1182)
!1187 = !DILocation(line: 534, column: 4, scope: !1183)
!1188 = !DILocation(line: 536, column: 8, scope: !1189)
!1189 = distinct !DILexicalBlock(scope: !1183, file: !17, line: 536, column: 8)
!1190 = !DILocation(line: 536, column: 26, scope: !1189)
!1191 = !DILocation(line: 538, column: 5, scope: !1192)
!1192 = distinct !DILexicalBlock(scope: !1189, file: !17, line: 537, column: 4)
!1193 = !DILocation(line: 539, column: 5, scope: !1192)
!1194 = !DILocation(line: 540, column: 4, scope: !1192)
!1195 = !DILocation(line: 540, column: 15, scope: !1196)
!1196 = distinct !DILexicalBlock(scope: !1189, file: !17, line: 540, column: 15)
!1197 = !DILocation(line: 540, column: 33, scope: !1196)
!1198 = !DILocation(line: 541, column: 18, scope: !1199)
!1199 = distinct !DILexicalBlock(scope: !1200, file: !17, line: 541, column: 9)
!1200 = distinct !DILexicalBlock(scope: !1196, file: !17, line: 540, column: 38)
!1201 = !DILocation(line: 541, column: 10, scope: !1199)
!1202 = !DILocation(line: 541, column: 30, scope: !1199)
!1203 = !DILocation(line: 541, column: 38, scope: !1199)
!1204 = !DILocation(line: 541, column: 43, scope: !1199)
!1205 = !DILocation(line: 541, column: 46, scope: !1199)
!1206 = !DILocation(line: 542, column: 6, scope: !1199)
!1207 = !DILocation(line: 544, column: 5, scope: !1200)
!1208 = !DILocation(line: 545, column: 5, scope: !1200)
!1209 = !DILocation(line: 552, column: 6, scope: !1210)
!1210 = distinct !DILexicalBlock(scope: !1196, file: !17, line: 548, column: 4)
!1211 = !DILocation(line: 555, column: 4, scope: !1183)
!1212 = !DILocalVariable(name: "truth", scope: !1213, file: !17, line: 560, type: !7)
!1213 = distinct !DILexicalBlock(scope: !1183, file: !17, line: 559, column: 3)
!1214 = !DILocation(line: 560, column: 8, scope: !1213)
!1215 = !DILocation(line: 562, column: 8, scope: !1216)
!1216 = distinct !DILexicalBlock(scope: !1213, file: !17, line: 562, column: 8)
!1217 = !DILocation(line: 562, column: 27, scope: !1216)
!1218 = !DILocation(line: 564, column: 5, scope: !1219)
!1219 = distinct !DILexicalBlock(scope: !1216, file: !17, line: 563, column: 4)
!1220 = !DILocation(line: 565, column: 5, scope: !1219)
!1221 = !DILocation(line: 566, column: 5, scope: !1219)
!1222 = !DILocation(line: 569, column: 8, scope: !1223)
!1223 = distinct !DILexicalBlock(scope: !1213, file: !17, line: 569, column: 8)
!1224 = !DILocation(line: 569, column: 14, scope: !1223)
!1225 = !DILocation(line: 569, column: 12, scope: !1223)
!1226 = !DILocation(line: 570, column: 5, scope: !1223)
!1227 = !DILocation(line: 572, column: 17, scope: !1228)
!1228 = distinct !DILexicalBlock(scope: !1213, file: !17, line: 572, column: 8)
!1229 = !DILocation(line: 572, column: 9, scope: !1228)
!1230 = !DILocation(line: 572, column: 29, scope: !1228)
!1231 = !DILocation(line: 572, column: 37, scope: !1228)
!1232 = !DILocation(line: 572, column: 42, scope: !1228)
!1233 = !DILocation(line: 572, column: 45, scope: !1228)
!1234 = !DILocation(line: 573, column: 5, scope: !1228)
!1235 = !DILocation(line: 575, column: 8, scope: !1236)
!1236 = distinct !DILexicalBlock(scope: !1213, file: !17, line: 575, column: 8)
!1237 = !DILocation(line: 575, column: 18, scope: !1236)
!1238 = !DILocation(line: 577, column: 5, scope: !1239)
!1239 = distinct !DILexicalBlock(scope: !1236, file: !17, line: 576, column: 4)
!1240 = !DILocation(line: 578, column: 5, scope: !1239)
!1241 = !DILocation(line: 579, column: 5, scope: !1239)
!1242 = !DILocation(line: 582, column: 12, scope: !1213)
!1243 = !DILocation(line: 582, column: 10, scope: !1213)
!1244 = !DILocation(line: 584, column: 8, scope: !1245)
!1245 = distinct !DILexicalBlock(scope: !1213, file: !17, line: 584, column: 8)
!1246 = !DILocation(line: 584, column: 22, scope: !1245)
!1247 = !DILocation(line: 585, column: 38, scope: !1245)
!1248 = !DILocation(line: 585, column: 5, scope: !1245)
!1249 = !DILocation(line: 587, column: 9, scope: !1250)
!1250 = distinct !DILexicalBlock(scope: !1213, file: !17, line: 587, column: 8)
!1251 = !DILocation(line: 587, column: 23, scope: !1250)
!1252 = !DILocation(line: 587, column: 45, scope: !1250)
!1253 = !DILocation(line: 587, column: 48, scope: !1250)
!1254 = !DILocation(line: 589, column: 5, scope: !1255)
!1255 = distinct !DILexicalBlock(scope: !1250, file: !17, line: 588, column: 4)
!1256 = !DILocation(line: 590, column: 5, scope: !1255)
!1257 = !DILocation(line: 591, column: 5, scope: !1255)
!1258 = !DILocation(line: 594, column: 8, scope: !1259)
!1259 = distinct !DILexicalBlock(scope: !1213, file: !17, line: 594, column: 8)
!1260 = !DILocation(line: 594, column: 22, scope: !1259)
!1261 = !DILocation(line: 595, column: 19, scope: !1259)
!1262 = !DILocation(line: 595, column: 5, scope: !1259)
!1263 = !DILocation(line: 597, column: 4, scope: !1213)
!1264 = !DILocation(line: 599, column: 4, scope: !1213)
!1265 = !DILocation(line: 600, column: 4, scope: !1213)
!1266 = !DILocation(line: 602, column: 4, scope: !1213)
!1267 = !DILocation(line: 603, column: 4, scope: !1213)
!1268 = !DILocation(line: 604, column: 29, scope: !1213)
!1269 = !DILocation(line: 605, column: 4, scope: !1213)
!1270 = !DILocation(line: 611, column: 4, scope: !1183)
!1271 = !DILocation(line: 612, column: 12, scope: !1183)
!1272 = !DILocation(line: 612, column: 4, scope: !1183)
!1273 = !DILocation(line: 613, column: 27, scope: !1183)
!1274 = !DILocation(line: 613, column: 32, scope: !1183)
!1275 = !DILocation(line: 613, column: 44, scope: !1183)
!1276 = !DILocation(line: 613, column: 4, scope: !1183)
!1277 = !DILocation(line: 615, column: 4, scope: !1183)
!1278 = !DILocation(line: 618, column: 18, scope: !1183)
!1279 = !DILocation(line: 618, column: 4, scope: !1183)
!1280 = !DILocation(line: 619, column: 27, scope: !1183)
!1281 = !DILocation(line: 619, column: 32, scope: !1183)
!1282 = !DILocation(line: 619, column: 44, scope: !1183)
!1283 = !DILocation(line: 619, column: 4, scope: !1183)
!1284 = !DILocation(line: 620, column: 4, scope: !1183)
!1285 = !DILocation(line: 623, column: 4, scope: !1183)
!1286 = !DILocation(line: 624, column: 20, scope: !1183)
!1287 = !DILocation(line: 624, column: 4, scope: !1183)
!1288 = !DILocation(line: 625, column: 27, scope: !1183)
!1289 = !DILocation(line: 625, column: 32, scope: !1183)
!1290 = !DILocation(line: 625, column: 44, scope: !1183)
!1291 = !DILocation(line: 625, column: 4, scope: !1183)
!1292 = !DILocation(line: 627, column: 4, scope: !1183)
!1293 = !DILocation(line: 630, column: 4, scope: !1183)
!1294 = !DILocation(line: 631, column: 18, scope: !1183)
!1295 = !DILocation(line: 631, column: 4, scope: !1183)
!1296 = !DILocation(line: 632, column: 27, scope: !1183)
!1297 = !DILocation(line: 632, column: 32, scope: !1183)
!1298 = !DILocation(line: 632, column: 44, scope: !1183)
!1299 = !DILocation(line: 632, column: 4, scope: !1183)
!1300 = !DILocation(line: 634, column: 4, scope: !1183)
!1301 = !DILocation(line: 637, column: 24, scope: !1302)
!1302 = distinct !DILexicalBlock(scope: !1183, file: !17, line: 637, column: 8)
!1303 = !DILocation(line: 637, column: 8, scope: !1302)
!1304 = !DILocation(line: 638, column: 28, scope: !1305)
!1305 = distinct !DILexicalBlock(scope: !1302, file: !17, line: 638, column: 9)
!1306 = !DILocation(line: 638, column: 9, scope: !1305)
!1307 = !DILocation(line: 639, column: 29, scope: !1305)
!1308 = !DILocation(line: 639, column: 34, scope: !1305)
!1309 = !DILocation(line: 639, column: 46, scope: !1305)
!1310 = !DILocation(line: 639, column: 6, scope: !1305)
!1311 = !DILocation(line: 641, column: 29, scope: !1305)
!1312 = !DILocation(line: 641, column: 34, scope: !1305)
!1313 = !DILocation(line: 641, column: 46, scope: !1305)
!1314 = !DILocation(line: 641, column: 6, scope: !1305)
!1315 = !DILocation(line: 638, column: 32, scope: !1305)
!1316 = !DILocation(line: 642, column: 4, scope: !1183)
!1317 = !DILocation(line: 645, column: 24, scope: !1318)
!1318 = distinct !DILexicalBlock(scope: !1183, file: !17, line: 645, column: 8)
!1319 = !DILocation(line: 645, column: 8, scope: !1318)
!1320 = !DILocation(line: 646, column: 28, scope: !1321)
!1321 = distinct !DILexicalBlock(scope: !1318, file: !17, line: 646, column: 9)
!1322 = !DILocation(line: 646, column: 9, scope: !1321)
!1323 = !DILocation(line: 647, column: 29, scope: !1321)
!1324 = !DILocation(line: 647, column: 34, scope: !1321)
!1325 = !DILocation(line: 647, column: 46, scope: !1321)
!1326 = !DILocation(line: 647, column: 6, scope: !1321)
!1327 = !DILocation(line: 649, column: 29, scope: !1321)
!1328 = !DILocation(line: 649, column: 34, scope: !1321)
!1329 = !DILocation(line: 649, column: 46, scope: !1321)
!1330 = !DILocation(line: 649, column: 6, scope: !1321)
!1331 = !DILocation(line: 646, column: 32, scope: !1321)
!1332 = !DILocation(line: 650, column: 4, scope: !1183)
!1333 = !DILocation(line: 654, column: 20, scope: !1183)
!1334 = !DILocation(line: 654, column: 4, scope: !1183)
!1335 = !DILocation(line: 655, column: 4, scope: !1183)
!1336 = !DILocation(line: 658, column: 10, scope: !1337)
!1337 = distinct !DILexicalBlock(scope: !1183, file: !17, line: 658, column: 8)
!1338 = !DILocation(line: 658, column: 20, scope: !1337)
!1339 = !DILocation(line: 658, column: 9, scope: !1337)
!1340 = !DILocation(line: 658, column: 32, scope: !1337)
!1341 = !DILocation(line: 658, column: 36, scope: !1337)
!1342 = !DILocation(line: 658, column: 46, scope: !1337)
!1343 = !DILocation(line: 658, column: 35, scope: !1337)
!1344 = !DILocation(line: 659, column: 15, scope: !1337)
!1345 = !DILocation(line: 659, column: 5, scope: !1337)
!1346 = !DILocation(line: 660, column: 4, scope: !1183)
!1347 = !DILocation(line: 663, column: 4, scope: !1183)
!1348 = !DILocation(line: 664, column: 13, scope: !1183)
!1349 = !DILocation(line: 664, column: 4, scope: !1183)
!1350 = !DILocation(line: 665, column: 27, scope: !1183)
!1351 = !DILocation(line: 665, column: 32, scope: !1183)
!1352 = !DILocation(line: 665, column: 44, scope: !1183)
!1353 = !DILocation(line: 665, column: 4, scope: !1183)
!1354 = !DILocation(line: 666, column: 4, scope: !1183)
!1355 = !DILocation(line: 669, column: 4, scope: !1183)
!1356 = !DILocation(line: 670, column: 14, scope: !1183)
!1357 = !DILocation(line: 670, column: 4, scope: !1183)
!1358 = !DILocation(line: 671, column: 27, scope: !1183)
!1359 = !DILocation(line: 671, column: 32, scope: !1183)
!1360 = !DILocation(line: 671, column: 44, scope: !1183)
!1361 = !DILocation(line: 671, column: 4, scope: !1183)
!1362 = !DILocation(line: 672, column: 4, scope: !1183)
!1363 = !DILocation(line: 675, column: 21, scope: !1364)
!1364 = distinct !DILexicalBlock(scope: !1183, file: !17, line: 675, column: 8)
!1365 = !DILocation(line: 675, column: 8, scope: !1364)
!1366 = !DILocation(line: 676, column: 28, scope: !1364)
!1367 = !DILocation(line: 676, column: 33, scope: !1364)
!1368 = !DILocation(line: 676, column: 45, scope: !1364)
!1369 = !DILocation(line: 676, column: 5, scope: !1364)
!1370 = !DILocation(line: 677, column: 4, scope: !1183)
!1371 = !DILocation(line: 680, column: 20, scope: !1372)
!1372 = distinct !DILexicalBlock(scope: !1183, file: !17, line: 680, column: 8)
!1373 = !DILocation(line: 680, column: 8, scope: !1372)
!1374 = !DILocation(line: 681, column: 28, scope: !1372)
!1375 = !DILocation(line: 681, column: 33, scope: !1372)
!1376 = !DILocation(line: 681, column: 45, scope: !1372)
!1377 = !DILocation(line: 681, column: 5, scope: !1372)
!1378 = !DILocation(line: 683, column: 4, scope: !1183)
!1379 = !DILocation(line: 686, column: 4, scope: !1183)
!1380 = !DILocation(line: 687, column: 4, scope: !1183)
!1381 = !DILocation(line: 690, column: 2, scope: !1152)
!1382 = !DILocation(line: 691, column: 1, scope: !1152)
!1383 = distinct !DISubprogram(name: "check_trigger", linkageName: "_Z13check_triggerP7segmentssi", scope: !17, file: !17, line: 695, type: !1384, scopeLine: 696, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !297)
!1384 = !DISubroutineType(types: !1385)
!1385 = !{null, !709, !172, !172, !7}
!1386 = !DILocalVariable(name: "seg", arg: 1, scope: !1383, file: !17, line: 695, type: !709)
!1387 = !DILocation(line: 695, column: 29, scope: !1383)
!1388 = !DILocalVariable(name: "side", arg: 2, scope: !1383, file: !17, line: 695, type: !172)
!1389 = !DILocation(line: 695, column: 40, scope: !1383)
!1390 = !DILocalVariable(name: "objnum", arg: 3, scope: !1383, file: !17, line: 695, type: !172)
!1391 = !DILocation(line: 695, column: 52, scope: !1383)
!1392 = !DILocalVariable(name: "shot", arg: 4, scope: !1383, file: !17, line: 695, type: !7)
!1393 = !DILocation(line: 695, column: 63, scope: !1383)
!1394 = !DILocalVariable(name: "wall_num", scope: !1383, file: !17, line: 697, type: !7)
!1395 = !DILocation(line: 697, column: 6, scope: !1383)
!1396 = !DILocalVariable(name: "trigger_num", scope: !1383, file: !17, line: 697, type: !7)
!1397 = !DILocation(line: 697, column: 16, scope: !1383)
!1398 = !DILocation(line: 703, column: 7, scope: !1399)
!1399 = distinct !DILexicalBlock(scope: !1383, file: !17, line: 703, column: 6)
!1400 = !DILocation(line: 703, column: 25, scope: !1399)
!1401 = !DILocation(line: 703, column: 17, scope: !1399)
!1402 = !DILocation(line: 703, column: 37, scope: !1399)
!1403 = !DILocation(line: 703, column: 14, scope: !1399)
!1404 = !DILocation(line: 703, column: 45, scope: !1399)
!1405 = !DILocation(line: 703, column: 58, scope: !1399)
!1406 = !DILocation(line: 703, column: 50, scope: !1399)
!1407 = !DILocation(line: 703, column: 66, scope: !1399)
!1408 = !DILocation(line: 703, column: 71, scope: !1399)
!1409 = !DILocation(line: 703, column: 85, scope: !1399)
!1410 = !DILocation(line: 703, column: 108, scope: !1399)
!1411 = !DILocation(line: 703, column: 100, scope: !1399)
!1412 = !DILocation(line: 703, column: 116, scope: !1399)
!1413 = !DILocation(line: 703, column: 89, scope: !1399)
!1414 = !DILocation(line: 703, column: 120, scope: !1399)
!1415 = !DILocation(line: 703, column: 88, scope: !1399)
!1416 = !DILocation(line: 706, column: 8, scope: !1417)
!1417 = distinct !DILexicalBlock(scope: !1418, file: !17, line: 706, column: 8)
!1418 = distinct !DILexicalBlock(scope: !1399, file: !17, line: 704, column: 2)
!1419 = !DILocation(line: 706, column: 22, scope: !1417)
!1420 = !DILocation(line: 707, column: 28, scope: !1417)
!1421 = !DILocation(line: 707, column: 31, scope: !1417)
!1422 = !DILocation(line: 707, column: 42, scope: !1417)
!1423 = !DILocation(line: 707, column: 48, scope: !1417)
!1424 = !DILocation(line: 707, column: 55, scope: !1417)
!1425 = !DILocation(line: 707, column: 4, scope: !1417)
!1426 = !DILocation(line: 709, column: 14, scope: !1418)
!1427 = !DILocation(line: 709, column: 19, scope: !1418)
!1428 = !DILocation(line: 709, column: 25, scope: !1418)
!1429 = !DILocation(line: 709, column: 31, scope: !1418)
!1430 = !DILocation(line: 709, column: 12, scope: !1418)
!1431 = !DILocation(line: 710, column: 8, scope: !1432)
!1432 = distinct !DILexicalBlock(scope: !1418, file: !17, line: 710, column: 8)
!1433 = !DILocation(line: 710, column: 17, scope: !1432)
!1434 = !DILocation(line: 710, column: 25, scope: !1432)
!1435 = !DILocation(line: 712, column: 23, scope: !1418)
!1436 = !DILocation(line: 712, column: 17, scope: !1418)
!1437 = !DILocation(line: 712, column: 33, scope: !1418)
!1438 = !DILocation(line: 712, column: 15, scope: !1418)
!1439 = !DILocation(line: 714, column: 7, scope: !1440)
!1440 = distinct !DILexicalBlock(scope: !1418, file: !17, line: 714, column: 7)
!1441 = !DILocation(line: 714, column: 19, scope: !1440)
!1442 = !DILocation(line: 715, column: 4, scope: !1440)
!1443 = !DILocation(line: 724, column: 25, scope: !1444)
!1444 = distinct !DILexicalBlock(scope: !1418, file: !17, line: 724, column: 7)
!1445 = !DILocation(line: 724, column: 38, scope: !1444)
!1446 = !DILocation(line: 724, column: 49, scope: !1444)
!1447 = !DILocation(line: 724, column: 7, scope: !1444)
!1448 = !DILocation(line: 725, column: 4, scope: !1444)
!1449 = !DILocation(line: 746, column: 2, scope: !1418)
!1450 = !DILocation(line: 747, column: 1, scope: !1383)
!1451 = distinct !DISubprogram(name: "triggers_frame_process", linkageName: "_Z22triggers_frame_processv", scope: !17, file: !17, line: 749, type: !617, scopeLine: 750, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !297)
!1452 = !DILocalVariable(name: "i", scope: !1451, file: !17, line: 751, type: !7)
!1453 = !DILocation(line: 751, column: 6, scope: !1451)
!1454 = !DILocation(line: 753, column: 8, scope: !1455)
!1455 = distinct !DILexicalBlock(scope: !1451, file: !17, line: 753, column: 2)
!1456 = !DILocation(line: 753, column: 7, scope: !1455)
!1457 = !DILocation(line: 753, column: 11, scope: !1458)
!1458 = distinct !DILexicalBlock(scope: !1455, file: !17, line: 753, column: 2)
!1459 = !DILocation(line: 753, column: 13, scope: !1458)
!1460 = !DILocation(line: 753, column: 12, scope: !1458)
!1461 = !DILocation(line: 753, column: 2, scope: !1455)
!1462 = !DILocation(line: 754, column: 16, scope: !1463)
!1463 = distinct !DILexicalBlock(scope: !1458, file: !17, line: 754, column: 7)
!1464 = !DILocation(line: 754, column: 7, scope: !1463)
!1465 = !DILocation(line: 754, column: 19, scope: !1463)
!1466 = !DILocation(line: 754, column: 24, scope: !1463)
!1467 = !DILocation(line: 755, column: 24, scope: !1463)
!1468 = !DILocation(line: 755, column: 13, scope: !1463)
!1469 = !DILocation(line: 755, column: 4, scope: !1463)
!1470 = !DILocation(line: 755, column: 16, scope: !1463)
!1471 = !DILocation(line: 755, column: 21, scope: !1463)
!1472 = !DILocation(line: 754, column: 27, scope: !1463)
!1473 = !DILocation(line: 753, column: 27, scope: !1458)
!1474 = !DILocation(line: 753, column: 2, scope: !1458)
!1475 = distinct !{!1475, !1461, !1476, !334}
!1476 = !DILocation(line: 755, column: 24, scope: !1455)
!1477 = !DILocation(line: 756, column: 1, scope: !1451)
!1478 = distinct !DISubprogram(name: "read_trigger", linkageName: "_Z12read_triggerP7triggerP7__sFILE", scope: !17, file: !17, line: 760, type: !1479, scopeLine: 761, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !297)
!1479 = !DISubroutineType(types: !1480)
!1480 = !{null, !1112, !1481}
!1481 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1482, size: 64)
!1482 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !1483, line: 162, baseType: !1484)
!1483 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "d91ebd7d161d9196cc100822ef0e5cdf")
!1484 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILE", file: !1483, line: 131, size: 1216, flags: DIFlagTypePassByValue, elements: !1485, identifier: "_ZTS7__sFILE")
!1485 = !{!1486, !1488, !1489, !1490, !1491, !1492, !1497, !1498, !1500, !1504, !1508, !1516, !1520, !1521, !1524, !1525, !1529, !1531, !1532, !1533}
!1486 = !DIDerivedType(tag: DW_TAG_member, name: "_p", scope: !1484, file: !1483, line: 132, baseType: !1487, size: 64)
!1487 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !183, size: 64)
!1488 = !DIDerivedType(tag: DW_TAG_member, name: "_r", scope: !1484, file: !1483, line: 133, baseType: !7, size: 32, offset: 64)
!1489 = !DIDerivedType(tag: DW_TAG_member, name: "_w", scope: !1484, file: !1483, line: 134, baseType: !7, size: 32, offset: 96)
!1490 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !1484, file: !1483, line: 135, baseType: !172, size: 16, offset: 128)
!1491 = !DIDerivedType(tag: DW_TAG_member, name: "_file", scope: !1484, file: !1483, line: 136, baseType: !172, size: 16, offset: 144)
!1492 = !DIDerivedType(tag: DW_TAG_member, name: "_bf", scope: !1484, file: !1483, line: 137, baseType: !1493, size: 128, offset: 192)
!1493 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sbuf", file: !1483, line: 97, size: 128, flags: DIFlagTypePassByValue, elements: !1494, identifier: "_ZTS6__sbuf")
!1494 = !{!1495, !1496}
!1495 = !DIDerivedType(tag: DW_TAG_member, name: "_base", scope: !1493, file: !1483, line: 98, baseType: !1487, size: 64)
!1496 = !DIDerivedType(tag: DW_TAG_member, name: "_size", scope: !1493, file: !1483, line: 99, baseType: !7, size: 32, offset: 64)
!1497 = !DIDerivedType(tag: DW_TAG_member, name: "_lbfsize", scope: !1484, file: !1483, line: 138, baseType: !7, size: 32, offset: 320)
!1498 = !DIDerivedType(tag: DW_TAG_member, name: "_cookie", scope: !1484, file: !1483, line: 141, baseType: !1499, size: 64, offset: 384)
!1499 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!1500 = !DIDerivedType(tag: DW_TAG_member, name: "_close", scope: !1484, file: !1483, line: 142, baseType: !1501, size: 64, offset: 448)
!1501 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1502, size: 64)
!1502 = !DISubroutineType(types: !1503)
!1503 = !{!7, !1499}
!1504 = !DIDerivedType(tag: DW_TAG_member, name: "_read", scope: !1484, file: !1483, line: 143, baseType: !1505, size: 64, offset: 512)
!1505 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1506, size: 64)
!1506 = !DISubroutineType(types: !1507)
!1507 = !{!7, !1499, !12, !7}
!1508 = !DIDerivedType(tag: DW_TAG_member, name: "_seek", scope: !1484, file: !1483, line: 144, baseType: !1509, size: 64, offset: 576)
!1509 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1510, size: 64)
!1510 = !DISubroutineType(types: !1511)
!1511 = !{!1512, !1499, !1512, !7}
!1512 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !1483, line: 86, baseType: !1513)
!1513 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_off_t", file: !1514, line: 83, baseType: !1515)
!1514 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "af82ff6119a9fa80fad635d276556d46")
!1515 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !233, line: 37, baseType: !179)
!1516 = !DIDerivedType(tag: DW_TAG_member, name: "_write", scope: !1484, file: !1483, line: 145, baseType: !1517, size: 64, offset: 640)
!1517 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1518, size: 64)
!1518 = !DISubroutineType(types: !1519)
!1519 = !{!7, !1499, !948, !7}
!1520 = !DIDerivedType(tag: DW_TAG_member, name: "_ub", scope: !1484, file: !1483, line: 148, baseType: !1493, size: 128, offset: 704)
!1521 = !DIDerivedType(tag: DW_TAG_member, name: "_extra", scope: !1484, file: !1483, line: 149, baseType: !1522, size: 64, offset: 832)
!1522 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1523, size: 64)
!1523 = !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILEX", file: !1483, line: 103, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS8__sFILEX")
!1524 = !DIDerivedType(tag: DW_TAG_member, name: "_ur", scope: !1484, file: !1483, line: 150, baseType: !7, size: 32, offset: 896)
!1525 = !DIDerivedType(tag: DW_TAG_member, name: "_ubuf", scope: !1484, file: !1483, line: 153, baseType: !1526, size: 24, offset: 928)
!1526 = !DICompositeType(tag: DW_TAG_array_type, baseType: !183, size: 24, elements: !1527)
!1527 = !{!1528}
!1528 = !DISubrange(count: 3)
!1529 = !DIDerivedType(tag: DW_TAG_member, name: "_nbuf", scope: !1484, file: !1483, line: 154, baseType: !1530, size: 8, offset: 952)
!1530 = !DICompositeType(tag: DW_TAG_array_type, baseType: !183, size: 8, elements: !79)
!1531 = !DIDerivedType(tag: DW_TAG_member, name: "_lb", scope: !1484, file: !1483, line: 157, baseType: !1493, size: 128, offset: 960)
!1532 = !DIDerivedType(tag: DW_TAG_member, name: "_blksize", scope: !1484, file: !1483, line: 160, baseType: !7, size: 32, offset: 1088)
!1533 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !1484, file: !1483, line: 161, baseType: !1512, size: 64, offset: 1152)
!1534 = !DILocalVariable(name: "trig", arg: 1, scope: !1478, file: !17, line: 760, type: !1112)
!1535 = !DILocation(line: 760, column: 28, scope: !1478)
!1536 = !DILocalVariable(name: "fp", arg: 2, scope: !1478, file: !17, line: 760, type: !1481)
!1537 = !DILocation(line: 760, column: 40, scope: !1478)
!1538 = !DILocalVariable(name: "j", scope: !1478, file: !17, line: 762, type: !7)
!1539 = !DILocation(line: 762, column: 6, scope: !1478)
!1540 = !DILocation(line: 763, column: 30, scope: !1478)
!1541 = !DILocation(line: 763, column: 15, scope: !1478)
!1542 = !DILocation(line: 763, column: 2, scope: !1478)
!1543 = !DILocation(line: 763, column: 8, scope: !1478)
!1544 = !DILocation(line: 763, column: 13, scope: !1478)
!1545 = !DILocation(line: 764, column: 31, scope: !1478)
!1546 = !DILocation(line: 764, column: 16, scope: !1478)
!1547 = !DILocation(line: 764, column: 2, scope: !1478)
!1548 = !DILocation(line: 764, column: 8, scope: !1478)
!1549 = !DILocation(line: 764, column: 14, scope: !1478)
!1550 = !DILocation(line: 765, column: 35, scope: !1478)
!1551 = !DILocation(line: 765, column: 20, scope: !1478)
!1552 = !DILocation(line: 765, column: 2, scope: !1478)
!1553 = !DILocation(line: 765, column: 8, scope: !1478)
!1554 = !DILocation(line: 765, column: 18, scope: !1478)
!1555 = !DILocation(line: 766, column: 29, scope: !1478)
!1556 = !DILocation(line: 766, column: 14, scope: !1478)
!1557 = !DILocation(line: 766, column: 2, scope: !1478)
!1558 = !DILocation(line: 766, column: 8, scope: !1478)
!1559 = !DILocation(line: 766, column: 12, scope: !1478)
!1560 = !DILocation(line: 768, column: 30, scope: !1478)
!1561 = !DILocation(line: 768, column: 16, scope: !1478)
!1562 = !DILocation(line: 768, column: 2, scope: !1478)
!1563 = !DILocation(line: 768, column: 8, scope: !1478)
!1564 = !DILocation(line: 768, column: 14, scope: !1478)
!1565 = !DILocation(line: 769, column: 29, scope: !1478)
!1566 = !DILocation(line: 769, column: 15, scope: !1478)
!1567 = !DILocation(line: 769, column: 2, scope: !1478)
!1568 = !DILocation(line: 769, column: 8, scope: !1478)
!1569 = !DILocation(line: 769, column: 13, scope: !1478)
!1570 = !DILocation(line: 770, column: 9, scope: !1571)
!1571 = distinct !DILexicalBlock(scope: !1478, file: !17, line: 770, column: 2)
!1572 = !DILocation(line: 770, column: 7, scope: !1571)
!1573 = !DILocation(line: 770, column: 14, scope: !1574)
!1574 = distinct !DILexicalBlock(scope: !1571, file: !17, line: 770, column: 2)
!1575 = !DILocation(line: 770, column: 16, scope: !1574)
!1576 = !DILocation(line: 770, column: 2, scope: !1571)
!1577 = !DILocation(line: 771, column: 34, scope: !1574)
!1578 = !DILocation(line: 771, column: 18, scope: !1574)
!1579 = !DILocation(line: 771, column: 3, scope: !1574)
!1580 = !DILocation(line: 771, column: 9, scope: !1574)
!1581 = !DILocation(line: 771, column: 13, scope: !1574)
!1582 = !DILocation(line: 771, column: 16, scope: !1574)
!1583 = !DILocation(line: 770, column: 39, scope: !1574)
!1584 = !DILocation(line: 770, column: 2, scope: !1574)
!1585 = distinct !{!1585, !1576, !1586, !334}
!1586 = !DILocation(line: 771, column: 36, scope: !1571)
!1587 = !DILocation(line: 772, column: 9, scope: !1588)
!1588 = distinct !DILexicalBlock(scope: !1478, file: !17, line: 772, column: 2)
!1589 = !DILocation(line: 772, column: 7, scope: !1588)
!1590 = !DILocation(line: 772, column: 14, scope: !1591)
!1591 = distinct !DILexicalBlock(scope: !1588, file: !17, line: 772, column: 2)
!1592 = !DILocation(line: 772, column: 16, scope: !1591)
!1593 = !DILocation(line: 772, column: 2, scope: !1588)
!1594 = !DILocation(line: 773, column: 35, scope: !1591)
!1595 = !DILocation(line: 773, column: 19, scope: !1591)
!1596 = !DILocation(line: 773, column: 3, scope: !1591)
!1597 = !DILocation(line: 773, column: 9, scope: !1591)
!1598 = !DILocation(line: 773, column: 14, scope: !1591)
!1599 = !DILocation(line: 773, column: 17, scope: !1591)
!1600 = !DILocation(line: 772, column: 39, scope: !1591)
!1601 = !DILocation(line: 772, column: 2, scope: !1591)
!1602 = distinct !{!1602, !1593, !1603, !334}
!1603 = !DILocation(line: 773, column: 37, scope: !1588)
!1604 = !DILocation(line: 774, column: 1, scope: !1478)
!1605 = distinct !DISubprogram(name: "write_trigger", linkageName: "_Z13write_triggerP7triggerP7__sFILE", scope: !17, file: !17, line: 776, type: !1479, scopeLine: 777, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !297)
!1606 = !DILocalVariable(name: "trig", arg: 1, scope: !1605, file: !17, line: 776, type: !1112)
!1607 = !DILocation(line: 776, column: 29, scope: !1605)
!1608 = !DILocalVariable(name: "fp", arg: 2, scope: !1605, file: !17, line: 776, type: !1481)
!1609 = !DILocation(line: 776, column: 41, scope: !1605)
!1610 = !DILocalVariable(name: "j", scope: !1605, file: !17, line: 778, type: !7)
!1611 = !DILocation(line: 778, column: 6, scope: !1605)
!1612 = !DILocation(line: 779, column: 18, scope: !1605)
!1613 = !DILocation(line: 779, column: 22, scope: !1605)
!1614 = !DILocation(line: 779, column: 28, scope: !1605)
!1615 = !DILocation(line: 779, column: 2, scope: !1605)
!1616 = !DILocation(line: 780, column: 18, scope: !1605)
!1617 = !DILocation(line: 780, column: 22, scope: !1605)
!1618 = !DILocation(line: 780, column: 28, scope: !1605)
!1619 = !DILocation(line: 780, column: 2, scope: !1605)
!1620 = !DILocation(line: 781, column: 18, scope: !1605)
!1621 = !DILocation(line: 781, column: 22, scope: !1605)
!1622 = !DILocation(line: 781, column: 28, scope: !1605)
!1623 = !DILocation(line: 781, column: 2, scope: !1605)
!1624 = !DILocation(line: 782, column: 18, scope: !1605)
!1625 = !DILocation(line: 782, column: 22, scope: !1605)
!1626 = !DILocation(line: 782, column: 28, scope: !1605)
!1627 = !DILocation(line: 782, column: 2, scope: !1605)
!1628 = !DILocation(line: 784, column: 17, scope: !1605)
!1629 = !DILocation(line: 784, column: 21, scope: !1605)
!1630 = !DILocation(line: 784, column: 27, scope: !1605)
!1631 = !DILocation(line: 784, column: 2, scope: !1605)
!1632 = !DILocation(line: 785, column: 17, scope: !1605)
!1633 = !DILocation(line: 785, column: 21, scope: !1605)
!1634 = !DILocation(line: 785, column: 27, scope: !1605)
!1635 = !DILocation(line: 785, column: 2, scope: !1605)
!1636 = !DILocation(line: 786, column: 9, scope: !1637)
!1637 = distinct !DILexicalBlock(scope: !1605, file: !17, line: 786, column: 2)
!1638 = !DILocation(line: 786, column: 7, scope: !1637)
!1639 = !DILocation(line: 786, column: 14, scope: !1640)
!1640 = distinct !DILexicalBlock(scope: !1637, file: !17, line: 786, column: 2)
!1641 = !DILocation(line: 786, column: 16, scope: !1640)
!1642 = !DILocation(line: 786, column: 2, scope: !1637)
!1643 = !DILocation(line: 787, column: 20, scope: !1640)
!1644 = !DILocation(line: 787, column: 24, scope: !1640)
!1645 = !DILocation(line: 787, column: 30, scope: !1640)
!1646 = !DILocation(line: 787, column: 34, scope: !1640)
!1647 = !DILocation(line: 787, column: 3, scope: !1640)
!1648 = !DILocation(line: 786, column: 39, scope: !1640)
!1649 = !DILocation(line: 786, column: 2, scope: !1640)
!1650 = distinct !{!1650, !1642, !1651, !334}
!1651 = !DILocation(line: 787, column: 36, scope: !1637)
!1652 = !DILocation(line: 788, column: 9, scope: !1653)
!1653 = distinct !DILexicalBlock(scope: !1605, file: !17, line: 788, column: 2)
!1654 = !DILocation(line: 788, column: 7, scope: !1653)
!1655 = !DILocation(line: 788, column: 14, scope: !1656)
!1656 = distinct !DILexicalBlock(scope: !1653, file: !17, line: 788, column: 2)
!1657 = !DILocation(line: 788, column: 16, scope: !1656)
!1658 = !DILocation(line: 788, column: 2, scope: !1653)
!1659 = !DILocation(line: 789, column: 20, scope: !1656)
!1660 = !DILocation(line: 789, column: 24, scope: !1656)
!1661 = !DILocation(line: 789, column: 30, scope: !1656)
!1662 = !DILocation(line: 789, column: 35, scope: !1656)
!1663 = !DILocation(line: 789, column: 3, scope: !1656)
!1664 = !DILocation(line: 788, column: 39, scope: !1656)
!1665 = !DILocation(line: 788, column: 2, scope: !1656)
!1666 = distinct !{!1666, !1658, !1667, !334}
!1667 = !DILocation(line: 789, column: 37, scope: !1653)
!1668 = !DILocation(line: 790, column: 1, scope: !1605)
