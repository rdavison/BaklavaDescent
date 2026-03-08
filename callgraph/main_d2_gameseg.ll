; ModuleID = '/Users/richard/code/ChocolateDescent/main_d2/gameseg.cpp'
source_filename = "/Users/richard/code/ChocolateDescent/main_d2/gameseg.cpp"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

%struct.dl_index = type { i16, i8, i8, i16 }
%struct.delta_light = type { i16, i8, i8, [4 x i8] }
%struct.vms_vector = type { i32, i32, i32 }
%struct.segment = type { [6 x %struct.side], [6 x i16], [8 x i16], i32 }
%struct.side = type { i8, i8, i16, i16, i16, [4 x %struct.uvl], [2 x %struct.vms_vector] }
%struct.uvl = type { i32, i32, i32 }
%struct.fcd_data = type { i32, i32, i32, i32 }
%struct.object = type { i32, i8, i8, i16, i16, i8, i8, i8, i8, i16, i16, %struct.vms_vector, %struct.vms_matrix, i32, i32, %struct.vms_vector, i8, i8, i8, i8, i32, %union.anon, %union.anon.0, %union.anon.1 }
%struct.vms_matrix = type { %struct.vms_vector, %struct.vms_vector, %struct.vms_vector }
%union.anon = type { %struct.physics_info }
%struct.physics_info = type { %struct.vms_vector, %struct.vms_vector, i32, i32, i32, %struct.vms_vector, %struct.vms_vector, i16, i16 }
%union.anon.0 = type { %struct.ai_static }
%struct.ai_static = type { i8, [11 x i8], i16, i16, i16, i8, i8, i16, i32, i32 }
%union.anon.1 = type { %struct.polyobj_info }
%struct.polyobj_info = type { i32, [10 x %struct.vms_angvec], i32, i32, i32 }
%struct.vms_angvec = type { i16, i16, i16 }
%struct.segment2 = type { i8, i8, i8, i8, i32 }
%struct.tmap_info = type { i8, [3 x i8], i32, i32, i16, i16, i16, i16 }
%struct.segmasks = type { i16, i8, i8 }
%"struct.std::__1::__less" = type { i8 }
%struct.seg_seg = type { i16, i16 }
%struct.point_seg = type { i32, %struct.vms_vector }
%struct.shortpos = type { [9 x i8], i16, i16, i16, i16, i16, i16, i16 }

@Dl_indices = global [500 x %struct.dl_index] zeroinitializer, align 2, !dbg !0
@Delta_lights = global [10000 x %struct.delta_light] zeroinitializer, align 2, !dbg !14
@Num_static_lights = global i32 0, align 4, !dbg !38
@Vertices = external global [0 x %struct.vms_vector], align 4
@Side_to_verts = external global [6 x [4 x i8]], align 1
@Segments = external global [0 x %struct.segment], align 4
@.str = private unnamed_addr constant [19 x i8] c"Illegal type = %i\0A\00", align 1, !dbg !40
@Highest_segment_index = external global i32, align 4
@.str.1 = private unnamed_addr constant [51 x i8] c"(segnum <= Highest_segment_index) && (segnum >= 0)\00", align 1, !dbg !47
@.str.2 = private unnamed_addr constant [57 x i8] c"/Users/richard/code/ChocolateDescent/main_d2/gameseg.cpp\00", align 1, !dbg !52
@.str.3 = private unnamed_addr constant [63 x i8] c"Illegal side type (2), type = %i, segment # = %i, side # = %i\0A\00", align 1, !dbg !57
@Side_to_verts_int = external global [6 x [4 x i32]], align 4
@.str.4 = private unnamed_addr constant [63 x i8] c"Illegal side type (3), type = %i, segment # = %i, side # = %i\0A\00", align 1, !dbg !62
@.str.5 = private unnamed_addr constant [32 x i8] c"segnum == -1 in get_seg_masks()\00", align 1, !dbg !64
@.str.6 = private unnamed_addr constant [32 x i8] c"segnum == -1 in get_seg_dists()\00", align 1, !dbg !69
@.str.7 = private unnamed_addr constant [106 x i8] c"Seg %x, side %d, norm %d doesn't match seg %x, side %d, norm %d:\0A   %8x %8x %8x\0A   %8x %8x %8x (negated)\0A\00", align 1, !dbg !71
@.str.8 = private unnamed_addr constant [66 x i8] c"Could not find connected side for seg %x back to seg %x, side %d\0A\00", align 1, !dbg !76
@.str.9 = private unnamed_addr constant [68 x i8] c"Seg %x, side %d: num_faces (%d) mismatch with seg %x, side %d (%d)\0A\00", align 1, !dbg !81
@.str.10 = private unnamed_addr constant [88 x i8] c"Seg %x, side %d: vertex list mismatch with seg %x, side %d\0A  %x %x %x %x\0A  %x %x %x %x\0A\00", align 1, !dbg !86
@.str.11 = private unnamed_addr constant [102 x i8] c"Seg %x, side %d: vertex list mismatch with seg %x, side %d\0A  %x %x %x  %x %x %x\0A  %x %x %x  %x %x %x\0A\00", align 1, !dbg !91
@.str.12 = private unnamed_addr constant [40 x i8] c"Changing seg:side %4i:%i from %i to %i\0A\00", align 1, !dbg !96
@Doing_lighting_hack_flag = global i32 0, align 4, !dbg !101
@.str.13 = private unnamed_addr constant [57 x i8] c"(oldsegnum <= Highest_segment_index) && (oldsegnum >= 0)\00", align 1, !dbg !103
@__stderrp = external global ptr, align 8
@.str.14 = private unnamed_addr constant [33 x i8] c"trace_segs: iteration limit hit\0A\00", align 1, !dbg !105
@Exhaustive_count = global i32 0, align 4, !dbg !110
@Exhaustive_failed_count = global i32 0, align 4, !dbg !112
@.str.15 = private unnamed_addr constant [52 x i8] c"(segnum <= Highest_segment_index) && (segnum >= -1)\00", align 1, !dbg !114
@.str.16 = private unnamed_addr constant [67 x i8] c"Warning: doing exhaustive search to find point segment (%i times)\0A\00", align 1, !dbg !119
@.str.17 = private unnamed_addr constant [50 x i8] c"Warning: could not find point segment (%i times)\0A\00", align 1, !dbg !124
@Connected_segment_distance = global i32 0, align 4, !dbg !129
@Fcd_index = global i32 0, align 4, !dbg !131
@Fcd_cache = global [8 x %struct.fcd_data] zeroinitializer, align 4, !dbg !133
@Last_fcd_flush_time = global i32 0, align 4, !dbg !145
@.str.18 = private unnamed_addr constant [68 x i8] c"Warning: In find_connected_distance, max_depth = %i, limited to %i\0A\00", align 1, !dbg !147
@GameTime = external global i32, align 4
@.str.19 = private unnamed_addr constant [11 x i8] c"qtail >= 0\00", align 1, !dbg !149
@.str.20 = private unnamed_addr constant [51 x i8] c"(segnum >= 0) && (segnum <= Highest_segment_index)\00", align 1, !dbg !154
@Objects = external global [0 x %struct.object], align 4
@.str.21 = private unnamed_addr constant [48 x i8] c"(v[0] < v[1]) && (v[1] < v[2]) && (v[2] < v[3])\00", align 1, !dbg !156
@.str.22 = private unnamed_addr constant [15 x i8] c"num_faces == 2\00", align 1, !dbg !161
@changed_segs = global [30 x i16] zeroinitializer, align 2, !dbg !166
@n_changed_segs = global i32 0, align 4, !dbg !171
@Segment2s = external global [0 x %struct.segment2], align 4
@TmapInfo = external global [1200 x %struct.tmap_info], align 4
@old_viewer = external global ptr, align 8
@Light_subtracted = global [900 x i8] zeroinitializer, align 1, !dbg !173

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z28compute_center_point_on_sideP10vms_vectorP7segmenti(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 !dbg !1444 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !1489, !DIExpression(), !1490)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !1491, !DIExpression(), !1492)
  store i32 %2, ptr %6, align 4
    #dbg_declare(ptr %6, !1493, !DIExpression(), !1494)
    #dbg_declare(ptr %7, !1495, !DIExpression(), !1496)
  %8 = load ptr, ptr %4, align 8, !dbg !1497
  %9 = getelementptr inbounds nuw %struct.vms_vector, ptr %8, i32 0, i32 2, !dbg !1497
  store i32 0, ptr %9, align 4, !dbg !1497
  %10 = load ptr, ptr %4, align 8, !dbg !1497
  %11 = getelementptr inbounds nuw %struct.vms_vector, ptr %10, i32 0, i32 1, !dbg !1497
  store i32 0, ptr %11, align 4, !dbg !1497
  %12 = load ptr, ptr %4, align 8, !dbg !1497
  %13 = getelementptr inbounds nuw %struct.vms_vector, ptr %12, i32 0, i32 0, !dbg !1497
  store i32 0, ptr %13, align 4, !dbg !1497
  store i32 0, ptr %7, align 4, !dbg !1498
  br label %14, !dbg !1500

14:                                               ; preds = %34, %3
  %15 = load i32, ptr %7, align 4, !dbg !1501
  %16 = icmp slt i32 %15, 4, !dbg !1503
  br i1 %16, label %17, label %37, !dbg !1504

17:                                               ; preds = %14
  %18 = load ptr, ptr %4, align 8, !dbg !1505
  %19 = load ptr, ptr %5, align 8, !dbg !1506
  %20 = getelementptr inbounds nuw %struct.segment, ptr %19, i32 0, i32 2, !dbg !1507
  %21 = load i32, ptr %6, align 4, !dbg !1508
  %22 = sext i32 %21 to i64, !dbg !1509
  %23 = getelementptr inbounds [6 x [4 x i8]], ptr @Side_to_verts, i64 0, i64 %22, !dbg !1509
  %24 = load i32, ptr %7, align 4, !dbg !1510
  %25 = sext i32 %24 to i64, !dbg !1509
  %26 = getelementptr inbounds [4 x i8], ptr %23, i64 0, i64 %25, !dbg !1509
  %27 = load i8, ptr %26, align 1, !dbg !1509
  %28 = sext i8 %27 to i64, !dbg !1506
  %29 = getelementptr inbounds [8 x i16], ptr %20, i64 0, i64 %28, !dbg !1506
  %30 = load i16, ptr %29, align 2, !dbg !1506
  %31 = sext i16 %30 to i64, !dbg !1511
  %32 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %31, !dbg !1511
  %33 = call noundef ptr @_Z11vm_vec_add2P10vms_vectorS0_(ptr noundef %18, ptr noundef %32), !dbg !1512
  br label %34, !dbg !1512

34:                                               ; preds = %17
  %35 = load i32, ptr %7, align 4, !dbg !1513
  %36 = add nsw i32 %35, 1, !dbg !1513
  store i32 %36, ptr %7, align 4, !dbg !1513
  br label %14, !dbg !1514, !llvm.loop !1515

37:                                               ; preds = %14
  %38 = load ptr, ptr %4, align 8, !dbg !1518
  %39 = call noundef ptr @_Z12vm_vec_scaleP10vms_vectori(ptr noundef %38, i32 noundef 16384), !dbg !1519
  ret void, !dbg !1520
}

declare noundef ptr @_Z11vm_vec_add2P10vms_vectorS0_(ptr noundef, ptr noundef) #1

declare noundef ptr @_Z12vm_vec_scaleP10vms_vectori(ptr noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z22compute_segment_centerP10vms_vectorP7segment(ptr noundef %0, ptr noundef %1) #0 !dbg !1521 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !1524, !DIExpression(), !1525)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !1526, !DIExpression(), !1527)
    #dbg_declare(ptr %5, !1528, !DIExpression(), !1529)
  %6 = load ptr, ptr %3, align 8, !dbg !1530
  %7 = getelementptr inbounds nuw %struct.vms_vector, ptr %6, i32 0, i32 2, !dbg !1530
  store i32 0, ptr %7, align 4, !dbg !1530
  %8 = load ptr, ptr %3, align 8, !dbg !1530
  %9 = getelementptr inbounds nuw %struct.vms_vector, ptr %8, i32 0, i32 1, !dbg !1530
  store i32 0, ptr %9, align 4, !dbg !1530
  %10 = load ptr, ptr %3, align 8, !dbg !1530
  %11 = getelementptr inbounds nuw %struct.vms_vector, ptr %10, i32 0, i32 0, !dbg !1530
  store i32 0, ptr %11, align 4, !dbg !1530
  store i32 0, ptr %5, align 4, !dbg !1531
  br label %12, !dbg !1533

12:                                               ; preds = %26, %2
  %13 = load i32, ptr %5, align 4, !dbg !1534
  %14 = icmp slt i32 %13, 8, !dbg !1536
  br i1 %14, label %15, label %29, !dbg !1537

15:                                               ; preds = %12
  %16 = load ptr, ptr %3, align 8, !dbg !1538
  %17 = load ptr, ptr %4, align 8, !dbg !1539
  %18 = getelementptr inbounds nuw %struct.segment, ptr %17, i32 0, i32 2, !dbg !1540
  %19 = load i32, ptr %5, align 4, !dbg !1541
  %20 = sext i32 %19 to i64, !dbg !1539
  %21 = getelementptr inbounds [8 x i16], ptr %18, i64 0, i64 %20, !dbg !1539
  %22 = load i16, ptr %21, align 2, !dbg !1539
  %23 = sext i16 %22 to i64, !dbg !1542
  %24 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %23, !dbg !1542
  %25 = call noundef ptr @_Z11vm_vec_add2P10vms_vectorS0_(ptr noundef %16, ptr noundef %24), !dbg !1543
  br label %26, !dbg !1543

26:                                               ; preds = %15
  %27 = load i32, ptr %5, align 4, !dbg !1544
  %28 = add nsw i32 %27, 1, !dbg !1544
  store i32 %28, ptr %5, align 4, !dbg !1544
  br label %12, !dbg !1545, !llvm.loop !1546

29:                                               ; preds = %12
  %30 = load ptr, ptr %3, align 8, !dbg !1548
  %31 = call noundef ptr @_Z12vm_vec_scaleP10vms_vectori(ptr noundef %30, i32 noundef 8192), !dbg !1549
  ret void, !dbg !1550
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define noundef i32 @_Z17find_connect_sideP7segmentS0_(ptr noundef %0, ptr noundef %1) #2 !dbg !1551 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i16, align 2
  %8 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !1554, !DIExpression(), !1555)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !1556, !DIExpression(), !1557)
    #dbg_declare(ptr %6, !1558, !DIExpression(), !1559)
    #dbg_declare(ptr %7, !1560, !DIExpression(), !1561)
  %9 = load ptr, ptr %4, align 8, !dbg !1562
  %10 = ptrtoint ptr %9 to i64, !dbg !1563
  %11 = sub i64 %10, ptrtoint (ptr @Segments to i64), !dbg !1563
  %12 = sdiv exact i64 %11, 512, !dbg !1563
  %13 = trunc i64 %12 to i16, !dbg !1562
  store i16 %13, ptr %7, align 2, !dbg !1561
    #dbg_declare(ptr %8, !1564, !DIExpression(), !1566)
  %14 = load ptr, ptr %5, align 8, !dbg !1567
  %15 = getelementptr inbounds nuw %struct.segment, ptr %14, i32 0, i32 1, !dbg !1568
  %16 = getelementptr inbounds [6 x i16], ptr %15, i64 0, i64 0, !dbg !1567
  store ptr %16, ptr %8, align 8, !dbg !1566
  store i32 0, ptr %6, align 4, !dbg !1569
  br label %17, !dbg !1571

17:                                               ; preds = %31, %2
  %18 = load i32, ptr %6, align 4, !dbg !1572
  %19 = icmp slt i32 %18, 6, !dbg !1574
  br i1 %19, label %20, label %34, !dbg !1575

20:                                               ; preds = %17
  %21 = load ptr, ptr %8, align 8, !dbg !1576
  %22 = getelementptr inbounds nuw i16, ptr %21, i32 1, !dbg !1576
  store ptr %22, ptr %8, align 8, !dbg !1576
  %23 = load i16, ptr %21, align 2, !dbg !1579
  %24 = sext i16 %23 to i32, !dbg !1579
  %25 = load i16, ptr %7, align 2, !dbg !1580
  %26 = sext i16 %25 to i32, !dbg !1580
  %27 = icmp eq i32 %24, %26, !dbg !1581
  br i1 %27, label %28, label %30, !dbg !1581

28:                                               ; preds = %20
  %29 = load i32, ptr %6, align 4, !dbg !1582
  store i32 %29, ptr %3, align 4, !dbg !1583
  br label %35, !dbg !1583

30:                                               ; preds = %20
  br label %31, !dbg !1584

31:                                               ; preds = %30
  %32 = load i32, ptr %6, align 4, !dbg !1585
  %33 = add nsw i32 %32, 1, !dbg !1585
  store i32 %33, ptr %6, align 4, !dbg !1585
  br label %17, !dbg !1586, !llvm.loop !1587

34:                                               ; preds = %17
  store i32 -1, ptr %3, align 4, !dbg !1589
  br label %35, !dbg !1589

35:                                               ; preds = %34, %28
  %36 = load i32, ptr %3, align 4, !dbg !1590
  ret i32 %36, !dbg !1590
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z13get_num_facesP4side(ptr noundef %0) #0 !dbg !1591 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !1595, !DIExpression(), !1596)
  %4 = load ptr, ptr %3, align 8, !dbg !1597
  %5 = getelementptr inbounds nuw %struct.side, ptr %4, i32 0, i32 0, !dbg !1598
  %6 = load i8, ptr %5, align 4, !dbg !1598
  %7 = sext i8 %6 to i32, !dbg !1597
  switch i32 %7, label %10 [
    i32 1, label %8
    i32 2, label %9
    i32 3, label %9
  ], !dbg !1599

8:                                                ; preds = %1
  store i32 1, ptr %2, align 4, !dbg !1600
  br label %16, !dbg !1600

9:                                                ; preds = %1, %1
  store i32 2, ptr %2, align 4, !dbg !1602
  br label %16, !dbg !1602

10:                                               ; preds = %1
  %11 = load ptr, ptr %3, align 8, !dbg !1603
  %12 = getelementptr inbounds nuw %struct.side, ptr %11, i32 0, i32 0, !dbg !1604
  %13 = load i8, ptr %12, align 4, !dbg !1604
  %14 = sext i8 %13 to i32, !dbg !1603
  call void (ptr, ...) @_Z5ErrorPKcz(ptr noundef @.str, i32 noundef %14), !dbg !1605
  br label %15, !dbg !1606

15:                                               ; preds = %10
  store i32 0, ptr %2, align 4, !dbg !1607
  br label %16, !dbg !1607

16:                                               ; preds = %15, %9, %8
  %17 = load i32, ptr %2, align 4, !dbg !1608
  ret i32 %17, !dbg !1608
}

declare void @_Z5ErrorPKcz(ptr noundef, ...) #1

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define void @_Z14get_side_vertsPsii(ptr noundef %0, i32 noundef %1, i32 noundef %2) #2 !dbg !1609 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !1612, !DIExpression(), !1613)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !1614, !DIExpression(), !1615)
  store i32 %2, ptr %6, align 4
    #dbg_declare(ptr %6, !1616, !DIExpression(), !1617)
    #dbg_declare(ptr %7, !1618, !DIExpression(), !1619)
    #dbg_declare(ptr %8, !1620, !DIExpression(), !1622)
  %10 = load i32, ptr %6, align 4, !dbg !1623
  %11 = sext i32 %10 to i64, !dbg !1624
  %12 = getelementptr inbounds [6 x [4 x i8]], ptr @Side_to_verts, i64 0, i64 %11, !dbg !1624
  %13 = getelementptr inbounds [4 x i8], ptr %12, i64 0, i64 0, !dbg !1624
  store ptr %13, ptr %8, align 8, !dbg !1622
    #dbg_declare(ptr %9, !1625, !DIExpression(), !1626)
  %14 = load i32, ptr %5, align 4, !dbg !1627
  %15 = sext i32 %14 to i64, !dbg !1628
  %16 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %15, !dbg !1628
  %17 = getelementptr inbounds nuw %struct.segment, ptr %16, i32 0, i32 2, !dbg !1629
  %18 = getelementptr inbounds [8 x i16], ptr %17, i64 0, i64 0, !dbg !1628
  store ptr %18, ptr %9, align 8, !dbg !1626
  store i32 4, ptr %7, align 4, !dbg !1630
  br label %19, !dbg !1632

19:                                               ; preds = %23, %3
  %20 = load i32, ptr %7, align 4, !dbg !1633
  %21 = add nsw i32 %20, -1, !dbg !1633
  store i32 %21, ptr %7, align 4, !dbg !1633
  %22 = icmp ne i32 %20, 0, !dbg !1635
  br i1 %22, label %23, label %37, !dbg !1636

23:                                               ; preds = %19
  %24 = load ptr, ptr %9, align 8, !dbg !1637
  %25 = load ptr, ptr %8, align 8, !dbg !1638
  %26 = load i32, ptr %7, align 4, !dbg !1639
  %27 = sext i32 %26 to i64, !dbg !1638
  %28 = getelementptr inbounds i8, ptr %25, i64 %27, !dbg !1638
  %29 = load i8, ptr %28, align 1, !dbg !1638
  %30 = sext i8 %29 to i64, !dbg !1637
  %31 = getelementptr inbounds i16, ptr %24, i64 %30, !dbg !1637
  %32 = load i16, ptr %31, align 2, !dbg !1637
  %33 = load ptr, ptr %4, align 8, !dbg !1640
  %34 = load i32, ptr %7, align 4, !dbg !1641
  %35 = sext i32 %34 to i64, !dbg !1640
  %36 = getelementptr inbounds i16, ptr %33, i64 %35, !dbg !1640
  store i16 %32, ptr %36, align 2, !dbg !1642
  br label %19, !dbg !1643, !llvm.loop !1644

37:                                               ; preds = %19
  ret void, !dbg !1646
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z24create_all_vertnum_listsPiS_ii(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 !dbg !1647 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
    #dbg_declare(ptr %5, !1650, !DIExpression(), !1651)
  store ptr %1, ptr %6, align 8
    #dbg_declare(ptr %6, !1652, !DIExpression(), !1653)
  store i32 %2, ptr %7, align 4
    #dbg_declare(ptr %7, !1654, !DIExpression(), !1655)
  store i32 %3, ptr %8, align 4
    #dbg_declare(ptr %8, !1656, !DIExpression(), !1657)
    #dbg_declare(ptr %9, !1658, !DIExpression(), !1659)
  %10 = load i32, ptr %7, align 4, !dbg !1660
  %11 = sext i32 %10 to i64, !dbg !1661
  %12 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %11, !dbg !1661
  %13 = getelementptr inbounds nuw %struct.segment, ptr %12, i32 0, i32 0, !dbg !1662
  %14 = load i32, ptr %8, align 4, !dbg !1663
  %15 = sext i32 %14 to i64, !dbg !1661
  %16 = getelementptr inbounds [6 x %struct.side], ptr %13, i64 0, i64 %15, !dbg !1661
  store ptr %16, ptr %9, align 8, !dbg !1659
  %17 = load i32, ptr %7, align 4, !dbg !1664
  %18 = load i32, ptr @Highest_segment_index, align 4, !dbg !1664
  %19 = icmp sle i32 %17, %18, !dbg !1664
  br i1 %19, label %20, label %23, !dbg !1664

20:                                               ; preds = %4
  %21 = load i32, ptr %7, align 4, !dbg !1664
  %22 = icmp sge i32 %21, 0, !dbg !1664
  br label %23

23:                                               ; preds = %20, %4
  %24 = phi i1 [ false, %4 ], [ %22, %20 ], !dbg !1665
  %25 = zext i1 %24 to i32, !dbg !1664
  call void @_Z7_AssertiPKcS0_i(i32 noundef %25, ptr noundef @.str.1, ptr noundef @.str.2, i32 noundef 281), !dbg !1664
  %26 = load ptr, ptr %9, align 8, !dbg !1666
  %27 = getelementptr inbounds nuw %struct.side, ptr %26, i32 0, i32 0, !dbg !1667
  %28 = load i8, ptr %27, align 4, !dbg !1667
  %29 = sext i8 %28 to i32, !dbg !1666
  switch i32 %29, label %68 [
    i32 1, label %30
    i32 2, label %40
    i32 3, label %54
  ], !dbg !1668

30:                                               ; preds = %23
  %31 = load ptr, ptr %6, align 8, !dbg !1669
  %32 = getelementptr inbounds i32, ptr %31, i64 0, !dbg !1669
  store i32 0, ptr %32, align 4, !dbg !1671
  %33 = load ptr, ptr %6, align 8, !dbg !1672
  %34 = getelementptr inbounds i32, ptr %33, i64 1, !dbg !1672
  store i32 1, ptr %34, align 4, !dbg !1673
  %35 = load ptr, ptr %6, align 8, !dbg !1674
  %36 = getelementptr inbounds i32, ptr %35, i64 2, !dbg !1674
  store i32 2, ptr %36, align 4, !dbg !1675
  %37 = load ptr, ptr %6, align 8, !dbg !1676
  %38 = getelementptr inbounds i32, ptr %37, i64 3, !dbg !1676
  store i32 3, ptr %38, align 4, !dbg !1677
  %39 = load ptr, ptr %5, align 8, !dbg !1678
  store i32 1, ptr %39, align 4, !dbg !1679
  br label %75, !dbg !1680

40:                                               ; preds = %23
  %41 = load ptr, ptr %5, align 8, !dbg !1681
  store i32 2, ptr %41, align 4, !dbg !1682
  %42 = load ptr, ptr %6, align 8, !dbg !1683
  %43 = getelementptr inbounds i32, ptr %42, i64 0, !dbg !1683
  store i32 0, ptr %43, align 4, !dbg !1684
  %44 = load ptr, ptr %6, align 8, !dbg !1685
  %45 = getelementptr inbounds i32, ptr %44, i64 1, !dbg !1685
  store i32 1, ptr %45, align 4, !dbg !1686
  %46 = load ptr, ptr %6, align 8, !dbg !1687
  %47 = getelementptr inbounds i32, ptr %46, i64 2, !dbg !1687
  store i32 2, ptr %47, align 4, !dbg !1688
  %48 = load ptr, ptr %6, align 8, !dbg !1689
  %49 = getelementptr inbounds i32, ptr %48, i64 3, !dbg !1689
  store i32 2, ptr %49, align 4, !dbg !1690
  %50 = load ptr, ptr %6, align 8, !dbg !1691
  %51 = getelementptr inbounds i32, ptr %50, i64 4, !dbg !1691
  store i32 3, ptr %51, align 4, !dbg !1692
  %52 = load ptr, ptr %6, align 8, !dbg !1693
  %53 = getelementptr inbounds i32, ptr %52, i64 5, !dbg !1693
  store i32 0, ptr %53, align 4, !dbg !1694
  br label %75, !dbg !1695

54:                                               ; preds = %23
  %55 = load ptr, ptr %5, align 8, !dbg !1696
  store i32 2, ptr %55, align 4, !dbg !1697
  %56 = load ptr, ptr %6, align 8, !dbg !1698
  %57 = getelementptr inbounds i32, ptr %56, i64 0, !dbg !1698
  store i32 3, ptr %57, align 4, !dbg !1699
  %58 = load ptr, ptr %6, align 8, !dbg !1700
  %59 = getelementptr inbounds i32, ptr %58, i64 1, !dbg !1700
  store i32 0, ptr %59, align 4, !dbg !1701
  %60 = load ptr, ptr %6, align 8, !dbg !1702
  %61 = getelementptr inbounds i32, ptr %60, i64 2, !dbg !1702
  store i32 1, ptr %61, align 4, !dbg !1703
  %62 = load ptr, ptr %6, align 8, !dbg !1704
  %63 = getelementptr inbounds i32, ptr %62, i64 3, !dbg !1704
  store i32 1, ptr %63, align 4, !dbg !1705
  %64 = load ptr, ptr %6, align 8, !dbg !1706
  %65 = getelementptr inbounds i32, ptr %64, i64 4, !dbg !1706
  store i32 2, ptr %65, align 4, !dbg !1707
  %66 = load ptr, ptr %6, align 8, !dbg !1708
  %67 = getelementptr inbounds i32, ptr %66, i64 5, !dbg !1708
  store i32 3, ptr %67, align 4, !dbg !1709
  br label %75, !dbg !1710

68:                                               ; preds = %23
  %69 = load ptr, ptr %9, align 8, !dbg !1711
  %70 = getelementptr inbounds nuw %struct.side, ptr %69, i32 0, i32 0, !dbg !1712
  %71 = load i8, ptr %70, align 4, !dbg !1712
  %72 = sext i8 %71 to i32, !dbg !1711
  %73 = load i32, ptr %7, align 4, !dbg !1713
  %74 = load i32, ptr %8, align 4, !dbg !1714
  call void (ptr, ...) @_Z5ErrorPKcz(ptr noundef @.str.3, i32 noundef %72, i32 noundef %73, i32 noundef %74), !dbg !1715
  br label %75, !dbg !1716

75:                                               ; preds = %68, %54, %40, %30
  ret void, !dbg !1717
}

declare void @_Z7_AssertiPKcS0_i(i32 noundef, ptr noundef, ptr noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z23create_abs_vertex_listsPiS_ii(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 !dbg !1718 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
    #dbg_declare(ptr %5, !1719, !DIExpression(), !1720)
  store ptr %1, ptr %6, align 8
    #dbg_declare(ptr %6, !1721, !DIExpression(), !1722)
  store i32 %2, ptr %7, align 4
    #dbg_declare(ptr %7, !1723, !DIExpression(), !1724)
  store i32 %3, ptr %8, align 4
    #dbg_declare(ptr %8, !1725, !DIExpression(), !1726)
    #dbg_declare(ptr %9, !1727, !DIExpression(), !1728)
  %12 = load i32, ptr %7, align 4, !dbg !1729
  %13 = sext i32 %12 to i64, !dbg !1730
  %14 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %13, !dbg !1730
  %15 = getelementptr inbounds nuw %struct.segment, ptr %14, i32 0, i32 2, !dbg !1731
  %16 = getelementptr inbounds [8 x i16], ptr %15, i64 0, i64 0, !dbg !1730
  store ptr %16, ptr %9, align 8, !dbg !1728
    #dbg_declare(ptr %10, !1732, !DIExpression(), !1733)
  %17 = load i32, ptr %7, align 4, !dbg !1734
  %18 = sext i32 %17 to i64, !dbg !1735
  %19 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %18, !dbg !1735
  %20 = getelementptr inbounds nuw %struct.segment, ptr %19, i32 0, i32 0, !dbg !1736
  %21 = load i32, ptr %8, align 4, !dbg !1737
  %22 = sext i32 %21 to i64, !dbg !1735
  %23 = getelementptr inbounds [6 x %struct.side], ptr %20, i64 0, i64 %22, !dbg !1735
  store ptr %23, ptr %10, align 8, !dbg !1733
    #dbg_declare(ptr %11, !1738, !DIExpression(), !1739)
  %24 = load i32, ptr %8, align 4, !dbg !1740
  %25 = sext i32 %24 to i64, !dbg !1741
  %26 = getelementptr inbounds [6 x [4 x i32]], ptr @Side_to_verts_int, i64 0, i64 %25, !dbg !1741
  %27 = getelementptr inbounds [4 x i32], ptr %26, i64 0, i64 0, !dbg !1741
  store ptr %27, ptr %11, align 8, !dbg !1739
  %28 = load i32, ptr %7, align 4, !dbg !1742
  %29 = load i32, ptr @Highest_segment_index, align 4, !dbg !1742
  %30 = icmp sle i32 %28, %29, !dbg !1742
  br i1 %30, label %31, label %34, !dbg !1742

31:                                               ; preds = %4
  %32 = load i32, ptr %7, align 4, !dbg !1742
  %33 = icmp sge i32 %32, 0, !dbg !1742
  br label %34

34:                                               ; preds = %31, %4
  %35 = phi i1 [ false, %4 ], [ %33, %31 ], !dbg !1743
  %36 = zext i1 %35 to i32, !dbg !1742
  call void @_Z7_AssertiPKcS0_i(i32 noundef %36, ptr noundef @.str.1, ptr noundef @.str.2, i32 noundef 354), !dbg !1742
  %37 = load ptr, ptr %10, align 8, !dbg !1744
  %38 = getelementptr inbounds nuw %struct.side, ptr %37, i32 0, i32 0, !dbg !1745
  %39 = load i8, ptr %38, align 4, !dbg !1745
  %40 = sext i8 %39 to i32, !dbg !1744
  switch i32 %40, label %207 [
    i32 1, label %41
    i32 2, label %83
    i32 3, label %145
  ], !dbg !1746

41:                                               ; preds = %34
  %42 = load ptr, ptr %9, align 8, !dbg !1747
  %43 = load ptr, ptr %11, align 8, !dbg !1749
  %44 = getelementptr inbounds i32, ptr %43, i64 0, !dbg !1749
  %45 = load i32, ptr %44, align 4, !dbg !1749
  %46 = sext i32 %45 to i64, !dbg !1747
  %47 = getelementptr inbounds i16, ptr %42, i64 %46, !dbg !1747
  %48 = load i16, ptr %47, align 2, !dbg !1747
  %49 = sext i16 %48 to i32, !dbg !1747
  %50 = load ptr, ptr %6, align 8, !dbg !1750
  %51 = getelementptr inbounds i32, ptr %50, i64 0, !dbg !1750
  store i32 %49, ptr %51, align 4, !dbg !1751
  %52 = load ptr, ptr %9, align 8, !dbg !1752
  %53 = load ptr, ptr %11, align 8, !dbg !1753
  %54 = getelementptr inbounds i32, ptr %53, i64 1, !dbg !1753
  %55 = load i32, ptr %54, align 4, !dbg !1753
  %56 = sext i32 %55 to i64, !dbg !1752
  %57 = getelementptr inbounds i16, ptr %52, i64 %56, !dbg !1752
  %58 = load i16, ptr %57, align 2, !dbg !1752
  %59 = sext i16 %58 to i32, !dbg !1752
  %60 = load ptr, ptr %6, align 8, !dbg !1754
  %61 = getelementptr inbounds i32, ptr %60, i64 1, !dbg !1754
  store i32 %59, ptr %61, align 4, !dbg !1755
  %62 = load ptr, ptr %9, align 8, !dbg !1756
  %63 = load ptr, ptr %11, align 8, !dbg !1757
  %64 = getelementptr inbounds i32, ptr %63, i64 2, !dbg !1757
  %65 = load i32, ptr %64, align 4, !dbg !1757
  %66 = sext i32 %65 to i64, !dbg !1756
  %67 = getelementptr inbounds i16, ptr %62, i64 %66, !dbg !1756
  %68 = load i16, ptr %67, align 2, !dbg !1756
  %69 = sext i16 %68 to i32, !dbg !1756
  %70 = load ptr, ptr %6, align 8, !dbg !1758
  %71 = getelementptr inbounds i32, ptr %70, i64 2, !dbg !1758
  store i32 %69, ptr %71, align 4, !dbg !1759
  %72 = load ptr, ptr %9, align 8, !dbg !1760
  %73 = load ptr, ptr %11, align 8, !dbg !1761
  %74 = getelementptr inbounds i32, ptr %73, i64 3, !dbg !1761
  %75 = load i32, ptr %74, align 4, !dbg !1761
  %76 = sext i32 %75 to i64, !dbg !1760
  %77 = getelementptr inbounds i16, ptr %72, i64 %76, !dbg !1760
  %78 = load i16, ptr %77, align 2, !dbg !1760
  %79 = sext i16 %78 to i32, !dbg !1760
  %80 = load ptr, ptr %6, align 8, !dbg !1762
  %81 = getelementptr inbounds i32, ptr %80, i64 3, !dbg !1762
  store i32 %79, ptr %81, align 4, !dbg !1763
  %82 = load ptr, ptr %5, align 8, !dbg !1764
  store i32 1, ptr %82, align 4, !dbg !1765
  br label %214, !dbg !1766

83:                                               ; preds = %34
  %84 = load ptr, ptr %5, align 8, !dbg !1767
  store i32 2, ptr %84, align 4, !dbg !1768
  %85 = load ptr, ptr %9, align 8, !dbg !1769
  %86 = load ptr, ptr %11, align 8, !dbg !1770
  %87 = getelementptr inbounds i32, ptr %86, i64 0, !dbg !1770
  %88 = load i32, ptr %87, align 4, !dbg !1770
  %89 = sext i32 %88 to i64, !dbg !1769
  %90 = getelementptr inbounds i16, ptr %85, i64 %89, !dbg !1769
  %91 = load i16, ptr %90, align 2, !dbg !1769
  %92 = sext i16 %91 to i32, !dbg !1769
  %93 = load ptr, ptr %6, align 8, !dbg !1771
  %94 = getelementptr inbounds i32, ptr %93, i64 0, !dbg !1771
  store i32 %92, ptr %94, align 4, !dbg !1772
  %95 = load ptr, ptr %9, align 8, !dbg !1773
  %96 = load ptr, ptr %11, align 8, !dbg !1774
  %97 = getelementptr inbounds i32, ptr %96, i64 1, !dbg !1774
  %98 = load i32, ptr %97, align 4, !dbg !1774
  %99 = sext i32 %98 to i64, !dbg !1773
  %100 = getelementptr inbounds i16, ptr %95, i64 %99, !dbg !1773
  %101 = load i16, ptr %100, align 2, !dbg !1773
  %102 = sext i16 %101 to i32, !dbg !1773
  %103 = load ptr, ptr %6, align 8, !dbg !1775
  %104 = getelementptr inbounds i32, ptr %103, i64 1, !dbg !1775
  store i32 %102, ptr %104, align 4, !dbg !1776
  %105 = load ptr, ptr %9, align 8, !dbg !1777
  %106 = load ptr, ptr %11, align 8, !dbg !1778
  %107 = getelementptr inbounds i32, ptr %106, i64 2, !dbg !1778
  %108 = load i32, ptr %107, align 4, !dbg !1778
  %109 = sext i32 %108 to i64, !dbg !1777
  %110 = getelementptr inbounds i16, ptr %105, i64 %109, !dbg !1777
  %111 = load i16, ptr %110, align 2, !dbg !1777
  %112 = sext i16 %111 to i32, !dbg !1777
  %113 = load ptr, ptr %6, align 8, !dbg !1779
  %114 = getelementptr inbounds i32, ptr %113, i64 2, !dbg !1779
  store i32 %112, ptr %114, align 4, !dbg !1780
  %115 = load ptr, ptr %9, align 8, !dbg !1781
  %116 = load ptr, ptr %11, align 8, !dbg !1782
  %117 = getelementptr inbounds i32, ptr %116, i64 2, !dbg !1782
  %118 = load i32, ptr %117, align 4, !dbg !1782
  %119 = sext i32 %118 to i64, !dbg !1781
  %120 = getelementptr inbounds i16, ptr %115, i64 %119, !dbg !1781
  %121 = load i16, ptr %120, align 2, !dbg !1781
  %122 = sext i16 %121 to i32, !dbg !1781
  %123 = load ptr, ptr %6, align 8, !dbg !1783
  %124 = getelementptr inbounds i32, ptr %123, i64 3, !dbg !1783
  store i32 %122, ptr %124, align 4, !dbg !1784
  %125 = load ptr, ptr %9, align 8, !dbg !1785
  %126 = load ptr, ptr %11, align 8, !dbg !1786
  %127 = getelementptr inbounds i32, ptr %126, i64 3, !dbg !1786
  %128 = load i32, ptr %127, align 4, !dbg !1786
  %129 = sext i32 %128 to i64, !dbg !1785
  %130 = getelementptr inbounds i16, ptr %125, i64 %129, !dbg !1785
  %131 = load i16, ptr %130, align 2, !dbg !1785
  %132 = sext i16 %131 to i32, !dbg !1785
  %133 = load ptr, ptr %6, align 8, !dbg !1787
  %134 = getelementptr inbounds i32, ptr %133, i64 4, !dbg !1787
  store i32 %132, ptr %134, align 4, !dbg !1788
  %135 = load ptr, ptr %9, align 8, !dbg !1789
  %136 = load ptr, ptr %11, align 8, !dbg !1790
  %137 = getelementptr inbounds i32, ptr %136, i64 0, !dbg !1790
  %138 = load i32, ptr %137, align 4, !dbg !1790
  %139 = sext i32 %138 to i64, !dbg !1789
  %140 = getelementptr inbounds i16, ptr %135, i64 %139, !dbg !1789
  %141 = load i16, ptr %140, align 2, !dbg !1789
  %142 = sext i16 %141 to i32, !dbg !1789
  %143 = load ptr, ptr %6, align 8, !dbg !1791
  %144 = getelementptr inbounds i32, ptr %143, i64 5, !dbg !1791
  store i32 %142, ptr %144, align 4, !dbg !1792
  br label %214, !dbg !1793

145:                                              ; preds = %34
  %146 = load ptr, ptr %5, align 8, !dbg !1794
  store i32 2, ptr %146, align 4, !dbg !1795
  %147 = load ptr, ptr %9, align 8, !dbg !1796
  %148 = load ptr, ptr %11, align 8, !dbg !1797
  %149 = getelementptr inbounds i32, ptr %148, i64 3, !dbg !1797
  %150 = load i32, ptr %149, align 4, !dbg !1797
  %151 = sext i32 %150 to i64, !dbg !1796
  %152 = getelementptr inbounds i16, ptr %147, i64 %151, !dbg !1796
  %153 = load i16, ptr %152, align 2, !dbg !1796
  %154 = sext i16 %153 to i32, !dbg !1796
  %155 = load ptr, ptr %6, align 8, !dbg !1798
  %156 = getelementptr inbounds i32, ptr %155, i64 0, !dbg !1798
  store i32 %154, ptr %156, align 4, !dbg !1799
  %157 = load ptr, ptr %9, align 8, !dbg !1800
  %158 = load ptr, ptr %11, align 8, !dbg !1801
  %159 = getelementptr inbounds i32, ptr %158, i64 0, !dbg !1801
  %160 = load i32, ptr %159, align 4, !dbg !1801
  %161 = sext i32 %160 to i64, !dbg !1800
  %162 = getelementptr inbounds i16, ptr %157, i64 %161, !dbg !1800
  %163 = load i16, ptr %162, align 2, !dbg !1800
  %164 = sext i16 %163 to i32, !dbg !1800
  %165 = load ptr, ptr %6, align 8, !dbg !1802
  %166 = getelementptr inbounds i32, ptr %165, i64 1, !dbg !1802
  store i32 %164, ptr %166, align 4, !dbg !1803
  %167 = load ptr, ptr %9, align 8, !dbg !1804
  %168 = load ptr, ptr %11, align 8, !dbg !1805
  %169 = getelementptr inbounds i32, ptr %168, i64 1, !dbg !1805
  %170 = load i32, ptr %169, align 4, !dbg !1805
  %171 = sext i32 %170 to i64, !dbg !1804
  %172 = getelementptr inbounds i16, ptr %167, i64 %171, !dbg !1804
  %173 = load i16, ptr %172, align 2, !dbg !1804
  %174 = sext i16 %173 to i32, !dbg !1804
  %175 = load ptr, ptr %6, align 8, !dbg !1806
  %176 = getelementptr inbounds i32, ptr %175, i64 2, !dbg !1806
  store i32 %174, ptr %176, align 4, !dbg !1807
  %177 = load ptr, ptr %9, align 8, !dbg !1808
  %178 = load ptr, ptr %11, align 8, !dbg !1809
  %179 = getelementptr inbounds i32, ptr %178, i64 1, !dbg !1809
  %180 = load i32, ptr %179, align 4, !dbg !1809
  %181 = sext i32 %180 to i64, !dbg !1808
  %182 = getelementptr inbounds i16, ptr %177, i64 %181, !dbg !1808
  %183 = load i16, ptr %182, align 2, !dbg !1808
  %184 = sext i16 %183 to i32, !dbg !1808
  %185 = load ptr, ptr %6, align 8, !dbg !1810
  %186 = getelementptr inbounds i32, ptr %185, i64 3, !dbg !1810
  store i32 %184, ptr %186, align 4, !dbg !1811
  %187 = load ptr, ptr %9, align 8, !dbg !1812
  %188 = load ptr, ptr %11, align 8, !dbg !1813
  %189 = getelementptr inbounds i32, ptr %188, i64 2, !dbg !1813
  %190 = load i32, ptr %189, align 4, !dbg !1813
  %191 = sext i32 %190 to i64, !dbg !1812
  %192 = getelementptr inbounds i16, ptr %187, i64 %191, !dbg !1812
  %193 = load i16, ptr %192, align 2, !dbg !1812
  %194 = sext i16 %193 to i32, !dbg !1812
  %195 = load ptr, ptr %6, align 8, !dbg !1814
  %196 = getelementptr inbounds i32, ptr %195, i64 4, !dbg !1814
  store i32 %194, ptr %196, align 4, !dbg !1815
  %197 = load ptr, ptr %9, align 8, !dbg !1816
  %198 = load ptr, ptr %11, align 8, !dbg !1817
  %199 = getelementptr inbounds i32, ptr %198, i64 3, !dbg !1817
  %200 = load i32, ptr %199, align 4, !dbg !1817
  %201 = sext i32 %200 to i64, !dbg !1816
  %202 = getelementptr inbounds i16, ptr %197, i64 %201, !dbg !1816
  %203 = load i16, ptr %202, align 2, !dbg !1816
  %204 = sext i16 %203 to i32, !dbg !1816
  %205 = load ptr, ptr %6, align 8, !dbg !1818
  %206 = getelementptr inbounds i32, ptr %205, i64 5, !dbg !1818
  store i32 %204, ptr %206, align 4, !dbg !1819
  br label %214, !dbg !1820

207:                                              ; preds = %34
  %208 = load ptr, ptr %10, align 8, !dbg !1821
  %209 = getelementptr inbounds nuw %struct.side, ptr %208, i32 0, i32 0, !dbg !1822
  %210 = load i8, ptr %209, align 4, !dbg !1822
  %211 = sext i8 %210 to i32, !dbg !1821
  %212 = load i32, ptr %7, align 4, !dbg !1823
  %213 = load i32, ptr %8, align 4, !dbg !1824
  call void (ptr, ...) @_Z5ErrorPKcz(ptr noundef @.str.4, i32 noundef %211, i32 noundef %212, i32 noundef %213), !dbg !1825
  br label %214, !dbg !1826

214:                                              ; preds = %207, %145, %83, %41
  ret void, !dbg !1827
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define i32 @_Z13get_seg_masksP10vms_vectorii(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 !dbg !1828 {
  %4 = alloca %struct.segmasks, align 2
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca [6 x i32], align 4
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
    #dbg_declare(ptr %5, !1838, !DIExpression(), !1839)
  store i32 %1, ptr %6, align 4
    #dbg_declare(ptr %6, !1840, !DIExpression(), !1841)
  store i32 %2, ptr %7, align 4
    #dbg_declare(ptr %7, !1842, !DIExpression(), !1843)
  %23 = load i32, ptr %6, align 4, !dbg !1844
  %24 = icmp eq i32 %23, -1, !dbg !1846
  br i1 %24, label %25, label %26, !dbg !1846

25:                                               ; preds = %3
  call void (ptr, ...) @_Z5ErrorPKcz(ptr noundef @.str.5), !dbg !1847
  br label %26, !dbg !1847

26:                                               ; preds = %25, %3
    #dbg_declare(ptr %8, !1848, !DIExpression(), !1849)
    #dbg_declare(ptr %9, !1850, !DIExpression(), !1851)
    #dbg_declare(ptr %10, !1852, !DIExpression(), !1853)
    #dbg_declare(ptr %4, !1854, !DIExpression(), !1855)
    #dbg_declare(ptr %11, !1856, !DIExpression(), !1857)
    #dbg_declare(ptr %12, !1858, !DIExpression(), !1860)
    #dbg_declare(ptr %13, !1861, !DIExpression(), !1862)
  %27 = load i32, ptr %6, align 4, !dbg !1863
  %28 = load i32, ptr @Highest_segment_index, align 4, !dbg !1863
  %29 = icmp sle i32 %27, %28, !dbg !1863
  br i1 %29, label %30, label %33, !dbg !1863

30:                                               ; preds = %26
  %31 = load i32, ptr %6, align 4, !dbg !1863
  %32 = icmp sge i32 %31, 0, !dbg !1863
  br label %33

33:                                               ; preds = %30, %26
  %34 = phi i1 [ false, %26 ], [ %32, %30 ], !dbg !1864
  %35 = zext i1 %34 to i32, !dbg !1863
  call void @_Z7_AssertiPKcS0_i(i32 noundef %35, ptr noundef @.str.1, ptr noundef @.str.2, i32 noundef 454), !dbg !1863
  %36 = load i32, ptr %6, align 4, !dbg !1865
  %37 = sext i32 %36 to i64, !dbg !1866
  %38 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %37, !dbg !1866
  store ptr %38, ptr %13, align 8, !dbg !1867
  %39 = getelementptr inbounds nuw %struct.segmasks, ptr %4, i32 0, i32 2, !dbg !1868
  store i8 0, ptr %39, align 1, !dbg !1869
  %40 = getelementptr inbounds nuw %struct.segmasks, ptr %4, i32 0, i32 0, !dbg !1870
  store i16 0, ptr %40, align 2, !dbg !1871
  %41 = getelementptr inbounds nuw %struct.segmasks, ptr %4, i32 0, i32 1, !dbg !1872
  store i8 0, ptr %41, align 2, !dbg !1873
  store i32 0, ptr %8, align 4, !dbg !1874
  store i32 1, ptr %10, align 4, !dbg !1876
  store i32 1, ptr %9, align 4, !dbg !1877
  br label %42, !dbg !1878

42:                                               ; preds = %241, %33
  %43 = load i32, ptr %8, align 4, !dbg !1879
  %44 = icmp slt i32 %43, 6, !dbg !1881
  br i1 %44, label %45, label %246, !dbg !1882

45:                                               ; preds = %42
    #dbg_declare(ptr %14, !1883, !DIExpression(), !1885)
  %46 = load ptr, ptr %13, align 8, !dbg !1886
  %47 = getelementptr inbounds nuw %struct.segment, ptr %46, i32 0, i32 0, !dbg !1887
  %48 = load i32, ptr %8, align 4, !dbg !1888
  %49 = sext i32 %48 to i64, !dbg !1886
  %50 = getelementptr inbounds [6 x %struct.side], ptr %47, i64 0, i64 %49, !dbg !1886
  store ptr %50, ptr %14, align 8, !dbg !1885
    #dbg_declare(ptr %15, !1889, !DIExpression(), !1890)
    #dbg_declare(ptr %16, !1891, !DIExpression(), !1892)
    #dbg_declare(ptr %17, !1893, !DIExpression(), !1894)
  %51 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 0, !dbg !1895
  %52 = load i32, ptr %6, align 4, !dbg !1896
  %53 = load i32, ptr %8, align 4, !dbg !1897
  call void @_Z23create_abs_vertex_listsPiS_ii(ptr noundef %11, ptr noundef %51, i32 noundef %52, i32 noundef %53), !dbg !1898
  %54 = load i32, ptr %11, align 4, !dbg !1899
  %55 = icmp eq i32 %54, 2, !dbg !1901
  br i1 %55, label %56, label %179, !dbg !1901

56:                                               ; preds = %45
    #dbg_declare(ptr %18, !1902, !DIExpression(), !1904)
    #dbg_declare(ptr %19, !1905, !DIExpression(), !1906)
    #dbg_declare(ptr %20, !1907, !DIExpression(), !1908)
  %57 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 0, !dbg !1909
  %58 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 2, !dbg !1910
  %59 = call noundef nonnull align 4 dereferenceable(4) ptr @_ZNSt3__13minB8ne200100IiEERKT_S3_S3_(ptr noundef nonnull align 4 dereferenceable(4) %57, ptr noundef nonnull align 4 dereferenceable(4) %58), !dbg !1911
  %60 = load i32, ptr %59, align 4, !dbg !1911
  store i32 %60, ptr %16, align 4, !dbg !1912
  %61 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 4, !dbg !1913
  %62 = load i32, ptr %61, align 4, !dbg !1913
  %63 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 1, !dbg !1915
  %64 = load i32, ptr %63, align 4, !dbg !1915
  %65 = icmp slt i32 %62, %64, !dbg !1916
  br i1 %65, label %66, label %78, !dbg !1916

66:                                               ; preds = %56
  %67 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 4, !dbg !1917
  %68 = load i32, ptr %67, align 4, !dbg !1917
  %69 = sext i32 %68 to i64, !dbg !1918
  %70 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %69, !dbg !1918
  %71 = load ptr, ptr %14, align 8, !dbg !1919
  %72 = getelementptr inbounds nuw %struct.side, ptr %71, i32 0, i32 6, !dbg !1920
  %73 = getelementptr inbounds [2 x %struct.vms_vector], ptr %72, i64 0, i64 0, !dbg !1919
  %74 = load i32, ptr %16, align 4, !dbg !1921
  %75 = sext i32 %74 to i64, !dbg !1922
  %76 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %75, !dbg !1922
  %77 = call noundef i32 @_Z16vm_dist_to_planeP10vms_vectorS0_S0_(ptr noundef %70, ptr noundef %73, ptr noundef %76), !dbg !1923
  store i32 %77, ptr %18, align 4, !dbg !1924
  br label %90, !dbg !1925

78:                                               ; preds = %56
  %79 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 1, !dbg !1926
  %80 = load i32, ptr %79, align 4, !dbg !1926
  %81 = sext i32 %80 to i64, !dbg !1927
  %82 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %81, !dbg !1927
  %83 = load ptr, ptr %14, align 8, !dbg !1928
  %84 = getelementptr inbounds nuw %struct.side, ptr %83, i32 0, i32 6, !dbg !1929
  %85 = getelementptr inbounds [2 x %struct.vms_vector], ptr %84, i64 0, i64 1, !dbg !1928
  %86 = load i32, ptr %16, align 4, !dbg !1930
  %87 = sext i32 %86 to i64, !dbg !1931
  %88 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %87, !dbg !1931
  %89 = call noundef i32 @_Z16vm_dist_to_planeP10vms_vectorS0_S0_(ptr noundef %82, ptr noundef %85, ptr noundef %88), !dbg !1932
  store i32 %89, ptr %18, align 4, !dbg !1933
  br label %90

90:                                               ; preds = %78, %66
  %91 = load i32, ptr %18, align 4, !dbg !1934
  %92 = icmp sgt i32 %91, 250, !dbg !1935
  %93 = zext i1 %92 to i32, !dbg !1936
  store i32 %93, ptr %15, align 4, !dbg !1937
  store i32 0, ptr %20, align 4, !dbg !1938
  store i32 0, ptr %19, align 4, !dbg !1939
  store i32 0, ptr %17, align 4, !dbg !1940
  br label %94, !dbg !1942

94:                                               ; preds = %128, %90
  %95 = load i32, ptr %17, align 4, !dbg !1943
  %96 = icmp slt i32 %95, 2, !dbg !1945
  br i1 %96, label %97, label %133, !dbg !1946

97:                                               ; preds = %94
  %98 = load ptr, ptr %5, align 8, !dbg !1947
  %99 = load ptr, ptr %14, align 8, !dbg !1949
  %100 = getelementptr inbounds nuw %struct.side, ptr %99, i32 0, i32 6, !dbg !1950
  %101 = load i32, ptr %17, align 4, !dbg !1951
  %102 = sext i32 %101 to i64, !dbg !1949
  %103 = getelementptr inbounds [2 x %struct.vms_vector], ptr %100, i64 0, i64 %102, !dbg !1949
  %104 = load i32, ptr %16, align 4, !dbg !1952
  %105 = sext i32 %104 to i64, !dbg !1953
  %106 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %105, !dbg !1953
  %107 = call noundef i32 @_Z16vm_dist_to_planeP10vms_vectorS0_S0_(ptr noundef %98, ptr noundef %103, ptr noundef %106), !dbg !1954
  store i32 %107, ptr %18, align 4, !dbg !1955
  %108 = load i32, ptr %18, align 4, !dbg !1956
  %109 = icmp slt i32 %108, -250, !dbg !1958
  br i1 %109, label %110, label %113, !dbg !1958

110:                                              ; preds = %97
  %111 = load i32, ptr %20, align 4, !dbg !1959
  %112 = add nsw i32 %111, 1, !dbg !1959
  store i32 %112, ptr %20, align 4, !dbg !1959
  br label %113, !dbg !1960

113:                                              ; preds = %110, %97
  %114 = load i32, ptr %18, align 4, !dbg !1961
  %115 = load i32, ptr %7, align 4, !dbg !1963
  %116 = sub nsw i32 %114, %115, !dbg !1964
  %117 = icmp slt i32 %116, -250, !dbg !1965
  br i1 %117, label %118, label %127, !dbg !1965

118:                                              ; preds = %113
  %119 = load i32, ptr %9, align 4, !dbg !1966
  %120 = getelementptr inbounds nuw %struct.segmasks, ptr %4, i32 0, i32 0, !dbg !1968
  %121 = load i16, ptr %120, align 2, !dbg !1969
  %122 = sext i16 %121 to i32, !dbg !1969
  %123 = or i32 %122, %119, !dbg !1969
  %124 = trunc i32 %123 to i16, !dbg !1969
  store i16 %124, ptr %120, align 2, !dbg !1969
  %125 = load i32, ptr %19, align 4, !dbg !1970
  %126 = add nsw i32 %125, 1, !dbg !1970
  store i32 %126, ptr %19, align 4, !dbg !1970
  br label %127, !dbg !1971

127:                                              ; preds = %118, %113
  br label %128, !dbg !1972

128:                                              ; preds = %127
  %129 = load i32, ptr %17, align 4, !dbg !1973
  %130 = add nsw i32 %129, 1, !dbg !1973
  store i32 %130, ptr %17, align 4, !dbg !1973
  %131 = load i32, ptr %9, align 4, !dbg !1974
  %132 = shl i32 %131, 1, !dbg !1974
  store i32 %132, ptr %9, align 4, !dbg !1974
  br label %94, !dbg !1975, !llvm.loop !1976

133:                                              ; preds = %94
  %134 = load i32, ptr %15, align 4, !dbg !1978
  %135 = icmp ne i32 %134, 0, !dbg !1978
  br i1 %135, label %157, label %136, !dbg !1980

136:                                              ; preds = %133
  %137 = load i32, ptr %19, align 4, !dbg !1981
  %138 = icmp eq i32 %137, 2, !dbg !1984
  br i1 %138, label %139, label %146, !dbg !1984

139:                                              ; preds = %136
  %140 = load i32, ptr %10, align 4, !dbg !1985
  %141 = getelementptr inbounds nuw %struct.segmasks, ptr %4, i32 0, i32 1, !dbg !1986
  %142 = load i8, ptr %141, align 2, !dbg !1987
  %143 = sext i8 %142 to i32, !dbg !1987
  %144 = or i32 %143, %140, !dbg !1987
  %145 = trunc i32 %144 to i8, !dbg !1987
  store i8 %145, ptr %141, align 2, !dbg !1987
  br label %146, !dbg !1988

146:                                              ; preds = %139, %136
  %147 = load i32, ptr %20, align 4, !dbg !1989
  %148 = icmp eq i32 %147, 2, !dbg !1991
  br i1 %148, label %149, label %156, !dbg !1991

149:                                              ; preds = %146
  %150 = load i32, ptr %10, align 4, !dbg !1992
  %151 = getelementptr inbounds nuw %struct.segmasks, ptr %4, i32 0, i32 2, !dbg !1993
  %152 = load i8, ptr %151, align 1, !dbg !1994
  %153 = sext i8 %152 to i32, !dbg !1994
  %154 = or i32 %153, %150, !dbg !1994
  %155 = trunc i32 %154 to i8, !dbg !1994
  store i8 %155, ptr %151, align 1, !dbg !1994
  br label %156, !dbg !1995

156:                                              ; preds = %149, %146
  br label %178, !dbg !1996

157:                                              ; preds = %133
  %158 = load i32, ptr %19, align 4, !dbg !1997
  %159 = icmp ne i32 %158, 0, !dbg !1997
  br i1 %159, label %160, label %167, !dbg !1997

160:                                              ; preds = %157
  %161 = load i32, ptr %10, align 4, !dbg !2000
  %162 = getelementptr inbounds nuw %struct.segmasks, ptr %4, i32 0, i32 1, !dbg !2001
  %163 = load i8, ptr %162, align 2, !dbg !2002
  %164 = sext i8 %163 to i32, !dbg !2002
  %165 = or i32 %164, %161, !dbg !2002
  %166 = trunc i32 %165 to i8, !dbg !2002
  store i8 %166, ptr %162, align 2, !dbg !2002
  br label %167, !dbg !2003

167:                                              ; preds = %160, %157
  %168 = load i32, ptr %20, align 4, !dbg !2004
  %169 = icmp ne i32 %168, 0, !dbg !2004
  br i1 %169, label %170, label %177, !dbg !2004

170:                                              ; preds = %167
  %171 = load i32, ptr %10, align 4, !dbg !2006
  %172 = getelementptr inbounds nuw %struct.segmasks, ptr %4, i32 0, i32 2, !dbg !2007
  %173 = load i8, ptr %172, align 1, !dbg !2008
  %174 = sext i8 %173 to i32, !dbg !2008
  %175 = or i32 %174, %171, !dbg !2008
  %176 = trunc i32 %175 to i8, !dbg !2008
  store i8 %176, ptr %172, align 1, !dbg !2008
  br label %177, !dbg !2009

177:                                              ; preds = %170, %167
  br label %178

178:                                              ; preds = %177, %156
  br label %240, !dbg !2010

179:                                              ; preds = %45
    #dbg_declare(ptr %21, !2011, !DIExpression(), !2013)
    #dbg_declare(ptr %22, !2014, !DIExpression(), !2015)
  %180 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 0, !dbg !2016
  %181 = load i32, ptr %180, align 4, !dbg !2016
  store i32 %181, ptr %16, align 4, !dbg !2017
  store i32 1, ptr %22, align 4, !dbg !2018
  br label %182, !dbg !2020

182:                                              ; preds = %198, %179
  %183 = load i32, ptr %22, align 4, !dbg !2021
  %184 = icmp slt i32 %183, 4, !dbg !2023
  br i1 %184, label %185, label %201, !dbg !2024

185:                                              ; preds = %182
  %186 = load i32, ptr %22, align 4, !dbg !2025
  %187 = sext i32 %186 to i64, !dbg !2027
  %188 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 %187, !dbg !2027
  %189 = load i32, ptr %188, align 4, !dbg !2027
  %190 = load i32, ptr %16, align 4, !dbg !2028
  %191 = icmp slt i32 %189, %190, !dbg !2029
  br i1 %191, label %192, label %197, !dbg !2029

192:                                              ; preds = %185
  %193 = load i32, ptr %22, align 4, !dbg !2030
  %194 = sext i32 %193 to i64, !dbg !2031
  %195 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 %194, !dbg !2031
  %196 = load i32, ptr %195, align 4, !dbg !2031
  store i32 %196, ptr %16, align 4, !dbg !2032
  br label %197, !dbg !2033

197:                                              ; preds = %192, %185
  br label %198, !dbg !2028

198:                                              ; preds = %197
  %199 = load i32, ptr %22, align 4, !dbg !2034
  %200 = add nsw i32 %199, 1, !dbg !2034
  store i32 %200, ptr %22, align 4, !dbg !2034
  br label %182, !dbg !2035, !llvm.loop !2036

201:                                              ; preds = %182
  %202 = load ptr, ptr %5, align 8, !dbg !2038
  %203 = load ptr, ptr %14, align 8, !dbg !2039
  %204 = getelementptr inbounds nuw %struct.side, ptr %203, i32 0, i32 6, !dbg !2040
  %205 = getelementptr inbounds [2 x %struct.vms_vector], ptr %204, i64 0, i64 0, !dbg !2039
  %206 = load i32, ptr %16, align 4, !dbg !2041
  %207 = sext i32 %206 to i64, !dbg !2042
  %208 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %207, !dbg !2042
  %209 = call noundef i32 @_Z16vm_dist_to_planeP10vms_vectorS0_S0_(ptr noundef %202, ptr noundef %205, ptr noundef %208), !dbg !2043
  store i32 %209, ptr %21, align 4, !dbg !2044
  %210 = load i32, ptr %21, align 4, !dbg !2045
  %211 = icmp slt i32 %210, -250, !dbg !2047
  br i1 %211, label %212, label %219, !dbg !2047

212:                                              ; preds = %201
  %213 = load i32, ptr %10, align 4, !dbg !2048
  %214 = getelementptr inbounds nuw %struct.segmasks, ptr %4, i32 0, i32 2, !dbg !2049
  %215 = load i8, ptr %214, align 1, !dbg !2050
  %216 = sext i8 %215 to i32, !dbg !2050
  %217 = or i32 %216, %213, !dbg !2050
  %218 = trunc i32 %217 to i8, !dbg !2050
  store i8 %218, ptr %214, align 1, !dbg !2050
  br label %219, !dbg !2051

219:                                              ; preds = %212, %201
  %220 = load i32, ptr %21, align 4, !dbg !2052
  %221 = load i32, ptr %7, align 4, !dbg !2054
  %222 = sub nsw i32 %220, %221, !dbg !2055
  %223 = icmp slt i32 %222, -250, !dbg !2056
  br i1 %223, label %224, label %237, !dbg !2056

224:                                              ; preds = %219
  %225 = load i32, ptr %9, align 4, !dbg !2057
  %226 = getelementptr inbounds nuw %struct.segmasks, ptr %4, i32 0, i32 0, !dbg !2059
  %227 = load i16, ptr %226, align 2, !dbg !2060
  %228 = sext i16 %227 to i32, !dbg !2060
  %229 = or i32 %228, %225, !dbg !2060
  %230 = trunc i32 %229 to i16, !dbg !2060
  store i16 %230, ptr %226, align 2, !dbg !2060
  %231 = load i32, ptr %10, align 4, !dbg !2061
  %232 = getelementptr inbounds nuw %struct.segmasks, ptr %4, i32 0, i32 1, !dbg !2062
  %233 = load i8, ptr %232, align 2, !dbg !2063
  %234 = sext i8 %233 to i32, !dbg !2063
  %235 = or i32 %234, %231, !dbg !2063
  %236 = trunc i32 %235 to i8, !dbg !2063
  store i8 %236, ptr %232, align 2, !dbg !2063
  br label %237, !dbg !2064

237:                                              ; preds = %224, %219
  %238 = load i32, ptr %9, align 4, !dbg !2065
  %239 = shl i32 %238, 2, !dbg !2065
  store i32 %239, ptr %9, align 4, !dbg !2065
  br label %240

240:                                              ; preds = %237, %178
  br label %241, !dbg !2066

241:                                              ; preds = %240
  %242 = load i32, ptr %8, align 4, !dbg !2067
  %243 = add nsw i32 %242, 1, !dbg !2067
  store i32 %243, ptr %8, align 4, !dbg !2067
  %244 = load i32, ptr %10, align 4, !dbg !2068
  %245 = shl i32 %244, 1, !dbg !2068
  store i32 %245, ptr %10, align 4, !dbg !2068
  br label %42, !dbg !2069, !llvm.loop !2070

246:                                              ; preds = %42
  %247 = load i32, ptr %4, align 2, !dbg !2072
  ret i32 %247, !dbg !2072
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 4 dereferenceable(4) ptr @_ZNSt3__13minB8ne200100IiEERKT_S3_S3_(ptr noundef nonnull align 4 dereferenceable(4) %0, ptr noundef nonnull align 4 dereferenceable(4) %1) #0 !dbg !2073 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %"struct.std::__1::__less", align 1
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !2080, !DIExpression(), !2081)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !2082, !DIExpression(), !2083)
  %6 = load ptr, ptr %3, align 8, !dbg !2084
  %7 = load ptr, ptr %4, align 8, !dbg !2085
  %8 = call noundef nonnull align 4 dereferenceable(4) ptr @_ZNSt3__13minB8ne200100IiNS_6__lessIvvEEEERKT_S5_S5_T0_(ptr noundef nonnull align 4 dereferenceable(4) %6, ptr noundef nonnull align 4 dereferenceable(4) %7), !dbg !2086
  ret ptr %8, !dbg !2087
}

declare noundef i32 @_Z16vm_dist_to_planeP10vms_vectorS0_S0_(ptr noundef, ptr noundef, ptr noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef zeroext i8 @_Z14get_side_distsP10vms_vectoriPi(ptr noundef %0, i32 noundef %1, ptr noundef %2) #0 !dbg !2088 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8, align 1
  %11 = alloca i32, align 4
  %12 = alloca [6 x i32], align 4
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !2092, !DIExpression(), !2093)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !2094, !DIExpression(), !2095)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !2096, !DIExpression(), !2097)
  %23 = load i32, ptr %5, align 4, !dbg !2098
  %24 = load i32, ptr @Highest_segment_index, align 4, !dbg !2098
  %25 = icmp sle i32 %23, %24, !dbg !2098
  br i1 %25, label %26, label %29, !dbg !2098

26:                                               ; preds = %3
  %27 = load i32, ptr %5, align 4, !dbg !2098
  %28 = icmp sge i32 %27, 0, !dbg !2098
  br label %29

29:                                               ; preds = %26, %3
  %30 = phi i1 [ false, %3 ], [ %28, %26 ], !dbg !2099
  %31 = zext i1 %30 to i32, !dbg !2098
  call void @_Z7_AssertiPKcS0_i(i32 noundef %31, ptr noundef @.str.1, ptr noundef @.str.2, i32 noundef 591), !dbg !2098
  %32 = load i32, ptr %5, align 4, !dbg !2100
  %33 = icmp eq i32 %32, -1, !dbg !2102
  br i1 %33, label %34, label %35, !dbg !2102

34:                                               ; preds = %29
  call void (ptr, ...) @_Z5ErrorPKcz(ptr noundef @.str.6), !dbg !2103
  br label %35, !dbg !2103

35:                                               ; preds = %34, %29
    #dbg_declare(ptr %7, !2104, !DIExpression(), !2105)
    #dbg_declare(ptr %8, !2106, !DIExpression(), !2107)
    #dbg_declare(ptr %9, !2108, !DIExpression(), !2109)
    #dbg_declare(ptr %10, !2110, !DIExpression(), !2111)
    #dbg_declare(ptr %11, !2112, !DIExpression(), !2113)
    #dbg_declare(ptr %12, !2114, !DIExpression(), !2115)
    #dbg_declare(ptr %13, !2116, !DIExpression(), !2117)
  %36 = load i32, ptr %5, align 4, !dbg !2118
  %37 = sext i32 %36 to i64, !dbg !2119
  %38 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %37, !dbg !2119
  store ptr %38, ptr %13, align 8, !dbg !2120
  store i8 0, ptr %10, align 1, !dbg !2121
  store i32 0, ptr %7, align 4, !dbg !2122
  store i32 1, ptr %9, align 4, !dbg !2124
  store i32 1, ptr %8, align 4, !dbg !2125
  br label %39, !dbg !2126

39:                                               ; preds = %215, %35
  %40 = load i32, ptr %7, align 4, !dbg !2127
  %41 = icmp slt i32 %40, 6, !dbg !2129
  br i1 %41, label %42, label %220, !dbg !2130

42:                                               ; preds = %39
    #dbg_declare(ptr %14, !2131, !DIExpression(), !2133)
  %43 = load ptr, ptr %13, align 8, !dbg !2134
  %44 = getelementptr inbounds nuw %struct.segment, ptr %43, i32 0, i32 0, !dbg !2135
  %45 = load i32, ptr %7, align 4, !dbg !2136
  %46 = sext i32 %45 to i64, !dbg !2134
  %47 = getelementptr inbounds [6 x %struct.side], ptr %44, i64 0, i64 %46, !dbg !2134
  store ptr %47, ptr %14, align 8, !dbg !2133
    #dbg_declare(ptr %15, !2137, !DIExpression(), !2138)
    #dbg_declare(ptr %16, !2139, !DIExpression(), !2140)
  %48 = load ptr, ptr %6, align 8, !dbg !2141
  %49 = load i32, ptr %7, align 4, !dbg !2142
  %50 = sext i32 %49 to i64, !dbg !2141
  %51 = getelementptr inbounds i32, ptr %48, i64 %50, !dbg !2141
  store i32 0, ptr %51, align 4, !dbg !2143
  %52 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 0, !dbg !2144
  %53 = load i32, ptr %5, align 4, !dbg !2145
  %54 = load i32, ptr %7, align 4, !dbg !2146
  call void @_Z23create_abs_vertex_listsPiS_ii(ptr noundef %11, ptr noundef %52, i32 noundef %53, i32 noundef %54), !dbg !2147
  %55 = load i32, ptr %11, align 4, !dbg !2148
  %56 = icmp eq i32 %55, 2, !dbg !2150
  br i1 %56, label %57, label %167, !dbg !2150

57:                                               ; preds = %42
    #dbg_declare(ptr %17, !2151, !DIExpression(), !2153)
    #dbg_declare(ptr %18, !2154, !DIExpression(), !2155)
    #dbg_declare(ptr %19, !2156, !DIExpression(), !2157)
  %58 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 0, !dbg !2158
  %59 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 2, !dbg !2159
  %60 = call noundef nonnull align 4 dereferenceable(4) ptr @_ZNSt3__13minB8ne200100IiEERKT_S3_S3_(ptr noundef nonnull align 4 dereferenceable(4) %58, ptr noundef nonnull align 4 dereferenceable(4) %59), !dbg !2160
  %61 = load i32, ptr %60, align 4, !dbg !2160
  store i32 %61, ptr %19, align 4, !dbg !2161
  %62 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 4, !dbg !2162
  %63 = load i32, ptr %62, align 4, !dbg !2162
  %64 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 1, !dbg !2164
  %65 = load i32, ptr %64, align 4, !dbg !2164
  %66 = icmp slt i32 %63, %65, !dbg !2165
  br i1 %66, label %67, label %79, !dbg !2165

67:                                               ; preds = %57
  %68 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 4, !dbg !2166
  %69 = load i32, ptr %68, align 4, !dbg !2166
  %70 = sext i32 %69 to i64, !dbg !2167
  %71 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %70, !dbg !2167
  %72 = load ptr, ptr %14, align 8, !dbg !2168
  %73 = getelementptr inbounds nuw %struct.side, ptr %72, i32 0, i32 6, !dbg !2169
  %74 = getelementptr inbounds [2 x %struct.vms_vector], ptr %73, i64 0, i64 0, !dbg !2168
  %75 = load i32, ptr %19, align 4, !dbg !2170
  %76 = sext i32 %75 to i64, !dbg !2171
  %77 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %76, !dbg !2171
  %78 = call noundef i32 @_Z16vm_dist_to_planeP10vms_vectorS0_S0_(ptr noundef %71, ptr noundef %74, ptr noundef %77), !dbg !2172
  store i32 %78, ptr %17, align 4, !dbg !2173
  br label %91, !dbg !2174

79:                                               ; preds = %57
  %80 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 1, !dbg !2175
  %81 = load i32, ptr %80, align 4, !dbg !2175
  %82 = sext i32 %81 to i64, !dbg !2176
  %83 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %82, !dbg !2176
  %84 = load ptr, ptr %14, align 8, !dbg !2177
  %85 = getelementptr inbounds nuw %struct.side, ptr %84, i32 0, i32 6, !dbg !2178
  %86 = getelementptr inbounds [2 x %struct.vms_vector], ptr %85, i64 0, i64 1, !dbg !2177
  %87 = load i32, ptr %19, align 4, !dbg !2179
  %88 = sext i32 %87 to i64, !dbg !2180
  %89 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %88, !dbg !2180
  %90 = call noundef i32 @_Z16vm_dist_to_planeP10vms_vectorS0_S0_(ptr noundef %83, ptr noundef %86, ptr noundef %89), !dbg !2181
  store i32 %90, ptr %17, align 4, !dbg !2182
  br label %91

91:                                               ; preds = %79, %67
  %92 = load i32, ptr %17, align 4, !dbg !2183
  %93 = icmp sgt i32 %92, 250, !dbg !2184
  %94 = zext i1 %93 to i32, !dbg !2185
  store i32 %94, ptr %15, align 4, !dbg !2186
  store i32 0, ptr %18, align 4, !dbg !2187
  store i32 0, ptr %16, align 4, !dbg !2188
  br label %95, !dbg !2190

95:                                               ; preds = %122, %91
  %96 = load i32, ptr %16, align 4, !dbg !2191
  %97 = icmp slt i32 %96, 2, !dbg !2193
  br i1 %97, label %98, label %127, !dbg !2194

98:                                               ; preds = %95
  %99 = load ptr, ptr %4, align 8, !dbg !2195
  %100 = load ptr, ptr %14, align 8, !dbg !2197
  %101 = getelementptr inbounds nuw %struct.side, ptr %100, i32 0, i32 6, !dbg !2198
  %102 = load i32, ptr %16, align 4, !dbg !2199
  %103 = sext i32 %102 to i64, !dbg !2197
  %104 = getelementptr inbounds [2 x %struct.vms_vector], ptr %101, i64 0, i64 %103, !dbg !2197
  %105 = load i32, ptr %19, align 4, !dbg !2200
  %106 = sext i32 %105 to i64, !dbg !2201
  %107 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %106, !dbg !2201
  %108 = call noundef i32 @_Z16vm_dist_to_planeP10vms_vectorS0_S0_(ptr noundef %99, ptr noundef %104, ptr noundef %107), !dbg !2202
  store i32 %108, ptr %17, align 4, !dbg !2203
  %109 = load i32, ptr %17, align 4, !dbg !2204
  %110 = icmp slt i32 %109, -250, !dbg !2206
  br i1 %110, label %111, label %121, !dbg !2206

111:                                              ; preds = %98
  %112 = load i32, ptr %18, align 4, !dbg !2207
  %113 = add nsw i32 %112, 1, !dbg !2207
  store i32 %113, ptr %18, align 4, !dbg !2207
  %114 = load i32, ptr %17, align 4, !dbg !2209
  %115 = load ptr, ptr %6, align 8, !dbg !2210
  %116 = load i32, ptr %7, align 4, !dbg !2211
  %117 = sext i32 %116 to i64, !dbg !2210
  %118 = getelementptr inbounds i32, ptr %115, i64 %117, !dbg !2210
  %119 = load i32, ptr %118, align 4, !dbg !2212
  %120 = add nsw i32 %119, %114, !dbg !2212
  store i32 %120, ptr %118, align 4, !dbg !2212
  br label %121, !dbg !2213

121:                                              ; preds = %111, %98
  br label %122, !dbg !2214

122:                                              ; preds = %121
  %123 = load i32, ptr %16, align 4, !dbg !2215
  %124 = add nsw i32 %123, 1, !dbg !2215
  store i32 %124, ptr %16, align 4, !dbg !2215
  %125 = load i32, ptr %8, align 4, !dbg !2216
  %126 = shl i32 %125, 1, !dbg !2216
  store i32 %126, ptr %8, align 4, !dbg !2216
  br label %95, !dbg !2217, !llvm.loop !2218

127:                                              ; preds = %95
  %128 = load i32, ptr %15, align 4, !dbg !2220
  %129 = icmp ne i32 %128, 0, !dbg !2220
  br i1 %129, label %146, label %130, !dbg !2222

130:                                              ; preds = %127
  %131 = load i32, ptr %18, align 4, !dbg !2223
  %132 = icmp eq i32 %131, 2, !dbg !2226
  br i1 %132, label %133, label %145, !dbg !2226

133:                                              ; preds = %130
  %134 = load i32, ptr %9, align 4, !dbg !2227
  %135 = load i8, ptr %10, align 1, !dbg !2229
  %136 = zext i8 %135 to i32, !dbg !2229
  %137 = or i32 %136, %134, !dbg !2229
  %138 = trunc i32 %137 to i8, !dbg !2229
  store i8 %138, ptr %10, align 1, !dbg !2229
  %139 = load ptr, ptr %6, align 8, !dbg !2230
  %140 = load i32, ptr %7, align 4, !dbg !2231
  %141 = sext i32 %140 to i64, !dbg !2230
  %142 = getelementptr inbounds i32, ptr %139, i64 %141, !dbg !2230
  %143 = load i32, ptr %142, align 4, !dbg !2232
  %144 = sdiv i32 %143, 2, !dbg !2232
  store i32 %144, ptr %142, align 4, !dbg !2232
  br label %145, !dbg !2233

145:                                              ; preds = %133, %130
  br label %166, !dbg !2234

146:                                              ; preds = %127
  %147 = load i32, ptr %18, align 4, !dbg !2235
  %148 = icmp ne i32 %147, 0, !dbg !2235
  br i1 %148, label %149, label %165, !dbg !2235

149:                                              ; preds = %146
  %150 = load i32, ptr %9, align 4, !dbg !2238
  %151 = load i8, ptr %10, align 1, !dbg !2240
  %152 = zext i8 %151 to i32, !dbg !2240
  %153 = or i32 %152, %150, !dbg !2240
  %154 = trunc i32 %153 to i8, !dbg !2240
  store i8 %154, ptr %10, align 1, !dbg !2240
  %155 = load i32, ptr %18, align 4, !dbg !2241
  %156 = icmp eq i32 %155, 2, !dbg !2243
  br i1 %156, label %157, label %164, !dbg !2243

157:                                              ; preds = %149
  %158 = load ptr, ptr %6, align 8, !dbg !2244
  %159 = load i32, ptr %7, align 4, !dbg !2245
  %160 = sext i32 %159 to i64, !dbg !2244
  %161 = getelementptr inbounds i32, ptr %158, i64 %160, !dbg !2244
  %162 = load i32, ptr %161, align 4, !dbg !2246
  %163 = sdiv i32 %162, 2, !dbg !2246
  store i32 %163, ptr %161, align 4, !dbg !2246
  br label %164, !dbg !2244

164:                                              ; preds = %157, %149
  br label %165, !dbg !2247

165:                                              ; preds = %164, %146
  br label %166

166:                                              ; preds = %165, %145
  br label %214, !dbg !2248

167:                                              ; preds = %42
    #dbg_declare(ptr %20, !2249, !DIExpression(), !2251)
    #dbg_declare(ptr %21, !2252, !DIExpression(), !2253)
    #dbg_declare(ptr %22, !2254, !DIExpression(), !2255)
  %168 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 0, !dbg !2256
  %169 = load i32, ptr %168, align 4, !dbg !2256
  store i32 %169, ptr %22, align 4, !dbg !2257
  store i32 1, ptr %21, align 4, !dbg !2258
  br label %170, !dbg !2260

170:                                              ; preds = %186, %167
  %171 = load i32, ptr %21, align 4, !dbg !2261
  %172 = icmp slt i32 %171, 4, !dbg !2263
  br i1 %172, label %173, label %189, !dbg !2264

173:                                              ; preds = %170
  %174 = load i32, ptr %21, align 4, !dbg !2265
  %175 = sext i32 %174 to i64, !dbg !2267
  %176 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 %175, !dbg !2267
  %177 = load i32, ptr %176, align 4, !dbg !2267
  %178 = load i32, ptr %22, align 4, !dbg !2268
  %179 = icmp slt i32 %177, %178, !dbg !2269
  br i1 %179, label %180, label %185, !dbg !2269

180:                                              ; preds = %173
  %181 = load i32, ptr %21, align 4, !dbg !2270
  %182 = sext i32 %181 to i64, !dbg !2271
  %183 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 %182, !dbg !2271
  %184 = load i32, ptr %183, align 4, !dbg !2271
  store i32 %184, ptr %22, align 4, !dbg !2272
  br label %185, !dbg !2273

185:                                              ; preds = %180, %173
  br label %186, !dbg !2268

186:                                              ; preds = %185
  %187 = load i32, ptr %21, align 4, !dbg !2274
  %188 = add nsw i32 %187, 1, !dbg !2274
  store i32 %188, ptr %21, align 4, !dbg !2274
  br label %170, !dbg !2275, !llvm.loop !2276

189:                                              ; preds = %170
  %190 = load ptr, ptr %4, align 8, !dbg !2278
  %191 = load ptr, ptr %14, align 8, !dbg !2279
  %192 = getelementptr inbounds nuw %struct.side, ptr %191, i32 0, i32 6, !dbg !2280
  %193 = getelementptr inbounds [2 x %struct.vms_vector], ptr %192, i64 0, i64 0, !dbg !2279
  %194 = load i32, ptr %22, align 4, !dbg !2281
  %195 = sext i32 %194 to i64, !dbg !2282
  %196 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %195, !dbg !2282
  %197 = call noundef i32 @_Z16vm_dist_to_planeP10vms_vectorS0_S0_(ptr noundef %190, ptr noundef %193, ptr noundef %196), !dbg !2283
  store i32 %197, ptr %20, align 4, !dbg !2284
  %198 = load i32, ptr %20, align 4, !dbg !2285
  %199 = icmp slt i32 %198, -250, !dbg !2287
  br i1 %199, label %200, label %211, !dbg !2287

200:                                              ; preds = %189
  %201 = load i32, ptr %9, align 4, !dbg !2288
  %202 = load i8, ptr %10, align 1, !dbg !2290
  %203 = zext i8 %202 to i32, !dbg !2290
  %204 = or i32 %203, %201, !dbg !2290
  %205 = trunc i32 %204 to i8, !dbg !2290
  store i8 %205, ptr %10, align 1, !dbg !2290
  %206 = load i32, ptr %20, align 4, !dbg !2291
  %207 = load ptr, ptr %6, align 8, !dbg !2292
  %208 = load i32, ptr %7, align 4, !dbg !2293
  %209 = sext i32 %208 to i64, !dbg !2292
  %210 = getelementptr inbounds i32, ptr %207, i64 %209, !dbg !2292
  store i32 %206, ptr %210, align 4, !dbg !2294
  br label %211, !dbg !2295

211:                                              ; preds = %200, %189
  %212 = load i32, ptr %8, align 4, !dbg !2296
  %213 = shl i32 %212, 2, !dbg !2296
  store i32 %213, ptr %8, align 4, !dbg !2296
  br label %214

214:                                              ; preds = %211, %166
  br label %215, !dbg !2297

215:                                              ; preds = %214
  %216 = load i32, ptr %7, align 4, !dbg !2298
  %217 = add nsw i32 %216, 1, !dbg !2298
  store i32 %217, ptr %7, align 4, !dbg !2298
  %218 = load i32, ptr %9, align 4, !dbg !2299
  %219 = shl i32 %218, 1, !dbg !2299
  store i32 %219, ptr %9, align 4, !dbg !2299
  br label %39, !dbg !2300, !llvm.loop !2301

220:                                              ; preds = %39
  %221 = load i8, ptr %10, align 1, !dbg !2303
  ret i8 %221, !dbg !2304
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z11check_normsiiiiii(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5) #0 !dbg !2305 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  store i32 %0, ptr %8, align 4
    #dbg_declare(ptr %8, !2308, !DIExpression(), !2309)
  store i32 %1, ptr %9, align 4
    #dbg_declare(ptr %9, !2310, !DIExpression(), !2311)
  store i32 %2, ptr %10, align 4
    #dbg_declare(ptr %10, !2312, !DIExpression(), !2313)
  store i32 %3, ptr %11, align 4
    #dbg_declare(ptr %11, !2314, !DIExpression(), !2315)
  store i32 %4, ptr %12, align 4
    #dbg_declare(ptr %12, !2316, !DIExpression(), !2317)
  store i32 %5, ptr %13, align 4
    #dbg_declare(ptr %13, !2318, !DIExpression(), !2319)
    #dbg_declare(ptr %14, !2320, !DIExpression(), !2321)
    #dbg_declare(ptr %15, !2322, !DIExpression(), !2323)
  %16 = load i32, ptr %8, align 4, !dbg !2324
  %17 = sext i32 %16 to i64, !dbg !2325
  %18 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %17, !dbg !2325
  %19 = getelementptr inbounds nuw %struct.segment, ptr %18, i32 0, i32 0, !dbg !2326
  %20 = load i32, ptr %9, align 4, !dbg !2327
  %21 = sext i32 %20 to i64, !dbg !2325
  %22 = getelementptr inbounds [6 x %struct.side], ptr %19, i64 0, i64 %21, !dbg !2325
  %23 = getelementptr inbounds nuw %struct.side, ptr %22, i32 0, i32 6, !dbg !2328
  %24 = load i32, ptr %10, align 4, !dbg !2329
  %25 = sext i32 %24 to i64, !dbg !2325
  %26 = getelementptr inbounds [2 x %struct.vms_vector], ptr %23, i64 0, i64 %25, !dbg !2325
  store ptr %26, ptr %14, align 8, !dbg !2330
  %27 = load i32, ptr %11, align 4, !dbg !2331
  %28 = sext i32 %27 to i64, !dbg !2332
  %29 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %28, !dbg !2332
  %30 = getelementptr inbounds nuw %struct.segment, ptr %29, i32 0, i32 0, !dbg !2333
  %31 = load i32, ptr %12, align 4, !dbg !2334
  %32 = sext i32 %31 to i64, !dbg !2332
  %33 = getelementptr inbounds [6 x %struct.side], ptr %30, i64 0, i64 %32, !dbg !2332
  %34 = getelementptr inbounds nuw %struct.side, ptr %33, i32 0, i32 6, !dbg !2335
  %35 = load i32, ptr %13, align 4, !dbg !2336
  %36 = sext i32 %35 to i64, !dbg !2332
  %37 = getelementptr inbounds [2 x %struct.vms_vector], ptr %34, i64 0, i64 %36, !dbg !2332
  store ptr %37, ptr %15, align 8, !dbg !2337
  %38 = load ptr, ptr %14, align 8, !dbg !2338
  %39 = getelementptr inbounds nuw %struct.vms_vector, ptr %38, i32 0, i32 0, !dbg !2340
  %40 = load i32, ptr %39, align 4, !dbg !2340
  %41 = load ptr, ptr %15, align 8, !dbg !2341
  %42 = getelementptr inbounds nuw %struct.vms_vector, ptr %41, i32 0, i32 0, !dbg !2342
  %43 = load i32, ptr %42, align 4, !dbg !2342
  %44 = sub nsw i32 0, %43, !dbg !2343
  %45 = icmp ne i32 %40, %44, !dbg !2344
  br i1 %45, label %64, label %46, !dbg !2345

46:                                               ; preds = %6
  %47 = load ptr, ptr %14, align 8, !dbg !2346
  %48 = getelementptr inbounds nuw %struct.vms_vector, ptr %47, i32 0, i32 1, !dbg !2347
  %49 = load i32, ptr %48, align 4, !dbg !2347
  %50 = load ptr, ptr %15, align 8, !dbg !2348
  %51 = getelementptr inbounds nuw %struct.vms_vector, ptr %50, i32 0, i32 1, !dbg !2349
  %52 = load i32, ptr %51, align 4, !dbg !2349
  %53 = sub nsw i32 0, %52, !dbg !2350
  %54 = icmp ne i32 %49, %53, !dbg !2351
  br i1 %54, label %64, label %55, !dbg !2352

55:                                               ; preds = %46
  %56 = load ptr, ptr %14, align 8, !dbg !2353
  %57 = getelementptr inbounds nuw %struct.vms_vector, ptr %56, i32 0, i32 2, !dbg !2354
  %58 = load i32, ptr %57, align 4, !dbg !2354
  %59 = load ptr, ptr %15, align 8, !dbg !2355
  %60 = getelementptr inbounds nuw %struct.vms_vector, ptr %59, i32 0, i32 2, !dbg !2356
  %61 = load i32, ptr %60, align 4, !dbg !2356
  %62 = sub nsw i32 0, %61, !dbg !2357
  %63 = icmp ne i32 %58, %62, !dbg !2358
  br i1 %63, label %64, label %92, !dbg !2352

64:                                               ; preds = %55, %46, %6
  %65 = load i32, ptr %8, align 4, !dbg !2359
  %66 = load i32, ptr %9, align 4, !dbg !2359
  %67 = load i32, ptr %10, align 4, !dbg !2359
  %68 = load i32, ptr %11, align 4, !dbg !2359
  %69 = load i32, ptr %12, align 4, !dbg !2359
  %70 = load i32, ptr %13, align 4, !dbg !2359
  %71 = load ptr, ptr %14, align 8, !dbg !2359
  %72 = getelementptr inbounds nuw %struct.vms_vector, ptr %71, i32 0, i32 0, !dbg !2359
  %73 = load i32, ptr %72, align 4, !dbg !2359
  %74 = load ptr, ptr %14, align 8, !dbg !2359
  %75 = getelementptr inbounds nuw %struct.vms_vector, ptr %74, i32 0, i32 1, !dbg !2359
  %76 = load i32, ptr %75, align 4, !dbg !2359
  %77 = load ptr, ptr %14, align 8, !dbg !2359
  %78 = getelementptr inbounds nuw %struct.vms_vector, ptr %77, i32 0, i32 2, !dbg !2359
  %79 = load i32, ptr %78, align 4, !dbg !2359
  %80 = load ptr, ptr %15, align 8, !dbg !2359
  %81 = getelementptr inbounds nuw %struct.vms_vector, ptr %80, i32 0, i32 0, !dbg !2359
  %82 = load i32, ptr %81, align 4, !dbg !2359
  %83 = sub nsw i32 0, %82, !dbg !2359
  %84 = load ptr, ptr %15, align 8, !dbg !2359
  %85 = getelementptr inbounds nuw %struct.vms_vector, ptr %84, i32 0, i32 1, !dbg !2359
  %86 = load i32, ptr %85, align 4, !dbg !2359
  %87 = sub nsw i32 0, %86, !dbg !2359
  %88 = load ptr, ptr %15, align 8, !dbg !2359
  %89 = getelementptr inbounds nuw %struct.vms_vector, ptr %88, i32 0, i32 2, !dbg !2359
  %90 = load i32, ptr %89, align 4, !dbg !2359
  %91 = sub nsw i32 0, %90, !dbg !2359
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.7, i32 noundef %65, i32 noundef %66, i32 noundef %67, i32 noundef %68, i32 noundef %69, i32 noundef %70, i32 noundef %73, i32 noundef %76, i32 noundef %79, i32 noundef %83, i32 noundef %87, i32 noundef %91), !dbg !2359
  store i32 1, ptr %7, align 4, !dbg !2361
  br label %93, !dbg !2361

92:                                               ; preds = %55
  store i32 0, ptr %7, align 4, !dbg !2362
  br label %93, !dbg !2362

93:                                               ; preds = %92, %64
  %94 = load i32, ptr %7, align 4, !dbg !2363
  ret i32 %94, !dbg !2363
}

declare void @_Z8_mprintfiPKcz(i32 noundef, ptr noundef, ...) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z25check_segment_connectionsv() #0 !dbg !2364 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca [6 x i32], align 4
  %13 = alloca [6 x i32], align 4
  %14 = alloca i32, align 4
    #dbg_declare(ptr %1, !2365, !DIExpression(), !2366)
    #dbg_declare(ptr %2, !2367, !DIExpression(), !2368)
    #dbg_declare(ptr %3, !2369, !DIExpression(), !2370)
  store i32 0, ptr %3, align 4, !dbg !2370
  store i32 0, ptr %1, align 4, !dbg !2371
  br label %15, !dbg !2373

15:                                               ; preds = %424, %0
  %16 = load i32, ptr %1, align 4, !dbg !2374
  %17 = load i32, ptr @Highest_segment_index, align 4, !dbg !2376
  %18 = icmp sle i32 %16, %17, !dbg !2377
  br i1 %18, label %19, label %427, !dbg !2378

19:                                               ; preds = %15
    #dbg_declare(ptr %4, !2379, !DIExpression(), !2381)
  %20 = load i32, ptr %1, align 4, !dbg !2382
  %21 = sext i32 %20 to i64, !dbg !2383
  %22 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %21, !dbg !2383
  store ptr %22, ptr %4, align 8, !dbg !2384
  store i32 0, ptr %2, align 4, !dbg !2385
  br label %23, !dbg !2387

23:                                               ; preds = %420, %19
  %24 = load i32, ptr %2, align 4, !dbg !2388
  %25 = icmp slt i32 %24, 6, !dbg !2390
  br i1 %25, label %26, label %423, !dbg !2391

26:                                               ; preds = %23
    #dbg_declare(ptr %5, !2392, !DIExpression(), !2394)
    #dbg_declare(ptr %6, !2395, !DIExpression(), !2396)
    #dbg_declare(ptr %7, !2397, !DIExpression(), !2398)
    #dbg_declare(ptr %8, !2399, !DIExpression(), !2400)
    #dbg_declare(ptr %9, !2401, !DIExpression(), !2402)
    #dbg_declare(ptr %10, !2403, !DIExpression(), !2404)
    #dbg_declare(ptr %11, !2405, !DIExpression(), !2406)
    #dbg_declare(ptr %12, !2407, !DIExpression(), !2408)
    #dbg_declare(ptr %13, !2409, !DIExpression(), !2410)
  %27 = load ptr, ptr %4, align 8, !dbg !2411
  %28 = getelementptr inbounds nuw %struct.segment, ptr %27, i32 0, i32 0, !dbg !2412
  %29 = load i32, ptr %2, align 4, !dbg !2413
  %30 = sext i32 %29 to i64, !dbg !2411
  %31 = getelementptr inbounds [6 x %struct.side], ptr %28, i64 0, i64 %30, !dbg !2411
  store ptr %31, ptr %5, align 8, !dbg !2414
  %32 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 0, !dbg !2415
  %33 = load i32, ptr %1, align 4, !dbg !2416
  %34 = load i32, ptr %2, align 4, !dbg !2417
  call void @_Z23create_abs_vertex_listsPiS_ii(ptr noundef %8, ptr noundef %32, i32 noundef %33, i32 noundef %34), !dbg !2418
  %35 = load ptr, ptr %4, align 8, !dbg !2419
  %36 = getelementptr inbounds nuw %struct.segment, ptr %35, i32 0, i32 1, !dbg !2420
  %37 = load i32, ptr %2, align 4, !dbg !2421
  %38 = sext i32 %37 to i64, !dbg !2419
  %39 = getelementptr inbounds [6 x i16], ptr %36, i64 0, i64 %38, !dbg !2419
  %40 = load i16, ptr %39, align 2, !dbg !2419
  %41 = sext i16 %40 to i32, !dbg !2419
  store i32 %41, ptr %9, align 4, !dbg !2422
  %42 = load i32, ptr %9, align 4, !dbg !2423
  %43 = icmp sge i32 %42, 0, !dbg !2425
  br i1 %43, label %44, label %419, !dbg !2425

44:                                               ; preds = %26
  %45 = load i32, ptr %9, align 4, !dbg !2426
  %46 = sext i32 %45 to i64, !dbg !2428
  %47 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %46, !dbg !2428
  store ptr %47, ptr %6, align 8, !dbg !2429
  %48 = load ptr, ptr %4, align 8, !dbg !2430
  %49 = load ptr, ptr %6, align 8, !dbg !2431
  %50 = call noundef i32 @_Z17find_connect_sideP7segmentS0_(ptr noundef %48, ptr noundef %49), !dbg !2432
  store i32 %50, ptr %10, align 4, !dbg !2433
  %51 = load i32, ptr %10, align 4, !dbg !2434
  %52 = icmp eq i32 %51, -1, !dbg !2436
  br i1 %52, label %53, label %57, !dbg !2436

53:                                               ; preds = %44
  %54 = load i32, ptr %9, align 4, !dbg !2437
  %55 = load i32, ptr %1, align 4, !dbg !2437
  %56 = load i32, ptr %2, align 4, !dbg !2437
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.8, i32 noundef %54, i32 noundef %55, i32 noundef %56), !dbg !2437
  store i32 1, ptr %3, align 4, !dbg !2439
  br label %420, !dbg !2440

57:                                               ; preds = %44
  %58 = load ptr, ptr %6, align 8, !dbg !2441
  %59 = getelementptr inbounds nuw %struct.segment, ptr %58, i32 0, i32 0, !dbg !2442
  %60 = load i32, ptr %10, align 4, !dbg !2443
  %61 = sext i32 %60 to i64, !dbg !2441
  %62 = getelementptr inbounds [6 x %struct.side], ptr %59, i64 0, i64 %61, !dbg !2441
  store ptr %62, ptr %7, align 8, !dbg !2444
  %63 = getelementptr inbounds [6 x i32], ptr %13, i64 0, i64 0, !dbg !2445
  %64 = load i32, ptr %9, align 4, !dbg !2446
  %65 = load i32, ptr %10, align 4, !dbg !2447
  call void @_Z23create_abs_vertex_listsPiS_ii(ptr noundef %11, ptr noundef %63, i32 noundef %64, i32 noundef %65), !dbg !2448
  %66 = load i32, ptr %11, align 4, !dbg !2449
  %67 = load i32, ptr %8, align 4, !dbg !2451
  %68 = icmp ne i32 %66, %67, !dbg !2452
  br i1 %68, label %69, label %76, !dbg !2452

69:                                               ; preds = %57
  %70 = load i32, ptr %1, align 4, !dbg !2453
  %71 = load i32, ptr %2, align 4, !dbg !2453
  %72 = load i32, ptr %8, align 4, !dbg !2453
  %73 = load i32, ptr %9, align 4, !dbg !2453
  %74 = load i32, ptr %10, align 4, !dbg !2453
  %75 = load i32, ptr %11, align 4, !dbg !2453
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.9, i32 noundef %70, i32 noundef %71, i32 noundef %72, i32 noundef %73, i32 noundef %74, i32 noundef %75), !dbg !2453
  store i32 1, ptr %3, align 4, !dbg !2455
  br label %418, !dbg !2456

76:                                               ; preds = %57
  %77 = load i32, ptr %8, align 4, !dbg !2457
  %78 = icmp eq i32 %77, 1, !dbg !2459
  br i1 %78, label %79, label %168, !dbg !2459

79:                                               ; preds = %76
    #dbg_declare(ptr %14, !2460, !DIExpression(), !2462)
  store i32 0, ptr %14, align 4, !dbg !2463
  br label %80, !dbg !2465

80:                                               ; preds = %94, %79
  %81 = load i32, ptr %14, align 4, !dbg !2466
  %82 = icmp slt i32 %81, 4, !dbg !2468
  br i1 %82, label %83, label %91, !dbg !2469

83:                                               ; preds = %80
  %84 = load i32, ptr %14, align 4, !dbg !2470
  %85 = sext i32 %84 to i64, !dbg !2471
  %86 = getelementptr inbounds [6 x i32], ptr %13, i64 0, i64 %85, !dbg !2471
  %87 = load i32, ptr %86, align 4, !dbg !2471
  %88 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 0, !dbg !2472
  %89 = load i32, ptr %88, align 4, !dbg !2472
  %90 = icmp ne i32 %87, %89, !dbg !2473
  br label %91

91:                                               ; preds = %83, %80
  %92 = phi i1 [ false, %80 ], [ %90, %83 ], !dbg !2474
  br i1 %92, label %93, label %97, !dbg !2475

93:                                               ; preds = %91
  br label %94, !dbg !2475

94:                                               ; preds = %93
  %95 = load i32, ptr %14, align 4, !dbg !2476
  %96 = add nsw i32 %95, 1, !dbg !2476
  store i32 %96, ptr %14, align 4, !dbg !2476
  br label %80, !dbg !2477, !llvm.loop !2478

97:                                               ; preds = %91
  %98 = load i32, ptr %14, align 4, !dbg !2480
  %99 = icmp eq i32 %98, 4, !dbg !2482
  br i1 %99, label %138, label %100, !dbg !2483

100:                                              ; preds = %97
  %101 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 0, !dbg !2484
  %102 = load i32, ptr %101, align 4, !dbg !2484
  %103 = load i32, ptr %14, align 4, !dbg !2485
  %104 = sext i32 %103 to i64, !dbg !2486
  %105 = getelementptr inbounds [6 x i32], ptr %13, i64 0, i64 %104, !dbg !2486
  %106 = load i32, ptr %105, align 4, !dbg !2486
  %107 = icmp ne i32 %102, %106, !dbg !2487
  br i1 %107, label %138, label %108, !dbg !2488

108:                                              ; preds = %100
  %109 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 1, !dbg !2489
  %110 = load i32, ptr %109, align 4, !dbg !2489
  %111 = load i32, ptr %14, align 4, !dbg !2490
  %112 = add nsw i32 %111, 3, !dbg !2491
  %113 = srem i32 %112, 4, !dbg !2492
  %114 = sext i32 %113 to i64, !dbg !2493
  %115 = getelementptr inbounds [6 x i32], ptr %13, i64 0, i64 %114, !dbg !2493
  %116 = load i32, ptr %115, align 4, !dbg !2493
  %117 = icmp ne i32 %110, %116, !dbg !2494
  br i1 %117, label %138, label %118, !dbg !2495

118:                                              ; preds = %108
  %119 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 2, !dbg !2496
  %120 = load i32, ptr %119, align 4, !dbg !2496
  %121 = load i32, ptr %14, align 4, !dbg !2497
  %122 = add nsw i32 %121, 2, !dbg !2498
  %123 = srem i32 %122, 4, !dbg !2499
  %124 = sext i32 %123 to i64, !dbg !2500
  %125 = getelementptr inbounds [6 x i32], ptr %13, i64 0, i64 %124, !dbg !2500
  %126 = load i32, ptr %125, align 4, !dbg !2500
  %127 = icmp ne i32 %120, %126, !dbg !2501
  br i1 %127, label %138, label %128, !dbg !2502

128:                                              ; preds = %118
  %129 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 3, !dbg !2503
  %130 = load i32, ptr %129, align 4, !dbg !2503
  %131 = load i32, ptr %14, align 4, !dbg !2504
  %132 = add nsw i32 %131, 1, !dbg !2505
  %133 = srem i32 %132, 4, !dbg !2506
  %134 = sext i32 %133 to i64, !dbg !2507
  %135 = getelementptr inbounds [6 x i32], ptr %13, i64 0, i64 %134, !dbg !2507
  %136 = load i32, ptr %135, align 4, !dbg !2507
  %137 = icmp ne i32 %130, %136, !dbg !2508
  br i1 %137, label %138, label %159, !dbg !2502

138:                                              ; preds = %128, %118, %108, %100, %97
  %139 = load i32, ptr %1, align 4, !dbg !2509
  %140 = load i32, ptr %2, align 4, !dbg !2509
  %141 = load i32, ptr %9, align 4, !dbg !2509
  %142 = load i32, ptr %10, align 4, !dbg !2509
  %143 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 0, !dbg !2509
  %144 = load i32, ptr %143, align 4, !dbg !2509
  %145 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 1, !dbg !2509
  %146 = load i32, ptr %145, align 4, !dbg !2509
  %147 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 2, !dbg !2509
  %148 = load i32, ptr %147, align 4, !dbg !2509
  %149 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 3, !dbg !2509
  %150 = load i32, ptr %149, align 4, !dbg !2509
  %151 = getelementptr inbounds [6 x i32], ptr %13, i64 0, i64 0, !dbg !2509
  %152 = load i32, ptr %151, align 4, !dbg !2509
  %153 = getelementptr inbounds [6 x i32], ptr %13, i64 0, i64 1, !dbg !2509
  %154 = load i32, ptr %153, align 4, !dbg !2509
  %155 = getelementptr inbounds [6 x i32], ptr %13, i64 0, i64 2, !dbg !2509
  %156 = load i32, ptr %155, align 4, !dbg !2509
  %157 = getelementptr inbounds [6 x i32], ptr %13, i64 0, i64 3, !dbg !2509
  %158 = load i32, ptr %157, align 4, !dbg !2509
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.10, i32 noundef %139, i32 noundef %140, i32 noundef %141, i32 noundef %142, i32 noundef %144, i32 noundef %146, i32 noundef %148, i32 noundef %150, i32 noundef %152, i32 noundef %154, i32 noundef %156, i32 noundef %158), !dbg !2509
  store i32 1, ptr %3, align 4, !dbg !2511
  br label %167, !dbg !2512

159:                                              ; preds = %128
  %160 = load i32, ptr %1, align 4, !dbg !2513
  %161 = load i32, ptr %2, align 4, !dbg !2514
  %162 = load i32, ptr %9, align 4, !dbg !2515
  %163 = load i32, ptr %10, align 4, !dbg !2516
  %164 = call noundef i32 @_Z11check_normsiiiiii(i32 noundef %160, i32 noundef %161, i32 noundef 0, i32 noundef %162, i32 noundef %163, i32 noundef 0), !dbg !2517
  %165 = load i32, ptr %3, align 4, !dbg !2518
  %166 = or i32 %165, %164, !dbg !2518
  store i32 %166, ptr %3, align 4, !dbg !2518
  br label %167

167:                                              ; preds = %159, %138
  br label %417, !dbg !2519

168:                                              ; preds = %76
  %169 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 1, !dbg !2520
  %170 = load i32, ptr %169, align 4, !dbg !2520
  %171 = getelementptr inbounds [6 x i32], ptr %13, i64 0, i64 1, !dbg !2523
  %172 = load i32, ptr %171, align 4, !dbg !2523
  %173 = icmp eq i32 %170, %172, !dbg !2524
  br i1 %173, label %174, label %292, !dbg !2524

174:                                              ; preds = %168
  %175 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 4, !dbg !2525
  %176 = load i32, ptr %175, align 4, !dbg !2525
  %177 = getelementptr inbounds [6 x i32], ptr %13, i64 0, i64 4, !dbg !2528
  %178 = load i32, ptr %177, align 4, !dbg !2528
  %179 = icmp ne i32 %176, %178, !dbg !2529
  br i1 %179, label %204, label %180, !dbg !2530

180:                                              ; preds = %174
  %181 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 0, !dbg !2531
  %182 = load i32, ptr %181, align 4, !dbg !2531
  %183 = getelementptr inbounds [6 x i32], ptr %13, i64 0, i64 2, !dbg !2532
  %184 = load i32, ptr %183, align 4, !dbg !2532
  %185 = icmp ne i32 %182, %184, !dbg !2533
  br i1 %185, label %204, label %186, !dbg !2534

186:                                              ; preds = %180
  %187 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 2, !dbg !2535
  %188 = load i32, ptr %187, align 4, !dbg !2535
  %189 = getelementptr inbounds [6 x i32], ptr %13, i64 0, i64 0, !dbg !2536
  %190 = load i32, ptr %189, align 4, !dbg !2536
  %191 = icmp ne i32 %188, %190, !dbg !2537
  br i1 %191, label %204, label %192, !dbg !2538

192:                                              ; preds = %186
  %193 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 3, !dbg !2539
  %194 = load i32, ptr %193, align 4, !dbg !2539
  %195 = getelementptr inbounds [6 x i32], ptr %13, i64 0, i64 5, !dbg !2540
  %196 = load i32, ptr %195, align 4, !dbg !2540
  %197 = icmp ne i32 %194, %196, !dbg !2541
  br i1 %197, label %204, label %198, !dbg !2542

198:                                              ; preds = %192
  %199 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 5, !dbg !2543
  %200 = load i32, ptr %199, align 4, !dbg !2543
  %201 = getelementptr inbounds [6 x i32], ptr %13, i64 0, i64 3, !dbg !2544
  %202 = load i32, ptr %201, align 4, !dbg !2544
  %203 = icmp ne i32 %200, %202, !dbg !2545
  br i1 %203, label %204, label %276, !dbg !2542

204:                                              ; preds = %198, %192, %186, %180, %174
  %205 = load i32, ptr %1, align 4, !dbg !2546
  %206 = load i32, ptr %2, align 4, !dbg !2546
  %207 = load i32, ptr %9, align 4, !dbg !2546
  %208 = load i32, ptr %10, align 4, !dbg !2546
  %209 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 0, !dbg !2546
  %210 = load i32, ptr %209, align 4, !dbg !2546
  %211 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 1, !dbg !2546
  %212 = load i32, ptr %211, align 4, !dbg !2546
  %213 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 2, !dbg !2546
  %214 = load i32, ptr %213, align 4, !dbg !2546
  %215 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 3, !dbg !2546
  %216 = load i32, ptr %215, align 4, !dbg !2546
  %217 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 4, !dbg !2546
  %218 = load i32, ptr %217, align 4, !dbg !2546
  %219 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 5, !dbg !2546
  %220 = load i32, ptr %219, align 4, !dbg !2546
  %221 = getelementptr inbounds [6 x i32], ptr %13, i64 0, i64 0, !dbg !2546
  %222 = load i32, ptr %221, align 4, !dbg !2546
  %223 = getelementptr inbounds [6 x i32], ptr %13, i64 0, i64 1, !dbg !2546
  %224 = load i32, ptr %223, align 4, !dbg !2546
  %225 = getelementptr inbounds [6 x i32], ptr %13, i64 0, i64 2, !dbg !2546
  %226 = load i32, ptr %225, align 4, !dbg !2546
  %227 = getelementptr inbounds [6 x i32], ptr %13, i64 0, i64 3, !dbg !2546
  %228 = load i32, ptr %227, align 4, !dbg !2546
  %229 = getelementptr inbounds [6 x i32], ptr %13, i64 0, i64 4, !dbg !2546
  %230 = load i32, ptr %229, align 4, !dbg !2546
  %231 = getelementptr inbounds [6 x i32], ptr %13, i64 0, i64 5, !dbg !2546
  %232 = load i32, ptr %231, align 4, !dbg !2546
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.11, i32 noundef %205, i32 noundef %206, i32 noundef %207, i32 noundef %208, i32 noundef %210, i32 noundef %212, i32 noundef %214, i32 noundef %216, i32 noundef %218, i32 noundef %220, i32 noundef %222, i32 noundef %224, i32 noundef %226, i32 noundef %228, i32 noundef %230, i32 noundef %232), !dbg !2546
  %233 = load i32, ptr %9, align 4, !dbg !2548
  %234 = load i32, ptr %10, align 4, !dbg !2548
  %235 = load i32, ptr %9, align 4, !dbg !2548
  %236 = sext i32 %235 to i64, !dbg !2548
  %237 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %236, !dbg !2548
  %238 = getelementptr inbounds nuw %struct.segment, ptr %237, i32 0, i32 0, !dbg !2548
  %239 = load i32, ptr %10, align 4, !dbg !2548
  %240 = sext i32 %239 to i64, !dbg !2548
  %241 = getelementptr inbounds [6 x %struct.side], ptr %238, i64 0, i64 %240, !dbg !2548
  %242 = getelementptr inbounds nuw %struct.side, ptr %241, i32 0, i32 0, !dbg !2548
  %243 = load i8, ptr %242, align 4, !dbg !2548
  %244 = sext i8 %243 to i32, !dbg !2548
  %245 = load i32, ptr %9, align 4, !dbg !2548
  %246 = sext i32 %245 to i64, !dbg !2548
  %247 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %246, !dbg !2548
  %248 = getelementptr inbounds nuw %struct.segment, ptr %247, i32 0, i32 0, !dbg !2548
  %249 = load i32, ptr %10, align 4, !dbg !2548
  %250 = sext i32 %249 to i64, !dbg !2548
  %251 = getelementptr inbounds [6 x %struct.side], ptr %248, i64 0, i64 %250, !dbg !2548
  %252 = getelementptr inbounds nuw %struct.side, ptr %251, i32 0, i32 0, !dbg !2548
  %253 = load i8, ptr %252, align 4, !dbg !2548
  %254 = sext i8 %253 to i32, !dbg !2548
  %255 = sub nsw i32 5, %254, !dbg !2548
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.12, i32 noundef %233, i32 noundef %234, i32 noundef %244, i32 noundef %255), !dbg !2548
  %256 = load i32, ptr %9, align 4, !dbg !2549
  %257 = sext i32 %256 to i64, !dbg !2550
  %258 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %257, !dbg !2550
  %259 = getelementptr inbounds nuw %struct.segment, ptr %258, i32 0, i32 0, !dbg !2551
  %260 = load i32, ptr %10, align 4, !dbg !2552
  %261 = sext i32 %260 to i64, !dbg !2550
  %262 = getelementptr inbounds [6 x %struct.side], ptr %259, i64 0, i64 %261, !dbg !2550
  %263 = getelementptr inbounds nuw %struct.side, ptr %262, i32 0, i32 0, !dbg !2553
  %264 = load i8, ptr %263, align 4, !dbg !2553
  %265 = sext i8 %264 to i32, !dbg !2550
  %266 = sub nsw i32 5, %265, !dbg !2554
  %267 = trunc i32 %266 to i8, !dbg !2555
  %268 = load i32, ptr %9, align 4, !dbg !2556
  %269 = sext i32 %268 to i64, !dbg !2557
  %270 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %269, !dbg !2557
  %271 = getelementptr inbounds nuw %struct.segment, ptr %270, i32 0, i32 0, !dbg !2558
  %272 = load i32, ptr %10, align 4, !dbg !2559
  %273 = sext i32 %272 to i64, !dbg !2557
  %274 = getelementptr inbounds [6 x %struct.side], ptr %271, i64 0, i64 %273, !dbg !2557
  %275 = getelementptr inbounds nuw %struct.side, ptr %274, i32 0, i32 0, !dbg !2560
  store i8 %267, ptr %275, align 4, !dbg !2561
  br label %291, !dbg !2562

276:                                              ; preds = %198
  %277 = load i32, ptr %1, align 4, !dbg !2563
  %278 = load i32, ptr %2, align 4, !dbg !2565
  %279 = load i32, ptr %9, align 4, !dbg !2566
  %280 = load i32, ptr %10, align 4, !dbg !2567
  %281 = call noundef i32 @_Z11check_normsiiiiii(i32 noundef %277, i32 noundef %278, i32 noundef 0, i32 noundef %279, i32 noundef %280, i32 noundef 0), !dbg !2568
  %282 = load i32, ptr %3, align 4, !dbg !2569
  %283 = or i32 %282, %281, !dbg !2569
  store i32 %283, ptr %3, align 4, !dbg !2569
  %284 = load i32, ptr %1, align 4, !dbg !2570
  %285 = load i32, ptr %2, align 4, !dbg !2571
  %286 = load i32, ptr %9, align 4, !dbg !2572
  %287 = load i32, ptr %10, align 4, !dbg !2573
  %288 = call noundef i32 @_Z11check_normsiiiiii(i32 noundef %284, i32 noundef %285, i32 noundef 1, i32 noundef %286, i32 noundef %287, i32 noundef 1), !dbg !2574
  %289 = load i32, ptr %3, align 4, !dbg !2575
  %290 = or i32 %289, %288, !dbg !2575
  store i32 %290, ptr %3, align 4, !dbg !2575
  br label %291

291:                                              ; preds = %276, %204
  br label %416, !dbg !2576

292:                                              ; preds = %168
  %293 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 1, !dbg !2577
  %294 = load i32, ptr %293, align 4, !dbg !2577
  %295 = getelementptr inbounds [6 x i32], ptr %13, i64 0, i64 4, !dbg !2580
  %296 = load i32, ptr %295, align 4, !dbg !2580
  %297 = icmp ne i32 %294, %296, !dbg !2581
  br i1 %297, label %328, label %298, !dbg !2582

298:                                              ; preds = %292
  %299 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 4, !dbg !2583
  %300 = load i32, ptr %299, align 4, !dbg !2583
  %301 = getelementptr inbounds [6 x i32], ptr %13, i64 0, i64 1, !dbg !2584
  %302 = load i32, ptr %301, align 4, !dbg !2584
  %303 = icmp ne i32 %300, %302, !dbg !2585
  br i1 %303, label %328, label %304, !dbg !2586

304:                                              ; preds = %298
  %305 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 0, !dbg !2587
  %306 = load i32, ptr %305, align 4, !dbg !2587
  %307 = getelementptr inbounds [6 x i32], ptr %13, i64 0, i64 5, !dbg !2588
  %308 = load i32, ptr %307, align 4, !dbg !2588
  %309 = icmp ne i32 %306, %308, !dbg !2589
  br i1 %309, label %328, label %310, !dbg !2590

310:                                              ; preds = %304
  %311 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 5, !dbg !2591
  %312 = load i32, ptr %311, align 4, !dbg !2591
  %313 = getelementptr inbounds [6 x i32], ptr %13, i64 0, i64 0, !dbg !2592
  %314 = load i32, ptr %313, align 4, !dbg !2592
  %315 = icmp ne i32 %312, %314, !dbg !2593
  br i1 %315, label %328, label %316, !dbg !2594

316:                                              ; preds = %310
  %317 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 2, !dbg !2595
  %318 = load i32, ptr %317, align 4, !dbg !2595
  %319 = getelementptr inbounds [6 x i32], ptr %13, i64 0, i64 3, !dbg !2596
  %320 = load i32, ptr %319, align 4, !dbg !2596
  %321 = icmp ne i32 %318, %320, !dbg !2597
  br i1 %321, label %328, label %322, !dbg !2598

322:                                              ; preds = %316
  %323 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 3, !dbg !2599
  %324 = load i32, ptr %323, align 4, !dbg !2599
  %325 = getelementptr inbounds [6 x i32], ptr %13, i64 0, i64 2, !dbg !2600
  %326 = load i32, ptr %325, align 4, !dbg !2600
  %327 = icmp ne i32 %324, %326, !dbg !2601
  br i1 %327, label %328, label %400, !dbg !2598

328:                                              ; preds = %322, %316, %310, %304, %298, %292
  %329 = load i32, ptr %1, align 4, !dbg !2602
  %330 = load i32, ptr %2, align 4, !dbg !2602
  %331 = load i32, ptr %9, align 4, !dbg !2602
  %332 = load i32, ptr %10, align 4, !dbg !2602
  %333 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 0, !dbg !2602
  %334 = load i32, ptr %333, align 4, !dbg !2602
  %335 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 1, !dbg !2602
  %336 = load i32, ptr %335, align 4, !dbg !2602
  %337 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 2, !dbg !2602
  %338 = load i32, ptr %337, align 4, !dbg !2602
  %339 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 3, !dbg !2602
  %340 = load i32, ptr %339, align 4, !dbg !2602
  %341 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 4, !dbg !2602
  %342 = load i32, ptr %341, align 4, !dbg !2602
  %343 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 5, !dbg !2602
  %344 = load i32, ptr %343, align 4, !dbg !2602
  %345 = getelementptr inbounds [6 x i32], ptr %13, i64 0, i64 0, !dbg !2602
  %346 = load i32, ptr %345, align 4, !dbg !2602
  %347 = getelementptr inbounds [6 x i32], ptr %13, i64 0, i64 1, !dbg !2602
  %348 = load i32, ptr %347, align 4, !dbg !2602
  %349 = getelementptr inbounds [6 x i32], ptr %13, i64 0, i64 2, !dbg !2602
  %350 = load i32, ptr %349, align 4, !dbg !2602
  %351 = getelementptr inbounds [6 x i32], ptr %13, i64 0, i64 3, !dbg !2602
  %352 = load i32, ptr %351, align 4, !dbg !2602
  %353 = getelementptr inbounds [6 x i32], ptr %13, i64 0, i64 4, !dbg !2602
  %354 = load i32, ptr %353, align 4, !dbg !2602
  %355 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 5, !dbg !2602
  %356 = load i32, ptr %355, align 4, !dbg !2602
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.11, i32 noundef %329, i32 noundef %330, i32 noundef %331, i32 noundef %332, i32 noundef %334, i32 noundef %336, i32 noundef %338, i32 noundef %340, i32 noundef %342, i32 noundef %344, i32 noundef %346, i32 noundef %348, i32 noundef %350, i32 noundef %352, i32 noundef %354, i32 noundef %356), !dbg !2602
  %357 = load i32, ptr %9, align 4, !dbg !2604
  %358 = load i32, ptr %10, align 4, !dbg !2604
  %359 = load i32, ptr %9, align 4, !dbg !2604
  %360 = sext i32 %359 to i64, !dbg !2604
  %361 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %360, !dbg !2604
  %362 = getelementptr inbounds nuw %struct.segment, ptr %361, i32 0, i32 0, !dbg !2604
  %363 = load i32, ptr %10, align 4, !dbg !2604
  %364 = sext i32 %363 to i64, !dbg !2604
  %365 = getelementptr inbounds [6 x %struct.side], ptr %362, i64 0, i64 %364, !dbg !2604
  %366 = getelementptr inbounds nuw %struct.side, ptr %365, i32 0, i32 0, !dbg !2604
  %367 = load i8, ptr %366, align 4, !dbg !2604
  %368 = sext i8 %367 to i32, !dbg !2604
  %369 = load i32, ptr %9, align 4, !dbg !2604
  %370 = sext i32 %369 to i64, !dbg !2604
  %371 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %370, !dbg !2604
  %372 = getelementptr inbounds nuw %struct.segment, ptr %371, i32 0, i32 0, !dbg !2604
  %373 = load i32, ptr %10, align 4, !dbg !2604
  %374 = sext i32 %373 to i64, !dbg !2604
  %375 = getelementptr inbounds [6 x %struct.side], ptr %372, i64 0, i64 %374, !dbg !2604
  %376 = getelementptr inbounds nuw %struct.side, ptr %375, i32 0, i32 0, !dbg !2604
  %377 = load i8, ptr %376, align 4, !dbg !2604
  %378 = sext i8 %377 to i32, !dbg !2604
  %379 = sub nsw i32 5, %378, !dbg !2604
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 0, ptr noundef @.str.12, i32 noundef %357, i32 noundef %358, i32 noundef %368, i32 noundef %379), !dbg !2604
  %380 = load i32, ptr %9, align 4, !dbg !2605
  %381 = sext i32 %380 to i64, !dbg !2606
  %382 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %381, !dbg !2606
  %383 = getelementptr inbounds nuw %struct.segment, ptr %382, i32 0, i32 0, !dbg !2607
  %384 = load i32, ptr %10, align 4, !dbg !2608
  %385 = sext i32 %384 to i64, !dbg !2606
  %386 = getelementptr inbounds [6 x %struct.side], ptr %383, i64 0, i64 %385, !dbg !2606
  %387 = getelementptr inbounds nuw %struct.side, ptr %386, i32 0, i32 0, !dbg !2609
  %388 = load i8, ptr %387, align 4, !dbg !2609
  %389 = sext i8 %388 to i32, !dbg !2606
  %390 = sub nsw i32 5, %389, !dbg !2610
  %391 = trunc i32 %390 to i8, !dbg !2611
  %392 = load i32, ptr %9, align 4, !dbg !2612
  %393 = sext i32 %392 to i64, !dbg !2613
  %394 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %393, !dbg !2613
  %395 = getelementptr inbounds nuw %struct.segment, ptr %394, i32 0, i32 0, !dbg !2614
  %396 = load i32, ptr %10, align 4, !dbg !2615
  %397 = sext i32 %396 to i64, !dbg !2613
  %398 = getelementptr inbounds [6 x %struct.side], ptr %395, i64 0, i64 %397, !dbg !2613
  %399 = getelementptr inbounds nuw %struct.side, ptr %398, i32 0, i32 0, !dbg !2616
  store i8 %391, ptr %399, align 4, !dbg !2617
  br label %415, !dbg !2618

400:                                              ; preds = %322
  %401 = load i32, ptr %1, align 4, !dbg !2619
  %402 = load i32, ptr %2, align 4, !dbg !2621
  %403 = load i32, ptr %9, align 4, !dbg !2622
  %404 = load i32, ptr %10, align 4, !dbg !2623
  %405 = call noundef i32 @_Z11check_normsiiiiii(i32 noundef %401, i32 noundef %402, i32 noundef 0, i32 noundef %403, i32 noundef %404, i32 noundef 1), !dbg !2624
  %406 = load i32, ptr %3, align 4, !dbg !2625
  %407 = or i32 %406, %405, !dbg !2625
  store i32 %407, ptr %3, align 4, !dbg !2625
  %408 = load i32, ptr %1, align 4, !dbg !2626
  %409 = load i32, ptr %2, align 4, !dbg !2627
  %410 = load i32, ptr %9, align 4, !dbg !2628
  %411 = load i32, ptr %10, align 4, !dbg !2629
  %412 = call noundef i32 @_Z11check_normsiiiiii(i32 noundef %408, i32 noundef %409, i32 noundef 1, i32 noundef %410, i32 noundef %411, i32 noundef 0), !dbg !2630
  %413 = load i32, ptr %3, align 4, !dbg !2631
  %414 = or i32 %413, %412, !dbg !2631
  store i32 %414, ptr %3, align 4, !dbg !2631
  br label %415

415:                                              ; preds = %400, %328
  br label %416

416:                                              ; preds = %415, %291
  br label %417

417:                                              ; preds = %416, %167
  br label %418

418:                                              ; preds = %417, %69
  br label %419, !dbg !2632

419:                                              ; preds = %418, %26
  br label %420, !dbg !2633

420:                                              ; preds = %419, %53
  %421 = load i32, ptr %2, align 4, !dbg !2634
  %422 = add nsw i32 %421, 1, !dbg !2634
  store i32 %422, ptr %2, align 4, !dbg !2634
  br label %23, !dbg !2635, !llvm.loop !2636

423:                                              ; preds = %23
  br label %424, !dbg !2638

424:                                              ; preds = %423
  %425 = load i32, ptr %1, align 4, !dbg !2639
  %426 = add nsw i32 %425, 1, !dbg !2639
  store i32 %426, ptr %1, align 4, !dbg !2639
  br label %15, !dbg !2640, !llvm.loop !2641

427:                                              ; preds = %15
  %428 = load i32, ptr %3, align 4, !dbg !2643
  ret i32 %428, !dbg !2644
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z10trace_segsP10vms_vectorii(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 !dbg !2645 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca [6 x i32], align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
    #dbg_declare(ptr %5, !2648, !DIExpression(), !2649)
  store i32 %1, ptr %6, align 4
    #dbg_declare(ptr %6, !2650, !DIExpression(), !2651)
  store i32 %2, ptr %7, align 4
    #dbg_declare(ptr %7, !2652, !DIExpression(), !2653)
    #dbg_declare(ptr %8, !2654, !DIExpression(), !2655)
    #dbg_declare(ptr %9, !2656, !DIExpression(), !2657)
    #dbg_declare(ptr %10, !2658, !DIExpression(), !2660)
  %16 = load i32, ptr %6, align 4, !dbg !2661
  %17 = load i32, ptr @Highest_segment_index, align 4, !dbg !2661
  %18 = icmp sle i32 %16, %17, !dbg !2661
  br i1 %18, label %19, label %22, !dbg !2661

19:                                               ; preds = %3
  %20 = load i32, ptr %6, align 4, !dbg !2661
  %21 = icmp sge i32 %20, 0, !dbg !2661
  br label %22

22:                                               ; preds = %19, %3
  %23 = phi i1 [ false, %3 ], [ %21, %19 ], !dbg !2662
  %24 = zext i1 %23 to i32, !dbg !2661
  call void @_Z7_AssertiPKcS0_i(i32 noundef %24, ptr noundef @.str.13, ptr noundef @.str.2, i32 noundef 960), !dbg !2661
  %25 = load i32, ptr %7, align 4, !dbg !2663
  %26 = icmp sgt i32 %25, 1024, !dbg !2665
  br i1 %26, label %27, label %36, !dbg !2665

27:                                               ; preds = %22
  %28 = load i32, ptr @Doing_lighting_hack_flag, align 4, !dbg !2666
  %29 = icmp ne i32 %28, 0, !dbg !2666
  br i1 %29, label %31, label %30, !dbg !2669

30:                                               ; preds = %27
  call void @_Z4Int3v(), !dbg !2670
  br label %34, !dbg !2670

31:                                               ; preds = %27
  %32 = load ptr, ptr @__stderrp, align 8, !dbg !2671
  %33 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %32, ptr noundef @.str.14) #7, !dbg !2672
  br label %34

34:                                               ; preds = %31, %30
  %35 = load i32, ptr %6, align 4, !dbg !2673
  store i32 %35, ptr %4, align 4, !dbg !2674
  br label %116, !dbg !2674

36:                                               ; preds = %22
  %37 = load ptr, ptr %5, align 8, !dbg !2675
  %38 = load i32, ptr %6, align 4, !dbg !2676
  %39 = getelementptr inbounds [6 x i32], ptr %10, i64 0, i64 0, !dbg !2677
  %40 = call noundef zeroext i8 @_Z14get_side_distsP10vms_vectoriPi(ptr noundef %37, i32 noundef %38, ptr noundef %39), !dbg !2678
  %41 = zext i8 %40 to i32, !dbg !2678
  store i32 %41, ptr %8, align 4, !dbg !2679
  %42 = load i32, ptr %8, align 4, !dbg !2680
  %43 = icmp eq i32 %42, 0, !dbg !2682
  br i1 %43, label %44, label %46, !dbg !2682

44:                                               ; preds = %36
  %45 = load i32, ptr %6, align 4, !dbg !2683
  store i32 %45, ptr %4, align 4, !dbg !2684
  br label %116, !dbg !2684

46:                                               ; preds = %36
    #dbg_declare(ptr %11, !2685, !DIExpression(), !2687)
  br label %47, !dbg !2688

47:                                               ; preds = %112, %46
    #dbg_declare(ptr %12, !2689, !DIExpression(), !2691)
    #dbg_declare(ptr %13, !2692, !DIExpression(), !2693)
    #dbg_declare(ptr %14, !2694, !DIExpression(), !2695)
  %48 = load i32, ptr %6, align 4, !dbg !2696
  %49 = sext i32 %48 to i64, !dbg !2697
  %50 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %49, !dbg !2697
  store ptr %50, ptr %9, align 8, !dbg !2698
  store i32 -1, ptr %11, align 4, !dbg !2699
  store i32 0, ptr %14, align 4, !dbg !2700
  store i32 0, ptr %12, align 4, !dbg !2701
  store i32 1, ptr %13, align 4, !dbg !2703
  br label %51, !dbg !2704

51:                                               ; preds = %83, %47
  %52 = load i32, ptr %12, align 4, !dbg !2705
  %53 = icmp slt i32 %52, 6, !dbg !2707
  br i1 %53, label %54, label %88, !dbg !2708

54:                                               ; preds = %51
  %55 = load i32, ptr %8, align 4, !dbg !2709
  %56 = load i32, ptr %13, align 4, !dbg !2711
  %57 = and i32 %55, %56, !dbg !2712
  %58 = icmp ne i32 %57, 0, !dbg !2713
  br i1 %58, label %59, label %82, !dbg !2714

59:                                               ; preds = %54
  %60 = load ptr, ptr %9, align 8, !dbg !2715
  %61 = getelementptr inbounds nuw %struct.segment, ptr %60, i32 0, i32 1, !dbg !2716
  %62 = load i32, ptr %12, align 4, !dbg !2717
  %63 = sext i32 %62 to i64, !dbg !2715
  %64 = getelementptr inbounds [6 x i16], ptr %61, i64 0, i64 %63, !dbg !2715
  %65 = load i16, ptr %64, align 2, !dbg !2715
  %66 = sext i16 %65 to i32, !dbg !2715
  %67 = icmp sgt i32 %66, -1, !dbg !2718
  br i1 %67, label %68, label %82, !dbg !2714

68:                                               ; preds = %59
  %69 = load i32, ptr %12, align 4, !dbg !2719
  %70 = sext i32 %69 to i64, !dbg !2721
  %71 = getelementptr inbounds [6 x i32], ptr %10, i64 0, i64 %70, !dbg !2721
  %72 = load i32, ptr %71, align 4, !dbg !2721
  %73 = load i32, ptr %14, align 4, !dbg !2722
  %74 = icmp slt i32 %72, %73, !dbg !2723
  br i1 %74, label %75, label %81, !dbg !2723

75:                                               ; preds = %68
  %76 = load i32, ptr %12, align 4, !dbg !2724
  %77 = sext i32 %76 to i64, !dbg !2726
  %78 = getelementptr inbounds [6 x i32], ptr %10, i64 0, i64 %77, !dbg !2726
  %79 = load i32, ptr %78, align 4, !dbg !2726
  store i32 %79, ptr %14, align 4, !dbg !2727
  %80 = load i32, ptr %12, align 4, !dbg !2728
  store i32 %80, ptr %11, align 4, !dbg !2729
  br label %81, !dbg !2730

81:                                               ; preds = %75, %68
  br label %82, !dbg !2722

82:                                               ; preds = %81, %59, %54
  br label %83, !dbg !2731

83:                                               ; preds = %82
  %84 = load i32, ptr %12, align 4, !dbg !2732
  %85 = add nsw i32 %84, 1, !dbg !2732
  store i32 %85, ptr %12, align 4, !dbg !2732
  %86 = load i32, ptr %13, align 4, !dbg !2733
  %87 = shl i32 %86, 1, !dbg !2733
  store i32 %87, ptr %13, align 4, !dbg !2733
  br label %51, !dbg !2734, !llvm.loop !2735

88:                                               ; preds = %51
  %89 = load i32, ptr %11, align 4, !dbg !2737
  %90 = icmp ne i32 %89, -1, !dbg !2739
  br i1 %90, label %91, label %111, !dbg !2739

91:                                               ; preds = %88
    #dbg_declare(ptr %15, !2740, !DIExpression(), !2742)
  %92 = load i32, ptr %11, align 4, !dbg !2743
  %93 = sext i32 %92 to i64, !dbg !2744
  %94 = getelementptr inbounds [6 x i32], ptr %10, i64 0, i64 %93, !dbg !2744
  store i32 0, ptr %94, align 4, !dbg !2745
  %95 = load ptr, ptr %5, align 8, !dbg !2746
  %96 = load ptr, ptr %9, align 8, !dbg !2747
  %97 = getelementptr inbounds nuw %struct.segment, ptr %96, i32 0, i32 1, !dbg !2748
  %98 = load i32, ptr %11, align 4, !dbg !2749
  %99 = sext i32 %98 to i64, !dbg !2747
  %100 = getelementptr inbounds [6 x i16], ptr %97, i64 0, i64 %99, !dbg !2747
  %101 = load i16, ptr %100, align 2, !dbg !2747
  %102 = sext i16 %101 to i32, !dbg !2747
  %103 = load i32, ptr %7, align 4, !dbg !2750
  %104 = add nsw i32 %103, 1, !dbg !2751
  %105 = call noundef i32 @_Z10trace_segsP10vms_vectorii(ptr noundef %95, i32 noundef %102, i32 noundef %104), !dbg !2752
  store i32 %105, ptr %15, align 4, !dbg !2753
  %106 = load i32, ptr %15, align 4, !dbg !2754
  %107 = icmp ne i32 %106, -1, !dbg !2756
  br i1 %107, label %108, label %110, !dbg !2756

108:                                              ; preds = %91
  %109 = load i32, ptr %15, align 4, !dbg !2757
  store i32 %109, ptr %4, align 4, !dbg !2758
  br label %116, !dbg !2758

110:                                              ; preds = %91
  br label %111, !dbg !2759

111:                                              ; preds = %110, %88
  br label %112, !dbg !2760

112:                                              ; preds = %111
  %113 = load i32, ptr %11, align 4, !dbg !2761
  %114 = icmp ne i32 %113, -1, !dbg !2762
  br i1 %114, label %47, label %115, !dbg !2760, !llvm.loop !2763

115:                                              ; preds = %112
  store i32 -1, ptr %4, align 4, !dbg !2765
  br label %116, !dbg !2765

116:                                              ; preds = %115, %108, %44, %34
  %117 = load i32, ptr %4, align 4, !dbg !2766
  ret i32 %117, !dbg !2766
}

declare void @_Z4Int3v() #1

; Function Attrs: nounwind
declare i32 @fprintf(ptr noundef, ptr noundef, ...) #3

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z14find_point_segP10vms_vectori(ptr noundef %0, i32 noundef %1) #0 !dbg !2767 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.segmasks, align 2
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !2770, !DIExpression(), !2771)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !2772, !DIExpression(), !2773)
    #dbg_declare(ptr %6, !2774, !DIExpression(), !2775)
  %8 = load i32, ptr %5, align 4, !dbg !2776
  %9 = load i32, ptr @Highest_segment_index, align 4, !dbg !2776
  %10 = icmp sle i32 %8, %9, !dbg !2776
  br i1 %10, label %11, label %14, !dbg !2776

11:                                               ; preds = %2
  %12 = load i32, ptr %5, align 4, !dbg !2776
  %13 = icmp sge i32 %12, -1, !dbg !2776
  br label %14

14:                                               ; preds = %11, %2
  %15 = phi i1 [ false, %2 ], [ %13, %11 ], !dbg !2777
  %16 = zext i1 %15 to i32, !dbg !2776
  call void @_Z7_AssertiPKcS0_i(i32 noundef %16, ptr noundef @.str.15, ptr noundef @.str.2, i32 noundef 1096), !dbg !2776
  %17 = load i32, ptr %5, align 4, !dbg !2778
  %18 = icmp ne i32 %17, -1, !dbg !2780
  br i1 %18, label %19, label %28, !dbg !2780

19:                                               ; preds = %14
  %20 = load ptr, ptr %4, align 8, !dbg !2781
  %21 = load i32, ptr %5, align 4, !dbg !2783
  %22 = call noundef i32 @_Z10trace_segsP10vms_vectorii(ptr noundef %20, i32 noundef %21, i32 noundef 0), !dbg !2784
  store i32 %22, ptr %6, align 4, !dbg !2785
  %23 = load i32, ptr %6, align 4, !dbg !2786
  %24 = icmp ne i32 %23, -1, !dbg !2788
  br i1 %24, label %25, label %27, !dbg !2788

25:                                               ; preds = %19
  %26 = load i32, ptr %6, align 4, !dbg !2789
  store i32 %26, ptr %3, align 4, !dbg !2790
  br label %56, !dbg !2790

27:                                               ; preds = %19
  br label %28, !dbg !2791

28:                                               ; preds = %27, %14
  %29 = load i32, ptr @Doing_lighting_hack_flag, align 4, !dbg !2792
  %30 = icmp ne i32 %29, 0, !dbg !2792
  br i1 %30, label %55, label %31, !dbg !2794

31:                                               ; preds = %28
  %32 = load i32, ptr @Exhaustive_count, align 4, !dbg !2795
  %33 = add nsw i32 %32, 1, !dbg !2795
  store i32 %33, ptr @Exhaustive_count, align 4, !dbg !2795
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 1, ptr noundef @.str.16, i32 noundef %33), !dbg !2795
  store i32 0, ptr %6, align 4, !dbg !2797
  br label %34, !dbg !2799

34:                                               ; preds = %49, %31
  %35 = load i32, ptr %6, align 4, !dbg !2800
  %36 = load i32, ptr @Highest_segment_index, align 4, !dbg !2802
  %37 = icmp sle i32 %35, %36, !dbg !2803
  br i1 %37, label %38, label %52, !dbg !2804

38:                                               ; preds = %34
  %39 = load ptr, ptr %4, align 8, !dbg !2805
  %40 = load i32, ptr %6, align 4, !dbg !2807
  %41 = call i32 @_Z13get_seg_masksP10vms_vectorii(ptr noundef %39, i32 noundef %40, i32 noundef 0), !dbg !2808
  store i32 %41, ptr %7, align 2, !dbg !2808
  %42 = getelementptr inbounds nuw %struct.segmasks, ptr %7, i32 0, i32 2, !dbg !2809
  %43 = load i8, ptr %42, align 1, !dbg !2809
  %44 = sext i8 %43 to i32, !dbg !2808
  %45 = icmp eq i32 %44, 0, !dbg !2810
  br i1 %45, label %46, label %48, !dbg !2808

46:                                               ; preds = %38
  %47 = load i32, ptr %6, align 4, !dbg !2811
  store i32 %47, ptr %3, align 4, !dbg !2812
  br label %56, !dbg !2812

48:                                               ; preds = %38
  br label %49, !dbg !2813

49:                                               ; preds = %48
  %50 = load i32, ptr %6, align 4, !dbg !2814
  %51 = add nsw i32 %50, 1, !dbg !2814
  store i32 %51, ptr %6, align 4, !dbg !2814
  br label %34, !dbg !2815, !llvm.loop !2816

52:                                               ; preds = %34
  %53 = load i32, ptr @Exhaustive_failed_count, align 4, !dbg !2818
  %54 = add nsw i32 %53, 1, !dbg !2818
  store i32 %54, ptr @Exhaustive_failed_count, align 4, !dbg !2818
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 1, ptr noundef @.str.17, i32 noundef %54), !dbg !2818
  store i32 -1, ptr %3, align 4, !dbg !2819
  br label %56, !dbg !2819

55:                                               ; preds = %28
  store i32 -1, ptr %3, align 4, !dbg !2820
  br label %56, !dbg !2820

56:                                               ; preds = %55, %52, %46, %25
  %57 = load i32, ptr %3, align 4, !dbg !2821
  ret i32 %57, !dbg !2821
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define void @_Z15flush_fcd_cachev() #2 !dbg !2822 {
  %1 = alloca i32, align 4
    #dbg_declare(ptr %1, !2823, !DIExpression(), !2824)
  store i32 0, ptr @Fcd_index, align 4, !dbg !2825
  store i32 0, ptr %1, align 4, !dbg !2826
  br label %2, !dbg !2828

2:                                                ; preds = %10, %0
  %3 = load i32, ptr %1, align 4, !dbg !2829
  %4 = icmp slt i32 %3, 8, !dbg !2831
  br i1 %4, label %5, label %13, !dbg !2832

5:                                                ; preds = %2
  %6 = load i32, ptr %1, align 4, !dbg !2833
  %7 = sext i32 %6 to i64, !dbg !2834
  %8 = getelementptr inbounds [8 x %struct.fcd_data], ptr @Fcd_cache, i64 0, i64 %7, !dbg !2834
  %9 = getelementptr inbounds nuw %struct.fcd_data, ptr %8, i32 0, i32 0, !dbg !2835
  store i32 -1, ptr %9, align 4, !dbg !2836
  br label %10, !dbg !2834

10:                                               ; preds = %5
  %11 = load i32, ptr %1, align 4, !dbg !2837
  %12 = add nsw i32 %11, 1, !dbg !2837
  store i32 %12, ptr %1, align 4, !dbg !2837
  br label %2, !dbg !2838, !llvm.loop !2839

13:                                               ; preds = %2
  ret void, !dbg !2841
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define void @_Z16add_to_fcd_cacheiiii(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #2 !dbg !2842 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
    #dbg_declare(ptr %5, !2845, !DIExpression(), !2846)
  store i32 %1, ptr %6, align 4
    #dbg_declare(ptr %6, !2847, !DIExpression(), !2848)
  store i32 %2, ptr %7, align 4
    #dbg_declare(ptr %7, !2849, !DIExpression(), !2850)
  store i32 %3, ptr %8, align 4
    #dbg_declare(ptr %8, !2851, !DIExpression(), !2852)
  %10 = load i32, ptr %8, align 4, !dbg !2853
  %11 = icmp sgt i32 %10, 5242880, !dbg !2855
  br i1 %11, label %12, label %39, !dbg !2855

12:                                               ; preds = %4
  %13 = load i32, ptr %5, align 4, !dbg !2856
  %14 = load i32, ptr @Fcd_index, align 4, !dbg !2858
  %15 = sext i32 %14 to i64, !dbg !2859
  %16 = getelementptr inbounds [8 x %struct.fcd_data], ptr @Fcd_cache, i64 0, i64 %15, !dbg !2859
  %17 = getelementptr inbounds nuw %struct.fcd_data, ptr %16, i32 0, i32 0, !dbg !2860
  store i32 %13, ptr %17, align 4, !dbg !2861
  %18 = load i32, ptr %6, align 4, !dbg !2862
  %19 = load i32, ptr @Fcd_index, align 4, !dbg !2863
  %20 = sext i32 %19 to i64, !dbg !2864
  %21 = getelementptr inbounds [8 x %struct.fcd_data], ptr @Fcd_cache, i64 0, i64 %20, !dbg !2864
  %22 = getelementptr inbounds nuw %struct.fcd_data, ptr %21, i32 0, i32 1, !dbg !2865
  store i32 %18, ptr %22, align 4, !dbg !2866
  %23 = load i32, ptr %7, align 4, !dbg !2867
  %24 = load i32, ptr @Fcd_index, align 4, !dbg !2868
  %25 = sext i32 %24 to i64, !dbg !2869
  %26 = getelementptr inbounds [8 x %struct.fcd_data], ptr @Fcd_cache, i64 0, i64 %25, !dbg !2869
  %27 = getelementptr inbounds nuw %struct.fcd_data, ptr %26, i32 0, i32 2, !dbg !2870
  store i32 %23, ptr %27, align 4, !dbg !2871
  %28 = load i32, ptr %8, align 4, !dbg !2872
  %29 = load i32, ptr @Fcd_index, align 4, !dbg !2873
  %30 = sext i32 %29 to i64, !dbg !2874
  %31 = getelementptr inbounds [8 x %struct.fcd_data], ptr @Fcd_cache, i64 0, i64 %30, !dbg !2874
  %32 = getelementptr inbounds nuw %struct.fcd_data, ptr %31, i32 0, i32 3, !dbg !2875
  store i32 %28, ptr %32, align 4, !dbg !2876
  %33 = load i32, ptr @Fcd_index, align 4, !dbg !2877
  %34 = add nsw i32 %33, 1, !dbg !2877
  store i32 %34, ptr @Fcd_index, align 4, !dbg !2877
  %35 = load i32, ptr @Fcd_index, align 4, !dbg !2878
  %36 = icmp sge i32 %35, 8, !dbg !2880
  br i1 %36, label %37, label %38, !dbg !2880

37:                                               ; preds = %12
  store i32 0, ptr @Fcd_index, align 4, !dbg !2881
  br label %38, !dbg !2882

38:                                               ; preds = %37, %12
  br label %71, !dbg !2883

39:                                               ; preds = %4
    #dbg_declare(ptr %9, !2884, !DIExpression(), !2886)
  store i32 0, ptr %9, align 4, !dbg !2887
  br label %40, !dbg !2889

40:                                               ; preds = %66, %39
  %41 = load i32, ptr %9, align 4, !dbg !2890
  %42 = icmp slt i32 %41, 8, !dbg !2892
  br i1 %42, label %43, label %69, !dbg !2893

43:                                               ; preds = %40
  %44 = load i32, ptr %9, align 4, !dbg !2894
  %45 = sext i32 %44 to i64, !dbg !2896
  %46 = getelementptr inbounds [8 x %struct.fcd_data], ptr @Fcd_cache, i64 0, i64 %45, !dbg !2896
  %47 = getelementptr inbounds nuw %struct.fcd_data, ptr %46, i32 0, i32 0, !dbg !2897
  %48 = load i32, ptr %47, align 4, !dbg !2897
  %49 = load i32, ptr %5, align 4, !dbg !2898
  %50 = icmp eq i32 %48, %49, !dbg !2899
  br i1 %50, label %51, label %65, !dbg !2899

51:                                               ; preds = %43
  %52 = load i32, ptr %9, align 4, !dbg !2900
  %53 = sext i32 %52 to i64, !dbg !2902
  %54 = getelementptr inbounds [8 x %struct.fcd_data], ptr @Fcd_cache, i64 0, i64 %53, !dbg !2902
  %55 = getelementptr inbounds nuw %struct.fcd_data, ptr %54, i32 0, i32 1, !dbg !2903
  %56 = load i32, ptr %55, align 4, !dbg !2903
  %57 = load i32, ptr %6, align 4, !dbg !2904
  %58 = icmp eq i32 %56, %57, !dbg !2905
  br i1 %58, label %59, label %64, !dbg !2905

59:                                               ; preds = %51
  %60 = load i32, ptr @Fcd_index, align 4, !dbg !2906
  %61 = sext i32 %60 to i64, !dbg !2908
  %62 = getelementptr inbounds [8 x %struct.fcd_data], ptr @Fcd_cache, i64 0, i64 %61, !dbg !2908
  %63 = getelementptr inbounds nuw %struct.fcd_data, ptr %62, i32 0, i32 0, !dbg !2909
  store i32 -1, ptr %63, align 4, !dbg !2910
  br label %70, !dbg !2911

64:                                               ; preds = %51
  br label %65, !dbg !2904

65:                                               ; preds = %64, %43
  br label %66, !dbg !2898

66:                                               ; preds = %65
  %67 = load i32, ptr %9, align 4, !dbg !2912
  %68 = add nsw i32 %67, 1, !dbg !2912
  store i32 %68, ptr %9, align 4, !dbg !2912
  br label %40, !dbg !2913, !llvm.loop !2914

69:                                               ; preds = %40
  br label %70

70:                                               ; preds = %69, %59
  br label %71

71:                                               ; preds = %70, %38
  ret void, !dbg !2916
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z23find_connected_distanceP10vms_vectoriS0_iii(ptr noundef %0, i32 noundef %1, ptr noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5) #0 !dbg !2917 {
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca [900 x i8], align 1
  %20 = alloca [900 x %struct.seg_seg], align 2
  %21 = alloca [900 x i16], align 2
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca [64 x %struct.point_seg], align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca ptr, align 8
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca i32, align 4
  %32 = alloca i32, align 4
  store ptr %0, ptr %8, align 8
    #dbg_declare(ptr %8, !2920, !DIExpression(), !2921)
  store i32 %1, ptr %9, align 4
    #dbg_declare(ptr %9, !2922, !DIExpression(), !2923)
  store ptr %2, ptr %10, align 8
    #dbg_declare(ptr %10, !2924, !DIExpression(), !2925)
  store i32 %3, ptr %11, align 4
    #dbg_declare(ptr %11, !2926, !DIExpression(), !2927)
  store i32 %4, ptr %12, align 4
    #dbg_declare(ptr %12, !2928, !DIExpression(), !2929)
  store i32 %5, ptr %13, align 4
    #dbg_declare(ptr %13, !2930, !DIExpression(), !2931)
    #dbg_declare(ptr %14, !2932, !DIExpression(), !2933)
    #dbg_declare(ptr %15, !2934, !DIExpression(), !2935)
    #dbg_declare(ptr %16, !2936, !DIExpression(), !2937)
  store i32 0, ptr %16, align 4, !dbg !2937
    #dbg_declare(ptr %17, !2938, !DIExpression(), !2939)
  store i32 0, ptr %17, align 4, !dbg !2939
    #dbg_declare(ptr %18, !2940, !DIExpression(), !2941)
    #dbg_declare(ptr %19, !2942, !DIExpression(), !2944)
    #dbg_declare(ptr %20, !2945, !DIExpression(), !2953)
    #dbg_declare(ptr %21, !2954, !DIExpression(), !2956)
    #dbg_declare(ptr %22, !2957, !DIExpression(), !2958)
    #dbg_declare(ptr %23, !2959, !DIExpression(), !2960)
    #dbg_declare(ptr %24, !2961, !DIExpression(), !2970)
    #dbg_declare(ptr %25, !2971, !DIExpression(), !2972)
  %33 = load i32, ptr %12, align 4, !dbg !2973
  %34 = icmp sgt i32 %33, 62, !dbg !2975
  br i1 %34, label %35, label %37, !dbg !2975

35:                                               ; preds = %6
  %36 = load i32, ptr %12, align 4, !dbg !2976
  call void (i32, ptr, ...) @_Z8_mprintfiPKcz(i32 noundef 1, ptr noundef @.str.18, i32 noundef %36, i32 noundef 62), !dbg !2976
  store i32 62, ptr %12, align 4, !dbg !2978
  br label %37, !dbg !2979

37:                                               ; preds = %35, %6
  %38 = load i32, ptr %9, align 4, !dbg !2980
  %39 = load i32, ptr %11, align 4, !dbg !2982
  %40 = icmp eq i32 %38, %39, !dbg !2983
  br i1 %40, label %41, label %45, !dbg !2983

41:                                               ; preds = %37
  store i32 0, ptr @Connected_segment_distance, align 4, !dbg !2984
  %42 = load ptr, ptr %8, align 8, !dbg !2986
  %43 = load ptr, ptr %10, align 8, !dbg !2987
  %44 = call noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef %42, ptr noundef %43), !dbg !2988
  store i32 %44, ptr %7, align 4, !dbg !2989
  br label %452, !dbg !2989

45:                                               ; preds = %37
    #dbg_declare(ptr %26, !2990, !DIExpression(), !2992)
  %46 = load i32, ptr %9, align 4, !dbg !2993
  %47 = sext i32 %46 to i64, !dbg !2995
  %48 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %47, !dbg !2995
  %49 = load i32, ptr %11, align 4, !dbg !2996
  %50 = sext i32 %49 to i64, !dbg !2997
  %51 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %50, !dbg !2997
  %52 = call noundef i32 @_Z17find_connect_sideP7segmentS0_(ptr noundef %48, ptr noundef %51), !dbg !2998
  store i32 %52, ptr %26, align 4, !dbg !2999
  %53 = icmp ne i32 %52, -1, !dbg !3000
  br i1 %53, label %54, label %111, !dbg !3000

54:                                               ; preds = %45
  %55 = load i32, ptr %11, align 4, !dbg !3001
  %56 = sext i32 %55 to i64, !dbg !3001
  %57 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %56, !dbg !3001
  %58 = getelementptr inbounds nuw %struct.segment, ptr %57, i32 0, i32 1, !dbg !3001
  %59 = load i32, ptr %26, align 4, !dbg !3001
  %60 = sext i32 %59 to i64, !dbg !3001
  %61 = getelementptr inbounds [6 x i16], ptr %58, i64 0, i64 %60, !dbg !3001
  %62 = load i16, ptr %61, align 2, !dbg !3001
  %63 = sext i16 %62 to i32, !dbg !3001
  %64 = icmp eq i32 %63, -1, !dbg !3001
  br i1 %64, label %65, label %66, !dbg !3001

65:                                               ; preds = %54
  br label %101, !dbg !3001

66:                                               ; preds = %54
  %67 = load i32, ptr %11, align 4, !dbg !3001
  %68 = sext i32 %67 to i64, !dbg !3001
  %69 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %68, !dbg !3001
  %70 = getelementptr inbounds nuw %struct.segment, ptr %69, i32 0, i32 1, !dbg !3001
  %71 = load i32, ptr %26, align 4, !dbg !3001
  %72 = sext i32 %71 to i64, !dbg !3001
  %73 = getelementptr inbounds [6 x i16], ptr %70, i64 0, i64 %72, !dbg !3001
  %74 = load i16, ptr %73, align 2, !dbg !3001
  %75 = sext i16 %74 to i32, !dbg !3001
  %76 = icmp eq i32 %75, -2, !dbg !3001
  br i1 %76, label %77, label %78, !dbg !3001

77:                                               ; preds = %66
  br label %99, !dbg !3001

78:                                               ; preds = %66
  %79 = load i32, ptr %11, align 4, !dbg !3001
  %80 = sext i32 %79 to i64, !dbg !3001
  %81 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %80, !dbg !3001
  %82 = getelementptr inbounds nuw %struct.segment, ptr %81, i32 0, i32 0, !dbg !3001
  %83 = load i32, ptr %26, align 4, !dbg !3001
  %84 = sext i32 %83 to i64, !dbg !3001
  %85 = getelementptr inbounds [6 x %struct.side], ptr %82, i64 0, i64 %84, !dbg !3001
  %86 = getelementptr inbounds nuw %struct.side, ptr %85, i32 0, i32 2, !dbg !3001
  %87 = load i16, ptr %86, align 2, !dbg !3001
  %88 = sext i16 %87 to i32, !dbg !3001
  %89 = icmp eq i32 %88, -1, !dbg !3001
  br i1 %89, label %90, label %91, !dbg !3001

90:                                               ; preds = %78
  br label %97, !dbg !3001

91:                                               ; preds = %78
  %92 = load i32, ptr %11, align 4, !dbg !3001
  %93 = sext i32 %92 to i64, !dbg !3001
  %94 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %93, !dbg !3001
  %95 = load i32, ptr %26, align 4, !dbg !3001
  %96 = call noundef i32 @_Z15wall_is_doorwayP7segmenti(ptr noundef %94, i32 noundef %95), !dbg !3001
  br label %97, !dbg !3001

97:                                               ; preds = %91, %90
  %98 = phi i32 [ 5, %90 ], [ %96, %91 ], !dbg !3001
  br label %99, !dbg !3001

99:                                               ; preds = %97, %77
  %100 = phi i32 [ 8, %77 ], [ %98, %97 ], !dbg !3001
  br label %101, !dbg !3001

101:                                              ; preds = %99, %65
  %102 = phi i32 [ 2, %65 ], [ %100, %99 ], !dbg !3001
  %103 = load i32, ptr %13, align 4, !dbg !3004
  %104 = and i32 %102, %103, !dbg !3005
  %105 = icmp ne i32 %104, 0, !dbg !3001
  br i1 %105, label %106, label %110, !dbg !3001

106:                                              ; preds = %101
  store i32 1, ptr @Connected_segment_distance, align 4, !dbg !3006
  %107 = load ptr, ptr %8, align 8, !dbg !3008
  %108 = load ptr, ptr %10, align 8, !dbg !3009
  %109 = call noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef %107, ptr noundef %108), !dbg !3010
  store i32 %109, ptr %7, align 4, !dbg !3011
  br label %452, !dbg !3011

110:                                              ; preds = %101
  br label %111, !dbg !3012

111:                                              ; preds = %110, %45
  br label %112

112:                                              ; preds = %111
  %113 = load i32, ptr @GameTime, align 4, !dbg !3013
  %114 = load i32, ptr @Last_fcd_flush_time, align 4, !dbg !3015
  %115 = sub nsw i32 %113, %114, !dbg !3016
  %116 = icmp sgt i32 %115, 131072, !dbg !3017
  br i1 %116, label %121, label %117, !dbg !3018

117:                                              ; preds = %112
  %118 = load i32, ptr @GameTime, align 4, !dbg !3019
  %119 = load i32, ptr @Last_fcd_flush_time, align 4, !dbg !3020
  %120 = icmp slt i32 %118, %119, !dbg !3021
  br i1 %120, label %121, label %123, !dbg !3018

121:                                              ; preds = %117, %112
  call void @_Z15flush_fcd_cachev(), !dbg !3022
  %122 = load i32, ptr @GameTime, align 4, !dbg !3024
  store i32 %122, ptr @Last_fcd_flush_time, align 4, !dbg !3025
  br label %123, !dbg !3026

123:                                              ; preds = %121, %117
  store i32 0, ptr %18, align 4, !dbg !3027
  br label %124, !dbg !3029

124:                                              ; preds = %155, %123
  %125 = load i32, ptr %18, align 4, !dbg !3030
  %126 = icmp slt i32 %125, 8, !dbg !3032
  br i1 %126, label %127, label %158, !dbg !3033

127:                                              ; preds = %124
  %128 = load i32, ptr %18, align 4, !dbg !3034
  %129 = sext i32 %128 to i64, !dbg !3036
  %130 = getelementptr inbounds [8 x %struct.fcd_data], ptr @Fcd_cache, i64 0, i64 %129, !dbg !3036
  %131 = getelementptr inbounds nuw %struct.fcd_data, ptr %130, i32 0, i32 0, !dbg !3037
  %132 = load i32, ptr %131, align 4, !dbg !3037
  %133 = load i32, ptr %9, align 4, !dbg !3038
  %134 = icmp eq i32 %132, %133, !dbg !3039
  br i1 %134, label %135, label %154, !dbg !3040

135:                                              ; preds = %127
  %136 = load i32, ptr %18, align 4, !dbg !3041
  %137 = sext i32 %136 to i64, !dbg !3042
  %138 = getelementptr inbounds [8 x %struct.fcd_data], ptr @Fcd_cache, i64 0, i64 %137, !dbg !3042
  %139 = getelementptr inbounds nuw %struct.fcd_data, ptr %138, i32 0, i32 1, !dbg !3043
  %140 = load i32, ptr %139, align 4, !dbg !3043
  %141 = load i32, ptr %11, align 4, !dbg !3044
  %142 = icmp eq i32 %140, %141, !dbg !3045
  br i1 %142, label %143, label %154, !dbg !3040

143:                                              ; preds = %135
  %144 = load i32, ptr %18, align 4, !dbg !3046
  %145 = sext i32 %144 to i64, !dbg !3048
  %146 = getelementptr inbounds [8 x %struct.fcd_data], ptr @Fcd_cache, i64 0, i64 %145, !dbg !3048
  %147 = getelementptr inbounds nuw %struct.fcd_data, ptr %146, i32 0, i32 2, !dbg !3049
  %148 = load i32, ptr %147, align 4, !dbg !3049
  store i32 %148, ptr @Connected_segment_distance, align 4, !dbg !3050
  %149 = load i32, ptr %18, align 4, !dbg !3051
  %150 = sext i32 %149 to i64, !dbg !3052
  %151 = getelementptr inbounds [8 x %struct.fcd_data], ptr @Fcd_cache, i64 0, i64 %150, !dbg !3052
  %152 = getelementptr inbounds nuw %struct.fcd_data, ptr %151, i32 0, i32 3, !dbg !3053
  %153 = load i32, ptr %152, align 4, !dbg !3053
  store i32 %153, ptr %7, align 4, !dbg !3054
  br label %452, !dbg !3054

154:                                              ; preds = %135, %127
  br label %155, !dbg !3055

155:                                              ; preds = %154
  %156 = load i32, ptr %18, align 4, !dbg !3056
  %157 = add nsw i32 %156, 1, !dbg !3056
  store i32 %157, ptr %18, align 4, !dbg !3056
  br label %124, !dbg !3057, !llvm.loop !3058

158:                                              ; preds = %124
  store i32 0, ptr %23, align 4, !dbg !3060
  %159 = getelementptr inbounds [900 x i8], ptr %19, i64 0, i64 0, !dbg !3061
  %160 = load i32, ptr @Highest_segment_index, align 4, !dbg !3062
  %161 = add nsw i32 %160, 1, !dbg !3063
  %162 = sext i32 %161 to i64, !dbg !3062
  call void @llvm.memset.p0.i64(ptr align 1 %159, i8 0, i64 %162, i1 false), !dbg !3061
  %163 = getelementptr inbounds [900 x i16], ptr %21, i64 0, i64 0, !dbg !3064
  %164 = load i32, ptr @Highest_segment_index, align 4, !dbg !3065
  %165 = add nsw i32 %164, 1, !dbg !3066
  %166 = sext i32 %165 to i64, !dbg !3067
  %167 = mul i64 2, %166, !dbg !3068
  call void @llvm.memset.p0.i64(ptr align 2 %163, i8 0, i64 %167, i1 false), !dbg !3064
  %168 = load i32, ptr %9, align 4, !dbg !3069
  store i32 %168, ptr %14, align 4, !dbg !3070
  %169 = load i32, ptr %14, align 4, !dbg !3071
  %170 = sext i32 %169 to i64, !dbg !3072
  %171 = getelementptr inbounds [900 x i8], ptr %19, i64 0, i64 %170, !dbg !3072
  store i8 1, ptr %171, align 1, !dbg !3073
  store i32 0, ptr %22, align 4, !dbg !3074
  br label %172, !dbg !3075

172:                                              ; preds = %314, %158
  %173 = load i32, ptr %14, align 4, !dbg !3076
  %174 = load i32, ptr %11, align 4, !dbg !3077
  %175 = icmp ne i32 %173, %174, !dbg !3078
  br i1 %175, label %176, label %315, !dbg !3075

176:                                              ; preds = %172
    #dbg_declare(ptr %27, !3079, !DIExpression(), !3081)
  %177 = load i32, ptr %14, align 4, !dbg !3082
  %178 = sext i32 %177 to i64, !dbg !3083
  %179 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %178, !dbg !3083
  store ptr %179, ptr %27, align 8, !dbg !3081
  store i32 0, ptr %15, align 4, !dbg !3084
  br label %180, !dbg !3086

180:                                              ; preds = %289, %176
  %181 = load i32, ptr %15, align 4, !dbg !3087
  %182 = icmp slt i32 %181, 6, !dbg !3089
  br i1 %182, label %183, label %292, !dbg !3090

183:                                              ; preds = %180
    #dbg_declare(ptr %28, !3091, !DIExpression(), !3093)
  %184 = load i32, ptr %15, align 4, !dbg !3094
  store i32 %184, ptr %28, align 4, !dbg !3093
  %185 = load ptr, ptr %27, align 8, !dbg !3095
  %186 = getelementptr inbounds nuw %struct.segment, ptr %185, i32 0, i32 1, !dbg !3095
  %187 = load i32, ptr %28, align 4, !dbg !3095
  %188 = sext i32 %187 to i64, !dbg !3095
  %189 = getelementptr inbounds [6 x i16], ptr %186, i64 0, i64 %188, !dbg !3095
  %190 = load i16, ptr %189, align 2, !dbg !3095
  %191 = sext i16 %190 to i32, !dbg !3095
  %192 = icmp eq i32 %191, -1, !dbg !3095
  br i1 %192, label %193, label %194, !dbg !3095

193:                                              ; preds = %183
  br label %223, !dbg !3095

194:                                              ; preds = %183
  %195 = load ptr, ptr %27, align 8, !dbg !3095
  %196 = getelementptr inbounds nuw %struct.segment, ptr %195, i32 0, i32 1, !dbg !3095
  %197 = load i32, ptr %28, align 4, !dbg !3095
  %198 = sext i32 %197 to i64, !dbg !3095
  %199 = getelementptr inbounds [6 x i16], ptr %196, i64 0, i64 %198, !dbg !3095
  %200 = load i16, ptr %199, align 2, !dbg !3095
  %201 = sext i16 %200 to i32, !dbg !3095
  %202 = icmp eq i32 %201, -2, !dbg !3095
  br i1 %202, label %203, label %204, !dbg !3095

203:                                              ; preds = %194
  br label %221, !dbg !3095

204:                                              ; preds = %194
  %205 = load ptr, ptr %27, align 8, !dbg !3095
  %206 = getelementptr inbounds nuw %struct.segment, ptr %205, i32 0, i32 0, !dbg !3095
  %207 = load i32, ptr %28, align 4, !dbg !3095
  %208 = sext i32 %207 to i64, !dbg !3095
  %209 = getelementptr inbounds [6 x %struct.side], ptr %206, i64 0, i64 %208, !dbg !3095
  %210 = getelementptr inbounds nuw %struct.side, ptr %209, i32 0, i32 2, !dbg !3095
  %211 = load i16, ptr %210, align 2, !dbg !3095
  %212 = sext i16 %211 to i32, !dbg !3095
  %213 = icmp eq i32 %212, -1, !dbg !3095
  br i1 %213, label %214, label %215, !dbg !3095

214:                                              ; preds = %204
  br label %219, !dbg !3095

215:                                              ; preds = %204
  %216 = load ptr, ptr %27, align 8, !dbg !3095
  %217 = load i32, ptr %28, align 4, !dbg !3095
  %218 = call noundef i32 @_Z15wall_is_doorwayP7segmenti(ptr noundef %216, i32 noundef %217), !dbg !3095
  br label %219, !dbg !3095

219:                                              ; preds = %215, %214
  %220 = phi i32 [ 5, %214 ], [ %218, %215 ], !dbg !3095
  br label %221, !dbg !3095

221:                                              ; preds = %219, %203
  %222 = phi i32 [ 8, %203 ], [ %220, %219 ], !dbg !3095
  br label %223, !dbg !3095

223:                                              ; preds = %221, %193
  %224 = phi i32 [ 2, %193 ], [ %222, %221 ], !dbg !3095
  %225 = load i32, ptr %13, align 4, !dbg !3097
  %226 = and i32 %224, %225, !dbg !3098
  %227 = icmp ne i32 %226, 0, !dbg !3095
  br i1 %227, label %228, label %288, !dbg !3095

228:                                              ; preds = %223
    #dbg_declare(ptr %29, !3099, !DIExpression(), !3101)
  %229 = load ptr, ptr %27, align 8, !dbg !3102
  %230 = getelementptr inbounds nuw %struct.segment, ptr %229, i32 0, i32 1, !dbg !3103
  %231 = load i32, ptr %28, align 4, !dbg !3104
  %232 = sext i32 %231 to i64, !dbg !3102
  %233 = getelementptr inbounds [6 x i16], ptr %230, i64 0, i64 %232, !dbg !3102
  %234 = load i16, ptr %233, align 2, !dbg !3102
  %235 = sext i16 %234 to i32, !dbg !3102
  store i32 %235, ptr %29, align 4, !dbg !3101
  %236 = load i32, ptr %29, align 4, !dbg !3105
  %237 = sext i32 %236 to i64, !dbg !3107
  %238 = getelementptr inbounds [900 x i8], ptr %19, i64 0, i64 %237, !dbg !3107
  %239 = load i8, ptr %238, align 1, !dbg !3107
  %240 = icmp ne i8 %239, 0, !dbg !3107
  br i1 %240, label %287, label %241, !dbg !3108

241:                                              ; preds = %228
  %242 = load i32, ptr %14, align 4, !dbg !3109
  %243 = trunc i32 %242 to i16, !dbg !3109
  %244 = load i32, ptr %16, align 4, !dbg !3111
  %245 = sext i32 %244 to i64, !dbg !3112
  %246 = getelementptr inbounds [900 x %struct.seg_seg], ptr %20, i64 0, i64 %245, !dbg !3112
  %247 = getelementptr inbounds nuw %struct.seg_seg, ptr %246, i32 0, i32 0, !dbg !3113
  store i16 %243, ptr %247, align 2, !dbg !3114
  %248 = load i32, ptr %29, align 4, !dbg !3115
  %249 = trunc i32 %248 to i16, !dbg !3115
  %250 = load i32, ptr %16, align 4, !dbg !3116
  %251 = sext i32 %250 to i64, !dbg !3117
  %252 = getelementptr inbounds [900 x %struct.seg_seg], ptr %20, i64 0, i64 %251, !dbg !3117
  %253 = getelementptr inbounds nuw %struct.seg_seg, ptr %252, i32 0, i32 1, !dbg !3118
  store i16 %249, ptr %253, align 2, !dbg !3119
  %254 = load i32, ptr %29, align 4, !dbg !3120
  %255 = sext i32 %254 to i64, !dbg !3121
  %256 = getelementptr inbounds [900 x i8], ptr %19, i64 0, i64 %255, !dbg !3121
  store i8 1, ptr %256, align 1, !dbg !3122
  %257 = load i32, ptr %22, align 4, !dbg !3123
  %258 = add nsw i32 %257, 1, !dbg !3124
  %259 = trunc i32 %258 to i16, !dbg !3123
  %260 = load i32, ptr %16, align 4, !dbg !3125
  %261 = add nsw i32 %260, 1, !dbg !3125
  store i32 %261, ptr %16, align 4, !dbg !3125
  %262 = sext i32 %260 to i64, !dbg !3126
  %263 = getelementptr inbounds [900 x i16], ptr %21, i64 0, i64 %262, !dbg !3126
  store i16 %259, ptr %263, align 2, !dbg !3127
  %264 = load i32, ptr %12, align 4, !dbg !3128
  %265 = icmp ne i32 %264, -1, !dbg !3130
  br i1 %265, label %266, label %280, !dbg !3130

266:                                              ; preds = %241
  %267 = load i32, ptr %16, align 4, !dbg !3131
  %268 = sub nsw i32 %267, 1, !dbg !3134
  %269 = sext i32 %268 to i64, !dbg !3135
  %270 = getelementptr inbounds [900 x i16], ptr %21, i64 0, i64 %269, !dbg !3135
  %271 = load i16, ptr %270, align 2, !dbg !3135
  %272 = sext i16 %271 to i32, !dbg !3135
  %273 = load i32, ptr %12, align 4, !dbg !3136
  %274 = icmp eq i32 %272, %273, !dbg !3137
  br i1 %274, label %275, label %279, !dbg !3137

275:                                              ; preds = %266
  store i32 1000, ptr @Connected_segment_distance, align 4, !dbg !3138
  %276 = load i32, ptr %9, align 4, !dbg !3140
  %277 = load i32, ptr %11, align 4, !dbg !3141
  %278 = load i32, ptr @Connected_segment_distance, align 4, !dbg !3142
  call void @_Z16add_to_fcd_cacheiiii(i32 noundef %276, i32 noundef %277, i32 noundef %278, i32 noundef 65536000), !dbg !3143
  store i32 -1, ptr %7, align 4, !dbg !3144
  br label %452, !dbg !3144

279:                                              ; preds = %266
  br label %286, !dbg !3145

280:                                              ; preds = %241
  %281 = load i32, ptr %29, align 4, !dbg !3146
  %282 = load i32, ptr %11, align 4, !dbg !3148
  %283 = icmp eq i32 %281, %282, !dbg !3149
  br i1 %283, label %284, label %285, !dbg !3149

284:                                              ; preds = %280
  br label %314, !dbg !3150

285:                                              ; preds = %280
  br label %286

286:                                              ; preds = %285, %279
  br label %287, !dbg !3152

287:                                              ; preds = %286, %228
  br label %288, !dbg !3153

288:                                              ; preds = %287, %223
  br label %289, !dbg !3154

289:                                              ; preds = %288
  %290 = load i32, ptr %15, align 4, !dbg !3155
  %291 = add nsw i32 %290, 1, !dbg !3155
  store i32 %291, ptr %15, align 4, !dbg !3155
  br label %180, !dbg !3156, !llvm.loop !3157

292:                                              ; preds = %180
  %293 = load i32, ptr %17, align 4, !dbg !3159
  %294 = load i32, ptr %16, align 4, !dbg !3161
  %295 = icmp sge i32 %293, %294, !dbg !3162
  br i1 %295, label %296, label %300, !dbg !3162

296:                                              ; preds = %292
  store i32 1000, ptr @Connected_segment_distance, align 4, !dbg !3163
  %297 = load i32, ptr %9, align 4, !dbg !3165
  %298 = load i32, ptr %11, align 4, !dbg !3166
  %299 = load i32, ptr @Connected_segment_distance, align 4, !dbg !3167
  call void @_Z16add_to_fcd_cacheiiii(i32 noundef %297, i32 noundef %298, i32 noundef %299, i32 noundef 65536000), !dbg !3168
  store i32 -1, ptr %7, align 4, !dbg !3169
  br label %452, !dbg !3169

300:                                              ; preds = %292
  %301 = load i32, ptr %17, align 4, !dbg !3170
  %302 = sext i32 %301 to i64, !dbg !3171
  %303 = getelementptr inbounds [900 x %struct.seg_seg], ptr %20, i64 0, i64 %302, !dbg !3171
  %304 = getelementptr inbounds nuw %struct.seg_seg, ptr %303, i32 0, i32 1, !dbg !3172
  %305 = load i16, ptr %304, align 2, !dbg !3172
  %306 = sext i16 %305 to i32, !dbg !3171
  store i32 %306, ptr %14, align 4, !dbg !3173
  %307 = load i32, ptr %17, align 4, !dbg !3174
  %308 = sext i32 %307 to i64, !dbg !3175
  %309 = getelementptr inbounds [900 x i16], ptr %21, i64 0, i64 %308, !dbg !3175
  %310 = load i16, ptr %309, align 2, !dbg !3175
  %311 = sext i16 %310 to i32, !dbg !3175
  store i32 %311, ptr %22, align 4, !dbg !3176
  %312 = load i32, ptr %17, align 4, !dbg !3177
  %313 = add nsw i32 %312, 1, !dbg !3177
  store i32 %313, ptr %17, align 4, !dbg !3177
  br label %314, !dbg !3178

314:                                              ; preds = %300, %284
    #dbg_label(!3179, !3180)
  br label %172, !dbg !3075, !llvm.loop !3181

315:                                              ; preds = %172
  br label %316, !dbg !3183

316:                                              ; preds = %333, %315
  %317 = load i32, ptr %16, align 4, !dbg !3184
  %318 = add nsw i32 %317, -1, !dbg !3184
  store i32 %318, ptr %16, align 4, !dbg !3184
  %319 = sext i32 %318 to i64, !dbg !3185
  %320 = getelementptr inbounds [900 x %struct.seg_seg], ptr %20, i64 0, i64 %319, !dbg !3185
  %321 = getelementptr inbounds nuw %struct.seg_seg, ptr %320, i32 0, i32 1, !dbg !3186
  %322 = load i16, ptr %321, align 2, !dbg !3186
  %323 = sext i16 %322 to i32, !dbg !3185
  %324 = load i32, ptr %11, align 4, !dbg !3187
  %325 = icmp ne i32 %323, %324, !dbg !3188
  br i1 %325, label %326, label %334, !dbg !3183

326:                                              ; preds = %316
  %327 = load i32, ptr %16, align 4, !dbg !3189
  %328 = icmp slt i32 %327, 0, !dbg !3191
  br i1 %328, label %329, label %333, !dbg !3191

329:                                              ; preds = %326
  store i32 1000, ptr @Connected_segment_distance, align 4, !dbg !3192
  %330 = load i32, ptr %9, align 4, !dbg !3194
  %331 = load i32, ptr %11, align 4, !dbg !3195
  %332 = load i32, ptr @Connected_segment_distance, align 4, !dbg !3196
  call void @_Z16add_to_fcd_cacheiiii(i32 noundef %330, i32 noundef %331, i32 noundef %332, i32 noundef 65536000), !dbg !3197
  store i32 -1, ptr %7, align 4, !dbg !3198
  br label %452, !dbg !3198

333:                                              ; preds = %326
  br label %316, !dbg !3183, !llvm.loop !3199

334:                                              ; preds = %316
  br label %335, !dbg !3201

335:                                              ; preds = %384, %334
  %336 = load i32, ptr %16, align 4, !dbg !3202
  %337 = icmp sge i32 %336, 0, !dbg !3203
  br i1 %337, label %338, label %385, !dbg !3201

338:                                              ; preds = %335
    #dbg_declare(ptr %30, !3204, !DIExpression(), !3206)
    #dbg_declare(ptr %31, !3207, !DIExpression(), !3208)
  %339 = load i32, ptr %16, align 4, !dbg !3209
  %340 = sext i32 %339 to i64, !dbg !3210
  %341 = getelementptr inbounds [900 x %struct.seg_seg], ptr %20, i64 0, i64 %340, !dbg !3210
  %342 = getelementptr inbounds nuw %struct.seg_seg, ptr %341, i32 0, i32 1, !dbg !3211
  %343 = load i16, ptr %342, align 2, !dbg !3211
  %344 = sext i16 %343 to i32, !dbg !3210
  store i32 %344, ptr %31, align 4, !dbg !3212
  %345 = load i32, ptr %16, align 4, !dbg !3213
  %346 = sext i32 %345 to i64, !dbg !3214
  %347 = getelementptr inbounds [900 x %struct.seg_seg], ptr %20, i64 0, i64 %346, !dbg !3214
  %348 = getelementptr inbounds nuw %struct.seg_seg, ptr %347, i32 0, i32 0, !dbg !3215
  %349 = load i16, ptr %348, align 2, !dbg !3215
  %350 = sext i16 %349 to i32, !dbg !3214
  store i32 %350, ptr %30, align 4, !dbg !3216
  %351 = load i32, ptr %31, align 4, !dbg !3217
  %352 = load i32, ptr %23, align 4, !dbg !3218
  %353 = sext i32 %352 to i64, !dbg !3219
  %354 = getelementptr inbounds [64 x %struct.point_seg], ptr %24, i64 0, i64 %353, !dbg !3219
  %355 = getelementptr inbounds nuw %struct.point_seg, ptr %354, i32 0, i32 0, !dbg !3220
  store i32 %351, ptr %355, align 4, !dbg !3221
  %356 = load i32, ptr %23, align 4, !dbg !3222
  %357 = sext i32 %356 to i64, !dbg !3223
  %358 = getelementptr inbounds [64 x %struct.point_seg], ptr %24, i64 0, i64 %357, !dbg !3223
  %359 = getelementptr inbounds nuw %struct.point_seg, ptr %358, i32 0, i32 1, !dbg !3224
  %360 = load i32, ptr %31, align 4, !dbg !3225
  %361 = sext i32 %360 to i64, !dbg !3226
  %362 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %361, !dbg !3226
  call void @_Z22compute_segment_centerP10vms_vectorP7segment(ptr noundef %359, ptr noundef %362), !dbg !3227
  %363 = load i32, ptr %23, align 4, !dbg !3228
  %364 = add nsw i32 %363, 1, !dbg !3228
  store i32 %364, ptr %23, align 4, !dbg !3228
  %365 = load i32, ptr %30, align 4, !dbg !3229
  %366 = load i32, ptr %9, align 4, !dbg !3231
  %367 = icmp eq i32 %365, %366, !dbg !3232
  br i1 %367, label %368, label %369, !dbg !3232

368:                                              ; preds = %338
  br label %386, !dbg !3233

369:                                              ; preds = %338
  br label %370, !dbg !3234

370:                                              ; preds = %380, %369
  %371 = load i32, ptr %16, align 4, !dbg !3235
  %372 = add nsw i32 %371, -1, !dbg !3235
  store i32 %372, ptr %16, align 4, !dbg !3235
  %373 = sext i32 %372 to i64, !dbg !3236
  %374 = getelementptr inbounds [900 x %struct.seg_seg], ptr %20, i64 0, i64 %373, !dbg !3236
  %375 = getelementptr inbounds nuw %struct.seg_seg, ptr %374, i32 0, i32 1, !dbg !3237
  %376 = load i16, ptr %375, align 2, !dbg !3237
  %377 = sext i16 %376 to i32, !dbg !3236
  %378 = load i32, ptr %30, align 4, !dbg !3238
  %379 = icmp ne i32 %377, %378, !dbg !3239
  br i1 %379, label %380, label %384, !dbg !3234

380:                                              ; preds = %370
  %381 = load i32, ptr %16, align 4, !dbg !3240
  %382 = icmp sge i32 %381, 0, !dbg !3240
  %383 = zext i1 %382 to i32, !dbg !3240
  call void @_Z7_AssertiPKcS0_i(i32 noundef %383, ptr noundef @.str.19, ptr noundef @.str.2, i32 noundef 1448), !dbg !3240
  br label %370, !dbg !3234, !llvm.loop !3241

384:                                              ; preds = %370
  br label %335, !dbg !3201, !llvm.loop !3242

385:                                              ; preds = %335
  br label %386, !dbg !3244

386:                                              ; preds = %385, %368
  %387 = load i32, ptr %9, align 4, !dbg !3244
  %388 = load i32, ptr %23, align 4, !dbg !3245
  %389 = sext i32 %388 to i64, !dbg !3246
  %390 = getelementptr inbounds [64 x %struct.point_seg], ptr %24, i64 0, i64 %389, !dbg !3246
  %391 = getelementptr inbounds nuw %struct.point_seg, ptr %390, i32 0, i32 0, !dbg !3247
  store i32 %387, ptr %391, align 4, !dbg !3248
  %392 = load i32, ptr %23, align 4, !dbg !3249
  %393 = sext i32 %392 to i64, !dbg !3250
  %394 = getelementptr inbounds [64 x %struct.point_seg], ptr %24, i64 0, i64 %393, !dbg !3250
  %395 = getelementptr inbounds nuw %struct.point_seg, ptr %394, i32 0, i32 1, !dbg !3251
  %396 = load i32, ptr %9, align 4, !dbg !3252
  %397 = sext i32 %396 to i64, !dbg !3253
  %398 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %397, !dbg !3253
  call void @_Z22compute_segment_centerP10vms_vectorP7segment(ptr noundef %395, ptr noundef %398), !dbg !3254
  %399 = load i32, ptr %23, align 4, !dbg !3255
  %400 = add nsw i32 %399, 1, !dbg !3255
  store i32 %400, ptr %23, align 4, !dbg !3255
  %401 = load i32, ptr %23, align 4, !dbg !3256
  %402 = icmp eq i32 %401, 1, !dbg !3258
  br i1 %402, label %403, label %408, !dbg !3258

403:                                              ; preds = %386
  %404 = load i32, ptr %23, align 4, !dbg !3259
  store i32 %404, ptr @Connected_segment_distance, align 4, !dbg !3261
  %405 = load ptr, ptr %8, align 8, !dbg !3262
  %406 = load ptr, ptr %10, align 8, !dbg !3263
  %407 = call noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef %405, ptr noundef %406), !dbg !3264
  store i32 %407, ptr %7, align 4, !dbg !3265
  br label %452, !dbg !3265

408:                                              ; preds = %386
  %409 = load ptr, ptr %10, align 8, !dbg !3266
  %410 = getelementptr inbounds [64 x %struct.point_seg], ptr %24, i64 0, i64 1, !dbg !3268
  %411 = getelementptr inbounds nuw %struct.point_seg, ptr %410, i32 0, i32 1, !dbg !3269
  %412 = call noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef %409, ptr noundef %411), !dbg !3270
  store i32 %412, ptr %25, align 4, !dbg !3271
  %413 = load ptr, ptr %8, align 8, !dbg !3272
  %414 = load i32, ptr %23, align 4, !dbg !3273
  %415 = sub nsw i32 %414, 2, !dbg !3274
  %416 = sext i32 %415 to i64, !dbg !3275
  %417 = getelementptr inbounds [64 x %struct.point_seg], ptr %24, i64 0, i64 %416, !dbg !3275
  %418 = getelementptr inbounds nuw %struct.point_seg, ptr %417, i32 0, i32 1, !dbg !3276
  %419 = call noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef %413, ptr noundef %418), !dbg !3277
  %420 = load i32, ptr %25, align 4, !dbg !3278
  %421 = add nsw i32 %420, %419, !dbg !3278
  store i32 %421, ptr %25, align 4, !dbg !3278
  store i32 1, ptr %18, align 4, !dbg !3279
  br label %422, !dbg !3281

422:                                              ; preds = %441, %408
  %423 = load i32, ptr %18, align 4, !dbg !3282
  %424 = load i32, ptr %23, align 4, !dbg !3284
  %425 = sub nsw i32 %424, 2, !dbg !3285
  %426 = icmp slt i32 %423, %425, !dbg !3286
  br i1 %426, label %427, label %444, !dbg !3287

427:                                              ; preds = %422
    #dbg_declare(ptr %32, !3288, !DIExpression(), !3290)
  %428 = load i32, ptr %18, align 4, !dbg !3291
  %429 = sext i32 %428 to i64, !dbg !3292
  %430 = getelementptr inbounds [64 x %struct.point_seg], ptr %24, i64 0, i64 %429, !dbg !3292
  %431 = getelementptr inbounds nuw %struct.point_seg, ptr %430, i32 0, i32 1, !dbg !3293
  %432 = load i32, ptr %18, align 4, !dbg !3294
  %433 = add nsw i32 %432, 1, !dbg !3295
  %434 = sext i32 %433 to i64, !dbg !3296
  %435 = getelementptr inbounds [64 x %struct.point_seg], ptr %24, i64 0, i64 %434, !dbg !3296
  %436 = getelementptr inbounds nuw %struct.point_seg, ptr %435, i32 0, i32 1, !dbg !3297
  %437 = call noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef %431, ptr noundef %436), !dbg !3298
  store i32 %437, ptr %32, align 4, !dbg !3299
  %438 = load i32, ptr %32, align 4, !dbg !3300
  %439 = load i32, ptr %25, align 4, !dbg !3301
  %440 = add nsw i32 %439, %438, !dbg !3301
  store i32 %440, ptr %25, align 4, !dbg !3301
  br label %441, !dbg !3302

441:                                              ; preds = %427
  %442 = load i32, ptr %18, align 4, !dbg !3303
  %443 = add nsw i32 %442, 1, !dbg !3303
  store i32 %443, ptr %18, align 4, !dbg !3303
  br label %422, !dbg !3304, !llvm.loop !3305

444:                                              ; preds = %422
  br label %445

445:                                              ; preds = %444
  %446 = load i32, ptr %23, align 4, !dbg !3307
  store i32 %446, ptr @Connected_segment_distance, align 4, !dbg !3308
  %447 = load i32, ptr %9, align 4, !dbg !3309
  %448 = load i32, ptr %11, align 4, !dbg !3310
  %449 = load i32, ptr %23, align 4, !dbg !3311
  %450 = load i32, ptr %25, align 4, !dbg !3312
  call void @_Z16add_to_fcd_cacheiiii(i32 noundef %447, i32 noundef %448, i32 noundef %449, i32 noundef %450), !dbg !3313
  %451 = load i32, ptr %25, align 4, !dbg !3314
  store i32 %451, ptr %7, align 4, !dbg !3315
  br label %452, !dbg !3315

452:                                              ; preds = %445, %403, %329, %296, %275, %143, %106, %41
  %453 = load i32, ptr %7, align 4, !dbg !3316
  ret i32 %453, !dbg !3316
}

declare noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef, ptr noundef) #1

declare noundef i32 @_Z15wall_is_doorwayP7segmenti(ptr noundef, i32 noundef) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define noundef signext i8 @_Z15convert_to_bytei(i32 noundef %0) #2 !dbg !3317 {
  %2 = alloca i8, align 1
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !3320, !DIExpression(), !3321)
  %4 = load i32, ptr %3, align 4, !dbg !3322
  %5 = icmp sge i32 %4, 65536, !dbg !3324
  br i1 %5, label %6, label %7, !dbg !3324

6:                                                ; preds = %1
  store i8 127, ptr %2, align 1, !dbg !3325
  br label %15, !dbg !3325

7:                                                ; preds = %1
  %8 = load i32, ptr %3, align 4, !dbg !3326
  %9 = icmp sle i32 %8, -65536, !dbg !3328
  br i1 %9, label %10, label %11, !dbg !3328

10:                                               ; preds = %7
  store i8 -127, ptr %2, align 1, !dbg !3329
  br label %15, !dbg !3329

11:                                               ; preds = %7
  %12 = load i32, ptr %3, align 4, !dbg !3330
  %13 = ashr i32 %12, 9, !dbg !3331
  %14 = trunc i32 %13 to i8, !dbg !3330
  store i8 %14, ptr %2, align 1, !dbg !3332
  br label %15, !dbg !3332

15:                                               ; preds = %11, %10, %6
  %16 = load i8, ptr %2, align 1, !dbg !3333
  ret i8 %16, !dbg !3333
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define void @_Z15create_shortposP8shortposP6object(ptr noundef %0, ptr noundef %1) #2 !dbg !3334 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !3481, !DIExpression(), !3482)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !3483, !DIExpression(), !3484)
    #dbg_declare(ptr %5, !3485, !DIExpression(), !3486)
  %6 = load ptr, ptr %3, align 8, !dbg !3487
  %7 = getelementptr inbounds nuw %struct.shortpos, ptr %6, i32 0, i32 0, !dbg !3488
  %8 = getelementptr inbounds [9 x i8], ptr %7, i64 0, i64 0, !dbg !3487
  store ptr %8, ptr %5, align 8, !dbg !3489
  %9 = load ptr, ptr %4, align 8, !dbg !3490
  %10 = getelementptr inbounds nuw %struct.object, ptr %9, i32 0, i32 12, !dbg !3491
  %11 = getelementptr inbounds nuw %struct.vms_matrix, ptr %10, i32 0, i32 0, !dbg !3492
  %12 = getelementptr inbounds nuw %struct.vms_vector, ptr %11, i32 0, i32 0, !dbg !3493
  %13 = load i32, ptr %12, align 4, !dbg !3493
  %14 = call noundef signext i8 @_Z15convert_to_bytei(i32 noundef %13), !dbg !3494
  %15 = load ptr, ptr %5, align 8, !dbg !3495
  %16 = getelementptr inbounds nuw i8, ptr %15, i32 1, !dbg !3495
  store ptr %16, ptr %5, align 8, !dbg !3495
  store i8 %14, ptr %15, align 1, !dbg !3496
  %17 = load ptr, ptr %4, align 8, !dbg !3497
  %18 = getelementptr inbounds nuw %struct.object, ptr %17, i32 0, i32 12, !dbg !3498
  %19 = getelementptr inbounds nuw %struct.vms_matrix, ptr %18, i32 0, i32 1, !dbg !3499
  %20 = getelementptr inbounds nuw %struct.vms_vector, ptr %19, i32 0, i32 0, !dbg !3500
  %21 = load i32, ptr %20, align 4, !dbg !3500
  %22 = call noundef signext i8 @_Z15convert_to_bytei(i32 noundef %21), !dbg !3501
  %23 = load ptr, ptr %5, align 8, !dbg !3502
  %24 = getelementptr inbounds nuw i8, ptr %23, i32 1, !dbg !3502
  store ptr %24, ptr %5, align 8, !dbg !3502
  store i8 %22, ptr %23, align 1, !dbg !3503
  %25 = load ptr, ptr %4, align 8, !dbg !3504
  %26 = getelementptr inbounds nuw %struct.object, ptr %25, i32 0, i32 12, !dbg !3505
  %27 = getelementptr inbounds nuw %struct.vms_matrix, ptr %26, i32 0, i32 2, !dbg !3506
  %28 = getelementptr inbounds nuw %struct.vms_vector, ptr %27, i32 0, i32 0, !dbg !3507
  %29 = load i32, ptr %28, align 4, !dbg !3507
  %30 = call noundef signext i8 @_Z15convert_to_bytei(i32 noundef %29), !dbg !3508
  %31 = load ptr, ptr %5, align 8, !dbg !3509
  %32 = getelementptr inbounds nuw i8, ptr %31, i32 1, !dbg !3509
  store ptr %32, ptr %5, align 8, !dbg !3509
  store i8 %30, ptr %31, align 1, !dbg !3510
  %33 = load ptr, ptr %4, align 8, !dbg !3511
  %34 = getelementptr inbounds nuw %struct.object, ptr %33, i32 0, i32 12, !dbg !3512
  %35 = getelementptr inbounds nuw %struct.vms_matrix, ptr %34, i32 0, i32 0, !dbg !3513
  %36 = getelementptr inbounds nuw %struct.vms_vector, ptr %35, i32 0, i32 1, !dbg !3514
  %37 = load i32, ptr %36, align 4, !dbg !3514
  %38 = call noundef signext i8 @_Z15convert_to_bytei(i32 noundef %37), !dbg !3515
  %39 = load ptr, ptr %5, align 8, !dbg !3516
  %40 = getelementptr inbounds nuw i8, ptr %39, i32 1, !dbg !3516
  store ptr %40, ptr %5, align 8, !dbg !3516
  store i8 %38, ptr %39, align 1, !dbg !3517
  %41 = load ptr, ptr %4, align 8, !dbg !3518
  %42 = getelementptr inbounds nuw %struct.object, ptr %41, i32 0, i32 12, !dbg !3519
  %43 = getelementptr inbounds nuw %struct.vms_matrix, ptr %42, i32 0, i32 1, !dbg !3520
  %44 = getelementptr inbounds nuw %struct.vms_vector, ptr %43, i32 0, i32 1, !dbg !3521
  %45 = load i32, ptr %44, align 4, !dbg !3521
  %46 = call noundef signext i8 @_Z15convert_to_bytei(i32 noundef %45), !dbg !3522
  %47 = load ptr, ptr %5, align 8, !dbg !3523
  %48 = getelementptr inbounds nuw i8, ptr %47, i32 1, !dbg !3523
  store ptr %48, ptr %5, align 8, !dbg !3523
  store i8 %46, ptr %47, align 1, !dbg !3524
  %49 = load ptr, ptr %4, align 8, !dbg !3525
  %50 = getelementptr inbounds nuw %struct.object, ptr %49, i32 0, i32 12, !dbg !3526
  %51 = getelementptr inbounds nuw %struct.vms_matrix, ptr %50, i32 0, i32 2, !dbg !3527
  %52 = getelementptr inbounds nuw %struct.vms_vector, ptr %51, i32 0, i32 1, !dbg !3528
  %53 = load i32, ptr %52, align 4, !dbg !3528
  %54 = call noundef signext i8 @_Z15convert_to_bytei(i32 noundef %53), !dbg !3529
  %55 = load ptr, ptr %5, align 8, !dbg !3530
  %56 = getelementptr inbounds nuw i8, ptr %55, i32 1, !dbg !3530
  store ptr %56, ptr %5, align 8, !dbg !3530
  store i8 %54, ptr %55, align 1, !dbg !3531
  %57 = load ptr, ptr %4, align 8, !dbg !3532
  %58 = getelementptr inbounds nuw %struct.object, ptr %57, i32 0, i32 12, !dbg !3533
  %59 = getelementptr inbounds nuw %struct.vms_matrix, ptr %58, i32 0, i32 0, !dbg !3534
  %60 = getelementptr inbounds nuw %struct.vms_vector, ptr %59, i32 0, i32 2, !dbg !3535
  %61 = load i32, ptr %60, align 4, !dbg !3535
  %62 = call noundef signext i8 @_Z15convert_to_bytei(i32 noundef %61), !dbg !3536
  %63 = load ptr, ptr %5, align 8, !dbg !3537
  %64 = getelementptr inbounds nuw i8, ptr %63, i32 1, !dbg !3537
  store ptr %64, ptr %5, align 8, !dbg !3537
  store i8 %62, ptr %63, align 1, !dbg !3538
  %65 = load ptr, ptr %4, align 8, !dbg !3539
  %66 = getelementptr inbounds nuw %struct.object, ptr %65, i32 0, i32 12, !dbg !3540
  %67 = getelementptr inbounds nuw %struct.vms_matrix, ptr %66, i32 0, i32 1, !dbg !3541
  %68 = getelementptr inbounds nuw %struct.vms_vector, ptr %67, i32 0, i32 2, !dbg !3542
  %69 = load i32, ptr %68, align 4, !dbg !3542
  %70 = call noundef signext i8 @_Z15convert_to_bytei(i32 noundef %69), !dbg !3543
  %71 = load ptr, ptr %5, align 8, !dbg !3544
  %72 = getelementptr inbounds nuw i8, ptr %71, i32 1, !dbg !3544
  store ptr %72, ptr %5, align 8, !dbg !3544
  store i8 %70, ptr %71, align 1, !dbg !3545
  %73 = load ptr, ptr %4, align 8, !dbg !3546
  %74 = getelementptr inbounds nuw %struct.object, ptr %73, i32 0, i32 12, !dbg !3547
  %75 = getelementptr inbounds nuw %struct.vms_matrix, ptr %74, i32 0, i32 2, !dbg !3548
  %76 = getelementptr inbounds nuw %struct.vms_vector, ptr %75, i32 0, i32 2, !dbg !3549
  %77 = load i32, ptr %76, align 4, !dbg !3549
  %78 = call noundef signext i8 @_Z15convert_to_bytei(i32 noundef %77), !dbg !3550
  %79 = load ptr, ptr %5, align 8, !dbg !3551
  %80 = getelementptr inbounds nuw i8, ptr %79, i32 1, !dbg !3551
  store ptr %80, ptr %5, align 8, !dbg !3551
  store i8 %78, ptr %79, align 1, !dbg !3552
  %81 = load ptr, ptr %4, align 8, !dbg !3553
  %82 = getelementptr inbounds nuw %struct.object, ptr %81, i32 0, i32 11, !dbg !3554
  %83 = getelementptr inbounds nuw %struct.vms_vector, ptr %82, i32 0, i32 0, !dbg !3555
  %84 = load i32, ptr %83, align 4, !dbg !3555
  %85 = load ptr, ptr %4, align 8, !dbg !3556
  %86 = getelementptr inbounds nuw %struct.object, ptr %85, i32 0, i32 9, !dbg !3557
  %87 = load i16, ptr %86, align 2, !dbg !3557
  %88 = sext i16 %87 to i64, !dbg !3558
  %89 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %88, !dbg !3558
  %90 = getelementptr inbounds nuw %struct.segment, ptr %89, i32 0, i32 2, !dbg !3559
  %91 = getelementptr inbounds [8 x i16], ptr %90, i64 0, i64 0, !dbg !3558
  %92 = load i16, ptr %91, align 4, !dbg !3558
  %93 = sext i16 %92 to i64, !dbg !3560
  %94 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %93, !dbg !3560
  %95 = getelementptr inbounds nuw %struct.vms_vector, ptr %94, i32 0, i32 0, !dbg !3561
  %96 = load i32, ptr %95, align 4, !dbg !3561
  %97 = sub nsw i32 %84, %96, !dbg !3562
  %98 = ashr i32 %97, 10, !dbg !3563
  %99 = trunc i32 %98 to i16, !dbg !3564
  %100 = load ptr, ptr %3, align 8, !dbg !3565
  %101 = getelementptr inbounds nuw %struct.shortpos, ptr %100, i32 0, i32 1, !dbg !3566
  store i16 %99, ptr %101, align 2, !dbg !3567
  %102 = load ptr, ptr %4, align 8, !dbg !3568
  %103 = getelementptr inbounds nuw %struct.object, ptr %102, i32 0, i32 11, !dbg !3569
  %104 = getelementptr inbounds nuw %struct.vms_vector, ptr %103, i32 0, i32 1, !dbg !3570
  %105 = load i32, ptr %104, align 4, !dbg !3570
  %106 = load ptr, ptr %4, align 8, !dbg !3571
  %107 = getelementptr inbounds nuw %struct.object, ptr %106, i32 0, i32 9, !dbg !3572
  %108 = load i16, ptr %107, align 2, !dbg !3572
  %109 = sext i16 %108 to i64, !dbg !3573
  %110 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %109, !dbg !3573
  %111 = getelementptr inbounds nuw %struct.segment, ptr %110, i32 0, i32 2, !dbg !3574
  %112 = getelementptr inbounds [8 x i16], ptr %111, i64 0, i64 0, !dbg !3573
  %113 = load i16, ptr %112, align 4, !dbg !3573
  %114 = sext i16 %113 to i64, !dbg !3575
  %115 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %114, !dbg !3575
  %116 = getelementptr inbounds nuw %struct.vms_vector, ptr %115, i32 0, i32 1, !dbg !3576
  %117 = load i32, ptr %116, align 4, !dbg !3576
  %118 = sub nsw i32 %105, %117, !dbg !3577
  %119 = ashr i32 %118, 10, !dbg !3578
  %120 = trunc i32 %119 to i16, !dbg !3579
  %121 = load ptr, ptr %3, align 8, !dbg !3580
  %122 = getelementptr inbounds nuw %struct.shortpos, ptr %121, i32 0, i32 2, !dbg !3581
  store i16 %120, ptr %122, align 2, !dbg !3582
  %123 = load ptr, ptr %4, align 8, !dbg !3583
  %124 = getelementptr inbounds nuw %struct.object, ptr %123, i32 0, i32 11, !dbg !3584
  %125 = getelementptr inbounds nuw %struct.vms_vector, ptr %124, i32 0, i32 2, !dbg !3585
  %126 = load i32, ptr %125, align 4, !dbg !3585
  %127 = load ptr, ptr %4, align 8, !dbg !3586
  %128 = getelementptr inbounds nuw %struct.object, ptr %127, i32 0, i32 9, !dbg !3587
  %129 = load i16, ptr %128, align 2, !dbg !3587
  %130 = sext i16 %129 to i64, !dbg !3588
  %131 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %130, !dbg !3588
  %132 = getelementptr inbounds nuw %struct.segment, ptr %131, i32 0, i32 2, !dbg !3589
  %133 = getelementptr inbounds [8 x i16], ptr %132, i64 0, i64 0, !dbg !3588
  %134 = load i16, ptr %133, align 4, !dbg !3588
  %135 = sext i16 %134 to i64, !dbg !3590
  %136 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %135, !dbg !3590
  %137 = getelementptr inbounds nuw %struct.vms_vector, ptr %136, i32 0, i32 2, !dbg !3591
  %138 = load i32, ptr %137, align 4, !dbg !3591
  %139 = sub nsw i32 %126, %138, !dbg !3592
  %140 = ashr i32 %139, 10, !dbg !3593
  %141 = trunc i32 %140 to i16, !dbg !3594
  %142 = load ptr, ptr %3, align 8, !dbg !3595
  %143 = getelementptr inbounds nuw %struct.shortpos, ptr %142, i32 0, i32 3, !dbg !3596
  store i16 %141, ptr %143, align 2, !dbg !3597
  %144 = load ptr, ptr %4, align 8, !dbg !3598
  %145 = getelementptr inbounds nuw %struct.object, ptr %144, i32 0, i32 9, !dbg !3599
  %146 = load i16, ptr %145, align 2, !dbg !3599
  %147 = load ptr, ptr %3, align 8, !dbg !3600
  %148 = getelementptr inbounds nuw %struct.shortpos, ptr %147, i32 0, i32 4, !dbg !3601
  store i16 %146, ptr %148, align 2, !dbg !3602
  %149 = load ptr, ptr %4, align 8, !dbg !3603
  %150 = getelementptr inbounds nuw %struct.object, ptr %149, i32 0, i32 21, !dbg !3604
  %151 = getelementptr inbounds nuw %struct.physics_info, ptr %150, i32 0, i32 0, !dbg !3605
  %152 = getelementptr inbounds nuw %struct.vms_vector, ptr %151, i32 0, i32 0, !dbg !3606
  %153 = load i32, ptr %152, align 4, !dbg !3606
  %154 = ashr i32 %153, 12, !dbg !3607
  %155 = trunc i32 %154 to i16, !dbg !3608
  %156 = load ptr, ptr %3, align 8, !dbg !3609
  %157 = getelementptr inbounds nuw %struct.shortpos, ptr %156, i32 0, i32 5, !dbg !3610
  store i16 %155, ptr %157, align 2, !dbg !3611
  %158 = load ptr, ptr %4, align 8, !dbg !3612
  %159 = getelementptr inbounds nuw %struct.object, ptr %158, i32 0, i32 21, !dbg !3613
  %160 = getelementptr inbounds nuw %struct.physics_info, ptr %159, i32 0, i32 0, !dbg !3614
  %161 = getelementptr inbounds nuw %struct.vms_vector, ptr %160, i32 0, i32 1, !dbg !3615
  %162 = load i32, ptr %161, align 4, !dbg !3615
  %163 = ashr i32 %162, 12, !dbg !3616
  %164 = trunc i32 %163 to i16, !dbg !3617
  %165 = load ptr, ptr %3, align 8, !dbg !3618
  %166 = getelementptr inbounds nuw %struct.shortpos, ptr %165, i32 0, i32 6, !dbg !3619
  store i16 %164, ptr %166, align 2, !dbg !3620
  %167 = load ptr, ptr %4, align 8, !dbg !3621
  %168 = getelementptr inbounds nuw %struct.object, ptr %167, i32 0, i32 21, !dbg !3622
  %169 = getelementptr inbounds nuw %struct.physics_info, ptr %168, i32 0, i32 0, !dbg !3623
  %170 = getelementptr inbounds nuw %struct.vms_vector, ptr %169, i32 0, i32 2, !dbg !3624
  %171 = load i32, ptr %170, align 4, !dbg !3624
  %172 = ashr i32 %171, 12, !dbg !3625
  %173 = trunc i32 %172 to i16, !dbg !3626
  %174 = load ptr, ptr %3, align 8, !dbg !3627
  %175 = getelementptr inbounds nuw %struct.shortpos, ptr %174, i32 0, i32 7, !dbg !3628
  store i16 %173, ptr %175, align 2, !dbg !3629
  ret void, !dbg !3630
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z16extract_shortposP6objectP8shortpos(ptr noundef %0, ptr noundef %1) #0 !dbg !3631 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !3634, !DIExpression(), !3635)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !3636, !DIExpression(), !3637)
    #dbg_declare(ptr %5, !3638, !DIExpression(), !3639)
    #dbg_declare(ptr %6, !3640, !DIExpression(), !3641)
  %7 = load ptr, ptr %4, align 8, !dbg !3642
  %8 = getelementptr inbounds nuw %struct.shortpos, ptr %7, i32 0, i32 0, !dbg !3643
  %9 = getelementptr inbounds [9 x i8], ptr %8, i64 0, i64 0, !dbg !3642
  store ptr %9, ptr %6, align 8, !dbg !3644
  %10 = load ptr, ptr %6, align 8, !dbg !3645
  %11 = getelementptr inbounds nuw i8, ptr %10, i32 1, !dbg !3645
  store ptr %11, ptr %6, align 8, !dbg !3645
  %12 = load i8, ptr %10, align 1, !dbg !3646
  %13 = sext i8 %12 to i32, !dbg !3646
  %14 = shl i32 %13, 9, !dbg !3647
  %15 = load ptr, ptr %3, align 8, !dbg !3648
  %16 = getelementptr inbounds nuw %struct.object, ptr %15, i32 0, i32 12, !dbg !3649
  %17 = getelementptr inbounds nuw %struct.vms_matrix, ptr %16, i32 0, i32 0, !dbg !3650
  %18 = getelementptr inbounds nuw %struct.vms_vector, ptr %17, i32 0, i32 0, !dbg !3651
  store i32 %14, ptr %18, align 4, !dbg !3652
  %19 = load ptr, ptr %6, align 8, !dbg !3653
  %20 = getelementptr inbounds nuw i8, ptr %19, i32 1, !dbg !3653
  store ptr %20, ptr %6, align 8, !dbg !3653
  %21 = load i8, ptr %19, align 1, !dbg !3654
  %22 = sext i8 %21 to i32, !dbg !3654
  %23 = shl i32 %22, 9, !dbg !3655
  %24 = load ptr, ptr %3, align 8, !dbg !3656
  %25 = getelementptr inbounds nuw %struct.object, ptr %24, i32 0, i32 12, !dbg !3657
  %26 = getelementptr inbounds nuw %struct.vms_matrix, ptr %25, i32 0, i32 1, !dbg !3658
  %27 = getelementptr inbounds nuw %struct.vms_vector, ptr %26, i32 0, i32 0, !dbg !3659
  store i32 %23, ptr %27, align 4, !dbg !3660
  %28 = load ptr, ptr %6, align 8, !dbg !3661
  %29 = getelementptr inbounds nuw i8, ptr %28, i32 1, !dbg !3661
  store ptr %29, ptr %6, align 8, !dbg !3661
  %30 = load i8, ptr %28, align 1, !dbg !3662
  %31 = sext i8 %30 to i32, !dbg !3662
  %32 = shl i32 %31, 9, !dbg !3663
  %33 = load ptr, ptr %3, align 8, !dbg !3664
  %34 = getelementptr inbounds nuw %struct.object, ptr %33, i32 0, i32 12, !dbg !3665
  %35 = getelementptr inbounds nuw %struct.vms_matrix, ptr %34, i32 0, i32 2, !dbg !3666
  %36 = getelementptr inbounds nuw %struct.vms_vector, ptr %35, i32 0, i32 0, !dbg !3667
  store i32 %32, ptr %36, align 4, !dbg !3668
  %37 = load ptr, ptr %6, align 8, !dbg !3669
  %38 = getelementptr inbounds nuw i8, ptr %37, i32 1, !dbg !3669
  store ptr %38, ptr %6, align 8, !dbg !3669
  %39 = load i8, ptr %37, align 1, !dbg !3670
  %40 = sext i8 %39 to i32, !dbg !3670
  %41 = shl i32 %40, 9, !dbg !3671
  %42 = load ptr, ptr %3, align 8, !dbg !3672
  %43 = getelementptr inbounds nuw %struct.object, ptr %42, i32 0, i32 12, !dbg !3673
  %44 = getelementptr inbounds nuw %struct.vms_matrix, ptr %43, i32 0, i32 0, !dbg !3674
  %45 = getelementptr inbounds nuw %struct.vms_vector, ptr %44, i32 0, i32 1, !dbg !3675
  store i32 %41, ptr %45, align 4, !dbg !3676
  %46 = load ptr, ptr %6, align 8, !dbg !3677
  %47 = getelementptr inbounds nuw i8, ptr %46, i32 1, !dbg !3677
  store ptr %47, ptr %6, align 8, !dbg !3677
  %48 = load i8, ptr %46, align 1, !dbg !3678
  %49 = sext i8 %48 to i32, !dbg !3678
  %50 = shl i32 %49, 9, !dbg !3679
  %51 = load ptr, ptr %3, align 8, !dbg !3680
  %52 = getelementptr inbounds nuw %struct.object, ptr %51, i32 0, i32 12, !dbg !3681
  %53 = getelementptr inbounds nuw %struct.vms_matrix, ptr %52, i32 0, i32 1, !dbg !3682
  %54 = getelementptr inbounds nuw %struct.vms_vector, ptr %53, i32 0, i32 1, !dbg !3683
  store i32 %50, ptr %54, align 4, !dbg !3684
  %55 = load ptr, ptr %6, align 8, !dbg !3685
  %56 = getelementptr inbounds nuw i8, ptr %55, i32 1, !dbg !3685
  store ptr %56, ptr %6, align 8, !dbg !3685
  %57 = load i8, ptr %55, align 1, !dbg !3686
  %58 = sext i8 %57 to i32, !dbg !3686
  %59 = shl i32 %58, 9, !dbg !3687
  %60 = load ptr, ptr %3, align 8, !dbg !3688
  %61 = getelementptr inbounds nuw %struct.object, ptr %60, i32 0, i32 12, !dbg !3689
  %62 = getelementptr inbounds nuw %struct.vms_matrix, ptr %61, i32 0, i32 2, !dbg !3690
  %63 = getelementptr inbounds nuw %struct.vms_vector, ptr %62, i32 0, i32 1, !dbg !3691
  store i32 %59, ptr %63, align 4, !dbg !3692
  %64 = load ptr, ptr %6, align 8, !dbg !3693
  %65 = getelementptr inbounds nuw i8, ptr %64, i32 1, !dbg !3693
  store ptr %65, ptr %6, align 8, !dbg !3693
  %66 = load i8, ptr %64, align 1, !dbg !3694
  %67 = sext i8 %66 to i32, !dbg !3694
  %68 = shl i32 %67, 9, !dbg !3695
  %69 = load ptr, ptr %3, align 8, !dbg !3696
  %70 = getelementptr inbounds nuw %struct.object, ptr %69, i32 0, i32 12, !dbg !3697
  %71 = getelementptr inbounds nuw %struct.vms_matrix, ptr %70, i32 0, i32 0, !dbg !3698
  %72 = getelementptr inbounds nuw %struct.vms_vector, ptr %71, i32 0, i32 2, !dbg !3699
  store i32 %68, ptr %72, align 4, !dbg !3700
  %73 = load ptr, ptr %6, align 8, !dbg !3701
  %74 = getelementptr inbounds nuw i8, ptr %73, i32 1, !dbg !3701
  store ptr %74, ptr %6, align 8, !dbg !3701
  %75 = load i8, ptr %73, align 1, !dbg !3702
  %76 = sext i8 %75 to i32, !dbg !3702
  %77 = shl i32 %76, 9, !dbg !3703
  %78 = load ptr, ptr %3, align 8, !dbg !3704
  %79 = getelementptr inbounds nuw %struct.object, ptr %78, i32 0, i32 12, !dbg !3705
  %80 = getelementptr inbounds nuw %struct.vms_matrix, ptr %79, i32 0, i32 1, !dbg !3706
  %81 = getelementptr inbounds nuw %struct.vms_vector, ptr %80, i32 0, i32 2, !dbg !3707
  store i32 %77, ptr %81, align 4, !dbg !3708
  %82 = load ptr, ptr %6, align 8, !dbg !3709
  %83 = getelementptr inbounds nuw i8, ptr %82, i32 1, !dbg !3709
  store ptr %83, ptr %6, align 8, !dbg !3709
  %84 = load i8, ptr %82, align 1, !dbg !3710
  %85 = sext i8 %84 to i32, !dbg !3710
  %86 = shl i32 %85, 9, !dbg !3711
  %87 = load ptr, ptr %3, align 8, !dbg !3712
  %88 = getelementptr inbounds nuw %struct.object, ptr %87, i32 0, i32 12, !dbg !3713
  %89 = getelementptr inbounds nuw %struct.vms_matrix, ptr %88, i32 0, i32 2, !dbg !3714
  %90 = getelementptr inbounds nuw %struct.vms_vector, ptr %89, i32 0, i32 2, !dbg !3715
  store i32 %86, ptr %90, align 4, !dbg !3716
  %91 = load ptr, ptr %4, align 8, !dbg !3717
  %92 = getelementptr inbounds nuw %struct.shortpos, ptr %91, i32 0, i32 4, !dbg !3718
  %93 = load i16, ptr %92, align 2, !dbg !3718
  %94 = sext i16 %93 to i32, !dbg !3717
  store i32 %94, ptr %5, align 4, !dbg !3719
  %95 = load i32, ptr %5, align 4, !dbg !3720
  %96 = icmp sge i32 %95, 0, !dbg !3720
  br i1 %96, label %97, label %101, !dbg !3720

97:                                               ; preds = %2
  %98 = load i32, ptr %5, align 4, !dbg !3720
  %99 = load i32, ptr @Highest_segment_index, align 4, !dbg !3720
  %100 = icmp sle i32 %98, %99, !dbg !3720
  br label %101

101:                                              ; preds = %97, %2
  %102 = phi i1 [ false, %2 ], [ %100, %97 ], !dbg !3721
  %103 = zext i1 %102 to i32, !dbg !3720
  call void @_Z7_AssertiPKcS0_i(i32 noundef %103, ptr noundef @.str.20, ptr noundef @.str.2, i32 noundef 1620), !dbg !3720
  %104 = load ptr, ptr %4, align 8, !dbg !3722
  %105 = getelementptr inbounds nuw %struct.shortpos, ptr %104, i32 0, i32 1, !dbg !3723
  %106 = load i16, ptr %105, align 2, !dbg !3723
  %107 = sext i16 %106 to i32, !dbg !3722
  %108 = shl i32 %107, 10, !dbg !3724
  %109 = load i32, ptr %5, align 4, !dbg !3725
  %110 = sext i32 %109 to i64, !dbg !3726
  %111 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %110, !dbg !3726
  %112 = getelementptr inbounds nuw %struct.segment, ptr %111, i32 0, i32 2, !dbg !3727
  %113 = getelementptr inbounds [8 x i16], ptr %112, i64 0, i64 0, !dbg !3726
  %114 = load i16, ptr %113, align 4, !dbg !3726
  %115 = sext i16 %114 to i64, !dbg !3728
  %116 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %115, !dbg !3728
  %117 = getelementptr inbounds nuw %struct.vms_vector, ptr %116, i32 0, i32 0, !dbg !3729
  %118 = load i32, ptr %117, align 4, !dbg !3729
  %119 = add nsw i32 %108, %118, !dbg !3730
  %120 = load ptr, ptr %3, align 8, !dbg !3731
  %121 = getelementptr inbounds nuw %struct.object, ptr %120, i32 0, i32 11, !dbg !3732
  %122 = getelementptr inbounds nuw %struct.vms_vector, ptr %121, i32 0, i32 0, !dbg !3733
  store i32 %119, ptr %122, align 4, !dbg !3734
  %123 = load ptr, ptr %4, align 8, !dbg !3735
  %124 = getelementptr inbounds nuw %struct.shortpos, ptr %123, i32 0, i32 2, !dbg !3736
  %125 = load i16, ptr %124, align 2, !dbg !3736
  %126 = sext i16 %125 to i32, !dbg !3735
  %127 = shl i32 %126, 10, !dbg !3737
  %128 = load i32, ptr %5, align 4, !dbg !3738
  %129 = sext i32 %128 to i64, !dbg !3739
  %130 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %129, !dbg !3739
  %131 = getelementptr inbounds nuw %struct.segment, ptr %130, i32 0, i32 2, !dbg !3740
  %132 = getelementptr inbounds [8 x i16], ptr %131, i64 0, i64 0, !dbg !3739
  %133 = load i16, ptr %132, align 4, !dbg !3739
  %134 = sext i16 %133 to i64, !dbg !3741
  %135 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %134, !dbg !3741
  %136 = getelementptr inbounds nuw %struct.vms_vector, ptr %135, i32 0, i32 1, !dbg !3742
  %137 = load i32, ptr %136, align 4, !dbg !3742
  %138 = add nsw i32 %127, %137, !dbg !3743
  %139 = load ptr, ptr %3, align 8, !dbg !3744
  %140 = getelementptr inbounds nuw %struct.object, ptr %139, i32 0, i32 11, !dbg !3745
  %141 = getelementptr inbounds nuw %struct.vms_vector, ptr %140, i32 0, i32 1, !dbg !3746
  store i32 %138, ptr %141, align 4, !dbg !3747
  %142 = load ptr, ptr %4, align 8, !dbg !3748
  %143 = getelementptr inbounds nuw %struct.shortpos, ptr %142, i32 0, i32 3, !dbg !3749
  %144 = load i16, ptr %143, align 2, !dbg !3749
  %145 = sext i16 %144 to i32, !dbg !3748
  %146 = shl i32 %145, 10, !dbg !3750
  %147 = load i32, ptr %5, align 4, !dbg !3751
  %148 = sext i32 %147 to i64, !dbg !3752
  %149 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %148, !dbg !3752
  %150 = getelementptr inbounds nuw %struct.segment, ptr %149, i32 0, i32 2, !dbg !3753
  %151 = getelementptr inbounds [8 x i16], ptr %150, i64 0, i64 0, !dbg !3752
  %152 = load i16, ptr %151, align 4, !dbg !3752
  %153 = sext i16 %152 to i64, !dbg !3754
  %154 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %153, !dbg !3754
  %155 = getelementptr inbounds nuw %struct.vms_vector, ptr %154, i32 0, i32 2, !dbg !3755
  %156 = load i32, ptr %155, align 4, !dbg !3755
  %157 = add nsw i32 %146, %156, !dbg !3756
  %158 = load ptr, ptr %3, align 8, !dbg !3757
  %159 = getelementptr inbounds nuw %struct.object, ptr %158, i32 0, i32 11, !dbg !3758
  %160 = getelementptr inbounds nuw %struct.vms_vector, ptr %159, i32 0, i32 2, !dbg !3759
  store i32 %157, ptr %160, align 4, !dbg !3760
  %161 = load ptr, ptr %4, align 8, !dbg !3761
  %162 = getelementptr inbounds nuw %struct.shortpos, ptr %161, i32 0, i32 5, !dbg !3762
  %163 = load i16, ptr %162, align 2, !dbg !3762
  %164 = sext i16 %163 to i32, !dbg !3761
  %165 = shl i32 %164, 12, !dbg !3763
  %166 = load ptr, ptr %3, align 8, !dbg !3764
  %167 = getelementptr inbounds nuw %struct.object, ptr %166, i32 0, i32 21, !dbg !3765
  %168 = getelementptr inbounds nuw %struct.physics_info, ptr %167, i32 0, i32 0, !dbg !3766
  %169 = getelementptr inbounds nuw %struct.vms_vector, ptr %168, i32 0, i32 0, !dbg !3767
  store i32 %165, ptr %169, align 4, !dbg !3768
  %170 = load ptr, ptr %4, align 8, !dbg !3769
  %171 = getelementptr inbounds nuw %struct.shortpos, ptr %170, i32 0, i32 6, !dbg !3770
  %172 = load i16, ptr %171, align 2, !dbg !3770
  %173 = sext i16 %172 to i32, !dbg !3769
  %174 = shl i32 %173, 12, !dbg !3771
  %175 = load ptr, ptr %3, align 8, !dbg !3772
  %176 = getelementptr inbounds nuw %struct.object, ptr %175, i32 0, i32 21, !dbg !3773
  %177 = getelementptr inbounds nuw %struct.physics_info, ptr %176, i32 0, i32 0, !dbg !3774
  %178 = getelementptr inbounds nuw %struct.vms_vector, ptr %177, i32 0, i32 1, !dbg !3775
  store i32 %174, ptr %178, align 4, !dbg !3776
  %179 = load ptr, ptr %4, align 8, !dbg !3777
  %180 = getelementptr inbounds nuw %struct.shortpos, ptr %179, i32 0, i32 7, !dbg !3778
  %181 = load i16, ptr %180, align 2, !dbg !3778
  %182 = sext i16 %181 to i32, !dbg !3777
  %183 = shl i32 %182, 12, !dbg !3779
  %184 = load ptr, ptr %3, align 8, !dbg !3780
  %185 = getelementptr inbounds nuw %struct.object, ptr %184, i32 0, i32 21, !dbg !3781
  %186 = getelementptr inbounds nuw %struct.physics_info, ptr %185, i32 0, i32 0, !dbg !3782
  %187 = getelementptr inbounds nuw %struct.vms_vector, ptr %186, i32 0, i32 2, !dbg !3783
  store i32 %183, ptr %187, align 4, !dbg !3784
  %188 = load ptr, ptr %3, align 8, !dbg !3785
  %189 = ptrtoint ptr %188 to i64, !dbg !3786
  %190 = sub i64 %189, ptrtoint (ptr @Objects to i64), !dbg !3786
  %191 = sdiv exact i64 %190, 268, !dbg !3786
  %192 = trunc i64 %191 to i32, !dbg !3785
  %193 = load i32, ptr %5, align 4, !dbg !3787
  call void @_Z10obj_relinkii(i32 noundef %192, i32 noundef %193), !dbg !3788
  ret void, !dbg !3789
}

declare void @_Z10obj_relinkii(i32 noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z27extract_vector_from_segmentP7segmentP10vms_vectorii(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 !dbg !3790 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca %struct.vms_vector, align 4
  %11 = alloca %struct.vms_vector, align 4
  store ptr %0, ptr %5, align 8
    #dbg_declare(ptr %5, !3793, !DIExpression(), !3794)
  store ptr %1, ptr %6, align 8
    #dbg_declare(ptr %6, !3795, !DIExpression(), !3796)
  store i32 %2, ptr %7, align 4
    #dbg_declare(ptr %7, !3797, !DIExpression(), !3798)
  store i32 %3, ptr %8, align 4
    #dbg_declare(ptr %8, !3799, !DIExpression(), !3800)
    #dbg_declare(ptr %9, !3801, !DIExpression(), !3802)
    #dbg_declare(ptr %10, !3803, !DIExpression(), !3804)
    #dbg_declare(ptr %11, !3805, !DIExpression(), !3806)
  %12 = getelementptr inbounds nuw %struct.vms_vector, ptr %10, i32 0, i32 2, !dbg !3807
  store i32 0, ptr %12, align 4, !dbg !3807
  %13 = getelementptr inbounds nuw %struct.vms_vector, ptr %10, i32 0, i32 1, !dbg !3807
  store i32 0, ptr %13, align 4, !dbg !3807
  %14 = getelementptr inbounds nuw %struct.vms_vector, ptr %10, i32 0, i32 0, !dbg !3807
  store i32 0, ptr %14, align 4, !dbg !3807
  %15 = getelementptr inbounds nuw %struct.vms_vector, ptr %11, i32 0, i32 2, !dbg !3808
  store i32 0, ptr %15, align 4, !dbg !3808
  %16 = getelementptr inbounds nuw %struct.vms_vector, ptr %11, i32 0, i32 1, !dbg !3808
  store i32 0, ptr %16, align 4, !dbg !3808
  %17 = getelementptr inbounds nuw %struct.vms_vector, ptr %11, i32 0, i32 0, !dbg !3808
  store i32 0, ptr %17, align 4, !dbg !3808
  store i32 0, ptr %9, align 4, !dbg !3809
  br label %18, !dbg !3811

18:                                               ; preds = %52, %4
  %19 = load i32, ptr %9, align 4, !dbg !3812
  %20 = icmp slt i32 %19, 4, !dbg !3814
  br i1 %20, label %21, label %55, !dbg !3815

21:                                               ; preds = %18
  %22 = load ptr, ptr %5, align 8, !dbg !3816
  %23 = getelementptr inbounds nuw %struct.segment, ptr %22, i32 0, i32 2, !dbg !3818
  %24 = load i32, ptr %7, align 4, !dbg !3819
  %25 = sext i32 %24 to i64, !dbg !3820
  %26 = getelementptr inbounds [6 x [4 x i8]], ptr @Side_to_verts, i64 0, i64 %25, !dbg !3820
  %27 = load i32, ptr %9, align 4, !dbg !3821
  %28 = sext i32 %27 to i64, !dbg !3820
  %29 = getelementptr inbounds [4 x i8], ptr %26, i64 0, i64 %28, !dbg !3820
  %30 = load i8, ptr %29, align 1, !dbg !3820
  %31 = sext i8 %30 to i64, !dbg !3816
  %32 = getelementptr inbounds [8 x i16], ptr %23, i64 0, i64 %31, !dbg !3816
  %33 = load i16, ptr %32, align 2, !dbg !3816
  %34 = sext i16 %33 to i64, !dbg !3822
  %35 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %34, !dbg !3822
  %36 = call noundef ptr @_Z11vm_vec_add2P10vms_vectorS0_(ptr noundef %10, ptr noundef %35), !dbg !3823
  %37 = load ptr, ptr %5, align 8, !dbg !3824
  %38 = getelementptr inbounds nuw %struct.segment, ptr %37, i32 0, i32 2, !dbg !3825
  %39 = load i32, ptr %8, align 4, !dbg !3826
  %40 = sext i32 %39 to i64, !dbg !3827
  %41 = getelementptr inbounds [6 x [4 x i8]], ptr @Side_to_verts, i64 0, i64 %40, !dbg !3827
  %42 = load i32, ptr %9, align 4, !dbg !3828
  %43 = sext i32 %42 to i64, !dbg !3827
  %44 = getelementptr inbounds [4 x i8], ptr %41, i64 0, i64 %43, !dbg !3827
  %45 = load i8, ptr %44, align 1, !dbg !3827
  %46 = sext i8 %45 to i64, !dbg !3824
  %47 = getelementptr inbounds [8 x i16], ptr %38, i64 0, i64 %46, !dbg !3824
  %48 = load i16, ptr %47, align 2, !dbg !3824
  %49 = sext i16 %48 to i64, !dbg !3829
  %50 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %49, !dbg !3829
  %51 = call noundef ptr @_Z11vm_vec_add2P10vms_vectorS0_(ptr noundef %11, ptr noundef %50), !dbg !3830
  br label %52, !dbg !3831

52:                                               ; preds = %21
  %53 = load i32, ptr %9, align 4, !dbg !3832
  %54 = add nsw i32 %53, 1, !dbg !3832
  store i32 %54, ptr %9, align 4, !dbg !3832
  br label %18, !dbg !3833, !llvm.loop !3834

55:                                               ; preds = %18
  %56 = load ptr, ptr %6, align 8, !dbg !3836
  %57 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %56, ptr noundef %11, ptr noundef %10), !dbg !3837
  %58 = load ptr, ptr %6, align 8, !dbg !3838
  %59 = call noundef ptr @_Z12vm_vec_scaleP10vms_vectori(ptr noundef %58, i32 noundef 16384), !dbg !3839
  ret void, !dbg !3840
}

declare noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef, ptr noundef, ptr noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z27extract_orient_from_segmentP10vms_matrixP7segment(ptr noundef %0, ptr noundef %1) #0 !dbg !3841 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %struct.vms_vector, align 4
  %6 = alloca %struct.vms_vector, align 4
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !3845, !DIExpression(), !3846)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !3847, !DIExpression(), !3848)
    #dbg_declare(ptr %5, !3849, !DIExpression(), !3850)
    #dbg_declare(ptr %6, !3851, !DIExpression(), !3852)
  %7 = load ptr, ptr %4, align 8, !dbg !3853
  call void @_Z27extract_vector_from_segmentP7segmentP10vms_vectorii(ptr noundef %7, ptr noundef %5, i32 noundef 5, i32 noundef 4), !dbg !3854
  %8 = load ptr, ptr %4, align 8, !dbg !3855
  call void @_Z27extract_vector_from_segmentP7segmentP10vms_vectorii(ptr noundef %8, ptr noundef %6, i32 noundef 3, i32 noundef 1), !dbg !3856
  %9 = load ptr, ptr %3, align 8, !dbg !3857
  %10 = call noundef ptr @_Z18vm_vector_2_matrixP10vms_matrixP10vms_vectorS2_S2_(ptr noundef %9, ptr noundef %5, ptr noundef %6, ptr noundef null), !dbg !3858
  ret void, !dbg !3859
}

declare noundef ptr @_Z18vm_vector_2_matrixP10vms_matrixP10vms_vectorS2_S2_(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #1

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define void @_Z16add_side_as_quadP7segmentiP10vms_vector(ptr noundef %0, i32 noundef %1, ptr noundef %2) #2 !dbg !3860 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !3863, !DIExpression(), !3864)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !3865, !DIExpression(), !3866)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !3867, !DIExpression(), !3868)
    #dbg_declare(ptr %7, !3869, !DIExpression(), !3870)
  %8 = load ptr, ptr %4, align 8, !dbg !3871
  %9 = getelementptr inbounds nuw %struct.segment, ptr %8, i32 0, i32 0, !dbg !3872
  %10 = load i32, ptr %5, align 4, !dbg !3873
  %11 = sext i32 %10 to i64, !dbg !3871
  %12 = getelementptr inbounds [6 x %struct.side], ptr %9, i64 0, i64 %11, !dbg !3871
  store ptr %12, ptr %7, align 8, !dbg !3870
  %13 = load ptr, ptr %7, align 8, !dbg !3874
  %14 = getelementptr inbounds nuw %struct.side, ptr %13, i32 0, i32 0, !dbg !3875
  store i8 1, ptr %14, align 4, !dbg !3876
  %15 = load ptr, ptr %6, align 8, !dbg !3877
  %16 = load ptr, ptr %7, align 8, !dbg !3878
  %17 = getelementptr inbounds nuw %struct.side, ptr %16, i32 0, i32 6, !dbg !3879
  %18 = getelementptr inbounds [2 x %struct.vms_vector], ptr %17, i64 0, i64 0, !dbg !3878
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %18, ptr align 4 %15, i64 12, i1 false), !dbg !3880
  %19 = load ptr, ptr %6, align 8, !dbg !3881
  %20 = load ptr, ptr %7, align 8, !dbg !3882
  %21 = getelementptr inbounds nuw %struct.side, ptr %20, i32 0, i32 6, !dbg !3883
  %22 = getelementptr inbounds [2 x %struct.vms_vector], ptr %21, i64 0, i64 1, !dbg !3882
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %22, ptr align 4 %19, i64 12, i1 false), !dbg !3884
  ret void, !dbg !3885
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z20get_verts_for_normaliiiiPiS_S_S_S_(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, ptr noundef %4, ptr noundef %5, ptr noundef %6, ptr noundef %7, ptr noundef %8) #0 !dbg !3886 {
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
  %18 = alloca ptr, align 8
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca [4 x i32], align 4
  %22 = alloca [4 x i32], align 4
  %23 = alloca i32, align 4
  store i32 %0, ptr %10, align 4
    #dbg_declare(ptr %10, !3889, !DIExpression(), !3890)
  store i32 %1, ptr %11, align 4
    #dbg_declare(ptr %11, !3891, !DIExpression(), !3892)
  store i32 %2, ptr %12, align 4
    #dbg_declare(ptr %12, !3893, !DIExpression(), !3894)
  store i32 %3, ptr %13, align 4
    #dbg_declare(ptr %13, !3895, !DIExpression(), !3896)
  store ptr %4, ptr %14, align 8
    #dbg_declare(ptr %14, !3897, !DIExpression(), !3898)
  store ptr %5, ptr %15, align 8
    #dbg_declare(ptr %15, !3899, !DIExpression(), !3900)
  store ptr %6, ptr %16, align 8
    #dbg_declare(ptr %16, !3901, !DIExpression(), !3902)
  store ptr %7, ptr %17, align 8
    #dbg_declare(ptr %17, !3903, !DIExpression(), !3904)
  store ptr %8, ptr %18, align 8
    #dbg_declare(ptr %18, !3905, !DIExpression(), !3906)
    #dbg_declare(ptr %19, !3907, !DIExpression(), !3908)
    #dbg_declare(ptr %20, !3909, !DIExpression(), !3910)
    #dbg_declare(ptr %21, !3911, !DIExpression(), !3913)
    #dbg_declare(ptr %22, !3914, !DIExpression(), !3915)
  store i32 0, ptr %19, align 4, !dbg !3916
  br label %24, !dbg !3918

24:                                               ; preds = %32, %9
  %25 = load i32, ptr %19, align 4, !dbg !3919
  %26 = icmp slt i32 %25, 4, !dbg !3921
  br i1 %26, label %27, label %35, !dbg !3922

27:                                               ; preds = %24
  %28 = load i32, ptr %19, align 4, !dbg !3923
  %29 = load i32, ptr %19, align 4, !dbg !3924
  %30 = sext i32 %29 to i64, !dbg !3925
  %31 = getelementptr inbounds [4 x i32], ptr %22, i64 0, i64 %30, !dbg !3925
  store i32 %28, ptr %31, align 4, !dbg !3926
  br label %32, !dbg !3925

32:                                               ; preds = %27
  %33 = load i32, ptr %19, align 4, !dbg !3927
  %34 = add nsw i32 %33, 1, !dbg !3927
  store i32 %34, ptr %19, align 4, !dbg !3927
  br label %24, !dbg !3928, !llvm.loop !3929

35:                                               ; preds = %24
  %36 = load i32, ptr %10, align 4, !dbg !3931
  %37 = getelementptr inbounds [4 x i32], ptr %21, i64 0, i64 0, !dbg !3932
  store i32 %36, ptr %37, align 4, !dbg !3933
  %38 = load i32, ptr %11, align 4, !dbg !3934
  %39 = getelementptr inbounds [4 x i32], ptr %21, i64 0, i64 1, !dbg !3935
  store i32 %38, ptr %39, align 4, !dbg !3936
  %40 = load i32, ptr %12, align 4, !dbg !3937
  %41 = getelementptr inbounds [4 x i32], ptr %21, i64 0, i64 2, !dbg !3938
  store i32 %40, ptr %41, align 4, !dbg !3939
  %42 = load i32, ptr %13, align 4, !dbg !3940
  %43 = getelementptr inbounds [4 x i32], ptr %21, i64 0, i64 3, !dbg !3941
  store i32 %42, ptr %43, align 4, !dbg !3942
  store i32 1, ptr %19, align 4, !dbg !3943
  br label %44, !dbg !3945

44:                                               ; preds = %98, %35
  %45 = load i32, ptr %19, align 4, !dbg !3946
  %46 = icmp slt i32 %45, 4, !dbg !3948
  br i1 %46, label %47, label %101, !dbg !3949

47:                                               ; preds = %44
  store i32 0, ptr %20, align 4, !dbg !3950
  br label %48, !dbg !3952

48:                                               ; preds = %94, %47
  %49 = load i32, ptr %20, align 4, !dbg !3953
  %50 = load i32, ptr %19, align 4, !dbg !3955
  %51 = icmp slt i32 %49, %50, !dbg !3956
  br i1 %51, label %52, label %97, !dbg !3957

52:                                               ; preds = %48
  %53 = load i32, ptr %20, align 4, !dbg !3958
  %54 = sext i32 %53 to i64, !dbg !3960
  %55 = getelementptr inbounds [4 x i32], ptr %21, i64 0, i64 %54, !dbg !3960
  %56 = load i32, ptr %55, align 4, !dbg !3960
  %57 = load i32, ptr %19, align 4, !dbg !3961
  %58 = sext i32 %57 to i64, !dbg !3962
  %59 = getelementptr inbounds [4 x i32], ptr %21, i64 0, i64 %58, !dbg !3962
  %60 = load i32, ptr %59, align 4, !dbg !3962
  %61 = icmp sgt i32 %56, %60, !dbg !3963
  br i1 %61, label %62, label %93, !dbg !3963

62:                                               ; preds = %52
    #dbg_declare(ptr %23, !3964, !DIExpression(), !3966)
  %63 = load i32, ptr %20, align 4, !dbg !3967
  %64 = sext i32 %63 to i64, !dbg !3968
  %65 = getelementptr inbounds [4 x i32], ptr %21, i64 0, i64 %64, !dbg !3968
  %66 = load i32, ptr %65, align 4, !dbg !3968
  store i32 %66, ptr %23, align 4, !dbg !3969
  %67 = load i32, ptr %19, align 4, !dbg !3970
  %68 = sext i32 %67 to i64, !dbg !3971
  %69 = getelementptr inbounds [4 x i32], ptr %21, i64 0, i64 %68, !dbg !3971
  %70 = load i32, ptr %69, align 4, !dbg !3971
  %71 = load i32, ptr %20, align 4, !dbg !3972
  %72 = sext i32 %71 to i64, !dbg !3973
  %73 = getelementptr inbounds [4 x i32], ptr %21, i64 0, i64 %72, !dbg !3973
  store i32 %70, ptr %73, align 4, !dbg !3974
  %74 = load i32, ptr %23, align 4, !dbg !3975
  %75 = load i32, ptr %19, align 4, !dbg !3976
  %76 = sext i32 %75 to i64, !dbg !3977
  %77 = getelementptr inbounds [4 x i32], ptr %21, i64 0, i64 %76, !dbg !3977
  store i32 %74, ptr %77, align 4, !dbg !3978
  %78 = load i32, ptr %20, align 4, !dbg !3979
  %79 = sext i32 %78 to i64, !dbg !3980
  %80 = getelementptr inbounds [4 x i32], ptr %22, i64 0, i64 %79, !dbg !3980
  %81 = load i32, ptr %80, align 4, !dbg !3980
  store i32 %81, ptr %23, align 4, !dbg !3981
  %82 = load i32, ptr %19, align 4, !dbg !3982
  %83 = sext i32 %82 to i64, !dbg !3983
  %84 = getelementptr inbounds [4 x i32], ptr %22, i64 0, i64 %83, !dbg !3983
  %85 = load i32, ptr %84, align 4, !dbg !3983
  %86 = load i32, ptr %20, align 4, !dbg !3984
  %87 = sext i32 %86 to i64, !dbg !3985
  %88 = getelementptr inbounds [4 x i32], ptr %22, i64 0, i64 %87, !dbg !3985
  store i32 %85, ptr %88, align 4, !dbg !3986
  %89 = load i32, ptr %23, align 4, !dbg !3987
  %90 = load i32, ptr %19, align 4, !dbg !3988
  %91 = sext i32 %90 to i64, !dbg !3989
  %92 = getelementptr inbounds [4 x i32], ptr %22, i64 0, i64 %91, !dbg !3989
  store i32 %89, ptr %92, align 4, !dbg !3990
  br label %93, !dbg !3991

93:                                               ; preds = %62, %52
  br label %94, !dbg !3992

94:                                               ; preds = %93
  %95 = load i32, ptr %20, align 4, !dbg !3993
  %96 = add nsw i32 %95, 1, !dbg !3993
  store i32 %96, ptr %20, align 4, !dbg !3993
  br label %48, !dbg !3994, !llvm.loop !3995

97:                                               ; preds = %48
  br label %98, !dbg !3996

98:                                               ; preds = %97
  %99 = load i32, ptr %19, align 4, !dbg !3997
  %100 = add nsw i32 %99, 1, !dbg !3997
  store i32 %100, ptr %19, align 4, !dbg !3997
  br label %44, !dbg !3998, !llvm.loop !3999

101:                                              ; preds = %44
  %102 = getelementptr inbounds [4 x i32], ptr %21, i64 0, i64 0, !dbg !4001
  %103 = load i32, ptr %102, align 4, !dbg !4001
  %104 = getelementptr inbounds [4 x i32], ptr %21, i64 0, i64 1, !dbg !4001
  %105 = load i32, ptr %104, align 4, !dbg !4001
  %106 = icmp slt i32 %103, %105, !dbg !4001
  br i1 %106, label %107, label %119, !dbg !4001

107:                                              ; preds = %101
  %108 = getelementptr inbounds [4 x i32], ptr %21, i64 0, i64 1, !dbg !4001
  %109 = load i32, ptr %108, align 4, !dbg !4001
  %110 = getelementptr inbounds [4 x i32], ptr %21, i64 0, i64 2, !dbg !4001
  %111 = load i32, ptr %110, align 4, !dbg !4001
  %112 = icmp slt i32 %109, %111, !dbg !4001
  br i1 %112, label %113, label %119, !dbg !4001

113:                                              ; preds = %107
  %114 = getelementptr inbounds [4 x i32], ptr %21, i64 0, i64 2, !dbg !4001
  %115 = load i32, ptr %114, align 4, !dbg !4001
  %116 = getelementptr inbounds [4 x i32], ptr %21, i64 0, i64 3, !dbg !4001
  %117 = load i32, ptr %116, align 4, !dbg !4001
  %118 = icmp slt i32 %115, %117, !dbg !4001
  br label %119

119:                                              ; preds = %113, %107, %101
  %120 = phi i1 [ false, %107 ], [ false, %101 ], [ %118, %113 ], !dbg !4002
  %121 = zext i1 %120 to i32, !dbg !4001
  call void @_Z7_AssertiPKcS0_i(i32 noundef %121, ptr noundef @.str.21, ptr noundef @.str.2, i32 noundef 1806), !dbg !4001
  %122 = getelementptr inbounds [4 x i32], ptr %21, i64 0, i64 0, !dbg !4003
  %123 = load i32, ptr %122, align 4, !dbg !4003
  %124 = load ptr, ptr %14, align 8, !dbg !4004
  store i32 %123, ptr %124, align 4, !dbg !4005
  %125 = getelementptr inbounds [4 x i32], ptr %21, i64 0, i64 1, !dbg !4006
  %126 = load i32, ptr %125, align 4, !dbg !4006
  %127 = load ptr, ptr %15, align 8, !dbg !4007
  store i32 %126, ptr %127, align 4, !dbg !4008
  %128 = getelementptr inbounds [4 x i32], ptr %21, i64 0, i64 2, !dbg !4009
  %129 = load i32, ptr %128, align 4, !dbg !4009
  %130 = load ptr, ptr %16, align 8, !dbg !4010
  store i32 %129, ptr %130, align 4, !dbg !4011
  %131 = getelementptr inbounds [4 x i32], ptr %21, i64 0, i64 3, !dbg !4012
  %132 = load i32, ptr %131, align 4, !dbg !4012
  %133 = load ptr, ptr %17, align 8, !dbg !4013
  store i32 %132, ptr %133, align 4, !dbg !4014
  %134 = getelementptr inbounds [4 x i32], ptr %22, i64 0, i64 0, !dbg !4015
  %135 = load i32, ptr %134, align 4, !dbg !4015
  %136 = add nsw i32 %135, 3, !dbg !4017
  %137 = srem i32 %136, 4, !dbg !4018
  %138 = getelementptr inbounds [4 x i32], ptr %22, i64 0, i64 1, !dbg !4019
  %139 = load i32, ptr %138, align 4, !dbg !4019
  %140 = icmp eq i32 %137, %139, !dbg !4020
  br i1 %140, label %149, label %141, !dbg !4021

141:                                              ; preds = %119
  %142 = getelementptr inbounds [4 x i32], ptr %22, i64 0, i64 1, !dbg !4022
  %143 = load i32, ptr %142, align 4, !dbg !4022
  %144 = add nsw i32 %143, 3, !dbg !4023
  %145 = srem i32 %144, 4, !dbg !4024
  %146 = getelementptr inbounds [4 x i32], ptr %22, i64 0, i64 2, !dbg !4025
  %147 = load i32, ptr %146, align 4, !dbg !4025
  %148 = icmp eq i32 %145, %147, !dbg !4026
  br i1 %148, label %149, label %151, !dbg !4021

149:                                              ; preds = %141, %119
  %150 = load ptr, ptr %18, align 8, !dbg !4027
  store i32 1, ptr %150, align 4, !dbg !4028
  br label %153, !dbg !4029

151:                                              ; preds = %141
  %152 = load ptr, ptr %18, align 8, !dbg !4030
  store i32 0, ptr %152, align 4, !dbg !4031
  br label %153

153:                                              ; preds = %151, %149
  ret void, !dbg !4032
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z23add_side_as_2_trianglesP7segmenti(ptr noundef %0, i32 noundef %1) #0 !dbg !4033 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.vms_vector, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca %struct.vms_vector, align 4
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca [4 x i32], align 4
  %12 = alloca [4 x i32], align 4
  %13 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !4036, !DIExpression(), !4037)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !4038, !DIExpression(), !4039)
    #dbg_declare(ptr %5, !4040, !DIExpression(), !4041)
    #dbg_declare(ptr %6, !4042, !DIExpression(), !4043)
  %14 = load i32, ptr %4, align 4, !dbg !4044
  %15 = sext i32 %14 to i64, !dbg !4045
  %16 = getelementptr inbounds [6 x [4 x i8]], ptr @Side_to_verts, i64 0, i64 %15, !dbg !4045
  %17 = getelementptr inbounds [4 x i8], ptr %16, i64 0, i64 0, !dbg !4045
  store ptr %17, ptr %6, align 8, !dbg !4043
    #dbg_declare(ptr %7, !4046, !DIExpression(), !4047)
    #dbg_declare(ptr %8, !4048, !DIExpression(), !4049)
    #dbg_declare(ptr %9, !4050, !DIExpression(), !4051)
  %18 = load ptr, ptr %3, align 8, !dbg !4052
  %19 = getelementptr inbounds nuw %struct.segment, ptr %18, i32 0, i32 0, !dbg !4053
  %20 = load i32, ptr %4, align 4, !dbg !4054
  %21 = sext i32 %20 to i64, !dbg !4052
  %22 = getelementptr inbounds [6 x %struct.side], ptr %19, i64 0, i64 %21, !dbg !4052
  store ptr %22, ptr %9, align 8, !dbg !4051
  %23 = load ptr, ptr %3, align 8, !dbg !4055
  %24 = getelementptr inbounds nuw %struct.segment, ptr %23, i32 0, i32 1, !dbg !4055
  %25 = load i32, ptr %4, align 4, !dbg !4055
  %26 = sext i32 %25 to i64, !dbg !4055
  %27 = getelementptr inbounds [6 x i16], ptr %24, i64 0, i64 %26, !dbg !4055
  %28 = load i16, ptr %27, align 2, !dbg !4055
  %29 = sext i16 %28 to i32, !dbg !4055
  %30 = icmp sgt i32 %29, -1, !dbg !4055
  br i1 %30, label %238, label %31, !dbg !4057

31:                                               ; preds = %2
  %32 = load ptr, ptr %3, align 8, !dbg !4058
  %33 = getelementptr inbounds nuw %struct.segment, ptr %32, i32 0, i32 2, !dbg !4060
  %34 = load ptr, ptr %6, align 8, !dbg !4061
  %35 = getelementptr inbounds i8, ptr %34, i64 0, !dbg !4061
  %36 = load i8, ptr %35, align 1, !dbg !4061
  %37 = sext i8 %36 to i64, !dbg !4058
  %38 = getelementptr inbounds [8 x i16], ptr %33, i64 0, i64 %37, !dbg !4058
  %39 = load i16, ptr %38, align 2, !dbg !4058
  %40 = sext i16 %39 to i64, !dbg !4062
  %41 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %40, !dbg !4062
  %42 = load ptr, ptr %3, align 8, !dbg !4063
  %43 = getelementptr inbounds nuw %struct.segment, ptr %42, i32 0, i32 2, !dbg !4064
  %44 = load ptr, ptr %6, align 8, !dbg !4065
  %45 = getelementptr inbounds i8, ptr %44, i64 1, !dbg !4065
  %46 = load i8, ptr %45, align 1, !dbg !4065
  %47 = sext i8 %46 to i64, !dbg !4063
  %48 = getelementptr inbounds [8 x i16], ptr %43, i64 0, i64 %47, !dbg !4063
  %49 = load i16, ptr %48, align 2, !dbg !4063
  %50 = sext i16 %49 to i64, !dbg !4066
  %51 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %50, !dbg !4066
  %52 = load ptr, ptr %3, align 8, !dbg !4067
  %53 = getelementptr inbounds nuw %struct.segment, ptr %52, i32 0, i32 2, !dbg !4068
  %54 = load ptr, ptr %6, align 8, !dbg !4069
  %55 = getelementptr inbounds i8, ptr %54, i64 2, !dbg !4069
  %56 = load i8, ptr %55, align 1, !dbg !4069
  %57 = sext i8 %56 to i64, !dbg !4067
  %58 = getelementptr inbounds [8 x i16], ptr %53, i64 0, i64 %57, !dbg !4067
  %59 = load i16, ptr %58, align 2, !dbg !4067
  %60 = sext i16 %59 to i64, !dbg !4070
  %61 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %60, !dbg !4070
  %62 = call noundef ptr @_Z13vm_vec_normalP10vms_vectorS0_S0_S0_(ptr noundef %5, ptr noundef %41, ptr noundef %51, ptr noundef %61), !dbg !4071
  %63 = load ptr, ptr %3, align 8, !dbg !4072
  %64 = getelementptr inbounds nuw %struct.segment, ptr %63, i32 0, i32 2, !dbg !4073
  %65 = load ptr, ptr %6, align 8, !dbg !4074
  %66 = getelementptr inbounds i8, ptr %65, i64 3, !dbg !4074
  %67 = load i8, ptr %66, align 1, !dbg !4074
  %68 = sext i8 %67 to i64, !dbg !4072
  %69 = getelementptr inbounds [8 x i16], ptr %64, i64 0, i64 %68, !dbg !4072
  %70 = load i16, ptr %69, align 2, !dbg !4072
  %71 = sext i16 %70 to i64, !dbg !4075
  %72 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %71, !dbg !4075
  %73 = load ptr, ptr %3, align 8, !dbg !4076
  %74 = getelementptr inbounds nuw %struct.segment, ptr %73, i32 0, i32 2, !dbg !4077
  %75 = load ptr, ptr %6, align 8, !dbg !4078
  %76 = getelementptr inbounds i8, ptr %75, i64 1, !dbg !4078
  %77 = load i8, ptr %76, align 1, !dbg !4078
  %78 = sext i8 %77 to i64, !dbg !4076
  %79 = getelementptr inbounds [8 x i16], ptr %74, i64 0, i64 %78, !dbg !4076
  %80 = load i16, ptr %79, align 2, !dbg !4076
  %81 = sext i16 %80 to i64, !dbg !4079
  %82 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %81, !dbg !4079
  %83 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %8, ptr noundef %72, ptr noundef %82), !dbg !4080
  %84 = call noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef %5, ptr noundef %8), !dbg !4081
  store i32 %84, ptr %7, align 4, !dbg !4082
  %85 = load i32, ptr %7, align 4, !dbg !4083
  %86 = icmp sge i32 %85, 0, !dbg !4085
  br i1 %86, label %87, label %90, !dbg !4085

87:                                               ; preds = %31
  %88 = load ptr, ptr %9, align 8, !dbg !4086
  %89 = getelementptr inbounds nuw %struct.side, ptr %88, i32 0, i32 0, !dbg !4087
  store i8 2, ptr %89, align 4, !dbg !4088
  br label %93, !dbg !4086

90:                                               ; preds = %31
  %91 = load ptr, ptr %9, align 8, !dbg !4089
  %92 = getelementptr inbounds nuw %struct.side, ptr %91, i32 0, i32 0, !dbg !4090
  store i8 3, ptr %92, align 4, !dbg !4091
  br label %93

93:                                               ; preds = %90, %87
  %94 = load ptr, ptr %9, align 8, !dbg !4092
  %95 = getelementptr inbounds nuw %struct.side, ptr %94, i32 0, i32 0, !dbg !4094
  %96 = load i8, ptr %95, align 4, !dbg !4094
  %97 = sext i8 %96 to i32, !dbg !4092
  %98 = icmp eq i32 %97, 2, !dbg !4095
  br i1 %98, label %99, label %168, !dbg !4095

99:                                               ; preds = %93
  %100 = load ptr, ptr %3, align 8, !dbg !4096
  %101 = getelementptr inbounds nuw %struct.segment, ptr %100, i32 0, i32 2, !dbg !4098
  %102 = load ptr, ptr %6, align 8, !dbg !4099
  %103 = getelementptr inbounds i8, ptr %102, i64 0, !dbg !4099
  %104 = load i8, ptr %103, align 1, !dbg !4099
  %105 = sext i8 %104 to i64, !dbg !4096
  %106 = getelementptr inbounds [8 x i16], ptr %101, i64 0, i64 %105, !dbg !4096
  %107 = load i16, ptr %106, align 2, !dbg !4096
  %108 = sext i16 %107 to i64, !dbg !4100
  %109 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %108, !dbg !4100
  %110 = load ptr, ptr %3, align 8, !dbg !4101
  %111 = getelementptr inbounds nuw %struct.segment, ptr %110, i32 0, i32 2, !dbg !4102
  %112 = load ptr, ptr %6, align 8, !dbg !4103
  %113 = getelementptr inbounds i8, ptr %112, i64 1, !dbg !4103
  %114 = load i8, ptr %113, align 1, !dbg !4103
  %115 = sext i8 %114 to i64, !dbg !4101
  %116 = getelementptr inbounds [8 x i16], ptr %111, i64 0, i64 %115, !dbg !4101
  %117 = load i16, ptr %116, align 2, !dbg !4101
  %118 = sext i16 %117 to i64, !dbg !4104
  %119 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %118, !dbg !4104
  %120 = load ptr, ptr %3, align 8, !dbg !4105
  %121 = getelementptr inbounds nuw %struct.segment, ptr %120, i32 0, i32 2, !dbg !4106
  %122 = load ptr, ptr %6, align 8, !dbg !4107
  %123 = getelementptr inbounds i8, ptr %122, i64 2, !dbg !4107
  %124 = load i8, ptr %123, align 1, !dbg !4107
  %125 = sext i8 %124 to i64, !dbg !4105
  %126 = getelementptr inbounds [8 x i16], ptr %121, i64 0, i64 %125, !dbg !4105
  %127 = load i16, ptr %126, align 2, !dbg !4105
  %128 = sext i16 %127 to i64, !dbg !4108
  %129 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %128, !dbg !4108
  %130 = call noundef ptr @_Z13vm_vec_normalP10vms_vectorS0_S0_S0_(ptr noundef %5, ptr noundef %109, ptr noundef %119, ptr noundef %129), !dbg !4109
  %131 = load ptr, ptr %9, align 8, !dbg !4110
  %132 = getelementptr inbounds nuw %struct.side, ptr %131, i32 0, i32 6, !dbg !4111
  %133 = getelementptr inbounds [2 x %struct.vms_vector], ptr %132, i64 0, i64 0, !dbg !4110
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %133, ptr align 4 %5, i64 12, i1 false), !dbg !4112
  %134 = load ptr, ptr %3, align 8, !dbg !4113
  %135 = getelementptr inbounds nuw %struct.segment, ptr %134, i32 0, i32 2, !dbg !4114
  %136 = load ptr, ptr %6, align 8, !dbg !4115
  %137 = getelementptr inbounds i8, ptr %136, i64 0, !dbg !4115
  %138 = load i8, ptr %137, align 1, !dbg !4115
  %139 = sext i8 %138 to i64, !dbg !4113
  %140 = getelementptr inbounds [8 x i16], ptr %135, i64 0, i64 %139, !dbg !4113
  %141 = load i16, ptr %140, align 2, !dbg !4113
  %142 = sext i16 %141 to i64, !dbg !4116
  %143 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %142, !dbg !4116
  %144 = load ptr, ptr %3, align 8, !dbg !4117
  %145 = getelementptr inbounds nuw %struct.segment, ptr %144, i32 0, i32 2, !dbg !4118
  %146 = load ptr, ptr %6, align 8, !dbg !4119
  %147 = getelementptr inbounds i8, ptr %146, i64 2, !dbg !4119
  %148 = load i8, ptr %147, align 1, !dbg !4119
  %149 = sext i8 %148 to i64, !dbg !4117
  %150 = getelementptr inbounds [8 x i16], ptr %145, i64 0, i64 %149, !dbg !4117
  %151 = load i16, ptr %150, align 2, !dbg !4117
  %152 = sext i16 %151 to i64, !dbg !4120
  %153 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %152, !dbg !4120
  %154 = load ptr, ptr %3, align 8, !dbg !4121
  %155 = getelementptr inbounds nuw %struct.segment, ptr %154, i32 0, i32 2, !dbg !4122
  %156 = load ptr, ptr %6, align 8, !dbg !4123
  %157 = getelementptr inbounds i8, ptr %156, i64 3, !dbg !4123
  %158 = load i8, ptr %157, align 1, !dbg !4123
  %159 = sext i8 %158 to i64, !dbg !4121
  %160 = getelementptr inbounds [8 x i16], ptr %155, i64 0, i64 %159, !dbg !4121
  %161 = load i16, ptr %160, align 2, !dbg !4121
  %162 = sext i16 %161 to i64, !dbg !4124
  %163 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %162, !dbg !4124
  %164 = call noundef ptr @_Z13vm_vec_normalP10vms_vectorS0_S0_S0_(ptr noundef %5, ptr noundef %143, ptr noundef %153, ptr noundef %163), !dbg !4125
  %165 = load ptr, ptr %9, align 8, !dbg !4126
  %166 = getelementptr inbounds nuw %struct.side, ptr %165, i32 0, i32 6, !dbg !4127
  %167 = getelementptr inbounds [2 x %struct.vms_vector], ptr %166, i64 0, i64 1, !dbg !4126
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %167, ptr align 4 %5, i64 12, i1 false), !dbg !4128
  br label %237, !dbg !4129

168:                                              ; preds = %93
  %169 = load ptr, ptr %3, align 8, !dbg !4130
  %170 = getelementptr inbounds nuw %struct.segment, ptr %169, i32 0, i32 2, !dbg !4132
  %171 = load ptr, ptr %6, align 8, !dbg !4133
  %172 = getelementptr inbounds i8, ptr %171, i64 0, !dbg !4133
  %173 = load i8, ptr %172, align 1, !dbg !4133
  %174 = sext i8 %173 to i64, !dbg !4130
  %175 = getelementptr inbounds [8 x i16], ptr %170, i64 0, i64 %174, !dbg !4130
  %176 = load i16, ptr %175, align 2, !dbg !4130
  %177 = sext i16 %176 to i64, !dbg !4134
  %178 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %177, !dbg !4134
  %179 = load ptr, ptr %3, align 8, !dbg !4135
  %180 = getelementptr inbounds nuw %struct.segment, ptr %179, i32 0, i32 2, !dbg !4136
  %181 = load ptr, ptr %6, align 8, !dbg !4137
  %182 = getelementptr inbounds i8, ptr %181, i64 1, !dbg !4137
  %183 = load i8, ptr %182, align 1, !dbg !4137
  %184 = sext i8 %183 to i64, !dbg !4135
  %185 = getelementptr inbounds [8 x i16], ptr %180, i64 0, i64 %184, !dbg !4135
  %186 = load i16, ptr %185, align 2, !dbg !4135
  %187 = sext i16 %186 to i64, !dbg !4138
  %188 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %187, !dbg !4138
  %189 = load ptr, ptr %3, align 8, !dbg !4139
  %190 = getelementptr inbounds nuw %struct.segment, ptr %189, i32 0, i32 2, !dbg !4140
  %191 = load ptr, ptr %6, align 8, !dbg !4141
  %192 = getelementptr inbounds i8, ptr %191, i64 3, !dbg !4141
  %193 = load i8, ptr %192, align 1, !dbg !4141
  %194 = sext i8 %193 to i64, !dbg !4139
  %195 = getelementptr inbounds [8 x i16], ptr %190, i64 0, i64 %194, !dbg !4139
  %196 = load i16, ptr %195, align 2, !dbg !4139
  %197 = sext i16 %196 to i64, !dbg !4142
  %198 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %197, !dbg !4142
  %199 = call noundef ptr @_Z13vm_vec_normalP10vms_vectorS0_S0_S0_(ptr noundef %5, ptr noundef %178, ptr noundef %188, ptr noundef %198), !dbg !4143
  %200 = load ptr, ptr %9, align 8, !dbg !4144
  %201 = getelementptr inbounds nuw %struct.side, ptr %200, i32 0, i32 6, !dbg !4145
  %202 = getelementptr inbounds [2 x %struct.vms_vector], ptr %201, i64 0, i64 0, !dbg !4144
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %202, ptr align 4 %5, i64 12, i1 false), !dbg !4146
  %203 = load ptr, ptr %3, align 8, !dbg !4147
  %204 = getelementptr inbounds nuw %struct.segment, ptr %203, i32 0, i32 2, !dbg !4148
  %205 = load ptr, ptr %6, align 8, !dbg !4149
  %206 = getelementptr inbounds i8, ptr %205, i64 1, !dbg !4149
  %207 = load i8, ptr %206, align 1, !dbg !4149
  %208 = sext i8 %207 to i64, !dbg !4147
  %209 = getelementptr inbounds [8 x i16], ptr %204, i64 0, i64 %208, !dbg !4147
  %210 = load i16, ptr %209, align 2, !dbg !4147
  %211 = sext i16 %210 to i64, !dbg !4150
  %212 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %211, !dbg !4150
  %213 = load ptr, ptr %3, align 8, !dbg !4151
  %214 = getelementptr inbounds nuw %struct.segment, ptr %213, i32 0, i32 2, !dbg !4152
  %215 = load ptr, ptr %6, align 8, !dbg !4153
  %216 = getelementptr inbounds i8, ptr %215, i64 2, !dbg !4153
  %217 = load i8, ptr %216, align 1, !dbg !4153
  %218 = sext i8 %217 to i64, !dbg !4151
  %219 = getelementptr inbounds [8 x i16], ptr %214, i64 0, i64 %218, !dbg !4151
  %220 = load i16, ptr %219, align 2, !dbg !4151
  %221 = sext i16 %220 to i64, !dbg !4154
  %222 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %221, !dbg !4154
  %223 = load ptr, ptr %3, align 8, !dbg !4155
  %224 = getelementptr inbounds nuw %struct.segment, ptr %223, i32 0, i32 2, !dbg !4156
  %225 = load ptr, ptr %6, align 8, !dbg !4157
  %226 = getelementptr inbounds i8, ptr %225, i64 3, !dbg !4157
  %227 = load i8, ptr %226, align 1, !dbg !4157
  %228 = sext i8 %227 to i64, !dbg !4155
  %229 = getelementptr inbounds [8 x i16], ptr %224, i64 0, i64 %228, !dbg !4155
  %230 = load i16, ptr %229, align 2, !dbg !4155
  %231 = sext i16 %230 to i64, !dbg !4158
  %232 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %231, !dbg !4158
  %233 = call noundef ptr @_Z13vm_vec_normalP10vms_vectorS0_S0_S0_(ptr noundef %5, ptr noundef %212, ptr noundef %222, ptr noundef %232), !dbg !4159
  %234 = load ptr, ptr %9, align 8, !dbg !4160
  %235 = getelementptr inbounds nuw %struct.side, ptr %234, i32 0, i32 6, !dbg !4161
  %236 = getelementptr inbounds [2 x %struct.vms_vector], ptr %235, i64 0, i64 1, !dbg !4160
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %236, ptr align 4 %5, i64 12, i1 false), !dbg !4162
  br label %237

237:                                              ; preds = %168, %99
  br label %467, !dbg !4163

238:                                              ; preds = %2
    #dbg_declare(ptr %10, !4164, !DIExpression(), !4166)
    #dbg_declare(ptr %11, !4167, !DIExpression(), !4168)
    #dbg_declare(ptr %12, !4169, !DIExpression(), !4170)
    #dbg_declare(ptr %13, !4171, !DIExpression(), !4172)
  store i32 0, ptr %10, align 4, !dbg !4173
  br label %239, !dbg !4175

239:                                              ; preds = %257, %238
  %240 = load i32, ptr %10, align 4, !dbg !4176
  %241 = icmp slt i32 %240, 4, !dbg !4178
  br i1 %241, label %242, label %260, !dbg !4179

242:                                              ; preds = %239
  %243 = load ptr, ptr %3, align 8, !dbg !4180
  %244 = getelementptr inbounds nuw %struct.segment, ptr %243, i32 0, i32 2, !dbg !4181
  %245 = load ptr, ptr %6, align 8, !dbg !4182
  %246 = load i32, ptr %10, align 4, !dbg !4183
  %247 = sext i32 %246 to i64, !dbg !4182
  %248 = getelementptr inbounds i8, ptr %245, i64 %247, !dbg !4182
  %249 = load i8, ptr %248, align 1, !dbg !4182
  %250 = sext i8 %249 to i64, !dbg !4180
  %251 = getelementptr inbounds [8 x i16], ptr %244, i64 0, i64 %250, !dbg !4180
  %252 = load i16, ptr %251, align 2, !dbg !4180
  %253 = sext i16 %252 to i32, !dbg !4180
  %254 = load i32, ptr %10, align 4, !dbg !4184
  %255 = sext i32 %254 to i64, !dbg !4185
  %256 = getelementptr inbounds [4 x i32], ptr %11, i64 0, i64 %255, !dbg !4185
  store i32 %253, ptr %256, align 4, !dbg !4186
  br label %257, !dbg !4185

257:                                              ; preds = %242
  %258 = load i32, ptr %10, align 4, !dbg !4187
  %259 = add nsw i32 %258, 1, !dbg !4187
  store i32 %259, ptr %10, align 4, !dbg !4187
  br label %239, !dbg !4188, !llvm.loop !4189

260:                                              ; preds = %239
  %261 = getelementptr inbounds [4 x i32], ptr %11, i64 0, i64 0, !dbg !4191
  %262 = load i32, ptr %261, align 4, !dbg !4191
  %263 = getelementptr inbounds [4 x i32], ptr %11, i64 0, i64 1, !dbg !4192
  %264 = load i32, ptr %263, align 4, !dbg !4192
  %265 = getelementptr inbounds [4 x i32], ptr %11, i64 0, i64 2, !dbg !4193
  %266 = load i32, ptr %265, align 4, !dbg !4193
  %267 = getelementptr inbounds [4 x i32], ptr %11, i64 0, i64 3, !dbg !4194
  %268 = load i32, ptr %267, align 4, !dbg !4194
  %269 = getelementptr inbounds [4 x i32], ptr %12, i64 0, i64 0, !dbg !4195
  %270 = getelementptr inbounds [4 x i32], ptr %12, i64 0, i64 1, !dbg !4196
  %271 = getelementptr inbounds [4 x i32], ptr %12, i64 0, i64 2, !dbg !4197
  %272 = getelementptr inbounds [4 x i32], ptr %12, i64 0, i64 3, !dbg !4198
  call void @_Z20get_verts_for_normaliiiiPiS_S_S_S_(i32 noundef %262, i32 noundef %264, i32 noundef %266, i32 noundef %268, ptr noundef %269, ptr noundef %270, ptr noundef %271, ptr noundef %272, ptr noundef %13), !dbg !4199
  %273 = getelementptr inbounds [4 x i32], ptr %12, i64 0, i64 0, !dbg !4200
  %274 = load i32, ptr %273, align 4, !dbg !4200
  %275 = getelementptr inbounds [4 x i32], ptr %11, i64 0, i64 0, !dbg !4202
  %276 = load i32, ptr %275, align 4, !dbg !4202
  %277 = icmp eq i32 %274, %276, !dbg !4203
  br i1 %277, label %284, label %278, !dbg !4204

278:                                              ; preds = %260
  %279 = getelementptr inbounds [4 x i32], ptr %12, i64 0, i64 0, !dbg !4205
  %280 = load i32, ptr %279, align 4, !dbg !4205
  %281 = getelementptr inbounds [4 x i32], ptr %11, i64 0, i64 2, !dbg !4206
  %282 = load i32, ptr %281, align 4, !dbg !4206
  %283 = icmp eq i32 %280, %282, !dbg !4207
  br i1 %283, label %284, label %375, !dbg !4204

284:                                              ; preds = %278, %260
  %285 = load ptr, ptr %9, align 8, !dbg !4208
  %286 = getelementptr inbounds nuw %struct.side, ptr %285, i32 0, i32 0, !dbg !4210
  store i8 2, ptr %286, align 4, !dbg !4211
  %287 = getelementptr inbounds [4 x i32], ptr %11, i64 0, i64 0, !dbg !4212
  %288 = load i32, ptr %287, align 4, !dbg !4212
  %289 = getelementptr inbounds [4 x i32], ptr %11, i64 0, i64 1, !dbg !4213
  %290 = load i32, ptr %289, align 4, !dbg !4213
  %291 = getelementptr inbounds [4 x i32], ptr %11, i64 0, i64 2, !dbg !4214
  %292 = load i32, ptr %291, align 4, !dbg !4214
  %293 = getelementptr inbounds [4 x i32], ptr %12, i64 0, i64 0, !dbg !4215
  %294 = getelementptr inbounds [4 x i32], ptr %12, i64 0, i64 1, !dbg !4216
  %295 = getelementptr inbounds [4 x i32], ptr %12, i64 0, i64 2, !dbg !4217
  %296 = getelementptr inbounds [4 x i32], ptr %12, i64 0, i64 3, !dbg !4218
  call void @_Z20get_verts_for_normaliiiiPiS_S_S_S_(i32 noundef %288, i32 noundef %290, i32 noundef %292, i32 noundef 32767, ptr noundef %293, ptr noundef %294, ptr noundef %295, ptr noundef %296, ptr noundef %13), !dbg !4219
  %297 = getelementptr inbounds [4 x i32], ptr %12, i64 0, i64 0, !dbg !4220
  %298 = load i32, ptr %297, align 4, !dbg !4220
  %299 = sext i32 %298 to i64, !dbg !4221
  %300 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %299, !dbg !4221
  %301 = getelementptr inbounds [4 x i32], ptr %12, i64 0, i64 1, !dbg !4222
  %302 = load i32, ptr %301, align 4, !dbg !4222
  %303 = sext i32 %302 to i64, !dbg !4223
  %304 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %303, !dbg !4223
  %305 = getelementptr inbounds [4 x i32], ptr %12, i64 0, i64 2, !dbg !4224
  %306 = load i32, ptr %305, align 4, !dbg !4224
  %307 = sext i32 %306 to i64, !dbg !4225
  %308 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %307, !dbg !4225
  %309 = call noundef ptr @_Z13vm_vec_normalP10vms_vectorS0_S0_S0_(ptr noundef %5, ptr noundef %300, ptr noundef %304, ptr noundef %308), !dbg !4226
  %310 = load i32, ptr %13, align 4, !dbg !4227
  %311 = icmp ne i32 %310, 0, !dbg !4227
  br i1 %311, label %312, label %327, !dbg !4227

312:                                              ; preds = %284
  br label %313, !dbg !4229

313:                                              ; preds = %312
  %314 = getelementptr inbounds nuw %struct.vms_vector, ptr %5, i32 0, i32 0, !dbg !4230
  %315 = load i32, ptr %314, align 4, !dbg !4230
  %316 = sub nsw i32 0, %315, !dbg !4230
  %317 = getelementptr inbounds nuw %struct.vms_vector, ptr %5, i32 0, i32 0, !dbg !4230
  store i32 %316, ptr %317, align 4, !dbg !4230
  %318 = getelementptr inbounds nuw %struct.vms_vector, ptr %5, i32 0, i32 1, !dbg !4230
  %319 = load i32, ptr %318, align 4, !dbg !4230
  %320 = sub nsw i32 0, %319, !dbg !4230
  %321 = getelementptr inbounds nuw %struct.vms_vector, ptr %5, i32 0, i32 1, !dbg !4230
  store i32 %320, ptr %321, align 4, !dbg !4230
  %322 = getelementptr inbounds nuw %struct.vms_vector, ptr %5, i32 0, i32 2, !dbg !4230
  %323 = load i32, ptr %322, align 4, !dbg !4230
  %324 = sub nsw i32 0, %323, !dbg !4230
  %325 = getelementptr inbounds nuw %struct.vms_vector, ptr %5, i32 0, i32 2, !dbg !4230
  store i32 %324, ptr %325, align 4, !dbg !4230
  br label %326, !dbg !4230

326:                                              ; preds = %313
  br label %327, !dbg !4230

327:                                              ; preds = %326, %284
  %328 = load ptr, ptr %9, align 8, !dbg !4232
  %329 = getelementptr inbounds nuw %struct.side, ptr %328, i32 0, i32 6, !dbg !4233
  %330 = getelementptr inbounds [2 x %struct.vms_vector], ptr %329, i64 0, i64 0, !dbg !4232
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %330, ptr align 4 %5, i64 12, i1 false), !dbg !4234
  %331 = getelementptr inbounds [4 x i32], ptr %11, i64 0, i64 0, !dbg !4235
  %332 = load i32, ptr %331, align 4, !dbg !4235
  %333 = getelementptr inbounds [4 x i32], ptr %11, i64 0, i64 2, !dbg !4236
  %334 = load i32, ptr %333, align 4, !dbg !4236
  %335 = getelementptr inbounds [4 x i32], ptr %11, i64 0, i64 3, !dbg !4237
  %336 = load i32, ptr %335, align 4, !dbg !4237
  %337 = getelementptr inbounds [4 x i32], ptr %12, i64 0, i64 0, !dbg !4238
  %338 = getelementptr inbounds [4 x i32], ptr %12, i64 0, i64 1, !dbg !4239
  %339 = getelementptr inbounds [4 x i32], ptr %12, i64 0, i64 2, !dbg !4240
  %340 = getelementptr inbounds [4 x i32], ptr %12, i64 0, i64 3, !dbg !4241
  call void @_Z20get_verts_for_normaliiiiPiS_S_S_S_(i32 noundef %332, i32 noundef %334, i32 noundef %336, i32 noundef 32767, ptr noundef %337, ptr noundef %338, ptr noundef %339, ptr noundef %340, ptr noundef %13), !dbg !4242
  %341 = getelementptr inbounds [4 x i32], ptr %12, i64 0, i64 0, !dbg !4243
  %342 = load i32, ptr %341, align 4, !dbg !4243
  %343 = sext i32 %342 to i64, !dbg !4244
  %344 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %343, !dbg !4244
  %345 = getelementptr inbounds [4 x i32], ptr %12, i64 0, i64 1, !dbg !4245
  %346 = load i32, ptr %345, align 4, !dbg !4245
  %347 = sext i32 %346 to i64, !dbg !4246
  %348 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %347, !dbg !4246
  %349 = getelementptr inbounds [4 x i32], ptr %12, i64 0, i64 2, !dbg !4247
  %350 = load i32, ptr %349, align 4, !dbg !4247
  %351 = sext i32 %350 to i64, !dbg !4248
  %352 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %351, !dbg !4248
  %353 = call noundef ptr @_Z13vm_vec_normalP10vms_vectorS0_S0_S0_(ptr noundef %5, ptr noundef %344, ptr noundef %348, ptr noundef %352), !dbg !4249
  %354 = load i32, ptr %13, align 4, !dbg !4250
  %355 = icmp ne i32 %354, 0, !dbg !4250
  br i1 %355, label %356, label %371, !dbg !4250

356:                                              ; preds = %327
  br label %357, !dbg !4252

357:                                              ; preds = %356
  %358 = getelementptr inbounds nuw %struct.vms_vector, ptr %5, i32 0, i32 0, !dbg !4253
  %359 = load i32, ptr %358, align 4, !dbg !4253
  %360 = sub nsw i32 0, %359, !dbg !4253
  %361 = getelementptr inbounds nuw %struct.vms_vector, ptr %5, i32 0, i32 0, !dbg !4253
  store i32 %360, ptr %361, align 4, !dbg !4253
  %362 = getelementptr inbounds nuw %struct.vms_vector, ptr %5, i32 0, i32 1, !dbg !4253
  %363 = load i32, ptr %362, align 4, !dbg !4253
  %364 = sub nsw i32 0, %363, !dbg !4253
  %365 = getelementptr inbounds nuw %struct.vms_vector, ptr %5, i32 0, i32 1, !dbg !4253
  store i32 %364, ptr %365, align 4, !dbg !4253
  %366 = getelementptr inbounds nuw %struct.vms_vector, ptr %5, i32 0, i32 2, !dbg !4253
  %367 = load i32, ptr %366, align 4, !dbg !4253
  %368 = sub nsw i32 0, %367, !dbg !4253
  %369 = getelementptr inbounds nuw %struct.vms_vector, ptr %5, i32 0, i32 2, !dbg !4253
  store i32 %368, ptr %369, align 4, !dbg !4253
  br label %370, !dbg !4253

370:                                              ; preds = %357
  br label %371, !dbg !4253

371:                                              ; preds = %370, %327
  %372 = load ptr, ptr %9, align 8, !dbg !4255
  %373 = getelementptr inbounds nuw %struct.side, ptr %372, i32 0, i32 6, !dbg !4256
  %374 = getelementptr inbounds [2 x %struct.vms_vector], ptr %373, i64 0, i64 1, !dbg !4255
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %374, ptr align 4 %5, i64 12, i1 false), !dbg !4257
  br label %466, !dbg !4258

375:                                              ; preds = %278
  %376 = load ptr, ptr %9, align 8, !dbg !4259
  %377 = getelementptr inbounds nuw %struct.side, ptr %376, i32 0, i32 0, !dbg !4261
  store i8 3, ptr %377, align 4, !dbg !4262
  %378 = getelementptr inbounds [4 x i32], ptr %11, i64 0, i64 0, !dbg !4263
  %379 = load i32, ptr %378, align 4, !dbg !4263
  %380 = getelementptr inbounds [4 x i32], ptr %11, i64 0, i64 1, !dbg !4264
  %381 = load i32, ptr %380, align 4, !dbg !4264
  %382 = getelementptr inbounds [4 x i32], ptr %11, i64 0, i64 3, !dbg !4265
  %383 = load i32, ptr %382, align 4, !dbg !4265
  %384 = getelementptr inbounds [4 x i32], ptr %12, i64 0, i64 0, !dbg !4266
  %385 = getelementptr inbounds [4 x i32], ptr %12, i64 0, i64 1, !dbg !4267
  %386 = getelementptr inbounds [4 x i32], ptr %12, i64 0, i64 2, !dbg !4268
  %387 = getelementptr inbounds [4 x i32], ptr %12, i64 0, i64 3, !dbg !4269
  call void @_Z20get_verts_for_normaliiiiPiS_S_S_S_(i32 noundef %379, i32 noundef %381, i32 noundef %383, i32 noundef 32767, ptr noundef %384, ptr noundef %385, ptr noundef %386, ptr noundef %387, ptr noundef %13), !dbg !4270
  %388 = getelementptr inbounds [4 x i32], ptr %12, i64 0, i64 0, !dbg !4271
  %389 = load i32, ptr %388, align 4, !dbg !4271
  %390 = sext i32 %389 to i64, !dbg !4272
  %391 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %390, !dbg !4272
  %392 = getelementptr inbounds [4 x i32], ptr %12, i64 0, i64 1, !dbg !4273
  %393 = load i32, ptr %392, align 4, !dbg !4273
  %394 = sext i32 %393 to i64, !dbg !4274
  %395 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %394, !dbg !4274
  %396 = getelementptr inbounds [4 x i32], ptr %12, i64 0, i64 2, !dbg !4275
  %397 = load i32, ptr %396, align 4, !dbg !4275
  %398 = sext i32 %397 to i64, !dbg !4276
  %399 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %398, !dbg !4276
  %400 = call noundef ptr @_Z13vm_vec_normalP10vms_vectorS0_S0_S0_(ptr noundef %5, ptr noundef %391, ptr noundef %395, ptr noundef %399), !dbg !4277
  %401 = load i32, ptr %13, align 4, !dbg !4278
  %402 = icmp ne i32 %401, 0, !dbg !4278
  br i1 %402, label %403, label %418, !dbg !4278

403:                                              ; preds = %375
  br label %404, !dbg !4280

404:                                              ; preds = %403
  %405 = getelementptr inbounds nuw %struct.vms_vector, ptr %5, i32 0, i32 0, !dbg !4281
  %406 = load i32, ptr %405, align 4, !dbg !4281
  %407 = sub nsw i32 0, %406, !dbg !4281
  %408 = getelementptr inbounds nuw %struct.vms_vector, ptr %5, i32 0, i32 0, !dbg !4281
  store i32 %407, ptr %408, align 4, !dbg !4281
  %409 = getelementptr inbounds nuw %struct.vms_vector, ptr %5, i32 0, i32 1, !dbg !4281
  %410 = load i32, ptr %409, align 4, !dbg !4281
  %411 = sub nsw i32 0, %410, !dbg !4281
  %412 = getelementptr inbounds nuw %struct.vms_vector, ptr %5, i32 0, i32 1, !dbg !4281
  store i32 %411, ptr %412, align 4, !dbg !4281
  %413 = getelementptr inbounds nuw %struct.vms_vector, ptr %5, i32 0, i32 2, !dbg !4281
  %414 = load i32, ptr %413, align 4, !dbg !4281
  %415 = sub nsw i32 0, %414, !dbg !4281
  %416 = getelementptr inbounds nuw %struct.vms_vector, ptr %5, i32 0, i32 2, !dbg !4281
  store i32 %415, ptr %416, align 4, !dbg !4281
  br label %417, !dbg !4281

417:                                              ; preds = %404
  br label %418, !dbg !4281

418:                                              ; preds = %417, %375
  %419 = load ptr, ptr %9, align 8, !dbg !4283
  %420 = getelementptr inbounds nuw %struct.side, ptr %419, i32 0, i32 6, !dbg !4284
  %421 = getelementptr inbounds [2 x %struct.vms_vector], ptr %420, i64 0, i64 0, !dbg !4283
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %421, ptr align 4 %5, i64 12, i1 false), !dbg !4285
  %422 = getelementptr inbounds [4 x i32], ptr %11, i64 0, i64 1, !dbg !4286
  %423 = load i32, ptr %422, align 4, !dbg !4286
  %424 = getelementptr inbounds [4 x i32], ptr %11, i64 0, i64 2, !dbg !4287
  %425 = load i32, ptr %424, align 4, !dbg !4287
  %426 = getelementptr inbounds [4 x i32], ptr %11, i64 0, i64 3, !dbg !4288
  %427 = load i32, ptr %426, align 4, !dbg !4288
  %428 = getelementptr inbounds [4 x i32], ptr %12, i64 0, i64 0, !dbg !4289
  %429 = getelementptr inbounds [4 x i32], ptr %12, i64 0, i64 1, !dbg !4290
  %430 = getelementptr inbounds [4 x i32], ptr %12, i64 0, i64 2, !dbg !4291
  %431 = getelementptr inbounds [4 x i32], ptr %12, i64 0, i64 3, !dbg !4292
  call void @_Z20get_verts_for_normaliiiiPiS_S_S_S_(i32 noundef %423, i32 noundef %425, i32 noundef %427, i32 noundef 32767, ptr noundef %428, ptr noundef %429, ptr noundef %430, ptr noundef %431, ptr noundef %13), !dbg !4293
  %432 = getelementptr inbounds [4 x i32], ptr %12, i64 0, i64 0, !dbg !4294
  %433 = load i32, ptr %432, align 4, !dbg !4294
  %434 = sext i32 %433 to i64, !dbg !4295
  %435 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %434, !dbg !4295
  %436 = getelementptr inbounds [4 x i32], ptr %12, i64 0, i64 1, !dbg !4296
  %437 = load i32, ptr %436, align 4, !dbg !4296
  %438 = sext i32 %437 to i64, !dbg !4297
  %439 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %438, !dbg !4297
  %440 = getelementptr inbounds [4 x i32], ptr %12, i64 0, i64 2, !dbg !4298
  %441 = load i32, ptr %440, align 4, !dbg !4298
  %442 = sext i32 %441 to i64, !dbg !4299
  %443 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %442, !dbg !4299
  %444 = call noundef ptr @_Z13vm_vec_normalP10vms_vectorS0_S0_S0_(ptr noundef %5, ptr noundef %435, ptr noundef %439, ptr noundef %443), !dbg !4300
  %445 = load i32, ptr %13, align 4, !dbg !4301
  %446 = icmp ne i32 %445, 0, !dbg !4301
  br i1 %446, label %447, label %462, !dbg !4301

447:                                              ; preds = %418
  br label %448, !dbg !4303

448:                                              ; preds = %447
  %449 = getelementptr inbounds nuw %struct.vms_vector, ptr %5, i32 0, i32 0, !dbg !4304
  %450 = load i32, ptr %449, align 4, !dbg !4304
  %451 = sub nsw i32 0, %450, !dbg !4304
  %452 = getelementptr inbounds nuw %struct.vms_vector, ptr %5, i32 0, i32 0, !dbg !4304
  store i32 %451, ptr %452, align 4, !dbg !4304
  %453 = getelementptr inbounds nuw %struct.vms_vector, ptr %5, i32 0, i32 1, !dbg !4304
  %454 = load i32, ptr %453, align 4, !dbg !4304
  %455 = sub nsw i32 0, %454, !dbg !4304
  %456 = getelementptr inbounds nuw %struct.vms_vector, ptr %5, i32 0, i32 1, !dbg !4304
  store i32 %455, ptr %456, align 4, !dbg !4304
  %457 = getelementptr inbounds nuw %struct.vms_vector, ptr %5, i32 0, i32 2, !dbg !4304
  %458 = load i32, ptr %457, align 4, !dbg !4304
  %459 = sub nsw i32 0, %458, !dbg !4304
  %460 = getelementptr inbounds nuw %struct.vms_vector, ptr %5, i32 0, i32 2, !dbg !4304
  store i32 %459, ptr %460, align 4, !dbg !4304
  br label %461, !dbg !4304

461:                                              ; preds = %448
  br label %462, !dbg !4304

462:                                              ; preds = %461, %418
  %463 = load ptr, ptr %9, align 8, !dbg !4306
  %464 = getelementptr inbounds nuw %struct.side, ptr %463, i32 0, i32 6, !dbg !4307
  %465 = getelementptr inbounds [2 x %struct.vms_vector], ptr %464, i64 0, i64 1, !dbg !4306
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %465, ptr align 4 %5, i64 12, i1 false), !dbg !4308
  br label %466

466:                                              ; preds = %462, %371
  br label %467

467:                                              ; preds = %466, %237
  ret void, !dbg !4309
}

declare noundef ptr @_Z13vm_vec_normalP10vms_vectorS0_S0_S0_(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #1

declare noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef, ptr noundef) #1

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define noundef i32 @_Z4signi(i32 noundef %0) #2 !dbg !4310 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !4313, !DIExpression(), !4314)
  %4 = load i32, ptr %3, align 4, !dbg !4315
  %5 = icmp sgt i32 %4, 250, !dbg !4317
  br i1 %5, label %6, label %7, !dbg !4317

6:                                                ; preds = %1
  store i32 1, ptr %2, align 4, !dbg !4318
  br label %12, !dbg !4318

7:                                                ; preds = %1
  %8 = load i32, ptr %3, align 4, !dbg !4319
  %9 = icmp slt i32 %8, -251, !dbg !4321
  br i1 %9, label %10, label %11, !dbg !4321

10:                                               ; preds = %7
  store i32 -1, ptr %2, align 4, !dbg !4322
  br label %12, !dbg !4322

11:                                               ; preds = %7
  store i32 0, ptr %2, align 4, !dbg !4323
  br label %12, !dbg !4323

12:                                               ; preds = %11, %10, %6
  %13 = load i32, ptr %2, align 4, !dbg !4324
  ret i32 %13, !dbg !4324
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z20create_walls_on_sideP7segmenti(ptr noundef %0, i32 noundef %1) #0 !dbg !4325 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca %struct.vms_vector, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca [6 x i32], align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !4326, !DIExpression(), !4327)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !4328, !DIExpression(), !4329)
    #dbg_declare(ptr %5, !4330, !DIExpression(), !4331)
    #dbg_declare(ptr %6, !4332, !DIExpression(), !4333)
    #dbg_declare(ptr %7, !4334, !DIExpression(), !4335)
    #dbg_declare(ptr %8, !4336, !DIExpression(), !4337)
    #dbg_declare(ptr %9, !4338, !DIExpression(), !4339)
    #dbg_declare(ptr %10, !4340, !DIExpression(), !4341)
    #dbg_declare(ptr %11, !4342, !DIExpression(), !4343)
    #dbg_declare(ptr %12, !4344, !DIExpression(), !4345)
    #dbg_declare(ptr %13, !4346, !DIExpression(), !4347)
    #dbg_declare(ptr %14, !4348, !DIExpression(), !4349)
    #dbg_declare(ptr %15, !4350, !DIExpression(), !4351)
  %24 = load ptr, ptr %3, align 8, !dbg !4352
  %25 = getelementptr inbounds nuw %struct.segment, ptr %24, i32 0, i32 2, !dbg !4353
  %26 = load i32, ptr %4, align 4, !dbg !4354
  %27 = sext i32 %26 to i64, !dbg !4355
  %28 = getelementptr inbounds [6 x [4 x i8]], ptr @Side_to_verts, i64 0, i64 %27, !dbg !4355
  %29 = getelementptr inbounds [4 x i8], ptr %28, i64 0, i64 0, !dbg !4355
  %30 = load i8, ptr %29, align 1, !dbg !4355
  %31 = sext i8 %30 to i64, !dbg !4352
  %32 = getelementptr inbounds [8 x i16], ptr %25, i64 0, i64 %31, !dbg !4352
  %33 = load i16, ptr %32, align 2, !dbg !4352
  %34 = sext i16 %33 to i32, !dbg !4352
  store i32 %34, ptr %10, align 4, !dbg !4356
  %35 = load ptr, ptr %3, align 8, !dbg !4357
  %36 = getelementptr inbounds nuw %struct.segment, ptr %35, i32 0, i32 2, !dbg !4358
  %37 = load i32, ptr %4, align 4, !dbg !4359
  %38 = sext i32 %37 to i64, !dbg !4360
  %39 = getelementptr inbounds [6 x [4 x i8]], ptr @Side_to_verts, i64 0, i64 %38, !dbg !4360
  %40 = getelementptr inbounds [4 x i8], ptr %39, i64 0, i64 1, !dbg !4360
  %41 = load i8, ptr %40, align 1, !dbg !4360
  %42 = sext i8 %41 to i64, !dbg !4357
  %43 = getelementptr inbounds [8 x i16], ptr %36, i64 0, i64 %42, !dbg !4357
  %44 = load i16, ptr %43, align 2, !dbg !4357
  %45 = sext i16 %44 to i32, !dbg !4357
  store i32 %45, ptr %11, align 4, !dbg !4361
  %46 = load ptr, ptr %3, align 8, !dbg !4362
  %47 = getelementptr inbounds nuw %struct.segment, ptr %46, i32 0, i32 2, !dbg !4363
  %48 = load i32, ptr %4, align 4, !dbg !4364
  %49 = sext i32 %48 to i64, !dbg !4365
  %50 = getelementptr inbounds [6 x [4 x i8]], ptr @Side_to_verts, i64 0, i64 %49, !dbg !4365
  %51 = getelementptr inbounds [4 x i8], ptr %50, i64 0, i64 2, !dbg !4365
  %52 = load i8, ptr %51, align 1, !dbg !4365
  %53 = sext i8 %52 to i64, !dbg !4362
  %54 = getelementptr inbounds [8 x i16], ptr %47, i64 0, i64 %53, !dbg !4362
  %55 = load i16, ptr %54, align 2, !dbg !4362
  %56 = sext i16 %55 to i32, !dbg !4362
  store i32 %56, ptr %12, align 4, !dbg !4366
  %57 = load ptr, ptr %3, align 8, !dbg !4367
  %58 = getelementptr inbounds nuw %struct.segment, ptr %57, i32 0, i32 2, !dbg !4368
  %59 = load i32, ptr %4, align 4, !dbg !4369
  %60 = sext i32 %59 to i64, !dbg !4370
  %61 = getelementptr inbounds [6 x [4 x i8]], ptr @Side_to_verts, i64 0, i64 %60, !dbg !4370
  %62 = getelementptr inbounds [4 x i8], ptr %61, i64 0, i64 3, !dbg !4370
  %63 = load i8, ptr %62, align 1, !dbg !4370
  %64 = sext i8 %63 to i64, !dbg !4367
  %65 = getelementptr inbounds [8 x i16], ptr %58, i64 0, i64 %64, !dbg !4367
  %66 = load i16, ptr %65, align 2, !dbg !4367
  %67 = sext i16 %66 to i32, !dbg !4367
  store i32 %67, ptr %13, align 4, !dbg !4371
  %68 = load i32, ptr %10, align 4, !dbg !4372
  %69 = load i32, ptr %11, align 4, !dbg !4373
  %70 = load i32, ptr %12, align 4, !dbg !4374
  %71 = load i32, ptr %13, align 4, !dbg !4375
  call void @_Z20get_verts_for_normaliiiiPiS_S_S_S_(i32 noundef %68, i32 noundef %69, i32 noundef %70, i32 noundef %71, ptr noundef %5, ptr noundef %6, ptr noundef %7, ptr noundef %8, ptr noundef %9), !dbg !4376
  %72 = load i32, ptr %5, align 4, !dbg !4377
  %73 = sext i32 %72 to i64, !dbg !4378
  %74 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %73, !dbg !4378
  %75 = load i32, ptr %6, align 4, !dbg !4379
  %76 = sext i32 %75 to i64, !dbg !4380
  %77 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %76, !dbg !4380
  %78 = load i32, ptr %7, align 4, !dbg !4381
  %79 = sext i32 %78 to i64, !dbg !4382
  %80 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %79, !dbg !4382
  %81 = call noundef ptr @_Z13vm_vec_normalP10vms_vectorS0_S0_S0_(ptr noundef %14, ptr noundef %74, ptr noundef %77, ptr noundef %80), !dbg !4383
  %82 = load i32, ptr %8, align 4, !dbg !4384
  %83 = sext i32 %82 to i64, !dbg !4385
  %84 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %83, !dbg !4385
  %85 = load i32, ptr %5, align 4, !dbg !4386
  %86 = sext i32 %85 to i64, !dbg !4387
  %87 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %86, !dbg !4387
  %88 = call noundef i32 @_Z16vm_dist_to_planeP10vms_vectorS0_S0_(ptr noundef %84, ptr noundef %14, ptr noundef %87), !dbg !4388
  %89 = call i32 @llvm.abs.i32(i32 %88, i1 true), !dbg !4389
  store i32 %89, ptr %15, align 4, !dbg !4390
  %90 = load i32, ptr %9, align 4, !dbg !4391
  %91 = icmp ne i32 %90, 0, !dbg !4391
  br i1 %91, label %92, label %107, !dbg !4391

92:                                               ; preds = %2
  br label %93, !dbg !4393

93:                                               ; preds = %92
  %94 = getelementptr inbounds nuw %struct.vms_vector, ptr %14, i32 0, i32 0, !dbg !4394
  %95 = load i32, ptr %94, align 4, !dbg !4394
  %96 = sub nsw i32 0, %95, !dbg !4394
  %97 = getelementptr inbounds nuw %struct.vms_vector, ptr %14, i32 0, i32 0, !dbg !4394
  store i32 %96, ptr %97, align 4, !dbg !4394
  %98 = getelementptr inbounds nuw %struct.vms_vector, ptr %14, i32 0, i32 1, !dbg !4394
  %99 = load i32, ptr %98, align 4, !dbg !4394
  %100 = sub nsw i32 0, %99, !dbg !4394
  %101 = getelementptr inbounds nuw %struct.vms_vector, ptr %14, i32 0, i32 1, !dbg !4394
  store i32 %100, ptr %101, align 4, !dbg !4394
  %102 = getelementptr inbounds nuw %struct.vms_vector, ptr %14, i32 0, i32 2, !dbg !4394
  %103 = load i32, ptr %102, align 4, !dbg !4394
  %104 = sub nsw i32 0, %103, !dbg !4394
  %105 = getelementptr inbounds nuw %struct.vms_vector, ptr %14, i32 0, i32 2, !dbg !4394
  store i32 %104, ptr %105, align 4, !dbg !4394
  br label %106, !dbg !4394

106:                                              ; preds = %93
  br label %107, !dbg !4394

107:                                              ; preds = %106, %2
  %108 = load i32, ptr %15, align 4, !dbg !4396
  %109 = icmp sle i32 %108, 250, !dbg !4398
  br i1 %109, label %110, label %113, !dbg !4398

110:                                              ; preds = %107
  %111 = load ptr, ptr %3, align 8, !dbg !4399
  %112 = load i32, ptr %4, align 4, !dbg !4400
  call void @_Z16add_side_as_quadP7segmentiP10vms_vector(ptr noundef %111, i32 noundef %112, ptr noundef %14), !dbg !4401
  br label %192, !dbg !4401

113:                                              ; preds = %107
  %114 = load ptr, ptr %3, align 8, !dbg !4402
  %115 = load i32, ptr %4, align 4, !dbg !4404
  call void @_Z23add_side_as_2_trianglesP7segmenti(ptr noundef %114, i32 noundef %115), !dbg !4405
    #dbg_declare(ptr %16, !4406, !DIExpression(), !4408)
    #dbg_declare(ptr %17, !4409, !DIExpression(), !4410)
    #dbg_declare(ptr %18, !4411, !DIExpression(), !4412)
    #dbg_declare(ptr %19, !4413, !DIExpression(), !4414)
    #dbg_declare(ptr %20, !4415, !DIExpression(), !4416)
    #dbg_declare(ptr %21, !4417, !DIExpression(), !4418)
    #dbg_declare(ptr %22, !4419, !DIExpression(), !4420)
    #dbg_declare(ptr %23, !4421, !DIExpression(), !4422)
  %116 = getelementptr inbounds [6 x i32], ptr %17, i64 0, i64 0, !dbg !4423
  %117 = load ptr, ptr %3, align 8, !dbg !4424
  %118 = ptrtoint ptr %117 to i64, !dbg !4425
  %119 = sub i64 %118, ptrtoint (ptr @Segments to i64), !dbg !4425
  %120 = sdiv exact i64 %119, 512, !dbg !4425
  %121 = trunc i64 %120 to i32, !dbg !4424
  %122 = load i32, ptr %4, align 4, !dbg !4426
  call void @_Z23create_abs_vertex_listsPiS_ii(ptr noundef %16, ptr noundef %116, i32 noundef %121, i32 noundef %122), !dbg !4427
  %123 = load i32, ptr %16, align 4, !dbg !4428
  %124 = icmp eq i32 %123, 2, !dbg !4428
  %125 = zext i1 %124 to i32, !dbg !4428
  call void @_Z7_AssertiPKcS0_i(i32 noundef %125, ptr noundef @.str.22, ptr noundef @.str.2, i32 noundef 1981), !dbg !4428
  %126 = load ptr, ptr %3, align 8, !dbg !4429
  %127 = getelementptr inbounds nuw %struct.segment, ptr %126, i32 0, i32 0, !dbg !4430
  %128 = load i32, ptr %4, align 4, !dbg !4431
  %129 = sext i32 %128 to i64, !dbg !4429
  %130 = getelementptr inbounds [6 x %struct.side], ptr %127, i64 0, i64 %129, !dbg !4429
  store ptr %130, ptr %23, align 8, !dbg !4432
  %131 = getelementptr inbounds [6 x i32], ptr %17, i64 0, i64 0, !dbg !4433
  %132 = getelementptr inbounds [6 x i32], ptr %17, i64 0, i64 2, !dbg !4434
  %133 = call noundef nonnull align 4 dereferenceable(4) ptr @_ZNSt3__13minB8ne200100IiEERKT_S3_S3_(ptr noundef nonnull align 4 dereferenceable(4) %131, ptr noundef nonnull align 4 dereferenceable(4) %132), !dbg !4435
  %134 = load i32, ptr %133, align 4, !dbg !4435
  store i32 %134, ptr %22, align 4, !dbg !4436
  %135 = getelementptr inbounds [6 x i32], ptr %17, i64 0, i64 1, !dbg !4437
  %136 = load i32, ptr %135, align 4, !dbg !4437
  %137 = sext i32 %136 to i64, !dbg !4438
  %138 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %137, !dbg !4438
  %139 = load ptr, ptr %23, align 8, !dbg !4439
  %140 = getelementptr inbounds nuw %struct.side, ptr %139, i32 0, i32 6, !dbg !4440
  %141 = getelementptr inbounds [2 x %struct.vms_vector], ptr %140, i64 0, i64 1, !dbg !4439
  %142 = load i32, ptr %22, align 4, !dbg !4441
  %143 = sext i32 %142 to i64, !dbg !4442
  %144 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %143, !dbg !4442
  %145 = call noundef i32 @_Z16vm_dist_to_planeP10vms_vectorS0_S0_(ptr noundef %138, ptr noundef %141, ptr noundef %144), !dbg !4443
  store i32 %145, ptr %18, align 4, !dbg !4444
  %146 = getelementptr inbounds [6 x i32], ptr %17, i64 0, i64 4, !dbg !4445
  %147 = load i32, ptr %146, align 4, !dbg !4445
  %148 = sext i32 %147 to i64, !dbg !4446
  %149 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %148, !dbg !4446
  %150 = load ptr, ptr %23, align 8, !dbg !4447
  %151 = getelementptr inbounds nuw %struct.side, ptr %150, i32 0, i32 6, !dbg !4448
  %152 = getelementptr inbounds [2 x %struct.vms_vector], ptr %151, i64 0, i64 0, !dbg !4447
  %153 = load i32, ptr %22, align 4, !dbg !4449
  %154 = sext i32 %153 to i64, !dbg !4450
  %155 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %154, !dbg !4450
  %156 = call noundef i32 @_Z16vm_dist_to_planeP10vms_vectorS0_S0_(ptr noundef %149, ptr noundef %152, ptr noundef %155), !dbg !4451
  store i32 %156, ptr %19, align 4, !dbg !4452
  %157 = load i32, ptr %18, align 4, !dbg !4453
  %158 = call noundef i32 @_Z4signi(i32 noundef %157), !dbg !4454
  store i32 %158, ptr %20, align 4, !dbg !4455
  %159 = load i32, ptr %19, align 4, !dbg !4456
  %160 = call noundef i32 @_Z4signi(i32 noundef %159), !dbg !4457
  store i32 %160, ptr %21, align 4, !dbg !4458
  %161 = load i32, ptr %20, align 4, !dbg !4459
  %162 = icmp eq i32 %161, 0, !dbg !4461
  br i1 %162, label %170, label %163, !dbg !4462

163:                                              ; preds = %113
  %164 = load i32, ptr %21, align 4, !dbg !4463
  %165 = icmp eq i32 %164, 0, !dbg !4464
  br i1 %165, label %170, label %166, !dbg !4465

166:                                              ; preds = %163
  %167 = load i32, ptr %20, align 4, !dbg !4466
  %168 = load i32, ptr %21, align 4, !dbg !4467
  %169 = icmp ne i32 %167, %168, !dbg !4468
  br i1 %169, label %170, label %191, !dbg !4465

170:                                              ; preds = %166, %163, %113
  %171 = load ptr, ptr %3, align 8, !dbg !4469
  %172 = getelementptr inbounds nuw %struct.segment, ptr %171, i32 0, i32 0, !dbg !4471
  %173 = load i32, ptr %4, align 4, !dbg !4472
  %174 = sext i32 %173 to i64, !dbg !4469
  %175 = getelementptr inbounds [6 x %struct.side], ptr %172, i64 0, i64 %174, !dbg !4469
  %176 = getelementptr inbounds nuw %struct.side, ptr %175, i32 0, i32 0, !dbg !4473
  store i8 1, ptr %176, align 4, !dbg !4474
  %177 = load ptr, ptr %3, align 8, !dbg !4475
  %178 = getelementptr inbounds nuw %struct.segment, ptr %177, i32 0, i32 0, !dbg !4476
  %179 = load i32, ptr %4, align 4, !dbg !4477
  %180 = sext i32 %179 to i64, !dbg !4475
  %181 = getelementptr inbounds [6 x %struct.side], ptr %178, i64 0, i64 %180, !dbg !4475
  %182 = getelementptr inbounds nuw %struct.side, ptr %181, i32 0, i32 6, !dbg !4478
  %183 = getelementptr inbounds [2 x %struct.vms_vector], ptr %182, i64 0, i64 0, !dbg !4475
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %183, ptr align 4 %14, i64 12, i1 false), !dbg !4479
  %184 = load ptr, ptr %3, align 8, !dbg !4480
  %185 = getelementptr inbounds nuw %struct.segment, ptr %184, i32 0, i32 0, !dbg !4481
  %186 = load i32, ptr %4, align 4, !dbg !4482
  %187 = sext i32 %186 to i64, !dbg !4480
  %188 = getelementptr inbounds [6 x %struct.side], ptr %185, i64 0, i64 %187, !dbg !4480
  %189 = getelementptr inbounds nuw %struct.side, ptr %188, i32 0, i32 6, !dbg !4483
  %190 = getelementptr inbounds [2 x %struct.vms_vector], ptr %189, i64 0, i64 1, !dbg !4480
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %190, ptr align 4 %14, i64 12, i1 false), !dbg !4484
  br label %191, !dbg !4485

191:                                              ; preds = %170, %166
  br label %192

192:                                              ; preds = %191, %110
  ret void, !dbg !4486
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.abs.i32(i32, i1 immarg) #6

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z23validate_removable_wallP7segmentii(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 !dbg !4487 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !4490, !DIExpression(), !4491)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !4492, !DIExpression(), !4493)
  store i32 %2, ptr %6, align 4
    #dbg_declare(ptr %6, !4494, !DIExpression(), !4495)
  %7 = load ptr, ptr %4, align 8, !dbg !4496
  %8 = load i32, ptr %5, align 4, !dbg !4497
  call void @_Z20create_walls_on_sideP7segmenti(ptr noundef %7, i32 noundef %8), !dbg !4498
  %9 = load i32, ptr %6, align 4, !dbg !4499
  %10 = trunc i32 %9 to i16, !dbg !4499
  %11 = load ptr, ptr %4, align 8, !dbg !4500
  %12 = getelementptr inbounds nuw %struct.segment, ptr %11, i32 0, i32 0, !dbg !4501
  %13 = load i32, ptr %5, align 4, !dbg !4502
  %14 = sext i32 %13 to i64, !dbg !4500
  %15 = getelementptr inbounds [6 x %struct.side], ptr %12, i64 0, i64 %14, !dbg !4500
  %16 = getelementptr inbounds nuw %struct.side, ptr %15, i32 0, i32 3, !dbg !4503
  store i16 %10, ptr %16, align 4, !dbg !4504
  ret void, !dbg !4505
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z21validate_segment_sideP7segmenti(ptr noundef %0, i32 noundef %1) #0 !dbg !4506 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !4507, !DIExpression(), !4508)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !4509, !DIExpression(), !4510)
  %5 = load ptr, ptr %3, align 8, !dbg !4511
  %6 = getelementptr inbounds nuw %struct.segment, ptr %5, i32 0, i32 0, !dbg !4513
  %7 = load i32, ptr %4, align 4, !dbg !4514
  %8 = sext i32 %7 to i64, !dbg !4511
  %9 = getelementptr inbounds [6 x %struct.side], ptr %6, i64 0, i64 %8, !dbg !4511
  %10 = getelementptr inbounds nuw %struct.side, ptr %9, i32 0, i32 2, !dbg !4515
  %11 = load i16, ptr %10, align 2, !dbg !4515
  %12 = sext i16 %11 to i32, !dbg !4511
  %13 = icmp eq i32 %12, -1, !dbg !4516
  br i1 %13, label %14, label %17, !dbg !4516

14:                                               ; preds = %2
  %15 = load ptr, ptr %3, align 8, !dbg !4517
  %16 = load i32, ptr %4, align 4, !dbg !4518
  call void @_Z20create_walls_on_sideP7segmenti(ptr noundef %15, i32 noundef %16), !dbg !4519
  br label %28, !dbg !4519

17:                                               ; preds = %2
  %18 = load ptr, ptr %3, align 8, !dbg !4520
  %19 = load i32, ptr %4, align 4, !dbg !4521
  %20 = load ptr, ptr %3, align 8, !dbg !4522
  %21 = getelementptr inbounds nuw %struct.segment, ptr %20, i32 0, i32 0, !dbg !4523
  %22 = load i32, ptr %4, align 4, !dbg !4524
  %23 = sext i32 %22 to i64, !dbg !4522
  %24 = getelementptr inbounds [6 x %struct.side], ptr %21, i64 0, i64 %23, !dbg !4522
  %25 = getelementptr inbounds nuw %struct.side, ptr %24, i32 0, i32 3, !dbg !4525
  %26 = load i16, ptr %25, align 4, !dbg !4525
  %27 = sext i16 %26 to i32, !dbg !4522
  call void @_Z23validate_removable_wallP7segmentii(ptr noundef %18, i32 noundef %19, i32 noundef %27), !dbg !4526
  br label %28

28:                                               ; preds = %17, %14
  ret void, !dbg !4527
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z16validate_segmentP7segment(ptr noundef %0) #0 !dbg !4528 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !4531, !DIExpression(), !4532)
    #dbg_declare(ptr %3, !4533, !DIExpression(), !4534)
  store i32 0, ptr %3, align 4, !dbg !4535
  br label %4, !dbg !4537

4:                                                ; preds = %10, %1
  %5 = load i32, ptr %3, align 4, !dbg !4538
  %6 = icmp slt i32 %5, 6, !dbg !4540
  br i1 %6, label %7, label %13, !dbg !4541

7:                                                ; preds = %4
  %8 = load ptr, ptr %2, align 8, !dbg !4542
  %9 = load i32, ptr %3, align 4, !dbg !4543
  call void @_Z21validate_segment_sideP7segmenti(ptr noundef %8, i32 noundef %9), !dbg !4544
  br label %10, !dbg !4544

10:                                               ; preds = %7
  %11 = load i32, ptr %3, align 4, !dbg !4545
  %12 = add nsw i32 %11, 1, !dbg !4545
  store i32 %12, ptr %3, align 4, !dbg !4545
  br label %4, !dbg !4546, !llvm.loop !4547

13:                                               ; preds = %4
  ret void, !dbg !4549
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z20validate_segment_allv() #0 !dbg !4550 {
  %1 = alloca i32, align 4
    #dbg_declare(ptr %1, !4551, !DIExpression(), !4552)
  store i32 0, ptr %1, align 4, !dbg !4553
  br label %2, !dbg !4555

2:                                                ; preds = %10, %0
  %3 = load i32, ptr %1, align 4, !dbg !4556
  %4 = load i32, ptr @Highest_segment_index, align 4, !dbg !4558
  %5 = icmp sle i32 %3, %4, !dbg !4559
  br i1 %5, label %6, label %13, !dbg !4560

6:                                                ; preds = %2
  %7 = load i32, ptr %1, align 4, !dbg !4561
  %8 = sext i32 %7 to i64, !dbg !4562
  %9 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %8, !dbg !4562
  call void @_Z16validate_segmentP7segment(ptr noundef %9), !dbg !4563
  br label %10, !dbg !4563

10:                                               ; preds = %6
  %11 = load i32, ptr %1, align 4, !dbg !4564
  %12 = add nsw i32 %11, 1, !dbg !4564
  store i32 %12, ptr %1, align 4, !dbg !4564
  br label %2, !dbg !4565, !llvm.loop !4566

13:                                               ; preds = %2
  %14 = call noundef i32 @_Z25check_segment_connectionsv(), !dbg !4568
  %15 = icmp ne i32 %14, 0, !dbg !4568
  br i1 %15, label %16, label %17, !dbg !4568

16:                                               ; preds = %13
  call void @_Z4Int3v(), !dbg !4570
  br label %17, !dbg !4570

17:                                               ; preds = %16, %13
  ret void, !dbg !4571
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z24pick_random_point_in_segP10vms_vectori(ptr noundef %0, i32 noundef %1) #0 !dbg !4572 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca %struct.vms_vector, align 4
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !4575, !DIExpression(), !4576)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !4577, !DIExpression(), !4578)
    #dbg_declare(ptr %5, !4579, !DIExpression(), !4580)
    #dbg_declare(ptr %6, !4581, !DIExpression(), !4582)
  %7 = load ptr, ptr %3, align 8, !dbg !4583
  %8 = load i32, ptr %4, align 4, !dbg !4584
  %9 = sext i32 %8 to i64, !dbg !4585
  %10 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %9, !dbg !4585
  call void @_Z22compute_segment_centerP10vms_vectorP7segment(ptr noundef %7, ptr noundef %10), !dbg !4586
  %11 = call noundef i32 @_Z6P_Randv(), !dbg !4587
  %12 = mul nsw i32 %11, 8, !dbg !4588
  %13 = ashr i32 %12, 15, !dbg !4589
  store i32 %13, ptr %5, align 4, !dbg !4590
  %14 = load i32, ptr %4, align 4, !dbg !4591
  %15 = sext i32 %14 to i64, !dbg !4592
  %16 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %15, !dbg !4592
  %17 = getelementptr inbounds nuw %struct.segment, ptr %16, i32 0, i32 2, !dbg !4593
  %18 = load i32, ptr %5, align 4, !dbg !4594
  %19 = sext i32 %18 to i64, !dbg !4592
  %20 = getelementptr inbounds [8 x i16], ptr %17, i64 0, i64 %19, !dbg !4592
  %21 = load i16, ptr %20, align 2, !dbg !4592
  %22 = sext i16 %21 to i64, !dbg !4595
  %23 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %22, !dbg !4595
  %24 = load ptr, ptr %3, align 8, !dbg !4596
  %25 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %6, ptr noundef %23, ptr noundef %24), !dbg !4597
  %26 = call noundef i32 @_Z6P_Randv(), !dbg !4598
  %27 = call noundef ptr @_Z12vm_vec_scaleP10vms_vectori(ptr noundef %6, i32 noundef %26), !dbg !4599
  %28 = load ptr, ptr %3, align 8, !dbg !4600
  %29 = call noundef ptr @_Z11vm_vec_add2P10vms_vectorS0_(ptr noundef %28, ptr noundef %6), !dbg !4601
  ret void, !dbg !4602
}

declare noundef i32 @_Z6P_Randv() #1

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define noundef i32 @_Z18set_segment_depthsiPh(i32 noundef %0, ptr noundef %1) #2 !dbg !4603 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca [900 x i8], align 1
  %9 = alloca [900 x i32], align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
    #dbg_declare(ptr %4, !4607, !DIExpression(), !4608)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !4609, !DIExpression(), !4610)
    #dbg_declare(ptr %6, !4611, !DIExpression(), !4612)
    #dbg_declare(ptr %7, !4613, !DIExpression(), !4614)
    #dbg_declare(ptr %8, !4615, !DIExpression(), !4616)
    #dbg_declare(ptr %9, !4617, !DIExpression(), !4619)
    #dbg_declare(ptr %10, !4620, !DIExpression(), !4621)
    #dbg_declare(ptr %11, !4622, !DIExpression(), !4623)
    #dbg_declare(ptr %12, !4624, !DIExpression(), !4625)
    #dbg_declare(ptr %13, !4626, !DIExpression(), !4627)
  store i32 1, ptr %12, align 4, !dbg !4628
  store i32 0, ptr %10, align 4, !dbg !4629
  store i32 0, ptr %11, align 4, !dbg !4630
  store i32 0, ptr %6, align 4, !dbg !4631
  br label %15, !dbg !4633

15:                                               ; preds = %23, %2
  %16 = load i32, ptr %6, align 4, !dbg !4634
  %17 = load i32, ptr @Highest_segment_index, align 4, !dbg !4636
  %18 = icmp sle i32 %16, %17, !dbg !4637
  br i1 %18, label %19, label %26, !dbg !4638

19:                                               ; preds = %15
  %20 = load i32, ptr %6, align 4, !dbg !4639
  %21 = sext i32 %20 to i64, !dbg !4640
  %22 = getelementptr inbounds [900 x i8], ptr %8, i64 0, i64 %21, !dbg !4640
  store i8 0, ptr %22, align 1, !dbg !4641
  br label %23, !dbg !4640

23:                                               ; preds = %19
  %24 = load i32, ptr %6, align 4, !dbg !4642
  %25 = add nsw i32 %24, 1, !dbg !4642
  store i32 %25, ptr %6, align 4, !dbg !4642
  br label %15, !dbg !4643, !llvm.loop !4644

26:                                               ; preds = %15
  %27 = load ptr, ptr %5, align 8, !dbg !4646
  %28 = load i32, ptr %4, align 4, !dbg !4648
  %29 = sext i32 %28 to i64, !dbg !4646
  %30 = getelementptr inbounds i8, ptr %27, i64 %29, !dbg !4646
  %31 = load i8, ptr %30, align 1, !dbg !4646
  %32 = zext i8 %31 to i32, !dbg !4646
  %33 = icmp eq i32 %32, 0, !dbg !4649
  br i1 %33, label %34, label %35, !dbg !4649

34:                                               ; preds = %26
  store i32 1, ptr %3, align 4, !dbg !4650
  br label %125, !dbg !4650

35:                                               ; preds = %26
  %36 = load i32, ptr %4, align 4, !dbg !4651
  %37 = load i32, ptr %11, align 4, !dbg !4652
  %38 = add nsw i32 %37, 1, !dbg !4652
  store i32 %38, ptr %11, align 4, !dbg !4652
  %39 = sext i32 %37 to i64, !dbg !4653
  %40 = getelementptr inbounds [900 x i32], ptr %9, i64 0, i64 %39, !dbg !4653
  store i32 %36, ptr %40, align 4, !dbg !4654
  %41 = load i32, ptr %4, align 4, !dbg !4655
  %42 = sext i32 %41 to i64, !dbg !4656
  %43 = getelementptr inbounds [900 x i8], ptr %8, i64 0, i64 %42, !dbg !4656
  store i8 1, ptr %43, align 1, !dbg !4657
  %44 = load i32, ptr %12, align 4, !dbg !4658
  %45 = add nsw i32 %44, 1, !dbg !4658
  store i32 %45, ptr %12, align 4, !dbg !4658
  %46 = trunc i32 %44 to i8, !dbg !4659
  %47 = load ptr, ptr %5, align 8, !dbg !4660
  %48 = load i32, ptr %4, align 4, !dbg !4661
  %49 = sext i32 %48 to i64, !dbg !4660
  %50 = getelementptr inbounds i8, ptr %47, i64 %49, !dbg !4660
  store i8 %46, ptr %50, align 1, !dbg !4662
  %51 = load i32, ptr %12, align 4, !dbg !4663
  %52 = icmp eq i32 %51, 0, !dbg !4665
  br i1 %52, label %53, label %54, !dbg !4665

53:                                               ; preds = %35
  store i32 255, ptr %12, align 4, !dbg !4666
  br label %54, !dbg !4667

54:                                               ; preds = %53, %35
  br label %55, !dbg !4668

55:                                               ; preds = %121, %54
  %56 = load i32, ptr %10, align 4, !dbg !4669
  %57 = load i32, ptr %11, align 4, !dbg !4670
  %58 = icmp slt i32 %56, %57, !dbg !4671
  br i1 %58, label %59, label %122, !dbg !4668

59:                                               ; preds = %55
  %60 = load i32, ptr %10, align 4, !dbg !4672
  %61 = add nsw i32 %60, 1, !dbg !4672
  store i32 %61, ptr %10, align 4, !dbg !4672
  %62 = sext i32 %60 to i64, !dbg !4674
  %63 = getelementptr inbounds [900 x i32], ptr %9, i64 0, i64 %62, !dbg !4674
  %64 = load i32, ptr %63, align 4, !dbg !4674
  store i32 %64, ptr %7, align 4, !dbg !4675
  %65 = load ptr, ptr %5, align 8, !dbg !4676
  %66 = load i32, ptr %7, align 4, !dbg !4677
  %67 = sext i32 %66 to i64, !dbg !4676
  %68 = getelementptr inbounds i8, ptr %65, i64 %67, !dbg !4676
  %69 = load i8, ptr %68, align 1, !dbg !4676
  %70 = zext i8 %69 to i32, !dbg !4676
  store i32 %70, ptr %13, align 4, !dbg !4678
  store i32 0, ptr %6, align 4, !dbg !4679
  br label %71, !dbg !4681

71:                                               ; preds = %118, %59
  %72 = load i32, ptr %6, align 4, !dbg !4682
  %73 = icmp slt i32 %72, 6, !dbg !4684
  br i1 %73, label %74, label %121, !dbg !4685

74:                                               ; preds = %71
    #dbg_declare(ptr %14, !4686, !DIExpression(), !4688)
  %75 = load i32, ptr %7, align 4, !dbg !4689
  %76 = sext i32 %75 to i64, !dbg !4690
  %77 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %76, !dbg !4690
  %78 = getelementptr inbounds nuw %struct.segment, ptr %77, i32 0, i32 1, !dbg !4691
  %79 = load i32, ptr %6, align 4, !dbg !4692
  %80 = sext i32 %79 to i64, !dbg !4690
  %81 = getelementptr inbounds [6 x i16], ptr %78, i64 0, i64 %80, !dbg !4690
  %82 = load i16, ptr %81, align 2, !dbg !4690
  %83 = sext i16 %82 to i32, !dbg !4690
  store i32 %83, ptr %14, align 4, !dbg !4693
  %84 = load i32, ptr %14, align 4, !dbg !4694
  %85 = icmp ne i32 %84, -1, !dbg !4696
  br i1 %85, label %86, label %117, !dbg !4696

86:                                               ; preds = %74
  %87 = load ptr, ptr %5, align 8, !dbg !4697
  %88 = load i32, ptr %14, align 4, !dbg !4699
  %89 = sext i32 %88 to i64, !dbg !4697
  %90 = getelementptr inbounds i8, ptr %87, i64 %89, !dbg !4697
  %91 = load i8, ptr %90, align 1, !dbg !4697
  %92 = icmp ne i8 %91, 0, !dbg !4697
  br i1 %92, label %93, label %116, !dbg !4697

93:                                               ; preds = %86
  %94 = load i32, ptr %14, align 4, !dbg !4700
  %95 = sext i32 %94 to i64, !dbg !4702
  %96 = getelementptr inbounds [900 x i8], ptr %8, i64 0, i64 %95, !dbg !4702
  %97 = load i8, ptr %96, align 1, !dbg !4702
  %98 = icmp ne i8 %97, 0, !dbg !4702
  br i1 %98, label %115, label %99, !dbg !4703

99:                                               ; preds = %93
  %100 = load i32, ptr %14, align 4, !dbg !4704
  %101 = sext i32 %100 to i64, !dbg !4706
  %102 = getelementptr inbounds [900 x i8], ptr %8, i64 0, i64 %101, !dbg !4706
  store i8 1, ptr %102, align 1, !dbg !4707
  %103 = load i32, ptr %13, align 4, !dbg !4708
  %104 = add nsw i32 %103, 1, !dbg !4709
  %105 = trunc i32 %104 to i8, !dbg !4708
  %106 = load ptr, ptr %5, align 8, !dbg !4710
  %107 = load i32, ptr %14, align 4, !dbg !4711
  %108 = sext i32 %107 to i64, !dbg !4710
  %109 = getelementptr inbounds i8, ptr %106, i64 %108, !dbg !4710
  store i8 %105, ptr %109, align 1, !dbg !4712
  %110 = load i32, ptr %14, align 4, !dbg !4713
  %111 = load i32, ptr %11, align 4, !dbg !4714
  %112 = add nsw i32 %111, 1, !dbg !4714
  store i32 %112, ptr %11, align 4, !dbg !4714
  %113 = sext i32 %111 to i64, !dbg !4715
  %114 = getelementptr inbounds [900 x i32], ptr %9, i64 0, i64 %113, !dbg !4715
  store i32 %110, ptr %114, align 4, !dbg !4716
  br label %115, !dbg !4717

115:                                              ; preds = %99, %93
  br label %116, !dbg !4718

116:                                              ; preds = %115, %86
  br label %117, !dbg !4719

117:                                              ; preds = %116, %74
  br label %118, !dbg !4720

118:                                              ; preds = %117
  %119 = load i32, ptr %6, align 4, !dbg !4721
  %120 = add nsw i32 %119, 1, !dbg !4721
  store i32 %120, ptr %6, align 4, !dbg !4721
  br label %71, !dbg !4722, !llvm.loop !4723

121:                                              ; preds = %71
  br label %55, !dbg !4668, !llvm.loop !4725

122:                                              ; preds = %55
  %123 = load i32, ptr %13, align 4, !dbg !4727
  %124 = add nsw i32 %123, 1, !dbg !4728
  store i32 %124, ptr %3, align 4, !dbg !4729
  br label %125, !dbg !4729

125:                                              ; preds = %122, %34
  %126 = load i32, ptr %3, align 4, !dbg !4730
  ret i32 %126, !dbg !4730
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z22apply_light_to_segmentP7segmentP10vms_vectorii(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 !dbg !4731 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct.vms_vector, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
    #dbg_declare(ptr %5, !4734, !DIExpression(), !4735)
  store ptr %1, ptr %6, align 8
    #dbg_declare(ptr %6, !4736, !DIExpression(), !4737)
  store i32 %2, ptr %7, align 4
    #dbg_declare(ptr %7, !4738, !DIExpression(), !4739)
  store i32 %3, ptr %8, align 4
    #dbg_declare(ptr %8, !4740, !DIExpression(), !4741)
    #dbg_declare(ptr %9, !4742, !DIExpression(), !4743)
    #dbg_declare(ptr %10, !4744, !DIExpression(), !4745)
    #dbg_declare(ptr %11, !4746, !DIExpression(), !4747)
    #dbg_declare(ptr %12, !4748, !DIExpression(), !4749)
  %16 = load ptr, ptr %5, align 8, !dbg !4750
  %17 = ptrtoint ptr %16 to i64, !dbg !4751
  %18 = sub i64 %17, ptrtoint (ptr @Segments to i64), !dbg !4751
  %19 = sdiv exact i64 %18, 512, !dbg !4751
  %20 = trunc i64 %19 to i32, !dbg !4750
  store i32 %20, ptr %12, align 4, !dbg !4749
    #dbg_declare(ptr %13, !4752, !DIExpression(), !4753)
  store i32 0, ptr %11, align 4, !dbg !4754
  br label %21, !dbg !4756

21:                                               ; preds = %35, %4
  %22 = load i32, ptr %11, align 4, !dbg !4757
  %23 = load i32, ptr @n_changed_segs, align 4, !dbg !4759
  %24 = icmp slt i32 %22, %23, !dbg !4760
  br i1 %24, label %25, label %38, !dbg !4761

25:                                               ; preds = %21
  %26 = load i32, ptr %11, align 4, !dbg !4762
  %27 = sext i32 %26 to i64, !dbg !4764
  %28 = getelementptr inbounds [30 x i16], ptr @changed_segs, i64 0, i64 %27, !dbg !4764
  %29 = load i16, ptr %28, align 2, !dbg !4764
  %30 = sext i16 %29 to i32, !dbg !4764
  %31 = load i32, ptr %12, align 4, !dbg !4765
  %32 = icmp eq i32 %30, %31, !dbg !4766
  br i1 %32, label %33, label %34, !dbg !4766

33:                                               ; preds = %25
  br label %39, !dbg !4767

34:                                               ; preds = %25
  br label %35, !dbg !4765

35:                                               ; preds = %34
  %36 = load i32, ptr %11, align 4, !dbg !4768
  %37 = add nsw i32 %36, 1, !dbg !4768
  store i32 %37, ptr %11, align 4, !dbg !4768
  br label %21, !dbg !4769, !llvm.loop !4770

38:                                               ; preds = %21
  br label %39, !dbg !4772

39:                                               ; preds = %38, %33
  %40 = load i32, ptr %11, align 4, !dbg !4772
  %41 = load i32, ptr @n_changed_segs, align 4, !dbg !4774
  %42 = icmp eq i32 %40, %41, !dbg !4775
  br i1 %42, label %43, label %95, !dbg !4775

43:                                               ; preds = %39
  %44 = load ptr, ptr %5, align 8, !dbg !4776
  call void @_Z22compute_segment_centerP10vms_vectorP7segment(ptr noundef %9, ptr noundef %44), !dbg !4778
  %45 = load ptr, ptr %6, align 8, !dbg !4779
  %46 = call noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef %9, ptr noundef %45), !dbg !4780
  store i32 %46, ptr %10, align 4, !dbg !4781
  %47 = load i32, ptr %10, align 4, !dbg !4782
  %48 = icmp sle i32 %47, 5242880, !dbg !4784
  br i1 %48, label %49, label %88, !dbg !4784

49:                                               ; preds = %43
    #dbg_declare(ptr %14, !4785, !DIExpression(), !4787)
  %50 = load i32, ptr %10, align 4, !dbg !4788
  %51 = icmp sgt i32 %50, 65536, !dbg !4790
  br i1 %51, label %52, label %55, !dbg !4790

52:                                               ; preds = %49
  %53 = load i32, ptr %10, align 4, !dbg !4791
  %54 = call noundef i32 @_Z6fixdivii(i32 noundef 1048576, i32 noundef %53), !dbg !4792
  store i32 %54, ptr %14, align 4, !dbg !4793
  br label %56, !dbg !4794

55:                                               ; preds = %49
  store i32 1048576, ptr %14, align 4, !dbg !4795
  br label %56

56:                                               ; preds = %55, %52
  %57 = load i32, ptr %14, align 4, !dbg !4796
  %58 = icmp sge i32 %57, 0, !dbg !4798
  br i1 %58, label %59, label %87, !dbg !4798

59:                                               ; preds = %56
    #dbg_declare(ptr %15, !4799, !DIExpression(), !4810)
  %60 = load i32, ptr %12, align 4, !dbg !4811
  %61 = sext i32 %60 to i64, !dbg !4812
  %62 = getelementptr inbounds [0 x %struct.segment2], ptr @Segment2s, i64 0, i64 %61, !dbg !4812
  store ptr %62, ptr %15, align 8, !dbg !4810
  %63 = load i32, ptr %14, align 4, !dbg !4813
  %64 = load i32, ptr %7, align 4, !dbg !4814
  %65 = call noundef i32 @_Z6fixmulii(i32 noundef %63, i32 noundef %64), !dbg !4815
  store i32 %65, ptr %14, align 4, !dbg !4816
  %66 = load i32, ptr %14, align 4, !dbg !4817
  %67 = icmp sge i32 %66, 65536, !dbg !4819
  br i1 %67, label %68, label %69, !dbg !4819

68:                                               ; preds = %59
  store i32 65535, ptr %14, align 4, !dbg !4820
  br label %69, !dbg !4821

69:                                               ; preds = %68, %59
  %70 = load i32, ptr %14, align 4, !dbg !4822
  %71 = icmp sle i32 %70, -65536, !dbg !4824
  br i1 %71, label %72, label %73, !dbg !4824

72:                                               ; preds = %69
  store i32 -65535, ptr %14, align 4, !dbg !4825
  br label %73, !dbg !4826

73:                                               ; preds = %72, %69
  %74 = load i32, ptr %14, align 4, !dbg !4827
  %75 = load ptr, ptr %15, align 8, !dbg !4828
  %76 = getelementptr inbounds nuw %struct.segment2, ptr %75, i32 0, i32 4, !dbg !4829
  %77 = load i32, ptr %76, align 4, !dbg !4830
  %78 = add nsw i32 %77, %74, !dbg !4830
  store i32 %78, ptr %76, align 4, !dbg !4830
  %79 = load ptr, ptr %15, align 8, !dbg !4831
  %80 = getelementptr inbounds nuw %struct.segment2, ptr %79, i32 0, i32 4, !dbg !4833
  %81 = load i32, ptr %80, align 4, !dbg !4833
  %82 = icmp slt i32 %81, 0, !dbg !4834
  br i1 %82, label %83, label %86, !dbg !4834

83:                                               ; preds = %73
  %84 = load ptr, ptr %15, align 8, !dbg !4835
  %85 = getelementptr inbounds nuw %struct.segment2, ptr %84, i32 0, i32 4, !dbg !4836
  store i32 0, ptr %85, align 4, !dbg !4837
  br label %86, !dbg !4835

86:                                               ; preds = %83, %73
  br label %87, !dbg !4838

87:                                               ; preds = %86, %56
  br label %88, !dbg !4839

88:                                               ; preds = %87, %43
  %89 = load i32, ptr %12, align 4, !dbg !4840
  %90 = trunc i32 %89 to i16, !dbg !4840
  %91 = load i32, ptr @n_changed_segs, align 4, !dbg !4841
  %92 = add nsw i32 %91, 1, !dbg !4841
  store i32 %92, ptr @n_changed_segs, align 4, !dbg !4841
  %93 = sext i32 %91 to i64, !dbg !4842
  %94 = getelementptr inbounds [30 x i16], ptr @changed_segs, i64 0, i64 %93, !dbg !4842
  store i16 %90, ptr %94, align 2, !dbg !4843
  br label %95, !dbg !4844

95:                                               ; preds = %88, %39
  %96 = load i32, ptr %8, align 4, !dbg !4845
  %97 = icmp slt i32 %96, 2, !dbg !4847
  br i1 %97, label %98, label %163, !dbg !4847

98:                                               ; preds = %95
  store i32 0, ptr %13, align 4, !dbg !4848
  br label %99, !dbg !4850

99:                                               ; preds = %159, %98
  %100 = load i32, ptr %13, align 4, !dbg !4851
  %101 = icmp slt i32 %100, 6, !dbg !4853
  br i1 %101, label %102, label %162, !dbg !4854

102:                                              ; preds = %99
  %103 = load ptr, ptr %5, align 8, !dbg !4855
  %104 = getelementptr inbounds nuw %struct.segment, ptr %103, i32 0, i32 1, !dbg !4855
  %105 = load i32, ptr %13, align 4, !dbg !4855
  %106 = sext i32 %105 to i64, !dbg !4855
  %107 = getelementptr inbounds [6 x i16], ptr %104, i64 0, i64 %106, !dbg !4855
  %108 = load i16, ptr %107, align 2, !dbg !4855
  %109 = sext i16 %108 to i32, !dbg !4855
  %110 = icmp eq i32 %109, -1, !dbg !4855
  br i1 %110, label %111, label %112, !dbg !4855

111:                                              ; preds = %102
  br label %141, !dbg !4855

112:                                              ; preds = %102
  %113 = load ptr, ptr %5, align 8, !dbg !4855
  %114 = getelementptr inbounds nuw %struct.segment, ptr %113, i32 0, i32 1, !dbg !4855
  %115 = load i32, ptr %13, align 4, !dbg !4855
  %116 = sext i32 %115 to i64, !dbg !4855
  %117 = getelementptr inbounds [6 x i16], ptr %114, i64 0, i64 %116, !dbg !4855
  %118 = load i16, ptr %117, align 2, !dbg !4855
  %119 = sext i16 %118 to i32, !dbg !4855
  %120 = icmp eq i32 %119, -2, !dbg !4855
  br i1 %120, label %121, label %122, !dbg !4855

121:                                              ; preds = %112
  br label %139, !dbg !4855

122:                                              ; preds = %112
  %123 = load ptr, ptr %5, align 8, !dbg !4855
  %124 = getelementptr inbounds nuw %struct.segment, ptr %123, i32 0, i32 0, !dbg !4855
  %125 = load i32, ptr %13, align 4, !dbg !4855
  %126 = sext i32 %125 to i64, !dbg !4855
  %127 = getelementptr inbounds [6 x %struct.side], ptr %124, i64 0, i64 %126, !dbg !4855
  %128 = getelementptr inbounds nuw %struct.side, ptr %127, i32 0, i32 2, !dbg !4855
  %129 = load i16, ptr %128, align 2, !dbg !4855
  %130 = sext i16 %129 to i32, !dbg !4855
  %131 = icmp eq i32 %130, -1, !dbg !4855
  br i1 %131, label %132, label %133, !dbg !4855

132:                                              ; preds = %122
  br label %137, !dbg !4855

133:                                              ; preds = %122
  %134 = load ptr, ptr %5, align 8, !dbg !4855
  %135 = load i32, ptr %13, align 4, !dbg !4855
  %136 = call noundef i32 @_Z15wall_is_doorwayP7segmenti(ptr noundef %134, i32 noundef %135), !dbg !4855
  br label %137, !dbg !4855

137:                                              ; preds = %133, %132
  %138 = phi i32 [ 5, %132 ], [ %136, %133 ], !dbg !4855
  br label %139, !dbg !4855

139:                                              ; preds = %137, %121
  %140 = phi i32 [ 8, %121 ], [ %138, %137 ], !dbg !4855
  br label %141, !dbg !4855

141:                                              ; preds = %139, %111
  %142 = phi i32 [ 2, %111 ], [ %140, %139 ], !dbg !4855
  %143 = and i32 %142, 4, !dbg !4858
  %144 = icmp ne i32 %143, 0, !dbg !4855
  br i1 %144, label %145, label %158, !dbg !4855

145:                                              ; preds = %141
  %146 = load ptr, ptr %5, align 8, !dbg !4859
  %147 = getelementptr inbounds nuw %struct.segment, ptr %146, i32 0, i32 1, !dbg !4860
  %148 = load i32, ptr %13, align 4, !dbg !4861
  %149 = sext i32 %148 to i64, !dbg !4859
  %150 = getelementptr inbounds [6 x i16], ptr %147, i64 0, i64 %149, !dbg !4859
  %151 = load i16, ptr %150, align 2, !dbg !4859
  %152 = sext i16 %151 to i64, !dbg !4862
  %153 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %152, !dbg !4862
  %154 = load ptr, ptr %6, align 8, !dbg !4863
  %155 = load i32, ptr %7, align 4, !dbg !4864
  %156 = load i32, ptr %8, align 4, !dbg !4865
  %157 = add nsw i32 %156, 1, !dbg !4866
  call void @_Z22apply_light_to_segmentP7segmentP10vms_vectorii(ptr noundef %153, ptr noundef %154, i32 noundef %155, i32 noundef %157), !dbg !4867
  br label %158, !dbg !4867

158:                                              ; preds = %145, %141
  br label %159, !dbg !4868

159:                                              ; preds = %158
  %160 = load i32, ptr %13, align 4, !dbg !4869
  %161 = add nsw i32 %160, 1, !dbg !4869
  store i32 %161, ptr %13, align 4, !dbg !4869
  br label %99, !dbg !4870, !llvm.loop !4871

162:                                              ; preds = %99
  br label %163, !dbg !4872

163:                                              ; preds = %162, %95
  ret void, !dbg !4873
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z6fixdivii(i32 noundef %0, i32 noundef %1) #2 !dbg !4874 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
    #dbg_declare(ptr %4, !4877, !DIExpression(), !4878)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !4879, !DIExpression(), !4880)
  %6 = load i32, ptr %5, align 4, !dbg !4881
  %7 = icmp eq i32 %6, 0, !dbg !4883
  br i1 %7, label %8, label %9, !dbg !4883

8:                                                ; preds = %2
  store i32 1, ptr %3, align 4, !dbg !4884
  br label %17, !dbg !4884

9:                                                ; preds = %2
  %10 = load i32, ptr %4, align 4, !dbg !4885
  %11 = sext i32 %10 to i64, !dbg !4885
  %12 = shl i64 %11, 16, !dbg !4886
  %13 = load i32, ptr %5, align 4, !dbg !4887
  %14 = sext i32 %13 to i64, !dbg !4887
  %15 = sdiv i64 %12, %14, !dbg !4888
  %16 = trunc i64 %15 to i32, !dbg !4889
  store i32 %16, ptr %3, align 4, !dbg !4890
  br label %17, !dbg !4890

17:                                               ; preds = %9, %8
  %18 = load i32, ptr %3, align 4, !dbg !4891
  ret i32 %18, !dbg !4891
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z6fixmulii(i32 noundef %0, i32 noundef %1) #2 !dbg !4892 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !4893, !DIExpression(), !4894)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !4895, !DIExpression(), !4896)
  %5 = load i32, ptr %3, align 4, !dbg !4897
  %6 = sext i32 %5 to i64, !dbg !4897
  %7 = load i32, ptr %4, align 4, !dbg !4898
  %8 = sext i32 %7 to i64, !dbg !4898
  %9 = mul nsw i64 %6, %8, !dbg !4899
  %10 = ashr i64 %9, 16, !dbg !4900
  %11 = trunc i64 %10 to i32, !dbg !4901
  ret i32 %11, !dbg !4902
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z20change_segment_lightiii(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 !dbg !4903 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca %struct.vms_vector, align 4
  store i32 %0, ptr %4, align 4
    #dbg_declare(ptr %4, !4906, !DIExpression(), !4907)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !4908, !DIExpression(), !4909)
  store i32 %2, ptr %6, align 4
    #dbg_declare(ptr %6, !4910, !DIExpression(), !4911)
    #dbg_declare(ptr %7, !4912, !DIExpression(), !4913)
  %11 = load i32, ptr %4, align 4, !dbg !4914
  %12 = sext i32 %11 to i64, !dbg !4915
  %13 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %12, !dbg !4915
  store ptr %13, ptr %7, align 8, !dbg !4913
  %14 = load ptr, ptr %7, align 8, !dbg !4916
  %15 = getelementptr inbounds nuw %struct.segment, ptr %14, i32 0, i32 1, !dbg !4916
  %16 = load i32, ptr %5, align 4, !dbg !4916
  %17 = sext i32 %16 to i64, !dbg !4916
  %18 = getelementptr inbounds [6 x i16], ptr %15, i64 0, i64 %17, !dbg !4916
  %19 = load i16, ptr %18, align 2, !dbg !4916
  %20 = sext i16 %19 to i32, !dbg !4916
  %21 = icmp eq i32 %20, -1, !dbg !4916
  br i1 %21, label %22, label %23, !dbg !4916

22:                                               ; preds = %3
  br label %52, !dbg !4916

23:                                               ; preds = %3
  %24 = load ptr, ptr %7, align 8, !dbg !4916
  %25 = getelementptr inbounds nuw %struct.segment, ptr %24, i32 0, i32 1, !dbg !4916
  %26 = load i32, ptr %5, align 4, !dbg !4916
  %27 = sext i32 %26 to i64, !dbg !4916
  %28 = getelementptr inbounds [6 x i16], ptr %25, i64 0, i64 %27, !dbg !4916
  %29 = load i16, ptr %28, align 2, !dbg !4916
  %30 = sext i16 %29 to i32, !dbg !4916
  %31 = icmp eq i32 %30, -2, !dbg !4916
  br i1 %31, label %32, label %33, !dbg !4916

32:                                               ; preds = %23
  br label %50, !dbg !4916

33:                                               ; preds = %23
  %34 = load ptr, ptr %7, align 8, !dbg !4916
  %35 = getelementptr inbounds nuw %struct.segment, ptr %34, i32 0, i32 0, !dbg !4916
  %36 = load i32, ptr %5, align 4, !dbg !4916
  %37 = sext i32 %36 to i64, !dbg !4916
  %38 = getelementptr inbounds [6 x %struct.side], ptr %35, i64 0, i64 %37, !dbg !4916
  %39 = getelementptr inbounds nuw %struct.side, ptr %38, i32 0, i32 2, !dbg !4916
  %40 = load i16, ptr %39, align 2, !dbg !4916
  %41 = sext i16 %40 to i32, !dbg !4916
  %42 = icmp eq i32 %41, -1, !dbg !4916
  br i1 %42, label %43, label %44, !dbg !4916

43:                                               ; preds = %33
  br label %48, !dbg !4916

44:                                               ; preds = %33
  %45 = load ptr, ptr %7, align 8, !dbg !4916
  %46 = load i32, ptr %5, align 4, !dbg !4916
  %47 = call noundef i32 @_Z15wall_is_doorwayP7segmenti(ptr noundef %45, i32 noundef %46), !dbg !4916
  br label %48, !dbg !4916

48:                                               ; preds = %44, %43
  %49 = phi i32 [ 5, %43 ], [ %47, %44 ], !dbg !4916
  br label %50, !dbg !4916

50:                                               ; preds = %48, %32
  %51 = phi i32 [ 8, %32 ], [ %49, %48 ], !dbg !4916
  br label %52, !dbg !4916

52:                                               ; preds = %50, %22
  %53 = phi i32 [ 2, %22 ], [ %51, %50 ], !dbg !4916
  %54 = and i32 %53, 2, !dbg !4918
  %55 = icmp ne i32 %54, 0, !dbg !4916
  br i1 %55, label %56, label %89, !dbg !4916

56:                                               ; preds = %52
    #dbg_declare(ptr %8, !4919, !DIExpression(), !4921)
  %57 = load ptr, ptr %7, align 8, !dbg !4922
  %58 = getelementptr inbounds nuw %struct.segment, ptr %57, i32 0, i32 0, !dbg !4923
  %59 = load i32, ptr %5, align 4, !dbg !4924
  %60 = sext i32 %59 to i64, !dbg !4922
  %61 = getelementptr inbounds [6 x %struct.side], ptr %58, i64 0, i64 %60, !dbg !4922
  store ptr %61, ptr %8, align 8, !dbg !4921
    #dbg_declare(ptr %9, !4925, !DIExpression(), !4926)
  %62 = load ptr, ptr %8, align 8, !dbg !4927
  %63 = getelementptr inbounds nuw %struct.side, ptr %62, i32 0, i32 3, !dbg !4928
  %64 = load i16, ptr %63, align 4, !dbg !4928
  %65 = sext i16 %64 to i64, !dbg !4929
  %66 = getelementptr inbounds [1200 x %struct.tmap_info], ptr @TmapInfo, i64 0, i64 %65, !dbg !4929
  %67 = getelementptr inbounds nuw %struct.tmap_info, ptr %66, i32 0, i32 2, !dbg !4930
  %68 = load i32, ptr %67, align 4, !dbg !4930
  %69 = load ptr, ptr %8, align 8, !dbg !4931
  %70 = getelementptr inbounds nuw %struct.side, ptr %69, i32 0, i32 4, !dbg !4932
  %71 = load i16, ptr %70, align 2, !dbg !4932
  %72 = sext i16 %71 to i32, !dbg !4931
  %73 = and i32 %72, 16383, !dbg !4933
  %74 = sext i32 %73 to i64, !dbg !4934
  %75 = getelementptr inbounds [1200 x %struct.tmap_info], ptr @TmapInfo, i64 0, i64 %74, !dbg !4934
  %76 = getelementptr inbounds nuw %struct.tmap_info, ptr %75, i32 0, i32 2, !dbg !4935
  %77 = load i32, ptr %76, align 4, !dbg !4935
  %78 = add nsw i32 %68, %77, !dbg !4936
  store i32 %78, ptr %9, align 4, !dbg !4937
  %79 = load i32, ptr %6, align 4, !dbg !4938
  %80 = load i32, ptr %9, align 4, !dbg !4939
  %81 = mul nsw i32 %80, %79, !dbg !4939
  store i32 %81, ptr %9, align 4, !dbg !4939
  store i32 0, ptr @n_changed_segs, align 4, !dbg !4940
  %82 = load i32, ptr %9, align 4, !dbg !4941
  %83 = icmp ne i32 %82, 0, !dbg !4941
  br i1 %83, label %84, label %88, !dbg !4941

84:                                               ; preds = %56
    #dbg_declare(ptr %10, !4943, !DIExpression(), !4945)
  %85 = load ptr, ptr %7, align 8, !dbg !4946
  call void @_Z22compute_segment_centerP10vms_vectorP7segment(ptr noundef %10, ptr noundef %85), !dbg !4947
  %86 = load ptr, ptr %7, align 8, !dbg !4948
  %87 = load i32, ptr %9, align 4, !dbg !4949
  call void @_Z22apply_light_to_segmentP7segmentP10vms_vectorii(ptr noundef %86, ptr noundef %10, i32 noundef %87, i32 noundef 0), !dbg !4950
  br label %88, !dbg !4951

88:                                               ; preds = %84, %56
  br label %89, !dbg !4952

89:                                               ; preds = %88, %52
  store ptr null, ptr @old_viewer, align 8, !dbg !4953
  ret void, !dbg !4954
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z12change_lightiii(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 !dbg !4955 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
    #dbg_declare(ptr %4, !4956, !DIExpression(), !4957)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !4958, !DIExpression(), !4959)
  store i32 %2, ptr %6, align 4
    #dbg_declare(ptr %6, !4960, !DIExpression(), !4961)
    #dbg_declare(ptr %7, !4962, !DIExpression(), !4963)
    #dbg_declare(ptr %8, !4964, !DIExpression(), !4965)
    #dbg_declare(ptr %9, !4966, !DIExpression(), !4967)
  store i32 0, ptr %7, align 4, !dbg !4968
  br label %14, !dbg !4970

14:                                               ; preds = %153, %3
  %15 = load i32, ptr %7, align 4, !dbg !4971
  %16 = load i32, ptr @Num_static_lights, align 4, !dbg !4973
  %17 = icmp slt i32 %15, %16, !dbg !4974
  br i1 %17, label %18, label %156, !dbg !4975

18:                                               ; preds = %14
  %19 = load i32, ptr %7, align 4, !dbg !4976
  %20 = sext i32 %19 to i64, !dbg !4979
  %21 = getelementptr inbounds [500 x %struct.dl_index], ptr @Dl_indices, i64 0, i64 %20, !dbg !4979
  %22 = getelementptr inbounds nuw %struct.dl_index, ptr %21, i32 0, i32 0, !dbg !4980
  %23 = load i16, ptr %22, align 2, !dbg !4980
  %24 = sext i16 %23 to i32, !dbg !4979
  %25 = load i32, ptr %4, align 4, !dbg !4981
  %26 = icmp eq i32 %24, %25, !dbg !4982
  br i1 %26, label %27, label %152, !dbg !4983

27:                                               ; preds = %18
  %28 = load i32, ptr %7, align 4, !dbg !4984
  %29 = sext i32 %28 to i64, !dbg !4985
  %30 = getelementptr inbounds [500 x %struct.dl_index], ptr @Dl_indices, i64 0, i64 %29, !dbg !4985
  %31 = getelementptr inbounds nuw %struct.dl_index, ptr %30, i32 0, i32 1, !dbg !4986
  %32 = load i8, ptr %31, align 2, !dbg !4986
  %33 = sext i8 %32 to i32, !dbg !4985
  %34 = load i32, ptr %5, align 4, !dbg !4987
  %35 = icmp eq i32 %33, %34, !dbg !4988
  br i1 %35, label %36, label %152, !dbg !4983

36:                                               ; preds = %27
    #dbg_declare(ptr %10, !4989, !DIExpression(), !4992)
    #dbg_declare(ptr %11, !4993, !DIExpression(), !4994)
  %37 = load i32, ptr %7, align 4, !dbg !4995
  %38 = sext i32 %37 to i64, !dbg !4996
  %39 = getelementptr inbounds [500 x %struct.dl_index], ptr @Dl_indices, i64 0, i64 %38, !dbg !4996
  %40 = getelementptr inbounds nuw %struct.dl_index, ptr %39, i32 0, i32 3, !dbg !4997
  %41 = load i16, ptr %40, align 2, !dbg !4997
  %42 = sext i16 %41 to i32, !dbg !4996
  store i32 %42, ptr %11, align 4, !dbg !4994
  store i32 0, ptr %8, align 4, !dbg !4998
  br label %43, !dbg !5000

43:                                               ; preds = %148, %36
  %44 = load i32, ptr %8, align 4, !dbg !5001
  %45 = load i32, ptr %7, align 4, !dbg !5003
  %46 = sext i32 %45 to i64, !dbg !5004
  %47 = getelementptr inbounds [500 x %struct.dl_index], ptr @Dl_indices, i64 0, i64 %46, !dbg !5004
  %48 = getelementptr inbounds nuw %struct.dl_index, ptr %47, i32 0, i32 2, !dbg !5005
  %49 = load i8, ptr %48, align 1, !dbg !5005
  %50 = sext i8 %49 to i32, !dbg !5004
  %51 = icmp slt i32 %44, %50, !dbg !5006
  br i1 %51, label %52, label %151, !dbg !5007

52:                                               ; preds = %43
  %53 = load i32, ptr %11, align 4, !dbg !5008
  %54 = icmp slt i32 %53, 0, !dbg !5011
  br i1 %54, label %58, label %55, !dbg !5012

55:                                               ; preds = %52
  %56 = load i32, ptr %11, align 4, !dbg !5013
  %57 = icmp sge i32 %56, 10000, !dbg !5014
  br i1 %57, label %58, label %59, !dbg !5012

58:                                               ; preds = %55, %52
  br label %148, !dbg !5015

59:                                               ; preds = %55
  %60 = load i32, ptr %11, align 4, !dbg !5016
  %61 = sext i32 %60 to i64, !dbg !5017
  %62 = getelementptr inbounds [10000 x %struct.delta_light], ptr @Delta_lights, i64 0, i64 %61, !dbg !5017
  store ptr %62, ptr %10, align 8, !dbg !5018
  %63 = load ptr, ptr %10, align 8, !dbg !5019
  %64 = getelementptr inbounds nuw %struct.delta_light, ptr %63, i32 0, i32 0, !dbg !5021
  %65 = load i16, ptr %64, align 2, !dbg !5021
  %66 = sext i16 %65 to i32, !dbg !5019
  %67 = icmp slt i32 %66, 0, !dbg !5022
  br i1 %67, label %87, label %68, !dbg !5023

68:                                               ; preds = %59
  %69 = load ptr, ptr %10, align 8, !dbg !5024
  %70 = getelementptr inbounds nuw %struct.delta_light, ptr %69, i32 0, i32 0, !dbg !5025
  %71 = load i16, ptr %70, align 2, !dbg !5025
  %72 = sext i16 %71 to i32, !dbg !5024
  %73 = load i32, ptr @Highest_segment_index, align 4, !dbg !5026
  %74 = icmp sgt i32 %72, %73, !dbg !5027
  br i1 %74, label %87, label %75, !dbg !5028

75:                                               ; preds = %68
  %76 = load ptr, ptr %10, align 8, !dbg !5029
  %77 = getelementptr inbounds nuw %struct.delta_light, ptr %76, i32 0, i32 1, !dbg !5030
  %78 = load i8, ptr %77, align 2, !dbg !5030
  %79 = sext i8 %78 to i32, !dbg !5029
  %80 = icmp slt i32 %79, 0, !dbg !5031
  br i1 %80, label %87, label %81, !dbg !5032

81:                                               ; preds = %75
  %82 = load ptr, ptr %10, align 8, !dbg !5033
  %83 = getelementptr inbounds nuw %struct.delta_light, ptr %82, i32 0, i32 1, !dbg !5034
  %84 = load i8, ptr %83, align 2, !dbg !5034
  %85 = sext i8 %84 to i32, !dbg !5033
  %86 = icmp sge i32 %85, 6, !dbg !5035
  br i1 %86, label %87, label %88, !dbg !5032

87:                                               ; preds = %81, %75, %68, %59
  br label %148, !dbg !5036

88:                                               ; preds = %81
  store i32 0, ptr %9, align 4, !dbg !5037
  br label %89, !dbg !5039

89:                                               ; preds = %142, %88
  %90 = load i32, ptr %9, align 4, !dbg !5040
  %91 = icmp slt i32 %90, 4, !dbg !5042
  br i1 %91, label %92, label %145, !dbg !5043

92:                                               ; preds = %89
    #dbg_declare(ptr %12, !5044, !DIExpression(), !5046)
    #dbg_declare(ptr %13, !5047, !DIExpression(), !5048)
  %93 = load i32, ptr %6, align 4, !dbg !5049
  %94 = load ptr, ptr %10, align 8, !dbg !5050
  %95 = getelementptr inbounds nuw %struct.delta_light, ptr %94, i32 0, i32 3, !dbg !5051
  %96 = load i32, ptr %9, align 4, !dbg !5052
  %97 = sext i32 %96 to i64, !dbg !5050
  %98 = getelementptr inbounds [4 x i8], ptr %95, i64 0, i64 %97, !dbg !5050
  %99 = load i8, ptr %98, align 1, !dbg !5050
  %100 = zext i8 %99 to i32, !dbg !5050
  %101 = mul nsw i32 %93, %100, !dbg !5053
  %102 = mul nsw i32 %101, 2048, !dbg !5054
  store i32 %102, ptr %12, align 4, !dbg !5055
  %103 = load i32, ptr %12, align 4, !dbg !5056
  %104 = load ptr, ptr %10, align 8, !dbg !5057
  %105 = getelementptr inbounds nuw %struct.delta_light, ptr %104, i32 0, i32 0, !dbg !5058
  %106 = load i16, ptr %105, align 2, !dbg !5058
  %107 = sext i16 %106 to i64, !dbg !5059
  %108 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %107, !dbg !5059
  %109 = getelementptr inbounds nuw %struct.segment, ptr %108, i32 0, i32 0, !dbg !5060
  %110 = load ptr, ptr %10, align 8, !dbg !5061
  %111 = getelementptr inbounds nuw %struct.delta_light, ptr %110, i32 0, i32 1, !dbg !5062
  %112 = load i8, ptr %111, align 2, !dbg !5062
  %113 = sext i8 %112 to i64, !dbg !5059
  %114 = getelementptr inbounds [6 x %struct.side], ptr %109, i64 0, i64 %113, !dbg !5059
  %115 = getelementptr inbounds nuw %struct.side, ptr %114, i32 0, i32 5, !dbg !5063
  %116 = load i32, ptr %9, align 4, !dbg !5064
  %117 = sext i32 %116 to i64, !dbg !5059
  %118 = getelementptr inbounds [4 x %struct.uvl], ptr %115, i64 0, i64 %117, !dbg !5059
  %119 = getelementptr inbounds nuw %struct.uvl, ptr %118, i32 0, i32 2, !dbg !5065
  %120 = load i32, ptr %119, align 4, !dbg !5066
  %121 = add nsw i32 %120, %103, !dbg !5066
  store i32 %121, ptr %119, align 4, !dbg !5066
  store i32 %121, ptr %13, align 4, !dbg !5067
  %122 = load i32, ptr %13, align 4, !dbg !5068
  %123 = icmp slt i32 %122, 0, !dbg !5070
  br i1 %123, label %124, label %141, !dbg !5070

124:                                              ; preds = %92
  %125 = load ptr, ptr %10, align 8, !dbg !5071
  %126 = getelementptr inbounds nuw %struct.delta_light, ptr %125, i32 0, i32 0, !dbg !5072
  %127 = load i16, ptr %126, align 2, !dbg !5072
  %128 = sext i16 %127 to i64, !dbg !5073
  %129 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %128, !dbg !5073
  %130 = getelementptr inbounds nuw %struct.segment, ptr %129, i32 0, i32 0, !dbg !5074
  %131 = load ptr, ptr %10, align 8, !dbg !5075
  %132 = getelementptr inbounds nuw %struct.delta_light, ptr %131, i32 0, i32 1, !dbg !5076
  %133 = load i8, ptr %132, align 2, !dbg !5076
  %134 = sext i8 %133 to i64, !dbg !5073
  %135 = getelementptr inbounds [6 x %struct.side], ptr %130, i64 0, i64 %134, !dbg !5073
  %136 = getelementptr inbounds nuw %struct.side, ptr %135, i32 0, i32 5, !dbg !5077
  %137 = load i32, ptr %9, align 4, !dbg !5078
  %138 = sext i32 %137 to i64, !dbg !5073
  %139 = getelementptr inbounds [4 x %struct.uvl], ptr %136, i64 0, i64 %138, !dbg !5073
  %140 = getelementptr inbounds nuw %struct.uvl, ptr %139, i32 0, i32 2, !dbg !5079
  store i32 0, ptr %140, align 4, !dbg !5080
  br label %141, !dbg !5073

141:                                              ; preds = %124, %92
  br label %142, !dbg !5081

142:                                              ; preds = %141
  %143 = load i32, ptr %9, align 4, !dbg !5082
  %144 = add nsw i32 %143, 1, !dbg !5082
  store i32 %144, ptr %9, align 4, !dbg !5082
  br label %89, !dbg !5083, !llvm.loop !5084

145:                                              ; preds = %89
  %146 = load i32, ptr %11, align 4, !dbg !5086
  %147 = add nsw i32 %146, 1, !dbg !5086
  store i32 %147, ptr %11, align 4, !dbg !5086
  br label %148, !dbg !5087

148:                                              ; preds = %145, %87, %58
  %149 = load i32, ptr %8, align 4, !dbg !5088
  %150 = add nsw i32 %149, 1, !dbg !5088
  store i32 %150, ptr %8, align 4, !dbg !5088
  br label %43, !dbg !5089, !llvm.loop !5090

151:                                              ; preds = %43
  br label %152, !dbg !5092

152:                                              ; preds = %151, %27, %18
  br label %153, !dbg !5093

153:                                              ; preds = %152
  %154 = load i32, ptr %7, align 4, !dbg !5094
  %155 = add nsw i32 %154, 1, !dbg !5094
  store i32 %155, ptr %7, align 4, !dbg !5094
  br label %14, !dbg !5095, !llvm.loop !5096

156:                                              ; preds = %14
  %157 = load i32, ptr %4, align 4, !dbg !5098
  %158 = load i32, ptr %5, align 4, !dbg !5099
  %159 = load i32, ptr %6, align 4, !dbg !5100
  call void @_Z20change_segment_lightiii(i32 noundef %157, i32 noundef %158, i32 noundef %159), !dbg !5101
  ret void, !dbg !5102
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z14subtract_lightii(i32 noundef %0, i32 noundef %1) #0 !dbg !5103 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
    #dbg_declare(ptr %4, !5106, !DIExpression(), !5107)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !5108, !DIExpression(), !5109)
  %6 = load i32, ptr %4, align 4, !dbg !5110
  %7 = sext i32 %6 to i64, !dbg !5112
  %8 = getelementptr inbounds [900 x i8], ptr @Light_subtracted, i64 0, i64 %7, !dbg !5112
  %9 = load i8, ptr %8, align 1, !dbg !5112
  %10 = zext i8 %9 to i32, !dbg !5112
  %11 = load i32, ptr %5, align 4, !dbg !5113
  %12 = shl i32 1, %11, !dbg !5114
  %13 = and i32 %10, %12, !dbg !5115
  %14 = icmp ne i32 %13, 0, !dbg !5112
  br i1 %14, label %15, label %16, !dbg !5112

15:                                               ; preds = %2
  store i32 0, ptr %3, align 4, !dbg !5116
  br label %28, !dbg !5116

16:                                               ; preds = %2
  %17 = load i32, ptr %5, align 4, !dbg !5118
  %18 = shl i32 1, %17, !dbg !5119
  %19 = load i32, ptr %4, align 4, !dbg !5120
  %20 = sext i32 %19 to i64, !dbg !5121
  %21 = getelementptr inbounds [900 x i8], ptr @Light_subtracted, i64 0, i64 %20, !dbg !5121
  %22 = load i8, ptr %21, align 1, !dbg !5122
  %23 = zext i8 %22 to i32, !dbg !5122
  %24 = or i32 %23, %18, !dbg !5122
  %25 = trunc i32 %24 to i8, !dbg !5122
  store i8 %25, ptr %21, align 1, !dbg !5122
  %26 = load i32, ptr %4, align 4, !dbg !5123
  %27 = load i32, ptr %5, align 4, !dbg !5124
  call void @_Z12change_lightiii(i32 noundef %26, i32 noundef %27, i32 noundef -1), !dbg !5125
  store i32 1, ptr %3, align 4, !dbg !5126
  br label %28, !dbg !5126

28:                                               ; preds = %16, %15
  %29 = load i32, ptr %3, align 4, !dbg !5127
  ret i32 %29, !dbg !5127
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z9add_lightii(i32 noundef %0, i32 noundef %1) #0 !dbg !5128 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
    #dbg_declare(ptr %4, !5129, !DIExpression(), !5130)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !5131, !DIExpression(), !5132)
  %6 = load i32, ptr %4, align 4, !dbg !5133
  %7 = sext i32 %6 to i64, !dbg !5135
  %8 = getelementptr inbounds [900 x i8], ptr @Light_subtracted, i64 0, i64 %7, !dbg !5135
  %9 = load i8, ptr %8, align 1, !dbg !5135
  %10 = zext i8 %9 to i32, !dbg !5135
  %11 = load i32, ptr %5, align 4, !dbg !5136
  %12 = shl i32 1, %11, !dbg !5137
  %13 = and i32 %10, %12, !dbg !5138
  %14 = icmp ne i32 %13, 0, !dbg !5139
  br i1 %14, label %16, label %15, !dbg !5140

15:                                               ; preds = %2
  store i32 0, ptr %3, align 4, !dbg !5141
  br label %29, !dbg !5141

16:                                               ; preds = %2
  %17 = load i32, ptr %5, align 4, !dbg !5143
  %18 = shl i32 1, %17, !dbg !5144
  %19 = xor i32 %18, -1, !dbg !5145
  %20 = load i32, ptr %4, align 4, !dbg !5146
  %21 = sext i32 %20 to i64, !dbg !5147
  %22 = getelementptr inbounds [900 x i8], ptr @Light_subtracted, i64 0, i64 %21, !dbg !5147
  %23 = load i8, ptr %22, align 1, !dbg !5148
  %24 = zext i8 %23 to i32, !dbg !5148
  %25 = and i32 %24, %19, !dbg !5148
  %26 = trunc i32 %25 to i8, !dbg !5148
  store i8 %26, ptr %22, align 1, !dbg !5148
  %27 = load i32, ptr %4, align 4, !dbg !5149
  %28 = load i32, ptr %5, align 4, !dbg !5150
  call void @_Z12change_lightiii(i32 noundef %27, i32 noundef %28, i32 noundef 1), !dbg !5151
  store i32 1, ptr %3, align 4, !dbg !5152
  br label %29, !dbg !5152

29:                                               ; preds = %16, %15
  %30 = load i32, ptr %3, align 4, !dbg !5153
  ret i32 %30, !dbg !5153
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z23apply_all_changed_lightv() #0 !dbg !5154 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
    #dbg_declare(ptr %1, !5155, !DIExpression(), !5156)
    #dbg_declare(ptr %2, !5157, !DIExpression(), !5158)
  store i32 0, ptr %1, align 4, !dbg !5159
  br label %3, !dbg !5161

3:                                                ; preds = %29, %0
  %4 = load i32, ptr %1, align 4, !dbg !5162
  %5 = load i32, ptr @Highest_segment_index, align 4, !dbg !5164
  %6 = icmp sle i32 %4, %5, !dbg !5165
  br i1 %6, label %7, label %32, !dbg !5166

7:                                                ; preds = %3
  store i32 0, ptr %2, align 4, !dbg !5167
  br label %8, !dbg !5170

8:                                                ; preds = %25, %7
  %9 = load i32, ptr %2, align 4, !dbg !5171
  %10 = icmp slt i32 %9, 6, !dbg !5173
  br i1 %10, label %11, label %28, !dbg !5174

11:                                               ; preds = %8
  %12 = load i32, ptr %1, align 4, !dbg !5175
  %13 = sext i32 %12 to i64, !dbg !5177
  %14 = getelementptr inbounds [900 x i8], ptr @Light_subtracted, i64 0, i64 %13, !dbg !5177
  %15 = load i8, ptr %14, align 1, !dbg !5177
  %16 = zext i8 %15 to i32, !dbg !5177
  %17 = load i32, ptr %2, align 4, !dbg !5178
  %18 = shl i32 1, %17, !dbg !5179
  %19 = and i32 %16, %18, !dbg !5180
  %20 = icmp ne i32 %19, 0, !dbg !5177
  br i1 %20, label %21, label %24, !dbg !5177

21:                                               ; preds = %11
  %22 = load i32, ptr %1, align 4, !dbg !5181
  %23 = load i32, ptr %2, align 4, !dbg !5182
  call void @_Z12change_lightiii(i32 noundef %22, i32 noundef %23, i32 noundef -1), !dbg !5183
  br label %24, !dbg !5183

24:                                               ; preds = %21, %11
  br label %25, !dbg !5184

25:                                               ; preds = %24
  %26 = load i32, ptr %2, align 4, !dbg !5185
  %27 = add nsw i32 %26, 1, !dbg !5185
  store i32 %27, ptr %2, align 4, !dbg !5185
  br label %8, !dbg !5186, !llvm.loop !5187

28:                                               ; preds = %8
  br label %29, !dbg !5189

29:                                               ; preds = %28
  %30 = load i32, ptr %1, align 4, !dbg !5190
  %31 = add nsw i32 %30, 1, !dbg !5190
  store i32 %31, ptr %1, align 4, !dbg !5190
  br label %3, !dbg !5191, !llvm.loop !5192

32:                                               ; preds = %3
  ret void, !dbg !5194
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define void @_Z22clear_light_subtractedv() #2 !dbg !5195 {
  %1 = alloca i32, align 4
    #dbg_declare(ptr %1, !5196, !DIExpression(), !5197)
  store i32 0, ptr %1, align 4, !dbg !5198
  br label %2, !dbg !5200

2:                                                ; preds = %10, %0
  %3 = load i32, ptr %1, align 4, !dbg !5201
  %4 = load i32, ptr @Highest_segment_index, align 4, !dbg !5203
  %5 = icmp sle i32 %3, %4, !dbg !5204
  br i1 %5, label %6, label %13, !dbg !5205

6:                                                ; preds = %2
  %7 = load i32, ptr %1, align 4, !dbg !5206
  %8 = sext i32 %7 to i64, !dbg !5207
  %9 = getelementptr inbounds [900 x i8], ptr @Light_subtracted, i64 0, i64 %8, !dbg !5207
  store i8 0, ptr %9, align 1, !dbg !5208
  br label %10, !dbg !5207

10:                                               ; preds = %6
  %11 = load i32, ptr %1, align 4, !dbg !5209
  %12 = add nsw i32 %11, 1, !dbg !5209
  store i32 %12, ptr %1, align 4, !dbg !5209
  br label %2, !dbg !5210, !llvm.loop !5211

13:                                               ; preds = %2
  ret void, !dbg !5213
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z32find_connected_distance_segmentsiiii(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 !dbg !5214 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct.vms_vector, align 4
  %10 = alloca %struct.vms_vector, align 4
  store i32 %0, ptr %5, align 4
    #dbg_declare(ptr %5, !5217, !DIExpression(), !5218)
  store i32 %1, ptr %6, align 4
    #dbg_declare(ptr %6, !5219, !DIExpression(), !5220)
  store i32 %2, ptr %7, align 4
    #dbg_declare(ptr %7, !5221, !DIExpression(), !5222)
  store i32 %3, ptr %8, align 4
    #dbg_declare(ptr %8, !5223, !DIExpression(), !5224)
    #dbg_declare(ptr %9, !5225, !DIExpression(), !5226)
    #dbg_declare(ptr %10, !5227, !DIExpression(), !5228)
  %11 = load i32, ptr %5, align 4, !dbg !5229
  %12 = sext i32 %11 to i64, !dbg !5230
  %13 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %12, !dbg !5230
  call void @_Z22compute_segment_centerP10vms_vectorP7segment(ptr noundef %9, ptr noundef %13), !dbg !5231
  %14 = load i32, ptr %6, align 4, !dbg !5232
  %15 = sext i32 %14 to i64, !dbg !5233
  %16 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %15, !dbg !5233
  call void @_Z22compute_segment_centerP10vms_vectorP7segment(ptr noundef %10, ptr noundef %16), !dbg !5234
  %17 = load i32, ptr %5, align 4, !dbg !5235
  %18 = load i32, ptr %6, align 4, !dbg !5236
  %19 = load i32, ptr %7, align 4, !dbg !5237
  %20 = load i32, ptr %8, align 4, !dbg !5238
  %21 = call noundef i32 @_Z23find_connected_distanceP10vms_vectoriS0_iii(ptr noundef %9, i32 noundef %17, ptr noundef %10, i32 noundef %18, i32 noundef %19, i32 noundef %20), !dbg !5239
  ret i32 %21, !dbg !5240
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z16ambient_mark_bfsiPai(i32 noundef %0, ptr noundef %1, i32 noundef %2) #0 !dbg !5241 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
    #dbg_declare(ptr %4, !5244, !DIExpression(), !5245)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !5246, !DIExpression(), !5247)
  store i32 %2, ptr %6, align 4
    #dbg_declare(ptr %6, !5248, !DIExpression(), !5249)
    #dbg_declare(ptr %7, !5250, !DIExpression(), !5251)
  %9 = load i32, ptr %6, align 4, !dbg !5252
  %10 = icmp slt i32 %9, 0, !dbg !5254
  br i1 %10, label %11, label %12, !dbg !5254

11:                                               ; preds = %3
  br label %100, !dbg !5255

12:                                               ; preds = %3
  %13 = load ptr, ptr %5, align 8, !dbg !5256
  %14 = load i32, ptr %4, align 4, !dbg !5257
  %15 = sext i32 %14 to i64, !dbg !5256
  %16 = getelementptr inbounds i8, ptr %13, i64 %15, !dbg !5256
  store i8 1, ptr %16, align 1, !dbg !5258
  store i32 0, ptr %7, align 4, !dbg !5259
  br label %17, !dbg !5261

17:                                               ; preds = %96, %12
  %18 = load i32, ptr %7, align 4, !dbg !5262
  %19 = icmp slt i32 %18, 6, !dbg !5264
  br i1 %19, label %20, label %99, !dbg !5265

20:                                               ; preds = %17
    #dbg_declare(ptr %8, !5266, !DIExpression(), !5268)
  %21 = load i32, ptr %4, align 4, !dbg !5269
  %22 = sext i32 %21 to i64, !dbg !5270
  %23 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %22, !dbg !5270
  %24 = getelementptr inbounds nuw %struct.segment, ptr %23, i32 0, i32 1, !dbg !5271
  %25 = load i32, ptr %7, align 4, !dbg !5272
  %26 = sext i32 %25 to i64, !dbg !5270
  %27 = getelementptr inbounds [6 x i16], ptr %24, i64 0, i64 %26, !dbg !5270
  %28 = load i16, ptr %27, align 2, !dbg !5270
  %29 = sext i16 %28 to i32, !dbg !5270
  store i32 %29, ptr %8, align 4, !dbg !5268
  %30 = load i32, ptr %8, align 4, !dbg !5273
  %31 = icmp sgt i32 %30, -1, !dbg !5273
  br i1 %31, label %32, label %95, !dbg !5275

32:                                               ; preds = %20
  %33 = load i32, ptr %4, align 4, !dbg !5276
  %34 = sext i32 %33 to i64, !dbg !5276
  %35 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %34, !dbg !5276
  %36 = getelementptr inbounds nuw %struct.segment, ptr %35, i32 0, i32 1, !dbg !5276
  %37 = load i32, ptr %7, align 4, !dbg !5276
  %38 = sext i32 %37 to i64, !dbg !5276
  %39 = getelementptr inbounds [6 x i16], ptr %36, i64 0, i64 %38, !dbg !5276
  %40 = load i16, ptr %39, align 2, !dbg !5276
  %41 = sext i16 %40 to i32, !dbg !5276
  %42 = icmp eq i32 %41, -1, !dbg !5276
  br i1 %42, label %43, label %44, !dbg !5276

43:                                               ; preds = %32
  br label %79, !dbg !5276

44:                                               ; preds = %32
  %45 = load i32, ptr %4, align 4, !dbg !5276
  %46 = sext i32 %45 to i64, !dbg !5276
  %47 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %46, !dbg !5276
  %48 = getelementptr inbounds nuw %struct.segment, ptr %47, i32 0, i32 1, !dbg !5276
  %49 = load i32, ptr %7, align 4, !dbg !5276
  %50 = sext i32 %49 to i64, !dbg !5276
  %51 = getelementptr inbounds [6 x i16], ptr %48, i64 0, i64 %50, !dbg !5276
  %52 = load i16, ptr %51, align 2, !dbg !5276
  %53 = sext i16 %52 to i32, !dbg !5276
  %54 = icmp eq i32 %53, -2, !dbg !5276
  br i1 %54, label %55, label %56, !dbg !5276

55:                                               ; preds = %44
  br label %77, !dbg !5276

56:                                               ; preds = %44
  %57 = load i32, ptr %4, align 4, !dbg !5276
  %58 = sext i32 %57 to i64, !dbg !5276
  %59 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %58, !dbg !5276
  %60 = getelementptr inbounds nuw %struct.segment, ptr %59, i32 0, i32 0, !dbg !5276
  %61 = load i32, ptr %7, align 4, !dbg !5276
  %62 = sext i32 %61 to i64, !dbg !5276
  %63 = getelementptr inbounds [6 x %struct.side], ptr %60, i64 0, i64 %62, !dbg !5276
  %64 = getelementptr inbounds nuw %struct.side, ptr %63, i32 0, i32 2, !dbg !5276
  %65 = load i16, ptr %64, align 2, !dbg !5276
  %66 = sext i16 %65 to i32, !dbg !5276
  %67 = icmp eq i32 %66, -1, !dbg !5276
  br i1 %67, label %68, label %69, !dbg !5276

68:                                               ; preds = %56
  br label %75, !dbg !5276

69:                                               ; preds = %56
  %70 = load i32, ptr %4, align 4, !dbg !5276
  %71 = sext i32 %70 to i64, !dbg !5276
  %72 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %71, !dbg !5276
  %73 = load i32, ptr %7, align 4, !dbg !5276
  %74 = call noundef i32 @_Z15wall_is_doorwayP7segmenti(ptr noundef %72, i32 noundef %73), !dbg !5276
  br label %75, !dbg !5276

75:                                               ; preds = %69, %68
  %76 = phi i32 [ 5, %68 ], [ %74, %69 ], !dbg !5276
  br label %77, !dbg !5276

77:                                               ; preds = %75, %55
  %78 = phi i32 [ 8, %55 ], [ %76, %75 ], !dbg !5276
  br label %79, !dbg !5276

79:                                               ; preds = %77, %43
  %80 = phi i32 [ 2, %43 ], [ %78, %77 ], !dbg !5276
  %81 = and i32 %80, 4, !dbg !5277
  %82 = icmp ne i32 %81, 0, !dbg !5278
  br i1 %82, label %83, label %95, !dbg !5279

83:                                               ; preds = %79
  %84 = load ptr, ptr %5, align 8, !dbg !5280
  %85 = load i32, ptr %8, align 4, !dbg !5281
  %86 = sext i32 %85 to i64, !dbg !5280
  %87 = getelementptr inbounds i8, ptr %84, i64 %86, !dbg !5280
  %88 = load i8, ptr %87, align 1, !dbg !5280
  %89 = icmp ne i8 %88, 0, !dbg !5280
  br i1 %89, label %95, label %90, !dbg !5279

90:                                               ; preds = %83
  %91 = load i32, ptr %8, align 4, !dbg !5282
  %92 = load ptr, ptr %5, align 8, !dbg !5283
  %93 = load i32, ptr %6, align 4, !dbg !5284
  %94 = sub nsw i32 %93, 1, !dbg !5285
  call void @_Z16ambient_mark_bfsiPai(i32 noundef %91, ptr noundef %92, i32 noundef %94), !dbg !5286
  br label %95, !dbg !5286

95:                                               ; preds = %90, %83, %79, %20
  br label %96, !dbg !5287

96:                                               ; preds = %95
  %97 = load i32, ptr %7, align 4, !dbg !5288
  %98 = add nsw i32 %97, 1, !dbg !5288
  store i32 %98, ptr %7, align 4, !dbg !5288
  br label %17, !dbg !5289, !llvm.loop !5290

99:                                               ; preds = %17
  br label %100, !dbg !5292

100:                                              ; preds = %99, %11
  ret void, !dbg !5292
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z30set_ambient_sound_flags_commonii(i32 noundef %0, i32 noundef %1) #0 !dbg !5293 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca [900 x i8], align 1
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !5296, !DIExpression(), !5297)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !5298, !DIExpression(), !5299)
    #dbg_declare(ptr %5, !5300, !DIExpression(), !5301)
    #dbg_declare(ptr %6, !5302, !DIExpression(), !5303)
    #dbg_declare(ptr %7, !5304, !DIExpression(), !5305)
  store i32 0, ptr %5, align 4, !dbg !5306
  br label %12, !dbg !5308

12:                                               ; preds = %30, %2
  %13 = load i32, ptr %5, align 4, !dbg !5309
  %14 = load i32, ptr @Highest_segment_index, align 4, !dbg !5311
  %15 = icmp sle i32 %13, %14, !dbg !5312
  br i1 %15, label %16, label %33, !dbg !5313

16:                                               ; preds = %12
  %17 = load i32, ptr %5, align 4, !dbg !5314
  %18 = sext i32 %17 to i64, !dbg !5316
  %19 = getelementptr inbounds [900 x i8], ptr %7, i64 0, i64 %18, !dbg !5316
  store i8 0, ptr %19, align 1, !dbg !5317
  %20 = load i32, ptr %4, align 4, !dbg !5318
  %21 = xor i32 %20, -1, !dbg !5319
  %22 = load i32, ptr %5, align 4, !dbg !5320
  %23 = sext i32 %22 to i64, !dbg !5321
  %24 = getelementptr inbounds [0 x %struct.segment2], ptr @Segment2s, i64 0, i64 %23, !dbg !5321
  %25 = getelementptr inbounds nuw %struct.segment2, ptr %24, i32 0, i32 3, !dbg !5322
  %26 = load i8, ptr %25, align 1, !dbg !5323
  %27 = zext i8 %26 to i32, !dbg !5323
  %28 = and i32 %27, %21, !dbg !5323
  %29 = trunc i32 %28 to i8, !dbg !5323
  store i8 %29, ptr %25, align 1, !dbg !5323
  br label %30, !dbg !5324

30:                                               ; preds = %16
  %31 = load i32, ptr %5, align 4, !dbg !5325
  %32 = add nsw i32 %31, 1, !dbg !5325
  store i32 %32, ptr %5, align 4, !dbg !5325
  br label %12, !dbg !5326, !llvm.loop !5327

33:                                               ; preds = %12
  store i32 0, ptr %5, align 4, !dbg !5329
  br label %34, !dbg !5331

34:                                               ; preds = %111, %33
  %35 = load i32, ptr %5, align 4, !dbg !5332
  %36 = load i32, ptr @Highest_segment_index, align 4, !dbg !5334
  %37 = icmp sle i32 %35, %36, !dbg !5335
  br i1 %37, label %38, label %114, !dbg !5336

38:                                               ; preds = %34
    #dbg_declare(ptr %8, !5337, !DIExpression(), !5339)
  %39 = load i32, ptr %5, align 4, !dbg !5340
  %40 = sext i32 %39 to i64, !dbg !5341
  %41 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %40, !dbg !5341
  store ptr %41, ptr %8, align 8, !dbg !5339
    #dbg_declare(ptr %9, !5342, !DIExpression(), !5343)
  %42 = load i32, ptr %5, align 4, !dbg !5344
  %43 = sext i32 %42 to i64, !dbg !5345
  %44 = getelementptr inbounds [0 x %struct.segment2], ptr @Segment2s, i64 0, i64 %43, !dbg !5345
  store ptr %44, ptr %9, align 8, !dbg !5343
  store i32 0, ptr %6, align 4, !dbg !5346
  br label %45, !dbg !5348

45:                                               ; preds = %107, %38
  %46 = load i32, ptr %6, align 4, !dbg !5349
  %47 = icmp slt i32 %46, 6, !dbg !5351
  br i1 %47, label %48, label %110, !dbg !5352

48:                                               ; preds = %45
    #dbg_declare(ptr %10, !5353, !DIExpression(), !5355)
  %49 = load ptr, ptr %8, align 8, !dbg !5356
  %50 = getelementptr inbounds nuw %struct.segment, ptr %49, i32 0, i32 0, !dbg !5357
  %51 = load i32, ptr %6, align 4, !dbg !5358
  %52 = sext i32 %51 to i64, !dbg !5356
  %53 = getelementptr inbounds [6 x %struct.side], ptr %50, i64 0, i64 %52, !dbg !5356
  store ptr %53, ptr %10, align 8, !dbg !5355
  %54 = load ptr, ptr %10, align 8, !dbg !5359
  %55 = getelementptr inbounds nuw %struct.side, ptr %54, i32 0, i32 3, !dbg !5361
  %56 = load i16, ptr %55, align 4, !dbg !5361
  %57 = sext i16 %56 to i64, !dbg !5362
  %58 = getelementptr inbounds [1200 x %struct.tmap_info], ptr @TmapInfo, i64 0, i64 %57, !dbg !5362
  %59 = getelementptr inbounds nuw %struct.tmap_info, ptr %58, i32 0, i32 0, !dbg !5363
  %60 = load i8, ptr %59, align 4, !dbg !5363
  %61 = zext i8 %60 to i32, !dbg !5362
  %62 = load i32, ptr %3, align 4, !dbg !5364
  %63 = and i32 %61, %62, !dbg !5365
  %64 = icmp ne i32 %63, 0, !dbg !5366
  br i1 %64, label %79, label %65, !dbg !5367

65:                                               ; preds = %48
  %66 = load ptr, ptr %10, align 8, !dbg !5368
  %67 = getelementptr inbounds nuw %struct.side, ptr %66, i32 0, i32 4, !dbg !5369
  %68 = load i16, ptr %67, align 2, !dbg !5369
  %69 = sext i16 %68 to i32, !dbg !5368
  %70 = and i32 %69, 16383, !dbg !5370
  %71 = sext i32 %70 to i64, !dbg !5371
  %72 = getelementptr inbounds [1200 x %struct.tmap_info], ptr @TmapInfo, i64 0, i64 %71, !dbg !5371
  %73 = getelementptr inbounds nuw %struct.tmap_info, ptr %72, i32 0, i32 0, !dbg !5372
  %74 = load i8, ptr %73, align 4, !dbg !5372
  %75 = zext i8 %74 to i32, !dbg !5371
  %76 = load i32, ptr %3, align 4, !dbg !5373
  %77 = and i32 %75, %76, !dbg !5374
  %78 = icmp ne i32 %77, 0, !dbg !5375
  br i1 %78, label %79, label %106, !dbg !5367

79:                                               ; preds = %65, %48
  %80 = load ptr, ptr %8, align 8, !dbg !5376
  %81 = getelementptr inbounds nuw %struct.segment, ptr %80, i32 0, i32 1, !dbg !5376
  %82 = load i32, ptr %6, align 4, !dbg !5376
  %83 = sext i32 %82 to i64, !dbg !5376
  %84 = getelementptr inbounds [6 x i16], ptr %81, i64 0, i64 %83, !dbg !5376
  %85 = load i16, ptr %84, align 2, !dbg !5376
  %86 = sext i16 %85 to i32, !dbg !5376
  %87 = icmp sgt i32 %86, -1, !dbg !5376
  br i1 %87, label %88, label %94, !dbg !5379

88:                                               ; preds = %79
  %89 = load ptr, ptr %10, align 8, !dbg !5380
  %90 = getelementptr inbounds nuw %struct.side, ptr %89, i32 0, i32 2, !dbg !5381
  %91 = load i16, ptr %90, align 2, !dbg !5381
  %92 = sext i16 %91 to i32, !dbg !5380
  %93 = icmp ne i32 %92, -1, !dbg !5382
  br i1 %93, label %94, label %105, !dbg !5379

94:                                               ; preds = %88, %79
  %95 = load i32, ptr %4, align 4, !dbg !5383
  %96 = load ptr, ptr %9, align 8, !dbg !5385
  %97 = getelementptr inbounds nuw %struct.segment2, ptr %96, i32 0, i32 3, !dbg !5386
  %98 = load i8, ptr %97, align 1, !dbg !5387
  %99 = zext i8 %98 to i32, !dbg !5387
  %100 = or i32 %99, %95, !dbg !5387
  %101 = trunc i32 %100 to i8, !dbg !5387
  store i8 %101, ptr %97, align 1, !dbg !5387
  %102 = load i32, ptr %5, align 4, !dbg !5388
  %103 = sext i32 %102 to i64, !dbg !5389
  %104 = getelementptr inbounds [900 x i8], ptr %7, i64 0, i64 %103, !dbg !5389
  store i8 1, ptr %104, align 1, !dbg !5390
  br label %105, !dbg !5391

105:                                              ; preds = %94, %88
  br label %106, !dbg !5392

106:                                              ; preds = %105, %65
  br label %107, !dbg !5393

107:                                              ; preds = %106
  %108 = load i32, ptr %6, align 4, !dbg !5394
  %109 = add nsw i32 %108, 1, !dbg !5394
  store i32 %109, ptr %6, align 4, !dbg !5394
  br label %45, !dbg !5395, !llvm.loop !5396

110:                                              ; preds = %45
  br label %111, !dbg !5398

111:                                              ; preds = %110
  %112 = load i32, ptr %5, align 4, !dbg !5399
  %113 = add nsw i32 %112, 1, !dbg !5399
  store i32 %113, ptr %5, align 4, !dbg !5399
  br label %34, !dbg !5400, !llvm.loop !5401

114:                                              ; preds = %34
  store i32 0, ptr %5, align 4, !dbg !5403
  br label %115, !dbg !5405

115:                                              ; preds = %134, %114
  %116 = load i32, ptr %5, align 4, !dbg !5406
  %117 = load i32, ptr @Highest_segment_index, align 4, !dbg !5408
  %118 = icmp sle i32 %116, %117, !dbg !5409
  br i1 %118, label %119, label %137, !dbg !5410

119:                                              ; preds = %115
    #dbg_declare(ptr %11, !5411, !DIExpression(), !5413)
  %120 = load i32, ptr %5, align 4, !dbg !5414
  %121 = sext i32 %120 to i64, !dbg !5415
  %122 = getelementptr inbounds [0 x %struct.segment2], ptr @Segment2s, i64 0, i64 %121, !dbg !5415
  store ptr %122, ptr %11, align 8, !dbg !5413
  %123 = load ptr, ptr %11, align 8, !dbg !5416
  %124 = getelementptr inbounds nuw %struct.segment2, ptr %123, i32 0, i32 3, !dbg !5418
  %125 = load i8, ptr %124, align 1, !dbg !5418
  %126 = zext i8 %125 to i32, !dbg !5416
  %127 = load i32, ptr %4, align 4, !dbg !5419
  %128 = and i32 %126, %127, !dbg !5420
  %129 = icmp ne i32 %128, 0, !dbg !5416
  br i1 %129, label %130, label %133, !dbg !5416

130:                                              ; preds = %119
  %131 = load i32, ptr %5, align 4, !dbg !5421
  %132 = getelementptr inbounds [900 x i8], ptr %7, i64 0, i64 0, !dbg !5422
  call void @_Z16ambient_mark_bfsiPai(i32 noundef %131, ptr noundef %132, i32 noundef 5), !dbg !5423
  br label %133, !dbg !5423

133:                                              ; preds = %130, %119
  br label %134, !dbg !5424

134:                                              ; preds = %133
  %135 = load i32, ptr %5, align 4, !dbg !5425
  %136 = add nsw i32 %135, 1, !dbg !5425
  store i32 %136, ptr %5, align 4, !dbg !5425
  br label %115, !dbg !5426, !llvm.loop !5427

137:                                              ; preds = %115
  store i32 0, ptr %5, align 4, !dbg !5429
  br label %138, !dbg !5431

138:                                              ; preds = %159, %137
  %139 = load i32, ptr %5, align 4, !dbg !5432
  %140 = load i32, ptr @Highest_segment_index, align 4, !dbg !5434
  %141 = icmp sle i32 %139, %140, !dbg !5435
  br i1 %141, label %142, label %162, !dbg !5436

142:                                              ; preds = %138
  %143 = load i32, ptr %5, align 4, !dbg !5437
  %144 = sext i32 %143 to i64, !dbg !5439
  %145 = getelementptr inbounds [900 x i8], ptr %7, i64 0, i64 %144, !dbg !5439
  %146 = load i8, ptr %145, align 1, !dbg !5439
  %147 = icmp ne i8 %146, 0, !dbg !5439
  br i1 %147, label %148, label %158, !dbg !5439

148:                                              ; preds = %142
  %149 = load i32, ptr %4, align 4, !dbg !5440
  %150 = load i32, ptr %5, align 4, !dbg !5441
  %151 = sext i32 %150 to i64, !dbg !5442
  %152 = getelementptr inbounds [0 x %struct.segment2], ptr @Segment2s, i64 0, i64 %151, !dbg !5442
  %153 = getelementptr inbounds nuw %struct.segment2, ptr %152, i32 0, i32 3, !dbg !5443
  %154 = load i8, ptr %153, align 1, !dbg !5444
  %155 = zext i8 %154 to i32, !dbg !5444
  %156 = or i32 %155, %149, !dbg !5444
  %157 = trunc i32 %156 to i8, !dbg !5444
  store i8 %157, ptr %153, align 1, !dbg !5444
  br label %158, !dbg !5442

158:                                              ; preds = %148, %142
  br label %159, !dbg !5445

159:                                              ; preds = %158
  %160 = load i32, ptr %5, align 4, !dbg !5446
  %161 = add nsw i32 %160, 1, !dbg !5446
  store i32 %161, ptr %5, align 4, !dbg !5446
  br label %138, !dbg !5447, !llvm.loop !5448

162:                                              ; preds = %138
  ret void, !dbg !5450
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z23set_ambient_sound_flagsv() #0 !dbg !5451 {
  call void @_Z30set_ambient_sound_flags_commonii(i32 noundef 1, i32 noundef 2), !dbg !5452
  call void @_Z30set_ambient_sound_flags_commonii(i32 noundef 2, i32 noundef 1), !dbg !5453
  ret void, !dbg !5454
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 4 dereferenceable(4) ptr @_ZNSt3__13minB8ne200100IiNS_6__lessIvvEEEERKT_S5_S5_T0_(ptr noundef nonnull align 4 dereferenceable(4) %0, ptr noundef nonnull align 4 dereferenceable(4) %1) #0 !dbg !5455 {
  %3 = alloca %"struct.std::__1::__less", align 1
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !5465, !DIExpression(), !5466)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !5467, !DIExpression(), !5468)
    #dbg_declare(ptr %3, !5469, !DIExpression(), !5470)
  %6 = load ptr, ptr %5, align 8, !dbg !5471
  %7 = load ptr, ptr %4, align 8, !dbg !5472
  %8 = call noundef zeroext i1 @_ZNKSt3__16__lessIvvEclB8ne200100IiiEEbRKT_RKT0_(ptr noundef nonnull align 1 dereferenceable(1) %3, ptr noundef nonnull align 4 dereferenceable(4) %6, ptr noundef nonnull align 4 dereferenceable(4) %7), !dbg !5473
  br i1 %8, label %9, label %11, !dbg !5473

9:                                                ; preds = %2
  %10 = load ptr, ptr %5, align 8, !dbg !5474
  br label %13, !dbg !5473

11:                                               ; preds = %2
  %12 = load ptr, ptr %4, align 8, !dbg !5475
  br label %13, !dbg !5473

13:                                               ; preds = %11, %9
  %14 = phi ptr [ %10, %9 ], [ %12, %11 ], !dbg !5473
  ret ptr %14, !dbg !5476
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef zeroext i1 @_ZNKSt3__16__lessIvvEclB8ne200100IiiEEbRKT_RKT0_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef nonnull align 4 dereferenceable(4) %1, ptr noundef nonnull align 4 dereferenceable(4) %2) #2 !dbg !5477 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !5485, !DIExpression(), !5487)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !5488, !DIExpression(), !5489)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !5490, !DIExpression(), !5491)
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8, !dbg !5492
  %9 = load i32, ptr %8, align 4, !dbg !5492
  %10 = load ptr, ptr %6, align 8, !dbg !5493
  %11 = load i32, ptr %10, align 4, !dbg !5493
  %12 = icmp slt i32 %9, %11, !dbg !5494
  ret i1 %12, !dbg !5495
}

attributes #0 = { mustprogress noinline ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #2 = { mustprogress noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #3 = { nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #7 = { nounwind }

!llvm.module.flags = !{!1436, !1437, !1438, !1439, !1440, !1441, !1442}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!1443}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "Dl_indices", scope: !2, file: !16, line: 45, type: !1426, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !3, producer: "Homebrew clang version 20.1.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !13, imports: !181, splitDebugInlining: false, nameTableKind: Apple, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk", sdk: "MacOSX15.sdk")
!3 = !DIFile(filename: "/Users/richard/code/ChocolateDescent/main_d2/gameseg.cpp", directory: "/Users/richard/code/ChocolateDescent/build-c-ref", checksumkind: CSK_MD5, checksum: "a6107ec51c8f4704dac8c0e8eac36c32")
!4 = !{!5, !10}
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "fix", file: !6, line: 20, baseType: !7)
!6 = !DIFile(filename: "./fix/fix.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "c5006a11bf8b4cb7d963898499eda13a")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !8, line: 30, baseType: !9)
!8 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int32_t.h", directory: "", checksumkind: CSK_MD5, checksum: "d23e8406e80ee79983f28509c741fa17")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !11, line: 30, baseType: !12)
!11 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int64_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e6d85c1a9e23dbf7518ce3b162aac800")
!12 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!13 = !{!0, !14, !38, !40, !47, !52, !57, !62, !64, !69, !71, !76, !81, !86, !91, !96, !101, !103, !105, !110, !112, !114, !119, !124, !129, !131, !133, !145, !147, !149, !154, !156, !161, !166, !171, !173, !178}
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "Delta_lights", scope: !2, file: !16, line: 46, type: !17, isLocal: false, isDefinition: true)
!16 = !DIFile(filename: "main_d2/gameseg.cpp", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "a6107ec51c8f4704dac8c0e8eac36c32")
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 640000, elements: !36)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "delta_light", file: !19, line: 194, baseType: !20)
!19 = !DIFile(filename: "main_d2/segment.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "c950815a9b07e6bab2fa2587b90affec")
!20 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !19, line: 188, size: 64, flags: DIFlagTypePassByValue, elements: !21, identifier: "_ZTS11delta_light")
!21 = !{!22, !24, !28, !29}
!22 = !DIDerivedType(tag: DW_TAG_member, name: "segnum", scope: !20, file: !19, line: 190, baseType: !23, size: 16)
!23 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "sidenum", scope: !20, file: !19, line: 191, baseType: !25, size: 8, offset: 16)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !26, line: 30, baseType: !27)
!26 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int8_t.h", directory: "", checksumkind: CSK_MD5, checksum: "5052dfe782b50fed2355b8f61a9e4fa9")
!27 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "dummy", scope: !20, file: !19, line: 192, baseType: !25, size: 8, offset: 24)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "vert_light", scope: !20, file: !19, line: 193, baseType: !30, size: 32, offset: 32)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !31, size: 32, elements: !34)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !32, line: 31, baseType: !33)
!32 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint8_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8b64ccf8c67b8c006b07b8daf1b49be5")
!33 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!34 = !{!35}
!35 = !DISubrange(count: 4)
!36 = !{!37}
!37 = !DISubrange(count: 10000)
!38 = !DIGlobalVariableExpression(var: !39, expr: !DIExpression())
!39 = distinct !DIGlobalVariable(name: "Num_static_lights", scope: !2, file: !16, line: 47, type: !9, isLocal: false, isDefinition: true)
!40 = !DIGlobalVariableExpression(var: !41, expr: !DIExpression())
!41 = distinct !DIGlobalVariable(scope: null, file: !16, line: 158, type: !42, isLocal: true, isDefinition: true)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !43, size: 152, elements: !45)
!43 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !44)
!44 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!45 = !{!46}
!46 = !DISubrange(count: 19)
!47 = !DIGlobalVariableExpression(var: !48, expr: !DIExpression())
!48 = distinct !DIGlobalVariable(scope: null, file: !16, line: 281, type: !49, isLocal: true, isDefinition: true)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !43, size: 408, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 51)
!52 = !DIGlobalVariableExpression(var: !53, expr: !DIExpression())
!53 = distinct !DIGlobalVariable(scope: null, file: !16, line: 281, type: !54, isLocal: true, isDefinition: true)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !43, size: 456, elements: !55)
!55 = !{!56}
!56 = !DISubrange(count: 57)
!57 = !DIGlobalVariableExpression(var: !58, expr: !DIExpression())
!58 = distinct !DIGlobalVariable(scope: null, file: !16, line: 322, type: !59, isLocal: true, isDefinition: true)
!59 = !DICompositeType(tag: DW_TAG_array_type, baseType: !43, size: 504, elements: !60)
!60 = !{!61}
!61 = !DISubrange(count: 63)
!62 = !DIGlobalVariableExpression(var: !63, expr: !DIExpression())
!63 = distinct !DIGlobalVariable(scope: null, file: !16, line: 395, type: !59, isLocal: true, isDefinition: true)
!64 = !DIGlobalVariableExpression(var: !65, expr: !DIExpression())
!65 = distinct !DIGlobalVariable(scope: null, file: !16, line: 407, type: !66, isLocal: true, isDefinition: true)
!66 = !DICompositeType(tag: DW_TAG_array_type, baseType: !43, size: 256, elements: !67)
!67 = !{!68}
!68 = !DISubrange(count: 32)
!69 = !DIGlobalVariableExpression(var: !70, expr: !DIExpression())
!70 = distinct !DIGlobalVariable(scope: null, file: !16, line: 594, type: !66, isLocal: true, isDefinition: true)
!71 = !DIGlobalVariableExpression(var: !72, expr: !DIExpression())
!72 = distinct !DIGlobalVariable(scope: null, file: !16, line: 804, type: !73, isLocal: true, isDefinition: true)
!73 = !DICompositeType(tag: DW_TAG_array_type, baseType: !43, size: 848, elements: !74)
!74 = !{!75}
!75 = !DISubrange(count: 106)
!76 = !DIGlobalVariableExpression(var: !77, expr: !DIExpression())
!77 = distinct !DIGlobalVariable(scope: null, file: !16, line: 855, type: !78, isLocal: true, isDefinition: true)
!78 = !DICompositeType(tag: DW_TAG_array_type, baseType: !43, size: 528, elements: !79)
!79 = !{!80}
!80 = !DISubrange(count: 66)
!81 = !DIGlobalVariableExpression(var: !82, expr: !DIExpression())
!82 = distinct !DIGlobalVariable(scope: null, file: !16, line: 865, type: !83, isLocal: true, isDefinition: true)
!83 = !DICompositeType(tag: DW_TAG_array_type, baseType: !43, size: 544, elements: !84)
!84 = !{!85}
!85 = !DISubrange(count: 68)
!86 = !DIGlobalVariableExpression(var: !87, expr: !DIExpression())
!87 = distinct !DIGlobalVariable(scope: null, file: !16, line: 879, type: !88, isLocal: true, isDefinition: true)
!88 = !DICompositeType(tag: DW_TAG_array_type, baseType: !43, size: 704, elements: !89)
!89 = !{!90}
!90 = !DISubrange(count: 88)
!91 = !DIGlobalVariableExpression(var: !92, expr: !DIExpression())
!92 = distinct !DIGlobalVariable(scope: null, file: !16, line: 900, type: !93, isLocal: true, isDefinition: true)
!93 = !DICompositeType(tag: DW_TAG_array_type, baseType: !43, size: 816, elements: !94)
!94 = !{!95}
!95 = !DISubrange(count: 102)
!96 = !DIGlobalVariableExpression(var: !97, expr: !DIExpression())
!97 = distinct !DIGlobalVariable(scope: null, file: !16, line: 906, type: !98, isLocal: true, isDefinition: true)
!98 = !DICompositeType(tag: DW_TAG_array_type, baseType: !43, size: 320, elements: !99)
!99 = !{!100}
!100 = !DISubrange(count: 40)
!101 = !DIGlobalVariableExpression(var: !102, expr: !DIExpression())
!102 = distinct !DIGlobalVariable(name: "Doing_lighting_hack_flag", scope: !2, file: !16, line: 950, type: !9, isLocal: false, isDefinition: true)
!103 = !DIGlobalVariableExpression(var: !104, expr: !DIExpression())
!104 = distinct !DIGlobalVariable(scope: null, file: !16, line: 960, type: !54, isLocal: true, isDefinition: true)
!105 = !DIGlobalVariableExpression(var: !106, expr: !DIExpression())
!106 = distinct !DIGlobalVariable(scope: null, file: !16, line: 977, type: !107, isLocal: true, isDefinition: true)
!107 = !DICompositeType(tag: DW_TAG_array_type, baseType: !43, size: 264, elements: !108)
!108 = !{!109}
!109 = !DISubrange(count: 33)
!110 = !DIGlobalVariableExpression(var: !111, expr: !DIExpression())
!111 = distinct !DIGlobalVariable(name: "Exhaustive_count", scope: !2, file: !16, line: 1030, type: !9, isLocal: false, isDefinition: true)
!112 = !DIGlobalVariableExpression(var: !113, expr: !DIExpression())
!113 = distinct !DIGlobalVariable(name: "Exhaustive_failed_count", scope: !2, file: !16, line: 1030, type: !9, isLocal: false, isDefinition: true)
!114 = !DIGlobalVariableExpression(var: !115, expr: !DIExpression())
!115 = distinct !DIGlobalVariable(scope: null, file: !16, line: 1096, type: !116, isLocal: true, isDefinition: true)
!116 = !DICompositeType(tag: DW_TAG_array_type, baseType: !43, size: 416, elements: !117)
!117 = !{!118}
!118 = !DISubrange(count: 52)
!119 = !DIGlobalVariableExpression(var: !120, expr: !DIExpression())
!120 = distinct !DIGlobalVariable(scope: null, file: !16, line: 1112, type: !121, isLocal: true, isDefinition: true)
!121 = !DICompositeType(tag: DW_TAG_array_type, baseType: !43, size: 536, elements: !122)
!122 = !{!123}
!123 = !DISubrange(count: 67)
!124 = !DIGlobalVariableExpression(var: !125, expr: !DIExpression())
!125 = distinct !DIGlobalVariable(scope: null, file: !16, line: 1118, type: !126, isLocal: true, isDefinition: true)
!126 = !DICompositeType(tag: DW_TAG_array_type, baseType: !43, size: 400, elements: !127)
!127 = !{!128}
!128 = !DISubrange(count: 50)
!129 = !DIGlobalVariableExpression(var: !130, expr: !DIExpression())
!130 = distinct !DIGlobalVariable(name: "Connected_segment_distance", scope: !2, file: !16, line: 1198, type: !9, isLocal: false, isDefinition: true)
!131 = !DIGlobalVariableExpression(var: !132, expr: !DIExpression())
!132 = distinct !DIGlobalVariable(name: "Fcd_index", scope: !2, file: !16, line: 1208, type: !9, isLocal: false, isDefinition: true)
!133 = !DIGlobalVariableExpression(var: !134, expr: !DIExpression())
!134 = distinct !DIGlobalVariable(name: "Fcd_cache", scope: !2, file: !16, line: 1209, type: !135, isLocal: false, isDefinition: true)
!135 = !DICompositeType(tag: DW_TAG_array_type, baseType: !136, size: 1024, elements: !143)
!136 = !DIDerivedType(tag: DW_TAG_typedef, name: "fcd_data", file: !16, line: 1206, baseType: !137)
!137 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !16, line: 1203, size: 128, flags: DIFlagTypePassByValue, elements: !138, identifier: "_ZTS8fcd_data")
!138 = !{!139, !140, !141, !142}
!139 = !DIDerivedType(tag: DW_TAG_member, name: "seg0", scope: !137, file: !16, line: 1204, baseType: !9, size: 32)
!140 = !DIDerivedType(tag: DW_TAG_member, name: "seg1", scope: !137, file: !16, line: 1204, baseType: !9, size: 32, offset: 32)
!141 = !DIDerivedType(tag: DW_TAG_member, name: "csd", scope: !137, file: !16, line: 1204, baseType: !9, size: 32, offset: 64)
!142 = !DIDerivedType(tag: DW_TAG_member, name: "dist", scope: !137, file: !16, line: 1205, baseType: !5, size: 32, offset: 96)
!143 = !{!144}
!144 = !DISubrange(count: 8)
!145 = !DIGlobalVariableExpression(var: !146, expr: !DIExpression())
!146 = distinct !DIGlobalVariable(name: "Last_fcd_flush_time", scope: !2, file: !16, line: 1210, type: !5, isLocal: false, isDefinition: true)
!147 = !DIGlobalVariableExpression(var: !148, expr: !DIExpression())
!148 = distinct !DIGlobalVariable(scope: null, file: !16, line: 1344, type: !83, isLocal: true, isDefinition: true)
!149 = !DIGlobalVariableExpression(var: !150, expr: !DIExpression())
!150 = distinct !DIGlobalVariable(scope: null, file: !16, line: 1448, type: !151, isLocal: true, isDefinition: true)
!151 = !DICompositeType(tag: DW_TAG_array_type, baseType: !43, size: 88, elements: !152)
!152 = !{!153}
!153 = !DISubrange(count: 11)
!154 = !DIGlobalVariableExpression(var: !155, expr: !DIExpression())
!155 = distinct !DIGlobalVariable(scope: null, file: !16, line: 1620, type: !49, isLocal: true, isDefinition: true)
!156 = !DIGlobalVariableExpression(var: !157, expr: !DIExpression())
!157 = distinct !DIGlobalVariable(scope: null, file: !16, line: 1806, type: !158, isLocal: true, isDefinition: true)
!158 = !DICompositeType(tag: DW_TAG_array_type, baseType: !43, size: 384, elements: !159)
!159 = !{!160}
!160 = !DISubrange(count: 48)
!161 = !DIGlobalVariableExpression(var: !162, expr: !DIExpression())
!162 = distinct !DIGlobalVariable(scope: null, file: !16, line: 1981, type: !163, isLocal: true, isDefinition: true)
!163 = !DICompositeType(tag: DW_TAG_array_type, baseType: !43, size: 120, elements: !164)
!164 = !{!165}
!165 = !DISubrange(count: 15)
!166 = !DIGlobalVariableExpression(var: !167, expr: !DIExpression())
!167 = distinct !DIGlobalVariable(name: "changed_segs", scope: !2, file: !16, line: 2404, type: !168, isLocal: false, isDefinition: true)
!168 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 480, elements: !169)
!169 = !{!170}
!170 = !DISubrange(count: 30)
!171 = !DIGlobalVariableExpression(var: !172, expr: !DIExpression())
!172 = distinct !DIGlobalVariable(name: "n_changed_segs", scope: !2, file: !16, line: 2405, type: !9, isLocal: false, isDefinition: true)
!173 = !DIGlobalVariableExpression(var: !174, expr: !DIExpression())
!174 = distinct !DIGlobalVariable(name: "Light_subtracted", scope: !2, file: !16, line: 2566, type: !175, isLocal: false, isDefinition: true)
!175 = !DICompositeType(tag: DW_TAG_array_type, baseType: !31, size: 7200, elements: !176)
!176 = !{!177}
!177 = !DISubrange(count: 900)
!178 = !DIGlobalVariableExpression(var: !179, expr: !DIExpression(DW_OP_constu, 16, DW_OP_stack_value))
!179 = distinct !DIGlobalVariable(name: "FRACBITS", scope: !2, file: !6, line: 18, type: !180, isLocal: true, isDefinition: true)
!180 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !9)
!181 = !{!182, !186, !189, !190, !191, !192, !196, !200, !204, !207, !209, !211, !213, !215, !217, !219, !221, !223, !225, !227, !229, !231, !233, !235, !237, !243, !247, !250, !253, !258, !264, !266, !268, !270, !272, !274, !276, !278, !280, !282, !284, !286, !288, !290, !295, !300, !305, !310, !312, !315, !317, !319, !321, !323, !325, !327, !329, !331, !333, !337, !342, !346, !348, !352, !356, !369, !385, !386, !441, !450, !452, !460, !466, !470, !474, !476, !480, !484, !488, !492, !496, !500, !502, !504, !508, !514, !519, !523, !527, !531, !535, !539, !543, !547, !549, !551, !555, !557, !561, !565, !570, !572, !574, !576, !580, !584, !588, !590, !594, !596, !598, !600, !602, !608, !612, !614, !620, !625, !629, !633, !638, !643, !647, !651, !655, !659, !661, !663, !671, !673, !677, !681, !683, !685, !689, !693, !697, !699, !703, !708, !712, !716, !718, !720, !722, !724, !726, !728, !732, !736, !744, !746, !748, !750, !756, !758, !759, !760, !761, !764, !766, !771, !775, !777, !779, !783, !785, !787, !789, !791, !793, !795, !797, !802, !806, !808, !810, !811, !816, !818, !820, !822, !824, !826, !828, !830, !832, !834, !836, !838, !840, !842, !844, !846, !848, !852, !854, !856, !858, !862, !864, !868, !870, !872, !874, !876, !880, !882, !886, !890, !892, !894, !898, !900, !904, !906, !908, !912, !914, !916, !918, !920, !922, !924, !928, !930, !932, !934, !936, !938, !940, !942, !946, !950, !952, !954, !956, !958, !960, !962, !964, !966, !968, !970, !972, !974, !976, !978, !980, !982, !984, !986, !988, !992, !994, !996, !998, !1002, !1004, !1008, !1010, !1012, !1014, !1016, !1020, !1022, !1026, !1028, !1030, !1032, !1034, !1038, !1040, !1042, !1046, !1048, !1050, !1052, !1057, !1062, !1066, !1067, !1071, !1075, !1080, !1085, !1089, !1095, !1099, !1101, !1105, !1113, !1119, !1125, !1127, !1131, !1135, !1139, !1144, !1148, !1152, !1156, !1160, !1164, !1168, !1172, !1176, !1181, !1185, !1189, !1193, !1198, !1203, !1207, !1209, !1213, !1215, !1222, !1226, !1227, !1231, !1235, !1239, !1243, !1245, !1249, !1253, !1257, !1261, !1265, !1267, !1269, !1271, !1273, !1274, !1278, !1280, !1284, !1288, !1292, !1294, !1298, !1302, !1306, !1312, !1314, !1318, !1322, !1326, !1328, !1332, !1336, !1340, !1342, !1344, !1346, !1350, !1354, !1359, !1363, !1369, !1373, !1377, !1379, !1381, !1383, !1387, !1391, !1395, !1397, !1399, !1403, !1407, !1409, !1413, !1417, !1420, !1422, !1424}
!182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !25, file: !185, line: 158)
!183 = !DINamespace(name: "__1", scope: !184, exportSymbols: true)
!184 = !DINamespace(name: "std", scope: null)
!185 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdint", directory: "")
!186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !187, file: !185, line: 159)
!187 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !188, line: 30, baseType: !23)
!188 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int16_t.h", directory: "", checksumkind: CSK_MD5, checksum: "47ed3c3ac6f65bfec021ca2b7be18e7e")
!189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !7, file: !185, line: 160)
!190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !10, file: !185, line: 161)
!191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !31, file: !185, line: 163)
!192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !193, file: !185, line: 164)
!193 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !194, line: 31, baseType: !195)
!194 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint16_t.h", directory: "", checksumkind: CSK_MD5, checksum: "f0aa926da906b10566dd3171bf347ab7")
!195 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !197, file: !185, line: 165)
!197 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !198, line: 31, baseType: !199)
!198 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint32_t.h", directory: "", checksumkind: CSK_MD5, checksum: "0254eb80c6b9719ac45c3c1cf872109b")
!199 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !201, file: !185, line: 166)
!201 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !202, line: 31, baseType: !203)
!202 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint64_t.h", directory: "", checksumkind: CSK_MD5, checksum: "77fc5e91653260959605f129691cf9b1")
!203 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !205, file: !185, line: 168)
!205 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !206, line: 29, baseType: !25)
!206 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "042ceedaf4137a8aaa272d0b27434016")
!207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !208, file: !185, line: 169)
!208 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !206, line: 30, baseType: !187)
!209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !210, file: !185, line: 170)
!210 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !206, line: 31, baseType: !7)
!211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !212, file: !185, line: 171)
!212 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !206, line: 32, baseType: !10)
!213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !214, file: !185, line: 173)
!214 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !206, line: 33, baseType: !31)
!215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !216, file: !185, line: 174)
!216 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !206, line: 34, baseType: !193)
!217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !218, file: !185, line: 175)
!218 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !206, line: 35, baseType: !197)
!219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !220, file: !185, line: 176)
!220 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !206, line: 36, baseType: !201)
!221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !222, file: !185, line: 178)
!222 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !206, line: 40, baseType: !25)
!223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !224, file: !185, line: 179)
!224 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !206, line: 41, baseType: !187)
!225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !226, file: !185, line: 180)
!226 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !206, line: 42, baseType: !7)
!227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !228, file: !185, line: 181)
!228 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !206, line: 43, baseType: !10)
!229 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !230, file: !185, line: 183)
!230 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !206, line: 44, baseType: !31)
!231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !232, file: !185, line: 184)
!232 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !206, line: 45, baseType: !193)
!233 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !234, file: !185, line: 185)
!234 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !206, line: 46, baseType: !197)
!235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !236, file: !185, line: 186)
!236 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !206, line: 47, baseType: !201)
!237 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !238, file: !185, line: 188)
!238 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !239, line: 32, baseType: !240)
!239 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_intptr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e478ba47270923b1cca6659f19f02db1")
!240 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_intptr_t", file: !241, line: 40, baseType: !242)
!241 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/arm/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "b270144f57ae258d0ce80b8f87be068c")
!242 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !244, file: !185, line: 189)
!244 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !245, line: 34, baseType: !246)
!245 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_uintptr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e70ae655dd1b9d4ae0b1dcc073f5b7e4")
!246 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !248, file: !185, line: 191)
!248 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !249, line: 32, baseType: !242)
!249 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_intmax_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e37b9240f30f486478152ef3989b1545")
!250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !251, file: !185, line: 192)
!251 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !252, line: 32, baseType: !246)
!252 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uintmax_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8217a3fbb207d8e87ca5318c313e81c2")
!253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !254, file: !257, line: 22)
!254 = !DIDerivedType(tag: DW_TAG_typedef, name: "max_align_t", file: !255, line: 16, baseType: !256)
!255 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/lib/clang/20/include/__stddef_max_align_t.h", directory: "", checksumkind: CSK_MD5, checksum: "3c0a2f19d136d39aa835c737c7105def")
!256 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
!257 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__cstddef/max_align_t.h", directory: "")
!258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !259, file: !263, line: 113)
!259 = !DISubprogram(name: "isalnum", linkageName: "_Z7isalnumi", scope: !260, file: !260, line: 217, type: !261, flags: DIFlagPrototyped, spFlags: 0)
!260 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_ctype.h", directory: "", checksumkind: CSK_MD5, checksum: "b10215117a277691ffc4168ac4505796")
!261 = !DISubroutineType(types: !262)
!262 = !{!9, !9}
!263 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cctype", directory: "")
!264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !265, file: !263, line: 114)
!265 = !DISubprogram(name: "isalpha", linkageName: "_Z7isalphai", scope: !260, file: !260, line: 223, type: !261, flags: DIFlagPrototyped, spFlags: 0)
!266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !267, file: !263, line: 115)
!267 = !DISubprogram(name: "isblank", linkageName: "_Z7isblanki", scope: !260, file: !260, line: 229, type: !261, flags: DIFlagPrototyped, spFlags: 0)
!268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !269, file: !263, line: 116)
!269 = !DISubprogram(name: "iscntrl", linkageName: "_Z7iscntrli", scope: !260, file: !260, line: 235, type: !261, flags: DIFlagPrototyped, spFlags: 0)
!270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !271, file: !263, line: 117)
!271 = !DISubprogram(name: "isdigit", linkageName: "_Z7isdigiti", scope: !260, file: !260, line: 242, type: !261, flags: DIFlagPrototyped, spFlags: 0)
!272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !273, file: !263, line: 118)
!273 = !DISubprogram(name: "isgraph", linkageName: "_Z7isgraphi", scope: !260, file: !260, line: 248, type: !261, flags: DIFlagPrototyped, spFlags: 0)
!274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !275, file: !263, line: 119)
!275 = !DISubprogram(name: "islower", linkageName: "_Z7isloweri", scope: !260, file: !260, line: 254, type: !261, flags: DIFlagPrototyped, spFlags: 0)
!276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !277, file: !263, line: 120)
!277 = !DISubprogram(name: "isprint", linkageName: "_Z7isprinti", scope: !260, file: !260, line: 260, type: !261, flags: DIFlagPrototyped, spFlags: 0)
!278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !279, file: !263, line: 121)
!279 = !DISubprogram(name: "ispunct", linkageName: "_Z7ispuncti", scope: !260, file: !260, line: 266, type: !261, flags: DIFlagPrototyped, spFlags: 0)
!280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !281, file: !263, line: 122)
!281 = !DISubprogram(name: "isspace", linkageName: "_Z7isspacei", scope: !260, file: !260, line: 272, type: !261, flags: DIFlagPrototyped, spFlags: 0)
!282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !283, file: !263, line: 123)
!283 = !DISubprogram(name: "isupper", linkageName: "_Z7isupperi", scope: !260, file: !260, line: 278, type: !261, flags: DIFlagPrototyped, spFlags: 0)
!284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !285, file: !263, line: 124)
!285 = !DISubprogram(name: "isxdigit", linkageName: "_Z8isxdigiti", scope: !260, file: !260, line: 285, type: !261, flags: DIFlagPrototyped, spFlags: 0)
!286 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !287, file: !263, line: 125)
!287 = !DISubprogram(name: "tolower", linkageName: "_Z7toloweri", scope: !260, file: !260, line: 297, type: !261, flags: DIFlagPrototyped, spFlags: 0)
!288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !289, file: !263, line: 126)
!289 = !DISubprogram(name: "toupper", linkageName: "_Z7toupperi", scope: !260, file: !260, line: 303, type: !261, flags: DIFlagPrototyped, spFlags: 0)
!290 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !291, file: !294, line: 75)
!291 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !292, line: 32, baseType: !293)
!292 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_wint_t.h", directory: "", checksumkind: CSK_MD5, checksum: "6dfd3a3d5009054224653c03b2c2b6ac")
!293 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wint_t", file: !241, line: 111, baseType: !9)
!294 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cwctype", directory: "")
!295 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !296, file: !294, line: 76)
!296 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !297, line: 32, baseType: !298)
!297 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_wctrans_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e70040c8494301cc74e19df26f4c1d76")
!298 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wctrans_t", file: !299, line: 44, baseType: !9)
!299 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "c789da493a5b476a3618b20a8fcff3c3")
!300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !301, file: !294, line: 77)
!301 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !302, line: 32, baseType: !303)
!302 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_wctype_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8d1720b82a490c742e6a297f971be2a2")
!303 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wctype_t", file: !299, line: 46, baseType: !304)
!304 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !241, line: 36, baseType: !199)
!305 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !306, file: !294, line: 78)
!306 = !DISubprogram(name: "iswalnum", linkageName: "_Z8iswalnumi", scope: !307, file: !307, line: 84, type: !308, flags: DIFlagPrototyped, spFlags: 0)
!307 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/___wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "d5a8bf0b4062c20bda4d49376e5b44d9")
!308 = !DISubroutineType(types: !309)
!309 = !{!9, !291}
!310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !311, file: !294, line: 79)
!311 = !DISubprogram(name: "iswalpha", linkageName: "_Z8iswalphai", scope: !307, file: !307, line: 90, type: !308, flags: DIFlagPrototyped, spFlags: 0)
!312 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !313, file: !294, line: 80)
!313 = !DISubprogram(name: "iswblank", linkageName: "_Z8iswblanki", scope: !314, file: !314, line: 53, type: !308, flags: DIFlagPrototyped, spFlags: 0)
!314 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "6bc93063cb32b00d3df790305c546a93")
!315 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !316, file: !294, line: 81)
!316 = !DISubprogram(name: "iswcntrl", linkageName: "_Z8iswcntrli", scope: !307, file: !307, line: 96, type: !308, flags: DIFlagPrototyped, spFlags: 0)
!317 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !318, file: !294, line: 82)
!318 = !DISubprogram(name: "iswdigit", linkageName: "_Z8iswdigiti", scope: !307, file: !307, line: 108, type: !308, flags: DIFlagPrototyped, spFlags: 0)
!319 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !320, file: !294, line: 83)
!320 = !DISubprogram(name: "iswgraph", linkageName: "_Z8iswgraphi", scope: !307, file: !307, line: 114, type: !308, flags: DIFlagPrototyped, spFlags: 0)
!321 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !322, file: !294, line: 84)
!322 = !DISubprogram(name: "iswlower", linkageName: "_Z8iswloweri", scope: !307, file: !307, line: 120, type: !308, flags: DIFlagPrototyped, spFlags: 0)
!323 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !324, file: !294, line: 85)
!324 = !DISubprogram(name: "iswprint", linkageName: "_Z8iswprinti", scope: !307, file: !307, line: 126, type: !308, flags: DIFlagPrototyped, spFlags: 0)
!325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !326, file: !294, line: 86)
!326 = !DISubprogram(name: "iswpunct", linkageName: "_Z8iswpuncti", scope: !307, file: !307, line: 132, type: !308, flags: DIFlagPrototyped, spFlags: 0)
!327 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !328, file: !294, line: 87)
!328 = !DISubprogram(name: "iswspace", linkageName: "_Z8iswspacei", scope: !307, file: !307, line: 138, type: !308, flags: DIFlagPrototyped, spFlags: 0)
!329 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !330, file: !294, line: 88)
!330 = !DISubprogram(name: "iswupper", linkageName: "_Z8iswupperi", scope: !307, file: !307, line: 144, type: !308, flags: DIFlagPrototyped, spFlags: 0)
!331 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !332, file: !294, line: 89)
!332 = !DISubprogram(name: "iswxdigit", linkageName: "_Z9iswxdigiti", scope: !307, file: !307, line: 150, type: !308, flags: DIFlagPrototyped, spFlags: 0)
!333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !334, file: !294, line: 90)
!334 = !DISubprogram(name: "iswctype", linkageName: "_Z8iswctypeij", scope: !307, file: !307, line: 102, type: !335, flags: DIFlagPrototyped, spFlags: 0)
!335 = !DISubroutineType(types: !336)
!336 = !{!9, !291, !301}
!337 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !338, file: !294, line: 91)
!338 = !DISubprogram(name: "wctype", scope: !307, file: !307, line: 190, type: !339, flags: DIFlagPrototyped, spFlags: 0)
!339 = !DISubroutineType(types: !340)
!340 = !{!301, !341}
!341 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !343, file: !294, line: 92)
!343 = !DISubprogram(name: "towlower", linkageName: "_Z8towloweri", scope: !307, file: !307, line: 156, type: !344, flags: DIFlagPrototyped, spFlags: 0)
!344 = !DISubroutineType(types: !345)
!345 = !{!291, !291}
!346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !347, file: !294, line: 93)
!347 = !DISubprogram(name: "towupper", linkageName: "_Z8towupperi", scope: !307, file: !307, line: 162, type: !344, flags: DIFlagPrototyped, spFlags: 0)
!348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !349, file: !294, line: 94)
!349 = !DISubprogram(name: "towctrans", scope: !314, file: !314, line: 124, type: !350, flags: DIFlagPrototyped, spFlags: 0)
!350 = !DISubroutineType(types: !351)
!351 = !{!291, !291, !296}
!352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !353, file: !294, line: 95)
!353 = !DISubprogram(name: "wctrans", scope: !314, file: !314, line: 126, type: !354, flags: DIFlagPrototyped, spFlags: 0)
!354 = !DISubroutineType(types: !355)
!355 = !{!296, !341}
!356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !357, file: !368, line: 133)
!357 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !358, line: 32, baseType: !359)
!358 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8f920c8f4b68eb07504db5a6777c5466")
!359 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_mbstate_t", file: !241, line: 72, baseType: !360)
!360 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !241, line: 70, baseType: !361)
!361 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !241, line: 67, size: 1024, flags: DIFlagTypePassByValue, elements: !362, identifier: "_ZTS11__mbstate_t")
!362 = !{!363, !367}
!363 = !DIDerivedType(tag: DW_TAG_member, name: "__mbstate8", scope: !361, file: !241, line: 68, baseType: !364, size: 1024)
!364 = !DICompositeType(tag: DW_TAG_array_type, baseType: !44, size: 1024, elements: !365)
!365 = !{!366}
!366 = !DISubrange(count: 128)
!367 = !DIDerivedType(tag: DW_TAG_member, name: "_mbstateL", scope: !361, file: !241, line: 69, baseType: !12, size: 64)
!368 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cwchar", directory: "")
!369 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !370, file: !368, line: 134)
!370 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !371, line: 78, size: 448, flags: DIFlagTypePassByValue, elements: !372, identifier: "_ZTS2tm")
!371 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_time.h", directory: "", checksumkind: CSK_MD5, checksum: "e65eafd533c28a52a9094e430476b03e")
!372 = !{!373, !374, !375, !376, !377, !378, !379, !380, !381, !382, !383}
!373 = !DIDerivedType(tag: DW_TAG_member, name: "tm_sec", scope: !370, file: !371, line: 79, baseType: !9, size: 32)
!374 = !DIDerivedType(tag: DW_TAG_member, name: "tm_min", scope: !370, file: !371, line: 80, baseType: !9, size: 32, offset: 32)
!375 = !DIDerivedType(tag: DW_TAG_member, name: "tm_hour", scope: !370, file: !371, line: 81, baseType: !9, size: 32, offset: 64)
!376 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mday", scope: !370, file: !371, line: 82, baseType: !9, size: 32, offset: 96)
!377 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mon", scope: !370, file: !371, line: 83, baseType: !9, size: 32, offset: 128)
!378 = !DIDerivedType(tag: DW_TAG_member, name: "tm_year", scope: !370, file: !371, line: 84, baseType: !9, size: 32, offset: 160)
!379 = !DIDerivedType(tag: DW_TAG_member, name: "tm_wday", scope: !370, file: !371, line: 85, baseType: !9, size: 32, offset: 192)
!380 = !DIDerivedType(tag: DW_TAG_member, name: "tm_yday", scope: !370, file: !371, line: 86, baseType: !9, size: 32, offset: 224)
!381 = !DIDerivedType(tag: DW_TAG_member, name: "tm_isdst", scope: !370, file: !371, line: 87, baseType: !9, size: 32, offset: 256)
!382 = !DIDerivedType(tag: DW_TAG_member, name: "tm_gmtoff", scope: !370, file: !371, line: 88, baseType: !242, size: 64, offset: 320)
!383 = !DIDerivedType(tag: DW_TAG_member, name: "tm_zone", scope: !370, file: !371, line: 89, baseType: !384, size: 64, offset: 384)
!384 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!385 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !291, file: !368, line: 135)
!386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !387, file: !368, line: 136)
!387 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !388, line: 162, baseType: !389)
!388 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "d91ebd7d161d9196cc100822ef0e5cdf")
!389 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILE", file: !388, line: 131, size: 1216, flags: DIFlagTypePassByValue, elements: !390, identifier: "_ZTS7__sFILE")
!390 = !{!391, !393, !394, !395, !396, !397, !402, !403, !405, !409, !413, !421, !425, !426, !429, !430, !434, !438, !439, !440}
!391 = !DIDerivedType(tag: DW_TAG_member, name: "_p", scope: !389, file: !388, line: 132, baseType: !392, size: 64)
!392 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!393 = !DIDerivedType(tag: DW_TAG_member, name: "_r", scope: !389, file: !388, line: 133, baseType: !9, size: 32, offset: 64)
!394 = !DIDerivedType(tag: DW_TAG_member, name: "_w", scope: !389, file: !388, line: 134, baseType: !9, size: 32, offset: 96)
!395 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !389, file: !388, line: 135, baseType: !23, size: 16, offset: 128)
!396 = !DIDerivedType(tag: DW_TAG_member, name: "_file", scope: !389, file: !388, line: 136, baseType: !23, size: 16, offset: 144)
!397 = !DIDerivedType(tag: DW_TAG_member, name: "_bf", scope: !389, file: !388, line: 137, baseType: !398, size: 128, offset: 192)
!398 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sbuf", file: !388, line: 97, size: 128, flags: DIFlagTypePassByValue, elements: !399, identifier: "_ZTS6__sbuf")
!399 = !{!400, !401}
!400 = !DIDerivedType(tag: DW_TAG_member, name: "_base", scope: !398, file: !388, line: 98, baseType: !392, size: 64)
!401 = !DIDerivedType(tag: DW_TAG_member, name: "_size", scope: !398, file: !388, line: 99, baseType: !9, size: 32, offset: 64)
!402 = !DIDerivedType(tag: DW_TAG_member, name: "_lbfsize", scope: !389, file: !388, line: 138, baseType: !9, size: 32, offset: 320)
!403 = !DIDerivedType(tag: DW_TAG_member, name: "_cookie", scope: !389, file: !388, line: 141, baseType: !404, size: 64, offset: 384)
!404 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!405 = !DIDerivedType(tag: DW_TAG_member, name: "_close", scope: !389, file: !388, line: 142, baseType: !406, size: 64, offset: 448)
!406 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !407, size: 64)
!407 = !DISubroutineType(types: !408)
!408 = !{!9, !404}
!409 = !DIDerivedType(tag: DW_TAG_member, name: "_read", scope: !389, file: !388, line: 143, baseType: !410, size: 64, offset: 512)
!410 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !411, size: 64)
!411 = !DISubroutineType(types: !412)
!412 = !{!9, !404, !384, !9}
!413 = !DIDerivedType(tag: DW_TAG_member, name: "_seek", scope: !389, file: !388, line: 144, baseType: !414, size: 64, offset: 576)
!414 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !415, size: 64)
!415 = !DISubroutineType(types: !416)
!416 = !{!417, !404, !417, !9}
!417 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !388, line: 86, baseType: !418)
!418 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_off_t", file: !419, line: 83, baseType: !420)
!419 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "af82ff6119a9fa80fad635d276556d46")
!420 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !241, line: 37, baseType: !12)
!421 = !DIDerivedType(tag: DW_TAG_member, name: "_write", scope: !389, file: !388, line: 145, baseType: !422, size: 64, offset: 640)
!422 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !423, size: 64)
!423 = !DISubroutineType(types: !424)
!424 = !{!9, !404, !341, !9}
!425 = !DIDerivedType(tag: DW_TAG_member, name: "_ub", scope: !389, file: !388, line: 148, baseType: !398, size: 128, offset: 704)
!426 = !DIDerivedType(tag: DW_TAG_member, name: "_extra", scope: !389, file: !388, line: 149, baseType: !427, size: 64, offset: 832)
!427 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !428, size: 64)
!428 = !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILEX", file: !388, line: 103, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS8__sFILEX")
!429 = !DIDerivedType(tag: DW_TAG_member, name: "_ur", scope: !389, file: !388, line: 150, baseType: !9, size: 32, offset: 896)
!430 = !DIDerivedType(tag: DW_TAG_member, name: "_ubuf", scope: !389, file: !388, line: 153, baseType: !431, size: 24, offset: 928)
!431 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 24, elements: !432)
!432 = !{!433}
!433 = !DISubrange(count: 3)
!434 = !DIDerivedType(tag: DW_TAG_member, name: "_nbuf", scope: !389, file: !388, line: 154, baseType: !435, size: 8, offset: 952)
!435 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 8, elements: !436)
!436 = !{!437}
!437 = !DISubrange(count: 1)
!438 = !DIDerivedType(tag: DW_TAG_member, name: "_lb", scope: !389, file: !388, line: 157, baseType: !398, size: 128, offset: 960)
!439 = !DIDerivedType(tag: DW_TAG_member, name: "_blksize", scope: !389, file: !388, line: 160, baseType: !9, size: 32, offset: 1088)
!440 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !389, file: !388, line: 161, baseType: !417, size: 64, offset: 1152)
!441 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !442, file: !368, line: 137)
!442 = !DISubprogram(name: "fwprintf", scope: !443, file: !443, line: 107, type: !444, flags: DIFlagPrototyped, spFlags: 0)
!443 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "c0db33314388059ce7a1663adf1bfda0")
!444 = !DISubroutineType(types: !445)
!445 = !{!9, !446, !447, null}
!446 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !387, size: 64)
!447 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !448, size: 64)
!448 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !449)
!449 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !451, file: !368, line: 138)
!451 = !DISubprogram(name: "fwscanf", scope: !443, file: !443, line: 108, type: !444, flags: DIFlagPrototyped, spFlags: 0)
!452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !453, file: !368, line: 139)
!453 = !DISubprogram(name: "swprintf", scope: !443, file: !443, line: 120, type: !454, flags: DIFlagPrototyped, spFlags: 0)
!454 = !DISubroutineType(types: !455)
!455 = !{!9, !456, !457, !447, null}
!456 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !449, size: 64)
!457 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !458, line: 50, baseType: !459)
!458 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "f7981334d28e0c246f35cd24042aa2a4")
!459 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !241, line: 87, baseType: !246)
!460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !461, file: !368, line: 140)
!461 = !DISubprogram(name: "vfwprintf", scope: !443, file: !443, line: 124, type: !462, flags: DIFlagPrototyped, spFlags: 0)
!462 = !DISubroutineType(types: !463)
!463 = !{!9, !446, !447, !464}
!464 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_va_list", file: !241, line: 95, baseType: !465)
!465 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !16, baseType: !384)
!466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !467, file: !368, line: 141)
!467 = !DISubprogram(name: "vswprintf", scope: !443, file: !443, line: 126, type: !468, flags: DIFlagPrototyped, spFlags: 0)
!468 = !DISubroutineType(types: !469)
!469 = !{!9, !456, !457, !447, !464}
!470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !471, file: !368, line: 142)
!471 = !DISubprogram(name: "swscanf", scope: !443, file: !443, line: 122, type: !472, flags: DIFlagPrototyped, spFlags: 0)
!472 = !DISubroutineType(types: !473)
!473 = !{!9, !447, !447, null}
!474 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !475, file: !368, line: 143)
!475 = !DISubprogram(name: "vfwscanf", scope: !443, file: !443, line: 195, type: !462, flags: DIFlagPrototyped, spFlags: 0)
!476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !477, file: !368, line: 144)
!477 = !DISubprogram(name: "vswscanf", scope: !443, file: !443, line: 197, type: !478, flags: DIFlagPrototyped, spFlags: 0)
!478 = !DISubroutineType(types: !479)
!479 = !{!9, !447, !447, !464}
!480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !481, file: !368, line: 145)
!481 = !DISubprogram(name: "fgetwc", scope: !443, file: !443, line: 100, type: !482, flags: DIFlagPrototyped, spFlags: 0)
!482 = !DISubroutineType(types: !483)
!483 = !{!291, !446}
!484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !485, file: !368, line: 146)
!485 = !DISubprogram(name: "fgetws", scope: !443, file: !443, line: 102, type: !486, flags: DIFlagPrototyped, spFlags: 0)
!486 = !DISubroutineType(types: !487)
!487 = !{!456, !456, !9, !446}
!488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !489, file: !368, line: 147)
!489 = !DISubprogram(name: "fputwc", scope: !443, file: !443, line: 104, type: !490, flags: DIFlagPrototyped, spFlags: 0)
!490 = !DISubroutineType(types: !491)
!491 = !{!291, !449, !446}
!492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !493, file: !368, line: 148)
!493 = !DISubprogram(name: "fputws", scope: !443, file: !443, line: 105, type: !494, flags: DIFlagPrototyped, spFlags: 0)
!494 = !DISubroutineType(types: !495)
!495 = !{!9, !447, !446}
!496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !497, file: !368, line: 149)
!497 = !DISubprogram(name: "fwide", scope: !443, file: !443, line: 106, type: !498, flags: DIFlagPrototyped, spFlags: 0)
!498 = !DISubroutineType(types: !499)
!499 = !{!9, !446, !9}
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !501, file: !368, line: 150)
!501 = !DISubprogram(name: "getwc", scope: !443, file: !443, line: 109, type: !482, flags: DIFlagPrototyped, spFlags: 0)
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !503, file: !368, line: 151)
!503 = !DISubprogram(name: "putwc", scope: !443, file: !443, line: 118, type: !490, flags: DIFlagPrototyped, spFlags: 0)
!504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !505, file: !368, line: 152)
!505 = !DISubprogram(name: "ungetwc", scope: !443, file: !443, line: 123, type: !506, flags: DIFlagPrototyped, spFlags: 0)
!506 = !DISubroutineType(types: !507)
!507 = !{!291, !291, !446}
!508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !509, file: !368, line: 153)
!509 = !DISubprogram(name: "wcstod", scope: !443, file: !443, line: 160, type: !510, flags: DIFlagPrototyped, spFlags: 0)
!510 = !DISubroutineType(types: !511)
!511 = !{!512, !447, !513}
!512 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!513 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !456, size: 64)
!514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !515, file: !368, line: 154)
!515 = !DISubprogram(name: "wcstof", scope: !443, file: !443, line: 200, type: !516, flags: DIFlagPrototyped, spFlags: 0)
!516 = !DISubroutineType(types: !517)
!517 = !{!518, !447, !513}
!518 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!519 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !520, file: !368, line: 155)
!520 = !DISubprogram(name: "wcstold", scope: !443, file: !443, line: 202, type: !521, flags: DIFlagPrototyped, spFlags: 0)
!521 = !DISubroutineType(types: !522)
!522 = !{!256, !447, !513}
!523 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !524, file: !368, line: 156)
!524 = !DISubprogram(name: "wcstol", scope: !443, file: !443, line: 164, type: !525, flags: DIFlagPrototyped, spFlags: 0)
!525 = !DISubroutineType(types: !526)
!526 = !{!242, !447, !513, !9}
!527 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !528, file: !368, line: 157)
!528 = !DISubprogram(name: "wcstoll", scope: !443, file: !443, line: 205, type: !529, flags: DIFlagPrototyped, spFlags: 0)
!529 = !DISubroutineType(types: !530)
!530 = !{!12, !447, !513, !9}
!531 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !532, file: !368, line: 158)
!532 = !DISubprogram(name: "wcstoul", scope: !443, file: !443, line: 167, type: !533, flags: DIFlagPrototyped, spFlags: 0)
!533 = !DISubroutineType(types: !534)
!534 = !{!246, !447, !513, !9}
!535 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !536, file: !368, line: 159)
!536 = !DISubprogram(name: "wcstoull", scope: !443, file: !443, line: 207, type: !537, flags: DIFlagPrototyped, spFlags: 0)
!537 = !DISubroutineType(types: !538)
!538 = !{!203, !447, !513, !9}
!539 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !540, file: !368, line: 160)
!540 = !DISubprogram(name: "wcscpy", scope: !443, file: !443, line: 134, type: !541, flags: DIFlagPrototyped, spFlags: 0)
!541 = !DISubroutineType(types: !542)
!542 = !{!456, !456, !447}
!543 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !544, file: !368, line: 161)
!544 = !DISubprogram(name: "wcsncpy", scope: !443, file: !443, line: 148, type: !545, flags: DIFlagPrototyped, spFlags: 0)
!545 = !DISubroutineType(types: !546)
!546 = !{!456, !456, !447, !457}
!547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !548, file: !368, line: 162)
!548 = !DISubprogram(name: "wcscat", scope: !443, file: !443, line: 130, type: !541, flags: DIFlagPrototyped, spFlags: 0)
!549 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !550, file: !368, line: 163)
!550 = !DISubprogram(name: "wcsncat", scope: !443, file: !443, line: 142, type: !545, flags: DIFlagPrototyped, spFlags: 0)
!551 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !552, file: !368, line: 164)
!552 = !DISubprogram(name: "wcscmp", scope: !443, file: !443, line: 132, type: !553, flags: DIFlagPrototyped, spFlags: 0)
!553 = !DISubroutineType(types: !554)
!554 = !{!9, !447, !447}
!555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !556, file: !368, line: 165)
!556 = !DISubprogram(name: "wcscoll", scope: !443, file: !443, line: 133, type: !553, flags: DIFlagPrototyped, spFlags: 0)
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !558, file: !368, line: 166)
!558 = !DISubprogram(name: "wcsncmp", scope: !443, file: !443, line: 145, type: !559, flags: DIFlagPrototyped, spFlags: 0)
!559 = !DISubroutineType(types: !560)
!560 = !{!9, !447, !447, !457}
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !562, file: !368, line: 167)
!562 = !DISubprogram(name: "wcsxfrm", scope: !443, file: !443, line: 157, type: !563, flags: DIFlagPrototyped, spFlags: 0)
!563 = !DISubroutineType(types: !564)
!564 = !{!457, !456, !447, !457}
!565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !566, file: !368, line: 168)
!566 = !DISubprogram(name: "wcschr", linkageName: "_Z6wcschrB8ne200100Ua9enable_ifILb1EEPww", scope: !567, file: !567, line: 147, type: !568, flags: DIFlagPrototyped, spFlags: 0)
!567 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/wchar.h", directory: "")
!568 = !DISubroutineType(types: !569)
!569 = !{!456, !456, !449}
!570 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !571, file: !368, line: 169)
!571 = !DISubprogram(name: "wcspbrk", linkageName: "_Z7wcspbrkB8ne200100Ua9enable_ifILb1EEPwPKw", scope: !567, file: !567, line: 158, type: !541, flags: DIFlagPrototyped, spFlags: 0)
!572 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !573, file: !368, line: 170)
!573 = !DISubprogram(name: "wcsrchr", linkageName: "_Z7wcsrchrB8ne200100Ua9enable_ifILb1EEPww", scope: !567, file: !567, line: 168, type: !568, flags: DIFlagPrototyped, spFlags: 0)
!574 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !575, file: !368, line: 171)
!575 = !DISubprogram(name: "wcsstr", linkageName: "_Z6wcsstrB8ne200100Ua9enable_ifILb1EEPwPKw", scope: !567, file: !567, line: 179, type: !541, flags: DIFlagPrototyped, spFlags: 0)
!576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !577, file: !368, line: 172)
!577 = !DISubprogram(name: "wmemchr", linkageName: "_Z7wmemchrB8ne200100Ua9enable_ifILb1EEPwwm", scope: !567, file: !567, line: 190, type: !578, flags: DIFlagPrototyped, spFlags: 0)
!578 = !DISubroutineType(types: !579)
!579 = !{!456, !456, !449, !457}
!580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !581, file: !368, line: 173)
!581 = !DISubprogram(name: "wcscspn", scope: !443, file: !443, line: 136, type: !582, flags: DIFlagPrototyped, spFlags: 0)
!582 = !DISubroutineType(types: !583)
!583 = !{!457, !447, !447}
!584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !585, file: !368, line: 174)
!585 = !DISubprogram(name: "wcslen", scope: !443, file: !443, line: 140, type: !586, flags: DIFlagPrototyped, spFlags: 0)
!586 = !DISubroutineType(types: !587)
!587 = !{!457, !447}
!588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !589, file: !368, line: 175)
!589 = !DISubprogram(name: "wcsspn", scope: !443, file: !443, line: 155, type: !582, flags: DIFlagPrototyped, spFlags: 0)
!590 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !591, file: !368, line: 176)
!591 = !DISubprogram(name: "wcstok", scope: !443, file: !443, line: 162, type: !592, flags: DIFlagPrototyped, spFlags: 0)
!592 = !DISubroutineType(types: !593)
!593 = !{!456, !456, !447, !513}
!594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !595, file: !368, line: 177)
!595 = !DISubprogram(name: "wmemcmp", scope: !443, file: !443, line: 170, type: !559, flags: DIFlagPrototyped, spFlags: 0)
!596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !597, file: !368, line: 178)
!597 = !DISubprogram(name: "wmemcpy", scope: !443, file: !443, line: 173, type: !545, flags: DIFlagPrototyped, spFlags: 0)
!598 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !599, file: !368, line: 179)
!599 = !DISubprogram(name: "wmemmove", scope: !443, file: !443, line: 176, type: !545, flags: DIFlagPrototyped, spFlags: 0)
!600 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !601, file: !368, line: 180)
!601 = !DISubprogram(name: "wmemset", scope: !443, file: !443, line: 179, type: !578, flags: DIFlagPrototyped, spFlags: 0)
!602 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !603, file: !368, line: 181)
!603 = !DISubprogram(name: "wcsftime", linkageName: "\01_wcsftime", scope: !443, file: !443, line: 137, type: !604, flags: DIFlagPrototyped, spFlags: 0)
!604 = !DISubroutineType(types: !605)
!605 = !{!457, !456, !457, !447, !606}
!606 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !607, size: 64)
!607 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !370)
!608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !609, file: !368, line: 182)
!609 = !DISubprogram(name: "btowc", scope: !443, file: !443, line: 99, type: !610, flags: DIFlagPrototyped, spFlags: 0)
!610 = !DISubroutineType(types: !611)
!611 = !{!291, !9}
!612 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !613, file: !368, line: 183)
!613 = !DISubprogram(name: "wctob", scope: !443, file: !443, line: 159, type: !308, flags: DIFlagPrototyped, spFlags: 0)
!614 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !615, file: !368, line: 184)
!615 = !DISubprogram(name: "mbsinit", scope: !443, file: !443, line: 115, type: !616, flags: DIFlagPrototyped, spFlags: 0)
!616 = !DISubroutineType(types: !617)
!617 = !{!9, !618}
!618 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !619, size: 64)
!619 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !357)
!620 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !621, file: !368, line: 185)
!621 = !DISubprogram(name: "mbrlen", scope: !443, file: !443, line: 111, type: !622, flags: DIFlagPrototyped, spFlags: 0)
!622 = !DISubroutineType(types: !623)
!623 = !{!457, !341, !457, !624}
!624 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !357, size: 64)
!625 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !626, file: !368, line: 186)
!626 = !DISubprogram(name: "mbrtowc", scope: !443, file: !443, line: 113, type: !627, flags: DIFlagPrototyped, spFlags: 0)
!627 = !DISubroutineType(types: !628)
!628 = !{!457, !456, !341, !457, !624}
!629 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !630, file: !368, line: 187)
!630 = !DISubprogram(name: "wcrtomb", scope: !443, file: !443, line: 129, type: !631, flags: DIFlagPrototyped, spFlags: 0)
!631 = !DISubroutineType(types: !632)
!632 = !{!457, !384, !449, !624}
!633 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !634, file: !368, line: 188)
!634 = !DISubprogram(name: "mbsrtowcs", scope: !443, file: !443, line: 116, type: !635, flags: DIFlagPrototyped, spFlags: 0)
!635 = !DISubroutineType(types: !636)
!636 = !{!457, !456, !637, !457, !624}
!637 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !341, size: 64)
!638 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !639, file: !368, line: 189)
!639 = !DISubprogram(name: "wcsrtombs", scope: !443, file: !443, line: 153, type: !640, flags: DIFlagPrototyped, spFlags: 0)
!640 = !DISubroutineType(types: !641)
!641 = !{!457, !384, !642, !457, !624}
!642 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !447, size: 64)
!643 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !644, file: !368, line: 191)
!644 = !DISubprogram(name: "getwchar", scope: !443, file: !443, line: 110, type: !645, flags: DIFlagPrototyped, spFlags: 0)
!645 = !DISubroutineType(types: !646)
!646 = !{!291}
!647 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !648, file: !368, line: 192)
!648 = !DISubprogram(name: "vwscanf", scope: !443, file: !443, line: 199, type: !649, flags: DIFlagPrototyped, spFlags: 0)
!649 = !DISubroutineType(types: !650)
!650 = !{!9, !447, !464}
!651 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !652, file: !368, line: 193)
!652 = !DISubprogram(name: "wscanf", scope: !443, file: !443, line: 181, type: !653, flags: DIFlagPrototyped, spFlags: 0)
!653 = !DISubroutineType(types: !654)
!654 = !{!9, !447, null}
!655 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !656, file: !368, line: 195)
!656 = !DISubprogram(name: "putwchar", scope: !443, file: !443, line: 119, type: !657, flags: DIFlagPrototyped, spFlags: 0)
!657 = !DISubroutineType(types: !658)
!658 = !{!291, !449}
!659 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !660, file: !368, line: 196)
!660 = !DISubprogram(name: "vwprintf", scope: !443, file: !443, line: 128, type: !649, flags: DIFlagPrototyped, spFlags: 0)
!661 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !662, file: !368, line: 197)
!662 = !DISubprogram(name: "wprintf", scope: !443, file: !443, line: 180, type: !653, flags: DIFlagPrototyped, spFlags: 0)
!663 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !664, file: !670, line: 82)
!664 = !DISubprogram(name: "memcpy", scope: !665, file: !665, line: 78, type: !666, flags: DIFlagPrototyped, spFlags: 0)
!665 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_string.h", directory: "", checksumkind: CSK_MD5, checksum: "c67be38c725261ca8572072ee1574b87")
!666 = !DISubroutineType(types: !667)
!667 = !{!404, !404, !668, !457}
!668 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !669, size: 64)
!669 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!670 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstring", directory: "")
!671 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !672, file: !670, line: 83)
!672 = !DISubprogram(name: "memmove", scope: !665, file: !665, line: 81, type: !666, flags: DIFlagPrototyped, spFlags: 0)
!673 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !674, file: !670, line: 84)
!674 = !DISubprogram(name: "strcpy", scope: !665, file: !665, line: 92, type: !675, flags: DIFlagPrototyped, spFlags: 0)
!675 = !DISubroutineType(types: !676)
!676 = !{!384, !384, !341}
!677 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !678, file: !670, line: 85)
!678 = !DISubprogram(name: "strncpy", scope: !665, file: !665, line: 104, type: !679, flags: DIFlagPrototyped, spFlags: 0)
!679 = !DISubroutineType(types: !680)
!680 = !{!384, !384, !341, !457}
!681 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !682, file: !670, line: 86)
!682 = !DISubprogram(name: "strcat", scope: !665, file: !665, line: 86, type: !675, flags: DIFlagPrototyped, spFlags: 0)
!683 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !684, file: !670, line: 87)
!684 = !DISubprogram(name: "strncat", scope: !665, file: !665, line: 98, type: !679, flags: DIFlagPrototyped, spFlags: 0)
!685 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !686, file: !670, line: 88)
!686 = !DISubprogram(name: "memcmp", scope: !665, file: !665, line: 75, type: !687, flags: DIFlagPrototyped, spFlags: 0)
!687 = !DISubroutineType(types: !688)
!688 = !{!9, !668, !668, !457}
!689 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !690, file: !670, line: 89)
!690 = !DISubprogram(name: "strcmp", scope: !665, file: !665, line: 89, type: !691, flags: DIFlagPrototyped, spFlags: 0)
!691 = !DISubroutineType(types: !692)
!692 = !{!9, !341, !341}
!693 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !694, file: !670, line: 90)
!694 = !DISubprogram(name: "strncmp", scope: !665, file: !665, line: 101, type: !695, flags: DIFlagPrototyped, spFlags: 0)
!695 = !DISubroutineType(types: !696)
!696 = !{!9, !341, !341, !457}
!697 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !698, file: !670, line: 91)
!698 = !DISubprogram(name: "strcoll", scope: !665, file: !665, line: 90, type: !691, flags: DIFlagPrototyped, spFlags: 0)
!699 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !700, file: !670, line: 92)
!700 = !DISubprogram(name: "strxfrm", scope: !665, file: !665, line: 112, type: !701, flags: DIFlagPrototyped, spFlags: 0)
!701 = !DISubroutineType(types: !702)
!702 = !{!457, !384, !341, !457}
!703 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !704, file: !670, line: 93)
!704 = !DISubprogram(name: "memchr", linkageName: "_Z6memchrB8ne200100Ua9enable_ifILb1EEPvim", scope: !705, file: !705, line: 101, type: !706, flags: DIFlagPrototyped, spFlags: 0)
!705 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/string.h", directory: "")
!706 = !DISubroutineType(types: !707)
!707 = !{!404, !404, !9, !457}
!708 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !709, file: !670, line: 94)
!709 = !DISubprogram(name: "strchr", linkageName: "_Z6strchrB8ne200100Ua9enable_ifILb1EEPci", scope: !705, file: !705, line: 80, type: !710, flags: DIFlagPrototyped, spFlags: 0)
!710 = !DISubroutineType(types: !711)
!711 = !{!384, !384, !9}
!712 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !713, file: !670, line: 95)
!713 = !DISubprogram(name: "strcspn", scope: !665, file: !665, line: 94, type: !714, flags: DIFlagPrototyped, spFlags: 0)
!714 = !DISubroutineType(types: !715)
!715 = !{!457, !341, !341}
!716 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !717, file: !670, line: 96)
!717 = !DISubprogram(name: "strpbrk", linkageName: "_Z7strpbrkB8ne200100Ua9enable_ifILb1EEPcPKc", scope: !705, file: !705, line: 87, type: !675, flags: DIFlagPrototyped, spFlags: 0)
!718 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !719, file: !670, line: 97)
!719 = !DISubprogram(name: "strrchr", linkageName: "_Z7strrchrB8ne200100Ua9enable_ifILb1EEPci", scope: !705, file: !705, line: 94, type: !710, flags: DIFlagPrototyped, spFlags: 0)
!720 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !721, file: !670, line: 98)
!721 = !DISubprogram(name: "strspn", scope: !665, file: !665, line: 109, type: !714, flags: DIFlagPrototyped, spFlags: 0)
!722 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !723, file: !670, line: 99)
!723 = !DISubprogram(name: "strstr", linkageName: "_Z6strstrB8ne200100Ua9enable_ifILb1EEPcPKc", scope: !705, file: !705, line: 108, type: !675, flags: DIFlagPrototyped, spFlags: 0)
!724 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !725, file: !670, line: 100)
!725 = !DISubprogram(name: "strtok", scope: !665, file: !665, line: 111, type: !675, flags: DIFlagPrototyped, spFlags: 0)
!726 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !727, file: !670, line: 101)
!727 = !DISubprogram(name: "memset", scope: !665, file: !665, line: 84, type: !706, flags: DIFlagPrototyped, spFlags: 0)
!728 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !729, file: !670, line: 102)
!729 = !DISubprogram(name: "strerror", linkageName: "\01_strerror", scope: !665, file: !665, line: 95, type: !730, flags: DIFlagPrototyped, spFlags: 0)
!730 = !DISubroutineType(types: !731)
!731 = !{!384, !9}
!732 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !733, file: !670, line: 103)
!733 = !DISubprogram(name: "strlen", scope: !665, file: !665, line: 96, type: !734, flags: DIFlagPrototyped, spFlags: 0)
!734 = !DISubroutineType(types: !735)
!735 = !{!457, !341}
!736 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !737, file: !743, line: 422)
!737 = !DISubprogram(name: "isfinite", linkageName: "_ZNSt3__16__math8isfiniteB8ne200100Ee", scope: !739, file: !738, line: 79, type: !740, flags: DIFlagPrototyped, spFlags: 0)
!738 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__math/traits.h", directory: "")
!739 = !DINamespace(name: "__math", scope: !183)
!740 = !DISubroutineType(types: !741)
!741 = !{!742, !256}
!742 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!743 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/math.h", directory: "")
!744 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !745, file: !743, line: 425)
!745 = !DISubprogram(name: "isinf", linkageName: "_ZNSt3__16__math5isinfB8ne200100Ee", scope: !739, file: !738, line: 103, type: !740, flags: DIFlagPrototyped, spFlags: 0)
!746 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !747, file: !743, line: 429)
!747 = !DISubprogram(name: "isnan", linkageName: "_ZNSt3__16__math5isnanB8ne200100Ee", scope: !739, file: !738, line: 127, type: !740, flags: DIFlagPrototyped, spFlags: 0)
!748 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !749, file: !743, line: 430)
!749 = !DISubprogram(name: "isnormal", linkageName: "_ZNSt3__16__math8isnormalB8ne200100Ee", scope: !739, file: !738, line: 146, type: !740, flags: DIFlagPrototyped, spFlags: 0)
!750 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !751, file: !743, line: 485)
!751 = !DISubprogram(name: "modf", linkageName: "_ZNSt3__16__math4modfB8ne200100EePe", scope: !739, file: !752, line: 55, type: !753, flags: DIFlagPrototyped, spFlags: 0)
!752 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__math/modulo.h", directory: "")
!753 = !DISubroutineType(types: !754)
!754 = !{!256, !256, !755}
!755 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !256, size: 64)
!756 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !737, file: !757, line: 352)
!757 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cmath", directory: "")
!758 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !745, file: !757, line: 353)
!759 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !747, file: !757, line: 354)
!760 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !749, file: !757, line: 355)
!761 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !762, file: !757, line: 364)
!762 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !763, line: 50, baseType: !518)
!763 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/math.h", directory: "", checksumkind: CSK_MD5, checksum: "35b1ff63542c2c0c144330dd9277d2dc")
!764 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !765, file: !757, line: 365)
!765 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !763, line: 51, baseType: !512)
!766 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !767, file: !757, line: 367)
!767 = !DISubprogram(name: "abs", linkageName: "_Z3absB8ne200100e", scope: !768, file: !768, line: 123, type: !769, flags: DIFlagPrototyped, spFlags: 0)
!768 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/stdlib.h", directory: "")
!769 = !DISubroutineType(types: !770)
!770 = !{!256, !256}
!771 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !772, file: !757, line: 370)
!772 = !DISubprogram(name: "acosf", scope: !763, file: !763, line: 314, type: !773, flags: DIFlagPrototyped, spFlags: 0)
!773 = !DISubroutineType(types: !774)
!774 = !{!518, !518}
!775 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !776, file: !757, line: 372)
!776 = !DISubprogram(name: "asinf", scope: !763, file: !763, line: 318, type: !773, flags: DIFlagPrototyped, spFlags: 0)
!777 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !778, file: !757, line: 374)
!778 = !DISubprogram(name: "atanf", scope: !763, file: !763, line: 322, type: !773, flags: DIFlagPrototyped, spFlags: 0)
!779 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !780, file: !757, line: 376)
!780 = !DISubprogram(name: "atan2f", scope: !763, file: !763, line: 326, type: !781, flags: DIFlagPrototyped, spFlags: 0)
!781 = !DISubroutineType(types: !782)
!782 = !{!518, !518, !518}
!783 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !784, file: !757, line: 378)
!784 = !DISubprogram(name: "ceilf", scope: !763, file: !763, line: 461, type: !773, flags: DIFlagPrototyped, spFlags: 0)
!785 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !786, file: !757, line: 380)
!786 = !DISubprogram(name: "cosf", scope: !763, file: !763, line: 330, type: !773, flags: DIFlagPrototyped, spFlags: 0)
!787 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !788, file: !757, line: 382)
!788 = !DISubprogram(name: "coshf", scope: !763, file: !763, line: 354, type: !773, flags: DIFlagPrototyped, spFlags: 0)
!789 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !790, file: !757, line: 385)
!790 = !DISubprogram(name: "expf", scope: !763, file: !763, line: 366, type: !773, flags: DIFlagPrototyped, spFlags: 0)
!791 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !792, file: !757, line: 388)
!792 = !DISubprogram(name: "fabsf", scope: !763, file: !763, line: 422, type: !773, flags: DIFlagPrototyped, spFlags: 0)
!793 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !794, file: !757, line: 390)
!794 = !DISubprogram(name: "floorf", scope: !763, file: !763, line: 465, type: !773, flags: DIFlagPrototyped, spFlags: 0)
!795 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !796, file: !757, line: 393)
!796 = !DISubprogram(name: "fmodf", scope: !763, file: !763, line: 505, type: !781, flags: DIFlagPrototyped, spFlags: 0)
!797 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !798, file: !757, line: 396)
!798 = !DISubprogram(name: "frexpf", scope: !763, file: !763, line: 406, type: !799, flags: DIFlagPrototyped, spFlags: 0)
!799 = !DISubroutineType(types: !800)
!800 = !{!518, !518, !801}
!801 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!802 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !803, file: !757, line: 398)
!803 = !DISubprogram(name: "ldexpf", scope: !763, file: !763, line: 402, type: !804, flags: DIFlagPrototyped, spFlags: 0)
!804 = !DISubroutineType(types: !805)
!805 = !{!518, !518, !9}
!806 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !807, file: !757, line: 401)
!807 = !DISubprogram(name: "logf", scope: !763, file: !763, line: 378, type: !773, flags: DIFlagPrototyped, spFlags: 0)
!808 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !809, file: !757, line: 404)
!809 = !DISubprogram(name: "log10f", scope: !763, file: !763, line: 382, type: !773, flags: DIFlagPrototyped, spFlags: 0)
!810 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !751, file: !757, line: 405)
!811 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !812, file: !757, line: 406)
!812 = !DISubprogram(name: "modff", scope: !763, file: !763, line: 398, type: !813, flags: DIFlagPrototyped, spFlags: 0)
!813 = !DISubroutineType(types: !814)
!814 = !{!518, !518, !815}
!815 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !518, size: 64)
!816 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !817, file: !757, line: 409)
!817 = !DISubprogram(name: "powf", scope: !763, file: !763, line: 434, type: !781, flags: DIFlagPrototyped, spFlags: 0)
!818 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !819, file: !757, line: 412)
!819 = !DISubprogram(name: "sinf", scope: !763, file: !763, line: 334, type: !773, flags: DIFlagPrototyped, spFlags: 0)
!820 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !821, file: !757, line: 414)
!821 = !DISubprogram(name: "sinhf", scope: !763, file: !763, line: 358, type: !773, flags: DIFlagPrototyped, spFlags: 0)
!822 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !823, file: !757, line: 417)
!823 = !DISubprogram(name: "sqrtf", scope: !763, file: !763, line: 438, type: !773, flags: DIFlagPrototyped, spFlags: 0)
!824 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !825, file: !757, line: 419)
!825 = !DISubprogram(name: "tanf", scope: !763, file: !763, line: 338, type: !773, flags: DIFlagPrototyped, spFlags: 0)
!826 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !827, file: !757, line: 422)
!827 = !DISubprogram(name: "tanhf", scope: !763, file: !763, line: 362, type: !773, flags: DIFlagPrototyped, spFlags: 0)
!828 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !829, file: !757, line: 425)
!829 = !DISubprogram(name: "acoshf", scope: !763, file: !763, line: 342, type: !773, flags: DIFlagPrototyped, spFlags: 0)
!830 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !831, file: !757, line: 427)
!831 = !DISubprogram(name: "asinhf", scope: !763, file: !763, line: 346, type: !773, flags: DIFlagPrototyped, spFlags: 0)
!832 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !833, file: !757, line: 429)
!833 = !DISubprogram(name: "atanhf", scope: !763, file: !763, line: 350, type: !773, flags: DIFlagPrototyped, spFlags: 0)
!834 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !835, file: !757, line: 431)
!835 = !DISubprogram(name: "cbrtf", scope: !763, file: !763, line: 426, type: !773, flags: DIFlagPrototyped, spFlags: 0)
!836 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !837, file: !757, line: 434)
!837 = !DISubprogram(name: "copysignf", scope: !763, file: !763, line: 517, type: !781, flags: DIFlagPrototyped, spFlags: 0)
!838 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !839, file: !757, line: 437)
!839 = !DISubprogram(name: "erff", scope: !763, file: !763, line: 442, type: !773, flags: DIFlagPrototyped, spFlags: 0)
!840 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !841, file: !757, line: 439)
!841 = !DISubprogram(name: "erfcf", scope: !763, file: !763, line: 446, type: !773, flags: DIFlagPrototyped, spFlags: 0)
!842 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !843, file: !757, line: 441)
!843 = !DISubprogram(name: "exp2f", scope: !763, file: !763, line: 370, type: !773, flags: DIFlagPrototyped, spFlags: 0)
!844 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !845, file: !757, line: 443)
!845 = !DISubprogram(name: "expm1f", scope: !763, file: !763, line: 374, type: !773, flags: DIFlagPrototyped, spFlags: 0)
!846 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !847, file: !757, line: 445)
!847 = !DISubprogram(name: "fdimf", scope: !763, file: !763, line: 533, type: !781, flags: DIFlagPrototyped, spFlags: 0)
!848 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !849, file: !757, line: 446)
!849 = !DISubprogram(name: "fmaf", scope: !763, file: !763, line: 545, type: !850, flags: DIFlagPrototyped, spFlags: 0)
!850 = !DISubroutineType(types: !851)
!851 = !{!518, !518, !518, !518}
!852 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !853, file: !757, line: 449)
!853 = !DISubprogram(name: "fmaxf", scope: !763, file: !763, line: 537, type: !781, flags: DIFlagPrototyped, spFlags: 0)
!854 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !855, file: !757, line: 451)
!855 = !DISubprogram(name: "fminf", scope: !763, file: !763, line: 541, type: !781, flags: DIFlagPrototyped, spFlags: 0)
!856 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !857, file: !757, line: 453)
!857 = !DISubprogram(name: "hypotf", scope: !763, file: !763, line: 430, type: !781, flags: DIFlagPrototyped, spFlags: 0)
!858 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !859, file: !757, line: 455)
!859 = !DISubprogram(name: "ilogbf", scope: !763, file: !763, line: 410, type: !860, flags: DIFlagPrototyped, spFlags: 0)
!860 = !DISubroutineType(types: !861)
!861 = !{!9, !518}
!862 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !863, file: !757, line: 457)
!863 = !DISubprogram(name: "lgammaf", scope: !763, file: !763, line: 453, type: !773, flags: DIFlagPrototyped, spFlags: 0)
!864 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !865, file: !757, line: 459)
!865 = !DISubprogram(name: "llrintf", scope: !763, file: !763, line: 492, type: !866, flags: DIFlagPrototyped, spFlags: 0)
!866 = !DISubroutineType(types: !867)
!867 = !{!12, !518}
!868 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !869, file: !757, line: 461)
!869 = !DISubprogram(name: "llroundf", scope: !763, file: !763, line: 496, type: !866, flags: DIFlagPrototyped, spFlags: 0)
!870 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !871, file: !757, line: 463)
!871 = !DISubprogram(name: "log1pf", scope: !763, file: !763, line: 390, type: !773, flags: DIFlagPrototyped, spFlags: 0)
!872 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !873, file: !757, line: 465)
!873 = !DISubprogram(name: "log2f", scope: !763, file: !763, line: 386, type: !773, flags: DIFlagPrototyped, spFlags: 0)
!874 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !875, file: !757, line: 467)
!875 = !DISubprogram(name: "logbf", scope: !763, file: !763, line: 394, type: !773, flags: DIFlagPrototyped, spFlags: 0)
!876 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !877, file: !757, line: 469)
!877 = !DISubprogram(name: "lrintf", scope: !763, file: !763, line: 477, type: !878, flags: DIFlagPrototyped, spFlags: 0)
!878 = !DISubroutineType(types: !879)
!879 = !{!242, !518}
!880 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !881, file: !757, line: 471)
!881 = !DISubprogram(name: "lroundf", scope: !763, file: !763, line: 485, type: !878, flags: DIFlagPrototyped, spFlags: 0)
!882 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !883, file: !757, line: 473)
!883 = !DISubprogram(name: "nan", scope: !763, file: !763, line: 522, type: !884, flags: DIFlagPrototyped, spFlags: 0)
!884 = !DISubroutineType(types: !885)
!885 = !{!512, !341}
!886 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !887, file: !757, line: 474)
!887 = !DISubprogram(name: "nanf", scope: !763, file: !763, line: 521, type: !888, flags: DIFlagPrototyped, spFlags: 0)
!888 = !DISubroutineType(types: !889)
!889 = !{!518, !341}
!890 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !891, file: !757, line: 477)
!891 = !DISubprogram(name: "nearbyintf", scope: !763, file: !763, line: 469, type: !773, flags: DIFlagPrototyped, spFlags: 0)
!892 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !893, file: !757, line: 479)
!893 = !DISubprogram(name: "nextafterf", scope: !763, file: !763, line: 525, type: !781, flags: DIFlagPrototyped, spFlags: 0)
!894 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !895, file: !757, line: 481)
!895 = !DISubprogram(name: "nexttowardf", scope: !763, file: !763, line: 530, type: !896, flags: DIFlagPrototyped, spFlags: 0)
!896 = !DISubroutineType(types: !897)
!897 = !{!518, !518, !256}
!898 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !899, file: !757, line: 483)
!899 = !DISubprogram(name: "remainderf", scope: !763, file: !763, line: 509, type: !781, flags: DIFlagPrototyped, spFlags: 0)
!900 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !901, file: !757, line: 485)
!901 = !DISubprogram(name: "remquof", scope: !763, file: !763, line: 513, type: !902, flags: DIFlagPrototyped, spFlags: 0)
!902 = !DISubroutineType(types: !903)
!903 = !{!518, !518, !518, !801}
!904 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !905, file: !757, line: 487)
!905 = !DISubprogram(name: "rintf", scope: !763, file: !763, line: 473, type: !773, flags: DIFlagPrototyped, spFlags: 0)
!906 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !907, file: !757, line: 489)
!907 = !DISubprogram(name: "roundf", scope: !763, file: !763, line: 481, type: !773, flags: DIFlagPrototyped, spFlags: 0)
!908 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !909, file: !757, line: 491)
!909 = !DISubprogram(name: "scalblnf", scope: !763, file: !763, line: 418, type: !910, flags: DIFlagPrototyped, spFlags: 0)
!910 = !DISubroutineType(types: !911)
!911 = !{!518, !518, !242}
!912 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !913, file: !757, line: 493)
!913 = !DISubprogram(name: "scalbnf", scope: !763, file: !763, line: 414, type: !804, flags: DIFlagPrototyped, spFlags: 0)
!914 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !915, file: !757, line: 495)
!915 = !DISubprogram(name: "tgammaf", scope: !763, file: !763, line: 457, type: !773, flags: DIFlagPrototyped, spFlags: 0)
!916 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !917, file: !757, line: 497)
!917 = !DISubprogram(name: "truncf", scope: !763, file: !763, line: 501, type: !773, flags: DIFlagPrototyped, spFlags: 0)
!918 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !919, file: !757, line: 499)
!919 = !DISubprogram(name: "acosl", scope: !763, file: !763, line: 316, type: !769, flags: DIFlagPrototyped, spFlags: 0)
!920 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !921, file: !757, line: 500)
!921 = !DISubprogram(name: "asinl", scope: !763, file: !763, line: 320, type: !769, flags: DIFlagPrototyped, spFlags: 0)
!922 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !923, file: !757, line: 501)
!923 = !DISubprogram(name: "atanl", scope: !763, file: !763, line: 324, type: !769, flags: DIFlagPrototyped, spFlags: 0)
!924 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !925, file: !757, line: 502)
!925 = !DISubprogram(name: "atan2l", scope: !763, file: !763, line: 328, type: !926, flags: DIFlagPrototyped, spFlags: 0)
!926 = !DISubroutineType(types: !927)
!927 = !{!256, !256, !256}
!928 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !929, file: !757, line: 503)
!929 = !DISubprogram(name: "ceill", scope: !763, file: !763, line: 463, type: !769, flags: DIFlagPrototyped, spFlags: 0)
!930 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !931, file: !757, line: 504)
!931 = !DISubprogram(name: "cosl", scope: !763, file: !763, line: 332, type: !769, flags: DIFlagPrototyped, spFlags: 0)
!932 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !933, file: !757, line: 505)
!933 = !DISubprogram(name: "coshl", scope: !763, file: !763, line: 356, type: !769, flags: DIFlagPrototyped, spFlags: 0)
!934 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !935, file: !757, line: 506)
!935 = !DISubprogram(name: "expl", scope: !763, file: !763, line: 368, type: !769, flags: DIFlagPrototyped, spFlags: 0)
!936 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !937, file: !757, line: 507)
!937 = !DISubprogram(name: "fabsl", scope: !763, file: !763, line: 424, type: !769, flags: DIFlagPrototyped, spFlags: 0)
!938 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !939, file: !757, line: 508)
!939 = !DISubprogram(name: "floorl", scope: !763, file: !763, line: 467, type: !769, flags: DIFlagPrototyped, spFlags: 0)
!940 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !941, file: !757, line: 509)
!941 = !DISubprogram(name: "fmodl", scope: !763, file: !763, line: 507, type: !926, flags: DIFlagPrototyped, spFlags: 0)
!942 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !943, file: !757, line: 510)
!943 = !DISubprogram(name: "frexpl", scope: !763, file: !763, line: 408, type: !944, flags: DIFlagPrototyped, spFlags: 0)
!944 = !DISubroutineType(types: !945)
!945 = !{!256, !256, !801}
!946 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !947, file: !757, line: 511)
!947 = !DISubprogram(name: "ldexpl", scope: !763, file: !763, line: 404, type: !948, flags: DIFlagPrototyped, spFlags: 0)
!948 = !DISubroutineType(types: !949)
!949 = !{!256, !256, !9}
!950 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !951, file: !757, line: 512)
!951 = !DISubprogram(name: "logl", scope: !763, file: !763, line: 380, type: !769, flags: DIFlagPrototyped, spFlags: 0)
!952 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !953, file: !757, line: 513)
!953 = !DISubprogram(name: "log10l", scope: !763, file: !763, line: 384, type: !769, flags: DIFlagPrototyped, spFlags: 0)
!954 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !955, file: !757, line: 514)
!955 = !DISubprogram(name: "modfl", scope: !763, file: !763, line: 400, type: !753, flags: DIFlagPrototyped, spFlags: 0)
!956 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !957, file: !757, line: 515)
!957 = !DISubprogram(name: "powl", scope: !763, file: !763, line: 436, type: !926, flags: DIFlagPrototyped, spFlags: 0)
!958 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !959, file: !757, line: 516)
!959 = !DISubprogram(name: "sinl", scope: !763, file: !763, line: 336, type: !769, flags: DIFlagPrototyped, spFlags: 0)
!960 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !961, file: !757, line: 517)
!961 = !DISubprogram(name: "sinhl", scope: !763, file: !763, line: 360, type: !769, flags: DIFlagPrototyped, spFlags: 0)
!962 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !963, file: !757, line: 518)
!963 = !DISubprogram(name: "sqrtl", scope: !763, file: !763, line: 440, type: !769, flags: DIFlagPrototyped, spFlags: 0)
!964 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !965, file: !757, line: 519)
!965 = !DISubprogram(name: "tanl", scope: !763, file: !763, line: 340, type: !769, flags: DIFlagPrototyped, spFlags: 0)
!966 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !967, file: !757, line: 521)
!967 = !DISubprogram(name: "tanhl", scope: !763, file: !763, line: 364, type: !769, flags: DIFlagPrototyped, spFlags: 0)
!968 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !969, file: !757, line: 522)
!969 = !DISubprogram(name: "acoshl", scope: !763, file: !763, line: 344, type: !769, flags: DIFlagPrototyped, spFlags: 0)
!970 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !971, file: !757, line: 523)
!971 = !DISubprogram(name: "asinhl", scope: !763, file: !763, line: 348, type: !769, flags: DIFlagPrototyped, spFlags: 0)
!972 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !973, file: !757, line: 524)
!973 = !DISubprogram(name: "atanhl", scope: !763, file: !763, line: 352, type: !769, flags: DIFlagPrototyped, spFlags: 0)
!974 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !975, file: !757, line: 525)
!975 = !DISubprogram(name: "cbrtl", scope: !763, file: !763, line: 428, type: !769, flags: DIFlagPrototyped, spFlags: 0)
!976 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !977, file: !757, line: 527)
!977 = !DISubprogram(name: "copysignl", scope: !763, file: !763, line: 519, type: !926, flags: DIFlagPrototyped, spFlags: 0)
!978 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !979, file: !757, line: 529)
!979 = !DISubprogram(name: "erfl", scope: !763, file: !763, line: 444, type: !769, flags: DIFlagPrototyped, spFlags: 0)
!980 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !981, file: !757, line: 530)
!981 = !DISubprogram(name: "erfcl", scope: !763, file: !763, line: 448, type: !769, flags: DIFlagPrototyped, spFlags: 0)
!982 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !983, file: !757, line: 531)
!983 = !DISubprogram(name: "exp2l", scope: !763, file: !763, line: 372, type: !769, flags: DIFlagPrototyped, spFlags: 0)
!984 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !985, file: !757, line: 532)
!985 = !DISubprogram(name: "expm1l", scope: !763, file: !763, line: 376, type: !769, flags: DIFlagPrototyped, spFlags: 0)
!986 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !987, file: !757, line: 533)
!987 = !DISubprogram(name: "fdiml", scope: !763, file: !763, line: 535, type: !926, flags: DIFlagPrototyped, spFlags: 0)
!988 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !989, file: !757, line: 534)
!989 = !DISubprogram(name: "fmal", scope: !763, file: !763, line: 547, type: !990, flags: DIFlagPrototyped, spFlags: 0)
!990 = !DISubroutineType(types: !991)
!991 = !{!256, !256, !256, !256}
!992 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !993, file: !757, line: 535)
!993 = !DISubprogram(name: "fmaxl", scope: !763, file: !763, line: 539, type: !926, flags: DIFlagPrototyped, spFlags: 0)
!994 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !995, file: !757, line: 536)
!995 = !DISubprogram(name: "fminl", scope: !763, file: !763, line: 543, type: !926, flags: DIFlagPrototyped, spFlags: 0)
!996 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !997, file: !757, line: 537)
!997 = !DISubprogram(name: "hypotl", scope: !763, file: !763, line: 432, type: !926, flags: DIFlagPrototyped, spFlags: 0)
!998 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !999, file: !757, line: 538)
!999 = !DISubprogram(name: "ilogbl", scope: !763, file: !763, line: 412, type: !1000, flags: DIFlagPrototyped, spFlags: 0)
!1000 = !DISubroutineType(types: !1001)
!1001 = !{!9, !256}
!1002 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1003, file: !757, line: 539)
!1003 = !DISubprogram(name: "lgammal", scope: !763, file: !763, line: 455, type: !769, flags: DIFlagPrototyped, spFlags: 0)
!1004 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1005, file: !757, line: 540)
!1005 = !DISubprogram(name: "llrintl", scope: !763, file: !763, line: 494, type: !1006, flags: DIFlagPrototyped, spFlags: 0)
!1006 = !DISubroutineType(types: !1007)
!1007 = !{!12, !256}
!1008 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1009, file: !757, line: 541)
!1009 = !DISubprogram(name: "llroundl", scope: !763, file: !763, line: 498, type: !1006, flags: DIFlagPrototyped, spFlags: 0)
!1010 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1011, file: !757, line: 542)
!1011 = !DISubprogram(name: "log1pl", scope: !763, file: !763, line: 392, type: !769, flags: DIFlagPrototyped, spFlags: 0)
!1012 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1013, file: !757, line: 543)
!1013 = !DISubprogram(name: "log2l", scope: !763, file: !763, line: 388, type: !769, flags: DIFlagPrototyped, spFlags: 0)
!1014 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1015, file: !757, line: 544)
!1015 = !DISubprogram(name: "logbl", scope: !763, file: !763, line: 396, type: !769, flags: DIFlagPrototyped, spFlags: 0)
!1016 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1017, file: !757, line: 545)
!1017 = !DISubprogram(name: "lrintl", scope: !763, file: !763, line: 479, type: !1018, flags: DIFlagPrototyped, spFlags: 0)
!1018 = !DISubroutineType(types: !1019)
!1019 = !{!242, !256}
!1020 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1021, file: !757, line: 546)
!1021 = !DISubprogram(name: "lroundl", scope: !763, file: !763, line: 487, type: !1018, flags: DIFlagPrototyped, spFlags: 0)
!1022 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1023, file: !757, line: 547)
!1023 = !DISubprogram(name: "nanl", scope: !763, file: !763, line: 523, type: !1024, flags: DIFlagPrototyped, spFlags: 0)
!1024 = !DISubroutineType(types: !1025)
!1025 = !{!256, !341}
!1026 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1027, file: !757, line: 548)
!1027 = !DISubprogram(name: "nearbyintl", scope: !763, file: !763, line: 471, type: !769, flags: DIFlagPrototyped, spFlags: 0)
!1028 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1029, file: !757, line: 549)
!1029 = !DISubprogram(name: "nextafterl", scope: !763, file: !763, line: 527, type: !926, flags: DIFlagPrototyped, spFlags: 0)
!1030 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1031, file: !757, line: 550)
!1031 = !DISubprogram(name: "nexttowardl", scope: !763, file: !763, line: 531, type: !926, flags: DIFlagPrototyped, spFlags: 0)
!1032 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1033, file: !757, line: 551)
!1033 = !DISubprogram(name: "remainderl", scope: !763, file: !763, line: 511, type: !926, flags: DIFlagPrototyped, spFlags: 0)
!1034 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1035, file: !757, line: 552)
!1035 = !DISubprogram(name: "remquol", scope: !763, file: !763, line: 515, type: !1036, flags: DIFlagPrototyped, spFlags: 0)
!1036 = !DISubroutineType(types: !1037)
!1037 = !{!256, !256, !256, !801}
!1038 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1039, file: !757, line: 553)
!1039 = !DISubprogram(name: "rintl", scope: !763, file: !763, line: 475, type: !769, flags: DIFlagPrototyped, spFlags: 0)
!1040 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1041, file: !757, line: 554)
!1041 = !DISubprogram(name: "roundl", scope: !763, file: !763, line: 483, type: !769, flags: DIFlagPrototyped, spFlags: 0)
!1042 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1043, file: !757, line: 555)
!1043 = !DISubprogram(name: "scalblnl", scope: !763, file: !763, line: 420, type: !1044, flags: DIFlagPrototyped, spFlags: 0)
!1044 = !DISubroutineType(types: !1045)
!1045 = !{!256, !256, !242}
!1046 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1047, file: !757, line: 556)
!1047 = !DISubprogram(name: "scalbnl", scope: !763, file: !763, line: 416, type: !948, flags: DIFlagPrototyped, spFlags: 0)
!1048 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1049, file: !757, line: 557)
!1049 = !DISubprogram(name: "tgammal", scope: !763, file: !763, line: 459, type: !769, flags: DIFlagPrototyped, spFlags: 0)
!1050 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1051, file: !757, line: 558)
!1051 = !DISubprogram(name: "truncl", scope: !763, file: !763, line: 503, type: !769, flags: DIFlagPrototyped, spFlags: 0)
!1052 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !1053, entity: !1054, file: !1056, line: 536)
!1053 = !DINamespace(name: "chrono", scope: !183)
!1054 = !DINamespace(name: "chrono_literals", scope: !1055, exportSymbols: true)
!1055 = !DINamespace(name: "literals", scope: !183, exportSymbols: true)
!1056 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__chrono/duration.h", directory: "")
!1057 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1058, file: !1061, line: 68)
!1058 = !DIDerivedType(tag: DW_TAG_typedef, name: "clock_t", file: !1059, line: 31, baseType: !1060)
!1059 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_clock_t.h", directory: "", checksumkind: CSK_MD5, checksum: "757b93ac72874f074e33ca41b7ee521d")
!1060 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_clock_t", file: !241, line: 116, baseType: !246)
!1061 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/ctime", directory: "")
!1062 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1063, file: !1061, line: 69)
!1063 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !1064, line: 31, baseType: !1065)
!1064 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_time_t.h", directory: "", checksumkind: CSK_MD5, checksum: "ddc110fab0813d27960d5c9aaba0ed4f")
!1065 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_time_t", file: !241, line: 119, baseType: !242)
!1066 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !370, file: !1061, line: 70)
!1067 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1068, file: !1061, line: 74)
!1068 = !DISubprogram(name: "clock", linkageName: "\01_clock", scope: !371, file: !371, line: 112, type: !1069, flags: DIFlagPrototyped, spFlags: 0)
!1069 = !DISubroutineType(types: !1070)
!1070 = !{!1058}
!1071 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1072, file: !1061, line: 75)
!1072 = !DISubprogram(name: "difftime", scope: !371, file: !371, line: 114, type: !1073, flags: DIFlagPrototyped, spFlags: 0)
!1073 = !DISubroutineType(types: !1074)
!1074 = !{!512, !1063, !1063}
!1075 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1076, file: !1061, line: 76)
!1076 = !DISubprogram(name: "mktime", linkageName: "\01_mktime", scope: !371, file: !371, line: 118, type: !1077, flags: DIFlagPrototyped, spFlags: 0)
!1077 = !DISubroutineType(types: !1078)
!1078 = !{!1063, !1079}
!1079 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !370, size: 64)
!1080 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1081, file: !1061, line: 77)
!1081 = !DISubprogram(name: "time", scope: !371, file: !371, line: 121, type: !1082, flags: DIFlagPrototyped, spFlags: 0)
!1082 = !DISubroutineType(types: !1083)
!1083 = !{!1063, !1084}
!1084 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1063, size: 64)
!1085 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1086, file: !1061, line: 78)
!1086 = !DISubprogram(name: "asctime", scope: !371, file: !371, line: 111, type: !1087, flags: DIFlagPrototyped, spFlags: 0)
!1087 = !DISubroutineType(types: !1088)
!1088 = !{!384, !606}
!1089 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1090, file: !1061, line: 79)
!1090 = !DISubprogram(name: "ctime", scope: !371, file: !371, line: 113, type: !1091, flags: DIFlagPrototyped, spFlags: 0)
!1091 = !DISubroutineType(types: !1092)
!1092 = !{!384, !1093}
!1093 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1094, size: 64)
!1094 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1063)
!1095 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1096, file: !1061, line: 80)
!1096 = !DISubprogram(name: "gmtime", scope: !371, file: !371, line: 116, type: !1097, flags: DIFlagPrototyped, spFlags: 0)
!1097 = !DISubroutineType(types: !1098)
!1098 = !{!1079, !1093}
!1099 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1100, file: !1061, line: 81)
!1100 = !DISubprogram(name: "localtime", scope: !371, file: !371, line: 117, type: !1097, flags: DIFlagPrototyped, spFlags: 0)
!1101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1102, file: !1061, line: 82)
!1102 = !DISubprogram(name: "strftime", linkageName: "\01_strftime", scope: !371, file: !371, line: 119, type: !1103, flags: DIFlagPrototyped, spFlags: 0)
!1103 = !DISubroutineType(types: !1104)
!1104 = !{!457, !384, !457, !341, !606}
!1105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1106, file: !1112, line: 106)
!1106 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !1107, line: 105, baseType: !1108)
!1107 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "17a3e5580239ce2f2af260c9c943ad9b")
!1108 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1107, line: 102, size: 64, flags: DIFlagTypePassByValue, elements: !1109, identifier: "_ZTS5div_t")
!1109 = !{!1110, !1111}
!1110 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !1108, file: !1107, line: 103, baseType: !9, size: 32)
!1111 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !1108, file: !1107, line: 104, baseType: !9, size: 32, offset: 32)
!1112 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdlib", directory: "")
!1113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1114, file: !1112, line: 107)
!1114 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !1107, line: 110, baseType: !1115)
!1115 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1107, line: 107, size: 128, flags: DIFlagTypePassByValue, elements: !1116, identifier: "_ZTS6ldiv_t")
!1116 = !{!1117, !1118}
!1117 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !1115, file: !1107, line: 108, baseType: !242, size: 64)
!1118 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !1115, file: !1107, line: 109, baseType: !242, size: 64, offset: 64)
!1119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1120, file: !1112, line: 108)
!1120 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !1107, line: 116, baseType: !1121)
!1121 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1107, line: 113, size: 128, flags: DIFlagTypePassByValue, elements: !1122, identifier: "_ZTS7lldiv_t")
!1122 = !{!1123, !1124}
!1123 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !1121, file: !1107, line: 114, baseType: !12, size: 64)
!1124 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !1121, file: !1107, line: 115, baseType: !12, size: 64, offset: 64)
!1125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1126, file: !1112, line: 109)
!1126 = !DISubprogram(name: "atof", scope: !1107, file: !1107, line: 149, type: !884, flags: DIFlagPrototyped, spFlags: 0)
!1127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1128, file: !1112, line: 110)
!1128 = !DISubprogram(name: "atoi", scope: !1107, file: !1107, line: 150, type: !1129, flags: DIFlagPrototyped, spFlags: 0)
!1129 = !DISubroutineType(types: !1130)
!1130 = !{!9, !341}
!1131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1132, file: !1112, line: 111)
!1132 = !DISubprogram(name: "atol", scope: !1107, file: !1107, line: 151, type: !1133, flags: DIFlagPrototyped, spFlags: 0)
!1133 = !DISubroutineType(types: !1134)
!1134 = !{!242, !341}
!1135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1136, file: !1112, line: 112)
!1136 = !DISubprogram(name: "atoll", scope: !1107, file: !1107, line: 154, type: !1137, flags: DIFlagPrototyped, spFlags: 0)
!1137 = !DISubroutineType(types: !1138)
!1138 = !{!12, !341}
!1139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1140, file: !1112, line: 113)
!1140 = !DISubprogram(name: "strtod", linkageName: "\01_strtod", scope: !1107, file: !1107, line: 184, type: !1141, flags: DIFlagPrototyped, spFlags: 0)
!1141 = !DISubroutineType(types: !1142)
!1142 = !{!512, !341, !1143}
!1143 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !384, size: 64)
!1144 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1145, file: !1112, line: 114)
!1145 = !DISubprogram(name: "strtof", linkageName: "\01_strtof", scope: !1107, file: !1107, line: 185, type: !1146, flags: DIFlagPrototyped, spFlags: 0)
!1146 = !DISubroutineType(types: !1147)
!1147 = !{!518, !341, !1143}
!1148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1149, file: !1112, line: 115)
!1149 = !DISubprogram(name: "strtold", scope: !1107, file: !1107, line: 188, type: !1150, flags: DIFlagPrototyped, spFlags: 0)
!1150 = !DISubroutineType(types: !1151)
!1151 = !{!256, !341, !1143}
!1152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1153, file: !1112, line: 116)
!1153 = !DISubprogram(name: "strtol", scope: !1107, file: !1107, line: 186, type: !1154, flags: DIFlagPrototyped, spFlags: 0)
!1154 = !DISubroutineType(types: !1155)
!1155 = !{!242, !341, !1143, !9}
!1156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1157, file: !1112, line: 117)
!1157 = !DISubprogram(name: "strtoll", scope: !1107, file: !1107, line: 191, type: !1158, flags: DIFlagPrototyped, spFlags: 0)
!1158 = !DISubroutineType(types: !1159)
!1159 = !{!12, !341, !1143, !9}
!1160 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1161, file: !1112, line: 118)
!1161 = !DISubprogram(name: "strtoul", scope: !1107, file: !1107, line: 194, type: !1162, flags: DIFlagPrototyped, spFlags: 0)
!1162 = !DISubroutineType(types: !1163)
!1163 = !{!246, !341, !1143, !9}
!1164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1165, file: !1112, line: 119)
!1165 = !DISubprogram(name: "strtoull", scope: !1107, file: !1107, line: 197, type: !1166, flags: DIFlagPrototyped, spFlags: 0)
!1166 = !DISubroutineType(types: !1167)
!1167 = !{!203, !341, !1143, !9}
!1168 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1169, file: !1112, line: 120)
!1169 = !DISubprogram(name: "rand", scope: !1107, file: !1107, line: 181, type: !1170, flags: DIFlagPrototyped, spFlags: 0)
!1170 = !DISubroutineType(types: !1171)
!1171 = !{!9}
!1172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1173, file: !1112, line: 121)
!1173 = !DISubprogram(name: "srand", scope: !1107, file: !1107, line: 183, type: !1174, flags: DIFlagPrototyped, spFlags: 0)
!1174 = !DISubroutineType(types: !1175)
!1175 = !{null, !199}
!1176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1177, file: !1112, line: 122)
!1177 = !DISubprogram(name: "calloc", scope: !1178, file: !1178, line: 55, type: !1179, flags: DIFlagPrototyped, spFlags: 0)
!1178 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/malloc/_malloc.h", directory: "", checksumkind: CSK_MD5, checksum: "169c9ed8662627a4a4d92e321cfa866c")
!1179 = !DISubroutineType(types: !1180)
!1180 = !{!404, !457, !457}
!1181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1182, file: !1112, line: 123)
!1182 = !DISubprogram(name: "free", scope: !1178, file: !1178, line: 56, type: !1183, flags: DIFlagPrototyped, spFlags: 0)
!1183 = !DISubroutineType(types: !1184)
!1184 = !{null, !404}
!1185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1186, file: !1112, line: 124)
!1186 = !DISubprogram(name: "malloc", scope: !1178, file: !1178, line: 54, type: !1187, flags: DIFlagPrototyped, spFlags: 0)
!1187 = !DISubroutineType(types: !1188)
!1188 = !{!404, !457}
!1189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1190, file: !1112, line: 125)
!1190 = !DISubprogram(name: "realloc", scope: !1178, file: !1178, line: 57, type: !1191, flags: DIFlagPrototyped, spFlags: 0)
!1191 = !DISubroutineType(types: !1192)
!1192 = !{!404, !404, !457}
!1193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1194, file: !1112, line: 126)
!1194 = !DISubprogram(name: "abort", scope: !1195, file: !1195, line: 33, type: !1196, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1195 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_abort.h", directory: "", checksumkind: CSK_MD5, checksum: "b8994a53d49770cf67adab87821b3fcb")
!1196 = !DISubroutineType(types: !1197)
!1197 = !{null}
!1198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1199, file: !1112, line: 127)
!1199 = !DISubprogram(name: "atexit", scope: !1107, file: !1107, line: 144, type: !1200, flags: DIFlagPrototyped, spFlags: 0)
!1200 = !DISubroutineType(types: !1201)
!1201 = !{!9, !1202}
!1202 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1196, size: 64)
!1203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1204, file: !1112, line: 128)
!1204 = !DISubprogram(name: "exit", scope: !1107, file: !1107, line: 160, type: !1205, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1205 = !DISubroutineType(types: !1206)
!1206 = !{null, !9}
!1207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1208, file: !1112, line: 129)
!1208 = !DISubprogram(name: "_Exit", scope: !1107, file: !1107, line: 210, type: !1205, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1210, file: !1112, line: 130)
!1210 = !DISubprogram(name: "getenv", scope: !1107, file: !1107, line: 162, type: !1211, flags: DIFlagPrototyped, spFlags: 0)
!1211 = !DISubroutineType(types: !1212)
!1212 = !{!384, !341}
!1213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1214, file: !1112, line: 131)
!1214 = !DISubprogram(name: "system", linkageName: "\01_system", scope: !1107, file: !1107, line: 203, type: !1129, flags: DIFlagPrototyped, spFlags: 0)
!1215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1216, file: !1112, line: 132)
!1216 = !DISubprogram(name: "bsearch", scope: !1107, file: !1107, line: 156, type: !1217, flags: DIFlagPrototyped, spFlags: 0)
!1217 = !DISubroutineType(types: !1218)
!1218 = !{!404, !668, !668, !457, !457, !1219}
!1219 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1220, size: 64)
!1220 = !DISubroutineType(types: !1221)
!1221 = !{!9, !668, !668}
!1222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1223, file: !1112, line: 133)
!1223 = !DISubprogram(name: "qsort", scope: !1107, file: !1107, line: 175, type: !1224, flags: DIFlagPrototyped, spFlags: 0)
!1224 = !DISubroutineType(types: !1225)
!1225 = !{null, !404, !457, !457, !1219}
!1226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !767, file: !1112, line: 134)
!1227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1228, file: !1112, line: 135)
!1228 = !DISubprogram(name: "labs", scope: !1107, file: !1107, line: 163, type: !1229, flags: DIFlagPrototyped, spFlags: 0)
!1229 = !DISubroutineType(types: !1230)
!1230 = !{!242, !242}
!1231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1232, file: !1112, line: 136)
!1232 = !DISubprogram(name: "llabs", scope: !1107, file: !1107, line: 167, type: !1233, flags: DIFlagPrototyped, spFlags: 0)
!1233 = !DISubroutineType(types: !1234)
!1234 = !{!12, !12}
!1235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1236, file: !1112, line: 137)
!1236 = !DISubprogram(name: "div", linkageName: "_Z3divB8ne200100xx", scope: !768, file: !768, line: 143, type: !1237, flags: DIFlagPrototyped, spFlags: 0)
!1237 = !DISubroutineType(types: !1238)
!1238 = !{!1120, !12, !12}
!1239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1240, file: !1112, line: 138)
!1240 = !DISubprogram(name: "ldiv", scope: !1107, file: !1107, line: 164, type: !1241, flags: DIFlagPrototyped, spFlags: 0)
!1241 = !DISubroutineType(types: !1242)
!1242 = !{!1114, !242, !242}
!1243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1244, file: !1112, line: 139)
!1244 = !DISubprogram(name: "lldiv", scope: !1107, file: !1107, line: 168, type: !1237, flags: DIFlagPrototyped, spFlags: 0)
!1245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1246, file: !1112, line: 140)
!1246 = !DISubprogram(name: "mblen", scope: !1107, file: !1107, line: 171, type: !1247, flags: DIFlagPrototyped, spFlags: 0)
!1247 = !DISubroutineType(types: !1248)
!1248 = !{!9, !341, !457}
!1249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1250, file: !1112, line: 142)
!1250 = !DISubprogram(name: "mbtowc", scope: !1107, file: !1107, line: 173, type: !1251, flags: DIFlagPrototyped, spFlags: 0)
!1251 = !DISubroutineType(types: !1252)
!1252 = !{!9, !456, !341, !457}
!1253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1254, file: !1112, line: 143)
!1254 = !DISubprogram(name: "wctomb", scope: !1107, file: !1107, line: 207, type: !1255, flags: DIFlagPrototyped, spFlags: 0)
!1255 = !DISubroutineType(types: !1256)
!1256 = !{!9, !384, !449}
!1257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1258, file: !1112, line: 144)
!1258 = !DISubprogram(name: "mbstowcs", scope: !1107, file: !1107, line: 172, type: !1259, flags: DIFlagPrototyped, spFlags: 0)
!1259 = !DISubroutineType(types: !1260)
!1260 = !{!457, !456, !341, !457}
!1261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1262, file: !1112, line: 145)
!1262 = !DISubprogram(name: "wcstombs", scope: !1107, file: !1107, line: 206, type: !1263, flags: DIFlagPrototyped, spFlags: 0)
!1263 = !DISubroutineType(types: !1264)
!1264 = !{!457, !384, !447, !457}
!1265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1266, file: !1112, line: 148)
!1266 = !DISubprogram(name: "at_quick_exit", scope: !1107, file: !1107, line: 147, type: !1200, flags: DIFlagPrototyped, spFlags: 0)
!1267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1268, file: !1112, line: 149)
!1268 = !DISubprogram(name: "quick_exit", scope: !1107, file: !1107, line: 179, type: !1205, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !357, file: !1270, line: 25)
!1270 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__std_mbstate_t.h", directory: "")
!1271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !387, file: !1272, line: 120)
!1272 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdio", directory: "")
!1273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !417, file: !1272, line: 121)
!1274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1275, file: !1272, line: 123)
!1275 = !DISubprogram(name: "fclose", scope: !388, file: !388, line: 233, type: !1276, flags: DIFlagPrototyped, spFlags: 0)
!1276 = !DISubroutineType(types: !1277)
!1277 = !{!9, !446}
!1278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1279, file: !1272, line: 124)
!1279 = !DISubprogram(name: "fflush", scope: !388, file: !388, line: 236, type: !1276, flags: DIFlagPrototyped, spFlags: 0)
!1280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1281, file: !1272, line: 125)
!1281 = !DISubprogram(name: "setbuf", scope: !388, file: !388, line: 272, type: !1282, flags: DIFlagPrototyped, spFlags: 0)
!1282 = !DISubroutineType(types: !1283)
!1283 = !{null, !446, !384}
!1284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1285, file: !1272, line: 126)
!1285 = !DISubprogram(name: "setvbuf", scope: !388, file: !388, line: 273, type: !1286, flags: DIFlagPrototyped, spFlags: 0)
!1286 = !DISubroutineType(types: !1287)
!1287 = !{!9, !446, !384, !9, !457}
!1288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1289, file: !1272, line: 127)
!1289 = !DISubprogram(name: "fprintf", scope: !388, file: !388, line: 245, type: !1290, flags: DIFlagPrototyped, spFlags: 0)
!1290 = !DISubroutineType(types: !1291)
!1291 = !{!9, !446, !341, null}
!1292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1293, file: !1272, line: 128)
!1293 = !DISubprogram(name: "fscanf", scope: !388, file: !388, line: 251, type: !1290, flags: DIFlagPrototyped, spFlags: 0)
!1294 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1295, file: !1272, line: 129)
!1295 = !DISubprogram(name: "snprintf", scope: !388, file: !388, line: 435, type: !1296, flags: DIFlagPrototyped, spFlags: 0)
!1296 = !DISubroutineType(types: !1297)
!1297 = !{!9, !384, !457, !341, null}
!1298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1299, file: !1272, line: 130)
!1299 = !DISubprogram(name: "sprintf", scope: !388, file: !388, line: 280, type: !1300, flags: DIFlagPrototyped, spFlags: 0)
!1300 = !DISubroutineType(types: !1301)
!1301 = !{!9, !384, !341, null}
!1302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1303, file: !1272, line: 131)
!1303 = !DISubprogram(name: "sscanf", scope: !388, file: !388, line: 282, type: !1304, flags: DIFlagPrototyped, spFlags: 0)
!1304 = !DISubroutineType(types: !1305)
!1305 = !{!9, !341, !341, null}
!1306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1307, file: !1272, line: 132)
!1307 = !DISubprogram(name: "vfprintf", scope: !388, file: !388, line: 292, type: !1308, flags: DIFlagPrototyped, spFlags: 0)
!1308 = !DISubroutineType(types: !1309)
!1309 = !{!9, !446, !341, !1310}
!1310 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !1311, line: 44, baseType: !464)
!1311 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_va_list.h", directory: "", checksumkind: CSK_MD5, checksum: "41825c2dccdd98a1587ce428cded44de")
!1312 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1313, file: !1272, line: 133)
!1313 = !DISubprogram(name: "vfscanf", scope: !388, file: !388, line: 436, type: !1308, flags: DIFlagPrototyped, spFlags: 0)
!1314 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1315, file: !1272, line: 134)
!1315 = !DISubprogram(name: "vsscanf", scope: !388, file: !388, line: 439, type: !1316, flags: DIFlagPrototyped, spFlags: 0)
!1316 = !DISubroutineType(types: !1317)
!1317 = !{!9, !341, !341, !1310}
!1318 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1319, file: !1272, line: 135)
!1319 = !DISubprogram(name: "vsnprintf", scope: !388, file: !388, line: 438, type: !1320, flags: DIFlagPrototyped, spFlags: 0)
!1320 = !DISubroutineType(types: !1321)
!1321 = !{!9, !384, !457, !341, !1310}
!1322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1323, file: !1272, line: 136)
!1323 = !DISubprogram(name: "vsprintf", scope: !388, file: !388, line: 300, type: !1324, flags: DIFlagPrototyped, spFlags: 0)
!1324 = !DISubroutineType(types: !1325)
!1325 = !{!9, !384, !341, !1310}
!1326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1327, file: !1272, line: 137)
!1327 = !DISubprogram(name: "fgetc", scope: !388, file: !388, line: 237, type: !1276, flags: DIFlagPrototyped, spFlags: 0)
!1328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1329, file: !1272, line: 138)
!1329 = !DISubprogram(name: "fgets", scope: !388, file: !388, line: 239, type: !1330, flags: DIFlagPrototyped, spFlags: 0)
!1330 = !DISubroutineType(types: !1331)
!1331 = !{!384, !384, !9, !446}
!1332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1333, file: !1272, line: 139)
!1333 = !DISubprogram(name: "fputc", scope: !388, file: !388, line: 246, type: !1334, flags: DIFlagPrototyped, spFlags: 0)
!1334 = !DISubroutineType(types: !1335)
!1335 = !{!9, !9, !446}
!1336 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1337, file: !1272, line: 140)
!1337 = !DISubprogram(name: "fputs", linkageName: "\01_fputs", scope: !388, file: !388, line: 247, type: !1338, flags: DIFlagPrototyped, spFlags: 0)
!1338 = !DISubroutineType(types: !1339)
!1339 = !{!9, !341, !446}
!1340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1341, file: !1272, line: 141)
!1341 = !DISubprogram(name: "getc", scope: !388, file: !388, line: 256, type: !1276, flags: DIFlagPrototyped, spFlags: 0)
!1342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1343, file: !1272, line: 142)
!1343 = !DISubprogram(name: "putc", scope: !388, file: !388, line: 265, type: !1334, flags: DIFlagPrototyped, spFlags: 0)
!1344 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1345, file: !1272, line: 143)
!1345 = !DISubprogram(name: "ungetc", scope: !388, file: !388, line: 291, type: !1334, flags: DIFlagPrototyped, spFlags: 0)
!1346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1347, file: !1272, line: 144)
!1347 = !DISubprogram(name: "fread", scope: !388, file: !388, line: 248, type: !1348, flags: DIFlagPrototyped, spFlags: 0)
!1348 = !DISubroutineType(types: !1349)
!1349 = !{!457, !404, !457, !457, !446}
!1350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1351, file: !1272, line: 145)
!1351 = !DISubprogram(name: "fwrite", linkageName: "\01_fwrite", scope: !388, file: !388, line: 255, type: !1352, flags: DIFlagPrototyped, spFlags: 0)
!1352 = !DISubroutineType(types: !1353)
!1353 = !{!457, !668, !457, !457, !446}
!1354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1355, file: !1272, line: 146)
!1355 = !DISubprogram(name: "fgetpos", scope: !388, file: !388, line: 238, type: !1356, flags: DIFlagPrototyped, spFlags: 0)
!1356 = !DISubroutineType(types: !1357)
!1357 = !{!9, !446, !1358}
!1358 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !417, size: 64)
!1359 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1360, file: !1272, line: 147)
!1360 = !DISubprogram(name: "fseek", scope: !388, file: !388, line: 252, type: !1361, flags: DIFlagPrototyped, spFlags: 0)
!1361 = !DISubroutineType(types: !1362)
!1362 = !{!9, !446, !242, !9}
!1363 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1364, file: !1272, line: 148)
!1364 = !DISubprogram(name: "fsetpos", scope: !388, file: !388, line: 253, type: !1365, flags: DIFlagPrototyped, spFlags: 0)
!1365 = !DISubroutineType(types: !1366)
!1366 = !{!9, !446, !1367}
!1367 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1368, size: 64)
!1368 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !417)
!1369 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1370, file: !1272, line: 149)
!1370 = !DISubprogram(name: "ftell", scope: !388, file: !388, line: 254, type: !1371, flags: DIFlagPrototyped, spFlags: 0)
!1371 = !DISubroutineType(types: !1372)
!1372 = !{!242, !446}
!1373 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1374, file: !1272, line: 150)
!1374 = !DISubprogram(name: "rewind", scope: !388, file: !388, line: 270, type: !1375, flags: DIFlagPrototyped, spFlags: 0)
!1375 = !DISubroutineType(types: !1376)
!1376 = !{null, !446}
!1377 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1378, file: !1272, line: 151)
!1378 = !DISubprogram(name: "clearerr", scope: !388, file: !388, line: 232, type: !1375, flags: DIFlagPrototyped, spFlags: 0)
!1379 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1380, file: !1272, line: 152)
!1380 = !DISubprogram(name: "feof", scope: !388, file: !388, line: 234, type: !1276, flags: DIFlagPrototyped, spFlags: 0)
!1381 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1382, file: !1272, line: 153)
!1382 = !DISubprogram(name: "ferror", scope: !388, file: !388, line: 235, type: !1276, flags: DIFlagPrototyped, spFlags: 0)
!1383 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1384, file: !1272, line: 154)
!1384 = !DISubprogram(name: "perror", scope: !388, file: !388, line: 264, type: !1385, flags: DIFlagPrototyped, spFlags: 0)
!1385 = !DISubroutineType(types: !1386)
!1386 = !{null, !341}
!1387 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1388, file: !1272, line: 156)
!1388 = !DISubprogram(name: "fopen", linkageName: "\01_fopen", scope: !388, file: !388, line: 243, type: !1389, flags: DIFlagPrototyped, spFlags: 0)
!1389 = !DISubroutineType(types: !1390)
!1390 = !{!446, !341, !341}
!1391 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1392, file: !1272, line: 157)
!1392 = !DISubprogram(name: "freopen", linkageName: "\01_freopen", scope: !388, file: !388, line: 249, type: !1393, flags: DIFlagPrototyped, spFlags: 0)
!1393 = !DISubroutineType(types: !1394)
!1394 = !{!446, !341, !341, !446}
!1395 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1396, file: !1272, line: 158)
!1396 = !DISubprogram(name: "remove", scope: !388, file: !388, line: 268, type: !1129, flags: DIFlagPrototyped, spFlags: 0)
!1397 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1398, file: !1272, line: 159)
!1398 = !DISubprogram(name: "rename", scope: !388, file: !388, line: 269, type: !691, flags: DIFlagPrototyped, spFlags: 0)
!1399 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1400, file: !1272, line: 160)
!1400 = !DISubprogram(name: "tmpfile", scope: !388, file: !388, line: 283, type: !1401, flags: DIFlagPrototyped, spFlags: 0)
!1401 = !DISubroutineType(types: !1402)
!1402 = !{!446}
!1403 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1404, file: !1272, line: 161)
!1404 = !DISubprogram(name: "tmpnam", scope: !388, file: !388, line: 289, type: !1405, flags: DIFlagPrototyped, spFlags: 0)
!1405 = !DISubroutineType(types: !1406)
!1406 = !{!384, !384}
!1407 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1408, file: !1272, line: 163)
!1408 = !DISubprogram(name: "getchar", scope: !388, file: !388, line: 257, type: !1170, flags: DIFlagPrototyped, spFlags: 0)
!1409 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1410, file: !1272, line: 167)
!1410 = !DISubprogram(name: "scanf", scope: !388, file: !388, line: 271, type: !1411, flags: DIFlagPrototyped, spFlags: 0)
!1411 = !DISubroutineType(types: !1412)
!1412 = !{!9, !341, null}
!1413 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1414, file: !1272, line: 168)
!1414 = !DISubprogram(name: "vscanf", scope: !388, file: !388, line: 437, type: !1415, flags: DIFlagPrototyped, spFlags: 0)
!1415 = !DISubroutineType(types: !1416)
!1416 = !{!9, !341, !1310}
!1417 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1418, file: !1272, line: 170)
!1418 = !DISubprogram(name: "printf", scope: !1419, file: !1419, line: 34, type: !1411, flags: DIFlagPrototyped, spFlags: 0)
!1419 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_printf.h", directory: "", checksumkind: CSK_MD5, checksum: "2d37517bd0342aa326aa1d3660ad4ab4")
!1420 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1421, file: !1272, line: 171)
!1421 = !DISubprogram(name: "putchar", scope: !388, file: !388, line: 266, type: !261, flags: DIFlagPrototyped, spFlags: 0)
!1422 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1423, file: !1272, line: 172)
!1423 = !DISubprogram(name: "puts", scope: !388, file: !388, line: 267, type: !1129, flags: DIFlagPrototyped, spFlags: 0)
!1424 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !183, entity: !1425, file: !1272, line: 173)
!1425 = !DISubprogram(name: "vprintf", scope: !388, file: !388, line: 293, type: !1415, flags: DIFlagPrototyped, spFlags: 0)
!1426 = !DICompositeType(tag: DW_TAG_array_type, baseType: !1427, size: 24000, elements: !1434)
!1427 = !DIDerivedType(tag: DW_TAG_typedef, name: "dl_index", file: !19, line: 203, baseType: !1428)
!1428 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !19, line: 197, size: 48, flags: DIFlagTypePassByValue, elements: !1429, identifier: "_ZTS8dl_index")
!1429 = !{!1430, !1431, !1432, !1433}
!1430 = !DIDerivedType(tag: DW_TAG_member, name: "segnum", scope: !1428, file: !19, line: 199, baseType: !23, size: 16)
!1431 = !DIDerivedType(tag: DW_TAG_member, name: "sidenum", scope: !1428, file: !19, line: 200, baseType: !25, size: 8, offset: 16)
!1432 = !DIDerivedType(tag: DW_TAG_member, name: "count", scope: !1428, file: !19, line: 201, baseType: !25, size: 8, offset: 24)
!1433 = !DIDerivedType(tag: DW_TAG_member, name: "index", scope: !1428, file: !19, line: 202, baseType: !23, size: 16, offset: 32)
!1434 = !{!1435}
!1435 = !DISubrange(count: 500)
!1436 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 4]}
!1437 = !{i32 7, !"Dwarf Version", i32 5}
!1438 = !{i32 2, !"Debug Info Version", i32 3}
!1439 = !{i32 1, !"wchar_size", i32 4}
!1440 = !{i32 8, !"PIC Level", i32 2}
!1441 = !{i32 7, !"uwtable", i32 1}
!1442 = !{i32 7, !"frame-pointer", i32 1}
!1443 = !{!"Homebrew clang version 20.1.8"}
!1444 = distinct !DISubprogram(name: "compute_center_point_on_side", linkageName: "_Z28compute_center_point_on_sideP10vms_vectorP7segmenti", scope: !16, file: !16, line: 52, type: !1445, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!1445 = !DISubroutineType(types: !1446)
!1446 = !{null, !1447, !1455, !9}
!1447 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1448, size: 64)
!1448 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_vector", file: !1449, line: 22, baseType: !1450)
!1449 = !DIFile(filename: "./vecmat/vecmat.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "dfa84e3325c1ea4f5f74699fff5ef2bf")
!1450 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_vector", file: !1449, line: 19, size: 96, flags: DIFlagTypePassByValue, elements: !1451, identifier: "_ZTS10vms_vector")
!1451 = !{!1452, !1453, !1454}
!1452 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1450, file: !1449, line: 21, baseType: !5, size: 32)
!1453 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1450, file: !1449, line: 21, baseType: !5, size: 32, offset: 32)
!1454 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1450, file: !1449, line: 21, baseType: !5, size: 32, offset: 64)
!1455 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1456, size: 64)
!1456 = !DIDerivedType(tag: DW_TAG_typedef, name: "segment", file: !19, line: 123, baseType: !1457)
!1457 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "segment", file: !19, line: 100, size: 4096, flags: DIFlagTypePassByValue, elements: !1458, identifier: "_ZTS7segment")
!1458 = !{!1459, !1483, !1485, !1487}
!1459 = !DIDerivedType(tag: DW_TAG_member, name: "sides", scope: !1457, file: !19, line: 105, baseType: !1460, size: 3840)
!1460 = !DICompositeType(tag: DW_TAG_array_type, baseType: !1461, size: 3840, elements: !1481)
!1461 = !DIDerivedType(tag: DW_TAG_typedef, name: "side", file: !19, line: 91, baseType: !1462)
!1462 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "side", file: !19, line: 82, size: 640, flags: DIFlagTypePassByValue, elements: !1463, identifier: "_ZTS4side")
!1463 = !{!1464, !1465, !1466, !1467, !1468, !1469, !1477}
!1464 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !1462, file: !19, line: 84, baseType: !25, size: 8)
!1465 = !DIDerivedType(tag: DW_TAG_member, name: "pad", scope: !1462, file: !19, line: 85, baseType: !31, size: 8, offset: 8)
!1466 = !DIDerivedType(tag: DW_TAG_member, name: "wall_num", scope: !1462, file: !19, line: 86, baseType: !23, size: 16, offset: 16)
!1467 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_num", scope: !1462, file: !19, line: 87, baseType: !23, size: 16, offset: 32)
!1468 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_num2", scope: !1462, file: !19, line: 88, baseType: !23, size: 16, offset: 48)
!1469 = !DIDerivedType(tag: DW_TAG_member, name: "uvls", scope: !1462, file: !19, line: 89, baseType: !1470, size: 384, offset: 64)
!1470 = !DICompositeType(tag: DW_TAG_array_type, baseType: !1471, size: 384, elements: !34)
!1471 = !DIDerivedType(tag: DW_TAG_typedef, name: "uvl", file: !19, line: 67, baseType: !1472)
!1472 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uvl", file: !19, line: 64, size: 96, flags: DIFlagTypePassByValue, elements: !1473, identifier: "_ZTS3uvl")
!1473 = !{!1474, !1475, !1476}
!1474 = !DIDerivedType(tag: DW_TAG_member, name: "u", scope: !1472, file: !19, line: 66, baseType: !5, size: 32)
!1475 = !DIDerivedType(tag: DW_TAG_member, name: "v", scope: !1472, file: !19, line: 66, baseType: !5, size: 32, offset: 32)
!1476 = !DIDerivedType(tag: DW_TAG_member, name: "l", scope: !1472, file: !19, line: 66, baseType: !5, size: 32, offset: 64)
!1477 = !DIDerivedType(tag: DW_TAG_member, name: "normals", scope: !1462, file: !19, line: 90, baseType: !1478, size: 192, offset: 448)
!1478 = !DICompositeType(tag: DW_TAG_array_type, baseType: !1448, size: 192, elements: !1479)
!1479 = !{!1480}
!1480 = !DISubrange(count: 2)
!1481 = !{!1482}
!1482 = !DISubrange(count: 6)
!1483 = !DIDerivedType(tag: DW_TAG_member, name: "children", scope: !1457, file: !19, line: 106, baseType: !1484, size: 96, offset: 3840)
!1484 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 96, elements: !1481)
!1485 = !DIDerivedType(tag: DW_TAG_member, name: "verts", scope: !1457, file: !19, line: 107, baseType: !1486, size: 128, offset: 3936)
!1486 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 128, elements: !143)
!1487 = !DIDerivedType(tag: DW_TAG_member, name: "objects", scope: !1457, file: !19, line: 112, baseType: !9, size: 32, offset: 4064)
!1488 = !{}
!1489 = !DILocalVariable(name: "vp", arg: 1, scope: !1444, file: !16, line: 52, type: !1447)
!1490 = !DILocation(line: 52, column: 47, scope: !1444)
!1491 = !DILocalVariable(name: "sp", arg: 2, scope: !1444, file: !16, line: 52, type: !1455)
!1492 = !DILocation(line: 52, column: 59, scope: !1444)
!1493 = !DILocalVariable(name: "side", arg: 3, scope: !1444, file: !16, line: 52, type: !9)
!1494 = !DILocation(line: 52, column: 66, scope: !1444)
!1495 = !DILocalVariable(name: "v", scope: !1444, file: !16, line: 69, type: !9)
!1496 = !DILocation(line: 69, column: 8, scope: !1444)
!1497 = !DILocation(line: 71, column: 2, scope: !1444)
!1498 = !DILocation(line: 73, column: 8, scope: !1499)
!1499 = distinct !DILexicalBlock(scope: !1444, file: !16, line: 73, column: 2)
!1500 = !DILocation(line: 73, column: 7, scope: !1499)
!1501 = !DILocation(line: 73, column: 12, scope: !1502)
!1502 = distinct !DILexicalBlock(scope: !1499, file: !16, line: 73, column: 2)
!1503 = !DILocation(line: 73, column: 13, scope: !1502)
!1504 = !DILocation(line: 73, column: 2, scope: !1499)
!1505 = !DILocation(line: 74, column: 15, scope: !1502)
!1506 = !DILocation(line: 74, column: 28, scope: !1502)
!1507 = !DILocation(line: 74, column: 32, scope: !1502)
!1508 = !DILocation(line: 74, column: 52, scope: !1502)
!1509 = !DILocation(line: 74, column: 38, scope: !1502)
!1510 = !DILocation(line: 74, column: 58, scope: !1502)
!1511 = !DILocation(line: 74, column: 19, scope: !1502)
!1512 = !DILocation(line: 74, column: 3, scope: !1502)
!1513 = !DILocation(line: 73, column: 18, scope: !1502)
!1514 = !DILocation(line: 73, column: 2, scope: !1502)
!1515 = distinct !{!1515, !1504, !1516, !1517}
!1516 = !DILocation(line: 74, column: 62, scope: !1499)
!1517 = !{!"llvm.loop.mustprogress"}
!1518 = !DILocation(line: 76, column: 15, scope: !1444)
!1519 = !DILocation(line: 76, column: 2, scope: !1444)
!1520 = !DILocation(line: 78, column: 1, scope: !1444)
!1521 = distinct !DISubprogram(name: "compute_segment_center", linkageName: "_Z22compute_segment_centerP10vms_vectorP7segment", scope: !16, file: !16, line: 83, type: !1522, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!1522 = !DISubroutineType(types: !1523)
!1523 = !{null, !1447, !1455}
!1524 = !DILocalVariable(name: "vp", arg: 1, scope: !1521, file: !16, line: 83, type: !1447)
!1525 = !DILocation(line: 83, column: 41, scope: !1521)
!1526 = !DILocalVariable(name: "sp", arg: 2, scope: !1521, file: !16, line: 83, type: !1455)
!1527 = !DILocation(line: 83, column: 53, scope: !1521)
!1528 = !DILocalVariable(name: "v", scope: !1521, file: !16, line: 101, type: !9)
!1529 = !DILocation(line: 101, column: 8, scope: !1521)
!1530 = !DILocation(line: 103, column: 2, scope: !1521)
!1531 = !DILocation(line: 105, column: 8, scope: !1532)
!1532 = distinct !DILexicalBlock(scope: !1521, file: !16, line: 105, column: 2)
!1533 = !DILocation(line: 105, column: 7, scope: !1532)
!1534 = !DILocation(line: 105, column: 12, scope: !1535)
!1535 = distinct !DILexicalBlock(scope: !1532, file: !16, line: 105, column: 2)
!1536 = !DILocation(line: 105, column: 13, scope: !1535)
!1537 = !DILocation(line: 105, column: 2, scope: !1532)
!1538 = !DILocation(line: 106, column: 15, scope: !1535)
!1539 = !DILocation(line: 106, column: 28, scope: !1535)
!1540 = !DILocation(line: 106, column: 32, scope: !1535)
!1541 = !DILocation(line: 106, column: 38, scope: !1535)
!1542 = !DILocation(line: 106, column: 19, scope: !1535)
!1543 = !DILocation(line: 106, column: 3, scope: !1535)
!1544 = !DILocation(line: 105, column: 18, scope: !1535)
!1545 = !DILocation(line: 105, column: 2, scope: !1535)
!1546 = distinct !{!1546, !1537, !1547, !1517}
!1547 = !DILocation(line: 106, column: 41, scope: !1532)
!1548 = !DILocation(line: 108, column: 15, scope: !1521)
!1549 = !DILocation(line: 108, column: 2, scope: !1521)
!1550 = !DILocation(line: 110, column: 1, scope: !1521)
!1551 = distinct !DISubprogram(name: "find_connect_side", linkageName: "_Z17find_connect_sideP7segmentS0_", scope: !16, file: !16, line: 115, type: !1552, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!1552 = !DISubroutineType(types: !1553)
!1553 = !{!9, !1455, !1455}
!1554 = !DILocalVariable(name: "base_seg", arg: 1, scope: !1551, file: !16, line: 115, type: !1455)
!1555 = !DILocation(line: 115, column: 32, scope: !1551)
!1556 = !DILocalVariable(name: "con_seg", arg: 2, scope: !1551, file: !16, line: 115, type: !1455)
!1557 = !DILocation(line: 115, column: 51, scope: !1551)
!1558 = !DILocalVariable(name: "s", scope: !1551, file: !16, line: 130, type: !9)
!1559 = !DILocation(line: 130, column: 6, scope: !1551)
!1560 = !DILocalVariable(name: "base_seg_num", scope: !1551, file: !16, line: 131, type: !23)
!1561 = !DILocation(line: 131, column: 8, scope: !1551)
!1562 = !DILocation(line: 131, column: 23, scope: !1551)
!1563 = !DILocation(line: 131, column: 32, scope: !1551)
!1564 = !DILocalVariable(name: "childs", scope: !1551, file: !16, line: 132, type: !1565)
!1565 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!1566 = !DILocation(line: 132, column: 9, scope: !1551)
!1567 = !DILocation(line: 132, column: 18, scope: !1551)
!1568 = !DILocation(line: 132, column: 27, scope: !1551)
!1569 = !DILocation(line: 134, column: 8, scope: !1570)
!1570 = distinct !DILexicalBlock(scope: !1551, file: !16, line: 134, column: 2)
!1571 = !DILocation(line: 134, column: 7, scope: !1570)
!1572 = !DILocation(line: 134, column: 12, scope: !1573)
!1573 = distinct !DILexicalBlock(scope: !1570, file: !16, line: 134, column: 2)
!1574 = !DILocation(line: 134, column: 13, scope: !1573)
!1575 = !DILocation(line: 134, column: 2, scope: !1570)
!1576 = !DILocation(line: 135, column: 14, scope: !1577)
!1577 = distinct !DILexicalBlock(scope: !1578, file: !16, line: 135, column: 7)
!1578 = distinct !DILexicalBlock(scope: !1573, file: !16, line: 134, column: 42)
!1579 = !DILocation(line: 135, column: 7, scope: !1577)
!1580 = !DILocation(line: 135, column: 20, scope: !1577)
!1581 = !DILocation(line: 135, column: 17, scope: !1577)
!1582 = !DILocation(line: 136, column: 11, scope: !1577)
!1583 = !DILocation(line: 136, column: 4, scope: !1577)
!1584 = !DILocation(line: 137, column: 2, scope: !1578)
!1585 = !DILocation(line: 134, column: 38, scope: !1573)
!1586 = !DILocation(line: 134, column: 2, scope: !1573)
!1587 = distinct !{!1587, !1575, !1588, !1517}
!1588 = !DILocation(line: 137, column: 2, scope: !1570)
!1589 = !DILocation(line: 141, column: 2, scope: !1551)
!1590 = !DILocation(line: 143, column: 1, scope: !1551)
!1591 = distinct !DISubprogram(name: "get_num_faces", linkageName: "_Z13get_num_facesP4side", scope: !16, file: !16, line: 147, type: !1592, scopeLine: 148, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!1592 = !DISubroutineType(types: !1593)
!1593 = !{!9, !1594}
!1594 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1461, size: 64)
!1595 = !DILocalVariable(name: "sidep", arg: 1, scope: !1591, file: !16, line: 147, type: !1594)
!1596 = !DILocation(line: 147, column: 25, scope: !1591)
!1597 = !DILocation(line: 149, column: 10, scope: !1591)
!1598 = !DILocation(line: 149, column: 17, scope: !1591)
!1599 = !DILocation(line: 149, column: 2, scope: !1591)
!1600 = !DILocation(line: 151, column: 4, scope: !1601)
!1601 = distinct !DILexicalBlock(scope: !1591, file: !16, line: 149, column: 23)
!1602 = !DILocation(line: 155, column: 4, scope: !1601)
!1603 = !DILocation(line: 158, column: 33, scope: !1601)
!1604 = !DILocation(line: 158, column: 40, scope: !1601)
!1605 = !DILocation(line: 158, column: 4, scope: !1601)
!1606 = !DILocation(line: 159, column: 4, scope: !1601)
!1607 = !DILocation(line: 161, column: 2, scope: !1591)
!1608 = !DILocation(line: 162, column: 1, scope: !1591)
!1609 = distinct !DISubprogram(name: "get_side_verts", linkageName: "_Z14get_side_vertsPsii", scope: !16, file: !16, line: 165, type: !1610, scopeLine: 166, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!1610 = !DISubroutineType(types: !1611)
!1611 = !{null, !1565, !9, !9}
!1612 = !DILocalVariable(name: "vertlist", arg: 1, scope: !1609, file: !16, line: 165, type: !1565)
!1613 = !DILocation(line: 165, column: 28, scope: !1609)
!1614 = !DILocalVariable(name: "segnum", arg: 2, scope: !1609, file: !16, line: 165, type: !9)
!1615 = !DILocation(line: 165, column: 41, scope: !1609)
!1616 = !DILocalVariable(name: "sidenum", arg: 3, scope: !1609, file: !16, line: 165, type: !9)
!1617 = !DILocation(line: 165, column: 52, scope: !1609)
!1618 = !DILocalVariable(name: "i", scope: !1609, file: !16, line: 167, type: !9)
!1619 = !DILocation(line: 167, column: 6, scope: !1609)
!1620 = !DILocalVariable(name: "sv", scope: !1609, file: !16, line: 168, type: !1621)
!1621 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!1622 = !DILocation(line: 168, column: 11, scope: !1609)
!1623 = !DILocation(line: 168, column: 30, scope: !1609)
!1624 = !DILocation(line: 168, column: 16, scope: !1609)
!1625 = !DILocalVariable(name: "vp", scope: !1609, file: !16, line: 169, type: !1565)
!1626 = !DILocation(line: 169, column: 9, scope: !1609)
!1627 = !DILocation(line: 169, column: 23, scope: !1609)
!1628 = !DILocation(line: 169, column: 14, scope: !1609)
!1629 = !DILocation(line: 169, column: 31, scope: !1609)
!1630 = !DILocation(line: 171, column: 8, scope: !1631)
!1631 = distinct !DILexicalBlock(scope: !1609, file: !16, line: 171, column: 2)
!1632 = !DILocation(line: 171, column: 7, scope: !1631)
!1633 = !DILocation(line: 171, column: 13, scope: !1634)
!1634 = distinct !DILexicalBlock(scope: !1631, file: !16, line: 171, column: 2)
!1635 = !DILocation(line: 171, column: 12, scope: !1634)
!1636 = !DILocation(line: 171, column: 2, scope: !1631)
!1637 = !DILocation(line: 172, column: 17, scope: !1634)
!1638 = !DILocation(line: 172, column: 20, scope: !1634)
!1639 = !DILocation(line: 172, column: 23, scope: !1634)
!1640 = !DILocation(line: 172, column: 3, scope: !1634)
!1641 = !DILocation(line: 172, column: 12, scope: !1634)
!1642 = !DILocation(line: 172, column: 15, scope: !1634)
!1643 = !DILocation(line: 171, column: 2, scope: !1634)
!1644 = distinct !{!1644, !1636, !1645, !1517}
!1645 = !DILocation(line: 172, column: 25, scope: !1631)
!1646 = !DILocation(line: 173, column: 1, scope: !1609)
!1647 = distinct !DISubprogram(name: "create_all_vertnum_lists", linkageName: "_Z24create_all_vertnum_listsPiS_ii", scope: !16, file: !16, line: 263, type: !1648, scopeLine: 264, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!1648 = !DISubroutineType(types: !1649)
!1649 = !{null, !801, !801, !9, !9}
!1650 = !DILocalVariable(name: "num_faces", arg: 1, scope: !1647, file: !16, line: 263, type: !801)
!1651 = !DILocation(line: 263, column: 36, scope: !1647)
!1652 = !DILocalVariable(name: "vertnums", arg: 2, scope: !1647, file: !16, line: 263, type: !801)
!1653 = !DILocation(line: 263, column: 52, scope: !1647)
!1654 = !DILocalVariable(name: "segnum", arg: 3, scope: !1647, file: !16, line: 263, type: !9)
!1655 = !DILocation(line: 263, column: 66, scope: !1647)
!1656 = !DILocalVariable(name: "sidenum", arg: 4, scope: !1647, file: !16, line: 263, type: !9)
!1657 = !DILocation(line: 263, column: 78, scope: !1647)
!1658 = !DILocalVariable(name: "sidep", scope: !1647, file: !16, line: 279, type: !1594)
!1659 = !DILocation(line: 279, column: 8, scope: !1647)
!1660 = !DILocation(line: 279, column: 26, scope: !1647)
!1661 = !DILocation(line: 279, column: 17, scope: !1647)
!1662 = !DILocation(line: 279, column: 34, scope: !1647)
!1663 = !DILocation(line: 279, column: 40, scope: !1647)
!1664 = !DILocation(line: 281, column: 2, scope: !1647)
!1665 = !DILocation(line: 0, scope: !1647)
!1666 = !DILocation(line: 283, column: 10, scope: !1647)
!1667 = !DILocation(line: 283, column: 17, scope: !1647)
!1668 = !DILocation(line: 283, column: 2, scope: !1647)
!1669 = !DILocation(line: 286, column: 4, scope: !1670)
!1670 = distinct !DILexicalBlock(scope: !1647, file: !16, line: 283, column: 23)
!1671 = !DILocation(line: 286, column: 16, scope: !1670)
!1672 = !DILocation(line: 287, column: 4, scope: !1670)
!1673 = !DILocation(line: 287, column: 16, scope: !1670)
!1674 = !DILocation(line: 288, column: 4, scope: !1670)
!1675 = !DILocation(line: 288, column: 16, scope: !1670)
!1676 = !DILocation(line: 289, column: 4, scope: !1670)
!1677 = !DILocation(line: 289, column: 16, scope: !1670)
!1678 = !DILocation(line: 291, column: 5, scope: !1670)
!1679 = !DILocation(line: 291, column: 15, scope: !1670)
!1680 = !DILocation(line: 292, column: 4, scope: !1670)
!1681 = !DILocation(line: 294, column: 5, scope: !1670)
!1682 = !DILocation(line: 294, column: 15, scope: !1670)
!1683 = !DILocation(line: 296, column: 4, scope: !1670)
!1684 = !DILocation(line: 296, column: 16, scope: !1670)
!1685 = !DILocation(line: 297, column: 4, scope: !1670)
!1686 = !DILocation(line: 297, column: 16, scope: !1670)
!1687 = !DILocation(line: 298, column: 4, scope: !1670)
!1688 = !DILocation(line: 298, column: 16, scope: !1670)
!1689 = !DILocation(line: 300, column: 4, scope: !1670)
!1690 = !DILocation(line: 300, column: 16, scope: !1670)
!1691 = !DILocation(line: 301, column: 4, scope: !1670)
!1692 = !DILocation(line: 301, column: 16, scope: !1670)
!1693 = !DILocation(line: 302, column: 4, scope: !1670)
!1694 = !DILocation(line: 302, column: 16, scope: !1670)
!1695 = !DILocation(line: 306, column: 4, scope: !1670)
!1696 = !DILocation(line: 308, column: 5, scope: !1670)
!1697 = !DILocation(line: 308, column: 15, scope: !1670)
!1698 = !DILocation(line: 310, column: 4, scope: !1670)
!1699 = !DILocation(line: 310, column: 16, scope: !1670)
!1700 = !DILocation(line: 311, column: 4, scope: !1670)
!1701 = !DILocation(line: 311, column: 16, scope: !1670)
!1702 = !DILocation(line: 312, column: 4, scope: !1670)
!1703 = !DILocation(line: 312, column: 16, scope: !1670)
!1704 = !DILocation(line: 314, column: 4, scope: !1670)
!1705 = !DILocation(line: 314, column: 16, scope: !1670)
!1706 = !DILocation(line: 315, column: 4, scope: !1670)
!1707 = !DILocation(line: 315, column: 16, scope: !1670)
!1708 = !DILocation(line: 316, column: 4, scope: !1670)
!1709 = !DILocation(line: 316, column: 16, scope: !1670)
!1710 = !DILocation(line: 320, column: 4, scope: !1670)
!1711 = !DILocation(line: 322, column: 77, scope: !1670)
!1712 = !DILocation(line: 322, column: 84, scope: !1670)
!1713 = !DILocation(line: 322, column: 90, scope: !1670)
!1714 = !DILocation(line: 322, column: 98, scope: !1670)
!1715 = !DILocation(line: 322, column: 4, scope: !1670)
!1716 = !DILocation(line: 323, column: 4, scope: !1670)
!1717 = !DILocation(line: 327, column: 1, scope: !1647)
!1718 = distinct !DISubprogram(name: "create_abs_vertex_lists", linkageName: "_Z23create_abs_vertex_listsPiS_ii", scope: !16, file: !16, line: 331, type: !1648, scopeLine: 332, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!1719 = !DILocalVariable(name: "num_faces", arg: 1, scope: !1718, file: !16, line: 331, type: !801)
!1720 = !DILocation(line: 331, column: 35, scope: !1718)
!1721 = !DILocalVariable(name: "vertices", arg: 2, scope: !1718, file: !16, line: 331, type: !801)
!1722 = !DILocation(line: 331, column: 51, scope: !1718)
!1723 = !DILocalVariable(name: "segnum", arg: 3, scope: !1718, file: !16, line: 331, type: !9)
!1724 = !DILocation(line: 331, column: 65, scope: !1718)
!1725 = !DILocalVariable(name: "sidenum", arg: 4, scope: !1718, file: !16, line: 331, type: !9)
!1726 = !DILocation(line: 331, column: 77, scope: !1718)
!1727 = !DILocalVariable(name: "vp", scope: !1718, file: !16, line: 350, type: !1565)
!1728 = !DILocation(line: 350, column: 9, scope: !1718)
!1729 = !DILocation(line: 350, column: 23, scope: !1718)
!1730 = !DILocation(line: 350, column: 14, scope: !1718)
!1731 = !DILocation(line: 350, column: 31, scope: !1718)
!1732 = !DILocalVariable(name: "sidep", scope: !1718, file: !16, line: 351, type: !1594)
!1733 = !DILocation(line: 351, column: 8, scope: !1718)
!1734 = !DILocation(line: 351, column: 26, scope: !1718)
!1735 = !DILocation(line: 351, column: 17, scope: !1718)
!1736 = !DILocation(line: 351, column: 34, scope: !1718)
!1737 = !DILocation(line: 351, column: 40, scope: !1718)
!1738 = !DILocalVariable(name: "sv", scope: !1718, file: !16, line: 352, type: !801)
!1739 = !DILocation(line: 352, column: 8, scope: !1718)
!1740 = !DILocation(line: 352, column: 31, scope: !1718)
!1741 = !DILocation(line: 352, column: 13, scope: !1718)
!1742 = !DILocation(line: 354, column: 2, scope: !1718)
!1743 = !DILocation(line: 0, scope: !1718)
!1744 = !DILocation(line: 356, column: 10, scope: !1718)
!1745 = !DILocation(line: 356, column: 17, scope: !1718)
!1746 = !DILocation(line: 356, column: 2, scope: !1718)
!1747 = !DILocation(line: 359, column: 18, scope: !1748)
!1748 = distinct !DILexicalBlock(scope: !1718, file: !16, line: 356, column: 23)
!1749 = !DILocation(line: 359, column: 21, scope: !1748)
!1750 = !DILocation(line: 359, column: 4, scope: !1748)
!1751 = !DILocation(line: 359, column: 16, scope: !1748)
!1752 = !DILocation(line: 360, column: 18, scope: !1748)
!1753 = !DILocation(line: 360, column: 21, scope: !1748)
!1754 = !DILocation(line: 360, column: 4, scope: !1748)
!1755 = !DILocation(line: 360, column: 16, scope: !1748)
!1756 = !DILocation(line: 361, column: 18, scope: !1748)
!1757 = !DILocation(line: 361, column: 21, scope: !1748)
!1758 = !DILocation(line: 361, column: 4, scope: !1748)
!1759 = !DILocation(line: 361, column: 16, scope: !1748)
!1760 = !DILocation(line: 362, column: 18, scope: !1748)
!1761 = !DILocation(line: 362, column: 21, scope: !1748)
!1762 = !DILocation(line: 362, column: 4, scope: !1748)
!1763 = !DILocation(line: 362, column: 16, scope: !1748)
!1764 = !DILocation(line: 364, column: 5, scope: !1748)
!1765 = !DILocation(line: 364, column: 15, scope: !1748)
!1766 = !DILocation(line: 365, column: 4, scope: !1748)
!1767 = !DILocation(line: 367, column: 5, scope: !1748)
!1768 = !DILocation(line: 367, column: 15, scope: !1748)
!1769 = !DILocation(line: 369, column: 18, scope: !1748)
!1770 = !DILocation(line: 369, column: 21, scope: !1748)
!1771 = !DILocation(line: 369, column: 4, scope: !1748)
!1772 = !DILocation(line: 369, column: 16, scope: !1748)
!1773 = !DILocation(line: 370, column: 18, scope: !1748)
!1774 = !DILocation(line: 370, column: 21, scope: !1748)
!1775 = !DILocation(line: 370, column: 4, scope: !1748)
!1776 = !DILocation(line: 370, column: 16, scope: !1748)
!1777 = !DILocation(line: 371, column: 18, scope: !1748)
!1778 = !DILocation(line: 371, column: 21, scope: !1748)
!1779 = !DILocation(line: 371, column: 4, scope: !1748)
!1780 = !DILocation(line: 371, column: 16, scope: !1748)
!1781 = !DILocation(line: 373, column: 18, scope: !1748)
!1782 = !DILocation(line: 373, column: 21, scope: !1748)
!1783 = !DILocation(line: 373, column: 4, scope: !1748)
!1784 = !DILocation(line: 373, column: 16, scope: !1748)
!1785 = !DILocation(line: 374, column: 18, scope: !1748)
!1786 = !DILocation(line: 374, column: 21, scope: !1748)
!1787 = !DILocation(line: 374, column: 4, scope: !1748)
!1788 = !DILocation(line: 374, column: 16, scope: !1748)
!1789 = !DILocation(line: 375, column: 18, scope: !1748)
!1790 = !DILocation(line: 375, column: 21, scope: !1748)
!1791 = !DILocation(line: 375, column: 4, scope: !1748)
!1792 = !DILocation(line: 375, column: 16, scope: !1748)
!1793 = !DILocation(line: 379, column: 4, scope: !1748)
!1794 = !DILocation(line: 381, column: 5, scope: !1748)
!1795 = !DILocation(line: 381, column: 15, scope: !1748)
!1796 = !DILocation(line: 383, column: 18, scope: !1748)
!1797 = !DILocation(line: 383, column: 21, scope: !1748)
!1798 = !DILocation(line: 383, column: 4, scope: !1748)
!1799 = !DILocation(line: 383, column: 16, scope: !1748)
!1800 = !DILocation(line: 384, column: 18, scope: !1748)
!1801 = !DILocation(line: 384, column: 21, scope: !1748)
!1802 = !DILocation(line: 384, column: 4, scope: !1748)
!1803 = !DILocation(line: 384, column: 16, scope: !1748)
!1804 = !DILocation(line: 385, column: 18, scope: !1748)
!1805 = !DILocation(line: 385, column: 21, scope: !1748)
!1806 = !DILocation(line: 385, column: 4, scope: !1748)
!1807 = !DILocation(line: 385, column: 16, scope: !1748)
!1808 = !DILocation(line: 387, column: 18, scope: !1748)
!1809 = !DILocation(line: 387, column: 21, scope: !1748)
!1810 = !DILocation(line: 387, column: 4, scope: !1748)
!1811 = !DILocation(line: 387, column: 16, scope: !1748)
!1812 = !DILocation(line: 388, column: 18, scope: !1748)
!1813 = !DILocation(line: 388, column: 21, scope: !1748)
!1814 = !DILocation(line: 388, column: 4, scope: !1748)
!1815 = !DILocation(line: 388, column: 16, scope: !1748)
!1816 = !DILocation(line: 389, column: 18, scope: !1748)
!1817 = !DILocation(line: 389, column: 21, scope: !1748)
!1818 = !DILocation(line: 389, column: 4, scope: !1748)
!1819 = !DILocation(line: 389, column: 16, scope: !1748)
!1820 = !DILocation(line: 393, column: 4, scope: !1748)
!1821 = !DILocation(line: 395, column: 77, scope: !1748)
!1822 = !DILocation(line: 395, column: 84, scope: !1748)
!1823 = !DILocation(line: 395, column: 90, scope: !1748)
!1824 = !DILocation(line: 395, column: 98, scope: !1748)
!1825 = !DILocation(line: 395, column: 4, scope: !1748)
!1826 = !DILocation(line: 396, column: 4, scope: !1748)
!1827 = !DILocation(line: 399, column: 1, scope: !1718)
!1828 = distinct !DISubprogram(name: "get_seg_masks", linkageName: "_Z13get_seg_masksP10vms_vectorii", scope: !16, file: !16, line: 404, type: !1829, scopeLine: 405, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!1829 = !DISubroutineType(types: !1830)
!1830 = !{!1831, !1447, !9, !5}
!1831 = !DIDerivedType(tag: DW_TAG_typedef, name: "segmasks", file: !1832, line: 28, baseType: !1833)
!1832 = !DIFile(filename: "main_d2/gameseg.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "2f09aa3974052ccf59737bf78b36c142")
!1833 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "segmasks", file: !1832, line: 24, size: 32, flags: DIFlagTypePassByValue, elements: !1834, identifier: "_ZTS8segmasks")
!1834 = !{!1835, !1836, !1837}
!1835 = !DIDerivedType(tag: DW_TAG_member, name: "facemask", scope: !1833, file: !1832, line: 25, baseType: !23, size: 16)
!1836 = !DIDerivedType(tag: DW_TAG_member, name: "sidemask", scope: !1833, file: !1832, line: 26, baseType: !25, size: 8, offset: 16)
!1837 = !DIDerivedType(tag: DW_TAG_member, name: "centermask", scope: !1833, file: !1832, line: 27, baseType: !25, size: 8, offset: 24)
!1838 = !DILocalVariable(name: "checkp", arg: 1, scope: !1828, file: !16, line: 404, type: !1447)
!1839 = !DILocation(line: 404, column: 36, scope: !1828)
!1840 = !DILocalVariable(name: "segnum", arg: 2, scope: !1828, file: !16, line: 404, type: !9)
!1841 = !DILocation(line: 404, column: 47, scope: !1828)
!1842 = !DILocalVariable(name: "rad", arg: 3, scope: !1828, file: !16, line: 404, type: !5)
!1843 = !DILocation(line: 404, column: 58, scope: !1828)
!1844 = !DILocation(line: 406, column: 6, scope: !1845)
!1845 = distinct !DILexicalBlock(scope: !1828, file: !16, line: 406, column: 6)
!1846 = !DILocation(line: 406, column: 12, scope: !1845)
!1847 = !DILocation(line: 407, column: 3, scope: !1845)
!1848 = !DILocalVariable(name: "sn", scope: !1828, file: !16, line: 448, type: !9)
!1849 = !DILocation(line: 448, column: 8, scope: !1828)
!1850 = !DILocalVariable(name: "facebit", scope: !1828, file: !16, line: 448, type: !9)
!1851 = !DILocation(line: 448, column: 11, scope: !1828)
!1852 = !DILocalVariable(name: "sidebit", scope: !1828, file: !16, line: 448, type: !9)
!1853 = !DILocation(line: 448, column: 19, scope: !1828)
!1854 = !DILocalVariable(name: "masks", scope: !1828, file: !16, line: 449, type: !1831)
!1855 = !DILocation(line: 449, column: 12, scope: !1828)
!1856 = !DILocalVariable(name: "num_faces", scope: !1828, file: !16, line: 450, type: !9)
!1857 = !DILocation(line: 450, column: 8, scope: !1828)
!1858 = !DILocalVariable(name: "vertex_list", scope: !1828, file: !16, line: 451, type: !1859)
!1859 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 192, elements: !1481)
!1860 = !DILocation(line: 451, column: 8, scope: !1828)
!1861 = !DILocalVariable(name: "seg", scope: !1828, file: !16, line: 452, type: !1455)
!1862 = !DILocation(line: 452, column: 12, scope: !1828)
!1863 = !DILocation(line: 454, column: 2, scope: !1828)
!1864 = !DILocation(line: 0, scope: !1828)
!1865 = !DILocation(line: 456, column: 18, scope: !1828)
!1866 = !DILocation(line: 456, column: 9, scope: !1828)
!1867 = !DILocation(line: 456, column: 6, scope: !1828)
!1868 = !DILocation(line: 460, column: 42, scope: !1828)
!1869 = !DILocation(line: 460, column: 53, scope: !1828)
!1870 = !DILocation(line: 460, column: 25, scope: !1828)
!1871 = !DILocation(line: 460, column: 34, scope: !1828)
!1872 = !DILocation(line: 460, column: 8, scope: !1828)
!1873 = !DILocation(line: 460, column: 17, scope: !1828)
!1874 = !DILocation(line: 462, column: 9, scope: !1875)
!1875 = distinct !DILexicalBlock(scope: !1828, file: !16, line: 462, column: 2)
!1876 = !DILocation(line: 462, column: 27, scope: !1875)
!1877 = !DILocation(line: 462, column: 19, scope: !1875)
!1878 = !DILocation(line: 462, column: 7, scope: !1875)
!1879 = !DILocation(line: 462, column: 30, scope: !1880)
!1880 = distinct !DILexicalBlock(scope: !1875, file: !16, line: 462, column: 2)
!1881 = !DILocation(line: 462, column: 32, scope: !1880)
!1882 = !DILocation(line: 462, column: 2, scope: !1875)
!1883 = !DILocalVariable(name: "s", scope: !1884, file: !16, line: 464, type: !1594)
!1884 = distinct !DILexicalBlock(scope: !1880, file: !16, line: 462, column: 53)
!1885 = !DILocation(line: 464, column: 9, scope: !1884)
!1886 = !DILocation(line: 464, column: 14, scope: !1884)
!1887 = !DILocation(line: 464, column: 19, scope: !1884)
!1888 = !DILocation(line: 464, column: 25, scope: !1884)
!1889 = !DILocalVariable(name: "side_pokes_out", scope: !1884, file: !16, line: 466, type: !9)
!1890 = !DILocation(line: 466, column: 7, scope: !1884)
!1891 = !DILocalVariable(name: "vertnum", scope: !1884, file: !16, line: 467, type: !9)
!1892 = !DILocation(line: 467, column: 7, scope: !1884)
!1893 = !DILocalVariable(name: "fn", scope: !1884, file: !16, line: 467, type: !9)
!1894 = !DILocation(line: 467, column: 15, scope: !1884)
!1895 = !DILocation(line: 472, column: 40, scope: !1884)
!1896 = !DILocation(line: 472, column: 53, scope: !1884)
!1897 = !DILocation(line: 472, column: 61, scope: !1884)
!1898 = !DILocation(line: 472, column: 3, scope: !1884)
!1899 = !DILocation(line: 479, column: 7, scope: !1900)
!1900 = distinct !DILexicalBlock(scope: !1884, file: !16, line: 479, column: 7)
!1901 = !DILocation(line: 479, column: 16, scope: !1900)
!1902 = !DILocalVariable(name: "dist", scope: !1903, file: !16, line: 480, type: !5)
!1903 = distinct !DILexicalBlock(scope: !1900, file: !16, line: 479, column: 21)
!1904 = !DILocation(line: 480, column: 8, scope: !1903)
!1905 = !DILocalVariable(name: "side_count", scope: !1903, file: !16, line: 481, type: !9)
!1906 = !DILocation(line: 481, column: 8, scope: !1903)
!1907 = !DILocalVariable(name: "center_count", scope: !1903, file: !16, line: 481, type: !9)
!1908 = !DILocation(line: 481, column: 19, scope: !1903)
!1909 = !DILocation(line: 486, column: 23, scope: !1903)
!1910 = !DILocation(line: 486, column: 38, scope: !1903)
!1911 = !DILocation(line: 486, column: 14, scope: !1903)
!1912 = !DILocation(line: 486, column: 12, scope: !1903)
!1913 = !DILocation(line: 492, column: 8, scope: !1914)
!1914 = distinct !DILexicalBlock(scope: !1903, file: !16, line: 492, column: 8)
!1915 = !DILocation(line: 492, column: 25, scope: !1914)
!1916 = !DILocation(line: 492, column: 23, scope: !1914)
!1917 = !DILocation(line: 496, column: 40, scope: !1914)
!1918 = !DILocation(line: 496, column: 31, scope: !1914)
!1919 = !DILocation(line: 496, column: 57, scope: !1914)
!1920 = !DILocation(line: 496, column: 60, scope: !1914)
!1921 = !DILocation(line: 496, column: 81, scope: !1914)
!1922 = !DILocation(line: 496, column: 72, scope: !1914)
!1923 = !DILocation(line: 496, column: 13, scope: !1914)
!1924 = !DILocation(line: 496, column: 11, scope: !1914)
!1925 = !DILocation(line: 496, column: 6, scope: !1914)
!1926 = !DILocation(line: 502, column: 40, scope: !1914)
!1927 = !DILocation(line: 502, column: 31, scope: !1914)
!1928 = !DILocation(line: 502, column: 57, scope: !1914)
!1929 = !DILocation(line: 502, column: 60, scope: !1914)
!1930 = !DILocation(line: 502, column: 81, scope: !1914)
!1931 = !DILocation(line: 502, column: 72, scope: !1914)
!1932 = !DILocation(line: 502, column: 13, scope: !1914)
!1933 = !DILocation(line: 502, column: 11, scope: !1914)
!1934 = !DILocation(line: 505, column: 22, scope: !1903)
!1935 = !DILocation(line: 505, column: 27, scope: !1903)
!1936 = !DILocation(line: 505, column: 21, scope: !1903)
!1937 = !DILocation(line: 505, column: 19, scope: !1903)
!1938 = !DILocation(line: 507, column: 30, scope: !1903)
!1939 = !DILocation(line: 507, column: 15, scope: !1903)
!1940 = !DILocation(line: 509, column: 11, scope: !1941)
!1941 = distinct !DILexicalBlock(scope: !1903, file: !16, line: 509, column: 4)
!1942 = !DILocation(line: 509, column: 9, scope: !1941)
!1943 = !DILocation(line: 509, column: 14, scope: !1944)
!1944 = distinct !DILexicalBlock(scope: !1941, file: !16, line: 509, column: 4)
!1945 = !DILocation(line: 509, column: 16, scope: !1944)
!1946 = !DILocation(line: 509, column: 4, scope: !1941)
!1947 = !DILocation(line: 514, column: 30, scope: !1948)
!1948 = distinct !DILexicalBlock(scope: !1944, file: !16, line: 509, column: 37)
!1949 = !DILocation(line: 514, column: 39, scope: !1948)
!1950 = !DILocation(line: 514, column: 42, scope: !1948)
!1951 = !DILocation(line: 514, column: 50, scope: !1948)
!1952 = !DILocation(line: 514, column: 65, scope: !1948)
!1953 = !DILocation(line: 514, column: 56, scope: !1948)
!1954 = !DILocation(line: 514, column: 13, scope: !1948)
!1955 = !DILocation(line: 514, column: 11, scope: !1948)
!1956 = !DILocation(line: 517, column: 9, scope: !1957)
!1957 = distinct !DILexicalBlock(scope: !1948, file: !16, line: 517, column: 9)
!1958 = !DILocation(line: 517, column: 14, scope: !1957)
!1959 = !DILocation(line: 518, column: 18, scope: !1957)
!1960 = !DILocation(line: 518, column: 6, scope: !1957)
!1961 = !DILocation(line: 520, column: 9, scope: !1962)
!1962 = distinct !DILexicalBlock(scope: !1948, file: !16, line: 520, column: 9)
!1963 = !DILocation(line: 520, column: 14, scope: !1962)
!1964 = !DILocation(line: 520, column: 13, scope: !1962)
!1965 = !DILocation(line: 520, column: 18, scope: !1962)
!1966 = !DILocation(line: 521, column: 24, scope: !1967)
!1967 = distinct !DILexicalBlock(scope: !1962, file: !16, line: 520, column: 43)
!1968 = !DILocation(line: 521, column: 12, scope: !1967)
!1969 = !DILocation(line: 521, column: 21, scope: !1967)
!1970 = !DILocation(line: 522, column: 16, scope: !1967)
!1971 = !DILocation(line: 523, column: 5, scope: !1967)
!1972 = !DILocation(line: 524, column: 4, scope: !1948)
!1973 = !DILocation(line: 509, column: 21, scope: !1944)
!1974 = !DILocation(line: 509, column: 31, scope: !1944)
!1975 = !DILocation(line: 509, column: 4, scope: !1944)
!1976 = distinct !{!1976, !1946, !1977, !1517}
!1977 = !DILocation(line: 524, column: 4, scope: !1941)
!1978 = !DILocation(line: 526, column: 9, scope: !1979)
!1979 = distinct !DILexicalBlock(scope: !1903, file: !16, line: 526, column: 8)
!1980 = !DILocation(line: 526, column: 8, scope: !1979)
!1981 = !DILocation(line: 528, column: 9, scope: !1982)
!1982 = distinct !DILexicalBlock(scope: !1983, file: !16, line: 528, column: 9)
!1983 = distinct !DILexicalBlock(scope: !1979, file: !16, line: 526, column: 25)
!1984 = !DILocation(line: 528, column: 19, scope: !1982)
!1985 = !DILocation(line: 529, column: 24, scope: !1982)
!1986 = !DILocation(line: 529, column: 12, scope: !1982)
!1987 = !DILocation(line: 529, column: 21, scope: !1982)
!1988 = !DILocation(line: 529, column: 6, scope: !1982)
!1989 = !DILocation(line: 531, column: 9, scope: !1990)
!1990 = distinct !DILexicalBlock(scope: !1983, file: !16, line: 531, column: 9)
!1991 = !DILocation(line: 531, column: 21, scope: !1990)
!1992 = !DILocation(line: 532, column: 26, scope: !1990)
!1993 = !DILocation(line: 532, column: 12, scope: !1990)
!1994 = !DILocation(line: 532, column: 23, scope: !1990)
!1995 = !DILocation(line: 532, column: 6, scope: !1990)
!1996 = !DILocation(line: 534, column: 4, scope: !1983)
!1997 = !DILocation(line: 537, column: 9, scope: !1998)
!1998 = distinct !DILexicalBlock(scope: !1999, file: !16, line: 537, column: 9)
!1999 = distinct !DILexicalBlock(scope: !1979, file: !16, line: 535, column: 9)
!2000 = !DILocation(line: 538, column: 24, scope: !1998)
!2001 = !DILocation(line: 538, column: 12, scope: !1998)
!2002 = !DILocation(line: 538, column: 21, scope: !1998)
!2003 = !DILocation(line: 538, column: 6, scope: !1998)
!2004 = !DILocation(line: 540, column: 9, scope: !2005)
!2005 = distinct !DILexicalBlock(scope: !1999, file: !16, line: 540, column: 9)
!2006 = !DILocation(line: 541, column: 26, scope: !2005)
!2007 = !DILocation(line: 541, column: 12, scope: !2005)
!2008 = !DILocation(line: 541, column: 23, scope: !2005)
!2009 = !DILocation(line: 541, column: 6, scope: !2005)
!2010 = !DILocation(line: 546, column: 3, scope: !1903)
!2011 = !DILocalVariable(name: "dist", scope: !2012, file: !16, line: 548, type: !5)
!2012 = distinct !DILexicalBlock(scope: !1900, file: !16, line: 547, column: 8)
!2013 = !DILocation(line: 548, column: 8, scope: !2012)
!2014 = !DILocalVariable(name: "i", scope: !2012, file: !16, line: 549, type: !9)
!2015 = !DILocation(line: 549, column: 8, scope: !2012)
!2016 = !DILocation(line: 556, column: 14, scope: !2012)
!2017 = !DILocation(line: 556, column: 12, scope: !2012)
!2018 = !DILocation(line: 557, column: 10, scope: !2019)
!2019 = distinct !DILexicalBlock(scope: !2012, file: !16, line: 557, column: 4)
!2020 = !DILocation(line: 557, column: 9, scope: !2019)
!2021 = !DILocation(line: 557, column: 13, scope: !2022)
!2022 = distinct !DILexicalBlock(scope: !2019, file: !16, line: 557, column: 4)
!2023 = !DILocation(line: 557, column: 14, scope: !2022)
!2024 = !DILocation(line: 557, column: 4, scope: !2019)
!2025 = !DILocation(line: 558, column: 21, scope: !2026)
!2026 = distinct !DILexicalBlock(scope: !2022, file: !16, line: 558, column: 9)
!2027 = !DILocation(line: 558, column: 9, scope: !2026)
!2028 = !DILocation(line: 558, column: 26, scope: !2026)
!2029 = !DILocation(line: 558, column: 24, scope: !2026)
!2030 = !DILocation(line: 559, column: 28, scope: !2026)
!2031 = !DILocation(line: 559, column: 16, scope: !2026)
!2032 = !DILocation(line: 559, column: 14, scope: !2026)
!2033 = !DILocation(line: 559, column: 6, scope: !2026)
!2034 = !DILocation(line: 557, column: 18, scope: !2022)
!2035 = !DILocation(line: 557, column: 4, scope: !2022)
!2036 = distinct !{!2036, !2024, !2037, !1517}
!2037 = !DILocation(line: 559, column: 29, scope: !2019)
!2038 = !DILocation(line: 565, column: 29, scope: !2012)
!2039 = !DILocation(line: 565, column: 38, scope: !2012)
!2040 = !DILocation(line: 565, column: 41, scope: !2012)
!2041 = !DILocation(line: 565, column: 63, scope: !2012)
!2042 = !DILocation(line: 565, column: 54, scope: !2012)
!2043 = !DILocation(line: 565, column: 12, scope: !2012)
!2044 = !DILocation(line: 565, column: 10, scope: !2012)
!2045 = !DILocation(line: 569, column: 8, scope: !2046)
!2046 = distinct !DILexicalBlock(scope: !2012, file: !16, line: 569, column: 8)
!2047 = !DILocation(line: 569, column: 13, scope: !2046)
!2048 = !DILocation(line: 570, column: 25, scope: !2046)
!2049 = !DILocation(line: 570, column: 11, scope: !2046)
!2050 = !DILocation(line: 570, column: 22, scope: !2046)
!2051 = !DILocation(line: 570, column: 5, scope: !2046)
!2052 = !DILocation(line: 572, column: 8, scope: !2053)
!2053 = distinct !DILexicalBlock(scope: !2012, file: !16, line: 572, column: 8)
!2054 = !DILocation(line: 572, column: 13, scope: !2053)
!2055 = !DILocation(line: 572, column: 12, scope: !2053)
!2056 = !DILocation(line: 572, column: 17, scope: !2053)
!2057 = !DILocation(line: 573, column: 23, scope: !2058)
!2058 = distinct !DILexicalBlock(scope: !2053, file: !16, line: 572, column: 42)
!2059 = !DILocation(line: 573, column: 11, scope: !2058)
!2060 = !DILocation(line: 573, column: 20, scope: !2058)
!2061 = !DILocation(line: 574, column: 23, scope: !2058)
!2062 = !DILocation(line: 574, column: 11, scope: !2058)
!2063 = !DILocation(line: 574, column: 20, scope: !2058)
!2064 = !DILocation(line: 575, column: 4, scope: !2058)
!2065 = !DILocation(line: 577, column: 12, scope: !2012)
!2066 = !DILocation(line: 580, column: 2, scope: !1884)
!2067 = !DILocation(line: 462, column: 37, scope: !1880)
!2068 = !DILocation(line: 462, column: 47, scope: !1880)
!2069 = !DILocation(line: 462, column: 2, scope: !1880)
!2070 = distinct !{!2070, !1882, !2071, !1517}
!2071 = !DILocation(line: 580, column: 2, scope: !1875)
!2072 = !DILocation(line: 582, column: 2, scope: !1828)
!2073 = distinct !DISubprogram(name: "min<int>", linkageName: "_ZNSt3__13minB8ne200100IiEERKT_S3_S3_", scope: !183, file: !2074, line: 35, type: !2075, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, templateParams: !2078, retainedNodes: !1488)
!2074 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__algorithm/min.h", directory: "")
!2075 = !DISubroutineType(types: !2076)
!2076 = !{!2077, !2077, !2077}
!2077 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !180, size: 64)
!2078 = !{!2079}
!2079 = !DITemplateTypeParameter(name: "_Tp", type: !9)
!2080 = !DILocalVariable(name: "__a", arg: 1, scope: !2073, file: !2074, line: 35, type: !2077)
!2081 = !DILocation(line: 35, column: 38, scope: !2073)
!2082 = !DILocalVariable(name: "__b", arg: 2, scope: !2073, file: !2074, line: 35, type: !2077)
!2083 = !DILocation(line: 35, column: 76, scope: !2073)
!2084 = !DILocation(line: 36, column: 19, scope: !2073)
!2085 = !DILocation(line: 36, column: 24, scope: !2073)
!2086 = !DILocation(line: 36, column: 10, scope: !2073)
!2087 = !DILocation(line: 36, column: 3, scope: !2073)
!2088 = distinct !DISubprogram(name: "get_side_dists", linkageName: "_Z14get_side_distsP10vms_vectoriPi", scope: !16, file: !16, line: 589, type: !2089, scopeLine: 590, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!2089 = !DISubroutineType(types: !2090)
!2090 = !{!31, !1447, !9, !2091}
!2091 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!2092 = !DILocalVariable(name: "checkp", arg: 1, scope: !2088, file: !16, line: 589, type: !1447)
!2093 = !DILocation(line: 589, column: 36, scope: !2088)
!2094 = !DILocalVariable(name: "segnum", arg: 2, scope: !2088, file: !16, line: 589, type: !9)
!2095 = !DILocation(line: 589, column: 47, scope: !2088)
!2096 = !DILocalVariable(name: "side_dists", arg: 3, scope: !2088, file: !16, line: 589, type: !2091)
!2097 = !DILocation(line: 589, column: 59, scope: !2088)
!2098 = !DILocation(line: 591, column: 2, scope: !2088)
!2099 = !DILocation(line: 0, scope: !2088)
!2100 = !DILocation(line: 593, column: 6, scope: !2101)
!2101 = distinct !DILexicalBlock(scope: !2088, file: !16, line: 593, column: 6)
!2102 = !DILocation(line: 593, column: 12, scope: !2101)
!2103 = !DILocation(line: 594, column: 3, scope: !2101)
!2104 = !DILocalVariable(name: "sn", scope: !2088, file: !16, line: 633, type: !9)
!2105 = !DILocation(line: 633, column: 8, scope: !2088)
!2106 = !DILocalVariable(name: "facebit", scope: !2088, file: !16, line: 633, type: !9)
!2107 = !DILocation(line: 633, column: 11, scope: !2088)
!2108 = !DILocalVariable(name: "sidebit", scope: !2088, file: !16, line: 633, type: !9)
!2109 = !DILocation(line: 633, column: 19, scope: !2088)
!2110 = !DILocalVariable(name: "mask", scope: !2088, file: !16, line: 634, type: !31)
!2111 = !DILocation(line: 634, column: 12, scope: !2088)
!2112 = !DILocalVariable(name: "num_faces", scope: !2088, file: !16, line: 635, type: !9)
!2113 = !DILocation(line: 635, column: 8, scope: !2088)
!2114 = !DILocalVariable(name: "vertex_list", scope: !2088, file: !16, line: 636, type: !1859)
!2115 = !DILocation(line: 636, column: 8, scope: !2088)
!2116 = !DILocalVariable(name: "seg", scope: !2088, file: !16, line: 637, type: !1455)
!2117 = !DILocation(line: 637, column: 12, scope: !2088)
!2118 = !DILocation(line: 639, column: 18, scope: !2088)
!2119 = !DILocation(line: 639, column: 9, scope: !2088)
!2120 = !DILocation(line: 639, column: 6, scope: !2088)
!2121 = !DILocation(line: 643, column: 7, scope: !2088)
!2122 = !DILocation(line: 645, column: 9, scope: !2123)
!2123 = distinct !DILexicalBlock(scope: !2088, file: !16, line: 645, column: 2)
!2124 = !DILocation(line: 645, column: 27, scope: !2123)
!2125 = !DILocation(line: 645, column: 19, scope: !2123)
!2126 = !DILocation(line: 645, column: 7, scope: !2123)
!2127 = !DILocation(line: 645, column: 30, scope: !2128)
!2128 = distinct !DILexicalBlock(scope: !2123, file: !16, line: 645, column: 2)
!2129 = !DILocation(line: 645, column: 32, scope: !2128)
!2130 = !DILocation(line: 645, column: 2, scope: !2123)
!2131 = !DILocalVariable(name: "s", scope: !2132, file: !16, line: 647, type: !1594)
!2132 = distinct !DILexicalBlock(scope: !2128, file: !16, line: 645, column: 53)
!2133 = !DILocation(line: 647, column: 9, scope: !2132)
!2134 = !DILocation(line: 647, column: 14, scope: !2132)
!2135 = !DILocation(line: 647, column: 19, scope: !2132)
!2136 = !DILocation(line: 647, column: 25, scope: !2132)
!2137 = !DILocalVariable(name: "side_pokes_out", scope: !2132, file: !16, line: 649, type: !9)
!2138 = !DILocation(line: 649, column: 7, scope: !2132)
!2139 = !DILocalVariable(name: "fn", scope: !2132, file: !16, line: 650, type: !9)
!2140 = !DILocation(line: 650, column: 7, scope: !2132)
!2141 = !DILocation(line: 652, column: 3, scope: !2132)
!2142 = !DILocation(line: 652, column: 14, scope: !2132)
!2143 = !DILocation(line: 652, column: 18, scope: !2132)
!2144 = !DILocation(line: 657, column: 40, scope: !2132)
!2145 = !DILocation(line: 657, column: 53, scope: !2132)
!2146 = !DILocation(line: 657, column: 61, scope: !2132)
!2147 = !DILocation(line: 657, column: 3, scope: !2132)
!2148 = !DILocation(line: 664, column: 7, scope: !2149)
!2149 = distinct !DILexicalBlock(scope: !2132, file: !16, line: 664, column: 7)
!2150 = !DILocation(line: 664, column: 16, scope: !2149)
!2151 = !DILocalVariable(name: "dist", scope: !2152, file: !16, line: 665, type: !5)
!2152 = distinct !DILexicalBlock(scope: !2149, file: !16, line: 664, column: 21)
!2153 = !DILocation(line: 665, column: 8, scope: !2152)
!2154 = !DILocalVariable(name: "center_count", scope: !2152, file: !16, line: 666, type: !9)
!2155 = !DILocation(line: 666, column: 8, scope: !2152)
!2156 = !DILocalVariable(name: "vertnum", scope: !2152, file: !16, line: 667, type: !9)
!2157 = !DILocation(line: 667, column: 8, scope: !2152)
!2158 = !DILocation(line: 672, column: 23, scope: !2152)
!2159 = !DILocation(line: 672, column: 38, scope: !2152)
!2160 = !DILocation(line: 672, column: 14, scope: !2152)
!2161 = !DILocation(line: 672, column: 12, scope: !2152)
!2162 = !DILocation(line: 678, column: 8, scope: !2163)
!2163 = distinct !DILexicalBlock(scope: !2152, file: !16, line: 678, column: 8)
!2164 = !DILocation(line: 678, column: 25, scope: !2163)
!2165 = !DILocation(line: 678, column: 23, scope: !2163)
!2166 = !DILocation(line: 682, column: 40, scope: !2163)
!2167 = !DILocation(line: 682, column: 31, scope: !2163)
!2168 = !DILocation(line: 682, column: 57, scope: !2163)
!2169 = !DILocation(line: 682, column: 60, scope: !2163)
!2170 = !DILocation(line: 682, column: 81, scope: !2163)
!2171 = !DILocation(line: 682, column: 72, scope: !2163)
!2172 = !DILocation(line: 682, column: 13, scope: !2163)
!2173 = !DILocation(line: 682, column: 11, scope: !2163)
!2174 = !DILocation(line: 682, column: 6, scope: !2163)
!2175 = !DILocation(line: 688, column: 40, scope: !2163)
!2176 = !DILocation(line: 688, column: 31, scope: !2163)
!2177 = !DILocation(line: 688, column: 57, scope: !2163)
!2178 = !DILocation(line: 688, column: 60, scope: !2163)
!2179 = !DILocation(line: 688, column: 81, scope: !2163)
!2180 = !DILocation(line: 688, column: 72, scope: !2163)
!2181 = !DILocation(line: 688, column: 13, scope: !2163)
!2182 = !DILocation(line: 688, column: 11, scope: !2163)
!2183 = !DILocation(line: 691, column: 22, scope: !2152)
!2184 = !DILocation(line: 691, column: 27, scope: !2152)
!2185 = !DILocation(line: 691, column: 21, scope: !2152)
!2186 = !DILocation(line: 691, column: 19, scope: !2152)
!2187 = !DILocation(line: 693, column: 17, scope: !2152)
!2188 = !DILocation(line: 695, column: 11, scope: !2189)
!2189 = distinct !DILexicalBlock(scope: !2152, file: !16, line: 695, column: 4)
!2190 = !DILocation(line: 695, column: 9, scope: !2189)
!2191 = !DILocation(line: 695, column: 14, scope: !2192)
!2192 = distinct !DILexicalBlock(scope: !2189, file: !16, line: 695, column: 4)
!2193 = !DILocation(line: 695, column: 16, scope: !2192)
!2194 = !DILocation(line: 695, column: 4, scope: !2189)
!2195 = !DILocation(line: 700, column: 30, scope: !2196)
!2196 = distinct !DILexicalBlock(scope: !2192, file: !16, line: 695, column: 37)
!2197 = !DILocation(line: 700, column: 39, scope: !2196)
!2198 = !DILocation(line: 700, column: 42, scope: !2196)
!2199 = !DILocation(line: 700, column: 50, scope: !2196)
!2200 = !DILocation(line: 700, column: 65, scope: !2196)
!2201 = !DILocation(line: 700, column: 56, scope: !2196)
!2202 = !DILocation(line: 700, column: 13, scope: !2196)
!2203 = !DILocation(line: 700, column: 11, scope: !2196)
!2204 = !DILocation(line: 703, column: 9, scope: !2205)
!2205 = distinct !DILexicalBlock(scope: !2196, file: !16, line: 703, column: 9)
!2206 = !DILocation(line: 703, column: 14, scope: !2205)
!2207 = !DILocation(line: 704, column: 18, scope: !2208)
!2208 = distinct !DILexicalBlock(scope: !2205, file: !16, line: 703, column: 39)
!2209 = !DILocation(line: 705, column: 24, scope: !2208)
!2210 = !DILocation(line: 705, column: 6, scope: !2208)
!2211 = !DILocation(line: 705, column: 17, scope: !2208)
!2212 = !DILocation(line: 705, column: 21, scope: !2208)
!2213 = !DILocation(line: 706, column: 5, scope: !2208)
!2214 = !DILocation(line: 708, column: 4, scope: !2196)
!2215 = !DILocation(line: 695, column: 21, scope: !2192)
!2216 = !DILocation(line: 695, column: 31, scope: !2192)
!2217 = !DILocation(line: 695, column: 4, scope: !2192)
!2218 = distinct !{!2218, !2194, !2219, !1517}
!2219 = !DILocation(line: 708, column: 4, scope: !2189)
!2220 = !DILocation(line: 710, column: 9, scope: !2221)
!2221 = distinct !DILexicalBlock(scope: !2152, file: !16, line: 710, column: 8)
!2222 = !DILocation(line: 710, column: 8, scope: !2221)
!2223 = !DILocation(line: 712, column: 9, scope: !2224)
!2224 = distinct !DILexicalBlock(scope: !2225, file: !16, line: 712, column: 9)
!2225 = distinct !DILexicalBlock(scope: !2221, file: !16, line: 710, column: 25)
!2226 = !DILocation(line: 712, column: 21, scope: !2224)
!2227 = !DILocation(line: 713, column: 14, scope: !2228)
!2228 = distinct !DILexicalBlock(scope: !2224, file: !16, line: 712, column: 26)
!2229 = !DILocation(line: 713, column: 11, scope: !2228)
!2230 = !DILocation(line: 714, column: 6, scope: !2228)
!2231 = !DILocation(line: 714, column: 17, scope: !2228)
!2232 = !DILocation(line: 714, column: 21, scope: !2228)
!2233 = !DILocation(line: 715, column: 5, scope: !2228)
!2234 = !DILocation(line: 718, column: 4, scope: !2225)
!2235 = !DILocation(line: 721, column: 9, scope: !2236)
!2236 = distinct !DILexicalBlock(scope: !2237, file: !16, line: 721, column: 9)
!2237 = distinct !DILexicalBlock(scope: !2221, file: !16, line: 719, column: 9)
!2238 = !DILocation(line: 722, column: 14, scope: !2239)
!2239 = distinct !DILexicalBlock(scope: !2236, file: !16, line: 721, column: 23)
!2240 = !DILocation(line: 722, column: 11, scope: !2239)
!2241 = !DILocation(line: 723, column: 10, scope: !2242)
!2242 = distinct !DILexicalBlock(scope: !2239, file: !16, line: 723, column: 10)
!2243 = !DILocation(line: 723, column: 22, scope: !2242)
!2244 = !DILocation(line: 724, column: 7, scope: !2242)
!2245 = !DILocation(line: 724, column: 18, scope: !2242)
!2246 = !DILocation(line: 724, column: 22, scope: !2242)
!2247 = !DILocation(line: 726, column: 5, scope: !2239)
!2248 = !DILocation(line: 730, column: 3, scope: !2152)
!2249 = !DILocalVariable(name: "dist", scope: !2250, file: !16, line: 732, type: !5)
!2250 = distinct !DILexicalBlock(scope: !2149, file: !16, line: 731, column: 8)
!2251 = !DILocation(line: 732, column: 8, scope: !2250)
!2252 = !DILocalVariable(name: "i", scope: !2250, file: !16, line: 733, type: !9)
!2253 = !DILocation(line: 733, column: 8, scope: !2250)
!2254 = !DILocalVariable(name: "vertnum", scope: !2250, file: !16, line: 733, type: !9)
!2255 = !DILocation(line: 733, column: 10, scope: !2250)
!2256 = !DILocation(line: 741, column: 14, scope: !2250)
!2257 = !DILocation(line: 741, column: 12, scope: !2250)
!2258 = !DILocation(line: 742, column: 10, scope: !2259)
!2259 = distinct !DILexicalBlock(scope: !2250, file: !16, line: 742, column: 4)
!2260 = !DILocation(line: 742, column: 9, scope: !2259)
!2261 = !DILocation(line: 742, column: 13, scope: !2262)
!2262 = distinct !DILexicalBlock(scope: !2259, file: !16, line: 742, column: 4)
!2263 = !DILocation(line: 742, column: 14, scope: !2262)
!2264 = !DILocation(line: 742, column: 4, scope: !2259)
!2265 = !DILocation(line: 743, column: 21, scope: !2266)
!2266 = distinct !DILexicalBlock(scope: !2262, file: !16, line: 743, column: 9)
!2267 = !DILocation(line: 743, column: 9, scope: !2266)
!2268 = !DILocation(line: 743, column: 26, scope: !2266)
!2269 = !DILocation(line: 743, column: 24, scope: !2266)
!2270 = !DILocation(line: 744, column: 28, scope: !2266)
!2271 = !DILocation(line: 744, column: 16, scope: !2266)
!2272 = !DILocation(line: 744, column: 14, scope: !2266)
!2273 = !DILocation(line: 744, column: 6, scope: !2266)
!2274 = !DILocation(line: 742, column: 18, scope: !2262)
!2275 = !DILocation(line: 742, column: 4, scope: !2262)
!2276 = distinct !{!2276, !2264, !2277, !1517}
!2277 = !DILocation(line: 744, column: 29, scope: !2259)
!2278 = !DILocation(line: 750, column: 29, scope: !2250)
!2279 = !DILocation(line: 750, column: 38, scope: !2250)
!2280 = !DILocation(line: 750, column: 41, scope: !2250)
!2281 = !DILocation(line: 750, column: 63, scope: !2250)
!2282 = !DILocation(line: 750, column: 54, scope: !2250)
!2283 = !DILocation(line: 750, column: 12, scope: !2250)
!2284 = !DILocation(line: 750, column: 10, scope: !2250)
!2285 = !DILocation(line: 753, column: 8, scope: !2286)
!2286 = distinct !DILexicalBlock(scope: !2250, file: !16, line: 753, column: 8)
!2287 = !DILocation(line: 753, column: 13, scope: !2286)
!2288 = !DILocation(line: 754, column: 13, scope: !2289)
!2289 = distinct !DILexicalBlock(scope: !2286, file: !16, line: 753, column: 38)
!2290 = !DILocation(line: 754, column: 10, scope: !2289)
!2291 = !DILocation(line: 755, column: 22, scope: !2289)
!2292 = !DILocation(line: 755, column: 5, scope: !2289)
!2293 = !DILocation(line: 755, column: 16, scope: !2289)
!2294 = !DILocation(line: 755, column: 20, scope: !2289)
!2295 = !DILocation(line: 756, column: 4, scope: !2289)
!2296 = !DILocation(line: 758, column: 12, scope: !2250)
!2297 = !DILocation(line: 761, column: 2, scope: !2132)
!2298 = !DILocation(line: 645, column: 37, scope: !2128)
!2299 = !DILocation(line: 645, column: 47, scope: !2128)
!2300 = !DILocation(line: 645, column: 2, scope: !2128)
!2301 = distinct !{!2301, !2130, !2302, !1517}
!2302 = !DILocation(line: 761, column: 2, scope: !2123)
!2303 = !DILocation(line: 763, column: 9, scope: !2088)
!2304 = !DILocation(line: 763, column: 2, scope: !2088)
!2305 = distinct !DISubprogram(name: "check_norms", linkageName: "_Z11check_normsiiiiii", scope: !16, file: !16, line: 778, type: !2306, scopeLine: 779, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!2306 = !DISubroutineType(types: !2307)
!2307 = !{!9, !9, !9, !9, !9, !9, !9}
!2308 = !DILocalVariable(name: "segnum", arg: 1, scope: !2305, file: !16, line: 778, type: !9)
!2309 = !DILocation(line: 778, column: 21, scope: !2305)
!2310 = !DILocalVariable(name: "sidenum", arg: 2, scope: !2305, file: !16, line: 778, type: !9)
!2311 = !DILocation(line: 778, column: 32, scope: !2305)
!2312 = !DILocalVariable(name: "facenum", arg: 3, scope: !2305, file: !16, line: 778, type: !9)
!2313 = !DILocation(line: 778, column: 44, scope: !2305)
!2314 = !DILocalVariable(name: "csegnum", arg: 4, scope: !2305, file: !16, line: 778, type: !9)
!2315 = !DILocation(line: 778, column: 56, scope: !2305)
!2316 = !DILocalVariable(name: "csidenum", arg: 5, scope: !2305, file: !16, line: 778, type: !9)
!2317 = !DILocation(line: 778, column: 68, scope: !2305)
!2318 = !DILocalVariable(name: "cfacenum", arg: 6, scope: !2305, file: !16, line: 778, type: !9)
!2319 = !DILocation(line: 778, column: 81, scope: !2305)
!2320 = !DILocalVariable(name: "n0", scope: !2305, file: !16, line: 798, type: !1447)
!2321 = !DILocation(line: 798, column: 14, scope: !2305)
!2322 = !DILocalVariable(name: "n1", scope: !2305, file: !16, line: 798, type: !1447)
!2323 = !DILocation(line: 798, column: 18, scope: !2305)
!2324 = !DILocation(line: 800, column: 17, scope: !2305)
!2325 = !DILocation(line: 800, column: 8, scope: !2305)
!2326 = !DILocation(line: 800, column: 25, scope: !2305)
!2327 = !DILocation(line: 800, column: 31, scope: !2305)
!2328 = !DILocation(line: 800, column: 40, scope: !2305)
!2329 = !DILocation(line: 800, column: 48, scope: !2305)
!2330 = !DILocation(line: 800, column: 5, scope: !2305)
!2331 = !DILocation(line: 801, column: 17, scope: !2305)
!2332 = !DILocation(line: 801, column: 8, scope: !2305)
!2333 = !DILocation(line: 801, column: 26, scope: !2305)
!2334 = !DILocation(line: 801, column: 32, scope: !2305)
!2335 = !DILocation(line: 801, column: 42, scope: !2305)
!2336 = !DILocation(line: 801, column: 50, scope: !2305)
!2337 = !DILocation(line: 801, column: 5, scope: !2305)
!2338 = !DILocation(line: 803, column: 6, scope: !2339)
!2339 = distinct !DILexicalBlock(scope: !2305, file: !16, line: 803, column: 6)
!2340 = !DILocation(line: 803, column: 10, scope: !2339)
!2341 = !DILocation(line: 803, column: 16, scope: !2339)
!2342 = !DILocation(line: 803, column: 20, scope: !2339)
!2343 = !DILocation(line: 803, column: 15, scope: !2339)
!2344 = !DILocation(line: 803, column: 12, scope: !2339)
!2345 = !DILocation(line: 803, column: 23, scope: !2339)
!2346 = !DILocation(line: 803, column: 27, scope: !2339)
!2347 = !DILocation(line: 803, column: 31, scope: !2339)
!2348 = !DILocation(line: 803, column: 37, scope: !2339)
!2349 = !DILocation(line: 803, column: 41, scope: !2339)
!2350 = !DILocation(line: 803, column: 36, scope: !2339)
!2351 = !DILocation(line: 803, column: 33, scope: !2339)
!2352 = !DILocation(line: 803, column: 44, scope: !2339)
!2353 = !DILocation(line: 803, column: 48, scope: !2339)
!2354 = !DILocation(line: 803, column: 52, scope: !2339)
!2355 = !DILocation(line: 803, column: 58, scope: !2339)
!2356 = !DILocation(line: 803, column: 62, scope: !2339)
!2357 = !DILocation(line: 803, column: 57, scope: !2339)
!2358 = !DILocation(line: 803, column: 54, scope: !2339)
!2359 = !DILocation(line: 804, column: 3, scope: !2360)
!2360 = distinct !DILexicalBlock(scope: !2339, file: !16, line: 803, column: 65)
!2361 = !DILocation(line: 809, column: 3, scope: !2360)
!2362 = !DILocation(line: 812, column: 3, scope: !2339)
!2363 = !DILocation(line: 814, column: 1, scope: !2305)
!2364 = distinct !DISubprogram(name: "check_segment_connections", linkageName: "_Z25check_segment_connectionsv", scope: !16, file: !16, line: 817, type: !1170, scopeLine: 818, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!2365 = !DILocalVariable(name: "segnum", scope: !2364, file: !16, line: 829, type: !9)
!2366 = !DILocation(line: 829, column: 6, scope: !2364)
!2367 = !DILocalVariable(name: "sidenum", scope: !2364, file: !16, line: 829, type: !9)
!2368 = !DILocation(line: 829, column: 13, scope: !2364)
!2369 = !DILocalVariable(name: "errors", scope: !2364, file: !16, line: 830, type: !9)
!2370 = !DILocation(line: 830, column: 6, scope: !2364)
!2371 = !DILocation(line: 832, column: 13, scope: !2372)
!2372 = distinct !DILexicalBlock(scope: !2364, file: !16, line: 832, column: 2)
!2373 = !DILocation(line: 832, column: 7, scope: !2372)
!2374 = !DILocation(line: 832, column: 16, scope: !2375)
!2375 = distinct !DILexicalBlock(scope: !2372, file: !16, line: 832, column: 2)
!2376 = !DILocation(line: 832, column: 24, scope: !2375)
!2377 = !DILocation(line: 832, column: 22, scope: !2375)
!2378 = !DILocation(line: 832, column: 2, scope: !2372)
!2379 = !DILocalVariable(name: "seg", scope: !2380, file: !16, line: 833, type: !1455)
!2380 = distinct !DILexicalBlock(scope: !2375, file: !16, line: 832, column: 56)
!2381 = !DILocation(line: 833, column: 12, scope: !2380)
!2382 = !DILocation(line: 835, column: 19, scope: !2380)
!2383 = !DILocation(line: 835, column: 10, scope: !2380)
!2384 = !DILocation(line: 835, column: 7, scope: !2380)
!2385 = !DILocation(line: 837, column: 15, scope: !2386)
!2386 = distinct !DILexicalBlock(scope: !2380, file: !16, line: 837, column: 3)
!2387 = !DILocation(line: 837, column: 8, scope: !2386)
!2388 = !DILocation(line: 837, column: 18, scope: !2389)
!2389 = distinct !DILexicalBlock(scope: !2386, file: !16, line: 837, column: 3)
!2390 = !DILocation(line: 837, column: 25, scope: !2389)
!2391 = !DILocation(line: 837, column: 3, scope: !2386)
!2392 = !DILocalVariable(name: "s", scope: !2393, file: !16, line: 838, type: !1594)
!2393 = distinct !DILexicalBlock(scope: !2389, file: !16, line: 837, column: 39)
!2394 = !DILocation(line: 838, column: 10, scope: !2393)
!2395 = !DILocalVariable(name: "cseg", scope: !2393, file: !16, line: 839, type: !1455)
!2396 = !DILocation(line: 839, column: 13, scope: !2393)
!2397 = !DILocalVariable(name: "cs", scope: !2393, file: !16, line: 840, type: !1594)
!2398 = !DILocation(line: 840, column: 10, scope: !2393)
!2399 = !DILocalVariable(name: "num_faces", scope: !2393, file: !16, line: 841, type: !9)
!2400 = !DILocation(line: 841, column: 8, scope: !2393)
!2401 = !DILocalVariable(name: "csegnum", scope: !2393, file: !16, line: 841, type: !9)
!2402 = !DILocation(line: 841, column: 18, scope: !2393)
!2403 = !DILocalVariable(name: "csidenum", scope: !2393, file: !16, line: 841, type: !9)
!2404 = !DILocation(line: 841, column: 26, scope: !2393)
!2405 = !DILocalVariable(name: "con_num_faces", scope: !2393, file: !16, line: 841, type: !9)
!2406 = !DILocation(line: 841, column: 35, scope: !2393)
!2407 = !DILocalVariable(name: "vertex_list", scope: !2393, file: !16, line: 842, type: !1859)
!2408 = !DILocation(line: 842, column: 8, scope: !2393)
!2409 = !DILocalVariable(name: "con_vertex_list", scope: !2393, file: !16, line: 842, type: !1859)
!2410 = !DILocation(line: 842, column: 23, scope: !2393)
!2411 = !DILocation(line: 844, column: 9, scope: !2393)
!2412 = !DILocation(line: 844, column: 14, scope: !2393)
!2413 = !DILocation(line: 844, column: 20, scope: !2393)
!2414 = !DILocation(line: 844, column: 6, scope: !2393)
!2415 = !DILocation(line: 846, column: 41, scope: !2393)
!2416 = !DILocation(line: 846, column: 54, scope: !2393)
!2417 = !DILocation(line: 846, column: 62, scope: !2393)
!2418 = !DILocation(line: 846, column: 4, scope: !2393)
!2419 = !DILocation(line: 848, column: 14, scope: !2393)
!2420 = !DILocation(line: 848, column: 19, scope: !2393)
!2421 = !DILocation(line: 848, column: 28, scope: !2393)
!2422 = !DILocation(line: 848, column: 12, scope: !2393)
!2423 = !DILocation(line: 850, column: 8, scope: !2424)
!2424 = distinct !DILexicalBlock(scope: !2393, file: !16, line: 850, column: 8)
!2425 = !DILocation(line: 850, column: 16, scope: !2424)
!2426 = !DILocation(line: 851, column: 22, scope: !2427)
!2427 = distinct !DILexicalBlock(scope: !2424, file: !16, line: 850, column: 22)
!2428 = !DILocation(line: 851, column: 13, scope: !2427)
!2429 = !DILocation(line: 851, column: 10, scope: !2427)
!2430 = !DILocation(line: 852, column: 34, scope: !2427)
!2431 = !DILocation(line: 852, column: 38, scope: !2427)
!2432 = !DILocation(line: 852, column: 16, scope: !2427)
!2433 = !DILocation(line: 852, column: 14, scope: !2427)
!2434 = !DILocation(line: 854, column: 9, scope: !2435)
!2435 = distinct !DILexicalBlock(scope: !2427, file: !16, line: 854, column: 9)
!2436 = !DILocation(line: 854, column: 18, scope: !2435)
!2437 = !DILocation(line: 855, column: 6, scope: !2438)
!2438 = distinct !DILexicalBlock(scope: !2435, file: !16, line: 854, column: 25)
!2439 = !DILocation(line: 856, column: 13, scope: !2438)
!2440 = !DILocation(line: 857, column: 6, scope: !2438)
!2441 = !DILocation(line: 860, column: 11, scope: !2427)
!2442 = !DILocation(line: 860, column: 17, scope: !2427)
!2443 = !DILocation(line: 860, column: 23, scope: !2427)
!2444 = !DILocation(line: 860, column: 8, scope: !2427)
!2445 = !DILocation(line: 862, column: 46, scope: !2427)
!2446 = !DILocation(line: 862, column: 63, scope: !2427)
!2447 = !DILocation(line: 862, column: 72, scope: !2427)
!2448 = !DILocation(line: 862, column: 5, scope: !2427)
!2449 = !DILocation(line: 864, column: 9, scope: !2450)
!2450 = distinct !DILexicalBlock(scope: !2427, file: !16, line: 864, column: 9)
!2451 = !DILocation(line: 864, column: 26, scope: !2450)
!2452 = !DILocation(line: 864, column: 23, scope: !2450)
!2453 = !DILocation(line: 865, column: 6, scope: !2454)
!2454 = distinct !DILexicalBlock(scope: !2450, file: !16, line: 864, column: 37)
!2455 = !DILocation(line: 866, column: 13, scope: !2454)
!2456 = !DILocation(line: 867, column: 5, scope: !2454)
!2457 = !DILocation(line: 869, column: 10, scope: !2458)
!2458 = distinct !DILexicalBlock(scope: !2450, file: !16, line: 869, column: 10)
!2459 = !DILocation(line: 869, column: 20, scope: !2458)
!2460 = !DILocalVariable(name: "t", scope: !2461, file: !16, line: 870, type: !9)
!2461 = distinct !DILexicalBlock(scope: !2458, file: !16, line: 869, column: 26)
!2462 = !DILocation(line: 870, column: 11, scope: !2461)
!2463 = !DILocation(line: 872, column: 13, scope: !2464)
!2464 = distinct !DILexicalBlock(scope: !2461, file: !16, line: 872, column: 7)
!2465 = !DILocation(line: 872, column: 12, scope: !2464)
!2466 = !DILocation(line: 872, column: 16, scope: !2467)
!2467 = distinct !DILexicalBlock(scope: !2464, file: !16, line: 872, column: 7)
!2468 = !DILocation(line: 872, column: 17, scope: !2467)
!2469 = !DILocation(line: 872, column: 20, scope: !2467)
!2470 = !DILocation(line: 872, column: 39, scope: !2467)
!2471 = !DILocation(line: 872, column: 23, scope: !2467)
!2472 = !DILocation(line: 872, column: 43, scope: !2467)
!2473 = !DILocation(line: 872, column: 41, scope: !2467)
!2474 = !DILocation(line: 0, scope: !2467)
!2475 = !DILocation(line: 872, column: 7, scope: !2464)
!2476 = !DILocation(line: 872, column: 59, scope: !2467)
!2477 = !DILocation(line: 872, column: 7, scope: !2467)
!2478 = distinct !{!2478, !2475, !2479, !1517}
!2479 = !DILocation(line: 872, column: 62, scope: !2464)
!2480 = !DILocation(line: 874, column: 11, scope: !2481)
!2481 = distinct !DILexicalBlock(scope: !2461, file: !16, line: 874, column: 11)
!2482 = !DILocation(line: 874, column: 12, scope: !2481)
!2483 = !DILocation(line: 874, column: 16, scope: !2481)
!2484 = !DILocation(line: 875, column: 9, scope: !2481)
!2485 = !DILocation(line: 875, column: 43, scope: !2481)
!2486 = !DILocation(line: 875, column: 27, scope: !2481)
!2487 = !DILocation(line: 875, column: 24, scope: !2481)
!2488 = !DILocation(line: 875, column: 46, scope: !2481)
!2489 = !DILocation(line: 876, column: 9, scope: !2481)
!2490 = !DILocation(line: 876, column: 44, scope: !2481)
!2491 = !DILocation(line: 876, column: 45, scope: !2481)
!2492 = !DILocation(line: 876, column: 48, scope: !2481)
!2493 = !DILocation(line: 876, column: 27, scope: !2481)
!2494 = !DILocation(line: 876, column: 24, scope: !2481)
!2495 = !DILocation(line: 876, column: 52, scope: !2481)
!2496 = !DILocation(line: 877, column: 9, scope: !2481)
!2497 = !DILocation(line: 877, column: 44, scope: !2481)
!2498 = !DILocation(line: 877, column: 45, scope: !2481)
!2499 = !DILocation(line: 877, column: 48, scope: !2481)
!2500 = !DILocation(line: 877, column: 27, scope: !2481)
!2501 = !DILocation(line: 877, column: 24, scope: !2481)
!2502 = !DILocation(line: 877, column: 52, scope: !2481)
!2503 = !DILocation(line: 878, column: 9, scope: !2481)
!2504 = !DILocation(line: 878, column: 44, scope: !2481)
!2505 = !DILocation(line: 878, column: 45, scope: !2481)
!2506 = !DILocation(line: 878, column: 48, scope: !2481)
!2507 = !DILocation(line: 878, column: 27, scope: !2481)
!2508 = !DILocation(line: 878, column: 24, scope: !2481)
!2509 = !DILocation(line: 879, column: 8, scope: !2510)
!2510 = distinct !DILexicalBlock(scope: !2481, file: !16, line: 878, column: 53)
!2511 = !DILocation(line: 885, column: 15, scope: !2510)
!2512 = !DILocation(line: 886, column: 7, scope: !2510)
!2513 = !DILocation(line: 888, column: 30, scope: !2481)
!2514 = !DILocation(line: 888, column: 37, scope: !2481)
!2515 = !DILocation(line: 888, column: 47, scope: !2481)
!2516 = !DILocation(line: 888, column: 55, scope: !2481)
!2517 = !DILocation(line: 888, column: 18, scope: !2481)
!2518 = !DILocation(line: 888, column: 15, scope: !2481)
!2519 = !DILocation(line: 890, column: 6, scope: !2461)
!2520 = !DILocation(line: 893, column: 11, scope: !2521)
!2521 = distinct !DILexicalBlock(scope: !2522, file: !16, line: 893, column: 11)
!2522 = distinct !DILexicalBlock(scope: !2458, file: !16, line: 891, column: 11)
!2523 = !DILocation(line: 893, column: 29, scope: !2521)
!2524 = !DILocation(line: 893, column: 26, scope: !2521)
!2525 = !DILocation(line: 895, column: 12, scope: !2526)
!2526 = distinct !DILexicalBlock(scope: !2527, file: !16, line: 895, column: 12)
!2527 = distinct !DILexicalBlock(scope: !2521, file: !16, line: 893, column: 49)
!2528 = !DILocation(line: 895, column: 30, scope: !2526)
!2529 = !DILocation(line: 895, column: 27, scope: !2526)
!2530 = !DILocation(line: 895, column: 49, scope: !2526)
!2531 = !DILocation(line: 896, column: 10, scope: !2526)
!2532 = !DILocation(line: 896, column: 28, scope: !2526)
!2533 = !DILocation(line: 896, column: 25, scope: !2526)
!2534 = !DILocation(line: 896, column: 47, scope: !2526)
!2535 = !DILocation(line: 897, column: 10, scope: !2526)
!2536 = !DILocation(line: 897, column: 28, scope: !2526)
!2537 = !DILocation(line: 897, column: 25, scope: !2526)
!2538 = !DILocation(line: 897, column: 47, scope: !2526)
!2539 = !DILocation(line: 898, column: 10, scope: !2526)
!2540 = !DILocation(line: 898, column: 28, scope: !2526)
!2541 = !DILocation(line: 898, column: 25, scope: !2526)
!2542 = !DILocation(line: 898, column: 47, scope: !2526)
!2543 = !DILocation(line: 899, column: 10, scope: !2526)
!2544 = !DILocation(line: 899, column: 28, scope: !2526)
!2545 = !DILocation(line: 899, column: 25, scope: !2526)
!2546 = !DILocation(line: 900, column: 9, scope: !2547)
!2547 = distinct !DILexicalBlock(scope: !2526, file: !16, line: 899, column: 48)
!2548 = !DILocation(line: 906, column: 9, scope: !2547)
!2549 = !DILocation(line: 907, column: 61, scope: !2547)
!2550 = !DILocation(line: 907, column: 52, scope: !2547)
!2551 = !DILocation(line: 907, column: 70, scope: !2547)
!2552 = !DILocation(line: 907, column: 76, scope: !2547)
!2553 = !DILocation(line: 907, column: 86, scope: !2547)
!2554 = !DILocation(line: 907, column: 51, scope: !2547)
!2555 = !DILocation(line: 907, column: 50, scope: !2547)
!2556 = !DILocation(line: 907, column: 18, scope: !2547)
!2557 = !DILocation(line: 907, column: 9, scope: !2547)
!2558 = !DILocation(line: 907, column: 27, scope: !2547)
!2559 = !DILocation(line: 907, column: 33, scope: !2547)
!2560 = !DILocation(line: 907, column: 43, scope: !2547)
!2561 = !DILocation(line: 907, column: 48, scope: !2547)
!2562 = !DILocation(line: 908, column: 8, scope: !2547)
!2563 = !DILocation(line: 909, column: 31, scope: !2564)
!2564 = distinct !DILexicalBlock(scope: !2526, file: !16, line: 908, column: 15)
!2565 = !DILocation(line: 909, column: 38, scope: !2564)
!2566 = !DILocation(line: 909, column: 48, scope: !2564)
!2567 = !DILocation(line: 909, column: 56, scope: !2564)
!2568 = !DILocation(line: 909, column: 19, scope: !2564)
!2569 = !DILocation(line: 909, column: 16, scope: !2564)
!2570 = !DILocation(line: 910, column: 31, scope: !2564)
!2571 = !DILocation(line: 910, column: 38, scope: !2564)
!2572 = !DILocation(line: 910, column: 48, scope: !2564)
!2573 = !DILocation(line: 910, column: 56, scope: !2564)
!2574 = !DILocation(line: 910, column: 19, scope: !2564)
!2575 = !DILocation(line: 910, column: 16, scope: !2564)
!2576 = !DILocation(line: 913, column: 7, scope: !2527)
!2577 = !DILocation(line: 915, column: 12, scope: !2578)
!2578 = distinct !DILexicalBlock(scope: !2579, file: !16, line: 915, column: 12)
!2579 = distinct !DILexicalBlock(scope: !2521, file: !16, line: 913, column: 14)
!2580 = !DILocation(line: 915, column: 30, scope: !2578)
!2581 = !DILocation(line: 915, column: 27, scope: !2578)
!2582 = !DILocation(line: 915, column: 49, scope: !2578)
!2583 = !DILocation(line: 916, column: 10, scope: !2578)
!2584 = !DILocation(line: 916, column: 28, scope: !2578)
!2585 = !DILocation(line: 916, column: 25, scope: !2578)
!2586 = !DILocation(line: 916, column: 47, scope: !2578)
!2587 = !DILocation(line: 917, column: 10, scope: !2578)
!2588 = !DILocation(line: 917, column: 28, scope: !2578)
!2589 = !DILocation(line: 917, column: 25, scope: !2578)
!2590 = !DILocation(line: 917, column: 47, scope: !2578)
!2591 = !DILocation(line: 918, column: 10, scope: !2578)
!2592 = !DILocation(line: 918, column: 28, scope: !2578)
!2593 = !DILocation(line: 918, column: 25, scope: !2578)
!2594 = !DILocation(line: 918, column: 47, scope: !2578)
!2595 = !DILocation(line: 919, column: 10, scope: !2578)
!2596 = !DILocation(line: 919, column: 28, scope: !2578)
!2597 = !DILocation(line: 919, column: 25, scope: !2578)
!2598 = !DILocation(line: 919, column: 47, scope: !2578)
!2599 = !DILocation(line: 920, column: 10, scope: !2578)
!2600 = !DILocation(line: 920, column: 28, scope: !2578)
!2601 = !DILocation(line: 920, column: 25, scope: !2578)
!2602 = !DILocation(line: 921, column: 9, scope: !2603)
!2603 = distinct !DILexicalBlock(scope: !2578, file: !16, line: 920, column: 48)
!2604 = !DILocation(line: 927, column: 9, scope: !2603)
!2605 = !DILocation(line: 928, column: 61, scope: !2603)
!2606 = !DILocation(line: 928, column: 52, scope: !2603)
!2607 = !DILocation(line: 928, column: 70, scope: !2603)
!2608 = !DILocation(line: 928, column: 76, scope: !2603)
!2609 = !DILocation(line: 928, column: 86, scope: !2603)
!2610 = !DILocation(line: 928, column: 51, scope: !2603)
!2611 = !DILocation(line: 928, column: 50, scope: !2603)
!2612 = !DILocation(line: 928, column: 18, scope: !2603)
!2613 = !DILocation(line: 928, column: 9, scope: !2603)
!2614 = !DILocation(line: 928, column: 27, scope: !2603)
!2615 = !DILocation(line: 928, column: 33, scope: !2603)
!2616 = !DILocation(line: 928, column: 43, scope: !2603)
!2617 = !DILocation(line: 928, column: 48, scope: !2603)
!2618 = !DILocation(line: 929, column: 8, scope: !2603)
!2619 = !DILocation(line: 930, column: 31, scope: !2620)
!2620 = distinct !DILexicalBlock(scope: !2578, file: !16, line: 929, column: 15)
!2621 = !DILocation(line: 930, column: 38, scope: !2620)
!2622 = !DILocation(line: 930, column: 48, scope: !2620)
!2623 = !DILocation(line: 930, column: 56, scope: !2620)
!2624 = !DILocation(line: 930, column: 19, scope: !2620)
!2625 = !DILocation(line: 930, column: 16, scope: !2620)
!2626 = !DILocation(line: 931, column: 31, scope: !2620)
!2627 = !DILocation(line: 931, column: 38, scope: !2620)
!2628 = !DILocation(line: 931, column: 48, scope: !2620)
!2629 = !DILocation(line: 931, column: 56, scope: !2620)
!2630 = !DILocation(line: 931, column: 19, scope: !2620)
!2631 = !DILocation(line: 931, column: 16, scope: !2620)
!2632 = !DILocation(line: 935, column: 4, scope: !2427)
!2633 = !DILocation(line: 936, column: 3, scope: !2393)
!2634 = !DILocation(line: 837, column: 35, scope: !2389)
!2635 = !DILocation(line: 837, column: 3, scope: !2389)
!2636 = distinct !{!2636, !2391, !2637, !1517}
!2637 = !DILocation(line: 936, column: 3, scope: !2386)
!2638 = !DILocation(line: 937, column: 2, scope: !2380)
!2639 = !DILocation(line: 832, column: 52, scope: !2375)
!2640 = !DILocation(line: 832, column: 2, scope: !2375)
!2641 = distinct !{!2641, !2378, !2642, !1517}
!2642 = !DILocation(line: 937, column: 2, scope: !2372)
!2643 = !DILocation(line: 941, column: 9, scope: !2364)
!2644 = !DILocation(line: 941, column: 2, scope: !2364)
!2645 = distinct !DISubprogram(name: "trace_segs", linkageName: "_Z10trace_segsP10vms_vectorii", scope: !16, file: !16, line: 954, type: !2646, scopeLine: 955, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!2646 = !DISubroutineType(types: !2647)
!2647 = !{!9, !1447, !9, !9}
!2648 = !DILocalVariable(name: "p0", arg: 1, scope: !2645, file: !16, line: 954, type: !1447)
!2649 = !DILocation(line: 954, column: 28, scope: !2645)
!2650 = !DILocalVariable(name: "oldsegnum", arg: 2, scope: !2645, file: !16, line: 954, type: !9)
!2651 = !DILocation(line: 954, column: 35, scope: !2645)
!2652 = !DILocalVariable(name: "trace_segs_iterations", arg: 3, scope: !2645, file: !16, line: 954, type: !9)
!2653 = !DILocation(line: 954, column: 50, scope: !2645)
!2654 = !DILocalVariable(name: "centermask", scope: !2645, file: !16, line: 956, type: !9)
!2655 = !DILocation(line: 956, column: 6, scope: !2645)
!2656 = !DILocalVariable(name: "seg", scope: !2645, file: !16, line: 957, type: !1455)
!2657 = !DILocation(line: 957, column: 11, scope: !2645)
!2658 = !DILocalVariable(name: "side_dists", scope: !2645, file: !16, line: 958, type: !2659)
!2659 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 192, elements: !1481)
!2660 = !DILocation(line: 958, column: 6, scope: !2645)
!2661 = !DILocation(line: 960, column: 2, scope: !2645)
!2662 = !DILocation(line: 0, scope: !2645)
!2663 = !DILocation(line: 963, column: 6, scope: !2664)
!2664 = distinct !DILexicalBlock(scope: !2645, file: !16, line: 963, column: 6)
!2665 = !DILocation(line: 963, column: 28, scope: !2664)
!2666 = !DILocation(line: 966, column: 8, scope: !2667)
!2667 = distinct !DILexicalBlock(scope: !2668, file: !16, line: 966, column: 7)
!2668 = distinct !DILexicalBlock(scope: !2664, file: !16, line: 964, column: 2)
!2669 = !DILocation(line: 966, column: 7, scope: !2667)
!2670 = !DILocation(line: 967, column: 4, scope: !2667)
!2671 = !DILocation(line: 977, column: 12, scope: !2667)
!2672 = !DILocation(line: 977, column: 4, scope: !2667)
!2673 = !DILocation(line: 979, column: 10, scope: !2668)
!2674 = !DILocation(line: 979, column: 3, scope: !2668)
!2675 = !DILocation(line: 982, column: 30, scope: !2645)
!2676 = !DILocation(line: 982, column: 33, scope: !2645)
!2677 = !DILocation(line: 982, column: 43, scope: !2645)
!2678 = !DILocation(line: 982, column: 15, scope: !2645)
!2679 = !DILocation(line: 982, column: 13, scope: !2645)
!2680 = !DILocation(line: 984, column: 6, scope: !2681)
!2681 = distinct !DILexicalBlock(scope: !2645, file: !16, line: 984, column: 6)
!2682 = !DILocation(line: 984, column: 17, scope: !2681)
!2683 = !DILocation(line: 985, column: 10, scope: !2681)
!2684 = !DILocation(line: 985, column: 3, scope: !2681)
!2685 = !DILocalVariable(name: "biggest_side", scope: !2686, file: !16, line: 990, type: !9)
!2686 = distinct !DILexicalBlock(scope: !2681, file: !16, line: 989, column: 2)
!2687 = !DILocation(line: 990, column: 7, scope: !2686)
!2688 = !DILocation(line: 992, column: 3, scope: !2686)
!2689 = !DILocalVariable(name: "sidenum", scope: !2690, file: !16, line: 994, type: !9)
!2690 = distinct !DILexicalBlock(scope: !2686, file: !16, line: 993, column: 3)
!2691 = !DILocation(line: 994, column: 8, scope: !2690)
!2692 = !DILocalVariable(name: "bit", scope: !2690, file: !16, line: 994, type: !9)
!2693 = !DILocation(line: 994, column: 16, scope: !2690)
!2694 = !DILocalVariable(name: "biggest_val", scope: !2690, file: !16, line: 995, type: !5)
!2695 = !DILocation(line: 995, column: 8, scope: !2690)
!2696 = !DILocation(line: 997, column: 20, scope: !2690)
!2697 = !DILocation(line: 997, column: 11, scope: !2690)
!2698 = !DILocation(line: 997, column: 8, scope: !2690)
!2699 = !DILocation(line: 999, column: 17, scope: !2690)
!2700 = !DILocation(line: 999, column: 35, scope: !2690)
!2701 = !DILocation(line: 1001, column: 16, scope: !2702)
!2702 = distinct !DILexicalBlock(scope: !2690, file: !16, line: 1001, column: 4)
!2703 = !DILocation(line: 1001, column: 22, scope: !2702)
!2704 = !DILocation(line: 1001, column: 9, scope: !2702)
!2705 = !DILocation(line: 1001, column: 25, scope: !2706)
!2706 = distinct !DILexicalBlock(scope: !2702, file: !16, line: 1001, column: 4)
!2707 = !DILocation(line: 1001, column: 32, scope: !2706)
!2708 = !DILocation(line: 1001, column: 4, scope: !2702)
!2709 = !DILocation(line: 1002, column: 10, scope: !2710)
!2710 = distinct !DILexicalBlock(scope: !2706, file: !16, line: 1002, column: 9)
!2711 = !DILocation(line: 1002, column: 21, scope: !2710)
!2712 = !DILocation(line: 1002, column: 20, scope: !2710)
!2713 = !DILocation(line: 1002, column: 9, scope: !2710)
!2714 = !DILocation(line: 1002, column: 26, scope: !2710)
!2715 = !DILocation(line: 1002, column: 30, scope: !2710)
!2716 = !DILocation(line: 1002, column: 35, scope: !2710)
!2717 = !DILocation(line: 1002, column: 44, scope: !2710)
!2718 = !DILocation(line: 1002, column: 52, scope: !2710)
!2719 = !DILocation(line: 1003, column: 21, scope: !2720)
!2720 = distinct !DILexicalBlock(scope: !2710, file: !16, line: 1003, column: 10)
!2721 = !DILocation(line: 1003, column: 10, scope: !2720)
!2722 = !DILocation(line: 1003, column: 32, scope: !2720)
!2723 = !DILocation(line: 1003, column: 30, scope: !2720)
!2724 = !DILocation(line: 1005, column: 32, scope: !2725)
!2725 = distinct !DILexicalBlock(scope: !2720, file: !16, line: 1004, column: 6)
!2726 = !DILocation(line: 1005, column: 21, scope: !2725)
!2727 = !DILocation(line: 1005, column: 19, scope: !2725)
!2728 = !DILocation(line: 1006, column: 22, scope: !2725)
!2729 = !DILocation(line: 1006, column: 20, scope: !2725)
!2730 = !DILocation(line: 1007, column: 6, scope: !2725)
!2731 = !DILocation(line: 1002, column: 55, scope: !2710)
!2732 = !DILocation(line: 1001, column: 42, scope: !2706)
!2733 = !DILocation(line: 1001, column: 48, scope: !2706)
!2734 = !DILocation(line: 1001, column: 4, scope: !2706)
!2735 = distinct !{!2735, !2708, !2736, !1517}
!2736 = !DILocation(line: 1007, column: 6, scope: !2702)
!2737 = !DILocation(line: 1009, column: 8, scope: !2738)
!2738 = distinct !DILexicalBlock(scope: !2690, file: !16, line: 1009, column: 8)
!2739 = !DILocation(line: 1009, column: 21, scope: !2738)
!2740 = !DILocalVariable(name: "check", scope: !2741, file: !16, line: 1011, type: !9)
!2741 = distinct !DILexicalBlock(scope: !2738, file: !16, line: 1010, column: 4)
!2742 = !DILocation(line: 1011, column: 9, scope: !2741)
!2743 = !DILocation(line: 1013, column: 16, scope: !2741)
!2744 = !DILocation(line: 1013, column: 5, scope: !2741)
!2745 = !DILocation(line: 1013, column: 30, scope: !2741)
!2746 = !DILocation(line: 1015, column: 24, scope: !2741)
!2747 = !DILocation(line: 1015, column: 27, scope: !2741)
!2748 = !DILocation(line: 1015, column: 32, scope: !2741)
!2749 = !DILocation(line: 1015, column: 41, scope: !2741)
!2750 = !DILocation(line: 1015, column: 56, scope: !2741)
!2751 = !DILocation(line: 1015, column: 77, scope: !2741)
!2752 = !DILocation(line: 1015, column: 13, scope: !2741)
!2753 = !DILocation(line: 1015, column: 11, scope: !2741)
!2754 = !DILocation(line: 1017, column: 9, scope: !2755)
!2755 = distinct !DILexicalBlock(scope: !2741, file: !16, line: 1017, column: 9)
!2756 = !DILocation(line: 1017, column: 15, scope: !2755)
!2757 = !DILocation(line: 1018, column: 13, scope: !2755)
!2758 = !DILocation(line: 1018, column: 6, scope: !2755)
!2759 = !DILocation(line: 1019, column: 4, scope: !2741)
!2760 = !DILocation(line: 1022, column: 3, scope: !2690)
!2761 = !DILocation(line: 1022, column: 12, scope: !2686)
!2762 = !DILocation(line: 1022, column: 24, scope: !2686)
!2763 = distinct !{!2763, !2688, !2764, !1517}
!2764 = !DILocation(line: 1022, column: 28, scope: !2686)
!2765 = !DILocation(line: 1024, column: 3, scope: !2686)
!2766 = !DILocation(line: 1027, column: 1, scope: !2645)
!2767 = distinct !DISubprogram(name: "find_point_seg", linkageName: "_Z14find_point_segP10vms_vectori", scope: !16, file: !16, line: 1037, type: !2768, scopeLine: 1038, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!2768 = !DISubroutineType(types: !2769)
!2769 = !{!9, !1447, !9}
!2770 = !DILocalVariable(name: "p", arg: 1, scope: !2767, file: !16, line: 1037, type: !1447)
!2771 = !DILocation(line: 1037, column: 32, scope: !2767)
!2772 = !DILocalVariable(name: "segnum", arg: 2, scope: !2767, file: !16, line: 1037, type: !9)
!2773 = !DILocation(line: 1037, column: 38, scope: !2767)
!2774 = !DILocalVariable(name: "newseg", scope: !2767, file: !16, line: 1093, type: !9)
!2775 = !DILocation(line: 1093, column: 6, scope: !2767)
!2776 = !DILocation(line: 1096, column: 2, scope: !2767)
!2777 = !DILocation(line: 0, scope: !2767)
!2778 = !DILocation(line: 1098, column: 6, scope: !2779)
!2779 = distinct !DILexicalBlock(scope: !2767, file: !16, line: 1098, column: 6)
!2780 = !DILocation(line: 1098, column: 13, scope: !2779)
!2781 = !DILocation(line: 1099, column: 23, scope: !2782)
!2782 = distinct !DILexicalBlock(scope: !2779, file: !16, line: 1098, column: 20)
!2783 = !DILocation(line: 1099, column: 25, scope: !2782)
!2784 = !DILocation(line: 1099, column: 12, scope: !2782)
!2785 = !DILocation(line: 1099, column: 10, scope: !2782)
!2786 = !DILocation(line: 1101, column: 7, scope: !2787)
!2787 = distinct !DILexicalBlock(scope: !2782, file: !16, line: 1101, column: 7)
!2788 = !DILocation(line: 1101, column: 14, scope: !2787)
!2789 = !DILocation(line: 1102, column: 11, scope: !2787)
!2790 = !DILocation(line: 1102, column: 4, scope: !2787)
!2791 = !DILocation(line: 1103, column: 2, scope: !2782)
!2792 = !DILocation(line: 1111, column: 7, scope: !2793)
!2793 = distinct !DILexicalBlock(scope: !2767, file: !16, line: 1111, column: 6)
!2794 = !DILocation(line: 1111, column: 6, scope: !2793)
!2795 = !DILocation(line: 1112, column: 3, scope: !2796)
!2796 = distinct !DILexicalBlock(scope: !2793, file: !16, line: 1111, column: 33)
!2797 = !DILocation(line: 1114, column: 14, scope: !2798)
!2798 = distinct !DILexicalBlock(scope: !2796, file: !16, line: 1114, column: 3)
!2799 = !DILocation(line: 1114, column: 8, scope: !2798)
!2800 = !DILocation(line: 1114, column: 17, scope: !2801)
!2801 = distinct !DILexicalBlock(scope: !2798, file: !16, line: 1114, column: 3)
!2802 = !DILocation(line: 1114, column: 27, scope: !2801)
!2803 = !DILocation(line: 1114, column: 24, scope: !2801)
!2804 = !DILocation(line: 1114, column: 3, scope: !2798)
!2805 = !DILocation(line: 1115, column: 22, scope: !2806)
!2806 = distinct !DILexicalBlock(scope: !2801, file: !16, line: 1115, column: 8)
!2807 = !DILocation(line: 1115, column: 24, scope: !2806)
!2808 = !DILocation(line: 1115, column: 8, scope: !2806)
!2809 = !DILocation(line: 1115, column: 34, scope: !2806)
!2810 = !DILocation(line: 1115, column: 45, scope: !2806)
!2811 = !DILocation(line: 1116, column: 12, scope: !2806)
!2812 = !DILocation(line: 1116, column: 5, scope: !2806)
!2813 = !DILocation(line: 1115, column: 48, scope: !2806)
!2814 = !DILocation(line: 1114, column: 55, scope: !2801)
!2815 = !DILocation(line: 1114, column: 3, scope: !2801)
!2816 = distinct !{!2816, !2804, !2817, !1517}
!2817 = !DILocation(line: 1116, column: 12, scope: !2798)
!2818 = !DILocation(line: 1118, column: 3, scope: !2796)
!2819 = !DILocation(line: 1120, column: 3, scope: !2796)
!2820 = !DILocation(line: 1122, column: 3, scope: !2793)
!2821 = !DILocation(line: 1124, column: 1, scope: !2767)
!2822 = distinct !DISubprogram(name: "flush_fcd_cache", linkageName: "_Z15flush_fcd_cachev", scope: !16, file: !16, line: 1213, type: !1196, scopeLine: 1214, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!2823 = !DILocalVariable(name: "i", scope: !2822, file: !16, line: 1215, type: !9)
!2824 = !DILocation(line: 1215, column: 6, scope: !2822)
!2825 = !DILocation(line: 1217, column: 12, scope: !2822)
!2826 = !DILocation(line: 1219, column: 8, scope: !2827)
!2827 = distinct !DILexicalBlock(scope: !2822, file: !16, line: 1219, column: 2)
!2828 = !DILocation(line: 1219, column: 7, scope: !2827)
!2829 = !DILocation(line: 1219, column: 12, scope: !2830)
!2830 = distinct !DILexicalBlock(scope: !2827, file: !16, line: 1219, column: 2)
!2831 = !DILocation(line: 1219, column: 13, scope: !2830)
!2832 = !DILocation(line: 1219, column: 2, scope: !2827)
!2833 = !DILocation(line: 1220, column: 13, scope: !2830)
!2834 = !DILocation(line: 1220, column: 3, scope: !2830)
!2835 = !DILocation(line: 1220, column: 16, scope: !2830)
!2836 = !DILocation(line: 1220, column: 21, scope: !2830)
!2837 = !DILocation(line: 1219, column: 30, scope: !2830)
!2838 = !DILocation(line: 1219, column: 2, scope: !2830)
!2839 = distinct !{!2839, !2832, !2840, !1517}
!2840 = !DILocation(line: 1220, column: 24, scope: !2827)
!2841 = !DILocation(line: 1221, column: 1, scope: !2822)
!2842 = distinct !DISubprogram(name: "add_to_fcd_cache", linkageName: "_Z16add_to_fcd_cacheiiii", scope: !16, file: !16, line: 1224, type: !2843, scopeLine: 1225, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!2843 = !DISubroutineType(types: !2844)
!2844 = !{null, !9, !9, !9, !5}
!2845 = !DILocalVariable(name: "seg0", arg: 1, scope: !2842, file: !16, line: 1224, type: !9)
!2846 = !DILocation(line: 1224, column: 27, scope: !2842)
!2847 = !DILocalVariable(name: "seg1", arg: 2, scope: !2842, file: !16, line: 1224, type: !9)
!2848 = !DILocation(line: 1224, column: 37, scope: !2842)
!2849 = !DILocalVariable(name: "depth", arg: 3, scope: !2842, file: !16, line: 1224, type: !9)
!2850 = !DILocation(line: 1224, column: 47, scope: !2842)
!2851 = !DILocalVariable(name: "dist", arg: 4, scope: !2842, file: !16, line: 1224, type: !5)
!2852 = !DILocation(line: 1224, column: 58, scope: !2842)
!2853 = !DILocation(line: 1226, column: 6, scope: !2854)
!2854 = distinct !DILexicalBlock(scope: !2842, file: !16, line: 1226, column: 6)
!2855 = !DILocation(line: 1226, column: 11, scope: !2854)
!2856 = !DILocation(line: 1227, column: 31, scope: !2857)
!2857 = distinct !DILexicalBlock(scope: !2854, file: !16, line: 1226, column: 33)
!2858 = !DILocation(line: 1227, column: 13, scope: !2857)
!2859 = !DILocation(line: 1227, column: 3, scope: !2857)
!2860 = !DILocation(line: 1227, column: 24, scope: !2857)
!2861 = !DILocation(line: 1227, column: 29, scope: !2857)
!2862 = !DILocation(line: 1228, column: 31, scope: !2857)
!2863 = !DILocation(line: 1228, column: 13, scope: !2857)
!2864 = !DILocation(line: 1228, column: 3, scope: !2857)
!2865 = !DILocation(line: 1228, column: 24, scope: !2857)
!2866 = !DILocation(line: 1228, column: 29, scope: !2857)
!2867 = !DILocation(line: 1229, column: 30, scope: !2857)
!2868 = !DILocation(line: 1229, column: 13, scope: !2857)
!2869 = !DILocation(line: 1229, column: 3, scope: !2857)
!2870 = !DILocation(line: 1229, column: 24, scope: !2857)
!2871 = !DILocation(line: 1229, column: 28, scope: !2857)
!2872 = !DILocation(line: 1230, column: 31, scope: !2857)
!2873 = !DILocation(line: 1230, column: 13, scope: !2857)
!2874 = !DILocation(line: 1230, column: 3, scope: !2857)
!2875 = !DILocation(line: 1230, column: 24, scope: !2857)
!2876 = !DILocation(line: 1230, column: 29, scope: !2857)
!2877 = !DILocation(line: 1232, column: 12, scope: !2857)
!2878 = !DILocation(line: 1234, column: 7, scope: !2879)
!2879 = distinct !DILexicalBlock(scope: !2857, file: !16, line: 1234, column: 7)
!2880 = !DILocation(line: 1234, column: 17, scope: !2879)
!2881 = !DILocation(line: 1235, column: 14, scope: !2879)
!2882 = !DILocation(line: 1235, column: 4, scope: !2879)
!2883 = !DILocation(line: 1238, column: 2, scope: !2857)
!2884 = !DILocalVariable(name: "i", scope: !2885, file: !16, line: 1240, type: !9)
!2885 = distinct !DILexicalBlock(scope: !2854, file: !16, line: 1238, column: 9)
!2886 = !DILocation(line: 1240, column: 7, scope: !2885)
!2887 = !DILocation(line: 1242, column: 9, scope: !2888)
!2888 = distinct !DILexicalBlock(scope: !2885, file: !16, line: 1242, column: 3)
!2889 = !DILocation(line: 1242, column: 8, scope: !2888)
!2890 = !DILocation(line: 1242, column: 13, scope: !2891)
!2891 = distinct !DILexicalBlock(scope: !2888, file: !16, line: 1242, column: 3)
!2892 = !DILocation(line: 1242, column: 14, scope: !2891)
!2893 = !DILocation(line: 1242, column: 3, scope: !2888)
!2894 = !DILocation(line: 1243, column: 18, scope: !2895)
!2895 = distinct !DILexicalBlock(scope: !2891, file: !16, line: 1243, column: 8)
!2896 = !DILocation(line: 1243, column: 8, scope: !2895)
!2897 = !DILocation(line: 1243, column: 21, scope: !2895)
!2898 = !DILocation(line: 1243, column: 29, scope: !2895)
!2899 = !DILocation(line: 1243, column: 26, scope: !2895)
!2900 = !DILocation(line: 1244, column: 19, scope: !2901)
!2901 = distinct !DILexicalBlock(scope: !2895, file: !16, line: 1244, column: 9)
!2902 = !DILocation(line: 1244, column: 9, scope: !2901)
!2903 = !DILocation(line: 1244, column: 22, scope: !2901)
!2904 = !DILocation(line: 1244, column: 30, scope: !2901)
!2905 = !DILocation(line: 1244, column: 27, scope: !2901)
!2906 = !DILocation(line: 1245, column: 16, scope: !2907)
!2907 = distinct !DILexicalBlock(scope: !2901, file: !16, line: 1244, column: 36)
!2908 = !DILocation(line: 1245, column: 6, scope: !2907)
!2909 = !DILocation(line: 1245, column: 27, scope: !2907)
!2910 = !DILocation(line: 1245, column: 32, scope: !2907)
!2911 = !DILocation(line: 1246, column: 6, scope: !2907)
!2912 = !DILocation(line: 1242, column: 31, scope: !2891)
!2913 = !DILocation(line: 1242, column: 3, scope: !2891)
!2914 = distinct !{!2914, !2893, !2915, !1517}
!2915 = !DILocation(line: 1247, column: 5, scope: !2888)
!2916 = !DILocation(line: 1250, column: 1, scope: !2842)
!2917 = distinct !DISubprogram(name: "find_connected_distance", linkageName: "_Z23find_connected_distanceP10vms_vectoriS0_iii", scope: !16, file: !16, line: 1256, type: !2918, scopeLine: 1257, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!2918 = !DISubroutineType(types: !2919)
!2919 = !{!5, !1447, !9, !1447, !9, !9, !9}
!2920 = !DILocalVariable(name: "p0", arg: 1, scope: !2917, file: !16, line: 1256, type: !1447)
!2921 = !DILocation(line: 1256, column: 41, scope: !2917)
!2922 = !DILocalVariable(name: "seg0", arg: 2, scope: !2917, file: !16, line: 1256, type: !9)
!2923 = !DILocation(line: 1256, column: 49, scope: !2917)
!2924 = !DILocalVariable(name: "p1", arg: 3, scope: !2917, file: !16, line: 1256, type: !1447)
!2925 = !DILocation(line: 1256, column: 67, scope: !2917)
!2926 = !DILocalVariable(name: "seg1", arg: 4, scope: !2917, file: !16, line: 1256, type: !9)
!2927 = !DILocation(line: 1256, column: 75, scope: !2917)
!2928 = !DILocalVariable(name: "max_depth", arg: 5, scope: !2917, file: !16, line: 1256, type: !9)
!2929 = !DILocation(line: 1256, column: 85, scope: !2917)
!2930 = !DILocalVariable(name: "wid_flag", arg: 6, scope: !2917, file: !16, line: 1256, type: !9)
!2931 = !DILocation(line: 1256, column: 100, scope: !2917)
!2932 = !DILocalVariable(name: "cur_seg", scope: !2917, file: !16, line: 1326, type: !9)
!2933 = !DILocation(line: 1326, column: 7, scope: !2917)
!2934 = !DILocalVariable(name: "sidenum", scope: !2917, file: !16, line: 1327, type: !9)
!2935 = !DILocation(line: 1327, column: 7, scope: !2917)
!2936 = !DILocalVariable(name: "qtail", scope: !2917, file: !16, line: 1328, type: !9)
!2937 = !DILocation(line: 1328, column: 7, scope: !2917)
!2938 = !DILocalVariable(name: "qhead", scope: !2917, file: !16, line: 1328, type: !9)
!2939 = !DILocation(line: 1328, column: 18, scope: !2917)
!2940 = !DILocalVariable(name: "i", scope: !2917, file: !16, line: 1329, type: !9)
!2941 = !DILocation(line: 1329, column: 7, scope: !2917)
!2942 = !DILocalVariable(name: "visited", scope: !2917, file: !16, line: 1330, type: !2943)
!2943 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 7200, elements: !176)
!2944 = !DILocation(line: 1330, column: 10, scope: !2917)
!2945 = !DILocalVariable(name: "seg_queue", scope: !2917, file: !16, line: 1331, type: !2946)
!2946 = !DICompositeType(tag: DW_TAG_array_type, baseType: !2947, size: 28800, elements: !176)
!2947 = !DIDerivedType(tag: DW_TAG_typedef, name: "seg_seg", file: !2948, line: 182, baseType: !2949)
!2948 = !DIFile(filename: "main_d2/aistruct.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "d122430e792a0ddc0f9eaa08ad217628")
!2949 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !2948, line: 180, size: 32, flags: DIFlagTypePassByValue, elements: !2950, identifier: "_ZTS7seg_seg")
!2950 = !{!2951, !2952}
!2951 = !DIDerivedType(tag: DW_TAG_member, name: "start", scope: !2949, file: !2948, line: 181, baseType: !23, size: 16)
!2952 = !DIDerivedType(tag: DW_TAG_member, name: "end", scope: !2949, file: !2948, line: 181, baseType: !23, size: 16, offset: 16)
!2953 = !DILocation(line: 1331, column: 10, scope: !2917)
!2954 = !DILocalVariable(name: "depth", scope: !2917, file: !16, line: 1332, type: !2955)
!2955 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 14400, elements: !176)
!2956 = !DILocation(line: 1332, column: 9, scope: !2917)
!2957 = !DILocalVariable(name: "cur_depth", scope: !2917, file: !16, line: 1333, type: !9)
!2958 = !DILocation(line: 1333, column: 7, scope: !2917)
!2959 = !DILocalVariable(name: "num_points", scope: !2917, file: !16, line: 1334, type: !9)
!2960 = !DILocation(line: 1334, column: 7, scope: !2917)
!2961 = !DILocalVariable(name: "point_segs", scope: !2917, file: !16, line: 1335, type: !2962)
!2962 = !DICompositeType(tag: DW_TAG_array_type, baseType: !2963, size: 8192, elements: !2968)
!2963 = !DIDerivedType(tag: DW_TAG_typedef, name: "point_seg", file: !2948, line: 178, baseType: !2964)
!2964 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !2948, line: 175, size: 128, flags: DIFlagTypePassByValue, elements: !2965, identifier: "_ZTS9point_seg")
!2965 = !{!2966, !2967}
!2966 = !DIDerivedType(tag: DW_TAG_member, name: "segnum", scope: !2964, file: !2948, line: 176, baseType: !9, size: 32)
!2967 = !DIDerivedType(tag: DW_TAG_member, name: "point", scope: !2964, file: !2948, line: 177, baseType: !1448, size: 96, offset: 32)
!2968 = !{!2969}
!2969 = !DISubrange(count: 64)
!2970 = !DILocation(line: 1335, column: 12, scope: !2917)
!2971 = !DILocalVariable(name: "dist", scope: !2917, file: !16, line: 1336, type: !5)
!2972 = !DILocation(line: 1336, column: 7, scope: !2917)
!2973 = !DILocation(line: 1343, column: 6, scope: !2974)
!2974 = distinct !DILexicalBlock(scope: !2917, file: !16, line: 1343, column: 6)
!2975 = !DILocation(line: 1343, column: 16, scope: !2974)
!2976 = !DILocation(line: 1344, column: 3, scope: !2977)
!2977 = distinct !DILexicalBlock(scope: !2974, file: !16, line: 1343, column: 40)
!2978 = !DILocation(line: 1345, column: 13, scope: !2977)
!2979 = !DILocation(line: 1346, column: 2, scope: !2977)
!2980 = !DILocation(line: 1348, column: 6, scope: !2981)
!2981 = distinct !DILexicalBlock(scope: !2917, file: !16, line: 1348, column: 6)
!2982 = !DILocation(line: 1348, column: 14, scope: !2981)
!2983 = !DILocation(line: 1348, column: 11, scope: !2981)
!2984 = !DILocation(line: 1349, column: 30, scope: !2985)
!2985 = distinct !DILexicalBlock(scope: !2981, file: !16, line: 1348, column: 20)
!2986 = !DILocation(line: 1350, column: 28, scope: !2985)
!2987 = !DILocation(line: 1350, column: 32, scope: !2985)
!2988 = !DILocation(line: 1350, column: 10, scope: !2985)
!2989 = !DILocation(line: 1350, column: 3, scope: !2985)
!2990 = !DILocalVariable(name: "conn_side", scope: !2991, file: !16, line: 1352, type: !9)
!2991 = distinct !DILexicalBlock(scope: !2981, file: !16, line: 1351, column: 9)
!2992 = !DILocation(line: 1352, column: 7, scope: !2991)
!2993 = !DILocation(line: 1353, column: 48, scope: !2994)
!2994 = distinct !DILexicalBlock(scope: !2991, file: !16, line: 1353, column: 7)
!2995 = !DILocation(line: 1353, column: 39, scope: !2994)
!2996 = !DILocation(line: 1353, column: 65, scope: !2994)
!2997 = !DILocation(line: 1353, column: 56, scope: !2994)
!2998 = !DILocation(line: 1353, column: 20, scope: !2994)
!2999 = !DILocation(line: 1353, column: 18, scope: !2994)
!3000 = !DILocation(line: 1353, column: 73, scope: !2994)
!3001 = !DILocation(line: 1354, column: 8, scope: !3002)
!3002 = distinct !DILexicalBlock(scope: !3003, file: !16, line: 1354, column: 8)
!3003 = distinct !DILexicalBlock(scope: !2994, file: !16, line: 1353, column: 80)
!3004 = !DILocation(line: 1354, column: 54, scope: !3002)
!3005 = !DILocation(line: 1354, column: 52, scope: !3002)
!3006 = !DILocation(line: 1355, column: 32, scope: !3007)
!3007 = distinct !DILexicalBlock(scope: !3002, file: !16, line: 1354, column: 64)
!3008 = !DILocation(line: 1357, column: 30, scope: !3007)
!3009 = !DILocation(line: 1357, column: 34, scope: !3007)
!3010 = !DILocation(line: 1357, column: 12, scope: !3007)
!3011 = !DILocation(line: 1357, column: 5, scope: !3007)
!3012 = !DILocation(line: 1359, column: 3, scope: !3003)
!3013 = !DILocation(line: 1363, column: 7, scope: !3014)
!3014 = distinct !DILexicalBlock(scope: !2917, file: !16, line: 1363, column: 6)
!3015 = !DILocation(line: 1363, column: 18, scope: !3014)
!3016 = !DILocation(line: 1363, column: 16, scope: !3014)
!3017 = !DILocation(line: 1363, column: 38, scope: !3014)
!3018 = !DILocation(line: 1363, column: 48, scope: !3014)
!3019 = !DILocation(line: 1363, column: 52, scope: !3014)
!3020 = !DILocation(line: 1363, column: 63, scope: !3014)
!3021 = !DILocation(line: 1363, column: 61, scope: !3014)
!3022 = !DILocation(line: 1364, column: 3, scope: !3023)
!3023 = distinct !DILexicalBlock(scope: !3014, file: !16, line: 1363, column: 85)
!3024 = !DILocation(line: 1365, column: 25, scope: !3023)
!3025 = !DILocation(line: 1365, column: 23, scope: !3023)
!3026 = !DILocation(line: 1366, column: 2, scope: !3023)
!3027 = !DILocation(line: 1369, column: 8, scope: !3028)
!3028 = distinct !DILexicalBlock(scope: !2917, file: !16, line: 1369, column: 2)
!3029 = !DILocation(line: 1369, column: 7, scope: !3028)
!3030 = !DILocation(line: 1369, column: 12, scope: !3031)
!3031 = distinct !DILexicalBlock(scope: !3028, file: !16, line: 1369, column: 2)
!3032 = !DILocation(line: 1369, column: 13, scope: !3031)
!3033 = !DILocation(line: 1369, column: 2, scope: !3028)
!3034 = !DILocation(line: 1370, column: 18, scope: !3035)
!3035 = distinct !DILexicalBlock(scope: !3031, file: !16, line: 1370, column: 7)
!3036 = !DILocation(line: 1370, column: 8, scope: !3035)
!3037 = !DILocation(line: 1370, column: 21, scope: !3035)
!3038 = !DILocation(line: 1370, column: 29, scope: !3035)
!3039 = !DILocation(line: 1370, column: 26, scope: !3035)
!3040 = !DILocation(line: 1370, column: 35, scope: !3035)
!3041 = !DILocation(line: 1370, column: 49, scope: !3035)
!3042 = !DILocation(line: 1370, column: 39, scope: !3035)
!3043 = !DILocation(line: 1370, column: 52, scope: !3035)
!3044 = !DILocation(line: 1370, column: 60, scope: !3035)
!3045 = !DILocation(line: 1370, column: 57, scope: !3035)
!3046 = !DILocation(line: 1371, column: 43, scope: !3047)
!3047 = distinct !DILexicalBlock(scope: !3035, file: !16, line: 1370, column: 67)
!3048 = !DILocation(line: 1371, column: 33, scope: !3047)
!3049 = !DILocation(line: 1371, column: 46, scope: !3047)
!3050 = !DILocation(line: 1371, column: 31, scope: !3047)
!3051 = !DILocation(line: 1373, column: 21, scope: !3047)
!3052 = !DILocation(line: 1373, column: 11, scope: !3047)
!3053 = !DILocation(line: 1373, column: 24, scope: !3047)
!3054 = !DILocation(line: 1373, column: 4, scope: !3047)
!3055 = !DILocation(line: 1370, column: 64, scope: !3035)
!3056 = !DILocation(line: 1369, column: 30, scope: !3031)
!3057 = !DILocation(line: 1369, column: 2, scope: !3031)
!3058 = distinct !{!3058, !3033, !3059, !1517}
!3059 = !DILocation(line: 1374, column: 3, scope: !3028)
!3060 = !DILocation(line: 1376, column: 13, scope: !2917)
!3061 = !DILocation(line: 1378, column: 2, scope: !2917)
!3062 = !DILocation(line: 1378, column: 21, scope: !2917)
!3063 = !DILocation(line: 1378, column: 42, scope: !2917)
!3064 = !DILocation(line: 1379, column: 2, scope: !2917)
!3065 = !DILocation(line: 1379, column: 39, scope: !2917)
!3066 = !DILocation(line: 1379, column: 60, scope: !2917)
!3067 = !DILocation(line: 1379, column: 38, scope: !2917)
!3068 = !DILocation(line: 1379, column: 36, scope: !2917)
!3069 = !DILocation(line: 1381, column: 12, scope: !2917)
!3070 = !DILocation(line: 1381, column: 10, scope: !2917)
!3071 = !DILocation(line: 1382, column: 10, scope: !2917)
!3072 = !DILocation(line: 1382, column: 2, scope: !2917)
!3073 = !DILocation(line: 1382, column: 19, scope: !2917)
!3074 = !DILocation(line: 1383, column: 12, scope: !2917)
!3075 = !DILocation(line: 1385, column: 2, scope: !2917)
!3076 = !DILocation(line: 1385, column: 9, scope: !2917)
!3077 = !DILocation(line: 1385, column: 20, scope: !2917)
!3078 = !DILocation(line: 1385, column: 17, scope: !2917)
!3079 = !DILocalVariable(name: "segp", scope: !3080, file: !16, line: 1386, type: !1455)
!3080 = distinct !DILexicalBlock(scope: !2917, file: !16, line: 1385, column: 26)
!3081 = !DILocation(line: 1386, column: 12, scope: !3080)
!3082 = !DILocation(line: 1386, column: 29, scope: !3080)
!3083 = !DILocation(line: 1386, column: 20, scope: !3080)
!3084 = !DILocation(line: 1388, column: 16, scope: !3085)
!3085 = distinct !DILexicalBlock(scope: !3080, file: !16, line: 1388, column: 3)
!3086 = !DILocation(line: 1388, column: 8, scope: !3085)
!3087 = !DILocation(line: 1388, column: 21, scope: !3088)
!3088 = distinct !DILexicalBlock(scope: !3085, file: !16, line: 1388, column: 3)
!3089 = !DILocation(line: 1388, column: 29, scope: !3088)
!3090 = !DILocation(line: 1388, column: 3, scope: !3085)
!3091 = !DILocalVariable(name: "snum", scope: !3092, file: !16, line: 1390, type: !9)
!3092 = distinct !DILexicalBlock(scope: !3088, file: !16, line: 1388, column: 65)
!3093 = !DILocation(line: 1390, column: 8, scope: !3092)
!3094 = !DILocation(line: 1390, column: 15, scope: !3092)
!3095 = !DILocation(line: 1392, column: 8, scope: !3096)
!3096 = distinct !DILexicalBlock(scope: !3092, file: !16, line: 1392, column: 8)
!3097 = !DILocation(line: 1392, column: 38, scope: !3096)
!3098 = !DILocation(line: 1392, column: 36, scope: !3096)
!3099 = !DILocalVariable(name: "this_seg", scope: !3100, file: !16, line: 1393, type: !9)
!3100 = distinct !DILexicalBlock(scope: !3096, file: !16, line: 1392, column: 48)
!3101 = !DILocation(line: 1393, column: 9, scope: !3100)
!3102 = !DILocation(line: 1393, column: 20, scope: !3100)
!3103 = !DILocation(line: 1393, column: 26, scope: !3100)
!3104 = !DILocation(line: 1393, column: 35, scope: !3100)
!3105 = !DILocation(line: 1395, column: 18, scope: !3106)
!3106 = distinct !DILexicalBlock(scope: !3100, file: !16, line: 1395, column: 9)
!3107 = !DILocation(line: 1395, column: 10, scope: !3106)
!3108 = !DILocation(line: 1395, column: 9, scope: !3106)
!3109 = !DILocation(line: 1396, column: 31, scope: !3110)
!3110 = distinct !DILexicalBlock(scope: !3106, file: !16, line: 1395, column: 29)
!3111 = !DILocation(line: 1396, column: 16, scope: !3110)
!3112 = !DILocation(line: 1396, column: 6, scope: !3110)
!3113 = !DILocation(line: 1396, column: 23, scope: !3110)
!3114 = !DILocation(line: 1396, column: 29, scope: !3110)
!3115 = !DILocation(line: 1397, column: 29, scope: !3110)
!3116 = !DILocation(line: 1397, column: 16, scope: !3110)
!3117 = !DILocation(line: 1397, column: 6, scope: !3110)
!3118 = !DILocation(line: 1397, column: 23, scope: !3110)
!3119 = !DILocation(line: 1397, column: 27, scope: !3110)
!3120 = !DILocation(line: 1398, column: 14, scope: !3110)
!3121 = !DILocation(line: 1398, column: 6, scope: !3110)
!3122 = !DILocation(line: 1398, column: 24, scope: !3110)
!3123 = !DILocation(line: 1399, column: 23, scope: !3110)
!3124 = !DILocation(line: 1399, column: 32, scope: !3110)
!3125 = !DILocation(line: 1399, column: 17, scope: !3110)
!3126 = !DILocation(line: 1399, column: 6, scope: !3110)
!3127 = !DILocation(line: 1399, column: 21, scope: !3110)
!3128 = !DILocation(line: 1400, column: 10, scope: !3129)
!3129 = distinct !DILexicalBlock(scope: !3110, file: !16, line: 1400, column: 10)
!3130 = !DILocation(line: 1400, column: 20, scope: !3129)
!3131 = !DILocation(line: 1401, column: 17, scope: !3132)
!3132 = distinct !DILexicalBlock(scope: !3133, file: !16, line: 1401, column: 11)
!3133 = distinct !DILexicalBlock(scope: !3129, file: !16, line: 1400, column: 27)
!3134 = !DILocation(line: 1401, column: 22, scope: !3132)
!3135 = !DILocation(line: 1401, column: 11, scope: !3132)
!3136 = !DILocation(line: 1401, column: 29, scope: !3132)
!3137 = !DILocation(line: 1401, column: 26, scope: !3132)
!3138 = !DILocation(line: 1402, column: 35, scope: !3139)
!3139 = distinct !DILexicalBlock(scope: !3132, file: !16, line: 1401, column: 40)
!3140 = !DILocation(line: 1403, column: 25, scope: !3139)
!3141 = !DILocation(line: 1403, column: 31, scope: !3139)
!3142 = !DILocation(line: 1403, column: 37, scope: !3139)
!3143 = !DILocation(line: 1403, column: 8, scope: !3139)
!3144 = !DILocation(line: 1404, column: 8, scope: !3139)
!3145 = !DILocation(line: 1406, column: 6, scope: !3133)
!3146 = !DILocation(line: 1406, column: 17, scope: !3147)
!3147 = distinct !DILexicalBlock(scope: !3129, file: !16, line: 1406, column: 17)
!3148 = !DILocation(line: 1406, column: 29, scope: !3147)
!3149 = !DILocation(line: 1406, column: 26, scope: !3147)
!3150 = !DILocation(line: 1407, column: 7, scope: !3151)
!3151 = distinct !DILexicalBlock(scope: !3147, file: !16, line: 1406, column: 35)
!3152 = !DILocation(line: 1409, column: 5, scope: !3110)
!3153 = !DILocation(line: 1411, column: 4, scope: !3100)
!3154 = !DILocation(line: 1412, column: 3, scope: !3092)
!3155 = !DILocation(line: 1388, column: 61, scope: !3088)
!3156 = !DILocation(line: 1388, column: 3, scope: !3088)
!3157 = distinct !{!3157, !3090, !3158, !1517}
!3158 = !DILocation(line: 1412, column: 3, scope: !3085)
!3159 = !DILocation(line: 1414, column: 7, scope: !3160)
!3160 = distinct !DILexicalBlock(scope: !3080, file: !16, line: 1414, column: 7)
!3161 = !DILocation(line: 1414, column: 16, scope: !3160)
!3162 = !DILocation(line: 1414, column: 13, scope: !3160)
!3163 = !DILocation(line: 1415, column: 31, scope: !3164)
!3164 = distinct !DILexicalBlock(scope: !3160, file: !16, line: 1414, column: 23)
!3165 = !DILocation(line: 1416, column: 21, scope: !3164)
!3166 = !DILocation(line: 1416, column: 27, scope: !3164)
!3167 = !DILocation(line: 1416, column: 33, scope: !3164)
!3168 = !DILocation(line: 1416, column: 4, scope: !3164)
!3169 = !DILocation(line: 1417, column: 4, scope: !3164)
!3170 = !DILocation(line: 1420, column: 23, scope: !3080)
!3171 = !DILocation(line: 1420, column: 13, scope: !3080)
!3172 = !DILocation(line: 1420, column: 30, scope: !3080)
!3173 = !DILocation(line: 1420, column: 11, scope: !3080)
!3174 = !DILocation(line: 1421, column: 21, scope: !3080)
!3175 = !DILocation(line: 1421, column: 15, scope: !3080)
!3176 = !DILocation(line: 1421, column: 13, scope: !3080)
!3177 = !DILocation(line: 1422, column: 8, scope: !3080)
!3178 = !DILocation(line: 1422, column: 3, scope: !3080)
!3179 = !DILabel(scope: !3080, name: "fcd_done1", file: !16, line: 1424)
!3180 = !DILocation(line: 1424, column: 1, scope: !3080)
!3181 = distinct !{!3181, !3075, !3182, !1517}
!3182 = !DILocation(line: 1425, column: 2, scope: !2917)
!3183 = !DILocation(line: 1428, column: 2, scope: !2917)
!3184 = !DILocation(line: 1428, column: 19, scope: !2917)
!3185 = !DILocation(line: 1428, column: 9, scope: !2917)
!3186 = !DILocation(line: 1428, column: 28, scope: !2917)
!3187 = !DILocation(line: 1428, column: 35, scope: !2917)
!3188 = !DILocation(line: 1428, column: 32, scope: !2917)
!3189 = !DILocation(line: 1429, column: 7, scope: !3190)
!3190 = distinct !DILexicalBlock(scope: !2917, file: !16, line: 1429, column: 7)
!3191 = !DILocation(line: 1429, column: 13, scope: !3190)
!3192 = !DILocation(line: 1430, column: 31, scope: !3193)
!3193 = distinct !DILexicalBlock(scope: !3190, file: !16, line: 1429, column: 18)
!3194 = !DILocation(line: 1431, column: 21, scope: !3193)
!3195 = !DILocation(line: 1431, column: 27, scope: !3193)
!3196 = !DILocation(line: 1431, column: 33, scope: !3193)
!3197 = !DILocation(line: 1431, column: 4, scope: !3193)
!3198 = !DILocation(line: 1432, column: 4, scope: !3193)
!3199 = distinct !{!3199, !3183, !3200, !1517}
!3200 = !DILocation(line: 1433, column: 3, scope: !2917)
!3201 = !DILocation(line: 1435, column: 2, scope: !2917)
!3202 = !DILocation(line: 1435, column: 9, scope: !2917)
!3203 = !DILocation(line: 1435, column: 15, scope: !2917)
!3204 = !DILocalVariable(name: "parent_seg", scope: !3205, file: !16, line: 1436, type: !9)
!3205 = distinct !DILexicalBlock(scope: !2917, file: !16, line: 1435, column: 21)
!3206 = !DILocation(line: 1436, column: 7, scope: !3205)
!3207 = !DILocalVariable(name: "this_seg", scope: !3205, file: !16, line: 1436, type: !9)
!3208 = !DILocation(line: 1436, column: 19, scope: !3205)
!3209 = !DILocation(line: 1438, column: 24, scope: !3205)
!3210 = !DILocation(line: 1438, column: 14, scope: !3205)
!3211 = !DILocation(line: 1438, column: 31, scope: !3205)
!3212 = !DILocation(line: 1438, column: 12, scope: !3205)
!3213 = !DILocation(line: 1439, column: 26, scope: !3205)
!3214 = !DILocation(line: 1439, column: 16, scope: !3205)
!3215 = !DILocation(line: 1439, column: 33, scope: !3205)
!3216 = !DILocation(line: 1439, column: 14, scope: !3205)
!3217 = !DILocation(line: 1440, column: 35, scope: !3205)
!3218 = !DILocation(line: 1440, column: 14, scope: !3205)
!3219 = !DILocation(line: 1440, column: 3, scope: !3205)
!3220 = !DILocation(line: 1440, column: 26, scope: !3205)
!3221 = !DILocation(line: 1440, column: 33, scope: !3205)
!3222 = !DILocation(line: 1441, column: 38, scope: !3205)
!3223 = !DILocation(line: 1441, column: 27, scope: !3205)
!3224 = !DILocation(line: 1441, column: 50, scope: !3205)
!3225 = !DILocation(line: 1441, column: 66, scope: !3205)
!3226 = !DILocation(line: 1441, column: 57, scope: !3205)
!3227 = !DILocation(line: 1441, column: 3, scope: !3205)
!3228 = !DILocation(line: 1442, column: 13, scope: !3205)
!3229 = !DILocation(line: 1444, column: 7, scope: !3230)
!3230 = distinct !DILexicalBlock(scope: !3205, file: !16, line: 1444, column: 7)
!3231 = !DILocation(line: 1444, column: 21, scope: !3230)
!3232 = !DILocation(line: 1444, column: 18, scope: !3230)
!3233 = !DILocation(line: 1445, column: 4, scope: !3230)
!3234 = !DILocation(line: 1447, column: 3, scope: !3205)
!3235 = !DILocation(line: 1447, column: 20, scope: !3205)
!3236 = !DILocation(line: 1447, column: 10, scope: !3205)
!3237 = !DILocation(line: 1447, column: 29, scope: !3205)
!3238 = !DILocation(line: 1447, column: 36, scope: !3205)
!3239 = !DILocation(line: 1447, column: 33, scope: !3205)
!3240 = !DILocation(line: 1448, column: 4, scope: !3205)
!3241 = distinct !{!3241, !3234, !3240, !1517}
!3242 = distinct !{!3242, !3201, !3243, !1517}
!3243 = !DILocation(line: 1449, column: 2, scope: !2917)
!3244 = !DILocation(line: 1451, column: 34, scope: !2917)
!3245 = !DILocation(line: 1451, column: 13, scope: !2917)
!3246 = !DILocation(line: 1451, column: 2, scope: !2917)
!3247 = !DILocation(line: 1451, column: 25, scope: !2917)
!3248 = !DILocation(line: 1451, column: 32, scope: !2917)
!3249 = !DILocation(line: 1452, column: 37, scope: !2917)
!3250 = !DILocation(line: 1452, column: 26, scope: !2917)
!3251 = !DILocation(line: 1452, column: 49, scope: !2917)
!3252 = !DILocation(line: 1452, column: 65, scope: !2917)
!3253 = !DILocation(line: 1452, column: 56, scope: !2917)
!3254 = !DILocation(line: 1452, column: 2, scope: !2917)
!3255 = !DILocation(line: 1453, column: 12, scope: !2917)
!3256 = !DILocation(line: 1455, column: 6, scope: !3257)
!3257 = distinct !DILexicalBlock(scope: !2917, file: !16, line: 1455, column: 6)
!3258 = !DILocation(line: 1455, column: 17, scope: !3257)
!3259 = !DILocation(line: 1456, column: 32, scope: !3260)
!3260 = distinct !DILexicalBlock(scope: !3257, file: !16, line: 1455, column: 23)
!3261 = !DILocation(line: 1456, column: 30, scope: !3260)
!3262 = !DILocation(line: 1457, column: 28, scope: !3260)
!3263 = !DILocation(line: 1457, column: 32, scope: !3260)
!3264 = !DILocation(line: 1457, column: 10, scope: !3260)
!3265 = !DILocation(line: 1457, column: 3, scope: !3260)
!3266 = !DILocation(line: 1459, column: 28, scope: !3267)
!3267 = distinct !DILexicalBlock(scope: !3257, file: !16, line: 1458, column: 9)
!3268 = !DILocation(line: 1459, column: 33, scope: !3267)
!3269 = !DILocation(line: 1459, column: 47, scope: !3267)
!3270 = !DILocation(line: 1459, column: 10, scope: !3267)
!3271 = !DILocation(line: 1459, column: 8, scope: !3267)
!3272 = !DILocation(line: 1460, column: 29, scope: !3267)
!3273 = !DILocation(line: 1460, column: 45, scope: !3267)
!3274 = !DILocation(line: 1460, column: 55, scope: !3267)
!3275 = !DILocation(line: 1460, column: 34, scope: !3267)
!3276 = !DILocation(line: 1460, column: 59, scope: !3267)
!3277 = !DILocation(line: 1460, column: 11, scope: !3267)
!3278 = !DILocation(line: 1460, column: 8, scope: !3267)
!3279 = !DILocation(line: 1462, column: 9, scope: !3280)
!3280 = distinct !DILexicalBlock(scope: !3267, file: !16, line: 1462, column: 3)
!3281 = !DILocation(line: 1462, column: 8, scope: !3280)
!3282 = !DILocation(line: 1462, column: 13, scope: !3283)
!3283 = distinct !DILexicalBlock(scope: !3280, file: !16, line: 1462, column: 3)
!3284 = !DILocation(line: 1462, column: 15, scope: !3283)
!3285 = !DILocation(line: 1462, column: 25, scope: !3283)
!3286 = !DILocation(line: 1462, column: 14, scope: !3283)
!3287 = !DILocation(line: 1462, column: 3, scope: !3280)
!3288 = !DILocalVariable(name: "ndist", scope: !3289, file: !16, line: 1463, type: !5)
!3289 = distinct !DILexicalBlock(scope: !3283, file: !16, line: 1462, column: 34)
!3290 = !DILocation(line: 1463, column: 8, scope: !3289)
!3291 = !DILocation(line: 1464, column: 42, scope: !3289)
!3292 = !DILocation(line: 1464, column: 31, scope: !3289)
!3293 = !DILocation(line: 1464, column: 45, scope: !3289)
!3294 = !DILocation(line: 1464, column: 64, scope: !3289)
!3295 = !DILocation(line: 1464, column: 65, scope: !3289)
!3296 = !DILocation(line: 1464, column: 53, scope: !3289)
!3297 = !DILocation(line: 1464, column: 69, scope: !3289)
!3298 = !DILocation(line: 1464, column: 12, scope: !3289)
!3299 = !DILocation(line: 1464, column: 10, scope: !3289)
!3300 = !DILocation(line: 1465, column: 12, scope: !3289)
!3301 = !DILocation(line: 1465, column: 9, scope: !3289)
!3302 = !DILocation(line: 1466, column: 3, scope: !3289)
!3303 = !DILocation(line: 1462, column: 30, scope: !3283)
!3304 = !DILocation(line: 1462, column: 3, scope: !3283)
!3305 = distinct !{!3305, !3287, !3306, !1517}
!3306 = !DILocation(line: 1466, column: 3, scope: !3280)
!3307 = !DILocation(line: 1470, column: 31, scope: !2917)
!3308 = !DILocation(line: 1470, column: 29, scope: !2917)
!3309 = !DILocation(line: 1471, column: 19, scope: !2917)
!3310 = !DILocation(line: 1471, column: 25, scope: !2917)
!3311 = !DILocation(line: 1471, column: 31, scope: !2917)
!3312 = !DILocation(line: 1471, column: 43, scope: !2917)
!3313 = !DILocation(line: 1471, column: 2, scope: !2917)
!3314 = !DILocation(line: 1473, column: 9, scope: !2917)
!3315 = !DILocation(line: 1473, column: 2, scope: !2917)
!3316 = !DILocation(line: 1475, column: 1, scope: !2917)
!3317 = distinct !DISubprogram(name: "convert_to_byte", linkageName: "_Z15convert_to_bytei", scope: !16, file: !16, line: 1477, type: !3318, scopeLine: 1478, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!3318 = !DISubroutineType(types: !3319)
!3319 = !{!25, !5}
!3320 = !DILocalVariable(name: "f", arg: 1, scope: !3317, file: !16, line: 1477, type: !5)
!3321 = !DILocation(line: 1477, column: 28, scope: !3317)
!3322 = !DILocation(line: 1479, column: 6, scope: !3323)
!3323 = distinct !DILexicalBlock(scope: !3317, file: !16, line: 1479, column: 6)
!3324 = !DILocation(line: 1479, column: 8, scope: !3323)
!3325 = !DILocation(line: 1480, column: 3, scope: !3323)
!3326 = !DILocation(line: 1481, column: 11, scope: !3327)
!3327 = distinct !DILexicalBlock(scope: !3323, file: !16, line: 1481, column: 11)
!3328 = !DILocation(line: 1481, column: 13, scope: !3327)
!3329 = !DILocation(line: 1482, column: 3, scope: !3327)
!3330 = !DILocation(line: 1484, column: 10, scope: !3327)
!3331 = !DILocation(line: 1484, column: 12, scope: !3327)
!3332 = !DILocation(line: 1484, column: 3, scope: !3327)
!3333 = !DILocation(line: 1485, column: 1, scope: !3317)
!3334 = distinct !DISubprogram(name: "create_shortpos", linkageName: "_Z15create_shortposP8shortposP6object", scope: !16, file: !16, line: 1493, type: !3335, scopeLine: 1494, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!3335 = !DISubroutineType(types: !3336)
!3336 = !{null, !3337, !3353}
!3337 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3338, size: 64)
!3338 = !DIDerivedType(tag: DW_TAG_typedef, name: "shortpos", file: !3339, line: 134, baseType: !3340)
!3339 = !DIFile(filename: "main_d2/object.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "1f2325d356aae4b692933d2aae4f3afd")
!3340 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "shortpos", file: !3339, line: 128, size: 192, flags: DIFlagTypePassByValue, elements: !3341, identifier: "_ZTS8shortpos")
!3341 = !{!3342, !3346, !3347, !3348, !3349, !3350, !3351, !3352}
!3342 = !DIDerivedType(tag: DW_TAG_member, name: "bytemat", scope: !3340, file: !3339, line: 130, baseType: !3343, size: 72)
!3343 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 72, elements: !3344)
!3344 = !{!3345}
!3345 = !DISubrange(count: 9)
!3346 = !DIDerivedType(tag: DW_TAG_member, name: "xo", scope: !3340, file: !3339, line: 131, baseType: !23, size: 16, offset: 80)
!3347 = !DIDerivedType(tag: DW_TAG_member, name: "yo", scope: !3340, file: !3339, line: 131, baseType: !23, size: 16, offset: 96)
!3348 = !DIDerivedType(tag: DW_TAG_member, name: "zo", scope: !3340, file: !3339, line: 131, baseType: !23, size: 16, offset: 112)
!3349 = !DIDerivedType(tag: DW_TAG_member, name: "segment", scope: !3340, file: !3339, line: 132, baseType: !23, size: 16, offset: 128)
!3350 = !DIDerivedType(tag: DW_TAG_member, name: "velx", scope: !3340, file: !3339, line: 133, baseType: !23, size: 16, offset: 144)
!3351 = !DIDerivedType(tag: DW_TAG_member, name: "vely", scope: !3340, file: !3339, line: 133, baseType: !23, size: 16, offset: 160)
!3352 = !DIDerivedType(tag: DW_TAG_member, name: "velz", scope: !3340, file: !3339, line: 133, baseType: !23, size: 16, offset: 176)
!3353 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3354, size: 64)
!3354 = !DIDerivedType(tag: DW_TAG_typedef, name: "object", file: !3339, line: 259, baseType: !3355)
!3355 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "object", file: !3339, line: 210, size: 2144, flags: DIFlagTypePassByValue, elements: !3356, identifier: "_ZTS6object")
!3356 = !{!3357, !3358, !3359, !3360, !3361, !3362, !3363, !3364, !3365, !3366, !3367, !3368, !3369, !3376, !3377, !3378, !3379, !3380, !3381, !3382, !3383, !3384, !3402, !3453}
!3357 = !DIDerivedType(tag: DW_TAG_member, name: "signature", scope: !3355, file: !3339, line: 212, baseType: !9, size: 32)
!3358 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !3355, file: !3339, line: 213, baseType: !31, size: 8, offset: 32)
!3359 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !3355, file: !3339, line: 214, baseType: !31, size: 8, offset: 40)
!3360 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !3355, file: !3339, line: 215, baseType: !23, size: 16, offset: 48)
!3361 = !DIDerivedType(tag: DW_TAG_member, name: "prev", scope: !3355, file: !3339, line: 215, baseType: !23, size: 16, offset: 64)
!3362 = !DIDerivedType(tag: DW_TAG_member, name: "control_type", scope: !3355, file: !3339, line: 216, baseType: !31, size: 8, offset: 80)
!3363 = !DIDerivedType(tag: DW_TAG_member, name: "movement_type", scope: !3355, file: !3339, line: 217, baseType: !31, size: 8, offset: 88)
!3364 = !DIDerivedType(tag: DW_TAG_member, name: "render_type", scope: !3355, file: !3339, line: 218, baseType: !31, size: 8, offset: 96)
!3365 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !3355, file: !3339, line: 219, baseType: !31, size: 8, offset: 104)
!3366 = !DIDerivedType(tag: DW_TAG_member, name: "segnum", scope: !3355, file: !3339, line: 220, baseType: !23, size: 16, offset: 112)
!3367 = !DIDerivedType(tag: DW_TAG_member, name: "attached_obj", scope: !3355, file: !3339, line: 221, baseType: !23, size: 16, offset: 128)
!3368 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !3355, file: !3339, line: 222, baseType: !1448, size: 96, offset: 160)
!3369 = !DIDerivedType(tag: DW_TAG_member, name: "orient", scope: !3355, file: !3339, line: 223, baseType: !3370, size: 288, offset: 256)
!3370 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_matrix", file: !1449, line: 47, baseType: !3371)
!3371 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_matrix", file: !1449, line: 44, size: 288, flags: DIFlagTypePassByValue, elements: !3372, identifier: "_ZTS10vms_matrix")
!3372 = !{!3373, !3374, !3375}
!3373 = !DIDerivedType(tag: DW_TAG_member, name: "rvec", scope: !3371, file: !1449, line: 46, baseType: !1448, size: 96)
!3374 = !DIDerivedType(tag: DW_TAG_member, name: "uvec", scope: !3371, file: !1449, line: 46, baseType: !1448, size: 96, offset: 96)
!3375 = !DIDerivedType(tag: DW_TAG_member, name: "fvec", scope: !3371, file: !1449, line: 46, baseType: !1448, size: 96, offset: 192)
!3376 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !3355, file: !3339, line: 224, baseType: !5, size: 32, offset: 544)
!3377 = !DIDerivedType(tag: DW_TAG_member, name: "shields", scope: !3355, file: !3339, line: 225, baseType: !5, size: 32, offset: 576)
!3378 = !DIDerivedType(tag: DW_TAG_member, name: "last_pos", scope: !3355, file: !3339, line: 226, baseType: !1448, size: 96, offset: 608)
!3379 = !DIDerivedType(tag: DW_TAG_member, name: "contains_type", scope: !3355, file: !3339, line: 227, baseType: !25, size: 8, offset: 704)
!3380 = !DIDerivedType(tag: DW_TAG_member, name: "contains_id", scope: !3355, file: !3339, line: 228, baseType: !25, size: 8, offset: 712)
!3381 = !DIDerivedType(tag: DW_TAG_member, name: "contains_count", scope: !3355, file: !3339, line: 229, baseType: !25, size: 8, offset: 720)
!3382 = !DIDerivedType(tag: DW_TAG_member, name: "matcen_creator", scope: !3355, file: !3339, line: 230, baseType: !25, size: 8, offset: 728)
!3383 = !DIDerivedType(tag: DW_TAG_member, name: "lifeleft", scope: !3355, file: !3339, line: 231, baseType: !5, size: 32, offset: 736)
!3384 = !DIDerivedType(tag: DW_TAG_member, name: "mtype", scope: !3355, file: !3339, line: 240, baseType: !3385, size: 512, offset: 768)
!3385 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !3355, file: !3339, line: 236, size: 512, flags: DIFlagTypePassByValue, elements: !3386, identifier: "_ZTSN6objectUt_E")
!3386 = !{!3387, !3401}
!3387 = !DIDerivedType(tag: DW_TAG_member, name: "phys_info", scope: !3385, file: !3339, line: 238, baseType: !3388, size: 512)
!3388 = !DIDerivedType(tag: DW_TAG_typedef, name: "physics_info", file: !3339, line: 153, baseType: !3389)
!3389 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "physics_info", file: !3339, line: 142, size: 512, flags: DIFlagTypePassByValue, elements: !3390, identifier: "_ZTS12physics_info")
!3390 = !{!3391, !3392, !3393, !3394, !3395, !3396, !3397, !3398, !3400}
!3391 = !DIDerivedType(tag: DW_TAG_member, name: "velocity", scope: !3389, file: !3339, line: 144, baseType: !1448, size: 96)
!3392 = !DIDerivedType(tag: DW_TAG_member, name: "thrust", scope: !3389, file: !3339, line: 145, baseType: !1448, size: 96, offset: 96)
!3393 = !DIDerivedType(tag: DW_TAG_member, name: "mass", scope: !3389, file: !3339, line: 146, baseType: !5, size: 32, offset: 192)
!3394 = !DIDerivedType(tag: DW_TAG_member, name: "drag", scope: !3389, file: !3339, line: 147, baseType: !5, size: 32, offset: 224)
!3395 = !DIDerivedType(tag: DW_TAG_member, name: "brakes", scope: !3389, file: !3339, line: 148, baseType: !5, size: 32, offset: 256)
!3396 = !DIDerivedType(tag: DW_TAG_member, name: "rotvel", scope: !3389, file: !3339, line: 149, baseType: !1448, size: 96, offset: 288)
!3397 = !DIDerivedType(tag: DW_TAG_member, name: "rotthrust", scope: !3389, file: !3339, line: 150, baseType: !1448, size: 96, offset: 384)
!3398 = !DIDerivedType(tag: DW_TAG_member, name: "turnroll", scope: !3389, file: !3339, line: 151, baseType: !3399, size: 16, offset: 480)
!3399 = !DIDerivedType(tag: DW_TAG_typedef, name: "fixang", file: !6, line: 21, baseType: !23)
!3400 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !3389, file: !3339, line: 152, baseType: !193, size: 16, offset: 496)
!3401 = !DIDerivedType(tag: DW_TAG_member, name: "spin_rate", scope: !3385, file: !3339, line: 239, baseType: !1448, size: 96)
!3402 = !DIDerivedType(tag: DW_TAG_member, name: "ctype", scope: !3355, file: !3339, line: 250, baseType: !3403, size: 256, offset: 1280)
!3403 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !3355, file: !3339, line: 243, size: 256, flags: DIFlagTypePassByValue, elements: !3404, identifier: "_ZTSN6objectUt0_E")
!3404 = !{!3405, !3416, !3426, !3441, !3446}
!3405 = !DIDerivedType(tag: DW_TAG_member, name: "laser_info", scope: !3403, file: !3339, line: 245, baseType: !3406, size: 160)
!3406 = !DIDerivedType(tag: DW_TAG_typedef, name: "laser_info_t", file: !3339, line: 166, baseType: !3407)
!3407 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "laser_info_s", file: !3339, line: 157, size: 160, flags: DIFlagTypePassByValue, elements: !3408, identifier: "_ZTS12laser_info_s")
!3408 = !{!3409, !3410, !3411, !3412, !3413, !3414, !3415}
!3409 = !DIDerivedType(tag: DW_TAG_member, name: "parent_type", scope: !3407, file: !3339, line: 159, baseType: !23, size: 16)
!3410 = !DIDerivedType(tag: DW_TAG_member, name: "parent_num", scope: !3407, file: !3339, line: 160, baseType: !23, size: 16, offset: 16)
!3411 = !DIDerivedType(tag: DW_TAG_member, name: "parent_signature", scope: !3407, file: !3339, line: 161, baseType: !9, size: 32, offset: 32)
!3412 = !DIDerivedType(tag: DW_TAG_member, name: "creation_time", scope: !3407, file: !3339, line: 162, baseType: !5, size: 32, offset: 64)
!3413 = !DIDerivedType(tag: DW_TAG_member, name: "last_hitobj", scope: !3407, file: !3339, line: 163, baseType: !23, size: 16, offset: 96)
!3414 = !DIDerivedType(tag: DW_TAG_member, name: "track_goal", scope: !3407, file: !3339, line: 164, baseType: !23, size: 16, offset: 112)
!3415 = !DIDerivedType(tag: DW_TAG_member, name: "multiplier", scope: !3407, file: !3339, line: 165, baseType: !5, size: 32, offset: 128)
!3416 = !DIDerivedType(tag: DW_TAG_member, name: "expl_info", scope: !3403, file: !3339, line: 246, baseType: !3417, size: 128)
!3417 = !DIDerivedType(tag: DW_TAG_typedef, name: "explosion_info", file: !3339, line: 176, baseType: !3418)
!3418 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "explosion_info", file: !3339, line: 168, size: 128, flags: DIFlagTypePassByValue, elements: !3419, identifier: "_ZTS14explosion_info")
!3419 = !{!3420, !3421, !3422, !3423, !3424, !3425}
!3420 = !DIDerivedType(tag: DW_TAG_member, name: "spawn_time", scope: !3418, file: !3339, line: 170, baseType: !5, size: 32)
!3421 = !DIDerivedType(tag: DW_TAG_member, name: "delete_time", scope: !3418, file: !3339, line: 171, baseType: !5, size: 32, offset: 32)
!3422 = !DIDerivedType(tag: DW_TAG_member, name: "delete_objnum", scope: !3418, file: !3339, line: 172, baseType: !23, size: 16, offset: 64)
!3423 = !DIDerivedType(tag: DW_TAG_member, name: "attach_parent", scope: !3418, file: !3339, line: 173, baseType: !23, size: 16, offset: 80)
!3424 = !DIDerivedType(tag: DW_TAG_member, name: "prev_attach", scope: !3418, file: !3339, line: 174, baseType: !23, size: 16, offset: 96)
!3425 = !DIDerivedType(tag: DW_TAG_member, name: "next_attach", scope: !3418, file: !3339, line: 175, baseType: !23, size: 16, offset: 112)
!3426 = !DIDerivedType(tag: DW_TAG_member, name: "ai_info", scope: !3403, file: !3339, line: 247, baseType: !3427, size: 256)
!3427 = !DIDerivedType(tag: DW_TAG_typedef, name: "ai_static", file: !2948, line: 144, baseType: !3428)
!3428 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ai_static", file: !2948, line: 127, size: 256, flags: DIFlagTypePassByValue, elements: !3429, identifier: "_ZTS9ai_static")
!3429 = !{!3430, !3431, !3433, !3434, !3435, !3436, !3437, !3438, !3439, !3440}
!3430 = !DIDerivedType(tag: DW_TAG_member, name: "behavior", scope: !3428, file: !2948, line: 128, baseType: !31, size: 8)
!3431 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !3428, file: !2948, line: 129, baseType: !3432, size: 88, offset: 8)
!3432 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 88, elements: !152)
!3433 = !DIDerivedType(tag: DW_TAG_member, name: "hide_segment", scope: !3428, file: !2948, line: 130, baseType: !23, size: 16, offset: 96)
!3434 = !DIDerivedType(tag: DW_TAG_member, name: "hide_index", scope: !3428, file: !2948, line: 131, baseType: !23, size: 16, offset: 112)
!3435 = !DIDerivedType(tag: DW_TAG_member, name: "path_length", scope: !3428, file: !2948, line: 132, baseType: !23, size: 16, offset: 128)
!3436 = !DIDerivedType(tag: DW_TAG_member, name: "cur_path_index", scope: !3428, file: !2948, line: 133, baseType: !25, size: 8, offset: 144)
!3437 = !DIDerivedType(tag: DW_TAG_member, name: "dying_sound_playing", scope: !3428, file: !2948, line: 134, baseType: !25, size: 8, offset: 152)
!3438 = !DIDerivedType(tag: DW_TAG_member, name: "danger_laser_num", scope: !3428, file: !2948, line: 139, baseType: !23, size: 16, offset: 160)
!3439 = !DIDerivedType(tag: DW_TAG_member, name: "danger_laser_signature", scope: !3428, file: !2948, line: 140, baseType: !9, size: 32, offset: 192)
!3440 = !DIDerivedType(tag: DW_TAG_member, name: "dying_start_time", scope: !3428, file: !2948, line: 141, baseType: !5, size: 32, offset: 224)
!3441 = !DIDerivedType(tag: DW_TAG_member, name: "light_info", scope: !3403, file: !3339, line: 248, baseType: !3442, size: 32)
!3442 = !DIDerivedType(tag: DW_TAG_typedef, name: "light_info_t", file: !3339, line: 181, baseType: !3443)
!3443 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "light_info_s", file: !3339, line: 178, size: 32, flags: DIFlagTypePassByValue, elements: !3444, identifier: "_ZTS12light_info_s")
!3444 = !{!3445}
!3445 = !DIDerivedType(tag: DW_TAG_member, name: "intensity", scope: !3443, file: !3339, line: 180, baseType: !5, size: 32)
!3446 = !DIDerivedType(tag: DW_TAG_member, name: "powerup_info", scope: !3403, file: !3339, line: 249, baseType: !3447, size: 96)
!3447 = !DIDerivedType(tag: DW_TAG_typedef, name: "powerup_info_t", file: !3339, line: 190, baseType: !3448)
!3448 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "powerup_info_s", file: !3339, line: 185, size: 96, flags: DIFlagTypePassByValue, elements: !3449, identifier: "_ZTS14powerup_info_s")
!3449 = !{!3450, !3451, !3452}
!3450 = !DIDerivedType(tag: DW_TAG_member, name: "count", scope: !3448, file: !3339, line: 187, baseType: !9, size: 32)
!3451 = !DIDerivedType(tag: DW_TAG_member, name: "creation_time", scope: !3448, file: !3339, line: 188, baseType: !5, size: 32, offset: 32)
!3452 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !3448, file: !3339, line: 189, baseType: !9, size: 32, offset: 64)
!3453 = !DIDerivedType(tag: DW_TAG_member, name: "rtype", scope: !3355, file: !3339, line: 257, baseType: !3454, size: 608, offset: 1536)
!3454 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !3355, file: !3339, line: 253, size: 608, flags: DIFlagTypePassByValue, elements: !3455, identifier: "_ZTSN6objectUt1_E")
!3455 = !{!3456, !3474}
!3456 = !DIDerivedType(tag: DW_TAG_member, name: "pobj_info", scope: !3454, file: !3339, line: 255, baseType: !3457, size: 608)
!3457 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyobj_info", file: !3339, line: 208, baseType: !3458)
!3458 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "polyobj_info", file: !3339, line: 201, size: 608, flags: DIFlagTypePassByValue, elements: !3459, identifier: "_ZTS12polyobj_info")
!3459 = !{!3460, !3461, !3471, !3472, !3473}
!3460 = !DIDerivedType(tag: DW_TAG_member, name: "model_num", scope: !3458, file: !3339, line: 203, baseType: !9, size: 32)
!3461 = !DIDerivedType(tag: DW_TAG_member, name: "anim_angles", scope: !3458, file: !3339, line: 204, baseType: !3462, size: 480, offset: 32)
!3462 = !DICompositeType(tag: DW_TAG_array_type, baseType: !3463, size: 480, elements: !3469)
!3463 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_angvec", file: !1449, line: 40, baseType: !3464)
!3464 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_angvec", file: !1449, line: 37, size: 48, flags: DIFlagTypePassByValue, elements: !3465, identifier: "_ZTS10vms_angvec")
!3465 = !{!3466, !3467, !3468}
!3466 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !3464, file: !1449, line: 39, baseType: !3399, size: 16)
!3467 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !3464, file: !1449, line: 39, baseType: !3399, size: 16, offset: 16)
!3468 = !DIDerivedType(tag: DW_TAG_member, name: "h", scope: !3464, file: !1449, line: 39, baseType: !3399, size: 16, offset: 32)
!3469 = !{!3470}
!3470 = !DISubrange(count: 10)
!3471 = !DIDerivedType(tag: DW_TAG_member, name: "subobj_flags", scope: !3458, file: !3339, line: 205, baseType: !9, size: 32, offset: 512)
!3472 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_override", scope: !3458, file: !3339, line: 206, baseType: !9, size: 32, offset: 544)
!3473 = !DIDerivedType(tag: DW_TAG_member, name: "alt_textures", scope: !3458, file: !3339, line: 207, baseType: !9, size: 32, offset: 576)
!3474 = !DIDerivedType(tag: DW_TAG_member, name: "vclip_info", scope: !3454, file: !3339, line: 256, baseType: !3475, size: 96)
!3475 = !DIDerivedType(tag: DW_TAG_typedef, name: "vclip_info_t", file: !3339, line: 197, baseType: !3476)
!3476 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vclip_info_s", file: !3339, line: 192, size: 96, flags: DIFlagTypePassByValue, elements: !3477, identifier: "_ZTS12vclip_info_s")
!3477 = !{!3478, !3479, !3480}
!3478 = !DIDerivedType(tag: DW_TAG_member, name: "vclip_num", scope: !3476, file: !3339, line: 194, baseType: !9, size: 32)
!3479 = !DIDerivedType(tag: DW_TAG_member, name: "frametime", scope: !3476, file: !3339, line: 195, baseType: !5, size: 32, offset: 32)
!3480 = !DIDerivedType(tag: DW_TAG_member, name: "framenum", scope: !3476, file: !3339, line: 196, baseType: !25, size: 8, offset: 64)
!3481 = !DILocalVariable(name: "spp", arg: 1, scope: !3334, file: !16, line: 1493, type: !3337)
!3482 = !DILocation(line: 1493, column: 32, scope: !3334)
!3483 = !DILocalVariable(name: "objp", arg: 2, scope: !3334, file: !16, line: 1493, type: !3353)
!3484 = !DILocation(line: 1493, column: 45, scope: !3334)
!3485 = !DILocalVariable(name: "sp", scope: !3334, file: !16, line: 1535, type: !1621)
!3486 = !DILocation(line: 1535, column: 10, scope: !3334)
!3487 = !DILocation(line: 1537, column: 7, scope: !3334)
!3488 = !DILocation(line: 1537, column: 12, scope: !3334)
!3489 = !DILocation(line: 1537, column: 5, scope: !3334)
!3490 = !DILocation(line: 1539, column: 26, scope: !3334)
!3491 = !DILocation(line: 1539, column: 32, scope: !3334)
!3492 = !DILocation(line: 1539, column: 39, scope: !3334)
!3493 = !DILocation(line: 1539, column: 44, scope: !3334)
!3494 = !DILocation(line: 1539, column: 10, scope: !3334)
!3495 = !DILocation(line: 1539, column: 5, scope: !3334)
!3496 = !DILocation(line: 1539, column: 8, scope: !3334)
!3497 = !DILocation(line: 1540, column: 26, scope: !3334)
!3498 = !DILocation(line: 1540, column: 32, scope: !3334)
!3499 = !DILocation(line: 1540, column: 39, scope: !3334)
!3500 = !DILocation(line: 1540, column: 44, scope: !3334)
!3501 = !DILocation(line: 1540, column: 10, scope: !3334)
!3502 = !DILocation(line: 1540, column: 5, scope: !3334)
!3503 = !DILocation(line: 1540, column: 8, scope: !3334)
!3504 = !DILocation(line: 1541, column: 26, scope: !3334)
!3505 = !DILocation(line: 1541, column: 32, scope: !3334)
!3506 = !DILocation(line: 1541, column: 39, scope: !3334)
!3507 = !DILocation(line: 1541, column: 44, scope: !3334)
!3508 = !DILocation(line: 1541, column: 10, scope: !3334)
!3509 = !DILocation(line: 1541, column: 5, scope: !3334)
!3510 = !DILocation(line: 1541, column: 8, scope: !3334)
!3511 = !DILocation(line: 1542, column: 26, scope: !3334)
!3512 = !DILocation(line: 1542, column: 32, scope: !3334)
!3513 = !DILocation(line: 1542, column: 39, scope: !3334)
!3514 = !DILocation(line: 1542, column: 44, scope: !3334)
!3515 = !DILocation(line: 1542, column: 10, scope: !3334)
!3516 = !DILocation(line: 1542, column: 5, scope: !3334)
!3517 = !DILocation(line: 1542, column: 8, scope: !3334)
!3518 = !DILocation(line: 1543, column: 26, scope: !3334)
!3519 = !DILocation(line: 1543, column: 32, scope: !3334)
!3520 = !DILocation(line: 1543, column: 39, scope: !3334)
!3521 = !DILocation(line: 1543, column: 44, scope: !3334)
!3522 = !DILocation(line: 1543, column: 10, scope: !3334)
!3523 = !DILocation(line: 1543, column: 5, scope: !3334)
!3524 = !DILocation(line: 1543, column: 8, scope: !3334)
!3525 = !DILocation(line: 1544, column: 26, scope: !3334)
!3526 = !DILocation(line: 1544, column: 32, scope: !3334)
!3527 = !DILocation(line: 1544, column: 39, scope: !3334)
!3528 = !DILocation(line: 1544, column: 44, scope: !3334)
!3529 = !DILocation(line: 1544, column: 10, scope: !3334)
!3530 = !DILocation(line: 1544, column: 5, scope: !3334)
!3531 = !DILocation(line: 1544, column: 8, scope: !3334)
!3532 = !DILocation(line: 1545, column: 26, scope: !3334)
!3533 = !DILocation(line: 1545, column: 32, scope: !3334)
!3534 = !DILocation(line: 1545, column: 39, scope: !3334)
!3535 = !DILocation(line: 1545, column: 44, scope: !3334)
!3536 = !DILocation(line: 1545, column: 10, scope: !3334)
!3537 = !DILocation(line: 1545, column: 5, scope: !3334)
!3538 = !DILocation(line: 1545, column: 8, scope: !3334)
!3539 = !DILocation(line: 1546, column: 26, scope: !3334)
!3540 = !DILocation(line: 1546, column: 32, scope: !3334)
!3541 = !DILocation(line: 1546, column: 39, scope: !3334)
!3542 = !DILocation(line: 1546, column: 44, scope: !3334)
!3543 = !DILocation(line: 1546, column: 10, scope: !3334)
!3544 = !DILocation(line: 1546, column: 5, scope: !3334)
!3545 = !DILocation(line: 1546, column: 8, scope: !3334)
!3546 = !DILocation(line: 1547, column: 26, scope: !3334)
!3547 = !DILocation(line: 1547, column: 32, scope: !3334)
!3548 = !DILocation(line: 1547, column: 39, scope: !3334)
!3549 = !DILocation(line: 1547, column: 44, scope: !3334)
!3550 = !DILocation(line: 1547, column: 10, scope: !3334)
!3551 = !DILocation(line: 1547, column: 5, scope: !3334)
!3552 = !DILocation(line: 1547, column: 8, scope: !3334)
!3553 = !DILocation(line: 1549, column: 13, scope: !3334)
!3554 = !DILocation(line: 1549, column: 19, scope: !3334)
!3555 = !DILocation(line: 1549, column: 23, scope: !3334)
!3556 = !DILocation(line: 1549, column: 45, scope: !3334)
!3557 = !DILocation(line: 1549, column: 51, scope: !3334)
!3558 = !DILocation(line: 1549, column: 36, scope: !3334)
!3559 = !DILocation(line: 1549, column: 59, scope: !3334)
!3560 = !DILocation(line: 1549, column: 27, scope: !3334)
!3561 = !DILocation(line: 1549, column: 69, scope: !3334)
!3562 = !DILocation(line: 1549, column: 25, scope: !3334)
!3563 = !DILocation(line: 1549, column: 72, scope: !3334)
!3564 = !DILocation(line: 1549, column: 12, scope: !3334)
!3565 = !DILocation(line: 1549, column: 2, scope: !3334)
!3566 = !DILocation(line: 1549, column: 7, scope: !3334)
!3567 = !DILocation(line: 1549, column: 10, scope: !3334)
!3568 = !DILocation(line: 1550, column: 13, scope: !3334)
!3569 = !DILocation(line: 1550, column: 19, scope: !3334)
!3570 = !DILocation(line: 1550, column: 23, scope: !3334)
!3571 = !DILocation(line: 1550, column: 45, scope: !3334)
!3572 = !DILocation(line: 1550, column: 51, scope: !3334)
!3573 = !DILocation(line: 1550, column: 36, scope: !3334)
!3574 = !DILocation(line: 1550, column: 59, scope: !3334)
!3575 = !DILocation(line: 1550, column: 27, scope: !3334)
!3576 = !DILocation(line: 1550, column: 69, scope: !3334)
!3577 = !DILocation(line: 1550, column: 25, scope: !3334)
!3578 = !DILocation(line: 1550, column: 72, scope: !3334)
!3579 = !DILocation(line: 1550, column: 12, scope: !3334)
!3580 = !DILocation(line: 1550, column: 2, scope: !3334)
!3581 = !DILocation(line: 1550, column: 7, scope: !3334)
!3582 = !DILocation(line: 1550, column: 10, scope: !3334)
!3583 = !DILocation(line: 1551, column: 13, scope: !3334)
!3584 = !DILocation(line: 1551, column: 19, scope: !3334)
!3585 = !DILocation(line: 1551, column: 23, scope: !3334)
!3586 = !DILocation(line: 1551, column: 45, scope: !3334)
!3587 = !DILocation(line: 1551, column: 51, scope: !3334)
!3588 = !DILocation(line: 1551, column: 36, scope: !3334)
!3589 = !DILocation(line: 1551, column: 59, scope: !3334)
!3590 = !DILocation(line: 1551, column: 27, scope: !3334)
!3591 = !DILocation(line: 1551, column: 69, scope: !3334)
!3592 = !DILocation(line: 1551, column: 25, scope: !3334)
!3593 = !DILocation(line: 1551, column: 72, scope: !3334)
!3594 = !DILocation(line: 1551, column: 12, scope: !3334)
!3595 = !DILocation(line: 1551, column: 2, scope: !3334)
!3596 = !DILocation(line: 1551, column: 7, scope: !3334)
!3597 = !DILocation(line: 1551, column: 10, scope: !3334)
!3598 = !DILocation(line: 1553, column: 17, scope: !3334)
!3599 = !DILocation(line: 1553, column: 23, scope: !3334)
!3600 = !DILocation(line: 1553, column: 2, scope: !3334)
!3601 = !DILocation(line: 1553, column: 7, scope: !3334)
!3602 = !DILocation(line: 1553, column: 15, scope: !3334)
!3603 = !DILocation(line: 1555, column: 16, scope: !3334)
!3604 = !DILocation(line: 1555, column: 22, scope: !3334)
!3605 = !DILocation(line: 1555, column: 38, scope: !3334)
!3606 = !DILocation(line: 1555, column: 47, scope: !3334)
!3607 = !DILocation(line: 1555, column: 50, scope: !3334)
!3608 = !DILocation(line: 1555, column: 15, scope: !3334)
!3609 = !DILocation(line: 1555, column: 3, scope: !3334)
!3610 = !DILocation(line: 1555, column: 8, scope: !3334)
!3611 = !DILocation(line: 1555, column: 13, scope: !3334)
!3612 = !DILocation(line: 1556, column: 15, scope: !3334)
!3613 = !DILocation(line: 1556, column: 21, scope: !3334)
!3614 = !DILocation(line: 1556, column: 37, scope: !3334)
!3615 = !DILocation(line: 1556, column: 46, scope: !3334)
!3616 = !DILocation(line: 1556, column: 49, scope: !3334)
!3617 = !DILocation(line: 1556, column: 14, scope: !3334)
!3618 = !DILocation(line: 1556, column: 2, scope: !3334)
!3619 = !DILocation(line: 1556, column: 7, scope: !3334)
!3620 = !DILocation(line: 1556, column: 12, scope: !3334)
!3621 = !DILocation(line: 1557, column: 15, scope: !3334)
!3622 = !DILocation(line: 1557, column: 21, scope: !3334)
!3623 = !DILocation(line: 1557, column: 37, scope: !3334)
!3624 = !DILocation(line: 1557, column: 46, scope: !3334)
!3625 = !DILocation(line: 1557, column: 49, scope: !3334)
!3626 = !DILocation(line: 1557, column: 14, scope: !3334)
!3627 = !DILocation(line: 1557, column: 2, scope: !3334)
!3628 = !DILocation(line: 1557, column: 7, scope: !3334)
!3629 = !DILocation(line: 1557, column: 12, scope: !3334)
!3630 = !DILocation(line: 1559, column: 1, scope: !3334)
!3631 = distinct !DISubprogram(name: "extract_shortpos", linkageName: "_Z16extract_shortposP6objectP8shortpos", scope: !16, file: !16, line: 1561, type: !3632, scopeLine: 1562, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!3632 = !DISubroutineType(types: !3633)
!3633 = !{null, !3353, !3337}
!3634 = !DILocalVariable(name: "objp", arg: 1, scope: !3631, file: !16, line: 1561, type: !3353)
!3635 = !DILocation(line: 1561, column: 31, scope: !3631)
!3636 = !DILocalVariable(name: "spp", arg: 2, scope: !3631, file: !16, line: 1561, type: !3337)
!3637 = !DILocation(line: 1561, column: 47, scope: !3631)
!3638 = !DILocalVariable(name: "segnum", scope: !3631, file: !16, line: 1603, type: !9)
!3639 = !DILocation(line: 1603, column: 6, scope: !3631)
!3640 = !DILocalVariable(name: "sp", scope: !3631, file: !16, line: 1604, type: !1621)
!3641 = !DILocation(line: 1604, column: 10, scope: !3631)
!3642 = !DILocation(line: 1606, column: 7, scope: !3631)
!3643 = !DILocation(line: 1606, column: 12, scope: !3631)
!3644 = !DILocation(line: 1606, column: 5, scope: !3631)
!3645 = !DILocation(line: 1608, column: 27, scope: !3631)
!3646 = !DILocation(line: 1608, column: 24, scope: !3631)
!3647 = !DILocation(line: 1608, column: 30, scope: !3631)
!3648 = !DILocation(line: 1608, column: 2, scope: !3631)
!3649 = !DILocation(line: 1608, column: 8, scope: !3631)
!3650 = !DILocation(line: 1608, column: 15, scope: !3631)
!3651 = !DILocation(line: 1608, column: 20, scope: !3631)
!3652 = !DILocation(line: 1608, column: 22, scope: !3631)
!3653 = !DILocation(line: 1609, column: 27, scope: !3631)
!3654 = !DILocation(line: 1609, column: 24, scope: !3631)
!3655 = !DILocation(line: 1609, column: 30, scope: !3631)
!3656 = !DILocation(line: 1609, column: 2, scope: !3631)
!3657 = !DILocation(line: 1609, column: 8, scope: !3631)
!3658 = !DILocation(line: 1609, column: 15, scope: !3631)
!3659 = !DILocation(line: 1609, column: 20, scope: !3631)
!3660 = !DILocation(line: 1609, column: 22, scope: !3631)
!3661 = !DILocation(line: 1610, column: 27, scope: !3631)
!3662 = !DILocation(line: 1610, column: 24, scope: !3631)
!3663 = !DILocation(line: 1610, column: 30, scope: !3631)
!3664 = !DILocation(line: 1610, column: 2, scope: !3631)
!3665 = !DILocation(line: 1610, column: 8, scope: !3631)
!3666 = !DILocation(line: 1610, column: 15, scope: !3631)
!3667 = !DILocation(line: 1610, column: 20, scope: !3631)
!3668 = !DILocation(line: 1610, column: 22, scope: !3631)
!3669 = !DILocation(line: 1611, column: 27, scope: !3631)
!3670 = !DILocation(line: 1611, column: 24, scope: !3631)
!3671 = !DILocation(line: 1611, column: 30, scope: !3631)
!3672 = !DILocation(line: 1611, column: 2, scope: !3631)
!3673 = !DILocation(line: 1611, column: 8, scope: !3631)
!3674 = !DILocation(line: 1611, column: 15, scope: !3631)
!3675 = !DILocation(line: 1611, column: 20, scope: !3631)
!3676 = !DILocation(line: 1611, column: 22, scope: !3631)
!3677 = !DILocation(line: 1612, column: 27, scope: !3631)
!3678 = !DILocation(line: 1612, column: 24, scope: !3631)
!3679 = !DILocation(line: 1612, column: 30, scope: !3631)
!3680 = !DILocation(line: 1612, column: 2, scope: !3631)
!3681 = !DILocation(line: 1612, column: 8, scope: !3631)
!3682 = !DILocation(line: 1612, column: 15, scope: !3631)
!3683 = !DILocation(line: 1612, column: 20, scope: !3631)
!3684 = !DILocation(line: 1612, column: 22, scope: !3631)
!3685 = !DILocation(line: 1613, column: 27, scope: !3631)
!3686 = !DILocation(line: 1613, column: 24, scope: !3631)
!3687 = !DILocation(line: 1613, column: 30, scope: !3631)
!3688 = !DILocation(line: 1613, column: 2, scope: !3631)
!3689 = !DILocation(line: 1613, column: 8, scope: !3631)
!3690 = !DILocation(line: 1613, column: 15, scope: !3631)
!3691 = !DILocation(line: 1613, column: 20, scope: !3631)
!3692 = !DILocation(line: 1613, column: 22, scope: !3631)
!3693 = !DILocation(line: 1614, column: 27, scope: !3631)
!3694 = !DILocation(line: 1614, column: 24, scope: !3631)
!3695 = !DILocation(line: 1614, column: 30, scope: !3631)
!3696 = !DILocation(line: 1614, column: 2, scope: !3631)
!3697 = !DILocation(line: 1614, column: 8, scope: !3631)
!3698 = !DILocation(line: 1614, column: 15, scope: !3631)
!3699 = !DILocation(line: 1614, column: 20, scope: !3631)
!3700 = !DILocation(line: 1614, column: 22, scope: !3631)
!3701 = !DILocation(line: 1615, column: 27, scope: !3631)
!3702 = !DILocation(line: 1615, column: 24, scope: !3631)
!3703 = !DILocation(line: 1615, column: 30, scope: !3631)
!3704 = !DILocation(line: 1615, column: 2, scope: !3631)
!3705 = !DILocation(line: 1615, column: 8, scope: !3631)
!3706 = !DILocation(line: 1615, column: 15, scope: !3631)
!3707 = !DILocation(line: 1615, column: 20, scope: !3631)
!3708 = !DILocation(line: 1615, column: 22, scope: !3631)
!3709 = !DILocation(line: 1616, column: 27, scope: !3631)
!3710 = !DILocation(line: 1616, column: 24, scope: !3631)
!3711 = !DILocation(line: 1616, column: 30, scope: !3631)
!3712 = !DILocation(line: 1616, column: 2, scope: !3631)
!3713 = !DILocation(line: 1616, column: 8, scope: !3631)
!3714 = !DILocation(line: 1616, column: 15, scope: !3631)
!3715 = !DILocation(line: 1616, column: 20, scope: !3631)
!3716 = !DILocation(line: 1616, column: 22, scope: !3631)
!3717 = !DILocation(line: 1618, column: 11, scope: !3631)
!3718 = !DILocation(line: 1618, column: 16, scope: !3631)
!3719 = !DILocation(line: 1618, column: 9, scope: !3631)
!3720 = !DILocation(line: 1620, column: 2, scope: !3631)
!3721 = !DILocation(line: 0, scope: !3631)
!3722 = !DILocation(line: 1622, column: 17, scope: !3631)
!3723 = !DILocation(line: 1622, column: 22, scope: !3631)
!3724 = !DILocation(line: 1622, column: 25, scope: !3631)
!3725 = !DILocation(line: 1622, column: 66, scope: !3631)
!3726 = !DILocation(line: 1622, column: 57, scope: !3631)
!3727 = !DILocation(line: 1622, column: 74, scope: !3631)
!3728 = !DILocation(line: 1622, column: 48, scope: !3631)
!3729 = !DILocation(line: 1622, column: 84, scope: !3631)
!3730 = !DILocation(line: 1622, column: 46, scope: !3631)
!3731 = !DILocation(line: 1622, column: 2, scope: !3631)
!3732 = !DILocation(line: 1622, column: 8, scope: !3631)
!3733 = !DILocation(line: 1622, column: 12, scope: !3631)
!3734 = !DILocation(line: 1622, column: 14, scope: !3631)
!3735 = !DILocation(line: 1623, column: 17, scope: !3631)
!3736 = !DILocation(line: 1623, column: 22, scope: !3631)
!3737 = !DILocation(line: 1623, column: 25, scope: !3631)
!3738 = !DILocation(line: 1623, column: 66, scope: !3631)
!3739 = !DILocation(line: 1623, column: 57, scope: !3631)
!3740 = !DILocation(line: 1623, column: 74, scope: !3631)
!3741 = !DILocation(line: 1623, column: 48, scope: !3631)
!3742 = !DILocation(line: 1623, column: 84, scope: !3631)
!3743 = !DILocation(line: 1623, column: 46, scope: !3631)
!3744 = !DILocation(line: 1623, column: 2, scope: !3631)
!3745 = !DILocation(line: 1623, column: 8, scope: !3631)
!3746 = !DILocation(line: 1623, column: 12, scope: !3631)
!3747 = !DILocation(line: 1623, column: 14, scope: !3631)
!3748 = !DILocation(line: 1624, column: 17, scope: !3631)
!3749 = !DILocation(line: 1624, column: 22, scope: !3631)
!3750 = !DILocation(line: 1624, column: 25, scope: !3631)
!3751 = !DILocation(line: 1624, column: 66, scope: !3631)
!3752 = !DILocation(line: 1624, column: 57, scope: !3631)
!3753 = !DILocation(line: 1624, column: 74, scope: !3631)
!3754 = !DILocation(line: 1624, column: 48, scope: !3631)
!3755 = !DILocation(line: 1624, column: 84, scope: !3631)
!3756 = !DILocation(line: 1624, column: 46, scope: !3631)
!3757 = !DILocation(line: 1624, column: 2, scope: !3631)
!3758 = !DILocation(line: 1624, column: 8, scope: !3631)
!3759 = !DILocation(line: 1624, column: 12, scope: !3631)
!3760 = !DILocation(line: 1624, column: 14, scope: !3631)
!3761 = !DILocation(line: 1626, column: 38, scope: !3631)
!3762 = !DILocation(line: 1626, column: 43, scope: !3631)
!3763 = !DILocation(line: 1626, column: 48, scope: !3631)
!3764 = !DILocation(line: 1626, column: 2, scope: !3631)
!3765 = !DILocation(line: 1626, column: 8, scope: !3631)
!3766 = !DILocation(line: 1626, column: 24, scope: !3631)
!3767 = !DILocation(line: 1626, column: 33, scope: !3631)
!3768 = !DILocation(line: 1626, column: 35, scope: !3631)
!3769 = !DILocation(line: 1627, column: 38, scope: !3631)
!3770 = !DILocation(line: 1627, column: 43, scope: !3631)
!3771 = !DILocation(line: 1627, column: 48, scope: !3631)
!3772 = !DILocation(line: 1627, column: 2, scope: !3631)
!3773 = !DILocation(line: 1627, column: 8, scope: !3631)
!3774 = !DILocation(line: 1627, column: 24, scope: !3631)
!3775 = !DILocation(line: 1627, column: 33, scope: !3631)
!3776 = !DILocation(line: 1627, column: 35, scope: !3631)
!3777 = !DILocation(line: 1628, column: 38, scope: !3631)
!3778 = !DILocation(line: 1628, column: 43, scope: !3631)
!3779 = !DILocation(line: 1628, column: 48, scope: !3631)
!3780 = !DILocation(line: 1628, column: 2, scope: !3631)
!3781 = !DILocation(line: 1628, column: 8, scope: !3631)
!3782 = !DILocation(line: 1628, column: 24, scope: !3631)
!3783 = !DILocation(line: 1628, column: 33, scope: !3631)
!3784 = !DILocation(line: 1628, column: 35, scope: !3631)
!3785 = !DILocation(line: 1630, column: 13, scope: !3631)
!3786 = !DILocation(line: 1630, column: 17, scope: !3631)
!3787 = !DILocation(line: 1630, column: 27, scope: !3631)
!3788 = !DILocation(line: 1630, column: 2, scope: !3631)
!3789 = !DILocation(line: 1632, column: 1, scope: !3631)
!3790 = distinct !DISubprogram(name: "extract_vector_from_segment", linkageName: "_Z27extract_vector_from_segmentP7segmentP10vms_vectorii", scope: !16, file: !16, line: 1651, type: !3791, scopeLine: 1652, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!3791 = !DISubroutineType(types: !3792)
!3792 = !{null, !1455, !1447, !9, !9}
!3793 = !DILocalVariable(name: "sp", arg: 1, scope: !3790, file: !16, line: 1651, type: !1455)
!3794 = !DILocation(line: 1651, column: 43, scope: !3790)
!3795 = !DILocalVariable(name: "vp", arg: 2, scope: !3790, file: !16, line: 1651, type: !1447)
!3796 = !DILocation(line: 1651, column: 59, scope: !3790)
!3797 = !DILocalVariable(name: "start", arg: 3, scope: !3790, file: !16, line: 1651, type: !9)
!3798 = !DILocation(line: 1651, column: 67, scope: !3790)
!3799 = !DILocalVariable(name: "end", arg: 4, scope: !3790, file: !16, line: 1651, type: !9)
!3800 = !DILocation(line: 1651, column: 78, scope: !3790)
!3801 = !DILocalVariable(name: "i", scope: !3790, file: !16, line: 1669, type: !9)
!3802 = !DILocation(line: 1669, column: 8, scope: !3790)
!3803 = !DILocalVariable(name: "vs", scope: !3790, file: !16, line: 1670, type: !1448)
!3804 = !DILocation(line: 1670, column: 13, scope: !3790)
!3805 = !DILocalVariable(name: "ve", scope: !3790, file: !16, line: 1670, type: !1448)
!3806 = !DILocation(line: 1670, column: 16, scope: !3790)
!3807 = !DILocation(line: 1672, column: 2, scope: !3790)
!3808 = !DILocation(line: 1673, column: 2, scope: !3790)
!3809 = !DILocation(line: 1675, column: 8, scope: !3810)
!3810 = distinct !DILexicalBlock(scope: !3790, file: !16, line: 1675, column: 2)
!3811 = !DILocation(line: 1675, column: 7, scope: !3810)
!3812 = !DILocation(line: 1675, column: 12, scope: !3813)
!3813 = distinct !DILexicalBlock(scope: !3810, file: !16, line: 1675, column: 2)
!3814 = !DILocation(line: 1675, column: 13, scope: !3813)
!3815 = !DILocation(line: 1675, column: 2, scope: !3810)
!3816 = !DILocation(line: 1676, column: 29, scope: !3817)
!3817 = distinct !DILexicalBlock(scope: !3813, file: !16, line: 1675, column: 22)
!3818 = !DILocation(line: 1676, column: 33, scope: !3817)
!3819 = !DILocation(line: 1676, column: 53, scope: !3817)
!3820 = !DILocation(line: 1676, column: 39, scope: !3817)
!3821 = !DILocation(line: 1676, column: 60, scope: !3817)
!3822 = !DILocation(line: 1676, column: 20, scope: !3817)
!3823 = !DILocation(line: 1676, column: 3, scope: !3817)
!3824 = !DILocation(line: 1677, column: 29, scope: !3817)
!3825 = !DILocation(line: 1677, column: 33, scope: !3817)
!3826 = !DILocation(line: 1677, column: 53, scope: !3817)
!3827 = !DILocation(line: 1677, column: 39, scope: !3817)
!3828 = !DILocation(line: 1677, column: 58, scope: !3817)
!3829 = !DILocation(line: 1677, column: 20, scope: !3817)
!3830 = !DILocation(line: 1677, column: 3, scope: !3817)
!3831 = !DILocation(line: 1678, column: 2, scope: !3817)
!3832 = !DILocation(line: 1675, column: 18, scope: !3813)
!3833 = !DILocation(line: 1675, column: 2, scope: !3813)
!3834 = distinct !{!3834, !3815, !3835, !1517}
!3835 = !DILocation(line: 1678, column: 2, scope: !3810)
!3836 = !DILocation(line: 1680, column: 13, scope: !3790)
!3837 = !DILocation(line: 1680, column: 2, scope: !3790)
!3838 = !DILocation(line: 1681, column: 15, scope: !3790)
!3839 = !DILocation(line: 1681, column: 2, scope: !3790)
!3840 = !DILocation(line: 1683, column: 1, scope: !3790)
!3841 = distinct !DISubprogram(name: "extract_orient_from_segment", linkageName: "_Z27extract_orient_from_segmentP10vms_matrixP7segment", scope: !16, file: !16, line: 1686, type: !3842, scopeLine: 1687, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!3842 = !DISubroutineType(types: !3843)
!3843 = !{null, !3844, !1455}
!3844 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3370, size: 64)
!3845 = !DILocalVariable(name: "m", arg: 1, scope: !3841, file: !16, line: 1686, type: !3844)
!3846 = !DILocation(line: 1686, column: 46, scope: !3841)
!3847 = !DILocalVariable(name: "seg", arg: 2, scope: !3841, file: !16, line: 1686, type: !1455)
!3848 = !DILocation(line: 1686, column: 57, scope: !3841)
!3849 = !DILocalVariable(name: "fvec", scope: !3841, file: !16, line: 1707, type: !1448)
!3850 = !DILocation(line: 1707, column: 13, scope: !3841)
!3851 = !DILocalVariable(name: "uvec", scope: !3841, file: !16, line: 1707, type: !1448)
!3852 = !DILocation(line: 1707, column: 18, scope: !3841)
!3853 = !DILocation(line: 1709, column: 30, scope: !3841)
!3854 = !DILocation(line: 1709, column: 2, scope: !3841)
!3855 = !DILocation(line: 1710, column: 30, scope: !3841)
!3856 = !DILocation(line: 1710, column: 2, scope: !3841)
!3857 = !DILocation(line: 1713, column: 21, scope: !3841)
!3858 = !DILocation(line: 1713, column: 2, scope: !3841)
!3859 = !DILocation(line: 1715, column: 1, scope: !3841)
!3860 = distinct !DISubprogram(name: "add_side_as_quad", linkageName: "_Z16add_side_as_quadP7segmentiP10vms_vector", scope: !16, file: !16, line: 1746, type: !3861, scopeLine: 1747, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!3861 = !DISubroutineType(types: !3862)
!3862 = !{null, !1455, !9, !1447}
!3863 = !DILocalVariable(name: "sp", arg: 1, scope: !3860, file: !16, line: 1746, type: !1455)
!3864 = !DILocation(line: 1746, column: 32, scope: !3860)
!3865 = !DILocalVariable(name: "sidenum", arg: 2, scope: !3860, file: !16, line: 1746, type: !9)
!3866 = !DILocation(line: 1746, column: 40, scope: !3860)
!3867 = !DILocalVariable(name: "normal", arg: 3, scope: !3860, file: !16, line: 1746, type: !1447)
!3868 = !DILocation(line: 1746, column: 61, scope: !3860)
!3869 = !DILocalVariable(name: "sidep", scope: !3860, file: !16, line: 1748, type: !1594)
!3870 = !DILocation(line: 1748, column: 8, scope: !3860)
!3871 = !DILocation(line: 1748, column: 17, scope: !3860)
!3872 = !DILocation(line: 1748, column: 21, scope: !3860)
!3873 = !DILocation(line: 1748, column: 27, scope: !3860)
!3874 = !DILocation(line: 1750, column: 2, scope: !3860)
!3875 = !DILocation(line: 1750, column: 9, scope: !3860)
!3876 = !DILocation(line: 1750, column: 14, scope: !3860)
!3877 = !DILocation(line: 1755, column: 23, scope: !3860)
!3878 = !DILocation(line: 1755, column: 2, scope: !3860)
!3879 = !DILocation(line: 1755, column: 9, scope: !3860)
!3880 = !DILocation(line: 1755, column: 20, scope: !3860)
!3881 = !DILocation(line: 1756, column: 23, scope: !3860)
!3882 = !DILocation(line: 1756, column: 2, scope: !3860)
!3883 = !DILocation(line: 1756, column: 9, scope: !3860)
!3884 = !DILocation(line: 1756, column: 20, scope: !3860)
!3885 = !DILocation(line: 1766, column: 1, scope: !3860)
!3886 = distinct !DISubprogram(name: "get_verts_for_normal", linkageName: "_Z20get_verts_for_normaliiiiPiS_S_S_S_", scope: !16, file: !16, line: 1773, type: !3887, scopeLine: 1774, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!3887 = !DISubroutineType(types: !3888)
!3888 = !{null, !9, !9, !9, !9, !801, !801, !801, !801, !801}
!3889 = !DILocalVariable(name: "va", arg: 1, scope: !3886, file: !16, line: 1773, type: !9)
!3890 = !DILocation(line: 1773, column: 31, scope: !3886)
!3891 = !DILocalVariable(name: "vb", arg: 2, scope: !3886, file: !16, line: 1773, type: !9)
!3892 = !DILocation(line: 1773, column: 39, scope: !3886)
!3893 = !DILocalVariable(name: "vc", arg: 3, scope: !3886, file: !16, line: 1773, type: !9)
!3894 = !DILocation(line: 1773, column: 47, scope: !3886)
!3895 = !DILocalVariable(name: "vd", arg: 4, scope: !3886, file: !16, line: 1773, type: !9)
!3896 = !DILocation(line: 1773, column: 55, scope: !3886)
!3897 = !DILocalVariable(name: "v0", arg: 5, scope: !3886, file: !16, line: 1773, type: !801)
!3898 = !DILocation(line: 1773, column: 64, scope: !3886)
!3899 = !DILocalVariable(name: "v1", arg: 6, scope: !3886, file: !16, line: 1773, type: !801)
!3900 = !DILocation(line: 1773, column: 73, scope: !3886)
!3901 = !DILocalVariable(name: "v2", arg: 7, scope: !3886, file: !16, line: 1773, type: !801)
!3902 = !DILocation(line: 1773, column: 82, scope: !3886)
!3903 = !DILocalVariable(name: "v3", arg: 8, scope: !3886, file: !16, line: 1773, type: !801)
!3904 = !DILocation(line: 1773, column: 91, scope: !3886)
!3905 = !DILocalVariable(name: "negate_flag", arg: 9, scope: !3886, file: !16, line: 1773, type: !801)
!3906 = !DILocation(line: 1773, column: 100, scope: !3886)
!3907 = !DILocalVariable(name: "i", scope: !3886, file: !16, line: 1786, type: !9)
!3908 = !DILocation(line: 1786, column: 6, scope: !3886)
!3909 = !DILocalVariable(name: "j", scope: !3886, file: !16, line: 1786, type: !9)
!3910 = !DILocation(line: 1786, column: 8, scope: !3886)
!3911 = !DILocalVariable(name: "v", scope: !3886, file: !16, line: 1787, type: !3912)
!3912 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 128, elements: !34)
!3913 = !DILocation(line: 1787, column: 6, scope: !3886)
!3914 = !DILocalVariable(name: "w", scope: !3886, file: !16, line: 1787, type: !3912)
!3915 = !DILocation(line: 1787, column: 11, scope: !3886)
!3916 = !DILocation(line: 1790, column: 8, scope: !3917)
!3917 = distinct !DILexicalBlock(scope: !3886, file: !16, line: 1790, column: 2)
!3918 = !DILocation(line: 1790, column: 7, scope: !3917)
!3919 = !DILocation(line: 1790, column: 12, scope: !3920)
!3920 = distinct !DILexicalBlock(scope: !3917, file: !16, line: 1790, column: 2)
!3921 = !DILocation(line: 1790, column: 13, scope: !3920)
!3922 = !DILocation(line: 1790, column: 2, scope: !3917)
!3923 = !DILocation(line: 1791, column: 10, scope: !3920)
!3924 = !DILocation(line: 1791, column: 5, scope: !3920)
!3925 = !DILocation(line: 1791, column: 3, scope: !3920)
!3926 = !DILocation(line: 1791, column: 8, scope: !3920)
!3927 = !DILocation(line: 1790, column: 18, scope: !3920)
!3928 = !DILocation(line: 1790, column: 2, scope: !3920)
!3929 = distinct !{!3929, !3922, !3930, !1517}
!3930 = !DILocation(line: 1791, column: 10, scope: !3917)
!3931 = !DILocation(line: 1793, column: 9, scope: !3886)
!3932 = !DILocation(line: 1793, column: 2, scope: !3886)
!3933 = !DILocation(line: 1793, column: 7, scope: !3886)
!3934 = !DILocation(line: 1794, column: 9, scope: !3886)
!3935 = !DILocation(line: 1794, column: 2, scope: !3886)
!3936 = !DILocation(line: 1794, column: 7, scope: !3886)
!3937 = !DILocation(line: 1795, column: 9, scope: !3886)
!3938 = !DILocation(line: 1795, column: 2, scope: !3886)
!3939 = !DILocation(line: 1795, column: 7, scope: !3886)
!3940 = !DILocation(line: 1796, column: 9, scope: !3886)
!3941 = !DILocation(line: 1796, column: 2, scope: !3886)
!3942 = !DILocation(line: 1796, column: 7, scope: !3886)
!3943 = !DILocation(line: 1798, column: 8, scope: !3944)
!3944 = distinct !DILexicalBlock(scope: !3886, file: !16, line: 1798, column: 2)
!3945 = !DILocation(line: 1798, column: 7, scope: !3944)
!3946 = !DILocation(line: 1798, column: 12, scope: !3947)
!3947 = distinct !DILexicalBlock(scope: !3944, file: !16, line: 1798, column: 2)
!3948 = !DILocation(line: 1798, column: 13, scope: !3947)
!3949 = !DILocation(line: 1798, column: 2, scope: !3944)
!3950 = !DILocation(line: 1799, column: 9, scope: !3951)
!3951 = distinct !DILexicalBlock(scope: !3947, file: !16, line: 1799, column: 3)
!3952 = !DILocation(line: 1799, column: 8, scope: !3951)
!3953 = !DILocation(line: 1799, column: 13, scope: !3954)
!3954 = distinct !DILexicalBlock(scope: !3951, file: !16, line: 1799, column: 3)
!3955 = !DILocation(line: 1799, column: 15, scope: !3954)
!3956 = !DILocation(line: 1799, column: 14, scope: !3954)
!3957 = !DILocation(line: 1799, column: 3, scope: !3951)
!3958 = !DILocation(line: 1800, column: 10, scope: !3959)
!3959 = distinct !DILexicalBlock(scope: !3954, file: !16, line: 1800, column: 8)
!3960 = !DILocation(line: 1800, column: 8, scope: !3959)
!3961 = !DILocation(line: 1800, column: 17, scope: !3959)
!3962 = !DILocation(line: 1800, column: 15, scope: !3959)
!3963 = !DILocation(line: 1800, column: 13, scope: !3959)
!3964 = !DILocalVariable(name: "t", scope: !3965, file: !16, line: 1801, type: !9)
!3965 = distinct !DILexicalBlock(scope: !3959, file: !16, line: 1800, column: 21)
!3966 = !DILocation(line: 1801, column: 9, scope: !3965)
!3967 = !DILocation(line: 1802, column: 11, scope: !3965)
!3968 = !DILocation(line: 1802, column: 9, scope: !3965)
!3969 = !DILocation(line: 1802, column: 7, scope: !3965)
!3970 = !DILocation(line: 1802, column: 24, scope: !3965)
!3971 = !DILocation(line: 1802, column: 22, scope: !3965)
!3972 = !DILocation(line: 1802, column: 17, scope: !3965)
!3973 = !DILocation(line: 1802, column: 15, scope: !3965)
!3974 = !DILocation(line: 1802, column: 20, scope: !3965)
!3975 = !DILocation(line: 1802, column: 35, scope: !3965)
!3976 = !DILocation(line: 1802, column: 30, scope: !3965)
!3977 = !DILocation(line: 1802, column: 28, scope: !3965)
!3978 = !DILocation(line: 1802, column: 33, scope: !3965)
!3979 = !DILocation(line: 1803, column: 11, scope: !3965)
!3980 = !DILocation(line: 1803, column: 9, scope: !3965)
!3981 = !DILocation(line: 1803, column: 7, scope: !3965)
!3982 = !DILocation(line: 1803, column: 24, scope: !3965)
!3983 = !DILocation(line: 1803, column: 22, scope: !3965)
!3984 = !DILocation(line: 1803, column: 17, scope: !3965)
!3985 = !DILocation(line: 1803, column: 15, scope: !3965)
!3986 = !DILocation(line: 1803, column: 20, scope: !3965)
!3987 = !DILocation(line: 1803, column: 35, scope: !3965)
!3988 = !DILocation(line: 1803, column: 30, scope: !3965)
!3989 = !DILocation(line: 1803, column: 28, scope: !3965)
!3990 = !DILocation(line: 1803, column: 33, scope: !3965)
!3991 = !DILocation(line: 1804, column: 4, scope: !3965)
!3992 = !DILocation(line: 1800, column: 18, scope: !3959)
!3993 = !DILocation(line: 1799, column: 19, scope: !3954)
!3994 = !DILocation(line: 1799, column: 3, scope: !3954)
!3995 = distinct !{!3995, !3957, !3996, !1517}
!3996 = !DILocation(line: 1804, column: 4, scope: !3951)
!3997 = !DILocation(line: 1798, column: 18, scope: !3947)
!3998 = !DILocation(line: 1798, column: 2, scope: !3947)
!3999 = distinct !{!3999, !3949, !4000, !1517}
!4000 = !DILocation(line: 1804, column: 4, scope: !3944)
!4001 = !DILocation(line: 1806, column: 2, scope: !3886)
!4002 = !DILocation(line: 0, scope: !3886)
!4003 = !DILocation(line: 1809, column: 8, scope: !3886)
!4004 = !DILocation(line: 1809, column: 3, scope: !3886)
!4005 = !DILocation(line: 1809, column: 6, scope: !3886)
!4006 = !DILocation(line: 1810, column: 8, scope: !3886)
!4007 = !DILocation(line: 1810, column: 3, scope: !3886)
!4008 = !DILocation(line: 1810, column: 6, scope: !3886)
!4009 = !DILocation(line: 1811, column: 8, scope: !3886)
!4010 = !DILocation(line: 1811, column: 3, scope: !3886)
!4011 = !DILocation(line: 1811, column: 6, scope: !3886)
!4012 = !DILocation(line: 1812, column: 8, scope: !3886)
!4013 = !DILocation(line: 1812, column: 3, scope: !3886)
!4014 = !DILocation(line: 1812, column: 6, scope: !3886)
!4015 = !DILocation(line: 1814, column: 10, scope: !4016)
!4016 = distinct !DILexicalBlock(scope: !3886, file: !16, line: 1814, column: 7)
!4017 = !DILocation(line: 1814, column: 14, scope: !4016)
!4018 = !DILocation(line: 1814, column: 18, scope: !4016)
!4019 = !DILocation(line: 1814, column: 26, scope: !4016)
!4020 = !DILocation(line: 1814, column: 23, scope: !4016)
!4021 = !DILocation(line: 1814, column: 32, scope: !4016)
!4022 = !DILocation(line: 1814, column: 38, scope: !4016)
!4023 = !DILocation(line: 1814, column: 42, scope: !4016)
!4024 = !DILocation(line: 1814, column: 46, scope: !4016)
!4025 = !DILocation(line: 1814, column: 54, scope: !4016)
!4026 = !DILocation(line: 1814, column: 51, scope: !4016)
!4027 = !DILocation(line: 1815, column: 4, scope: !4016)
!4028 = !DILocation(line: 1815, column: 16, scope: !4016)
!4029 = !DILocation(line: 1815, column: 3, scope: !4016)
!4030 = !DILocation(line: 1817, column: 4, scope: !4016)
!4031 = !DILocation(line: 1817, column: 16, scope: !4016)
!4032 = !DILocation(line: 1819, column: 1, scope: !3886)
!4033 = distinct !DISubprogram(name: "add_side_as_2_triangles", linkageName: "_Z23add_side_as_2_trianglesP7segmenti", scope: !16, file: !16, line: 1822, type: !4034, scopeLine: 1823, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!4034 = !DISubroutineType(types: !4035)
!4035 = !{null, !1455, !9}
!4036 = !DILocalVariable(name: "sp", arg: 1, scope: !4033, file: !16, line: 1822, type: !1455)
!4037 = !DILocation(line: 1822, column: 39, scope: !4033)
!4038 = !DILocalVariable(name: "sidenum", arg: 2, scope: !4033, file: !16, line: 1822, type: !9)
!4039 = !DILocation(line: 1822, column: 47, scope: !4033)
!4040 = !DILocalVariable(name: "norm", scope: !4033, file: !16, line: 1824, type: !1448)
!4041 = !DILocation(line: 1824, column: 13, scope: !4033)
!4042 = !DILocalVariable(name: "vs", scope: !4033, file: !16, line: 1825, type: !1621)
!4043 = !DILocation(line: 1825, column: 12, scope: !4033)
!4044 = !DILocation(line: 1825, column: 31, scope: !4033)
!4045 = !DILocation(line: 1825, column: 17, scope: !4033)
!4046 = !DILocalVariable(name: "dot", scope: !4033, file: !16, line: 1826, type: !5)
!4047 = !DILocation(line: 1826, column: 8, scope: !4033)
!4048 = !DILocalVariable(name: "vec_13", scope: !4033, file: !16, line: 1827, type: !1448)
!4049 = !DILocation(line: 1827, column: 13, scope: !4033)
!4050 = !DILocalVariable(name: "sidep", scope: !4033, file: !16, line: 1829, type: !1594)
!4051 = !DILocation(line: 1829, column: 8, scope: !4033)
!4052 = !DILocation(line: 1829, column: 17, scope: !4033)
!4053 = !DILocation(line: 1829, column: 21, scope: !4033)
!4054 = !DILocation(line: 1829, column: 27, scope: !4033)
!4055 = !DILocation(line: 1836, column: 7, scope: !4056)
!4056 = distinct !DILexicalBlock(scope: !4033, file: !16, line: 1836, column: 6)
!4057 = !DILocation(line: 1836, column: 6, scope: !4056)
!4058 = !DILocation(line: 1837, column: 35, scope: !4059)
!4059 = distinct !DILexicalBlock(scope: !4056, file: !16, line: 1836, column: 40)
!4060 = !DILocation(line: 1837, column: 39, scope: !4059)
!4061 = !DILocation(line: 1837, column: 45, scope: !4059)
!4062 = !DILocation(line: 1837, column: 26, scope: !4059)
!4063 = !DILocation(line: 1837, column: 64, scope: !4059)
!4064 = !DILocation(line: 1837, column: 68, scope: !4059)
!4065 = !DILocation(line: 1837, column: 74, scope: !4059)
!4066 = !DILocation(line: 1837, column: 55, scope: !4059)
!4067 = !DILocation(line: 1837, column: 93, scope: !4059)
!4068 = !DILocation(line: 1837, column: 97, scope: !4059)
!4069 = !DILocation(line: 1837, column: 103, scope: !4059)
!4070 = !DILocation(line: 1837, column: 84, scope: !4059)
!4071 = !DILocation(line: 1837, column: 3, scope: !4059)
!4072 = !DILocation(line: 1838, column: 33, scope: !4059)
!4073 = !DILocation(line: 1838, column: 37, scope: !4059)
!4074 = !DILocation(line: 1838, column: 43, scope: !4059)
!4075 = !DILocation(line: 1838, column: 24, scope: !4059)
!4076 = !DILocation(line: 1838, column: 62, scope: !4059)
!4077 = !DILocation(line: 1838, column: 66, scope: !4059)
!4078 = !DILocation(line: 1838, column: 72, scope: !4059)
!4079 = !DILocation(line: 1838, column: 53, scope: !4059)
!4080 = !DILocation(line: 1838, column: 3, scope: !4059)
!4081 = !DILocation(line: 1839, column: 9, scope: !4059)
!4082 = !DILocation(line: 1839, column: 7, scope: !4059)
!4083 = !DILocation(line: 1842, column: 7, scope: !4084)
!4084 = distinct !DILexicalBlock(scope: !4059, file: !16, line: 1842, column: 7)
!4085 = !DILocation(line: 1842, column: 11, scope: !4084)
!4086 = !DILocation(line: 1843, column: 4, scope: !4084)
!4087 = !DILocation(line: 1843, column: 11, scope: !4084)
!4088 = !DILocation(line: 1843, column: 16, scope: !4084)
!4089 = !DILocation(line: 1845, column: 4, scope: !4084)
!4090 = !DILocation(line: 1845, column: 11, scope: !4084)
!4091 = !DILocation(line: 1845, column: 16, scope: !4084)
!4092 = !DILocation(line: 1849, column: 7, scope: !4093)
!4093 = distinct !DILexicalBlock(scope: !4059, file: !16, line: 1849, column: 7)
!4094 = !DILocation(line: 1849, column: 14, scope: !4093)
!4095 = !DILocation(line: 1849, column: 19, scope: !4093)
!4096 = !DILocation(line: 1850, column: 36, scope: !4097)
!4097 = distinct !DILexicalBlock(scope: !4093, file: !16, line: 1849, column: 38)
!4098 = !DILocation(line: 1850, column: 40, scope: !4097)
!4099 = !DILocation(line: 1850, column: 46, scope: !4097)
!4100 = !DILocation(line: 1850, column: 27, scope: !4097)
!4101 = !DILocation(line: 1850, column: 65, scope: !4097)
!4102 = !DILocation(line: 1850, column: 69, scope: !4097)
!4103 = !DILocation(line: 1850, column: 75, scope: !4097)
!4104 = !DILocation(line: 1850, column: 56, scope: !4097)
!4105 = !DILocation(line: 1850, column: 94, scope: !4097)
!4106 = !DILocation(line: 1850, column: 98, scope: !4097)
!4107 = !DILocation(line: 1850, column: 104, scope: !4097)
!4108 = !DILocation(line: 1850, column: 85, scope: !4097)
!4109 = !DILocation(line: 1850, column: 4, scope: !4097)
!4110 = !DILocation(line: 1851, column: 4, scope: !4097)
!4111 = !DILocation(line: 1851, column: 11, scope: !4097)
!4112 = !DILocation(line: 1851, column: 22, scope: !4097)
!4113 = !DILocation(line: 1852, column: 35, scope: !4097)
!4114 = !DILocation(line: 1852, column: 39, scope: !4097)
!4115 = !DILocation(line: 1852, column: 45, scope: !4097)
!4116 = !DILocation(line: 1852, column: 26, scope: !4097)
!4117 = !DILocation(line: 1852, column: 64, scope: !4097)
!4118 = !DILocation(line: 1852, column: 68, scope: !4097)
!4119 = !DILocation(line: 1852, column: 74, scope: !4097)
!4120 = !DILocation(line: 1852, column: 55, scope: !4097)
!4121 = !DILocation(line: 1852, column: 93, scope: !4097)
!4122 = !DILocation(line: 1852, column: 97, scope: !4097)
!4123 = !DILocation(line: 1852, column: 103, scope: !4097)
!4124 = !DILocation(line: 1852, column: 84, scope: !4097)
!4125 = !DILocation(line: 1852, column: 4, scope: !4097)
!4126 = !DILocation(line: 1853, column: 4, scope: !4097)
!4127 = !DILocation(line: 1853, column: 11, scope: !4097)
!4128 = !DILocation(line: 1853, column: 22, scope: !4097)
!4129 = !DILocation(line: 1854, column: 3, scope: !4097)
!4130 = !DILocation(line: 1855, column: 35, scope: !4131)
!4131 = distinct !DILexicalBlock(scope: !4093, file: !16, line: 1854, column: 10)
!4132 = !DILocation(line: 1855, column: 39, scope: !4131)
!4133 = !DILocation(line: 1855, column: 45, scope: !4131)
!4134 = !DILocation(line: 1855, column: 26, scope: !4131)
!4135 = !DILocation(line: 1855, column: 64, scope: !4131)
!4136 = !DILocation(line: 1855, column: 68, scope: !4131)
!4137 = !DILocation(line: 1855, column: 74, scope: !4131)
!4138 = !DILocation(line: 1855, column: 55, scope: !4131)
!4139 = !DILocation(line: 1855, column: 93, scope: !4131)
!4140 = !DILocation(line: 1855, column: 97, scope: !4131)
!4141 = !DILocation(line: 1855, column: 103, scope: !4131)
!4142 = !DILocation(line: 1855, column: 84, scope: !4131)
!4143 = !DILocation(line: 1855, column: 4, scope: !4131)
!4144 = !DILocation(line: 1856, column: 4, scope: !4131)
!4145 = !DILocation(line: 1856, column: 11, scope: !4131)
!4146 = !DILocation(line: 1856, column: 22, scope: !4131)
!4147 = !DILocation(line: 1857, column: 35, scope: !4131)
!4148 = !DILocation(line: 1857, column: 39, scope: !4131)
!4149 = !DILocation(line: 1857, column: 45, scope: !4131)
!4150 = !DILocation(line: 1857, column: 26, scope: !4131)
!4151 = !DILocation(line: 1857, column: 64, scope: !4131)
!4152 = !DILocation(line: 1857, column: 68, scope: !4131)
!4153 = !DILocation(line: 1857, column: 74, scope: !4131)
!4154 = !DILocation(line: 1857, column: 55, scope: !4131)
!4155 = !DILocation(line: 1857, column: 93, scope: !4131)
!4156 = !DILocation(line: 1857, column: 97, scope: !4131)
!4157 = !DILocation(line: 1857, column: 103, scope: !4131)
!4158 = !DILocation(line: 1857, column: 84, scope: !4131)
!4159 = !DILocation(line: 1857, column: 4, scope: !4131)
!4160 = !DILocation(line: 1858, column: 4, scope: !4131)
!4161 = !DILocation(line: 1858, column: 11, scope: !4131)
!4162 = !DILocation(line: 1858, column: 22, scope: !4131)
!4163 = !DILocation(line: 1861, column: 2, scope: !4059)
!4164 = !DILocalVariable(name: "i", scope: !4165, file: !16, line: 1862, type: !9)
!4165 = distinct !DILexicalBlock(scope: !4056, file: !16, line: 1861, column: 9)
!4166 = !DILocation(line: 1862, column: 7, scope: !4165)
!4167 = !DILocalVariable(name: "v", scope: !4165, file: !16, line: 1862, type: !3912)
!4168 = !DILocation(line: 1862, column: 9, scope: !4165)
!4169 = !DILocalVariable(name: "vsorted", scope: !4165, file: !16, line: 1862, type: !3912)
!4170 = !DILocation(line: 1862, column: 15, scope: !4165)
!4171 = !DILocalVariable(name: "negate_flag", scope: !4165, file: !16, line: 1863, type: !9)
!4172 = !DILocation(line: 1863, column: 7, scope: !4165)
!4173 = !DILocation(line: 1865, column: 9, scope: !4174)
!4174 = distinct !DILexicalBlock(scope: !4165, file: !16, line: 1865, column: 3)
!4175 = !DILocation(line: 1865, column: 8, scope: !4174)
!4176 = !DILocation(line: 1865, column: 13, scope: !4177)
!4177 = distinct !DILexicalBlock(scope: !4174, file: !16, line: 1865, column: 3)
!4178 = !DILocation(line: 1865, column: 14, scope: !4177)
!4179 = !DILocation(line: 1865, column: 3, scope: !4174)
!4180 = !DILocation(line: 1866, column: 11, scope: !4177)
!4181 = !DILocation(line: 1866, column: 15, scope: !4177)
!4182 = !DILocation(line: 1866, column: 21, scope: !4177)
!4183 = !DILocation(line: 1866, column: 24, scope: !4177)
!4184 = !DILocation(line: 1866, column: 6, scope: !4177)
!4185 = !DILocation(line: 1866, column: 4, scope: !4177)
!4186 = !DILocation(line: 1866, column: 9, scope: !4177)
!4187 = !DILocation(line: 1865, column: 19, scope: !4177)
!4188 = !DILocation(line: 1865, column: 3, scope: !4177)
!4189 = distinct !{!4189, !4179, !4190, !1517}
!4190 = !DILocation(line: 1866, column: 26, scope: !4174)
!4191 = !DILocation(line: 1868, column: 24, scope: !4165)
!4192 = !DILocation(line: 1868, column: 30, scope: !4165)
!4193 = !DILocation(line: 1868, column: 36, scope: !4165)
!4194 = !DILocation(line: 1868, column: 42, scope: !4165)
!4195 = !DILocation(line: 1868, column: 49, scope: !4165)
!4196 = !DILocation(line: 1868, column: 62, scope: !4165)
!4197 = !DILocation(line: 1868, column: 75, scope: !4165)
!4198 = !DILocation(line: 1868, column: 88, scope: !4165)
!4199 = !DILocation(line: 1868, column: 3, scope: !4165)
!4200 = !DILocation(line: 1870, column: 8, scope: !4201)
!4201 = distinct !DILexicalBlock(scope: !4165, file: !16, line: 1870, column: 7)
!4202 = !DILocation(line: 1870, column: 22, scope: !4201)
!4203 = !DILocation(line: 1870, column: 19, scope: !4201)
!4204 = !DILocation(line: 1870, column: 28, scope: !4201)
!4205 = !DILocation(line: 1870, column: 32, scope: !4201)
!4206 = !DILocation(line: 1870, column: 46, scope: !4201)
!4207 = !DILocation(line: 1870, column: 43, scope: !4201)
!4208 = !DILocation(line: 1871, column: 4, scope: !4209)
!4209 = distinct !DILexicalBlock(scope: !4201, file: !16, line: 1870, column: 53)
!4210 = !DILocation(line: 1871, column: 11, scope: !4209)
!4211 = !DILocation(line: 1871, column: 16, scope: !4209)
!4212 = !DILocation(line: 1874, column: 25, scope: !4209)
!4213 = !DILocation(line: 1874, column: 31, scope: !4209)
!4214 = !DILocation(line: 1874, column: 37, scope: !4209)
!4215 = !DILocation(line: 1874, column: 51, scope: !4209)
!4216 = !DILocation(line: 1874, column: 64, scope: !4209)
!4217 = !DILocation(line: 1874, column: 77, scope: !4209)
!4218 = !DILocation(line: 1874, column: 90, scope: !4209)
!4219 = !DILocation(line: 1874, column: 4, scope: !4209)
!4220 = !DILocation(line: 1875, column: 36, scope: !4209)
!4221 = !DILocation(line: 1875, column: 27, scope: !4209)
!4222 = !DILocation(line: 1875, column: 59, scope: !4209)
!4223 = !DILocation(line: 1875, column: 50, scope: !4209)
!4224 = !DILocation(line: 1875, column: 82, scope: !4209)
!4225 = !DILocation(line: 1875, column: 73, scope: !4209)
!4226 = !DILocation(line: 1875, column: 4, scope: !4209)
!4227 = !DILocation(line: 1876, column: 8, scope: !4228)
!4228 = distinct !DILexicalBlock(scope: !4209, file: !16, line: 1876, column: 8)
!4229 = !DILocation(line: 1877, column: 5, scope: !4228)
!4230 = !DILocation(line: 1877, column: 5, scope: !4231)
!4231 = distinct !DILexicalBlock(scope: !4228, file: !16, line: 1877, column: 5)
!4232 = !DILocation(line: 1878, column: 4, scope: !4209)
!4233 = !DILocation(line: 1878, column: 11, scope: !4209)
!4234 = !DILocation(line: 1878, column: 22, scope: !4209)
!4235 = !DILocation(line: 1880, column: 25, scope: !4209)
!4236 = !DILocation(line: 1880, column: 31, scope: !4209)
!4237 = !DILocation(line: 1880, column: 37, scope: !4209)
!4238 = !DILocation(line: 1880, column: 51, scope: !4209)
!4239 = !DILocation(line: 1880, column: 64, scope: !4209)
!4240 = !DILocation(line: 1880, column: 77, scope: !4209)
!4241 = !DILocation(line: 1880, column: 90, scope: !4209)
!4242 = !DILocation(line: 1880, column: 4, scope: !4209)
!4243 = !DILocation(line: 1881, column: 36, scope: !4209)
!4244 = !DILocation(line: 1881, column: 27, scope: !4209)
!4245 = !DILocation(line: 1881, column: 59, scope: !4209)
!4246 = !DILocation(line: 1881, column: 50, scope: !4209)
!4247 = !DILocation(line: 1881, column: 82, scope: !4209)
!4248 = !DILocation(line: 1881, column: 73, scope: !4209)
!4249 = !DILocation(line: 1881, column: 4, scope: !4209)
!4250 = !DILocation(line: 1882, column: 8, scope: !4251)
!4251 = distinct !DILexicalBlock(scope: !4209, file: !16, line: 1882, column: 8)
!4252 = !DILocation(line: 1883, column: 5, scope: !4251)
!4253 = !DILocation(line: 1883, column: 5, scope: !4254)
!4254 = distinct !DILexicalBlock(scope: !4251, file: !16, line: 1883, column: 5)
!4255 = !DILocation(line: 1884, column: 4, scope: !4209)
!4256 = !DILocation(line: 1884, column: 11, scope: !4209)
!4257 = !DILocation(line: 1884, column: 22, scope: !4209)
!4258 = !DILocation(line: 1886, column: 3, scope: !4209)
!4259 = !DILocation(line: 1887, column: 4, scope: !4260)
!4260 = distinct !DILexicalBlock(scope: !4201, file: !16, line: 1886, column: 10)
!4261 = !DILocation(line: 1887, column: 11, scope: !4260)
!4262 = !DILocation(line: 1887, column: 16, scope: !4260)
!4263 = !DILocation(line: 1890, column: 25, scope: !4260)
!4264 = !DILocation(line: 1890, column: 31, scope: !4260)
!4265 = !DILocation(line: 1890, column: 37, scope: !4260)
!4266 = !DILocation(line: 1890, column: 51, scope: !4260)
!4267 = !DILocation(line: 1890, column: 64, scope: !4260)
!4268 = !DILocation(line: 1890, column: 77, scope: !4260)
!4269 = !DILocation(line: 1890, column: 90, scope: !4260)
!4270 = !DILocation(line: 1890, column: 4, scope: !4260)
!4271 = !DILocation(line: 1891, column: 36, scope: !4260)
!4272 = !DILocation(line: 1891, column: 27, scope: !4260)
!4273 = !DILocation(line: 1891, column: 59, scope: !4260)
!4274 = !DILocation(line: 1891, column: 50, scope: !4260)
!4275 = !DILocation(line: 1891, column: 82, scope: !4260)
!4276 = !DILocation(line: 1891, column: 73, scope: !4260)
!4277 = !DILocation(line: 1891, column: 4, scope: !4260)
!4278 = !DILocation(line: 1892, column: 8, scope: !4279)
!4279 = distinct !DILexicalBlock(scope: !4260, file: !16, line: 1892, column: 8)
!4280 = !DILocation(line: 1893, column: 5, scope: !4279)
!4281 = !DILocation(line: 1893, column: 5, scope: !4282)
!4282 = distinct !DILexicalBlock(scope: !4279, file: !16, line: 1893, column: 5)
!4283 = !DILocation(line: 1894, column: 4, scope: !4260)
!4284 = !DILocation(line: 1894, column: 11, scope: !4260)
!4285 = !DILocation(line: 1894, column: 22, scope: !4260)
!4286 = !DILocation(line: 1896, column: 25, scope: !4260)
!4287 = !DILocation(line: 1896, column: 31, scope: !4260)
!4288 = !DILocation(line: 1896, column: 37, scope: !4260)
!4289 = !DILocation(line: 1896, column: 51, scope: !4260)
!4290 = !DILocation(line: 1896, column: 64, scope: !4260)
!4291 = !DILocation(line: 1896, column: 77, scope: !4260)
!4292 = !DILocation(line: 1896, column: 90, scope: !4260)
!4293 = !DILocation(line: 1896, column: 4, scope: !4260)
!4294 = !DILocation(line: 1897, column: 36, scope: !4260)
!4295 = !DILocation(line: 1897, column: 27, scope: !4260)
!4296 = !DILocation(line: 1897, column: 59, scope: !4260)
!4297 = !DILocation(line: 1897, column: 50, scope: !4260)
!4298 = !DILocation(line: 1897, column: 82, scope: !4260)
!4299 = !DILocation(line: 1897, column: 73, scope: !4260)
!4300 = !DILocation(line: 1897, column: 4, scope: !4260)
!4301 = !DILocation(line: 1898, column: 8, scope: !4302)
!4302 = distinct !DILexicalBlock(scope: !4260, file: !16, line: 1898, column: 8)
!4303 = !DILocation(line: 1899, column: 5, scope: !4302)
!4304 = !DILocation(line: 1899, column: 5, scope: !4305)
!4305 = distinct !DILexicalBlock(scope: !4302, file: !16, line: 1899, column: 5)
!4306 = !DILocation(line: 1900, column: 4, scope: !4260)
!4307 = !DILocation(line: 1900, column: 11, scope: !4260)
!4308 = !DILocation(line: 1900, column: 22, scope: !4260)
!4309 = !DILocation(line: 1904, column: 1, scope: !4033)
!4310 = distinct !DISubprogram(name: "sign", linkageName: "_Z4signi", scope: !16, file: !16, line: 1906, type: !4311, scopeLine: 1907, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!4311 = !DISubroutineType(types: !4312)
!4312 = !{!9, !5}
!4313 = !DILocalVariable(name: "v", arg: 1, scope: !4310, file: !16, line: 1906, type: !5)
!4314 = !DILocation(line: 1906, column: 14, scope: !4310)
!4315 = !DILocation(line: 1909, column: 6, scope: !4316)
!4316 = distinct !DILexicalBlock(scope: !4310, file: !16, line: 1909, column: 6)
!4317 = !DILocation(line: 1909, column: 8, scope: !4316)
!4318 = !DILocation(line: 1910, column: 3, scope: !4316)
!4319 = !DILocation(line: 1911, column: 11, scope: !4320)
!4320 = distinct !DILexicalBlock(scope: !4316, file: !16, line: 1911, column: 11)
!4321 = !DILocation(line: 1911, column: 13, scope: !4320)
!4322 = !DILocation(line: 1912, column: 3, scope: !4320)
!4323 = !DILocation(line: 1914, column: 3, scope: !4320)
!4324 = !DILocation(line: 1915, column: 1, scope: !4310)
!4325 = distinct !DISubprogram(name: "create_walls_on_side", linkageName: "_Z20create_walls_on_sideP7segmenti", scope: !16, file: !16, line: 1918, type: !4034, scopeLine: 1919, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!4326 = !DILocalVariable(name: "sp", arg: 1, scope: !4325, file: !16, line: 1918, type: !1455)
!4327 = !DILocation(line: 1918, column: 36, scope: !4325)
!4328 = !DILocalVariable(name: "sidenum", arg: 2, scope: !4325, file: !16, line: 1918, type: !9)
!4329 = !DILocation(line: 1918, column: 44, scope: !4325)
!4330 = !DILocalVariable(name: "vm0", scope: !4325, file: !16, line: 1948, type: !9)
!4331 = !DILocation(line: 1948, column: 6, scope: !4325)
!4332 = !DILocalVariable(name: "vm1", scope: !4325, file: !16, line: 1948, type: !9)
!4333 = !DILocation(line: 1948, column: 11, scope: !4325)
!4334 = !DILocalVariable(name: "vm2", scope: !4325, file: !16, line: 1948, type: !9)
!4335 = !DILocation(line: 1948, column: 16, scope: !4325)
!4336 = !DILocalVariable(name: "vm3", scope: !4325, file: !16, line: 1948, type: !9)
!4337 = !DILocation(line: 1948, column: 21, scope: !4325)
!4338 = !DILocalVariable(name: "negate_flag", scope: !4325, file: !16, line: 1948, type: !9)
!4339 = !DILocation(line: 1948, column: 26, scope: !4325)
!4340 = !DILocalVariable(name: "v0", scope: !4325, file: !16, line: 1949, type: !9)
!4341 = !DILocation(line: 1949, column: 6, scope: !4325)
!4342 = !DILocalVariable(name: "v1", scope: !4325, file: !16, line: 1949, type: !9)
!4343 = !DILocation(line: 1949, column: 10, scope: !4325)
!4344 = !DILocalVariable(name: "v2", scope: !4325, file: !16, line: 1949, type: !9)
!4345 = !DILocation(line: 1949, column: 14, scope: !4325)
!4346 = !DILocalVariable(name: "v3", scope: !4325, file: !16, line: 1949, type: !9)
!4347 = !DILocation(line: 1949, column: 18, scope: !4325)
!4348 = !DILocalVariable(name: "vn", scope: !4325, file: !16, line: 1950, type: !1448)
!4349 = !DILocation(line: 1950, column: 13, scope: !4325)
!4350 = !DILocalVariable(name: "dist_to_plane", scope: !4325, file: !16, line: 1951, type: !5)
!4351 = !DILocation(line: 1951, column: 6, scope: !4325)
!4352 = !DILocation(line: 1953, column: 7, scope: !4325)
!4353 = !DILocation(line: 1953, column: 11, scope: !4325)
!4354 = !DILocation(line: 1953, column: 31, scope: !4325)
!4355 = !DILocation(line: 1953, column: 17, scope: !4325)
!4356 = !DILocation(line: 1953, column: 5, scope: !4325)
!4357 = !DILocation(line: 1954, column: 7, scope: !4325)
!4358 = !DILocation(line: 1954, column: 11, scope: !4325)
!4359 = !DILocation(line: 1954, column: 31, scope: !4325)
!4360 = !DILocation(line: 1954, column: 17, scope: !4325)
!4361 = !DILocation(line: 1954, column: 5, scope: !4325)
!4362 = !DILocation(line: 1955, column: 7, scope: !4325)
!4363 = !DILocation(line: 1955, column: 11, scope: !4325)
!4364 = !DILocation(line: 1955, column: 31, scope: !4325)
!4365 = !DILocation(line: 1955, column: 17, scope: !4325)
!4366 = !DILocation(line: 1955, column: 5, scope: !4325)
!4367 = !DILocation(line: 1956, column: 7, scope: !4325)
!4368 = !DILocation(line: 1956, column: 11, scope: !4325)
!4369 = !DILocation(line: 1956, column: 31, scope: !4325)
!4370 = !DILocation(line: 1956, column: 17, scope: !4325)
!4371 = !DILocation(line: 1956, column: 5, scope: !4325)
!4372 = !DILocation(line: 1958, column: 23, scope: !4325)
!4373 = !DILocation(line: 1958, column: 27, scope: !4325)
!4374 = !DILocation(line: 1958, column: 31, scope: !4325)
!4375 = !DILocation(line: 1958, column: 35, scope: !4325)
!4376 = !DILocation(line: 1958, column: 2, scope: !4325)
!4377 = !DILocation(line: 1960, column: 31, scope: !4325)
!4378 = !DILocation(line: 1960, column: 22, scope: !4325)
!4379 = !DILocation(line: 1960, column: 47, scope: !4325)
!4380 = !DILocation(line: 1960, column: 38, scope: !4325)
!4381 = !DILocation(line: 1960, column: 63, scope: !4325)
!4382 = !DILocation(line: 1960, column: 54, scope: !4325)
!4383 = !DILocation(line: 1960, column: 2, scope: !4325)
!4384 = !DILocation(line: 1961, column: 49, scope: !4325)
!4385 = !DILocation(line: 1961, column: 40, scope: !4325)
!4386 = !DILocation(line: 1961, column: 70, scope: !4325)
!4387 = !DILocation(line: 1961, column: 61, scope: !4325)
!4388 = !DILocation(line: 1961, column: 22, scope: !4325)
!4389 = !DILocation(line: 1961, column: 18, scope: !4325)
!4390 = !DILocation(line: 1961, column: 16, scope: !4325)
!4391 = !DILocation(line: 1963, column: 6, scope: !4392)
!4392 = distinct !DILexicalBlock(scope: !4325, file: !16, line: 1963, column: 6)
!4393 = !DILocation(line: 1964, column: 3, scope: !4392)
!4394 = !DILocation(line: 1964, column: 3, scope: !4395)
!4395 = distinct !DILexicalBlock(scope: !4392, file: !16, line: 1964, column: 3)
!4396 = !DILocation(line: 1966, column: 6, scope: !4397)
!4397 = distinct !DILexicalBlock(scope: !4325, file: !16, line: 1966, column: 6)
!4398 = !DILocation(line: 1966, column: 20, scope: !4397)
!4399 = !DILocation(line: 1967, column: 20, scope: !4397)
!4400 = !DILocation(line: 1967, column: 24, scope: !4397)
!4401 = !DILocation(line: 1967, column: 3, scope: !4397)
!4402 = !DILocation(line: 1969, column: 27, scope: !4403)
!4403 = distinct !DILexicalBlock(scope: !4397, file: !16, line: 1968, column: 7)
!4404 = !DILocation(line: 1969, column: 31, scope: !4403)
!4405 = !DILocation(line: 1969, column: 3, scope: !4403)
!4406 = !DILocalVariable(name: "num_faces", scope: !4407, file: !16, line: 1972, type: !9)
!4407 = distinct !DILexicalBlock(scope: !4403, file: !16, line: 1971, column: 3)
!4408 = !DILocation(line: 1972, column: 10, scope: !4407)
!4409 = !DILocalVariable(name: "vertex_list", scope: !4407, file: !16, line: 1973, type: !1859)
!4410 = !DILocation(line: 1973, column: 10, scope: !4407)
!4411 = !DILocalVariable(name: "dist0", scope: !4407, file: !16, line: 1974, type: !5)
!4412 = !DILocation(line: 1974, column: 10, scope: !4407)
!4413 = !DILocalVariable(name: "dist1", scope: !4407, file: !16, line: 1974, type: !5)
!4414 = !DILocation(line: 1974, column: 16, scope: !4407)
!4415 = !DILocalVariable(name: "s0", scope: !4407, file: !16, line: 1975, type: !9)
!4416 = !DILocation(line: 1975, column: 10, scope: !4407)
!4417 = !DILocalVariable(name: "s1", scope: !4407, file: !16, line: 1975, type: !9)
!4418 = !DILocation(line: 1975, column: 13, scope: !4407)
!4419 = !DILocalVariable(name: "vertnum", scope: !4407, file: !16, line: 1976, type: !9)
!4420 = !DILocation(line: 1976, column: 10, scope: !4407)
!4421 = !DILocalVariable(name: "s", scope: !4407, file: !16, line: 1977, type: !1594)
!4422 = !DILocation(line: 1977, column: 12, scope: !4407)
!4423 = !DILocation(line: 1979, column: 41, scope: !4407)
!4424 = !DILocation(line: 1979, column: 54, scope: !4407)
!4425 = !DILocation(line: 1979, column: 56, scope: !4407)
!4426 = !DILocation(line: 1979, column: 67, scope: !4407)
!4427 = !DILocation(line: 1979, column: 4, scope: !4407)
!4428 = !DILocation(line: 1981, column: 4, scope: !4407)
!4429 = !DILocation(line: 1983, column: 9, scope: !4407)
!4430 = !DILocation(line: 1983, column: 13, scope: !4407)
!4431 = !DILocation(line: 1983, column: 19, scope: !4407)
!4432 = !DILocation(line: 1983, column: 6, scope: !4407)
!4433 = !DILocation(line: 1985, column: 23, scope: !4407)
!4434 = !DILocation(line: 1985, column: 38, scope: !4407)
!4435 = !DILocation(line: 1985, column: 14, scope: !4407)
!4436 = !DILocation(line: 1985, column: 12, scope: !4407)
!4437 = !DILocation(line: 1995, column: 39, scope: !4407)
!4438 = !DILocation(line: 1995, column: 30, scope: !4407)
!4439 = !DILocation(line: 1995, column: 56, scope: !4407)
!4440 = !DILocation(line: 1995, column: 59, scope: !4407)
!4441 = !DILocation(line: 1995, column: 80, scope: !4407)
!4442 = !DILocation(line: 1995, column: 71, scope: !4407)
!4443 = !DILocation(line: 1995, column: 12, scope: !4407)
!4444 = !DILocation(line: 1995, column: 10, scope: !4407)
!4445 = !DILocation(line: 1996, column: 39, scope: !4407)
!4446 = !DILocation(line: 1996, column: 30, scope: !4407)
!4447 = !DILocation(line: 1996, column: 56, scope: !4407)
!4448 = !DILocation(line: 1996, column: 59, scope: !4407)
!4449 = !DILocation(line: 1996, column: 80, scope: !4407)
!4450 = !DILocation(line: 1996, column: 71, scope: !4407)
!4451 = !DILocation(line: 1996, column: 12, scope: !4407)
!4452 = !DILocation(line: 1996, column: 10, scope: !4407)
!4453 = !DILocation(line: 1999, column: 14, scope: !4407)
!4454 = !DILocation(line: 1999, column: 9, scope: !4407)
!4455 = !DILocation(line: 1999, column: 7, scope: !4407)
!4456 = !DILocation(line: 2000, column: 14, scope: !4407)
!4457 = !DILocation(line: 2000, column: 9, scope: !4407)
!4458 = !DILocation(line: 2000, column: 7, scope: !4407)
!4459 = !DILocation(line: 2002, column: 8, scope: !4460)
!4460 = distinct !DILexicalBlock(scope: !4407, file: !16, line: 2002, column: 8)
!4461 = !DILocation(line: 2002, column: 10, scope: !4460)
!4462 = !DILocation(line: 2002, column: 14, scope: !4460)
!4463 = !DILocation(line: 2002, column: 17, scope: !4460)
!4464 = !DILocation(line: 2002, column: 19, scope: !4460)
!4465 = !DILocation(line: 2002, column: 23, scope: !4460)
!4466 = !DILocation(line: 2002, column: 26, scope: !4460)
!4467 = !DILocation(line: 2002, column: 30, scope: !4460)
!4468 = !DILocation(line: 2002, column: 28, scope: !4460)
!4469 = !DILocation(line: 2003, column: 5, scope: !4470)
!4470 = distinct !DILexicalBlock(scope: !4460, file: !16, line: 2002, column: 34)
!4471 = !DILocation(line: 2003, column: 9, scope: !4470)
!4472 = !DILocation(line: 2003, column: 15, scope: !4470)
!4473 = !DILocation(line: 2003, column: 24, scope: !4470)
!4474 = !DILocation(line: 2003, column: 29, scope: !4470)
!4475 = !DILocation(line: 2005, column: 5, scope: !4470)
!4476 = !DILocation(line: 2005, column: 9, scope: !4470)
!4477 = !DILocation(line: 2005, column: 15, scope: !4470)
!4478 = !DILocation(line: 2005, column: 24, scope: !4470)
!4479 = !DILocation(line: 2005, column: 35, scope: !4470)
!4480 = !DILocation(line: 2006, column: 5, scope: !4470)
!4481 = !DILocation(line: 2006, column: 9, scope: !4470)
!4482 = !DILocation(line: 2006, column: 15, scope: !4470)
!4483 = !DILocation(line: 2006, column: 24, scope: !4470)
!4484 = !DILocation(line: 2006, column: 35, scope: !4470)
!4485 = !DILocation(line: 2008, column: 4, scope: !4470)
!4486 = !DILocation(line: 2013, column: 1, scope: !4325)
!4487 = distinct !DISubprogram(name: "validate_removable_wall", linkageName: "_Z23validate_removable_wallP7segmentii", scope: !16, file: !16, line: 2191, type: !4488, scopeLine: 2192, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!4488 = !DISubroutineType(types: !4489)
!4489 = !{null, !1455, !9, !9}
!4490 = !DILocalVariable(name: "sp", arg: 1, scope: !4487, file: !16, line: 2191, type: !1455)
!4491 = !DILocation(line: 2191, column: 39, scope: !4487)
!4492 = !DILocalVariable(name: "sidenum", arg: 2, scope: !4487, file: !16, line: 2191, type: !9)
!4493 = !DILocation(line: 2191, column: 47, scope: !4487)
!4494 = !DILocalVariable(name: "tmap_num", arg: 3, scope: !4487, file: !16, line: 2191, type: !9)
!4495 = !DILocation(line: 2191, column: 60, scope: !4487)
!4496 = !DILocation(line: 2217, column: 23, scope: !4487)
!4497 = !DILocation(line: 2217, column: 27, scope: !4487)
!4498 = !DILocation(line: 2217, column: 2, scope: !4487)
!4499 = !DILocation(line: 2219, column: 32, scope: !4487)
!4500 = !DILocation(line: 2219, column: 2, scope: !4487)
!4501 = !DILocation(line: 2219, column: 6, scope: !4487)
!4502 = !DILocation(line: 2219, column: 12, scope: !4487)
!4503 = !DILocation(line: 2219, column: 21, scope: !4487)
!4504 = !DILocation(line: 2219, column: 30, scope: !4487)
!4505 = !DILocation(line: 2224, column: 1, scope: !4487)
!4506 = distinct !DISubprogram(name: "validate_segment_side", linkageName: "_Z21validate_segment_sideP7segmenti", scope: !16, file: !16, line: 2228, type: !4034, scopeLine: 2229, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!4507 = !DILocalVariable(name: "sp", arg: 1, scope: !4506, file: !16, line: 2228, type: !1455)
!4508 = !DILocation(line: 2228, column: 37, scope: !4506)
!4509 = !DILocalVariable(name: "sidenum", arg: 2, scope: !4506, file: !16, line: 2228, type: !9)
!4510 = !DILocation(line: 2228, column: 45, scope: !4506)
!4511 = !DILocation(line: 2255, column: 6, scope: !4512)
!4512 = distinct !DILexicalBlock(scope: !4506, file: !16, line: 2255, column: 6)
!4513 = !DILocation(line: 2255, column: 10, scope: !4512)
!4514 = !DILocation(line: 2255, column: 16, scope: !4512)
!4515 = !DILocation(line: 2255, column: 25, scope: !4512)
!4516 = !DILocation(line: 2255, column: 34, scope: !4512)
!4517 = !DILocation(line: 2256, column: 24, scope: !4512)
!4518 = !DILocation(line: 2256, column: 28, scope: !4512)
!4519 = !DILocation(line: 2256, column: 3, scope: !4512)
!4520 = !DILocation(line: 2259, column: 27, scope: !4512)
!4521 = !DILocation(line: 2259, column: 31, scope: !4512)
!4522 = !DILocation(line: 2259, column: 40, scope: !4512)
!4523 = !DILocation(line: 2259, column: 44, scope: !4512)
!4524 = !DILocation(line: 2259, column: 50, scope: !4512)
!4525 = !DILocation(line: 2259, column: 59, scope: !4512)
!4526 = !DILocation(line: 2259, column: 3, scope: !4512)
!4527 = !DILocation(line: 2271, column: 1, scope: !4506)
!4528 = distinct !DISubprogram(name: "validate_segment", linkageName: "_Z16validate_segmentP7segment", scope: !16, file: !16, line: 2279, type: !4529, scopeLine: 2280, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!4529 = !DISubroutineType(types: !4530)
!4530 = !{null, !1455}
!4531 = !DILocalVariable(name: "sp", arg: 1, scope: !4528, file: !16, line: 2279, type: !1455)
!4532 = !DILocation(line: 2279, column: 32, scope: !4528)
!4533 = !DILocalVariable(name: "side", scope: !4528, file: !16, line: 2281, type: !9)
!4534 = !DILocation(line: 2281, column: 6, scope: !4528)
!4535 = !DILocation(line: 2287, column: 12, scope: !4536)
!4536 = distinct !DILexicalBlock(scope: !4528, file: !16, line: 2287, column: 2)
!4537 = !DILocation(line: 2287, column: 7, scope: !4536)
!4538 = !DILocation(line: 2287, column: 17, scope: !4539)
!4539 = distinct !DILexicalBlock(scope: !4536, file: !16, line: 2287, column: 2)
!4540 = !DILocation(line: 2287, column: 22, scope: !4539)
!4541 = !DILocation(line: 2287, column: 2, scope: !4536)
!4542 = !DILocation(line: 2288, column: 25, scope: !4539)
!4543 = !DILocation(line: 2288, column: 29, scope: !4539)
!4544 = !DILocation(line: 2288, column: 3, scope: !4539)
!4545 = !DILocation(line: 2287, column: 51, scope: !4539)
!4546 = !DILocation(line: 2287, column: 2, scope: !4539)
!4547 = distinct !{!4547, !4541, !4548, !1517}
!4548 = !DILocation(line: 2288, column: 33, scope: !4536)
!4549 = !DILocation(line: 2291, column: 1, scope: !4528)
!4550 = distinct !DISubprogram(name: "validate_segment_all", linkageName: "_Z20validate_segment_allv", scope: !16, file: !16, line: 2297, type: !1196, scopeLine: 2298, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!4551 = !DILocalVariable(name: "s", scope: !4550, file: !16, line: 2299, type: !9)
!4552 = !DILocation(line: 2299, column: 6, scope: !4550)
!4553 = !DILocation(line: 2301, column: 8, scope: !4554)
!4554 = distinct !DILexicalBlock(scope: !4550, file: !16, line: 2301, column: 2)
!4555 = !DILocation(line: 2301, column: 7, scope: !4554)
!4556 = !DILocation(line: 2301, column: 12, scope: !4557)
!4557 = distinct !DILexicalBlock(scope: !4554, file: !16, line: 2301, column: 2)
!4558 = !DILocation(line: 2301, column: 15, scope: !4557)
!4559 = !DILocation(line: 2301, column: 13, scope: !4557)
!4560 = !DILocation(line: 2301, column: 2, scope: !4554)
!4561 = !DILocation(line: 2305, column: 31, scope: !4557)
!4562 = !DILocation(line: 2305, column: 22, scope: !4557)
!4563 = !DILocation(line: 2305, column: 4, scope: !4557)
!4564 = !DILocation(line: 2301, column: 39, scope: !4557)
!4565 = !DILocation(line: 2301, column: 2, scope: !4557)
!4566 = distinct !{!4566, !4560, !4567, !1517}
!4567 = !DILocation(line: 2305, column: 33, scope: !4554)
!4568 = !DILocation(line: 2326, column: 6, scope: !4569)
!4569 = distinct !DILexicalBlock(scope: !4550, file: !16, line: 2326, column: 6)
!4570 = !DILocation(line: 2327, column: 3, scope: !4569)
!4571 = !DILocation(line: 2330, column: 1, scope: !4550)
!4572 = distinct !DISubprogram(name: "pick_random_point_in_seg", linkageName: "_Z24pick_random_point_in_segP10vms_vectori", scope: !16, file: !16, line: 2336, type: !4573, scopeLine: 2337, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!4573 = !DISubroutineType(types: !4574)
!4574 = !{null, !1447, !9}
!4575 = !DILocalVariable(name: "new_pos", arg: 1, scope: !4572, file: !16, line: 2336, type: !1447)
!4576 = !DILocation(line: 2336, column: 43, scope: !4572)
!4577 = !DILocalVariable(name: "segnum", arg: 2, scope: !4572, file: !16, line: 2336, type: !9)
!4578 = !DILocation(line: 2336, column: 56, scope: !4572)
!4579 = !DILocalVariable(name: "vnum", scope: !4572, file: !16, line: 2338, type: !9)
!4580 = !DILocation(line: 2338, column: 8, scope: !4572)
!4581 = !DILocalVariable(name: "vec2", scope: !4572, file: !16, line: 2339, type: !1448)
!4582 = !DILocation(line: 2339, column: 13, scope: !4572)
!4583 = !DILocation(line: 2341, column: 25, scope: !4572)
!4584 = !DILocation(line: 2341, column: 44, scope: !4572)
!4585 = !DILocation(line: 2341, column: 35, scope: !4572)
!4586 = !DILocation(line: 2341, column: 2, scope: !4572)
!4587 = !DILocation(line: 2342, column: 10, scope: !4572)
!4588 = !DILocation(line: 2342, column: 19, scope: !4572)
!4589 = !DILocation(line: 2342, column: 47, scope: !4572)
!4590 = !DILocation(line: 2342, column: 7, scope: !4572)
!4591 = !DILocation(line: 2343, column: 39, scope: !4572)
!4592 = !DILocation(line: 2343, column: 30, scope: !4572)
!4593 = !DILocation(line: 2343, column: 47, scope: !4572)
!4594 = !DILocation(line: 2343, column: 53, scope: !4572)
!4595 = !DILocation(line: 2343, column: 21, scope: !4572)
!4596 = !DILocation(line: 2343, column: 61, scope: !4572)
!4597 = !DILocation(line: 2343, column: 2, scope: !4572)
!4598 = !DILocation(line: 2344, column: 22, scope: !4572)
!4599 = !DILocation(line: 2344, column: 2, scope: !4572)
!4600 = !DILocation(line: 2345, column: 14, scope: !4572)
!4601 = !DILocation(line: 2345, column: 2, scope: !4572)
!4602 = !DILocation(line: 2346, column: 1, scope: !4572)
!4603 = distinct !DISubprogram(name: "set_segment_depths", linkageName: "_Z18set_segment_depthsiPh", scope: !16, file: !16, line: 2352, type: !4604, scopeLine: 2353, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!4604 = !DISubroutineType(types: !4605)
!4605 = !{!9, !9, !4606}
!4606 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31, size: 64)
!4607 = !DILocalVariable(name: "start_seg", arg: 1, scope: !4603, file: !16, line: 2352, type: !9)
!4608 = !DILocation(line: 2352, column: 28, scope: !4603)
!4609 = !DILocalVariable(name: "segbuf", arg: 2, scope: !4603, file: !16, line: 2352, type: !4606)
!4610 = !DILocation(line: 2352, column: 48, scope: !4603)
!4611 = !DILocalVariable(name: "i", scope: !4603, file: !16, line: 2354, type: !9)
!4612 = !DILocation(line: 2354, column: 6, scope: !4603)
!4613 = !DILocalVariable(name: "curseg", scope: !4603, file: !16, line: 2354, type: !9)
!4614 = !DILocation(line: 2354, column: 9, scope: !4603)
!4615 = !DILocalVariable(name: "visited", scope: !4603, file: !16, line: 2355, type: !175)
!4616 = !DILocation(line: 2355, column: 10, scope: !4603)
!4617 = !DILocalVariable(name: "queue", scope: !4603, file: !16, line: 2356, type: !4618)
!4618 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 28800, elements: !176)
!4619 = !DILocation(line: 2356, column: 6, scope: !4603)
!4620 = !DILocalVariable(name: "head", scope: !4603, file: !16, line: 2357, type: !9)
!4621 = !DILocation(line: 2357, column: 6, scope: !4603)
!4622 = !DILocalVariable(name: "tail", scope: !4603, file: !16, line: 2357, type: !9)
!4623 = !DILocation(line: 2357, column: 12, scope: !4603)
!4624 = !DILocalVariable(name: "depth", scope: !4603, file: !16, line: 2358, type: !9)
!4625 = !DILocation(line: 2358, column: 6, scope: !4603)
!4626 = !DILocalVariable(name: "parent_depth", scope: !4603, file: !16, line: 2359, type: !9)
!4627 = !DILocation(line: 2359, column: 6, scope: !4603)
!4628 = !DILocation(line: 2361, column: 8, scope: !4603)
!4629 = !DILocation(line: 2362, column: 7, scope: !4603)
!4630 = !DILocation(line: 2363, column: 7, scope: !4603)
!4631 = !DILocation(line: 2365, column: 8, scope: !4632)
!4632 = distinct !DILexicalBlock(scope: !4603, file: !16, line: 2365, column: 2)
!4633 = !DILocation(line: 2365, column: 7, scope: !4632)
!4634 = !DILocation(line: 2365, column: 12, scope: !4635)
!4635 = distinct !DILexicalBlock(scope: !4632, file: !16, line: 2365, column: 2)
!4636 = !DILocation(line: 2365, column: 15, scope: !4635)
!4637 = !DILocation(line: 2365, column: 13, scope: !4635)
!4638 = !DILocation(line: 2365, column: 2, scope: !4632)
!4639 = !DILocation(line: 2366, column: 11, scope: !4635)
!4640 = !DILocation(line: 2366, column: 3, scope: !4635)
!4641 = !DILocation(line: 2366, column: 14, scope: !4635)
!4642 = !DILocation(line: 2365, column: 39, scope: !4635)
!4643 = !DILocation(line: 2365, column: 2, scope: !4635)
!4644 = distinct !{!4644, !4638, !4645, !1517}
!4645 = !DILocation(line: 2366, column: 16, scope: !4632)
!4646 = !DILocation(line: 2368, column: 6, scope: !4647)
!4647 = distinct !DILexicalBlock(scope: !4603, file: !16, line: 2368, column: 6)
!4648 = !DILocation(line: 2368, column: 13, scope: !4647)
!4649 = !DILocation(line: 2368, column: 24, scope: !4647)
!4650 = !DILocation(line: 2369, column: 3, scope: !4647)
!4651 = !DILocation(line: 2371, column: 18, scope: !4603)
!4652 = !DILocation(line: 2371, column: 12, scope: !4603)
!4653 = !DILocation(line: 2371, column: 2, scope: !4603)
!4654 = !DILocation(line: 2371, column: 16, scope: !4603)
!4655 = !DILocation(line: 2372, column: 10, scope: !4603)
!4656 = !DILocation(line: 2372, column: 2, scope: !4603)
!4657 = !DILocation(line: 2372, column: 21, scope: !4603)
!4658 = !DILocation(line: 2373, column: 27, scope: !4603)
!4659 = !DILocation(line: 2373, column: 22, scope: !4603)
!4660 = !DILocation(line: 2373, column: 2, scope: !4603)
!4661 = !DILocation(line: 2373, column: 9, scope: !4603)
!4662 = !DILocation(line: 2373, column: 20, scope: !4603)
!4663 = !DILocation(line: 2375, column: 6, scope: !4664)
!4664 = distinct !DILexicalBlock(scope: !4603, file: !16, line: 2375, column: 6)
!4665 = !DILocation(line: 2375, column: 12, scope: !4664)
!4666 = !DILocation(line: 2376, column: 9, scope: !4664)
!4667 = !DILocation(line: 2376, column: 3, scope: !4664)
!4668 = !DILocation(line: 2378, column: 2, scope: !4603)
!4669 = !DILocation(line: 2378, column: 9, scope: !4603)
!4670 = !DILocation(line: 2378, column: 16, scope: !4603)
!4671 = !DILocation(line: 2378, column: 14, scope: !4603)
!4672 = !DILocation(line: 2379, column: 22, scope: !4673)
!4673 = distinct !DILexicalBlock(scope: !4603, file: !16, line: 2378, column: 22)
!4674 = !DILocation(line: 2379, column: 12, scope: !4673)
!4675 = !DILocation(line: 2379, column: 10, scope: !4673)
!4676 = !DILocation(line: 2380, column: 18, scope: !4673)
!4677 = !DILocation(line: 2380, column: 25, scope: !4673)
!4678 = !DILocation(line: 2380, column: 16, scope: !4673)
!4679 = !DILocation(line: 2382, column: 9, scope: !4680)
!4680 = distinct !DILexicalBlock(scope: !4673, file: !16, line: 2382, column: 3)
!4681 = !DILocation(line: 2382, column: 8, scope: !4680)
!4682 = !DILocation(line: 2382, column: 13, scope: !4683)
!4683 = distinct !DILexicalBlock(scope: !4680, file: !16, line: 2382, column: 3)
!4684 = !DILocation(line: 2382, column: 14, scope: !4683)
!4685 = !DILocation(line: 2382, column: 3, scope: !4680)
!4686 = !DILocalVariable(name: "childnum", scope: !4687, file: !16, line: 2383, type: !9)
!4687 = distinct !DILexicalBlock(scope: !4683, file: !16, line: 2382, column: 43)
!4688 = !DILocation(line: 2383, column: 8, scope: !4687)
!4689 = !DILocation(line: 2385, column: 24, scope: !4687)
!4690 = !DILocation(line: 2385, column: 15, scope: !4687)
!4691 = !DILocation(line: 2385, column: 32, scope: !4687)
!4692 = !DILocation(line: 2385, column: 41, scope: !4687)
!4693 = !DILocation(line: 2385, column: 13, scope: !4687)
!4694 = !DILocation(line: 2386, column: 8, scope: !4695)
!4695 = distinct !DILexicalBlock(scope: !4687, file: !16, line: 2386, column: 8)
!4696 = !DILocation(line: 2386, column: 17, scope: !4695)
!4697 = !DILocation(line: 2387, column: 9, scope: !4698)
!4698 = distinct !DILexicalBlock(scope: !4695, file: !16, line: 2387, column: 9)
!4699 = !DILocation(line: 2387, column: 16, scope: !4698)
!4700 = !DILocation(line: 2388, column: 19, scope: !4701)
!4701 = distinct !DILexicalBlock(scope: !4698, file: !16, line: 2388, column: 10)
!4702 = !DILocation(line: 2388, column: 11, scope: !4701)
!4703 = !DILocation(line: 2388, column: 10, scope: !4701)
!4704 = !DILocation(line: 2389, column: 15, scope: !4705)
!4705 = distinct !DILexicalBlock(scope: !4701, file: !16, line: 2388, column: 30)
!4706 = !DILocation(line: 2389, column: 7, scope: !4705)
!4707 = !DILocation(line: 2389, column: 25, scope: !4705)
!4708 = !DILocation(line: 2390, column: 26, scope: !4705)
!4709 = !DILocation(line: 2390, column: 38, scope: !4705)
!4710 = !DILocation(line: 2390, column: 7, scope: !4705)
!4711 = !DILocation(line: 2390, column: 14, scope: !4705)
!4712 = !DILocation(line: 2390, column: 24, scope: !4705)
!4713 = !DILocation(line: 2391, column: 23, scope: !4705)
!4714 = !DILocation(line: 2391, column: 17, scope: !4705)
!4715 = !DILocation(line: 2391, column: 7, scope: !4705)
!4716 = !DILocation(line: 2391, column: 21, scope: !4705)
!4717 = !DILocation(line: 2392, column: 6, scope: !4705)
!4718 = !DILocation(line: 2388, column: 27, scope: !4701)
!4719 = !DILocation(line: 2387, column: 24, scope: !4698)
!4720 = !DILocation(line: 2393, column: 3, scope: !4687)
!4721 = !DILocation(line: 2382, column: 39, scope: !4683)
!4722 = !DILocation(line: 2382, column: 3, scope: !4683)
!4723 = distinct !{!4723, !4685, !4724, !1517}
!4724 = !DILocation(line: 2393, column: 3, scope: !4680)
!4725 = distinct !{!4725, !4668, !4726, !1517}
!4726 = !DILocation(line: 2394, column: 2, scope: !4603)
!4727 = !DILocation(line: 2396, column: 9, scope: !4603)
!4728 = !DILocation(line: 2396, column: 21, scope: !4603)
!4729 = !DILocation(line: 2396, column: 2, scope: !4603)
!4730 = !DILocation(line: 2397, column: 1, scope: !4603)
!4731 = distinct !DISubprogram(name: "apply_light_to_segment", linkageName: "_Z22apply_light_to_segmentP7segmentP10vms_vectorii", scope: !16, file: !16, line: 2409, type: !4732, scopeLine: 2410, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!4732 = !DISubroutineType(types: !4733)
!4733 = !{null, !1455, !1447, !5, !9}
!4734 = !DILocalVariable(name: "segp", arg: 1, scope: !4731, file: !16, line: 2409, type: !1455)
!4735 = !DILocation(line: 2409, column: 38, scope: !4731)
!4736 = !DILocalVariable(name: "segment_center", arg: 2, scope: !4731, file: !16, line: 2409, type: !1447)
!4737 = !DILocation(line: 2409, column: 55, scope: !4731)
!4738 = !DILocalVariable(name: "light_intensity", arg: 3, scope: !4731, file: !16, line: 2409, type: !5)
!4739 = !DILocation(line: 2409, column: 75, scope: !4731)
!4740 = !DILocalVariable(name: "recursion_depth", arg: 4, scope: !4731, file: !16, line: 2409, type: !9)
!4741 = !DILocation(line: 2409, column: 95, scope: !4731)
!4742 = !DILocalVariable(name: "r_segment_center", scope: !4731, file: !16, line: 2411, type: !1448)
!4743 = !DILocation(line: 2411, column: 13, scope: !4731)
!4744 = !DILocalVariable(name: "dist_to_rseg", scope: !4731, file: !16, line: 2412, type: !5)
!4745 = !DILocation(line: 2412, column: 8, scope: !4731)
!4746 = !DILocalVariable(name: "i", scope: !4731, file: !16, line: 2413, type: !9)
!4747 = !DILocation(line: 2413, column: 9, scope: !4731)
!4748 = !DILocalVariable(name: "segnum", scope: !4731, file: !16, line: 2413, type: !9)
!4749 = !DILocation(line: 2413, column: 11, scope: !4731)
!4750 = !DILocation(line: 2413, column: 18, scope: !4731)
!4751 = !DILocation(line: 2413, column: 22, scope: !4731)
!4752 = !DILocalVariable(name: "sidenum", scope: !4731, file: !16, line: 2413, type: !9)
!4753 = !DILocation(line: 2413, column: 32, scope: !4731)
!4754 = !DILocation(line: 2415, column: 8, scope: !4755)
!4755 = distinct !DILexicalBlock(scope: !4731, file: !16, line: 2415, column: 2)
!4756 = !DILocation(line: 2415, column: 7, scope: !4755)
!4757 = !DILocation(line: 2415, column: 11, scope: !4758)
!4758 = distinct !DILexicalBlock(scope: !4755, file: !16, line: 2415, column: 2)
!4759 = !DILocation(line: 2415, column: 13, scope: !4758)
!4760 = !DILocation(line: 2415, column: 12, scope: !4758)
!4761 = !DILocation(line: 2415, column: 2, scope: !4755)
!4762 = !DILocation(line: 2416, column: 20, scope: !4763)
!4763 = distinct !DILexicalBlock(scope: !4758, file: !16, line: 2416, column: 7)
!4764 = !DILocation(line: 2416, column: 7, scope: !4763)
!4765 = !DILocation(line: 2416, column: 26, scope: !4763)
!4766 = !DILocation(line: 2416, column: 23, scope: !4763)
!4767 = !DILocation(line: 2417, column: 4, scope: !4763)
!4768 = !DILocation(line: 2415, column: 29, scope: !4758)
!4769 = !DILocation(line: 2415, column: 2, scope: !4758)
!4770 = distinct !{!4770, !4761, !4771, !1517}
!4771 = !DILocation(line: 2417, column: 4, scope: !4755)
!4772 = !DILocation(line: 2419, column: 6, scope: !4773)
!4773 = distinct !DILexicalBlock(scope: !4731, file: !16, line: 2419, column: 6)
!4774 = !DILocation(line: 2419, column: 11, scope: !4773)
!4775 = !DILocation(line: 2419, column: 8, scope: !4773)
!4776 = !DILocation(line: 2420, column: 45, scope: !4777)
!4777 = distinct !DILexicalBlock(scope: !4773, file: !16, line: 2419, column: 27)
!4778 = !DILocation(line: 2420, column: 3, scope: !4777)
!4779 = !DILocation(line: 2421, column: 55, scope: !4777)
!4780 = !DILocation(line: 2421, column: 18, scope: !4777)
!4781 = !DILocation(line: 2421, column: 16, scope: !4777)
!4782 = !DILocation(line: 2423, column: 7, scope: !4783)
!4783 = distinct !DILexicalBlock(scope: !4777, file: !16, line: 2423, column: 7)
!4784 = !DILocation(line: 2423, column: 20, scope: !4783)
!4785 = !DILocalVariable(name: "light_at_point", scope: !4786, file: !16, line: 2424, type: !5)
!4786 = distinct !DILexicalBlock(scope: !4783, file: !16, line: 2423, column: 49)
!4787 = !DILocation(line: 2424, column: 8, scope: !4786)
!4788 = !DILocation(line: 2425, column: 8, scope: !4789)
!4789 = distinct !DILexicalBlock(scope: !4786, file: !16, line: 2425, column: 8)
!4790 = !DILocation(line: 2425, column: 21, scope: !4789)
!4791 = !DILocation(line: 2426, column: 53, scope: !4789)
!4792 = !DILocation(line: 2426, column: 22, scope: !4789)
!4793 = !DILocation(line: 2426, column: 20, scope: !4789)
!4794 = !DILocation(line: 2426, column: 5, scope: !4789)
!4795 = !DILocation(line: 2428, column: 20, scope: !4789)
!4796 = !DILocation(line: 2430, column: 8, scope: !4797)
!4797 = distinct !DILexicalBlock(scope: !4786, file: !16, line: 2430, column: 8)
!4798 = !DILocation(line: 2430, column: 23, scope: !4797)
!4799 = !DILocalVariable(name: "seg2p", scope: !4800, file: !16, line: 2431, type: !4801)
!4800 = distinct !DILexicalBlock(scope: !4797, file: !16, line: 2430, column: 29)
!4801 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4802, size: 64)
!4802 = !DIDerivedType(tag: DW_TAG_typedef, name: "segment2", file: !19, line: 137, baseType: !4803)
!4803 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "segment2", file: !19, line: 130, size: 64, flags: DIFlagTypePassByValue, elements: !4804, identifier: "_ZTS8segment2")
!4804 = !{!4805, !4806, !4807, !4808, !4809}
!4805 = !DIDerivedType(tag: DW_TAG_member, name: "special", scope: !4803, file: !19, line: 132, baseType: !31, size: 8)
!4806 = !DIDerivedType(tag: DW_TAG_member, name: "matcen_num", scope: !4803, file: !19, line: 133, baseType: !25, size: 8, offset: 8)
!4807 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !4803, file: !19, line: 134, baseType: !25, size: 8, offset: 16)
!4808 = !DIDerivedType(tag: DW_TAG_member, name: "s2_flags", scope: !4803, file: !19, line: 135, baseType: !31, size: 8, offset: 24)
!4809 = !DIDerivedType(tag: DW_TAG_member, name: "static_light", scope: !4803, file: !19, line: 136, baseType: !5, size: 32, offset: 32)
!4810 = !DILocation(line: 2431, column: 15, scope: !4800)
!4811 = !DILocation(line: 2431, column: 34, scope: !4800)
!4812 = !DILocation(line: 2431, column: 24, scope: !4800)
!4813 = !DILocation(line: 2432, column: 29, scope: !4800)
!4814 = !DILocation(line: 2432, column: 45, scope: !4800)
!4815 = !DILocation(line: 2432, column: 22, scope: !4800)
!4816 = !DILocation(line: 2432, column: 20, scope: !4800)
!4817 = !DILocation(line: 2433, column: 9, scope: !4818)
!4818 = distinct !DILexicalBlock(scope: !4800, file: !16, line: 2433, column: 9)
!4819 = !DILocation(line: 2433, column: 24, scope: !4818)
!4820 = !DILocation(line: 2434, column: 21, scope: !4818)
!4821 = !DILocation(line: 2434, column: 6, scope: !4818)
!4822 = !DILocation(line: 2435, column: 9, scope: !4823)
!4823 = distinct !DILexicalBlock(scope: !4800, file: !16, line: 2435, column: 9)
!4824 = !DILocation(line: 2435, column: 24, scope: !4823)
!4825 = !DILocation(line: 2436, column: 21, scope: !4823)
!4826 = !DILocation(line: 2436, column: 6, scope: !4823)
!4827 = !DILocation(line: 2437, column: 28, scope: !4800)
!4828 = !DILocation(line: 2437, column: 5, scope: !4800)
!4829 = !DILocation(line: 2437, column: 12, scope: !4800)
!4830 = !DILocation(line: 2437, column: 25, scope: !4800)
!4831 = !DILocation(line: 2438, column: 9, scope: !4832)
!4832 = distinct !DILexicalBlock(scope: !4800, file: !16, line: 2438, column: 9)
!4833 = !DILocation(line: 2438, column: 16, scope: !4832)
!4834 = !DILocation(line: 2438, column: 29, scope: !4832)
!4835 = !DILocation(line: 2439, column: 6, scope: !4832)
!4836 = !DILocation(line: 2439, column: 13, scope: !4832)
!4837 = !DILocation(line: 2439, column: 26, scope: !4832)
!4838 = !DILocation(line: 2440, column: 4, scope: !4800)
!4839 = !DILocation(line: 2441, column: 3, scope: !4786)
!4840 = !DILocation(line: 2443, column: 36, scope: !4777)
!4841 = !DILocation(line: 2443, column: 30, scope: !4777)
!4842 = !DILocation(line: 2443, column: 3, scope: !4777)
!4843 = !DILocation(line: 2443, column: 34, scope: !4777)
!4844 = !DILocation(line: 2444, column: 2, scope: !4777)
!4845 = !DILocation(line: 2446, column: 6, scope: !4846)
!4846 = distinct !DILexicalBlock(scope: !4731, file: !16, line: 2446, column: 6)
!4847 = !DILocation(line: 2446, column: 22, scope: !4846)
!4848 = !DILocation(line: 2447, column: 15, scope: !4849)
!4849 = distinct !DILexicalBlock(scope: !4846, file: !16, line: 2447, column: 3)
!4850 = !DILocation(line: 2447, column: 8, scope: !4849)
!4851 = !DILocation(line: 2447, column: 19, scope: !4852)
!4852 = distinct !DILexicalBlock(scope: !4849, file: !16, line: 2447, column: 3)
!4853 = !DILocation(line: 2447, column: 26, scope: !4852)
!4854 = !DILocation(line: 2447, column: 3, scope: !4849)
!4855 = !DILocation(line: 2448, column: 8, scope: !4856)
!4856 = distinct !DILexicalBlock(scope: !4857, file: !16, line: 2448, column: 8)
!4857 = distinct !DILexicalBlock(scope: !4852, file: !16, line: 2447, column: 41)
!4858 = !DILocation(line: 2448, column: 38, scope: !4856)
!4859 = !DILocation(line: 2449, column: 38, scope: !4856)
!4860 = !DILocation(line: 2449, column: 44, scope: !4856)
!4861 = !DILocation(line: 2449, column: 53, scope: !4856)
!4862 = !DILocation(line: 2449, column: 29, scope: !4856)
!4863 = !DILocation(line: 2449, column: 63, scope: !4856)
!4864 = !DILocation(line: 2449, column: 78, scope: !4856)
!4865 = !DILocation(line: 2449, column: 94, scope: !4856)
!4866 = !DILocation(line: 2449, column: 109, scope: !4856)
!4867 = !DILocation(line: 2449, column: 5, scope: !4856)
!4868 = !DILocation(line: 2450, column: 3, scope: !4857)
!4869 = !DILocation(line: 2447, column: 37, scope: !4852)
!4870 = !DILocation(line: 2447, column: 3, scope: !4852)
!4871 = distinct !{!4871, !4854, !4872, !1517}
!4872 = !DILocation(line: 2450, column: 3, scope: !4849)
!4873 = !DILocation(line: 2452, column: 1, scope: !4731)
!4874 = distinct !DISubprogram(name: "fixdiv", linkageName: "_Z6fixdivii", scope: !6, file: !6, line: 89, type: !4875, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!4875 = !DISubroutineType(types: !4876)
!4876 = !{!5, !5, !5}
!4877 = !DILocalVariable(name: "a", arg: 1, scope: !4874, file: !6, line: 89, type: !5)
!4878 = !DILocation(line: 89, column: 26, scope: !4874)
!4879 = !DILocalVariable(name: "b", arg: 2, scope: !4874, file: !6, line: 89, type: !5)
!4880 = !DILocation(line: 89, column: 33, scope: !4874)
!4881 = !DILocation(line: 92, column: 6, scope: !4882)
!4882 = distinct !DILexicalBlock(scope: !4874, file: !6, line: 92, column: 6)
!4883 = !DILocation(line: 92, column: 8, scope: !4882)
!4884 = !DILocation(line: 92, column: 14, scope: !4882)
!4885 = !DILocation(line: 94, column: 25, scope: !4874)
!4886 = !DILocation(line: 94, column: 27, scope: !4874)
!4887 = !DILocation(line: 94, column: 36, scope: !4874)
!4888 = !DILocation(line: 94, column: 34, scope: !4874)
!4889 = !DILocation(line: 94, column: 14, scope: !4874)
!4890 = !DILocation(line: 94, column: 2, scope: !4874)
!4891 = !DILocation(line: 95, column: 1, scope: !4874)
!4892 = distinct !DISubprogram(name: "fixmul", linkageName: "_Z6fixmulii", scope: !6, file: !6, line: 83, type: !4875, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!4893 = !DILocalVariable(name: "a", arg: 1, scope: !4892, file: !6, line: 83, type: !5)
!4894 = !DILocation(line: 83, column: 26, scope: !4892)
!4895 = !DILocalVariable(name: "b", arg: 2, scope: !4892, file: !6, line: 83, type: !5)
!4896 = !DILocation(line: 83, column: 33, scope: !4892)
!4897 = !DILocation(line: 85, column: 19, scope: !4892)
!4898 = !DILocation(line: 85, column: 32, scope: !4892)
!4899 = !DILocation(line: 85, column: 21, scope: !4892)
!4900 = !DILocation(line: 85, column: 35, scope: !4892)
!4901 = !DILocation(line: 85, column: 9, scope: !4892)
!4902 = !DILocation(line: 85, column: 2, scope: !4892)
!4903 = distinct !DISubprogram(name: "change_segment_light", linkageName: "_Z20change_segment_lightiii", scope: !16, file: !16, line: 2459, type: !4904, scopeLine: 2460, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!4904 = !DISubroutineType(types: !4905)
!4905 = !{null, !9, !9, !9}
!4906 = !DILocalVariable(name: "segnum", arg: 1, scope: !4903, file: !16, line: 2459, type: !9)
!4907 = !DILocation(line: 2459, column: 31, scope: !4903)
!4908 = !DILocalVariable(name: "sidenum", arg: 2, scope: !4903, file: !16, line: 2459, type: !9)
!4909 = !DILocation(line: 2459, column: 42, scope: !4903)
!4910 = !DILocalVariable(name: "dir", arg: 3, scope: !4903, file: !16, line: 2459, type: !9)
!4911 = !DILocation(line: 2459, column: 54, scope: !4903)
!4912 = !DILocalVariable(name: "segp", scope: !4903, file: !16, line: 2461, type: !1455)
!4913 = !DILocation(line: 2461, column: 11, scope: !4903)
!4914 = !DILocation(line: 2461, column: 28, scope: !4903)
!4915 = !DILocation(line: 2461, column: 19, scope: !4903)
!4916 = !DILocation(line: 2463, column: 6, scope: !4917)
!4917 = distinct !DILexicalBlock(scope: !4903, file: !16, line: 2463, column: 6)
!4918 = !DILocation(line: 2463, column: 37, scope: !4917)
!4919 = !DILocalVariable(name: "sidep", scope: !4920, file: !16, line: 2464, type: !1594)
!4920 = distinct !DILexicalBlock(scope: !4917, file: !16, line: 2463, column: 56)
!4921 = !DILocation(line: 2464, column: 9, scope: !4920)
!4922 = !DILocation(line: 2464, column: 18, scope: !4920)
!4923 = !DILocation(line: 2464, column: 24, scope: !4920)
!4924 = !DILocation(line: 2464, column: 30, scope: !4920)
!4925 = !DILocalVariable(name: "light_intensity", scope: !4920, file: !16, line: 2465, type: !5)
!4926 = !DILocation(line: 2465, column: 7, scope: !4920)
!4927 = !DILocation(line: 2467, column: 30, scope: !4920)
!4928 = !DILocation(line: 2467, column: 37, scope: !4920)
!4929 = !DILocation(line: 2467, column: 21, scope: !4920)
!4930 = !DILocation(line: 2467, column: 47, scope: !4920)
!4931 = !DILocation(line: 2467, column: 67, scope: !4920)
!4932 = !DILocation(line: 2467, column: 74, scope: !4920)
!4933 = !DILocation(line: 2467, column: 84, scope: !4920)
!4934 = !DILocation(line: 2467, column: 58, scope: !4920)
!4935 = !DILocation(line: 2467, column: 94, scope: !4920)
!4936 = !DILocation(line: 2467, column: 56, scope: !4920)
!4937 = !DILocation(line: 2467, column: 19, scope: !4920)
!4938 = !DILocation(line: 2469, column: 22, scope: !4920)
!4939 = !DILocation(line: 2469, column: 19, scope: !4920)
!4940 = !DILocation(line: 2471, column: 18, scope: !4920)
!4941 = !DILocation(line: 2473, column: 7, scope: !4942)
!4942 = distinct !DILexicalBlock(scope: !4920, file: !16, line: 2473, column: 7)
!4943 = !DILocalVariable(name: "segment_center", scope: !4944, file: !16, line: 2474, type: !1448)
!4944 = distinct !DILexicalBlock(scope: !4942, file: !16, line: 2473, column: 24)
!4945 = !DILocation(line: 2474, column: 15, scope: !4944)
!4946 = !DILocation(line: 2475, column: 44, scope: !4944)
!4947 = !DILocation(line: 2475, column: 4, scope: !4944)
!4948 = !DILocation(line: 2476, column: 27, scope: !4944)
!4949 = !DILocation(line: 2476, column: 48, scope: !4944)
!4950 = !DILocation(line: 2476, column: 4, scope: !4944)
!4951 = !DILocation(line: 2477, column: 3, scope: !4944)
!4952 = !DILocation(line: 2478, column: 2, scope: !4920)
!4953 = !DILocation(line: 2482, column: 13, scope: !4903)
!4954 = !DILocation(line: 2484, column: 1, scope: !4903)
!4955 = distinct !DISubprogram(name: "change_light", linkageName: "_Z12change_lightiii", scope: !16, file: !16, line: 2491, type: !4904, scopeLine: 2492, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!4956 = !DILocalVariable(name: "segnum", arg: 1, scope: !4955, file: !16, line: 2491, type: !9)
!4957 = !DILocation(line: 2491, column: 23, scope: !4955)
!4958 = !DILocalVariable(name: "sidenum", arg: 2, scope: !4955, file: !16, line: 2491, type: !9)
!4959 = !DILocation(line: 2491, column: 35, scope: !4955)
!4960 = !DILocalVariable(name: "dir", arg: 3, scope: !4955, file: !16, line: 2491, type: !9)
!4961 = !DILocation(line: 2491, column: 48, scope: !4955)
!4962 = !DILocalVariable(name: "i", scope: !4955, file: !16, line: 2493, type: !9)
!4963 = !DILocation(line: 2493, column: 6, scope: !4955)
!4964 = !DILocalVariable(name: "j", scope: !4955, file: !16, line: 2493, type: !9)
!4965 = !DILocation(line: 2493, column: 9, scope: !4955)
!4966 = !DILocalVariable(name: "k", scope: !4955, file: !16, line: 2493, type: !9)
!4967 = !DILocation(line: 2493, column: 12, scope: !4955)
!4968 = !DILocation(line: 2495, column: 8, scope: !4969)
!4969 = distinct !DILexicalBlock(scope: !4955, file: !16, line: 2495, column: 2)
!4970 = !DILocation(line: 2495, column: 7, scope: !4969)
!4971 = !DILocation(line: 2495, column: 12, scope: !4972)
!4972 = distinct !DILexicalBlock(scope: !4969, file: !16, line: 2495, column: 2)
!4973 = !DILocation(line: 2495, column: 14, scope: !4972)
!4974 = !DILocation(line: 2495, column: 13, scope: !4972)
!4975 = !DILocation(line: 2495, column: 2, scope: !4969)
!4976 = !DILocation(line: 2497, column: 19, scope: !4977)
!4977 = distinct !DILexicalBlock(scope: !4978, file: !16, line: 2497, column: 7)
!4978 = distinct !DILexicalBlock(scope: !4972, file: !16, line: 2496, column: 2)
!4979 = !DILocation(line: 2497, column: 8, scope: !4977)
!4980 = !DILocation(line: 2497, column: 22, scope: !4977)
!4981 = !DILocation(line: 2497, column: 32, scope: !4977)
!4982 = !DILocation(line: 2497, column: 29, scope: !4977)
!4983 = !DILocation(line: 2497, column: 40, scope: !4977)
!4984 = !DILocation(line: 2497, column: 55, scope: !4977)
!4985 = !DILocation(line: 2497, column: 44, scope: !4977)
!4986 = !DILocation(line: 2497, column: 58, scope: !4977)
!4987 = !DILocation(line: 2497, column: 69, scope: !4977)
!4988 = !DILocation(line: 2497, column: 66, scope: !4977)
!4989 = !DILocalVariable(name: "dlp", scope: !4990, file: !16, line: 2499, type: !4991)
!4990 = distinct !DILexicalBlock(scope: !4977, file: !16, line: 2498, column: 3)
!4991 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!4992 = !DILocation(line: 2499, column: 17, scope: !4990)
!4993 = !DILocalVariable(name: "index", scope: !4990, file: !16, line: 2500, type: !9)
!4994 = !DILocation(line: 2500, column: 8, scope: !4990)
!4995 = !DILocation(line: 2500, column: 27, scope: !4990)
!4996 = !DILocation(line: 2500, column: 16, scope: !4990)
!4997 = !DILocation(line: 2500, column: 30, scope: !4990)
!4998 = !DILocation(line: 2502, column: 10, scope: !4999)
!4999 = distinct !DILexicalBlock(scope: !4990, file: !16, line: 2502, column: 4)
!5000 = !DILocation(line: 2502, column: 9, scope: !4999)
!5001 = !DILocation(line: 2502, column: 14, scope: !5002)
!5002 = distinct !DILexicalBlock(scope: !4999, file: !16, line: 2502, column: 4)
!5003 = !DILocation(line: 2502, column: 27, scope: !5002)
!5004 = !DILocation(line: 2502, column: 16, scope: !5002)
!5005 = !DILocation(line: 2502, column: 30, scope: !5002)
!5006 = !DILocation(line: 2502, column: 15, scope: !5002)
!5007 = !DILocation(line: 2502, column: 4, scope: !4999)
!5008 = !DILocation(line: 2505, column: 9, scope: !5009)
!5009 = distinct !DILexicalBlock(scope: !5010, file: !16, line: 2505, column: 9)
!5010 = distinct !DILexicalBlock(scope: !5002, file: !16, line: 2503, column: 4)
!5011 = !DILocation(line: 2505, column: 15, scope: !5009)
!5012 = !DILocation(line: 2505, column: 19, scope: !5009)
!5013 = !DILocation(line: 2505, column: 22, scope: !5009)
!5014 = !DILocation(line: 2505, column: 28, scope: !5009)
!5015 = !DILocation(line: 2506, column: 6, scope: !5009)
!5016 = !DILocation(line: 2507, column: 25, scope: !5010)
!5017 = !DILocation(line: 2507, column: 12, scope: !5010)
!5018 = !DILocation(line: 2507, column: 9, scope: !5010)
!5019 = !DILocation(line: 2511, column: 9, scope: !5020)
!5020 = distinct !DILexicalBlock(scope: !5010, file: !16, line: 2511, column: 9)
!5021 = !DILocation(line: 2511, column: 14, scope: !5020)
!5022 = !DILocation(line: 2511, column: 21, scope: !5020)
!5023 = !DILocation(line: 2511, column: 25, scope: !5020)
!5024 = !DILocation(line: 2511, column: 28, scope: !5020)
!5025 = !DILocation(line: 2511, column: 33, scope: !5020)
!5026 = !DILocation(line: 2511, column: 42, scope: !5020)
!5027 = !DILocation(line: 2511, column: 40, scope: !5020)
!5028 = !DILocation(line: 2511, column: 64, scope: !5020)
!5029 = !DILocation(line: 2511, column: 67, scope: !5020)
!5030 = !DILocation(line: 2511, column: 72, scope: !5020)
!5031 = !DILocation(line: 2511, column: 80, scope: !5020)
!5032 = !DILocation(line: 2511, column: 84, scope: !5020)
!5033 = !DILocation(line: 2511, column: 87, scope: !5020)
!5034 = !DILocation(line: 2511, column: 92, scope: !5020)
!5035 = !DILocation(line: 2511, column: 100, scope: !5020)
!5036 = !DILocation(line: 2512, column: 6, scope: !5020)
!5037 = !DILocation(line: 2514, column: 11, scope: !5038)
!5038 = distinct !DILexicalBlock(scope: !5010, file: !16, line: 2514, column: 5)
!5039 = !DILocation(line: 2514, column: 10, scope: !5038)
!5040 = !DILocation(line: 2514, column: 15, scope: !5041)
!5041 = distinct !DILexicalBlock(scope: !5038, file: !16, line: 2514, column: 5)
!5042 = !DILocation(line: 2514, column: 16, scope: !5041)
!5043 = !DILocation(line: 2514, column: 5, scope: !5038)
!5044 = !DILocalVariable(name: "dl", scope: !5045, file: !16, line: 2516, type: !5)
!5045 = distinct !DILexicalBlock(scope: !5041, file: !16, line: 2515, column: 5)
!5046 = !DILocation(line: 2516, column: 10, scope: !5045)
!5047 = !DILocalVariable(name: "new_l", scope: !5045, file: !16, line: 2516, type: !5)
!5048 = !DILocation(line: 2516, column: 13, scope: !5045)
!5049 = !DILocation(line: 2517, column: 11, scope: !5045)
!5050 = !DILocation(line: 2517, column: 17, scope: !5045)
!5051 = !DILocation(line: 2517, column: 22, scope: !5045)
!5052 = !DILocation(line: 2517, column: 33, scope: !5045)
!5053 = !DILocation(line: 2517, column: 15, scope: !5045)
!5054 = !DILocation(line: 2517, column: 36, scope: !5045)
!5055 = !DILocation(line: 2517, column: 9, scope: !5045)
!5056 = !DILocation(line: 2520, column: 70, scope: !5045)
!5057 = !DILocation(line: 2520, column: 24, scope: !5045)
!5058 = !DILocation(line: 2520, column: 29, scope: !5045)
!5059 = !DILocation(line: 2520, column: 15, scope: !5045)
!5060 = !DILocation(line: 2520, column: 37, scope: !5045)
!5061 = !DILocation(line: 2520, column: 43, scope: !5045)
!5062 = !DILocation(line: 2520, column: 48, scope: !5045)
!5063 = !DILocation(line: 2520, column: 57, scope: !5045)
!5064 = !DILocation(line: 2520, column: 62, scope: !5045)
!5065 = !DILocation(line: 2520, column: 65, scope: !5045)
!5066 = !DILocation(line: 2520, column: 67, scope: !5045)
!5067 = !DILocation(line: 2520, column: 12, scope: !5045)
!5068 = !DILocation(line: 2521, column: 10, scope: !5069)
!5069 = distinct !DILexicalBlock(scope: !5045, file: !16, line: 2521, column: 10)
!5070 = !DILocation(line: 2521, column: 16, scope: !5069)
!5071 = !DILocation(line: 2522, column: 16, scope: !5069)
!5072 = !DILocation(line: 2522, column: 21, scope: !5069)
!5073 = !DILocation(line: 2522, column: 7, scope: !5069)
!5074 = !DILocation(line: 2522, column: 29, scope: !5069)
!5075 = !DILocation(line: 2522, column: 35, scope: !5069)
!5076 = !DILocation(line: 2522, column: 40, scope: !5069)
!5077 = !DILocation(line: 2522, column: 49, scope: !5069)
!5078 = !DILocation(line: 2522, column: 54, scope: !5069)
!5079 = !DILocation(line: 2522, column: 57, scope: !5069)
!5080 = !DILocation(line: 2522, column: 59, scope: !5069)
!5081 = !DILocation(line: 2523, column: 5, scope: !5045)
!5082 = !DILocation(line: 2514, column: 21, scope: !5041)
!5083 = !DILocation(line: 2514, column: 5, scope: !5041)
!5084 = distinct !{!5084, !5043, !5085, !1517}
!5085 = !DILocation(line: 2523, column: 5, scope: !5038)
!5086 = !DILocation(line: 2524, column: 10, scope: !5010)
!5087 = !DILocation(line: 2525, column: 4, scope: !5010)
!5088 = !DILocation(line: 2502, column: 38, scope: !5002)
!5089 = !DILocation(line: 2502, column: 4, scope: !5002)
!5090 = distinct !{!5090, !5007, !5091, !1517}
!5091 = !DILocation(line: 2525, column: 4, scope: !4999)
!5092 = !DILocation(line: 2526, column: 3, scope: !4990)
!5093 = !DILocation(line: 2527, column: 2, scope: !4978)
!5094 = !DILocation(line: 2495, column: 34, scope: !4972)
!5095 = !DILocation(line: 2495, column: 2, scope: !4972)
!5096 = distinct !{!5096, !4975, !5097, !1517}
!5097 = !DILocation(line: 2527, column: 2, scope: !4969)
!5098 = !DILocation(line: 2530, column: 23, scope: !4955)
!5099 = !DILocation(line: 2530, column: 30, scope: !4955)
!5100 = !DILocation(line: 2530, column: 38, scope: !4955)
!5101 = !DILocation(line: 2530, column: 2, scope: !4955)
!5102 = !DILocation(line: 2531, column: 1, scope: !4955)
!5103 = distinct !DISubprogram(name: "subtract_light", linkageName: "_Z14subtract_lightii", scope: !16, file: !16, line: 2536, type: !5104, scopeLine: 2537, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!5104 = !DISubroutineType(types: !5105)
!5105 = !{!9, !9, !9}
!5106 = !DILocalVariable(name: "segnum", arg: 1, scope: !5103, file: !16, line: 2536, type: !9)
!5107 = !DILocation(line: 2536, column: 24, scope: !5103)
!5108 = !DILocalVariable(name: "sidenum", arg: 2, scope: !5103, file: !16, line: 2536, type: !9)
!5109 = !DILocation(line: 2536, column: 36, scope: !5103)
!5110 = !DILocation(line: 2538, column: 23, scope: !5111)
!5111 = distinct !DILexicalBlock(scope: !5103, file: !16, line: 2538, column: 6)
!5112 = !DILocation(line: 2538, column: 6, scope: !5111)
!5113 = !DILocation(line: 2538, column: 39, scope: !5111)
!5114 = !DILocation(line: 2538, column: 36, scope: !5111)
!5115 = !DILocation(line: 2538, column: 31, scope: !5111)
!5116 = !DILocation(line: 2540, column: 3, scope: !5117)
!5117 = distinct !DILexicalBlock(scope: !5111, file: !16, line: 2538, column: 49)
!5118 = !DILocation(line: 2543, column: 36, scope: !5103)
!5119 = !DILocation(line: 2543, column: 33, scope: !5103)
!5120 = !DILocation(line: 2543, column: 19, scope: !5103)
!5121 = !DILocation(line: 2543, column: 2, scope: !5103)
!5122 = !DILocation(line: 2543, column: 27, scope: !5103)
!5123 = !DILocation(line: 2544, column: 15, scope: !5103)
!5124 = !DILocation(line: 2544, column: 23, scope: !5103)
!5125 = !DILocation(line: 2544, column: 2, scope: !5103)
!5126 = !DILocation(line: 2545, column: 2, scope: !5103)
!5127 = !DILocation(line: 2546, column: 1, scope: !5103)
!5128 = distinct !DISubprogram(name: "add_light", linkageName: "_Z9add_lightii", scope: !16, file: !16, line: 2552, type: !5104, scopeLine: 2553, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!5129 = !DILocalVariable(name: "segnum", arg: 1, scope: !5128, file: !16, line: 2552, type: !9)
!5130 = !DILocation(line: 2552, column: 19, scope: !5128)
!5131 = !DILocalVariable(name: "sidenum", arg: 2, scope: !5128, file: !16, line: 2552, type: !9)
!5132 = !DILocation(line: 2552, column: 31, scope: !5128)
!5133 = !DILocation(line: 2554, column: 25, scope: !5134)
!5134 = distinct !DILexicalBlock(scope: !5128, file: !16, line: 2554, column: 6)
!5135 = !DILocation(line: 2554, column: 8, scope: !5134)
!5136 = !DILocation(line: 2554, column: 41, scope: !5134)
!5137 = !DILocation(line: 2554, column: 38, scope: !5134)
!5138 = !DILocation(line: 2554, column: 33, scope: !5134)
!5139 = !DILocation(line: 2554, column: 7, scope: !5134)
!5140 = !DILocation(line: 2554, column: 6, scope: !5134)
!5141 = !DILocation(line: 2556, column: 3, scope: !5142)
!5142 = distinct !DILexicalBlock(scope: !5134, file: !16, line: 2554, column: 52)
!5143 = !DILocation(line: 2559, column: 37, scope: !5128)
!5144 = !DILocation(line: 2559, column: 34, scope: !5128)
!5145 = !DILocation(line: 2559, column: 30, scope: !5128)
!5146 = !DILocation(line: 2559, column: 19, scope: !5128)
!5147 = !DILocation(line: 2559, column: 2, scope: !5128)
!5148 = !DILocation(line: 2559, column: 27, scope: !5128)
!5149 = !DILocation(line: 2560, column: 15, scope: !5128)
!5150 = !DILocation(line: 2560, column: 23, scope: !5128)
!5151 = !DILocation(line: 2560, column: 2, scope: !5128)
!5152 = !DILocation(line: 2561, column: 2, scope: !5128)
!5153 = !DILocation(line: 2562, column: 1, scope: !5128)
!5154 = distinct !DISubprogram(name: "apply_all_changed_light", linkageName: "_Z23apply_all_changed_lightv", scope: !16, file: !16, line: 2569, type: !1196, scopeLine: 2570, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!5155 = !DILocalVariable(name: "i", scope: !5154, file: !16, line: 2571, type: !9)
!5156 = !DILocation(line: 2571, column: 6, scope: !5154)
!5157 = !DILocalVariable(name: "j", scope: !5154, file: !16, line: 2571, type: !9)
!5158 = !DILocation(line: 2571, column: 8, scope: !5154)
!5159 = !DILocation(line: 2573, column: 8, scope: !5160)
!5160 = distinct !DILexicalBlock(scope: !5154, file: !16, line: 2573, column: 2)
!5161 = !DILocation(line: 2573, column: 7, scope: !5160)
!5162 = !DILocation(line: 2573, column: 12, scope: !5163)
!5163 = distinct !DILexicalBlock(scope: !5160, file: !16, line: 2573, column: 2)
!5164 = !DILocation(line: 2573, column: 15, scope: !5163)
!5165 = !DILocation(line: 2573, column: 13, scope: !5163)
!5166 = !DILocation(line: 2573, column: 2, scope: !5160)
!5167 = !DILocation(line: 2574, column: 9, scope: !5168)
!5168 = distinct !DILexicalBlock(scope: !5169, file: !16, line: 2574, column: 3)
!5169 = distinct !DILexicalBlock(scope: !5163, file: !16, line: 2573, column: 43)
!5170 = !DILocation(line: 2574, column: 8, scope: !5168)
!5171 = !DILocation(line: 2574, column: 13, scope: !5172)
!5172 = distinct !DILexicalBlock(scope: !5168, file: !16, line: 2574, column: 3)
!5173 = !DILocation(line: 2574, column: 14, scope: !5172)
!5174 = !DILocation(line: 2574, column: 3, scope: !5168)
!5175 = !DILocation(line: 2575, column: 25, scope: !5176)
!5176 = distinct !DILexicalBlock(scope: !5172, file: !16, line: 2575, column: 8)
!5177 = !DILocation(line: 2575, column: 8, scope: !5176)
!5178 = !DILocation(line: 2575, column: 36, scope: !5176)
!5179 = !DILocation(line: 2575, column: 33, scope: !5176)
!5180 = !DILocation(line: 2575, column: 28, scope: !5176)
!5181 = !DILocation(line: 2576, column: 18, scope: !5176)
!5182 = !DILocation(line: 2576, column: 21, scope: !5176)
!5183 = !DILocation(line: 2576, column: 5, scope: !5176)
!5184 = !DILocation(line: 2575, column: 37, scope: !5176)
!5185 = !DILocation(line: 2574, column: 39, scope: !5172)
!5186 = !DILocation(line: 2574, column: 3, scope: !5172)
!5187 = distinct !{!5187, !5174, !5188, !1517}
!5188 = !DILocation(line: 2576, column: 26, scope: !5168)
!5189 = !DILocation(line: 2577, column: 2, scope: !5169)
!5190 = !DILocation(line: 2573, column: 39, scope: !5163)
!5191 = !DILocation(line: 2573, column: 2, scope: !5163)
!5192 = distinct !{!5192, !5166, !5193, !1517}
!5193 = !DILocation(line: 2577, column: 2, scope: !5160)
!5194 = !DILocation(line: 2578, column: 1, scope: !5154)
!5195 = distinct !DISubprogram(name: "clear_light_subtracted", linkageName: "_Z22clear_light_subtractedv", scope: !16, file: !16, line: 2613, type: !1196, scopeLine: 2614, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!5196 = !DILocalVariable(name: "i", scope: !5195, file: !16, line: 2615, type: !9)
!5197 = !DILocation(line: 2615, column: 6, scope: !5195)
!5198 = !DILocation(line: 2617, column: 8, scope: !5199)
!5199 = distinct !DILexicalBlock(scope: !5195, file: !16, line: 2617, column: 2)
!5200 = !DILocation(line: 2617, column: 7, scope: !5199)
!5201 = !DILocation(line: 2617, column: 12, scope: !5202)
!5202 = distinct !DILexicalBlock(scope: !5199, file: !16, line: 2617, column: 2)
!5203 = !DILocation(line: 2617, column: 15, scope: !5202)
!5204 = !DILocation(line: 2617, column: 13, scope: !5202)
!5205 = !DILocation(line: 2617, column: 2, scope: !5199)
!5206 = !DILocation(line: 2618, column: 20, scope: !5202)
!5207 = !DILocation(line: 2618, column: 3, scope: !5202)
!5208 = !DILocation(line: 2618, column: 23, scope: !5202)
!5209 = !DILocation(line: 2617, column: 39, scope: !5202)
!5210 = !DILocation(line: 2617, column: 2, scope: !5202)
!5211 = distinct !{!5211, !5205, !5212, !1517}
!5212 = !DILocation(line: 2618, column: 25, scope: !5199)
!5213 = !DILocation(line: 2620, column: 1, scope: !5195)
!5214 = distinct !DISubprogram(name: "find_connected_distance_segments", linkageName: "_Z32find_connected_distance_segmentsiiii", scope: !16, file: !16, line: 2623, type: !5215, scopeLine: 2624, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!5215 = !DISubroutineType(types: !5216)
!5216 = !{!5, !9, !9, !9, !9}
!5217 = !DILocalVariable(name: "seg0", arg: 1, scope: !5214, file: !16, line: 2623, type: !9)
!5218 = !DILocation(line: 2623, column: 43, scope: !5214)
!5219 = !DILocalVariable(name: "seg1", arg: 2, scope: !5214, file: !16, line: 2623, type: !9)
!5220 = !DILocation(line: 2623, column: 53, scope: !5214)
!5221 = !DILocalVariable(name: "depth", arg: 3, scope: !5214, file: !16, line: 2623, type: !9)
!5222 = !DILocation(line: 2623, column: 63, scope: !5214)
!5223 = !DILocalVariable(name: "wid_flag", arg: 4, scope: !5214, file: !16, line: 2623, type: !9)
!5224 = !DILocation(line: 2623, column: 74, scope: !5214)
!5225 = !DILocalVariable(name: "p0", scope: !5214, file: !16, line: 2662, type: !1448)
!5226 = !DILocation(line: 2662, column: 13, scope: !5214)
!5227 = !DILocalVariable(name: "p1", scope: !5214, file: !16, line: 2662, type: !1448)
!5228 = !DILocation(line: 2662, column: 17, scope: !5214)
!5229 = !DILocation(line: 2664, column: 40, scope: !5214)
!5230 = !DILocation(line: 2664, column: 31, scope: !5214)
!5231 = !DILocation(line: 2664, column: 2, scope: !5214)
!5232 = !DILocation(line: 2665, column: 40, scope: !5214)
!5233 = !DILocation(line: 2665, column: 31, scope: !5214)
!5234 = !DILocation(line: 2665, column: 2, scope: !5214)
!5235 = !DILocation(line: 2667, column: 38, scope: !5214)
!5236 = !DILocation(line: 2667, column: 49, scope: !5214)
!5237 = !DILocation(line: 2667, column: 55, scope: !5214)
!5238 = !DILocation(line: 2667, column: 62, scope: !5214)
!5239 = !DILocation(line: 2667, column: 9, scope: !5214)
!5240 = !DILocation(line: 2667, column: 2, scope: !5214)
!5241 = distinct !DISubprogram(name: "ambient_mark_bfs", linkageName: "_Z16ambient_mark_bfsiPai", scope: !16, file: !16, line: 2675, type: !5242, scopeLine: 2676, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!5242 = !DISubroutineType(types: !5243)
!5243 = !{null, !9, !1621, !9}
!5244 = !DILocalVariable(name: "segnum", arg: 1, scope: !5241, file: !16, line: 2675, type: !9)
!5245 = !DILocation(line: 2675, column: 27, scope: !5241)
!5246 = !DILocalVariable(name: "marked_segs", arg: 2, scope: !5241, file: !16, line: 2675, type: !1621)
!5247 = !DILocation(line: 2675, column: 43, scope: !5241)
!5248 = !DILocalVariable(name: "depth", arg: 3, scope: !5241, file: !16, line: 2675, type: !9)
!5249 = !DILocation(line: 2675, column: 60, scope: !5241)
!5250 = !DILocalVariable(name: "i", scope: !5241, file: !16, line: 2677, type: !9)
!5251 = !DILocation(line: 2677, column: 6, scope: !5241)
!5252 = !DILocation(line: 2679, column: 6, scope: !5253)
!5253 = distinct !DILexicalBlock(scope: !5241, file: !16, line: 2679, column: 6)
!5254 = !DILocation(line: 2679, column: 12, scope: !5253)
!5255 = !DILocation(line: 2680, column: 3, scope: !5253)
!5256 = !DILocation(line: 2682, column: 2, scope: !5241)
!5257 = !DILocation(line: 2682, column: 14, scope: !5241)
!5258 = !DILocation(line: 2682, column: 22, scope: !5241)
!5259 = !DILocation(line: 2684, column: 8, scope: !5260)
!5260 = distinct !DILexicalBlock(scope: !5241, file: !16, line: 2684, column: 2)
!5261 = !DILocation(line: 2684, column: 7, scope: !5260)
!5262 = !DILocation(line: 2684, column: 12, scope: !5263)
!5263 = distinct !DILexicalBlock(scope: !5260, file: !16, line: 2684, column: 2)
!5264 = !DILocation(line: 2684, column: 13, scope: !5263)
!5265 = !DILocation(line: 2684, column: 2, scope: !5260)
!5266 = !DILocalVariable(name: "child", scope: !5267, file: !16, line: 2685, type: !9)
!5267 = distinct !DILexicalBlock(scope: !5263, file: !16, line: 2684, column: 42)
!5268 = !DILocation(line: 2685, column: 7, scope: !5267)
!5269 = !DILocation(line: 2685, column: 24, scope: !5267)
!5270 = !DILocation(line: 2685, column: 15, scope: !5267)
!5271 = !DILocation(line: 2685, column: 32, scope: !5267)
!5272 = !DILocation(line: 2685, column: 41, scope: !5267)
!5273 = !DILocation(line: 2687, column: 7, scope: !5274)
!5274 = distinct !DILexicalBlock(scope: !5267, file: !16, line: 2687, column: 7)
!5275 = !DILocation(line: 2687, column: 23, scope: !5274)
!5276 = !DILocation(line: 2687, column: 27, scope: !5274)
!5277 = !DILocation(line: 2687, column: 64, scope: !5274)
!5278 = !DILocation(line: 2687, column: 26, scope: !5274)
!5279 = !DILocation(line: 2687, column: 85, scope: !5274)
!5280 = !DILocation(line: 2687, column: 89, scope: !5274)
!5281 = !DILocation(line: 2687, column: 101, scope: !5274)
!5282 = !DILocation(line: 2688, column: 21, scope: !5274)
!5283 = !DILocation(line: 2688, column: 28, scope: !5274)
!5284 = !DILocation(line: 2688, column: 41, scope: !5274)
!5285 = !DILocation(line: 2688, column: 46, scope: !5274)
!5286 = !DILocation(line: 2688, column: 4, scope: !5274)
!5287 = !DILocation(line: 2689, column: 2, scope: !5267)
!5288 = !DILocation(line: 2684, column: 38, scope: !5263)
!5289 = !DILocation(line: 2684, column: 2, scope: !5263)
!5290 = distinct !{!5290, !5265, !5291, !1517}
!5291 = !DILocation(line: 2689, column: 2, scope: !5260)
!5292 = !DILocation(line: 2691, column: 1, scope: !5241)
!5293 = distinct !DISubprogram(name: "set_ambient_sound_flags_common", linkageName: "_Z30set_ambient_sound_flags_commonii", scope: !16, file: !16, line: 2696, type: !5294, scopeLine: 2697, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1488)
!5294 = !DISubroutineType(types: !5295)
!5295 = !{null, !9, !9}
!5296 = !DILocalVariable(name: "tmi_bit", arg: 1, scope: !5293, file: !16, line: 2696, type: !9)
!5297 = !DILocation(line: 2696, column: 41, scope: !5293)
!5298 = !DILocalVariable(name: "s2f_bit", arg: 2, scope: !5293, file: !16, line: 2696, type: !9)
!5299 = !DILocation(line: 2696, column: 54, scope: !5293)
!5300 = !DILocalVariable(name: "i", scope: !5293, file: !16, line: 2698, type: !9)
!5301 = !DILocation(line: 2698, column: 6, scope: !5293)
!5302 = !DILocalVariable(name: "j", scope: !5293, file: !16, line: 2698, type: !9)
!5303 = !DILocation(line: 2698, column: 9, scope: !5293)
!5304 = !DILocalVariable(name: "marked_segs", scope: !5293, file: !16, line: 2699, type: !2943)
!5305 = !DILocation(line: 2699, column: 9, scope: !5293)
!5306 = !DILocation(line: 2703, column: 8, scope: !5307)
!5307 = distinct !DILexicalBlock(scope: !5293, file: !16, line: 2703, column: 2)
!5308 = !DILocation(line: 2703, column: 7, scope: !5307)
!5309 = !DILocation(line: 2703, column: 12, scope: !5310)
!5310 = distinct !DILexicalBlock(scope: !5307, file: !16, line: 2703, column: 2)
!5311 = !DILocation(line: 2703, column: 15, scope: !5310)
!5312 = !DILocation(line: 2703, column: 13, scope: !5310)
!5313 = !DILocation(line: 2703, column: 2, scope: !5307)
!5314 = !DILocation(line: 2704, column: 15, scope: !5315)
!5315 = distinct !DILexicalBlock(scope: !5310, file: !16, line: 2703, column: 43)
!5316 = !DILocation(line: 2704, column: 3, scope: !5315)
!5317 = !DILocation(line: 2704, column: 18, scope: !5315)
!5318 = !DILocation(line: 2705, column: 29, scope: !5315)
!5319 = !DILocation(line: 2705, column: 28, scope: !5315)
!5320 = !DILocation(line: 2705, column: 13, scope: !5315)
!5321 = !DILocation(line: 2705, column: 3, scope: !5315)
!5322 = !DILocation(line: 2705, column: 16, scope: !5315)
!5323 = !DILocation(line: 2705, column: 25, scope: !5315)
!5324 = !DILocation(line: 2706, column: 2, scope: !5315)
!5325 = !DILocation(line: 2703, column: 39, scope: !5310)
!5326 = !DILocation(line: 2703, column: 2, scope: !5310)
!5327 = distinct !{!5327, !5313, !5328, !1517}
!5328 = !DILocation(line: 2706, column: 2, scope: !5307)
!5329 = !DILocation(line: 2709, column: 8, scope: !5330)
!5330 = distinct !DILexicalBlock(scope: !5293, file: !16, line: 2709, column: 2)
!5331 = !DILocation(line: 2709, column: 7, scope: !5330)
!5332 = !DILocation(line: 2709, column: 12, scope: !5333)
!5333 = distinct !DILexicalBlock(scope: !5330, file: !16, line: 2709, column: 2)
!5334 = !DILocation(line: 2709, column: 15, scope: !5333)
!5335 = !DILocation(line: 2709, column: 13, scope: !5333)
!5336 = !DILocation(line: 2709, column: 2, scope: !5330)
!5337 = !DILocalVariable(name: "segp", scope: !5338, file: !16, line: 2710, type: !1455)
!5338 = distinct !DILexicalBlock(scope: !5333, file: !16, line: 2709, column: 43)
!5339 = !DILocation(line: 2710, column: 12, scope: !5338)
!5340 = !DILocation(line: 2710, column: 29, scope: !5338)
!5341 = !DILocation(line: 2710, column: 20, scope: !5338)
!5342 = !DILocalVariable(name: "seg2p", scope: !5338, file: !16, line: 2711, type: !4801)
!5343 = !DILocation(line: 2711, column: 13, scope: !5338)
!5344 = !DILocation(line: 2711, column: 32, scope: !5338)
!5345 = !DILocation(line: 2711, column: 22, scope: !5338)
!5346 = !DILocation(line: 2713, column: 9, scope: !5347)
!5347 = distinct !DILexicalBlock(scope: !5338, file: !16, line: 2713, column: 3)
!5348 = !DILocation(line: 2713, column: 8, scope: !5347)
!5349 = !DILocation(line: 2713, column: 13, scope: !5350)
!5350 = distinct !DILexicalBlock(scope: !5347, file: !16, line: 2713, column: 3)
!5351 = !DILocation(line: 2713, column: 14, scope: !5350)
!5352 = !DILocation(line: 2713, column: 3, scope: !5347)
!5353 = !DILocalVariable(name: "sidep", scope: !5354, file: !16, line: 2714, type: !1594)
!5354 = distinct !DILexicalBlock(scope: !5350, file: !16, line: 2713, column: 43)
!5355 = !DILocation(line: 2714, column: 10, scope: !5354)
!5356 = !DILocation(line: 2714, column: 19, scope: !5354)
!5357 = !DILocation(line: 2714, column: 25, scope: !5354)
!5358 = !DILocation(line: 2714, column: 31, scope: !5354)
!5359 = !DILocation(line: 2716, column: 18, scope: !5360)
!5360 = distinct !DILexicalBlock(scope: !5354, file: !16, line: 2716, column: 8)
!5361 = !DILocation(line: 2716, column: 25, scope: !5360)
!5362 = !DILocation(line: 2716, column: 9, scope: !5360)
!5363 = !DILocation(line: 2716, column: 35, scope: !5360)
!5364 = !DILocation(line: 2716, column: 43, scope: !5360)
!5365 = !DILocation(line: 2716, column: 41, scope: !5360)
!5366 = !DILocation(line: 2716, column: 8, scope: !5360)
!5367 = !DILocation(line: 2716, column: 52, scope: !5360)
!5368 = !DILocation(line: 2716, column: 65, scope: !5360)
!5369 = !DILocation(line: 2716, column: 72, scope: !5360)
!5370 = !DILocation(line: 2716, column: 82, scope: !5360)
!5371 = !DILocation(line: 2716, column: 56, scope: !5360)
!5372 = !DILocation(line: 2716, column: 92, scope: !5360)
!5373 = !DILocation(line: 2716, column: 100, scope: !5360)
!5374 = !DILocation(line: 2716, column: 98, scope: !5360)
!5375 = !DILocation(line: 2716, column: 55, scope: !5360)
!5376 = !DILocation(line: 2717, column: 10, scope: !5377)
!5377 = distinct !DILexicalBlock(scope: !5378, file: !16, line: 2717, column: 9)
!5378 = distinct !DILexicalBlock(scope: !5360, file: !16, line: 2716, column: 110)
!5379 = !DILocation(line: 2717, column: 38, scope: !5377)
!5380 = !DILocation(line: 2717, column: 42, scope: !5377)
!5381 = !DILocation(line: 2717, column: 49, scope: !5377)
!5382 = !DILocation(line: 2717, column: 58, scope: !5377)
!5383 = !DILocation(line: 2718, column: 25, scope: !5384)
!5384 = distinct !DILexicalBlock(scope: !5377, file: !16, line: 2717, column: 66)
!5385 = !DILocation(line: 2718, column: 6, scope: !5384)
!5386 = !DILocation(line: 2718, column: 13, scope: !5384)
!5387 = !DILocation(line: 2718, column: 22, scope: !5384)
!5388 = !DILocation(line: 2719, column: 18, scope: !5384)
!5389 = !DILocation(line: 2719, column: 6, scope: !5384)
!5390 = !DILocation(line: 2719, column: 21, scope: !5384)
!5391 = !DILocation(line: 2720, column: 5, scope: !5384)
!5392 = !DILocation(line: 2721, column: 4, scope: !5378)
!5393 = !DILocation(line: 2723, column: 3, scope: !5354)
!5394 = !DILocation(line: 2713, column: 39, scope: !5350)
!5395 = !DILocation(line: 2713, column: 3, scope: !5350)
!5396 = distinct !{!5396, !5352, !5397, !1517}
!5397 = !DILocation(line: 2723, column: 3, scope: !5347)
!5398 = !DILocation(line: 2725, column: 2, scope: !5338)
!5399 = !DILocation(line: 2709, column: 39, scope: !5333)
!5400 = !DILocation(line: 2709, column: 2, scope: !5333)
!5401 = distinct !{!5401, !5336, !5402, !1517}
!5402 = !DILocation(line: 2725, column: 2, scope: !5330)
!5403 = !DILocation(line: 2728, column: 8, scope: !5404)
!5404 = distinct !DILexicalBlock(scope: !5293, file: !16, line: 2728, column: 2)
!5405 = !DILocation(line: 2728, column: 7, scope: !5404)
!5406 = !DILocation(line: 2728, column: 12, scope: !5407)
!5407 = distinct !DILexicalBlock(scope: !5404, file: !16, line: 2728, column: 2)
!5408 = !DILocation(line: 2728, column: 15, scope: !5407)
!5409 = !DILocation(line: 2728, column: 13, scope: !5407)
!5410 = !DILocation(line: 2728, column: 2, scope: !5404)
!5411 = !DILocalVariable(name: "seg2p", scope: !5412, file: !16, line: 2729, type: !4801)
!5412 = distinct !DILexicalBlock(scope: !5407, file: !16, line: 2728, column: 43)
!5413 = !DILocation(line: 2729, column: 13, scope: !5412)
!5414 = !DILocation(line: 2729, column: 32, scope: !5412)
!5415 = !DILocation(line: 2729, column: 22, scope: !5412)
!5416 = !DILocation(line: 2731, column: 7, scope: !5417)
!5417 = distinct !DILexicalBlock(scope: !5412, file: !16, line: 2731, column: 7)
!5418 = !DILocation(line: 2731, column: 14, scope: !5417)
!5419 = !DILocation(line: 2731, column: 25, scope: !5417)
!5420 = !DILocation(line: 2731, column: 23, scope: !5417)
!5421 = !DILocation(line: 2732, column: 21, scope: !5417)
!5422 = !DILocation(line: 2732, column: 24, scope: !5417)
!5423 = !DILocation(line: 2732, column: 4, scope: !5417)
!5424 = !DILocation(line: 2733, column: 2, scope: !5412)
!5425 = !DILocation(line: 2728, column: 39, scope: !5407)
!5426 = !DILocation(line: 2728, column: 2, scope: !5407)
!5427 = distinct !{!5427, !5410, !5428, !1517}
!5428 = !DILocation(line: 2733, column: 2, scope: !5404)
!5429 = !DILocation(line: 2736, column: 8, scope: !5430)
!5430 = distinct !DILexicalBlock(scope: !5293, file: !16, line: 2736, column: 2)
!5431 = !DILocation(line: 2736, column: 7, scope: !5430)
!5432 = !DILocation(line: 2736, column: 12, scope: !5433)
!5433 = distinct !DILexicalBlock(scope: !5430, file: !16, line: 2736, column: 2)
!5434 = !DILocation(line: 2736, column: 15, scope: !5433)
!5435 = !DILocation(line: 2736, column: 13, scope: !5433)
!5436 = !DILocation(line: 2736, column: 2, scope: !5430)
!5437 = !DILocation(line: 2737, column: 19, scope: !5438)
!5438 = distinct !DILexicalBlock(scope: !5433, file: !16, line: 2737, column: 7)
!5439 = !DILocation(line: 2737, column: 7, scope: !5438)
!5440 = !DILocation(line: 2738, column: 29, scope: !5438)
!5441 = !DILocation(line: 2738, column: 14, scope: !5438)
!5442 = !DILocation(line: 2738, column: 4, scope: !5438)
!5443 = !DILocation(line: 2738, column: 17, scope: !5438)
!5444 = !DILocation(line: 2738, column: 26, scope: !5438)
!5445 = !DILocation(line: 2737, column: 20, scope: !5438)
!5446 = !DILocation(line: 2736, column: 39, scope: !5433)
!5447 = !DILocation(line: 2736, column: 2, scope: !5433)
!5448 = distinct !{!5448, !5436, !5449, !1517}
!5449 = !DILocation(line: 2738, column: 29, scope: !5430)
!5450 = !DILocation(line: 2740, column: 1, scope: !5293)
!5451 = distinct !DISubprogram(name: "set_ambient_sound_flags", linkageName: "_Z23set_ambient_sound_flagsv", scope: !16, file: !16, line: 2747, type: !1196, scopeLine: 2748, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2)
!5452 = !DILocation(line: 2749, column: 2, scope: !5451)
!5453 = !DILocation(line: 2750, column: 2, scope: !5451)
!5454 = !DILocation(line: 2751, column: 1, scope: !5451)
!5455 = distinct !DISubprogram(name: "min<int, std::__1::__less<void, void> >", linkageName: "_ZNSt3__13minB8ne200100IiNS_6__lessIvvEEEERKT_S5_S5_T0_", scope: !183, file: !2074, line: 29, type: !5456, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, templateParams: !5463, retainedNodes: !1488)
!5456 = !DISubroutineType(types: !5457)
!5457 = !{!2077, !2077, !2077, !5458}
!5458 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__less<void, void>", scope: !183, file: !5459, line: 38, size: 8, flags: DIFlagTypePassByValue, elements: !1488, templateParams: !5460, identifier: "_ZTSNSt3__16__lessIvvEE")
!5459 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__algorithm/comp.h", directory: "")
!5460 = !{!5461, !5462}
!5461 = !DITemplateTypeParameter(name: "_T1", type: null, defaulted: true)
!5462 = !DITemplateTypeParameter(name: "_T2", type: null, defaulted: true)
!5463 = !{!2079, !5464}
!5464 = !DITemplateTypeParameter(name: "_Compare", type: !5458)
!5465 = !DILocalVariable(name: "__a", arg: 1, scope: !5455, file: !2074, line: 29, type: !2077)
!5466 = !DILocation(line: 29, column: 38, scope: !5455)
!5467 = !DILocalVariable(name: "__b", arg: 2, scope: !5455, file: !2074, line: 29, type: !2077)
!5468 = !DILocation(line: 29, column: 76, scope: !5455)
!5469 = !DILocalVariable(name: "__comp", arg: 3, scope: !5455, file: !2074, line: 29, type: !5458)
!5470 = !DILocation(line: 29, column: 90, scope: !5455)
!5471 = !DILocation(line: 30, column: 17, scope: !5455)
!5472 = !DILocation(line: 30, column: 22, scope: !5455)
!5473 = !DILocation(line: 30, column: 10, scope: !5455)
!5474 = !DILocation(line: 30, column: 29, scope: !5455)
!5475 = !DILocation(line: 30, column: 35, scope: !5455)
!5476 = !DILocation(line: 30, column: 3, scope: !5455)
!5477 = distinct !DISubprogram(name: "operator()<int, int>", linkageName: "_ZNKSt3__16__lessIvvEclB8ne200100IiiEEbRKT_RKT0_", scope: !5458, file: !5459, line: 40, type: !5478, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, templateParams: !5483, declaration: !5482, retainedNodes: !1488)
!5478 = !DISubroutineType(types: !5479)
!5479 = !{!742, !5480, !2077, !2077}
!5480 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5481, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!5481 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !5458)
!5482 = !DISubprogram(name: "operator()<int, int>", linkageName: "_ZNKSt3__16__lessIvvEclB8ne200100IiiEEbRKT_RKT0_", scope: !5458, file: !5459, line: 40, type: !5478, scopeLine: 40, flags: DIFlagPrototyped, spFlags: 0, templateParams: !5483)
!5483 = !{!2079, !5484}
!5484 = !DITemplateTypeParameter(name: "_Up", type: !9)
!5485 = !DILocalVariable(name: "this", arg: 1, scope: !5477, type: !5486, flags: DIFlagArtificial | DIFlagObjectPointer)
!5486 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5481, size: 64)
!5487 = !DILocation(line: 0, scope: !5477)
!5488 = !DILocalVariable(name: "__lhs", arg: 2, scope: !5477, file: !5459, line: 40, type: !2077)
!5489 = !DILocation(line: 40, column: 82, scope: !5477)
!5490 = !DILocalVariable(name: "__rhs", arg: 3, scope: !5477, file: !5459, line: 40, type: !2077)
!5491 = !DILocation(line: 40, column: 100, scope: !5477)
!5492 = !DILocation(line: 41, column: 12, scope: !5477)
!5493 = !DILocation(line: 41, column: 20, scope: !5477)
!5494 = !DILocation(line: 41, column: 18, scope: !5477)
!5495 = !DILocation(line: 41, column: 5, scope: !5477)
