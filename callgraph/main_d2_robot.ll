; ModuleID = '/Users/richard/code/ChocolateDescent/main_d2/robot.cpp'
source_filename = "/Users/richard/code/ChocolateDescent/main_d2/robot.cpp"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

%struct.robot_info = type { i32, [8 x %struct.vms_vector], [8 x i8], i16, i16, i16, i16, i8, i8, i8, i8, i8, i8, i8, i8, i16, i8, i8, i32, i32, i32, i32, [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i8], [5 x i8], i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, [3 x i8], i8, i8, i8, i8, [9 x [5 x %struct.jointlist]], i32 }
%struct.vms_vector = type { i32, i32, i32 }
%struct.jointlist = type { i16, i16 }
%struct.jointpos = type { i16, %struct.vms_angvec }
%struct.vms_angvec = type { i16, i16, i16 }
%struct.polymodel = type { i32, i32, ptr, [10 x i32], [10 x %struct.vms_vector], [10 x %struct.vms_vector], [10 x %struct.vms_vector], [10 x i32], [10 x i8], [10 x %struct.vms_vector], [10 x %struct.vms_vector], %struct.vms_vector, %struct.vms_vector, i32, i8, i16, i8 }
%struct.vms_matrix = type { %struct.vms_vector, %struct.vms_vector, %struct.vms_vector }
%struct.object = type { i32, i8, i8, i16, i16, i8, i8, i8, i8, i16, i16, %struct.vms_vector, %struct.vms_matrix, i32, i32, %struct.vms_vector, i8, i8, i8, i8, i32, %union.anon, %union.anon.0, %union.anon.1 }
%union.anon = type { %struct.physics_info }
%struct.physics_info = type { %struct.vms_vector, %struct.vms_vector, i32, i32, i32, %struct.vms_vector, %struct.vms_vector, i16, i16 }
%union.anon.0 = type { %struct.ai_static }
%struct.ai_static = type { i8, [11 x i8], i16, i16, i16, i8, i8, i16, i32, i32 }
%union.anon.1 = type { %struct.polyobj_info }
%struct.polyobj_info = type { i32, [10 x %struct.vms_angvec], i32, i32, i32 }

@N_robot_types = global i32 0, align 4, !dbg !0
@N_robot_joints = global i32 0, align 4, !dbg !5
@Robot_info = global [85 x %struct.robot_info] zeroinitializer, align 4, !dbg !9
@Robot_joints = global <{ [25 x %struct.jointpos], [1575 x %struct.jointpos] }> <{ [25 x %struct.jointpos] [%struct.jointpos { i16 2, %struct.vms_angvec { i16 -5461, i16 0, i16 0 } }, %struct.jointpos { i16 3, %struct.vms_angvec { i16 -7281, i16 0, i16 0 } }, %struct.jointpos { i16 2, %struct.vms_angvec zeroinitializer }, %struct.jointpos { i16 3, %struct.vms_angvec zeroinitializer }, %struct.jointpos { i16 2, %struct.vms_angvec zeroinitializer }, %struct.jointpos { i16 3, %struct.vms_angvec zeroinitializer }, %struct.jointpos { i16 2, %struct.vms_angvec { i16 9102, i16 0, i16 0 } }, %struct.jointpos { i16 3, %struct.vms_angvec { i16 -9102, i16 0, i16 0 } }, %struct.jointpos { i16 2, %struct.vms_angvec { i16 1820, i16 0, i16 12743 } }, %struct.jointpos { i16 3, %struct.vms_angvec { i16 0, i16 3640, i16 0 } }, %struct.jointpos { i16 4, %struct.vms_angvec { i16 -5461, i16 0, i16 0 } }, %struct.jointpos { i16 5, %struct.vms_angvec { i16 -7281, i16 0, i16 0 } }, %struct.jointpos { i16 4, %struct.vms_angvec zeroinitializer }, %struct.jointpos { i16 5, %struct.vms_angvec zeroinitializer }, %struct.jointpos { i16 4, %struct.vms_angvec zeroinitializer }, %struct.jointpos { i16 5, %struct.vms_angvec zeroinitializer }, %struct.jointpos { i16 4, %struct.vms_angvec { i16 9102, i16 0, i16 0 } }, %struct.jointpos { i16 5, %struct.vms_angvec { i16 -9102, i16 0, i16 0 } }, %struct.jointpos { i16 4, %struct.vms_angvec { i16 3640, i16 0, i16 -9102 } }, %struct.jointpos { i16 5, %struct.vms_angvec { i16 0, i16 0, i16 3640 } }, %struct.jointpos { i16 1, %struct.vms_angvec { i16 12743, i16 0, i16 0 } }, %struct.jointpos { i16 1, %struct.vms_angvec zeroinitializer }, %struct.jointpos { i16 1, %struct.vms_angvec zeroinitializer }, %struct.jointpos { i16 1, %struct.vms_angvec zeroinitializer }, %struct.jointpos { i16 1, %struct.vms_angvec { i16 -3640, i16 2730, i16 0 } }], [1575 x %struct.jointpos] zeroinitializer }>, align 2, !dbg !107
@.str = private unnamed_addr constant [59 x i8] c"obj->render_type==RT_POLYOBJ || obj->render_type==RT_MORPH\00", align 1, !dbg !124
@.str.1 = private unnamed_addr constant [55 x i8] c"/Users/richard/code/ChocolateDescent/main_d2/robot.cpp\00", align 1, !dbg !131
@.str.2 = private unnamed_addr constant [24 x i8] c"obj->id < N_robot_types\00", align 1, !dbg !136
@Polygon_models = external global [0 x %struct.polymodel], align 8
@.str.3 = private unnamed_addr constant [26 x i8] c"Bashing gun num %d to 0.\0A\00", align 1, !dbg !141
@.str.4 = private unnamed_addr constant [41 x i8] c"gun_num <= Robot_info[robot_type].n_guns\00", align 1, !dbg !146
@.str.5 = private unnamed_addr constant [23 x i8] c"obj->type == OBJ_ROBOT\00", align 1, !dbg !151
@.str.6 = private unnamed_addr constant [34 x i8] c"N_robot_joints < MAX_ROBOT_JOINTS\00", align 1, !dbg !156

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z14calc_gun_pointP10vms_vectorP6objecti(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 !dbg !244 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca %struct.vms_vector, align 4
  %10 = alloca %struct.vms_matrix, align 4
  %11 = alloca i32, align 4
  %12 = alloca %struct.vms_vector, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !374, !DIExpression(), !375)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !376, !DIExpression(), !377)
  store i32 %2, ptr %6, align 4
    #dbg_declare(ptr %6, !378, !DIExpression(), !379)
    #dbg_declare(ptr %7, !380, !DIExpression(), !408)
    #dbg_declare(ptr %8, !409, !DIExpression(), !411)
    #dbg_declare(ptr %9, !412, !DIExpression(), !413)
    #dbg_declare(ptr %10, !414, !DIExpression(), !415)
    #dbg_declare(ptr %11, !416, !DIExpression(), !417)
  %13 = load ptr, ptr %5, align 8, !dbg !418
  %14 = getelementptr inbounds nuw %struct.object, ptr %13, i32 0, i32 7, !dbg !418
  %15 = load i8, ptr %14, align 4, !dbg !418
  %16 = zext i8 %15 to i32, !dbg !418
  %17 = icmp eq i32 %16, 1, !dbg !418
  br i1 %17, label %24, label %18, !dbg !418

18:                                               ; preds = %3
  %19 = load ptr, ptr %5, align 8, !dbg !418
  %20 = getelementptr inbounds nuw %struct.object, ptr %19, i32 0, i32 7, !dbg !418
  %21 = load i8, ptr %20, align 4, !dbg !418
  %22 = zext i8 %21 to i32, !dbg !418
  %23 = icmp eq i32 %22, 6, !dbg !418
  br label %24, !dbg !418

24:                                               ; preds = %18, %3
  %25 = phi i1 [ true, %3 ], [ %23, %18 ]
  %26 = zext i1 %25 to i32, !dbg !418
  call void @_Z7_AssertiPKcS0_i(i32 noundef %26, ptr noundef @.str, ptr noundef @.str.1, i32 noundef 97), !dbg !418
  %27 = load ptr, ptr %5, align 8, !dbg !419
  %28 = getelementptr inbounds nuw %struct.object, ptr %27, i32 0, i32 2, !dbg !419
  %29 = load i8, ptr %28, align 1, !dbg !419
  %30 = zext i8 %29 to i32, !dbg !419
  %31 = load i32, ptr @N_robot_types, align 4, !dbg !419
  %32 = icmp slt i32 %30, %31, !dbg !419
  %33 = zext i1 %32 to i32, !dbg !419
  call void @_Z7_AssertiPKcS0_i(i32 noundef %33, ptr noundef @.str.2, ptr noundef @.str.1, i32 noundef 98), !dbg !419
  %34 = load ptr, ptr %5, align 8, !dbg !420
  %35 = getelementptr inbounds nuw %struct.object, ptr %34, i32 0, i32 2, !dbg !421
  %36 = load i8, ptr %35, align 1, !dbg !421
  %37 = zext i8 %36 to i64, !dbg !422
  %38 = getelementptr inbounds nuw [85 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %37, !dbg !422
  store ptr %38, ptr %8, align 8, !dbg !423
  %39 = load ptr, ptr %8, align 8, !dbg !424
  %40 = getelementptr inbounds nuw %struct.robot_info, ptr %39, i32 0, i32 0, !dbg !425
  %41 = load i32, ptr %40, align 4, !dbg !425
  %42 = sext i32 %41 to i64, !dbg !426
  %43 = getelementptr inbounds [0 x %struct.polymodel], ptr @Polygon_models, i64 0, i64 %42, !dbg !426
  store ptr %43, ptr %7, align 8, !dbg !427
  %44 = load i32, ptr %6, align 4, !dbg !428
  %45 = load ptr, ptr %8, align 8, !dbg !430
  %46 = getelementptr inbounds nuw %struct.robot_info, ptr %45, i32 0, i32 9, !dbg !431
  %47 = load i8, ptr %46, align 2, !dbg !431
  %48 = sext i8 %47 to i32, !dbg !430
  %49 = icmp sge i32 %44, %48, !dbg !432
  br i1 %49, label %50, label %52, !dbg !432

50:                                               ; preds = %24
  %51 = load i32, ptr %6, align 4, !dbg !433
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 1, ptr noundef @.str.3, i32 noundef %51), !dbg !433
  store i32 0, ptr %6, align 4, !dbg !435
  br label %52, !dbg !436

52:                                               ; preds = %50, %24
  %53 = load ptr, ptr %8, align 8, !dbg !437
  %54 = getelementptr inbounds nuw %struct.robot_info, ptr %53, i32 0, i32 1, !dbg !438
  %55 = load i32, ptr %6, align 4, !dbg !439
  %56 = sext i32 %55 to i64, !dbg !437
  %57 = getelementptr inbounds [8 x %struct.vms_vector], ptr %54, i64 0, i64 %56, !dbg !437
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %9, ptr align 4 %57, i64 12, i1 false), !dbg !440
  %58 = load ptr, ptr %8, align 8, !dbg !441
  %59 = getelementptr inbounds nuw %struct.robot_info, ptr %58, i32 0, i32 2, !dbg !442
  %60 = load i32, ptr %6, align 4, !dbg !443
  %61 = sext i32 %60 to i64, !dbg !441
  %62 = getelementptr inbounds [8 x i8], ptr %59, i64 0, i64 %61, !dbg !441
  %63 = load i8, ptr %62, align 1, !dbg !441
  %64 = zext i8 %63 to i32, !dbg !441
  store i32 %64, ptr %11, align 4, !dbg !444
  br label %65, !dbg !445

65:                                               ; preds = %68, %52
  %66 = load i32, ptr %11, align 4, !dbg !446
  %67 = icmp ne i32 %66, 0, !dbg !447
  br i1 %67, label %68, label %91, !dbg !445

68:                                               ; preds = %65
    #dbg_declare(ptr %12, !448, !DIExpression(), !450)
  %69 = load ptr, ptr %5, align 8, !dbg !451
  %70 = getelementptr inbounds nuw %struct.object, ptr %69, i32 0, i32 23, !dbg !452
  %71 = getelementptr inbounds nuw %struct.polyobj_info, ptr %70, i32 0, i32 1, !dbg !453
  %72 = load i32, ptr %11, align 4, !dbg !454
  %73 = sext i32 %72 to i64, !dbg !451
  %74 = getelementptr inbounds [10 x %struct.vms_angvec], ptr %71, i64 0, i64 %73, !dbg !451
  %75 = call noundef ptr @_Z18vm_angles_2_matrixP10vms_matrixP10vms_angvec(ptr noundef %10, ptr noundef %74), !dbg !455
  %76 = call noundef ptr @_Z19vm_transpose_matrixP10vms_matrix(ptr noundef %10), !dbg !456
  %77 = call noundef ptr @_Z13vm_vec_rotateP10vms_vectorS0_P10vms_matrix(ptr noundef %12, ptr noundef %9, ptr noundef %10), !dbg !457
  %78 = load ptr, ptr %7, align 8, !dbg !458
  %79 = getelementptr inbounds nuw %struct.polymodel, ptr %78, i32 0, i32 4, !dbg !459
  %80 = load i32, ptr %11, align 4, !dbg !460
  %81 = sext i32 %80 to i64, !dbg !458
  %82 = getelementptr inbounds [10 x %struct.vms_vector], ptr %79, i64 0, i64 %81, !dbg !458
  %83 = call noundef ptr @_Z10vm_vec_addP10vms_vectorS0_S0_(ptr noundef %9, ptr noundef %12, ptr noundef %82), !dbg !461
  %84 = load ptr, ptr %7, align 8, !dbg !462
  %85 = getelementptr inbounds nuw %struct.polymodel, ptr %84, i32 0, i32 8, !dbg !463
  %86 = load i32, ptr %11, align 4, !dbg !464
  %87 = sext i32 %86 to i64, !dbg !462
  %88 = getelementptr inbounds [10 x i8], ptr %85, i64 0, i64 %87, !dbg !462
  %89 = load i8, ptr %88, align 1, !dbg !462
  %90 = zext i8 %89 to i32, !dbg !462
  store i32 %90, ptr %11, align 4, !dbg !465
  br label %65, !dbg !445, !llvm.loop !466

91:                                               ; preds = %65
  %92 = load ptr, ptr %5, align 8, !dbg !469
  %93 = getelementptr inbounds nuw %struct.object, ptr %92, i32 0, i32 12, !dbg !470
  %94 = call noundef ptr @_Z24vm_copy_transpose_matrixP10vms_matrixS0_(ptr noundef %10, ptr noundef %93), !dbg !471
  %95 = load ptr, ptr %4, align 8, !dbg !472
  %96 = call noundef ptr @_Z13vm_vec_rotateP10vms_vectorS0_P10vms_matrix(ptr noundef %95, ptr noundef %9, ptr noundef %10), !dbg !473
  %97 = load ptr, ptr %4, align 8, !dbg !474
  %98 = load ptr, ptr %5, align 8, !dbg !475
  %99 = getelementptr inbounds nuw %struct.object, ptr %98, i32 0, i32 11, !dbg !476
  %100 = call noundef ptr @_Z11vm_vec_add2P10vms_vectorS0_(ptr noundef %97, ptr noundef %99), !dbg !477
  ret void, !dbg !478
}

declare void @_Z7_AssertiPKcS0_i(i32 noundef, ptr noundef, ptr noundef, i32 noundef) #1

declare void @_Z8_mprintfiPKcz(i32 noundef, ptr noundef, ...) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

declare noundef ptr @_Z18vm_angles_2_matrixP10vms_matrixP10vms_angvec(ptr noundef, ptr noundef) #1

declare noundef ptr @_Z19vm_transpose_matrixP10vms_matrix(ptr noundef) #1

declare noundef ptr @_Z13vm_vec_rotateP10vms_vectorS0_P10vms_matrix(ptr noundef, ptr noundef, ptr noundef) #1

declare noundef ptr @_Z10vm_vec_addP10vms_vectorS0_S0_(ptr noundef, ptr noundef, ptr noundef) #1

declare noundef ptr @_Z24vm_copy_transpose_matrixP10vms_matrixS0_(ptr noundef, ptr noundef) #1

declare noundef ptr @_Z11vm_vec_add2P10vms_vectorS0_(ptr noundef, ptr noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z20robot_get_anim_statePP8jointposiii(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 !dbg !479 {
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
    #dbg_declare(ptr %5, !484, !DIExpression(), !485)
  store i32 %1, ptr %6, align 4
    #dbg_declare(ptr %6, !486, !DIExpression(), !487)
  store i32 %2, ptr %7, align 4
    #dbg_declare(ptr %7, !488, !DIExpression(), !489)
  store i32 %3, ptr %8, align 4
    #dbg_declare(ptr %8, !490, !DIExpression(), !491)
  %9 = load i32, ptr %7, align 4, !dbg !492
  %10 = load i32, ptr %6, align 4, !dbg !492
  %11 = sext i32 %10 to i64, !dbg !492
  %12 = getelementptr inbounds [85 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %11, !dbg !492
  %13 = getelementptr inbounds nuw %struct.robot_info, ptr %12, i32 0, i32 9, !dbg !492
  %14 = load i8, ptr %13, align 2, !dbg !492
  %15 = sext i8 %14 to i32, !dbg !492
  %16 = icmp sle i32 %9, %15, !dbg !492
  %17 = zext i1 %16 to i32, !dbg !492
  call void @_Z7_AssertiPKcS0_i(i32 noundef %17, ptr noundef @.str.4, ptr noundef @.str.1, i32 noundef 170), !dbg !492
  %18 = load i32, ptr %6, align 4, !dbg !493
  %19 = sext i32 %18 to i64, !dbg !494
  %20 = getelementptr inbounds [85 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %19, !dbg !494
  %21 = getelementptr inbounds nuw %struct.robot_info, ptr %20, i32 0, i32 50, !dbg !495
  %22 = load i32, ptr %7, align 4, !dbg !496
  %23 = sext i32 %22 to i64, !dbg !494
  %24 = getelementptr inbounds [9 x [5 x %struct.jointlist]], ptr %21, i64 0, i64 %23, !dbg !494
  %25 = load i32, ptr %8, align 4, !dbg !497
  %26 = sext i32 %25 to i64, !dbg !494
  %27 = getelementptr inbounds [5 x %struct.jointlist], ptr %24, i64 0, i64 %26, !dbg !494
  %28 = getelementptr inbounds nuw %struct.jointlist, ptr %27, i32 0, i32 1, !dbg !498
  %29 = load i16, ptr %28, align 2, !dbg !498
  %30 = sext i16 %29 to i64, !dbg !499
  %31 = getelementptr inbounds [1600 x %struct.jointpos], ptr @Robot_joints, i64 0, i64 %30, !dbg !499
  %32 = load ptr, ptr %5, align 8, !dbg !500
  store ptr %31, ptr %32, align 8, !dbg !501
  %33 = load i32, ptr %6, align 4, !dbg !502
  %34 = sext i32 %33 to i64, !dbg !503
  %35 = getelementptr inbounds [85 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %34, !dbg !503
  %36 = getelementptr inbounds nuw %struct.robot_info, ptr %35, i32 0, i32 50, !dbg !504
  %37 = load i32, ptr %7, align 4, !dbg !505
  %38 = sext i32 %37 to i64, !dbg !503
  %39 = getelementptr inbounds [9 x [5 x %struct.jointlist]], ptr %36, i64 0, i64 %38, !dbg !503
  %40 = load i32, ptr %8, align 4, !dbg !506
  %41 = sext i32 %40 to i64, !dbg !503
  %42 = getelementptr inbounds [5 x %struct.jointlist], ptr %39, i64 0, i64 %41, !dbg !503
  %43 = getelementptr inbounds nuw %struct.jointlist, ptr %42, i32 0, i32 0, !dbg !507
  %44 = load i16, ptr %43, align 4, !dbg !507
  %45 = sext i16 %44 to i32, !dbg !503
  ret i32 %45, !dbg !508
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z15set_robot_stateP6objecti(ptr noundef %0, i32 noundef %1) #0 !dbg !509 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !512, !DIExpression(), !513)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !514, !DIExpression(), !515)
    #dbg_declare(ptr %5, !516, !DIExpression(), !517)
    #dbg_declare(ptr %6, !518, !DIExpression(), !519)
    #dbg_declare(ptr %7, !520, !DIExpression(), !521)
    #dbg_declare(ptr %8, !522, !DIExpression(), !523)
    #dbg_declare(ptr %9, !524, !DIExpression(), !526)
  %11 = load ptr, ptr %3, align 8, !dbg !527
  %12 = getelementptr inbounds nuw %struct.object, ptr %11, i32 0, i32 1, !dbg !527
  %13 = load i8, ptr %12, align 4, !dbg !527
  %14 = zext i8 %13 to i32, !dbg !527
  %15 = icmp eq i32 %14, 2, !dbg !527
  %16 = zext i1 %15 to i32, !dbg !527
  call void @_Z7_AssertiPKcS0_i(i32 noundef %16, ptr noundef @.str.5, ptr noundef @.str.1, i32 noundef 220), !dbg !527
  %17 = load ptr, ptr %3, align 8, !dbg !528
  %18 = getelementptr inbounds nuw %struct.object, ptr %17, i32 0, i32 2, !dbg !529
  %19 = load i8, ptr %18, align 1, !dbg !529
  %20 = zext i8 %19 to i64, !dbg !530
  %21 = getelementptr inbounds nuw [85 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %20, !dbg !530
  store ptr %21, ptr %8, align 8, !dbg !531
  store i32 0, ptr %5, align 4, !dbg !532
  br label %22, !dbg !534

22:                                               ; preds = %73, %2
  %23 = load i32, ptr %5, align 4, !dbg !535
  %24 = load ptr, ptr %8, align 8, !dbg !537
  %25 = getelementptr inbounds nuw %struct.robot_info, ptr %24, i32 0, i32 9, !dbg !538
  %26 = load i8, ptr %25, align 2, !dbg !538
  %27 = sext i8 %26 to i32, !dbg !537
  %28 = add nsw i32 %27, 1, !dbg !539
  %29 = icmp slt i32 %23, %28, !dbg !540
  br i1 %29, label %30, label %76, !dbg !541

30:                                               ; preds = %22
  %31 = load ptr, ptr %8, align 8, !dbg !542
  %32 = getelementptr inbounds nuw %struct.robot_info, ptr %31, i32 0, i32 50, !dbg !544
  %33 = load i32, ptr %5, align 4, !dbg !545
  %34 = sext i32 %33 to i64, !dbg !542
  %35 = getelementptr inbounds [9 x [5 x %struct.jointlist]], ptr %32, i64 0, i64 %34, !dbg !542
  %36 = load i32, ptr %4, align 4, !dbg !546
  %37 = sext i32 %36 to i64, !dbg !542
  %38 = getelementptr inbounds [5 x %struct.jointlist], ptr %35, i64 0, i64 %37, !dbg !542
  store ptr %38, ptr %9, align 8, !dbg !547
  %39 = load ptr, ptr %9, align 8, !dbg !548
  %40 = getelementptr inbounds nuw %struct.jointlist, ptr %39, i32 0, i32 1, !dbg !549
  %41 = load i16, ptr %40, align 2, !dbg !549
  %42 = sext i16 %41 to i32, !dbg !548
  store i32 %42, ptr %7, align 4, !dbg !550
  store i32 0, ptr %6, align 4, !dbg !551
  br label %43, !dbg !553

43:                                               ; preds = %67, %30
  %44 = load i32, ptr %6, align 4, !dbg !554
  %45 = load ptr, ptr %9, align 8, !dbg !556
  %46 = getelementptr inbounds nuw %struct.jointlist, ptr %45, i32 0, i32 0, !dbg !557
  %47 = load i16, ptr %46, align 2, !dbg !557
  %48 = sext i16 %47 to i32, !dbg !556
  %49 = icmp slt i32 %44, %48, !dbg !558
  br i1 %49, label %50, label %72, !dbg !559

50:                                               ; preds = %43
    #dbg_declare(ptr %10, !560, !DIExpression(), !562)
  %51 = load i32, ptr %7, align 4, !dbg !563
  %52 = sext i32 %51 to i64, !dbg !564
  %53 = getelementptr inbounds [1600 x %struct.jointpos], ptr @Robot_joints, i64 0, i64 %52, !dbg !564
  %54 = getelementptr inbounds nuw %struct.jointpos, ptr %53, i32 0, i32 0, !dbg !565
  %55 = load i16, ptr %54, align 2, !dbg !565
  %56 = sext i16 %55 to i32, !dbg !564
  store i32 %56, ptr %10, align 4, !dbg !566
  %57 = load i32, ptr %7, align 4, !dbg !567
  %58 = sext i32 %57 to i64, !dbg !568
  %59 = getelementptr inbounds [1600 x %struct.jointpos], ptr @Robot_joints, i64 0, i64 %58, !dbg !568
  %60 = getelementptr inbounds nuw %struct.jointpos, ptr %59, i32 0, i32 1, !dbg !569
  %61 = load ptr, ptr %3, align 8, !dbg !570
  %62 = getelementptr inbounds nuw %struct.object, ptr %61, i32 0, i32 23, !dbg !571
  %63 = getelementptr inbounds nuw %struct.polyobj_info, ptr %62, i32 0, i32 1, !dbg !572
  %64 = load i32, ptr %10, align 4, !dbg !573
  %65 = sext i32 %64 to i64, !dbg !570
  %66 = getelementptr inbounds [10 x %struct.vms_angvec], ptr %63, i64 0, i64 %65, !dbg !570
  call void @llvm.memcpy.p0.p0.i64(ptr align 2 %66, ptr align 2 %60, i64 6, i1 false), !dbg !574
  br label %67, !dbg !575

67:                                               ; preds = %50
  %68 = load i32, ptr %6, align 4, !dbg !576
  %69 = add nsw i32 %68, 1, !dbg !576
  store i32 %69, ptr %6, align 4, !dbg !576
  %70 = load i32, ptr %7, align 4, !dbg !577
  %71 = add nsw i32 %70, 1, !dbg !577
  store i32 %71, ptr %7, align 4, !dbg !577
  br label %43, !dbg !578, !llvm.loop !579

72:                                               ; preds = %43
  br label %73, !dbg !581

73:                                               ; preds = %72
  %74 = load i32, ptr %5, align 4, !dbg !582
  %75 = add nsw i32 %74, 1, !dbg !582
  store i32 %75, ptr %5, align 4, !dbg !582
  br label %22, !dbg !583, !llvm.loop !584

76:                                               ; preds = %22
  ret void, !dbg !586
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z16robot_set_anglesP10robot_infoP9polymodelPA10_10vms_angvec(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !587 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca [10 x i32], align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !591, !DIExpression(), !592)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !593, !DIExpression(), !594)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !595, !DIExpression(), !596)
    #dbg_declare(ptr %7, !597, !DIExpression(), !598)
    #dbg_declare(ptr %8, !599, !DIExpression(), !600)
    #dbg_declare(ptr %9, !601, !DIExpression(), !602)
    #dbg_declare(ptr %10, !603, !DIExpression(), !604)
  store i32 0, ptr %7, align 4, !dbg !605
  br label %11, !dbg !607

11:                                               ; preds = %25, %3
  %12 = load i32, ptr %7, align 4, !dbg !608
  %13 = load ptr, ptr %5, align 8, !dbg !610
  %14 = getelementptr inbounds nuw %struct.polymodel, ptr %13, i32 0, i32 0, !dbg !611
  %15 = load i32, ptr %14, align 8, !dbg !611
  %16 = icmp slt i32 %12, %15, !dbg !612
  br i1 %16, label %17, label %28, !dbg !613

17:                                               ; preds = %11
  %18 = load ptr, ptr %4, align 8, !dbg !614
  %19 = getelementptr inbounds nuw %struct.robot_info, ptr %18, i32 0, i32 9, !dbg !615
  %20 = load i8, ptr %19, align 2, !dbg !615
  %21 = sext i8 %20 to i32, !dbg !614
  %22 = load i32, ptr %7, align 4, !dbg !616
  %23 = sext i32 %22 to i64, !dbg !617
  %24 = getelementptr inbounds [10 x i32], ptr %10, i64 0, i64 %23, !dbg !617
  store i32 %21, ptr %24, align 4, !dbg !618
  br label %25, !dbg !617

25:                                               ; preds = %17
  %26 = load i32, ptr %7, align 4, !dbg !619
  %27 = add nsw i32 %26, 1, !dbg !619
  store i32 %27, ptr %7, align 4, !dbg !619
  br label %11, !dbg !620, !llvm.loop !621

28:                                               ; preds = %11
  %29 = getelementptr inbounds [10 x i32], ptr %10, i64 0, i64 0, !dbg !623
  store i32 -1, ptr %29, align 4, !dbg !624
  store i32 0, ptr %8, align 4, !dbg !625
  br label %30, !dbg !627

30:                                               ; preds = %61, %28
  %31 = load i32, ptr %8, align 4, !dbg !628
  %32 = load ptr, ptr %4, align 8, !dbg !630
  %33 = getelementptr inbounds nuw %struct.robot_info, ptr %32, i32 0, i32 9, !dbg !631
  %34 = load i8, ptr %33, align 2, !dbg !631
  %35 = sext i8 %34 to i32, !dbg !630
  %36 = icmp slt i32 %31, %35, !dbg !632
  br i1 %36, label %37, label %64, !dbg !633

37:                                               ; preds = %30
  %38 = load ptr, ptr %4, align 8, !dbg !634
  %39 = getelementptr inbounds nuw %struct.robot_info, ptr %38, i32 0, i32 2, !dbg !636
  %40 = load i32, ptr %8, align 4, !dbg !637
  %41 = sext i32 %40 to i64, !dbg !634
  %42 = getelementptr inbounds [8 x i8], ptr %39, i64 0, i64 %41, !dbg !634
  %43 = load i8, ptr %42, align 1, !dbg !634
  %44 = zext i8 %43 to i32, !dbg !634
  store i32 %44, ptr %7, align 4, !dbg !638
  br label %45, !dbg !639

45:                                               ; preds = %48, %37
  %46 = load i32, ptr %7, align 4, !dbg !640
  %47 = icmp ne i32 %46, 0, !dbg !641
  br i1 %47, label %48, label %60, !dbg !639

48:                                               ; preds = %45
  %49 = load i32, ptr %8, align 4, !dbg !642
  %50 = load i32, ptr %7, align 4, !dbg !644
  %51 = sext i32 %50 to i64, !dbg !645
  %52 = getelementptr inbounds [10 x i32], ptr %10, i64 0, i64 %51, !dbg !645
  store i32 %49, ptr %52, align 4, !dbg !646
  %53 = load ptr, ptr %5, align 8, !dbg !647
  %54 = getelementptr inbounds nuw %struct.polymodel, ptr %53, i32 0, i32 8, !dbg !648
  %55 = load i32, ptr %7, align 4, !dbg !649
  %56 = sext i32 %55 to i64, !dbg !647
  %57 = getelementptr inbounds [10 x i8], ptr %54, i64 0, i64 %56, !dbg !647
  %58 = load i8, ptr %57, align 1, !dbg !647
  %59 = zext i8 %58 to i32, !dbg !647
  store i32 %59, ptr %7, align 4, !dbg !650
  br label %45, !dbg !639, !llvm.loop !651

60:                                               ; preds = %45
  br label %61, !dbg !653

61:                                               ; preds = %60
  %62 = load i32, ptr %8, align 4, !dbg !654
  %63 = add nsw i32 %62, 1, !dbg !654
  store i32 %63, ptr %8, align 4, !dbg !654
  br label %30, !dbg !655, !llvm.loop !656

64:                                               ; preds = %30
  store i32 0, ptr %8, align 4, !dbg !658
  br label %65, !dbg !660

65:                                               ; preds = %154, %64
  %66 = load i32, ptr %8, align 4, !dbg !661
  %67 = load ptr, ptr %4, align 8, !dbg !663
  %68 = getelementptr inbounds nuw %struct.robot_info, ptr %67, i32 0, i32 9, !dbg !664
  %69 = load i8, ptr %68, align 2, !dbg !664
  %70 = sext i8 %69 to i32, !dbg !663
  %71 = add nsw i32 %70, 1, !dbg !665
  %72 = icmp slt i32 %66, %71, !dbg !666
  br i1 %72, label %73, label %157, !dbg !667

73:                                               ; preds = %65
  store i32 0, ptr %9, align 4, !dbg !668
  br label %74, !dbg !671

74:                                               ; preds = %150, %73
  %75 = load i32, ptr %9, align 4, !dbg !672
  %76 = icmp slt i32 %75, 5, !dbg !674
  br i1 %76, label %77, label %153, !dbg !675

77:                                               ; preds = %74
  %78 = load ptr, ptr %4, align 8, !dbg !676
  %79 = getelementptr inbounds nuw %struct.robot_info, ptr %78, i32 0, i32 50, !dbg !678
  %80 = load i32, ptr %8, align 4, !dbg !679
  %81 = sext i32 %80 to i64, !dbg !676
  %82 = getelementptr inbounds [9 x [5 x %struct.jointlist]], ptr %79, i64 0, i64 %81, !dbg !676
  %83 = load i32, ptr %9, align 4, !dbg !680
  %84 = sext i32 %83 to i64, !dbg !676
  %85 = getelementptr inbounds [5 x %struct.jointlist], ptr %82, i64 0, i64 %84, !dbg !676
  %86 = getelementptr inbounds nuw %struct.jointlist, ptr %85, i32 0, i32 0, !dbg !681
  store i16 0, ptr %86, align 4, !dbg !682
  %87 = load i32, ptr @N_robot_joints, align 4, !dbg !683
  %88 = trunc i32 %87 to i16, !dbg !683
  %89 = load ptr, ptr %4, align 8, !dbg !684
  %90 = getelementptr inbounds nuw %struct.robot_info, ptr %89, i32 0, i32 50, !dbg !685
  %91 = load i32, ptr %8, align 4, !dbg !686
  %92 = sext i32 %91 to i64, !dbg !684
  %93 = getelementptr inbounds [9 x [5 x %struct.jointlist]], ptr %90, i64 0, i64 %92, !dbg !684
  %94 = load i32, ptr %9, align 4, !dbg !687
  %95 = sext i32 %94 to i64, !dbg !684
  %96 = getelementptr inbounds [5 x %struct.jointlist], ptr %93, i64 0, i64 %95, !dbg !684
  %97 = getelementptr inbounds nuw %struct.jointlist, ptr %96, i32 0, i32 1, !dbg !688
  store i16 %88, ptr %97, align 2, !dbg !689
  store i32 0, ptr %7, align 4, !dbg !690
  br label %98, !dbg !692

98:                                               ; preds = %146, %77
  %99 = load i32, ptr %7, align 4, !dbg !693
  %100 = load ptr, ptr %5, align 8, !dbg !695
  %101 = getelementptr inbounds nuw %struct.polymodel, ptr %100, i32 0, i32 0, !dbg !696
  %102 = load i32, ptr %101, align 8, !dbg !696
  %103 = icmp slt i32 %99, %102, !dbg !697
  br i1 %103, label %104, label %149, !dbg !698

104:                                              ; preds = %98
  %105 = load i32, ptr %7, align 4, !dbg !699
  %106 = sext i32 %105 to i64, !dbg !702
  %107 = getelementptr inbounds [10 x i32], ptr %10, i64 0, i64 %106, !dbg !702
  %108 = load i32, ptr %107, align 4, !dbg !702
  %109 = load i32, ptr %8, align 4, !dbg !703
  %110 = icmp eq i32 %108, %109, !dbg !704
  br i1 %110, label %111, label %145, !dbg !704

111:                                              ; preds = %104
  %112 = load i32, ptr %7, align 4, !dbg !705
  %113 = trunc i32 %112 to i16, !dbg !705
  %114 = load i32, ptr @N_robot_joints, align 4, !dbg !707
  %115 = sext i32 %114 to i64, !dbg !708
  %116 = getelementptr inbounds [1600 x %struct.jointpos], ptr @Robot_joints, i64 0, i64 %115, !dbg !708
  %117 = getelementptr inbounds nuw %struct.jointpos, ptr %116, i32 0, i32 0, !dbg !709
  store i16 %113, ptr %117, align 2, !dbg !710
  %118 = load ptr, ptr %6, align 8, !dbg !711
  %119 = load i32, ptr %9, align 4, !dbg !712
  %120 = sext i32 %119 to i64, !dbg !711
  %121 = getelementptr inbounds [10 x %struct.vms_angvec], ptr %118, i64 %120, !dbg !711
  %122 = load i32, ptr %7, align 4, !dbg !713
  %123 = sext i32 %122 to i64, !dbg !711
  %124 = getelementptr inbounds [10 x %struct.vms_angvec], ptr %121, i64 0, i64 %123, !dbg !711
  %125 = load i32, ptr @N_robot_joints, align 4, !dbg !714
  %126 = sext i32 %125 to i64, !dbg !715
  %127 = getelementptr inbounds [1600 x %struct.jointpos], ptr @Robot_joints, i64 0, i64 %126, !dbg !715
  %128 = getelementptr inbounds nuw %struct.jointpos, ptr %127, i32 0, i32 1, !dbg !716
  call void @llvm.memcpy.p0.p0.i64(ptr align 2 %128, ptr align 2 %124, i64 6, i1 false), !dbg !717
  %129 = load ptr, ptr %4, align 8, !dbg !718
  %130 = getelementptr inbounds nuw %struct.robot_info, ptr %129, i32 0, i32 50, !dbg !719
  %131 = load i32, ptr %8, align 4, !dbg !720
  %132 = sext i32 %131 to i64, !dbg !718
  %133 = getelementptr inbounds [9 x [5 x %struct.jointlist]], ptr %130, i64 0, i64 %132, !dbg !718
  %134 = load i32, ptr %9, align 4, !dbg !721
  %135 = sext i32 %134 to i64, !dbg !718
  %136 = getelementptr inbounds [5 x %struct.jointlist], ptr %133, i64 0, i64 %135, !dbg !718
  %137 = getelementptr inbounds nuw %struct.jointlist, ptr %136, i32 0, i32 0, !dbg !722
  %138 = load i16, ptr %137, align 4, !dbg !723
  %139 = add i16 %138, 1, !dbg !723
  store i16 %139, ptr %137, align 4, !dbg !723
  %140 = load i32, ptr @N_robot_joints, align 4, !dbg !724
  %141 = add nsw i32 %140, 1, !dbg !724
  store i32 %141, ptr @N_robot_joints, align 4, !dbg !724
  %142 = load i32, ptr @N_robot_joints, align 4, !dbg !725
  %143 = icmp slt i32 %142, 1600, !dbg !725
  %144 = zext i1 %143 to i32, !dbg !725
  call void @_Z7_AssertiPKcS0_i(i32 noundef %144, ptr noundef @.str.6, ptr noundef @.str.1, i32 noundef 372), !dbg !725
  br label %145, !dbg !726

145:                                              ; preds = %111, %104
  br label %146, !dbg !727

146:                                              ; preds = %145
  %147 = load i32, ptr %7, align 4, !dbg !728
  %148 = add nsw i32 %147, 1, !dbg !728
  store i32 %148, ptr %7, align 4, !dbg !728
  br label %98, !dbg !729, !llvm.loop !730

149:                                              ; preds = %98
  br label %150, !dbg !732

150:                                              ; preds = %149
  %151 = load i32, ptr %9, align 4, !dbg !733
  %152 = add nsw i32 %151, 1, !dbg !733
  store i32 %152, ptr %9, align 4, !dbg !733
  br label %74, !dbg !734, !llvm.loop !735

153:                                              ; preds = %74
  br label %154, !dbg !737

154:                                              ; preds = %153
  %155 = load i32, ptr %8, align 4, !dbg !738
  %156 = add nsw i32 %155, 1, !dbg !738
  store i32 %156, ptr %8, align 4, !dbg !738
  br label %65, !dbg !739, !llvm.loop !740

157:                                              ; preds = %65
  ret void, !dbg !742
}

attributes #0 = { mustprogress noinline ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

!llvm.module.flags = !{!236, !237, !238, !239, !240, !241, !242}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!243}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "N_robot_types", scope: !2, file: !7, line: 27, type: !8, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !3, producer: "Homebrew clang version 20.1.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !4, imports: !161, splitDebugInlining: false, nameTableKind: Apple, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk", sdk: "MacOSX15.sdk")
!3 = !DIFile(filename: "/Users/richard/code/ChocolateDescent/main_d2/robot.cpp", directory: "/Users/richard/code/ChocolateDescent/build-c-ref", checksumkind: CSK_MD5, checksum: "d0a0f372216f677e691784eacee030cc")
!4 = !{!0, !5, !9, !107, !124, !131, !136, !141, !146, !151, !156}
!5 = !DIGlobalVariableExpression(var: !6, expr: !DIExpression())
!6 = distinct !DIGlobalVariable(name: "N_robot_joints", scope: !2, file: !7, line: 28, type: !8, isLocal: false, isDefinition: true)
!7 = !DIFile(filename: "main_d2/robot.cpp", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "d0a0f372216f677e691784eacee030cc")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "Robot_info", scope: !2, file: !7, line: 31, type: !11, isLocal: false, isDefinition: true)
!11 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 326400, elements: !105)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "robot_info", file: !13, line: 128, baseType: !14)
!13 = !DIFile(filename: "main_d2/robot.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "7821ab73cbe058734a84802231002e5e")
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "robot_info", file: !13, line: 53, size: 3840, flags: DIFlagTypePassByValue, elements: !15, identifier: "_ZTS10robot_info")
!15 = !{!16, !17, !32, !37, !39, !40, !41, !42, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !64, !65, !66, !67, !68, !69, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !91, !92, !93, !94, !95, !104}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "model_num", scope: !14, file: !13, line: 55, baseType: !8, size: 32)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "gun_points", scope: !14, file: !13, line: 56, baseType: !18, size: 768, offset: 32)
!18 = !DICompositeType(tag: DW_TAG_array_type, baseType: !19, size: 768, elements: !30)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_vector", file: !20, line: 22, baseType: !21)
!20 = !DIFile(filename: "./vecmat/vecmat.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "dfa84e3325c1ea4f5f74699fff5ef2bf")
!21 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_vector", file: !20, line: 19, size: 96, flags: DIFlagTypePassByValue, elements: !22, identifier: "_ZTS10vms_vector")
!22 = !{!23, !28, !29}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !21, file: !20, line: 21, baseType: !24, size: 32)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "fix", file: !25, line: 20, baseType: !26)
!25 = !DIFile(filename: "./fix/fix.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "c5006a11bf8b4cb7d963898499eda13a")
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !27, line: 30, baseType: !8)
!27 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int32_t.h", directory: "", checksumkind: CSK_MD5, checksum: "d23e8406e80ee79983f28509c741fa17")
!28 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !21, file: !20, line: 21, baseType: !24, size: 32, offset: 32)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !21, file: !20, line: 21, baseType: !24, size: 32, offset: 64)
!30 = !{!31}
!31 = !DISubrange(count: 8)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "gun_submodels", scope: !14, file: !13, line: 57, baseType: !33, size: 64, offset: 800)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 64, elements: !30)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !35, line: 31, baseType: !36)
!35 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint8_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8b64ccf8c67b8c006b07b8daf1b49be5")
!36 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "exp1_vclip_num", scope: !14, file: !13, line: 59, baseType: !38, size: 16, offset: 864)
!38 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "exp1_sound_num", scope: !14, file: !13, line: 60, baseType: !38, size: 16, offset: 880)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "exp2_vclip_num", scope: !14, file: !13, line: 62, baseType: !38, size: 16, offset: 896)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "exp2_sound_num", scope: !14, file: !13, line: 63, baseType: !38, size: 16, offset: 912)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "weapon_type", scope: !14, file: !13, line: 65, baseType: !43, size: 8, offset: 928)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !44, line: 30, baseType: !45)
!44 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int8_t.h", directory: "", checksumkind: CSK_MD5, checksum: "5052dfe782b50fed2355b8f61a9e4fa9")
!45 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "weapon_type2", scope: !14, file: !13, line: 66, baseType: !43, size: 8, offset: 936)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "n_guns", scope: !14, file: !13, line: 67, baseType: !43, size: 8, offset: 944)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "contains_id", scope: !14, file: !13, line: 68, baseType: !43, size: 8, offset: 952)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "contains_count", scope: !14, file: !13, line: 70, baseType: !43, size: 8, offset: 960)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "contains_prob", scope: !14, file: !13, line: 71, baseType: !43, size: 8, offset: 968)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "contains_type", scope: !14, file: !13, line: 72, baseType: !43, size: 8, offset: 976)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "kamikaze", scope: !14, file: !13, line: 73, baseType: !43, size: 8, offset: 984)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "score_value", scope: !14, file: !13, line: 75, baseType: !38, size: 16, offset: 992)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "badass", scope: !14, file: !13, line: 76, baseType: !43, size: 8, offset: 1008)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "energy_drain", scope: !14, file: !13, line: 77, baseType: !43, size: 8, offset: 1016)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "lighting", scope: !14, file: !13, line: 79, baseType: !24, size: 32, offset: 1024)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "strength", scope: !14, file: !13, line: 80, baseType: !24, size: 32, offset: 1056)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "mass", scope: !14, file: !13, line: 82, baseType: !24, size: 32, offset: 1088)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "drag", scope: !14, file: !13, line: 83, baseType: !24, size: 32, offset: 1120)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "field_of_view", scope: !14, file: !13, line: 85, baseType: !61, size: 160, offset: 1152)
!61 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 160, elements: !62)
!62 = !{!63}
!63 = !DISubrange(count: 5)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "firing_wait", scope: !14, file: !13, line: 86, baseType: !61, size: 160, offset: 1312)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "firing_wait2", scope: !14, file: !13, line: 87, baseType: !61, size: 160, offset: 1472)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "turn_time", scope: !14, file: !13, line: 88, baseType: !61, size: 160, offset: 1632)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "max_speed", scope: !14, file: !13, line: 91, baseType: !61, size: 160, offset: 1792)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "circle_distance", scope: !14, file: !13, line: 92, baseType: !61, size: 160, offset: 1952)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "rapidfire_count", scope: !14, file: !13, line: 94, baseType: !70, size: 40, offset: 2112)
!70 = !DICompositeType(tag: DW_TAG_array_type, baseType: !43, size: 40, elements: !62)
!71 = !DIDerivedType(tag: DW_TAG_member, name: "evade_speed", scope: !14, file: !13, line: 95, baseType: !70, size: 40, offset: 2152)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "cloak_type", scope: !14, file: !13, line: 96, baseType: !43, size: 8, offset: 2192)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "attack_type", scope: !14, file: !13, line: 97, baseType: !43, size: 8, offset: 2200)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "see_sound", scope: !14, file: !13, line: 99, baseType: !34, size: 8, offset: 2208)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "attack_sound", scope: !14, file: !13, line: 100, baseType: !34, size: 8, offset: 2216)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "claw_sound", scope: !14, file: !13, line: 101, baseType: !34, size: 8, offset: 2224)
!77 = !DIDerivedType(tag: DW_TAG_member, name: "taunt_sound", scope: !14, file: !13, line: 102, baseType: !34, size: 8, offset: 2232)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "boss_flag", scope: !14, file: !13, line: 104, baseType: !43, size: 8, offset: 2240)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "companion", scope: !14, file: !13, line: 105, baseType: !43, size: 8, offset: 2248)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "smart_blobs", scope: !14, file: !13, line: 106, baseType: !43, size: 8, offset: 2256)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "energy_blobs", scope: !14, file: !13, line: 107, baseType: !43, size: 8, offset: 2264)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "thief", scope: !14, file: !13, line: 109, baseType: !43, size: 8, offset: 2272)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "pursuit", scope: !14, file: !13, line: 110, baseType: !43, size: 8, offset: 2280)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "lightcast", scope: !14, file: !13, line: 111, baseType: !43, size: 8, offset: 2288)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "death_roll", scope: !14, file: !13, line: 112, baseType: !43, size: 8, offset: 2296)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !14, file: !13, line: 115, baseType: !34, size: 8, offset: 2304)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "pad", scope: !14, file: !13, line: 116, baseType: !88, size: 24, offset: 2312)
!88 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 24, elements: !89)
!89 = !{!90}
!90 = !DISubrange(count: 3)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "deathroll_sound", scope: !14, file: !13, line: 118, baseType: !34, size: 8, offset: 2336)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "glow", scope: !14, file: !13, line: 119, baseType: !34, size: 8, offset: 2344)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "behavior", scope: !14, file: !13, line: 120, baseType: !34, size: 8, offset: 2352)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "aim", scope: !14, file: !13, line: 121, baseType: !34, size: 8, offset: 2360)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "anim_states", scope: !14, file: !13, line: 124, baseType: !96, size: 1440, offset: 2368)
!96 = !DICompositeType(tag: DW_TAG_array_type, baseType: !97, size: 1440, elements: !102)
!97 = !DIDerivedType(tag: DW_TAG_typedef, name: "jointlist", file: !13, line: 46, baseType: !98)
!98 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "jointlist", file: !13, line: 42, size: 32, flags: DIFlagTypePassByValue, elements: !99, identifier: "_ZTS9jointlist")
!99 = !{!100, !101}
!100 = !DIDerivedType(tag: DW_TAG_member, name: "n_joints", scope: !98, file: !13, line: 44, baseType: !38, size: 16)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "offset", scope: !98, file: !13, line: 45, baseType: !38, size: 16, offset: 16)
!102 = !{!103, !63}
!103 = !DISubrange(count: 9)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "always_0xabcd", scope: !14, file: !13, line: 126, baseType: !8, size: 32, offset: 3808)
!105 = !{!106}
!106 = !DISubrange(count: 85)
!107 = !DIGlobalVariableExpression(var: !108, expr: !DIExpression())
!108 = distinct !DIGlobalVariable(name: "Robot_joints", scope: !2, file: !7, line: 38, type: !109, isLocal: false, isDefinition: true)
!109 = !DICompositeType(tag: DW_TAG_array_type, baseType: !110, size: 102400, elements: !122)
!110 = !DIDerivedType(tag: DW_TAG_typedef, name: "jointpos", file: !13, line: 39, baseType: !111)
!111 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "jointpos", file: !13, line: 35, size: 64, flags: DIFlagTypePassByValue, elements: !112, identifier: "_ZTS8jointpos")
!112 = !{!113, !114}
!113 = !DIDerivedType(tag: DW_TAG_member, name: "jointnum", scope: !111, file: !13, line: 37, baseType: !38, size: 16)
!114 = !DIDerivedType(tag: DW_TAG_member, name: "angles", scope: !111, file: !13, line: 38, baseType: !115, size: 48, offset: 16)
!115 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_angvec", file: !20, line: 40, baseType: !116)
!116 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_angvec", file: !20, line: 37, size: 48, flags: DIFlagTypePassByValue, elements: !117, identifier: "_ZTS10vms_angvec")
!117 = !{!118, !120, !121}
!118 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !116, file: !20, line: 39, baseType: !119, size: 16)
!119 = !DIDerivedType(tag: DW_TAG_typedef, name: "fixang", file: !25, line: 21, baseType: !38)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !116, file: !20, line: 39, baseType: !119, size: 16, offset: 16)
!121 = !DIDerivedType(tag: DW_TAG_member, name: "h", scope: !116, file: !20, line: 39, baseType: !119, size: 16, offset: 32)
!122 = !{!123}
!123 = !DISubrange(count: 1600)
!124 = !DIGlobalVariableExpression(var: !125, expr: !DIExpression())
!125 = distinct !DIGlobalVariable(scope: null, file: !7, line: 97, type: !126, isLocal: true, isDefinition: true)
!126 = !DICompositeType(tag: DW_TAG_array_type, baseType: !127, size: 472, elements: !129)
!127 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !128)
!128 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!129 = !{!130}
!130 = !DISubrange(count: 59)
!131 = !DIGlobalVariableExpression(var: !132, expr: !DIExpression())
!132 = distinct !DIGlobalVariable(scope: null, file: !7, line: 97, type: !133, isLocal: true, isDefinition: true)
!133 = !DICompositeType(tag: DW_TAG_array_type, baseType: !127, size: 440, elements: !134)
!134 = !{!135}
!135 = !DISubrange(count: 55)
!136 = !DIGlobalVariableExpression(var: !137, expr: !DIExpression())
!137 = distinct !DIGlobalVariable(scope: null, file: !7, line: 98, type: !138, isLocal: true, isDefinition: true)
!138 = !DICompositeType(tag: DW_TAG_array_type, baseType: !127, size: 192, elements: !139)
!139 = !{!140}
!140 = !DISubrange(count: 24)
!141 = !DIGlobalVariableExpression(var: !142, expr: !DIExpression())
!142 = distinct !DIGlobalVariable(scope: null, file: !7, line: 105, type: !143, isLocal: true, isDefinition: true)
!143 = !DICompositeType(tag: DW_TAG_array_type, baseType: !127, size: 208, elements: !144)
!144 = !{!145}
!145 = !DISubrange(count: 26)
!146 = !DIGlobalVariableExpression(var: !147, expr: !DIExpression())
!147 = distinct !DIGlobalVariable(scope: null, file: !7, line: 170, type: !148, isLocal: true, isDefinition: true)
!148 = !DICompositeType(tag: DW_TAG_array_type, baseType: !127, size: 328, elements: !149)
!149 = !{!150}
!150 = !DISubrange(count: 41)
!151 = !DIGlobalVariableExpression(var: !152, expr: !DIExpression())
!152 = distinct !DIGlobalVariable(scope: null, file: !7, line: 220, type: !153, isLocal: true, isDefinition: true)
!153 = !DICompositeType(tag: DW_TAG_array_type, baseType: !127, size: 184, elements: !154)
!154 = !{!155}
!155 = !DISubrange(count: 23)
!156 = !DIGlobalVariableExpression(var: !157, expr: !DIExpression())
!157 = distinct !DIGlobalVariable(scope: null, file: !7, line: 372, type: !158, isLocal: true, isDefinition: true)
!158 = !DICompositeType(tag: DW_TAG_array_type, baseType: !127, size: 272, elements: !159)
!159 = !{!160}
!160 = !DISubrange(count: 34)
!161 = !{!162, !166, !169, !170, !174, !175, !179, !183, !187, !190, !192, !194, !196, !198, !200, !202, !204, !206, !208, !210, !212, !214, !216, !218, !220, !226, !230, !233}
!162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !43, file: !165, line: 158)
!163 = !DINamespace(name: "__1", scope: !164, exportSymbols: true)
!164 = !DINamespace(name: "std", scope: null)
!165 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdint", directory: "")
!166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !167, file: !165, line: 159)
!167 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !168, line: 30, baseType: !38)
!168 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int16_t.h", directory: "", checksumkind: CSK_MD5, checksum: "47ed3c3ac6f65bfec021ca2b7be18e7e")
!169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !26, file: !165, line: 160)
!170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !171, file: !165, line: 161)
!171 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !172, line: 30, baseType: !173)
!172 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int64_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e6d85c1a9e23dbf7518ce3b162aac800")
!173 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !34, file: !165, line: 163)
!175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !176, file: !165, line: 164)
!176 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !177, line: 31, baseType: !178)
!177 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint16_t.h", directory: "", checksumkind: CSK_MD5, checksum: "f0aa926da906b10566dd3171bf347ab7")
!178 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !180, file: !165, line: 165)
!180 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !181, line: 31, baseType: !182)
!181 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint32_t.h", directory: "", checksumkind: CSK_MD5, checksum: "0254eb80c6b9719ac45c3c1cf872109b")
!182 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !184, file: !165, line: 166)
!184 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !185, line: 31, baseType: !186)
!185 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint64_t.h", directory: "", checksumkind: CSK_MD5, checksum: "77fc5e91653260959605f129691cf9b1")
!186 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !188, file: !165, line: 168)
!188 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !189, line: 29, baseType: !43)
!189 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "042ceedaf4137a8aaa272d0b27434016")
!190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !191, file: !165, line: 169)
!191 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !189, line: 30, baseType: !167)
!192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !193, file: !165, line: 170)
!193 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !189, line: 31, baseType: !26)
!194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !195, file: !165, line: 171)
!195 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !189, line: 32, baseType: !171)
!196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !197, file: !165, line: 173)
!197 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !189, line: 33, baseType: !34)
!198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !199, file: !165, line: 174)
!199 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !189, line: 34, baseType: !176)
!200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !201, file: !165, line: 175)
!201 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !189, line: 35, baseType: !180)
!202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !203, file: !165, line: 176)
!203 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !189, line: 36, baseType: !184)
!204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !205, file: !165, line: 178)
!205 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !189, line: 40, baseType: !43)
!206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !207, file: !165, line: 179)
!207 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !189, line: 41, baseType: !167)
!208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !209, file: !165, line: 180)
!209 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !189, line: 42, baseType: !26)
!210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !211, file: !165, line: 181)
!211 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !189, line: 43, baseType: !171)
!212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !213, file: !165, line: 183)
!213 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !189, line: 44, baseType: !34)
!214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !215, file: !165, line: 184)
!215 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !189, line: 45, baseType: !176)
!216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !217, file: !165, line: 185)
!217 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !189, line: 46, baseType: !180)
!218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !219, file: !165, line: 186)
!219 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !189, line: 47, baseType: !184)
!220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !221, file: !165, line: 188)
!221 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !222, line: 32, baseType: !223)
!222 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_intptr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e478ba47270923b1cca6659f19f02db1")
!223 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_intptr_t", file: !224, line: 40, baseType: !225)
!224 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/arm/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "b270144f57ae258d0ce80b8f87be068c")
!225 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !227, file: !165, line: 189)
!227 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !228, line: 34, baseType: !229)
!228 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_uintptr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e70ae655dd1b9d4ae0b1dcc073f5b7e4")
!229 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !231, file: !165, line: 191)
!231 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !232, line: 32, baseType: !225)
!232 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_intmax_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e37b9240f30f486478152ef3989b1545")
!233 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !163, entity: !234, file: !165, line: 192)
!234 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !235, line: 32, baseType: !229)
!235 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uintmax_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8217a3fbb207d8e87ca5318c313e81c2")
!236 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 4]}
!237 = !{i32 7, !"Dwarf Version", i32 5}
!238 = !{i32 2, !"Debug Info Version", i32 3}
!239 = !{i32 1, !"wchar_size", i32 4}
!240 = !{i32 8, !"PIC Level", i32 2}
!241 = !{i32 7, !"uwtable", i32 1}
!242 = !{i32 7, !"frame-pointer", i32 1}
!243 = !{!"Homebrew clang version 20.1.8"}
!244 = distinct !DISubprogram(name: "calc_gun_point", linkageName: "_Z14calc_gun_pointP10vms_vectorP6objecti", scope: !7, file: !7, line: 89, type: !245, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !373)
!245 = !DISubroutineType(types: !246)
!246 = !{null, !247, !248, !8}
!247 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!248 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !249, size: 64)
!249 = !DIDerivedType(tag: DW_TAG_typedef, name: "object", file: !250, line: 259, baseType: !251)
!250 = !DIFile(filename: "main_d2/object.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "1f2325d356aae4b692933d2aae4f3afd")
!251 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "object", file: !250, line: 210, size: 2144, flags: DIFlagTypePassByValue, elements: !252, identifier: "_ZTS6object")
!252 = !{!253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !272, !273, !274, !275, !276, !277, !278, !279, !280, !297, !351}
!253 = !DIDerivedType(tag: DW_TAG_member, name: "signature", scope: !251, file: !250, line: 212, baseType: !8, size: 32)
!254 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !251, file: !250, line: 213, baseType: !34, size: 8, offset: 32)
!255 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !251, file: !250, line: 214, baseType: !34, size: 8, offset: 40)
!256 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !251, file: !250, line: 215, baseType: !38, size: 16, offset: 48)
!257 = !DIDerivedType(tag: DW_TAG_member, name: "prev", scope: !251, file: !250, line: 215, baseType: !38, size: 16, offset: 64)
!258 = !DIDerivedType(tag: DW_TAG_member, name: "control_type", scope: !251, file: !250, line: 216, baseType: !34, size: 8, offset: 80)
!259 = !DIDerivedType(tag: DW_TAG_member, name: "movement_type", scope: !251, file: !250, line: 217, baseType: !34, size: 8, offset: 88)
!260 = !DIDerivedType(tag: DW_TAG_member, name: "render_type", scope: !251, file: !250, line: 218, baseType: !34, size: 8, offset: 96)
!261 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !251, file: !250, line: 219, baseType: !34, size: 8, offset: 104)
!262 = !DIDerivedType(tag: DW_TAG_member, name: "segnum", scope: !251, file: !250, line: 220, baseType: !38, size: 16, offset: 112)
!263 = !DIDerivedType(tag: DW_TAG_member, name: "attached_obj", scope: !251, file: !250, line: 221, baseType: !38, size: 16, offset: 128)
!264 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !251, file: !250, line: 222, baseType: !19, size: 96, offset: 160)
!265 = !DIDerivedType(tag: DW_TAG_member, name: "orient", scope: !251, file: !250, line: 223, baseType: !266, size: 288, offset: 256)
!266 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_matrix", file: !20, line: 47, baseType: !267)
!267 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_matrix", file: !20, line: 44, size: 288, flags: DIFlagTypePassByValue, elements: !268, identifier: "_ZTS10vms_matrix")
!268 = !{!269, !270, !271}
!269 = !DIDerivedType(tag: DW_TAG_member, name: "rvec", scope: !267, file: !20, line: 46, baseType: !19, size: 96)
!270 = !DIDerivedType(tag: DW_TAG_member, name: "uvec", scope: !267, file: !20, line: 46, baseType: !19, size: 96, offset: 96)
!271 = !DIDerivedType(tag: DW_TAG_member, name: "fvec", scope: !267, file: !20, line: 46, baseType: !19, size: 96, offset: 192)
!272 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !251, file: !250, line: 224, baseType: !24, size: 32, offset: 544)
!273 = !DIDerivedType(tag: DW_TAG_member, name: "shields", scope: !251, file: !250, line: 225, baseType: !24, size: 32, offset: 576)
!274 = !DIDerivedType(tag: DW_TAG_member, name: "last_pos", scope: !251, file: !250, line: 226, baseType: !19, size: 96, offset: 608)
!275 = !DIDerivedType(tag: DW_TAG_member, name: "contains_type", scope: !251, file: !250, line: 227, baseType: !43, size: 8, offset: 704)
!276 = !DIDerivedType(tag: DW_TAG_member, name: "contains_id", scope: !251, file: !250, line: 228, baseType: !43, size: 8, offset: 712)
!277 = !DIDerivedType(tag: DW_TAG_member, name: "contains_count", scope: !251, file: !250, line: 229, baseType: !43, size: 8, offset: 720)
!278 = !DIDerivedType(tag: DW_TAG_member, name: "matcen_creator", scope: !251, file: !250, line: 230, baseType: !43, size: 8, offset: 728)
!279 = !DIDerivedType(tag: DW_TAG_member, name: "lifeleft", scope: !251, file: !250, line: 231, baseType: !24, size: 32, offset: 736)
!280 = !DIDerivedType(tag: DW_TAG_member, name: "mtype", scope: !251, file: !250, line: 240, baseType: !281, size: 512, offset: 768)
!281 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !251, file: !250, line: 236, size: 512, flags: DIFlagTypePassByValue, elements: !282, identifier: "_ZTSN6objectUt_E")
!282 = !{!283, !296}
!283 = !DIDerivedType(tag: DW_TAG_member, name: "phys_info", scope: !281, file: !250, line: 238, baseType: !284, size: 512)
!284 = !DIDerivedType(tag: DW_TAG_typedef, name: "physics_info", file: !250, line: 153, baseType: !285)
!285 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "physics_info", file: !250, line: 142, size: 512, flags: DIFlagTypePassByValue, elements: !286, identifier: "_ZTS12physics_info")
!286 = !{!287, !288, !289, !290, !291, !292, !293, !294, !295}
!287 = !DIDerivedType(tag: DW_TAG_member, name: "velocity", scope: !285, file: !250, line: 144, baseType: !19, size: 96)
!288 = !DIDerivedType(tag: DW_TAG_member, name: "thrust", scope: !285, file: !250, line: 145, baseType: !19, size: 96, offset: 96)
!289 = !DIDerivedType(tag: DW_TAG_member, name: "mass", scope: !285, file: !250, line: 146, baseType: !24, size: 32, offset: 192)
!290 = !DIDerivedType(tag: DW_TAG_member, name: "drag", scope: !285, file: !250, line: 147, baseType: !24, size: 32, offset: 224)
!291 = !DIDerivedType(tag: DW_TAG_member, name: "brakes", scope: !285, file: !250, line: 148, baseType: !24, size: 32, offset: 256)
!292 = !DIDerivedType(tag: DW_TAG_member, name: "rotvel", scope: !285, file: !250, line: 149, baseType: !19, size: 96, offset: 288)
!293 = !DIDerivedType(tag: DW_TAG_member, name: "rotthrust", scope: !285, file: !250, line: 150, baseType: !19, size: 96, offset: 384)
!294 = !DIDerivedType(tag: DW_TAG_member, name: "turnroll", scope: !285, file: !250, line: 151, baseType: !119, size: 16, offset: 480)
!295 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !285, file: !250, line: 152, baseType: !176, size: 16, offset: 496)
!296 = !DIDerivedType(tag: DW_TAG_member, name: "spin_rate", scope: !281, file: !250, line: 239, baseType: !19, size: 96)
!297 = !DIDerivedType(tag: DW_TAG_member, name: "ctype", scope: !251, file: !250, line: 250, baseType: !298, size: 256, offset: 1280)
!298 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !251, file: !250, line: 243, size: 256, flags: DIFlagTypePassByValue, elements: !299, identifier: "_ZTSN6objectUt0_E")
!299 = !{!300, !311, !321, !339, !344}
!300 = !DIDerivedType(tag: DW_TAG_member, name: "laser_info", scope: !298, file: !250, line: 245, baseType: !301, size: 160)
!301 = !DIDerivedType(tag: DW_TAG_typedef, name: "laser_info_t", file: !250, line: 166, baseType: !302)
!302 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "laser_info_s", file: !250, line: 157, size: 160, flags: DIFlagTypePassByValue, elements: !303, identifier: "_ZTS12laser_info_s")
!303 = !{!304, !305, !306, !307, !308, !309, !310}
!304 = !DIDerivedType(tag: DW_TAG_member, name: "parent_type", scope: !302, file: !250, line: 159, baseType: !38, size: 16)
!305 = !DIDerivedType(tag: DW_TAG_member, name: "parent_num", scope: !302, file: !250, line: 160, baseType: !38, size: 16, offset: 16)
!306 = !DIDerivedType(tag: DW_TAG_member, name: "parent_signature", scope: !302, file: !250, line: 161, baseType: !8, size: 32, offset: 32)
!307 = !DIDerivedType(tag: DW_TAG_member, name: "creation_time", scope: !302, file: !250, line: 162, baseType: !24, size: 32, offset: 64)
!308 = !DIDerivedType(tag: DW_TAG_member, name: "last_hitobj", scope: !302, file: !250, line: 163, baseType: !38, size: 16, offset: 96)
!309 = !DIDerivedType(tag: DW_TAG_member, name: "track_goal", scope: !302, file: !250, line: 164, baseType: !38, size: 16, offset: 112)
!310 = !DIDerivedType(tag: DW_TAG_member, name: "multiplier", scope: !302, file: !250, line: 165, baseType: !24, size: 32, offset: 128)
!311 = !DIDerivedType(tag: DW_TAG_member, name: "expl_info", scope: !298, file: !250, line: 246, baseType: !312, size: 128)
!312 = !DIDerivedType(tag: DW_TAG_typedef, name: "explosion_info", file: !250, line: 176, baseType: !313)
!313 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "explosion_info", file: !250, line: 168, size: 128, flags: DIFlagTypePassByValue, elements: !314, identifier: "_ZTS14explosion_info")
!314 = !{!315, !316, !317, !318, !319, !320}
!315 = !DIDerivedType(tag: DW_TAG_member, name: "spawn_time", scope: !313, file: !250, line: 170, baseType: !24, size: 32)
!316 = !DIDerivedType(tag: DW_TAG_member, name: "delete_time", scope: !313, file: !250, line: 171, baseType: !24, size: 32, offset: 32)
!317 = !DIDerivedType(tag: DW_TAG_member, name: "delete_objnum", scope: !313, file: !250, line: 172, baseType: !38, size: 16, offset: 64)
!318 = !DIDerivedType(tag: DW_TAG_member, name: "attach_parent", scope: !313, file: !250, line: 173, baseType: !38, size: 16, offset: 80)
!319 = !DIDerivedType(tag: DW_TAG_member, name: "prev_attach", scope: !313, file: !250, line: 174, baseType: !38, size: 16, offset: 96)
!320 = !DIDerivedType(tag: DW_TAG_member, name: "next_attach", scope: !313, file: !250, line: 175, baseType: !38, size: 16, offset: 112)
!321 = !DIDerivedType(tag: DW_TAG_member, name: "ai_info", scope: !298, file: !250, line: 247, baseType: !322, size: 256)
!322 = !DIDerivedType(tag: DW_TAG_typedef, name: "ai_static", file: !323, line: 144, baseType: !324)
!323 = !DIFile(filename: "main_d2/aistruct.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "d122430e792a0ddc0f9eaa08ad217628")
!324 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ai_static", file: !323, line: 127, size: 256, flags: DIFlagTypePassByValue, elements: !325, identifier: "_ZTS9ai_static")
!325 = !{!326, !327, !331, !332, !333, !334, !335, !336, !337, !338}
!326 = !DIDerivedType(tag: DW_TAG_member, name: "behavior", scope: !324, file: !323, line: 128, baseType: !34, size: 8)
!327 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !324, file: !323, line: 129, baseType: !328, size: 88, offset: 8)
!328 = !DICompositeType(tag: DW_TAG_array_type, baseType: !43, size: 88, elements: !329)
!329 = !{!330}
!330 = !DISubrange(count: 11)
!331 = !DIDerivedType(tag: DW_TAG_member, name: "hide_segment", scope: !324, file: !323, line: 130, baseType: !38, size: 16, offset: 96)
!332 = !DIDerivedType(tag: DW_TAG_member, name: "hide_index", scope: !324, file: !323, line: 131, baseType: !38, size: 16, offset: 112)
!333 = !DIDerivedType(tag: DW_TAG_member, name: "path_length", scope: !324, file: !323, line: 132, baseType: !38, size: 16, offset: 128)
!334 = !DIDerivedType(tag: DW_TAG_member, name: "cur_path_index", scope: !324, file: !323, line: 133, baseType: !43, size: 8, offset: 144)
!335 = !DIDerivedType(tag: DW_TAG_member, name: "dying_sound_playing", scope: !324, file: !323, line: 134, baseType: !43, size: 8, offset: 152)
!336 = !DIDerivedType(tag: DW_TAG_member, name: "danger_laser_num", scope: !324, file: !323, line: 139, baseType: !38, size: 16, offset: 160)
!337 = !DIDerivedType(tag: DW_TAG_member, name: "danger_laser_signature", scope: !324, file: !323, line: 140, baseType: !8, size: 32, offset: 192)
!338 = !DIDerivedType(tag: DW_TAG_member, name: "dying_start_time", scope: !324, file: !323, line: 141, baseType: !24, size: 32, offset: 224)
!339 = !DIDerivedType(tag: DW_TAG_member, name: "light_info", scope: !298, file: !250, line: 248, baseType: !340, size: 32)
!340 = !DIDerivedType(tag: DW_TAG_typedef, name: "light_info_t", file: !250, line: 181, baseType: !341)
!341 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "light_info_s", file: !250, line: 178, size: 32, flags: DIFlagTypePassByValue, elements: !342, identifier: "_ZTS12light_info_s")
!342 = !{!343}
!343 = !DIDerivedType(tag: DW_TAG_member, name: "intensity", scope: !341, file: !250, line: 180, baseType: !24, size: 32)
!344 = !DIDerivedType(tag: DW_TAG_member, name: "powerup_info", scope: !298, file: !250, line: 249, baseType: !345, size: 96)
!345 = !DIDerivedType(tag: DW_TAG_typedef, name: "powerup_info_t", file: !250, line: 190, baseType: !346)
!346 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "powerup_info_s", file: !250, line: 185, size: 96, flags: DIFlagTypePassByValue, elements: !347, identifier: "_ZTS14powerup_info_s")
!347 = !{!348, !349, !350}
!348 = !DIDerivedType(tag: DW_TAG_member, name: "count", scope: !346, file: !250, line: 187, baseType: !8, size: 32)
!349 = !DIDerivedType(tag: DW_TAG_member, name: "creation_time", scope: !346, file: !250, line: 188, baseType: !24, size: 32, offset: 32)
!350 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !346, file: !250, line: 189, baseType: !8, size: 32, offset: 64)
!351 = !DIDerivedType(tag: DW_TAG_member, name: "rtype", scope: !251, file: !250, line: 257, baseType: !352, size: 608, offset: 1536)
!352 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !251, file: !250, line: 253, size: 608, flags: DIFlagTypePassByValue, elements: !353, identifier: "_ZTSN6objectUt1_E")
!353 = !{!354, !366}
!354 = !DIDerivedType(tag: DW_TAG_member, name: "pobj_info", scope: !352, file: !250, line: 255, baseType: !355, size: 608)
!355 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyobj_info", file: !250, line: 208, baseType: !356)
!356 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "polyobj_info", file: !250, line: 201, size: 608, flags: DIFlagTypePassByValue, elements: !357, identifier: "_ZTS12polyobj_info")
!357 = !{!358, !359, !363, !364, !365}
!358 = !DIDerivedType(tag: DW_TAG_member, name: "model_num", scope: !356, file: !250, line: 203, baseType: !8, size: 32)
!359 = !DIDerivedType(tag: DW_TAG_member, name: "anim_angles", scope: !356, file: !250, line: 204, baseType: !360, size: 480, offset: 32)
!360 = !DICompositeType(tag: DW_TAG_array_type, baseType: !115, size: 480, elements: !361)
!361 = !{!362}
!362 = !DISubrange(count: 10)
!363 = !DIDerivedType(tag: DW_TAG_member, name: "subobj_flags", scope: !356, file: !250, line: 205, baseType: !8, size: 32, offset: 512)
!364 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_override", scope: !356, file: !250, line: 206, baseType: !8, size: 32, offset: 544)
!365 = !DIDerivedType(tag: DW_TAG_member, name: "alt_textures", scope: !356, file: !250, line: 207, baseType: !8, size: 32, offset: 576)
!366 = !DIDerivedType(tag: DW_TAG_member, name: "vclip_info", scope: !352, file: !250, line: 256, baseType: !367, size: 96)
!367 = !DIDerivedType(tag: DW_TAG_typedef, name: "vclip_info_t", file: !250, line: 197, baseType: !368)
!368 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vclip_info_s", file: !250, line: 192, size: 96, flags: DIFlagTypePassByValue, elements: !369, identifier: "_ZTS12vclip_info_s")
!369 = !{!370, !371, !372}
!370 = !DIDerivedType(tag: DW_TAG_member, name: "vclip_num", scope: !368, file: !250, line: 194, baseType: !8, size: 32)
!371 = !DIDerivedType(tag: DW_TAG_member, name: "frametime", scope: !368, file: !250, line: 195, baseType: !24, size: 32, offset: 32)
!372 = !DIDerivedType(tag: DW_TAG_member, name: "framenum", scope: !368, file: !250, line: 196, baseType: !43, size: 8, offset: 64)
!373 = !{}
!374 = !DILocalVariable(name: "gun_point", arg: 1, scope: !244, file: !7, line: 89, type: !247)
!375 = !DILocation(line: 89, column: 33, scope: !244)
!376 = !DILocalVariable(name: "obj", arg: 2, scope: !244, file: !7, line: 89, type: !248)
!377 = !DILocation(line: 89, column: 51, scope: !244)
!378 = !DILocalVariable(name: "gun_num", arg: 3, scope: !244, file: !7, line: 89, type: !8)
!379 = !DILocation(line: 89, column: 59, scope: !244)
!380 = !DILocalVariable(name: "pm", scope: !244, file: !7, line: 91, type: !381)
!381 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !382, size: 64)
!382 = !DIDerivedType(tag: DW_TAG_typedef, name: "polymodel", file: !383, line: 47, baseType: !384)
!383 = !DIFile(filename: "main_d2/polyobj.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "fc2424d85655305b90ac5cadd553f2e5")
!384 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "polymodel", file: !383, line: 28, size: 5952, flags: DIFlagTypePassByValue, elements: !385, identifier: "_ZTS9polymodel")
!385 = !{!386, !387, !388, !390, !392, !394, !395, !396, !398, !400, !401, !402, !403, !404, !405, !406, !407}
!386 = !DIDerivedType(tag: DW_TAG_member, name: "n_models", scope: !384, file: !383, line: 30, baseType: !8, size: 32)
!387 = !DIDerivedType(tag: DW_TAG_member, name: "model_data_size", scope: !384, file: !383, line: 31, baseType: !8, size: 32, offset: 32)
!388 = !DIDerivedType(tag: DW_TAG_member, name: "model_data", scope: !384, file: !383, line: 32, baseType: !389, size: 64, offset: 64)
!389 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!390 = !DIDerivedType(tag: DW_TAG_member, name: "submodel_ptrs", scope: !384, file: !383, line: 33, baseType: !391, size: 320, offset: 128)
!391 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 320, elements: !361)
!392 = !DIDerivedType(tag: DW_TAG_member, name: "submodel_offsets", scope: !384, file: !383, line: 34, baseType: !393, size: 960, offset: 448)
!393 = !DICompositeType(tag: DW_TAG_array_type, baseType: !19, size: 960, elements: !361)
!394 = !DIDerivedType(tag: DW_TAG_member, name: "submodel_norms", scope: !384, file: !383, line: 35, baseType: !393, size: 960, offset: 1408)
!395 = !DIDerivedType(tag: DW_TAG_member, name: "submodel_pnts", scope: !384, file: !383, line: 36, baseType: !393, size: 960, offset: 2368)
!396 = !DIDerivedType(tag: DW_TAG_member, name: "submodel_rads", scope: !384, file: !383, line: 37, baseType: !397, size: 320, offset: 3328)
!397 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 320, elements: !361)
!398 = !DIDerivedType(tag: DW_TAG_member, name: "submodel_parents", scope: !384, file: !383, line: 38, baseType: !399, size: 80, offset: 3648)
!399 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 80, elements: !361)
!400 = !DIDerivedType(tag: DW_TAG_member, name: "submodel_mins", scope: !384, file: !383, line: 39, baseType: !393, size: 960, offset: 3744)
!401 = !DIDerivedType(tag: DW_TAG_member, name: "submodel_maxs", scope: !384, file: !383, line: 40, baseType: !393, size: 960, offset: 4704)
!402 = !DIDerivedType(tag: DW_TAG_member, name: "mins", scope: !384, file: !383, line: 41, baseType: !19, size: 96, offset: 5664)
!403 = !DIDerivedType(tag: DW_TAG_member, name: "maxs", scope: !384, file: !383, line: 41, baseType: !19, size: 96, offset: 5760)
!404 = !DIDerivedType(tag: DW_TAG_member, name: "rad", scope: !384, file: !383, line: 42, baseType: !24, size: 32, offset: 5856)
!405 = !DIDerivedType(tag: DW_TAG_member, name: "n_textures", scope: !384, file: !383, line: 43, baseType: !34, size: 8, offset: 5888)
!406 = !DIDerivedType(tag: DW_TAG_member, name: "first_texture", scope: !384, file: !383, line: 44, baseType: !176, size: 16, offset: 5904)
!407 = !DIDerivedType(tag: DW_TAG_member, name: "simpler_model", scope: !384, file: !383, line: 45, baseType: !34, size: 8, offset: 5920)
!408 = !DILocation(line: 91, column: 13, scope: !244)
!409 = !DILocalVariable(name: "r", scope: !244, file: !7, line: 92, type: !410)
!410 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!411 = !DILocation(line: 92, column: 14, scope: !244)
!412 = !DILocalVariable(name: "pnt", scope: !244, file: !7, line: 93, type: !19)
!413 = !DILocation(line: 93, column: 13, scope: !244)
!414 = !DILocalVariable(name: "m", scope: !244, file: !7, line: 94, type: !266)
!415 = !DILocation(line: 94, column: 13, scope: !244)
!416 = !DILocalVariable(name: "mn", scope: !244, file: !7, line: 95, type: !8)
!417 = !DILocation(line: 95, column: 6, scope: !244)
!418 = !DILocation(line: 97, column: 2, scope: !244)
!419 = !DILocation(line: 98, column: 2, scope: !244)
!420 = !DILocation(line: 100, column: 18, scope: !244)
!421 = !DILocation(line: 100, column: 23, scope: !244)
!422 = !DILocation(line: 100, column: 7, scope: !244)
!423 = !DILocation(line: 100, column: 4, scope: !244)
!424 = !DILocation(line: 101, column: 22, scope: !244)
!425 = !DILocation(line: 101, column: 25, scope: !244)
!426 = !DILocation(line: 101, column: 7, scope: !244)
!427 = !DILocation(line: 101, column: 5, scope: !244)
!428 = !DILocation(line: 103, column: 6, scope: !429)
!429 = distinct !DILexicalBlock(scope: !244, file: !7, line: 103, column: 6)
!430 = !DILocation(line: 103, column: 17, scope: !429)
!431 = !DILocation(line: 103, column: 20, scope: !429)
!432 = !DILocation(line: 103, column: 14, scope: !429)
!433 = !DILocation(line: 105, column: 3, scope: !434)
!434 = distinct !DILexicalBlock(scope: !429, file: !7, line: 104, column: 2)
!435 = !DILocation(line: 107, column: 11, scope: !434)
!436 = !DILocation(line: 108, column: 2, scope: !434)
!437 = !DILocation(line: 112, column: 8, scope: !244)
!438 = !DILocation(line: 112, column: 11, scope: !244)
!439 = !DILocation(line: 112, column: 22, scope: !244)
!440 = !DILocation(line: 112, column: 6, scope: !244)
!441 = !DILocation(line: 113, column: 7, scope: !244)
!442 = !DILocation(line: 113, column: 10, scope: !244)
!443 = !DILocation(line: 113, column: 24, scope: !244)
!444 = !DILocation(line: 113, column: 5, scope: !244)
!445 = !DILocation(line: 146, column: 2, scope: !244)
!446 = !DILocation(line: 146, column: 9, scope: !244)
!447 = !DILocation(line: 146, column: 12, scope: !244)
!448 = !DILocalVariable(name: "tpnt", scope: !449, file: !7, line: 148, type: !19)
!449 = distinct !DILexicalBlock(scope: !244, file: !7, line: 147, column: 2)
!450 = !DILocation(line: 148, column: 14, scope: !449)
!451 = !DILocation(line: 150, column: 26, scope: !449)
!452 = !DILocation(line: 150, column: 31, scope: !449)
!453 = !DILocation(line: 150, column: 47, scope: !449)
!454 = !DILocation(line: 150, column: 59, scope: !449)
!455 = !DILocation(line: 150, column: 3, scope: !449)
!456 = !DILocation(line: 151, column: 3, scope: !449)
!457 = !DILocation(line: 152, column: 3, scope: !449)
!458 = !DILocation(line: 154, column: 26, scope: !449)
!459 = !DILocation(line: 154, column: 30, scope: !449)
!460 = !DILocation(line: 154, column: 47, scope: !449)
!461 = !DILocation(line: 154, column: 3, scope: !449)
!462 = !DILocation(line: 156, column: 8, scope: !449)
!463 = !DILocation(line: 156, column: 12, scope: !449)
!464 = !DILocation(line: 156, column: 29, scope: !449)
!465 = !DILocation(line: 156, column: 6, scope: !449)
!466 = distinct !{!466, !445, !467, !468}
!467 = !DILocation(line: 157, column: 2, scope: !244)
!468 = !{!"llvm.loop.mustprogress"}
!469 = !DILocation(line: 161, column: 31, scope: !244)
!470 = !DILocation(line: 161, column: 36, scope: !244)
!471 = !DILocation(line: 161, column: 2, scope: !244)
!472 = !DILocation(line: 162, column: 16, scope: !244)
!473 = !DILocation(line: 162, column: 2, scope: !244)
!474 = !DILocation(line: 163, column: 14, scope: !244)
!475 = !DILocation(line: 163, column: 25, scope: !244)
!476 = !DILocation(line: 163, column: 30, scope: !244)
!477 = !DILocation(line: 163, column: 2, scope: !244)
!478 = !DILocation(line: 164, column: 1, scope: !244)
!479 = distinct !DISubprogram(name: "robot_get_anim_state", linkageName: "_Z20robot_get_anim_statePP8jointposiii", scope: !7, file: !7, line: 168, type: !480, scopeLine: 169, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !373)
!480 = !DISubroutineType(types: !481)
!481 = !{!8, !482, !8, !8, !8}
!482 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !483, size: 64)
!483 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !110, size: 64)
!484 = !DILocalVariable(name: "jp_list_ptr", arg: 1, scope: !479, file: !7, line: 168, type: !482)
!485 = !DILocation(line: 168, column: 37, scope: !479)
!486 = !DILocalVariable(name: "robot_type", arg: 2, scope: !479, file: !7, line: 168, type: !8)
!487 = !DILocation(line: 168, column: 53, scope: !479)
!488 = !DILocalVariable(name: "gun_num", arg: 3, scope: !479, file: !7, line: 168, type: !8)
!489 = !DILocation(line: 168, column: 68, scope: !479)
!490 = !DILocalVariable(name: "state", arg: 4, scope: !479, file: !7, line: 168, type: !8)
!491 = !DILocation(line: 168, column: 80, scope: !479)
!492 = !DILocation(line: 170, column: 2, scope: !479)
!493 = !DILocation(line: 208, column: 42, scope: !479)
!494 = !DILocation(line: 208, column: 31, scope: !479)
!495 = !DILocation(line: 208, column: 54, scope: !479)
!496 = !DILocation(line: 208, column: 66, scope: !479)
!497 = !DILocation(line: 208, column: 75, scope: !479)
!498 = !DILocation(line: 208, column: 82, scope: !479)
!499 = !DILocation(line: 208, column: 18, scope: !479)
!500 = !DILocation(line: 208, column: 3, scope: !479)
!501 = !DILocation(line: 208, column: 15, scope: !479)
!502 = !DILocation(line: 209, column: 20, scope: !479)
!503 = !DILocation(line: 209, column: 9, scope: !479)
!504 = !DILocation(line: 209, column: 32, scope: !479)
!505 = !DILocation(line: 209, column: 44, scope: !479)
!506 = !DILocation(line: 209, column: 53, scope: !479)
!507 = !DILocation(line: 209, column: 60, scope: !479)
!508 = !DILocation(line: 209, column: 2, scope: !479)
!509 = distinct !DISubprogram(name: "set_robot_state", linkageName: "_Z15set_robot_stateP6objecti", scope: !7, file: !7, line: 214, type: !510, scopeLine: 215, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !373)
!510 = !DISubroutineType(types: !511)
!511 = !{null, !248, !8}
!512 = !DILocalVariable(name: "obj", arg: 1, scope: !509, file: !7, line: 214, type: !248)
!513 = !DILocation(line: 214, column: 30, scope: !509)
!514 = !DILocalVariable(name: "state", arg: 2, scope: !509, file: !7, line: 214, type: !8)
!515 = !DILocation(line: 214, column: 38, scope: !509)
!516 = !DILocalVariable(name: "g", scope: !509, file: !7, line: 216, type: !8)
!517 = !DILocation(line: 216, column: 6, scope: !509)
!518 = !DILocalVariable(name: "j", scope: !509, file: !7, line: 216, type: !8)
!519 = !DILocation(line: 216, column: 8, scope: !509)
!520 = !DILocalVariable(name: "jo", scope: !509, file: !7, line: 216, type: !8)
!521 = !DILocation(line: 216, column: 10, scope: !509)
!522 = !DILocalVariable(name: "ri", scope: !509, file: !7, line: 217, type: !410)
!523 = !DILocation(line: 217, column: 14, scope: !509)
!524 = !DILocalVariable(name: "jl", scope: !509, file: !7, line: 218, type: !525)
!525 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!526 = !DILocation(line: 218, column: 13, scope: !509)
!527 = !DILocation(line: 220, column: 2, scope: !509)
!528 = !DILocation(line: 222, column: 19, scope: !509)
!529 = !DILocation(line: 222, column: 24, scope: !509)
!530 = !DILocation(line: 222, column: 8, scope: !509)
!531 = !DILocation(line: 222, column: 5, scope: !509)
!532 = !DILocation(line: 266, column: 8, scope: !533)
!533 = distinct !DILexicalBlock(scope: !509, file: !7, line: 266, column: 2)
!534 = !DILocation(line: 266, column: 7, scope: !533)
!535 = !DILocation(line: 266, column: 11, scope: !536)
!536 = distinct !DILexicalBlock(scope: !533, file: !7, line: 266, column: 2)
!537 = !DILocation(line: 266, column: 13, scope: !536)
!538 = !DILocation(line: 266, column: 17, scope: !536)
!539 = !DILocation(line: 266, column: 23, scope: !536)
!540 = !DILocation(line: 266, column: 12, scope: !536)
!541 = !DILocation(line: 266, column: 2, scope: !533)
!542 = !DILocation(line: 268, column: 9, scope: !543)
!543 = distinct !DILexicalBlock(scope: !536, file: !7, line: 267, column: 2)
!544 = !DILocation(line: 268, column: 13, scope: !543)
!545 = !DILocation(line: 268, column: 25, scope: !543)
!546 = !DILocation(line: 268, column: 28, scope: !543)
!547 = !DILocation(line: 268, column: 6, scope: !543)
!548 = !DILocation(line: 270, column: 8, scope: !543)
!549 = !DILocation(line: 270, column: 12, scope: !543)
!550 = !DILocation(line: 270, column: 6, scope: !543)
!551 = !DILocation(line: 272, column: 9, scope: !552)
!552 = distinct !DILexicalBlock(scope: !543, file: !7, line: 272, column: 3)
!553 = !DILocation(line: 272, column: 8, scope: !552)
!554 = !DILocation(line: 272, column: 12, scope: !555)
!555 = distinct !DILexicalBlock(scope: !552, file: !7, line: 272, column: 3)
!556 = !DILocation(line: 272, column: 14, scope: !555)
!557 = !DILocation(line: 272, column: 18, scope: !555)
!558 = !DILocation(line: 272, column: 13, scope: !555)
!559 = !DILocation(line: 272, column: 3, scope: !552)
!560 = !DILocalVariable(name: "jn", scope: !561, file: !7, line: 274, type: !8)
!561 = distinct !DILexicalBlock(scope: !555, file: !7, line: 273, column: 3)
!562 = !DILocation(line: 274, column: 8, scope: !561)
!563 = !DILocation(line: 276, column: 22, scope: !561)
!564 = !DILocation(line: 276, column: 9, scope: !561)
!565 = !DILocation(line: 276, column: 26, scope: !561)
!566 = !DILocation(line: 276, column: 7, scope: !561)
!567 = !DILocation(line: 278, column: 56, scope: !561)
!568 = !DILocation(line: 278, column: 43, scope: !561)
!569 = !DILocation(line: 278, column: 60, scope: !561)
!570 = !DILocation(line: 278, column: 4, scope: !561)
!571 = !DILocation(line: 278, column: 9, scope: !561)
!572 = !DILocation(line: 278, column: 25, scope: !561)
!573 = !DILocation(line: 278, column: 37, scope: !561)
!574 = !DILocation(line: 278, column: 41, scope: !561)
!575 = !DILocation(line: 280, column: 3, scope: !561)
!576 = !DILocation(line: 272, column: 28, scope: !555)
!577 = !DILocation(line: 272, column: 33, scope: !555)
!578 = !DILocation(line: 272, column: 3, scope: !555)
!579 = distinct !{!579, !559, !580, !468}
!580 = !DILocation(line: 280, column: 3, scope: !552)
!581 = !DILocation(line: 281, column: 2, scope: !543)
!582 = !DILocation(line: 266, column: 27, scope: !536)
!583 = !DILocation(line: 266, column: 2, scope: !536)
!584 = distinct !{!584, !541, !585, !468}
!585 = !DILocation(line: 281, column: 2, scope: !533)
!586 = !DILocation(line: 282, column: 1, scope: !509)
!587 = distinct !DISubprogram(name: "robot_set_angles", linkageName: "_Z16robot_set_anglesP10robot_infoP9polymodelPA10_10vms_angvec", scope: !7, file: !7, line: 288, type: !588, scopeLine: 289, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !373)
!588 = !DISubroutineType(types: !589)
!589 = !{null, !410, !381, !590}
!590 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !360, size: 64)
!591 = !DILocalVariable(name: "r", arg: 1, scope: !587, file: !7, line: 288, type: !410)
!592 = !DILocation(line: 288, column: 35, scope: !587)
!593 = !DILocalVariable(name: "pm", arg: 2, scope: !587, file: !7, line: 288, type: !381)
!594 = !DILocation(line: 288, column: 48, scope: !587)
!595 = !DILocalVariable(name: "angs", arg: 3, scope: !587, file: !7, line: 288, type: !590)
!596 = !DILocation(line: 288, column: 62, scope: !587)
!597 = !DILocalVariable(name: "m", scope: !587, file: !7, line: 290, type: !8)
!598 = !DILocation(line: 290, column: 6, scope: !587)
!599 = !DILocalVariable(name: "g", scope: !587, file: !7, line: 290, type: !8)
!600 = !DILocation(line: 290, column: 8, scope: !587)
!601 = !DILocalVariable(name: "state", scope: !587, file: !7, line: 290, type: !8)
!602 = !DILocation(line: 290, column: 10, scope: !587)
!603 = !DILocalVariable(name: "gun_nums", scope: !587, file: !7, line: 291, type: !391)
!604 = !DILocation(line: 291, column: 6, scope: !587)
!605 = !DILocation(line: 336, column: 8, scope: !606)
!606 = distinct !DILexicalBlock(scope: !587, file: !7, line: 336, column: 2)
!607 = !DILocation(line: 336, column: 7, scope: !606)
!608 = !DILocation(line: 336, column: 11, scope: !609)
!609 = distinct !DILexicalBlock(scope: !606, file: !7, line: 336, column: 2)
!610 = !DILocation(line: 336, column: 13, scope: !609)
!611 = !DILocation(line: 336, column: 17, scope: !609)
!612 = !DILocation(line: 336, column: 12, scope: !609)
!613 = !DILocation(line: 336, column: 2, scope: !606)
!614 = !DILocation(line: 337, column: 17, scope: !609)
!615 = !DILocation(line: 337, column: 20, scope: !609)
!616 = !DILocation(line: 337, column: 12, scope: !609)
!617 = !DILocation(line: 337, column: 3, scope: !609)
!618 = !DILocation(line: 337, column: 15, scope: !609)
!619 = !DILocation(line: 336, column: 27, scope: !609)
!620 = !DILocation(line: 336, column: 2, scope: !609)
!621 = distinct !{!621, !613, !622, !468}
!622 = !DILocation(line: 337, column: 20, scope: !606)
!623 = !DILocation(line: 339, column: 2, scope: !587)
!624 = !DILocation(line: 339, column: 14, scope: !587)
!625 = !DILocation(line: 341, column: 8, scope: !626)
!626 = distinct !DILexicalBlock(scope: !587, file: !7, line: 341, column: 2)
!627 = !DILocation(line: 341, column: 7, scope: !626)
!628 = !DILocation(line: 341, column: 11, scope: !629)
!629 = distinct !DILexicalBlock(scope: !626, file: !7, line: 341, column: 2)
!630 = !DILocation(line: 341, column: 13, scope: !629)
!631 = !DILocation(line: 341, column: 16, scope: !629)
!632 = !DILocation(line: 341, column: 12, scope: !629)
!633 = !DILocation(line: 341, column: 2, scope: !626)
!634 = !DILocation(line: 343, column: 7, scope: !635)
!635 = distinct !DILexicalBlock(scope: !629, file: !7, line: 342, column: 2)
!636 = !DILocation(line: 343, column: 10, scope: !635)
!637 = !DILocation(line: 343, column: 24, scope: !635)
!638 = !DILocation(line: 343, column: 5, scope: !635)
!639 = !DILocation(line: 345, column: 3, scope: !635)
!640 = !DILocation(line: 345, column: 10, scope: !635)
!641 = !DILocation(line: 345, column: 12, scope: !635)
!642 = !DILocation(line: 347, column: 18, scope: !643)
!643 = distinct !DILexicalBlock(scope: !635, file: !7, line: 346, column: 3)
!644 = !DILocation(line: 347, column: 13, scope: !643)
!645 = !DILocation(line: 347, column: 4, scope: !643)
!646 = !DILocation(line: 347, column: 16, scope: !643)
!647 = !DILocation(line: 348, column: 8, scope: !643)
!648 = !DILocation(line: 348, column: 12, scope: !643)
!649 = !DILocation(line: 348, column: 29, scope: !643)
!650 = !DILocation(line: 348, column: 6, scope: !643)
!651 = distinct !{!651, !639, !652, !468}
!652 = !DILocation(line: 349, column: 3, scope: !635)
!653 = !DILocation(line: 350, column: 2, scope: !635)
!654 = !DILocation(line: 341, column: 24, scope: !629)
!655 = !DILocation(line: 341, column: 2, scope: !629)
!656 = distinct !{!656, !633, !657, !468}
!657 = !DILocation(line: 350, column: 2, scope: !626)
!658 = !DILocation(line: 352, column: 8, scope: !659)
!659 = distinct !DILexicalBlock(scope: !587, file: !7, line: 352, column: 2)
!660 = !DILocation(line: 352, column: 7, scope: !659)
!661 = !DILocation(line: 352, column: 11, scope: !662)
!662 = distinct !DILexicalBlock(scope: !659, file: !7, line: 352, column: 2)
!663 = !DILocation(line: 352, column: 13, scope: !662)
!664 = !DILocation(line: 352, column: 16, scope: !662)
!665 = !DILocation(line: 352, column: 22, scope: !662)
!666 = !DILocation(line: 352, column: 12, scope: !662)
!667 = !DILocation(line: 352, column: 2, scope: !659)
!668 = !DILocation(line: 356, column: 13, scope: !669)
!669 = distinct !DILexicalBlock(scope: !670, file: !7, line: 356, column: 3)
!670 = distinct !DILexicalBlock(scope: !662, file: !7, line: 353, column: 2)
!671 = !DILocation(line: 356, column: 8, scope: !669)
!672 = !DILocation(line: 356, column: 16, scope: !673)
!673 = distinct !DILexicalBlock(scope: !669, file: !7, line: 356, column: 3)
!674 = !DILocation(line: 356, column: 21, scope: !673)
!675 = !DILocation(line: 356, column: 3, scope: !669)
!676 = !DILocation(line: 360, column: 4, scope: !677)
!677 = distinct !DILexicalBlock(scope: !673, file: !7, line: 357, column: 3)
!678 = !DILocation(line: 360, column: 7, scope: !677)
!679 = !DILocation(line: 360, column: 19, scope: !677)
!680 = !DILocation(line: 360, column: 22, scope: !677)
!681 = !DILocation(line: 360, column: 29, scope: !677)
!682 = !DILocation(line: 360, column: 38, scope: !677)
!683 = !DILocation(line: 361, column: 38, scope: !677)
!684 = !DILocation(line: 361, column: 4, scope: !677)
!685 = !DILocation(line: 361, column: 7, scope: !677)
!686 = !DILocation(line: 361, column: 19, scope: !677)
!687 = !DILocation(line: 361, column: 22, scope: !677)
!688 = !DILocation(line: 361, column: 29, scope: !677)
!689 = !DILocation(line: 361, column: 36, scope: !677)
!690 = !DILocation(line: 363, column: 10, scope: !691)
!691 = distinct !DILexicalBlock(scope: !677, file: !7, line: 363, column: 4)
!692 = !DILocation(line: 363, column: 9, scope: !691)
!693 = !DILocation(line: 363, column: 13, scope: !694)
!694 = distinct !DILexicalBlock(scope: !691, file: !7, line: 363, column: 4)
!695 = !DILocation(line: 363, column: 15, scope: !694)
!696 = !DILocation(line: 363, column: 19, scope: !694)
!697 = !DILocation(line: 363, column: 14, scope: !694)
!698 = !DILocation(line: 363, column: 4, scope: !691)
!699 = !DILocation(line: 365, column: 18, scope: !700)
!700 = distinct !DILexicalBlock(scope: !701, file: !7, line: 365, column: 9)
!701 = distinct !DILexicalBlock(scope: !694, file: !7, line: 364, column: 4)
!702 = !DILocation(line: 365, column: 9, scope: !700)
!703 = !DILocation(line: 365, column: 24, scope: !700)
!704 = !DILocation(line: 365, column: 21, scope: !700)
!705 = !DILocation(line: 368, column: 46, scope: !706)
!706 = distinct !DILexicalBlock(scope: !700, file: !7, line: 366, column: 5)
!707 = !DILocation(line: 368, column: 19, scope: !706)
!708 = !DILocation(line: 368, column: 6, scope: !706)
!709 = !DILocation(line: 368, column: 35, scope: !706)
!710 = !DILocation(line: 368, column: 44, scope: !706)
!711 = !DILocation(line: 369, column: 44, scope: !706)
!712 = !DILocation(line: 369, column: 49, scope: !706)
!713 = !DILocation(line: 369, column: 56, scope: !706)
!714 = !DILocation(line: 369, column: 19, scope: !706)
!715 = !DILocation(line: 369, column: 6, scope: !706)
!716 = !DILocation(line: 369, column: 35, scope: !706)
!717 = !DILocation(line: 369, column: 42, scope: !706)
!718 = !DILocation(line: 370, column: 6, scope: !706)
!719 = !DILocation(line: 370, column: 9, scope: !706)
!720 = !DILocation(line: 370, column: 21, scope: !706)
!721 = !DILocation(line: 370, column: 24, scope: !706)
!722 = !DILocation(line: 370, column: 31, scope: !706)
!723 = !DILocation(line: 370, column: 39, scope: !706)
!724 = !DILocation(line: 371, column: 20, scope: !706)
!725 = !DILocation(line: 372, column: 6, scope: !706)
!726 = !DILocation(line: 373, column: 5, scope: !706)
!727 = !DILocation(line: 374, column: 4, scope: !701)
!728 = !DILocation(line: 363, column: 29, scope: !694)
!729 = !DILocation(line: 363, column: 4, scope: !694)
!730 = distinct !{!730, !698, !731, !468}
!731 = !DILocation(line: 374, column: 4, scope: !691)
!732 = !DILocation(line: 375, column: 3, scope: !677)
!733 = !DILocation(line: 356, column: 41, scope: !673)
!734 = !DILocation(line: 356, column: 3, scope: !673)
!735 = distinct !{!735, !675, !736, !468}
!736 = !DILocation(line: 375, column: 3, scope: !669)
!737 = !DILocation(line: 376, column: 2, scope: !670)
!738 = !DILocation(line: 352, column: 26, scope: !662)
!739 = !DILocation(line: 352, column: 2, scope: !662)
!740 = distinct !{!740, !667, !741, !468}
!741 = !DILocation(line: 376, column: 2, scope: !659)
!742 = !DILocation(line: 377, column: 1, scope: !587)
