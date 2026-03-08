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
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !484, !DIExpression(), !485)
    #dbg_declare(ptr %3, !486, !DIExpression(), !487)
  %5 = load ptr, ptr %2, align 8, !dbg !488
  %6 = ptrtoint ptr %5 to i64, !dbg !489
  %7 = sub i64 %6, ptrtoint (ptr @Segments to i64), !dbg !489
  %8 = sdiv exact i64 %7, 512, !dbg !489
  %9 = getelementptr inbounds [0 x %struct.segment2], ptr @Segment2s, i64 0, i64 %8, !dbg !490
  store ptr %9, ptr %3, align 8, !dbg !487
    #dbg_declare(ptr %4, !491, !DIExpression(), !492)
  %10 = load ptr, ptr %3, align 8, !dbg !493
  %11 = getelementptr inbounds nuw %struct.segment2, ptr %10, i32 0, i32 0, !dbg !494
  %12 = load i8, ptr %11, align 4, !dbg !494
  %13 = zext i8 %12 to i32, !dbg !493
  store i32 %13, ptr %4, align 4, !dbg !492
  %14 = load ptr, ptr %3, align 8, !dbg !495
  %15 = icmp ne ptr %14, null, !dbg !495
  %16 = zext i1 %15 to i32, !dbg !495
  call void @_Z7_AssertiPKcS0_i(i32 noundef %16, ptr noundef @.str.1, ptr noundef @.str.2, i32 noundef 222), !dbg !495
  %17 = load i32, ptr %4, align 4, !dbg !496
  %18 = icmp eq i32 %17, 4, !dbg !496
  %19 = zext i1 %18 to i32, !dbg !496
  call void @_Z7_AssertiPKcS0_i(i32 noundef %19, ptr noundef @.str.5, ptr noundef @.str.2, i32 noundef 223), !dbg !496
  %20 = load ptr, ptr %3, align 8, !dbg !497
  %21 = icmp eq ptr %20, null, !dbg !499
  br i1 %21, label %22, label %23, !dbg !499

22:                                               ; preds = %1
  br label %120, !dbg !500

23:                                               ; preds = %1
  %24 = load i32, ptr @Num_fuelcenters, align 4, !dbg !501
  %25 = icmp slt i32 %24, 70, !dbg !501
  %26 = zext i1 %25 to i32, !dbg !501
  call void @_Z7_AssertiPKcS0_i(i32 noundef %26, ptr noundef @.str.3, ptr noundef @.str.2, i32 noundef 226), !dbg !501
  %27 = load i32, ptr @Num_fuelcenters, align 4, !dbg !502
  %28 = icmp sgt i32 %27, -1, !dbg !502
  %29 = zext i1 %28 to i32, !dbg !502
  call void @_Z7_AssertiPKcS0_i(i32 noundef %29, ptr noundef @.str.4, ptr noundef @.str.2, i32 noundef 227), !dbg !502
  %30 = load i32, ptr @Num_fuelcenters, align 4, !dbg !503
  %31 = trunc i32 %30 to i8, !dbg !503
  %32 = load ptr, ptr %3, align 8, !dbg !504
  %33 = getelementptr inbounds nuw %struct.segment2, ptr %32, i32 0, i32 2, !dbg !505
  store i8 %31, ptr %33, align 2, !dbg !506
  %34 = load i32, ptr %4, align 4, !dbg !507
  %35 = load i32, ptr @Num_fuelcenters, align 4, !dbg !508
  %36 = sext i32 %35 to i64, !dbg !509
  %37 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %36, !dbg !509
  %38 = getelementptr inbounds nuw %struct.FuelCenter, ptr %37, i32 0, i32 0, !dbg !510
  store i32 %34, ptr %38, align 4, !dbg !511
  %39 = load i32, ptr @Difficulty_level, align 4, !dbg !512
  %40 = add nsw i32 %39, 3, !dbg !513
  %41 = call noundef i32 @_Z3i2fi(i32 noundef %40), !dbg !514
  %42 = load i32, ptr @Num_fuelcenters, align 4, !dbg !515
  %43 = sext i32 %42 to i64, !dbg !516
  %44 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %43, !dbg !516
  %45 = getelementptr inbounds nuw %struct.FuelCenter, ptr %44, i32 0, i32 6, !dbg !517
  store i32 %41, ptr %45, align 4, !dbg !518
  %46 = load i32, ptr @Num_fuelcenters, align 4, !dbg !519
  %47 = sext i32 %46 to i64, !dbg !520
  %48 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %47, !dbg !520
  %49 = getelementptr inbounds nuw %struct.FuelCenter, ptr %48, i32 0, i32 6, !dbg !521
  %50 = load i32, ptr %49, align 4, !dbg !521
  %51 = load i32, ptr @Num_fuelcenters, align 4, !dbg !522
  %52 = sext i32 %51 to i64, !dbg !523
  %53 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %52, !dbg !523
  %54 = getelementptr inbounds nuw %struct.FuelCenter, ptr %53, i32 0, i32 7, !dbg !524
  store i32 %50, ptr %54, align 4, !dbg !525
  %55 = load ptr, ptr %3, align 8, !dbg !526
  %56 = ptrtoint ptr %55 to i64, !dbg !527
  %57 = sub i64 %56, ptrtoint (ptr @Segment2s to i64), !dbg !527
  %58 = sdiv exact i64 %57, 8, !dbg !527
  %59 = trunc i64 %58 to i32, !dbg !526
  %60 = load i32, ptr @Num_fuelcenters, align 4, !dbg !528
  %61 = sext i32 %60 to i64, !dbg !529
  %62 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %61, !dbg !529
  %63 = getelementptr inbounds nuw %struct.FuelCenter, ptr %62, i32 0, i32 1, !dbg !530
  store i32 %59, ptr %63, align 4, !dbg !531
  %64 = load i32, ptr @Num_fuelcenters, align 4, !dbg !532
  %65 = sext i32 %64 to i64, !dbg !533
  %66 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %65, !dbg !533
  %67 = getelementptr inbounds nuw %struct.FuelCenter, ptr %66, i32 0, i32 8, !dbg !534
  store i32 -1, ptr %67, align 4, !dbg !535
  %68 = load i32, ptr @Num_fuelcenters, align 4, !dbg !536
  %69 = sext i32 %68 to i64, !dbg !537
  %70 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %69, !dbg !537
  %71 = getelementptr inbounds nuw %struct.FuelCenter, ptr %70, i32 0, i32 2, !dbg !538
  store i8 0, ptr %71, align 4, !dbg !539
  %72 = load i32, ptr @Num_fuelcenters, align 4, !dbg !540
  %73 = sext i32 %72 to i64, !dbg !541
  %74 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %73, !dbg !541
  %75 = getelementptr inbounds nuw %struct.FuelCenter, ptr %74, i32 0, i32 10, !dbg !542
  %76 = load ptr, ptr %3, align 8, !dbg !543
  %77 = ptrtoint ptr %76 to i64, !dbg !544
  %78 = sub i64 %77, ptrtoint (ptr @Segment2s to i64), !dbg !544
  %79 = sdiv exact i64 %78, 8, !dbg !544
  %80 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %79, !dbg !545
  call void @_Z22compute_segment_centerP10vms_vectorP7segment(ptr noundef %75, ptr noundef %80), !dbg !546
  %81 = load i32, ptr @Num_robot_centers, align 4, !dbg !547
  %82 = trunc i32 %81 to i8, !dbg !547
  %83 = load ptr, ptr %3, align 8, !dbg !548
  %84 = getelementptr inbounds nuw %struct.segment2, ptr %83, i32 0, i32 1, !dbg !549
  store i8 %82, ptr %84, align 1, !dbg !550
  %85 = load i32, ptr @Num_robot_centers, align 4, !dbg !551
  %86 = add nsw i32 %85, 1, !dbg !551
  store i32 %86, ptr @Num_robot_centers, align 4, !dbg !551
  %87 = load ptr, ptr %3, align 8, !dbg !552
  %88 = getelementptr inbounds nuw %struct.segment2, ptr %87, i32 0, i32 1, !dbg !553
  %89 = load i8, ptr %88, align 1, !dbg !553
  %90 = sext i8 %89 to i64, !dbg !554
  %91 = getelementptr inbounds [20 x %struct.matcen_info], ptr @RobotCenters, i64 0, i64 %90, !dbg !554
  %92 = getelementptr inbounds nuw %struct.matcen_info, ptr %91, i32 0, i32 1, !dbg !555
  store i32 32768000, ptr %92, align 4, !dbg !556
  %93 = load ptr, ptr %3, align 8, !dbg !557
  %94 = getelementptr inbounds nuw %struct.segment2, ptr %93, i32 0, i32 1, !dbg !558
  %95 = load i8, ptr %94, align 1, !dbg !558
  %96 = sext i8 %95 to i64, !dbg !559
  %97 = getelementptr inbounds [20 x %struct.matcen_info], ptr @RobotCenters, i64 0, i64 %96, !dbg !559
  %98 = getelementptr inbounds nuw %struct.matcen_info, ptr %97, i32 0, i32 2, !dbg !560
  store i32 327680, ptr %98, align 4, !dbg !561
  %99 = load ptr, ptr %3, align 8, !dbg !562
  %100 = ptrtoint ptr %99 to i64, !dbg !563
  %101 = sub i64 %100, ptrtoint (ptr @Segment2s to i64), !dbg !563
  %102 = sdiv exact i64 %101, 8, !dbg !563
  %103 = trunc i64 %102 to i16, !dbg !562
  %104 = load ptr, ptr %3, align 8, !dbg !564
  %105 = getelementptr inbounds nuw %struct.segment2, ptr %104, i32 0, i32 1, !dbg !565
  %106 = load i8, ptr %105, align 1, !dbg !565
  %107 = sext i8 %106 to i64, !dbg !566
  %108 = getelementptr inbounds [20 x %struct.matcen_info], ptr @RobotCenters, i64 0, i64 %107, !dbg !566
  %109 = getelementptr inbounds nuw %struct.matcen_info, ptr %108, i32 0, i32 3, !dbg !567
  store i16 %103, ptr %109, align 4, !dbg !568
  %110 = load i32, ptr @Num_fuelcenters, align 4, !dbg !569
  %111 = trunc i32 %110 to i16, !dbg !569
  %112 = load ptr, ptr %3, align 8, !dbg !570
  %113 = getelementptr inbounds nuw %struct.segment2, ptr %112, i32 0, i32 1, !dbg !571
  %114 = load i8, ptr %113, align 1, !dbg !571
  %115 = sext i8 %114 to i64, !dbg !572
  %116 = getelementptr inbounds [20 x %struct.matcen_info], ptr @RobotCenters, i64 0, i64 %115, !dbg !572
  %117 = getelementptr inbounds nuw %struct.matcen_info, ptr %116, i32 0, i32 4, !dbg !573
  store i16 %111, ptr %117, align 2, !dbg !574
  %118 = load i32, ptr @Num_fuelcenters, align 4, !dbg !575
  %119 = add nsw i32 %118, 1, !dbg !575
  store i32 %119, ptr @Num_fuelcenters, align 4, !dbg !575
  br label %120, !dbg !576

120:                                              ; preds = %23, %22
  ret void, !dbg !576
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z3i2fi(i32 noundef %0) #0 !dbg !577 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !580, !DIExpression(), !581)
  %3 = load i32, ptr %2, align 4, !dbg !582
  %4 = shl i32 %3, 16, !dbg !583
  ret i32 %4, !dbg !584
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z16fuelcen_activateP7segmenti(ptr noundef %0, i32 noundef %1) #1 !dbg !585 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !588, !DIExpression(), !589)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !590, !DIExpression(), !591)
    #dbg_declare(ptr %5, !592, !DIExpression(), !593)
  %6 = load ptr, ptr %3, align 8, !dbg !594
  %7 = ptrtoint ptr %6 to i64, !dbg !595
  %8 = sub i64 %7, ptrtoint (ptr @Segments to i64), !dbg !595
  %9 = sdiv exact i64 %8, 512, !dbg !595
  %10 = getelementptr inbounds [0 x %struct.segment2], ptr @Segment2s, i64 0, i64 %9, !dbg !596
  store ptr %10, ptr %5, align 8, !dbg !593
  %11 = load i32, ptr %4, align 4, !dbg !597
  %12 = trunc i32 %11 to i8, !dbg !597
  %13 = load ptr, ptr %5, align 8, !dbg !598
  %14 = getelementptr inbounds nuw %struct.segment2, ptr %13, i32 0, i32 0, !dbg !599
  store i8 %12, ptr %14, align 4, !dbg !600
  %15 = load ptr, ptr %5, align 8, !dbg !601
  %16 = getelementptr inbounds nuw %struct.segment2, ptr %15, i32 0, i32 0, !dbg !603
  %17 = load i8, ptr %16, align 4, !dbg !603
  %18 = zext i8 %17 to i32, !dbg !601
  %19 = icmp eq i32 %18, 4, !dbg !604
  br i1 %19, label %20, label %22, !dbg !604

20:                                               ; preds = %2
  %21 = load ptr, ptr %3, align 8, !dbg !605
  call void @_Z13matcen_createP7segment(ptr noundef %21), !dbg !606
  br label %24, !dbg !606

22:                                               ; preds = %2
  %23 = load ptr, ptr %3, align 8, !dbg !607
  call void @_Z14fuelcen_createP7segment(ptr noundef %23), !dbg !608
  br label %24

24:                                               ; preds = %22, %20
  ret void, !dbg !609
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z14trigger_matceni(i32 noundef %0) #1 !dbg !610 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca %struct.vms_vector, align 4
  %5 = alloca %struct.vms_vector, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !613, !DIExpression(), !614)
    #dbg_declare(ptr %3, !615, !DIExpression(), !616)
  %8 = load i32, ptr %2, align 4, !dbg !617
  %9 = sext i32 %8 to i64, !dbg !618
  %10 = getelementptr inbounds [0 x %struct.segment2], ptr @Segment2s, i64 0, i64 %9, !dbg !618
  store ptr %10, ptr %3, align 8, !dbg !616
    #dbg_declare(ptr %4, !619, !DIExpression(), !620)
    #dbg_declare(ptr %5, !621, !DIExpression(), !622)
    #dbg_declare(ptr %6, !623, !DIExpression(), !625)
    #dbg_declare(ptr %7, !626, !DIExpression(), !627)
  %11 = load i32, ptr %2, align 4, !dbg !628
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.6, i32 noundef %11), !dbg !628
  %12 = load ptr, ptr %3, align 8, !dbg !629
  %13 = getelementptr inbounds nuw %struct.segment2, ptr %12, i32 0, i32 0, !dbg !629
  %14 = load i8, ptr %13, align 4, !dbg !629
  %15 = zext i8 %14 to i32, !dbg !629
  %16 = icmp eq i32 %15, 4, !dbg !629
  %17 = zext i1 %16 to i32, !dbg !629
  call void @_Z7_AssertiPKcS0_i(i32 noundef %17, ptr noundef @.str.7, ptr noundef @.str.2, i32 noundef 286), !dbg !629
  %18 = load ptr, ptr %3, align 8, !dbg !630
  %19 = getelementptr inbounds nuw %struct.segment2, ptr %18, i32 0, i32 1, !dbg !630
  %20 = load i8, ptr %19, align 1, !dbg !630
  %21 = sext i8 %20 to i32, !dbg !630
  %22 = load i32, ptr @Num_fuelcenters, align 4, !dbg !630
  %23 = icmp slt i32 %21, %22, !dbg !630
  %24 = zext i1 %23 to i32, !dbg !630
  call void @_Z7_AssertiPKcS0_i(i32 noundef %24, ptr noundef @.str.8, ptr noundef @.str.2, i32 noundef 287), !dbg !630
  %25 = load ptr, ptr %3, align 8, !dbg !631
  %26 = getelementptr inbounds nuw %struct.segment2, ptr %25, i32 0, i32 1, !dbg !631
  %27 = load i8, ptr %26, align 1, !dbg !631
  %28 = sext i8 %27 to i32, !dbg !631
  %29 = icmp sge i32 %28, 0, !dbg !631
  br i1 %29, label %30, label %37, !dbg !631

30:                                               ; preds = %1
  %31 = load ptr, ptr %3, align 8, !dbg !631
  %32 = getelementptr inbounds nuw %struct.segment2, ptr %31, i32 0, i32 1, !dbg !631
  %33 = load i8, ptr %32, align 1, !dbg !631
  %34 = sext i8 %33 to i32, !dbg !631
  %35 = load i32, ptr @Highest_segment_index, align 4, !dbg !631
  %36 = icmp sle i32 %34, %35, !dbg !631
  br label %37

37:                                               ; preds = %30, %1
  %38 = phi i1 [ false, %1 ], [ %36, %30 ], !dbg !632
  %39 = zext i1 %38 to i32, !dbg !631
  call void @_Z7_AssertiPKcS0_i(i32 noundef %39, ptr noundef @.str.9, ptr noundef @.str.2, i32 noundef 288), !dbg !631
  %40 = load ptr, ptr %3, align 8, !dbg !633
  %41 = getelementptr inbounds nuw %struct.segment2, ptr %40, i32 0, i32 1, !dbg !634
  %42 = load i8, ptr %41, align 1, !dbg !634
  %43 = sext i8 %42 to i64, !dbg !635
  %44 = getelementptr inbounds [20 x %struct.matcen_info], ptr @RobotCenters, i64 0, i64 %43, !dbg !635
  %45 = getelementptr inbounds nuw %struct.matcen_info, ptr %44, i32 0, i32 4, !dbg !636
  %46 = load i16, ptr %45, align 2, !dbg !636
  %47 = sext i16 %46 to i64, !dbg !637
  %48 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %47, !dbg !637
  store ptr %48, ptr %6, align 8, !dbg !638
  %49 = load ptr, ptr %6, align 8, !dbg !639
  %50 = getelementptr inbounds nuw %struct.FuelCenter, ptr %49, i32 0, i32 3, !dbg !641
  %51 = load i8, ptr %50, align 1, !dbg !641
  %52 = sext i8 %51 to i32, !dbg !639
  %53 = icmp eq i32 %52, 1, !dbg !642
  br i1 %53, label %54, label %55, !dbg !642

54:                                               ; preds = %37
  br label %120, !dbg !643

55:                                               ; preds = %37
  %56 = load ptr, ptr %6, align 8, !dbg !644
  %57 = getelementptr inbounds nuw %struct.FuelCenter, ptr %56, i32 0, i32 4, !dbg !646
  %58 = load i8, ptr %57, align 2, !dbg !646
  %59 = icmp ne i8 %58, 0, !dbg !644
  br i1 %59, label %61, label %60, !dbg !647

60:                                               ; preds = %55
  br label %120, !dbg !648

61:                                               ; preds = %55
  %62 = load i32, ptr @Difficulty_level, align 4, !dbg !649
  %63 = add nsw i32 %62, 1, !dbg !651
  %64 = icmp slt i32 %63, 5, !dbg !652
  br i1 %64, label %65, label %70, !dbg !652

65:                                               ; preds = %61
  %66 = load ptr, ptr %6, align 8, !dbg !653
  %67 = getelementptr inbounds nuw %struct.FuelCenter, ptr %66, i32 0, i32 4, !dbg !654
  %68 = load i8, ptr %67, align 2, !dbg !655
  %69 = add i8 %68, -1, !dbg !655
  store i8 %69, ptr %67, align 2, !dbg !655
  br label %70, !dbg !653

70:                                               ; preds = %65, %61
  %71 = load ptr, ptr %6, align 8, !dbg !656
  %72 = getelementptr inbounds nuw %struct.FuelCenter, ptr %71, i32 0, i32 8, !dbg !657
  store i32 65536000, ptr %72, align 4, !dbg !658
  %73 = load ptr, ptr %6, align 8, !dbg !659
  %74 = getelementptr inbounds nuw %struct.FuelCenter, ptr %73, i32 0, i32 3, !dbg !660
  store i8 1, ptr %74, align 1, !dbg !661
  %75 = load i32, ptr @Difficulty_level, align 4, !dbg !662
  %76 = add nsw i32 %75, 3, !dbg !663
  %77 = call noundef i32 @_Z3i2fi(i32 noundef %76), !dbg !664
  %78 = load ptr, ptr %6, align 8, !dbg !665
  %79 = getelementptr inbounds nuw %struct.FuelCenter, ptr %78, i32 0, i32 6, !dbg !666
  store i32 %77, ptr %79, align 4, !dbg !667
  %80 = load i32, ptr @Difficulty_level, align 4, !dbg !668
  %81 = mul nsw i32 2, %80, !dbg !668
  %82 = sub nsw i32 30, %81, !dbg !668
  %83 = call noundef i32 @_Z3i2fi(i32 noundef %82), !dbg !668
  %84 = load ptr, ptr %6, align 8, !dbg !669
  %85 = getelementptr inbounds nuw %struct.FuelCenter, ptr %84, i32 0, i32 9, !dbg !670
  store i32 %83, ptr %85, align 4, !dbg !671
  %86 = load ptr, ptr %6, align 8, !dbg !672
  %87 = getelementptr inbounds nuw %struct.FuelCenter, ptr %86, i32 0, i32 10, !dbg !673
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %4, ptr align 4 %87, i64 12, i1 false), !dbg !674
  %88 = load i32, ptr %2, align 4, !dbg !675
  %89 = sext i32 %88 to i64, !dbg !676
  %90 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %89, !dbg !676
  %91 = getelementptr inbounds nuw %struct.segment, ptr %90, i32 0, i32 2, !dbg !677
  %92 = getelementptr inbounds [8 x i16], ptr %91, i64 0, i64 0, !dbg !676
  %93 = load i16, ptr %92, align 4, !dbg !676
  %94 = sext i16 %93 to i64, !dbg !678
  %95 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %94, !dbg !678
  %96 = load ptr, ptr %6, align 8, !dbg !679
  %97 = getelementptr inbounds nuw %struct.FuelCenter, ptr %96, i32 0, i32 10, !dbg !680
  %98 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %5, ptr noundef %95, ptr noundef %97), !dbg !681
  %99 = call noundef ptr @_Z17vm_vec_scale_add2P10vms_vectorS0_i(ptr noundef %4, ptr noundef %5, i32 noundef 32768), !dbg !682
  %100 = load i32, ptr %2, align 4, !dbg !683
  %101 = call noundef i32 @_Z10obj_createhhiP10vms_vectorP10vms_matrixihhh(i8 noundef zeroext 13, i8 noundef zeroext 0, i32 noundef %100, ptr noundef %4, ptr noundef null, i32 noundef 0, i8 noundef zeroext 14, i8 noundef zeroext 0, i8 noundef zeroext 0), !dbg !684
  store i32 %101, ptr %7, align 4, !dbg !685
  %102 = load i32, ptr %7, align 4, !dbg !686
  %103 = icmp ne i32 %102, -1, !dbg !688
  br i1 %103, label %104, label %119, !dbg !688

104:                                              ; preds = %70
  %105 = load i32, ptr @Difficulty_level, align 4, !dbg !689
  %106 = mul nsw i32 2, %105, !dbg !689
  %107 = sub nsw i32 30, %106, !dbg !689
  %108 = call noundef i32 @_Z3i2fi(i32 noundef %107), !dbg !689
  %109 = load i32, ptr %7, align 4, !dbg !691
  %110 = sext i32 %109 to i64, !dbg !692
  %111 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %110, !dbg !692
  %112 = getelementptr inbounds nuw %struct.object, ptr %111, i32 0, i32 20, !dbg !693
  store i32 %108, ptr %112, align 4, !dbg !694
  %113 = call noundef i32 @_Z3i2fi(i32 noundef 8), !dbg !695
  %114 = load i32, ptr %7, align 4, !dbg !696
  %115 = sext i32 %114 to i64, !dbg !697
  %116 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %115, !dbg !697
  %117 = getelementptr inbounds nuw %struct.object, ptr %116, i32 0, i32 22, !dbg !698
  %118 = getelementptr inbounds nuw %struct.light_info_s, ptr %117, i32 0, i32 0, !dbg !699
  store i32 %113, ptr %118, align 4, !dbg !700
  br label %120, !dbg !701

119:                                              ; preds = %70
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 1, ptr noundef @.str.10), !dbg !702
  call void @_Z4Int3v(), !dbg !704
  br label %120

120:                                              ; preds = %54, %60, %119, %104
  ret void, !dbg !705
}

declare void @_Z8_mprintfiPKcz(i32 noundef, ptr noundef, ...) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

declare noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef, ptr noundef, ptr noundef) #2

declare noundef ptr @_Z17vm_vec_scale_add2P10vms_vectorS0_i(ptr noundef, ptr noundef, i32 noundef) #2

declare noundef i32 @_Z10obj_createhhiP10vms_vectorP10vms_matrixihhh(i8 noundef zeroext, i8 noundef zeroext, i32 noundef, ptr noundef, ptr noundef, i32 noundef, i8 noundef zeroext, i8 noundef zeroext, i8 noundef zeroext) #2

declare void @_Z4Int3v() #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef ptr @_Z18create_morph_robotP7segmentP10vms_vectori(ptr noundef %0, ptr noundef %1, i32 noundef %2) #1 !dbg !706 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i16, align 2
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
    #dbg_declare(ptr %5, !842, !DIExpression(), !843)
  store ptr %1, ptr %6, align 8
    #dbg_declare(ptr %6, !844, !DIExpression(), !845)
  store i32 %2, ptr %7, align 4
    #dbg_declare(ptr %7, !846, !DIExpression(), !847)
    #dbg_declare(ptr %8, !848, !DIExpression(), !849)
    #dbg_declare(ptr %9, !850, !DIExpression(), !851)
    #dbg_declare(ptr %10, !852, !DIExpression(), !853)
  %11 = load i32, ptr @Player_num, align 4, !dbg !854
  %12 = sext i32 %11 to i64, !dbg !855
  %13 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %12, !dbg !855
  %14 = getelementptr inbounds nuw %struct.player, ptr %13, i32 0, i32 31, !dbg !856
  %15 = load i16, ptr %14, align 2, !dbg !857
  %16 = add i16 %15, 1, !dbg !857
  store i16 %16, ptr %14, align 2, !dbg !857
  %17 = load i32, ptr @Player_num, align 4, !dbg !858
  %18 = sext i32 %17 to i64, !dbg !859
  %19 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %18, !dbg !859
  %20 = getelementptr inbounds nuw %struct.player, ptr %19, i32 0, i32 32, !dbg !860
  %21 = load i16, ptr %20, align 4, !dbg !861
  %22 = add i16 %21, 1, !dbg !861
  store i16 %22, ptr %20, align 4, !dbg !861
  %23 = load i32, ptr %7, align 4, !dbg !862
  %24 = trunc i32 %23 to i8, !dbg !862
  %25 = load ptr, ptr %5, align 8, !dbg !863
  %26 = ptrtoint ptr %25 to i64, !dbg !864
  %27 = sub i64 %26, ptrtoint (ptr @Segments to i64), !dbg !864
  %28 = sdiv exact i64 %27, 512, !dbg !864
  %29 = trunc i64 %28 to i32, !dbg !863
  %30 = load ptr, ptr %6, align 8, !dbg !865
  %31 = load i32, ptr %7, align 4, !dbg !866
  %32 = sext i32 %31 to i64, !dbg !867
  %33 = getelementptr inbounds [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %32, !dbg !867
  %34 = getelementptr inbounds nuw %struct.robot_info, ptr %33, i32 0, i32 0, !dbg !868
  %35 = load i32, ptr %34, align 4, !dbg !868
  %36 = sext i32 %35 to i64, !dbg !869
  %37 = getelementptr inbounds [0 x %struct.polymodel], ptr @Polygon_models, i64 0, i64 %36, !dbg !869
  %38 = getelementptr inbounds nuw %struct.polymodel, ptr %37, i32 0, i32 13, !dbg !870
  %39 = load i32, ptr %38, align 4, !dbg !870
  %40 = call noundef i32 @_Z10obj_createhhiP10vms_vectorP10vms_matrixihhh(i8 noundef zeroext 2, i8 noundef zeroext %24, i32 noundef %29, ptr noundef %30, ptr noundef @vmd_identity_matrix, i32 noundef %39, i8 noundef zeroext 1, i8 noundef zeroext 1, i8 noundef zeroext 1), !dbg !871
  %41 = trunc i32 %40 to i16, !dbg !871
  store i16 %41, ptr %8, align 2, !dbg !872
  %42 = load i16, ptr %8, align 2, !dbg !873
  %43 = sext i16 %42 to i32, !dbg !873
  %44 = icmp slt i32 %43, 0, !dbg !875
  br i1 %44, label %45, label %46, !dbg !875

45:                                               ; preds = %3
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 1, ptr noundef @.str.11), !dbg !876
  call void @_Z4Int3v(), !dbg !878
  store ptr null, ptr %4, align 8, !dbg !879
  br label %121, !dbg !879

46:                                               ; preds = %3
  %47 = load i16, ptr %8, align 2, !dbg !880
  %48 = sext i16 %47 to i64, !dbg !881
  %49 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %48, !dbg !881
  store ptr %49, ptr %9, align 8, !dbg !882
  %50 = load ptr, ptr %9, align 8, !dbg !883
  %51 = getelementptr inbounds nuw %struct.object, ptr %50, i32 0, i32 2, !dbg !884
  %52 = load i8, ptr %51, align 1, !dbg !884
  %53 = zext i8 %52 to i64, !dbg !885
  %54 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %53, !dbg !885
  %55 = getelementptr inbounds nuw %struct.robot_info, ptr %54, i32 0, i32 0, !dbg !886
  %56 = load i32, ptr %55, align 4, !dbg !886
  %57 = load ptr, ptr %9, align 8, !dbg !887
  %58 = getelementptr inbounds nuw %struct.object, ptr %57, i32 0, i32 23, !dbg !888
  %59 = getelementptr inbounds nuw %struct.polyobj_info, ptr %58, i32 0, i32 0, !dbg !889
  store i32 %56, ptr %59, align 4, !dbg !890
  %60 = load ptr, ptr %9, align 8, !dbg !891
  %61 = getelementptr inbounds nuw %struct.object, ptr %60, i32 0, i32 23, !dbg !892
  %62 = getelementptr inbounds nuw %struct.polyobj_info, ptr %61, i32 0, i32 2, !dbg !893
  store i32 0, ptr %62, align 4, !dbg !894
  %63 = load ptr, ptr %9, align 8, !dbg !895
  %64 = getelementptr inbounds nuw %struct.object, ptr %63, i32 0, i32 2, !dbg !896
  %65 = load i8, ptr %64, align 1, !dbg !896
  %66 = zext i8 %65 to i64, !dbg !897
  %67 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %66, !dbg !897
  %68 = getelementptr inbounds nuw %struct.robot_info, ptr %67, i32 0, i32 20, !dbg !898
  %69 = load i32, ptr %68, align 4, !dbg !898
  %70 = load ptr, ptr %9, align 8, !dbg !899
  %71 = getelementptr inbounds nuw %struct.object, ptr %70, i32 0, i32 21, !dbg !900
  %72 = getelementptr inbounds nuw %struct.physics_info, ptr %71, i32 0, i32 2, !dbg !901
  store i32 %69, ptr %72, align 4, !dbg !902
  %73 = load ptr, ptr %9, align 8, !dbg !903
  %74 = getelementptr inbounds nuw %struct.object, ptr %73, i32 0, i32 2, !dbg !904
  %75 = load i8, ptr %74, align 1, !dbg !904
  %76 = zext i8 %75 to i64, !dbg !905
  %77 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %76, !dbg !905
  %78 = getelementptr inbounds nuw %struct.robot_info, ptr %77, i32 0, i32 21, !dbg !906
  %79 = load i32, ptr %78, align 4, !dbg !906
  %80 = load ptr, ptr %9, align 8, !dbg !907
  %81 = getelementptr inbounds nuw %struct.object, ptr %80, i32 0, i32 21, !dbg !908
  %82 = getelementptr inbounds nuw %struct.physics_info, ptr %81, i32 0, i32 3, !dbg !909
  store i32 %79, ptr %82, align 4, !dbg !910
  %83 = load ptr, ptr %9, align 8, !dbg !911
  %84 = getelementptr inbounds nuw %struct.object, ptr %83, i32 0, i32 21, !dbg !912
  %85 = getelementptr inbounds nuw %struct.physics_info, ptr %84, i32 0, i32 8, !dbg !913
  %86 = load i16, ptr %85, align 2, !dbg !914
  %87 = zext i16 %86 to i32, !dbg !914
  %88 = or i32 %87, 2, !dbg !914
  %89 = trunc i32 %88 to i16, !dbg !914
  store i16 %89, ptr %85, align 2, !dbg !914
  %90 = load ptr, ptr %9, align 8, !dbg !915
  %91 = getelementptr inbounds nuw %struct.object, ptr %90, i32 0, i32 2, !dbg !916
  %92 = load i8, ptr %91, align 1, !dbg !916
  %93 = zext i8 %92 to i64, !dbg !917
  %94 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %93, !dbg !917
  %95 = getelementptr inbounds nuw %struct.robot_info, ptr %94, i32 0, i32 19, !dbg !918
  %96 = load i32, ptr %95, align 4, !dbg !918
  %97 = load ptr, ptr %9, align 8, !dbg !919
  %98 = getelementptr inbounds nuw %struct.object, ptr %97, i32 0, i32 14, !dbg !920
  store i32 %96, ptr %98, align 4, !dbg !921
  %99 = load ptr, ptr %9, align 8, !dbg !922
  %100 = getelementptr inbounds nuw %struct.object, ptr %99, i32 0, i32 2, !dbg !923
  %101 = load i8, ptr %100, align 1, !dbg !923
  %102 = zext i8 %101 to i64, !dbg !924
  %103 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %102, !dbg !924
  %104 = getelementptr inbounds nuw %struct.robot_info, ptr %103, i32 0, i32 48, !dbg !925
  %105 = load i8, ptr %104, align 2, !dbg !925
  %106 = zext i8 %105 to i32, !dbg !924
  store i32 %106, ptr %10, align 4, !dbg !926
  %107 = load ptr, ptr %9, align 8, !dbg !927
  %108 = ptrtoint ptr %107 to i64, !dbg !928
  %109 = sub i64 %108, ptrtoint (ptr @Objects to i64), !dbg !928
  %110 = sdiv exact i64 %109, 268, !dbg !928
  %111 = trunc i64 %110 to i32, !dbg !927
  %112 = load i32, ptr %10, align 4, !dbg !929
  call void @_Z14init_ai_objectiii(i32 noundef %111, i32 noundef %112, i32 noundef -1), !dbg !930
  %113 = load ptr, ptr %9, align 8, !dbg !931
  call void @_Z21create_n_segment_pathP6objectii(ptr noundef %113, i32 noundef 6, i32 noundef -1), !dbg !932
  %114 = load i32, ptr %10, align 4, !dbg !933
  %115 = call noundef i32 @_Z19ai_behavior_to_modei(i32 noundef %114), !dbg !934
  %116 = load i16, ptr %8, align 2, !dbg !935
  %117 = sext i16 %116 to i64, !dbg !936
  %118 = getelementptr inbounds [350 x %struct.ai_local], ptr @Ai_local_info, i64 0, i64 %117, !dbg !936
  %119 = getelementptr inbounds nuw %struct.ai_local, ptr %118, i32 0, i32 3, !dbg !937
  store i32 %115, ptr %119, align 4, !dbg !938
  %120 = load ptr, ptr %9, align 8, !dbg !939
  store ptr %120, ptr %4, align 8, !dbg !940
  br label %121, !dbg !940

121:                                              ; preds = %46, %45
  %122 = load ptr, ptr %4, align 8, !dbg !941
  ret ptr %122, !dbg !941
}

declare void @_Z14init_ai_objectiii(i32 noundef, i32 noundef, i32 noundef) #2

declare void @_Z21create_n_segment_pathP6objectii(ptr noundef, i32 noundef, i32 noundef) #2

declare noundef i32 @_Z19ai_behavior_to_modei(i32 noundef) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z15robotmaker_procP10FuelCenter(ptr noundef %0) #1 !dbg !942 {
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
    #dbg_declare(ptr %2, !945, !DIExpression(), !946)
    #dbg_declare(ptr %3, !947, !DIExpression(), !948)
    #dbg_declare(ptr %4, !949, !DIExpression(), !950)
    #dbg_declare(ptr %5, !951, !DIExpression(), !952)
    #dbg_declare(ptr %6, !953, !DIExpression(), !954)
    #dbg_declare(ptr %7, !955, !DIExpression(), !956)
    #dbg_declare(ptr %8, !957, !DIExpression(), !958)
    #dbg_declare(ptr %9, !959, !DIExpression(), !960)
    #dbg_declare(ptr %10, !961, !DIExpression(), !962)
  %21 = load ptr, ptr %2, align 8, !dbg !963
  %22 = getelementptr inbounds nuw %struct.FuelCenter, ptr %21, i32 0, i32 3, !dbg !965
  %23 = load i8, ptr %22, align 1, !dbg !965
  %24 = sext i8 %23 to i32, !dbg !963
  %25 = icmp eq i32 %24, 0, !dbg !966
  br i1 %25, label %26, label %27, !dbg !966

26:                                               ; preds = %1
  br label %451, !dbg !967

27:                                               ; preds = %1
  %28 = load ptr, ptr %2, align 8, !dbg !968
  %29 = getelementptr inbounds nuw %struct.FuelCenter, ptr %28, i32 0, i32 9, !dbg !970
  %30 = load i32, ptr %29, align 4, !dbg !970
  %31 = icmp sgt i32 %30, 0, !dbg !971
  br i1 %31, label %32, label %50, !dbg !971

32:                                               ; preds = %27
  %33 = load i32, ptr @FrameTime, align 4, !dbg !972
  %34 = load ptr, ptr %2, align 8, !dbg !974
  %35 = getelementptr inbounds nuw %struct.FuelCenter, ptr %34, i32 0, i32 9, !dbg !975
  %36 = load i32, ptr %35, align 4, !dbg !976
  %37 = sub nsw i32 %36, %33, !dbg !976
  store i32 %37, ptr %35, align 4, !dbg !976
  %38 = load ptr, ptr %2, align 8, !dbg !977
  %39 = getelementptr inbounds nuw %struct.FuelCenter, ptr %38, i32 0, i32 9, !dbg !979
  %40 = load i32, ptr %39, align 4, !dbg !979
  %41 = icmp sle i32 %40, 0, !dbg !980
  br i1 %41, label %42, label %49, !dbg !980

42:                                               ; preds = %32
  %43 = load ptr, ptr %2, align 8, !dbg !981
  %44 = ptrtoint ptr %43 to i64, !dbg !981
  %45 = sub i64 %44, ptrtoint (ptr @Station to i64), !dbg !981
  %46 = sdiv exact i64 %45, 40, !dbg !981
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.12, i64 noundef %46), !dbg !981
  %47 = load ptr, ptr %2, align 8, !dbg !983
  %48 = getelementptr inbounds nuw %struct.FuelCenter, ptr %47, i32 0, i32 3, !dbg !984
  store i8 0, ptr %48, align 1, !dbg !985
  br label %49, !dbg !986

49:                                               ; preds = %42, %32
  br label %50, !dbg !987

50:                                               ; preds = %49, %27
  %51 = load ptr, ptr %2, align 8, !dbg !988
  %52 = getelementptr inbounds nuw %struct.FuelCenter, ptr %51, i32 0, i32 6, !dbg !990
  %53 = load i32, ptr %52, align 4, !dbg !990
  %54 = icmp sle i32 %53, 0, !dbg !991
  br i1 %54, label %55, label %56, !dbg !991

55:                                               ; preds = %50
  br label %451, !dbg !992

56:                                               ; preds = %50
  %57 = load ptr, ptr %2, align 8, !dbg !994
  %58 = getelementptr inbounds nuw %struct.FuelCenter, ptr %57, i32 0, i32 1, !dbg !995
  %59 = load i32, ptr %58, align 4, !dbg !995
  %60 = sext i32 %59 to i64, !dbg !996
  %61 = getelementptr inbounds [0 x %struct.segment2], ptr @Segment2s, i64 0, i64 %60, !dbg !996
  %62 = getelementptr inbounds nuw %struct.segment2, ptr %61, i32 0, i32 1, !dbg !997
  %63 = load i8, ptr %62, align 1, !dbg !997
  %64 = sext i8 %63 to i32, !dbg !996
  store i32 %64, ptr %5, align 4, !dbg !998
  %65 = load i32, ptr %5, align 4, !dbg !999
  %66 = icmp eq i32 %65, -1, !dbg !1001
  br i1 %66, label %67, label %71, !dbg !1001

67:                                               ; preds = %56
  %68 = load ptr, ptr %2, align 8, !dbg !1002
  %69 = getelementptr inbounds nuw %struct.FuelCenter, ptr %68, i32 0, i32 1, !dbg !1002
  %70 = load i32, ptr %69, align 4, !dbg !1002
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.13, i32 noundef %70), !dbg !1002
  br label %451, !dbg !1004

71:                                               ; preds = %56
  %72 = load i32, ptr %5, align 4, !dbg !1005
  %73 = sext i32 %72 to i64, !dbg !1007
  %74 = getelementptr inbounds [20 x %struct.matcen_info], ptr @RobotCenters, i64 0, i64 %73, !dbg !1007
  %75 = getelementptr inbounds nuw %struct.matcen_info, ptr %74, i32 0, i32 0, !dbg !1008
  %76 = getelementptr inbounds [2 x i32], ptr %75, i64 0, i64 0, !dbg !1007
  %77 = load i32, ptr %76, align 4, !dbg !1007
  %78 = icmp eq i32 %77, 0, !dbg !1009
  br i1 %78, label %79, label %88, !dbg !1010

79:                                               ; preds = %71
  %80 = load i32, ptr %5, align 4, !dbg !1011
  %81 = sext i32 %80 to i64, !dbg !1012
  %82 = getelementptr inbounds [20 x %struct.matcen_info], ptr @RobotCenters, i64 0, i64 %81, !dbg !1012
  %83 = getelementptr inbounds nuw %struct.matcen_info, ptr %82, i32 0, i32 0, !dbg !1013
  %84 = getelementptr inbounds [2 x i32], ptr %83, i64 0, i64 1, !dbg !1012
  %85 = load i32, ptr %84, align 4, !dbg !1012
  %86 = icmp eq i32 %85, 0, !dbg !1014
  br i1 %86, label %87, label %88, !dbg !1010

87:                                               ; preds = %79
  br label %451, !dbg !1015

88:                                               ; preds = %79, %71
  %89 = load i32, ptr @Player_num, align 4, !dbg !1017
  %90 = sext i32 %89 to i64, !dbg !1019
  %91 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %90, !dbg !1019
  %92 = getelementptr inbounds nuw %struct.player, ptr %91, i32 0, i32 31, !dbg !1020
  %93 = load i16, ptr %92, align 2, !dbg !1020
  %94 = sext i16 %93 to i32, !dbg !1019
  %95 = load i32, ptr @Player_num, align 4, !dbg !1021
  %96 = sext i32 %95 to i64, !dbg !1022
  %97 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %96, !dbg !1022
  %98 = getelementptr inbounds nuw %struct.player, ptr %97, i32 0, i32 29, !dbg !1023
  %99 = load i16, ptr %98, align 2, !dbg !1023
  %100 = sext i16 %99 to i32, !dbg !1022
  %101 = sub nsw i32 %94, %100, !dbg !1024
  %102 = load i32, ptr @Gamesave_num_org_robots, align 4, !dbg !1025
  %103 = load i32, ptr @Num_extry_robots, align 4, !dbg !1026
  %104 = add nsw i32 %102, %103, !dbg !1027
  %105 = icmp sge i32 %101, %104, !dbg !1028
  br i1 %105, label %106, label %114, !dbg !1028

106:                                              ; preds = %88
  %107 = load i32, ptr @FrameCount, align 4, !dbg !1029
  %108 = load i32, ptr @FrameCount_last_msg, align 4, !dbg !1032
  %109 = add nsw i32 %108, 20, !dbg !1033
  %110 = icmp sgt i32 %107, %109, !dbg !1034
  br i1 %110, label %111, label %113, !dbg !1034

111:                                              ; preds = %106
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.14), !dbg !1035
  %112 = load i32, ptr @FrameCount, align 4, !dbg !1037
  store i32 %112, ptr @FrameCount_last_msg, align 4, !dbg !1038
  br label %113, !dbg !1039

113:                                              ; preds = %111, %106
  br label %451, !dbg !1040

114:                                              ; preds = %88
  %115 = load i32, ptr @FrameTime, align 4, !dbg !1041
  %116 = load ptr, ptr %2, align 8, !dbg !1042
  %117 = getelementptr inbounds nuw %struct.FuelCenter, ptr %116, i32 0, i32 8, !dbg !1043
  %118 = load i32, ptr %117, align 4, !dbg !1044
  %119 = add nsw i32 %118, %115, !dbg !1044
  store i32 %119, ptr %117, align 4, !dbg !1044
  %120 = load ptr, ptr %2, align 8, !dbg !1045
  %121 = getelementptr inbounds nuw %struct.FuelCenter, ptr %120, i32 0, i32 2, !dbg !1046
  %122 = load i8, ptr %121, align 4, !dbg !1046
  %123 = sext i8 %122 to i32, !dbg !1045
  switch i32 %123, label %446 [
    i32 0, label %124
    i32 1, label %313
  ], !dbg !1047

124:                                              ; preds = %114
  %125 = load i32, ptr @Game_mode, align 4, !dbg !1048
  %126 = and i32 %125, 38, !dbg !1051
  %127 = icmp ne i32 %126, 0, !dbg !1048
  br i1 %127, label %128, label %130, !dbg !1048

128:                                              ; preds = %124
  %129 = call noundef i32 @_Z3i2fi(i32 noundef 5), !dbg !1052
  store i32 %129, ptr %9, align 4, !dbg !1054
  br label %157, !dbg !1055

130:                                              ; preds = %124
  %131 = load ptr, ptr @ConsoleObject, align 8, !dbg !1056
  %132 = getelementptr inbounds nuw %struct.object, ptr %131, i32 0, i32 11, !dbg !1058
  %133 = load ptr, ptr %2, align 8, !dbg !1059
  %134 = getelementptr inbounds nuw %struct.FuelCenter, ptr %133, i32 0, i32 10, !dbg !1060
  %135 = call noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef %132, ptr noundef %134), !dbg !1061
  store i32 %135, ptr %3, align 4, !dbg !1062
  %136 = load i32, ptr %3, align 4, !dbg !1063
  %137 = sdiv i32 %136, 64, !dbg !1064
  %138 = call noundef i32 @_Z6P_Randv(), !dbg !1065
  %139 = mul nsw i32 %138, 2, !dbg !1066
  %140 = add nsw i32 %137, %139, !dbg !1067
  %141 = add nsw i32 %140, 131072, !dbg !1068
  store i32 %141, ptr %9, align 4, !dbg !1069
  %142 = load i32, ptr %9, align 4, !dbg !1070
  %143 = call noundef i32 @_Z3i2fi(i32 noundef 5), !dbg !1072
  %144 = icmp sgt i32 %142, %143, !dbg !1073
  br i1 %144, label %145, label %149, !dbg !1073

145:                                              ; preds = %130
  %146 = call noundef i32 @_Z3i2fi(i32 noundef 5), !dbg !1074
  %147 = call noundef i32 @_Z6P_Randv(), !dbg !1075
  %148 = add nsw i32 %146, %147, !dbg !1076
  store i32 %148, ptr %9, align 4, !dbg !1077
  br label %149, !dbg !1078

149:                                              ; preds = %145, %130
  %150 = load i32, ptr %9, align 4, !dbg !1079
  %151 = icmp slt i32 %150, 131072, !dbg !1081
  br i1 %151, label %152, label %156, !dbg !1081

152:                                              ; preds = %149
  %153 = call noundef i32 @_Z6P_Randv(), !dbg !1082
  %154 = mul nsw i32 %153, 2, !dbg !1083
  %155 = add nsw i32 98304, %154, !dbg !1084
  store i32 %155, ptr %9, align 4, !dbg !1085
  br label %156, !dbg !1086

156:                                              ; preds = %152, %149
  br label %157

157:                                              ; preds = %156, %128
  %158 = load ptr, ptr %2, align 8, !dbg !1087
  %159 = getelementptr inbounds nuw %struct.FuelCenter, ptr %158, i32 0, i32 8, !dbg !1089
  %160 = load i32, ptr %159, align 4, !dbg !1089
  %161 = load i32, ptr %9, align 4, !dbg !1090
  %162 = icmp sgt i32 %160, %161, !dbg !1091
  br i1 %162, label %163, label %312, !dbg !1091

163:                                              ; preds = %157
    #dbg_declare(ptr %11, !1092, !DIExpression(), !1094)
  store i32 0, ptr %11, align 4, !dbg !1094
    #dbg_declare(ptr %12, !1095, !DIExpression(), !1096)
    #dbg_declare(ptr %13, !1097, !DIExpression(), !1098)
  %164 = load ptr, ptr %2, align 8, !dbg !1099
  %165 = ptrtoint ptr %164 to i64, !dbg !1100
  %166 = sub i64 %165, ptrtoint (ptr @Station to i64), !dbg !1100
  %167 = sdiv exact i64 %166, 40, !dbg !1100
  %168 = trunc i64 %167 to i32, !dbg !1099
  store i32 %168, ptr %13, align 4, !dbg !1098
    #dbg_declare(ptr %14, !1101, !DIExpression(), !1102)
  store i32 0, ptr %12, align 4, !dbg !1103
  br label %169, !dbg !1105

169:                                              ; preds = %198, %163
  %170 = load i32, ptr %12, align 4, !dbg !1106
  %171 = load i32, ptr @Highest_object_index, align 4, !dbg !1108
  %172 = icmp sle i32 %170, %171, !dbg !1109
  br i1 %172, label %173, label %201, !dbg !1110

173:                                              ; preds = %169
  %174 = load i32, ptr %12, align 4, !dbg !1111
  %175 = sext i32 %174 to i64, !dbg !1113
  %176 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %175, !dbg !1113
  %177 = getelementptr inbounds nuw %struct.object, ptr %176, i32 0, i32 1, !dbg !1114
  %178 = load i8, ptr %177, align 4, !dbg !1114
  %179 = zext i8 %178 to i32, !dbg !1113
  %180 = icmp eq i32 %179, 2, !dbg !1115
  br i1 %180, label %181, label %197, !dbg !1115

181:                                              ; preds = %173
  %182 = load i32, ptr %12, align 4, !dbg !1116
  %183 = sext i32 %182 to i64, !dbg !1118
  %184 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %183, !dbg !1118
  %185 = getelementptr inbounds nuw %struct.object, ptr %184, i32 0, i32 19, !dbg !1119
  %186 = load i8, ptr %185, align 1, !dbg !1119
  %187 = sext i8 %186 to i32, !dbg !1118
  %188 = xor i32 %187, 128, !dbg !1120
  %189 = trunc i32 %188 to i8, !dbg !1121
  %190 = sext i8 %189 to i32, !dbg !1122
  %191 = load i32, ptr %13, align 4, !dbg !1123
  %192 = icmp eq i32 %190, %191, !dbg !1124
  br i1 %192, label %193, label %196, !dbg !1124

193:                                              ; preds = %181
  %194 = load i32, ptr %11, align 4, !dbg !1125
  %195 = add nsw i32 %194, 1, !dbg !1125
  store i32 %195, ptr %11, align 4, !dbg !1125
  br label %196, !dbg !1126

196:                                              ; preds = %193, %181
  br label %197, !dbg !1123

197:                                              ; preds = %196, %173
  br label %198, !dbg !1127

198:                                              ; preds = %197
  %199 = load i32, ptr %12, align 4, !dbg !1128
  %200 = add nsw i32 %199, 1, !dbg !1128
  store i32 %200, ptr %12, align 4, !dbg !1128
  br label %169, !dbg !1129, !llvm.loop !1130

201:                                              ; preds = %169
  %202 = load i32, ptr %11, align 4, !dbg !1132
  %203 = load i32, ptr @Difficulty_level, align 4, !dbg !1134
  %204 = add nsw i32 %203, 3, !dbg !1135
  %205 = icmp sgt i32 %202, %204, !dbg !1136
  br i1 %205, label %206, label %213, !dbg !1136

206:                                              ; preds = %201
  %207 = load i32, ptr %13, align 4, !dbg !1137
  %208 = load i32, ptr %11, align 4, !dbg !1137
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.15, i32 noundef %207, i32 noundef %208), !dbg !1137
  %209 = load ptr, ptr %2, align 8, !dbg !1139
  %210 = getelementptr inbounds nuw %struct.FuelCenter, ptr %209, i32 0, i32 8, !dbg !1140
  %211 = load i32, ptr %210, align 4, !dbg !1141
  %212 = sdiv i32 %211, 2, !dbg !1141
  store i32 %212, ptr %210, align 4, !dbg !1141
  br label %451, !dbg !1142

213:                                              ; preds = %201
  store i32 0, ptr %11, align 4, !dbg !1143
  %214 = load ptr, ptr %2, align 8, !dbg !1144
  %215 = getelementptr inbounds nuw %struct.FuelCenter, ptr %214, i32 0, i32 1, !dbg !1145
  %216 = load i32, ptr %215, align 4, !dbg !1145
  store i32 %216, ptr %6, align 4, !dbg !1146
  %217 = load i32, ptr %6, align 4, !dbg !1147
  %218 = sext i32 %217 to i64, !dbg !1149
  %219 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %218, !dbg !1149
  %220 = getelementptr inbounds nuw %struct.segment, ptr %219, i32 0, i32 3, !dbg !1150
  %221 = load i32, ptr %220, align 4, !dbg !1150
  store i32 %221, ptr %7, align 4, !dbg !1151
  br label %222, !dbg !1152

222:                                              ; preds = %266, %213
  %223 = load i32, ptr %7, align 4, !dbg !1153
  %224 = icmp ne i32 %223, -1, !dbg !1155
  br i1 %224, label %225, label %273, !dbg !1156

225:                                              ; preds = %222
  %226 = load i32, ptr %11, align 4, !dbg !1157
  %227 = add nsw i32 %226, 1, !dbg !1157
  store i32 %227, ptr %11, align 4, !dbg !1157
  %228 = load i32, ptr %11, align 4, !dbg !1159
  %229 = icmp sgt i32 %228, 350, !dbg !1161
  br i1 %229, label %230, label %232, !dbg !1161

230:                                              ; preds = %225
  %231 = load i32, ptr %6, align 4, !dbg !1162
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.16, i32 noundef %231), !dbg !1162
  call void @_Z4Int3v(), !dbg !1164
  br label %451, !dbg !1165

232:                                              ; preds = %225
  %233 = load i32, ptr %7, align 4, !dbg !1166
  %234 = sext i32 %233 to i64, !dbg !1168
  %235 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %234, !dbg !1168
  %236 = getelementptr inbounds nuw %struct.object, ptr %235, i32 0, i32 1, !dbg !1169
  %237 = load i8, ptr %236, align 4, !dbg !1169
  %238 = zext i8 %237 to i32, !dbg !1168
  %239 = icmp eq i32 %238, 2, !dbg !1170
  br i1 %239, label %240, label %248, !dbg !1170

240:                                              ; preds = %232
  %241 = load i32, ptr %7, align 4, !dbg !1171
  %242 = sext i32 %241 to i64, !dbg !1173
  %243 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %242, !dbg !1173
  call void @_Z40collide_robot_and_materialization_centerP6object(ptr noundef %243), !dbg !1174
  %244 = load i32, ptr %9, align 4, !dbg !1175
  %245 = sdiv i32 %244, 2, !dbg !1176
  %246 = load ptr, ptr %2, align 8, !dbg !1177
  %247 = getelementptr inbounds nuw %struct.FuelCenter, ptr %246, i32 0, i32 8, !dbg !1178
  store i32 %245, ptr %247, align 4, !dbg !1179
  br label %451, !dbg !1180

248:                                              ; preds = %232
  %249 = load i32, ptr %7, align 4, !dbg !1181
  %250 = sext i32 %249 to i64, !dbg !1183
  %251 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %250, !dbg !1183
  %252 = getelementptr inbounds nuw %struct.object, ptr %251, i32 0, i32 1, !dbg !1184
  %253 = load i8, ptr %252, align 4, !dbg !1184
  %254 = zext i8 %253 to i32, !dbg !1183
  %255 = icmp eq i32 %254, 4, !dbg !1185
  br i1 %255, label %256, label %264, !dbg !1185

256:                                              ; preds = %248
  %257 = load i32, ptr %7, align 4, !dbg !1186
  %258 = sext i32 %257 to i64, !dbg !1188
  %259 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %258, !dbg !1188
  call void @_Z41collide_player_and_materialization_centerP6object(ptr noundef %259), !dbg !1189
  %260 = load i32, ptr %9, align 4, !dbg !1190
  %261 = sdiv i32 %260, 2, !dbg !1191
  %262 = load ptr, ptr %2, align 8, !dbg !1192
  %263 = getelementptr inbounds nuw %struct.FuelCenter, ptr %262, i32 0, i32 8, !dbg !1193
  store i32 %261, ptr %263, align 4, !dbg !1194
  br label %451, !dbg !1195

264:                                              ; preds = %248
  br label %265

265:                                              ; preds = %264
  br label %266, !dbg !1196

266:                                              ; preds = %265
  %267 = load i32, ptr %7, align 4, !dbg !1197
  %268 = sext i32 %267 to i64, !dbg !1198
  %269 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %268, !dbg !1198
  %270 = getelementptr inbounds nuw %struct.object, ptr %269, i32 0, i32 3, !dbg !1199
  %271 = load i16, ptr %270, align 2, !dbg !1199
  %272 = sext i16 %271 to i32, !dbg !1198
  store i32 %272, ptr %7, align 4, !dbg !1200
  br label %222, !dbg !1201, !llvm.loop !1202

273:                                              ; preds = %222
  %274 = load ptr, ptr %2, align 8, !dbg !1204
  %275 = getelementptr inbounds nuw %struct.FuelCenter, ptr %274, i32 0, i32 1, !dbg !1205
  %276 = load i32, ptr %275, align 4, !dbg !1205
  %277 = sext i32 %276 to i64, !dbg !1206
  %278 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %277, !dbg !1206
  call void @_Z22compute_segment_centerP10vms_vectorP7segment(ptr noundef %4, ptr noundef %278), !dbg !1207
  %279 = load ptr, ptr %2, align 8, !dbg !1208
  %280 = getelementptr inbounds nuw %struct.FuelCenter, ptr %279, i32 0, i32 1, !dbg !1209
  %281 = load i32, ptr %280, align 4, !dbg !1209
  %282 = trunc i32 %281 to i16, !dbg !1208
  %283 = call noundef i32 @_Z3i2fi(i32 noundef 10), !dbg !1210
  %284 = call noundef ptr @_Z23object_create_explosionsP10vms_vectorii(i16 noundef signext %282, ptr noundef %4, i32 noundef %283, i32 noundef 10), !dbg !1211
  store ptr %284, ptr %14, align 8, !dbg !1212
  %285 = load ptr, ptr %14, align 8, !dbg !1213
  %286 = icmp ne ptr %285, null, !dbg !1213
  br i1 %286, label %287, label %295, !dbg !1213

287:                                              ; preds = %273
  %288 = load ptr, ptr %14, align 8, !dbg !1215
  %289 = getelementptr inbounds nuw %struct.object, ptr %288, i32 0, i32 12, !dbg !1216
  %290 = load ptr, ptr %2, align 8, !dbg !1217
  %291 = getelementptr inbounds nuw %struct.FuelCenter, ptr %290, i32 0, i32 1, !dbg !1218
  %292 = load i32, ptr %291, align 4, !dbg !1218
  %293 = sext i32 %292 to i64, !dbg !1219
  %294 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %293, !dbg !1219
  call void @_Z27extract_orient_from_segmentP10vms_matrixP7segment(ptr noundef %289, ptr noundef %294), !dbg !1220
  br label %295, !dbg !1220

295:                                              ; preds = %287, %273
  %296 = load i16, ptr getelementptr inbounds nuw (%struct.vclip, ptr getelementptr inbounds ([110 x %struct.vclip], ptr @Vclip, i64 0, i64 10), i32 0, i32 4), align 4, !dbg !1221
  %297 = sext i16 %296 to i32, !dbg !1223
  %298 = icmp sgt i32 %297, -1, !dbg !1224
  br i1 %298, label %299, label %307, !dbg !1224

299:                                              ; preds = %295
  %300 = load i16, ptr getelementptr inbounds nuw (%struct.vclip, ptr getelementptr inbounds ([110 x %struct.vclip], ptr @Vclip, i64 0, i64 10), i32 0, i32 4), align 4, !dbg !1225
  %301 = sext i16 %300 to i32, !dbg !1227
  %302 = load ptr, ptr %2, align 8, !dbg !1228
  %303 = getelementptr inbounds nuw %struct.FuelCenter, ptr %302, i32 0, i32 1, !dbg !1229
  %304 = load i32, ptr %303, align 4, !dbg !1229
  %305 = trunc i32 %304 to i16, !dbg !1228
  %306 = call noundef i32 @_Z22digi_link_sound_to_posissP10vms_vectorii(i32 noundef %301, i16 noundef signext %305, i16 noundef signext 0, ptr noundef %4, i32 noundef 0, i32 noundef 65536), !dbg !1230
  br label %307, !dbg !1231

307:                                              ; preds = %299, %295
  %308 = load ptr, ptr %2, align 8, !dbg !1232
  %309 = getelementptr inbounds nuw %struct.FuelCenter, ptr %308, i32 0, i32 2, !dbg !1233
  store i8 1, ptr %309, align 4, !dbg !1234
  %310 = load ptr, ptr %2, align 8, !dbg !1235
  %311 = getelementptr inbounds nuw %struct.FuelCenter, ptr %310, i32 0, i32 8, !dbg !1236
  store i32 0, ptr %311, align 4, !dbg !1237
  br label %312, !dbg !1238

312:                                              ; preds = %307, %157
  br label %451, !dbg !1239

313:                                              ; preds = %114
  %314 = load ptr, ptr %2, align 8, !dbg !1240
  %315 = getelementptr inbounds nuw %struct.FuelCenter, ptr %314, i32 0, i32 8, !dbg !1242
  %316 = load i32, ptr %315, align 4, !dbg !1242
  %317 = load i32, ptr getelementptr inbounds ([110 x %struct.vclip], ptr @Vclip, i64 0, i64 10), align 4, !dbg !1243
  %318 = sdiv i32 %317, 2, !dbg !1244
  %319 = icmp sgt i32 %316, %318, !dbg !1245
  br i1 %319, label %320, label %445, !dbg !1245

320:                                              ; preds = %313
  %321 = load i32, ptr @EnergyToCreateOneRobot, align 4, !dbg !1246
  %322 = load ptr, ptr %2, align 8, !dbg !1248
  %323 = getelementptr inbounds nuw %struct.FuelCenter, ptr %322, i32 0, i32 6, !dbg !1249
  %324 = load i32, ptr %323, align 4, !dbg !1250
  %325 = sub nsw i32 %324, %321, !dbg !1250
  store i32 %325, ptr %323, align 4, !dbg !1250
  %326 = load ptr, ptr %2, align 8, !dbg !1251
  %327 = getelementptr inbounds nuw %struct.FuelCenter, ptr %326, i32 0, i32 2, !dbg !1252
  store i8 0, ptr %327, align 4, !dbg !1253
  %328 = load ptr, ptr %2, align 8, !dbg !1254
  %329 = getelementptr inbounds nuw %struct.FuelCenter, ptr %328, i32 0, i32 8, !dbg !1255
  store i32 0, ptr %329, align 4, !dbg !1256
  %330 = load ptr, ptr %2, align 8, !dbg !1257
  %331 = getelementptr inbounds nuw %struct.FuelCenter, ptr %330, i32 0, i32 1, !dbg !1258
  %332 = load i32, ptr %331, align 4, !dbg !1258
  %333 = sext i32 %332 to i64, !dbg !1259
  %334 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %333, !dbg !1259
  call void @_Z22compute_segment_centerP10vms_vectorP7segment(ptr noundef %4, ptr noundef %334), !dbg !1260
  %335 = load i32, ptr %5, align 4, !dbg !1261
  %336 = sext i32 %335 to i64, !dbg !1263
  %337 = getelementptr inbounds [20 x %struct.matcen_info], ptr @RobotCenters, i64 0, i64 %336, !dbg !1263
  %338 = getelementptr inbounds nuw %struct.matcen_info, ptr %337, i32 0, i32 0, !dbg !1264
  %339 = getelementptr inbounds [2 x i32], ptr %338, i64 0, i64 0, !dbg !1263
  %340 = load i32, ptr %339, align 4, !dbg !1263
  %341 = icmp ne i32 %340, 0, !dbg !1265
  br i1 %341, label %350, label %342, !dbg !1266

342:                                              ; preds = %320
  %343 = load i32, ptr %5, align 4, !dbg !1267
  %344 = sext i32 %343 to i64, !dbg !1268
  %345 = getelementptr inbounds [20 x %struct.matcen_info], ptr @RobotCenters, i64 0, i64 %344, !dbg !1268
  %346 = getelementptr inbounds nuw %struct.matcen_info, ptr %345, i32 0, i32 0, !dbg !1269
  %347 = getelementptr inbounds [2 x i32], ptr %346, i64 0, i64 1, !dbg !1268
  %348 = load i32, ptr %347, align 4, !dbg !1268
  %349 = icmp ne i32 %348, 0, !dbg !1270
  br i1 %349, label %350, label %444, !dbg !1266

350:                                              ; preds = %342, %320
    #dbg_declare(ptr %15, !1271, !DIExpression(), !1273)
    #dbg_declare(ptr %16, !1274, !DIExpression(), !1275)
    #dbg_declare(ptr %17, !1276, !DIExpression(), !1280)
    #dbg_declare(ptr %18, !1281, !DIExpression(), !1282)
    #dbg_declare(ptr %19, !1283, !DIExpression(), !1284)
    #dbg_declare(ptr %20, !1285, !DIExpression(), !1286)
  store i32 0, ptr %18, align 4, !dbg !1287
  store i32 0, ptr %20, align 4, !dbg !1288
  br label %351, !dbg !1290

351:                                              ; preds = %385, %350
  %352 = load i32, ptr %20, align 4, !dbg !1291
  %353 = icmp slt i32 %352, 2, !dbg !1293
  br i1 %353, label %354, label %388, !dbg !1294

354:                                              ; preds = %351
  %355 = load i32, ptr %20, align 4, !dbg !1295
  %356 = mul nsw i32 %355, 32, !dbg !1297
  store i32 %356, ptr %19, align 4, !dbg !1298
  %357 = load i32, ptr %5, align 4, !dbg !1299
  %358 = sext i32 %357 to i64, !dbg !1300
  %359 = getelementptr inbounds [20 x %struct.matcen_info], ptr @RobotCenters, i64 0, i64 %358, !dbg !1300
  %360 = getelementptr inbounds nuw %struct.matcen_info, ptr %359, i32 0, i32 0, !dbg !1301
  %361 = load i32, ptr %20, align 4, !dbg !1302
  %362 = sext i32 %361 to i64, !dbg !1300
  %363 = getelementptr inbounds [2 x i32], ptr %360, i64 0, i64 %362, !dbg !1300
  %364 = load i32, ptr %363, align 4, !dbg !1300
  store i32 %364, ptr %16, align 4, !dbg !1303
  br label %365, !dbg !1304

365:                                              ; preds = %379, %354
  %366 = load i32, ptr %16, align 4, !dbg !1305
  %367 = icmp ne i32 %366, 0, !dbg !1305
  br i1 %367, label %368, label %384, !dbg !1304

368:                                              ; preds = %365
  %369 = load i32, ptr %16, align 4, !dbg !1306
  %370 = and i32 %369, 1, !dbg !1309
  %371 = icmp ne i32 %370, 0, !dbg !1306
  br i1 %371, label %372, label %379, !dbg !1306

372:                                              ; preds = %368
  %373 = load i32, ptr %19, align 4, !dbg !1310
  %374 = trunc i32 %373 to i8, !dbg !1310
  %375 = load i32, ptr %18, align 4, !dbg !1311
  %376 = add nsw i32 %375, 1, !dbg !1311
  store i32 %376, ptr %18, align 4, !dbg !1311
  %377 = sext i32 %375 to i64, !dbg !1312
  %378 = getelementptr inbounds [64 x i8], ptr %17, i64 0, i64 %377, !dbg !1312
  store i8 %374, ptr %378, align 1, !dbg !1313
  br label %379, !dbg !1312

379:                                              ; preds = %372, %368
  %380 = load i32, ptr %16, align 4, !dbg !1314
  %381 = lshr i32 %380, 1, !dbg !1314
  store i32 %381, ptr %16, align 4, !dbg !1314
  %382 = load i32, ptr %19, align 4, !dbg !1315
  %383 = add nsw i32 %382, 1, !dbg !1315
  store i32 %383, ptr %19, align 4, !dbg !1315
  br label %365, !dbg !1304, !llvm.loop !1316

384:                                              ; preds = %365
  br label %385, !dbg !1318

385:                                              ; preds = %384
  %386 = load i32, ptr %20, align 4, !dbg !1319
  %387 = add nsw i32 %386, 1, !dbg !1319
  store i32 %387, ptr %20, align 4, !dbg !1319
  br label %351, !dbg !1320, !llvm.loop !1321

388:                                              ; preds = %351
  %389 = load i32, ptr %18, align 4, !dbg !1323
  %390 = icmp eq i32 %389, 1, !dbg !1325
  br i1 %390, label %391, label %395, !dbg !1325

391:                                              ; preds = %388
  %392 = getelementptr inbounds [64 x i8], ptr %17, i64 0, i64 0, !dbg !1326
  %393 = load i8, ptr %392, align 1, !dbg !1326
  %394 = sext i8 %393 to i32, !dbg !1326
  store i32 %394, ptr %15, align 4, !dbg !1327
  br label %404, !dbg !1328

395:                                              ; preds = %388
  %396 = call noundef i32 @_Z6P_Randv(), !dbg !1329
  %397 = load i32, ptr %18, align 4, !dbg !1330
  %398 = mul nsw i32 %396, %397, !dbg !1331
  %399 = sdiv i32 %398, 32768, !dbg !1332
  %400 = sext i32 %399 to i64, !dbg !1333
  %401 = getelementptr inbounds [64 x i8], ptr %17, i64 0, i64 %400, !dbg !1333
  %402 = load i8, ptr %401, align 1, !dbg !1333
  %403 = sext i8 %402 to i32, !dbg !1333
  store i32 %403, ptr %15, align 4, !dbg !1334
  br label %404

404:                                              ; preds = %395, %391
  %405 = load i32, ptr %15, align 4, !dbg !1335
  %406 = load ptr, ptr %2, align 8, !dbg !1335
  %407 = getelementptr inbounds nuw %struct.FuelCenter, ptr %406, i32 0, i32 1, !dbg !1335
  %408 = load i32, ptr %407, align 4, !dbg !1335
  %409 = load ptr, ptr %2, align 8, !dbg !1335
  %410 = getelementptr inbounds nuw %struct.FuelCenter, ptr %409, i32 0, i32 6, !dbg !1335
  %411 = load i32, ptr %410, align 4, !dbg !1335
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.17, i32 noundef %405, i32 noundef %408, i32 noundef %411), !dbg !1335
  %412 = load ptr, ptr %2, align 8, !dbg !1336
  %413 = getelementptr inbounds nuw %struct.FuelCenter, ptr %412, i32 0, i32 1, !dbg !1337
  %414 = load i32, ptr %413, align 4, !dbg !1337
  %415 = sext i32 %414 to i64, !dbg !1338
  %416 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %415, !dbg !1338
  %417 = load i32, ptr %15, align 4, !dbg !1339
  %418 = call noundef ptr @_Z18create_morph_robotP7segmentP10vms_vectori(ptr noundef %416, ptr noundef %4, i32 noundef %417), !dbg !1340
  store ptr %418, ptr %8, align 8, !dbg !1341
  %419 = load ptr, ptr %8, align 8, !dbg !1342
  %420 = icmp ne ptr %419, null, !dbg !1344
  br i1 %420, label %421, label %442, !dbg !1344

421:                                              ; preds = %404
  %422 = load ptr, ptr %2, align 8, !dbg !1345
  %423 = ptrtoint ptr %422 to i64, !dbg !1347
  %424 = sub i64 %423, ptrtoint (ptr @Station to i64), !dbg !1347
  %425 = sdiv exact i64 %424, 40, !dbg !1347
  %426 = or i64 %425, 128, !dbg !1348
  %427 = trunc i64 %426 to i8, !dbg !1345
  %428 = load ptr, ptr %8, align 8, !dbg !1349
  %429 = getelementptr inbounds nuw %struct.object, ptr %428, i32 0, i32 19, !dbg !1350
  store i8 %427, ptr %429, align 1, !dbg !1351
  %430 = load ptr, ptr @ConsoleObject, align 8, !dbg !1352
  %431 = getelementptr inbounds nuw %struct.object, ptr %430, i32 0, i32 11, !dbg !1353
  %432 = load ptr, ptr %8, align 8, !dbg !1354
  %433 = getelementptr inbounds nuw %struct.object, ptr %432, i32 0, i32 11, !dbg !1355
  %434 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %10, ptr noundef %431, ptr noundef %433), !dbg !1356
  %435 = load ptr, ptr %8, align 8, !dbg !1357
  %436 = getelementptr inbounds nuw %struct.object, ptr %435, i32 0, i32 12, !dbg !1358
  %437 = load ptr, ptr %8, align 8, !dbg !1359
  %438 = getelementptr inbounds nuw %struct.object, ptr %437, i32 0, i32 12, !dbg !1360
  %439 = getelementptr inbounds nuw %struct.vms_matrix, ptr %438, i32 0, i32 1, !dbg !1361
  %440 = call noundef ptr @_Z18vm_vector_2_matrixP10vms_matrixP10vms_vectorS2_S2_(ptr noundef %436, ptr noundef %10, ptr noundef %439, ptr noundef null), !dbg !1362
  %441 = load ptr, ptr %8, align 8, !dbg !1363
  call void @_Z11morph_startP6object(ptr noundef %441), !dbg !1364
  br label %443, !dbg !1365

442:                                              ; preds = %404
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.18), !dbg !1366
  br label %443

443:                                              ; preds = %442, %421
  br label %444, !dbg !1367

444:                                              ; preds = %443, %342
  br label %445, !dbg !1368

445:                                              ; preds = %444, %313
  br label %451, !dbg !1369

446:                                              ; preds = %114
  %447 = load ptr, ptr %2, align 8, !dbg !1370
  %448 = getelementptr inbounds nuw %struct.FuelCenter, ptr %447, i32 0, i32 2, !dbg !1371
  store i8 0, ptr %448, align 4, !dbg !1372
  %449 = load ptr, ptr %2, align 8, !dbg !1373
  %450 = getelementptr inbounds nuw %struct.FuelCenter, ptr %449, i32 0, i32 8, !dbg !1374
  store i32 0, ptr %450, align 4, !dbg !1375
  br label %451, !dbg !1376

451:                                              ; preds = %26, %55, %67, %87, %113, %206, %230, %240, %256, %446, %445, %312
  ret void, !dbg !1377
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
define void @_Z18fuelcen_update_allv() #1 !dbg !1378 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
    #dbg_declare(ptr %1, !1379, !DIExpression(), !1380)
    #dbg_declare(ptr %2, !1381, !DIExpression(), !1382)
  %3 = load i32, ptr @FrameTime, align 4, !dbg !1383
  %4 = load i32, ptr @Fuelcen_refill_speed, align 4, !dbg !1384
  %5 = call noundef i32 @_Z6fixmulii(i32 noundef %3, i32 noundef %4), !dbg !1385
  store i32 %5, ptr %2, align 4, !dbg !1386
  store i32 0, ptr %1, align 4, !dbg !1387
  br label %6, !dbg !1389

6:                                                ; preds = %97, %0
  %7 = load i32, ptr %1, align 4, !dbg !1390
  %8 = load i32, ptr @Num_fuelcenters, align 4, !dbg !1392
  %9 = icmp slt i32 %7, %8, !dbg !1393
  br i1 %9, label %10, label %100, !dbg !1394

10:                                               ; preds = %6
  %11 = load i32, ptr %1, align 4, !dbg !1395
  %12 = sext i32 %11 to i64, !dbg !1398
  %13 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %12, !dbg !1398
  %14 = getelementptr inbounds nuw %struct.FuelCenter, ptr %13, i32 0, i32 0, !dbg !1399
  %15 = load i32, ptr %14, align 4, !dbg !1399
  %16 = icmp eq i32 %15, 4, !dbg !1400
  br i1 %16, label %17, label %26, !dbg !1400

17:                                               ; preds = %10
  %18 = load i32, ptr @Game_suspended, align 4, !dbg !1401
  %19 = and i32 %18, 1, !dbg !1404
  %20 = icmp ne i32 %19, 0, !dbg !1405
  br i1 %20, label %25, label %21, !dbg !1406

21:                                               ; preds = %17
  %22 = load i32, ptr %1, align 4, !dbg !1407
  %23 = sext i32 %22 to i64, !dbg !1408
  %24 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %23, !dbg !1408
  call void @_Z15robotmaker_procP10FuelCenter(ptr noundef %24), !dbg !1409
  br label %25, !dbg !1409

25:                                               ; preds = %21, %17
  br label %96, !dbg !1410

26:                                               ; preds = %10
  %27 = load i32, ptr %1, align 4, !dbg !1411
  %28 = sext i32 %27 to i64, !dbg !1413
  %29 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %28, !dbg !1413
  %30 = getelementptr inbounds nuw %struct.FuelCenter, ptr %29, i32 0, i32 0, !dbg !1414
  %31 = load i32, ptr %30, align 4, !dbg !1414
  %32 = icmp eq i32 %31, 3, !dbg !1415
  br i1 %32, label %33, label %34, !dbg !1415

33:                                               ; preds = %26
  br label %95, !dbg !1416

34:                                               ; preds = %26
  %35 = load i32, ptr %1, align 4, !dbg !1418
  %36 = sext i32 %35 to i64, !dbg !1420
  %37 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %36, !dbg !1420
  %38 = getelementptr inbounds nuw %struct.FuelCenter, ptr %37, i32 0, i32 7, !dbg !1421
  %39 = load i32, ptr %38, align 4, !dbg !1421
  %40 = icmp sgt i32 %39, 0, !dbg !1422
  br i1 %40, label %41, label %94, !dbg !1423

41:                                               ; preds = %34
  %42 = load ptr, ptr @PlayerSegment, align 8, !dbg !1424
  %43 = load i32, ptr %1, align 4, !dbg !1425
  %44 = sext i32 %43 to i64, !dbg !1426
  %45 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %44, !dbg !1426
  %46 = getelementptr inbounds nuw %struct.FuelCenter, ptr %45, i32 0, i32 1, !dbg !1427
  %47 = load i32, ptr %46, align 4, !dbg !1427
  %48 = sext i32 %47 to i64, !dbg !1428
  %49 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %48, !dbg !1428
  %50 = icmp ne ptr %42, %49, !dbg !1429
  br i1 %50, label %51, label %94, !dbg !1423

51:                                               ; preds = %41
  %52 = load i32, ptr %1, align 4, !dbg !1430
  %53 = sext i32 %52 to i64, !dbg !1433
  %54 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %53, !dbg !1433
  %55 = getelementptr inbounds nuw %struct.FuelCenter, ptr %54, i32 0, i32 6, !dbg !1434
  %56 = load i32, ptr %55, align 4, !dbg !1434
  %57 = load i32, ptr %1, align 4, !dbg !1435
  %58 = sext i32 %57 to i64, !dbg !1436
  %59 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %58, !dbg !1436
  %60 = getelementptr inbounds nuw %struct.FuelCenter, ptr %59, i32 0, i32 7, !dbg !1437
  %61 = load i32, ptr %60, align 4, !dbg !1437
  %62 = icmp slt i32 %56, %61, !dbg !1438
  br i1 %62, label %63, label %93, !dbg !1438

63:                                               ; preds = %51
  %64 = load i32, ptr %2, align 4, !dbg !1439
  %65 = load i32, ptr %1, align 4, !dbg !1441
  %66 = sext i32 %65 to i64, !dbg !1442
  %67 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %66, !dbg !1442
  %68 = getelementptr inbounds nuw %struct.FuelCenter, ptr %67, i32 0, i32 6, !dbg !1443
  %69 = load i32, ptr %68, align 4, !dbg !1444
  %70 = add nsw i32 %69, %64, !dbg !1444
  store i32 %70, ptr %68, align 4, !dbg !1444
  %71 = load i32, ptr %1, align 4, !dbg !1445
  %72 = sext i32 %71 to i64, !dbg !1447
  %73 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %72, !dbg !1447
  %74 = getelementptr inbounds nuw %struct.FuelCenter, ptr %73, i32 0, i32 6, !dbg !1448
  %75 = load i32, ptr %74, align 4, !dbg !1448
  %76 = load i32, ptr %1, align 4, !dbg !1449
  %77 = sext i32 %76 to i64, !dbg !1450
  %78 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %77, !dbg !1450
  %79 = getelementptr inbounds nuw %struct.FuelCenter, ptr %78, i32 0, i32 7, !dbg !1451
  %80 = load i32, ptr %79, align 4, !dbg !1451
  %81 = icmp sge i32 %75, %80, !dbg !1452
  br i1 %81, label %82, label %92, !dbg !1452

82:                                               ; preds = %63
  %83 = load i32, ptr %1, align 4, !dbg !1453
  %84 = sext i32 %83 to i64, !dbg !1455
  %85 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %84, !dbg !1455
  %86 = getelementptr inbounds nuw %struct.FuelCenter, ptr %85, i32 0, i32 7, !dbg !1456
  %87 = load i32, ptr %86, align 4, !dbg !1456
  %88 = load i32, ptr %1, align 4, !dbg !1457
  %89 = sext i32 %88 to i64, !dbg !1458
  %90 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %89, !dbg !1458
  %91 = getelementptr inbounds nuw %struct.FuelCenter, ptr %90, i32 0, i32 6, !dbg !1459
  store i32 %87, ptr %91, align 4, !dbg !1460
  br label %92, !dbg !1461

92:                                               ; preds = %82, %63
  br label %93, !dbg !1462

93:                                               ; preds = %92, %51
  br label %94, !dbg !1463

94:                                               ; preds = %93, %41, %34
  br label %95

95:                                               ; preds = %94, %33
  br label %96

96:                                               ; preds = %95, %25
  br label %97, !dbg !1464

97:                                               ; preds = %96
  %98 = load i32, ptr %1, align 4, !dbg !1465
  %99 = add nsw i32 %98, 1, !dbg !1465
  store i32 %99, ptr %1, align 4, !dbg !1465
  br label %6, !dbg !1466, !llvm.loop !1467

100:                                              ; preds = %6
  ret void, !dbg !1469
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z6fixmulii(i32 noundef %0, i32 noundef %1) #0 !dbg !1470 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !1473, !DIExpression(), !1474)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !1475, !DIExpression(), !1476)
  %5 = load i32, ptr %3, align 4, !dbg !1477
  %6 = sext i32 %5 to i64, !dbg !1477
  %7 = load i32, ptr %4, align 4, !dbg !1478
  %8 = sext i32 %7 to i64, !dbg !1478
  %9 = mul nsw i64 %6, %8, !dbg !1479
  %10 = ashr i64 %9, 16, !dbg !1480
  %11 = trunc i64 %10 to i32, !dbg !1481
  ret i32 %11, !dbg !1482
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z17fuelcen_give_fuelP7segmenti(ptr noundef %0, i32 noundef %1) #1 !dbg !210 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !1483, !DIExpression(), !1484)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !1485, !DIExpression(), !1486)
    #dbg_declare(ptr %6, !1487, !DIExpression(), !1488)
  %8 = load ptr, ptr %4, align 8, !dbg !1489
  %9 = ptrtoint ptr %8 to i64, !dbg !1490
  %10 = sub i64 %9, ptrtoint (ptr @Segments to i64), !dbg !1490
  %11 = sdiv exact i64 %10, 512, !dbg !1490
  %12 = getelementptr inbounds [0 x %struct.segment2], ptr @Segment2s, i64 0, i64 %11, !dbg !1491
  store ptr %12, ptr %6, align 8, !dbg !1488
  %13 = load ptr, ptr %4, align 8, !dbg !1492
  %14 = icmp ne ptr %13, null, !dbg !1492
  %15 = zext i1 %14 to i32, !dbg !1492
  call void @_Z7_AssertiPKcS0_i(i32 noundef %15, ptr noundef @.str.19, ptr noundef @.str.2, i32 noundef 704), !dbg !1492
  %16 = load ptr, ptr %4, align 8, !dbg !1493
  store ptr %16, ptr @PlayerSegment, align 8, !dbg !1494
  %17 = load ptr, ptr %4, align 8, !dbg !1495
  %18 = icmp ne ptr %17, null, !dbg !1497
  br i1 %18, label %19, label %52, !dbg !1498

19:                                               ; preds = %2
  %20 = load ptr, ptr %6, align 8, !dbg !1499
  %21 = getelementptr inbounds nuw %struct.segment2, ptr %20, i32 0, i32 0, !dbg !1500
  %22 = load i8, ptr %21, align 4, !dbg !1500
  %23 = zext i8 %22 to i32, !dbg !1499
  %24 = icmp eq i32 %23, 1, !dbg !1501
  br i1 %24, label %25, label %52, !dbg !1498

25:                                               ; preds = %19
    #dbg_declare(ptr %7, !1502, !DIExpression(), !1504)
  call void @_Z31detect_escort_goal_accomplishedi(i32 noundef -4), !dbg !1505
  %26 = load i32, ptr %5, align 4, !dbg !1506
  %27 = icmp sle i32 %26, 0, !dbg !1508
  br i1 %27, label %28, label %29, !dbg !1508

28:                                               ; preds = %25
  store i32 0, ptr %3, align 4, !dbg !1509
  br label %53, !dbg !1509

29:                                               ; preds = %25
  %30 = load i32, ptr @FrameTime, align 4, !dbg !1511
  %31 = load i32, ptr @Fuelcen_give_amount, align 4, !dbg !1512
  %32 = call noundef i32 @_Z6fixmulii(i32 noundef %30, i32 noundef %31), !dbg !1513
  store i32 %32, ptr %7, align 4, !dbg !1514
  %33 = load i32, ptr %7, align 4, !dbg !1515
  %34 = load i32, ptr %5, align 4, !dbg !1517
  %35 = icmp sgt i32 %33, %34, !dbg !1518
  br i1 %35, label %36, label %38, !dbg !1518

36:                                               ; preds = %29
  %37 = load i32, ptr %5, align 4, !dbg !1519
  store i32 %37, ptr %7, align 4, !dbg !1520
  br label %38, !dbg !1521

38:                                               ; preds = %36, %29
  %39 = load i32, ptr @_ZZ17fuelcen_give_fuelP7segmentiE14last_play_time, align 4, !dbg !1522
  %40 = load i32, ptr @GameTime, align 4, !dbg !1524
  %41 = icmp sgt i32 %39, %40, !dbg !1525
  br i1 %41, label %42, label %43, !dbg !1525

42:                                               ; preds = %38
  store i32 0, ptr @_ZZ17fuelcen_give_fuelP7segmentiE14last_play_time, align 4, !dbg !1526
  br label %43, !dbg !1527

43:                                               ; preds = %42, %38
  %44 = load i32, ptr @GameTime, align 4, !dbg !1528
  %45 = load i32, ptr @_ZZ17fuelcen_give_fuelP7segmentiE14last_play_time, align 4, !dbg !1530
  %46 = add nsw i32 %45, 16384, !dbg !1531
  %47 = icmp sgt i32 %44, %46, !dbg !1532
  br i1 %47, label %48, label %50, !dbg !1532

48:                                               ; preds = %43
  call void @_Z16digi_play_sampleii(i32 noundef 62, i32 noundef 32768), !dbg !1533
  %49 = load i32, ptr @GameTime, align 4, !dbg !1535
  store i32 %49, ptr @_ZZ17fuelcen_give_fuelP7segmentiE14last_play_time, align 4, !dbg !1536
  br label %50, !dbg !1537

50:                                               ; preds = %48, %43
  %51 = load i32, ptr %7, align 4, !dbg !1538
  store i32 %51, ptr %3, align 4, !dbg !1539
  br label %53, !dbg !1539

52:                                               ; preds = %19, %2
  store i32 0, ptr %3, align 4, !dbg !1540
  br label %53, !dbg !1540

53:                                               ; preds = %52, %50, %28
  %54 = load i32, ptr %3, align 4, !dbg !1542
  ret i32 %54, !dbg !1542
}

declare void @_Z31detect_escort_goal_accomplishedi(i32 noundef) #2

declare void @_Z16digi_play_sampleii(i32 noundef, i32 noundef) #2

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define void @_Z15disable_matcensv() #0 !dbg !1543 {
  %1 = alloca i32, align 4
    #dbg_declare(ptr %1, !1544, !DIExpression(), !1545)
  store i32 0, ptr %1, align 4, !dbg !1546
  br label %2, !dbg !1548

2:                                                ; preds = %15, %0
  %3 = load i32, ptr %1, align 4, !dbg !1549
  %4 = load i32, ptr @Num_robot_centers, align 4, !dbg !1551
  %5 = icmp slt i32 %3, %4, !dbg !1552
  br i1 %5, label %6, label %18, !dbg !1553

6:                                                ; preds = %2
  %7 = load i32, ptr %1, align 4, !dbg !1554
  %8 = sext i32 %7 to i64, !dbg !1556
  %9 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %8, !dbg !1556
  %10 = getelementptr inbounds nuw %struct.FuelCenter, ptr %9, i32 0, i32 3, !dbg !1557
  store i8 0, ptr %10, align 1, !dbg !1558
  %11 = load i32, ptr %1, align 4, !dbg !1559
  %12 = sext i32 %11 to i64, !dbg !1560
  %13 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %12, !dbg !1560
  %14 = getelementptr inbounds nuw %struct.FuelCenter, ptr %13, i32 0, i32 9, !dbg !1561
  store i32 0, ptr %14, align 4, !dbg !1562
  br label %15, !dbg !1563

15:                                               ; preds = %6
  %16 = load i32, ptr %1, align 4, !dbg !1564
  %17 = add nsw i32 %16, 1, !dbg !1564
  store i32 %17, ptr %1, align 4, !dbg !1564
  br label %2, !dbg !1565, !llvm.loop !1566

18:                                               ; preds = %2
  ret void, !dbg !1568
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z16init_all_matcensv() #1 !dbg !1569 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
    #dbg_declare(ptr %1, !1570, !DIExpression(), !1571)
  store i32 0, ptr %1, align 4, !dbg !1572
  br label %4, !dbg !1574

4:                                                ; preds = %53, %0
  %5 = load i32, ptr %1, align 4, !dbg !1575
  %6 = load i32, ptr @Num_fuelcenters, align 4, !dbg !1577
  %7 = icmp slt i32 %5, %6, !dbg !1578
  br i1 %7, label %8, label %56, !dbg !1579

8:                                                ; preds = %4
  %9 = load i32, ptr %1, align 4, !dbg !1580
  %10 = sext i32 %9 to i64, !dbg !1582
  %11 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %10, !dbg !1582
  %12 = getelementptr inbounds nuw %struct.FuelCenter, ptr %11, i32 0, i32 0, !dbg !1583
  %13 = load i32, ptr %12, align 4, !dbg !1583
  %14 = icmp eq i32 %13, 4, !dbg !1584
  br i1 %14, label %15, label %52, !dbg !1584

15:                                               ; preds = %8
  %16 = load i32, ptr %1, align 4, !dbg !1585
  %17 = sext i32 %16 to i64, !dbg !1587
  %18 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %17, !dbg !1587
  %19 = getelementptr inbounds nuw %struct.FuelCenter, ptr %18, i32 0, i32 4, !dbg !1588
  store i8 3, ptr %19, align 2, !dbg !1589
  %20 = load i32, ptr %1, align 4, !dbg !1590
  %21 = sext i32 %20 to i64, !dbg !1591
  %22 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %21, !dbg !1591
  %23 = getelementptr inbounds nuw %struct.FuelCenter, ptr %22, i32 0, i32 3, !dbg !1592
  store i8 0, ptr %23, align 1, !dbg !1593
  %24 = load i32, ptr %1, align 4, !dbg !1594
  %25 = sext i32 %24 to i64, !dbg !1595
  %26 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %25, !dbg !1595
  %27 = getelementptr inbounds nuw %struct.FuelCenter, ptr %26, i32 0, i32 9, !dbg !1596
  store i32 0, ptr %27, align 4, !dbg !1597
    #dbg_declare(ptr %2, !1598, !DIExpression(), !1600)
  store i32 0, ptr %2, align 4, !dbg !1601
  br label %28, !dbg !1603

28:                                               ; preds = %43, %15
  %29 = load i32, ptr %2, align 4, !dbg !1604
  %30 = load i32, ptr @Num_robot_centers, align 4, !dbg !1606
  %31 = icmp slt i32 %29, %30, !dbg !1607
  br i1 %31, label %32, label %46, !dbg !1608

32:                                               ; preds = %28
  %33 = load i32, ptr %2, align 4, !dbg !1609
  %34 = sext i32 %33 to i64, !dbg !1612
  %35 = getelementptr inbounds [20 x %struct.matcen_info], ptr @RobotCenters, i64 0, i64 %34, !dbg !1612
  %36 = getelementptr inbounds nuw %struct.matcen_info, ptr %35, i32 0, i32 4, !dbg !1613
  %37 = load i16, ptr %36, align 2, !dbg !1613
  %38 = sext i16 %37 to i32, !dbg !1612
  %39 = load i32, ptr %1, align 4, !dbg !1614
  %40 = icmp eq i32 %38, %39, !dbg !1615
  br i1 %40, label %41, label %42, !dbg !1615

41:                                               ; preds = %32
  br label %47, !dbg !1616

42:                                               ; preds = %32
  br label %43, !dbg !1617

43:                                               ; preds = %42
  %44 = load i32, ptr %2, align 4, !dbg !1618
  %45 = add nsw i32 %44, 1, !dbg !1618
  store i32 %45, ptr %2, align 4, !dbg !1618
  br label %28, !dbg !1619, !llvm.loop !1620

46:                                               ; preds = %28
  br label %47, !dbg !1622

47:                                               ; preds = %46, %41
  %48 = load i32, ptr %2, align 4, !dbg !1622
  %49 = load i32, ptr @Num_robot_centers, align 4, !dbg !1622
  %50 = icmp ne i32 %48, %49, !dbg !1622
  %51 = zext i1 %50 to i32, !dbg !1622
  call void @_Z7_AssertiPKcS0_i(i32 noundef %51, ptr noundef @.str.20, ptr noundef @.str.2, i32 noundef 1123), !dbg !1622
  br label %52, !dbg !1623

52:                                               ; preds = %47, %8
  br label %53, !dbg !1624

53:                                               ; preds = %52
  %54 = load i32, ptr %1, align 4, !dbg !1625
  %55 = add nsw i32 %54, 1, !dbg !1625
  store i32 %55, ptr %1, align 4, !dbg !1625
  br label %4, !dbg !1626, !llvm.loop !1627

56:                                               ; preds = %4
  store i32 0, ptr %1, align 4, !dbg !1629
  br label %57, !dbg !1631

57:                                               ; preds = %79, %56
  %58 = load i32, ptr %1, align 4, !dbg !1632
  %59 = load i32, ptr @Num_robot_centers, align 4, !dbg !1634
  %60 = icmp slt i32 %58, %59, !dbg !1635
  br i1 %60, label %61, label %82, !dbg !1636

61:                                               ; preds = %57
    #dbg_declare(ptr %3, !1637, !DIExpression(), !1639)
  %62 = load i32, ptr %1, align 4, !dbg !1640
  %63 = sext i32 %62 to i64, !dbg !1641
  %64 = getelementptr inbounds [20 x %struct.matcen_info], ptr @RobotCenters, i64 0, i64 %63, !dbg !1641
  %65 = getelementptr inbounds nuw %struct.matcen_info, ptr %64, i32 0, i32 4, !dbg !1642
  %66 = load i16, ptr %65, align 2, !dbg !1642
  %67 = sext i16 %66 to i32, !dbg !1641
  store i32 %67, ptr %3, align 4, !dbg !1639
  %68 = load i32, ptr %3, align 4, !dbg !1643
  %69 = load i32, ptr @Num_fuelcenters, align 4, !dbg !1643
  %70 = icmp slt i32 %68, %69, !dbg !1643
  %71 = zext i1 %70 to i32, !dbg !1643
  call void @_Z7_AssertiPKcS0_i(i32 noundef %71, ptr noundef @.str.21, ptr noundef @.str.2, i32 noundef 1134), !dbg !1643
  %72 = load i32, ptr %3, align 4, !dbg !1644
  %73 = sext i32 %72 to i64, !dbg !1644
  %74 = getelementptr inbounds [70 x %struct.FuelCenter], ptr @Station, i64 0, i64 %73, !dbg !1644
  %75 = getelementptr inbounds nuw %struct.FuelCenter, ptr %74, i32 0, i32 0, !dbg !1644
  %76 = load i32, ptr %75, align 4, !dbg !1644
  %77 = icmp eq i32 %76, 4, !dbg !1644
  %78 = zext i1 %77 to i32, !dbg !1644
  call void @_Z7_AssertiPKcS0_i(i32 noundef %78, ptr noundef @.str.22, ptr noundef @.str.2, i32 noundef 1135), !dbg !1644
  br label %79, !dbg !1645

79:                                               ; preds = %61
  %80 = load i32, ptr %1, align 4, !dbg !1646
  %81 = add nsw i32 %80, 1, !dbg !1646
  store i32 %81, ptr %1, align 4, !dbg !1646
  br label %57, !dbg !1647, !llvm.loop !1648

82:                                               ; preds = %57
  ret void, !dbg !1650
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z22fuelcen_check_for_goalP7segment(ptr noundef %0) #1 !dbg !1651 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !1652, !DIExpression(), !1653)
    #dbg_declare(ptr %3, !1654, !DIExpression(), !1655)
  %4 = load ptr, ptr %2, align 8, !dbg !1656
  %5 = ptrtoint ptr %4 to i64, !dbg !1657
  %6 = sub i64 %5, ptrtoint (ptr @Segments to i64), !dbg !1657
  %7 = sdiv exact i64 %6, 512, !dbg !1657
  %8 = getelementptr inbounds [0 x %struct.segment2], ptr @Segment2s, i64 0, i64 %7, !dbg !1658
  store ptr %8, ptr %3, align 8, !dbg !1655
  %9 = load ptr, ptr %2, align 8, !dbg !1659
  %10 = icmp ne ptr %9, null, !dbg !1659
  %11 = zext i1 %10 to i32, !dbg !1659
  call void @_Z7_AssertiPKcS0_i(i32 noundef %11, ptr noundef @.str.19, ptr noundef @.str.2, i32 noundef 1146), !dbg !1659
  %12 = load i32, ptr @Game_mode, align 4, !dbg !1660
  %13 = and i32 %12, 512, !dbg !1660
  call void @_Z7_AssertiPKcS0_i(i32 noundef %13, ptr noundef @.str.23, ptr noundef @.str.2, i32 noundef 1147), !dbg !1660
  %14 = load ptr, ptr %3, align 8, !dbg !1661
  %15 = getelementptr inbounds nuw %struct.segment2, ptr %14, i32 0, i32 0, !dbg !1663
  %16 = load i8, ptr %15, align 4, !dbg !1663
  %17 = zext i8 %16 to i32, !dbg !1661
  %18 = icmp eq i32 %17, 5, !dbg !1664
  br i1 %18, label %19, label %20, !dbg !1664

19:                                               ; preds = %1
  br label %20, !dbg !1665

20:                                               ; preds = %19, %1
  %21 = load ptr, ptr %3, align 8, !dbg !1667
  %22 = getelementptr inbounds nuw %struct.segment2, ptr %21, i32 0, i32 0, !dbg !1669
  %23 = load i8, ptr %22, align 4, !dbg !1669
  %24 = zext i8 %23 to i32, !dbg !1667
  %25 = icmp eq i32 %24, 6, !dbg !1670
  br i1 %25, label %26, label %27, !dbg !1670

26:                                               ; preds = %20
  br label %27, !dbg !1671

27:                                               ; preds = %26, %20
  ret void, !dbg !1673
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z28fuelcen_check_for_hoard_goalP7segment(ptr noundef %0) #1 !dbg !1674 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !1675, !DIExpression(), !1676)
    #dbg_declare(ptr %3, !1677, !DIExpression(), !1678)
  %4 = load ptr, ptr %2, align 8, !dbg !1679
  %5 = ptrtoint ptr %4 to i64, !dbg !1680
  %6 = sub i64 %5, ptrtoint (ptr @Segments to i64), !dbg !1680
  %7 = sdiv exact i64 %6, 512, !dbg !1680
  %8 = getelementptr inbounds [0 x %struct.segment2], ptr @Segment2s, i64 0, i64 %7, !dbg !1681
  store ptr %8, ptr %3, align 8, !dbg !1678
  %9 = load ptr, ptr %2, align 8, !dbg !1682
  %10 = icmp ne ptr %9, null, !dbg !1682
  %11 = zext i1 %10 to i32, !dbg !1682
  call void @_Z7_AssertiPKcS0_i(i32 noundef %11, ptr noundef @.str.19, ptr noundef @.str.2, i32 noundef 1180), !dbg !1682
  %12 = load i32, ptr @Game_mode, align 4, !dbg !1683
  %13 = and i32 %12, 1024, !dbg !1683
  call void @_Z7_AssertiPKcS0_i(i32 noundef %13, ptr noundef @.str.24, ptr noundef @.str.2, i32 noundef 1181), !dbg !1683
  %14 = load i32, ptr @Player_is_dead, align 4, !dbg !1684
  %15 = icmp ne i32 %14, 0, !dbg !1684
  br i1 %15, label %16, label %17, !dbg !1684

16:                                               ; preds = %1
  br label %30, !dbg !1686

17:                                               ; preds = %1
  %18 = load ptr, ptr %3, align 8, !dbg !1687
  %19 = getelementptr inbounds nuw %struct.segment2, ptr %18, i32 0, i32 0, !dbg !1689
  %20 = load i8, ptr %19, align 4, !dbg !1689
  %21 = zext i8 %20 to i32, !dbg !1687
  %22 = icmp eq i32 %21, 5, !dbg !1690
  br i1 %22, label %29, label %23, !dbg !1691

23:                                               ; preds = %17
  %24 = load ptr, ptr %3, align 8, !dbg !1692
  %25 = getelementptr inbounds nuw %struct.segment2, ptr %24, i32 0, i32 0, !dbg !1693
  %26 = load i8, ptr %25, align 4, !dbg !1693
  %27 = zext i8 %26 to i32, !dbg !1692
  %28 = icmp eq i32 %27, 6, !dbg !1694
  br i1 %28, label %29, label %30, !dbg !1691

29:                                               ; preds = %23, %17
  br label %30, !dbg !1695

30:                                               ; preds = %16, %29, %23
  ret void, !dbg !1697
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z11read_matcenP11matcen_infoP7__sFILE(ptr noundef %0, ptr noundef %1) #1 !dbg !1698 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !1759, !DIExpression(), !1760)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !1761, !DIExpression(), !1762)
  %5 = load ptr, ptr %4, align 8, !dbg !1763
  %6 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %5), !dbg !1764
  %7 = load ptr, ptr %3, align 8, !dbg !1765
  %8 = getelementptr inbounds nuw %struct.matcen_info, ptr %7, i32 0, i32 0, !dbg !1766
  %9 = getelementptr inbounds [2 x i32], ptr %8, i64 0, i64 0, !dbg !1765
  store i32 %6, ptr %9, align 4, !dbg !1767
  %10 = load ptr, ptr %4, align 8, !dbg !1768
  %11 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %10), !dbg !1769
  %12 = load ptr, ptr %3, align 8, !dbg !1770
  %13 = getelementptr inbounds nuw %struct.matcen_info, ptr %12, i32 0, i32 0, !dbg !1771
  %14 = getelementptr inbounds [2 x i32], ptr %13, i64 0, i64 1, !dbg !1770
  store i32 %11, ptr %14, align 4, !dbg !1772
  %15 = load ptr, ptr %4, align 8, !dbg !1773
  %16 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %15), !dbg !1774
  %17 = load ptr, ptr %3, align 8, !dbg !1775
  %18 = getelementptr inbounds nuw %struct.matcen_info, ptr %17, i32 0, i32 1, !dbg !1776
  store i32 %16, ptr %18, align 4, !dbg !1777
  %19 = load ptr, ptr %4, align 8, !dbg !1778
  %20 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %19), !dbg !1779
  %21 = load ptr, ptr %3, align 8, !dbg !1780
  %22 = getelementptr inbounds nuw %struct.matcen_info, ptr %21, i32 0, i32 2, !dbg !1781
  store i32 %20, ptr %22, align 4, !dbg !1782
  %23 = load ptr, ptr %4, align 8, !dbg !1783
  %24 = call noundef signext i16 @_Z15file_read_shortP7__sFILE(ptr noundef %23), !dbg !1784
  %25 = load ptr, ptr %3, align 8, !dbg !1785
  %26 = getelementptr inbounds nuw %struct.matcen_info, ptr %25, i32 0, i32 3, !dbg !1786
  store i16 %24, ptr %26, align 4, !dbg !1787
  %27 = load ptr, ptr %4, align 8, !dbg !1788
  %28 = call noundef signext i16 @_Z15file_read_shortP7__sFILE(ptr noundef %27), !dbg !1789
  %29 = load ptr, ptr %3, align 8, !dbg !1790
  %30 = getelementptr inbounds nuw %struct.matcen_info, ptr %29, i32 0, i32 4, !dbg !1791
  store i16 %28, ptr %30, align 2, !dbg !1792
  ret void, !dbg !1793
}

declare noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef) #2

declare noundef signext i16 @_Z15file_read_shortP7__sFILE(ptr noundef) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z12write_matcenP11matcen_infoP7__sFILE(ptr noundef %0, ptr noundef %1) #1 !dbg !1794 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !1795, !DIExpression(), !1796)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !1797, !DIExpression(), !1798)
  %5 = load ptr, ptr %4, align 8, !dbg !1799
  %6 = load ptr, ptr %3, align 8, !dbg !1800
  %7 = getelementptr inbounds nuw %struct.matcen_info, ptr %6, i32 0, i32 0, !dbg !1801
  %8 = getelementptr inbounds [2 x i32], ptr %7, i64 0, i64 0, !dbg !1800
  %9 = load i32, ptr %8, align 4, !dbg !1800
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %5, i32 noundef %9), !dbg !1802
  %10 = load ptr, ptr %4, align 8, !dbg !1803
  %11 = load ptr, ptr %3, align 8, !dbg !1804
  %12 = getelementptr inbounds nuw %struct.matcen_info, ptr %11, i32 0, i32 0, !dbg !1805
  %13 = getelementptr inbounds [2 x i32], ptr %12, i64 0, i64 1, !dbg !1804
  %14 = load i32, ptr %13, align 4, !dbg !1804
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %10, i32 noundef %14), !dbg !1806
  %15 = load ptr, ptr %4, align 8, !dbg !1807
  %16 = load ptr, ptr %3, align 8, !dbg !1808
  %17 = getelementptr inbounds nuw %struct.matcen_info, ptr %16, i32 0, i32 1, !dbg !1809
  %18 = load i32, ptr %17, align 4, !dbg !1809
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %15, i32 noundef %18), !dbg !1810
  %19 = load ptr, ptr %4, align 8, !dbg !1811
  %20 = load ptr, ptr %3, align 8, !dbg !1812
  %21 = getelementptr inbounds nuw %struct.matcen_info, ptr %20, i32 0, i32 2, !dbg !1813
  %22 = load i32, ptr %21, align 4, !dbg !1813
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %19, i32 noundef %22), !dbg !1814
  %23 = load ptr, ptr %4, align 8, !dbg !1815
  %24 = load ptr, ptr %3, align 8, !dbg !1816
  %25 = getelementptr inbounds nuw %struct.matcen_info, ptr %24, i32 0, i32 3, !dbg !1817
  %26 = load i16, ptr %25, align 4, !dbg !1817
  call void @_Z16file_write_shortP7__sFILEs(ptr noundef %23, i16 noundef signext %26), !dbg !1818
  %27 = load ptr, ptr %4, align 8, !dbg !1819
  %28 = load ptr, ptr %3, align 8, !dbg !1820
  %29 = getelementptr inbounds nuw %struct.matcen_info, ptr %28, i32 0, i32 4, !dbg !1821
  %30 = load i16, ptr %29, align 2, !dbg !1821
  call void @_Z16file_write_shortP7__sFILEs(ptr noundef %27, i16 noundef signext %30), !dbg !1822
  ret void, !dbg !1823
}

declare void @_Z14file_write_intP7__sFILEi(ptr noundef, i32 noundef) #2

declare void @_Z16file_write_shortP7__sFILEs(ptr noundef, i16 noundef signext) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z12read_fuelcenP10FuelCenterP7__sFILE(ptr noundef %0, ptr noundef %1) #1 !dbg !1824 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !1827, !DIExpression(), !1828)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !1829, !DIExpression(), !1830)
  %5 = load ptr, ptr %4, align 8, !dbg !1831
  %6 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %5), !dbg !1832
  %7 = load ptr, ptr %3, align 8, !dbg !1833
  %8 = getelementptr inbounds nuw %struct.FuelCenter, ptr %7, i32 0, i32 0, !dbg !1834
  store i32 %6, ptr %8, align 4, !dbg !1835
  %9 = load ptr, ptr %4, align 8, !dbg !1836
  %10 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %9), !dbg !1837
  %11 = load ptr, ptr %3, align 8, !dbg !1838
  %12 = getelementptr inbounds nuw %struct.FuelCenter, ptr %11, i32 0, i32 1, !dbg !1839
  store i32 %10, ptr %12, align 4, !dbg !1840
  %13 = load ptr, ptr %4, align 8, !dbg !1841
  %14 = call noundef zeroext i8 @_Z14file_read_byteP7__sFILE(ptr noundef %13), !dbg !1842
  %15 = load ptr, ptr %3, align 8, !dbg !1843
  %16 = getelementptr inbounds nuw %struct.FuelCenter, ptr %15, i32 0, i32 2, !dbg !1844
  store i8 %14, ptr %16, align 4, !dbg !1845
  %17 = load ptr, ptr %4, align 8, !dbg !1846
  %18 = call noundef zeroext i8 @_Z14file_read_byteP7__sFILE(ptr noundef %17), !dbg !1847
  %19 = load ptr, ptr %3, align 8, !dbg !1848
  %20 = getelementptr inbounds nuw %struct.FuelCenter, ptr %19, i32 0, i32 3, !dbg !1849
  store i8 %18, ptr %20, align 1, !dbg !1850
  %21 = load ptr, ptr %4, align 8, !dbg !1851
  %22 = call noundef zeroext i8 @_Z14file_read_byteP7__sFILE(ptr noundef %21), !dbg !1852
  %23 = load ptr, ptr %3, align 8, !dbg !1853
  %24 = getelementptr inbounds nuw %struct.FuelCenter, ptr %23, i32 0, i32 4, !dbg !1854
  store i8 %22, ptr %24, align 2, !dbg !1855
  %25 = load ptr, ptr %4, align 8, !dbg !1856
  %26 = call noundef zeroext i8 @_Z14file_read_byteP7__sFILE(ptr noundef %25), !dbg !1857
  %27 = load ptr, ptr %3, align 8, !dbg !1858
  %28 = getelementptr inbounds nuw %struct.FuelCenter, ptr %27, i32 0, i32 5, !dbg !1859
  store i8 %26, ptr %28, align 1, !dbg !1860
  %29 = load ptr, ptr %4, align 8, !dbg !1861
  %30 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %29), !dbg !1862
  %31 = load ptr, ptr %3, align 8, !dbg !1863
  %32 = getelementptr inbounds nuw %struct.FuelCenter, ptr %31, i32 0, i32 6, !dbg !1864
  store i32 %30, ptr %32, align 4, !dbg !1865
  %33 = load ptr, ptr %4, align 8, !dbg !1866
  %34 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %33), !dbg !1867
  %35 = load ptr, ptr %3, align 8, !dbg !1868
  %36 = getelementptr inbounds nuw %struct.FuelCenter, ptr %35, i32 0, i32 7, !dbg !1869
  store i32 %34, ptr %36, align 4, !dbg !1870
  %37 = load ptr, ptr %4, align 8, !dbg !1871
  %38 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %37), !dbg !1872
  %39 = load ptr, ptr %3, align 8, !dbg !1873
  %40 = getelementptr inbounds nuw %struct.FuelCenter, ptr %39, i32 0, i32 8, !dbg !1874
  store i32 %38, ptr %40, align 4, !dbg !1875
  %41 = load ptr, ptr %4, align 8, !dbg !1876
  %42 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %41), !dbg !1877
  %43 = load ptr, ptr %3, align 8, !dbg !1878
  %44 = getelementptr inbounds nuw %struct.FuelCenter, ptr %43, i32 0, i32 9, !dbg !1879
  store i32 %42, ptr %44, align 4, !dbg !1880
  %45 = load ptr, ptr %4, align 8, !dbg !1881
  %46 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %45), !dbg !1882
  %47 = load ptr, ptr %3, align 8, !dbg !1883
  %48 = getelementptr inbounds nuw %struct.FuelCenter, ptr %47, i32 0, i32 10, !dbg !1884
  %49 = getelementptr inbounds nuw %struct.vms_vector, ptr %48, i32 0, i32 0, !dbg !1885
  store i32 %46, ptr %49, align 4, !dbg !1886
  %50 = load ptr, ptr %4, align 8, !dbg !1887
  %51 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %50), !dbg !1888
  %52 = load ptr, ptr %3, align 8, !dbg !1889
  %53 = getelementptr inbounds nuw %struct.FuelCenter, ptr %52, i32 0, i32 10, !dbg !1890
  %54 = getelementptr inbounds nuw %struct.vms_vector, ptr %53, i32 0, i32 1, !dbg !1891
  store i32 %51, ptr %54, align 4, !dbg !1892
  %55 = load ptr, ptr %4, align 8, !dbg !1893
  %56 = call noundef i32 @_Z13file_read_intP7__sFILE(ptr noundef %55), !dbg !1894
  %57 = load ptr, ptr %3, align 8, !dbg !1895
  %58 = getelementptr inbounds nuw %struct.FuelCenter, ptr %57, i32 0, i32 10, !dbg !1896
  %59 = getelementptr inbounds nuw %struct.vms_vector, ptr %58, i32 0, i32 2, !dbg !1897
  store i32 %56, ptr %59, align 4, !dbg !1898
  ret void, !dbg !1899
}

declare noundef zeroext i8 @_Z14file_read_byteP7__sFILE(ptr noundef) #2

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z13write_fuelcenP10FuelCenterP7__sFILE(ptr noundef %0, ptr noundef %1) #1 !dbg !1900 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !1901, !DIExpression(), !1902)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !1903, !DIExpression(), !1904)
  %5 = load ptr, ptr %4, align 8, !dbg !1905
  %6 = load ptr, ptr %3, align 8, !dbg !1906
  %7 = getelementptr inbounds nuw %struct.FuelCenter, ptr %6, i32 0, i32 0, !dbg !1907
  %8 = load i32, ptr %7, align 4, !dbg !1907
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %5, i32 noundef %8), !dbg !1908
  %9 = load ptr, ptr %4, align 8, !dbg !1909
  %10 = load ptr, ptr %3, align 8, !dbg !1910
  %11 = getelementptr inbounds nuw %struct.FuelCenter, ptr %10, i32 0, i32 1, !dbg !1911
  %12 = load i32, ptr %11, align 4, !dbg !1911
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %9, i32 noundef %12), !dbg !1912
  %13 = load ptr, ptr %4, align 8, !dbg !1913
  %14 = load ptr, ptr %3, align 8, !dbg !1914
  %15 = getelementptr inbounds nuw %struct.FuelCenter, ptr %14, i32 0, i32 2, !dbg !1915
  %16 = load i8, ptr %15, align 4, !dbg !1915
  call void @_Z15file_write_byteP7__sFILEh(ptr noundef %13, i8 noundef zeroext %16), !dbg !1916
  %17 = load ptr, ptr %4, align 8, !dbg !1917
  %18 = load ptr, ptr %3, align 8, !dbg !1918
  %19 = getelementptr inbounds nuw %struct.FuelCenter, ptr %18, i32 0, i32 3, !dbg !1919
  %20 = load i8, ptr %19, align 1, !dbg !1919
  call void @_Z15file_write_byteP7__sFILEh(ptr noundef %17, i8 noundef zeroext %20), !dbg !1920
  %21 = load ptr, ptr %4, align 8, !dbg !1921
  %22 = load ptr, ptr %3, align 8, !dbg !1922
  %23 = getelementptr inbounds nuw %struct.FuelCenter, ptr %22, i32 0, i32 4, !dbg !1923
  %24 = load i8, ptr %23, align 2, !dbg !1923
  call void @_Z15file_write_byteP7__sFILEh(ptr noundef %21, i8 noundef zeroext %24), !dbg !1924
  %25 = load ptr, ptr %4, align 8, !dbg !1925
  %26 = load ptr, ptr %3, align 8, !dbg !1926
  %27 = getelementptr inbounds nuw %struct.FuelCenter, ptr %26, i32 0, i32 5, !dbg !1927
  %28 = load i8, ptr %27, align 1, !dbg !1927
  call void @_Z15file_write_byteP7__sFILEh(ptr noundef %25, i8 noundef zeroext %28), !dbg !1928
  %29 = load ptr, ptr %4, align 8, !dbg !1929
  %30 = load ptr, ptr %3, align 8, !dbg !1930
  %31 = getelementptr inbounds nuw %struct.FuelCenter, ptr %30, i32 0, i32 6, !dbg !1931
  %32 = load i32, ptr %31, align 4, !dbg !1931
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %29, i32 noundef %32), !dbg !1932
  %33 = load ptr, ptr %4, align 8, !dbg !1933
  %34 = load ptr, ptr %3, align 8, !dbg !1934
  %35 = getelementptr inbounds nuw %struct.FuelCenter, ptr %34, i32 0, i32 7, !dbg !1935
  %36 = load i32, ptr %35, align 4, !dbg !1935
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %33, i32 noundef %36), !dbg !1936
  %37 = load ptr, ptr %4, align 8, !dbg !1937
  %38 = load ptr, ptr %3, align 8, !dbg !1938
  %39 = getelementptr inbounds nuw %struct.FuelCenter, ptr %38, i32 0, i32 8, !dbg !1939
  %40 = load i32, ptr %39, align 4, !dbg !1939
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %37, i32 noundef %40), !dbg !1940
  %41 = load ptr, ptr %4, align 8, !dbg !1941
  %42 = load ptr, ptr %3, align 8, !dbg !1942
  %43 = getelementptr inbounds nuw %struct.FuelCenter, ptr %42, i32 0, i32 9, !dbg !1943
  %44 = load i32, ptr %43, align 4, !dbg !1943
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %41, i32 noundef %44), !dbg !1944
  %45 = load ptr, ptr %4, align 8, !dbg !1945
  %46 = load ptr, ptr %3, align 8, !dbg !1946
  %47 = getelementptr inbounds nuw %struct.FuelCenter, ptr %46, i32 0, i32 10, !dbg !1947
  %48 = getelementptr inbounds nuw %struct.vms_vector, ptr %47, i32 0, i32 0, !dbg !1948
  %49 = load i32, ptr %48, align 4, !dbg !1948
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %45, i32 noundef %49), !dbg !1949
  %50 = load ptr, ptr %4, align 8, !dbg !1950
  %51 = load ptr, ptr %3, align 8, !dbg !1951
  %52 = getelementptr inbounds nuw %struct.FuelCenter, ptr %51, i32 0, i32 10, !dbg !1952
  %53 = getelementptr inbounds nuw %struct.vms_vector, ptr %52, i32 0, i32 1, !dbg !1953
  %54 = load i32, ptr %53, align 4, !dbg !1953
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %50, i32 noundef %54), !dbg !1954
  %55 = load ptr, ptr %4, align 8, !dbg !1955
  %56 = load ptr, ptr %3, align 8, !dbg !1956
  %57 = getelementptr inbounds nuw %struct.FuelCenter, ptr %56, i32 0, i32 10, !dbg !1957
  %58 = getelementptr inbounds nuw %struct.vms_vector, ptr %57, i32 0, i32 2, !dbg !1958
  %59 = load i32, ptr %58, align 4, !dbg !1958
  call void @_Z14file_write_intP7__sFILEi(ptr noundef %55, i32 noundef %59), !dbg !1959
  ret void, !dbg !1960
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
!3 = !DIFile(filename: "/Users/richard/code/ChocolateDescent/main_d2/fuelcen.cpp", directory: "/Users/richard/code/ChocolateDescent/build-c-ref", checksumkind: CSK_MD5, checksum: "4c0f18e2fb995ff70e76eccffc6280cd")
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
!15 = !DIFile(filename: "main_d2/fuelcen.cpp", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "4c0f18e2fb995ff70e76eccffc6280cd")
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
!141 = distinct !DIGlobalVariable(scope: null, file: !15, line: 223, type: !115, isLocal: true, isDefinition: true)
!142 = !DIGlobalVariableExpression(var: !143, expr: !DIExpression())
!143 = distinct !DIGlobalVariable(scope: null, file: !15, line: 284, type: !144, isLocal: true, isDefinition: true)
!144 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 224, elements: !145)
!145 = !{!146}
!146 = !DISubrange(count: 28)
!147 = !DIGlobalVariableExpression(var: !148, expr: !DIExpression())
!148 = distinct !DIGlobalVariable(scope: null, file: !15, line: 286, type: !149, isLocal: true, isDefinition: true)
!149 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 320, elements: !150)
!150 = !{!151}
!151 = !DISubrange(count: 40)
!152 = !DIGlobalVariableExpression(var: !153, expr: !DIExpression())
!153 = distinct !DIGlobalVariable(scope: null, file: !15, line: 287, type: !154, isLocal: true, isDefinition: true)
!154 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 288, elements: !155)
!155 = !{!156}
!156 = !DISubrange(count: 36)
!157 = !DIGlobalVariableExpression(var: !158, expr: !DIExpression())
!158 = distinct !DIGlobalVariable(scope: null, file: !15, line: 288, type: !159, isLocal: true, isDefinition: true)
!159 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 584, elements: !160)
!160 = !{!161}
!161 = !DISubrange(count: 73)
!162 = !DIGlobalVariableExpression(var: !163, expr: !DIExpression())
!163 = distinct !DIGlobalVariable(scope: null, file: !15, line: 317, type: !164, isLocal: true, isDefinition: true)
!164 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 336, elements: !165)
!165 = !{!166}
!166 = !DISubrange(count: 42)
!167 = !DIGlobalVariableExpression(var: !168, expr: !DIExpression())
!168 = distinct !DIGlobalVariable(scope: null, file: !15, line: 388, type: !169, isLocal: true, isDefinition: true)
!169 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 352, elements: !170)
!170 = !{!171}
!171 = !DISubrange(count: 44)
!172 = !DIGlobalVariableExpression(var: !173, expr: !DIExpression())
!173 = distinct !DIGlobalVariable(name: "Num_extry_robots", scope: !2, file: !15, line: 420, type: !5, isLocal: false, isDefinition: true)
!174 = !DIGlobalVariableExpression(var: !175, expr: !DIExpression())
!175 = distinct !DIGlobalVariable(name: "FrameCount_last_msg", scope: !2, file: !15, line: 423, type: !5, isLocal: false, isDefinition: true)
!176 = !DIGlobalVariableExpression(var: !177, expr: !DIExpression())
!177 = distinct !DIGlobalVariable(scope: null, file: !15, line: 444, type: !127, isLocal: true, isDefinition: true)
!178 = !DIGlobalVariableExpression(var: !179, expr: !DIExpression())
!179 = distinct !DIGlobalVariable(scope: null, file: !15, line: 473, type: !180, isLocal: true, isDefinition: true)
!180 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 248, elements: !181)
!181 = !{!182}
!182 = !DISubrange(count: 31)
!183 = !DIGlobalVariableExpression(var: !184, expr: !DIExpression())
!184 = distinct !DIGlobalVariable(scope: null, file: !15, line: 488, type: !185, isLocal: true, isDefinition: true)
!185 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 272, elements: !186)
!186 = !{!187}
!187 = !DISubrange(count: 34)
!188 = !DIGlobalVariableExpression(var: !189, expr: !DIExpression())
!189 = distinct !DIGlobalVariable(scope: null, file: !15, line: 531, type: !190, isLocal: true, isDefinition: true)
!190 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 448, elements: !191)
!191 = !{!192}
!192 = !DISubrange(count: 56)
!193 = !DIGlobalVariableExpression(var: !194, expr: !DIExpression())
!194 = distinct !DIGlobalVariable(scope: null, file: !15, line: 544, type: !195, isLocal: true, isDefinition: true)
!195 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 312, elements: !196)
!196 = !{!197}
!197 = !DISubrange(count: 39)
!198 = !DIGlobalVariableExpression(var: !199, expr: !DIExpression())
!199 = distinct !DIGlobalVariable(scope: null, file: !15, line: 616, type: !200, isLocal: true, isDefinition: true)
!200 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 392, elements: !201)
!201 = !{!202}
!202 = !DISubrange(count: 49)
!203 = !DIGlobalVariableExpression(var: !204, expr: !DIExpression())
!204 = distinct !DIGlobalVariable(scope: null, file: !15, line: 636, type: !205, isLocal: true, isDefinition: true)
!205 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 496, elements: !206)
!206 = !{!207}
!207 = !DISubrange(count: 62)
!208 = !DIGlobalVariableExpression(var: !209, expr: !DIExpression())
!209 = distinct !DIGlobalVariable(name: "last_play_time", scope: !210, file: !15, line: 702, type: !16, isLocal: true, isDefinition: true)
!210 = distinct !DISubprogram(name: "fuelcen_give_fuel", linkageName: "_Z17fuelcen_give_fuelP7segmenti", scope: !15, file: !15, line: 698, type: !211, scopeLine: 699, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !213)
!211 = !DISubroutineType(types: !212)
!212 = !{!16, !74, !16}
!213 = !{}
!214 = !DIGlobalVariableExpression(var: !215, expr: !DIExpression())
!215 = distinct !DIGlobalVariable(scope: null, file: !15, line: 704, type: !216, isLocal: true, isDefinition: true)
!216 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 104, elements: !217)
!217 = !{!218}
!218 = !DISubrange(count: 13)
!219 = !DIGlobalVariableExpression(var: !220, expr: !DIExpression())
!220 = distinct !DIGlobalVariable(scope: null, file: !15, line: 1123, type: !221, isLocal: true, isDefinition: true)
!221 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 184, elements: !222)
!222 = !{!223}
!223 = !DISubrange(count: 23)
!224 = !DIGlobalVariableExpression(var: !225, expr: !DIExpression())
!225 = distinct !DIGlobalVariable(scope: null, file: !15, line: 1134, type: !226, isLocal: true, isDefinition: true)
!226 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 240, elements: !227)
!227 = !{!228}
!228 = !DISubrange(count: 30)
!229 = !DIGlobalVariableExpression(var: !230, expr: !DIExpression())
!230 = distinct !DIGlobalVariable(scope: null, file: !15, line: 1135, type: !231, isLocal: true, isDefinition: true)
!231 = !DICompositeType(tag: DW_TAG_array_type, baseType: !116, size: 408, elements: !232)
!232 = !{!233}
!233 = !DISubrange(count: 51)
!234 = !DIGlobalVariableExpression(var: !235, expr: !DIExpression())
!235 = distinct !DIGlobalVariable(scope: null, file: !15, line: 1147, type: !221, isLocal: true, isDefinition: true)
!236 = !DIGlobalVariableExpression(var: !237, expr: !DIExpression())
!237 = distinct !DIGlobalVariable(scope: null, file: !15, line: 1181, type: !137, isLocal: true, isDefinition: true)
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
!486 = !DILocalVariable(name: "seg2p", scope: !483, file: !15, line: 218, type: !409)
!487 = !DILocation(line: 218, column: 12, scope: !483)
!488 = !DILocation(line: 218, column: 31, scope: !483)
!489 = !DILocation(line: 218, column: 36, scope: !483)
!490 = !DILocation(line: 218, column: 21, scope: !483)
!491 = !DILocalVariable(name: "station_type", scope: !483, file: !15, line: 220, type: !5)
!492 = !DILocation(line: 220, column: 6, scope: !483)
!493 = !DILocation(line: 220, column: 21, scope: !483)
!494 = !DILocation(line: 220, column: 28, scope: !483)
!495 = !DILocation(line: 222, column: 2, scope: !483)
!496 = !DILocation(line: 223, column: 2, scope: !483)
!497 = !DILocation(line: 224, column: 6, scope: !498)
!498 = distinct !DILexicalBlock(scope: !483, file: !15, line: 224, column: 6)
!499 = !DILocation(line: 224, column: 12, scope: !498)
!500 = !DILocation(line: 224, column: 21, scope: !498)
!501 = !DILocation(line: 226, column: 2, scope: !483)
!502 = !DILocation(line: 227, column: 2, scope: !483)
!503 = !DILocation(line: 229, column: 17, scope: !483)
!504 = !DILocation(line: 229, column: 2, scope: !483)
!505 = !DILocation(line: 229, column: 9, scope: !483)
!506 = !DILocation(line: 229, column: 15, scope: !483)
!507 = !DILocation(line: 230, column: 34, scope: !483)
!508 = !DILocation(line: 230, column: 10, scope: !483)
!509 = !DILocation(line: 230, column: 2, scope: !483)
!510 = !DILocation(line: 230, column: 27, scope: !483)
!511 = !DILocation(line: 230, column: 32, scope: !483)
!512 = !DILocation(line: 231, column: 42, scope: !483)
!513 = !DILocation(line: 231, column: 59, scope: !483)
!514 = !DILocation(line: 231, column: 38, scope: !483)
!515 = !DILocation(line: 231, column: 10, scope: !483)
!516 = !DILocation(line: 231, column: 2, scope: !483)
!517 = !DILocation(line: 231, column: 27, scope: !483)
!518 = !DILocation(line: 231, column: 36, scope: !483)
!519 = !DILocation(line: 232, column: 49, scope: !483)
!520 = !DILocation(line: 232, column: 41, scope: !483)
!521 = !DILocation(line: 232, column: 66, scope: !483)
!522 = !DILocation(line: 232, column: 10, scope: !483)
!523 = !DILocation(line: 232, column: 2, scope: !483)
!524 = !DILocation(line: 232, column: 27, scope: !483)
!525 = !DILocation(line: 232, column: 39, scope: !483)
!526 = !DILocation(line: 234, column: 36, scope: !483)
!527 = !DILocation(line: 234, column: 42, scope: !483)
!528 = !DILocation(line: 234, column: 10, scope: !483)
!529 = !DILocation(line: 234, column: 2, scope: !483)
!530 = !DILocation(line: 234, column: 27, scope: !483)
!531 = !DILocation(line: 234, column: 34, scope: !483)
!532 = !DILocation(line: 235, column: 10, scope: !483)
!533 = !DILocation(line: 235, column: 2, scope: !483)
!534 = !DILocation(line: 235, column: 27, scope: !483)
!535 = !DILocation(line: 235, column: 33, scope: !483)
!536 = !DILocation(line: 236, column: 10, scope: !483)
!537 = !DILocation(line: 236, column: 2, scope: !483)
!538 = !DILocation(line: 236, column: 27, scope: !483)
!539 = !DILocation(line: 236, column: 32, scope: !483)
!540 = !DILocation(line: 240, column: 34, scope: !483)
!541 = !DILocation(line: 240, column: 26, scope: !483)
!542 = !DILocation(line: 240, column: 51, scope: !483)
!543 = !DILocation(line: 240, column: 69, scope: !483)
!544 = !DILocation(line: 240, column: 75, scope: !483)
!545 = !DILocation(line: 240, column: 60, scope: !483)
!546 = !DILocation(line: 240, column: 2, scope: !483)
!547 = !DILocation(line: 242, column: 22, scope: !483)
!548 = !DILocation(line: 242, column: 2, scope: !483)
!549 = !DILocation(line: 242, column: 9, scope: !483)
!550 = !DILocation(line: 242, column: 20, scope: !483)
!551 = !DILocation(line: 243, column: 19, scope: !483)
!552 = !DILocation(line: 245, column: 15, scope: !483)
!553 = !DILocation(line: 245, column: 22, scope: !483)
!554 = !DILocation(line: 245, column: 2, scope: !483)
!555 = !DILocation(line: 245, column: 34, scope: !483)
!556 = !DILocation(line: 245, column: 45, scope: !483)
!557 = !DILocation(line: 246, column: 15, scope: !483)
!558 = !DILocation(line: 246, column: 22, scope: !483)
!559 = !DILocation(line: 246, column: 2, scope: !483)
!560 = !DILocation(line: 246, column: 34, scope: !483)
!561 = !DILocation(line: 246, column: 43, scope: !483)
!562 = !DILocation(line: 247, column: 43, scope: !483)
!563 = !DILocation(line: 247, column: 49, scope: !483)
!564 = !DILocation(line: 247, column: 15, scope: !483)
!565 = !DILocation(line: 247, column: 22, scope: !483)
!566 = !DILocation(line: 247, column: 2, scope: !483)
!567 = !DILocation(line: 247, column: 34, scope: !483)
!568 = !DILocation(line: 247, column: 41, scope: !483)
!569 = !DILocation(line: 248, column: 48, scope: !483)
!570 = !DILocation(line: 248, column: 15, scope: !483)
!571 = !DILocation(line: 248, column: 22, scope: !483)
!572 = !DILocation(line: 248, column: 2, scope: !483)
!573 = !DILocation(line: 248, column: 34, scope: !483)
!574 = !DILocation(line: 248, column: 46, scope: !483)
!575 = !DILocation(line: 251, column: 17, scope: !483)
!576 = !DILocation(line: 252, column: 1, scope: !483)
!577 = distinct !DISubprogram(name: "i2f", linkageName: "_Z3i2fi", scope: !17, file: !17, line: 49, type: !578, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !213)
!578 = !DISubroutineType(types: !579)
!579 = !{!16, !5}
!580 = !DILocalVariable(name: "i", arg: 1, scope: !577, file: !17, line: 49, type: !5)
!581 = !DILocation(line: 49, column: 23, scope: !577)
!582 = !DILocation(line: 51, column: 9, scope: !577)
!583 = !DILocation(line: 51, column: 11, scope: !577)
!584 = !DILocation(line: 51, column: 2, scope: !577)
!585 = distinct !DISubprogram(name: "fuelcen_activate", linkageName: "_Z16fuelcen_activateP7segmenti", scope: !15, file: !15, line: 256, type: !586, scopeLine: 257, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !213)
!586 = !DISubroutineType(types: !587)
!587 = !{null, !74, !5}
!588 = !DILocalVariable(name: "segp", arg: 1, scope: !585, file: !15, line: 256, type: !74)
!589 = !DILocation(line: 256, column: 32, scope: !585)
!590 = !DILocalVariable(name: "station_type", arg: 2, scope: !585, file: !15, line: 256, type: !5)
!591 = !DILocation(line: 256, column: 42, scope: !585)
!592 = !DILocalVariable(name: "seg2p", scope: !585, file: !15, line: 258, type: !409)
!593 = !DILocation(line: 258, column: 12, scope: !585)
!594 = !DILocation(line: 258, column: 31, scope: !585)
!595 = !DILocation(line: 258, column: 36, scope: !585)
!596 = !DILocation(line: 258, column: 21, scope: !585)
!597 = !DILocation(line: 260, column: 19, scope: !585)
!598 = !DILocation(line: 260, column: 2, scope: !585)
!599 = !DILocation(line: 260, column: 9, scope: !585)
!600 = !DILocation(line: 260, column: 17, scope: !585)
!601 = !DILocation(line: 262, column: 6, scope: !602)
!602 = distinct !DILexicalBlock(scope: !585, file: !15, line: 262, column: 6)
!603 = !DILocation(line: 262, column: 13, scope: !602)
!604 = !DILocation(line: 262, column: 21, scope: !602)
!605 = !DILocation(line: 263, column: 17, scope: !602)
!606 = !DILocation(line: 263, column: 3, scope: !602)
!607 = !DILocation(line: 265, column: 18, scope: !602)
!608 = !DILocation(line: 265, column: 3, scope: !602)
!609 = !DILocation(line: 267, column: 1, scope: !585)
!610 = distinct !DISubprogram(name: "trigger_matcen", linkageName: "_Z14trigger_matceni", scope: !15, file: !15, line: 276, type: !611, scopeLine: 277, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !213)
!611 = !DISubroutineType(types: !612)
!612 = !{null, !5}
!613 = !DILocalVariable(name: "segnum", arg: 1, scope: !610, file: !15, line: 276, type: !5)
!614 = !DILocation(line: 276, column: 25, scope: !610)
!615 = !DILocalVariable(name: "seg2p", scope: !610, file: !15, line: 279, type: !409)
!616 = !DILocation(line: 279, column: 12, scope: !610)
!617 = !DILocation(line: 279, column: 31, scope: !610)
!618 = !DILocation(line: 279, column: 21, scope: !610)
!619 = !DILocalVariable(name: "pos", scope: !610, file: !15, line: 280, type: !61)
!620 = !DILocation(line: 280, column: 13, scope: !610)
!621 = !DILocalVariable(name: "delta", scope: !610, file: !15, line: 280, type: !61)
!622 = !DILocation(line: 280, column: 18, scope: !610)
!623 = !DILocalVariable(name: "robotcen", scope: !610, file: !15, line: 281, type: !624)
!624 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!625 = !DILocation(line: 281, column: 14, scope: !610)
!626 = !DILocalVariable(name: "objnum", scope: !610, file: !15, line: 282, type: !5)
!627 = !DILocation(line: 282, column: 8, scope: !610)
!628 = !DILocation(line: 284, column: 2, scope: !610)
!629 = !DILocation(line: 286, column: 2, scope: !610)
!630 = !DILocation(line: 287, column: 2, scope: !610)
!631 = !DILocation(line: 288, column: 2, scope: !610)
!632 = !DILocation(line: 0, scope: !610)
!633 = !DILocation(line: 290, column: 35, scope: !610)
!634 = !DILocation(line: 290, column: 42, scope: !610)
!635 = !DILocation(line: 290, column: 22, scope: !610)
!636 = !DILocation(line: 290, column: 54, scope: !610)
!637 = !DILocation(line: 290, column: 14, scope: !610)
!638 = !DILocation(line: 290, column: 11, scope: !610)
!639 = !DILocation(line: 292, column: 6, scope: !640)
!640 = distinct !DILexicalBlock(scope: !610, file: !15, line: 292, column: 6)
!641 = !DILocation(line: 292, column: 16, scope: !640)
!642 = !DILocation(line: 292, column: 24, scope: !640)
!643 = !DILocation(line: 293, column: 3, scope: !640)
!644 = !DILocation(line: 295, column: 7, scope: !645)
!645 = distinct !DILexicalBlock(scope: !610, file: !15, line: 295, column: 6)
!646 = !DILocation(line: 295, column: 17, scope: !645)
!647 = !DILocation(line: 295, column: 6, scope: !645)
!648 = !DILocation(line: 296, column: 3, scope: !645)
!649 = !DILocation(line: 299, column: 6, scope: !650)
!650 = distinct !DILexicalBlock(scope: !610, file: !15, line: 299, column: 6)
!651 = !DILocation(line: 299, column: 23, scope: !650)
!652 = !DILocation(line: 299, column: 27, scope: !650)
!653 = !DILocation(line: 300, column: 3, scope: !650)
!654 = !DILocation(line: 300, column: 13, scope: !650)
!655 = !DILocation(line: 300, column: 18, scope: !650)
!656 = !DILocation(line: 302, column: 2, scope: !610)
!657 = !DILocation(line: 302, column: 12, scope: !610)
!658 = !DILocation(line: 302, column: 18, scope: !610)
!659 = !DILocation(line: 303, column: 2, scope: !610)
!660 = !DILocation(line: 303, column: 12, scope: !610)
!661 = !DILocation(line: 303, column: 20, scope: !610)
!662 = !DILocation(line: 304, column: 27, scope: !610)
!663 = !DILocation(line: 304, column: 44, scope: !610)
!664 = !DILocation(line: 304, column: 23, scope: !610)
!665 = !DILocation(line: 304, column: 2, scope: !610)
!666 = !DILocation(line: 304, column: 12, scope: !610)
!667 = !DILocation(line: 304, column: 21, scope: !610)
!668 = !DILocation(line: 305, column: 27, scope: !610)
!669 = !DILocation(line: 305, column: 2, scope: !610)
!670 = !DILocation(line: 305, column: 12, scope: !610)
!671 = !DILocation(line: 305, column: 25, scope: !610)
!672 = !DILocation(line: 308, column: 8, scope: !610)
!673 = !DILocation(line: 308, column: 18, scope: !610)
!674 = !DILocation(line: 308, column: 6, scope: !610)
!675 = !DILocation(line: 309, column: 40, scope: !610)
!676 = !DILocation(line: 309, column: 31, scope: !610)
!677 = !DILocation(line: 309, column: 48, scope: !610)
!678 = !DILocation(line: 309, column: 22, scope: !610)
!679 = !DILocation(line: 309, column: 60, scope: !610)
!680 = !DILocation(line: 309, column: 70, scope: !610)
!681 = !DILocation(line: 309, column: 2, scope: !610)
!682 = !DILocation(line: 310, column: 2, scope: !610)
!683 = !DILocation(line: 311, column: 36, scope: !610)
!684 = !DILocation(line: 311, column: 11, scope: !610)
!685 = !DILocation(line: 311, column: 9, scope: !610)
!686 = !DILocation(line: 312, column: 6, scope: !687)
!687 = distinct !DILexicalBlock(scope: !610, file: !15, line: 312, column: 6)
!688 = !DILocation(line: 312, column: 13, scope: !687)
!689 = !DILocation(line: 313, column: 30, scope: !690)
!690 = distinct !DILexicalBlock(scope: !687, file: !15, line: 312, column: 20)
!691 = !DILocation(line: 313, column: 11, scope: !690)
!692 = !DILocation(line: 313, column: 3, scope: !690)
!693 = !DILocation(line: 313, column: 19, scope: !690)
!694 = !DILocation(line: 313, column: 28, scope: !690)
!695 = !DILocation(line: 314, column: 48, scope: !690)
!696 = !DILocation(line: 314, column: 11, scope: !690)
!697 = !DILocation(line: 314, column: 3, scope: !690)
!698 = !DILocation(line: 314, column: 19, scope: !690)
!699 = !DILocation(line: 314, column: 36, scope: !690)
!700 = !DILocation(line: 314, column: 46, scope: !690)
!701 = !DILocation(line: 315, column: 2, scope: !690)
!702 = !DILocation(line: 317, column: 3, scope: !703)
!703 = distinct !DILexicalBlock(scope: !687, file: !15, line: 316, column: 7)
!704 = !DILocation(line: 318, column: 3, scope: !703)
!705 = !DILocation(line: 321, column: 1, scope: !610)
!706 = distinct !DISubprogram(name: "create_morph_robot", linkageName: "_Z18create_morph_robotP7segmentP10vms_vectori", scope: !15, file: !15, line: 374, type: !707, scopeLine: 375, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !213)
!707 = !DISubroutineType(types: !708)
!708 = !{!709, !74, !841, !5}
!709 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !710, size: 64)
!710 = !DIDerivedType(tag: DW_TAG_typedef, name: "object", file: !711, line: 259, baseType: !712)
!711 = !DIFile(filename: "main_d2/object.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "1f2325d356aae4b692933d2aae4f3afd")
!712 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "object", file: !711, line: 210, size: 2144, flags: DIFlagTypePassByValue, elements: !713, identifier: "_ZTS6object")
!713 = !{!714, !715, !716, !717, !718, !719, !720, !721, !722, !723, !724, !725, !726, !733, !734, !735, !736, !737, !738, !739, !740, !741, !759, !813}
!714 = !DIDerivedType(tag: DW_TAG_member, name: "signature", scope: !712, file: !711, line: 212, baseType: !5, size: 32)
!715 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !712, file: !711, line: 213, baseType: !86, size: 8, offset: 32)
!716 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !712, file: !711, line: 214, baseType: !86, size: 8, offset: 40)
!717 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !712, file: !711, line: 215, baseType: !38, size: 16, offset: 48)
!718 = !DIDerivedType(tag: DW_TAG_member, name: "prev", scope: !712, file: !711, line: 215, baseType: !38, size: 16, offset: 64)
!719 = !DIDerivedType(tag: DW_TAG_member, name: "control_type", scope: !712, file: !711, line: 216, baseType: !86, size: 8, offset: 80)
!720 = !DIDerivedType(tag: DW_TAG_member, name: "movement_type", scope: !712, file: !711, line: 217, baseType: !86, size: 8, offset: 88)
!721 = !DIDerivedType(tag: DW_TAG_member, name: "render_type", scope: !712, file: !711, line: 218, baseType: !86, size: 8, offset: 96)
!722 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !712, file: !711, line: 219, baseType: !86, size: 8, offset: 104)
!723 = !DIDerivedType(tag: DW_TAG_member, name: "segnum", scope: !712, file: !711, line: 220, baseType: !38, size: 16, offset: 112)
!724 = !DIDerivedType(tag: DW_TAG_member, name: "attached_obj", scope: !712, file: !711, line: 221, baseType: !38, size: 16, offset: 128)
!725 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !712, file: !711, line: 222, baseType: !61, size: 96, offset: 160)
!726 = !DIDerivedType(tag: DW_TAG_member, name: "orient", scope: !712, file: !711, line: 223, baseType: !727, size: 288, offset: 256)
!727 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_matrix", file: !62, line: 47, baseType: !728)
!728 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_matrix", file: !62, line: 44, size: 288, flags: DIFlagTypePassByValue, elements: !729, identifier: "_ZTS10vms_matrix")
!729 = !{!730, !731, !732}
!730 = !DIDerivedType(tag: DW_TAG_member, name: "rvec", scope: !728, file: !62, line: 46, baseType: !61, size: 96)
!731 = !DIDerivedType(tag: DW_TAG_member, name: "uvec", scope: !728, file: !62, line: 46, baseType: !61, size: 96, offset: 96)
!732 = !DIDerivedType(tag: DW_TAG_member, name: "fvec", scope: !728, file: !62, line: 46, baseType: !61, size: 96, offset: 192)
!733 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !712, file: !711, line: 224, baseType: !16, size: 32, offset: 544)
!734 = !DIDerivedType(tag: DW_TAG_member, name: "shields", scope: !712, file: !711, line: 225, baseType: !16, size: 32, offset: 576)
!735 = !DIDerivedType(tag: DW_TAG_member, name: "last_pos", scope: !712, file: !711, line: 226, baseType: !61, size: 96, offset: 608)
!736 = !DIDerivedType(tag: DW_TAG_member, name: "contains_type", scope: !712, file: !711, line: 227, baseType: !6, size: 8, offset: 704)
!737 = !DIDerivedType(tag: DW_TAG_member, name: "contains_id", scope: !712, file: !711, line: 228, baseType: !6, size: 8, offset: 712)
!738 = !DIDerivedType(tag: DW_TAG_member, name: "contains_count", scope: !712, file: !711, line: 229, baseType: !6, size: 8, offset: 720)
!739 = !DIDerivedType(tag: DW_TAG_member, name: "matcen_creator", scope: !712, file: !711, line: 230, baseType: !6, size: 8, offset: 728)
!740 = !DIDerivedType(tag: DW_TAG_member, name: "lifeleft", scope: !712, file: !711, line: 231, baseType: !16, size: 32, offset: 736)
!741 = !DIDerivedType(tag: DW_TAG_member, name: "mtype", scope: !712, file: !711, line: 240, baseType: !742, size: 512, offset: 768)
!742 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !712, file: !711, line: 236, size: 512, flags: DIFlagTypePassByValue, elements: !743, identifier: "_ZTSN6objectUt_E")
!743 = !{!744, !758}
!744 = !DIDerivedType(tag: DW_TAG_member, name: "phys_info", scope: !742, file: !711, line: 238, baseType: !745, size: 512)
!745 = !DIDerivedType(tag: DW_TAG_typedef, name: "physics_info", file: !711, line: 153, baseType: !746)
!746 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "physics_info", file: !711, line: 142, size: 512, flags: DIFlagTypePassByValue, elements: !747, identifier: "_ZTS12physics_info")
!747 = !{!748, !749, !750, !751, !752, !753, !754, !755, !757}
!748 = !DIDerivedType(tag: DW_TAG_member, name: "velocity", scope: !746, file: !711, line: 144, baseType: !61, size: 96)
!749 = !DIDerivedType(tag: DW_TAG_member, name: "thrust", scope: !746, file: !711, line: 145, baseType: !61, size: 96, offset: 96)
!750 = !DIDerivedType(tag: DW_TAG_member, name: "mass", scope: !746, file: !711, line: 146, baseType: !16, size: 32, offset: 192)
!751 = !DIDerivedType(tag: DW_TAG_member, name: "drag", scope: !746, file: !711, line: 147, baseType: !16, size: 32, offset: 224)
!752 = !DIDerivedType(tag: DW_TAG_member, name: "brakes", scope: !746, file: !711, line: 148, baseType: !16, size: 32, offset: 256)
!753 = !DIDerivedType(tag: DW_TAG_member, name: "rotvel", scope: !746, file: !711, line: 149, baseType: !61, size: 96, offset: 288)
!754 = !DIDerivedType(tag: DW_TAG_member, name: "rotthrust", scope: !746, file: !711, line: 150, baseType: !61, size: 96, offset: 384)
!755 = !DIDerivedType(tag: DW_TAG_member, name: "turnroll", scope: !746, file: !711, line: 151, baseType: !756, size: 16, offset: 480)
!756 = !DIDerivedType(tag: DW_TAG_typedef, name: "fixang", file: !17, line: 21, baseType: !38)
!757 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !746, file: !711, line: 152, baseType: !253, size: 16, offset: 496)
!758 = !DIDerivedType(tag: DW_TAG_member, name: "spin_rate", scope: !742, file: !711, line: 239, baseType: !61, size: 96)
!759 = !DIDerivedType(tag: DW_TAG_member, name: "ctype", scope: !712, file: !711, line: 250, baseType: !760, size: 256, offset: 1280)
!760 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !712, file: !711, line: 243, size: 256, flags: DIFlagTypePassByValue, elements: !761, identifier: "_ZTSN6objectUt0_E")
!761 = !{!762, !773, !783, !801, !806}
!762 = !DIDerivedType(tag: DW_TAG_member, name: "laser_info", scope: !760, file: !711, line: 245, baseType: !763, size: 160)
!763 = !DIDerivedType(tag: DW_TAG_typedef, name: "laser_info_t", file: !711, line: 166, baseType: !764)
!764 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "laser_info_s", file: !711, line: 157, size: 160, flags: DIFlagTypePassByValue, elements: !765, identifier: "_ZTS12laser_info_s")
!765 = !{!766, !767, !768, !769, !770, !771, !772}
!766 = !DIDerivedType(tag: DW_TAG_member, name: "parent_type", scope: !764, file: !711, line: 159, baseType: !38, size: 16)
!767 = !DIDerivedType(tag: DW_TAG_member, name: "parent_num", scope: !764, file: !711, line: 160, baseType: !38, size: 16, offset: 16)
!768 = !DIDerivedType(tag: DW_TAG_member, name: "parent_signature", scope: !764, file: !711, line: 161, baseType: !5, size: 32, offset: 32)
!769 = !DIDerivedType(tag: DW_TAG_member, name: "creation_time", scope: !764, file: !711, line: 162, baseType: !16, size: 32, offset: 64)
!770 = !DIDerivedType(tag: DW_TAG_member, name: "last_hitobj", scope: !764, file: !711, line: 163, baseType: !38, size: 16, offset: 96)
!771 = !DIDerivedType(tag: DW_TAG_member, name: "track_goal", scope: !764, file: !711, line: 164, baseType: !38, size: 16, offset: 112)
!772 = !DIDerivedType(tag: DW_TAG_member, name: "multiplier", scope: !764, file: !711, line: 165, baseType: !16, size: 32, offset: 128)
!773 = !DIDerivedType(tag: DW_TAG_member, name: "expl_info", scope: !760, file: !711, line: 246, baseType: !774, size: 128)
!774 = !DIDerivedType(tag: DW_TAG_typedef, name: "explosion_info", file: !711, line: 176, baseType: !775)
!775 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "explosion_info", file: !711, line: 168, size: 128, flags: DIFlagTypePassByValue, elements: !776, identifier: "_ZTS14explosion_info")
!776 = !{!777, !778, !779, !780, !781, !782}
!777 = !DIDerivedType(tag: DW_TAG_member, name: "spawn_time", scope: !775, file: !711, line: 170, baseType: !16, size: 32)
!778 = !DIDerivedType(tag: DW_TAG_member, name: "delete_time", scope: !775, file: !711, line: 171, baseType: !16, size: 32, offset: 32)
!779 = !DIDerivedType(tag: DW_TAG_member, name: "delete_objnum", scope: !775, file: !711, line: 172, baseType: !38, size: 16, offset: 64)
!780 = !DIDerivedType(tag: DW_TAG_member, name: "attach_parent", scope: !775, file: !711, line: 173, baseType: !38, size: 16, offset: 80)
!781 = !DIDerivedType(tag: DW_TAG_member, name: "prev_attach", scope: !775, file: !711, line: 174, baseType: !38, size: 16, offset: 96)
!782 = !DIDerivedType(tag: DW_TAG_member, name: "next_attach", scope: !775, file: !711, line: 175, baseType: !38, size: 16, offset: 112)
!783 = !DIDerivedType(tag: DW_TAG_member, name: "ai_info", scope: !760, file: !711, line: 247, baseType: !784, size: 256)
!784 = !DIDerivedType(tag: DW_TAG_typedef, name: "ai_static", file: !785, line: 144, baseType: !786)
!785 = !DIFile(filename: "main_d2/aistruct.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "d122430e792a0ddc0f9eaa08ad217628")
!786 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ai_static", file: !785, line: 127, size: 256, flags: DIFlagTypePassByValue, elements: !787, identifier: "_ZTS9ai_static")
!787 = !{!788, !789, !793, !794, !795, !796, !797, !798, !799, !800}
!788 = !DIDerivedType(tag: DW_TAG_member, name: "behavior", scope: !786, file: !785, line: 128, baseType: !86, size: 8)
!789 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !786, file: !785, line: 129, baseType: !790, size: 88, offset: 8)
!790 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 88, elements: !791)
!791 = !{!792}
!792 = !DISubrange(count: 11)
!793 = !DIDerivedType(tag: DW_TAG_member, name: "hide_segment", scope: !786, file: !785, line: 130, baseType: !38, size: 16, offset: 96)
!794 = !DIDerivedType(tag: DW_TAG_member, name: "hide_index", scope: !786, file: !785, line: 131, baseType: !38, size: 16, offset: 112)
!795 = !DIDerivedType(tag: DW_TAG_member, name: "path_length", scope: !786, file: !785, line: 132, baseType: !38, size: 16, offset: 128)
!796 = !DIDerivedType(tag: DW_TAG_member, name: "cur_path_index", scope: !786, file: !785, line: 133, baseType: !6, size: 8, offset: 144)
!797 = !DIDerivedType(tag: DW_TAG_member, name: "dying_sound_playing", scope: !786, file: !785, line: 134, baseType: !6, size: 8, offset: 152)
!798 = !DIDerivedType(tag: DW_TAG_member, name: "danger_laser_num", scope: !786, file: !785, line: 139, baseType: !38, size: 16, offset: 160)
!799 = !DIDerivedType(tag: DW_TAG_member, name: "danger_laser_signature", scope: !786, file: !785, line: 140, baseType: !5, size: 32, offset: 192)
!800 = !DIDerivedType(tag: DW_TAG_member, name: "dying_start_time", scope: !786, file: !785, line: 141, baseType: !16, size: 32, offset: 224)
!801 = !DIDerivedType(tag: DW_TAG_member, name: "light_info", scope: !760, file: !711, line: 248, baseType: !802, size: 32)
!802 = !DIDerivedType(tag: DW_TAG_typedef, name: "light_info_t", file: !711, line: 181, baseType: !803)
!803 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "light_info_s", file: !711, line: 178, size: 32, flags: DIFlagTypePassByValue, elements: !804, identifier: "_ZTS12light_info_s")
!804 = !{!805}
!805 = !DIDerivedType(tag: DW_TAG_member, name: "intensity", scope: !803, file: !711, line: 180, baseType: !16, size: 32)
!806 = !DIDerivedType(tag: DW_TAG_member, name: "powerup_info", scope: !760, file: !711, line: 249, baseType: !807, size: 96)
!807 = !DIDerivedType(tag: DW_TAG_typedef, name: "powerup_info_t", file: !711, line: 190, baseType: !808)
!808 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "powerup_info_s", file: !711, line: 185, size: 96, flags: DIFlagTypePassByValue, elements: !809, identifier: "_ZTS14powerup_info_s")
!809 = !{!810, !811, !812}
!810 = !DIDerivedType(tag: DW_TAG_member, name: "count", scope: !808, file: !711, line: 187, baseType: !5, size: 32)
!811 = !DIDerivedType(tag: DW_TAG_member, name: "creation_time", scope: !808, file: !711, line: 188, baseType: !16, size: 32, offset: 32)
!812 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !808, file: !711, line: 189, baseType: !5, size: 32, offset: 64)
!813 = !DIDerivedType(tag: DW_TAG_member, name: "rtype", scope: !712, file: !711, line: 257, baseType: !814, size: 608, offset: 1536)
!814 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !712, file: !711, line: 253, size: 608, flags: DIFlagTypePassByValue, elements: !815, identifier: "_ZTSN6objectUt1_E")
!815 = !{!816, !834}
!816 = !DIDerivedType(tag: DW_TAG_member, name: "pobj_info", scope: !814, file: !711, line: 255, baseType: !817, size: 608)
!817 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyobj_info", file: !711, line: 208, baseType: !818)
!818 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "polyobj_info", file: !711, line: 201, size: 608, flags: DIFlagTypePassByValue, elements: !819, identifier: "_ZTS12polyobj_info")
!819 = !{!820, !821, !831, !832, !833}
!820 = !DIDerivedType(tag: DW_TAG_member, name: "model_num", scope: !818, file: !711, line: 203, baseType: !5, size: 32)
!821 = !DIDerivedType(tag: DW_TAG_member, name: "anim_angles", scope: !818, file: !711, line: 204, baseType: !822, size: 480, offset: 32)
!822 = !DICompositeType(tag: DW_TAG_array_type, baseType: !823, size: 480, elements: !829)
!823 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_angvec", file: !62, line: 40, baseType: !824)
!824 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_angvec", file: !62, line: 37, size: 48, flags: DIFlagTypePassByValue, elements: !825, identifier: "_ZTS10vms_angvec")
!825 = !{!826, !827, !828}
!826 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !824, file: !62, line: 39, baseType: !756, size: 16)
!827 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !824, file: !62, line: 39, baseType: !756, size: 16, offset: 16)
!828 = !DIDerivedType(tag: DW_TAG_member, name: "h", scope: !824, file: !62, line: 39, baseType: !756, size: 16, offset: 32)
!829 = !{!830}
!830 = !DISubrange(count: 10)
!831 = !DIDerivedType(tag: DW_TAG_member, name: "subobj_flags", scope: !818, file: !711, line: 205, baseType: !5, size: 32, offset: 512)
!832 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_override", scope: !818, file: !711, line: 206, baseType: !5, size: 32, offset: 544)
!833 = !DIDerivedType(tag: DW_TAG_member, name: "alt_textures", scope: !818, file: !711, line: 207, baseType: !5, size: 32, offset: 576)
!834 = !DIDerivedType(tag: DW_TAG_member, name: "vclip_info", scope: !814, file: !711, line: 256, baseType: !835, size: 96)
!835 = !DIDerivedType(tag: DW_TAG_typedef, name: "vclip_info_t", file: !711, line: 197, baseType: !836)
!836 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vclip_info_s", file: !711, line: 192, size: 96, flags: DIFlagTypePassByValue, elements: !837, identifier: "_ZTS12vclip_info_s")
!837 = !{!838, !839, !840}
!838 = !DIDerivedType(tag: DW_TAG_member, name: "vclip_num", scope: !836, file: !711, line: 194, baseType: !5, size: 32)
!839 = !DIDerivedType(tag: DW_TAG_member, name: "frametime", scope: !836, file: !711, line: 195, baseType: !16, size: 32, offset: 32)
!840 = !DIDerivedType(tag: DW_TAG_member, name: "framenum", scope: !836, file: !711, line: 196, baseType: !6, size: 8, offset: 64)
!841 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!842 = !DILocalVariable(name: "segp", arg: 1, scope: !706, file: !15, line: 374, type: !74)
!843 = !DILocation(line: 374, column: 37, scope: !706)
!844 = !DILocalVariable(name: "object_pos", arg: 2, scope: !706, file: !15, line: 374, type: !841)
!845 = !DILocation(line: 374, column: 55, scope: !706)
!846 = !DILocalVariable(name: "object_id", arg: 3, scope: !706, file: !15, line: 374, type: !5)
!847 = !DILocation(line: 374, column: 71, scope: !706)
!848 = !DILocalVariable(name: "objnum", scope: !706, file: !15, line: 376, type: !38)
!849 = !DILocation(line: 376, column: 9, scope: !706)
!850 = !DILocalVariable(name: "obj", scope: !706, file: !15, line: 377, type: !709)
!851 = !DILocation(line: 377, column: 10, scope: !706)
!852 = !DILocalVariable(name: "default_behavior", scope: !706, file: !15, line: 378, type: !5)
!853 = !DILocation(line: 378, column: 7, scope: !706)
!854 = !DILocation(line: 380, column: 10, scope: !706)
!855 = !DILocation(line: 380, column: 2, scope: !706)
!856 = !DILocation(line: 380, column: 22, scope: !706)
!857 = !DILocation(line: 380, column: 38, scope: !706)
!858 = !DILocation(line: 381, column: 10, scope: !706)
!859 = !DILocation(line: 381, column: 2, scope: !706)
!860 = !DILocation(line: 381, column: 22, scope: !706)
!861 = !DILocation(line: 381, column: 38, scope: !706)
!862 = !DILocation(line: 383, column: 33, scope: !706)
!863 = !DILocation(line: 383, column: 44, scope: !706)
!864 = !DILocation(line: 383, column: 49, scope: !706)
!865 = !DILocation(line: 383, column: 61, scope: !706)
!866 = !DILocation(line: 384, column: 51, scope: !706)
!867 = !DILocation(line: 384, column: 40, scope: !706)
!868 = !DILocation(line: 384, column: 62, scope: !706)
!869 = !DILocation(line: 384, column: 25, scope: !706)
!870 = !DILocation(line: 384, column: 73, scope: !706)
!871 = !DILocation(line: 383, column: 11, scope: !706)
!872 = !DILocation(line: 383, column: 9, scope: !706)
!873 = !DILocation(line: 387, column: 6, scope: !874)
!874 = distinct !DILexicalBlock(scope: !706, file: !15, line: 387, column: 6)
!875 = !DILocation(line: 387, column: 13, scope: !874)
!876 = !DILocation(line: 388, column: 3, scope: !877)
!877 = distinct !DILexicalBlock(scope: !874, file: !15, line: 387, column: 18)
!878 = !DILocation(line: 389, column: 3, scope: !877)
!879 = !DILocation(line: 390, column: 3, scope: !877)
!880 = !DILocation(line: 393, column: 17, scope: !706)
!881 = !DILocation(line: 393, column: 9, scope: !706)
!882 = !DILocation(line: 393, column: 6, scope: !706)
!883 = !DILocation(line: 397, column: 46, scope: !706)
!884 = !DILocation(line: 397, column: 51, scope: !706)
!885 = !DILocation(line: 397, column: 35, scope: !706)
!886 = !DILocation(line: 397, column: 55, scope: !706)
!887 = !DILocation(line: 397, column: 2, scope: !706)
!888 = !DILocation(line: 397, column: 7, scope: !706)
!889 = !DILocation(line: 397, column: 23, scope: !706)
!890 = !DILocation(line: 397, column: 33, scope: !706)
!891 = !DILocation(line: 398, column: 2, scope: !706)
!892 = !DILocation(line: 398, column: 7, scope: !706)
!893 = !DILocation(line: 398, column: 23, scope: !706)
!894 = !DILocation(line: 398, column: 36, scope: !706)
!895 = !DILocation(line: 402, column: 41, scope: !706)
!896 = !DILocation(line: 402, column: 46, scope: !706)
!897 = !DILocation(line: 402, column: 30, scope: !706)
!898 = !DILocation(line: 402, column: 50, scope: !706)
!899 = !DILocation(line: 402, column: 2, scope: !706)
!900 = !DILocation(line: 402, column: 7, scope: !706)
!901 = !DILocation(line: 402, column: 23, scope: !706)
!902 = !DILocation(line: 402, column: 28, scope: !706)
!903 = !DILocation(line: 403, column: 41, scope: !706)
!904 = !DILocation(line: 403, column: 46, scope: !706)
!905 = !DILocation(line: 403, column: 30, scope: !706)
!906 = !DILocation(line: 403, column: 50, scope: !706)
!907 = !DILocation(line: 403, column: 2, scope: !706)
!908 = !DILocation(line: 403, column: 7, scope: !706)
!909 = !DILocation(line: 403, column: 23, scope: !706)
!910 = !DILocation(line: 403, column: 28, scope: !706)
!911 = !DILocation(line: 405, column: 2, scope: !706)
!912 = !DILocation(line: 405, column: 7, scope: !706)
!913 = !DILocation(line: 405, column: 23, scope: !706)
!914 = !DILocation(line: 405, column: 29, scope: !706)
!915 = !DILocation(line: 407, column: 28, scope: !706)
!916 = !DILocation(line: 407, column: 33, scope: !706)
!917 = !DILocation(line: 407, column: 17, scope: !706)
!918 = !DILocation(line: 407, column: 37, scope: !706)
!919 = !DILocation(line: 407, column: 2, scope: !706)
!920 = !DILocation(line: 407, column: 7, scope: !706)
!921 = !DILocation(line: 407, column: 15, scope: !706)
!922 = !DILocation(line: 409, column: 32, scope: !706)
!923 = !DILocation(line: 409, column: 37, scope: !706)
!924 = !DILocation(line: 409, column: 21, scope: !706)
!925 = !DILocation(line: 409, column: 41, scope: !706)
!926 = !DILocation(line: 409, column: 19, scope: !706)
!927 = !DILocation(line: 411, column: 17, scope: !706)
!928 = !DILocation(line: 411, column: 21, scope: !706)
!929 = !DILocation(line: 411, column: 32, scope: !706)
!930 = !DILocation(line: 411, column: 2, scope: !706)
!931 = !DILocation(line: 413, column: 24, scope: !706)
!932 = !DILocation(line: 413, column: 2, scope: !706)
!933 = !DILocation(line: 415, column: 51, scope: !706)
!934 = !DILocation(line: 415, column: 31, scope: !706)
!935 = !DILocation(line: 415, column: 16, scope: !706)
!936 = !DILocation(line: 415, column: 2, scope: !706)
!937 = !DILocation(line: 415, column: 24, scope: !706)
!938 = !DILocation(line: 415, column: 29, scope: !706)
!939 = !DILocation(line: 417, column: 9, scope: !706)
!940 = !DILocation(line: 417, column: 2, scope: !706)
!941 = !DILocation(line: 418, column: 1, scope: !706)
!942 = distinct !DISubprogram(name: "robotmaker_proc", linkageName: "_Z15robotmaker_procP10FuelCenter", scope: !15, file: !15, line: 427, type: !943, scopeLine: 428, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !213)
!943 = !DISubroutineType(types: !944)
!944 = !{null, !624}
!945 = !DILocalVariable(name: "robotcen", arg: 1, scope: !942, file: !15, line: 427, type: !624)
!946 = !DILocation(line: 427, column: 34, scope: !942)
!947 = !DILocalVariable(name: "dist_to_player", scope: !942, file: !15, line: 429, type: !16)
!948 = !DILocation(line: 429, column: 7, scope: !942)
!949 = !DILocalVariable(name: "cur_object_loc", scope: !942, file: !15, line: 430, type: !61)
!950 = !DILocation(line: 430, column: 13, scope: !942)
!951 = !DILocalVariable(name: "matcen_num", scope: !942, file: !15, line: 431, type: !5)
!952 = !DILocation(line: 431, column: 7, scope: !942)
!953 = !DILocalVariable(name: "segnum", scope: !942, file: !15, line: 431, type: !5)
!954 = !DILocation(line: 431, column: 19, scope: !942)
!955 = !DILocalVariable(name: "objnum", scope: !942, file: !15, line: 431, type: !5)
!956 = !DILocation(line: 431, column: 27, scope: !942)
!957 = !DILocalVariable(name: "obj", scope: !942, file: !15, line: 432, type: !709)
!958 = !DILocation(line: 432, column: 10, scope: !942)
!959 = !DILocalVariable(name: "top_time", scope: !942, file: !15, line: 433, type: !16)
!960 = !DILocation(line: 433, column: 7, scope: !942)
!961 = !DILocalVariable(name: "direction", scope: !942, file: !15, line: 434, type: !61)
!962 = !DILocation(line: 434, column: 13, scope: !942)
!963 = !DILocation(line: 436, column: 6, scope: !964)
!964 = distinct !DILexicalBlock(scope: !942, file: !15, line: 436, column: 6)
!965 = !DILocation(line: 436, column: 16, scope: !964)
!966 = !DILocation(line: 436, column: 24, scope: !964)
!967 = !DILocation(line: 437, column: 3, scope: !964)
!968 = !DILocation(line: 439, column: 6, scope: !969)
!969 = distinct !DILexicalBlock(scope: !942, file: !15, line: 439, column: 6)
!970 = !DILocation(line: 439, column: 16, scope: !969)
!971 = !DILocation(line: 439, column: 29, scope: !969)
!972 = !DILocation(line: 441, column: 29, scope: !973)
!973 = distinct !DILexicalBlock(scope: !969, file: !15, line: 440, column: 2)
!974 = !DILocation(line: 441, column: 3, scope: !973)
!975 = !DILocation(line: 441, column: 13, scope: !973)
!976 = !DILocation(line: 441, column: 26, scope: !973)
!977 = !DILocation(line: 442, column: 7, scope: !978)
!978 = distinct !DILexicalBlock(scope: !973, file: !15, line: 442, column: 7)
!979 = !DILocation(line: 442, column: 17, scope: !978)
!980 = !DILocation(line: 442, column: 30, scope: !978)
!981 = !DILocation(line: 444, column: 4, scope: !982)
!982 = distinct !DILexicalBlock(scope: !978, file: !15, line: 443, column: 3)
!983 = !DILocation(line: 445, column: 4, scope: !982)
!984 = !DILocation(line: 445, column: 14, scope: !982)
!985 = !DILocation(line: 445, column: 22, scope: !982)
!986 = !DILocation(line: 446, column: 3, scope: !982)
!987 = !DILocation(line: 447, column: 2, scope: !973)
!988 = !DILocation(line: 463, column: 6, scope: !989)
!989 = distinct !DILexicalBlock(scope: !942, file: !15, line: 463, column: 6)
!990 = !DILocation(line: 463, column: 16, scope: !989)
!991 = !DILocation(line: 463, column: 25, scope: !989)
!992 = !DILocation(line: 465, column: 3, scope: !993)
!993 = distinct !DILexicalBlock(scope: !989, file: !15, line: 464, column: 2)
!994 = !DILocation(line: 468, column: 25, scope: !942)
!995 = !DILocation(line: 468, column: 35, scope: !942)
!996 = !DILocation(line: 468, column: 15, scope: !942)
!997 = !DILocation(line: 468, column: 43, scope: !942)
!998 = !DILocation(line: 468, column: 13, scope: !942)
!999 = !DILocation(line: 471, column: 6, scope: !1000)
!1000 = distinct !DILexicalBlock(scope: !942, file: !15, line: 471, column: 6)
!1001 = !DILocation(line: 471, column: 17, scope: !1000)
!1002 = !DILocation(line: 473, column: 3, scope: !1003)
!1003 = distinct !DILexicalBlock(scope: !1000, file: !15, line: 472, column: 2)
!1004 = !DILocation(line: 474, column: 3, scope: !1003)
!1005 = !DILocation(line: 477, column: 19, scope: !1006)
!1006 = distinct !DILexicalBlock(scope: !942, file: !15, line: 477, column: 6)
!1007 = !DILocation(line: 477, column: 6, scope: !1006)
!1008 = !DILocation(line: 477, column: 31, scope: !1006)
!1009 = !DILocation(line: 477, column: 46, scope: !1006)
!1010 = !DILocation(line: 477, column: 51, scope: !1006)
!1011 = !DILocation(line: 477, column: 67, scope: !1006)
!1012 = !DILocation(line: 477, column: 54, scope: !1006)
!1013 = !DILocation(line: 477, column: 79, scope: !1006)
!1014 = !DILocation(line: 477, column: 94, scope: !1006)
!1015 = !DILocation(line: 479, column: 3, scope: !1016)
!1016 = distinct !DILexicalBlock(scope: !1006, file: !15, line: 477, column: 100)
!1017 = !DILocation(line: 484, column: 15, scope: !1018)
!1018 = distinct !DILexicalBlock(scope: !942, file: !15, line: 484, column: 6)
!1019 = !DILocation(line: 484, column: 7, scope: !1018)
!1020 = !DILocation(line: 484, column: 27, scope: !1018)
!1021 = !DILocation(line: 484, column: 54, scope: !1018)
!1022 = !DILocation(line: 484, column: 46, scope: !1018)
!1023 = !DILocation(line: 484, column: 66, scope: !1018)
!1024 = !DILocation(line: 484, column: 44, scope: !1018)
!1025 = !DILocation(line: 484, column: 87, scope: !1018)
!1026 = !DILocation(line: 484, column: 113, scope: !1018)
!1027 = !DILocation(line: 484, column: 111, scope: !1018)
!1028 = !DILocation(line: 484, column: 83, scope: !1018)
!1029 = !DILocation(line: 486, column: 7, scope: !1030)
!1030 = distinct !DILexicalBlock(scope: !1031, file: !15, line: 486, column: 7)
!1031 = distinct !DILexicalBlock(scope: !1018, file: !15, line: 484, column: 132)
!1032 = !DILocation(line: 486, column: 20, scope: !1030)
!1033 = !DILocation(line: 486, column: 40, scope: !1030)
!1034 = !DILocation(line: 486, column: 18, scope: !1030)
!1035 = !DILocation(line: 488, column: 4, scope: !1036)
!1036 = distinct !DILexicalBlock(scope: !1030, file: !15, line: 487, column: 3)
!1037 = !DILocation(line: 489, column: 26, scope: !1036)
!1038 = !DILocation(line: 489, column: 24, scope: !1036)
!1039 = !DILocation(line: 490, column: 3, scope: !1036)
!1040 = !DILocation(line: 492, column: 3, scope: !1031)
!1041 = !DILocation(line: 495, column: 21, scope: !942)
!1042 = !DILocation(line: 495, column: 2, scope: !942)
!1043 = !DILocation(line: 495, column: 12, scope: !942)
!1044 = !DILocation(line: 495, column: 18, scope: !942)
!1045 = !DILocation(line: 497, column: 10, scope: !942)
!1046 = !DILocation(line: 497, column: 20, scope: !942)
!1047 = !DILocation(line: 497, column: 2, scope: !942)
!1048 = !DILocation(line: 500, column: 7, scope: !1049)
!1049 = distinct !DILexicalBlock(scope: !1050, file: !15, line: 500, column: 7)
!1050 = distinct !DILexicalBlock(scope: !942, file: !15, line: 498, column: 2)
!1051 = !DILocation(line: 500, column: 17, scope: !1049)
!1052 = !DILocation(line: 502, column: 15, scope: !1053)
!1053 = distinct !DILexicalBlock(scope: !1049, file: !15, line: 501, column: 3)
!1054 = !DILocation(line: 502, column: 13, scope: !1053)
!1055 = !DILocation(line: 503, column: 3, scope: !1053)
!1056 = !DILocation(line: 506, column: 40, scope: !1057)
!1057 = distinct !DILexicalBlock(scope: !1049, file: !15, line: 505, column: 3)
!1058 = !DILocation(line: 506, column: 55, scope: !1057)
!1059 = !DILocation(line: 506, column: 61, scope: !1057)
!1060 = !DILocation(line: 506, column: 71, scope: !1057)
!1061 = !DILocation(line: 506, column: 21, scope: !1057)
!1062 = !DILocation(line: 506, column: 19, scope: !1057)
!1063 = !DILocation(line: 507, column: 15, scope: !1057)
!1064 = !DILocation(line: 507, column: 30, scope: !1057)
!1065 = !DILocation(line: 507, column: 37, scope: !1057)
!1066 = !DILocation(line: 507, column: 46, scope: !1057)
!1067 = !DILocation(line: 507, column: 35, scope: !1057)
!1068 = !DILocation(line: 507, column: 50, scope: !1057)
!1069 = !DILocation(line: 507, column: 13, scope: !1057)
!1070 = !DILocation(line: 508, column: 8, scope: !1071)
!1071 = distinct !DILexicalBlock(scope: !1057, file: !15, line: 508, column: 8)
!1072 = !DILocation(line: 508, column: 19, scope: !1071)
!1073 = !DILocation(line: 508, column: 17, scope: !1071)
!1074 = !DILocation(line: 509, column: 16, scope: !1071)
!1075 = !DILocation(line: 509, column: 33, scope: !1071)
!1076 = !DILocation(line: 509, column: 31, scope: !1071)
!1077 = !DILocation(line: 509, column: 14, scope: !1071)
!1078 = !DILocation(line: 509, column: 5, scope: !1071)
!1079 = !DILocation(line: 510, column: 8, scope: !1080)
!1080 = distinct !DILexicalBlock(scope: !1057, file: !15, line: 510, column: 8)
!1081 = !DILocation(line: 510, column: 17, scope: !1080)
!1082 = !DILocation(line: 511, column: 31, scope: !1080)
!1083 = !DILocation(line: 511, column: 40, scope: !1080)
!1084 = !DILocation(line: 511, column: 29, scope: !1080)
!1085 = !DILocation(line: 511, column: 14, scope: !1080)
!1086 = !DILocation(line: 511, column: 5, scope: !1080)
!1087 = !DILocation(line: 516, column: 7, scope: !1088)
!1088 = distinct !DILexicalBlock(scope: !1050, file: !15, line: 516, column: 7)
!1089 = !DILocation(line: 516, column: 17, scope: !1088)
!1090 = !DILocation(line: 516, column: 25, scope: !1088)
!1091 = !DILocation(line: 516, column: 23, scope: !1088)
!1092 = !DILocalVariable(name: "count", scope: !1093, file: !15, line: 518, type: !5)
!1093 = distinct !DILexicalBlock(scope: !1088, file: !15, line: 517, column: 3)
!1094 = !DILocation(line: 518, column: 8, scope: !1093)
!1095 = !DILocalVariable(name: "i", scope: !1093, file: !15, line: 519, type: !5)
!1096 = !DILocation(line: 519, column: 8, scope: !1093)
!1097 = !DILocalVariable(name: "my_station_num", scope: !1093, file: !15, line: 519, type: !5)
!1098 = !DILocation(line: 519, column: 11, scope: !1093)
!1099 = !DILocation(line: 519, column: 28, scope: !1093)
!1100 = !DILocation(line: 519, column: 37, scope: !1093)
!1101 = !DILocalVariable(name: "obj", scope: !1093, file: !15, line: 520, type: !709)
!1102 = !DILocation(line: 520, column: 12, scope: !1093)
!1103 = !DILocation(line: 523, column: 11, scope: !1104)
!1104 = distinct !DILexicalBlock(scope: !1093, file: !15, line: 523, column: 4)
!1105 = !DILocation(line: 523, column: 9, scope: !1104)
!1106 = !DILocation(line: 523, column: 16, scope: !1107)
!1107 = distinct !DILexicalBlock(scope: !1104, file: !15, line: 523, column: 4)
!1108 = !DILocation(line: 523, column: 21, scope: !1107)
!1109 = !DILocation(line: 523, column: 18, scope: !1107)
!1110 = !DILocation(line: 523, column: 4, scope: !1104)
!1111 = !DILocation(line: 524, column: 17, scope: !1112)
!1112 = distinct !DILexicalBlock(scope: !1107, file: !15, line: 524, column: 9)
!1113 = !DILocation(line: 524, column: 9, scope: !1112)
!1114 = !DILocation(line: 524, column: 20, scope: !1112)
!1115 = !DILocation(line: 524, column: 25, scope: !1112)
!1116 = !DILocation(line: 527, column: 27, scope: !1117)
!1117 = distinct !DILexicalBlock(scope: !1112, file: !15, line: 527, column: 10)
!1118 = !DILocation(line: 527, column: 19, scope: !1117)
!1119 = !DILocation(line: 527, column: 30, scope: !1117)
!1120 = !DILocation(line: 527, column: 45, scope: !1117)
!1121 = !DILocation(line: 527, column: 18, scope: !1117)
!1122 = !DILocation(line: 527, column: 10, scope: !1117)
!1123 = !DILocation(line: 527, column: 56, scope: !1117)
!1124 = !DILocation(line: 527, column: 53, scope: !1117)
!1125 = !DILocation(line: 528, column: 12, scope: !1117)
!1126 = !DILocation(line: 528, column: 7, scope: !1117)
!1127 = !DILocation(line: 524, column: 28, scope: !1112)
!1128 = !DILocation(line: 523, column: 44, scope: !1107)
!1129 = !DILocation(line: 523, column: 4, scope: !1107)
!1130 = distinct !{!1130, !1110, !1131, !363}
!1131 = !DILocation(line: 528, column: 12, scope: !1104)
!1132 = !DILocation(line: 529, column: 8, scope: !1133)
!1133 = distinct !DILexicalBlock(scope: !1093, file: !15, line: 529, column: 8)
!1134 = !DILocation(line: 529, column: 16, scope: !1133)
!1135 = !DILocation(line: 529, column: 33, scope: !1133)
!1136 = !DILocation(line: 529, column: 14, scope: !1133)
!1137 = !DILocation(line: 531, column: 5, scope: !1138)
!1138 = distinct !DILexicalBlock(scope: !1133, file: !15, line: 530, column: 4)
!1139 = !DILocation(line: 532, column: 5, scope: !1138)
!1140 = !DILocation(line: 532, column: 15, scope: !1138)
!1141 = !DILocation(line: 532, column: 21, scope: !1138)
!1142 = !DILocation(line: 533, column: 5, scope: !1138)
!1143 = !DILocation(line: 537, column: 10, scope: !1093)
!1144 = !DILocation(line: 538, column: 13, scope: !1093)
!1145 = !DILocation(line: 538, column: 23, scope: !1093)
!1146 = !DILocation(line: 538, column: 11, scope: !1093)
!1147 = !DILocation(line: 539, column: 27, scope: !1148)
!1148 = distinct !DILexicalBlock(scope: !1093, file: !15, line: 539, column: 4)
!1149 = !DILocation(line: 539, column: 18, scope: !1148)
!1150 = !DILocation(line: 539, column: 35, scope: !1148)
!1151 = !DILocation(line: 539, column: 16, scope: !1148)
!1152 = !DILocation(line: 539, column: 9, scope: !1148)
!1153 = !DILocation(line: 539, column: 44, scope: !1154)
!1154 = distinct !DILexicalBlock(scope: !1148, file: !15, line: 539, column: 4)
!1155 = !DILocation(line: 539, column: 51, scope: !1154)
!1156 = !DILocation(line: 539, column: 4, scope: !1148)
!1157 = !DILocation(line: 541, column: 10, scope: !1158)
!1158 = distinct !DILexicalBlock(scope: !1154, file: !15, line: 540, column: 4)
!1159 = !DILocation(line: 542, column: 9, scope: !1160)
!1160 = distinct !DILexicalBlock(scope: !1158, file: !15, line: 542, column: 9)
!1161 = !DILocation(line: 542, column: 15, scope: !1160)
!1162 = !DILocation(line: 544, column: 6, scope: !1163)
!1163 = distinct !DILexicalBlock(scope: !1160, file: !15, line: 543, column: 5)
!1164 = !DILocation(line: 545, column: 6, scope: !1163)
!1165 = !DILocation(line: 546, column: 6, scope: !1163)
!1166 = !DILocation(line: 548, column: 17, scope: !1167)
!1167 = distinct !DILexicalBlock(scope: !1158, file: !15, line: 548, column: 9)
!1168 = !DILocation(line: 548, column: 9, scope: !1167)
!1169 = !DILocation(line: 548, column: 25, scope: !1167)
!1170 = !DILocation(line: 548, column: 30, scope: !1167)
!1171 = !DILocation(line: 550, column: 56, scope: !1172)
!1172 = distinct !DILexicalBlock(scope: !1167, file: !15, line: 549, column: 5)
!1173 = !DILocation(line: 550, column: 48, scope: !1172)
!1174 = !DILocation(line: 550, column: 6, scope: !1172)
!1175 = !DILocation(line: 551, column: 24, scope: !1172)
!1176 = !DILocation(line: 551, column: 33, scope: !1172)
!1177 = !DILocation(line: 551, column: 6, scope: !1172)
!1178 = !DILocation(line: 551, column: 16, scope: !1172)
!1179 = !DILocation(line: 551, column: 22, scope: !1172)
!1180 = !DILocation(line: 552, column: 6, scope: !1172)
!1181 = !DILocation(line: 554, column: 22, scope: !1182)
!1182 = distinct !DILexicalBlock(scope: !1167, file: !15, line: 554, column: 14)
!1183 = !DILocation(line: 554, column: 14, scope: !1182)
!1184 = !DILocation(line: 554, column: 30, scope: !1182)
!1185 = !DILocation(line: 554, column: 35, scope: !1182)
!1186 = !DILocation(line: 556, column: 57, scope: !1187)
!1187 = distinct !DILexicalBlock(scope: !1182, file: !15, line: 555, column: 5)
!1188 = !DILocation(line: 556, column: 49, scope: !1187)
!1189 = !DILocation(line: 556, column: 6, scope: !1187)
!1190 = !DILocation(line: 557, column: 24, scope: !1187)
!1191 = !DILocation(line: 557, column: 33, scope: !1187)
!1192 = !DILocation(line: 557, column: 6, scope: !1187)
!1193 = !DILocation(line: 557, column: 16, scope: !1187)
!1194 = !DILocation(line: 557, column: 22, scope: !1187)
!1195 = !DILocation(line: 558, column: 6, scope: !1187)
!1196 = !DILocation(line: 560, column: 4, scope: !1158)
!1197 = !DILocation(line: 539, column: 75, scope: !1154)
!1198 = !DILocation(line: 539, column: 67, scope: !1154)
!1199 = !DILocation(line: 539, column: 83, scope: !1154)
!1200 = !DILocation(line: 539, column: 65, scope: !1154)
!1201 = !DILocation(line: 539, column: 4, scope: !1154)
!1202 = distinct !{!1202, !1156, !1203, !363}
!1203 = !DILocation(line: 560, column: 4, scope: !1148)
!1204 = !DILocation(line: 562, column: 54, scope: !1093)
!1205 = !DILocation(line: 562, column: 64, scope: !1093)
!1206 = !DILocation(line: 562, column: 45, scope: !1093)
!1207 = !DILocation(line: 562, column: 4, scope: !1093)
!1208 = !DILocation(line: 564, column: 34, scope: !1093)
!1209 = !DILocation(line: 564, column: 44, scope: !1093)
!1210 = !DILocation(line: 564, column: 69, scope: !1093)
!1211 = !DILocation(line: 564, column: 10, scope: !1093)
!1212 = !DILocation(line: 564, column: 8, scope: !1093)
!1213 = !DILocation(line: 566, column: 8, scope: !1214)
!1214 = distinct !DILexicalBlock(scope: !1093, file: !15, line: 566, column: 8)
!1215 = !DILocation(line: 567, column: 34, scope: !1214)
!1216 = !DILocation(line: 567, column: 39, scope: !1214)
!1217 = !DILocation(line: 567, column: 57, scope: !1214)
!1218 = !DILocation(line: 567, column: 67, scope: !1214)
!1219 = !DILocation(line: 567, column: 48, scope: !1214)
!1220 = !DILocation(line: 567, column: 5, scope: !1214)
!1221 = !DILocation(line: 569, column: 36, scope: !1222)
!1222 = distinct !DILexicalBlock(scope: !1093, file: !15, line: 569, column: 8)
!1223 = !DILocation(line: 569, column: 8, scope: !1222)
!1224 = !DILocation(line: 569, column: 46, scope: !1222)
!1225 = !DILocation(line: 571, column: 56, scope: !1226)
!1226 = distinct !DILexicalBlock(scope: !1222, file: !15, line: 570, column: 4)
!1227 = !DILocation(line: 571, column: 28, scope: !1226)
!1228 = !DILocation(line: 571, column: 67, scope: !1226)
!1229 = !DILocation(line: 571, column: 77, scope: !1226)
!1230 = !DILocation(line: 571, column: 5, scope: !1226)
!1231 = !DILocation(line: 572, column: 4, scope: !1226)
!1232 = !DILocation(line: 573, column: 4, scope: !1093)
!1233 = !DILocation(line: 573, column: 14, scope: !1093)
!1234 = !DILocation(line: 573, column: 19, scope: !1093)
!1235 = !DILocation(line: 574, column: 4, scope: !1093)
!1236 = !DILocation(line: 574, column: 14, scope: !1093)
!1237 = !DILocation(line: 574, column: 20, scope: !1093)
!1238 = !DILocation(line: 576, column: 3, scope: !1093)
!1239 = !DILocation(line: 577, column: 3, scope: !1050)
!1240 = !DILocation(line: 579, column: 7, scope: !1241)
!1241 = distinct !DILexicalBlock(scope: !1050, file: !15, line: 579, column: 7)
!1242 = !DILocation(line: 579, column: 17, scope: !1241)
!1243 = !DILocation(line: 579, column: 54, scope: !1241)
!1244 = !DILocation(line: 579, column: 64, scope: !1241)
!1245 = !DILocation(line: 579, column: 23, scope: !1241)
!1246 = !DILocation(line: 581, column: 26, scope: !1247)
!1247 = distinct !DILexicalBlock(scope: !1241, file: !15, line: 579, column: 70)
!1248 = !DILocation(line: 581, column: 4, scope: !1247)
!1249 = !DILocation(line: 581, column: 14, scope: !1247)
!1250 = !DILocation(line: 581, column: 23, scope: !1247)
!1251 = !DILocation(line: 582, column: 4, scope: !1247)
!1252 = !DILocation(line: 582, column: 14, scope: !1247)
!1253 = !DILocation(line: 582, column: 19, scope: !1247)
!1254 = !DILocation(line: 584, column: 4, scope: !1247)
!1255 = !DILocation(line: 584, column: 14, scope: !1247)
!1256 = !DILocation(line: 584, column: 20, scope: !1247)
!1257 = !DILocation(line: 585, column: 54, scope: !1247)
!1258 = !DILocation(line: 585, column: 64, scope: !1247)
!1259 = !DILocation(line: 585, column: 45, scope: !1247)
!1260 = !DILocation(line: 585, column: 4, scope: !1247)
!1261 = !DILocation(line: 588, column: 21, scope: !1262)
!1262 = distinct !DILexicalBlock(scope: !1247, file: !15, line: 588, column: 8)
!1263 = !DILocation(line: 588, column: 8, scope: !1262)
!1264 = !DILocation(line: 588, column: 33, scope: !1262)
!1265 = !DILocation(line: 588, column: 48, scope: !1262)
!1266 = !DILocation(line: 588, column: 53, scope: !1262)
!1267 = !DILocation(line: 588, column: 69, scope: !1262)
!1268 = !DILocation(line: 588, column: 56, scope: !1262)
!1269 = !DILocation(line: 588, column: 81, scope: !1262)
!1270 = !DILocation(line: 588, column: 96, scope: !1262)
!1271 = !DILocalVariable(name: "type", scope: !1272, file: !15, line: 589, type: !5)
!1272 = distinct !DILexicalBlock(scope: !1262, file: !15, line: 588, column: 102)
!1273 = !DILocation(line: 589, column: 9, scope: !1272)
!1274 = !DILocalVariable(name: "flags", scope: !1272, file: !15, line: 590, type: !257)
!1275 = !DILocation(line: 590, column: 14, scope: !1272)
!1276 = !DILocalVariable(name: "legal_types", scope: !1272, file: !15, line: 591, type: !1277)
!1277 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 512, elements: !1278)
!1278 = !{!1279}
!1279 = !DISubrange(count: 64)
!1280 = !DILocation(line: 591, column: 12, scope: !1272)
!1281 = !DILocalVariable(name: "num_types", scope: !1272, file: !15, line: 592, type: !5)
!1282 = !DILocation(line: 592, column: 9, scope: !1272)
!1283 = !DILocalVariable(name: "robot_index", scope: !1272, file: !15, line: 592, type: !5)
!1284 = !DILocation(line: 592, column: 20, scope: !1272)
!1285 = !DILocalVariable(name: "i", scope: !1272, file: !15, line: 592, type: !5)
!1286 = !DILocation(line: 592, column: 33, scope: !1272)
!1287 = !DILocation(line: 594, column: 15, scope: !1272)
!1288 = !DILocation(line: 595, column: 12, scope: !1289)
!1289 = distinct !DILexicalBlock(scope: !1272, file: !15, line: 595, column: 5)
!1290 = !DILocation(line: 595, column: 10, scope: !1289)
!1291 = !DILocation(line: 595, column: 17, scope: !1292)
!1292 = distinct !DILexicalBlock(scope: !1289, file: !15, line: 595, column: 5)
!1293 = !DILocation(line: 595, column: 19, scope: !1292)
!1294 = !DILocation(line: 595, column: 5, scope: !1289)
!1295 = !DILocation(line: 596, column: 20, scope: !1296)
!1296 = distinct !DILexicalBlock(scope: !1292, file: !15, line: 595, column: 29)
!1297 = !DILocation(line: 596, column: 22, scope: !1296)
!1298 = !DILocation(line: 596, column: 18, scope: !1296)
!1299 = !DILocation(line: 597, column: 27, scope: !1296)
!1300 = !DILocation(line: 597, column: 14, scope: !1296)
!1301 = !DILocation(line: 597, column: 39, scope: !1296)
!1302 = !DILocation(line: 597, column: 51, scope: !1296)
!1303 = !DILocation(line: 597, column: 12, scope: !1296)
!1304 = !DILocation(line: 598, column: 6, scope: !1296)
!1305 = !DILocation(line: 598, column: 13, scope: !1296)
!1306 = !DILocation(line: 599, column: 11, scope: !1307)
!1307 = distinct !DILexicalBlock(scope: !1308, file: !15, line: 599, column: 11)
!1308 = distinct !DILexicalBlock(scope: !1296, file: !15, line: 598, column: 20)
!1309 = !DILocation(line: 599, column: 17, scope: !1307)
!1310 = !DILocation(line: 600, column: 35, scope: !1307)
!1311 = !DILocation(line: 600, column: 29, scope: !1307)
!1312 = !DILocation(line: 600, column: 8, scope: !1307)
!1313 = !DILocation(line: 600, column: 33, scope: !1307)
!1314 = !DILocation(line: 601, column: 13, scope: !1308)
!1315 = !DILocation(line: 602, column: 18, scope: !1308)
!1316 = distinct !{!1316, !1304, !1317, !363}
!1317 = !DILocation(line: 603, column: 6, scope: !1296)
!1318 = !DILocation(line: 604, column: 5, scope: !1296)
!1319 = !DILocation(line: 595, column: 25, scope: !1292)
!1320 = !DILocation(line: 595, column: 5, scope: !1292)
!1321 = distinct !{!1321, !1294, !1322, !363}
!1322 = !DILocation(line: 604, column: 5, scope: !1289)
!1323 = !DILocation(line: 611, column: 9, scope: !1324)
!1324 = distinct !DILexicalBlock(scope: !1272, file: !15, line: 611, column: 9)
!1325 = !DILocation(line: 611, column: 19, scope: !1324)
!1326 = !DILocation(line: 612, column: 13, scope: !1324)
!1327 = !DILocation(line: 612, column: 11, scope: !1324)
!1328 = !DILocation(line: 612, column: 6, scope: !1324)
!1329 = !DILocation(line: 614, column: 26, scope: !1324)
!1330 = !DILocation(line: 614, column: 37, scope: !1324)
!1331 = !DILocation(line: 614, column: 35, scope: !1324)
!1332 = !DILocation(line: 614, column: 48, scope: !1324)
!1333 = !DILocation(line: 614, column: 13, scope: !1324)
!1334 = !DILocation(line: 614, column: 11, scope: !1324)
!1335 = !DILocation(line: 616, column: 5, scope: !1272)
!1336 = !DILocation(line: 617, column: 40, scope: !1272)
!1337 = !DILocation(line: 617, column: 50, scope: !1272)
!1338 = !DILocation(line: 617, column: 31, scope: !1272)
!1339 = !DILocation(line: 617, column: 76, scope: !1272)
!1340 = !DILocation(line: 617, column: 11, scope: !1272)
!1341 = !DILocation(line: 617, column: 9, scope: !1272)
!1342 = !DILocation(line: 618, column: 9, scope: !1343)
!1343 = distinct !DILexicalBlock(scope: !1272, file: !15, line: 618, column: 9)
!1344 = !DILocation(line: 618, column: 13, scope: !1343)
!1345 = !DILocation(line: 625, column: 28, scope: !1346)
!1346 = distinct !DILexicalBlock(scope: !1343, file: !15, line: 618, column: 22)
!1347 = !DILocation(line: 625, column: 37, scope: !1346)
!1348 = !DILocation(line: 625, column: 47, scope: !1346)
!1349 = !DILocation(line: 625, column: 6, scope: !1346)
!1350 = !DILocation(line: 625, column: 11, scope: !1346)
!1351 = !DILocation(line: 625, column: 26, scope: !1346)
!1352 = !DILocation(line: 628, column: 30, scope: !1346)
!1353 = !DILocation(line: 628, column: 45, scope: !1346)
!1354 = !DILocation(line: 628, column: 51, scope: !1346)
!1355 = !DILocation(line: 628, column: 56, scope: !1346)
!1356 = !DILocation(line: 628, column: 6, scope: !1346)
!1357 = !DILocation(line: 629, column: 26, scope: !1346)
!1358 = !DILocation(line: 629, column: 31, scope: !1346)
!1359 = !DILocation(line: 629, column: 52, scope: !1346)
!1360 = !DILocation(line: 629, column: 57, scope: !1346)
!1361 = !DILocation(line: 629, column: 64, scope: !1346)
!1362 = !DILocation(line: 629, column: 6, scope: !1346)
!1363 = !DILocation(line: 631, column: 18, scope: !1346)
!1364 = !DILocation(line: 631, column: 6, scope: !1346)
!1365 = !DILocation(line: 634, column: 5, scope: !1346)
!1366 = !DILocation(line: 636, column: 6, scope: !1343)
!1367 = !DILocation(line: 638, column: 4, scope: !1272)
!1368 = !DILocation(line: 640, column: 3, scope: !1247)
!1369 = !DILocation(line: 641, column: 3, scope: !1050)
!1370 = !DILocation(line: 643, column: 3, scope: !1050)
!1371 = !DILocation(line: 643, column: 13, scope: !1050)
!1372 = !DILocation(line: 643, column: 18, scope: !1050)
!1373 = !DILocation(line: 644, column: 3, scope: !1050)
!1374 = !DILocation(line: 644, column: 13, scope: !1050)
!1375 = !DILocation(line: 644, column: 19, scope: !1050)
!1376 = !DILocation(line: 645, column: 2, scope: !1050)
!1377 = !DILocation(line: 646, column: 1, scope: !942)
!1378 = distinct !DISubprogram(name: "fuelcen_update_all", linkageName: "_Z18fuelcen_update_allv", scope: !15, file: !15, line: 653, type: !343, scopeLine: 654, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !213)
!1379 = !DILocalVariable(name: "i", scope: !1378, file: !15, line: 655, type: !5)
!1380 = !DILocation(line: 655, column: 6, scope: !1378)
!1381 = !DILocalVariable(name: "AmountToreplenish", scope: !1378, file: !15, line: 656, type: !16)
!1382 = !DILocation(line: 656, column: 6, scope: !1378)
!1383 = !DILocation(line: 658, column: 29, scope: !1378)
!1384 = !DILocation(line: 658, column: 40, scope: !1378)
!1385 = !DILocation(line: 658, column: 22, scope: !1378)
!1386 = !DILocation(line: 658, column: 20, scope: !1378)
!1387 = !DILocation(line: 660, column: 9, scope: !1388)
!1388 = distinct !DILexicalBlock(scope: !1378, file: !15, line: 660, column: 2)
!1389 = !DILocation(line: 660, column: 7, scope: !1388)
!1390 = !DILocation(line: 660, column: 14, scope: !1391)
!1391 = distinct !DILexicalBlock(scope: !1388, file: !15, line: 660, column: 2)
!1392 = !DILocation(line: 660, column: 18, scope: !1391)
!1393 = !DILocation(line: 660, column: 16, scope: !1391)
!1394 = !DILocation(line: 660, column: 2, scope: !1388)
!1395 = !DILocation(line: 661, column: 15, scope: !1396)
!1396 = distinct !DILexicalBlock(scope: !1397, file: !15, line: 661, column: 7)
!1397 = distinct !DILexicalBlock(scope: !1391, file: !15, line: 660, column: 40)
!1398 = !DILocation(line: 661, column: 7, scope: !1396)
!1399 = !DILocation(line: 661, column: 18, scope: !1396)
!1400 = !DILocation(line: 661, column: 23, scope: !1396)
!1401 = !DILocation(line: 662, column: 10, scope: !1402)
!1402 = distinct !DILexicalBlock(scope: !1403, file: !15, line: 662, column: 8)
!1403 = distinct !DILexicalBlock(scope: !1396, file: !15, line: 661, column: 49)
!1404 = !DILocation(line: 662, column: 25, scope: !1402)
!1405 = !DILocation(line: 662, column: 9, scope: !1402)
!1406 = !DILocation(line: 662, column: 8, scope: !1402)
!1407 = !DILocation(line: 663, column: 30, scope: !1402)
!1408 = !DILocation(line: 663, column: 22, scope: !1402)
!1409 = !DILocation(line: 663, column: 5, scope: !1402)
!1410 = !DILocation(line: 664, column: 3, scope: !1403)
!1411 = !DILocation(line: 665, column: 20, scope: !1412)
!1412 = distinct !DILexicalBlock(scope: !1396, file: !15, line: 665, column: 12)
!1413 = !DILocation(line: 665, column: 12, scope: !1412)
!1414 = !DILocation(line: 665, column: 23, scope: !1412)
!1415 = !DILocation(line: 665, column: 28, scope: !1412)
!1416 = !DILocation(line: 668, column: 3, scope: !1417)
!1417 = distinct !DILexicalBlock(scope: !1412, file: !15, line: 665, column: 54)
!1418 = !DILocation(line: 669, column: 21, scope: !1419)
!1419 = distinct !DILexicalBlock(scope: !1412, file: !15, line: 669, column: 12)
!1420 = !DILocation(line: 669, column: 13, scope: !1419)
!1421 = !DILocation(line: 669, column: 24, scope: !1419)
!1422 = !DILocation(line: 669, column: 36, scope: !1419)
!1423 = !DILocation(line: 669, column: 41, scope: !1419)
!1424 = !DILocation(line: 669, column: 45, scope: !1419)
!1425 = !DILocation(line: 669, column: 80, scope: !1419)
!1426 = !DILocation(line: 669, column: 72, scope: !1419)
!1427 = !DILocation(line: 669, column: 83, scope: !1419)
!1428 = !DILocation(line: 669, column: 63, scope: !1419)
!1429 = !DILocation(line: 669, column: 59, scope: !1419)
!1430 = !DILocation(line: 670, column: 16, scope: !1431)
!1431 = distinct !DILexicalBlock(scope: !1432, file: !15, line: 670, column: 8)
!1432 = distinct !DILexicalBlock(scope: !1419, file: !15, line: 669, column: 93)
!1433 = !DILocation(line: 670, column: 8, scope: !1431)
!1434 = !DILocation(line: 670, column: 19, scope: !1431)
!1435 = !DILocation(line: 670, column: 38, scope: !1431)
!1436 = !DILocation(line: 670, column: 30, scope: !1431)
!1437 = !DILocation(line: 670, column: 41, scope: !1431)
!1438 = !DILocation(line: 670, column: 28, scope: !1431)
!1439 = !DILocation(line: 671, column: 28, scope: !1440)
!1440 = distinct !DILexicalBlock(scope: !1431, file: !15, line: 670, column: 54)
!1441 = !DILocation(line: 671, column: 13, scope: !1440)
!1442 = !DILocation(line: 671, column: 5, scope: !1440)
!1443 = !DILocation(line: 671, column: 16, scope: !1440)
!1444 = !DILocation(line: 671, column: 25, scope: !1440)
!1445 = !DILocation(line: 673, column: 17, scope: !1446)
!1446 = distinct !DILexicalBlock(scope: !1440, file: !15, line: 673, column: 9)
!1447 = !DILocation(line: 673, column: 9, scope: !1446)
!1448 = !DILocation(line: 673, column: 20, scope: !1446)
!1449 = !DILocation(line: 673, column: 40, scope: !1446)
!1450 = !DILocation(line: 673, column: 32, scope: !1446)
!1451 = !DILocation(line: 673, column: 43, scope: !1446)
!1452 = !DILocation(line: 673, column: 29, scope: !1446)
!1453 = !DILocation(line: 674, column: 36, scope: !1454)
!1454 = distinct !DILexicalBlock(scope: !1446, file: !15, line: 673, column: 56)
!1455 = !DILocation(line: 674, column: 28, scope: !1454)
!1456 = !DILocation(line: 674, column: 39, scope: !1454)
!1457 = !DILocation(line: 674, column: 14, scope: !1454)
!1458 = !DILocation(line: 674, column: 6, scope: !1454)
!1459 = !DILocation(line: 674, column: 17, scope: !1454)
!1460 = !DILocation(line: 674, column: 26, scope: !1454)
!1461 = !DILocation(line: 676, column: 5, scope: !1454)
!1462 = !DILocation(line: 677, column: 4, scope: !1440)
!1463 = !DILocation(line: 678, column: 3, scope: !1432)
!1464 = !DILocation(line: 679, column: 2, scope: !1397)
!1465 = !DILocation(line: 660, column: 36, scope: !1391)
!1466 = !DILocation(line: 660, column: 2, scope: !1391)
!1467 = distinct !{!1467, !1394, !1468, !363}
!1468 = !DILocation(line: 679, column: 2, scope: !1388)
!1469 = !DILocation(line: 680, column: 1, scope: !1378)
!1470 = distinct !DISubprogram(name: "fixmul", linkageName: "_Z6fixmulii", scope: !17, file: !17, line: 83, type: !1471, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !213)
!1471 = !DISubroutineType(types: !1472)
!1472 = !{!16, !16, !16}
!1473 = !DILocalVariable(name: "a", arg: 1, scope: !1470, file: !17, line: 83, type: !16)
!1474 = !DILocation(line: 83, column: 26, scope: !1470)
!1475 = !DILocalVariable(name: "b", arg: 2, scope: !1470, file: !17, line: 83, type: !16)
!1476 = !DILocation(line: 83, column: 33, scope: !1470)
!1477 = !DILocation(line: 85, column: 19, scope: !1470)
!1478 = !DILocation(line: 85, column: 32, scope: !1470)
!1479 = !DILocation(line: 85, column: 21, scope: !1470)
!1480 = !DILocation(line: 85, column: 35, scope: !1470)
!1481 = !DILocation(line: 85, column: 9, scope: !1470)
!1482 = !DILocation(line: 85, column: 2, scope: !1470)
!1483 = !DILocalVariable(name: "segp", arg: 1, scope: !210, file: !15, line: 698, type: !74)
!1484 = !DILocation(line: 698, column: 32, scope: !210)
!1485 = !DILocalVariable(name: "MaxAmountCanTake", arg: 2, scope: !210, file: !15, line: 698, type: !16)
!1486 = !DILocation(line: 698, column: 42, scope: !210)
!1487 = !DILocalVariable(name: "seg2p", scope: !210, file: !15, line: 700, type: !409)
!1488 = !DILocation(line: 700, column: 12, scope: !210)
!1489 = !DILocation(line: 700, column: 31, scope: !210)
!1490 = !DILocation(line: 700, column: 36, scope: !210)
!1491 = !DILocation(line: 700, column: 21, scope: !210)
!1492 = !DILocation(line: 704, column: 2, scope: !210)
!1493 = !DILocation(line: 706, column: 18, scope: !210)
!1494 = !DILocation(line: 706, column: 16, scope: !210)
!1495 = !DILocation(line: 708, column: 7, scope: !1496)
!1496 = distinct !DILexicalBlock(scope: !210, file: !15, line: 708, column: 6)
!1497 = !DILocation(line: 708, column: 6, scope: !1496)
!1498 = !DILocation(line: 708, column: 13, scope: !1496)
!1499 = !DILocation(line: 708, column: 17, scope: !1496)
!1500 = !DILocation(line: 708, column: 24, scope: !1496)
!1501 = !DILocation(line: 708, column: 32, scope: !1496)
!1502 = !DILocalVariable(name: "amount", scope: !1503, file: !15, line: 709, type: !16)
!1503 = distinct !DILexicalBlock(scope: !1496, file: !15, line: 708, column: 56)
!1504 = !DILocation(line: 709, column: 7, scope: !1503)
!1505 = !DILocation(line: 711, column: 3, scope: !1503)
!1506 = !DILocation(line: 723, column: 7, scope: !1507)
!1507 = distinct !DILexicalBlock(scope: !1503, file: !15, line: 723, column: 7)
!1508 = !DILocation(line: 723, column: 24, scope: !1507)
!1509 = !DILocation(line: 725, column: 4, scope: !1510)
!1510 = distinct !DILexicalBlock(scope: !1507, file: !15, line: 723, column: 30)
!1511 = !DILocation(line: 728, column: 19, scope: !1503)
!1512 = !DILocation(line: 728, column: 30, scope: !1503)
!1513 = !DILocation(line: 728, column: 12, scope: !1503)
!1514 = !DILocation(line: 728, column: 10, scope: !1503)
!1515 = !DILocation(line: 730, column: 7, scope: !1516)
!1516 = distinct !DILexicalBlock(scope: !1503, file: !15, line: 730, column: 7)
!1517 = !DILocation(line: 730, column: 16, scope: !1516)
!1518 = !DILocation(line: 730, column: 14, scope: !1516)
!1519 = !DILocation(line: 731, column: 13, scope: !1516)
!1520 = !DILocation(line: 731, column: 11, scope: !1516)
!1521 = !DILocation(line: 731, column: 4, scope: !1516)
!1522 = !DILocation(line: 741, column: 7, scope: !1523)
!1523 = distinct !DILexicalBlock(scope: !1503, file: !15, line: 741, column: 7)
!1524 = !DILocation(line: 741, column: 24, scope: !1523)
!1525 = !DILocation(line: 741, column: 22, scope: !1523)
!1526 = !DILocation(line: 742, column: 19, scope: !1523)
!1527 = !DILocation(line: 742, column: 4, scope: !1523)
!1528 = !DILocation(line: 744, column: 7, scope: !1529)
!1529 = distinct !DILexicalBlock(scope: !1503, file: !15, line: 744, column: 7)
!1530 = !DILocation(line: 744, column: 18, scope: !1529)
!1531 = !DILocation(line: 744, column: 33, scope: !1529)
!1532 = !DILocation(line: 744, column: 16, scope: !1529)
!1533 = !DILocation(line: 746, column: 4, scope: !1534)
!1534 = distinct !DILexicalBlock(scope: !1529, file: !15, line: 744, column: 56)
!1535 = !DILocation(line: 752, column: 21, scope: !1534)
!1536 = !DILocation(line: 752, column: 19, scope: !1534)
!1537 = !DILocation(line: 753, column: 3, scope: !1534)
!1538 = !DILocation(line: 757, column: 10, scope: !1503)
!1539 = !DILocation(line: 757, column: 3, scope: !1503)
!1540 = !DILocation(line: 761, column: 3, scope: !1541)
!1541 = distinct !DILexicalBlock(scope: !1496, file: !15, line: 760, column: 7)
!1542 = !DILocation(line: 763, column: 1, scope: !210)
!1543 = distinct !DISubprogram(name: "disable_matcens", linkageName: "_Z15disable_matcensv", scope: !15, file: !15, line: 1093, type: !343, scopeLine: 1094, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !213)
!1544 = !DILocalVariable(name: "i", scope: !1543, file: !15, line: 1095, type: !5)
!1545 = !DILocation(line: 1095, column: 6, scope: !1543)
!1546 = !DILocation(line: 1097, column: 9, scope: !1547)
!1547 = distinct !DILexicalBlock(scope: !1543, file: !15, line: 1097, column: 2)
!1548 = !DILocation(line: 1097, column: 7, scope: !1547)
!1549 = !DILocation(line: 1097, column: 14, scope: !1550)
!1550 = distinct !DILexicalBlock(scope: !1547, file: !15, line: 1097, column: 2)
!1551 = !DILocation(line: 1097, column: 18, scope: !1550)
!1552 = !DILocation(line: 1097, column: 16, scope: !1550)
!1553 = !DILocation(line: 1097, column: 2, scope: !1547)
!1554 = !DILocation(line: 1098, column: 11, scope: !1555)
!1555 = distinct !DILexicalBlock(scope: !1550, file: !15, line: 1097, column: 42)
!1556 = !DILocation(line: 1098, column: 3, scope: !1555)
!1557 = !DILocation(line: 1098, column: 14, scope: !1555)
!1558 = !DILocation(line: 1098, column: 22, scope: !1555)
!1559 = !DILocation(line: 1099, column: 11, scope: !1555)
!1560 = !DILocation(line: 1099, column: 3, scope: !1555)
!1561 = !DILocation(line: 1099, column: 14, scope: !1555)
!1562 = !DILocation(line: 1099, column: 27, scope: !1555)
!1563 = !DILocation(line: 1100, column: 2, scope: !1555)
!1564 = !DILocation(line: 1097, column: 38, scope: !1550)
!1565 = !DILocation(line: 1097, column: 2, scope: !1550)
!1566 = distinct !{!1566, !1553, !1567, !363}
!1567 = !DILocation(line: 1100, column: 2, scope: !1547)
!1568 = !DILocation(line: 1101, column: 1, scope: !1543)
!1569 = distinct !DISubprogram(name: "init_all_matcens", linkageName: "_Z16init_all_matcensv", scope: !15, file: !15, line: 1106, type: !343, scopeLine: 1107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !213)
!1570 = !DILocalVariable(name: "i", scope: !1569, file: !15, line: 1108, type: !5)
!1571 = !DILocation(line: 1108, column: 6, scope: !1569)
!1572 = !DILocation(line: 1110, column: 9, scope: !1573)
!1573 = distinct !DILexicalBlock(scope: !1569, file: !15, line: 1110, column: 2)
!1574 = !DILocation(line: 1110, column: 7, scope: !1573)
!1575 = !DILocation(line: 1110, column: 14, scope: !1576)
!1576 = distinct !DILexicalBlock(scope: !1573, file: !15, line: 1110, column: 2)
!1577 = !DILocation(line: 1110, column: 18, scope: !1576)
!1578 = !DILocation(line: 1110, column: 16, scope: !1576)
!1579 = !DILocation(line: 1110, column: 2, scope: !1573)
!1580 = !DILocation(line: 1111, column: 15, scope: !1581)
!1581 = distinct !DILexicalBlock(scope: !1576, file: !15, line: 1111, column: 7)
!1582 = !DILocation(line: 1111, column: 7, scope: !1581)
!1583 = !DILocation(line: 1111, column: 18, scope: !1581)
!1584 = !DILocation(line: 1111, column: 23, scope: !1581)
!1585 = !DILocation(line: 1112, column: 12, scope: !1586)
!1586 = distinct !DILexicalBlock(scope: !1581, file: !15, line: 1111, column: 49)
!1587 = !DILocation(line: 1112, column: 4, scope: !1586)
!1588 = !DILocation(line: 1112, column: 15, scope: !1586)
!1589 = !DILocation(line: 1112, column: 21, scope: !1586)
!1590 = !DILocation(line: 1113, column: 12, scope: !1586)
!1591 = !DILocation(line: 1113, column: 4, scope: !1586)
!1592 = !DILocation(line: 1113, column: 15, scope: !1586)
!1593 = !DILocation(line: 1113, column: 23, scope: !1586)
!1594 = !DILocation(line: 1114, column: 12, scope: !1586)
!1595 = !DILocation(line: 1114, column: 4, scope: !1586)
!1596 = !DILocation(line: 1114, column: 15, scope: !1586)
!1597 = !DILocation(line: 1114, column: 28, scope: !1586)
!1598 = !DILocalVariable(name: "j", scope: !1599, file: !15, line: 1118, type: !5)
!1599 = distinct !DILexicalBlock(scope: !1586, file: !15, line: 1116, column: 4)
!1600 = !DILocation(line: 1118, column: 9, scope: !1599)
!1601 = !DILocation(line: 1119, column: 12, scope: !1602)
!1602 = distinct !DILexicalBlock(scope: !1599, file: !15, line: 1119, column: 5)
!1603 = !DILocation(line: 1119, column: 10, scope: !1602)
!1604 = !DILocation(line: 1119, column: 17, scope: !1605)
!1605 = distinct !DILexicalBlock(scope: !1602, file: !15, line: 1119, column: 5)
!1606 = !DILocation(line: 1119, column: 21, scope: !1605)
!1607 = !DILocation(line: 1119, column: 19, scope: !1605)
!1608 = !DILocation(line: 1119, column: 5, scope: !1602)
!1609 = !DILocation(line: 1120, column: 23, scope: !1610)
!1610 = distinct !DILexicalBlock(scope: !1611, file: !15, line: 1120, column: 10)
!1611 = distinct !DILexicalBlock(scope: !1605, file: !15, line: 1119, column: 45)
!1612 = !DILocation(line: 1120, column: 10, scope: !1610)
!1613 = !DILocation(line: 1120, column: 26, scope: !1610)
!1614 = !DILocation(line: 1120, column: 41, scope: !1610)
!1615 = !DILocation(line: 1120, column: 38, scope: !1610)
!1616 = !DILocation(line: 1121, column: 7, scope: !1610)
!1617 = !DILocation(line: 1122, column: 5, scope: !1611)
!1618 = !DILocation(line: 1119, column: 41, scope: !1605)
!1619 = !DILocation(line: 1119, column: 5, scope: !1605)
!1620 = distinct !{!1620, !1608, !1621, !363}
!1621 = !DILocation(line: 1122, column: 5, scope: !1602)
!1622 = !DILocation(line: 1123, column: 5, scope: !1599)
!1623 = !DILocation(line: 1127, column: 3, scope: !1586)
!1624 = !DILocation(line: 1111, column: 26, scope: !1581)
!1625 = !DILocation(line: 1110, column: 36, scope: !1576)
!1626 = !DILocation(line: 1110, column: 2, scope: !1576)
!1627 = distinct !{!1627, !1579, !1628, !363}
!1628 = !DILocation(line: 1127, column: 3, scope: !1573)
!1629 = !DILocation(line: 1131, column: 9, scope: !1630)
!1630 = distinct !DILexicalBlock(scope: !1569, file: !15, line: 1131, column: 2)
!1631 = !DILocation(line: 1131, column: 7, scope: !1630)
!1632 = !DILocation(line: 1131, column: 14, scope: !1633)
!1633 = distinct !DILexicalBlock(scope: !1630, file: !15, line: 1131, column: 2)
!1634 = !DILocation(line: 1131, column: 18, scope: !1633)
!1635 = !DILocation(line: 1131, column: 16, scope: !1633)
!1636 = !DILocation(line: 1131, column: 2, scope: !1630)
!1637 = !DILocalVariable(name: "fuelcen_num", scope: !1638, file: !15, line: 1132, type: !5)
!1638 = distinct !DILexicalBlock(scope: !1633, file: !15, line: 1131, column: 42)
!1639 = !DILocation(line: 1132, column: 7, scope: !1638)
!1640 = !DILocation(line: 1132, column: 34, scope: !1638)
!1641 = !DILocation(line: 1132, column: 21, scope: !1638)
!1642 = !DILocation(line: 1132, column: 37, scope: !1638)
!1643 = !DILocation(line: 1134, column: 3, scope: !1638)
!1644 = !DILocation(line: 1135, column: 3, scope: !1638)
!1645 = !DILocation(line: 1136, column: 2, scope: !1638)
!1646 = !DILocation(line: 1131, column: 38, scope: !1633)
!1647 = !DILocation(line: 1131, column: 2, scope: !1633)
!1648 = distinct !{!1648, !1636, !1649, !363}
!1649 = !DILocation(line: 1136, column: 2, scope: !1630)
!1650 = !DILocation(line: 1139, column: 1, scope: !1569)
!1651 = distinct !DISubprogram(name: "fuelcen_check_for_goal", linkageName: "_Z22fuelcen_check_for_goalP7segment", scope: !15, file: !15, line: 1142, type: !399, scopeLine: 1143, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !213)
!1652 = !DILocalVariable(name: "segp", arg: 1, scope: !1651, file: !15, line: 1142, type: !74)
!1653 = !DILocation(line: 1142, column: 38, scope: !1651)
!1654 = !DILocalVariable(name: "seg2p", scope: !1651, file: !15, line: 1144, type: !409)
!1655 = !DILocation(line: 1144, column: 12, scope: !1651)
!1656 = !DILocation(line: 1144, column: 31, scope: !1651)
!1657 = !DILocation(line: 1144, column: 36, scope: !1651)
!1658 = !DILocation(line: 1144, column: 21, scope: !1651)
!1659 = !DILocation(line: 1146, column: 2, scope: !1651)
!1660 = !DILocation(line: 1147, column: 2, scope: !1651)
!1661 = !DILocation(line: 1149, column: 6, scope: !1662)
!1662 = distinct !DILexicalBlock(scope: !1651, file: !15, line: 1149, column: 6)
!1663 = !DILocation(line: 1149, column: 13, scope: !1662)
!1664 = !DILocation(line: 1149, column: 21, scope: !1662)
!1665 = !DILocation(line: 1161, column: 2, scope: !1666)
!1666 = distinct !DILexicalBlock(scope: !1662, file: !15, line: 1150, column: 2)
!1667 = !DILocation(line: 1162, column: 6, scope: !1668)
!1668 = distinct !DILexicalBlock(scope: !1651, file: !15, line: 1162, column: 6)
!1669 = !DILocation(line: 1162, column: 13, scope: !1668)
!1670 = !DILocation(line: 1162, column: 21, scope: !1668)
!1671 = !DILocation(line: 1173, column: 2, scope: !1672)
!1672 = distinct !DILexicalBlock(scope: !1668, file: !15, line: 1163, column: 2)
!1673 = !DILocation(line: 1174, column: 1, scope: !1651)
!1674 = distinct !DISubprogram(name: "fuelcen_check_for_hoard_goal", linkageName: "_Z28fuelcen_check_for_hoard_goalP7segment", scope: !15, file: !15, line: 1176, type: !399, scopeLine: 1177, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !213)
!1675 = !DILocalVariable(name: "segp", arg: 1, scope: !1674, file: !15, line: 1176, type: !74)
!1676 = !DILocation(line: 1176, column: 44, scope: !1674)
!1677 = !DILocalVariable(name: "seg2p", scope: !1674, file: !15, line: 1178, type: !409)
!1678 = !DILocation(line: 1178, column: 12, scope: !1674)
!1679 = !DILocation(line: 1178, column: 31, scope: !1674)
!1680 = !DILocation(line: 1178, column: 36, scope: !1674)
!1681 = !DILocation(line: 1178, column: 21, scope: !1674)
!1682 = !DILocation(line: 1180, column: 2, scope: !1674)
!1683 = !DILocation(line: 1181, column: 2, scope: !1674)
!1684 = !DILocation(line: 1183, column: 6, scope: !1685)
!1685 = distinct !DILexicalBlock(scope: !1674, file: !15, line: 1183, column: 6)
!1686 = !DILocation(line: 1184, column: 3, scope: !1685)
!1687 = !DILocation(line: 1186, column: 6, scope: !1688)
!1688 = distinct !DILexicalBlock(scope: !1674, file: !15, line: 1186, column: 6)
!1689 = !DILocation(line: 1186, column: 13, scope: !1688)
!1690 = !DILocation(line: 1186, column: 21, scope: !1688)
!1691 = !DILocation(line: 1186, column: 45, scope: !1688)
!1692 = !DILocation(line: 1186, column: 48, scope: !1688)
!1693 = !DILocation(line: 1186, column: 55, scope: !1688)
!1694 = !DILocation(line: 1186, column: 63, scope: !1688)
!1695 = !DILocation(line: 1197, column: 2, scope: !1696)
!1696 = distinct !DILexicalBlock(scope: !1688, file: !15, line: 1187, column: 2)
!1697 = !DILocation(line: 1199, column: 1, scope: !1674)
!1698 = distinct !DISubprogram(name: "read_matcen", linkageName: "_Z11read_matcenP11matcen_infoP7__sFILE", scope: !15, file: !15, line: 1204, type: !1699, scopeLine: 1205, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !213)
!1699 = !DISubroutineType(types: !1700)
!1700 = !{null, !1701, !1702}
!1701 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!1702 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1703, size: 64)
!1703 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !1704, line: 162, baseType: !1705)
!1704 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "d91ebd7d161d9196cc100822ef0e5cdf")
!1705 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILE", file: !1704, line: 131, size: 1216, flags: DIFlagTypePassByValue, elements: !1706, identifier: "_ZTS7__sFILE")
!1706 = !{!1707, !1709, !1710, !1711, !1712, !1713, !1718, !1719, !1721, !1725, !1730, !1738, !1743, !1744, !1747, !1748, !1752, !1756, !1757, !1758}
!1707 = !DIDerivedType(tag: DW_TAG_member, name: "_p", scope: !1705, file: !1704, line: 132, baseType: !1708, size: 64)
!1708 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!1709 = !DIDerivedType(tag: DW_TAG_member, name: "_r", scope: !1705, file: !1704, line: 133, baseType: !5, size: 32, offset: 64)
!1710 = !DIDerivedType(tag: DW_TAG_member, name: "_w", scope: !1705, file: !1704, line: 134, baseType: !5, size: 32, offset: 96)
!1711 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !1705, file: !1704, line: 135, baseType: !38, size: 16, offset: 128)
!1712 = !DIDerivedType(tag: DW_TAG_member, name: "_file", scope: !1705, file: !1704, line: 136, baseType: !38, size: 16, offset: 144)
!1713 = !DIDerivedType(tag: DW_TAG_member, name: "_bf", scope: !1705, file: !1704, line: 137, baseType: !1714, size: 128, offset: 192)
!1714 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sbuf", file: !1704, line: 97, size: 128, flags: DIFlagTypePassByValue, elements: !1715, identifier: "_ZTS6__sbuf")
!1715 = !{!1716, !1717}
!1716 = !DIDerivedType(tag: DW_TAG_member, name: "_base", scope: !1714, file: !1704, line: 98, baseType: !1708, size: 64)
!1717 = !DIDerivedType(tag: DW_TAG_member, name: "_size", scope: !1714, file: !1704, line: 99, baseType: !5, size: 32, offset: 64)
!1718 = !DIDerivedType(tag: DW_TAG_member, name: "_lbfsize", scope: !1705, file: !1704, line: 138, baseType: !5, size: 32, offset: 320)
!1719 = !DIDerivedType(tag: DW_TAG_member, name: "_cookie", scope: !1705, file: !1704, line: 141, baseType: !1720, size: 64, offset: 384)
!1720 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!1721 = !DIDerivedType(tag: DW_TAG_member, name: "_close", scope: !1705, file: !1704, line: 142, baseType: !1722, size: 64, offset: 448)
!1722 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1723, size: 64)
!1723 = !DISubroutineType(types: !1724)
!1724 = !{!5, !1720}
!1725 = !DIDerivedType(tag: DW_TAG_member, name: "_read", scope: !1705, file: !1704, line: 143, baseType: !1726, size: 64, offset: 512)
!1726 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1727, size: 64)
!1727 = !DISubroutineType(types: !1728)
!1728 = !{!5, !1720, !1729, !5}
!1729 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !117, size: 64)
!1730 = !DIDerivedType(tag: DW_TAG_member, name: "_seek", scope: !1705, file: !1704, line: 144, baseType: !1731, size: 64, offset: 576)
!1731 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1732, size: 64)
!1732 = !DISubroutineType(types: !1733)
!1733 = !{!1734, !1720, !1734, !5}
!1734 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !1704, line: 86, baseType: !1735)
!1735 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_off_t", file: !1736, line: 83, baseType: !1737)
!1736 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "af82ff6119a9fa80fad635d276556d46")
!1737 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !301, line: 37, baseType: !11)
!1738 = !DIDerivedType(tag: DW_TAG_member, name: "_write", scope: !1705, file: !1704, line: 145, baseType: !1739, size: 64, offset: 640)
!1739 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1740, size: 64)
!1740 = !DISubroutineType(types: !1741)
!1741 = !{!5, !1720, !1742, !5}
!1742 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !116, size: 64)
!1743 = !DIDerivedType(tag: DW_TAG_member, name: "_ub", scope: !1705, file: !1704, line: 148, baseType: !1714, size: 128, offset: 704)
!1744 = !DIDerivedType(tag: DW_TAG_member, name: "_extra", scope: !1705, file: !1704, line: 149, baseType: !1745, size: 64, offset: 832)
!1745 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1746, size: 64)
!1746 = !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILEX", file: !1704, line: 103, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS8__sFILEX")
!1747 = !DIDerivedType(tag: DW_TAG_member, name: "_ur", scope: !1705, file: !1704, line: 150, baseType: !5, size: 32, offset: 896)
!1748 = !DIDerivedType(tag: DW_TAG_member, name: "_ubuf", scope: !1705, file: !1704, line: 153, baseType: !1749, size: 24, offset: 928)
!1749 = !DICompositeType(tag: DW_TAG_array_type, baseType: !88, size: 24, elements: !1750)
!1750 = !{!1751}
!1751 = !DISubrange(count: 3)
!1752 = !DIDerivedType(tag: DW_TAG_member, name: "_nbuf", scope: !1705, file: !1704, line: 154, baseType: !1753, size: 8, offset: 952)
!1753 = !DICompositeType(tag: DW_TAG_array_type, baseType: !88, size: 8, elements: !1754)
!1754 = !{!1755}
!1755 = !DISubrange(count: 1)
!1756 = !DIDerivedType(tag: DW_TAG_member, name: "_lb", scope: !1705, file: !1704, line: 157, baseType: !1714, size: 128, offset: 960)
!1757 = !DIDerivedType(tag: DW_TAG_member, name: "_blksize", scope: !1705, file: !1704, line: 160, baseType: !5, size: 32, offset: 1088)
!1758 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !1705, file: !1704, line: 161, baseType: !1734, size: 64, offset: 1152)
!1759 = !DILocalVariable(name: "center", arg: 1, scope: !1698, file: !15, line: 1204, type: !1701)
!1760 = !DILocation(line: 1204, column: 31, scope: !1698)
!1761 = !DILocalVariable(name: "fp", arg: 2, scope: !1698, file: !15, line: 1204, type: !1702)
!1762 = !DILocation(line: 1204, column: 45, scope: !1698)
!1763 = !DILocation(line: 1206, column: 41, scope: !1698)
!1764 = !DILocation(line: 1206, column: 27, scope: !1698)
!1765 = !DILocation(line: 1206, column: 2, scope: !1698)
!1766 = !DILocation(line: 1206, column: 10, scope: !1698)
!1767 = !DILocation(line: 1206, column: 25, scope: !1698)
!1768 = !DILocation(line: 1207, column: 41, scope: !1698)
!1769 = !DILocation(line: 1207, column: 27, scope: !1698)
!1770 = !DILocation(line: 1207, column: 2, scope: !1698)
!1771 = !DILocation(line: 1207, column: 10, scope: !1698)
!1772 = !DILocation(line: 1207, column: 25, scope: !1698)
!1773 = !DILocation(line: 1208, column: 37, scope: !1698)
!1774 = !DILocation(line: 1208, column: 23, scope: !1698)
!1775 = !DILocation(line: 1208, column: 2, scope: !1698)
!1776 = !DILocation(line: 1208, column: 10, scope: !1698)
!1777 = !DILocation(line: 1208, column: 21, scope: !1698)
!1778 = !DILocation(line: 1209, column: 35, scope: !1698)
!1779 = !DILocation(line: 1209, column: 21, scope: !1698)
!1780 = !DILocation(line: 1209, column: 2, scope: !1698)
!1781 = !DILocation(line: 1209, column: 10, scope: !1698)
!1782 = !DILocation(line: 1209, column: 19, scope: !1698)
!1783 = !DILocation(line: 1210, column: 35, scope: !1698)
!1784 = !DILocation(line: 1210, column: 19, scope: !1698)
!1785 = !DILocation(line: 1210, column: 2, scope: !1698)
!1786 = !DILocation(line: 1210, column: 10, scope: !1698)
!1787 = !DILocation(line: 1210, column: 17, scope: !1698)
!1788 = !DILocation(line: 1211, column: 40, scope: !1698)
!1789 = !DILocation(line: 1211, column: 24, scope: !1698)
!1790 = !DILocation(line: 1211, column: 2, scope: !1698)
!1791 = !DILocation(line: 1211, column: 10, scope: !1698)
!1792 = !DILocation(line: 1211, column: 22, scope: !1698)
!1793 = !DILocation(line: 1212, column: 1, scope: !1698)
!1794 = distinct !DISubprogram(name: "write_matcen", linkageName: "_Z12write_matcenP11matcen_infoP7__sFILE", scope: !15, file: !15, line: 1214, type: !1699, scopeLine: 1215, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !213)
!1795 = !DILocalVariable(name: "center", arg: 1, scope: !1794, file: !15, line: 1214, type: !1701)
!1796 = !DILocation(line: 1214, column: 32, scope: !1794)
!1797 = !DILocalVariable(name: "fp", arg: 2, scope: !1794, file: !15, line: 1214, type: !1702)
!1798 = !DILocation(line: 1214, column: 46, scope: !1794)
!1799 = !DILocation(line: 1216, column: 17, scope: !1794)
!1800 = !DILocation(line: 1216, column: 21, scope: !1794)
!1801 = !DILocation(line: 1216, column: 29, scope: !1794)
!1802 = !DILocation(line: 1216, column: 2, scope: !1794)
!1803 = !DILocation(line: 1217, column: 17, scope: !1794)
!1804 = !DILocation(line: 1217, column: 21, scope: !1794)
!1805 = !DILocation(line: 1217, column: 29, scope: !1794)
!1806 = !DILocation(line: 1217, column: 2, scope: !1794)
!1807 = !DILocation(line: 1218, column: 17, scope: !1794)
!1808 = !DILocation(line: 1218, column: 21, scope: !1794)
!1809 = !DILocation(line: 1218, column: 29, scope: !1794)
!1810 = !DILocation(line: 1218, column: 2, scope: !1794)
!1811 = !DILocation(line: 1219, column: 17, scope: !1794)
!1812 = !DILocation(line: 1219, column: 21, scope: !1794)
!1813 = !DILocation(line: 1219, column: 29, scope: !1794)
!1814 = !DILocation(line: 1219, column: 2, scope: !1794)
!1815 = !DILocation(line: 1220, column: 19, scope: !1794)
!1816 = !DILocation(line: 1220, column: 23, scope: !1794)
!1817 = !DILocation(line: 1220, column: 31, scope: !1794)
!1818 = !DILocation(line: 1220, column: 2, scope: !1794)
!1819 = !DILocation(line: 1221, column: 19, scope: !1794)
!1820 = !DILocation(line: 1221, column: 23, scope: !1794)
!1821 = !DILocation(line: 1221, column: 31, scope: !1794)
!1822 = !DILocation(line: 1221, column: 2, scope: !1794)
!1823 = !DILocation(line: 1222, column: 1, scope: !1794)
!1824 = distinct !DISubprogram(name: "read_fuelcen", linkageName: "_Z12read_fuelcenP10FuelCenterP7__sFILE", scope: !15, file: !15, line: 1224, type: !1825, scopeLine: 1225, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !213)
!1825 = !DISubroutineType(types: !1826)
!1826 = !{null, !624, !1702}
!1827 = !DILocalVariable(name: "center", arg: 1, scope: !1824, file: !15, line: 1224, type: !624)
!1828 = !DILocation(line: 1224, column: 31, scope: !1824)
!1829 = !DILocalVariable(name: "fp", arg: 2, scope: !1824, file: !15, line: 1224, type: !1702)
!1830 = !DILocation(line: 1224, column: 45, scope: !1824)
!1831 = !DILocation(line: 1226, column: 31, scope: !1824)
!1832 = !DILocation(line: 1226, column: 17, scope: !1824)
!1833 = !DILocation(line: 1226, column: 2, scope: !1824)
!1834 = !DILocation(line: 1226, column: 10, scope: !1824)
!1835 = !DILocation(line: 1226, column: 15, scope: !1824)
!1836 = !DILocation(line: 1227, column: 33, scope: !1824)
!1837 = !DILocation(line: 1227, column: 19, scope: !1824)
!1838 = !DILocation(line: 1227, column: 2, scope: !1824)
!1839 = !DILocation(line: 1227, column: 10, scope: !1824)
!1840 = !DILocation(line: 1227, column: 17, scope: !1824)
!1841 = !DILocation(line: 1228, column: 32, scope: !1824)
!1842 = !DILocation(line: 1228, column: 17, scope: !1824)
!1843 = !DILocation(line: 1228, column: 2, scope: !1824)
!1844 = !DILocation(line: 1228, column: 10, scope: !1824)
!1845 = !DILocation(line: 1228, column: 15, scope: !1824)
!1846 = !DILocation(line: 1229, column: 35, scope: !1824)
!1847 = !DILocation(line: 1229, column: 20, scope: !1824)
!1848 = !DILocation(line: 1229, column: 2, scope: !1824)
!1849 = !DILocation(line: 1229, column: 10, scope: !1824)
!1850 = !DILocation(line: 1229, column: 18, scope: !1824)
!1851 = !DILocation(line: 1230, column: 33, scope: !1824)
!1852 = !DILocation(line: 1230, column: 18, scope: !1824)
!1853 = !DILocation(line: 1230, column: 2, scope: !1824)
!1854 = !DILocation(line: 1230, column: 10, scope: !1824)
!1855 = !DILocation(line: 1230, column: 16, scope: !1824)
!1856 = !DILocation(line: 1231, column: 32, scope: !1824)
!1857 = !DILocation(line: 1231, column: 17, scope: !1824)
!1858 = !DILocation(line: 1231, column: 2, scope: !1824)
!1859 = !DILocation(line: 1231, column: 10, scope: !1824)
!1860 = !DILocation(line: 1231, column: 15, scope: !1824)
!1861 = !DILocation(line: 1232, column: 35, scope: !1824)
!1862 = !DILocation(line: 1232, column: 21, scope: !1824)
!1863 = !DILocation(line: 1232, column: 2, scope: !1824)
!1864 = !DILocation(line: 1232, column: 10, scope: !1824)
!1865 = !DILocation(line: 1232, column: 19, scope: !1824)
!1866 = !DILocation(line: 1233, column: 38, scope: !1824)
!1867 = !DILocation(line: 1233, column: 24, scope: !1824)
!1868 = !DILocation(line: 1233, column: 2, scope: !1824)
!1869 = !DILocation(line: 1233, column: 10, scope: !1824)
!1870 = !DILocation(line: 1233, column: 22, scope: !1824)
!1871 = !DILocation(line: 1234, column: 32, scope: !1824)
!1872 = !DILocation(line: 1234, column: 18, scope: !1824)
!1873 = !DILocation(line: 1234, column: 2, scope: !1824)
!1874 = !DILocation(line: 1234, column: 10, scope: !1824)
!1875 = !DILocation(line: 1234, column: 16, scope: !1824)
!1876 = !DILocation(line: 1235, column: 39, scope: !1824)
!1877 = !DILocation(line: 1235, column: 25, scope: !1824)
!1878 = !DILocation(line: 1235, column: 2, scope: !1824)
!1879 = !DILocation(line: 1235, column: 10, scope: !1824)
!1880 = !DILocation(line: 1235, column: 23, scope: !1824)
!1881 = !DILocation(line: 1236, column: 35, scope: !1824)
!1882 = !DILocation(line: 1236, column: 21, scope: !1824)
!1883 = !DILocation(line: 1236, column: 2, scope: !1824)
!1884 = !DILocation(line: 1236, column: 10, scope: !1824)
!1885 = !DILocation(line: 1236, column: 17, scope: !1824)
!1886 = !DILocation(line: 1236, column: 19, scope: !1824)
!1887 = !DILocation(line: 1237, column: 35, scope: !1824)
!1888 = !DILocation(line: 1237, column: 21, scope: !1824)
!1889 = !DILocation(line: 1237, column: 2, scope: !1824)
!1890 = !DILocation(line: 1237, column: 10, scope: !1824)
!1891 = !DILocation(line: 1237, column: 17, scope: !1824)
!1892 = !DILocation(line: 1237, column: 19, scope: !1824)
!1893 = !DILocation(line: 1238, column: 35, scope: !1824)
!1894 = !DILocation(line: 1238, column: 21, scope: !1824)
!1895 = !DILocation(line: 1238, column: 2, scope: !1824)
!1896 = !DILocation(line: 1238, column: 10, scope: !1824)
!1897 = !DILocation(line: 1238, column: 17, scope: !1824)
!1898 = !DILocation(line: 1238, column: 19, scope: !1824)
!1899 = !DILocation(line: 1239, column: 1, scope: !1824)
!1900 = distinct !DISubprogram(name: "write_fuelcen", linkageName: "_Z13write_fuelcenP10FuelCenterP7__sFILE", scope: !15, file: !15, line: 1241, type: !1825, scopeLine: 1242, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !213)
!1901 = !DILocalVariable(name: "center", arg: 1, scope: !1900, file: !15, line: 1241, type: !624)
!1902 = !DILocation(line: 1241, column: 32, scope: !1900)
!1903 = !DILocalVariable(name: "fp", arg: 2, scope: !1900, file: !15, line: 1241, type: !1702)
!1904 = !DILocation(line: 1241, column: 46, scope: !1900)
!1905 = !DILocation(line: 1243, column: 17, scope: !1900)
!1906 = !DILocation(line: 1243, column: 21, scope: !1900)
!1907 = !DILocation(line: 1243, column: 29, scope: !1900)
!1908 = !DILocation(line: 1243, column: 2, scope: !1900)
!1909 = !DILocation(line: 1244, column: 17, scope: !1900)
!1910 = !DILocation(line: 1244, column: 21, scope: !1900)
!1911 = !DILocation(line: 1244, column: 29, scope: !1900)
!1912 = !DILocation(line: 1244, column: 2, scope: !1900)
!1913 = !DILocation(line: 1245, column: 18, scope: !1900)
!1914 = !DILocation(line: 1245, column: 22, scope: !1900)
!1915 = !DILocation(line: 1245, column: 30, scope: !1900)
!1916 = !DILocation(line: 1245, column: 2, scope: !1900)
!1917 = !DILocation(line: 1246, column: 18, scope: !1900)
!1918 = !DILocation(line: 1246, column: 22, scope: !1900)
!1919 = !DILocation(line: 1246, column: 30, scope: !1900)
!1920 = !DILocation(line: 1246, column: 2, scope: !1900)
!1921 = !DILocation(line: 1247, column: 18, scope: !1900)
!1922 = !DILocation(line: 1247, column: 22, scope: !1900)
!1923 = !DILocation(line: 1247, column: 30, scope: !1900)
!1924 = !DILocation(line: 1247, column: 2, scope: !1900)
!1925 = !DILocation(line: 1248, column: 18, scope: !1900)
!1926 = !DILocation(line: 1248, column: 22, scope: !1900)
!1927 = !DILocation(line: 1248, column: 30, scope: !1900)
!1928 = !DILocation(line: 1248, column: 2, scope: !1900)
!1929 = !DILocation(line: 1249, column: 17, scope: !1900)
!1930 = !DILocation(line: 1249, column: 21, scope: !1900)
!1931 = !DILocation(line: 1249, column: 29, scope: !1900)
!1932 = !DILocation(line: 1249, column: 2, scope: !1900)
!1933 = !DILocation(line: 1250, column: 17, scope: !1900)
!1934 = !DILocation(line: 1250, column: 21, scope: !1900)
!1935 = !DILocation(line: 1250, column: 29, scope: !1900)
!1936 = !DILocation(line: 1250, column: 2, scope: !1900)
!1937 = !DILocation(line: 1251, column: 17, scope: !1900)
!1938 = !DILocation(line: 1251, column: 21, scope: !1900)
!1939 = !DILocation(line: 1251, column: 29, scope: !1900)
!1940 = !DILocation(line: 1251, column: 2, scope: !1900)
!1941 = !DILocation(line: 1252, column: 17, scope: !1900)
!1942 = !DILocation(line: 1252, column: 21, scope: !1900)
!1943 = !DILocation(line: 1252, column: 29, scope: !1900)
!1944 = !DILocation(line: 1252, column: 2, scope: !1900)
!1945 = !DILocation(line: 1253, column: 17, scope: !1900)
!1946 = !DILocation(line: 1253, column: 21, scope: !1900)
!1947 = !DILocation(line: 1253, column: 29, scope: !1900)
!1948 = !DILocation(line: 1253, column: 36, scope: !1900)
!1949 = !DILocation(line: 1253, column: 2, scope: !1900)
!1950 = !DILocation(line: 1254, column: 17, scope: !1900)
!1951 = !DILocation(line: 1254, column: 21, scope: !1900)
!1952 = !DILocation(line: 1254, column: 29, scope: !1900)
!1953 = !DILocation(line: 1254, column: 36, scope: !1900)
!1954 = !DILocation(line: 1254, column: 2, scope: !1900)
!1955 = !DILocation(line: 1255, column: 17, scope: !1900)
!1956 = !DILocation(line: 1255, column: 21, scope: !1900)
!1957 = !DILocation(line: 1255, column: 29, scope: !1900)
!1958 = !DILocation(line: 1255, column: 36, scope: !1900)
!1959 = !DILocation(line: 1255, column: 2, scope: !1900)
!1960 = !DILocation(line: 1256, column: 1, scope: !1900)
