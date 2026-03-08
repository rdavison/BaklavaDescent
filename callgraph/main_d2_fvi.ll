; ModuleID = '/Users/richard/code/ChocolateDescent/main_d2/fvi.cpp'
source_filename = "/Users/richard/code/ChocolateDescent/main_d2/fvi.cpp"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

%struct.vms_vector = type { i32, i32, i32 }
%struct.segment = type { [6 x %struct.side], [6 x i16], [8 x i16], i32 }
%struct.side = type { i8, i8, i16, i16, i16, [4 x %struct.uvl], [2 x %struct.vms_vector] }
%struct.uvl = type { i32, i32, i32 }
%struct.robot_info = type { i32, [8 x %struct.vms_vector], [8 x i8], i16, i16, i16, i16, i8, i8, i8, i8, i8, i8, i8, i8, i16, i8, i8, i32, i32, i32, i32, [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i8], [5 x i8], i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, [3 x i8], i8, i8, i8, i8, [9 x [5 x %struct.jointlist]], i32 }
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
%struct.player = type { [9 x i8], [4 x i8], i16, i8, i32, i32, i32, i32, i32, i32, i8, i8, i8, i8, i16, i16, i16, [10 x i16], [10 x i16], i16, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i16, i8, i8, i32, i8, i8 }
%struct._grs_bitmap = type { i16, i16, i16, i16, i8, i8, i16, ptr, i16, i8, i8 }
%struct.bitmap_index = type { i16 }
%struct.vms_vector_array = type { [3 x i32] }
%struct.vec2d = type { i32, i32 }
%"struct.std::__1::__less" = type { i8 }
%struct.laser_info_s = type { i16, i16, i32, i32, i16, i16, i32 }
%struct.segmasks = type { i16, i8, i8 }
%struct.fvi_query = type { ptr, ptr, i32, i32, i16, ptr, i32 }
%struct.fvi_info = type { i32, %struct.vms_vector, i32, i32, i32, i32, %struct.vms_vector, i32, [100 x i32] }

@.str = private unnamed_addr constant [8 x i8] c"k<=f1_0\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [53 x i8] c"/Users/richard/code/ChocolateDescent/main_d2/fvi.cpp\00", align 1, !dbg !8
@ij_table = global [3 x [2 x i32]] [[2 x i32] [i32 2, i32 1], [2 x i32] [i32 0, i32 2], [2 x i32] [i32 1, i32 0]], align 4, !dbg !13
@Vertices = external global [0 x %struct.vms_vector], align 4
@Segments = external global [0 x %struct.segment], align 4
@.str.2 = private unnamed_addr constant [37 x i8] c"segnum == -1 in check_line_to_face()\00", align 1, !dbg !38
@disable_new_fvi_stuff = global i32 0, align 4, !dbg !43
@.str.3 = private unnamed_addr constant [45 x i8] c"segnum == -1 in special_check_line_to_face()\00", align 1, !dbg !45
@Robot_info = external global [0 x %struct.robot_info], align 4
@Game_mode = external global i32, align 4
@n_segs_visited = global i32 0, align 4, !dbg !50
@segs_visited = global [100 x i16] zeroinitializer, align 2, !dbg !52
@fvi_nest_count = global i32 0, align 4, !dbg !58
@fvi_hit_object = global i32 0, align 4, !dbg !60
@fvi_hit_seg = global i32 0, align 4, !dbg !62
@fvi_hit_side = global i32 0, align 4, !dbg !64
@fvi_hit_side_seg = global i32 0, align 4, !dbg !66
@wall_norm = global %struct.vms_vector zeroinitializer, align 4, !dbg !68
@fvi_hit_seg2 = global i32 0, align 4, !dbg !76
@.str.4 = private unnamed_addr constant [35 x i8] c"fq->ignore_obj_list != (int *)(-1)\00", align 1, !dbg !78
@Highest_segment_index = external global i32, align 4
@.str.5 = private unnamed_addr constant [63 x i8] c"(fq->startseg <= Highest_segment_index) && (fq->startseg >= 0)\00", align 1, !dbg !83
@.str.6 = private unnamed_addr constant [46 x i8] c"!(hit_type==HIT_OBJECT && fvi_hit_object==-1)\00", align 1, !dbg !88
@Objects = external global [0 x %struct.object], align 4
@CollisionResult = external global [16 x [16 x i8]], align 1
@.str.7 = private unnamed_addr constant [19 x i8] c"fvi_hit_object!=-1\00", align 1, !dbg !93
@Players = external global [12 x %struct.player], align 4
@Player_num = external global i32, align 4
@Physics_cheat_flag = external global i32, align 4
@.str.8 = private unnamed_addr constant [23 x i8] c"*n_segs < MAX_FVI_SEGS\00", align 1, !dbg !98
@.str.9 = private unnamed_addr constant [39 x i8] c"Bad segnum (%d) in find_hitpoint_uv()\0A\00", align 1, !dbg !103
@.str.10 = private unnamed_addr constant [35 x i8] c"segnum == -1 in find_hitpoint_uv()\00", align 1, !dbg !108
@GameBitmaps = external global [2620 x %struct._grs_bitmap], align 8
@Textures = external global [1200 x %struct.bitmap_index], align 2
@.str.11 = private unnamed_addr constant [41 x i8] c"segnum == -1 in sphere_intersects_wall()\00", align 1, !dbg !110

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define noundef i32 @_Z11oflow_checkii(i32 noundef %0, i32 noundef %1) #0 !dbg !1376 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !1380, !DIExpression(), !1381)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !1382, !DIExpression(), !1383)
    #dbg_declare(ptr %5, !1384, !DIExpression(), !1385)
  %6 = load i32, ptr %3, align 4, !dbg !1386
  %7 = call i32 @llvm.abs.i32(i32 %6, i1 true), !dbg !1387
  %8 = sext i32 %7 to i64, !dbg !1387
  %9 = load i32, ptr %4, align 4, !dbg !1388
  %10 = call i32 @llvm.abs.i32(i32 %9, i1 true), !dbg !1389
  %11 = sext i32 %10 to i64, !dbg !1389
  %12 = mul nsw i64 %8, %11, !dbg !1390
  store i64 %12, ptr %5, align 8, !dbg !1385
  %13 = load i64, ptr %5, align 8, !dbg !1391
  %14 = ashr i64 %13, 47, !dbg !1392
  %15 = icmp ne i64 %14, 0, !dbg !1393
  %16 = zext i1 %15 to i64, !dbg !1393
  %17 = select i1 %15, i32 1, i32 0, !dbg !1393
  ret i32 %17, !dbg !1394
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.abs.i32(i32, i1 immarg) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z28find_plane_line_intersectionP10vms_vectorS0_S0_S0_S0_i(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef %5) #2 !dbg !1395 {
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca %struct.vms_vector, align 4
  %15 = alloca %struct.vms_vector, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  store ptr %0, ptr %8, align 8
    #dbg_declare(ptr %8, !1399, !DIExpression(), !1400)
  store ptr %1, ptr %9, align 8
    #dbg_declare(ptr %9, !1401, !DIExpression(), !1402)
  store ptr %2, ptr %10, align 8
    #dbg_declare(ptr %10, !1403, !DIExpression(), !1404)
  store ptr %3, ptr %11, align 8
    #dbg_declare(ptr %11, !1405, !DIExpression(), !1406)
  store ptr %4, ptr %12, align 8
    #dbg_declare(ptr %12, !1407, !DIExpression(), !1408)
  store i32 %5, ptr %13, align 4
    #dbg_declare(ptr %13, !1409, !DIExpression(), !1410)
    #dbg_declare(ptr %14, !1411, !DIExpression(), !1412)
    #dbg_declare(ptr %15, !1413, !DIExpression(), !1414)
    #dbg_declare(ptr %16, !1415, !DIExpression(), !1416)
    #dbg_declare(ptr %17, !1417, !DIExpression(), !1418)
  %19 = load ptr, ptr %12, align 8, !dbg !1419
  %20 = load ptr, ptr %11, align 8, !dbg !1420
  %21 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %14, ptr noundef %19, ptr noundef %20), !dbg !1421
  %22 = load ptr, ptr %11, align 8, !dbg !1422
  %23 = load ptr, ptr %9, align 8, !dbg !1423
  %24 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %15, ptr noundef %22, ptr noundef %23), !dbg !1424
  %25 = load ptr, ptr %10, align 8, !dbg !1425
  %26 = call noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef %25, ptr noundef %15), !dbg !1425
  store i32 %26, ptr %16, align 4, !dbg !1426
  %27 = load ptr, ptr %10, align 8, !dbg !1427
  %28 = call noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef %27, ptr noundef %14), !dbg !1427
  %29 = sub nsw i32 0, %28, !dbg !1428
  store i32 %29, ptr %17, align 4, !dbg !1429
  %30 = load i32, ptr %13, align 4, !dbg !1430
  %31 = load i32, ptr %16, align 4, !dbg !1431
  %32 = sub nsw i32 %31, %30, !dbg !1431
  store i32 %32, ptr %16, align 4, !dbg !1431
  %33 = load i32, ptr %17, align 4, !dbg !1432
  %34 = icmp eq i32 %33, 0, !dbg !1434
  br i1 %34, label %55, label %35, !dbg !1435

35:                                               ; preds = %6
  %36 = load i32, ptr %17, align 4, !dbg !1436
  %37 = icmp sgt i32 %36, 0, !dbg !1437
  br i1 %37, label %38, label %48, !dbg !1438

38:                                               ; preds = %35
  %39 = load i32, ptr %16, align 4, !dbg !1439
  %40 = load i32, ptr %17, align 4, !dbg !1440
  %41 = icmp sgt i32 %39, %40, !dbg !1441
  br i1 %41, label %55, label %42, !dbg !1442

42:                                               ; preds = %38
  %43 = load i32, ptr %16, align 4, !dbg !1443
  %44 = sub nsw i32 0, %43, !dbg !1444
  %45 = ashr i32 %44, 15, !dbg !1445
  %46 = load i32, ptr %17, align 4, !dbg !1446
  %47 = icmp sge i32 %45, %46, !dbg !1447
  br i1 %47, label %55, label %48, !dbg !1448

48:                                               ; preds = %42, %35
  %49 = load i32, ptr %17, align 4, !dbg !1449
  %50 = icmp slt i32 %49, 0, !dbg !1450
  br i1 %50, label %51, label %56, !dbg !1451

51:                                               ; preds = %48
  %52 = load i32, ptr %16, align 4, !dbg !1452
  %53 = load i32, ptr %17, align 4, !dbg !1453
  %54 = icmp slt i32 %52, %53, !dbg !1454
  br i1 %54, label %55, label %56, !dbg !1448

55:                                               ; preds = %51, %42, %38, %6
  store i32 0, ptr %7, align 4, !dbg !1455
  br label %98, !dbg !1455

56:                                               ; preds = %51, %48
    #dbg_declare(ptr %18, !1456, !DIExpression(), !1458)
  %57 = load i32, ptr %16, align 4, !dbg !1459
  %58 = sext i32 %57 to i64, !dbg !1459
  %59 = call i64 @llvm.abs.i64(i64 %58, i1 true), !dbg !1461
  %60 = sdiv i64 %59, 32768, !dbg !1462
  %61 = load i32, ptr %17, align 4, !dbg !1463
  %62 = sext i32 %61 to i64, !dbg !1463
  %63 = call i64 @llvm.abs.i64(i64 %62, i1 true), !dbg !1464
  %64 = icmp sge i64 %60, %63, !dbg !1465
  br i1 %64, label %65, label %66, !dbg !1465

65:                                               ; preds = %56
  call void @_Z4Int3v(), !dbg !1466
  store i32 0, ptr %7, align 4, !dbg !1468
  br label %98, !dbg !1468

66:                                               ; preds = %56
  %67 = load i32, ptr %16, align 4, !dbg !1469
  %68 = load i32, ptr %17, align 4, !dbg !1470
  %69 = call noundef i32 @_Z6fixdivii(i32 noundef %67, i32 noundef %68), !dbg !1471
  store i32 %69, ptr %18, align 4, !dbg !1472
  %70 = load i32, ptr %18, align 4, !dbg !1473
  %71 = icmp sle i32 %70, 65536, !dbg !1473
  %72 = zext i1 %71 to i32, !dbg !1473
  call void @_Z7_AssertiPKcS0_i(i32 noundef %72, ptr noundef @.str, ptr noundef @.str.1, i32 noundef 127), !dbg !1473
  %73 = getelementptr inbounds nuw %struct.vms_vector, ptr %14, i32 0, i32 0, !dbg !1474
  %74 = load i32, ptr %73, align 4, !dbg !1474
  %75 = load i32, ptr %18, align 4, !dbg !1476
  %76 = call noundef i32 @_Z11oflow_checkii(i32 noundef %74, i32 noundef %75), !dbg !1477
  %77 = icmp ne i32 %76, 0, !dbg !1477
  br i1 %77, label %90, label %78, !dbg !1478

78:                                               ; preds = %66
  %79 = getelementptr inbounds nuw %struct.vms_vector, ptr %14, i32 0, i32 1, !dbg !1479
  %80 = load i32, ptr %79, align 4, !dbg !1479
  %81 = load i32, ptr %18, align 4, !dbg !1480
  %82 = call noundef i32 @_Z11oflow_checkii(i32 noundef %80, i32 noundef %81), !dbg !1481
  %83 = icmp ne i32 %82, 0, !dbg !1481
  br i1 %83, label %90, label %84, !dbg !1482

84:                                               ; preds = %78
  %85 = getelementptr inbounds nuw %struct.vms_vector, ptr %14, i32 0, i32 2, !dbg !1483
  %86 = load i32, ptr %85, align 4, !dbg !1483
  %87 = load i32, ptr %18, align 4, !dbg !1484
  %88 = call noundef i32 @_Z11oflow_checkii(i32 noundef %86, i32 noundef %87), !dbg !1485
  %89 = icmp ne i32 %88, 0, !dbg !1485
  br i1 %89, label %90, label %91, !dbg !1482

90:                                               ; preds = %84, %78, %66
  store i32 0, ptr %7, align 4, !dbg !1486
  br label %98, !dbg !1486

91:                                               ; preds = %84
  %92 = load i32, ptr %16, align 4, !dbg !1487
  %93 = load i32, ptr %17, align 4, !dbg !1488
  %94 = call noundef ptr @_Z13vm_vec_scale2P10vms_vectorii(ptr noundef %14, i32 noundef %92, i32 noundef %93), !dbg !1489
  %95 = load ptr, ptr %8, align 8, !dbg !1490
  %96 = load ptr, ptr %11, align 8, !dbg !1491
  %97 = call noundef ptr @_Z10vm_vec_addP10vms_vectorS0_S0_(ptr noundef %95, ptr noundef %96, ptr noundef %14), !dbg !1492
  store i32 1, ptr %7, align 4, !dbg !1493
  br label %98, !dbg !1493

98:                                               ; preds = %91, %90, %65, %55
  %99 = load i32, ptr %7, align 4, !dbg !1494
  ret i32 %99, !dbg !1494
}

declare noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef, ptr noundef, ptr noundef) #3

declare noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef, ptr noundef) #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.abs.i64(i64, i1 immarg) #1

declare void @_Z4Int3v() #3

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z6fixdivii(i32 noundef %0, i32 noundef %1) #0 !dbg !1495 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
    #dbg_declare(ptr %4, !1498, !DIExpression(), !1499)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !1500, !DIExpression(), !1501)
  %6 = load i32, ptr %5, align 4, !dbg !1502
  %7 = icmp eq i32 %6, 0, !dbg !1504
  br i1 %7, label %8, label %9, !dbg !1504

8:                                                ; preds = %2
  store i32 1, ptr %3, align 4, !dbg !1505
  br label %17, !dbg !1505

9:                                                ; preds = %2
  %10 = load i32, ptr %4, align 4, !dbg !1506
  %11 = sext i32 %10 to i64, !dbg !1506
  %12 = shl i64 %11, 16, !dbg !1507
  %13 = load i32, ptr %5, align 4, !dbg !1508
  %14 = sext i32 %13 to i64, !dbg !1508
  %15 = sdiv i64 %12, %14, !dbg !1509
  %16 = trunc i64 %15 to i32, !dbg !1510
  store i32 %16, ptr %3, align 4, !dbg !1511
  br label %17, !dbg !1511

17:                                               ; preds = %9, %8
  %18 = load i32, ptr %3, align 4, !dbg !1512
  ret i32 %18, !dbg !1512
}

declare void @_Z7_AssertiPKcS0_i(i32 noundef, ptr noundef, ptr noundef, i32 noundef) #3

declare noundef ptr @_Z13vm_vec_scale2P10vms_vectorii(ptr noundef, i32 noundef, i32 noundef) #3

declare noundef ptr @_Z10vm_vec_addP10vms_vectorS0_S0_(ptr noundef, ptr noundef, ptr noundef) #3

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z19check_point_to_faceP10vms_vectorP4sideiiPi(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3, ptr noundef %4) #2 !dbg !1513 {
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca %struct.vms_vector_array, align 4
  %13 = alloca %struct.vms_vector, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca ptr, align 8
  %22 = alloca ptr, align 8
  %23 = alloca %struct.vec2d, align 4
  %24 = alloca %struct.vec2d, align 4
  %25 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
    #dbg_declare(ptr %6, !1539, !DIExpression(), !1540)
  store ptr %1, ptr %7, align 8
    #dbg_declare(ptr %7, !1541, !DIExpression(), !1542)
  store i32 %2, ptr %8, align 4
    #dbg_declare(ptr %8, !1543, !DIExpression(), !1544)
  store i32 %3, ptr %9, align 4
    #dbg_declare(ptr %9, !1545, !DIExpression(), !1546)
  store ptr %4, ptr %10, align 8
    #dbg_declare(ptr %10, !1547, !DIExpression(), !1548)
    #dbg_declare(ptr %11, !1549, !DIExpression(), !1550)
    #dbg_declare(ptr %12, !1551, !DIExpression(), !1552)
    #dbg_declare(ptr %13, !1553, !DIExpression(), !1554)
    #dbg_declare(ptr %14, !1555, !DIExpression(), !1556)
    #dbg_declare(ptr %15, !1557, !DIExpression(), !1558)
    #dbg_declare(ptr %16, !1559, !DIExpression(), !1560)
    #dbg_declare(ptr %17, !1561, !DIExpression(), !1562)
    #dbg_declare(ptr %18, !1563, !DIExpression(), !1564)
    #dbg_declare(ptr %19, !1565, !DIExpression(), !1566)
    #dbg_declare(ptr %20, !1567, !DIExpression(), !1568)
    #dbg_declare(ptr %21, !1569, !DIExpression(), !1570)
    #dbg_declare(ptr %22, !1571, !DIExpression(), !1572)
  %26 = load ptr, ptr %7, align 8, !dbg !1573
  %27 = getelementptr inbounds nuw %struct.side, ptr %26, i32 0, i32 6, !dbg !1574
  %28 = load i32, ptr %8, align 4, !dbg !1575
  %29 = sext i32 %28 to i64, !dbg !1573
  %30 = getelementptr inbounds [2 x %struct.vms_vector], ptr %27, i64 0, i64 %29, !dbg !1573
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %12, ptr align 4 %30, i64 12, i1 false), !dbg !1576
  %31 = load ptr, ptr %6, align 8, !dbg !1577
  store ptr %31, ptr %11, align 8, !dbg !1578
  %32 = getelementptr inbounds nuw %struct.vms_vector_array, ptr %12, i32 0, i32 0, !dbg !1579
  %33 = getelementptr inbounds [3 x i32], ptr %32, i64 0, i64 0, !dbg !1580
  %34 = load i32, ptr %33, align 4, !dbg !1580
  %35 = sext i32 %34 to i64, !dbg !1580
  %36 = call i64 @llvm.abs.i64(i64 %35, i1 true), !dbg !1581
  %37 = trunc i64 %36 to i32, !dbg !1581
  %38 = getelementptr inbounds nuw %struct.vms_vector, ptr %13, i32 0, i32 0, !dbg !1582
  store i32 %37, ptr %38, align 4, !dbg !1583
  %39 = getelementptr inbounds nuw %struct.vms_vector_array, ptr %12, i32 0, i32 0, !dbg !1584
  %40 = getelementptr inbounds [3 x i32], ptr %39, i64 0, i64 1, !dbg !1585
  %41 = load i32, ptr %40, align 4, !dbg !1585
  %42 = sext i32 %41 to i64, !dbg !1585
  %43 = call i64 @llvm.abs.i64(i64 %42, i1 true), !dbg !1586
  %44 = trunc i64 %43 to i32, !dbg !1586
  %45 = getelementptr inbounds nuw %struct.vms_vector, ptr %13, i32 0, i32 1, !dbg !1587
  store i32 %44, ptr %45, align 4, !dbg !1588
  %46 = getelementptr inbounds nuw %struct.vms_vector_array, ptr %12, i32 0, i32 0, !dbg !1589
  %47 = getelementptr inbounds [3 x i32], ptr %46, i64 0, i64 2, !dbg !1590
  %48 = load i32, ptr %47, align 4, !dbg !1590
  %49 = sext i32 %48 to i64, !dbg !1590
  %50 = call i64 @llvm.abs.i64(i64 %49, i1 true), !dbg !1591
  %51 = trunc i64 %50 to i32, !dbg !1591
  %52 = getelementptr inbounds nuw %struct.vms_vector, ptr %13, i32 0, i32 2, !dbg !1592
  store i32 %51, ptr %52, align 4, !dbg !1593
  %53 = getelementptr inbounds nuw %struct.vms_vector, ptr %13, i32 0, i32 0, !dbg !1594
  %54 = load i32, ptr %53, align 4, !dbg !1594
  %55 = getelementptr inbounds nuw %struct.vms_vector, ptr %13, i32 0, i32 1, !dbg !1596
  %56 = load i32, ptr %55, align 4, !dbg !1596
  %57 = icmp sgt i32 %54, %56, !dbg !1597
  br i1 %57, label %58, label %67, !dbg !1597

58:                                               ; preds = %5
  %59 = getelementptr inbounds nuw %struct.vms_vector, ptr %13, i32 0, i32 0, !dbg !1598
  %60 = load i32, ptr %59, align 4, !dbg !1598
  %61 = getelementptr inbounds nuw %struct.vms_vector, ptr %13, i32 0, i32 2, !dbg !1600
  %62 = load i32, ptr %61, align 4, !dbg !1600
  %63 = icmp sgt i32 %60, %62, !dbg !1601
  br i1 %63, label %64, label %65, !dbg !1601

64:                                               ; preds = %58
  store i32 0, ptr %14, align 4, !dbg !1602
  br label %66, !dbg !1603

65:                                               ; preds = %58
  store i32 2, ptr %14, align 4, !dbg !1604
  br label %66

66:                                               ; preds = %65, %64
  br label %76, !dbg !1600

67:                                               ; preds = %5
  %68 = getelementptr inbounds nuw %struct.vms_vector, ptr %13, i32 0, i32 1, !dbg !1605
  %69 = load i32, ptr %68, align 4, !dbg !1605
  %70 = getelementptr inbounds nuw %struct.vms_vector, ptr %13, i32 0, i32 2, !dbg !1607
  %71 = load i32, ptr %70, align 4, !dbg !1607
  %72 = icmp sgt i32 %69, %71, !dbg !1608
  br i1 %72, label %73, label %74, !dbg !1608

73:                                               ; preds = %67
  store i32 1, ptr %14, align 4, !dbg !1609
  br label %75, !dbg !1610

74:                                               ; preds = %67
  store i32 2, ptr %14, align 4, !dbg !1611
  br label %75

75:                                               ; preds = %74, %73
  br label %76

76:                                               ; preds = %75, %66
  %77 = getelementptr inbounds nuw %struct.vms_vector_array, ptr %12, i32 0, i32 0, !dbg !1612
  %78 = load i32, ptr %14, align 4, !dbg !1614
  %79 = sext i32 %78 to i64, !dbg !1615
  %80 = getelementptr inbounds [3 x i32], ptr %77, i64 0, i64 %79, !dbg !1615
  %81 = load i32, ptr %80, align 4, !dbg !1615
  %82 = icmp sgt i32 %81, 0, !dbg !1616
  br i1 %82, label %83, label %94, !dbg !1616

83:                                               ; preds = %76
  %84 = load i32, ptr %14, align 4, !dbg !1617
  %85 = sext i32 %84 to i64, !dbg !1619
  %86 = getelementptr inbounds [3 x [2 x i32]], ptr @ij_table, i64 0, i64 %85, !dbg !1619
  %87 = getelementptr inbounds [2 x i32], ptr %86, i64 0, i64 0, !dbg !1619
  %88 = load i32, ptr %87, align 4, !dbg !1619
  store i32 %88, ptr %15, align 4, !dbg !1620
  %89 = load i32, ptr %14, align 4, !dbg !1621
  %90 = sext i32 %89 to i64, !dbg !1622
  %91 = getelementptr inbounds [3 x [2 x i32]], ptr @ij_table, i64 0, i64 %90, !dbg !1622
  %92 = getelementptr inbounds [2 x i32], ptr %91, i64 0, i64 1, !dbg !1622
  %93 = load i32, ptr %92, align 4, !dbg !1622
  store i32 %93, ptr %16, align 4, !dbg !1623
  br label %105, !dbg !1624

94:                                               ; preds = %76
  %95 = load i32, ptr %14, align 4, !dbg !1625
  %96 = sext i32 %95 to i64, !dbg !1627
  %97 = getelementptr inbounds [3 x [2 x i32]], ptr @ij_table, i64 0, i64 %96, !dbg !1627
  %98 = getelementptr inbounds [2 x i32], ptr %97, i64 0, i64 1, !dbg !1627
  %99 = load i32, ptr %98, align 4, !dbg !1627
  store i32 %99, ptr %15, align 4, !dbg !1628
  %100 = load i32, ptr %14, align 4, !dbg !1629
  %101 = sext i32 %100 to i64, !dbg !1630
  %102 = getelementptr inbounds [3 x [2 x i32]], ptr @ij_table, i64 0, i64 %101, !dbg !1630
  %103 = getelementptr inbounds [2 x i32], ptr %102, i64 0, i64 0, !dbg !1630
  %104 = load i32, ptr %103, align 4, !dbg !1630
  store i32 %104, ptr %16, align 4, !dbg !1631
  br label %105

105:                                              ; preds = %94, %83
  %106 = load ptr, ptr %11, align 8, !dbg !1632
  %107 = getelementptr inbounds nuw %struct.vms_vector_array, ptr %106, i32 0, i32 0, !dbg !1633
  %108 = load i32, ptr %15, align 4, !dbg !1634
  %109 = sext i32 %108 to i64, !dbg !1632
  %110 = getelementptr inbounds [3 x i32], ptr %107, i64 0, i64 %109, !dbg !1632
  %111 = load i32, ptr %110, align 4, !dbg !1632
  store i32 %111, ptr %19, align 4, !dbg !1635
  %112 = load ptr, ptr %11, align 8, !dbg !1636
  %113 = getelementptr inbounds nuw %struct.vms_vector_array, ptr %112, i32 0, i32 0, !dbg !1637
  %114 = load i32, ptr %16, align 4, !dbg !1638
  %115 = sext i32 %114 to i64, !dbg !1636
  %116 = getelementptr inbounds [3 x i32], ptr %113, i64 0, i64 %115, !dbg !1636
  %117 = load i32, ptr %116, align 4, !dbg !1636
  store i32 %117, ptr %20, align 4, !dbg !1639
  store i32 0, ptr %18, align 4, !dbg !1640
  store i32 0, ptr %17, align 4, !dbg !1642
  br label %118, !dbg !1643

118:                                              ; preds = %211, %105
  %119 = load i32, ptr %17, align 4, !dbg !1644
  %120 = load i32, ptr %9, align 4, !dbg !1646
  %121 = icmp slt i32 %119, %120, !dbg !1647
  br i1 %121, label %122, label %214, !dbg !1648

122:                                              ; preds = %118
    #dbg_declare(ptr %23, !1649, !DIExpression(), !1656)
    #dbg_declare(ptr %24, !1657, !DIExpression(), !1658)
    #dbg_declare(ptr %25, !1659, !DIExpression(), !1660)
  %123 = load ptr, ptr %10, align 8, !dbg !1661
  %124 = load i32, ptr %8, align 4, !dbg !1662
  %125 = mul nsw i32 %124, 3, !dbg !1663
  %126 = load i32, ptr %17, align 4, !dbg !1664
  %127 = add nsw i32 %125, %126, !dbg !1665
  %128 = sext i32 %127 to i64, !dbg !1661
  %129 = getelementptr inbounds i32, ptr %123, i64 %128, !dbg !1661
  %130 = load i32, ptr %129, align 4, !dbg !1661
  %131 = sext i32 %130 to i64, !dbg !1666
  %132 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %131, !dbg !1666
  store ptr %132, ptr %21, align 8, !dbg !1667
  %133 = load ptr, ptr %10, align 8, !dbg !1668
  %134 = load i32, ptr %8, align 4, !dbg !1669
  %135 = mul nsw i32 %134, 3, !dbg !1670
  %136 = load i32, ptr %17, align 4, !dbg !1671
  %137 = add nsw i32 %136, 1, !dbg !1672
  %138 = load i32, ptr %9, align 4, !dbg !1673
  %139 = srem i32 %137, %138, !dbg !1674
  %140 = add nsw i32 %135, %139, !dbg !1675
  %141 = sext i32 %140 to i64, !dbg !1668
  %142 = getelementptr inbounds i32, ptr %133, i64 %141, !dbg !1668
  %143 = load i32, ptr %142, align 4, !dbg !1668
  %144 = sext i32 %143 to i64, !dbg !1676
  %145 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %144, !dbg !1676
  store ptr %145, ptr %22, align 8, !dbg !1677
  %146 = load ptr, ptr %22, align 8, !dbg !1678
  %147 = getelementptr inbounds nuw %struct.vms_vector_array, ptr %146, i32 0, i32 0, !dbg !1679
  %148 = load i32, ptr %15, align 4, !dbg !1680
  %149 = sext i32 %148 to i64, !dbg !1678
  %150 = getelementptr inbounds [3 x i32], ptr %147, i64 0, i64 %149, !dbg !1678
  %151 = load i32, ptr %150, align 4, !dbg !1678
  %152 = load ptr, ptr %21, align 8, !dbg !1681
  %153 = getelementptr inbounds nuw %struct.vms_vector_array, ptr %152, i32 0, i32 0, !dbg !1682
  %154 = load i32, ptr %15, align 4, !dbg !1683
  %155 = sext i32 %154 to i64, !dbg !1681
  %156 = getelementptr inbounds [3 x i32], ptr %153, i64 0, i64 %155, !dbg !1681
  %157 = load i32, ptr %156, align 4, !dbg !1681
  %158 = sub nsw i32 %151, %157, !dbg !1684
  %159 = getelementptr inbounds nuw %struct.vec2d, ptr %23, i32 0, i32 0, !dbg !1685
  store i32 %158, ptr %159, align 4, !dbg !1686
  %160 = load ptr, ptr %22, align 8, !dbg !1687
  %161 = getelementptr inbounds nuw %struct.vms_vector_array, ptr %160, i32 0, i32 0, !dbg !1688
  %162 = load i32, ptr %16, align 4, !dbg !1689
  %163 = sext i32 %162 to i64, !dbg !1687
  %164 = getelementptr inbounds [3 x i32], ptr %161, i64 0, i64 %163, !dbg !1687
  %165 = load i32, ptr %164, align 4, !dbg !1687
  %166 = load ptr, ptr %21, align 8, !dbg !1690
  %167 = getelementptr inbounds nuw %struct.vms_vector_array, ptr %166, i32 0, i32 0, !dbg !1691
  %168 = load i32, ptr %16, align 4, !dbg !1692
  %169 = sext i32 %168 to i64, !dbg !1690
  %170 = getelementptr inbounds [3 x i32], ptr %167, i64 0, i64 %169, !dbg !1690
  %171 = load i32, ptr %170, align 4, !dbg !1690
  %172 = sub nsw i32 %165, %171, !dbg !1693
  %173 = getelementptr inbounds nuw %struct.vec2d, ptr %23, i32 0, i32 1, !dbg !1694
  store i32 %172, ptr %173, align 4, !dbg !1695
  %174 = load i32, ptr %19, align 4, !dbg !1696
  %175 = load ptr, ptr %21, align 8, !dbg !1697
  %176 = getelementptr inbounds nuw %struct.vms_vector_array, ptr %175, i32 0, i32 0, !dbg !1698
  %177 = load i32, ptr %15, align 4, !dbg !1699
  %178 = sext i32 %177 to i64, !dbg !1697
  %179 = getelementptr inbounds [3 x i32], ptr %176, i64 0, i64 %178, !dbg !1697
  %180 = load i32, ptr %179, align 4, !dbg !1697
  %181 = sub nsw i32 %174, %180, !dbg !1700
  %182 = getelementptr inbounds nuw %struct.vec2d, ptr %24, i32 0, i32 0, !dbg !1701
  store i32 %181, ptr %182, align 4, !dbg !1702
  %183 = load i32, ptr %20, align 4, !dbg !1703
  %184 = load ptr, ptr %21, align 8, !dbg !1704
  %185 = getelementptr inbounds nuw %struct.vms_vector_array, ptr %184, i32 0, i32 0, !dbg !1705
  %186 = load i32, ptr %16, align 4, !dbg !1706
  %187 = sext i32 %186 to i64, !dbg !1704
  %188 = getelementptr inbounds [3 x i32], ptr %185, i64 0, i64 %187, !dbg !1704
  %189 = load i32, ptr %188, align 4, !dbg !1704
  %190 = sub nsw i32 %183, %189, !dbg !1707
  %191 = getelementptr inbounds nuw %struct.vec2d, ptr %24, i32 0, i32 1, !dbg !1708
  store i32 %190, ptr %191, align 4, !dbg !1709
  %192 = getelementptr inbounds nuw %struct.vec2d, ptr %24, i32 0, i32 0, !dbg !1710
  %193 = load i32, ptr %192, align 4, !dbg !1710
  %194 = getelementptr inbounds nuw %struct.vec2d, ptr %23, i32 0, i32 1, !dbg !1711
  %195 = load i32, ptr %194, align 4, !dbg !1711
  %196 = call noundef i32 @_Z6fixmulii(i32 noundef %193, i32 noundef %195), !dbg !1712
  %197 = getelementptr inbounds nuw %struct.vec2d, ptr %24, i32 0, i32 1, !dbg !1713
  %198 = load i32, ptr %197, align 4, !dbg !1713
  %199 = getelementptr inbounds nuw %struct.vec2d, ptr %23, i32 0, i32 0, !dbg !1714
  %200 = load i32, ptr %199, align 4, !dbg !1714
  %201 = call noundef i32 @_Z6fixmulii(i32 noundef %198, i32 noundef %200), !dbg !1715
  %202 = sub nsw i32 %196, %201, !dbg !1716
  store i32 %202, ptr %25, align 4, !dbg !1717
  %203 = load i32, ptr %25, align 4, !dbg !1718
  %204 = icmp slt i32 %203, 0, !dbg !1720
  br i1 %204, label %205, label %210, !dbg !1720

205:                                              ; preds = %122
  %206 = load i32, ptr %17, align 4, !dbg !1721
  %207 = shl i32 1, %206, !dbg !1722
  %208 = load i32, ptr %18, align 4, !dbg !1723
  %209 = or i32 %208, %207, !dbg !1723
  store i32 %209, ptr %18, align 4, !dbg !1723
  br label %210, !dbg !1724

210:                                              ; preds = %205, %122
  br label %211, !dbg !1725

211:                                              ; preds = %210
  %212 = load i32, ptr %17, align 4, !dbg !1726
  %213 = add nsw i32 %212, 1, !dbg !1726
  store i32 %213, ptr %17, align 4, !dbg !1726
  br label %118, !dbg !1727, !llvm.loop !1728

214:                                              ; preds = %118
  %215 = load i32, ptr %18, align 4, !dbg !1731
  ret i32 %215, !dbg !1732
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z6fixmulii(i32 noundef %0, i32 noundef %1) #0 !dbg !1733 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !1734, !DIExpression(), !1735)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !1736, !DIExpression(), !1737)
  %5 = load i32, ptr %3, align 4, !dbg !1738
  %6 = sext i32 %5 to i64, !dbg !1738
  %7 = load i32, ptr %4, align 4, !dbg !1739
  %8 = sext i32 %7 to i64, !dbg !1739
  %9 = mul nsw i64 %6, %8, !dbg !1740
  %10 = ashr i64 %9, 16, !dbg !1741
  %11 = trunc i64 %10 to i32, !dbg !1742
  ret i32 %11, !dbg !1743
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z20check_sphere_to_faceP10vms_vectorP4sideiiiPi(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, ptr noundef %5) #2 !dbg !1744 {
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca %struct.vms_vector, align 4
  %15 = alloca i32, align 4
  %16 = alloca %struct.vms_vector, align 4
  %17 = alloca %struct.vms_vector, align 4
  %18 = alloca %struct.vms_vector, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca ptr, align 8
  %23 = alloca ptr, align 8
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  store ptr %0, ptr %8, align 8
    #dbg_declare(ptr %8, !1747, !DIExpression(), !1748)
  store ptr %1, ptr %9, align 8
    #dbg_declare(ptr %9, !1749, !DIExpression(), !1750)
  store i32 %2, ptr %10, align 4
    #dbg_declare(ptr %10, !1751, !DIExpression(), !1752)
  store i32 %3, ptr %11, align 4
    #dbg_declare(ptr %11, !1753, !DIExpression(), !1754)
  store i32 %4, ptr %12, align 4
    #dbg_declare(ptr %12, !1755, !DIExpression(), !1756)
  store ptr %5, ptr %13, align 8
    #dbg_declare(ptr %13, !1757, !DIExpression(), !1758)
    #dbg_declare(ptr %14, !1759, !DIExpression(), !1760)
  %26 = load ptr, ptr %8, align 8, !dbg !1761
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %14, ptr align 4 %26, i64 12, i1 false), !dbg !1762
    #dbg_declare(ptr %15, !1763, !DIExpression(), !1764)
  %27 = load ptr, ptr %8, align 8, !dbg !1765
  %28 = load ptr, ptr %9, align 8, !dbg !1766
  %29 = load i32, ptr %10, align 4, !dbg !1767
  %30 = load i32, ptr %11, align 4, !dbg !1768
  %31 = load ptr, ptr %13, align 8, !dbg !1769
  %32 = call noundef i32 @_Z19check_point_to_faceP10vms_vectorP4sideiiPi(ptr noundef %27, ptr noundef %28, i32 noundef %29, i32 noundef %30, ptr noundef %31), !dbg !1770
  store i32 %32, ptr %15, align 4, !dbg !1771
  %33 = load i32, ptr %15, align 4, !dbg !1772
  %34 = icmp eq i32 %33, 0, !dbg !1774
  br i1 %34, label %35, label %36, !dbg !1774

35:                                               ; preds = %6
  store i32 1, ptr %7, align 4, !dbg !1775
  br label %120, !dbg !1775

36:                                               ; preds = %6
    #dbg_declare(ptr %16, !1776, !DIExpression(), !1778)
    #dbg_declare(ptr %17, !1779, !DIExpression(), !1780)
    #dbg_declare(ptr %18, !1781, !DIExpression(), !1782)
    #dbg_declare(ptr %19, !1783, !DIExpression(), !1784)
    #dbg_declare(ptr %20, !1785, !DIExpression(), !1786)
    #dbg_declare(ptr %21, !1787, !DIExpression(), !1788)
    #dbg_declare(ptr %22, !1789, !DIExpression(), !1790)
    #dbg_declare(ptr %23, !1791, !DIExpression(), !1792)
    #dbg_declare(ptr %24, !1793, !DIExpression(), !1794)
    #dbg_declare(ptr %25, !1795, !DIExpression(), !1796)
  store i32 0, ptr %25, align 4, !dbg !1797
  br label %37, !dbg !1799

37:                                               ; preds = %43, %36
  %38 = load i32, ptr %15, align 4, !dbg !1800
  %39 = and i32 %38, 1, !dbg !1802
  %40 = icmp ne i32 %39, 0, !dbg !1803
  %41 = xor i1 %40, true, !dbg !1804
  br i1 %41, label %42, label %48, !dbg !1805

42:                                               ; preds = %37
  br label %43, !dbg !1805

43:                                               ; preds = %42
  %44 = load i32, ptr %15, align 4, !dbg !1806
  %45 = lshr i32 %44, 1, !dbg !1806
  store i32 %45, ptr %15, align 4, !dbg !1806
  %46 = load i32, ptr %25, align 4, !dbg !1807
  %47 = add nsw i32 %46, 1, !dbg !1807
  store i32 %47, ptr %25, align 4, !dbg !1807
  br label %37, !dbg !1808, !llvm.loop !1809

48:                                               ; preds = %37
  %49 = load ptr, ptr %13, align 8, !dbg !1811
  %50 = load i32, ptr %10, align 4, !dbg !1812
  %51 = mul nsw i32 %50, 3, !dbg !1813
  %52 = load i32, ptr %25, align 4, !dbg !1814
  %53 = add nsw i32 %51, %52, !dbg !1815
  %54 = sext i32 %53 to i64, !dbg !1811
  %55 = getelementptr inbounds i32, ptr %49, i64 %54, !dbg !1811
  %56 = load i32, ptr %55, align 4, !dbg !1811
  %57 = sext i32 %56 to i64, !dbg !1816
  %58 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %57, !dbg !1816
  store ptr %58, ptr %22, align 8, !dbg !1817
  %59 = load ptr, ptr %13, align 8, !dbg !1818
  %60 = load i32, ptr %10, align 4, !dbg !1819
  %61 = mul nsw i32 %60, 3, !dbg !1820
  %62 = load i32, ptr %25, align 4, !dbg !1821
  %63 = add nsw i32 %62, 1, !dbg !1822
  %64 = load i32, ptr %11, align 4, !dbg !1823
  %65 = srem i32 %63, %64, !dbg !1824
  %66 = add nsw i32 %61, %65, !dbg !1825
  %67 = sext i32 %66 to i64, !dbg !1818
  %68 = getelementptr inbounds i32, ptr %59, i64 %67, !dbg !1818
  %69 = load i32, ptr %68, align 4, !dbg !1818
  %70 = sext i32 %69 to i64, !dbg !1826
  %71 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %70, !dbg !1826
  store ptr %71, ptr %23, align 8, !dbg !1827
  %72 = load ptr, ptr %22, align 8, !dbg !1828
  %73 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %17, ptr noundef %14, ptr noundef %72), !dbg !1829
  %74 = load ptr, ptr %23, align 8, !dbg !1830
  %75 = load ptr, ptr %22, align 8, !dbg !1831
  %76 = call noundef i32 @_Z21vm_vec_normalized_dirP10vms_vectorS0_S0_(ptr noundef %16, ptr noundef %74, ptr noundef %75), !dbg !1832
  store i32 %76, ptr %19, align 4, !dbg !1833
  %77 = call noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef %16, ptr noundef %17), !dbg !1834
  store i32 %77, ptr %20, align 4, !dbg !1835
  %78 = load i32, ptr %20, align 4, !dbg !1836
  %79 = load i32, ptr %12, align 4, !dbg !1838
  %80 = add nsw i32 %78, %79, !dbg !1839
  %81 = icmp slt i32 %80, 0, !dbg !1840
  br i1 %81, label %82, label %83, !dbg !1840

82:                                               ; preds = %48
  store i32 0, ptr %7, align 4, !dbg !1841
  br label %120, !dbg !1841

83:                                               ; preds = %48
  %84 = load i32, ptr %20, align 4, !dbg !1842
  %85 = load i32, ptr %12, align 4, !dbg !1844
  %86 = sub nsw i32 %84, %85, !dbg !1845
  %87 = load i32, ptr %19, align 4, !dbg !1846
  %88 = icmp sgt i32 %86, %87, !dbg !1847
  br i1 %88, label %89, label %90, !dbg !1847

89:                                               ; preds = %83
  store i32 0, ptr %7, align 4, !dbg !1848
  br label %120, !dbg !1848

90:                                               ; preds = %83
  store i32 3, ptr %24, align 4, !dbg !1849
  %91 = load i32, ptr %20, align 4, !dbg !1850
  %92 = icmp slt i32 %91, 0, !dbg !1852
  br i1 %92, label %93, label %95, !dbg !1852

93:                                               ; preds = %90
  %94 = load ptr, ptr %22, align 8, !dbg !1853
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %18, ptr align 4 %94, i64 12, i1 false), !dbg !1854
  br label %106, !dbg !1855

95:                                               ; preds = %90
  %96 = load i32, ptr %20, align 4, !dbg !1856
  %97 = load i32, ptr %19, align 4, !dbg !1858
  %98 = icmp sgt i32 %96, %97, !dbg !1859
  br i1 %98, label %99, label %101, !dbg !1859

99:                                               ; preds = %95
  %100 = load ptr, ptr %23, align 8, !dbg !1860
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %18, ptr align 4 %100, i64 12, i1 false), !dbg !1861
  br label %105, !dbg !1862

101:                                              ; preds = %95
  store i32 2, ptr %24, align 4, !dbg !1863
  %102 = load ptr, ptr %22, align 8, !dbg !1865
  %103 = load i32, ptr %20, align 4, !dbg !1866
  %104 = call noundef ptr @_Z16vm_vec_scale_addP10vms_vectorS0_S0_i(ptr noundef %18, ptr noundef %102, ptr noundef %16, i32 noundef %103), !dbg !1867
  br label %105

105:                                              ; preds = %101, %99
  br label %106

106:                                              ; preds = %105, %93
  %107 = call noundef i32 @_Z11vm_vec_distP10vms_vectorS0_(ptr noundef %14, ptr noundef %18), !dbg !1868
  store i32 %107, ptr %21, align 4, !dbg !1869
  %108 = load i32, ptr %21, align 4, !dbg !1870
  %109 = load i32, ptr %12, align 4, !dbg !1872
  %110 = icmp sle i32 %108, %109, !dbg !1873
  br i1 %110, label %111, label %119, !dbg !1873

111:                                              ; preds = %106
  %112 = load i32, ptr %24, align 4, !dbg !1874
  %113 = icmp eq i32 %112, 3, !dbg !1875
  br i1 %113, label %114, label %115, !dbg !1876

114:                                              ; preds = %111
  br label %117, !dbg !1876

115:                                              ; preds = %111
  %116 = load i32, ptr %24, align 4, !dbg !1877
  br label %117, !dbg !1876

117:                                              ; preds = %115, %114
  %118 = phi i32 [ 0, %114 ], [ %116, %115 ], !dbg !1876
  store i32 %118, ptr %7, align 4, !dbg !1878
  br label %120, !dbg !1878

119:                                              ; preds = %106
  store i32 0, ptr %7, align 4, !dbg !1879
  br label %120, !dbg !1879

120:                                              ; preds = %119, %117, %89, %82, %35
  %121 = load i32, ptr %7, align 4, !dbg !1880
  ret i32 %121, !dbg !1880
}

declare noundef i32 @_Z21vm_vec_normalized_dirP10vms_vectorS0_S0_(ptr noundef, ptr noundef, ptr noundef) #3

declare noundef ptr @_Z16vm_vec_scale_addP10vms_vectorS0_S0_i(ptr noundef, ptr noundef, ptr noundef, i32 noundef) #3

declare noundef i32 @_Z11vm_vec_distP10vms_vectorS0_(ptr noundef, ptr noundef) #3

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z18check_line_to_faceP10vms_vectorS0_S0_P7segmentiiii(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, i32 noundef %6, i32 noundef %7) #2 !dbg !1881 {
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca %struct.vms_vector, align 4
  %19 = alloca i32, align 4
  %20 = alloca ptr, align 8
  %21 = alloca [6 x i32], align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca %struct.vms_vector, align 4
  %25 = alloca i32, align 4
  store ptr %0, ptr %10, align 8
    #dbg_declare(ptr %10, !1897, !DIExpression(), !1898)
  store ptr %1, ptr %11, align 8
    #dbg_declare(ptr %11, !1899, !DIExpression(), !1900)
  store ptr %2, ptr %12, align 8
    #dbg_declare(ptr %12, !1901, !DIExpression(), !1902)
  store ptr %3, ptr %13, align 8
    #dbg_declare(ptr %13, !1903, !DIExpression(), !1904)
  store i32 %4, ptr %14, align 4
    #dbg_declare(ptr %14, !1905, !DIExpression(), !1906)
  store i32 %5, ptr %15, align 4
    #dbg_declare(ptr %15, !1907, !DIExpression(), !1908)
  store i32 %6, ptr %16, align 4
    #dbg_declare(ptr %16, !1909, !DIExpression(), !1910)
  store i32 %7, ptr %17, align 4
    #dbg_declare(ptr %17, !1911, !DIExpression(), !1912)
  %26 = load ptr, ptr %13, align 8, !dbg !1913
  %27 = ptrtoint ptr %26 to i64, !dbg !1915
  %28 = sub i64 %27, ptrtoint (ptr @Segments to i64), !dbg !1915
  %29 = sdiv exact i64 %28, 512, !dbg !1915
  %30 = icmp eq i64 %29, -1, !dbg !1916
  br i1 %30, label %31, label %32, !dbg !1916

31:                                               ; preds = %8
  call void (ptr, ...) @_Z5ErrorPKcz(ptr noundef @.str.2), !dbg !1917
  br label %32, !dbg !1917

32:                                               ; preds = %31, %8
    #dbg_declare(ptr %18, !1918, !DIExpression(), !1920)
    #dbg_declare(ptr %19, !1921, !DIExpression(), !1922)
    #dbg_declare(ptr %20, !1923, !DIExpression(), !1925)
  %33 = load ptr, ptr %13, align 8, !dbg !1926
  %34 = getelementptr inbounds nuw %struct.segment, ptr %33, i32 0, i32 0, !dbg !1927
  %35 = load i32, ptr %14, align 4, !dbg !1928
  %36 = sext i32 %35 to i64, !dbg !1926
  %37 = getelementptr inbounds [6 x %struct.side], ptr %34, i64 0, i64 %36, !dbg !1926
  store ptr %37, ptr %20, align 8, !dbg !1925
    #dbg_declare(ptr %21, !1929, !DIExpression(), !1931)
    #dbg_declare(ptr %22, !1932, !DIExpression(), !1933)
    #dbg_declare(ptr %23, !1934, !DIExpression(), !1935)
    #dbg_declare(ptr %24, !1936, !DIExpression(), !1937)
  %38 = load ptr, ptr %13, align 8, !dbg !1938
  %39 = getelementptr inbounds nuw %struct.segment, ptr %38, i32 0, i32 0, !dbg !1939
  %40 = load i32, ptr %14, align 4, !dbg !1940
  %41 = sext i32 %40 to i64, !dbg !1938
  %42 = getelementptr inbounds [6 x %struct.side], ptr %39, i64 0, i64 %41, !dbg !1938
  %43 = getelementptr inbounds nuw %struct.side, ptr %42, i32 0, i32 6, !dbg !1941
  %44 = load i32, ptr %15, align 4, !dbg !1942
  %45 = sext i32 %44 to i64, !dbg !1938
  %46 = getelementptr inbounds [2 x %struct.vms_vector], ptr %43, i64 0, i64 %45, !dbg !1938
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %24, ptr align 4 %46, i64 12, i1 false), !dbg !1943
  %47 = getelementptr inbounds [6 x i32], ptr %21, i64 0, i64 0, !dbg !1944
  %48 = load ptr, ptr %13, align 8, !dbg !1945
  %49 = ptrtoint ptr %48 to i64, !dbg !1946
  %50 = sub i64 %49, ptrtoint (ptr @Segments to i64), !dbg !1946
  %51 = sdiv exact i64 %50, 512, !dbg !1946
  %52 = trunc i64 %51 to i32, !dbg !1945
  %53 = load i32, ptr %14, align 4, !dbg !1947
  call void @_Z23create_abs_vertex_listsPiS_ii(ptr noundef %22, ptr noundef %47, i32 noundef %52, i32 noundef %53), !dbg !1948
  %54 = load i32, ptr %22, align 4, !dbg !1949
  %55 = icmp eq i32 %54, 2, !dbg !1951
  br i1 %55, label %56, label %61, !dbg !1951

56:                                               ; preds = %32
  %57 = getelementptr inbounds [6 x i32], ptr %21, i64 0, i64 0, !dbg !1952
  %58 = getelementptr inbounds [6 x i32], ptr %21, i64 0, i64 2, !dbg !1954
  %59 = call noundef nonnull align 4 dereferenceable(4) ptr @_ZNSt3__13minB8ne200100IiEERKT_S3_S3_(ptr noundef nonnull align 4 dereferenceable(4) %57, ptr noundef nonnull align 4 dereferenceable(4) %58), !dbg !1955
  %60 = load i32, ptr %59, align 4, !dbg !1955
  store i32 %60, ptr %23, align 4, !dbg !1956
  br label %84, !dbg !1957

61:                                               ; preds = %32
    #dbg_declare(ptr %25, !1958, !DIExpression(), !1960)
  %62 = getelementptr inbounds [6 x i32], ptr %21, i64 0, i64 0, !dbg !1961
  %63 = load i32, ptr %62, align 4, !dbg !1961
  store i32 %63, ptr %23, align 4, !dbg !1962
  store i32 1, ptr %25, align 4, !dbg !1963
  br label %64, !dbg !1965

64:                                               ; preds = %80, %61
  %65 = load i32, ptr %25, align 4, !dbg !1966
  %66 = icmp slt i32 %65, 4, !dbg !1968
  br i1 %66, label %67, label %83, !dbg !1969

67:                                               ; preds = %64
  %68 = load i32, ptr %25, align 4, !dbg !1970
  %69 = sext i32 %68 to i64, !dbg !1972
  %70 = getelementptr inbounds [6 x i32], ptr %21, i64 0, i64 %69, !dbg !1972
  %71 = load i32, ptr %70, align 4, !dbg !1972
  %72 = load i32, ptr %23, align 4, !dbg !1973
  %73 = icmp slt i32 %71, %72, !dbg !1974
  br i1 %73, label %74, label %79, !dbg !1974

74:                                               ; preds = %67
  %75 = load i32, ptr %25, align 4, !dbg !1975
  %76 = sext i32 %75 to i64, !dbg !1976
  %77 = getelementptr inbounds [6 x i32], ptr %21, i64 0, i64 %76, !dbg !1976
  %78 = load i32, ptr %77, align 4, !dbg !1976
  store i32 %78, ptr %23, align 4, !dbg !1977
  br label %79, !dbg !1978

79:                                               ; preds = %74, %67
  br label %80, !dbg !1973

80:                                               ; preds = %79
  %81 = load i32, ptr %25, align 4, !dbg !1979
  %82 = add nsw i32 %81, 1, !dbg !1979
  store i32 %82, ptr %25, align 4, !dbg !1979
  br label %64, !dbg !1980, !llvm.loop !1981

83:                                               ; preds = %64
  br label %84

84:                                               ; preds = %83, %56
  %85 = load ptr, ptr %10, align 8, !dbg !1983
  %86 = load i32, ptr %23, align 4, !dbg !1984
  %87 = sext i32 %86 to i64, !dbg !1985
  %88 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %87, !dbg !1985
  %89 = load ptr, ptr %11, align 8, !dbg !1986
  %90 = load ptr, ptr %12, align 8, !dbg !1987
  %91 = load i32, ptr %17, align 4, !dbg !1988
  %92 = call noundef i32 @_Z28find_plane_line_intersectionP10vms_vectorS0_S0_S0_S0_i(ptr noundef %85, ptr noundef %88, ptr noundef %24, ptr noundef %89, ptr noundef %90, i32 noundef %91), !dbg !1989
  store i32 %92, ptr %19, align 4, !dbg !1990
  %93 = load i32, ptr %19, align 4, !dbg !1991
  %94 = icmp ne i32 %93, 0, !dbg !1991
  br i1 %94, label %96, label %95, !dbg !1993

95:                                               ; preds = %84
  store i32 0, ptr %9, align 4, !dbg !1994
  br label %111, !dbg !1994

96:                                               ; preds = %84
  %97 = load ptr, ptr %10, align 8, !dbg !1995
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %18, ptr align 4 %97, i64 12, i1 false), !dbg !1996
  %98 = load i32, ptr %17, align 4, !dbg !1997
  %99 = icmp ne i32 %98, 0, !dbg !1999
  br i1 %99, label %100, label %104, !dbg !1999

100:                                              ; preds = %96
  %101 = load i32, ptr %17, align 4, !dbg !2000
  %102 = sub nsw i32 0, %101, !dbg !2001
  %103 = call noundef ptr @_Z17vm_vec_scale_add2P10vms_vectorS0_i(ptr noundef %18, ptr noundef %24, i32 noundef %102), !dbg !2002
  br label %104, !dbg !2002

104:                                              ; preds = %100, %96
  %105 = load ptr, ptr %20, align 8, !dbg !2003
  %106 = load i32, ptr %15, align 4, !dbg !2004
  %107 = load i32, ptr %16, align 4, !dbg !2005
  %108 = load i32, ptr %17, align 4, !dbg !2006
  %109 = getelementptr inbounds [6 x i32], ptr %21, i64 0, i64 0, !dbg !2007
  %110 = call noundef i32 @_Z20check_sphere_to_faceP10vms_vectorP4sideiiiPi(ptr noundef %18, ptr noundef %105, i32 noundef %106, i32 noundef %107, i32 noundef %108, ptr noundef %109), !dbg !2008
  store i32 %110, ptr %9, align 4, !dbg !2009
  br label %111, !dbg !2009

111:                                              ; preds = %104, %95
  %112 = load i32, ptr %9, align 4, !dbg !2010
  ret i32 %112, !dbg !2010
}

declare void @_Z5ErrorPKcz(ptr noundef, ...) #3

declare void @_Z23create_abs_vertex_listsPiS_ii(ptr noundef, ptr noundef, i32 noundef, i32 noundef) #3

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 4 dereferenceable(4) ptr @_ZNSt3__13minB8ne200100IiEERKT_S3_S3_(ptr noundef nonnull align 4 dereferenceable(4) %0, ptr noundef nonnull align 4 dereferenceable(4) %1) #2 !dbg !2011 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %"struct.std::__1::__less", align 1
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !2018, !DIExpression(), !2019)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !2020, !DIExpression(), !2021)
  %6 = load ptr, ptr %3, align 8, !dbg !2022
  %7 = load ptr, ptr %4, align 8, !dbg !2023
  %8 = call noundef nonnull align 4 dereferenceable(4) ptr @_ZNSt3__13minB8ne200100IiNS_6__lessIvvEEEERKT_S5_S5_T0_(ptr noundef nonnull align 4 dereferenceable(4) %6, ptr noundef nonnull align 4 dereferenceable(4) %7), !dbg !2024
  ret ptr %8, !dbg !2025
}

declare noundef ptr @_Z17vm_vec_scale_add2P10vms_vectorS0_i(ptr noundef, ptr noundef, i32 noundef) #3

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z14calc_det_valueP10vms_matrix(ptr noundef %0) #2 !dbg !2026 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2036, !DIExpression(), !2037)
  %3 = load ptr, ptr %2, align 8, !dbg !2038
  %4 = getelementptr inbounds nuw %struct.vms_matrix, ptr %3, i32 0, i32 0, !dbg !2039
  %5 = getelementptr inbounds nuw %struct.vms_vector, ptr %4, i32 0, i32 0, !dbg !2040
  %6 = load i32, ptr %5, align 4, !dbg !2040
  %7 = load ptr, ptr %2, align 8, !dbg !2041
  %8 = getelementptr inbounds nuw %struct.vms_matrix, ptr %7, i32 0, i32 1, !dbg !2042
  %9 = getelementptr inbounds nuw %struct.vms_vector, ptr %8, i32 0, i32 1, !dbg !2043
  %10 = load i32, ptr %9, align 4, !dbg !2043
  %11 = load ptr, ptr %2, align 8, !dbg !2044
  %12 = getelementptr inbounds nuw %struct.vms_matrix, ptr %11, i32 0, i32 2, !dbg !2045
  %13 = getelementptr inbounds nuw %struct.vms_vector, ptr %12, i32 0, i32 2, !dbg !2046
  %14 = load i32, ptr %13, align 4, !dbg !2046
  %15 = call noundef i32 @_Z6fixmulii(i32 noundef %10, i32 noundef %14), !dbg !2047
  %16 = call noundef i32 @_Z6fixmulii(i32 noundef %6, i32 noundef %15), !dbg !2048
  %17 = load ptr, ptr %2, align 8, !dbg !2049
  %18 = getelementptr inbounds nuw %struct.vms_matrix, ptr %17, i32 0, i32 0, !dbg !2050
  %19 = getelementptr inbounds nuw %struct.vms_vector, ptr %18, i32 0, i32 0, !dbg !2051
  %20 = load i32, ptr %19, align 4, !dbg !2051
  %21 = load ptr, ptr %2, align 8, !dbg !2052
  %22 = getelementptr inbounds nuw %struct.vms_matrix, ptr %21, i32 0, i32 1, !dbg !2053
  %23 = getelementptr inbounds nuw %struct.vms_vector, ptr %22, i32 0, i32 2, !dbg !2054
  %24 = load i32, ptr %23, align 4, !dbg !2054
  %25 = load ptr, ptr %2, align 8, !dbg !2055
  %26 = getelementptr inbounds nuw %struct.vms_matrix, ptr %25, i32 0, i32 2, !dbg !2056
  %27 = getelementptr inbounds nuw %struct.vms_vector, ptr %26, i32 0, i32 1, !dbg !2057
  %28 = load i32, ptr %27, align 4, !dbg !2057
  %29 = call noundef i32 @_Z6fixmulii(i32 noundef %24, i32 noundef %28), !dbg !2058
  %30 = call noundef i32 @_Z6fixmulii(i32 noundef %20, i32 noundef %29), !dbg !2059
  %31 = sub nsw i32 %16, %30, !dbg !2060
  %32 = load ptr, ptr %2, align 8, !dbg !2061
  %33 = getelementptr inbounds nuw %struct.vms_matrix, ptr %32, i32 0, i32 0, !dbg !2062
  %34 = getelementptr inbounds nuw %struct.vms_vector, ptr %33, i32 0, i32 1, !dbg !2063
  %35 = load i32, ptr %34, align 4, !dbg !2063
  %36 = load ptr, ptr %2, align 8, !dbg !2064
  %37 = getelementptr inbounds nuw %struct.vms_matrix, ptr %36, i32 0, i32 1, !dbg !2065
  %38 = getelementptr inbounds nuw %struct.vms_vector, ptr %37, i32 0, i32 0, !dbg !2066
  %39 = load i32, ptr %38, align 4, !dbg !2066
  %40 = load ptr, ptr %2, align 8, !dbg !2067
  %41 = getelementptr inbounds nuw %struct.vms_matrix, ptr %40, i32 0, i32 2, !dbg !2068
  %42 = getelementptr inbounds nuw %struct.vms_vector, ptr %41, i32 0, i32 2, !dbg !2069
  %43 = load i32, ptr %42, align 4, !dbg !2069
  %44 = call noundef i32 @_Z6fixmulii(i32 noundef %39, i32 noundef %43), !dbg !2070
  %45 = call noundef i32 @_Z6fixmulii(i32 noundef %35, i32 noundef %44), !dbg !2071
  %46 = sub nsw i32 %31, %45, !dbg !2072
  %47 = load ptr, ptr %2, align 8, !dbg !2073
  %48 = getelementptr inbounds nuw %struct.vms_matrix, ptr %47, i32 0, i32 0, !dbg !2074
  %49 = getelementptr inbounds nuw %struct.vms_vector, ptr %48, i32 0, i32 1, !dbg !2075
  %50 = load i32, ptr %49, align 4, !dbg !2075
  %51 = load ptr, ptr %2, align 8, !dbg !2076
  %52 = getelementptr inbounds nuw %struct.vms_matrix, ptr %51, i32 0, i32 1, !dbg !2077
  %53 = getelementptr inbounds nuw %struct.vms_vector, ptr %52, i32 0, i32 2, !dbg !2078
  %54 = load i32, ptr %53, align 4, !dbg !2078
  %55 = load ptr, ptr %2, align 8, !dbg !2079
  %56 = getelementptr inbounds nuw %struct.vms_matrix, ptr %55, i32 0, i32 2, !dbg !2080
  %57 = getelementptr inbounds nuw %struct.vms_vector, ptr %56, i32 0, i32 0, !dbg !2081
  %58 = load i32, ptr %57, align 4, !dbg !2081
  %59 = call noundef i32 @_Z6fixmulii(i32 noundef %54, i32 noundef %58), !dbg !2082
  %60 = call noundef i32 @_Z6fixmulii(i32 noundef %50, i32 noundef %59), !dbg !2083
  %61 = add nsw i32 %46, %60, !dbg !2084
  %62 = load ptr, ptr %2, align 8, !dbg !2085
  %63 = getelementptr inbounds nuw %struct.vms_matrix, ptr %62, i32 0, i32 0, !dbg !2086
  %64 = getelementptr inbounds nuw %struct.vms_vector, ptr %63, i32 0, i32 2, !dbg !2087
  %65 = load i32, ptr %64, align 4, !dbg !2087
  %66 = load ptr, ptr %2, align 8, !dbg !2088
  %67 = getelementptr inbounds nuw %struct.vms_matrix, ptr %66, i32 0, i32 1, !dbg !2089
  %68 = getelementptr inbounds nuw %struct.vms_vector, ptr %67, i32 0, i32 0, !dbg !2090
  %69 = load i32, ptr %68, align 4, !dbg !2090
  %70 = load ptr, ptr %2, align 8, !dbg !2091
  %71 = getelementptr inbounds nuw %struct.vms_matrix, ptr %70, i32 0, i32 2, !dbg !2092
  %72 = getelementptr inbounds nuw %struct.vms_vector, ptr %71, i32 0, i32 1, !dbg !2093
  %73 = load i32, ptr %72, align 4, !dbg !2093
  %74 = call noundef i32 @_Z6fixmulii(i32 noundef %69, i32 noundef %73), !dbg !2094
  %75 = call noundef i32 @_Z6fixmulii(i32 noundef %65, i32 noundef %74), !dbg !2095
  %76 = add nsw i32 %61, %75, !dbg !2096
  %77 = load ptr, ptr %2, align 8, !dbg !2097
  %78 = getelementptr inbounds nuw %struct.vms_matrix, ptr %77, i32 0, i32 0, !dbg !2098
  %79 = getelementptr inbounds nuw %struct.vms_vector, ptr %78, i32 0, i32 2, !dbg !2099
  %80 = load i32, ptr %79, align 4, !dbg !2099
  %81 = load ptr, ptr %2, align 8, !dbg !2100
  %82 = getelementptr inbounds nuw %struct.vms_matrix, ptr %81, i32 0, i32 1, !dbg !2101
  %83 = getelementptr inbounds nuw %struct.vms_vector, ptr %82, i32 0, i32 1, !dbg !2102
  %84 = load i32, ptr %83, align 4, !dbg !2102
  %85 = load ptr, ptr %2, align 8, !dbg !2103
  %86 = getelementptr inbounds nuw %struct.vms_matrix, ptr %85, i32 0, i32 2, !dbg !2104
  %87 = getelementptr inbounds nuw %struct.vms_vector, ptr %86, i32 0, i32 0, !dbg !2105
  %88 = load i32, ptr %87, align 4, !dbg !2105
  %89 = call noundef i32 @_Z6fixmulii(i32 noundef %84, i32 noundef %88), !dbg !2106
  %90 = call noundef i32 @_Z6fixmulii(i32 noundef %80, i32 noundef %89), !dbg !2107
  %91 = sub nsw i32 %76, %90, !dbg !2108
  ret i32 %91, !dbg !2109
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z18check_line_to_linePiS_P10vms_vectorS1_S1_S1_(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5) #2 !dbg !2110 {
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca %struct.vms_matrix, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  store ptr %0, ptr %8, align 8
    #dbg_declare(ptr %8, !2114, !DIExpression(), !2115)
  store ptr %1, ptr %9, align 8
    #dbg_declare(ptr %9, !2116, !DIExpression(), !2117)
  store ptr %2, ptr %10, align 8
    #dbg_declare(ptr %10, !2118, !DIExpression(), !2119)
  store ptr %3, ptr %11, align 8
    #dbg_declare(ptr %11, !2120, !DIExpression(), !2121)
  store ptr %4, ptr %12, align 8
    #dbg_declare(ptr %12, !2122, !DIExpression(), !2123)
  store ptr %5, ptr %13, align 8
    #dbg_declare(ptr %13, !2124, !DIExpression(), !2125)
    #dbg_declare(ptr %14, !2126, !DIExpression(), !2127)
    #dbg_declare(ptr %15, !2128, !DIExpression(), !2129)
    #dbg_declare(ptr %16, !2130, !DIExpression(), !2131)
  %17 = getelementptr inbounds nuw %struct.vms_matrix, ptr %14, i32 0, i32 0, !dbg !2132
  %18 = load ptr, ptr %12, align 8, !dbg !2133
  %19 = load ptr, ptr %10, align 8, !dbg !2134
  %20 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %17, ptr noundef %18, ptr noundef %19), !dbg !2135
  %21 = getelementptr inbounds nuw %struct.vms_matrix, ptr %14, i32 0, i32 2, !dbg !2136
  %22 = load ptr, ptr %11, align 8, !dbg !2136
  %23 = load ptr, ptr %13, align 8, !dbg !2136
  %24 = call noundef ptr @_Z16vm_vec_crossprodP10vms_vectorS0_S0_(ptr noundef %21, ptr noundef %22, ptr noundef %23), !dbg !2136
  %25 = getelementptr inbounds nuw %struct.vms_matrix, ptr %14, i32 0, i32 2, !dbg !2137
  %26 = getelementptr inbounds nuw %struct.vms_matrix, ptr %14, i32 0, i32 2, !dbg !2137
  %27 = call noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef %25, ptr noundef %26), !dbg !2137
  store i32 %27, ptr %16, align 4, !dbg !2138
  %28 = load i32, ptr %16, align 4, !dbg !2139
  %29 = icmp eq i32 %28, 0, !dbg !2141
  br i1 %29, label %30, label %31, !dbg !2141

30:                                               ; preds = %6
  store i32 0, ptr %7, align 4, !dbg !2142
  br label %60, !dbg !2142

31:                                               ; preds = %6
  %32 = load ptr, ptr %13, align 8, !dbg !2143
  %33 = getelementptr inbounds nuw %struct.vms_matrix, ptr %14, i32 0, i32 1, !dbg !2144
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %33, ptr align 4 %32, i64 12, i1 false), !dbg !2145
  %34 = call noundef i32 @_Z14calc_det_valueP10vms_matrix(ptr noundef %14), !dbg !2146
  store i32 %34, ptr %15, align 4, !dbg !2147
  %35 = load i32, ptr %15, align 4, !dbg !2148
  %36 = load i32, ptr %16, align 4, !dbg !2150
  %37 = call noundef i32 @_Z11oflow_checkii(i32 noundef %35, i32 noundef %36), !dbg !2151
  %38 = icmp ne i32 %37, 0, !dbg !2151
  br i1 %38, label %39, label %40, !dbg !2151

39:                                               ; preds = %31
  store i32 0, ptr %7, align 4, !dbg !2152
  br label %60, !dbg !2152

40:                                               ; preds = %31
  %41 = load i32, ptr %15, align 4, !dbg !2153
  %42 = load i32, ptr %16, align 4, !dbg !2154
  %43 = call noundef i32 @_Z6fixdivii(i32 noundef %41, i32 noundef %42), !dbg !2155
  %44 = load ptr, ptr %8, align 8, !dbg !2156
  store i32 %43, ptr %44, align 4, !dbg !2157
  br label %45

45:                                               ; preds = %40
  %46 = load ptr, ptr %11, align 8, !dbg !2158
  %47 = getelementptr inbounds nuw %struct.vms_matrix, ptr %14, i32 0, i32 1, !dbg !2159
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %47, ptr align 4 %46, i64 12, i1 false), !dbg !2160
  %48 = call noundef i32 @_Z14calc_det_valueP10vms_matrix(ptr noundef %14), !dbg !2161
  store i32 %48, ptr %15, align 4, !dbg !2162
  %49 = load i32, ptr %15, align 4, !dbg !2163
  %50 = load i32, ptr %16, align 4, !dbg !2165
  %51 = call noundef i32 @_Z11oflow_checkii(i32 noundef %49, i32 noundef %50), !dbg !2166
  %52 = icmp ne i32 %51, 0, !dbg !2166
  br i1 %52, label %53, label %54, !dbg !2166

53:                                               ; preds = %45
  store i32 0, ptr %7, align 4, !dbg !2167
  br label %60, !dbg !2167

54:                                               ; preds = %45
  %55 = load i32, ptr %15, align 4, !dbg !2168
  %56 = load i32, ptr %16, align 4, !dbg !2169
  %57 = call noundef i32 @_Z6fixdivii(i32 noundef %55, i32 noundef %56), !dbg !2170
  %58 = load ptr, ptr %9, align 8, !dbg !2171
  store i32 %57, ptr %58, align 4, !dbg !2172
  br label %59

59:                                               ; preds = %54
  store i32 1, ptr %7, align 4, !dbg !2173
  br label %60, !dbg !2173

60:                                               ; preds = %59, %53, %39, %30
  %61 = load i32, ptr %7, align 4, !dbg !2174
  ret i32 %61, !dbg !2174
}

declare noundef ptr @_Z16vm_vec_crossprodP10vms_vectorS0_S0_(ptr noundef, ptr noundef, ptr noundef) #3

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z26special_check_line_to_faceP10vms_vectorS0_S0_P7segmentiiii(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, i32 noundef %6, i32 noundef %7) #2 !dbg !2175 {
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca %struct.vms_vector, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca [6 x i32], align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca ptr, align 8
  %31 = alloca ptr, align 8
  %32 = alloca %struct.vms_vector, align 4
  %33 = alloca ptr, align 8
  %34 = alloca %struct.vms_vector, align 4
  %35 = alloca %struct.vms_vector, align 4
  store ptr %0, ptr %10, align 8
    #dbg_declare(ptr %10, !2176, !DIExpression(), !2177)
  store ptr %1, ptr %11, align 8
    #dbg_declare(ptr %11, !2178, !DIExpression(), !2179)
  store ptr %2, ptr %12, align 8
    #dbg_declare(ptr %12, !2180, !DIExpression(), !2181)
  store ptr %3, ptr %13, align 8
    #dbg_declare(ptr %13, !2182, !DIExpression(), !2183)
  store i32 %4, ptr %14, align 4
    #dbg_declare(ptr %14, !2184, !DIExpression(), !2185)
  store i32 %5, ptr %15, align 4
    #dbg_declare(ptr %15, !2186, !DIExpression(), !2187)
  store i32 %6, ptr %16, align 4
    #dbg_declare(ptr %16, !2188, !DIExpression(), !2189)
  store i32 %7, ptr %17, align 4
    #dbg_declare(ptr %17, !2190, !DIExpression(), !2191)
  %36 = load i32, ptr @disable_new_fvi_stuff, align 4, !dbg !2192
  %37 = icmp ne i32 %36, 0, !dbg !2192
  br i1 %37, label %38, label %48, !dbg !2192

38:                                               ; preds = %8
  %39 = load ptr, ptr %10, align 8, !dbg !2194
  %40 = load ptr, ptr %11, align 8, !dbg !2195
  %41 = load ptr, ptr %12, align 8, !dbg !2196
  %42 = load ptr, ptr %13, align 8, !dbg !2197
  %43 = load i32, ptr %14, align 4, !dbg !2198
  %44 = load i32, ptr %15, align 4, !dbg !2199
  %45 = load i32, ptr %16, align 4, !dbg !2200
  %46 = load i32, ptr %17, align 4, !dbg !2201
  %47 = call noundef i32 @_Z18check_line_to_faceP10vms_vectorS0_S0_P7segmentiiii(ptr noundef %39, ptr noundef %40, ptr noundef %41, ptr noundef %42, i32 noundef %43, i32 noundef %44, i32 noundef %45, i32 noundef %46), !dbg !2202
  store i32 %47, ptr %9, align 4, !dbg !2203
  br label %181, !dbg !2203

48:                                               ; preds = %8
  %49 = load ptr, ptr %13, align 8, !dbg !2204
  %50 = ptrtoint ptr %49 to i64, !dbg !2206
  %51 = sub i64 %50, ptrtoint (ptr @Segments to i64), !dbg !2206
  %52 = sdiv exact i64 %51, 512, !dbg !2206
  %53 = icmp eq i64 %52, -1, !dbg !2207
  br i1 %53, label %54, label %55, !dbg !2207

54:                                               ; preds = %48
  call void (ptr, ...) @_Z5ErrorPKcz(ptr noundef @.str.3), !dbg !2208
  br label %55, !dbg !2208

55:                                               ; preds = %54, %48
    #dbg_declare(ptr %18, !2209, !DIExpression(), !2211)
    #dbg_declare(ptr %19, !2212, !DIExpression(), !2213)
    #dbg_declare(ptr %20, !2214, !DIExpression(), !2215)
    #dbg_declare(ptr %21, !2216, !DIExpression(), !2217)
    #dbg_declare(ptr %22, !2218, !DIExpression(), !2219)
    #dbg_declare(ptr %23, !2220, !DIExpression(), !2221)
    #dbg_declare(ptr %24, !2222, !DIExpression(), !2223)
    #dbg_declare(ptr %25, !2224, !DIExpression(), !2225)
    #dbg_declare(ptr %26, !2226, !DIExpression(), !2227)
    #dbg_declare(ptr %27, !2228, !DIExpression(), !2229)
    #dbg_declare(ptr %28, !2230, !DIExpression(), !2231)
    #dbg_declare(ptr %29, !2232, !DIExpression(), !2233)
    #dbg_declare(ptr %30, !2234, !DIExpression(), !2235)
    #dbg_declare(ptr %31, !2236, !DIExpression(), !2237)
    #dbg_declare(ptr %32, !2238, !DIExpression(), !2239)
    #dbg_declare(ptr %33, !2240, !DIExpression(), !2241)
  %56 = load ptr, ptr %13, align 8, !dbg !2242
  %57 = getelementptr inbounds nuw %struct.segment, ptr %56, i32 0, i32 0, !dbg !2243
  %58 = load i32, ptr %14, align 4, !dbg !2244
  %59 = sext i32 %58 to i64, !dbg !2242
  %60 = getelementptr inbounds [6 x %struct.side], ptr %57, i64 0, i64 %59, !dbg !2242
  store ptr %60, ptr %33, align 8, !dbg !2241
    #dbg_declare(ptr %34, !2245, !DIExpression(), !2246)
    #dbg_declare(ptr %35, !2247, !DIExpression(), !2248)
  %61 = getelementptr inbounds [6 x i32], ptr %26, i64 0, i64 0, !dbg !2249
  %62 = load ptr, ptr %13, align 8, !dbg !2250
  %63 = ptrtoint ptr %62 to i64, !dbg !2251
  %64 = sub i64 %63, ptrtoint (ptr @Segments to i64), !dbg !2251
  %65 = sdiv exact i64 %64, 512, !dbg !2251
  %66 = trunc i64 %65 to i32, !dbg !2250
  %67 = load i32, ptr %14, align 4, !dbg !2252
  call void @_Z23create_abs_vertex_listsPiS_ii(ptr noundef %27, ptr noundef %61, i32 noundef %66, i32 noundef %67), !dbg !2253
  %68 = load ptr, ptr %12, align 8, !dbg !2254
  %69 = load ptr, ptr %11, align 8, !dbg !2255
  %70 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %18, ptr noundef %68, ptr noundef %69), !dbg !2256
  %71 = load ptr, ptr %11, align 8, !dbg !2257
  %72 = load ptr, ptr %33, align 8, !dbg !2258
  %73 = load i32, ptr %15, align 4, !dbg !2259
  %74 = load i32, ptr %16, align 4, !dbg !2260
  %75 = getelementptr inbounds [6 x i32], ptr %26, i64 0, i64 0, !dbg !2261
  %76 = call noundef i32 @_Z19check_point_to_faceP10vms_vectorP4sideiiPi(ptr noundef %71, ptr noundef %72, i32 noundef %73, i32 noundef %74, ptr noundef %75), !dbg !2262
  store i32 %76, ptr %29, align 4, !dbg !2263
  %77 = load i32, ptr %29, align 4, !dbg !2264
  %78 = icmp eq i32 %77, 0, !dbg !2266
  br i1 %78, label %79, label %89, !dbg !2266

79:                                               ; preds = %55
  %80 = load ptr, ptr %10, align 8, !dbg !2267
  %81 = load ptr, ptr %11, align 8, !dbg !2268
  %82 = load ptr, ptr %12, align 8, !dbg !2269
  %83 = load ptr, ptr %13, align 8, !dbg !2270
  %84 = load i32, ptr %14, align 4, !dbg !2271
  %85 = load i32, ptr %15, align 4, !dbg !2272
  %86 = load i32, ptr %16, align 4, !dbg !2273
  %87 = load i32, ptr %17, align 4, !dbg !2274
  %88 = call noundef i32 @_Z18check_line_to_faceP10vms_vectorS0_S0_P7segmentiiii(ptr noundef %80, ptr noundef %81, ptr noundef %82, ptr noundef %83, i32 noundef %84, i32 noundef %85, i32 noundef %86, i32 noundef %87), !dbg !2275
  store i32 %88, ptr %9, align 4, !dbg !2276
  br label %181, !dbg !2276

89:                                               ; preds = %55
  store i32 0, ptr %28, align 4, !dbg !2277
  br label %90, !dbg !2279

90:                                               ; preds = %96, %89
  %91 = load i32, ptr %29, align 4, !dbg !2280
  %92 = and i32 %91, 1, !dbg !2282
  %93 = icmp ne i32 %92, 0, !dbg !2283
  %94 = xor i1 %93, true, !dbg !2284
  br i1 %94, label %95, label %101, !dbg !2285

95:                                               ; preds = %90
  br label %96, !dbg !2285

96:                                               ; preds = %95
  %97 = load i32, ptr %29, align 4, !dbg !2286
  %98 = lshr i32 %97, 1, !dbg !2286
  store i32 %98, ptr %29, align 4, !dbg !2286
  %99 = load i32, ptr %28, align 4, !dbg !2287
  %100 = add nsw i32 %99, 1, !dbg !2287
  store i32 %100, ptr %28, align 4, !dbg !2287
  br label %90, !dbg !2288, !llvm.loop !2289

101:                                              ; preds = %90
  %102 = load i32, ptr %15, align 4, !dbg !2291
  %103 = mul nsw i32 %102, 3, !dbg !2292
  %104 = load i32, ptr %28, align 4, !dbg !2293
  %105 = add nsw i32 %103, %104, !dbg !2294
  %106 = sext i32 %105 to i64, !dbg !2295
  %107 = getelementptr inbounds [6 x i32], ptr %26, i64 0, i64 %106, !dbg !2295
  %108 = load i32, ptr %107, align 4, !dbg !2295
  %109 = sext i32 %108 to i64, !dbg !2296
  %110 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %109, !dbg !2296
  store ptr %110, ptr %30, align 8, !dbg !2297
  %111 = load i32, ptr %15, align 4, !dbg !2298
  %112 = mul nsw i32 %111, 3, !dbg !2299
  %113 = load i32, ptr %28, align 4, !dbg !2300
  %114 = add nsw i32 %113, 1, !dbg !2301
  %115 = load i32, ptr %16, align 4, !dbg !2302
  %116 = srem i32 %114, %115, !dbg !2303
  %117 = add nsw i32 %112, %116, !dbg !2304
  %118 = sext i32 %117 to i64, !dbg !2305
  %119 = getelementptr inbounds [6 x i32], ptr %26, i64 0, i64 %118, !dbg !2305
  %120 = load i32, ptr %119, align 4, !dbg !2305
  %121 = sext i32 %120 to i64, !dbg !2306
  %122 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %121, !dbg !2306
  store ptr %122, ptr %31, align 8, !dbg !2307
  %123 = load ptr, ptr %31, align 8, !dbg !2308
  %124 = load ptr, ptr %30, align 8, !dbg !2309
  %125 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %32, ptr noundef %123, ptr noundef %124), !dbg !2310
  %126 = call noundef i32 @_Z16vm_vec_normalizeP10vms_vector(ptr noundef %32), !dbg !2311
  store i32 %126, ptr %24, align 4, !dbg !2312
  %127 = call noundef i32 @_Z16vm_vec_normalizeP10vms_vector(ptr noundef %18), !dbg !2313
  store i32 %127, ptr %25, align 4, !dbg !2314
  %128 = load ptr, ptr %30, align 8, !dbg !2315
  %129 = load ptr, ptr %11, align 8, !dbg !2316
  %130 = call noundef i32 @_Z18check_line_to_linePiS_P10vms_vectorS1_S1_S1_(ptr noundef %19, ptr noundef %20, ptr noundef %128, ptr noundef %32, ptr noundef %129, ptr noundef %18), !dbg !2317
  %131 = load i32, ptr %20, align 4, !dbg !2318
  %132 = icmp slt i32 %131, 0, !dbg !2320
  br i1 %132, label %139, label %133, !dbg !2321

133:                                              ; preds = %101
  %134 = load i32, ptr %20, align 4, !dbg !2322
  %135 = load i32, ptr %25, align 4, !dbg !2323
  %136 = load i32, ptr %17, align 4, !dbg !2324
  %137 = add nsw i32 %135, %136, !dbg !2325
  %138 = icmp sgt i32 %134, %137, !dbg !2326
  br i1 %138, label %139, label %140, !dbg !2321

139:                                              ; preds = %133, %101
  store i32 0, ptr %9, align 4, !dbg !2327
  br label %181, !dbg !2327

140:                                              ; preds = %133
  %141 = load i32, ptr %20, align 4, !dbg !2328
  %142 = load i32, ptr %25, align 4, !dbg !2330
  %143 = icmp sgt i32 %141, %142, !dbg !2331
  br i1 %143, label %144, label %146, !dbg !2331

144:                                              ; preds = %140
  %145 = load i32, ptr %25, align 4, !dbg !2332
  store i32 %145, ptr %22, align 4, !dbg !2333
  br label %148, !dbg !2334

146:                                              ; preds = %140
  %147 = load i32, ptr %20, align 4, !dbg !2335
  store i32 %147, ptr %22, align 4, !dbg !2336
  br label %148

148:                                              ; preds = %146, %144
  %149 = load i32, ptr %19, align 4, !dbg !2337
  %150 = icmp slt i32 %149, 0, !dbg !2339
  br i1 %150, label %151, label %152, !dbg !2339

151:                                              ; preds = %148
  store i32 0, ptr %21, align 4, !dbg !2340
  br label %154, !dbg !2341

152:                                              ; preds = %148
  %153 = load i32, ptr %19, align 4, !dbg !2342
  store i32 %153, ptr %21, align 4, !dbg !2343
  br label %154

154:                                              ; preds = %152, %151
  %155 = load i32, ptr %21, align 4, !dbg !2344
  %156 = load i32, ptr %24, align 4, !dbg !2346
  %157 = icmp sgt i32 %155, %156, !dbg !2347
  br i1 %157, label %158, label %160, !dbg !2347

158:                                              ; preds = %154
  %159 = load i32, ptr %24, align 4, !dbg !2348
  store i32 %159, ptr %21, align 4, !dbg !2349
  br label %160, !dbg !2350

160:                                              ; preds = %158, %154
  %161 = load ptr, ptr %30, align 8, !dbg !2351
  %162 = load i32, ptr %21, align 4, !dbg !2352
  %163 = call noundef ptr @_Z16vm_vec_scale_addP10vms_vectorS0_S0_i(ptr noundef %34, ptr noundef %161, ptr noundef %32, i32 noundef %162), !dbg !2353
  %164 = load ptr, ptr %11, align 8, !dbg !2354
  %165 = load i32, ptr %22, align 4, !dbg !2355
  %166 = call noundef ptr @_Z16vm_vec_scale_addP10vms_vectorS0_S0_i(ptr noundef %35, ptr noundef %164, ptr noundef %18, i32 noundef %165), !dbg !2356
  %167 = call noundef i32 @_Z11vm_vec_distP10vms_vectorS0_(ptr noundef %34, ptr noundef %35), !dbg !2357
  store i32 %167, ptr %23, align 4, !dbg !2358
  %168 = load i32, ptr %23, align 4, !dbg !2359
  %169 = load i32, ptr %17, align 4, !dbg !2361
  %170 = mul nsw i32 %169, 15, !dbg !2362
  %171 = sdiv i32 %170, 20, !dbg !2363
  %172 = icmp slt i32 %168, %171, !dbg !2364
  br i1 %172, label %173, label %180, !dbg !2364

173:                                              ; preds = %160
  %174 = load ptr, ptr %10, align 8, !dbg !2365
  %175 = load ptr, ptr %11, align 8, !dbg !2367
  %176 = load i32, ptr %20, align 4, !dbg !2368
  %177 = load i32, ptr %17, align 4, !dbg !2369
  %178 = sub nsw i32 %176, %177, !dbg !2370
  %179 = call noundef ptr @_Z16vm_vec_scale_addP10vms_vectorS0_S0_i(ptr noundef %174, ptr noundef %175, ptr noundef %18, i32 noundef %178), !dbg !2371
  store i32 2, ptr %9, align 4, !dbg !2372
  br label %181, !dbg !2372

180:                                              ; preds = %160
  store i32 0, ptr %9, align 4, !dbg !2373
  br label %181, !dbg !2373

181:                                              ; preds = %180, %173, %139, %79, %38
  %182 = load i32, ptr %9, align 4, !dbg !2374
  ret i32 %182, !dbg !2374
}

declare noundef i32 @_Z16vm_vec_normalizeP10vms_vector(ptr noundef) #3

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z24check_vector_to_sphere_1P10vms_vectorS0_S0_S0_i(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, i32 noundef %4) #2 !dbg !2375 {
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca %struct.vms_vector, align 4
  %13 = alloca %struct.vms_vector, align 4
  %14 = alloca %struct.vms_vector, align 4
  %15 = alloca %struct.vms_vector, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  store ptr %0, ptr %7, align 8
    #dbg_declare(ptr %7, !2378, !DIExpression(), !2379)
  store ptr %1, ptr %8, align 8
    #dbg_declare(ptr %8, !2380, !DIExpression(), !2381)
  store ptr %2, ptr %9, align 8
    #dbg_declare(ptr %9, !2382, !DIExpression(), !2383)
  store ptr %3, ptr %10, align 8
    #dbg_declare(ptr %10, !2384, !DIExpression(), !2385)
  store i32 %4, ptr %11, align 4
    #dbg_declare(ptr %11, !2386, !DIExpression(), !2387)
    #dbg_declare(ptr %12, !2388, !DIExpression(), !2390)
    #dbg_declare(ptr %13, !2391, !DIExpression(), !2392)
    #dbg_declare(ptr %14, !2393, !DIExpression(), !2394)
    #dbg_declare(ptr %15, !2395, !DIExpression(), !2396)
    #dbg_declare(ptr %16, !2397, !DIExpression(), !2398)
    #dbg_declare(ptr %17, !2399, !DIExpression(), !2400)
    #dbg_declare(ptr %18, !2401, !DIExpression(), !2402)
    #dbg_declare(ptr %19, !2403, !DIExpression(), !2404)
  %23 = load ptr, ptr %9, align 8, !dbg !2405
  %24 = load ptr, ptr %8, align 8, !dbg !2406
  %25 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %12, ptr noundef %23, ptr noundef %24), !dbg !2407
  %26 = load ptr, ptr %10, align 8, !dbg !2408
  %27 = load ptr, ptr %8, align 8, !dbg !2409
  %28 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %14, ptr noundef %26, ptr noundef %27), !dbg !2410
  %29 = call noundef i32 @_Z21vm_vec_copy_normalizeP10vms_vectorS0_(ptr noundef %13, ptr noundef %12), !dbg !2411
  store i32 %29, ptr %16, align 4, !dbg !2412
  %30 = load i32, ptr %16, align 4, !dbg !2413
  %31 = icmp eq i32 %30, 0, !dbg !2415
  br i1 %31, label %32, label %44, !dbg !2415

32:                                               ; preds = %5
  %33 = call noundef i32 @_Z10vm_vec_magP10vms_vector(ptr noundef %14), !dbg !2416
  store i32 %33, ptr %19, align 4, !dbg !2418
  %34 = load ptr, ptr %8, align 8, !dbg !2419
  %35 = load ptr, ptr %7, align 8, !dbg !2420
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %35, ptr align 4 %34, i64 12, i1 false), !dbg !2421
  %36 = load i32, ptr %19, align 4, !dbg !2422
  %37 = load i32, ptr %11, align 4, !dbg !2423
  %38 = icmp slt i32 %36, %37, !dbg !2424
  br i1 %38, label %39, label %41, !dbg !2425

39:                                               ; preds = %32
  %40 = load i32, ptr %19, align 4, !dbg !2426
  br label %42, !dbg !2425

41:                                               ; preds = %32
  br label %42, !dbg !2425

42:                                               ; preds = %41, %39
  %43 = phi i32 [ %40, %39 ], [ 0, %41 ], !dbg !2425
  store i32 %43, ptr %6, align 4, !dbg !2427
  br label %95, !dbg !2427

44:                                               ; preds = %5
  %45 = call noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef %13, ptr noundef %14), !dbg !2428
  store i32 %45, ptr %18, align 4, !dbg !2429
  %46 = load i32, ptr %18, align 4, !dbg !2430
  %47 = icmp slt i32 %46, 0, !dbg !2432
  br i1 %47, label %48, label %49, !dbg !2432

48:                                               ; preds = %44
  store i32 0, ptr %6, align 4, !dbg !2433
  br label %95, !dbg !2433

49:                                               ; preds = %44
  %50 = load i32, ptr %18, align 4, !dbg !2434
  %51 = load i32, ptr %16, align 4, !dbg !2436
  %52 = load i32, ptr %11, align 4, !dbg !2437
  %53 = add nsw i32 %51, %52, !dbg !2438
  %54 = icmp sgt i32 %50, %53, !dbg !2439
  br i1 %54, label %55, label %56, !dbg !2439

55:                                               ; preds = %49
  store i32 0, ptr %6, align 4, !dbg !2440
  br label %95, !dbg !2440

56:                                               ; preds = %49
  %57 = load ptr, ptr %8, align 8, !dbg !2441
  %58 = load i32, ptr %18, align 4, !dbg !2442
  %59 = call noundef ptr @_Z16vm_vec_scale_addP10vms_vectorS0_S0_i(ptr noundef %15, ptr noundef %57, ptr noundef %13, i32 noundef %58), !dbg !2443
  %60 = load ptr, ptr %10, align 8, !dbg !2444
  %61 = call noundef i32 @_Z11vm_vec_distP10vms_vectorS0_(ptr noundef %15, ptr noundef %60), !dbg !2445
  store i32 %61, ptr %17, align 4, !dbg !2446
  %62 = load i32, ptr %17, align 4, !dbg !2447
  %63 = load i32, ptr %11, align 4, !dbg !2449
  %64 = icmp slt i32 %62, %63, !dbg !2450
  br i1 %64, label %65, label %94, !dbg !2450

65:                                               ; preds = %56
    #dbg_declare(ptr %20, !2451, !DIExpression(), !2453)
    #dbg_declare(ptr %21, !2454, !DIExpression(), !2455)
    #dbg_declare(ptr %22, !2456, !DIExpression(), !2457)
  %66 = load i32, ptr %17, align 4, !dbg !2458
  %67 = load i32, ptr %17, align 4, !dbg !2459
  %68 = call noundef i32 @_Z6fixmulii(i32 noundef %66, i32 noundef %67), !dbg !2460
  store i32 %68, ptr %20, align 4, !dbg !2461
  %69 = load i32, ptr %11, align 4, !dbg !2462
  %70 = load i32, ptr %11, align 4, !dbg !2463
  %71 = call noundef i32 @_Z6fixmulii(i32 noundef %69, i32 noundef %70), !dbg !2464
  store i32 %71, ptr %21, align 4, !dbg !2465
  %72 = load i32, ptr %21, align 4, !dbg !2466
  %73 = load i32, ptr %20, align 4, !dbg !2467
  %74 = sub nsw i32 %72, %73, !dbg !2468
  %75 = call noundef i32 @_Z8fix_sqrti(i32 noundef %74), !dbg !2469
  store i32 %75, ptr %22, align 4, !dbg !2470
  %76 = load i32, ptr %18, align 4, !dbg !2471
  %77 = load i32, ptr %22, align 4, !dbg !2472
  %78 = sub nsw i32 %76, %77, !dbg !2473
  store i32 %78, ptr %19, align 4, !dbg !2474
  %79 = load i32, ptr %19, align 4, !dbg !2475
  %80 = load i32, ptr %16, align 4, !dbg !2477
  %81 = icmp sgt i32 %79, %80, !dbg !2478
  br i1 %81, label %85, label %82, !dbg !2479

82:                                               ; preds = %65
  %83 = load i32, ptr %19, align 4, !dbg !2480
  %84 = icmp slt i32 %83, 0, !dbg !2481
  br i1 %84, label %85, label %88, !dbg !2479

85:                                               ; preds = %82, %65
  %86 = load ptr, ptr %8, align 8, !dbg !2482
  %87 = load ptr, ptr %7, align 8, !dbg !2484
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %87, ptr align 4 %86, i64 12, i1 false), !dbg !2485
  store i32 1, ptr %6, align 4, !dbg !2486
  br label %95, !dbg !2486

88:                                               ; preds = %82
  %89 = load ptr, ptr %7, align 8, !dbg !2487
  %90 = load ptr, ptr %8, align 8, !dbg !2488
  %91 = load i32, ptr %19, align 4, !dbg !2489
  %92 = call noundef ptr @_Z16vm_vec_scale_addP10vms_vectorS0_S0_i(ptr noundef %89, ptr noundef %90, ptr noundef %13, i32 noundef %91), !dbg !2490
  %93 = load i32, ptr %19, align 4, !dbg !2491
  store i32 %93, ptr %6, align 4, !dbg !2492
  br label %95, !dbg !2492

94:                                               ; preds = %56
  store i32 0, ptr %6, align 4, !dbg !2493
  br label %95, !dbg !2493

95:                                               ; preds = %94, %88, %85, %55, %48, %42
  %96 = load i32, ptr %6, align 4, !dbg !2494
  ret i32 %96, !dbg !2494
}

declare noundef i32 @_Z21vm_vec_copy_normalizeP10vms_vectorS0_(ptr noundef, ptr noundef) #3

declare noundef i32 @_Z10vm_vec_magP10vms_vector(ptr noundef) #3

declare noundef i32 @_Z8fix_sqrti(i32 noundef) #3

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z22check_vector_to_objectP10vms_vectorS0_S0_iP6objectS2_(ptr noundef %0, ptr noundef %1, ptr noundef %2, i32 noundef %3, ptr noundef %4, ptr noundef %5) #2 !dbg !2495 {
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  store ptr %0, ptr %7, align 8
    #dbg_declare(ptr %7, !2624, !DIExpression(), !2625)
  store ptr %1, ptr %8, align 8
    #dbg_declare(ptr %8, !2626, !DIExpression(), !2627)
  store ptr %2, ptr %9, align 8
    #dbg_declare(ptr %9, !2628, !DIExpression(), !2629)
  store i32 %3, ptr %10, align 4
    #dbg_declare(ptr %10, !2630, !DIExpression(), !2631)
  store ptr %4, ptr %11, align 8
    #dbg_declare(ptr %11, !2632, !DIExpression(), !2633)
  store ptr %5, ptr %12, align 8
    #dbg_declare(ptr %12, !2634, !DIExpression(), !2635)
    #dbg_declare(ptr %13, !2636, !DIExpression(), !2638)
  %14 = load ptr, ptr %11, align 8, !dbg !2639
  %15 = getelementptr inbounds nuw %struct.object, ptr %14, i32 0, i32 13, !dbg !2640
  %16 = load i32, ptr %15, align 4, !dbg !2640
  store i32 %16, ptr %13, align 4, !dbg !2638
  %17 = load ptr, ptr %11, align 8, !dbg !2641
  %18 = getelementptr inbounds nuw %struct.object, ptr %17, i32 0, i32 1, !dbg !2643
  %19 = load i8, ptr %18, align 4, !dbg !2643
  %20 = zext i8 %19 to i32, !dbg !2641
  %21 = icmp eq i32 %20, 2, !dbg !2644
  br i1 %21, label %22, label %35, !dbg !2645

22:                                               ; preds = %6
  %23 = load ptr, ptr %11, align 8, !dbg !2646
  %24 = getelementptr inbounds nuw %struct.object, ptr %23, i32 0, i32 2, !dbg !2647
  %25 = load i8, ptr %24, align 1, !dbg !2647
  %26 = zext i8 %25 to i64, !dbg !2648
  %27 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %26, !dbg !2648
  %28 = getelementptr inbounds nuw %struct.robot_info, ptr %27, i32 0, i32 31, !dbg !2649
  %29 = load i8, ptr %28, align 1, !dbg !2649
  %30 = icmp ne i8 %29, 0, !dbg !2648
  br i1 %30, label %31, label %35, !dbg !2645

31:                                               ; preds = %22
  %32 = load i32, ptr %13, align 4, !dbg !2650
  %33 = mul nsw i32 %32, 3, !dbg !2651
  %34 = sdiv i32 %33, 4, !dbg !2652
  store i32 %34, ptr %13, align 4, !dbg !2653
  br label %35, !dbg !2654

35:                                               ; preds = %31, %22, %6
  %36 = load ptr, ptr %11, align 8, !dbg !2655
  %37 = getelementptr inbounds nuw %struct.object, ptr %36, i32 0, i32 1, !dbg !2657
  %38 = load i8, ptr %37, align 4, !dbg !2657
  %39 = zext i8 %38 to i32, !dbg !2655
  %40 = icmp eq i32 %39, 4, !dbg !2658
  br i1 %40, label %41, label %67, !dbg !2659

41:                                               ; preds = %35
  %42 = load ptr, ptr %12, align 8, !dbg !2660
  %43 = getelementptr inbounds nuw %struct.object, ptr %42, i32 0, i32 1, !dbg !2661
  %44 = load i8, ptr %43, align 4, !dbg !2661
  %45 = zext i8 %44 to i32, !dbg !2660
  %46 = icmp eq i32 %45, 4, !dbg !2662
  br i1 %46, label %64, label %47, !dbg !2663

47:                                               ; preds = %41
  %48 = load i32, ptr @Game_mode, align 4, !dbg !2664
  %49 = and i32 %48, 16, !dbg !2665
  %50 = icmp ne i32 %49, 0, !dbg !2666
  br i1 %50, label %51, label %67, !dbg !2667

51:                                               ; preds = %47
  %52 = load ptr, ptr %12, align 8, !dbg !2668
  %53 = getelementptr inbounds nuw %struct.object, ptr %52, i32 0, i32 1, !dbg !2669
  %54 = load i8, ptr %53, align 4, !dbg !2669
  %55 = zext i8 %54 to i32, !dbg !2668
  %56 = icmp eq i32 %55, 5, !dbg !2670
  br i1 %56, label %57, label %67, !dbg !2671

57:                                               ; preds = %51
  %58 = load ptr, ptr %12, align 8, !dbg !2672
  %59 = getelementptr inbounds nuw %struct.object, ptr %58, i32 0, i32 22, !dbg !2673
  %60 = getelementptr inbounds nuw %struct.laser_info_s, ptr %59, i32 0, i32 0, !dbg !2674
  %61 = load i16, ptr %60, align 4, !dbg !2674
  %62 = sext i16 %61 to i32, !dbg !2672
  %63 = icmp eq i32 %62, 4, !dbg !2675
  br i1 %63, label %64, label %67, !dbg !2659

64:                                               ; preds = %57, %41
  %65 = load i32, ptr %13, align 4, !dbg !2676
  %66 = sdiv i32 %65, 2, !dbg !2677
  store i32 %66, ptr %13, align 4, !dbg !2678
  br label %67, !dbg !2679

67:                                               ; preds = %64, %57, %51, %47, %35
  %68 = load ptr, ptr %7, align 8, !dbg !2680
  %69 = load ptr, ptr %8, align 8, !dbg !2681
  %70 = load ptr, ptr %9, align 8, !dbg !2682
  %71 = load ptr, ptr %11, align 8, !dbg !2683
  %72 = getelementptr inbounds nuw %struct.object, ptr %71, i32 0, i32 11, !dbg !2684
  %73 = load i32, ptr %13, align 4, !dbg !2685
  %74 = load i32, ptr %10, align 4, !dbg !2686
  %75 = add nsw i32 %73, %74, !dbg !2687
  %76 = call noundef i32 @_Z24check_vector_to_sphere_1P10vms_vectorS0_S0_S0_i(ptr noundef %68, ptr noundef %69, ptr noundef %70, ptr noundef %72, i32 noundef %75), !dbg !2688
  ret i32 %76, !dbg !2689
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z24find_vector_intersectionP9fvi_queryP8fvi_info(ptr noundef %0, ptr noundef %1) #2 !dbg !2690 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct.vms_vector, align 4
  %10 = alloca i32, align 4
  %11 = alloca %struct.segmasks, align 2
  %12 = alloca %struct.segmasks, align 2
  %13 = alloca %struct.segmasks, align 2
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca %struct.vms_vector, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !2719, !DIExpression(), !2720)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !2721, !DIExpression(), !2722)
    #dbg_declare(ptr %6, !2723, !DIExpression(), !2725)
    #dbg_declare(ptr %7, !2726, !DIExpression(), !2727)
    #dbg_declare(ptr %8, !2728, !DIExpression(), !2729)
    #dbg_declare(ptr %9, !2730, !DIExpression(), !2731)
    #dbg_declare(ptr %10, !2732, !DIExpression(), !2733)
  %17 = load ptr, ptr %4, align 8, !dbg !2734
  %18 = getelementptr inbounds nuw %struct.fvi_query, ptr %17, i32 0, i32 5, !dbg !2734
  %19 = load ptr, ptr %18, align 8, !dbg !2734
  %20 = icmp ne ptr %19, inttoptr (i64 -1 to ptr), !dbg !2734
  %21 = zext i1 %20 to i32, !dbg !2734
  call void @_Z7_AssertiPKcS0_i(i32 noundef %21, ptr noundef @.str.4, ptr noundef @.str.1, i32 noundef 861), !dbg !2734
  %22 = load ptr, ptr %4, align 8, !dbg !2735
  %23 = getelementptr inbounds nuw %struct.fvi_query, ptr %22, i32 0, i32 2, !dbg !2735
  %24 = load i32, ptr %23, align 8, !dbg !2735
  %25 = load i32, ptr @Highest_segment_index, align 4, !dbg !2735
  %26 = icmp sle i32 %24, %25, !dbg !2735
  br i1 %26, label %27, label %32, !dbg !2735

27:                                               ; preds = %2
  %28 = load ptr, ptr %4, align 8, !dbg !2735
  %29 = getelementptr inbounds nuw %struct.fvi_query, ptr %28, i32 0, i32 2, !dbg !2735
  %30 = load i32, ptr %29, align 8, !dbg !2735
  %31 = icmp sge i32 %30, 0, !dbg !2735
  br label %32

32:                                               ; preds = %27, %2
  %33 = phi i1 [ false, %2 ], [ %31, %27 ], !dbg !2736
  %34 = zext i1 %33 to i32, !dbg !2735
  call void @_Z7_AssertiPKcS0_i(i32 noundef %34, ptr noundef @.str.5, ptr noundef @.str.1, i32 noundef 862), !dbg !2735
  store i32 -1, ptr @fvi_hit_seg, align 4, !dbg !2737
  store i32 -1, ptr @fvi_hit_side, align 4, !dbg !2738
  store i32 -1, ptr @fvi_hit_object, align 4, !dbg !2739
  %35 = load ptr, ptr %4, align 8, !dbg !2740
  %36 = getelementptr inbounds nuw %struct.fvi_query, ptr %35, i32 0, i32 0, !dbg !2742
  %37 = load ptr, ptr %36, align 8, !dbg !2742
  %38 = load ptr, ptr %4, align 8, !dbg !2743
  %39 = getelementptr inbounds nuw %struct.fvi_query, ptr %38, i32 0, i32 2, !dbg !2744
  %40 = load i32, ptr %39, align 8, !dbg !2744
  %41 = call i32 @_Z13get_seg_masksP10vms_vectorii(ptr noundef %37, i32 noundef %40, i32 noundef 0), !dbg !2745
  store i32 %41, ptr %11, align 2, !dbg !2745
  %42 = getelementptr inbounds nuw %struct.segmasks, ptr %11, i32 0, i32 2, !dbg !2746
  %43 = load i8, ptr %42, align 1, !dbg !2746
  %44 = sext i8 %43 to i32, !dbg !2745
  %45 = icmp eq i32 %44, 0, !dbg !2747
  %46 = xor i1 %45, true, !dbg !2748
  br i1 %46, label %47, label %69, !dbg !2748

47:                                               ; preds = %32
  %48 = load ptr, ptr %5, align 8, !dbg !2749
  %49 = getelementptr inbounds nuw %struct.fvi_info, ptr %48, i32 0, i32 0, !dbg !2751
  store i32 3, ptr %49, align 4, !dbg !2752
  %50 = load ptr, ptr %4, align 8, !dbg !2753
  %51 = getelementptr inbounds nuw %struct.fvi_query, ptr %50, i32 0, i32 0, !dbg !2754
  %52 = load ptr, ptr %51, align 8, !dbg !2754
  %53 = load ptr, ptr %5, align 8, !dbg !2755
  %54 = getelementptr inbounds nuw %struct.fvi_info, ptr %53, i32 0, i32 1, !dbg !2756
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %54, ptr align 4 %52, i64 12, i1 false), !dbg !2757
  %55 = load ptr, ptr %4, align 8, !dbg !2758
  %56 = getelementptr inbounds nuw %struct.fvi_query, ptr %55, i32 0, i32 2, !dbg !2759
  %57 = load i32, ptr %56, align 8, !dbg !2759
  %58 = load ptr, ptr %5, align 8, !dbg !2760
  %59 = getelementptr inbounds nuw %struct.fvi_info, ptr %58, i32 0, i32 2, !dbg !2761
  store i32 %57, ptr %59, align 4, !dbg !2762
  %60 = load ptr, ptr %5, align 8, !dbg !2763
  %61 = getelementptr inbounds nuw %struct.fvi_info, ptr %60, i32 0, i32 5, !dbg !2764
  store i32 0, ptr %61, align 4, !dbg !2765
  %62 = load ptr, ptr %5, align 8, !dbg !2766
  %63 = getelementptr inbounds nuw %struct.fvi_info, ptr %62, i32 0, i32 3, !dbg !2767
  store i32 0, ptr %63, align 4, !dbg !2768
  %64 = load ptr, ptr %5, align 8, !dbg !2769
  %65 = getelementptr inbounds nuw %struct.fvi_info, ptr %64, i32 0, i32 4, !dbg !2770
  store i32 -1, ptr %65, align 4, !dbg !2771
  %66 = load ptr, ptr %5, align 8, !dbg !2772
  %67 = getelementptr inbounds nuw %struct.fvi_info, ptr %66, i32 0, i32 0, !dbg !2773
  %68 = load i32, ptr %67, align 4, !dbg !2773
  store i32 %68, ptr %3, align 4, !dbg !2774
  br label %281, !dbg !2774

69:                                               ; preds = %32
  %70 = load ptr, ptr %4, align 8, !dbg !2775
  %71 = getelementptr inbounds nuw %struct.fvi_query, ptr %70, i32 0, i32 2, !dbg !2776
  %72 = load i32, ptr %71, align 8, !dbg !2776
  %73 = trunc i32 %72 to i16, !dbg !2775
  store i16 %73, ptr @segs_visited, align 2, !dbg !2777
  store i32 1, ptr @n_segs_visited, align 4, !dbg !2778
  store i32 0, ptr @fvi_nest_count, align 4, !dbg !2779
  store i32 -1, ptr @fvi_hit_seg2, align 4, !dbg !2780
  store i32 -1, ptr %8, align 4, !dbg !2781
  %74 = load ptr, ptr %4, align 8, !dbg !2782
  %75 = getelementptr inbounds nuw %struct.fvi_query, ptr %74, i32 0, i32 0, !dbg !2783
  %76 = load ptr, ptr %75, align 8, !dbg !2783
  %77 = load ptr, ptr %4, align 8, !dbg !2784
  %78 = getelementptr inbounds nuw %struct.fvi_query, ptr %77, i32 0, i32 2, !dbg !2785
  %79 = load i32, ptr %78, align 8, !dbg !2785
  %80 = load ptr, ptr %4, align 8, !dbg !2786
  %81 = getelementptr inbounds nuw %struct.fvi_query, ptr %80, i32 0, i32 1, !dbg !2787
  %82 = load ptr, ptr %81, align 8, !dbg !2787
  %83 = load ptr, ptr %4, align 8, !dbg !2788
  %84 = getelementptr inbounds nuw %struct.fvi_query, ptr %83, i32 0, i32 3, !dbg !2789
  %85 = load i32, ptr %84, align 4, !dbg !2789
  %86 = load ptr, ptr %4, align 8, !dbg !2790
  %87 = getelementptr inbounds nuw %struct.fvi_query, ptr %86, i32 0, i32 4, !dbg !2791
  %88 = load i16, ptr %87, align 8, !dbg !2791
  %89 = load ptr, ptr %4, align 8, !dbg !2792
  %90 = getelementptr inbounds nuw %struct.fvi_query, ptr %89, i32 0, i32 5, !dbg !2793
  %91 = load ptr, ptr %90, align 8, !dbg !2793
  %92 = load ptr, ptr %4, align 8, !dbg !2794
  %93 = getelementptr inbounds nuw %struct.fvi_query, ptr %92, i32 0, i32 6, !dbg !2795
  %94 = load i32, ptr %93, align 8, !dbg !2795
  %95 = load ptr, ptr %5, align 8, !dbg !2796
  %96 = getelementptr inbounds nuw %struct.fvi_info, ptr %95, i32 0, i32 8, !dbg !2797
  %97 = getelementptr inbounds [100 x i32], ptr %96, i64 0, i64 0, !dbg !2796
  %98 = load ptr, ptr %5, align 8, !dbg !2798
  %99 = getelementptr inbounds nuw %struct.fvi_info, ptr %98, i32 0, i32 7, !dbg !2799
  %100 = call noundef i32 @_Z7fvi_subP10vms_vectorPiS0_iS0_isS1_iS1_S1_i(ptr noundef %9, ptr noundef %8, ptr noundef %76, i32 noundef %79, ptr noundef %82, i32 noundef %85, i16 noundef signext %88, ptr noundef %91, i32 noundef %94, ptr noundef %97, ptr noundef %99, i32 noundef -2), !dbg !2800
  store i32 %100, ptr %6, align 4, !dbg !2801
  %101 = load i32, ptr %8, align 4, !dbg !2802
  %102 = icmp ne i32 %101, -1, !dbg !2804
  br i1 %102, label %103, label %110, !dbg !2805

103:                                              ; preds = %69
  %104 = load i32, ptr %8, align 4, !dbg !2806
  %105 = call i32 @_Z13get_seg_masksP10vms_vectorii(ptr noundef %9, i32 noundef %104, i32 noundef 0), !dbg !2807
  store i32 %105, ptr %12, align 2, !dbg !2807
  %106 = getelementptr inbounds nuw %struct.segmasks, ptr %12, i32 0, i32 2, !dbg !2808
  %107 = load i8, ptr %106, align 1, !dbg !2808
  %108 = icmp ne i8 %107, 0, !dbg !2807
  %109 = xor i1 %108, true, !dbg !2809
  br label %110

110:                                              ; preds = %103, %69
  %111 = phi i1 [ false, %69 ], [ %109, %103 ], !dbg !2810
  br i1 %111, label %112, label %114, !dbg !2802

112:                                              ; preds = %110
  %113 = load i32, ptr %8, align 4, !dbg !2811
  store i32 %113, ptr %7, align 4, !dbg !2812
  br label %119, !dbg !2813

114:                                              ; preds = %110
  %115 = load ptr, ptr %4, align 8, !dbg !2814
  %116 = getelementptr inbounds nuw %struct.fvi_query, ptr %115, i32 0, i32 2, !dbg !2815
  %117 = load i32, ptr %116, align 8, !dbg !2815
  %118 = call noundef i32 @_Z14find_point_segP10vms_vectori(ptr noundef %9, i32 noundef %117), !dbg !2816
  store i32 %118, ptr %7, align 4, !dbg !2817
  br label %119

119:                                              ; preds = %114, %112
  %120 = load i32, ptr %6, align 4, !dbg !2818
  %121 = icmp eq i32 %120, 1, !dbg !2820
  br i1 %121, label %122, label %140, !dbg !2821

122:                                              ; preds = %119
  %123 = load i32, ptr %7, align 4, !dbg !2822
  %124 = icmp eq i32 %123, -1, !dbg !2823
  br i1 %124, label %125, label %140, !dbg !2821

125:                                              ; preds = %122
  %126 = load i32, ptr @fvi_hit_seg2, align 4, !dbg !2824
  %127 = icmp ne i32 %126, -1, !dbg !2826
  br i1 %127, label %128, label %135, !dbg !2827

128:                                              ; preds = %125
  %129 = load i32, ptr @fvi_hit_seg2, align 4, !dbg !2828
  %130 = call i32 @_Z13get_seg_masksP10vms_vectorii(ptr noundef %9, i32 noundef %129, i32 noundef 0), !dbg !2829
  store i32 %130, ptr %13, align 2, !dbg !2829
  %131 = getelementptr inbounds nuw %struct.segmasks, ptr %13, i32 0, i32 2, !dbg !2830
  %132 = load i8, ptr %131, align 1, !dbg !2830
  %133 = sext i8 %132 to i32, !dbg !2829
  %134 = icmp eq i32 %133, 0, !dbg !2831
  br label %135

135:                                              ; preds = %128, %125
  %136 = phi i1 [ false, %125 ], [ %134, %128 ], !dbg !2832
  br i1 %136, label %137, label %139, !dbg !2824

137:                                              ; preds = %135
  %138 = load i32, ptr @fvi_hit_seg2, align 4, !dbg !2833
  store i32 %138, ptr %7, align 4, !dbg !2834
  br label %139, !dbg !2835

139:                                              ; preds = %137, %135
  br label %140, !dbg !2836

140:                                              ; preds = %139, %122, %119
  %141 = load i32, ptr %7, align 4, !dbg !2837
  %142 = icmp eq i32 %141, -1, !dbg !2839
  br i1 %142, label %143, label %173, !dbg !2839

143:                                              ; preds = %140
    #dbg_declare(ptr %14, !2840, !DIExpression(), !2842)
    #dbg_declare(ptr %15, !2843, !DIExpression(), !2844)
  store i32 -1, ptr %15, align 4, !dbg !2844
    #dbg_declare(ptr %16, !2845, !DIExpression(), !2846)
  %144 = load ptr, ptr %4, align 8, !dbg !2847
  %145 = getelementptr inbounds nuw %struct.fvi_query, ptr %144, i32 0, i32 0, !dbg !2848
  %146 = load ptr, ptr %145, align 8, !dbg !2848
  %147 = load ptr, ptr %4, align 8, !dbg !2849
  %148 = getelementptr inbounds nuw %struct.fvi_query, ptr %147, i32 0, i32 2, !dbg !2850
  %149 = load i32, ptr %148, align 8, !dbg !2850
  %150 = load ptr, ptr %4, align 8, !dbg !2851
  %151 = getelementptr inbounds nuw %struct.fvi_query, ptr %150, i32 0, i32 1, !dbg !2852
  %152 = load ptr, ptr %151, align 8, !dbg !2852
  %153 = load ptr, ptr %4, align 8, !dbg !2853
  %154 = getelementptr inbounds nuw %struct.fvi_query, ptr %153, i32 0, i32 4, !dbg !2854
  %155 = load i16, ptr %154, align 8, !dbg !2854
  %156 = load ptr, ptr %4, align 8, !dbg !2855
  %157 = getelementptr inbounds nuw %struct.fvi_query, ptr %156, i32 0, i32 5, !dbg !2856
  %158 = load ptr, ptr %157, align 8, !dbg !2856
  %159 = load ptr, ptr %4, align 8, !dbg !2857
  %160 = getelementptr inbounds nuw %struct.fvi_query, ptr %159, i32 0, i32 6, !dbg !2858
  %161 = load i32, ptr %160, align 8, !dbg !2858
  %162 = load ptr, ptr %5, align 8, !dbg !2859
  %163 = getelementptr inbounds nuw %struct.fvi_info, ptr %162, i32 0, i32 8, !dbg !2860
  %164 = getelementptr inbounds [100 x i32], ptr %163, i64 0, i64 0, !dbg !2859
  %165 = load ptr, ptr %5, align 8, !dbg !2861
  %166 = getelementptr inbounds nuw %struct.fvi_info, ptr %165, i32 0, i32 7, !dbg !2862
  %167 = call noundef i32 @_Z7fvi_subP10vms_vectorPiS0_iS0_isS1_iS1_S1_i(ptr noundef %16, ptr noundef %15, ptr noundef %146, i32 noundef %149, ptr noundef %152, i32 noundef 0, i16 noundef signext %155, ptr noundef %158, i32 noundef %161, ptr noundef %164, ptr noundef %166, i32 noundef -2), !dbg !2863
  store i32 %167, ptr %14, align 4, !dbg !2864
  %168 = load i32, ptr %15, align 4, !dbg !2865
  %169 = icmp ne i32 %168, -1, !dbg !2867
  br i1 %169, label %170, label %172, !dbg !2867

170:                                              ; preds = %143
  %171 = load i32, ptr %15, align 4, !dbg !2868
  store i32 %171, ptr %7, align 4, !dbg !2870
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %9, ptr align 4 %16, i64 12, i1 false), !dbg !2871
  br label %172, !dbg !2872

172:                                              ; preds = %170, %143
  br label %173, !dbg !2873

173:                                              ; preds = %172, %140
  %174 = load i32, ptr %7, align 4, !dbg !2874
  %175 = icmp ne i32 %174, -1, !dbg !2876
  br i1 %175, label %176, label %210, !dbg !2877

176:                                              ; preds = %173
  %177 = load ptr, ptr %4, align 8, !dbg !2878
  %178 = getelementptr inbounds nuw %struct.fvi_query, ptr %177, i32 0, i32 6, !dbg !2879
  %179 = load i32, ptr %178, align 8, !dbg !2879
  %180 = and i32 %179, 8, !dbg !2880
  %181 = icmp ne i32 %180, 0, !dbg !2878
  br i1 %181, label %182, label %210, !dbg !2877

182:                                              ; preds = %176
  %183 = load i32, ptr %7, align 4, !dbg !2881
  %184 = load ptr, ptr %5, align 8, !dbg !2883
  %185 = getelementptr inbounds nuw %struct.fvi_info, ptr %184, i32 0, i32 8, !dbg !2884
  %186 = load ptr, ptr %5, align 8, !dbg !2885
  %187 = getelementptr inbounds nuw %struct.fvi_info, ptr %186, i32 0, i32 7, !dbg !2886
  %188 = load i32, ptr %187, align 4, !dbg !2886
  %189 = sub nsw i32 %188, 1, !dbg !2887
  %190 = sext i32 %189 to i64, !dbg !2883
  %191 = getelementptr inbounds [100 x i32], ptr %185, i64 0, i64 %190, !dbg !2883
  %192 = load i32, ptr %191, align 4, !dbg !2883
  %193 = icmp ne i32 %183, %192, !dbg !2888
  br i1 %193, label %194, label %209, !dbg !2889

194:                                              ; preds = %182
  %195 = load ptr, ptr %5, align 8, !dbg !2890
  %196 = getelementptr inbounds nuw %struct.fvi_info, ptr %195, i32 0, i32 7, !dbg !2891
  %197 = load i32, ptr %196, align 4, !dbg !2891
  %198 = icmp slt i32 %197, 99, !dbg !2892
  br i1 %198, label %199, label %209, !dbg !2889

199:                                              ; preds = %194
  %200 = load i32, ptr %7, align 4, !dbg !2893
  %201 = load ptr, ptr %5, align 8, !dbg !2894
  %202 = getelementptr inbounds nuw %struct.fvi_info, ptr %201, i32 0, i32 8, !dbg !2895
  %203 = load ptr, ptr %5, align 8, !dbg !2896
  %204 = getelementptr inbounds nuw %struct.fvi_info, ptr %203, i32 0, i32 7, !dbg !2897
  %205 = load i32, ptr %204, align 4, !dbg !2898
  %206 = add nsw i32 %205, 1, !dbg !2898
  store i32 %206, ptr %204, align 4, !dbg !2898
  %207 = sext i32 %205 to i64, !dbg !2894
  %208 = getelementptr inbounds [100 x i32], ptr %202, i64 0, i64 %207, !dbg !2894
  store i32 %200, ptr %208, align 4, !dbg !2899
  br label %209, !dbg !2894

209:                                              ; preds = %199, %194, %182
  br label %210, !dbg !2900

210:                                              ; preds = %209, %176, %173
  %211 = load i32, ptr %7, align 4, !dbg !2901
  %212 = icmp ne i32 %211, -1, !dbg !2903
  br i1 %212, label %213, label %251, !dbg !2904

213:                                              ; preds = %210
  %214 = load ptr, ptr %4, align 8, !dbg !2905
  %215 = getelementptr inbounds nuw %struct.fvi_query, ptr %214, i32 0, i32 6, !dbg !2906
  %216 = load i32, ptr %215, align 8, !dbg !2906
  %217 = and i32 %216, 8, !dbg !2907
  %218 = icmp ne i32 %217, 0, !dbg !2905
  br i1 %218, label %219, label %251, !dbg !2904

219:                                              ; preds = %213
  store i32 0, ptr %10, align 4, !dbg !2908
  br label %220, !dbg !2910

220:                                              ; preds = %246, %219
  %221 = load i32, ptr %10, align 4, !dbg !2911
  %222 = load ptr, ptr %5, align 8, !dbg !2913
  %223 = getelementptr inbounds nuw %struct.fvi_info, ptr %222, i32 0, i32 7, !dbg !2914
  %224 = load i32, ptr %223, align 4, !dbg !2914
  %225 = icmp slt i32 %221, %224, !dbg !2915
  br i1 %225, label %226, label %229, !dbg !2916

226:                                              ; preds = %220
  %227 = load i32, ptr %10, align 4, !dbg !2917
  %228 = icmp slt i32 %227, 99, !dbg !2918
  br label %229

229:                                              ; preds = %226, %220
  %230 = phi i1 [ false, %220 ], [ %228, %226 ], !dbg !2919
  br i1 %230, label %231, label %249, !dbg !2920

231:                                              ; preds = %229
  %232 = load ptr, ptr %5, align 8, !dbg !2921
  %233 = getelementptr inbounds nuw %struct.fvi_info, ptr %232, i32 0, i32 8, !dbg !2923
  %234 = load i32, ptr %10, align 4, !dbg !2924
  %235 = sext i32 %234 to i64, !dbg !2921
  %236 = getelementptr inbounds [100 x i32], ptr %233, i64 0, i64 %235, !dbg !2921
  %237 = load i32, ptr %236, align 4, !dbg !2921
  %238 = load i32, ptr %7, align 4, !dbg !2925
  %239 = icmp eq i32 %237, %238, !dbg !2926
  br i1 %239, label %240, label %245, !dbg !2926

240:                                              ; preds = %231
  %241 = load i32, ptr %10, align 4, !dbg !2927
  %242 = add nsw i32 %241, 1, !dbg !2929
  %243 = load ptr, ptr %5, align 8, !dbg !2930
  %244 = getelementptr inbounds nuw %struct.fvi_info, ptr %243, i32 0, i32 7, !dbg !2931
  store i32 %242, ptr %244, align 4, !dbg !2932
  br label %250, !dbg !2933

245:                                              ; preds = %231
  br label %246, !dbg !2925

246:                                              ; preds = %245
  %247 = load i32, ptr %10, align 4, !dbg !2934
  %248 = add nsw i32 %247, 1, !dbg !2934
  store i32 %248, ptr %10, align 4, !dbg !2934
  br label %220, !dbg !2935, !llvm.loop !2936

249:                                              ; preds = %229
  br label %250, !dbg !2937

250:                                              ; preds = %249, %240
  br label %251, !dbg !2937

251:                                              ; preds = %250, %213, %210
  %252 = load i32, ptr %6, align 4, !dbg !2938
  %253 = icmp eq i32 %252, 2, !dbg !2938
  br i1 %253, label %254, label %257, !dbg !2938

254:                                              ; preds = %251
  %255 = load i32, ptr @fvi_hit_object, align 4, !dbg !2938
  %256 = icmp eq i32 %255, -1, !dbg !2938
  br label %257

257:                                              ; preds = %254, %251
  %258 = phi i1 [ false, %251 ], [ %256, %254 ], !dbg !2736
  %259 = xor i1 %258, true, !dbg !2938
  %260 = zext i1 %259 to i32, !dbg !2938
  call void @_Z7_AssertiPKcS0_i(i32 noundef %260, ptr noundef @.str.6, ptr noundef @.str.1, i32 noundef 923), !dbg !2938
  %261 = load i32, ptr %6, align 4, !dbg !2939
  %262 = load ptr, ptr %5, align 8, !dbg !2940
  %263 = getelementptr inbounds nuw %struct.fvi_info, ptr %262, i32 0, i32 0, !dbg !2941
  store i32 %261, ptr %263, align 4, !dbg !2942
  %264 = load ptr, ptr %5, align 8, !dbg !2943
  %265 = getelementptr inbounds nuw %struct.fvi_info, ptr %264, i32 0, i32 1, !dbg !2944
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %265, ptr align 4 %9, i64 12, i1 false), !dbg !2945
  %266 = load i32, ptr %7, align 4, !dbg !2946
  %267 = load ptr, ptr %5, align 8, !dbg !2947
  %268 = getelementptr inbounds nuw %struct.fvi_info, ptr %267, i32 0, i32 2, !dbg !2948
  store i32 %266, ptr %268, align 4, !dbg !2949
  %269 = load i32, ptr @fvi_hit_side, align 4, !dbg !2950
  %270 = load ptr, ptr %5, align 8, !dbg !2951
  %271 = getelementptr inbounds nuw %struct.fvi_info, ptr %270, i32 0, i32 3, !dbg !2952
  store i32 %269, ptr %271, align 4, !dbg !2953
  %272 = load i32, ptr @fvi_hit_side_seg, align 4, !dbg !2954
  %273 = load ptr, ptr %5, align 8, !dbg !2955
  %274 = getelementptr inbounds nuw %struct.fvi_info, ptr %273, i32 0, i32 4, !dbg !2956
  store i32 %272, ptr %274, align 4, !dbg !2957
  %275 = load i32, ptr @fvi_hit_object, align 4, !dbg !2958
  %276 = load ptr, ptr %5, align 8, !dbg !2959
  %277 = getelementptr inbounds nuw %struct.fvi_info, ptr %276, i32 0, i32 5, !dbg !2960
  store i32 %275, ptr %277, align 4, !dbg !2961
  %278 = load ptr, ptr %5, align 8, !dbg !2962
  %279 = getelementptr inbounds nuw %struct.fvi_info, ptr %278, i32 0, i32 6, !dbg !2963
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %279, ptr align 4 @wall_norm, i64 12, i1 false), !dbg !2964
  %280 = load i32, ptr %6, align 4, !dbg !2965
  store i32 %280, ptr %3, align 4, !dbg !2966
  br label %281, !dbg !2966

281:                                              ; preds = %257, %47
  %282 = load i32, ptr %3, align 4, !dbg !2967
  ret i32 %282, !dbg !2967
}

declare i32 @_Z13get_seg_masksP10vms_vectorii(ptr noundef, i32 noundef, i32 noundef) #3

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z7fvi_subP10vms_vectorPiS0_iS0_isS1_iS1_S1_i(ptr noundef %0, ptr noundef %1, ptr noundef %2, i32 noundef %3, ptr noundef %4, i32 noundef %5, i16 noundef signext %6, ptr noundef %7, i32 noundef %8, ptr noundef %9, ptr noundef %10, i32 noundef %11) #2 !dbg !2968 {
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca i32, align 4
  %17 = alloca ptr, align 8
  %18 = alloca i32, align 4
  %19 = alloca i16, align 2
  %20 = alloca ptr, align 8
  %21 = alloca i32, align 4
  %22 = alloca ptr, align 8
  %23 = alloca ptr, align 8
  %24 = alloca i32, align 4
  %25 = alloca ptr, align 8
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca %struct.segmasks, align 2
  %31 = alloca %struct.vms_vector, align 4
  %32 = alloca %struct.vms_vector, align 4
  %33 = alloca i32, align 4
  %34 = alloca i32, align 4
  %35 = alloca i32, align 4
  %36 = alloca i32, align 4
  %37 = alloca i32, align 4
  %38 = alloca i32, align 4
  %39 = alloca [100 x i32], align 4
  %40 = alloca i32, align 4
  %41 = alloca i32, align 4
  %42 = alloca %struct.segmasks, align 2
  %43 = alloca %struct.segmasks, align 2
  %44 = alloca i32, align 4
  %45 = alloca i32, align 4
  %46 = alloca i32, align 4
  %47 = alloca i32, align 4
  %48 = alloca i32, align 4
  %49 = alloca i32, align 4
  %50 = alloca i32, align 4
  %51 = alloca %struct.vms_vector, align 4
  %52 = alloca i32, align 4
  %53 = alloca i32, align 4
  %54 = alloca %struct.vms_vector, align 4
  %55 = alloca i32, align 4
  %56 = alloca i32, align 4
  %57 = alloca [100 x i32], align 4
  %58 = alloca i32, align 4
  %59 = alloca i32, align 4
  %60 = alloca i32, align 4
  %61 = alloca %struct.segmasks, align 2
  %62 = alloca i32, align 4
  store ptr %0, ptr %13, align 8
    #dbg_declare(ptr %13, !2971, !DIExpression(), !2972)
  store ptr %1, ptr %14, align 8
    #dbg_declare(ptr %14, !2973, !DIExpression(), !2974)
  store ptr %2, ptr %15, align 8
    #dbg_declare(ptr %15, !2975, !DIExpression(), !2976)
  store i32 %3, ptr %16, align 4
    #dbg_declare(ptr %16, !2977, !DIExpression(), !2978)
  store ptr %4, ptr %17, align 8
    #dbg_declare(ptr %17, !2979, !DIExpression(), !2980)
  store i32 %5, ptr %18, align 4
    #dbg_declare(ptr %18, !2981, !DIExpression(), !2982)
  store i16 %6, ptr %19, align 2
    #dbg_declare(ptr %19, !2983, !DIExpression(), !2984)
  store ptr %7, ptr %20, align 8
    #dbg_declare(ptr %20, !2985, !DIExpression(), !2986)
  store i32 %8, ptr %21, align 4
    #dbg_declare(ptr %21, !2987, !DIExpression(), !2988)
  store ptr %9, ptr %22, align 8
    #dbg_declare(ptr %22, !2989, !DIExpression(), !2990)
  store ptr %10, ptr %23, align 8
    #dbg_declare(ptr %23, !2991, !DIExpression(), !2992)
  store i32 %11, ptr %24, align 4
    #dbg_declare(ptr %24, !2993, !DIExpression(), !2994)
    #dbg_declare(ptr %25, !2995, !DIExpression(), !2996)
    #dbg_declare(ptr %26, !2997, !DIExpression(), !2998)
    #dbg_declare(ptr %27, !2999, !DIExpression(), !3000)
    #dbg_declare(ptr %28, !3001, !DIExpression(), !3002)
    #dbg_declare(ptr %29, !3003, !DIExpression(), !3004)
    #dbg_declare(ptr %30, !3005, !DIExpression(), !3013)
    #dbg_declare(ptr %31, !3014, !DIExpression(), !3015)
    #dbg_declare(ptr %32, !3016, !DIExpression(), !3017)
    #dbg_declare(ptr %33, !3018, !DIExpression(), !3019)
    #dbg_declare(ptr %34, !3020, !DIExpression(), !3021)
  store i32 2147483647, ptr %34, align 4, !dbg !3021
    #dbg_declare(ptr %35, !3022, !DIExpression(), !3023)
  store i32 0, ptr %35, align 4, !dbg !3023
    #dbg_declare(ptr %36, !3024, !DIExpression(), !3025)
  store i32 -1, ptr %36, align 4, !dbg !3025
    #dbg_declare(ptr %37, !3026, !DIExpression(), !3027)
  store i32 -1, ptr %37, align 4, !dbg !3027
    #dbg_declare(ptr %38, !3028, !DIExpression(), !3029)
  store i32 0, ptr %38, align 4, !dbg !3029
    #dbg_declare(ptr %39, !3030, !DIExpression(), !3031)
    #dbg_declare(ptr %40, !3032, !DIExpression(), !3033)
  %63 = load i32, ptr @fvi_nest_count, align 4, !dbg !3034
  store i32 %63, ptr %40, align 4, !dbg !3033
  %64 = load i32, ptr %21, align 4, !dbg !3035
  %65 = and i32 %64, 8, !dbg !3037
  %66 = icmp ne i32 %65, 0, !dbg !3035
  br i1 %66, label %67, label %70, !dbg !3035

67:                                               ; preds = %12
  %68 = load i32, ptr %16, align 4, !dbg !3038
  %69 = load ptr, ptr %22, align 8, !dbg !3039
  store i32 %68, ptr %69, align 4, !dbg !3040
  br label %70, !dbg !3041

70:                                               ; preds = %67, %12
  %71 = load ptr, ptr %23, align 8, !dbg !3042
  store i32 1, ptr %71, align 4, !dbg !3043
  %72 = load i32, ptr %16, align 4, !dbg !3044
  %73 = sext i32 %72 to i64, !dbg !3045
  %74 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %73, !dbg !3045
  store ptr %74, ptr %25, align 8, !dbg !3046
  %75 = load i32, ptr @fvi_nest_count, align 4, !dbg !3047
  %76 = add nsw i32 %75, 1, !dbg !3047
  store i32 %76, ptr @fvi_nest_count, align 4, !dbg !3047
  %77 = load i32, ptr %21, align 4, !dbg !3048
  %78 = and i32 %77, 1, !dbg !3050
  %79 = icmp ne i32 %78, 0, !dbg !3048
  br i1 %79, label %80, label %285, !dbg !3048

80:                                               ; preds = %70
  %81 = load ptr, ptr %25, align 8, !dbg !3051
  %82 = getelementptr inbounds nuw %struct.segment, ptr %81, i32 0, i32 3, !dbg !3053
  %83 = load i32, ptr %82, align 4, !dbg !3053
  store i32 %83, ptr %29, align 4, !dbg !3054
  br label %84, !dbg !3055

84:                                               ; preds = %277, %80
  %85 = load i32, ptr %29, align 4, !dbg !3056
  %86 = icmp ne i32 %85, -1, !dbg !3058
  br i1 %86, label %87, label %284, !dbg !3059

87:                                               ; preds = %84
  %88 = load i32, ptr %29, align 4, !dbg !3060
  %89 = sext i32 %88 to i64, !dbg !3062
  %90 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %89, !dbg !3062
  %91 = getelementptr inbounds nuw %struct.object, ptr %90, i32 0, i32 8, !dbg !3063
  %92 = load i8, ptr %91, align 1, !dbg !3063
  %93 = zext i8 %92 to i32, !dbg !3062
  %94 = and i32 %93, 2, !dbg !3064
  %95 = icmp ne i32 %94, 0, !dbg !3065
  br i1 %95, label %276, label %96, !dbg !3066

96:                                               ; preds = %87
  %97 = load i16, ptr %19, align 2, !dbg !3067
  %98 = sext i16 %97 to i32, !dbg !3067
  %99 = load i32, ptr %29, align 4, !dbg !3068
  %100 = icmp eq i32 %98, %99, !dbg !3069
  br i1 %100, label %276, label %101, !dbg !3070

101:                                              ; preds = %96
  %102 = load ptr, ptr %20, align 8, !dbg !3071
  %103 = icmp eq ptr %102, null, !dbg !3072
  br i1 %103, label %109, label %104, !dbg !3073

104:                                              ; preds = %101
  %105 = load i32, ptr %29, align 4, !dbg !3074
  %106 = load ptr, ptr %20, align 8, !dbg !3075
  %107 = call noundef i32 @_Z11obj_in_listiPi(i32 noundef %105, ptr noundef %106), !dbg !3076
  %108 = icmp ne i32 %107, 0, !dbg !3076
  br i1 %108, label %276, label %109, !dbg !3077

109:                                              ; preds = %104, %101
  %110 = load i32, ptr %29, align 4, !dbg !3078
  %111 = load i16, ptr %19, align 2, !dbg !3079
  %112 = sext i16 %111 to i32, !dbg !3079
  %113 = call noundef i32 @_Z17laser_are_relatedii(i32 noundef %110, i32 noundef %112), !dbg !3080
  %114 = icmp ne i32 %113, 0, !dbg !3080
  br i1 %114, label %276, label %115, !dbg !3081

115:                                              ; preds = %109
  %116 = load i16, ptr %19, align 2, !dbg !3082
  %117 = sext i16 %116 to i32, !dbg !3082
  %118 = icmp sgt i32 %117, -1, !dbg !3083
  br i1 %118, label %119, label %155, !dbg !3084

119:                                              ; preds = %115
  %120 = load i16, ptr %19, align 2, !dbg !3085
  %121 = sext i16 %120 to i64, !dbg !3086
  %122 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %121, !dbg !3086
  %123 = getelementptr inbounds nuw %struct.object, ptr %122, i32 0, i32 1, !dbg !3087
  %124 = load i8, ptr %123, align 4, !dbg !3087
  %125 = zext i8 %124 to i64, !dbg !3088
  %126 = getelementptr inbounds nuw [16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 %125, !dbg !3088
  %127 = load i32, ptr %29, align 4, !dbg !3089
  %128 = sext i32 %127 to i64, !dbg !3090
  %129 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %128, !dbg !3090
  %130 = getelementptr inbounds nuw %struct.object, ptr %129, i32 0, i32 1, !dbg !3091
  %131 = load i8, ptr %130, align 4, !dbg !3091
  %132 = zext i8 %131 to i64, !dbg !3088
  %133 = getelementptr inbounds nuw [16 x i8], ptr %126, i64 0, i64 %132, !dbg !3088
  %134 = load i8, ptr %133, align 1, !dbg !3088
  %135 = zext i8 %134 to i32, !dbg !3088
  %136 = icmp eq i32 %135, 0, !dbg !3092
  br i1 %136, label %137, label %155, !dbg !3093

137:                                              ; preds = %119
  %138 = load i32, ptr %29, align 4, !dbg !3094
  %139 = sext i32 %138 to i64, !dbg !3095
  %140 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %139, !dbg !3095
  %141 = getelementptr inbounds nuw %struct.object, ptr %140, i32 0, i32 1, !dbg !3096
  %142 = load i8, ptr %141, align 4, !dbg !3096
  %143 = zext i8 %142 to i64, !dbg !3097
  %144 = getelementptr inbounds nuw [16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 %143, !dbg !3097
  %145 = load i16, ptr %19, align 2, !dbg !3098
  %146 = sext i16 %145 to i64, !dbg !3099
  %147 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %146, !dbg !3099
  %148 = getelementptr inbounds nuw %struct.object, ptr %147, i32 0, i32 1, !dbg !3100
  %149 = load i8, ptr %148, align 4, !dbg !3100
  %150 = zext i8 %149 to i64, !dbg !3097
  %151 = getelementptr inbounds nuw [16 x i8], ptr %144, i64 0, i64 %150, !dbg !3097
  %152 = load i8, ptr %151, align 1, !dbg !3097
  %153 = zext i8 %152 to i32, !dbg !3097
  %154 = icmp eq i32 %153, 0, !dbg !3101
  br i1 %154, label %276, label %155, !dbg !3081

155:                                              ; preds = %137, %119, %115
    #dbg_declare(ptr %41, !3102, !DIExpression(), !3104)
  %156 = load i32, ptr %18, align 4, !dbg !3105
  store i32 %156, ptr %41, align 4, !dbg !3104
  %157 = load i32, ptr %29, align 4, !dbg !3106
  %158 = sext i32 %157 to i64, !dbg !3108
  %159 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %158, !dbg !3108
  %160 = getelementptr inbounds nuw %struct.object, ptr %159, i32 0, i32 1, !dbg !3109
  %161 = load i8, ptr %160, align 4, !dbg !3109
  %162 = zext i8 %161 to i32, !dbg !3108
  %163 = icmp eq i32 %162, 7, !dbg !3110
  br i1 %163, label %164, label %170, !dbg !3110

164:                                              ; preds = %155
  %165 = load i32, ptr %21, align 4, !dbg !3111
  %166 = and i32 %165, 16, !dbg !3113
  %167 = icmp ne i32 %166, 0, !dbg !3111
  br i1 %167, label %168, label %169, !dbg !3111

168:                                              ; preds = %164
  br label %277, !dbg !3114

169:                                              ; preds = %164
  br label %170, !dbg !3115

170:                                              ; preds = %169, %155
  %171 = load i16, ptr %19, align 2, !dbg !3116
  %172 = sext i16 %171 to i64, !dbg !3118
  %173 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %172, !dbg !3118
  %174 = getelementptr inbounds nuw %struct.object, ptr %173, i32 0, i32 1, !dbg !3119
  %175 = load i8, ptr %174, align 4, !dbg !3119
  %176 = zext i8 %175 to i32, !dbg !3118
  %177 = icmp eq i32 %176, 2, !dbg !3120
  br i1 %177, label %178, label %188, !dbg !3120

178:                                              ; preds = %170
  %179 = load i32, ptr %29, align 4, !dbg !3121
  %180 = sext i32 %179 to i64, !dbg !3123
  %181 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %180, !dbg !3123
  %182 = getelementptr inbounds nuw %struct.object, ptr %181, i32 0, i32 1, !dbg !3124
  %183 = load i8, ptr %182, align 4, !dbg !3124
  %184 = zext i8 %183 to i32, !dbg !3123
  %185 = icmp eq i32 %184, 2, !dbg !3125
  br i1 %185, label %186, label %187, !dbg !3125

186:                                              ; preds = %178
  br label %277, !dbg !3126

187:                                              ; preds = %178
  br label %188, !dbg !3127

188:                                              ; preds = %187, %170
  %189 = load i16, ptr %19, align 2, !dbg !3128
  %190 = sext i16 %189 to i64, !dbg !3130
  %191 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %190, !dbg !3130
  %192 = getelementptr inbounds nuw %struct.object, ptr %191, i32 0, i32 1, !dbg !3131
  %193 = load i8, ptr %192, align 4, !dbg !3131
  %194 = zext i8 %193 to i32, !dbg !3130
  %195 = icmp eq i32 %194, 2, !dbg !3132
  br i1 %195, label %196, label %211, !dbg !3133

196:                                              ; preds = %188
  %197 = load i16, ptr %19, align 2, !dbg !3134
  %198 = sext i16 %197 to i64, !dbg !3135
  %199 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %198, !dbg !3135
  %200 = getelementptr inbounds nuw %struct.object, ptr %199, i32 0, i32 2, !dbg !3136
  %201 = load i8, ptr %200, align 1, !dbg !3136
  %202 = zext i8 %201 to i64, !dbg !3137
  %203 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %202, !dbg !3137
  %204 = getelementptr inbounds nuw %struct.robot_info, ptr %203, i32 0, i32 31, !dbg !3138
  %205 = load i8, ptr %204, align 1, !dbg !3138
  %206 = icmp ne i8 %205, 0, !dbg !3137
  br i1 %206, label %207, label %211, !dbg !3133

207:                                              ; preds = %196
  %208 = load i32, ptr %18, align 4, !dbg !3139
  %209 = mul nsw i32 %208, 3, !dbg !3140
  %210 = sdiv i32 %209, 4, !dbg !3141
  store i32 %210, ptr %41, align 4, !dbg !3142
  br label %211, !dbg !3143

211:                                              ; preds = %207, %196, %188
  %212 = load i16, ptr %19, align 2, !dbg !3144
  %213 = sext i16 %212 to i64, !dbg !3146
  %214 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %213, !dbg !3146
  %215 = getelementptr inbounds nuw %struct.object, ptr %214, i32 0, i32 1, !dbg !3147
  %216 = load i8, ptr %215, align 4, !dbg !3147
  %217 = zext i8 %216 to i32, !dbg !3146
  %218 = icmp eq i32 %217, 4, !dbg !3148
  br i1 %218, label %219, label %251, !dbg !3149

219:                                              ; preds = %211
  %220 = load i32, ptr %29, align 4, !dbg !3150
  %221 = sext i32 %220 to i64, !dbg !3151
  %222 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %221, !dbg !3151
  %223 = getelementptr inbounds nuw %struct.object, ptr %222, i32 0, i32 1, !dbg !3152
  %224 = load i8, ptr %223, align 4, !dbg !3152
  %225 = zext i8 %224 to i32, !dbg !3151
  %226 = icmp eq i32 %225, 4, !dbg !3153
  br i1 %226, label %248, label %227, !dbg !3154

227:                                              ; preds = %219
  %228 = load i32, ptr @Game_mode, align 4, !dbg !3155
  %229 = and i32 %228, 16, !dbg !3156
  %230 = icmp ne i32 %229, 0, !dbg !3157
  br i1 %230, label %231, label %251, !dbg !3158

231:                                              ; preds = %227
  %232 = load i32, ptr %29, align 4, !dbg !3159
  %233 = sext i32 %232 to i64, !dbg !3160
  %234 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %233, !dbg !3160
  %235 = getelementptr inbounds nuw %struct.object, ptr %234, i32 0, i32 1, !dbg !3161
  %236 = load i8, ptr %235, align 4, !dbg !3161
  %237 = zext i8 %236 to i32, !dbg !3160
  %238 = icmp eq i32 %237, 5, !dbg !3162
  br i1 %238, label %239, label %251, !dbg !3163

239:                                              ; preds = %231
  %240 = load i32, ptr %29, align 4, !dbg !3164
  %241 = sext i32 %240 to i64, !dbg !3165
  %242 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %241, !dbg !3165
  %243 = getelementptr inbounds nuw %struct.object, ptr %242, i32 0, i32 22, !dbg !3166
  %244 = getelementptr inbounds nuw %struct.laser_info_s, ptr %243, i32 0, i32 0, !dbg !3167
  %245 = load i16, ptr %244, align 4, !dbg !3167
  %246 = sext i16 %245 to i32, !dbg !3165
  %247 = icmp eq i32 %246, 4, !dbg !3168
  br i1 %247, label %248, label %251, !dbg !3149

248:                                              ; preds = %239, %219
  %249 = load i32, ptr %18, align 4, !dbg !3169
  %250 = sdiv i32 %249, 2, !dbg !3170
  store i32 %250, ptr %41, align 4, !dbg !3171
  br label %251, !dbg !3172

251:                                              ; preds = %248, %239, %231, %227, %211
  %252 = load ptr, ptr %15, align 8, !dbg !3173
  %253 = load ptr, ptr %17, align 8, !dbg !3174
  %254 = load i32, ptr %41, align 4, !dbg !3175
  %255 = load i32, ptr %29, align 4, !dbg !3176
  %256 = sext i32 %255 to i64, !dbg !3177
  %257 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %256, !dbg !3177
  %258 = load i16, ptr %19, align 2, !dbg !3178
  %259 = sext i16 %258 to i64, !dbg !3179
  %260 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %259, !dbg !3179
  %261 = call noundef i32 @_Z22check_vector_to_objectP10vms_vectorS0_S0_iP6objectS2_(ptr noundef %31, ptr noundef %252, ptr noundef %253, i32 noundef %254, ptr noundef %257, ptr noundef %260), !dbg !3180
  store i32 %261, ptr %33, align 4, !dbg !3181
  %262 = load i32, ptr %33, align 4, !dbg !3182
  %263 = icmp ne i32 %262, 0, !dbg !3182
  br i1 %263, label %264, label %275, !dbg !3182

264:                                              ; preds = %251
  %265 = load i32, ptr %33, align 4, !dbg !3184
  %266 = load i32, ptr %34, align 4, !dbg !3186
  %267 = icmp slt i32 %265, %266, !dbg !3187
  br i1 %267, label %268, label %274, !dbg !3187

268:                                              ; preds = %264
  %269 = load i32, ptr %29, align 4, !dbg !3188
  store i32 %269, ptr @fvi_hit_object, align 4, !dbg !3190
  %270 = load i32, ptr @fvi_hit_object, align 4, !dbg !3191
  %271 = icmp ne i32 %270, -1, !dbg !3191
  %272 = zext i1 %271 to i32, !dbg !3191
  call void @_Z7_AssertiPKcS0_i(i32 noundef %272, ptr noundef @.str.7, ptr noundef @.str.1, i32 noundef 1036), !dbg !3191
  %273 = load i32, ptr %33, align 4, !dbg !3192
  store i32 %273, ptr %34, align 4, !dbg !3193
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %32, ptr align 4 %31, i64 12, i1 false), !dbg !3194
  store i32 2, ptr %35, align 4, !dbg !3195
  br label %274, !dbg !3196

274:                                              ; preds = %268, %264
  br label %275, !dbg !3186

275:                                              ; preds = %274, %251
  br label %276, !dbg !3197

276:                                              ; preds = %275, %137, %109, %104, %96, %87
  br label %277, !dbg !3198

277:                                              ; preds = %276, %186, %168
  %278 = load i32, ptr %29, align 4, !dbg !3199
  %279 = sext i32 %278 to i64, !dbg !3200
  %280 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %279, !dbg !3200
  %281 = getelementptr inbounds nuw %struct.object, ptr %280, i32 0, i32 3, !dbg !3201
  %282 = load i16, ptr %281, align 2, !dbg !3201
  %283 = sext i16 %282 to i32, !dbg !3200
  store i32 %283, ptr %29, align 4, !dbg !3202
  br label %84, !dbg !3203, !llvm.loop !3204

284:                                              ; preds = %84
  br label %285, !dbg !3205

285:                                              ; preds = %284, %70
  %286 = load i16, ptr %19, align 2, !dbg !3206
  %287 = sext i16 %286 to i32, !dbg !3206
  %288 = icmp sgt i32 %287, -1, !dbg !3208
  br i1 %288, label %289, label %302, !dbg !3209

289:                                              ; preds = %285
  %290 = load i16, ptr %19, align 2, !dbg !3210
  %291 = sext i16 %290 to i64, !dbg !3211
  %292 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %291, !dbg !3211
  %293 = getelementptr inbounds nuw %struct.object, ptr %292, i32 0, i32 1, !dbg !3212
  %294 = load i8, ptr %293, align 4, !dbg !3212
  %295 = zext i8 %294 to i64, !dbg !3213
  %296 = getelementptr inbounds nuw [16 x [16 x i8]], ptr @CollisionResult, i64 0, i64 %295, !dbg !3213
  %297 = getelementptr inbounds [16 x i8], ptr %296, i64 0, i64 0, !dbg !3213
  %298 = load i8, ptr %297, align 1, !dbg !3213
  %299 = zext i8 %298 to i32, !dbg !3213
  %300 = icmp eq i32 %299, 0, !dbg !3214
  br i1 %300, label %301, label %302, !dbg !3209

301:                                              ; preds = %289
  store i32 0, ptr %18, align 4, !dbg !3215
  br label %302, !dbg !3216

302:                                              ; preds = %301, %289, %285
  %303 = load ptr, ptr %15, align 8, !dbg !3217
  %304 = load i32, ptr %16, align 4, !dbg !3218
  %305 = load i32, ptr %18, align 4, !dbg !3219
  %306 = call i32 @_Z13get_seg_masksP10vms_vectorii(ptr noundef %303, i32 noundef %304, i32 noundef %305), !dbg !3220
  store i32 %306, ptr %42, align 2, !dbg !3220
  %307 = getelementptr inbounds nuw %struct.segmasks, ptr %42, i32 0, i32 0, !dbg !3221
  %308 = load i16, ptr %307, align 2, !dbg !3221
  %309 = sext i16 %308 to i32, !dbg !3220
  store i32 %309, ptr %26, align 4, !dbg !3222
  %310 = load ptr, ptr %17, align 8, !dbg !3223
  %311 = load i32, ptr %16, align 4, !dbg !3224
  %312 = load i32, ptr %18, align 4, !dbg !3225
  %313 = call i32 @_Z13get_seg_masksP10vms_vectorii(ptr noundef %310, i32 noundef %311, i32 noundef %312), !dbg !3226
  store i32 %313, ptr %43, align 2, !dbg !3226
  call void @llvm.memcpy.p0.p0.i64(ptr align 2 %30, ptr align 2 %43, i64 4, i1 false), !dbg !3227
  %314 = getelementptr inbounds nuw %struct.segmasks, ptr %30, i32 0, i32 0, !dbg !3228
  %315 = load i16, ptr %314, align 2, !dbg !3228
  %316 = sext i16 %315 to i32, !dbg !3229
  store i32 %316, ptr %27, align 4, !dbg !3230
  %317 = getelementptr inbounds nuw %struct.segmasks, ptr %30, i32 0, i32 2, !dbg !3231
  %318 = load i8, ptr %317, align 1, !dbg !3231
  %319 = sext i8 %318 to i32, !dbg !3232
  store i32 %319, ptr %28, align 4, !dbg !3233
  %320 = load i32, ptr %28, align 4, !dbg !3234
  %321 = icmp eq i32 %320, 0, !dbg !3236
  br i1 %321, label %322, label %324, !dbg !3236

322:                                              ; preds = %302
  %323 = load i32, ptr %16, align 4, !dbg !3237
  store i32 %323, ptr %37, align 4, !dbg !3238
  br label %324, !dbg !3239

324:                                              ; preds = %322, %302
  %325 = load i32, ptr %27, align 4, !dbg !3240
  %326 = icmp ne i32 %325, 0, !dbg !3242
  br i1 %326, label %327, label %715, !dbg !3242

327:                                              ; preds = %324
    #dbg_declare(ptr %44, !3243, !DIExpression(), !3245)
    #dbg_declare(ptr %45, !3246, !DIExpression(), !3247)
    #dbg_declare(ptr %46, !3248, !DIExpression(), !3249)
  store i32 0, ptr %44, align 4, !dbg !3250
  store i32 1, ptr %45, align 4, !dbg !3252
  br label %328, !dbg !3253

328:                                              ; preds = %711, %327
  %329 = load i32, ptr %44, align 4, !dbg !3254
  %330 = icmp slt i32 %329, 6, !dbg !3256
  br i1 %330, label %331, label %335, !dbg !3257

331:                                              ; preds = %328
  %332 = load i32, ptr %27, align 4, !dbg !3258
  %333 = load i32, ptr %45, align 4, !dbg !3259
  %334 = icmp sge i32 %332, %333, !dbg !3260
  br label %335

335:                                              ; preds = %331, %328
  %336 = phi i1 [ false, %328 ], [ %334, %331 ], !dbg !3261
  br i1 %336, label %337, label %714, !dbg !3262

337:                                              ; preds = %335
    #dbg_declare(ptr %47, !3263, !DIExpression(), !3265)
  %338 = load ptr, ptr %25, align 8, !dbg !3266
  %339 = getelementptr inbounds nuw %struct.segment, ptr %338, i32 0, i32 0, !dbg !3267
  %340 = load i32, ptr %44, align 4, !dbg !3268
  %341 = sext i32 %340 to i64, !dbg !3266
  %342 = getelementptr inbounds [6 x %struct.side], ptr %339, i64 0, i64 %341, !dbg !3266
  %343 = call noundef i32 @_Z13get_num_facesP4side(ptr noundef %342), !dbg !3269
  store i32 %343, ptr %47, align 4, !dbg !3270
  %344 = load i32, ptr %47, align 4, !dbg !3271
  %345 = icmp eq i32 %344, 0, !dbg !3273
  br i1 %345, label %346, label %347, !dbg !3273

346:                                              ; preds = %337
  store i32 1, ptr %47, align 4, !dbg !3274
  br label %347, !dbg !3275

347:                                              ; preds = %346, %337
  store i32 0, ptr %46, align 4, !dbg !3276
  br label %348, !dbg !3278

348:                                              ; preds = %705, %347
  %349 = load i32, ptr %46, align 4, !dbg !3279
  %350 = icmp slt i32 %349, 2, !dbg !3281
  br i1 %350, label %351, label %710, !dbg !3282

351:                                              ; preds = %348
  %352 = load i32, ptr %27, align 4, !dbg !3283
  %353 = load i32, ptr %45, align 4, !dbg !3286
  %354 = and i32 %352, %353, !dbg !3287
  %355 = icmp ne i32 %354, 0, !dbg !3283
  br i1 %355, label %356, label %704, !dbg !3283

356:                                              ; preds = %351
    #dbg_declare(ptr %48, !3288, !DIExpression(), !3290)
  %357 = load ptr, ptr %25, align 8, !dbg !3291
  %358 = getelementptr inbounds nuw %struct.segment, ptr %357, i32 0, i32 1, !dbg !3293
  %359 = load i32, ptr %44, align 4, !dbg !3294
  %360 = sext i32 %359 to i64, !dbg !3291
  %361 = getelementptr inbounds [6 x i16], ptr %358, i64 0, i64 %360, !dbg !3291
  %362 = load i16, ptr %361, align 2, !dbg !3291
  %363 = sext i16 %362 to i32, !dbg !3291
  %364 = load i32, ptr %24, align 4, !dbg !3295
  %365 = icmp eq i32 %363, %364, !dbg !3296
  br i1 %365, label %366, label %367, !dbg !3296

366:                                              ; preds = %356
  br label %705, !dbg !3297

367:                                              ; preds = %356
  %368 = load i32, ptr %26, align 4, !dbg !3298
  %369 = load i32, ptr %45, align 4, !dbg !3300
  %370 = and i32 %368, %369, !dbg !3301
  %371 = icmp ne i32 %370, 0, !dbg !3298
  br i1 %371, label %372, label %384, !dbg !3298

372:                                              ; preds = %367
  %373 = load ptr, ptr %15, align 8, !dbg !3302
  %374 = load ptr, ptr %17, align 8, !dbg !3303
  %375 = load ptr, ptr %25, align 8, !dbg !3304
  %376 = load i32, ptr %44, align 4, !dbg !3305
  %377 = load i32, ptr %46, align 4, !dbg !3306
  %378 = load i32, ptr %47, align 4, !dbg !3307
  %379 = icmp eq i32 %378, 1, !dbg !3308
  %380 = zext i1 %379 to i64, !dbg !3309
  %381 = select i1 %379, i32 4, i32 3, !dbg !3309
  %382 = load i32, ptr %18, align 4, !dbg !3310
  %383 = call noundef i32 @_Z26special_check_line_to_faceP10vms_vectorS0_S0_P7segmentiiii(ptr noundef %31, ptr noundef %373, ptr noundef %374, ptr noundef %375, i32 noundef %376, i32 noundef %377, i32 noundef %381, i32 noundef %382), !dbg !3311
  store i32 %383, ptr %48, align 4, !dbg !3312
  br label %396, !dbg !3313

384:                                              ; preds = %367
  %385 = load ptr, ptr %15, align 8, !dbg !3314
  %386 = load ptr, ptr %17, align 8, !dbg !3315
  %387 = load ptr, ptr %25, align 8, !dbg !3316
  %388 = load i32, ptr %44, align 4, !dbg !3317
  %389 = load i32, ptr %46, align 4, !dbg !3318
  %390 = load i32, ptr %47, align 4, !dbg !3319
  %391 = icmp eq i32 %390, 1, !dbg !3320
  %392 = zext i1 %391 to i64, !dbg !3321
  %393 = select i1 %391, i32 4, i32 3, !dbg !3321
  %394 = load i32, ptr %18, align 4, !dbg !3322
  %395 = call noundef i32 @_Z18check_line_to_faceP10vms_vectorS0_S0_P7segmentiiii(ptr noundef %31, ptr noundef %385, ptr noundef %386, ptr noundef %387, i32 noundef %388, i32 noundef %389, i32 noundef %393, i32 noundef %394), !dbg !3323
  store i32 %395, ptr %48, align 4, !dbg !3324
  br label %396

396:                                              ; preds = %384, %372
  %397 = load i32, ptr %48, align 4, !dbg !3325
  %398 = icmp ne i32 %397, 0, !dbg !3325
  br i1 %398, label %399, label %703, !dbg !3325

399:                                              ; preds = %396
    #dbg_declare(ptr %49, !3327, !DIExpression(), !3329)
  %400 = load i16, ptr %19, align 2, !dbg !3330
  %401 = sext i16 %400 to i32, !dbg !3330
  %402 = load i32, ptr @Player_num, align 4, !dbg !3332
  %403 = sext i32 %402 to i64, !dbg !3333
  %404 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %403, !dbg !3333
  %405 = getelementptr inbounds nuw %struct.player, ptr %404, i32 0, i32 4, !dbg !3334
  %406 = load i32, ptr %405, align 4, !dbg !3334
  %407 = icmp eq i32 %401, %406, !dbg !3335
  br i1 %407, label %408, label %464, !dbg !3336

408:                                              ; preds = %399
  %409 = load i32, ptr @Physics_cheat_flag, align 4, !dbg !3337
  %410 = icmp eq i32 %409, 12245589, !dbg !3338
  br i1 %410, label %411, label %464, !dbg !3336

411:                                              ; preds = %408
  %412 = load ptr, ptr %25, align 8, !dbg !3339
  %413 = getelementptr inbounds nuw %struct.segment, ptr %412, i32 0, i32 1, !dbg !3339
  %414 = load i32, ptr %44, align 4, !dbg !3339
  %415 = sext i32 %414 to i64, !dbg !3339
  %416 = getelementptr inbounds [6 x i16], ptr %413, i64 0, i64 %415, !dbg !3339
  %417 = load i16, ptr %416, align 2, !dbg !3339
  %418 = sext i16 %417 to i32, !dbg !3339
  %419 = icmp eq i32 %418, -1, !dbg !3339
  br i1 %419, label %420, label %421, !dbg !3339

420:                                              ; preds = %411
  br label %450, !dbg !3339

421:                                              ; preds = %411
  %422 = load ptr, ptr %25, align 8, !dbg !3339
  %423 = getelementptr inbounds nuw %struct.segment, ptr %422, i32 0, i32 1, !dbg !3339
  %424 = load i32, ptr %44, align 4, !dbg !3339
  %425 = sext i32 %424 to i64, !dbg !3339
  %426 = getelementptr inbounds [6 x i16], ptr %423, i64 0, i64 %425, !dbg !3339
  %427 = load i16, ptr %426, align 2, !dbg !3339
  %428 = sext i16 %427 to i32, !dbg !3339
  %429 = icmp eq i32 %428, -2, !dbg !3339
  br i1 %429, label %430, label %431, !dbg !3339

430:                                              ; preds = %421
  br label %448, !dbg !3339

431:                                              ; preds = %421
  %432 = load ptr, ptr %25, align 8, !dbg !3339
  %433 = getelementptr inbounds nuw %struct.segment, ptr %432, i32 0, i32 0, !dbg !3339
  %434 = load i32, ptr %44, align 4, !dbg !3339
  %435 = sext i32 %434 to i64, !dbg !3339
  %436 = getelementptr inbounds [6 x %struct.side], ptr %433, i64 0, i64 %435, !dbg !3339
  %437 = getelementptr inbounds nuw %struct.side, ptr %436, i32 0, i32 2, !dbg !3339
  %438 = load i16, ptr %437, align 2, !dbg !3339
  %439 = sext i16 %438 to i32, !dbg !3339
  %440 = icmp eq i32 %439, -1, !dbg !3339
  br i1 %440, label %441, label %442, !dbg !3339

441:                                              ; preds = %431
  br label %446, !dbg !3339

442:                                              ; preds = %431
  %443 = load ptr, ptr %25, align 8, !dbg !3339
  %444 = load i32, ptr %44, align 4, !dbg !3339
  %445 = call noundef i32 @_Z15wall_is_doorwayP7segmenti(ptr noundef %443, i32 noundef %444), !dbg !3339
  br label %446, !dbg !3339

446:                                              ; preds = %442, %441
  %447 = phi i32 [ 5, %441 ], [ %445, %442 ], !dbg !3339
  br label %448, !dbg !3339

448:                                              ; preds = %446, %430
  %449 = phi i32 [ 8, %430 ], [ %447, %446 ], !dbg !3339
  br label %450, !dbg !3339

450:                                              ; preds = %448, %420
  %451 = phi i32 [ 2, %420 ], [ %449, %448 ], !dbg !3339
  store i32 %451, ptr %49, align 4, !dbg !3341
  %452 = load ptr, ptr %25, align 8, !dbg !3342
  %453 = getelementptr inbounds nuw %struct.segment, ptr %452, i32 0, i32 1, !dbg !3344
  %454 = load i32, ptr %44, align 4, !dbg !3345
  %455 = sext i32 %454 to i64, !dbg !3342
  %456 = getelementptr inbounds [6 x i16], ptr %453, i64 0, i64 %455, !dbg !3342
  %457 = load i16, ptr %456, align 2, !dbg !3342
  %458 = sext i16 %457 to i32, !dbg !3342
  %459 = icmp sge i32 %458, 0, !dbg !3346
  br i1 %459, label %460, label %463, !dbg !3346

460:                                              ; preds = %450
  %461 = load i32, ptr %49, align 4, !dbg !3347
  %462 = or i32 %461, 1, !dbg !3347
  store i32 %462, ptr %49, align 4, !dbg !3347
  br label %463, !dbg !3348

463:                                              ; preds = %460, %450
  br label %505, !dbg !3349

464:                                              ; preds = %408, %399
  %465 = load ptr, ptr %25, align 8, !dbg !3350
  %466 = getelementptr inbounds nuw %struct.segment, ptr %465, i32 0, i32 1, !dbg !3350
  %467 = load i32, ptr %44, align 4, !dbg !3350
  %468 = sext i32 %467 to i64, !dbg !3350
  %469 = getelementptr inbounds [6 x i16], ptr %466, i64 0, i64 %468, !dbg !3350
  %470 = load i16, ptr %469, align 2, !dbg !3350
  %471 = sext i16 %470 to i32, !dbg !3350
  %472 = icmp eq i32 %471, -1, !dbg !3350
  br i1 %472, label %473, label %474, !dbg !3350

473:                                              ; preds = %464
  br label %503, !dbg !3350

474:                                              ; preds = %464
  %475 = load ptr, ptr %25, align 8, !dbg !3350
  %476 = getelementptr inbounds nuw %struct.segment, ptr %475, i32 0, i32 1, !dbg !3350
  %477 = load i32, ptr %44, align 4, !dbg !3350
  %478 = sext i32 %477 to i64, !dbg !3350
  %479 = getelementptr inbounds [6 x i16], ptr %476, i64 0, i64 %478, !dbg !3350
  %480 = load i16, ptr %479, align 2, !dbg !3350
  %481 = sext i16 %480 to i32, !dbg !3350
  %482 = icmp eq i32 %481, -2, !dbg !3350
  br i1 %482, label %483, label %484, !dbg !3350

483:                                              ; preds = %474
  br label %501, !dbg !3350

484:                                              ; preds = %474
  %485 = load ptr, ptr %25, align 8, !dbg !3350
  %486 = getelementptr inbounds nuw %struct.segment, ptr %485, i32 0, i32 0, !dbg !3350
  %487 = load i32, ptr %44, align 4, !dbg !3350
  %488 = sext i32 %487 to i64, !dbg !3350
  %489 = getelementptr inbounds [6 x %struct.side], ptr %486, i64 0, i64 %488, !dbg !3350
  %490 = getelementptr inbounds nuw %struct.side, ptr %489, i32 0, i32 2, !dbg !3350
  %491 = load i16, ptr %490, align 2, !dbg !3350
  %492 = sext i16 %491 to i32, !dbg !3350
  %493 = icmp eq i32 %492, -1, !dbg !3350
  br i1 %493, label %494, label %495, !dbg !3350

494:                                              ; preds = %484
  br label %499, !dbg !3350

495:                                              ; preds = %484
  %496 = load ptr, ptr %25, align 8, !dbg !3350
  %497 = load i32, ptr %44, align 4, !dbg !3350
  %498 = call noundef i32 @_Z15wall_is_doorwayP7segmenti(ptr noundef %496, i32 noundef %497), !dbg !3350
  br label %499, !dbg !3350

499:                                              ; preds = %495, %494
  %500 = phi i32 [ 5, %494 ], [ %498, %495 ], !dbg !3350
  br label %501, !dbg !3350

501:                                              ; preds = %499, %483
  %502 = phi i32 [ 8, %483 ], [ %500, %499 ], !dbg !3350
  br label %503, !dbg !3350

503:                                              ; preds = %501, %473
  %504 = phi i32 [ 2, %473 ], [ %502, %501 ], !dbg !3350
  store i32 %504, ptr %49, align 4, !dbg !3352
  br label %505

505:                                              ; preds = %503, %463
  %506 = load i32, ptr %49, align 4, !dbg !3353
  %507 = and i32 %506, 1, !dbg !3355
  %508 = icmp ne i32 %507, 0, !dbg !3356
  br i1 %508, label %531, label %509, !dbg !3357

509:                                              ; preds = %505
  %510 = load i32, ptr %49, align 4, !dbg !3358
  %511 = and i32 %510, 2, !dbg !3359
  %512 = icmp ne i32 %511, 0, !dbg !3360
  br i1 %512, label %513, label %669, !dbg !3361

513:                                              ; preds = %509
  %514 = load i32, ptr %49, align 4, !dbg !3362
  %515 = and i32 %514, 4, !dbg !3363
  %516 = icmp ne i32 %515, 0, !dbg !3364
  br i1 %516, label %517, label %669, !dbg !3365

517:                                              ; preds = %513
  %518 = load i32, ptr %21, align 4, !dbg !3366
  %519 = and i32 %518, 2, !dbg !3367
  %520 = icmp ne i32 %519, 0, !dbg !3368
  br i1 %520, label %531, label %521, !dbg !3369

521:                                              ; preds = %517
  %522 = load i32, ptr %21, align 4, !dbg !3370
  %523 = and i32 %522, 4, !dbg !3371
  %524 = icmp ne i32 %523, 0, !dbg !3370
  br i1 %524, label %525, label %669, !dbg !3372

525:                                              ; preds = %521
  %526 = load ptr, ptr %25, align 8, !dbg !3373
  %527 = load i32, ptr %44, align 4, !dbg !3374
  %528 = load i32, ptr %46, align 4, !dbg !3375
  %529 = call noundef i32 @_Z16check_trans_wallP10vms_vectorP7segmentii(ptr noundef %31, ptr noundef %526, i32 noundef %527, i32 noundef %528), !dbg !3376
  %530 = icmp ne i32 %529, 0, !dbg !3376
  br i1 %530, label %531, label %669, !dbg !3357

531:                                              ; preds = %525, %517, %505
    #dbg_declare(ptr %50, !3377, !DIExpression(), !3379)
    #dbg_declare(ptr %51, !3380, !DIExpression(), !3381)
    #dbg_declare(ptr %52, !3382, !DIExpression(), !3383)
    #dbg_declare(ptr %53, !3384, !DIExpression(), !3385)
    #dbg_declare(ptr %54, !3386, !DIExpression(), !3387)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %54, ptr align 4 @wall_norm, i64 12, i1 false), !dbg !3388
    #dbg_declare(ptr %55, !3389, !DIExpression(), !3390)
  %532 = load i32, ptr @fvi_hit_object, align 4, !dbg !3391
  store i32 %532, ptr %55, align 4, !dbg !3390
    #dbg_declare(ptr %56, !3392, !DIExpression(), !3393)
  %533 = load ptr, ptr %25, align 8, !dbg !3394
  %534 = getelementptr inbounds nuw %struct.segment, ptr %533, i32 0, i32 1, !dbg !3395
  %535 = load i32, ptr %44, align 4, !dbg !3396
  %536 = sext i32 %535 to i64, !dbg !3394
  %537 = getelementptr inbounds [6 x i16], ptr %534, i64 0, i64 %536, !dbg !3394
  %538 = load i16, ptr %537, align 2, !dbg !3394
  %539 = sext i16 %538 to i32, !dbg !3394
  store i32 %539, ptr %50, align 4, !dbg !3397
  store i32 0, ptr %56, align 4, !dbg !3398
  br label %540, !dbg !3400

540:                                              ; preds = %555, %531
  %541 = load i32, ptr %56, align 4, !dbg !3401
  %542 = load i32, ptr @n_segs_visited, align 4, !dbg !3403
  %543 = icmp slt i32 %541, %542, !dbg !3404
  br i1 %543, label %544, label %552, !dbg !3405

544:                                              ; preds = %540
  %545 = load i32, ptr %50, align 4, !dbg !3406
  %546 = load i32, ptr %56, align 4, !dbg !3407
  %547 = sext i32 %546 to i64, !dbg !3408
  %548 = getelementptr inbounds [100 x i16], ptr @segs_visited, i64 0, i64 %547, !dbg !3408
  %549 = load i16, ptr %548, align 2, !dbg !3408
  %550 = sext i16 %549 to i32, !dbg !3408
  %551 = icmp ne i32 %545, %550, !dbg !3409
  br label %552

552:                                              ; preds = %544, %540
  %553 = phi i1 [ false, %540 ], [ %551, %544 ], !dbg !3410
  br i1 %553, label %554, label %558, !dbg !3411

554:                                              ; preds = %552
  br label %555, !dbg !3411

555:                                              ; preds = %554
  %556 = load i32, ptr %56, align 4, !dbg !3412
  %557 = add nsw i32 %556, 1, !dbg !3412
  store i32 %557, ptr %56, align 4, !dbg !3412
  br label %540, !dbg !3413, !llvm.loop !3414

558:                                              ; preds = %552
  %559 = load i32, ptr %56, align 4, !dbg !3416
  %560 = load i32, ptr @n_segs_visited, align 4, !dbg !3418
  %561 = icmp eq i32 %559, %560, !dbg !3419
  br i1 %561, label %562, label %668, !dbg !3419

562:                                              ; preds = %558
    #dbg_declare(ptr %57, !3420, !DIExpression(), !3422)
    #dbg_declare(ptr %58, !3423, !DIExpression(), !3424)
  %563 = load i32, ptr %50, align 4, !dbg !3425
  %564 = trunc i32 %563 to i16, !dbg !3425
  %565 = load i32, ptr @n_segs_visited, align 4, !dbg !3426
  %566 = add nsw i32 %565, 1, !dbg !3426
  store i32 %566, ptr @n_segs_visited, align 4, !dbg !3426
  %567 = sext i32 %565 to i64, !dbg !3427
  %568 = getelementptr inbounds [100 x i16], ptr @segs_visited, i64 0, i64 %567, !dbg !3427
  store i16 %564, ptr %568, align 2, !dbg !3428
  %569 = load i32, ptr @n_segs_visited, align 4, !dbg !3429
  %570 = icmp sge i32 %569, 100, !dbg !3431
  br i1 %570, label %571, label %572, !dbg !3431

571:                                              ; preds = %562
  br label %716, !dbg !3432

572:                                              ; preds = %562
  %573 = load ptr, ptr %15, align 8, !dbg !3433
  %574 = load i32, ptr %50, align 4, !dbg !3434
  %575 = load ptr, ptr %17, align 8, !dbg !3435
  %576 = load i32, ptr %18, align 4, !dbg !3436
  %577 = load i16, ptr %19, align 2, !dbg !3437
  %578 = load ptr, ptr %20, align 8, !dbg !3438
  %579 = load i32, ptr %21, align 4, !dbg !3439
  %580 = getelementptr inbounds [100 x i32], ptr %57, i64 0, i64 0, !dbg !3440
  %581 = load i32, ptr %16, align 4, !dbg !3441
  %582 = call noundef i32 @_Z7fvi_subP10vms_vectorPiS0_iS0_isS1_iS1_S1_i(ptr noundef %51, ptr noundef %53, ptr noundef %573, i32 noundef %574, ptr noundef %575, i32 noundef %576, i16 noundef signext %577, ptr noundef %578, i32 noundef %579, ptr noundef %580, ptr noundef %58, i32 noundef %581), !dbg !3442
  store i32 %582, ptr %52, align 4, !dbg !3443
  %583 = load i32, ptr %52, align 4, !dbg !3444
  %584 = icmp ne i32 %583, 0, !dbg !3446
  br i1 %584, label %585, label %634, !dbg !3446

585:                                              ; preds = %572
  %586 = load ptr, ptr %15, align 8, !dbg !3447
  %587 = call noundef i32 @_Z11vm_vec_distP10vms_vectorS0_(ptr noundef %51, ptr noundef %586), !dbg !3449
  store i32 %587, ptr %33, align 4, !dbg !3450
  %588 = load i32, ptr %33, align 4, !dbg !3451
  %589 = load i32, ptr %34, align 4, !dbg !3453
  %590 = icmp slt i32 %588, %589, !dbg !3454
  br i1 %590, label %591, label %631, !dbg !3454

591:                                              ; preds = %585
  %592 = load i32, ptr %33, align 4, !dbg !3455
  store i32 %592, ptr %34, align 4, !dbg !3457
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %32, ptr align 4 %51, i64 12, i1 false), !dbg !3458
  %593 = load i32, ptr %52, align 4, !dbg !3459
  store i32 %593, ptr %35, align 4, !dbg !3460
  %594 = load i32, ptr %53, align 4, !dbg !3461
  %595 = icmp ne i32 %594, -1, !dbg !3463
  br i1 %595, label %596, label %598, !dbg !3463

596:                                              ; preds = %591
  %597 = load i32, ptr %53, align 4, !dbg !3464
  store i32 %597, ptr %36, align 4, !dbg !3465
  br label %598, !dbg !3466

598:                                              ; preds = %596, %591
  %599 = load i32, ptr %21, align 4, !dbg !3467
  %600 = and i32 %599, 8, !dbg !3469
  %601 = icmp ne i32 %600, 0, !dbg !3467
  br i1 %601, label %602, label %626, !dbg !3467

602:                                              ; preds = %598
    #dbg_declare(ptr %59, !3470, !DIExpression(), !3472)
  store i32 0, ptr %59, align 4, !dbg !3473
  br label %603, !dbg !3475

603:                                              ; preds = %613, %602
  %604 = load i32, ptr %56, align 4, !dbg !3476
  %605 = load i32, ptr %58, align 4, !dbg !3478
  %606 = icmp slt i32 %604, %605, !dbg !3479
  br i1 %606, label %607, label %611, !dbg !3480

607:                                              ; preds = %603
  %608 = load ptr, ptr %23, align 8, !dbg !3481
  %609 = load i32, ptr %608, align 4, !dbg !3482
  %610 = icmp slt i32 %609, 99, !dbg !3483
  br label %611

611:                                              ; preds = %607, %603
  %612 = phi i1 [ false, %603 ], [ %610, %607 ], !dbg !3484
  br i1 %612, label %613, label %625, !dbg !3485

613:                                              ; preds = %611
  %614 = load i32, ptr %59, align 4, !dbg !3486
  %615 = add nsw i32 %614, 1, !dbg !3486
  store i32 %615, ptr %59, align 4, !dbg !3486
  %616 = sext i32 %614 to i64, !dbg !3487
  %617 = getelementptr inbounds [100 x i32], ptr %57, i64 0, i64 %616, !dbg !3487
  %618 = load i32, ptr %617, align 4, !dbg !3487
  %619 = load ptr, ptr %22, align 8, !dbg !3488
  %620 = load ptr, ptr %23, align 8, !dbg !3489
  %621 = load i32, ptr %620, align 4, !dbg !3490
  %622 = add nsw i32 %621, 1, !dbg !3490
  store i32 %622, ptr %620, align 4, !dbg !3490
  %623 = sext i32 %621 to i64, !dbg !3488
  %624 = getelementptr inbounds i32, ptr %619, i64 %623, !dbg !3488
  store i32 %618, ptr %624, align 4, !dbg !3491
  br label %603, !dbg !3492, !llvm.loop !3493

625:                                              ; preds = %611
  br label %626, !dbg !3495

626:                                              ; preds = %625, %598
  %627 = load ptr, ptr %23, align 8, !dbg !3496
  %628 = load i32, ptr %627, align 4, !dbg !3496
  %629 = icmp slt i32 %628, 100, !dbg !3496
  %630 = zext i1 %629 to i32, !dbg !3496
  call void @_Z7_AssertiPKcS0_i(i32 noundef %630, ptr noundef @.str.8, ptr noundef @.str.1, i32 noundef 1156), !dbg !3496
  br label %633, !dbg !3497

631:                                              ; preds = %585
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 @wall_norm, ptr align 4 %54, i64 12, i1 false), !dbg !3498
  %632 = load i32, ptr %55, align 4, !dbg !3500
  store i32 %632, ptr @fvi_hit_object, align 4, !dbg !3501
  br label %633

633:                                              ; preds = %631, %626
  br label %667, !dbg !3502

634:                                              ; preds = %572
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 @wall_norm, ptr align 4 %54, i64 12, i1 false), !dbg !3503
  %635 = load i32, ptr %53, align 4, !dbg !3505
  %636 = icmp ne i32 %635, -1, !dbg !3507
  br i1 %636, label %637, label %639, !dbg !3507

637:                                              ; preds = %634
  %638 = load i32, ptr %53, align 4, !dbg !3508
  store i32 %638, ptr %37, align 4, !dbg !3509
  br label %639, !dbg !3510

639:                                              ; preds = %637, %634
  %640 = load i32, ptr %21, align 4, !dbg !3511
  %641 = and i32 %640, 8, !dbg !3513
  %642 = icmp ne i32 %641, 0, !dbg !3511
  br i1 %642, label %643, label %665, !dbg !3511

643:                                              ; preds = %639
    #dbg_declare(ptr %60, !3514, !DIExpression(), !3516)
  store i32 0, ptr %60, align 4, !dbg !3517
  br label %644, !dbg !3519

644:                                              ; preds = %661, %643
  %645 = load i32, ptr %60, align 4, !dbg !3520
  %646 = load i32, ptr %58, align 4, !dbg !3522
  %647 = icmp slt i32 %645, %646, !dbg !3523
  br i1 %647, label %648, label %651, !dbg !3524

648:                                              ; preds = %644
  %649 = load i32, ptr %60, align 4, !dbg !3525
  %650 = icmp slt i32 %649, 99, !dbg !3526
  br label %651

651:                                              ; preds = %648, %644
  %652 = phi i1 [ false, %644 ], [ %650, %648 ], !dbg !3527
  br i1 %652, label %653, label %664, !dbg !3528

653:                                              ; preds = %651
  %654 = load i32, ptr %60, align 4, !dbg !3529
  %655 = sext i32 %654 to i64, !dbg !3530
  %656 = getelementptr inbounds [100 x i32], ptr %57, i64 0, i64 %655, !dbg !3530
  %657 = load i32, ptr %656, align 4, !dbg !3530
  %658 = load i32, ptr %60, align 4, !dbg !3531
  %659 = sext i32 %658 to i64, !dbg !3532
  %660 = getelementptr inbounds [100 x i32], ptr %39, i64 0, i64 %659, !dbg !3532
  store i32 %657, ptr %660, align 4, !dbg !3533
  br label %661, !dbg !3532

661:                                              ; preds = %653
  %662 = load i32, ptr %60, align 4, !dbg !3534
  %663 = add nsw i32 %662, 1, !dbg !3534
  store i32 %663, ptr %60, align 4, !dbg !3534
  br label %644, !dbg !3535, !llvm.loop !3536

664:                                              ; preds = %651
  br label %665, !dbg !3538

665:                                              ; preds = %664, %639
  %666 = load i32, ptr %58, align 4, !dbg !3539
  store i32 %666, ptr %38, align 4, !dbg !3540
  br label %667

667:                                              ; preds = %665, %633
  br label %668, !dbg !3541

668:                                              ; preds = %667, %558
  br label %702, !dbg !3542

669:                                              ; preds = %525, %521, %513, %509
  %670 = load ptr, ptr %15, align 8, !dbg !3543
  %671 = call noundef i32 @_Z11vm_vec_distP10vms_vectorS0_(ptr noundef %31, ptr noundef %670), !dbg !3545
  store i32 %671, ptr %33, align 4, !dbg !3546
  %672 = load i32, ptr %33, align 4, !dbg !3547
  %673 = load i32, ptr %34, align 4, !dbg !3549
  %674 = icmp slt i32 %672, %673, !dbg !3550
  br i1 %674, label %675, label %701, !dbg !3550

675:                                              ; preds = %669
  %676 = load i32, ptr %33, align 4, !dbg !3551
  store i32 %676, ptr %34, align 4, !dbg !3553
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %32, ptr align 4 %31, i64 12, i1 false), !dbg !3554
  store i32 1, ptr %35, align 4, !dbg !3555
  %677 = load ptr, ptr %25, align 8, !dbg !3556
  %678 = getelementptr inbounds nuw %struct.segment, ptr %677, i32 0, i32 0, !dbg !3557
  %679 = load i32, ptr %44, align 4, !dbg !3558
  %680 = sext i32 %679 to i64, !dbg !3556
  %681 = getelementptr inbounds [6 x %struct.side], ptr %678, i64 0, i64 %680, !dbg !3556
  %682 = getelementptr inbounds nuw %struct.side, ptr %681, i32 0, i32 6, !dbg !3559
  %683 = load i32, ptr %46, align 4, !dbg !3560
  %684 = sext i32 %683 to i64, !dbg !3556
  %685 = getelementptr inbounds [2 x %struct.vms_vector], ptr %682, i64 0, i64 %684, !dbg !3556
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 @wall_norm, ptr align 4 %685, i64 12, i1 false), !dbg !3561
  %686 = load i32, ptr %16, align 4, !dbg !3562
  %687 = load i32, ptr %18, align 4, !dbg !3564
  %688 = call i32 @_Z13get_seg_masksP10vms_vectorii(ptr noundef %31, i32 noundef %686, i32 noundef %687), !dbg !3565
  store i32 %688, ptr %61, align 2, !dbg !3565
  %689 = getelementptr inbounds nuw %struct.segmasks, ptr %61, i32 0, i32 2, !dbg !3566
  %690 = load i8, ptr %689, align 1, !dbg !3566
  %691 = sext i8 %690 to i32, !dbg !3565
  %692 = icmp eq i32 %691, 0, !dbg !3567
  br i1 %692, label %693, label %695, !dbg !3565

693:                                              ; preds = %675
  %694 = load i32, ptr %16, align 4, !dbg !3568
  store i32 %694, ptr %36, align 4, !dbg !3569
  br label %697, !dbg !3570

695:                                              ; preds = %675
  %696 = load i32, ptr %16, align 4, !dbg !3571
  store i32 %696, ptr @fvi_hit_seg2, align 4, !dbg !3572
  br label %697

697:                                              ; preds = %695, %693
  %698 = load i32, ptr %36, align 4, !dbg !3573
  store i32 %698, ptr @fvi_hit_seg, align 4, !dbg !3574
  %699 = load i32, ptr %44, align 4, !dbg !3575
  store i32 %699, ptr @fvi_hit_side, align 4, !dbg !3576
  %700 = load i32, ptr %16, align 4, !dbg !3577
  store i32 %700, ptr @fvi_hit_side_seg, align 4, !dbg !3578
  br label %701, !dbg !3579

701:                                              ; preds = %697, %669
  br label %702

702:                                              ; preds = %701, %668
  br label %703, !dbg !3580

703:                                              ; preds = %702, %396
  br label %704, !dbg !3581

704:                                              ; preds = %703, %351
  br label %705, !dbg !3582

705:                                              ; preds = %704, %366
  %706 = load i32, ptr %46, align 4, !dbg !3583
  %707 = add nsw i32 %706, 1, !dbg !3583
  store i32 %707, ptr %46, align 4, !dbg !3583
  %708 = load i32, ptr %45, align 4, !dbg !3584
  %709 = shl i32 %708, 1, !dbg !3584
  store i32 %709, ptr %45, align 4, !dbg !3584
  br label %348, !dbg !3585, !llvm.loop !3586

710:                                              ; preds = %348
  br label %711, !dbg !3588

711:                                              ; preds = %710
  %712 = load i32, ptr %44, align 4, !dbg !3589
  %713 = add nsw i32 %712, 1, !dbg !3589
  store i32 %713, ptr %44, align 4, !dbg !3589
  br label %328, !dbg !3590, !llvm.loop !3591

714:                                              ; preds = %335
  br label %715, !dbg !3593

715:                                              ; preds = %714, %324
  br label %716, !dbg !3594

716:                                              ; preds = %715, %571
    #dbg_label(!3595, !3596)
  %717 = load i32, ptr %35, align 4, !dbg !3597
  %718 = icmp eq i32 %717, 0, !dbg !3599
  br i1 %718, label %719, label %762, !dbg !3599

719:                                              ; preds = %716
    #dbg_declare(ptr %62, !3600, !DIExpression(), !3602)
  %720 = load ptr, ptr %17, align 8, !dbg !3603
  %721 = load ptr, ptr %13, align 8, !dbg !3604
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %721, ptr align 4 %720, i64 12, i1 false), !dbg !3605
  %722 = load i32, ptr %37, align 4, !dbg !3606
  %723 = load ptr, ptr %14, align 8, !dbg !3607
  store i32 %722, ptr %723, align 4, !dbg !3608
  %724 = load i32, ptr %37, align 4, !dbg !3609
  %725 = icmp ne i32 %724, -1, !dbg !3611
  br i1 %725, label %726, label %755, !dbg !3611

726:                                              ; preds = %719
  %727 = load i32, ptr %21, align 4, !dbg !3612
  %728 = and i32 %727, 8, !dbg !3615
  %729 = icmp ne i32 %728, 0, !dbg !3612
  br i1 %729, label %730, label %754, !dbg !3612

730:                                              ; preds = %726
  store i32 0, ptr %62, align 4, !dbg !3616
  br label %731, !dbg !3618

731:                                              ; preds = %741, %730
  %732 = load i32, ptr %62, align 4, !dbg !3619
  %733 = load i32, ptr %38, align 4, !dbg !3621
  %734 = icmp slt i32 %732, %733, !dbg !3622
  br i1 %734, label %735, label %739, !dbg !3623

735:                                              ; preds = %731
  %736 = load ptr, ptr %23, align 8, !dbg !3624
  %737 = load i32, ptr %736, align 4, !dbg !3625
  %738 = icmp slt i32 %737, 99, !dbg !3626
  br label %739

739:                                              ; preds = %735, %731
  %740 = phi i1 [ false, %731 ], [ %738, %735 ], !dbg !3627
  br i1 %740, label %741, label %753, !dbg !3628

741:                                              ; preds = %739
  %742 = load i32, ptr %62, align 4, !dbg !3629
  %743 = add nsw i32 %742, 1, !dbg !3629
  store i32 %743, ptr %62, align 4, !dbg !3629
  %744 = sext i32 %742 to i64, !dbg !3630
  %745 = getelementptr inbounds [100 x i32], ptr %39, i64 0, i64 %744, !dbg !3630
  %746 = load i32, ptr %745, align 4, !dbg !3630
  %747 = load ptr, ptr %22, align 8, !dbg !3631
  %748 = load ptr, ptr %23, align 8, !dbg !3632
  %749 = load i32, ptr %748, align 4, !dbg !3633
  %750 = add nsw i32 %749, 1, !dbg !3633
  store i32 %750, ptr %748, align 4, !dbg !3633
  %751 = sext i32 %749 to i64, !dbg !3631
  %752 = getelementptr inbounds i32, ptr %747, i64 %751, !dbg !3631
  store i32 %746, ptr %752, align 4, !dbg !3634
  br label %731, !dbg !3635, !llvm.loop !3636

753:                                              ; preds = %739
  br label %754, !dbg !3637

754:                                              ; preds = %753, %726
  br label %761, !dbg !3638

755:                                              ; preds = %719
  %756 = load i32, ptr %40, align 4, !dbg !3639
  %757 = icmp ne i32 %756, 0, !dbg !3641
  br i1 %757, label %758, label %760, !dbg !3641

758:                                              ; preds = %755
  %759 = load ptr, ptr %23, align 8, !dbg !3642
  store i32 0, ptr %759, align 4, !dbg !3643
  br label %760, !dbg !3644

760:                                              ; preds = %758, %755
  br label %761

761:                                              ; preds = %760, %754
  br label %780, !dbg !3645

762:                                              ; preds = %716
  %763 = load ptr, ptr %13, align 8, !dbg !3646
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %763, ptr align 4 %32, i64 12, i1 false), !dbg !3648
  %764 = load i32, ptr %36, align 4, !dbg !3649
  %765 = icmp eq i32 %764, -1, !dbg !3651
  br i1 %765, label %766, label %776, !dbg !3651

766:                                              ; preds = %762
  %767 = load i32, ptr @fvi_hit_seg2, align 4, !dbg !3652
  %768 = icmp ne i32 %767, -1, !dbg !3654
  br i1 %768, label %769, label %772, !dbg !3654

769:                                              ; preds = %766
  %770 = load i32, ptr @fvi_hit_seg2, align 4, !dbg !3655
  %771 = load ptr, ptr %14, align 8, !dbg !3656
  store i32 %770, ptr %771, align 4, !dbg !3657
  br label %775, !dbg !3658

772:                                              ; preds = %766
  %773 = load i32, ptr %37, align 4, !dbg !3659
  %774 = load ptr, ptr %14, align 8, !dbg !3660
  store i32 %773, ptr %774, align 4, !dbg !3661
  br label %775

775:                                              ; preds = %772, %769
  br label %779, !dbg !3662

776:                                              ; preds = %762
  %777 = load i32, ptr %36, align 4, !dbg !3663
  %778 = load ptr, ptr %14, align 8, !dbg !3664
  store i32 %777, ptr %778, align 4, !dbg !3665
  br label %779

779:                                              ; preds = %776, %775
  br label %780

780:                                              ; preds = %779, %761
  %781 = load i32, ptr %35, align 4, !dbg !3666
  %782 = icmp eq i32 %781, 2, !dbg !3666
  br i1 %782, label %783, label %786, !dbg !3666

783:                                              ; preds = %780
  %784 = load i32, ptr @fvi_hit_object, align 4, !dbg !3666
  %785 = icmp eq i32 %784, -1, !dbg !3666
  br label %786

786:                                              ; preds = %783, %780
  %787 = phi i1 [ false, %780 ], [ %785, %783 ], !dbg !3667
  %788 = xor i1 %787, true, !dbg !3666
  %789 = zext i1 %788 to i32, !dbg !3666
  call void @_Z7_AssertiPKcS0_i(i32 noundef %789, ptr noundef @.str.6, ptr noundef @.str.1, i32 noundef 1255), !dbg !3666
  %790 = load i32, ptr %35, align 4, !dbg !3668
  ret i32 %790, !dbg !3669
}

declare noundef i32 @_Z14find_point_segP10vms_vectori(ptr noundef, i32 noundef) #3

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define noundef i32 @_Z11obj_in_listiPi(i32 noundef %0, ptr noundef %1) #0 !dbg !3670 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !3673, !DIExpression(), !3674)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !3675, !DIExpression(), !3676)
    #dbg_declare(ptr %5, !3677, !DIExpression(), !3678)
  br label %6, !dbg !3679

6:                                                ; preds = %16, %2
  %7 = load ptr, ptr %4, align 8, !dbg !3680
  %8 = load i32, ptr %7, align 4, !dbg !3681
  store i32 %8, ptr %5, align 4, !dbg !3682
  %9 = icmp ne i32 %8, -1, !dbg !3683
  br i1 %9, label %10, label %14, !dbg !3684

10:                                               ; preds = %6
  %11 = load i32, ptr %5, align 4, !dbg !3685
  %12 = load i32, ptr %3, align 4, !dbg !3686
  %13 = icmp ne i32 %11, %12, !dbg !3687
  br label %14

14:                                               ; preds = %10, %6
  %15 = phi i1 [ false, %6 ], [ %13, %10 ], !dbg !3688
  br i1 %15, label %16, label %19, !dbg !3679

16:                                               ; preds = %14
  %17 = load ptr, ptr %4, align 8, !dbg !3689
  %18 = getelementptr inbounds nuw i32, ptr %17, i32 1, !dbg !3689
  store ptr %18, ptr %4, align 8, !dbg !3689
  br label %6, !dbg !3679, !llvm.loop !3690

19:                                               ; preds = %14
  %20 = load i32, ptr %5, align 4, !dbg !3691
  %21 = load i32, ptr %3, align 4, !dbg !3692
  %22 = icmp eq i32 %20, %21, !dbg !3693
  %23 = zext i1 %22 to i32, !dbg !3694
  ret i32 %23, !dbg !3695
}

declare noundef i32 @_Z17laser_are_relatedii(i32 noundef, i32 noundef) #3

declare noundef i32 @_Z13get_num_facesP4side(ptr noundef) #3

declare noundef i32 @_Z15wall_is_doorwayP7segmenti(ptr noundef, i32 noundef) #3

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z16check_trans_wallP10vms_vectorP7segmentii(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #2 !dbg !3696 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca %struct.bitmap_index, align 2
  store ptr %0, ptr %5, align 8
    #dbg_declare(ptr %5, !3699, !DIExpression(), !3700)
  store ptr %1, ptr %6, align 8
    #dbg_declare(ptr %6, !3701, !DIExpression(), !3702)
  store i32 %2, ptr %7, align 4
    #dbg_declare(ptr %7, !3703, !DIExpression(), !3704)
  store i32 %3, ptr %8, align 4
    #dbg_declare(ptr %8, !3705, !DIExpression(), !3706)
    #dbg_declare(ptr %9, !3707, !DIExpression(), !3724)
    #dbg_declare(ptr %10, !3725, !DIExpression(), !3726)
  %16 = load ptr, ptr %6, align 8, !dbg !3727
  %17 = getelementptr inbounds nuw %struct.segment, ptr %16, i32 0, i32 0, !dbg !3728
  %18 = load i32, ptr %7, align 4, !dbg !3729
  %19 = sext i32 %18 to i64, !dbg !3727
  %20 = getelementptr inbounds [6 x %struct.side], ptr %17, i64 0, i64 %19, !dbg !3727
  store ptr %20, ptr %10, align 8, !dbg !3726
    #dbg_declare(ptr %11, !3730, !DIExpression(), !3731)
    #dbg_declare(ptr %12, !3732, !DIExpression(), !3733)
    #dbg_declare(ptr %13, !3734, !DIExpression(), !3735)
    #dbg_declare(ptr %14, !3736, !DIExpression(), !3737)
  %21 = load ptr, ptr %5, align 8, !dbg !3738
  %22 = load ptr, ptr %6, align 8, !dbg !3739
  %23 = load i32, ptr %7, align 4, !dbg !3740
  %24 = load i32, ptr %8, align 4, !dbg !3741
  call void @_Z16find_hitpoint_uvPiS_S_P10vms_vectorP7segmentii(ptr noundef %13, ptr noundef %14, ptr noundef null, ptr noundef %21, ptr noundef %22, i32 noundef %23, i32 noundef %24), !dbg !3742
  %25 = load ptr, ptr %10, align 8, !dbg !3743
  %26 = getelementptr inbounds nuw %struct.side, ptr %25, i32 0, i32 4, !dbg !3745
  %27 = load i16, ptr %26, align 2, !dbg !3745
  %28 = sext i16 %27 to i32, !dbg !3743
  %29 = icmp ne i32 %28, 0, !dbg !3746
  br i1 %29, label %30, label %40, !dbg !3746

30:                                               ; preds = %4
  %31 = load ptr, ptr %10, align 8, !dbg !3747
  %32 = getelementptr inbounds nuw %struct.side, ptr %31, i32 0, i32 3, !dbg !3749
  %33 = load i16, ptr %32, align 4, !dbg !3749
  %34 = sext i16 %33 to i32, !dbg !3747
  %35 = load ptr, ptr %10, align 8, !dbg !3750
  %36 = getelementptr inbounds nuw %struct.side, ptr %35, i32 0, i32 4, !dbg !3751
  %37 = load i16, ptr %36, align 2, !dbg !3751
  %38 = sext i16 %37 to i32, !dbg !3750
  %39 = call noundef ptr @_Z26texmerge_get_cached_bitmapii(i32 noundef %34, i32 noundef %38), !dbg !3752
  store ptr %39, ptr %9, align 8, !dbg !3753
  br label %76, !dbg !3754

40:                                               ; preds = %4
  %41 = load ptr, ptr %10, align 8, !dbg !3755
  %42 = getelementptr inbounds nuw %struct.side, ptr %41, i32 0, i32 3, !dbg !3757
  %43 = load i16, ptr %42, align 4, !dbg !3757
  %44 = sext i16 %43 to i64, !dbg !3758
  %45 = getelementptr inbounds [1200 x %struct.bitmap_index], ptr @Textures, i64 0, i64 %44, !dbg !3758
  %46 = getelementptr inbounds nuw %struct.bitmap_index, ptr %45, i32 0, i32 0, !dbg !3759
  %47 = load i16, ptr %46, align 2, !dbg !3759
  %48 = zext i16 %47 to i64, !dbg !3760
  %49 = getelementptr inbounds nuw [2620 x %struct._grs_bitmap], ptr @GameBitmaps, i64 0, i64 %48, !dbg !3760
  store ptr %49, ptr %9, align 8, !dbg !3761
  br label %50, !dbg !3762

50:                                               ; preds = %40
  %51 = load ptr, ptr %10, align 8, !dbg !3763
  %52 = getelementptr inbounds nuw %struct.side, ptr %51, i32 0, i32 3, !dbg !3763
  %53 = load i16, ptr %52, align 4, !dbg !3763
  %54 = sext i16 %53 to i64, !dbg !3763
  %55 = getelementptr inbounds [1200 x %struct.bitmap_index], ptr @Textures, i64 0, i64 %54, !dbg !3763
  %56 = getelementptr inbounds nuw %struct.bitmap_index, ptr %55, i32 0, i32 0, !dbg !3763
  %57 = load i16, ptr %56, align 2, !dbg !3763
  %58 = zext i16 %57 to i64, !dbg !3763
  %59 = getelementptr inbounds nuw [2620 x %struct._grs_bitmap], ptr @GameBitmaps, i64 0, i64 %58, !dbg !3763
  %60 = getelementptr inbounds nuw %struct._grs_bitmap, ptr %59, i32 0, i32 5, !dbg !3763
  %61 = load i8, ptr %60, align 1, !dbg !3763
  %62 = sext i8 %61 to i32, !dbg !3763
  %63 = and i32 %62, 16, !dbg !3763
  %64 = icmp ne i32 %63, 0, !dbg !3763
  br i1 %64, label %65, label %74, !dbg !3763

65:                                               ; preds = %50
  %66 = load ptr, ptr %10, align 8, !dbg !3766
  %67 = getelementptr inbounds nuw %struct.side, ptr %66, i32 0, i32 3, !dbg !3766
  %68 = load i16, ptr %67, align 4, !dbg !3766
  %69 = sext i16 %68 to i64, !dbg !3766
  %70 = getelementptr inbounds [1200 x %struct.bitmap_index], ptr @Textures, i64 0, i64 %69, !dbg !3766
  call void @llvm.memcpy.p0.p0.i64(ptr align 2 %15, ptr align 2 %70, i64 2, i1 false), !dbg !3766
  %71 = getelementptr inbounds nuw %struct.bitmap_index, ptr %15, i32 0, i32 0, !dbg !3766
  %72 = load i16, ptr %71, align 2, !dbg !3766
  %73 = zext i16 %72 to i64, !dbg !3766
  call void @_Z20piggy_bitmap_page_in12bitmap_index(i64 %73), !dbg !3766
  br label %74, !dbg !3766

74:                                               ; preds = %65, %50
  br label %75, !dbg !3768

75:                                               ; preds = %74
  br label %76

76:                                               ; preds = %75, %30
  %77 = load ptr, ptr %9, align 8, !dbg !3769
  %78 = getelementptr inbounds nuw %struct._grs_bitmap, ptr %77, i32 0, i32 5, !dbg !3771
  %79 = load i8, ptr %78, align 1, !dbg !3771
  %80 = sext i8 %79 to i32, !dbg !3769
  %81 = and i32 %80, 8, !dbg !3772
  %82 = icmp ne i32 %81, 0, !dbg !3769
  br i1 %82, label %83, label %86, !dbg !3769

83:                                               ; preds = %76
  %84 = load ptr, ptr %9, align 8, !dbg !3773
  %85 = call noundef ptr @_Z18rle_expand_textureP11_grs_bitmap(ptr noundef %84), !dbg !3774
  store ptr %85, ptr %9, align 8, !dbg !3775
  br label %86, !dbg !3776

86:                                               ; preds = %83, %76
  %87 = load i32, ptr %13, align 4, !dbg !3777
  %88 = load ptr, ptr %9, align 8, !dbg !3778
  %89 = getelementptr inbounds nuw %struct._grs_bitmap, ptr %88, i32 0, i32 2, !dbg !3779
  %90 = load i16, ptr %89, align 4, !dbg !3779
  %91 = sext i16 %90 to i32, !dbg !3778
  %92 = mul nsw i32 %87, %91, !dbg !3780
  %93 = call noundef i32 @_Z3f2ii(i32 noundef %92), !dbg !3781
  %94 = load ptr, ptr %9, align 8, !dbg !3782
  %95 = getelementptr inbounds nuw %struct._grs_bitmap, ptr %94, i32 0, i32 2, !dbg !3783
  %96 = load i16, ptr %95, align 4, !dbg !3783
  %97 = sext i16 %96 to i32, !dbg !3782
  %98 = urem i32 %93, %97, !dbg !3784
  store i32 %98, ptr %11, align 4, !dbg !3785
  %99 = load i32, ptr %14, align 4, !dbg !3786
  %100 = load ptr, ptr %9, align 8, !dbg !3787
  %101 = getelementptr inbounds nuw %struct._grs_bitmap, ptr %100, i32 0, i32 3, !dbg !3788
  %102 = load i16, ptr %101, align 2, !dbg !3788
  %103 = sext i16 %102 to i32, !dbg !3787
  %104 = mul nsw i32 %99, %103, !dbg !3789
  %105 = call noundef i32 @_Z3f2ii(i32 noundef %104), !dbg !3790
  %106 = load ptr, ptr %9, align 8, !dbg !3791
  %107 = getelementptr inbounds nuw %struct._grs_bitmap, ptr %106, i32 0, i32 3, !dbg !3792
  %108 = load i16, ptr %107, align 2, !dbg !3792
  %109 = sext i16 %108 to i32, !dbg !3791
  %110 = urem i32 %105, %109, !dbg !3793
  store i32 %110, ptr %12, align 4, !dbg !3794
  %111 = load ptr, ptr %9, align 8, !dbg !3795
  %112 = getelementptr inbounds nuw %struct._grs_bitmap, ptr %111, i32 0, i32 7, !dbg !3796
  %113 = load ptr, ptr %112, align 8, !dbg !3796
  %114 = load i32, ptr %12, align 4, !dbg !3797
  %115 = load ptr, ptr %9, align 8, !dbg !3798
  %116 = getelementptr inbounds nuw %struct._grs_bitmap, ptr %115, i32 0, i32 2, !dbg !3799
  %117 = load i16, ptr %116, align 4, !dbg !3799
  %118 = sext i16 %117 to i32, !dbg !3798
  %119 = mul nsw i32 %114, %118, !dbg !3800
  %120 = load i32, ptr %11, align 4, !dbg !3801
  %121 = add nsw i32 %119, %120, !dbg !3802
  %122 = sext i32 %121 to i64, !dbg !3795
  %123 = getelementptr inbounds i8, ptr %113, i64 %122, !dbg !3795
  %124 = load i8, ptr %123, align 1, !dbg !3795
  %125 = zext i8 %124 to i32, !dbg !3795
  %126 = icmp eq i32 %125, 255, !dbg !3803
  %127 = zext i1 %126 to i32, !dbg !3804
  ret i32 %127, !dbg !3805
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z16find_hitpoint_uvPiS_S_P10vms_vectorP7segmentii(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef %5, i32 noundef %6) #2 !dbg !3806 {
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca ptr, align 8
  %16 = alloca %struct.vms_vector_array, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca ptr, align 8
  %23 = alloca [6 x i32], align 4
  %24 = alloca [6 x i32], align 4
  %25 = alloca %struct.vec2d, align 4
  %26 = alloca %struct.vec2d, align 4
  %27 = alloca %struct.vec2d, align 4
  %28 = alloca %struct.vec2d, align 4
  %29 = alloca [3 x %struct.uvl], align 4
  %30 = alloca i32, align 4
  %31 = alloca i32, align 4
  %32 = alloca i32, align 4
  store ptr %0, ptr %8, align 8
    #dbg_declare(ptr %8, !3809, !DIExpression(), !3810)
  store ptr %1, ptr %9, align 8
    #dbg_declare(ptr %9, !3811, !DIExpression(), !3812)
  store ptr %2, ptr %10, align 8
    #dbg_declare(ptr %10, !3813, !DIExpression(), !3814)
  store ptr %3, ptr %11, align 8
    #dbg_declare(ptr %11, !3815, !DIExpression(), !3816)
  store ptr %4, ptr %12, align 8
    #dbg_declare(ptr %12, !3817, !DIExpression(), !3818)
  store i32 %5, ptr %13, align 4
    #dbg_declare(ptr %13, !3819, !DIExpression(), !3820)
  store i32 %6, ptr %14, align 4
    #dbg_declare(ptr %14, !3821, !DIExpression(), !3822)
    #dbg_declare(ptr %15, !3823, !DIExpression(), !3824)
    #dbg_declare(ptr %16, !3825, !DIExpression(), !3826)
    #dbg_declare(ptr %17, !3827, !DIExpression(), !3828)
  %33 = load ptr, ptr %12, align 8, !dbg !3829
  %34 = ptrtoint ptr %33 to i64, !dbg !3830
  %35 = sub i64 %34, ptrtoint (ptr @Segments to i64), !dbg !3830
  %36 = sdiv exact i64 %35, 512, !dbg !3830
  %37 = trunc i64 %36 to i32, !dbg !3829
  store i32 %37, ptr %17, align 4, !dbg !3828
    #dbg_declare(ptr %18, !3831, !DIExpression(), !3832)
    #dbg_declare(ptr %19, !3833, !DIExpression(), !3834)
    #dbg_declare(ptr %20, !3835, !DIExpression(), !3836)
    #dbg_declare(ptr %21, !3837, !DIExpression(), !3838)
    #dbg_declare(ptr %22, !3839, !DIExpression(), !3840)
  %38 = load ptr, ptr %12, align 8, !dbg !3841
  %39 = getelementptr inbounds nuw %struct.segment, ptr %38, i32 0, i32 0, !dbg !3842
  %40 = load i32, ptr %13, align 4, !dbg !3843
  %41 = sext i32 %40 to i64, !dbg !3841
  %42 = getelementptr inbounds [6 x %struct.side], ptr %39, i64 0, i64 %41, !dbg !3841
  store ptr %42, ptr %22, align 8, !dbg !3840
    #dbg_declare(ptr %23, !3844, !DIExpression(), !3845)
    #dbg_declare(ptr %24, !3846, !DIExpression(), !3847)
    #dbg_declare(ptr %25, !3848, !DIExpression(), !3849)
    #dbg_declare(ptr %26, !3850, !DIExpression(), !3851)
    #dbg_declare(ptr %27, !3852, !DIExpression(), !3853)
    #dbg_declare(ptr %28, !3854, !DIExpression(), !3855)
    #dbg_declare(ptr %29, !3856, !DIExpression(), !3858)
    #dbg_declare(ptr %30, !3859, !DIExpression(), !3860)
    #dbg_declare(ptr %31, !3861, !DIExpression(), !3862)
    #dbg_declare(ptr %32, !3863, !DIExpression(), !3864)
  %43 = load i32, ptr %17, align 4, !dbg !3865
  %44 = icmp slt i32 %43, 0, !dbg !3867
  br i1 %44, label %49, label %45, !dbg !3868

45:                                               ; preds = %7
  %46 = load i32, ptr %17, align 4, !dbg !3869
  %47 = load i32, ptr @Highest_segment_index, align 4, !dbg !3870
  %48 = icmp sgt i32 %46, %47, !dbg !3871
  br i1 %48, label %49, label %53, !dbg !3868

49:                                               ; preds = %45, %7
  %50 = load i32, ptr %17, align 4, !dbg !3872
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.9, i32 noundef %50), !dbg !3872
  %51 = load ptr, ptr %9, align 8, !dbg !3874
  store i32 0, ptr %51, align 4, !dbg !3875
  %52 = load ptr, ptr %8, align 8, !dbg !3876
  store i32 0, ptr %52, align 4, !dbg !3877
  br label %369, !dbg !3878

53:                                               ; preds = %45
  %54 = load i32, ptr %17, align 4, !dbg !3879
  %55 = icmp eq i32 %54, -1, !dbg !3881
  br i1 %55, label %56, label %57, !dbg !3881

56:                                               ; preds = %53
  call void (ptr, ...) @_Z5ErrorPKcz(ptr noundef @.str.10), !dbg !3882
  br label %57, !dbg !3882

57:                                               ; preds = %56, %53
  %58 = getelementptr inbounds [6 x i32], ptr %23, i64 0, i64 0, !dbg !3883
  %59 = load i32, ptr %17, align 4, !dbg !3884
  %60 = load i32, ptr %13, align 4, !dbg !3885
  call void @_Z23create_abs_vertex_listsPiS_ii(ptr noundef %18, ptr noundef %58, i32 noundef %59, i32 noundef %60), !dbg !3886
  %61 = getelementptr inbounds [6 x i32], ptr %24, i64 0, i64 0, !dbg !3887
  %62 = load i32, ptr %17, align 4, !dbg !3888
  %63 = load i32, ptr %13, align 4, !dbg !3889
  call void @_Z24create_all_vertnum_listsPiS_ii(ptr noundef %18, ptr noundef %61, i32 noundef %62, i32 noundef %63), !dbg !3890
  %64 = load ptr, ptr %22, align 8, !dbg !3891
  %65 = getelementptr inbounds nuw %struct.side, ptr %64, i32 0, i32 6, !dbg !3892
  %66 = load i32, ptr %14, align 4, !dbg !3893
  %67 = sext i32 %66 to i64, !dbg !3891
  %68 = getelementptr inbounds [2 x %struct.vms_vector], ptr %65, i64 0, i64 %67, !dbg !3891
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %16, ptr align 4 %68, i64 12, i1 false), !dbg !3894
  store i32 0, ptr %19, align 4, !dbg !3895
  %69 = getelementptr inbounds nuw %struct.vms_vector_array, ptr %16, i32 0, i32 0, !dbg !3896
  %70 = getelementptr inbounds [3 x i32], ptr %69, i64 0, i64 1, !dbg !3898
  %71 = load i32, ptr %70, align 4, !dbg !3898
  %72 = call i32 @llvm.abs.i32(i32 %71, i1 true), !dbg !3899
  %73 = getelementptr inbounds nuw %struct.vms_vector_array, ptr %16, i32 0, i32 0, !dbg !3900
  %74 = load i32, ptr %19, align 4, !dbg !3901
  %75 = sext i32 %74 to i64, !dbg !3902
  %76 = getelementptr inbounds [3 x i32], ptr %73, i64 0, i64 %75, !dbg !3902
  %77 = load i32, ptr %76, align 4, !dbg !3902
  %78 = call i32 @llvm.abs.i32(i32 %77, i1 true), !dbg !3903
  %79 = icmp sgt i32 %72, %78, !dbg !3904
  br i1 %79, label %80, label %81, !dbg !3904

80:                                               ; preds = %57
  store i32 1, ptr %19, align 4, !dbg !3905
  br label %81, !dbg !3906

81:                                               ; preds = %80, %57
  %82 = getelementptr inbounds nuw %struct.vms_vector_array, ptr %16, i32 0, i32 0, !dbg !3907
  %83 = getelementptr inbounds [3 x i32], ptr %82, i64 0, i64 2, !dbg !3909
  %84 = load i32, ptr %83, align 4, !dbg !3909
  %85 = call i32 @llvm.abs.i32(i32 %84, i1 true), !dbg !3910
  %86 = getelementptr inbounds nuw %struct.vms_vector_array, ptr %16, i32 0, i32 0, !dbg !3911
  %87 = load i32, ptr %19, align 4, !dbg !3912
  %88 = sext i32 %87 to i64, !dbg !3913
  %89 = getelementptr inbounds [3 x i32], ptr %86, i64 0, i64 %88, !dbg !3913
  %90 = load i32, ptr %89, align 4, !dbg !3913
  %91 = call i32 @llvm.abs.i32(i32 %90, i1 true), !dbg !3914
  %92 = icmp sgt i32 %85, %91, !dbg !3915
  br i1 %92, label %93, label %94, !dbg !3915

93:                                               ; preds = %81
  store i32 2, ptr %19, align 4, !dbg !3916
  br label %94, !dbg !3917

94:                                               ; preds = %93, %81
  %95 = load i32, ptr %19, align 4, !dbg !3918
  %96 = icmp eq i32 %95, 0, !dbg !3920
  br i1 %96, label %97, label %98, !dbg !3920

97:                                               ; preds = %94
  store i32 1, ptr %20, align 4, !dbg !3921
  br label %99, !dbg !3922

98:                                               ; preds = %94
  store i32 0, ptr %20, align 4, !dbg !3923
  br label %99

99:                                               ; preds = %98, %97
  %100 = load i32, ptr %19, align 4, !dbg !3924
  %101 = icmp eq i32 %100, 2, !dbg !3926
  br i1 %101, label %102, label %103, !dbg !3926

102:                                              ; preds = %99
  store i32 1, ptr %21, align 4, !dbg !3927
  br label %104, !dbg !3928

103:                                              ; preds = %99
  store i32 2, ptr %21, align 4, !dbg !3929
  br label %104

104:                                              ; preds = %103, %102
  %105 = load i32, ptr %14, align 4, !dbg !3930
  %106 = mul nsw i32 %105, 3, !dbg !3931
  %107 = add nsw i32 %106, 1, !dbg !3932
  %108 = sext i32 %107 to i64, !dbg !3933
  %109 = getelementptr inbounds [6 x i32], ptr %23, i64 0, i64 %108, !dbg !3933
  %110 = load i32, ptr %109, align 4, !dbg !3933
  %111 = sext i32 %110 to i64, !dbg !3934
  %112 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %111, !dbg !3934
  store ptr %112, ptr %15, align 8, !dbg !3935
  %113 = load ptr, ptr %15, align 8, !dbg !3936
  %114 = getelementptr inbounds nuw %struct.vms_vector_array, ptr %113, i32 0, i32 0, !dbg !3937
  %115 = load i32, ptr %20, align 4, !dbg !3938
  %116 = sext i32 %115 to i64, !dbg !3936
  %117 = getelementptr inbounds [3 x i32], ptr %114, i64 0, i64 %116, !dbg !3936
  %118 = load i32, ptr %117, align 4, !dbg !3936
  %119 = getelementptr inbounds nuw %struct.vec2d, ptr %25, i32 0, i32 0, !dbg !3939
  store i32 %118, ptr %119, align 4, !dbg !3940
  %120 = load ptr, ptr %15, align 8, !dbg !3941
  %121 = getelementptr inbounds nuw %struct.vms_vector_array, ptr %120, i32 0, i32 0, !dbg !3942
  %122 = load i32, ptr %21, align 4, !dbg !3943
  %123 = sext i32 %122 to i64, !dbg !3941
  %124 = getelementptr inbounds [3 x i32], ptr %121, i64 0, i64 %123, !dbg !3941
  %125 = load i32, ptr %124, align 4, !dbg !3941
  %126 = getelementptr inbounds nuw %struct.vec2d, ptr %25, i32 0, i32 1, !dbg !3944
  store i32 %125, ptr %126, align 4, !dbg !3945
  %127 = load i32, ptr %14, align 4, !dbg !3946
  %128 = mul nsw i32 %127, 3, !dbg !3947
  %129 = add nsw i32 %128, 0, !dbg !3948
  %130 = sext i32 %129 to i64, !dbg !3949
  %131 = getelementptr inbounds [6 x i32], ptr %23, i64 0, i64 %130, !dbg !3949
  %132 = load i32, ptr %131, align 4, !dbg !3949
  %133 = sext i32 %132 to i64, !dbg !3950
  %134 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %133, !dbg !3950
  store ptr %134, ptr %15, align 8, !dbg !3951
  %135 = load ptr, ptr %15, align 8, !dbg !3952
  %136 = getelementptr inbounds nuw %struct.vms_vector_array, ptr %135, i32 0, i32 0, !dbg !3953
  %137 = load i32, ptr %20, align 4, !dbg !3954
  %138 = sext i32 %137 to i64, !dbg !3952
  %139 = getelementptr inbounds [3 x i32], ptr %136, i64 0, i64 %138, !dbg !3952
  %140 = load i32, ptr %139, align 4, !dbg !3952
  %141 = getelementptr inbounds nuw %struct.vec2d, ptr %25, i32 0, i32 0, !dbg !3955
  %142 = load i32, ptr %141, align 4, !dbg !3955
  %143 = sub nsw i32 %140, %142, !dbg !3956
  %144 = getelementptr inbounds nuw %struct.vec2d, ptr %26, i32 0, i32 0, !dbg !3957
  store i32 %143, ptr %144, align 4, !dbg !3958
  %145 = load ptr, ptr %15, align 8, !dbg !3959
  %146 = getelementptr inbounds nuw %struct.vms_vector_array, ptr %145, i32 0, i32 0, !dbg !3960
  %147 = load i32, ptr %21, align 4, !dbg !3961
  %148 = sext i32 %147 to i64, !dbg !3959
  %149 = getelementptr inbounds [3 x i32], ptr %146, i64 0, i64 %148, !dbg !3959
  %150 = load i32, ptr %149, align 4, !dbg !3959
  %151 = getelementptr inbounds nuw %struct.vec2d, ptr %25, i32 0, i32 1, !dbg !3962
  %152 = load i32, ptr %151, align 4, !dbg !3962
  %153 = sub nsw i32 %150, %152, !dbg !3963
  %154 = getelementptr inbounds nuw %struct.vec2d, ptr %26, i32 0, i32 1, !dbg !3964
  store i32 %153, ptr %154, align 4, !dbg !3965
  %155 = load i32, ptr %14, align 4, !dbg !3966
  %156 = mul nsw i32 %155, 3, !dbg !3967
  %157 = add nsw i32 %156, 2, !dbg !3968
  %158 = sext i32 %157 to i64, !dbg !3969
  %159 = getelementptr inbounds [6 x i32], ptr %23, i64 0, i64 %158, !dbg !3969
  %160 = load i32, ptr %159, align 4, !dbg !3969
  %161 = sext i32 %160 to i64, !dbg !3970
  %162 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %161, !dbg !3970
  store ptr %162, ptr %15, align 8, !dbg !3971
  %163 = load ptr, ptr %15, align 8, !dbg !3972
  %164 = getelementptr inbounds nuw %struct.vms_vector_array, ptr %163, i32 0, i32 0, !dbg !3973
  %165 = load i32, ptr %20, align 4, !dbg !3974
  %166 = sext i32 %165 to i64, !dbg !3972
  %167 = getelementptr inbounds [3 x i32], ptr %164, i64 0, i64 %166, !dbg !3972
  %168 = load i32, ptr %167, align 4, !dbg !3972
  %169 = getelementptr inbounds nuw %struct.vec2d, ptr %25, i32 0, i32 0, !dbg !3975
  %170 = load i32, ptr %169, align 4, !dbg !3975
  %171 = sub nsw i32 %168, %170, !dbg !3976
  %172 = getelementptr inbounds nuw %struct.vec2d, ptr %27, i32 0, i32 0, !dbg !3977
  store i32 %171, ptr %172, align 4, !dbg !3978
  %173 = load ptr, ptr %15, align 8, !dbg !3979
  %174 = getelementptr inbounds nuw %struct.vms_vector_array, ptr %173, i32 0, i32 0, !dbg !3980
  %175 = load i32, ptr %21, align 4, !dbg !3981
  %176 = sext i32 %175 to i64, !dbg !3979
  %177 = getelementptr inbounds [3 x i32], ptr %174, i64 0, i64 %176, !dbg !3979
  %178 = load i32, ptr %177, align 4, !dbg !3979
  %179 = getelementptr inbounds nuw %struct.vec2d, ptr %25, i32 0, i32 1, !dbg !3982
  %180 = load i32, ptr %179, align 4, !dbg !3982
  %181 = sub nsw i32 %178, %180, !dbg !3983
  %182 = getelementptr inbounds nuw %struct.vec2d, ptr %27, i32 0, i32 1, !dbg !3984
  store i32 %181, ptr %182, align 4, !dbg !3985
  %183 = load ptr, ptr %11, align 8, !dbg !3986
  store ptr %183, ptr %15, align 8, !dbg !3987
  %184 = load ptr, ptr %15, align 8, !dbg !3988
  %185 = getelementptr inbounds nuw %struct.vms_vector_array, ptr %184, i32 0, i32 0, !dbg !3989
  %186 = load i32, ptr %20, align 4, !dbg !3990
  %187 = sext i32 %186 to i64, !dbg !3988
  %188 = getelementptr inbounds [3 x i32], ptr %185, i64 0, i64 %187, !dbg !3988
  %189 = load i32, ptr %188, align 4, !dbg !3988
  %190 = getelementptr inbounds nuw %struct.vec2d, ptr %28, i32 0, i32 0, !dbg !3991
  store i32 %189, ptr %190, align 4, !dbg !3992
  %191 = load ptr, ptr %15, align 8, !dbg !3993
  %192 = getelementptr inbounds nuw %struct.vms_vector_array, ptr %191, i32 0, i32 0, !dbg !3994
  %193 = load i32, ptr %21, align 4, !dbg !3995
  %194 = sext i32 %193 to i64, !dbg !3993
  %195 = getelementptr inbounds [3 x i32], ptr %192, i64 0, i64 %194, !dbg !3993
  %196 = load i32, ptr %195, align 4, !dbg !3993
  %197 = getelementptr inbounds nuw %struct.vec2d, ptr %28, i32 0, i32 1, !dbg !3996
  store i32 %196, ptr %197, align 4, !dbg !3997
  %198 = getelementptr inbounds nuw %struct.vec2d, ptr %28, i32 0, i32 0, !dbg !3998
  %199 = load i32, ptr %198, align 4, !dbg !3998
  %200 = getelementptr inbounds nuw %struct.vec2d, ptr %26, i32 0, i32 1, !dbg !3998
  %201 = load i32, ptr %200, align 4, !dbg !3998
  %202 = call noundef i32 @_Z6fixmulii(i32 noundef %199, i32 noundef %201), !dbg !3998
  %203 = getelementptr inbounds nuw %struct.vec2d, ptr %28, i32 0, i32 1, !dbg !3998
  %204 = load i32, ptr %203, align 4, !dbg !3998
  %205 = getelementptr inbounds nuw %struct.vec2d, ptr %26, i32 0, i32 0, !dbg !3998
  %206 = load i32, ptr %205, align 4, !dbg !3998
  %207 = call noundef i32 @_Z6fixmulii(i32 noundef %204, i32 noundef %206), !dbg !3998
  %208 = sub nsw i32 %202, %207, !dbg !3998
  %209 = getelementptr inbounds nuw %struct.vec2d, ptr %26, i32 0, i32 0, !dbg !3999
  %210 = load i32, ptr %209, align 4, !dbg !3999
  %211 = getelementptr inbounds nuw %struct.vec2d, ptr %25, i32 0, i32 1, !dbg !3999
  %212 = load i32, ptr %211, align 4, !dbg !3999
  %213 = call noundef i32 @_Z6fixmulii(i32 noundef %210, i32 noundef %212), !dbg !3999
  %214 = getelementptr inbounds nuw %struct.vec2d, ptr %26, i32 0, i32 1, !dbg !3999
  %215 = load i32, ptr %214, align 4, !dbg !3999
  %216 = getelementptr inbounds nuw %struct.vec2d, ptr %25, i32 0, i32 0, !dbg !3999
  %217 = load i32, ptr %216, align 4, !dbg !3999
  %218 = call noundef i32 @_Z6fixmulii(i32 noundef %215, i32 noundef %217), !dbg !3999
  %219 = sub nsw i32 %213, %218, !dbg !3999
  %220 = add nsw i32 %208, %219, !dbg !4000
  %221 = getelementptr inbounds nuw %struct.vec2d, ptr %26, i32 0, i32 0, !dbg !4001
  %222 = load i32, ptr %221, align 4, !dbg !4001
  %223 = getelementptr inbounds nuw %struct.vec2d, ptr %27, i32 0, i32 1, !dbg !4001
  %224 = load i32, ptr %223, align 4, !dbg !4001
  %225 = call noundef i32 @_Z6fixmulii(i32 noundef %222, i32 noundef %224), !dbg !4001
  %226 = getelementptr inbounds nuw %struct.vec2d, ptr %26, i32 0, i32 1, !dbg !4001
  %227 = load i32, ptr %226, align 4, !dbg !4001
  %228 = getelementptr inbounds nuw %struct.vec2d, ptr %27, i32 0, i32 0, !dbg !4001
  %229 = load i32, ptr %228, align 4, !dbg !4001
  %230 = call noundef i32 @_Z6fixmulii(i32 noundef %227, i32 noundef %229), !dbg !4001
  %231 = sub nsw i32 %225, %230, !dbg !4001
  %232 = call noundef i32 @_Z6fixdivii(i32 noundef %220, i32 noundef %231), !dbg !4002
  %233 = sub nsw i32 0, %232, !dbg !4003
  store i32 %233, ptr %31, align 4, !dbg !4004
  %234 = getelementptr inbounds nuw %struct.vec2d, ptr %26, i32 0, i32 0, !dbg !4005
  %235 = load i32, ptr %234, align 4, !dbg !4005
  %236 = call i32 @llvm.abs.i32(i32 %235, i1 true), !dbg !4007
  %237 = getelementptr inbounds nuw %struct.vec2d, ptr %26, i32 0, i32 1, !dbg !4008
  %238 = load i32, ptr %237, align 4, !dbg !4008
  %239 = call i32 @llvm.abs.i32(i32 %238, i1 true), !dbg !4009
  %240 = icmp sgt i32 %236, %239, !dbg !4010
  br i1 %240, label %241, label %256, !dbg !4010

241:                                              ; preds = %104
  %242 = load i32, ptr %31, align 4, !dbg !4011
  %243 = sub nsw i32 0, %242, !dbg !4012
  %244 = getelementptr inbounds nuw %struct.vec2d, ptr %27, i32 0, i32 0, !dbg !4013
  %245 = load i32, ptr %244, align 4, !dbg !4013
  %246 = call noundef i32 @_Z6fixmulii(i32 noundef %243, i32 noundef %245), !dbg !4014
  %247 = getelementptr inbounds nuw %struct.vec2d, ptr %28, i32 0, i32 0, !dbg !4015
  %248 = load i32, ptr %247, align 4, !dbg !4015
  %249 = add nsw i32 %246, %248, !dbg !4016
  %250 = getelementptr inbounds nuw %struct.vec2d, ptr %25, i32 0, i32 0, !dbg !4017
  %251 = load i32, ptr %250, align 4, !dbg !4017
  %252 = sub nsw i32 %249, %251, !dbg !4018
  %253 = getelementptr inbounds nuw %struct.vec2d, ptr %26, i32 0, i32 0, !dbg !4019
  %254 = load i32, ptr %253, align 4, !dbg !4019
  %255 = call noundef i32 @_Z6fixdivii(i32 noundef %252, i32 noundef %254), !dbg !4020
  store i32 %255, ptr %30, align 4, !dbg !4021
  br label %271, !dbg !4022

256:                                              ; preds = %104
  %257 = load i32, ptr %31, align 4, !dbg !4023
  %258 = sub nsw i32 0, %257, !dbg !4024
  %259 = getelementptr inbounds nuw %struct.vec2d, ptr %27, i32 0, i32 1, !dbg !4025
  %260 = load i32, ptr %259, align 4, !dbg !4025
  %261 = call noundef i32 @_Z6fixmulii(i32 noundef %258, i32 noundef %260), !dbg !4026
  %262 = getelementptr inbounds nuw %struct.vec2d, ptr %28, i32 0, i32 1, !dbg !4027
  %263 = load i32, ptr %262, align 4, !dbg !4027
  %264 = add nsw i32 %261, %263, !dbg !4028
  %265 = getelementptr inbounds nuw %struct.vec2d, ptr %25, i32 0, i32 1, !dbg !4029
  %266 = load i32, ptr %265, align 4, !dbg !4029
  %267 = sub nsw i32 %264, %266, !dbg !4030
  %268 = getelementptr inbounds nuw %struct.vec2d, ptr %26, i32 0, i32 1, !dbg !4031
  %269 = load i32, ptr %268, align 4, !dbg !4031
  %270 = call noundef i32 @_Z6fixdivii(i32 noundef %267, i32 noundef %269), !dbg !4032
  store i32 %270, ptr %30, align 4, !dbg !4033
  br label %271

271:                                              ; preds = %256, %241
  store i32 0, ptr %32, align 4, !dbg !4034
  br label %272, !dbg !4036

272:                                              ; preds = %290, %271
  %273 = load i32, ptr %32, align 4, !dbg !4037
  %274 = icmp slt i32 %273, 3, !dbg !4039
  br i1 %274, label %275, label %293, !dbg !4040

275:                                              ; preds = %272
  %276 = load ptr, ptr %22, align 8, !dbg !4041
  %277 = getelementptr inbounds nuw %struct.side, ptr %276, i32 0, i32 5, !dbg !4042
  %278 = load i32, ptr %14, align 4, !dbg !4043
  %279 = mul nsw i32 %278, 3, !dbg !4044
  %280 = load i32, ptr %32, align 4, !dbg !4045
  %281 = add nsw i32 %279, %280, !dbg !4046
  %282 = sext i32 %281 to i64, !dbg !4047
  %283 = getelementptr inbounds [6 x i32], ptr %24, i64 0, i64 %282, !dbg !4047
  %284 = load i32, ptr %283, align 4, !dbg !4047
  %285 = sext i32 %284 to i64, !dbg !4041
  %286 = getelementptr inbounds [4 x %struct.uvl], ptr %277, i64 0, i64 %285, !dbg !4041
  %287 = load i32, ptr %32, align 4, !dbg !4048
  %288 = sext i32 %287 to i64, !dbg !4049
  %289 = getelementptr inbounds [3 x %struct.uvl], ptr %29, i64 0, i64 %288, !dbg !4049
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %289, ptr align 4 %286, i64 12, i1 false), !dbg !4050
  br label %290, !dbg !4049

290:                                              ; preds = %275
  %291 = load i32, ptr %32, align 4, !dbg !4051
  %292 = add nsw i32 %291, 1, !dbg !4051
  store i32 %292, ptr %32, align 4, !dbg !4051
  br label %272, !dbg !4052, !llvm.loop !4053

293:                                              ; preds = %272
  %294 = getelementptr inbounds [3 x %struct.uvl], ptr %29, i64 0, i64 1, !dbg !4055
  %295 = getelementptr inbounds nuw %struct.uvl, ptr %294, i32 0, i32 0, !dbg !4056
  %296 = load i32, ptr %295, align 4, !dbg !4056
  %297 = load i32, ptr %30, align 4, !dbg !4057
  %298 = getelementptr inbounds [3 x %struct.uvl], ptr %29, i64 0, i64 0, !dbg !4058
  %299 = getelementptr inbounds nuw %struct.uvl, ptr %298, i32 0, i32 0, !dbg !4059
  %300 = load i32, ptr %299, align 4, !dbg !4059
  %301 = getelementptr inbounds [3 x %struct.uvl], ptr %29, i64 0, i64 1, !dbg !4060
  %302 = getelementptr inbounds nuw %struct.uvl, ptr %301, i32 0, i32 0, !dbg !4061
  %303 = load i32, ptr %302, align 4, !dbg !4061
  %304 = sub nsw i32 %300, %303, !dbg !4062
  %305 = call noundef i32 @_Z6fixmulii(i32 noundef %297, i32 noundef %304), !dbg !4063
  %306 = add nsw i32 %296, %305, !dbg !4064
  %307 = load i32, ptr %31, align 4, !dbg !4065
  %308 = getelementptr inbounds [3 x %struct.uvl], ptr %29, i64 0, i64 2, !dbg !4066
  %309 = getelementptr inbounds nuw %struct.uvl, ptr %308, i32 0, i32 0, !dbg !4067
  %310 = load i32, ptr %309, align 4, !dbg !4067
  %311 = getelementptr inbounds [3 x %struct.uvl], ptr %29, i64 0, i64 1, !dbg !4068
  %312 = getelementptr inbounds nuw %struct.uvl, ptr %311, i32 0, i32 0, !dbg !4069
  %313 = load i32, ptr %312, align 4, !dbg !4069
  %314 = sub nsw i32 %310, %313, !dbg !4070
  %315 = call noundef i32 @_Z6fixmulii(i32 noundef %307, i32 noundef %314), !dbg !4071
  %316 = add nsw i32 %306, %315, !dbg !4072
  %317 = load ptr, ptr %8, align 8, !dbg !4073
  store i32 %316, ptr %317, align 4, !dbg !4074
  %318 = getelementptr inbounds [3 x %struct.uvl], ptr %29, i64 0, i64 1, !dbg !4075
  %319 = getelementptr inbounds nuw %struct.uvl, ptr %318, i32 0, i32 1, !dbg !4076
  %320 = load i32, ptr %319, align 4, !dbg !4076
  %321 = load i32, ptr %30, align 4, !dbg !4077
  %322 = getelementptr inbounds [3 x %struct.uvl], ptr %29, i64 0, i64 0, !dbg !4078
  %323 = getelementptr inbounds nuw %struct.uvl, ptr %322, i32 0, i32 1, !dbg !4079
  %324 = load i32, ptr %323, align 4, !dbg !4079
  %325 = getelementptr inbounds [3 x %struct.uvl], ptr %29, i64 0, i64 1, !dbg !4080
  %326 = getelementptr inbounds nuw %struct.uvl, ptr %325, i32 0, i32 1, !dbg !4081
  %327 = load i32, ptr %326, align 4, !dbg !4081
  %328 = sub nsw i32 %324, %327, !dbg !4082
  %329 = call noundef i32 @_Z6fixmulii(i32 noundef %321, i32 noundef %328), !dbg !4083
  %330 = add nsw i32 %320, %329, !dbg !4084
  %331 = load i32, ptr %31, align 4, !dbg !4085
  %332 = getelementptr inbounds [3 x %struct.uvl], ptr %29, i64 0, i64 2, !dbg !4086
  %333 = getelementptr inbounds nuw %struct.uvl, ptr %332, i32 0, i32 1, !dbg !4087
  %334 = load i32, ptr %333, align 4, !dbg !4087
  %335 = getelementptr inbounds [3 x %struct.uvl], ptr %29, i64 0, i64 1, !dbg !4088
  %336 = getelementptr inbounds nuw %struct.uvl, ptr %335, i32 0, i32 1, !dbg !4089
  %337 = load i32, ptr %336, align 4, !dbg !4089
  %338 = sub nsw i32 %334, %337, !dbg !4090
  %339 = call noundef i32 @_Z6fixmulii(i32 noundef %331, i32 noundef %338), !dbg !4091
  %340 = add nsw i32 %330, %339, !dbg !4092
  %341 = load ptr, ptr %9, align 8, !dbg !4093
  store i32 %340, ptr %341, align 4, !dbg !4094
  %342 = load ptr, ptr %10, align 8, !dbg !4095
  %343 = icmp ne ptr %342, null, !dbg !4095
  br i1 %343, label %344, label %369, !dbg !4095

344:                                              ; preds = %293
  %345 = getelementptr inbounds [3 x %struct.uvl], ptr %29, i64 0, i64 1, !dbg !4097
  %346 = getelementptr inbounds nuw %struct.uvl, ptr %345, i32 0, i32 2, !dbg !4098
  %347 = load i32, ptr %346, align 4, !dbg !4098
  %348 = load i32, ptr %30, align 4, !dbg !4099
  %349 = getelementptr inbounds [3 x %struct.uvl], ptr %29, i64 0, i64 0, !dbg !4100
  %350 = getelementptr inbounds nuw %struct.uvl, ptr %349, i32 0, i32 2, !dbg !4101
  %351 = load i32, ptr %350, align 4, !dbg !4101
  %352 = getelementptr inbounds [3 x %struct.uvl], ptr %29, i64 0, i64 1, !dbg !4102
  %353 = getelementptr inbounds nuw %struct.uvl, ptr %352, i32 0, i32 2, !dbg !4103
  %354 = load i32, ptr %353, align 4, !dbg !4103
  %355 = sub nsw i32 %351, %354, !dbg !4104
  %356 = call noundef i32 @_Z6fixmulii(i32 noundef %348, i32 noundef %355), !dbg !4105
  %357 = add nsw i32 %347, %356, !dbg !4106
  %358 = load i32, ptr %31, align 4, !dbg !4107
  %359 = getelementptr inbounds [3 x %struct.uvl], ptr %29, i64 0, i64 2, !dbg !4108
  %360 = getelementptr inbounds nuw %struct.uvl, ptr %359, i32 0, i32 2, !dbg !4109
  %361 = load i32, ptr %360, align 4, !dbg !4109
  %362 = getelementptr inbounds [3 x %struct.uvl], ptr %29, i64 0, i64 1, !dbg !4110
  %363 = getelementptr inbounds nuw %struct.uvl, ptr %362, i32 0, i32 2, !dbg !4111
  %364 = load i32, ptr %363, align 4, !dbg !4111
  %365 = sub nsw i32 %361, %364, !dbg !4112
  %366 = call noundef i32 @_Z6fixmulii(i32 noundef %358, i32 noundef %365), !dbg !4113
  %367 = add nsw i32 %357, %366, !dbg !4114
  %368 = load ptr, ptr %10, align 8, !dbg !4115
  store i32 %367, ptr %368, align 4, !dbg !4116
  br label %369, !dbg !4117

369:                                              ; preds = %49, %344, %293
  ret void, !dbg !4118
}

declare void @_Z8_mprintfiPKcz(i32 noundef, ptr noundef, ...) #3

declare void @_Z24create_all_vertnum_listsPiS_ii(ptr noundef, ptr noundef, i32 noundef, i32 noundef) #3

declare noundef ptr @_Z26texmerge_get_cached_bitmapii(i32 noundef, i32 noundef) #3

declare void @_Z20piggy_bitmap_page_in12bitmap_index(i64) #3

declare noundef ptr @_Z18rle_expand_textureP11_grs_bitmap(ptr noundef) #3

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z3f2ii(i32 noundef %0) #0 !dbg !4119 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !4122, !DIExpression(), !4123)
  %3 = load i32, ptr %2, align 4, !dbg !4124
  %4 = ashr i32 %3, 16, !dbg !4125
  ret i32 %4, !dbg !4126
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z22sphere_intersects_wallP10vms_vectorii(ptr noundef %0, i32 noundef %1, i32 noundef %2) #2 !dbg !4127 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca %struct.segmasks, align 2
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca [6 x i32], align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
    #dbg_declare(ptr %5, !4130, !DIExpression(), !4131)
  store i32 %1, ptr %6, align 4
    #dbg_declare(ptr %6, !4132, !DIExpression(), !4133)
  store i32 %2, ptr %7, align 4
    #dbg_declare(ptr %7, !4134, !DIExpression(), !4135)
    #dbg_declare(ptr %8, !4136, !DIExpression(), !4137)
    #dbg_declare(ptr %9, !4138, !DIExpression(), !4139)
  %19 = load i32, ptr %6, align 4, !dbg !4140
  %20 = trunc i32 %19 to i16, !dbg !4140
  %21 = load i32, ptr @n_segs_visited, align 4, !dbg !4141
  %22 = add nsw i32 %21, 1, !dbg !4141
  store i32 %22, ptr @n_segs_visited, align 4, !dbg !4141
  %23 = sext i32 %21 to i64, !dbg !4142
  %24 = getelementptr inbounds [100 x i16], ptr @segs_visited, i64 0, i64 %23, !dbg !4142
  store i16 %20, ptr %24, align 2, !dbg !4143
  %25 = load ptr, ptr %5, align 8, !dbg !4144
  %26 = load i32, ptr %6, align 4, !dbg !4145
  %27 = load i32, ptr %7, align 4, !dbg !4146
  %28 = call i32 @_Z13get_seg_masksP10vms_vectorii(ptr noundef %25, i32 noundef %26, i32 noundef %27), !dbg !4147
  store i32 %28, ptr %10, align 2, !dbg !4147
  %29 = getelementptr inbounds nuw %struct.segmasks, ptr %10, i32 0, i32 0, !dbg !4148
  %30 = load i16, ptr %29, align 2, !dbg !4148
  %31 = sext i16 %30 to i32, !dbg !4147
  store i32 %31, ptr %8, align 4, !dbg !4149
  %32 = load i32, ptr %6, align 4, !dbg !4150
  %33 = sext i32 %32 to i64, !dbg !4151
  %34 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %33, !dbg !4151
  store ptr %34, ptr %9, align 8, !dbg !4152
  %35 = load i32, ptr %8, align 4, !dbg !4153
  %36 = icmp ne i32 %35, 0, !dbg !4155
  br i1 %36, label %37, label %143, !dbg !4155

37:                                               ; preds = %3
    #dbg_declare(ptr %11, !4156, !DIExpression(), !4158)
    #dbg_declare(ptr %12, !4159, !DIExpression(), !4160)
    #dbg_declare(ptr %13, !4161, !DIExpression(), !4162)
  store i32 0, ptr %11, align 4, !dbg !4163
  store i32 1, ptr %12, align 4, !dbg !4165
  br label %38, !dbg !4166

38:                                               ; preds = %139, %37
  %39 = load i32, ptr %11, align 4, !dbg !4167
  %40 = icmp slt i32 %39, 6, !dbg !4169
  br i1 %40, label %41, label %45, !dbg !4170

41:                                               ; preds = %38
  %42 = load i32, ptr %8, align 4, !dbg !4171
  %43 = load i32, ptr %12, align 4, !dbg !4172
  %44 = icmp sge i32 %42, %43, !dbg !4173
  br label %45

45:                                               ; preds = %41, %38
  %46 = phi i1 [ false, %38 ], [ %44, %41 ], !dbg !4174
  br i1 %46, label %47, label %142, !dbg !4175

47:                                               ; preds = %45
  store i32 0, ptr %13, align 4, !dbg !4176
  br label %48, !dbg !4179

48:                                               ; preds = %133, %47
  %49 = load i32, ptr %13, align 4, !dbg !4180
  %50 = icmp slt i32 %49, 2, !dbg !4182
  br i1 %50, label %51, label %138, !dbg !4183

51:                                               ; preds = %48
  %52 = load i32, ptr %8, align 4, !dbg !4184
  %53 = load i32, ptr %12, align 4, !dbg !4187
  %54 = and i32 %52, %53, !dbg !4188
  %55 = icmp ne i32 %54, 0, !dbg !4184
  br i1 %55, label %56, label %132, !dbg !4184

56:                                               ; preds = %51
    #dbg_declare(ptr %14, !4189, !DIExpression(), !4191)
    #dbg_declare(ptr %15, !4192, !DIExpression(), !4193)
    #dbg_declare(ptr %16, !4194, !DIExpression(), !4195)
  %57 = load ptr, ptr %9, align 8, !dbg !4196
  %58 = ptrtoint ptr %57 to i64, !dbg !4198
  %59 = sub i64 %58, ptrtoint (ptr @Segments to i64), !dbg !4198
  %60 = sdiv exact i64 %59, 512, !dbg !4198
  %61 = icmp eq i64 %60, -1, !dbg !4199
  br i1 %61, label %62, label %63, !dbg !4199

62:                                               ; preds = %56
  call void (ptr, ...) @_Z5ErrorPKcz(ptr noundef @.str.11), !dbg !4200
  br label %63, !dbg !4200

63:                                               ; preds = %62, %56
  %64 = getelementptr inbounds [6 x i32], ptr %16, i64 0, i64 0, !dbg !4201
  %65 = load ptr, ptr %9, align 8, !dbg !4202
  %66 = ptrtoint ptr %65 to i64, !dbg !4203
  %67 = sub i64 %66, ptrtoint (ptr @Segments to i64), !dbg !4203
  %68 = sdiv exact i64 %67, 512, !dbg !4203
  %69 = trunc i64 %68 to i32, !dbg !4202
  %70 = load i32, ptr %11, align 4, !dbg !4204
  call void @_Z23create_abs_vertex_listsPiS_ii(ptr noundef %15, ptr noundef %64, i32 noundef %69, i32 noundef %70), !dbg !4205
  %71 = load ptr, ptr %5, align 8, !dbg !4206
  %72 = load ptr, ptr %9, align 8, !dbg !4207
  %73 = getelementptr inbounds nuw %struct.segment, ptr %72, i32 0, i32 0, !dbg !4208
  %74 = load i32, ptr %11, align 4, !dbg !4209
  %75 = sext i32 %74 to i64, !dbg !4207
  %76 = getelementptr inbounds [6 x %struct.side], ptr %73, i64 0, i64 %75, !dbg !4207
  %77 = load i32, ptr %13, align 4, !dbg !4210
  %78 = load i32, ptr %15, align 4, !dbg !4211
  %79 = icmp eq i32 %78, 1, !dbg !4212
  %80 = zext i1 %79 to i64, !dbg !4213
  %81 = select i1 %79, i32 4, i32 3, !dbg !4213
  %82 = load i32, ptr %7, align 4, !dbg !4214
  %83 = getelementptr inbounds [6 x i32], ptr %16, i64 0, i64 0, !dbg !4215
  %84 = call noundef i32 @_Z20check_sphere_to_faceP10vms_vectorP4sideiiiPi(ptr noundef %71, ptr noundef %76, i32 noundef %77, i32 noundef %81, i32 noundef %82, ptr noundef %83), !dbg !4216
  store i32 %84, ptr %14, align 4, !dbg !4217
  %85 = load i32, ptr %14, align 4, !dbg !4218
  %86 = icmp ne i32 %85, 0, !dbg !4218
  br i1 %86, label %87, label %131, !dbg !4218

87:                                               ; preds = %63
    #dbg_declare(ptr %17, !4220, !DIExpression(), !4222)
    #dbg_declare(ptr %18, !4223, !DIExpression(), !4224)
  %88 = load ptr, ptr %9, align 8, !dbg !4225
  %89 = getelementptr inbounds nuw %struct.segment, ptr %88, i32 0, i32 1, !dbg !4226
  %90 = load i32, ptr %11, align 4, !dbg !4227
  %91 = sext i32 %90 to i64, !dbg !4225
  %92 = getelementptr inbounds [6 x i16], ptr %89, i64 0, i64 %91, !dbg !4225
  %93 = load i16, ptr %92, align 2, !dbg !4225
  %94 = sext i16 %93 to i32, !dbg !4225
  store i32 %94, ptr %17, align 4, !dbg !4228
  store i32 0, ptr %18, align 4, !dbg !4229
  br label %95, !dbg !4231

95:                                               ; preds = %110, %87
  %96 = load i32, ptr %18, align 4, !dbg !4232
  %97 = load i32, ptr @n_segs_visited, align 4, !dbg !4234
  %98 = icmp slt i32 %96, %97, !dbg !4235
  br i1 %98, label %99, label %107, !dbg !4236

99:                                               ; preds = %95
  %100 = load i32, ptr %17, align 4, !dbg !4237
  %101 = load i32, ptr %18, align 4, !dbg !4238
  %102 = sext i32 %101 to i64, !dbg !4239
  %103 = getelementptr inbounds [100 x i16], ptr @segs_visited, i64 0, i64 %102, !dbg !4239
  %104 = load i16, ptr %103, align 2, !dbg !4239
  %105 = sext i16 %104 to i32, !dbg !4239
  %106 = icmp ne i32 %100, %105, !dbg !4240
  br label %107

107:                                              ; preds = %99, %95
  %108 = phi i1 [ false, %95 ], [ %106, %99 ], !dbg !4241
  br i1 %108, label %109, label %113, !dbg !4242

109:                                              ; preds = %107
  br label %110, !dbg !4242

110:                                              ; preds = %109
  %111 = load i32, ptr %18, align 4, !dbg !4243
  %112 = add nsw i32 %111, 1, !dbg !4243
  store i32 %112, ptr %18, align 4, !dbg !4243
  br label %95, !dbg !4244, !llvm.loop !4245

113:                                              ; preds = %107
  %114 = load i32, ptr %18, align 4, !dbg !4247
  %115 = load i32, ptr @n_segs_visited, align 4, !dbg !4249
  %116 = icmp eq i32 %114, %115, !dbg !4250
  br i1 %116, label %117, label %130, !dbg !4250

117:                                              ; preds = %113
  %118 = load i32, ptr %17, align 4, !dbg !4251
  %119 = icmp sgt i32 %118, -1, !dbg !4251
  br i1 %119, label %121, label %120, !dbg !4254

120:                                              ; preds = %117
  store i32 1, ptr %4, align 4, !dbg !4255
  br label %144, !dbg !4255

121:                                              ; preds = %117
  %122 = load ptr, ptr %5, align 8, !dbg !4256
  %123 = load i32, ptr %17, align 4, !dbg !4259
  %124 = load i32, ptr %7, align 4, !dbg !4260
  %125 = call noundef i32 @_Z22sphere_intersects_wallP10vms_vectorii(ptr noundef %122, i32 noundef %123, i32 noundef %124), !dbg !4261
  %126 = icmp ne i32 %125, 0, !dbg !4261
  br i1 %126, label %127, label %128, !dbg !4261

127:                                              ; preds = %121
  store i32 1, ptr %4, align 4, !dbg !4262
  br label %144, !dbg !4262

128:                                              ; preds = %121
  br label %129

129:                                              ; preds = %128
  br label %130, !dbg !4263

130:                                              ; preds = %129, %113
  br label %131, !dbg !4264

131:                                              ; preds = %130, %63
  br label %132, !dbg !4265

132:                                              ; preds = %131, %51
  br label %133, !dbg !4266

133:                                              ; preds = %132
  %134 = load i32, ptr %13, align 4, !dbg !4267
  %135 = add nsw i32 %134, 1, !dbg !4267
  store i32 %135, ptr %13, align 4, !dbg !4267
  %136 = load i32, ptr %12, align 4, !dbg !4268
  %137 = shl i32 %136, 1, !dbg !4268
  store i32 %137, ptr %12, align 4, !dbg !4268
  br label %48, !dbg !4269, !llvm.loop !4270

138:                                              ; preds = %48
  br label %139, !dbg !4272

139:                                              ; preds = %138
  %140 = load i32, ptr %11, align 4, !dbg !4273
  %141 = add nsw i32 %140, 1, !dbg !4273
  store i32 %141, ptr %11, align 4, !dbg !4273
  br label %38, !dbg !4274, !llvm.loop !4275

142:                                              ; preds = %45
  br label %143, !dbg !4277

143:                                              ; preds = %142, %3
  store i32 0, ptr %4, align 4, !dbg !4278
  br label %144, !dbg !4278

144:                                              ; preds = %143, %127, %120
  %145 = load i32, ptr %4, align 4, !dbg !4279
  ret i32 %145, !dbg !4279
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z22object_intersects_wallP6object(ptr noundef %0) #2 !dbg !4280 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !4283, !DIExpression(), !4284)
  store i32 0, ptr @n_segs_visited, align 4, !dbg !4285
  %3 = load ptr, ptr %2, align 8, !dbg !4286
  %4 = getelementptr inbounds nuw %struct.object, ptr %3, i32 0, i32 11, !dbg !4287
  %5 = load ptr, ptr %2, align 8, !dbg !4288
  %6 = getelementptr inbounds nuw %struct.object, ptr %5, i32 0, i32 9, !dbg !4289
  %7 = load i16, ptr %6, align 2, !dbg !4289
  %8 = sext i16 %7 to i32, !dbg !4288
  %9 = load ptr, ptr %2, align 8, !dbg !4290
  %10 = getelementptr inbounds nuw %struct.object, ptr %9, i32 0, i32 13, !dbg !4291
  %11 = load i32, ptr %10, align 4, !dbg !4291
  %12 = call noundef i32 @_Z22sphere_intersects_wallP10vms_vectorii(ptr noundef %4, i32 noundef %8, i32 noundef %11), !dbg !4292
  ret i32 %12, !dbg !4293
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 4 dereferenceable(4) ptr @_ZNSt3__13minB8ne200100IiNS_6__lessIvvEEEERKT_S5_S5_T0_(ptr noundef nonnull align 4 dereferenceable(4) %0, ptr noundef nonnull align 4 dereferenceable(4) %1) #2 !dbg !4294 {
  %3 = alloca %"struct.std::__1::__less", align 1
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !4304, !DIExpression(), !4305)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !4306, !DIExpression(), !4307)
    #dbg_declare(ptr %3, !4308, !DIExpression(), !4309)
  %6 = load ptr, ptr %5, align 8, !dbg !4310
  %7 = load ptr, ptr %4, align 8, !dbg !4311
  %8 = call noundef zeroext i1 @_ZNKSt3__16__lessIvvEclB8ne200100IiiEEbRKT_RKT0_(ptr noundef nonnull align 1 dereferenceable(1) %3, ptr noundef nonnull align 4 dereferenceable(4) %6, ptr noundef nonnull align 4 dereferenceable(4) %7), !dbg !4312
  br i1 %8, label %9, label %11, !dbg !4312

9:                                                ; preds = %2
  %10 = load ptr, ptr %5, align 8, !dbg !4313
  br label %13, !dbg !4312

11:                                               ; preds = %2
  %12 = load ptr, ptr %4, align 8, !dbg !4314
  br label %13, !dbg !4312

13:                                               ; preds = %11, %9
  %14 = phi ptr [ %10, %9 ], [ %12, %11 ], !dbg !4312
  ret ptr %14, !dbg !4315
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef zeroext i1 @_ZNKSt3__16__lessIvvEclB8ne200100IiiEEbRKT_RKT0_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef nonnull align 4 dereferenceable(4) %1, ptr noundef nonnull align 4 dereferenceable(4) %2) #0 !dbg !4316 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !4324, !DIExpression(), !4326)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !4327, !DIExpression(), !4328)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !4329, !DIExpression(), !4330)
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8, !dbg !4331
  %9 = load i32, ptr %8, align 4, !dbg !4331
  %10 = load ptr, ptr %6, align 8, !dbg !4332
  %11 = load i32, ptr %10, align 4, !dbg !4332
  %12 = icmp slt i32 %9, %11, !dbg !4333
  ret i1 %12, !dbg !4334
}

attributes #0 = { mustprogress noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress noinline ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #3 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

!llvm.module.flags = !{!1368, !1369, !1370, !1371, !1372, !1373, !1374}
!llvm.dbg.cu = !{!15}
!llvm.ident = !{!1375}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 127, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "main_d2/fvi.cpp", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "765eca8a4d2dfcc9bcb0ff713fb0895e")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 64, elements: !6)
!4 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !5)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !{!7}
!7 = !DISubrange(count: 8)
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(scope: null, file: !2, line: 127, type: !10, isLocal: true, isDefinition: true)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 424, elements: !11)
!11 = !{!12}
!12 = !DISubrange(count: 53)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "ij_table", scope: !15, file: !2, line: 152, type: !1365, isLocal: false, isDefinition: true)
!15 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !16, producer: "Homebrew clang version 20.1.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !17, globals: !37, imports: !118, splitDebugInlining: false, nameTableKind: Apple, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk", sdk: "MacOSX15.sdk")
!16 = !DIFile(filename: "/Users/richard/code/ChocolateDescent/main_d2/fvi.cpp", directory: "/Users/richard/code/ChocolateDescent/build-c-ref", checksumkind: CSK_MD5, checksum: "765eca8a4d2dfcc9bcb0ff713fb0895e")
!17 = !{!18, !21, !35, !36, !28}
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !19, line: 30, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int64_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e6d85c1a9e23dbf7518ce3b162aac800")
!20 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_vector_array", file: !23, line: 27, baseType: !24)
!23 = !DIFile(filename: "./vecmat/vecmat.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "dfa84e3325c1ea4f5f74699fff5ef2bf")
!24 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_vector_array", file: !23, line: 24, size: 96, flags: DIFlagTypePassByValue, elements: !25, identifier: "_ZTS16vms_vector_array")
!25 = !{!26}
!26 = !DIDerivedType(tag: DW_TAG_member, name: "xyz", scope: !24, file: !23, line: 26, baseType: !27, size: 96)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 96, elements: !33)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "fix", file: !29, line: 20, baseType: !30)
!29 = !DIFile(filename: "./fix/fix.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "c5006a11bf8b4cb7d963898499eda13a")
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !31, line: 30, baseType: !32)
!31 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int32_t.h", directory: "", checksumkind: CSK_MD5, checksum: "d23e8406e80ee79983f28509c741fa17")
!32 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!33 = !{!34}
!34 = !DISubrange(count: 3)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!36 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!37 = !{!0, !8, !13, !38, !43, !45, !50, !52, !58, !60, !62, !64, !66, !68, !76, !78, !83, !88, !93, !98, !103, !108, !110, !115}
!38 = !DIGlobalVariableExpression(var: !39, expr: !DIExpression())
!39 = distinct !DIGlobalVariable(scope: null, file: !2, line: 306, type: !40, isLocal: true, isDefinition: true)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 296, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 37)
!43 = !DIGlobalVariableExpression(var: !44, expr: !DIExpression())
!44 = distinct !DIGlobalVariable(name: "disable_new_fvi_stuff", scope: !15, file: !2, line: 397, type: !32, isLocal: false, isDefinition: true)
!45 = !DIGlobalVariableExpression(var: !46, expr: !DIExpression())
!46 = distinct !DIGlobalVariable(scope: null, file: !2, line: 411, type: !47, isLocal: true, isDefinition: true)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 360, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 45)
!50 = !DIGlobalVariableExpression(var: !51, expr: !DIExpression())
!51 = distinct !DIGlobalVariable(name: "n_segs_visited", scope: !15, file: !2, line: 700, type: !32, isLocal: false, isDefinition: true)
!52 = !DIGlobalVariableExpression(var: !53, expr: !DIExpression())
!53 = distinct !DIGlobalVariable(name: "segs_visited", scope: !15, file: !2, line: 701, type: !54, isLocal: false, isDefinition: true)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !55, size: 1600, elements: !56)
!55 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!56 = !{!57}
!57 = !DISubrange(count: 100)
!58 = !DIGlobalVariableExpression(var: !59, expr: !DIExpression())
!59 = distinct !DIGlobalVariable(name: "fvi_nest_count", scope: !15, file: !2, line: 703, type: !32, isLocal: false, isDefinition: true)
!60 = !DIGlobalVariableExpression(var: !61, expr: !DIExpression())
!61 = distinct !DIGlobalVariable(name: "fvi_hit_object", scope: !15, file: !2, line: 706, type: !32, isLocal: false, isDefinition: true)
!62 = !DIGlobalVariableExpression(var: !63, expr: !DIExpression())
!63 = distinct !DIGlobalVariable(name: "fvi_hit_seg", scope: !15, file: !2, line: 707, type: !32, isLocal: false, isDefinition: true)
!64 = !DIGlobalVariableExpression(var: !65, expr: !DIExpression())
!65 = distinct !DIGlobalVariable(name: "fvi_hit_side", scope: !15, file: !2, line: 708, type: !32, isLocal: false, isDefinition: true)
!66 = !DIGlobalVariableExpression(var: !67, expr: !DIExpression())
!67 = distinct !DIGlobalVariable(name: "fvi_hit_side_seg", scope: !15, file: !2, line: 709, type: !32, isLocal: false, isDefinition: true)
!68 = !DIGlobalVariableExpression(var: !69, expr: !DIExpression())
!69 = distinct !DIGlobalVariable(name: "wall_norm", scope: !15, file: !2, line: 710, type: !70, isLocal: false, isDefinition: true)
!70 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_vector", file: !23, line: 22, baseType: !71)
!71 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_vector", file: !23, line: 19, size: 96, flags: DIFlagTypePassByValue, elements: !72, identifier: "_ZTS10vms_vector")
!72 = !{!73, !74, !75}
!73 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !71, file: !23, line: 21, baseType: !28, size: 32)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !71, file: !23, line: 21, baseType: !28, size: 32, offset: 32)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !71, file: !23, line: 21, baseType: !28, size: 32, offset: 64)
!76 = !DIGlobalVariableExpression(var: !77, expr: !DIExpression())
!77 = distinct !DIGlobalVariable(name: "fvi_hit_seg2", scope: !15, file: !2, line: 711, type: !32, isLocal: false, isDefinition: true)
!78 = !DIGlobalVariableExpression(var: !79, expr: !DIExpression())
!79 = distinct !DIGlobalVariable(scope: null, file: !2, line: 861, type: !80, isLocal: true, isDefinition: true)
!80 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 280, elements: !81)
!81 = !{!82}
!82 = !DISubrange(count: 35)
!83 = !DIGlobalVariableExpression(var: !84, expr: !DIExpression())
!84 = distinct !DIGlobalVariable(scope: null, file: !2, line: 862, type: !85, isLocal: true, isDefinition: true)
!85 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 504, elements: !86)
!86 = !{!87}
!87 = !DISubrange(count: 63)
!88 = !DIGlobalVariableExpression(var: !89, expr: !DIExpression())
!89 = distinct !DIGlobalVariable(scope: null, file: !2, line: 923, type: !90, isLocal: true, isDefinition: true)
!90 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 368, elements: !91)
!91 = !{!92}
!92 = !DISubrange(count: 46)
!93 = !DIGlobalVariableExpression(var: !94, expr: !DIExpression())
!94 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1036, type: !95, isLocal: true, isDefinition: true)
!95 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 152, elements: !96)
!96 = !{!97}
!97 = !DISubrange(count: 19)
!98 = !DIGlobalVariableExpression(var: !99, expr: !DIExpression())
!99 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1156, type: !100, isLocal: true, isDefinition: true)
!100 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 184, elements: !101)
!101 = !{!102}
!102 = !DISubrange(count: 23)
!103 = !DIGlobalVariableExpression(var: !104, expr: !DIExpression())
!104 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1317, type: !105, isLocal: true, isDefinition: true)
!105 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 312, elements: !106)
!106 = !{!107}
!107 = !DISubrange(count: 39)
!108 = !DIGlobalVariableExpression(var: !109, expr: !DIExpression())
!109 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1323, type: !80, isLocal: true, isDefinition: true)
!110 = !DIGlobalVariableExpression(var: !111, expr: !DIExpression())
!111 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1458, type: !112, isLocal: true, isDefinition: true)
!112 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 328, elements: !113)
!113 = !{!114}
!114 = !DISubrange(count: 41)
!115 = !DIGlobalVariableExpression(var: !116, expr: !DIExpression(DW_OP_constu, 16, DW_OP_stack_value))
!116 = distinct !DIGlobalVariable(name: "FRACBITS", scope: !15, file: !29, line: 18, type: !117, isLocal: true, isDefinition: true)
!117 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !32)
!118 = !{!119, !126, !129, !130, !131, !135, !139, !142, !146, !149, !151, !153, !155, !157, !159, !161, !163, !165, !167, !169, !171, !173, !175, !177, !179, !185, !189, !192, !195, !200, !206, !208, !210, !212, !214, !216, !218, !220, !222, !224, !226, !228, !230, !232, !237, !242, !247, !252, !254, !257, !259, !261, !263, !265, !267, !269, !271, !273, !275, !279, !284, !288, !290, !294, !298, !311, !327, !328, !381, !390, !392, !400, !406, !410, !414, !416, !420, !424, !428, !432, !436, !440, !442, !444, !448, !454, !459, !463, !467, !471, !475, !479, !483, !487, !489, !491, !495, !497, !501, !505, !510, !512, !514, !516, !520, !524, !528, !530, !534, !536, !538, !540, !542, !548, !552, !554, !560, !565, !569, !573, !578, !583, !587, !591, !595, !599, !601, !603, !611, !613, !617, !621, !623, !625, !629, !633, !637, !639, !643, !648, !652, !656, !658, !660, !662, !664, !666, !668, !672, !676, !684, !686, !688, !690, !696, !698, !699, !700, !701, !704, !706, !711, !715, !717, !719, !723, !725, !727, !729, !731, !733, !735, !737, !741, !745, !747, !749, !750, !755, !757, !759, !761, !763, !765, !767, !769, !771, !773, !775, !777, !779, !781, !783, !785, !787, !791, !793, !795, !797, !801, !803, !807, !809, !811, !813, !815, !819, !821, !825, !829, !831, !833, !837, !839, !843, !845, !847, !851, !853, !855, !857, !859, !861, !863, !867, !869, !871, !873, !875, !877, !879, !881, !885, !889, !891, !893, !895, !897, !899, !901, !903, !905, !907, !909, !911, !913, !915, !917, !919, !921, !923, !925, !927, !931, !933, !935, !937, !941, !943, !947, !949, !951, !953, !955, !959, !961, !965, !967, !969, !971, !973, !977, !979, !981, !985, !987, !989, !991, !996, !1001, !1005, !1006, !1010, !1014, !1019, !1024, !1028, !1034, !1038, !1040, !1044, !1052, !1058, !1064, !1066, !1070, !1074, !1078, !1083, !1087, !1091, !1095, !1099, !1103, !1107, !1111, !1115, !1120, !1124, !1128, !1132, !1137, !1142, !1146, !1148, !1152, !1154, !1161, !1165, !1166, !1170, !1174, !1178, !1182, !1184, !1188, !1192, !1196, !1200, !1204, !1206, !1208, !1210, !1212, !1213, !1217, !1219, !1223, !1227, !1231, !1233, !1237, !1241, !1245, !1251, !1253, !1257, !1261, !1265, !1267, !1271, !1275, !1279, !1281, !1283, !1285, !1289, !1293, !1298, !1302, !1308, !1312, !1316, !1318, !1320, !1322, !1326, !1330, !1334, !1336, !1338, !1342, !1346, !1348, !1352, !1356, !1359, !1361, !1363}
!119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !122, file: !125, line: 158)
!120 = !DINamespace(name: "__1", scope: !121, exportSymbols: true)
!121 = !DINamespace(name: "std", scope: null)
!122 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !123, line: 30, baseType: !124)
!123 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int8_t.h", directory: "", checksumkind: CSK_MD5, checksum: "5052dfe782b50fed2355b8f61a9e4fa9")
!124 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!125 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdint", directory: "")
!126 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !127, file: !125, line: 159)
!127 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !128, line: 30, baseType: !55)
!128 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int16_t.h", directory: "", checksumkind: CSK_MD5, checksum: "47ed3c3ac6f65bfec021ca2b7be18e7e")
!129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !30, file: !125, line: 160)
!130 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !18, file: !125, line: 161)
!131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !132, file: !125, line: 163)
!132 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !133, line: 31, baseType: !134)
!133 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint8_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8b64ccf8c67b8c006b07b8daf1b49be5")
!134 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !136, file: !125, line: 164)
!136 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !137, line: 31, baseType: !138)
!137 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint16_t.h", directory: "", checksumkind: CSK_MD5, checksum: "f0aa926da906b10566dd3171bf347ab7")
!138 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !140, file: !125, line: 165)
!140 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !141, line: 31, baseType: !36)
!141 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint32_t.h", directory: "", checksumkind: CSK_MD5, checksum: "0254eb80c6b9719ac45c3c1cf872109b")
!142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !143, file: !125, line: 166)
!143 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !144, line: 31, baseType: !145)
!144 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint64_t.h", directory: "", checksumkind: CSK_MD5, checksum: "77fc5e91653260959605f129691cf9b1")
!145 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !147, file: !125, line: 168)
!147 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !148, line: 29, baseType: !122)
!148 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "042ceedaf4137a8aaa272d0b27434016")
!149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !150, file: !125, line: 169)
!150 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !148, line: 30, baseType: !127)
!151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !152, file: !125, line: 170)
!152 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !148, line: 31, baseType: !30)
!153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !154, file: !125, line: 171)
!154 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !148, line: 32, baseType: !18)
!155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !156, file: !125, line: 173)
!156 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !148, line: 33, baseType: !132)
!157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !158, file: !125, line: 174)
!158 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !148, line: 34, baseType: !136)
!159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !160, file: !125, line: 175)
!160 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !148, line: 35, baseType: !140)
!161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !162, file: !125, line: 176)
!162 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !148, line: 36, baseType: !143)
!163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !164, file: !125, line: 178)
!164 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !148, line: 40, baseType: !122)
!165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !166, file: !125, line: 179)
!166 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !148, line: 41, baseType: !127)
!167 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !168, file: !125, line: 180)
!168 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !148, line: 42, baseType: !30)
!169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !170, file: !125, line: 181)
!170 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !148, line: 43, baseType: !18)
!171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !172, file: !125, line: 183)
!172 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !148, line: 44, baseType: !132)
!173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !174, file: !125, line: 184)
!174 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !148, line: 45, baseType: !136)
!175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !176, file: !125, line: 185)
!176 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !148, line: 46, baseType: !140)
!177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !178, file: !125, line: 186)
!178 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !148, line: 47, baseType: !143)
!179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !180, file: !125, line: 188)
!180 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !181, line: 32, baseType: !182)
!181 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_intptr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e478ba47270923b1cca6659f19f02db1")
!182 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_intptr_t", file: !183, line: 40, baseType: !184)
!183 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/arm/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "b270144f57ae258d0ce80b8f87be068c")
!184 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !186, file: !125, line: 189)
!186 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !187, line: 34, baseType: !188)
!187 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_uintptr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e70ae655dd1b9d4ae0b1dcc073f5b7e4")
!188 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !190, file: !125, line: 191)
!190 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !191, line: 32, baseType: !184)
!191 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_intmax_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e37b9240f30f486478152ef3989b1545")
!192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !193, file: !125, line: 192)
!193 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !194, line: 32, baseType: !188)
!194 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uintmax_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8217a3fbb207d8e87ca5318c313e81c2")
!195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !196, file: !199, line: 22)
!196 = !DIDerivedType(tag: DW_TAG_typedef, name: "max_align_t", file: !197, line: 16, baseType: !198)
!197 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/lib/clang/20/include/__stddef_max_align_t.h", directory: "", checksumkind: CSK_MD5, checksum: "3c0a2f19d136d39aa835c737c7105def")
!198 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
!199 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__cstddef/max_align_t.h", directory: "")
!200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !201, file: !205, line: 113)
!201 = !DISubprogram(name: "isalnum", linkageName: "_Z7isalnumi", scope: !202, file: !202, line: 217, type: !203, flags: DIFlagPrototyped, spFlags: 0)
!202 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_ctype.h", directory: "", checksumkind: CSK_MD5, checksum: "b10215117a277691ffc4168ac4505796")
!203 = !DISubroutineType(types: !204)
!204 = !{!32, !32}
!205 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cctype", directory: "")
!206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !207, file: !205, line: 114)
!207 = !DISubprogram(name: "isalpha", linkageName: "_Z7isalphai", scope: !202, file: !202, line: 223, type: !203, flags: DIFlagPrototyped, spFlags: 0)
!208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !209, file: !205, line: 115)
!209 = !DISubprogram(name: "isblank", linkageName: "_Z7isblanki", scope: !202, file: !202, line: 229, type: !203, flags: DIFlagPrototyped, spFlags: 0)
!210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !211, file: !205, line: 116)
!211 = !DISubprogram(name: "iscntrl", linkageName: "_Z7iscntrli", scope: !202, file: !202, line: 235, type: !203, flags: DIFlagPrototyped, spFlags: 0)
!212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !213, file: !205, line: 117)
!213 = !DISubprogram(name: "isdigit", linkageName: "_Z7isdigiti", scope: !202, file: !202, line: 242, type: !203, flags: DIFlagPrototyped, spFlags: 0)
!214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !215, file: !205, line: 118)
!215 = !DISubprogram(name: "isgraph", linkageName: "_Z7isgraphi", scope: !202, file: !202, line: 248, type: !203, flags: DIFlagPrototyped, spFlags: 0)
!216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !217, file: !205, line: 119)
!217 = !DISubprogram(name: "islower", linkageName: "_Z7isloweri", scope: !202, file: !202, line: 254, type: !203, flags: DIFlagPrototyped, spFlags: 0)
!218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !219, file: !205, line: 120)
!219 = !DISubprogram(name: "isprint", linkageName: "_Z7isprinti", scope: !202, file: !202, line: 260, type: !203, flags: DIFlagPrototyped, spFlags: 0)
!220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !221, file: !205, line: 121)
!221 = !DISubprogram(name: "ispunct", linkageName: "_Z7ispuncti", scope: !202, file: !202, line: 266, type: !203, flags: DIFlagPrototyped, spFlags: 0)
!222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !223, file: !205, line: 122)
!223 = !DISubprogram(name: "isspace", linkageName: "_Z7isspacei", scope: !202, file: !202, line: 272, type: !203, flags: DIFlagPrototyped, spFlags: 0)
!224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !225, file: !205, line: 123)
!225 = !DISubprogram(name: "isupper", linkageName: "_Z7isupperi", scope: !202, file: !202, line: 278, type: !203, flags: DIFlagPrototyped, spFlags: 0)
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !227, file: !205, line: 124)
!227 = !DISubprogram(name: "isxdigit", linkageName: "_Z8isxdigiti", scope: !202, file: !202, line: 285, type: !203, flags: DIFlagPrototyped, spFlags: 0)
!228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !229, file: !205, line: 125)
!229 = !DISubprogram(name: "tolower", linkageName: "_Z7toloweri", scope: !202, file: !202, line: 297, type: !203, flags: DIFlagPrototyped, spFlags: 0)
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !231, file: !205, line: 126)
!231 = !DISubprogram(name: "toupper", linkageName: "_Z7toupperi", scope: !202, file: !202, line: 303, type: !203, flags: DIFlagPrototyped, spFlags: 0)
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !233, file: !236, line: 75)
!233 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !234, line: 32, baseType: !235)
!234 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_wint_t.h", directory: "", checksumkind: CSK_MD5, checksum: "6dfd3a3d5009054224653c03b2c2b6ac")
!235 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wint_t", file: !183, line: 111, baseType: !32)
!236 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cwctype", directory: "")
!237 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !238, file: !236, line: 76)
!238 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !239, line: 32, baseType: !240)
!239 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_wctrans_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e70040c8494301cc74e19df26f4c1d76")
!240 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wctrans_t", file: !241, line: 44, baseType: !32)
!241 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "c789da493a5b476a3618b20a8fcff3c3")
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !243, file: !236, line: 77)
!243 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !244, line: 32, baseType: !245)
!244 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_wctype_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8d1720b82a490c742e6a297f971be2a2")
!245 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wctype_t", file: !241, line: 46, baseType: !246)
!246 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !183, line: 36, baseType: !36)
!247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !248, file: !236, line: 78)
!248 = !DISubprogram(name: "iswalnum", linkageName: "_Z8iswalnumi", scope: !249, file: !249, line: 84, type: !250, flags: DIFlagPrototyped, spFlags: 0)
!249 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/___wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "d5a8bf0b4062c20bda4d49376e5b44d9")
!250 = !DISubroutineType(types: !251)
!251 = !{!32, !233}
!252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !253, file: !236, line: 79)
!253 = !DISubprogram(name: "iswalpha", linkageName: "_Z8iswalphai", scope: !249, file: !249, line: 90, type: !250, flags: DIFlagPrototyped, spFlags: 0)
!254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !255, file: !236, line: 80)
!255 = !DISubprogram(name: "iswblank", linkageName: "_Z8iswblanki", scope: !256, file: !256, line: 53, type: !250, flags: DIFlagPrototyped, spFlags: 0)
!256 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "6bc93063cb32b00d3df790305c546a93")
!257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !258, file: !236, line: 81)
!258 = !DISubprogram(name: "iswcntrl", linkageName: "_Z8iswcntrli", scope: !249, file: !249, line: 96, type: !250, flags: DIFlagPrototyped, spFlags: 0)
!259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !260, file: !236, line: 82)
!260 = !DISubprogram(name: "iswdigit", linkageName: "_Z8iswdigiti", scope: !249, file: !249, line: 108, type: !250, flags: DIFlagPrototyped, spFlags: 0)
!261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !262, file: !236, line: 83)
!262 = !DISubprogram(name: "iswgraph", linkageName: "_Z8iswgraphi", scope: !249, file: !249, line: 114, type: !250, flags: DIFlagPrototyped, spFlags: 0)
!263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !264, file: !236, line: 84)
!264 = !DISubprogram(name: "iswlower", linkageName: "_Z8iswloweri", scope: !249, file: !249, line: 120, type: !250, flags: DIFlagPrototyped, spFlags: 0)
!265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !266, file: !236, line: 85)
!266 = !DISubprogram(name: "iswprint", linkageName: "_Z8iswprinti", scope: !249, file: !249, line: 126, type: !250, flags: DIFlagPrototyped, spFlags: 0)
!267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !268, file: !236, line: 86)
!268 = !DISubprogram(name: "iswpunct", linkageName: "_Z8iswpuncti", scope: !249, file: !249, line: 132, type: !250, flags: DIFlagPrototyped, spFlags: 0)
!269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !270, file: !236, line: 87)
!270 = !DISubprogram(name: "iswspace", linkageName: "_Z8iswspacei", scope: !249, file: !249, line: 138, type: !250, flags: DIFlagPrototyped, spFlags: 0)
!271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !272, file: !236, line: 88)
!272 = !DISubprogram(name: "iswupper", linkageName: "_Z8iswupperi", scope: !249, file: !249, line: 144, type: !250, flags: DIFlagPrototyped, spFlags: 0)
!273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !274, file: !236, line: 89)
!274 = !DISubprogram(name: "iswxdigit", linkageName: "_Z9iswxdigiti", scope: !249, file: !249, line: 150, type: !250, flags: DIFlagPrototyped, spFlags: 0)
!275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !276, file: !236, line: 90)
!276 = !DISubprogram(name: "iswctype", linkageName: "_Z8iswctypeij", scope: !249, file: !249, line: 102, type: !277, flags: DIFlagPrototyped, spFlags: 0)
!277 = !DISubroutineType(types: !278)
!278 = !{!32, !233, !243}
!279 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !280, file: !236, line: 91)
!280 = !DISubprogram(name: "wctype", scope: !249, file: !249, line: 190, type: !281, flags: DIFlagPrototyped, spFlags: 0)
!281 = !DISubroutineType(types: !282)
!282 = !{!243, !283}
!283 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !285, file: !236, line: 92)
!285 = !DISubprogram(name: "towlower", linkageName: "_Z8towloweri", scope: !249, file: !249, line: 156, type: !286, flags: DIFlagPrototyped, spFlags: 0)
!286 = !DISubroutineType(types: !287)
!287 = !{!233, !233}
!288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !289, file: !236, line: 93)
!289 = !DISubprogram(name: "towupper", linkageName: "_Z8towupperi", scope: !249, file: !249, line: 162, type: !286, flags: DIFlagPrototyped, spFlags: 0)
!290 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !291, file: !236, line: 94)
!291 = !DISubprogram(name: "towctrans", scope: !256, file: !256, line: 124, type: !292, flags: DIFlagPrototyped, spFlags: 0)
!292 = !DISubroutineType(types: !293)
!293 = !{!233, !233, !238}
!294 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !295, file: !236, line: 95)
!295 = !DISubprogram(name: "wctrans", scope: !256, file: !256, line: 126, type: !296, flags: DIFlagPrototyped, spFlags: 0)
!296 = !DISubroutineType(types: !297)
!297 = !{!238, !283}
!298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !299, file: !310, line: 133)
!299 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !300, line: 32, baseType: !301)
!300 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8f920c8f4b68eb07504db5a6777c5466")
!301 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_mbstate_t", file: !183, line: 72, baseType: !302)
!302 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !183, line: 70, baseType: !303)
!303 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !183, line: 67, size: 1024, flags: DIFlagTypePassByValue, elements: !304, identifier: "_ZTS11__mbstate_t")
!304 = !{!305, !309}
!305 = !DIDerivedType(tag: DW_TAG_member, name: "__mbstate8", scope: !303, file: !183, line: 68, baseType: !306, size: 1024)
!306 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1024, elements: !307)
!307 = !{!308}
!308 = !DISubrange(count: 128)
!309 = !DIDerivedType(tag: DW_TAG_member, name: "_mbstateL", scope: !303, file: !183, line: 69, baseType: !20, size: 64)
!310 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cwchar", directory: "")
!311 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !312, file: !310, line: 134)
!312 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !313, line: 78, size: 448, flags: DIFlagTypePassByValue, elements: !314, identifier: "_ZTS2tm")
!313 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_time.h", directory: "", checksumkind: CSK_MD5, checksum: "e65eafd533c28a52a9094e430476b03e")
!314 = !{!315, !316, !317, !318, !319, !320, !321, !322, !323, !324, !325}
!315 = !DIDerivedType(tag: DW_TAG_member, name: "tm_sec", scope: !312, file: !313, line: 79, baseType: !32, size: 32)
!316 = !DIDerivedType(tag: DW_TAG_member, name: "tm_min", scope: !312, file: !313, line: 80, baseType: !32, size: 32, offset: 32)
!317 = !DIDerivedType(tag: DW_TAG_member, name: "tm_hour", scope: !312, file: !313, line: 81, baseType: !32, size: 32, offset: 64)
!318 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mday", scope: !312, file: !313, line: 82, baseType: !32, size: 32, offset: 96)
!319 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mon", scope: !312, file: !313, line: 83, baseType: !32, size: 32, offset: 128)
!320 = !DIDerivedType(tag: DW_TAG_member, name: "tm_year", scope: !312, file: !313, line: 84, baseType: !32, size: 32, offset: 160)
!321 = !DIDerivedType(tag: DW_TAG_member, name: "tm_wday", scope: !312, file: !313, line: 85, baseType: !32, size: 32, offset: 192)
!322 = !DIDerivedType(tag: DW_TAG_member, name: "tm_yday", scope: !312, file: !313, line: 86, baseType: !32, size: 32, offset: 224)
!323 = !DIDerivedType(tag: DW_TAG_member, name: "tm_isdst", scope: !312, file: !313, line: 87, baseType: !32, size: 32, offset: 256)
!324 = !DIDerivedType(tag: DW_TAG_member, name: "tm_gmtoff", scope: !312, file: !313, line: 88, baseType: !184, size: 64, offset: 320)
!325 = !DIDerivedType(tag: DW_TAG_member, name: "tm_zone", scope: !312, file: !313, line: 89, baseType: !326, size: 64, offset: 384)
!326 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!327 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !233, file: !310, line: 135)
!328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !329, file: !310, line: 136)
!329 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !330, line: 162, baseType: !331)
!330 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "d91ebd7d161d9196cc100822ef0e5cdf")
!331 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILE", file: !330, line: 131, size: 1216, flags: DIFlagTypePassByValue, elements: !332, identifier: "_ZTS7__sFILE")
!332 = !{!333, !335, !336, !337, !338, !339, !344, !345, !347, !351, !355, !363, !367, !368, !371, !372, !374, !378, !379, !380}
!333 = !DIDerivedType(tag: DW_TAG_member, name: "_p", scope: !331, file: !330, line: 132, baseType: !334, size: 64)
!334 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !134, size: 64)
!335 = !DIDerivedType(tag: DW_TAG_member, name: "_r", scope: !331, file: !330, line: 133, baseType: !32, size: 32, offset: 64)
!336 = !DIDerivedType(tag: DW_TAG_member, name: "_w", scope: !331, file: !330, line: 134, baseType: !32, size: 32, offset: 96)
!337 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !331, file: !330, line: 135, baseType: !55, size: 16, offset: 128)
!338 = !DIDerivedType(tag: DW_TAG_member, name: "_file", scope: !331, file: !330, line: 136, baseType: !55, size: 16, offset: 144)
!339 = !DIDerivedType(tag: DW_TAG_member, name: "_bf", scope: !331, file: !330, line: 137, baseType: !340, size: 128, offset: 192)
!340 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sbuf", file: !330, line: 97, size: 128, flags: DIFlagTypePassByValue, elements: !341, identifier: "_ZTS6__sbuf")
!341 = !{!342, !343}
!342 = !DIDerivedType(tag: DW_TAG_member, name: "_base", scope: !340, file: !330, line: 98, baseType: !334, size: 64)
!343 = !DIDerivedType(tag: DW_TAG_member, name: "_size", scope: !340, file: !330, line: 99, baseType: !32, size: 32, offset: 64)
!344 = !DIDerivedType(tag: DW_TAG_member, name: "_lbfsize", scope: !331, file: !330, line: 138, baseType: !32, size: 32, offset: 320)
!345 = !DIDerivedType(tag: DW_TAG_member, name: "_cookie", scope: !331, file: !330, line: 141, baseType: !346, size: 64, offset: 384)
!346 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!347 = !DIDerivedType(tag: DW_TAG_member, name: "_close", scope: !331, file: !330, line: 142, baseType: !348, size: 64, offset: 448)
!348 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !349, size: 64)
!349 = !DISubroutineType(types: !350)
!350 = !{!32, !346}
!351 = !DIDerivedType(tag: DW_TAG_member, name: "_read", scope: !331, file: !330, line: 143, baseType: !352, size: 64, offset: 512)
!352 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !353, size: 64)
!353 = !DISubroutineType(types: !354)
!354 = !{!32, !346, !326, !32}
!355 = !DIDerivedType(tag: DW_TAG_member, name: "_seek", scope: !331, file: !330, line: 144, baseType: !356, size: 64, offset: 576)
!356 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !357, size: 64)
!357 = !DISubroutineType(types: !358)
!358 = !{!359, !346, !359, !32}
!359 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !330, line: 86, baseType: !360)
!360 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_off_t", file: !361, line: 83, baseType: !362)
!361 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "af82ff6119a9fa80fad635d276556d46")
!362 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !183, line: 37, baseType: !20)
!363 = !DIDerivedType(tag: DW_TAG_member, name: "_write", scope: !331, file: !330, line: 145, baseType: !364, size: 64, offset: 640)
!364 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !365, size: 64)
!365 = !DISubroutineType(types: !366)
!366 = !{!32, !346, !283, !32}
!367 = !DIDerivedType(tag: DW_TAG_member, name: "_ub", scope: !331, file: !330, line: 148, baseType: !340, size: 128, offset: 704)
!368 = !DIDerivedType(tag: DW_TAG_member, name: "_extra", scope: !331, file: !330, line: 149, baseType: !369, size: 64, offset: 832)
!369 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !370, size: 64)
!370 = !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILEX", file: !330, line: 103, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS8__sFILEX")
!371 = !DIDerivedType(tag: DW_TAG_member, name: "_ur", scope: !331, file: !330, line: 150, baseType: !32, size: 32, offset: 896)
!372 = !DIDerivedType(tag: DW_TAG_member, name: "_ubuf", scope: !331, file: !330, line: 153, baseType: !373, size: 24, offset: 928)
!373 = !DICompositeType(tag: DW_TAG_array_type, baseType: !134, size: 24, elements: !33)
!374 = !DIDerivedType(tag: DW_TAG_member, name: "_nbuf", scope: !331, file: !330, line: 154, baseType: !375, size: 8, offset: 952)
!375 = !DICompositeType(tag: DW_TAG_array_type, baseType: !134, size: 8, elements: !376)
!376 = !{!377}
!377 = !DISubrange(count: 1)
!378 = !DIDerivedType(tag: DW_TAG_member, name: "_lb", scope: !331, file: !330, line: 157, baseType: !340, size: 128, offset: 960)
!379 = !DIDerivedType(tag: DW_TAG_member, name: "_blksize", scope: !331, file: !330, line: 160, baseType: !32, size: 32, offset: 1088)
!380 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !331, file: !330, line: 161, baseType: !359, size: 64, offset: 1152)
!381 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !382, file: !310, line: 137)
!382 = !DISubprogram(name: "fwprintf", scope: !383, file: !383, line: 107, type: !384, flags: DIFlagPrototyped, spFlags: 0)
!383 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "c0db33314388059ce7a1663adf1bfda0")
!384 = !DISubroutineType(types: !385)
!385 = !{!32, !386, !387, null}
!386 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !329, size: 64)
!387 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !388, size: 64)
!388 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !389)
!389 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !391, file: !310, line: 138)
!391 = !DISubprogram(name: "fwscanf", scope: !383, file: !383, line: 108, type: !384, flags: DIFlagPrototyped, spFlags: 0)
!392 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !393, file: !310, line: 139)
!393 = !DISubprogram(name: "swprintf", scope: !383, file: !383, line: 120, type: !394, flags: DIFlagPrototyped, spFlags: 0)
!394 = !DISubroutineType(types: !395)
!395 = !{!32, !396, !397, !387, null}
!396 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !389, size: 64)
!397 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !398, line: 50, baseType: !399)
!398 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "f7981334d28e0c246f35cd24042aa2a4")
!399 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !183, line: 87, baseType: !188)
!400 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !401, file: !310, line: 140)
!401 = !DISubprogram(name: "vfwprintf", scope: !383, file: !383, line: 124, type: !402, flags: DIFlagPrototyped, spFlags: 0)
!402 = !DISubroutineType(types: !403)
!403 = !{!32, !386, !387, !404}
!404 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_va_list", file: !183, line: 95, baseType: !405)
!405 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !2, baseType: !326)
!406 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !407, file: !310, line: 141)
!407 = !DISubprogram(name: "vswprintf", scope: !383, file: !383, line: 126, type: !408, flags: DIFlagPrototyped, spFlags: 0)
!408 = !DISubroutineType(types: !409)
!409 = !{!32, !396, !397, !387, !404}
!410 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !411, file: !310, line: 142)
!411 = !DISubprogram(name: "swscanf", scope: !383, file: !383, line: 122, type: !412, flags: DIFlagPrototyped, spFlags: 0)
!412 = !DISubroutineType(types: !413)
!413 = !{!32, !387, !387, null}
!414 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !415, file: !310, line: 143)
!415 = !DISubprogram(name: "vfwscanf", scope: !383, file: !383, line: 195, type: !402, flags: DIFlagPrototyped, spFlags: 0)
!416 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !417, file: !310, line: 144)
!417 = !DISubprogram(name: "vswscanf", scope: !383, file: !383, line: 197, type: !418, flags: DIFlagPrototyped, spFlags: 0)
!418 = !DISubroutineType(types: !419)
!419 = !{!32, !387, !387, !404}
!420 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !421, file: !310, line: 145)
!421 = !DISubprogram(name: "fgetwc", scope: !383, file: !383, line: 100, type: !422, flags: DIFlagPrototyped, spFlags: 0)
!422 = !DISubroutineType(types: !423)
!423 = !{!233, !386}
!424 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !425, file: !310, line: 146)
!425 = !DISubprogram(name: "fgetws", scope: !383, file: !383, line: 102, type: !426, flags: DIFlagPrototyped, spFlags: 0)
!426 = !DISubroutineType(types: !427)
!427 = !{!396, !396, !32, !386}
!428 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !429, file: !310, line: 147)
!429 = !DISubprogram(name: "fputwc", scope: !383, file: !383, line: 104, type: !430, flags: DIFlagPrototyped, spFlags: 0)
!430 = !DISubroutineType(types: !431)
!431 = !{!233, !389, !386}
!432 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !433, file: !310, line: 148)
!433 = !DISubprogram(name: "fputws", scope: !383, file: !383, line: 105, type: !434, flags: DIFlagPrototyped, spFlags: 0)
!434 = !DISubroutineType(types: !435)
!435 = !{!32, !387, !386}
!436 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !437, file: !310, line: 149)
!437 = !DISubprogram(name: "fwide", scope: !383, file: !383, line: 106, type: !438, flags: DIFlagPrototyped, spFlags: 0)
!438 = !DISubroutineType(types: !439)
!439 = !{!32, !386, !32}
!440 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !441, file: !310, line: 150)
!441 = !DISubprogram(name: "getwc", scope: !383, file: !383, line: 109, type: !422, flags: DIFlagPrototyped, spFlags: 0)
!442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !443, file: !310, line: 151)
!443 = !DISubprogram(name: "putwc", scope: !383, file: !383, line: 118, type: !430, flags: DIFlagPrototyped, spFlags: 0)
!444 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !445, file: !310, line: 152)
!445 = !DISubprogram(name: "ungetwc", scope: !383, file: !383, line: 123, type: !446, flags: DIFlagPrototyped, spFlags: 0)
!446 = !DISubroutineType(types: !447)
!447 = !{!233, !233, !386}
!448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !449, file: !310, line: 153)
!449 = !DISubprogram(name: "wcstod", scope: !383, file: !383, line: 160, type: !450, flags: DIFlagPrototyped, spFlags: 0)
!450 = !DISubroutineType(types: !451)
!451 = !{!452, !387, !453}
!452 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!453 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !396, size: 64)
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !455, file: !310, line: 154)
!455 = !DISubprogram(name: "wcstof", scope: !383, file: !383, line: 200, type: !456, flags: DIFlagPrototyped, spFlags: 0)
!456 = !DISubroutineType(types: !457)
!457 = !{!458, !387, !453}
!458 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !460, file: !310, line: 155)
!460 = !DISubprogram(name: "wcstold", scope: !383, file: !383, line: 202, type: !461, flags: DIFlagPrototyped, spFlags: 0)
!461 = !DISubroutineType(types: !462)
!462 = !{!198, !387, !453}
!463 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !464, file: !310, line: 156)
!464 = !DISubprogram(name: "wcstol", scope: !383, file: !383, line: 164, type: !465, flags: DIFlagPrototyped, spFlags: 0)
!465 = !DISubroutineType(types: !466)
!466 = !{!184, !387, !453, !32}
!467 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !468, file: !310, line: 157)
!468 = !DISubprogram(name: "wcstoll", scope: !383, file: !383, line: 205, type: !469, flags: DIFlagPrototyped, spFlags: 0)
!469 = !DISubroutineType(types: !470)
!470 = !{!20, !387, !453, !32}
!471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !472, file: !310, line: 158)
!472 = !DISubprogram(name: "wcstoul", scope: !383, file: !383, line: 167, type: !473, flags: DIFlagPrototyped, spFlags: 0)
!473 = !DISubroutineType(types: !474)
!474 = !{!188, !387, !453, !32}
!475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !476, file: !310, line: 159)
!476 = !DISubprogram(name: "wcstoull", scope: !383, file: !383, line: 207, type: !477, flags: DIFlagPrototyped, spFlags: 0)
!477 = !DISubroutineType(types: !478)
!478 = !{!145, !387, !453, !32}
!479 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !480, file: !310, line: 160)
!480 = !DISubprogram(name: "wcscpy", scope: !383, file: !383, line: 134, type: !481, flags: DIFlagPrototyped, spFlags: 0)
!481 = !DISubroutineType(types: !482)
!482 = !{!396, !396, !387}
!483 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !484, file: !310, line: 161)
!484 = !DISubprogram(name: "wcsncpy", scope: !383, file: !383, line: 148, type: !485, flags: DIFlagPrototyped, spFlags: 0)
!485 = !DISubroutineType(types: !486)
!486 = !{!396, !396, !387, !397}
!487 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !488, file: !310, line: 162)
!488 = !DISubprogram(name: "wcscat", scope: !383, file: !383, line: 130, type: !481, flags: DIFlagPrototyped, spFlags: 0)
!489 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !490, file: !310, line: 163)
!490 = !DISubprogram(name: "wcsncat", scope: !383, file: !383, line: 142, type: !485, flags: DIFlagPrototyped, spFlags: 0)
!491 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !492, file: !310, line: 164)
!492 = !DISubprogram(name: "wcscmp", scope: !383, file: !383, line: 132, type: !493, flags: DIFlagPrototyped, spFlags: 0)
!493 = !DISubroutineType(types: !494)
!494 = !{!32, !387, !387}
!495 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !496, file: !310, line: 165)
!496 = !DISubprogram(name: "wcscoll", scope: !383, file: !383, line: 133, type: !493, flags: DIFlagPrototyped, spFlags: 0)
!497 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !498, file: !310, line: 166)
!498 = !DISubprogram(name: "wcsncmp", scope: !383, file: !383, line: 145, type: !499, flags: DIFlagPrototyped, spFlags: 0)
!499 = !DISubroutineType(types: !500)
!500 = !{!32, !387, !387, !397}
!501 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !502, file: !310, line: 167)
!502 = !DISubprogram(name: "wcsxfrm", scope: !383, file: !383, line: 157, type: !503, flags: DIFlagPrototyped, spFlags: 0)
!503 = !DISubroutineType(types: !504)
!504 = !{!397, !396, !387, !397}
!505 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !506, file: !310, line: 168)
!506 = !DISubprogram(name: "wcschr", linkageName: "_Z6wcschrB8ne200100Ua9enable_ifILb1EEPww", scope: !507, file: !507, line: 147, type: !508, flags: DIFlagPrototyped, spFlags: 0)
!507 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/wchar.h", directory: "")
!508 = !DISubroutineType(types: !509)
!509 = !{!396, !396, !389}
!510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !511, file: !310, line: 169)
!511 = !DISubprogram(name: "wcspbrk", linkageName: "_Z7wcspbrkB8ne200100Ua9enable_ifILb1EEPwPKw", scope: !507, file: !507, line: 158, type: !481, flags: DIFlagPrototyped, spFlags: 0)
!512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !513, file: !310, line: 170)
!513 = !DISubprogram(name: "wcsrchr", linkageName: "_Z7wcsrchrB8ne200100Ua9enable_ifILb1EEPww", scope: !507, file: !507, line: 168, type: !508, flags: DIFlagPrototyped, spFlags: 0)
!514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !515, file: !310, line: 171)
!515 = !DISubprogram(name: "wcsstr", linkageName: "_Z6wcsstrB8ne200100Ua9enable_ifILb1EEPwPKw", scope: !507, file: !507, line: 179, type: !481, flags: DIFlagPrototyped, spFlags: 0)
!516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !517, file: !310, line: 172)
!517 = !DISubprogram(name: "wmemchr", linkageName: "_Z7wmemchrB8ne200100Ua9enable_ifILb1EEPwwm", scope: !507, file: !507, line: 190, type: !518, flags: DIFlagPrototyped, spFlags: 0)
!518 = !DISubroutineType(types: !519)
!519 = !{!396, !396, !389, !397}
!520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !521, file: !310, line: 173)
!521 = !DISubprogram(name: "wcscspn", scope: !383, file: !383, line: 136, type: !522, flags: DIFlagPrototyped, spFlags: 0)
!522 = !DISubroutineType(types: !523)
!523 = !{!397, !387, !387}
!524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !525, file: !310, line: 174)
!525 = !DISubprogram(name: "wcslen", scope: !383, file: !383, line: 140, type: !526, flags: DIFlagPrototyped, spFlags: 0)
!526 = !DISubroutineType(types: !527)
!527 = !{!397, !387}
!528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !529, file: !310, line: 175)
!529 = !DISubprogram(name: "wcsspn", scope: !383, file: !383, line: 155, type: !522, flags: DIFlagPrototyped, spFlags: 0)
!530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !531, file: !310, line: 176)
!531 = !DISubprogram(name: "wcstok", scope: !383, file: !383, line: 162, type: !532, flags: DIFlagPrototyped, spFlags: 0)
!532 = !DISubroutineType(types: !533)
!533 = !{!396, !396, !387, !453}
!534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !535, file: !310, line: 177)
!535 = !DISubprogram(name: "wmemcmp", scope: !383, file: !383, line: 170, type: !499, flags: DIFlagPrototyped, spFlags: 0)
!536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !537, file: !310, line: 178)
!537 = !DISubprogram(name: "wmemcpy", scope: !383, file: !383, line: 173, type: !485, flags: DIFlagPrototyped, spFlags: 0)
!538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !539, file: !310, line: 179)
!539 = !DISubprogram(name: "wmemmove", scope: !383, file: !383, line: 176, type: !485, flags: DIFlagPrototyped, spFlags: 0)
!540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !541, file: !310, line: 180)
!541 = !DISubprogram(name: "wmemset", scope: !383, file: !383, line: 179, type: !518, flags: DIFlagPrototyped, spFlags: 0)
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !543, file: !310, line: 181)
!543 = !DISubprogram(name: "wcsftime", linkageName: "\01_wcsftime", scope: !383, file: !383, line: 137, type: !544, flags: DIFlagPrototyped, spFlags: 0)
!544 = !DISubroutineType(types: !545)
!545 = !{!397, !396, !397, !387, !546}
!546 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !547, size: 64)
!547 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !312)
!548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !549, file: !310, line: 182)
!549 = !DISubprogram(name: "btowc", scope: !383, file: !383, line: 99, type: !550, flags: DIFlagPrototyped, spFlags: 0)
!550 = !DISubroutineType(types: !551)
!551 = !{!233, !32}
!552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !553, file: !310, line: 183)
!553 = !DISubprogram(name: "wctob", scope: !383, file: !383, line: 159, type: !250, flags: DIFlagPrototyped, spFlags: 0)
!554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !555, file: !310, line: 184)
!555 = !DISubprogram(name: "mbsinit", scope: !383, file: !383, line: 115, type: !556, flags: DIFlagPrototyped, spFlags: 0)
!556 = !DISubroutineType(types: !557)
!557 = !{!32, !558}
!558 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !559, size: 64)
!559 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !299)
!560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !561, file: !310, line: 185)
!561 = !DISubprogram(name: "mbrlen", scope: !383, file: !383, line: 111, type: !562, flags: DIFlagPrototyped, spFlags: 0)
!562 = !DISubroutineType(types: !563)
!563 = !{!397, !283, !397, !564}
!564 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !299, size: 64)
!565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !566, file: !310, line: 186)
!566 = !DISubprogram(name: "mbrtowc", scope: !383, file: !383, line: 113, type: !567, flags: DIFlagPrototyped, spFlags: 0)
!567 = !DISubroutineType(types: !568)
!568 = !{!397, !396, !283, !397, !564}
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !570, file: !310, line: 187)
!570 = !DISubprogram(name: "wcrtomb", scope: !383, file: !383, line: 129, type: !571, flags: DIFlagPrototyped, spFlags: 0)
!571 = !DISubroutineType(types: !572)
!572 = !{!397, !326, !389, !564}
!573 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !574, file: !310, line: 188)
!574 = !DISubprogram(name: "mbsrtowcs", scope: !383, file: !383, line: 116, type: !575, flags: DIFlagPrototyped, spFlags: 0)
!575 = !DISubroutineType(types: !576)
!576 = !{!397, !396, !577, !397, !564}
!577 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !283, size: 64)
!578 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !579, file: !310, line: 189)
!579 = !DISubprogram(name: "wcsrtombs", scope: !383, file: !383, line: 153, type: !580, flags: DIFlagPrototyped, spFlags: 0)
!580 = !DISubroutineType(types: !581)
!581 = !{!397, !326, !582, !397, !564}
!582 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !387, size: 64)
!583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !584, file: !310, line: 191)
!584 = !DISubprogram(name: "getwchar", scope: !383, file: !383, line: 110, type: !585, flags: DIFlagPrototyped, spFlags: 0)
!585 = !DISubroutineType(types: !586)
!586 = !{!233}
!587 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !588, file: !310, line: 192)
!588 = !DISubprogram(name: "vwscanf", scope: !383, file: !383, line: 199, type: !589, flags: DIFlagPrototyped, spFlags: 0)
!589 = !DISubroutineType(types: !590)
!590 = !{!32, !387, !404}
!591 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !592, file: !310, line: 193)
!592 = !DISubprogram(name: "wscanf", scope: !383, file: !383, line: 181, type: !593, flags: DIFlagPrototyped, spFlags: 0)
!593 = !DISubroutineType(types: !594)
!594 = !{!32, !387, null}
!595 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !596, file: !310, line: 195)
!596 = !DISubprogram(name: "putwchar", scope: !383, file: !383, line: 119, type: !597, flags: DIFlagPrototyped, spFlags: 0)
!597 = !DISubroutineType(types: !598)
!598 = !{!233, !389}
!599 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !600, file: !310, line: 196)
!600 = !DISubprogram(name: "vwprintf", scope: !383, file: !383, line: 128, type: !589, flags: DIFlagPrototyped, spFlags: 0)
!601 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !602, file: !310, line: 197)
!602 = !DISubprogram(name: "wprintf", scope: !383, file: !383, line: 180, type: !593, flags: DIFlagPrototyped, spFlags: 0)
!603 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !604, file: !610, line: 82)
!604 = !DISubprogram(name: "memcpy", scope: !605, file: !605, line: 78, type: !606, flags: DIFlagPrototyped, spFlags: 0)
!605 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_string.h", directory: "", checksumkind: CSK_MD5, checksum: "c67be38c725261ca8572072ee1574b87")
!606 = !DISubroutineType(types: !607)
!607 = !{!346, !346, !608, !397}
!608 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !609, size: 64)
!609 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!610 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstring", directory: "")
!611 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !612, file: !610, line: 83)
!612 = !DISubprogram(name: "memmove", scope: !605, file: !605, line: 81, type: !606, flags: DIFlagPrototyped, spFlags: 0)
!613 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !614, file: !610, line: 84)
!614 = !DISubprogram(name: "strcpy", scope: !605, file: !605, line: 92, type: !615, flags: DIFlagPrototyped, spFlags: 0)
!615 = !DISubroutineType(types: !616)
!616 = !{!326, !326, !283}
!617 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !618, file: !610, line: 85)
!618 = !DISubprogram(name: "strncpy", scope: !605, file: !605, line: 104, type: !619, flags: DIFlagPrototyped, spFlags: 0)
!619 = !DISubroutineType(types: !620)
!620 = !{!326, !326, !283, !397}
!621 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !622, file: !610, line: 86)
!622 = !DISubprogram(name: "strcat", scope: !605, file: !605, line: 86, type: !615, flags: DIFlagPrototyped, spFlags: 0)
!623 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !624, file: !610, line: 87)
!624 = !DISubprogram(name: "strncat", scope: !605, file: !605, line: 98, type: !619, flags: DIFlagPrototyped, spFlags: 0)
!625 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !626, file: !610, line: 88)
!626 = !DISubprogram(name: "memcmp", scope: !605, file: !605, line: 75, type: !627, flags: DIFlagPrototyped, spFlags: 0)
!627 = !DISubroutineType(types: !628)
!628 = !{!32, !608, !608, !397}
!629 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !630, file: !610, line: 89)
!630 = !DISubprogram(name: "strcmp", scope: !605, file: !605, line: 89, type: !631, flags: DIFlagPrototyped, spFlags: 0)
!631 = !DISubroutineType(types: !632)
!632 = !{!32, !283, !283}
!633 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !634, file: !610, line: 90)
!634 = !DISubprogram(name: "strncmp", scope: !605, file: !605, line: 101, type: !635, flags: DIFlagPrototyped, spFlags: 0)
!635 = !DISubroutineType(types: !636)
!636 = !{!32, !283, !283, !397}
!637 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !638, file: !610, line: 91)
!638 = !DISubprogram(name: "strcoll", scope: !605, file: !605, line: 90, type: !631, flags: DIFlagPrototyped, spFlags: 0)
!639 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !640, file: !610, line: 92)
!640 = !DISubprogram(name: "strxfrm", scope: !605, file: !605, line: 112, type: !641, flags: DIFlagPrototyped, spFlags: 0)
!641 = !DISubroutineType(types: !642)
!642 = !{!397, !326, !283, !397}
!643 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !644, file: !610, line: 93)
!644 = !DISubprogram(name: "memchr", linkageName: "_Z6memchrB8ne200100Ua9enable_ifILb1EEPvim", scope: !645, file: !645, line: 101, type: !646, flags: DIFlagPrototyped, spFlags: 0)
!645 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/string.h", directory: "")
!646 = !DISubroutineType(types: !647)
!647 = !{!346, !346, !32, !397}
!648 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !649, file: !610, line: 94)
!649 = !DISubprogram(name: "strchr", linkageName: "_Z6strchrB8ne200100Ua9enable_ifILb1EEPci", scope: !645, file: !645, line: 80, type: !650, flags: DIFlagPrototyped, spFlags: 0)
!650 = !DISubroutineType(types: !651)
!651 = !{!326, !326, !32}
!652 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !653, file: !610, line: 95)
!653 = !DISubprogram(name: "strcspn", scope: !605, file: !605, line: 94, type: !654, flags: DIFlagPrototyped, spFlags: 0)
!654 = !DISubroutineType(types: !655)
!655 = !{!397, !283, !283}
!656 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !657, file: !610, line: 96)
!657 = !DISubprogram(name: "strpbrk", linkageName: "_Z7strpbrkB8ne200100Ua9enable_ifILb1EEPcPKc", scope: !645, file: !645, line: 87, type: !615, flags: DIFlagPrototyped, spFlags: 0)
!658 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !659, file: !610, line: 97)
!659 = !DISubprogram(name: "strrchr", linkageName: "_Z7strrchrB8ne200100Ua9enable_ifILb1EEPci", scope: !645, file: !645, line: 94, type: !650, flags: DIFlagPrototyped, spFlags: 0)
!660 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !661, file: !610, line: 98)
!661 = !DISubprogram(name: "strspn", scope: !605, file: !605, line: 109, type: !654, flags: DIFlagPrototyped, spFlags: 0)
!662 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !663, file: !610, line: 99)
!663 = !DISubprogram(name: "strstr", linkageName: "_Z6strstrB8ne200100Ua9enable_ifILb1EEPcPKc", scope: !645, file: !645, line: 108, type: !615, flags: DIFlagPrototyped, spFlags: 0)
!664 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !665, file: !610, line: 100)
!665 = !DISubprogram(name: "strtok", scope: !605, file: !605, line: 111, type: !615, flags: DIFlagPrototyped, spFlags: 0)
!666 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !667, file: !610, line: 101)
!667 = !DISubprogram(name: "memset", scope: !605, file: !605, line: 84, type: !646, flags: DIFlagPrototyped, spFlags: 0)
!668 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !669, file: !610, line: 102)
!669 = !DISubprogram(name: "strerror", linkageName: "\01_strerror", scope: !605, file: !605, line: 95, type: !670, flags: DIFlagPrototyped, spFlags: 0)
!670 = !DISubroutineType(types: !671)
!671 = !{!326, !32}
!672 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !673, file: !610, line: 103)
!673 = !DISubprogram(name: "strlen", scope: !605, file: !605, line: 96, type: !674, flags: DIFlagPrototyped, spFlags: 0)
!674 = !DISubroutineType(types: !675)
!675 = !{!397, !283}
!676 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !677, file: !683, line: 422)
!677 = !DISubprogram(name: "isfinite", linkageName: "_ZNSt3__16__math8isfiniteB8ne200100Ee", scope: !679, file: !678, line: 79, type: !680, flags: DIFlagPrototyped, spFlags: 0)
!678 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__math/traits.h", directory: "")
!679 = !DINamespace(name: "__math", scope: !120)
!680 = !DISubroutineType(types: !681)
!681 = !{!682, !198}
!682 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!683 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/math.h", directory: "")
!684 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !685, file: !683, line: 425)
!685 = !DISubprogram(name: "isinf", linkageName: "_ZNSt3__16__math5isinfB8ne200100Ee", scope: !679, file: !678, line: 103, type: !680, flags: DIFlagPrototyped, spFlags: 0)
!686 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !687, file: !683, line: 429)
!687 = !DISubprogram(name: "isnan", linkageName: "_ZNSt3__16__math5isnanB8ne200100Ee", scope: !679, file: !678, line: 127, type: !680, flags: DIFlagPrototyped, spFlags: 0)
!688 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !689, file: !683, line: 430)
!689 = !DISubprogram(name: "isnormal", linkageName: "_ZNSt3__16__math8isnormalB8ne200100Ee", scope: !679, file: !678, line: 146, type: !680, flags: DIFlagPrototyped, spFlags: 0)
!690 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !691, file: !683, line: 485)
!691 = !DISubprogram(name: "modf", linkageName: "_ZNSt3__16__math4modfB8ne200100EePe", scope: !679, file: !692, line: 55, type: !693, flags: DIFlagPrototyped, spFlags: 0)
!692 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__math/modulo.h", directory: "")
!693 = !DISubroutineType(types: !694)
!694 = !{!198, !198, !695}
!695 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !198, size: 64)
!696 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !677, file: !697, line: 352)
!697 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cmath", directory: "")
!698 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !685, file: !697, line: 353)
!699 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !687, file: !697, line: 354)
!700 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !689, file: !697, line: 355)
!701 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !702, file: !697, line: 364)
!702 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !703, line: 50, baseType: !458)
!703 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/math.h", directory: "", checksumkind: CSK_MD5, checksum: "35b1ff63542c2c0c144330dd9277d2dc")
!704 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !705, file: !697, line: 365)
!705 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !703, line: 51, baseType: !452)
!706 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !707, file: !697, line: 367)
!707 = !DISubprogram(name: "abs", linkageName: "_Z3absB8ne200100e", scope: !708, file: !708, line: 123, type: !709, flags: DIFlagPrototyped, spFlags: 0)
!708 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/stdlib.h", directory: "")
!709 = !DISubroutineType(types: !710)
!710 = !{!198, !198}
!711 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !712, file: !697, line: 370)
!712 = !DISubprogram(name: "acosf", scope: !703, file: !703, line: 314, type: !713, flags: DIFlagPrototyped, spFlags: 0)
!713 = !DISubroutineType(types: !714)
!714 = !{!458, !458}
!715 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !716, file: !697, line: 372)
!716 = !DISubprogram(name: "asinf", scope: !703, file: !703, line: 318, type: !713, flags: DIFlagPrototyped, spFlags: 0)
!717 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !718, file: !697, line: 374)
!718 = !DISubprogram(name: "atanf", scope: !703, file: !703, line: 322, type: !713, flags: DIFlagPrototyped, spFlags: 0)
!719 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !720, file: !697, line: 376)
!720 = !DISubprogram(name: "atan2f", scope: !703, file: !703, line: 326, type: !721, flags: DIFlagPrototyped, spFlags: 0)
!721 = !DISubroutineType(types: !722)
!722 = !{!458, !458, !458}
!723 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !724, file: !697, line: 378)
!724 = !DISubprogram(name: "ceilf", scope: !703, file: !703, line: 461, type: !713, flags: DIFlagPrototyped, spFlags: 0)
!725 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !726, file: !697, line: 380)
!726 = !DISubprogram(name: "cosf", scope: !703, file: !703, line: 330, type: !713, flags: DIFlagPrototyped, spFlags: 0)
!727 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !728, file: !697, line: 382)
!728 = !DISubprogram(name: "coshf", scope: !703, file: !703, line: 354, type: !713, flags: DIFlagPrototyped, spFlags: 0)
!729 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !730, file: !697, line: 385)
!730 = !DISubprogram(name: "expf", scope: !703, file: !703, line: 366, type: !713, flags: DIFlagPrototyped, spFlags: 0)
!731 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !732, file: !697, line: 388)
!732 = !DISubprogram(name: "fabsf", scope: !703, file: !703, line: 422, type: !713, flags: DIFlagPrototyped, spFlags: 0)
!733 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !734, file: !697, line: 390)
!734 = !DISubprogram(name: "floorf", scope: !703, file: !703, line: 465, type: !713, flags: DIFlagPrototyped, spFlags: 0)
!735 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !736, file: !697, line: 393)
!736 = !DISubprogram(name: "fmodf", scope: !703, file: !703, line: 505, type: !721, flags: DIFlagPrototyped, spFlags: 0)
!737 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !738, file: !697, line: 396)
!738 = !DISubprogram(name: "frexpf", scope: !703, file: !703, line: 406, type: !739, flags: DIFlagPrototyped, spFlags: 0)
!739 = !DISubroutineType(types: !740)
!740 = !{!458, !458, !35}
!741 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !742, file: !697, line: 398)
!742 = !DISubprogram(name: "ldexpf", scope: !703, file: !703, line: 402, type: !743, flags: DIFlagPrototyped, spFlags: 0)
!743 = !DISubroutineType(types: !744)
!744 = !{!458, !458, !32}
!745 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !746, file: !697, line: 401)
!746 = !DISubprogram(name: "logf", scope: !703, file: !703, line: 378, type: !713, flags: DIFlagPrototyped, spFlags: 0)
!747 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !748, file: !697, line: 404)
!748 = !DISubprogram(name: "log10f", scope: !703, file: !703, line: 382, type: !713, flags: DIFlagPrototyped, spFlags: 0)
!749 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !691, file: !697, line: 405)
!750 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !751, file: !697, line: 406)
!751 = !DISubprogram(name: "modff", scope: !703, file: !703, line: 398, type: !752, flags: DIFlagPrototyped, spFlags: 0)
!752 = !DISubroutineType(types: !753)
!753 = !{!458, !458, !754}
!754 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !458, size: 64)
!755 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !756, file: !697, line: 409)
!756 = !DISubprogram(name: "powf", scope: !703, file: !703, line: 434, type: !721, flags: DIFlagPrototyped, spFlags: 0)
!757 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !758, file: !697, line: 412)
!758 = !DISubprogram(name: "sinf", scope: !703, file: !703, line: 334, type: !713, flags: DIFlagPrototyped, spFlags: 0)
!759 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !760, file: !697, line: 414)
!760 = !DISubprogram(name: "sinhf", scope: !703, file: !703, line: 358, type: !713, flags: DIFlagPrototyped, spFlags: 0)
!761 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !762, file: !697, line: 417)
!762 = !DISubprogram(name: "sqrtf", scope: !703, file: !703, line: 438, type: !713, flags: DIFlagPrototyped, spFlags: 0)
!763 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !764, file: !697, line: 419)
!764 = !DISubprogram(name: "tanf", scope: !703, file: !703, line: 338, type: !713, flags: DIFlagPrototyped, spFlags: 0)
!765 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !766, file: !697, line: 422)
!766 = !DISubprogram(name: "tanhf", scope: !703, file: !703, line: 362, type: !713, flags: DIFlagPrototyped, spFlags: 0)
!767 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !768, file: !697, line: 425)
!768 = !DISubprogram(name: "acoshf", scope: !703, file: !703, line: 342, type: !713, flags: DIFlagPrototyped, spFlags: 0)
!769 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !770, file: !697, line: 427)
!770 = !DISubprogram(name: "asinhf", scope: !703, file: !703, line: 346, type: !713, flags: DIFlagPrototyped, spFlags: 0)
!771 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !772, file: !697, line: 429)
!772 = !DISubprogram(name: "atanhf", scope: !703, file: !703, line: 350, type: !713, flags: DIFlagPrototyped, spFlags: 0)
!773 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !774, file: !697, line: 431)
!774 = !DISubprogram(name: "cbrtf", scope: !703, file: !703, line: 426, type: !713, flags: DIFlagPrototyped, spFlags: 0)
!775 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !776, file: !697, line: 434)
!776 = !DISubprogram(name: "copysignf", scope: !703, file: !703, line: 517, type: !721, flags: DIFlagPrototyped, spFlags: 0)
!777 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !778, file: !697, line: 437)
!778 = !DISubprogram(name: "erff", scope: !703, file: !703, line: 442, type: !713, flags: DIFlagPrototyped, spFlags: 0)
!779 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !780, file: !697, line: 439)
!780 = !DISubprogram(name: "erfcf", scope: !703, file: !703, line: 446, type: !713, flags: DIFlagPrototyped, spFlags: 0)
!781 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !782, file: !697, line: 441)
!782 = !DISubprogram(name: "exp2f", scope: !703, file: !703, line: 370, type: !713, flags: DIFlagPrototyped, spFlags: 0)
!783 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !784, file: !697, line: 443)
!784 = !DISubprogram(name: "expm1f", scope: !703, file: !703, line: 374, type: !713, flags: DIFlagPrototyped, spFlags: 0)
!785 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !786, file: !697, line: 445)
!786 = !DISubprogram(name: "fdimf", scope: !703, file: !703, line: 533, type: !721, flags: DIFlagPrototyped, spFlags: 0)
!787 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !788, file: !697, line: 446)
!788 = !DISubprogram(name: "fmaf", scope: !703, file: !703, line: 545, type: !789, flags: DIFlagPrototyped, spFlags: 0)
!789 = !DISubroutineType(types: !790)
!790 = !{!458, !458, !458, !458}
!791 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !792, file: !697, line: 449)
!792 = !DISubprogram(name: "fmaxf", scope: !703, file: !703, line: 537, type: !721, flags: DIFlagPrototyped, spFlags: 0)
!793 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !794, file: !697, line: 451)
!794 = !DISubprogram(name: "fminf", scope: !703, file: !703, line: 541, type: !721, flags: DIFlagPrototyped, spFlags: 0)
!795 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !796, file: !697, line: 453)
!796 = !DISubprogram(name: "hypotf", scope: !703, file: !703, line: 430, type: !721, flags: DIFlagPrototyped, spFlags: 0)
!797 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !798, file: !697, line: 455)
!798 = !DISubprogram(name: "ilogbf", scope: !703, file: !703, line: 410, type: !799, flags: DIFlagPrototyped, spFlags: 0)
!799 = !DISubroutineType(types: !800)
!800 = !{!32, !458}
!801 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !802, file: !697, line: 457)
!802 = !DISubprogram(name: "lgammaf", scope: !703, file: !703, line: 453, type: !713, flags: DIFlagPrototyped, spFlags: 0)
!803 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !804, file: !697, line: 459)
!804 = !DISubprogram(name: "llrintf", scope: !703, file: !703, line: 492, type: !805, flags: DIFlagPrototyped, spFlags: 0)
!805 = !DISubroutineType(types: !806)
!806 = !{!20, !458}
!807 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !808, file: !697, line: 461)
!808 = !DISubprogram(name: "llroundf", scope: !703, file: !703, line: 496, type: !805, flags: DIFlagPrototyped, spFlags: 0)
!809 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !810, file: !697, line: 463)
!810 = !DISubprogram(name: "log1pf", scope: !703, file: !703, line: 390, type: !713, flags: DIFlagPrototyped, spFlags: 0)
!811 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !812, file: !697, line: 465)
!812 = !DISubprogram(name: "log2f", scope: !703, file: !703, line: 386, type: !713, flags: DIFlagPrototyped, spFlags: 0)
!813 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !814, file: !697, line: 467)
!814 = !DISubprogram(name: "logbf", scope: !703, file: !703, line: 394, type: !713, flags: DIFlagPrototyped, spFlags: 0)
!815 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !816, file: !697, line: 469)
!816 = !DISubprogram(name: "lrintf", scope: !703, file: !703, line: 477, type: !817, flags: DIFlagPrototyped, spFlags: 0)
!817 = !DISubroutineType(types: !818)
!818 = !{!184, !458}
!819 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !820, file: !697, line: 471)
!820 = !DISubprogram(name: "lroundf", scope: !703, file: !703, line: 485, type: !817, flags: DIFlagPrototyped, spFlags: 0)
!821 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !822, file: !697, line: 473)
!822 = !DISubprogram(name: "nan", scope: !703, file: !703, line: 522, type: !823, flags: DIFlagPrototyped, spFlags: 0)
!823 = !DISubroutineType(types: !824)
!824 = !{!452, !283}
!825 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !826, file: !697, line: 474)
!826 = !DISubprogram(name: "nanf", scope: !703, file: !703, line: 521, type: !827, flags: DIFlagPrototyped, spFlags: 0)
!827 = !DISubroutineType(types: !828)
!828 = !{!458, !283}
!829 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !830, file: !697, line: 477)
!830 = !DISubprogram(name: "nearbyintf", scope: !703, file: !703, line: 469, type: !713, flags: DIFlagPrototyped, spFlags: 0)
!831 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !832, file: !697, line: 479)
!832 = !DISubprogram(name: "nextafterf", scope: !703, file: !703, line: 525, type: !721, flags: DIFlagPrototyped, spFlags: 0)
!833 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !834, file: !697, line: 481)
!834 = !DISubprogram(name: "nexttowardf", scope: !703, file: !703, line: 530, type: !835, flags: DIFlagPrototyped, spFlags: 0)
!835 = !DISubroutineType(types: !836)
!836 = !{!458, !458, !198}
!837 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !838, file: !697, line: 483)
!838 = !DISubprogram(name: "remainderf", scope: !703, file: !703, line: 509, type: !721, flags: DIFlagPrototyped, spFlags: 0)
!839 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !840, file: !697, line: 485)
!840 = !DISubprogram(name: "remquof", scope: !703, file: !703, line: 513, type: !841, flags: DIFlagPrototyped, spFlags: 0)
!841 = !DISubroutineType(types: !842)
!842 = !{!458, !458, !458, !35}
!843 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !844, file: !697, line: 487)
!844 = !DISubprogram(name: "rintf", scope: !703, file: !703, line: 473, type: !713, flags: DIFlagPrototyped, spFlags: 0)
!845 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !846, file: !697, line: 489)
!846 = !DISubprogram(name: "roundf", scope: !703, file: !703, line: 481, type: !713, flags: DIFlagPrototyped, spFlags: 0)
!847 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !848, file: !697, line: 491)
!848 = !DISubprogram(name: "scalblnf", scope: !703, file: !703, line: 418, type: !849, flags: DIFlagPrototyped, spFlags: 0)
!849 = !DISubroutineType(types: !850)
!850 = !{!458, !458, !184}
!851 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !852, file: !697, line: 493)
!852 = !DISubprogram(name: "scalbnf", scope: !703, file: !703, line: 414, type: !743, flags: DIFlagPrototyped, spFlags: 0)
!853 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !854, file: !697, line: 495)
!854 = !DISubprogram(name: "tgammaf", scope: !703, file: !703, line: 457, type: !713, flags: DIFlagPrototyped, spFlags: 0)
!855 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !856, file: !697, line: 497)
!856 = !DISubprogram(name: "truncf", scope: !703, file: !703, line: 501, type: !713, flags: DIFlagPrototyped, spFlags: 0)
!857 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !858, file: !697, line: 499)
!858 = !DISubprogram(name: "acosl", scope: !703, file: !703, line: 316, type: !709, flags: DIFlagPrototyped, spFlags: 0)
!859 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !860, file: !697, line: 500)
!860 = !DISubprogram(name: "asinl", scope: !703, file: !703, line: 320, type: !709, flags: DIFlagPrototyped, spFlags: 0)
!861 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !862, file: !697, line: 501)
!862 = !DISubprogram(name: "atanl", scope: !703, file: !703, line: 324, type: !709, flags: DIFlagPrototyped, spFlags: 0)
!863 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !864, file: !697, line: 502)
!864 = !DISubprogram(name: "atan2l", scope: !703, file: !703, line: 328, type: !865, flags: DIFlagPrototyped, spFlags: 0)
!865 = !DISubroutineType(types: !866)
!866 = !{!198, !198, !198}
!867 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !868, file: !697, line: 503)
!868 = !DISubprogram(name: "ceill", scope: !703, file: !703, line: 463, type: !709, flags: DIFlagPrototyped, spFlags: 0)
!869 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !870, file: !697, line: 504)
!870 = !DISubprogram(name: "cosl", scope: !703, file: !703, line: 332, type: !709, flags: DIFlagPrototyped, spFlags: 0)
!871 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !872, file: !697, line: 505)
!872 = !DISubprogram(name: "coshl", scope: !703, file: !703, line: 356, type: !709, flags: DIFlagPrototyped, spFlags: 0)
!873 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !874, file: !697, line: 506)
!874 = !DISubprogram(name: "expl", scope: !703, file: !703, line: 368, type: !709, flags: DIFlagPrototyped, spFlags: 0)
!875 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !876, file: !697, line: 507)
!876 = !DISubprogram(name: "fabsl", scope: !703, file: !703, line: 424, type: !709, flags: DIFlagPrototyped, spFlags: 0)
!877 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !878, file: !697, line: 508)
!878 = !DISubprogram(name: "floorl", scope: !703, file: !703, line: 467, type: !709, flags: DIFlagPrototyped, spFlags: 0)
!879 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !880, file: !697, line: 509)
!880 = !DISubprogram(name: "fmodl", scope: !703, file: !703, line: 507, type: !865, flags: DIFlagPrototyped, spFlags: 0)
!881 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !882, file: !697, line: 510)
!882 = !DISubprogram(name: "frexpl", scope: !703, file: !703, line: 408, type: !883, flags: DIFlagPrototyped, spFlags: 0)
!883 = !DISubroutineType(types: !884)
!884 = !{!198, !198, !35}
!885 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !886, file: !697, line: 511)
!886 = !DISubprogram(name: "ldexpl", scope: !703, file: !703, line: 404, type: !887, flags: DIFlagPrototyped, spFlags: 0)
!887 = !DISubroutineType(types: !888)
!888 = !{!198, !198, !32}
!889 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !890, file: !697, line: 512)
!890 = !DISubprogram(name: "logl", scope: !703, file: !703, line: 380, type: !709, flags: DIFlagPrototyped, spFlags: 0)
!891 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !892, file: !697, line: 513)
!892 = !DISubprogram(name: "log10l", scope: !703, file: !703, line: 384, type: !709, flags: DIFlagPrototyped, spFlags: 0)
!893 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !894, file: !697, line: 514)
!894 = !DISubprogram(name: "modfl", scope: !703, file: !703, line: 400, type: !693, flags: DIFlagPrototyped, spFlags: 0)
!895 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !896, file: !697, line: 515)
!896 = !DISubprogram(name: "powl", scope: !703, file: !703, line: 436, type: !865, flags: DIFlagPrototyped, spFlags: 0)
!897 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !898, file: !697, line: 516)
!898 = !DISubprogram(name: "sinl", scope: !703, file: !703, line: 336, type: !709, flags: DIFlagPrototyped, spFlags: 0)
!899 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !900, file: !697, line: 517)
!900 = !DISubprogram(name: "sinhl", scope: !703, file: !703, line: 360, type: !709, flags: DIFlagPrototyped, spFlags: 0)
!901 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !902, file: !697, line: 518)
!902 = !DISubprogram(name: "sqrtl", scope: !703, file: !703, line: 440, type: !709, flags: DIFlagPrototyped, spFlags: 0)
!903 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !904, file: !697, line: 519)
!904 = !DISubprogram(name: "tanl", scope: !703, file: !703, line: 340, type: !709, flags: DIFlagPrototyped, spFlags: 0)
!905 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !906, file: !697, line: 521)
!906 = !DISubprogram(name: "tanhl", scope: !703, file: !703, line: 364, type: !709, flags: DIFlagPrototyped, spFlags: 0)
!907 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !908, file: !697, line: 522)
!908 = !DISubprogram(name: "acoshl", scope: !703, file: !703, line: 344, type: !709, flags: DIFlagPrototyped, spFlags: 0)
!909 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !910, file: !697, line: 523)
!910 = !DISubprogram(name: "asinhl", scope: !703, file: !703, line: 348, type: !709, flags: DIFlagPrototyped, spFlags: 0)
!911 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !912, file: !697, line: 524)
!912 = !DISubprogram(name: "atanhl", scope: !703, file: !703, line: 352, type: !709, flags: DIFlagPrototyped, spFlags: 0)
!913 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !914, file: !697, line: 525)
!914 = !DISubprogram(name: "cbrtl", scope: !703, file: !703, line: 428, type: !709, flags: DIFlagPrototyped, spFlags: 0)
!915 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !916, file: !697, line: 527)
!916 = !DISubprogram(name: "copysignl", scope: !703, file: !703, line: 519, type: !865, flags: DIFlagPrototyped, spFlags: 0)
!917 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !918, file: !697, line: 529)
!918 = !DISubprogram(name: "erfl", scope: !703, file: !703, line: 444, type: !709, flags: DIFlagPrototyped, spFlags: 0)
!919 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !920, file: !697, line: 530)
!920 = !DISubprogram(name: "erfcl", scope: !703, file: !703, line: 448, type: !709, flags: DIFlagPrototyped, spFlags: 0)
!921 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !922, file: !697, line: 531)
!922 = !DISubprogram(name: "exp2l", scope: !703, file: !703, line: 372, type: !709, flags: DIFlagPrototyped, spFlags: 0)
!923 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !924, file: !697, line: 532)
!924 = !DISubprogram(name: "expm1l", scope: !703, file: !703, line: 376, type: !709, flags: DIFlagPrototyped, spFlags: 0)
!925 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !926, file: !697, line: 533)
!926 = !DISubprogram(name: "fdiml", scope: !703, file: !703, line: 535, type: !865, flags: DIFlagPrototyped, spFlags: 0)
!927 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !928, file: !697, line: 534)
!928 = !DISubprogram(name: "fmal", scope: !703, file: !703, line: 547, type: !929, flags: DIFlagPrototyped, spFlags: 0)
!929 = !DISubroutineType(types: !930)
!930 = !{!198, !198, !198, !198}
!931 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !932, file: !697, line: 535)
!932 = !DISubprogram(name: "fmaxl", scope: !703, file: !703, line: 539, type: !865, flags: DIFlagPrototyped, spFlags: 0)
!933 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !934, file: !697, line: 536)
!934 = !DISubprogram(name: "fminl", scope: !703, file: !703, line: 543, type: !865, flags: DIFlagPrototyped, spFlags: 0)
!935 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !936, file: !697, line: 537)
!936 = !DISubprogram(name: "hypotl", scope: !703, file: !703, line: 432, type: !865, flags: DIFlagPrototyped, spFlags: 0)
!937 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !938, file: !697, line: 538)
!938 = !DISubprogram(name: "ilogbl", scope: !703, file: !703, line: 412, type: !939, flags: DIFlagPrototyped, spFlags: 0)
!939 = !DISubroutineType(types: !940)
!940 = !{!32, !198}
!941 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !942, file: !697, line: 539)
!942 = !DISubprogram(name: "lgammal", scope: !703, file: !703, line: 455, type: !709, flags: DIFlagPrototyped, spFlags: 0)
!943 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !944, file: !697, line: 540)
!944 = !DISubprogram(name: "llrintl", scope: !703, file: !703, line: 494, type: !945, flags: DIFlagPrototyped, spFlags: 0)
!945 = !DISubroutineType(types: !946)
!946 = !{!20, !198}
!947 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !948, file: !697, line: 541)
!948 = !DISubprogram(name: "llroundl", scope: !703, file: !703, line: 498, type: !945, flags: DIFlagPrototyped, spFlags: 0)
!949 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !950, file: !697, line: 542)
!950 = !DISubprogram(name: "log1pl", scope: !703, file: !703, line: 392, type: !709, flags: DIFlagPrototyped, spFlags: 0)
!951 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !952, file: !697, line: 543)
!952 = !DISubprogram(name: "log2l", scope: !703, file: !703, line: 388, type: !709, flags: DIFlagPrototyped, spFlags: 0)
!953 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !954, file: !697, line: 544)
!954 = !DISubprogram(name: "logbl", scope: !703, file: !703, line: 396, type: !709, flags: DIFlagPrototyped, spFlags: 0)
!955 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !956, file: !697, line: 545)
!956 = !DISubprogram(name: "lrintl", scope: !703, file: !703, line: 479, type: !957, flags: DIFlagPrototyped, spFlags: 0)
!957 = !DISubroutineType(types: !958)
!958 = !{!184, !198}
!959 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !960, file: !697, line: 546)
!960 = !DISubprogram(name: "lroundl", scope: !703, file: !703, line: 487, type: !957, flags: DIFlagPrototyped, spFlags: 0)
!961 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !962, file: !697, line: 547)
!962 = !DISubprogram(name: "nanl", scope: !703, file: !703, line: 523, type: !963, flags: DIFlagPrototyped, spFlags: 0)
!963 = !DISubroutineType(types: !964)
!964 = !{!198, !283}
!965 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !966, file: !697, line: 548)
!966 = !DISubprogram(name: "nearbyintl", scope: !703, file: !703, line: 471, type: !709, flags: DIFlagPrototyped, spFlags: 0)
!967 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !968, file: !697, line: 549)
!968 = !DISubprogram(name: "nextafterl", scope: !703, file: !703, line: 527, type: !865, flags: DIFlagPrototyped, spFlags: 0)
!969 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !970, file: !697, line: 550)
!970 = !DISubprogram(name: "nexttowardl", scope: !703, file: !703, line: 531, type: !865, flags: DIFlagPrototyped, spFlags: 0)
!971 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !972, file: !697, line: 551)
!972 = !DISubprogram(name: "remainderl", scope: !703, file: !703, line: 511, type: !865, flags: DIFlagPrototyped, spFlags: 0)
!973 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !974, file: !697, line: 552)
!974 = !DISubprogram(name: "remquol", scope: !703, file: !703, line: 515, type: !975, flags: DIFlagPrototyped, spFlags: 0)
!975 = !DISubroutineType(types: !976)
!976 = !{!198, !198, !198, !35}
!977 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !978, file: !697, line: 553)
!978 = !DISubprogram(name: "rintl", scope: !703, file: !703, line: 475, type: !709, flags: DIFlagPrototyped, spFlags: 0)
!979 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !980, file: !697, line: 554)
!980 = !DISubprogram(name: "roundl", scope: !703, file: !703, line: 483, type: !709, flags: DIFlagPrototyped, spFlags: 0)
!981 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !982, file: !697, line: 555)
!982 = !DISubprogram(name: "scalblnl", scope: !703, file: !703, line: 420, type: !983, flags: DIFlagPrototyped, spFlags: 0)
!983 = !DISubroutineType(types: !984)
!984 = !{!198, !198, !184}
!985 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !986, file: !697, line: 556)
!986 = !DISubprogram(name: "scalbnl", scope: !703, file: !703, line: 416, type: !887, flags: DIFlagPrototyped, spFlags: 0)
!987 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !988, file: !697, line: 557)
!988 = !DISubprogram(name: "tgammal", scope: !703, file: !703, line: 459, type: !709, flags: DIFlagPrototyped, spFlags: 0)
!989 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !990, file: !697, line: 558)
!990 = !DISubprogram(name: "truncl", scope: !703, file: !703, line: 503, type: !709, flags: DIFlagPrototyped, spFlags: 0)
!991 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !992, entity: !993, file: !995, line: 536)
!992 = !DINamespace(name: "chrono", scope: !120)
!993 = !DINamespace(name: "chrono_literals", scope: !994, exportSymbols: true)
!994 = !DINamespace(name: "literals", scope: !120, exportSymbols: true)
!995 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__chrono/duration.h", directory: "")
!996 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !997, file: !1000, line: 68)
!997 = !DIDerivedType(tag: DW_TAG_typedef, name: "clock_t", file: !998, line: 31, baseType: !999)
!998 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_clock_t.h", directory: "", checksumkind: CSK_MD5, checksum: "757b93ac72874f074e33ca41b7ee521d")
!999 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_clock_t", file: !183, line: 116, baseType: !188)
!1000 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/ctime", directory: "")
!1001 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1002, file: !1000, line: 69)
!1002 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !1003, line: 31, baseType: !1004)
!1003 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_time_t.h", directory: "", checksumkind: CSK_MD5, checksum: "ddc110fab0813d27960d5c9aaba0ed4f")
!1004 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_time_t", file: !183, line: 119, baseType: !184)
!1005 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !312, file: !1000, line: 70)
!1006 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1007, file: !1000, line: 74)
!1007 = !DISubprogram(name: "clock", linkageName: "\01_clock", scope: !313, file: !313, line: 112, type: !1008, flags: DIFlagPrototyped, spFlags: 0)
!1008 = !DISubroutineType(types: !1009)
!1009 = !{!997}
!1010 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1011, file: !1000, line: 75)
!1011 = !DISubprogram(name: "difftime", scope: !313, file: !313, line: 114, type: !1012, flags: DIFlagPrototyped, spFlags: 0)
!1012 = !DISubroutineType(types: !1013)
!1013 = !{!452, !1002, !1002}
!1014 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1015, file: !1000, line: 76)
!1015 = !DISubprogram(name: "mktime", linkageName: "\01_mktime", scope: !313, file: !313, line: 118, type: !1016, flags: DIFlagPrototyped, spFlags: 0)
!1016 = !DISubroutineType(types: !1017)
!1017 = !{!1002, !1018}
!1018 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !312, size: 64)
!1019 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1020, file: !1000, line: 77)
!1020 = !DISubprogram(name: "time", scope: !313, file: !313, line: 121, type: !1021, flags: DIFlagPrototyped, spFlags: 0)
!1021 = !DISubroutineType(types: !1022)
!1022 = !{!1002, !1023}
!1023 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1002, size: 64)
!1024 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1025, file: !1000, line: 78)
!1025 = !DISubprogram(name: "asctime", scope: !313, file: !313, line: 111, type: !1026, flags: DIFlagPrototyped, spFlags: 0)
!1026 = !DISubroutineType(types: !1027)
!1027 = !{!326, !546}
!1028 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1029, file: !1000, line: 79)
!1029 = !DISubprogram(name: "ctime", scope: !313, file: !313, line: 113, type: !1030, flags: DIFlagPrototyped, spFlags: 0)
!1030 = !DISubroutineType(types: !1031)
!1031 = !{!326, !1032}
!1032 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1033, size: 64)
!1033 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1002)
!1034 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1035, file: !1000, line: 80)
!1035 = !DISubprogram(name: "gmtime", scope: !313, file: !313, line: 116, type: !1036, flags: DIFlagPrototyped, spFlags: 0)
!1036 = !DISubroutineType(types: !1037)
!1037 = !{!1018, !1032}
!1038 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1039, file: !1000, line: 81)
!1039 = !DISubprogram(name: "localtime", scope: !313, file: !313, line: 117, type: !1036, flags: DIFlagPrototyped, spFlags: 0)
!1040 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1041, file: !1000, line: 82)
!1041 = !DISubprogram(name: "strftime", linkageName: "\01_strftime", scope: !313, file: !313, line: 119, type: !1042, flags: DIFlagPrototyped, spFlags: 0)
!1042 = !DISubroutineType(types: !1043)
!1043 = !{!397, !326, !397, !283, !546}
!1044 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1045, file: !1051, line: 106)
!1045 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !1046, line: 105, baseType: !1047)
!1046 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "17a3e5580239ce2f2af260c9c943ad9b")
!1047 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1046, line: 102, size: 64, flags: DIFlagTypePassByValue, elements: !1048, identifier: "_ZTS5div_t")
!1048 = !{!1049, !1050}
!1049 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !1047, file: !1046, line: 103, baseType: !32, size: 32)
!1050 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !1047, file: !1046, line: 104, baseType: !32, size: 32, offset: 32)
!1051 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdlib", directory: "")
!1052 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1053, file: !1051, line: 107)
!1053 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !1046, line: 110, baseType: !1054)
!1054 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1046, line: 107, size: 128, flags: DIFlagTypePassByValue, elements: !1055, identifier: "_ZTS6ldiv_t")
!1055 = !{!1056, !1057}
!1056 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !1054, file: !1046, line: 108, baseType: !184, size: 64)
!1057 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !1054, file: !1046, line: 109, baseType: !184, size: 64, offset: 64)
!1058 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1059, file: !1051, line: 108)
!1059 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !1046, line: 116, baseType: !1060)
!1060 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1046, line: 113, size: 128, flags: DIFlagTypePassByValue, elements: !1061, identifier: "_ZTS7lldiv_t")
!1061 = !{!1062, !1063}
!1062 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !1060, file: !1046, line: 114, baseType: !20, size: 64)
!1063 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !1060, file: !1046, line: 115, baseType: !20, size: 64, offset: 64)
!1064 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1065, file: !1051, line: 109)
!1065 = !DISubprogram(name: "atof", scope: !1046, file: !1046, line: 149, type: !823, flags: DIFlagPrototyped, spFlags: 0)
!1066 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1067, file: !1051, line: 110)
!1067 = !DISubprogram(name: "atoi", scope: !1046, file: !1046, line: 150, type: !1068, flags: DIFlagPrototyped, spFlags: 0)
!1068 = !DISubroutineType(types: !1069)
!1069 = !{!32, !283}
!1070 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1071, file: !1051, line: 111)
!1071 = !DISubprogram(name: "atol", scope: !1046, file: !1046, line: 151, type: !1072, flags: DIFlagPrototyped, spFlags: 0)
!1072 = !DISubroutineType(types: !1073)
!1073 = !{!184, !283}
!1074 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1075, file: !1051, line: 112)
!1075 = !DISubprogram(name: "atoll", scope: !1046, file: !1046, line: 154, type: !1076, flags: DIFlagPrototyped, spFlags: 0)
!1076 = !DISubroutineType(types: !1077)
!1077 = !{!20, !283}
!1078 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1079, file: !1051, line: 113)
!1079 = !DISubprogram(name: "strtod", linkageName: "\01_strtod", scope: !1046, file: !1046, line: 184, type: !1080, flags: DIFlagPrototyped, spFlags: 0)
!1080 = !DISubroutineType(types: !1081)
!1081 = !{!452, !283, !1082}
!1082 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !326, size: 64)
!1083 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1084, file: !1051, line: 114)
!1084 = !DISubprogram(name: "strtof", linkageName: "\01_strtof", scope: !1046, file: !1046, line: 185, type: !1085, flags: DIFlagPrototyped, spFlags: 0)
!1085 = !DISubroutineType(types: !1086)
!1086 = !{!458, !283, !1082}
!1087 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1088, file: !1051, line: 115)
!1088 = !DISubprogram(name: "strtold", scope: !1046, file: !1046, line: 188, type: !1089, flags: DIFlagPrototyped, spFlags: 0)
!1089 = !DISubroutineType(types: !1090)
!1090 = !{!198, !283, !1082}
!1091 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1092, file: !1051, line: 116)
!1092 = !DISubprogram(name: "strtol", scope: !1046, file: !1046, line: 186, type: !1093, flags: DIFlagPrototyped, spFlags: 0)
!1093 = !DISubroutineType(types: !1094)
!1094 = !{!184, !283, !1082, !32}
!1095 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1096, file: !1051, line: 117)
!1096 = !DISubprogram(name: "strtoll", scope: !1046, file: !1046, line: 191, type: !1097, flags: DIFlagPrototyped, spFlags: 0)
!1097 = !DISubroutineType(types: !1098)
!1098 = !{!20, !283, !1082, !32}
!1099 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1100, file: !1051, line: 118)
!1100 = !DISubprogram(name: "strtoul", scope: !1046, file: !1046, line: 194, type: !1101, flags: DIFlagPrototyped, spFlags: 0)
!1101 = !DISubroutineType(types: !1102)
!1102 = !{!188, !283, !1082, !32}
!1103 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1104, file: !1051, line: 119)
!1104 = !DISubprogram(name: "strtoull", scope: !1046, file: !1046, line: 197, type: !1105, flags: DIFlagPrototyped, spFlags: 0)
!1105 = !DISubroutineType(types: !1106)
!1106 = !{!145, !283, !1082, !32}
!1107 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1108, file: !1051, line: 120)
!1108 = !DISubprogram(name: "rand", scope: !1046, file: !1046, line: 181, type: !1109, flags: DIFlagPrototyped, spFlags: 0)
!1109 = !DISubroutineType(types: !1110)
!1110 = !{!32}
!1111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1112, file: !1051, line: 121)
!1112 = !DISubprogram(name: "srand", scope: !1046, file: !1046, line: 183, type: !1113, flags: DIFlagPrototyped, spFlags: 0)
!1113 = !DISubroutineType(types: !1114)
!1114 = !{null, !36}
!1115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1116, file: !1051, line: 122)
!1116 = !DISubprogram(name: "calloc", scope: !1117, file: !1117, line: 55, type: !1118, flags: DIFlagPrototyped, spFlags: 0)
!1117 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/malloc/_malloc.h", directory: "", checksumkind: CSK_MD5, checksum: "169c9ed8662627a4a4d92e321cfa866c")
!1118 = !DISubroutineType(types: !1119)
!1119 = !{!346, !397, !397}
!1120 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1121, file: !1051, line: 123)
!1121 = !DISubprogram(name: "free", scope: !1117, file: !1117, line: 56, type: !1122, flags: DIFlagPrototyped, spFlags: 0)
!1122 = !DISubroutineType(types: !1123)
!1123 = !{null, !346}
!1124 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1125, file: !1051, line: 124)
!1125 = !DISubprogram(name: "malloc", scope: !1117, file: !1117, line: 54, type: !1126, flags: DIFlagPrototyped, spFlags: 0)
!1126 = !DISubroutineType(types: !1127)
!1127 = !{!346, !397}
!1128 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1129, file: !1051, line: 125)
!1129 = !DISubprogram(name: "realloc", scope: !1117, file: !1117, line: 57, type: !1130, flags: DIFlagPrototyped, spFlags: 0)
!1130 = !DISubroutineType(types: !1131)
!1131 = !{!346, !346, !397}
!1132 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1133, file: !1051, line: 126)
!1133 = !DISubprogram(name: "abort", scope: !1134, file: !1134, line: 33, type: !1135, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1134 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_abort.h", directory: "", checksumkind: CSK_MD5, checksum: "b8994a53d49770cf67adab87821b3fcb")
!1135 = !DISubroutineType(types: !1136)
!1136 = !{null}
!1137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1138, file: !1051, line: 127)
!1138 = !DISubprogram(name: "atexit", scope: !1046, file: !1046, line: 144, type: !1139, flags: DIFlagPrototyped, spFlags: 0)
!1139 = !DISubroutineType(types: !1140)
!1140 = !{!32, !1141}
!1141 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1135, size: 64)
!1142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1143, file: !1051, line: 128)
!1143 = !DISubprogram(name: "exit", scope: !1046, file: !1046, line: 160, type: !1144, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1144 = !DISubroutineType(types: !1145)
!1145 = !{null, !32}
!1146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1147, file: !1051, line: 129)
!1147 = !DISubprogram(name: "_Exit", scope: !1046, file: !1046, line: 210, type: !1144, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1149, file: !1051, line: 130)
!1149 = !DISubprogram(name: "getenv", scope: !1046, file: !1046, line: 162, type: !1150, flags: DIFlagPrototyped, spFlags: 0)
!1150 = !DISubroutineType(types: !1151)
!1151 = !{!326, !283}
!1152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1153, file: !1051, line: 131)
!1153 = !DISubprogram(name: "system", linkageName: "\01_system", scope: !1046, file: !1046, line: 203, type: !1068, flags: DIFlagPrototyped, spFlags: 0)
!1154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1155, file: !1051, line: 132)
!1155 = !DISubprogram(name: "bsearch", scope: !1046, file: !1046, line: 156, type: !1156, flags: DIFlagPrototyped, spFlags: 0)
!1156 = !DISubroutineType(types: !1157)
!1157 = !{!346, !608, !608, !397, !397, !1158}
!1158 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1159, size: 64)
!1159 = !DISubroutineType(types: !1160)
!1160 = !{!32, !608, !608}
!1161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1162, file: !1051, line: 133)
!1162 = !DISubprogram(name: "qsort", scope: !1046, file: !1046, line: 175, type: !1163, flags: DIFlagPrototyped, spFlags: 0)
!1163 = !DISubroutineType(types: !1164)
!1164 = !{null, !346, !397, !397, !1158}
!1165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !707, file: !1051, line: 134)
!1166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1167, file: !1051, line: 135)
!1167 = !DISubprogram(name: "labs", scope: !1046, file: !1046, line: 163, type: !1168, flags: DIFlagPrototyped, spFlags: 0)
!1168 = !DISubroutineType(types: !1169)
!1169 = !{!184, !184}
!1170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1171, file: !1051, line: 136)
!1171 = !DISubprogram(name: "llabs", scope: !1046, file: !1046, line: 167, type: !1172, flags: DIFlagPrototyped, spFlags: 0)
!1172 = !DISubroutineType(types: !1173)
!1173 = !{!20, !20}
!1174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1175, file: !1051, line: 137)
!1175 = !DISubprogram(name: "div", linkageName: "_Z3divB8ne200100xx", scope: !708, file: !708, line: 143, type: !1176, flags: DIFlagPrototyped, spFlags: 0)
!1176 = !DISubroutineType(types: !1177)
!1177 = !{!1059, !20, !20}
!1178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1179, file: !1051, line: 138)
!1179 = !DISubprogram(name: "ldiv", scope: !1046, file: !1046, line: 164, type: !1180, flags: DIFlagPrototyped, spFlags: 0)
!1180 = !DISubroutineType(types: !1181)
!1181 = !{!1053, !184, !184}
!1182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1183, file: !1051, line: 139)
!1183 = !DISubprogram(name: "lldiv", scope: !1046, file: !1046, line: 168, type: !1176, flags: DIFlagPrototyped, spFlags: 0)
!1184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1185, file: !1051, line: 140)
!1185 = !DISubprogram(name: "mblen", scope: !1046, file: !1046, line: 171, type: !1186, flags: DIFlagPrototyped, spFlags: 0)
!1186 = !DISubroutineType(types: !1187)
!1187 = !{!32, !283, !397}
!1188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1189, file: !1051, line: 142)
!1189 = !DISubprogram(name: "mbtowc", scope: !1046, file: !1046, line: 173, type: !1190, flags: DIFlagPrototyped, spFlags: 0)
!1190 = !DISubroutineType(types: !1191)
!1191 = !{!32, !396, !283, !397}
!1192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1193, file: !1051, line: 143)
!1193 = !DISubprogram(name: "wctomb", scope: !1046, file: !1046, line: 207, type: !1194, flags: DIFlagPrototyped, spFlags: 0)
!1194 = !DISubroutineType(types: !1195)
!1195 = !{!32, !326, !389}
!1196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1197, file: !1051, line: 144)
!1197 = !DISubprogram(name: "mbstowcs", scope: !1046, file: !1046, line: 172, type: !1198, flags: DIFlagPrototyped, spFlags: 0)
!1198 = !DISubroutineType(types: !1199)
!1199 = !{!397, !396, !283, !397}
!1200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1201, file: !1051, line: 145)
!1201 = !DISubprogram(name: "wcstombs", scope: !1046, file: !1046, line: 206, type: !1202, flags: DIFlagPrototyped, spFlags: 0)
!1202 = !DISubroutineType(types: !1203)
!1203 = !{!397, !326, !387, !397}
!1204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1205, file: !1051, line: 148)
!1205 = !DISubprogram(name: "at_quick_exit", scope: !1046, file: !1046, line: 147, type: !1139, flags: DIFlagPrototyped, spFlags: 0)
!1206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1207, file: !1051, line: 149)
!1207 = !DISubprogram(name: "quick_exit", scope: !1046, file: !1046, line: 179, type: !1144, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !299, file: !1209, line: 25)
!1209 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__std_mbstate_t.h", directory: "")
!1210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !329, file: !1211, line: 120)
!1211 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdio", directory: "")
!1212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !359, file: !1211, line: 121)
!1213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1214, file: !1211, line: 123)
!1214 = !DISubprogram(name: "fclose", scope: !330, file: !330, line: 233, type: !1215, flags: DIFlagPrototyped, spFlags: 0)
!1215 = !DISubroutineType(types: !1216)
!1216 = !{!32, !386}
!1217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1218, file: !1211, line: 124)
!1218 = !DISubprogram(name: "fflush", scope: !330, file: !330, line: 236, type: !1215, flags: DIFlagPrototyped, spFlags: 0)
!1219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1220, file: !1211, line: 125)
!1220 = !DISubprogram(name: "setbuf", scope: !330, file: !330, line: 272, type: !1221, flags: DIFlagPrototyped, spFlags: 0)
!1221 = !DISubroutineType(types: !1222)
!1222 = !{null, !386, !326}
!1223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1224, file: !1211, line: 126)
!1224 = !DISubprogram(name: "setvbuf", scope: !330, file: !330, line: 273, type: !1225, flags: DIFlagPrototyped, spFlags: 0)
!1225 = !DISubroutineType(types: !1226)
!1226 = !{!32, !386, !326, !32, !397}
!1227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1228, file: !1211, line: 127)
!1228 = !DISubprogram(name: "fprintf", scope: !330, file: !330, line: 245, type: !1229, flags: DIFlagPrototyped, spFlags: 0)
!1229 = !DISubroutineType(types: !1230)
!1230 = !{!32, !386, !283, null}
!1231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1232, file: !1211, line: 128)
!1232 = !DISubprogram(name: "fscanf", scope: !330, file: !330, line: 251, type: !1229, flags: DIFlagPrototyped, spFlags: 0)
!1233 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1234, file: !1211, line: 129)
!1234 = !DISubprogram(name: "snprintf", scope: !330, file: !330, line: 435, type: !1235, flags: DIFlagPrototyped, spFlags: 0)
!1235 = !DISubroutineType(types: !1236)
!1236 = !{!32, !326, !397, !283, null}
!1237 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1238, file: !1211, line: 130)
!1238 = !DISubprogram(name: "sprintf", scope: !330, file: !330, line: 280, type: !1239, flags: DIFlagPrototyped, spFlags: 0)
!1239 = !DISubroutineType(types: !1240)
!1240 = !{!32, !326, !283, null}
!1241 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1242, file: !1211, line: 131)
!1242 = !DISubprogram(name: "sscanf", scope: !330, file: !330, line: 282, type: !1243, flags: DIFlagPrototyped, spFlags: 0)
!1243 = !DISubroutineType(types: !1244)
!1244 = !{!32, !283, !283, null}
!1245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1246, file: !1211, line: 132)
!1246 = !DISubprogram(name: "vfprintf", scope: !330, file: !330, line: 292, type: !1247, flags: DIFlagPrototyped, spFlags: 0)
!1247 = !DISubroutineType(types: !1248)
!1248 = !{!32, !386, !283, !1249}
!1249 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !1250, line: 44, baseType: !404)
!1250 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_va_list.h", directory: "", checksumkind: CSK_MD5, checksum: "41825c2dccdd98a1587ce428cded44de")
!1251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1252, file: !1211, line: 133)
!1252 = !DISubprogram(name: "vfscanf", scope: !330, file: !330, line: 436, type: !1247, flags: DIFlagPrototyped, spFlags: 0)
!1253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1254, file: !1211, line: 134)
!1254 = !DISubprogram(name: "vsscanf", scope: !330, file: !330, line: 439, type: !1255, flags: DIFlagPrototyped, spFlags: 0)
!1255 = !DISubroutineType(types: !1256)
!1256 = !{!32, !283, !283, !1249}
!1257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1258, file: !1211, line: 135)
!1258 = !DISubprogram(name: "vsnprintf", scope: !330, file: !330, line: 438, type: !1259, flags: DIFlagPrototyped, spFlags: 0)
!1259 = !DISubroutineType(types: !1260)
!1260 = !{!32, !326, !397, !283, !1249}
!1261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1262, file: !1211, line: 136)
!1262 = !DISubprogram(name: "vsprintf", scope: !330, file: !330, line: 300, type: !1263, flags: DIFlagPrototyped, spFlags: 0)
!1263 = !DISubroutineType(types: !1264)
!1264 = !{!32, !326, !283, !1249}
!1265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1266, file: !1211, line: 137)
!1266 = !DISubprogram(name: "fgetc", scope: !330, file: !330, line: 237, type: !1215, flags: DIFlagPrototyped, spFlags: 0)
!1267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1268, file: !1211, line: 138)
!1268 = !DISubprogram(name: "fgets", scope: !330, file: !330, line: 239, type: !1269, flags: DIFlagPrototyped, spFlags: 0)
!1269 = !DISubroutineType(types: !1270)
!1270 = !{!326, !326, !32, !386}
!1271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1272, file: !1211, line: 139)
!1272 = !DISubprogram(name: "fputc", scope: !330, file: !330, line: 246, type: !1273, flags: DIFlagPrototyped, spFlags: 0)
!1273 = !DISubroutineType(types: !1274)
!1274 = !{!32, !32, !386}
!1275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1276, file: !1211, line: 140)
!1276 = !DISubprogram(name: "fputs", linkageName: "\01_fputs", scope: !330, file: !330, line: 247, type: !1277, flags: DIFlagPrototyped, spFlags: 0)
!1277 = !DISubroutineType(types: !1278)
!1278 = !{!32, !283, !386}
!1279 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1280, file: !1211, line: 141)
!1280 = !DISubprogram(name: "getc", scope: !330, file: !330, line: 256, type: !1215, flags: DIFlagPrototyped, spFlags: 0)
!1281 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1282, file: !1211, line: 142)
!1282 = !DISubprogram(name: "putc", scope: !330, file: !330, line: 265, type: !1273, flags: DIFlagPrototyped, spFlags: 0)
!1283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1284, file: !1211, line: 143)
!1284 = !DISubprogram(name: "ungetc", scope: !330, file: !330, line: 291, type: !1273, flags: DIFlagPrototyped, spFlags: 0)
!1285 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1286, file: !1211, line: 144)
!1286 = !DISubprogram(name: "fread", scope: !330, file: !330, line: 248, type: !1287, flags: DIFlagPrototyped, spFlags: 0)
!1287 = !DISubroutineType(types: !1288)
!1288 = !{!397, !346, !397, !397, !386}
!1289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1290, file: !1211, line: 145)
!1290 = !DISubprogram(name: "fwrite", linkageName: "\01_fwrite", scope: !330, file: !330, line: 255, type: !1291, flags: DIFlagPrototyped, spFlags: 0)
!1291 = !DISubroutineType(types: !1292)
!1292 = !{!397, !608, !397, !397, !386}
!1293 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1294, file: !1211, line: 146)
!1294 = !DISubprogram(name: "fgetpos", scope: !330, file: !330, line: 238, type: !1295, flags: DIFlagPrototyped, spFlags: 0)
!1295 = !DISubroutineType(types: !1296)
!1296 = !{!32, !386, !1297}
!1297 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !359, size: 64)
!1298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1299, file: !1211, line: 147)
!1299 = !DISubprogram(name: "fseek", scope: !330, file: !330, line: 252, type: !1300, flags: DIFlagPrototyped, spFlags: 0)
!1300 = !DISubroutineType(types: !1301)
!1301 = !{!32, !386, !184, !32}
!1302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1303, file: !1211, line: 148)
!1303 = !DISubprogram(name: "fsetpos", scope: !330, file: !330, line: 253, type: !1304, flags: DIFlagPrototyped, spFlags: 0)
!1304 = !DISubroutineType(types: !1305)
!1305 = !{!32, !386, !1306}
!1306 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1307, size: 64)
!1307 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !359)
!1308 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1309, file: !1211, line: 149)
!1309 = !DISubprogram(name: "ftell", scope: !330, file: !330, line: 254, type: !1310, flags: DIFlagPrototyped, spFlags: 0)
!1310 = !DISubroutineType(types: !1311)
!1311 = !{!184, !386}
!1312 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1313, file: !1211, line: 150)
!1313 = !DISubprogram(name: "rewind", scope: !330, file: !330, line: 270, type: !1314, flags: DIFlagPrototyped, spFlags: 0)
!1314 = !DISubroutineType(types: !1315)
!1315 = !{null, !386}
!1316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1317, file: !1211, line: 151)
!1317 = !DISubprogram(name: "clearerr", scope: !330, file: !330, line: 232, type: !1314, flags: DIFlagPrototyped, spFlags: 0)
!1318 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1319, file: !1211, line: 152)
!1319 = !DISubprogram(name: "feof", scope: !330, file: !330, line: 234, type: !1215, flags: DIFlagPrototyped, spFlags: 0)
!1320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1321, file: !1211, line: 153)
!1321 = !DISubprogram(name: "ferror", scope: !330, file: !330, line: 235, type: !1215, flags: DIFlagPrototyped, spFlags: 0)
!1322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1323, file: !1211, line: 154)
!1323 = !DISubprogram(name: "perror", scope: !330, file: !330, line: 264, type: !1324, flags: DIFlagPrototyped, spFlags: 0)
!1324 = !DISubroutineType(types: !1325)
!1325 = !{null, !283}
!1326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1327, file: !1211, line: 156)
!1327 = !DISubprogram(name: "fopen", linkageName: "\01_fopen", scope: !330, file: !330, line: 243, type: !1328, flags: DIFlagPrototyped, spFlags: 0)
!1328 = !DISubroutineType(types: !1329)
!1329 = !{!386, !283, !283}
!1330 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1331, file: !1211, line: 157)
!1331 = !DISubprogram(name: "freopen", linkageName: "\01_freopen", scope: !330, file: !330, line: 249, type: !1332, flags: DIFlagPrototyped, spFlags: 0)
!1332 = !DISubroutineType(types: !1333)
!1333 = !{!386, !283, !283, !386}
!1334 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1335, file: !1211, line: 158)
!1335 = !DISubprogram(name: "remove", scope: !330, file: !330, line: 268, type: !1068, flags: DIFlagPrototyped, spFlags: 0)
!1336 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1337, file: !1211, line: 159)
!1337 = !DISubprogram(name: "rename", scope: !330, file: !330, line: 269, type: !631, flags: DIFlagPrototyped, spFlags: 0)
!1338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1339, file: !1211, line: 160)
!1339 = !DISubprogram(name: "tmpfile", scope: !330, file: !330, line: 283, type: !1340, flags: DIFlagPrototyped, spFlags: 0)
!1340 = !DISubroutineType(types: !1341)
!1341 = !{!386}
!1342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1343, file: !1211, line: 161)
!1343 = !DISubprogram(name: "tmpnam", scope: !330, file: !330, line: 289, type: !1344, flags: DIFlagPrototyped, spFlags: 0)
!1344 = !DISubroutineType(types: !1345)
!1345 = !{!326, !326}
!1346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1347, file: !1211, line: 163)
!1347 = !DISubprogram(name: "getchar", scope: !330, file: !330, line: 257, type: !1109, flags: DIFlagPrototyped, spFlags: 0)
!1348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1349, file: !1211, line: 167)
!1349 = !DISubprogram(name: "scanf", scope: !330, file: !330, line: 271, type: !1350, flags: DIFlagPrototyped, spFlags: 0)
!1350 = !DISubroutineType(types: !1351)
!1351 = !{!32, !283, null}
!1352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1353, file: !1211, line: 168)
!1353 = !DISubprogram(name: "vscanf", scope: !330, file: !330, line: 437, type: !1354, flags: DIFlagPrototyped, spFlags: 0)
!1354 = !DISubroutineType(types: !1355)
!1355 = !{!32, !283, !1249}
!1356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1357, file: !1211, line: 170)
!1357 = !DISubprogram(name: "printf", scope: !1358, file: !1358, line: 34, type: !1350, flags: DIFlagPrototyped, spFlags: 0)
!1358 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_printf.h", directory: "", checksumkind: CSK_MD5, checksum: "2d37517bd0342aa326aa1d3660ad4ab4")
!1359 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1360, file: !1211, line: 171)
!1360 = !DISubprogram(name: "putchar", scope: !330, file: !330, line: 266, type: !203, flags: DIFlagPrototyped, spFlags: 0)
!1361 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1362, file: !1211, line: 172)
!1362 = !DISubprogram(name: "puts", scope: !330, file: !330, line: 267, type: !1068, flags: DIFlagPrototyped, spFlags: 0)
!1363 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !120, entity: !1364, file: !1211, line: 173)
!1364 = !DISubprogram(name: "vprintf", scope: !330, file: !330, line: 293, type: !1354, flags: DIFlagPrototyped, spFlags: 0)
!1365 = !DICompositeType(tag: DW_TAG_array_type, baseType: !32, size: 192, elements: !1366)
!1366 = !{!34, !1367}
!1367 = !DISubrange(count: 2)
!1368 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 4]}
!1369 = !{i32 7, !"Dwarf Version", i32 5}
!1370 = !{i32 2, !"Debug Info Version", i32 3}
!1371 = !{i32 1, !"wchar_size", i32 4}
!1372 = !{i32 8, !"PIC Level", i32 2}
!1373 = !{i32 7, !"uwtable", i32 1}
!1374 = !{i32 7, !"frame-pointer", i32 1}
!1375 = !{!"Homebrew clang version 20.1.8"}
!1376 = distinct !DISubprogram(name: "oflow_check", linkageName: "_Z11oflow_checkii", scope: !2, file: !2, line: 71, type: !1377, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !1379)
!1377 = !DISubroutineType(types: !1378)
!1378 = !{!32, !28, !28}
!1379 = !{}
!1380 = !DILocalVariable(name: "a", arg: 1, scope: !1376, file: !2, line: 71, type: !28)
!1381 = !DILocation(line: 71, column: 21, scope: !1376)
!1382 = !DILocalVariable(name: "b", arg: 2, scope: !1376, file: !2, line: 71, type: !28)
!1383 = !DILocation(line: 71, column: 28, scope: !1376)
!1384 = !DILocalVariable(name: "tmp", scope: !1376, file: !2, line: 73, type: !18)
!1385 = !DILocation(line: 73, column: 10, scope: !1376)
!1386 = !DILocation(line: 73, column: 29, scope: !1376)
!1387 = !DILocation(line: 73, column: 25, scope: !1376)
!1388 = !DILocation(line: 73, column: 47, scope: !1376)
!1389 = !DILocation(line: 73, column: 43, scope: !1376)
!1390 = !DILocation(line: 73, column: 32, scope: !1376)
!1391 = !DILocation(line: 74, column: 10, scope: !1376)
!1392 = !DILocation(line: 74, column: 14, scope: !1376)
!1393 = !DILocation(line: 74, column: 9, scope: !1376)
!1394 = !DILocation(line: 74, column: 2, scope: !1376)
!1395 = distinct !DISubprogram(name: "find_plane_line_intersection", linkageName: "_Z28find_plane_line_intersectionP10vms_vectorS0_S0_S0_S0_i", scope: !2, file: !2, line: 91, type: !1396, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !1379)
!1396 = !DISubroutineType(types: !1397)
!1397 = !{!32, !1398, !1398, !1398, !1398, !1398, !28}
!1398 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!1399 = !DILocalVariable(name: "new_pnt", arg: 1, scope: !1395, file: !2, line: 91, type: !1398)
!1400 = !DILocation(line: 91, column: 46, scope: !1395)
!1401 = !DILocalVariable(name: "plane_pnt", arg: 2, scope: !1395, file: !2, line: 91, type: !1398)
!1402 = !DILocation(line: 91, column: 66, scope: !1395)
!1403 = !DILocalVariable(name: "plane_norm", arg: 3, scope: !1395, file: !2, line: 91, type: !1398)
!1404 = !DILocation(line: 91, column: 88, scope: !1395)
!1405 = !DILocalVariable(name: "p0", arg: 4, scope: !1395, file: !2, line: 91, type: !1398)
!1406 = !DILocation(line: 91, column: 111, scope: !1395)
!1407 = !DILocalVariable(name: "p1", arg: 5, scope: !1395, file: !2, line: 91, type: !1398)
!1408 = !DILocation(line: 91, column: 126, scope: !1395)
!1409 = !DILocalVariable(name: "rad", arg: 6, scope: !1395, file: !2, line: 91, type: !28)
!1410 = !DILocation(line: 91, column: 133, scope: !1395)
!1411 = !DILocalVariable(name: "d", scope: !1395, file: !2, line: 93, type: !70)
!1412 = !DILocation(line: 93, column: 13, scope: !1395)
!1413 = !DILocalVariable(name: "w", scope: !1395, file: !2, line: 93, type: !70)
!1414 = !DILocation(line: 93, column: 15, scope: !1395)
!1415 = !DILocalVariable(name: "num", scope: !1395, file: !2, line: 94, type: !28)
!1416 = !DILocation(line: 94, column: 6, scope: !1395)
!1417 = !DILocalVariable(name: "den", scope: !1395, file: !2, line: 94, type: !28)
!1418 = !DILocation(line: 94, column: 10, scope: !1395)
!1419 = !DILocation(line: 96, column: 16, scope: !1395)
!1420 = !DILocation(line: 96, column: 19, scope: !1395)
!1421 = !DILocation(line: 96, column: 2, scope: !1395)
!1422 = !DILocation(line: 97, column: 16, scope: !1395)
!1423 = !DILocation(line: 97, column: 19, scope: !1395)
!1424 = !DILocation(line: 97, column: 2, scope: !1395)
!1425 = !DILocation(line: 99, column: 9, scope: !1395)
!1426 = !DILocation(line: 99, column: 6, scope: !1395)
!1427 = !DILocation(line: 100, column: 9, scope: !1395)
!1428 = !DILocation(line: 100, column: 8, scope: !1395)
!1429 = !DILocation(line: 100, column: 6, scope: !1395)
!1430 = !DILocation(line: 105, column: 9, scope: !1395)
!1431 = !DILocation(line: 105, column: 6, scope: !1395)
!1432 = !DILocation(line: 109, column: 8, scope: !1433)
!1433 = distinct !DILexicalBlock(scope: !1395, file: !2, line: 109, column: 7)
!1434 = !DILocation(line: 109, column: 11, scope: !1433)
!1435 = !DILocation(line: 109, column: 16, scope: !1433)
!1436 = !DILocation(line: 110, column: 6, scope: !1433)
!1437 = !DILocation(line: 110, column: 9, scope: !1433)
!1438 = !DILocation(line: 110, column: 13, scope: !1433)
!1439 = !DILocation(line: 111, column: 7, scope: !1433)
!1440 = !DILocation(line: 111, column: 11, scope: !1433)
!1441 = !DILocation(line: 111, column: 10, scope: !1433)
!1442 = !DILocation(line: 111, column: 16, scope: !1433)
!1443 = !DILocation(line: 112, column: 10, scope: !1433)
!1444 = !DILocation(line: 112, column: 9, scope: !1433)
!1445 = !DILocation(line: 112, column: 13, scope: !1433)
!1446 = !DILocation(line: 112, column: 20, scope: !1433)
!1447 = !DILocation(line: 112, column: 18, scope: !1433)
!1448 = !DILocation(line: 112, column: 25, scope: !1433)
!1449 = !DILocation(line: 113, column: 6, scope: !1433)
!1450 = !DILocation(line: 113, column: 9, scope: !1433)
!1451 = !DILocation(line: 113, column: 12, scope: !1433)
!1452 = !DILocation(line: 113, column: 15, scope: !1433)
!1453 = !DILocation(line: 113, column: 19, scope: !1433)
!1454 = !DILocation(line: 113, column: 18, scope: !1433)
!1455 = !DILocation(line: 114, column: 3, scope: !1433)
!1456 = !DILocalVariable(name: "k", scope: !1457, file: !2, line: 122, type: !28)
!1457 = distinct !DILexicalBlock(scope: !1395, file: !2, line: 121, column: 2)
!1458 = !DILocation(line: 122, column: 7, scope: !1457)
!1459 = !DILocation(line: 124, column: 12, scope: !1460)
!1460 = distinct !DILexicalBlock(scope: !1457, file: !2, line: 124, column: 7)
!1461 = !DILocation(line: 124, column: 7, scope: !1460)
!1462 = !DILocation(line: 124, column: 16, scope: !1460)
!1463 = !DILocation(line: 124, column: 34, scope: !1460)
!1464 = !DILocation(line: 124, column: 29, scope: !1460)
!1465 = !DILocation(line: 124, column: 26, scope: !1460)
!1466 = !DILocation(line: 124, column: 41, scope: !1467)
!1467 = distinct !DILexicalBlock(scope: !1460, file: !2, line: 124, column: 40)
!1468 = !DILocation(line: 124, column: 49, scope: !1467)
!1469 = !DILocation(line: 125, column: 14, scope: !1457)
!1470 = !DILocation(line: 125, column: 18, scope: !1457)
!1471 = !DILocation(line: 125, column: 7, scope: !1457)
!1472 = !DILocation(line: 125, column: 5, scope: !1457)
!1473 = !DILocation(line: 127, column: 3, scope: !1457)
!1474 = !DILocation(line: 130, column: 21, scope: !1475)
!1475 = distinct !DILexicalBlock(scope: !1457, file: !2, line: 130, column: 7)
!1476 = !DILocation(line: 130, column: 23, scope: !1475)
!1477 = !DILocation(line: 130, column: 7, scope: !1475)
!1478 = !DILocation(line: 130, column: 26, scope: !1475)
!1479 = !DILocation(line: 130, column: 43, scope: !1475)
!1480 = !DILocation(line: 130, column: 45, scope: !1475)
!1481 = !DILocation(line: 130, column: 29, scope: !1475)
!1482 = !DILocation(line: 130, column: 48, scope: !1475)
!1483 = !DILocation(line: 130, column: 65, scope: !1475)
!1484 = !DILocation(line: 130, column: 67, scope: !1475)
!1485 = !DILocation(line: 130, column: 51, scope: !1475)
!1486 = !DILocation(line: 130, column: 71, scope: !1475)
!1487 = !DILocation(line: 136, column: 19, scope: !1395)
!1488 = !DILocation(line: 136, column: 23, scope: !1395)
!1489 = !DILocation(line: 136, column: 2, scope: !1395)
!1490 = !DILocation(line: 138, column: 13, scope: !1395)
!1491 = !DILocation(line: 138, column: 21, scope: !1395)
!1492 = !DILocation(line: 138, column: 2, scope: !1395)
!1493 = !DILocation(line: 142, column: 2, scope: !1395)
!1494 = !DILocation(line: 144, column: 1, scope: !1395)
!1495 = distinct !DISubprogram(name: "fixdiv", linkageName: "_Z6fixdivii", scope: !29, file: !29, line: 89, type: !1496, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !1379)
!1496 = !DISubroutineType(types: !1497)
!1497 = !{!28, !28, !28}
!1498 = !DILocalVariable(name: "a", arg: 1, scope: !1495, file: !29, line: 89, type: !28)
!1499 = !DILocation(line: 89, column: 26, scope: !1495)
!1500 = !DILocalVariable(name: "b", arg: 2, scope: !1495, file: !29, line: 89, type: !28)
!1501 = !DILocation(line: 89, column: 33, scope: !1495)
!1502 = !DILocation(line: 92, column: 6, scope: !1503)
!1503 = distinct !DILexicalBlock(scope: !1495, file: !29, line: 92, column: 6)
!1504 = !DILocation(line: 92, column: 8, scope: !1503)
!1505 = !DILocation(line: 92, column: 14, scope: !1503)
!1506 = !DILocation(line: 94, column: 25, scope: !1495)
!1507 = !DILocation(line: 94, column: 27, scope: !1495)
!1508 = !DILocation(line: 94, column: 36, scope: !1495)
!1509 = !DILocation(line: 94, column: 34, scope: !1495)
!1510 = !DILocation(line: 94, column: 14, scope: !1495)
!1511 = !DILocation(line: 94, column: 2, scope: !1495)
!1512 = !DILocation(line: 95, column: 1, scope: !1495)
!1513 = distinct !DISubprogram(name: "check_point_to_face", linkageName: "_Z19check_point_to_faceP10vms_vectorP4sideiiPi", scope: !2, file: !2, line: 165, type: !1514, scopeLine: 166, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !1379)
!1514 = !DISubroutineType(types: !1515)
!1515 = !{!140, !1398, !1516, !32, !32, !35}
!1516 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1517, size: 64)
!1517 = !DIDerivedType(tag: DW_TAG_typedef, name: "side", file: !1518, line: 91, baseType: !1519)
!1518 = !DIFile(filename: "main_d2/segment.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "c950815a9b07e6bab2fa2587b90affec")
!1519 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "side", file: !1518, line: 82, size: 640, flags: DIFlagTypePassByValue, elements: !1520, identifier: "_ZTS4side")
!1520 = !{!1521, !1522, !1523, !1524, !1525, !1526, !1536}
!1521 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !1519, file: !1518, line: 84, baseType: !122, size: 8)
!1522 = !DIDerivedType(tag: DW_TAG_member, name: "pad", scope: !1519, file: !1518, line: 85, baseType: !132, size: 8, offset: 8)
!1523 = !DIDerivedType(tag: DW_TAG_member, name: "wall_num", scope: !1519, file: !1518, line: 86, baseType: !55, size: 16, offset: 16)
!1524 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_num", scope: !1519, file: !1518, line: 87, baseType: !55, size: 16, offset: 32)
!1525 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_num2", scope: !1519, file: !1518, line: 88, baseType: !55, size: 16, offset: 48)
!1526 = !DIDerivedType(tag: DW_TAG_member, name: "uvls", scope: !1519, file: !1518, line: 89, baseType: !1527, size: 384, offset: 64)
!1527 = !DICompositeType(tag: DW_TAG_array_type, baseType: !1528, size: 384, elements: !1534)
!1528 = !DIDerivedType(tag: DW_TAG_typedef, name: "uvl", file: !1518, line: 67, baseType: !1529)
!1529 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uvl", file: !1518, line: 64, size: 96, flags: DIFlagTypePassByValue, elements: !1530, identifier: "_ZTS3uvl")
!1530 = !{!1531, !1532, !1533}
!1531 = !DIDerivedType(tag: DW_TAG_member, name: "u", scope: !1529, file: !1518, line: 66, baseType: !28, size: 32)
!1532 = !DIDerivedType(tag: DW_TAG_member, name: "v", scope: !1529, file: !1518, line: 66, baseType: !28, size: 32, offset: 32)
!1533 = !DIDerivedType(tag: DW_TAG_member, name: "l", scope: !1529, file: !1518, line: 66, baseType: !28, size: 32, offset: 64)
!1534 = !{!1535}
!1535 = !DISubrange(count: 4)
!1536 = !DIDerivedType(tag: DW_TAG_member, name: "normals", scope: !1519, file: !1518, line: 90, baseType: !1537, size: 192, offset: 448)
!1537 = !DICompositeType(tag: DW_TAG_array_type, baseType: !70, size: 192, elements: !1538)
!1538 = !{!1367}
!1539 = !DILocalVariable(name: "checkp", arg: 1, scope: !1513, file: !2, line: 165, type: !1398)
!1540 = !DILocation(line: 165, column: 42, scope: !1513)
!1541 = !DILocalVariable(name: "s", arg: 2, scope: !1513, file: !2, line: 165, type: !1516)
!1542 = !DILocation(line: 165, column: 56, scope: !1513)
!1543 = !DILocalVariable(name: "facenum", arg: 3, scope: !1513, file: !2, line: 165, type: !32)
!1544 = !DILocation(line: 165, column: 62, scope: !1513)
!1545 = !DILocalVariable(name: "nv", arg: 4, scope: !1513, file: !2, line: 165, type: !32)
!1546 = !DILocation(line: 165, column: 74, scope: !1513)
!1547 = !DILocalVariable(name: "vertex_list", arg: 5, scope: !1513, file: !2, line: 165, type: !35)
!1548 = !DILocation(line: 165, column: 82, scope: !1513)
!1549 = !DILocalVariable(name: "checkp_array", scope: !1513, file: !2, line: 167, type: !21)
!1550 = !DILocation(line: 167, column: 20, scope: !1513)
!1551 = !DILocalVariable(name: "norm", scope: !1513, file: !2, line: 168, type: !22)
!1552 = !DILocation(line: 168, column: 19, scope: !1513)
!1553 = !DILocalVariable(name: "t", scope: !1513, file: !2, line: 169, type: !70)
!1554 = !DILocation(line: 169, column: 13, scope: !1513)
!1555 = !DILocalVariable(name: "biggest", scope: !1513, file: !2, line: 170, type: !32)
!1556 = !DILocation(line: 170, column: 6, scope: !1513)
!1557 = !DILocalVariable(name: "i", scope: !1513, file: !2, line: 172, type: !32)
!1558 = !DILocation(line: 172, column: 6, scope: !1513)
!1559 = !DILocalVariable(name: "j", scope: !1513, file: !2, line: 172, type: !32)
!1560 = !DILocation(line: 172, column: 8, scope: !1513)
!1561 = !DILocalVariable(name: "edge", scope: !1513, file: !2, line: 172, type: !32)
!1562 = !DILocation(line: 172, column: 10, scope: !1513)
!1563 = !DILocalVariable(name: "edgemask", scope: !1513, file: !2, line: 173, type: !140)
!1564 = !DILocation(line: 173, column: 11, scope: !1513)
!1565 = !DILocalVariable(name: "check_i", scope: !1513, file: !2, line: 174, type: !28)
!1566 = !DILocation(line: 174, column: 6, scope: !1513)
!1567 = !DILocalVariable(name: "check_j", scope: !1513, file: !2, line: 174, type: !28)
!1568 = !DILocation(line: 174, column: 14, scope: !1513)
!1569 = !DILocalVariable(name: "v0", scope: !1513, file: !2, line: 175, type: !21)
!1570 = !DILocation(line: 175, column: 20, scope: !1513)
!1571 = !DILocalVariable(name: "v1", scope: !1513, file: !2, line: 175, type: !21)
!1572 = !DILocation(line: 175, column: 24, scope: !1513)
!1573 = !DILocation(line: 180, column: 19, scope: !1513)
!1574 = !DILocation(line: 180, column: 22, scope: !1513)
!1575 = !DILocation(line: 180, column: 30, scope: !1513)
!1576 = !DILocation(line: 180, column: 3, scope: !1513)
!1577 = !DILocation(line: 182, column: 37, scope: !1513)
!1578 = !DILocation(line: 182, column: 15, scope: !1513)
!1579 = !DILocation(line: 187, column: 18, scope: !1513)
!1580 = !DILocation(line: 187, column: 13, scope: !1513)
!1581 = !DILocation(line: 187, column: 8, scope: !1513)
!1582 = !DILocation(line: 187, column: 4, scope: !1513)
!1583 = !DILocation(line: 187, column: 6, scope: !1513)
!1584 = !DILocation(line: 187, column: 43, scope: !1513)
!1585 = !DILocation(line: 187, column: 38, scope: !1513)
!1586 = !DILocation(line: 187, column: 33, scope: !1513)
!1587 = !DILocation(line: 187, column: 29, scope: !1513)
!1588 = !DILocation(line: 187, column: 31, scope: !1513)
!1589 = !DILocation(line: 187, column: 68, scope: !1513)
!1590 = !DILocation(line: 187, column: 63, scope: !1513)
!1591 = !DILocation(line: 187, column: 58, scope: !1513)
!1592 = !DILocation(line: 187, column: 54, scope: !1513)
!1593 = !DILocation(line: 187, column: 56, scope: !1513)
!1594 = !DILocation(line: 189, column: 8, scope: !1595)
!1595 = distinct !DILexicalBlock(scope: !1513, file: !2, line: 189, column: 6)
!1596 = !DILocation(line: 189, column: 14, scope: !1595)
!1597 = !DILocation(line: 189, column: 10, scope: !1595)
!1598 = !DILocation(line: 189, column: 23, scope: !1599)
!1599 = distinct !DILexicalBlock(scope: !1595, file: !2, line: 189, column: 21)
!1600 = !DILocation(line: 189, column: 29, scope: !1599)
!1601 = !DILocation(line: 189, column: 25, scope: !1599)
!1602 = !DILocation(line: 189, column: 39, scope: !1599)
!1603 = !DILocation(line: 189, column: 32, scope: !1599)
!1604 = !DILocation(line: 189, column: 55, scope: !1599)
!1605 = !DILocation(line: 190, column: 13, scope: !1606)
!1606 = distinct !DILexicalBlock(scope: !1595, file: !2, line: 190, column: 11)
!1607 = !DILocation(line: 190, column: 19, scope: !1606)
!1608 = !DILocation(line: 190, column: 15, scope: !1606)
!1609 = !DILocation(line: 190, column: 29, scope: !1606)
!1610 = !DILocation(line: 190, column: 22, scope: !1606)
!1611 = !DILocation(line: 190, column: 45, scope: !1606)
!1612 = !DILocation(line: 192, column: 11, scope: !1613)
!1613 = distinct !DILexicalBlock(scope: !1513, file: !2, line: 192, column: 6)
!1614 = !DILocation(line: 192, column: 15, scope: !1613)
!1615 = !DILocation(line: 192, column: 6, scope: !1613)
!1616 = !DILocation(line: 192, column: 24, scope: !1613)
!1617 = !DILocation(line: 193, column: 16, scope: !1618)
!1618 = distinct !DILexicalBlock(scope: !1613, file: !2, line: 192, column: 29)
!1619 = !DILocation(line: 193, column: 7, scope: !1618)
!1620 = !DILocation(line: 193, column: 5, scope: !1618)
!1621 = !DILocation(line: 194, column: 16, scope: !1618)
!1622 = !DILocation(line: 194, column: 7, scope: !1618)
!1623 = !DILocation(line: 194, column: 5, scope: !1618)
!1624 = !DILocation(line: 195, column: 2, scope: !1618)
!1625 = !DILocation(line: 197, column: 16, scope: !1626)
!1626 = distinct !DILexicalBlock(scope: !1613, file: !2, line: 196, column: 7)
!1627 = !DILocation(line: 197, column: 7, scope: !1626)
!1628 = !DILocation(line: 197, column: 5, scope: !1626)
!1629 = !DILocation(line: 198, column: 16, scope: !1626)
!1630 = !DILocation(line: 198, column: 7, scope: !1626)
!1631 = !DILocation(line: 198, column: 5, scope: !1626)
!1632 = !DILocation(line: 203, column: 12, scope: !1513)
!1633 = !DILocation(line: 203, column: 26, scope: !1513)
!1634 = !DILocation(line: 203, column: 30, scope: !1513)
!1635 = !DILocation(line: 203, column: 10, scope: !1513)
!1636 = !DILocation(line: 204, column: 12, scope: !1513)
!1637 = !DILocation(line: 204, column: 26, scope: !1513)
!1638 = !DILocation(line: 204, column: 30, scope: !1513)
!1639 = !DILocation(line: 204, column: 10, scope: !1513)
!1640 = !DILocation(line: 206, column: 20, scope: !1641)
!1641 = distinct !DILexicalBlock(scope: !1513, file: !2, line: 206, column: 2)
!1642 = !DILocation(line: 206, column: 11, scope: !1641)
!1643 = !DILocation(line: 206, column: 7, scope: !1641)
!1644 = !DILocation(line: 206, column: 23, scope: !1645)
!1645 = distinct !DILexicalBlock(scope: !1641, file: !2, line: 206, column: 2)
!1646 = !DILocation(line: 206, column: 28, scope: !1645)
!1647 = !DILocation(line: 206, column: 27, scope: !1645)
!1648 = !DILocation(line: 206, column: 2, scope: !1641)
!1649 = !DILocalVariable(name: "edgevec", scope: !1650, file: !2, line: 208, type: !1651)
!1650 = distinct !DILexicalBlock(scope: !1645, file: !2, line: 207, column: 2)
!1651 = !DIDerivedType(tag: DW_TAG_typedef, name: "vec2d", file: !2, line: 148, baseType: !1652)
!1652 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vec2d", file: !2, line: 146, size: 64, flags: DIFlagTypePassByValue, elements: !1653, identifier: "_ZTS5vec2d")
!1653 = !{!1654, !1655}
!1654 = !DIDerivedType(tag: DW_TAG_member, name: "i", scope: !1652, file: !2, line: 147, baseType: !28, size: 32)
!1655 = !DIDerivedType(tag: DW_TAG_member, name: "j", scope: !1652, file: !2, line: 147, baseType: !28, size: 32, offset: 32)
!1656 = !DILocation(line: 208, column: 9, scope: !1650)
!1657 = !DILocalVariable(name: "checkvec", scope: !1650, file: !2, line: 208, type: !1651)
!1658 = !DILocation(line: 208, column: 17, scope: !1650)
!1659 = !DILocalVariable(name: "d", scope: !1650, file: !2, line: 209, type: !28)
!1660 = !DILocation(line: 209, column: 7, scope: !1650)
!1661 = !DILocation(line: 211, column: 38, scope: !1650)
!1662 = !DILocation(line: 211, column: 50, scope: !1650)
!1663 = !DILocation(line: 211, column: 57, scope: !1650)
!1664 = !DILocation(line: 211, column: 60, scope: !1650)
!1665 = !DILocation(line: 211, column: 59, scope: !1650)
!1666 = !DILocation(line: 211, column: 29, scope: !1650)
!1667 = !DILocation(line: 211, column: 6, scope: !1650)
!1668 = !DILocation(line: 212, column: 38, scope: !1650)
!1669 = !DILocation(line: 212, column: 50, scope: !1650)
!1670 = !DILocation(line: 212, column: 57, scope: !1650)
!1671 = !DILocation(line: 212, column: 62, scope: !1650)
!1672 = !DILocation(line: 212, column: 66, scope: !1650)
!1673 = !DILocation(line: 212, column: 70, scope: !1650)
!1674 = !DILocation(line: 212, column: 69, scope: !1650)
!1675 = !DILocation(line: 212, column: 59, scope: !1650)
!1676 = !DILocation(line: 212, column: 29, scope: !1650)
!1677 = !DILocation(line: 212, column: 6, scope: !1650)
!1678 = !DILocation(line: 214, column: 15, scope: !1650)
!1679 = !DILocation(line: 214, column: 19, scope: !1650)
!1680 = !DILocation(line: 214, column: 23, scope: !1650)
!1681 = !DILocation(line: 214, column: 28, scope: !1650)
!1682 = !DILocation(line: 214, column: 32, scope: !1650)
!1683 = !DILocation(line: 214, column: 36, scope: !1650)
!1684 = !DILocation(line: 214, column: 26, scope: !1650)
!1685 = !DILocation(line: 214, column: 11, scope: !1650)
!1686 = !DILocation(line: 214, column: 13, scope: !1650)
!1687 = !DILocation(line: 215, column: 15, scope: !1650)
!1688 = !DILocation(line: 215, column: 19, scope: !1650)
!1689 = !DILocation(line: 215, column: 23, scope: !1650)
!1690 = !DILocation(line: 215, column: 28, scope: !1650)
!1691 = !DILocation(line: 215, column: 32, scope: !1650)
!1692 = !DILocation(line: 215, column: 36, scope: !1650)
!1693 = !DILocation(line: 215, column: 26, scope: !1650)
!1694 = !DILocation(line: 215, column: 11, scope: !1650)
!1695 = !DILocation(line: 215, column: 13, scope: !1650)
!1696 = !DILocation(line: 217, column: 16, scope: !1650)
!1697 = !DILocation(line: 217, column: 26, scope: !1650)
!1698 = !DILocation(line: 217, column: 30, scope: !1650)
!1699 = !DILocation(line: 217, column: 34, scope: !1650)
!1700 = !DILocation(line: 217, column: 24, scope: !1650)
!1701 = !DILocation(line: 217, column: 12, scope: !1650)
!1702 = !DILocation(line: 217, column: 14, scope: !1650)
!1703 = !DILocation(line: 218, column: 16, scope: !1650)
!1704 = !DILocation(line: 218, column: 26, scope: !1650)
!1705 = !DILocation(line: 218, column: 30, scope: !1650)
!1706 = !DILocation(line: 218, column: 34, scope: !1650)
!1707 = !DILocation(line: 218, column: 24, scope: !1650)
!1708 = !DILocation(line: 218, column: 12, scope: !1650)
!1709 = !DILocation(line: 218, column: 14, scope: !1650)
!1710 = !DILocation(line: 220, column: 23, scope: !1650)
!1711 = !DILocation(line: 220, column: 33, scope: !1650)
!1712 = !DILocation(line: 220, column: 7, scope: !1650)
!1713 = !DILocation(line: 220, column: 54, scope: !1650)
!1714 = !DILocation(line: 220, column: 64, scope: !1650)
!1715 = !DILocation(line: 220, column: 38, scope: !1650)
!1716 = !DILocation(line: 220, column: 36, scope: !1650)
!1717 = !DILocation(line: 220, column: 5, scope: !1650)
!1718 = !DILocation(line: 222, column: 7, scope: !1719)
!1719 = distinct !DILexicalBlock(scope: !1650, file: !2, line: 222, column: 7)
!1720 = !DILocation(line: 222, column: 9, scope: !1719)
!1721 = !DILocation(line: 223, column: 20, scope: !1719)
!1722 = !DILocation(line: 223, column: 18, scope: !1719)
!1723 = !DILocation(line: 223, column: 13, scope: !1719)
!1724 = !DILocation(line: 223, column: 4, scope: !1719)
!1725 = !DILocation(line: 224, column: 2, scope: !1650)
!1726 = !DILocation(line: 206, column: 35, scope: !1645)
!1727 = !DILocation(line: 206, column: 2, scope: !1645)
!1728 = distinct !{!1728, !1648, !1729, !1730}
!1729 = !DILocation(line: 224, column: 2, scope: !1641)
!1730 = !{!"llvm.loop.mustprogress"}
!1731 = !DILocation(line: 226, column: 9, scope: !1513)
!1732 = !DILocation(line: 226, column: 2, scope: !1513)
!1733 = distinct !DISubprogram(name: "fixmul", linkageName: "_Z6fixmulii", scope: !29, file: !29, line: 83, type: !1496, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !1379)
!1734 = !DILocalVariable(name: "a", arg: 1, scope: !1733, file: !29, line: 83, type: !28)
!1735 = !DILocation(line: 83, column: 26, scope: !1733)
!1736 = !DILocalVariable(name: "b", arg: 2, scope: !1733, file: !29, line: 83, type: !28)
!1737 = !DILocation(line: 83, column: 33, scope: !1733)
!1738 = !DILocation(line: 85, column: 19, scope: !1733)
!1739 = !DILocation(line: 85, column: 32, scope: !1733)
!1740 = !DILocation(line: 85, column: 21, scope: !1733)
!1741 = !DILocation(line: 85, column: 35, scope: !1733)
!1742 = !DILocation(line: 85, column: 9, scope: !1733)
!1743 = !DILocation(line: 85, column: 2, scope: !1733)
!1744 = distinct !DISubprogram(name: "check_sphere_to_face", linkageName: "_Z20check_sphere_to_faceP10vms_vectorP4sideiiiPi", scope: !2, file: !2, line: 232, type: !1745, scopeLine: 233, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !1379)
!1745 = !DISubroutineType(types: !1746)
!1746 = !{!32, !1398, !1516, !32, !32, !28, !35}
!1747 = !DILocalVariable(name: "pnt", arg: 1, scope: !1744, file: !2, line: 232, type: !1398)
!1748 = !DILocation(line: 232, column: 38, scope: !1744)
!1749 = !DILocalVariable(name: "s", arg: 2, scope: !1744, file: !2, line: 232, type: !1516)
!1750 = !DILocation(line: 232, column: 49, scope: !1744)
!1751 = !DILocalVariable(name: "facenum", arg: 3, scope: !1744, file: !2, line: 232, type: !32)
!1752 = !DILocation(line: 232, column: 55, scope: !1744)
!1753 = !DILocalVariable(name: "nv", arg: 4, scope: !1744, file: !2, line: 232, type: !32)
!1754 = !DILocation(line: 232, column: 67, scope: !1744)
!1755 = !DILocalVariable(name: "rad", arg: 5, scope: !1744, file: !2, line: 232, type: !28)
!1756 = !DILocation(line: 232, column: 74, scope: !1744)
!1757 = !DILocalVariable(name: "vertex_list", arg: 6, scope: !1744, file: !2, line: 232, type: !35)
!1758 = !DILocation(line: 232, column: 83, scope: !1744)
!1759 = !DILocalVariable(name: "checkp", scope: !1744, file: !2, line: 234, type: !70)
!1760 = !DILocation(line: 234, column: 13, scope: !1744)
!1761 = !DILocation(line: 234, column: 21, scope: !1744)
!1762 = !DILocation(line: 234, column: 20, scope: !1744)
!1763 = !DILocalVariable(name: "edgemask", scope: !1744, file: !2, line: 235, type: !140)
!1764 = !DILocation(line: 235, column: 11, scope: !1744)
!1765 = !DILocation(line: 239, column: 33, scope: !1744)
!1766 = !DILocation(line: 239, column: 37, scope: !1744)
!1767 = !DILocation(line: 239, column: 39, scope: !1744)
!1768 = !DILocation(line: 239, column: 47, scope: !1744)
!1769 = !DILocation(line: 239, column: 50, scope: !1744)
!1770 = !DILocation(line: 239, column: 13, scope: !1744)
!1771 = !DILocation(line: 239, column: 11, scope: !1744)
!1772 = !DILocation(line: 243, column: 6, scope: !1773)
!1773 = distinct !DILexicalBlock(scope: !1744, file: !2, line: 243, column: 6)
!1774 = !DILocation(line: 243, column: 15, scope: !1773)
!1775 = !DILocation(line: 244, column: 3, scope: !1773)
!1776 = !DILocalVariable(name: "edgevec", scope: !1777, file: !2, line: 246, type: !70)
!1777 = distinct !DILexicalBlock(scope: !1773, file: !2, line: 245, column: 7)
!1778 = !DILocation(line: 246, column: 14, scope: !1777)
!1779 = !DILocalVariable(name: "checkvec", scope: !1777, file: !2, line: 246, type: !70)
!1780 = !DILocation(line: 246, column: 22, scope: !1777)
!1781 = !DILocalVariable(name: "closest_point", scope: !1777, file: !2, line: 247, type: !70)
!1782 = !DILocation(line: 247, column: 14, scope: !1777)
!1783 = !DILocalVariable(name: "edgelen", scope: !1777, file: !2, line: 248, type: !28)
!1784 = !DILocation(line: 248, column: 7, scope: !1777)
!1785 = !DILocalVariable(name: "d", scope: !1777, file: !2, line: 248, type: !28)
!1786 = !DILocation(line: 248, column: 15, scope: !1777)
!1787 = !DILocalVariable(name: "dist", scope: !1777, file: !2, line: 248, type: !28)
!1788 = !DILocation(line: 248, column: 17, scope: !1777)
!1789 = !DILocalVariable(name: "v0", scope: !1777, file: !2, line: 249, type: !1398)
!1790 = !DILocation(line: 249, column: 15, scope: !1777)
!1791 = !DILocalVariable(name: "v1", scope: !1777, file: !2, line: 249, type: !1398)
!1792 = !DILocation(line: 249, column: 19, scope: !1777)
!1793 = !DILocalVariable(name: "itype", scope: !1777, file: !2, line: 250, type: !32)
!1794 = !DILocation(line: 250, column: 7, scope: !1777)
!1795 = !DILocalVariable(name: "edgenum", scope: !1777, file: !2, line: 251, type: !32)
!1796 = !DILocation(line: 251, column: 7, scope: !1777)
!1797 = !DILocation(line: 255, column: 15, scope: !1798)
!1798 = distinct !DILexicalBlock(scope: !1777, file: !2, line: 255, column: 3)
!1799 = !DILocation(line: 255, column: 8, scope: !1798)
!1800 = !DILocation(line: 255, column: 20, scope: !1801)
!1801 = distinct !DILexicalBlock(scope: !1798, file: !2, line: 255, column: 3)
!1802 = !DILocation(line: 255, column: 28, scope: !1801)
!1803 = !DILocation(line: 255, column: 19, scope: !1801)
!1804 = !DILocation(line: 255, column: 18, scope: !1801)
!1805 = !DILocation(line: 255, column: 3, scope: !1798)
!1806 = !DILocation(line: 255, column: 41, scope: !1801)
!1807 = !DILocation(line: 255, column: 54, scope: !1801)
!1808 = !DILocation(line: 255, column: 3, scope: !1801)
!1809 = distinct !{!1809, !1805, !1810, !1730}
!1810 = !DILocation(line: 255, column: 57, scope: !1798)
!1811 = !DILocation(line: 257, column: 18, scope: !1777)
!1812 = !DILocation(line: 257, column: 30, scope: !1777)
!1813 = !DILocation(line: 257, column: 37, scope: !1777)
!1814 = !DILocation(line: 257, column: 40, scope: !1777)
!1815 = !DILocation(line: 257, column: 39, scope: !1777)
!1816 = !DILocation(line: 257, column: 9, scope: !1777)
!1817 = !DILocation(line: 257, column: 6, scope: !1777)
!1818 = !DILocation(line: 258, column: 18, scope: !1777)
!1819 = !DILocation(line: 258, column: 30, scope: !1777)
!1820 = !DILocation(line: 258, column: 37, scope: !1777)
!1821 = !DILocation(line: 258, column: 42, scope: !1777)
!1822 = !DILocation(line: 258, column: 49, scope: !1777)
!1823 = !DILocation(line: 258, column: 53, scope: !1777)
!1824 = !DILocation(line: 258, column: 52, scope: !1777)
!1825 = !DILocation(line: 258, column: 39, scope: !1777)
!1826 = !DILocation(line: 258, column: 9, scope: !1777)
!1827 = !DILocation(line: 258, column: 6, scope: !1777)
!1828 = !DILocation(line: 262, column: 32, scope: !1777)
!1829 = !DILocation(line: 262, column: 3, scope: !1777)
!1830 = !DILocation(line: 263, column: 44, scope: !1777)
!1831 = !DILocation(line: 263, column: 47, scope: !1777)
!1832 = !DILocation(line: 263, column: 13, scope: !1777)
!1833 = !DILocation(line: 263, column: 11, scope: !1777)
!1834 = !DILocation(line: 267, column: 7, scope: !1777)
!1835 = !DILocation(line: 267, column: 5, scope: !1777)
!1836 = !DILocation(line: 269, column: 7, scope: !1837)
!1837 = distinct !DILexicalBlock(scope: !1777, file: !2, line: 269, column: 7)
!1838 = !DILocation(line: 269, column: 9, scope: !1837)
!1839 = !DILocation(line: 269, column: 8, scope: !1837)
!1840 = !DILocation(line: 269, column: 13, scope: !1837)
!1841 = !DILocation(line: 269, column: 18, scope: !1837)
!1842 = !DILocation(line: 271, column: 7, scope: !1843)
!1843 = distinct !DILexicalBlock(scope: !1777, file: !2, line: 271, column: 7)
!1844 = !DILocation(line: 271, column: 9, scope: !1843)
!1845 = !DILocation(line: 271, column: 8, scope: !1843)
!1846 = !DILocation(line: 271, column: 15, scope: !1843)
!1847 = !DILocation(line: 271, column: 13, scope: !1843)
!1848 = !DILocation(line: 271, column: 24, scope: !1843)
!1849 = !DILocation(line: 275, column: 9, scope: !1777)
!1850 = !DILocation(line: 277, column: 7, scope: !1851)
!1851 = distinct !DILexicalBlock(scope: !1777, file: !2, line: 277, column: 7)
!1852 = !DILocation(line: 277, column: 9, scope: !1851)
!1853 = !DILocation(line: 277, column: 31, scope: !1851)
!1854 = !DILocation(line: 277, column: 28, scope: !1851)
!1855 = !DILocation(line: 277, column: 14, scope: !1851)
!1856 = !DILocation(line: 278, column: 12, scope: !1857)
!1857 = distinct !DILexicalBlock(scope: !1851, file: !2, line: 278, column: 12)
!1858 = !DILocation(line: 278, column: 16, scope: !1857)
!1859 = !DILocation(line: 278, column: 14, scope: !1857)
!1860 = !DILocation(line: 278, column: 42, scope: !1857)
!1861 = !DILocation(line: 278, column: 39, scope: !1857)
!1862 = !DILocation(line: 278, column: 25, scope: !1857)
!1863 = !DILocation(line: 280, column: 10, scope: !1864)
!1864 = distinct !DILexicalBlock(scope: !1857, file: !2, line: 279, column: 8)
!1865 = !DILocation(line: 285, column: 36, scope: !1864)
!1866 = !DILocation(line: 285, column: 48, scope: !1864)
!1867 = !DILocation(line: 285, column: 4, scope: !1864)
!1868 = !DILocation(line: 288, column: 10, scope: !1777)
!1869 = !DILocation(line: 288, column: 8, scope: !1777)
!1870 = !DILocation(line: 290, column: 7, scope: !1871)
!1871 = distinct !DILexicalBlock(scope: !1777, file: !2, line: 290, column: 7)
!1872 = !DILocation(line: 290, column: 15, scope: !1871)
!1873 = !DILocation(line: 290, column: 12, scope: !1871)
!1874 = !DILocation(line: 291, column: 12, scope: !1871)
!1875 = !DILocation(line: 291, column: 17, scope: !1871)
!1876 = !DILocation(line: 291, column: 11, scope: !1871)
!1877 = !DILocation(line: 291, column: 37, scope: !1871)
!1878 = !DILocation(line: 291, column: 4, scope: !1871)
!1879 = !DILocation(line: 293, column: 4, scope: !1871)
!1880 = !DILocation(line: 297, column: 1, scope: !1744)
!1881 = distinct !DISubprogram(name: "check_line_to_face", linkageName: "_Z18check_line_to_faceP10vms_vectorS0_S0_P7segmentiiii", scope: !2, file: !2, line: 303, type: !1882, scopeLine: 304, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !1379)
!1882 = !DISubroutineType(types: !1883)
!1883 = !{!32, !1398, !1398, !1398, !1884, !32, !32, !32, !28}
!1884 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1885, size: 64)
!1885 = !DIDerivedType(tag: DW_TAG_typedef, name: "segment", file: !1518, line: 123, baseType: !1886)
!1886 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "segment", file: !1518, line: 100, size: 4096, flags: DIFlagTypePassByValue, elements: !1887, identifier: "_ZTS7segment")
!1887 = !{!1888, !1892, !1894, !1896}
!1888 = !DIDerivedType(tag: DW_TAG_member, name: "sides", scope: !1886, file: !1518, line: 105, baseType: !1889, size: 3840)
!1889 = !DICompositeType(tag: DW_TAG_array_type, baseType: !1517, size: 3840, elements: !1890)
!1890 = !{!1891}
!1891 = !DISubrange(count: 6)
!1892 = !DIDerivedType(tag: DW_TAG_member, name: "children", scope: !1886, file: !1518, line: 106, baseType: !1893, size: 96, offset: 3840)
!1893 = !DICompositeType(tag: DW_TAG_array_type, baseType: !55, size: 96, elements: !1890)
!1894 = !DIDerivedType(tag: DW_TAG_member, name: "verts", scope: !1886, file: !1518, line: 107, baseType: !1895, size: 128, offset: 3936)
!1895 = !DICompositeType(tag: DW_TAG_array_type, baseType: !55, size: 128, elements: !6)
!1896 = !DIDerivedType(tag: DW_TAG_member, name: "objects", scope: !1886, file: !1518, line: 112, baseType: !32, size: 32, offset: 4064)
!1897 = !DILocalVariable(name: "newp", arg: 1, scope: !1881, file: !2, line: 303, type: !1398)
!1898 = !DILocation(line: 303, column: 36, scope: !1881)
!1899 = !DILocalVariable(name: "p0", arg: 2, scope: !1881, file: !2, line: 303, type: !1398)
!1900 = !DILocation(line: 303, column: 53, scope: !1881)
!1901 = !DILocalVariable(name: "p1", arg: 3, scope: !1881, file: !2, line: 303, type: !1398)
!1902 = !DILocation(line: 303, column: 68, scope: !1881)
!1903 = !DILocalVariable(name: "seg", arg: 4, scope: !1881, file: !2, line: 303, type: !1884)
!1904 = !DILocation(line: 303, column: 80, scope: !1881)
!1905 = !DILocalVariable(name: "side", arg: 5, scope: !1881, file: !2, line: 303, type: !32)
!1906 = !DILocation(line: 303, column: 88, scope: !1881)
!1907 = !DILocalVariable(name: "facenum", arg: 6, scope: !1881, file: !2, line: 303, type: !32)
!1908 = !DILocation(line: 303, column: 97, scope: !1881)
!1909 = !DILocalVariable(name: "nv", arg: 7, scope: !1881, file: !2, line: 303, type: !32)
!1910 = !DILocation(line: 303, column: 109, scope: !1881)
!1911 = !DILocalVariable(name: "rad", arg: 8, scope: !1881, file: !2, line: 303, type: !28)
!1912 = !DILocation(line: 303, column: 116, scope: !1881)
!1913 = !DILocation(line: 305, column: 7, scope: !1914)
!1914 = distinct !DILexicalBlock(scope: !1881, file: !2, line: 305, column: 6)
!1915 = !DILocation(line: 305, column: 10, scope: !1914)
!1916 = !DILocation(line: 305, column: 20, scope: !1914)
!1917 = !DILocation(line: 306, column: 3, scope: !1914)
!1918 = !DILocalVariable(name: "checkp", scope: !1919, file: !2, line: 309, type: !70)
!1919 = distinct !DILexicalBlock(scope: !1881, file: !2, line: 308, column: 2)
!1920 = !DILocation(line: 309, column: 13, scope: !1919)
!1921 = !DILocalVariable(name: "pli", scope: !1919, file: !2, line: 310, type: !32)
!1922 = !DILocation(line: 310, column: 6, scope: !1919)
!1923 = !DILocalVariable(name: "s", scope: !1919, file: !2, line: 311, type: !1924)
!1924 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1519, size: 64)
!1925 = !DILocation(line: 311, column: 15, scope: !1919)
!1926 = !DILocation(line: 311, column: 18, scope: !1919)
!1927 = !DILocation(line: 311, column: 23, scope: !1919)
!1928 = !DILocation(line: 311, column: 29, scope: !1919)
!1929 = !DILocalVariable(name: "vertex_list", scope: !1919, file: !2, line: 312, type: !1930)
!1930 = !DICompositeType(tag: DW_TAG_array_type, baseType: !32, size: 192, elements: !1890)
!1931 = !DILocation(line: 312, column: 6, scope: !1919)
!1932 = !DILocalVariable(name: "num_faces", scope: !1919, file: !2, line: 313, type: !32)
!1933 = !DILocation(line: 313, column: 6, scope: !1919)
!1934 = !DILocalVariable(name: "vertnum", scope: !1919, file: !2, line: 314, type: !32)
!1935 = !DILocation(line: 314, column: 6, scope: !1919)
!1936 = !DILocalVariable(name: "norm", scope: !1919, file: !2, line: 315, type: !70)
!1937 = !DILocation(line: 315, column: 13, scope: !1919)
!1938 = !DILocation(line: 320, column: 10, scope: !1919)
!1939 = !DILocation(line: 320, column: 15, scope: !1919)
!1940 = !DILocation(line: 320, column: 21, scope: !1919)
!1941 = !DILocation(line: 320, column: 27, scope: !1919)
!1942 = !DILocation(line: 320, column: 35, scope: !1919)
!1943 = !DILocation(line: 320, column: 8, scope: !1919)
!1944 = !DILocation(line: 323, column: 37, scope: !1919)
!1945 = !DILocation(line: 323, column: 49, scope: !1919)
!1946 = !DILocation(line: 323, column: 52, scope: !1919)
!1947 = !DILocation(line: 323, column: 62, scope: !1919)
!1948 = !DILocation(line: 323, column: 2, scope: !1919)
!1949 = !DILocation(line: 326, column: 6, scope: !1950)
!1950 = distinct !DILexicalBlock(scope: !1919, file: !2, line: 326, column: 6)
!1951 = !DILocation(line: 326, column: 15, scope: !1950)
!1952 = !DILocation(line: 328, column: 22, scope: !1953)
!1953 = distinct !DILexicalBlock(scope: !1950, file: !2, line: 327, column: 2)
!1954 = !DILocation(line: 328, column: 37, scope: !1953)
!1955 = !DILocation(line: 328, column: 13, scope: !1953)
!1956 = !DILocation(line: 328, column: 11, scope: !1953)
!1957 = !DILocation(line: 329, column: 2, scope: !1953)
!1958 = !DILocalVariable(name: "i", scope: !1959, file: !2, line: 332, type: !32)
!1959 = distinct !DILexicalBlock(scope: !1950, file: !2, line: 331, column: 2)
!1960 = !DILocation(line: 332, column: 7, scope: !1959)
!1961 = !DILocation(line: 333, column: 13, scope: !1959)
!1962 = !DILocation(line: 333, column: 11, scope: !1959)
!1963 = !DILocation(line: 334, column: 9, scope: !1964)
!1964 = distinct !DILexicalBlock(scope: !1959, file: !2, line: 334, column: 3)
!1965 = !DILocation(line: 334, column: 8, scope: !1964)
!1966 = !DILocation(line: 334, column: 12, scope: !1967)
!1967 = distinct !DILexicalBlock(scope: !1964, file: !2, line: 334, column: 3)
!1968 = !DILocation(line: 334, column: 13, scope: !1967)
!1969 = !DILocation(line: 334, column: 3, scope: !1964)
!1970 = !DILocation(line: 335, column: 20, scope: !1971)
!1971 = distinct !DILexicalBlock(scope: !1967, file: !2, line: 335, column: 8)
!1972 = !DILocation(line: 335, column: 8, scope: !1971)
!1973 = !DILocation(line: 335, column: 25, scope: !1971)
!1974 = !DILocation(line: 335, column: 23, scope: !1971)
!1975 = !DILocation(line: 336, column: 27, scope: !1971)
!1976 = !DILocation(line: 336, column: 15, scope: !1971)
!1977 = !DILocation(line: 336, column: 13, scope: !1971)
!1978 = !DILocation(line: 336, column: 5, scope: !1971)
!1979 = !DILocation(line: 334, column: 17, scope: !1967)
!1980 = !DILocation(line: 334, column: 3, scope: !1967)
!1981 = distinct !{!1981, !1969, !1982, !1730}
!1982 = !DILocation(line: 336, column: 28, scope: !1964)
!1983 = !DILocation(line: 339, column: 37, scope: !1919)
!1984 = !DILocation(line: 339, column: 52, scope: !1919)
!1985 = !DILocation(line: 339, column: 43, scope: !1919)
!1986 = !DILocation(line: 339, column: 67, scope: !1919)
!1987 = !DILocation(line: 339, column: 70, scope: !1919)
!1988 = !DILocation(line: 339, column: 73, scope: !1919)
!1989 = !DILocation(line: 339, column: 8, scope: !1919)
!1990 = !DILocation(line: 339, column: 6, scope: !1919)
!1991 = !DILocation(line: 341, column: 7, scope: !1992)
!1992 = distinct !DILexicalBlock(scope: !1919, file: !2, line: 341, column: 6)
!1993 = !DILocation(line: 341, column: 6, scope: !1992)
!1994 = !DILocation(line: 341, column: 12, scope: !1992)
!1995 = !DILocation(line: 343, column: 12, scope: !1919)
!1996 = !DILocation(line: 343, column: 9, scope: !1919)
!1997 = !DILocation(line: 347, column: 6, scope: !1998)
!1998 = distinct !DILexicalBlock(scope: !1919, file: !2, line: 347, column: 6)
!1999 = !DILocation(line: 347, column: 9, scope: !1998)
!2000 = !DILocation(line: 348, column: 36, scope: !1998)
!2001 = !DILocation(line: 348, column: 35, scope: !1998)
!2002 = !DILocation(line: 348, column: 3, scope: !1998)
!2003 = !DILocation(line: 350, column: 38, scope: !1919)
!2004 = !DILocation(line: 350, column: 40, scope: !1919)
!2005 = !DILocation(line: 350, column: 48, scope: !1919)
!2006 = !DILocation(line: 350, column: 51, scope: !1919)
!2007 = !DILocation(line: 350, column: 55, scope: !1919)
!2008 = !DILocation(line: 350, column: 9, scope: !1919)
!2009 = !DILocation(line: 350, column: 2, scope: !1919)
!2010 = !DILocation(line: 352, column: 1, scope: !1881)
!2011 = distinct !DISubprogram(name: "min<int>", linkageName: "_ZNSt3__13minB8ne200100IiEERKT_S3_S3_", scope: !120, file: !2012, line: 35, type: !2013, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, templateParams: !2016, retainedNodes: !1379)
!2012 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__algorithm/min.h", directory: "")
!2013 = !DISubroutineType(types: !2014)
!2014 = !{!2015, !2015, !2015}
!2015 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !117, size: 64)
!2016 = !{!2017}
!2017 = !DITemplateTypeParameter(name: "_Tp", type: !32)
!2018 = !DILocalVariable(name: "__a", arg: 1, scope: !2011, file: !2012, line: 35, type: !2015)
!2019 = !DILocation(line: 35, column: 38, scope: !2011)
!2020 = !DILocalVariable(name: "__b", arg: 2, scope: !2011, file: !2012, line: 35, type: !2015)
!2021 = !DILocation(line: 35, column: 76, scope: !2011)
!2022 = !DILocation(line: 36, column: 19, scope: !2011)
!2023 = !DILocation(line: 36, column: 24, scope: !2011)
!2024 = !DILocation(line: 36, column: 10, scope: !2011)
!2025 = !DILocation(line: 36, column: 3, scope: !2011)
!2026 = distinct !DISubprogram(name: "calc_det_value", linkageName: "_Z14calc_det_valueP10vms_matrix", scope: !2, file: !2, line: 355, type: !2027, scopeLine: 356, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !1379)
!2027 = !DISubroutineType(types: !2028)
!2028 = !{!28, !2029}
!2029 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2030, size: 64)
!2030 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_matrix", file: !23, line: 47, baseType: !2031)
!2031 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_matrix", file: !23, line: 44, size: 288, flags: DIFlagTypePassByValue, elements: !2032, identifier: "_ZTS10vms_matrix")
!2032 = !{!2033, !2034, !2035}
!2033 = !DIDerivedType(tag: DW_TAG_member, name: "rvec", scope: !2031, file: !23, line: 46, baseType: !70, size: 96)
!2034 = !DIDerivedType(tag: DW_TAG_member, name: "uvec", scope: !2031, file: !23, line: 46, baseType: !70, size: 96, offset: 96)
!2035 = !DIDerivedType(tag: DW_TAG_member, name: "fvec", scope: !2031, file: !23, line: 46, baseType: !70, size: 96, offset: 192)
!2036 = !DILocalVariable(name: "det", arg: 1, scope: !2026, file: !2, line: 355, type: !2029)
!2037 = !DILocation(line: 355, column: 32, scope: !2026)
!2038 = !DILocation(line: 357, column: 17, scope: !2026)
!2039 = !DILocation(line: 357, column: 22, scope: !2026)
!2040 = !DILocation(line: 357, column: 27, scope: !2026)
!2041 = !DILocation(line: 357, column: 36, scope: !2026)
!2042 = !DILocation(line: 357, column: 41, scope: !2026)
!2043 = !DILocation(line: 357, column: 46, scope: !2026)
!2044 = !DILocation(line: 357, column: 48, scope: !2026)
!2045 = !DILocation(line: 357, column: 53, scope: !2026)
!2046 = !DILocation(line: 357, column: 58, scope: !2026)
!2047 = !DILocation(line: 357, column: 29, scope: !2026)
!2048 = !DILocation(line: 357, column: 10, scope: !2026)
!2049 = !DILocation(line: 358, column: 13, scope: !2026)
!2050 = !DILocation(line: 358, column: 18, scope: !2026)
!2051 = !DILocation(line: 358, column: 23, scope: !2026)
!2052 = !DILocation(line: 358, column: 32, scope: !2026)
!2053 = !DILocation(line: 358, column: 37, scope: !2026)
!2054 = !DILocation(line: 358, column: 42, scope: !2026)
!2055 = !DILocation(line: 358, column: 44, scope: !2026)
!2056 = !DILocation(line: 358, column: 49, scope: !2026)
!2057 = !DILocation(line: 358, column: 54, scope: !2026)
!2058 = !DILocation(line: 358, column: 25, scope: !2026)
!2059 = !DILocation(line: 358, column: 6, scope: !2026)
!2060 = !DILocation(line: 357, column: 62, scope: !2026)
!2061 = !DILocation(line: 359, column: 13, scope: !2026)
!2062 = !DILocation(line: 359, column: 18, scope: !2026)
!2063 = !DILocation(line: 359, column: 23, scope: !2026)
!2064 = !DILocation(line: 359, column: 32, scope: !2026)
!2065 = !DILocation(line: 359, column: 37, scope: !2026)
!2066 = !DILocation(line: 359, column: 42, scope: !2026)
!2067 = !DILocation(line: 359, column: 44, scope: !2026)
!2068 = !DILocation(line: 359, column: 49, scope: !2026)
!2069 = !DILocation(line: 359, column: 54, scope: !2026)
!2070 = !DILocation(line: 359, column: 25, scope: !2026)
!2071 = !DILocation(line: 359, column: 6, scope: !2026)
!2072 = !DILocation(line: 358, column: 58, scope: !2026)
!2073 = !DILocation(line: 360, column: 13, scope: !2026)
!2074 = !DILocation(line: 360, column: 18, scope: !2026)
!2075 = !DILocation(line: 360, column: 23, scope: !2026)
!2076 = !DILocation(line: 360, column: 32, scope: !2026)
!2077 = !DILocation(line: 360, column: 37, scope: !2026)
!2078 = !DILocation(line: 360, column: 42, scope: !2026)
!2079 = !DILocation(line: 360, column: 44, scope: !2026)
!2080 = !DILocation(line: 360, column: 49, scope: !2026)
!2081 = !DILocation(line: 360, column: 54, scope: !2026)
!2082 = !DILocation(line: 360, column: 25, scope: !2026)
!2083 = !DILocation(line: 360, column: 6, scope: !2026)
!2084 = !DILocation(line: 359, column: 58, scope: !2026)
!2085 = !DILocation(line: 361, column: 13, scope: !2026)
!2086 = !DILocation(line: 361, column: 18, scope: !2026)
!2087 = !DILocation(line: 361, column: 23, scope: !2026)
!2088 = !DILocation(line: 361, column: 32, scope: !2026)
!2089 = !DILocation(line: 361, column: 37, scope: !2026)
!2090 = !DILocation(line: 361, column: 42, scope: !2026)
!2091 = !DILocation(line: 361, column: 44, scope: !2026)
!2092 = !DILocation(line: 361, column: 49, scope: !2026)
!2093 = !DILocation(line: 361, column: 54, scope: !2026)
!2094 = !DILocation(line: 361, column: 25, scope: !2026)
!2095 = !DILocation(line: 361, column: 6, scope: !2026)
!2096 = !DILocation(line: 360, column: 58, scope: !2026)
!2097 = !DILocation(line: 362, column: 13, scope: !2026)
!2098 = !DILocation(line: 362, column: 18, scope: !2026)
!2099 = !DILocation(line: 362, column: 23, scope: !2026)
!2100 = !DILocation(line: 362, column: 32, scope: !2026)
!2101 = !DILocation(line: 362, column: 37, scope: !2026)
!2102 = !DILocation(line: 362, column: 42, scope: !2026)
!2103 = !DILocation(line: 362, column: 44, scope: !2026)
!2104 = !DILocation(line: 362, column: 49, scope: !2026)
!2105 = !DILocation(line: 362, column: 54, scope: !2026)
!2106 = !DILocation(line: 362, column: 25, scope: !2026)
!2107 = !DILocation(line: 362, column: 6, scope: !2026)
!2108 = !DILocation(line: 361, column: 58, scope: !2026)
!2109 = !DILocation(line: 357, column: 2, scope: !2026)
!2110 = distinct !DISubprogram(name: "check_line_to_line", linkageName: "_Z18check_line_to_linePiS_P10vms_vectorS1_S1_S1_", scope: !2, file: !2, line: 367, type: !2111, scopeLine: 368, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !1379)
!2111 = !DISubroutineType(types: !2112)
!2112 = !{!32, !2113, !2113, !1398, !1398, !1398, !1398}
!2113 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!2114 = !DILocalVariable(name: "t1", arg: 1, scope: !2110, file: !2, line: 367, type: !2113)
!2115 = !DILocation(line: 367, column: 29, scope: !2110)
!2116 = !DILocalVariable(name: "t2", arg: 2, scope: !2110, file: !2, line: 367, type: !2113)
!2117 = !DILocation(line: 367, column: 37, scope: !2110)
!2118 = !DILocalVariable(name: "p1", arg: 3, scope: !2110, file: !2, line: 367, type: !1398)
!2119 = !DILocation(line: 367, column: 52, scope: !2110)
!2120 = !DILocalVariable(name: "v1", arg: 4, scope: !2110, file: !2, line: 367, type: !1398)
!2121 = !DILocation(line: 367, column: 67, scope: !2110)
!2122 = !DILocalVariable(name: "p2", arg: 5, scope: !2110, file: !2, line: 367, type: !1398)
!2123 = !DILocation(line: 367, column: 82, scope: !2110)
!2124 = !DILocalVariable(name: "v2", arg: 6, scope: !2110, file: !2, line: 367, type: !1398)
!2125 = !DILocation(line: 367, column: 97, scope: !2110)
!2126 = !DILocalVariable(name: "det", scope: !2110, file: !2, line: 369, type: !2030)
!2127 = !DILocation(line: 369, column: 13, scope: !2110)
!2128 = !DILocalVariable(name: "d", scope: !2110, file: !2, line: 370, type: !28)
!2129 = !DILocation(line: 370, column: 6, scope: !2110)
!2130 = !DILocalVariable(name: "cross_mag2", scope: !2110, file: !2, line: 370, type: !28)
!2131 = !DILocation(line: 370, column: 8, scope: !2110)
!2132 = !DILocation(line: 372, column: 18, scope: !2110)
!2133 = !DILocation(line: 372, column: 23, scope: !2110)
!2134 = !DILocation(line: 372, column: 26, scope: !2110)
!2135 = !DILocation(line: 372, column: 2, scope: !2110)
!2136 = !DILocation(line: 373, column: 2, scope: !2110)
!2137 = !DILocation(line: 374, column: 15, scope: !2110)
!2138 = !DILocation(line: 374, column: 13, scope: !2110)
!2139 = !DILocation(line: 376, column: 6, scope: !2140)
!2140 = distinct !DILexicalBlock(scope: !2110, file: !2, line: 376, column: 6)
!2141 = !DILocation(line: 376, column: 17, scope: !2140)
!2142 = !DILocation(line: 377, column: 3, scope: !2140)
!2143 = !DILocation(line: 379, column: 14, scope: !2110)
!2144 = !DILocation(line: 379, column: 6, scope: !2110)
!2145 = !DILocation(line: 379, column: 11, scope: !2110)
!2146 = !DILocation(line: 380, column: 6, scope: !2110)
!2147 = !DILocation(line: 380, column: 4, scope: !2110)
!2148 = !DILocation(line: 381, column: 18, scope: !2149)
!2149 = distinct !DILexicalBlock(scope: !2110, file: !2, line: 381, column: 6)
!2150 = !DILocation(line: 381, column: 20, scope: !2149)
!2151 = !DILocation(line: 381, column: 6, scope: !2149)
!2152 = !DILocation(line: 382, column: 3, scope: !2149)
!2153 = !DILocation(line: 384, column: 16, scope: !2149)
!2154 = !DILocation(line: 384, column: 18, scope: !2149)
!2155 = !DILocation(line: 384, column: 9, scope: !2149)
!2156 = !DILocation(line: 384, column: 4, scope: !2149)
!2157 = !DILocation(line: 384, column: 7, scope: !2149)
!2158 = !DILocation(line: 386, column: 14, scope: !2110)
!2159 = !DILocation(line: 386, column: 6, scope: !2110)
!2160 = !DILocation(line: 386, column: 11, scope: !2110)
!2161 = !DILocation(line: 387, column: 6, scope: !2110)
!2162 = !DILocation(line: 387, column: 4, scope: !2110)
!2163 = !DILocation(line: 388, column: 18, scope: !2164)
!2164 = distinct !DILexicalBlock(scope: !2110, file: !2, line: 388, column: 6)
!2165 = !DILocation(line: 388, column: 20, scope: !2164)
!2166 = !DILocation(line: 388, column: 6, scope: !2164)
!2167 = !DILocation(line: 389, column: 3, scope: !2164)
!2168 = !DILocation(line: 391, column: 16, scope: !2164)
!2169 = !DILocation(line: 391, column: 18, scope: !2164)
!2170 = !DILocation(line: 391, column: 9, scope: !2164)
!2171 = !DILocation(line: 391, column: 4, scope: !2164)
!2172 = !DILocation(line: 391, column: 7, scope: !2164)
!2173 = !DILocation(line: 393, column: 2, scope: !2110)
!2174 = !DILocation(line: 394, column: 1, scope: !2110)
!2175 = distinct !DISubprogram(name: "special_check_line_to_face", linkageName: "_Z26special_check_line_to_faceP10vms_vectorS0_S0_P7segmentiiii", scope: !2, file: !2, line: 405, type: !1882, scopeLine: 406, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !1379)
!2176 = !DILocalVariable(name: "newp", arg: 1, scope: !2175, file: !2, line: 405, type: !1398)
!2177 = !DILocation(line: 405, column: 44, scope: !2175)
!2178 = !DILocalVariable(name: "p0", arg: 2, scope: !2175, file: !2, line: 405, type: !1398)
!2179 = !DILocation(line: 405, column: 61, scope: !2175)
!2180 = !DILocalVariable(name: "p1", arg: 3, scope: !2175, file: !2, line: 405, type: !1398)
!2181 = !DILocation(line: 405, column: 76, scope: !2175)
!2182 = !DILocalVariable(name: "seg", arg: 4, scope: !2175, file: !2, line: 405, type: !1884)
!2183 = !DILocation(line: 405, column: 88, scope: !2175)
!2184 = !DILocalVariable(name: "side", arg: 5, scope: !2175, file: !2, line: 405, type: !32)
!2185 = !DILocation(line: 405, column: 96, scope: !2175)
!2186 = !DILocalVariable(name: "facenum", arg: 6, scope: !2175, file: !2, line: 405, type: !32)
!2187 = !DILocation(line: 405, column: 105, scope: !2175)
!2188 = !DILocalVariable(name: "nv", arg: 7, scope: !2175, file: !2, line: 405, type: !32)
!2189 = !DILocation(line: 405, column: 117, scope: !2175)
!2190 = !DILocalVariable(name: "rad", arg: 8, scope: !2175, file: !2, line: 405, type: !28)
!2191 = !DILocation(line: 405, column: 124, scope: !2175)
!2192 = !DILocation(line: 407, column: 6, scope: !2193)
!2193 = distinct !DILexicalBlock(scope: !2175, file: !2, line: 407, column: 6)
!2194 = !DILocation(line: 408, column: 29, scope: !2193)
!2195 = !DILocation(line: 408, column: 34, scope: !2193)
!2196 = !DILocation(line: 408, column: 37, scope: !2193)
!2197 = !DILocation(line: 408, column: 40, scope: !2193)
!2198 = !DILocation(line: 408, column: 44, scope: !2193)
!2199 = !DILocation(line: 408, column: 49, scope: !2193)
!2200 = !DILocation(line: 408, column: 57, scope: !2193)
!2201 = !DILocation(line: 408, column: 60, scope: !2193)
!2202 = !DILocation(line: 408, column: 10, scope: !2193)
!2203 = !DILocation(line: 408, column: 3, scope: !2193)
!2204 = !DILocation(line: 410, column: 7, scope: !2205)
!2205 = distinct !DILexicalBlock(scope: !2175, file: !2, line: 410, column: 6)
!2206 = !DILocation(line: 410, column: 10, scope: !2205)
!2207 = !DILocation(line: 410, column: 20, scope: !2205)
!2208 = !DILocation(line: 411, column: 3, scope: !2205)
!2209 = !DILocalVariable(name: "move_vec", scope: !2210, file: !2, line: 414, type: !70)
!2210 = distinct !DILexicalBlock(scope: !2175, file: !2, line: 413, column: 2)
!2211 = !DILocation(line: 414, column: 13, scope: !2210)
!2212 = !DILocalVariable(name: "edge_t", scope: !2210, file: !2, line: 415, type: !28)
!2213 = !DILocation(line: 415, column: 6, scope: !2210)
!2214 = !DILocalVariable(name: "move_t", scope: !2210, file: !2, line: 415, type: !28)
!2215 = !DILocation(line: 415, column: 13, scope: !2210)
!2216 = !DILocalVariable(name: "edge_t2", scope: !2210, file: !2, line: 415, type: !28)
!2217 = !DILocation(line: 415, column: 20, scope: !2210)
!2218 = !DILocalVariable(name: "move_t2", scope: !2210, file: !2, line: 415, type: !28)
!2219 = !DILocation(line: 415, column: 28, scope: !2210)
!2220 = !DILocalVariable(name: "closest_dist", scope: !2210, file: !2, line: 415, type: !28)
!2221 = !DILocation(line: 415, column: 36, scope: !2210)
!2222 = !DILocalVariable(name: "edge_len", scope: !2210, file: !2, line: 416, type: !28)
!2223 = !DILocation(line: 416, column: 6, scope: !2210)
!2224 = !DILocalVariable(name: "move_len", scope: !2210, file: !2, line: 416, type: !28)
!2225 = !DILocation(line: 416, column: 15, scope: !2210)
!2226 = !DILocalVariable(name: "vertex_list", scope: !2210, file: !2, line: 417, type: !1930)
!2227 = !DILocation(line: 417, column: 6, scope: !2210)
!2228 = !DILocalVariable(name: "num_faces", scope: !2210, file: !2, line: 418, type: !32)
!2229 = !DILocation(line: 418, column: 6, scope: !2210)
!2230 = !DILocalVariable(name: "edgenum", scope: !2210, file: !2, line: 418, type: !32)
!2231 = !DILocation(line: 418, column: 16, scope: !2210)
!2232 = !DILocalVariable(name: "edgemask", scope: !2210, file: !2, line: 419, type: !140)
!2233 = !DILocation(line: 419, column: 11, scope: !2210)
!2234 = !DILocalVariable(name: "edge_v0", scope: !2210, file: !2, line: 420, type: !1398)
!2235 = !DILocation(line: 420, column: 14, scope: !2210)
!2236 = !DILocalVariable(name: "edge_v1", scope: !2210, file: !2, line: 420, type: !1398)
!2237 = !DILocation(line: 420, column: 23, scope: !2210)
!2238 = !DILocalVariable(name: "edge_vec", scope: !2210, file: !2, line: 420, type: !70)
!2239 = !DILocation(line: 420, column: 31, scope: !2210)
!2240 = !DILocalVariable(name: "s", scope: !2210, file: !2, line: 421, type: !1924)
!2241 = !DILocation(line: 421, column: 15, scope: !2210)
!2242 = !DILocation(line: 421, column: 18, scope: !2210)
!2243 = !DILocation(line: 421, column: 23, scope: !2210)
!2244 = !DILocation(line: 421, column: 29, scope: !2210)
!2245 = !DILocalVariable(name: "closest_point_edge", scope: !2210, file: !2, line: 422, type: !70)
!2246 = !DILocation(line: 422, column: 13, scope: !2210)
!2247 = !DILocalVariable(name: "closest_point_move", scope: !2210, file: !2, line: 422, type: !70)
!2248 = !DILocation(line: 422, column: 32, scope: !2210)
!2249 = !DILocation(line: 426, column: 37, scope: !2210)
!2250 = !DILocation(line: 426, column: 49, scope: !2210)
!2251 = !DILocation(line: 426, column: 52, scope: !2210)
!2252 = !DILocation(line: 426, column: 62, scope: !2210)
!2253 = !DILocation(line: 426, column: 2, scope: !2210)
!2254 = !DILocation(line: 427, column: 23, scope: !2210)
!2255 = !DILocation(line: 427, column: 26, scope: !2210)
!2256 = !DILocation(line: 427, column: 2, scope: !2210)
!2257 = !DILocation(line: 431, column: 33, scope: !2210)
!2258 = !DILocation(line: 431, column: 36, scope: !2210)
!2259 = !DILocation(line: 431, column: 38, scope: !2210)
!2260 = !DILocation(line: 431, column: 46, scope: !2210)
!2261 = !DILocation(line: 431, column: 49, scope: !2210)
!2262 = !DILocation(line: 431, column: 13, scope: !2210)
!2263 = !DILocation(line: 431, column: 11, scope: !2210)
!2264 = !DILocation(line: 433, column: 6, scope: !2265)
!2265 = distinct !DILexicalBlock(scope: !2210, file: !2, line: 433, column: 6)
!2266 = !DILocation(line: 433, column: 15, scope: !2265)
!2267 = !DILocation(line: 434, column: 29, scope: !2265)
!2268 = !DILocation(line: 434, column: 34, scope: !2265)
!2269 = !DILocation(line: 434, column: 37, scope: !2265)
!2270 = !DILocation(line: 434, column: 40, scope: !2265)
!2271 = !DILocation(line: 434, column: 44, scope: !2265)
!2272 = !DILocation(line: 434, column: 49, scope: !2265)
!2273 = !DILocation(line: 434, column: 57, scope: !2265)
!2274 = !DILocation(line: 434, column: 60, scope: !2265)
!2275 = !DILocation(line: 434, column: 10, scope: !2265)
!2276 = !DILocation(line: 434, column: 3, scope: !2265)
!2277 = !DILocation(line: 436, column: 14, scope: !2278)
!2278 = distinct !DILexicalBlock(scope: !2210, file: !2, line: 436, column: 2)
!2279 = !DILocation(line: 436, column: 7, scope: !2278)
!2280 = !DILocation(line: 436, column: 19, scope: !2281)
!2281 = distinct !DILexicalBlock(scope: !2278, file: !2, line: 436, column: 2)
!2282 = !DILocation(line: 436, column: 27, scope: !2281)
!2283 = !DILocation(line: 436, column: 18, scope: !2281)
!2284 = !DILocation(line: 436, column: 17, scope: !2281)
!2285 = !DILocation(line: 436, column: 2, scope: !2278)
!2286 = !DILocation(line: 436, column: 39, scope: !2281)
!2287 = !DILocation(line: 436, column: 51, scope: !2281)
!2288 = !DILocation(line: 436, column: 2, scope: !2281)
!2289 = distinct !{!2289, !2285, !2290, !1730}
!2290 = !DILocation(line: 436, column: 54, scope: !2278)
!2291 = !DILocation(line: 438, column: 34, scope: !2210)
!2292 = !DILocation(line: 438, column: 41, scope: !2210)
!2293 = !DILocation(line: 438, column: 44, scope: !2210)
!2294 = !DILocation(line: 438, column: 43, scope: !2210)
!2295 = !DILocation(line: 438, column: 22, scope: !2210)
!2296 = !DILocation(line: 438, column: 13, scope: !2210)
!2297 = !DILocation(line: 438, column: 10, scope: !2210)
!2298 = !DILocation(line: 439, column: 34, scope: !2210)
!2299 = !DILocation(line: 439, column: 41, scope: !2210)
!2300 = !DILocation(line: 439, column: 46, scope: !2210)
!2301 = !DILocation(line: 439, column: 53, scope: !2210)
!2302 = !DILocation(line: 439, column: 57, scope: !2210)
!2303 = !DILocation(line: 439, column: 56, scope: !2210)
!2304 = !DILocation(line: 439, column: 43, scope: !2210)
!2305 = !DILocation(line: 439, column: 22, scope: !2210)
!2306 = !DILocation(line: 439, column: 13, scope: !2210)
!2307 = !DILocation(line: 439, column: 10, scope: !2210)
!2308 = !DILocation(line: 441, column: 23, scope: !2210)
!2309 = !DILocation(line: 441, column: 31, scope: !2210)
!2310 = !DILocation(line: 441, column: 2, scope: !2210)
!2311 = !DILocation(line: 449, column: 13, scope: !2210)
!2312 = !DILocation(line: 449, column: 11, scope: !2210)
!2313 = !DILocation(line: 450, column: 13, scope: !2210)
!2314 = !DILocation(line: 450, column: 11, scope: !2210)
!2315 = !DILocation(line: 452, column: 37, scope: !2210)
!2316 = !DILocation(line: 452, column: 55, scope: !2210)
!2317 = !DILocation(line: 452, column: 2, scope: !2210)
!2318 = !DILocation(line: 456, column: 6, scope: !2319)
!2319 = distinct !DILexicalBlock(scope: !2210, file: !2, line: 456, column: 6)
!2320 = !DILocation(line: 456, column: 12, scope: !2319)
!2321 = !DILocation(line: 456, column: 15, scope: !2319)
!2322 = !DILocation(line: 456, column: 18, scope: !2319)
!2323 = !DILocation(line: 456, column: 25, scope: !2319)
!2324 = !DILocation(line: 456, column: 34, scope: !2319)
!2325 = !DILocation(line: 456, column: 33, scope: !2319)
!2326 = !DILocation(line: 456, column: 24, scope: !2319)
!2327 = !DILocation(line: 457, column: 3, scope: !2319)
!2328 = !DILocation(line: 459, column: 6, scope: !2329)
!2329 = distinct !DILexicalBlock(scope: !2210, file: !2, line: 459, column: 6)
!2330 = !DILocation(line: 459, column: 15, scope: !2329)
!2331 = !DILocation(line: 459, column: 13, scope: !2329)
!2332 = !DILocation(line: 460, column: 13, scope: !2329)
!2333 = !DILocation(line: 460, column: 11, scope: !2329)
!2334 = !DILocation(line: 460, column: 3, scope: !2329)
!2335 = !DILocation(line: 462, column: 13, scope: !2329)
!2336 = !DILocation(line: 462, column: 11, scope: !2329)
!2337 = !DILocation(line: 464, column: 6, scope: !2338)
!2338 = distinct !DILexicalBlock(scope: !2210, file: !2, line: 464, column: 6)
!2339 = !DILocation(line: 464, column: 13, scope: !2338)
!2340 = !DILocation(line: 465, column: 11, scope: !2338)
!2341 = !DILocation(line: 465, column: 3, scope: !2338)
!2342 = !DILocation(line: 467, column: 13, scope: !2338)
!2343 = !DILocation(line: 467, column: 11, scope: !2338)
!2344 = !DILocation(line: 469, column: 6, scope: !2345)
!2345 = distinct !DILexicalBlock(scope: !2210, file: !2, line: 469, column: 6)
!2346 = !DILocation(line: 469, column: 16, scope: !2345)
!2347 = !DILocation(line: 469, column: 14, scope: !2345)
!2348 = !DILocation(line: 470, column: 13, scope: !2345)
!2349 = !DILocation(line: 470, column: 11, scope: !2345)
!2350 = !DILocation(line: 470, column: 3, scope: !2345)
!2351 = !DILocation(line: 474, column: 39, scope: !2210)
!2352 = !DILocation(line: 474, column: 57, scope: !2210)
!2353 = !DILocation(line: 474, column: 2, scope: !2210)
!2354 = !DILocation(line: 475, column: 39, scope: !2210)
!2355 = !DILocation(line: 475, column: 52, scope: !2210)
!2356 = !DILocation(line: 475, column: 2, scope: !2210)
!2357 = !DILocation(line: 479, column: 17, scope: !2210)
!2358 = !DILocation(line: 479, column: 15, scope: !2210)
!2359 = !DILocation(line: 485, column: 6, scope: !2360)
!2360 = distinct !DILexicalBlock(scope: !2210, file: !2, line: 485, column: 6)
!2361 = !DILocation(line: 485, column: 22, scope: !2360)
!2362 = !DILocation(line: 485, column: 25, scope: !2360)
!2363 = !DILocation(line: 485, column: 29, scope: !2360)
!2364 = !DILocation(line: 485, column: 19, scope: !2360)
!2365 = !DILocation(line: 489, column: 20, scope: !2366)
!2366 = distinct !DILexicalBlock(scope: !2360, file: !2, line: 485, column: 34)
!2367 = !DILocation(line: 489, column: 25, scope: !2366)
!2368 = !DILocation(line: 489, column: 38, scope: !2366)
!2369 = !DILocation(line: 489, column: 45, scope: !2366)
!2370 = !DILocation(line: 489, column: 44, scope: !2366)
!2371 = !DILocation(line: 489, column: 3, scope: !2366)
!2372 = !DILocation(line: 491, column: 3, scope: !2366)
!2373 = !DILocation(line: 495, column: 3, scope: !2360)
!2374 = !DILocation(line: 497, column: 1, scope: !2175)
!2375 = distinct !DISubprogram(name: "check_vector_to_sphere_1", linkageName: "_Z24check_vector_to_sphere_1P10vms_vectorS0_S0_S0_i", scope: !2, file: !2, line: 505, type: !2376, scopeLine: 506, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !1379)
!2376 = !DISubroutineType(types: !2377)
!2377 = !{!32, !1398, !1398, !1398, !1398, !28}
!2378 = !DILocalVariable(name: "intp", arg: 1, scope: !2375, file: !2, line: 505, type: !1398)
!2379 = !DILocation(line: 505, column: 42, scope: !2375)
!2380 = !DILocalVariable(name: "p0", arg: 2, scope: !2375, file: !2, line: 505, type: !1398)
!2381 = !DILocation(line: 505, column: 59, scope: !2375)
!2382 = !DILocalVariable(name: "p1", arg: 3, scope: !2375, file: !2, line: 505, type: !1398)
!2383 = !DILocation(line: 505, column: 74, scope: !2375)
!2384 = !DILocalVariable(name: "sphere_pos", arg: 4, scope: !2375, file: !2, line: 505, type: !1398)
!2385 = !DILocation(line: 505, column: 89, scope: !2375)
!2386 = !DILocalVariable(name: "sphere_rad", arg: 5, scope: !2375, file: !2, line: 505, type: !28)
!2387 = !DILocation(line: 505, column: 104, scope: !2375)
!2388 = !DILocalVariable(name: "d", scope: !2389, file: !2, line: 508, type: !70)
!2389 = distinct !DILexicalBlock(scope: !2375, file: !2, line: 507, column: 2)
!2390 = !DILocation(line: 508, column: 13, scope: !2389)
!2391 = !DILocalVariable(name: "dn", scope: !2389, file: !2, line: 508, type: !70)
!2392 = !DILocation(line: 508, column: 15, scope: !2389)
!2393 = !DILocalVariable(name: "w", scope: !2389, file: !2, line: 508, type: !70)
!2394 = !DILocation(line: 508, column: 18, scope: !2389)
!2395 = !DILocalVariable(name: "closest_point", scope: !2389, file: !2, line: 508, type: !70)
!2396 = !DILocation(line: 508, column: 20, scope: !2389)
!2397 = !DILocalVariable(name: "mag_d", scope: !2389, file: !2, line: 509, type: !28)
!2398 = !DILocation(line: 509, column: 6, scope: !2389)
!2399 = !DILocalVariable(name: "dist", scope: !2389, file: !2, line: 509, type: !28)
!2400 = !DILocation(line: 509, column: 12, scope: !2389)
!2401 = !DILocalVariable(name: "w_dist", scope: !2389, file: !2, line: 509, type: !28)
!2402 = !DILocation(line: 509, column: 17, scope: !2389)
!2403 = !DILocalVariable(name: "int_dist", scope: !2389, file: !2, line: 509, type: !28)
!2404 = !DILocation(line: 509, column: 24, scope: !2389)
!2405 = !DILocation(line: 513, column: 16, scope: !2389)
!2406 = !DILocation(line: 513, column: 19, scope: !2389)
!2407 = !DILocation(line: 513, column: 2, scope: !2389)
!2408 = !DILocation(line: 514, column: 16, scope: !2389)
!2409 = !DILocation(line: 514, column: 27, scope: !2389)
!2410 = !DILocation(line: 514, column: 2, scope: !2389)
!2411 = !DILocation(line: 516, column: 10, scope: !2389)
!2412 = !DILocation(line: 516, column: 8, scope: !2389)
!2413 = !DILocation(line: 518, column: 6, scope: !2414)
!2414 = distinct !DILexicalBlock(scope: !2389, file: !2, line: 518, column: 6)
!2415 = !DILocation(line: 518, column: 12, scope: !2414)
!2416 = !DILocation(line: 519, column: 14, scope: !2417)
!2417 = distinct !DILexicalBlock(scope: !2414, file: !2, line: 518, column: 18)
!2418 = !DILocation(line: 519, column: 12, scope: !2417)
!2419 = !DILocation(line: 520, column: 12, scope: !2417)
!2420 = !DILocation(line: 520, column: 4, scope: !2417)
!2421 = !DILocation(line: 520, column: 9, scope: !2417)
!2422 = !DILocation(line: 521, column: 11, scope: !2417)
!2423 = !DILocation(line: 521, column: 20, scope: !2417)
!2424 = !DILocation(line: 521, column: 19, scope: !2417)
!2425 = !DILocation(line: 521, column: 10, scope: !2417)
!2426 = !DILocation(line: 521, column: 32, scope: !2417)
!2427 = !DILocation(line: 521, column: 3, scope: !2417)
!2428 = !DILocation(line: 524, column: 11, scope: !2389)
!2429 = !DILocation(line: 524, column: 9, scope: !2389)
!2430 = !DILocation(line: 526, column: 6, scope: !2431)
!2431 = distinct !DILexicalBlock(scope: !2389, file: !2, line: 526, column: 6)
!2432 = !DILocation(line: 526, column: 13, scope: !2431)
!2433 = !DILocation(line: 527, column: 4, scope: !2431)
!2434 = !DILocation(line: 529, column: 6, scope: !2435)
!2435 = distinct !DILexicalBlock(scope: !2389, file: !2, line: 529, column: 6)
!2436 = !DILocation(line: 529, column: 15, scope: !2435)
!2437 = !DILocation(line: 529, column: 21, scope: !2435)
!2438 = !DILocation(line: 529, column: 20, scope: !2435)
!2439 = !DILocation(line: 529, column: 13, scope: !2435)
!2440 = !DILocation(line: 530, column: 3, scope: !2435)
!2441 = !DILocation(line: 532, column: 34, scope: !2389)
!2442 = !DILocation(line: 532, column: 41, scope: !2389)
!2443 = !DILocation(line: 532, column: 2, scope: !2389)
!2444 = !DILocation(line: 534, column: 36, scope: !2389)
!2445 = !DILocation(line: 534, column: 9, scope: !2389)
!2446 = !DILocation(line: 534, column: 7, scope: !2389)
!2447 = !DILocation(line: 536, column: 6, scope: !2448)
!2448 = distinct !DILexicalBlock(scope: !2389, file: !2, line: 536, column: 6)
!2449 = !DILocation(line: 536, column: 13, scope: !2448)
!2450 = !DILocation(line: 536, column: 11, scope: !2448)
!2451 = !DILocalVariable(name: "dist2", scope: !2452, file: !2, line: 537, type: !28)
!2452 = distinct !DILexicalBlock(scope: !2448, file: !2, line: 536, column: 25)
!2453 = !DILocation(line: 537, column: 7, scope: !2452)
!2454 = !DILocalVariable(name: "rad2", scope: !2452, file: !2, line: 537, type: !28)
!2455 = !DILocation(line: 537, column: 13, scope: !2452)
!2456 = !DILocalVariable(name: "shorten", scope: !2452, file: !2, line: 537, type: !28)
!2457 = !DILocation(line: 537, column: 18, scope: !2452)
!2458 = !DILocation(line: 539, column: 18, scope: !2452)
!2459 = !DILocation(line: 539, column: 23, scope: !2452)
!2460 = !DILocation(line: 539, column: 11, scope: !2452)
!2461 = !DILocation(line: 539, column: 9, scope: !2452)
!2462 = !DILocation(line: 540, column: 17, scope: !2452)
!2463 = !DILocation(line: 540, column: 28, scope: !2452)
!2464 = !DILocation(line: 540, column: 10, scope: !2452)
!2465 = !DILocation(line: 540, column: 8, scope: !2452)
!2466 = !DILocation(line: 542, column: 22, scope: !2452)
!2467 = !DILocation(line: 542, column: 29, scope: !2452)
!2468 = !DILocation(line: 542, column: 27, scope: !2452)
!2469 = !DILocation(line: 542, column: 13, scope: !2452)
!2470 = !DILocation(line: 542, column: 11, scope: !2452)
!2471 = !DILocation(line: 544, column: 14, scope: !2452)
!2472 = !DILocation(line: 544, column: 21, scope: !2452)
!2473 = !DILocation(line: 544, column: 20, scope: !2452)
!2474 = !DILocation(line: 544, column: 12, scope: !2452)
!2475 = !DILocation(line: 546, column: 7, scope: !2476)
!2476 = distinct !DILexicalBlock(scope: !2452, file: !2, line: 546, column: 7)
!2477 = !DILocation(line: 546, column: 18, scope: !2476)
!2478 = !DILocation(line: 546, column: 16, scope: !2476)
!2479 = !DILocation(line: 546, column: 24, scope: !2476)
!2480 = !DILocation(line: 546, column: 27, scope: !2476)
!2481 = !DILocation(line: 546, column: 36, scope: !2476)
!2482 = !DILocation(line: 549, column: 13, scope: !2483)
!2483 = distinct !DILexicalBlock(scope: !2476, file: !2, line: 546, column: 41)
!2484 = !DILocation(line: 549, column: 5, scope: !2483)
!2485 = !DILocation(line: 549, column: 10, scope: !2483)
!2486 = !DILocation(line: 550, column: 4, scope: !2483)
!2487 = !DILocation(line: 553, column: 20, scope: !2452)
!2488 = !DILocation(line: 553, column: 25, scope: !2452)
!2489 = !DILocation(line: 553, column: 32, scope: !2452)
!2490 = !DILocation(line: 553, column: 3, scope: !2452)
!2491 = !DILocation(line: 562, column: 10, scope: !2452)
!2492 = !DILocation(line: 562, column: 3, scope: !2452)
!2493 = !DILocation(line: 565, column: 3, scope: !2448)
!2494 = !DILocation(line: 567, column: 1, scope: !2375)
!2495 = distinct !DISubprogram(name: "check_vector_to_object", linkageName: "_Z22check_vector_to_objectP10vms_vectorS0_S0_iP6objectS2_", scope: !2, file: !2, line: 680, type: !2496, scopeLine: 681, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !1379)
!2496 = !DISubroutineType(types: !2497)
!2497 = !{!28, !1398, !1398, !1398, !28, !2498, !2498}
!2498 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2499, size: 64)
!2499 = !DIDerivedType(tag: DW_TAG_typedef, name: "object", file: !2500, line: 259, baseType: !2501)
!2500 = !DIFile(filename: "main_d2/object.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "1f2325d356aae4b692933d2aae4f3afd")
!2501 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "object", file: !2500, line: 210, size: 2144, flags: DIFlagTypePassByValue, elements: !2502, identifier: "_ZTS6object")
!2502 = !{!2503, !2504, !2505, !2506, !2507, !2508, !2509, !2510, !2511, !2512, !2513, !2514, !2515, !2516, !2517, !2518, !2519, !2520, !2521, !2522, !2523, !2524, !2542, !2596}
!2503 = !DIDerivedType(tag: DW_TAG_member, name: "signature", scope: !2501, file: !2500, line: 212, baseType: !32, size: 32)
!2504 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !2501, file: !2500, line: 213, baseType: !132, size: 8, offset: 32)
!2505 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !2501, file: !2500, line: 214, baseType: !132, size: 8, offset: 40)
!2506 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !2501, file: !2500, line: 215, baseType: !55, size: 16, offset: 48)
!2507 = !DIDerivedType(tag: DW_TAG_member, name: "prev", scope: !2501, file: !2500, line: 215, baseType: !55, size: 16, offset: 64)
!2508 = !DIDerivedType(tag: DW_TAG_member, name: "control_type", scope: !2501, file: !2500, line: 216, baseType: !132, size: 8, offset: 80)
!2509 = !DIDerivedType(tag: DW_TAG_member, name: "movement_type", scope: !2501, file: !2500, line: 217, baseType: !132, size: 8, offset: 88)
!2510 = !DIDerivedType(tag: DW_TAG_member, name: "render_type", scope: !2501, file: !2500, line: 218, baseType: !132, size: 8, offset: 96)
!2511 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !2501, file: !2500, line: 219, baseType: !132, size: 8, offset: 104)
!2512 = !DIDerivedType(tag: DW_TAG_member, name: "segnum", scope: !2501, file: !2500, line: 220, baseType: !55, size: 16, offset: 112)
!2513 = !DIDerivedType(tag: DW_TAG_member, name: "attached_obj", scope: !2501, file: !2500, line: 221, baseType: !55, size: 16, offset: 128)
!2514 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !2501, file: !2500, line: 222, baseType: !70, size: 96, offset: 160)
!2515 = !DIDerivedType(tag: DW_TAG_member, name: "orient", scope: !2501, file: !2500, line: 223, baseType: !2030, size: 288, offset: 256)
!2516 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !2501, file: !2500, line: 224, baseType: !28, size: 32, offset: 544)
!2517 = !DIDerivedType(tag: DW_TAG_member, name: "shields", scope: !2501, file: !2500, line: 225, baseType: !28, size: 32, offset: 576)
!2518 = !DIDerivedType(tag: DW_TAG_member, name: "last_pos", scope: !2501, file: !2500, line: 226, baseType: !70, size: 96, offset: 608)
!2519 = !DIDerivedType(tag: DW_TAG_member, name: "contains_type", scope: !2501, file: !2500, line: 227, baseType: !122, size: 8, offset: 704)
!2520 = !DIDerivedType(tag: DW_TAG_member, name: "contains_id", scope: !2501, file: !2500, line: 228, baseType: !122, size: 8, offset: 712)
!2521 = !DIDerivedType(tag: DW_TAG_member, name: "contains_count", scope: !2501, file: !2500, line: 229, baseType: !122, size: 8, offset: 720)
!2522 = !DIDerivedType(tag: DW_TAG_member, name: "matcen_creator", scope: !2501, file: !2500, line: 230, baseType: !122, size: 8, offset: 728)
!2523 = !DIDerivedType(tag: DW_TAG_member, name: "lifeleft", scope: !2501, file: !2500, line: 231, baseType: !28, size: 32, offset: 736)
!2524 = !DIDerivedType(tag: DW_TAG_member, name: "mtype", scope: !2501, file: !2500, line: 240, baseType: !2525, size: 512, offset: 768)
!2525 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !2501, file: !2500, line: 236, size: 512, flags: DIFlagTypePassByValue, elements: !2526, identifier: "_ZTSN6objectUt_E")
!2526 = !{!2527, !2541}
!2527 = !DIDerivedType(tag: DW_TAG_member, name: "phys_info", scope: !2525, file: !2500, line: 238, baseType: !2528, size: 512)
!2528 = !DIDerivedType(tag: DW_TAG_typedef, name: "physics_info", file: !2500, line: 153, baseType: !2529)
!2529 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "physics_info", file: !2500, line: 142, size: 512, flags: DIFlagTypePassByValue, elements: !2530, identifier: "_ZTS12physics_info")
!2530 = !{!2531, !2532, !2533, !2534, !2535, !2536, !2537, !2538, !2540}
!2531 = !DIDerivedType(tag: DW_TAG_member, name: "velocity", scope: !2529, file: !2500, line: 144, baseType: !70, size: 96)
!2532 = !DIDerivedType(tag: DW_TAG_member, name: "thrust", scope: !2529, file: !2500, line: 145, baseType: !70, size: 96, offset: 96)
!2533 = !DIDerivedType(tag: DW_TAG_member, name: "mass", scope: !2529, file: !2500, line: 146, baseType: !28, size: 32, offset: 192)
!2534 = !DIDerivedType(tag: DW_TAG_member, name: "drag", scope: !2529, file: !2500, line: 147, baseType: !28, size: 32, offset: 224)
!2535 = !DIDerivedType(tag: DW_TAG_member, name: "brakes", scope: !2529, file: !2500, line: 148, baseType: !28, size: 32, offset: 256)
!2536 = !DIDerivedType(tag: DW_TAG_member, name: "rotvel", scope: !2529, file: !2500, line: 149, baseType: !70, size: 96, offset: 288)
!2537 = !DIDerivedType(tag: DW_TAG_member, name: "rotthrust", scope: !2529, file: !2500, line: 150, baseType: !70, size: 96, offset: 384)
!2538 = !DIDerivedType(tag: DW_TAG_member, name: "turnroll", scope: !2529, file: !2500, line: 151, baseType: !2539, size: 16, offset: 480)
!2539 = !DIDerivedType(tag: DW_TAG_typedef, name: "fixang", file: !29, line: 21, baseType: !55)
!2540 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !2529, file: !2500, line: 152, baseType: !136, size: 16, offset: 496)
!2541 = !DIDerivedType(tag: DW_TAG_member, name: "spin_rate", scope: !2525, file: !2500, line: 239, baseType: !70, size: 96)
!2542 = !DIDerivedType(tag: DW_TAG_member, name: "ctype", scope: !2501, file: !2500, line: 250, baseType: !2543, size: 256, offset: 1280)
!2543 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !2501, file: !2500, line: 243, size: 256, flags: DIFlagTypePassByValue, elements: !2544, identifier: "_ZTSN6objectUt0_E")
!2544 = !{!2545, !2556, !2566, !2584, !2589}
!2545 = !DIDerivedType(tag: DW_TAG_member, name: "laser_info", scope: !2543, file: !2500, line: 245, baseType: !2546, size: 160)
!2546 = !DIDerivedType(tag: DW_TAG_typedef, name: "laser_info_t", file: !2500, line: 166, baseType: !2547)
!2547 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "laser_info_s", file: !2500, line: 157, size: 160, flags: DIFlagTypePassByValue, elements: !2548, identifier: "_ZTS12laser_info_s")
!2548 = !{!2549, !2550, !2551, !2552, !2553, !2554, !2555}
!2549 = !DIDerivedType(tag: DW_TAG_member, name: "parent_type", scope: !2547, file: !2500, line: 159, baseType: !55, size: 16)
!2550 = !DIDerivedType(tag: DW_TAG_member, name: "parent_num", scope: !2547, file: !2500, line: 160, baseType: !55, size: 16, offset: 16)
!2551 = !DIDerivedType(tag: DW_TAG_member, name: "parent_signature", scope: !2547, file: !2500, line: 161, baseType: !32, size: 32, offset: 32)
!2552 = !DIDerivedType(tag: DW_TAG_member, name: "creation_time", scope: !2547, file: !2500, line: 162, baseType: !28, size: 32, offset: 64)
!2553 = !DIDerivedType(tag: DW_TAG_member, name: "last_hitobj", scope: !2547, file: !2500, line: 163, baseType: !55, size: 16, offset: 96)
!2554 = !DIDerivedType(tag: DW_TAG_member, name: "track_goal", scope: !2547, file: !2500, line: 164, baseType: !55, size: 16, offset: 112)
!2555 = !DIDerivedType(tag: DW_TAG_member, name: "multiplier", scope: !2547, file: !2500, line: 165, baseType: !28, size: 32, offset: 128)
!2556 = !DIDerivedType(tag: DW_TAG_member, name: "expl_info", scope: !2543, file: !2500, line: 246, baseType: !2557, size: 128)
!2557 = !DIDerivedType(tag: DW_TAG_typedef, name: "explosion_info", file: !2500, line: 176, baseType: !2558)
!2558 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "explosion_info", file: !2500, line: 168, size: 128, flags: DIFlagTypePassByValue, elements: !2559, identifier: "_ZTS14explosion_info")
!2559 = !{!2560, !2561, !2562, !2563, !2564, !2565}
!2560 = !DIDerivedType(tag: DW_TAG_member, name: "spawn_time", scope: !2558, file: !2500, line: 170, baseType: !28, size: 32)
!2561 = !DIDerivedType(tag: DW_TAG_member, name: "delete_time", scope: !2558, file: !2500, line: 171, baseType: !28, size: 32, offset: 32)
!2562 = !DIDerivedType(tag: DW_TAG_member, name: "delete_objnum", scope: !2558, file: !2500, line: 172, baseType: !55, size: 16, offset: 64)
!2563 = !DIDerivedType(tag: DW_TAG_member, name: "attach_parent", scope: !2558, file: !2500, line: 173, baseType: !55, size: 16, offset: 80)
!2564 = !DIDerivedType(tag: DW_TAG_member, name: "prev_attach", scope: !2558, file: !2500, line: 174, baseType: !55, size: 16, offset: 96)
!2565 = !DIDerivedType(tag: DW_TAG_member, name: "next_attach", scope: !2558, file: !2500, line: 175, baseType: !55, size: 16, offset: 112)
!2566 = !DIDerivedType(tag: DW_TAG_member, name: "ai_info", scope: !2543, file: !2500, line: 247, baseType: !2567, size: 256)
!2567 = !DIDerivedType(tag: DW_TAG_typedef, name: "ai_static", file: !2568, line: 144, baseType: !2569)
!2568 = !DIFile(filename: "main_d2/aistruct.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "d122430e792a0ddc0f9eaa08ad217628")
!2569 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ai_static", file: !2568, line: 127, size: 256, flags: DIFlagTypePassByValue, elements: !2570, identifier: "_ZTS9ai_static")
!2570 = !{!2571, !2572, !2576, !2577, !2578, !2579, !2580, !2581, !2582, !2583}
!2571 = !DIDerivedType(tag: DW_TAG_member, name: "behavior", scope: !2569, file: !2568, line: 128, baseType: !132, size: 8)
!2572 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !2569, file: !2568, line: 129, baseType: !2573, size: 88, offset: 8)
!2573 = !DICompositeType(tag: DW_TAG_array_type, baseType: !122, size: 88, elements: !2574)
!2574 = !{!2575}
!2575 = !DISubrange(count: 11)
!2576 = !DIDerivedType(tag: DW_TAG_member, name: "hide_segment", scope: !2569, file: !2568, line: 130, baseType: !55, size: 16, offset: 96)
!2577 = !DIDerivedType(tag: DW_TAG_member, name: "hide_index", scope: !2569, file: !2568, line: 131, baseType: !55, size: 16, offset: 112)
!2578 = !DIDerivedType(tag: DW_TAG_member, name: "path_length", scope: !2569, file: !2568, line: 132, baseType: !55, size: 16, offset: 128)
!2579 = !DIDerivedType(tag: DW_TAG_member, name: "cur_path_index", scope: !2569, file: !2568, line: 133, baseType: !122, size: 8, offset: 144)
!2580 = !DIDerivedType(tag: DW_TAG_member, name: "dying_sound_playing", scope: !2569, file: !2568, line: 134, baseType: !122, size: 8, offset: 152)
!2581 = !DIDerivedType(tag: DW_TAG_member, name: "danger_laser_num", scope: !2569, file: !2568, line: 139, baseType: !55, size: 16, offset: 160)
!2582 = !DIDerivedType(tag: DW_TAG_member, name: "danger_laser_signature", scope: !2569, file: !2568, line: 140, baseType: !32, size: 32, offset: 192)
!2583 = !DIDerivedType(tag: DW_TAG_member, name: "dying_start_time", scope: !2569, file: !2568, line: 141, baseType: !28, size: 32, offset: 224)
!2584 = !DIDerivedType(tag: DW_TAG_member, name: "light_info", scope: !2543, file: !2500, line: 248, baseType: !2585, size: 32)
!2585 = !DIDerivedType(tag: DW_TAG_typedef, name: "light_info_t", file: !2500, line: 181, baseType: !2586)
!2586 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "light_info_s", file: !2500, line: 178, size: 32, flags: DIFlagTypePassByValue, elements: !2587, identifier: "_ZTS12light_info_s")
!2587 = !{!2588}
!2588 = !DIDerivedType(tag: DW_TAG_member, name: "intensity", scope: !2586, file: !2500, line: 180, baseType: !28, size: 32)
!2589 = !DIDerivedType(tag: DW_TAG_member, name: "powerup_info", scope: !2543, file: !2500, line: 249, baseType: !2590, size: 96)
!2590 = !DIDerivedType(tag: DW_TAG_typedef, name: "powerup_info_t", file: !2500, line: 190, baseType: !2591)
!2591 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "powerup_info_s", file: !2500, line: 185, size: 96, flags: DIFlagTypePassByValue, elements: !2592, identifier: "_ZTS14powerup_info_s")
!2592 = !{!2593, !2594, !2595}
!2593 = !DIDerivedType(tag: DW_TAG_member, name: "count", scope: !2591, file: !2500, line: 187, baseType: !32, size: 32)
!2594 = !DIDerivedType(tag: DW_TAG_member, name: "creation_time", scope: !2591, file: !2500, line: 188, baseType: !28, size: 32, offset: 32)
!2595 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !2591, file: !2500, line: 189, baseType: !32, size: 32, offset: 64)
!2596 = !DIDerivedType(tag: DW_TAG_member, name: "rtype", scope: !2501, file: !2500, line: 257, baseType: !2597, size: 608, offset: 1536)
!2597 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !2501, file: !2500, line: 253, size: 608, flags: DIFlagTypePassByValue, elements: !2598, identifier: "_ZTSN6objectUt1_E")
!2598 = !{!2599, !2617}
!2599 = !DIDerivedType(tag: DW_TAG_member, name: "pobj_info", scope: !2597, file: !2500, line: 255, baseType: !2600, size: 608)
!2600 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyobj_info", file: !2500, line: 208, baseType: !2601)
!2601 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "polyobj_info", file: !2500, line: 201, size: 608, flags: DIFlagTypePassByValue, elements: !2602, identifier: "_ZTS12polyobj_info")
!2602 = !{!2603, !2604, !2614, !2615, !2616}
!2603 = !DIDerivedType(tag: DW_TAG_member, name: "model_num", scope: !2601, file: !2500, line: 203, baseType: !32, size: 32)
!2604 = !DIDerivedType(tag: DW_TAG_member, name: "anim_angles", scope: !2601, file: !2500, line: 204, baseType: !2605, size: 480, offset: 32)
!2605 = !DICompositeType(tag: DW_TAG_array_type, baseType: !2606, size: 480, elements: !2612)
!2606 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_angvec", file: !23, line: 40, baseType: !2607)
!2607 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_angvec", file: !23, line: 37, size: 48, flags: DIFlagTypePassByValue, elements: !2608, identifier: "_ZTS10vms_angvec")
!2608 = !{!2609, !2610, !2611}
!2609 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !2607, file: !23, line: 39, baseType: !2539, size: 16)
!2610 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !2607, file: !23, line: 39, baseType: !2539, size: 16, offset: 16)
!2611 = !DIDerivedType(tag: DW_TAG_member, name: "h", scope: !2607, file: !23, line: 39, baseType: !2539, size: 16, offset: 32)
!2612 = !{!2613}
!2613 = !DISubrange(count: 10)
!2614 = !DIDerivedType(tag: DW_TAG_member, name: "subobj_flags", scope: !2601, file: !2500, line: 205, baseType: !32, size: 32, offset: 512)
!2615 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_override", scope: !2601, file: !2500, line: 206, baseType: !32, size: 32, offset: 544)
!2616 = !DIDerivedType(tag: DW_TAG_member, name: "alt_textures", scope: !2601, file: !2500, line: 207, baseType: !32, size: 32, offset: 576)
!2617 = !DIDerivedType(tag: DW_TAG_member, name: "vclip_info", scope: !2597, file: !2500, line: 256, baseType: !2618, size: 96)
!2618 = !DIDerivedType(tag: DW_TAG_typedef, name: "vclip_info_t", file: !2500, line: 197, baseType: !2619)
!2619 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vclip_info_s", file: !2500, line: 192, size: 96, flags: DIFlagTypePassByValue, elements: !2620, identifier: "_ZTS12vclip_info_s")
!2620 = !{!2621, !2622, !2623}
!2621 = !DIDerivedType(tag: DW_TAG_member, name: "vclip_num", scope: !2619, file: !2500, line: 194, baseType: !32, size: 32)
!2622 = !DIDerivedType(tag: DW_TAG_member, name: "frametime", scope: !2619, file: !2500, line: 195, baseType: !28, size: 32, offset: 32)
!2623 = !DIDerivedType(tag: DW_TAG_member, name: "framenum", scope: !2619, file: !2500, line: 196, baseType: !122, size: 8, offset: 64)
!2624 = !DILocalVariable(name: "intp", arg: 1, scope: !2495, file: !2, line: 680, type: !1398)
!2625 = !DILocation(line: 680, column: 40, scope: !2495)
!2626 = !DILocalVariable(name: "p0", arg: 2, scope: !2495, file: !2, line: 680, type: !1398)
!2627 = !DILocation(line: 680, column: 57, scope: !2495)
!2628 = !DILocalVariable(name: "p1", arg: 3, scope: !2495, file: !2, line: 680, type: !1398)
!2629 = !DILocation(line: 680, column: 72, scope: !2495)
!2630 = !DILocalVariable(name: "rad", arg: 4, scope: !2495, file: !2, line: 680, type: !28)
!2631 = !DILocation(line: 680, column: 79, scope: !2495)
!2632 = !DILocalVariable(name: "obj", arg: 5, scope: !2495, file: !2, line: 680, type: !2498)
!2633 = !DILocation(line: 680, column: 91, scope: !2495)
!2634 = !DILocalVariable(name: "otherobj", arg: 6, scope: !2495, file: !2, line: 680, type: !2498)
!2635 = !DILocation(line: 680, column: 103, scope: !2495)
!2636 = !DILocalVariable(name: "size", scope: !2637, file: !2, line: 683, type: !28)
!2637 = distinct !DILexicalBlock(scope: !2495, file: !2, line: 682, column: 2)
!2638 = !DILocation(line: 683, column: 6, scope: !2637)
!2639 = !DILocation(line: 683, column: 13, scope: !2637)
!2640 = !DILocation(line: 683, column: 18, scope: !2637)
!2641 = !DILocation(line: 685, column: 6, scope: !2642)
!2642 = distinct !DILexicalBlock(scope: !2637, file: !2, line: 685, column: 6)
!2643 = !DILocation(line: 685, column: 11, scope: !2642)
!2644 = !DILocation(line: 685, column: 16, scope: !2642)
!2645 = !DILocation(line: 685, column: 29, scope: !2642)
!2646 = !DILocation(line: 685, column: 43, scope: !2642)
!2647 = !DILocation(line: 685, column: 48, scope: !2642)
!2648 = !DILocation(line: 685, column: 32, scope: !2642)
!2649 = !DILocation(line: 685, column: 52, scope: !2642)
!2650 = !DILocation(line: 686, column: 11, scope: !2642)
!2651 = !DILocation(line: 686, column: 15, scope: !2642)
!2652 = !DILocation(line: 686, column: 18, scope: !2642)
!2653 = !DILocation(line: 686, column: 8, scope: !2642)
!2654 = !DILocation(line: 686, column: 3, scope: !2642)
!2655 = !DILocation(line: 689, column: 6, scope: !2656)
!2656 = distinct !DILexicalBlock(scope: !2637, file: !2, line: 689, column: 6)
!2657 = !DILocation(line: 689, column: 11, scope: !2656)
!2658 = !DILocation(line: 689, column: 16, scope: !2656)
!2659 = !DILocation(line: 689, column: 30, scope: !2656)
!2660 = !DILocation(line: 690, column: 7, scope: !2656)
!2661 = !DILocation(line: 690, column: 17, scope: !2656)
!2662 = !DILocation(line: 690, column: 22, scope: !2656)
!2663 = !DILocation(line: 690, column: 37, scope: !2656)
!2664 = !DILocation(line: 691, column: 7, scope: !2656)
!2665 = !DILocation(line: 691, column: 16, scope: !2656)
!2666 = !DILocation(line: 691, column: 6, scope: !2656)
!2667 = !DILocation(line: 691, column: 32, scope: !2656)
!2668 = !DILocation(line: 691, column: 35, scope: !2656)
!2669 = !DILocation(line: 691, column: 45, scope: !2656)
!2670 = !DILocation(line: 691, column: 50, scope: !2656)
!2671 = !DILocation(line: 691, column: 64, scope: !2656)
!2672 = !DILocation(line: 691, column: 67, scope: !2656)
!2673 = !DILocation(line: 691, column: 77, scope: !2656)
!2674 = !DILocation(line: 691, column: 94, scope: !2656)
!2675 = !DILocation(line: 691, column: 106, scope: !2656)
!2676 = !DILocation(line: 692, column: 10, scope: !2656)
!2677 = !DILocation(line: 692, column: 14, scope: !2656)
!2678 = !DILocation(line: 692, column: 8, scope: !2656)
!2679 = !DILocation(line: 692, column: 3, scope: !2656)
!2680 = !DILocation(line: 694, column: 34, scope: !2637)
!2681 = !DILocation(line: 694, column: 39, scope: !2637)
!2682 = !DILocation(line: 694, column: 42, scope: !2637)
!2683 = !DILocation(line: 694, column: 46, scope: !2637)
!2684 = !DILocation(line: 694, column: 51, scope: !2637)
!2685 = !DILocation(line: 694, column: 55, scope: !2637)
!2686 = !DILocation(line: 694, column: 60, scope: !2637)
!2687 = !DILocation(line: 694, column: 59, scope: !2637)
!2688 = !DILocation(line: 694, column: 9, scope: !2637)
!2689 = !DILocation(line: 694, column: 2, scope: !2637)
!2690 = distinct !DISubprogram(name: "find_vector_intersection", linkageName: "_Z24find_vector_intersectionP9fvi_queryP8fvi_info", scope: !2, file: !2, line: 731, type: !2691, scopeLine: 732, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !1379)
!2691 = !DISubroutineType(types: !2692)
!2692 = !{!32, !2693, !2705}
!2693 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2694, size: 64)
!2694 = !DIDerivedType(tag: DW_TAG_typedef, name: "fvi_query", file: !2695, line: 58, baseType: !2696)
!2695 = !DIFile(filename: "main_d2/fvi.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "d2a92d1b0ff4ebfc1a57eff3c7d6fa46")
!2696 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fvi_query", file: !2695, line: 50, size: 384, flags: DIFlagTypePassByValue, elements: !2697, identifier: "_ZTS9fvi_query")
!2697 = !{!2698, !2699, !2700, !2701, !2702, !2703, !2704}
!2698 = !DIDerivedType(tag: DW_TAG_member, name: "p0", scope: !2696, file: !2695, line: 52, baseType: !1398, size: 64)
!2699 = !DIDerivedType(tag: DW_TAG_member, name: "p1", scope: !2696, file: !2695, line: 52, baseType: !1398, size: 64, offset: 64)
!2700 = !DIDerivedType(tag: DW_TAG_member, name: "startseg", scope: !2696, file: !2695, line: 53, baseType: !32, size: 32, offset: 128)
!2701 = !DIDerivedType(tag: DW_TAG_member, name: "rad", scope: !2696, file: !2695, line: 54, baseType: !28, size: 32, offset: 160)
!2702 = !DIDerivedType(tag: DW_TAG_member, name: "thisobjnum", scope: !2696, file: !2695, line: 55, baseType: !55, size: 16, offset: 192)
!2703 = !DIDerivedType(tag: DW_TAG_member, name: "ignore_obj_list", scope: !2696, file: !2695, line: 56, baseType: !35, size: 64, offset: 256)
!2704 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !2696, file: !2695, line: 57, baseType: !32, size: 32, offset: 320)
!2705 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2706, size: 64)
!2706 = !DIDerivedType(tag: DW_TAG_typedef, name: "fvi_info", file: !2695, line: 40, baseType: !2707)
!2707 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fvi_info", file: !2695, line: 29, size: 3584, flags: DIFlagTypePassByValue, elements: !2708, identifier: "_ZTS8fvi_info")
!2708 = !{!2709, !2710, !2711, !2712, !2713, !2714, !2715, !2716, !2717}
!2709 = !DIDerivedType(tag: DW_TAG_member, name: "hit_type", scope: !2707, file: !2695, line: 31, baseType: !32, size: 32)
!2710 = !DIDerivedType(tag: DW_TAG_member, name: "hit_pnt", scope: !2707, file: !2695, line: 32, baseType: !70, size: 96, offset: 32)
!2711 = !DIDerivedType(tag: DW_TAG_member, name: "hit_seg", scope: !2707, file: !2695, line: 33, baseType: !32, size: 32, offset: 128)
!2712 = !DIDerivedType(tag: DW_TAG_member, name: "hit_side", scope: !2707, file: !2695, line: 34, baseType: !32, size: 32, offset: 160)
!2713 = !DIDerivedType(tag: DW_TAG_member, name: "hit_side_seg", scope: !2707, file: !2695, line: 35, baseType: !32, size: 32, offset: 192)
!2714 = !DIDerivedType(tag: DW_TAG_member, name: "hit_object", scope: !2707, file: !2695, line: 36, baseType: !32, size: 32, offset: 224)
!2715 = !DIDerivedType(tag: DW_TAG_member, name: "hit_wallnorm", scope: !2707, file: !2695, line: 37, baseType: !70, size: 96, offset: 256)
!2716 = !DIDerivedType(tag: DW_TAG_member, name: "n_segs", scope: !2707, file: !2695, line: 38, baseType: !32, size: 32, offset: 352)
!2717 = !DIDerivedType(tag: DW_TAG_member, name: "seglist", scope: !2707, file: !2695, line: 39, baseType: !2718, size: 3200, offset: 384)
!2718 = !DICompositeType(tag: DW_TAG_array_type, baseType: !32, size: 3200, elements: !56)
!2719 = !DILocalVariable(name: "fq", arg: 1, scope: !2690, file: !2, line: 731, type: !2693)
!2720 = !DILocation(line: 731, column: 41, scope: !2690)
!2721 = !DILocalVariable(name: "hit_data", arg: 2, scope: !2690, file: !2, line: 731, type: !2705)
!2722 = !DILocation(line: 731, column: 54, scope: !2690)
!2723 = !DILocalVariable(name: "hit_type", scope: !2724, file: !2, line: 857, type: !32)
!2724 = distinct !DILexicalBlock(scope: !2690, file: !2, line: 856, column: 2)
!2725 = !DILocation(line: 857, column: 6, scope: !2724)
!2726 = !DILocalVariable(name: "hit_seg", scope: !2724, file: !2, line: 857, type: !32)
!2727 = !DILocation(line: 857, column: 15, scope: !2724)
!2728 = !DILocalVariable(name: "hit_seg2", scope: !2724, file: !2, line: 857, type: !32)
!2729 = !DILocation(line: 857, column: 23, scope: !2724)
!2730 = !DILocalVariable(name: "hit_pnt", scope: !2724, file: !2, line: 858, type: !70)
!2731 = !DILocation(line: 858, column: 13, scope: !2724)
!2732 = !DILocalVariable(name: "i", scope: !2724, file: !2, line: 859, type: !32)
!2733 = !DILocation(line: 859, column: 6, scope: !2724)
!2734 = !DILocation(line: 861, column: 2, scope: !2724)
!2735 = !DILocation(line: 862, column: 2, scope: !2724)
!2736 = !DILocation(line: 0, scope: !2724)
!2737 = !DILocation(line: 864, column: 14, scope: !2724)
!2738 = !DILocation(line: 865, column: 15, scope: !2724)
!2739 = !DILocation(line: 867, column: 17, scope: !2724)
!2740 = !DILocation(line: 870, column: 21, scope: !2741)
!2741 = distinct !DILexicalBlock(scope: !2724, file: !2, line: 870, column: 5)
!2742 = !DILocation(line: 870, column: 25, scope: !2741)
!2743 = !DILocation(line: 870, column: 28, scope: !2741)
!2744 = !DILocation(line: 870, column: 32, scope: !2741)
!2745 = !DILocation(line: 870, column: 7, scope: !2741)
!2746 = !DILocation(line: 870, column: 44, scope: !2741)
!2747 = !DILocation(line: 870, column: 54, scope: !2741)
!2748 = !DILocation(line: 870, column: 5, scope: !2741)
!2749 = !DILocation(line: 872, column: 3, scope: !2750)
!2750 = distinct !DILexicalBlock(scope: !2741, file: !2, line: 870, column: 60)
!2751 = !DILocation(line: 872, column: 13, scope: !2750)
!2752 = !DILocation(line: 872, column: 22, scope: !2750)
!2753 = !DILocation(line: 873, column: 24, scope: !2750)
!2754 = !DILocation(line: 873, column: 28, scope: !2750)
!2755 = !DILocation(line: 873, column: 3, scope: !2750)
!2756 = !DILocation(line: 873, column: 13, scope: !2750)
!2757 = !DILocation(line: 873, column: 21, scope: !2750)
!2758 = !DILocation(line: 874, column: 23, scope: !2750)
!2759 = !DILocation(line: 874, column: 27, scope: !2750)
!2760 = !DILocation(line: 874, column: 3, scope: !2750)
!2761 = !DILocation(line: 874, column: 13, scope: !2750)
!2762 = !DILocation(line: 874, column: 21, scope: !2750)
!2763 = !DILocation(line: 875, column: 24, scope: !2750)
!2764 = !DILocation(line: 875, column: 34, scope: !2750)
!2765 = !DILocation(line: 875, column: 45, scope: !2750)
!2766 = !DILocation(line: 875, column: 3, scope: !2750)
!2767 = !DILocation(line: 875, column: 13, scope: !2750)
!2768 = !DILocation(line: 875, column: 22, scope: !2750)
!2769 = !DILocation(line: 876, column: 3, scope: !2750)
!2770 = !DILocation(line: 876, column: 13, scope: !2750)
!2771 = !DILocation(line: 876, column: 26, scope: !2750)
!2772 = !DILocation(line: 878, column: 10, scope: !2750)
!2773 = !DILocation(line: 878, column: 20, scope: !2750)
!2774 = !DILocation(line: 878, column: 3, scope: !2750)
!2775 = !DILocation(line: 881, column: 20, scope: !2724)
!2776 = !DILocation(line: 881, column: 24, scope: !2724)
!2777 = !DILocation(line: 881, column: 18, scope: !2724)
!2778 = !DILocation(line: 883, column: 16, scope: !2724)
!2779 = !DILocation(line: 885, column: 17, scope: !2724)
!2780 = !DILocation(line: 887, column: 26, scope: !2724)
!2781 = !DILocation(line: 887, column: 11, scope: !2724)
!2782 = !DILocation(line: 889, column: 40, scope: !2724)
!2783 = !DILocation(line: 889, column: 44, scope: !2724)
!2784 = !DILocation(line: 889, column: 47, scope: !2724)
!2785 = !DILocation(line: 889, column: 51, scope: !2724)
!2786 = !DILocation(line: 889, column: 60, scope: !2724)
!2787 = !DILocation(line: 889, column: 64, scope: !2724)
!2788 = !DILocation(line: 889, column: 67, scope: !2724)
!2789 = !DILocation(line: 889, column: 71, scope: !2724)
!2790 = !DILocation(line: 889, column: 75, scope: !2724)
!2791 = !DILocation(line: 889, column: 79, scope: !2724)
!2792 = !DILocation(line: 889, column: 90, scope: !2724)
!2793 = !DILocation(line: 889, column: 94, scope: !2724)
!2794 = !DILocation(line: 889, column: 110, scope: !2724)
!2795 = !DILocation(line: 889, column: 114, scope: !2724)
!2796 = !DILocation(line: 889, column: 120, scope: !2724)
!2797 = !DILocation(line: 889, column: 130, scope: !2724)
!2798 = !DILocation(line: 889, column: 139, scope: !2724)
!2799 = !DILocation(line: 889, column: 149, scope: !2724)
!2800 = !DILocation(line: 889, column: 13, scope: !2724)
!2801 = !DILocation(line: 889, column: 11, scope: !2724)
!2802 = !DILocation(line: 890, column: 6, scope: !2803)
!2803 = distinct !DILexicalBlock(scope: !2724, file: !2, line: 890, column: 6)
!2804 = !DILocation(line: 890, column: 14, scope: !2803)
!2805 = !DILocation(line: 890, column: 19, scope: !2803)
!2806 = !DILocation(line: 890, column: 46, scope: !2803)
!2807 = !DILocation(line: 890, column: 23, scope: !2803)
!2808 = !DILocation(line: 890, column: 58, scope: !2803)
!2809 = !DILocation(line: 890, column: 22, scope: !2803)
!2810 = !DILocation(line: 0, scope: !2803)
!2811 = !DILocation(line: 891, column: 13, scope: !2803)
!2812 = !DILocation(line: 891, column: 11, scope: !2803)
!2813 = !DILocation(line: 891, column: 3, scope: !2803)
!2814 = !DILocation(line: 893, column: 37, scope: !2803)
!2815 = !DILocation(line: 893, column: 41, scope: !2803)
!2816 = !DILocation(line: 893, column: 13, scope: !2803)
!2817 = !DILocation(line: 893, column: 11, scope: !2803)
!2818 = !DILocation(line: 895, column: 6, scope: !2819)
!2819 = distinct !DILexicalBlock(scope: !2724, file: !2, line: 895, column: 6)
!2820 = !DILocation(line: 895, column: 15, scope: !2819)
!2821 = !DILocation(line: 895, column: 27, scope: !2819)
!2822 = !DILocation(line: 895, column: 30, scope: !2819)
!2823 = !DILocation(line: 895, column: 37, scope: !2819)
!2824 = !DILocation(line: 896, column: 7, scope: !2825)
!2825 = distinct !DILexicalBlock(scope: !2819, file: !2, line: 896, column: 7)
!2826 = !DILocation(line: 896, column: 19, scope: !2825)
!2827 = !DILocation(line: 896, column: 24, scope: !2825)
!2828 = !DILocation(line: 896, column: 50, scope: !2825)
!2829 = !DILocation(line: 896, column: 27, scope: !2825)
!2830 = !DILocation(line: 896, column: 66, scope: !2825)
!2831 = !DILocation(line: 896, column: 76, scope: !2825)
!2832 = !DILocation(line: 0, scope: !2825)
!2833 = !DILocation(line: 897, column: 14, scope: !2825)
!2834 = !DILocation(line: 897, column: 12, scope: !2825)
!2835 = !DILocation(line: 897, column: 4, scope: !2825)
!2836 = !DILocation(line: 896, column: 78, scope: !2825)
!2837 = !DILocation(line: 899, column: 6, scope: !2838)
!2838 = distinct !DILexicalBlock(scope: !2724, file: !2, line: 899, column: 6)
!2839 = !DILocation(line: 899, column: 14, scope: !2838)
!2840 = !DILocalVariable(name: "new_hit_type", scope: !2841, file: !2, line: 900, type: !32)
!2841 = distinct !DILexicalBlock(scope: !2838, file: !2, line: 899, column: 21)
!2842 = !DILocation(line: 900, column: 7, scope: !2841)
!2843 = !DILocalVariable(name: "new_hit_seg2", scope: !2841, file: !2, line: 901, type: !32)
!2844 = !DILocation(line: 901, column: 7, scope: !2841)
!2845 = !DILocalVariable(name: "new_hit_pnt", scope: !2841, file: !2, line: 902, type: !70)
!2846 = !DILocation(line: 902, column: 14, scope: !2841)
!2847 = !DILocation(line: 904, column: 53, scope: !2841)
!2848 = !DILocation(line: 904, column: 57, scope: !2841)
!2849 = !DILocation(line: 904, column: 60, scope: !2841)
!2850 = !DILocation(line: 904, column: 64, scope: !2841)
!2851 = !DILocation(line: 904, column: 73, scope: !2841)
!2852 = !DILocation(line: 904, column: 77, scope: !2841)
!2853 = !DILocation(line: 904, column: 82, scope: !2841)
!2854 = !DILocation(line: 904, column: 86, scope: !2841)
!2855 = !DILocation(line: 904, column: 97, scope: !2841)
!2856 = !DILocation(line: 904, column: 101, scope: !2841)
!2857 = !DILocation(line: 904, column: 117, scope: !2841)
!2858 = !DILocation(line: 904, column: 121, scope: !2841)
!2859 = !DILocation(line: 904, column: 127, scope: !2841)
!2860 = !DILocation(line: 904, column: 137, scope: !2841)
!2861 = !DILocation(line: 904, column: 146, scope: !2841)
!2862 = !DILocation(line: 904, column: 156, scope: !2841)
!2863 = !DILocation(line: 904, column: 18, scope: !2841)
!2864 = !DILocation(line: 904, column: 16, scope: !2841)
!2865 = !DILocation(line: 906, column: 7, scope: !2866)
!2866 = distinct !DILexicalBlock(scope: !2841, file: !2, line: 906, column: 7)
!2867 = !DILocation(line: 906, column: 20, scope: !2866)
!2868 = !DILocation(line: 907, column: 14, scope: !2869)
!2869 = distinct !DILexicalBlock(scope: !2866, file: !2, line: 906, column: 27)
!2870 = !DILocation(line: 907, column: 12, scope: !2869)
!2871 = !DILocation(line: 908, column: 12, scope: !2869)
!2872 = !DILocation(line: 909, column: 3, scope: !2869)
!2873 = !DILocation(line: 910, column: 2, scope: !2841)
!2874 = !DILocation(line: 912, column: 6, scope: !2875)
!2875 = distinct !DILexicalBlock(scope: !2724, file: !2, line: 912, column: 6)
!2876 = !DILocation(line: 912, column: 13, scope: !2875)
!2877 = !DILocation(line: 912, column: 18, scope: !2875)
!2878 = !DILocation(line: 912, column: 21, scope: !2875)
!2879 = !DILocation(line: 912, column: 25, scope: !2875)
!2880 = !DILocation(line: 912, column: 30, scope: !2875)
!2881 = !DILocation(line: 913, column: 7, scope: !2882)
!2882 = distinct !DILexicalBlock(scope: !2875, file: !2, line: 913, column: 7)
!2883 = !DILocation(line: 913, column: 18, scope: !2882)
!2884 = !DILocation(line: 913, column: 28, scope: !2882)
!2885 = !DILocation(line: 913, column: 36, scope: !2882)
!2886 = !DILocation(line: 913, column: 46, scope: !2882)
!2887 = !DILocation(line: 913, column: 52, scope: !2882)
!2888 = !DILocation(line: 913, column: 15, scope: !2882)
!2889 = !DILocation(line: 913, column: 56, scope: !2882)
!2890 = !DILocation(line: 913, column: 59, scope: !2882)
!2891 = !DILocation(line: 913, column: 69, scope: !2882)
!2892 = !DILocation(line: 913, column: 75, scope: !2882)
!2893 = !DILocation(line: 914, column: 44, scope: !2882)
!2894 = !DILocation(line: 914, column: 4, scope: !2882)
!2895 = !DILocation(line: 914, column: 14, scope: !2882)
!2896 = !DILocation(line: 914, column: 22, scope: !2882)
!2897 = !DILocation(line: 914, column: 32, scope: !2882)
!2898 = !DILocation(line: 914, column: 38, scope: !2882)
!2899 = !DILocation(line: 914, column: 42, scope: !2882)
!2900 = !DILocation(line: 913, column: 89, scope: !2882)
!2901 = !DILocation(line: 916, column: 6, scope: !2902)
!2902 = distinct !DILexicalBlock(scope: !2724, file: !2, line: 916, column: 6)
!2903 = !DILocation(line: 916, column: 13, scope: !2902)
!2904 = !DILocation(line: 916, column: 18, scope: !2902)
!2905 = !DILocation(line: 916, column: 21, scope: !2902)
!2906 = !DILocation(line: 916, column: 25, scope: !2902)
!2907 = !DILocation(line: 916, column: 30, scope: !2902)
!2908 = !DILocation(line: 917, column: 9, scope: !2909)
!2909 = distinct !DILexicalBlock(scope: !2902, file: !2, line: 917, column: 3)
!2910 = !DILocation(line: 917, column: 8, scope: !2909)
!2911 = !DILocation(line: 917, column: 12, scope: !2912)
!2912 = distinct !DILexicalBlock(scope: !2909, file: !2, line: 917, column: 3)
!2913 = !DILocation(line: 917, column: 14, scope: !2912)
!2914 = !DILocation(line: 917, column: 24, scope: !2912)
!2915 = !DILocation(line: 917, column: 13, scope: !2912)
!2916 = !DILocation(line: 917, column: 31, scope: !2912)
!2917 = !DILocation(line: 917, column: 34, scope: !2912)
!2918 = !DILocation(line: 917, column: 35, scope: !2912)
!2919 = !DILocation(line: 0, scope: !2912)
!2920 = !DILocation(line: 917, column: 3, scope: !2909)
!2921 = !DILocation(line: 918, column: 8, scope: !2922)
!2922 = distinct !DILexicalBlock(scope: !2912, file: !2, line: 918, column: 8)
!2923 = !DILocation(line: 918, column: 18, scope: !2922)
!2924 = !DILocation(line: 918, column: 26, scope: !2922)
!2925 = !DILocation(line: 918, column: 32, scope: !2922)
!2926 = !DILocation(line: 918, column: 29, scope: !2922)
!2927 = !DILocation(line: 919, column: 24, scope: !2928)
!2928 = distinct !DILexicalBlock(scope: !2922, file: !2, line: 918, column: 41)
!2929 = !DILocation(line: 919, column: 25, scope: !2928)
!2930 = !DILocation(line: 919, column: 5, scope: !2928)
!2931 = !DILocation(line: 919, column: 15, scope: !2928)
!2932 = !DILocation(line: 919, column: 22, scope: !2928)
!2933 = !DILocation(line: 920, column: 5, scope: !2928)
!2934 = !DILocation(line: 917, column: 52, scope: !2912)
!2935 = !DILocation(line: 917, column: 3, scope: !2912)
!2936 = distinct !{!2936, !2920, !2937, !1730}
!2937 = !DILocation(line: 921, column: 4, scope: !2909)
!2938 = !DILocation(line: 923, column: 2, scope: !2724)
!2939 = !DILocation(line: 925, column: 24, scope: !2724)
!2940 = !DILocation(line: 925, column: 2, scope: !2724)
!2941 = !DILocation(line: 925, column: 12, scope: !2724)
!2942 = !DILocation(line: 925, column: 22, scope: !2724)
!2943 = !DILocation(line: 926, column: 2, scope: !2724)
!2944 = !DILocation(line: 926, column: 12, scope: !2724)
!2945 = !DILocation(line: 926, column: 22, scope: !2724)
!2946 = !DILocation(line: 927, column: 24, scope: !2724)
!2947 = !DILocation(line: 927, column: 2, scope: !2724)
!2948 = !DILocation(line: 927, column: 12, scope: !2724)
!2949 = !DILocation(line: 927, column: 22, scope: !2724)
!2950 = !DILocation(line: 928, column: 25, scope: !2724)
!2951 = !DILocation(line: 928, column: 2, scope: !2724)
!2952 = !DILocation(line: 928, column: 12, scope: !2724)
!2953 = !DILocation(line: 928, column: 23, scope: !2724)
!2954 = !DILocation(line: 929, column: 27, scope: !2724)
!2955 = !DILocation(line: 929, column: 2, scope: !2724)
!2956 = !DILocation(line: 929, column: 12, scope: !2724)
!2957 = !DILocation(line: 929, column: 25, scope: !2724)
!2958 = !DILocation(line: 930, column: 25, scope: !2724)
!2959 = !DILocation(line: 930, column: 2, scope: !2724)
!2960 = !DILocation(line: 930, column: 12, scope: !2724)
!2961 = !DILocation(line: 930, column: 23, scope: !2724)
!2962 = !DILocation(line: 931, column: 2, scope: !2724)
!2963 = !DILocation(line: 931, column: 12, scope: !2724)
!2964 = !DILocation(line: 931, column: 25, scope: !2724)
!2965 = !DILocation(line: 933, column: 9, scope: !2724)
!2966 = !DILocation(line: 933, column: 2, scope: !2724)
!2967 = !DILocation(line: 935, column: 1, scope: !2690)
!2968 = distinct !DISubprogram(name: "fvi_sub", linkageName: "_Z7fvi_subP10vms_vectorPiS0_iS0_isS1_iS1_S1_i", scope: !2, file: !2, line: 951, type: !2969, scopeLine: 952, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !1379)
!2969 = !DISubroutineType(types: !2970)
!2970 = !{!32, !1398, !35, !1398, !32, !1398, !28, !55, !35, !32, !35, !35, !32}
!2971 = !DILocalVariable(name: "intp", arg: 1, scope: !2968, file: !2, line: 951, type: !1398)
!2972 = !DILocation(line: 951, column: 25, scope: !2968)
!2973 = !DILocalVariable(name: "ints", arg: 2, scope: !2968, file: !2, line: 951, type: !35)
!2974 = !DILocation(line: 951, column: 35, scope: !2968)
!2975 = !DILocalVariable(name: "p0", arg: 3, scope: !2968, file: !2, line: 951, type: !1398)
!2976 = !DILocation(line: 951, column: 52, scope: !2968)
!2977 = !DILocalVariable(name: "startseg", arg: 4, scope: !2968, file: !2, line: 951, type: !32)
!2978 = !DILocation(line: 951, column: 59, scope: !2968)
!2979 = !DILocalVariable(name: "p1", arg: 5, scope: !2968, file: !2, line: 951, type: !1398)
!2980 = !DILocation(line: 951, column: 80, scope: !2968)
!2981 = !DILocalVariable(name: "rad", arg: 6, scope: !2968, file: !2, line: 951, type: !28)
!2982 = !DILocation(line: 951, column: 87, scope: !2968)
!2983 = !DILocalVariable(name: "thisobjnum", arg: 7, scope: !2968, file: !2, line: 951, type: !55)
!2984 = !DILocation(line: 951, column: 97, scope: !2968)
!2985 = !DILocalVariable(name: "ignore_obj_list", arg: 8, scope: !2968, file: !2, line: 951, type: !35)
!2986 = !DILocation(line: 951, column: 113, scope: !2968)
!2987 = !DILocalVariable(name: "flags", arg: 9, scope: !2968, file: !2, line: 951, type: !32)
!2988 = !DILocation(line: 951, column: 133, scope: !2968)
!2989 = !DILocalVariable(name: "seglist", arg: 10, scope: !2968, file: !2, line: 951, type: !35)
!2990 = !DILocation(line: 951, column: 144, scope: !2968)
!2991 = !DILocalVariable(name: "n_segs", arg: 11, scope: !2968, file: !2, line: 951, type: !35)
!2992 = !DILocation(line: 951, column: 157, scope: !2968)
!2993 = !DILocalVariable(name: "entry_seg", arg: 12, scope: !2968, file: !2, line: 951, type: !32)
!2994 = !DILocation(line: 951, column: 168, scope: !2968)
!2995 = !DILocalVariable(name: "seg", scope: !2968, file: !2, line: 953, type: !1884)
!2996 = !DILocation(line: 953, column: 11, scope: !2968)
!2997 = !DILocalVariable(name: "startmask", scope: !2968, file: !2, line: 954, type: !32)
!2998 = !DILocation(line: 954, column: 6, scope: !2968)
!2999 = !DILocalVariable(name: "endmask", scope: !2968, file: !2, line: 954, type: !32)
!3000 = !DILocation(line: 954, column: 16, scope: !2968)
!3001 = !DILocalVariable(name: "centermask", scope: !2968, file: !2, line: 956, type: !32)
!3002 = !DILocation(line: 956, column: 6, scope: !2968)
!3003 = !DILocalVariable(name: "objnum", scope: !2968, file: !2, line: 957, type: !32)
!3004 = !DILocation(line: 957, column: 6, scope: !2968)
!3005 = !DILocalVariable(name: "masks", scope: !2968, file: !2, line: 958, type: !3006)
!3006 = !DIDerivedType(tag: DW_TAG_typedef, name: "segmasks", file: !3007, line: 28, baseType: !3008)
!3007 = !DIFile(filename: "main_d2/gameseg.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "2f09aa3974052ccf59737bf78b36c142")
!3008 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "segmasks", file: !3007, line: 24, size: 32, flags: DIFlagTypePassByValue, elements: !3009, identifier: "_ZTS8segmasks")
!3009 = !{!3010, !3011, !3012}
!3010 = !DIDerivedType(tag: DW_TAG_member, name: "facemask", scope: !3008, file: !3007, line: 25, baseType: !55, size: 16)
!3011 = !DIDerivedType(tag: DW_TAG_member, name: "sidemask", scope: !3008, file: !3007, line: 26, baseType: !122, size: 8, offset: 16)
!3012 = !DIDerivedType(tag: DW_TAG_member, name: "centermask", scope: !3008, file: !3007, line: 27, baseType: !122, size: 8, offset: 24)
!3013 = !DILocation(line: 958, column: 11, scope: !2968)
!3014 = !DILocalVariable(name: "hit_point", scope: !2968, file: !2, line: 959, type: !70)
!3015 = !DILocation(line: 959, column: 13, scope: !2968)
!3016 = !DILocalVariable(name: "closest_hit_point", scope: !2968, file: !2, line: 959, type: !70)
!3017 = !DILocation(line: 959, column: 23, scope: !2968)
!3018 = !DILocalVariable(name: "d", scope: !2968, file: !2, line: 960, type: !28)
!3019 = !DILocation(line: 960, column: 6, scope: !2968)
!3020 = !DILocalVariable(name: "closest_d", scope: !2968, file: !2, line: 960, type: !28)
!3021 = !DILocation(line: 960, column: 8, scope: !2968)
!3022 = !DILocalVariable(name: "hit_type", scope: !2968, file: !2, line: 961, type: !32)
!3023 = !DILocation(line: 961, column: 6, scope: !2968)
!3024 = !DILocalVariable(name: "hit_seg", scope: !2968, file: !2, line: 962, type: !32)
!3025 = !DILocation(line: 962, column: 6, scope: !2968)
!3026 = !DILocalVariable(name: "hit_none_seg", scope: !2968, file: !2, line: 963, type: !32)
!3027 = !DILocation(line: 963, column: 6, scope: !2968)
!3028 = !DILocalVariable(name: "hit_none_n_segs", scope: !2968, file: !2, line: 964, type: !32)
!3029 = !DILocation(line: 964, column: 6, scope: !2968)
!3030 = !DILocalVariable(name: "hit_none_seglist", scope: !2968, file: !2, line: 965, type: !2718)
!3031 = !DILocation(line: 965, column: 6, scope: !2968)
!3032 = !DILocalVariable(name: "cur_nest_level", scope: !2968, file: !2, line: 966, type: !32)
!3033 = !DILocation(line: 966, column: 6, scope: !2968)
!3034 = !DILocation(line: 966, column: 23, scope: !2968)
!3035 = !DILocation(line: 991, column: 6, scope: !3036)
!3036 = distinct !DILexicalBlock(scope: !2968, file: !2, line: 991, column: 6)
!3037 = !DILocation(line: 991, column: 11, scope: !3036)
!3038 = !DILocation(line: 992, column: 14, scope: !3036)
!3039 = !DILocation(line: 992, column: 4, scope: !3036)
!3040 = !DILocation(line: 992, column: 12, scope: !3036)
!3041 = !DILocation(line: 992, column: 3, scope: !3036)
!3042 = !DILocation(line: 993, column: 3, scope: !2968)
!3043 = !DILocation(line: 993, column: 9, scope: !2968)
!3044 = !DILocation(line: 995, column: 18, scope: !2968)
!3045 = !DILocation(line: 995, column: 9, scope: !2968)
!3046 = !DILocation(line: 995, column: 6, scope: !2968)
!3047 = !DILocation(line: 997, column: 16, scope: !2968)
!3048 = !DILocation(line: 1000, column: 6, scope: !3049)
!3049 = distinct !DILexicalBlock(scope: !2968, file: !2, line: 1000, column: 6)
!3050 = !DILocation(line: 1000, column: 12, scope: !3049)
!3051 = !DILocation(line: 1001, column: 15, scope: !3052)
!3052 = distinct !DILexicalBlock(scope: !3049, file: !2, line: 1001, column: 3)
!3053 = !DILocation(line: 1001, column: 20, scope: !3052)
!3054 = !DILocation(line: 1001, column: 14, scope: !3052)
!3055 = !DILocation(line: 1001, column: 8, scope: !3052)
!3056 = !DILocation(line: 1001, column: 28, scope: !3057)
!3057 = distinct !DILexicalBlock(scope: !3052, file: !2, line: 1001, column: 3)
!3058 = !DILocation(line: 1001, column: 34, scope: !3057)
!3059 = !DILocation(line: 1001, column: 3, scope: !3052)
!3060 = !DILocation(line: 1002, column: 19, scope: !3061)
!3061 = distinct !DILexicalBlock(scope: !3057, file: !2, line: 1002, column: 9)
!3062 = !DILocation(line: 1002, column: 11, scope: !3061)
!3063 = !DILocation(line: 1002, column: 27, scope: !3061)
!3064 = !DILocation(line: 1002, column: 33, scope: !3061)
!3065 = !DILocation(line: 1002, column: 10, scope: !3061)
!3066 = !DILocation(line: 1002, column: 54, scope: !3061)
!3067 = !DILocation(line: 1003, column: 9, scope: !3061)
!3068 = !DILocation(line: 1003, column: 23, scope: !3061)
!3069 = !DILocation(line: 1003, column: 20, scope: !3061)
!3070 = !DILocation(line: 1003, column: 32, scope: !3061)
!3071 = !DILocation(line: 1004, column: 8, scope: !3061)
!3072 = !DILocation(line: 1004, column: 23, scope: !3061)
!3073 = !DILocation(line: 1004, column: 30, scope: !3061)
!3074 = !DILocation(line: 1004, column: 46, scope: !3061)
!3075 = !DILocation(line: 1004, column: 53, scope: !3061)
!3076 = !DILocation(line: 1004, column: 34, scope: !3061)
!3077 = !DILocation(line: 1004, column: 71, scope: !3061)
!3078 = !DILocation(line: 1005, column: 27, scope: !3061)
!3079 = !DILocation(line: 1005, column: 35, scope: !3061)
!3080 = !DILocation(line: 1005, column: 8, scope: !3061)
!3081 = !DILocation(line: 1005, column: 48, scope: !3061)
!3082 = !DILocation(line: 1006, column: 10, scope: !3061)
!3083 = !DILocation(line: 1006, column: 22, scope: !3061)
!3084 = !DILocation(line: 1006, column: 28, scope: !3061)
!3085 = !DILocation(line: 1007, column: 34, scope: !3061)
!3086 = !DILocation(line: 1007, column: 26, scope: !3061)
!3087 = !DILocation(line: 1007, column: 46, scope: !3061)
!3088 = !DILocation(line: 1007, column: 10, scope: !3061)
!3089 = !DILocation(line: 1007, column: 60, scope: !3061)
!3090 = !DILocation(line: 1007, column: 52, scope: !3061)
!3091 = !DILocation(line: 1007, column: 68, scope: !3061)
!3092 = !DILocation(line: 1007, column: 74, scope: !3061)
!3093 = !DILocation(line: 1007, column: 94, scope: !3061)
!3094 = !DILocation(line: 1008, column: 34, scope: !3061)
!3095 = !DILocation(line: 1008, column: 26, scope: !3061)
!3096 = !DILocation(line: 1008, column: 42, scope: !3061)
!3097 = !DILocation(line: 1008, column: 10, scope: !3061)
!3098 = !DILocation(line: 1008, column: 56, scope: !3061)
!3099 = !DILocation(line: 1008, column: 48, scope: !3061)
!3100 = !DILocation(line: 1008, column: 68, scope: !3061)
!3101 = !DILocation(line: 1008, column: 74, scope: !3061)
!3102 = !DILocalVariable(name: "fudged_rad", scope: !3103, file: !2, line: 1009, type: !32)
!3103 = distinct !DILexicalBlock(scope: !3061, file: !2, line: 1008, column: 96)
!3104 = !DILocation(line: 1009, column: 9, scope: !3103)
!3105 = !DILocation(line: 1009, column: 22, scope: !3103)
!3106 = !DILocation(line: 1012, column: 17, scope: !3107)
!3107 = distinct !DILexicalBlock(scope: !3103, file: !2, line: 1012, column: 9)
!3108 = !DILocation(line: 1012, column: 9, scope: !3107)
!3109 = !DILocation(line: 1012, column: 25, scope: !3107)
!3110 = !DILocation(line: 1012, column: 30, scope: !3107)
!3111 = !DILocation(line: 1013, column: 10, scope: !3112)
!3112 = distinct !DILexicalBlock(scope: !3107, file: !2, line: 1013, column: 10)
!3113 = !DILocation(line: 1013, column: 16, scope: !3112)
!3114 = !DILocation(line: 1014, column: 7, scope: !3112)
!3115 = !DILocation(line: 1013, column: 18, scope: !3112)
!3116 = !DILocation(line: 1017, column: 17, scope: !3117)
!3117 = distinct !DILexicalBlock(scope: !3103, file: !2, line: 1017, column: 9)
!3118 = !DILocation(line: 1017, column: 9, scope: !3117)
!3119 = !DILocation(line: 1017, column: 29, scope: !3117)
!3120 = !DILocation(line: 1017, column: 34, scope: !3117)
!3121 = !DILocation(line: 1018, column: 18, scope: !3122)
!3122 = distinct !DILexicalBlock(scope: !3117, file: !2, line: 1018, column: 10)
!3123 = !DILocation(line: 1018, column: 10, scope: !3122)
!3124 = !DILocation(line: 1018, column: 26, scope: !3122)
!3125 = !DILocation(line: 1018, column: 31, scope: !3122)
!3126 = !DILocation(line: 1020, column: 8, scope: !3122)
!3127 = !DILocation(line: 1018, column: 34, scope: !3122)
!3128 = !DILocation(line: 1022, column: 17, scope: !3129)
!3129 = distinct !DILexicalBlock(scope: !3103, file: !2, line: 1022, column: 9)
!3130 = !DILocation(line: 1022, column: 9, scope: !3129)
!3131 = !DILocation(line: 1022, column: 29, scope: !3129)
!3132 = !DILocation(line: 1022, column: 34, scope: !3129)
!3133 = !DILocation(line: 1022, column: 47, scope: !3129)
!3134 = !DILocation(line: 1022, column: 69, scope: !3129)
!3135 = !DILocation(line: 1022, column: 61, scope: !3129)
!3136 = !DILocation(line: 1022, column: 81, scope: !3129)
!3137 = !DILocation(line: 1022, column: 50, scope: !3129)
!3138 = !DILocation(line: 1022, column: 85, scope: !3129)
!3139 = !DILocation(line: 1023, column: 20, scope: !3129)
!3140 = !DILocation(line: 1023, column: 23, scope: !3129)
!3141 = !DILocation(line: 1023, column: 26, scope: !3129)
!3142 = !DILocation(line: 1023, column: 17, scope: !3129)
!3143 = !DILocation(line: 1023, column: 6, scope: !3129)
!3144 = !DILocation(line: 1026, column: 17, scope: !3145)
!3145 = distinct !DILexicalBlock(scope: !3103, file: !2, line: 1026, column: 9)
!3146 = !DILocation(line: 1026, column: 9, scope: !3145)
!3147 = !DILocation(line: 1026, column: 29, scope: !3145)
!3148 = !DILocation(line: 1026, column: 34, scope: !3145)
!3149 = !DILocation(line: 1026, column: 48, scope: !3145)
!3150 = !DILocation(line: 1027, column: 17, scope: !3145)
!3151 = !DILocation(line: 1027, column: 9, scope: !3145)
!3152 = !DILocation(line: 1027, column: 25, scope: !3145)
!3153 = !DILocation(line: 1027, column: 30, scope: !3145)
!3154 = !DILocation(line: 1027, column: 45, scope: !3145)
!3155 = !DILocation(line: 1028, column: 9, scope: !3145)
!3156 = !DILocation(line: 1028, column: 18, scope: !3145)
!3157 = !DILocation(line: 1028, column: 8, scope: !3145)
!3158 = !DILocation(line: 1028, column: 34, scope: !3145)
!3159 = !DILocation(line: 1028, column: 46, scope: !3145)
!3160 = !DILocation(line: 1028, column: 38, scope: !3145)
!3161 = !DILocation(line: 1028, column: 54, scope: !3145)
!3162 = !DILocation(line: 1028, column: 59, scope: !3145)
!3163 = !DILocation(line: 1028, column: 73, scope: !3145)
!3164 = !DILocation(line: 1028, column: 84, scope: !3145)
!3165 = !DILocation(line: 1028, column: 76, scope: !3145)
!3166 = !DILocation(line: 1028, column: 92, scope: !3145)
!3167 = !DILocation(line: 1028, column: 109, scope: !3145)
!3168 = !DILocation(line: 1028, column: 121, scope: !3145)
!3169 = !DILocation(line: 1029, column: 19, scope: !3145)
!3170 = !DILocation(line: 1029, column: 22, scope: !3145)
!3171 = !DILocation(line: 1029, column: 17, scope: !3145)
!3172 = !DILocation(line: 1029, column: 6, scope: !3145)
!3173 = !DILocation(line: 1031, column: 43, scope: !3103)
!3174 = !DILocation(line: 1031, column: 46, scope: !3103)
!3175 = !DILocation(line: 1031, column: 49, scope: !3103)
!3176 = !DILocation(line: 1031, column: 69, scope: !3103)
!3177 = !DILocation(line: 1031, column: 61, scope: !3103)
!3178 = !DILocation(line: 1031, column: 86, scope: !3103)
!3179 = !DILocation(line: 1031, column: 78, scope: !3103)
!3180 = !DILocation(line: 1031, column: 9, scope: !3103)
!3181 = !DILocation(line: 1031, column: 7, scope: !3103)
!3182 = !DILocation(line: 1033, column: 9, scope: !3183)
!3183 = distinct !DILexicalBlock(scope: !3103, file: !2, line: 1033, column: 9)
!3184 = !DILocation(line: 1034, column: 10, scope: !3185)
!3185 = distinct !DILexicalBlock(scope: !3183, file: !2, line: 1034, column: 10)
!3186 = !DILocation(line: 1034, column: 14, scope: !3185)
!3187 = !DILocation(line: 1034, column: 12, scope: !3185)
!3188 = !DILocation(line: 1035, column: 24, scope: !3189)
!3189 = distinct !DILexicalBlock(scope: !3185, file: !2, line: 1034, column: 25)
!3190 = !DILocation(line: 1035, column: 22, scope: !3189)
!3191 = !DILocation(line: 1036, column: 7, scope: !3189)
!3192 = !DILocation(line: 1037, column: 19, scope: !3189)
!3193 = !DILocation(line: 1037, column: 17, scope: !3189)
!3194 = !DILocation(line: 1038, column: 25, scope: !3189)
!3195 = !DILocation(line: 1039, column: 15, scope: !3189)
!3196 = !DILocation(line: 1040, column: 6, scope: !3189)
!3197 = !DILocation(line: 1041, column: 4, scope: !3103)
!3198 = !DILocation(line: 1008, column: 93, scope: !3061)
!3199 = !DILocation(line: 1001, column: 54, scope: !3057)
!3200 = !DILocation(line: 1001, column: 46, scope: !3057)
!3201 = !DILocation(line: 1001, column: 62, scope: !3057)
!3202 = !DILocation(line: 1001, column: 45, scope: !3057)
!3203 = !DILocation(line: 1001, column: 3, scope: !3057)
!3204 = distinct !{!3204, !3059, !3205, !1730}
!3205 = !DILocation(line: 1041, column: 4, scope: !3052)
!3206 = !DILocation(line: 1043, column: 8, scope: !3207)
!3207 = distinct !DILexicalBlock(scope: !2968, file: !2, line: 1043, column: 7)
!3208 = !DILocation(line: 1043, column: 19, scope: !3207)
!3209 = !DILocation(line: 1043, column: 26, scope: !3207)
!3210 = !DILocation(line: 1043, column: 54, scope: !3207)
!3211 = !DILocation(line: 1043, column: 46, scope: !3207)
!3212 = !DILocation(line: 1043, column: 66, scope: !3207)
!3213 = !DILocation(line: 1043, column: 30, scope: !3207)
!3214 = !DILocation(line: 1043, column: 82, scope: !3207)
!3215 = !DILocation(line: 1044, column: 7, scope: !3207)
!3216 = !DILocation(line: 1044, column: 3, scope: !3207)
!3217 = !DILocation(line: 1048, column: 28, scope: !2968)
!3218 = !DILocation(line: 1048, column: 31, scope: !2968)
!3219 = !DILocation(line: 1048, column: 40, scope: !2968)
!3220 = !DILocation(line: 1048, column: 14, scope: !2968)
!3221 = !DILocation(line: 1048, column: 45, scope: !2968)
!3222 = !DILocation(line: 1048, column: 12, scope: !2968)
!3223 = !DILocation(line: 1050, column: 24, scope: !2968)
!3224 = !DILocation(line: 1050, column: 27, scope: !2968)
!3225 = !DILocation(line: 1050, column: 36, scope: !2968)
!3226 = !DILocation(line: 1050, column: 10, scope: !2968)
!3227 = !DILocation(line: 1050, column: 8, scope: !2968)
!3228 = !DILocation(line: 1051, column: 18, scope: !2968)
!3229 = !DILocation(line: 1051, column: 12, scope: !2968)
!3230 = !DILocation(line: 1051, column: 10, scope: !2968)
!3231 = !DILocation(line: 1053, column: 21, scope: !2968)
!3232 = !DILocation(line: 1053, column: 15, scope: !2968)
!3233 = !DILocation(line: 1053, column: 13, scope: !2968)
!3234 = !DILocation(line: 1055, column: 6, scope: !3235)
!3235 = distinct !DILexicalBlock(scope: !2968, file: !2, line: 1055, column: 6)
!3236 = !DILocation(line: 1055, column: 16, scope: !3235)
!3237 = !DILocation(line: 1055, column: 36, scope: !3235)
!3238 = !DILocation(line: 1055, column: 34, scope: !3235)
!3239 = !DILocation(line: 1055, column: 21, scope: !3235)
!3240 = !DILocation(line: 1057, column: 6, scope: !3241)
!3241 = distinct !DILexicalBlock(scope: !2968, file: !2, line: 1057, column: 6)
!3242 = !DILocation(line: 1057, column: 14, scope: !3241)
!3243 = !DILocalVariable(name: "side", scope: !3244, file: !2, line: 1059, type: !32)
!3244 = distinct !DILexicalBlock(scope: !3241, file: !2, line: 1057, column: 20)
!3245 = !DILocation(line: 1059, column: 7, scope: !3244)
!3246 = !DILocalVariable(name: "bit", scope: !3244, file: !2, line: 1059, type: !32)
!3247 = !DILocation(line: 1059, column: 12, scope: !3244)
!3248 = !DILocalVariable(name: "face", scope: !3244, file: !2, line: 1059, type: !32)
!3249 = !DILocation(line: 1059, column: 16, scope: !3244)
!3250 = !DILocation(line: 1063, column: 12, scope: !3251)
!3251 = distinct !DILexicalBlock(scope: !3244, file: !2, line: 1063, column: 3)
!3252 = !DILocation(line: 1063, column: 18, scope: !3251)
!3253 = !DILocation(line: 1063, column: 8, scope: !3251)
!3254 = !DILocation(line: 1063, column: 21, scope: !3255)
!3255 = distinct !DILexicalBlock(scope: !3251, file: !2, line: 1063, column: 3)
!3256 = !DILocation(line: 1063, column: 25, scope: !3255)
!3257 = !DILocation(line: 1063, column: 28, scope: !3255)
!3258 = !DILocation(line: 1063, column: 31, scope: !3255)
!3259 = !DILocation(line: 1063, column: 40, scope: !3255)
!3260 = !DILocation(line: 1063, column: 38, scope: !3255)
!3261 = !DILocation(line: 0, scope: !3255)
!3262 = !DILocation(line: 1063, column: 3, scope: !3251)
!3263 = !DILocalVariable(name: "num_faces", scope: !3264, file: !2, line: 1064, type: !32)
!3264 = distinct !DILexicalBlock(scope: !3255, file: !2, line: 1063, column: 52)
!3265 = !DILocation(line: 1064, column: 8, scope: !3264)
!3266 = !DILocation(line: 1065, column: 31, scope: !3264)
!3267 = !DILocation(line: 1065, column: 36, scope: !3264)
!3268 = !DILocation(line: 1065, column: 42, scope: !3264)
!3269 = !DILocation(line: 1065, column: 16, scope: !3264)
!3270 = !DILocation(line: 1065, column: 14, scope: !3264)
!3271 = !DILocation(line: 1067, column: 8, scope: !3272)
!3272 = distinct !DILexicalBlock(scope: !3264, file: !2, line: 1067, column: 8)
!3273 = !DILocation(line: 1067, column: 18, scope: !3272)
!3274 = !DILocation(line: 1068, column: 15, scope: !3272)
!3275 = !DILocation(line: 1068, column: 5, scope: !3272)
!3276 = !DILocation(line: 1072, column: 13, scope: !3277)
!3277 = distinct !DILexicalBlock(scope: !3264, file: !2, line: 1072, column: 4)
!3278 = !DILocation(line: 1072, column: 9, scope: !3277)
!3279 = !DILocation(line: 1072, column: 16, scope: !3280)
!3280 = distinct !DILexicalBlock(scope: !3277, file: !2, line: 1072, column: 4)
!3281 = !DILocation(line: 1072, column: 20, scope: !3280)
!3282 = !DILocation(line: 1072, column: 4, scope: !3277)
!3283 = !DILocation(line: 1074, column: 9, scope: !3284)
!3284 = distinct !DILexicalBlock(scope: !3285, file: !2, line: 1074, column: 9)
!3285 = distinct !DILexicalBlock(scope: !3280, file: !2, line: 1072, column: 39)
!3286 = !DILocation(line: 1074, column: 19, scope: !3284)
!3287 = !DILocation(line: 1074, column: 17, scope: !3284)
!3288 = !DILocalVariable(name: "face_hit_type", scope: !3289, file: !2, line: 1075, type: !32)
!3289 = distinct !DILexicalBlock(scope: !3284, file: !2, line: 1074, column: 24)
!3290 = !DILocation(line: 1075, column: 10, scope: !3289)
!3291 = !DILocation(line: 1078, column: 10, scope: !3292)
!3292 = distinct !DILexicalBlock(scope: !3289, file: !2, line: 1078, column: 10)
!3293 = !DILocation(line: 1078, column: 15, scope: !3292)
!3294 = !DILocation(line: 1078, column: 24, scope: !3292)
!3295 = !DILocation(line: 1078, column: 33, scope: !3292)
!3296 = !DILocation(line: 1078, column: 30, scope: !3292)
!3297 = !DILocation(line: 1079, column: 7, scope: !3292)
!3298 = !DILocation(line: 1084, column: 10, scope: !3299)
!3299 = distinct !DILexicalBlock(scope: !3289, file: !2, line: 1084, column: 10)
!3300 = !DILocation(line: 1084, column: 22, scope: !3299)
!3301 = !DILocation(line: 1084, column: 20, scope: !3299)
!3302 = !DILocation(line: 1086, column: 11, scope: !3299)
!3303 = !DILocation(line: 1086, column: 14, scope: !3299)
!3304 = !DILocation(line: 1086, column: 17, scope: !3299)
!3305 = !DILocation(line: 1086, column: 21, scope: !3299)
!3306 = !DILocation(line: 1087, column: 11, scope: !3299)
!3307 = !DILocation(line: 1088, column: 13, scope: !3299)
!3308 = !DILocation(line: 1088, column: 22, scope: !3299)
!3309 = !DILocation(line: 1088, column: 12, scope: !3299)
!3310 = !DILocation(line: 1088, column: 32, scope: !3299)
!3311 = !DILocation(line: 1085, column: 23, scope: !3299)
!3312 = !DILocation(line: 1085, column: 21, scope: !3299)
!3313 = !DILocation(line: 1085, column: 7, scope: !3299)
!3314 = !DILocation(line: 1093, column: 11, scope: !3299)
!3315 = !DILocation(line: 1093, column: 14, scope: !3299)
!3316 = !DILocation(line: 1093, column: 17, scope: !3299)
!3317 = !DILocation(line: 1093, column: 21, scope: !3299)
!3318 = !DILocation(line: 1094, column: 11, scope: !3299)
!3319 = !DILocation(line: 1095, column: 13, scope: !3299)
!3320 = !DILocation(line: 1095, column: 22, scope: !3299)
!3321 = !DILocation(line: 1095, column: 12, scope: !3299)
!3322 = !DILocation(line: 1095, column: 32, scope: !3299)
!3323 = !DILocation(line: 1092, column: 23, scope: !3299)
!3324 = !DILocation(line: 1092, column: 21, scope: !3299)
!3325 = !DILocation(line: 1098, column: 10, scope: !3326)
!3326 = distinct !DILexicalBlock(scope: !3289, file: !2, line: 1098, column: 10)
!3327 = !DILocalVariable(name: "wid_flag", scope: !3328, file: !2, line: 1099, type: !32)
!3328 = distinct !DILexicalBlock(scope: !3326, file: !2, line: 1098, column: 25)
!3329 = !DILocation(line: 1099, column: 11, scope: !3328)
!3330 = !DILocation(line: 1103, column: 13, scope: !3331)
!3331 = distinct !DILexicalBlock(scope: !3328, file: !2, line: 1103, column: 12)
!3332 = !DILocation(line: 1103, column: 35, scope: !3331)
!3333 = !DILocation(line: 1103, column: 27, scope: !3331)
!3334 = !DILocation(line: 1103, column: 47, scope: !3331)
!3335 = !DILocation(line: 1103, column: 24, scope: !3331)
!3336 = !DILocation(line: 1103, column: 55, scope: !3331)
!3337 = !DILocation(line: 1103, column: 59, scope: !3331)
!3338 = !DILocation(line: 1103, column: 77, scope: !3331)
!3339 = !DILocation(line: 1104, column: 19, scope: !3340)
!3340 = distinct !DILexicalBlock(scope: !3331, file: !2, line: 1103, column: 91)
!3341 = !DILocation(line: 1104, column: 17, scope: !3340)
!3342 = !DILocation(line: 1105, column: 12, scope: !3343)
!3343 = distinct !DILexicalBlock(scope: !3340, file: !2, line: 1105, column: 12)
!3344 = !DILocation(line: 1105, column: 17, scope: !3343)
!3345 = !DILocation(line: 1105, column: 26, scope: !3343)
!3346 = !DILocation(line: 1105, column: 32, scope: !3343)
!3347 = !DILocation(line: 1106, column: 19, scope: !3343)
!3348 = !DILocation(line: 1106, column: 10, scope: !3343)
!3349 = !DILocation(line: 1107, column: 7, scope: !3340)
!3350 = !DILocation(line: 1108, column: 19, scope: !3351)
!3351 = distinct !DILexicalBlock(scope: !3331, file: !2, line: 1107, column: 14)
!3352 = !DILocation(line: 1108, column: 17, scope: !3351)
!3353 = !DILocation(line: 1111, column: 12, scope: !3354)
!3354 = distinct !DILexicalBlock(scope: !3328, file: !2, line: 1111, column: 11)
!3355 = !DILocation(line: 1111, column: 21, scope: !3354)
!3356 = !DILocation(line: 1111, column: 11, scope: !3354)
!3357 = !DILocation(line: 1111, column: 37, scope: !3354)
!3358 = !DILocation(line: 1112, column: 11, scope: !3354)
!3359 = !DILocation(line: 1112, column: 20, scope: !3354)
!3360 = !DILocation(line: 1112, column: 10, scope: !3354)
!3361 = !DILocation(line: 1112, column: 39, scope: !3354)
!3362 = !DILocation(line: 1112, column: 43, scope: !3354)
!3363 = !DILocation(line: 1112, column: 52, scope: !3354)
!3364 = !DILocation(line: 1112, column: 42, scope: !3354)
!3365 = !DILocation(line: 1112, column: 74, scope: !3354)
!3366 = !DILocation(line: 1113, column: 11, scope: !3354)
!3367 = !DILocation(line: 1113, column: 17, scope: !3354)
!3368 = !DILocation(line: 1113, column: 10, scope: !3354)
!3369 = !DILocation(line: 1113, column: 33, scope: !3354)
!3370 = !DILocation(line: 1113, column: 37, scope: !3354)
!3371 = !DILocation(line: 1113, column: 43, scope: !3354)
!3372 = !DILocation(line: 1113, column: 59, scope: !3354)
!3373 = !DILocation(line: 1113, column: 90, scope: !3354)
!3374 = !DILocation(line: 1113, column: 94, scope: !3354)
!3375 = !DILocation(line: 1113, column: 99, scope: !3354)
!3376 = !DILocation(line: 1113, column: 62, scope: !3354)
!3377 = !DILocalVariable(name: "newsegnum", scope: !3378, file: !2, line: 1115, type: !32)
!3378 = distinct !DILexicalBlock(scope: !3354, file: !2, line: 1113, column: 109)
!3379 = !DILocation(line: 1115, column: 12, scope: !3378)
!3380 = !DILocalVariable(name: "sub_hit_point", scope: !3378, file: !2, line: 1116, type: !70)
!3381 = !DILocation(line: 1116, column: 19, scope: !3378)
!3382 = !DILocalVariable(name: "sub_hit_type", scope: !3378, file: !2, line: 1117, type: !32)
!3383 = !DILocation(line: 1117, column: 12, scope: !3378)
!3384 = !DILocalVariable(name: "sub_hit_seg", scope: !3378, file: !2, line: 1117, type: !32)
!3385 = !DILocation(line: 1117, column: 25, scope: !3378)
!3386 = !DILocalVariable(name: "save_wall_norm", scope: !3378, file: !2, line: 1118, type: !70)
!3387 = !DILocation(line: 1118, column: 19, scope: !3378)
!3388 = !DILocation(line: 1118, column: 36, scope: !3378)
!3389 = !DILocalVariable(name: "save_hit_objnum", scope: !3378, file: !2, line: 1119, type: !32)
!3390 = !DILocation(line: 1119, column: 12, scope: !3378)
!3391 = !DILocation(line: 1119, column: 28, scope: !3378)
!3392 = !DILocalVariable(name: "i", scope: !3378, file: !2, line: 1120, type: !32)
!3393 = !DILocation(line: 1120, column: 12, scope: !3378)
!3394 = !DILocation(line: 1124, column: 20, scope: !3378)
!3395 = !DILocation(line: 1124, column: 25, scope: !3378)
!3396 = !DILocation(line: 1124, column: 34, scope: !3378)
!3397 = !DILocation(line: 1124, column: 18, scope: !3378)
!3398 = !DILocation(line: 1126, column: 14, scope: !3399)
!3399 = distinct !DILexicalBlock(scope: !3378, file: !2, line: 1126, column: 8)
!3400 = !DILocation(line: 1126, column: 13, scope: !3399)
!3401 = !DILocation(line: 1126, column: 17, scope: !3402)
!3402 = distinct !DILexicalBlock(scope: !3399, file: !2, line: 1126, column: 8)
!3403 = !DILocation(line: 1126, column: 19, scope: !3402)
!3404 = !DILocation(line: 1126, column: 18, scope: !3402)
!3405 = !DILocation(line: 1126, column: 34, scope: !3402)
!3406 = !DILocation(line: 1126, column: 37, scope: !3402)
!3407 = !DILocation(line: 1126, column: 61, scope: !3402)
!3408 = !DILocation(line: 1126, column: 48, scope: !3402)
!3409 = !DILocation(line: 1126, column: 46, scope: !3402)
!3410 = !DILocation(line: 0, scope: !3402)
!3411 = !DILocation(line: 1126, column: 8, scope: !3399)
!3412 = !DILocation(line: 1126, column: 65, scope: !3402)
!3413 = !DILocation(line: 1126, column: 8, scope: !3402)
!3414 = distinct !{!3414, !3411, !3415, !1730}
!3415 = !DILocation(line: 1126, column: 68, scope: !3399)
!3416 = !DILocation(line: 1128, column: 12, scope: !3417)
!3417 = distinct !DILexicalBlock(scope: !3378, file: !2, line: 1128, column: 12)
!3418 = !DILocation(line: 1128, column: 15, scope: !3417)
!3419 = !DILocation(line: 1128, column: 13, scope: !3417)
!3420 = !DILocalVariable(name: "temp_seglist", scope: !3421, file: !2, line: 1129, type: !2718)
!3421 = distinct !DILexicalBlock(scope: !3417, file: !2, line: 1128, column: 31)
!3422 = !DILocation(line: 1129, column: 13, scope: !3421)
!3423 = !DILocalVariable(name: "temp_n_segs", scope: !3421, file: !2, line: 1129, type: !32)
!3424 = !DILocation(line: 1129, column: 40, scope: !3421)
!3425 = !DILocation(line: 1131, column: 42, scope: !3421)
!3426 = !DILocation(line: 1131, column: 36, scope: !3421)
!3427 = !DILocation(line: 1131, column: 9, scope: !3421)
!3428 = !DILocation(line: 1131, column: 40, scope: !3421)
!3429 = !DILocation(line: 1133, column: 13, scope: !3430)
!3430 = distinct !DILexicalBlock(scope: !3421, file: !2, line: 1133, column: 13)
!3431 = !DILocation(line: 1133, column: 28, scope: !3430)
!3432 = !DILocation(line: 1134, column: 10, scope: !3430)
!3433 = !DILocation(line: 1136, column: 60, scope: !3421)
!3434 = !DILocation(line: 1136, column: 63, scope: !3421)
!3435 = !DILocation(line: 1136, column: 73, scope: !3421)
!3436 = !DILocation(line: 1136, column: 76, scope: !3421)
!3437 = !DILocation(line: 1136, column: 80, scope: !3421)
!3438 = !DILocation(line: 1136, column: 91, scope: !3421)
!3439 = !DILocation(line: 1136, column: 107, scope: !3421)
!3440 = !DILocation(line: 1136, column: 113, scope: !3421)
!3441 = !DILocation(line: 1136, column: 139, scope: !3421)
!3442 = !DILocation(line: 1136, column: 24, scope: !3421)
!3443 = !DILocation(line: 1136, column: 22, scope: !3421)
!3444 = !DILocation(line: 1138, column: 13, scope: !3445)
!3445 = distinct !DILexicalBlock(scope: !3421, file: !2, line: 1138, column: 13)
!3446 = !DILocation(line: 1138, column: 26, scope: !3445)
!3447 = !DILocation(line: 1140, column: 41, scope: !3448)
!3448 = distinct !DILexicalBlock(scope: !3445, file: !2, line: 1138, column: 39)
!3449 = !DILocation(line: 1140, column: 14, scope: !3448)
!3450 = !DILocation(line: 1140, column: 12, scope: !3448)
!3451 = !DILocation(line: 1142, column: 14, scope: !3452)
!3452 = distinct !DILexicalBlock(scope: !3448, file: !2, line: 1142, column: 14)
!3453 = !DILocation(line: 1142, column: 18, scope: !3452)
!3454 = !DILocation(line: 1142, column: 16, scope: !3452)
!3455 = !DILocation(line: 1144, column: 23, scope: !3456)
!3456 = distinct !DILexicalBlock(scope: !3452, file: !2, line: 1142, column: 29)
!3457 = !DILocation(line: 1144, column: 21, scope: !3456)
!3458 = !DILocation(line: 1145, column: 29, scope: !3456)
!3459 = !DILocation(line: 1146, column: 22, scope: !3456)
!3460 = !DILocation(line: 1146, column: 20, scope: !3456)
!3461 = !DILocation(line: 1147, column: 15, scope: !3462)
!3462 = distinct !DILexicalBlock(scope: !3456, file: !2, line: 1147, column: 15)
!3463 = !DILocation(line: 1147, column: 26, scope: !3462)
!3464 = !DILocation(line: 1147, column: 42, scope: !3462)
!3465 = !DILocation(line: 1147, column: 40, scope: !3462)
!3466 = !DILocation(line: 1147, column: 32, scope: !3462)
!3467 = !DILocation(line: 1150, column: 15, scope: !3468)
!3468 = distinct !DILexicalBlock(scope: !3456, file: !2, line: 1150, column: 15)
!3469 = !DILocation(line: 1150, column: 20, scope: !3468)
!3470 = !DILocalVariable(name: "ii", scope: !3471, file: !2, line: 1151, type: !32)
!3471 = distinct !DILexicalBlock(scope: !3468, file: !2, line: 1150, column: 37)
!3472 = !DILocation(line: 1151, column: 16, scope: !3471)
!3473 = !DILocation(line: 1152, column: 19, scope: !3474)
!3474 = distinct !DILexicalBlock(scope: !3471, file: !2, line: 1152, column: 12)
!3475 = !DILocation(line: 1152, column: 17, scope: !3474)
!3476 = !DILocation(line: 1152, column: 22, scope: !3477)
!3477 = distinct !DILexicalBlock(scope: !3474, file: !2, line: 1152, column: 12)
!3478 = !DILocation(line: 1152, column: 24, scope: !3477)
!3479 = !DILocation(line: 1152, column: 23, scope: !3477)
!3480 = !DILocation(line: 1152, column: 36, scope: !3477)
!3481 = !DILocation(line: 1152, column: 40, scope: !3477)
!3482 = !DILocation(line: 1152, column: 39, scope: !3477)
!3483 = !DILocation(line: 1152, column: 46, scope: !3477)
!3484 = !DILocation(line: 0, scope: !3477)
!3485 = !DILocation(line: 1152, column: 12, scope: !3474)
!3486 = !DILocation(line: 1153, column: 51, scope: !3477)
!3487 = !DILocation(line: 1153, column: 36, scope: !3477)
!3488 = !DILocation(line: 1153, column: 13, scope: !3477)
!3489 = !DILocation(line: 1153, column: 23, scope: !3477)
!3490 = !DILocation(line: 1153, column: 30, scope: !3477)
!3491 = !DILocation(line: 1153, column: 34, scope: !3477)
!3492 = !DILocation(line: 1152, column: 12, scope: !3477)
!3493 = distinct !{!3493, !3485, !3494, !1730}
!3494 = !DILocation(line: 1153, column: 53, scope: !3474)
!3495 = !DILocation(line: 1154, column: 11, scope: !3471)
!3496 = !DILocation(line: 1156, column: 11, scope: !3456)
!3497 = !DILocation(line: 1157, column: 10, scope: !3456)
!3498 = !DILocation(line: 1159, column: 21, scope: !3499)
!3499 = distinct !DILexicalBlock(scope: !3452, file: !2, line: 1158, column: 15)
!3500 = !DILocation(line: 1160, column: 28, scope: !3499)
!3501 = !DILocation(line: 1160, column: 26, scope: !3499)
!3502 = !DILocation(line: 1163, column: 9, scope: !3448)
!3503 = !DILocation(line: 1165, column: 20, scope: !3504)
!3504 = distinct !DILexicalBlock(scope: !3445, file: !2, line: 1164, column: 14)
!3505 = !DILocation(line: 1166, column: 14, scope: !3506)
!3506 = distinct !DILexicalBlock(scope: !3504, file: !2, line: 1166, column: 14)
!3507 = !DILocation(line: 1166, column: 25, scope: !3506)
!3508 = !DILocation(line: 1166, column: 46, scope: !3506)
!3509 = !DILocation(line: 1166, column: 44, scope: !3506)
!3510 = !DILocation(line: 1166, column: 31, scope: !3506)
!3511 = !DILocation(line: 1168, column: 14, scope: !3512)
!3512 = distinct !DILexicalBlock(scope: !3504, file: !2, line: 1168, column: 14)
!3513 = !DILocation(line: 1168, column: 19, scope: !3512)
!3514 = !DILocalVariable(name: "ii", scope: !3515, file: !2, line: 1169, type: !32)
!3515 = distinct !DILexicalBlock(scope: !3512, file: !2, line: 1168, column: 36)
!3516 = !DILocation(line: 1169, column: 15, scope: !3515)
!3517 = !DILocation(line: 1170, column: 18, scope: !3518)
!3518 = distinct !DILexicalBlock(scope: !3515, file: !2, line: 1170, column: 11)
!3519 = !DILocation(line: 1170, column: 16, scope: !3518)
!3520 = !DILocation(line: 1170, column: 21, scope: !3521)
!3521 = distinct !DILexicalBlock(scope: !3518, file: !2, line: 1170, column: 11)
!3522 = !DILocation(line: 1170, column: 24, scope: !3521)
!3523 = !DILocation(line: 1170, column: 23, scope: !3521)
!3524 = !DILocation(line: 1170, column: 36, scope: !3521)
!3525 = !DILocation(line: 1170, column: 39, scope: !3521)
!3526 = !DILocation(line: 1170, column: 41, scope: !3521)
!3527 = !DILocation(line: 0, scope: !3521)
!3528 = !DILocation(line: 1170, column: 11, scope: !3518)
!3529 = !DILocation(line: 1171, column: 48, scope: !3521)
!3530 = !DILocation(line: 1171, column: 35, scope: !3521)
!3531 = !DILocation(line: 1171, column: 29, scope: !3521)
!3532 = !DILocation(line: 1171, column: 12, scope: !3521)
!3533 = !DILocation(line: 1171, column: 33, scope: !3521)
!3534 = !DILocation(line: 1170, column: 59, scope: !3521)
!3535 = !DILocation(line: 1170, column: 11, scope: !3521)
!3536 = distinct !{!3536, !3528, !3537, !1730}
!3537 = !DILocation(line: 1171, column: 50, scope: !3518)
!3538 = !DILocation(line: 1172, column: 10, scope: !3515)
!3539 = !DILocation(line: 1173, column: 28, scope: !3504)
!3540 = !DILocation(line: 1173, column: 26, scope: !3504)
!3541 = !DILocation(line: 1175, column: 8, scope: !3421)
!3542 = !DILocation(line: 1176, column: 7, scope: !3378)
!3543 = !DILocation(line: 1181, column: 36, scope: !3544)
!3544 = distinct !DILexicalBlock(scope: !3354, file: !2, line: 1177, column: 12)
!3545 = !DILocation(line: 1181, column: 13, scope: !3544)
!3546 = !DILocation(line: 1181, column: 11, scope: !3544)
!3547 = !DILocation(line: 1183, column: 13, scope: !3548)
!3548 = distinct !DILexicalBlock(scope: !3544, file: !2, line: 1183, column: 13)
!3549 = !DILocation(line: 1183, column: 17, scope: !3548)
!3550 = !DILocation(line: 1183, column: 15, scope: !3548)
!3551 = !DILocation(line: 1184, column: 22, scope: !3552)
!3552 = distinct !DILexicalBlock(scope: !3548, file: !2, line: 1183, column: 28)
!3553 = !DILocation(line: 1184, column: 20, scope: !3552)
!3554 = !DILocation(line: 1185, column: 28, scope: !3552)
!3555 = !DILocation(line: 1186, column: 19, scope: !3552)
!3556 = !DILocation(line: 1191, column: 23, scope: !3552)
!3557 = !DILocation(line: 1191, column: 28, scope: !3552)
!3558 = !DILocation(line: 1191, column: 34, scope: !3552)
!3559 = !DILocation(line: 1191, column: 40, scope: !3552)
!3560 = !DILocation(line: 1191, column: 48, scope: !3552)
!3561 = !DILocation(line: 1191, column: 21, scope: !3552)
!3562 = !DILocation(line: 1195, column: 39, scope: !3563)
!3563 = distinct !DILexicalBlock(scope: !3552, file: !2, line: 1195, column: 14)
!3564 = !DILocation(line: 1195, column: 48, scope: !3563)
!3565 = !DILocation(line: 1195, column: 14, scope: !3563)
!3566 = !DILocation(line: 1195, column: 53, scope: !3563)
!3567 = !DILocation(line: 1195, column: 63, scope: !3563)
!3568 = !DILocation(line: 1196, column: 21, scope: !3563)
!3569 = !DILocation(line: 1196, column: 19, scope: !3563)
!3570 = !DILocation(line: 1196, column: 11, scope: !3563)
!3571 = !DILocation(line: 1198, column: 26, scope: !3563)
!3572 = !DILocation(line: 1198, column: 24, scope: !3563)
!3573 = !DILocation(line: 1206, column: 24, scope: !3552)
!3574 = !DILocation(line: 1206, column: 22, scope: !3552)
!3575 = !DILocation(line: 1207, column: 26, scope: !3552)
!3576 = !DILocation(line: 1207, column: 23, scope: !3552)
!3577 = !DILocation(line: 1208, column: 29, scope: !3552)
!3578 = !DILocation(line: 1208, column: 27, scope: !3552)
!3579 = !DILocation(line: 1210, column: 9, scope: !3552)
!3580 = !DILocation(line: 1212, column: 6, scope: !3328)
!3581 = !DILocation(line: 1213, column: 5, scope: !3289)
!3582 = !DILocation(line: 1214, column: 4, scope: !3285)
!3583 = !DILocation(line: 1072, column: 27, scope: !3280)
!3584 = !DILocation(line: 1072, column: 33, scope: !3280)
!3585 = !DILocation(line: 1072, column: 4, scope: !3280)
!3586 = distinct !{!3586, !3282, !3587, !1730}
!3587 = !DILocation(line: 1214, column: 4, scope: !3277)
!3588 = !DILocation(line: 1215, column: 3, scope: !3264)
!3589 = !DILocation(line: 1063, column: 48, scope: !3255)
!3590 = !DILocation(line: 1063, column: 3, scope: !3255)
!3591 = distinct !{!3591, !3262, !3592, !1730}
!3592 = !DILocation(line: 1215, column: 3, scope: !3251)
!3593 = !DILocation(line: 1216, column: 2, scope: !3244)
!3594 = !DILocation(line: 1057, column: 17, scope: !3241)
!3595 = !DILabel(scope: !2968, name: "quit_looking", file: !2, line: 1222)
!3596 = !DILocation(line: 1222, column: 1, scope: !2968)
!3597 = !DILocation(line: 1225, column: 6, scope: !3598)
!3598 = distinct !DILexicalBlock(scope: !2968, file: !2, line: 1225, column: 6)
!3599 = !DILocation(line: 1225, column: 15, scope: !3598)
!3600 = !DILocalVariable(name: "i", scope: !3601, file: !2, line: 1226, type: !32)
!3601 = distinct !DILexicalBlock(scope: !3598, file: !2, line: 1225, column: 28)
!3602 = !DILocation(line: 1226, column: 7, scope: !3601)
!3603 = !DILocation(line: 1228, column: 12, scope: !3601)
!3604 = !DILocation(line: 1228, column: 4, scope: !3601)
!3605 = !DILocation(line: 1228, column: 9, scope: !3601)
!3606 = !DILocation(line: 1229, column: 11, scope: !3601)
!3607 = !DILocation(line: 1229, column: 4, scope: !3601)
!3608 = !DILocation(line: 1229, column: 9, scope: !3601)
!3609 = !DILocation(line: 1233, column: 7, scope: !3610)
!3610 = distinct !DILexicalBlock(scope: !3601, file: !2, line: 1233, column: 7)
!3611 = !DILocation(line: 1233, column: 19, scope: !3610)
!3612 = !DILocation(line: 1234, column: 8, scope: !3613)
!3613 = distinct !DILexicalBlock(scope: !3614, file: !2, line: 1234, column: 8)
!3614 = distinct !DILexicalBlock(scope: !3610, file: !2, line: 1233, column: 25)
!3615 = !DILocation(line: 1234, column: 13, scope: !3613)
!3616 = !DILocation(line: 1236, column: 11, scope: !3617)
!3617 = distinct !DILexicalBlock(scope: !3613, file: !2, line: 1236, column: 5)
!3618 = !DILocation(line: 1236, column: 10, scope: !3617)
!3619 = !DILocation(line: 1236, column: 14, scope: !3620)
!3620 = distinct !DILexicalBlock(scope: !3617, file: !2, line: 1236, column: 5)
!3621 = !DILocation(line: 1236, column: 16, scope: !3620)
!3622 = !DILocation(line: 1236, column: 15, scope: !3620)
!3623 = !DILocation(line: 1236, column: 32, scope: !3620)
!3624 = !DILocation(line: 1236, column: 36, scope: !3620)
!3625 = !DILocation(line: 1236, column: 35, scope: !3620)
!3626 = !DILocation(line: 1236, column: 42, scope: !3620)
!3627 = !DILocation(line: 0, scope: !3620)
!3628 = !DILocation(line: 1236, column: 5, scope: !3617)
!3629 = !DILocation(line: 1237, column: 47, scope: !3620)
!3630 = !DILocation(line: 1237, column: 29, scope: !3620)
!3631 = !DILocation(line: 1237, column: 6, scope: !3620)
!3632 = !DILocation(line: 1237, column: 16, scope: !3620)
!3633 = !DILocation(line: 1237, column: 23, scope: !3620)
!3634 = !DILocation(line: 1237, column: 27, scope: !3620)
!3635 = !DILocation(line: 1236, column: 5, scope: !3620)
!3636 = distinct !{!3636, !3628, !3637, !1730}
!3637 = !DILocation(line: 1237, column: 49, scope: !3617)
!3638 = !DILocation(line: 1238, column: 3, scope: !3614)
!3639 = !DILocation(line: 1240, column: 8, scope: !3640)
!3640 = distinct !DILexicalBlock(scope: !3610, file: !2, line: 1240, column: 8)
!3641 = !DILocation(line: 1240, column: 22, scope: !3640)
!3642 = !DILocation(line: 1241, column: 6, scope: !3640)
!3643 = !DILocation(line: 1241, column: 12, scope: !3640)
!3644 = !DILocation(line: 1241, column: 5, scope: !3640)
!3645 = !DILocation(line: 1243, column: 2, scope: !3601)
!3646 = !DILocation(line: 1245, column: 4, scope: !3647)
!3647 = distinct !DILexicalBlock(scope: !3598, file: !2, line: 1244, column: 7)
!3648 = !DILocation(line: 1245, column: 9, scope: !3647)
!3649 = !DILocation(line: 1246, column: 7, scope: !3650)
!3650 = distinct !DILexicalBlock(scope: !3647, file: !2, line: 1246, column: 7)
!3651 = !DILocation(line: 1246, column: 14, scope: !3650)
!3652 = !DILocation(line: 1247, column: 8, scope: !3653)
!3653 = distinct !DILexicalBlock(scope: !3650, file: !2, line: 1247, column: 8)
!3654 = !DILocation(line: 1247, column: 21, scope: !3653)
!3655 = !DILocation(line: 1248, column: 13, scope: !3653)
!3656 = !DILocation(line: 1248, column: 6, scope: !3653)
!3657 = !DILocation(line: 1248, column: 11, scope: !3653)
!3658 = !DILocation(line: 1248, column: 5, scope: !3653)
!3659 = !DILocation(line: 1250, column: 13, scope: !3653)
!3660 = !DILocation(line: 1250, column: 6, scope: !3653)
!3661 = !DILocation(line: 1250, column: 11, scope: !3653)
!3662 = !DILocation(line: 1247, column: 25, scope: !3653)
!3663 = !DILocation(line: 1252, column: 12, scope: !3650)
!3664 = !DILocation(line: 1252, column: 5, scope: !3650)
!3665 = !DILocation(line: 1252, column: 10, scope: !3650)
!3666 = !DILocation(line: 1255, column: 2, scope: !2968)
!3667 = !DILocation(line: 0, scope: !2968)
!3668 = !DILocation(line: 1257, column: 9, scope: !2968)
!3669 = !DILocation(line: 1257, column: 2, scope: !2968)
!3670 = distinct !DISubprogram(name: "obj_in_list", linkageName: "_Z11obj_in_listiPi", scope: !2, file: !2, line: 942, type: !3671, scopeLine: 943, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !1379)
!3671 = !DISubroutineType(types: !3672)
!3672 = !{!32, !32, !35}
!3673 = !DILocalVariable(name: "objnum", arg: 1, scope: !3670, file: !2, line: 942, type: !32)
!3674 = !DILocation(line: 942, column: 21, scope: !3670)
!3675 = !DILocalVariable(name: "obj_list", arg: 2, scope: !3670, file: !2, line: 942, type: !35)
!3676 = !DILocation(line: 942, column: 33, scope: !3670)
!3677 = !DILocalVariable(name: "t", scope: !3670, file: !2, line: 944, type: !32)
!3678 = !DILocation(line: 944, column: 6, scope: !3670)
!3679 = !DILocation(line: 946, column: 2, scope: !3670)
!3680 = !DILocation(line: 946, column: 13, scope: !3670)
!3681 = !DILocation(line: 946, column: 12, scope: !3670)
!3682 = !DILocation(line: 946, column: 11, scope: !3670)
!3683 = !DILocation(line: 946, column: 22, scope: !3670)
!3684 = !DILocation(line: 946, column: 27, scope: !3670)
!3685 = !DILocation(line: 946, column: 30, scope: !3670)
!3686 = !DILocation(line: 946, column: 33, scope: !3670)
!3687 = !DILocation(line: 946, column: 31, scope: !3670)
!3688 = !DILocation(line: 0, scope: !3670)
!3689 = !DILocation(line: 946, column: 49, scope: !3670)
!3690 = distinct !{!3690, !3679, !3689, !1730}
!3691 = !DILocation(line: 948, column: 10, scope: !3670)
!3692 = !DILocation(line: 948, column: 13, scope: !3670)
!3693 = !DILocation(line: 948, column: 11, scope: !3670)
!3694 = !DILocation(line: 948, column: 9, scope: !3670)
!3695 = !DILocation(line: 948, column: 2, scope: !3670)
!3696 = distinct !DISubprogram(name: "check_trans_wall", linkageName: "_Z16check_trans_wallP10vms_vectorP7segmentii", scope: !2, file: !2, line: 1395, type: !3697, scopeLine: 1396, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !1379)
!3697 = !DISubroutineType(types: !3698)
!3698 = !{!32, !1398, !1884, !32, !32}
!3699 = !DILocalVariable(name: "pnt", arg: 1, scope: !3696, file: !2, line: 1395, type: !1398)
!3700 = !DILocation(line: 1395, column: 34, scope: !3696)
!3701 = !DILocalVariable(name: "seg", arg: 2, scope: !3696, file: !2, line: 1395, type: !1884)
!3702 = !DILocation(line: 1395, column: 47, scope: !3696)
!3703 = !DILocalVariable(name: "sidenum", arg: 3, scope: !3696, file: !2, line: 1395, type: !32)
!3704 = !DILocation(line: 1395, column: 55, scope: !3696)
!3705 = !DILocalVariable(name: "facenum", arg: 4, scope: !3696, file: !2, line: 1395, type: !32)
!3706 = !DILocation(line: 1395, column: 67, scope: !3696)
!3707 = !DILocalVariable(name: "bm", scope: !3696, file: !2, line: 1397, type: !3708)
!3708 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3709, size: 64)
!3709 = !DIDerivedType(tag: DW_TAG_typedef, name: "grs_bitmap", file: !3710, line: 87, baseType: !3711)
!3710 = !DIFile(filename: "./2d/gr.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "15a87c28ac1ffa2cb346888bc15e47c5")
!3711 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_grs_bitmap", file: !3710, line: 72, size: 256, flags: DIFlagTypePassByValue, elements: !3712, identifier: "_ZTS11_grs_bitmap")
!3712 = !{!3713, !3714, !3715, !3716, !3717, !3718, !3719, !3720, !3721, !3722, !3723}
!3713 = !DIDerivedType(tag: DW_TAG_member, name: "bm_x", scope: !3711, file: !3710, line: 73, baseType: !55, size: 16)
!3714 = !DIDerivedType(tag: DW_TAG_member, name: "bm_y", scope: !3711, file: !3710, line: 73, baseType: !55, size: 16, offset: 16)
!3715 = !DIDerivedType(tag: DW_TAG_member, name: "bm_w", scope: !3711, file: !3710, line: 74, baseType: !55, size: 16, offset: 32)
!3716 = !DIDerivedType(tag: DW_TAG_member, name: "bm_h", scope: !3711, file: !3710, line: 74, baseType: !55, size: 16, offset: 48)
!3717 = !DIDerivedType(tag: DW_TAG_member, name: "bm_type", scope: !3711, file: !3710, line: 75, baseType: !122, size: 8, offset: 64)
!3718 = !DIDerivedType(tag: DW_TAG_member, name: "bm_flags", scope: !3711, file: !3710, line: 76, baseType: !122, size: 8, offset: 72)
!3719 = !DIDerivedType(tag: DW_TAG_member, name: "bm_rowsize", scope: !3711, file: !3710, line: 79, baseType: !55, size: 16, offset: 80)
!3720 = !DIDerivedType(tag: DW_TAG_member, name: "bm_data", scope: !3711, file: !3710, line: 80, baseType: !334, size: 64, offset: 128)
!3721 = !DIDerivedType(tag: DW_TAG_member, name: "bm_selector", scope: !3711, file: !3710, line: 84, baseType: !138, size: 16, offset: 192)
!3722 = !DIDerivedType(tag: DW_TAG_member, name: "avg_color", scope: !3711, file: !3710, line: 85, baseType: !132, size: 8, offset: 208)
!3723 = !DIDerivedType(tag: DW_TAG_member, name: "unused", scope: !3711, file: !3710, line: 86, baseType: !122, size: 8, offset: 216)
!3724 = !DILocation(line: 1397, column: 14, scope: !3696)
!3725 = !DILocalVariable(name: "side", scope: !3696, file: !2, line: 1398, type: !1516)
!3726 = !DILocation(line: 1398, column: 8, scope: !3696)
!3727 = !DILocation(line: 1398, column: 16, scope: !3696)
!3728 = !DILocation(line: 1398, column: 21, scope: !3696)
!3729 = !DILocation(line: 1398, column: 27, scope: !3696)
!3730 = !DILocalVariable(name: "bmx", scope: !3696, file: !2, line: 1399, type: !32)
!3731 = !DILocation(line: 1399, column: 6, scope: !3696)
!3732 = !DILocalVariable(name: "bmy", scope: !3696, file: !2, line: 1399, type: !32)
!3733 = !DILocation(line: 1399, column: 10, scope: !3696)
!3734 = !DILocalVariable(name: "u", scope: !3696, file: !2, line: 1400, type: !28)
!3735 = !DILocation(line: 1400, column: 6, scope: !3696)
!3736 = !DILocalVariable(name: "v", scope: !3696, file: !2, line: 1400, type: !28)
!3737 = !DILocation(line: 1400, column: 8, scope: !3696)
!3738 = !DILocation(line: 1404, column: 30, scope: !3696)
!3739 = !DILocation(line: 1404, column: 34, scope: !3696)
!3740 = !DILocation(line: 1404, column: 38, scope: !3696)
!3741 = !DILocation(line: 1404, column: 46, scope: !3696)
!3742 = !DILocation(line: 1404, column: 2, scope: !3696)
!3743 = !DILocation(line: 1406, column: 6, scope: !3744)
!3744 = distinct !DILexicalBlock(scope: !3696, file: !2, line: 1406, column: 6)
!3745 = !DILocation(line: 1406, column: 12, scope: !3744)
!3746 = !DILocation(line: 1406, column: 22, scope: !3744)
!3747 = !DILocation(line: 1407, column: 36, scope: !3748)
!3748 = distinct !DILexicalBlock(scope: !3744, file: !2, line: 1406, column: 28)
!3749 = !DILocation(line: 1407, column: 42, scope: !3748)
!3750 = !DILocation(line: 1407, column: 52, scope: !3748)
!3751 = !DILocation(line: 1407, column: 58, scope: !3748)
!3752 = !DILocation(line: 1407, column: 8, scope: !3748)
!3753 = !DILocation(line: 1407, column: 6, scope: !3748)
!3754 = !DILocation(line: 1408, column: 2, scope: !3748)
!3755 = !DILocation(line: 1409, column: 30, scope: !3756)
!3756 = distinct !DILexicalBlock(scope: !3744, file: !2, line: 1408, column: 9)
!3757 = !DILocation(line: 1409, column: 36, scope: !3756)
!3758 = !DILocation(line: 1409, column: 21, scope: !3756)
!3759 = !DILocation(line: 1409, column: 46, scope: !3756)
!3760 = !DILocation(line: 1409, column: 9, scope: !3756)
!3761 = !DILocation(line: 1409, column: 6, scope: !3756)
!3762 = !DILocation(line: 1410, column: 3, scope: !3756)
!3763 = !DILocation(line: 1410, column: 3, scope: !3764)
!3764 = distinct !DILexicalBlock(scope: !3765, file: !2, line: 1410, column: 3)
!3765 = distinct !DILexicalBlock(scope: !3756, file: !2, line: 1410, column: 3)
!3766 = !DILocation(line: 1410, column: 3, scope: !3767)
!3767 = distinct !DILexicalBlock(scope: !3764, file: !2, line: 1410, column: 3)
!3768 = !DILocation(line: 1410, column: 3, scope: !3765)
!3769 = !DILocation(line: 1413, column: 6, scope: !3770)
!3770 = distinct !DILexicalBlock(scope: !3696, file: !2, line: 1413, column: 6)
!3771 = !DILocation(line: 1413, column: 10, scope: !3770)
!3772 = !DILocation(line: 1413, column: 19, scope: !3770)
!3773 = !DILocation(line: 1414, column: 27, scope: !3770)
!3774 = !DILocation(line: 1414, column: 8, scope: !3770)
!3775 = !DILocation(line: 1414, column: 6, scope: !3770)
!3776 = !DILocation(line: 1414, column: 3, scope: !3770)
!3777 = !DILocation(line: 1416, column: 24, scope: !3696)
!3778 = !DILocation(line: 1416, column: 26, scope: !3696)
!3779 = !DILocation(line: 1416, column: 30, scope: !3696)
!3780 = !DILocation(line: 1416, column: 25, scope: !3696)
!3781 = !DILocation(line: 1416, column: 20, scope: !3696)
!3782 = !DILocation(line: 1416, column: 39, scope: !3696)
!3783 = !DILocation(line: 1416, column: 43, scope: !3696)
!3784 = !DILocation(line: 1416, column: 37, scope: !3696)
!3785 = !DILocation(line: 1416, column: 6, scope: !3696)
!3786 = !DILocation(line: 1417, column: 24, scope: !3696)
!3787 = !DILocation(line: 1417, column: 26, scope: !3696)
!3788 = !DILocation(line: 1417, column: 30, scope: !3696)
!3789 = !DILocation(line: 1417, column: 25, scope: !3696)
!3790 = !DILocation(line: 1417, column: 20, scope: !3696)
!3791 = !DILocation(line: 1417, column: 39, scope: !3696)
!3792 = !DILocation(line: 1417, column: 43, scope: !3696)
!3793 = !DILocation(line: 1417, column: 37, scope: !3696)
!3794 = !DILocation(line: 1417, column: 6, scope: !3696)
!3795 = !DILocation(line: 1425, column: 10, scope: !3696)
!3796 = !DILocation(line: 1425, column: 14, scope: !3696)
!3797 = !DILocation(line: 1425, column: 22, scope: !3696)
!3798 = !DILocation(line: 1425, column: 26, scope: !3696)
!3799 = !DILocation(line: 1425, column: 30, scope: !3696)
!3800 = !DILocation(line: 1425, column: 25, scope: !3696)
!3801 = !DILocation(line: 1425, column: 35, scope: !3696)
!3802 = !DILocation(line: 1425, column: 34, scope: !3696)
!3803 = !DILocation(line: 1425, column: 40, scope: !3696)
!3804 = !DILocation(line: 1425, column: 9, scope: !3696)
!3805 = !DILocation(line: 1425, column: 2, scope: !3696)
!3806 = distinct !DISubprogram(name: "find_hitpoint_uv", linkageName: "_Z16find_hitpoint_uvPiS_S_P10vms_vectorP7segmentii", scope: !2, file: !2, line: 1296, type: !3807, scopeLine: 1297, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !1379)
!3807 = !DISubroutineType(types: !3808)
!3808 = !{null, !2113, !2113, !2113, !1398, !1884, !32, !32}
!3809 = !DILocalVariable(name: "u", arg: 1, scope: !3806, file: !2, line: 1296, type: !2113)
!3810 = !DILocation(line: 1296, column: 28, scope: !3806)
!3811 = !DILocalVariable(name: "v", arg: 2, scope: !3806, file: !2, line: 1296, type: !2113)
!3812 = !DILocation(line: 1296, column: 35, scope: !3806)
!3813 = !DILocalVariable(name: "l", arg: 3, scope: !3806, file: !2, line: 1296, type: !2113)
!3814 = !DILocation(line: 1296, column: 42, scope: !3806)
!3815 = !DILocalVariable(name: "pnt", arg: 4, scope: !3806, file: !2, line: 1296, type: !1398)
!3816 = !DILocation(line: 1296, column: 56, scope: !3806)
!3817 = !DILocalVariable(name: "seg", arg: 5, scope: !3806, file: !2, line: 1296, type: !1884)
!3818 = !DILocation(line: 1296, column: 69, scope: !3806)
!3819 = !DILocalVariable(name: "sidenum", arg: 6, scope: !3806, file: !2, line: 1296, type: !32)
!3820 = !DILocation(line: 1296, column: 77, scope: !3806)
!3821 = !DILocalVariable(name: "facenum", arg: 7, scope: !3806, file: !2, line: 1296, type: !32)
!3822 = !DILocation(line: 1296, column: 89, scope: !3806)
!3823 = !DILocalVariable(name: "pnt_array", scope: !3806, file: !2, line: 1298, type: !21)
!3824 = !DILocation(line: 1298, column: 20, scope: !3806)
!3825 = !DILocalVariable(name: "normal_array", scope: !3806, file: !2, line: 1299, type: !22)
!3826 = !DILocation(line: 1299, column: 19, scope: !3806)
!3827 = !DILocalVariable(name: "segnum", scope: !3806, file: !2, line: 1300, type: !32)
!3828 = !DILocation(line: 1300, column: 6, scope: !3806)
!3829 = !DILocation(line: 1300, column: 15, scope: !3806)
!3830 = !DILocation(line: 1300, column: 18, scope: !3806)
!3831 = !DILocalVariable(name: "num_faces", scope: !3806, file: !2, line: 1301, type: !32)
!3832 = !DILocation(line: 1301, column: 6, scope: !3806)
!3833 = !DILocalVariable(name: "biggest", scope: !3806, file: !2, line: 1302, type: !32)
!3834 = !DILocation(line: 1302, column: 6, scope: !3806)
!3835 = !DILocalVariable(name: "ii", scope: !3806, file: !2, line: 1302, type: !32)
!3836 = !DILocation(line: 1302, column: 14, scope: !3806)
!3837 = !DILocalVariable(name: "jj", scope: !3806, file: !2, line: 1302, type: !32)
!3838 = !DILocation(line: 1302, column: 17, scope: !3806)
!3839 = !DILocalVariable(name: "side", scope: !3806, file: !2, line: 1303, type: !1516)
!3840 = !DILocation(line: 1303, column: 8, scope: !3806)
!3841 = !DILocation(line: 1303, column: 16, scope: !3806)
!3842 = !DILocation(line: 1303, column: 21, scope: !3806)
!3843 = !DILocation(line: 1303, column: 27, scope: !3806)
!3844 = !DILocalVariable(name: "vertex_list", scope: !3806, file: !2, line: 1304, type: !1930)
!3845 = !DILocation(line: 1304, column: 6, scope: !3806)
!3846 = !DILocalVariable(name: "vertnum_list", scope: !3806, file: !2, line: 1304, type: !1930)
!3847 = !DILocation(line: 1304, column: 21, scope: !3806)
!3848 = !DILocalVariable(name: "p1", scope: !3806, file: !2, line: 1305, type: !1651)
!3849 = !DILocation(line: 1305, column: 9, scope: !3806)
!3850 = !DILocalVariable(name: "vec0", scope: !3806, file: !2, line: 1305, type: !1651)
!3851 = !DILocation(line: 1305, column: 12, scope: !3806)
!3852 = !DILocalVariable(name: "vec1", scope: !3806, file: !2, line: 1305, type: !1651)
!3853 = !DILocation(line: 1305, column: 17, scope: !3806)
!3854 = !DILocalVariable(name: "checkp", scope: !3806, file: !2, line: 1305, type: !1651)
!3855 = !DILocation(line: 1305, column: 22, scope: !3806)
!3856 = !DILocalVariable(name: "uvls", scope: !3806, file: !2, line: 1306, type: !3857)
!3857 = !DICompositeType(tag: DW_TAG_array_type, baseType: !1528, size: 288, elements: !33)
!3858 = !DILocation(line: 1306, column: 6, scope: !3806)
!3859 = !DILocalVariable(name: "k0", scope: !3806, file: !2, line: 1307, type: !28)
!3860 = !DILocation(line: 1307, column: 6, scope: !3806)
!3861 = !DILocalVariable(name: "k1", scope: !3806, file: !2, line: 1307, type: !28)
!3862 = !DILocation(line: 1307, column: 9, scope: !3806)
!3863 = !DILocalVariable(name: "i", scope: !3806, file: !2, line: 1308, type: !32)
!3864 = !DILocation(line: 1308, column: 6, scope: !3806)
!3865 = !DILocation(line: 1316, column: 6, scope: !3866)
!3866 = distinct !DILexicalBlock(scope: !3806, file: !2, line: 1316, column: 6)
!3867 = !DILocation(line: 1316, column: 13, scope: !3866)
!3868 = !DILocation(line: 1316, column: 17, scope: !3866)
!3869 = !DILocation(line: 1316, column: 20, scope: !3866)
!3870 = !DILocation(line: 1316, column: 29, scope: !3866)
!3871 = !DILocation(line: 1316, column: 27, scope: !3866)
!3872 = !DILocation(line: 1317, column: 3, scope: !3873)
!3873 = distinct !DILexicalBlock(scope: !3866, file: !2, line: 1316, column: 52)
!3874 = !DILocation(line: 1318, column: 9, scope: !3873)
!3875 = !DILocation(line: 1318, column: 11, scope: !3873)
!3876 = !DILocation(line: 1318, column: 4, scope: !3873)
!3877 = !DILocation(line: 1318, column: 6, scope: !3873)
!3878 = !DILocation(line: 1319, column: 3, scope: !3873)
!3879 = !DILocation(line: 1322, column: 6, scope: !3880)
!3880 = distinct !DILexicalBlock(scope: !3806, file: !2, line: 1322, column: 6)
!3881 = !DILocation(line: 1322, column: 12, scope: !3880)
!3882 = !DILocation(line: 1323, column: 3, scope: !3880)
!3883 = !DILocation(line: 1325, column: 37, scope: !3806)
!3884 = !DILocation(line: 1325, column: 49, scope: !3806)
!3885 = !DILocation(line: 1325, column: 56, scope: !3806)
!3886 = !DILocation(line: 1325, column: 2, scope: !3806)
!3887 = !DILocation(line: 1326, column: 38, scope: !3806)
!3888 = !DILocation(line: 1326, column: 51, scope: !3806)
!3889 = !DILocation(line: 1326, column: 58, scope: !3806)
!3890 = !DILocation(line: 1326, column: 2, scope: !3806)
!3891 = !DILocation(line: 1335, column: 27, scope: !3806)
!3892 = !DILocation(line: 1335, column: 33, scope: !3806)
!3893 = !DILocation(line: 1335, column: 41, scope: !3806)
!3894 = !DILocation(line: 1335, column: 3, scope: !3806)
!3895 = !DILocation(line: 1337, column: 12, scope: !3806)
!3896 = !DILocation(line: 1339, column: 23, scope: !3897)
!3897 = distinct !DILexicalBlock(scope: !3806, file: !2, line: 1339, column: 6)
!3898 = !DILocation(line: 1339, column: 10, scope: !3897)
!3899 = !DILocation(line: 1339, column: 6, scope: !3897)
!3900 = !DILocation(line: 1339, column: 50, scope: !3897)
!3901 = !DILocation(line: 1339, column: 54, scope: !3897)
!3902 = !DILocation(line: 1339, column: 37, scope: !3897)
!3903 = !DILocation(line: 1339, column: 33, scope: !3897)
!3904 = !DILocation(line: 1339, column: 31, scope: !3897)
!3905 = !DILocation(line: 1339, column: 73, scope: !3897)
!3906 = !DILocation(line: 1339, column: 65, scope: !3897)
!3907 = !DILocation(line: 1340, column: 23, scope: !3908)
!3908 = distinct !DILexicalBlock(scope: !3806, file: !2, line: 1340, column: 6)
!3909 = !DILocation(line: 1340, column: 10, scope: !3908)
!3910 = !DILocation(line: 1340, column: 6, scope: !3908)
!3911 = !DILocation(line: 1340, column: 50, scope: !3908)
!3912 = !DILocation(line: 1340, column: 54, scope: !3908)
!3913 = !DILocation(line: 1340, column: 37, scope: !3908)
!3914 = !DILocation(line: 1340, column: 33, scope: !3908)
!3915 = !DILocation(line: 1340, column: 31, scope: !3908)
!3916 = !DILocation(line: 1340, column: 73, scope: !3908)
!3917 = !DILocation(line: 1340, column: 65, scope: !3908)
!3918 = !DILocation(line: 1342, column: 6, scope: !3919)
!3919 = distinct !DILexicalBlock(scope: !3806, file: !2, line: 1342, column: 6)
!3920 = !DILocation(line: 1342, column: 14, scope: !3919)
!3921 = !DILocation(line: 1342, column: 22, scope: !3919)
!3922 = !DILocation(line: 1342, column: 20, scope: !3919)
!3923 = !DILocation(line: 1342, column: 33, scope: !3919)
!3924 = !DILocation(line: 1343, column: 6, scope: !3925)
!3925 = distinct !DILexicalBlock(scope: !3806, file: !2, line: 1343, column: 6)
!3926 = !DILocation(line: 1343, column: 14, scope: !3925)
!3927 = !DILocation(line: 1343, column: 22, scope: !3925)
!3928 = !DILocation(line: 1343, column: 20, scope: !3925)
!3929 = !DILocation(line: 1343, column: 33, scope: !3925)
!3930 = !DILocation(line: 1348, column: 56, scope: !3806)
!3931 = !DILocation(line: 1348, column: 63, scope: !3806)
!3932 = !DILocation(line: 1348, column: 65, scope: !3806)
!3933 = !DILocation(line: 1348, column: 44, scope: !3806)
!3934 = !DILocation(line: 1348, column: 35, scope: !3806)
!3935 = !DILocation(line: 1348, column: 12, scope: !3806)
!3936 = !DILocation(line: 1349, column: 9, scope: !3806)
!3937 = !DILocation(line: 1349, column: 20, scope: !3806)
!3938 = !DILocation(line: 1349, column: 24, scope: !3806)
!3939 = !DILocation(line: 1349, column: 5, scope: !3806)
!3940 = !DILocation(line: 1349, column: 7, scope: !3806)
!3941 = !DILocation(line: 1350, column: 9, scope: !3806)
!3942 = !DILocation(line: 1350, column: 20, scope: !3806)
!3943 = !DILocation(line: 1350, column: 24, scope: !3806)
!3944 = !DILocation(line: 1350, column: 5, scope: !3806)
!3945 = !DILocation(line: 1350, column: 7, scope: !3806)
!3946 = !DILocation(line: 1352, column: 56, scope: !3806)
!3947 = !DILocation(line: 1352, column: 63, scope: !3806)
!3948 = !DILocation(line: 1352, column: 65, scope: !3806)
!3949 = !DILocation(line: 1352, column: 44, scope: !3806)
!3950 = !DILocation(line: 1352, column: 35, scope: !3806)
!3951 = !DILocation(line: 1352, column: 12, scope: !3806)
!3952 = !DILocation(line: 1353, column: 11, scope: !3806)
!3953 = !DILocation(line: 1353, column: 22, scope: !3806)
!3954 = !DILocation(line: 1353, column: 26, scope: !3806)
!3955 = !DILocation(line: 1353, column: 35, scope: !3806)
!3956 = !DILocation(line: 1353, column: 30, scope: !3806)
!3957 = !DILocation(line: 1353, column: 7, scope: !3806)
!3958 = !DILocation(line: 1353, column: 9, scope: !3806)
!3959 = !DILocation(line: 1354, column: 11, scope: !3806)
!3960 = !DILocation(line: 1354, column: 22, scope: !3806)
!3961 = !DILocation(line: 1354, column: 26, scope: !3806)
!3962 = !DILocation(line: 1354, column: 35, scope: !3806)
!3963 = !DILocation(line: 1354, column: 30, scope: !3806)
!3964 = !DILocation(line: 1354, column: 7, scope: !3806)
!3965 = !DILocation(line: 1354, column: 9, scope: !3806)
!3966 = !DILocation(line: 1357, column: 56, scope: !3806)
!3967 = !DILocation(line: 1357, column: 63, scope: !3806)
!3968 = !DILocation(line: 1357, column: 65, scope: !3806)
!3969 = !DILocation(line: 1357, column: 44, scope: !3806)
!3970 = !DILocation(line: 1357, column: 35, scope: !3806)
!3971 = !DILocation(line: 1357, column: 12, scope: !3806)
!3972 = !DILocation(line: 1358, column: 11, scope: !3806)
!3973 = !DILocation(line: 1358, column: 22, scope: !3806)
!3974 = !DILocation(line: 1358, column: 26, scope: !3806)
!3975 = !DILocation(line: 1358, column: 35, scope: !3806)
!3976 = !DILocation(line: 1358, column: 30, scope: !3806)
!3977 = !DILocation(line: 1358, column: 7, scope: !3806)
!3978 = !DILocation(line: 1358, column: 9, scope: !3806)
!3979 = !DILocation(line: 1359, column: 11, scope: !3806)
!3980 = !DILocation(line: 1359, column: 22, scope: !3806)
!3981 = !DILocation(line: 1359, column: 26, scope: !3806)
!3982 = !DILocation(line: 1359, column: 35, scope: !3806)
!3983 = !DILocation(line: 1359, column: 30, scope: !3806)
!3984 = !DILocation(line: 1359, column: 7, scope: !3806)
!3985 = !DILocation(line: 1359, column: 9, scope: !3806)
!3986 = !DILocation(line: 1362, column: 34, scope: !3806)
!3987 = !DILocation(line: 1362, column: 12, scope: !3806)
!3988 = !DILocation(line: 1363, column: 13, scope: !3806)
!3989 = !DILocation(line: 1363, column: 24, scope: !3806)
!3990 = !DILocation(line: 1363, column: 28, scope: !3806)
!3991 = !DILocation(line: 1363, column: 9, scope: !3806)
!3992 = !DILocation(line: 1363, column: 11, scope: !3806)
!3993 = !DILocation(line: 1364, column: 13, scope: !3806)
!3994 = !DILocation(line: 1364, column: 24, scope: !3806)
!3995 = !DILocation(line: 1364, column: 28, scope: !3806)
!3996 = !DILocation(line: 1364, column: 9, scope: !3806)
!3997 = !DILocation(line: 1364, column: 11, scope: !3806)
!3998 = !DILocation(line: 1373, column: 15, scope: !3806)
!3999 = !DILocation(line: 1373, column: 38, scope: !3806)
!4000 = !DILocation(line: 1373, column: 36, scope: !3806)
!4001 = !DILocation(line: 1373, column: 55, scope: !3806)
!4002 = !DILocation(line: 1373, column: 8, scope: !3806)
!4003 = !DILocation(line: 1373, column: 7, scope: !3806)
!4004 = !DILocation(line: 1373, column: 5, scope: !3806)
!4005 = !DILocation(line: 1374, column: 15, scope: !4006)
!4006 = distinct !DILexicalBlock(scope: !3806, file: !2, line: 1374, column: 6)
!4007 = !DILocation(line: 1374, column: 6, scope: !4006)
!4008 = !DILocation(line: 1374, column: 29, scope: !4006)
!4009 = !DILocation(line: 1374, column: 20, scope: !4006)
!4010 = !DILocation(line: 1374, column: 18, scope: !4006)
!4011 = !DILocation(line: 1375, column: 23, scope: !4006)
!4012 = !DILocation(line: 1375, column: 22, scope: !4006)
!4013 = !DILocation(line: 1375, column: 31, scope: !4006)
!4014 = !DILocation(line: 1375, column: 15, scope: !4006)
!4015 = !DILocation(line: 1375, column: 43, scope: !4006)
!4016 = !DILocation(line: 1375, column: 34, scope: !4006)
!4017 = !DILocation(line: 1375, column: 50, scope: !4006)
!4018 = !DILocation(line: 1375, column: 45, scope: !4006)
!4019 = !DILocation(line: 1375, column: 57, scope: !4006)
!4020 = !DILocation(line: 1375, column: 8, scope: !4006)
!4021 = !DILocation(line: 1375, column: 6, scope: !4006)
!4022 = !DILocation(line: 1375, column: 3, scope: !4006)
!4023 = !DILocation(line: 1377, column: 23, scope: !4006)
!4024 = !DILocation(line: 1377, column: 22, scope: !4006)
!4025 = !DILocation(line: 1377, column: 31, scope: !4006)
!4026 = !DILocation(line: 1377, column: 15, scope: !4006)
!4027 = !DILocation(line: 1377, column: 43, scope: !4006)
!4028 = !DILocation(line: 1377, column: 34, scope: !4006)
!4029 = !DILocation(line: 1377, column: 50, scope: !4006)
!4030 = !DILocation(line: 1377, column: 45, scope: !4006)
!4031 = !DILocation(line: 1377, column: 57, scope: !4006)
!4032 = !DILocation(line: 1377, column: 8, scope: !4006)
!4033 = !DILocation(line: 1377, column: 6, scope: !4006)
!4034 = !DILocation(line: 1381, column: 8, scope: !4035)
!4035 = distinct !DILexicalBlock(scope: !3806, file: !2, line: 1381, column: 2)
!4036 = !DILocation(line: 1381, column: 7, scope: !4035)
!4037 = !DILocation(line: 1381, column: 11, scope: !4038)
!4038 = distinct !DILexicalBlock(scope: !4035, file: !2, line: 1381, column: 2)
!4039 = !DILocation(line: 1381, column: 12, scope: !4038)
!4040 = !DILocation(line: 1381, column: 2, scope: !4035)
!4041 = !DILocation(line: 1382, column: 13, scope: !4038)
!4042 = !DILocation(line: 1382, column: 19, scope: !4038)
!4043 = !DILocation(line: 1382, column: 37, scope: !4038)
!4044 = !DILocation(line: 1382, column: 44, scope: !4038)
!4045 = !DILocation(line: 1382, column: 47, scope: !4038)
!4046 = !DILocation(line: 1382, column: 46, scope: !4038)
!4047 = !DILocation(line: 1382, column: 24, scope: !4038)
!4048 = !DILocation(line: 1382, column: 8, scope: !4038)
!4049 = !DILocation(line: 1382, column: 3, scope: !4038)
!4050 = !DILocation(line: 1382, column: 11, scope: !4038)
!4051 = !DILocation(line: 1381, column: 16, scope: !4038)
!4052 = !DILocation(line: 1381, column: 2, scope: !4038)
!4053 = distinct !{!4053, !4040, !4054, !1730}
!4054 = !DILocation(line: 1382, column: 49, scope: !4035)
!4055 = !DILocation(line: 1384, column: 7, scope: !3806)
!4056 = !DILocation(line: 1384, column: 15, scope: !3806)
!4057 = !DILocation(line: 1384, column: 27, scope: !3806)
!4058 = !DILocation(line: 1384, column: 30, scope: !3806)
!4059 = !DILocation(line: 1384, column: 38, scope: !3806)
!4060 = !DILocation(line: 1384, column: 42, scope: !3806)
!4061 = !DILocation(line: 1384, column: 50, scope: !3806)
!4062 = !DILocation(line: 1384, column: 40, scope: !3806)
!4063 = !DILocation(line: 1384, column: 19, scope: !3806)
!4064 = !DILocation(line: 1384, column: 17, scope: !3806)
!4065 = !DILocation(line: 1384, column: 62, scope: !3806)
!4066 = !DILocation(line: 1384, column: 65, scope: !3806)
!4067 = !DILocation(line: 1384, column: 73, scope: !3806)
!4068 = !DILocation(line: 1384, column: 77, scope: !3806)
!4069 = !DILocation(line: 1384, column: 85, scope: !3806)
!4070 = !DILocation(line: 1384, column: 75, scope: !3806)
!4071 = !DILocation(line: 1384, column: 55, scope: !3806)
!4072 = !DILocation(line: 1384, column: 53, scope: !3806)
!4073 = !DILocation(line: 1384, column: 3, scope: !3806)
!4074 = !DILocation(line: 1384, column: 5, scope: !3806)
!4075 = !DILocation(line: 1385, column: 7, scope: !3806)
!4076 = !DILocation(line: 1385, column: 15, scope: !3806)
!4077 = !DILocation(line: 1385, column: 27, scope: !3806)
!4078 = !DILocation(line: 1385, column: 30, scope: !3806)
!4079 = !DILocation(line: 1385, column: 38, scope: !3806)
!4080 = !DILocation(line: 1385, column: 42, scope: !3806)
!4081 = !DILocation(line: 1385, column: 50, scope: !3806)
!4082 = !DILocation(line: 1385, column: 40, scope: !3806)
!4083 = !DILocation(line: 1385, column: 19, scope: !3806)
!4084 = !DILocation(line: 1385, column: 17, scope: !3806)
!4085 = !DILocation(line: 1385, column: 62, scope: !3806)
!4086 = !DILocation(line: 1385, column: 65, scope: !3806)
!4087 = !DILocation(line: 1385, column: 73, scope: !3806)
!4088 = !DILocation(line: 1385, column: 77, scope: !3806)
!4089 = !DILocation(line: 1385, column: 85, scope: !3806)
!4090 = !DILocation(line: 1385, column: 75, scope: !3806)
!4091 = !DILocation(line: 1385, column: 55, scope: !3806)
!4092 = !DILocation(line: 1385, column: 53, scope: !3806)
!4093 = !DILocation(line: 1385, column: 3, scope: !3806)
!4094 = !DILocation(line: 1385, column: 5, scope: !3806)
!4095 = !DILocation(line: 1387, column: 6, scope: !4096)
!4096 = distinct !DILexicalBlock(scope: !3806, file: !2, line: 1387, column: 6)
!4097 = !DILocation(line: 1388, column: 8, scope: !4096)
!4098 = !DILocation(line: 1388, column: 16, scope: !4096)
!4099 = !DILocation(line: 1388, column: 28, scope: !4096)
!4100 = !DILocation(line: 1388, column: 31, scope: !4096)
!4101 = !DILocation(line: 1388, column: 39, scope: !4096)
!4102 = !DILocation(line: 1388, column: 43, scope: !4096)
!4103 = !DILocation(line: 1388, column: 51, scope: !4096)
!4104 = !DILocation(line: 1388, column: 41, scope: !4096)
!4105 = !DILocation(line: 1388, column: 20, scope: !4096)
!4106 = !DILocation(line: 1388, column: 18, scope: !4096)
!4107 = !DILocation(line: 1388, column: 63, scope: !4096)
!4108 = !DILocation(line: 1388, column: 66, scope: !4096)
!4109 = !DILocation(line: 1388, column: 74, scope: !4096)
!4110 = !DILocation(line: 1388, column: 78, scope: !4096)
!4111 = !DILocation(line: 1388, column: 86, scope: !4096)
!4112 = !DILocation(line: 1388, column: 76, scope: !4096)
!4113 = !DILocation(line: 1388, column: 56, scope: !4096)
!4114 = !DILocation(line: 1388, column: 54, scope: !4096)
!4115 = !DILocation(line: 1388, column: 4, scope: !4096)
!4116 = !DILocation(line: 1388, column: 6, scope: !4096)
!4117 = !DILocation(line: 1388, column: 3, scope: !4096)
!4118 = !DILocation(line: 1391, column: 1, scope: !3806)
!4119 = distinct !DISubprogram(name: "f2i", linkageName: "_Z3f2ii", scope: !29, file: !29, line: 55, type: !4120, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !1379)
!4120 = !DISubroutineType(types: !4121)
!4121 = !{!32, !28}
!4122 = !DILocalVariable(name: "f", arg: 1, scope: !4119, file: !29, line: 55, type: !28)
!4123 = !DILocation(line: 55, column: 23, scope: !4119)
!4124 = !DILocation(line: 57, column: 9, scope: !4119)
!4125 = !DILocation(line: 57, column: 11, scope: !4119)
!4126 = !DILocation(line: 57, column: 2, scope: !4119)
!4127 = distinct !DISubprogram(name: "sphere_intersects_wall", linkageName: "_Z22sphere_intersects_wallP10vms_vectorii", scope: !2, file: !2, line: 1430, type: !4128, scopeLine: 1431, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !1379)
!4128 = !DISubroutineType(types: !4129)
!4129 = !{!32, !1398, !32, !28}
!4130 = !DILocalVariable(name: "pnt", arg: 1, scope: !4127, file: !2, line: 1430, type: !1398)
!4131 = !DILocation(line: 1430, column: 40, scope: !4127)
!4132 = !DILocalVariable(name: "segnum", arg: 2, scope: !4127, file: !2, line: 1430, type: !32)
!4133 = !DILocation(line: 1430, column: 48, scope: !4127)
!4134 = !DILocalVariable(name: "rad", arg: 3, scope: !4127, file: !2, line: 1430, type: !28)
!4135 = !DILocation(line: 1430, column: 59, scope: !4127)
!4136 = !DILocalVariable(name: "facemask", scope: !4127, file: !2, line: 1432, type: !32)
!4137 = !DILocation(line: 1432, column: 6, scope: !4127)
!4138 = !DILocalVariable(name: "seg", scope: !4127, file: !2, line: 1433, type: !1884)
!4139 = !DILocation(line: 1433, column: 11, scope: !4127)
!4140 = !DILocation(line: 1435, column: 35, scope: !4127)
!4141 = !DILocation(line: 1435, column: 29, scope: !4127)
!4142 = !DILocation(line: 1435, column: 2, scope: !4127)
!4143 = !DILocation(line: 1435, column: 33, scope: !4127)
!4144 = !DILocation(line: 1437, column: 27, scope: !4127)
!4145 = !DILocation(line: 1437, column: 31, scope: !4127)
!4146 = !DILocation(line: 1437, column: 38, scope: !4127)
!4147 = !DILocation(line: 1437, column: 13, scope: !4127)
!4148 = !DILocation(line: 1437, column: 43, scope: !4127)
!4149 = !DILocation(line: 1437, column: 11, scope: !4127)
!4150 = !DILocation(line: 1439, column: 18, scope: !4127)
!4151 = !DILocation(line: 1439, column: 9, scope: !4127)
!4152 = !DILocation(line: 1439, column: 6, scope: !4127)
!4153 = !DILocation(line: 1441, column: 6, scope: !4154)
!4154 = distinct !DILexicalBlock(scope: !4127, file: !2, line: 1441, column: 6)
!4155 = !DILocation(line: 1441, column: 15, scope: !4154)
!4156 = !DILocalVariable(name: "side", scope: !4157, file: !2, line: 1443, type: !32)
!4157 = distinct !DILexicalBlock(scope: !4154, file: !2, line: 1441, column: 21)
!4158 = !DILocation(line: 1443, column: 7, scope: !4157)
!4159 = !DILocalVariable(name: "bit", scope: !4157, file: !2, line: 1443, type: !32)
!4160 = !DILocation(line: 1443, column: 12, scope: !4157)
!4161 = !DILocalVariable(name: "face", scope: !4157, file: !2, line: 1443, type: !32)
!4162 = !DILocation(line: 1443, column: 16, scope: !4157)
!4163 = !DILocation(line: 1447, column: 12, scope: !4164)
!4164 = distinct !DILexicalBlock(scope: !4157, file: !2, line: 1447, column: 3)
!4165 = !DILocation(line: 1447, column: 18, scope: !4164)
!4166 = !DILocation(line: 1447, column: 8, scope: !4164)
!4167 = !DILocation(line: 1447, column: 21, scope: !4168)
!4168 = distinct !DILexicalBlock(scope: !4164, file: !2, line: 1447, column: 3)
!4169 = !DILocation(line: 1447, column: 25, scope: !4168)
!4170 = !DILocation(line: 1447, column: 28, scope: !4168)
!4171 = !DILocation(line: 1447, column: 31, scope: !4168)
!4172 = !DILocation(line: 1447, column: 41, scope: !4168)
!4173 = !DILocation(line: 1447, column: 39, scope: !4168)
!4174 = !DILocation(line: 0, scope: !4168)
!4175 = !DILocation(line: 1447, column: 3, scope: !4164)
!4176 = !DILocation(line: 1449, column: 13, scope: !4177)
!4177 = distinct !DILexicalBlock(scope: !4178, file: !2, line: 1449, column: 4)
!4178 = distinct !DILexicalBlock(scope: !4168, file: !2, line: 1447, column: 53)
!4179 = !DILocation(line: 1449, column: 9, scope: !4177)
!4180 = !DILocation(line: 1449, column: 16, scope: !4181)
!4181 = distinct !DILexicalBlock(scope: !4177, file: !2, line: 1449, column: 4)
!4182 = !DILocation(line: 1449, column: 20, scope: !4181)
!4183 = !DILocation(line: 1449, column: 4, scope: !4177)
!4184 = !DILocation(line: 1451, column: 9, scope: !4185)
!4185 = distinct !DILexicalBlock(scope: !4186, file: !2, line: 1451, column: 9)
!4186 = distinct !DILexicalBlock(scope: !4181, file: !2, line: 1449, column: 39)
!4187 = !DILocation(line: 1451, column: 20, scope: !4185)
!4188 = !DILocation(line: 1451, column: 18, scope: !4185)
!4189 = !DILocalVariable(name: "face_hit_type", scope: !4190, file: !2, line: 1452, type: !32)
!4190 = distinct !DILexicalBlock(scope: !4185, file: !2, line: 1451, column: 25)
!4191 = !DILocation(line: 1452, column: 10, scope: !4190)
!4192 = !DILocalVariable(name: "num_faces", scope: !4190, file: !2, line: 1453, type: !32)
!4193 = !DILocation(line: 1453, column: 10, scope: !4190)
!4194 = !DILocalVariable(name: "vertex_list", scope: !4190, file: !2, line: 1453, type: !1930)
!4195 = !DILocation(line: 1453, column: 20, scope: !4190)
!4196 = !DILocation(line: 1457, column: 11, scope: !4197)
!4197 = distinct !DILexicalBlock(scope: !4190, file: !2, line: 1457, column: 10)
!4198 = !DILocation(line: 1457, column: 14, scope: !4197)
!4199 = !DILocation(line: 1457, column: 24, scope: !4197)
!4200 = !DILocation(line: 1458, column: 7, scope: !4197)
!4201 = !DILocation(line: 1460, column: 41, scope: !4190)
!4202 = !DILocation(line: 1460, column: 53, scope: !4190)
!4203 = !DILocation(line: 1460, column: 56, scope: !4190)
!4204 = !DILocation(line: 1460, column: 66, scope: !4190)
!4205 = !DILocation(line: 1460, column: 6, scope: !4190)
!4206 = !DILocation(line: 1462, column: 44, scope: !4190)
!4207 = !DILocation(line: 1462, column: 49, scope: !4190)
!4208 = !DILocation(line: 1462, column: 54, scope: !4190)
!4209 = !DILocation(line: 1462, column: 60, scope: !4190)
!4210 = !DILocation(line: 1463, column: 11, scope: !4190)
!4211 = !DILocation(line: 1463, column: 18, scope: !4190)
!4212 = !DILocation(line: 1463, column: 27, scope: !4190)
!4213 = !DILocation(line: 1463, column: 17, scope: !4190)
!4214 = !DILocation(line: 1463, column: 37, scope: !4190)
!4215 = !DILocation(line: 1463, column: 41, scope: !4190)
!4216 = !DILocation(line: 1462, column: 22, scope: !4190)
!4217 = !DILocation(line: 1462, column: 20, scope: !4190)
!4218 = !DILocation(line: 1465, column: 10, scope: !4219)
!4219 = distinct !DILexicalBlock(scope: !4190, file: !2, line: 1465, column: 10)
!4220 = !DILocalVariable(name: "child", scope: !4221, file: !2, line: 1466, type: !32)
!4221 = distinct !DILexicalBlock(scope: !4219, file: !2, line: 1465, column: 25)
!4222 = !DILocation(line: 1466, column: 11, scope: !4221)
!4223 = !DILocalVariable(name: "i", scope: !4221, file: !2, line: 1466, type: !32)
!4224 = !DILocation(line: 1466, column: 17, scope: !4221)
!4225 = !DILocation(line: 1470, column: 15, scope: !4221)
!4226 = !DILocation(line: 1470, column: 20, scope: !4221)
!4227 = !DILocation(line: 1470, column: 29, scope: !4221)
!4228 = !DILocation(line: 1470, column: 13, scope: !4221)
!4229 = !DILocation(line: 1472, column: 13, scope: !4230)
!4230 = distinct !DILexicalBlock(scope: !4221, file: !2, line: 1472, column: 7)
!4231 = !DILocation(line: 1472, column: 12, scope: !4230)
!4232 = !DILocation(line: 1472, column: 16, scope: !4233)
!4233 = distinct !DILexicalBlock(scope: !4230, file: !2, line: 1472, column: 7)
!4234 = !DILocation(line: 1472, column: 18, scope: !4233)
!4235 = !DILocation(line: 1472, column: 17, scope: !4233)
!4236 = !DILocation(line: 1472, column: 33, scope: !4233)
!4237 = !DILocation(line: 1472, column: 36, scope: !4233)
!4238 = !DILocation(line: 1472, column: 56, scope: !4233)
!4239 = !DILocation(line: 1472, column: 43, scope: !4233)
!4240 = !DILocation(line: 1472, column: 41, scope: !4233)
!4241 = !DILocation(line: 0, scope: !4233)
!4242 = !DILocation(line: 1472, column: 7, scope: !4230)
!4243 = !DILocation(line: 1472, column: 60, scope: !4233)
!4244 = !DILocation(line: 1472, column: 7, scope: !4233)
!4245 = distinct !{!4245, !4242, !4246, !1730}
!4246 = !DILocation(line: 1472, column: 63, scope: !4230)
!4247 = !DILocation(line: 1474, column: 11, scope: !4248)
!4248 = distinct !DILexicalBlock(scope: !4221, file: !2, line: 1474, column: 11)
!4249 = !DILocation(line: 1474, column: 14, scope: !4248)
!4250 = !DILocation(line: 1474, column: 12, scope: !4248)
!4251 = !DILocation(line: 1476, column: 13, scope: !4252)
!4252 = distinct !DILexicalBlock(scope: !4253, file: !2, line: 1476, column: 12)
!4253 = distinct !DILexicalBlock(scope: !4248, file: !2, line: 1474, column: 30)
!4254 = !DILocation(line: 1476, column: 12, scope: !4252)
!4255 = !DILocation(line: 1477, column: 9, scope: !4252)
!4256 = !DILocation(line: 1480, column: 36, scope: !4257)
!4257 = distinct !DILexicalBlock(scope: !4258, file: !2, line: 1480, column: 13)
!4258 = distinct !DILexicalBlock(scope: !4252, file: !2, line: 1478, column: 13)
!4259 = !DILocation(line: 1480, column: 40, scope: !4257)
!4260 = !DILocation(line: 1480, column: 46, scope: !4257)
!4261 = !DILocation(line: 1480, column: 13, scope: !4257)
!4262 = !DILocation(line: 1481, column: 10, scope: !4257)
!4263 = !DILocation(line: 1483, column: 7, scope: !4253)
!4264 = !DILocation(line: 1484, column: 6, scope: !4221)
!4265 = !DILocation(line: 1485, column: 5, scope: !4190)
!4266 = !DILocation(line: 1486, column: 4, scope: !4186)
!4267 = !DILocation(line: 1449, column: 27, scope: !4181)
!4268 = !DILocation(line: 1449, column: 33, scope: !4181)
!4269 = !DILocation(line: 1449, column: 4, scope: !4181)
!4270 = distinct !{!4270, !4183, !4271, !1730}
!4271 = !DILocation(line: 1486, column: 4, scope: !4177)
!4272 = !DILocation(line: 1487, column: 3, scope: !4178)
!4273 = !DILocation(line: 1447, column: 49, scope: !4168)
!4274 = !DILocation(line: 1447, column: 3, scope: !4168)
!4275 = distinct !{!4275, !4175, !4276, !1730}
!4276 = !DILocation(line: 1487, column: 3, scope: !4164)
!4277 = !DILocation(line: 1488, column: 2, scope: !4157)
!4278 = !DILocation(line: 1490, column: 2, scope: !4127)
!4279 = !DILocation(line: 1491, column: 1, scope: !4127)
!4280 = distinct !DISubprogram(name: "object_intersects_wall", linkageName: "_Z22object_intersects_wallP6object", scope: !2, file: !2, line: 1494, type: !4281, scopeLine: 1495, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !1379)
!4281 = !DISubroutineType(types: !4282)
!4282 = !{!32, !2498}
!4283 = !DILocalVariable(name: "objp", arg: 1, scope: !4280, file: !2, line: 1494, type: !2498)
!4284 = !DILocation(line: 1494, column: 36, scope: !4280)
!4285 = !DILocation(line: 1511, column: 17, scope: !4280)
!4286 = !DILocation(line: 1513, column: 33, scope: !4280)
!4287 = !DILocation(line: 1513, column: 39, scope: !4280)
!4288 = !DILocation(line: 1513, column: 43, scope: !4280)
!4289 = !DILocation(line: 1513, column: 49, scope: !4280)
!4290 = !DILocation(line: 1513, column: 56, scope: !4280)
!4291 = !DILocation(line: 1513, column: 62, scope: !4280)
!4292 = !DILocation(line: 1513, column: 9, scope: !4280)
!4293 = !DILocation(line: 1513, column: 2, scope: !4280)
!4294 = distinct !DISubprogram(name: "min<int, std::__1::__less<void, void> >", linkageName: "_ZNSt3__13minB8ne200100IiNS_6__lessIvvEEEERKT_S5_S5_T0_", scope: !120, file: !2012, line: 29, type: !4295, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, templateParams: !4302, retainedNodes: !1379)
!4295 = !DISubroutineType(types: !4296)
!4296 = !{!2015, !2015, !2015, !4297}
!4297 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__less<void, void>", scope: !120, file: !4298, line: 38, size: 8, flags: DIFlagTypePassByValue, elements: !1379, templateParams: !4299, identifier: "_ZTSNSt3__16__lessIvvEE")
!4298 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__algorithm/comp.h", directory: "")
!4299 = !{!4300, !4301}
!4300 = !DITemplateTypeParameter(name: "_T1", type: null, defaulted: true)
!4301 = !DITemplateTypeParameter(name: "_T2", type: null, defaulted: true)
!4302 = !{!2017, !4303}
!4303 = !DITemplateTypeParameter(name: "_Compare", type: !4297)
!4304 = !DILocalVariable(name: "__a", arg: 1, scope: !4294, file: !2012, line: 29, type: !2015)
!4305 = !DILocation(line: 29, column: 38, scope: !4294)
!4306 = !DILocalVariable(name: "__b", arg: 2, scope: !4294, file: !2012, line: 29, type: !2015)
!4307 = !DILocation(line: 29, column: 76, scope: !4294)
!4308 = !DILocalVariable(name: "__comp", arg: 3, scope: !4294, file: !2012, line: 29, type: !4297)
!4309 = !DILocation(line: 29, column: 90, scope: !4294)
!4310 = !DILocation(line: 30, column: 17, scope: !4294)
!4311 = !DILocation(line: 30, column: 22, scope: !4294)
!4312 = !DILocation(line: 30, column: 10, scope: !4294)
!4313 = !DILocation(line: 30, column: 29, scope: !4294)
!4314 = !DILocation(line: 30, column: 35, scope: !4294)
!4315 = !DILocation(line: 30, column: 3, scope: !4294)
!4316 = distinct !DISubprogram(name: "operator()<int, int>", linkageName: "_ZNKSt3__16__lessIvvEclB8ne200100IiiEEbRKT_RKT0_", scope: !4297, file: !4298, line: 40, type: !4317, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, templateParams: !4322, declaration: !4321, retainedNodes: !1379)
!4317 = !DISubroutineType(types: !4318)
!4318 = !{!682, !4319, !2015, !2015}
!4319 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4320, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!4320 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4297)
!4321 = !DISubprogram(name: "operator()<int, int>", linkageName: "_ZNKSt3__16__lessIvvEclB8ne200100IiiEEbRKT_RKT0_", scope: !4297, file: !4298, line: 40, type: !4317, scopeLine: 40, flags: DIFlagPrototyped, spFlags: 0, templateParams: !4322)
!4322 = !{!2017, !4323}
!4323 = !DITemplateTypeParameter(name: "_Up", type: !32)
!4324 = !DILocalVariable(name: "this", arg: 1, scope: !4316, type: !4325, flags: DIFlagArtificial | DIFlagObjectPointer)
!4325 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4320, size: 64)
!4326 = !DILocation(line: 0, scope: !4316)
!4327 = !DILocalVariable(name: "__lhs", arg: 2, scope: !4316, file: !4298, line: 40, type: !2015)
!4328 = !DILocation(line: 40, column: 82, scope: !4316)
!4329 = !DILocalVariable(name: "__rhs", arg: 3, scope: !4316, file: !4298, line: 40, type: !2015)
!4330 = !DILocation(line: 40, column: 100, scope: !4316)
!4331 = !DILocation(line: 41, column: 12, scope: !4316)
!4332 = !DILocation(line: 41, column: 20, scope: !4316)
!4333 = !DILocation(line: 41, column: 18, scope: !4316)
!4334 = !DILocation(line: 41, column: 5, scope: !4316)
