; ModuleID = '/Users/richard/code/ChocolateDescent/main_d2/lighting.cpp'
source_filename = "/Users/richard/code/ChocolateDescent/main_d2/lighting.cpp"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

%struct.object = type { i32, i8, i8, i16, i16, i8, i8, i8, i8, i16, i16, %struct.vms_vector, %struct.vms_matrix, i32, i32, %struct.vms_vector, i8, i8, i8, i8, i32, %union.anon, %union.anon.0, %union.anon.1 }
%struct.vms_matrix = type { %struct.vms_vector, %struct.vms_vector, %struct.vms_vector }
%struct.vms_vector = type { i32, i32, i32 }
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
%struct.muzzle_info = type { i32, i16, %struct.vms_vector }
%struct.vclip = type { i32, i32, i32, i32, i16, [30 x %struct.bitmap_index], i32 }
%struct.bitmap_index = type { i16 }
%struct.robot_info = type { i32, [8 x %struct.vms_vector], [8 x i8], i16, i16, i16, i16, i8, i8, i8, i8, i8, i8, i8, i8, i16, i8, i8, i32, i32, i32, i32, [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i32], [5 x i8], [5 x i8], i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, [3 x i8], i8, i8, i8, i8, [9 x [5 x %struct.jointlist]], i32 }
%struct.jointlist = type { i16, i16 }
%struct.weapon_info = type { i8, i8, i16, i16, i8, i8, i16, i8, i8, i16, i8, i8, i16, i8, i8, i8, i8, i8, i8, i8, i8, i8, i32, i32, i32, %struct.bitmap_index, i32, i32, i32, [5 x i32], [5 x i32], i32, i32, i32, i32, i32, i32, i32, %struct.bitmap_index, %struct.bitmap_index }
%struct.powerup_type_info = type { i32, i32, i32, i32 }
%struct.segment2 = type { i8, i8, i8, i8, i32 }
%struct.fvi_query = type { ptr, ptr, i32, i32, i16, ptr, i32 }
%struct.fvi_info = type { i32, %struct.vms_vector, i32, i32, i32, i32, %struct.vms_vector, i32, [100 x i32] }
%struct.light_info_s = type { i32 }
%"struct.std::__1::__less" = type { i8 }
%struct.g3s_point = type { %struct.vms_vector, i32, i32, i32, i32, i32, i8, i8, i16 }

@Do_dynamic_light = global i32 1, align 4, !dbg !0
@Dynamic_light = global [3600 x i32] zeroinitializer, align 4, !dbg !22
@Lighting_frame_delta = global i32 1, align 4, !dbg !28
@Lighting_cache = global [4096 x i32] zeroinitializer, align 4, !dbg !30
@Cache_hits = global i32 0, align 4, !dbg !35
@Cache_lookups = global i32 1, align 4, !dbg !37
@FrameCount = external global i32, align 4
@Objects = external global [0 x %struct.object], align 4
@Segments = external global [0 x %struct.segment], align 4
@Vertices = external global [0 x %struct.vms_vector], align 4
@CurrentLogicVersion = external global i32, align 4
@Players = external global [12 x %struct.player], align 4
@Player_num = external global i32, align 4
@Game_mode = external global i32, align 4
@Muzzle_data = external global [8 x %struct.muzzle_info], align 4
@Obj_light_xlate = global [16 x i32] [i32 4660, i32 13089, i32 9320, i32 5941, i32 291, i32 6575, i32 16131, i32 9002, i32 8483, i32 14767, i32 3843, i32 4906, i32 12579, i32 10671, i32 7939, i32 810], align 4, !dbg !39
@Lighting_objects = global [350 x i8] zeroinitializer, align 1, !dbg !44
@Headlights = global [8 x ptr] zeroinitializer, align 8, !dbg !52
@Num_headlights = global i32 0, align 4, !dbg !203
@GameTime = external global i32, align 4
@Vclip = external global [110 x %struct.vclip], align 4
@Robot_info = external global [0 x %struct.robot_info], align 4
@Weapon_info = external global [0 x %struct.weapon_info], align 4
@Powerup_info = external global [50 x %struct.powerup_type_info], align 4
@Highest_vertex_index = external global i32, align 4
@N_render_segs = external global i32, align 4
@Render_list = external global [500 x i16], align 2
@.str = private unnamed_addr constant [48 x i8] c"vertnum >= 0 && vertnum <= Highest_vertex_index\00", align 1, !dbg !205
@.str.1 = private unnamed_addr constant [58 x i8] c"/Users/richard/code/ChocolateDescent/main_d2/lighting.cpp\00", align 1, !dbg !212
@.str.2 = private unnamed_addr constant [72 x i8] c"render_vertices[vv] >= 0 && render_vertices[vv] <= Highest_vertex_index\00", align 1, !dbg !217
@Highest_object_index = external global i32, align 4
@Beam_brightness = global i32 32768, align 4, !dbg !222
@object_light = global [350 x i32] zeroinitializer, align 4, !dbg !224
@object_sig = global [350 x i32] zeroinitializer, align 4, !dbg !227
@old_viewer = global ptr null, align 8, !dbg !230
@reset_lighting_hack = global i32 0, align 4, !dbg !232
@Segment2s = external global [0 x %struct.segment2], align 4
@FrameTime = external global i32, align 4
@Viewer = external global ptr, align 8

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z22lighting_cache_visibleiiiP10vms_vectoriS0_(i32 noundef %0, i32 noundef %1, i32 noundef %2, ptr noundef %3, i32 noundef %4, ptr noundef %5) #0 !dbg !1487 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca %struct.fvi_query, align 8
  %19 = alloca %struct.fvi_info, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  store i32 %0, ptr %8, align 4
    #dbg_declare(ptr %8, !1492, !DIExpression(), !1493)
  store i32 %1, ptr %9, align 4
    #dbg_declare(ptr %9, !1494, !DIExpression(), !1495)
  store i32 %2, ptr %10, align 4
    #dbg_declare(ptr %10, !1496, !DIExpression(), !1497)
  store ptr %3, ptr %11, align 8
    #dbg_declare(ptr %11, !1498, !DIExpression(), !1499)
  store i32 %4, ptr %12, align 4
    #dbg_declare(ptr %12, !1500, !DIExpression(), !1501)
  store ptr %5, ptr %13, align 8
    #dbg_declare(ptr %13, !1502, !DIExpression(), !1503)
    #dbg_declare(ptr %14, !1504, !DIExpression(), !1505)
    #dbg_declare(ptr %15, !1506, !DIExpression(), !1507)
    #dbg_declare(ptr %16, !1508, !DIExpression(), !1509)
  %23 = load i32, ptr %9, align 4, !dbg !1510
  %24 = shl i32 %23, 8, !dbg !1511
  %25 = load i32, ptr %8, align 4, !dbg !1512
  %26 = xor i32 %24, %25, !dbg !1513
  %27 = and i32 %26, 4095, !dbg !1514
  %28 = sext i32 %27 to i64, !dbg !1515
  %29 = getelementptr inbounds [4096 x i32], ptr @Lighting_cache, i64 0, i64 %28, !dbg !1515
  %30 = load i32, ptr %29, align 4, !dbg !1515
  store i32 %30, ptr %14, align 4, !dbg !1516
  %31 = load i32, ptr %14, align 4, !dbg !1517
  %32 = ashr i32 %31, 1, !dbg !1518
  store i32 %32, ptr %15, align 4, !dbg !1519
  %33 = load i32, ptr %14, align 4, !dbg !1520
  %34 = and i32 %33, 1, !dbg !1521
  store i32 %34, ptr %16, align 4, !dbg !1522
  %35 = load i32, ptr @Cache_lookups, align 4, !dbg !1523
  %36 = add nsw i32 %35, 1, !dbg !1523
  store i32 %36, ptr @Cache_lookups, align 4, !dbg !1523
  %37 = load i32, ptr %15, align 4, !dbg !1524
  %38 = icmp eq i32 %37, 0, !dbg !1526
  br i1 %38, label %45, label %39, !dbg !1527

39:                                               ; preds = %6
  %40 = load i32, ptr %15, align 4, !dbg !1528
  %41 = load i32, ptr @Lighting_frame_delta, align 4, !dbg !1529
  %42 = add nsw i32 %40, %41, !dbg !1530
  %43 = load i32, ptr @FrameCount, align 4, !dbg !1531
  %44 = icmp sle i32 %42, %43, !dbg !1532
  br i1 %44, label %45, label %98, !dbg !1527

45:                                               ; preds = %39, %6
    #dbg_declare(ptr %17, !1533, !DIExpression(), !1535)
  store i32 0, ptr %17, align 4, !dbg !1535
    #dbg_declare(ptr %18, !1536, !DIExpression(), !1548)
    #dbg_declare(ptr %19, !1549, !DIExpression(), !1565)
    #dbg_declare(ptr %20, !1566, !DIExpression(), !1567)
    #dbg_declare(ptr %21, !1568, !DIExpression(), !1569)
  %46 = load ptr, ptr %11, align 8, !dbg !1570
  %47 = load i32, ptr %12, align 4, !dbg !1571
  %48 = call noundef i32 @_Z14find_point_segP10vms_vectori(ptr noundef %46, i32 noundef %47), !dbg !1572
  store i32 %48, ptr %20, align 4, !dbg !1573
  %49 = load i32, ptr %20, align 4, !dbg !1574
  %50 = icmp eq i32 %49, -1, !dbg !1576
  br i1 %50, label %51, label %52, !dbg !1576

51:                                               ; preds = %45
  call void @_Z4Int3v(), !dbg !1577
  store i32 0, ptr %7, align 4, !dbg !1579
  br label %102, !dbg !1579

52:                                               ; preds = %45
  %53 = load ptr, ptr %11, align 8, !dbg !1580
  %54 = getelementptr inbounds nuw %struct.fvi_query, ptr %18, i32 0, i32 0, !dbg !1581
  store ptr %53, ptr %54, align 8, !dbg !1582
  %55 = load i32, ptr %12, align 4, !dbg !1583
  %56 = getelementptr inbounds nuw %struct.fvi_query, ptr %18, i32 0, i32 2, !dbg !1584
  store i32 %55, ptr %56, align 8, !dbg !1585
  %57 = load ptr, ptr %13, align 8, !dbg !1586
  %58 = getelementptr inbounds nuw %struct.fvi_query, ptr %18, i32 0, i32 1, !dbg !1587
  store ptr %57, ptr %58, align 8, !dbg !1588
  %59 = getelementptr inbounds nuw %struct.fvi_query, ptr %18, i32 0, i32 3, !dbg !1589
  store i32 0, ptr %59, align 4, !dbg !1590
  %60 = load i32, ptr %10, align 4, !dbg !1591
  %61 = trunc i32 %60 to i16, !dbg !1591
  %62 = getelementptr inbounds nuw %struct.fvi_query, ptr %18, i32 0, i32 4, !dbg !1592
  store i16 %61, ptr %62, align 8, !dbg !1593
  %63 = getelementptr inbounds nuw %struct.fvi_query, ptr %18, i32 0, i32 5, !dbg !1594
  store ptr null, ptr %63, align 8, !dbg !1595
  %64 = getelementptr inbounds nuw %struct.fvi_query, ptr %18, i32 0, i32 6, !dbg !1596
  store i32 2, ptr %64, align 8, !dbg !1597
  %65 = call noundef i32 @_Z24find_vector_intersectionP9fvi_queryP8fvi_info(ptr noundef %18, ptr noundef %19), !dbg !1598
  store i32 %65, ptr %21, align 4, !dbg !1599
  %66 = load i32, ptr %21, align 4, !dbg !1600
  %67 = icmp eq i32 %66, 2, !dbg !1602
  br i1 %67, label %68, label %69, !dbg !1602

68:                                               ; preds = %52
  call void @_Z4Int3v(), !dbg !1603
  br label %69, !dbg !1603

69:                                               ; preds = %68, %52
  %70 = load i32, ptr %21, align 4, !dbg !1604
  %71 = icmp eq i32 %70, 0, !dbg !1606
  br i1 %71, label %72, label %73, !dbg !1606

72:                                               ; preds = %69
  store i32 1, ptr %17, align 4, !dbg !1607
  br label %85, !dbg !1608

73:                                               ; preds = %69
  %74 = load i32, ptr %21, align 4, !dbg !1609
  %75 = icmp eq i32 %74, 1, !dbg !1611
  br i1 %75, label %76, label %84, !dbg !1611

76:                                               ; preds = %73
    #dbg_declare(ptr %22, !1612, !DIExpression(), !1614)
  %77 = getelementptr inbounds nuw %struct.fvi_info, ptr %19, i32 0, i32 1, !dbg !1615
  %78 = load ptr, ptr %11, align 8, !dbg !1616
  %79 = call noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef %77, ptr noundef %78), !dbg !1617
  store i32 %79, ptr %22, align 4, !dbg !1618
  %80 = load i32, ptr %22, align 4, !dbg !1619
  %81 = icmp slt i32 %80, 16384, !dbg !1621
  br i1 %81, label %82, label %83, !dbg !1621

82:                                               ; preds = %76
  store i32 1, ptr %17, align 4, !dbg !1622
  br label %83, !dbg !1624

83:                                               ; preds = %82, %76
  br label %84, !dbg !1625

84:                                               ; preds = %83, %73
  br label %85

85:                                               ; preds = %84, %72
  %86 = load i32, ptr %17, align 4, !dbg !1626
  %87 = load i32, ptr @FrameCount, align 4, !dbg !1627
  %88 = shl i32 %87, 1, !dbg !1628
  %89 = add nsw i32 %86, %88, !dbg !1629
  %90 = load i32, ptr %20, align 4, !dbg !1630
  %91 = shl i32 %90, 8, !dbg !1631
  %92 = load i32, ptr %8, align 4, !dbg !1632
  %93 = xor i32 %91, %92, !dbg !1633
  %94 = and i32 %93, 4095, !dbg !1634
  %95 = sext i32 %94 to i64, !dbg !1635
  %96 = getelementptr inbounds [4096 x i32], ptr @Lighting_cache, i64 0, i64 %95, !dbg !1635
  store i32 %89, ptr %96, align 4, !dbg !1636
  %97 = load i32, ptr %17, align 4, !dbg !1637
  store i32 %97, ptr %7, align 4, !dbg !1638
  br label %102, !dbg !1638

98:                                               ; preds = %39
  %99 = load i32, ptr @Cache_hits, align 4, !dbg !1639
  %100 = add nsw i32 %99, 1, !dbg !1639
  store i32 %100, ptr @Cache_hits, align 4, !dbg !1639
  %101 = load i32, ptr %16, align 4, !dbg !1641
  store i32 %101, ptr %7, align 4, !dbg !1642
  br label %102, !dbg !1642

102:                                              ; preds = %98, %85, %51
  %103 = load i32, ptr %7, align 4, !dbg !1643
  ret i32 %103, !dbg !1643
}

declare noundef i32 @_Z14find_point_segP10vms_vectori(ptr noundef, i32 noundef) #1

declare void @_Z4Int3v() #1

declare noundef i32 @_Z24find_vector_intersectionP9fvi_queryP8fvi_info(ptr noundef, ptr noundef) #1

declare noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef, ptr noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z11apply_lightiiP10vms_vectoriPsi(i32 noundef %0, i32 noundef %1, ptr noundef %2, i32 noundef %3, ptr noundef %4, i32 noundef %5) #0 !dbg !1644 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca ptr, align 8
  %16 = alloca i32, align 4
  %17 = alloca ptr, align 8
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca %struct.vms_vector, align 4
  %22 = alloca %struct.fvi_query, align 8
  %23 = alloca %struct.fvi_info, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca ptr, align 8
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca %struct.vms_vector, align 4
  %31 = alloca i32, align 4
  %32 = alloca ptr, align 8
  %33 = alloca i32, align 4
  store i32 %0, ptr %7, align 4
    #dbg_declare(ptr %7, !1648, !DIExpression(), !1649)
  store i32 %1, ptr %8, align 4
    #dbg_declare(ptr %8, !1650, !DIExpression(), !1651)
  store ptr %2, ptr %9, align 8
    #dbg_declare(ptr %9, !1652, !DIExpression(), !1653)
  store i32 %3, ptr %10, align 4
    #dbg_declare(ptr %10, !1654, !DIExpression(), !1655)
  store ptr %4, ptr %11, align 8
    #dbg_declare(ptr %11, !1656, !DIExpression(), !1657)
  store i32 %5, ptr %12, align 4
    #dbg_declare(ptr %12, !1658, !DIExpression(), !1659)
    #dbg_declare(ptr %13, !1660, !DIExpression(), !1661)
  %34 = load i32, ptr %7, align 4, !dbg !1662
  %35 = icmp ne i32 %34, 0, !dbg !1662
  br i1 %35, label %36, label %341, !dbg !1662

36:                                               ; preds = %6
    #dbg_declare(ptr %14, !1664, !DIExpression(), !1666)
  %37 = load i32, ptr %7, align 4, !dbg !1667
  %38 = mul nsw i32 %37, 64, !dbg !1668
  store i32 %38, ptr %14, align 4, !dbg !1666
  %39 = load i32, ptr %14, align 4, !dbg !1669
  %40 = call i32 @llvm.abs.i32(i32 %39, i1 true), !dbg !1671
  %41 = icmp sle i32 %40, 524288, !dbg !1672
  br i1 %41, label %50, label %42, !dbg !1673

42:                                               ; preds = %36
  %43 = load i32, ptr %12, align 4, !dbg !1674
  %44 = sext i32 %43 to i64, !dbg !1675
  %45 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %44, !dbg !1675
  %46 = getelementptr inbounds nuw %struct.object, ptr %45, i32 0, i32 1, !dbg !1676
  %47 = load i8, ptr %46, align 4, !dbg !1676
  %48 = zext i8 %47 to i32, !dbg !1675
  %49 = icmp eq i32 %48, 15, !dbg !1677
  br i1 %49, label %50, label %106, !dbg !1673

50:                                               ; preds = %42, %36
    #dbg_declare(ptr %15, !1678, !DIExpression(), !1680)
  %51 = load i32, ptr %8, align 4, !dbg !1681
  %52 = sext i32 %51 to i64, !dbg !1682
  %53 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %52, !dbg !1682
  %54 = getelementptr inbounds nuw %struct.segment, ptr %53, i32 0, i32 2, !dbg !1683
  %55 = getelementptr inbounds [8 x i16], ptr %54, i64 0, i64 0, !dbg !1682
  store ptr %55, ptr %15, align 8, !dbg !1680
  store i32 0, ptr %13, align 4, !dbg !1684
  br label %56, !dbg !1686

56:                                               ; preds = %102, %50
  %57 = load i32, ptr %13, align 4, !dbg !1687
  %58 = icmp slt i32 %57, 8, !dbg !1689
  br i1 %58, label %59, label %105, !dbg !1690

59:                                               ; preds = %56
    #dbg_declare(ptr %16, !1691, !DIExpression(), !1693)
    #dbg_declare(ptr %17, !1694, !DIExpression(), !1695)
    #dbg_declare(ptr %18, !1696, !DIExpression(), !1697)
  %60 = load ptr, ptr %15, align 8, !dbg !1698
  %61 = load i32, ptr %13, align 4, !dbg !1699
  %62 = sext i32 %61 to i64, !dbg !1698
  %63 = getelementptr inbounds i16, ptr %60, i64 %62, !dbg !1698
  %64 = load i16, ptr %63, align 2, !dbg !1698
  %65 = sext i16 %64 to i32, !dbg !1698
  store i32 %65, ptr %16, align 4, !dbg !1700
  %66 = load i32, ptr %16, align 4, !dbg !1701
  %67 = load i32, ptr @FrameCount, align 4, !dbg !1703
  %68 = xor i32 %66, %67, !dbg !1704
  %69 = and i32 %68, 1, !dbg !1705
  %70 = icmp ne i32 %69, 0, !dbg !1706
  br i1 %70, label %71, label %101, !dbg !1706

71:                                               ; preds = %59
  %72 = load i32, ptr %16, align 4, !dbg !1707
  %73 = sext i32 %72 to i64, !dbg !1709
  %74 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %73, !dbg !1709
  store ptr %74, ptr %17, align 8, !dbg !1710
  %75 = load ptr, ptr %9, align 8, !dbg !1711
  %76 = load ptr, ptr %17, align 8, !dbg !1712
  %77 = call noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef %75, ptr noundef %76), !dbg !1713
  store i32 %77, ptr %18, align 4, !dbg !1714
  %78 = load i32, ptr %18, align 4, !dbg !1715
  %79 = sdiv i32 %78, 4, !dbg !1716
  %80 = load i32, ptr %18, align 4, !dbg !1717
  %81 = sdiv i32 %80, 4, !dbg !1718
  %82 = call noundef i32 @_Z6fixmulii(i32 noundef %79, i32 noundef %81), !dbg !1719
  store i32 %82, ptr %18, align 4, !dbg !1720
  %83 = load i32, ptr %18, align 4, !dbg !1721
  %84 = load i32, ptr %14, align 4, !dbg !1723
  %85 = call i32 @llvm.abs.i32(i32 %84, i1 true), !dbg !1724
  %86 = icmp slt i32 %83, %85, !dbg !1725
  br i1 %86, label %87, label %100, !dbg !1725

87:                                               ; preds = %71
  %88 = load i32, ptr %18, align 4, !dbg !1726
  %89 = icmp slt i32 %88, 262144, !dbg !1729
  br i1 %89, label %90, label %91, !dbg !1729

90:                                               ; preds = %87
  store i32 262144, ptr %18, align 4, !dbg !1730
  br label %91, !dbg !1731

91:                                               ; preds = %90, %87
  %92 = load i32, ptr %7, align 4, !dbg !1732
  %93 = load i32, ptr %18, align 4, !dbg !1733
  %94 = call noundef i32 @_Z6fixdivii(i32 noundef %92, i32 noundef %93), !dbg !1734
  %95 = load i32, ptr %16, align 4, !dbg !1735
  %96 = sext i32 %95 to i64, !dbg !1736
  %97 = getelementptr inbounds [3600 x i32], ptr @Dynamic_light, i64 0, i64 %96, !dbg !1736
  %98 = load i32, ptr %97, align 4, !dbg !1737
  %99 = add nsw i32 %98, %94, !dbg !1737
  store i32 %99, ptr %97, align 4, !dbg !1737
  br label %100, !dbg !1738

100:                                              ; preds = %91, %71
  br label %101, !dbg !1739

101:                                              ; preds = %100, %59
  br label %102, !dbg !1740

102:                                              ; preds = %101
  %103 = load i32, ptr %13, align 4, !dbg !1741
  %104 = add nsw i32 %103, 1, !dbg !1741
  store i32 %104, ptr %13, align 4, !dbg !1741
  br label %56, !dbg !1742, !llvm.loop !1743

105:                                              ; preds = %56
  br label %340, !dbg !1746

106:                                              ; preds = %42
    #dbg_declare(ptr %19, !1747, !DIExpression(), !1749)
  store i32 0, ptr %19, align 4, !dbg !1749
    #dbg_declare(ptr %20, !1750, !DIExpression(), !1751)
  store i32 13107200, ptr %20, align 4, !dbg !1751
  %107 = load i32, ptr @CurrentLogicVersion, align 4, !dbg !1752
  %108 = icmp sge i32 %107, 1, !dbg !1754
  br i1 %108, label %109, label %298, !dbg !1754

109:                                              ; preds = %106
  %110 = load i32, ptr %12, align 4, !dbg !1755
  %111 = sext i32 %110 to i64, !dbg !1758
  %112 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %111, !dbg !1758
  %113 = getelementptr inbounds nuw %struct.object, ptr %112, i32 0, i32 1, !dbg !1759
  %114 = load i8, ptr %113, align 4, !dbg !1759
  %115 = zext i8 %114 to i32, !dbg !1758
  %116 = icmp eq i32 %115, 4, !dbg !1760
  br i1 %116, label %117, label %183, !dbg !1760

117:                                              ; preds = %109
  %118 = load i32, ptr %12, align 4, !dbg !1761
  %119 = sext i32 %118 to i64, !dbg !1763
  %120 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %119, !dbg !1763
  %121 = getelementptr inbounds nuw %struct.object, ptr %120, i32 0, i32 2, !dbg !1764
  %122 = load i8, ptr %121, align 1, !dbg !1764
  %123 = zext i8 %122 to i64, !dbg !1765
  %124 = getelementptr inbounds nuw [12 x %struct.player], ptr @Players, i64 0, i64 %123, !dbg !1765
  %125 = getelementptr inbounds nuw %struct.player, ptr %124, i32 0, i32 7, !dbg !1766
  %126 = load i32, ptr %125, align 4, !dbg !1766
  %127 = and i32 %126, 16384, !dbg !1767
  %128 = icmp ne i32 %127, 0, !dbg !1765
  br i1 %128, label %129, label %182, !dbg !1765

129:                                              ; preds = %117
  store i32 3, ptr %19, align 4, !dbg !1768
  %130 = load i32, ptr %12, align 4, !dbg !1770
  %131 = sext i32 %130 to i64, !dbg !1772
  %132 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %131, !dbg !1772
  %133 = getelementptr inbounds nuw %struct.object, ptr %132, i32 0, i32 2, !dbg !1773
  %134 = load i8, ptr %133, align 1, !dbg !1773
  %135 = zext i8 %134 to i32, !dbg !1772
  %136 = load i32, ptr @Player_num, align 4, !dbg !1774
  %137 = icmp ne i32 %135, %136, !dbg !1775
  br i1 %137, label %138, label %181, !dbg !1775

138:                                              ; preds = %129
    #dbg_declare(ptr %21, !1776, !DIExpression(), !1778)
    #dbg_declare(ptr %22, !1779, !DIExpression(), !1780)
    #dbg_declare(ptr %23, !1781, !DIExpression(), !1782)
    #dbg_declare(ptr %24, !1783, !DIExpression(), !1784)
  %139 = load i32, ptr %12, align 4, !dbg !1785
  %140 = sext i32 %139 to i64, !dbg !1786
  %141 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %140, !dbg !1786
  %142 = getelementptr inbounds nuw %struct.object, ptr %141, i32 0, i32 11, !dbg !1787
  %143 = load i32, ptr %12, align 4, !dbg !1788
  %144 = sext i32 %143 to i64, !dbg !1789
  %145 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %144, !dbg !1789
  %146 = getelementptr inbounds nuw %struct.object, ptr %145, i32 0, i32 12, !dbg !1790
  %147 = getelementptr inbounds nuw %struct.vms_matrix, ptr %146, i32 0, i32 2, !dbg !1791
  %148 = call noundef ptr @_Z16vm_vec_scale_addP10vms_vectorS0_S0_i(ptr noundef %21, ptr noundef %142, ptr noundef %147, i32 noundef 13107200), !dbg !1792
  %149 = load i32, ptr %12, align 4, !dbg !1793
  %150 = sext i32 %149 to i64, !dbg !1794
  %151 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %150, !dbg !1794
  %152 = getelementptr inbounds nuw %struct.object, ptr %151, i32 0, i32 9, !dbg !1795
  %153 = load i16, ptr %152, align 2, !dbg !1795
  %154 = sext i16 %153 to i32, !dbg !1794
  %155 = getelementptr inbounds nuw %struct.fvi_query, ptr %22, i32 0, i32 2, !dbg !1796
  store i32 %154, ptr %155, align 8, !dbg !1797
  %156 = load i32, ptr %12, align 4, !dbg !1798
  %157 = sext i32 %156 to i64, !dbg !1799
  %158 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %157, !dbg !1799
  %159 = getelementptr inbounds nuw %struct.object, ptr %158, i32 0, i32 11, !dbg !1800
  %160 = getelementptr inbounds nuw %struct.fvi_query, ptr %22, i32 0, i32 0, !dbg !1801
  store ptr %159, ptr %160, align 8, !dbg !1802
  %161 = getelementptr inbounds nuw %struct.fvi_query, ptr %22, i32 0, i32 1, !dbg !1803
  store ptr %21, ptr %161, align 8, !dbg !1804
  %162 = getelementptr inbounds nuw %struct.fvi_query, ptr %22, i32 0, i32 3, !dbg !1805
  store i32 0, ptr %162, align 4, !dbg !1806
  %163 = load i32, ptr %12, align 4, !dbg !1807
  %164 = trunc i32 %163 to i16, !dbg !1807
  %165 = getelementptr inbounds nuw %struct.fvi_query, ptr %22, i32 0, i32 4, !dbg !1808
  store i16 %164, ptr %165, align 8, !dbg !1809
  %166 = getelementptr inbounds nuw %struct.fvi_query, ptr %22, i32 0, i32 5, !dbg !1810
  store ptr null, ptr %166, align 8, !dbg !1811
  %167 = getelementptr inbounds nuw %struct.fvi_query, ptr %22, i32 0, i32 6, !dbg !1812
  store i32 2, ptr %167, align 8, !dbg !1813
  %168 = call noundef i32 @_Z24find_vector_intersectionP9fvi_queryP8fvi_info(ptr noundef %22, ptr noundef %23), !dbg !1814
  store i32 %168, ptr %24, align 4, !dbg !1815
  %169 = load i32, ptr %24, align 4, !dbg !1816
  %170 = icmp ne i32 %169, 0, !dbg !1818
  br i1 %170, label %171, label %180, !dbg !1818

171:                                              ; preds = %138
  %172 = getelementptr inbounds nuw %struct.fvi_info, ptr %23, i32 0, i32 1, !dbg !1819
  %173 = load i32, ptr %12, align 4, !dbg !1820
  %174 = sext i32 %173 to i64, !dbg !1821
  %175 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %174, !dbg !1821
  %176 = getelementptr inbounds nuw %struct.object, ptr %175, i32 0, i32 11, !dbg !1822
  %177 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %21, ptr noundef %172, ptr noundef %176), !dbg !1823
  %178 = call noundef i32 @_Z16vm_vec_mag_quickP10vms_vector(ptr noundef %177), !dbg !1824
  %179 = add nsw i32 %178, 262144, !dbg !1825
  store i32 %179, ptr %20, align 4, !dbg !1826
  br label %180, !dbg !1827

180:                                              ; preds = %171, %138
  br label %181, !dbg !1828

181:                                              ; preds = %180, %129
  br label %182, !dbg !1829

182:                                              ; preds = %181, %117
  br label %183, !dbg !1830

183:                                              ; preds = %182, %109
  store i32 0, ptr %13, align 4, !dbg !1831
  br label %184, !dbg !1833

184:                                              ; preds = %294, %183
  %185 = load i32, ptr %13, align 4, !dbg !1834
  %186 = load i32, ptr %10, align 4, !dbg !1836
  %187 = icmp slt i32 %185, %186, !dbg !1837
  br i1 %187, label %188, label %297, !dbg !1838

188:                                              ; preds = %184
    #dbg_declare(ptr %25, !1839, !DIExpression(), !1841)
    #dbg_declare(ptr %26, !1842, !DIExpression(), !1843)
    #dbg_declare(ptr %27, !1844, !DIExpression(), !1845)
    #dbg_declare(ptr %28, !1846, !DIExpression(), !1847)
  %189 = load ptr, ptr %11, align 8, !dbg !1848
  %190 = load i32, ptr %13, align 4, !dbg !1849
  %191 = sext i32 %190 to i64, !dbg !1848
  %192 = getelementptr inbounds i16, ptr %189, i64 %191, !dbg !1848
  %193 = load i16, ptr %192, align 2, !dbg !1848
  %194 = sext i16 %193 to i32, !dbg !1848
  store i32 %194, ptr %25, align 4, !dbg !1850
  %195 = load i32, ptr %25, align 4, !dbg !1851
  %196 = load i32, ptr @FrameCount, align 4, !dbg !1853
  %197 = xor i32 %195, %196, !dbg !1854
  %198 = and i32 %197, 1, !dbg !1855
  %199 = icmp ne i32 %198, 0, !dbg !1856
  br i1 %199, label %200, label %293, !dbg !1856

200:                                              ; preds = %188
  %201 = load i32, ptr %25, align 4, !dbg !1857
  %202 = sext i32 %201 to i64, !dbg !1859
  %203 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %202, !dbg !1859
  store ptr %203, ptr %26, align 8, !dbg !1860
  %204 = load ptr, ptr %9, align 8, !dbg !1861
  %205 = load ptr, ptr %26, align 8, !dbg !1862
  %206 = call noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef %204, ptr noundef %205), !dbg !1863
  store i32 %206, ptr %27, align 4, !dbg !1864
  store i32 0, ptr %28, align 4, !dbg !1865
  %207 = load i32, ptr %27, align 4, !dbg !1866
  %208 = load i32, ptr %19, align 4, !dbg !1868
  %209 = ashr i32 %207, %208, !dbg !1869
  %210 = load i32, ptr %14, align 4, !dbg !1870
  %211 = call i32 @llvm.abs.i32(i32 %210, i1 true), !dbg !1871
  %212 = icmp slt i32 %209, %211, !dbg !1872
  br i1 %212, label %213, label %292, !dbg !1872

213:                                              ; preds = %200
  %214 = load i32, ptr %27, align 4, !dbg !1873
  %215 = icmp slt i32 %214, 262144, !dbg !1876
  br i1 %215, label %216, label %217, !dbg !1876

216:                                              ; preds = %213
  store i32 262144, ptr %27, align 4, !dbg !1877
  br label %217, !dbg !1878

217:                                              ; preds = %216, %213
  store i32 1, ptr %28, align 4, !dbg !1879
  %218 = load i32, ptr %28, align 4, !dbg !1880
  %219 = icmp ne i32 %218, 0, !dbg !1880
  br i1 %219, label %220, label %291, !dbg !1880

220:                                              ; preds = %217
  %221 = load i32, ptr %19, align 4, !dbg !1882
  %222 = icmp ne i32 %221, 0, !dbg !1882
  br i1 %222, label %223, label %281, !dbg !1882

223:                                              ; preds = %220
    #dbg_declare(ptr %29, !1885, !DIExpression(), !1887)
    #dbg_declare(ptr %30, !1888, !DIExpression(), !1889)
  %224 = load ptr, ptr %26, align 8, !dbg !1890
  %225 = load ptr, ptr %9, align 8, !dbg !1891
  %226 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %30, ptr noundef %224, ptr noundef %225), !dbg !1892
  %227 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %30), !dbg !1893
  %228 = load i32, ptr %12, align 4, !dbg !1894
  %229 = sext i32 %228 to i64, !dbg !1894
  %230 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %229, !dbg !1894
  %231 = getelementptr inbounds nuw %struct.object, ptr %230, i32 0, i32 12, !dbg !1894
  %232 = getelementptr inbounds nuw %struct.vms_matrix, ptr %231, i32 0, i32 2, !dbg !1894
  %233 = call noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef %30, ptr noundef %232), !dbg !1894
  store i32 %233, ptr %29, align 4, !dbg !1895
  %234 = load i32, ptr %29, align 4, !dbg !1896
  %235 = icmp slt i32 %234, 32768, !dbg !1898
  br i1 %235, label %236, label %246, !dbg !1898

236:                                              ; preds = %223
  %237 = load i32, ptr %7, align 4, !dbg !1899
  %238 = load i32, ptr %27, align 4, !dbg !1900
  %239 = call noundef i32 @_Z6fixmulii(i32 noundef 655360, i32 noundef %238), !dbg !1901
  %240 = call noundef i32 @_Z6fixdivii(i32 noundef %237, i32 noundef %239), !dbg !1902
  %241 = load i32, ptr %25, align 4, !dbg !1903
  %242 = sext i32 %241 to i64, !dbg !1904
  %243 = getelementptr inbounds [3600 x i32], ptr @Dynamic_light, i64 0, i64 %242, !dbg !1904
  %244 = load i32, ptr %243, align 4, !dbg !1905
  %245 = add nsw i32 %244, %240, !dbg !1905
  store i32 %245, ptr %243, align 4, !dbg !1905
  br label %280, !dbg !1904

246:                                              ; preds = %223
  %247 = load i32, ptr @Game_mode, align 4, !dbg !1906
  %248 = and i32 %247, 38, !dbg !1909
  %249 = icmp ne i32 %248, 0, !dbg !1906
  br i1 %249, label %250, label %267, !dbg !1906

250:                                              ; preds = %246
  %251 = load i32, ptr %27, align 4, !dbg !1910
  %252 = load i32, ptr %20, align 4, !dbg !1913
  %253 = icmp slt i32 %251, %252, !dbg !1914
  br i1 %253, label %254, label %266, !dbg !1914

254:                                              ; preds = %250
  %255 = load i32, ptr %29, align 4, !dbg !1915
  %256 = load i32, ptr %29, align 4, !dbg !1916
  %257 = call noundef i32 @_Z6fixmulii(i32 noundef %255, i32 noundef %256), !dbg !1917
  %258 = load i32, ptr %7, align 4, !dbg !1918
  %259 = call noundef i32 @_Z6fixmulii(i32 noundef %257, i32 noundef %258), !dbg !1919
  %260 = sdiv i32 %259, 8, !dbg !1920
  %261 = load i32, ptr %25, align 4, !dbg !1921
  %262 = sext i32 %261 to i64, !dbg !1922
  %263 = getelementptr inbounds [3600 x i32], ptr @Dynamic_light, i64 0, i64 %262, !dbg !1922
  %264 = load i32, ptr %263, align 4, !dbg !1923
  %265 = add nsw i32 %264, %260, !dbg !1923
  store i32 %265, ptr %263, align 4, !dbg !1923
  br label %266, !dbg !1922

266:                                              ; preds = %254, %250
  br label %279, !dbg !1924

267:                                              ; preds = %246
  %268 = load i32, ptr %29, align 4, !dbg !1925
  %269 = load i32, ptr %29, align 4, !dbg !1926
  %270 = call noundef i32 @_Z6fixmulii(i32 noundef %268, i32 noundef %269), !dbg !1927
  %271 = load i32, ptr %7, align 4, !dbg !1928
  %272 = call noundef i32 @_Z6fixmulii(i32 noundef %270, i32 noundef %271), !dbg !1929
  %273 = sdiv i32 %272, 8, !dbg !1930
  %274 = load i32, ptr %25, align 4, !dbg !1931
  %275 = sext i32 %274 to i64, !dbg !1932
  %276 = getelementptr inbounds [3600 x i32], ptr @Dynamic_light, i64 0, i64 %275, !dbg !1932
  %277 = load i32, ptr %276, align 4, !dbg !1933
  %278 = add nsw i32 %277, %273, !dbg !1933
  store i32 %278, ptr %276, align 4, !dbg !1933
  br label %279

279:                                              ; preds = %267, %266
  br label %280

280:                                              ; preds = %279, %236
  br label %290, !dbg !1934

281:                                              ; preds = %220
  %282 = load i32, ptr %7, align 4, !dbg !1935
  %283 = load i32, ptr %27, align 4, !dbg !1936
  %284 = call noundef i32 @_Z6fixdivii(i32 noundef %282, i32 noundef %283), !dbg !1937
  %285 = load i32, ptr %25, align 4, !dbg !1938
  %286 = sext i32 %285 to i64, !dbg !1939
  %287 = getelementptr inbounds [3600 x i32], ptr @Dynamic_light, i64 0, i64 %286, !dbg !1939
  %288 = load i32, ptr %287, align 4, !dbg !1940
  %289 = add nsw i32 %288, %284, !dbg !1940
  store i32 %289, ptr %287, align 4, !dbg !1940
  br label %290

290:                                              ; preds = %281, %280
  br label %291, !dbg !1941

291:                                              ; preds = %290, %217
  br label %292, !dbg !1942

292:                                              ; preds = %291, %200
  br label %293, !dbg !1943

293:                                              ; preds = %292, %188
  br label %294, !dbg !1944

294:                                              ; preds = %293
  %295 = load i32, ptr %13, align 4, !dbg !1945
  %296 = add nsw i32 %295, 1, !dbg !1945
  store i32 %296, ptr %13, align 4, !dbg !1945
  br label %184, !dbg !1946, !llvm.loop !1947

297:                                              ; preds = %184
  br label %339, !dbg !1949

298:                                              ; preds = %106
  %299 = load i32, ptr @FrameCount, align 4, !dbg !1950
  %300 = and i32 %299, 1, !dbg !1953
  store i32 %300, ptr %13, align 4, !dbg !1954
  br label %301, !dbg !1955

301:                                              ; preds = %335, %298
  %302 = load i32, ptr %13, align 4, !dbg !1956
  %303 = load i32, ptr %10, align 4, !dbg !1958
  %304 = icmp slt i32 %302, %303, !dbg !1959
  br i1 %304, label %305, label %338, !dbg !1960

305:                                              ; preds = %301
    #dbg_declare(ptr %31, !1961, !DIExpression(), !1963)
    #dbg_declare(ptr %32, !1964, !DIExpression(), !1965)
    #dbg_declare(ptr %33, !1966, !DIExpression(), !1967)
  %306 = load ptr, ptr %11, align 8, !dbg !1968
  %307 = load i32, ptr %13, align 4, !dbg !1969
  %308 = sext i32 %307 to i64, !dbg !1968
  %309 = getelementptr inbounds i16, ptr %306, i64 %308, !dbg !1968
  %310 = load i16, ptr %309, align 2, !dbg !1968
  %311 = sext i16 %310 to i32, !dbg !1968
  store i32 %311, ptr %31, align 4, !dbg !1970
  %312 = load i32, ptr %31, align 4, !dbg !1971
  %313 = sext i32 %312 to i64, !dbg !1972
  %314 = getelementptr inbounds [0 x %struct.vms_vector], ptr @Vertices, i64 0, i64 %313, !dbg !1972
  store ptr %314, ptr %32, align 8, !dbg !1973
  %315 = load ptr, ptr %9, align 8, !dbg !1974
  %316 = load ptr, ptr %32, align 8, !dbg !1975
  %317 = call noundef i32 @_Z17vm_vec_dist_quickP10vms_vectorS0_(ptr noundef %315, ptr noundef %316), !dbg !1976
  store i32 %317, ptr %33, align 4, !dbg !1977
  %318 = load i32, ptr %33, align 4, !dbg !1978
  %319 = load i32, ptr %14, align 4, !dbg !1980
  %320 = icmp slt i32 %318, %319, !dbg !1981
  br i1 %320, label %321, label %334, !dbg !1981

321:                                              ; preds = %305
  %322 = load i32, ptr %33, align 4, !dbg !1982
  %323 = icmp slt i32 %322, 262144, !dbg !1985
  br i1 %323, label %324, label %325, !dbg !1985

324:                                              ; preds = %321
  store i32 262144, ptr %33, align 4, !dbg !1986
  br label %325, !dbg !1987

325:                                              ; preds = %324, %321
  %326 = load i32, ptr %7, align 4, !dbg !1988
  %327 = load i32, ptr %33, align 4, !dbg !1989
  %328 = call noundef i32 @_Z6fixdivii(i32 noundef %326, i32 noundef %327), !dbg !1990
  %329 = load i32, ptr %31, align 4, !dbg !1991
  %330 = sext i32 %329 to i64, !dbg !1992
  %331 = getelementptr inbounds [3600 x i32], ptr @Dynamic_light, i64 0, i64 %330, !dbg !1992
  %332 = load i32, ptr %331, align 4, !dbg !1993
  %333 = add nsw i32 %332, %328, !dbg !1993
  store i32 %333, ptr %331, align 4, !dbg !1993
  br label %334, !dbg !1994

334:                                              ; preds = %325, %305
  br label %335, !dbg !1995

335:                                              ; preds = %334
  %336 = load i32, ptr %13, align 4, !dbg !1996
  %337 = add nsw i32 %336, 2, !dbg !1996
  store i32 %337, ptr %13, align 4, !dbg !1996
  br label %301, !dbg !1997, !llvm.loop !1998

338:                                              ; preds = %301
  br label %339

339:                                              ; preds = %338, %297
  br label %340

340:                                              ; preds = %339, %105
  br label %341, !dbg !2000

341:                                              ; preds = %340, %6
  ret void, !dbg !2001
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.abs.i32(i32, i1 immarg) #2

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z6fixmulii(i32 noundef %0, i32 noundef %1) #3 !dbg !2002 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !2005, !DIExpression(), !2006)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !2007, !DIExpression(), !2008)
  %5 = load i32, ptr %3, align 4, !dbg !2009
  %6 = sext i32 %5 to i64, !dbg !2009
  %7 = load i32, ptr %4, align 4, !dbg !2010
  %8 = sext i32 %7 to i64, !dbg !2010
  %9 = mul nsw i64 %6, %8, !dbg !2011
  %10 = ashr i64 %9, 16, !dbg !2012
  %11 = trunc i64 %10 to i32, !dbg !2013
  ret i32 %11, !dbg !2014
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z6fixdivii(i32 noundef %0, i32 noundef %1) #3 !dbg !2015 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
    #dbg_declare(ptr %4, !2016, !DIExpression(), !2017)
  store i32 %1, ptr %5, align 4
    #dbg_declare(ptr %5, !2018, !DIExpression(), !2019)
  %6 = load i32, ptr %5, align 4, !dbg !2020
  %7 = icmp eq i32 %6, 0, !dbg !2022
  br i1 %7, label %8, label %9, !dbg !2022

8:                                                ; preds = %2
  store i32 1, ptr %3, align 4, !dbg !2023
  br label %17, !dbg !2023

9:                                                ; preds = %2
  %10 = load i32, ptr %4, align 4, !dbg !2024
  %11 = sext i32 %10 to i64, !dbg !2024
  %12 = shl i64 %11, 16, !dbg !2025
  %13 = load i32, ptr %5, align 4, !dbg !2026
  %14 = sext i32 %13 to i64, !dbg !2026
  %15 = sdiv i64 %12, %14, !dbg !2027
  %16 = trunc i64 %15 to i32, !dbg !2028
  store i32 %16, ptr %3, align 4, !dbg !2029
  br label %17, !dbg !2029

17:                                               ; preds = %9, %8
  %18 = load i32, ptr %3, align 4, !dbg !2030
  ret i32 %18, !dbg !2030
}

declare noundef ptr @_Z16vm_vec_scale_addP10vms_vectorS0_S0_i(ptr noundef, ptr noundef, ptr noundef, i32 noundef) #1

declare noundef i32 @_Z16vm_vec_mag_quickP10vms_vector(ptr noundef) #1

declare noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef, ptr noundef, ptr noundef) #1

declare noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef) #1

declare noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef, ptr noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z23cast_muzzle_flash_lightiPs(i32 noundef %0, ptr noundef %1) #0 !dbg !2031 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i16, align 2
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !2034, !DIExpression(), !2035)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !2036, !DIExpression(), !2037)
    #dbg_declare(ptr %5, !2038, !DIExpression(), !2039)
    #dbg_declare(ptr %6, !2040, !DIExpression(), !2041)
    #dbg_declare(ptr %7, !2042, !DIExpression(), !2043)
  %8 = call noundef i32 @_Z23timer_get_fixed_secondsv(), !dbg !2044
  store i32 %8, ptr %5, align 4, !dbg !2045
  store i32 0, ptr %6, align 4, !dbg !2046
  br label %9, !dbg !2048

9:                                                ; preds = %55, %2
  %10 = load i32, ptr %6, align 4, !dbg !2049
  %11 = icmp slt i32 %10, 8, !dbg !2051
  br i1 %11, label %12, label %58, !dbg !2052

12:                                               ; preds = %9
  %13 = load i32, ptr %6, align 4, !dbg !2053
  %14 = sext i32 %13 to i64, !dbg !2056
  %15 = getelementptr inbounds [8 x %struct.muzzle_info], ptr @Muzzle_data, i64 0, i64 %14, !dbg !2056
  %16 = getelementptr inbounds nuw %struct.muzzle_info, ptr %15, i32 0, i32 0, !dbg !2057
  %17 = load i32, ptr %16, align 4, !dbg !2057
  %18 = icmp ne i32 %17, 0, !dbg !2056
  br i1 %18, label %19, label %54, !dbg !2056

19:                                               ; preds = %12
  %20 = load i32, ptr %5, align 4, !dbg !2058
  %21 = load i32, ptr %6, align 4, !dbg !2060
  %22 = sext i32 %21 to i64, !dbg !2061
  %23 = getelementptr inbounds [8 x %struct.muzzle_info], ptr @Muzzle_data, i64 0, i64 %22, !dbg !2061
  %24 = getelementptr inbounds nuw %struct.muzzle_info, ptr %23, i32 0, i32 0, !dbg !2062
  %25 = load i32, ptr %24, align 4, !dbg !2062
  %26 = sub nsw i32 %20, %25, !dbg !2063
  %27 = trunc i32 %26 to i16, !dbg !2058
  store i16 %27, ptr %7, align 2, !dbg !2064
  %28 = load i16, ptr %7, align 2, !dbg !2065
  %29 = sext i16 %28 to i32, !dbg !2065
  %30 = icmp slt i32 %29, 21845, !dbg !2067
  br i1 %30, label %31, label %48, !dbg !2067

31:                                               ; preds = %19
  %32 = load i16, ptr %7, align 2, !dbg !2068
  %33 = sext i16 %32 to i32, !dbg !2068
  %34 = sub nsw i32 21845, %33, !dbg !2069
  %35 = mul nsw i32 %34, 9, !dbg !2070
  %36 = load i32, ptr %6, align 4, !dbg !2071
  %37 = sext i32 %36 to i64, !dbg !2072
  %38 = getelementptr inbounds [8 x %struct.muzzle_info], ptr @Muzzle_data, i64 0, i64 %37, !dbg !2072
  %39 = getelementptr inbounds nuw %struct.muzzle_info, ptr %38, i32 0, i32 1, !dbg !2073
  %40 = load i16, ptr %39, align 4, !dbg !2073
  %41 = sext i16 %40 to i32, !dbg !2072
  %42 = load i32, ptr %6, align 4, !dbg !2074
  %43 = sext i32 %42 to i64, !dbg !2075
  %44 = getelementptr inbounds [8 x %struct.muzzle_info], ptr @Muzzle_data, i64 0, i64 %43, !dbg !2075
  %45 = getelementptr inbounds nuw %struct.muzzle_info, ptr %44, i32 0, i32 2, !dbg !2076
  %46 = load i32, ptr %3, align 4, !dbg !2077
  %47 = load ptr, ptr %4, align 8, !dbg !2078
  call void @_Z11apply_lightiiP10vms_vectoriPsi(i32 noundef %35, i32 noundef %41, ptr noundef %45, i32 noundef %46, ptr noundef %47, i32 noundef -1), !dbg !2079
  br label %53, !dbg !2079

48:                                               ; preds = %19
  %49 = load i32, ptr %6, align 4, !dbg !2080
  %50 = sext i32 %49 to i64, !dbg !2081
  %51 = getelementptr inbounds [8 x %struct.muzzle_info], ptr @Muzzle_data, i64 0, i64 %50, !dbg !2081
  %52 = getelementptr inbounds nuw %struct.muzzle_info, ptr %51, i32 0, i32 0, !dbg !2082
  store i32 0, ptr %52, align 4, !dbg !2083
  br label %53

53:                                               ; preds = %48, %31
  br label %54, !dbg !2084

54:                                               ; preds = %53, %12
  br label %55, !dbg !2085

55:                                               ; preds = %54
  %56 = load i32, ptr %6, align 4, !dbg !2086
  %57 = add nsw i32 %56, 1, !dbg !2086
  store i32 %57, ptr %6, align 4, !dbg !2086
  br label %9, !dbg !2087, !llvm.loop !2088

58:                                               ; preds = %9
  ret void, !dbg !2090
}

declare noundef i32 @_Z23timer_get_fixed_secondsv() #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z23compute_light_intensityi(i32 noundef %0) #0 !dbg !2091 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !2094, !DIExpression(), !2095)
    #dbg_declare(ptr %4, !2096, !DIExpression(), !2097)
  %12 = load i32, ptr %3, align 4, !dbg !2098
  %13 = sext i32 %12 to i64, !dbg !2099
  %14 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %13, !dbg !2099
  store ptr %14, ptr %4, align 8, !dbg !2097
    #dbg_declare(ptr %5, !2100, !DIExpression(), !2101)
  %15 = load ptr, ptr %4, align 8, !dbg !2102
  %16 = getelementptr inbounds nuw %struct.object, ptr %15, i32 0, i32 1, !dbg !2103
  %17 = load i8, ptr %16, align 4, !dbg !2103
  %18 = zext i8 %17 to i32, !dbg !2102
  store i32 %18, ptr %5, align 4, !dbg !2101
    #dbg_declare(ptr %6, !2104, !DIExpression(), !2105)
    #dbg_declare(ptr %7, !2106, !DIExpression(), !2107)
  %19 = load i32, ptr %5, align 4, !dbg !2108
  switch i32 %19, label %283 [
    i32 4, label %20
    i32 1, label %152
    i32 2, label %192
    i32 5, label %202
    i32 15, label %248
    i32 7, label %269
    i32 8, label %277
    i32 13, label %278
  ], !dbg !2109

20:                                               ; preds = %1
  %21 = load i32, ptr @CurrentLogicVersion, align 4, !dbg !2110
  %22 = icmp sge i32 %21, 1, !dbg !2113
  br i1 %22, label %23, label %91, !dbg !2113

23:                                               ; preds = %20
  %24 = load ptr, ptr %4, align 8, !dbg !2114
  %25 = getelementptr inbounds nuw %struct.object, ptr %24, i32 0, i32 2, !dbg !2117
  %26 = load i8, ptr %25, align 1, !dbg !2117
  %27 = zext i8 %26 to i64, !dbg !2118
  %28 = getelementptr inbounds nuw [12 x %struct.player], ptr @Players, i64 0, i64 %27, !dbg !2118
  %29 = getelementptr inbounds nuw %struct.player, ptr %28, i32 0, i32 7, !dbg !2119
  %30 = load i32, ptr %29, align 4, !dbg !2119
  %31 = and i32 %30, 16384, !dbg !2120
  %32 = icmp ne i32 %31, 0, !dbg !2118
  br i1 %32, label %33, label %43, !dbg !2118

33:                                               ; preds = %23
  %34 = load i32, ptr @Num_headlights, align 4, !dbg !2121
  %35 = icmp slt i32 %34, 8, !dbg !2124
  br i1 %35, label %36, label %42, !dbg !2124

36:                                               ; preds = %33
  %37 = load ptr, ptr %4, align 8, !dbg !2125
  %38 = load i32, ptr @Num_headlights, align 4, !dbg !2126
  %39 = add nsw i32 %38, 1, !dbg !2126
  store i32 %39, ptr @Num_headlights, align 4, !dbg !2126
  %40 = sext i32 %38 to i64, !dbg !2127
  %41 = getelementptr inbounds [8 x ptr], ptr @Headlights, i64 0, i64 %40, !dbg !2127
  store ptr %37, ptr %41, align 8, !dbg !2128
  br label %42, !dbg !2127

42:                                               ; preds = %36, %33
  store i32 655360, ptr %2, align 4, !dbg !2129
  br label %284, !dbg !2129

43:                                               ; preds = %23
  %44 = load i32, ptr @Game_mode, align 4, !dbg !2130
  %45 = and i32 %44, 1024, !dbg !2132
  %46 = icmp ne i32 %45, 0, !dbg !2133
  br i1 %46, label %47, label %82, !dbg !2134

47:                                               ; preds = %43
  %48 = load ptr, ptr %4, align 8, !dbg !2135
  %49 = getelementptr inbounds nuw %struct.object, ptr %48, i32 0, i32 2, !dbg !2136
  %50 = load i8, ptr %49, align 1, !dbg !2136
  %51 = zext i8 %50 to i64, !dbg !2137
  %52 = getelementptr inbounds nuw [12 x %struct.player], ptr @Players, i64 0, i64 %51, !dbg !2137
  %53 = getelementptr inbounds nuw %struct.player, ptr %52, i32 0, i32 18, !dbg !2138
  %54 = getelementptr inbounds [10 x i16], ptr %53, i64 0, i64 2, !dbg !2137
  %55 = load i16, ptr %54, align 2, !dbg !2137
  %56 = icmp ne i16 %55, 0, !dbg !2137
  br i1 %56, label %57, label %82, !dbg !2134

57:                                               ; preds = %47
  %58 = load ptr, ptr %4, align 8, !dbg !2139
  %59 = getelementptr inbounds nuw %struct.object, ptr %58, i32 0, i32 2, !dbg !2141
  %60 = load i8, ptr %59, align 1, !dbg !2141
  %61 = zext i8 %60 to i64, !dbg !2142
  %62 = getelementptr inbounds nuw [12 x %struct.player], ptr @Players, i64 0, i64 %61, !dbg !2142
  %63 = getelementptr inbounds nuw %struct.player, ptr %62, i32 0, i32 18, !dbg !2143
  %64 = getelementptr inbounds [10 x i16], ptr %63, i64 0, i64 2, !dbg !2142
  %65 = load i16, ptr %64, align 2, !dbg !2142
  %66 = zext i16 %65 to i32, !dbg !2142
  %67 = call noundef i32 @_Z3i2fi(i32 noundef %66), !dbg !2144
  %68 = sdiv i32 %67, 2, !dbg !2145
  store i32 %68, ptr %6, align 4, !dbg !2146
  %69 = load i32, ptr %6, align 4, !dbg !2147
  %70 = add nsw i32 %69, 1, !dbg !2147
  store i32 %70, ptr %6, align 4, !dbg !2147
  %71 = load i32, ptr @GameTime, align 4, !dbg !2148
  %72 = sdiv i32 %71, 2, !dbg !2149
  %73 = and i32 %72, 65535, !dbg !2150
  call void @_Z10fix_sincosiPiS_(i32 noundef %73, ptr noundef %7, ptr noundef null), !dbg !2151
  %74 = load i32, ptr %7, align 4, !dbg !2152
  %75 = add nsw i32 %74, 65536, !dbg !2152
  store i32 %75, ptr %7, align 4, !dbg !2152
  %76 = load i32, ptr %7, align 4, !dbg !2153
  %77 = ashr i32 %76, 1, !dbg !2153
  store i32 %77, ptr %7, align 4, !dbg !2153
  %78 = load i32, ptr %7, align 4, !dbg !2154
  %79 = load i32, ptr %6, align 4, !dbg !2155
  %80 = call noundef i32 @_Z6fixmulii(i32 noundef %78, i32 noundef %79), !dbg !2156
  store i32 %80, ptr %6, align 4, !dbg !2157
  %81 = load i32, ptr %6, align 4, !dbg !2158
  store i32 %81, ptr %2, align 4, !dbg !2159
  br label %284, !dbg !2159

82:                                               ; preds = %47, %43
  %83 = load ptr, ptr %4, align 8, !dbg !2160
  %84 = getelementptr inbounds nuw %struct.object, ptr %83, i32 0, i32 21, !dbg !2161
  %85 = getelementptr inbounds nuw %struct.physics_info, ptr %84, i32 0, i32 1, !dbg !2162
  %86 = call noundef i32 @_Z16vm_vec_mag_quickP10vms_vector(ptr noundef %85), !dbg !2163
  %87 = sdiv i32 %86, 4, !dbg !2164
  store i32 %87, ptr %8, align 4, !dbg !2163
  store i32 131072, ptr %9, align 4, !dbg !2165
  %88 = call noundef nonnull align 4 dereferenceable(4) ptr @_ZNSt3__13maxB8ne200100IiEERKT_S3_S3_(ptr noundef nonnull align 4 dereferenceable(4) %8, ptr noundef nonnull align 4 dereferenceable(4) %9), !dbg !2166
  %89 = load i32, ptr %88, align 4, !dbg !2166
  %90 = add nsw i32 %89, 32768, !dbg !2167
  store i32 %90, ptr %2, align 4, !dbg !2168
  br label %284, !dbg !2168

91:                                               ; preds = %20
  %92 = load ptr, ptr %4, align 8, !dbg !2169
  %93 = getelementptr inbounds nuw %struct.object, ptr %92, i32 0, i32 2, !dbg !2172
  %94 = load i8, ptr %93, align 1, !dbg !2172
  %95 = zext i8 %94 to i32, !dbg !2169
  %96 = load i32, ptr @Player_num, align 4, !dbg !2173
  %97 = icmp ne i32 %95, %96, !dbg !2174
  br i1 %97, label %98, label %110, !dbg !2174

98:                                               ; preds = %91
  %99 = load ptr, ptr %4, align 8, !dbg !2175
  %100 = getelementptr inbounds nuw %struct.object, ptr %99, i32 0, i32 2, !dbg !2178
  %101 = load i8, ptr %100, align 1, !dbg !2178
  %102 = zext i8 %101 to i64, !dbg !2179
  %103 = getelementptr inbounds nuw [12 x %struct.player], ptr @Players, i64 0, i64 %102, !dbg !2179
  %104 = getelementptr inbounds nuw %struct.player, ptr %103, i32 0, i32 7, !dbg !2180
  %105 = load i32, ptr %104, align 4, !dbg !2180
  %106 = and i32 %105, 16384, !dbg !2181
  %107 = icmp ne i32 %106, 0, !dbg !2179
  br i1 %107, label %108, label %109, !dbg !2179

108:                                              ; preds = %98
  store i32 262144, ptr %2, align 4, !dbg !2182
  br label %284, !dbg !2182

109:                                              ; preds = %98
  store i32 32768, ptr %2, align 4, !dbg !2183
  br label %284, !dbg !2183

110:                                              ; preds = %91
  %111 = load ptr, ptr %4, align 8, !dbg !2184
  %112 = getelementptr inbounds nuw %struct.object, ptr %111, i32 0, i32 2, !dbg !2187
  %113 = load i8, ptr %112, align 1, !dbg !2187
  %114 = zext i8 %113 to i32, !dbg !2184
  %115 = icmp ne i32 %114, 255, !dbg !2188
  br i1 %115, label %116, label %149, !dbg !2188

116:                                              ; preds = %110
  %117 = load ptr, ptr %4, align 8, !dbg !2189
  %118 = getelementptr inbounds nuw %struct.object, ptr %117, i32 0, i32 20, !dbg !2192
  %119 = load i32, ptr %118, align 4, !dbg !2192
  %120 = icmp slt i32 %119, 262144, !dbg !2193
  br i1 %120, label %121, label %141, !dbg !2193

121:                                              ; preds = %116
  %122 = load ptr, ptr %4, align 8, !dbg !2194
  %123 = getelementptr inbounds nuw %struct.object, ptr %122, i32 0, i32 20, !dbg !2195
  %124 = load i32, ptr %123, align 4, !dbg !2195
  %125 = load ptr, ptr %4, align 8, !dbg !2196
  %126 = getelementptr inbounds nuw %struct.object, ptr %125, i32 0, i32 2, !dbg !2197
  %127 = load i8, ptr %126, align 1, !dbg !2197
  %128 = zext i8 %127 to i64, !dbg !2198
  %129 = getelementptr inbounds nuw [110 x %struct.vclip], ptr @Vclip, i64 0, i64 %128, !dbg !2198
  %130 = getelementptr inbounds nuw %struct.vclip, ptr %129, i32 0, i32 0, !dbg !2199
  %131 = load i32, ptr %130, align 4, !dbg !2199
  %132 = call noundef i32 @_Z6fixdivii(i32 noundef %124, i32 noundef %131), !dbg !2200
  %133 = load ptr, ptr %4, align 8, !dbg !2201
  %134 = getelementptr inbounds nuw %struct.object, ptr %133, i32 0, i32 2, !dbg !2202
  %135 = load i8, ptr %134, align 1, !dbg !2202
  %136 = zext i8 %135 to i64, !dbg !2203
  %137 = getelementptr inbounds nuw [110 x %struct.vclip], ptr @Vclip, i64 0, i64 %136, !dbg !2203
  %138 = getelementptr inbounds nuw %struct.vclip, ptr %137, i32 0, i32 6, !dbg !2204
  %139 = load i32, ptr %138, align 4, !dbg !2204
  %140 = call noundef i32 @_Z6fixmulii(i32 noundef %132, i32 noundef %139), !dbg !2205
  store i32 %140, ptr %2, align 4, !dbg !2206
  br label %284, !dbg !2206

141:                                              ; preds = %116
  %142 = load ptr, ptr %4, align 8, !dbg !2207
  %143 = getelementptr inbounds nuw %struct.object, ptr %142, i32 0, i32 2, !dbg !2208
  %144 = load i8, ptr %143, align 1, !dbg !2208
  %145 = zext i8 %144 to i64, !dbg !2209
  %146 = getelementptr inbounds nuw [110 x %struct.vclip], ptr @Vclip, i64 0, i64 %145, !dbg !2209
  %147 = getelementptr inbounds nuw %struct.vclip, ptr %146, i32 0, i32 6, !dbg !2210
  %148 = load i32, ptr %147, align 4, !dbg !2210
  store i32 %148, ptr %2, align 4, !dbg !2211
  br label %284, !dbg !2211

149:                                              ; preds = %110
  br label %150

150:                                              ; preds = %149
  br label %151

151:                                              ; preds = %150
  store i32 0, ptr %2, align 4, !dbg !2212
  br label %284, !dbg !2212

152:                                              ; preds = %1
  %153 = load ptr, ptr %4, align 8, !dbg !2213
  %154 = getelementptr inbounds nuw %struct.object, ptr %153, i32 0, i32 2, !dbg !2215
  %155 = load i8, ptr %154, align 1, !dbg !2215
  %156 = zext i8 %155 to i32, !dbg !2213
  %157 = icmp ne i32 %156, 255, !dbg !2216
  br i1 %157, label %158, label %191, !dbg !2216

158:                                              ; preds = %152
  %159 = load ptr, ptr %4, align 8, !dbg !2217
  %160 = getelementptr inbounds nuw %struct.object, ptr %159, i32 0, i32 20, !dbg !2220
  %161 = load i32, ptr %160, align 4, !dbg !2220
  %162 = icmp slt i32 %161, 262144, !dbg !2221
  br i1 %162, label %163, label %183, !dbg !2221

163:                                              ; preds = %158
  %164 = load ptr, ptr %4, align 8, !dbg !2222
  %165 = getelementptr inbounds nuw %struct.object, ptr %164, i32 0, i32 20, !dbg !2223
  %166 = load i32, ptr %165, align 4, !dbg !2223
  %167 = load ptr, ptr %4, align 8, !dbg !2224
  %168 = getelementptr inbounds nuw %struct.object, ptr %167, i32 0, i32 2, !dbg !2225
  %169 = load i8, ptr %168, align 1, !dbg !2225
  %170 = zext i8 %169 to i64, !dbg !2226
  %171 = getelementptr inbounds nuw [110 x %struct.vclip], ptr @Vclip, i64 0, i64 %170, !dbg !2226
  %172 = getelementptr inbounds nuw %struct.vclip, ptr %171, i32 0, i32 0, !dbg !2227
  %173 = load i32, ptr %172, align 4, !dbg !2227
  %174 = call noundef i32 @_Z6fixdivii(i32 noundef %166, i32 noundef %173), !dbg !2228
  %175 = load ptr, ptr %4, align 8, !dbg !2229
  %176 = getelementptr inbounds nuw %struct.object, ptr %175, i32 0, i32 2, !dbg !2230
  %177 = load i8, ptr %176, align 1, !dbg !2230
  %178 = zext i8 %177 to i64, !dbg !2231
  %179 = getelementptr inbounds nuw [110 x %struct.vclip], ptr @Vclip, i64 0, i64 %178, !dbg !2231
  %180 = getelementptr inbounds nuw %struct.vclip, ptr %179, i32 0, i32 6, !dbg !2232
  %181 = load i32, ptr %180, align 4, !dbg !2232
  %182 = call noundef i32 @_Z6fixmulii(i32 noundef %174, i32 noundef %181), !dbg !2233
  store i32 %182, ptr %2, align 4, !dbg !2234
  br label %284, !dbg !2234

183:                                              ; preds = %158
  %184 = load ptr, ptr %4, align 8, !dbg !2235
  %185 = getelementptr inbounds nuw %struct.object, ptr %184, i32 0, i32 2, !dbg !2236
  %186 = load i8, ptr %185, align 1, !dbg !2236
  %187 = zext i8 %186 to i64, !dbg !2237
  %188 = getelementptr inbounds nuw [110 x %struct.vclip], ptr @Vclip, i64 0, i64 %187, !dbg !2237
  %189 = getelementptr inbounds nuw %struct.vclip, ptr %188, i32 0, i32 6, !dbg !2238
  %190 = load i32, ptr %189, align 4, !dbg !2238
  store i32 %190, ptr %2, align 4, !dbg !2239
  br label %284, !dbg !2239

191:                                              ; preds = %152
  store i32 0, ptr %2, align 4, !dbg !2240
  br label %284, !dbg !2240

192:                                              ; preds = %1
  %193 = load ptr, ptr %4, align 8, !dbg !2241
  %194 = getelementptr inbounds nuw %struct.object, ptr %193, i32 0, i32 2, !dbg !2242
  %195 = load i8, ptr %194, align 1, !dbg !2242
  %196 = zext i8 %195 to i64, !dbg !2243
  %197 = getelementptr inbounds nuw [0 x %struct.robot_info], ptr @Robot_info, i64 0, i64 %196, !dbg !2243
  %198 = getelementptr inbounds nuw %struct.robot_info, ptr %197, i32 0, i32 42, !dbg !2244
  %199 = load i8, ptr %198, align 2, !dbg !2244
  %200 = sext i8 %199 to i32, !dbg !2243
  %201 = mul nsw i32 65536, %200, !dbg !2245
  store i32 %201, ptr %2, align 4, !dbg !2246
  br label %284, !dbg !2246

202:                                              ; preds = %1
    #dbg_declare(ptr %10, !2247, !DIExpression(), !2249)
  %203 = load ptr, ptr %4, align 8, !dbg !2250
  %204 = getelementptr inbounds nuw %struct.object, ptr %203, i32 0, i32 2, !dbg !2251
  %205 = load i8, ptr %204, align 1, !dbg !2251
  %206 = zext i8 %205 to i64, !dbg !2252
  %207 = getelementptr inbounds nuw [0 x %struct.weapon_info], ptr @Weapon_info, i64 0, i64 %206, !dbg !2252
  %208 = getelementptr inbounds nuw %struct.weapon_info, ptr %207, i32 0, i32 35, !dbg !2253
  %209 = load i32, ptr %208, align 4, !dbg !2253
  store i32 %209, ptr %10, align 4, !dbg !2249
  %210 = load i32, ptr @Game_mode, align 4, !dbg !2254
  %211 = and i32 %210, 38, !dbg !2256
  %212 = icmp ne i32 %211, 0, !dbg !2254
  br i1 %212, label %213, label %225, !dbg !2254

213:                                              ; preds = %202
  %214 = load ptr, ptr %4, align 8, !dbg !2257
  %215 = getelementptr inbounds nuw %struct.object, ptr %214, i32 0, i32 2, !dbg !2259
  %216 = load i8, ptr %215, align 1, !dbg !2259
  %217 = zext i8 %216 to i32, !dbg !2257
  %218 = icmp eq i32 %217, 35, !dbg !2260
  br i1 %218, label %219, label %224, !dbg !2260

219:                                              ; preds = %213
  %220 = call noundef i32 @_Z6P_Randv(), !dbg !2261
  %221 = icmp sgt i32 %220, 8192, !dbg !2263
  br i1 %221, label %222, label %223, !dbg !2263

222:                                              ; preds = %219
  store i32 0, ptr %2, align 4, !dbg !2264
  br label %284, !dbg !2264

223:                                              ; preds = %219
  br label %224, !dbg !2265

224:                                              ; preds = %223, %213
  br label %225, !dbg !2266

225:                                              ; preds = %224, %202
  %226 = load ptr, ptr %4, align 8, !dbg !2267
  %227 = getelementptr inbounds nuw %struct.object, ptr %226, i32 0, i32 2, !dbg !2269
  %228 = load i8, ptr %227, align 1, !dbg !2269
  %229 = zext i8 %228 to i32, !dbg !2267
  %230 = icmp eq i32 %229, 9, !dbg !2270
  br i1 %230, label %231, label %246, !dbg !2270

231:                                              ; preds = %225
  %232 = load ptr, ptr %4, align 8, !dbg !2271
  %233 = getelementptr inbounds nuw %struct.object, ptr %232, i32 0, i32 20, !dbg !2272
  %234 = call noundef nonnull align 4 dereferenceable(4) ptr @_ZNSt3__13minB8ne200100IiEERKT_S3_S3_(ptr noundef nonnull align 4 dereferenceable(4) %10, ptr noundef nonnull align 4 dereferenceable(4) %233), !dbg !2273
  %235 = load i32, ptr %234, align 4, !dbg !2273
  %236 = load i32, ptr @GameTime, align 4, !dbg !2274
  %237 = load i32, ptr %3, align 4, !dbg !2275
  %238 = and i32 %237, 15, !dbg !2276
  %239 = sext i32 %238 to i64, !dbg !2277
  %240 = getelementptr inbounds [16 x i32], ptr @Obj_light_xlate, i64 0, i64 %239, !dbg !2277
  %241 = load i32, ptr %240, align 4, !dbg !2277
  %242 = xor i32 %236, %241, !dbg !2278
  %243 = and i32 %242, 16383, !dbg !2279
  %244 = add nsw i32 %235, %243, !dbg !2280
  %245 = mul nsw i32 2, %244, !dbg !2281
  store i32 %245, ptr %2, align 4, !dbg !2282
  br label %284, !dbg !2282

246:                                              ; preds = %225
  %247 = load i32, ptr %10, align 4, !dbg !2283
  store i32 %247, ptr %2, align 4, !dbg !2284
  br label %284, !dbg !2284

248:                                              ; preds = %1
    #dbg_declare(ptr %11, !2285, !DIExpression(), !2287)
  %249 = load ptr, ptr %4, align 8, !dbg !2288
  %250 = getelementptr inbounds nuw %struct.object, ptr %249, i32 0, i32 20, !dbg !2289
  %251 = load i32, ptr %250, align 4, !dbg !2289
  store i32 %251, ptr %11, align 4, !dbg !2287
  %252 = load i32, ptr %11, align 4, !dbg !2290
  %253 = and i32 %252, 65535, !dbg !2290
  store i32 %253, ptr %11, align 4, !dbg !2290
  %254 = load i32, ptr %11, align 4, !dbg !2291
  %255 = sub nsw i32 32768, %254, !dbg !2292
  %256 = call i32 @llvm.abs.i32(i32 %255, i1 true), !dbg !2293
  %257 = mul nsw i32 8, %256, !dbg !2294
  store i32 %257, ptr %11, align 4, !dbg !2295
  %258 = load ptr, ptr %4, align 8, !dbg !2296
  %259 = getelementptr inbounds nuw %struct.object, ptr %258, i32 0, i32 20, !dbg !2298
  %260 = load i32, ptr %259, align 4, !dbg !2298
  %261 = icmp slt i32 %260, 65536000, !dbg !2299
  br i1 %261, label %262, label %267, !dbg !2299

262:                                              ; preds = %248
  %263 = load ptr, ptr %4, align 8, !dbg !2300
  %264 = getelementptr inbounds nuw %struct.object, ptr %263, i32 0, i32 20, !dbg !2301
  %265 = load i32, ptr %264, align 4, !dbg !2302
  %266 = add nsw i32 %265, 65536, !dbg !2302
  store i32 %266, ptr %264, align 4, !dbg !2302
  br label %267, !dbg !2300

267:                                              ; preds = %262, %248
  %268 = load i32, ptr %11, align 4, !dbg !2303
  store i32 %268, ptr %2, align 4, !dbg !2304
  br label %284, !dbg !2304

269:                                              ; preds = %1
  %270 = load ptr, ptr %4, align 8, !dbg !2305
  %271 = getelementptr inbounds nuw %struct.object, ptr %270, i32 0, i32 2, !dbg !2306
  %272 = load i8, ptr %271, align 1, !dbg !2306
  %273 = zext i8 %272 to i64, !dbg !2307
  %274 = getelementptr inbounds nuw [50 x %struct.powerup_type_info], ptr @Powerup_info, i64 0, i64 %273, !dbg !2307
  %275 = getelementptr inbounds nuw %struct.powerup_type_info, ptr %274, i32 0, i32 3, !dbg !2308
  %276 = load i32, ptr %275, align 4, !dbg !2308
  store i32 %276, ptr %2, align 4, !dbg !2309
  br label %284, !dbg !2309

277:                                              ; preds = %1
  store i32 16384, ptr %2, align 4, !dbg !2310
  br label %284, !dbg !2310

278:                                              ; preds = %1
  %279 = load ptr, ptr %4, align 8, !dbg !2311
  %280 = getelementptr inbounds nuw %struct.object, ptr %279, i32 0, i32 22, !dbg !2312
  %281 = getelementptr inbounds nuw %struct.light_info_s, ptr %280, i32 0, i32 0, !dbg !2313
  %282 = load i32, ptr %281, align 4, !dbg !2313
  store i32 %282, ptr %2, align 4, !dbg !2314
  br label %284, !dbg !2314

283:                                              ; preds = %1
  store i32 0, ptr %2, align 4, !dbg !2315
  br label %284, !dbg !2315

284:                                              ; preds = %283, %278, %277, %269, %267, %246, %231, %222, %192, %191, %183, %163, %151, %141, %121, %109, %108, %82, %57, %42
  %285 = load i32, ptr %2, align 4, !dbg !2316
  ret i32 %285, !dbg !2316
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z3i2fi(i32 noundef %0) #3 !dbg !2317 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !2318, !DIExpression(), !2319)
  %3 = load i32, ptr %2, align 4, !dbg !2320
  %4 = shl i32 %3, 16, !dbg !2321
  ret i32 %4, !dbg !2322
}

declare void @_Z10fix_sincosiPiS_(i32 noundef, ptr noundef, ptr noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 4 dereferenceable(4) ptr @_ZNSt3__13maxB8ne200100IiEERKT_S3_S3_(ptr noundef nonnull align 4 dereferenceable(4) %0, ptr noundef nonnull align 4 dereferenceable(4) %1) #0 !dbg !2323 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %"struct.std::__1::__less", align 1
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !2330, !DIExpression(), !2331)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !2332, !DIExpression(), !2333)
  %6 = load ptr, ptr %3, align 8, !dbg !2334
  %7 = load ptr, ptr %4, align 8, !dbg !2335
  %8 = call noundef nonnull align 4 dereferenceable(4) ptr @_ZNSt3__13maxB8ne200100IiNS_6__lessIvvEEEERKT_S5_S5_T0_(ptr noundef nonnull align 4 dereferenceable(4) %6, ptr noundef nonnull align 4 dereferenceable(4) %7), !dbg !2336
  ret ptr %8, !dbg !2337
}

declare noundef i32 @_Z6P_Randv() #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 4 dereferenceable(4) ptr @_ZNSt3__13minB8ne200100IiEERKT_S3_S3_(ptr noundef nonnull align 4 dereferenceable(4) %0, ptr noundef nonnull align 4 dereferenceable(4) %1) #0 !dbg !2338 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %"struct.std::__1::__less", align 1
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !2340, !DIExpression(), !2341)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !2342, !DIExpression(), !2343)
  %6 = load ptr, ptr %3, align 8, !dbg !2344
  %7 = load ptr, ptr %4, align 8, !dbg !2345
  %8 = call noundef nonnull align 4 dereferenceable(4) ptr @_ZNSt3__13minB8ne200100IiNS_6__lessIvvEEEERKT_S5_S5_T0_(ptr noundef nonnull align 4 dereferenceable(4) %6, ptr noundef nonnull align 4 dereferenceable(4) %7), !dbg !2346
  ret ptr %8, !dbg !2347
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_Z17set_dynamic_lightv() #0 !dbg !2348 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca [3600 x i16], align 2
  %5 = alloca [3600 x i8], align 1
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca [350 x i8], align 1
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca i32, align 4
  %17 = alloca ptr, align 8
  %18 = alloca ptr, align 8
  %19 = alloca i32, align 4
    #dbg_declare(ptr %1, !2349, !DIExpression(), !2350)
    #dbg_declare(ptr %2, !2351, !DIExpression(), !2352)
    #dbg_declare(ptr %3, !2353, !DIExpression(), !2354)
    #dbg_declare(ptr %4, !2355, !DIExpression(), !2357)
    #dbg_declare(ptr %5, !2358, !DIExpression(), !2360)
    #dbg_declare(ptr %6, !2361, !DIExpression(), !2362)
    #dbg_declare(ptr %7, !2363, !DIExpression(), !2364)
    #dbg_declare(ptr %8, !2365, !DIExpression(), !2366)
    #dbg_declare(ptr %9, !2367, !DIExpression(), !2368)
  store i32 0, ptr @Num_headlights, align 4, !dbg !2369
  %20 = load i32, ptr @Do_dynamic_light, align 4, !dbg !2370
  %21 = icmp ne i32 %20, 0, !dbg !2370
  br i1 %21, label %23, label %22, !dbg !2372

22:                                               ; preds = %0
  br label %298, !dbg !2373

23:                                               ; preds = %0
  %24 = getelementptr inbounds [3600 x i8], ptr %5, i64 0, i64 0, !dbg !2374
  %25 = load i32, ptr @Highest_vertex_index, align 4, !dbg !2375
  %26 = add nsw i32 %25, 1, !dbg !2376
  %27 = sext i32 %26 to i64, !dbg !2375
  call void @llvm.memset.p0.i64(ptr align 1 %24, i8 0, i64 %27, i1 false), !dbg !2374
  store i32 0, ptr %3, align 4, !dbg !2377
  store i32 0, ptr %6, align 4, !dbg !2378
  br label %28, !dbg !2380

28:                                               ; preds = %85, %23
  %29 = load i32, ptr %6, align 4, !dbg !2381
  %30 = load i32, ptr @N_render_segs, align 4, !dbg !2383
  %31 = icmp slt i32 %29, %30, !dbg !2384
  br i1 %31, label %32, label %88, !dbg !2385

32:                                               ; preds = %28
  %33 = load i32, ptr %6, align 4, !dbg !2386
  %34 = sext i32 %33 to i64, !dbg !2388
  %35 = getelementptr inbounds [500 x i16], ptr @Render_list, i64 0, i64 %34, !dbg !2388
  %36 = load i16, ptr %35, align 2, !dbg !2388
  %37 = sext i16 %36 to i32, !dbg !2388
  store i32 %37, ptr %7, align 4, !dbg !2389
  %38 = load i32, ptr %7, align 4, !dbg !2390
  %39 = icmp ne i32 %38, -1, !dbg !2392
  br i1 %39, label %40, label %84, !dbg !2392

40:                                               ; preds = %32
    #dbg_declare(ptr %10, !2393, !DIExpression(), !2395)
  %41 = load i32, ptr %7, align 4, !dbg !2396
  %42 = sext i32 %41 to i64, !dbg !2397
  %43 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %42, !dbg !2397
  %44 = getelementptr inbounds nuw %struct.segment, ptr %43, i32 0, i32 2, !dbg !2398
  %45 = getelementptr inbounds [8 x i16], ptr %44, i64 0, i64 0, !dbg !2397
  store ptr %45, ptr %10, align 8, !dbg !2395
  store i32 0, ptr %8, align 4, !dbg !2399
  br label %46, !dbg !2401

46:                                               ; preds = %80, %40
  %47 = load i32, ptr %8, align 4, !dbg !2402
  %48 = icmp slt i32 %47, 8, !dbg !2404
  br i1 %48, label %49, label %83, !dbg !2405

49:                                               ; preds = %46
    #dbg_declare(ptr %11, !2406, !DIExpression(), !2408)
  %50 = load ptr, ptr %10, align 8, !dbg !2409
  %51 = load i32, ptr %8, align 4, !dbg !2410
  %52 = sext i32 %51 to i64, !dbg !2409
  %53 = getelementptr inbounds i16, ptr %50, i64 %52, !dbg !2409
  %54 = load i16, ptr %53, align 2, !dbg !2409
  %55 = sext i16 %54 to i32, !dbg !2409
  store i32 %55, ptr %11, align 4, !dbg !2408
  %56 = load i32, ptr %11, align 4, !dbg !2411
  %57 = icmp slt i32 %56, 0, !dbg !2413
  br i1 %57, label %62, label %58, !dbg !2414

58:                                               ; preds = %49
  %59 = load i32, ptr %11, align 4, !dbg !2415
  %60 = load i32, ptr @Highest_vertex_index, align 4, !dbg !2416
  %61 = icmp sgt i32 %59, %60, !dbg !2417
  br i1 %61, label %62, label %63, !dbg !2414

62:                                               ; preds = %58, %49
  call void @_Z4Int3v(), !dbg !2418
  br label %80, !dbg !2420

63:                                               ; preds = %58
  %64 = load i32, ptr %11, align 4, !dbg !2421
  %65 = sext i32 %64 to i64, !dbg !2423
  %66 = getelementptr inbounds [3600 x i8], ptr %5, i64 0, i64 %65, !dbg !2423
  %67 = load i8, ptr %66, align 1, !dbg !2423
  %68 = icmp ne i8 %67, 0, !dbg !2423
  br i1 %68, label %79, label %69, !dbg !2424

69:                                               ; preds = %63
  %70 = load i32, ptr %11, align 4, !dbg !2425
  %71 = sext i32 %70 to i64, !dbg !2427
  %72 = getelementptr inbounds [3600 x i8], ptr %5, i64 0, i64 %71, !dbg !2427
  store i8 1, ptr %72, align 1, !dbg !2428
  %73 = load i32, ptr %11, align 4, !dbg !2429
  %74 = trunc i32 %73 to i16, !dbg !2429
  %75 = load i32, ptr %3, align 4, !dbg !2430
  %76 = add nsw i32 %75, 1, !dbg !2430
  store i32 %76, ptr %3, align 4, !dbg !2430
  %77 = sext i32 %75 to i64, !dbg !2431
  %78 = getelementptr inbounds [3600 x i16], ptr %4, i64 0, i64 %77, !dbg !2431
  store i16 %74, ptr %78, align 2, !dbg !2432
  br label %79, !dbg !2433

79:                                               ; preds = %69, %63
  br label %80, !dbg !2434

80:                                               ; preds = %79, %62
  %81 = load i32, ptr %8, align 4, !dbg !2435
  %82 = add nsw i32 %81, 1, !dbg !2435
  store i32 %82, ptr %8, align 4, !dbg !2435
  br label %46, !dbg !2436, !llvm.loop !2437

83:                                               ; preds = %46
  br label %84, !dbg !2439

84:                                               ; preds = %83, %32
  br label %85, !dbg !2440

85:                                               ; preds = %84
  %86 = load i32, ptr %6, align 4, !dbg !2441
  %87 = add nsw i32 %86, 1, !dbg !2441
  store i32 %87, ptr %6, align 4, !dbg !2441
  br label %28, !dbg !2442, !llvm.loop !2443

88:                                               ; preds = %28
  %89 = load i32, ptr @CurrentLogicVersion, align 4, !dbg !2445
  %90 = icmp sge i32 %89, 1, !dbg !2447
  br i1 %90, label %91, label %125, !dbg !2447

91:                                               ; preds = %88
  store i32 0, ptr %1, align 4, !dbg !2448
  br label %92, !dbg !2451

92:                                               ; preds = %121, %91
  %93 = load i32, ptr %1, align 4, !dbg !2452
  %94 = load i32, ptr %3, align 4, !dbg !2454
  %95 = icmp slt i32 %93, %94, !dbg !2455
  br i1 %95, label %96, label %124, !dbg !2456

96:                                               ; preds = %92
    #dbg_declare(ptr %12, !2457, !DIExpression(), !2459)
  %97 = load i32, ptr %1, align 4, !dbg !2460
  %98 = sext i32 %97 to i64, !dbg !2461
  %99 = getelementptr inbounds [3600 x i16], ptr %4, i64 0, i64 %98, !dbg !2461
  %100 = load i16, ptr %99, align 2, !dbg !2461
  %101 = sext i16 %100 to i32, !dbg !2461
  store i32 %101, ptr %12, align 4, !dbg !2462
  %102 = load i32, ptr %12, align 4, !dbg !2463
  %103 = icmp sge i32 %102, 0, !dbg !2463
  br i1 %103, label %104, label %108, !dbg !2463

104:                                              ; preds = %96
  %105 = load i32, ptr %12, align 4, !dbg !2463
  %106 = load i32, ptr @Highest_vertex_index, align 4, !dbg !2463
  %107 = icmp sle i32 %105, %106, !dbg !2463
  br label %108

108:                                              ; preds = %104, %96
  %109 = phi i1 [ false, %96 ], [ %107, %104 ], !dbg !2464
  %110 = zext i1 %109 to i32, !dbg !2463
  call void @_Z7_AssertiPKcS0_i(i32 noundef %110, ptr noundef @.str, ptr noundef @.str.1, i32 noundef 535), !dbg !2463
  %111 = load i32, ptr %12, align 4, !dbg !2465
  %112 = load i32, ptr @FrameCount, align 4, !dbg !2467
  %113 = xor i32 %111, %112, !dbg !2468
  %114 = and i32 %113, 1, !dbg !2469
  %115 = icmp ne i32 %114, 0, !dbg !2470
  br i1 %115, label %116, label %120, !dbg !2470

116:                                              ; preds = %108
  %117 = load i32, ptr %12, align 4, !dbg !2471
  %118 = sext i32 %117 to i64, !dbg !2472
  %119 = getelementptr inbounds [3600 x i32], ptr @Dynamic_light, i64 0, i64 %118, !dbg !2472
  store i32 0, ptr %119, align 4, !dbg !2473
  br label %120, !dbg !2472

120:                                              ; preds = %116, %108
  br label %121, !dbg !2474

121:                                              ; preds = %120
  %122 = load i32, ptr %1, align 4, !dbg !2475
  %123 = add nsw i32 %122, 1, !dbg !2475
  store i32 %123, ptr %1, align 4, !dbg !2475
  br label %92, !dbg !2476, !llvm.loop !2477

124:                                              ; preds = %92
  br label %160, !dbg !2479

125:                                              ; preds = %88
  %126 = load i32, ptr @FrameCount, align 4, !dbg !2480
  %127 = and i32 %126, 1, !dbg !2483
  store i32 %127, ptr %1, align 4, !dbg !2484
  br label %128, !dbg !2485

128:                                              ; preds = %156, %125
  %129 = load i32, ptr %1, align 4, !dbg !2486
  %130 = load i32, ptr %3, align 4, !dbg !2488
  %131 = icmp slt i32 %129, %130, !dbg !2489
  br i1 %131, label %132, label %159, !dbg !2490

132:                                              ; preds = %128
  %133 = load i32, ptr %1, align 4, !dbg !2491
  %134 = sext i32 %133 to i64, !dbg !2491
  %135 = getelementptr inbounds [3600 x i16], ptr %4, i64 0, i64 %134, !dbg !2491
  %136 = load i16, ptr %135, align 2, !dbg !2491
  %137 = sext i16 %136 to i32, !dbg !2491
  %138 = icmp sge i32 %137, 0, !dbg !2491
  br i1 %138, label %139, label %147, !dbg !2491

139:                                              ; preds = %132
  %140 = load i32, ptr %1, align 4, !dbg !2491
  %141 = sext i32 %140 to i64, !dbg !2491
  %142 = getelementptr inbounds [3600 x i16], ptr %4, i64 0, i64 %141, !dbg !2491
  %143 = load i16, ptr %142, align 2, !dbg !2491
  %144 = sext i16 %143 to i32, !dbg !2491
  %145 = load i32, ptr @Highest_vertex_index, align 4, !dbg !2491
  %146 = icmp sle i32 %144, %145, !dbg !2491
  br label %147

147:                                              ; preds = %139, %132
  %148 = phi i1 [ false, %132 ], [ %146, %139 ], !dbg !2493
  %149 = zext i1 %148 to i32, !dbg !2491
  call void @_Z7_AssertiPKcS0_i(i32 noundef %149, ptr noundef @.str.2, ptr noundef @.str.1, i32 noundef 544), !dbg !2491
  %150 = load i32, ptr %1, align 4, !dbg !2494
  %151 = sext i32 %150 to i64, !dbg !2495
  %152 = getelementptr inbounds [3600 x i16], ptr %4, i64 0, i64 %151, !dbg !2495
  %153 = load i16, ptr %152, align 2, !dbg !2495
  %154 = sext i16 %153 to i64, !dbg !2496
  %155 = getelementptr inbounds [3600 x i32], ptr @Dynamic_light, i64 0, i64 %154, !dbg !2496
  store i32 0, ptr %155, align 4, !dbg !2497
  br label %156, !dbg !2498

156:                                              ; preds = %147
  %157 = load i32, ptr %1, align 4, !dbg !2499
  %158 = add nsw i32 %157, 2, !dbg !2499
  store i32 %158, ptr %1, align 4, !dbg !2499
  br label %128, !dbg !2500, !llvm.loop !2501

159:                                              ; preds = %128
  br label %160

160:                                              ; preds = %159, %124
  %161 = load i32, ptr %3, align 4, !dbg !2503
  %162 = getelementptr inbounds [3600 x i16], ptr %4, i64 0, i64 0, !dbg !2504
  call void @_Z23cast_muzzle_flash_lightiPs(i32 noundef %161, ptr noundef %162), !dbg !2505
  store i32 0, ptr %2, align 4, !dbg !2506
  br label %163, !dbg !2508

163:                                              ; preds = %171, %160
  %164 = load i32, ptr %2, align 4, !dbg !2509
  %165 = load i32, ptr @Highest_object_index, align 4, !dbg !2511
  %166 = icmp sle i32 %164, %165, !dbg !2512
  br i1 %166, label %167, label %174, !dbg !2513

167:                                              ; preds = %163
  %168 = load i32, ptr %2, align 4, !dbg !2514
  %169 = sext i32 %168 to i64, !dbg !2515
  %170 = getelementptr inbounds [350 x i8], ptr %9, i64 0, i64 %169, !dbg !2515
  store i8 0, ptr %170, align 1, !dbg !2516
  br label %171, !dbg !2515

171:                                              ; preds = %167
  %172 = load i32, ptr %2, align 4, !dbg !2517
  %173 = add nsw i32 %172, 1, !dbg !2517
  store i32 %173, ptr %2, align 4, !dbg !2517
  br label %163, !dbg !2518, !llvm.loop !2519

174:                                              ; preds = %163
  store i32 0, ptr %6, align 4, !dbg !2521
  br label %175, !dbg !2523

175:                                              ; preds = %226, %174
  %176 = load i32, ptr %6, align 4, !dbg !2524
  %177 = load i32, ptr @N_render_segs, align 4, !dbg !2526
  %178 = icmp slt i32 %176, %177, !dbg !2527
  br i1 %178, label %179, label %229, !dbg !2528

179:                                              ; preds = %175
    #dbg_declare(ptr %13, !2529, !DIExpression(), !2531)
  %180 = load i32, ptr %6, align 4, !dbg !2532
  %181 = sext i32 %180 to i64, !dbg !2533
  %182 = getelementptr inbounds [500 x i16], ptr @Render_list, i64 0, i64 %181, !dbg !2533
  %183 = load i16, ptr %182, align 2, !dbg !2533
  %184 = sext i16 %183 to i32, !dbg !2533
  store i32 %184, ptr %13, align 4, !dbg !2531
  %185 = load i32, ptr %13, align 4, !dbg !2534
  %186 = sext i32 %185 to i64, !dbg !2535
  %187 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %186, !dbg !2535
  %188 = getelementptr inbounds nuw %struct.segment, ptr %187, i32 0, i32 3, !dbg !2536
  %189 = load i32, ptr %188, align 4, !dbg !2536
  store i32 %189, ptr %2, align 4, !dbg !2537
  br label %190, !dbg !2538

190:                                              ; preds = %220, %179
  %191 = load i32, ptr %2, align 4, !dbg !2539
  %192 = icmp ne i32 %191, -1, !dbg !2540
  br i1 %192, label %193, label %225, !dbg !2538

193:                                              ; preds = %190
    #dbg_declare(ptr %14, !2541, !DIExpression(), !2543)
  %194 = load i32, ptr %2, align 4, !dbg !2544
  %195 = sext i32 %194 to i64, !dbg !2545
  %196 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %195, !dbg !2545
  store ptr %196, ptr %14, align 8, !dbg !2543
    #dbg_declare(ptr %15, !2546, !DIExpression(), !2547)
  %197 = load ptr, ptr %14, align 8, !dbg !2548
  %198 = getelementptr inbounds nuw %struct.object, ptr %197, i32 0, i32 11, !dbg !2549
  store ptr %198, ptr %15, align 8, !dbg !2547
    #dbg_declare(ptr %16, !2550, !DIExpression(), !2551)
  %199 = load i32, ptr %2, align 4, !dbg !2552
  %200 = call noundef i32 @_Z23compute_light_intensityi(i32 noundef %199), !dbg !2553
  store i32 %200, ptr %16, align 4, !dbg !2554
  %201 = load i32, ptr %16, align 4, !dbg !2555
  %202 = icmp ne i32 %201, 0, !dbg !2555
  br i1 %202, label %203, label %220, !dbg !2555

203:                                              ; preds = %193
  %204 = load i32, ptr %16, align 4, !dbg !2557
  %205 = load ptr, ptr %14, align 8, !dbg !2559
  %206 = getelementptr inbounds nuw %struct.object, ptr %205, i32 0, i32 9, !dbg !2560
  %207 = load i16, ptr %206, align 2, !dbg !2560
  %208 = sext i16 %207 to i32, !dbg !2559
  %209 = load ptr, ptr %15, align 8, !dbg !2561
  %210 = load i32, ptr %3, align 4, !dbg !2562
  %211 = getelementptr inbounds [3600 x i16], ptr %4, i64 0, i64 0, !dbg !2563
  %212 = load ptr, ptr %14, align 8, !dbg !2564
  %213 = ptrtoint ptr %212 to i64, !dbg !2565
  %214 = sub i64 %213, ptrtoint (ptr @Objects to i64), !dbg !2565
  %215 = sdiv exact i64 %214, 268, !dbg !2565
  %216 = trunc i64 %215 to i32, !dbg !2564
  call void @_Z11apply_lightiiP10vms_vectoriPsi(i32 noundef %204, i32 noundef %208, ptr noundef %209, i32 noundef %210, ptr noundef %211, i32 noundef %216), !dbg !2566
  %217 = load i32, ptr %2, align 4, !dbg !2567
  %218 = sext i32 %217 to i64, !dbg !2568
  %219 = getelementptr inbounds [350 x i8], ptr %9, i64 0, i64 %218, !dbg !2568
  store i8 1, ptr %219, align 1, !dbg !2569
  br label %220, !dbg !2570

220:                                              ; preds = %203, %193
  %221 = load ptr, ptr %14, align 8, !dbg !2571
  %222 = getelementptr inbounds nuw %struct.object, ptr %221, i32 0, i32 3, !dbg !2572
  %223 = load i16, ptr %222, align 2, !dbg !2572
  %224 = sext i16 %223 to i32, !dbg !2571
  store i32 %224, ptr %2, align 4, !dbg !2573
  br label %190, !dbg !2538, !llvm.loop !2574

225:                                              ; preds = %190
  br label %226, !dbg !2576

226:                                              ; preds = %225
  %227 = load i32, ptr %6, align 4, !dbg !2577
  %228 = add nsw i32 %227, 1, !dbg !2577
  store i32 %228, ptr %6, align 4, !dbg !2577
  br label %175, !dbg !2578, !llvm.loop !2579

229:                                              ; preds = %175
  store i32 0, ptr %2, align 4, !dbg !2581
  br label %230, !dbg !2583

230:                                              ; preds = %294, %229
  %231 = load i32, ptr %2, align 4, !dbg !2584
  %232 = load i32, ptr @Highest_object_index, align 4, !dbg !2586
  %233 = icmp sle i32 %231, %232, !dbg !2587
  br i1 %233, label %234, label %297, !dbg !2588

234:                                              ; preds = %230
  %235 = load i32, ptr %2, align 4, !dbg !2589
  %236 = sext i32 %235 to i64, !dbg !2592
  %237 = getelementptr inbounds [350 x i8], ptr @Lighting_objects, i64 0, i64 %236, !dbg !2592
  %238 = load i8, ptr %237, align 1, !dbg !2592
  %239 = icmp ne i8 %238, 0, !dbg !2593
  br i1 %239, label %250, label %240, !dbg !2594

240:                                              ; preds = %234
  %241 = load i32, ptr @Game_mode, align 4, !dbg !2595
  %242 = and i32 %241, 38, !dbg !2596
  %243 = icmp ne i32 %242, 0, !dbg !2597
  br i1 %243, label %244, label %285, !dbg !2598

244:                                              ; preds = %240
  %245 = load i32, ptr %2, align 4, !dbg !2599
  %246 = load i32, ptr @FrameCount, align 4, !dbg !2600
  %247 = xor i32 %245, %246, !dbg !2601
  %248 = and i32 %247, 3, !dbg !2602
  %249 = icmp eq i32 %248, 0, !dbg !2603
  br i1 %249, label %250, label %285, !dbg !2594

250:                                              ; preds = %244, %234
  %251 = load i32, ptr %2, align 4, !dbg !2604
  %252 = sext i32 %251 to i64, !dbg !2607
  %253 = getelementptr inbounds [350 x i8], ptr %9, i64 0, i64 %252, !dbg !2607
  %254 = load i8, ptr %253, align 1, !dbg !2607
  %255 = icmp ne i8 %254, 0, !dbg !2607
  br i1 %255, label %284, label %256, !dbg !2608

256:                                              ; preds = %250
    #dbg_declare(ptr %17, !2609, !DIExpression(), !2611)
  %257 = load i32, ptr %2, align 4, !dbg !2612
  %258 = sext i32 %257 to i64, !dbg !2613
  %259 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %258, !dbg !2613
  store ptr %259, ptr %17, align 8, !dbg !2611
    #dbg_declare(ptr %18, !2614, !DIExpression(), !2615)
  %260 = load ptr, ptr %17, align 8, !dbg !2616
  %261 = getelementptr inbounds nuw %struct.object, ptr %260, i32 0, i32 11, !dbg !2617
  store ptr %261, ptr %18, align 8, !dbg !2615
    #dbg_declare(ptr %19, !2618, !DIExpression(), !2619)
  %262 = load i32, ptr %2, align 4, !dbg !2620
  %263 = call noundef i32 @_Z23compute_light_intensityi(i32 noundef %262), !dbg !2621
  store i32 %263, ptr %19, align 4, !dbg !2622
  %264 = load i32, ptr %19, align 4, !dbg !2623
  %265 = icmp ne i32 %264, 0, !dbg !2623
  br i1 %265, label %266, label %279, !dbg !2623

266:                                              ; preds = %256
  %267 = load i32, ptr %19, align 4, !dbg !2625
  %268 = load ptr, ptr %17, align 8, !dbg !2627
  %269 = getelementptr inbounds nuw %struct.object, ptr %268, i32 0, i32 9, !dbg !2628
  %270 = load i16, ptr %269, align 2, !dbg !2628
  %271 = sext i16 %270 to i32, !dbg !2627
  %272 = load ptr, ptr %18, align 8, !dbg !2629
  %273 = load i32, ptr %3, align 4, !dbg !2630
  %274 = getelementptr inbounds [3600 x i16], ptr %4, i64 0, i64 0, !dbg !2631
  %275 = load i32, ptr %2, align 4, !dbg !2632
  call void @_Z11apply_lightiiP10vms_vectoriPsi(i32 noundef %267, i32 noundef %271, ptr noundef %272, i32 noundef %273, ptr noundef %274, i32 noundef %275), !dbg !2633
  %276 = load i32, ptr %2, align 4, !dbg !2634
  %277 = sext i32 %276 to i64, !dbg !2635
  %278 = getelementptr inbounds [350 x i8], ptr @Lighting_objects, i64 0, i64 %277, !dbg !2635
  store i8 1, ptr %278, align 1, !dbg !2636
  br label %283, !dbg !2637

279:                                              ; preds = %256
  %280 = load i32, ptr %2, align 4, !dbg !2638
  %281 = sext i32 %280 to i64, !dbg !2639
  %282 = getelementptr inbounds [350 x i8], ptr @Lighting_objects, i64 0, i64 %281, !dbg !2639
  store i8 0, ptr %282, align 1, !dbg !2640
  br label %283

283:                                              ; preds = %279, %266
  br label %284, !dbg !2641

284:                                              ; preds = %283, %250
  br label %293, !dbg !2642

285:                                              ; preds = %244, %240
  %286 = load i32, ptr %2, align 4, !dbg !2643
  %287 = sext i32 %286 to i64, !dbg !2645
  %288 = getelementptr inbounds [350 x i8], ptr %9, i64 0, i64 %287, !dbg !2645
  %289 = load i8, ptr %288, align 1, !dbg !2645
  %290 = load i32, ptr %2, align 4, !dbg !2646
  %291 = sext i32 %290 to i64, !dbg !2647
  %292 = getelementptr inbounds [350 x i8], ptr @Lighting_objects, i64 0, i64 %291, !dbg !2647
  store i8 %289, ptr %292, align 1, !dbg !2648
  br label %293

293:                                              ; preds = %285, %284
  br label %294, !dbg !2649

294:                                              ; preds = %293
  %295 = load i32, ptr %2, align 4, !dbg !2650
  %296 = add nsw i32 %295, 1, !dbg !2650
  store i32 %296, ptr %2, align 4, !dbg !2650
  br label %230, !dbg !2651, !llvm.loop !2652

297:                                              ; preds = %230
  br label %298, !dbg !2654

298:                                              ; preds = %297, %22
  ret void, !dbg !2654
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

declare void @_Z7_AssertiPKcS0_i(i32 noundef, ptr noundef, ptr noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define void @_Z23toggle_headlight_activev() #3 !dbg !2655 {
  %1 = load i32, ptr @Player_num, align 4, !dbg !2656
  %2 = sext i32 %1 to i64, !dbg !2658
  %3 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %2, !dbg !2658
  %4 = getelementptr inbounds nuw %struct.player, ptr %3, i32 0, i32 7, !dbg !2659
  %5 = load i32, ptr %4, align 4, !dbg !2659
  %6 = and i32 %5, 8192, !dbg !2660
  %7 = icmp ne i32 %6, 0, !dbg !2658
  br i1 %7, label %8, label %15, !dbg !2658

8:                                                ; preds = %0
  %9 = load i32, ptr @Player_num, align 4, !dbg !2661
  %10 = sext i32 %9 to i64, !dbg !2663
  %11 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %10, !dbg !2663
  %12 = getelementptr inbounds nuw %struct.player, ptr %11, i32 0, i32 7, !dbg !2664
  %13 = load i32, ptr %12, align 4, !dbg !2665
  %14 = xor i32 %13, 16384, !dbg !2665
  store i32 %14, ptr %12, align 4, !dbg !2665
  br label %15, !dbg !2666

15:                                               ; preds = %8, %0
  ret void, !dbg !2667
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z33compute_headlight_light_on_objectP6object(ptr noundef %0) #0 !dbg !2668 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca %struct.vms_vector, align 4
  %9 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !2671, !DIExpression(), !2672)
    #dbg_declare(ptr %4, !2673, !DIExpression(), !2674)
    #dbg_declare(ptr %5, !2675, !DIExpression(), !2676)
  %10 = load ptr, ptr %3, align 8, !dbg !2677
  %11 = getelementptr inbounds nuw %struct.object, ptr %10, i32 0, i32 1, !dbg !2679
  %12 = load i8, ptr %11, align 4, !dbg !2679
  %13 = zext i8 %12 to i32, !dbg !2677
  %14 = icmp ne i32 %13, 2, !dbg !2680
  br i1 %14, label %15, label %22, !dbg !2681

15:                                               ; preds = %1
  %16 = load ptr, ptr %3, align 8, !dbg !2682
  %17 = getelementptr inbounds nuw %struct.object, ptr %16, i32 0, i32 1, !dbg !2683
  %18 = load i8, ptr %17, align 4, !dbg !2683
  %19 = zext i8 %18 to i32, !dbg !2682
  %20 = icmp ne i32 %19, 4, !dbg !2684
  br i1 %20, label %21, label %22, !dbg !2681

21:                                               ; preds = %15
  store i32 0, ptr %2, align 4, !dbg !2685
  br label %68, !dbg !2685

22:                                               ; preds = %15, %1
  store i32 0, ptr %5, align 4, !dbg !2686
  store i32 0, ptr %4, align 4, !dbg !2687
  br label %23, !dbg !2689

23:                                               ; preds = %63, %22
  %24 = load i32, ptr %4, align 4, !dbg !2690
  %25 = load i32, ptr @Num_headlights, align 4, !dbg !2692
  %26 = icmp slt i32 %24, %25, !dbg !2693
  br i1 %26, label %27, label %66, !dbg !2694

27:                                               ; preds = %23
    #dbg_declare(ptr %6, !2695, !DIExpression(), !2697)
    #dbg_declare(ptr %7, !2698, !DIExpression(), !2699)
    #dbg_declare(ptr %8, !2700, !DIExpression(), !2701)
    #dbg_declare(ptr %9, !2702, !DIExpression(), !2703)
  %28 = load i32, ptr %4, align 4, !dbg !2704
  %29 = sext i32 %28 to i64, !dbg !2705
  %30 = getelementptr inbounds [8 x ptr], ptr @Headlights, i64 0, i64 %29, !dbg !2705
  %31 = load ptr, ptr %30, align 8, !dbg !2705
  store ptr %31, ptr %9, align 8, !dbg !2706
  %32 = load ptr, ptr %3, align 8, !dbg !2707
  %33 = getelementptr inbounds nuw %struct.object, ptr %32, i32 0, i32 11, !dbg !2708
  %34 = load ptr, ptr %9, align 8, !dbg !2709
  %35 = getelementptr inbounds nuw %struct.object, ptr %34, i32 0, i32 11, !dbg !2710
  %36 = call noundef ptr @_Z10vm_vec_subP10vms_vectorS0_S0_(ptr noundef %8, ptr noundef %33, ptr noundef %35), !dbg !2711
  %37 = call noundef i32 @_Z22vm_vec_normalize_quickP10vms_vector(ptr noundef %8), !dbg !2712
  store i32 %37, ptr %7, align 4, !dbg !2713
  %38 = load i32, ptr %7, align 4, !dbg !2714
  %39 = icmp sgt i32 %38, 0, !dbg !2716
  br i1 %39, label %40, label %62, !dbg !2716

40:                                               ; preds = %27
  %41 = load ptr, ptr %9, align 8, !dbg !2717
  %42 = getelementptr inbounds nuw %struct.object, ptr %41, i32 0, i32 12, !dbg !2717
  %43 = getelementptr inbounds nuw %struct.vms_matrix, ptr %42, i32 0, i32 2, !dbg !2717
  %44 = call noundef i32 @_Z14vm_vec_dotprodP10vms_vectorS0_(ptr noundef %43, ptr noundef %8), !dbg !2717
  store i32 %44, ptr %6, align 4, !dbg !2719
  %45 = load i32, ptr %6, align 4, !dbg !2720
  %46 = icmp slt i32 %45, 32768, !dbg !2722
  br i1 %46, label %47, label %53, !dbg !2722

47:                                               ; preds = %40
  %48 = load i32, ptr %7, align 4, !dbg !2723
  %49 = call noundef i32 @_Z6fixmulii(i32 noundef 655360, i32 noundef %48), !dbg !2724
  %50 = call noundef i32 @_Z6fixdivii(i32 noundef 655360, i32 noundef %49), !dbg !2725
  %51 = load i32, ptr %5, align 4, !dbg !2726
  %52 = add nsw i32 %51, %50, !dbg !2726
  store i32 %52, ptr %5, align 4, !dbg !2726
  br label %61, !dbg !2727

53:                                               ; preds = %40
  %54 = load i32, ptr %6, align 4, !dbg !2728
  %55 = load i32, ptr %6, align 4, !dbg !2729
  %56 = call noundef i32 @_Z6fixmulii(i32 noundef %54, i32 noundef %55), !dbg !2730
  %57 = call noundef i32 @_Z6fixmulii(i32 noundef %56, i32 noundef 655360), !dbg !2731
  %58 = sdiv i32 %57, 8, !dbg !2732
  %59 = load i32, ptr %5, align 4, !dbg !2733
  %60 = add nsw i32 %59, %58, !dbg !2733
  store i32 %60, ptr %5, align 4, !dbg !2733
  br label %61

61:                                               ; preds = %53, %47
  br label %62, !dbg !2734

62:                                               ; preds = %61, %27
  br label %63, !dbg !2735

63:                                               ; preds = %62
  %64 = load i32, ptr %4, align 4, !dbg !2736
  %65 = add nsw i32 %64, 1, !dbg !2736
  store i32 %65, ptr %4, align 4, !dbg !2736
  br label %23, !dbg !2737, !llvm.loop !2738

66:                                               ; preds = %23
  %67 = load i32, ptr %5, align 4, !dbg !2740
  store i32 %67, ptr %2, align 4, !dbg !2741
  br label %68, !dbg !2741

68:                                               ; preds = %66, %21
  %69 = load i32, ptr %2, align 4, !dbg !2742
  ret i32 %69, !dbg !2742
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define noundef i32 @_Z25compute_seg_dynamic_lighti(i32 noundef %0) #3 !dbg !2743 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store i32 %0, ptr %2, align 4
    #dbg_declare(ptr %2, !2744, !DIExpression(), !2745)
    #dbg_declare(ptr %3, !2746, !DIExpression(), !2747)
    #dbg_declare(ptr %4, !2748, !DIExpression(), !2785)
    #dbg_declare(ptr %5, !2786, !DIExpression(), !2787)
  %6 = load i32, ptr %2, align 4, !dbg !2788
  %7 = sext i32 %6 to i64, !dbg !2789
  %8 = getelementptr inbounds [0 x %struct.segment], ptr @Segments, i64 0, i64 %7, !dbg !2789
  store ptr %8, ptr %4, align 8, !dbg !2790
  %9 = load ptr, ptr %4, align 8, !dbg !2791
  %10 = getelementptr inbounds nuw %struct.segment, ptr %9, i32 0, i32 2, !dbg !2792
  %11 = getelementptr inbounds [8 x i16], ptr %10, i64 0, i64 0, !dbg !2791
  store ptr %11, ptr %5, align 8, !dbg !2793
  store i32 0, ptr %3, align 4, !dbg !2794
  %12 = load ptr, ptr %5, align 8, !dbg !2795
  %13 = getelementptr inbounds nuw i16, ptr %12, i32 1, !dbg !2795
  store ptr %13, ptr %5, align 8, !dbg !2795
  %14 = load i16, ptr %12, align 2, !dbg !2796
  %15 = sext i16 %14 to i64, !dbg !2797
  %16 = getelementptr inbounds [3600 x i32], ptr @Dynamic_light, i64 0, i64 %15, !dbg !2797
  %17 = load i32, ptr %16, align 4, !dbg !2797
  %18 = load i32, ptr %3, align 4, !dbg !2798
  %19 = add nsw i32 %18, %17, !dbg !2798
  store i32 %19, ptr %3, align 4, !dbg !2798
  %20 = load ptr, ptr %5, align 8, !dbg !2799
  %21 = getelementptr inbounds nuw i16, ptr %20, i32 1, !dbg !2799
  store ptr %21, ptr %5, align 8, !dbg !2799
  %22 = load i16, ptr %20, align 2, !dbg !2800
  %23 = sext i16 %22 to i64, !dbg !2801
  %24 = getelementptr inbounds [3600 x i32], ptr @Dynamic_light, i64 0, i64 %23, !dbg !2801
  %25 = load i32, ptr %24, align 4, !dbg !2801
  %26 = load i32, ptr %3, align 4, !dbg !2802
  %27 = add nsw i32 %26, %25, !dbg !2802
  store i32 %27, ptr %3, align 4, !dbg !2802
  %28 = load ptr, ptr %5, align 8, !dbg !2803
  %29 = getelementptr inbounds nuw i16, ptr %28, i32 1, !dbg !2803
  store ptr %29, ptr %5, align 8, !dbg !2803
  %30 = load i16, ptr %28, align 2, !dbg !2804
  %31 = sext i16 %30 to i64, !dbg !2805
  %32 = getelementptr inbounds [3600 x i32], ptr @Dynamic_light, i64 0, i64 %31, !dbg !2805
  %33 = load i32, ptr %32, align 4, !dbg !2805
  %34 = load i32, ptr %3, align 4, !dbg !2806
  %35 = add nsw i32 %34, %33, !dbg !2806
  store i32 %35, ptr %3, align 4, !dbg !2806
  %36 = load ptr, ptr %5, align 8, !dbg !2807
  %37 = getelementptr inbounds nuw i16, ptr %36, i32 1, !dbg !2807
  store ptr %37, ptr %5, align 8, !dbg !2807
  %38 = load i16, ptr %36, align 2, !dbg !2808
  %39 = sext i16 %38 to i64, !dbg !2809
  %40 = getelementptr inbounds [3600 x i32], ptr @Dynamic_light, i64 0, i64 %39, !dbg !2809
  %41 = load i32, ptr %40, align 4, !dbg !2809
  %42 = load i32, ptr %3, align 4, !dbg !2810
  %43 = add nsw i32 %42, %41, !dbg !2810
  store i32 %43, ptr %3, align 4, !dbg !2810
  %44 = load ptr, ptr %5, align 8, !dbg !2811
  %45 = getelementptr inbounds nuw i16, ptr %44, i32 1, !dbg !2811
  store ptr %45, ptr %5, align 8, !dbg !2811
  %46 = load i16, ptr %44, align 2, !dbg !2812
  %47 = sext i16 %46 to i64, !dbg !2813
  %48 = getelementptr inbounds [3600 x i32], ptr @Dynamic_light, i64 0, i64 %47, !dbg !2813
  %49 = load i32, ptr %48, align 4, !dbg !2813
  %50 = load i32, ptr %3, align 4, !dbg !2814
  %51 = add nsw i32 %50, %49, !dbg !2814
  store i32 %51, ptr %3, align 4, !dbg !2814
  %52 = load ptr, ptr %5, align 8, !dbg !2815
  %53 = getelementptr inbounds nuw i16, ptr %52, i32 1, !dbg !2815
  store ptr %53, ptr %5, align 8, !dbg !2815
  %54 = load i16, ptr %52, align 2, !dbg !2816
  %55 = sext i16 %54 to i64, !dbg !2817
  %56 = getelementptr inbounds [3600 x i32], ptr @Dynamic_light, i64 0, i64 %55, !dbg !2817
  %57 = load i32, ptr %56, align 4, !dbg !2817
  %58 = load i32, ptr %3, align 4, !dbg !2818
  %59 = add nsw i32 %58, %57, !dbg !2818
  store i32 %59, ptr %3, align 4, !dbg !2818
  %60 = load ptr, ptr %5, align 8, !dbg !2819
  %61 = getelementptr inbounds nuw i16, ptr %60, i32 1, !dbg !2819
  store ptr %61, ptr %5, align 8, !dbg !2819
  %62 = load i16, ptr %60, align 2, !dbg !2820
  %63 = sext i16 %62 to i64, !dbg !2821
  %64 = getelementptr inbounds [3600 x i32], ptr @Dynamic_light, i64 0, i64 %63, !dbg !2821
  %65 = load i32, ptr %64, align 4, !dbg !2821
  %66 = load i32, ptr %3, align 4, !dbg !2822
  %67 = add nsw i32 %66, %65, !dbg !2822
  store i32 %67, ptr %3, align 4, !dbg !2822
  %68 = load ptr, ptr %5, align 8, !dbg !2823
  %69 = load i16, ptr %68, align 2, !dbg !2824
  %70 = sext i16 %69 to i64, !dbg !2825
  %71 = getelementptr inbounds [3600 x i32], ptr @Dynamic_light, i64 0, i64 %70, !dbg !2825
  %72 = load i32, ptr %71, align 4, !dbg !2825
  %73 = load i32, ptr %3, align 4, !dbg !2826
  %74 = add nsw i32 %73, %72, !dbg !2826
  store i32 %74, ptr %3, align 4, !dbg !2826
  %75 = load i32, ptr %3, align 4, !dbg !2827
  %76 = ashr i32 %75, 3, !dbg !2828
  ret i32 %76, !dbg !2829
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define void @_Z20start_lighting_frameP6object(ptr noundef %0) #3 !dbg !2830 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2833, !DIExpression(), !2834)
  %3 = load ptr, ptr %2, align 8, !dbg !2835
  %4 = load ptr, ptr @old_viewer, align 8, !dbg !2836
  %5 = icmp ne ptr %3, %4, !dbg !2837
  %6 = zext i1 %5 to i32, !dbg !2838
  store i32 %6, ptr @reset_lighting_hack, align 4, !dbg !2839
  %7 = load ptr, ptr %2, align 8, !dbg !2840
  store ptr %7, ptr @old_viewer, align 8, !dbg !2841
  ret void, !dbg !2842
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z20compute_object_lightP6objectP10vms_vector(ptr noundef %0, ptr noundef %1) #0 !dbg !2843 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca %struct.g3s_point, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !2846, !DIExpression(), !2847)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !2848, !DIExpression(), !2849)
    #dbg_declare(ptr %5, !2850, !DIExpression(), !2851)
    #dbg_declare(ptr %6, !2852, !DIExpression(), !2866)
    #dbg_declare(ptr %7, !2867, !DIExpression(), !2868)
  %10 = load ptr, ptr %3, align 8, !dbg !2869
  %11 = ptrtoint ptr %10 to i64, !dbg !2870
  %12 = sub i64 %11, ptrtoint (ptr @Objects to i64), !dbg !2870
  %13 = sdiv exact i64 %12, 268, !dbg !2870
  %14 = trunc i64 %13 to i32, !dbg !2869
  store i32 %14, ptr %7, align 4, !dbg !2868
  %15 = load ptr, ptr %4, align 8, !dbg !2871
  %16 = icmp ne ptr %15, null, !dbg !2871
  br i1 %16, label %22, label %17, !dbg !2873

17:                                               ; preds = %2
  %18 = load ptr, ptr %3, align 8, !dbg !2874
  %19 = getelementptr inbounds nuw %struct.object, ptr %18, i32 0, i32 11, !dbg !2876
  %20 = call noundef zeroext i8 @_Z15g3_rotate_pointP9g3s_pointP10vms_vector(ptr noundef %6, ptr noundef %19), !dbg !2877
  %21 = getelementptr inbounds nuw %struct.g3s_point, ptr %6, i32 0, i32 0, !dbg !2878
  store ptr %21, ptr %4, align 8, !dbg !2879
  br label %22, !dbg !2880

22:                                               ; preds = %17, %2
  %23 = load ptr, ptr %3, align 8, !dbg !2881
  %24 = getelementptr inbounds nuw %struct.object, ptr %23, i32 0, i32 9, !dbg !2882
  %25 = load i16, ptr %24, align 2, !dbg !2882
  %26 = sext i16 %25 to i64, !dbg !2883
  %27 = getelementptr inbounds [0 x %struct.segment2], ptr @Segment2s, i64 0, i64 %26, !dbg !2883
  %28 = getelementptr inbounds nuw %struct.segment2, ptr %27, i32 0, i32 4, !dbg !2884
  %29 = load i32, ptr %28, align 4, !dbg !2884
  store i32 %29, ptr %5, align 4, !dbg !2885
  %30 = load i32, ptr @reset_lighting_hack, align 4, !dbg !2886
  %31 = icmp ne i32 %30, 0, !dbg !2886
  br i1 %31, label %79, label %32, !dbg !2888

32:                                               ; preds = %22
  %33 = load i32, ptr %7, align 4, !dbg !2889
  %34 = sext i32 %33 to i64, !dbg !2890
  %35 = getelementptr inbounds [350 x i32], ptr @object_sig, i64 0, i64 %34, !dbg !2890
  %36 = load i32, ptr %35, align 4, !dbg !2890
  %37 = load ptr, ptr %3, align 8, !dbg !2891
  %38 = getelementptr inbounds nuw %struct.object, ptr %37, i32 0, i32 0, !dbg !2892
  %39 = load i32, ptr %38, align 4, !dbg !2892
  %40 = icmp eq i32 %36, %39, !dbg !2893
  br i1 %40, label %41, label %79, !dbg !2888

41:                                               ; preds = %32
    #dbg_declare(ptr %8, !2894, !DIExpression(), !2896)
    #dbg_declare(ptr %9, !2897, !DIExpression(), !2898)
  %42 = load i32, ptr %5, align 4, !dbg !2899
  %43 = load i32, ptr %7, align 4, !dbg !2900
  %44 = sext i32 %43 to i64, !dbg !2901
  %45 = getelementptr inbounds [350 x i32], ptr @object_light, i64 0, i64 %44, !dbg !2901
  %46 = load i32, ptr %45, align 4, !dbg !2901
  %47 = sub nsw i32 %42, %46, !dbg !2902
  store i32 %47, ptr %8, align 4, !dbg !2903
  %48 = call noundef i32 @_Z3i2fi(i32 noundef 4), !dbg !2904
  %49 = load i32, ptr @FrameTime, align 4, !dbg !2905
  %50 = call noundef i32 @_Z6fixmulii(i32 noundef %48, i32 noundef %49), !dbg !2906
  store i32 %50, ptr %9, align 4, !dbg !2907
  %51 = load i32, ptr %8, align 4, !dbg !2908
  %52 = call i32 @llvm.abs.i32(i32 %51, i1 true), !dbg !2910
  %53 = load i32, ptr %9, align 4, !dbg !2911
  %54 = icmp sle i32 %52, %53, !dbg !2912
  br i1 %54, label %55, label %60, !dbg !2912

55:                                               ; preds = %41
  %56 = load i32, ptr %5, align 4, !dbg !2913
  %57 = load i32, ptr %7, align 4, !dbg !2914
  %58 = sext i32 %57 to i64, !dbg !2915
  %59 = getelementptr inbounds [350 x i32], ptr @object_light, i64 0, i64 %58, !dbg !2915
  store i32 %56, ptr %59, align 4, !dbg !2916
  br label %78, !dbg !2915

60:                                               ; preds = %41
  %61 = load i32, ptr %8, align 4, !dbg !2917
  %62 = icmp slt i32 %61, 0, !dbg !2919
  br i1 %62, label %63, label %70, !dbg !2919

63:                                               ; preds = %60
  %64 = load i32, ptr %9, align 4, !dbg !2920
  %65 = load i32, ptr %7, align 4, !dbg !2921
  %66 = sext i32 %65 to i64, !dbg !2922
  %67 = getelementptr inbounds [350 x i32], ptr @object_light, i64 0, i64 %66, !dbg !2922
  %68 = load i32, ptr %67, align 4, !dbg !2923
  %69 = sub nsw i32 %68, %64, !dbg !2923
  store i32 %69, ptr %67, align 4, !dbg !2923
  store i32 %69, ptr %5, align 4, !dbg !2924
  br label %77, !dbg !2925

70:                                               ; preds = %60
  %71 = load i32, ptr %9, align 4, !dbg !2926
  %72 = load i32, ptr %7, align 4, !dbg !2927
  %73 = sext i32 %72 to i64, !dbg !2928
  %74 = getelementptr inbounds [350 x i32], ptr @object_light, i64 0, i64 %73, !dbg !2928
  %75 = load i32, ptr %74, align 4, !dbg !2929
  %76 = add nsw i32 %75, %71, !dbg !2929
  store i32 %76, ptr %74, align 4, !dbg !2929
  store i32 %76, ptr %5, align 4, !dbg !2930
  br label %77

77:                                               ; preds = %70, %63
  br label %78

78:                                               ; preds = %77, %55
  br label %90, !dbg !2931

79:                                               ; preds = %32, %22
  %80 = load ptr, ptr %3, align 8, !dbg !2932
  %81 = getelementptr inbounds nuw %struct.object, ptr %80, i32 0, i32 0, !dbg !2934
  %82 = load i32, ptr %81, align 4, !dbg !2934
  %83 = load i32, ptr %7, align 4, !dbg !2935
  %84 = sext i32 %83 to i64, !dbg !2936
  %85 = getelementptr inbounds [350 x i32], ptr @object_sig, i64 0, i64 %84, !dbg !2936
  store i32 %82, ptr %85, align 4, !dbg !2937
  %86 = load i32, ptr %5, align 4, !dbg !2938
  %87 = load i32, ptr %7, align 4, !dbg !2939
  %88 = sext i32 %87 to i64, !dbg !2940
  %89 = getelementptr inbounds [350 x i32], ptr @object_light, i64 0, i64 %88, !dbg !2940
  store i32 %86, ptr %89, align 4, !dbg !2941
  br label %90

90:                                               ; preds = %79, %78
  %91 = load i32, ptr @CurrentLogicVersion, align 4, !dbg !2942
  %92 = icmp sge i32 %91, 1, !dbg !2944
  br i1 %92, label %93, label %98, !dbg !2944

93:                                               ; preds = %90
  %94 = load ptr, ptr %3, align 8, !dbg !2945
  %95 = call noundef i32 @_Z33compute_headlight_light_on_objectP6object(ptr noundef %94), !dbg !2946
  %96 = load i32, ptr %5, align 4, !dbg !2947
  %97 = add nsw i32 %96, %95, !dbg !2947
  store i32 %97, ptr %5, align 4, !dbg !2947
  br label %103, !dbg !2948

98:                                               ; preds = %90
  %99 = load ptr, ptr %4, align 8, !dbg !2949
  %100 = call noundef i32 @_Z23compute_headlight_lightP10vms_vectori(ptr noundef %99, i32 noundef 65536), !dbg !2950
  %101 = load i32, ptr %5, align 4, !dbg !2951
  %102 = add nsw i32 %101, %100, !dbg !2951
  store i32 %102, ptr %5, align 4, !dbg !2951
  br label %103

103:                                              ; preds = %98, %93
  %104 = load ptr, ptr %3, align 8, !dbg !2952
  %105 = getelementptr inbounds nuw %struct.object, ptr %104, i32 0, i32 9, !dbg !2953
  %106 = load i16, ptr %105, align 2, !dbg !2953
  %107 = sext i16 %106 to i32, !dbg !2952
  %108 = call noundef i32 @_Z25compute_seg_dynamic_lighti(i32 noundef %107), !dbg !2954
  %109 = load i32, ptr %5, align 4, !dbg !2955
  %110 = add nsw i32 %109, %108, !dbg !2955
  store i32 %110, ptr %5, align 4, !dbg !2955
  %111 = load i32, ptr %5, align 4, !dbg !2956
  ret i32 %111, !dbg !2957
}

declare noundef zeroext i8 @_Z15g3_rotate_pointP9g3s_pointP10vms_vector(ptr noundef, ptr noundef) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i32 @_Z23compute_headlight_lightP10vms_vectori(ptr noundef %0, i32 noundef %1) #0 !dbg !2958 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !2961, !DIExpression(), !2962)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !2963, !DIExpression(), !2964)
    #dbg_declare(ptr %5, !2965, !DIExpression(), !2966)
    #dbg_declare(ptr %6, !2967, !DIExpression(), !2968)
  store i32 0, ptr %6, align 4, !dbg !2968
  %11 = load i32, ptr @Beam_brightness, align 4, !dbg !2969
  store i32 %11, ptr %5, align 4, !dbg !2970
  %12 = load i32, ptr @Player_num, align 4, !dbg !2971
  %13 = sext i32 %12 to i64, !dbg !2973
  %14 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %13, !dbg !2973
  %15 = getelementptr inbounds nuw %struct.player, ptr %14, i32 0, i32 7, !dbg !2974
  %16 = load i32, ptr %15, align 4, !dbg !2974
  %17 = and i32 %16, 8192, !dbg !2975
  %18 = icmp ne i32 %17, 0, !dbg !2976
  br i1 %18, label %19, label %47, !dbg !2977

19:                                               ; preds = %2
  %20 = load i32, ptr @Player_num, align 4, !dbg !2978
  %21 = sext i32 %20 to i64, !dbg !2979
  %22 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %21, !dbg !2979
  %23 = getelementptr inbounds nuw %struct.player, ptr %22, i32 0, i32 7, !dbg !2980
  %24 = load i32, ptr %23, align 4, !dbg !2980
  %25 = and i32 %24, 16384, !dbg !2981
  %26 = icmp ne i32 %25, 0, !dbg !2982
  br i1 %26, label %27, label %47, !dbg !2983

27:                                               ; preds = %19
  %28 = load ptr, ptr @Viewer, align 8, !dbg !2984
  %29 = load i32, ptr @Player_num, align 4, !dbg !2985
  %30 = sext i32 %29 to i64, !dbg !2986
  %31 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %30, !dbg !2986
  %32 = getelementptr inbounds nuw %struct.player, ptr %31, i32 0, i32 4, !dbg !2987
  %33 = load i32, ptr %32, align 4, !dbg !2987
  %34 = sext i32 %33 to i64, !dbg !2988
  %35 = getelementptr inbounds [0 x %struct.object], ptr @Objects, i64 0, i64 %34, !dbg !2988
  %36 = icmp eq ptr %28, %35, !dbg !2989
  br i1 %36, label %37, label %47, !dbg !2990

37:                                               ; preds = %27
  %38 = load i32, ptr @Player_num, align 4, !dbg !2991
  %39 = sext i32 %38 to i64, !dbg !2992
  %40 = getelementptr inbounds [12 x %struct.player], ptr @Players, i64 0, i64 %39, !dbg !2992
  %41 = getelementptr inbounds nuw %struct.player, ptr %40, i32 0, i32 8, !dbg !2993
  %42 = load i32, ptr %41, align 4, !dbg !2993
  %43 = icmp sgt i32 %42, 0, !dbg !2994
  br i1 %43, label %44, label %47, !dbg !2990

44:                                               ; preds = %37
  %45 = load i32, ptr %5, align 4, !dbg !2995
  %46 = mul nsw i32 %45, 8, !dbg !2995
  store i32 %46, ptr %5, align 4, !dbg !2995
  store i32 1, ptr %6, align 4, !dbg !2997
  br label %47, !dbg !2998

47:                                               ; preds = %44, %37, %27, %19, %2
  %48 = load i32, ptr %5, align 4, !dbg !2999
  %49 = icmp ne i32 %48, 0, !dbg !2999
  br i1 %49, label %50, label %99, !dbg !2999

50:                                               ; preds = %47
    #dbg_declare(ptr %7, !3001, !DIExpression(), !3003)
  %51 = load ptr, ptr %3, align 8, !dbg !3004
  %52 = call noundef i32 @_Z16vm_vec_mag_quickP10vms_vector(ptr noundef %51), !dbg !3005
  store i32 %52, ptr %7, align 4, !dbg !3006
  %53 = load i32, ptr %7, align 4, !dbg !3007
  %54 = icmp sge i32 %53, 4194304, !dbg !3009
  br i1 %54, label %55, label %56, !dbg !3009

55:                                               ; preds = %50
  store i32 0, ptr %5, align 4, !dbg !3010
  br label %98, !dbg !3011

56:                                               ; preds = %50
    #dbg_declare(ptr %8, !3012, !DIExpression(), !3014)
    #dbg_declare(ptr %9, !3015, !DIExpression(), !3016)
  %57 = load i32, ptr %7, align 4, !dbg !3017
  %58 = sub nsw i32 4194304, %57, !dbg !3018
  %59 = ashr i32 %58, 6, !dbg !3019
  store i32 %59, ptr %8, align 4, !dbg !3020
  %60 = load i32, ptr %5, align 4, !dbg !3021
  %61 = load i32, ptr %8, align 4, !dbg !3022
  %62 = call noundef i32 @_Z6fixmulii(i32 noundef %60, i32 noundef %61), !dbg !3023
  store i32 %62, ptr %5, align 4, !dbg !3024
  %63 = load i32, ptr %4, align 4, !dbg !3025
  %64 = icmp slt i32 %63, 0, !dbg !3027
  br i1 %64, label %65, label %66, !dbg !3027

65:                                               ; preds = %56
  store i32 0, ptr %4, align 4, !dbg !3028
  br label %66, !dbg !3029

66:                                               ; preds = %65, %56
  %67 = load i32, ptr %4, align 4, !dbg !3030
  %68 = sdiv i32 %67, 2, !dbg !3031
  %69 = add nsw i32 16384, %68, !dbg !3032
  store i32 %69, ptr %9, align 4, !dbg !3033
  %70 = load i32, ptr %5, align 4, !dbg !3034
  %71 = load i32, ptr %9, align 4, !dbg !3035
  %72 = call noundef i32 @_Z6fixmulii(i32 noundef %70, i32 noundef %71), !dbg !3036
  store i32 %72, ptr %5, align 4, !dbg !3037
  %73 = load i32, ptr %6, align 4, !dbg !3038
  %74 = icmp ne i32 %73, 0, !dbg !3038
  br i1 %74, label %75, label %97, !dbg !3038

75:                                               ; preds = %66
    #dbg_declare(ptr %10, !3040, !DIExpression(), !3042)
  %76 = load i32, ptr %4, align 4, !dbg !3043
  %77 = icmp sgt i32 %76, 49152, !dbg !3045
  br i1 %77, label %78, label %96, !dbg !3046

78:                                               ; preds = %75
  %79 = load ptr, ptr %3, align 8, !dbg !3047
  %80 = getelementptr inbounds nuw %struct.vms_vector, ptr %79, i32 0, i32 2, !dbg !3048
  %81 = load i32, ptr %80, align 4, !dbg !3048
  %82 = call noundef i32 @_Z3i2fi(i32 noundef 12), !dbg !3049
  %83 = icmp sgt i32 %81, %82, !dbg !3050
  br i1 %83, label %84, label %96, !dbg !3046

84:                                               ; preds = %78
  %85 = load ptr, ptr %3, align 8, !dbg !3051
  %86 = getelementptr inbounds nuw %struct.vms_vector, ptr %85, i32 0, i32 2, !dbg !3053
  %87 = load i32, ptr %86, align 4, !dbg !3053
  %88 = load i32, ptr %7, align 4, !dbg !3054
  %89 = call noundef i32 @_Z6fixdivii(i32 noundef %87, i32 noundef %88), !dbg !3055
  store i32 %89, ptr %10, align 4, !dbg !3056
  %90 = load i32, ptr %10, align 4, !dbg !3057
  %91 = load i32, ptr %10, align 4, !dbg !3058
  %92 = call noundef i32 @_Z6fixmulii(i32 noundef %90, i32 noundef %91), !dbg !3059
  store i32 %92, ptr %10, align 4, !dbg !3060
  %93 = load i32, ptr %5, align 4, !dbg !3061
  %94 = load i32, ptr %10, align 4, !dbg !3062
  %95 = call noundef i32 @_Z6fixmulii(i32 noundef %93, i32 noundef %94), !dbg !3063
  store i32 %95, ptr %5, align 4, !dbg !3064
  br label %96, !dbg !3065

96:                                               ; preds = %84, %78, %75
  br label %97, !dbg !3066

97:                                               ; preds = %96, %66
  br label %98

98:                                               ; preds = %97, %55
  br label %99, !dbg !3067

99:                                               ; preds = %98, %47
  %100 = load i32, ptr %5, align 4, !dbg !3068
  ret i32 %100, !dbg !3069
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 4 dereferenceable(4) ptr @_ZNSt3__13maxB8ne200100IiNS_6__lessIvvEEEERKT_S5_S5_T0_(ptr noundef nonnull align 4 dereferenceable(4) %0, ptr noundef nonnull align 4 dereferenceable(4) %1) #0 !dbg !3070 {
  %3 = alloca %"struct.std::__1::__less", align 1
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !3080, !DIExpression(), !3081)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !3082, !DIExpression(), !3083)
    #dbg_declare(ptr %3, !3084, !DIExpression(), !3085)
  %6 = load ptr, ptr %4, align 8, !dbg !3086
  %7 = load ptr, ptr %5, align 8, !dbg !3087
  %8 = call noundef zeroext i1 @_ZNKSt3__16__lessIvvEclB8ne200100IiiEEbRKT_RKT0_(ptr noundef nonnull align 1 dereferenceable(1) %3, ptr noundef nonnull align 4 dereferenceable(4) %6, ptr noundef nonnull align 4 dereferenceable(4) %7), !dbg !3088
  br i1 %8, label %9, label %11, !dbg !3088

9:                                                ; preds = %2
  %10 = load ptr, ptr %5, align 8, !dbg !3089
  br label %13, !dbg !3088

11:                                               ; preds = %2
  %12 = load ptr, ptr %4, align 8, !dbg !3090
  br label %13, !dbg !3088

13:                                               ; preds = %11, %9
  %14 = phi ptr [ %10, %9 ], [ %12, %11 ], !dbg !3088
  ret ptr %14, !dbg !3091
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef zeroext i1 @_ZNKSt3__16__lessIvvEclB8ne200100IiiEEbRKT_RKT0_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef nonnull align 4 dereferenceable(4) %1, ptr noundef nonnull align 4 dereferenceable(4) %2) #3 !dbg !3092 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !3100, !DIExpression(), !3102)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !3103, !DIExpression(), !3104)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !3105, !DIExpression(), !3106)
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8, !dbg !3107
  %9 = load i32, ptr %8, align 4, !dbg !3107
  %10 = load ptr, ptr %6, align 8, !dbg !3108
  %11 = load i32, ptr %10, align 4, !dbg !3108
  %12 = icmp slt i32 %9, %11, !dbg !3109
  ret i1 %12, !dbg !3110
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 4 dereferenceable(4) ptr @_ZNSt3__13minB8ne200100IiNS_6__lessIvvEEEERKT_S5_S5_T0_(ptr noundef nonnull align 4 dereferenceable(4) %0, ptr noundef nonnull align 4 dereferenceable(4) %1) #3 !dbg !3111 {
  %3 = alloca %"struct.std::__1::__less", align 1
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !3112, !DIExpression(), !3113)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !3114, !DIExpression(), !3115)
    #dbg_declare(ptr %3, !3116, !DIExpression(), !3117)
  %6 = load ptr, ptr %5, align 8, !dbg !3118
  %7 = load ptr, ptr %4, align 8, !dbg !3119
  %8 = call noundef zeroext i1 @_ZNKSt3__16__lessIvvEclB8ne200100IiiEEbRKT_RKT0_(ptr noundef nonnull align 1 dereferenceable(1) %3, ptr noundef nonnull align 4 dereferenceable(4) %6, ptr noundef nonnull align 4 dereferenceable(4) %7), !dbg !3120
  br i1 %8, label %9, label %11, !dbg !3120

9:                                                ; preds = %2
  %10 = load ptr, ptr %5, align 8, !dbg !3121
  br label %13, !dbg !3120

11:                                               ; preds = %2
  %12 = load ptr, ptr %4, align 8, !dbg !3122
  br label %13, !dbg !3120

13:                                               ; preds = %11, %9
  %14 = phi ptr [ %10, %9 ], [ %12, %11 ], !dbg !3120
  ret ptr %14, !dbg !3123
}

attributes #0 = { mustprogress noinline ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { mustprogress noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: write) }

!llvm.module.flags = !{!1479, !1480, !1481, !1482, !1483, !1484, !1485}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!1486}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "Do_dynamic_light", scope: !2, file: !24, line: 39, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !3, producer: "Homebrew clang version 20.1.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !13, globals: !21, imports: !237, splitDebugInlining: false, nameTableKind: Apple, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk", sdk: "MacOSX15.sdk")
!3 = !DIFile(filename: "/Users/richard/code/ChocolateDescent/main_d2/lighting.cpp", directory: "/Users/richard/code/ChocolateDescent/build-c-ref", checksumkind: CSK_MD5, checksum: "3b1a75cc9164955a6e963098f4edea7e")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "LogicVer", file: !6, line: 56, baseType: !7, size: 32, flags: DIFlagEnumClass, elements: !8, identifier: "_ZTS8LogicVer")
!6 = !DIFile(filename: "main_d2/inferno.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "f9bd7760bcc54609c0547a3a7ca7ee90")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{!9, !10, !11, !12}
!9 = !DIEnumerator(name: "SHAREWARE", value: 0)
!10 = !DIEnumerator(name: "FULL_1_0", value: 1)
!11 = !DIEnumerator(name: "FULL_1_1", value: 2)
!12 = !DIEnumerator(name: "FULL_1_2", value: 3)
!13 = !{!14, !18}
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "fix", file: !15, line: 20, baseType: !16)
!15 = !DIFile(filename: "./fix/fix.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "c5006a11bf8b4cb7d963898499eda13a")
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !17, line: 30, baseType: !7)
!17 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int32_t.h", directory: "", checksumkind: CSK_MD5, checksum: "d23e8406e80ee79983f28509c741fa17")
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !19, line: 30, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int64_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e6d85c1a9e23dbf7518ce3b162aac800")
!20 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!21 = !{!0, !22, !28, !30, !35, !37, !39, !44, !52, !203, !205, !212, !217, !222, !224, !227, !230, !232, !234}
!22 = !DIGlobalVariableExpression(var: !23, expr: !DIExpression())
!23 = distinct !DIGlobalVariable(name: "Dynamic_light", scope: !2, file: !24, line: 42, type: !25, isLocal: false, isDefinition: true)
!24 = !DIFile(filename: "main_d2/lighting.cpp", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "3b1a75cc9164955a6e963098f4edea7e")
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 115200, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 3600)
!28 = !DIGlobalVariableExpression(var: !29, expr: !DIExpression())
!29 = distinct !DIGlobalVariable(name: "Lighting_frame_delta", scope: !2, file: !24, line: 48, type: !7, isLocal: false, isDefinition: true)
!30 = !DIGlobalVariableExpression(var: !31, expr: !DIExpression())
!31 = distinct !DIGlobalVariable(name: "Lighting_cache", scope: !2, file: !24, line: 50, type: !32, isLocal: false, isDefinition: true)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 131072, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 4096)
!35 = !DIGlobalVariableExpression(var: !36, expr: !DIExpression())
!36 = distinct !DIGlobalVariable(name: "Cache_hits", scope: !2, file: !24, line: 52, type: !7, isLocal: false, isDefinition: true)
!37 = !DIGlobalVariableExpression(var: !38, expr: !DIExpression())
!38 = distinct !DIGlobalVariable(name: "Cache_lookups", scope: !2, file: !24, line: 52, type: !7, isLocal: false, isDefinition: true)
!39 = !DIGlobalVariableExpression(var: !40, expr: !DIExpression())
!40 = distinct !DIGlobalVariable(name: "Obj_light_xlate", scope: !2, file: !24, line: 356, type: !41, isLocal: false, isDefinition: true)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 512, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 16)
!44 = !DIGlobalVariableExpression(var: !45, expr: !DIExpression())
!45 = distinct !DIGlobalVariable(name: "Lighting_objects", scope: !2, file: !24, line: 363, type: !46, isLocal: false, isDefinition: true)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !47, size: 2800, elements: !50)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !48, line: 30, baseType: !49)
!48 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int8_t.h", directory: "", checksumkind: CSK_MD5, checksum: "5052dfe782b50fed2355b8f61a9e4fa9")
!49 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!50 = !{!51}
!51 = !DISubrange(count: 350)
!52 = !DIGlobalVariableExpression(var: !53, expr: !DIExpression())
!53 = distinct !DIGlobalVariable(name: "Headlights", scope: !2, file: !24, line: 366, type: !54, isLocal: false, isDefinition: true)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !55, size: 512, elements: !201)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "object", file: !57, line: 259, baseType: !58)
!57 = !DIFile(filename: "main_d2/object.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "1f2325d356aae4b692933d2aae4f3afd")
!58 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "object", file: !57, line: 210, size: 2144, flags: DIFlagTypePassByValue, elements: !59, identifier: "_ZTS6object")
!59 = !{!60, !61, !65, !66, !68, !69, !70, !71, !72, !73, !74, !75, !83, !90, !91, !92, !93, !94, !95, !96, !97, !98, !119, !173}
!60 = !DIDerivedType(tag: DW_TAG_member, name: "signature", scope: !58, file: !57, line: 212, baseType: !7, size: 32)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !58, file: !57, line: 213, baseType: !62, size: 8, offset: 32)
!62 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !63, line: 31, baseType: !64)
!63 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint8_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8b64ccf8c67b8c006b07b8daf1b49be5")
!64 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !58, file: !57, line: 214, baseType: !62, size: 8, offset: 40)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !58, file: !57, line: 215, baseType: !67, size: 16, offset: 48)
!67 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "prev", scope: !58, file: !57, line: 215, baseType: !67, size: 16, offset: 64)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "control_type", scope: !58, file: !57, line: 216, baseType: !62, size: 8, offset: 80)
!70 = !DIDerivedType(tag: DW_TAG_member, name: "movement_type", scope: !58, file: !57, line: 217, baseType: !62, size: 8, offset: 88)
!71 = !DIDerivedType(tag: DW_TAG_member, name: "render_type", scope: !58, file: !57, line: 218, baseType: !62, size: 8, offset: 96)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !58, file: !57, line: 219, baseType: !62, size: 8, offset: 104)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "segnum", scope: !58, file: !57, line: 220, baseType: !67, size: 16, offset: 112)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "attached_obj", scope: !58, file: !57, line: 221, baseType: !67, size: 16, offset: 128)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !58, file: !57, line: 222, baseType: !76, size: 96, offset: 160)
!76 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_vector", file: !77, line: 22, baseType: !78)
!77 = !DIFile(filename: "./vecmat/vecmat.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "dfa84e3325c1ea4f5f74699fff5ef2bf")
!78 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_vector", file: !77, line: 19, size: 96, flags: DIFlagTypePassByValue, elements: !79, identifier: "_ZTS10vms_vector")
!79 = !{!80, !81, !82}
!80 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !78, file: !77, line: 21, baseType: !14, size: 32)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !78, file: !77, line: 21, baseType: !14, size: 32, offset: 32)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !78, file: !77, line: 21, baseType: !14, size: 32, offset: 64)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "orient", scope: !58, file: !57, line: 223, baseType: !84, size: 288, offset: 256)
!84 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_matrix", file: !77, line: 47, baseType: !85)
!85 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_matrix", file: !77, line: 44, size: 288, flags: DIFlagTypePassByValue, elements: !86, identifier: "_ZTS10vms_matrix")
!86 = !{!87, !88, !89}
!87 = !DIDerivedType(tag: DW_TAG_member, name: "rvec", scope: !85, file: !77, line: 46, baseType: !76, size: 96)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "uvec", scope: !85, file: !77, line: 46, baseType: !76, size: 96, offset: 96)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "fvec", scope: !85, file: !77, line: 46, baseType: !76, size: 96, offset: 192)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !58, file: !57, line: 224, baseType: !14, size: 32, offset: 544)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "shields", scope: !58, file: !57, line: 225, baseType: !14, size: 32, offset: 576)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "last_pos", scope: !58, file: !57, line: 226, baseType: !76, size: 96, offset: 608)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "contains_type", scope: !58, file: !57, line: 227, baseType: !47, size: 8, offset: 704)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "contains_id", scope: !58, file: !57, line: 228, baseType: !47, size: 8, offset: 712)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "contains_count", scope: !58, file: !57, line: 229, baseType: !47, size: 8, offset: 720)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "matcen_creator", scope: !58, file: !57, line: 230, baseType: !47, size: 8, offset: 728)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "lifeleft", scope: !58, file: !57, line: 231, baseType: !14, size: 32, offset: 736)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "mtype", scope: !58, file: !57, line: 240, baseType: !99, size: 512, offset: 768)
!99 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !58, file: !57, line: 236, size: 512, flags: DIFlagTypePassByValue, elements: !100, identifier: "_ZTSN6objectUt_E")
!100 = !{!101, !118}
!101 = !DIDerivedType(tag: DW_TAG_member, name: "phys_info", scope: !99, file: !57, line: 238, baseType: !102, size: 512)
!102 = !DIDerivedType(tag: DW_TAG_typedef, name: "physics_info", file: !57, line: 153, baseType: !103)
!103 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "physics_info", file: !57, line: 142, size: 512, flags: DIFlagTypePassByValue, elements: !104, identifier: "_ZTS12physics_info")
!104 = !{!105, !106, !107, !108, !109, !110, !111, !112, !114}
!105 = !DIDerivedType(tag: DW_TAG_member, name: "velocity", scope: !103, file: !57, line: 144, baseType: !76, size: 96)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "thrust", scope: !103, file: !57, line: 145, baseType: !76, size: 96, offset: 96)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "mass", scope: !103, file: !57, line: 146, baseType: !14, size: 32, offset: 192)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "drag", scope: !103, file: !57, line: 147, baseType: !14, size: 32, offset: 224)
!109 = !DIDerivedType(tag: DW_TAG_member, name: "brakes", scope: !103, file: !57, line: 148, baseType: !14, size: 32, offset: 256)
!110 = !DIDerivedType(tag: DW_TAG_member, name: "rotvel", scope: !103, file: !57, line: 149, baseType: !76, size: 96, offset: 288)
!111 = !DIDerivedType(tag: DW_TAG_member, name: "rotthrust", scope: !103, file: !57, line: 150, baseType: !76, size: 96, offset: 384)
!112 = !DIDerivedType(tag: DW_TAG_member, name: "turnroll", scope: !103, file: !57, line: 151, baseType: !113, size: 16, offset: 480)
!113 = !DIDerivedType(tag: DW_TAG_typedef, name: "fixang", file: !15, line: 21, baseType: !67)
!114 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !103, file: !57, line: 152, baseType: !115, size: 16, offset: 496)
!115 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !116, line: 31, baseType: !117)
!116 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint16_t.h", directory: "", checksumkind: CSK_MD5, checksum: "f0aa926da906b10566dd3171bf347ab7")
!117 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "spin_rate", scope: !99, file: !57, line: 239, baseType: !76, size: 96)
!119 = !DIDerivedType(tag: DW_TAG_member, name: "ctype", scope: !58, file: !57, line: 250, baseType: !120, size: 256, offset: 1280)
!120 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !58, file: !57, line: 243, size: 256, flags: DIFlagTypePassByValue, elements: !121, identifier: "_ZTSN6objectUt0_E")
!121 = !{!122, !133, !143, !161, !166}
!122 = !DIDerivedType(tag: DW_TAG_member, name: "laser_info", scope: !120, file: !57, line: 245, baseType: !123, size: 160)
!123 = !DIDerivedType(tag: DW_TAG_typedef, name: "laser_info_t", file: !57, line: 166, baseType: !124)
!124 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "laser_info_s", file: !57, line: 157, size: 160, flags: DIFlagTypePassByValue, elements: !125, identifier: "_ZTS12laser_info_s")
!125 = !{!126, !127, !128, !129, !130, !131, !132}
!126 = !DIDerivedType(tag: DW_TAG_member, name: "parent_type", scope: !124, file: !57, line: 159, baseType: !67, size: 16)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "parent_num", scope: !124, file: !57, line: 160, baseType: !67, size: 16, offset: 16)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "parent_signature", scope: !124, file: !57, line: 161, baseType: !7, size: 32, offset: 32)
!129 = !DIDerivedType(tag: DW_TAG_member, name: "creation_time", scope: !124, file: !57, line: 162, baseType: !14, size: 32, offset: 64)
!130 = !DIDerivedType(tag: DW_TAG_member, name: "last_hitobj", scope: !124, file: !57, line: 163, baseType: !67, size: 16, offset: 96)
!131 = !DIDerivedType(tag: DW_TAG_member, name: "track_goal", scope: !124, file: !57, line: 164, baseType: !67, size: 16, offset: 112)
!132 = !DIDerivedType(tag: DW_TAG_member, name: "multiplier", scope: !124, file: !57, line: 165, baseType: !14, size: 32, offset: 128)
!133 = !DIDerivedType(tag: DW_TAG_member, name: "expl_info", scope: !120, file: !57, line: 246, baseType: !134, size: 128)
!134 = !DIDerivedType(tag: DW_TAG_typedef, name: "explosion_info", file: !57, line: 176, baseType: !135)
!135 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "explosion_info", file: !57, line: 168, size: 128, flags: DIFlagTypePassByValue, elements: !136, identifier: "_ZTS14explosion_info")
!136 = !{!137, !138, !139, !140, !141, !142}
!137 = !DIDerivedType(tag: DW_TAG_member, name: "spawn_time", scope: !135, file: !57, line: 170, baseType: !14, size: 32)
!138 = !DIDerivedType(tag: DW_TAG_member, name: "delete_time", scope: !135, file: !57, line: 171, baseType: !14, size: 32, offset: 32)
!139 = !DIDerivedType(tag: DW_TAG_member, name: "delete_objnum", scope: !135, file: !57, line: 172, baseType: !67, size: 16, offset: 64)
!140 = !DIDerivedType(tag: DW_TAG_member, name: "attach_parent", scope: !135, file: !57, line: 173, baseType: !67, size: 16, offset: 80)
!141 = !DIDerivedType(tag: DW_TAG_member, name: "prev_attach", scope: !135, file: !57, line: 174, baseType: !67, size: 16, offset: 96)
!142 = !DIDerivedType(tag: DW_TAG_member, name: "next_attach", scope: !135, file: !57, line: 175, baseType: !67, size: 16, offset: 112)
!143 = !DIDerivedType(tag: DW_TAG_member, name: "ai_info", scope: !120, file: !57, line: 247, baseType: !144, size: 256)
!144 = !DIDerivedType(tag: DW_TAG_typedef, name: "ai_static", file: !145, line: 144, baseType: !146)
!145 = !DIFile(filename: "main_d2/aistruct.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "d122430e792a0ddc0f9eaa08ad217628")
!146 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ai_static", file: !145, line: 127, size: 256, flags: DIFlagTypePassByValue, elements: !147, identifier: "_ZTS9ai_static")
!147 = !{!148, !149, !153, !154, !155, !156, !157, !158, !159, !160}
!148 = !DIDerivedType(tag: DW_TAG_member, name: "behavior", scope: !146, file: !145, line: 128, baseType: !62, size: 8)
!149 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !146, file: !145, line: 129, baseType: !150, size: 88, offset: 8)
!150 = !DICompositeType(tag: DW_TAG_array_type, baseType: !47, size: 88, elements: !151)
!151 = !{!152}
!152 = !DISubrange(count: 11)
!153 = !DIDerivedType(tag: DW_TAG_member, name: "hide_segment", scope: !146, file: !145, line: 130, baseType: !67, size: 16, offset: 96)
!154 = !DIDerivedType(tag: DW_TAG_member, name: "hide_index", scope: !146, file: !145, line: 131, baseType: !67, size: 16, offset: 112)
!155 = !DIDerivedType(tag: DW_TAG_member, name: "path_length", scope: !146, file: !145, line: 132, baseType: !67, size: 16, offset: 128)
!156 = !DIDerivedType(tag: DW_TAG_member, name: "cur_path_index", scope: !146, file: !145, line: 133, baseType: !47, size: 8, offset: 144)
!157 = !DIDerivedType(tag: DW_TAG_member, name: "dying_sound_playing", scope: !146, file: !145, line: 134, baseType: !47, size: 8, offset: 152)
!158 = !DIDerivedType(tag: DW_TAG_member, name: "danger_laser_num", scope: !146, file: !145, line: 139, baseType: !67, size: 16, offset: 160)
!159 = !DIDerivedType(tag: DW_TAG_member, name: "danger_laser_signature", scope: !146, file: !145, line: 140, baseType: !7, size: 32, offset: 192)
!160 = !DIDerivedType(tag: DW_TAG_member, name: "dying_start_time", scope: !146, file: !145, line: 141, baseType: !14, size: 32, offset: 224)
!161 = !DIDerivedType(tag: DW_TAG_member, name: "light_info", scope: !120, file: !57, line: 248, baseType: !162, size: 32)
!162 = !DIDerivedType(tag: DW_TAG_typedef, name: "light_info_t", file: !57, line: 181, baseType: !163)
!163 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "light_info_s", file: !57, line: 178, size: 32, flags: DIFlagTypePassByValue, elements: !164, identifier: "_ZTS12light_info_s")
!164 = !{!165}
!165 = !DIDerivedType(tag: DW_TAG_member, name: "intensity", scope: !163, file: !57, line: 180, baseType: !14, size: 32)
!166 = !DIDerivedType(tag: DW_TAG_member, name: "powerup_info", scope: !120, file: !57, line: 249, baseType: !167, size: 96)
!167 = !DIDerivedType(tag: DW_TAG_typedef, name: "powerup_info_t", file: !57, line: 190, baseType: !168)
!168 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "powerup_info_s", file: !57, line: 185, size: 96, flags: DIFlagTypePassByValue, elements: !169, identifier: "_ZTS14powerup_info_s")
!169 = !{!170, !171, !172}
!170 = !DIDerivedType(tag: DW_TAG_member, name: "count", scope: !168, file: !57, line: 187, baseType: !7, size: 32)
!171 = !DIDerivedType(tag: DW_TAG_member, name: "creation_time", scope: !168, file: !57, line: 188, baseType: !14, size: 32, offset: 32)
!172 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !168, file: !57, line: 189, baseType: !7, size: 32, offset: 64)
!173 = !DIDerivedType(tag: DW_TAG_member, name: "rtype", scope: !58, file: !57, line: 257, baseType: !174, size: 608, offset: 1536)
!174 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !58, file: !57, line: 253, size: 608, flags: DIFlagTypePassByValue, elements: !175, identifier: "_ZTSN6objectUt1_E")
!175 = !{!176, !194}
!176 = !DIDerivedType(tag: DW_TAG_member, name: "pobj_info", scope: !174, file: !57, line: 255, baseType: !177, size: 608)
!177 = !DIDerivedType(tag: DW_TAG_typedef, name: "polyobj_info", file: !57, line: 208, baseType: !178)
!178 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "polyobj_info", file: !57, line: 201, size: 608, flags: DIFlagTypePassByValue, elements: !179, identifier: "_ZTS12polyobj_info")
!179 = !{!180, !181, !191, !192, !193}
!180 = !DIDerivedType(tag: DW_TAG_member, name: "model_num", scope: !178, file: !57, line: 203, baseType: !7, size: 32)
!181 = !DIDerivedType(tag: DW_TAG_member, name: "anim_angles", scope: !178, file: !57, line: 204, baseType: !182, size: 480, offset: 32)
!182 = !DICompositeType(tag: DW_TAG_array_type, baseType: !183, size: 480, elements: !189)
!183 = !DIDerivedType(tag: DW_TAG_typedef, name: "vms_angvec", file: !77, line: 40, baseType: !184)
!184 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vms_angvec", file: !77, line: 37, size: 48, flags: DIFlagTypePassByValue, elements: !185, identifier: "_ZTS10vms_angvec")
!185 = !{!186, !187, !188}
!186 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !184, file: !77, line: 39, baseType: !113, size: 16)
!187 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !184, file: !77, line: 39, baseType: !113, size: 16, offset: 16)
!188 = !DIDerivedType(tag: DW_TAG_member, name: "h", scope: !184, file: !77, line: 39, baseType: !113, size: 16, offset: 32)
!189 = !{!190}
!190 = !DISubrange(count: 10)
!191 = !DIDerivedType(tag: DW_TAG_member, name: "subobj_flags", scope: !178, file: !57, line: 205, baseType: !7, size: 32, offset: 512)
!192 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_override", scope: !178, file: !57, line: 206, baseType: !7, size: 32, offset: 544)
!193 = !DIDerivedType(tag: DW_TAG_member, name: "alt_textures", scope: !178, file: !57, line: 207, baseType: !7, size: 32, offset: 576)
!194 = !DIDerivedType(tag: DW_TAG_member, name: "vclip_info", scope: !174, file: !57, line: 256, baseType: !195, size: 96)
!195 = !DIDerivedType(tag: DW_TAG_typedef, name: "vclip_info_t", file: !57, line: 197, baseType: !196)
!196 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vclip_info_s", file: !57, line: 192, size: 96, flags: DIFlagTypePassByValue, elements: !197, identifier: "_ZTS12vclip_info_s")
!197 = !{!198, !199, !200}
!198 = !DIDerivedType(tag: DW_TAG_member, name: "vclip_num", scope: !196, file: !57, line: 194, baseType: !7, size: 32)
!199 = !DIDerivedType(tag: DW_TAG_member, name: "frametime", scope: !196, file: !57, line: 195, baseType: !14, size: 32, offset: 32)
!200 = !DIDerivedType(tag: DW_TAG_member, name: "framenum", scope: !196, file: !57, line: 196, baseType: !47, size: 8, offset: 64)
!201 = !{!202}
!202 = !DISubrange(count: 8)
!203 = !DIGlobalVariableExpression(var: !204, expr: !DIExpression())
!204 = distinct !DIGlobalVariable(name: "Num_headlights", scope: !2, file: !24, line: 367, type: !7, isLocal: false, isDefinition: true)
!205 = !DIGlobalVariableExpression(var: !206, expr: !DIExpression())
!206 = distinct !DIGlobalVariable(scope: null, file: !24, line: 535, type: !207, isLocal: true, isDefinition: true)
!207 = !DICompositeType(tag: DW_TAG_array_type, baseType: !208, size: 384, elements: !210)
!208 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !209)
!209 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!210 = !{!211}
!211 = !DISubrange(count: 48)
!212 = !DIGlobalVariableExpression(var: !213, expr: !DIExpression())
!213 = distinct !DIGlobalVariable(scope: null, file: !24, line: 535, type: !214, isLocal: true, isDefinition: true)
!214 = !DICompositeType(tag: DW_TAG_array_type, baseType: !208, size: 464, elements: !215)
!215 = !{!216}
!216 = !DISubrange(count: 58)
!217 = !DIGlobalVariableExpression(var: !218, expr: !DIExpression())
!218 = distinct !DIGlobalVariable(scope: null, file: !24, line: 544, type: !219, isLocal: true, isDefinition: true)
!219 = !DICompositeType(tag: DW_TAG_array_type, baseType: !208, size: 576, elements: !220)
!220 = !{!221}
!221 = !DISubrange(count: 72)
!222 = !DIGlobalVariableExpression(var: !223, expr: !DIExpression())
!223 = distinct !DIGlobalVariable(name: "Beam_brightness", scope: !2, file: !24, line: 631, type: !14, isLocal: false, isDefinition: true)
!224 = !DIGlobalVariableExpression(var: !225, expr: !DIExpression())
!225 = distinct !DIGlobalVariable(name: "object_light", scope: !2, file: !24, line: 695, type: !226, isLocal: false, isDefinition: true)
!226 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 11200, elements: !50)
!227 = !DIGlobalVariableExpression(var: !228, expr: !DIExpression())
!228 = distinct !DIGlobalVariable(name: "object_sig", scope: !2, file: !24, line: 696, type: !229, isLocal: false, isDefinition: true)
!229 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 11200, elements: !50)
!230 = !DIGlobalVariableExpression(var: !231, expr: !DIExpression())
!231 = distinct !DIGlobalVariable(name: "old_viewer", scope: !2, file: !24, line: 697, type: !55, isLocal: false, isDefinition: true)
!232 = !DIGlobalVariableExpression(var: !233, expr: !DIExpression())
!233 = distinct !DIGlobalVariable(name: "reset_lighting_hack", scope: !2, file: !24, line: 698, type: !7, isLocal: false, isDefinition: true)
!234 = !DIGlobalVariableExpression(var: !235, expr: !DIExpression(DW_OP_constu, 16, DW_OP_stack_value))
!235 = distinct !DIGlobalVariable(name: "FRACBITS", scope: !2, file: !15, line: 18, type: !236, isLocal: true, isDefinition: true)
!236 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!237 = !{!238, !242, !245, !246, !247, !248, !249, !253, !257, !260, !262, !264, !266, !268, !270, !272, !274, !276, !278, !280, !282, !284, !286, !288, !290, !296, !300, !303, !306, !311, !317, !319, !321, !323, !325, !327, !329, !331, !333, !335, !337, !339, !341, !343, !348, !353, !358, !363, !365, !368, !370, !372, !374, !376, !378, !380, !382, !384, !386, !390, !395, !399, !401, !405, !409, !422, !438, !439, !494, !503, !505, !513, !519, !523, !527, !529, !533, !537, !541, !545, !549, !553, !555, !557, !561, !567, !572, !576, !580, !584, !588, !592, !596, !600, !602, !604, !608, !610, !614, !618, !623, !625, !627, !629, !633, !637, !641, !643, !647, !649, !651, !653, !655, !661, !665, !667, !673, !678, !682, !686, !691, !696, !700, !704, !708, !712, !714, !716, !724, !726, !730, !734, !736, !738, !742, !746, !750, !752, !756, !761, !765, !769, !771, !773, !775, !777, !779, !781, !785, !789, !797, !799, !801, !803, !809, !811, !812, !813, !814, !817, !819, !824, !828, !830, !832, !836, !838, !840, !842, !844, !846, !848, !850, !855, !859, !861, !863, !864, !869, !871, !873, !875, !877, !879, !881, !883, !885, !887, !889, !891, !893, !895, !897, !899, !901, !905, !907, !909, !911, !915, !917, !921, !923, !925, !927, !929, !933, !935, !939, !943, !945, !947, !951, !953, !957, !959, !961, !965, !967, !969, !971, !973, !975, !977, !981, !983, !985, !987, !989, !991, !993, !995, !999, !1003, !1005, !1007, !1009, !1011, !1013, !1015, !1017, !1019, !1021, !1023, !1025, !1027, !1029, !1031, !1033, !1035, !1037, !1039, !1041, !1045, !1047, !1049, !1051, !1055, !1057, !1061, !1063, !1065, !1067, !1069, !1073, !1075, !1079, !1081, !1083, !1085, !1087, !1091, !1093, !1095, !1099, !1101, !1103, !1105, !1110, !1115, !1119, !1120, !1124, !1128, !1133, !1138, !1142, !1148, !1152, !1154, !1158, !1166, !1172, !1178, !1180, !1184, !1188, !1192, !1197, !1201, !1205, !1209, !1213, !1217, !1221, !1225, !1229, !1234, !1238, !1242, !1246, !1251, !1256, !1260, !1262, !1266, !1268, !1275, !1279, !1280, !1284, !1288, !1292, !1296, !1298, !1302, !1306, !1310, !1314, !1318, !1320, !1322, !1324, !1326, !1327, !1331, !1333, !1337, !1341, !1345, !1347, !1351, !1355, !1359, !1365, !1367, !1371, !1375, !1379, !1381, !1385, !1389, !1393, !1395, !1397, !1399, !1403, !1407, !1412, !1416, !1422, !1426, !1430, !1432, !1434, !1436, !1440, !1444, !1448, !1450, !1452, !1456, !1460, !1462, !1466, !1470, !1473, !1475, !1477}
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !47, file: !241, line: 158)
!239 = !DINamespace(name: "__1", scope: !240, exportSymbols: true)
!240 = !DINamespace(name: "std", scope: null)
!241 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdint", directory: "")
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !243, file: !241, line: 159)
!243 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !244, line: 30, baseType: !67)
!244 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_int16_t.h", directory: "", checksumkind: CSK_MD5, checksum: "47ed3c3ac6f65bfec021ca2b7be18e7e")
!245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !16, file: !241, line: 160)
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !18, file: !241, line: 161)
!247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !62, file: !241, line: 163)
!248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !115, file: !241, line: 164)
!249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !250, file: !241, line: 165)
!250 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !251, line: 31, baseType: !252)
!251 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint32_t.h", directory: "", checksumkind: CSK_MD5, checksum: "0254eb80c6b9719ac45c3c1cf872109b")
!252 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !254, file: !241, line: 166)
!254 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !255, line: 31, baseType: !256)
!255 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uint64_t.h", directory: "", checksumkind: CSK_MD5, checksum: "77fc5e91653260959605f129691cf9b1")
!256 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !258, file: !241, line: 168)
!258 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !259, line: 29, baseType: !47)
!259 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "042ceedaf4137a8aaa272d0b27434016")
!260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !261, file: !241, line: 169)
!261 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !259, line: 30, baseType: !243)
!262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !263, file: !241, line: 170)
!263 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !259, line: 31, baseType: !16)
!264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !265, file: !241, line: 171)
!265 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !259, line: 32, baseType: !18)
!266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !267, file: !241, line: 173)
!267 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !259, line: 33, baseType: !62)
!268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !269, file: !241, line: 174)
!269 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !259, line: 34, baseType: !115)
!270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !271, file: !241, line: 175)
!271 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !259, line: 35, baseType: !250)
!272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !273, file: !241, line: 176)
!273 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !259, line: 36, baseType: !254)
!274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !275, file: !241, line: 178)
!275 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !259, line: 40, baseType: !47)
!276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !277, file: !241, line: 179)
!277 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !259, line: 41, baseType: !243)
!278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !279, file: !241, line: 180)
!279 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !259, line: 42, baseType: !16)
!280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !281, file: !241, line: 181)
!281 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !259, line: 43, baseType: !18)
!282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !283, file: !241, line: 183)
!283 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !259, line: 44, baseType: !62)
!284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !285, file: !241, line: 184)
!285 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !259, line: 45, baseType: !115)
!286 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !287, file: !241, line: 185)
!287 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !259, line: 46, baseType: !250)
!288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !289, file: !241, line: 186)
!289 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !259, line: 47, baseType: !254)
!290 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !291, file: !241, line: 188)
!291 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !292, line: 32, baseType: !293)
!292 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_intptr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e478ba47270923b1cca6659f19f02db1")
!293 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_intptr_t", file: !294, line: 40, baseType: !295)
!294 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/arm/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "b270144f57ae258d0ce80b8f87be068c")
!295 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !297, file: !241, line: 189)
!297 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !298, line: 34, baseType: !299)
!298 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_uintptr_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e70ae655dd1b9d4ae0b1dcc073f5b7e4")
!299 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !301, file: !241, line: 191)
!301 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !302, line: 32, baseType: !295)
!302 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_intmax_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e37b9240f30f486478152ef3989b1545")
!303 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !304, file: !241, line: 192)
!304 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !305, line: 32, baseType: !299)
!305 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_uintmax_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8217a3fbb207d8e87ca5318c313e81c2")
!306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !307, file: !310, line: 22)
!307 = !DIDerivedType(tag: DW_TAG_typedef, name: "max_align_t", file: !308, line: 16, baseType: !309)
!308 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/lib/clang/20/include/__stddef_max_align_t.h", directory: "", checksumkind: CSK_MD5, checksum: "3c0a2f19d136d39aa835c737c7105def")
!309 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
!310 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__cstddef/max_align_t.h", directory: "")
!311 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !312, file: !316, line: 113)
!312 = !DISubprogram(name: "isalnum", linkageName: "_Z7isalnumi", scope: !313, file: !313, line: 217, type: !314, flags: DIFlagPrototyped, spFlags: 0)
!313 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_ctype.h", directory: "", checksumkind: CSK_MD5, checksum: "b10215117a277691ffc4168ac4505796")
!314 = !DISubroutineType(types: !315)
!315 = !{!7, !7}
!316 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cctype", directory: "")
!317 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !318, file: !316, line: 114)
!318 = !DISubprogram(name: "isalpha", linkageName: "_Z7isalphai", scope: !313, file: !313, line: 223, type: !314, flags: DIFlagPrototyped, spFlags: 0)
!319 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !320, file: !316, line: 115)
!320 = !DISubprogram(name: "isblank", linkageName: "_Z7isblanki", scope: !313, file: !313, line: 229, type: !314, flags: DIFlagPrototyped, spFlags: 0)
!321 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !322, file: !316, line: 116)
!322 = !DISubprogram(name: "iscntrl", linkageName: "_Z7iscntrli", scope: !313, file: !313, line: 235, type: !314, flags: DIFlagPrototyped, spFlags: 0)
!323 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !324, file: !316, line: 117)
!324 = !DISubprogram(name: "isdigit", linkageName: "_Z7isdigiti", scope: !313, file: !313, line: 242, type: !314, flags: DIFlagPrototyped, spFlags: 0)
!325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !326, file: !316, line: 118)
!326 = !DISubprogram(name: "isgraph", linkageName: "_Z7isgraphi", scope: !313, file: !313, line: 248, type: !314, flags: DIFlagPrototyped, spFlags: 0)
!327 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !328, file: !316, line: 119)
!328 = !DISubprogram(name: "islower", linkageName: "_Z7isloweri", scope: !313, file: !313, line: 254, type: !314, flags: DIFlagPrototyped, spFlags: 0)
!329 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !330, file: !316, line: 120)
!330 = !DISubprogram(name: "isprint", linkageName: "_Z7isprinti", scope: !313, file: !313, line: 260, type: !314, flags: DIFlagPrototyped, spFlags: 0)
!331 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !332, file: !316, line: 121)
!332 = !DISubprogram(name: "ispunct", linkageName: "_Z7ispuncti", scope: !313, file: !313, line: 266, type: !314, flags: DIFlagPrototyped, spFlags: 0)
!333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !334, file: !316, line: 122)
!334 = !DISubprogram(name: "isspace", linkageName: "_Z7isspacei", scope: !313, file: !313, line: 272, type: !314, flags: DIFlagPrototyped, spFlags: 0)
!335 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !336, file: !316, line: 123)
!336 = !DISubprogram(name: "isupper", linkageName: "_Z7isupperi", scope: !313, file: !313, line: 278, type: !314, flags: DIFlagPrototyped, spFlags: 0)
!337 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !338, file: !316, line: 124)
!338 = !DISubprogram(name: "isxdigit", linkageName: "_Z8isxdigiti", scope: !313, file: !313, line: 285, type: !314, flags: DIFlagPrototyped, spFlags: 0)
!339 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !340, file: !316, line: 125)
!340 = !DISubprogram(name: "tolower", linkageName: "_Z7toloweri", scope: !313, file: !313, line: 297, type: !314, flags: DIFlagPrototyped, spFlags: 0)
!341 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !342, file: !316, line: 126)
!342 = !DISubprogram(name: "toupper", linkageName: "_Z7toupperi", scope: !313, file: !313, line: 303, type: !314, flags: DIFlagPrototyped, spFlags: 0)
!343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !344, file: !347, line: 75)
!344 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !345, line: 32, baseType: !346)
!345 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_wint_t.h", directory: "", checksumkind: CSK_MD5, checksum: "6dfd3a3d5009054224653c03b2c2b6ac")
!346 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wint_t", file: !294, line: 111, baseType: !7)
!347 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cwctype", directory: "")
!348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !349, file: !347, line: 76)
!349 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !350, line: 32, baseType: !351)
!350 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_wctrans_t.h", directory: "", checksumkind: CSK_MD5, checksum: "e70040c8494301cc74e19df26f4c1d76")
!351 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wctrans_t", file: !352, line: 44, baseType: !7)
!352 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "c789da493a5b476a3618b20a8fcff3c3")
!353 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !354, file: !347, line: 77)
!354 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !355, line: 32, baseType: !356)
!355 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_types/_wctype_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8d1720b82a490c742e6a297f971be2a2")
!356 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wctype_t", file: !352, line: 46, baseType: !357)
!357 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !294, line: 36, baseType: !252)
!358 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !359, file: !347, line: 78)
!359 = !DISubprogram(name: "iswalnum", linkageName: "_Z8iswalnumi", scope: !360, file: !360, line: 84, type: !361, flags: DIFlagPrototyped, spFlags: 0)
!360 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/___wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "d5a8bf0b4062c20bda4d49376e5b44d9")
!361 = !DISubroutineType(types: !362)
!362 = !{!7, !344}
!363 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !364, file: !347, line: 79)
!364 = !DISubprogram(name: "iswalpha", linkageName: "_Z8iswalphai", scope: !360, file: !360, line: 90, type: !361, flags: DIFlagPrototyped, spFlags: 0)
!365 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !366, file: !347, line: 80)
!366 = !DISubprogram(name: "iswblank", linkageName: "_Z8iswblanki", scope: !367, file: !367, line: 53, type: !361, flags: DIFlagPrototyped, spFlags: 0)
!367 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "6bc93063cb32b00d3df790305c546a93")
!368 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !369, file: !347, line: 81)
!369 = !DISubprogram(name: "iswcntrl", linkageName: "_Z8iswcntrli", scope: !360, file: !360, line: 96, type: !361, flags: DIFlagPrototyped, spFlags: 0)
!370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !371, file: !347, line: 82)
!371 = !DISubprogram(name: "iswdigit", linkageName: "_Z8iswdigiti", scope: !360, file: !360, line: 108, type: !361, flags: DIFlagPrototyped, spFlags: 0)
!372 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !373, file: !347, line: 83)
!373 = !DISubprogram(name: "iswgraph", linkageName: "_Z8iswgraphi", scope: !360, file: !360, line: 114, type: !361, flags: DIFlagPrototyped, spFlags: 0)
!374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !375, file: !347, line: 84)
!375 = !DISubprogram(name: "iswlower", linkageName: "_Z8iswloweri", scope: !360, file: !360, line: 120, type: !361, flags: DIFlagPrototyped, spFlags: 0)
!376 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !377, file: !347, line: 85)
!377 = !DISubprogram(name: "iswprint", linkageName: "_Z8iswprinti", scope: !360, file: !360, line: 126, type: !361, flags: DIFlagPrototyped, spFlags: 0)
!378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !379, file: !347, line: 86)
!379 = !DISubprogram(name: "iswpunct", linkageName: "_Z8iswpuncti", scope: !360, file: !360, line: 132, type: !361, flags: DIFlagPrototyped, spFlags: 0)
!380 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !381, file: !347, line: 87)
!381 = !DISubprogram(name: "iswspace", linkageName: "_Z8iswspacei", scope: !360, file: !360, line: 138, type: !361, flags: DIFlagPrototyped, spFlags: 0)
!382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !383, file: !347, line: 88)
!383 = !DISubprogram(name: "iswupper", linkageName: "_Z8iswupperi", scope: !360, file: !360, line: 144, type: !361, flags: DIFlagPrototyped, spFlags: 0)
!384 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !385, file: !347, line: 89)
!385 = !DISubprogram(name: "iswxdigit", linkageName: "_Z9iswxdigiti", scope: !360, file: !360, line: 150, type: !361, flags: DIFlagPrototyped, spFlags: 0)
!386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !387, file: !347, line: 90)
!387 = !DISubprogram(name: "iswctype", linkageName: "_Z8iswctypeij", scope: !360, file: !360, line: 102, type: !388, flags: DIFlagPrototyped, spFlags: 0)
!388 = !DISubroutineType(types: !389)
!389 = !{!7, !344, !354}
!390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !391, file: !347, line: 91)
!391 = !DISubprogram(name: "wctype", scope: !360, file: !360, line: 190, type: !392, flags: DIFlagPrototyped, spFlags: 0)
!392 = !DISubroutineType(types: !393)
!393 = !{!354, !394}
!394 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !208, size: 64)
!395 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !396, file: !347, line: 92)
!396 = !DISubprogram(name: "towlower", linkageName: "_Z8towloweri", scope: !360, file: !360, line: 156, type: !397, flags: DIFlagPrototyped, spFlags: 0)
!397 = !DISubroutineType(types: !398)
!398 = !{!344, !344}
!399 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !400, file: !347, line: 93)
!400 = !DISubprogram(name: "towupper", linkageName: "_Z8towupperi", scope: !360, file: !360, line: 162, type: !397, flags: DIFlagPrototyped, spFlags: 0)
!401 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !402, file: !347, line: 94)
!402 = !DISubprogram(name: "towctrans", scope: !367, file: !367, line: 124, type: !403, flags: DIFlagPrototyped, spFlags: 0)
!403 = !DISubroutineType(types: !404)
!404 = !{!344, !344, !349}
!405 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !406, file: !347, line: 95)
!406 = !DISubprogram(name: "wctrans", scope: !367, file: !367, line: 126, type: !407, flags: DIFlagPrototyped, spFlags: 0)
!407 = !DISubroutineType(types: !408)
!408 = !{!349, !394}
!409 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !410, file: !421, line: 133)
!410 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !411, line: 32, baseType: !412)
!411 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "8f920c8f4b68eb07504db5a6777c5466")
!412 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_mbstate_t", file: !294, line: 72, baseType: !413)
!413 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !294, line: 70, baseType: !414)
!414 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !294, line: 67, size: 1024, flags: DIFlagTypePassByValue, elements: !415, identifier: "_ZTS11__mbstate_t")
!415 = !{!416, !420}
!416 = !DIDerivedType(tag: DW_TAG_member, name: "__mbstate8", scope: !414, file: !294, line: 68, baseType: !417, size: 1024)
!417 = !DICompositeType(tag: DW_TAG_array_type, baseType: !209, size: 1024, elements: !418)
!418 = !{!419}
!419 = !DISubrange(count: 128)
!420 = !DIDerivedType(tag: DW_TAG_member, name: "_mbstateL", scope: !414, file: !294, line: 69, baseType: !20, size: 64)
!421 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cwchar", directory: "")
!422 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !423, file: !421, line: 134)
!423 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !424, line: 78, size: 448, flags: DIFlagTypePassByValue, elements: !425, identifier: "_ZTS2tm")
!424 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_time.h", directory: "", checksumkind: CSK_MD5, checksum: "e65eafd533c28a52a9094e430476b03e")
!425 = !{!426, !427, !428, !429, !430, !431, !432, !433, !434, !435, !436}
!426 = !DIDerivedType(tag: DW_TAG_member, name: "tm_sec", scope: !423, file: !424, line: 79, baseType: !7, size: 32)
!427 = !DIDerivedType(tag: DW_TAG_member, name: "tm_min", scope: !423, file: !424, line: 80, baseType: !7, size: 32, offset: 32)
!428 = !DIDerivedType(tag: DW_TAG_member, name: "tm_hour", scope: !423, file: !424, line: 81, baseType: !7, size: 32, offset: 64)
!429 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mday", scope: !423, file: !424, line: 82, baseType: !7, size: 32, offset: 96)
!430 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mon", scope: !423, file: !424, line: 83, baseType: !7, size: 32, offset: 128)
!431 = !DIDerivedType(tag: DW_TAG_member, name: "tm_year", scope: !423, file: !424, line: 84, baseType: !7, size: 32, offset: 160)
!432 = !DIDerivedType(tag: DW_TAG_member, name: "tm_wday", scope: !423, file: !424, line: 85, baseType: !7, size: 32, offset: 192)
!433 = !DIDerivedType(tag: DW_TAG_member, name: "tm_yday", scope: !423, file: !424, line: 86, baseType: !7, size: 32, offset: 224)
!434 = !DIDerivedType(tag: DW_TAG_member, name: "tm_isdst", scope: !423, file: !424, line: 87, baseType: !7, size: 32, offset: 256)
!435 = !DIDerivedType(tag: DW_TAG_member, name: "tm_gmtoff", scope: !423, file: !424, line: 88, baseType: !295, size: 64, offset: 320)
!436 = !DIDerivedType(tag: DW_TAG_member, name: "tm_zone", scope: !423, file: !424, line: 89, baseType: !437, size: 64, offset: 384)
!437 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !209, size: 64)
!438 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !344, file: !421, line: 135)
!439 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !440, file: !421, line: 136)
!440 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !441, line: 162, baseType: !442)
!441 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "d91ebd7d161d9196cc100822ef0e5cdf")
!442 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILE", file: !441, line: 131, size: 1216, flags: DIFlagTypePassByValue, elements: !443, identifier: "_ZTS7__sFILE")
!443 = !{!444, !446, !447, !448, !449, !450, !455, !456, !458, !462, !466, !474, !478, !479, !482, !483, !487, !491, !492, !493}
!444 = !DIDerivedType(tag: DW_TAG_member, name: "_p", scope: !442, file: !441, line: 132, baseType: !445, size: 64)
!445 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!446 = !DIDerivedType(tag: DW_TAG_member, name: "_r", scope: !442, file: !441, line: 133, baseType: !7, size: 32, offset: 64)
!447 = !DIDerivedType(tag: DW_TAG_member, name: "_w", scope: !442, file: !441, line: 134, baseType: !7, size: 32, offset: 96)
!448 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !442, file: !441, line: 135, baseType: !67, size: 16, offset: 128)
!449 = !DIDerivedType(tag: DW_TAG_member, name: "_file", scope: !442, file: !441, line: 136, baseType: !67, size: 16, offset: 144)
!450 = !DIDerivedType(tag: DW_TAG_member, name: "_bf", scope: !442, file: !441, line: 137, baseType: !451, size: 128, offset: 192)
!451 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sbuf", file: !441, line: 97, size: 128, flags: DIFlagTypePassByValue, elements: !452, identifier: "_ZTS6__sbuf")
!452 = !{!453, !454}
!453 = !DIDerivedType(tag: DW_TAG_member, name: "_base", scope: !451, file: !441, line: 98, baseType: !445, size: 64)
!454 = !DIDerivedType(tag: DW_TAG_member, name: "_size", scope: !451, file: !441, line: 99, baseType: !7, size: 32, offset: 64)
!455 = !DIDerivedType(tag: DW_TAG_member, name: "_lbfsize", scope: !442, file: !441, line: 138, baseType: !7, size: 32, offset: 320)
!456 = !DIDerivedType(tag: DW_TAG_member, name: "_cookie", scope: !442, file: !441, line: 141, baseType: !457, size: 64, offset: 384)
!457 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!458 = !DIDerivedType(tag: DW_TAG_member, name: "_close", scope: !442, file: !441, line: 142, baseType: !459, size: 64, offset: 448)
!459 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !460, size: 64)
!460 = !DISubroutineType(types: !461)
!461 = !{!7, !457}
!462 = !DIDerivedType(tag: DW_TAG_member, name: "_read", scope: !442, file: !441, line: 143, baseType: !463, size: 64, offset: 512)
!463 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !464, size: 64)
!464 = !DISubroutineType(types: !465)
!465 = !{!7, !457, !437, !7}
!466 = !DIDerivedType(tag: DW_TAG_member, name: "_seek", scope: !442, file: !441, line: 144, baseType: !467, size: 64, offset: 576)
!467 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !468, size: 64)
!468 = !DISubroutineType(types: !469)
!469 = !{!470, !457, !470, !7}
!470 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !441, line: 86, baseType: !471)
!471 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_off_t", file: !472, line: 83, baseType: !473)
!472 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types.h", directory: "", checksumkind: CSK_MD5, checksum: "af82ff6119a9fa80fad635d276556d46")
!473 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !294, line: 37, baseType: !20)
!474 = !DIDerivedType(tag: DW_TAG_member, name: "_write", scope: !442, file: !441, line: 145, baseType: !475, size: 64, offset: 640)
!475 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !476, size: 64)
!476 = !DISubroutineType(types: !477)
!477 = !{!7, !457, !394, !7}
!478 = !DIDerivedType(tag: DW_TAG_member, name: "_ub", scope: !442, file: !441, line: 148, baseType: !451, size: 128, offset: 704)
!479 = !DIDerivedType(tag: DW_TAG_member, name: "_extra", scope: !442, file: !441, line: 149, baseType: !480, size: 64, offset: 832)
!480 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !481, size: 64)
!481 = !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILEX", file: !441, line: 103, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS8__sFILEX")
!482 = !DIDerivedType(tag: DW_TAG_member, name: "_ur", scope: !442, file: !441, line: 150, baseType: !7, size: 32, offset: 896)
!483 = !DIDerivedType(tag: DW_TAG_member, name: "_ubuf", scope: !442, file: !441, line: 153, baseType: !484, size: 24, offset: 928)
!484 = !DICompositeType(tag: DW_TAG_array_type, baseType: !64, size: 24, elements: !485)
!485 = !{!486}
!486 = !DISubrange(count: 3)
!487 = !DIDerivedType(tag: DW_TAG_member, name: "_nbuf", scope: !442, file: !441, line: 154, baseType: !488, size: 8, offset: 952)
!488 = !DICompositeType(tag: DW_TAG_array_type, baseType: !64, size: 8, elements: !489)
!489 = !{!490}
!490 = !DISubrange(count: 1)
!491 = !DIDerivedType(tag: DW_TAG_member, name: "_lb", scope: !442, file: !441, line: 157, baseType: !451, size: 128, offset: 960)
!492 = !DIDerivedType(tag: DW_TAG_member, name: "_blksize", scope: !442, file: !441, line: 160, baseType: !7, size: 32, offset: 1088)
!493 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !442, file: !441, line: 161, baseType: !470, size: 64, offset: 1152)
!494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !495, file: !421, line: 137)
!495 = !DISubprogram(name: "fwprintf", scope: !496, file: !496, line: 107, type: !497, flags: DIFlagPrototyped, spFlags: 0)
!496 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "c0db33314388059ce7a1663adf1bfda0")
!497 = !DISubroutineType(types: !498)
!498 = !{!7, !499, !500, null}
!499 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !440, size: 64)
!500 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !501, size: 64)
!501 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !502)
!502 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!503 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !504, file: !421, line: 138)
!504 = !DISubprogram(name: "fwscanf", scope: !496, file: !496, line: 108, type: !497, flags: DIFlagPrototyped, spFlags: 0)
!505 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !506, file: !421, line: 139)
!506 = !DISubprogram(name: "swprintf", scope: !496, file: !496, line: 120, type: !507, flags: DIFlagPrototyped, spFlags: 0)
!507 = !DISubroutineType(types: !508)
!508 = !{!7, !509, !510, !500, null}
!509 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !502, size: 64)
!510 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !511, line: 50, baseType: !512)
!511 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "f7981334d28e0c246f35cd24042aa2a4")
!512 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !294, line: 87, baseType: !299)
!513 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !514, file: !421, line: 140)
!514 = !DISubprogram(name: "vfwprintf", scope: !496, file: !496, line: 124, type: !515, flags: DIFlagPrototyped, spFlags: 0)
!515 = !DISubroutineType(types: !516)
!516 = !{!7, !499, !500, !517}
!517 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_va_list", file: !294, line: 95, baseType: !518)
!518 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !24, baseType: !437)
!519 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !520, file: !421, line: 141)
!520 = !DISubprogram(name: "vswprintf", scope: !496, file: !496, line: 126, type: !521, flags: DIFlagPrototyped, spFlags: 0)
!521 = !DISubroutineType(types: !522)
!522 = !{!7, !509, !510, !500, !517}
!523 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !524, file: !421, line: 142)
!524 = !DISubprogram(name: "swscanf", scope: !496, file: !496, line: 122, type: !525, flags: DIFlagPrototyped, spFlags: 0)
!525 = !DISubroutineType(types: !526)
!526 = !{!7, !500, !500, null}
!527 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !528, file: !421, line: 143)
!528 = !DISubprogram(name: "vfwscanf", scope: !496, file: !496, line: 195, type: !515, flags: DIFlagPrototyped, spFlags: 0)
!529 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !530, file: !421, line: 144)
!530 = !DISubprogram(name: "vswscanf", scope: !496, file: !496, line: 197, type: !531, flags: DIFlagPrototyped, spFlags: 0)
!531 = !DISubroutineType(types: !532)
!532 = !{!7, !500, !500, !517}
!533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !534, file: !421, line: 145)
!534 = !DISubprogram(name: "fgetwc", scope: !496, file: !496, line: 100, type: !535, flags: DIFlagPrototyped, spFlags: 0)
!535 = !DISubroutineType(types: !536)
!536 = !{!344, !499}
!537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !538, file: !421, line: 146)
!538 = !DISubprogram(name: "fgetws", scope: !496, file: !496, line: 102, type: !539, flags: DIFlagPrototyped, spFlags: 0)
!539 = !DISubroutineType(types: !540)
!540 = !{!509, !509, !7, !499}
!541 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !542, file: !421, line: 147)
!542 = !DISubprogram(name: "fputwc", scope: !496, file: !496, line: 104, type: !543, flags: DIFlagPrototyped, spFlags: 0)
!543 = !DISubroutineType(types: !544)
!544 = !{!344, !502, !499}
!545 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !546, file: !421, line: 148)
!546 = !DISubprogram(name: "fputws", scope: !496, file: !496, line: 105, type: !547, flags: DIFlagPrototyped, spFlags: 0)
!547 = !DISubroutineType(types: !548)
!548 = !{!7, !500, !499}
!549 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !550, file: !421, line: 149)
!550 = !DISubprogram(name: "fwide", scope: !496, file: !496, line: 106, type: !551, flags: DIFlagPrototyped, spFlags: 0)
!551 = !DISubroutineType(types: !552)
!552 = !{!7, !499, !7}
!553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !554, file: !421, line: 150)
!554 = !DISubprogram(name: "getwc", scope: !496, file: !496, line: 109, type: !535, flags: DIFlagPrototyped, spFlags: 0)
!555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !556, file: !421, line: 151)
!556 = !DISubprogram(name: "putwc", scope: !496, file: !496, line: 118, type: !543, flags: DIFlagPrototyped, spFlags: 0)
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !558, file: !421, line: 152)
!558 = !DISubprogram(name: "ungetwc", scope: !496, file: !496, line: 123, type: !559, flags: DIFlagPrototyped, spFlags: 0)
!559 = !DISubroutineType(types: !560)
!560 = !{!344, !344, !499}
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !562, file: !421, line: 153)
!562 = !DISubprogram(name: "wcstod", scope: !496, file: !496, line: 160, type: !563, flags: DIFlagPrototyped, spFlags: 0)
!563 = !DISubroutineType(types: !564)
!564 = !{!565, !500, !566}
!565 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!566 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !509, size: 64)
!567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !568, file: !421, line: 154)
!568 = !DISubprogram(name: "wcstof", scope: !496, file: !496, line: 200, type: !569, flags: DIFlagPrototyped, spFlags: 0)
!569 = !DISubroutineType(types: !570)
!570 = !{!571, !500, !566}
!571 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!572 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !573, file: !421, line: 155)
!573 = !DISubprogram(name: "wcstold", scope: !496, file: !496, line: 202, type: !574, flags: DIFlagPrototyped, spFlags: 0)
!574 = !DISubroutineType(types: !575)
!575 = !{!309, !500, !566}
!576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !577, file: !421, line: 156)
!577 = !DISubprogram(name: "wcstol", scope: !496, file: !496, line: 164, type: !578, flags: DIFlagPrototyped, spFlags: 0)
!578 = !DISubroutineType(types: !579)
!579 = !{!295, !500, !566, !7}
!580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !581, file: !421, line: 157)
!581 = !DISubprogram(name: "wcstoll", scope: !496, file: !496, line: 205, type: !582, flags: DIFlagPrototyped, spFlags: 0)
!582 = !DISubroutineType(types: !583)
!583 = !{!20, !500, !566, !7}
!584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !585, file: !421, line: 158)
!585 = !DISubprogram(name: "wcstoul", scope: !496, file: !496, line: 167, type: !586, flags: DIFlagPrototyped, spFlags: 0)
!586 = !DISubroutineType(types: !587)
!587 = !{!299, !500, !566, !7}
!588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !589, file: !421, line: 159)
!589 = !DISubprogram(name: "wcstoull", scope: !496, file: !496, line: 207, type: !590, flags: DIFlagPrototyped, spFlags: 0)
!590 = !DISubroutineType(types: !591)
!591 = !{!256, !500, !566, !7}
!592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !593, file: !421, line: 160)
!593 = !DISubprogram(name: "wcscpy", scope: !496, file: !496, line: 134, type: !594, flags: DIFlagPrototyped, spFlags: 0)
!594 = !DISubroutineType(types: !595)
!595 = !{!509, !509, !500}
!596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !597, file: !421, line: 161)
!597 = !DISubprogram(name: "wcsncpy", scope: !496, file: !496, line: 148, type: !598, flags: DIFlagPrototyped, spFlags: 0)
!598 = !DISubroutineType(types: !599)
!599 = !{!509, !509, !500, !510}
!600 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !601, file: !421, line: 162)
!601 = !DISubprogram(name: "wcscat", scope: !496, file: !496, line: 130, type: !594, flags: DIFlagPrototyped, spFlags: 0)
!602 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !603, file: !421, line: 163)
!603 = !DISubprogram(name: "wcsncat", scope: !496, file: !496, line: 142, type: !598, flags: DIFlagPrototyped, spFlags: 0)
!604 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !605, file: !421, line: 164)
!605 = !DISubprogram(name: "wcscmp", scope: !496, file: !496, line: 132, type: !606, flags: DIFlagPrototyped, spFlags: 0)
!606 = !DISubroutineType(types: !607)
!607 = !{!7, !500, !500}
!608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !609, file: !421, line: 165)
!609 = !DISubprogram(name: "wcscoll", scope: !496, file: !496, line: 133, type: !606, flags: DIFlagPrototyped, spFlags: 0)
!610 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !611, file: !421, line: 166)
!611 = !DISubprogram(name: "wcsncmp", scope: !496, file: !496, line: 145, type: !612, flags: DIFlagPrototyped, spFlags: 0)
!612 = !DISubroutineType(types: !613)
!613 = !{!7, !500, !500, !510}
!614 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !615, file: !421, line: 167)
!615 = !DISubprogram(name: "wcsxfrm", scope: !496, file: !496, line: 157, type: !616, flags: DIFlagPrototyped, spFlags: 0)
!616 = !DISubroutineType(types: !617)
!617 = !{!510, !509, !500, !510}
!618 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !619, file: !421, line: 168)
!619 = !DISubprogram(name: "wcschr", linkageName: "_Z6wcschrB8ne200100Ua9enable_ifILb1EEPww", scope: !620, file: !620, line: 147, type: !621, flags: DIFlagPrototyped, spFlags: 0)
!620 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/wchar.h", directory: "")
!621 = !DISubroutineType(types: !622)
!622 = !{!509, !509, !502}
!623 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !624, file: !421, line: 169)
!624 = !DISubprogram(name: "wcspbrk", linkageName: "_Z7wcspbrkB8ne200100Ua9enable_ifILb1EEPwPKw", scope: !620, file: !620, line: 158, type: !594, flags: DIFlagPrototyped, spFlags: 0)
!625 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !626, file: !421, line: 170)
!626 = !DISubprogram(name: "wcsrchr", linkageName: "_Z7wcsrchrB8ne200100Ua9enable_ifILb1EEPww", scope: !620, file: !620, line: 168, type: !621, flags: DIFlagPrototyped, spFlags: 0)
!627 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !628, file: !421, line: 171)
!628 = !DISubprogram(name: "wcsstr", linkageName: "_Z6wcsstrB8ne200100Ua9enable_ifILb1EEPwPKw", scope: !620, file: !620, line: 179, type: !594, flags: DIFlagPrototyped, spFlags: 0)
!629 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !630, file: !421, line: 172)
!630 = !DISubprogram(name: "wmemchr", linkageName: "_Z7wmemchrB8ne200100Ua9enable_ifILb1EEPwwm", scope: !620, file: !620, line: 190, type: !631, flags: DIFlagPrototyped, spFlags: 0)
!631 = !DISubroutineType(types: !632)
!632 = !{!509, !509, !502, !510}
!633 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !634, file: !421, line: 173)
!634 = !DISubprogram(name: "wcscspn", scope: !496, file: !496, line: 136, type: !635, flags: DIFlagPrototyped, spFlags: 0)
!635 = !DISubroutineType(types: !636)
!636 = !{!510, !500, !500}
!637 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !638, file: !421, line: 174)
!638 = !DISubprogram(name: "wcslen", scope: !496, file: !496, line: 140, type: !639, flags: DIFlagPrototyped, spFlags: 0)
!639 = !DISubroutineType(types: !640)
!640 = !{!510, !500}
!641 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !642, file: !421, line: 175)
!642 = !DISubprogram(name: "wcsspn", scope: !496, file: !496, line: 155, type: !635, flags: DIFlagPrototyped, spFlags: 0)
!643 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !644, file: !421, line: 176)
!644 = !DISubprogram(name: "wcstok", scope: !496, file: !496, line: 162, type: !645, flags: DIFlagPrototyped, spFlags: 0)
!645 = !DISubroutineType(types: !646)
!646 = !{!509, !509, !500, !566}
!647 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !648, file: !421, line: 177)
!648 = !DISubprogram(name: "wmemcmp", scope: !496, file: !496, line: 170, type: !612, flags: DIFlagPrototyped, spFlags: 0)
!649 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !650, file: !421, line: 178)
!650 = !DISubprogram(name: "wmemcpy", scope: !496, file: !496, line: 173, type: !598, flags: DIFlagPrototyped, spFlags: 0)
!651 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !652, file: !421, line: 179)
!652 = !DISubprogram(name: "wmemmove", scope: !496, file: !496, line: 176, type: !598, flags: DIFlagPrototyped, spFlags: 0)
!653 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !654, file: !421, line: 180)
!654 = !DISubprogram(name: "wmemset", scope: !496, file: !496, line: 179, type: !631, flags: DIFlagPrototyped, spFlags: 0)
!655 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !656, file: !421, line: 181)
!656 = !DISubprogram(name: "wcsftime", linkageName: "\01_wcsftime", scope: !496, file: !496, line: 137, type: !657, flags: DIFlagPrototyped, spFlags: 0)
!657 = !DISubroutineType(types: !658)
!658 = !{!510, !509, !510, !500, !659}
!659 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !660, size: 64)
!660 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !423)
!661 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !662, file: !421, line: 182)
!662 = !DISubprogram(name: "btowc", scope: !496, file: !496, line: 99, type: !663, flags: DIFlagPrototyped, spFlags: 0)
!663 = !DISubroutineType(types: !664)
!664 = !{!344, !7}
!665 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !666, file: !421, line: 183)
!666 = !DISubprogram(name: "wctob", scope: !496, file: !496, line: 159, type: !361, flags: DIFlagPrototyped, spFlags: 0)
!667 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !668, file: !421, line: 184)
!668 = !DISubprogram(name: "mbsinit", scope: !496, file: !496, line: 115, type: !669, flags: DIFlagPrototyped, spFlags: 0)
!669 = !DISubroutineType(types: !670)
!670 = !{!7, !671}
!671 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !672, size: 64)
!672 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !410)
!673 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !674, file: !421, line: 185)
!674 = !DISubprogram(name: "mbrlen", scope: !496, file: !496, line: 111, type: !675, flags: DIFlagPrototyped, spFlags: 0)
!675 = !DISubroutineType(types: !676)
!676 = !{!510, !394, !510, !677}
!677 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !410, size: 64)
!678 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !679, file: !421, line: 186)
!679 = !DISubprogram(name: "mbrtowc", scope: !496, file: !496, line: 113, type: !680, flags: DIFlagPrototyped, spFlags: 0)
!680 = !DISubroutineType(types: !681)
!681 = !{!510, !509, !394, !510, !677}
!682 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !683, file: !421, line: 187)
!683 = !DISubprogram(name: "wcrtomb", scope: !496, file: !496, line: 129, type: !684, flags: DIFlagPrototyped, spFlags: 0)
!684 = !DISubroutineType(types: !685)
!685 = !{!510, !437, !502, !677}
!686 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !687, file: !421, line: 188)
!687 = !DISubprogram(name: "mbsrtowcs", scope: !496, file: !496, line: 116, type: !688, flags: DIFlagPrototyped, spFlags: 0)
!688 = !DISubroutineType(types: !689)
!689 = !{!510, !509, !690, !510, !677}
!690 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !394, size: 64)
!691 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !692, file: !421, line: 189)
!692 = !DISubprogram(name: "wcsrtombs", scope: !496, file: !496, line: 153, type: !693, flags: DIFlagPrototyped, spFlags: 0)
!693 = !DISubroutineType(types: !694)
!694 = !{!510, !437, !695, !510, !677}
!695 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !500, size: 64)
!696 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !697, file: !421, line: 191)
!697 = !DISubprogram(name: "getwchar", scope: !496, file: !496, line: 110, type: !698, flags: DIFlagPrototyped, spFlags: 0)
!698 = !DISubroutineType(types: !699)
!699 = !{!344}
!700 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !701, file: !421, line: 192)
!701 = !DISubprogram(name: "vwscanf", scope: !496, file: !496, line: 199, type: !702, flags: DIFlagPrototyped, spFlags: 0)
!702 = !DISubroutineType(types: !703)
!703 = !{!7, !500, !517}
!704 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !705, file: !421, line: 193)
!705 = !DISubprogram(name: "wscanf", scope: !496, file: !496, line: 181, type: !706, flags: DIFlagPrototyped, spFlags: 0)
!706 = !DISubroutineType(types: !707)
!707 = !{!7, !500, null}
!708 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !709, file: !421, line: 195)
!709 = !DISubprogram(name: "putwchar", scope: !496, file: !496, line: 119, type: !710, flags: DIFlagPrototyped, spFlags: 0)
!710 = !DISubroutineType(types: !711)
!711 = !{!344, !502}
!712 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !713, file: !421, line: 196)
!713 = !DISubprogram(name: "vwprintf", scope: !496, file: !496, line: 128, type: !702, flags: DIFlagPrototyped, spFlags: 0)
!714 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !715, file: !421, line: 197)
!715 = !DISubprogram(name: "wprintf", scope: !496, file: !496, line: 180, type: !706, flags: DIFlagPrototyped, spFlags: 0)
!716 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !717, file: !723, line: 82)
!717 = !DISubprogram(name: "memcpy", scope: !718, file: !718, line: 78, type: !719, flags: DIFlagPrototyped, spFlags: 0)
!718 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_string.h", directory: "", checksumkind: CSK_MD5, checksum: "c67be38c725261ca8572072ee1574b87")
!719 = !DISubroutineType(types: !720)
!720 = !{!457, !457, !721, !510}
!721 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !722, size: 64)
!722 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!723 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstring", directory: "")
!724 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !725, file: !723, line: 83)
!725 = !DISubprogram(name: "memmove", scope: !718, file: !718, line: 81, type: !719, flags: DIFlagPrototyped, spFlags: 0)
!726 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !727, file: !723, line: 84)
!727 = !DISubprogram(name: "strcpy", scope: !718, file: !718, line: 92, type: !728, flags: DIFlagPrototyped, spFlags: 0)
!728 = !DISubroutineType(types: !729)
!729 = !{!437, !437, !394}
!730 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !731, file: !723, line: 85)
!731 = !DISubprogram(name: "strncpy", scope: !718, file: !718, line: 104, type: !732, flags: DIFlagPrototyped, spFlags: 0)
!732 = !DISubroutineType(types: !733)
!733 = !{!437, !437, !394, !510}
!734 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !735, file: !723, line: 86)
!735 = !DISubprogram(name: "strcat", scope: !718, file: !718, line: 86, type: !728, flags: DIFlagPrototyped, spFlags: 0)
!736 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !737, file: !723, line: 87)
!737 = !DISubprogram(name: "strncat", scope: !718, file: !718, line: 98, type: !732, flags: DIFlagPrototyped, spFlags: 0)
!738 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !739, file: !723, line: 88)
!739 = !DISubprogram(name: "memcmp", scope: !718, file: !718, line: 75, type: !740, flags: DIFlagPrototyped, spFlags: 0)
!740 = !DISubroutineType(types: !741)
!741 = !{!7, !721, !721, !510}
!742 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !743, file: !723, line: 89)
!743 = !DISubprogram(name: "strcmp", scope: !718, file: !718, line: 89, type: !744, flags: DIFlagPrototyped, spFlags: 0)
!744 = !DISubroutineType(types: !745)
!745 = !{!7, !394, !394}
!746 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !747, file: !723, line: 90)
!747 = !DISubprogram(name: "strncmp", scope: !718, file: !718, line: 101, type: !748, flags: DIFlagPrototyped, spFlags: 0)
!748 = !DISubroutineType(types: !749)
!749 = !{!7, !394, !394, !510}
!750 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !751, file: !723, line: 91)
!751 = !DISubprogram(name: "strcoll", scope: !718, file: !718, line: 90, type: !744, flags: DIFlagPrototyped, spFlags: 0)
!752 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !753, file: !723, line: 92)
!753 = !DISubprogram(name: "strxfrm", scope: !718, file: !718, line: 112, type: !754, flags: DIFlagPrototyped, spFlags: 0)
!754 = !DISubroutineType(types: !755)
!755 = !{!510, !437, !394, !510}
!756 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !757, file: !723, line: 93)
!757 = !DISubprogram(name: "memchr", linkageName: "_Z6memchrB8ne200100Ua9enable_ifILb1EEPvim", scope: !758, file: !758, line: 101, type: !759, flags: DIFlagPrototyped, spFlags: 0)
!758 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/string.h", directory: "")
!759 = !DISubroutineType(types: !760)
!760 = !{!457, !457, !7, !510}
!761 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !762, file: !723, line: 94)
!762 = !DISubprogram(name: "strchr", linkageName: "_Z6strchrB8ne200100Ua9enable_ifILb1EEPci", scope: !758, file: !758, line: 80, type: !763, flags: DIFlagPrototyped, spFlags: 0)
!763 = !DISubroutineType(types: !764)
!764 = !{!437, !437, !7}
!765 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !766, file: !723, line: 95)
!766 = !DISubprogram(name: "strcspn", scope: !718, file: !718, line: 94, type: !767, flags: DIFlagPrototyped, spFlags: 0)
!767 = !DISubroutineType(types: !768)
!768 = !{!510, !394, !394}
!769 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !770, file: !723, line: 96)
!770 = !DISubprogram(name: "strpbrk", linkageName: "_Z7strpbrkB8ne200100Ua9enable_ifILb1EEPcPKc", scope: !758, file: !758, line: 87, type: !728, flags: DIFlagPrototyped, spFlags: 0)
!771 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !772, file: !723, line: 97)
!772 = !DISubprogram(name: "strrchr", linkageName: "_Z7strrchrB8ne200100Ua9enable_ifILb1EEPci", scope: !758, file: !758, line: 94, type: !763, flags: DIFlagPrototyped, spFlags: 0)
!773 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !774, file: !723, line: 98)
!774 = !DISubprogram(name: "strspn", scope: !718, file: !718, line: 109, type: !767, flags: DIFlagPrototyped, spFlags: 0)
!775 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !776, file: !723, line: 99)
!776 = !DISubprogram(name: "strstr", linkageName: "_Z6strstrB8ne200100Ua9enable_ifILb1EEPcPKc", scope: !758, file: !758, line: 108, type: !728, flags: DIFlagPrototyped, spFlags: 0)
!777 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !778, file: !723, line: 100)
!778 = !DISubprogram(name: "strtok", scope: !718, file: !718, line: 111, type: !728, flags: DIFlagPrototyped, spFlags: 0)
!779 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !780, file: !723, line: 101)
!780 = !DISubprogram(name: "memset", scope: !718, file: !718, line: 84, type: !759, flags: DIFlagPrototyped, spFlags: 0)
!781 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !782, file: !723, line: 102)
!782 = !DISubprogram(name: "strerror", linkageName: "\01_strerror", scope: !718, file: !718, line: 95, type: !783, flags: DIFlagPrototyped, spFlags: 0)
!783 = !DISubroutineType(types: !784)
!784 = !{!437, !7}
!785 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !786, file: !723, line: 103)
!786 = !DISubprogram(name: "strlen", scope: !718, file: !718, line: 96, type: !787, flags: DIFlagPrototyped, spFlags: 0)
!787 = !DISubroutineType(types: !788)
!788 = !{!510, !394}
!789 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !790, file: !796, line: 422)
!790 = !DISubprogram(name: "isfinite", linkageName: "_ZNSt3__16__math8isfiniteB8ne200100Ee", scope: !792, file: !791, line: 79, type: !793, flags: DIFlagPrototyped, spFlags: 0)
!791 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__math/traits.h", directory: "")
!792 = !DINamespace(name: "__math", scope: !239)
!793 = !DISubroutineType(types: !794)
!794 = !{!795, !309}
!795 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!796 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/math.h", directory: "")
!797 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !798, file: !796, line: 425)
!798 = !DISubprogram(name: "isinf", linkageName: "_ZNSt3__16__math5isinfB8ne200100Ee", scope: !792, file: !791, line: 103, type: !793, flags: DIFlagPrototyped, spFlags: 0)
!799 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !800, file: !796, line: 429)
!800 = !DISubprogram(name: "isnan", linkageName: "_ZNSt3__16__math5isnanB8ne200100Ee", scope: !792, file: !791, line: 127, type: !793, flags: DIFlagPrototyped, spFlags: 0)
!801 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !802, file: !796, line: 430)
!802 = !DISubprogram(name: "isnormal", linkageName: "_ZNSt3__16__math8isnormalB8ne200100Ee", scope: !792, file: !791, line: 146, type: !793, flags: DIFlagPrototyped, spFlags: 0)
!803 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !804, file: !796, line: 485)
!804 = !DISubprogram(name: "modf", linkageName: "_ZNSt3__16__math4modfB8ne200100EePe", scope: !792, file: !805, line: 55, type: !806, flags: DIFlagPrototyped, spFlags: 0)
!805 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__math/modulo.h", directory: "")
!806 = !DISubroutineType(types: !807)
!807 = !{!309, !309, !808}
!808 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !309, size: 64)
!809 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !790, file: !810, line: 352)
!810 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cmath", directory: "")
!811 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !798, file: !810, line: 353)
!812 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !800, file: !810, line: 354)
!813 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !802, file: !810, line: 355)
!814 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !815, file: !810, line: 364)
!815 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !816, line: 50, baseType: !571)
!816 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/math.h", directory: "", checksumkind: CSK_MD5, checksum: "35b1ff63542c2c0c144330dd9277d2dc")
!817 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !818, file: !810, line: 365)
!818 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !816, line: 51, baseType: !565)
!819 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !820, file: !810, line: 367)
!820 = !DISubprogram(name: "abs", linkageName: "_Z3absB8ne200100e", scope: !821, file: !821, line: 123, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!821 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/stdlib.h", directory: "")
!822 = !DISubroutineType(types: !823)
!823 = !{!309, !309}
!824 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !825, file: !810, line: 370)
!825 = !DISubprogram(name: "acosf", scope: !816, file: !816, line: 314, type: !826, flags: DIFlagPrototyped, spFlags: 0)
!826 = !DISubroutineType(types: !827)
!827 = !{!571, !571}
!828 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !829, file: !810, line: 372)
!829 = !DISubprogram(name: "asinf", scope: !816, file: !816, line: 318, type: !826, flags: DIFlagPrototyped, spFlags: 0)
!830 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !831, file: !810, line: 374)
!831 = !DISubprogram(name: "atanf", scope: !816, file: !816, line: 322, type: !826, flags: DIFlagPrototyped, spFlags: 0)
!832 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !833, file: !810, line: 376)
!833 = !DISubprogram(name: "atan2f", scope: !816, file: !816, line: 326, type: !834, flags: DIFlagPrototyped, spFlags: 0)
!834 = !DISubroutineType(types: !835)
!835 = !{!571, !571, !571}
!836 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !837, file: !810, line: 378)
!837 = !DISubprogram(name: "ceilf", scope: !816, file: !816, line: 461, type: !826, flags: DIFlagPrototyped, spFlags: 0)
!838 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !839, file: !810, line: 380)
!839 = !DISubprogram(name: "cosf", scope: !816, file: !816, line: 330, type: !826, flags: DIFlagPrototyped, spFlags: 0)
!840 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !841, file: !810, line: 382)
!841 = !DISubprogram(name: "coshf", scope: !816, file: !816, line: 354, type: !826, flags: DIFlagPrototyped, spFlags: 0)
!842 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !843, file: !810, line: 385)
!843 = !DISubprogram(name: "expf", scope: !816, file: !816, line: 366, type: !826, flags: DIFlagPrototyped, spFlags: 0)
!844 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !845, file: !810, line: 388)
!845 = !DISubprogram(name: "fabsf", scope: !816, file: !816, line: 422, type: !826, flags: DIFlagPrototyped, spFlags: 0)
!846 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !847, file: !810, line: 390)
!847 = !DISubprogram(name: "floorf", scope: !816, file: !816, line: 465, type: !826, flags: DIFlagPrototyped, spFlags: 0)
!848 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !849, file: !810, line: 393)
!849 = !DISubprogram(name: "fmodf", scope: !816, file: !816, line: 505, type: !834, flags: DIFlagPrototyped, spFlags: 0)
!850 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !851, file: !810, line: 396)
!851 = !DISubprogram(name: "frexpf", scope: !816, file: !816, line: 406, type: !852, flags: DIFlagPrototyped, spFlags: 0)
!852 = !DISubroutineType(types: !853)
!853 = !{!571, !571, !854}
!854 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!855 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !856, file: !810, line: 398)
!856 = !DISubprogram(name: "ldexpf", scope: !816, file: !816, line: 402, type: !857, flags: DIFlagPrototyped, spFlags: 0)
!857 = !DISubroutineType(types: !858)
!858 = !{!571, !571, !7}
!859 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !860, file: !810, line: 401)
!860 = !DISubprogram(name: "logf", scope: !816, file: !816, line: 378, type: !826, flags: DIFlagPrototyped, spFlags: 0)
!861 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !862, file: !810, line: 404)
!862 = !DISubprogram(name: "log10f", scope: !816, file: !816, line: 382, type: !826, flags: DIFlagPrototyped, spFlags: 0)
!863 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !804, file: !810, line: 405)
!864 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !865, file: !810, line: 406)
!865 = !DISubprogram(name: "modff", scope: !816, file: !816, line: 398, type: !866, flags: DIFlagPrototyped, spFlags: 0)
!866 = !DISubroutineType(types: !867)
!867 = !{!571, !571, !868}
!868 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !571, size: 64)
!869 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !870, file: !810, line: 409)
!870 = !DISubprogram(name: "powf", scope: !816, file: !816, line: 434, type: !834, flags: DIFlagPrototyped, spFlags: 0)
!871 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !872, file: !810, line: 412)
!872 = !DISubprogram(name: "sinf", scope: !816, file: !816, line: 334, type: !826, flags: DIFlagPrototyped, spFlags: 0)
!873 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !874, file: !810, line: 414)
!874 = !DISubprogram(name: "sinhf", scope: !816, file: !816, line: 358, type: !826, flags: DIFlagPrototyped, spFlags: 0)
!875 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !876, file: !810, line: 417)
!876 = !DISubprogram(name: "sqrtf", scope: !816, file: !816, line: 438, type: !826, flags: DIFlagPrototyped, spFlags: 0)
!877 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !878, file: !810, line: 419)
!878 = !DISubprogram(name: "tanf", scope: !816, file: !816, line: 338, type: !826, flags: DIFlagPrototyped, spFlags: 0)
!879 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !880, file: !810, line: 422)
!880 = !DISubprogram(name: "tanhf", scope: !816, file: !816, line: 362, type: !826, flags: DIFlagPrototyped, spFlags: 0)
!881 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !882, file: !810, line: 425)
!882 = !DISubprogram(name: "acoshf", scope: !816, file: !816, line: 342, type: !826, flags: DIFlagPrototyped, spFlags: 0)
!883 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !884, file: !810, line: 427)
!884 = !DISubprogram(name: "asinhf", scope: !816, file: !816, line: 346, type: !826, flags: DIFlagPrototyped, spFlags: 0)
!885 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !886, file: !810, line: 429)
!886 = !DISubprogram(name: "atanhf", scope: !816, file: !816, line: 350, type: !826, flags: DIFlagPrototyped, spFlags: 0)
!887 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !888, file: !810, line: 431)
!888 = !DISubprogram(name: "cbrtf", scope: !816, file: !816, line: 426, type: !826, flags: DIFlagPrototyped, spFlags: 0)
!889 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !890, file: !810, line: 434)
!890 = !DISubprogram(name: "copysignf", scope: !816, file: !816, line: 517, type: !834, flags: DIFlagPrototyped, spFlags: 0)
!891 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !892, file: !810, line: 437)
!892 = !DISubprogram(name: "erff", scope: !816, file: !816, line: 442, type: !826, flags: DIFlagPrototyped, spFlags: 0)
!893 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !894, file: !810, line: 439)
!894 = !DISubprogram(name: "erfcf", scope: !816, file: !816, line: 446, type: !826, flags: DIFlagPrototyped, spFlags: 0)
!895 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !896, file: !810, line: 441)
!896 = !DISubprogram(name: "exp2f", scope: !816, file: !816, line: 370, type: !826, flags: DIFlagPrototyped, spFlags: 0)
!897 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !898, file: !810, line: 443)
!898 = !DISubprogram(name: "expm1f", scope: !816, file: !816, line: 374, type: !826, flags: DIFlagPrototyped, spFlags: 0)
!899 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !900, file: !810, line: 445)
!900 = !DISubprogram(name: "fdimf", scope: !816, file: !816, line: 533, type: !834, flags: DIFlagPrototyped, spFlags: 0)
!901 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !902, file: !810, line: 446)
!902 = !DISubprogram(name: "fmaf", scope: !816, file: !816, line: 545, type: !903, flags: DIFlagPrototyped, spFlags: 0)
!903 = !DISubroutineType(types: !904)
!904 = !{!571, !571, !571, !571}
!905 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !906, file: !810, line: 449)
!906 = !DISubprogram(name: "fmaxf", scope: !816, file: !816, line: 537, type: !834, flags: DIFlagPrototyped, spFlags: 0)
!907 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !908, file: !810, line: 451)
!908 = !DISubprogram(name: "fminf", scope: !816, file: !816, line: 541, type: !834, flags: DIFlagPrototyped, spFlags: 0)
!909 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !910, file: !810, line: 453)
!910 = !DISubprogram(name: "hypotf", scope: !816, file: !816, line: 430, type: !834, flags: DIFlagPrototyped, spFlags: 0)
!911 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !912, file: !810, line: 455)
!912 = !DISubprogram(name: "ilogbf", scope: !816, file: !816, line: 410, type: !913, flags: DIFlagPrototyped, spFlags: 0)
!913 = !DISubroutineType(types: !914)
!914 = !{!7, !571}
!915 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !916, file: !810, line: 457)
!916 = !DISubprogram(name: "lgammaf", scope: !816, file: !816, line: 453, type: !826, flags: DIFlagPrototyped, spFlags: 0)
!917 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !918, file: !810, line: 459)
!918 = !DISubprogram(name: "llrintf", scope: !816, file: !816, line: 492, type: !919, flags: DIFlagPrototyped, spFlags: 0)
!919 = !DISubroutineType(types: !920)
!920 = !{!20, !571}
!921 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !922, file: !810, line: 461)
!922 = !DISubprogram(name: "llroundf", scope: !816, file: !816, line: 496, type: !919, flags: DIFlagPrototyped, spFlags: 0)
!923 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !924, file: !810, line: 463)
!924 = !DISubprogram(name: "log1pf", scope: !816, file: !816, line: 390, type: !826, flags: DIFlagPrototyped, spFlags: 0)
!925 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !926, file: !810, line: 465)
!926 = !DISubprogram(name: "log2f", scope: !816, file: !816, line: 386, type: !826, flags: DIFlagPrototyped, spFlags: 0)
!927 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !928, file: !810, line: 467)
!928 = !DISubprogram(name: "logbf", scope: !816, file: !816, line: 394, type: !826, flags: DIFlagPrototyped, spFlags: 0)
!929 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !930, file: !810, line: 469)
!930 = !DISubprogram(name: "lrintf", scope: !816, file: !816, line: 477, type: !931, flags: DIFlagPrototyped, spFlags: 0)
!931 = !DISubroutineType(types: !932)
!932 = !{!295, !571}
!933 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !934, file: !810, line: 471)
!934 = !DISubprogram(name: "lroundf", scope: !816, file: !816, line: 485, type: !931, flags: DIFlagPrototyped, spFlags: 0)
!935 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !936, file: !810, line: 473)
!936 = !DISubprogram(name: "nan", scope: !816, file: !816, line: 522, type: !937, flags: DIFlagPrototyped, spFlags: 0)
!937 = !DISubroutineType(types: !938)
!938 = !{!565, !394}
!939 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !940, file: !810, line: 474)
!940 = !DISubprogram(name: "nanf", scope: !816, file: !816, line: 521, type: !941, flags: DIFlagPrototyped, spFlags: 0)
!941 = !DISubroutineType(types: !942)
!942 = !{!571, !394}
!943 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !944, file: !810, line: 477)
!944 = !DISubprogram(name: "nearbyintf", scope: !816, file: !816, line: 469, type: !826, flags: DIFlagPrototyped, spFlags: 0)
!945 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !946, file: !810, line: 479)
!946 = !DISubprogram(name: "nextafterf", scope: !816, file: !816, line: 525, type: !834, flags: DIFlagPrototyped, spFlags: 0)
!947 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !948, file: !810, line: 481)
!948 = !DISubprogram(name: "nexttowardf", scope: !816, file: !816, line: 530, type: !949, flags: DIFlagPrototyped, spFlags: 0)
!949 = !DISubroutineType(types: !950)
!950 = !{!571, !571, !309}
!951 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !952, file: !810, line: 483)
!952 = !DISubprogram(name: "remainderf", scope: !816, file: !816, line: 509, type: !834, flags: DIFlagPrototyped, spFlags: 0)
!953 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !954, file: !810, line: 485)
!954 = !DISubprogram(name: "remquof", scope: !816, file: !816, line: 513, type: !955, flags: DIFlagPrototyped, spFlags: 0)
!955 = !DISubroutineType(types: !956)
!956 = !{!571, !571, !571, !854}
!957 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !958, file: !810, line: 487)
!958 = !DISubprogram(name: "rintf", scope: !816, file: !816, line: 473, type: !826, flags: DIFlagPrototyped, spFlags: 0)
!959 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !960, file: !810, line: 489)
!960 = !DISubprogram(name: "roundf", scope: !816, file: !816, line: 481, type: !826, flags: DIFlagPrototyped, spFlags: 0)
!961 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !962, file: !810, line: 491)
!962 = !DISubprogram(name: "scalblnf", scope: !816, file: !816, line: 418, type: !963, flags: DIFlagPrototyped, spFlags: 0)
!963 = !DISubroutineType(types: !964)
!964 = !{!571, !571, !295}
!965 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !966, file: !810, line: 493)
!966 = !DISubprogram(name: "scalbnf", scope: !816, file: !816, line: 414, type: !857, flags: DIFlagPrototyped, spFlags: 0)
!967 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !968, file: !810, line: 495)
!968 = !DISubprogram(name: "tgammaf", scope: !816, file: !816, line: 457, type: !826, flags: DIFlagPrototyped, spFlags: 0)
!969 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !970, file: !810, line: 497)
!970 = !DISubprogram(name: "truncf", scope: !816, file: !816, line: 501, type: !826, flags: DIFlagPrototyped, spFlags: 0)
!971 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !972, file: !810, line: 499)
!972 = !DISubprogram(name: "acosl", scope: !816, file: !816, line: 316, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!973 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !974, file: !810, line: 500)
!974 = !DISubprogram(name: "asinl", scope: !816, file: !816, line: 320, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!975 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !976, file: !810, line: 501)
!976 = !DISubprogram(name: "atanl", scope: !816, file: !816, line: 324, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!977 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !978, file: !810, line: 502)
!978 = !DISubprogram(name: "atan2l", scope: !816, file: !816, line: 328, type: !979, flags: DIFlagPrototyped, spFlags: 0)
!979 = !DISubroutineType(types: !980)
!980 = !{!309, !309, !309}
!981 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !982, file: !810, line: 503)
!982 = !DISubprogram(name: "ceill", scope: !816, file: !816, line: 463, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!983 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !984, file: !810, line: 504)
!984 = !DISubprogram(name: "cosl", scope: !816, file: !816, line: 332, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!985 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !986, file: !810, line: 505)
!986 = !DISubprogram(name: "coshl", scope: !816, file: !816, line: 356, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!987 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !988, file: !810, line: 506)
!988 = !DISubprogram(name: "expl", scope: !816, file: !816, line: 368, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!989 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !990, file: !810, line: 507)
!990 = !DISubprogram(name: "fabsl", scope: !816, file: !816, line: 424, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!991 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !992, file: !810, line: 508)
!992 = !DISubprogram(name: "floorl", scope: !816, file: !816, line: 467, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!993 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !994, file: !810, line: 509)
!994 = !DISubprogram(name: "fmodl", scope: !816, file: !816, line: 507, type: !979, flags: DIFlagPrototyped, spFlags: 0)
!995 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !996, file: !810, line: 510)
!996 = !DISubprogram(name: "frexpl", scope: !816, file: !816, line: 408, type: !997, flags: DIFlagPrototyped, spFlags: 0)
!997 = !DISubroutineType(types: !998)
!998 = !{!309, !309, !854}
!999 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1000, file: !810, line: 511)
!1000 = !DISubprogram(name: "ldexpl", scope: !816, file: !816, line: 404, type: !1001, flags: DIFlagPrototyped, spFlags: 0)
!1001 = !DISubroutineType(types: !1002)
!1002 = !{!309, !309, !7}
!1003 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1004, file: !810, line: 512)
!1004 = !DISubprogram(name: "logl", scope: !816, file: !816, line: 380, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!1005 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1006, file: !810, line: 513)
!1006 = !DISubprogram(name: "log10l", scope: !816, file: !816, line: 384, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!1007 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1008, file: !810, line: 514)
!1008 = !DISubprogram(name: "modfl", scope: !816, file: !816, line: 400, type: !806, flags: DIFlagPrototyped, spFlags: 0)
!1009 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1010, file: !810, line: 515)
!1010 = !DISubprogram(name: "powl", scope: !816, file: !816, line: 436, type: !979, flags: DIFlagPrototyped, spFlags: 0)
!1011 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1012, file: !810, line: 516)
!1012 = !DISubprogram(name: "sinl", scope: !816, file: !816, line: 336, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!1013 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1014, file: !810, line: 517)
!1014 = !DISubprogram(name: "sinhl", scope: !816, file: !816, line: 360, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!1015 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1016, file: !810, line: 518)
!1016 = !DISubprogram(name: "sqrtl", scope: !816, file: !816, line: 440, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!1017 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1018, file: !810, line: 519)
!1018 = !DISubprogram(name: "tanl", scope: !816, file: !816, line: 340, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!1019 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1020, file: !810, line: 521)
!1020 = !DISubprogram(name: "tanhl", scope: !816, file: !816, line: 364, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!1021 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1022, file: !810, line: 522)
!1022 = !DISubprogram(name: "acoshl", scope: !816, file: !816, line: 344, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!1023 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1024, file: !810, line: 523)
!1024 = !DISubprogram(name: "asinhl", scope: !816, file: !816, line: 348, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!1025 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1026, file: !810, line: 524)
!1026 = !DISubprogram(name: "atanhl", scope: !816, file: !816, line: 352, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!1027 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1028, file: !810, line: 525)
!1028 = !DISubprogram(name: "cbrtl", scope: !816, file: !816, line: 428, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!1029 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1030, file: !810, line: 527)
!1030 = !DISubprogram(name: "copysignl", scope: !816, file: !816, line: 519, type: !979, flags: DIFlagPrototyped, spFlags: 0)
!1031 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1032, file: !810, line: 529)
!1032 = !DISubprogram(name: "erfl", scope: !816, file: !816, line: 444, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!1033 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1034, file: !810, line: 530)
!1034 = !DISubprogram(name: "erfcl", scope: !816, file: !816, line: 448, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!1035 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1036, file: !810, line: 531)
!1036 = !DISubprogram(name: "exp2l", scope: !816, file: !816, line: 372, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!1037 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1038, file: !810, line: 532)
!1038 = !DISubprogram(name: "expm1l", scope: !816, file: !816, line: 376, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!1039 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1040, file: !810, line: 533)
!1040 = !DISubprogram(name: "fdiml", scope: !816, file: !816, line: 535, type: !979, flags: DIFlagPrototyped, spFlags: 0)
!1041 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1042, file: !810, line: 534)
!1042 = !DISubprogram(name: "fmal", scope: !816, file: !816, line: 547, type: !1043, flags: DIFlagPrototyped, spFlags: 0)
!1043 = !DISubroutineType(types: !1044)
!1044 = !{!309, !309, !309, !309}
!1045 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1046, file: !810, line: 535)
!1046 = !DISubprogram(name: "fmaxl", scope: !816, file: !816, line: 539, type: !979, flags: DIFlagPrototyped, spFlags: 0)
!1047 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1048, file: !810, line: 536)
!1048 = !DISubprogram(name: "fminl", scope: !816, file: !816, line: 543, type: !979, flags: DIFlagPrototyped, spFlags: 0)
!1049 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1050, file: !810, line: 537)
!1050 = !DISubprogram(name: "hypotl", scope: !816, file: !816, line: 432, type: !979, flags: DIFlagPrototyped, spFlags: 0)
!1051 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1052, file: !810, line: 538)
!1052 = !DISubprogram(name: "ilogbl", scope: !816, file: !816, line: 412, type: !1053, flags: DIFlagPrototyped, spFlags: 0)
!1053 = !DISubroutineType(types: !1054)
!1054 = !{!7, !309}
!1055 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1056, file: !810, line: 539)
!1056 = !DISubprogram(name: "lgammal", scope: !816, file: !816, line: 455, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!1057 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1058, file: !810, line: 540)
!1058 = !DISubprogram(name: "llrintl", scope: !816, file: !816, line: 494, type: !1059, flags: DIFlagPrototyped, spFlags: 0)
!1059 = !DISubroutineType(types: !1060)
!1060 = !{!20, !309}
!1061 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1062, file: !810, line: 541)
!1062 = !DISubprogram(name: "llroundl", scope: !816, file: !816, line: 498, type: !1059, flags: DIFlagPrototyped, spFlags: 0)
!1063 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1064, file: !810, line: 542)
!1064 = !DISubprogram(name: "log1pl", scope: !816, file: !816, line: 392, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!1065 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1066, file: !810, line: 543)
!1066 = !DISubprogram(name: "log2l", scope: !816, file: !816, line: 388, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!1067 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1068, file: !810, line: 544)
!1068 = !DISubprogram(name: "logbl", scope: !816, file: !816, line: 396, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!1069 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1070, file: !810, line: 545)
!1070 = !DISubprogram(name: "lrintl", scope: !816, file: !816, line: 479, type: !1071, flags: DIFlagPrototyped, spFlags: 0)
!1071 = !DISubroutineType(types: !1072)
!1072 = !{!295, !309}
!1073 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1074, file: !810, line: 546)
!1074 = !DISubprogram(name: "lroundl", scope: !816, file: !816, line: 487, type: !1071, flags: DIFlagPrototyped, spFlags: 0)
!1075 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1076, file: !810, line: 547)
!1076 = !DISubprogram(name: "nanl", scope: !816, file: !816, line: 523, type: !1077, flags: DIFlagPrototyped, spFlags: 0)
!1077 = !DISubroutineType(types: !1078)
!1078 = !{!309, !394}
!1079 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1080, file: !810, line: 548)
!1080 = !DISubprogram(name: "nearbyintl", scope: !816, file: !816, line: 471, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!1081 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1082, file: !810, line: 549)
!1082 = !DISubprogram(name: "nextafterl", scope: !816, file: !816, line: 527, type: !979, flags: DIFlagPrototyped, spFlags: 0)
!1083 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1084, file: !810, line: 550)
!1084 = !DISubprogram(name: "nexttowardl", scope: !816, file: !816, line: 531, type: !979, flags: DIFlagPrototyped, spFlags: 0)
!1085 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1086, file: !810, line: 551)
!1086 = !DISubprogram(name: "remainderl", scope: !816, file: !816, line: 511, type: !979, flags: DIFlagPrototyped, spFlags: 0)
!1087 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1088, file: !810, line: 552)
!1088 = !DISubprogram(name: "remquol", scope: !816, file: !816, line: 515, type: !1089, flags: DIFlagPrototyped, spFlags: 0)
!1089 = !DISubroutineType(types: !1090)
!1090 = !{!309, !309, !309, !854}
!1091 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1092, file: !810, line: 553)
!1092 = !DISubprogram(name: "rintl", scope: !816, file: !816, line: 475, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!1093 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1094, file: !810, line: 554)
!1094 = !DISubprogram(name: "roundl", scope: !816, file: !816, line: 483, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!1095 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1096, file: !810, line: 555)
!1096 = !DISubprogram(name: "scalblnl", scope: !816, file: !816, line: 420, type: !1097, flags: DIFlagPrototyped, spFlags: 0)
!1097 = !DISubroutineType(types: !1098)
!1098 = !{!309, !309, !295}
!1099 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1100, file: !810, line: 556)
!1100 = !DISubprogram(name: "scalbnl", scope: !816, file: !816, line: 416, type: !1001, flags: DIFlagPrototyped, spFlags: 0)
!1101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1102, file: !810, line: 557)
!1102 = !DISubprogram(name: "tgammal", scope: !816, file: !816, line: 459, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!1103 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1104, file: !810, line: 558)
!1104 = !DISubprogram(name: "truncl", scope: !816, file: !816, line: 503, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!1105 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !1106, entity: !1107, file: !1109, line: 536)
!1106 = !DINamespace(name: "chrono", scope: !239)
!1107 = !DINamespace(name: "chrono_literals", scope: !1108, exportSymbols: true)
!1108 = !DINamespace(name: "literals", scope: !239, exportSymbols: true)
!1109 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__chrono/duration.h", directory: "")
!1110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1111, file: !1114, line: 68)
!1111 = !DIDerivedType(tag: DW_TAG_typedef, name: "clock_t", file: !1112, line: 31, baseType: !1113)
!1112 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_clock_t.h", directory: "", checksumkind: CSK_MD5, checksum: "757b93ac72874f074e33ca41b7ee521d")
!1113 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_clock_t", file: !294, line: 116, baseType: !299)
!1114 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/ctime", directory: "")
!1115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1116, file: !1114, line: 69)
!1116 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !1117, line: 31, baseType: !1118)
!1117 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_time_t.h", directory: "", checksumkind: CSK_MD5, checksum: "ddc110fab0813d27960d5c9aaba0ed4f")
!1118 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_time_t", file: !294, line: 119, baseType: !295)
!1119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !423, file: !1114, line: 70)
!1120 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1121, file: !1114, line: 74)
!1121 = !DISubprogram(name: "clock", linkageName: "\01_clock", scope: !424, file: !424, line: 112, type: !1122, flags: DIFlagPrototyped, spFlags: 0)
!1122 = !DISubroutineType(types: !1123)
!1123 = !{!1111}
!1124 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1125, file: !1114, line: 75)
!1125 = !DISubprogram(name: "difftime", scope: !424, file: !424, line: 114, type: !1126, flags: DIFlagPrototyped, spFlags: 0)
!1126 = !DISubroutineType(types: !1127)
!1127 = !{!565, !1116, !1116}
!1128 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1129, file: !1114, line: 76)
!1129 = !DISubprogram(name: "mktime", linkageName: "\01_mktime", scope: !424, file: !424, line: 118, type: !1130, flags: DIFlagPrototyped, spFlags: 0)
!1130 = !DISubroutineType(types: !1131)
!1131 = !{!1116, !1132}
!1132 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !423, size: 64)
!1133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1134, file: !1114, line: 77)
!1134 = !DISubprogram(name: "time", scope: !424, file: !424, line: 121, type: !1135, flags: DIFlagPrototyped, spFlags: 0)
!1135 = !DISubroutineType(types: !1136)
!1136 = !{!1116, !1137}
!1137 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1116, size: 64)
!1138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1139, file: !1114, line: 78)
!1139 = !DISubprogram(name: "asctime", scope: !424, file: !424, line: 111, type: !1140, flags: DIFlagPrototyped, spFlags: 0)
!1140 = !DISubroutineType(types: !1141)
!1141 = !{!437, !659}
!1142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1143, file: !1114, line: 79)
!1143 = !DISubprogram(name: "ctime", scope: !424, file: !424, line: 113, type: !1144, flags: DIFlagPrototyped, spFlags: 0)
!1144 = !DISubroutineType(types: !1145)
!1145 = !{!437, !1146}
!1146 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1147, size: 64)
!1147 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1116)
!1148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1149, file: !1114, line: 80)
!1149 = !DISubprogram(name: "gmtime", scope: !424, file: !424, line: 116, type: !1150, flags: DIFlagPrototyped, spFlags: 0)
!1150 = !DISubroutineType(types: !1151)
!1151 = !{!1132, !1146}
!1152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1153, file: !1114, line: 81)
!1153 = !DISubprogram(name: "localtime", scope: !424, file: !424, line: 117, type: !1150, flags: DIFlagPrototyped, spFlags: 0)
!1154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1155, file: !1114, line: 82)
!1155 = !DISubprogram(name: "strftime", linkageName: "\01_strftime", scope: !424, file: !424, line: 119, type: !1156, flags: DIFlagPrototyped, spFlags: 0)
!1156 = !DISubroutineType(types: !1157)
!1157 = !{!510, !437, !510, !394, !659}
!1158 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1159, file: !1165, line: 106)
!1159 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !1160, line: 105, baseType: !1161)
!1160 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "17a3e5580239ce2f2af260c9c943ad9b")
!1161 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1160, line: 102, size: 64, flags: DIFlagTypePassByValue, elements: !1162, identifier: "_ZTS5div_t")
!1162 = !{!1163, !1164}
!1163 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !1161, file: !1160, line: 103, baseType: !7, size: 32)
!1164 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !1161, file: !1160, line: 104, baseType: !7, size: 32, offset: 32)
!1165 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdlib", directory: "")
!1166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1167, file: !1165, line: 107)
!1167 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !1160, line: 110, baseType: !1168)
!1168 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1160, line: 107, size: 128, flags: DIFlagTypePassByValue, elements: !1169, identifier: "_ZTS6ldiv_t")
!1169 = !{!1170, !1171}
!1170 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !1168, file: !1160, line: 108, baseType: !295, size: 64)
!1171 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !1168, file: !1160, line: 109, baseType: !295, size: 64, offset: 64)
!1172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1173, file: !1165, line: 108)
!1173 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !1160, line: 116, baseType: !1174)
!1174 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1160, line: 113, size: 128, flags: DIFlagTypePassByValue, elements: !1175, identifier: "_ZTS7lldiv_t")
!1175 = !{!1176, !1177}
!1176 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !1174, file: !1160, line: 114, baseType: !20, size: 64)
!1177 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !1174, file: !1160, line: 115, baseType: !20, size: 64, offset: 64)
!1178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1179, file: !1165, line: 109)
!1179 = !DISubprogram(name: "atof", scope: !1160, file: !1160, line: 149, type: !937, flags: DIFlagPrototyped, spFlags: 0)
!1180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1181, file: !1165, line: 110)
!1181 = !DISubprogram(name: "atoi", scope: !1160, file: !1160, line: 150, type: !1182, flags: DIFlagPrototyped, spFlags: 0)
!1182 = !DISubroutineType(types: !1183)
!1183 = !{!7, !394}
!1184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1185, file: !1165, line: 111)
!1185 = !DISubprogram(name: "atol", scope: !1160, file: !1160, line: 151, type: !1186, flags: DIFlagPrototyped, spFlags: 0)
!1186 = !DISubroutineType(types: !1187)
!1187 = !{!295, !394}
!1188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1189, file: !1165, line: 112)
!1189 = !DISubprogram(name: "atoll", scope: !1160, file: !1160, line: 154, type: !1190, flags: DIFlagPrototyped, spFlags: 0)
!1190 = !DISubroutineType(types: !1191)
!1191 = !{!20, !394}
!1192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1193, file: !1165, line: 113)
!1193 = !DISubprogram(name: "strtod", linkageName: "\01_strtod", scope: !1160, file: !1160, line: 184, type: !1194, flags: DIFlagPrototyped, spFlags: 0)
!1194 = !DISubroutineType(types: !1195)
!1195 = !{!565, !394, !1196}
!1196 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !437, size: 64)
!1197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1198, file: !1165, line: 114)
!1198 = !DISubprogram(name: "strtof", linkageName: "\01_strtof", scope: !1160, file: !1160, line: 185, type: !1199, flags: DIFlagPrototyped, spFlags: 0)
!1199 = !DISubroutineType(types: !1200)
!1200 = !{!571, !394, !1196}
!1201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1202, file: !1165, line: 115)
!1202 = !DISubprogram(name: "strtold", scope: !1160, file: !1160, line: 188, type: !1203, flags: DIFlagPrototyped, spFlags: 0)
!1203 = !DISubroutineType(types: !1204)
!1204 = !{!309, !394, !1196}
!1205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1206, file: !1165, line: 116)
!1206 = !DISubprogram(name: "strtol", scope: !1160, file: !1160, line: 186, type: !1207, flags: DIFlagPrototyped, spFlags: 0)
!1207 = !DISubroutineType(types: !1208)
!1208 = !{!295, !394, !1196, !7}
!1209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1210, file: !1165, line: 117)
!1210 = !DISubprogram(name: "strtoll", scope: !1160, file: !1160, line: 191, type: !1211, flags: DIFlagPrototyped, spFlags: 0)
!1211 = !DISubroutineType(types: !1212)
!1212 = !{!20, !394, !1196, !7}
!1213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1214, file: !1165, line: 118)
!1214 = !DISubprogram(name: "strtoul", scope: !1160, file: !1160, line: 194, type: !1215, flags: DIFlagPrototyped, spFlags: 0)
!1215 = !DISubroutineType(types: !1216)
!1216 = !{!299, !394, !1196, !7}
!1217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1218, file: !1165, line: 119)
!1218 = !DISubprogram(name: "strtoull", scope: !1160, file: !1160, line: 197, type: !1219, flags: DIFlagPrototyped, spFlags: 0)
!1219 = !DISubroutineType(types: !1220)
!1220 = !{!256, !394, !1196, !7}
!1221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1222, file: !1165, line: 120)
!1222 = !DISubprogram(name: "rand", scope: !1160, file: !1160, line: 181, type: !1223, flags: DIFlagPrototyped, spFlags: 0)
!1223 = !DISubroutineType(types: !1224)
!1224 = !{!7}
!1225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1226, file: !1165, line: 121)
!1226 = !DISubprogram(name: "srand", scope: !1160, file: !1160, line: 183, type: !1227, flags: DIFlagPrototyped, spFlags: 0)
!1227 = !DISubroutineType(types: !1228)
!1228 = !{null, !252}
!1229 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1230, file: !1165, line: 122)
!1230 = !DISubprogram(name: "calloc", scope: !1231, file: !1231, line: 55, type: !1232, flags: DIFlagPrototyped, spFlags: 0)
!1231 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/malloc/_malloc.h", directory: "", checksumkind: CSK_MD5, checksum: "169c9ed8662627a4a4d92e321cfa866c")
!1232 = !DISubroutineType(types: !1233)
!1233 = !{!457, !510, !510}
!1234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1235, file: !1165, line: 123)
!1235 = !DISubprogram(name: "free", scope: !1231, file: !1231, line: 56, type: !1236, flags: DIFlagPrototyped, spFlags: 0)
!1236 = !DISubroutineType(types: !1237)
!1237 = !{null, !457}
!1238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1239, file: !1165, line: 124)
!1239 = !DISubprogram(name: "malloc", scope: !1231, file: !1231, line: 54, type: !1240, flags: DIFlagPrototyped, spFlags: 0)
!1240 = !DISubroutineType(types: !1241)
!1241 = !{!457, !510}
!1242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1243, file: !1165, line: 125)
!1243 = !DISubprogram(name: "realloc", scope: !1231, file: !1231, line: 57, type: !1244, flags: DIFlagPrototyped, spFlags: 0)
!1244 = !DISubroutineType(types: !1245)
!1245 = !{!457, !457, !510}
!1246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1247, file: !1165, line: 126)
!1247 = !DISubprogram(name: "abort", scope: !1248, file: !1248, line: 33, type: !1249, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1248 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_abort.h", directory: "", checksumkind: CSK_MD5, checksum: "b8994a53d49770cf67adab87821b3fcb")
!1249 = !DISubroutineType(types: !1250)
!1250 = !{null}
!1251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1252, file: !1165, line: 127)
!1252 = !DISubprogram(name: "atexit", scope: !1160, file: !1160, line: 144, type: !1253, flags: DIFlagPrototyped, spFlags: 0)
!1253 = !DISubroutineType(types: !1254)
!1254 = !{!7, !1255}
!1255 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1249, size: 64)
!1256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1257, file: !1165, line: 128)
!1257 = !DISubprogram(name: "exit", scope: !1160, file: !1160, line: 160, type: !1258, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1258 = !DISubroutineType(types: !1259)
!1259 = !{null, !7}
!1260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1261, file: !1165, line: 129)
!1261 = !DISubprogram(name: "_Exit", scope: !1160, file: !1160, line: 210, type: !1258, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1263, file: !1165, line: 130)
!1263 = !DISubprogram(name: "getenv", scope: !1160, file: !1160, line: 162, type: !1264, flags: DIFlagPrototyped, spFlags: 0)
!1264 = !DISubroutineType(types: !1265)
!1265 = !{!437, !394}
!1266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1267, file: !1165, line: 131)
!1267 = !DISubprogram(name: "system", linkageName: "\01_system", scope: !1160, file: !1160, line: 203, type: !1182, flags: DIFlagPrototyped, spFlags: 0)
!1268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1269, file: !1165, line: 132)
!1269 = !DISubprogram(name: "bsearch", scope: !1160, file: !1160, line: 156, type: !1270, flags: DIFlagPrototyped, spFlags: 0)
!1270 = !DISubroutineType(types: !1271)
!1271 = !{!457, !721, !721, !510, !510, !1272}
!1272 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1273, size: 64)
!1273 = !DISubroutineType(types: !1274)
!1274 = !{!7, !721, !721}
!1275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1276, file: !1165, line: 133)
!1276 = !DISubprogram(name: "qsort", scope: !1160, file: !1160, line: 175, type: !1277, flags: DIFlagPrototyped, spFlags: 0)
!1277 = !DISubroutineType(types: !1278)
!1278 = !{null, !457, !510, !510, !1272}
!1279 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !820, file: !1165, line: 134)
!1280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1281, file: !1165, line: 135)
!1281 = !DISubprogram(name: "labs", scope: !1160, file: !1160, line: 163, type: !1282, flags: DIFlagPrototyped, spFlags: 0)
!1282 = !DISubroutineType(types: !1283)
!1283 = !{!295, !295}
!1284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1285, file: !1165, line: 136)
!1285 = !DISubprogram(name: "llabs", scope: !1160, file: !1160, line: 167, type: !1286, flags: DIFlagPrototyped, spFlags: 0)
!1286 = !DISubroutineType(types: !1287)
!1287 = !{!20, !20}
!1288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1289, file: !1165, line: 137)
!1289 = !DISubprogram(name: "div", linkageName: "_Z3divB8ne200100xx", scope: !821, file: !821, line: 143, type: !1290, flags: DIFlagPrototyped, spFlags: 0)
!1290 = !DISubroutineType(types: !1291)
!1291 = !{!1173, !20, !20}
!1292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1293, file: !1165, line: 138)
!1293 = !DISubprogram(name: "ldiv", scope: !1160, file: !1160, line: 164, type: !1294, flags: DIFlagPrototyped, spFlags: 0)
!1294 = !DISubroutineType(types: !1295)
!1295 = !{!1167, !295, !295}
!1296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1297, file: !1165, line: 139)
!1297 = !DISubprogram(name: "lldiv", scope: !1160, file: !1160, line: 168, type: !1290, flags: DIFlagPrototyped, spFlags: 0)
!1298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1299, file: !1165, line: 140)
!1299 = !DISubprogram(name: "mblen", scope: !1160, file: !1160, line: 171, type: !1300, flags: DIFlagPrototyped, spFlags: 0)
!1300 = !DISubroutineType(types: !1301)
!1301 = !{!7, !394, !510}
!1302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1303, file: !1165, line: 142)
!1303 = !DISubprogram(name: "mbtowc", scope: !1160, file: !1160, line: 173, type: !1304, flags: DIFlagPrototyped, spFlags: 0)
!1304 = !DISubroutineType(types: !1305)
!1305 = !{!7, !509, !394, !510}
!1306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1307, file: !1165, line: 143)
!1307 = !DISubprogram(name: "wctomb", scope: !1160, file: !1160, line: 207, type: !1308, flags: DIFlagPrototyped, spFlags: 0)
!1308 = !DISubroutineType(types: !1309)
!1309 = !{!7, !437, !502}
!1310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1311, file: !1165, line: 144)
!1311 = !DISubprogram(name: "mbstowcs", scope: !1160, file: !1160, line: 172, type: !1312, flags: DIFlagPrototyped, spFlags: 0)
!1312 = !DISubroutineType(types: !1313)
!1313 = !{!510, !509, !394, !510}
!1314 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1315, file: !1165, line: 145)
!1315 = !DISubprogram(name: "wcstombs", scope: !1160, file: !1160, line: 206, type: !1316, flags: DIFlagPrototyped, spFlags: 0)
!1316 = !DISubroutineType(types: !1317)
!1317 = !{!510, !437, !500, !510}
!1318 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1319, file: !1165, line: 148)
!1319 = !DISubprogram(name: "at_quick_exit", scope: !1160, file: !1160, line: 147, type: !1253, flags: DIFlagPrototyped, spFlags: 0)
!1320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1321, file: !1165, line: 149)
!1321 = !DISubprogram(name: "quick_exit", scope: !1160, file: !1160, line: 179, type: !1258, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !410, file: !1323, line: 25)
!1323 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__std_mbstate_t.h", directory: "")
!1324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !440, file: !1325, line: 120)
!1325 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/cstdio", directory: "")
!1326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !470, file: !1325, line: 121)
!1327 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1328, file: !1325, line: 123)
!1328 = !DISubprogram(name: "fclose", scope: !441, file: !441, line: 233, type: !1329, flags: DIFlagPrototyped, spFlags: 0)
!1329 = !DISubroutineType(types: !1330)
!1330 = !{!7, !499}
!1331 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1332, file: !1325, line: 124)
!1332 = !DISubprogram(name: "fflush", scope: !441, file: !441, line: 236, type: !1329, flags: DIFlagPrototyped, spFlags: 0)
!1333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1334, file: !1325, line: 125)
!1334 = !DISubprogram(name: "setbuf", scope: !441, file: !441, line: 272, type: !1335, flags: DIFlagPrototyped, spFlags: 0)
!1335 = !DISubroutineType(types: !1336)
!1336 = !{null, !499, !437}
!1337 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1338, file: !1325, line: 126)
!1338 = !DISubprogram(name: "setvbuf", scope: !441, file: !441, line: 273, type: !1339, flags: DIFlagPrototyped, spFlags: 0)
!1339 = !DISubroutineType(types: !1340)
!1340 = !{!7, !499, !437, !7, !510}
!1341 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1342, file: !1325, line: 127)
!1342 = !DISubprogram(name: "fprintf", scope: !441, file: !441, line: 245, type: !1343, flags: DIFlagPrototyped, spFlags: 0)
!1343 = !DISubroutineType(types: !1344)
!1344 = !{!7, !499, !394, null}
!1345 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1346, file: !1325, line: 128)
!1346 = !DISubprogram(name: "fscanf", scope: !441, file: !441, line: 251, type: !1343, flags: DIFlagPrototyped, spFlags: 0)
!1347 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1348, file: !1325, line: 129)
!1348 = !DISubprogram(name: "snprintf", scope: !441, file: !441, line: 435, type: !1349, flags: DIFlagPrototyped, spFlags: 0)
!1349 = !DISubroutineType(types: !1350)
!1350 = !{!7, !437, !510, !394, null}
!1351 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1352, file: !1325, line: 130)
!1352 = !DISubprogram(name: "sprintf", scope: !441, file: !441, line: 280, type: !1353, flags: DIFlagPrototyped, spFlags: 0)
!1353 = !DISubroutineType(types: !1354)
!1354 = !{!7, !437, !394, null}
!1355 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1356, file: !1325, line: 131)
!1356 = !DISubprogram(name: "sscanf", scope: !441, file: !441, line: 282, type: !1357, flags: DIFlagPrototyped, spFlags: 0)
!1357 = !DISubroutineType(types: !1358)
!1358 = !{!7, !394, !394, null}
!1359 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1360, file: !1325, line: 132)
!1360 = !DISubprogram(name: "vfprintf", scope: !441, file: !441, line: 292, type: !1361, flags: DIFlagPrototyped, spFlags: 0)
!1361 = !DISubroutineType(types: !1362)
!1362 = !{!7, !499, !394, !1363}
!1363 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !1364, line: 44, baseType: !517)
!1364 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/sys/_types/_va_list.h", directory: "", checksumkind: CSK_MD5, checksum: "41825c2dccdd98a1587ce428cded44de")
!1365 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1366, file: !1325, line: 133)
!1366 = !DISubprogram(name: "vfscanf", scope: !441, file: !441, line: 436, type: !1361, flags: DIFlagPrototyped, spFlags: 0)
!1367 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1368, file: !1325, line: 134)
!1368 = !DISubprogram(name: "vsscanf", scope: !441, file: !441, line: 439, type: !1369, flags: DIFlagPrototyped, spFlags: 0)
!1369 = !DISubroutineType(types: !1370)
!1370 = !{!7, !394, !394, !1363}
!1371 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1372, file: !1325, line: 135)
!1372 = !DISubprogram(name: "vsnprintf", scope: !441, file: !441, line: 438, type: !1373, flags: DIFlagPrototyped, spFlags: 0)
!1373 = !DISubroutineType(types: !1374)
!1374 = !{!7, !437, !510, !394, !1363}
!1375 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1376, file: !1325, line: 136)
!1376 = !DISubprogram(name: "vsprintf", scope: !441, file: !441, line: 300, type: !1377, flags: DIFlagPrototyped, spFlags: 0)
!1377 = !DISubroutineType(types: !1378)
!1378 = !{!7, !437, !394, !1363}
!1379 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1380, file: !1325, line: 137)
!1380 = !DISubprogram(name: "fgetc", scope: !441, file: !441, line: 237, type: !1329, flags: DIFlagPrototyped, spFlags: 0)
!1381 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1382, file: !1325, line: 138)
!1382 = !DISubprogram(name: "fgets", scope: !441, file: !441, line: 239, type: !1383, flags: DIFlagPrototyped, spFlags: 0)
!1383 = !DISubroutineType(types: !1384)
!1384 = !{!437, !437, !7, !499}
!1385 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1386, file: !1325, line: 139)
!1386 = !DISubprogram(name: "fputc", scope: !441, file: !441, line: 246, type: !1387, flags: DIFlagPrototyped, spFlags: 0)
!1387 = !DISubroutineType(types: !1388)
!1388 = !{!7, !7, !499}
!1389 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1390, file: !1325, line: 140)
!1390 = !DISubprogram(name: "fputs", linkageName: "\01_fputs", scope: !441, file: !441, line: 247, type: !1391, flags: DIFlagPrototyped, spFlags: 0)
!1391 = !DISubroutineType(types: !1392)
!1392 = !{!7, !394, !499}
!1393 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1394, file: !1325, line: 141)
!1394 = !DISubprogram(name: "getc", scope: !441, file: !441, line: 256, type: !1329, flags: DIFlagPrototyped, spFlags: 0)
!1395 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1396, file: !1325, line: 142)
!1396 = !DISubprogram(name: "putc", scope: !441, file: !441, line: 265, type: !1387, flags: DIFlagPrototyped, spFlags: 0)
!1397 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1398, file: !1325, line: 143)
!1398 = !DISubprogram(name: "ungetc", scope: !441, file: !441, line: 291, type: !1387, flags: DIFlagPrototyped, spFlags: 0)
!1399 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1400, file: !1325, line: 144)
!1400 = !DISubprogram(name: "fread", scope: !441, file: !441, line: 248, type: !1401, flags: DIFlagPrototyped, spFlags: 0)
!1401 = !DISubroutineType(types: !1402)
!1402 = !{!510, !457, !510, !510, !499}
!1403 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1404, file: !1325, line: 145)
!1404 = !DISubprogram(name: "fwrite", linkageName: "\01_fwrite", scope: !441, file: !441, line: 255, type: !1405, flags: DIFlagPrototyped, spFlags: 0)
!1405 = !DISubroutineType(types: !1406)
!1406 = !{!510, !721, !510, !510, !499}
!1407 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1408, file: !1325, line: 146)
!1408 = !DISubprogram(name: "fgetpos", scope: !441, file: !441, line: 238, type: !1409, flags: DIFlagPrototyped, spFlags: 0)
!1409 = !DISubroutineType(types: !1410)
!1410 = !{!7, !499, !1411}
!1411 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !470, size: 64)
!1412 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1413, file: !1325, line: 147)
!1413 = !DISubprogram(name: "fseek", scope: !441, file: !441, line: 252, type: !1414, flags: DIFlagPrototyped, spFlags: 0)
!1414 = !DISubroutineType(types: !1415)
!1415 = !{!7, !499, !295, !7}
!1416 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1417, file: !1325, line: 148)
!1417 = !DISubprogram(name: "fsetpos", scope: !441, file: !441, line: 253, type: !1418, flags: DIFlagPrototyped, spFlags: 0)
!1418 = !DISubroutineType(types: !1419)
!1419 = !{!7, !499, !1420}
!1420 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1421, size: 64)
!1421 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !470)
!1422 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1423, file: !1325, line: 149)
!1423 = !DISubprogram(name: "ftell", scope: !441, file: !441, line: 254, type: !1424, flags: DIFlagPrototyped, spFlags: 0)
!1424 = !DISubroutineType(types: !1425)
!1425 = !{!295, !499}
!1426 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1427, file: !1325, line: 150)
!1427 = !DISubprogram(name: "rewind", scope: !441, file: !441, line: 270, type: !1428, flags: DIFlagPrototyped, spFlags: 0)
!1428 = !DISubroutineType(types: !1429)
!1429 = !{null, !499}
!1430 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1431, file: !1325, line: 151)
!1431 = !DISubprogram(name: "clearerr", scope: !441, file: !441, line: 232, type: !1428, flags: DIFlagPrototyped, spFlags: 0)
!1432 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1433, file: !1325, line: 152)
!1433 = !DISubprogram(name: "feof", scope: !441, file: !441, line: 234, type: !1329, flags: DIFlagPrototyped, spFlags: 0)
!1434 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1435, file: !1325, line: 153)
!1435 = !DISubprogram(name: "ferror", scope: !441, file: !441, line: 235, type: !1329, flags: DIFlagPrototyped, spFlags: 0)
!1436 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1437, file: !1325, line: 154)
!1437 = !DISubprogram(name: "perror", scope: !441, file: !441, line: 264, type: !1438, flags: DIFlagPrototyped, spFlags: 0)
!1438 = !DISubroutineType(types: !1439)
!1439 = !{null, !394}
!1440 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1441, file: !1325, line: 156)
!1441 = !DISubprogram(name: "fopen", linkageName: "\01_fopen", scope: !441, file: !441, line: 243, type: !1442, flags: DIFlagPrototyped, spFlags: 0)
!1442 = !DISubroutineType(types: !1443)
!1443 = !{!499, !394, !394}
!1444 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1445, file: !1325, line: 157)
!1445 = !DISubprogram(name: "freopen", linkageName: "\01_freopen", scope: !441, file: !441, line: 249, type: !1446, flags: DIFlagPrototyped, spFlags: 0)
!1446 = !DISubroutineType(types: !1447)
!1447 = !{!499, !394, !394, !499}
!1448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1449, file: !1325, line: 158)
!1449 = !DISubprogram(name: "remove", scope: !441, file: !441, line: 268, type: !1182, flags: DIFlagPrototyped, spFlags: 0)
!1450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1451, file: !1325, line: 159)
!1451 = !DISubprogram(name: "rename", scope: !441, file: !441, line: 269, type: !744, flags: DIFlagPrototyped, spFlags: 0)
!1452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1453, file: !1325, line: 160)
!1453 = !DISubprogram(name: "tmpfile", scope: !441, file: !441, line: 283, type: !1454, flags: DIFlagPrototyped, spFlags: 0)
!1454 = !DISubroutineType(types: !1455)
!1455 = !{!499}
!1456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1457, file: !1325, line: 161)
!1457 = !DISubprogram(name: "tmpnam", scope: !441, file: !441, line: 289, type: !1458, flags: DIFlagPrototyped, spFlags: 0)
!1458 = !DISubroutineType(types: !1459)
!1459 = !{!437, !437}
!1460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1461, file: !1325, line: 163)
!1461 = !DISubprogram(name: "getchar", scope: !441, file: !441, line: 257, type: !1223, flags: DIFlagPrototyped, spFlags: 0)
!1462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1463, file: !1325, line: 167)
!1463 = !DISubprogram(name: "scanf", scope: !441, file: !441, line: 271, type: !1464, flags: DIFlagPrototyped, spFlags: 0)
!1464 = !DISubroutineType(types: !1465)
!1465 = !{!7, !394, null}
!1466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1467, file: !1325, line: 168)
!1467 = !DISubprogram(name: "vscanf", scope: !441, file: !441, line: 437, type: !1468, flags: DIFlagPrototyped, spFlags: 0)
!1468 = !DISubroutineType(types: !1469)
!1469 = !{!7, !394, !1363}
!1470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1471, file: !1325, line: 170)
!1471 = !DISubprogram(name: "printf", scope: !1472, file: !1472, line: 34, type: !1464, flags: DIFlagPrototyped, spFlags: 0)
!1472 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk/usr/include/_printf.h", directory: "", checksumkind: CSK_MD5, checksum: "2d37517bd0342aa326aa1d3660ad4ab4")
!1473 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1474, file: !1325, line: 171)
!1474 = !DISubprogram(name: "putchar", scope: !441, file: !441, line: 266, type: !314, flags: DIFlagPrototyped, spFlags: 0)
!1475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1476, file: !1325, line: 172)
!1476 = !DISubprogram(name: "puts", scope: !441, file: !441, line: 267, type: !1182, flags: DIFlagPrototyped, spFlags: 0)
!1477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !239, entity: !1478, file: !1325, line: 173)
!1478 = !DISubprogram(name: "vprintf", scope: !441, file: !441, line: 293, type: !1468, flags: DIFlagPrototyped, spFlags: 0)
!1479 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 4]}
!1480 = !{i32 7, !"Dwarf Version", i32 5}
!1481 = !{i32 2, !"Debug Info Version", i32 3}
!1482 = !{i32 1, !"wchar_size", i32 4}
!1483 = !{i32 8, !"PIC Level", i32 2}
!1484 = !{i32 7, !"uwtable", i32 1}
!1485 = !{i32 7, !"frame-pointer", i32 1}
!1486 = !{!"Homebrew clang version 20.1.8"}
!1487 = distinct !DISubprogram(name: "lighting_cache_visible", linkageName: "_Z22lighting_cache_visibleiiiP10vms_vectoriS0_", scope: !24, file: !24, line: 56, type: !1488, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1491)
!1488 = !DISubroutineType(types: !1489)
!1489 = !{!7, !7, !7, !7, !1490, !7, !1490}
!1490 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!1491 = !{}
!1492 = !DILocalVariable(name: "vertnum", arg: 1, scope: !1487, file: !24, line: 56, type: !7)
!1493 = !DILocation(line: 56, column: 32, scope: !1487)
!1494 = !DILocalVariable(name: "segnum", arg: 2, scope: !1487, file: !24, line: 56, type: !7)
!1495 = !DILocation(line: 56, column: 45, scope: !1487)
!1496 = !DILocalVariable(name: "objnum", arg: 3, scope: !1487, file: !24, line: 56, type: !7)
!1497 = !DILocation(line: 56, column: 57, scope: !1487)
!1498 = !DILocalVariable(name: "obj_pos", arg: 4, scope: !1487, file: !24, line: 56, type: !1490)
!1499 = !DILocation(line: 56, column: 77, scope: !1487)
!1500 = !DILocalVariable(name: "obj_seg", arg: 5, scope: !1487, file: !24, line: 56, type: !7)
!1501 = !DILocation(line: 56, column: 90, scope: !1487)
!1502 = !DILocalVariable(name: "vertpos", arg: 6, scope: !1487, file: !24, line: 56, type: !1490)
!1503 = !DILocation(line: 56, column: 111, scope: !1487)
!1504 = !DILocalVariable(name: "cache_val", scope: !1487, file: !24, line: 88, type: !7)
!1505 = !DILocation(line: 88, column: 6, scope: !1487)
!1506 = !DILocalVariable(name: "cache_frame", scope: !1487, file: !24, line: 88, type: !7)
!1507 = !DILocation(line: 88, column: 17, scope: !1487)
!1508 = !DILocalVariable(name: "cache_vis", scope: !1487, file: !24, line: 88, type: !7)
!1509 = !DILocation(line: 88, column: 30, scope: !1487)
!1510 = !DILocation(line: 90, column: 31, scope: !1487)
!1511 = !DILocation(line: 90, column: 38, scope: !1487)
!1512 = !DILocation(line: 90, column: 65, scope: !1487)
!1513 = !DILocation(line: 90, column: 63, scope: !1487)
!1514 = !DILocation(line: 90, column: 74, scope: !1487)
!1515 = !DILocation(line: 90, column: 14, scope: !1487)
!1516 = !DILocation(line: 90, column: 12, scope: !1487)
!1517 = !DILocation(line: 92, column: 16, scope: !1487)
!1518 = !DILocation(line: 92, column: 26, scope: !1487)
!1519 = !DILocation(line: 92, column: 14, scope: !1487)
!1520 = !DILocation(line: 93, column: 14, scope: !1487)
!1521 = !DILocation(line: 93, column: 24, scope: !1487)
!1522 = !DILocation(line: 93, column: 12, scope: !1487)
!1523 = !DILocation(line: 97, column: 15, scope: !1487)
!1524 = !DILocation(line: 98, column: 7, scope: !1525)
!1525 = distinct !DILexicalBlock(scope: !1487, file: !24, line: 98, column: 6)
!1526 = !DILocation(line: 98, column: 19, scope: !1525)
!1527 = !DILocation(line: 98, column: 25, scope: !1525)
!1528 = !DILocation(line: 98, column: 29, scope: !1525)
!1529 = !DILocation(line: 98, column: 43, scope: !1525)
!1530 = !DILocation(line: 98, column: 41, scope: !1525)
!1531 = !DILocation(line: 98, column: 67, scope: !1525)
!1532 = !DILocation(line: 98, column: 64, scope: !1525)
!1533 = !DILocalVariable(name: "apply_light", scope: !1534, file: !24, line: 100, type: !7)
!1534 = distinct !DILexicalBlock(scope: !1525, file: !24, line: 99, column: 2)
!1535 = !DILocation(line: 100, column: 9, scope: !1534)
!1536 = !DILocalVariable(name: "fq", scope: !1534, file: !24, line: 101, type: !1537)
!1537 = !DIDerivedType(tag: DW_TAG_typedef, name: "fvi_query", file: !1538, line: 58, baseType: !1539)
!1538 = !DIFile(filename: "main_d2/fvi.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "d2a92d1b0ff4ebfc1a57eff3c7d6fa46")
!1539 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fvi_query", file: !1538, line: 50, size: 384, flags: DIFlagTypePassByValue, elements: !1540, identifier: "_ZTS9fvi_query")
!1540 = !{!1541, !1542, !1543, !1544, !1545, !1546, !1547}
!1541 = !DIDerivedType(tag: DW_TAG_member, name: "p0", scope: !1539, file: !1538, line: 52, baseType: !1490, size: 64)
!1542 = !DIDerivedType(tag: DW_TAG_member, name: "p1", scope: !1539, file: !1538, line: 52, baseType: !1490, size: 64, offset: 64)
!1543 = !DIDerivedType(tag: DW_TAG_member, name: "startseg", scope: !1539, file: !1538, line: 53, baseType: !7, size: 32, offset: 128)
!1544 = !DIDerivedType(tag: DW_TAG_member, name: "rad", scope: !1539, file: !1538, line: 54, baseType: !14, size: 32, offset: 160)
!1545 = !DIDerivedType(tag: DW_TAG_member, name: "thisobjnum", scope: !1539, file: !1538, line: 55, baseType: !67, size: 16, offset: 192)
!1546 = !DIDerivedType(tag: DW_TAG_member, name: "ignore_obj_list", scope: !1539, file: !1538, line: 56, baseType: !854, size: 64, offset: 256)
!1547 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !1539, file: !1538, line: 57, baseType: !7, size: 32, offset: 320)
!1548 = !DILocation(line: 101, column: 13, scope: !1534)
!1549 = !DILocalVariable(name: "hit_data", scope: !1534, file: !24, line: 102, type: !1550)
!1550 = !DIDerivedType(tag: DW_TAG_typedef, name: "fvi_info", file: !1538, line: 40, baseType: !1551)
!1551 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fvi_info", file: !1538, line: 29, size: 3584, flags: DIFlagTypePassByValue, elements: !1552, identifier: "_ZTS8fvi_info")
!1552 = !{!1553, !1554, !1555, !1556, !1557, !1558, !1559, !1560, !1561}
!1553 = !DIDerivedType(tag: DW_TAG_member, name: "hit_type", scope: !1551, file: !1538, line: 31, baseType: !7, size: 32)
!1554 = !DIDerivedType(tag: DW_TAG_member, name: "hit_pnt", scope: !1551, file: !1538, line: 32, baseType: !76, size: 96, offset: 32)
!1555 = !DIDerivedType(tag: DW_TAG_member, name: "hit_seg", scope: !1551, file: !1538, line: 33, baseType: !7, size: 32, offset: 128)
!1556 = !DIDerivedType(tag: DW_TAG_member, name: "hit_side", scope: !1551, file: !1538, line: 34, baseType: !7, size: 32, offset: 160)
!1557 = !DIDerivedType(tag: DW_TAG_member, name: "hit_side_seg", scope: !1551, file: !1538, line: 35, baseType: !7, size: 32, offset: 192)
!1558 = !DIDerivedType(tag: DW_TAG_member, name: "hit_object", scope: !1551, file: !1538, line: 36, baseType: !7, size: 32, offset: 224)
!1559 = !DIDerivedType(tag: DW_TAG_member, name: "hit_wallnorm", scope: !1551, file: !1538, line: 37, baseType: !76, size: 96, offset: 256)
!1560 = !DIDerivedType(tag: DW_TAG_member, name: "n_segs", scope: !1551, file: !1538, line: 38, baseType: !7, size: 32, offset: 352)
!1561 = !DIDerivedType(tag: DW_TAG_member, name: "seglist", scope: !1551, file: !1538, line: 39, baseType: !1562, size: 3200, offset: 384)
!1562 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !1563)
!1563 = !{!1564}
!1564 = !DISubrange(count: 100)
!1565 = !DILocation(line: 102, column: 13, scope: !1534)
!1566 = !DILocalVariable(name: "segnum", scope: !1534, file: !24, line: 103, type: !7)
!1567 = !DILocation(line: 103, column: 9, scope: !1534)
!1568 = !DILocalVariable(name: "hit_type", scope: !1534, file: !24, line: 103, type: !7)
!1569 = !DILocation(line: 103, column: 17, scope: !1534)
!1570 = !DILocation(line: 106, column: 27, scope: !1534)
!1571 = !DILocation(line: 106, column: 36, scope: !1534)
!1572 = !DILocation(line: 106, column: 12, scope: !1534)
!1573 = !DILocation(line: 106, column: 10, scope: !1534)
!1574 = !DILocation(line: 107, column: 7, scope: !1575)
!1575 = distinct !DILexicalBlock(scope: !1534, file: !24, line: 107, column: 7)
!1576 = !DILocation(line: 107, column: 14, scope: !1575)
!1577 = !DILocation(line: 108, column: 4, scope: !1578)
!1578 = distinct !DILexicalBlock(scope: !1575, file: !24, line: 107, column: 21)
!1579 = !DILocation(line: 109, column: 4, scope: !1578)
!1580 = !DILocation(line: 113, column: 11, scope: !1534)
!1581 = !DILocation(line: 113, column: 6, scope: !1534)
!1582 = !DILocation(line: 113, column: 9, scope: !1534)
!1583 = !DILocation(line: 114, column: 17, scope: !1534)
!1584 = !DILocation(line: 114, column: 6, scope: !1534)
!1585 = !DILocation(line: 114, column: 15, scope: !1534)
!1586 = !DILocation(line: 115, column: 11, scope: !1534)
!1587 = !DILocation(line: 115, column: 6, scope: !1534)
!1588 = !DILocation(line: 115, column: 9, scope: !1534)
!1589 = !DILocation(line: 116, column: 6, scope: !1534)
!1590 = !DILocation(line: 116, column: 10, scope: !1534)
!1591 = !DILocation(line: 117, column: 19, scope: !1534)
!1592 = !DILocation(line: 117, column: 6, scope: !1534)
!1593 = !DILocation(line: 117, column: 17, scope: !1534)
!1594 = !DILocation(line: 118, column: 6, scope: !1534)
!1595 = !DILocation(line: 118, column: 22, scope: !1534)
!1596 = !DILocation(line: 119, column: 6, scope: !1534)
!1597 = !DILocation(line: 119, column: 12, scope: !1534)
!1598 = !DILocation(line: 121, column: 14, scope: !1534)
!1599 = !DILocation(line: 121, column: 12, scope: !1534)
!1600 = !DILocation(line: 126, column: 7, scope: !1601)
!1601 = distinct !DILexicalBlock(scope: !1534, file: !24, line: 126, column: 7)
!1602 = !DILocation(line: 126, column: 16, scope: !1601)
!1603 = !DILocation(line: 127, column: 4, scope: !1601)
!1604 = !DILocation(line: 129, column: 7, scope: !1605)
!1605 = distinct !DILexicalBlock(scope: !1534, file: !24, line: 129, column: 7)
!1606 = !DILocation(line: 129, column: 16, scope: !1605)
!1607 = !DILocation(line: 130, column: 16, scope: !1605)
!1608 = !DILocation(line: 130, column: 4, scope: !1605)
!1609 = !DILocation(line: 131, column: 12, scope: !1610)
!1610 = distinct !DILexicalBlock(scope: !1605, file: !24, line: 131, column: 12)
!1611 = !DILocation(line: 131, column: 21, scope: !1610)
!1612 = !DILocalVariable(name: "dist_dist", scope: !1613, file: !24, line: 133, type: !14)
!1613 = distinct !DILexicalBlock(scope: !1610, file: !24, line: 132, column: 3)
!1614 = !DILocation(line: 133, column: 8, scope: !1613)
!1615 = !DILocation(line: 134, column: 44, scope: !1613)
!1616 = !DILocation(line: 134, column: 53, scope: !1613)
!1617 = !DILocation(line: 134, column: 16, scope: !1613)
!1618 = !DILocation(line: 134, column: 14, scope: !1613)
!1619 = !DILocation(line: 135, column: 8, scope: !1620)
!1620 = distinct !DILexicalBlock(scope: !1613, file: !24, line: 135, column: 8)
!1621 = !DILocation(line: 135, column: 18, scope: !1620)
!1622 = !DILocation(line: 137, column: 17, scope: !1623)
!1623 = distinct !DILexicalBlock(scope: !1620, file: !24, line: 136, column: 4)
!1624 = !DILocation(line: 139, column: 4, scope: !1623)
!1625 = !DILocation(line: 140, column: 3, scope: !1613)
!1626 = !DILocation(line: 141, column: 94, scope: !1534)
!1627 = !DILocation(line: 141, column: 109, scope: !1534)
!1628 = !DILocation(line: 141, column: 120, scope: !1534)
!1629 = !DILocation(line: 141, column: 106, scope: !1534)
!1630 = !DILocation(line: 141, column: 20, scope: !1534)
!1631 = !DILocation(line: 141, column: 27, scope: !1534)
!1632 = !DILocation(line: 141, column: 54, scope: !1534)
!1633 = !DILocation(line: 141, column: 52, scope: !1534)
!1634 = !DILocation(line: 141, column: 63, scope: !1534)
!1635 = !DILocation(line: 141, column: 3, scope: !1534)
!1636 = !DILocation(line: 141, column: 92, scope: !1534)
!1637 = !DILocation(line: 143, column: 10, scope: !1534)
!1638 = !DILocation(line: 143, column: 3, scope: !1534)
!1639 = !DILocation(line: 148, column: 13, scope: !1640)
!1640 = distinct !DILexicalBlock(scope: !1525, file: !24, line: 146, column: 2)
!1641 = !DILocation(line: 149, column: 10, scope: !1640)
!1642 = !DILocation(line: 149, column: 3, scope: !1640)
!1643 = !DILocation(line: 151, column: 1, scope: !1487)
!1644 = distinct !DISubprogram(name: "apply_light", linkageName: "_Z11apply_lightiiP10vms_vectoriPsi", scope: !24, file: !24, line: 157, type: !1645, scopeLine: 158, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1491)
!1645 = !DISubroutineType(types: !1646)
!1646 = !{null, !14, !7, !1490, !7, !1647, !7}
!1647 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!1648 = !DILocalVariable(name: "obj_intensity", arg: 1, scope: !1644, file: !24, line: 157, type: !14)
!1649 = !DILocation(line: 157, column: 22, scope: !1644)
!1650 = !DILocalVariable(name: "obj_seg", arg: 2, scope: !1644, file: !24, line: 157, type: !7)
!1651 = !DILocation(line: 157, column: 41, scope: !1644)
!1652 = !DILocalVariable(name: "obj_pos", arg: 3, scope: !1644, file: !24, line: 157, type: !1490)
!1653 = !DILocation(line: 157, column: 62, scope: !1644)
!1654 = !DILocalVariable(name: "n_render_vertices", arg: 4, scope: !1644, file: !24, line: 157, type: !7)
!1655 = !DILocation(line: 157, column: 75, scope: !1644)
!1656 = !DILocalVariable(name: "render_vertices", arg: 5, scope: !1644, file: !24, line: 157, type: !1647)
!1657 = !DILocation(line: 157, column: 101, scope: !1644)
!1658 = !DILocalVariable(name: "objnum", arg: 6, scope: !1644, file: !24, line: 157, type: !7)
!1659 = !DILocation(line: 157, column: 122, scope: !1644)
!1660 = !DILocalVariable(name: "vv", scope: !1644, file: !24, line: 159, type: !7)
!1661 = !DILocation(line: 159, column: 6, scope: !1644)
!1662 = !DILocation(line: 161, column: 6, scope: !1663)
!1663 = distinct !DILexicalBlock(scope: !1644, file: !24, line: 161, column: 6)
!1664 = !DILocalVariable(name: "obji_64", scope: !1665, file: !24, line: 163, type: !14)
!1665 = distinct !DILexicalBlock(scope: !1663, file: !24, line: 162, column: 2)
!1666 = !DILocation(line: 163, column: 7, scope: !1665)
!1667 = !DILocation(line: 163, column: 17, scope: !1665)
!1668 = !DILocation(line: 163, column: 31, scope: !1665)
!1669 = !DILocation(line: 167, column: 12, scope: !1670)
!1670 = distinct !DILexicalBlock(scope: !1665, file: !24, line: 167, column: 7)
!1671 = !DILocation(line: 167, column: 8, scope: !1670)
!1672 = !DILocation(line: 167, column: 21, scope: !1670)
!1673 = !DILocation(line: 167, column: 34, scope: !1670)
!1674 = !DILocation(line: 167, column: 46, scope: !1670)
!1675 = !DILocation(line: 167, column: 38, scope: !1670)
!1676 = !DILocation(line: 167, column: 54, scope: !1670)
!1677 = !DILocation(line: 167, column: 59, scope: !1670)
!1678 = !DILocalVariable(name: "vp", scope: !1679, file: !24, line: 169, type: !1647)
!1679 = distinct !DILexicalBlock(scope: !1670, file: !24, line: 168, column: 3)
!1680 = !DILocation(line: 169, column: 11, scope: !1679)
!1681 = !DILocation(line: 169, column: 25, scope: !1679)
!1682 = !DILocation(line: 169, column: 16, scope: !1679)
!1683 = !DILocation(line: 169, column: 34, scope: !1679)
!1684 = !DILocation(line: 171, column: 12, scope: !1685)
!1685 = distinct !DILexicalBlock(scope: !1679, file: !24, line: 171, column: 4)
!1686 = !DILocation(line: 171, column: 9, scope: !1685)
!1687 = !DILocation(line: 171, column: 17, scope: !1688)
!1688 = distinct !DILexicalBlock(scope: !1685, file: !24, line: 171, column: 4)
!1689 = !DILocation(line: 171, column: 20, scope: !1688)
!1690 = !DILocation(line: 171, column: 4, scope: !1685)
!1691 = !DILocalVariable(name: "vertnum", scope: !1692, file: !24, line: 173, type: !7)
!1692 = distinct !DILexicalBlock(scope: !1688, file: !24, line: 172, column: 4)
!1693 = !DILocation(line: 173, column: 11, scope: !1692)
!1694 = !DILocalVariable(name: "vertpos", scope: !1692, file: !24, line: 174, type: !1490)
!1695 = !DILocation(line: 174, column: 17, scope: !1692)
!1696 = !DILocalVariable(name: "dist", scope: !1692, file: !24, line: 175, type: !14)
!1697 = !DILocation(line: 175, column: 11, scope: !1692)
!1698 = !DILocation(line: 177, column: 15, scope: !1692)
!1699 = !DILocation(line: 177, column: 18, scope: !1692)
!1700 = !DILocation(line: 177, column: 13, scope: !1692)
!1701 = !DILocation(line: 178, column: 10, scope: !1702)
!1702 = distinct !DILexicalBlock(scope: !1692, file: !24, line: 178, column: 9)
!1703 = !DILocation(line: 178, column: 20, scope: !1702)
!1704 = !DILocation(line: 178, column: 18, scope: !1702)
!1705 = !DILocation(line: 178, column: 32, scope: !1702)
!1706 = !DILocation(line: 178, column: 9, scope: !1702)
!1707 = !DILocation(line: 180, column: 26, scope: !1708)
!1708 = distinct !DILexicalBlock(scope: !1702, file: !24, line: 179, column: 5)
!1709 = !DILocation(line: 180, column: 17, scope: !1708)
!1710 = !DILocation(line: 180, column: 14, scope: !1708)
!1711 = !DILocation(line: 181, column: 31, scope: !1708)
!1712 = !DILocation(line: 181, column: 40, scope: !1708)
!1713 = !DILocation(line: 181, column: 13, scope: !1708)
!1714 = !DILocation(line: 181, column: 11, scope: !1708)
!1715 = !DILocation(line: 182, column: 20, scope: !1708)
!1716 = !DILocation(line: 182, column: 25, scope: !1708)
!1717 = !DILocation(line: 182, column: 30, scope: !1708)
!1718 = !DILocation(line: 182, column: 35, scope: !1708)
!1719 = !DILocation(line: 182, column: 13, scope: !1708)
!1720 = !DILocation(line: 182, column: 11, scope: !1708)
!1721 = !DILocation(line: 183, column: 10, scope: !1722)
!1722 = distinct !DILexicalBlock(scope: !1708, file: !24, line: 183, column: 10)
!1723 = !DILocation(line: 183, column: 21, scope: !1722)
!1724 = !DILocation(line: 183, column: 17, scope: !1722)
!1725 = !DILocation(line: 183, column: 15, scope: !1722)
!1726 = !DILocation(line: 184, column: 11, scope: !1727)
!1727 = distinct !DILexicalBlock(scope: !1728, file: !24, line: 184, column: 11)
!1728 = distinct !DILexicalBlock(scope: !1722, file: !24, line: 183, column: 31)
!1729 = !DILocation(line: 184, column: 16, scope: !1727)
!1730 = !DILocation(line: 185, column: 13, scope: !1727)
!1731 = !DILocation(line: 185, column: 8, scope: !1727)
!1732 = !DILocation(line: 187, column: 40, scope: !1728)
!1733 = !DILocation(line: 187, column: 55, scope: !1728)
!1734 = !DILocation(line: 187, column: 33, scope: !1728)
!1735 = !DILocation(line: 187, column: 21, scope: !1728)
!1736 = !DILocation(line: 187, column: 7, scope: !1728)
!1737 = !DILocation(line: 187, column: 30, scope: !1728)
!1738 = !DILocation(line: 188, column: 6, scope: !1728)
!1739 = !DILocation(line: 189, column: 5, scope: !1708)
!1740 = !DILocation(line: 190, column: 4, scope: !1692)
!1741 = !DILocation(line: 171, column: 50, scope: !1688)
!1742 = !DILocation(line: 171, column: 4, scope: !1688)
!1743 = distinct !{!1743, !1690, !1744, !1745}
!1744 = !DILocation(line: 190, column: 4, scope: !1685)
!1745 = !{!"llvm.loop.mustprogress"}
!1746 = !DILocation(line: 191, column: 3, scope: !1679)
!1747 = !DILocalVariable(name: "headlight_shift", scope: !1748, file: !24, line: 194, type: !7)
!1748 = distinct !DILexicalBlock(scope: !1670, file: !24, line: 193, column: 3)
!1749 = !DILocation(line: 194, column: 8, scope: !1748)
!1750 = !DILocalVariable(name: "max_headlight_dist", scope: !1748, file: !24, line: 195, type: !14)
!1751 = !DILocation(line: 195, column: 8, scope: !1748)
!1752 = !DILocation(line: 197, column: 8, scope: !1753)
!1753 = distinct !DILexicalBlock(scope: !1748, file: !24, line: 197, column: 8)
!1754 = !DILocation(line: 197, column: 28, scope: !1753)
!1755 = !DILocation(line: 199, column: 17, scope: !1756)
!1756 = distinct !DILexicalBlock(scope: !1757, file: !24, line: 199, column: 9)
!1757 = distinct !DILexicalBlock(scope: !1753, file: !24, line: 198, column: 4)
!1758 = !DILocation(line: 199, column: 9, scope: !1756)
!1759 = !DILocation(line: 199, column: 25, scope: !1756)
!1760 = !DILocation(line: 199, column: 30, scope: !1756)
!1761 = !DILocation(line: 200, column: 26, scope: !1762)
!1762 = distinct !DILexicalBlock(scope: !1756, file: !24, line: 200, column: 10)
!1763 = !DILocation(line: 200, column: 18, scope: !1762)
!1764 = !DILocation(line: 200, column: 34, scope: !1762)
!1765 = !DILocation(line: 200, column: 10, scope: !1762)
!1766 = !DILocation(line: 200, column: 38, scope: !1762)
!1767 = !DILocation(line: 200, column: 44, scope: !1762)
!1768 = !DILocation(line: 202, column: 23, scope: !1769)
!1769 = distinct !DILexicalBlock(scope: !1762, file: !24, line: 201, column: 6)
!1770 = !DILocation(line: 203, column: 19, scope: !1771)
!1771 = distinct !DILexicalBlock(scope: !1769, file: !24, line: 203, column: 11)
!1772 = !DILocation(line: 203, column: 11, scope: !1771)
!1773 = !DILocation(line: 203, column: 27, scope: !1771)
!1774 = !DILocation(line: 203, column: 33, scope: !1771)
!1775 = !DILocation(line: 203, column: 30, scope: !1771)
!1776 = !DILocalVariable(name: "tvec", scope: !1777, file: !24, line: 205, type: !76)
!1777 = distinct !DILexicalBlock(scope: !1771, file: !24, line: 204, column: 7)
!1778 = !DILocation(line: 205, column: 19, scope: !1777)
!1779 = !DILocalVariable(name: "fq", scope: !1777, file: !24, line: 206, type: !1537)
!1780 = !DILocation(line: 206, column: 18, scope: !1777)
!1781 = !DILocalVariable(name: "hit_data", scope: !1777, file: !24, line: 207, type: !1550)
!1782 = !DILocation(line: 207, column: 18, scope: !1777)
!1783 = !DILocalVariable(name: "fate", scope: !1777, file: !24, line: 208, type: !7)
!1784 = !DILocation(line: 208, column: 14, scope: !1777)
!1785 = !DILocation(line: 210, column: 41, scope: !1777)
!1786 = !DILocation(line: 210, column: 33, scope: !1777)
!1787 = !DILocation(line: 210, column: 49, scope: !1777)
!1788 = !DILocation(line: 210, column: 63, scope: !1777)
!1789 = !DILocation(line: 210, column: 55, scope: !1777)
!1790 = !DILocation(line: 210, column: 71, scope: !1777)
!1791 = !DILocation(line: 210, column: 78, scope: !1777)
!1792 = !DILocation(line: 210, column: 8, scope: !1777)
!1793 = !DILocation(line: 212, column: 30, scope: !1777)
!1794 = !DILocation(line: 212, column: 22, scope: !1777)
!1795 = !DILocation(line: 212, column: 38, scope: !1777)
!1796 = !DILocation(line: 212, column: 11, scope: !1777)
!1797 = !DILocation(line: 212, column: 20, scope: !1777)
!1798 = !DILocation(line: 213, column: 25, scope: !1777)
!1799 = !DILocation(line: 213, column: 17, scope: !1777)
!1800 = !DILocation(line: 213, column: 33, scope: !1777)
!1801 = !DILocation(line: 213, column: 11, scope: !1777)
!1802 = !DILocation(line: 213, column: 14, scope: !1777)
!1803 = !DILocation(line: 214, column: 11, scope: !1777)
!1804 = !DILocation(line: 214, column: 14, scope: !1777)
!1805 = !DILocation(line: 215, column: 11, scope: !1777)
!1806 = !DILocation(line: 215, column: 15, scope: !1777)
!1807 = !DILocation(line: 216, column: 24, scope: !1777)
!1808 = !DILocation(line: 216, column: 11, scope: !1777)
!1809 = !DILocation(line: 216, column: 22, scope: !1777)
!1810 = !DILocation(line: 217, column: 11, scope: !1777)
!1811 = !DILocation(line: 217, column: 27, scope: !1777)
!1812 = !DILocation(line: 218, column: 11, scope: !1777)
!1813 = !DILocation(line: 218, column: 17, scope: !1777)
!1814 = !DILocation(line: 220, column: 15, scope: !1777)
!1815 = !DILocation(line: 220, column: 13, scope: !1777)
!1816 = !DILocation(line: 221, column: 12, scope: !1817)
!1817 = distinct !DILexicalBlock(scope: !1777, file: !24, line: 221, column: 12)
!1818 = !DILocation(line: 221, column: 17, scope: !1817)
!1819 = !DILocation(line: 222, column: 75, scope: !1817)
!1820 = !DILocation(line: 222, column: 93, scope: !1817)
!1821 = !DILocation(line: 222, column: 85, scope: !1817)
!1822 = !DILocation(line: 222, column: 101, scope: !1817)
!1823 = !DILocation(line: 222, column: 47, scope: !1817)
!1824 = !DILocation(line: 222, column: 30, scope: !1817)
!1825 = !DILocation(line: 222, column: 107, scope: !1817)
!1826 = !DILocation(line: 222, column: 28, scope: !1817)
!1827 = !DILocation(line: 222, column: 9, scope: !1817)
!1828 = !DILocation(line: 223, column: 7, scope: !1777)
!1829 = !DILocation(line: 224, column: 6, scope: !1769)
!1830 = !DILocation(line: 200, column: 46, scope: !1762)
!1831 = !DILocation(line: 228, column: 13, scope: !1832)
!1832 = distinct !DILexicalBlock(scope: !1757, file: !24, line: 228, column: 5)
!1833 = !DILocation(line: 228, column: 10, scope: !1832)
!1834 = !DILocation(line: 228, column: 18, scope: !1835)
!1835 = distinct !DILexicalBlock(scope: !1832, file: !24, line: 228, column: 5)
!1836 = !DILocation(line: 228, column: 23, scope: !1835)
!1837 = !DILocation(line: 228, column: 21, scope: !1835)
!1838 = !DILocation(line: 228, column: 5, scope: !1832)
!1839 = !DILocalVariable(name: "vertnum", scope: !1840, file: !24, line: 230, type: !7)
!1840 = distinct !DILexicalBlock(scope: !1835, file: !24, line: 229, column: 5)
!1841 = !DILocation(line: 230, column: 12, scope: !1840)
!1842 = !DILocalVariable(name: "vertpos", scope: !1840, file: !24, line: 231, type: !1490)
!1843 = !DILocation(line: 231, column: 18, scope: !1840)
!1844 = !DILocalVariable(name: "dist", scope: !1840, file: !24, line: 232, type: !14)
!1845 = !DILocation(line: 232, column: 12, scope: !1840)
!1846 = !DILocalVariable(name: "apply_light", scope: !1840, file: !24, line: 233, type: !7)
!1847 = !DILocation(line: 233, column: 12, scope: !1840)
!1848 = !DILocation(line: 235, column: 16, scope: !1840)
!1849 = !DILocation(line: 235, column: 32, scope: !1840)
!1850 = !DILocation(line: 235, column: 14, scope: !1840)
!1851 = !DILocation(line: 236, column: 11, scope: !1852)
!1852 = distinct !DILexicalBlock(scope: !1840, file: !24, line: 236, column: 10)
!1853 = !DILocation(line: 236, column: 21, scope: !1852)
!1854 = !DILocation(line: 236, column: 19, scope: !1852)
!1855 = !DILocation(line: 236, column: 33, scope: !1852)
!1856 = !DILocation(line: 236, column: 10, scope: !1852)
!1857 = !DILocation(line: 238, column: 27, scope: !1858)
!1858 = distinct !DILexicalBlock(scope: !1852, file: !24, line: 237, column: 6)
!1859 = !DILocation(line: 238, column: 18, scope: !1858)
!1860 = !DILocation(line: 238, column: 15, scope: !1858)
!1861 = !DILocation(line: 239, column: 32, scope: !1858)
!1862 = !DILocation(line: 239, column: 41, scope: !1858)
!1863 = !DILocation(line: 239, column: 14, scope: !1858)
!1864 = !DILocation(line: 239, column: 12, scope: !1858)
!1865 = !DILocation(line: 240, column: 19, scope: !1858)
!1866 = !DILocation(line: 242, column: 12, scope: !1867)
!1867 = distinct !DILexicalBlock(scope: !1858, file: !24, line: 242, column: 11)
!1868 = !DILocation(line: 242, column: 20, scope: !1867)
!1869 = !DILocation(line: 242, column: 17, scope: !1867)
!1870 = !DILocation(line: 242, column: 43, scope: !1867)
!1871 = !DILocation(line: 242, column: 39, scope: !1867)
!1872 = !DILocation(line: 242, column: 37, scope: !1867)
!1873 = !DILocation(line: 244, column: 12, scope: !1874)
!1874 = distinct !DILexicalBlock(scope: !1875, file: !24, line: 244, column: 12)
!1875 = distinct !DILexicalBlock(scope: !1867, file: !24, line: 243, column: 7)
!1876 = !DILocation(line: 244, column: 17, scope: !1874)
!1877 = !DILocation(line: 245, column: 14, scope: !1874)
!1878 = !DILocation(line: 245, column: 9, scope: !1874)
!1879 = !DILocation(line: 252, column: 20, scope: !1875)
!1880 = !DILocation(line: 254, column: 12, scope: !1881)
!1881 = distinct !DILexicalBlock(scope: !1875, file: !24, line: 254, column: 12)
!1882 = !DILocation(line: 256, column: 13, scope: !1883)
!1883 = distinct !DILexicalBlock(scope: !1884, file: !24, line: 256, column: 13)
!1884 = distinct !DILexicalBlock(scope: !1881, file: !24, line: 255, column: 8)
!1885 = !DILocalVariable(name: "dot", scope: !1886, file: !24, line: 258, type: !14)
!1886 = distinct !DILexicalBlock(scope: !1883, file: !24, line: 257, column: 9)
!1887 = !DILocation(line: 258, column: 16, scope: !1886)
!1888 = !DILocalVariable(name: "vec_to_point", scope: !1886, file: !24, line: 259, type: !76)
!1889 = !DILocation(line: 259, column: 21, scope: !1886)
!1890 = !DILocation(line: 261, column: 36, scope: !1886)
!1891 = !DILocation(line: 261, column: 45, scope: !1886)
!1892 = !DILocation(line: 261, column: 10, scope: !1886)
!1893 = !DILocation(line: 262, column: 10, scope: !1886)
!1894 = !DILocation(line: 263, column: 16, scope: !1886)
!1895 = !DILocation(line: 263, column: 14, scope: !1886)
!1896 = !DILocation(line: 264, column: 14, scope: !1897)
!1897 = distinct !DILexicalBlock(scope: !1886, file: !24, line: 264, column: 14)
!1898 = !DILocation(line: 264, column: 18, scope: !1897)
!1899 = !DILocation(line: 265, column: 44, scope: !1897)
!1900 = !DILocation(line: 265, column: 83, scope: !1897)
!1901 = !DILocation(line: 265, column: 59, scope: !1897)
!1902 = !DILocation(line: 265, column: 37, scope: !1897)
!1903 = !DILocation(line: 265, column: 25, scope: !1897)
!1904 = !DILocation(line: 265, column: 11, scope: !1897)
!1905 = !DILocation(line: 265, column: 34, scope: !1897)
!1906 = !DILocation(line: 268, column: 15, scope: !1907)
!1907 = distinct !DILexicalBlock(scope: !1908, file: !24, line: 268, column: 15)
!1908 = distinct !DILexicalBlock(scope: !1897, file: !24, line: 267, column: 10)
!1909 = !DILocation(line: 268, column: 25, scope: !1907)
!1910 = !DILocation(line: 270, column: 16, scope: !1911)
!1911 = distinct !DILexicalBlock(scope: !1912, file: !24, line: 270, column: 16)
!1912 = distinct !DILexicalBlock(scope: !1907, file: !24, line: 269, column: 11)
!1913 = !DILocation(line: 270, column: 23, scope: !1911)
!1914 = !DILocation(line: 270, column: 21, scope: !1911)
!1915 = !DILocation(line: 271, column: 53, scope: !1911)
!1916 = !DILocation(line: 271, column: 58, scope: !1911)
!1917 = !DILocation(line: 271, column: 46, scope: !1911)
!1918 = !DILocation(line: 271, column: 64, scope: !1911)
!1919 = !DILocation(line: 271, column: 39, scope: !1911)
!1920 = !DILocation(line: 271, column: 79, scope: !1911)
!1921 = !DILocation(line: 271, column: 27, scope: !1911)
!1922 = !DILocation(line: 271, column: 13, scope: !1911)
!1923 = !DILocation(line: 271, column: 36, scope: !1911)
!1924 = !DILocation(line: 272, column: 11, scope: !1912)
!1925 = !DILocation(line: 274, column: 52, scope: !1907)
!1926 = !DILocation(line: 274, column: 57, scope: !1907)
!1927 = !DILocation(line: 274, column: 45, scope: !1907)
!1928 = !DILocation(line: 274, column: 63, scope: !1907)
!1929 = !DILocation(line: 274, column: 38, scope: !1907)
!1930 = !DILocation(line: 274, column: 78, scope: !1907)
!1931 = !DILocation(line: 274, column: 26, scope: !1907)
!1932 = !DILocation(line: 274, column: 12, scope: !1907)
!1933 = !DILocation(line: 274, column: 35, scope: !1907)
!1934 = !DILocation(line: 276, column: 9, scope: !1886)
!1935 = !DILocation(line: 278, column: 43, scope: !1883)
!1936 = !DILocation(line: 278, column: 58, scope: !1883)
!1937 = !DILocation(line: 278, column: 36, scope: !1883)
!1938 = !DILocation(line: 278, column: 24, scope: !1883)
!1939 = !DILocation(line: 278, column: 10, scope: !1883)
!1940 = !DILocation(line: 278, column: 33, scope: !1883)
!1941 = !DILocation(line: 279, column: 8, scope: !1884)
!1942 = !DILocation(line: 280, column: 7, scope: !1875)
!1943 = !DILocation(line: 281, column: 6, scope: !1858)
!1944 = !DILocation(line: 282, column: 5, scope: !1840)
!1945 = !DILocation(line: 228, column: 44, scope: !1835)
!1946 = !DILocation(line: 228, column: 5, scope: !1835)
!1947 = distinct !{!1947, !1838, !1948, !1745}
!1948 = !DILocation(line: 282, column: 5, scope: !1832)
!1949 = !DILocation(line: 283, column: 4, scope: !1757)
!1950 = !DILocation(line: 286, column: 15, scope: !1951)
!1951 = distinct !DILexicalBlock(scope: !1952, file: !24, line: 286, column: 5)
!1952 = distinct !DILexicalBlock(scope: !1753, file: !24, line: 285, column: 4)
!1953 = !DILocation(line: 286, column: 26, scope: !1951)
!1954 = !DILocation(line: 286, column: 13, scope: !1951)
!1955 = !DILocation(line: 286, column: 10, scope: !1951)
!1956 = !DILocation(line: 286, column: 31, scope: !1957)
!1957 = distinct !DILexicalBlock(scope: !1951, file: !24, line: 286, column: 5)
!1958 = !DILocation(line: 286, column: 36, scope: !1957)
!1959 = !DILocation(line: 286, column: 34, scope: !1957)
!1960 = !DILocation(line: 286, column: 5, scope: !1951)
!1961 = !DILocalVariable(name: "vertnum", scope: !1962, file: !24, line: 288, type: !7)
!1962 = distinct !DILexicalBlock(scope: !1957, file: !24, line: 287, column: 5)
!1963 = !DILocation(line: 288, column: 12, scope: !1962)
!1964 = !DILocalVariable(name: "vertpos", scope: !1962, file: !24, line: 289, type: !1490)
!1965 = !DILocation(line: 289, column: 18, scope: !1962)
!1966 = !DILocalVariable(name: "dist", scope: !1962, file: !24, line: 290, type: !14)
!1967 = !DILocation(line: 290, column: 12, scope: !1962)
!1968 = !DILocation(line: 292, column: 16, scope: !1962)
!1969 = !DILocation(line: 292, column: 32, scope: !1962)
!1970 = !DILocation(line: 292, column: 14, scope: !1962)
!1971 = !DILocation(line: 293, column: 26, scope: !1962)
!1972 = !DILocation(line: 293, column: 17, scope: !1962)
!1973 = !DILocation(line: 293, column: 14, scope: !1962)
!1974 = !DILocation(line: 294, column: 31, scope: !1962)
!1975 = !DILocation(line: 294, column: 40, scope: !1962)
!1976 = !DILocation(line: 294, column: 13, scope: !1962)
!1977 = !DILocation(line: 294, column: 11, scope: !1962)
!1978 = !DILocation(line: 296, column: 10, scope: !1979)
!1979 = distinct !DILexicalBlock(scope: !1962, file: !24, line: 296, column: 10)
!1980 = !DILocation(line: 296, column: 17, scope: !1979)
!1981 = !DILocation(line: 296, column: 15, scope: !1979)
!1982 = !DILocation(line: 298, column: 11, scope: !1983)
!1983 = distinct !DILexicalBlock(scope: !1984, file: !24, line: 298, column: 11)
!1984 = distinct !DILexicalBlock(scope: !1979, file: !24, line: 297, column: 6)
!1985 = !DILocation(line: 298, column: 16, scope: !1983)
!1986 = !DILocation(line: 299, column: 13, scope: !1983)
!1987 = !DILocation(line: 299, column: 8, scope: !1983)
!1988 = !DILocation(line: 301, column: 40, scope: !1984)
!1989 = !DILocation(line: 301, column: 55, scope: !1984)
!1990 = !DILocation(line: 301, column: 33, scope: !1984)
!1991 = !DILocation(line: 301, column: 21, scope: !1984)
!1992 = !DILocation(line: 301, column: 7, scope: !1984)
!1993 = !DILocation(line: 301, column: 30, scope: !1984)
!1994 = !DILocation(line: 302, column: 6, scope: !1984)
!1995 = !DILocation(line: 303, column: 5, scope: !1962)
!1996 = !DILocation(line: 286, column: 58, scope: !1957)
!1997 = !DILocation(line: 286, column: 5, scope: !1957)
!1998 = distinct !{!1998, !1960, !1999, !1745}
!1999 = !DILocation(line: 303, column: 5, scope: !1951)
!2000 = !DILocation(line: 306, column: 2, scope: !1665)
!2001 = !DILocation(line: 307, column: 1, scope: !1644)
!2002 = distinct !DISubprogram(name: "fixmul", linkageName: "_Z6fixmulii", scope: !15, file: !15, line: 83, type: !2003, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1491)
!2003 = !DISubroutineType(types: !2004)
!2004 = !{!14, !14, !14}
!2005 = !DILocalVariable(name: "a", arg: 1, scope: !2002, file: !15, line: 83, type: !14)
!2006 = !DILocation(line: 83, column: 26, scope: !2002)
!2007 = !DILocalVariable(name: "b", arg: 2, scope: !2002, file: !15, line: 83, type: !14)
!2008 = !DILocation(line: 83, column: 33, scope: !2002)
!2009 = !DILocation(line: 85, column: 19, scope: !2002)
!2010 = !DILocation(line: 85, column: 32, scope: !2002)
!2011 = !DILocation(line: 85, column: 21, scope: !2002)
!2012 = !DILocation(line: 85, column: 35, scope: !2002)
!2013 = !DILocation(line: 85, column: 9, scope: !2002)
!2014 = !DILocation(line: 85, column: 2, scope: !2002)
!2015 = distinct !DISubprogram(name: "fixdiv", linkageName: "_Z6fixdivii", scope: !15, file: !15, line: 89, type: !2003, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1491)
!2016 = !DILocalVariable(name: "a", arg: 1, scope: !2015, file: !15, line: 89, type: !14)
!2017 = !DILocation(line: 89, column: 26, scope: !2015)
!2018 = !DILocalVariable(name: "b", arg: 2, scope: !2015, file: !15, line: 89, type: !14)
!2019 = !DILocation(line: 89, column: 33, scope: !2015)
!2020 = !DILocation(line: 92, column: 6, scope: !2021)
!2021 = distinct !DILexicalBlock(scope: !2015, file: !15, line: 92, column: 6)
!2022 = !DILocation(line: 92, column: 8, scope: !2021)
!2023 = !DILocation(line: 92, column: 14, scope: !2021)
!2024 = !DILocation(line: 94, column: 25, scope: !2015)
!2025 = !DILocation(line: 94, column: 27, scope: !2015)
!2026 = !DILocation(line: 94, column: 36, scope: !2015)
!2027 = !DILocation(line: 94, column: 34, scope: !2015)
!2028 = !DILocation(line: 94, column: 14, scope: !2015)
!2029 = !DILocation(line: 94, column: 2, scope: !2015)
!2030 = !DILocation(line: 95, column: 1, scope: !2015)
!2031 = distinct !DISubprogram(name: "cast_muzzle_flash_light", linkageName: "_Z23cast_muzzle_flash_lightiPs", scope: !24, file: !24, line: 313, type: !2032, scopeLine: 314, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1491)
!2032 = !DISubroutineType(types: !2033)
!2033 = !{null, !7, !1647}
!2034 = !DILocalVariable(name: "n_render_vertices", arg: 1, scope: !2031, file: !24, line: 313, type: !7)
!2035 = !DILocation(line: 313, column: 34, scope: !2031)
!2036 = !DILocalVariable(name: "render_vertices", arg: 2, scope: !2031, file: !24, line: 313, type: !1647)
!2037 = !DILocation(line: 313, column: 60, scope: !2031)
!2038 = !DILocalVariable(name: "current_time", scope: !2031, file: !24, line: 336, type: !14)
!2039 = !DILocation(line: 336, column: 6, scope: !2031)
!2040 = !DILocalVariable(name: "i", scope: !2031, file: !24, line: 337, type: !7)
!2041 = !DILocation(line: 337, column: 6, scope: !2031)
!2042 = !DILocalVariable(name: "time_since_flash", scope: !2031, file: !24, line: 338, type: !67)
!2043 = !DILocation(line: 338, column: 8, scope: !2031)
!2044 = !DILocation(line: 340, column: 17, scope: !2031)
!2045 = !DILocation(line: 340, column: 15, scope: !2031)
!2046 = !DILocation(line: 342, column: 9, scope: !2047)
!2047 = distinct !DILexicalBlock(scope: !2031, file: !24, line: 342, column: 2)
!2048 = !DILocation(line: 342, column: 7, scope: !2047)
!2049 = !DILocation(line: 342, column: 14, scope: !2050)
!2050 = distinct !DILexicalBlock(scope: !2047, file: !24, line: 342, column: 2)
!2051 = !DILocation(line: 342, column: 16, scope: !2050)
!2052 = !DILocation(line: 342, column: 2, scope: !2047)
!2053 = !DILocation(line: 344, column: 19, scope: !2054)
!2054 = distinct !DILexicalBlock(scope: !2055, file: !24, line: 344, column: 7)
!2055 = distinct !DILexicalBlock(scope: !2050, file: !24, line: 343, column: 2)
!2056 = !DILocation(line: 344, column: 7, scope: !2054)
!2057 = !DILocation(line: 344, column: 22, scope: !2054)
!2058 = !DILocation(line: 346, column: 23, scope: !2059)
!2059 = distinct !DILexicalBlock(scope: !2054, file: !24, line: 345, column: 3)
!2060 = !DILocation(line: 346, column: 50, scope: !2059)
!2061 = !DILocation(line: 346, column: 38, scope: !2059)
!2062 = !DILocation(line: 346, column: 53, scope: !2059)
!2063 = !DILocation(line: 346, column: 36, scope: !2059)
!2064 = !DILocation(line: 346, column: 21, scope: !2059)
!2065 = !DILocation(line: 347, column: 8, scope: !2066)
!2066 = distinct !DILexicalBlock(scope: !2059, file: !24, line: 347, column: 8)
!2067 = !DILocation(line: 347, column: 25, scope: !2066)
!2068 = !DILocation(line: 348, column: 44, scope: !2066)
!2069 = !DILocation(line: 348, column: 42, scope: !2066)
!2070 = !DILocation(line: 348, column: 62, scope: !2066)
!2071 = !DILocation(line: 348, column: 89, scope: !2066)
!2072 = !DILocation(line: 348, column: 77, scope: !2066)
!2073 = !DILocation(line: 348, column: 92, scope: !2066)
!2074 = !DILocation(line: 348, column: 113, scope: !2066)
!2075 = !DILocation(line: 348, column: 101, scope: !2066)
!2076 = !DILocation(line: 348, column: 116, scope: !2066)
!2077 = !DILocation(line: 348, column: 121, scope: !2066)
!2078 = !DILocation(line: 348, column: 140, scope: !2066)
!2079 = !DILocation(line: 348, column: 5, scope: !2066)
!2080 = !DILocation(line: 350, column: 17, scope: !2066)
!2081 = !DILocation(line: 350, column: 5, scope: !2066)
!2082 = !DILocation(line: 350, column: 20, scope: !2066)
!2083 = !DILocation(line: 350, column: 32, scope: !2066)
!2084 = !DILocation(line: 351, column: 3, scope: !2059)
!2085 = !DILocation(line: 352, column: 2, scope: !2055)
!2086 = !DILocation(line: 342, column: 37, scope: !2050)
!2087 = !DILocation(line: 342, column: 2, scope: !2050)
!2088 = distinct !{!2088, !2052, !2089, !1745}
!2089 = !DILocation(line: 352, column: 2, scope: !2047)
!2090 = !DILocation(line: 353, column: 1, scope: !2031)
!2091 = distinct !DISubprogram(name: "compute_light_intensity", linkageName: "_Z23compute_light_intensityi", scope: !24, file: !24, line: 370, type: !2092, scopeLine: 371, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1491)
!2092 = !DISubroutineType(types: !2093)
!2093 = !{!14, !7}
!2094 = !DILocalVariable(name: "objnum", arg: 1, scope: !2091, file: !24, line: 370, type: !7)
!2095 = !DILocation(line: 370, column: 33, scope: !2091)
!2096 = !DILocalVariable(name: "obj", scope: !2091, file: !24, line: 372, type: !55)
!2097 = !DILocation(line: 372, column: 10, scope: !2091)
!2098 = !DILocation(line: 372, column: 25, scope: !2091)
!2099 = !DILocation(line: 372, column: 17, scope: !2091)
!2100 = !DILocalVariable(name: "objtype", scope: !2091, file: !24, line: 373, type: !7)
!2101 = !DILocation(line: 373, column: 8, scope: !2091)
!2102 = !DILocation(line: 373, column: 18, scope: !2091)
!2103 = !DILocation(line: 373, column: 23, scope: !2091)
!2104 = !DILocalVariable(name: "hoardlight", scope: !2091, file: !24, line: 374, type: !14)
!2105 = !DILocation(line: 374, column: 6, scope: !2091)
!2106 = !DILocalVariable(name: "s", scope: !2091, file: !24, line: 374, type: !14)
!2107 = !DILocation(line: 374, column: 18, scope: !2091)
!2108 = !DILocation(line: 376, column: 10, scope: !2091)
!2109 = !DILocation(line: 376, column: 2, scope: !2091)
!2110 = !DILocation(line: 378, column: 7, scope: !2111)
!2111 = distinct !DILexicalBlock(scope: !2112, file: !24, line: 378, column: 7)
!2112 = distinct !DILexicalBlock(scope: !2091, file: !24, line: 376, column: 19)
!2113 = !DILocation(line: 378, column: 27, scope: !2111)
!2114 = !DILocation(line: 380, column: 16, scope: !2115)
!2115 = distinct !DILexicalBlock(scope: !2116, file: !24, line: 380, column: 8)
!2116 = distinct !DILexicalBlock(scope: !2111, file: !24, line: 379, column: 3)
!2117 = !DILocation(line: 380, column: 21, scope: !2115)
!2118 = !DILocation(line: 380, column: 8, scope: !2115)
!2119 = !DILocation(line: 380, column: 25, scope: !2115)
!2120 = !DILocation(line: 380, column: 31, scope: !2115)
!2121 = !DILocation(line: 382, column: 9, scope: !2122)
!2122 = distinct !DILexicalBlock(scope: !2123, file: !24, line: 382, column: 9)
!2123 = distinct !DILexicalBlock(scope: !2115, file: !24, line: 381, column: 4)
!2124 = !DILocation(line: 382, column: 24, scope: !2122)
!2125 = !DILocation(line: 383, column: 37, scope: !2122)
!2126 = !DILocation(line: 383, column: 31, scope: !2122)
!2127 = !DILocation(line: 383, column: 6, scope: !2122)
!2128 = !DILocation(line: 383, column: 35, scope: !2122)
!2129 = !DILocation(line: 384, column: 5, scope: !2123)
!2130 = !DILocation(line: 386, column: 14, scope: !2131)
!2131 = distinct !DILexicalBlock(scope: !2115, file: !24, line: 386, column: 13)
!2132 = !DILocation(line: 386, column: 24, scope: !2131)
!2133 = !DILocation(line: 386, column: 13, scope: !2131)
!2134 = !DILocation(line: 386, column: 36, scope: !2131)
!2135 = !DILocation(line: 386, column: 47, scope: !2131)
!2136 = !DILocation(line: 386, column: 52, scope: !2131)
!2137 = !DILocation(line: 386, column: 39, scope: !2131)
!2138 = !DILocation(line: 386, column: 56, scope: !2131)
!2139 = !DILocation(line: 392, column: 30, scope: !2140)
!2140 = distinct !DILexicalBlock(scope: !2131, file: !24, line: 387, column: 4)
!2141 = !DILocation(line: 392, column: 35, scope: !2140)
!2142 = !DILocation(line: 392, column: 22, scope: !2140)
!2143 = !DILocation(line: 392, column: 39, scope: !2140)
!2144 = !DILocation(line: 392, column: 18, scope: !2140)
!2145 = !DILocation(line: 392, column: 72, scope: !2140)
!2146 = !DILocation(line: 392, column: 16, scope: !2140)
!2147 = !DILocation(line: 393, column: 15, scope: !2140)
!2148 = !DILocation(line: 394, column: 17, scope: !2140)
!2149 = !DILocation(line: 394, column: 26, scope: !2140)
!2150 = !DILocation(line: 394, column: 31, scope: !2140)
!2151 = !DILocation(line: 394, column: 5, scope: !2140)
!2152 = !DILocation(line: 395, column: 7, scope: !2140)
!2153 = !DILocation(line: 396, column: 7, scope: !2140)
!2154 = !DILocation(line: 397, column: 25, scope: !2140)
!2155 = !DILocation(line: 397, column: 28, scope: !2140)
!2156 = !DILocation(line: 397, column: 18, scope: !2140)
!2157 = !DILocation(line: 397, column: 16, scope: !2140)
!2158 = !DILocation(line: 399, column: 13, scope: !2140)
!2159 = !DILocation(line: 399, column: 5, scope: !2140)
!2160 = !DILocation(line: 402, column: 39, scope: !2131)
!2161 = !DILocation(line: 402, column: 44, scope: !2131)
!2162 = !DILocation(line: 402, column: 60, scope: !2131)
!2163 = !DILocation(line: 402, column: 21, scope: !2131)
!2164 = !DILocation(line: 402, column: 68, scope: !2131)
!2165 = !DILocation(line: 402, column: 73, scope: !2131)
!2166 = !DILocation(line: 402, column: 12, scope: !2131)
!2167 = !DILocation(line: 402, column: 88, scope: !2131)
!2168 = !DILocation(line: 402, column: 5, scope: !2131)
!2169 = !DILocation(line: 406, column: 8, scope: !2170)
!2170 = distinct !DILexicalBlock(scope: !2171, file: !24, line: 406, column: 8)
!2171 = distinct !DILexicalBlock(scope: !2111, file: !24, line: 405, column: 3)
!2172 = !DILocation(line: 406, column: 13, scope: !2170)
!2173 = !DILocation(line: 406, column: 19, scope: !2170)
!2174 = !DILocation(line: 406, column: 16, scope: !2170)
!2175 = !DILocation(line: 408, column: 17, scope: !2176)
!2176 = distinct !DILexicalBlock(scope: !2177, file: !24, line: 408, column: 9)
!2177 = distinct !DILexicalBlock(scope: !2170, file: !24, line: 407, column: 4)
!2178 = !DILocation(line: 408, column: 22, scope: !2176)
!2179 = !DILocation(line: 408, column: 9, scope: !2176)
!2180 = !DILocation(line: 408, column: 26, scope: !2176)
!2181 = !DILocation(line: 408, column: 32, scope: !2176)
!2182 = !DILocation(line: 409, column: 6, scope: !2176)
!2183 = !DILocation(line: 411, column: 6, scope: !2176)
!2184 = !DILocation(line: 415, column: 9, scope: !2185)
!2185 = distinct !DILexicalBlock(scope: !2186, file: !24, line: 415, column: 9)
!2186 = distinct !DILexicalBlock(scope: !2170, file: !24, line: 414, column: 4)
!2187 = !DILocation(line: 415, column: 14, scope: !2185)
!2188 = !DILocation(line: 415, column: 17, scope: !2185)
!2189 = !DILocation(line: 417, column: 10, scope: !2190)
!2190 = distinct !DILexicalBlock(scope: !2191, file: !24, line: 417, column: 10)
!2191 = distinct !DILexicalBlock(scope: !2185, file: !24, line: 416, column: 5)
!2192 = !DILocation(line: 417, column: 15, scope: !2190)
!2193 = !DILocation(line: 417, column: 24, scope: !2190)
!2194 = !DILocation(line: 418, column: 28, scope: !2190)
!2195 = !DILocation(line: 418, column: 33, scope: !2190)
!2196 = !DILocation(line: 418, column: 49, scope: !2190)
!2197 = !DILocation(line: 418, column: 54, scope: !2190)
!2198 = !DILocation(line: 418, column: 43, scope: !2190)
!2199 = !DILocation(line: 418, column: 58, scope: !2190)
!2200 = !DILocation(line: 418, column: 21, scope: !2190)
!2201 = !DILocation(line: 418, column: 76, scope: !2190)
!2202 = !DILocation(line: 418, column: 81, scope: !2190)
!2203 = !DILocation(line: 418, column: 70, scope: !2190)
!2204 = !DILocation(line: 418, column: 85, scope: !2190)
!2205 = !DILocation(line: 418, column: 14, scope: !2190)
!2206 = !DILocation(line: 418, column: 7, scope: !2190)
!2207 = !DILocation(line: 420, column: 20, scope: !2190)
!2208 = !DILocation(line: 420, column: 25, scope: !2190)
!2209 = !DILocation(line: 420, column: 14, scope: !2190)
!2210 = !DILocation(line: 420, column: 29, scope: !2190)
!2211 = !DILocation(line: 420, column: 7, scope: !2190)
!2212 = !DILocation(line: 424, column: 3, scope: !2112)
!2213 = !DILocation(line: 426, column: 7, scope: !2214)
!2214 = distinct !DILexicalBlock(scope: !2112, file: !24, line: 426, column: 7)
!2215 = !DILocation(line: 426, column: 12, scope: !2214)
!2216 = !DILocation(line: 426, column: 15, scope: !2214)
!2217 = !DILocation(line: 428, column: 8, scope: !2218)
!2218 = distinct !DILexicalBlock(scope: !2219, file: !24, line: 428, column: 8)
!2219 = distinct !DILexicalBlock(scope: !2214, file: !24, line: 427, column: 3)
!2220 = !DILocation(line: 428, column: 13, scope: !2218)
!2221 = !DILocation(line: 428, column: 22, scope: !2218)
!2222 = !DILocation(line: 429, column: 26, scope: !2218)
!2223 = !DILocation(line: 429, column: 31, scope: !2218)
!2224 = !DILocation(line: 429, column: 47, scope: !2218)
!2225 = !DILocation(line: 429, column: 52, scope: !2218)
!2226 = !DILocation(line: 429, column: 41, scope: !2218)
!2227 = !DILocation(line: 429, column: 56, scope: !2218)
!2228 = !DILocation(line: 429, column: 19, scope: !2218)
!2229 = !DILocation(line: 429, column: 74, scope: !2218)
!2230 = !DILocation(line: 429, column: 79, scope: !2218)
!2231 = !DILocation(line: 429, column: 68, scope: !2218)
!2232 = !DILocation(line: 429, column: 83, scope: !2218)
!2233 = !DILocation(line: 429, column: 12, scope: !2218)
!2234 = !DILocation(line: 429, column: 5, scope: !2218)
!2235 = !DILocation(line: 431, column: 18, scope: !2218)
!2236 = !DILocation(line: 431, column: 23, scope: !2218)
!2237 = !DILocation(line: 431, column: 12, scope: !2218)
!2238 = !DILocation(line: 431, column: 27, scope: !2218)
!2239 = !DILocation(line: 431, column: 5, scope: !2218)
!2240 = !DILocation(line: 434, column: 4, scope: !2214)
!2241 = !DILocation(line: 437, column: 28, scope: !2112)
!2242 = !DILocation(line: 437, column: 33, scope: !2112)
!2243 = !DILocation(line: 437, column: 17, scope: !2112)
!2244 = !DILocation(line: 437, column: 37, scope: !2112)
!2245 = !DILocation(line: 437, column: 15, scope: !2112)
!2246 = !DILocation(line: 437, column: 3, scope: !2112)
!2247 = !DILocalVariable(name: "tval", scope: !2248, file: !24, line: 441, type: !14)
!2248 = distinct !DILexicalBlock(scope: !2112, file: !24, line: 440, column: 2)
!2249 = !DILocation(line: 441, column: 7, scope: !2248)
!2250 = !DILocation(line: 441, column: 26, scope: !2248)
!2251 = !DILocation(line: 441, column: 31, scope: !2248)
!2252 = !DILocation(line: 441, column: 14, scope: !2248)
!2253 = !DILocation(line: 441, column: 35, scope: !2248)
!2254 = !DILocation(line: 442, column: 7, scope: !2255)
!2255 = distinct !DILexicalBlock(scope: !2248, file: !24, line: 442, column: 7)
!2256 = !DILocation(line: 442, column: 17, scope: !2255)
!2257 = !DILocation(line: 443, column: 8, scope: !2258)
!2258 = distinct !DILexicalBlock(scope: !2255, file: !24, line: 443, column: 8)
!2259 = !DILocation(line: 443, column: 13, scope: !2258)
!2260 = !DILocation(line: 443, column: 16, scope: !2258)
!2261 = !DILocation(line: 444, column: 9, scope: !2262)
!2262 = distinct !DILexicalBlock(scope: !2258, file: !24, line: 444, column: 9)
!2263 = !DILocation(line: 444, column: 18, scope: !2262)
!2264 = !DILocation(line: 445, column: 6, scope: !2262)
!2265 = !DILocation(line: 444, column: 20, scope: !2262)
!2266 = !DILocation(line: 443, column: 19, scope: !2258)
!2267 = !DILocation(line: 447, column: 7, scope: !2268)
!2268 = distinct !DILexicalBlock(scope: !2248, file: !24, line: 447, column: 7)
!2269 = !DILocation(line: 447, column: 12, scope: !2268)
!2270 = !DILocation(line: 447, column: 15, scope: !2268)
!2271 = !DILocation(line: 448, column: 31, scope: !2268)
!2272 = !DILocation(line: 448, column: 36, scope: !2268)
!2273 = !DILocation(line: 448, column: 16, scope: !2268)
!2274 = !DILocation(line: 448, column: 50, scope: !2268)
!2275 = !DILocation(line: 448, column: 77, scope: !2268)
!2276 = !DILocation(line: 448, column: 84, scope: !2268)
!2277 = !DILocation(line: 448, column: 61, scope: !2268)
!2278 = !DILocation(line: 448, column: 59, scope: !2268)
!2279 = !DILocation(line: 448, column: 93, scope: !2268)
!2280 = !DILocation(line: 448, column: 46, scope: !2268)
!2281 = !DILocation(line: 448, column: 13, scope: !2268)
!2282 = !DILocation(line: 448, column: 4, scope: !2268)
!2283 = !DILocation(line: 450, column: 11, scope: !2268)
!2284 = !DILocation(line: 450, column: 4, scope: !2268)
!2285 = !DILocalVariable(name: "lightval", scope: !2286, file: !24, line: 455, type: !14)
!2286 = distinct !DILexicalBlock(scope: !2112, file: !24, line: 454, column: 2)
!2287 = !DILocation(line: 455, column: 7, scope: !2286)
!2288 = !DILocation(line: 455, column: 18, scope: !2286)
!2289 = !DILocation(line: 455, column: 23, scope: !2286)
!2290 = !DILocation(line: 457, column: 12, scope: !2286)
!2291 = !DILocation(line: 459, column: 33, scope: !2286)
!2292 = !DILocation(line: 459, column: 31, scope: !2286)
!2293 = !DILocation(line: 459, column: 18, scope: !2286)
!2294 = !DILocation(line: 459, column: 16, scope: !2286)
!2295 = !DILocation(line: 459, column: 12, scope: !2286)
!2296 = !DILocation(line: 461, column: 7, scope: !2297)
!2297 = distinct !DILexicalBlock(scope: !2286, file: !24, line: 461, column: 7)
!2298 = !DILocation(line: 461, column: 12, scope: !2297)
!2299 = !DILocation(line: 461, column: 21, scope: !2297)
!2300 = !DILocation(line: 462, column: 4, scope: !2297)
!2301 = !DILocation(line: 462, column: 9, scope: !2297)
!2302 = !DILocation(line: 462, column: 18, scope: !2297)
!2303 = !DILocation(line: 464, column: 10, scope: !2286)
!2304 = !DILocation(line: 464, column: 3, scope: !2286)
!2305 = !DILocation(line: 468, column: 23, scope: !2112)
!2306 = !DILocation(line: 468, column: 28, scope: !2112)
!2307 = !DILocation(line: 468, column: 10, scope: !2112)
!2308 = !DILocation(line: 468, column: 32, scope: !2112)
!2309 = !DILocation(line: 468, column: 3, scope: !2112)
!2310 = !DILocation(line: 471, column: 3, scope: !2112)
!2311 = !DILocation(line: 474, column: 10, scope: !2112)
!2312 = !DILocation(line: 474, column: 15, scope: !2112)
!2313 = !DILocation(line: 474, column: 32, scope: !2112)
!2314 = !DILocation(line: 474, column: 3, scope: !2112)
!2315 = !DILocation(line: 477, column: 3, scope: !2112)
!2316 = !DILocation(line: 480, column: 1, scope: !2091)
!2317 = distinct !DISubprogram(name: "i2f", linkageName: "_Z3i2fi", scope: !15, file: !15, line: 49, type: !2092, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1491)
!2318 = !DILocalVariable(name: "i", arg: 1, scope: !2317, file: !15, line: 49, type: !7)
!2319 = !DILocation(line: 49, column: 23, scope: !2317)
!2320 = !DILocation(line: 51, column: 9, scope: !2317)
!2321 = !DILocation(line: 51, column: 11, scope: !2317)
!2322 = !DILocation(line: 51, column: 2, scope: !2317)
!2323 = distinct !DISubprogram(name: "max<int>", linkageName: "_ZNSt3__13maxB8ne200100IiEERKT_S3_S3_", scope: !239, file: !2324, line: 35, type: !2325, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, templateParams: !2328, retainedNodes: !1491)
!2324 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__algorithm/max.h", directory: "")
!2325 = !DISubroutineType(types: !2326)
!2326 = !{!2327, !2327, !2327}
!2327 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !236, size: 64)
!2328 = !{!2329}
!2329 = !DITemplateTypeParameter(name: "_Tp", type: !7)
!2330 = !DILocalVariable(name: "__a", arg: 1, scope: !2323, file: !2324, line: 35, type: !2327)
!2331 = !DILocation(line: 35, column: 38, scope: !2323)
!2332 = !DILocalVariable(name: "__b", arg: 2, scope: !2323, file: !2324, line: 35, type: !2327)
!2333 = !DILocation(line: 35, column: 76, scope: !2323)
!2334 = !DILocation(line: 36, column: 19, scope: !2323)
!2335 = !DILocation(line: 36, column: 24, scope: !2323)
!2336 = !DILocation(line: 36, column: 10, scope: !2323)
!2337 = !DILocation(line: 36, column: 3, scope: !2323)
!2338 = distinct !DISubprogram(name: "min<int>", linkageName: "_ZNSt3__13minB8ne200100IiEERKT_S3_S3_", scope: !239, file: !2339, line: 35, type: !2325, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, templateParams: !2328, retainedNodes: !1491)
!2339 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__algorithm/min.h", directory: "")
!2340 = !DILocalVariable(name: "__a", arg: 1, scope: !2338, file: !2339, line: 35, type: !2327)
!2341 = !DILocation(line: 35, column: 38, scope: !2338)
!2342 = !DILocalVariable(name: "__b", arg: 2, scope: !2338, file: !2339, line: 35, type: !2327)
!2343 = !DILocation(line: 35, column: 76, scope: !2338)
!2344 = !DILocation(line: 36, column: 19, scope: !2338)
!2345 = !DILocation(line: 36, column: 24, scope: !2338)
!2346 = !DILocation(line: 36, column: 10, scope: !2338)
!2347 = !DILocation(line: 36, column: 3, scope: !2338)
!2348 = distinct !DISubprogram(name: "set_dynamic_light", linkageName: "_Z17set_dynamic_lightv", scope: !24, file: !24, line: 483, type: !1249, scopeLine: 484, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1491)
!2349 = !DILocalVariable(name: "vv", scope: !2348, file: !24, line: 485, type: !7)
!2350 = !DILocation(line: 485, column: 6, scope: !2348)
!2351 = !DILocalVariable(name: "objnum", scope: !2348, file: !24, line: 486, type: !7)
!2352 = !DILocation(line: 486, column: 6, scope: !2348)
!2353 = !DILocalVariable(name: "n_render_vertices", scope: !2348, file: !24, line: 487, type: !7)
!2354 = !DILocation(line: 487, column: 6, scope: !2348)
!2355 = !DILocalVariable(name: "render_vertices", scope: !2348, file: !24, line: 488, type: !2356)
!2356 = !DICompositeType(tag: DW_TAG_array_type, baseType: !67, size: 57600, elements: !26)
!2357 = !DILocation(line: 488, column: 8, scope: !2348)
!2358 = !DILocalVariable(name: "render_vertex_flags", scope: !2348, file: !24, line: 489, type: !2359)
!2359 = !DICompositeType(tag: DW_TAG_array_type, baseType: !47, size: 28800, elements: !26)
!2360 = !DILocation(line: 489, column: 9, scope: !2348)
!2361 = !DILocalVariable(name: "render_seg", scope: !2348, file: !24, line: 490, type: !7)
!2362 = !DILocation(line: 490, column: 6, scope: !2348)
!2363 = !DILocalVariable(name: "segnum", scope: !2348, file: !24, line: 490, type: !7)
!2364 = !DILocation(line: 490, column: 18, scope: !2348)
!2365 = !DILocalVariable(name: "v", scope: !2348, file: !24, line: 490, type: !7)
!2366 = !DILocation(line: 490, column: 26, scope: !2348)
!2367 = !DILocalVariable(name: "new_lighting_objects", scope: !2348, file: !24, line: 491, type: !46)
!2368 = !DILocation(line: 491, column: 9, scope: !2348)
!2369 = !DILocation(line: 493, column: 17, scope: !2348)
!2370 = !DILocation(line: 495, column: 7, scope: !2371)
!2371 = distinct !DILexicalBlock(scope: !2348, file: !24, line: 495, column: 6)
!2372 = !DILocation(line: 495, column: 6, scope: !2371)
!2373 = !DILocation(line: 496, column: 3, scope: !2371)
!2374 = !DILocation(line: 501, column: 2, scope: !2348)
!2375 = !DILocation(line: 501, column: 33, scope: !2348)
!2376 = !DILocation(line: 501, column: 54, scope: !2348)
!2377 = !DILocation(line: 504, column: 20, scope: !2348)
!2378 = !DILocation(line: 505, column: 18, scope: !2379)
!2379 = distinct !DILexicalBlock(scope: !2348, file: !24, line: 505, column: 2)
!2380 = !DILocation(line: 505, column: 7, scope: !2379)
!2381 = !DILocation(line: 505, column: 23, scope: !2382)
!2382 = distinct !DILexicalBlock(scope: !2379, file: !24, line: 505, column: 2)
!2383 = !DILocation(line: 505, column: 36, scope: !2382)
!2384 = !DILocation(line: 505, column: 34, scope: !2382)
!2385 = !DILocation(line: 505, column: 2, scope: !2379)
!2386 = !DILocation(line: 507, column: 24, scope: !2387)
!2387 = distinct !DILexicalBlock(scope: !2382, file: !24, line: 506, column: 2)
!2388 = !DILocation(line: 507, column: 12, scope: !2387)
!2389 = !DILocation(line: 507, column: 10, scope: !2387)
!2390 = !DILocation(line: 508, column: 7, scope: !2391)
!2391 = distinct !DILexicalBlock(scope: !2387, file: !24, line: 508, column: 7)
!2392 = !DILocation(line: 508, column: 14, scope: !2391)
!2393 = !DILocalVariable(name: "vp", scope: !2394, file: !24, line: 510, type: !1647)
!2394 = distinct !DILexicalBlock(scope: !2391, file: !24, line: 509, column: 3)
!2395 = !DILocation(line: 510, column: 11, scope: !2394)
!2396 = !DILocation(line: 510, column: 25, scope: !2394)
!2397 = !DILocation(line: 510, column: 16, scope: !2394)
!2398 = !DILocation(line: 510, column: 33, scope: !2394)
!2399 = !DILocation(line: 511, column: 11, scope: !2400)
!2400 = distinct !DILexicalBlock(scope: !2394, file: !24, line: 511, column: 4)
!2401 = !DILocation(line: 511, column: 9, scope: !2400)
!2402 = !DILocation(line: 511, column: 16, scope: !2403)
!2403 = distinct !DILexicalBlock(scope: !2400, file: !24, line: 511, column: 4)
!2404 = !DILocation(line: 511, column: 18, scope: !2403)
!2405 = !DILocation(line: 511, column: 4, scope: !2400)
!2406 = !DILocalVariable(name: "vnum", scope: !2407, file: !24, line: 513, type: !7)
!2407 = distinct !DILexicalBlock(scope: !2403, file: !24, line: 512, column: 4)
!2408 = !DILocation(line: 513, column: 9, scope: !2407)
!2409 = !DILocation(line: 513, column: 16, scope: !2407)
!2410 = !DILocation(line: 513, column: 19, scope: !2407)
!2411 = !DILocation(line: 514, column: 9, scope: !2412)
!2412 = distinct !DILexicalBlock(scope: !2407, file: !24, line: 514, column: 9)
!2413 = !DILocation(line: 514, column: 13, scope: !2412)
!2414 = !DILocation(line: 514, column: 16, scope: !2412)
!2415 = !DILocation(line: 514, column: 19, scope: !2412)
!2416 = !DILocation(line: 514, column: 24, scope: !2412)
!2417 = !DILocation(line: 514, column: 23, scope: !2412)
!2418 = !DILocation(line: 516, column: 6, scope: !2419)
!2419 = distinct !DILexicalBlock(scope: !2412, file: !24, line: 515, column: 5)
!2420 = !DILocation(line: 517, column: 6, scope: !2419)
!2421 = !DILocation(line: 519, column: 30, scope: !2422)
!2422 = distinct !DILexicalBlock(scope: !2407, file: !24, line: 519, column: 9)
!2423 = !DILocation(line: 519, column: 10, scope: !2422)
!2424 = !DILocation(line: 519, column: 9, scope: !2422)
!2425 = !DILocation(line: 521, column: 26, scope: !2426)
!2426 = distinct !DILexicalBlock(scope: !2422, file: !24, line: 520, column: 5)
!2427 = !DILocation(line: 521, column: 6, scope: !2426)
!2428 = !DILocation(line: 521, column: 32, scope: !2426)
!2429 = !DILocation(line: 522, column: 45, scope: !2426)
!2430 = !DILocation(line: 522, column: 39, scope: !2426)
!2431 = !DILocation(line: 522, column: 6, scope: !2426)
!2432 = !DILocation(line: 522, column: 43, scope: !2426)
!2433 = !DILocation(line: 523, column: 5, scope: !2426)
!2434 = !DILocation(line: 524, column: 4, scope: !2407)
!2435 = !DILocation(line: 511, column: 47, scope: !2403)
!2436 = !DILocation(line: 511, column: 4, scope: !2403)
!2437 = distinct !{!2437, !2405, !2438, !1745}
!2438 = !DILocation(line: 524, column: 4, scope: !2400)
!2439 = !DILocation(line: 525, column: 3, scope: !2394)
!2440 = !DILocation(line: 526, column: 2, scope: !2387)
!2441 = !DILocation(line: 505, column: 61, scope: !2382)
!2442 = !DILocation(line: 505, column: 2, scope: !2382)
!2443 = distinct !{!2443, !2385, !2444, !1745}
!2444 = !DILocation(line: 526, column: 2, scope: !2379)
!2445 = !DILocation(line: 528, column: 6, scope: !2446)
!2446 = distinct !DILexicalBlock(scope: !2348, file: !24, line: 528, column: 6)
!2447 = !DILocation(line: 528, column: 26, scope: !2446)
!2448 = !DILocation(line: 530, column: 11, scope: !2449)
!2449 = distinct !DILexicalBlock(scope: !2450, file: !24, line: 530, column: 3)
!2450 = distinct !DILexicalBlock(scope: !2446, file: !24, line: 529, column: 2)
!2451 = !DILocation(line: 530, column: 8, scope: !2449)
!2452 = !DILocation(line: 530, column: 16, scope: !2453)
!2453 = distinct !DILexicalBlock(scope: !2449, file: !24, line: 530, column: 3)
!2454 = !DILocation(line: 530, column: 21, scope: !2453)
!2455 = !DILocation(line: 530, column: 19, scope: !2453)
!2456 = !DILocation(line: 530, column: 3, scope: !2449)
!2457 = !DILocalVariable(name: "vertnum", scope: !2458, file: !24, line: 532, type: !7)
!2458 = distinct !DILexicalBlock(scope: !2453, file: !24, line: 531, column: 3)
!2459 = !DILocation(line: 532, column: 8, scope: !2458)
!2460 = !DILocation(line: 534, column: 30, scope: !2458)
!2461 = !DILocation(line: 534, column: 14, scope: !2458)
!2462 = !DILocation(line: 534, column: 12, scope: !2458)
!2463 = !DILocation(line: 535, column: 4, scope: !2458)
!2464 = !DILocation(line: 0, scope: !2458)
!2465 = !DILocation(line: 536, column: 9, scope: !2466)
!2466 = distinct !DILexicalBlock(scope: !2458, file: !24, line: 536, column: 8)
!2467 = !DILocation(line: 536, column: 19, scope: !2466)
!2468 = !DILocation(line: 536, column: 17, scope: !2466)
!2469 = !DILocation(line: 536, column: 31, scope: !2466)
!2470 = !DILocation(line: 536, column: 8, scope: !2466)
!2471 = !DILocation(line: 537, column: 19, scope: !2466)
!2472 = !DILocation(line: 537, column: 5, scope: !2466)
!2473 = !DILocation(line: 537, column: 28, scope: !2466)
!2474 = !DILocation(line: 538, column: 3, scope: !2458)
!2475 = !DILocation(line: 530, column: 42, scope: !2453)
!2476 = !DILocation(line: 530, column: 3, scope: !2453)
!2477 = distinct !{!2477, !2456, !2478, !1745}
!2478 = !DILocation(line: 538, column: 3, scope: !2449)
!2479 = !DILocation(line: 539, column: 2, scope: !2450)
!2480 = !DILocation(line: 542, column: 13, scope: !2481)
!2481 = distinct !DILexicalBlock(scope: !2482, file: !24, line: 542, column: 3)
!2482 = distinct !DILexicalBlock(scope: !2446, file: !24, line: 541, column: 2)
!2483 = !DILocation(line: 542, column: 24, scope: !2481)
!2484 = !DILocation(line: 542, column: 11, scope: !2481)
!2485 = !DILocation(line: 542, column: 8, scope: !2481)
!2486 = !DILocation(line: 542, column: 29, scope: !2487)
!2487 = distinct !DILexicalBlock(scope: !2481, file: !24, line: 542, column: 3)
!2488 = !DILocation(line: 542, column: 34, scope: !2487)
!2489 = !DILocation(line: 542, column: 32, scope: !2487)
!2490 = !DILocation(line: 542, column: 3, scope: !2481)
!2491 = !DILocation(line: 544, column: 4, scope: !2492)
!2492 = distinct !DILexicalBlock(scope: !2487, file: !24, line: 543, column: 3)
!2493 = !DILocation(line: 0, scope: !2492)
!2494 = !DILocation(line: 545, column: 34, scope: !2492)
!2495 = !DILocation(line: 545, column: 18, scope: !2492)
!2496 = !DILocation(line: 545, column: 4, scope: !2492)
!2497 = !DILocation(line: 545, column: 39, scope: !2492)
!2498 = !DILocation(line: 546, column: 3, scope: !2492)
!2499 = !DILocation(line: 542, column: 56, scope: !2487)
!2500 = !DILocation(line: 542, column: 3, scope: !2487)
!2501 = distinct !{!2501, !2490, !2502, !1745}
!2502 = !DILocation(line: 546, column: 3, scope: !2481)
!2503 = !DILocation(line: 549, column: 26, scope: !2348)
!2504 = !DILocation(line: 549, column: 45, scope: !2348)
!2505 = !DILocation(line: 549, column: 2, scope: !2348)
!2506 = !DILocation(line: 551, column: 14, scope: !2507)
!2507 = distinct !DILexicalBlock(scope: !2348, file: !24, line: 551, column: 2)
!2508 = !DILocation(line: 551, column: 7, scope: !2507)
!2509 = !DILocation(line: 551, column: 19, scope: !2510)
!2510 = distinct !DILexicalBlock(scope: !2507, file: !24, line: 551, column: 2)
!2511 = !DILocation(line: 551, column: 29, scope: !2510)
!2512 = !DILocation(line: 551, column: 26, scope: !2510)
!2513 = !DILocation(line: 551, column: 2, scope: !2507)
!2514 = !DILocation(line: 552, column: 24, scope: !2510)
!2515 = !DILocation(line: 552, column: 3, scope: !2510)
!2516 = !DILocation(line: 552, column: 32, scope: !2510)
!2517 = !DILocation(line: 551, column: 57, scope: !2510)
!2518 = !DILocation(line: 551, column: 2, scope: !2510)
!2519 = distinct !{!2519, !2513, !2520, !1745}
!2520 = !DILocation(line: 552, column: 34, scope: !2507)
!2521 = !DILocation(line: 558, column: 18, scope: !2522)
!2522 = distinct !DILexicalBlock(scope: !2348, file: !24, line: 558, column: 2)
!2523 = !DILocation(line: 558, column: 7, scope: !2522)
!2524 = !DILocation(line: 558, column: 23, scope: !2525)
!2525 = distinct !DILexicalBlock(scope: !2522, file: !24, line: 558, column: 2)
!2526 = !DILocation(line: 558, column: 36, scope: !2525)
!2527 = !DILocation(line: 558, column: 34, scope: !2525)
!2528 = !DILocation(line: 558, column: 2, scope: !2522)
!2529 = !DILocalVariable(name: "segnum", scope: !2530, file: !24, line: 560, type: !7)
!2530 = distinct !DILexicalBlock(scope: !2525, file: !24, line: 559, column: 2)
!2531 = !DILocation(line: 560, column: 7, scope: !2530)
!2532 = !DILocation(line: 560, column: 28, scope: !2530)
!2533 = !DILocation(line: 560, column: 16, scope: !2530)
!2534 = !DILocation(line: 562, column: 21, scope: !2530)
!2535 = !DILocation(line: 562, column: 12, scope: !2530)
!2536 = !DILocation(line: 562, column: 29, scope: !2530)
!2537 = !DILocation(line: 562, column: 10, scope: !2530)
!2538 = !DILocation(line: 564, column: 3, scope: !2530)
!2539 = !DILocation(line: 564, column: 10, scope: !2530)
!2540 = !DILocation(line: 564, column: 17, scope: !2530)
!2541 = !DILocalVariable(name: "obj", scope: !2542, file: !24, line: 566, type: !55)
!2542 = distinct !DILexicalBlock(scope: !2530, file: !24, line: 565, column: 3)
!2543 = !DILocation(line: 566, column: 12, scope: !2542)
!2544 = !DILocation(line: 566, column: 27, scope: !2542)
!2545 = !DILocation(line: 566, column: 19, scope: !2542)
!2546 = !DILocalVariable(name: "objpos", scope: !2542, file: !24, line: 567, type: !1490)
!2547 = !DILocation(line: 567, column: 16, scope: !2542)
!2548 = !DILocation(line: 567, column: 26, scope: !2542)
!2549 = !DILocation(line: 567, column: 31, scope: !2542)
!2550 = !DILocalVariable(name: "obj_intensity", scope: !2542, file: !24, line: 568, type: !14)
!2551 = !DILocation(line: 568, column: 10, scope: !2542)
!2552 = !DILocation(line: 570, column: 44, scope: !2542)
!2553 = !DILocation(line: 570, column: 20, scope: !2542)
!2554 = !DILocation(line: 570, column: 18, scope: !2542)
!2555 = !DILocation(line: 572, column: 8, scope: !2556)
!2556 = distinct !DILexicalBlock(scope: !2542, file: !24, line: 572, column: 8)
!2557 = !DILocation(line: 574, column: 17, scope: !2558)
!2558 = distinct !DILexicalBlock(scope: !2556, file: !24, line: 573, column: 4)
!2559 = !DILocation(line: 574, column: 32, scope: !2558)
!2560 = !DILocation(line: 574, column: 37, scope: !2558)
!2561 = !DILocation(line: 574, column: 45, scope: !2558)
!2562 = !DILocation(line: 574, column: 53, scope: !2558)
!2563 = !DILocation(line: 574, column: 72, scope: !2558)
!2564 = !DILocation(line: 574, column: 89, scope: !2558)
!2565 = !DILocation(line: 574, column: 93, scope: !2558)
!2566 = !DILocation(line: 574, column: 5, scope: !2558)
!2567 = !DILocation(line: 575, column: 26, scope: !2558)
!2568 = !DILocation(line: 575, column: 5, scope: !2558)
!2569 = !DILocation(line: 575, column: 34, scope: !2558)
!2570 = !DILocation(line: 576, column: 4, scope: !2558)
!2571 = !DILocation(line: 578, column: 13, scope: !2542)
!2572 = !DILocation(line: 578, column: 18, scope: !2542)
!2573 = !DILocation(line: 578, column: 11, scope: !2542)
!2574 = distinct !{!2574, !2538, !2575, !1745}
!2575 = !DILocation(line: 579, column: 3, scope: !2530)
!2576 = !DILocation(line: 580, column: 2, scope: !2530)
!2577 = !DILocation(line: 558, column: 61, scope: !2525)
!2578 = !DILocation(line: 558, column: 2, scope: !2525)
!2579 = distinct !{!2579, !2528, !2580, !1745}
!2580 = !DILocation(line: 580, column: 2, scope: !2522)
!2581 = !DILocation(line: 583, column: 14, scope: !2582)
!2582 = distinct !DILexicalBlock(scope: !2348, file: !24, line: 583, column: 2)
!2583 = !DILocation(line: 583, column: 7, scope: !2582)
!2584 = !DILocation(line: 583, column: 19, scope: !2585)
!2585 = distinct !DILexicalBlock(scope: !2582, file: !24, line: 583, column: 2)
!2586 = !DILocation(line: 583, column: 29, scope: !2585)
!2587 = !DILocation(line: 583, column: 26, scope: !2585)
!2588 = !DILocation(line: 583, column: 2, scope: !2582)
!2589 = !DILocation(line: 586, column: 25, scope: !2590)
!2590 = distinct !DILexicalBlock(scope: !2591, file: !24, line: 586, column: 7)
!2591 = distinct !DILexicalBlock(scope: !2585, file: !24, line: 584, column: 2)
!2592 = !DILocation(line: 586, column: 8, scope: !2590)
!2593 = !DILocation(line: 586, column: 7, scope: !2590)
!2594 = !DILocation(line: 586, column: 34, scope: !2590)
!2595 = !DILocation(line: 586, column: 39, scope: !2590)
!2596 = !DILocation(line: 586, column: 49, scope: !2590)
!2597 = !DILocation(line: 586, column: 38, scope: !2590)
!2598 = !DILocation(line: 586, column: 61, scope: !2590)
!2599 = !DILocation(line: 586, column: 67, scope: !2590)
!2600 = !DILocation(line: 586, column: 76, scope: !2590)
!2601 = !DILocation(line: 586, column: 74, scope: !2590)
!2602 = !DILocation(line: 586, column: 88, scope: !2590)
!2603 = !DILocation(line: 586, column: 93, scope: !2590)
!2604 = !DILocation(line: 588, column: 30, scope: !2605)
!2605 = distinct !DILexicalBlock(scope: !2606, file: !24, line: 588, column: 8)
!2606 = distinct !DILexicalBlock(scope: !2590, file: !24, line: 587, column: 3)
!2607 = !DILocation(line: 588, column: 9, scope: !2605)
!2608 = !DILocation(line: 588, column: 8, scope: !2605)
!2609 = !DILocalVariable(name: "obj", scope: !2610, file: !24, line: 591, type: !55)
!2610 = distinct !DILexicalBlock(scope: !2605, file: !24, line: 589, column: 4)
!2611 = !DILocation(line: 591, column: 13, scope: !2610)
!2612 = !DILocation(line: 591, column: 28, scope: !2610)
!2613 = !DILocation(line: 591, column: 20, scope: !2610)
!2614 = !DILocalVariable(name: "objpos", scope: !2610, file: !24, line: 592, type: !1490)
!2615 = !DILocation(line: 592, column: 17, scope: !2610)
!2616 = !DILocation(line: 592, column: 27, scope: !2610)
!2617 = !DILocation(line: 592, column: 32, scope: !2610)
!2618 = !DILocalVariable(name: "obj_intensity", scope: !2610, file: !24, line: 593, type: !14)
!2619 = !DILocation(line: 593, column: 11, scope: !2610)
!2620 = !DILocation(line: 595, column: 45, scope: !2610)
!2621 = !DILocation(line: 595, column: 21, scope: !2610)
!2622 = !DILocation(line: 595, column: 19, scope: !2610)
!2623 = !DILocation(line: 597, column: 9, scope: !2624)
!2624 = distinct !DILexicalBlock(scope: !2610, file: !24, line: 597, column: 9)
!2625 = !DILocation(line: 599, column: 18, scope: !2626)
!2626 = distinct !DILexicalBlock(scope: !2624, file: !24, line: 598, column: 5)
!2627 = !DILocation(line: 599, column: 33, scope: !2626)
!2628 = !DILocation(line: 599, column: 38, scope: !2626)
!2629 = !DILocation(line: 599, column: 46, scope: !2626)
!2630 = !DILocation(line: 599, column: 54, scope: !2626)
!2631 = !DILocation(line: 599, column: 73, scope: !2626)
!2632 = !DILocation(line: 599, column: 90, scope: !2626)
!2633 = !DILocation(line: 599, column: 6, scope: !2626)
!2634 = !DILocation(line: 600, column: 23, scope: !2626)
!2635 = !DILocation(line: 600, column: 6, scope: !2626)
!2636 = !DILocation(line: 600, column: 31, scope: !2626)
!2637 = !DILocation(line: 601, column: 5, scope: !2626)
!2638 = !DILocation(line: 603, column: 23, scope: !2624)
!2639 = !DILocation(line: 603, column: 6, scope: !2624)
!2640 = !DILocation(line: 603, column: 31, scope: !2624)
!2641 = !DILocation(line: 604, column: 4, scope: !2610)
!2642 = !DILocation(line: 605, column: 3, scope: !2606)
!2643 = !DILocation(line: 610, column: 52, scope: !2644)
!2644 = distinct !DILexicalBlock(scope: !2590, file: !24, line: 607, column: 3)
!2645 = !DILocation(line: 610, column: 31, scope: !2644)
!2646 = !DILocation(line: 610, column: 21, scope: !2644)
!2647 = !DILocation(line: 610, column: 4, scope: !2644)
!2648 = !DILocation(line: 610, column: 29, scope: !2644)
!2649 = !DILocation(line: 612, column: 2, scope: !2591)
!2650 = !DILocation(line: 583, column: 57, scope: !2585)
!2651 = !DILocation(line: 583, column: 2, scope: !2585)
!2652 = distinct !{!2652, !2588, !2653, !1745}
!2653 = !DILocation(line: 612, column: 2, scope: !2582)
!2654 = !DILocation(line: 613, column: 1, scope: !2348)
!2655 = distinct !DISubprogram(name: "toggle_headlight_active", linkageName: "_Z23toggle_headlight_activev", scope: !24, file: !24, line: 617, type: !1249, scopeLine: 618, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2)
!2656 = !DILocation(line: 619, column: 14, scope: !2657)
!2657 = distinct !DILexicalBlock(scope: !2655, file: !24, line: 619, column: 6)
!2658 = !DILocation(line: 619, column: 6, scope: !2657)
!2659 = !DILocation(line: 619, column: 26, scope: !2657)
!2660 = !DILocation(line: 619, column: 32, scope: !2657)
!2661 = !DILocation(line: 621, column: 11, scope: !2662)
!2662 = distinct !DILexicalBlock(scope: !2657, file: !24, line: 620, column: 2)
!2663 = !DILocation(line: 621, column: 3, scope: !2662)
!2664 = !DILocation(line: 621, column: 23, scope: !2662)
!2665 = !DILocation(line: 621, column: 29, scope: !2662)
!2666 = !DILocation(line: 626, column: 2, scope: !2662)
!2667 = !DILocation(line: 627, column: 1, scope: !2655)
!2668 = distinct !DISubprogram(name: "compute_headlight_light_on_object", linkageName: "_Z33compute_headlight_light_on_objectP6object", scope: !24, file: !24, line: 636, type: !2669, scopeLine: 637, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1491)
!2669 = !DISubroutineType(types: !2670)
!2670 = !{!14, !55}
!2671 = !DILocalVariable(name: "objp", arg: 1, scope: !2668, file: !24, line: 636, type: !55)
!2672 = !DILocation(line: 636, column: 48, scope: !2668)
!2673 = !DILocalVariable(name: "i", scope: !2668, file: !24, line: 638, type: !7)
!2674 = !DILocation(line: 638, column: 6, scope: !2668)
!2675 = !DILocalVariable(name: "light", scope: !2668, file: !24, line: 639, type: !14)
!2676 = !DILocation(line: 639, column: 6, scope: !2668)
!2677 = !DILocation(line: 642, column: 7, scope: !2678)
!2678 = distinct !DILexicalBlock(scope: !2668, file: !24, line: 642, column: 6)
!2679 = !DILocation(line: 642, column: 13, scope: !2678)
!2680 = !DILocation(line: 642, column: 18, scope: !2678)
!2681 = !DILocation(line: 642, column: 32, scope: !2678)
!2682 = !DILocation(line: 642, column: 36, scope: !2678)
!2683 = !DILocation(line: 642, column: 42, scope: !2678)
!2684 = !DILocation(line: 642, column: 47, scope: !2678)
!2685 = !DILocation(line: 643, column: 3, scope: !2678)
!2686 = !DILocation(line: 645, column: 8, scope: !2668)
!2687 = !DILocation(line: 647, column: 9, scope: !2688)
!2688 = distinct !DILexicalBlock(scope: !2668, file: !24, line: 647, column: 2)
!2689 = !DILocation(line: 647, column: 7, scope: !2688)
!2690 = !DILocation(line: 647, column: 14, scope: !2691)
!2691 = distinct !DILexicalBlock(scope: !2688, file: !24, line: 647, column: 2)
!2692 = !DILocation(line: 647, column: 18, scope: !2691)
!2693 = !DILocation(line: 647, column: 16, scope: !2691)
!2694 = !DILocation(line: 647, column: 2, scope: !2688)
!2695 = !DILocalVariable(name: "dot", scope: !2696, file: !24, line: 649, type: !14)
!2696 = distinct !DILexicalBlock(scope: !2691, file: !24, line: 648, column: 2)
!2697 = !DILocation(line: 649, column: 9, scope: !2696)
!2698 = !DILocalVariable(name: "dist", scope: !2696, file: !24, line: 649, type: !14)
!2699 = !DILocation(line: 649, column: 14, scope: !2696)
!2700 = !DILocalVariable(name: "vec_to_obj", scope: !2696, file: !24, line: 650, type: !76)
!2701 = !DILocation(line: 650, column: 14, scope: !2696)
!2702 = !DILocalVariable(name: "light_objp", scope: !2696, file: !24, line: 651, type: !55)
!2703 = !DILocation(line: 651, column: 11, scope: !2696)
!2704 = !DILocation(line: 653, column: 27, scope: !2696)
!2705 = !DILocation(line: 653, column: 16, scope: !2696)
!2706 = !DILocation(line: 653, column: 14, scope: !2696)
!2707 = !DILocation(line: 655, column: 28, scope: !2696)
!2708 = !DILocation(line: 655, column: 34, scope: !2696)
!2709 = !DILocation(line: 655, column: 40, scope: !2696)
!2710 = !DILocation(line: 655, column: 52, scope: !2696)
!2711 = !DILocation(line: 655, column: 3, scope: !2696)
!2712 = !DILocation(line: 656, column: 10, scope: !2696)
!2713 = !DILocation(line: 656, column: 8, scope: !2696)
!2714 = !DILocation(line: 657, column: 7, scope: !2715)
!2715 = distinct !DILexicalBlock(scope: !2696, file: !24, line: 657, column: 7)
!2716 = !DILocation(line: 657, column: 12, scope: !2715)
!2717 = !DILocation(line: 659, column: 10, scope: !2718)
!2718 = distinct !DILexicalBlock(scope: !2715, file: !24, line: 658, column: 3)
!2719 = !DILocation(line: 659, column: 8, scope: !2718)
!2720 = !DILocation(line: 661, column: 8, scope: !2721)
!2721 = distinct !DILexicalBlock(scope: !2718, file: !24, line: 661, column: 8)
!2722 = !DILocation(line: 661, column: 12, scope: !2721)
!2723 = !DILocation(line: 662, column: 62, scope: !2721)
!2724 = !DILocation(line: 662, column: 38, scope: !2721)
!2725 = !DILocation(line: 662, column: 14, scope: !2721)
!2726 = !DILocation(line: 662, column: 11, scope: !2721)
!2727 = !DILocation(line: 662, column: 5, scope: !2721)
!2728 = !DILocation(line: 664, column: 28, scope: !2721)
!2729 = !DILocation(line: 664, column: 33, scope: !2721)
!2730 = !DILocation(line: 664, column: 21, scope: !2721)
!2731 = !DILocation(line: 664, column: 14, scope: !2721)
!2732 = !DILocation(line: 664, column: 56, scope: !2721)
!2733 = !DILocation(line: 664, column: 11, scope: !2721)
!2734 = !DILocation(line: 665, column: 3, scope: !2718)
!2735 = !DILocation(line: 666, column: 2, scope: !2696)
!2736 = !DILocation(line: 647, column: 35, scope: !2691)
!2737 = !DILocation(line: 647, column: 2, scope: !2691)
!2738 = distinct !{!2738, !2694, !2739, !1745}
!2739 = !DILocation(line: 666, column: 2, scope: !2688)
!2740 = !DILocation(line: 668, column: 9, scope: !2668)
!2741 = !DILocation(line: 668, column: 2, scope: !2668)
!2742 = !DILocation(line: 669, column: 1, scope: !2668)
!2743 = distinct !DISubprogram(name: "compute_seg_dynamic_light", linkageName: "_Z25compute_seg_dynamic_lighti", scope: !24, file: !24, line: 672, type: !2092, scopeLine: 673, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1491)
!2744 = !DILocalVariable(name: "segnum", arg: 1, scope: !2743, file: !24, line: 672, type: !7)
!2745 = !DILocation(line: 672, column: 35, scope: !2743)
!2746 = !DILocalVariable(name: "sum", scope: !2743, file: !24, line: 674, type: !14)
!2747 = !DILocation(line: 674, column: 6, scope: !2743)
!2748 = !DILocalVariable(name: "seg", scope: !2743, file: !24, line: 675, type: !2749)
!2749 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2750, size: 64)
!2750 = !DIDerivedType(tag: DW_TAG_typedef, name: "segment", file: !2751, line: 123, baseType: !2752)
!2751 = !DIFile(filename: "main_d2/segment.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "c950815a9b07e6bab2fa2587b90affec")
!2752 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "segment", file: !2751, line: 100, size: 4096, flags: DIFlagTypePassByValue, elements: !2753, identifier: "_ZTS7segment")
!2753 = !{!2754, !2780, !2782, !2784}
!2754 = !DIDerivedType(tag: DW_TAG_member, name: "sides", scope: !2752, file: !2751, line: 105, baseType: !2755, size: 3840)
!2755 = !DICompositeType(tag: DW_TAG_array_type, baseType: !2756, size: 3840, elements: !2778)
!2756 = !DIDerivedType(tag: DW_TAG_typedef, name: "side", file: !2751, line: 91, baseType: !2757)
!2757 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "side", file: !2751, line: 82, size: 640, flags: DIFlagTypePassByValue, elements: !2758, identifier: "_ZTS4side")
!2758 = !{!2759, !2760, !2761, !2762, !2763, !2764, !2774}
!2759 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !2757, file: !2751, line: 84, baseType: !47, size: 8)
!2760 = !DIDerivedType(tag: DW_TAG_member, name: "pad", scope: !2757, file: !2751, line: 85, baseType: !62, size: 8, offset: 8)
!2761 = !DIDerivedType(tag: DW_TAG_member, name: "wall_num", scope: !2757, file: !2751, line: 86, baseType: !67, size: 16, offset: 16)
!2762 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_num", scope: !2757, file: !2751, line: 87, baseType: !67, size: 16, offset: 32)
!2763 = !DIDerivedType(tag: DW_TAG_member, name: "tmap_num2", scope: !2757, file: !2751, line: 88, baseType: !67, size: 16, offset: 48)
!2764 = !DIDerivedType(tag: DW_TAG_member, name: "uvls", scope: !2757, file: !2751, line: 89, baseType: !2765, size: 384, offset: 64)
!2765 = !DICompositeType(tag: DW_TAG_array_type, baseType: !2766, size: 384, elements: !2772)
!2766 = !DIDerivedType(tag: DW_TAG_typedef, name: "uvl", file: !2751, line: 67, baseType: !2767)
!2767 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uvl", file: !2751, line: 64, size: 96, flags: DIFlagTypePassByValue, elements: !2768, identifier: "_ZTS3uvl")
!2768 = !{!2769, !2770, !2771}
!2769 = !DIDerivedType(tag: DW_TAG_member, name: "u", scope: !2767, file: !2751, line: 66, baseType: !14, size: 32)
!2770 = !DIDerivedType(tag: DW_TAG_member, name: "v", scope: !2767, file: !2751, line: 66, baseType: !14, size: 32, offset: 32)
!2771 = !DIDerivedType(tag: DW_TAG_member, name: "l", scope: !2767, file: !2751, line: 66, baseType: !14, size: 32, offset: 64)
!2772 = !{!2773}
!2773 = !DISubrange(count: 4)
!2774 = !DIDerivedType(tag: DW_TAG_member, name: "normals", scope: !2757, file: !2751, line: 90, baseType: !2775, size: 192, offset: 448)
!2775 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 192, elements: !2776)
!2776 = !{!2777}
!2777 = !DISubrange(count: 2)
!2778 = !{!2779}
!2779 = !DISubrange(count: 6)
!2780 = !DIDerivedType(tag: DW_TAG_member, name: "children", scope: !2752, file: !2751, line: 106, baseType: !2781, size: 96, offset: 3840)
!2781 = !DICompositeType(tag: DW_TAG_array_type, baseType: !67, size: 96, elements: !2778)
!2782 = !DIDerivedType(tag: DW_TAG_member, name: "verts", scope: !2752, file: !2751, line: 107, baseType: !2783, size: 128, offset: 3936)
!2783 = !DICompositeType(tag: DW_TAG_array_type, baseType: !67, size: 128, elements: !201)
!2784 = !DIDerivedType(tag: DW_TAG_member, name: "objects", scope: !2752, file: !2751, line: 112, baseType: !7, size: 32, offset: 4064)
!2785 = !DILocation(line: 675, column: 11, scope: !2743)
!2786 = !DILocalVariable(name: "verts", scope: !2743, file: !24, line: 676, type: !1647)
!2787 = !DILocation(line: 676, column: 9, scope: !2743)
!2788 = !DILocation(line: 678, column: 18, scope: !2743)
!2789 = !DILocation(line: 678, column: 9, scope: !2743)
!2790 = !DILocation(line: 678, column: 6, scope: !2743)
!2791 = !DILocation(line: 680, column: 10, scope: !2743)
!2792 = !DILocation(line: 680, column: 15, scope: !2743)
!2793 = !DILocation(line: 680, column: 8, scope: !2743)
!2794 = !DILocation(line: 681, column: 6, scope: !2743)
!2795 = !DILocation(line: 683, column: 29, scope: !2743)
!2796 = !DILocation(line: 683, column: 23, scope: !2743)
!2797 = !DILocation(line: 683, column: 9, scope: !2743)
!2798 = !DILocation(line: 683, column: 6, scope: !2743)
!2799 = !DILocation(line: 684, column: 29, scope: !2743)
!2800 = !DILocation(line: 684, column: 23, scope: !2743)
!2801 = !DILocation(line: 684, column: 9, scope: !2743)
!2802 = !DILocation(line: 684, column: 6, scope: !2743)
!2803 = !DILocation(line: 685, column: 29, scope: !2743)
!2804 = !DILocation(line: 685, column: 23, scope: !2743)
!2805 = !DILocation(line: 685, column: 9, scope: !2743)
!2806 = !DILocation(line: 685, column: 6, scope: !2743)
!2807 = !DILocation(line: 686, column: 29, scope: !2743)
!2808 = !DILocation(line: 686, column: 23, scope: !2743)
!2809 = !DILocation(line: 686, column: 9, scope: !2743)
!2810 = !DILocation(line: 686, column: 6, scope: !2743)
!2811 = !DILocation(line: 687, column: 29, scope: !2743)
!2812 = !DILocation(line: 687, column: 23, scope: !2743)
!2813 = !DILocation(line: 687, column: 9, scope: !2743)
!2814 = !DILocation(line: 687, column: 6, scope: !2743)
!2815 = !DILocation(line: 688, column: 29, scope: !2743)
!2816 = !DILocation(line: 688, column: 23, scope: !2743)
!2817 = !DILocation(line: 688, column: 9, scope: !2743)
!2818 = !DILocation(line: 688, column: 6, scope: !2743)
!2819 = !DILocation(line: 689, column: 29, scope: !2743)
!2820 = !DILocation(line: 689, column: 23, scope: !2743)
!2821 = !DILocation(line: 689, column: 9, scope: !2743)
!2822 = !DILocation(line: 689, column: 6, scope: !2743)
!2823 = !DILocation(line: 690, column: 24, scope: !2743)
!2824 = !DILocation(line: 690, column: 23, scope: !2743)
!2825 = !DILocation(line: 690, column: 9, scope: !2743)
!2826 = !DILocation(line: 690, column: 6, scope: !2743)
!2827 = !DILocation(line: 692, column: 9, scope: !2743)
!2828 = !DILocation(line: 692, column: 13, scope: !2743)
!2829 = !DILocation(line: 692, column: 2, scope: !2743)
!2830 = distinct !DISubprogram(name: "start_lighting_frame", linkageName: "_Z20start_lighting_frameP6object", scope: !24, file: !24, line: 702, type: !2831, scopeLine: 703, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1491)
!2831 = !DISubroutineType(types: !2832)
!2832 = !{null, !55}
!2833 = !DILocalVariable(name: "viewer", arg: 1, scope: !2830, file: !24, line: 702, type: !55)
!2834 = !DILocation(line: 702, column: 35, scope: !2830)
!2835 = !DILocation(line: 704, column: 25, scope: !2830)
!2836 = !DILocation(line: 704, column: 35, scope: !2830)
!2837 = !DILocation(line: 704, column: 32, scope: !2830)
!2838 = !DILocation(line: 704, column: 24, scope: !2830)
!2839 = !DILocation(line: 704, column: 22, scope: !2830)
!2840 = !DILocation(line: 705, column: 15, scope: !2830)
!2841 = !DILocation(line: 705, column: 13, scope: !2830)
!2842 = !DILocation(line: 706, column: 1, scope: !2830)
!2843 = distinct !DISubprogram(name: "compute_object_light", linkageName: "_Z20compute_object_lightP6objectP10vms_vector", scope: !24, file: !24, line: 711, type: !2844, scopeLine: 712, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1491)
!2844 = !DISubroutineType(types: !2845)
!2845 = !{!14, !55, !1490}
!2846 = !DILocalVariable(name: "obj", arg: 1, scope: !2843, file: !24, line: 711, type: !55)
!2847 = !DILocation(line: 711, column: 34, scope: !2843)
!2848 = !DILocalVariable(name: "rotated_pnt", arg: 2, scope: !2843, file: !24, line: 711, type: !1490)
!2849 = !DILocation(line: 711, column: 51, scope: !2843)
!2850 = !DILocalVariable(name: "light", scope: !2843, file: !24, line: 740, type: !14)
!2851 = !DILocation(line: 740, column: 6, scope: !2843)
!2852 = !DILocalVariable(name: "objpnt", scope: !2843, file: !24, line: 741, type: !2853)
!2853 = !DIDerivedType(tag: DW_TAG_typedef, name: "g3s_point", file: !2854, line: 60, baseType: !2855)
!2854 = !DIFile(filename: "./3d/3d.h", directory: "/Users/richard/code/ChocolateDescent", checksumkind: CSK_MD5, checksum: "d7c16e2714919aab8d5cba546ae3eeb2")
!2855 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "g3s_point", file: !2854, line: 52, size: 288, flags: DIFlagTypePassByValue, elements: !2856, identifier: "_ZTS9g3s_point")
!2856 = !{!2857, !2858, !2859, !2860, !2861, !2862, !2863, !2864, !2865}
!2857 = !DIDerivedType(tag: DW_TAG_member, name: "p3_vec", scope: !2855, file: !2854, line: 54, baseType: !76, size: 96)
!2858 = !DIDerivedType(tag: DW_TAG_member, name: "p3_u", scope: !2855, file: !2854, line: 55, baseType: !14, size: 32, offset: 96)
!2859 = !DIDerivedType(tag: DW_TAG_member, name: "p3_v", scope: !2855, file: !2854, line: 55, baseType: !14, size: 32, offset: 128)
!2860 = !DIDerivedType(tag: DW_TAG_member, name: "p3_l", scope: !2855, file: !2854, line: 55, baseType: !14, size: 32, offset: 160)
!2861 = !DIDerivedType(tag: DW_TAG_member, name: "p3_sx", scope: !2855, file: !2854, line: 56, baseType: !14, size: 32, offset: 192)
!2862 = !DIDerivedType(tag: DW_TAG_member, name: "p3_sy", scope: !2855, file: !2854, line: 56, baseType: !14, size: 32, offset: 224)
!2863 = !DIDerivedType(tag: DW_TAG_member, name: "p3_codes", scope: !2855, file: !2854, line: 57, baseType: !62, size: 8, offset: 256)
!2864 = !DIDerivedType(tag: DW_TAG_member, name: "p3_flags", scope: !2855, file: !2854, line: 58, baseType: !62, size: 8, offset: 264)
!2865 = !DIDerivedType(tag: DW_TAG_member, name: "p3_pad", scope: !2855, file: !2854, line: 59, baseType: !67, size: 16, offset: 272)
!2866 = !DILocation(line: 741, column: 12, scope: !2843)
!2867 = !DILocalVariable(name: "objnum", scope: !2843, file: !24, line: 742, type: !7)
!2868 = !DILocation(line: 742, column: 6, scope: !2843)
!2869 = !DILocation(line: 742, column: 15, scope: !2843)
!2870 = !DILocation(line: 742, column: 19, scope: !2843)
!2871 = !DILocation(line: 744, column: 7, scope: !2872)
!2872 = distinct !DILexicalBlock(scope: !2843, file: !24, line: 744, column: 6)
!2873 = !DILocation(line: 744, column: 6, scope: !2872)
!2874 = !DILocation(line: 746, column: 29, scope: !2875)
!2875 = distinct !DILexicalBlock(scope: !2872, file: !24, line: 745, column: 2)
!2876 = !DILocation(line: 746, column: 34, scope: !2875)
!2877 = !DILocation(line: 746, column: 3, scope: !2875)
!2878 = !DILocation(line: 747, column: 25, scope: !2875)
!2879 = !DILocation(line: 747, column: 15, scope: !2875)
!2880 = !DILocation(line: 748, column: 2, scope: !2875)
!2881 = !DILocation(line: 751, column: 20, scope: !2843)
!2882 = !DILocation(line: 751, column: 25, scope: !2843)
!2883 = !DILocation(line: 751, column: 10, scope: !2843)
!2884 = !DILocation(line: 751, column: 33, scope: !2843)
!2885 = !DILocation(line: 751, column: 8, scope: !2843)
!2886 = !DILocation(line: 756, column: 7, scope: !2887)
!2887 = distinct !DILexicalBlock(scope: !2843, file: !24, line: 756, column: 6)
!2888 = !DILocation(line: 756, column: 27, scope: !2887)
!2889 = !DILocation(line: 756, column: 41, scope: !2887)
!2890 = !DILocation(line: 756, column: 30, scope: !2887)
!2891 = !DILocation(line: 756, column: 52, scope: !2887)
!2892 = !DILocation(line: 756, column: 57, scope: !2887)
!2893 = !DILocation(line: 756, column: 49, scope: !2887)
!2894 = !DILocalVariable(name: "delta_light", scope: !2895, file: !24, line: 758, type: !14)
!2895 = distinct !DILexicalBlock(scope: !2887, file: !24, line: 757, column: 2)
!2896 = !DILocation(line: 758, column: 7, scope: !2895)
!2897 = !DILocalVariable(name: "frame_delta", scope: !2895, file: !24, line: 758, type: !14)
!2898 = !DILocation(line: 758, column: 20, scope: !2895)
!2899 = !DILocation(line: 760, column: 17, scope: !2895)
!2900 = !DILocation(line: 760, column: 38, scope: !2895)
!2901 = !DILocation(line: 760, column: 25, scope: !2895)
!2902 = !DILocation(line: 760, column: 23, scope: !2895)
!2903 = !DILocation(line: 760, column: 15, scope: !2895)
!2904 = !DILocation(line: 761, column: 24, scope: !2895)
!2905 = !DILocation(line: 761, column: 36, scope: !2895)
!2906 = !DILocation(line: 761, column: 17, scope: !2895)
!2907 = !DILocation(line: 761, column: 15, scope: !2895)
!2908 = !DILocation(line: 762, column: 11, scope: !2909)
!2909 = distinct !DILexicalBlock(scope: !2895, file: !24, line: 762, column: 7)
!2910 = !DILocation(line: 762, column: 7, scope: !2909)
!2911 = !DILocation(line: 762, column: 27, scope: !2909)
!2912 = !DILocation(line: 762, column: 24, scope: !2909)
!2913 = !DILocation(line: 763, column: 27, scope: !2909)
!2914 = !DILocation(line: 763, column: 17, scope: !2909)
!2915 = !DILocation(line: 763, column: 4, scope: !2909)
!2916 = !DILocation(line: 763, column: 25, scope: !2909)
!2917 = !DILocation(line: 765, column: 8, scope: !2918)
!2918 = distinct !DILexicalBlock(scope: !2909, file: !24, line: 765, column: 8)
!2919 = !DILocation(line: 765, column: 20, scope: !2918)
!2920 = !DILocation(line: 766, column: 37, scope: !2918)
!2921 = !DILocation(line: 766, column: 26, scope: !2918)
!2922 = !DILocation(line: 766, column: 13, scope: !2918)
!2923 = !DILocation(line: 766, column: 34, scope: !2918)
!2924 = !DILocation(line: 766, column: 11, scope: !2918)
!2925 = !DILocation(line: 766, column: 5, scope: !2918)
!2926 = !DILocation(line: 768, column: 37, scope: !2918)
!2927 = !DILocation(line: 768, column: 26, scope: !2918)
!2928 = !DILocation(line: 768, column: 13, scope: !2918)
!2929 = !DILocation(line: 768, column: 34, scope: !2918)
!2930 = !DILocation(line: 768, column: 11, scope: !2918)
!2931 = !DILocation(line: 769, column: 2, scope: !2895)
!2932 = !DILocation(line: 772, column: 24, scope: !2933)
!2933 = distinct !DILexicalBlock(scope: !2887, file: !24, line: 771, column: 2)
!2934 = !DILocation(line: 772, column: 29, scope: !2933)
!2935 = !DILocation(line: 772, column: 14, scope: !2933)
!2936 = !DILocation(line: 772, column: 3, scope: !2933)
!2937 = !DILocation(line: 772, column: 22, scope: !2933)
!2938 = !DILocation(line: 773, column: 26, scope: !2933)
!2939 = !DILocation(line: 773, column: 16, scope: !2933)
!2940 = !DILocation(line: 773, column: 3, scope: !2933)
!2941 = !DILocation(line: 773, column: 24, scope: !2933)
!2942 = !DILocation(line: 778, column: 6, scope: !2943)
!2943 = distinct !DILexicalBlock(scope: !2843, file: !24, line: 778, column: 6)
!2944 = !DILocation(line: 778, column: 26, scope: !2943)
!2945 = !DILocation(line: 779, column: 46, scope: !2943)
!2946 = !DILocation(line: 779, column: 12, scope: !2943)
!2947 = !DILocation(line: 779, column: 9, scope: !2943)
!2948 = !DILocation(line: 779, column: 3, scope: !2943)
!2949 = !DILocation(line: 781, column: 36, scope: !2943)
!2950 = !DILocation(line: 781, column: 12, scope: !2943)
!2951 = !DILocation(line: 781, column: 9, scope: !2943)
!2952 = !DILocation(line: 785, column: 37, scope: !2843)
!2953 = !DILocation(line: 785, column: 42, scope: !2843)
!2954 = !DILocation(line: 785, column: 11, scope: !2843)
!2955 = !DILocation(line: 785, column: 8, scope: !2843)
!2956 = !DILocation(line: 787, column: 9, scope: !2843)
!2957 = !DILocation(line: 787, column: 2, scope: !2843)
!2958 = distinct !DISubprogram(name: "compute_headlight_light", linkageName: "_Z23compute_headlight_lightP10vms_vectori", scope: !24, file: !24, line: 799, type: !2959, scopeLine: 800, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !1491)
!2959 = !DISubroutineType(types: !2960)
!2960 = !{!14, !1490, !14}
!2961 = !DILocalVariable(name: "point", arg: 1, scope: !2958, file: !24, line: 799, type: !1490)
!2962 = !DILocation(line: 799, column: 41, scope: !2958)
!2963 = !DILocalVariable(name: "face_light", arg: 2, scope: !2958, file: !24, line: 799, type: !14)
!2964 = !DILocation(line: 799, column: 52, scope: !2958)
!2965 = !DILocalVariable(name: "light", scope: !2958, file: !24, line: 808, type: !14)
!2966 = !DILocation(line: 808, column: 6, scope: !2958)
!2967 = !DILocalVariable(name: "use_beam", scope: !2958, file: !24, line: 809, type: !7)
!2968 = !DILocation(line: 809, column: 6, scope: !2958)
!2969 = !DILocation(line: 811, column: 10, scope: !2958)
!2970 = !DILocation(line: 811, column: 8, scope: !2958)
!2971 = !DILocation(line: 813, column: 15, scope: !2972)
!2972 = distinct !DILexicalBlock(scope: !2958, file: !24, line: 813, column: 6)
!2973 = !DILocation(line: 813, column: 7, scope: !2972)
!2974 = !DILocation(line: 813, column: 27, scope: !2972)
!2975 = !DILocation(line: 813, column: 33, scope: !2972)
!2976 = !DILocation(line: 813, column: 6, scope: !2972)
!2977 = !DILocation(line: 813, column: 59, scope: !2972)
!2978 = !DILocation(line: 813, column: 71, scope: !2972)
!2979 = !DILocation(line: 813, column: 63, scope: !2972)
!2980 = !DILocation(line: 813, column: 83, scope: !2972)
!2981 = !DILocation(line: 813, column: 89, scope: !2972)
!2982 = !DILocation(line: 813, column: 62, scope: !2972)
!2983 = !DILocation(line: 813, column: 118, scope: !2972)
!2984 = !DILocation(line: 813, column: 121, scope: !2972)
!2985 = !DILocation(line: 813, column: 148, scope: !2972)
!2986 = !DILocation(line: 813, column: 140, scope: !2972)
!2987 = !DILocation(line: 813, column: 160, scope: !2972)
!2988 = !DILocation(line: 813, column: 132, scope: !2972)
!2989 = !DILocation(line: 813, column: 128, scope: !2972)
!2990 = !DILocation(line: 813, column: 168, scope: !2972)
!2991 = !DILocation(line: 813, column: 179, scope: !2972)
!2992 = !DILocation(line: 813, column: 171, scope: !2972)
!2993 = !DILocation(line: 813, column: 191, scope: !2972)
!2994 = !DILocation(line: 813, column: 198, scope: !2972)
!2995 = !DILocation(line: 815, column: 9, scope: !2996)
!2996 = distinct !DILexicalBlock(scope: !2972, file: !24, line: 814, column: 2)
!2997 = !DILocation(line: 816, column: 12, scope: !2996)
!2998 = !DILocation(line: 817, column: 2, scope: !2996)
!2999 = !DILocation(line: 819, column: 6, scope: !3000)
!3000 = distinct !DILexicalBlock(scope: !2958, file: !24, line: 819, column: 6)
!3001 = !DILocalVariable(name: "point_dist", scope: !3002, file: !24, line: 821, type: !14)
!3002 = distinct !DILexicalBlock(scope: !3000, file: !24, line: 820, column: 2)
!3003 = !DILocation(line: 821, column: 7, scope: !3002)
!3004 = !DILocation(line: 823, column: 33, scope: !3002)
!3005 = !DILocation(line: 823, column: 16, scope: !3002)
!3006 = !DILocation(line: 823, column: 14, scope: !3002)
!3007 = !DILocation(line: 825, column: 7, scope: !3008)
!3008 = distinct !DILexicalBlock(scope: !3002, file: !24, line: 825, column: 7)
!3009 = !DILocation(line: 825, column: 18, scope: !3008)
!3010 = !DILocation(line: 827, column: 10, scope: !3008)
!3011 = !DILocation(line: 827, column: 4, scope: !3008)
!3012 = !DILocalVariable(name: "dist_scale", scope: !3013, file: !24, line: 831, type: !14)
!3013 = distinct !DILexicalBlock(scope: !3008, file: !24, line: 830, column: 3)
!3014 = !DILocation(line: 831, column: 8, scope: !3013)
!3015 = !DILocalVariable(name: "face_scale", scope: !3013, file: !24, line: 831, type: !14)
!3016 = !DILocation(line: 831, column: 20, scope: !3013)
!3017 = !DILocation(line: 833, column: 29, scope: !3013)
!3018 = !DILocation(line: 833, column: 27, scope: !3013)
!3019 = !DILocation(line: 833, column: 41, scope: !3013)
!3020 = !DILocation(line: 833, column: 15, scope: !3013)
!3021 = !DILocation(line: 834, column: 19, scope: !3013)
!3022 = !DILocation(line: 834, column: 26, scope: !3013)
!3023 = !DILocation(line: 834, column: 12, scope: !3013)
!3024 = !DILocation(line: 834, column: 10, scope: !3013)
!3025 = !DILocation(line: 836, column: 8, scope: !3026)
!3026 = distinct !DILexicalBlock(scope: !3013, file: !24, line: 836, column: 8)
!3027 = !DILocation(line: 836, column: 19, scope: !3026)
!3028 = !DILocation(line: 837, column: 16, scope: !3026)
!3029 = !DILocation(line: 837, column: 5, scope: !3026)
!3030 = !DILocation(line: 839, column: 28, scope: !3013)
!3031 = !DILocation(line: 839, column: 39, scope: !3013)
!3032 = !DILocation(line: 839, column: 26, scope: !3013)
!3033 = !DILocation(line: 839, column: 15, scope: !3013)
!3034 = !DILocation(line: 840, column: 19, scope: !3013)
!3035 = !DILocation(line: 840, column: 26, scope: !3013)
!3036 = !DILocation(line: 840, column: 12, scope: !3013)
!3037 = !DILocation(line: 840, column: 10, scope: !3013)
!3038 = !DILocation(line: 842, column: 8, scope: !3039)
!3039 = distinct !DILexicalBlock(scope: !3013, file: !24, line: 842, column: 8)
!3040 = !DILocalVariable(name: "beam_scale", scope: !3041, file: !24, line: 844, type: !14)
!3041 = distinct !DILexicalBlock(scope: !3039, file: !24, line: 843, column: 4)
!3042 = !DILocation(line: 844, column: 9, scope: !3041)
!3043 = !DILocation(line: 846, column: 9, scope: !3044)
!3044 = distinct !DILexicalBlock(scope: !3041, file: !24, line: 846, column: 9)
!3045 = !DILocation(line: 846, column: 20, scope: !3044)
!3046 = !DILocation(line: 846, column: 35, scope: !3044)
!3047 = !DILocation(line: 846, column: 38, scope: !3044)
!3048 = !DILocation(line: 846, column: 45, scope: !3044)
!3049 = !DILocation(line: 846, column: 49, scope: !3044)
!3050 = !DILocation(line: 846, column: 47, scope: !3044)
!3051 = !DILocation(line: 848, column: 26, scope: !3052)
!3052 = distinct !DILexicalBlock(scope: !3044, file: !24, line: 847, column: 5)
!3053 = !DILocation(line: 848, column: 33, scope: !3052)
!3054 = !DILocation(line: 848, column: 36, scope: !3052)
!3055 = !DILocation(line: 848, column: 19, scope: !3052)
!3056 = !DILocation(line: 848, column: 17, scope: !3052)
!3057 = !DILocation(line: 849, column: 26, scope: !3052)
!3058 = !DILocation(line: 849, column: 38, scope: !3052)
!3059 = !DILocation(line: 849, column: 19, scope: !3052)
!3060 = !DILocation(line: 849, column: 17, scope: !3052)
!3061 = !DILocation(line: 850, column: 21, scope: !3052)
!3062 = !DILocation(line: 850, column: 28, scope: !3052)
!3063 = !DILocation(line: 850, column: 14, scope: !3052)
!3064 = !DILocation(line: 850, column: 12, scope: !3052)
!3065 = !DILocation(line: 851, column: 5, scope: !3052)
!3066 = !DILocation(line: 852, column: 4, scope: !3041)
!3067 = !DILocation(line: 854, column: 2, scope: !3002)
!3068 = !DILocation(line: 856, column: 9, scope: !2958)
!3069 = !DILocation(line: 856, column: 2, scope: !2958)
!3070 = distinct !DISubprogram(name: "max<int, std::__1::__less<void, void> >", linkageName: "_ZNSt3__13maxB8ne200100IiNS_6__lessIvvEEEERKT_S5_S5_T0_", scope: !239, file: !2324, line: 29, type: !3071, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, templateParams: !3078, retainedNodes: !1491)
!3071 = !DISubroutineType(types: !3072)
!3072 = !{!2327, !2327, !2327, !3073}
!3073 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__less<void, void>", scope: !239, file: !3074, line: 38, size: 8, flags: DIFlagTypePassByValue, elements: !1491, templateParams: !3075, identifier: "_ZTSNSt3__16__lessIvvEE")
!3074 = !DIFile(filename: "/opt/homebrew/Cellar/llvm@20/20.1.8/bin/../include/c++/v1/__algorithm/comp.h", directory: "")
!3075 = !{!3076, !3077}
!3076 = !DITemplateTypeParameter(name: "_T1", type: null, defaulted: true)
!3077 = !DITemplateTypeParameter(name: "_T2", type: null, defaulted: true)
!3078 = !{!2329, !3079}
!3079 = !DITemplateTypeParameter(name: "_Compare", type: !3073)
!3080 = !DILocalVariable(name: "__a", arg: 1, scope: !3070, file: !2324, line: 29, type: !2327)
!3081 = !DILocation(line: 29, column: 38, scope: !3070)
!3082 = !DILocalVariable(name: "__b", arg: 2, scope: !3070, file: !2324, line: 29, type: !2327)
!3083 = !DILocation(line: 29, column: 76, scope: !3070)
!3084 = !DILocalVariable(name: "__comp", arg: 3, scope: !3070, file: !2324, line: 29, type: !3073)
!3085 = !DILocation(line: 29, column: 90, scope: !3070)
!3086 = !DILocation(line: 30, column: 17, scope: !3070)
!3087 = !DILocation(line: 30, column: 22, scope: !3070)
!3088 = !DILocation(line: 30, column: 10, scope: !3070)
!3089 = !DILocation(line: 30, column: 29, scope: !3070)
!3090 = !DILocation(line: 30, column: 35, scope: !3070)
!3091 = !DILocation(line: 30, column: 3, scope: !3070)
!3092 = distinct !DISubprogram(name: "operator()<int, int>", linkageName: "_ZNKSt3__16__lessIvvEclB8ne200100IiiEEbRKT_RKT0_", scope: !3073, file: !3074, line: 40, type: !3093, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, templateParams: !3098, declaration: !3097, retainedNodes: !1491)
!3093 = !DISubroutineType(types: !3094)
!3094 = !{!795, !3095, !2327, !2327}
!3095 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3096, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!3096 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !3073)
!3097 = !DISubprogram(name: "operator()<int, int>", linkageName: "_ZNKSt3__16__lessIvvEclB8ne200100IiiEEbRKT_RKT0_", scope: !3073, file: !3074, line: 40, type: !3093, scopeLine: 40, flags: DIFlagPrototyped, spFlags: 0, templateParams: !3098)
!3098 = !{!2329, !3099}
!3099 = !DITemplateTypeParameter(name: "_Up", type: !7)
!3100 = !DILocalVariable(name: "this", arg: 1, scope: !3092, type: !3101, flags: DIFlagArtificial | DIFlagObjectPointer)
!3101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3096, size: 64)
!3102 = !DILocation(line: 0, scope: !3092)
!3103 = !DILocalVariable(name: "__lhs", arg: 2, scope: !3092, file: !3074, line: 40, type: !2327)
!3104 = !DILocation(line: 40, column: 82, scope: !3092)
!3105 = !DILocalVariable(name: "__rhs", arg: 3, scope: !3092, file: !3074, line: 40, type: !2327)
!3106 = !DILocation(line: 40, column: 100, scope: !3092)
!3107 = !DILocation(line: 41, column: 12, scope: !3092)
!3108 = !DILocation(line: 41, column: 20, scope: !3092)
!3109 = !DILocation(line: 41, column: 18, scope: !3092)
!3110 = !DILocation(line: 41, column: 5, scope: !3092)
!3111 = distinct !DISubprogram(name: "min<int, std::__1::__less<void, void> >", linkageName: "_ZNSt3__13minB8ne200100IiNS_6__lessIvvEEEERKT_S5_S5_T0_", scope: !239, file: !2339, line: 29, type: !3071, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, templateParams: !3078, retainedNodes: !1491)
!3112 = !DILocalVariable(name: "__a", arg: 1, scope: !3111, file: !2339, line: 29, type: !2327)
!3113 = !DILocation(line: 29, column: 38, scope: !3111)
!3114 = !DILocalVariable(name: "__b", arg: 2, scope: !3111, file: !2339, line: 29, type: !2327)
!3115 = !DILocation(line: 29, column: 76, scope: !3111)
!3116 = !DILocalVariable(name: "__comp", arg: 3, scope: !3111, file: !2339, line: 29, type: !3073)
!3117 = !DILocation(line: 29, column: 90, scope: !3111)
!3118 = !DILocation(line: 30, column: 17, scope: !3111)
!3119 = !DILocation(line: 30, column: 22, scope: !3111)
!3120 = !DILocation(line: 30, column: 10, scope: !3111)
!3121 = !DILocation(line: 30, column: 29, scope: !3111)
!3122 = !DILocation(line: 30, column: 35, scope: !3111)
!3123 = !DILocation(line: 30, column: 3, scope: !3111)
