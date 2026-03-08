; ModuleID = '/Users/richard/code/ChocolateDescent/main_d2/fuelcen.cpp'
source_filename = "/Users/richard/code/ChocolateDescent/main_d2/fuelcen.cpp"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

%struct.matcen_info = type { [2 x i32], i32, i32, i16, i16 }
%struct.FuelCenter = type { i32, i32, i8, i8, i8, i8, i32, i32, i32, i32, %struct.vms_vector }
%struct.vms_vector = type { i32, i32, i32 }
%struct.segment2 = type { i8, i8, i8, i8, i32 }
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
%struct.vms_angvec = type { i16, i16, i16 }
%struct.player = type { [9 x i8], [4 x i8], i16, i8, i32, i32, i32, i32, i32, i32, i8, i8, i8, i8, i16, i16, i16, [10 x i16], [10 x i16], i16, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i16, i8, i8, i32, i8, i8 }
%struct.polymodel = type { i32, i32, ptr, [10 x i32], [10 x %struct.vms_vector], [10 x %struct.vms_vector], [10 x %struct.vms_vector], [10 x i32], [10 x i8], [10 x %struct.vms_vector], [10 x %struct.vms_vector], %struct.vms_vector, %struct.vms_vector, i32, i8, i16, i8 }
%struct.robot_info = type { i32, [8 x %struct.vms_vector], [8 x i8], i16, i16, i16, i16, i8, i8, i8, i8, i8, i8, i8, i8, i16, i8, i8, i32, i32, i32, i32, [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i8], [5 x i8], i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, [3 x i8], i8, i8, i8, i8, [9 x [5 x %struct.jointlist]], i32 }
%struct.jointlist = type { i16, i16 }
%struct.ai_local = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [10 x %struct.vms_angvec], [10 x %struct.vms_angvec], [10 x i8], [10 x i8] }
%struct.vclip = type { i32, i32, i32, i32, i16, [30 x %struct.bitmap_index], i32 }
%struct.bitmap_index = type { i16 }
%struct.light_info_s = type { i32 }

@Fuelcen_refill_speed = global i32 65536, align 4, !dbg !0
@Fuelcen_give_amount = global i32 1638400, align 4, !dbg !13
@Fuelcen_max_amount = global i32 6553600, align 4, !dbg !20
@EnergyToCreateOneRobot = global i32 65536, align 4, !dbg !22
@RobotCenters = global [20 x %struct.matcen_info] zeroinitializer, align 4, !dbg !24
@Num_robot_centers = global i32 0, align 4, !dbg !42
@Station = global [70 x %struct.FuelCenter] zeroinitializer, align 4, !dbg !44
@Num_fuelcenters = global i32 0, align 4, !dbg !70
@PlayerSegment = global ptr null, align 8, !dbg !72
@Segment2s = external global [0 x %struct.segment2], align 4
@Num_segments = external global i32, align 4
@Segments = external global [0 x %struct.segment], align 4
@.str = private unnamed_addr constant [38 x i8] c"Invalid station type %d in fuelcen.c\0A\00", align 1, !dbg !113
@.str.1 = private unnamed_addr constant [16 x i8] c"(seg2p != NULL)\00", align 1, !dbg !120
@.str.2 = private unnamed_addr constant [57 x i8] c"/Users/richard/code/ChocolateDescent/main_d2/fuelcen.cpp\00", align 1, !dbg !125
@.str.3 = private unnamed_addr constant [35 x i8] c"Num_fuelcenters < MAX_NUM_FUELCENS\00", align 1, !dbg !130
@.str.4 = private unnamed_addr constant [21 x i8] c"Num_fuelcenters > -1\00", align 1, !dbg !135
@.str.5 = private unnamed_addr constant [38 x i8] c"station_type == SEGMENT_IS_ROBOTMAKER\00", align 1, !dbg !140
@Difficulty_level = external global i32, align 4
@.str.6 = private unnamed_addr constant [28 x i8] c"Trigger matcen, segment %i\0A\00", align 1, !dbg !142
@.str.7 = private unnamed_addr constant [40 x i8] c"seg2p->special == SEGMENT_IS_ROBOTMAKER\00", align 1, !dbg !147
@.str.8 = private unnamed_addr constant [36 x i8] c"seg2p->matcen_num < Num_fuelcenters\00", align 1, !dbg !152
@Highest_segment_index = external global i32, align 4
@.str.9 = private unnamed_addr constant [73 x i8] c"(seg2p->matcen_num >= 0) && (seg2p->matcen_num <= Highest_segment_index)\00", align 1, !dbg !157
@Vertices = external global [0 x %struct.vms_vector], align 4
@Objects = external global [0 x %struct.object], align 4
@.str.10 = private unnamed_addr constant [42 x i8] c"Can't create invisible flare for matcen.\0A\00", align 1, !dbg !162
@Players = external global [12 x %struct.player], align 4
@Player_num = external global i32, align 4
@vmd_identity_matrix = external global %struct.vms_matrix, align 4
@Polygon_models = external global [0 x %struct.polymodel], align 8
@Robot_info = external global [0 x %struct.robot_info], align 4
@.str.11 = private unnamed_addr constant [44 x i8] c"Can't create morph robot.  Aborting morph.\0A\00", align 1, !dbg !167
@Ai_local_info = external global [350 x %struct.ai_local], align 4
@Num_extry_robots = global i32 15, align 4, !dbg !172
@FrameCount_last_msg = global i32 0, align 4, !dbg !174
@FrameTime = external global i32, align 4
@.str.12 = private unnamed_addr constant [57 x i8] c"Robot center #%i gets disabled due to time running out.\0A\00", align 1, !dbg !176
@.str.13 = private unnamed_addr constant [31 x i8] c"Non-functional robotcen at %d\0A\00", align 1, !dbg !178
@Gamesave_num_org_robots = external global i32, align 4
@FrameCount = external global i32, align 4
@.str.14 = private unnamed_addr constant [34 x i8] c"Cannot morph until you kill one!\0A\00", align 1, !dbg !183
@Game_mode = external global i32, align 4
@ConsoleObject = external global ptr, align 8
@Highest_object_index = external global i32, align 4
@.str.15 = private unnamed_addr constant [56 x i8] c"Cannot morph: center %i has already put out %i robots.\0A\00", align 1, !dbg !188
@.str.16 = private unnamed_addr constant [39 x i8] c"Object list in segment %d is circular.\00", align 1, !dbg !193
@Vclip = external global [110 x %struct.vclip], align 4
@.str.17 = private unnamed_addr constant [49 x i8] c"Morph: (type = %i) (seg = %i) (capacity = %08x)\0A\00", align 1, !dbg !198
@.str.18 = private unnamed_addr constant [62 x i8] c"Warning: create_morph_robot returned NULL (no objects left?)\0A\00", align 1, !dbg !203
@Game_suspended = external global i32, align 4
@_ZZ17fuelcen_give_fuelP7segmentiE14last_play_time = internal global i32 0, align 4, !dbg !208
@.str.19 = private unnamed_addr constant [13 x i8] c"segp != NULL\00", align 1, !dbg !214
@GameTime = external global i32, align 4
@.str.20 = private unnamed_addr constant [23 x i8] c"j != Num_robot_centers\00", align 1, !dbg !219
@.str.21 = private unnamed_addr constant [30 x i8] c"fuelcen_num < Num_fuelcenters\00", align 1, !dbg !224
@.str.22 = private unnamed_addr constant [51 x i8] c"Station[fuelcen_num].Type == SEGMENT_IS_ROBOTMAKER\00", align 1, !dbg !229
@.str.23 = private unnamed_addr constant [23 x i8] c"Game_mode & GM_CAPTURE\00", align 1, !dbg !234
@.str.24 = private unnamed_addr constant [21 x i8] c"Game_mode & GM_HOARD\00", align 1, !dbg !236
@Player_is_dead = external global i32, align 4

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define void @_Z13fuelcen_resetv() #0 !dbg !342 {
  %1 = alloca i32, align 4
    #dbg_declare(ptr %1, !345, !DIExpression(), !346)
  store i32 0, ptr @Num_fuelcenters, align 4, !dbg !347
  store i32 0, ptr %1, align 4, !dbg !348
  br label %2, !dbg !350

2:                                                ; preds = %10, %0
  %3 = load i32, ptr %1, align 4, !dbg !351
  %4 = icmp slt i32 %3, 900, !dbg !353
  br i1 %4, label %5, label %13, !dbg !354

5:                                                ; preds = %2
  %6 = load i32, ptr %1, align 4, !dbg !355
  %7 = sext i32 %6 to i64, !dbg !356
  %8 = getelementptr inbounds [0 x %struct.segment2], ptr @Segment2s, i64 0, i64 %7, !dbg !356
  %9 = getelementptr inbounds nuw %struct.segment2, ptr %8, i32 0, i32 0, !dbg !357
  store i8 0, ptr %9, align 4, !dbg !358
  br label %10, !dbg !356

10:                                               ; preds = %5
  %11 = load i32, ptr %1, align 4, !dbg !359
  %12 = add nsw i32 %11, 1, !dbg !359
  store i32 %12, ptr %1, align 4, !dbg !359
  br label %2, !dbg !360, !llvm.loop !361

13:                                               ; preds = %2
  store i32 0, ptr @Num_robot_centers, align 4, !dbg !364
  ret void, !dbg !365
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define void @_Z23reset_all_robot_centersv() #0 !dbg !366 {
  %1 = alloca i32, align 4
    #dbg_declare(ptr %1, !367, !DIExpression(), !368)
  store i32 0, ptr %1, align 4, !dbg !369
  br label %2, !dbg !371

2:                                                ; preds = %24, %0
  %3 = load i32, ptr %1, align 4, !dbg !372
  %4 = load i32, ptr @Num_segments, align 4, !dbg !374
  %5 = icmp slt i32 %3, %4, !dbg !375
  br i1 %5, label %6, label %27, !dbg !376

6:                                                ; preds = %2
  %7 = load i32, ptr %1, align 4, !dbg !377
  %8 = sext i32 %7 to i64, !dbg !379
  %9 = getelementptr inbounds [0 x %struct.segment2], ptr @Segment2s, i64 0, i64 %8, !dbg !379
  %10 = getelementptr inbounds nuw %struct.segment2, ptr %9, i32 0, i32 0, !dbg !380
  %11 = load i8, ptr %10, align 4, !dbg !380
  %12 = zext i8 %11 to i32, !dbg !379
  %13 = icmp eq i32 %12, 4, !dbg !381
  br i1 %13, label %14, label %23, !dbg !381

14:                                               ; preds = %6
  %15 = load i32, ptr %1, align 4, !dbg !382
  %16 = sext i32 %15 to i64, !dbg !384
  %17 = getelementptr inbounds [0 x %struct.segment2], ptr @Segment2s, i64 0, i64 %16, !dbg !384
  %18 = getelementptr inbounds nuw %struct.segment2, ptr %17, i32 0, i32 0, !dbg !385
  store i8 0, ptr %18, align 4, !dbg !386
  %19 = load i32, ptr %1, align 4, !dbg !387
  %20 = sext i32 %19 to i64, !dbg !388
  %21 = getelementptr inbounds [0 x %struct.segment2], ptr @Segment2s, i64 0, i64 %20, !dbg !388
  %22 = getelementptr inbounds nuw %struct.segment2, ptr %21, i32 0, i32 1, !dbg !389
  store i8 -1, ptr %22, align 1, !dbg !390
  br label %23, !dbg !391

23:                                               ; preds = %14, %6
  br label %24, !dbg !392

24:                                               ; preds = %23
  %25 = load i32, ptr %1, align 4, !dbg !393
  %26 = add nsw i32 %25, 1, !dbg !393
  store i32 %26, ptr %1, align 4, !dbg !393
  br label %2, !dbg !394, !llvm.loop !395

27:                                               ; preds = %2
  ret void, !dbg !397
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z14fuelcen_createP7segment(ptr noundef %0) #1 !dbg !398 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !401, !DIExpression(), !402)
    #dbg_declare(ptr %3, !403, !DIExpression(), !404)
  %6 = load ptr, ptr %2, align 8, !dbg !405
  %7 = ptrtoint ptr %6 to i64, !dbg !406
  %8 = sub i64 %7, ptrtoint (ptr @Segments to i64), !dbg !406
  %9 = sdiv exact i64 %8, 512, !dbg !406
  %10 = trunc i64 %9 to i32, !dbg !407
  store i32 %10, ptr %3, align 4, !dbg !404
    #dbg_declare(ptr %4, !408, !DIExpression(), !418)
  %11 = load i32, ptr %3, align 4, !dbg !419
  %12 = sext i32 %11 to i64, !dbg !420
  %13 = getelementptr inbounds [0 x %struct.segment2], ptr @Segment2s, i64 0, i64 %12, !dbg !420
  store ptr %13, ptr %4, align 8, !dbg !418
    #dbg_declare(ptr %5, !421, !DIExpression(), !422)
  %14 = load ptr, ptr %4, align 8, !dbg !423
  %15 = getelementptr inbounds nuw %struct.segment2, ptr %14, i32 0, i32 0, !dbg !424
  %16 = load i8, ptr %15, align 4, !dbg !424
  %17 = zext i8 %16 to i32, !dbg !423
  store i32 %17, ptr %5, align 4, !dbg !425
  %18 = load i32, ptr %5, align 4, !dbg !426
  switch i32 %18, label %21 [
    i32 0, label %19
    i32 5, label %19
    i32 6, label %19
    i32 1, label %20
    i32 2, label %20
    i32 3, label %20
    i32 4, label %20
  ], !dbg !427

19:                                               ; preds = %1, %1, %1
  br label %84, !dbg !428

20:                                               ; preds = %1, %1, %1, %1
  br label %23, !dbg !430

21:                                               ; preds = %1
  %22 = load i32, ptr %5, align 4, !dbg !431
  call void (ptr, ...) @_Z5ErrorPKcz(ptr noundef @.str, i32 noundef %22), !dbg !432
  br label %23, !dbg !433

23:                                               ; preds = %21, %20
  %24 = load ptr, ptr %4, align 8, !dbg !434
  %25 = icmp ne ptr %24, null, !dbg !434
  %26 = zext i1 %25 to i32, !dbg !434
  call void @_Z7_AssertiPKcS0_i(i32 noundef %26, ptr noundef @.str.1, ptr noundef @.str.2, i32 noundef 188), !dbg !434
  %27 = load ptr, ptr %4, align 8, !dbg !435
  %28 = icmp eq ptr %27, null, !dbg !437
  br i1 %28, label %29, label %30, !dbg !437

29:                                               ; preds = %23
  br label %84, !dbg !438

30:                                               ; preds = %23
  %31 = load i32, ptr @Num_fuelcenters, align 4, !dbg !439
  %32 = icmp slt i32 %31, 70, !dbg !439
  %33 = zext i1 %32 to i32, !dbg !439
  call void @_Z7_AssertiPKcS0_i(i32 noundef %33, ptr noundef @.str.3, ptr noundef @.str.2, i32 noundef 191), !dbg !439
  %34 = load i32, ptr @Num_fuelcenters, align 4, !dbg !440
  %35 = icmp sgt i32 %34, -1, !dbg !440
  %36 = zext i1 %35 to i32, !dbg !440
  call void @_Z7_AssertiPKcS0_i(i32 noundef %36, ptr noundef @.str.4, ptr noundef @.str.2, i32 noundef 192), !dbg !440
  %37 = load i32, ptr @Num_fuelcenters, align 4, !dbg !441
  %38 = trunc i32 %37 to i8, !dbg !441
  %39 = load ptr, ptr %4, align 8, !dbg !442
  %40 = getelementptr inbounds nuw %struct.segment2, ptr %39, i32 0, i32 2, !dbg !443
  store i8 %38, ptr %40, align 2, !dbg !444
  %41 = load i32, ptr %5, align 4, !dbg !445
  %42 = load i32, ptr @Num_fuelcenters, align 4, !dbg !446
  %43 = sext i32 %42 to i64, !dbg !447
  %44 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %43, !dbg !447
  %45 = getelementptr inbounds nuw %struct.FuelCenter, ptr %44, i32 0, i32 0, !dbg !448
  store i32 %41, ptr %45, align 4, !dbg !449
  %46 = load i32, ptr @Fuelcen_max_amount, align 4, !dbg !450
  %47 = load i32, ptr @Num_fuelcenters, align 4, !dbg !451
  %48 = sext i32 %47 to i64, !dbg !452
  %49 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %48, !dbg !452
  %50 = getelementptr inbounds nuw %struct.FuelCenter, ptr %49, i32 0, i32 7, !dbg !453
  store i32 %46, ptr %50, align 4, !dbg !454
  %51 = load i32, ptr @Num_fuelcenters, align 4, !dbg !455
  %52 = sext i32 %51 to i64, !dbg !456
  %53 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %52, !dbg !456
  %54 = getelementptr inbounds nuw %struct.FuelCenter, ptr %53, i32 0, i32 7, !dbg !457
  %55 = load i32, ptr %54, align 4, !dbg !457
  %56 = load i32, ptr @Num_fuelcenters, align 4, !dbg !458
  %57 = sext i32 %56 to i64, !dbg !459
  %58 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %57, !dbg !459
  %59 = getelementptr inbounds nuw %struct.FuelCenter, ptr %58, i32 0, i32 6, !dbg !460
  store i32 %55, ptr %59, align 4, !dbg !461
  %60 = load ptr, ptr %4, align 8, !dbg !462
  %61 = ptrtoint ptr %60 to i64, !dbg !463
  %62 = sub i64 %61, ptrtoint (ptr @Segment2s to i64), !dbg !463
  %63 = sdiv exact i64 %62, 8, !dbg !463
  %64 = trunc i64 %63 to i32, !dbg !462
  %65 = load i32, ptr @Num_fuelcenters, align 4, !dbg !464
  %66 = sext i32 %65 to i64, !dbg !465
  %67 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %66, !dbg !465
  %68 = getelementptr inbounds nuw %struct.FuelCenter, ptr %67, i32 0, i32 1, !dbg !466
  store i32 %64, ptr %68, align 4, !dbg !467
  %69 = load i32, ptr @Num_fuelcenters, align 4, !dbg !468
  %70 = sext i32 %69 to i64, !dbg !469
  %71 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %70, !dbg !469
  %72 = getelementptr inbounds nuw %struct.FuelCenter, ptr %71, i32 0, i32 8, !dbg !470
  store i32 -1, ptr %72, align 4, !dbg !471
  %73 = load i32, ptr @Num_fuelcenters, align 4, !dbg !472
  %74 = sext i32 %73 to i64, !dbg !473
  %75 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %74, !dbg !473
  %76 = getelementptr inbounds nuw %struct.FuelCenter, ptr %75, i32 0, i32 2, !dbg !474
  store i8 0, ptr %76, align 4, !dbg !475
  %77 = load i32, ptr @Num_fuelcenters, align 4, !dbg !476
  %78 = sext i32 %77 to i64, !dbg !477
  %79 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %78, !dbg !477
  %80 = getelementptr inbounds nuw %struct.FuelCenter, ptr %79, i32 0, i32 10, !dbg !478
  %81 = load ptr, ptr %2, align 8, !dbg !479
  call void @_Z22compute_segment_centerP10vms_vectorP7segment(ptr noundef %80, ptr noundef %81), !dbg !480
  %82 = load i32, ptr @Num_fuelcenters, align 4, !dbg !481
  %83 = add nsw i32 %82, 1, !dbg !481
  store i32 %83, ptr @Num_fuelcenters, align 4, !dbg !481
  br label %84, !dbg !482

84:                                               ; preds = %30, %29, %19
  ret void, !dbg !482
}

declare void @_Z5ErrorPKcz(ptr noundef, ...) #2

declare void @_Z7_AssertiPKcS0_i(i32 noundef, ptr noundef, ptr noundef, i32 noundef) #2

declare void @_Z22compute_segment_centerP10vms_vectorP7segment(ptr noundef, ptr noundef) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z13matcen_createP7segment(ptr noundef %0) #1 !dbg !483 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !484, !DIExpression(), !485)
    #dbg_declare(ptr %3, !486, !DIExpression(), !487)
  %6 = load ptr, ptr %2, align 8, !dbg !488
  %7 = ptrtoint ptr %6 to i64, !dbg !489
  %8 = sub i64 %7, ptrtoint (ptr @Segments to i64), !dbg !489
  %9 = sdiv exact i64 %8, 512, !dbg !489
  %10 = trunc i64 %9 to i32, !dbg !488
  store i32 %10, ptr %3, align 4, !dbg !487
    #dbg_declare(ptr %4, !490, !DIExpression(), !491)
  %11 = load i32, ptr %3, align 4, !dbg !492
  %12 = sext i32 %11 to i64, !dbg !493
  %13 = getelementptr inbounds [0 x %struct.segment2], ptr @Segment2s, i64 0, i64 %12, !dbg !493
  store ptr %13, ptr %4, align 8, !dbg !491
    #dbg_declare(ptr %5, !494, !DIExpression(), !495)
  %14 = load ptr, ptr %4, align 8, !dbg !496
  %15 = getelementptr inbounds nuw %struct.segment2, ptr %14, i32 0, i32 0, !dbg !497
  %16 = load i8, ptr %15, align 4, !dbg !497
  %17 = zext i8 %16 to i32, !dbg !496
  store i32 %17, ptr %5, align 4, !dbg !495
  %18 = load ptr, ptr %4, align 8, !dbg !498
  %19 = icmp ne ptr %18, null, !dbg !498
  %20 = zext i1 %19 to i32, !dbg !498
  call void @_Z7_AssertiPKcS0_i(i32 noundef %20, ptr noundef @.str.1, ptr noundef @.str.2, i32 noundef 280), !dbg !498
  %21 = load i32, ptr %5, align 4, !dbg !499
  %22 = icmp eq i32 %21, 4, !dbg !499
  %23 = zext i1 %22 to i32, !dbg !499
  call void @_Z7_AssertiPKcS0_i(i32 noundef %23, ptr noundef @.str.5, ptr noundef @.str.2, i32 noundef 281), !dbg !499
  %24 = load ptr, ptr %4, align 8, !dbg !500
  %25 = icmp eq ptr %24, null, !dbg !502
  br i1 %25, label %26, label %27, !dbg !502

26:                                               ; preds = %1
  br label %124, !dbg !503

27:                                               ; preds = %1
  %28 = load i32, ptr @Num_fuelcenters, align 4, !dbg !504
  %29 = icmp slt i32 %28, 70, !dbg !504
  %30 = zext i1 %29 to i32, !dbg !504
  call void @_Z7_AssertiPKcS0_i(i32 noundef %30, ptr noundef @.str.3, ptr noundef @.str.2, i32 noundef 284), !dbg !504
  %31 = load i32, ptr @Num_fuelcenters, align 4, !dbg !505
  %32 = icmp sgt i32 %31, -1, !dbg !505
  %33 = zext i1 %32 to i32, !dbg !505
  call void @_Z7_AssertiPKcS0_i(i32 noundef %33, ptr noundef @.str.4, ptr noundef @.str.2, i32 noundef 285), !dbg !505
  %34 = load i32, ptr @Num_fuelcenters, align 4, !dbg !506
  %35 = trunc i32 %34 to i8, !dbg !506
  %36 = load ptr, ptr %4, align 8, !dbg !507
  %37 = getelementptr inbounds nuw %struct.segment2, ptr %36, i32 0, i32 2, !dbg !508
  store i8 %35, ptr %37, align 2, !dbg !509
  %38 = load i32, ptr %5, align 4, !dbg !510
  %39 = load i32, ptr @Num_fuelcenters, align 4, !dbg !511
  %40 = sext i32 %39 to i64, !dbg !512
  %41 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %40, !dbg !512
  %42 = getelementptr inbounds nuw %struct.FuelCenter, ptr %41, i32 0, i32 0, !dbg !513
  store i32 %38, ptr %42, align 4, !dbg !514
  %43 = load i32, ptr @Difficulty_level, align 4, !dbg !515
  %44 = add nsw i32 %43, 3, !dbg !516
  %45 = call noundef i32 @_Z3i2fi(i32 noundef %44), !dbg !517
  %46 = load i32, ptr @Num_fuelcenters, align 4, !dbg !518
  %47 = sext i32 %46 to i64, !dbg !519
  %48 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %47, !dbg !519
  %49 = getelementptr inbounds nuw %struct.FuelCenter, ptr %48, i32 0, i32 6, !dbg !520
  store i32 %45, ptr %49, align 4, !dbg !521
  %50 = load i32, ptr @Num_fuelcenters, align 4, !dbg !522
  %51 = sext i32 %50 to i64, !dbg !523
  %52 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %51, !dbg !523
  %53 = getelementptr inbounds nuw %struct.FuelCenter, ptr %52, i32 0, i32 6, !dbg !524
  %54 = load i32, ptr %53, align 4, !dbg !524
  %55 = load i32, ptr @Num_fuelcenters, align 4, !dbg !525
  %56 = sext i32 %55 to i64, !dbg !526
  %57 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %56, !dbg !526
  %58 = getelementptr inbounds nuw %struct.FuelCenter, ptr %57, i32 0, i32 7, !dbg !527
  store i32 %54, ptr %58, align 4, !dbg !528
  %59 = load ptr, ptr %4, align 8, !dbg !529
  %60 = ptrtoint ptr %59 to i64, !dbg !530
  %61 = sub i64 %60, ptrtoint (ptr @Segment2s to i64), !dbg !530
  %62 = sdiv exact i64 %61, 8, !dbg !530
  %63 = trunc i64 %62 to i32, !dbg !529
  %64 = load i32, ptr @Num_fuelcenters, align 4, !dbg !531
  %65 = sext i32 %64 to i64, !dbg !532
  %66 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %65, !dbg !532
  %67 = getelementptr inbounds nuw %struct.FuelCenter, ptr %66, i32 0, i32 1, !dbg !533
  store i32 %63, ptr %67, align 4, !dbg !534
  %68 = load i32, ptr @Num_fuelcenters, align 4, !dbg !535
  %69 = sext i32 %68 to i64, !dbg !536
  %70 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %69, !dbg !536
  %71 = getelementptr inbounds nuw %struct.FuelCenter, ptr %70, i32 0, i32 8, !dbg !537
  store i32 -1, ptr %71, align 4, !dbg !538
  %72 = load i32, ptr @Num_fuelcenters, align 4, !dbg !539
  %73 = sext i32 %72 to i64, !dbg !540
  %74 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %73, !dbg !540
  %75 = getelementptr inbounds nuw %struct.FuelCenter, ptr %74, i32 0, i32 2, !dbg !541
  store i8 0, ptr %75, align 4, !dbg !542
  %76 = load i32, ptr @Num_fuelcenters, align 4, !dbg !543
  %77 = sext i32 %76 to i64, !dbg !544
  %78 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %77, !dbg !544
  %79 = getelementptr inbounds nuw %struct.FuelCenter, ptr %78, i32 0, i32 10, !dbg !545
  %80 = load ptr, ptr %4, align 8, !dbg !546
  %81 = ptrtoint ptr %80 to i64, !dbg !547
  %82 = sub i64 %81, ptrtoint (ptr @Segment2s to i64), !dbg !547
  %83 = sdiv exact i64 %82, 8, !dbg !547
  %84 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %83, !dbg !548
  call void @_Z22compute_segment_centerP10vms_vectorP7segment(ptr noundef %79, ptr noundef %84), !dbg !549
  %85 = load i32, ptr @Num_robot_centers, align 4, !dbg !550
  %86 = trunc i32 %85 to i8, !dbg !550
  %87 = load ptr, ptr %4, align 8, !dbg !551
  %88 = getelementptr inbounds nuw %struct.segment2, ptr %87, i32 0, i32 1, !dbg !552
  store i8 %86, ptr %88, align 1, !dbg !553
  %89 = load i32, ptr @Num_robot_centers, align 4, !dbg !554
  %90 = add nsw i32 %89, 1, !dbg !554
  store i32 %90, ptr @Num_robot_centers, align 4, !dbg !554
  %91 = load ptr, ptr %4, align 8, !dbg !555
  %92 = getelementptr inbounds nuw %struct.segment2, ptr %91, i32 0, i32 1, !dbg !556
  %93 = load i8, ptr %92, align 1, !dbg !556
  %94 = sext i8 %93 to i64, !dbg !557
  %95 = getelementptr inbounds [20 x %struct.matcen_info], ptr @RobotCenters, i64 0, i64 %94, !dbg !557
  %96 = getelementptr inbounds nuw %struct.matcen_info, ptr %95, i32 0, i32 1, !dbg !558
  store i32 32768000, ptr %96, align 4, !dbg !559
  %97 = load ptr, ptr %4, align 8, !dbg !560
  %98 = getelementptr inbounds nuw %struct.segment2, ptr %97, i32 0, i32 1, !dbg !561
  %99 = load i8, ptr %98, align 1, !dbg !561
  %100 = sext i8 %99 to i64, !dbg !562
  %101 = getelementptr inbounds [20 x %struct.matcen_info], ptr @RobotCenters, i64 0, i64 %100, !dbg !562
  %102 = getelementptr inbounds nuw %struct.matcen_info, ptr %101, i32 0, i32 2, !dbg !563
  store i32 327680, ptr %102, align 4, !dbg !564
  %103 = load ptr, ptr %4, align 8, !dbg !565
  %104 = ptrtoint ptr %103 to i64, !dbg !566
  %105 = sub i64 %104, ptrtoint (ptr @Segment2s to i64), !dbg !566
  %106 = sdiv exact i64 %105, 8, !dbg !566
  %107 = trunc i64 %106 to i16, !dbg !565
  %108 = load ptr, ptr %4, align 8, !dbg !567
  %109 = getelementptr inbounds nuw %struct.segment2, ptr %108, i32 0, i32 1, !dbg !568
  %110 = load i8, ptr %109, align 1, !dbg !568
  %111 = sext i8 %110 to i64, !dbg !569
  %112 = getelementptr inbounds [20 x %struct.matcen_info], ptr @RobotCenters, i64 0, i64 %111, !dbg !569
  %113 = getelementptr inbounds nuw %struct.matcen_info, ptr %112, i32 0, i32 3, !dbg !570
  store i16 %107, ptr %113, align 4, !dbg !571
  %114 = load i32, ptr @Num_fuelcenters, align 4, !dbg !572
  %115 = trunc i32 %114 to i16, !dbg !572
  %116 = load ptr, ptr %4, align 8, !dbg !573
  %117 = getelementptr inbounds nuw %struct.segment2, ptr %116, i32 0, i32 1, !dbg !574
  %118 = load i8, ptr %117, align 1, !dbg !574
  %119 = sext i8 %118 to i64, !dbg !575
  %120 = getelementptr inbounds [20 x %struct.matcen_info], ptr @RobotCenters, i64 0, i64 %119, !dbg !575
  %121 = getelementptr inbounds nuw %struct.matcen_info, ptr %120, i32 0, i32 4, !dbg !576
  store i16 %115, ptr %121, align 2, !dbg !577
  %122 = load i32, ptr @Num_fuelcenters, align 4, !dbg !578
  %123 = add nsw i32 %122, 1, !dbg !578
  store i32 %123, ptr @Num_fuelcenters, align 4, !dbg !578
  br label %124, !dbg !579

124:                                              ; preds = %27, %26
  ret void, !dbg !579
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z3i2fi(i32 noundef %0) #0 !dbg !580 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !583, !DIExpression(), !584)
  %3 = load i32, ptr %2, align 4, !dbg !585
  %4 = shl i32 %3, 16, !dbg !586
  ret i32 %4, !dbg !587
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z16fuelcen_activateP7segmenti(ptr noundef %0, i32 noundef %1) #1 !dbg !588 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !591, !DIExpression(), !592)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !593, !DIExpression(), !594)
    #dbg_declare(ptr %5, !595, !DIExpression(), !596)
  %7 = load ptr, ptr %3, align 8, !dbg !597
  %8 = ptrtoint ptr %7 to i64, !dbg !598
  %9 = sub i64 %8, ptrtoint (ptr @Segments to i64), !dbg !598
  %10 = sdiv exact i64 %9, 512, !dbg !598
  %11 = trunc i64 %10 to i32, !dbg !599
  store i32 %11, ptr %5, align 4, !dbg !596
    #dbg_declare(ptr %6, !600, !DIExpression(), !601)
  %12 = load i32, ptr %5, align 4, !dbg !602
  %13 = sext i32 %12 to i64, !dbg !603
  %14 = getelementptr inbounds [0 x %struct.segment2], ptr @Segment2s, i64 0, i64 %13, !dbg !603
  store ptr %14, ptr %6, align 8, !dbg !601
  %15 = load i32, ptr %4, align 4, !dbg !604
  %16 = trunc i32 %15 to i8, !dbg !604
  %17 = load ptr, ptr %6, align 8, !dbg !605
  %18 = getelementptr inbounds nuw %struct.segment2, ptr %17, i32 0, i32 0, !dbg !606
  store i8 %16, ptr %18, align 4, !dbg !607
  %19 = load ptr, ptr %6, align 8, !dbg !608
  %20 = getelementptr inbounds nuw %struct.segment2, ptr %19, i32 0, i32 0, !dbg !610
  %21 = load i8, ptr %20, align 4, !dbg !610
  %22 = zext i8 %21 to i32, !dbg !608
  %23 = icmp eq i32 %22, 4, !dbg !611
  br i1 %23, label %24, label %26, !dbg !611

24:                                               ; preds = %2
  %25 = load ptr, ptr %3, align 8, !dbg !612
  call void @_Z13matcen_createP7segment(ptr noundef %25), !dbg !613
  br label %28, !dbg !613

26:                                               ; preds = %2
  %27 = load ptr, ptr %3, align 8, !dbg !614
  call void @_Z14fuelcen_createP7segment(ptr noundef %27), !dbg !615
  br label %28

28:                                               ; preds = %26, %24
  ret void, !dbg !616
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z14trigger_matceni(i32 noundef %0) #1 !dbg !617 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca %struct.vms_vector, align 4
  %5 = alloca %struct.vms_vector, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !620, !DIExpression(), !621)
    #dbg_declare(ptr %3, !622, !DIExpression(), !623)
  %8 = load i32, ptr %2, align 4, !dbg !624
  %9 = sext i32 %8 to i64, !dbg !625
  %10 = getelementptr inbounds [0 x %struct.segment2], ptr @Segment2s, i64 0, i64 %9, !dbg !625
  store ptr %10, ptr %3, align 8, !dbg !623
    #dbg_declare(ptr %4, !626, !DIExpression(), !627)
    #dbg_declare(ptr %5, !628, !DIExpression(), !629)
    #dbg_declare(ptr %6, !630, !DIExpression(), !632)
    #dbg_declare(ptr %7, !633, !DIExpression(), !634)
  %11 = load i32, ptr %2, align 4, !dbg !635
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.6, i32 noundef %11), !dbg !635
  %12 = load ptr, ptr %3, align 8, !dbg !636
  %13 = getelementptr inbounds nuw %struct.segment2, ptr %12, i32 0, i32 0, !dbg !636
  %14 = load i8, ptr %13, align 4, !dbg !636
  %15 = zext i8 %14 to i32, !dbg !636
  %16 = icmp eq i32 %15, 4, !dbg !636
  %17 = zext i1 %16 to i32, !dbg !636
  call void @_Z7_AssertiPKcS0_i(i32 noundef %17, ptr noundef @.str.7, ptr noundef @.str.2, i32 noundef 364), !dbg !636
  %18 = load ptr, ptr %3, align 8, !dbg !637
  %19 = getelementptr inbounds nuw %struct.segment2, ptr %18, i32 0, i32 1, !dbg !637
  %20 = load i8, ptr %19, align 1, !dbg !637
  %21 = sext i8 %20 to i32, !dbg !637
  %22 = load i32, ptr @Num_fuelcenters, align 4, !dbg !637
  %23 = icmp slt i32 %21, %22, !dbg !637
  %24 = zext i1 %23 to i32, !dbg !637
  call void @_Z7_AssertiPKcS0_i(i32 noundef %24, ptr noundef @.str.8, ptr noundef @.str.2, i32 noundef 365), !dbg !637
  %25 = load ptr, ptr %3, align 8, !dbg !638
  %26 = getelementptr inbounds nuw %struct.segment2, ptr %25, i32 0, i32 1, !dbg !638
  %27 = load i8, ptr %26, align 1, !dbg !638
  %28 = sext i8 %27 to i32, !dbg !638
  %29 = icmp sge i32 %28, 0, !dbg !638
  br i1 %29, label %30, label %37, !dbg !638

30:                                               ; preds = %1
  %31 = load ptr, ptr %3, align 8, !dbg !638
  %32 = getelementptr inbounds nuw %struct.segment2, ptr %31, i32 0, i32 1, !dbg !638
  %33 = load i8, ptr %32, align 1, !dbg !638
  %34 = sext i8 %33 to i32, !dbg !638
  %35 = load i32, ptr @Highest_segment_index, align 4, !dbg !638
  %36 = icmp sle i32 %34, %35, !dbg !638
  br label %37

37:                                               ; preds = %30, %1
  %38 = phi i1 [ false, %1 ], [ %36, %30 ], !dbg !639
  %39 = zext i1 %38 to i32, !dbg !638
  call void @_Z7_AssertiPKcS0_i(i32 noundef %39, ptr noundef @.str.9, ptr noundef @.str.2, i32 noundef 366), !dbg !638
  %40 = load ptr, ptr %3, align 8, !dbg !640
  %41 = getelementptr inbounds nuw %struct.segment2, ptr %40, i32 0, i32 1, !dbg !641
  %42 = load i8, ptr %41, align 1, !dbg !641
  %43 = sext i8 %42 to i64, !dbg !642
  %44 = getelementptr inbounds [20 x %struct.matcen_info], ptr @RobotCenters, i64 0, i64 %43, !dbg !642
  %45 = getelementptr inbounds nuw %struct.matcen_info, ptr %44, i32 0, i32 4, !dbg !643
  %46 = load i16, ptr %45, align 2, !dbg !643
  %47 = sext i16 %46 to i64, !dbg !644
  %48 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %47, !dbg !644
  store ptr %48, ptr %6, align 8, !dbg !645
  %49 = load ptr, ptr %6, align 8, !dbg !646
  %50 = getelementptr inbounds nuw %struct.FuelCenter, ptr %49, i32 0, i32 3, !dbg !648
  %51 = load i8, ptr %50, align 1, !dbg !648
  %52 = sext i8 %51 to i32, !dbg !646
  %53 = icmp eq i32 %52, 1, !dbg !649
  br i1 %53, label %54, label %55, !dbg !649

54:                                               ; preds = %37
  br label %120, !dbg !650

55:                                               ; preds = %37
  %56 = load ptr, ptr %6, align 8, !dbg !651
  %57 = getelementptr inbounds nuw %struct.FuelCenter, ptr %56, i32 0, i32 4, !dbg !653
  %58 = load i8, ptr %57, align 2, !dbg !653
  %59 = icmp ne i8 %58, 0, !dbg !651
  br i1 %59, label %61, label %60, !dbg !654

60:                                               ; preds = %55
  br label %120, !dbg !655

61:                                               ; preds = %55
  %62 = load i32, ptr @Difficulty_level, align 4, !dbg !656
  %63 = add nsw i32 %62, 1, !dbg !658
  %64 = icmp slt i32 %63, 5, !dbg !659
  br i1 %64, label %65, label %70, !dbg !659

65:                                               ; preds = %61
  %66 = load ptr, ptr %6, align 8, !dbg !660
  %67 = getelementptr inbounds nuw %struct.FuelCenter, ptr %66, i32 0, i32 4, !dbg !661
  %68 = load i8, ptr %67, align 2, !dbg !662
  %69 = add i8 %68, -1, !dbg !662
  store i8 %69, ptr %67, align 2, !dbg !662
  br label %70, !dbg !660

70:                                               ; preds = %65, %61
  %71 = load ptr, ptr %6, align 8, !dbg !663
  %72 = getelementptr inbounds nuw %struct.FuelCenter, ptr %71, i32 0, i32 8, !dbg !664
  store i32 65536000, ptr %72, align 4, !dbg !665
  %73 = load ptr, ptr %6, align 8, !dbg !666
  %74 = getelementptr inbounds nuw %struct.FuelCenter, ptr %73, i32 0, i32 3, !dbg !667
  store i8 1, ptr %74, align 1, !dbg !668
  %75 = load i32, ptr @Difficulty_level, align 4, !dbg !669
  %76 = add nsw i32 %75, 3, !dbg !670
  %77 = call noundef i32 @_Z3i2fi(i32 noundef %76), !dbg !671
  %78 = load ptr, ptr %6, align 8, !dbg !672
  %79 = getelementptr inbounds nuw %struct.FuelCenter, ptr %78, i32 0, i32 6, !dbg !673
  store i32 %77, ptr %79, align 4, !dbg !674
  %80 = load i32, ptr @Difficulty_level, align 4, !dbg !675
  %81 = mul nsw i32 2, %80, !dbg !675
  %82 = sub nsw i32 30, %81, !dbg !675
  %83 = call noundef i32 @_Z3i2fi(i32 noundef %82), !dbg !675
  %84 = load ptr, ptr %6, align 8, !dbg !676
  %85 = getelementptr inbounds nuw %struct.FuelCenter, ptr %84, i32 0, i32 9, !dbg !677
  store i32 %83, ptr %85, align 4, !dbg !678
  %86 = load ptr, ptr %6, align 8, !dbg !679
  %87 = getelementptr inbounds nuw %struct.FuelCenter, ptr %86, i32 0, i32 10, !dbg !680
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %4, ptr align 4 %87, i64 12, i1 false), !dbg !681
  %88 = load i32, ptr %2, align 4, !dbg !682
  %89 = sext i32 %88 to i64, !dbg !683
  %90 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %89, !dbg !683
  %91 = getelementptr inbounds nuw %struct.segment, ptr %90, i32 0, i32 2, !dbg !684
  %92 = getelementptr inbounds [8 x i16], ptr %91, i64 0, i64 0, !dbg !683
  %93 = load i16, ptr %92, align 4, !dbg !683
  %94 = sext i16 %93 to i64, !dbg !685
  %95 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %94, !dbg !685
  %96 = load ptr, ptr %6, align 8, !dbg !686
  %97 = getelementptr inbounds nuw %struct.FuelCenter, ptr %96, i32 0, i32 10, !dbg !687
  %98 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %5, ptr noundef %95, ptr noundef %97), !dbg !688
  %99 = call noundef ptr @_Z17vm_vec_scale_add2P10vms_vectorS0_i(ptr noundef %4, ptr noundef %5, i32 noundef 32768), !dbg !689
  %100 = load i32, ptr %2, align 4, !dbg !690
  %101 = call noundef i32 @_Z10obj_createhhiP10vms_vectorP10vms_matrixihhh(i8 noundef zeroext 13, i8 noundef zeroext 0, i32 noundef %100, ptr noundef %4, ptr noundef null, i32 noundef 0, i8 noundef zeroext 14, i8 noundef zeroext 0, i8 noundef zeroext 0), !dbg !691
  store i32 %101, ptr %7, align 4, !dbg !692
  %102 = load i32, ptr %7, align 4, !dbg !693
  %103 = icmp ne i32 %102, -1, !dbg !695
  br i1 %103, label %104, label %119, !dbg !695

104:                                              ; preds = %70
  %105 = load i32, ptr @Difficulty_level, align 4, !dbg !696
  %106 = mul nsw i32 2, %105, !dbg !696
  %107 = sub nsw i32 30, %106, !dbg !696
  %108 = call noundef i32 @_Z3i2fi(i32 noundef %107), !dbg !696
  %109 = load i32, ptr %7, align 4, !dbg !698
  %110 = sext i32 %109 to i64, !dbg !699
  %111 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %110, !dbg !699
  %112 = getelementptr inbounds nuw %struct.object, ptr %111, i32 0, i32 20, !dbg !700
  store i32 %108, ptr %112, align 4, !dbg !701
  %113 = call noundef i32 @_Z3i2fi(i32 noundef 8), !dbg !702
  %114 = load i32, ptr %7, align 4, !dbg !703
  %115 = sext i32 %114 to i64, !dbg !704
  %116 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %115, !dbg !704
  %117 = getelementptr inbounds nuw %struct.object, ptr %116, i32 0, i32 22, !dbg !705
  %118 = getelementptr inbounds nuw %struct.light_info_s, ptr %117, i32 0, i32 0, !dbg !706
  store i32 %113, ptr %118, align 4, !dbg !707
  br label %120, !dbg !708

119:                                              ; preds = %70
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 1, ptr noundef @.str.10), !dbg !709
  call void @_Z4Int3v(), !dbg !711
  br label %120

120:                                              ; preds = %54, %60, %119, %104
  ret void, !dbg !712
}

declare void @_Z8_mprintfiPKcz(i32 noundef, ptr noundef, ...) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

declare noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef, ptr noundef, ptr noundef) #2

declare noundef ptr @_Z17vm_vec_scale_add2P10vms_vectorS0_i(ptr noundef, ptr noundef, i32 noundef) #2

declare noundef i32 @_Z10obj_createhhiP10vms_vectorP10vms_matrixihhh(i8 noundef zeroext, i8 noundef zeroext, i32 noundef, ptr noundef, ptr noundef, i32 noundef, i8 noundef zeroext, i8 noundef zeroext, i8 noundef zeroext) #2

declare void @_Z4Int3v() #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef ptr @_Z18create_morph_robotP7segmentP10vms_vectori(ptr noundef %0, ptr noundef %1, i32 noundef %2) #1 !dbg !713 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i16, align 2
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
    #dbg_declare(ptr %5, !849, !DIExpression(), !850)
  store ptr %1, ptr %6, align 8
    #dbg_declare(ptr %6, !851, !DIExpression(), !852)
  store i32 %2, ptr %7, align 4
    #dbg_declare(ptr %7, !853, !DIExpression(), !854)
    #dbg_declare(ptr %8, !855, !DIExpression(), !856)
    #dbg_declare(ptr %9, !857, !DIExpression(), !858)
    #dbg_declare(ptr %10, !859, !DIExpression(), !860)
  %11 = load i32, ptr @Player_num, align 4, !dbg !861
  %12 = sext i32 %11 to i64, !dbg !862
  %13 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %12, !dbg !862
  %14 = getelementptr inbounds nuw %struct.player, ptr %13, i32 0, i32 31, !dbg !863
  %15 = load i16, ptr %14, align 2, !dbg !864
  %16 = add i16 %15, 1, !dbg !864
  store i16 %16, ptr %14, align 2, !dbg !864
  %17 = load i32, ptr @Player_num, align 4, !dbg !865
  %18 = sext i32 %17 to i64, !dbg !866
  %19 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %18, !dbg !866
  %20 = getelementptr inbounds nuw %struct.player, ptr %19, i32 0, i32 32, !dbg !867
  %21 = load i16, ptr %20, align 4, !dbg !868
  %22 = add i16 %21, 1, !dbg !868
  store i16 %22, ptr %20, align 4, !dbg !868
  %23 = load i32, ptr %7, align 4, !dbg !869
  %24 = trunc i32 %23 to i8, !dbg !869
  %25 = load ptr, ptr %5, align 8, !dbg !870
  %26 = ptrtoint ptr %25 to i64, !dbg !871
  %27 = sub i64 %26, ptrtoint (ptr @Segments to i64), !dbg !871
  %28 = sdiv exact i64 %27, 512, !dbg !871
  %29 = trunc i64 %28 to i32, !dbg !870
  %30 = load ptr, ptr %6, align 8, !dbg !872
  %31 = load i32, ptr %7, align 4, !dbg !873
  %32 = sext i32 %31 to i64, !dbg !874
  %33 = getelementptr inbounds [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %32, !dbg !874
  %34 = getelementptr inbounds nuw %struct.robot_info, ptr %33, i32 0, i32 0, !dbg !875
  %35 = load i32, ptr %34, align 4, !dbg !875
  %36 = sext i32 %35 to i64, !dbg !876
  %37 = getelementptr inbounds [0 x %struct.polymodel], ptr @Polygon_models, i64 0, i64 %36, !dbg !876
  %38 = getelementptr inbounds nuw %struct.polymodel, ptr %37, i32 0, i32 13, !dbg !877
  %39 = load i32, ptr %38, align 4, !dbg !877
  %40 = call noundef i32 @_Z10obj_createhhiP10vms_vectorP10vms_matrixihhh(i8 noundef zeroext 2, i8 noundef zeroext %24, i32 noundef %29, ptr noundef %30, ptr noundef @vmd_identity_matrix, i32 noundef %39, i8 noundef zeroext 1, i8 noundef zeroext 1, i8 noundef zeroext 1), !dbg !878
  %41 = trunc i32 %40 to i16, !dbg !878
  store i16 %41, ptr %8, align 2, !dbg !879
  %42 = load i16, ptr %8, align 2, !dbg !880
  %43 = sext i16 %42 to i32, !dbg !880
  %44 = icmp slt i32 %43, 0, !dbg !882
  br i1 %44, label %45, label %46, !dbg !882

45:                                               ; preds = %3
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 1, ptr noundef @.str.11), !dbg !883
  call void @_Z4Int3v(), !dbg !885
  store ptr null, ptr %4, align 8, !dbg !886
  br label %121, !dbg !886

46:                                               ; preds = %3
  %47 = load i16, ptr %8, align 2, !dbg !887
  %48 = sext i16 %47 to i64, !dbg !888
  %49 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %48, !dbg !888
  store ptr %49, ptr %9, align 8, !dbg !889
  %50 = load ptr, ptr %9, align 8, !dbg !890
  %51 = getelementptr inbounds nuw %struct.object, ptr %50, i32 0, i32 2, !dbg !891
  %52 = load i8, ptr %51, align 1, !dbg !891
  %53 = zext i8 %52 to i64, !dbg !892
  %54 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %53, !dbg !892
  %55 = getelementptr inbounds nuw %struct.robot_info, ptr %54, i32 0, i32 0, !dbg !893
  %56 = load i32, ptr %55, align 4, !dbg !893
  %57 = load ptr, ptr %9, align 8, !dbg !894
  %58 = getelementptr inbounds nuw %struct.object, ptr %57, i32 0, i32 23, !dbg !895
  %59 = getelementptr inbounds nuw %struct.polyobj_info, ptr %58, i32 0, i32 0, !dbg !896
  store i32 %56, ptr %59, align 4, !dbg !897
  %60 = load ptr, ptr %9, align 8, !dbg !898
  %61 = getelementptr inbounds nuw %struct.object, ptr %60, i32 0, i32 23, !dbg !899
  %62 = getelementptr inbounds nuw %struct.polyobj_info, ptr %61, i32 0, i32 2, !dbg !900
  store i32 0, ptr %62, align 4, !dbg !901
  %63 = load ptr, ptr %9, align 8, !dbg !902
  %64 = getelementptr inbounds nuw %struct.object, ptr %63, i32 0, i32 2, !dbg !903
  %65 = load i8, ptr %64, align 1, !dbg !903
  %66 = zext i8 %65 to i64, !dbg !904
  %67 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %66, !dbg !904
  %68 = getelementptr inbounds nuw %struct.robot_info, ptr %67, i32 0, i32 20, !dbg !905
  %69 = load i32, ptr %68, align 4, !dbg !905
  %70 = load ptr, ptr %9, align 8, !dbg !906
  %71 = getelementptr inbounds nuw %struct.object, ptr %70, i32 0, i32 21, !dbg !907
  %72 = getelementptr inbounds nuw %struct.physics_info, ptr %71, i32 0, i32 2, !dbg !908
  store i32 %69, ptr %72, align 4, !dbg !909
  %73 = load ptr, ptr %9, align 8, !dbg !910
  %74 = getelementptr inbounds nuw %struct.object, ptr %73, i32 0, i32 2, !dbg !911
  %75 = load i8, ptr %74, align 1, !dbg !911
  %76 = zext i8 %75 to i64, !dbg !912
  %77 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %76, !dbg !912
  %78 = getelementptr inbounds nuw %struct.robot_info, ptr %77, i32 0, i32 21, !dbg !913
  %79 = load i32, ptr %78, align 4, !dbg !913
  %80 = load ptr, ptr %9, align 8, !dbg !914
  %81 = getelementptr inbounds nuw %struct.object, ptr %80, i32 0, i32 21, !dbg !915
  %82 = getelementptr inbounds nuw %struct.physics_info, ptr %81, i32 0, i32 3, !dbg !916
  store i32 %79, ptr %82, align 4, !dbg !917
  %83 = load ptr, ptr %9, align 8, !dbg !918
  %84 = getelementptr inbounds nuw %struct.object, ptr %83, i32 0, i32 21, !dbg !919
  %85 = getelementptr inbounds nuw %struct.physics_info, ptr %84, i32 0, i32 8, !dbg !920
  %86 = load i16, ptr %85, align 2, !dbg !921
  %87 = zext i16 %86 to i32, !dbg !921
  %88 = or i32 %87, 2, !dbg !921
  %89 = trunc i32 %88 to i16, !dbg !921
  store i16 %89, ptr %85, align 2, !dbg !921
  %90 = load ptr, ptr %9, align 8, !dbg !922
  %91 = getelementptr inbounds nuw %struct.object, ptr %90, i32 0, i32 2, !dbg !923
  %92 = load i8, ptr %91, align 1, !dbg !923
  %93 = zext i8 %92 to i64, !dbg !924
  %94 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %93, !dbg !924
  %95 = getelementptr inbounds nuw %struct.robot_info, ptr %94, i32 0, i32 19, !dbg !925
  %96 = load i32, ptr %95, align 4, !dbg !925
  %97 = load ptr, ptr %9, align 8, !dbg !926
  %98 = getelementptr inbounds nuw %struct.object, ptr %97, i32 0, i32 14, !dbg !927
  store i32 %96, ptr %98, align 4, !dbg !928
  %99 = load ptr, ptr %9, align 8, !dbg !929
  %100 = getelementptr inbounds nuw %struct.object, ptr %99, i32 0, i32 2, !dbg !930
  %101 = load i8, ptr %100, align 1, !dbg !930
  %102 = zext i8 %101 to i64, !dbg !931
  %103 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %102, !dbg !931
  %104 = getelementptr inbounds nuw %struct.robot_info, ptr %103, i32 0, i32 48, !dbg !932
  %105 = load i8, ptr %104, align 2, !dbg !932
  %106 = zext i8 %105 to i32, !dbg !931
  store i32 %106, ptr %10, align 4, !dbg !933
  %107 = load ptr, ptr %9, align 8, !dbg !934
  %108 = ptrtoint ptr %107 to i64, !dbg !935
  %109 = sub i64 %108, ptrtoint (ptr @Objects to i64), !dbg !935
  %110 = sdiv exact i64 %109, 268, !dbg !935
  %111 = trunc i64 %110 to i32, !dbg !934
  %112 = load i32, ptr %10, align 4, !dbg !936
  call void @_Z14init_ai_objectiii(i32 noundef %111, i32 noundef %112, i32 noundef -1), !dbg !937
  %113 = load ptr, ptr %9, align 8, !dbg !938
  call void @_Z21create_n_segment_pathP6objectii(ptr noundef %113, i32 noundef 6, i32 noundef -1), !dbg !939
  %114 = load i32, ptr %10, align 4, !dbg !940
  %115 = call noundef i32 @_Z19ai_behavior_to_modei(i32 noundef %114), !dbg !941
  %116 = load i16, ptr %8, align 2, !dbg !942
  %117 = sext i16 %116 to i64, !dbg !943
  %118 = getelementptr inbounds [350 x %struct.ai_local], ptr @Ai_local_info, i64 0, i64 %117, !dbg !943
  %119 = getelementptr inbounds nuw %struct.ai_local, ptr %118, i32 0, i32 3, !dbg !944
  store i32 %115, ptr %119, align 4, !dbg !945
  %120 = load ptr, ptr %9, align 8, !dbg !946
  store ptr %120, ptr %4, align 8, !dbg !947
  br label %121, !dbg !947

121:                                              ; preds = %46, %45
  %122 = load ptr, ptr %4, align 8, !dbg !948
  ret ptr %122, !dbg !948
}

declare void @_Z14init_ai_objectiii(i32 noundef, i32 noundef, i32 noundef) #2

declare void @_Z21create_n_segment_pathP6objectii(ptr noundef, i32 noundef, i32 noundef) #2

declare noundef i32 @_Z19ai_behavior_to_modei(i32 noundef) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z15robotmaker_procP10FuelCenter(ptr noundef %0) #1 !dbg !949 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca %struct.vms_vector, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca %struct.vms_vector, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca ptr, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca [64 x i8], align 1
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !952, !DIExpression(), !953)
    #dbg_declare(ptr %3, !954, !DIExpression(), !955)
    #dbg_declare(ptr %4, !956, !DIExpression(), !957)
    #dbg_declare(ptr %5, !958, !DIExpression(), !959)
    #dbg_declare(ptr %6, !960, !DIExpression(), !961)
    #dbg_declare(ptr %7, !962, !DIExpression(), !963)
    #dbg_declare(ptr %8, !964, !DIExpression(), !965)
    #dbg_declare(ptr %9, !966, !DIExpression(), !967)
    #dbg_declare(ptr %10, !968, !DIExpression(), !969)
  %21 = load ptr, ptr %2, align 8, !dbg !970
  %22 = getelementptr inbounds nuw %struct.FuelCenter, ptr %21, i32 0, i32 3, !dbg !972
  %23 = load i8, ptr %22, align 1, !dbg !972
  %24 = sext i8 %23 to i32, !dbg !970
  %25 = icmp eq i32 %24, 0, !dbg !973
  br i1 %25, label %26, label %27, !dbg !973

26:                                               ; preds = %1
  br label %451, !dbg !974

27:                                               ; preds = %1
  %28 = load ptr, ptr %2, align 8, !dbg !975
  %29 = getelementptr inbounds nuw %struct.FuelCenter, ptr %28, i32 0, i32 9, !dbg !977
  %30 = load i32, ptr %29, align 4, !dbg !977
  %31 = icmp sgt i32 %30, 0, !dbg !978
  br i1 %31, label %32, label %50, !dbg !978

32:                                               ; preds = %27
  %33 = load i32, ptr @FrameTime, align 4, !dbg !979
  %34 = load ptr, ptr %2, align 8, !dbg !981
  %35 = getelementptr inbounds nuw %struct.FuelCenter, ptr %34, i32 0, i32 9, !dbg !982
  %36 = load i32, ptr %35, align 4, !dbg !983
  %37 = sub nsw i32 %36, %33, !dbg !983
  store i32 %37, ptr %35, align 4, !dbg !983
  %38 = load ptr, ptr %2, align 8, !dbg !984
  %39 = getelementptr inbounds nuw %struct.FuelCenter, ptr %38, i32 0, i32 9, !dbg !986
  %40 = load i32, ptr %39, align 4, !dbg !986
  %41 = icmp sle i32 %40, 0, !dbg !987
  br i1 %41, label %42, label %49, !dbg !987

42:                                               ; preds = %32
  %43 = load ptr, ptr %2, align 8, !dbg !988
  %44 = ptrtoint ptr %43 to i64, !dbg !988
  %45 = sub i64 %44, ptrtoint (ptr @Station to i64), !dbg !988
  %46 = sdiv exact i64 %45, 40, !dbg !988
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.12, i64 noundef %46), !dbg !988
  %47 = load ptr, ptr %2, align 8, !dbg !990
  %48 = getelementptr inbounds nuw %struct.FuelCenter, ptr %47, i32 0, i32 3, !dbg !991
  store i8 0, ptr %48, align 1, !dbg !992
  br label %49, !dbg !993

49:                                               ; preds = %42, %32
  br label %50, !dbg !994

50:                                               ; preds = %49, %27
  %51 = load ptr, ptr %2, align 8, !dbg !995
  %52 = getelementptr inbounds nuw %struct.FuelCenter, ptr %51, i32 0, i32 6, !dbg !997
  %53 = load i32, ptr %52, align 4, !dbg !997
  %54 = icmp sle i32 %53, 0, !dbg !998
  br i1 %54, label %55, label %56, !dbg !998

55:                                               ; preds = %50
  br label %451, !dbg !999

56:                                               ; preds = %50
  %57 = load ptr, ptr %2, align 8, !dbg !1001
  %58 = getelementptr inbounds nuw %struct.FuelCenter, ptr %57, i32 0, i32 1, !dbg !1002
  %59 = load i32, ptr %58, align 4, !dbg !1002
  %60 = sext i32 %59 to i64, !dbg !1003
  %61 = getelementptr inbounds [0 x %struct.segment2], ptr @Segment2s, i64 0, i64 %60, !dbg !1003
  %62 = getelementptr inbounds nuw %struct.segment2, ptr %61, i32 0, i32 1, !dbg !1004
  %63 = load i8, ptr %62, align 1, !dbg !1004
  %64 = sext i8 %63 to i32, !dbg !1003
  store i32 %64, ptr %5, align 4, !dbg !1005
  %65 = load i32, ptr %5, align 4, !dbg !1006
  %66 = icmp eq i32 %65, -1, !dbg !1008
  br i1 %66, label %67, label %71, !dbg !1008

67:                                               ; preds = %56
  %68 = load ptr, ptr %2, align 8, !dbg !1009
  %69 = getelementptr inbounds nuw %struct.FuelCenter, ptr %68, i32 0, i32 1, !dbg !1009
  %70 = load i32, ptr %69, align 4, !dbg !1009
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.13, i32 noundef %70), !dbg !1009
  br label %451, !dbg !1011

71:                                               ; preds = %56
  %72 = load i32, ptr %5, align 4, !dbg !1012
  %73 = sext i32 %72 to i64, !dbg !1014
  %74 = getelementptr inbounds [20 x %struct.matcen_info], ptr @RobotCenters, i64 0, i64 %73, !dbg !1014
  %75 = getelementptr inbounds nuw %struct.matcen_info, ptr %74, i32 0, i32 0, !dbg !1015
  %76 = getelementptr inbounds [2 x i32], ptr %75, i64 0, i64 0, !dbg !1014
  %77 = load i32, ptr %76, align 4, !dbg !1014
  %78 = icmp eq i32 %77, 0, !dbg !1016
  br i1 %78, label %79, label %88, !dbg !1017

79:                                               ; preds = %71
  %80 = load i32, ptr %5, align 4, !dbg !1018
  %81 = sext i32 %80 to i64, !dbg !1019
  %82 = getelementptr inbounds [20 x %struct.matcen_info], ptr @RobotCenters, i64 0, i64 %81, !dbg !1019
  %83 = getelementptr inbounds nuw %struct.matcen_info, ptr %82, i32 0, i32 0, !dbg !1020
  %84 = getelementptr inbounds [2 x i32], ptr %83, i64 0, i64 1, !dbg !1019
  %85 = load i32, ptr %84, align 4, !dbg !1019
  %86 = icmp eq i32 %85, 0, !dbg !1021
  br i1 %86, label %87, label %88, !dbg !1017

87:                                               ; preds = %79
  br label %451, !dbg !1022

88:                                               ; preds = %79, %71
  %89 = load i32, ptr @Player_num, align 4, !dbg !1024
  %90 = sext i32 %89 to i64, !dbg !1026
  %91 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %90, !dbg !1026
  %92 = getelementptr inbounds nuw %struct.player, ptr %91, i32 0, i32 31, !dbg !1027
  %93 = load i16, ptr %92, align 2, !dbg !1027
  %94 = sext i16 %93 to i32, !dbg !1026
  %95 = load i32, ptr @Player_num, align 4, !dbg !1028
  %96 = sext i32 %95 to i64, !dbg !1029
  %97 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %96, !dbg !1029
  %98 = getelementptr inbounds nuw %struct.player, ptr %97, i32 0, i32 29, !dbg !1030
  %99 = load i16, ptr %98, align 2, !dbg !1030
  %100 = sext i16 %99 to i32, !dbg !1029
  %101 = sub nsw i32 %94, %100, !dbg !1031
  %102 = load i32, ptr @Gamesave_num_org_robots, align 4, !dbg !1032
  %103 = load i32, ptr @Num_extry_robots, align 4, !dbg !1033
  %104 = add nsw i32 %102, %103, !dbg !1034
  %105 = icmp sge i32 %101, %104, !dbg !1035
  br i1 %105, label %106, label %114, !dbg !1035

106:                                              ; preds = %88
  %107 = load i32, ptr @FrameCount, align 4, !dbg !1036
  %108 = load i32, ptr @FrameCount_last_msg, align 4, !dbg !1039
  %109 = add nsw i32 %108, 20, !dbg !1040
  %110 = icmp sgt i32 %107, %109, !dbg !1041
  br i1 %110, label %111, label %113, !dbg !1041

111:                                              ; preds = %106
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.14), !dbg !1042
  %112 = load i32, ptr @FrameCount, align 4, !dbg !1044
  store i32 %112, ptr @FrameCount_last_msg, align 4, !dbg !1045
  br label %113, !dbg !1046

113:                                              ; preds = %111, %106
  br label %451, !dbg !1047

114:                                              ; preds = %88
  %115 = load i32, ptr @FrameTime, align 4, !dbg !1048
  %116 = load ptr, ptr %2, align 8, !dbg !1049
  %117 = getelementptr inbounds nuw %struct.FuelCenter, ptr %116, i32 0, i32 8, !dbg !1050
  %118 = load i32, ptr %117, align 4, !dbg !1051
  %119 = add nsw i32 %118, %115, !dbg !1051
  store i32 %119, ptr %117, align 4, !dbg !1051
  %120 = load ptr, ptr %2, align 8, !dbg !1052
  %121 = getelementptr inbounds nuw %struct.FuelCenter, ptr %120, i32 0, i32 2, !dbg !1053
  %122 = load i8, ptr %121, align 4, !dbg !1053
  %123 = sext i8 %122 to i32, !dbg !1052
  switch i32 %123, label %446 [
    i32 0, label %124
    i32 1, label %313
  ], !dbg !1054

124:                                              ; preds = %114
  %125 = load i32, ptr @Game_mode, align 4, !dbg !1055
  %126 = and i32 %125, 38, !dbg !1058
  %127 = icmp ne i32 %126, 0, !dbg !1055
  br i1 %127, label %128, label %130, !dbg !1055

128:                                              ; preds = %124
  %129 = call noundef i32 @_Z3i2fi(i32 noundef 5), !dbg !1059
  store i32 %129, ptr %9, align 4, !dbg !1061
  br label %157, !dbg !1062

130:                                              ; preds = %124
  %131 = load ptr, ptr @ConsoleObject, align 8, !dbg !1063
  %132 = getelementptr inbounds nuw %struct.object, ptr %131, i32 0, i32 11, !dbg !1065
  %133 = load ptr, ptr %2, align 8, !dbg !1066
  %134 = getelementptr inbounds nuw %struct.FuelCenter, ptr %133, i32 0, i32 10, !dbg !1067
  %135 = call noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef %132, ptr noundef %134), !dbg !1068
  store i32 %135, ptr %3, align 4, !dbg !1069
  %136 = load i32, ptr %3, align 4, !dbg !1070
  %137 = sdiv i32 %136, 64, !dbg !1071
  %138 = call noundef i32 @_Z6P_Randv(), !dbg !1072
  %139 = mul nsw i32 %138, 2, !dbg !1073
  %140 = add nsw i32 %137, %139, !dbg !1074
  %141 = add nsw i32 %140, 131072, !dbg !1075
  store i32 %141, ptr %9, align 4, !dbg !1076
  %142 = load i32, ptr %9, align 4, !dbg !1077
  %143 = call noundef i32 @_Z3i2fi(i32 noundef 5), !dbg !1079
  %144 = icmp sgt i32 %142, %143, !dbg !1080
  br i1 %144, label %145, label %149, !dbg !1080

145:                                              ; preds = %130
  %146 = call noundef i32 @_Z3i2fi(i32 noundef 5), !dbg !1081
  %147 = call noundef i32 @_Z6P_Randv(), !dbg !1082
  %148 = add nsw i32 %146, %147, !dbg !1083
  store i32 %148, ptr %9, align 4, !dbg !1084
  br label %149, !dbg !1085

149:                                              ; preds = %145, %130
  %150 = load i32, ptr %9, align 4, !dbg !1086
  %151 = icmp slt i32 %150, 131072, !dbg !1088
  br i1 %151, label %152, label %156, !dbg !1088

152:                                              ; preds = %149
  %153 = call noundef i32 @_Z6P_Randv(), !dbg !1089
  %154 = mul nsw i32 %153, 2, !dbg !1090
  %155 = add nsw i32 98304, %154, !dbg !1091
  store i32 %155, ptr %9, align 4, !dbg !1092
  br label %156, !dbg !1093

156:                                              ; preds = %152, %149
  br label %157

157:                                              ; preds = %156, %128
  %158 = load ptr, ptr %2, align 8, !dbg !1094
  %159 = getelementptr inbounds nuw %struct.FuelCenter, ptr %158, i32 0, i32 8, !dbg !1096
  %160 = load i32, ptr %159, align 4, !dbg !1096
  %161 = load i32, ptr %9, align 4, !dbg !1097
  %162 = icmp sgt i32 %160, %161, !dbg !1098
  br i1 %162, label %163, label %312, !dbg !1098

163:                                              ; preds = %157
    #dbg_declare(ptr %11, !1099, !DIExpression(), !1101)
  store i32 0, ptr %11, align 4, !dbg !1101
    #dbg_declare(ptr %12, !1102, !DIExpression(), !1103)
    #dbg_declare(ptr %13, !1104, !DIExpression(), !1105)
  %164 = load ptr, ptr %2, align 8, !dbg !1106
  %165 = ptrtoint ptr %164 to i64, !dbg !1107
  %166 = sub i64 %165, ptrtoint (ptr @Station to i64), !dbg !1107
  %167 = sdiv exact i64 %166, 40, !dbg !1107
  %168 = trunc i64 %167 to i32, !dbg !1106
  store i32 %168, ptr %13, align 4, !dbg !1105
    #dbg_declare(ptr %14, !1108, !DIExpression(), !1109)
  store i32 0, ptr %12, align 4, !dbg !1110
  br label %169, !dbg !1112

169:                                              ; preds = %198, %163
  %170 = load i32, ptr %12, align 4, !dbg !1113
  %171 = load i32, ptr @Highest_object_index, align 4, !dbg !1115
  %172 = icmp sle i32 %170, %171, !dbg !1116
  br i1 %172, label %173, label %201, !dbg !1117

173:                                              ; preds = %169
  %174 = load i32, ptr %12, align 4, !dbg !1118
  %175 = sext i32 %174 to i64, !dbg !1120
  %176 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %175, !dbg !1120
  %177 = getelementptr inbounds nuw %struct.object, ptr %176, i32 0, i32 1, !dbg !1121
  %178 = load i8, ptr %177, align 4, !dbg !1121
  %179 = zext i8 %178 to i32, !dbg !1120
  %180 = icmp eq i32 %179, 2, !dbg !1122
  br i1 %180, label %181, label %197, !dbg !1122

181:                                              ; preds = %173
  %182 = load i32, ptr %12, align 4, !dbg !1123
  %183 = sext i32 %182 to i64, !dbg !1125
  %184 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %183, !dbg !1125
  %185 = getelementptr inbounds nuw %struct.object, ptr %184, i32 0, i32 19, !dbg !1126
  %186 = load i8, ptr %185, align 1, !dbg !1126
  %187 = sext i8 %186 to i32, !dbg !1125
  %188 = xor i32 %187, 128, !dbg !1127
  %189 = trunc i32 %188 to i8, !dbg !1128
  %190 = sext i8 %189 to i32, !dbg !1129
  %191 = load i32, ptr %13, align 4, !dbg !1130
  %192 = icmp eq i32 %190, %191, !dbg !1131
  br i1 %192, label %193, label %196, !dbg !1131

193:                                              ; preds = %181
  %194 = load i32, ptr %11, align 4, !dbg !1132
  %195 = add nsw i32 %194, 1, !dbg !1132
  store i32 %195, ptr %11, align 4, !dbg !1132
  br label %196, !dbg !1133

196:                                              ; preds = %193, %181
  br label %197, !dbg !1130

197:                                              ; preds = %196, %173
  br label %198, !dbg !1134

198:                                              ; preds = %197
  %199 = load i32, ptr %12, align 4, !dbg !1135
  %200 = add nsw i32 %199, 1, !dbg !1135
  store i32 %200, ptr %12, align 4, !dbg !1135
  br label %169, !dbg !1136, !llvm.loop !1137

201:                                              ; preds = %169
  %202 = load i32, ptr %11, align 4, !dbg !1139
  %203 = load i32, ptr @Difficulty_level, align 4, !dbg !1141
  %204 = add nsw i32 %203, 3, !dbg !1142
  %205 = icmp sgt i32 %202, %204, !dbg !1143
  br i1 %205, label %206, label %213, !dbg !1143

206:                                              ; preds = %201
  %207 = load i32, ptr %13, align 4, !dbg !1144
  %208 = load i32, ptr %11, align 4, !dbg !1144
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.15, i32 noundef %207, i32 noundef %208), !dbg !1144
  %209 = load ptr, ptr %2, align 8, !dbg !1146
  %210 = getelementptr inbounds nuw %struct.FuelCenter, ptr %209, i32 0, i32 8, !dbg !1147
  %211 = load i32, ptr %210, align 4, !dbg !1148
  %212 = sdiv i32 %211, 2, !dbg !1148
  store i32 %212, ptr %210, align 4, !dbg !1148
  br label %451, !dbg !1149

213:                                              ; preds = %201
  store i32 0, ptr %11, align 4, !dbg !1150
  %214 = load ptr, ptr %2, align 8, !dbg !1151
  %215 = getelementptr inbounds nuw %struct.FuelCenter, ptr %214, i32 0, i32 1, !dbg !1152
  %216 = load i32, ptr %215, align 4, !dbg !1152
  store i32 %216, ptr %6, align 4, !dbg !1153
  %217 = load i32, ptr %6, align 4, !dbg !1154
  %218 = sext i32 %217 to i64, !dbg !1156
  %219 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %218, !dbg !1156
  %220 = getelementptr inbounds nuw %struct.segment, ptr %219, i32 0, i32 3, !dbg !1157
  %221 = load i32, ptr %220, align 4, !dbg !1157
  store i32 %221, ptr %7, align 4, !dbg !1158
  br label %222, !dbg !1159

222:                                              ; preds = %266, %213
  %223 = load i32, ptr %7, align 4, !dbg !1160
  %224 = icmp ne i32 %223, -1, !dbg !1162
  br i1 %224, label %225, label %273, !dbg !1163

225:                                              ; preds = %222
  %226 = load i32, ptr %11, align 4, !dbg !1164
  %227 = add nsw i32 %226, 1, !dbg !1164
  store i32 %227, ptr %11, align 4, !dbg !1164
  %228 = load i32, ptr %11, align 4, !dbg !1166
  %229 = icmp sgt i32 %228, 350, !dbg !1168
  br i1 %229, label %230, label %232, !dbg !1168

230:                                              ; preds = %225
  %231 = load i32, ptr %6, align 4, !dbg !1169
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.16, i32 noundef %231), !dbg !1169
  call void @_Z4Int3v(), !dbg !1171
  br label %451, !dbg !1172

232:                                              ; preds = %225
  %233 = load i32, ptr %7, align 4, !dbg !1173
  %234 = sext i32 %233 to i64, !dbg !1175
  %235 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %234, !dbg !1175
  %236 = getelementptr inbounds nuw %struct.object, ptr %235, i32 0, i32 1, !dbg !1176
  %237 = load i8, ptr %236, align 4, !dbg !1176
  %238 = zext i8 %237 to i32, !dbg !1175
  %239 = icmp eq i32 %238, 2, !dbg !1177
  br i1 %239, label %240, label %248, !dbg !1177

240:                                              ; preds = %232
  %241 = load i32, ptr %7, align 4, !dbg !1178
  %242 = sext i32 %241 to i64, !dbg !1180
  %243 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %242, !dbg !1180
  call void @_Z40collide_robot_and_materialization_centerP6object(ptr noundef %243), !dbg !1181
  %244 = load i32, ptr %9, align 4, !dbg !1182
  %245 = sdiv i32 %244, 2, !dbg !1183
  %246 = load ptr, ptr %2, align 8, !dbg !1184
  %247 = getelementptr inbounds nuw %struct.FuelCenter, ptr %246, i32 0, i32 8, !dbg !1185
  store i32 %245, ptr %247, align 4, !dbg !1186
  br label %451, !dbg !1187

248:                                              ; preds = %232
  %249 = load i32, ptr %7, align 4, !dbg !1188
  %250 = sext i32 %249 to i64, !dbg !1190
  %251 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %250, !dbg !1190
  %252 = getelementptr inbounds nuw %struct.object, ptr %251, i32 0, i32 1, !dbg !1191
  %253 = load i8, ptr %252, align 4, !dbg !1191
  %254 = zext i8 %253 to i32, !dbg !1190
  %255 = icmp eq i32 %254, 4, !dbg !1192
  br i1 %255, label %256, label %264, !dbg !1192

256:                                              ; preds = %248
  %257 = load i32, ptr %7, align 4, !dbg !1193
  %258 = sext i32 %257 to i64, !dbg !1195
  %259 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %258, !dbg !1195
  call void @_Z41collide_player_and_materialization_centerP6object(ptr noundef %259), !dbg !1196
  %260 = load i32, ptr %9, align 4, !dbg !1197
  %261 = sdiv i32 %260, 2, !dbg !1198
  %262 = load ptr, ptr %2, align 8, !dbg !1199
  %263 = getelementptr inbounds nuw %struct.FuelCenter, ptr %262, i32 0, i32 8, !dbg !1200
  store i32 %261, ptr %263, align 4, !dbg !1201
  br label %451, !dbg !1202

264:                                              ; preds = %248
  br label %265

265:                                              ; preds = %264
  br label %266, !dbg !1203

266:                                              ; preds = %265
  %267 = load i32, ptr %7, align 4, !dbg !1204
  %268 = sext i32 %267 to i64, !dbg !1205
  %269 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %268, !dbg !1205
  %270 = getelementptr inbounds nuw %struct.object, ptr %269, i32 0, i32 3, !dbg !1206
  %271 = load i16, ptr %270, align 2, !dbg !1206
  %272 = sext i16 %271 to i32, !dbg !1205
  store i32 %272, ptr %7, align 4, !dbg !1207
  br label %222, !dbg !1208, !llvm.loop !1209

273:                                              ; preds = %222
  %274 = load ptr, ptr %2, align 8, !dbg !1211
  %275 = getelementptr inbounds nuw %struct.FuelCenter, ptr %274, i32 0, i32 1, !dbg !1212
  %276 = load i32, ptr %275, align 4, !dbg !1212
  %277 = sext i32 %276 to i64, !dbg !1213
  %278 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %277, !dbg !1213
  call void @_Z22compute_segment_centerP10vms_vectorP7segment(ptr noundef %4, ptr noundef %278), !dbg !1214
  %279 = load ptr, ptr %2, align 8, !dbg !1215
  %280 = getelementptr inbounds nuw %struct.FuelCenter, ptr %279, i32 0, i32 1, !dbg !1216
  %281 = load i32, ptr %280, align 4, !dbg !1216
  %282 = trunc i32 %281 to i16, !dbg !1215
  %283 = call noundef i32 @_Z3i2fi(i32 noundef 10), !dbg !1217
  %284 = call noundef ptr @_Z23object_create_explosionsP10vms_vectorii(i16 noundef signext %282, ptr noundef %4, i32 noundef %283, i32 noundef 10), !dbg !1218
  store ptr %284, ptr %14, align 8, !dbg !1219
  %285 = load ptr, ptr %14, align 8, !dbg !1220
  %286 = icmp ne ptr %285, null, !dbg !1220
  br i1 %286, label %287, label %295, !dbg !1220

287:                                              ; preds = %273
  %288 = load ptr, ptr %14, align 8, !dbg !1222
  %289 = getelementptr inbounds nuw %struct.object, ptr %288, i32 0, i32 12, !dbg !1223
  %290 = load ptr, ptr %2, align 8, !dbg !1224
  %291 = getelementptr inbounds nuw %struct.FuelCenter, ptr %290, i32 0, i32 1, !dbg !1225
  %292 = load i32, ptr %291, align 4, !dbg !1225
  %293 = sext i32 %292 to i64, !dbg !1226
  %294 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %293, !dbg !1226
  call void @_Z27extract_orient_from_segmentP10vms_matrixP7segment(ptr noundef %289, ptr noundef %294), !dbg !1227
  br label %295, !dbg !1227

295:                                              ; preds = %287, %273
  %296 = load i16, ptr getelementptr inbounds nuw (%struct.vclip, ptr getelementptr inbounds ([110 x %struct.vclip], ptr @Vclip, i64 0, i64 10), i32 0, i32 4), align 4, !dbg !1228
  %297 = sext i16 %296 to i32, !dbg !1230
  %298 = icmp sgt i32 %297, -1, !dbg !1231
  br i1 %298, label %299, label %307, !dbg !1231

299:                                              ; preds = %295
  %300 = load i16, ptr getelementptr inbounds nuw (%struct.vclip, ptr getelementptr inbounds ([110 x %struct.vclip], ptr @Vclip, i64 0, i64 10), i32 0, i32 4), align 4, !dbg !1232
  %301 = sext i16 %300 to i32, !dbg !1234
  %302 = load ptr, ptr %2, align 8, !dbg !1235
  %303 = getelementptr inbounds nuw %struct.FuelCenter, ptr %302, i32 0, i32 1, !dbg !1236
  %304 = load i32, ptr %303, align 4, !dbg !1236
  %305 = trunc i32 %304 to i16, !dbg !1235
  %306 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef %301, i16 noundef signext %305, i16 noundef signext 0, ptr noundef %4, i32 noundef 0, i32 noundef 65536), !dbg !1237
  br label %307, !dbg !1238

307:                                              ; preds = %299, %295
  %308 = load ptr, ptr %2, align 8, !dbg !1239
  %309 = getelementptr inbounds nuw %struct.FuelCenter, ptr %308, i32 0, i32 2, !dbg !1240
  store i8 1, ptr %309, align 4, !dbg !1241
  %310 = load ptr, ptr %2, align 8, !dbg !1242
  %311 = getelementptr inbounds nuw %struct.FuelCenter, ptr %310, i32 0, i32 8, !dbg !1243
  store i32 0, ptr %311, align 4, !dbg !1244
  br label %312, !dbg !1245

312:                                              ; preds = %307, %157
  br label %451, !dbg !1246

313:                                              ; preds = %114
  %314 = load ptr, ptr %2, align 8, !dbg !1247
  %315 = getelementptr inbounds nuw %struct.FuelCenter, ptr %314, i32 0, i32 8, !dbg !1249
  %316 = load i32, ptr %315, align 4, !dbg !1249
  %317 = load i32, ptr getelementptr inbounds ([110 x %struct.vclip], ptr @Vclip, i64 0, i64 10), align 4, !dbg !1250
  %318 = sdiv i32 %317, 2, !dbg !1251
  %319 = icmp sgt i32 %316, %318, !dbg !1252
  br i1 %319, label %320, label %445, !dbg !1252

320:                                              ; preds = %313
  %321 = load i32, ptr @EnergyToCreateOneRobot, align 4, !dbg !1253
  %322 = load ptr, ptr %2, align 8, !dbg !1255
  %323 = getelementptr inbounds nuw %struct.FuelCenter, ptr %322, i32 0, i32 6, !dbg !1256
  %324 = load i32, ptr %323, align 4, !dbg !1257
  %325 = sub nsw i32 %324, %321, !dbg !1257
  store i32 %325, ptr %323, align 4, !dbg !1257
  %326 = load ptr, ptr %2, align 8, !dbg !1258
  %327 = getelementptr inbounds nuw %struct.FuelCenter, ptr %326, i32 0, i32 2, !dbg !1259
  store i8 0, ptr %327, align 4, !dbg !1260
  %328 = load ptr, ptr %2, align 8, !dbg !1261
  %329 = getelementptr inbounds nuw %struct.FuelCenter, ptr %328, i32 0, i32 8, !dbg !1262
  store i32 0, ptr %329, align 4, !dbg !1263
  %330 = load ptr, ptr %2, align 8, !dbg !1264
  %331 = getelementptr inbounds nuw %struct.FuelCenter, ptr %330, i32 0, i32 1, !dbg !1265
  %332 = load i32, ptr %331, align 4, !dbg !1265
  %333 = sext i32 %332 to i64, !dbg !1266
  %334 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %333, !dbg !1266
  call void @_Z22compute_segment_centerP10vms_vectorP7segment(ptr noundef %4, ptr noundef %334), !dbg !1267
  %335 = load i32, ptr %5, align 4, !dbg !1268
  %336 = sext i32 %335 to i64, !dbg !1270
  %337 = getelementptr inbounds [20 x %struct.matcen_info], ptr @RobotCenters, i64 0, i64 %336, !dbg !1270
  %338 = getelementptr inbounds nuw %struct.matcen_info, ptr %337, i32 0, i32 0, !dbg !1271
  %339 = getelementptr inbounds [2 x i32], ptr %338, i64 0, i64 0, !dbg !1270
  %340 = load i32, ptr %339, align 4, !dbg !1270
  %341 = icmp ne i32 %340, 0, !dbg !1272
  br i1 %341, label %350, label %342, !dbg !1273

342:                                              ; preds = %320
  %343 = load i32, ptr %5, align 4, !dbg !1274
  %344 = sext i32 %343 to i64, !dbg !1275
  %345 = getelementptr inbounds [20 x %struct.matcen_info], ptr @RobotCenters, i64 0, i64 %344, !dbg !1275
  %346 = getelementptr inbounds nuw %struct.matcen_info, ptr %345, i32 0, i32 0, !dbg !1276
  %347 = getelementptr inbounds [2 x i32], ptr %346, i64 0, i64 1, !dbg !1275
  %348 = load i32, ptr %347, align 4, !dbg !1275
  %349 = icmp ne i32 %348, 0, !dbg !1277
  br i1 %349, label %350, label %444, !dbg !1273

350:                                              ; preds = %342, %320
    #dbg_declare(ptr %15, !1278, !DIExpression(), !1280)
    #dbg_declare(ptr %16, !1281, !DIExpression(), !1282)
    #dbg_declare(ptr %17, !1283, !DIExpression(), !1287)
    #dbg_declare(ptr %18, !1288, !DIExpression(), !1289)
    #dbg_declare(ptr %19, !1290, !DIExpression(), !1291)
    #dbg_declare(ptr %20, !1292, !DIExpression(), !1293)
  store i32 0, ptr %18, align 4, !dbg !1294
  store i32 0, ptr %20, align 4, !dbg !1295
  br label %351, !dbg !1297

351:                                              ; preds = %385, %350
  %352 = load i32, ptr %20, align 4, !dbg !1298
  %353 = icmp slt i32 %352, 2, !dbg !1300
  br i1 %353, label %354, label %388, !dbg !1301

354:                                              ; preds = %351
  %355 = load i32, ptr %20, align 4, !dbg !1302
  %356 = mul nsw i32 %355, 32, !dbg !1304
  store i32 %356, ptr %19, align 4, !dbg !1305
  %357 = load i32, ptr %5, align 4, !dbg !1306
  %358 = sext i32 %357 to i64, !dbg !1307
  %359 = getelementptr inbounds [20 x %struct.matcen_info], ptr @RobotCenters, i64 0, i64 %358, !dbg !1307
  %360 = getelementptr inbounds nuw %struct.matcen_info, ptr %359, i32 0, i32 0, !dbg !1308
  %361 = load i32, ptr %20, align 4, !dbg !1309
  %362 = sext i32 %361 to i64, !dbg !1307
  %363 = getelementptr inbounds [2 x i32], ptr %360, i64 0, i64 %362, !dbg !1307
  %364 = load i32, ptr %363, align 4, !dbg !1307
  store i32 %364, ptr %16, align 4, !dbg !1310
  br label %365, !dbg !1311

365:                                              ; preds = %379, %354
  %366 = load i32, ptr %16, align 4, !dbg !1312
  %367 = icmp ne i32 %366, 0, !dbg !1312
  br i1 %367, label %368, label %384, !dbg !1311

368:                                              ; preds = %365
  %369 = load i32, ptr %16, align 4, !dbg !1313
  %370 = and i32 %369, 1, !dbg !1316
  %371 = icmp ne i32 %370, 0, !dbg !1313
  br i1 %371, label %372, label %379, !dbg !1313

372:                                              ; preds = %368
  %373 = load i32, ptr %19, align 4, !dbg !1317
  %374 = trunc i32 %373 to i8, !dbg !1317
  %375 = load i32, ptr %18, align 4, !dbg !1318
  %376 = add nsw i32 %375, 1, !dbg !1318
  store i32 %376, ptr %18, align 4, !dbg !1318
  %377 = sext i32 %375 to i64, !dbg !1319
  %378 = getelementptr inbounds [64 x i8], ptr %17, i64 0, i64 %377, !dbg !1319
  store i8 %374, ptr %378, align 1, !dbg !1320
  br label %379, !dbg !1319

379:                                              ; preds = %372, %368
  %380 = load i32, ptr %16, align 4, !dbg !1321
  %381 = lshr i32 %380, 1, !dbg !1321
  store i32 %381, ptr %16, align 4, !dbg !1321
  %382 = load i32, ptr %19, align 4, !dbg !1322
  %383 = add nsw i32 %382, 1, !dbg !1322
  store i32 %383, ptr %19, align 4, !dbg !1322
  br label %365, !dbg !1311, !llvm.loop !1323

384:                                              ; preds = %365
  br label %385, !dbg !1325

385:                                              ; preds = %384
  %386 = load i32, ptr %20, align 4, !dbg !1326
  %387 = add nsw i32 %386, 1, !dbg !1326
  store i32 %387, ptr %20, align 4, !dbg !1326
  br label %351, !dbg !1327, !llvm.loop !1328

388:                                              ; preds = %351
  %389 = load i32, ptr %18, align 4, !dbg !1330
  %390 = icmp eq i32 %389, 1, !dbg !1332
  br i1 %390, label %391, label %395, !dbg !1332

391:                                              ; preds = %388
  %392 = getelementptr inbounds [64 x i8], ptr %17, i64 0, i64 0, !dbg !1333
  %393 = load i8, ptr %392, align 1, !dbg !1333
  %394 = sext i8 %393 to i32, !dbg !1333
  store i32 %394, ptr %15, align 4, !dbg !1334
  br label %404, !dbg !1335

395:                                              ; preds = %388
  %396 = call noundef i32 @_Z6P_Randv(), !dbg !1336
  %397 = load i32, ptr %18, align 4, !dbg !1337
  %398 = mul nsw i32 %396, %397, !dbg !1338
  %399 = sdiv i32 %398, 32768, !dbg !1339
  %400 = sext i32 %399 to i64, !dbg !1340
  %401 = getelementptr inbounds [64 x i8], ptr %17, i64 0, i64 %400, !dbg !1340
  %402 = load i8, ptr %401, align 1, !dbg !1340
  %403 = sext i8 %402 to i32, !dbg !1340
  store i32 %403, ptr %15, align 4, !dbg !1341
  br label %404

404:                                              ; preds = %395, %391
  %405 = load i32, ptr %15, align 4, !dbg !1342
  %406 = load ptr, ptr %2, align 8, !dbg !1342
  %407 = getelementptr inbounds nuw %struct.FuelCenter, ptr %406, i32 0, i32 1, !dbg !1342
  %408 = load i32, ptr %407, align 4, !dbg !1342
  %409 = load ptr, ptr %2, align 8, !dbg !1342
  %410 = getelementptr inbounds nuw %struct.FuelCenter, ptr %409, i32 0, i32 6, !dbg !1342
  %411 = load i32, ptr %410, align 4, !dbg !1342
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.17, i32 noundef %405, i32 noundef %408, i32 noundef %411), !dbg !1342
  %412 = load ptr, ptr %2, align 8, !dbg !1343
  %413 = getelementptr inbounds nuw %struct.FuelCenter, ptr %412, i32 0, i32 1, !dbg !1344
  %414 = load i32, ptr %413, align 4, !dbg !1344
  %415 = sext i32 %414 to i64, !dbg !1345
  %416 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %415, !dbg !1345
  %417 = load i32, ptr %15, align 4, !dbg !1346
  %418 = call noundef ptr @_Z18create_morph_robotP7segmentP10vms_vectori(ptr noundef %416, ptr noundef %4, i32 noundef %417), !dbg !1347
  store ptr %418, ptr %8, align 8, !dbg !1348
  %419 = load ptr, ptr %8, align 8, !dbg !1349
  %420 = icmp ne ptr %419, null, !dbg !1351
  br i1 %420, label %421, label %442, !dbg !1351

421:                                              ; preds = %404
  %422 = load ptr, ptr %2, align 8, !dbg !1352
  %423 = ptrtoint ptr %422 to i64, !dbg !1354
  %424 = sub i64 %423, ptrtoint (ptr @Station to i64), !dbg !1354
  %425 = sdiv exact i64 %424, 40, !dbg !1354
  %426 = or i64 %425, 128, !dbg !1355
  %427 = trunc i64 %426 to i8, !dbg !1352
  %428 = load ptr, ptr %8, align 8, !dbg !1356
  %429 = getelementptr inbounds nuw %struct.object, ptr %428, i32 0, i32 19, !dbg !1357
  store i8 %427, ptr %429, align 1, !dbg !1358
  %430 = load ptr, ptr @ConsoleObject, align 8, !dbg !1359
  %431 = getelementptr inbounds nuw %struct.object, ptr %430, i32 0, i32 11, !dbg !1360
  %432 = load ptr, ptr %8, align 8, !dbg !1361
  %433 = getelementptr inbounds nuw %struct.object, ptr %432, i32 0, i32 11, !dbg !1362
  %434 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %10, ptr noundef %431, ptr noundef %433), !dbg !1363
  %435 = load ptr, ptr %8, align 8, !dbg !1364
  %436 = getelementptr inbounds nuw %struct.object, ptr %435, i32 0, i32 12, !dbg !1365
  %437 = load ptr, ptr %8, align 8, !dbg !1366
  %438 = getelementptr inbounds nuw %struct.object, ptr %437, i32 0, i32 12, !dbg !1367
  %439 = getelementptr inbounds nuw %struct.vms_matrix, ptr %438, i32 0, i32 1, !dbg !1368
  %440 = call noundef ptr @_Z18vm_vector_2_matrixP10vms_matrixP10vms_vectorS2_S2_(ptr noundef %436, ptr noundef %10, ptr noundef %439, ptr noundef null), !dbg !1369
  %441 = load ptr, ptr %8, align 8, !dbg !1370
  call void @_Z11morph_startP6object(ptr noundef %441), !dbg !1371
  br label %443, !dbg !1372

442:                                              ; preds = %404
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.18), !dbg !1373
  br label %443

443:                                              ; preds = %442, %421
  br label %444, !dbg !1374

444:                                              ; preds = %443, %342
  br label %445, !dbg !1375

445:                                              ; preds = %444, %313
  br label %451, !dbg !1376

446:                                              ; preds = %114
  %447 = load ptr, ptr %2, align 8, !dbg !1377
  %448 = getelementptr inbounds nuw %struct.FuelCenter, ptr %447, i32 0, i32 2, !dbg !1378
  store i8 0, ptr %448, align 4, !dbg !1379
  %449 = load ptr, ptr %2, align 8, !dbg !1380
  %450 = getelementptr inbounds nuw %struct.FuelCenter, ptr %449, i32 0, i32 8, !dbg !1381
  store i32 0, ptr %450, align 4, !dbg !1382
  br label %451, !dbg !1383

451:                                              ; preds = %26, %55, %67, %87, %113, %206, %230, %240, %256, %446, %445, %312
  ret void, !dbg !1384
}

declare noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef, ptr noundef) #2

declare noundef i32 @_Z6P_Randv() #2

declare void @_Z40collide_robot_and_materialization_centerP6object(ptr noundef) #2

declare void @_Z41collide_player_and_materialization_centerP6object(ptr noundef) #2

declare noundef ptr @_Z23object_create_explosionsP10vms_vectorii(i16 noundef signext, ptr noundef, i32 noundef, i32 noundef) #2

declare void @_Z27extract_orient_from_segmentP10vms_matrixP7segment(ptr noundef, ptr noundef) #2

declare noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef, i16 noundef signext, i16 noundef signext, ptr noundef, i32 noundef, i32 noundef) #2

declare noundef ptr @_Z18vm_vector_2_matrixP10vms_matrixP10vms_vectorS2_S2_(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #2

declare void @_Z11morph_startP6object(ptr noundef) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z18fuelcen_update_allv() #1 !dbg !1385 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
    #dbg_declare(ptr %1, !1386, !DIExpression(), !1387)
    #dbg_declare(ptr %2, !1388, !DIExpression(), !1389)
  %3 = load i32, ptr @FrameTime, align 4, !dbg !1390
  %4 = load i32, ptr @Fuelcen_refill_speed, align 4, !dbg !1391
  %5 = call noundef i32 @_Z6fixmulii(i32 noundef %3, i32 noundef %4), !dbg !1392
  store i32 %5, ptr %2, align 4, !dbg !1393
  store i32 0, ptr %1, align 4, !dbg !1394
  br label %6, !dbg !1396

6:                                                ; preds = %97, %0
  %7 = load i32, ptr %1, align 4, !dbg !1397
  %8 = load i32, ptr @Num_fuelcenters, align 4, !dbg !1399
  %9 = icmp slt i32 %7, %8, !dbg !1400
  br i1 %9, label %10, label %100, !dbg !1401

10:                                               ; preds = %6
  %11 = load i32, ptr %1, align 4, !dbg !1402
  %12 = sext i32 %11 to i64, !dbg !1405
  %13 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %12, !dbg !1405
  %14 = getelementptr inbounds nuw %struct.FuelCenter, ptr %13, i32 0, i32 0, !dbg !1406
  %15 = load i32, ptr %14, align 4, !dbg !1406
  %16 = icmp eq i32 %15, 4, !dbg !1407
  br i1 %16, label %17, label %26, !dbg !1407

17:                                               ; preds = %10
  %18 = load i32, ptr @Game_suspended, align 4, !dbg !1408
  %19 = and i32 %18, 1, !dbg !1411
  %20 = icmp ne i32 %19, 0, !dbg !1412
  br i1 %20, label %25, label %21, !dbg !1413

21:                                               ; preds = %17
  %22 = load i32, ptr %1, align 4, !dbg !1414
  %23 = sext i32 %22 to i64, !dbg !1415
  %24 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %23, !dbg !1415
  call void @_Z15robotmaker_procP10FuelCenter(ptr noundef %24), !dbg !1416
  br label %25, !dbg !1416

25:                                               ; preds = %21, %17
  br label %96, !dbg !1417

26:                                               ; preds = %10
  %27 = load i32, ptr %1, align 4, !dbg !1418
  %28 = sext i32 %27 to i64, !dbg !1420
  %29 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %28, !dbg !1420
  %30 = getelementptr inbounds nuw %struct.FuelCenter, ptr %29, i32 0, i32 0, !dbg !1421
  %31 = load i32, ptr %30, align 4, !dbg !1421
  %32 = icmp eq i32 %31, 3, !dbg !1422
  br i1 %32, label %33, label %34, !dbg !1422

33:                                               ; preds = %26
  br label %95, !dbg !1423

34:                                               ; preds = %26
  %35 = load i32, ptr %1, align 4, !dbg !1425
  %36 = sext i32 %35 to i64, !dbg !1427
  %37 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %36, !dbg !1427
  %38 = getelementptr inbounds nuw %struct.FuelCenter, ptr %37, i32 0, i32 7, !dbg !1428
  %39 = load i32, ptr %38, align 4, !dbg !1428
  %40 = icmp sgt i32 %39, 0, !dbg !1429
  br i1 %40, label %41, label %94, !dbg !1430

41:                                               ; preds = %34
  %42 = load ptr, ptr @PlayerSegment, align 8, !dbg !1431
  %43 = load i32, ptr %1, align 4, !dbg !1432
  %44 = sext i32 %43 to i64, !dbg !1433
  %45 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %44, !dbg !1433
  %46 = getelementptr inbounds nuw %struct.FuelCenter, ptr %45, i32 0, i32 1, !dbg !1434
  %47 = load i32, ptr %46, align 4, !dbg !1434
  %48 = sext i32 %47 to i64, !dbg !1435
  %49 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %48, !dbg !1435
  %50 = icmp ne ptr %42, %49, !dbg !1436
  br i1 %50, label %51, label %94, !dbg !1430

51:                                               ; preds = %41
  %52 = load i32, ptr %1, align 4, !dbg !1437
  %53 = sext i32 %52 to i64, !dbg !1440
  %54 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %53, !dbg !1440
  %55 = getelementptr inbounds nuw %struct.FuelCenter, ptr %54, i32 0, i32 6, !dbg !1441
  %56 = load i32, ptr %55, align 4, !dbg !1441
  %57 = load i32, ptr %1, align 4, !dbg !1442
  %58 = sext i32 %57 to i64, !dbg !1443
  %59 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %58, !dbg !1443
  %60 = getelementptr inbounds nuw %struct.FuelCenter, ptr %59, i32 0, i32 7, !dbg !1444
  %61 = load i32, ptr %60, align 4, !dbg !1444
  %62 = icmp slt i32 %56, %61, !dbg !1445
  br i1 %62, label %63, label %93, !dbg !1445

63:                                               ; preds = %51
  %64 = load i32, ptr %2, align 4, !dbg !1446
  %65 = load i32, ptr %1, align 4, !dbg !1448
  %66 = sext i32 %65 to i64, !dbg !1449
  %67 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %66, !dbg !1449
  %68 = getelementptr inbounds nuw %struct.FuelCenter, ptr %67, i32 0, i32 6, !dbg !1450
  %69 = load i32, ptr %68, align 4, !dbg !1451
  %70 = add nsw i32 %69, %64, !dbg !1451
  store i32 %70, ptr %68, align 4, !dbg !1451
  %71 = load i32, ptr %1, align 4, !dbg !1452
  %72 = sext i32 %71 to i64, !dbg !1454
  %73 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %72, !dbg !1454
  %74 = getelementptr inbounds nuw %struct.FuelCenter, ptr %73, i32 0, i32 6, !dbg !1455
  %75 = load i32, ptr %74, align 4, !dbg !1455
  %76 = load i32, ptr %1, align 4, !dbg !1456
  %77 = sext i32 %76 to i64, !dbg !1457
  %78 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %77, !dbg !1457
  %79 = getelementptr inbounds nuw %struct.FuelCenter, ptr %78, i32 0, i32 7, !dbg !1458
  %80 = load i32, ptr %79, align 4, !dbg !1458
  %81 = icmp sge i32 %75, %80, !dbg !1459
  br i1 %81, label %82, label %92, !dbg !1459

82:                                               ; preds = %63
  %83 = load i32, ptr %1, align 4, !dbg !1460
  %84 = sext i32 %83 to i64, !dbg !1462
  %85 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %84, !dbg !1462
  %86 = getelementptr inbounds nuw %struct.FuelCenter, ptr %85, i32 0, i32 7, !dbg !1463
  %87 = load i32, ptr %86, align 4, !dbg !1463
  %88 = load i32, ptr %1, align 4, !dbg !1464
  %89 = sext i32 %88 to i64, !dbg !1465
  %90 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %89, !dbg !1465
  %91 = getelementptr inbounds nuw %struct.FuelCenter, ptr %90, i32 0, i32 6, !dbg !1466
  store i32 %87, ptr %91, align 4, !dbg !1467
  br label %92, !dbg !1468

92:                                               ; preds = %82, %63
  br label %93, !dbg !1469

93:                                               ; preds = %92, %51
  br label %94, !dbg !1470

94:                                               ; preds = %93, %41, %34
  br label %95

95:                                               ; preds = %94, %33
  br label %96

96:                                               ; preds = %95, %25
  br label %97, !dbg !1471

97:                                               ; preds = %96
  %98 = load i32, ptr %1, align 4, !dbg !1472
  %99 = add nsw i32 %98, 1, !dbg !1472
  store i32 %99, ptr %1, align 4, !dbg !1472
  br label %6, !dbg !1473, !llvm.loop !1474

100:                                              ; preds = %6
  ret void, !dbg !1476
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z6fixmulii(i32 noundef %0, i32 noundef %1) #0 !dbg !1477 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !1480, !DIExpression(), !1481)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !1482, !DIExpression(), !1483)
  %5 = load i32, ptr %3, align 4, !dbg !1484
  %6 = sext i32 %5 to i64, !dbg !1484
  %7 = load i32, ptr %4, align 4, !dbg !1485
  %8 = sext i32 %7 to i64, !dbg !1485
  %9 = mul nsw i64 %6, %8, !dbg !1486
  %10 = ashr i64 %9, 16, !dbg !1487
  %11 = trunc i64 %10 to i32, !dbg !1488
  ret i32 %11, !dbg !1489
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z17fuelcen_give_fuelP7segmenti(ptr noundef %0, i32 noundef %1) #1 !dbg !210 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !1490, !DIExpression(), !1491)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !1492, !DIExpression(), !1493)
    #dbg_declare(ptr %6, !1494, !DIExpression(), !1495)
  %8 = load ptr, ptr %4, align 8, !dbg !1496
  %9 = ptrtoint ptr %8 to i64, !dbg !1497
  %10 = sub i64 %9, ptrtoint (ptr @Segments to i64), !dbg !1497
  %11 = sdiv exact i64 %10, 512, !dbg !1497
  %12 = getelementptr inbounds [0 x %struct.segment2], ptr @Segment2s, i64 0, i64 %11, !dbg !1498
  store ptr %12, ptr %6, align 8, !dbg !1495
  %13 = load ptr, ptr %4, align 8, !dbg !1499
  %14 = icmp ne ptr %13, null, !dbg !1499
  %15 = zext i1 %14 to i32, !dbg !1499
  call void @_Z7_AssertiPKcS0_i(i32 noundef %15, ptr noundef @.str.19, ptr noundef @.str.2, i32 noundef 782), !dbg !1499
  %16 = load ptr, ptr %4, align 8, !dbg !1500
  store ptr %16, ptr @PlayerSegment, align 8, !dbg !1501
  %17 = load ptr, ptr %4, align 8, !dbg !1502
  %18 = icmp ne ptr %17, null, !dbg !1504
  br i1 %18, label %19, label %52, !dbg !1505

19:                                               ; preds = %2
  %20 = load ptr, ptr %6, align 8, !dbg !1506
  %21 = getelementptr inbounds nuw %struct.segment2, ptr %20, i32 0, i32 0, !dbg !1507
  %22 = load i8, ptr %21, align 4, !dbg !1507
  %23 = zext i8 %22 to i32, !dbg !1506
  %24 = icmp eq i32 %23, 1, !dbg !1508
  br i1 %24, label %25, label %52, !dbg !1505

25:                                               ; preds = %19
    #dbg_declare(ptr %7, !1509, !DIExpression(), !1511)
  call void @_Z31detect_escort_goal_accomplishedi(i32 noundef -4), !dbg !1512
  %26 = load i32, ptr %5, align 4, !dbg !1513
  %27 = icmp sle i32 %26, 0, !dbg !1515
  br i1 %27, label %28, label %29, !dbg !1515

28:                                               ; preds = %25
  store i32 0, ptr %3, align 4, !dbg !1516
  br label %53, !dbg !1516

29:                                               ; preds = %25
  %30 = load i32, ptr @FrameTime, align 4, !dbg !1518
  %31 = load i32, ptr @Fuelcen_give_amount, align 4, !dbg !1519
  %32 = call noundef i32 @_Z6fixmulii(i32 noundef %30, i32 noundef %31), !dbg !1520
  store i32 %32, ptr %7, align 4, !dbg !1521
  %33 = load i32, ptr %7, align 4, !dbg !1522
  %34 = load i32, ptr %5, align 4, !dbg !1524
  %35 = icmp sgt i32 %33, %34, !dbg !1525
  br i1 %35, label %36, label %38, !dbg !1525

36:                                               ; preds = %29
  %37 = load i32, ptr %5, align 4, !dbg !1526
  store i32 %37, ptr %7, align 4, !dbg !1527
  br label %38, !dbg !1528

38:                                               ; preds = %36, %29
  %39 = load i32, ptr @_ZZ17fuelcen_give_fuelP7segmentiE14last_play_time, align 4, !dbg !1529
  %40 = load i32, ptr @GameTime, align 4, !dbg !1531
  %41 = icmp sgt i32 %39, %40, !dbg !1532
  br i1 %41, label %42, label %43, !dbg !1532

42:                                               ; preds = %38
  store i32 0, ptr @_ZZ17fuelcen_give_fuelP7segmentiE14last_play_time, align 4, !dbg !1533
  br label %43, !dbg !1534

43:                                               ; preds = %42, %38
  %44 = load i32, ptr @GameTime, align 4, !dbg !1535
  %45 = load i32, ptr @_ZZ17fuelcen_give_fuelP7segmentiE14last_play_time, align 4, !dbg !1537
  %46 = add nsw i32 %45, 16384, !dbg !1538
  %47 = icmp sgt i32 %44, %46, !dbg !1539
  br i1 %47, label %48, label %50, !dbg !1539

48:                                               ; preds = %43
  call void @_Z16digi_play_sampleii(i32 noundef 62, i32 noundef 32768), !dbg !1540
  %49 = load i32, ptr @GameTime, align 4, !dbg !1542
  store i32 %49, ptr @_ZZ17fuelcen_give_fuelP7segmentiE14last_play_time, align 4, !dbg !1543
  br label %50, !dbg !1544

50:                                               ; preds = %48, %43
  %51 = load i32, ptr %7, align 4, !dbg !1545
  store i32 %51, ptr %3, align 4, !dbg !1546
  br label %53, !dbg !1546

52:                                               ; preds = %19, %2
  store i32 0, ptr %3, align 4, !dbg !1547
  br label %53, !dbg !1547

53:                                               ; preds = %52, %50, %28
  %54 = load i32, ptr %3, align 4, !dbg !1549
  ret i32 %54, !dbg !1549
}

declare void @_Z31detect_escort_goal_accomplishedi(i32 noundef) #2

declare void @_Z16digi_play_sampleii(i32 noundef, i32 noundef) #2

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define void @_Z15disable_matcensv() #0 !dbg !1550 {
  %1 = alloca i32, align 4
    #dbg_declare(ptr %1, !1551, !DIExpression(), !1552)
  store i32 0, ptr %1, align 4, !dbg !1553
  br label %2, !dbg !1555

2:                                                ; preds = %15, %0
  %3 = load i32, ptr %1, align 4, !dbg !1556
  %4 = load i32, ptr @Num_robot_centers, align 4, !dbg !1558
  %5 = icmp slt i32 %3, %4, !dbg !1559
  br i1 %5, label %6, label %18, !dbg !1560

6:                                                ; preds = %2
  %7 = load i32, ptr %1, align 4, !dbg !1561
  %8 = sext i32 %7 to i64, !dbg !1563
  %9 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %8, !dbg !1563
  %10 = getelementptr inbounds nuw %struct.FuelCenter, ptr %9, i32 0, i32 3, !dbg !1564
  store i8 0, ptr %10, align 1, !dbg !1565
  %11 = load i32, ptr %1, align 4, !dbg !1566
  %12 = sext i32 %11 to i64, !dbg !1567
  %13 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %12, !dbg !1567
  %14 = getelementptr inbounds nuw %struct.FuelCenter, ptr %13, i32 0, i32 9, !dbg !1568
  store i32 0, ptr %14, align 4, !dbg !1569
  br label %15, !dbg !1570

15:                                               ; preds = %6
  %16 = load i32, ptr %1, align 4, !dbg !1571
  %17 = add nsw i32 %16, 1, !dbg !1571
  store i32 %17, ptr %1, align 4, !dbg !1571
  br label %2, !dbg !1572, !llvm.loop !1573

18:                                               ; preds = %2
  ret void, !dbg !1575
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z16init_all_matcensv() #1 !dbg !1576 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
    #dbg_declare(ptr %1, !1577, !DIExpression(), !1578)
  store i32 0, ptr %1, align 4, !dbg !1579
  br label %4, !dbg !1581

4:                                                ; preds = %53, %0
  %5 = load i32, ptr %1, align 4, !dbg !1582
  %6 = load i32, ptr @Num_fuelcenters, align 4, !dbg !1584
  %7 = icmp slt i32 %5, %6, !dbg !1585
  br i1 %7, label %8, label %56, !dbg !1586

8:                                                ; preds = %4
  %9 = load i32, ptr %1, align 4, !dbg !1587
  %10 = sext i32 %9 to i64, !dbg !1589
  %11 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %10, !dbg !1589
  %12 = getelementptr inbounds nuw %struct.FuelCenter, ptr %11, i32 0, i32 0, !dbg !1590
  %13 = load i32, ptr %12, align 4, !dbg !1590
  %14 = icmp eq i32 %13, 4, !dbg !1591
  br i1 %14, label %15, label %52, !dbg !1591

15:                                               ; preds = %8
  %16 = load i32, ptr %1, align 4, !dbg !1592
  %17 = sext i32 %16 to i64, !dbg !1594
  %18 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %17, !dbg !1594
  %19 = getelementptr inbounds nuw %struct.FuelCenter, ptr %18, i32 0, i32 4, !dbg !1595
  store i8 3, ptr %19, align 2, !dbg !1596
  %20 = load i32, ptr %1, align 4, !dbg !1597
  %21 = sext i32 %20 to i64, !dbg !1598
  %22 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %21, !dbg !1598
  %23 = getelementptr inbounds nuw %struct.FuelCenter, ptr %22, i32 0, i32 3, !dbg !1599
  store i8 0, ptr %23, align 1, !dbg !1600
  %24 = load i32, ptr %1, align 4, !dbg !1601
  %25 = sext i32 %24 to i64, !dbg !1602
  %26 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %25, !dbg !1602
  %27 = getelementptr inbounds nuw %struct.FuelCenter, ptr %26, i32 0, i32 9, !dbg !1603
  store i32 0, ptr %27, align 4, !dbg !1604
    #dbg_declare(ptr %2, !1605, !DIExpression(), !1607)
  store i32 0, ptr %2, align 4, !dbg !1608
  br label %28, !dbg !1610

28:                                               ; preds = %43, %15
  %29 = load i32, ptr %2, align 4, !dbg !1611
  %30 = load i32, ptr @Num_robot_centers, align 4, !dbg !1613
  %31 = icmp slt i32 %29, %30, !dbg !1614
  br i1 %31, label %32, label %46, !dbg !1615

32:                                               ; preds = %28
  %33 = load i32, ptr %2, align 4, !dbg !1616
  %34 = sext i32 %33 to i64, !dbg !1619
  %35 = getelementptr inbounds [20 x %struct.matcen_info], ptr @RobotCenters, i64 0, i64 %34, !dbg !1619
  %36 = getelementptr inbounds nuw %struct.matcen_info, ptr %35, i32 0, i32 4, !dbg !1620
  %37 = load i16, ptr %36, align 2, !dbg !1620
  %38 = sext i16 %37 to i32, !dbg !1619
  %39 = load i32, ptr %1, align 4, !dbg !1621
  %40 = icmp eq i32 %38, %39, !dbg !1622
  br i1 %40, label %41, label %42, !dbg !1622

41:                                               ; preds = %32
  br label %47, !dbg !1623

42:                                               ; preds = %32
  br label %43, !dbg !1624

43:                                               ; preds = %42
  %44 = load i32, ptr %2, align 4, !dbg !1625
  %45 = add nsw i32 %44, 1, !dbg !1625
  store i32 %45, ptr %2, align 4, !dbg !1625
  br label %28, !dbg !1626, !llvm.loop !1627

46:                                               ; preds = %28
  br label %47, !dbg !1629

47:                                               ; preds = %46, %41
  %48 = load i32, ptr %2, align 4, !dbg !1629
  %49 = load i32, ptr @Num_robot_centers, align 4, !dbg !1629
  %50 = icmp ne i32 %48, %49, !dbg !1629
  %51 = zext i1 %50 to i32, !dbg !1629
  call void @_Z7_AssertiPKcS0_i(i32 noundef %51, ptr noundef @.str.20, ptr noundef @.str.2, i32 noundef 1201), !dbg !1629
  br label %52, !dbg !1630

52:                                               ; preds = %47, %8
  br label %53, !dbg !1631

53:                                               ; preds = %52
  %54 = load i32, ptr %1, align 4, !dbg !1632
  %55 = add nsw i32 %54, 1, !dbg !1632
  store i32 %55, ptr %1, align 4, !dbg !1632
  br label %4, !dbg !1633, !llvm.loop !1634

56:                                               ; preds = %4
  store i32 0, ptr %1, align 4, !dbg !1636
  br label %57, !dbg !1638

57:                                               ; preds = %79, %56
  %58 = load i32, ptr %1, align 4, !dbg !1639
  %59 = load i32, ptr @Num_robot_centers, align 4, !dbg !1641
  %60 = icmp slt i32 %58, %59, !dbg !1642
  br i1 %60, label %61, label %82, !dbg !1643

61:                                               ; preds = %57
    #dbg_declare(ptr %3, !1644, !DIExpression(), !1646)
  %62 = load i32, ptr %1, align 4, !dbg !1647
  %63 = sext i32 %62 to i64, !dbg !1648
  %64 = getelementptr inbounds [20 x %struct.matcen_info], ptr @RobotCenters, i64 0, i64 %63, !dbg !1648
  %65 = getelementptr inbounds nuw %struct.matcen_info, ptr %64, i32 0, i32 4, !dbg !1649
  %66 = load i16, ptr %65, align 2, !dbg !1649
  %67 = sext i16 %66 to i32, !dbg !1648
  store i32 %67, ptr %3, align 4, !dbg !1646
  %68 = load i32, ptr %3, align 4, !dbg !1650
  %69 = load i32, ptr @Num_fuelcenters, align 4, !dbg !1650
  %70 = icmp slt i32 %68, %69, !dbg !1650
  %71 = zext i1 %70 to i32, !dbg !1650
  call void @_Z7_AssertiPKcS0_i(i32 noundef %71, ptr noundef @.str.21, ptr noundef @.str.2, i32 noundef 1212), !dbg !1650
  %72 = load i32, ptr %3, align 4, !dbg !1651
  %73 = sext i32 %72 to i64, !dbg !1651
  %74 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %73, !dbg !1651
  %75 = getelementptr inbounds nuw %struct.FuelCenter, ptr %74, i32 0, i32 0, !dbg !1651
  %76 = load i32, ptr %75, align 4, !dbg !1651
  %77 = icmp eq i32 %76, 4, !dbg !1651
  %78 = zext i1 %77 to i32, !dbg !1651
  call void @_Z7_AssertiPKcS0_i(i32 noundef %78, ptr noundef @.str.22, ptr noundef @.str.2, i32 noundef 1213), !dbg !1651
  br label %79, !dbg !1652

79:                                               ; preds = %61
  %80 = load i32, ptr %1, align 4, !dbg !1653
  %81 = add nsw i32 %80, 1, !dbg !1653
  store i32 %81, ptr %1, align 4, !dbg !1653
  br label %57, !dbg !1654, !llvm.loop !1655

82:                                               ; preds = %57
  ret void, !dbg !1657
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z22fuelcen_check_for_goalP7segment(ptr noundef %0) #1 !dbg !1658 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !1659, !DIExpression(), !1660)
    #dbg_declare(ptr %3, !1661, !DIExpression(), !1662)
  %4 = load ptr, ptr %2, align 8, !dbg !1663
  %5 = ptrtoint ptr %4 to i64, !dbg !1664
  %6 = sub i64 %5, ptrtoint (ptr @Segments to i64), !dbg !1664
  %7 = sdiv exact i64 %6, 512, !dbg !1664
  %8 = getelementptr inbounds [0 x %struct.segment2], ptr @Segment2s, i64 0, i64 %7, !dbg !1665
  store ptr %8, ptr %3, align 8, !dbg !1662
  %9 = load ptr, ptr %2, align 8, !dbg !1666
  %10 = icmp ne ptr %9, null, !dbg !1666
  %11 = zext i1 %10 to i32, !dbg !1666
  call void @_Z7_AssertiPKcS0_i(i32 noundef %11, ptr noundef @.str.19, ptr noundef @.str.2, i32 noundef 1224), !dbg !1666
  %12 = load i32, ptr @Game_mode, align 4, !dbg !1667
  %13 = and i32 %12, 512, !dbg !1667
  call void @_Z7_AssertiPKcS0_i(i32 noundef %13, ptr noundef @.str.23, ptr noundef @.str.2, i32 noundef 1225), !dbg !1667
  %14 = load ptr, ptr %3, align 8, !dbg !1668
  %15 = getelementptr inbounds nuw %struct.segment2, ptr %14, i32 0, i32 0, !dbg !1670
  %16 = load i8, ptr %15, align 4, !dbg !1670
  %17 = zext i8 %16 to i32, !dbg !1668
  %18 = icmp eq i32 %17, 5, !dbg !1671
  br i1 %18, label %19, label %20, !dbg !1671

19:                                               ; preds = %1
  br label %20, !dbg !1672

20:                                               ; preds = %19, %1
  %21 = load ptr, ptr %3, align 8, !dbg !1674
  %22 = getelementptr inbounds nuw %struct.segment2, ptr %21, i32 0, i32 0, !dbg !1676
  %23 = load i8, ptr %22, align 4, !dbg !1676
  %24 = zext i8 %23 to i32, !dbg !1674
  %25 = icmp eq i32 %24, 6, !dbg !1677
  br i1 %25, label %26, label %27, !dbg !1677

26:                                               ; preds = %20
  br label %27, !dbg !1678

27:                                               ; preds = %26, %20
  ret void, !dbg !1680
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z28fuelcen_check_for_hoard_goalP7segment(ptr noundef %0) #1 !dbg !1681 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !1682, !DIExpression(), !1683)
    #dbg_declare(ptr %3, !1684, !DIExpression(), !1685)
  %4 = load ptr, ptr %2, align 8, !dbg !1686
  %5 = ptrtoint ptr %4 to i64, !dbg !1687
  %6 = sub i64 %5, ptrtoint (ptr @Segments to i64), !dbg !1687
  %7 = sdiv exact i64 %6, 512, !dbg !1687
  %8 = getelementptr inbounds [0 x %struct.segment2], ptr @Segment2s, i64 0, i64 %7, !dbg !1688
  store ptr %8, ptr %3, align 8, !dbg !1685
  %9 = load ptr, ptr %2, align 8, !dbg !1689
  %10 = icmp ne ptr %9, null, !dbg !1689
  %11 = zext i1 %10 to i32, !dbg !1689
  call void @_Z7_AssertiPKcS0_i(i32 noundef %11, ptr noundef @.str.19, ptr noundef @.str.2, i32 noundef 1258), !dbg !1689
  %12 = load i32, ptr @Game_mode, align 4, !dbg !1690
  %13 = and i32 %12, 1024, !dbg !1690
  call void @_Z7_AssertiPKcS0_i(i32 noundef %13, ptr noundef @.str.24, ptr noundef @.str.2, i32 noundef 1259), !dbg !1690
  %14 = load i32, ptr @Player_is_dead, align 4, !dbg !1691
  %15 = icmp ne i32 %14, 0, !dbg !1691
  br i1 %15, label %16, label %17, !dbg !1691

16:                                               ; preds = %1
  br label %30, !dbg !1693

17:                                               ; preds = %1
  %18 = load ptr, ptr %3, align 8, !dbg !1694
  %19 = getelementptr inbounds nuw %struct.segment2, ptr %18, i32 0, i32 0, !dbg !1696
  %20 = load i8, ptr %19, align 4, !dbg !1696
  %21 = zext i8 %20 to i32, !dbg !1694
  %22 = icmp eq i32 %21, 5, !dbg !1697
  br i1 %22, label %29, label %23, !dbg !1698

23:                                               ; preds = %17
  %24 = load ptr, ptr %3, align 8, !dbg !1699
  %25 = getelementptr inbounds nuw %struct.segment2, ptr %24, i32 0, i32 0, !dbg !1700
  %26 = load i8, ptr %25, align 4, !dbg !1700
  %27 = zext i8 %26 to i32, !dbg !1699
  %28 = icmp eq i32 %27, 6, !dbg !1701
  br i1 %28, label %29, label %30, !dbg !1698

29:                                               ; preds = %23, %17
  br label %30, !dbg !1702

30:                                               ; preds = %16, %29, %23
  ret void, !dbg !1704
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z11read_matcenP11matcen_infoP7__sFILE(ptr noundef %0, ptr noundef %1) #1 !dbg !1705 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !1766, !DIExpression(), !1767)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !1768, !DIExpression(), !1769)
  %5 = load ptr, ptr %4, align 8, !dbg !1770
  %6 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %5), !dbg !1771
  %7 = load ptr, ptr %3, align 8, !dbg !1772
  %8 = getelementptr inbounds nuw %struct.matcen_info, ptr %7, i32 0, i32 0, !dbg !1773
  %9 = getelementptr inbounds [2 x i32], ptr %8, i64 0, i64 0, !dbg !1772
  store i32 %6, ptr %9, align 4, !dbg !1774
  %10 = load ptr, ptr %4, align 8, !dbg !1775
  %11 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %10), !dbg !1776
  %12 = load ptr, ptr %3, align 8, !dbg !1777
  %13 = getelementptr inbounds nuw %struct.matcen_info, ptr %12, i32 0, i32 0, !dbg !1778
  %14 = getelementptr inbounds [2 x i32], ptr %13, i64 0, i64 1, !dbg !1777
  store i32 %11, ptr %14, align 4, !dbg !1779
  %15 = load ptr, ptr %4, align 8, !dbg !1780
  %16 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %15), !dbg !1781
  %17 = load ptr, ptr %3, align 8, !dbg !1782
  %18 = getelementptr inbounds nuw %struct.matcen_info, ptr %17, i32 0, i32 1, !dbg !1783
  store i32 %16, ptr %18, align 4, !dbg !1784
  %19 = load ptr, ptr %4, align 8, !dbg !1785
  %20 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %19), !dbg !1786
  %21 = load ptr, ptr %3, align 8, !dbg !1787
  %22 = getelementptr inbounds nuw %struct.matcen_info, ptr %21, i32 0, i32 2, !dbg !1788
  store i32 %20, ptr %22, align 4, !dbg !1789
  %23 = load ptr, ptr %4, align 8, !dbg !1790
  %24 = call noundef signext i16 @_Z15file_read_shortP7__sFILE(ptr noundef %23), !dbg !1791
  %25 = load ptr, ptr %3, align 8, !dbg !1792
  %26 = getelementptr inbounds nuw %struct.matcen_info, ptr %25, i32 0, i32 3, !dbg !1793
  store i16 %24, ptr %26, align 4, !dbg !1794
  %27 = load ptr, ptr %4, align 8, !dbg !1795
  %28 = call noundef signext i16 @_Z15file_read_shortP7__sFILE(ptr noundef %27), !dbg !1796
  %29 = load ptr, ptr %3, align 8, !dbg !1797
  %30 = getelementptr inbounds nuw %struct.matcen_info, ptr %29, i32 0, i32 4, !dbg !1798
  store i16 %28, ptr %30, align 2, !dbg !1799
  ret void, !dbg !1800
}

declare noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef) #2

declare noundef signext i16 @_Z15file_read_shortP7__sFILE(ptr noundef) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z12write_matcenP11matcen_infoP7__sFILE(ptr noundef %0, ptr noundef %1) #1 !dbg !1801 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !1802, !DIExpression(), !1803)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !1804, !DIExpression(), !1805)
  %5 = load ptr, ptr %4, align 8, !dbg !1806
  %6 = load ptr, ptr %3, align 8, !dbg !1807
  %7 = getelementptr inbounds nuw %struct.matcen_info, ptr %6, i32 0, i32 0, !dbg !1808
  %8 = getelementptr inbounds [2 x i32], ptr %7, i64 0, i64 0, !dbg !1807
  %9 = load i32, ptr %8, align 4, !dbg !1807
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %5, i32 noundef %9), !dbg !1809
  %10 = load ptr, ptr %4, align 8, !dbg !1810
  %11 = load ptr, ptr %3, align 8, !dbg !1811
  %12 = getelementptr inbounds nuw %struct.matcen_info, ptr %11, i32 0, i32 0, !dbg !1812
  %13 = getelementptr inbounds [2 x i32], ptr %12, i64 0, i64 1, !dbg !1811
  %14 = load i32, ptr %13, align 4, !dbg !1811
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %10, i32 noundef %14), !dbg !1813
  %15 = load ptr, ptr %4, align 8, !dbg !1814
  %16 = load ptr, ptr %3, align 8, !dbg !1815
  %17 = getelementptr inbounds nuw %struct.matcen_info, ptr %16, i32 0, i32 1, !dbg !1816
  %18 = load i32, ptr %17, align 4, !dbg !1816
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %15, i32 noundef %18), !dbg !1817
  %19 = load ptr, ptr %4, align 8, !dbg !1818
  %20 = load ptr, ptr %3, align 8, !dbg !1819
  %21 = getelementptr inbounds nuw %struct.matcen_info, ptr %20, i32 0, i32 2, !dbg !1820
  %22 = load i32, ptr %21, align 4, !dbg !1820
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %19, i32 noundef %22), !dbg !1821
  %23 = load ptr, ptr %4, align 8, !dbg !1822
  %24 = load ptr, ptr %3, align 8, !dbg !1823
  %25 = getelementptr inbounds nuw %struct.matcen_info, ptr %24, i32 0, i32 3, !dbg !1824
  %26 = load i16, ptr %25, align 4, !dbg !1824
  call void @_Z16file_write_shortP7__sFILEs(ptr noundef %23, i16 noundef signext %26), !dbg !1825
  %27 = load ptr, ptr %4, align 8, !dbg !1826
  %28 = load ptr, ptr %3, align 8, !dbg !1827
  %29 = getelementptr inbounds nuw %struct.matcen_info, ptr %28, i32 0, i32 4, !dbg !1828
  %30 = load i16, ptr %29, align 2, !dbg !1828
  call void @_Z16file_write_shortP7__sFILEs(ptr noundef %27, i16 noundef signext %30), !dbg !1829
  ret void, !dbg !1830
}

declare void @_Z14file_write_intP7__sFILEi(ptr noundef, i32 noundef) #2

declare void @_Z16file_write_shortP7__sFILEs(ptr noundef, i16 noundef signext) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z12read_fuelcenP10FuelCenterP7__sFILE(ptr noundef %0, ptr noundef %1) #1 !dbg !1831 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !1834, !DIExpression(), !1835)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !1836, !DIExpression(), !1837)
  %5 = load ptr, ptr %4, align 8, !dbg !1838
  %6 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %5), !dbg !1839
  %7 = load ptr, ptr %3, align 8, !dbg !1840
  %8 = getelementptr inbounds nuw %struct.FuelCenter, ptr %7, i32 0, i32 0, !dbg !1841
  store i32 %6, ptr %8, align 4, !dbg !1842
  %9 = load ptr, ptr %4, align 8, !dbg !1843
  %10 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %9), !dbg !1844
  %11 = load ptr, ptr %3, align 8, !dbg !1845
  %12 = getelementptr inbounds nuw %struct.FuelCenter, ptr %11, i32 0, i32 1, !dbg !1846
  store i32 %10, ptr %12, align 4, !dbg !1847
  %13 = load ptr, ptr %4, align 8, !dbg !1848
  %14 = call noundef zeroext i8 @_Z14file_read_byteP7__sFILE(ptr noundef %13), !dbg !1849
  %15 = load ptr, ptr %3, align 8, !dbg !1850
  %16 = getelementptr inbounds nuw %struct.FuelCenter, ptr %15, i32 0, i32 2, !dbg !1851
  store i8 %14, ptr %16, align 4, !dbg !1852
  %17 = load ptr, ptr %4, align 8, !dbg !1853
  %18 = call noundef zeroext i8 @_Z14file_read_byteP7__sFILE(ptr noundef %17), !dbg !1854
  %19 = load ptr, ptr %3, align 8, !dbg !1855
  %20 = getelementptr inbounds nuw %struct.FuelCenter, ptr %19, i32 0, i32 3, !dbg !1856
  store i8 %18, ptr %20, align 1, !dbg !1857
  %21 = load ptr, ptr %4, align 8, !dbg !1858
  %22 = call noundef zeroext i8 @_Z14file_read_byteP7__sFILE(ptr noundef %21), !dbg !1859
  %23 = load ptr, ptr %3, align 8, !dbg !1860
  %24 = getelementptr inbounds nuw %struct.FuelCenter, ptr %23, i32 0, i32 4, !dbg !1861
  store i8 %22, ptr %24, align 2, !dbg !1862
  %25 = load ptr, ptr %4, align 8, !dbg !1863
  %26 = call noundef zeroext i8 @_Z14file_read_byteP7__sFILE(ptr noundef %25), !dbg !1864
  %27 = load ptr, ptr %3, align 8, !dbg !1865
  %28 = getelementptr inbounds nuw %struct.FuelCenter, ptr %27, i32 0, i32 5, !dbg !1866
  store i8 %26, ptr %28, align 1, !dbg !1867
  %29 = load ptr, ptr %4, align 8, !dbg !1868
  %30 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %29), !dbg !1869
  %31 = load ptr, ptr %3, align 8, !dbg !1870
  %32 = getelementptr inbounds nuw %struct.FuelCenter, ptr %31, i32 0, i32 6, !dbg !1871
  store i32 %30, ptr %32, align 4, !dbg !1872
  %33 = load ptr, ptr %4, align 8, !dbg !1873
  %34 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %33), !dbg !1874
  %35 = load ptr, ptr %3, align 8, !dbg !1875
  %36 = getelementptr inbounds nuw %struct.FuelCenter, ptr %35, i32 0, i32 7, !dbg !1876
  store i32 %34, ptr %36, align 4, !dbg !1877
  %37 = load ptr, ptr %4, align 8, !dbg !1878
  %38 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %37), !dbg !1879
  %39 = load ptr, ptr %3, align 8, !dbg !1880
  %40 = getelementptr inbounds nuw %struct.FuelCenter, ptr %39, i32 0, i32 8, !dbg !1881
  store i32 %38, ptr %40, align 4, !dbg !1882
  %41 = load ptr, ptr %4, align 8, !dbg !1883
  %42 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %41), !dbg !1884
  %43 = load ptr, ptr %3, align 8, !dbg !1885
  %44 = getelementptr inbounds nuw %struct.FuelCenter, ptr %43, i32 0, i32 9, !dbg !1886
  store i32 %42, ptr %44, align 4, !dbg !1887
  %45 = load ptr, ptr %4, align 8, !dbg !1888
  %46 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %45), !dbg !1889
  %47 = load ptr, ptr %3, align 8, !dbg !1890
  %48 = getelementptr inbounds nuw %struct.FuelCenter, ptr %47, i32 0, i32 10, !dbg !1891
  %49 = getelementptr inbounds nuw %struct.vms_vector, ptr %48, i32 0, i32 0, !dbg !1892
  store i32 %46, ptr %49, align 4, !dbg !1893
  %50 = load ptr, ptr %4, align 8, !dbg !1894
  %51 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %50), !dbg !1895
  %52 = load ptr, ptr %3, align 8, !dbg !1896
  %53 = getelementptr inbounds nuw %struct.FuelCenter, ptr %52, i32 0, i32 10, !dbg !1897
  %54 = getelementptr inbounds nuw %struct.vms_vector, ptr %53, i32 0, i32 1, !dbg !1898
  store i32 %51, ptr %54, align 4, !dbg !1899
  %55 = load ptr, ptr %4, align 8, !dbg !1900
  %56 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %55), !dbg !1901
  %57 = load ptr, ptr %3, align 8, !dbg !1902
  %58 = getelementptr inbounds nuw %struct.FuelCenter, ptr %57, i32 0, i32 10, !dbg !1903
  %59 = getelementptr inbounds nuw %struct.vms_vector, ptr %58, i32 0, i32 2, !dbg !1904
  store i32 %56, ptr %59, align 4, !dbg !1905
  ret void, !dbg !1906
}

declare noundef zeroext i8 @_Z14file_read_byteP7__sFILE(ptr noundef) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z13write_fuelcenP10FuelCenterP7__sFILE(ptr noundef %0, ptr noundef %1) #1 !dbg !1907 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !1908, !DIExpression(), !1909)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !1910, !DIExpression(), !1911)
  %5 = load ptr, ptr %4, align 8, !dbg !1912
  %6 = load ptr, ptr %3, align 8, !dbg !1913
  %7 = getelementptr inbounds nuw %struct.FuelCenter, ptr %6, i32 0, i32 0, !dbg !1914
  %8 = load i32, ptr %7, align 4, !dbg !1914
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %5, i32 noundef %8), !dbg !1915
  %9 = load ptr, ptr %4, align 8, !dbg !1916
  %10 = load ptr, ptr %3, align 8, !dbg !1917
  %11 = getelementptr inbounds nuw %struct.FuelCenter, ptr %10, i32 0, i32 1, !dbg !1918
  %12 = load i32, ptr %11, align 4, !dbg !1918
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %9, i32 noundef %12), !dbg !1919
  %13 = load ptr, ptr %4, align 8, !dbg !1920
  %14 = load ptr, ptr %3, align 8, !dbg !1921
  %15 = getelementptr inbounds nuw %struct.FuelCenter, ptr %14, i32 0, i32 2, !dbg !1922
  %16 = load i8, ptr %15, align 4, !dbg !1922
  call void @_Z15file_write_byteP7__sFILEh(ptr noundef %13, i8 noundef zeroext %16), !dbg !1923
  %17 = load ptr, ptr %4, align 8, !dbg !1924
  %18 = load ptr, ptr %3, align 8, !dbg !1925
  %19 = getelementptr inbounds nuw %struct.FuelCenter, ptr %18, i32 0, i32 3, !dbg !1926
  %20 = load i8, ptr %19, align 1, !dbg !1926
  call void @_Z15file_write_byteP7__sFILEh(ptr noundef %17, i8 noundef zeroext %20), !dbg !1927
  %21 = load ptr, ptr %4, align 8, !dbg !1928
  %22 = load ptr, ptr %3, align 8, !dbg !1929
  %23 = getelementptr inbounds nuw %struct.FuelCenter, ptr %22, i32 0, i32 4, !dbg !1930
  %24 = load i8, ptr %23, align 2, !dbg !1930
  call void @_Z15file_write_byteP7__sFILEh(ptr noundef %21, i8 noundef zeroext %24), !dbg !1931
  %25 = load ptr, ptr %4, align 8, !dbg !1932
  %26 = load ptr, ptr %3, align 8, !dbg !1933
  %27 = getelementptr inbounds nuw %struct.FuelCenter, ptr %26, i32 0, i32 5, !dbg !1934
  %28 = load i8, ptr %27, align 1, !dbg !1934
  call void @_Z15file_write_byteP7__sFILEh(ptr noundef %25, i8 noundef zeroext %28), !dbg !1935
  %29 = load ptr, ptr %4, align 8, !dbg !1936
  %30 = load ptr, ptr %3, align 8, !dbg !1937
  %31 = getelementptr inbounds nuw %struct.FuelCenter, ptr %30, i32 0, i32 6, !dbg !1938
  %32 = load i32, ptr %31, align 4, !dbg !1938
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %29, i32 noundef %32), !dbg !1939
  %33 = load ptr, ptr %4, align 8, !dbg !1940
  %34 = load ptr, ptr %3, align 8, !dbg !1941
  %35 = getelementptr inbounds nuw %struct.FuelCenter, ptr %34, i32 0, i32 7, !dbg !1942
  %36 = load i32, ptr %35, align 4, !dbg !1942
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %33, i32 noundef %36), !dbg !1943
  %37 = load ptr, ptr %4, align 8, !dbg !1944
  %38 = load ptr, ptr %3, align 8, !dbg !1945
  %39 = getelementptr inbounds nuw %struct.FuelCenter, ptr %38, i32 0, i32 8, !dbg !1946
  %40 = load i32, ptr %39, align 4, !dbg !1946
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %37, i32 noundef %40), !dbg !1947
  %41 = load ptr, ptr %4, align 8, !dbg !1948
  %42 = load ptr, ptr %3, align 8, !dbg !1949
  %43 = getelementptr inbounds nuw %struct.FuelCenter, ptr %42, i32 0, i32 9, !dbg !1950
  %44 = load i32, ptr %43, align 4, !dbg !1950
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %41, i32 noundef %44), !dbg !1951
  %45 = load ptr, ptr %4, align 8, !dbg !1952
  %46 = load ptr, ptr %3, align 8, !dbg !1953
  %47 = getelementptr inbounds nuw %struct.FuelCenter, ptr %46, i32 0, i32 10, !dbg !1954
  %48 = getelementptr inbounds nuw %struct.vms_vector, ptr %47, i32 0, i32 0, !dbg !1955
  %49 = load i32, ptr %48, align 4, !dbg !1955
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %45, i32 noundef %49), !dbg !1956
  %50 = load ptr, ptr %4, align 8, !dbg !1957
  %51 = load ptr, ptr %3, align 8, !dbg !1958
  %52 = getelementptr inbounds nuw %struct.FuelCenter, ptr %51, i32 0, i32 10, !dbg !1959
  %53 = getelementptr inbounds nuw %struct.vms_vector, ptr %52, i32 0, i32 1, !dbg !1960
  %54 = load i32, ptr %53, align 4, !dbg !1960
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %50, i32 noundef %54), !dbg !1961
  %55 = load ptr, ptr %4, align 8, !dbg !1962
  %56 = load ptr, ptr %3, align 8, !dbg !1963
  %57 = getelementptr inbounds nuw %struct.FuelCenter, ptr %56, i32 0, i32 10, !dbg !1964
  %58 = getelementptr inbounds nuw %struct.vms_vector, ptr %57, i32 0, i32 2, !dbg !1965
  %59 = load i32, ptr %58, align 4, !dbg !1965
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %55, i32 noundef %59), !dbg !1966
  ret void, !dbg !1967
}

declare void @_Z15file_write_byteP7__sFILEh(ptr noundef, i8 noundef zeroext) #2

attributes #0 = { mustprogress noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { mustprogress noinline ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #2 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

!llvm.module.flags = !{!334, !335, !336, !337, !338, !339, !340}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!341}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "Fuelcen_refill_speed", scope: !2, file: !15, line: 54, type: !16, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !3, producer: "Homebrew clang version 20.1.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !12, imports: !241, splitDebugInlining: false, nameTableKind: Apple, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk", sdk: "MacOSX15.sdk")
!3 = !DIFile(filename: "/Users/richard/code/ChocolateDescent/main_d2/fuelcen.cpp", directory: "/Users/richard/code/ChocolateDescent/build-c-ref", checksumkind: CSK_MD5, checksum: "5ee8c9aee80dcb6228b2039717465d28")
!4 = !{!5, !6, !9}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !7, line: 30, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int8_t.h", directory: "", checksumkind: CSK_MD5, checksum: "5052dfe782b50fed2355b8f61a9e4fa9")
!8 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !10, line: 30, baseType: !11)
!10 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int64_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e6d85c1a9e23dbf7518ce3b162aac800")
!11 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!12 = !{!0, !13, !20, !22, !24, !42, !44, !70, !72, !113, !120, !125, !130, !135, !140, !142, !147, !152, !157, !162, !167, !172, !174, !176, !178, !183, !188, !193, !198, !203, !208, !214, !219, !224, !229, !234, !236, !238}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "Fuelcen_give_amount", scope: !2, file: !15, line: 55, type: !16, isLocal: false, isDefinition: true)
!15 = !DIFile(filename: "main_d2/fuelcen.cpp", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "5ee8c9aee80dcb6228b2039717465d28")
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "fix", file: !17, line: 20, baseType: !18)
!17 = !DIFile(filename: "./fix/fix.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "c5006a11bf8b4cb7d963898499eda13a")
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !19, line: 30, baseType: !5)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int32_t.h", directory: "", checksumkind: CSK_MD5, checksum: "d23e8406e80ee79983f28509c741fa17")
!20 = !DIGlobalVariableExpression(var: !21, expr: !DIExpression())
!21 = distinct !DIGlobalVariable(name: "Fuelcen_max_amount", scope: !2, file: !15, line: 56, type: !16, isLocal: false, isDefinition: true)
!22 = !DIGlobalVariableExpression(var: !23, expr: !DIExpression())
!23 = distinct !DIGlobalVariable(name: "EnergyToCreateOneRobot", scope: !2, file: !15, line: 60, type: !16, isLocal: false, isDefinition: true)
!24 = !DIGlobalVariableExpression(var: !25, expr: !DIExpression())
!25 = distinct !DIGlobalVariable(name: "RobotCenters", scope: !2, file: !15, line: 65, type: !26, isLocal: false, isDefinition: true)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 3200, elements: !40)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "matcen_info", file: !28, line: 117, baseType: !29)
!28 = !DIFile(filename: "main_d2/fuelcen.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "8ae6b7177fad5b3c733b361bc7aef356")
!29 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "matcen_info", file: !28, line: 110, size: 160, flags: DIFlagTypePassByValue, elements: !30, identifier: "_ZTS11matcen_info")
!30 = !{!31, !35, !36, !37, !39}
!31 = !DIDerivedType(tag: DW_TAG_member, name: "robot_flags", scope: !29, file: !28, line: 112, baseType: !32, size: 64)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 64, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 2)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "hit_points", scope: !29, file: !28, line: 113, baseType: !16, size: 32, offset: 64)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "interval", scope: !29, file: !28, line: 114, baseType: !16, size: 32, offset: 96)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "segnum", scope: !29, file: !28, line: 115, baseType: !38, size: 16, offset: 128)
!38 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "fuelcen_num", scope: !29, file: !28, line: 116, baseType: !38, size: 16, offset: 144)
!40 = !{!41}
!41 = !DISubrange(count: 20)
!42 = !DIGlobalVariableExpression(var: !43, expr: !DIExpression())
!43 = distinct !DIGlobalVariable(name: "Num_robot_centers", scope: !2, file: !15, line: 66, type: !5, isLocal: false, isDefinition: true)
!44 = !DIGlobalVariableExpression(var: !45, expr: !DIExpression())
!45 = distinct !DIGlobalVariable(name: "Station", scope: !2, file: !15, line: 68, type: !46, isLocal: false, isDefinition: true)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !47, size: 22400, elements: !68)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "FuelCenter", file: !28, line: 103, baseType: !48)
!48 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "FuelCenter", file: !28, line: 88, size: 320, flags: DIFlagTypePassByValue, elements: !49, identifier: "_ZTS10FuelCenter")
!49 = !{!50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60}
!50 = !DIDerivedType(tag: DW_TAG_member, name: "Type", scope: !48, file: !28, line: 90, baseType: !5, size: 32)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "segnum", scope: !48, file: !28, line: 91, baseType: !5, size: 32, offset: 32)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "Flag", scope: !48, file: !28, line: 92, baseType: !6, size: 8, offset: 64)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "Enabled", scope: !48, file: !28, line: 93, baseType: !6, size: 8, offset: 72)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "Lives", scope: !48, file: !28, line: 94, baseType: !6, size: 8, offset: 80)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "dum1", scope: !48, file: !28, line: 95, baseType: !6, size: 8, offset: 88)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "Capacity", scope: !48, file: !28, line: 96, baseType: !16, size: 32, offset: 96)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "MaxCapacity", scope: !48, file: !28, line: 97, baseType: !16, size: 32, offset: 128)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "Timer", scope: !48, file: !28, line: 98, baseType: !16, size: 32, offset: 160)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "Disable_time", scope: !48, file: !28, line: 99, baseType: !16, size: 32, offset: 192)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "Center", scope: !48, file: !28, line: 102, baseType: !61, size: 96, offset: 224)
!61 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_vector", file: !62, line: 22, baseType: !63)
!62 = !DIFile(filename: "./vecmat/vecmat.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "dfa84e3325c1ea4f5f74699fff5ef2bf")
!63 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_vector", file: !62, line: 19, size: 96, flags: DIFlagTypePassByValue, elements: !64, identifier: "_ZTS10vms_vector")
!64 = !{!65, !66, !67}
!65 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !63, file: !62, line: 21, baseType: !16, size: 32)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !63, file: !62, line: 21, baseType: !16, size: 32, offset: 32)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !63, file: !62, line: 21, baseType: !16, size: 32, offset: 64)
!68 = !{!69}
!69 = !DISubrange(count: 70)
!70 = !DIGlobalVariableExpression(var: !71, expr: !DIExpression())
!71 = distinct !DIGlobalVariable(name: "Num_fuelcenters", scope: !2, file: !15, line: 69, type: !5, isLocal: false, isDefinition: true)
!72 = !DIGlobalVariableExpression(var: !73, expr: !DIExpression())
!73 = distinct !DIGlobalVariable(name: "PlayerSegment", scope: !2, file: !15, line: 71, type: !74, isLocal: false, isDefinition: true)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_typedef, name: "segment", file: !76, line: 123, baseType: !77)
!76 = !DIFile(filename: "main_d2/segment.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "c950815a9b07e6bab2fa2587b90affec")
!77 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "segment", file: !76, line: 100, size: 4096, flags: DIFlagTypePassByValue, elements: !78, identifier: "_ZTS7segment")
!78 = !{!79, !106, !108, !112}
!79 = !DIDerivedType(tag: DW_TAG_member, name: "sides", scope: !77, file: !76, line: 105, baseType: !80, size: 3840)
!80 = !DICompositeType(tag: DW_TAG_array_type, baseType: !81, size: 3840, elements: !104)
!81 = !DIDerivedType(tag: DW_TAG_typedef, name: "side", file: !76, line: 91, baseType: !82)
!82 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "side", file: !76, line: 82, size: 640, flags: DIFlagTypePassByValue, elements: !83, identifier: "_ZTS4side")
!83 = !{!84, !85, !89, !90, !91, !92, !102}
!84 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !82, file: !76, line: 84, baseType: !6, size: 8)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "pad", scope: !82, file: !76, line: 85, baseType: !86, size: 8, offset: 8)
!86 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !87, line: 31, baseType: !88)
!87 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint8_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8b64ccf8c67b8c006b07b8daf1b49be5")
!88 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "wall_num", scope: !82, file: !76, line: 86, baseType: !38, size: 16, offset: 16)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_num", scope: !82, file: !76, line: 87, baseType: !38, size: 16, offset: 32)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_num2", scope: !82, file: !76, line: 88, baseType: !38, size: 16, offset: 48)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "uvls", scope: !82, file: !76, line: 89, baseType: !93, size: 384, offset: 64)
!93 = !DICompositeType(tag: DW_TAG_array_type, baseType: !94, size: 384, elements: !100)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "uvl", file: !76, line: 67, baseType: !95)
!95 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uvl", file: !76, line: 64, size: 96, flags: DIFlagTypePassByValue, elements: !96, identifier: "_ZTS3uvl")
!96 = !{!97, !98, !99}
!97 = !DIDerivedType(tag: DW_TAG_member, name: "u", scope: !95, file: !76, line: 66, baseType: !16, size: 32)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "v", scope: !95, file: !76, line: 66, baseType: !16, size: 32, offset: 32)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "l", scope: !95, file: !76, line: 66, baseType: !16, size: 32, offset: 64)
!100 = !{!101}
!101 = !DISubrange(count: 4)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "normals", scope: !82, file: !76, line: 90, baseType: !103, size: 192, offset: 448)
!103 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 192, elements: !33)
!104 = !{!105}
!105 = !DISubrange(count: 6)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "children", scope: !77, file: !76, line: 106, baseType: !107, size: 96, offset: 3840)
!107 = !DICompositeType(tag: DW_TAG_array_type, baseType: !38, size: 96, elements: !104)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "verts", scope: !77, file: !76, line: 107, baseType: !109, size: 128, offset: 3936)
!109 = !DICompositeType(tag: DW_TAG_array_type, baseType: !38, size: 128, elements: !110)
!110 = !{!111}
!111 = !DISubrange(count: 8)
!112 = !DIDerivedType(tag: DW_TAG_member, name: "objects", scope: !77, file: !76, line: 112, baseType: !5, size: 32, offset: 4064)
!113 = !DIGlobalVariableExpression(var: !114, expr: !DIExpression())
!114 = distinct !DIGlobalVariable(scope: null, file: !15, line: 185, type: !115, isLocal: true, isDefinition: true)
!115 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 304, elements: !118)
!116 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !117)
!117 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!118 = !{!119}
!119 = !DISubrange(count: 38)
!120 = !DIGlobalVariableExpression(var: !121, expr: !DIExpression())
!121 = distinct !DIGlobalVariable(scope: null, file: !15, line: 188, type: !122, isLocal: true, isDefinition: true)
!122 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 128, elements: !123)
!123 = !{!124}
!124 = !DISubrange(count: 16)
!125 = !DIGlobalVariableExpression(var: !126, expr: !DIExpression())
!126 = distinct !DIGlobalVariable(scope: null, file: !15, line: 188, type: !127, isLocal: true, isDefinition: true)
!127 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 456, elements: !128)
!128 = !{!129}
!129 = !DISubrange(count: 57)
!130 = !DIGlobalVariableExpression(var: !131, expr: !DIExpression())
!131 = distinct !DIGlobalVariable(scope: null, file: !15, line: 191, type: !132, isLocal: true, isDefinition: true)
!132 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 280, elements: !133)
!133 = !{!134}
!134 = !DISubrange(count: 35)
!135 = !DIGlobalVariableExpression(var: !136, expr: !DIExpression())
!136 = distinct !DIGlobalVariable(scope: null, file: !15, line: 192, type: !137, isLocal: true, isDefinition: true)
!137 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 168, elements: !138)
!138 = !{!139}
!139 = !DISubrange(count: 21)
!140 = !DIGlobalVariableExpression(var: !141, expr: !DIExpression())
!141 = distinct !DIGlobalVariable(scope: null, file: !15, line: 281, type: !115, isLocal: true, isDefinition: true)
!142 = !DIGlobalVariableExpression(var: !143, expr: !DIExpression())
!143 = distinct !DIGlobalVariable(scope: null, file: !15, line: 362, type: !144, isLocal: true, isDefinition: true)
!144 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 224, elements: !145)
!145 = !{!146}
!146 = !DISubrange(count: 28)
!147 = !DIGlobalVariableExpression(var: !148, expr: !DIExpression())
!148 = distinct !DIGlobalVariable(scope: null, file: !15, line: 364, type: !149, isLocal: true, isDefinition: true)
!149 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 320, elements: !150)
!150 = !{!151}
!151 = !DISubrange(count: 40)
!152 = !DIGlobalVariableExpression(var: !153, expr: !DIExpression())
!153 = distinct !DIGlobalVariable(scope: null, file: !15, line: 365, type: !154, isLocal: true, isDefinition: true)
!154 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 288, elements: !155)
!155 = !{!156}
!156 = !DISubrange(count: 36)
!157 = !DIGlobalVariableExpression(var: !158, expr: !DIExpression())
!158 = distinct !DIGlobalVariable(scope: null, file: !15, line: 366, type: !159, isLocal: true, isDefinition: true)
!159 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 584, elements: !160)
!160 = !{!161}
!161 = !DISubrange(count: 73)
!162 = !DIGlobalVariableExpression(var: !163, expr: !DIExpression())
!163 = distinct !DIGlobalVariable(scope: null, file: !15, line: 395, type: !164, isLocal: true, isDefinition: true)
!164 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 336, elements: !165)
!165 = !{!166}
!166 = !DISubrange(count: 42)
!167 = !DIGlobalVariableExpression(var: !168, expr: !DIExpression())
!168 = distinct !DIGlobalVariable(scope: null, file: !15, line: 466, type: !169, isLocal: true, isDefinition: true)
!169 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 352, elements: !170)
!170 = !{!171}
!171 = !DISubrange(count: 44)
!172 = !DIGlobalVariableExpression(var: !173, expr: !DIExpression())
!173 = distinct !DIGlobalVariable(name: "Num_extry_robots", scope: !2, file: !15, line: 498, type: !5, isLocal: false, isDefinition: true)
!174 = !DIGlobalVariableExpression(var: !175, expr: !DIExpression())
!175 = distinct !DIGlobalVariable(name: "FrameCount_last_msg", scope: !2, file: !15, line: 501, type: !5, isLocal: false, isDefinition: true)
!176 = !DIGlobalVariableExpression(var: !177, expr: !DIExpression())
!177 = distinct !DIGlobalVariable(scope: null, file: !15, line: 522, type: !127, isLocal: true, isDefinition: true)
!178 = !DIGlobalVariableExpression(var: !179, expr: !DIExpression())
!179 = distinct !DIGlobalVariable(scope: null, file: !15, line: 551, type: !180, isLocal: true, isDefinition: true)
!180 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 248, elements: !181)
!181 = !{!182}
!182 = !DISubrange(count: 31)
!183 = !DIGlobalVariableExpression(var: !184, expr: !DIExpression())
!184 = distinct !DIGlobalVariable(scope: null, file: !15, line: 566, type: !185, isLocal: true, isDefinition: true)
!185 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 272, elements: !186)
!186 = !{!187}
!187 = !DISubrange(count: 34)
!188 = !DIGlobalVariableExpression(var: !189, expr: !DIExpression())
!189 = distinct !DIGlobalVariable(scope: null, file: !15, line: 609, type: !190, isLocal: true, isDefinition: true)
!190 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 448, elements: !191)
!191 = !{!192}
!192 = !DISubrange(count: 56)
!193 = !DIGlobalVariableExpression(var: !194, expr: !DIExpression())
!194 = distinct !DIGlobalVariable(scope: null, file: !15, line: 622, type: !195, isLocal: true, isDefinition: true)
!195 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 312, elements: !196)
!196 = !{!197}
!197 = !DISubrange(count: 39)
!198 = !DIGlobalVariableExpression(var: !199, expr: !DIExpression())
!199 = distinct !DIGlobalVariable(scope: null, file: !15, line: 694, type: !200, isLocal: true, isDefinition: true)
!200 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 392, elements: !201)
!201 = !{!202}
!202 = !DISubrange(count: 49)
!203 = !DIGlobalVariableExpression(var: !204, expr: !DIExpression())
!204 = distinct !DIGlobalVariable(scope: null, file: !15, line: 714, type: !205, isLocal: true, isDefinition: true)
!205 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 496, elements: !206)
!206 = !{!207}
!207 = !DISubrange(count: 62)
!208 = !DIGlobalVariableExpression(var: !209, expr: !DIExpression())
!209 = distinct !DIGlobalVariable(name: "last_play_time", scope: !210, file: !15, line: 780, type: !16, isLocal: true, isDefinition: true)
!210 = distinct !DISubprogram(name: "fuelcen_give_fuel", linkageName: "_Z17fuelcen_give_fuelP7segmenti", scope: !15, file: !15, line: 776, type: !211, scopeLine: 777, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !213)
!211 = !DISubroutineType(types: !212)
!212 = !{!16, !74, !16}
!213 = !{}
!214 = !DIGlobalVariableExpression(var: !215, expr: !DIExpression())
!215 = distinct !DIGlobalVariable(scope: null, file: !15, line: 782, type: !216, isLocal: true, isDefinition: true)
!216 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 104, elements: !217)
!217 = !{!218}
!218 = !DISubrange(count: 13)
!219 = !DIGlobalVariableExpression(var: !220, expr: !DIExpression())
!220 = distinct !DIGlobalVariable(scope: null, file: !15, line: 1201, type: !221, isLocal: true, isDefinition: true)
!221 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 184, elements: !222)
!222 = !{!223}
!223 = !DISubrange(count: 23)
!224 = !DIGlobalVariableExpression(var: !225, expr: !DIExpression())
!225 = distinct !DIGlobalVariable(scope: null, file: !15, line: 1212, type: !226, isLocal: true, isDefinition: true)
!226 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 240, elements: !227)
!227 = !{!228}
!228 = !DISubrange(count: 30)
!229 = !DIGlobalVariableExpression(var: !230, expr: !DIExpression())
!230 = distinct !DIGlobalVariable(scope: null, file: !15, line: 1213, type: !231, isLocal: true, isDefinition: true)
!231 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 408, elements: !232)
!232 = !{!233}
!233 = !DISubrange(count: 51)
!234 = !DIGlobalVariableExpression(var: !235, expr: !DIExpression())
!235 = distinct !DIGlobalVariable(scope: null, file: !15, line: 1225, type: !221, isLocal: true, isDefinition: true)
!236 = !DIGlobalVariableExpression(var: !237, expr: !DIExpression())
!237 = distinct !DIGlobalVariable(scope: null, file: !15, line: 1259, type: !137, isLocal: true, isDefinition: true)
!238 = !DIGlobalVariableExpression(var: !239, expr: !DIExpression(DW_OP_constu, 16, DW_OP_stack_value))
!239 = distinct !DIGlobalVariable(name: "FRACBITS", scope: !2, file: !17, line: 18, type: !240, isLocal: true, isDefinition: true)
!240 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !5)
!241 = !{!242, !246, !249, !250, !251, !252, !256, !260, !264, !267, !269, !271, !273, !275, !277, !279, !281, !283, !285, !287, !289, !291, !293, !295, !297, !303, !307, !310, !313, !322, !324, !326, !328}
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !243, entity: !6, file: !245, line: 158)
!243 = !DINamespace(name: "__1", scope: !244, exportSymbols: true)
!244 = !DINamespace(name: "std", scope: null)
!245 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdint", directory: "")
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !243, entity: !247, file: !245, line: 159)
!247 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !248, line: 30, baseType: !38)
!248 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int16_t.h", directory: "", checksumkind: CSK_MD5, checksum: "47ed3c3ac6f65bfec021ca2b7be18e7e")
!249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !243, entity: !18, file: !245, line: 160)
!250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !243, entity: !9, file: !245, line: 161)
!251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !243, entity: !86, file: !245, line: 163)
!252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !243, entity: !253, file: !245, line: 164)
!253 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !254, line: 31, baseType: !255)
!254 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint16_t.h", directory: "", checksumkind: CSK_MD5, checksum: "f0aa926da906b10566dd3171bf347ab7")
!255 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !243, entity: !257, file: !245, line: 165)
!257 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !258, line: 31, baseType: !259)
!258 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint32_t.h", directory: "", checksumkind: CSK_MD5, checksum: "0254eb80c6b9719ac45c3c1cf872109b")
!259 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !243, entity: !261, file: !245, line: 166)
!261 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !262, line: 31, baseType: !263)
!262 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint64_t.h", directory: "", checksumkind: CSK_MD5, checksum: "77fc5e91653260959605f129691cf9b1")
!263 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !243, entity: !265, file: !245, line: 168)
!265 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !266, line: 29, baseType: !6)
!266 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "042ceedaf4137a8aaa272d0b27434016")
!267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !243, entity: !268, file: !245, line: 169)
!268 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !266, line: 30, baseType: !247)
!269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !243, entity: !270, file: !245, line: 170)
!270 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !266, line: 31, baseType: !18)
!271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !243, entity: !272, file: !245, line: 171)
!272 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !266, line: 32, baseType: !9)
!273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !243, entity: !274, file: !245, line: 173)
!274 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !266, line: 33, baseType: !86)
!275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !243, entity: !276, file: !245, line: 174)
!276 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !266, line: 34, baseType: !253)
!277 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !243, entity: !278, file: !245, line: 175)
!278 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !266, line: 35, baseType: !257)
!279 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !243, entity: !280, file: !245, line: 176)
!280 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !266, line: 36, baseType: !261)
!281 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !243, entity: !282, file: !245, line: 178)
!282 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !266, line: 40, baseType: !6)
!283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !243, entity: !284, file: !245, line: 179)
!284 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !266, line: 41, baseType: !247)
!285 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !243, entity: !286, file: !245, line: 180)
!286 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !266, line: 42, baseType: !18)
!287 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !243, entity: !288, file: !245, line: 181)
!288 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !266, line: 43, baseType: !9)
!289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !243, entity: !290, file: !245, line: 183)
!290 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !266, line: 44, baseType: !86)
!291 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !243, entity: !292, file: !245, line: 184)
!292 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !266, line: 45, baseType: !253)
!293 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !243, entity: !294, file: !245, line: 185)
!294 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !266, line: 46, baseType: !257)
!295 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !243, entity: !296, file: !245, line: 186)
!296 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !266, line: 47, baseType: !261)
!297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !243, entity: !298, file: !245, line: 188)
!298 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !299, line: 32, baseType: !300)
!299 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_intptr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e478ba47270923b1cca6659f19f02db1")
!300 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_intptr_t", file: !301, line: 40, baseType: !302)
!301 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/arm/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "b270144f57ae258d0ce80b8f87be068c")
!302 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!303 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !243, entity: !304, file: !245, line: 189)
!304 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !305, line: 34, baseType: !306)
!305 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_uintptr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e70ae655dd1b9d4ae0b1dcc073f5b7e4")
!306 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!307 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !243, entity: !308, file: !245, line: 191)
!308 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !309, line: 32, baseType: !302)
!309 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_intmax_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e37b9240f30f486478152ef3989b1545")
!310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !243, entity: !311, file: !245, line: 192)
!311 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !312, line: 32, baseType: !306)
!312 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uintmax_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8217a3fbb207d8e87ca5318c313e81c2")
!313 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !314, file: !321, line: 422)
!314 = !DISubprogram(name: "isfinite", linkageName: "_ZNSt3__16__math8isfiniteB8ne200100Ee", scope: !316, file: !315, line: 79, type: !317, flags: DIFlagPrototyped, spFlags: 0)
!315 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__math/traits.h", directory: "")
!316 = !DINamespace(name: "__math", scope: !243)
!317 = !DISubroutineType(types: !318)
!318 = !{!319, !320}
!319 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!320 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
!321 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/math.h", directory: "")
!322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !323, file: !321, line: 425)
!323 = !DISubprogram(name: "isinf", linkageName: "_ZNSt3__16__math5isinfB8ne200100Ee", scope: !316, file: !315, line: 103, type: !317, flags: DIFlagPrototyped, spFlags: 0)
!324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !325, file: !321, line: 429)
!325 = !DISubprogram(name: "isnan", linkageName: "_ZNSt3__16__math5isnanB8ne200100Ee", scope: !316, file: !315, line: 127, type: !317, flags: DIFlagPrototyped, spFlags: 0)
!326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !327, file: !321, line: 430)
!327 = !DISubprogram(name: "isnormal", linkageName: "_ZNSt3__16__math8isnormalB8ne200100Ee", scope: !316, file: !315, line: 146, type: !317, flags: DIFlagPrototyped, spFlags: 0)
!328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !329, file: !321, line: 485)
!329 = !DISubprogram(name: "modf", linkageName: "_ZNSt3__16__math4modfB8ne200100EePe", scope: !316, file: !330, line: 55, type: !331, flags: DIFlagPrototyped, spFlags: 0)
!330 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__math/modulo.h", directory: "")
!331 = !DISubroutineType(types: !332)
!332 = !{!320, !320, !333}
!333 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !320, size: 64)
!334 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 4]}
!335 = !{i32 7, !"Dwarf Version", i32 5}
!336 = !{i32 2, !"Debug Info Version", i32 3}
!337 = !{i32 1, !"wchar_size", i32 4}
!338 = !{i32 8, !"PIC Level", i32 2}
!339 = !{i32 7, !"uwtable", i32 1}
!340 = !{i32 7, !"frame-pointer", i32 1}
!341 = !{!"Homebrew clang version 20.1.8"}
!342 = distinct !DISubprogram(name: "fuelcen_reset", linkageName: "_Z13fuelcen_resetv", scope: !15, file: !15, line: 87, type: !343, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !213)
!343 = !DISubroutineType(types: !344)
!344 = !{null}
!345 = !DILocalVariable(name: "i", scope: !342, file: !15, line: 89, type: !5)
!346 = !DILocation(line: 89, column: 6, scope: !342)
!347 = !DILocation(line: 91, column: 18, scope: !342)
!348 = !DILocation(line: 94, column: 9, scope: !349)
!349 = distinct !DILexicalBlock(scope: !342, file: !15, line: 94, column: 2)
!350 = !DILocation(line: 94, column: 7, scope: !349)
!351 = !DILocation(line: 94, column: 14, scope: !352)
!352 = distinct !DILexicalBlock(scope: !349, file: !15, line: 94, column: 2)
!353 = !DILocation(line: 94, column: 16, scope: !352)
!354 = !DILocation(line: 94, column: 2, scope: !349)
!355 = !DILocation(line: 95, column: 13, scope: !352)
!356 = !DILocation(line: 95, column: 3, scope: !352)
!357 = !DILocation(line: 95, column: 16, scope: !352)
!358 = !DILocation(line: 95, column: 24, scope: !352)
!359 = !DILocation(line: 94, column: 33, scope: !352)
!360 = !DILocation(line: 94, column: 2, scope: !352)
!361 = distinct !{!361, !354, !362, !363}
!362 = !DILocation(line: 95, column: 26, scope: !349)
!363 = !{!"llvm.loop.mustprogress"}
!364 = !DILocation(line: 97, column: 20, scope: !342)
!365 = !DILocation(line: 99, column: 1, scope: !342)
!366 = distinct !DISubprogram(name: "reset_all_robot_centers", linkageName: "_Z23reset_all_robot_centersv", scope: !15, file: !15, line: 102, type: !343, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !213)
!367 = !DILocalVariable(name: "i", scope: !366, file: !15, line: 104, type: !5)
!368 = !DILocation(line: 104, column: 6, scope: !366)
!369 = !DILocation(line: 107, column: 9, scope: !370)
!370 = distinct !DILexicalBlock(scope: !366, file: !15, line: 107, column: 2)
!371 = !DILocation(line: 107, column: 7, scope: !370)
!372 = !DILocation(line: 107, column: 14, scope: !373)
!373 = distinct !DILexicalBlock(scope: !370, file: !15, line: 107, column: 2)
!374 = !DILocation(line: 107, column: 18, scope: !373)
!375 = !DILocation(line: 107, column: 16, scope: !373)
!376 = !DILocation(line: 107, column: 2, scope: !370)
!377 = !DILocation(line: 108, column: 17, scope: !378)
!378 = distinct !DILexicalBlock(scope: !373, file: !15, line: 108, column: 7)
!379 = !DILocation(line: 108, column: 7, scope: !378)
!380 = !DILocation(line: 108, column: 20, scope: !378)
!381 = !DILocation(line: 108, column: 28, scope: !378)
!382 = !DILocation(line: 109, column: 14, scope: !383)
!383 = distinct !DILexicalBlock(scope: !378, file: !15, line: 108, column: 54)
!384 = !DILocation(line: 109, column: 4, scope: !383)
!385 = !DILocation(line: 109, column: 17, scope: !383)
!386 = !DILocation(line: 109, column: 25, scope: !383)
!387 = !DILocation(line: 110, column: 14, scope: !383)
!388 = !DILocation(line: 110, column: 4, scope: !383)
!389 = !DILocation(line: 110, column: 17, scope: !383)
!390 = !DILocation(line: 110, column: 28, scope: !383)
!391 = !DILocation(line: 111, column: 3, scope: !383)
!392 = !DILocation(line: 108, column: 31, scope: !378)
!393 = !DILocation(line: 107, column: 33, scope: !373)
!394 = !DILocation(line: 107, column: 2, scope: !373)
!395 = distinct !{!395, !376, !396, !363}
!396 = !DILocation(line: 111, column: 3, scope: !370)
!397 = !DILocation(line: 112, column: 1, scope: !366)
!398 = distinct !DISubprogram(name: "fuelcen_create", linkageName: "_Z14fuelcen_createP7segment", scope: !15, file: !15, line: 117, type: !399, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !213)
!399 = !DISubroutineType(types: !400)
!400 = !{null, !74}
!401 = !DILocalVariable(name: "segp", arg: 1, scope: !398, file: !15, line: 117, type: !74)
!402 = !DILocation(line: 117, column: 30, scope: !398)
!403 = !DILocalVariable(name: "segnum", scope: !398, file: !15, line: 119, type: !5)
!404 = !DILocation(line: 119, column: 6, scope: !398)
!405 = !DILocation(line: 119, column: 21, scope: !398)
!406 = !DILocation(line: 119, column: 26, scope: !398)
!407 = !DILocation(line: 119, column: 20, scope: !398)
!408 = !DILocalVariable(name: "seg2p", scope: !398, file: !15, line: 168, type: !409)
!409 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !410, size: 64)
!410 = !DIDerivedType(tag: DW_TAG_typedef, name: "segment2", file: !76, line: 137, baseType: !411)
!411 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "segment2", file: !76, line: 130, size: 64, flags: DIFlagTypePassByValue, elements: !412, identifier: "_ZTS8segment2")
!412 = !{!413, !414, !415, !416, !417}
!413 = !DIDerivedType(tag: DW_TAG_member, name: "special", scope: !411, file: !76, line: 132, baseType: !86, size: 8)
!414 = !DIDerivedType(tag: DW_TAG_member, name: "matcen_num", scope: !411, file: !76, line: 133, baseType: !6, size: 8, offset: 8)
!415 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !411, file: !76, line: 134, baseType: !6, size: 8, offset: 16)
!416 = !DIDerivedType(tag: DW_TAG_member, name: "s2_flags", scope: !411, file: !76, line: 135, baseType: !86, size: 8, offset: 24)
!417 = !DIDerivedType(tag: DW_TAG_member, name: "static_light", scope: !411, file: !76, line: 136, baseType: !16, size: 32, offset: 32)
!418 = !DILocation(line: 168, column: 12, scope: !398)
!419 = !DILocation(line: 168, column: 31, scope: !398)
!420 = !DILocation(line: 168, column: 21, scope: !398)
!421 = !DILocalVariable(name: "station_type", scope: !398, file: !15, line: 170, type: !5)
!422 = !DILocation(line: 170, column: 6, scope: !398)
!423 = !DILocation(line: 172, column: 17, scope: !398)
!424 = !DILocation(line: 172, column: 24, scope: !398)
!425 = !DILocation(line: 172, column: 15, scope: !398)
!426 = !DILocation(line: 174, column: 10, scope: !398)
!427 = !DILocation(line: 174, column: 2, scope: !398)
!428 = !DILocation(line: 178, column: 3, scope: !429)
!429 = distinct !DILexicalBlock(scope: !398, file: !15, line: 174, column: 24)
!430 = !DILocation(line: 183, column: 3, scope: !429)
!431 = !DILocation(line: 185, column: 51, scope: !429)
!432 = !DILocation(line: 185, column: 3, scope: !429)
!433 = !DILocation(line: 186, column: 2, scope: !429)
!434 = !DILocation(line: 188, column: 2, scope: !398)
!435 = !DILocation(line: 189, column: 6, scope: !436)
!436 = distinct !DILexicalBlock(scope: !398, file: !15, line: 189, column: 6)
!437 = !DILocation(line: 189, column: 12, scope: !436)
!438 = !DILocation(line: 189, column: 21, scope: !436)
!439 = !DILocation(line: 191, column: 2, scope: !398)
!440 = !DILocation(line: 192, column: 2, scope: !398)
!441 = !DILocation(line: 194, column: 17, scope: !398)
!442 = !DILocation(line: 194, column: 2, scope: !398)
!443 = !DILocation(line: 194, column: 9, scope: !398)
!444 = !DILocation(line: 194, column: 15, scope: !398)
!445 = !DILocation(line: 195, column: 34, scope: !398)
!446 = !DILocation(line: 195, column: 10, scope: !398)
!447 = !DILocation(line: 195, column: 2, scope: !398)
!448 = !DILocation(line: 195, column: 27, scope: !398)
!449 = !DILocation(line: 195, column: 32, scope: !398)
!450 = !DILocation(line: 196, column: 41, scope: !398)
!451 = !DILocation(line: 196, column: 10, scope: !398)
!452 = !DILocation(line: 196, column: 2, scope: !398)
!453 = !DILocation(line: 196, column: 27, scope: !398)
!454 = !DILocation(line: 196, column: 39, scope: !398)
!455 = !DILocation(line: 197, column: 46, scope: !398)
!456 = !DILocation(line: 197, column: 38, scope: !398)
!457 = !DILocation(line: 197, column: 63, scope: !398)
!458 = !DILocation(line: 197, column: 10, scope: !398)
!459 = !DILocation(line: 197, column: 2, scope: !398)
!460 = !DILocation(line: 197, column: 27, scope: !398)
!461 = !DILocation(line: 197, column: 36, scope: !398)
!462 = !DILocation(line: 198, column: 36, scope: !398)
!463 = !DILocation(line: 198, column: 42, scope: !398)
!464 = !DILocation(line: 198, column: 10, scope: !398)
!465 = !DILocation(line: 198, column: 2, scope: !398)
!466 = !DILocation(line: 198, column: 27, scope: !398)
!467 = !DILocation(line: 198, column: 34, scope: !398)
!468 = !DILocation(line: 199, column: 10, scope: !398)
!469 = !DILocation(line: 199, column: 2, scope: !398)
!470 = !DILocation(line: 199, column: 27, scope: !398)
!471 = !DILocation(line: 199, column: 33, scope: !398)
!472 = !DILocation(line: 200, column: 10, scope: !398)
!473 = !DILocation(line: 200, column: 2, scope: !398)
!474 = !DILocation(line: 200, column: 27, scope: !398)
!475 = !DILocation(line: 200, column: 32, scope: !398)
!476 = !DILocation(line: 204, column: 34, scope: !398)
!477 = !DILocation(line: 204, column: 26, scope: !398)
!478 = !DILocation(line: 204, column: 51, scope: !398)
!479 = !DILocation(line: 204, column: 59, scope: !398)
!480 = !DILocation(line: 204, column: 2, scope: !398)
!481 = !DILocation(line: 210, column: 17, scope: !398)
!482 = !DILocation(line: 211, column: 1, scope: !398)
!483 = distinct !DISubprogram(name: "matcen_create", linkageName: "_Z13matcen_createP7segment", scope: !15, file: !15, line: 216, type: !399, scopeLine: 217, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !213)
!484 = !DILocalVariable(name: "segp", arg: 1, scope: !483, file: !15, line: 216, type: !74)
!485 = !DILocation(line: 216, column: 29, scope: !483)
!486 = !DILocalVariable(name: "segnum", scope: !483, file: !15, line: 218, type: !5)
!487 = !DILocation(line: 218, column: 6, scope: !483)
!488 = !DILocation(line: 218, column: 15, scope: !483)
!489 = !DILocation(line: 218, column: 20, scope: !483)
!490 = !DILocalVariable(name: "seg2p", scope: !483, file: !15, line: 276, type: !409)
!491 = !DILocation(line: 276, column: 12, scope: !483)
!492 = !DILocation(line: 276, column: 31, scope: !483)
!493 = !DILocation(line: 276, column: 21, scope: !483)
!494 = !DILocalVariable(name: "station_type", scope: !483, file: !15, line: 278, type: !5)
!495 = !DILocation(line: 278, column: 6, scope: !483)
!496 = !DILocation(line: 278, column: 21, scope: !483)
!497 = !DILocation(line: 278, column: 28, scope: !483)
!498 = !DILocation(line: 280, column: 2, scope: !483)
!499 = !DILocation(line: 281, column: 2, scope: !483)
!500 = !DILocation(line: 282, column: 6, scope: !501)
!501 = distinct !DILexicalBlock(scope: !483, file: !15, line: 282, column: 6)
!502 = !DILocation(line: 282, column: 12, scope: !501)
!503 = !DILocation(line: 282, column: 21, scope: !501)
!504 = !DILocation(line: 284, column: 2, scope: !483)
!505 = !DILocation(line: 285, column: 2, scope: !483)
!506 = !DILocation(line: 287, column: 17, scope: !483)
!507 = !DILocation(line: 287, column: 2, scope: !483)
!508 = !DILocation(line: 287, column: 9, scope: !483)
!509 = !DILocation(line: 287, column: 15, scope: !483)
!510 = !DILocation(line: 288, column: 34, scope: !483)
!511 = !DILocation(line: 288, column: 10, scope: !483)
!512 = !DILocation(line: 288, column: 2, scope: !483)
!513 = !DILocation(line: 288, column: 27, scope: !483)
!514 = !DILocation(line: 288, column: 32, scope: !483)
!515 = !DILocation(line: 289, column: 42, scope: !483)
!516 = !DILocation(line: 289, column: 59, scope: !483)
!517 = !DILocation(line: 289, column: 38, scope: !483)
!518 = !DILocation(line: 289, column: 10, scope: !483)
!519 = !DILocation(line: 289, column: 2, scope: !483)
!520 = !DILocation(line: 289, column: 27, scope: !483)
!521 = !DILocation(line: 289, column: 36, scope: !483)
!522 = !DILocation(line: 290, column: 49, scope: !483)
!523 = !DILocation(line: 290, column: 41, scope: !483)
!524 = !DILocation(line: 290, column: 66, scope: !483)
!525 = !DILocation(line: 290, column: 10, scope: !483)
!526 = !DILocation(line: 290, column: 2, scope: !483)
!527 = !DILocation(line: 290, column: 27, scope: !483)
!528 = !DILocation(line: 290, column: 39, scope: !483)
!529 = !DILocation(line: 292, column: 36, scope: !483)
!530 = !DILocation(line: 292, column: 42, scope: !483)
!531 = !DILocation(line: 292, column: 10, scope: !483)
!532 = !DILocation(line: 292, column: 2, scope: !483)
!533 = !DILocation(line: 292, column: 27, scope: !483)
!534 = !DILocation(line: 292, column: 34, scope: !483)
!535 = !DILocation(line: 293, column: 10, scope: !483)
!536 = !DILocation(line: 293, column: 2, scope: !483)
!537 = !DILocation(line: 293, column: 27, scope: !483)
!538 = !DILocation(line: 293, column: 33, scope: !483)
!539 = !DILocation(line: 294, column: 10, scope: !483)
!540 = !DILocation(line: 294, column: 2, scope: !483)
!541 = !DILocation(line: 294, column: 27, scope: !483)
!542 = !DILocation(line: 294, column: 32, scope: !483)
!543 = !DILocation(line: 298, column: 34, scope: !483)
!544 = !DILocation(line: 298, column: 26, scope: !483)
!545 = !DILocation(line: 298, column: 51, scope: !483)
!546 = !DILocation(line: 298, column: 69, scope: !483)
!547 = !DILocation(line: 298, column: 75, scope: !483)
!548 = !DILocation(line: 298, column: 60, scope: !483)
!549 = !DILocation(line: 298, column: 2, scope: !483)
!550 = !DILocation(line: 300, column: 22, scope: !483)
!551 = !DILocation(line: 300, column: 2, scope: !483)
!552 = !DILocation(line: 300, column: 9, scope: !483)
!553 = !DILocation(line: 300, column: 20, scope: !483)
!554 = !DILocation(line: 301, column: 19, scope: !483)
!555 = !DILocation(line: 303, column: 15, scope: !483)
!556 = !DILocation(line: 303, column: 22, scope: !483)
!557 = !DILocation(line: 303, column: 2, scope: !483)
!558 = !DILocation(line: 303, column: 34, scope: !483)
!559 = !DILocation(line: 303, column: 45, scope: !483)
!560 = !DILocation(line: 304, column: 15, scope: !483)
!561 = !DILocation(line: 304, column: 22, scope: !483)
!562 = !DILocation(line: 304, column: 2, scope: !483)
!563 = !DILocation(line: 304, column: 34, scope: !483)
!564 = !DILocation(line: 304, column: 43, scope: !483)
!565 = !DILocation(line: 305, column: 43, scope: !483)
!566 = !DILocation(line: 305, column: 49, scope: !483)
!567 = !DILocation(line: 305, column: 15, scope: !483)
!568 = !DILocation(line: 305, column: 22, scope: !483)
!569 = !DILocation(line: 305, column: 2, scope: !483)
!570 = !DILocation(line: 305, column: 34, scope: !483)
!571 = !DILocation(line: 305, column: 41, scope: !483)
!572 = !DILocation(line: 306, column: 48, scope: !483)
!573 = !DILocation(line: 306, column: 15, scope: !483)
!574 = !DILocation(line: 306, column: 22, scope: !483)
!575 = !DILocation(line: 306, column: 2, scope: !483)
!576 = !DILocation(line: 306, column: 34, scope: !483)
!577 = !DILocation(line: 306, column: 46, scope: !483)
!578 = !DILocation(line: 309, column: 17, scope: !483)
!579 = !DILocation(line: 310, column: 1, scope: !483)
!580 = distinct !DISubprogram(name: "i2f", linkageName: "_Z3i2fi", scope: !17, file: !17, line: 49, type: !581, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !213)
!581 = !DISubroutineType(types: !582)
!582 = !{!16, !5}
!583 = !DILocalVariable(name: "i", arg: 1, scope: !580, file: !17, line: 49, type: !5)
!584 = !DILocation(line: 49, column: 23, scope: !580)
!585 = !DILocation(line: 51, column: 9, scope: !580)
!586 = !DILocation(line: 51, column: 11, scope: !580)
!587 = !DILocation(line: 51, column: 2, scope: !580)
!588 = distinct !DISubprogram(name: "fuelcen_activate", linkageName: "_Z16fuelcen_activateP7segmenti", scope: !15, file: !15, line: 314, type: !589, scopeLine: 315, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !213)
!589 = !DISubroutineType(types: !590)
!590 = !{null, !74, !5}
!591 = !DILocalVariable(name: "segp", arg: 1, scope: !588, file: !15, line: 314, type: !74)
!592 = !DILocation(line: 314, column: 32, scope: !588)
!593 = !DILocalVariable(name: "station_type", arg: 2, scope: !588, file: !15, line: 314, type: !5)
!594 = !DILocation(line: 314, column: 42, scope: !588)
!595 = !DILocalVariable(name: "segnum", scope: !588, file: !15, line: 316, type: !5)
!596 = !DILocation(line: 316, column: 6, scope: !588)
!597 = !DILocation(line: 316, column: 21, scope: !588)
!598 = !DILocation(line: 316, column: 26, scope: !588)
!599 = !DILocation(line: 316, column: 20, scope: !588)
!600 = !DILocalVariable(name: "seg2p", scope: !588, file: !15, line: 336, type: !409)
!601 = !DILocation(line: 336, column: 12, scope: !588)
!602 = !DILocation(line: 336, column: 31, scope: !588)
!603 = !DILocation(line: 336, column: 21, scope: !588)
!604 = !DILocation(line: 338, column: 19, scope: !588)
!605 = !DILocation(line: 338, column: 2, scope: !588)
!606 = !DILocation(line: 338, column: 9, scope: !588)
!607 = !DILocation(line: 338, column: 17, scope: !588)
!608 = !DILocation(line: 340, column: 6, scope: !609)
!609 = distinct !DILexicalBlock(scope: !588, file: !15, line: 340, column: 6)
!610 = !DILocation(line: 340, column: 13, scope: !609)
!611 = !DILocation(line: 340, column: 21, scope: !609)
!612 = !DILocation(line: 341, column: 17, scope: !609)
!613 = !DILocation(line: 341, column: 3, scope: !609)
!614 = !DILocation(line: 343, column: 18, scope: !609)
!615 = !DILocation(line: 343, column: 3, scope: !609)
!616 = !DILocation(line: 345, column: 1, scope: !588)
!617 = distinct !DISubprogram(name: "trigger_matcen", linkageName: "_Z14trigger_matceni", scope: !15, file: !15, line: 354, type: !618, scopeLine: 355, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !213)
!618 = !DISubroutineType(types: !619)
!619 = !{null, !5}
!620 = !DILocalVariable(name: "segnum", arg: 1, scope: !617, file: !15, line: 354, type: !5)
!621 = !DILocation(line: 354, column: 25, scope: !617)
!622 = !DILocalVariable(name: "seg2p", scope: !617, file: !15, line: 357, type: !409)
!623 = !DILocation(line: 357, column: 12, scope: !617)
!624 = !DILocation(line: 357, column: 31, scope: !617)
!625 = !DILocation(line: 357, column: 21, scope: !617)
!626 = !DILocalVariable(name: "pos", scope: !617, file: !15, line: 358, type: !61)
!627 = !DILocation(line: 358, column: 13, scope: !617)
!628 = !DILocalVariable(name: "delta", scope: !617, file: !15, line: 358, type: !61)
!629 = !DILocation(line: 358, column: 18, scope: !617)
!630 = !DILocalVariable(name: "robotcen", scope: !617, file: !15, line: 359, type: !631)
!631 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!632 = !DILocation(line: 359, column: 14, scope: !617)
!633 = !DILocalVariable(name: "objnum", scope: !617, file: !15, line: 360, type: !5)
!634 = !DILocation(line: 360, column: 8, scope: !617)
!635 = !DILocation(line: 362, column: 2, scope: !617)
!636 = !DILocation(line: 364, column: 2, scope: !617)
!637 = !DILocation(line: 365, column: 2, scope: !617)
!638 = !DILocation(line: 366, column: 2, scope: !617)
!639 = !DILocation(line: 0, scope: !617)
!640 = !DILocation(line: 368, column: 35, scope: !617)
!641 = !DILocation(line: 368, column: 42, scope: !617)
!642 = !DILocation(line: 368, column: 22, scope: !617)
!643 = !DILocation(line: 368, column: 54, scope: !617)
!644 = !DILocation(line: 368, column: 14, scope: !617)
!645 = !DILocation(line: 368, column: 11, scope: !617)
!646 = !DILocation(line: 370, column: 6, scope: !647)
!647 = distinct !DILexicalBlock(scope: !617, file: !15, line: 370, column: 6)
!648 = !DILocation(line: 370, column: 16, scope: !647)
!649 = !DILocation(line: 370, column: 24, scope: !647)
!650 = !DILocation(line: 371, column: 3, scope: !647)
!651 = !DILocation(line: 373, column: 7, scope: !652)
!652 = distinct !DILexicalBlock(scope: !617, file: !15, line: 373, column: 6)
!653 = !DILocation(line: 373, column: 17, scope: !652)
!654 = !DILocation(line: 373, column: 6, scope: !652)
!655 = !DILocation(line: 374, column: 3, scope: !652)
!656 = !DILocation(line: 377, column: 6, scope: !657)
!657 = distinct !DILexicalBlock(scope: !617, file: !15, line: 377, column: 6)
!658 = !DILocation(line: 377, column: 23, scope: !657)
!659 = !DILocation(line: 377, column: 27, scope: !657)
!660 = !DILocation(line: 378, column: 3, scope: !657)
!661 = !DILocation(line: 378, column: 13, scope: !657)
!662 = !DILocation(line: 378, column: 18, scope: !657)
!663 = !DILocation(line: 380, column: 2, scope: !617)
!664 = !DILocation(line: 380, column: 12, scope: !617)
!665 = !DILocation(line: 380, column: 18, scope: !617)
!666 = !DILocation(line: 381, column: 2, scope: !617)
!667 = !DILocation(line: 381, column: 12, scope: !617)
!668 = !DILocation(line: 381, column: 20, scope: !617)
!669 = !DILocation(line: 382, column: 27, scope: !617)
!670 = !DILocation(line: 382, column: 44, scope: !617)
!671 = !DILocation(line: 382, column: 23, scope: !617)
!672 = !DILocation(line: 382, column: 2, scope: !617)
!673 = !DILocation(line: 382, column: 12, scope: !617)
!674 = !DILocation(line: 382, column: 21, scope: !617)
!675 = !DILocation(line: 383, column: 27, scope: !617)
!676 = !DILocation(line: 383, column: 2, scope: !617)
!677 = !DILocation(line: 383, column: 12, scope: !617)
!678 = !DILocation(line: 383, column: 25, scope: !617)
!679 = !DILocation(line: 386, column: 8, scope: !617)
!680 = !DILocation(line: 386, column: 18, scope: !617)
!681 = !DILocation(line: 386, column: 6, scope: !617)
!682 = !DILocation(line: 387, column: 40, scope: !617)
!683 = !DILocation(line: 387, column: 31, scope: !617)
!684 = !DILocation(line: 387, column: 48, scope: !617)
!685 = !DILocation(line: 387, column: 22, scope: !617)
!686 = !DILocation(line: 387, column: 60, scope: !617)
!687 = !DILocation(line: 387, column: 70, scope: !617)
!688 = !DILocation(line: 387, column: 2, scope: !617)
!689 = !DILocation(line: 388, column: 2, scope: !617)
!690 = !DILocation(line: 389, column: 36, scope: !617)
!691 = !DILocation(line: 389, column: 11, scope: !617)
!692 = !DILocation(line: 389, column: 9, scope: !617)
!693 = !DILocation(line: 390, column: 6, scope: !694)
!694 = distinct !DILexicalBlock(scope: !617, file: !15, line: 390, column: 6)
!695 = !DILocation(line: 390, column: 13, scope: !694)
!696 = !DILocation(line: 391, column: 30, scope: !697)
!697 = distinct !DILexicalBlock(scope: !694, file: !15, line: 390, column: 20)
!698 = !DILocation(line: 391, column: 11, scope: !697)
!699 = !DILocation(line: 391, column: 3, scope: !697)
!700 = !DILocation(line: 391, column: 19, scope: !697)
!701 = !DILocation(line: 391, column: 28, scope: !697)
!702 = !DILocation(line: 392, column: 48, scope: !697)
!703 = !DILocation(line: 392, column: 11, scope: !697)
!704 = !DILocation(line: 392, column: 3, scope: !697)
!705 = !DILocation(line: 392, column: 19, scope: !697)
!706 = !DILocation(line: 392, column: 36, scope: !697)
!707 = !DILocation(line: 392, column: 46, scope: !697)
!708 = !DILocation(line: 393, column: 2, scope: !697)
!709 = !DILocation(line: 395, column: 3, scope: !710)
!710 = distinct !DILexicalBlock(scope: !694, file: !15, line: 394, column: 7)
!711 = !DILocation(line: 396, column: 3, scope: !710)
!712 = !DILocation(line: 399, column: 1, scope: !617)
!713 = distinct !DISubprogram(name: "create_morph_robot", linkageName: "_Z18create_morph_robotP7segmentP10vms_vectori", scope: !15, file: !15, line: 452, type: !714, scopeLine: 453, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !213)
!714 = !DISubroutineType(types: !715)
!715 = !{!716, !74, !848, !5}
!716 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !717, size: 64)
!717 = !DIDerivedType(tag: DW_TAG_typedef, name: "object", file: !718, line: 259, baseType: !719)
!718 = !DIFile(filename: "main_d2/object.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "1f2325d356aae4b692933d2aae4f3afd")
!719 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "object", file: !718, line: 210, size: 2144, flags: DIFlagTypePassByValue, elements: !720, identifier: "_ZTS6object")
!720 = !{!721, !722, !723, !724, !725, !726, !727, !728, !729, !730, !731, !732, !733, !740, !741, !742, !743, !744, !745, !746, !747, !748, !766, !820}
!721 = !DIDerivedType(tag: DW_TAG_member, name: "signature", scope: !719, file: !718, line: 212, baseType: !5, size: 32)
!722 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !719, file: !718, line: 213, baseType: !86, size: 8, offset: 32)
!723 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !719, file: !718, line: 214, baseType: !86, size: 8, offset: 40)
!724 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !719, file: !718, line: 215, baseType: !38, size: 16, offset: 48)
!725 = !DIDerivedType(tag: DW_TAG_member, name: "prev", scope: !719, file: !718, line: 215, baseType: !38, size: 16, offset: 64)
!726 = !DIDerivedType(tag: DW_TAG_member, name: "control_type", scope: !719, file: !718, line: 216, baseType: !86, size: 8, offset: 80)
!727 = !DIDerivedType(tag: DW_TAG_member, name: "movement_type", scope: !719, file: !718, line: 217, baseType: !86, size: 8, offset: 88)
!728 = !DIDerivedType(tag: DW_TAG_member, name: "render_type", scope: !719, file: !718, line: 218, baseType: !86, size: 8, offset: 96)
!729 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !719, file: !718, line: 219, baseType: !86, size: 8, offset: 104)
!730 = !DIDerivedType(tag: DW_TAG_member, name: "segnum", scope: !719, file: !718, line: 220, baseType: !38, size: 16, offset: 112)
!731 = !DIDerivedType(tag: DW_TAG_member, name: "attached_obj", scope: !719, file: !718, line: 221, baseType: !38, size: 16, offset: 128)
!732 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !719, file: !718, line: 222, baseType: !61, size: 96, offset: 160)
!733 = !DIDerivedType(tag: DW_TAG_member, name: "orient", scope: !719, file: !718, line: 223, baseType: !734, size: 288, offset: 256)
!734 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_matrix", file: !62, line: 47, baseType: !735)
!735 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_matrix", file: !62, line: 44, size: 288, flags: DIFlagTypePassByValue, elements: !736, identifier: "_ZTS10vms_matrix")
!736 = !{!737, !738, !739}
!737 = !DIDerivedType(tag: DW_TAG_member, name: "rvec", scope: !735, file: !62, line: 46, baseType: !61, size: 96)
!738 = !DIDerivedType(tag: DW_TAG_member, name: "uvec", scope: !735, file: !62, line: 46, baseType: !61, size: 96, offset: 96)
!739 = !DIDerivedType(tag: DW_TAG_member, name: "fvec", scope: !735, file: !62, line: 46, baseType: !61, size: 96, offset: 192)
!740 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !719, file: !718, line: 224, baseType: !16, size: 32, offset: 544)
!741 = !DIDerivedType(tag: DW_TAG_member, name: "shields", scope: !719, file: !718, line: 225, baseType: !16, size: 32, offset: 576)
!742 = !DIDerivedType(tag: DW_TAG_member, name: "last_pos", scope: !719, file: !718, line: 226, baseType: !61, size: 96, offset: 608)
!743 = !DIDerivedType(tag: DW_TAG_member, name: "contains_type", scope: !719, file: !718, line: 227, baseType: !6, size: 8, offset: 704)
!744 = !DIDerivedType(tag: DW_TAG_member, name: "contains_id", scope: !719, file: !718, line: 228, baseType: !6, size: 8, offset: 712)
!745 = !DIDerivedType(tag: DW_TAG_member, name: "contains_count", scope: !719, file: !718, line: 229, baseType: !6, size: 8, offset: 720)
!746 = !DIDerivedType(tag: DW_TAG_member, name: "matcen_creator", scope: !719, file: !718, line: 230, baseType: !6, size: 8, offset: 728)
!747 = !DIDerivedType(tag: DW_TAG_member, name: "lifeleft", scope: !719, file: !718, line: 231, baseType: !16, size: 32, offset: 736)
!748 = !DIDerivedType(tag: DW_TAG_member, name: "mtype", scope: !719, file: !718, line: 240, baseType: !749, size: 512, offset: 768)
!749 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !719, file: !718, line: 236, size: 512, flags: DIFlagTypePassByValue, elements: !750, identifier: "_ZTSN6objectUt_E")
!750 = !{!751, !765}
!751 = !DIDerivedType(tag: DW_TAG_member, name: "phys_info", scope: !749, file: !718, line: 238, baseType: !752, size: 512)
!752 = !DIDerivedType(tag: DW_TAG_typedef, name: "physics_info", file: !718, line: 153, baseType: !753)
!753 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "physics_info", file: !718, line: 142, size: 512, flags: DIFlagTypePassByValue, elements: !754, identifier: "_ZTS12physics_info")
!754 = !{!755, !756, !757, !758, !759, !760, !761, !762, !764}
!755 = !DIDerivedType(tag: DW_TAG_member, name: "velocity", scope: !753, file: !718, line: 144, baseType: !61, size: 96)
!756 = !DIDerivedType(tag: DW_TAG_member, name: "thrust", scope: !753, file: !718, line: 145, baseType: !61, size: 96, offset: 96)
!757 = !DIDerivedType(tag: DW_TAG_member, name: "mass", scope: !753, file: !718, line: 146, baseType: !16, size: 32, offset: 192)
!758 = !DIDerivedType(tag: DW_TAG_member, name: "drag", scope: !753, file: !718, line: 147, baseType: !16, size: 32, offset: 224)
!759 = !DIDerivedType(tag: DW_TAG_member, name: "brakes", scope: !753, file: !718, line: 148, baseType: !16, size: 32, offset: 256)
!760 = !DIDerivedType(tag: DW_TAG_member, name: "rotvel", scope: !753, file: !718, line: 149, baseType: !61, size: 96, offset: 288)
!761 = !DIDerivedType(tag: DW_TAG_member, name: "rotthrust", scope: !753, file: !718, line: 150, baseType: !61, size: 96, offset: 384)
!762 = !DIDerivedType(tag: DW_TAG_member, name: "turnroll", scope: !753, file: !718, line: 151, baseType: !763, size: 16, offset: 480)
!763 = !DIDerivedType(tag: DW_TAG_typedef, name: "fixang", file: !17, line: 21, baseType: !38)
!764 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !753, file: !718, line: 152, baseType: !253, size: 16, offset: 496)
!765 = !DIDerivedType(tag: DW_TAG_member, name: "spin_rate", scope: !749, file: !718, line: 239, baseType: !61, size: 96)
!766 = !DIDerivedType(tag: DW_TAG_member, name: "ctype", scope: !719, file: !718, line: 250, baseType: !767, size: 256, offset: 1280)
!767 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !719, file: !718, line: 243, size: 256, flags: DIFlagTypePassByValue, elements: !768, identifier: "_ZTSN6objectUt0_E")
!768 = !{!769, !780, !790, !808, !813}
!769 = !DIDerivedType(tag: DW_TAG_member, name: "laser_info", scope: !767, file: !718, line: 245, baseType: !770, size: 160)
!770 = !DIDerivedType(tag: DW_TAG_typedef, name: "laser_info_t", file: !718, line: 166, baseType: !771)
!771 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "laser_info_s", file: !718, line: 157, size: 160, flags: DIFlagTypePassByValue, elements: !772, identifier: "_ZTS12laser_info_s")
!772 = !{!773, !774, !775, !776, !777, !778, !779}
!773 = !DIDerivedType(tag: DW_TAG_member, name: "parent_type", scope: !771, file: !718, line: 159, baseType: !38, size: 16)
!774 = !DIDerivedType(tag: DW_TAG_member, name: "parent_num", scope: !771, file: !718, line: 160, baseType: !38, size: 16, offset: 16)
!775 = !DIDerivedType(tag: DW_TAG_member, name: "parent_signature", scope: !771, file: !718, line: 161, baseType: !5, size: 32, offset: 32)
!776 = !DIDerivedType(tag: DW_TAG_member, name: "creation_time", scope: !771, file: !718, line: 162, baseType: !16, size: 32, offset: 64)
!777 = !DIDerivedType(tag: DW_TAG_member, name: "last_hitobj", scope: !771, file: !718, line: 163, baseType: !38, size: 16, offset: 96)
!778 = !DIDerivedType(tag: DW_TAG_member, name: "track_goal", scope: !771, file: !718, line: 164, baseType: !38, size: 16, offset: 112)
!779 = !DIDerivedType(tag: DW_TAG_member, name: "multiplier", scope: !771, file: !718, line: 165, baseType: !16, size: 32, offset: 128)
!780 = !DIDerivedType(tag: DW_TAG_member, name: "expl_info", scope: !767, file: !718, line: 246, baseType: !781, size: 128)
!781 = !DIDerivedType(tag: DW_TAG_typedef, name: "explosion_info", file: !718, line: 176, baseType: !782)
!782 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "explosion_info", file: !718, line: 168, size: 128, flags: DIFlagTypePassByValue, elements: !783, identifier: "_ZTS14explosion_info")
!783 = !{!784, !785, !786, !787, !788, !789}
!784 = !DIDerivedType(tag: DW_TAG_member, name: "spawn_time", scope: !782, file: !718, line: 170, baseType: !16, size: 32)
!785 = !DIDerivedType(tag: DW_TAG_member, name: "delete_time", scope: !782, file: !718, line: 171, baseType: !16, size: 32, offset: 32)
!786 = !DIDerivedType(tag: DW_TAG_member, name: "delete_objnum", scope: !782, file: !718, line: 172, baseType: !38, size: 16, offset: 64)
!787 = !DIDerivedType(tag: DW_TAG_member, name: "attach_parent", scope: !782, file: !718, line: 173, baseType: !38, size: 16, offset: 80)
!788 = !DIDerivedType(tag: DW_TAG_member, name: "prev_attach", scope: !782, file: !718, line: 174, baseType: !38, size: 16, offset: 96)
!789 = !DIDerivedType(tag: DW_TAG_member, name: "next_attach", scope: !782, file: !718, line: 175, baseType: !38, size: 16, offset: 112)
!790 = !DIDerivedType(tag: DW_TAG_member, name: "ai_info", scope: !767, file: !718, line: 247, baseType: !791, size: 256)
!791 = !DIDerivedType(tag: DW_TAG_typedef, name: "ai_static", file: !792, line: 144, baseType: !793)
!792 = !DIFile(filename: "main_d2/aistruct.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "d122430e792a0ddc0f9eaa08ad217628")
!793 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ai_static", file: !792, line: 127, size: 256, flags: DIFlagTypePassByValue, elements: !794, identifier: "_ZTS9ai_static")
!794 = !{!795, !796, !800, !801, !802, !803, !804, !805, !806, !807}
!795 = !DIDerivedType(tag: DW_TAG_member, name: "behavior", scope: !793, file: !792, line: 128, baseType: !86, size: 8)
!796 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !793, file: !792, line: 129, baseType: !797, size: 88, offset: 8)
!797 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 88, elements: !798)
!798 = !{!799}
!799 = !DISubrange(count: 11)
!800 = !DIDerivedType(tag: DW_TAG_member, name: "hide_segment", scope: !793, file: !792, line: 130, baseType: !38, size: 16, offset: 96)
!801 = !DIDerivedType(tag: DW_TAG_member, name: "hide_index", scope: !793, file: !792, line: 131, baseType: !38, size: 16, offset: 112)
!802 = !DIDerivedType(tag: DW_TAG_member, name: "path_length", scope: !793, file: !792, line: 132, baseType: !38, size: 16, offset: 128)
!803 = !DIDerivedType(tag: DW_TAG_member, name: "cur_path_index", scope: !793, file: !792, line: 133, baseType: !6, size: 8, offset: 144)
!804 = !DIDerivedType(tag: DW_TAG_member, name: "dying_sound_playing", scope: !793, file: !792, line: 134, baseType: !6, size: 8, offset: 152)
!805 = !DIDerivedType(tag: DW_TAG_member, name: "danger_laser_num", scope: !793, file: !792, line: 139, baseType: !38, size: 16, offset: 160)
!806 = !DIDerivedType(tag: DW_TAG_member, name: "danger_laser_signature", scope: !793, file: !792, line: 140, baseType: !5, size: 32, offset: 192)
!807 = !DIDerivedType(tag: DW_TAG_member, name: "dying_start_time", scope: !793, file: !792, line: 141, baseType: !16, size: 32, offset: 224)
!808 = !DIDerivedType(tag: DW_TAG_member, name: "light_info", scope: !767, file: !718, line: 248, baseType: !809, size: 32)
!809 = !DIDerivedType(tag: DW_TAG_typedef, name: "light_info_t", file: !718, line: 181, baseType: !810)
!810 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "light_info_s", file: !718, line: 178, size: 32, flags: DIFlagTypePassByValue, elements: !811, identifier: "_ZTS12light_info_s")
!811 = !{!812}
!812 = !DIDerivedType(tag: DW_TAG_member, name: "intensity", scope: !810, file: !718, line: 180, baseType: !16, size: 32)
!813 = !DIDerivedType(tag: DW_TAG_member, name: "powerup_info", scope: !767, file: !718, line: 249, baseType: !814, size: 96)
!814 = !DIDerivedType(tag: DW_TAG_typedef, name: "powerup_info_t", file: !718, line: 190, baseType: !815)
!815 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "powerup_info_s", file: !718, line: 185, size: 96, flags: DIFlagTypePassByValue, elements: !816, identifier: "_ZTS14powerup_info_s")
!816 = !{!817, !818, !819}
!817 = !DIDerivedType(tag: DW_TAG_member, name: "count", scope: !815, file: !718, line: 187, baseType: !5, size: 32)
!818 = !DIDerivedType(tag: DW_TAG_member, name: "creation_time", scope: !815, file: !718, line: 188, baseType: !16, size: 32, offset: 32)
!819 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !815, file: !718, line: 189, baseType: !5, size: 32, offset: 64)
!820 = !DIDerivedType(tag: DW_TAG_member, name: "rtype", scope: !719, file: !718, line: 257, baseType: !821, size: 608, offset: 1536)
!821 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !719, file: !718, line: 253, size: 608, flags: DIFlagTypePassByValue, elements: !822, identifier: "_ZTSN6objectUt1_E")
!822 = !{!823, !841}
!823 = !DIDerivedType(tag: DW_TAG_member, name: "pobj_info", scope: !821, file: !718, line: 255, baseType: !824, size: 608)
!824 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyobj_info", file: !718, line: 208, baseType: !825)
!825 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "polyobj_info", file: !718, line: 201, size: 608, flags: DIFlagTypePassByValue, elements: !826, identifier: "_ZTS12polyobj_info")
!826 = !{!827, !828, !838, !839, !840}
!827 = !DIDerivedType(tag: DW_TAG_member, name: "model_num", scope: !825, file: !718, line: 203, baseType: !5, size: 32)
!828 = !DIDerivedType(tag: DW_TAG_member, name: "anim_angles", scope: !825, file: !718, line: 204, baseType: !829, size: 480, offset: 32)
!829 = !DICompositeType(tag: DW_TAG_array_type, baseType: !830, size: 480, elements: !836)
!830 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_angvec", file: !62, line: 40, baseType: !831)
!831 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_angvec", file: !62, line: 37, size: 48, flags: DIFlagTypePassByValue, elements: !832, identifier: "_ZTS10vms_angvec")
!832 = !{!833, !834, !835}
!833 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !831, file: !62, line: 39, baseType: !763, size: 16)
!834 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !831, file: !62, line: 39, baseType: !763, size: 16, offset: 16)
!835 = !DIDerivedType(tag: DW_TAG_member, name: "h", scope: !831, file: !62, line: 39, baseType: !763, size: 16, offset: 32)
!836 = !{!837}
!837 = !DISubrange(count: 10)
!838 = !DIDerivedType(tag: DW_TAG_member, name: "subobj_flags", scope: !825, file: !718, line: 205, baseType: !5, size: 32, offset: 512)
!839 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_override", scope: !825, file: !718, line: 206, baseType: !5, size: 32, offset: 544)
!840 = !DIDerivedType(tag: DW_TAG_member, name: "alt_textures", scope: !825, file: !718, line: 207, baseType: !5, size: 32, offset: 576)
!841 = !DIDerivedType(tag: DW_TAG_member, name: "vclip_info", scope: !821, file: !718, line: 256, baseType: !842, size: 96)
!842 = !DIDerivedType(tag: DW_TAG_typedef, name: "vclip_info_t", file: !718, line: 197, baseType: !843)
!843 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vclip_info_s", file: !718, line: 192, size: 96, flags: DIFlagTypePassByValue, elements: !844, identifier: "_ZTS12vclip_info_s")
!844 = !{!845, !846, !847}
!845 = !DIDerivedType(tag: DW_TAG_member, name: "vclip_num", scope: !843, file: !718, line: 194, baseType: !5, size: 32)
!846 = !DIDerivedType(tag: DW_TAG_member, name: "frametime", scope: !843, file: !718, line: 195, baseType: !16, size: 32, offset: 32)
!847 = !DIDerivedType(tag: DW_TAG_member, name: "framenum", scope: !843, file: !718, line: 196, baseType: !6, size: 8, offset: 64)
!848 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!849 = !DILocalVariable(name: "segp", arg: 1, scope: !713, file: !15, line: 452, type: !74)
!850 = !DILocation(line: 452, column: 37, scope: !713)
!851 = !DILocalVariable(name: "object_pos", arg: 2, scope: !713, file: !15, line: 452, type: !848)
!852 = !DILocation(line: 452, column: 55, scope: !713)
!853 = !DILocalVariable(name: "object_id", arg: 3, scope: !713, file: !15, line: 452, type: !5)
!854 = !DILocation(line: 452, column: 71, scope: !713)
!855 = !DILocalVariable(name: "objnum", scope: !713, file: !15, line: 454, type: !38)
!856 = !DILocation(line: 454, column: 9, scope: !713)
!857 = !DILocalVariable(name: "obj", scope: !713, file: !15, line: 455, type: !716)
!858 = !DILocation(line: 455, column: 10, scope: !713)
!859 = !DILocalVariable(name: "default_behavior", scope: !713, file: !15, line: 456, type: !5)
!860 = !DILocation(line: 456, column: 7, scope: !713)
!861 = !DILocation(line: 458, column: 10, scope: !713)
!862 = !DILocation(line: 458, column: 2, scope: !713)
!863 = !DILocation(line: 458, column: 22, scope: !713)
!864 = !DILocation(line: 458, column: 38, scope: !713)
!865 = !DILocation(line: 459, column: 10, scope: !713)
!866 = !DILocation(line: 459, column: 2, scope: !713)
!867 = !DILocation(line: 459, column: 22, scope: !713)
!868 = !DILocation(line: 459, column: 38, scope: !713)
!869 = !DILocation(line: 461, column: 33, scope: !713)
!870 = !DILocation(line: 461, column: 44, scope: !713)
!871 = !DILocation(line: 461, column: 49, scope: !713)
!872 = !DILocation(line: 461, column: 61, scope: !713)
!873 = !DILocation(line: 462, column: 51, scope: !713)
!874 = !DILocation(line: 462, column: 40, scope: !713)
!875 = !DILocation(line: 462, column: 62, scope: !713)
!876 = !DILocation(line: 462, column: 25, scope: !713)
!877 = !DILocation(line: 462, column: 73, scope: !713)
!878 = !DILocation(line: 461, column: 11, scope: !713)
!879 = !DILocation(line: 461, column: 9, scope: !713)
!880 = !DILocation(line: 465, column: 6, scope: !881)
!881 = distinct !DILexicalBlock(scope: !713, file: !15, line: 465, column: 6)
!882 = !DILocation(line: 465, column: 13, scope: !881)
!883 = !DILocation(line: 466, column: 3, scope: !884)
!884 = distinct !DILexicalBlock(scope: !881, file: !15, line: 465, column: 18)
!885 = !DILocation(line: 467, column: 3, scope: !884)
!886 = !DILocation(line: 468, column: 3, scope: !884)
!887 = !DILocation(line: 471, column: 17, scope: !713)
!888 = !DILocation(line: 471, column: 9, scope: !713)
!889 = !DILocation(line: 471, column: 6, scope: !713)
!890 = !DILocation(line: 475, column: 46, scope: !713)
!891 = !DILocation(line: 475, column: 51, scope: !713)
!892 = !DILocation(line: 475, column: 35, scope: !713)
!893 = !DILocation(line: 475, column: 55, scope: !713)
!894 = !DILocation(line: 475, column: 2, scope: !713)
!895 = !DILocation(line: 475, column: 7, scope: !713)
!896 = !DILocation(line: 475, column: 23, scope: !713)
!897 = !DILocation(line: 475, column: 33, scope: !713)
!898 = !DILocation(line: 476, column: 2, scope: !713)
!899 = !DILocation(line: 476, column: 7, scope: !713)
!900 = !DILocation(line: 476, column: 23, scope: !713)
!901 = !DILocation(line: 476, column: 36, scope: !713)
!902 = !DILocation(line: 480, column: 41, scope: !713)
!903 = !DILocation(line: 480, column: 46, scope: !713)
!904 = !DILocation(line: 480, column: 30, scope: !713)
!905 = !DILocation(line: 480, column: 50, scope: !713)
!906 = !DILocation(line: 480, column: 2, scope: !713)
!907 = !DILocation(line: 480, column: 7, scope: !713)
!908 = !DILocation(line: 480, column: 23, scope: !713)
!909 = !DILocation(line: 480, column: 28, scope: !713)
!910 = !DILocation(line: 481, column: 41, scope: !713)
!911 = !DILocation(line: 481, column: 46, scope: !713)
!912 = !DILocation(line: 481, column: 30, scope: !713)
!913 = !DILocation(line: 481, column: 50, scope: !713)
!914 = !DILocation(line: 481, column: 2, scope: !713)
!915 = !DILocation(line: 481, column: 7, scope: !713)
!916 = !DILocation(line: 481, column: 23, scope: !713)
!917 = !DILocation(line: 481, column: 28, scope: !713)
!918 = !DILocation(line: 483, column: 2, scope: !713)
!919 = !DILocation(line: 483, column: 7, scope: !713)
!920 = !DILocation(line: 483, column: 23, scope: !713)
!921 = !DILocation(line: 483, column: 29, scope: !713)
!922 = !DILocation(line: 485, column: 28, scope: !713)
!923 = !DILocation(line: 485, column: 33, scope: !713)
!924 = !DILocation(line: 485, column: 17, scope: !713)
!925 = !DILocation(line: 485, column: 37, scope: !713)
!926 = !DILocation(line: 485, column: 2, scope: !713)
!927 = !DILocation(line: 485, column: 7, scope: !713)
!928 = !DILocation(line: 485, column: 15, scope: !713)
!929 = !DILocation(line: 487, column: 32, scope: !713)
!930 = !DILocation(line: 487, column: 37, scope: !713)
!931 = !DILocation(line: 487, column: 21, scope: !713)
!932 = !DILocation(line: 487, column: 41, scope: !713)
!933 = !DILocation(line: 487, column: 19, scope: !713)
!934 = !DILocation(line: 489, column: 17, scope: !713)
!935 = !DILocation(line: 489, column: 21, scope: !713)
!936 = !DILocation(line: 489, column: 32, scope: !713)
!937 = !DILocation(line: 489, column: 2, scope: !713)
!938 = !DILocation(line: 491, column: 24, scope: !713)
!939 = !DILocation(line: 491, column: 2, scope: !713)
!940 = !DILocation(line: 493, column: 51, scope: !713)
!941 = !DILocation(line: 493, column: 31, scope: !713)
!942 = !DILocation(line: 493, column: 16, scope: !713)
!943 = !DILocation(line: 493, column: 2, scope: !713)
!944 = !DILocation(line: 493, column: 24, scope: !713)
!945 = !DILocation(line: 493, column: 29, scope: !713)
!946 = !DILocation(line: 495, column: 9, scope: !713)
!947 = !DILocation(line: 495, column: 2, scope: !713)
!948 = !DILocation(line: 496, column: 1, scope: !713)
!949 = distinct !DISubprogram(name: "robotmaker_proc", linkageName: "_Z15robotmaker_procP10FuelCenter", scope: !15, file: !15, line: 505, type: !950, scopeLine: 506, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !213)
!950 = !DISubroutineType(types: !951)
!951 = !{null, !631}
!952 = !DILocalVariable(name: "robotcen", arg: 1, scope: !949, file: !15, line: 505, type: !631)
!953 = !DILocation(line: 505, column: 34, scope: !949)
!954 = !DILocalVariable(name: "dist_to_player", scope: !949, file: !15, line: 507, type: !16)
!955 = !DILocation(line: 507, column: 7, scope: !949)
!956 = !DILocalVariable(name: "cur_object_loc", scope: !949, file: !15, line: 508, type: !61)
!957 = !DILocation(line: 508, column: 13, scope: !949)
!958 = !DILocalVariable(name: "matcen_num", scope: !949, file: !15, line: 509, type: !5)
!959 = !DILocation(line: 509, column: 7, scope: !949)
!960 = !DILocalVariable(name: "segnum", scope: !949, file: !15, line: 509, type: !5)
!961 = !DILocation(line: 509, column: 19, scope: !949)
!962 = !DILocalVariable(name: "objnum", scope: !949, file: !15, line: 509, type: !5)
!963 = !DILocation(line: 509, column: 27, scope: !949)
!964 = !DILocalVariable(name: "obj", scope: !949, file: !15, line: 510, type: !716)
!965 = !DILocation(line: 510, column: 10, scope: !949)
!966 = !DILocalVariable(name: "top_time", scope: !949, file: !15, line: 511, type: !16)
!967 = !DILocation(line: 511, column: 7, scope: !949)
!968 = !DILocalVariable(name: "direction", scope: !949, file: !15, line: 512, type: !61)
!969 = !DILocation(line: 512, column: 13, scope: !949)
!970 = !DILocation(line: 514, column: 6, scope: !971)
!971 = distinct !DILexicalBlock(scope: !949, file: !15, line: 514, column: 6)
!972 = !DILocation(line: 514, column: 16, scope: !971)
!973 = !DILocation(line: 514, column: 24, scope: !971)
!974 = !DILocation(line: 515, column: 3, scope: !971)
!975 = !DILocation(line: 517, column: 6, scope: !976)
!976 = distinct !DILexicalBlock(scope: !949, file: !15, line: 517, column: 6)
!977 = !DILocation(line: 517, column: 16, scope: !976)
!978 = !DILocation(line: 517, column: 29, scope: !976)
!979 = !DILocation(line: 519, column: 29, scope: !980)
!980 = distinct !DILexicalBlock(scope: !976, file: !15, line: 518, column: 2)
!981 = !DILocation(line: 519, column: 3, scope: !980)
!982 = !DILocation(line: 519, column: 13, scope: !980)
!983 = !DILocation(line: 519, column: 26, scope: !980)
!984 = !DILocation(line: 520, column: 7, scope: !985)
!985 = distinct !DILexicalBlock(scope: !980, file: !15, line: 520, column: 7)
!986 = !DILocation(line: 520, column: 17, scope: !985)
!987 = !DILocation(line: 520, column: 30, scope: !985)
!988 = !DILocation(line: 522, column: 4, scope: !989)
!989 = distinct !DILexicalBlock(scope: !985, file: !15, line: 521, column: 3)
!990 = !DILocation(line: 523, column: 4, scope: !989)
!991 = !DILocation(line: 523, column: 14, scope: !989)
!992 = !DILocation(line: 523, column: 22, scope: !989)
!993 = !DILocation(line: 524, column: 3, scope: !989)
!994 = !DILocation(line: 525, column: 2, scope: !980)
!995 = !DILocation(line: 541, column: 6, scope: !996)
!996 = distinct !DILexicalBlock(scope: !949, file: !15, line: 541, column: 6)
!997 = !DILocation(line: 541, column: 16, scope: !996)
!998 = !DILocation(line: 541, column: 25, scope: !996)
!999 = !DILocation(line: 543, column: 3, scope: !1000)
!1000 = distinct !DILexicalBlock(scope: !996, file: !15, line: 542, column: 2)
!1001 = !DILocation(line: 546, column: 25, scope: !949)
!1002 = !DILocation(line: 546, column: 35, scope: !949)
!1003 = !DILocation(line: 546, column: 15, scope: !949)
!1004 = !DILocation(line: 546, column: 43, scope: !949)
!1005 = !DILocation(line: 546, column: 13, scope: !949)
!1006 = !DILocation(line: 549, column: 6, scope: !1007)
!1007 = distinct !DILexicalBlock(scope: !949, file: !15, line: 549, column: 6)
!1008 = !DILocation(line: 549, column: 17, scope: !1007)
!1009 = !DILocation(line: 551, column: 3, scope: !1010)
!1010 = distinct !DILexicalBlock(scope: !1007, file: !15, line: 550, column: 2)
!1011 = !DILocation(line: 552, column: 3, scope: !1010)
!1012 = !DILocation(line: 555, column: 19, scope: !1013)
!1013 = distinct !DILexicalBlock(scope: !949, file: !15, line: 555, column: 6)
!1014 = !DILocation(line: 555, column: 6, scope: !1013)
!1015 = !DILocation(line: 555, column: 31, scope: !1013)
!1016 = !DILocation(line: 555, column: 46, scope: !1013)
!1017 = !DILocation(line: 555, column: 51, scope: !1013)
!1018 = !DILocation(line: 555, column: 67, scope: !1013)
!1019 = !DILocation(line: 555, column: 54, scope: !1013)
!1020 = !DILocation(line: 555, column: 79, scope: !1013)
!1021 = !DILocation(line: 555, column: 94, scope: !1013)
!1022 = !DILocation(line: 557, column: 3, scope: !1023)
!1023 = distinct !DILexicalBlock(scope: !1013, file: !15, line: 555, column: 100)
!1024 = !DILocation(line: 562, column: 15, scope: !1025)
!1025 = distinct !DILexicalBlock(scope: !949, file: !15, line: 562, column: 6)
!1026 = !DILocation(line: 562, column: 7, scope: !1025)
!1027 = !DILocation(line: 562, column: 27, scope: !1025)
!1028 = !DILocation(line: 562, column: 54, scope: !1025)
!1029 = !DILocation(line: 562, column: 46, scope: !1025)
!1030 = !DILocation(line: 562, column: 66, scope: !1025)
!1031 = !DILocation(line: 562, column: 44, scope: !1025)
!1032 = !DILocation(line: 562, column: 87, scope: !1025)
!1033 = !DILocation(line: 562, column: 113, scope: !1025)
!1034 = !DILocation(line: 562, column: 111, scope: !1025)
!1035 = !DILocation(line: 562, column: 83, scope: !1025)
!1036 = !DILocation(line: 564, column: 7, scope: !1037)
!1037 = distinct !DILexicalBlock(scope: !1038, file: !15, line: 564, column: 7)
!1038 = distinct !DILexicalBlock(scope: !1025, file: !15, line: 562, column: 132)
!1039 = !DILocation(line: 564, column: 20, scope: !1037)
!1040 = !DILocation(line: 564, column: 40, scope: !1037)
!1041 = !DILocation(line: 564, column: 18, scope: !1037)
!1042 = !DILocation(line: 566, column: 4, scope: !1043)
!1043 = distinct !DILexicalBlock(scope: !1037, file: !15, line: 565, column: 3)
!1044 = !DILocation(line: 567, column: 26, scope: !1043)
!1045 = !DILocation(line: 567, column: 24, scope: !1043)
!1046 = !DILocation(line: 568, column: 3, scope: !1043)
!1047 = !DILocation(line: 570, column: 3, scope: !1038)
!1048 = !DILocation(line: 573, column: 21, scope: !949)
!1049 = !DILocation(line: 573, column: 2, scope: !949)
!1050 = !DILocation(line: 573, column: 12, scope: !949)
!1051 = !DILocation(line: 573, column: 18, scope: !949)
!1052 = !DILocation(line: 575, column: 10, scope: !949)
!1053 = !DILocation(line: 575, column: 20, scope: !949)
!1054 = !DILocation(line: 575, column: 2, scope: !949)
!1055 = !DILocation(line: 578, column: 7, scope: !1056)
!1056 = distinct !DILexicalBlock(scope: !1057, file: !15, line: 578, column: 7)
!1057 = distinct !DILexicalBlock(scope: !949, file: !15, line: 576, column: 2)
!1058 = !DILocation(line: 578, column: 17, scope: !1056)
!1059 = !DILocation(line: 580, column: 15, scope: !1060)
!1060 = distinct !DILexicalBlock(scope: !1056, file: !15, line: 579, column: 3)
!1061 = !DILocation(line: 580, column: 13, scope: !1060)
!1062 = !DILocation(line: 581, column: 3, scope: !1060)
!1063 = !DILocation(line: 584, column: 40, scope: !1064)
!1064 = distinct !DILexicalBlock(scope: !1056, file: !15, line: 583, column: 3)
!1065 = !DILocation(line: 584, column: 55, scope: !1064)
!1066 = !DILocation(line: 584, column: 61, scope: !1064)
!1067 = !DILocation(line: 584, column: 71, scope: !1064)
!1068 = !DILocation(line: 584, column: 21, scope: !1064)
!1069 = !DILocation(line: 584, column: 19, scope: !1064)
!1070 = !DILocation(line: 585, column: 15, scope: !1064)
!1071 = !DILocation(line: 585, column: 30, scope: !1064)
!1072 = !DILocation(line: 585, column: 37, scope: !1064)
!1073 = !DILocation(line: 585, column: 46, scope: !1064)
!1074 = !DILocation(line: 585, column: 35, scope: !1064)
!1075 = !DILocation(line: 585, column: 50, scope: !1064)
!1076 = !DILocation(line: 585, column: 13, scope: !1064)
!1077 = !DILocation(line: 586, column: 8, scope: !1078)
!1078 = distinct !DILexicalBlock(scope: !1064, file: !15, line: 586, column: 8)
!1079 = !DILocation(line: 586, column: 19, scope: !1078)
!1080 = !DILocation(line: 586, column: 17, scope: !1078)
!1081 = !DILocation(line: 587, column: 16, scope: !1078)
!1082 = !DILocation(line: 587, column: 33, scope: !1078)
!1083 = !DILocation(line: 587, column: 31, scope: !1078)
!1084 = !DILocation(line: 587, column: 14, scope: !1078)
!1085 = !DILocation(line: 587, column: 5, scope: !1078)
!1086 = !DILocation(line: 588, column: 8, scope: !1087)
!1087 = distinct !DILexicalBlock(scope: !1064, file: !15, line: 588, column: 8)
!1088 = !DILocation(line: 588, column: 17, scope: !1087)
!1089 = !DILocation(line: 589, column: 31, scope: !1087)
!1090 = !DILocation(line: 589, column: 40, scope: !1087)
!1091 = !DILocation(line: 589, column: 29, scope: !1087)
!1092 = !DILocation(line: 589, column: 14, scope: !1087)
!1093 = !DILocation(line: 589, column: 5, scope: !1087)
!1094 = !DILocation(line: 594, column: 7, scope: !1095)
!1095 = distinct !DILexicalBlock(scope: !1057, file: !15, line: 594, column: 7)
!1096 = !DILocation(line: 594, column: 17, scope: !1095)
!1097 = !DILocation(line: 594, column: 25, scope: !1095)
!1098 = !DILocation(line: 594, column: 23, scope: !1095)
!1099 = !DILocalVariable(name: "count", scope: !1100, file: !15, line: 596, type: !5)
!1100 = distinct !DILexicalBlock(scope: !1095, file: !15, line: 595, column: 3)
!1101 = !DILocation(line: 596, column: 8, scope: !1100)
!1102 = !DILocalVariable(name: "i", scope: !1100, file: !15, line: 597, type: !5)
!1103 = !DILocation(line: 597, column: 8, scope: !1100)
!1104 = !DILocalVariable(name: "my_station_num", scope: !1100, file: !15, line: 597, type: !5)
!1105 = !DILocation(line: 597, column: 11, scope: !1100)
!1106 = !DILocation(line: 597, column: 28, scope: !1100)
!1107 = !DILocation(line: 597, column: 37, scope: !1100)
!1108 = !DILocalVariable(name: "obj", scope: !1100, file: !15, line: 598, type: !716)
!1109 = !DILocation(line: 598, column: 12, scope: !1100)
!1110 = !DILocation(line: 601, column: 11, scope: !1111)
!1111 = distinct !DILexicalBlock(scope: !1100, file: !15, line: 601, column: 4)
!1112 = !DILocation(line: 601, column: 9, scope: !1111)
!1113 = !DILocation(line: 601, column: 16, scope: !1114)
!1114 = distinct !DILexicalBlock(scope: !1111, file: !15, line: 601, column: 4)
!1115 = !DILocation(line: 601, column: 21, scope: !1114)
!1116 = !DILocation(line: 601, column: 18, scope: !1114)
!1117 = !DILocation(line: 601, column: 4, scope: !1111)
!1118 = !DILocation(line: 602, column: 17, scope: !1119)
!1119 = distinct !DILexicalBlock(scope: !1114, file: !15, line: 602, column: 9)
!1120 = !DILocation(line: 602, column: 9, scope: !1119)
!1121 = !DILocation(line: 602, column: 20, scope: !1119)
!1122 = !DILocation(line: 602, column: 25, scope: !1119)
!1123 = !DILocation(line: 605, column: 27, scope: !1124)
!1124 = distinct !DILexicalBlock(scope: !1119, file: !15, line: 605, column: 10)
!1125 = !DILocation(line: 605, column: 19, scope: !1124)
!1126 = !DILocation(line: 605, column: 30, scope: !1124)
!1127 = !DILocation(line: 605, column: 45, scope: !1124)
!1128 = !DILocation(line: 605, column: 18, scope: !1124)
!1129 = !DILocation(line: 605, column: 10, scope: !1124)
!1130 = !DILocation(line: 605, column: 56, scope: !1124)
!1131 = !DILocation(line: 605, column: 53, scope: !1124)
!1132 = !DILocation(line: 606, column: 12, scope: !1124)
!1133 = !DILocation(line: 606, column: 7, scope: !1124)
!1134 = !DILocation(line: 602, column: 28, scope: !1119)
!1135 = !DILocation(line: 601, column: 44, scope: !1114)
!1136 = !DILocation(line: 601, column: 4, scope: !1114)
!1137 = distinct !{!1137, !1117, !1138, !363}
!1138 = !DILocation(line: 606, column: 12, scope: !1111)
!1139 = !DILocation(line: 607, column: 8, scope: !1140)
!1140 = distinct !DILexicalBlock(scope: !1100, file: !15, line: 607, column: 8)
!1141 = !DILocation(line: 607, column: 16, scope: !1140)
!1142 = !DILocation(line: 607, column: 33, scope: !1140)
!1143 = !DILocation(line: 607, column: 14, scope: !1140)
!1144 = !DILocation(line: 609, column: 5, scope: !1145)
!1145 = distinct !DILexicalBlock(scope: !1140, file: !15, line: 608, column: 4)
!1146 = !DILocation(line: 610, column: 5, scope: !1145)
!1147 = !DILocation(line: 610, column: 15, scope: !1145)
!1148 = !DILocation(line: 610, column: 21, scope: !1145)
!1149 = !DILocation(line: 611, column: 5, scope: !1145)
!1150 = !DILocation(line: 615, column: 10, scope: !1100)
!1151 = !DILocation(line: 616, column: 13, scope: !1100)
!1152 = !DILocation(line: 616, column: 23, scope: !1100)
!1153 = !DILocation(line: 616, column: 11, scope: !1100)
!1154 = !DILocation(line: 617, column: 27, scope: !1155)
!1155 = distinct !DILexicalBlock(scope: !1100, file: !15, line: 617, column: 4)
!1156 = !DILocation(line: 617, column: 18, scope: !1155)
!1157 = !DILocation(line: 617, column: 35, scope: !1155)
!1158 = !DILocation(line: 617, column: 16, scope: !1155)
!1159 = !DILocation(line: 617, column: 9, scope: !1155)
!1160 = !DILocation(line: 617, column: 44, scope: !1161)
!1161 = distinct !DILexicalBlock(scope: !1155, file: !15, line: 617, column: 4)
!1162 = !DILocation(line: 617, column: 51, scope: !1161)
!1163 = !DILocation(line: 617, column: 4, scope: !1155)
!1164 = !DILocation(line: 619, column: 10, scope: !1165)
!1165 = distinct !DILexicalBlock(scope: !1161, file: !15, line: 618, column: 4)
!1166 = !DILocation(line: 620, column: 9, scope: !1167)
!1167 = distinct !DILexicalBlock(scope: !1165, file: !15, line: 620, column: 9)
!1168 = !DILocation(line: 620, column: 15, scope: !1167)
!1169 = !DILocation(line: 622, column: 6, scope: !1170)
!1170 = distinct !DILexicalBlock(scope: !1167, file: !15, line: 621, column: 5)
!1171 = !DILocation(line: 623, column: 6, scope: !1170)
!1172 = !DILocation(line: 624, column: 6, scope: !1170)
!1173 = !DILocation(line: 626, column: 17, scope: !1174)
!1174 = distinct !DILexicalBlock(scope: !1165, file: !15, line: 626, column: 9)
!1175 = !DILocation(line: 626, column: 9, scope: !1174)
!1176 = !DILocation(line: 626, column: 25, scope: !1174)
!1177 = !DILocation(line: 626, column: 30, scope: !1174)
!1178 = !DILocation(line: 628, column: 56, scope: !1179)
!1179 = distinct !DILexicalBlock(scope: !1174, file: !15, line: 627, column: 5)
!1180 = !DILocation(line: 628, column: 48, scope: !1179)
!1181 = !DILocation(line: 628, column: 6, scope: !1179)
!1182 = !DILocation(line: 629, column: 24, scope: !1179)
!1183 = !DILocation(line: 629, column: 33, scope: !1179)
!1184 = !DILocation(line: 629, column: 6, scope: !1179)
!1185 = !DILocation(line: 629, column: 16, scope: !1179)
!1186 = !DILocation(line: 629, column: 22, scope: !1179)
!1187 = !DILocation(line: 630, column: 6, scope: !1179)
!1188 = !DILocation(line: 632, column: 22, scope: !1189)
!1189 = distinct !DILexicalBlock(scope: !1174, file: !15, line: 632, column: 14)
!1190 = !DILocation(line: 632, column: 14, scope: !1189)
!1191 = !DILocation(line: 632, column: 30, scope: !1189)
!1192 = !DILocation(line: 632, column: 35, scope: !1189)
!1193 = !DILocation(line: 634, column: 57, scope: !1194)
!1194 = distinct !DILexicalBlock(scope: !1189, file: !15, line: 633, column: 5)
!1195 = !DILocation(line: 634, column: 49, scope: !1194)
!1196 = !DILocation(line: 634, column: 6, scope: !1194)
!1197 = !DILocation(line: 635, column: 24, scope: !1194)
!1198 = !DILocation(line: 635, column: 33, scope: !1194)
!1199 = !DILocation(line: 635, column: 6, scope: !1194)
!1200 = !DILocation(line: 635, column: 16, scope: !1194)
!1201 = !DILocation(line: 635, column: 22, scope: !1194)
!1202 = !DILocation(line: 636, column: 6, scope: !1194)
!1203 = !DILocation(line: 638, column: 4, scope: !1165)
!1204 = !DILocation(line: 617, column: 75, scope: !1161)
!1205 = !DILocation(line: 617, column: 67, scope: !1161)
!1206 = !DILocation(line: 617, column: 83, scope: !1161)
!1207 = !DILocation(line: 617, column: 65, scope: !1161)
!1208 = !DILocation(line: 617, column: 4, scope: !1161)
!1209 = distinct !{!1209, !1163, !1210, !363}
!1210 = !DILocation(line: 638, column: 4, scope: !1155)
!1211 = !DILocation(line: 640, column: 54, scope: !1100)
!1212 = !DILocation(line: 640, column: 64, scope: !1100)
!1213 = !DILocation(line: 640, column: 45, scope: !1100)
!1214 = !DILocation(line: 640, column: 4, scope: !1100)
!1215 = !DILocation(line: 642, column: 34, scope: !1100)
!1216 = !DILocation(line: 642, column: 44, scope: !1100)
!1217 = !DILocation(line: 642, column: 69, scope: !1100)
!1218 = !DILocation(line: 642, column: 10, scope: !1100)
!1219 = !DILocation(line: 642, column: 8, scope: !1100)
!1220 = !DILocation(line: 644, column: 8, scope: !1221)
!1221 = distinct !DILexicalBlock(scope: !1100, file: !15, line: 644, column: 8)
!1222 = !DILocation(line: 645, column: 34, scope: !1221)
!1223 = !DILocation(line: 645, column: 39, scope: !1221)
!1224 = !DILocation(line: 645, column: 57, scope: !1221)
!1225 = !DILocation(line: 645, column: 67, scope: !1221)
!1226 = !DILocation(line: 645, column: 48, scope: !1221)
!1227 = !DILocation(line: 645, column: 5, scope: !1221)
!1228 = !DILocation(line: 647, column: 36, scope: !1229)
!1229 = distinct !DILexicalBlock(scope: !1100, file: !15, line: 647, column: 8)
!1230 = !DILocation(line: 647, column: 8, scope: !1229)
!1231 = !DILocation(line: 647, column: 46, scope: !1229)
!1232 = !DILocation(line: 649, column: 56, scope: !1233)
!1233 = distinct !DILexicalBlock(scope: !1229, file: !15, line: 648, column: 4)
!1234 = !DILocation(line: 649, column: 28, scope: !1233)
!1235 = !DILocation(line: 649, column: 67, scope: !1233)
!1236 = !DILocation(line: 649, column: 77, scope: !1233)
!1237 = !DILocation(line: 649, column: 5, scope: !1233)
!1238 = !DILocation(line: 650, column: 4, scope: !1233)
!1239 = !DILocation(line: 651, column: 4, scope: !1100)
!1240 = !DILocation(line: 651, column: 14, scope: !1100)
!1241 = !DILocation(line: 651, column: 19, scope: !1100)
!1242 = !DILocation(line: 652, column: 4, scope: !1100)
!1243 = !DILocation(line: 652, column: 14, scope: !1100)
!1244 = !DILocation(line: 652, column: 20, scope: !1100)
!1245 = !DILocation(line: 654, column: 3, scope: !1100)
!1246 = !DILocation(line: 655, column: 3, scope: !1057)
!1247 = !DILocation(line: 657, column: 7, scope: !1248)
!1248 = distinct !DILexicalBlock(scope: !1057, file: !15, line: 657, column: 7)
!1249 = !DILocation(line: 657, column: 17, scope: !1248)
!1250 = !DILocation(line: 657, column: 54, scope: !1248)
!1251 = !DILocation(line: 657, column: 64, scope: !1248)
!1252 = !DILocation(line: 657, column: 23, scope: !1248)
!1253 = !DILocation(line: 659, column: 26, scope: !1254)
!1254 = distinct !DILexicalBlock(scope: !1248, file: !15, line: 657, column: 70)
!1255 = !DILocation(line: 659, column: 4, scope: !1254)
!1256 = !DILocation(line: 659, column: 14, scope: !1254)
!1257 = !DILocation(line: 659, column: 23, scope: !1254)
!1258 = !DILocation(line: 660, column: 4, scope: !1254)
!1259 = !DILocation(line: 660, column: 14, scope: !1254)
!1260 = !DILocation(line: 660, column: 19, scope: !1254)
!1261 = !DILocation(line: 662, column: 4, scope: !1254)
!1262 = !DILocation(line: 662, column: 14, scope: !1254)
!1263 = !DILocation(line: 662, column: 20, scope: !1254)
!1264 = !DILocation(line: 663, column: 54, scope: !1254)
!1265 = !DILocation(line: 663, column: 64, scope: !1254)
!1266 = !DILocation(line: 663, column: 45, scope: !1254)
!1267 = !DILocation(line: 663, column: 4, scope: !1254)
!1268 = !DILocation(line: 666, column: 21, scope: !1269)
!1269 = distinct !DILexicalBlock(scope: !1254, file: !15, line: 666, column: 8)
!1270 = !DILocation(line: 666, column: 8, scope: !1269)
!1271 = !DILocation(line: 666, column: 33, scope: !1269)
!1272 = !DILocation(line: 666, column: 48, scope: !1269)
!1273 = !DILocation(line: 666, column: 53, scope: !1269)
!1274 = !DILocation(line: 666, column: 69, scope: !1269)
!1275 = !DILocation(line: 666, column: 56, scope: !1269)
!1276 = !DILocation(line: 666, column: 81, scope: !1269)
!1277 = !DILocation(line: 666, column: 96, scope: !1269)
!1278 = !DILocalVariable(name: "type", scope: !1279, file: !15, line: 667, type: !5)
!1279 = distinct !DILexicalBlock(scope: !1269, file: !15, line: 666, column: 102)
!1280 = !DILocation(line: 667, column: 9, scope: !1279)
!1281 = !DILocalVariable(name: "flags", scope: !1279, file: !15, line: 668, type: !257)
!1282 = !DILocation(line: 668, column: 14, scope: !1279)
!1283 = !DILocalVariable(name: "legal_types", scope: !1279, file: !15, line: 669, type: !1284)
!1284 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 512, elements: !1285)
!1285 = !{!1286}
!1286 = !DISubrange(count: 64)
!1287 = !DILocation(line: 669, column: 12, scope: !1279)
!1288 = !DILocalVariable(name: "num_types", scope: !1279, file: !15, line: 670, type: !5)
!1289 = !DILocation(line: 670, column: 9, scope: !1279)
!1290 = !DILocalVariable(name: "robot_index", scope: !1279, file: !15, line: 670, type: !5)
!1291 = !DILocation(line: 670, column: 20, scope: !1279)
!1292 = !DILocalVariable(name: "i", scope: !1279, file: !15, line: 670, type: !5)
!1293 = !DILocation(line: 670, column: 33, scope: !1279)
!1294 = !DILocation(line: 672, column: 15, scope: !1279)
!1295 = !DILocation(line: 673, column: 12, scope: !1296)
!1296 = distinct !DILexicalBlock(scope: !1279, file: !15, line: 673, column: 5)
!1297 = !DILocation(line: 673, column: 10, scope: !1296)
!1298 = !DILocation(line: 673, column: 17, scope: !1299)
!1299 = distinct !DILexicalBlock(scope: !1296, file: !15, line: 673, column: 5)
!1300 = !DILocation(line: 673, column: 19, scope: !1299)
!1301 = !DILocation(line: 673, column: 5, scope: !1296)
!1302 = !DILocation(line: 674, column: 20, scope: !1303)
!1303 = distinct !DILexicalBlock(scope: !1299, file: !15, line: 673, column: 29)
!1304 = !DILocation(line: 674, column: 22, scope: !1303)
!1305 = !DILocation(line: 674, column: 18, scope: !1303)
!1306 = !DILocation(line: 675, column: 27, scope: !1303)
!1307 = !DILocation(line: 675, column: 14, scope: !1303)
!1308 = !DILocation(line: 675, column: 39, scope: !1303)
!1309 = !DILocation(line: 675, column: 51, scope: !1303)
!1310 = !DILocation(line: 675, column: 12, scope: !1303)
!1311 = !DILocation(line: 676, column: 6, scope: !1303)
!1312 = !DILocation(line: 676, column: 13, scope: !1303)
!1313 = !DILocation(line: 677, column: 11, scope: !1314)
!1314 = distinct !DILexicalBlock(scope: !1315, file: !15, line: 677, column: 11)
!1315 = distinct !DILexicalBlock(scope: !1303, file: !15, line: 676, column: 20)
!1316 = !DILocation(line: 677, column: 17, scope: !1314)
!1317 = !DILocation(line: 678, column: 35, scope: !1314)
!1318 = !DILocation(line: 678, column: 29, scope: !1314)
!1319 = !DILocation(line: 678, column: 8, scope: !1314)
!1320 = !DILocation(line: 678, column: 33, scope: !1314)
!1321 = !DILocation(line: 679, column: 13, scope: !1315)
!1322 = !DILocation(line: 680, column: 18, scope: !1315)
!1323 = distinct !{!1323, !1311, !1324, !363}
!1324 = !DILocation(line: 681, column: 6, scope: !1303)
!1325 = !DILocation(line: 682, column: 5, scope: !1303)
!1326 = !DILocation(line: 673, column: 25, scope: !1299)
!1327 = !DILocation(line: 673, column: 5, scope: !1299)
!1328 = distinct !{!1328, !1301, !1329, !363}
!1329 = !DILocation(line: 682, column: 5, scope: !1296)
!1330 = !DILocation(line: 689, column: 9, scope: !1331)
!1331 = distinct !DILexicalBlock(scope: !1279, file: !15, line: 689, column: 9)
!1332 = !DILocation(line: 689, column: 19, scope: !1331)
!1333 = !DILocation(line: 690, column: 13, scope: !1331)
!1334 = !DILocation(line: 690, column: 11, scope: !1331)
!1335 = !DILocation(line: 690, column: 6, scope: !1331)
!1336 = !DILocation(line: 692, column: 26, scope: !1331)
!1337 = !DILocation(line: 692, column: 37, scope: !1331)
!1338 = !DILocation(line: 692, column: 35, scope: !1331)
!1339 = !DILocation(line: 692, column: 48, scope: !1331)
!1340 = !DILocation(line: 692, column: 13, scope: !1331)
!1341 = !DILocation(line: 692, column: 11, scope: !1331)
!1342 = !DILocation(line: 694, column: 5, scope: !1279)
!1343 = !DILocation(line: 695, column: 40, scope: !1279)
!1344 = !DILocation(line: 695, column: 50, scope: !1279)
!1345 = !DILocation(line: 695, column: 31, scope: !1279)
!1346 = !DILocation(line: 695, column: 76, scope: !1279)
!1347 = !DILocation(line: 695, column: 11, scope: !1279)
!1348 = !DILocation(line: 695, column: 9, scope: !1279)
!1349 = !DILocation(line: 696, column: 9, scope: !1350)
!1350 = distinct !DILexicalBlock(scope: !1279, file: !15, line: 696, column: 9)
!1351 = !DILocation(line: 696, column: 13, scope: !1350)
!1352 = !DILocation(line: 703, column: 28, scope: !1353)
!1353 = distinct !DILexicalBlock(scope: !1350, file: !15, line: 696, column: 22)
!1354 = !DILocation(line: 703, column: 37, scope: !1353)
!1355 = !DILocation(line: 703, column: 47, scope: !1353)
!1356 = !DILocation(line: 703, column: 6, scope: !1353)
!1357 = !DILocation(line: 703, column: 11, scope: !1353)
!1358 = !DILocation(line: 703, column: 26, scope: !1353)
!1359 = !DILocation(line: 706, column: 30, scope: !1353)
!1360 = !DILocation(line: 706, column: 45, scope: !1353)
!1361 = !DILocation(line: 706, column: 51, scope: !1353)
!1362 = !DILocation(line: 706, column: 56, scope: !1353)
!1363 = !DILocation(line: 706, column: 6, scope: !1353)
!1364 = !DILocation(line: 707, column: 26, scope: !1353)
!1365 = !DILocation(line: 707, column: 31, scope: !1353)
!1366 = !DILocation(line: 707, column: 52, scope: !1353)
!1367 = !DILocation(line: 707, column: 57, scope: !1353)
!1368 = !DILocation(line: 707, column: 64, scope: !1353)
!1369 = !DILocation(line: 707, column: 6, scope: !1353)
!1370 = !DILocation(line: 709, column: 18, scope: !1353)
!1371 = !DILocation(line: 709, column: 6, scope: !1353)
!1372 = !DILocation(line: 712, column: 5, scope: !1353)
!1373 = !DILocation(line: 714, column: 6, scope: !1350)
!1374 = !DILocation(line: 716, column: 4, scope: !1279)
!1375 = !DILocation(line: 718, column: 3, scope: !1254)
!1376 = !DILocation(line: 719, column: 3, scope: !1057)
!1377 = !DILocation(line: 721, column: 3, scope: !1057)
!1378 = !DILocation(line: 721, column: 13, scope: !1057)
!1379 = !DILocation(line: 721, column: 18, scope: !1057)
!1380 = !DILocation(line: 722, column: 3, scope: !1057)
!1381 = !DILocation(line: 722, column: 13, scope: !1057)
!1382 = !DILocation(line: 722, column: 19, scope: !1057)
!1383 = !DILocation(line: 723, column: 2, scope: !1057)
!1384 = !DILocation(line: 724, column: 1, scope: !949)
!1385 = distinct !DISubprogram(name: "fuelcen_update_all", linkageName: "_Z18fuelcen_update_allv", scope: !15, file: !15, line: 731, type: !343, scopeLine: 732, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !213)
!1386 = !DILocalVariable(name: "i", scope: !1385, file: !15, line: 733, type: !5)
!1387 = !DILocation(line: 733, column: 6, scope: !1385)
!1388 = !DILocalVariable(name: "AmountToreplenish", scope: !1385, file: !15, line: 734, type: !16)
!1389 = !DILocation(line: 734, column: 6, scope: !1385)
!1390 = !DILocation(line: 736, column: 29, scope: !1385)
!1391 = !DILocation(line: 736, column: 40, scope: !1385)
!1392 = !DILocation(line: 736, column: 22, scope: !1385)
!1393 = !DILocation(line: 736, column: 20, scope: !1385)
!1394 = !DILocation(line: 738, column: 9, scope: !1395)
!1395 = distinct !DILexicalBlock(scope: !1385, file: !15, line: 738, column: 2)
!1396 = !DILocation(line: 738, column: 7, scope: !1395)
!1397 = !DILocation(line: 738, column: 14, scope: !1398)
!1398 = distinct !DILexicalBlock(scope: !1395, file: !15, line: 738, column: 2)
!1399 = !DILocation(line: 738, column: 18, scope: !1398)
!1400 = !DILocation(line: 738, column: 16, scope: !1398)
!1401 = !DILocation(line: 738, column: 2, scope: !1395)
!1402 = !DILocation(line: 739, column: 15, scope: !1403)
!1403 = distinct !DILexicalBlock(scope: !1404, file: !15, line: 739, column: 7)
!1404 = distinct !DILexicalBlock(scope: !1398, file: !15, line: 738, column: 40)
!1405 = !DILocation(line: 739, column: 7, scope: !1403)
!1406 = !DILocation(line: 739, column: 18, scope: !1403)
!1407 = !DILocation(line: 739, column: 23, scope: !1403)
!1408 = !DILocation(line: 740, column: 10, scope: !1409)
!1409 = distinct !DILexicalBlock(scope: !1410, file: !15, line: 740, column: 8)
!1410 = distinct !DILexicalBlock(scope: !1403, file: !15, line: 739, column: 49)
!1411 = !DILocation(line: 740, column: 25, scope: !1409)
!1412 = !DILocation(line: 740, column: 9, scope: !1409)
!1413 = !DILocation(line: 740, column: 8, scope: !1409)
!1414 = !DILocation(line: 741, column: 30, scope: !1409)
!1415 = !DILocation(line: 741, column: 22, scope: !1409)
!1416 = !DILocation(line: 741, column: 5, scope: !1409)
!1417 = !DILocation(line: 742, column: 3, scope: !1410)
!1418 = !DILocation(line: 743, column: 20, scope: !1419)
!1419 = distinct !DILexicalBlock(scope: !1403, file: !15, line: 743, column: 12)
!1420 = !DILocation(line: 743, column: 12, scope: !1419)
!1421 = !DILocation(line: 743, column: 23, scope: !1419)
!1422 = !DILocation(line: 743, column: 28, scope: !1419)
!1423 = !DILocation(line: 746, column: 3, scope: !1424)
!1424 = distinct !DILexicalBlock(scope: !1419, file: !15, line: 743, column: 54)
!1425 = !DILocation(line: 747, column: 21, scope: !1426)
!1426 = distinct !DILexicalBlock(scope: !1419, file: !15, line: 747, column: 12)
!1427 = !DILocation(line: 747, column: 13, scope: !1426)
!1428 = !DILocation(line: 747, column: 24, scope: !1426)
!1429 = !DILocation(line: 747, column: 36, scope: !1426)
!1430 = !DILocation(line: 747, column: 41, scope: !1426)
!1431 = !DILocation(line: 747, column: 45, scope: !1426)
!1432 = !DILocation(line: 747, column: 80, scope: !1426)
!1433 = !DILocation(line: 747, column: 72, scope: !1426)
!1434 = !DILocation(line: 747, column: 83, scope: !1426)
!1435 = !DILocation(line: 747, column: 63, scope: !1426)
!1436 = !DILocation(line: 747, column: 59, scope: !1426)
!1437 = !DILocation(line: 748, column: 16, scope: !1438)
!1438 = distinct !DILexicalBlock(scope: !1439, file: !15, line: 748, column: 8)
!1439 = distinct !DILexicalBlock(scope: !1426, file: !15, line: 747, column: 93)
!1440 = !DILocation(line: 748, column: 8, scope: !1438)
!1441 = !DILocation(line: 748, column: 19, scope: !1438)
!1442 = !DILocation(line: 748, column: 38, scope: !1438)
!1443 = !DILocation(line: 748, column: 30, scope: !1438)
!1444 = !DILocation(line: 748, column: 41, scope: !1438)
!1445 = !DILocation(line: 748, column: 28, scope: !1438)
!1446 = !DILocation(line: 749, column: 28, scope: !1447)
!1447 = distinct !DILexicalBlock(scope: !1438, file: !15, line: 748, column: 54)
!1448 = !DILocation(line: 749, column: 13, scope: !1447)
!1449 = !DILocation(line: 749, column: 5, scope: !1447)
!1450 = !DILocation(line: 749, column: 16, scope: !1447)
!1451 = !DILocation(line: 749, column: 25, scope: !1447)
!1452 = !DILocation(line: 751, column: 17, scope: !1453)
!1453 = distinct !DILexicalBlock(scope: !1447, file: !15, line: 751, column: 9)
!1454 = !DILocation(line: 751, column: 9, scope: !1453)
!1455 = !DILocation(line: 751, column: 20, scope: !1453)
!1456 = !DILocation(line: 751, column: 40, scope: !1453)
!1457 = !DILocation(line: 751, column: 32, scope: !1453)
!1458 = !DILocation(line: 751, column: 43, scope: !1453)
!1459 = !DILocation(line: 751, column: 29, scope: !1453)
!1460 = !DILocation(line: 752, column: 36, scope: !1461)
!1461 = distinct !DILexicalBlock(scope: !1453, file: !15, line: 751, column: 56)
!1462 = !DILocation(line: 752, column: 28, scope: !1461)
!1463 = !DILocation(line: 752, column: 39, scope: !1461)
!1464 = !DILocation(line: 752, column: 14, scope: !1461)
!1465 = !DILocation(line: 752, column: 6, scope: !1461)
!1466 = !DILocation(line: 752, column: 17, scope: !1461)
!1467 = !DILocation(line: 752, column: 26, scope: !1461)
!1468 = !DILocation(line: 754, column: 5, scope: !1461)
!1469 = !DILocation(line: 755, column: 4, scope: !1447)
!1470 = !DILocation(line: 756, column: 3, scope: !1439)
!1471 = !DILocation(line: 757, column: 2, scope: !1404)
!1472 = !DILocation(line: 738, column: 36, scope: !1398)
!1473 = !DILocation(line: 738, column: 2, scope: !1398)
!1474 = distinct !{!1474, !1401, !1475, !363}
!1475 = !DILocation(line: 757, column: 2, scope: !1395)
!1476 = !DILocation(line: 758, column: 1, scope: !1385)
!1477 = distinct !DISubprogram(name: "fixmul", linkageName: "_Z6fixmulii", scope: !17, file: !17, line: 83, type: !1478, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !213)
!1478 = !DISubroutineType(types: !1479)
!1479 = !{!16, !16, !16}
!1480 = !DILocalVariable(name: "a", arg: 1, scope: !1477, file: !17, line: 83, type: !16)
!1481 = !DILocation(line: 83, column: 26, scope: !1477)
!1482 = !DILocalVariable(name: "b", arg: 2, scope: !1477, file: !17, line: 83, type: !16)
!1483 = !DILocation(line: 83, column: 33, scope: !1477)
!1484 = !DILocation(line: 85, column: 19, scope: !1477)
!1485 = !DILocation(line: 85, column: 32, scope: !1477)
!1486 = !DILocation(line: 85, column: 21, scope: !1477)
!1487 = !DILocation(line: 85, column: 35, scope: !1477)
!1488 = !DILocation(line: 85, column: 9, scope: !1477)
!1489 = !DILocation(line: 85, column: 2, scope: !1477)
!1490 = !DILocalVariable(name: "segp", arg: 1, scope: !210, file: !15, line: 776, type: !74)
!1491 = !DILocation(line: 776, column: 32, scope: !210)
!1492 = !DILocalVariable(name: "MaxAmountCanTake", arg: 2, scope: !210, file: !15, line: 776, type: !16)
!1493 = !DILocation(line: 776, column: 42, scope: !210)
!1494 = !DILocalVariable(name: "seg2p", scope: !210, file: !15, line: 778, type: !409)
!1495 = !DILocation(line: 778, column: 12, scope: !210)
!1496 = !DILocation(line: 778, column: 31, scope: !210)
!1497 = !DILocation(line: 778, column: 36, scope: !210)
!1498 = !DILocation(line: 778, column: 21, scope: !210)
!1499 = !DILocation(line: 782, column: 2, scope: !210)
!1500 = !DILocation(line: 784, column: 18, scope: !210)
!1501 = !DILocation(line: 784, column: 16, scope: !210)
!1502 = !DILocation(line: 786, column: 7, scope: !1503)
!1503 = distinct !DILexicalBlock(scope: !210, file: !15, line: 786, column: 6)
!1504 = !DILocation(line: 786, column: 6, scope: !1503)
!1505 = !DILocation(line: 786, column: 13, scope: !1503)
!1506 = !DILocation(line: 786, column: 17, scope: !1503)
!1507 = !DILocation(line: 786, column: 24, scope: !1503)
!1508 = !DILocation(line: 786, column: 32, scope: !1503)
!1509 = !DILocalVariable(name: "amount", scope: !1510, file: !15, line: 787, type: !16)
!1510 = distinct !DILexicalBlock(scope: !1503, file: !15, line: 786, column: 56)
!1511 = !DILocation(line: 787, column: 7, scope: !1510)
!1512 = !DILocation(line: 789, column: 3, scope: !1510)
!1513 = !DILocation(line: 801, column: 7, scope: !1514)
!1514 = distinct !DILexicalBlock(scope: !1510, file: !15, line: 801, column: 7)
!1515 = !DILocation(line: 801, column: 24, scope: !1514)
!1516 = !DILocation(line: 803, column: 4, scope: !1517)
!1517 = distinct !DILexicalBlock(scope: !1514, file: !15, line: 801, column: 30)
!1518 = !DILocation(line: 806, column: 19, scope: !1510)
!1519 = !DILocation(line: 806, column: 30, scope: !1510)
!1520 = !DILocation(line: 806, column: 12, scope: !1510)
!1521 = !DILocation(line: 806, column: 10, scope: !1510)
!1522 = !DILocation(line: 808, column: 7, scope: !1523)
!1523 = distinct !DILexicalBlock(scope: !1510, file: !15, line: 808, column: 7)
!1524 = !DILocation(line: 808, column: 16, scope: !1523)
!1525 = !DILocation(line: 808, column: 14, scope: !1523)
!1526 = !DILocation(line: 809, column: 13, scope: !1523)
!1527 = !DILocation(line: 809, column: 11, scope: !1523)
!1528 = !DILocation(line: 809, column: 4, scope: !1523)
!1529 = !DILocation(line: 819, column: 7, scope: !1530)
!1530 = distinct !DILexicalBlock(scope: !1510, file: !15, line: 819, column: 7)
!1531 = !DILocation(line: 819, column: 24, scope: !1530)
!1532 = !DILocation(line: 819, column: 22, scope: !1530)
!1533 = !DILocation(line: 820, column: 19, scope: !1530)
!1534 = !DILocation(line: 820, column: 4, scope: !1530)
!1535 = !DILocation(line: 822, column: 7, scope: !1536)
!1536 = distinct !DILexicalBlock(scope: !1510, file: !15, line: 822, column: 7)
!1537 = !DILocation(line: 822, column: 18, scope: !1536)
!1538 = !DILocation(line: 822, column: 33, scope: !1536)
!1539 = !DILocation(line: 822, column: 16, scope: !1536)
!1540 = !DILocation(line: 824, column: 4, scope: !1541)
!1541 = distinct !DILexicalBlock(scope: !1536, file: !15, line: 822, column: 56)
!1542 = !DILocation(line: 830, column: 21, scope: !1541)
!1543 = !DILocation(line: 830, column: 19, scope: !1541)
!1544 = !DILocation(line: 831, column: 3, scope: !1541)
!1545 = !DILocation(line: 835, column: 10, scope: !1510)
!1546 = !DILocation(line: 835, column: 3, scope: !1510)
!1547 = !DILocation(line: 839, column: 3, scope: !1548)
!1548 = distinct !DILexicalBlock(scope: !1503, file: !15, line: 838, column: 7)
!1549 = !DILocation(line: 841, column: 1, scope: !210)
!1550 = distinct !DISubprogram(name: "disable_matcens", linkageName: "_Z15disable_matcensv", scope: !15, file: !15, line: 1171, type: !343, scopeLine: 1172, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !213)
!1551 = !DILocalVariable(name: "i", scope: !1550, file: !15, line: 1173, type: !5)
!1552 = !DILocation(line: 1173, column: 6, scope: !1550)
!1553 = !DILocation(line: 1175, column: 9, scope: !1554)
!1554 = distinct !DILexicalBlock(scope: !1550, file: !15, line: 1175, column: 2)
!1555 = !DILocation(line: 1175, column: 7, scope: !1554)
!1556 = !DILocation(line: 1175, column: 14, scope: !1557)
!1557 = distinct !DILexicalBlock(scope: !1554, file: !15, line: 1175, column: 2)
!1558 = !DILocation(line: 1175, column: 18, scope: !1557)
!1559 = !DILocation(line: 1175, column: 16, scope: !1557)
!1560 = !DILocation(line: 1175, column: 2, scope: !1554)
!1561 = !DILocation(line: 1176, column: 11, scope: !1562)
!1562 = distinct !DILexicalBlock(scope: !1557, file: !15, line: 1175, column: 42)
!1563 = !DILocation(line: 1176, column: 3, scope: !1562)
!1564 = !DILocation(line: 1176, column: 14, scope: !1562)
!1565 = !DILocation(line: 1176, column: 22, scope: !1562)
!1566 = !DILocation(line: 1177, column: 11, scope: !1562)
!1567 = !DILocation(line: 1177, column: 3, scope: !1562)
!1568 = !DILocation(line: 1177, column: 14, scope: !1562)
!1569 = !DILocation(line: 1177, column: 27, scope: !1562)
!1570 = !DILocation(line: 1178, column: 2, scope: !1562)
!1571 = !DILocation(line: 1175, column: 38, scope: !1557)
!1572 = !DILocation(line: 1175, column: 2, scope: !1557)
!1573 = distinct !{!1573, !1560, !1574, !363}
!1574 = !DILocation(line: 1178, column: 2, scope: !1554)
!1575 = !DILocation(line: 1179, column: 1, scope: !1550)
!1576 = distinct !DISubprogram(name: "init_all_matcens", linkageName: "_Z16init_all_matcensv", scope: !15, file: !15, line: 1184, type: !343, scopeLine: 1185, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !213)
!1577 = !DILocalVariable(name: "i", scope: !1576, file: !15, line: 1186, type: !5)
!1578 = !DILocation(line: 1186, column: 6, scope: !1576)
!1579 = !DILocation(line: 1188, column: 9, scope: !1580)
!1580 = distinct !DILexicalBlock(scope: !1576, file: !15, line: 1188, column: 2)
!1581 = !DILocation(line: 1188, column: 7, scope: !1580)
!1582 = !DILocation(line: 1188, column: 14, scope: !1583)
!1583 = distinct !DILexicalBlock(scope: !1580, file: !15, line: 1188, column: 2)
!1584 = !DILocation(line: 1188, column: 18, scope: !1583)
!1585 = !DILocation(line: 1188, column: 16, scope: !1583)
!1586 = !DILocation(line: 1188, column: 2, scope: !1580)
!1587 = !DILocation(line: 1189, column: 15, scope: !1588)
!1588 = distinct !DILexicalBlock(scope: !1583, file: !15, line: 1189, column: 7)
!1589 = !DILocation(line: 1189, column: 7, scope: !1588)
!1590 = !DILocation(line: 1189, column: 18, scope: !1588)
!1591 = !DILocation(line: 1189, column: 23, scope: !1588)
!1592 = !DILocation(line: 1190, column: 12, scope: !1593)
!1593 = distinct !DILexicalBlock(scope: !1588, file: !15, line: 1189, column: 49)
!1594 = !DILocation(line: 1190, column: 4, scope: !1593)
!1595 = !DILocation(line: 1190, column: 15, scope: !1593)
!1596 = !DILocation(line: 1190, column: 21, scope: !1593)
!1597 = !DILocation(line: 1191, column: 12, scope: !1593)
!1598 = !DILocation(line: 1191, column: 4, scope: !1593)
!1599 = !DILocation(line: 1191, column: 15, scope: !1593)
!1600 = !DILocation(line: 1191, column: 23, scope: !1593)
!1601 = !DILocation(line: 1192, column: 12, scope: !1593)
!1602 = !DILocation(line: 1192, column: 4, scope: !1593)
!1603 = !DILocation(line: 1192, column: 15, scope: !1593)
!1604 = !DILocation(line: 1192, column: 28, scope: !1593)
!1605 = !DILocalVariable(name: "j", scope: !1606, file: !15, line: 1196, type: !5)
!1606 = distinct !DILexicalBlock(scope: !1593, file: !15, line: 1194, column: 4)
!1607 = !DILocation(line: 1196, column: 9, scope: !1606)
!1608 = !DILocation(line: 1197, column: 12, scope: !1609)
!1609 = distinct !DILexicalBlock(scope: !1606, file: !15, line: 1197, column: 5)
!1610 = !DILocation(line: 1197, column: 10, scope: !1609)
!1611 = !DILocation(line: 1197, column: 17, scope: !1612)
!1612 = distinct !DILexicalBlock(scope: !1609, file: !15, line: 1197, column: 5)
!1613 = !DILocation(line: 1197, column: 21, scope: !1612)
!1614 = !DILocation(line: 1197, column: 19, scope: !1612)
!1615 = !DILocation(line: 1197, column: 5, scope: !1609)
!1616 = !DILocation(line: 1198, column: 23, scope: !1617)
!1617 = distinct !DILexicalBlock(scope: !1618, file: !15, line: 1198, column: 10)
!1618 = distinct !DILexicalBlock(scope: !1612, file: !15, line: 1197, column: 45)
!1619 = !DILocation(line: 1198, column: 10, scope: !1617)
!1620 = !DILocation(line: 1198, column: 26, scope: !1617)
!1621 = !DILocation(line: 1198, column: 41, scope: !1617)
!1622 = !DILocation(line: 1198, column: 38, scope: !1617)
!1623 = !DILocation(line: 1199, column: 7, scope: !1617)
!1624 = !DILocation(line: 1200, column: 5, scope: !1618)
!1625 = !DILocation(line: 1197, column: 41, scope: !1612)
!1626 = !DILocation(line: 1197, column: 5, scope: !1612)
!1627 = distinct !{!1627, !1615, !1628, !363}
!1628 = !DILocation(line: 1200, column: 5, scope: !1609)
!1629 = !DILocation(line: 1201, column: 5, scope: !1606)
!1630 = !DILocation(line: 1205, column: 3, scope: !1593)
!1631 = !DILocation(line: 1189, column: 26, scope: !1588)
!1632 = !DILocation(line: 1188, column: 36, scope: !1583)
!1633 = !DILocation(line: 1188, column: 2, scope: !1583)
!1634 = distinct !{!1634, !1586, !1635, !363}
!1635 = !DILocation(line: 1205, column: 3, scope: !1580)
!1636 = !DILocation(line: 1209, column: 9, scope: !1637)
!1637 = distinct !DILexicalBlock(scope: !1576, file: !15, line: 1209, column: 2)
!1638 = !DILocation(line: 1209, column: 7, scope: !1637)
!1639 = !DILocation(line: 1209, column: 14, scope: !1640)
!1640 = distinct !DILexicalBlock(scope: !1637, file: !15, line: 1209, column: 2)
!1641 = !DILocation(line: 1209, column: 18, scope: !1640)
!1642 = !DILocation(line: 1209, column: 16, scope: !1640)
!1643 = !DILocation(line: 1209, column: 2, scope: !1637)
!1644 = !DILocalVariable(name: "fuelcen_num", scope: !1645, file: !15, line: 1210, type: !5)
!1645 = distinct !DILexicalBlock(scope: !1640, file: !15, line: 1209, column: 42)
!1646 = !DILocation(line: 1210, column: 7, scope: !1645)
!1647 = !DILocation(line: 1210, column: 34, scope: !1645)
!1648 = !DILocation(line: 1210, column: 21, scope: !1645)
!1649 = !DILocation(line: 1210, column: 37, scope: !1645)
!1650 = !DILocation(line: 1212, column: 3, scope: !1645)
!1651 = !DILocation(line: 1213, column: 3, scope: !1645)
!1652 = !DILocation(line: 1214, column: 2, scope: !1645)
!1653 = !DILocation(line: 1209, column: 38, scope: !1640)
!1654 = !DILocation(line: 1209, column: 2, scope: !1640)
!1655 = distinct !{!1655, !1643, !1656, !363}
!1656 = !DILocation(line: 1214, column: 2, scope: !1637)
!1657 = !DILocation(line: 1217, column: 1, scope: !1576)
!1658 = distinct !DISubprogram(name: "fuelcen_check_for_goal", linkageName: "_Z22fuelcen_check_for_goalP7segment", scope: !15, file: !15, line: 1220, type: !399, scopeLine: 1221, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !213)
!1659 = !DILocalVariable(name: "segp", arg: 1, scope: !1658, file: !15, line: 1220, type: !74)
!1660 = !DILocation(line: 1220, column: 38, scope: !1658)
!1661 = !DILocalVariable(name: "seg2p", scope: !1658, file: !15, line: 1222, type: !409)
!1662 = !DILocation(line: 1222, column: 12, scope: !1658)
!1663 = !DILocation(line: 1222, column: 31, scope: !1658)
!1664 = !DILocation(line: 1222, column: 36, scope: !1658)
!1665 = !DILocation(line: 1222, column: 21, scope: !1658)
!1666 = !DILocation(line: 1224, column: 2, scope: !1658)
!1667 = !DILocation(line: 1225, column: 2, scope: !1658)
!1668 = !DILocation(line: 1227, column: 6, scope: !1669)
!1669 = distinct !DILexicalBlock(scope: !1658, file: !15, line: 1227, column: 6)
!1670 = !DILocation(line: 1227, column: 13, scope: !1669)
!1671 = !DILocation(line: 1227, column: 21, scope: !1669)
!1672 = !DILocation(line: 1239, column: 2, scope: !1673)
!1673 = distinct !DILexicalBlock(scope: !1669, file: !15, line: 1228, column: 2)
!1674 = !DILocation(line: 1240, column: 6, scope: !1675)
!1675 = distinct !DILexicalBlock(scope: !1658, file: !15, line: 1240, column: 6)
!1676 = !DILocation(line: 1240, column: 13, scope: !1675)
!1677 = !DILocation(line: 1240, column: 21, scope: !1675)
!1678 = !DILocation(line: 1251, column: 2, scope: !1679)
!1679 = distinct !DILexicalBlock(scope: !1675, file: !15, line: 1241, column: 2)
!1680 = !DILocation(line: 1252, column: 1, scope: !1658)
!1681 = distinct !DISubprogram(name: "fuelcen_check_for_hoard_goal", linkageName: "_Z28fuelcen_check_for_hoard_goalP7segment", scope: !15, file: !15, line: 1254, type: !399, scopeLine: 1255, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !213)
!1682 = !DILocalVariable(name: "segp", arg: 1, scope: !1681, file: !15, line: 1254, type: !74)
!1683 = !DILocation(line: 1254, column: 44, scope: !1681)
!1684 = !DILocalVariable(name: "seg2p", scope: !1681, file: !15, line: 1256, type: !409)
!1685 = !DILocation(line: 1256, column: 12, scope: !1681)
!1686 = !DILocation(line: 1256, column: 31, scope: !1681)
!1687 = !DILocation(line: 1256, column: 36, scope: !1681)
!1688 = !DILocation(line: 1256, column: 21, scope: !1681)
!1689 = !DILocation(line: 1258, column: 2, scope: !1681)
!1690 = !DILocation(line: 1259, column: 2, scope: !1681)
!1691 = !DILocation(line: 1261, column: 6, scope: !1692)
!1692 = distinct !DILexicalBlock(scope: !1681, file: !15, line: 1261, column: 6)
!1693 = !DILocation(line: 1262, column: 3, scope: !1692)
!1694 = !DILocation(line: 1264, column: 6, scope: !1695)
!1695 = distinct !DILexicalBlock(scope: !1681, file: !15, line: 1264, column: 6)
!1696 = !DILocation(line: 1264, column: 13, scope: !1695)
!1697 = !DILocation(line: 1264, column: 21, scope: !1695)
!1698 = !DILocation(line: 1264, column: 45, scope: !1695)
!1699 = !DILocation(line: 1264, column: 48, scope: !1695)
!1700 = !DILocation(line: 1264, column: 55, scope: !1695)
!1701 = !DILocation(line: 1264, column: 63, scope: !1695)
!1702 = !DILocation(line: 1275, column: 2, scope: !1703)
!1703 = distinct !DILexicalBlock(scope: !1695, file: !15, line: 1265, column: 2)
!1704 = !DILocation(line: 1277, column: 1, scope: !1681)
!1705 = distinct !DISubprogram(name: "read_matcen", linkageName: "_Z11read_matcenP11matcen_infoP7__sFILE", scope: !15, file: !15, line: 1282, type: !1706, scopeLine: 1283, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !213)
!1706 = !DISubroutineType(types: !1707)
!1707 = !{null, !1708, !1709}
!1708 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!1709 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1710, size: 64)
!1710 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !1711, line: 162, baseType: !1712)
!1711 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "d91ebd7d161d9196cc100822ef0e5cdf")
!1712 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILE", file: !1711, line: 131, size: 1216, flags: DIFlagTypePassByValue, elements: !1713, identifier: "_ZTS7__sFILE")
!1713 = !{!1714, !1716, !1717, !1718, !1719, !1720, !1725, !1726, !1728, !1732, !1737, !1745, !1750, !1751, !1754, !1755, !1759, !1763, !1764, !1765}
!1714 = !DIDerivedType(tag: DW_TAG_member, name: "_p", scope: !1712, file: !1711, line: 132, baseType: !1715, size: 64)
!1715 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!1716 = !DIDerivedType(tag: DW_TAG_member, name: "_r", scope: !1712, file: !1711, line: 133, baseType: !5, size: 32, offset: 64)
!1717 = !DIDerivedType(tag: DW_TAG_member, name: "_w", scope: !1712, file: !1711, line: 134, baseType: !5, size: 32, offset: 96)
!1718 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !1712, file: !1711, line: 135, baseType: !38, size: 16, offset: 128)
!1719 = !DIDerivedType(tag: DW_TAG_member, name: "_file", scope: !1712, file: !1711, line: 136, baseType: !38, size: 16, offset: 144)
!1720 = !DIDerivedType(tag: DW_TAG_member, name: "_bf", scope: !1712, file: !1711, line: 137, baseType: !1721, size: 128, offset: 192)
!1721 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sbuf", file: !1711, line: 97, size: 128, flags: DIFlagTypePassByValue, elements: !1722, identifier: "_ZTS6__sbuf")
!1722 = !{!1723, !1724}
!1723 = !DIDerivedType(tag: DW_TAG_member, name: "_base", scope: !1721, file: !1711, line: 98, baseType: !1715, size: 64)
!1724 = !DIDerivedType(tag: DW_TAG_member, name: "_size", scope: !1721, file: !1711, line: 99, baseType: !5, size: 32, offset: 64)
!1725 = !DIDerivedType(tag: DW_TAG_member, name: "_lbfsize", scope: !1712, file: !1711, line: 138, baseType: !5, size: 32, offset: 320)
!1726 = !DIDerivedType(tag: DW_TAG_member, name: "_cookie", scope: !1712, file: !1711, line: 141, baseType: !1727, size: 64, offset: 384)
!1727 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!1728 = !DIDerivedType(tag: DW_TAG_member, name: "_close", scope: !1712, file: !1711, line: 142, baseType: !1729, size: 64, offset: 448)
!1729 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1730, size: 64)
!1730 = !DISubroutineType(types: !1731)
!1731 = !{!5, !1727}
!1732 = !DIDerivedType(tag: DW_TAG_member, name: "_read", scope: !1712, file: !1711, line: 143, baseType: !1733, size: 64, offset: 512)
!1733 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1734, size: 64)
!1734 = !DISubroutineType(types: !1735)
!1735 = !{!5, !1727, !1736, !5}
!1736 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !117, size: 64)
!1737 = !DIDerivedType(tag: DW_TAG_member, name: "_seek", scope: !1712, file: !1711, line: 144, baseType: !1738, size: 64, offset: 576)
!1738 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1739, size: 64)
!1739 = !DISubroutineType(types: !1740)
!1740 = !{!1741, !1727, !1741, !5}
!1741 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !1711, line: 86, baseType: !1742)
!1742 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_off_t", file: !1743, line: 83, baseType: !1744)
!1743 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "af82ff6119a9fa80fad635d276556d46")
!1744 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !301, line: 37, baseType: !11)
!1745 = !DIDerivedType(tag: DW_TAG_member, name: "_write", scope: !1712, file: !1711, line: 145, baseType: !1746, size: 64, offset: 640)
!1746 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1747, size: 64)
!1747 = !DISubroutineType(types: !1748)
!1748 = !{!5, !1727, !1749, !5}
!1749 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !116, size: 64)
!1750 = !DIDerivedType(tag: DW_TAG_member, name: "_ub", scope: !1712, file: !1711, line: 148, baseType: !1721, size: 128, offset: 704)
!1751 = !DIDerivedType(tag: DW_TAG_member, name: "_extra", scope: !1712, file: !1711, line: 149, baseType: !1752, size: 64, offset: 832)
!1752 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1753, size: 64)
!1753 = !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILEX", file: !1711, line: 103, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS8__sFILEX")
!1754 = !DIDerivedType(tag: DW_TAG_member, name: "_ur", scope: !1712, file: !1711, line: 150, baseType: !5, size: 32, offset: 896)
!1755 = !DIDerivedType(tag: DW_TAG_member, name: "_ubuf", scope: !1712, file: !1711, line: 153, baseType: !1756, size: 24, offset: 928)
!1756 = !DICompositeType(tag: DW_TAG_array_type, baseType: !88, size: 24, elements: !1757)
!1757 = !{!1758}
!1758 = !DISubrange(count: 3)
!1759 = !DIDerivedType(tag: DW_TAG_member, name: "_nbuf", scope: !1712, file: !1711, line: 154, baseType: !1760, size: 8, offset: 952)
!1760 = !DICompositeType(tag: DW_TAG_array_type, baseType: !88, size: 8, elements: !1761)
!1761 = !{!1762}
!1762 = !DISubrange(count: 1)
!1763 = !DIDerivedType(tag: DW_TAG_member, name: "_lb", scope: !1712, file: !1711, line: 157, baseType: !1721, size: 128, offset: 960)
!1764 = !DIDerivedType(tag: DW_TAG_member, name: "_blksize", scope: !1712, file: !1711, line: 160, baseType: !5, size: 32, offset: 1088)
!1765 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !1712, file: !1711, line: 161, baseType: !1741, size: 64, offset: 1152)
!1766 = !DILocalVariable(name: "center", arg: 1, scope: !1705, file: !15, line: 1282, type: !1708)
!1767 = !DILocation(line: 1282, column: 31, scope: !1705)
!1768 = !DILocalVariable(name: "fp", arg: 2, scope: !1705, file: !15, line: 1282, type: !1709)
!1769 = !DILocation(line: 1282, column: 45, scope: !1705)
!1770 = !DILocation(line: 1284, column: 41, scope: !1705)
!1771 = !DILocation(line: 1284, column: 27, scope: !1705)
!1772 = !DILocation(line: 1284, column: 2, scope: !1705)
!1773 = !DILocation(line: 1284, column: 10, scope: !1705)
!1774 = !DILocation(line: 1284, column: 25, scope: !1705)
!1775 = !DILocation(line: 1285, column: 41, scope: !1705)
!1776 = !DILocation(line: 1285, column: 27, scope: !1705)
!1777 = !DILocation(line: 1285, column: 2, scope: !1705)
!1778 = !DILocation(line: 1285, column: 10, scope: !1705)
!1779 = !DILocation(line: 1285, column: 25, scope: !1705)
!1780 = !DILocation(line: 1286, column: 37, scope: !1705)
!1781 = !DILocation(line: 1286, column: 23, scope: !1705)
!1782 = !DILocation(line: 1286, column: 2, scope: !1705)
!1783 = !DILocation(line: 1286, column: 10, scope: !1705)
!1784 = !DILocation(line: 1286, column: 21, scope: !1705)
!1785 = !DILocation(line: 1287, column: 35, scope: !1705)
!1786 = !DILocation(line: 1287, column: 21, scope: !1705)
!1787 = !DILocation(line: 1287, column: 2, scope: !1705)
!1788 = !DILocation(line: 1287, column: 10, scope: !1705)
!1789 = !DILocation(line: 1287, column: 19, scope: !1705)
!1790 = !DILocation(line: 1288, column: 35, scope: !1705)
!1791 = !DILocation(line: 1288, column: 19, scope: !1705)
!1792 = !DILocation(line: 1288, column: 2, scope: !1705)
!1793 = !DILocation(line: 1288, column: 10, scope: !1705)
!1794 = !DILocation(line: 1288, column: 17, scope: !1705)
!1795 = !DILocation(line: 1289, column: 40, scope: !1705)
!1796 = !DILocation(line: 1289, column: 24, scope: !1705)
!1797 = !DILocation(line: 1289, column: 2, scope: !1705)
!1798 = !DILocation(line: 1289, column: 10, scope: !1705)
!1799 = !DILocation(line: 1289, column: 22, scope: !1705)
!1800 = !DILocation(line: 1290, column: 1, scope: !1705)
!1801 = distinct !DISubprogram(name: "write_matcen", linkageName: "_Z12write_matcenP11matcen_infoP7__sFILE", scope: !15, file: !15, line: 1292, type: !1706, scopeLine: 1293, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !213)
!1802 = !DILocalVariable(name: "center", arg: 1, scope: !1801, file: !15, line: 1292, type: !1708)
!1803 = !DILocation(line: 1292, column: 32, scope: !1801)
!1804 = !DILocalVariable(name: "fp", arg: 2, scope: !1801, file: !15, line: 1292, type: !1709)
!1805 = !DILocation(line: 1292, column: 46, scope: !1801)
!1806 = !DILocation(line: 1294, column: 17, scope: !1801)
!1807 = !DILocation(line: 1294, column: 21, scope: !1801)
!1808 = !DILocation(line: 1294, column: 29, scope: !1801)
!1809 = !DILocation(line: 1294, column: 2, scope: !1801)
!1810 = !DILocation(line: 1295, column: 17, scope: !1801)
!1811 = !DILocation(line: 1295, column: 21, scope: !1801)
!1812 = !DILocation(line: 1295, column: 29, scope: !1801)
!1813 = !DILocation(line: 1295, column: 2, scope: !1801)
!1814 = !DILocation(line: 1296, column: 17, scope: !1801)
!1815 = !DILocation(line: 1296, column: 21, scope: !1801)
!1816 = !DILocation(line: 1296, column: 29, scope: !1801)
!1817 = !DILocation(line: 1296, column: 2, scope: !1801)
!1818 = !DILocation(line: 1297, column: 17, scope: !1801)
!1819 = !DILocation(line: 1297, column: 21, scope: !1801)
!1820 = !DILocation(line: 1297, column: 29, scope: !1801)
!1821 = !DILocation(line: 1297, column: 2, scope: !1801)
!1822 = !DILocation(line: 1298, column: 19, scope: !1801)
!1823 = !DILocation(line: 1298, column: 23, scope: !1801)
!1824 = !DILocation(line: 1298, column: 31, scope: !1801)
!1825 = !DILocation(line: 1298, column: 2, scope: !1801)
!1826 = !DILocation(line: 1299, column: 19, scope: !1801)
!1827 = !DILocation(line: 1299, column: 23, scope: !1801)
!1828 = !DILocation(line: 1299, column: 31, scope: !1801)
!1829 = !DILocation(line: 1299, column: 2, scope: !1801)
!1830 = !DILocation(line: 1300, column: 1, scope: !1801)
!1831 = distinct !DISubprogram(name: "read_fuelcen", linkageName: "_Z12read_fuelcenP10FuelCenterP7__sFILE", scope: !15, file: !15, line: 1302, type: !1832, scopeLine: 1303, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !213)
!1832 = !DISubroutineType(types: !1833)
!1833 = !{null, !631, !1709}
!1834 = !DILocalVariable(name: "center", arg: 1, scope: !1831, file: !15, line: 1302, type: !631)
!1835 = !DILocation(line: 1302, column: 31, scope: !1831)
!1836 = !DILocalVariable(name: "fp", arg: 2, scope: !1831, file: !15, line: 1302, type: !1709)
!1837 = !DILocation(line: 1302, column: 45, scope: !1831)
!1838 = !DILocation(line: 1304, column: 31, scope: !1831)
!1839 = !DILocation(line: 1304, column: 17, scope: !1831)
!1840 = !DILocation(line: 1304, column: 2, scope: !1831)
!1841 = !DILocation(line: 1304, column: 10, scope: !1831)
!1842 = !DILocation(line: 1304, column: 15, scope: !1831)
!1843 = !DILocation(line: 1305, column: 33, scope: !1831)
!1844 = !DILocation(line: 1305, column: 19, scope: !1831)
!1845 = !DILocation(line: 1305, column: 2, scope: !1831)
!1846 = !DILocation(line: 1305, column: 10, scope: !1831)
!1847 = !DILocation(line: 1305, column: 17, scope: !1831)
!1848 = !DILocation(line: 1306, column: 32, scope: !1831)
!1849 = !DILocation(line: 1306, column: 17, scope: !1831)
!1850 = !DILocation(line: 1306, column: 2, scope: !1831)
!1851 = !DILocation(line: 1306, column: 10, scope: !1831)
!1852 = !DILocation(line: 1306, column: 15, scope: !1831)
!1853 = !DILocation(line: 1307, column: 35, scope: !1831)
!1854 = !DILocation(line: 1307, column: 20, scope: !1831)
!1855 = !DILocation(line: 1307, column: 2, scope: !1831)
!1856 = !DILocation(line: 1307, column: 10, scope: !1831)
!1857 = !DILocation(line: 1307, column: 18, scope: !1831)
!1858 = !DILocation(line: 1308, column: 33, scope: !1831)
!1859 = !DILocation(line: 1308, column: 18, scope: !1831)
!1860 = !DILocation(line: 1308, column: 2, scope: !1831)
!1861 = !DILocation(line: 1308, column: 10, scope: !1831)
!1862 = !DILocation(line: 1308, column: 16, scope: !1831)
!1863 = !DILocation(line: 1309, column: 32, scope: !1831)
!1864 = !DILocation(line: 1309, column: 17, scope: !1831)
!1865 = !DILocation(line: 1309, column: 2, scope: !1831)
!1866 = !DILocation(line: 1309, column: 10, scope: !1831)
!1867 = !DILocation(line: 1309, column: 15, scope: !1831)
!1868 = !DILocation(line: 1310, column: 35, scope: !1831)
!1869 = !DILocation(line: 1310, column: 21, scope: !1831)
!1870 = !DILocation(line: 1310, column: 2, scope: !1831)
!1871 = !DILocation(line: 1310, column: 10, scope: !1831)
!1872 = !DILocation(line: 1310, column: 19, scope: !1831)
!1873 = !DILocation(line: 1311, column: 38, scope: !1831)
!1874 = !DILocation(line: 1311, column: 24, scope: !1831)
!1875 = !DILocation(line: 1311, column: 2, scope: !1831)
!1876 = !DILocation(line: 1311, column: 10, scope: !1831)
!1877 = !DILocation(line: 1311, column: 22, scope: !1831)
!1878 = !DILocation(line: 1312, column: 32, scope: !1831)
!1879 = !DILocation(line: 1312, column: 18, scope: !1831)
!1880 = !DILocation(line: 1312, column: 2, scope: !1831)
!1881 = !DILocation(line: 1312, column: 10, scope: !1831)
!1882 = !DILocation(line: 1312, column: 16, scope: !1831)
!1883 = !DILocation(line: 1313, column: 39, scope: !1831)
!1884 = !DILocation(line: 1313, column: 25, scope: !1831)
!1885 = !DILocation(line: 1313, column: 2, scope: !1831)
!1886 = !DILocation(line: 1313, column: 10, scope: !1831)
!1887 = !DILocation(line: 1313, column: 23, scope: !1831)
!1888 = !DILocation(line: 1314, column: 35, scope: !1831)
!1889 = !DILocation(line: 1314, column: 21, scope: !1831)
!1890 = !DILocation(line: 1314, column: 2, scope: !1831)
!1891 = !DILocation(line: 1314, column: 10, scope: !1831)
!1892 = !DILocation(line: 1314, column: 17, scope: !1831)
!1893 = !DILocation(line: 1314, column: 19, scope: !1831)
!1894 = !DILocation(line: 1315, column: 35, scope: !1831)
!1895 = !DILocation(line: 1315, column: 21, scope: !1831)
!1896 = !DILocation(line: 1315, column: 2, scope: !1831)
!1897 = !DILocation(line: 1315, column: 10, scope: !1831)
!1898 = !DILocation(line: 1315, column: 17, scope: !1831)
!1899 = !DILocation(line: 1315, column: 19, scope: !1831)
!1900 = !DILocation(line: 1316, column: 35, scope: !1831)
!1901 = !DILocation(line: 1316, column: 21, scope: !1831)
!1902 = !DILocation(line: 1316, column: 2, scope: !1831)
!1903 = !DILocation(line: 1316, column: 10, scope: !1831)
!1904 = !DILocation(line: 1316, column: 17, scope: !1831)
!1905 = !DILocation(line: 1316, column: 19, scope: !1831)
!1906 = !DILocation(line: 1317, column: 1, scope: !1831)
!1907 = distinct !DISubprogram(name: "write_fuelcen", linkageName: "_Z13write_fuelcenP10FuelCenterP7__sFILE", scope: !15, file: !15, line: 1319, type: !1832, scopeLine: 1320, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !213)
!1908 = !DILocalVariable(name: "center", arg: 1, scope: !1907, file: !15, line: 1319, type: !631)
!1909 = !DILocation(line: 1319, column: 32, scope: !1907)
!1910 = !DILocalVariable(name: "fp", arg: 2, scope: !1907, file: !15, line: 1319, type: !1709)
!1911 = !DILocation(line: 1319, column: 46, scope: !1907)
!1912 = !DILocation(line: 1321, column: 17, scope: !1907)
!1913 = !DILocation(line: 1321, column: 21, scope: !1907)
!1914 = !DILocation(line: 1321, column: 29, scope: !1907)
!1915 = !DILocation(line: 1321, column: 2, scope: !1907)
!1916 = !DILocation(line: 1322, column: 17, scope: !1907)
!1917 = !DILocation(line: 1322, column: 21, scope: !1907)
!1918 = !DILocation(line: 1322, column: 29, scope: !1907)
!1919 = !DILocation(line: 1322, column: 2, scope: !1907)
!1920 = !DILocation(line: 1323, column: 18, scope: !1907)
!1921 = !DILocation(line: 1323, column: 22, scope: !1907)
!1922 = !DILocation(line: 1323, column: 30, scope: !1907)
!1923 = !DILocation(line: 1323, column: 2, scope: !1907)
!1924 = !DILocation(line: 1324, column: 18, scope: !1907)
!1925 = !DILocation(line: 1324, column: 22, scope: !1907)
!1926 = !DILocation(line: 1324, column: 30, scope: !1907)
!1927 = !DILocation(line: 1324, column: 2, scope: !1907)
!1928 = !DILocation(line: 1325, column: 18, scope: !1907)
!1929 = !DILocation(line: 1325, column: 22, scope: !1907)
!1930 = !DILocation(line: 1325, column: 30, scope: !1907)
!1931 = !DILocation(line: 1325, column: 2, scope: !1907)
!1932 = !DILocation(line: 1326, column: 18, scope: !1907)
!1933 = !DILocation(line: 1326, column: 22, scope: !1907)
!1934 = !DILocation(line: 1326, column: 30, scope: !1907)
!1935 = !DILocation(line: 1326, column: 2, scope: !1907)
!1936 = !DILocation(line: 1327, column: 17, scope: !1907)
!1937 = !DILocation(line: 1327, column: 21, scope: !1907)
!1938 = !DILocation(line: 1327, column: 29, scope: !1907)
!1939 = !DILocation(line: 1327, column: 2, scope: !1907)
!1940 = !DILocation(line: 1328, column: 17, scope: !1907)
!1941 = !DILocation(line: 1328, column: 21, scope: !1907)
!1942 = !DILocation(line: 1328, column: 29, scope: !1907)
!1943 = !DILocation(line: 1328, column: 2, scope: !1907)
!1944 = !DILocation(line: 1329, column: 17, scope: !1907)
!1945 = !DILocation(line: 1329, column: 21, scope: !1907)
!1946 = !DILocation(line: 1329, column: 29, scope: !1907)
!1947 = !DILocation(line: 1329, column: 2, scope: !1907)
!1948 = !DILocation(line: 1330, column: 17, scope: !1907)
!1949 = !DILocation(line: 1330, column: 21, scope: !1907)
!1950 = !DILocation(line: 1330, column: 29, scope: !1907)
!1951 = !DILocation(line: 1330, column: 2, scope: !1907)
!1952 = !DILocation(line: 1331, column: 17, scope: !1907)
!1953 = !DILocation(line: 1331, column: 21, scope: !1907)
!1954 = !DILocation(line: 1331, column: 29, scope: !1907)
!1955 = !DILocation(line: 1331, column: 36, scope: !1907)
!1956 = !DILocation(line: 1331, column: 2, scope: !1907)
!1957 = !DILocation(line: 1332, column: 17, scope: !1907)
!1958 = !DILocation(line: 1332, column: 21, scope: !1907)
!1959 = !DILocation(line: 1332, column: 29, scope: !1907)
!1960 = !DILocation(line: 1332, column: 36, scope: !1907)
!1961 = !DILocation(line: 1332, column: 2, scope: !1907)
!1962 = !DILocation(line: 1333, column: 17, scope: !1907)
!1963 = !DILocation(line: 1333, column: 21, scope: !1907)
!1964 = !DILocation(line: 1333, column: 29, scope: !1907)
!1965 = !DILocation(line: 1333, column: 36, scope: !1907)
!1966 = !DILocation(line: 1333, column: 2, scope: !1907)
!1967 = !DILocation(line: 1334, column: 1, scope: !1907)
